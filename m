Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A22C5AC67
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 11:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B55A10F18C;
	Thu,  6 Aug 2026 11:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXh6oVd6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEF010F18C
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 11:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786014060; x=1817550060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+xE+78cSq7T5FhpRIpSOf04J39urYAf7J8RCHPakei0=;
 b=AXh6oVd6CyFUGjlXG7xBRSOveJu3azNI4PxKKYkvMW8LgP1/u4uJIts3
 Iku2FvXYTGJTqn74YMDGimuctacdjX1FoOLwP+Meio1UG+3tIhvSG0BtA
 xvQRkT/y2pWRk1U0fp6l6qNroe9UWXbwdI4Gv83epMOCuwe6Tov3DS0gp
 pzREGiByLGDuzfJsb/raLCG4nC34cryIVrLcHKPkKg0NoHggiNNyDL2Ca
 54JG5f4BjtlUdijGyrCfrWGO2IemwwAxp9/sXv3Eg1am6KQG6+DAiF03r
 2vwsd42/K6c7mZZ23jXYhtMkTe2nhdbo1oCaLlbbLrLShcXjVrI/s9mYM A==;
X-CSE-ConnectionGUID: cYte5NKUQdimY+HbQD51rQ==
X-CSE-MsgGUID: 6Z8ZLfL6T1KWkfiGQsVHew==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86614762"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="86614762"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 04:01:00 -0700
X-CSE-ConnectionGUID: BDbu/b+XQwKmIk60HDtibw==
X-CSE-MsgGUID: 0PuDz+IeTsuZI6uFANeiFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="259453673"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 06 Aug 2026 04:00:56 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 3/4] drm/xe/pcode: Improve pcode timeout logging
Date: Thu,  6 Aug 2026 16:30:43 +0530
Message-ID: <20260806110039.1245282-9-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806110039.1245282-6-mallesh.koujalagi@intel.com>
References: <20260806110039.1245282-6-mallesh.koujalagi@intel.com>
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

Use xe_log_err() for pcode timeout errors instead of drm_err(). This
adds PCODE component tag, making timeout issues easier to detect and
track with automated tools.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index c492737242d3..b5a59a227167 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -220,8 +220,8 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
 	 * requests, and for any quirks of the PCODE firmware that delays
 	 * the request completion.
 	 */
-	drm_err(&tile_to_xe(tile)->drm,
-		"PCODE timeout, retrying with preemption disabled\n");
+	xe_log_err(tile, PCODE, -ETIMEDOUT,
+		   "PCODE timeout, retrying with preemption disabled\n");
 	preempt_disable();
 	ret = pcode_try_request(tile, mbox, request, reply_mask, reply, &status,
 				true, 50 * 1000, true);
-- 
2.48.1

