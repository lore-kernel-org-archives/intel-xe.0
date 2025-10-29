Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D267ACCF9F5
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 08:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966B310E758;
	Wed, 29 Oct 2025 08:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emy++bHi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE2510E754;
 Wed, 29 Oct 2025 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761727641; x=1793263641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hlPiwRLMKA8lWqtdHVOFrbx8BAOlf3HgQBQtg6+UOyc=;
 b=emy++bHijYIKA4P2vuXK516sP3StVyg1+5ZulXxLM98jvvhKdHNMFaob
 suAMsNb5rROttpukMoA+SnFs+RZgRTPqcrGv93M4SO9o+lg8Drgwo5ZFk
 CikOfI18H4yGUS35a5Os8BSeqQ+eiUebN7jWirCrCYDru8tbeEm+b3yB0
 /f7KwxsG2S4wKYZufSAd1VMm7AHcg+ixk8pGc6JyLXhcqy6PZk1wBJ+8W
 jl8aen7k503mMZNUwC0ViHxeuQA5GH4RvP289Ksnb/S0kMxYOYFOXBWy5
 IEjo57EgKZDxkp2Esd8OT1scvikwMNPDKqNkXmzMlPzxWYzUcSheGx5KV g==;
X-CSE-ConnectionGUID: QaQ/QzoNR+CxJzyFJZXhqg==
X-CSE-MsgGUID: TqaSPDCiRn2X/u0UwpRufQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75289919"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="75289919"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:47:20 -0700
X-CSE-ConnectionGUID: P+WPj62qTZ2QXiIaoVSDGQ==
X-CSE-MsgGUID: ob86MBQJR1ytGwk/2hpdjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185514875"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.242])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:47:18 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Luca Coelho <luciano.coelho@intel.com>
Subject: [PATCH v2 7/9] drm/i915/wm: Do skl_wm_check_vblank() after DDB stuff
Date: Wed, 29 Oct 2025 10:46:45 +0200
Message-ID: <20251029084647.4165-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251029084647.4165-1-ville.syrjala@linux.intel.com>
References: <20251029084647.4165-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Feels more sensible to check the original unmangled watermarks
against the allocated DDB size first, and only then do
skl_wm_check_vblank() on whatever is left.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 256162da9afc..764770fab7e7 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -2346,7 +2346,7 @@ static int skl_build_pipe_wm(struct intel_atomic_state *state,
 
 	crtc_state->wm.skl.optimal = crtc_state->wm.skl.raw;
 
-	return skl_wm_check_vblank(crtc_state);
+	return 0;
 }
 
 static bool skl_wm_level_equals(const struct skl_wm_level *l1,
@@ -2923,6 +2923,10 @@ skl_compute_wm(struct intel_atomic_state *state)
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
 		struct skl_pipe_wm *pipe_wm = &new_crtc_state->wm.skl.optimal;
 
+		ret = skl_wm_check_vblank(new_crtc_state);
+		if (ret)
+			return ret;
+
 		/*
 		 * We store use_sagv_wm in the crtc state rather than relying on
 		 * that bw state since we have no convenient way to get at the
-- 
2.49.1

