Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B13C5473A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 21:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F1610E0E8;
	Tue, 27 Aug 2024 21:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYIhkEkW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6509710E0DA
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 21:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724795250; x=1756331250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HkfS2Jil3phUXPoo+bSvMOpr5OlMNVc7nUOpED77d/g=;
 b=hYIhkEkWRJTfyGVK1q7ggOOKuFuVaY+EQE8FWE3PjPLn4VMDVUKGxEB2
 x6wk81XpAeLg3UWozZbLyGErpWOC03urB3ylZuxS1cbk1D7MNmRfmd7dA
 6Mm0V8gJQCIT6/n0Gon/ISc1tXpF/iDNaUuAQ9VMiV0iTK7g90zSZs+i1
 /1hdCwZFm8G2HezURobp+qA45R677CJUHr+4t/+vzOZaiRHmpkuc8sSQq
 moQ7oNr1v3XYJrhxHDKBiSxf16azqJjGG9WLFJnWH4X4EKQvitymglsEG
 IcSA+yyWOAWL8www2XMKZz70EKNYz9OZeMCZRimRamZ/sf8kIGdXCh04V Q==;
X-CSE-ConnectionGUID: WsuOM12ORm6DraYbNiwaFA==
X-CSE-MsgGUID: SQ/IKnHoS+q9MypgRvEUhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="48683912"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="48683912"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 14:47:28 -0700
X-CSE-ConnectionGUID: awGUGJMKQb6Es6zhjUHgNw==
X-CSE-MsgGUID: HjaOyPsBTx+aTi8d5O/d6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="62733188"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 27 Aug 2024 14:47:28 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v17 5/7] drm/xe/guc: Move xe_lrc_snapshot to header file
Date: Tue, 27 Aug 2024 14:47:24 -0700
Message-Id: <20240827214726.1183935-6-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827214726.1183935-1-zhanjun.dong@intel.com>
References: <20240827214726.1183935-1-zhanjun.dong@intel.com>
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

Move xe_lrc_snapshot structure define to header file, GuC capture feature
need to access structure fields.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c       | 18 ------------------
 drivers/gpu/drm/xe/xe_lrc_types.h | 18 +++++++++++++++++-
 2 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index aec7db39c061..52f8d202e262 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -38,24 +38,6 @@
 
 #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
 
-struct xe_lrc_snapshot {
-	struct xe_bo *lrc_bo;
-	void *lrc_snapshot;
-	unsigned long lrc_size, lrc_offset;
-
-	u32 context_desc;
-	u32 indirect_context_desc;
-	u32 head;
-	struct {
-		u32 internal;
-		u32 memory;
-	} tail;
-	u32 start_seqno;
-	u32 seqno;
-	u32 ctx_timestamp;
-	u32 ctx_job_timestamp;
-};
-
 static struct xe_device *
 lrc_to_xe(struct xe_lrc *lrc)
 {
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 71ecb453f811..011d4607e585 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -55,6 +55,22 @@ struct xe_lrc {
 	u32 ctx_timestamp;
 };
 
-struct xe_lrc_snapshot;
+struct xe_lrc_snapshot {
+	struct xe_bo *lrc_bo;
+	void *lrc_snapshot;
+	unsigned long lrc_size, lrc_offset;
+
+	u32 context_desc;
+	u32 indirect_context_desc;
+	u32 head;
+	struct {
+		u32 internal;
+		u32 memory;
+	} tail;
+	u32 start_seqno;
+	u32 seqno;
+	u32 ctx_timestamp;
+	u32 ctx_job_timestamp;
+};
 
 #endif
-- 
2.34.1

