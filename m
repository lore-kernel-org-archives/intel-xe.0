Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C6EFF8875
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 11:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AA010EF16;
	Wed, 29 Apr 2026 11:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXyhXVLi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7530710E072;
 Wed, 29 Apr 2026 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777460426; x=1808996426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BfVF5sEjZX0qeSt7dpEJxL//PdtdBnVzX/xgT01deqE=;
 b=mXyhXVLiTiGLl98IL7hnPyxNPDclzH6FWfsuWMvqOz2warv4+FIcXZrX
 WJjLu4DGvx5NydOiAUt4TGI33ljk35Lm20aZPX1ajeRvN9gUPg4LB1WWp
 PKd6i+SgmxPm5dHl153AW3Kj4AK2C6Rg1iORHkYKxD1PkIv0KwUa+vytX
 aVmuQRlluZapXH2RT8GDwYJCBIN9owwed++P/ZOyDpaNaaSkc1IwOp2+Y
 g29hBgxLaFdb+h+dmimrfqh1UBCy/Cf7LlEUscNc03tk7Dq4WZxm0DW6T
 L4eaqGr2J6xS0lYXHTv+45dspcR3Ec+l8qdXWVgm+r5AhJ/EMXNFd92vH Q==;
X-CSE-ConnectionGUID: ZCKCIXgnSTOaLKaxEK8V0A==
X-CSE-MsgGUID: Gixn8atRQiGSzBfYlT0StQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78280013"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208,223";a="78280013"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 04:00:09 -0700
X-CSE-ConnectionGUID: TCZe2L3XTEyCgHWLUqjtDw==
X-CSE-MsgGUID: VfXON0CkTjeKadOtnKdbQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
 d="scan'208,223";a="264614304"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 04:00:08 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com
Subject: [PATCH 2/2] drm/i915/psr: Use DMC wakelock instead of DC state for VBI
Date: Wed, 29 Apr 2026 16:30:23 +0530
Message-ID: <20260429110023.611664-3-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429110023.611664-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260429110023.611664-1-dibin.moolakadan.subrahmanian@intel.com>
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

From display version 30+, use the DMC wakelock mechanism for
preventing DC entry. Older platforms continue to use
set_target_dc_state() to disable DC entry during active vblank.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/2296
Fixes: acfc688bc51b ("drm/i915/dmc: Reduce wakelock hold time")
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 26 +++++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 9acd47392192..d01b4013f33f 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -4151,16 +4151,22 @@ void intel_psr_notify_vblank_enable_disable(struct intel_display *display,
 		mutex_unlock(&intel_dp->psr.lock);
 		break;
 	}
-
-	/*
-	 * NOTE: intel_display_power_set_target_dc_state is used
-	 * only by PSR * code for DC3CO handling. DC3CO target
-	 * state is currently disabled in * PSR code. If DC3CO
-	 * is taken into use we need take that into account here
-	 * as well.
-	 */
-	intel_display_power_set_target_dc_state(display, enable ? DC_STATE_DISABLE :
-						DC_STATE_EN_UPTO_DC6);
+	if (DISPLAY_VER(display) < 30) {
+		/*
+		 * NOTE: intel_display_power_set_target_dc_state is used
+		 * only by PSR code for DC3CO handling. DC3CO target
+		 * state is currently disabled in PSR code. If DC3CO
+		 * is taken into use we need take that into account here
+		 * as well.
+		 */
+		intel_display_power_set_target_dc_state(display, enable ? DC_STATE_DISABLE :
+							DC_STATE_EN_UPTO_DC6);
+	} else {
+		if (enable)
+			intel_dmc_wl_get_noreg(display);
+		else
+			intel_dmc_wl_put_noreg(display);
+	}
 }
 
 static void
-- 
2.43.0

