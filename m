Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6B7D73E9E
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397D710E8D2;
	Thu, 29 Jan 2026 23:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PP4GFKgW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A866A10E8CF
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769727616; x=1801263616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EQuJcaqkFl3wzVzV5XokZ6xXKig6nxovN8Rnuc3l9SY=;
 b=PP4GFKgWkEXdlyvn17itNfUiIuyADttG6gqsy4WppCTiuCobQT3CmYZW
 WI/9bwV0q0KiPnvejQb6/79+FSkmJNRwjGsGdHo1GIO3N9srCK/6gApTP
 uyvy/7Ucavx34w7qtd6d3FpgokEIaphVFb6iqBIK6/2UufyTnHOKlHu59
 mRcXo+0e8IT9uZqGSoyyJrTO5+hT2e/O5W5gcQChS1aZikzw184n6fHJE
 bPgMwRm6qPAD9YD8kOTG2uJK4mtdOz8MeJdvJAlMnf9fLICUhOPbY1UWC
 WRGkPZV0XGgmvOs8uNVJlhnGx4dGMPgRf2U8ee+WIc+LQdwgXnc9l9InV Q==;
X-CSE-ConnectionGUID: t6vBc+HqRAuL+wx2pwqklQ==
X-CSE-MsgGUID: YUDk5LfUSWyjXRXF9Ay3Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82089501"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82089501"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:00:16 -0800
X-CSE-ConnectionGUID: S0lnWittSOGG9qcL36u7fg==
X-CSE-MsgGUID: t60HI7CbTn+xDawlYDS+CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208715235"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa008.jf.intel.com with ESMTP; 29 Jan 2026 15:00:15 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 2/3] drm/xe: Fix kerneldoc for xe_gt_tlb_inval_init_early
Date: Thu, 29 Jan 2026 22:56:09 +0000
Message-ID: <20260129225606.412902-7-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260129225606.412902-5-shuicheng.lin@intel.com>
References: <20260129225606.412902-5-shuicheng.lin@intel.com>
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

Correct the function name in the kerneldoc.
It is for below warning:
"Warning: drivers/gpu/drm/xe/xe_tlb_inval.c:136 expecting prototype for
xe_gt_tlb_inval_init(). Prototype was for xe_gt_tlb_inval_init_early() instead"

Fixes: db16f9d90c1d9 ("drm/xe: Split TLB invalidation code in frontend and backend")
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 989fe0e7f8ee..2ea1b1708700 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -125,7 +125,7 @@ static void primelockdep(struct xe_tlb_inval *tlb_inval)
 }
 
 /**
- * xe_gt_tlb_inval_init - Initialize TLB invalidation state
+ * xe_gt_tlb_inval_init_early - Initialize TLB invalidation state
  * @gt: GT structure
  *
  * Initialize TLB invalidation state, purely software initialization, should
-- 
2.50.1

