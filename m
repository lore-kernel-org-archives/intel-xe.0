Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE26C02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 23:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0718010E9BE;
	Thu,  6 Feb 2025 23:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4bjJalS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DF910E9A0
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 23:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738884236; x=1770420236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N1Q2TMDDzGRtVHZqVTmju1slkR7AWQtxb+imFi05oY4=;
 b=X4bjJalSF15gYb0SM/llPdcdjChzj3GPfFLLwtkDMyx/p01kLWPGZa3S
 wH8ncDpK/D4myGxsT+lXxpe5raQ+sopOltO6x9P7z/OFaByuWXQSP1+tg
 ccB24IWAMNRJ2pfCyNWAEuRN2CIFI8kup8yDE0aRJhEsnvvc3ahr7s0uJ
 mhe4+eSVvlqcmvzYNamJjTESOc+e0WV97d4xuwdzjmCWZbh6I/JcHaT90
 UgFtw4dHq2tST5uxnq5hRujbXz+Myh5UAN2AAkFraWGTjHjsdtnQG8BQZ
 SeFBBGHGk7iOANMgDL/j3tI/hti+ZeoLmTJzhQ+NwUVb1ATxpzQt2eK14 A==;
X-CSE-ConnectionGUID: Q3FXctg8Q3aj3Vw7X3+vYA==
X-CSE-MsgGUID: Tf5ghmqpSGmIOGb/CAmzGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61993725"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="61993725"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:56 -0800
X-CSE-ConnectionGUID: T3TfQsnlR3afJD1S0Yl2TQ==
X-CSE-MsgGUID: Opf0uQNlT4CZL6H6hCptRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134594805"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:55 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 08/14] drm/xe: Cleanup extra calls to
 xe_hw_fence_irq_finish()
Date: Thu,  6 Feb 2025 15:23:26 -0800
Message-ID: <20250206232333.2660325-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206232333.2660325-1-lucas.demarchi@intel.com>
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
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

Now that xe_gt_remove is handled entirely by xe_gt, it's clear there are
some extra calls to xe_hw_fence_irq_finish() that aren't necessary.
Neither all_fw_domain_init() or gt_fw_domain_init() need to do that
since it's handled by the caller on any error.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c33040278e1aa..bd16ca070dd20 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -389,13 +389,11 @@ static void dump_pat_on_error(struct xe_gt *gt)
 static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
-	int err, i;
+	int err;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref) {
-		err = -ETIMEDOUT;
-		goto err_hw_fence_irq;
-	}
+	if (!fw_ref)
+		return -ETIMEDOUT;
 
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
@@ -436,9 +434,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 err_force_wake:
 	dump_pat_on_error(gt);
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-err_hw_fence_irq:
-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
 	return err;
 }
@@ -446,7 +441,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 static int all_fw_domain_init(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
-	int err, i;
+	int err;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
@@ -524,8 +519,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 err_force_wake:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
 	return err;
 }
-- 
2.48.1

