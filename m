Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C6DC87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 15:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A9B10E9EB;
	Fri, 25 Jul 2025 15:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJrivJ2E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC13910E9EA
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753458041; x=1784994041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zNq8ixD7mwv/LwhME3Khzuu+PnlZ03M+hzM5mHRQdmg=;
 b=GJrivJ2E34/IVcNv9BLMfUoQW8161FFB9O8o/du7Wf3zCFAY5AZvlVSL
 A91HLiJHQvAmlsRMG+2i6Lof6wlKCR/LTX0LNRhkpHiPmpDItlYz0I+dh
 WziBmXK4oJXCZY9c7CJyN8lJIO3XmEmwBcmhmG19QW4HZlYHBt8t3rGkj
 3thTWZbn6Uvw/4jv4id06Tydo+Zojx0WWmvMvNSpr1lVvdA6IeXocFPLu
 vvXkwRC3Z1JY53X6zXpAzAiPe+9mxNTYiYhZwURDUvL3/QSufXHlOjiyS
 w6uuz9kZcB1a+NAWjUepxsrCxIw+IYbHVZe4bjwYNZyJ4LVymbSd0+Tr4 g==;
X-CSE-ConnectionGUID: ThAVYaHUQBCIZx97ZUanpQ==
X-CSE-MsgGUID: 5z+mQeF9Thyd1k768XV1OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="54879423"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="54879423"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 08:40:41 -0700
X-CSE-ConnectionGUID: wi3P67K5SCSxlUgy+fC7/Q==
X-CSE-MsgGUID: 3bEGT5IKQnC7rocKfHgNRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="165503691"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.200])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 08:40:40 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 6/6] drm/xe/svm: Migrate folios when possible
Date: Fri, 25 Jul 2025 17:39:30 +0200
Message-ID: <20250725154011.2807655-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725154011.2807655-1-francois.dugast@intel.com>
References: <20250725154011.2807655-1-francois.dugast@intel.com>
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

The DMA mapping can now correspond to a folio (order > 0), so move the
iterator by the number of pages in the folio in order to migrate all
pages at once. This will improve efficiency compared to migrating pages
one by one.

For this to work, the BOs must be contiguous in memory.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c  | 2 ++
 drivers/gpu/drm/xe/xe_svm.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index ffca1cea5585..59994a978a8c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -200,6 +200,8 @@ static bool force_contiguous(u32 bo_flags)
 	else if (bo_flags & XE_BO_FLAG_PINNED &&
 		 !(bo_flags & XE_BO_FLAG_PINNED_LATE_RESTORE))
 		return true; /* needs vmap */
+	else if (bo_flags & XE_BO_FLAG_CPU_ADDR_MIRROR)
+		return true;
 
 	/*
 	 * For eviction / restore on suspend / resume objects pinned in VRAM
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 1d097e76aabc..2759db5f7407 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -382,6 +382,11 @@ static int xe_svm_copy(struct page **pages,
 				pos = i;
 			}
 
+			if (pagemap_addr[i].order) {
+				i += NR_PAGES(pagemap_addr[i].order);
+				last = (i + 1) == npages;
+			}
+
 			match = vram_addr + PAGE_SIZE * (i - pos) == __vram_addr;
 		}
 
-- 
2.43.0

