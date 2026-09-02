Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B112C624D0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 11:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DB710E233;
	Wed,  2 Sep 2026 11:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuuXFmcr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1D110E008;
 Wed,  2 Sep 2026 11:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788350136; x=1819886136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EYzMh0mRh1nk8N0pOODwf2l8y2EitKZz+cP/QX7Nbzc=;
 b=fuuXFmcrOy/9EOOVpJWgfblD6e/nRKQSe/5jN4B9K4Bor+g25KHtwLEa
 KLyg9ov08hZKGVBPJg+ozdfwlP6unttwxMTk86+KZrhnPydhDP/W3GRro
 zpBVvIzOJJEYo78JCtJWHFGdmIGzw6x5LmYETPvYwapxmgzQrKwQ6EsRX
 2/+VSkwjtV/kDxYwN3IJgGKIzBkey2r66NfFAHDB8mpM7piZlBV5SigyP
 qGFSC1MJmAfkZr4neIGEl2APYVIPg6pTNE56BJ2SUvqCKwqmjtBTk2QNk
 nGpFserZNNbvrUxJuDtIXJvGiat32zB17F84/hQPJ2SgdvtfVqov1Qz+Y w==;
X-CSE-ConnectionGUID: gi/7VYJLTlijn93qdG/o0g==
X-CSE-MsgGUID: L4qH8ELnTAS/n342UtEKIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92506178"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="92506178"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 04:55:35 -0700
X-CSE-ConnectionGUID: h5+rsB85SgmOZouhrl+DAg==
X-CSE-MsgGUID: aQEk/37iSVyt8UKQune8ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="307603617"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa001.jf.intel.com with ESMTP; 02 Sep 2026 04:55:33 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 1/2] drm/i915/display: Reject flipq for commits with no
 plane updates
Date: Wed,  2 Sep 2026 11:55:31 +0000
Message-ID: <20260902115531.872831-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902105448.809455-2-mika.kahola@intel.com>
References: <20260902105448.809455-2-mika.kahola@intel.com>
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

flipq is pointless without an actual plane update to queue. Reject it.

v2:
- Drop the single-plane restriction, plane count doesn't matter (Ville)
- Drop the update_wm_pre/post check, dead code for flipq-capable hw (Ville)
- Drop the active/enabled planes check (Ville)
- Drop the update_pipe/update_m_n/update_lrr check -- unreachable,
  intel_crtc_needs_fastset() above is exactly update_pipe, and
  update_m_n/update_lrr can only be set alongside it or a full modeset,
  both already excluded (Sashiko AI review)
- Drop the intel_flipq_commit_is_eligible() helper -- with the above
  gone, all that's left is one extra check, not worth its own function
  for a single call site

Assisted-by: Copilot:claude-sonnet-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 553c60d452dd..9272fe573ae2 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7385,6 +7385,7 @@ static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
 	/* FIXME deal with everything */
 	new_crtc_state->use_flipq =
 		intel_flipq_supported(display) &&
+		new_crtc_state->update_planes &&
 		!new_crtc_state->do_async_flip &&
 		!new_crtc_state->vrr.enable &&
 		!new_crtc_state->has_psr &&
-- 
2.43.0

