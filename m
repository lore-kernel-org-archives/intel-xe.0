Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21AFC28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 16:51:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CF910EA7C;
	Fri, 28 Mar 2025 16:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfJlDKd5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAF910EA7C
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 16:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743180682; x=1774716682;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=DcsrYmwKTxfOOlcY3+k/EAAC6AfAEzuinaYPQeUODO0=;
 b=TfJlDKd5JlFLSl3sQ+D08iPMP7EjPKf/bXz2bAjS9+2WnB4GS3HHTY2G
 7NlhueH6Dy9LrwTX7j5r0+E2beCnDtvw/brTf+HJ7XvLU4bFcLoiDsxG3
 SYP7oA8zMKZmfXqJwvFI5kOamu2u6TJatwaPF4LzNbj016lGs9doH15K8
 0txw8nnq2kctQiOd9LePNq9b+Rs7ZN5jjjsdK4V/cuL095zop2XKkyaCm
 aKOc62srsBfe9epvKlJQYkDgFcZeN6rHOj6qvHPWoRaU6MdBvCZnaG3lU
 Du3KynoeD2Ag6K/GybJLMdRN4TeQHNBd5uxaXduBOxzZlAxtXiwpDYLeQ g==;
X-CSE-ConnectionGUID: UebuwntkQ8yyWFX0UJwF1w==
X-CSE-MsgGUID: uuT3CPGwRTy8Eqyzoa0uAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44709317"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="44709317"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 09:51:22 -0700
X-CSE-ConnectionGUID: 5n17kZ+2TjSmr4CrVFwHoQ==
X-CSE-MsgGUID: KmCvx9E+T5agtL8t6H5WxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="129634084"
Received: from inaky-mobl1.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.108.170])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 09:51:21 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 28 Mar 2025 13:50:50 -0300
Subject: [PATCH] drm/xe: Make PPHWSP size explicit in xe_gt_lrc_size()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-explicit-pphwsp-size-in-xe_gt_lrc_size-v1-1-ceb9ce7c8bc1@intel.com>
X-B4-Tracking: v=1; b=H4sIAGnT5mcC/x2NUQqDMBAFryL77UKatGC9SpEQkq0uSFyy0oaKd
 2/wcx7DmwOUCpPC2B1Q6MPKW25w6zuIS8gzIafGYI19GGcHpCorR95RZPmqoPKvORkr+Xn3a4n
 +WtIzBGfd3Zk0QDuTQm+uV+g1necfJwAwdngAAAA=
X-Change-ID: 20250328-explicit-pphwsp-size-in-xe_gt_lrc_size-d9aa323430d8
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.14.2
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

The context of each engine starts with a 4k scratch memory space for the
"Per-process HW status page" (PPHWSP). In xe_gt_lrc_size(), we have been
implicitly accounting for that page in the switch statement on the
engine class.

Since the PPHWSP is common to all engines, let's extract that into it's
own assignment. That makes the context structure more explicit in the
code and aligns better with the descriptions in Bspec.

Another advantage of keeping it separate is that now the sizes used in
the switch statement match the sizes we calculate engine-specific
context images, which have their own Bspec pages.

Bspec: 67296, 60159, 45554
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 81def179266443a58ee237b5bb2c30eea066ec7a..2639a3dfc9f7b3f420acbaf2c54c40efeb7bf354 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -37,6 +37,7 @@
 #define LRC_ENGINE_CLASS			GENMASK_ULL(63, 61)
 #define LRC_ENGINE_INSTANCE			GENMASK_ULL(53, 48)
 
+#define LRC_PPHWSP_SIZE				SZ_4K
 #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
 
 static struct xe_device *
@@ -50,19 +51,22 @@ size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
 	struct xe_device *xe = gt_to_xe(gt);
 	size_t size;
 
+	/* Per-process HW status page (PPHWSP) */
+	size = LRC_PPHWSP_SIZE;
+
+	/* Engine context image */
 	switch (class) {
 	case XE_ENGINE_CLASS_RENDER:
 		if (GRAPHICS_VER(xe) >= 20)
-			size = 4 * SZ_4K;
+			size += 3 * SZ_4K;
 		else
-			size = 14 * SZ_4K;
+			size += 13 * SZ_4K;
 		break;
 	case XE_ENGINE_CLASS_COMPUTE:
-		/* 14 pages since graphics_ver == 11 */
 		if (GRAPHICS_VER(xe) >= 20)
-			size = 3 * SZ_4K;
+			size += 2 * SZ_4K;
 		else
-			size = 14 * SZ_4K;
+			size += 13 * SZ_4K;
 		break;
 	default:
 		WARN(1, "Unknown engine class: %d", class);
@@ -71,7 +75,7 @@ size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
 	case XE_ENGINE_CLASS_VIDEO_DECODE:
 	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
 	case XE_ENGINE_CLASS_OTHER:
-		size = 2 * SZ_4K;
+		size += 1 * SZ_4K;
 	}
 
 	/* Add indirect ring state page */
@@ -650,7 +654,6 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
 #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
 #define LRC_PARALLEL_PPHWSP_OFFSET 2048
-#define LRC_PPHWSP_SIZE SZ_4K
 
 u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
 {

---
base-commit: 4cac9bb1b5db81d533be95f97dd30c03a8733871
change-id: 20250328-explicit-pphwsp-size-in-xe_gt_lrc_size-d9aa323430d8

Best regards,
-- 
Gustavo Sousa <gustavo.sousa@intel.com>

