Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4FBC44507
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 03:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DEB10E3FB;
	Fri, 17 Jul 2026 03:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QXKRct81";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4498E10E3FB;
 Fri, 17 Jul 2026 03:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784260059; x=1815796059;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3jR4z3ESC6MTQAACzKWY99jbmn52Qz6ICbcl8wVyYq4=;
 b=QXKRct81pzpP+KEJdQpIiD1UwEhNXduJnouds2x7Fjglov72iIE6QZOO
 O1Hif+3pCDAaMtEeYFvi5fjsSRj3whF52+yH/BsSUe1iLaiECpojU8e6d
 46m7iJMFZflUYkgpHIviTiH+TeZ836lpZPQ+CBEfkplMaJICHDa9/K0ru
 D1xMxGhAsw/VkgxojX89jUQVtv3lqubSLP0gQwF3I3nPcElqfkOMG3gHR
 DHEIlPs451OG2Jnj7iPuFGndytoow1s3CjR3pinK2VN88SFcTeQ3JdvL0
 JEh7fThyrooWKC04TjCKUO29fN65nIEsIWMbTjLfoObdGZ4XnEdscy1OT w==;
X-CSE-ConnectionGUID: 5vRs1SEpSUe4RJmJJIl0lQ==
X-CSE-MsgGUID: 6JR27V8xSxO1QWIVf7gYDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84808255"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="84808255"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 20:47:38 -0700
X-CSE-ConnectionGUID: VwYGnnArTkGaVDaX4aI4BQ==
X-CSE-MsgGUID: 8VpXe9axSDuFBDERx7nsmQ==
X-ExtLoop1: 1
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa003.fm.intel.com with ESMTP; 16 Jul 2026 20:47:37 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/hdcp: Make hdcp2_encrypted and hdcp_encrypted
 mutually exclusive
Date: Fri, 17 Jul 2026 09:17:34 +0530
Message-Id: <20260717034734.477591-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

With introduction of force_hdcp14 we can now for HDCP 1.4 by passing
HDCP 2.2 authentication but In MST, _intel_hdcp_disable() and
_intel_hdcp2_disable() can return early
when there are still other streams active on the port (num_streams > 0),
leaving the per-connector hdcp_encrypted / hdcp2_encrypted flag stale.
If the same connector is later re-enabled with the other HDCP version
(e.g. HDCP 1.4 via force_hdcp14 after a prior HDCP 2.2 session on that
connector) the stale flag from the previous protocol survives.
intel_hdcp_disable() then picks the wrong branch on the next disable
causing the following splat.

xe 0000:00:02.0: [drm]
drm_WARN_ON(!(intel_de_read(display,
((((&(display)->info.__runtime_info)->ip.ver) >= 12) ? ((const
i915_reg_t){ .reg = (((0x664B4) + (cpu_transcoder) * ((0x665B4) -
(0x664B4)))) }) : ((const i915_reg_t){ .reg = ((((const u32 []){
0x66800, 0x66500, 0x66600, 0x66700, 0x66A00, 0x66900 })[(port)]) +
(0xB4)) }))) & ((u32)(((int)sizeof(struct
{_Static_assert(!(__builtin_choose_expr((sizeof(int) == sizeof(*(8 ?
((void *)((long)((20) >= (sizeof(u32) * 8)) * 0l)) : (int *)8))), (20)
>= (sizeof(u32) * 8), false)), "const_true((20) >= BITS_PER_TYPE(u32))"
" is true");})) + ((((1ULL))) << (20))))))
WARNING:
drivers/gpu/drm/i915/display/intel_hdcp.c:1969 at
_intel_hdcp2_disable+0x4bf/0x520 [xe], CPU#2: kms_content_pro/101318
Modules linked in: xe vfio_pci_core vfio_iommu_type1
vfio iommufd xt_multiport snd_hda_codec_intelhdmi snd_hda_codec_hdmi
drm_gpuvm drm_gpusvm_helper drm_buddy gpu_sched drm_ttm_helper ttm
drm_suballoc_helper drm_exec drm_display_helper cec rc_core
drm_kunit_helpers kunit i2c_algo_bit xt_conntrack xt_MASQUERADE bridge
stp llc nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
xt_addrtype nft_compat x_tables nf_tables xfrm_user xfrm_algo overlay
cpuid cmdlinepart spi_nor mei_gsc_proxy mtd intel_rapl_msr wmi_bmof
intel_uncore_frequency intel_uncore_frequency_common
x86_pkg_temp_thermal intel_powerclamp coretemp snd_intel_dspcfg
aesni_intel snd_hda_codec gf128mul snd_hda_core snd_hwdep r8169 snd_pcm
intel_cstate snd_timer i2c_i801 i2c_mux snd spi_intel_pci
processor_thermal_device_pci realtek video e1000e spi_intel i2c_smbus
soundcore phy_package processor_thermal_device processor_thermal_wt_hint
mei_me platform_temperature_control processor_thermal_soc_slider idma64
mei processor_thermal_rfim
processor_thermal_rapl intel_ish_ipc
intel_rapl_common intel_ishtp thunderbolt processor_thermal_wt_req
processor_thermal_power_floor intel_vpu processor_thermal_mbox
igen6_edac wmi sunrpc kvm_intel binfmt_misc kvm irqbypass
int3403_thermal int340x_thermal_zone intel_skl_int3472_tps68470
tps68470_regulator intel_pmc_core clk_tps68470 acpi_tad int3400_thermal
intel_hid pmt_telemetry acpi_thermal_rel sparse_keymap pmt_discovery
pinctrl_intel_platform pmt_class intel_pmc_ssram_telemetry
intel_pmc_pwrm_telemetry intel_skl_int3472_discrete
intel_skl_int3472_common acpi_pad intel_vsec nls_iso8859_1 dm_multipath
msr fuse efi_pstore autofs4 [last unloaded: xe_live_test]
CPU: 2 UID: 0 PID: 101318 Comm: kms_content_pro Kdump:
loaded Tainted: G     U       L   N
7.2.0-rc2-lgci-xe-xe-5389-67aa8ad5c4c59cd1a-debug+ #1 PREEMPT(lazy)
Tainted: [U]=USER, [L]=SOFTLOCKUP, [N]=TEST
Hardware name: Intel Corporation Panther Lake Client
Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3514.D01.2512291130
12/29/2025
RIP: 0010:_intel_hdcp2_disable+0x4c9/0x520 [xe]
Code: 85 ff 74 04 48 8b 7f 08 4c 8b 7f 50 4d 85 ff 74
23 e8 5b 80 df e0 48 89 c6 48 8d 3d b1 f7 ba ff 48 c7 c1 a0 27 6a a1 4c
   89 fa <67> 48 0f b9 3a e9 c9 fc ff ff 4c 8b 3f eb d8 e8 33 45 4e e1
      4c 89
