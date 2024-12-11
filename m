Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0668FE7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 21:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0F310EC2C;
	Wed, 11 Dec 2024 21:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DGsOGTtF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2487110EC2C
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 21:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733954162; x=1765490162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qIlm6HPQN2PnCpCqi6qKnkKhWL2N+KeWhSxpmu+WSKg=;
 b=DGsOGTtFt4hKPWMOuDv0AXZYPJJ4rNDp+31sSUYmIq8d4Wre1qIG6pm8
 DPRjFhBfMtmjssV7ilYMPZ4ThrqH2dowhyqoW6D/aNc4+8o3g1IkiNOQC
 yKGJQZ7Vj7FCeLQZ0AaYyQq5ZkMVFzd7lpBsMc+Iqgug4UMq3obRj9pxW
 JmOZI32g191DfB39FdJJZKxSGQGirymp2BCa3Pl0pHnfzz2M+A4+7AZp0
 8mE948Hk/50siOFrKhdy+kbSRJu58a3sDktcRNSNYUjxveSttaEQSahhO
 6zAIeI4xPGs6nTxoebYwYvS90MX5bnKrQNnImetVhYQRPLua8cK7DHGcK A==;
X-CSE-ConnectionGUID: RdqI79gNT8iHqeLlwvbbMQ==
X-CSE-MsgGUID: TgvyWJiRToWM8vZy3/ZCjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45759643"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45759643"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 13:56:02 -0800
X-CSE-ConnectionGUID: pPwnhR8dQ7iC87/aOLSK1A==
X-CSE-MsgGUID: KFVUDaenS6OdH524wMc3Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100076531"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 13:56:02 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Jesus Narvaez <jesus.narvaez@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v2] drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
Date: Wed, 11 Dec 2024 13:55:46 -0800
Message-ID: <20241211215546.2053660-1-daniele.ceraolospurio@intel.com>
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

v2: only set the flag on GTs that have CCS engines

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Jesus Narvaez <jesus.narvaez@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 4e2868efb620..1d87933d7d0f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -147,6 +147,31 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
 	return flags;
 }
 
+static bool needs_wa_dual_queue(struct xe_gt *gt)
+{
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
+	 * the DUAL_QUEUE_WA on all newer platforms on GTs that have CCS engines
+	 * to move management back to the GuC.
+	 */
+	if (XE_WA(gt, 22011391025))
+		return true;
+
+	if (CCS_MASK(gt) && GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
+		return true;
+
+	return false;
+}
+
 static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -159,7 +184,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 14014475959))
 		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
 
-	if (XE_WA(gt, 22011391025))
+	if (needs_wa_dual_queue(gt))
 		flags |= GUC_WA_DUAL_QUEUE;
 
 	/*
-- 
2.43.0

