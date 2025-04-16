Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA73C369B1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 05:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1744F10E834;
	Wed, 16 Apr 2025 05:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGRDMkxg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA81C10E834
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 05:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744782216; x=1776318216;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KlSMjAIzkrpnzJQM8kNthYgnIqFCbGRgESWTXxv5Xsk=;
 b=aGRDMkxg1jaTmMST+B1qavQA7EO551MAtdjVlAuRvwUY4kW+EStQzVKL
 jbEIeHe3Kpy744Rx+G+aDMAF+cIswoRc2UCGKOZNWCDPdbZO5HXxRGxoO
 oScPLvW/sgQ7DIL375KqQSLBrf2L02bOTcr+txKbBtcS+db/n3x8KDDVJ
 QFnXPhqwBFObhscfk2Kd3ExEZX2IWBo6v/MZAtf2+N4JS5CAA1/V0HJSk
 6G8+CCIH/IG9ZXHc6huUHt3+ZvCrrG+lGIKeIpFUyzp6L9geWicAxoer8
 jdQH9atxPeLGLUqkk5NrX6YSAXXXDPwUProffaEWvvRlBwuxW7GaswaZn Q==;
X-CSE-ConnectionGUID: +0WzRkWPQ9mEkGfmH3ukZA==
X-CSE-MsgGUID: MCKE2Eu8Q8SEKZFIRSQfBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="63718792"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="63718792"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 22:43:36 -0700
X-CSE-ConnectionGUID: L+WUZO4IQCi6U5aGER+OSw==
X-CSE-MsgGUID: x6CWV6/QS2e3lauxODchPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="167499157"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 22:43:34 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH] drm/xe/xe_pmu: Add a null check for xe gt
Date: Wed, 16 Apr 2025 11:35:31 +0530
Message-ID: <20250416060531.2454332-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

The PMU initialization function exits if gt is invalid,
eliminating the need for additional checks. However, absence
of these checks causes static analysis tool warnings

Add a null check for gt to avoid static analysis tool warnings

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 69df0e3520a5..5550ed30018f 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -141,6 +141,8 @@ static bool event_gt_forcewake(struct perf_event *event)
 		return true;
 
 	gt = xe_device_get_gt(xe, config_to_gt_id(config));
+	if (!gt)
+		return false;
 
 	fw_ref = kzalloc(sizeof(*fw_ref), GFP_KERNEL);
 	if (!fw_ref)
@@ -211,11 +213,10 @@ static bool event_param_valid(struct perf_event *event)
 static void xe_pmu_event_destroy(struct perf_event *event)
 {
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
-	struct xe_gt *gt;
 	unsigned int *fw_ref = event->pmu_private;
+	struct xe_gt *gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
 
-	if (fw_ref) {
-		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
+	if (fw_ref && gt) {
 		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
 		kfree(fw_ref);
 		event->pmu_private = NULL;
-- 
2.47.1

