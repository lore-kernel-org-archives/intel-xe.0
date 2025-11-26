Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE3ED11184
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 23:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7F210E72E;
	Wed, 26 Nov 2025 23:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZS97riy0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9F910E71E
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 23:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764198131; x=1795734131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ufqAo5qZ2Jy/+fdqV2z1jkftiDAAydUcrsbyma/cTWU=;
 b=ZS97riy0VWhmCCUxeDHxyTJrsy7s9DdUItVqTj55IsQuMIRhSTkkKrz0
 +NkyuDB8ClyXr0Gumi3CrTUapbhMh0yuOF+Ah1CnREoXKdyPttQEhslm7
 WVpyzOPFcF1oO1yk2o6nzoHvRWmwG8dY5KV58nkoVpQCQdlk1ucwiJmVy
 fWmBNXpXS0UR+lbM7M4ooznTqiyYDSN3Y2F+9bWg1wW6EpsQ95w5cPMN4
 xjg3YGLGJV95R4qxgwTGaa+W0en1e0LZXgjhsnLfWvpOtJ5ueWHlg5R4/
 q20v4cMScNqihMDJOQ0pPnx8kovTGfK5KP3NtlS3gyOXbXLYTdkEbWvUD A==;
X-CSE-ConnectionGUID: nbOIphsiSfu9GouOuEhMkA==
X-CSE-MsgGUID: pmz0mGqWQkmGP8FmWZ9FBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66284512"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66284512"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 15:02:10 -0800
X-CSE-ConnectionGUID: 4ucEDA9MSgq52eWQ2k4IPw==
X-CSE-MsgGUID: QXZddSEaTCCLe9Vds95kTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="224028501"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 15:02:09 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v2 03/11] drm/xe/xe_tlb_inval: Modify fence interface to
 support PPC flush
Date: Thu, 27 Nov 2025 07:02:04 +0800
Message-ID: <20251126230201.3782788-16-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126230201.3782788-13-brian3.nguyen@intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>
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

