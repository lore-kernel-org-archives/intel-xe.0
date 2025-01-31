Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F6AC02195
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 22:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD00710E439;
	Fri, 31 Jan 2025 22:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxELWZJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A406A10E265
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 22:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738362718; x=1769898718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6mIKW/Zx39q0rg04uH7D/M63lwN3C03xYvSZft/SlyY=;
 b=gxELWZJTu+GeQ9ru4JiAn0C1DKrvFMVSzGogZnH/r/Gd2ToCGgusCKWf
 yKaQHfY64kaPR+qE67eM64zJGDSkjEywAJi2Gjj9/k8aJ+YD9Fkj7SSqa
 S0+juvboURIWHe3MLhNAs8N/jecRmz0PpsSy/hp5t0HDEVyImEM0u0kDs
 qJCCrqwyLMBvF3taEujnpIw1Xfwho7KawGQvvfsidvj9pEWzZfuweDDx+
 Amnf9qc4KCNlCLFInl8YUO8NKHI2qTwM09gK12fVbJdJCxmzZewWAkWu4
 g0/vECfutwZfcQPX1nYTPir2aGRLYoOermwVakIskVzBosST4KgV4pTNe Q==;
X-CSE-ConnectionGUID: RtngyOb/SM6KXkSSmmQIwQ==
X-CSE-MsgGUID: Z4UXOk33SWOQ2lTdoJopdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38149070"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38149070"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:57 -0800
X-CSE-ConnectionGUID: OoBp38FWQeynlCMy5msu7A==
X-CSE-MsgGUID: qKYDWfsjS5Cg64jQ/Q3sTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110622325"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:56 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 6/7] drm/xe: Cleanup extra calls to  xe_hw_fence_irq_finish()
Date: Fri, 31 Jan 2025 14:31:39 -0800
Message-ID: <20250131223140.4144292-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250131223140.4144292-1-lucas.demarchi@intel.com>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 48f6fd8c14b65..b05a0f27cc88c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -388,13 +388,11 @@ static void dump_pat_on_error(struct xe_gt *gt)
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
@@ -435,9 +433,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 err_force_wake:
 	dump_pat_on_error(gt);
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-err_hw_fence_irq:
-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
 	return err;
 }
@@ -445,7 +440,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 static int all_fw_domain_init(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
-	int err, i;
+	int err;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
@@ -523,8 +518,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 err_force_wake:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
 	return err;
 }
-- 
2.48.0

