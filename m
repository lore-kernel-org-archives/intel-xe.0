Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C66C0219E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 22:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4941A10E0DB;
	Fri,  7 Feb 2025 22:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="egFDbnRz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351D510EBB5;
 Fri,  7 Feb 2025 22:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738967525; x=1770503525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G3N2aomj3u4LY8OYi5XSbWS2TnTroo52D5J5TjF/Gt4=;
 b=egFDbnRzQNTOzks5/lkuqueJ3sYY7BB+4udZblejek98u4gTvIUUYy2r
 n9R8MQw2lJtOKnTpjpjLtH3PEiZiuqYooJEbOlfqa8Mp67YziZru/8IIT
 bFmqtZPmDhPGLfkJLSdvMWdXV0gBASAUMriRefp2iXFxVZ23xINxrH6iU
 OWFZYFFMyEqO8VIXksV/y4EC3Ld6Xg4cXktDJOQ4E3JZ2skimHl7e8esa
 VhEo8ZVCRUgCaitGJ7UigrNDWcvXr9STHYHvHPMSp3NGOXF3KYOFxN9r/
 02v/Intm6GiPjZCD88D+Q3NBHufloRLxIiLKriain1j3YNAsu3iuGZH1W A==;
X-CSE-ConnectionGUID: qLmvRRfjQgWWpnrMmVakMw==
X-CSE-MsgGUID: PpXOeQ6bRJmY407enM4fjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39313389"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="39313389"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:32:05 -0800
X-CSE-ConnectionGUID: BOZwU7SjSsKgoImBJAjcIg==
X-CSE-MsgGUID: lGTaA89sTfO+Azy7HjbrIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111857412"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Feb 2025 14:32:03 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 08 Feb 2025 00:32:02 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm/i915/dsb: Move the +1 usec adjustment into
 dsb_wait_usec()
Date: Sat,  8 Feb 2025 00:31:52 +0200
Message-ID: <20250207223159.14132-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250207223159.14132-1-ville.syrjala@linux.intel.com>
References: <20250207223159.14132-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The "wait usec" DSB command doesn't quite seem to able to
guarantee that it always waits at least the specified
amount of usecs. Some of that could be just because it
supposedly just does some kind of dumb timestamp comparison
internally. But I also see cases where two hardware timestamps
sampled on each side of the "wait usec" command come out one
less than expected. So it looks like we always need at least a
+1 to guarantee that we never wait less than specified. Always
apply that adjustment in dsb_wait_usec().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 2f2812c23972..f8bd6fad0c87 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -369,7 +369,8 @@ void intel_dsb_interrupt(struct intel_dsb *dsb)
 
 void intel_dsb_wait_usec(struct intel_dsb *dsb, int count)
 {
-	intel_dsb_emit(dsb, count,
+	/* +1 to make sure we never wait less time than asked for */
+	intel_dsb_emit(dsb, count + 1,
 		       DSB_OPCODE_WAIT_USEC << DSB_OPCODE_SHIFT);
 }
 
@@ -622,7 +623,7 @@ void intel_dsb_wait_vblank_delay(struct intel_atomic_state *state,
 	const struct intel_crtc_state *crtc_state =
 		intel_pre_commit_crtc_state(state, crtc);
 	int usecs = intel_scanlines_to_usecs(&crtc_state->hw.adjusted_mode,
-					     dsb_vblank_delay(state, crtc)) + 1;
+					     dsb_vblank_delay(state, crtc));
 
 	intel_dsb_wait_usec(dsb, usecs);
 }
-- 
2.45.3

