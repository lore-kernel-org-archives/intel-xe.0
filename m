Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9840A606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 07:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ruuh2Xsw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4BC11266C;
	Fri, 30 Oct 2026 07:06:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962DF112668;
 Fri, 30 Oct 2026 07:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793343994; x=1824879994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F2crvUFHw3OCphaSPDvBIzqq70O98hlLivvu9ms8kP8=;
 b=Ruuh2Xswul6voYlOYOgRfHBqjUwD//iLUlE80tid6aSX9y2o5YUbpIn1
 uN1Ma1zMQiraTM9tkdlA5jTb67iiviaBCaBJANrO8v1PmB+Yg7aUcIstA
 Wtd+Rlk5lc3ZVxAx3Y9Ij6msKKTjWa2us99hsRmwcp6evzG/W9N5iBHCo
 L8YF4DSLkEoVuA0WK1HJBimEY9Nh0KQ/ixreeJ1noWLoDvMcSmEMpJQ7Z
 DI4LOt9hf10UNAM05huuWDDSNJX4OEovtHcbxvvyTEeRBY8VEZ6zeLp7z
 DwnANcgRNYkrqvkKim9YgXcI9AUr0saMOu7rnkyAc0gcCM9NS3obEVEFD Q==;
X-CSE-ConnectionGUID: PWWLBYTfSFmQEgdXIyV2JA==
X-CSE-MsgGUID: gzAD1QBoSruJ5NBEkBUndw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1985054"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1985054"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 00:06:33 -0700
X-CSE-ConnectionGUID: j3ZvcFrjRZeNm2sNNpsfmQ==
X-CSE-MsgGUID: tuv1i+W+RNK3BoZXapHryA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5485193"
Received: from szadworn-mobl.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 00:06:31 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 2/2] drm/i915/display: Flush the fbdev frontbuffer
Date: Fri, 30 Oct 2026 09:06:13 +0200
Message-ID: <20261030070613.181026-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030070613.181026-1-jouni.hogander@intel.com>
References: <20261030070613.181026-1-jouni.hogander@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

fbdev invalidates on set_par, blank, pan_display and restore, but never
flushes. On i915, unrelated rendering may clear the bits; Xe has no
ORIGIN_CS invalidation, so PSR and FBC can remain disabled indefinitely.

Flush after these operations; they are already complete.

Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 219ee17de3f68..c09246a9865cd 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -75,9 +75,10 @@ static struct intel_frontbuffer *to_frontbuffer(struct intel_fbdev *ifbdev)
 	return ifbdev->fb->frontbuffer;
 }
 
-static void intel_fbdev_invalidate(struct intel_fbdev *ifbdev)
+/* The console operation has already completed, hence flush not invalidate. */
+static void intel_fbdev_flush(struct intel_fbdev *ifbdev)
 {
-	intel_frontbuffer_invalidate(to_frontbuffer(ifbdev), ORIGIN_CPU);
+	intel_frontbuffer_flush(to_frontbuffer(ifbdev), ORIGIN_CPU);
 }
 
 FB_GEN_DEFAULT_DEFERRED_IOMEM_OPS(intel_fbdev,
@@ -91,7 +92,7 @@ static int intel_fbdev_set_par(struct fb_info *info)
 
 	ret = drm_fb_helper_set_par(info);
 	if (ret == 0)
-		intel_fbdev_invalidate(ifbdev);
+		intel_fbdev_flush(ifbdev);
 
 	return ret;
 }
@@ -103,7 +104,7 @@ static int intel_fbdev_blank(int blank, struct fb_info *info)
 
 	ret = drm_fb_helper_blank(blank, info);
 	if (ret == 0)
-		intel_fbdev_invalidate(ifbdev);
+		intel_fbdev_flush(ifbdev);
 
 	return ret;
 }
@@ -116,7 +117,7 @@ static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
 
 	ret = drm_fb_helper_pan_display(var, info);
 	if (ret == 0)
-		intel_fbdev_invalidate(ifbdev);
+		intel_fbdev_flush(ifbdev);
 
 	return ret;
 }
@@ -180,7 +181,7 @@ static void intelfb_restore(struct drm_fb_helper *fb_helper)
 {
 	struct intel_fbdev *ifbdev = to_intel_fbdev(fb_helper);
 
-	intel_fbdev_invalidate(ifbdev);
+	intel_fbdev_flush(ifbdev);
 }
 
 static void intelfb_set_suspend(struct drm_fb_helper *fb_helper, bool suspend)
-- 
2.43.0

