Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE21C79F89
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5F510FB4D;
	Fri,  4 Sep 2026 21:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RP59Unor";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18EC10FB4F
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788556582; x=1820092582;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OjwLeziq9jAi8ffgkuWxSEpkuqNGVs1tJO0BfEfqlpQ=;
 b=RP59UnorxnVGHiKURUiE73mfHql4B6Jr0p15u0IryVAuh7XVStq3fcKe
 lzALEsHdqSdVlYDknjTIl0J6ajrZtDb/8JL1fR+8IsIHPFXM133MkSS74
 lGD6D4Cw+Qv17c4Z9e4NPsTTbzhNO/3SJSBgNXzRZ9GdfqBuyrxoXrzNO
 HWz3XD0wrPPuxDPyZP9GXn6AF0GkP84FpSVaEu3d8HjZZ1G+2iV5OoT9+
 SXKQhOOH+8O8IlJx2BGUegya1slpzPIEVD/KbrAc/xGV23Q3uNLr6w08I
 suEy49YOBx6DKHc1hxthGhKJmHu6cpm5MqbTpkp0VhDC58MYT3PcT+NGA g==;
X-CSE-ConnectionGUID: OkISoyB5QQ+5VjQzD1uv6Q==
X-CSE-MsgGUID: sONSpcUdTLqTL9I89T4SAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89096820"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89096820"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:22 -0700
X-CSE-ConnectionGUID: y4V+BTu/QU6Cy4vhtQnoqQ==
X-CSE-MsgGUID: /t6RxFfPSIasqGz3Yqnwhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="267563443"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 23/24] drm/xe: Add modparam to enable / disable ULLS on
 migrate queue
Date: Fri,  4 Sep 2026 14:16:12 -0700
Message-Id: <20260904211613.3934307-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904211613.3934307-1-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
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

Having modparam to enable / disable ULLS on migrate queue will help with
quick experiments.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-26-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 1 +
 drivers/gpu/drm/xe/xe_defaults.h     | 1 +
 drivers/gpu/drm/xe/xe_device.c       | 1 +
 drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
 drivers/gpu/drm/xe/xe_migrate.c      | 2 +-
 drivers/gpu/drm/xe/xe_module.c       | 4 ++++
 drivers/gpu/drm/xe/xe_module.h       | 1 +
 7 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 80f62634fae5..f3f37d116d62 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -222,6 +222,7 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "revid %d\n", xe->info.revid);
 	drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
 	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
+	drm_printf(&p, "ulls_enable %s\n", str_yes_no(xe->info.ulls_enable));
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
 	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
 	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index 0884224ef7c7..9c7e89a169c5 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -14,6 +14,7 @@
 #endif
 
 #define XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
+#define XE_DEFAULT_ULLS_ENABLE			true
 #define XE_DEFAULT_VRAM_BAR_SIZE		0
 #define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
 #define XE_DEFAULT_MAX_VFS			~0
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ade971de1652..9b81759af28a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -520,6 +520,7 @@ static void xe_device_parse_modparam(struct xe_device *xe)
 	xe->atomic_svm_timeslice_ms = 5;
 	xe->min_run_period_lr_ms = 5;
 	xe->info.num_pf_work = xe_modparam.num_pf_work;
+	xe->info.ulls_enable = xe_modparam.ulls_enable;
 	if (xe->info.num_pf_work < 1)
 		xe->info.num_pf_work = 1;
 	else if (xe->info.num_pf_work > XE_PAGEFAULT_WORK_MAX)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 997ac82fd571..fd4560378f5b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -245,6 +245,11 @@ struct xe_device {
 		u8 skip_pcode:1;
 		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
 		u8 needs_shared_vf_gt_wq:1;
+		/**
+		 * @info.ulls_enable: Enable ULLS on migration queue in LR VM
+		 * open
+		 */
+		u8 ulls_enable:1;
 	} info;
 
 	/** @wa_active: keep track of active workarounds */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3e59aeeca614..3bc78f761f23 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -523,7 +523,7 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
 
 	xe_assert(xe, xe->info.has_usm);
 
-	if (!IS_DGFX(xe))
+	if (!IS_DGFX(xe) || !xe->info.ulls_enable)
 		return;
 
 job_alloc:
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 4bc28dfc1992..a8b546550ead 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -23,6 +23,7 @@
 
 struct xe_modparam xe_modparam = {
 	.probe_display =	XE_DEFAULT_PROBE_DISPLAY,
+	.ulls_enable =		XE_DEFAULT_ULLS_ENABLE,
 	.guc_log_level =	XE_DEFAULT_GUC_LOG_LEVEL,
 	.force_probe =		XE_DEFAULT_FORCE_PROBE,
 #ifdef CONFIG_PCI_IOV
@@ -44,6 +45,9 @@ MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched
 		 "[default=" __stringify(XE_DEFAULT_PROBE_DISPLAY) "])");
 #endif
 
+module_param_named(ulls_enable, xe_modparam.ulls_enable, bool, 0444);
+MODULE_PARM_DESC(ulls_enable, "Enable ULLS on migration queue if LR VM open (default: true)");
+
 module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size "
 		 "[default=" __stringify(XE_DEFAULT_VRAM_BAR_SIZE) "])");
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 6272d9e41207..5d88448c298a 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -13,6 +13,7 @@ struct work_struct;
 /* Module modprobe variables */
 struct xe_modparam {
 	bool probe_display;
+	bool ulls_enable;
 	int force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;
-- 
2.34.1

