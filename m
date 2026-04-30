Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46263FF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 13:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC58510E7E1;
	Thu, 30 Apr 2026 13:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHKPFZMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B8A10E190;
 Thu, 30 Apr 2026 13:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777556688; x=1809092688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N30Niq+GNiubFtSK+b61sEikeqy017BfDQkgdBdGOXk=;
 b=IHKPFZMUYM/oD403Snj1lZEN6LGAy0KgKb9krqXRbINxl7g82iRoMRKC
 t5026xpMH4fOS8t8FlZgU4yOoy5+gHfdb83yZQ67xF+l6sqb+Hvax04rF
 n6vx+SfYQRnnhwjH+UxSJemZEysqgAkDnWI9RnfLNb+VBH03GnCBBKIfM
 OHuQq3AwrirFl9Vpg0/fEm0TkhQGsRyLTUh5ThiAV1Jfg7Yg9B1TKIbmN
 MjoYbRG/192OwMv0ZiWp1zya018ZtpW9cdWCza+8B8DMMV0qC8RhbGhxF
 hth6RxJCbgXs+eh3W3ktmO8a1wyXTRfglsvp8/1ZSCx3MTEP0Y9PAt95C A==;
X-CSE-ConnectionGUID: UYYvShiURrmrW+GG3r9UFQ==
X-CSE-MsgGUID: iIN/Z4yFSIepuazI3lxlqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77532391"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="77532391"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:44:48 -0700
X-CSE-ConnectionGUID: hNKHYuDvSFuDm4emeRDeWQ==
X-CSE-MsgGUID: 5FoxaZQ7SleQP9bs9dhz2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="236371553"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:44:47 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, gustavo.sousa@intel.com,
 ankit.k.nautiyal@intel.com
Subject: [PATCH v2 1/3] drm/i915/psr: Unify DC state handling for PSR and
 Panel Replay on VBI enable
Date: Thu, 30 Apr 2026 19:15:03 +0530
Message-ID: <20260430134505.1728443-2-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430134505.1728443-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260430134505.1728443-1-dibin.moolakadan.subrahmanian@intel.com>
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

