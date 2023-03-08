Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF205C64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 19:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA4110E6E4;
	Wed,  8 Mar 2023 19:10:39 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A08410E6E4
 for <intel-xe@freedesktop.org>; Wed,  8 Mar 2023 19:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678302637; x=1709838637;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r9RMx6r8M+xsPocGa2LIS0uDtF4B832TgftQ1cg5RXc=;
 b=HqfBAFcXkkwzXIOi9luyFFOqfgu/64grweM4H0N6isdevGDJKyVNjeCh
 u4+9KHLdZgV3vEwOq+KF6dG78clbL98f/wVSTroQw+HhAex2IHLdJ/Ag2
 5Pg5xgrfT7iWTA+Jbd3C8yWnL+qP6s2psJYlo1OoUKKYcB0gyLHyTrHJg
 ZwUP1p6MfiV7vzAhmsxuRvaennV6f9cZTBKNW9AxocrvKQLpFb1Y+iSL8
 w7GNsRg7AkyFmbS8+xBSx4PCjbYe3Y0fzg/TaLYQmQwKqnwn9+xrv/345
 br5AbewS9kyrjO56JyEJLUA9dxBKlQ/H3hFuWdjLF7gUdZdK99xTZfT+2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="324567695"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="324567695"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 11:10:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="1006437755"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="1006437755"
Received: from chenlili-mobl.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.21])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 11:10:35 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@freedesktop.org
Date: Wed,  8 Mar 2023 20:10:13 +0100
Message-Id: <20230308191013.40431-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: [Intel-xe] [PATCH] drm/xe/vm: Use the correct vma destroy sequence
 on userptr failure
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix the below warning by using the correct vma destroy sequence:

[   92.204921] ------------[ cut here ]------------
[   92.204954] WARNING: CPU: 3 PID: 2449 at drivers/gpu/drm/xe/xe_vm.c:933 =
xe_vma_destroy+0x280/0x290 [xe]
[   92.205002] Modules linked in: ccm nft_objref cmac nf_conntrack_netbios_=
ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nf=
t_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat=
 ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf=
