Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26580CCFA1A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77BC10EB82;
	Fri,  7 Nov 2025 18:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSHSnNeo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B7F10EB78
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539209; x=1794075209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y2dNeE9uhAWPLmzoYu40GOgpAFdEpWxJ0bR2W1GPmSg=;
 b=MSHSnNeoKCtaZCsjW7q11NizLj/4AvWRPfBZmFjxTqHFLRbIVY/V69wr
 FOaNsGwk51rycOJoia8+Wv9OwGr7z9sMQGD9XCsUX4RSxtrr93PWXe6tT
 /iao9iCzY8ikaQTquB0WlyIu5eYOJuO40IDJHe0jc1e6EVGBmV6lLoYQF
 dwPoxfTVZXm9EIAolFYQKsm2sCtoTYESnlLBedX0S/GAXC6F2s0Ek1taW
 1yamOgkL3l0HyZX4ImXlfyMbVeAlCi++1doVee3Xfq+/5ByPy4WM74W+G
 Gmb0kf025OSR88lqOkMvLVpuiRL1/0Y2uX1S3l8EfxmPKuYc8531NTVJn w==;
X-CSE-ConnectionGUID: l1DxEoIvRaGtdYrAWqbvzg==
X-CSE-MsgGUID: AkjMJPLkSwSMkCFiqvA6EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64730184"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64730184"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:29 -0800
X-CSE-ConnectionGUID: LusWqpDyRhK0ueSiHtsLmQ==
X-CSE-MsgGUID: 88PRti4IT0OnRFdYwG+WNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271157"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 04/33] drm/xe/forcewake: Create dedicated type for forcewake
 references
Date: Fri,  7 Nov 2025 10:13:20 -0800
Message-ID: <20251107181315.631642-39-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

xe_force_wake_get() currently returns an integer mask of power domains
that were successfully awoken; both this mask and a pointer to the force
wake collection must be passed to xe_force_wake_put() to release the
wake reference.

Create a dedicated structure type to hold both the mask and the
collection pointer.  While this change does little on its own, it will
make it easier for us to add scope-based cleanup of forcewake in the
future.

FIXME:
   For ease of review, this patch contains only the manual changes to
   add the structure and change the get/put function definitions; it
   does not build on its own since the rest of the driver is still
   trying to call the get/put functions with the old signature.  The
   next patch contains the coccinelle-generated changes necessary
   elsewhere in the driver to adapt to the new interface.  The two
   patches will be squashed together when applied, remain separate for
   now to help reviewers.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c          | 23 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_drm_client.c       |  4 ++--
 drivers/gpu/drm/xe/xe_eu_stall.c         |  2 +-
 drivers/gpu/drm/xe/xe_force_wake.c       | 19 ++++++++++++-------
 drivers/gpu/drm/xe/xe_force_wake.h       | 11 ++++++-----
 drivers/gpu/drm/xe/xe_force_wake_types.h | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_oa_types.h         |  2 +-
 drivers/gpu/drm/xe/xe_pmu.c              |  6 ++----
 8 files changed, 57 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index e91da9589c5f..2d858110922b 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -198,7 +198,7 @@ static int forcewake_open(struct inode *inode, struct file *file)
 	struct xe_device *xe = inode->i_private;
 	struct xe_gt *gt;
 	u8 id, last_gt;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	xe_pm_runtime_get(xe);
 	for_each_gt(gt, xe, id) {
@@ -213,10 +213,19 @@ static int forcewake_open(struct inode *inode, struct file *file)
 
 err_fw_get:
 	for_each_gt(gt, xe, id) {
+		struct xe_force_wake_ref all_fw_ref;
+
+		/*
+		 * A bit of a hack since we didn't save the actual forcewake
+		 * reference above.
+		 */
+		all_fw_ref.fw = gt_to_fw(gt);
+		all_fw_ref.domains = XE_FORCEWAKE_ALL;
+
 		if (id < last_gt)
-			xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+			xe_force_wake_put(all_fw_ref);
 		else if (id == last_gt)
-			xe_force_wake_put(gt_to_fw(gt), fw_ref);
+			xe_force_wake_put(fw_ref);
 		else
 			break;
 	}
@@ -228,11 +237,15 @@ static int forcewake_open(struct inode *inode, struct file *file)
 static int forcewake_release(struct inode *inode, struct file *file)
 {
 	struct xe_device *xe = inode->i_private;
+	struct xe_force_wake_ref all_fw_ref;
 	struct xe_gt *gt;
 	u8 id;
 
-	for_each_gt(gt, xe, id)
-		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	all_fw_ref.domains = XE_FORCEWAKE_ALL;
+	for_each_gt(gt, xe, id) {
+		all_fw_ref.fw = gt_to_fw(gt);
+		xe_force_wake_put(all_fw_ref);
+	}
 	xe_pm_runtime_put(xe);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index f931ff9b1ec0..60a6ea7c88e4 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -287,7 +287,7 @@ static struct xe_hw_engine *any_engine(struct xe_device *xe)
 
 static bool force_wake_get_any_engine(struct xe_device *xe,
 				      struct xe_hw_engine **phwe,
-				      unsigned int *pfw_ref)
+				      struct xe_force_wake_ref *pfw_ref)
 {
 	enum xe_force_wake_domains domain;
 	unsigned int fw_ref;
@@ -322,7 +322,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	struct xe_hw_engine *hwe;
 	struct xe_exec_queue *q;
 	u64 gpu_timestamp;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	/*
 	 * RING_TIMESTAMP registers are inaccessible in VF mode.
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 97dfb7945b7a..8b3da9ae6888 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -49,7 +49,7 @@ struct xe_eu_stall_data_stream {
 	wait_queue_head_t poll_wq;
 	size_t data_record_size;
 	size_t per_xecore_buf_size;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	struct xe_gt *gt;
 	struct xe_bo *bo;
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index c59a9b330697..2e675536b36e 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -169,11 +169,12 @@ static int domain_sleep_wait(struct xe_gt *gt,
  * Return: opaque reference to woken domains or zero if none of requested
  * domains were awake.
  */
-unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
-					    enum xe_force_wake_domains domains)
+struct xe_force_wake_ref __must_check xe_force_wake_get(struct xe_force_wake *fw,
+							enum xe_force_wake_domains domains)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
+	struct xe_force_wake_ref fw_ref;
 	unsigned int ref_incr = 0, awake_rqst = 0, awake_failed = 0;
 	unsigned int tmp, ref_rqst;
 	unsigned long flags;
@@ -208,7 +209,10 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 	if (domains == XE_FORCEWAKE_ALL && ref_incr == fw->initialized_domains)
 		ref_incr |= XE_FORCEWAKE_ALL;
 
-	return ref_incr;
+	fw_ref.fw = fw;
+	fw_ref.domains = ref_incr;
+
+	return fw_ref;
 }
 
 /**
@@ -221,8 +225,9 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
  * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
  * Warns in case of timeout of ack from domain.
  */
