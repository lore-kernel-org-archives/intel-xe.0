Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B188CD3431
	for <intel-xe@archiver.kernel.org>; Sat,  2 May 2026 00:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D7210E57D;
	Sat,  2 May 2026 00:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnMwThjg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9465E10E281
 for <intel-xe@lists.freedesktop.org>; Sat,  2 May 2026 00:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777683221; x=1809219221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z9zqiv65gmOKgzaUUCJJIBeWgJD2heRaLKczOQF8ZLs=;
 b=jnMwThjgo/9g7XBs7K6cXh0q/nnkhU8m3GqM73LUyFE9SKV1AVnDLoL3
 0Rnjb70tvwgHyl2aOFxKT72EltCgPl+qS8nNjXr8EVaicsGtiJsc5+s/+
 2LLuI23FwhaSmeTl9CNN9sbiNqol7GmKvOA9IDEuWe+l0zVYok0BF7qj+
 cLMANG6rgNVpm6Jk2JNmxQ6VKvuH/Z10vOaRxA451itPIKnh8CMW5byvE
 Qmrs6hEIKs/8nk11mjy7QraGtGHQ10Mz+24+/90seKcnwPrxRH7i5UR5h
 8rNngqL1Po5ttVsfJVtOjLmmR0NeE3nx2er2zdlAIwgcPX7uF9za8RuYc g==;
X-CSE-ConnectionGUID: 7R1X6ehFRY2hAuCH0QUBUA==
X-CSE-MsgGUID: XwOq1cEkQdWL35aRS8IMoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78841560"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="78841560"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:40 -0700
X-CSE-ConnectionGUID: YdkZ7CDBQwa5bN0sdBAZhA==
X-CSE-MsgGUID: XDamV8tWSRe1336Nn7rnJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="228510950"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v2 5/9] drm/xe/lrc: Refactor out engine id to hwe conversion
Date: Fri,  1 May 2026 17:53:38 -0700
Message-ID: <20260502005332.3135977-16-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
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
---
 drivers/gpu/drm/xe/xe_lrc.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 2ee52efb9219..92419e5058fd 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2620,17 +2620,27 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
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
2.43.0

