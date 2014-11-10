require 'spec_helper'

describe 'devpuppet' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "devpuppet class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('devpuppet::params') }
        it { should contain_class('devpuppet::install').that_comes_before('devpuppet::config') }
        it { should contain_class('devpuppet::config') }
        it { should contain_class('devpuppet::service').that_subscribes_to('devpuppet::config') }

        it { should contain_service('devpuppet') }
        it { should contain_package('devpuppet').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'devpuppet class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('devpuppet') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
