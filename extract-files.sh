#!/bin/sh
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
DEVICE=arima89_we_s_jb2
MANUFACTURER=sony
PROP_DIR=../../../vendor/$MANUFACTURER/$DEVICE/proprietary/app/
PROP_BIN_DIR=../../../vendor/$MANUFACTURER/$DEVICE/proprietary/bin/
PROP_LIB_DIR=../../../vendor/$MANUFACTURER/$DEVICE/proprietary/lib/
PROP_ETC_DIR=../../../vendor/$MANUFACTURER/$DEVICE/proprietary/etc/
# Fetch (mediatek) apks
# apks start

mkdir -p $PROP_DIR
adb pull /system/app/MTKAndroidSuiteDaemon.apk $PROP_DIR
adb pull /system/app/MtkBt.apk $PROP_DIR
adb pull /system/app/MTKThermalManager.apk $PROP_DIR
adb pull /system/app/AtciService.apk $PROP_DIR
adb pull /system/app/BatteryWarning.apk  $PROP_DIR
adb pull /system/app/CellConnService.apk  $PROP_DIR
adb pull /system/app/CDS_INFO.apk $PROP_DIR
adb pull /system/app/DataUsageLockScreenClient.apk  $PROP_DIR
adb pull /system/app/EngineerMode.apk  $PROP_DIR
adb pull /system/app/EngineerModeSim.apk  $PROP_DIR
adb pull /system/app/Radio.apk  $PROP_DIR
adb pull /system/app/OMAClientProvisioning.apk  $PROP_DIR
adb pull /system/app/Omacp.apk  $PROP_DIR
adb pull /system/app/OmaDownload.apk  $PROP_DIR
adb pull /system/app/OmaV1AgentDownloadServices.apk  $PROP_DIR
adb pull /system/app/VoiceCommand.apk  $PROP_DIR
adb pull /system/app/VoiceUnlock.apk  $PROP_DIR
adb pull /system/app/YGPS.apk  $PROP_DIR
adb pull /system/app/LocationEM.apk $PROP_DIR
adb pull /system/app/dm.apk $PROP_DIR

#Not sure if these files are necessary for Cynogenmod
adb pull /system/app/DrmDialogs.apk $PROP_DIR 
adb pull /system/app/DrmProvider.apk $PROP_DIR


#apks end


#framework files start

adb pull /system/framework/mediatek-common.jar $PROP_DIR
adb pull /system/framework/mediatek-framework.jar $PROP_DIR
adb pull /system/framework/mediatek-op.jar $PROP_DIR
adb pull /system/framework/mediatek-res.apk $PROP_DIR
adb pull /system/framework/theme-res-mint.apk $PROP_DIR
adb pull /system/framework/theme-res-mocha.apk $PROP_DIR
adb pull /system/framework/theme-res-raspberry.apk $PROP_DIR

#framework end



#binaries start

mkdir -p $PROP_BIN_DIR
adb pull /system/vendor/bin/pvrsrvctl $PROP_BIN_DIR
adb pull /system/vendor/bin/rc.fac $PROP_BIN_DIR


adb pull /system/bin/install-recovery.sh  $PROP_BIN_DIR
adb pull /system/bin/6620_launcher $PROP_BIN_DIR
adb pull /system/bin/6620_wmt_concurrency $PROP_BIN_DIR
adb pull /system/bin/akmd8963 $PROP_BIN_DIR
adb pull /system/bin/akmd8975 $PROP_BIN_DIR
adb pull /system/bin/atcid $PROP_BIN_DIR
adb pull /system/bin/atci_service $PROP_BIN_DIR
adb pull /system/bin/btconfig $PROP_BIN_DIR
adb pull /system/bin/btlogmask $PROP_BIN_DIR
adb pull /system/bin/drmserver $PROP_BIN_DIR
adb pull /system/bin/gsm0710muxd $PROP_BIN_DIR
adb pull /system/bin/gsm0710muxdmd2 $PROP_BIN_DIR
adb pull /system/bin/memsicd $PROP_BIN_DIR
adb pull /system/bin/memsicd3416x $PROP_BIN_DIR
adb pull /system/bin/msensord $PROP_BIN_DIR
adb pull /system/bin/mtk_agpsd $PROP_BIN_DIR
adb pull /system/bin/mtkbt $PROP_BIN_DIR
adb pull /system/bin/mtkGD $PROP_BIN_DIR
adb pull /system/bin/nvram_agent_binder $PROP_BIN_DIR
adb pull /system/bin/nvram_daemon $PROP_BIN_DIR
adb pull /system/bin/sensorservice $PROP_BIN_DIR
adb pull /system/bin/service $PROP_BIN_DIR
adb pull /system/bin/servicemanager $PROP_BIN_DIR
adb pull /system/bin/ta_reader $PROP_BIN_DIR
adb pull /system/bin/ta_sync_md $PROP_BIN_DIR
adb pull /system/bin/tc $PROP_BIN_DIR
adb pull /system/bin/thermal $PROP_BIN_DIR
adb pull /system/bin/thermal_manager $PROP_BIN_DIR
adb pull /system/bin/updatemiscta $PROP_BIN_DIR
adb pull /system/bin/wlan_loader $PROP_BIN_DIR



adb pull /system/xbin/daemonsu
adb pull /system/xbin/dexdump
adb pull /system/xbin/gtestmiscta
adb pull /system/xbin/gtestta
adb pull /system/xbin/libmnlp_mt6628
adb pull /system/xbin/misctatest
adb pull /system/xbin/mnld
adb pull /system/xbin/su
adb pull /system/xbin/tatest


# Change permissions of binaries recursively 
chmod -Rv 755 $PROP_BIN_DIR

#binaries end


#mtk 6628 wifi, bluetooth, GPS, FM radio firmware files


mkdir -p $PROP_ETC_DIR

adb pull /system/etc/firmware/mt6628/mt6628_fm_rom.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628/mt6628_fm_v1_coeff.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628/mt6628_fm_v1_patch.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628/mt6628_fm_v2_coeff.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628/mt6628_fm_v2_patch.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628/mt6628_fm_v3_coeff.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628/mt6628_fm_v3_patch.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628/mt6628_fm_v4_coeff.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628/mt6628_fm_v4_patch.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628/mt6628_fm_v5_coeff.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628/mt6628_fm_v5_patch.bin $PROP_ETC_DIR

adb pull /system/etc/firmware/catcher_filter.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/modem.img $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628_ant_m1.cfg $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628_patch_e1_hdr.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628_patch_e2_0_hdr.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628_patch_e2_1_hdr.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/S_ANDRO_SFL.ini $PROP_ETC_DIR
adb pull /system/etc/firmware/WIFI_RAM_CODE $PROP_ETC_DIR
adb pull /system/etc/firmware/WIFI_RAM_CODE_E6 $PROP_ETC_DIR
adb pull /system/etc/firmware/WIFI_RAM_CODE_MT6628 $PROP_ETC_DIR
adb pull /system/etc/firmware/WMT.cfg $PROP_ETC_DIR

