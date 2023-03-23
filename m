Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97717C6FD1C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 12:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9535B10EA7D;
	Thu, 23 Mar 2023 12:00:06 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D675C10E06A
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 11:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679572799; x=1711108799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2W8wBmkq0fJK+EOgQm8B/iSPwQvrXV4YuxhUkHOvnB8=;
 b=nQ4mUL/6qqXOFyOMdBfqLzskboox7zV7A2RJvM/p3HPb3/+/Xes7gbat
 /NpEDMD9dAtL10CUdP8pJMPKWwrgE9ua4Z7fLBrq+r4WFFxWfvyWbhy9G
 AubJQOBmrdfGzfltri0i1N7XHcK56yb6YOVWJZGX6+AD3kA739ClmV8cH
 fyRXIZ+rHFElf0IsYuXzEb6ITOy6R2wIW0D5nSIGoe0RznHac4vtj467e
 nLH87QbhLuYyoXp/Ai+EM3MRCv/IUHIKnRFRlEK6jXDOnmh42uGBmERfv
 rMpYaif0i6TihXye28AktRsIgEOfCE3VCnrSYY9dgJpVOvwRfsDh3b5WU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404352493"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="404352493"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 04:59:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="751463195"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="751463195"
Received: from ehallina-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.2.208])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 04:59:58 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Mar 2023 11:59:21 +0000
Message-Id: <20230323115926.391900-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323115926.391900-1-matthew.auld@intel.com>
References: <20230323115926.391900-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/6] drm/xe: add XE_BO_CREATE_VRAM_MASK
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

So we don't have to keep repeating VRAM0 | VRAM1. Also if there are ever
more instances, then we have less places to update.

Suggested-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 +++-----
 drivers/gpu/drm/xe/xe_bo.h | 2 ++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index ab9cd9286f77..af4200aa949f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -987,8 +987,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	}
 
 	bo->requested_size = size;
-	if (flags & (XE_BO_CREATE_VRAM0_BIT | XE_BO_CREATE_VRAM1_BIT |
-		     XE_BO_CREATE_STOLEN_BIT) &&
+	if (flags & (XE_BO_CREATE_VRAM_MASK | XE_BO_CREATE_STOLEN_BIT) &&
 	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
 	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
 		size = ALIGN(size, SZ_64K);
@@ -1052,8 +1051,7 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 	place->fpfn = start >> PAGE_SHIFT;
 	place->lpfn = end >> PAGE_SHIFT;
 
-	switch (flags & (XE_BO_CREATE_STOLEN_BIT |
-		XE_BO_CREATE_VRAM0_BIT |XE_BO_CREATE_VRAM1_BIT)) {
+	switch (flags & (XE_BO_CREATE_STOLEN_BIT | XE_BO_CREATE_VRAM_MASK)) {
 	case XE_BO_CREATE_VRAM0_BIT:
 		place->mem_type = XE_PL_VRAM0;
 		break;
@@ -1759,7 +1757,7 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 {
 	return bo->ttm.type == ttm_bo_type_device &&
 		!(bo->flags & XE_BO_CREATE_SYSTEM_BIT) &&
-		(bo->flags & (XE_BO_CREATE_VRAM0_BIT | XE_BO_CREATE_VRAM1_BIT));
+		(bo->flags & XE_BO_CREATE_VRAM_MASK);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index f841e74cd417..3c3a09f47fb4 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -17,6 +17,8 @@
 #define XE_BO_CREATE_SYSTEM_BIT		BIT(1)
 #define XE_BO_CREATE_VRAM0_BIT		BIT(2)
 #define XE_BO_CREATE_VRAM1_BIT		BIT(3)
+#define XE_BO_CREATE_VRAM_MASK		(XE_BO_CREATE_VRAM0_BIT | \
+					 XE_BO_CREATE_VRAM1_BIT)
 /* -- */
 #define XE_BO_CREATE_STOLEN_BIT		BIT(4)
 #define XE_BO_CREATE_VRAM_IF_DGFX(gt) \
-- 
2.39.2

