Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B964FC0218C
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 21:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188B110E5BC;
	Mon, 27 Jan 2025 21:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBcvsj79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE52F10E3CF;
 Mon, 27 Jan 2025 21:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738013459; x=1769549459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4aLWbb8iRYGeC2p7J+IZEzML1sWS7pN1WU9EJl/J1Dc=;
 b=dBcvsj79GS4WyvleLEdOH1hkTgy6p86aFtvMnIHZqRh0mPwty8ghiqYB
 jW3qKPuZrIiR8hY6Uj+3qFerTk0U+rGm3oXY4HwTYOHLTq9O8cpvPiss2
 iDpcmO9en46R3OjmXfliMV8AL2mHvOZ7SZlhPjJRki0rnH12c6a59prL3
 fT52NKn/sF58ODFUiYlf0uPWsRdO5WSs+vhOzhmn6MA0kyjuWxQlqk8Jc
 F5v2iJPuXUGuQPMBCa1+eg6W6OlqAuNZPQKp3HD5jIGXQTgtE2Wsi0Nkk
 DEh/wVdB/jlymEgKHSyUuIma/G27b7x4DAx/ZdS1zjM0v4Lh3dT0DrkF9 w==;
X-CSE-ConnectionGUID: ir0B3XC2Rza95pvqoDQTNQ==
X-CSE-MsgGUID: xXDvrrdGS5eF1sjrW/1Fhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38376067"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="38376067"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 13:30:58 -0800
X-CSE-ConnectionGUID: J96rrih4QK2hOQ4suIqgYA==
X-CSE-MsgGUID: vC0jEtDVTn239WrEyRf71A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="108664009"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 27 Jan 2025 13:30:56 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 27 Jan 2025 23:30:55 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/i915: Give i915 and xe each their own display tracepoints
Date: Mon, 27 Jan 2025 23:30:55 +0200
Message-ID: <20250127213055.640-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
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

Currently we just define the display tracpoints with
TRACE_SYSTEM i915. However the code gets included separately
in i915 and xe, and now both modules are competing for the
same tracpoints. Apparently whichever module is loaded first
gets the tracepoints and the other guy is left with nothing.

Give each module its own set of display tracpoints so that
things work even when both modules are loaded.

This one had me stumped for a bit when after a reboot I lost
all i915 display tracpoints (on account of the new kernel
also including xe, and something also ended up loading it
before I manually loaded i915).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_trace.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
index 54a6e2a46b82..0e10c2856058 100644
--- a/drivers/gpu/drm/i915/display/intel_display_trace.h
+++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
@@ -4,7 +4,11 @@
  */
 
 #undef TRACE_SYSTEM
+#ifdef I915
 #define TRACE_SYSTEM i915
+#else
+#define TRACE_SYSTEM xe
+#endif
 
 #if !defined(__INTEL_DISPLAY_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
 #define __INTEL_DISPLAY_TRACE_H__
-- 
2.45.3

