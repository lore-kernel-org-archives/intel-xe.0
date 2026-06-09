Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1857BCD98CA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CDD10E2D7;
	Tue,  9 Jun 2026 12:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8wtz5Ag";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8613910E2F9;
 Tue,  9 Jun 2026 12:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781006632; x=1812542632;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=018bNNxqWwyxeJs7I/5UvGmmsJOGJ6OAeaQrv8WFeSo=;
 b=M8wtz5Ag0Vg5Vvw3JVuD5ODQPDh6yw759KaMEGD++RslFuqIcsDXgSeL
 k3IMORhHRv4j3Ej3bu12SK1/zKX4c62kbFAKDB71jkxnMF09pgtpu/eql
 dcYplt8qGNkxGZHbVU66T8PHoeEpnNlbo4Ei16tnt3EBCFoRsP+NHPiaq
 KoBXRXgrIauU3CmqjnLFmMyJ28oA3mtSpT0niYxh+wdhT3K0m9Q8NkbY5
 V1yN4B6ru94DYHPx5qNP0j8w1GqIj1GF3kjyf5utDD5O8dThhpOfxnZih
 zkhNdkPqcWaCdkdThpePgoFo414pX0sP82qG09t4Zo6AVuzeTP767YGhZ A==;
X-CSE-ConnectionGUID: nG2W3FJSTi+2i83OEJVx9Q==
X-CSE-MsgGUID: dngSDjWNQOuNzrh7VWHl3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99340364"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99340364"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:03:52 -0700
X-CSE-ConnectionGUID: Ytghso+RRMO4gDk67KDg7g==
X-CSE-MsgGUID: B3P1J5HXRIKhP7wp43ixGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244988262"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:03:51 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v3 09/36] drm/i915/cmtg: Program VRR fixed-rate timings for CMTG
 transcoder
Date: Tue,  9 Jun 2026 17:32:23 +0530
Message-ID: <20260609120250.867750-10-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
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

From: Animesh Manna <animesh.manna@intel.com>

Program the VRR registers of CMTG, as the VRR timing generator
will always be enabled for NVL.

Add intel_cmtg_set_vrr_timings() which mirrors the per-transcoder
VRR VMIN/VMAX/FLIPLINE programming on the CMTG transcoder paired
with the pipe's cpu_transcoder.

Invoke it from intel_vrr_set_transcoder_timings() and from the LRR
fastset path, right after the existing intel_vrr_set_fixed_rr_timings()
calls, so the CMTG VRR timing registers stay in sync with the
cpu_transcoder's.

v2: Use sw state instead of reading from hardware. [Jani]
v3: Program cmtg vrr timing registers along with vrr transcoder registers.
v4: Reuse vrr timing programming helper.

Bspec: 68989
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c    | 11 +++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h    |  1 +
 drivers/gpu/drm/i915/display/intel_display.c |  1 +
 drivers/gpu/drm/i915/display/intel_vrr.c     |  2 ++
 4 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index 082c04bec9ee..4c8187ddef1f 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -16,6 +16,7 @@
 #include "intel_display_power.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
+#include "intel_vrr.h"
 
 /**
  * DOC: Common Primary Timing Generator (CMTG)
@@ -244,3 +245,13 @@ void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state, bool lrr)
 	else
 		intel_set_transcoder_timings(crtc_state, cmtg_transcoder);
 }
+
+void intel_cmtg_set_vrr_timings(const struct intel_crtc_state *crtc_state)
+{
+	enum transcoder cmtg_transcoder = to_cmtg_transcoder(crtc_state->cpu_transcoder);
+
+	if (!intel_cmtg_is_allowed(crtc_state))
+		return;
+
+	intel_vrr_set_fixed_rr_timings(crtc_state, cmtg_transcoder);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index 53a44f505dd2..899a2744514c 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -11,6 +11,7 @@
 struct intel_display;
 struct intel_crtc_state;
 
+void intel_cmtg_set_vrr_timings(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state, bool lrr);
 void intel_cmtg_set_clk_select(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_sanitize(struct intel_display *display);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index e4afd887a962..ef5207f78b61 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6683,6 +6683,7 @@ static void intel_pipe_fastset(const struct intel_crtc_state *old_crtc_state,
 		intel_set_transcoder_timings_lrr(new_crtc_state, new_crtc_state->cpu_transcoder);
 		intel_cmtg_set_timings(new_crtc_state, true);
 		intel_vrr_set_fixed_rr_timings(new_crtc_state, new_crtc_state->cpu_transcoder);
+		intel_cmtg_set_vrr_timings(new_crtc_state);
 		intel_vrr_transcoder_enable(new_crtc_state);
 	}
 }
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 15d22de66d63..2295f6545981 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -7,6 +7,7 @@
 #include <drm/drm_print.h>
 
 #include "intel_alpm.h"
+#include "intel_cmtg.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_display_regs.h"
@@ -646,6 +647,7 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 	}
 
 	intel_vrr_set_fixed_rr_timings(crtc_state, cpu_transcoder);
+	intel_cmtg_set_vrr_timings(crtc_state);
 
 	if (!intel_vrr_always_use_vrr_tg(display))
 		intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder),
-- 
2.43.0