adb pull /system/lib/modules/sec.ko $PROP_ETC_DIR
adb pull /system/lib/modules/ccci.ko $PROP_ETC_DIR
adb pull /system/lib/modules/ccci_plat.ko $PROP_ETC_DIR
adb pull /system/etc/security/otacerts.zip $PROP_ETC_DIR


adb pull /system/etc/firmware/catcher_filter.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/modem.img $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628_ant_m1.cfg $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628_patch_e1_hdr.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628_patch_e2_0_hdr.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/mt6628_patch_e2_1_hdr.bin $PROP_ETC_DIR
adb pull /system/etc/firmware/S_ANDRO_SFL.ini $PROP_ETC_DIR
adb pull /system/etc/firmware/WIFI_RAM_CODE $PROP_ETC_DIR
adb pull /system/etc/firmware/WIFI_RAM_CODE_E6 $PROP_ETC_DIR
adb pull /system/etc/firmware/WIFI_RAM_CODE_MT6628 $PROP_ETC_DIR
adb pull /system/etc/firmware/WMT.cfg $PROP_ETC_DIR

adb pull /system/etc/fmr/fm_cust.cfg $PROP_ETC_DIR #FM RADIO CONFIG FILE

adb pull /system/etc/agps_profiles_conf.xml $PROP_ETC_DIR 
adb pull /system/etc/custom.conf $PROP_ETC_DIR
adb pull /system/etc/dbus.conf $PROP_ETC_DIR
adb pull /system/etc/default-capability.xml $PROP_ETC_DIR
adb pull /system/etc/disableapplist.txt $PROP_ETC_DIR
adb pull /system/etc/dop.iso $PROP_ETC_DIR
adb pull /system/etc/drm_chmod $PROP_ETC_DIR
adb pull /system/etc/epo_conf.xml $PROP_ETC_DIR
adb pull /system/etc/factory.ini $PROP_ETC_DIR
adb pull /system/etc/geocoding.db $PROP_ETC_DIR
adb pull /system/etc/iddd.conf $PROP_ETC_DIR
adb pull /system/etc/init.goldfish.sh $PROP_ETC_DIR
adb pull /system/etc/install-recovery.sh $PROP_ETC_DIR
adb pull /system/etc/mtklog-config.prop $PROP_ETC_DIR
adb pull /system/etc/mtk_omx_core.cfg $PROP_ETC_DIR
adb pull /system/etc/player.cfg $PROP_ETC_DIR
adb pull /system/etc/recovery-resource.dat $PROP_ETC_DIR
adb pull /system/etc/resmonwhitelist.txt $PROP_ETC_DIR
adb pull /system/etc/spn-conf.xml $PROP_ETC_DIR
adb pull /system/etc/throttle.sh $PROP_ETC_DIR
adb pull /system/etc/virtual-spn-conf-by-efpnn.xml $PROP_ETC_DIR
adb pull /system/etc/virtual-spn-conf-by-efspn.xml $PROP_ETC_DIR
adb pull /system/etc/virtual-spn-conf-by-imsi.xml $PROP_ETC_DIR
adb pull /system/etc/vold.fstab $PROP_ETC_DIR
adb pull /system/etc/vold.fstab.nand $PROP_ETC_DIR
adb pull /system/etc/xlog-filter-default $PROP_ETC_DIR
adb pull /system/etc/xlog-filter-tags $PROP_ETC_DIR
adb pull /system/etc/.installed_su_daemon $PROP_ETC_DIR
adb pull /system/etc/bluetooth/audio.conf $PROP_ETC_DIR
adb pull /system/etc/bluetooth/auto_pairing.conf $PROP_ETC_DIR
adb pull /system/etc/bluetooth/blacklist.conf $PROP_ETC_DIR
adb pull /system/etc/bluetooth/input.conf $PROP_ETC_DIR
adb pull /system/etc/bluetooth/network.conf $PROP_ETC_DIR
adb pull /system/etc/radvd/radvd.conf $PROP_ETC_DIR
adb pull /system/etc/ril/oper.lis $PROP_ETC_DIR
adb pull /system/etc/voicecommand/keyword/1.xml $PROP_ETC_DIR
adb pull /system/etc/voicecommand/keyword/2.xml $PROP_ETC_DIR
adb pull /system/etc/voicecommand/keyword/3.xml $PROP_ETC_DIR
adb pull /system/etc/voicecommand/training/ubmfile/64.dat $PROP_ETC_DIR
adb pull /system/etc/voicecommand/training/ubmfile/128.dat $PROP_ETC_DIR
adb pull /system/etc/voicecommand/voiceui/modefile/command_3and23.dic $PROP_ETC_DIR
adb pull /system/etc/voicecommand/voiceui/modefile/command_6and23.dic $PROP_ETC_DIR
adb pull /system/etc/voicecommand/voiceui/modefile/commandfilr.dic $PROP_ETC_DIR
adb pull /system/etc/voicecommand/voiceui/modefile/commandfilr2.dic $PROP_ETC_DIR
adb pull /system/etc/voicecommand/voiceui/modefile/command_only23.dic $PROP_ETC_DIR
adb pull /system/etc/voicecommand/voiceui/modefile/GMMModel1.bin $PROP_ETC_DIR
adb pull /system/etc/voicecommand/voiceui/modefile/GMMModel2.bin $PROP_ETC_DIR
adb pull /system/etc/voicecommand/voiceui/modefile/GMMModel3.bin $PROP_ETC_DIR
adb pull /system/etc/voicecommand/voiceui/modefile/Model1.bin $PROP_ETC_DIR
adb pull /system/etc/voicecommand/voiceui/modefile/Model2.bin $PROP_ETC_DIR
adb pull /system/etc/voicecommand/voiceui/modefile/Model3.bin $PROP_ETC_DIR
adb pull /system/etc/voicecommand/voiceui/modefile/Model_M_gmmfea39d.dat $PROP_ETC_DIR
adb pull /system/etc/voicecommand/voiceui/uipattern/Chinese-Mandarin/cmd_pattern $PROP_ETC_DIR
adb pull /system/etc/voicecommand/voiceui/uipattern/Chinese-Taiwan/cmd_pattern $PROP_ETC_DIR
adb pull /system/etc/voicecommand/voiceui/uipattern/English/cmd_pattern $PROP_ETC_DIR
adb pull /system/etc/wide-dhcpv6/dhcp6c.conf $PROP_ETC_DIR
adb pull /system/etc/wide-dhcpv6/dhcp6c.script $PROP_ETC_DIR
adb pull /system/etc/wide-dhcpv6/dhcp6cctlkey $PROP_ETC_DIR
adb pull /system/etc/wide-dhcpv6/dhcp6cDNS.conf $PROP_ETC_DIR
adb pull /system/etc/wide-dhcpv6/dhcp6s.conf $PROP_ETC_DIR
adb pull /system/etc/wifi/p2p_supplicant.conf $PROP_ETC_DIR
adb pull /system/etc/wifi/wpa_supplicant.conf $PROP_ETC_DIR
adb pull /system/etc/.tp/thermal.conf $PROP_ETC_DIR
adb pull /system/etc/.tp/thermal.off.conf $PROP_ETC_DIR
adb pull /system/etc/.tp/.ht120.mtc $PROP_ETC_DIR


