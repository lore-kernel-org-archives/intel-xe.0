Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A56F9D0D3
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 14:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C7610E613;
	Tue, 14 Apr 2026 14:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jo3+PT10";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660E810E34F;
 Tue, 14 Apr 2026 14:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776176599; x=1807712599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jdcUrQnImJhOaH3KcAtOYhkPlLCIw5lD5hSfkUezpIA=;
 b=Jo3+PT10zVnOp3QXLgFrOLwT9I/i0857/loI137gE6+Y8uxOKA7eJ16J
 ZqnEpa1h07Y58PyxpiHEZSpmgLKXSItPIlyWjhfxq41MgqmVGAkq/lhG1
 3FWOPqB76pFJVPD7XbUsqaEITZ9HrxJUHnOhsDNg7kYbQwTHbBobbBd9X
 2qL+YqePlB/gmcR4Xi2w/s0ju+V1Xyf+h9goP0xAwSlQeyZCYqZy+WxcW
 izat5F/MAMYNJp5vIzdJujabtH2Z6CaDjkFWOByLhAFHxhOSvGOxzIn2/
 aKbFG/u1m/qCPrBgbZVeXnHwj9p+dvi3XodW7kebPeY1ybICvPE8jZr77 g==;
X-CSE-ConnectionGUID: 22TYKzBNQiCHnBMH/JIctQ==
X-CSE-MsgGUID: m0CduzcdQ1+E18lbXxSa7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76297618"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76297618"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:23:19 -0700
X-CSE-ConnectionGUID: BB/Df8LgQbavsRouW/1umA==
X-CSE-MsgGUID: JSoM2W4JTHmhD/yqydeRXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234149912"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:23:17 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 5/5] drm/i915/reset: Disable execlist per-engine reset for
 display reset tests
Date: Tue, 14 Apr 2026 17:22:47 +0300
Message-ID: <20260414142247.651-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260414142247.651-1-ville.syrjala@linux.intel.com>
References: <20260414142247.651-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The display reset only happens from the full reset path. We must
therefore force execlist submission to always take the full reset
path and not the per-engine reset path. Currently the display
reset tests are in fact not testing display resets at all on
platforms using execlist submission. Ring submission and GuC
submission always take the full path anyway.

Also disable the engine reset inside __intel_gt_set_wedged() so
that we simulate the intel_gt_gpu_reset_clobbers_display() behavior
as closely as possible also when taking the full wedge path.

The slight race between the separate intel_display_reset_test()
calls in the overall reset path is harmless. kms_busy will keep
the modparam fixed during the test, and even if someone were to
fiddle with the modparam manually nothing bad should happen if
the calls return different values.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index a1e6aaca8c9b..0b5f3fc58009 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -967,6 +967,7 @@ static void nop_submit_request(struct i915_request *request)
 
 static void __intel_gt_set_wedged(struct intel_gt *gt)
 {
+	struct intel_display *display = gt->i915->display;
 	struct intel_engine_cs *engine;
 	intel_engine_mask_t awake;
 	enum intel_engine_id id;
@@ -984,7 +985,8 @@ static void __intel_gt_set_wedged(struct intel_gt *gt)
 	awake = reset_prepare(gt);
 
 	/* Even if the GPU reset fails, it should still stop the engines */
-	if (!intel_gt_gpu_reset_clobbers_display(gt))
+	if (!intel_gt_gpu_reset_clobbers_display(gt) &&
+	    !intel_display_reset_test(display))
 		intel_gt_reset_all_engines(gt);
 
 	for_each_engine(engine, gt, id)
@@ -1506,9 +1508,10 @@ void intel_gt_handle_error(struct intel_gt *gt,
 
 	/*
 	 * Try engine reset when available. We fall back to full reset if
-	 * single reset fails.
+	 * single reset fails. Display reset test needs a full reset.
 	 */
-	if (!intel_uc_uses_guc_submission(&gt->uc) &&
+	if (!intel_display_reset_test(gt->i915->display) &&
+	    !intel_uc_uses_guc_submission(&gt->uc) &&
 	    intel_has_reset_engine(gt) && !intel_gt_is_wedged(gt)) {
 		local_bh_disable();
 		for_each_engine_masked(engine, gt, engine_mask, tmp) {
-- 
2.52.0

