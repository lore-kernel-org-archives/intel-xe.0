Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A245BD66BA5
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 01:11:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2482A10E059;
	Wed, 27 Nov 2024 01:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4jt9Rs6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B302F10E059
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 01:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732669877; x=1764205877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hnF/i9RJ3D8KuQCIVjcXyQtTNJmoUc6w0QpBb2BDGZE=;
 b=e4jt9Rs6O+UaiPl5c3IppPaBZr9GNPvF+ITChc0WzXXuHMEJkdaXr4mN
 7qyH+LcmURRVsRxE65C8h/Mr61E7CYZ+yfmqBBkLt0gK175wJXux9FeAH
 AwPSUlKDxlbQW1KvMgftCsr3ONpxDIRMsD35sZ9qxy8ZxdnBp+PrZpDVO
 sS6wUH8Hk76NOTRTkt8JZo3vFRkev4V47DCaZ5MjbR0Bw7cL2coQAUKJt
 tVU4QYjQOhc36slKh70RErFTdI0c7GyT/vT1enE23waXzDZAd3Nx5V8YO
 YMK0qa1T9974JGgt1QWJatjdxT1a70zJE0wDDFoGOxI7+gSmu7nYy28jG g==;
X-CSE-ConnectionGUID: DiFgp57uRgSo9acemJY+Mg==
X-CSE-MsgGUID: cbgCEEBcS0e6zNLo67gedw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32801213"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="32801213"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 17:11:16 -0800
X-CSE-ConnectionGUID: NV7/d5KNTI+9xB1apHUW2A==
X-CSE-MsgGUID: U9RogetMTFCM9DgYl2AwLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="91675969"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 17:11:16 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
Date: Tue, 26 Nov 2024 17:11:05 -0800
Message-ID: <20241127011105.1306924-1-daniele.ceraolospurio@intel.com>
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

The DUAL_QUEUE_WA tells the GuC to not allow concurrent submissions
on RCS and CCSes with different address spaces, which on DG2 is
required as a WA for an HW bug. On newer platforms, this block has
been moved in HW at the CS level, by stalling the RCS/CCS context
switch when one of the other RCS/CCSes is busy with a different
address space. While functionally correct, having a submission
stalled on the HW limits the GuC ability to shuffle things around and
can cause complications if the non-stalled submission runs for a long
time, because the GuC doesn't know that the stalled submission isn't
actually running and might declare it as hung. Therefore, we enable
the DUAL_QUEUE_WA on all newer platforms to move management back to
the GuC.

Note that the GuC specs also recommend enabling this for all platforms
starting from MTL that have a CCS.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index df1ba94cf4ca..ddbfbdf901b0 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -151,7 +151,21 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 14014475959))
 		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
 
-	if (XE_WA(gt, 22011391025))
+	/*
+	 * The DUAL_QUEUE_WA tells the GuC to not allow concurrent submissions
+	 * on RCS and CCSes with different address spaces, which on DG2 is
+	 * required as a WA for an HW bug. On newer platforms, this block has
+	 * been moved in HW at the CS level, by stalling the RCS/CCS context
+	 * switch when one of the other RCS/CCSes is busy with a different
+	 * address space. While functionally correct, having a submission
+	 * stalled on the HW limits the GuC ability to shuffle things around and
+	 * can cause complications if the non-stalled submission runs for a long
+	 * time, because the GuC doesn't know that the stalled submission isn't
+	 * actually running and might declare it as hung. Therefore, we enable
+	 * the DUAL_QUEUE_WA on all newer platforms to move management back to
+	 * the GuC.
+	 */
+	if (XE_WA(gt, 22011391025) || GRAPHICS_VERx100(xe) >= 1270)
 		flags |= GUC_WA_DUAL_QUEUE;
 
 	/*
-- 
2.43.0

