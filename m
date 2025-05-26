Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA508C5AD49
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 12:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B5410E35E;
	Mon, 26 May 2025 12:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lcLI2n0l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A8910E2E8
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 12:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748261150; x=1779797150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EZRif6mjYfANn52EIufxwTVisYUEBZvz+aehc8ZQHIg=;
 b=lcLI2n0lWQWqZs6iYAM16zCChWPshYR5gBqqiURqP/VpsOpEj0K9xlc7
 e5snLfvhnfdMMsgIDqaeu3XeQhhMkNbJkgtRXq+qKjmKHbD0s6XPW5kif
 hwcMnn5S2VC2ONEPUKOyG71aB/DvutioUopYVUwcDBWnAh4b075uIpkSW
 ZXL7GD4uVUact8AU1j45CYOepdAnPx68vkiubmCGz95uOSFcCW+d02n7i
 9hXSbYpjpOiFuz+dSNHqSUT8PTi2Jo30HtaD2LNSfeqBQNSLU8/E9XkqE
 3qz2o9nXr39L/Wls4yKfUOlTFMvEz9L0ysxpyMkj9RLUJAnYcWAlli3Uw A==;
X-CSE-ConnectionGUID: NSloXrb0RLOVL6G4LYpcxw==
X-CSE-MsgGUID: TQlM/rovRN2VjYF3jCSB2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60492325"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="60492325"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:50 -0700
X-CSE-ConnectionGUID: oj3i8Sz4RIqH6Y0lNNr9Sw==
X-CSE-MsgGUID: F/4etBpHSbKQwqELnJniPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="147576175"
Received: from johunt-mobl9.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:49 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 12/12] drm/i915/psr: Do not disable Panel Replay in case
 VRR is enabled
Date: Mon, 26 May 2025 15:05:12 +0300
Message-ID: <20250526120512.1702815-13-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526120512.1702815-1-jouni.hogander@intel.com>
References: <20250526120512.1702815-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Allow Panel Replay with VRR. All VRR modes are supposed to work with
Panel Replay.

Bspec: 68920, 68925
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 38535e0d2496..db7111374293 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1579,6 +1579,12 @@ static bool _psr_compute_config(struct intel_dp *intel_dp,
 	if (!CAN_PSR(intel_dp))
 		return false;
 
+	/*
+	 * Currently PSR doesn't work reliably with VRR enabled.
+	 */
+	if (crtc_state->vrr.enable)
+		return false;
+
 	entry_setup_frames = intel_psr_entry_setup_frames(intel_dp, adjusted_mode);
 
 	if (entry_setup_frames >= 0) {
@@ -1696,12 +1702,6 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
 		return;
 	}
 
-	/*
-	 * Currently PSR/PR doesn't work reliably with VRR enabled.
-	 */
-	if (crtc_state->vrr.enable)
-		return;
-
 	crtc_state->has_panel_replay = _panel_replay_compute_config(intel_dp,
 								    crtc_state,
 								    conn_state);
-- 
2.43.0

