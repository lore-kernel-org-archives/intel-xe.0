Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7B4C4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 22:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2B710F134;
	Fri,  2 Feb 2024 22:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TcFwaXQe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40EA10F133
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 22:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706914268; x=1738450268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ExMzWX9602ht/w0l2qGQVHag5tTZVQK1g//Kfjj2V50=;
 b=TcFwaXQe7L1X7KDY8MbLbeuzPjwM99nSytmsYL49RZkFmJ40r5Oscvbz
 I81KZjjp1HC93eGmqHw8VeW3Q//rSNuULDrEk4EiCWGMQCxTe4pzce+yt
 m48Gx6U6ZB6aE8ap7S9jQCqf9t3pmfNjC2MqygtBueGBYQybcKWVk6Bni
 0KRgFc0PUnQkihZJO0fiOBX9wSOeR9ZN4cMvMFAWDEmF1iTxDxTeHLBui
 bz+m8/y+E1HxeE2HqGssj90WYl0WLCz3PeQE83Ee3sLLxH50d2DihgcVZ
 pkT9UBpScf5d9m2kyZrcYCKf9QjHuWekoEbnkaA+eklrlUMUO3kzOTYZC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="153747"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="153747"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 14:44:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823332025"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823332025"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 14:44:00 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 03 Feb 2024 00:43:59 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Paz Zcharya <pazz@chromium.org>
Subject: [PATCH v4 05/16] drm/i915: Disable the "binder"
Date: Sat,  3 Feb 2024 00:43:29 +0200
Message-ID: <20240202224340.30647-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
References: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Now that the GGTT PTE updates go straight to GSMBASE (bypassing
GTTMMADR) there should be no more risk of system hangs? So the
"binder" (ie. update the PTEs via MI_UPDATE_GTT) is no longer
necessary, disable it.

My main worry with the MI_UPDATE_GTT are:
- only used on this one platform so very limited testing coverage
- async so more opprtunities to screw things up
- what happens if the engine hangs while we're waiting for MI_UPDATE_GTT
  to finish?
- requires working command submission, so even getting a working
  display now depends on a lot more extra components working correctly

TODO: MI_UPDATE_GTT might be interesting as an optimization
though, so perhaps someone should look into always using it
(assuming the GPU is alive and well)?

v2: Keep using MI_UPDATE_GTT on VM guests
v3: use i915_direct_stolen_access()

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Tested-by: Paz Zcharya <pazz@chromium.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gtt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 86f73fe558ca..7811a8c9da06 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -24,7 +24,8 @@
 bool i915_ggtt_require_binder(struct drm_i915_private *i915)
 {
 	/* Wa_13010847436 & Wa_14019519902 */
-	return MEDIA_VER_FULL(i915) == IP_VER(13, 0);
+	return !i915_direct_stolen_access(i915) &&
+		MEDIA_VER_FULL(i915) == IP_VER(13, 0);
 }
 
 static bool intel_ggtt_update_needs_vtd_wa(struct drm_i915_private *i915)
-- 
2.43.0

