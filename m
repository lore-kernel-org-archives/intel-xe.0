Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C01DCD3439
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 22:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C098F10EF0A;
	Wed,  6 May 2026 22:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRI0beWk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B908610EF07
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 22:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778106912; x=1809642912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y5rOveiv8wthTtaIEYsED8nzVtEIEeGmaSZOAw9yhVk=;
 b=jRI0beWkkPanq63JtbknZuZUbgNQRUDmYL3jzFdpVXbi/sNy3a17ge3A
 XwxYAix9od2agfq0X8oZ++0F+nL+3nnmbUg55GTw/74Bwlg8UelSmLUfU
 +nnivS2cfDPqgcx/dqkMfoQqGU0eo1WiUmPbbCfT9S0xfk9kO+klHausV
 RWDaN+U2pf/7tBsYpIXDofHBCcZ7U/3jJ/2p8kpv/c8oJnwFaVvuX1Dn2
 h/iIWIkGNX7XNg9FTdEd3VVtmzK2WRWfQZGJ5KHSwPxXYdgufec4gXQMi
 OAdcOflblcV+eeyQNAPyPD6uvSmcxGg4zOJrIaN/TJkY/TkT1t0250Z9I w==;
X-CSE-ConnectionGUID: FShfF/BySTeNVCScnAPzUg==
X-CSE-MsgGUID: mQhcMqSeREepiNw9F/9VNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90429717"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="90429717"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 15:35:11 -0700
X-CSE-ConnectionGUID: woTxl9u/RsGBCuGrcM30Ow==
X-CSE-MsgGUID: AXu9PBnWRv2rtQO11+EaKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="259707482"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 15:35:11 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v4 07/11] drm/xe/lrc: Refactor out engine id to hwe conversion
Date: Wed,  6 May 2026 15:35:08 -0700
Message-ID: <20260506223500.3769614-20-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
References: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
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
index 46e9b98a2dfd..5f9baf9f6675 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2628,17 +2628,27 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
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