#mtk 6628 files end


#libs start
mkdir -p $PROP_LIB_DIR

adb pull /system/lib/libbessound_mtk.so $PROP_LIB_DIR
adb pull /system/lib/libbluetoothem_mtk.so $PROP_LIB_DIR
adb pull /system/lib/libbluetooth_mtk.so $PROP_LIB_DIR
adb pull /system/lib/libc_malloc_debug_mtk.so $PROP_LIB_DIR
adb pull /system/lib/drm/libdrmmtkplugin.so $PROP_LIB_DIR
adb pull /system/lib/libdrmmtkutil.so $PROP_LIB_DIR
adb pull /system/lib/libdrmmtkwhitelist.so $PROP_LIB_DIR
adb pull /system/lib/libmtka2dp.so $PROP_LIB_DIR
adb pull /system/lib/libmtkbtextadp.so $PROP_LIB_DIR
adb pull /system/lib/libmtkbtextadpa2dp.so $PROP_LIB_DIR
adb pull /system/lib/libmtkbtextpan.so $PROP_LIB_DIR
adb pull /system/lib/libmtkbtextspp.so $PROP_LIB_DIR
adb pull /system/lib/libmtk_drvb.so $PROP_LIB_DIR
adb pull /system/lib/libmtkhdmi_jni.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxAacDec.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxAacEnc.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxAdpcmDec.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxAdpcmEnc.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxAmrEnc.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxAMRNBDec.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxAMRWBDec.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxApeDec.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxAwbEnc.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxCore.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxFlacDec.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxG711Dec.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxMp3Dec.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxVdec.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxVenc.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxVorbisDec.so $PROP_LIB_DIR
adb pull /system/lib/libMtkOmxVorbisEnc.so $PROP_LIB_DIR
adb pull /system/lib/libmtkplayer.so $PROP_LIB_DIR
adb pull /system/lib/libMtkVideoTranscoder.so $PROP_LIB_DIR
adb pull /system/lib/libmtk_vt_client.so $PROP_LIB_DIR
adb pull /system/lib/libmtk_vt_em.so $PROP_LIB_DIR
adb pull /system/lib/libmtk_vt_service.so $PROP_LIB_DIR
adb pull /system/lib/libmtk_vt_swip.so $PROP_LIB_DIR
adb pull /system/lib/libmtk_vt_utils.so $PROP_LIB_DIR
adb pull /system/lib/libpalwlan_mtk.so $PROP_LIB_DIR
adb pull /system/lib/librilmtk.so $PROP_LIB_DIR
adb pull /system/lib/librilmtkmd2.so $PROP_LIB_DIR
adb pull /system/lib/libutilrilmtk.so $PROP_LIB_DIR
adb pull /system/lib/mtk-ril.so $PROP_LIB_DIR
adb pull /system/lib/mtk-rilmd2.so $PROP_LIB_DIR



