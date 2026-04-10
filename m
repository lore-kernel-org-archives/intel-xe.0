Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83325F459EE
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 15:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC7510E979;
	Fri, 10 Apr 2026 15:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+F5ha+o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1C610E975;
 Fri, 10 Apr 2026 15:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775833533; x=1807369533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C9ugfJgZzkyYn3GGXylG6HzE3Ten7yseYbr7zpHPAtc=;
 b=i+F5ha+oWh3JwmveH1mVPqN/d6yH+2ivIDHC6h8g/RZqBNGOB4xmQDl8
 5F+QVIOjEANuvbY8pVql/8HmS5cwMR6xXPUHqvYZo0OrVOLmfz6YIMPaa
 gU2GWHTp3DZTxFZOVqSepHsmOlfIoX2qehNd1r4Rh/OIAbamY3MENFNct
 RlppVK2AjNorIppcETTDoSXpDtRK7Mw1GYVv9Tya/xypBRmIvsNjkNQqD
 evBAKGXzuWv0KXrjpfKdyG5r6jFz4jrAICgm1P4fV8moKp+QU4L51omNY
 T7soydi5+bZ+QVr2M+/GRUxvu+UxASxxZ/adpQnFPT15YUIkWomrdOu6W A==;
X-CSE-ConnectionGUID: JUQbpua9QuK/Ad6d7dFPcw==
X-CSE-MsgGUID: 0e5AJfi9RIeomYZGgUxHzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76743753"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76743753"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 08:05:23 -0700
X-CSE-ConnectionGUID: 0+T0sGk4SmWfM9Dc1CpzZg==
X-CSE-MsgGUID: iB32H/l8SEeeFhumQk4WZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="224802725"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.89])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 08:05:21 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 08/10] drm/i915: Reject X/Y tiled BIOS FB if we don't have
 fenced regions
Date: Fri, 10 Apr 2026 18:04:47 +0300
Message-ID: <20260410150449.9699-9-ville.syrjala@linux.intel.com>
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

The CPU always needs linear view into the BIOS FB, and for X/Y tiled
buffers that is achieved by the use of a fenced region. If the
underlying driver doesn't support fenced regions then we can't keep
the X/Y tiled BIOS FB. i915 has fenced regions, xe does not.

Probably not a big deal since I don't think we've seen tiled BIOS
FBs outside of some MacBooks. See eg. commit d9a515867bdb
("drm/i915/gen9+: Fix initial readout for Y tiled framebuffers").

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_initial_plane.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_initial_plane.c b/drivers/gpu/drm/i915/display/intel_initial_plane.c
index 5a5adf738d4a..55b6cdded126 100644
--- a/drivers/gpu/drm/i915/display/intel_initial_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_initial_plane.c
@@ -79,9 +79,13 @@ intel_alloc_initial_plane_obj(struct intel_display *display,
 
 	switch (fb->modifier) {
 	case DRM_FORMAT_MOD_LINEAR:
+		break;
 	case I915_FORMAT_MOD_X_TILED:
 	case I915_FORMAT_MOD_Y_TILED:
-		break;
+		/* fenced region needed for linear CPU access to tiled FB */
+		if (intel_parent_has_fenced_regions(display))
+			break;
+		fallthrough;
 	default:
 		drm_dbg_kms(display->drm, "Unsupported modifier for initial FB: 0x%llx\n",
 			    fb->modifier);
-- 
2.52.0

