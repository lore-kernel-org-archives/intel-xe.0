Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124CE1073CA1
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 11:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24E410E61E;
	Wed,  8 Apr 2026 11:54:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F09110E61D;
 Wed,  8 Apr 2026 11:54:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/intel/display=3A_Use_?=
 =?utf-8?q?drmm_for_intel=5Fmode=5Fconfig=5Fcleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Apr 2026 11:54:01 -0000
Message-ID: <177564924149.441898.10495956679168837035@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408114755.1051393-2-dev@lankhorst.se>
In-Reply-To: <20260408114755.1051393-2-dev@lankhorst.se>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

=3D=3D Series Details =3D=3D

Series: drm/intel/display: Use drmm for intel_mode_config_cleanup
URL   : https://patchwork.freedesktop.org/series/164527/
State : warning

=3D=3D Summary =3D=3D

+ KERNEL=3D/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools=
.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9db602dbf01cfa6907d5e988b12d70a66c35246a
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Wed Apr 8 13:47:56 2026 +0200

    drm/intel/display: Use drmm for intel_mode_config_cleanup
   =20
    When force unbinding the driver on xe, xe unloads cleanly except for
    framebuffers and user blobs.
   =20
    This happens because intel_mode_config_cleanup is called during driver
    unbind, but it should be called only after all drm files are closed,
    during drmm cleanup.
   =20
    Related warnings for framebuffers on the subtest:
    [  739.713076] ------------[ cut here ]------------
                   WARN_ON(!list_empty(&dev->mode_config.fb_list))
    [  739.713079] WARNING: drivers/gpu/drm/drm_mode_config.c:584 at drm_mo=
de_config_cleanup+0x30b/0x320 [drm], CPU#12: xe_module_load/13145
    ....
    [  739.713328] Call Trace:
    [  739.713330]  <TASK>
    [  739.713335]  ? intel_pmdemand_destroy_state+0x11/0x20 [xe]
    [  739.713574]  ? intel_atomic_global_obj_cleanup+0xe4/0x1a0 [xe]
    [  739.713794]  intel_display_driver_remove_noirq+0x51/0xb0 [xe]
    [  739.714041]  xe_display_fini_early+0x33/0x50 [xe]
    [  739.714284]  devm_action_release+0xf/0x20
    [  739.714294]  devres_release_all+0xad/0xf0
    [  739.714301]  device_unbind_cleanup+0x12/0xa0
    [  739.714305]  device_release_driver_internal+0x1b7/0x210
    [  739.714311]  device_driver_detach+0x14/0x20
    [  739.714315]  unbind_store+0xa6/0xb0
    [  739.714319]  drv_attr_store+0x21/0x30
    [  739.714322]  sysfs_kf_write+0x48/0x60
    [  739.714328]  kernfs_fop_write_iter+0x16b/0x240
    [  739.714333]  vfs_write+0x266/0x520
    [  739.714341]  ksys_write+0x72/0xe0
    [  739.714345]  __x64_sys_write+0x19/0x20
    [  739.714347]  x64_sys_call+0xa15/0xa30
    [  739.714355]  do_syscall_64+0xd8/0xab0
    [  739.714361]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
   =20
    and
   =20
    [  739.714459] ------------[ cut here ]------------
    [  739.714461] xe 0000:67:00.0: [drm] drm_WARN_ON(!list_empty(&fb->filp=
_head))
    [  739.714464] WARNING: drivers/gpu/drm/drm_framebuffer.c:833 at drm_fr=
