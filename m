Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D98CD3441
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 23:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D43F10EC4F;
	Tue,  5 May 2026 23:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cf/wO5lX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2C410E4C1
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 23:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778024658; x=1809560658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kIX6L5Ji3iaaCEEXlsBlAl6q0qSn9ombiGsRaUoKHRE=;
 b=cf/wO5lXvimgOJZhb3nZwroO5FRd18o8sgkEyL3irD5wZ1C3JGypr4iY
 +Aj8E7wtuRnpQSNRApBBsje3U8r2paLj5hg99satru7aqVMfaVDE6gn2F
 5wY0FQUwcPgxr6cHonqR8HwiREwzUiX8pJOqsTcrdUNo2D2DQ4zlFjufr
 RZJ992RPnCZ61jqCRqy4/jIQEV8kUGNZchkdQkgtSEob5ak42aBfPXhR+
 XOUREJOkohMPozPKvedbvV0NIrolLlrGXqaymJjjRrDz0fqiV2iEXTtQD
 mZJ+exrJktSptS6pRCL4XE5lAfWj5Gl6Q5TSBC7TvSRenRWmlWEVfMd7l A==;
X-CSE-ConnectionGUID: lC5uUnDxSCGevfoxfrsnVg==
X-CSE-MsgGUID: 74Qj/70xSYeWGgGo2ZXQhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78771098"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78771098"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:17 -0700
X-CSE-ConnectionGUID: d6p4HfJ2RT2kwAVO0q5jAQ==
X-CSE-MsgGUID: 0DU78g+/STCdBuWBfq6ZSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="231569050"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:17 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v3 07/11] drm/xe/lrc: Refactor out engine id to hwe conversion
Date: Tue,  5 May 2026 16:44:16 -0700
Message-ID: <20260505234408.3552147-20-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
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

We need to define more helpers that read engine ID specific register, so
move that logic outside of get_ctx_timestamp().

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 127a2ebc3679..e7f7f0efcf2d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2606,17 +2606,27 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
 	kfree(snapshot);
 }
 
-static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
+static struct xe_hw_engine *engine_id_to_hwe(struct xe_gt *gt, u32 engine_id)
 {
 	u16 class = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
 	u16 instance = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
+	struct xe_hw_engine *hwe = xe_gt_hw_engine(gt, class, instance, false);
+
+	if (xe_gt_WARN_ONCE(gt, !hwe || xe_hw_engine_is_reserved(hwe),
+			    "Unexpected engine class:instance %d:%d for utilization\n",
+			    class, instance))
+		return NULL;
+
+	return hwe;
+}
+
+static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
+{
 	struct xe_hw_engine *hwe;
 	u64 val;
 
-	hwe = xe_gt_hw_engine(lrc->gt, class, instance, false);
-	if (xe_gt_WARN_ONCE(lrc->gt, !hwe || xe_hw_engine_is_reserved(hwe),
-			    "Unexpected engine class:instance %d:%d for context utilization\n",
-			    class, instance))
+	hwe = engine_id_to_hwe(lrc->gt, engine_id);
+	if (!hwe)
 		return -1;
 
 	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
-- 
2.51.0

