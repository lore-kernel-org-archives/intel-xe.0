Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC53606A325
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aDIaL1yj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC6711295A;
	Fri, 30 Oct 2026 17:14:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA92D11295A;
 Fri, 30 Oct 2026 17:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793380444; x=1824916444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vRnXMn36h+wP3a31Fwd84NLwrsC9zPgms2s2ysGAn4k=;
 b=aDIaL1yjTh/qsxPuTrVkhAgRVY6U9JFWtSORXWczMfyHoSQcB+VT4S1c
 uVHpNt0M6HQFY2yJOpi/KpHumb9Wzzp6BMZk2Lp8KOim0PN7vmCEoAbhg
 LyW1oo00zVGI7I+z7KyXwMQkg1i2uiGaXD8KjGdmX5JBgr9Ts0Jo2y0s1
 dvgg8Zh8mxK7moiYsNk+pu7fYk0bTeRNYrdjqvI0kT8Uev0PvYnFntZp2
 PKBq5ugANrIljRodm2ckgwk5uERltHp4DuZ9kiBYrIiO/YrMSRpI5eJLe
 1fj6vyg0MKxzx3DX/IeUVgTHJd+aWl+JbInA/kgmAjgcefekaie3LwmtX g==;
X-CSE-ConnectionGUID: /zIf6CjkQsSDkN8kHg1lcw==
X-CSE-MsgGUID: KEOVD4JsR8ezhwPStqAlZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2144577"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2144577"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:14:03 -0700
X-CSE-ConnectionGUID: BEm+itfJTFOpvYaiuT5dWw==
X-CSE-MsgGUID: uGPPJetdQ9yJEmiMxdssoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5490945"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:14:02 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 07/10] drm/i915: Reduce the sleep inside
 pipe_scanline_is_moving()
Date: Fri, 30 Oct 2026 19:13:23 +0200
Message-ID: <20261030171327.29829-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
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

The msleep(5) inside pipe_scanline_is_moving() seems rather
excessive. Sleeping for too long might in fact be harmful
as it may even increase the chance that we end up sampling
the scanline at the same spot between two completely different
frames. With high refresh rate display frame durations are
now in the few millisecond range.

Let's use a 250-500 usec sleep instead, which more or less
matches what the poll_timeout_us() uses for the sleep duration
between the samplings. We reject any mode whose line time
excees 64 usec, so that number should guarantee that at least
a few scanlines will have elapsed, but not a whole frame.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 1d4753605675..749640007140 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -477,7 +477,7 @@ static bool pipe_scanline_is_moving(struct intel_display *display,
 	u32 line1, line2;
 
 	line1 = intel_de_read(display, reg) & PIPEDSL_LINE_MASK;
-	msleep(5);
+	usleep_range(250, 500);
 	line2 = intel_de_read(display, reg) & PIPEDSL_LINE_MASK;
 
 	return line1 != line2;
-- 
2.55.0

