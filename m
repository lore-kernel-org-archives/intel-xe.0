Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D445C624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0CA10F265;
	Wed,  2 Sep 2026 14:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UO6OtFUB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7528410F265
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788360897; x=1819896897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OXyXSWhif0E+K2vFJGyhVxMGUACuYeOW5H/UcYxBgHk=;
 b=UO6OtFUBmTQSB3nGOy3ILqsxLWCRJXpbrOyJUqQrDraFEuU3jt5dLwcG
 YoKZnEiQ+ViIbO8bge2fQDkDlcf4K65WSi2AcSv0rS6dC0gvXvehcYBI7
 xn3oS6sIyOcLpfkFV80KA6paxw8ubn3EXq+EK7nfHv5lonlJqxHCbbnru
 VqakxF3QxHXCQdTCG2C+6Tozn6itwsff6+EWy7gustxEd0MKtWVhhj7ey
 g+DMMJySdkOKXV6QGXzN8I2JDUtpcVSdnGqFFQWJUiGlz39UegR+6JmDt
 EAwStFFnsI9DQWac5Ze2fObQqaIt1f4FIOmtlVGZmuV0OjSAtK/L0CbZx Q==;
X-CSE-ConnectionGUID: 954KDozQTXit0lsvlrwMrA==
X-CSE-MsgGUID: MtjE7tzQTJKX02YYevP4ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92526006"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92526006"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:54:57 -0700
X-CSE-ConnectionGUID: nkeqf1UhRm2yg908uz7ANQ==
X-CSE-MsgGUID: +EezLFp3Qe65fGVaMWpVMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263260008"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:54:54 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH V20 05/15] drm/xe/bo: Make xe_bo_is_user() public
Date: Wed,  2 Sep 2026 20:23:48 +0530
Message-ID: <20260902145343.465686-22-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260902145343.465686-17-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
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

Export xe_bo_is_user() so it can be used by the VRAM page offline
code to distinguish user-created BOs from kernel BOs when deciding
whether a faulty page can be safely purged or requires a full reset.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d30a8411d2a3..c255327669da 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -161,7 +161,13 @@ bool xe_bo_is_vm_bound(struct xe_bo *bo)
 	return !list_empty(&bo->ttm.base.gpuva.list);
 }
 
-static bool xe_bo_is_user(struct xe_bo *bo)
+/**
+ * xe_bo_is_user - Check if BO is user-created
+ * @bo: The BO
+ *
+ * Returns: true if @bo was created by userspace
+ */
+bool xe_bo_is_user(struct xe_bo *bo)
 {
 	return bo->flags & XE_BO_FLAG_USER;
 }
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 90b15fff36c7..eede678ad303 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -601,6 +601,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		  const struct xe_bo_shrink_flags flags,
 		  unsigned long *scanned);
 int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
+bool xe_bo_is_user(struct xe_bo *bo);
 
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
-- 
2.52.0

