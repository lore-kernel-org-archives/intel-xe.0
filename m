Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5527CD3C538
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 22:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D78910E064;
	Thu, 17 Oct 2024 22:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="llCinV3z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EE110E064
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 22:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729205613; x=1760741613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O4rIesgLCMnEYDMMxfOBA12V35UyxRkn4V+9vWRFyi8=;
 b=llCinV3zngCaeEEVvbN0W0aDAjcyS0aRFNxxfOpjsR3u8PAcHg+6A+hL
 g8m4Y1RzBXOISTRfFy7BpM91ULP0kriBpMxQ8av5BnOsYl90bGSQtH7ef
 ZE31y6eKXssZEdz6Id7mN9aMgBdbghhjuBti+0NY+MgBFFSiXBOAjS43P
 /XqIUuPemHhaAPmsYoTQ49jUu94yYl3cbD6wMizSAUCmMVlkCCJgxPP4X
 RIwAngwnvxeIJ/thJIVD1IbBUafgZwwDcMNdaT0TF5Jd7npV9p8+7vqG8
 fi5YghD87xYGnUnjEGpOUOuDdk2rADPQyZAq5gghL7Kbtrm0mY+ozbSnQ g==;
X-CSE-ConnectionGUID: 6E/q/03pQRGO8N3+iUeFQw==
X-CSE-MsgGUID: 0pSoR7SoSbyBsrcRLX63DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28683409"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28683409"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 15:53:33 -0700
X-CSE-ConnectionGUID: i1+88t6OQvqHC2ReR7lDOw==
X-CSE-MsgGUID: G2Xz+cWJQqOCl8H59c0biQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="82652234"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.61])
 by fmviesa003.fm.intel.com with ESMTP; 17 Oct 2024 15:53:29 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Alex Zuo <alex.zuo@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4] drm/xe: Handle unreliable MMIO reads during forcewake
Date: Thu, 17 Oct 2024 22:15:47 +0000
Message-Id: <20241017221547.1564029-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241017034026.1525693-1-shuicheng.lin@intel.com>
References: <20241017034026.1525693-1-shuicheng.lin@intel.com>
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

In some cases, when the driver attempts to read an MMIO register,
the hardware may return 0xFFFFFFFF. The current force wake path
code treats this as a valid response, as it only checks the BIT.
However, 0xFFFFFFFF should be considered an invalid value, indicating
a potential issue. To address this, we should add a log entry to
highlight this condition and return failure.
The force wake failure log level is changed from notice to err
to match the failure return value.

v2 (Matt Brost):
  - set ret value (-EIO) to kick the error to upper layers
v3 (Rodrigo):
  - add commit message for the log level promotion from notice to err
v4:
  - update reviewed info

Suggested-by: Alex Zuo <alex.zuo@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Acked-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index a64c14757c84..08621717b14b 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -115,9 +115,15 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
 			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
 			     &value, true);
 	if (ret)
-		xe_gt_notice(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
-			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
-			     domain->reg_ack.addr, value);
+		xe_gt_err(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
+			  domain->id, str_wake_sleep(wake), ERR_PTR(ret),
+			  domain->reg_ack.addr, value);
+	if (value == ~0) {
+		xe_gt_err(gt,
+			  "Force wake domain %d: %s. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!\n",
+			  domain->id, str_wake_sleep(wake));
+		ret = -EIO;
+	}
 
 	return ret;
 }
-- 
2.25.1

