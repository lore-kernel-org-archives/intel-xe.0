Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F02C5472E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 02:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FA210E499;
	Tue, 20 Aug 2024 02:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CvSHp/Cu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570F810E27D
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 02:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724119905; x=1755655905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=koanpfgncJhyIpu8mkE6HXc/9XDo+cG5Y/aKcHoYnLQ=;
 b=CvSHp/CuBp0B8pHXpQjR274GAE1C/P42FT+itaLWQfpKm1gzToYC9Uq0
 Q0RcZdWeR/22xHIrEWBAWtY5vykZFAWncgO1sSAt9eTx/on+AqQLCp1N8
 avq6HUNalwQkd7pgntCsgyJDYf2Cu2KGoTZ26xK2hogtoTW1lVtGj2Asq
 Ii3dxgs9rOz+ZsXY3D28HWEHGU1QUF6bzOxw291lUZ6I63rwE6pE4h/SV
 bc2g+9qepuO92Vc4ugBZWmFSmiJTF6hX7oagySNzAnrGyXvb9FThgngdb
 HkJhth1cdVyxBCgAQ/G0LzZn2SewxgnIXhmzwNdjLML3FfFvFnvhm2rLD g==;
X-CSE-ConnectionGUID: r8jwTkTUTs6LYT9Tg0v/kg==
X-CSE-MsgGUID: AZYO6JpfSwiJslncJP/GBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33780414"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="33780414"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 19:11:44 -0700
X-CSE-ConnectionGUID: pil3UXmTSti8Tze9TxjkjQ==
X-CSE-MsgGUID: M67yQXULSkGcDvhQiWOWMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="61126118"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa007.jf.intel.com with ESMTP; 19 Aug 2024 19:11:45 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v16 5/7] drm/xe/guc: Move xe_lrc_snapshot to header file
Date: Mon, 19 Aug 2024 19:11:40 -0700
Message-Id: <20240820021142.436536-6-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820021142.436536-1-zhanjun.dong@intel.com>
References: <20240820021142.436536-1-zhanjun.dong@intel.com>
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
index 974a9cd8c379..d350fcc81b4a 100644
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

