Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBD1CD8C90
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8BB10EB2E;
	Wed, 10 Jun 2026 17:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aRcPxSRv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EC510E689;
 Wed, 10 Jun 2026 17:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781111236; x=1812647236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hKDIEnl+unwAXye/6i22T+IzCJ9qmJQjadBI4Yi2+Uc=;
 b=aRcPxSRv57uDhQ/T6wVaj4Um1t52270A6cKn4947+dscP3lKFwQWPHAu
 ifYyJFcqWP+QTWq20f388qiGd6KB/20vOWThMG55scWp2iDfBsr3DvNko
 /hcl4UIl+ecnqaTikX9RcqTAfriy5R3hzcVTpKglAhinTa4Hnvj1mW2J8
 NoVVD5IUDOdl1Qos279Q9e9qKIj2cE8mqpJd0jmLRhzAcXiICgaAcEKqn
 PiT9t8TuPy9GkRkFb8gu/GcMZ7Si+sGik5pYuBdzX3+I/KPaIA5UF80Oc
 7QgwIwS2/EQM8GuOoP2UF2m+Y0yNPR1mEEVVmwHtHb3JjGljZhR5n2JI0 Q==;
X-CSE-ConnectionGUID: AxBNqIFcTpW9mAWc9COZig==
X-CSE-MsgGUID: lbVyrbfjS7e6DnbUuy24aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99490300"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="99490300"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:07:16 -0700
X-CSE-ConnectionGUID: djuey7wAT6Gl4mq1PtRh7A==
X-CSE-MsgGUID: 1rUB7zBfT3KPvBEVnp51Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="250507295"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.62])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:07:15 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/14] drm/i915/cdclk: Notify DG2 pcode about pipe power wells
 regardless of CDCLK
Date: Wed, 10 Jun 2026 20:06:41 +0300
Message-ID: <20260610170652.5320-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We're currently skipping the pcode notifies on DG2 if the CDCLK isn't
changing while the power well counts would still need updating.
Do the pcode notifications also for pure pipe power well changes.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index d60b3369b4d2..7259048361a7 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2793,7 +2793,9 @@ intel_set_cdclk_pre_plane_update(struct intel_atomic_state *state)
 		return;
 
 	if (!intel_cdclk_changed(&old_cdclk_state->actual,
-				 &new_cdclk_state->actual))
+				 &new_cdclk_state->actual) &&
+	    dg2_power_well_count(display, old_cdclk_state) ==
+	    dg2_power_well_count(display, new_cdclk_state))
 		return;
 
 	if (new_cdclk_state->disable_pipes) {
@@ -2848,7 +2850,9 @@ intel_set_cdclk_post_plane_update(struct intel_atomic_state *state)
 		return;
 
 	if (!intel_cdclk_changed(&old_cdclk_state->actual,
-				 &new_cdclk_state->actual))
+				 &new_cdclk_state->actual) &&
+	    dg2_power_well_count(display, old_cdclk_state) ==
+	    dg2_power_well_count(display, new_cdclk_state))
 		return;
 
 	if (!new_cdclk_state->disable_pipes &&
-- 
2.53.0

