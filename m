Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722ADC44501
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 02:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7E610EBB7;
	Tue, 14 Jul 2026 02:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSWPVrri";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848FC10EBA8
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 02:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783997867; x=1815533867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bfXAms5yq4WiPB1/cHki5r0Xw7l/5rabkHpcyXu+Uyo=;
 b=LSWPVrri1I9iNHGIjBci+jPS90Gwd/C+5jnLt+Fg6nGsYoGhcc7ve10B
 eMUA9Mkj8uERsqqAXrK9QPuU4UW9G+kWgwZ9UEOxB9WdQy9RLHIK1k+I8
 jFlvVPxvBEb3MeG50U3u5fhrkerUpfdzc3iRCpDEBxaCrq574XlFPz+q/
 igmNVGPwAP//ddjyllvejdwLiy2pb2Plqk8/n9bjWCLYhGN2KtDuWEtyV
 +xAbg4n+bPYRdUDsYm7zvnqXtEO5rz6lP/lWgUuNRcX3v0beSPBksb0l4
 g1ujqPeZXb7PRIXAsYOu5nQJw6P0UzPlKdTfyKkyfgHu4zZInMdYagYdX A==;
X-CSE-ConnectionGUID: 2jcGmvcGQtmeEiod3CcP/A==
X-CSE-MsgGUID: Yqx6qdGcThqXHxSplmn7Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84661071"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84661071"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 19:57:46 -0700
X-CSE-ConnectionGUID: IhCrYatjTPmPrb7P5HA8yw==
X-CSE-MsgGUID: sPPKkZ/ORimpMqvt04L2VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255777072"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa007.jf.intel.com with ESMTP; 13 Jul 2026 19:57:45 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH V6 3/7] drm/xe: add XE_BO_FLAG_NEEDS_1G for minimum page-size
 sizing
Date: Tue, 14 Jul 2026 08:27:53 +0530
Message-ID: <20260714025757.3369931-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714025757.3369931-1-naresh.kumar.g@intel.com>
References: <20260714025757.3369931-1-naresh.kumar.g@intel.com>
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

Add XE_BO_FLAG_NEEDS_1G to mark BOs that require 1G minimum page-size
sizing.

Update xe_bo_init_locked() to honor the new flag in the existing
VRAM/stolen-memory minimum page-size sizing path. When
XE_BO_FLAG_NEEDS_1G is set, the BO size is rounded up to 1G. Otherwise,
the existing 2M and 64K sizing behavior is preserved.

If multiple minimum page-size flags are set, the largest requirement
takes precedence: 1G over 2M over 64K.

v3
- commit message reworded

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++++--
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4c80bac67622..9dbf59fad421 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2323,8 +2323,16 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
 	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
 	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
-	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M)))) {
-		size_t align = flags & XE_BO_FLAG_NEEDS_2M ? SZ_2M : SZ_64K;
+	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M |
+		       XE_BO_FLAG_NEEDS_1G)))) {
+		size_t align;
+
+		if (flags & XE_BO_FLAG_NEEDS_1G)
+			align = SZ_1G;
+		else if (flags & XE_BO_FLAG_NEEDS_2M)
+			align = SZ_2M;
+		else
+			align = SZ_64K;
 
 		aligned_size = ALIGN(size, align);
 		if (type != ttm_bo_type_device)
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6340317f7d2e..d5d023cac367 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -52,6 +52,7 @@
 #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
 #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
 #define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
+#define XE_BO_FLAG_NEEDS_1G		BIT(27)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
-- 
2.43.0

