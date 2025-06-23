Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D03C77B7F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 14:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D1410E3CD;
	Mon, 23 Jun 2025 14:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hv2HAAp3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD0010E1EF
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 14:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750689852; x=1782225852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hfTRV3nUE365F4722YyxlPGDCTjsyM4Pgifhy16644w=;
 b=Hv2HAAp3gTTNr6yJpvhcoYxjtEtISZmxOt5rAedonEW9Qo2wHI0AlVku
 o1DxjupBwrWDfiyOUIdCn7V3ckoieUn28VrHYjqQCgl8FSb3y9GUCgttx
 CmSB+i9BYvHm9UruBvTiYUxDR301uFJLw1x5bY0bRHZltbAqz0kKnYDkM
 dp3S2ndX/HrOWWI2v7Fk0Uq6iD813ssKtfxN7lgU+lTRa8MfpCbU40gla
 9w+sxHN8TuCjNs1jW/GMMgA+5m95EviQDmxokuNQiavjbylhyDBBNu0gs
 YAktbv2KRYbdHGuoL7t4kgWb+jniyulN6Z2oyDUuORqQrSakId5g9cFhn A==;
X-CSE-ConnectionGUID: bZC8jY6lTDKzYXeOXl6//A==
X-CSE-MsgGUID: OXzlrCtjT/SrIp1/pAx/Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52837058"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52837058"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:44:11 -0700
X-CSE-ConnectionGUID: 6dAHdUqYSFeI2cm/VFA/Zg==
X-CSE-MsgGUID: KNR5umyMTk6HLudYxCH4cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="182661942"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:44:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH v2 3/4] drm/xe: Add xe_bo_tt_has_data helper
Date: Mon, 23 Jun 2025 07:45:47 -0700
Message-Id: <20250623144548.2388268-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623144548.2388268-1-matthew.brost@intel.com>
References: <20250623144548.2388268-1-matthew.brost@intel.com>
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

Add xe_bo_tt_has_data helper which determines if a BO has TT data (i.e.,
a BO has SRAM or swap backing store).

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 21 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_bo.h |  2 ++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c93381fa4858..7a412121477e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -766,6 +766,23 @@ static int xe_bo_move_notify(struct xe_bo *bo,
 	return 0;
 }
 
+/**
+ * xe_bo_tt_has_data() - Xe BO has TT data (i.e., Xe BO has SRAM or swap backing
+ * store)
+ *
+ * Helper to determine if a BO has TT data. Useful to determine if copies or
+ * clears are needed on BO when it is moving.
+ *
+ * Return: True if a BO has TT data, False otherwise
+ */
+bool xe_bo_tt_has_data(struct xe_bo *bo)
+{
+	struct ttm_tt *ttm = bo->ttm.ttm;
+
+	return ttm && (ttm_tt_is_populated(ttm) ||
+		       (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
+}
+
 static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		      struct ttm_operation_ctx *ctx,
 		      struct ttm_resource *new_mem,
@@ -801,9 +818,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		return ret;
 	}
 
-	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
-			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
-
+	tt_has_data = xe_bo_tt_has_data(bo);
 	move_lacks_source = !old_mem || (handle_system_ccs ? (!bo->ccs_cleared) :
 					 (!mem_type_is_vram(old_mem_type) && !tt_has_data));
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 02ada1fb8a23..150e98ce6fac 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -374,6 +374,8 @@ void xe_bo_dev_fini(struct xe_bo_dev *bo_device);
 
 struct sg_table *xe_bo_sg(struct xe_bo *bo);
 
+bool xe_bo_tt_has_data(struct xe_bo *bo);
+
 /*
  * xe_sg_segment_size() - Provides upper limit for sg segment size.
  * @dev: device pointer
-- 
2.34.1

