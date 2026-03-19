Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EA5108E1F7
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 11:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0061210E989;
	Thu, 19 Mar 2026 11:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIcpAR5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0796210E989;
 Thu, 19 Mar 2026 11:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773920480; x=1805456480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UGUcsBKCjcEoW1u61ZrmP+jPJ3RHult3RO++8MB0Fic=;
 b=dIcpAR5VszDiXoczHRmmeyYjAQ3Xz1eSo/yYaszwIEia1MVHUmiocIY3
 tf1oFG8AozB3bn9zCoRcnhomYMDcjDtN1l2eikdjOJH4WJi3JvevmxKYD
 jH4jMrsiyl+uSFGp2BXw/xDnSXBf421EFHoS2Ejqbayohcc7mAnu0R4oM
 4eH/4kDjOX2ajCyYOGcT5o6o1AoXxCqCgjeaG2c+Zr1VQ7NLAIdVbumTC
 D0aBrsiNJSPIS7oUKdI+TdeEZF85LembelmV4EoFIL6z6bUjvYGjXX5gZ
 qlPAYHpYqcZrTPn7zxG8U+ixn+pEESwdsfmVmXL0pPhQGw28VW49/KxWl w==;
X-CSE-ConnectionGUID: asTV8RqSQ/SZ4MqtGxYkFg==
X-CSE-MsgGUID: 1Dv3WPrdTOCg03AfyNCTEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85306388"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="85306388"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 04:41:19 -0700
X-CSE-ConnectionGUID: dnFS/xDKSLKeQGRrP7TPqA==
X-CSE-MsgGUID: eCtZvVAhTOmDPj7HkFGKhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="245964224"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.169])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 04:41:16 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 8/9] drm/i915/wm: Include ddb_y in skl_print_wm_changes() on
 pre-icl
Date: Thu, 19 Mar 2026 13:40:33 +0200
Message-ID: <20260319114034.7093-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260319114034.7093-1-ville.syrjala@linux.intel.com>
References: <20260319114034.7093-1-ville.syrjala@linux.intel.com>
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

Pre-icl doesn't use a separate hardware plane for Y scanout,
and instead it's all handled magially by the hardware. We
do still need to allocate DDB space for the Y color plane
though (PLANE_NV12_BUF_CFG). Include that information in the
debugs so that we know where it ended up.

On icl+ the equivalent information is dumped as the hardware
Y plane's normal ddb allocation.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 8687026935e9..345767349988 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -2735,10 +2735,17 @@ skl_print_wm_changes(struct intel_atomic_state *state)
 			old = &old_crtc_state->wm.skl.plane_ddb[plane_id];
 			new = &new_crtc_state->wm.skl.plane_ddb[plane_id];
 
-			if (skl_ddb_entry_equal(old, new))
+			if (!skl_ddb_entry_equal(old, new))
+				skl_print_plane_ddb_changes(plane, old, new, "  ddb");
+
+			if (DISPLAY_VER(display) >= 11)
 				continue;
 
-			skl_print_plane_ddb_changes(plane, old, new, "ddb");
+			old = &old_crtc_state->wm.skl.plane_ddb_y[plane_id];
+			new = &new_crtc_state->wm.skl.plane_ddb_y[plane_id];
+
+			if (!skl_ddb_entry_equal(old, new))
+				skl_print_plane_ddb_changes(plane, old, new, "ddb_y");
 		}
 
 		for_each_intel_plane_on_crtc(display->drm, crtc, plane) {
-- 
2.52.0

