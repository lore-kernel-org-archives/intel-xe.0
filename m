Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A892BE7717C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 18:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC9310EF72;
	Thu,  5 Dec 2024 18:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJmkfGdu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A4210EF6A
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 18:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733422983; x=1764958983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fspHLFv8aH61M3Y188KjzouQnJ6HNCjgRiqfxysQHL0=;
 b=EJmkfGduHdmFv9vXYLTy0hL2ya4EV9QwkYa+trzDS/Wv9kjRN9I6ouX3
 mylUuBKbGl7w7PakJyVlaJsOJI4L3oVg/EilX3uzzfaBANqww+OEzMuI4
 nL7jcrWkRrRcS9CJWopCHULZo70jMACVjWjTRPcyBH4cCVpcyq42He4Yh
 nM65W55qldOaD7jqNZyVMJj9OsuM+0FxxKt/wqKsxlVk3waw1CQS9uY0c
 8OS/Eg8+JMHPi7i1tWw6be+iRCOVy56ButYQ31+bG87a/uFpfQaGs2znz
 jFdCjlcEFHnY0qAaL/1yWANXZ9xUtrV+ATtfGtGExkhzlqYuUPltHJm8A Q==;
X-CSE-ConnectionGUID: sc9lqkTKSLqvEAQ8zIT/OQ==
X-CSE-MsgGUID: lNzS5B3oRdS+RnrLPpCzTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33083524"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="33083524"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:23:02 -0800
X-CSE-ConnectionGUID: WCOe9lzAQyOBiAvwRySNmQ==
X-CSE-MsgGUID: rK5z5ZocTSiNBDTt70LbHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94375114"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:23:02 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, ashutosh.dixit@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/5] drm/xe/reg_sr: Remove register pool
Date: Thu,  5 Dec 2024 10:22:36 -0800
Message-ID: <20241205182240.3463027-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205182240.3463027-1-lucas.demarchi@intel.com>
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
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

That pool implementation doesn't really work: if the krealloc happens to
move the memory and return another address, the entries in the xarray
become invalid, leading to use-after-free later:

	BUG: KASAN: slab-use-after-free in xe_reg_sr_apply_mmio+0x570/0x760 [xe]
	Read of size 4 at addr ffff8881244b2590 by task modprobe/2753

	Allocated by task 2753:
	 kasan_save_stack+0x39/0x70
	 kasan_save_track+0x14/0x40
	 kasan_save_alloc_info+0x37/0x60
	 __kasan_kmalloc+0xc3/0xd0
	 __kmalloc_node_track_caller_noprof+0x200/0x6d0
	 krealloc_noprof+0x229/0x380

Simplify the code to fix the bug. A better pooling strategy may be added
back later if needed.

Fixes: 6f9f4763bc94 ("drm/xe/reg_sr: Remove register pool")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c       | 31 ++++++----------------------
 drivers/gpu/drm/xe/xe_reg_sr_types.h |  6 ------
 2 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index e1a0e27cda14c..c13123008e903 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -27,46 +27,27 @@
 #include "xe_reg_whitelist.h"
 #include "xe_rtp_types.h"
 
-#define XE_REG_SR_GROW_STEP_DEFAULT	16
-
 static void reg_sr_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_reg_sr *sr = arg;
+	struct xe_reg_sr_entry *entry;
+	unsigned long reg;
+
+	xa_for_each(&sr->xa, reg, entry)
+		kfree(entry);
 
 	xa_destroy(&sr->xa);
-	kfree(sr->pool.arr);
-	memset(&sr->pool, 0, sizeof(sr->pool));
 }
 
 int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe)
 {
 	xa_init(&sr->xa);
-	memset(&sr->pool, 0, sizeof(sr->pool));
-	sr->pool.grow_step = XE_REG_SR_GROW_STEP_DEFAULT;
 	sr->name = name;
 
 	return drmm_add_action_or_reset(&xe->drm, reg_sr_fini, sr);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_reg_sr_init);
 
-static struct xe_reg_sr_entry *alloc_entry(struct xe_reg_sr *sr)
-{
-	if (sr->pool.used == sr->pool.allocated) {
-		struct xe_reg_sr_entry *arr;
-
-		arr = krealloc_array(sr->pool.arr,
-				     ALIGN(sr->pool.allocated + 1, sr->pool.grow_step),
-				     sizeof(*arr), GFP_KERNEL);
-		if (!arr)
-			return NULL;
-
-		sr->pool.arr = arr;
-		sr->pool.allocated += sr->pool.grow_step;
-	}
-
-	return &sr->pool.arr[sr->pool.used++];
-}
-
 static bool compatible_entries(const struct xe_reg_sr_entry *e1,
 			       const struct xe_reg_sr_entry *e2)
 {
@@ -112,7 +93,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 		return 0;
 	}
 
-	pentry = alloc_entry(sr);
+	pentry = kmalloc(sizeof(*pentry), GFP_KERNEL);
 	if (!pentry) {
 		ret = -ENOMEM;
 		goto fail;
diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
index ad48a52b824a1..ebe11f237fa26 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
@@ -20,12 +20,6 @@ struct xe_reg_sr_entry {
 };
 
 struct xe_reg_sr {
-	struct {
-		struct xe_reg_sr_entry *arr;
-		unsigned int used;
-		unsigned int allocated;
-		unsigned int grow_step;
-	} pool;
 	struct xarray xa;
 	const char *name;
 
-- 
2.47.0

