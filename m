Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277CFC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 21:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DF51121C9;
	Mon, 18 Mar 2024 21:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="bjrHeknU";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F1D1121C9
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 21:08:57 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1710796129; bh=NBeFyHAJ050stmLFss1BIUpqxbyDNQUjcm1zeGVWJh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bjrHeknUvY39mZSsXiHUf0BrM5yJY5y79zpoh3NbJyCjWu6jNr0nag8V+gaZiovBJ
 MsjlWbYAklkbQxNdbiaiC+8WCS846AaYsHvv5fDNyJ8irzX3mMWSuSp3LqotpGLShD
 h1cJNQ0sJ8ir2o8Zj9/3Cb/Mhp6YJdx18Dt73DIlTbb1HybSbnnkDjpWw0M3f/jgwU
 EfmF3skBNwCr/GVjWOINaGCuk7kCc4NTo/OiFJhwTDI/RkLROb2jA9vEo6+TFjpQ3j
 H6erH76QxcsJVkkpFrOITSqzWZjG7+Ylu/WyBsgRTSmq1pkbQp37kmOiILb3cHMyRd
 6oPqbyw0U7DLg==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 SMTP id 42IL8hoS470958; Mon, 18 Mar 2024 23:08:43 +0200
Date: Mon, 18 Mar 2024 23:08:43 +0200
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Himanshu Somaiya <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 4/6] drm/xe: Force busted state and block GT reset upon
 any GPU hang
Message-ID: <ojdiuuzxk26bkj3bb6tss5nruqtuqwjjs2qgkqnvp76nolsiuq@726rslks5jsy>
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
 <20240315140108.217862-4-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240315140108.217862-4-rodrigo.vivi@intel.com>
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

On 15.03.2024 10:01, Rodrigo Vivi wrote:
>In many validation situations when debugging GPU Hangs,
>it is useful to preserve the GT situation from the moment
>that the timeout occurred.
>
>This patch introduces a module parameter that could be used
>on situations like this.
>
>If xe.busted module parameter is set to 2, Xe will be declared
>busted on every single execution timeout (a.k.a. GPU hang) right
>after devcoredump snapshot capture and without attempting any
>kind of GT reset and blocking entirely any kind of execution.
>
>v2: Really block gt_reset from guc side. (Lucas)
>    s/wedged/busted (Lucas)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c     | 30 ++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_device.h     | 13 +------------
> drivers/gpu/drm/xe/xe_guc_ads.c    |  7 +++++++
> drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
> drivers/gpu/drm/xe/xe_module.c     |  5 +++++
> drivers/gpu/drm/xe/xe_module.h     |  1 +
> 6 files changed, 48 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index d02e59fb49eb..e28e3628744f 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -774,3 +774,33 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> {
> 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
> }
>+
>+/**
>+ * xe_device_declare_busted - Declare device busted
>+ * @xe: xe device instance
>+ *
>+ * This is a final state that can only be cleared with a module
>+ * re-probe (unbind + bind).
>+ * In this state every IOCTL will be blocked so the GT cannot be used.
>+ * In general it will be called upon any critical error such as gt reset
>+ * failure or guc loading failure.
>+ * If xe.busted module parameter is set to 2, this function will be called
>+ * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>+ * snapshot capture. In this mode, GT reset won't be attempted so the state of
>+ * the issue is preserved for further debugging.
>+ */
>+void xe_device_declare_busted(struct xe_device *xe)
>+{
>+	if (xe_modparam.busted_mode == 0)
>+		return;
>+
>+	if (!atomic_xchg(&xe->busted, 1))
>+		drm_err(&xe->drm,
>+			"CRITICAL: Xe has declared device %s as busted.\n"
>+			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
>+			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
>+			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
>+			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>+			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
>+			dev_name(xe->drm.dev));
>+}
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index 2c6d9b77821a..e6edf2d3ee4a 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -181,17 +181,6 @@ static inline bool xe_device_busted(struct xe_device *xe)
> 	return atomic_read(&xe->busted);
> }
>
>-static inline void xe_device_declare_busted(struct xe_device *xe)
>-{
>-	if (!atomic_xchg(&xe->busted, 1))
>-		drm_err(&xe->drm,
>-			"CRITICAL: Xe has declared device %s as busted.\n"
>-			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
>-			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
>-			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
>-			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>-			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
>-			dev_name(xe->drm.dev));
>-}
>+void xe_device_declare_busted(struct xe_device *xe);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index 6ad4c1a90a78..ecf45289b187 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -18,6 +18,7 @@
> #include "xe_lrc.h"
> #include "xe_map.h"
> #include "xe_mmio.h"
>+#include "xe_module.h"
> #include "xe_platform_types.h"
>
> /* Slack of a few additional entries per engine */
>@@ -312,10 +313,16 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>
> static void guc_policies_init(struct xe_guc_ads *ads)
> {
>+	u32 global_flags = 0;
>+
> 	ads_blob_write(ads, policies.dpc_promote_time,
> 		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
> 	ads_blob_write(ads, policies.max_num_work_items,
> 		       GLOBAL_POLICY_MAX_NUM_WI);
>+
>+	if (xe_modparam.busted_mode == 2)
>+		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;

hi,
you don't use the local global_flags, I think you meant: 'policies.global_flags |= ..'

>+
> 	ads_blob_write(ads, policies.global_flags, 0);
> 	ads_blob_write(ads, policies.is_valid, 1);
> }
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index ee663683e9eb..3f3160373631 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -34,6 +34,7 @@
> #include "xe_macros.h"
> #include "xe_map.h"
> #include "xe_mocs.h"
>+#include "xe_module.h"
> #include "xe_ring_ops_types.h"
> #include "xe_sched_job.h"
> #include "xe_trace.h"
>@@ -950,6 +951,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	simple_error_capture(q);
> 	xe_devcoredump(job);
>
>+	if (xe_modparam.busted_mode == 2)
>+		xe_device_declare_busted(xe);
>+
> 	trace_xe_sched_job_timedout(job);
>
> 	/* Kill the run_job entry point */
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 110b69864656..f81970e8d713 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
> 	.enable_display = true,
> 	.guc_log_level = 5,
> 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>+	.busted_mode = 1,
> 	/* the rest are 0 by default */
> };
>
>@@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> MODULE_PARM_DESC(force_probe,
> 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>
>+module_param_named_unsafe(busted_mode, xe_modparam.busted_mode, int, 0600);
>+MODULE_PARM_DESC(busted_mode,
>+		 "Module's default policy for the busted mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
>+
> struct init_funcs {
> 	int (*init)(void);
> 	void (*exit)(void);
>diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>index 88ef0e8b2bfd..bbf88c34e4f4 100644
>--- a/drivers/gpu/drm/xe/xe_module.h
>+++ b/drivers/gpu/drm/xe/xe_module.h
>@@ -18,6 +18,7 @@ struct xe_modparam {
> 	char *huc_firmware_path;
> 	char *gsc_firmware_path;
> 	char *force_probe;
>+	int busted_mode;
> };
>
> extern struct xe_modparam xe_modparam;
>-- 
>2.44.0
>