adb pull /system/lib/libalmkdrv.so $PROP_LIB_DIR
adb pull /system/lib/libatciserv_jni.so $PROP_LIB_DIR
adb pull /system/lib/libbluetoothdrv.so $PROP_LIB_DIR
adb pull /system/lib/libbluetooth_relayer.so $PROP_LIB_DIR
adb pull /system/lib/libbtcust.so $PROP_LIB_DIR
adb pull /system/lib/libbtcusttable.so $PROP_LIB_DIR
adb pull /system/lib/libbtpcm.so $PROP_LIB_DIR
adb pull /system/lib/libbtsniff.so $PROP_LIB_DIR
adb pull /system/lib/libcam.camadapter.so $PROP_LIB_DIR
adb pull /system/lib/libcam.campipe.so $PROP_LIB_DIR
adb pull /system/lib/libcam.camshot.so $PROP_LIB_DIR
adb pull /system/lib/libcam.client.so $PROP_LIB_DIR
adb pull /system/lib/libcam.paramsmgr.so $PROP_LIB_DIR
adb pull /system/lib/libcam.utils.so $PROP_LIB_DIR
adb pull /system/lib/libcamalgo.so $PROP_LIB_DIR
adb pull /system/lib/libcam_camera_exif.so $PROP_LIB_DIR
adb pull /system/lib/libcamdrv.so $PROP_LIB_DIR
adb pull /system/lib/libcamera_client.so $PROP_LIB_DIR
adb pull /system/lib/libcameracustom.so $PROP_LIB_DIR
adb pull /system/lib/libcamera_metadata.so $PROP_LIB_DIR
adb pull /system/lib/libcameraservice.so $PROP_LIB_DIR
adb pull /system/lib/libdrm1.so $PROP_LIB_DIR
adb pull /system/lib/libdrm1_jni.so $PROP_LIB_DIR
adb pull /system/lib/libdrmdecrypt.so $PROP_LIB_DIR
adb pull /system/lib/libdrmframework.so $PROP_LIB_DIR
adb pull /system/lib/libdrmframework_jni.so $PROP_LIB_DIR
adb pull /system/lib/libEGL.so $PROP_LIB_DIR
adb pull /system/lib/libem_bt_jni.so $PROP_LIB_DIR
adb pull /system/lib/libem_gpio_jni.so $PROP_LIB_DIR
adb pull /system/lib/libem_modem_jni.so $PROP_LIB_DIR
adb pull /system/lib/libem_support_jni.so $PROP_LIB_DIR
adb pull /system/lib/libem_usb_jni.so $PROP_LIB_DIR
adb pull /system/lib/libem_wifi_jni.so $PROP_LIB_DIR
adb pull /system/lib/libETC1.so $PROP_LIB_DIR
adb pull /system/lib/libexif.so $PROP_LIB_DIR
adb pull /system/lib/libexif_jni.so $PROP_LIB_DIR
adb pull /system/lib/libextavrcp.so $PROP_LIB_DIR
adb pull /system/lib/libextavrcp_jni.so $PROP_LIB_DIR
adb pull /system/lib/libextbip.so $PROP_LIB_DIR
adb pull /system/lib/libextbip_jni.so $PROP_LIB_DIR
adb pull /system/lib/libextbpp.so $PROP_LIB_DIR
adb pull /system/lib/libextbpp_jni.so $PROP_LIB_DIR
adb pull /system/lib/libextdun_jni.so $PROP_LIB_DIR
adb pull /system/lib/libextftp.so $PROP_LIB_DIR
adb pull /system/lib/libextftp_jni.so $PROP_LIB_DIR
adb pull /system/lib/libexthid.so $PROP_LIB_DIR
adb pull /system/lib/libexthid_jni.so $PROP_LIB_DIR
adb pull /system/lib/libextmap_jni.so $PROP_LIB_DIR
adb pull /system/lib/libextopp.so $PROP_LIB_DIR
adb pull /system/lib/libextopp_jni.so $PROP_LIB_DIR
adb pull /system/lib/libextpan_jni.so $PROP_LIB_DIR
adb pull /system/lib/libextpbap.so $PROP_LIB_DIR
adb pull /system/lib/libextpbap_jni.so $PROP_LIB_DIR
adb pull /system/lib/libextsimap.so $PROP_LIB_DIR
adb pull /system/lib/libextsimap_jni.so $PROP_LIB_DIR
adb pull /system/lib/libextsys.so $PROP_LIB_DIR
adb pull /system/lib/libextsys_jni.so $PROP_LIB_DIR
adb pull /system/lib/libexttestmode.so $PROP_LIB_DIR
adb pull /system/lib/libface.so $PROP_LIB_DIR
adb pull /system/lib/libfacelock_jni.so $PROP_LIB_DIR
adb pull /system/lib/libfeatureio.so $PROP_LIB_DIR
adb pull /system/lib/libFFTEm.so $PROP_LIB_DIR
adb pull /system/lib/libfile_op.so $PROP_LIB_DIR
adb pull /system/lib/libfilterfw.so $PROP_LIB_DIR
adb pull /system/lib/libfilterpack_facedetect.so $PROP_LIB_DIR
adb pull /system/lib/libfilterpack_imageproc.so $PROP_LIB_DIR
adb pull /system/lib/libflv.so $PROP_LIB_DIR
adb pull /system/lib/libflvextractor.so $PROP_LIB_DIR
adb pull /system/lib/libfmmt6616.so $PROP_LIB_DIR
adb pull /system/lib/libfmmt6620.so $PROP_LIB_DIR
adb pull /system/lib/libfmmt6626.so $PROP_LIB_DIR
adb pull /system/lib/libfmmt6628.so $PROP_LIB_DIR
adb pull /system/lib/libfrsdk.so $PROP_LIB_DIR
adb pull /system/lib/libgabi++.so $PROP_LIB_DIR
adb pull /system/lib/libgames_rtmp_jni.so $PROP_LIB_DIR
adb pull /system/lib/libgccdemangle.so $PROP_LIB_DIR
adb pull /system/lib/libGdmaScalerPipe.so $PROP_LIB_DIR
adb pull /system/lib/libGLES_trace.so $PROP_LIB_DIR
adb pull /system/lib/libGLESv1_CM.so $PROP_LIB_DIR
adb pull /system/lib/libGLESv2.so $PROP_LIB_DIR
adb pull /system/lib/libI420colorconvert.so $PROP_LIB_DIR
adb pull /system/lib/libicui18n.so $PROP_LIB_DIR
adb pull /system/lib/libJniAtvService.so $PROP_LIB_DIR
adb pull /system/lib/libjnigraphics.so $PROP_LIB_DIR
adb pull /system/lib/libjni_pq.so $PROP_LIB_DIR
adb pull /system/lib/libOpenMAXAL.so $PROP_LIB_DIR
adb pull /system/lib/libOpenSLES.so $PROP_LIB_DIR
adb pull /system/lib/libportable.so $PROP_LIB_DIR
adb pull /system/lib/libpower.so $PROP_LIB_DIR
adb pull /system/lib/libpowermanager.so $PROP_LIB_DIR
adb pull /system/lib/libpppbtdun.so $PROP_LIB_DIR
adb pull /system/lib/libprotobuf-c.so $PROP_LIB_DIR
adb pull /system/lib/libril.so $PROP_LIB_DIR
adb pull /system/lib/libsensorservice.so $PROP_LIB_DIR
adb pull /system/lib/libsoundpool.so $PROP_LIB_DIR
adb pull /system/lib/libwebcore.so $PROP_LIB_DIR
adb pull /system/lib/libwebp_android.so $PROP_LIB_DIR
adb pull /system/lib/libwebrtc_audio_preprocessing.so $PROP_LIB_DIR
adb pull /system/lib/libwifitest.so $PROP_LIB_DIR
adb pull /system/lib/libwilhelm.so $PROP_LIB_DIR
adb pull /system/lib/libwpa_client.so $PROP_LIB_DIR
adb pull /system/lib/libWVphoneAPI.so $PROP_LIB_DIR
adb pull /system/lib/libXT9Engine.so $PROP_LIB_DIR



adb pull /system/lib/modules/ccci.ko $PROP_LIB_DIR
adb pull /system/lib/modules/ccci_plat.ko $PROP_LIB_DIR
adb pull /system/lib/modules/devapc.ko $PROP_LIB_DIR
adb pull /system/lib/modules/devinfo.ko $PROP_LIB_DIR
adb pull /system/lib/modules/modules.dep.bb $PROP_LIB_DIR
adb pull /system/lib/modules/mtk_fm_drv.ko $PROP_LIB_DIR
adb pull /system/lib/modules/mtk_hif_sdio.ko $PROP_LIB_DIR
adb pull /system/lib/modules/mtklfb.ko $PROP_LIB_DIR
adb pull /system/lib/modules/mtk_stp_bt.ko $PROP_LIB_DIR
adb pull /system/lib/modules/mtk_stp_gps.ko $PROP_LIB_DIR
adb pull /system/lib/modules/mtk_stp_uart.ko $PROP_LIB_DIR
adb pull /system/lib/modules/mtk_stp_wmt.ko $PROP_LIB_DIR
adb pull /system/lib/modules/mtk_wmt_wifi.ko $PROP_LIB_DIR
adb pull /system/lib/modules/pvrsrvkm.ko $PROP_LIB_DIR
adb pull /system/lib/modules/scsi_tgt.ko $PROP_LIB_DIR
adb pull /system/lib/modules/scsi_wait_scan.ko $PROP_LIB_DIR
adb pull /system/lib/modules/sec.ko $PROP_LIB_DIR
adb pull /system/lib/modules/vcodec_kernel_driver.ko $PROP_LIB_DIR
adb pull /system/lib/modules/wlan.ko $PROP_LIB_DIR
adb pull /system/lib/modules/wlan_mt6628.ko $PROP_LIB_DIR



