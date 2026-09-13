Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F1DC88E5C
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC84210E944;
	Sun, 13 Sep 2026 15:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZRuMphw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C2210E93E;
 Sun, 13 Sep 2026 15:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789312407; x=1820848407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zTji8G45n80i5h6BjELOXQaWJZQOlPV+li9sTEAl0DI=;
 b=iZRuMphwGTOBigJkDyeg+k83iOY/T++vRJfI47XKjVAhqaLG0Hmp3xZg
 66BC1QBTWumYes6xsgr+CEAZEZTMnk5p2yNvWIF/MN9JdNaSyYQNoUEBR
 AiIOeINzP3lGZofnUsKwBfVMDv32FKETiWem+1nETvjWDFfL8BEnbz+SN
 vphcsTg5+awpxJ3ibRkI6ChTfXQdQ3C5huBslFFLZhYRM6j0j14+tZSYx
 94Jhe4NG5zgdOQjjAGb03mznIwuBeafWrw7uPHEJKEs1gU5eXzGiSXB7Z
 OuQqQxbnx7tWPGDsmprvT36fw5sn2MqFf8V8rPwKaX0rr+Hb92zN1s901 g==;
X-CSE-ConnectionGUID: 84BdEWLZTqalyjZPVZaTZQ==
X-CSE-MsgGUID: 5SuFOkb4S1uAnOVfBb64rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93388753"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="93388753"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:27 -0700
X-CSE-ConnectionGUID: vd6sGbC9RGySgFcitZe9KA==
X-CSE-MsgGUID: GcV9mjDtQMGkFBnrlaXCDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="310694099"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:25 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v6 04/13] drm/i915/dip: Add helper to get AS SDP Transmission
 Line
Date: Sun, 13 Sep 2026 20:26:39 +0530
Message-ID: <20260913145649.3240904-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
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

