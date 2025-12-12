Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4343D59D96
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 21:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C9510E96B;
	Fri, 12 Dec 2025 21:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQkrVMNX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AC210E075
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 21:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765575153; x=1797111153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q82sQEVaoiOg2juGpQchlrIiYDD80IfE8Pfj9D5yiEM=;
 b=hQkrVMNXgnRcym5j3KyriDOd4QtiPKJWAzmiAHkoeNXpRFyz5SRW0NNw
 a1OrsygjBMWgmJ+2p828tE7BGcBHnL1YdkOo+bBDodVBMeFL8WIRsXZ5k
 DkFOuY3JBJV2yIrMT+SJe830LHOOXjQoPUkZj1QG6A3+4L0YvThkvVe6B
 EPPS6WDxrKhS8iFmOHH3L9cwc/sKQLz8bFjqhTCRphi5vz0ngPLeIfOx3
 4lXN15dBQxClD/n5LxD5tHmuG0sEEGkMRxQoFqhtPfRonemg4bCy/+6BJ
 OcRyLARnuOoZeEyXVsxpEflTWW7yN6VkwMLwX1YPxRurxDg+voofq5PUn Q==;
X-CSE-ConnectionGUID: 5BeguKwaTjeGXbuxHGzW0g==
X-CSE-MsgGUID: HKWha3HgSkCXkirva+K6zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67541887"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67541887"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 13:32:32 -0800
X-CSE-ConnectionGUID: BDC3nkwSSvqYnFnrek30iQ==
X-CSE-MsgGUID: ZpvAiPUBS7SlJUwSamFdsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="228244675"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 13:32:30 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v6 02/10] drm/xe/xe_tlb_inval: Modify fence interface to
 support PPC flush
Date: Sat, 13 Dec 2025 05:32:28 +0800
Message-ID: <20251212213225.3564537-14-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212213225.3564537-12-brian3.nguyen@intel.com>
References: <20251212213225.3564537-12-brian3.nguyen@intel.com>
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

Allow tlb_invalidation to control when driver wants to flush the
Private Physical Cache (PPC) as a process of the tlb invalidation
process.

Default behavior is still to always flush the PPC but driver now has the
option to disable it.

v2:
 - Revise commit/kernel doc descriptions. (Shuicheng)
 - Remove unused function. (Shuicheng)
 - Remove bool flush_cache parameter from fence,
   and various function inputs. (Matthew B)

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 848d3493df10..37ac943cb10f 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -34,9 +34,12 @@ static int send_tlb_inval(struct xe_guc *guc, const u32 *action, int len)
 			      G2H_LEN_DW_TLB_INVALIDATE, 1);
 }
 
-#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
+#define MAKE_INVAL_OP_FLUSH(type, flush_cache)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
 		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
-		XE_GUC_TLB_INVAL_FLUSH_CACHE)
+		(flush_cache ? \
+		XE_GUC_TLB_INVAL_FLUSH_CACHE : 0))
+
+#define MAKE_INVAL_OP(type)	MAKE_INVAL_OP_FLUSH(type, true)
 
 static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval, u32 seqno)
 {
@@ -152,7 +155,7 @@ static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 						    ilog2(SZ_2M) + 1)));
 		xe_gt_assert(gt, IS_ALIGNED(start, length));
 
-		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
+		action[len++] = MAKE_INVAL_OP_FLUSH(XE_GUC_TLB_INVAL_PAGE_SELECTIVE, true);
 		action[len++] = asid;
 		action[len++] = lower_32_bits(start);
 		action[len++] = upper_32_bits(start);
-- 
2.52.0