#sound libs
adb pull /system/vendor/etc/audio_effects.conf $PROP_LIB_DIR #sound config file
adb pull /system/lib/soundfx/libbundlewrapper.so $PROP_LIB_DIR
adb pull /system/lib/soundfx/libreverbwrapper.so $PROP_LIB_DIR
adb pull /system/lib/soundfx/libvisualizer.so $PROP_LIB_DIR
adb pull /system/lib/soundfx/libaudiopreprocessing.so $PROP_LIB_DIR
adb pull /system/lib/soundfx/libdownmix.so $PROP_LIB_DIR
adb pull /system/lib/soundfx/libsoundaurawrapper.so $PROP_LIB_DIR
adb pull /system/lib/soundfx/libpreeffectwrapper.so $PROP_LIB_DIR
adb pull /system/lib/soundfx/libposteffectwrapper.so $PROP_LIB_DIR


#vendor libs start
adb pull /system/vendor/lib/libBLPP.so  $PROP_LIB_DIR
adb pull /system/vendor/lib/libglslcompiler.so $PROP_LIB_DIR
adb pull /system/vendor/lib/libIMGegl.so $PROP_LIB_DIR
adb pull /system/vendor/lib/libpvr2d.so $PROP_LIB_DIR
adb pull /system/vendor/lib/libpvrANDROID_WSEGL.so $PROP_LIB_DIR
adb pull /system/vendor/lib/libPVRScopeServices.so $PROP_LIB_DIR
adb pull /system/vendor/lib/libsrv_init.so $PROP_LIB_DIR
adb pull /system/vendor/lib/libsrv_um.so $PROP_LIB_DIR
adb pull /system/vendor/lib/libusc.so $PROP_LIB_DIR
adb pull /system/vendor/lib/libwvdrm_L3.so $PROP_LIB_DIR
adb pull /system/vendor/lib/libwvm.so $PROP_LIB_DIR
adb pull /system/vendor/lib/libWVStreamControlAPI_L3.so $PROP_LIB_DIR

adb pull /system/vendor/lib/drm/libdrmwvmplugin.so $PROP_LIB_DIR
adb pull /system/vendor/lib/egl/libEGL_mtk.so $PROP_LIB_DIR
adb pull /system/vendor/lib/egl/libGLESv1_CM_mtk.so $PROP_LIB_DIR
adb pull /system/vendor/lib/egl/libGLESv2_mtk.so $PROP_LIB_DIR
adb pull /system/vendor/lib/hw/gralloc.mt6589.so $PROP_LIB_DIR
#vendor libs end



#libs end


