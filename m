Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4BEF459ED
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 15:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475D610E981;
	Fri, 10 Apr 2026 15:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cr5Rj4ia";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909CF10E97C;
 Fri, 10 Apr 2026 15:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775833517; x=1807369517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=paFqYs631wwxXlXVcWdqW75QfO1f3drcTxz2srfOpFc=;
 b=cr5Rj4iax1og6LtvsI0vElcmhXkOMZMgywKtHDZxQ8sRa55dzpdi92It
 F52DJnvhA7dlSHwmk2viU0p3EDImr0hB5Bz7ANCp4Ayb3l7gksIGhN4ce
 TruX2jN0FDa9XEQ6y/sVSLYNT/0XYVNDoxFzjxhin6K35kWrg6eX7/d9D
 DH5fi/Aqtj/8tjU9JPWN/tbAk9/4+ZTx1NbXTxW1uujaEHy5gfOSkxc3n
 1dBe8BV0tseX+fpH8rKMYlCJw/3kwn4NoHkm6IVutun3zRmZeBLQvyj/w
 CqDZOU1vwbz6SVxhfs8glzu7VbbeusSYMefgG+H93CFL/w1u9ueSXfebS A==;
X-CSE-ConnectionGUID: okXEkqZVSPmOS1ScFLdpVA==
X-CSE-MsgGUID: 2lrCBdRMTFq7jXh2Yt1XUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76815337"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76815337"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 08:05:15 -0700
X-CSE-ConnectionGUID: nEMjgDiOThejFq1Nik1bTQ==
X-CSE-MsgGUID: CkHNH4/LQ8eyQ/Qq8KyRSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="230827822"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.89])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 08:05:14 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 06/10] drm/i915: Use a 1 second timeout for the polling vblank
 wait
Date: Fri, 10 Apr 2026 18:04:45 +0300
Message-ID: <20260410150449.9699-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260410150449.9699-1-ville.syrjala@linux.intel.com>
References: <20260410150449.9699-1-ville.syrjala@linux.intel.com>
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

40 msec seems like a very random number for a vblank wait timeout.
Considering ~24Hz display modes are definitely a thing this seems
way too low. Just bump it to a full second to match what we've been
using for normal vblank waits.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_initial_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_initial_plane.c b/drivers/gpu/drm/i915/display/intel_initial_plane.c
index 74e10d34c63c..4f1591b55752 100644
--- a/drivers/gpu/drm/i915/display/intel_initial_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_initial_plane.c
@@ -36,7 +36,7 @@ void intel_initial_plane_vblank_wait(struct intel_crtc *crtc)
 	start_ts = intel_de_read(display, PIPE_FRMTMSTMP(crtc->pipe));
 
 	ret = poll_timeout_us(end_ts = intel_de_read(display, PIPE_FRMTMSTMP(crtc->pipe)),
-			      end_ts != start_ts, 1000, 40 * 1000, false);
+			      end_ts != start_ts, 1000, 1000 * 1000, false);
 	if (ret)
 		drm_warn(display->drm, "[CRTC:%d:%s] early vblank wait timed out\n",
 			 crtc->base.base.id, crtc->base.name);
-- 
2.52.0

