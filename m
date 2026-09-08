Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E968BC79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861FD10E9F7;
	Tue,  8 Sep 2026 06:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gudcsoHz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDB910E086;
 Tue,  8 Sep 2026 06:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788849550; x=1820385550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zTji8G45n80i5h6BjELOXQaWJZQOlPV+li9sTEAl0DI=;
 b=gudcsoHz2Tz3f8sBhardArh7LEfYIdrPBdXhQbTwM/7fS4eFP5N9FnU8
 VVl0LwU769/EBSYYqx6GWjXNuEj5Xi7LDQt+ZK17ekaEjQR3nQv8axEKT
 wnDZMafG6NPKZXOq+5/A5NCdsQovgWJAJrhJ7jXzLGRIwGrQdvbS6fBOd
 byB5KHumRzSWFLdPAf8QZYK3mLaEIAttDwBE1vhI6ghwEKlaeqRFttnPJ
 Bvqfu9RKuzKYgyltemo4Ue9FHtz/cAbaYNJQddDBuAhJL5LvPBWT8GTic
 BeiXVW5nBvsR8gRj3rTqlaUfqzuAJPh+a+9mmjkgUW47zK4BVwAMVFXpy g==;
X-CSE-ConnectionGUID: HXeLwoI4TJKPT5YyqEbALw==
X-CSE-MsgGUID: csYBr2FMTRuBVl9MXooCfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93061787"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93061787"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:06 -0700
X-CSE-ConnectionGUID: MZwER7DJTCWVZ4PC33SyZg==
X-CSE-MsgGUID: z+7HwEVmRDq5vITbBFJi6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264702435"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:04 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v5 04/12] drm/i915/dip: Add helper to get AS SDP Transmission
 Line
Date: Tue,  8 Sep 2026 11:52:15 +0530
Message-ID: <20260908062224.2897987-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
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

Introduce a DIP helper to compute the Adaptive Sync SDP transmission line
and use it when programming the EMP_AS_SDP_TL register.

Currently the AS SDP transmission line is programmed to the T1 position.
This can be extended in the future to support programming the T2 position
as well.

While at it, improve the documentation: the AS SDP transmission line
corresponds to the T1 position, which maps to the start of the VSYNC
pulse.

v2:
- Move the helper into intel_dip.c and make it static, since intel_dip.c
  is its only caller.
- Drop the now unused prototype from intel_dp.h.
- Add the check HAS_EMP_AS_SDP_TL(). (Suraj)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com> (#v1)
---
 drivers/gpu/drm/i915/display/intel_dip.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i915/display/intel_dip.c
index b28352a9e23f..0277b15e1c82 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.c
+++ b/drivers/gpu/drm/i915/display/intel_dip.c
@@ -9,6 +9,23 @@
 #include "intel_dip_regs.h"
 #include "intel_display_types.h"
 
+static int intel_dip_get_as_sdp_transmission_line(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	if (!HAS_EMP_AS_SDP_TL(display))
+		return 0;
+
+	/*
+	 * EMP_AS_SDP_TL defines the T1 position as the default AS SDP
+	 * Transmission Line, which corresponds to the start of the
+	 * VSYNC pulse.
+	 *
+	 * Use the T1 position for now.
+	 */
+	return crtc_state->vrr.vsync_start;
+}
+
 u16 intel_dip_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
@@ -36,7 +53,7 @@ void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
 	 * the register is reset to 0.
 	 */
 	if (intel_crtc_has_dp_encoder(crtc_state))
-		transmission_line = crtc_state->vrr.vsync_start;
+		transmission_line = intel_dip_get_as_sdp_transmission_line(crtc_state);
 
 	intel_de_write(display,
 		       EMP_AS_SDP_TL(display, cpu_transcoder),
-- 
2.50.1