_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw =
iptable_security ip_set nf_tables nfnetlink ip6table_filter iptable_filter =
bnep sunrpc vfat fat iwlmvm mac80211 intel_rapl_msr ee1004 ppdev intel_rapl=
_common snd_hda_codec_realtek libarc4 iTCO_wdt snd_hda_codec_generic intel_=
pmc_bxt x86_pkg_temp_thermal iTCO_vendor_support intel_powerclamp coretemp =
intel_cstate iwlwifi btusb btrtl btbcm snd_hda_intel btintel snd_intel_dspc=
fg eeepc_wmi snd_hda_codec asus_wmi bluetooth snd_hwdep snd_seq ledtrig_aud=
io snd_hda_core snd_seq_device sparse_keymap cfg80211 snd_pcm intel_uncore =
joydev platform_profile mei_me wmi_bmof intel_wmi_thunderbolt snd_timer pcs=
pkr ecdh_generic i2c_i801 snd
[   92.205060]  ecc mei rfkill soundcore idma64 i2c_smbus parport_pc parpor=
t acpi_pad acpi_tad xe drm_ttm_helper ttm i2c_algo_bit drm_suballoc_helper =
kunit drm_buddy gpu_sched drm_display_helper drm_kms_helper drm crct10dif_p=
clmul crc32_pclmul crc32c_intel nvme nvme_core e1000e ghash_clmulni_intel d=
rm_panel_orientation_quirks video wmi pinctrl_tigerlake usb_storage ip6_tab=
les ip_tables fuse
[   92.205242] CPU: 3 PID: 2449 Comm: xe_vm Tainted: G     U             6.=
1.0+ #120
[   92.205254] Hardware name: ASUS System Product Name/PRIME B560M-A AC, BI=
OS 0403 01/26/2021
[   92.205266] RIP: 0010:xe_vma_destroy+0x280/0x290 [xe]
[   92.205299] Code: 74 15 48 8b 93 a0 01 00 00 48 8b 83 a8 01 00 00 48 89 =
42 08 48 89 10 4c 89 ab a0 01 00 00 4c 89 ab a8 01 00 00 e9 1b fe ff ff <0f=
> 0b e9 a3 fe ff ff 0f 0b e9 82 fe ff ff 66 90 0f 1f 44 00 00 48
[   92.205322] RSP: 0018:ffffaadd465c3a58 EFLAGS: 00010246
[   92.205331] RAX: 0000000000000000 RBX: ffff9706d53ed400 RCX: 00000000000=
00001
[   92.205341] RDX: ffff9706d53ed480 RSI: ffffffffa756dc2b RDI: ffffffffa76=
0a05e
[   92.205351] RBP: 0000000000000000 R08: 0000000000000000 R09: 000000002c5=
370a2
[   92.205361] R10: ffff9706ca520000 R11: 0000000022c5370a R12: ffff9706cad=
03800
[   92.205370] R13: 000000000004ffff R14: fffffffffffffff2 R15: 00000000000=
00000
[   92.205380] FS:  00007fe98203a940(0000) GS:ffff970dffac0000(0000) knlGS:=
0000000000000000
[   92.205392] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   92.205400] CR2: 00007fe982ccb000 CR3: 000000010d6e6003 CR4: 00000000007=
70ee0
[   92.205410] PKRU: 55555554
[   92.205415] Call Trace:
[   92.205419]  <TASK>
[   92.205426]  vm_bind_ioctl_lookup_vma+0x9bb/0xbf0 [xe]
[   92.205461]  ? lock_is_held_type+0xe3/0x140
[   92.205472]  ? xe_vm_find_overlapping_vma+0x77/0x90 [xe]
[   92.205503]  ? __vm_bind_ioctl_lookup_vma.constprop.0+0x9e/0xe0 [xe]
[   92.205533]  ? __lock_acquire+0x3a3/0x1fb0
[   92.205543]  ? register_lock_class+0x38/0x480
[   92.205550]  ? __lock_acquire+0x3a3/0x1fb0
[   92.205558]  ? __lock_acquire+0x3a3/0x1fb0
[   92.205567]  ? __lock_acquire+0x3a3/0x1fb0
[   92.205579]  ? lock_acquire+0xbf/0x2b0
[   92.205586]  ? lock_acquire+0xcf/0x2b0
[   92.205597]  xe_vm_bind_ioctl+0x977/0x1c30 [xe]
[   92.205630]  ? find_held_lock+0x2b/0x80
[   92.205640]  ? lock_release+0x131/0x2c0
[   92.205648]  ? xe_vm_ttm_bo+0x40/0x40 [xe]
[   92.205677]  drm_ioctl_kernel+0xa1/0x150 [drm]
[   92.205706]  drm_ioctl+0x221/0x420 [drm]
[   92.205727]  ? xe_vm_ttm_bo+0x40/0x40 [xe]
[   92.205764]  __x64_sys_ioctl+0x8d/0xd0
[   92.205774]  do_syscall_64+0x37/0x90
[   92.205781]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   92.205790] RIP: 0033:0x7fe982be8d6f
[   92.205797] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 =
00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89=
> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[   92.205821] RSP: 002b:00007ffde9f9c560 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000010
[   92.205832] RAX: ffffffffffffffda RBX: 00007fadeadbe000 RCX: 00007fe982b=
e8d6f
[   92.205842] RDX: 00007ffde9f9c5f0 RSI: 0000000040786445 RDI: 00000000000=
00003
[   92.205851] RBP: 00007ffde9f9c5f0 R08: 00007fadeadbe000 R09: 00000000000=
40000
[   92.205861] R10: 0000000000000003 R11: 0000000000000246 R12: 00000000407=
86445
[   92.205871] R13: 0000000000000003 R14: 0000000000000003 R15: 00007fe982e=
02000
[   92.205888]  </TASK>
[   92.205892] irq event stamp: 82723
[   92.205897] hardirqs last  enabled at (82731): [<ffffffffa617660e>] __up=
_console_sem+0x5e/0x70
[   92.205910] hardirqs last disabled at (82738): [<ffffffffa61765f3>] __up=
_console_sem+0x43/0x70
[   92.205922] softirqs last  enabled at (82182): [<ffffffffa60f026d>] __ir=
q_exit_rcu+0xed/0x160
[   92.205935] softirqs last disabled at (82163): [<ffffffffa60f026d>] __ir=
q_exit_rcu+0xed/0x160
[   92.205947] ---[ end trace 0000000000000000 ]---

Reported-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6cf7172e84cc..e8e178922082 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2811,7 +2811,8 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct=
 xe_vm *vm,
=20
 		err =3D xe_vma_userptr_pin_pages(vma);
 		if (err) {
-			xe_vma_destroy(vma, NULL);
+			prep_vma_destroy(vm, vma);
+			xe_vma_destroy_unlocked(vma);
=20
 			return ERR_PTR(err);
 		} else {
--=20
2.39.2

