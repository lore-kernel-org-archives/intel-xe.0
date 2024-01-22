Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232FBC46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96CD10EFC8;
	Mon, 22 Jan 2024 21:26:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863A810EFBD
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705958763; x=1737494763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1EQOFyUMKUmltzqg77nBSshsFV55a/+OAXzbiWyaQ8Y=;
 b=nxPk8IC5RU9Jr/4ZfI0QWUJZfOI5p3+fU9UFTllMxr4xeSOGV0nZdaS5
 lyzXgCGyDM4GUrsHaiAQUhv3EkAQLkVWXHnw1mdVzlysqEqAyucVx2MVs
 /ImQyXUpOMGbD+XYIjARt7N6CsJz+2ryYGpZBS8isujnu1pRmv76YZNA4
 mfIu9aeGzvsQ2exohGdr/mPH63BmLDuHnvG2NNOzJahL0P4yqexSDzU4k
 9m9Aa0AbDW8PHMeAHbp8Z69LB8EWpg/iXlPteh57gUHFJQeeEUZ64/hbf
 yZvqodn1rMJ/6XeI9LvGOD00XJVIWkuAE+ceHJUt6RKJIpAs6gHDFwAwy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432488200"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="432488200"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:26:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1432765"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa004.fm.intel.com with ESMTP; 22 Jan 2024 13:26:02 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 6/9] drm/xe/guc: Check sizing of guc_capture output
Date: Mon, 22 Jan 2024 13:25:54 -0800
Message-Id: <20240122212557.55929-7-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122212557.55929-1-zhanjun.dong@intel.com>
References: <20240122212557.55929-1-zhanjun.dong@intel.com>
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

Add capture output size check function to provide a reasonable
minimum size for error capture region before allocating the shared
buffer.
Add guc capture data structure definition.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c      | 76 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h | 45 ++++++++++++++
 2 files changed, 121 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 7c647ad2cad5..f22cba9db2b0 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -561,6 +561,81 @@ xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size)
 	return 0;
 }
 
+static int
+guc_capture_output_min_size_est(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	int worst_min_size = 0;
+	size_t tmp = 0;
+
+	if (!guc->capture)
+		return -ENODEV;
+
+	/*
+	 * If every single engine-instance suffered a failure in quick succession but
+	 * were all unrelated, then a burst of multiple error-capture events would dump
+	 * registers for every one engine instance, one at a time. In this case, GuC
+	 * would even dump the global-registers repeatedly.
+	 *
+	 * For each engine instance, there would be 1 x guc_state_capture_group_t output
+	 * followed by 3 x guc_state_capture_t lists. The latter is how the register
+	 * dumps are split across different register types (where the '3' are global vs class
+	 * vs instance).
+	 */
+	for_each_hw_engine(hwe, gt, id) {
+		worst_min_size += sizeof(struct guc_state_capture_group_header_t) +
+					 (3 * sizeof(struct guc_state_capture_header_t));
+
+		if (!guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &tmp, true))
+			worst_min_size += tmp;
+
+		if (!guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+					     hwe->class, &tmp, true)) {
+			worst_min_size += tmp;
+		}
+		if (!guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+					     hwe->class, &tmp, true)) {
+			worst_min_size += tmp;
+		}
+	}
+
+	return worst_min_size;
+}
+
+/*
+ * Add on a 3x multiplier to allow for multiple back-to-back captures occurring
+ * before the i915 can read the data out and process it
+ */
+#define GUC_CAPTURE_OVERBUFFER_MULTIPLIER 3
+
+static void check_guc_capture_size(struct xe_guc *guc)
+{
+	int min_size = guc_capture_output_min_size_est(guc);
+	int spare_size = min_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
+	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
+
+	/*
+	 * NOTE: min_size is much smaller than the capture region allocation (DG2: <80K vs 1MB)
+	 * Additionally, its based on space needed to fit all engines getting reset at once
+	 * within the same G2H handler task slot. This is very unlikely. However, if GuC really
+	 * does run out of space for whatever reason, we will see an separate warning message
+	 * when processing the G2H event capture-notification, search for:
+	 * xe_guc_STATE_CAPTURE_EVENT_STATUS_NOSPACE.
+	 */
+	if (min_size < 0)
+		xe_gt_warn(guc_to_gt(guc), "Failed to calculate error state capture buffer minimum size: %d!\n",
+			   min_size);
+	else if (min_size > buffer_size)
+		xe_gt_warn(guc_to_gt(guc), "Error state capture buffer maybe small: %d < %d\n",
+			   buffer_size, min_size);
+	else if (spare_size > buffer_size)
+		xe_gt_dbg(guc_to_gt(guc), "Error state capture buffer lacks spare size: %d < %d (min = %d)\n",
+			  buffer_size, spare_size, min_size);
+}
+
 int xe_guc_capture_init(struct xe_guc *guc)
 {
 	guc->capture = kzalloc(sizeof(*guc->capture), GFP_KERNEL);
@@ -572,6 +647,7 @@ int xe_guc_capture_init(struct xe_guc *guc)
 	INIT_LIST_HEAD(&guc->capture->outlist);
 	INIT_LIST_HEAD(&guc->capture->cachelist);
 
+	check_guc_capture_size(guc);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
index 4bb94ac1ff48..b975a65b64e7 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
@@ -10,6 +10,51 @@
 #include "regs/xe_reg_defs.h"
 #include "xe_guc_fwif.h"
 
+/*
+ * struct __guc_capture_bufstate
+ *
+ * Book-keeping structure used to track read and write pointers
+ * as we extract error capture data from the GuC-log-buffer's
+ * error-capture region as a stream of dwords.
+ */
+struct __guc_capture_bufstate {
+	u32 size;
+	void *data;
+	u32 rd;
+	u32 wr;
+};
+
+/*
+ * struct __guc_capture_parsed_output - extracted error capture node
+ *
+ * A single unit of extracted error-capture output data grouped together
+ * at an engine-instance level. We keep these nodes in a linked list.
+ * See cachelist and outlist below.
+ */
+struct __guc_capture_parsed_output {
+	/*
+	 * A single set of 3 capture lists: a global-list
+	 * an engine-class-list and an engine-instance list.
+	 * outlist in __guc_capture_parsed_output will keep
+	 * a linked list of these nodes that will eventually
+	 * be detached from outlist and attached into to
+	 * i915_gpu_codedump in response to a context reset
+	 */
+	struct list_head link;
+	bool is_partial;
+	u32 eng_class;
+	u32 eng_inst;
+	u32 guc_id;
+	u32 lrca;
+	struct gcap_reg_list_info {
+		u32 vfid;
+		u32 num_regs;
+		struct guc_mmio_reg *regs;
+	} reginfo[GUC_CAPTURE_LIST_TYPE_MAX];
+#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_CAPTURE_LIST_TYPE_GLOBAL)
+#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS)
+};
+
 /*
  * struct guc_debug_capture_list_header / struct guc_debug_capture_list
  *
-- 
2.34.1