amebuffer_free+0x6c/0x90 [drm], CPU#12: xe_module_load/13145
    [  739.714715] RIP: 0010:drm_framebuffer_free+0x7a/0x90 [drm]
    ...
    [  739.714869] Call Trace:
    [  739.714871]  <TASK>
    [  739.714876]  drm_mode_config_cleanup+0x26a/0x320 [drm]
    [  739.714998]  ? __drm_printfn_seq_file+0x20/0x20 [drm]
    [  739.715115]  ? drm_mode_config_cleanup+0x207/0x320 [drm]
    [  739.715235]  intel_display_driver_remove_noirq+0x51/0xb0 [xe]
    [  739.715576]  xe_display_fini_early+0x33/0x50 [xe]
    [  739.715821]  devm_action_release+0xf/0x20
    [  739.715828]  devres_release_all+0xad/0xf0
    [  739.715843]  device_unbind_cleanup+0x12/0xa0
    [  739.715850]  device_release_driver_internal+0x1b7/0x210
    [  739.715856]  device_driver_detach+0x14/0x20
    [  739.715860]  unbind_store+0xa6/0xb0
    [  739.715865]  drv_attr_store+0x21/0x30
    [  739.715868]  sysfs_kf_write+0x48/0x60
    [  739.715873]  kernfs_fop_write_iter+0x16b/0x240
    [  739.715878]  vfs_write+0x266/0x520
    [  739.715886]  ksys_write+0x72/0xe0
    [  739.715890]  __x64_sys_write+0x19/0x20
    [  739.715893]  x64_sys_call+0xa15/0xa30
    [  739.715900]  do_syscall_64+0xd8/0xab0
    [  739.715905]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
   =20
    and then finally file close blows up:
   =20
    [  743.186530] Oops: general protection fault, probably for non-canonic=
