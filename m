Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1DFC5DF82
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 08:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBA810EA70;
	Tue, 18 Aug 2026 08:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQuazna1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D3D10EA6F;
 Tue, 18 Aug 2026 08:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787042863; x=1818578863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QLyniBuPnXXfB3ONUbRMJU1YYD8XZC4S9xosPyYsXGE=;
 b=LQuazna1UfJiQs+Ptyn1xGUDix6Tw5UEhZ54MvKDK2n+LxaRMYbMfZbY
 /AlGQoITRH+EOQZiI471U08965ccieHeITbs+Y8g6IBbD4NAhPokBAXC6
 W+kHQNtgOsflQ8RTPalI1QFTZC8f5QR3boQlO5xiss1MeKzu/w19zT+5A
 AoUjTzyCtDRHDb25zLWra2FThfsvrEV3MhYd1qfHDB13ZgeFQf72qlOuz
 TV3XGEXNQ60eoxoTQqbAyYvihPHDA2Rhx1diP44dkiq/v7dANSDe+8GSn
 oj8QwRXwwrSUUAk8/oIhVeCkMJJb9DeJqwlwlWOZpCrDLzcmFOzAjsUot w==;
X-CSE-ConnectionGUID: DSrURm5pQ5+FhxLmPomL3A==
X-CSE-MsgGUID: MfrkfKPjSjeS5ugoM4xVKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87403794"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87403794"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 01:47:43 -0700
X-CSE-ConnectionGUID: PxWFyGPsTRmf9elyWPHKIg==
X-CSE-MsgGUID: 2Tm8QM0HRUCxH5/QMx3Sgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="267136691"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2026 01:47:41 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 6/6] drm/i915/cursor: Allow joiner cursor fast path update
Date: Tue, 18 Aug 2026 14:12:36 +0530
Message-Id: <20260818084236.2168580-7-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260818084236.2168580-1-nemesa.garg@intel.com>
References: <20260818084236.2168580-1-nemesa.garg@intel.com>
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

v4: Trimmed to only the joiner_pipes gate drop. [Chaitanya]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 8599b39b033e..7a0026acdb21 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -902,13 +902,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	 * PSR2 selective fetch also requires the slow path as
 	 * PSR2 plane and transcoder registers can only be updated during
 	 * vblank.
-	 *
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

