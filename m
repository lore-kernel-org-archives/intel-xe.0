Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5D4FF885E
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 11:04:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE6610E6C9;
	Mon, 27 Apr 2026 11:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkFqUwPp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A1910E6C1;
 Mon, 27 Apr 2026 11:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777287886; x=1808823886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ep5PfU5M+92h5oPkp5dk1StHTDKq+GnE0Dqfg+Q/PXI=;
 b=TkFqUwPpezXUKav90ekvoDggPU7SKMY/7dlxEHYKVyNXHG0zF9vuL0za
 02KjZ1IjWtygzw1mg098SrSuWfw3rPW1JV71LPaSOklveL6il5bpqoPOf
 dsJRg1JMSjqP2ZzfW2dtMAznTCN8Up8Ry3FERMqaD2fppoEdrHq28qKbp
 jsaEKLtQAa1GA6aH1LXWa7kR6pmdYaZFmfqw3q0LK5uz8jgU9bf0iaIiK
 Q42R2jojpePik2iZSO7id79iMa3ELhvemlNCzoKbmAz1l/KdjiwueKt8w
 Riv218nvgkQt9mMqdEGoJw8OIKJjxLbMWibHvLagpqxN+CH2m7VFiQTfV w==;
X-CSE-ConnectionGUID: +EeF/AO5Q5KE6G/UO5cBvg==
X-CSE-MsgGUID: Ytyylj3XRJyRaRgEA8E7xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78189054"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78189054"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 04:04:46 -0700
X-CSE-ConnectionGUID: +GrUpStsQAamF3cXw9VDgw==
X-CSE-MsgGUID: jpDzE93FR7yJge4mqrkQuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="256921699"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.53])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 04:04:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/6] drm/i915/display: switch from drm_for_each_crtc() to
 for_each_intel_crtc()
Date: Mon, 27 Apr 2026 14:04:28 +0300
Message-ID: <3f5e2c2bfc68d8e970bf4779fe2d88b68ea9a485.1777287836.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777287836.git.jani.nikula@intel.com>
References: <cover.1777287836.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

intel_has_pending_fb_unpin() has the last direct user of
drm_for_each_crtc() in i915. Switch to for_each_intel_crtc() to ensure
pipe order iteration in all cases.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 311565dcc3b1..88642fd4b22a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -714,22 +714,22 @@ static void icl_set_pipe_chicken(const struct intel_crtc_state *crtc_state)
 
 bool intel_has_pending_fb_unpin(struct intel_display *display)
 {
-	struct drm_crtc *crtc;
+	struct intel_crtc *crtc;
 	bool cleanup_done;
 
-	drm_for_each_crtc(crtc, display->drm) {
+	for_each_intel_crtc(display->drm, crtc) {
 		struct drm_crtc_commit *commit;
-		spin_lock(&crtc->commit_lock);
-		commit = list_first_entry_or_null(&crtc->commit_list,
+		spin_lock(&crtc->base.commit_lock);
+		commit = list_first_entry_or_null(&crtc->base.commit_list,
 						  struct drm_crtc_commit, commit_entry);
 		cleanup_done = commit ?
 			try_wait_for_completion(&commit->cleanup_done) : true;
-		spin_unlock(&crtc->commit_lock);
+		spin_unlock(&crtc->base.commit_lock);
 
 		if (cleanup_done)
 			continue;
 
-		intel_crtc_wait_for_next_vblank(to_intel_crtc(crtc));
+		intel_crtc_wait_for_next_vblank(crtc);
 
 		return true;
 	}
-- 
2.47.3

