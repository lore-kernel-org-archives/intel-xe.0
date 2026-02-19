Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509A2E9A059
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 18:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0753210E737;
	Thu, 19 Feb 2026 18:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hHVQ9Dpj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC49210E72C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771524424; x=1803060424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/s1GMi7gWg1IrYbZAWLEg5F8cSQRD1dV7Z5nj5e3yds=;
 b=hHVQ9DpjN+Ls8ir7bX8SLn6EEZguRk3wLSR2xsukCEqO9g76fB+kEE3V
 7N+LVcKb+tLkhW1pQR/+WT+Srw71n28XojAHtk3LmGy+L7Bhgq7mJI5K7
 FYuKKX9Tp1phYlcgIU9AkHfOCdMf/UYmh5iV6uwqtiRPXff4x6hCGqknv
 L1NEYbEAhpIb29rBV1pYyYZ27ezXFHJFvuxe2Eynx741REl91hc1kqAgp
 FFB3WtCzgTKEp23oJUp9u6pQgpFfnRlkdftQBfoHrOAp/YP6jtOCX8IJX
 XsVAsmz0Ui1F3+cEcNRRgC3aGzwPWddrc4LV6wcHK01oJog3pcmgbi13z A==;
X-CSE-ConnectionGUID: SqTIsPlvRviEYwRjkbo7Tg==
X-CSE-MsgGUID: WFKSxzDBSm+6xnk1dYVgGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76482816"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="76482816"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 10:07:03 -0800
X-CSE-ConnectionGUID: Brvct34kTduYaFvnFF6KaA==
X-CSE-MsgGUID: BEvPGeyjSeS4t7mTCAzPPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="245189028"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa002.jf.intel.com with ESMTP; 19 Feb 2026 10:07:04 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko@freedesktop.org, Michal <Michal.Wajdeczko@intel.com>,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v7 4/7] drm/xe: Use XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET enum
 instead of magic number
Date: Thu, 19 Feb 2026 13:06:58 -0500
Message-Id: <20260219180701.2418453-5-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219180701.2418453-1-zhanjun.dong@intel.com>
References: <20260219180701.2418453-1-zhanjun.dong@intel.com>
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

Replace the magic number 2 with the proper enum value
XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET for better code readability
and maintainability.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 91c7600a59f5..cd434caec9c2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1334,12 +1334,13 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 	if (!guc->submission_state.initialized)
 		return;
 
-	if (xe->wedged.mode == 2) {
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
 		err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
 					       guc_submit_wedged_fini, guc);
 		if (err) {
-			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
-				  "Although device is wedged.\n");
+			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=%s; "
+				  "Although device is wedged.\n",
+				  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET));
 			return;
 		}
 
-- 
2.34.1

