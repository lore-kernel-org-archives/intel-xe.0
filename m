Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B8B606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 16:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O8q2zw+B
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACA2112C45;
	Fri, 23 Oct 2026 16:58:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5A710E61D;
 Fri, 23 Oct 2026 16:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792774692; x=1824310692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ODeVJsOIi6Vw0WB46tyI9LcqBWErA1ka21o4mtTLrk=;
 b=O8q2zw+BqLi6n0MwgJ2Q1eKjY+WVBL8nW/Vuq3nWY1DXzalRnSWFrqy7
 1DbJfBMIB7QCyhw+j8/d9RZ86RQqsxvkgR6WQ6PoHyfzB/Quhdhj3wElw
 WoTuT8fZUFUZDUJ5HVStxiyZ85VajtEWhKBfW9kTOoOnM0RKQgVRakt0h
 ukObjBYVVXbsWiTuZMoNwHS8z60YTeXIFbufOxFX7P3mudjdaL8PgLlQZ
 pWfLWvv60oiXVcPn9SHtDpMWr264Zk7EMW1+TbDrWcHdg4pKkyphybQcc
 7/6g0/bPNDQa4sdRX1dqy/QakR/+4zhE1NqdSkwGCatTizs7abpWARkmj Q==;
X-CSE-ConnectionGUID: rAioWqR0SueNFaLx3BBtIw==
X-CSE-MsgGUID: dfu1ZSH4SMef3iMbushiCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1435220"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1435220"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:11 -0700
X-CSE-ConnectionGUID: /ZCjQ+E3R5ekcFDU22Bw3w==
X-CSE-MsgGUID: Qjl7G95DTf2HiWutLpOsqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3570281"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:09 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 01/13] drm/i915/vrr: Fix intel_vrr_dcb_vmin_vblank_start()
Date: Fri, 23 Oct 2026 19:57:51 +0300
Message-ID: <20261023165803.31016-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

intel_vrr_dcb_vmin_vblank_start() may evaluate
intel_vrr_dcb_vmin_vblank_start_next() twice, and given that
this is doing hardware access under the hood isn't really
desired.

Even worse, the double evaluation might even cause
intel_vrr_dcb_vmin_vblank_start() itself to finally
return -EINVAL (if we race against the DMC hard enough),
which we definitely never want to do.

Eliminate the double evaluation, guaranteeing a sane
final return value at the same time.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index b14750692ae0..e59345bd1d33 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1202,9 +1202,13 @@ int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
 static int
 intel_vrr_dcb_vmin_vblank_start(const struct intel_crtc_state *crtc_state)
 {
-	return (intel_vrr_dcb_vmin_vblank_start_next(crtc_state) < 0) ?
-		intel_vrr_dcb_vmin_vblank_start_final(crtc_state) :
-		intel_vrr_dcb_vmin_vblank_start_next(crtc_state);
+	int vblank_start;
+
+	vblank_start = intel_vrr_dcb_vmin_vblank_start_next(crtc_state);
+	if (vblank_start < 0)
+		vblank_start = intel_vrr_dcb_vmin_vblank_start_final(crtc_state);
+
+	return vblank_start;
 }
 
 int intel_vrr_vmin_safe_window_end(const struct intel_crtc_state *crtc_state)
-- 
2.55.0

