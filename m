Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A462C3DA5D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 16:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D63A10E19E;
	Mon, 22 Jul 2024 16:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SkWC2r5W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC89110E199
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721664503; x=1753200503;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Oz2TxrcG5sAIohZU1+O0Iit856hS4jpvQPPXLRLJPxE=;
 b=SkWC2r5WD3g2NW769uVHB0ZkaRvQIcS5N/eutc4iWIXti6EIRfXwbFT1
 wA+qeNIUf4SJ6p7L4ED5TDsM4IXJCsnJbem+vuFnwrc9/Yj3vSZcRnkIb
 g3IzmEJJ2xC5M6we197ZI6QMN4Z8DZ8Q3hzkgjzJ+f6Kucfn14mvU8ah1
 ZxRw5boc3wTCtRKkKJwj6Vsdtrhzp4eQT0RLLt3BxGSHjTgCsn4A/RkVV
 +Unr+vRJKXzpncOmqRV7WgYOKETMFYWexJOPwNw/DDV7aPeKdGM8m6O9z
 68aGUoCNnZsQPFmo3VSyRAAIaXxN8sUl9DMrs+L9e/p7QU/sxPt2AZEju g==;
X-CSE-ConnectionGUID: a6IbYN/YTE22gaPIdz+WFQ==
X-CSE-MsgGUID: LZ9T1V+PQ3CeD+CNl7lPfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19395006"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="19395006"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 09:08:22 -0700
X-CSE-ConnectionGUID: vKCo6rxXTfWofdGalLzKxg==
X-CSE-MsgGUID: QdlUxs02T36fukAZOsM13A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="82564712"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 09:08:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2] drm/xe: Add assert for XE_WA() usage
Date: Mon, 22 Jul 2024 09:06:39 -0700
Message-ID: <20240722160815.4085605-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

It's not always safe to call XE_WA() in the driver initialization. Add a
xe_gt_assert() so this doesn't go unnoticed.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

v2:
  - Fix kernel-doc (Tejas)
  - Remove needless initialization (Tejas)

 drivers/gpu/drm/xe/xe_gt_types.h | 6 ++++++
 drivers/gpu/drm/xe/xe_wa.c       | 1 +
 drivers/gpu/drm/xe/xe_wa.h       | 7 ++++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index ef68c4a92972..4dd01adf63c6 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -389,6 +389,12 @@ struct xe_gt {
 		unsigned long *lrc;
 		/** @wa_active.oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
+		/**
+		 * @wa_active.oob_initialized: mark oob as initialized to help
+		 * detecting misuse of XE_WA() - it can only be called on
+		 * initialization after OOB WAs have being processed
+		 */
+		bool oob_initialized;
 	} wa_active;
 
 	/** @user_engines: engines present in GT and available to userspace */
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index fd009b2c68fa..564e32e44e3b 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -755,6 +755,7 @@ void xe_wa_process_oob(struct xe_gt *gt)
 
 	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.oob,
 						  ARRAY_SIZE(oob_was));
+	gt->wa_active.oob_initialized = true;
 	xe_rtp_process(&ctx, oob_was);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index db9ddeaf69bf..52337405b5bc 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -6,6 +6,8 @@
 #ifndef _XE_WA_
 #define _XE_WA_
 
+#include "xe_assert.h"
+
 struct drm_printer;
 struct xe_gt;
 struct xe_hw_engine;
@@ -25,6 +27,9 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
  * @gt__: gt instance
  * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
  */
-#define XE_WA(gt__, id__) test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob)
+#define XE_WA(gt__, id__) ({						\
+	xe_gt_assert(gt__, (gt__)->wa_active.oob_initialized);		\
+	test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob);		\
+})
 
 #endif
-- 
2.43.0

