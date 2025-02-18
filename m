Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99240C021AA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 20:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5241D10E100;
	Tue, 18 Feb 2025 20:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TcL4kulh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B0310E76A;
 Tue, 18 Feb 2025 20:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739912346; x=1771448346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PihKp0exM4BbTWy9U1TkBut6l9H3tJBY37OECd8H5Ws=;
 b=TcL4kulhA3aG9j3/Ak0pAfI8d39kdpkmgaCG8OnPbSGjT4x/acksEiYa
 oxEhRuWsewsp4VvXa70ce4xhwbEdJK9txxrU1g8iH/ryXKW658KeDPLd5
 e2dQEPS+UWCBQAhO+2ENPh2/eGPEajFUTmZVWiHwhDRlLK9nAcSI2nFRp
 y9QLzPXwxXAn77uj17BzscnE2vLapKH5V4pr65LsgINHtseVPKrmOfUaZ
 F6IpYvX4KmVF6w7WRqWgeVYTpwO/j4/sy6924P+skPqwvwckxRdVtqKSy
 m1k6dWIejxPQ4FcFJZG71zFrsMHrKx3dEhX42TOf3BBhljzkosEWYSXsJ A==;
X-CSE-ConnectionGUID: h35DToDySZKq7bs8UOwstw==
X-CSE-MsgGUID: pYMrhuNyQUGqsKA8I0WKgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="28228343"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="28228343"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:59:05 -0800
X-CSE-ConnectionGUID: 9J9GEOUzSNWZ9rkTZe9lxw==
X-CSE-MsgGUID: oOOUnmtARoeAzo/u/aRzHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114689002"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Feb 2025 12:59:03 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 18 Feb 2025 22:59:02 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 4/4] drm/i915: Do state check for color management changes
Date: Tue, 18 Feb 2025 22:58:50 +0200
Message-ID: <20250218205850.1422-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250218205850.1422-1-ville.syrjala@linux.intel.com>
References: <20250218205850.1422-1-ville.syrjala@linux.intel.com>
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

In order to validate LUT programming more thoroughly let's
do a state check for all color management updates as well.

Not sure we really want this outside CI. It is rather heavy
and color management updates could become rather common
with all the HDR/etc. stuff happening. Maybe we should have
an extra knob for this that we could enable in CI?

v2: Skip for initial_commit to avoid FDI dotclock
    sanity checks/etc. tripping up

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_modeset_verify.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_modeset_verify.c b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
index bc70e72ccc2e..f61641d27c4a 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_verify.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
@@ -239,6 +239,8 @@ void intel_modeset_verify_crtc(struct intel_atomic_state *state,
 		intel_atomic_get_new_crtc_state(state, crtc);
 
 	if (!intel_crtc_needs_modeset(new_crtc_state) &&
+	    (!intel_crtc_needs_color_update(new_crtc_state) ||
+	     new_crtc_state->inherited) &&
 	    !intel_crtc_needs_fastset(new_crtc_state))
 		return;
 
-- 
2.45.3

