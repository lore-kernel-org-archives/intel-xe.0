Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD269C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 18:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8A010EC2E;
	Fri,  7 Mar 2025 18:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhkqObvW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3256810EC27;
 Fri,  7 Mar 2025 18:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741370515; x=1772906515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AeNF72TYCnYp1JQDXpLLmIDP+j3cKFKj9554En14aDw=;
 b=lhkqObvWnmuPoN3jes2etXHCUyQn1cYEaCAGli3rJ4ItYAUQW5thYa74
 fgc0EHimSfqLZrwDIXEAF1RzQMF0ROwGkhGA8tObYMRb5+i0mkEhqKKTU
 bouss5Y7iSkoVoZD/PwQVrGCwJwpuSQfBGwDfJ+cNFt/E5V/MJi9to/lj
 swMhFyKL+Gs86Z7D6CL093QqDtY+QresPXDaGU8Zk0dAgOAIezjhb51qq
 Tu5FMXv6Ize+3wEDm0Tn0UFSNvtm96zax4obs4R5bLNzHx43mTGnLwtqr
 8XCzgg5PtBpvt7SA3RD+MyeiyUITKBRnGJ0JFJRsDbH9S4ymDWRnQCKxm g==;
X-CSE-ConnectionGUID: 6NWixvGVTcKxmsHMv5ijsA==
X-CSE-MsgGUID: P5HweM62TuSroiDKTDqUBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52637133"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="52637133"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:01:55 -0800
X-CSE-ConnectionGUID: cT8EmE1ATeOZ2a1UO4k3Jw==
X-CSE-MsgGUID: 4M1DZeodRo2BnMlyZKHI/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124621121"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 07 Mar 2025 10:01:53 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Mar 2025 20:01:51 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 03/14] drm/i915: Extract intel_dbuf_bw_changed()
Date: Fri,  7 Mar 2025 20:01:28 +0200
Message-ID: <20250307180139.15744-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250307180139.15744-1-ville.syrjala@linux.intel.com>
References: <20250307180139.15744-1-ville.syrjala@linux.intel.com>
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

Extract the struct intel_dbuf_bw comparison into a small
helper. We'll get more users later.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 2bc020690515..640a24e83b6d 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -1117,6 +1117,21 @@ static int intel_bw_check_qgv_points(struct drm_i915_private *i915,
 					   old_bw_state, new_bw_state);
 }
 
+static bool intel_dbuf_bw_changed(struct drm_i915_private *i915,
+				  const struct intel_dbuf_bw *old_dbuf_bw,
+				  const struct intel_dbuf_bw *new_dbuf_bw)
+{
+	enum dbuf_slice slice;
+
+	for_each_dbuf_slice(i915, slice) {
+		if (old_dbuf_bw->max_bw[slice] != new_dbuf_bw->max_bw[slice] ||
+		    old_dbuf_bw->active_planes[slice] != new_dbuf_bw->active_planes[slice])
+			return true;
+	}
+
+	return false;
+}
+
 static bool intel_bw_state_changed(struct drm_i915_private *i915,
 				   const struct intel_bw_state *old_bw_state,
 				   const struct intel_bw_state *new_bw_state)
@@ -1128,13 +1143,9 @@ static bool intel_bw_state_changed(struct drm_i915_private *i915,
 			&old_bw_state->dbuf_bw[pipe];
 		const struct intel_dbuf_bw *new_dbuf_bw =
 			&new_bw_state->dbuf_bw[pipe];
-		enum dbuf_slice slice;
 
-		for_each_dbuf_slice(i915, slice) {
-			if (old_dbuf_bw->max_bw[slice] != new_dbuf_bw->max_bw[slice] ||
-			    old_dbuf_bw->active_planes[slice] != new_dbuf_bw->active_planes[slice])
-				return true;
-		}
+		if (intel_dbuf_bw_changed(i915, old_dbuf_bw, new_dbuf_bw))
+			return true;
 
 		if (intel_bw_crtc_min_cdclk(i915, old_bw_state->data_rate[pipe]) !=
 		    intel_bw_crtc_min_cdclk(i915, new_bw_state->data_rate[pipe]))
-- 
2.45.3

