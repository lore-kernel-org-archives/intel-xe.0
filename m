Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0187ECD3442
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 16:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B601310F20E;
	Thu,  7 May 2026 16:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WiHXMDhf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5485F10E0BD
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778170826; x=1809706826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=legm015gccDnj+KUvfqAmR3hNlEpcrrbCPv26rMm+wE=;
 b=WiHXMDhfZS+upuuxY3+M7rklbmKbPRJmokpGoSy733+e2C7UsrSyxqjD
 stLPPSdSxTfcqxWs9W7D8hOpz0+/0RXXeuzDmwDjnhPBnWUz1W+Joo8Gj
 DwrzP75BBCq1x9IOKipARNacHmzZTA94PFezejm8NG9mCAeC9Eo6SXAdi
 DzkEP0DLLDmcVFnHfoOYECOYbClFA03IlgudK9sQ8LvBrSdJMekuJ7HAs
 MNLMbTTG607Z3zWkjBbF2FCA+C9W7JM4gcY+nVrwyS9Y2gkPG2+GyZY1F
 8LuAWtgGD5fb0jQe+qgyqIy1rwJp/7B+SDeUY0dp7BHKmAEZrvxAlPTIu g==;
X-CSE-ConnectionGUID: Q6bJoiW6QQKEHVZG8rz9zA==
X-CSE-MsgGUID: NnUW4IAMRZ2DnR9Xel4qaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79063605"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79063605"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
X-CSE-ConnectionGUID: GmK9hzUaR42LNWEr5FGo3w==
X-CSE-MsgGUID: rTIbPao+RSC+y8qHXeQKzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="266876581"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v5 07/11] drm/xe/lrc: Refactor out engine id to hwe conversion
Date: Thu,  7 May 2026 09:20:24 -0700
Message-ID: <20260507162016.3888309-20-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
References: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
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
index 0dc50627e1b7..0fe9738cb360 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2617,17 +2617,27 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
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

