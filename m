Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F57CCCA476
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 12:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99C710E444;
	Mon, 13 Oct 2025 12:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EsDMa5WQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E88710E441;
 Mon, 13 Oct 2025 12:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760359752; x=1791895752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WFRag4stqXdPp0IfRVMZWmqPZbia6Ud3Yy2FhRZODYk=;
 b=EsDMa5WQz6BkZ1bDYNJIzNyXDKGLNaNHd2HB6j74UtnsUvfmTWtv9e8i
 rqXdkmi6qKiAUu1ko2Y6pPdy5O3T2n5CPjze8JIjDR65nBmdI6R/E0dce
 E/mdhThn/dd7qoBp4aOSL1DOtXsekuVYNEPSo+kJ6gR4UuUVa1UYwZ5q8
 5d2UPZrfk4ZWgGhcKYcMnKDsUUBHNDpkQTC9jucwi/2Pzsl6OpqH6cFb7
 xbyOFMQhFGQV4QTeN8dn+6UFd5fY9foEUOemYhuhxL1DER6QTExvsZiY6
 +ac8vGCYKP+bUUJebabO1atK7BD/K0gMC5Wz14mqpn+HBjplbCuYE1MWS w==;
X-CSE-ConnectionGUID: 6mFBHjO6TvGvMmYYyE0pQA==
X-CSE-MsgGUID: kearLjYLSfiuUe373Fz8MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="85121152"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="85121152"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 05:49:12 -0700
X-CSE-ConnectionGUID: uOIl8O2ySgilxpbGon+P3g==
X-CSE-MsgGUID: oZSJaWLxSoC3ub+rrza7DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="182026849"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 05:49:09 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 2/8] drm/i915/display: Move intel_dpll_crtc_compute_clock early
Date: Mon, 13 Oct 2025 18:05:53 +0530
Message-ID: <20251013123559.1055429-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251013123559.1055429-1-ankit.k.nautiyal@intel.com>
References: <20251013123559.1055429-1-ankit.k.nautiyal@intel.com>
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

Move intel_dpll_crtc_compute_clock in the beginning of the function so that
clocks are set before other things.

This will help in subsequent changes when the vrr guardband computation
is moved to intel_crtc_compute_config().

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index d5b2612d4ec2..3f725553599e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2410,11 +2410,11 @@ static int intel_crtc_compute_config(struct intel_atomic_state *state,
 		intel_atomic_get_new_crtc_state(state, crtc);
 	int ret;
 
-	ret = intel_crtc_compute_set_context_latency(state, crtc);
+	ret = intel_dpll_crtc_compute_clock(state, crtc);
 	if (ret)
 		return ret;
 
-	ret = intel_dpll_crtc_compute_clock(state, crtc);
+	ret = intel_crtc_compute_set_context_latency(state, crtc);
 	if (ret)
 		return ret;
 
-- 
2.45.2

