Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EECC87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 14:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FBE10E475;
	Tue,  5 Aug 2025 14:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7uOJBE7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92E910E48B
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 14:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754402480; x=1785938480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vk5Xs4l2C9H+epVRjybHvMyl1s8UjGl9XvfNTwWNFPs=;
 b=J7uOJBE7e1nJhSKxJM/pjUezSBr/CCE6476QeoO/gNtzMJKmfpSR+Kov
 4FKj/VGwWxNDKSmew0OwBl4Ix0S7KPS8uIVM+xdMqMeaRr1UxWKnZ1tmP
 LOn9sKDW1NXpoIUIp1bFmOLintv+Yu/CqsrwpftwBBu/+QcslksM8UBBO
 qh6O+VcdNPOWsKdytgf8L/Ue9o5p7PBLLVekrSZ0zv6Z2lHi2NUukHjve
 AJxutu7zYnkJLZYqcXXxGv/fKpRyHU9SuKRhndMVyo6Q4OXMxods4cibA
 jkDgAM4NqYLhZxS8B6Du2rNROjSeAL8VPOZRaWQkfitcnfkqI5EnJiIf6 w==;
X-CSE-ConnectionGUID: waCyXwTXQNWlM1pcO0L/qg==
X-CSE-MsgGUID: qYYFMtYjQCqgmmE7XQAZ1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="82145242"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="82145242"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:01:20 -0700
X-CSE-ConnectionGUID: blfryYcARkOesazARHGpWw==
X-CSE-MsgGUID: eaZ5S310RieX9YTv+cZ3DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="201686353"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:01:19 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 6/6] drm/xe/svm: Migrate folios when possible
Date: Tue,  5 Aug 2025 15:59:07 +0200
Message-ID: <20250805140028.599361-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250805140028.599361-1-francois.dugast@intel.com>
References: <20250805140028.599361-1-francois.dugast@intel.com>
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

The DMA mapping can now correspond to a folio (order > 0), so move
the iterator by the number of pages in the folio in order to migrate
all pages at once.

This requires forcing contiguous memory for SVM BOs, which greatly
simplifies the code and enables 2MB device page support, allowing a
major performance improvement. Negative effects like extra eviction
are unlikely as SVM BOs have a maximal size of 2MB.

v2:
- Improve commit message (Matthew Brost)
- Fix increment, chunk, assert match (Matthew Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c  | 2 ++
 drivers/gpu/drm/xe/xe_svm.c | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 1a72561f987c..6fea39842e1e 100644
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
index 1d097e76aabc..e35c6d4def20 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -383,6 +383,14 @@ static int xe_svm_copy(struct page **pages,
 			}
 
 			match = vram_addr + PAGE_SIZE * (i - pos) == __vram_addr;
+			/* Expected with contiguous memory */
+			xe_assert(vr->xe, match);
+
+			if (pagemap_addr[i].order) {
+				i += NR_PAGES(pagemap_addr[i].order) - 1;
+				chunk = (i - pos) == (XE_MIGRATE_CHUNK_SIZE / PAGE_SIZE);
+				last = (i + 1) == npages;
+			}
 		}
 
 		/*
-- 
2.43.0

