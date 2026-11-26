Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9B0606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A0jUfUaI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E103910E848;
	Thu, 26 Nov 2026 12:31:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64A310E848;
 Thu, 26 Nov 2026 12:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795696298; x=1827232298;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lInL89k25kZNrw/imYXUtYpBn4wkBN/+yzPzKUHA/ZA=;
 b=A0jUfUaIGDifr5O6SvLcE3Fi71BHpDO7XjJsOeEJYhtx1F51BbZPVyxY
 Jw1Dm/ERNd9DaQ0AmJFT5SWsljrbM3QR40A1oipGNqnc13zLTaRVnkRAr
 RV4qxRxfwv2Og3WOZXGB4TM+WOoxmk6Y0bxPUPK58AEsVYGINSYLQ22Rx
 JWF2oOR28s2OXjZkg+MN0bTnvfuk3RI26yJuD6aKj+qQfija6x5CG6BsQ
 MmD/zFZ2JbDOlreobX0NZYcov8GMMBNO69nlZdmopCr5DFd5DgeDNrXRq
 Y64qeCYIpF7nmmfr2EWBdP2sZ+fM/TdAtoE2WfsTtJai/a9ROH992Be7g w==;
X-CSE-ConnectionGUID: ImhWPKeAR36X1+wGuLveXg==
X-CSE-MsgGUID: pnv97iBoSvuZHC6N6WCwgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4654415"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4654415"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 04:31:38 -0800
X-CSE-ConnectionGUID: /pzLCWrGQbuCFYw8/S6k1Q==
X-CSE-MsgGUID: SIdv3J2hRbKxBeEM8Q6u7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12077487"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 04:31:37 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/i915: Remove the HSW+ PIPEDSL==0 hack
Date: Thu, 26 Nov 2026 14:31:32 +0200
Message-ID: <20261126123132.9589-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.1
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

Remove the ugly "wait until PIPEDSL reads non zero" hack from
__intel_get_crtc_scanline(), added in
commit 41b578fb0e8b ("drm/i915: workaround bad DSL readout v3") and
commit b291681926a1 ("drm/i915: Extend DSL readout fix to BDW
and SKL.").

I'm 90% sure this was just PSR deep sleep (the symptoms match),
and no one actually understood PSR at the time. Unfortunately
no one felt the need to leave any useful logs in the bug
(https://bugs.freedesktop.org/show_bug.cgi?id=91579) either
so a bit hard to confirm :/

The proper fix for vblank evasion vs. PSR happened only a few years
later with
commit a608987970b9 ("drm/i915: Wait for PSR exit before checking
for vblank evasion")

Removing the retry loop does mean that we may in fact read a
semi-bogus zero a bit more often from the register when PSR
hasn't been waited on (eg. in tracepoints). But the ~100usec
timeout did not in any way guarantee that PSR exit was done
by the time we return from __intel_get_crtc_scanline(), so
getting the semi-bogus zero was always a possibility. This
is something to bare in mind when inspecting trace logs and
whatnot.

Another approach I was thinking was to just do a pair of reads,
separated by a wait of a few scanlines, and then maybe return
something like vblank_start-1 if the two reads both come out
as zeroes. But that would still be a lie as we have no idea
how long until the timing generator starts up again, and I'm
not sure that lie is any better than the other.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 26 ---------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 114ff43381b5..616710bd05b0 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -247,32 +247,6 @@ static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
 
 	position = intel_de_read_fw(display, PIPEDSL(display, pipe)) & PIPEDSL_LINE_MASK;
 
-	/*
-	 * On HSW, the DSL reg (0x70000) appears to return 0 if we
-	 * read it just before the start of vblank.  So try it again
-	 * so we don't accidentally end up spanning a vblank frame
-	 * increment, causing the pipe_update_end() code to squak at us.
-	 *
-	 * The nature of this problem means we can't simply check the ISR
-	 * bit and return the vblank start value; nor can we use the scanline
-	 * debug register in the transcoder as it appears to have the same
-	 * problem.  We may need to extend this to include other platforms,
-	 * but so far testing only shows the problem on HSW.
-	 */
-	if (HAS_DDI(display) && !position) {
-		int i, temp;
-
-		for (i = 0; i < 100; i++) {
-			udelay(1);
-			temp = intel_de_read_fw(display,
-						PIPEDSL(display, pipe)) & PIPEDSL_LINE_MASK;
-			if (temp != position) {
-				position = temp;
-				break;
-			}
-		}
-	}
-
 	/*
 	 * See update_scanline_offset() for the details on the
 	 * scanline_offset adjustment.
-- 
2.56.1

