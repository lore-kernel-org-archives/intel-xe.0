Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E7E606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JkanqJ9g
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD9510E3CA;
	Thu, 22 Oct 2026 11:56:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5AA10E3CA;
 Thu, 22 Oct 2026 11:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792670157; x=1824206157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cgxJgoa7zjAIUI9lAxp+ygzdaQjNT6EBd3VtVKwY6LA=;
 b=JkanqJ9grnvaDt3LIGAH7uh7joRTOEc7quZV6wGc+qJUrEAoEbpqnHKn
 UXI50wCd6Lt8IoEi6HVsb2OJZQ/NedwYXVI1q3LB7QN9NTpjucxooGAOn
 TAbou8SZpOctqdKV9RkurOyjM2wfzqVtk98LoykI5tL803EkYISLOK1NC
 jPxJwy2zbUsM6T409erZxyphMsFq81/+YI9Fr0FCUOLnqNm1kC+kY5JfV
 NjgRgFyVQCayVBlORhWhFTDrCHott/KyPLhIpAI6mCrUD8ssCP35rt0a4
 XHiHUZP13meXMANxIQ+qnVnQ0ADWTmeAjgrAquT4ZZffURkKEwlRQMI0B Q==;
X-CSE-ConnectionGUID: ZIaEVmtOTsCDBDinhpw+5w==
X-CSE-MsgGUID: Ebx2+VuaRrqN5h8oBPzv+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1520060"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1520060"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:55:57 -0700
X-CSE-ConnectionGUID: dtRsaqkWTYGDWCP1nqMZFQ==
X-CSE-MsgGUID: F4gl3n75SIi+sdIGeNdAgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3351465"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.245])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:55:56 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/4] drm/i915: Use intel_de_read64_2x32_volatile_fw() for
 IVB_TIMESTAMP_CTR+PIPE_FRMTMSTMP query
Date: Thu, 22 Oct 2026 14:55:45 +0300
Message-ID: <20261022115548.32678-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022115548.32678-1-ville.syrjala@linux.intel.com>
References: <20261022115548.32678-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Switch the combined IVB_TIMESTAMP_CTR+PIPE_FRMTMSTMP read to
use intel_de_read64_2x32_volatile_fw(). It basically does the
same thing that we were doing by hand, and both are already
using the intel_de_read_fw().

This has a few functional changes:
- intel_de_read64_2x32_volatile_fw() has a retry limit, the
  old code did not
- when retrying intel_de_read64_2x32_volatile_fw() reads each
  register once, the old code always read PIPE_FRMTMSTMP twice
  and IVB_TIMESTAMP_CTR once

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 34 +++++++--------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 99cb648cab73..1d4753605675 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -142,34 +142,22 @@ static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc *crtc)
 	const struct drm_display_mode *mode = &vblank->hwmode;
 	u32 htotal = mode->crtc_htotal;
 	u32 clock = mode->crtc_clock;
-	u32 scan_prev_time, scan_curr_time, scan_post_time;
+	u32 curr_time, frame_time;
+	u64 result;
 
 	/*
-	 * To avoid the race condition where we might cross into the
-	 * next vblank just between the PIPE_FRMTMSTMP and TIMESTAMP_CTR
-	 * reads. We make sure we read PIPE_FRMTMSTMP and TIMESTAMP_CTR
-	 * during the same frame.
+	 * IVB_TIMESTAMP_CTR is the current timestamp, PIPE_FRMTMSTMP
+	 * is the sampled timestamp at the start of the previous
+	 * delayed vblank. intel_de_read64_2x32_volatile_fw() gives
+	 * a race free snapshot of both registers.
 	 */
-	do {
-		/*
-		 * This field provides read back of the display
-		 * pipe frame time stamp. The time stamp value
-		 * is sampled at every start of vertical blank.
-		 */
-		scan_prev_time = intel_de_read_fw(display,
+	result = intel_de_read64_2x32_volatile_fw(display,
+						  IVB_TIMESTAMP_CTR,
 						  PIPE_FRMTMSTMP(crtc->pipe));
+	curr_time = lower_32_bits(result);
+	frame_time = upper_32_bits(result);
 
-		/*
-		 * The TIMESTAMP_CTR register has the current
-		 * time stamp value.
-		 */
-		scan_curr_time = intel_de_read_fw(display, IVB_TIMESTAMP_CTR);
-
-		scan_post_time = intel_de_read_fw(display,
-						  PIPE_FRMTMSTMP(crtc->pipe));
-	} while (scan_post_time != scan_prev_time);
-
-	return div_u64(mul_u32_u32(scan_curr_time - scan_prev_time,
+	return div_u64(mul_u32_u32(curr_time - frame_time,
 				   clock), 1000 * htotal);
 }
 
-- 
2.55.0

