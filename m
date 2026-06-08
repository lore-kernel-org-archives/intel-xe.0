Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE883CD8CAA
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 12:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A128310F360;
	Mon,  8 Jun 2026 12:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEdys2IO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0E310F35F;
 Mon,  8 Jun 2026 12:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780923292; x=1812459292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X6odRRa4rqxgGgdEsoJugAY2GVZN9C0uxjMHJy8EKkI=;
 b=hEdys2IOUFSzHBTenwWeSkh3jkNVdY9uO6coekO1DvMdQEUByRkjq0Zv
 b8SsftMU06Wc/l85xCO6lZFkAdwrc758bRpBkXRVzLu8cU/zt2FLrQsQg
 LYrLIs73tNanofcSbojes/0APQQRxgvPSleNqkasCG+W68X3/jzV9i74O
 eAIuWSKXEExdQpQoTaUy+JsrBgXLt/NdHYi7K0DmNgNEeYv8miPKQk7ZZ
 rZtDhqeKRuYi/Wy/ExpUyKJ1f2WVqF42E9ypQcyOahGnmgyO6Z2k0BlCQ
 44aDjgNEO+n6xJ2RD1e/BtlcKkOhvm/mRXlLnMkLwU9SuEZb6hgBw4thK g==;
X-CSE-ConnectionGUID: iUoaToxRSfuZvBMGdA1UrQ==
X-CSE-MsgGUID: Kit2WtFoT7q05moE21iOHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85282746"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85282746"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 05:54:52 -0700
X-CSE-ConnectionGUID: c1uwEADGQOWGjvJicmB8cA==
X-CSE-MsgGUID: R/3BK/CvS2mw/rv5NG4jxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="242585938"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 05:54:50 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 1/2] drm/i915/dsb: shift delayed-vblank DSL wait start by
 one scanline
Date: Mon,  8 Jun 2026 18:07:09 +0530
Message-ID: <20260608123711.1121908-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260608123711.1121908-1-ankit.k.nautiyal@intel.com>
References: <20260608123711.1121908-1-ankit.k.nautiyal@intel.com>
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

In intel_dsb_wait_for_delayed_vblank() the VRR path issues a
WAIT_DSL_OUT(safe_window_start, vmin_safe_window_end) followed by a
WAIT_USEC for SCL+1 scanlines to land on the delayed vblank.

Experimentally, DSB appears to observe a slightly stale PIPEDSL value.
When the actual scanline has just reached safe_window_start, the DSB
may still see a value at or before that boundary when WAIT_DSL_OUT is
evaluated, causing the wait to complete immediately.

As a result, the subsequent WAIT_USEC executes too early, and the
flip-done interrupt fires roughly one frame ahead of the delayed vblank.

Shift the scanline start back by one to ensure the wait window is
entered reliably.

v2: Replace explicit one-scanline delay with scanline boundary
    adjustment (safe_window_start - 1). (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index fec8a56e21ea..07dd6318d9cc 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -902,9 +902,17 @@ void intel_dsb_wait_for_delayed_vblank(struct intel_atomic_state *state,
 		 * the hardware itself guarantees that we're SCL lines
 		 * away from the delayed vblank, and we won't be inside
 		 * the vmin safe window so this extra wait does nothing.
+		 *
+		 * Experimentally, DSB may observe a slightly stale
+		 * PIPEDSL value. When the actual scanline has just reached
+		 * safe_window_start, WAIT_DSL_OUT may complete immediately
+		 * due to the stale value.
+		 *
+		 * Shift the start back by one scanline to ensure the wait
+		 * window is entered reliably.
 		 */
 		intel_dsb_wait_scanline_out(state, dsb,
-					    intel_vrr_safe_window_start(crtc_state),
+					    intel_vrr_safe_window_start(crtc_state) - 1,
 					    intel_vrr_vmin_safe_window_end(crtc_state));
 		/*
 		 * When the push is sent during vblank it will trigger
-- 
2.45.2

