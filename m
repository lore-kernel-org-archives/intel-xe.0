Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D39FC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 14:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B77810E759;
	Tue, 16 Jul 2024 14:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jk854za9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41EC10E759
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 14:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721140648; x=1752676648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wvuj4qdL91Y8n4RDt+CavHW4rh5AxK4ObKYyqGaRuTs=;
 b=jk854za9nzizOvEokw4dKdB94rkwdcrs5HTR6pKbXNiup2sa+iEWht0j
 9sgGjVbnVKxc3JcrpVGOogXh5unqcBFf901m74Ouva+026pefrknaoZnG
 0vx8ghnKZOZFU7IOMsRFnpOTqVy8jlXwynYQ/c/tLQ7WrXx0CyfLwjEbx
 G2NVr+A+pO3Pvk9lEAPr8zFLR21OBDgF+0S6Xg9ZmT8WbxyGElqfJ1zPz
 zGG6GSKNlDQ216h5njT02yKNGh2gaRIIkv+xsmQFYhZbYsekkE+6gaN1x
 buCHvtAX0Ql++4+H0sfDkHObvdg+XmUTs+LaxtkIEHugesz1fykSVJEMu A==;
X-CSE-ConnectionGUID: nBFU8pimRsepHwrlByaR1Q==
X-CSE-MsgGUID: TBg2NfouQaGdzHBAu3yQiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="36125837"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="36125837"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 07:37:28 -0700
X-CSE-ConnectionGUID: wbLTzkMMQvOTW7RnXi95yQ==
X-CSE-MsgGUID: /KIjT3kUS2C/UhTTrjUNfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="73250405"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 07:37:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Add assert for XE_WA() usage
Date: Tue, 16 Jul 2024 07:37:20 -0700
Message-ID: <20240716143720.2790982-1-lucas.demarchi@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_types.h | 6 ++++++
 drivers/gpu/drm/xe/xe_wa.c       | 2 ++
 drivers/gpu/drm/xe/xe_wa.h       | 7 ++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 38a0d0e178c8..1e790ca0be43 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -378,6 +378,12 @@ struct xe_gt {
 		unsigned long *lrc;
 		/** @wa_active.oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
+		/**
+		 * @wa_active.oob: mark oob as initialized to help detecting
+		 * misuse of XE_WA() - it can only be called on initialization
+		 * after OOB WAs have being processed
+		 */
+		bool oob_initialized;
 	} wa_active;
 
 	/** @user_engines: engines present in GT and available to userspace */
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index fd009b2c68fa..de356c024d5d 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -755,6 +755,7 @@ void xe_wa_process_oob(struct xe_gt *gt)
 
 	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.oob,
 						  ARRAY_SIZE(oob_was));
+	gt->wa_active.oob_initialized = true;
 	xe_rtp_process(&ctx, oob_was);
 }
 
@@ -838,6 +839,7 @@ int xe_wa_init(struct xe_gt *gt)
 	gt->wa_active.lrc = p;
 	p += n_lrc;
 	gt->wa_active.oob = p;
+	gt->wa_active.oob_initialized = false;
 
 	return 0;
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