RSP: 0018:ffffc900027bf738 EFLAGS: 00010246
RAX: ffffffffa16bd4f1 RBX: ffff8881a1e69000 RCX:
ffffffffa16a27a0
RDX: ffff8881c7b1b190 RSI: ffffffffa16bd4f1 RDI:
ffffffffa100de30
RBP: ffffc900027bf7b0 R08: 0000000000000000 R09:
0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12:
ffff88844397a000
R13: ffff88844397a000 R14: ffff88817f7d2000 R15:
ffff8881c7b1b190
FS:  0000774e9299dbc0(0000) GS:ffff8884eb36c000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000774e94bc7220 CR3: 00000002166c1002 CR4:
0000000108f72ef0
PKRU: 55555554
Call Trace:
 <TASK>
 ? intel_hdcp_update_value+0x7d/0x260 [xe]
 intel_hdcp_disable+0x118/0x130 [xe]
 intel_hdcp_update_pipe+0x175/0x1b0 [xe]
 ? intel_initial_watermarks+0x20/0x60 [xe]
 intel_ddi_update_pipe+0x44/0xb0 [xe]
 intel_pre_update_crtc+0x3bc/0x410 [xe]
 skl_commit_modeset_enables+0x1a7/0x890 [xe]
 ? icl_sagv_pre_plane_update+0x6c/0xf0 [xe]
 intel_atomic_commit_tail+0x114b/0x20a0 [xe]
 ? lock_release+0xd0/0x2a0
 intel_atomic_commit+0x2ff/0x350 [xe]
 ? intel_atomic_commit+0x2ff/0x350 [xe]
 drm_atomic_commit+0xaf/0xf0
 ? __pfx___drm_printfn_info+0x10/0x10
 drm_mode_atomic_ioctl+0xcb5/0xf60
 ? drm_mode_atomic_ioctl+0x8a8/0xf60
 ? drm_mode_atomic_ioctl+0x604/0xf60
 ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
 drm_ioctl_kernel+0xb3/0x120
 drm_ioctl+0x2db/0x5a0
 ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
 ? _raw_spin_unlock_irqrestore+0x51/0x80
 ? __pm_runtime_resume+0x5b/0x90
 ? xe_pm_runtime_get_ioctl+0x61/0x150 [xe]
 xe_drm_ioctl+0x64/0xb0 [xe]
 __x64_sys_ioctl+0xa5/0x100
 x64_sys_call+0x1250/0x26e0
 do_syscall_64+0x103/0x6d0
 ? __task_pid_nr_ns+0xc0/0x290
 ? trace_hardirqs_on_prepare+0xcb/0xf0
 ? do_syscall_64+0x34/0x6d0
 ? fred_entry_from_user+0x92/0x140
 ? trace_hardirqs_on+0x22/0xe0
 ? do_syscall_64+0xb8/0x6d0
 fred_entry_from_user+0x92/0x140
 asm_fred_entrypoint_user+0x41/

Ensure the two flags are mutually exclusive at every successful enable:
after intel_hdcp_auth() succeeds.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 0a076d2ed70a..e56df337dc6d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -1075,6 +1075,7 @@ static int intel_hdcp1_enable(struct intel_connector *connector)
 		ret = intel_hdcp_auth(connector);
 		if (!ret) {
 			hdcp->hdcp_encrypted = true;
+			hdcp->hdcp2_encrypted = false;
 			return 0;
 		}
 
@@ -2109,6 +2110,7 @@ static int _intel_hdcp2_enable(struct intel_atomic_state *state,
 		    hdcp->content_type);
 
 	hdcp->hdcp2_encrypted = true;
+	hdcp->hdcp_encrypted = false;
 	return 0;
 }
 
-- 
2.34.1