-void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
+void xe_force_wake_put(struct xe_force_wake_ref fw_ref)
 {
+	struct xe_force_wake *fw = fw_ref.fw;
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
 	unsigned int tmp, sleep = 0;
@@ -233,14 +238,14 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 	 * Avoid unnecessary lock and unlock when the function is called
 	 * in error path of individual domains.
 	 */
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return;
 
 	if (xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		fw_ref = fw->initialized_domains;
+		fw_ref.domains = fw->initialized_domains;
 
 	spin_lock_irqsave(&fw->lock, flags);
-	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
+	for_each_fw_domain_masked(domain, fw_ref.domains, fw, tmp) {
 		xe_gt_assert(gt, domain->ref);
 
 		if (!--domain->ref) {
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 0e3e84bfa51c..86e9bca7cac9 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -15,9 +15,9 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
 			   struct xe_force_wake *fw);
 void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
-unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
-					    enum xe_force_wake_domains domains);
-void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
+struct xe_force_wake_ref __must_check xe_force_wake_get(struct xe_force_wake *fw,
+							enum xe_force_wake_domains domains);
+void xe_force_wake_put(struct xe_force_wake_ref fw_ref);
 
 static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
@@ -56,9 +56,10 @@ xe_force_wake_assert_held(struct xe_force_wake *fw,
  * Return: true if domain is refcounted.
  */
 static inline bool
-xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains domain)
+xe_force_wake_ref_has_domain(struct xe_force_wake_ref fw_ref,
+			     enum xe_force_wake_domains domain)
 {
-	return fw_ref & domain;
+	return fw_ref.domains & domain;
 }
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index 9cfa28faf7bc..26df4adba4c5 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -107,4 +107,19 @@ struct xe_force_wake {
 	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
 };
 
+/**
+ * struct xe_force_wake_ref - Xe force wake reference
+ *
+ * Represents a wakeref for a subset of the power domains belonging to an
+ * xe_force_wake collection.  Returned by xe_force_wake_get() and passed
+ * to xe_force_wake_put().
+ */
+struct xe_force_wake_ref {
+	/** @fw: back pointer to force wake collection */
+	struct xe_force_wake *fw;
+
+	/** @domains: mask of individual domains held by this reference */
+	unsigned int domains;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index cf080f412189..84bd5018d0f3 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -266,6 +266,6 @@ struct xe_oa_stream {
 	struct xe_sync_entry *syncs;
 
 	/** @fw_ref: Forcewake reference */
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 };
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index c63335eb69e5..dbd95327f9fc 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -214,12 +214,10 @@ static bool event_param_valid(struct perf_event *event)
 static void xe_pmu_event_destroy(struct perf_event *event)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
-	struct xe_gt *gt;
-	unsigned int *fw_ref = event->pmu_private;
+	struct xe_force_wake_ref *fw_ref = event->pmu_private;
 
 	if (fw_ref) {
-		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
-		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
+		xe_force_wake_put(*fw_ref);
 		kfree(fw_ref);
 		event->pmu_private = NULL;
 	}
-- 
2.51.1

