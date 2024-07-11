Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D05C3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 20:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C4410EB87;
	Thu, 11 Jul 2024 20:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OdAzlKNw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBF710EB87
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 20:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720728042; x=1752264042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v5KimaDoINi0qLWKpb8lMSoq8UeWMnqboDxSy6H36y8=;
 b=OdAzlKNwCQEYQKkk2faplFo0NqiCpkhYNMSdvs31r0I95u0Mku30d6qX
 C3NeQuteDmwUx6k73ZVZAs3exYcxbj6StMtIad5nIBt31PtnFBjVez6e/
 weWGDLYpNRK9zVSgStj+FWHOBWA4dvJ84VzB7aOFEeOlmphZt0ZNmyBmc
 JjvcqOXDMfQSOe9s5u+pzShk+6DDx9llndih0stTHXFF8TLIJx7dvkWts
 T2VSz1BogGqbg5pXAIoIV2o4OcZYDQKApbHx9wOmHuvh6L6sKezW/461N
 iBNKjVQz24iermcO201bWoj53UNnwJDkORskCDz1H7rqeVuAs0HM+JvEM A==;
X-CSE-ConnectionGUID: rVj/1U80TwCQdxHzz5PsZw==
X-CSE-MsgGUID: 4tmcQhUtRXqkJc2nqpuwLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="40664459"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="40664459"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 13:00:42 -0700
X-CSE-ConnectionGUID: DbHjfeEyQZK5Mlp2SXyZ7A==
X-CSE-MsgGUID: VYMbvYxtSnW3F4KoctuXKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="53271508"
Received: from unknown (HELO josouza-mobl2.fso.intel.com) ([10.230.19.149])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 13:00:40 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/xe: Use xe_pm_runtime_get() in xe_ggtt_remove_node()
Date: Thu, 11 Jul 2024 13:00:31 -0700
Message-ID: <20240711200031.49798-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

I don't see a relationship between drm_dev_enter() and pm_runtime.
A plugged device could still no one holding a PM refcount.

And this is being triggered from ttm_bo_delayed_delete() and I can't
see no one in the call chain getting a runtime pm before
xe_ggtt_remove_node(), so here replacing xe_pm_runtime_get_noresume()
by xe_pm_runtime_get().

This change probably will fix the kernel OOPS below:

------------[ cut here ]------------
xe 0000:4d:00.0: [drm] Missing outer runtime PM protection
WARNING: CPU: 100 PID: 3524 at drivers/gpu/drm/xe/xe_pm.c:551 xe_pm_runtime=
_get_noresume+0x48/0x60 [xe]
Modules linked in: snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep s=
nd_hda_core snd_pcm snd_timer snd soundcore mei_gsc xe drm_gpuvm video drm_=
ttm_helper ttm gpu_sched drm_suballoc_helper drm_exec drm_display_helper dr=
m_kunit_helpers kunit drm_buddy intel_rapl_msr intel_rapl_common cmdlinepar=
t spi_nor mtd intel_uncore_frequency intel_uncore_frequency_common i10nm_ed=
ac nls_iso8859_1 nfit x86_pkg_temp_thermal intel_powerclamp coretemp kvm_in=
tel kvm crct10dif_pclmul crc32_pclmul polyval_clmulni polyval_generic ghash=
_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 aesni_intel crypto_simd=
 cryptd rndis_host ast cdc_ether i2c_algo_bit dm_multipath dax_hmem i40e ix=
gbe scsi_dh_rdac drm_shmem_helper usbnet mei_me cxl_acpi scsi_dh_emc rapl s=
csi_dh_alua mii drm_kms_helper intel_cstate mdio cxl_core e1000e libie efi_=
pstore i2c_i801 intel_pch_thermal spi_intel_pci mei isst_if_mbox_pci i2c_sm=
bus isst_if_mmio spi_intel isst_if_common intel_th_gth intel_th_pci ipmi_ss=
if ioatdma intel_vsec intel_th dca wmi ipmi_si
 acpi_power_meter acpi_ipmi ipmi_devintf acpi_pad ipmi_msghandler mac_hid s=
ch_fq_codel msr parport_pc ppdev lp parport drm ip_tables x_tables autofs4
CPU: 100 PID: 3524 Comm: kworker/u580:4 Not tainted 6.10.0-rc5-xe #1
Hardware name: Intel Corporation WHITLEY/WHITLEY, BIOS SE5C6200.86B.0027.P1=
5.2205121306 05/12/2022
Workqueue: ttm ttm_bo_delayed_delete [ttm]
RIP: 0010:xe_pm_runtime_get_noresume+0x48/0x60 [xe]
Code: cc cc cc 48 8b 7b 08 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 aa bd f4 =
e0 4c 89 e2 48 c7 c7 d8 1a 03 a1 48 89 c6 e8 08 b7 32 e0 <0f> 0b 48 8b 43 0=
8 f0 ff 80 f8 02 00 00 5b 41 5c 5d c3 cc cc cc cc
RSP: 0000:ffa00000225afc00 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ff1100014c510000 RCX: 0000000000000027
RDX: 0000000000000027 RSI: 0000000000000000 RDI: ff1100103fe31a48
RBP: ffa00000225afc10 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 632da25ec9e647d2 R12: ff1100011d93b710
R13: ff1100016cf6c448 R14: 0000000000000001 R15: ff1100014c510000
FS:  0000000000000000(0000) GS:ff1100103fe00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f4d34e18198 CR3: 000000000aa54006 CR4: 0000000000771ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 <TASK>
 ? show_regs+0x67/0x70
 ? __warn+0x94/0x1b0
 ? xe_pm_runtime_get_noresume+0x48/0x60 [xe]
 ? report_bug+0x1b7/0x1d0
 ? handle_bug+0x46/0x80
 ? exc_invalid_op+0x19/0x70
 ? asm_exc_invalid_op+0x1b/0x20
 ? xe_pm_runtime_get_noresume+0x48/0x60 [xe]
 xe_ggtt_remove_node+0x99/0x110 [xe]
 xe_ggtt_remove_bo+0x59/0x1d0 [xe]
 ? _raw_write_unlock+0x23/0x50
 ? drm_vma_offset_remove+0x66/0x80 [drm]
 xe_ttm_bo_destroy+0x135/0x230 [xe]
 ttm_bo_release+0x6e/0x320 [ttm]
 ttm_bo_delayed_delete+0x82/0xa0 [ttm]
 process_scheduled_works+0x3aa/0x750
 worker_thread+0x14f/0x2f0
 ? __pfx_worker_thread+0x10/0x10
 kthread+0xf5/0x130
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x39/0x60
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>
irq event stamp: 26249
hardirqs last  enabled at (26255): [<ffffffff811b8f51>] vprintk_emit+0x351/=
0x360
hardirqs last disabled at (26260): [<ffffffff811b8f33>] vprintk_emit+0x333/=
0x360
softirqs last  enabled at (25326): [<ffffffff810f04bf>] handle_softirqs+0x3=
0f/0x430
softirqs last disabled at (25319): [<ffffffff810f0e09>] irq_exit_rcu+0x89/0=
xb0
---[ end trace 0000000000000000 ]---

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0cdbc1296e885..13ce0f51f517a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -489,7 +489,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct d=
rm_mm_node *node,
=20
 	bound =3D drm_dev_enter(&xe->drm, &idx);
 	if (bound)
-		xe_pm_runtime_get_noresume(xe);
+		xe_pm_runtime_get(xe);
=20
 	mutex_lock(&ggtt->lock);
 	if (bound)
--=20
2.45.2

