Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24372CD98F1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 16:23:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CA010ECCF;
	Tue, 16 Jun 2026 16:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I788fzFf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21E010ECC8;
 Tue, 16 Jun 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781627015; x=1813163015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5rznq9EXAqzc9VppiHbKqUT1xdqMKZI4Uwmn1qtCFZk=;
 b=I788fzFfdYrbObxEZe+zMeU7HMt/vKM3m01Nc+FYPnO3YXRhZKWd/W3e
 a2P3vvk0QzqV4Zr/xRY/ZMAJYxNxQHumtfXKrZLRe4M47+OvlC16YoTGH
 EcmuQ10jbPDwlHSgAjqN8JGnn4wCAr2j4KE29de8kwQgzdGjKKHBE9cvK
 kS7dI93J0Vf+dIKifws8MGr3emPXl2YRJ2D9r4E0bnCskxImJQAGcZ3Fo
 2H5+gHLlr/H4CRDdhFMoOdfIjGwulI4g38grSLFEmr3+A7wo6yIFEp3P8
 GoRlFmM1HC2V7Ywq9bf42wp4l20EneAlFVUMsDz569yP0gboB8zcW/4PX g==;
X-CSE-ConnectionGUID: B7J1bs/RSjKNYiVTeUZDsg==
X-CSE-MsgGUID: 0iWvRKhNSf6v5hvd9Tuf9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93781340"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="93781340"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:23:35 -0700
X-CSE-ConnectionGUID: +SV+k+J+T5+xMX2kxyU+zA==
X-CSE-MsgGUID: 34hgwUiXRvuQT9fv8D4nsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247693562"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:23:34 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, animesh.manna@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v6 15/16] drm/i915/display: Guard CMTG function calls
Date: Tue, 16 Jun 2026 21:51:53 +0530
Message-ID: <20260616162154.2630995-16-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616162154.2630995-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616162154.2630995-1-dibin.moolakadan.subrahmanian@intel.com>
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

Check if DC3CO is allowed before calling CMTG
functions in intel_atomic_commit_tail() as CMTG is only used
by DC3CO DC state.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ddcf2d2054b7..3b17ce669ac5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7579,10 +7579,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	/* FIXME probably need to sequence this properly */
 	intel_program_dpkgc_latency(state);
 
-	/*
-	 * TODO: DC3co entry condition need to be checked before calling CMTG functions.
-	 */
-	intel_cmtg_program(state);
+	if (intel_display_power_dc3co_allowed(display))
+		intel_cmtg_program(state);
 
 	intel_wait_for_vblank_workers(state);
 
-- 
2.43.0

