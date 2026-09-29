Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68715CA5FB1
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 09:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126B410EDF8;
	Tue, 29 Sep 2026 09:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khfd7TN4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374EF10EDDB;
 Tue, 29 Sep 2026 09:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790675105; x=1822211105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4UDa/bzfYZFdPoUKV75tYzOIDsBsDY2xHBg+G8vXNYs=;
 b=khfd7TN4I9MRI0+PfiGYHUOyYtDl6+XOhXJgHwaQ6e5/2XHeQVce8L20
 Sx64MhvY3h3XWrD6VosQR7pbwUbnziAKssUaV2DofO9nS6EcbO2tbDTM4
 OCPFFb7+mA/gcGjUHTkMppFLuPNcqXKuT5Loq8gsLAiNY5VPyaiT32mP+
 Y40RSic7WvAjJwyirzjPTuVnz5BXBPiF6V0vFd2KlQvip5dk+ShyItWvV
 CAUgoe23l9ELfG6Icqm8yVNWhd24qrVgJjbIA1cq7Aa8NfKO0KCk2sFMp
 eQYeVuLUSCHmwswpBcsWmqSXVcE52jXMLLQUoLFcfv2Yl+ojqLo6OdnV+ g==;
X-CSE-ConnectionGUID: 1twoeb9jSxyVciJzCjDcmA==
X-CSE-MsgGUID: cISzIP2uScC5FBkOGrME5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91250079"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91250079"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:45:03 -0700
X-CSE-ConnectionGUID: Mx5SOrPhSBCIp4HqUcZtiA==
X-CSE-MsgGUID: iEBBUllAQjCK5bryJqTCzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="283415058"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.120])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:45:01 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 7/8] drm/i915/psr: Remove drm_info_once on failed selective
 fetch area
Date: Tue, 29 Sep 2026 12:44:33 +0300
Message-ID: <20260929094434.77129-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929094434.77129-1-jouni.hogander@intel.com>
References: <20260929094434.77129-1-jouni.hogander@intel.com>
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

Selective fetch area is left as zero sized only when none of the planes
report any damage. This is a normal outcome e.g. on initial commit and not
a failure, so drop the misleading message and just do the full update
silently.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index e2b35b9fee5b2..d8fefb13c2790 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2889,7 +2889,6 @@ intel_psr_apply_su_area_workarounds(struct intel_crtc_state *crtc_state)
 int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 				struct intel_crtc *crtc)
 {
-	struct intel_display *display = to_intel_display(state);
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc_state *crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
@@ -3006,12 +3005,8 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 	 * should identify cases where this happens and fix the area
 	 * calculation for those.
 	 */
-	if (crtc_state->psr2_su_area.y1 == -1) {
-		drm_info_once(display->drm,
-			      "Selective fetch area calculation failed in pipe %c\n",
-			      pipe_name(crtc->pipe));
+	if (crtc_state->psr2_su_area.y1 == -1)
 		full_update = true;
-	}
 
 	if (full_update)
 		goto skip_su_area_calc;
-- 
2.43.0

