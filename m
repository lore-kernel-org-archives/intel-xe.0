Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA716D1CDC6
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 07:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FB910E2DE;
	Tue,  9 Dec 2025 07:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsrHwNdn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60BC10E2DE
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 07:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765265686; x=1796801686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ebhthKVespwUrW/sPlZwpM6hDW95KYHKTRd8Tn0vzk=;
 b=gsrHwNdnH8IgoYubVUrxsxjg1dXRUnHntK8Y1+NiV4R75C8RNNQCXloz
 D7zgMwGNF1fOw7op1erCLCSvj3gJcSXuxIfENSUoOhCfwOvfHiTH7BjjH
 8wEudCdg2K16v+mRBaONEu+qOv6auxqPz8Yz+X3O5orIX2P/+jGuGrZMf
 0R8DwKMcqc/98VqWGPq5JPNjtvJRyypByh5IiGuLZ2sgvdEecpCZ3qTtI
 QXWlS+7TnwFHdvEyOgu9/KqMZort/OsGYOCXMrkDWjogIdOkjifUa21Uj
 xRjic+Q1Y2ujxyl90bdOUpZEx0YG3QrUswI2fdPhPseHJyp676zZkqjcX g==;
X-CSE-ConnectionGUID: yzSAWOgBQMOcXLWUUxHUFg==
X-CSE-MsgGUID: JLvCz8HeR0yA3QlfnLP9zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67295847"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67295847"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 23:34:46 -0800
X-CSE-ConnectionGUID: cwmUXj6OQ/KROKPtkxA+ow==
X-CSE-MsgGUID: NjpgLpqKRI6kQ7ZdRaFqDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="227189406"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 08 Dec 2025 23:34:45 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v3 02/10] drm/xe/xe_tlb_inval: Modify fence interface to
 support PPC flush
Date: Tue,  9 Dec 2025 15:34:41 +0800
Message-ID: <20251209073438.2432701-14-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209073438.2432701-12-brian3.nguyen@intel.com>
References: <20251209073438.2432701-12-brian3.nguyen@intel.com>
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

