Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FDBEE57C4
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 04:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1009110E869;
	Fri,  8 Sep 2023 04:23:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE5A10E863
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 04:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694147036; x=1725683036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5W87a4vgul3C/4pIekYJH889GMguJXROwPIi5myrKxw=;
 b=R0pCCayVKL2KG5O6r5Ywn6514s8K4dJ6XIeZpN8afzqj+STDBmi68+G3
 ZUum/dTMCYBquumD7YAirCEDNSibwNiOXWnifQqK7S18Tsq1u9v/Qj2iC
 x99EVhpSVMwsMkyj+4ac3FAV1fPwvj6PtjqQq8PcF5s4A8Nj62atUawQA
 MoB3qkbOJ5gRgvKQVv6LRBdiQo/ELVc7oZ139wARhVfmUT4CX9P5Whdwa
 F2OdZV+wM/n/aynhe6y9vvJ26JaQnQ7zNm3zMo2R2dapWdXjLWxTe/84Y
 28kP6QmcAOhyUoORN0RgcqFJz0E01nPT+Nvre4FXIZciHoyaJfrvwCa+d g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463935404"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="463935404"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857200759"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="857200759"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:56 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:23:45 -0700
Message-ID: <20230908042348.1592535-15-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
References: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 14/17] drm/xe/oa: Simplify OA configs in uapi
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

In OA uapi, there is no reason to have separate mux/boolean/flex registers
in 'struct drm_xe_oa_config'. The kernel knows ranges of these registers
and can determine which are which when needed without these being provided
through the uapi. Therefore combine the three register arrays into a single
one in the uapi.

Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 60 +++++++++-----------------------
 drivers/gpu/drm/xe/xe_oa_types.h |  8 ++---
 include/uapi/drm/xe_drm.h        | 48 +++++--------------------
 3 files changed, 27 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 3a8684c41c339..3b0358e7b402d 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -88,9 +88,7 @@ static void xe_oa_config_release(struct kref *ref)
 	struct xe_oa_config *oa_config =
 		container_of(ref, typeof(*oa_config), ref);
 
-	kfree(oa_config->flex_regs);
-	kfree(oa_config->b_counter_regs);
-	kfree(oa_config->mux_regs);
+	kfree(oa_config->regs);
 
 	kfree_rcu(oa_config, rcu);
 }
@@ -970,16 +968,14 @@ static struct xe_oa_config_bo *
 __xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_config)
 {
 	struct xe_oa_config_bo *oa_bo;
-	size_t config_length = 0;
+	size_t config_length;
 	struct xe_bb *bb;
 
 	oa_bo = kzalloc(sizeof(*oa_bo), GFP_KERNEL);
 	if (!oa_bo)
 		return ERR_PTR(-ENOMEM);
 
-	config_length += num_lri_dwords(oa_config->mux_regs_len);
-	config_length += num_lri_dwords(oa_config->b_counter_regs_len);
-	config_length += num_lri_dwords(oa_config->flex_regs_len);
+	config_length = num_lri_dwords(oa_config->regs_len);
 	config_length++; /* MI_BATCH_BUFFER_END */
 	config_length = ALIGN(sizeof(u32) * config_length, XE_PAGE_SIZE) / sizeof(u32);
 
@@ -987,9 +983,7 @@ __xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa
 	if (IS_ERR(bb))
 		goto err_free;
 
-	write_cs_mi_lri(bb, oa_config->mux_regs, oa_config->mux_regs_len);
-	write_cs_mi_lri(bb, oa_config->b_counter_regs, oa_config->b_counter_regs_len);
-	write_cs_mi_lri(bb, oa_config->flex_regs, oa_config->flex_regs_len);
+	write_cs_mi_lri(bb, oa_config->regs, oa_config->regs_len);
 
 	oa_bo->bb = bb;
 	oa_bo->oa_config = xe_oa_config_get(oa_config);
@@ -1825,6 +1819,13 @@ static bool xe_oa_is_valid_mux_addr(struct xe_oa *oa, u32 addr)
 		return xe_oa_reg_in_range_table(addr, gen12_oa_mux_regs);
 }
 
