Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD8EC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 09:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AACF10F062;
	Wed,  8 Jul 2026 09:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEfKdAs+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5188D10F062;
 Wed,  8 Jul 2026 09:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783501738; x=1815037738;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tjZbhLCgV4m3uG1uBHWDhxJNBFtsgjxMJuN/0pRs4fw=;
 b=GEfKdAs+kK0u9iyvWih6lnNQ1HN6qcmTwj4Z/8nrwjpSd0N7G6FIM8ea
 N1C+nqrTodhJ6APcBE2Jb2+ifM/z5wkc/3tZ/1/FdCXo5YdqXPPxBVS+d
 q4JKt27De5XNLxtq3ENHTJ+YOWzIuV59WHMb8rB+fdhikSdO50MTPUCYD
 NFtNK5JffEF/NePaMhW9nMTxqe2Vps+fNL5IN1FxRjXuvvjfdQWSlnp7m
 yAS86LIi0FzWmf/0G7KrMDUvFALFzo07VgubZf11SSfZRdjc3lQ25tIpQ
 Vl0VMRDmBQVrxnqvqMw/J20ZGDFrLcDRFWfoJRoWjmLWQWLx23eZO3IDg A==;
X-CSE-ConnectionGUID: c+0/2gw8T/O2ayk+HQs80A==
X-CSE-MsgGUID: P2kd6kjYTFuefy3F4jpgNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="101582204"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="101582204"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 02:08:57 -0700
X-CSE-ConnectionGUID: xfE60HskTsSHM5+EkrX91Q==
X-CSE-MsgGUID: QLN8nlXORE+FUQSZcKx9fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="249793898"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 02:08:56 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com
Subject: [PATCH v2] drm/i915/dmc: Enable PIPEDMC_ERROR interrupt on display
 version 30+
Date: Wed,  8 Jul 2026 14:37:12 +0530
Message-ID: <20260708090712.3800170-1-dibin.moolakadan.subrahmanian@intel.com>
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

Enable PIPEDMC_ERROR alongside the existing PIPEDMC_GTT_FAULT and
PIPEDMC_ATS_FAULT interrupt bits for display version 30+.

On PTL, DC state transitions do not trigger the spurious PIPEDMC_ERROR
interrupts that were previously a concern. Enable the interrupt so pipe
DMC errors are reported by intel_pipedmc_irq_handler().

v2:
- Remove IGT reference from commit message (Suraj).

Bspec: 70296
Suggested-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 11f5dbf91e68..a191eee240d9 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -505,14 +505,16 @@ static void pipedmc_clock_gating_wa(struct intel_display *display, bool enable)
 
 static u32 pipedmc_interrupt_mask(struct intel_display *display)
 {
-	/*
-	 * TODO: Check if PIPEDMC_ERROR bit enabling causes errors
-	 * on PTL, enable it if validation passes
-	 */
 	if (DISPLAY_VER(display) >= 35)
 		return PIPEDMC_FLIPQ_PROG_DONE |
 			PIPEDMC_ERROR;
 
+	if (DISPLAY_VER(display) >= 30)
+		return PIPEDMC_FLIPQ_PROG_DONE |
+			PIPEDMC_GTT_FAULT |
+			PIPEDMC_ATS_FAULT |
+			PIPEDMC_ERROR;
+
 	/*
 	 * FIXME PIPEDMC_ERROR not enabled for now due to LNL pipe B
 	 * triggering it during the first DC state transition. Figure
-- 
2.43.0