##make file for vendor blobs
(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g > ../../../vendor/$MANUFACTURER/$DEVICE/$DEVICE-vendor.mk
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# This file is generated by device/__MANUFACTURER__/__DEVICE__/extract-files.sh - DO NOT EDIT
# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES := \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxG711Dec.so:system/lib/libMtkOmxG711Dec.so
# All the blobs necessary for arima89_we_s_jb2
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/MTKAndroidSuiteDaemon.apk:system/app/MTKAndroidSuiteDaemon.apk \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/MtkBt.apk:system/app/MtkBt.apk \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/MTKThermalManager.apk:system/app/MTKThermalManager.apk \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/AtciService.apk:system/app/AtciService.apk \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/BatteryWarning.apk:system/app/BatteryWarning.apk  \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/CellConnService.apk:system/app/CellConnService.apk  \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/CDS_INFO.apk:system/app/CDS_INFO.apk \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/DataUsageLockScreenClient.apk:system/app/DataUsageLockScreenClient.apk  \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/EngineerMode.apk:system/app/EngineerMode.apk  \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/EngineerModeSim.apk:system/app/EngineerModeSim.apk  \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/Radio.apk:system/app/Radio.apk  \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/OMAClientProvisioning.apk:system/app/OMAClientProvisioning.apk  \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/Omacp.apk:system/app/Omacp.apk  \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/OmaDownload.apk:system/app/OmaDownload.apk  \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/OmaV1AgentDownloadServices.apk:system/app/OmaV1AgentDownloadServices.apk  \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/VoiceCommand.apk:system/app/VoiceCommand.apk  \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/VoiceUnlock.apk:system/app/VoiceUnlock.apk  \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/YGPS.apk:system/app/YGPS.apk  \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/LocationEM.apk:system/app/LocationEM.apk \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/dm.apk:system/app/dm.apk \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/DrmDialogs.apk:system/app/DrmDialogs.apk \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/DrmProvider.apk:system/app/DrmProvider.apk \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/mediatek-common.jar:system/framework/mediatek-common.jar \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/mediatek-framework.jar:system/framework/mediatek-framework.jar \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/mediatek-op.jar:system/framework/mediatek-op.jar \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/mediatek-res.apk:system/framework/mediatek-res.apk \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/theme-res-mint.apk:system/framework/theme-res-mint.apk \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/theme-res-mocha.apk:system/framework/theme-res-mocha.apk \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/app/theme-res-raspberry.apk:system/framework/theme-res-raspberry.apk \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/pvrsrvctl:system/vendor/bin/pvrsrvctl \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/rc.fac:system/vendor/bin/rc.fac \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/6620_launcher:system/bin/6620_launcher \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/6620_wmt_concurrency:system/bin/6620_wmt_concurrency \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/akmd8963:system/bin/akmd8963 \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/akmd8975:system/bin/akmd8975 \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/atcid:system/bin/atcid \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/install-recovery.sh:system/bin/install-recovery.sh \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/atci_service:system/bin/atci_service \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/btconfig:system/bin/btconfig \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/btlogmask:system/bin/btlogmask \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/drmserver:system/bin/drmserver \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/gsm0710muxd:system/bin/gsm0710muxd \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/gsm0710muxdmd2:system/bin/gsm0710muxdmd2 \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/memsicd:system/bin/memsicd \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/memsicd3416x:system/bin/memsicd3416x \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/msensord:system/bin/msensord \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/mtk_agpsd:system/bin/mtk_agpsd \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/mtkbt:system/bin/mtkbt \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/mtkGD:system/bin/mtkGD \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/nvram_agent_binder:system/bin/nvram_agent_binder \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/nvram_daemon:system/bin/nvram_daemon \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/sensorservice:system/bin/sensorservice \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/service:system/bin/service \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/servicemanager:system/bin/servicemanager \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/ta_reader:system/bin/ta_reader \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/ta_sync_md:system/bin/ta_sync_md \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/tc:system/bin/tc \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/thermal:system/bin/thermal \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/thermal_manager:system/bin/thermal_manager \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/updatemiscta:system/bin/updatemiscta \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/wlan_loader:system/bin/wlan_loader \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_fm_rom.bin:system/etc/firmware/mt6628/mt6628_fm_rom.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_fm_v1_coeff.bin:system/etc/firmware/mt6628/mt6628_fm_v1_coeff.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_fm_v1_patch.bin:system/etc/firmware/mt6628/mt6628_fm_v1_patch.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_fm_v2_coeff.bin:system/etc/firmware/mt6628/mt6628_fm_v2_coeff.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_fm_v2_patch.bin:system/etc/firmware/mt6628/mt6628_fm_v2_patch.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_fm_v3_coeff.bin:system/etc/firmware/mt6628/mt6628_fm_v3_coeff.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_fm_v3_patch.bin:system/etc/firmware/mt6628/mt6628_fm_v3_patch.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_fm_v4_coeff.bin:system/etc/firmware/mt6628/mt6628_fm_v4_coeff.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_fm_v4_patch.bin:system/etc/firmware/mt6628/mt6628_fm_v4_patch.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_fm_v5_coeff.bin:system/etc/firmware/mt6628/mt6628_fm_v5_coeff.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_fm_v5_patch.bin:system/etc/firmware/mt6628/mt6628_fm_v5_patch.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/catcher_filter.bin:system/etc/firmware/catcher_filter.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/modem.img:system/etc/firmware/modem.img \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_ant_m1.cfg:system/etc/firmware/mt6628_ant_m1.cfg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_patch_e1_hdr.bin:system/etc/firmware/mt6628_patch_e1_hdr.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_patch_e2_0_hdr.bin:system/etc/firmware/mt6628_patch_e2_0_hdr.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_patch_e2_1_hdr.bin:system/etc/firmware/mt6628_patch_e2_1_hdr.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/S_ANDRO_SFL.ini:system/etc/firmware/S_ANDRO_SFL.ini \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/WIFI_RAM_CODE:system/etc/firmware/WIFI_RAM_CODE \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/WIFI_RAM_CODE_E6:system/etc/firmware/WIFI_RAM_CODE_E6 \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/WIFI_RAM_CODE_MT6628:system/etc/firmware/WIFI_RAM_CODE_MT6628 \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/WMT.cfg:system/etc/firmware/WMT.cfg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/sec.ko:system/lib/modules/sec.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/ccci.ko:system/lib/modules/ccci.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/ccci_plat.ko:system/lib/modules/ccci_plat.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/otacerts.zip:system/etc/security/otacerts.zip \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/catcher_filter.bin:system/etc/firmware/catcher_filter.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/modem.img:system/etc/firmware/modem.img \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_ant_m1.cfg:system/etc/firmware/mt6628_ant_m1.cfg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_patch_e1_hdr.bin:system/etc/firmware/mt6628_patch_e1_hdr.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc//mt6628_patch_e2_0_hdr.bin:system/etc/firmware/mt6628_patch_e2_0_hdr.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/mt6628_patch_e2_1_hdr.bin:system/etc/firmware/mt6628_patch_e2_1_hdr.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/S_ANDRO_SFL.ini:system/etc/firmware/S_ANDRO_SFL.ini \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/WIFI_RAM_CODE:system/etc/firmware/WIFI_RAM_CODE \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/WIFI_RAM_CODE_E6:system/etc/firmware/WIFI_RAM_CODE_E6 \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/WIFI_RAM_CODE_MT6628:system/etc/firmware/WIFI_RAM_CODE_MT6628 \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/WMT.cfg:system/etc/firmware/WMT.cfg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/fm_cust.cfg:system/etc/fmr/fm_cust.cfg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libbessound_mtk.so:system/lib/libbessound_mtk.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libbluetoothem_mtk.so:system/lib/libbluetoothem_mtk.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libbluetooth_mtk.so:system/lib/libbluetooth_mtk.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libc_malloc_debug_mtk.so:system/lib/libc_malloc_debug_mtk.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libdrmmtkplugin.so:system/lib/drm/libdrmmtkplugin.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libdrmmtkutil.so:system/lib/libdrmmtkutil.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libdrmmtkwhitelist.so:system/lib/libdrmmtkwhitelist.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmtka2dp.so:system/lib/libmtka2dp.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmtkbtextadp.so:system/lib/libmtkbtextadp.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmtkbtextadpa2dp.so:system/lib/libmtkbtextadpa2dp.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmtkbtextpan.so:system/lib/libmtkbtextpan.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmtkbtextspp.so:system/lib/libmtkbtextspp.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmtk_drvb.so:system/lib/libmtk_drvb.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmtkhdmi_jni.so:system/lib/libmtkhdmi_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxAacDec.so:system/lib/libMtkOmxAacDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxAacEnc.so:system/lib/libMtkOmxAacEnc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxAdpcmDec.so:system/lib/libMtkOmxAdpcmDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxAdpcmEnc.so:system/lib/libMtkOmxAdpcmEnc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxAmrEnc.so:system/lib/libMtkOmxAmrEnc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxAMRNBDec.so:system/lib/libMtkOmxAMRNBDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxAMRWBDec.so:system/lib/libMtkOmxAMRWBDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxApeDec.so:system/lib/libMtkOmxApeDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxAwbEnc.so:system/lib/libMtkOmxAwbEnc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxCore.so:system/lib/libMtkOmxCore.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxFlacDec.so:system/lib/libMtkOmxFlacDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxG711Dec.so:system/lib/libMtkOmxG711Dec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxMp3Dec.so:system/lib/libMtkOmxMp3Dec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxVdec.so:system/lib/libMtkOmxVdec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxVenc.so:system/lib/libMtkOmxVenc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxVorbisDec.so:system/lib/libMtkOmxVorbisDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkOmxVorbisEnc.so:system/lib/libMtkOmxVorbisEnc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmtkplayer.so:system/lib/libmtkplayer.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libMtkVideoTranscoder.so:system/lib/libMtkVideoTranscoder.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmtk_vt_client.so:system/lib/libmtk_vt_client.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmtk_vt_em.so:system/lib/libmtk_vt_em.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmtk_vt_service.so:system/lib/libmtk_vt_service.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmtk_vt_swip.so:system/lib/libmtk_vt_swip.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmtk_vt_utils.so:system/lib/libmtk_vt_utils.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libpalwlan_mtk.so:system/lib/libpalwlan_mtk.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/librilmtk.so:system/lib/librilmtk.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/librilmtkmd2.so:system/lib/librilmtkmd2.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libutilrilmtk.so:system/lib/libutilrilmtk.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/mtk-ril.so:system/lib/mtk-ril.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/mtk-rilmd2.so:system/lib/mtk-rilmd2.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libalmkdrv.so:system/lib/libalmkdrv.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libatciserv_jni.so:system/lib/libatciserv_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libbluetoothdrv.so:system/lib/libbluetoothdrv.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libbluetooth_relayer.so:system/lib/libbluetooth_relayer.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libbtcust.so:system/lib/libbtcust.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libbtcusttable.so:system/lib/libbtcusttable.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libbtpcm.so:system/lib/libbtpcm.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libbtsniff.so:system/lib/libbtsniff.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libcam.camadapter.so:system/lib/libcam.camadapter.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libcam.campipe.so:system/lib/libcam.campipe.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libcam.camshot.so:system/lib/libcam.camshot.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libcam.client.so:system/lib/libcam.client.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libcam.paramsmgr.so:system/lib/libcam.paramsmgr.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libcam.utils.so:system/lib/libcam.utils.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libcamalgo.so:system/lib/libcamalgo.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libcam_camera_exif.so:system/lib/libcam_camera_exif.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libcamdrv.so:system/lib/libcamdrv.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libcamera_client.so:system/lib/libcamera_client.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libcameracustom.so:system/lib/libcameracustom.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libcamera_metadata.so:system/lib/libcamera_metadata.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libcameraservice.so:system/lib/libcameraservice.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libdrm1.so:system/lib/libdrm1.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libdrm1_jni.so:system/lib/libdrm1_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libdrmdecrypt.so:system/lib/libdrmdecrypt.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libdrmframework.so:system/lib/libdrmframework.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libdrmframework_jni.so:system/lib/libdrmframework_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libEGL.so:system/lib/libEGL.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libem_bt_jni.so:system/lib/libem_bt_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libem_gpio_jni.so:system/lib/libem_gpio_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libem_modem_jni.so:system/lib/libem_modem_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libem_support_jni.so:system/lib/libem_support_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libem_usb_jni.so:system/lib/libem_usb_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libem_wifi_jni.so:system/lib/libem_wifi_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libETC1.so:system/lib/libETC1.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libexif.so:system/lib/libexif.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libexif_jni.so:system/lib/libexif_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextavrcp.so:system/lib/libextavrcp.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextavrcp_jni.so:system/lib/libextavrcp_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextbip.so:system/lib/libextbip.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextbip_jni.so:system/lib/libextbip_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextbpp.so:system/lib/libextbpp.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextbpp_jni.so:system/lib/libextbpp_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextdun_jni.so:system/lib/libextdun_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextftp.so:system/lib/libextftp.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextftp_jni.so:system/lib/libextftp_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libexthid.so:system/lib/libexthid.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libexthid_jni.so:system/lib/libexthid_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextmap_jni.so:system/lib/libextmap_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextopp.so:system/lib/libextopp.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextopp_jni.so:system/lib/libextopp_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextpan_jni.so:system/lib/libextpan_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextpbap.so:system/lib/libextpbap.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextpbap_jni.so:system/lib/libextpbap_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextsimap.so:system/lib/libextsimap.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextsimap_jni.so:system/lib/libextsimap_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextsys.so:system/lib/libextsys.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libextsys_jni.so:system/lib/libextsys_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libexttestmode.so:system/lib/libexttestmode.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libface.so:system/lib/libface.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libfacelock_jni.so:system/lib/libfacelock_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libfeatureio.so:system/lib/libfeatureio.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libFFTEm.so:system/lib/libFFTEm.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libfile_op.so:system/lib/libfile_op.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libfilterfw.so:system/lib/libfilterfw.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libfilterpack_facedetect.so:system/lib/libfilterpack_facedetect.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libfilterpack_imageproc.so:system/lib/libfilterpack_imageproc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libflv.so:system/lib/libflv.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libflvextractor.so:system/lib/libflvextractor.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libfmmt6616.so:system/lib/libfmmt6616.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libfmmt6620.so:system/lib/libfmmt6620.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libfmmt6626.so:system/lib/libfmmt6626.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libfmmt6628.so:system/lib/libfmmt6628.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libfrsdk.so:system/lib/libfrsdk.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libgabi++.so:system/lib/libgabi++.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libgames_rtmp_jni.so:system/lib/libgames_rtmp_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libgccdemangle.so:system/lib/libgccdemangle.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libGdmaScalerPipe.so:system/lib/libGdmaScalerPipe.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libGLES_trace.so:system/lib/libGLES_trace.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libGLESv1_CM.so:system/lib/libGLESv1_CM.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libGLESv2.so:system/lib/libGLESv2.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libI420colorconvert.so:system/lib/libI420colorconvert.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libicui18n.so:system/lib/libicui18n.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libJniAtvService.so:system/lib/libJniAtvService.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libjnigraphics.so:system/lib/libjnigraphics.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libjni_pq.so:system/lib/libjni_pq.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOpenMAXAL.so:system/lib/libOpenMAXAL.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOpenSLES.so:system/lib/libOpenSLES.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libportable.so:system/lib/libportable.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libpower.so:system/lib/libpower.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libpowermanager.so:system/lib/libpowermanager.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libpppbtdun.so:system/lib/libpppbtdun.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libprotobuf-c.so:system/lib/libprotobuf-c.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libril.so:system/lib/libril.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libsensorservice.so:system/lib/libsensorservice.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libsoundpool.so:system/lib/libsoundpool.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libwebcore.so:system/lib/libwebcore.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libwebp_android.so:system/lib/libwebp_android.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libwebrtc_audio_preprocessing.so:system/lib/libwebrtc_audio_preprocessing.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libwifitest.so:system/lib/libwifitest.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libwilhelm.so:system/lib/libwilhelm.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libwpa_client.so:system/lib/libwpa_client.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libWVphoneAPI.so:system/lib/libWVphoneAPI.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libXT9Engine.so:system/lib/libXT9Engine.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/ccci.ko:system/lib/modules/ccci.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/ccci_plat.ko:system/lib/modules/ccci_plat.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/devapc.ko:system/lib/modules/devapc.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/devinfo.ko:system/lib/modules/devinfo.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/modules.dep.bb:system/lib/modules/modules.dep.bb \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/mtk_fm_drv.ko:system/lib/modules/mtk_fm_drv.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/mtk_hif_sdio.ko:system/lib/modules/mtk_hif_sdio.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/mtklfb.ko:system/lib/modules/mtklfb.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/mtk_stp_bt.ko:system/lib/modules/mtk_stp_bt.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/mtk_stp_gps.ko:system/lib/modules/mtk_stp_gps.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/mtk_stp_uart.ko:system/lib/modules/mtk_stp_uart.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/mtk_stp_wmt.ko:system/lib/modules/mtk_stp_wmt.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/mtk_wmt_wifi.ko:system/lib/modules/mtk_wmt_wifi.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/pvrsrvkm.ko:system/lib/modules/pvrsrvkm.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/scsi_tgt.ko:system/lib/modules/scsi_tgt.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/modules/sec.ko:system/lib/modules/sec.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/vcodec_kernel_driver.ko:system/lib/modules/vcodec_kernel_driver.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/wlan.ko:system/lib/modules/wlan.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/wlan_mt6628.ko:system/lib/modules/wlan_mt6628.ko \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/audio_effects.conf:system/vendor/etc/audio_effects.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libbundlewrapper.so:system/lib/soundfx/libbundlewrapper.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libreverbwrapper.so:system/lib/soundfx/libreverbwrapper.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libvisualizer.so:system/lib/soundfx/libvisualizer.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libaudiopreprocessing.so:system/lib/soundfx/libaudiopreprocessing.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libdownmix.so:system/lib/soundfx/libdownmix.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libsoundaurawrapper.so:system/lib/soundfx/libsoundaurawrapper.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libpreeffectwrapper.so:system/lib/soundfx/libpreeffectwrapper.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libposteffectwrapper.so:system/lib/soundfx/libposteffectwrapper.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libBLPP.so:system/vendor/lib/libBLPP.so  \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libglslcompiler.so:system/vendor/lib/libglslcompiler.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libIMGegl.so:system/vendor/lib/libIMGegl.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libpvr2d.so:system/vendor/lib/libpvr2d.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libpvrANDROID_WSEGL.so:system/vendor/lib/libpvrANDROID_WSEGL.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libPVRScopeServices.so:system/vendor/lib/libPVRScopeServices.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libsrv_init.so:system/vendor/lib/libsrv_init.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libsrv_um.so:system/vendor/lib/libsrv_um.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libusc.so:system/vendor/lib/libusc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libwvdrm_L3.so:system/vendor/lib/libwvdrm_L3.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libwvm.so:system/vendor/lib/libwvm.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libWVStreamControlAPI_L3.so:system/vendor/lib/libWVStreamControlAPI_L3.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libdrmwvmplugin.so:system/vendor/lib/drm/libdrmwvmplugin.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libEGL_mtk.so:system/vendor/lib/egl/libEGL_mtk.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libGLESv1_CM_mtk.so:system/vendor/lib/egl/libGLESv1_CM_mtk.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libGLESv2_mtk.so:system/vendor/lib/egl/libGLESv2_mtk.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/gralloc.mt6589.so:system/vendor/lib/hw/gralloc.mt6589.so \\
# All the apks necessary for arima89_we_s_jb2
PRODUCT_PACKAGES += \\
    MTKAndroidSuiteDaemon \\
    MtkBt \\
    MTKThermalManager \\
    AtciService \\
    BatteryWarning \\
    CellConnService \\
    CDS_INFO \\
    DataUsageLockScreenClient  \\
    EngineerMode  \\
    EngineerModeSim  \\
    Radio  \\
    OMAClientProvisioning  \\
    Omacp  \\
    OmaDownload  \\
    OmaV1AgentDownloadServices  \\
    VoiceCommand  \\
    VoiceUnlock  \\
    YGPS  \\
    LocationEM \\
    dm \\
    DrmDialogs \\
    DrmProvider \\
    mediatek-res \\
    theme-res-mint \\
    theme-res-mocha \\
    theme-res-raspberry
EOF



## end make file for vendor blobs


##start Android.mk file


(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g > ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/Android.mk
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# This file is generated by device/__MANUFACTURER__/__DEVICE__/extract-files.sh - DO NOT EDIT
ifeq (\$(TARGET_DEVICE),arima89_we_s_jb2)
LOCAL_PATH:=\$(call my-dir)
# Module makefile rules for apks on arima89_we_s_jb2
# MTKAndroidSuiteDaemon
include \$(CLEAR_VARS)
LOCAL_MODULE := MTKAndroidSuiteDaemon
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# MtkBt
include \$(CLEAR_VARS)
LOCAL_MODULE := MtkBt
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# MTKThermalManager
include \$(CLEAR_VARS)
LOCAL_MODULE := MTKThermalManager
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# AtciService
include \$(CLEAR_VARS)
LOCAL_MODULE := AtciService
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# BatteryWarning
include \$(CLEAR_VARS)
LOCAL_MODULE := BatteryWarning
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# CellConnService
include \$(CLEAR_VARS)
LOCAL_MODULE := CellConnService
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# CDS_INFO
include \$(CLEAR_VARS)
LOCAL_MODULE := CDS_INFO
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# DataUsageLockScreenClient
include \$(CLEAR_VARS)
LOCAL_MODULE := DataUsageLockScreenClient
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# EngineerMode
include \$(CLEAR_VARS)
LOCAL_MODULE := EngineerMode
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# EngineerModeSim
include \$(CLEAR_VARS)
LOCAL_MODULE := EngineerModeSim
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# Radio
include \$(CLEAR_VARS)
LOCAL_MODULE := Radio
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# OMAClientProvisioning
include \$(CLEAR_VARS)
LOCAL_MODULE := OMAClientProvisioning
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# Omacp
include \$(CLEAR_VARS)
LOCAL_MODULE := Omacp
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# OmaDownload
include \$(CLEAR_VARS)
LOCAL_MODULE := OmaDownload
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# OmaV1AgentDownloadServices
include \$(CLEAR_VARS)
LOCAL_MODULE := OmaV1AgentDownloadServices
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# VoiceCommand
include \$(CLEAR_VARS)
LOCAL_MODULE := VoiceCommand
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# VoiceUnlock
include \$(CLEAR_VARS)
LOCAL_MODULE := VoiceUnlock
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# YGPS
include \$(CLEAR_VARS)
LOCAL_MODULE := YGPS
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# LocationEM
include \$(CLEAR_VARS)
LOCAL_MODULE := LocationEM
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# dm
include \$(CLEAR_VARS)
LOCAL_MODULE := dm
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# DrmDialogs
include \$(CLEAR_VARS)
LOCAL_MODULE := DrmDialogs
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# DrmProvider
include \$(CLEAR_VARS)
LOCAL_MODULE := DrmProvider
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# mediatek-res
include \$(CLEAR_VARS)
LOCAL_MODULE := mediatek-res
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# theme-res-mint
include \$(CLEAR_VARS)
LOCAL_MODULE := theme-res-mint
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# theme-res-mocha 
include \$(CLEAR_VARS)
LOCAL_MODULE := theme-res-mocha 
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# theme-res-raspberry
include \$(CLEAR_VARS)
LOCAL_MODULE := theme-res-raspberry
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
endif
EOF

##end Android.mk file

./setup-makefiles.sh