+static bool xe_oa_is_valid_config_reg_addr(struct xe_oa *oa, u32 addr)
+{
+	return xe_oa_is_valid_flex_addr(oa, addr) ||
+		xe_oa_is_valid_b_counter_addr(oa, addr) ||
+		xe_oa_is_valid_mux_addr(oa, addr);
+}
+
 static u32 mask_reg_value(u32 reg, u32 val)
 {
 	/*
@@ -1852,9 +1853,6 @@ xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
 	int err;
 	u32 i;
 
-	if (!n_regs || WARN_ON(!is_valid))
-		return NULL;
-
 	oa_regs = kmalloc_array(n_regs, sizeof(*oa_regs), GFP_KERNEL);
 	if (!oa_regs)
 		return ERR_PTR(-ENOMEM);
@@ -1941,9 +1939,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(oa->xe, err))
 		return -EFAULT;
 
-	if ((!arg->mux_regs_ptr || !arg->n_mux_regs) &&
-	    (!arg->boolean_regs_ptr || !arg->n_boolean_regs) &&
-	    (!arg->flex_regs_ptr || !arg->n_flex_regs)) {
+	if (!arg->regs_ptr || !arg->n_regs) {
 		drm_dbg(&oa->xe->drm, "No OA registers given\n");
 		return -EINVAL;
 	}
@@ -1964,38 +1960,16 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 	/* Last character in oa_config->uuid will be 0 because oa_config is kzalloc */
 	memcpy(oa_config->uuid, arg->uuid, sizeof(arg->uuid));
 
-	oa_config->mux_regs_len = arg->n_mux_regs;
-	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_mux_addr,
-				u64_to_user_ptr(arg->mux_regs_ptr),
-				arg->n_mux_regs);
+	oa_config->regs_len = arg->n_regs;
+	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_config_reg_addr,
+				u64_to_user_ptr(arg->regs_ptr),
+				arg->n_regs);
 	if (IS_ERR(regs)) {
 		drm_dbg(&oa->xe->drm, "Failed to create OA config for mux_regs\n");
 		err = PTR_ERR(regs);
 		goto reg_err;
 	}
-	oa_config->mux_regs = regs;
-
-	oa_config->b_counter_regs_len = arg->n_boolean_regs;
-	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_b_counter_addr,
-				u64_to_user_ptr(arg->boolean_regs_ptr),
-				arg->n_boolean_regs);
-	if (IS_ERR(regs)) {
-		drm_dbg(&oa->xe->drm, "Failed to create OA config for b_counter_regs\n");
-		err = PTR_ERR(regs);
-		goto reg_err;
-	}
-	oa_config->b_counter_regs = regs;
-
-	oa_config->flex_regs_len = arg->n_flex_regs;
-	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_flex_addr,
-				u64_to_user_ptr(arg->flex_regs_ptr),
-				arg->n_flex_regs);
-	if (IS_ERR(regs)) {
-		drm_dbg(&oa->xe->drm, "Failed to create OA config for flex_regs\n");
-		err = PTR_ERR(regs);
-		goto reg_err;
-	}
-	oa_config->flex_regs = regs;
+	oa_config->regs = regs;
 
 	err = mutex_lock_interruptible(&oa->metrics_lock);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 126692718c888..ac8b23695cc6e 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -52,12 +52,8 @@ struct xe_oa_config {
 	char uuid[UUID_STRING_LEN + 1];
 	int id;
 
-	const struct xe_oa_reg *mux_regs;
-	u32 mux_regs_len;
-	const struct xe_oa_reg *b_counter_regs;
-	u32 b_counter_regs_len;
-	const struct xe_oa_reg *flex_regs;
-	u32 flex_regs_len;
+	const struct xe_oa_reg *regs;
+	u32 regs_len;
 
 	struct attribute_group sysfs_metric;
 	struct attribute *attrs[2];
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 3c15dfe19f427..64635e060ed3c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1257,52 +1257,20 @@ struct drm_xe_oa_config {
 	char uuid[36];
 
 	/**
-	 * @n_mux_regs:
+	 * @n_regs:
 	 *
-	 * Number of mux regs in &mux_regs_ptr.
+	 * Number of regs in @regs_ptr.
 	 */
-	__u32 n_mux_regs;
+	__u32 n_regs;
 
 	/**
-	 * @n_boolean_regs:
+	 * @regs_ptr:
 	 *
-	 * Number of boolean regs in &boolean_regs_ptr.
+	 * Pointer to tuples of u32 values (register address, value) for OA
+	 * config registers. Expected length of buffer is (2 * sizeof(u32) *
+	 * @n_regs).
 	 */
-	__u32 n_boolean_regs;
-
-	/**
-	 * @n_flex_regs:
-	 *
-	 * Number of flex regs in &flex_regs_ptr.
-	 */
-	__u32 n_flex_regs;
-
-	/**
-	 * @mux_regs_ptr:
-	 *
-	 * Pointer to tuples of u32 values (register address, value) for mux
-	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
-	 * &n_mux_regs).
-	 */
-	__u64 mux_regs_ptr;
-
-	/**
-	 * @boolean_regs_ptr:
-	 *
-	 * Pointer to tuples of u32 values (register address, value) for mux
-	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
-	 * &n_boolean_regs).
-	 */
-	__u64 boolean_regs_ptr;
-
-	/**
-	 * @flex_regs_ptr:
-	 *
-	 * Pointer to tuples of u32 values (register address, value) for mux
-	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
-	 * &n_flex_regs).
-	 */
-	__u64 flex_regs_ptr;
+	__u64 regs_ptr;
 };
 
 /*
-- 
2.41.0

