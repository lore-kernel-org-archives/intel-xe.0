Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F2FFF8875
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 11:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6798D10EEEA;
	Wed, 29 Apr 2026 11:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j/8dPhq9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9018610E072;
 Wed, 29 Apr 2026 11:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777460408; x=1808996408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N30Niq+GNiubFtSK+b61sEikeqy017BfDQkgdBdGOXk=;
 b=j/8dPhq994FuFSPEyH4aMydPwXd2/yTnuvyaZOOB2YCmFu7ROZvn1eHt
 7403QdUMfo3X9KRTVGJTytG4te/uwr39fx1V4fvrsOZ/ewOGM3vGYKD6H
 uEpsfzlQTrwHl7Mvkjn5qGmSHnYSa6fcbg4Yh8AOj/AIdzZe33LfRFP2m
 nwMs7SqqDpwHVjX3zsHoM+j6iKf/tS6MROvfP/PR3flJJxkZo0xgVobYd
 y3l6CDC4J1TD3eiXhxy18alN2J2l+e1STQ+OCDBMn9aV717iKvcLUB6UJ
 QPbmCoyO/HOS1x+euSorleJp1i+yDi/1jz7Qj7k1zM+LAdmLPPClLRIUL w==;
X-CSE-ConnectionGUID: KjyjRBNeTqODrEVLcfZ13g==
X-CSE-MsgGUID: U8IbthNDS3SUbf5ymCV8uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78280005"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="78280005"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 04:00:07 -0700
X-CSE-ConnectionGUID: yYAjgpKEQzmPxq5cv5cF0Q==
X-CSE-MsgGUID: HsSh+zhBRzyW68SWiGvamw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="264614299"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 04:00:06 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com
Subject: [PATCH 1/2] drm/i915/psr: Unify DC state handling for PSR and Panel
 Replay on VBI enable
Date: Wed, 29 Apr 2026 16:30:22 +0530
Message-ID: <20260429110023.611664-2-dibin.moolakadan.subrahmanian@intel.com>
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

Unify the intel_psr_notify_vblank_enable_disable() path so that
DC state is disabled for both PSR and Panel Replay when vblank is
enabled, and restored when vblank is disabled.
VBI (vblank interrupt) enable is a PSR exit condition for both PSR1
and PSR2. This is safe because once vblank is enabled, PSR will exit
anyway, so the system will not be staying in deep DC states like DC6.

Bspec: 49274, 68934
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 63c19958a9e3..9acd47392192 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -4143,16 +4143,13 @@ void intel_psr_notify_vblank_enable_disable(struct intel_display *display,
 		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 
 		mutex_lock(&intel_dp->psr.lock);
-		if (intel_dp->psr.panel_replay_enabled) {
-			mutex_unlock(&intel_dp->psr.lock);
-			break;
-		}
-
-		if (intel_dp->psr.enabled && intel_dp->psr.pkg_c_latency_used)
+		if (intel_dp->psr.enabled &&
+		    intel_dp->psr.pkg_c_latency_used &&
+		    !intel_dp->psr.panel_replay_enabled)
 			intel_psr_apply_underrun_on_idle_wa_locked(intel_dp);
 
 		mutex_unlock(&intel_dp->psr.lock);
-		return;
+		break;
 	}
 
 	/*
-- 
2.43.0

