Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE36E9A04A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 15:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C0D10E5F3;
	Wed, 18 Feb 2026 15:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j34uvBA+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C5010E5F2;
 Wed, 18 Feb 2026 15:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771428555; x=1802964555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SEB9wSC9VYUB5nTykOEH8bIQWEsQc/iJhzSrSbys6wA=;
 b=j34uvBA+KI0JLwsYX642/2xBPE/mEA0a7j2wFFGLmVDCqAiU2r8I1n3V
 FNfr8fl4aJh+aEKyR8rs+yAj9OOLukauPy2hJIMUQthiqaefkvRuMvhlZ
 JwKuL5HMK8r04/IBiW1YEOxVcXZo3SInvCt5jisKjSA2V2psfMkoslcvj
 8t5thAQAbDaWV+wPYchmKM9S7FHNl0b0pcnrGOziOlawdtgl9lOh8iQdY
 o/mxluNNQhyV/gxPPBlxjHbaV9hy4VpCrDWgi9/IOtLgSTraVGU7qd/cf
 PVDpuQj4+qCKrimFdw6b5S+Z33fGHHn1lVOqEMyMqQjpAtv9mxaDb+6nZ A==;
X-CSE-ConnectionGUID: YKfLd+zTSE+qeBrE1klrcg==
X-CSE-MsgGUID: rUOdaaoDTCazsVw7D6QsBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72495477"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="72495477"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:29:15 -0800
X-CSE-ConnectionGUID: lalnu/MrRpW6/bWQK2+org==
X-CSE-MsgGUID: NwU2rxRzTa6ETWJrWj0djg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="213302950"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.66])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:29:13 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 15/19] drm/i915/overlay: s/dev_priv/i915/
Date: Wed, 18 Feb 2026 17:28:02 +0200
Message-ID: <20260218152806.18885-16-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
References: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
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

Rename the one lingering 'dev_priv' variable to the
more modern 'i915' in the overlay code.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 1b792926e076..04e9ee278cd2 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -1456,10 +1456,10 @@ static int i915_overlay_setup(struct drm_device *drm,
 			      struct intel_overlay *overlay,
 			      bool needs_physical)
 {
-	struct drm_i915_private *dev_priv = to_i915(drm);
+	struct drm_i915_private *i915 = to_i915(drm);
 	struct intel_engine_cs *engine;
 
-	engine = to_gt(dev_priv)->engine[RCS0];
+	engine = to_gt(i915)->engine[RCS0];
 	if (!engine || !engine->kernel_context)
 		return -ENOENT;
 
-- 
2.52.0

