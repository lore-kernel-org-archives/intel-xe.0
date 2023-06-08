Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF540C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 05:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B6110E587;
	Thu,  8 Jun 2023 05:03:25 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C75D10E576
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 05:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686200604; x=1717736604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7aMQ3n2E4PBkuW06XK58Yk75ugFaHitScNvuFYW1k1Q=;
 b=PkYbv5pd9FxlkJfGKSEZ3phZ2a+LsbEy9rPdrWand9fOzoRhC00igAKd
 6+li8wzoJZvegDX5ZC9Tyo0Eu4J4XVSPqGyM3Q2m30wW3E+E9VDoRycy1
 fgxLv8sbZgPz9+t57E/jwP4TrQi3TDZNkAFg5oYkyD2FgP3sZyZvGg8ww
 EJ7f4bRa/uJRg9fVW2McsmMvbwcbpsXxLS7/tfYA7dxz8aI7zWDPQhQNp
 M4LHs4Nxx9it9KmcdLzWSQrgSDrPW/7bkfuc6pAIpIdtvSwlFcwV7spBc
 ae76KWlDcneYJ+dJkolX4HzYx7w/kvJbImd8ROxrYt01GO/5WD/rGg+h1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354692403"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="354692403"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 22:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="822450165"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="822450165"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 22:03:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  7 Jun 2023 22:03:32 -0700
Message-Id: <20230608050333.37581-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608050333.37581-1-matthew.brost@intel.com>
References: <20230608050333.37581-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Move XE_PTE_FLAG_READ_ONLY to
 xe_vm_types.h
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

XE_PTE_FLAG_READ_ONLY is specific to struct xe_vma, move it from xe_bo.h
to xe_vm_types.h to reflect that.

Signed-off-vy: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h       | 2 --
 drivers/gpu/drm/xe/xe_vm_types.h | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 552fe073e9c5..dd3d448fee0b 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -65,8 +65,6 @@
 #define XE_PAGE_PRESENT			BIT_ULL(0)
 #define XE_PAGE_RW			BIT_ULL(1)
 
-#define XE_PTE_FLAG_READ_ONLY		BIT(0)
-
 #define XE_PL_SYSTEM		TTM_PL_SYSTEM
 #define XE_PL_TT		TTM_PL_TT
 #define XE_PL_VRAM0		TTM_PL_VRAM
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 76af6ac0fa84..6daddd29d416 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -30,6 +30,7 @@ struct xe_vma {
 	/** @end: end address of this VMA within its address domain */
 	u64 end;
 	/** @pte_flags: pte flags for this VMA */
+#define XE_PTE_FLAG_READ_ONLY		BIT(0)
 	u32 pte_flags;
 
 	/** @bo: BO if not a userptr, must be NULL is userptr */
-- 
2.34.1

