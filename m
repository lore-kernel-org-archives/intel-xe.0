Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E037FF8876
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C3310EBE1;
	Tue, 28 Apr 2026 14:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3CAIf6U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FDE10EBE1;
 Tue, 28 Apr 2026 14:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386072; x=1808922072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BDUxG1r8EoXt1vr3jkf6Wd9gxGbMWobsQfr2VvXqfzg=;
 b=D3CAIf6UfX/SIMKiCUV1RdxkKcxLyhM41FYr+m/+CFRlkPga+OfRb7I0
 MgTRl8orILPieOcs+TZIabjLa4NbEBaoCnbr1tUlHV31HQ76R/TArB1Ep
 ToNbJuW3ZFcFladMkKNLBDQyj9zK8uL6EvdAx6AzxblErC8c0Elec67sX
 nnUwxJNiRH7Siaa4M5nAvgxFuAstKnBPxhAEwykR6seZDxJcVW69o1Gqq
 AQFPjHO1gA609guxTuBabP1cUpephRg6Hoj0wbmJQxUeU7zLfHTlJbvMj
 ht2T9l4Fg5ddGqbCXkCH7Za+M2bwk+wcH6sDH3csu7r+TMO8TCCUhYb// g==;
X-CSE-ConnectionGUID: v65xQFBySEu3kJXKiCAUgA==
X-CSE-MsgGUID: XbT14TlbSd+1bfLHrnxsIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="89756395"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="89756395"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:21:12 -0700
X-CSE-ConnectionGUID: RGqK+TN5Tti15pLUcqRl/A==
X-CSE-MsgGUID: pmRtFIi7Q+CoWJzhLqOeCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="227445447"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa009.fm.intel.com with ESMTP; 28 Apr 2026 07:21:11 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 6/6] drm/i915/cursor: Allow joiner cursor fast path update
Date: Tue, 28 Apr 2026 19:46:39 +0530
Message-Id: <20260428141639.2373678-7-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260428141639.2373678-1-nemesa.garg@intel.com>
References: <20260428141639.2373678-1-nemesa.garg@intel.com>
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

The legacy cursor path forced all joiner updates to the
slow path by checking joiner_pipes.
Drop the condition so that joiner cursor updates can use
the fast path.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index d1a70650b9b0..8bbb2f05360b 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -892,12 +892,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	 * PSR2 plane and transcoder registers can only be updated during
 	 * vblank.
 	 *
-	 * FIXME joiner fastpath would be good
 	 */
 	if (!crtc_state->hw.active ||
 	    intel_crtc_needs_modeset(crtc_state) ||
-	    intel_crtc_needs_fastset(crtc_state) ||
-	    crtc_state->joiner_pipes)
+	    intel_crtc_needs_fastset(crtc_state))
 		goto slow;
 
 	/*
-- 
2.25.1

