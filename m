Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AE7C25B67
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 07:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229B110E955;
	Fri, 27 Oct 2023 07:59:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B23410E955
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698393585; x=1729929585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wpLnMyfVwJCT+pmpeCNv44gnoosrHjLGHYL0R2wkcPg=;
 b=f1/m/jf1umTm+tdod240vzMPT3aFYbkOwYh1RF8ANzawo4hwTgY3QCmb
 4+sBzTmPLtCI1Btm1ur4m9o2FN7Pf3xBoEeMk5yPYfiggeP1qlLaFZZOx
 dlT4GINMXfiVwyT72dcvYxOXGY8ACi9++xJvWeFolu+DSkbTzOKLt3Ttf
 vNtxQLlIbO1DmXbRQCXKjt1hmmYhNbnLqYrqTJNBHb91/ihfEAPCglRVA
 YORk+4zadUEJg+ECfkeiNCvCbNLdy9sjmX6WWtmSj1IrKGrkGVl57552X
 ES3PZmE2qslGzXB9fz0Tb7kayVrvvFDz2w2ae4sLPfsBMprgvL7huX7NE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391603727"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="391603727"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794510149"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="794510149"
Received: from inyestex-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.212.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:59:43 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 10:58:53 +0300
Message-Id: <20231027075918.2206862-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 06/31] drm/i915/display: Dump also display
 parameters
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

GPU error dump contained all module parameters. If we are moving
display parameters to intel_display_params.[ch] they are not dumped
into GPU error dump. This patch is adding moved display parameters
back to GPU error dump. Display parameters are also included in
i915_capabilities

v2: Add parameters to i915_capabilities as well

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231024124109.384973-3-jouni.hogander@intel.com
(cherry picked from commit 7a61a6aa59e479ee22a859fe4054973d3aa6c640)
---
 .../drm/i915/display/intel_display_params.c   | 57 +++++++++++++++++++
 .../drm/i915/display/intel_display_params.h   |  3 +
 drivers/gpu/drm/i915/i915_debugfs.c           |  3 +
 drivers/gpu/drm/i915/i915_gpu_error.c         |  3 +
 drivers/gpu/drm/i915/i915_gpu_error.h         |  2 +
 5 files changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
index 91953ae27144..11ee73a98b5b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
@@ -27,6 +27,63 @@ static struct intel_display_params intel_display_modparams __read_mostly = {
  * debugfs mode to 0.
  */
 
+__maybe_unused
+static void _param_print_bool(struct drm_printer *p, const char *driver_name,
+			      const char *name, bool val)
+{
+	drm_printf(p, "%s.%s=%s\n", driver_name, name, str_yes_no(val));
+}
+
+__maybe_unused
+static void _param_print_int(struct drm_printer *p, const char *driver_name,
+			     const char *name, int val)
+{
+	drm_printf(p, "%s.%s=%d\n", driver_name, name, val);
+}
+
+__maybe_unused
+static void _param_print_uint(struct drm_printer *p, const char *driver_name,
+			      const char *name, unsigned int val)
+{
+	drm_printf(p, "%s.%s=%u\n", driver_name, name, val);
+}
+
+__maybe_unused
+static void _param_print_ulong(struct drm_printer *p, const char *driver_name,
+			       const char *name, unsigned long val)
+{
+	drm_printf(p, "%s.%s=%lu\n", driver_name, name, val);
+}
+
+__maybe_unused
+static void _param_print_charp(struct drm_printer *p, const char *driver_name,
+			       const char *name, const char *val)
+{
+	drm_printf(p, "%s.%s=%s\n", driver_name, name, val);
+}
+
+#define _param_print(p, driver_name, name, val)			\
+	_Generic(val,						\
+		 bool : _param_print_bool,			\
+		 int : _param_print_int,			\
+		 unsigned int : _param_print_uint,		\
+		 unsigned long : _param_print_ulong,		\
+		 char * : _param_print_charp)(p, driver_name, name, val)
+
+/**
+ * intel_display_params_dump - dump intel display modparams
+ * @i915: i915 device
+ * @p: the &drm_printer
+ *
+ * Pretty printer for i915 modparams.
+ */
+void intel_display_params_dump(struct drm_i915_private *i915, struct drm_printer *p)
+{
+#define PRINT(T, x, ...) _param_print(p, i915->drm.driver->name, #x, i915->display.params.x);
+	INTEL_DISPLAY_PARAMS_FOR_EACH(PRINT);
+#undef PRINT
+}
+
 __maybe_unused static void _param_dup_charp(char **valp)
 {
 	*valp = kstrdup(*valp ? *valp : "", GFP_ATOMIC);
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index 9f4f45d410a3..eac66042da4d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -7,6 +7,7 @@
 #define _INTEL_DISPLAY_PARAMS_H_
 
 struct drm_printer;
+struct drm_i915_private;
 
 /*
  * Invoke param, a function-like macro, for each intel display param, with
@@ -28,6 +29,8 @@ struct intel_display_params {
 };
 #undef MEMBER
 
+void intel_display_params_dump(struct drm_i915_private *i915,
+			       struct drm_printer *p);
 void intel_display_params_copy(struct intel_display_params *dest);
 void intel_display_params_free(struct intel_display_params *params);
 
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index e9b79c2c37d8..af0077f6a6d0 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -32,6 +32,8 @@
 
 #include <drm/drm_debugfs.h>
 
+#include "display/intel_display_params.h"
+
 #include "gem/i915_gem_context.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_buffer_pool.h"
@@ -74,6 +76,7 @@ static int i915_capabilities(struct seq_file *m, void *data)
 
 	kernel_param_lock(THIS_MODULE);
 	i915_params_dump(&i915->params, &p);
+	intel_display_params_dump(i915, &p);
 	kernel_param_unlock(THIS_MODULE);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index b4e31e59c799..8275f9b6a47d 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -660,6 +660,7 @@ static void err_print_params(struct drm_i915_error_state_buf *m,
 	struct drm_printer p = i915_error_printer(m);
 
 	i915_params_dump(params, &p);
+	intel_display_params_dump(m->i915, &p);
 }
 
 static void err_print_pciid(struct drm_i915_error_state_buf *m,
@@ -1027,6 +1028,7 @@ static void i915_vma_coredump_free(struct i915_vma_coredump *vma)
 static void cleanup_params(struct i915_gpu_coredump *error)
 {
 	i915_params_free(&error->params);
+	intel_display_params_free(&error->display_params);
 }
 
 static void cleanup_uc(struct intel_uc_coredump *uc)
@@ -1988,6 +1990,7 @@ static void capture_gen(struct i915_gpu_coredump *error)
 	error->suspend_count = i915->suspend_count;
 
 	i915_params_copy(&error->params, &i915->params);
+	intel_display_params_copy(&error->display_params);
 	memcpy(&error->device_info,
 	       INTEL_INFO(i915),
 	       sizeof(error->device_info));
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index 9f5971f5e980..4ce227f7e1e1 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -15,6 +15,7 @@
 #include <drm/drm_mm.h>
 
 #include "display/intel_display_device.h"
+#include "display/intel_display_params.h"
 #include "gt/intel_engine.h"
 #include "gt/intel_gt_types.h"
 #include "gt/uc/intel_uc_fw.h"
@@ -214,6 +215,7 @@ struct i915_gpu_coredump {
 	struct intel_display_runtime_info display_runtime_info;
 	struct intel_driver_caps driver_caps;
 	struct i915_params params;
+	struct intel_display_params display_params;
 
 	struct intel_overlay_error_state *overlay;
 
-- 
2.34.1

