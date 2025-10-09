Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212C2CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 18:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C894410EAC7;
	Thu,  9 Oct 2025 18:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPwmv9iL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD31910EAC7
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 18:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760033519; x=1791569519;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lKe5gO+sWKmtXtZUAXCEntzLsTqdZduy/pr665Qu4p8=;
 b=LPwmv9iLgcsKisUmbpDtlvEffx6rbk+WKN+yc2aAFn3fXDTPfMerKy90
 B0DjBdqG0Yj1Rp9bXkfWTvShR0KkFrXRN9SYgYCDhKnC1A6/cOm3uHWMs
 aZNnP6FoadWVt/4s20xS8uy2TI1pN/b0sa6/XgS33CtL6lvtQ5/Mdpxx1
 dKARrXXVljAmxDow3Mu+7abe1db4ja3tLQtGlifQe2Pw5MAEHGGbxJGP0
 g6dTkF2ElF7GmFPpEvtel2XEx4bLnL2XViAUlpE2QDR5NUTAxphM5sVn1
 wl/jfAEHHKNQFbBeWu1YgClh+4iTMCGlvFIFKcn5fefPrfJ5ouT9lxjwu w==;
X-CSE-ConnectionGUID: Hn9ZM503QPGsGZ7HSKLudA==
X-CSE-MsgGUID: +MnUUjUKQN6HRXZTt6529Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73597770"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="73597770"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 11:11:59 -0700
X-CSE-ConnectionGUID: mL6iZfZXQiaPomDFzW6/BQ==
X-CSE-MsgGUID: ahBvCZIEQXqFwRgh91gXXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="185028932"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 11:11:56 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] drm/xe/guc: Refresh RPe frequency while setting min frequency
Date: Thu,  9 Oct 2025 23:38:54 +0530
Message-ID: <20251009180853.578184-2-sk.anirban@intel.com>
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

Replace cached pc->rpe_freq with xe_guc_pc_get_rpe_freq() call to ensure
current RPe values are used when setting
SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 3c0feb50a1e2..ea1ff96bec32 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 	 * Our goal is to have the admin choices respected.
 	 */
 	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
-			    freq < pc->rpe_freq);
+			    freq < xe_guc_pc_get_rpe_freq(pc));
 
 	return pc_action_set_param(pc,
 				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
-- 
2.43.0

