Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA70D5C0D1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 08:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868F810E776;
	Tue, 16 Dec 2025 08:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+aF2OSA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA11010E776;
 Tue, 16 Dec 2025 08:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765873749; x=1797409749;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sJYj9GIq/Xt92qhD3cHUMINtu2H4sXLCDJzAuh2PVzs=;
 b=I+aF2OSAknkT4HyeSSrxcYytEQreDZ5M2I/u+sTogrg7EON5xOx2OClb
 J4UPUxfg8+b+slZY+AE6kym5BglcVHjDYXB0Tp4WjzYlWSLu8FEbZvCFd
 jsuNwBPJnmIEFecZVdtBj82/8TzAEU4jaIuXmT4BWViBn0XBO75l7qqoP
 pJej/b4cUAgRcfBlqUXgTztl/n4Lo9U4Ur/Djudc56TY7Kk1ThEaEDP+3
 qaShCF9p1qXSs4fX6gJE6qomdrVuljuWkR0QhH84nNd5iINSiYNe1GEQA
 4gU939i4RCACuO5IBjdIJeA5ruQMStIPzRp0UMqvwG4lAo8zee1S+V9Oz w==;
X-CSE-ConnectionGUID: s7ZjmoFNRUOna9FfuAFPOw==
X-CSE-MsgGUID: OHczA4DdQnebQhmVTb3suQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79241942"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="79241942"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:29:08 -0800
X-CSE-ConnectionGUID: hwCjY6RsSqGJgLk07RfIsQ==
X-CSE-MsgGUID: fXRMLNzxSKaZgvsk0OiDgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="235363767"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:29:05 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH] drm/i915/display: drm_WARN_ON on async flip on plane not
 supporting it
Date: Tue, 16 Dec 2025 10:28:46 +0200
Message-ID: <20251216082846.2467892-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
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

Currently we are doing silently synchronized flip if user-space is
requesting async flip on plane not supporting it. Add drm_WARN_ON for this
scenario. Instead of silently switching to synchronized flip continue to
async flip as requested.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 3dc2ed52147f..88c981a17fc5 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -471,9 +471,6 @@ static bool intel_plane_do_async_flip(struct intel_plane *plane,
 {
 	struct intel_display *display = to_intel_display(plane);
 
-	if (!plane->async_flip)
-		return false;
-
 	if (!new_crtc_state->uapi.async_flip)
 		return false;
 
@@ -654,6 +651,8 @@ static int intel_plane_atomic_calc_changes(const struct intel_crtc_state *old_cr
 	    ilk_must_disable_cxsr(new_crtc_state, old_plane_state, new_plane_state))
 		new_crtc_state->disable_cxsr = true;
 
+	drm_WARN_ON(display->drm, new_crtc_state->uapi.async_flip && !plane->async_flip);
+
 	if (intel_plane_do_async_flip(plane, old_crtc_state, new_crtc_state))
 		new_crtc_state->do_async_flip = true;
 
-- 
2.43.0

