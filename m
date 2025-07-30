Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CC6C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C8910E20B;
	Wed, 30 Jul 2025 14:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbh8O1vx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7212510E69E
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 14:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753885456; x=1785421456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8AAcxilvwbGEfahhXoNf4zkAjO/ydgxruqOadRCOLhE=;
 b=jbh8O1vxXOOdq8SQAGYbnw7hJR/ZLhXaPPZ7aSZ26/deOhftXG1nFz84
 9ucXZCqBrr+d6UEXDScCxFlpf78C2F7/ZpX0XGy4YEYKfQIAT5ZKDwTEF
 a0znHlNfxVENXVvc0vJnxz1Nd5o8fXeftwMKmx41yGEx7QkzAV9cxsf7p
 0jNcg9IpdxsrIKbw0jvV6SzD8bvxbTkSxgDq2CAo06OO/v4DjwkSKC0fv
 kFd0AP8r2kf3J0cdQP8cKgPd0L+YY7Ne/tKtgbIZEfrz34aUkNzbYF22N
 fkoXsl5mm5AvF15iWfBNN8DyReZ2xKlHj8lDnWNLAXzDe0+DiSoKrqEDc A==;
X-CSE-ConnectionGUID: evrP0AgATeqN5Wzj6hA8IQ==
X-CSE-MsgGUID: yP9iDw4eQFuTlKWBAZhAfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="55392783"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55392783"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:24:16 -0700
X-CSE-ConnectionGUID: AVoc6phuSEKi8in1kwOcHw==
X-CSE-MsgGUID: eRz/5eF4SvmvPPYc3KaC+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167254536"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.245.61])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:24:15 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 6/6] drm/xe/svm: Migrate folios when possible
Date: Wed, 30 Jul 2025 16:22:51 +0200
Message-ID: <20250730142357.3851167-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730142357.3851167-1-francois.dugast@intel.com>
References: <20250730142357.3851167-1-francois.dugast@intel.com>
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
---
 drivers/gpu/drm/xe/xe_bo.c  | 2 ++
 drivers/gpu/drm/xe/xe_svm.c | 8 ++++++++
 2 files changed, 10 insertions(+)

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

