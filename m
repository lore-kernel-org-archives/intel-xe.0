Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAF6E82CCA
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 19:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ACD10E5A1;
	Wed, 27 Sep 2023 19:38:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BBC10E5A1
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 19:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695843538; x=1727379538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aHy8Ondlg2E0dZIxNHhUQzs0JPD04vDrCCJZKg/JZj8=;
 b=hX4kT8gMhD0urQf5CCvxnT/hzT2nODjgPlYsrnlai6lzIUCXCy6UlzXL
 fKFg6axgwqSUWbOxP9ze/8gdfe8vwm8fHFvcWC6UucZ0JBDXentXVtll+
 z08ODhYfPP6MWBK6JzxtHkN2vf7E/PabOXCEiXvYN05+GT7AhbL+9Vjlg
 ii47M+VMQJ7kyUrkVCI7akvrkRHEQbzuYNzYFLZpfeanXJlmV1q1GyJA5
 Uu+yXJuJFiEndHNV1SM7e+6s6YKRdTdoeikmL3xI/G45bQAf4AgJg5fnD
 I7DW4RZJiyqbgoyy9X/QhHbYGByQMWOBN2p/aZusxXHBa7GjpMRfmry8B A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381817978"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="381817978"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 12:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="742826476"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="742826476"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 12:38:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 12:38:53 -0700
Message-Id: <20230927193902.2849159-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230927193902.2849159-1-lucas.demarchi@intel.com>
References: <20230927193902.2849159-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 02/11] drm/xe: Remove check for vma == NULL
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

vma at this point can never be NULL as otherwise it would crash earlier
in the only caller, xe_pt_stage_bind_entry(). Remove the extra check and
avoid adding and removing the bits from the pte.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index afadd399684c..0b8a45609e83 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -136,14 +136,15 @@ u64 xe_pte_encode(struct xe_bo *bo, u64 bo_offset, enum xe_cache_level cache,
 static u64 __vma_pte_encode(u64 pte, struct xe_vma *vma,
 			    enum xe_cache_level cache, u32 pt_level)
 {
-	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
+	pte |= XE_PAGE_PRESENT;
+
+	if (likely(!xe_vma_read_only(vma)))
+		pte |= XE_PAGE_RW;
+
 	pte |= pte_encode_cache(cache);
 	pte |= pte_encode_ps(pt_level);
 
-	if (unlikely(vma && xe_vma_read_only(vma)))
-		pte &= ~XE_PAGE_RW;
-
-	if (unlikely(vma && xe_vma_is_null(vma)))
+	if (unlikely(xe_vma_is_null(vma)))
 		pte |= XE_PTE_NULL;
 
 	return pte;
-- 
2.40.1