al address 0xdead000000000122: 0000 [#1] SMP
    [  743.186535] CPU: 3 UID: 1000 PID: 3453 Comm: kwin_wayland Tainted: G=
        W           7.0.0-rc1-valkyria+ #110 PREEMPT_{RT,(lazy)}
    [  743.186537] Tainted: [W]=3DWARN
    [  743.186538] Hardware name: Gigabyte Technology Co., Ltd. X299 AORUS =
Gaming 3/X299 AORUS Gaming 3-CF, BIOS F8n 12/06/2021
    [  743.186539] RIP: 0010:drm_framebuffer_cleanup+0x55/0xc0 [drm]
    [  743.186588] Code: d8 72 73 0f b6 42 05 ff c3 39 c3 72 e8 49 8d bd 50=
 07 00 00 31 f6 e8 3a 80 d3 e1 49 8b 44 24 10 49 8d 7c 24 08 49 8b 54 24 08=
 <48> 3b 38 0f 85 95 7f 02 00 48 3b 7a 08 0f 85 8b 7f 02 00 48 89 42
    [  743.186589] RSP: 0018:ffffc900085e3cf8 EFLAGS: 00010202
    [  743.186591] RAX: dead000000000122 RBX: 0000000000000001 RCX: fffffff=
f8217ed03
    [  743.186592] RDX: dead000000000100 RSI: 0000000000000000 RDI: ffff888=
14675ba08
    [  743.186593] RBP: ffffc900085e3d10 R08: 0000000000000000 R09: 0000000=
000000000
    [  743.186593] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888=
14675ba00
    [  743.186594] R13: ffff88810d778000 R14: ffff888119f6dca0 R15: ffff888=
10c660bb0
    [  743.186595] FS:  00007ff377d21280(0000) GS:ffff888cec3f8000(0000) kn=
lGS:0000000000000000
    [  743.186596] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [  743.186596] CR2: 000055690b55e000 CR3: 0000000113586003 CR4: 0000000=
0003706f0
    [  743.186597] Call Trace:
    [  743.186598]  <TASK>
    [  743.186603]  intel_user_framebuffer_destroy+0x12/0x90 [xe]
    [  743.186722]  drm_framebuffer_free+0x3a/0x90 [drm]
    [  743.186750]  ? trace_hardirqs_on+0x5f/0x120
    [  743.186754]  drm_mode_object_put+0x51/0x70 [drm]
    [  743.186786]  drm_fb_release+0x105/0x190 [drm]
    [  743.186812]  ? rt_mutex_slowunlock+0x3aa/0x410
    [  743.186817]  ? rt_spin_lock+0xea/0x1b0
    [  743.186819]  drm_file_free+0x1e0/0x2c0 [drm]
    [  743.186843]  drm_release_noglobal+0x91/0xf0 [drm]
    [  743.186865]  __fput+0x100/0x2e0
    [  743.186869]  fput_close_sync+0x40/0xa0
    [  743.186870]  __x64_sys_close+0x3e/0x80
    [  743.186873]  x64_sys_call+0xa07/0xa30
    [  743.186879]  do_syscall_64+0xd8/0xab0
    [  743.186881]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
    [  743.186882] RIP: 0033:0x7ff37e567732
    [  743.186884] Code: 08 0f 85 a1 38 ff ff 49 89 fb 48 89 f0 48 89 d7 48=
 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05=
 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa 55 bf 01 00
    [  743.186885] RSP: 002b:00007ffc818169a8 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000003
    [  743.186886] RAX: ffffffffffffffda RBX: 00007ffc81816a30 RCX: 00007ff=
37e567732
    [  743.186887] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000=
000000012
    [  743.186888] RBP: 00007ffc818169d0 R08: 0000000000000000 R09: 0000000=
000000000
    [  743.186889] R10: 0000000000000000 R11: 0000000000000246 R12: 000055d=
60a7996e0
    [  743.186889] R13: 00007ffc81816a90 R14: 00007ffc81816a90 R15: 000055d=
60a782a30
    [  743.186892]  </TASK>
    [  743.186893] Modules linked in: rfcomm snd_hrtimer xt_CHECKSUM xt_MAS=
QUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp xt_addrtype nft_co=
mpat x_tables nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 nf_tables overlay cfg80211 bnep mtd_intel_dg snd_hda_codec_intelhdmi mtd=
 snd_hda_codec_hdmi nls_utf8 mxm_wmi intel_wmi_thunderbolt gigabyte_wmi wmi=
_bmof xe drm_gpuvm drm_gpusvm_helper i2c_algo_bit drm_buddy drm_ttm_helper =
ttm video drm_suballoc_helper gpu_sched drm_client_lib drm_exec drm_display=
_helper cec drm_kunit_helpers drm_kms_helper kunit x86_pkg_temp_thermal int=
el_powerclamp coretemp snd_hda_codec_alc882 snd_hda_codec_realtek_lib snd_h=
da_codec_generic snd_hda_intel snd_soc_avs snd_soc_hda_codec snd_hda_ext_co=
re snd_hda_codec snd_hwdep snd_hda_core snd_intel_dspcfg snd_soc_core snd_c=
ompress ac97_bus snd_pcm snd_seq snd_seq_device snd_timer i2c_i801 i2c_mux =
snd i2c_smbus btusb btrtl btbcm btmtk btintel bluetooth ecdh_generic rfkill=
 ecc mei_me mei ioatdma dca wmi nfsd drm i2c_dev fuse nfnetlink
    [  743.186938] ---[ end trace 0000000000000000 ]---
   =20
    And for property blobs:
   =20
    [  371.072940] BUG: unable to handle page fault for address: 000001ffff=
ffffff
    [  371.072944] #PF: supervisor read access in kernel mode
    [  371.072945] #PF: error_code(0x0000) - not-present page
    [  371.072947] PGD 0 P4D 0
    [  371.072950] Oops: Oops: 0000 [#1] SMP
    [  371.072953] CPU: 0 UID: 1000 PID: 3693 Comm: kwin_wayland Not tainte=
d 7.0.0-rc1-valkyria+ #111 PREEMPT_{RT,(lazy)}
    [  371.072956] Hardware name: Gigabyte Technology Co., Ltd. X299 AORUS =
Gaming 3/X299 AORUS Gaming 3-CF, BIOS F8n 12/06/2021
    [  371.072957] RIP: 0010:drm_property_destroy_user_blobs+0x3b/0x90 [drm]
    [  371.073019] Code: 00 00 48 83 ec 10 48 8b 86 30 01 00 00 48 39 c3 74=
 59 48 89 c2 48 8d 48 c8 48 8b 00 4c 8d 60 c8 eb 04 4c 8d 60 c8 48 8b 71 40=
 <48> 39 16 0f 85 39 32 01 00 48 3b 50 08 0f 85 2f 32 01 00 48 89 70
    [  371.073021] RSP: 0018:ffffc90006a73de8 EFLAGS: 00010293
    [  371.073022] RAX: 000001ffffffffff RBX: ffff888118a1a930 RCX: ffff888=
1b92355c0
    [  371.073024] RDX: ffff8881b92355f8 RSI: 000001ffffffffff RDI: ffff888=
118be4000
    [  371.073025] RBP: ffffc90006a73e08 R08: ffff8881009b7300 R09: ffff888=
cecc5b000
    [  371.073026] R10: ffffc90006a73e90 R11: 0000000000000002 R12: 000001f=
fffffffc7
    [  371.073027] R13: ffff888118a1a980 R14: ffff88810b366d20 R15: ffff888=
118a1a970
    [  371.073028] FS:  00007f1faccbb280(0000) GS:ffff888cec2db000(0000) kn=
lGS:0000000000000000
    [  371.073029] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [  371.073030] CR2: 000001ffffffffff CR3: 000000010655c001 CR4: 0000000=
0003706f0
    [  371.073031] Call Trace:
    [  371.073033]  <TASK>
    [  371.073036]  drm_file_free+0x1df/0x2a0 [drm]
    [  371.073077]  drm_release_noglobal+0x7a/0xe0 [drm]
    [  371.073113]  __fput+0xe2/0x2b0
    [  371.073118]  fput_close_sync+0x40/0xa0
    [  371.073119]  __x64_sys_close+0x3e/0x80
    [  371.073122]  x64_sys_call+0xa07/0xa30
    [  371.073126]  do_syscall_64+0xc0/0x840
    [  371.073130]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
    [  371.073132] RIP: 0033:0x7f1fb3501732
    [  371.073133] Code: 08 0f 85 a1 38 ff ff 49 89 fb 48 89 f0 48 89 d7 48=
 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05=
 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa 55 bf 01 00
    [  371.073135] RSP: 002b:00007ffe8e6f0278 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000003
    [  371.073136] RAX: ffffffffffffffda RBX: 00007ffe8e6f0300 RCX: 00007f1=
fb3501732
    [  371.073137] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000=
000000012
    [  371.073138] RBP: 00007ffe8e6f02a0 R08: 0000000000000000 R09: 0000000=
000000000
    [  371.073139] R10: 0000000000000000 R11: 0000000000000246 R12: 0000558=
5ba46eea0
    [  371.073140] R13: 00007ffe8e6f0360 R14: 00007ffe8e6f0360 R15: 0000558=
5ba458a30
    [  371.073143]  </TASK>
    [  371.073144] Modules linked in: rfcomm snd_hrtimer xt_addrtype xt_CHE=
CKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_co=
mpat x_tables nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 nf_tables overlay cfg80211 bnep snd_hda_codec_intelhdmi snd_hda_codec_hd=
mi mtd_intel_dg mtd nls_utf8 wmi_bmof mxm_wmi gigabyte_wmi intel_wmi_thunde=
rbolt xe drm_gpuvm drm_gpusvm_helper i2c_algo_bit drm_buddy drm_ttm_helper =
ttm video drm_suballoc_helper gpu_sched drm_client_lib drm_exec drm_display=
_helper cec drm_kunit_helpers drm_kms_helper kunit x86_pkg_temp_thermal int=
el_powerclamp coretemp snd_hda_codec_alc882 snd_hda_codec_realtek_lib snd_h=
da_codec_generic snd_hda_intel snd_soc_avs snd_soc_hda_codec snd_hda_ext_co=
re snd_hda_codec snd_hwdep snd_hda_core snd_intel_dspcfg snd_soc_core snd_c=
ompress ac97_bus snd_pcm snd_seq snd_seq_device snd_timer i2c_i801 btusb i2=
c_mux i2c_smbus btrtl snd btbcm btmtk btintel bluetooth ecdh_generic rfkill=
 ecc mei_me mei ioatdma dca wmi nfsd drm i2c_dev fuse nfnetlink
    [  371.073198] CR2: 000001ffffffffff
    [  371.073199] ---[ end trace 0000000000000000 ]---
   =20
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 7d7e9076131a6b5cf7ec7f17ab2f8c0c338a25dd drm-intel
9db602dbf01c drm/intel/display: Use drmm for intel_mode_config_cleanup
-:242: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', per=
haps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 71 lines checked


