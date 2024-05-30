Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1E9C27C44
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 00:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BAB10EDB8;
	Thu, 30 May 2024 00:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CBFRyeRz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D452E10F01D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 00:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717029213; x=1748565213;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bfe/ss9D1ugF3T9zPvM1uOiUBUsBjaZaUG6UuF09ZtQ=;
 b=CBFRyeRzfPnzuMaCuW5QrDPDBl05eO9hcZ9vT9U9S8WmfnEsbSht/dGY
 IHomDAiQ6zk7dmkyJNmAemh0xzl74r8McW7A4UkNwKmBUaclhDPKeMTEq
 WKV4iEch29uutXl7G9Xq0MHE2sbr1/XYTwH+MpHMz8hzeKdxCPRRcGbRy
 1iFVFe+kaIL6heVSfRSWVnzCSSPwVfM5rjCSVmgT3+cU8rYYsla+Mw8EE
 L9NJGPmcTnSRCc8A+ppnAbwH8YpIDr8A9t58seF8kf2WruTJ7hl4Nv7PZ
 379dyXf7Cabe55IXeWPJOzFR/76tfqB3qLOl1FIqRGZWlCkJ7Sy5Dtxmc g==;
X-CSE-ConnectionGUID: 0Om0BQ91S7GtmSD8xlzncw==
X-CSE-MsgGUID: jGtiABEWRqu2Gv40l8CMYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30975369"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="30975369"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:21 -0700
X-CSE-ConnectionGUID: aJG4P1vVSbqvM5ewOZYIww==
X-CSE-MsgGUID: eGfGY1jlS66lKy/f1QSpNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40088722"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:20 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 01/26] mm/hmm: let users to tag specific PFNs
Date: Wed, 29 May 2024 20:47:07 -0400
Message-Id: <20240530004732.84898-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

From: Leon Romanovsky <leonro@nvidia.com>

Introduce new sticky flag, which isn't overwritten by HMM range fault.
Such flag allows users to tag specific PFNs with extra data in addition
to already filled by HMM.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/linux/hmm.h |  3 +++
 mm/hmm.c            | 34 +++++++++++++++++++++-------------
 2 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 126a36571667..b90902baa593 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -23,6 +23,7 @@ struct mmu_interval_notifier;
  * HMM_PFN_WRITE - if the page memory can be written to (requires HMM_PFN_VALID)
  * HMM_PFN_ERROR - accessing the pfn is impossible and the device should
  *                 fail. ie poisoned memory, special pages, no vma, etc
+ * HMM_PFN_STICKY - Flag preserved on input-to-output transformation
  *
  * On input:
  * 0                 - Return the current state of the page, do not fault it.
@@ -36,6 +37,8 @@ enum hmm_pfn_flags {
 	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
 	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
 	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
+	/* Sticky lag, carried from Input to Output */
+	HMM_PFN_STICKY = 1UL << (BITS_PER_LONG - 7),
 	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 8),
 
 	/* Input flags */
diff --git a/mm/hmm.c b/mm/hmm.c
index 93aebd9cc130..a244071085b1 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -44,8 +44,10 @@ static int hmm_pfns_fill(unsigned long addr, unsigned long end,
 {
 	unsigned long i = (addr - range->start) >> PAGE_SHIFT;
 
-	for (; addr < end; addr += PAGE_SIZE, i++)
-		range->hmm_pfns[i] = cpu_flags;
+	for (; addr < end; addr += PAGE_SIZE, i++) {
+		range->hmm_pfns[i] &= HMM_PFN_STICKY;
+		range->hmm_pfns[i] |= cpu_flags;
+	}
 	return 0;
 }
 
@@ -202,8 +204,10 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 		return hmm_vma_fault(addr, end, required_fault, walk);
 
 	pfn = pmd_pfn(pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
-	for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++)
-		hmm_pfns[i] = pfn | cpu_flags;
+	for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++) {
+		hmm_pfns[i] &= HMM_PFN_STICKY;
+		hmm_pfns[i] |= pfn | cpu_flags;
+	}
 	return 0;
 }
 #else /* CONFIG_TRANSPARENT_HUGEPAGE */
@@ -236,7 +240,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);
 		if (required_fault)
 			goto fault;
-		*hmm_pfn = 0;
+		*hmm_pfn = *hmm_pfn & HMM_PFN_STICKY;
 		return 0;
 	}
 
@@ -253,14 +257,14 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 			cpu_flags = HMM_PFN_VALID;
 			if (is_writable_device_private_entry(entry))
 				cpu_flags |= HMM_PFN_WRITE;
-			*hmm_pfn = swp_offset_pfn(entry) | cpu_flags;
+			*hmm_pfn = (*hmm_pfn & HMM_PFN_STICKY) | swp_offset_pfn(entry) | cpu_flags;
 			return 0;
 		}
 
 		required_fault =
 			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);
 		if (!required_fault) {
-			*hmm_pfn = 0;
+			*hmm_pfn = *hmm_pfn & HMM_PFN_STICKY;
 			return 0;
 		}
 
@@ -304,11 +308,11 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 			pte_unmap(ptep);
 			return -EFAULT;
 		}
-		*hmm_pfn = HMM_PFN_ERROR;
+		*hmm_pfn = (*hmm_pfn & HMM_PFN_STICKY) | HMM_PFN_ERROR;
 		return 0;
 	}
 
-	*hmm_pfn = pte_pfn(pte) | cpu_flags;
+	*hmm_pfn = (*hmm_pfn & HMM_PFN_STICKY) | pte_pfn(pte) | cpu_flags;
 	return 0;
 
 fault:
@@ -448,8 +452,10 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 		}
 
 		pfn = pud_pfn(pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
-		for (i = 0; i < npages; ++i, ++pfn)
-			hmm_pfns[i] = pfn | cpu_flags;
+		for (i = 0; i < npages; ++i, ++pfn) {
+			hmm_pfns[i] &= HMM_PFN_STICKY;
+			hmm_pfns[i] |= pfn | cpu_flags;
+		}
 		goto out_unlock;
 	}
 
@@ -507,8 +513,10 @@ static int hmm_vma_walk_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	}
 
 	pfn = pte_pfn(entry) + ((start & ~hmask) >> PAGE_SHIFT);
-	for (; addr < end; addr += PAGE_SIZE, i++, pfn++)
-		range->hmm_pfns[i] = pfn | cpu_flags;
+	for (; addr < end; addr += PAGE_SIZE, i++, pfn++) {
+		range->hmm_pfns[i] &= HMM_PFN_STICKY;
+		range->hmm_pfns[i] |= pfn | cpu_flags;
+	}
 
 	spin_unlock(ptl);
 	return 0;
-- 
2.26.3

