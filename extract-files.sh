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
DEVICE=c2305
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
adb pull /system/bin/settings $PROP_BIN_DIR
adb pull /system/bin/ta_reader $PROP_BIN_DIR
adb pull /system/bin/ta_sync_md $PROP_BIN_DIR
adb pull /system/bin/tc $PROP_BIN_DIR
adb pull /system/bin/thermal $PROP_BIN_DIR
adb pull /system/bin/thermal_manager $PROP_BIN_DIR
adb pull /system/bin/updatemiscta $PROP_BIN_DIR
adb pull /system/bin/wlan_loader $PROP_BIN_DIR


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
adb pull /system/lib/libwebrtc_audio_preprocessing. $PROP_LIB_DIRso
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
adb pull /system/lib/soundfx/libhearingprotection.so $PROP_LIB_DIR
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



#old file content
adb pull /system/app/BIP.apk ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/BIP.apk
adb pull /system/app/IMSFramework.apk ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/IMSFramework.apk
adb pull /system/app/RTN.apk ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/RTN.apk
adb pull /system/app/SDM.apk ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/SDM.apk
adb pull /system/app/SPG.apk ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/SPG.apk
adb pull /system/app/SyncMLSvc.apk ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/SyncMLSvc.apk
adb pull /system/bin/fRom ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/fRom
chmod 755 ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/fRom
adb pull /system/lib/libsecril-client.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libsecril-client.so
adb pull /system/lib/libsyncml_core.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libsyncml_core.so
adb pull /system/lib/libsyncml_port.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libsyncml_port.so
adb pull /system/lib/lib_gsd4t.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/lib_gsd4t.so
adb pull /system/vendor/bin/pvrsrvinit ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/pvrsrvinit
chmod 755 ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/pvrsrvinit
adb pull /system/vendor/etc/sirfgps.conf ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/sirfgps.conf
adb pull /system/vendor/firmware/bcm4330.hcd ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/bcm4330.hcd
adb pull /system/vendor/firmware/ducati-m3.bin ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/ducati-m3.bin
adb pull /system/vendor/firmware/libpn544_fw.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libpn544_fw.so
adb pull /system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libEGL_POWERVR_SGX540_120.so
adb pull /system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libGLESv1_CM_POWERVR_SGX540_120.so
adb pull /system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libGLESv2_POWERVR_SGX540_120.so
adb pull /system/vendor/lib/hw/gps.omap4.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/gps.omap4.so
adb pull /system/vendor/lib/hw/gralloc.omap4.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/gralloc.omap4.so
adb pull /system/vendor/lib/libglslcompiler.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libglslcompiler.so
adb pull /system/vendor/lib/libIMGegl.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libIMGegl.so
adb pull /system/vendor/lib/libims.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libims.so
adb pull /system/vendor/lib/libims_jni.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libims_jni.so
adb pull /system/vendor/lib/libinvensense_mpl.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libinvensense_mpl.so
adb pull /system/vendor/lib/libpvr2d.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libpvr2d.so
adb pull /system/vendor/lib/libpvrANDROID_WSEGL.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libpvrANDROID_WSEGL.so
adb pull /system/vendor/lib/libPVRScopeServices.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libPVRScopeServices.so
adb pull /system/vendor/lib/libsec-ril_lte.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libsec-ril_lte.so
adb pull /system/vendor/lib/libsrv_init.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libsrv_init.so
adb pull /system/vendor/lib/libsrv_um.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libsrv_um.so
adb pull /system/vendor/lib/libusc.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libusc.so
(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g > ../../../vendor/$MANUFACTURER/$DEVICE/device-vendor-blobs.mk
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
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsecril-client.so:obj/lib/libsecril-client.so
# All the blobs necessary for torospr
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/fRom:system/bin/fRom \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsecril-client.so:system/lib/libsecril-client.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsyncml_core.so:system/lib/libsyncml_core.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsyncml_port.so:system/lib/libsyncml_port.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib_gsd4t.so:system/lib/lib_gsd4t.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/pvrsrvinit:system/vendor/bin/pvrsrvinit \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/sirfgps.conf:system/vendor/etc/sirfgps.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bcm4330.hcd:system/vendor/firmware/bcm4330.hcd \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/ducati-m3.bin:system/vendor/firmware/ducati-m3.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libpn544_fw.so:system/vendor/firmware/libpn544_fw.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libEGL_POWERVR_SGX540_120.so:system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libGLESv1_CM_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libGLESv2_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/gps.omap4.so:system/vendor/lib/hw/gps.omap4.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/gralloc.omap4.so:system/vendor/lib/hw/gralloc.omap4.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libglslcompiler.so:system/vendor/lib/libglslcompiler.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libIMGegl.so:system/vendor/lib/libIMGegl.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libims.so:system/vendor/lib/libims.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libims_jni.so:system/vendor/lib/libims_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libinvensense_mpl.so:system/vendor/lib/libinvensense_mpl.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libpvr2d.so:system/vendor/lib/libpvr2d.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libpvrANDROID_WSEGL.so:system/vendor/lib/libpvrANDROID_WSEGL.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libPVRScopeServices.so:system/vendor/lib/libPVRScopeServices.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsec-ril_lte.so:system/vendor/lib/libsec-ril_lte.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsrv_init.so:system/vendor/lib/libsrv_init.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsrv_um.so:system/vendor/lib/libsrv_um.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libusc.so:system/vendor/lib/libusc.so
# All the apks necessary for torospr
PRODUCT_PACKAGES += \\
    BIP \\
    IMSFramework \\
    RTN \\
    SDM \\
    SPG \\
    SyncMLSvc
EOF
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
ifeq (\$(TARGET_DEVICE),torospr)
LOCAL_PATH:=\$(call my-dir)
# Module makefile rules for apks on torospr
# BIP
include \$(CLEAR_VARS)
LOCAL_MODULE := BIP
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# IMSFramework
include \$(CLEAR_VARS)
LOCAL_MODULE := IMSFramework
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# RTN
include \$(CLEAR_VARS)
LOCAL_MODULE := RTN
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# SDM
include \$(CLEAR_VARS)
LOCAL_MODULE := SDM
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# SPG
include \$(CLEAR_VARS)
LOCAL_MODULE := SPG
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
# SyncMLSvc
include \$(CLEAR_VARS)
LOCAL_MODULE := SyncMLSvc
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)
endif
EOF
./setup-makefiles.sh
