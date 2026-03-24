Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCA4F54AB0
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 13:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFF710E6E2;
	Tue, 24 Mar 2026 13:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aIC2JMZW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECFA10E6DA;
 Tue, 24 Mar 2026 13:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774360146; x=1805896146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GcLdVTClbDmdBmitgVjjlCnQCiq1uGO2pcGvmOnwu5Q=;
 b=aIC2JMZWZVplmA/fv72rIMCbu+QVNRE51HyYuut3pQ7pGSeAzx1PC/0E
 U0QixmtyGHjaAqMqSRrMBMlGXjZvDf1Y2+hKnBnH+mQ6JRrl10fhKlwXc
 OY9cTCejvpIwVKIC9UxaWWN/UVk3fMqRFG19k7TK+oAGtPE5mYXRiUyct
 ZP7Pc14DtAYEiWlCEyDkiNNQ0Xnp+subCec+bC740XdbZfdQXb8maaMwJ
 fltqxPdSC+dzlaPh7T+vmn6j/licBPvqHH0Rt5Urm1kPqCa/TJddddpO/
 YaX9qSNvGexJz2g2+51Hok8ayRPAt0dhrPaIDKc8KFdB5fXYL/fiLDMkn w==;
X-CSE-ConnectionGUID: CNDJSROkRp+iINAYtktDUQ==
X-CSE-MsgGUID: vqgiLrTcSvycsN6NGixktg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100818909"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="100818909"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:49:06 -0700
X-CSE-ConnectionGUID: yeGnOFuRRh6Uw0YFFvyBnA==
X-CSE-MsgGUID: BS/jnxmzSlO/A4+BXtH0ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="229105116"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.220])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:49:05 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/9] drm/i915/wm: Verify the correct plane DDB entry
Date: Tue, 24 Mar 2026 15:48:38 +0200
Message-ID: <20260324134843.2364-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260324134843.2364-1-ville.syrjala@linux.intel.com>
References: <20260324134843.2364-1-ville.syrjala@linux.intel.com>
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

Actually verify the DDB entry for the plane we're looking
at instead of always verifying the cursor DDB.

Fixes: 7d4561722c3b ("drm/i915: Tweak plane ddb allocation tracking")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index e37fde9f765d..cbc03938442d 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -4026,8 +4026,8 @@ void intel_wm_state_verify(struct intel_atomic_state *state,
 		}
 
 		/* DDB */
-		hw_ddb_entry = &hw->ddb[PLANE_CURSOR];
-		sw_ddb_entry = &new_crtc_state->wm.skl.plane_ddb[PLANE_CURSOR];
+		hw_ddb_entry = &hw->ddb[plane->id];
+		sw_ddb_entry = &new_crtc_state->wm.skl.plane_ddb[plane->id];
 
 		if (!skl_ddb_entry_equal(hw_ddb_entry, sw_ddb_entry)) {
 			drm_err(display->drm,
-- 
2.52.0

