Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BD8606A901
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 20:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TgdI+8In
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B783910E6C8;
	Thu, 19 Nov 2026 20:51:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C4210E872;
 Thu, 19 Nov 2026 20:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795121460; x=1826657460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kDiQGZS/te7wnGgCkMVQjvZQDFzro7OPHG2QMXuOW+o=;
 b=TgdI+8InWOahYNktztZ0VJ397gohJ0Ru9kISU4gXpJUnly6gZmeZiOPp
 kVDzolSdx52SsWWTn3OOTBRtg1eFzudf4uHRlZTqDYoZXQyVA5rH8o+y7
 JKRUh6pfu6e31VBPJEvW120KvkQqqUwmsooHkQc4Qn4uTYaPPyUdzBJ6Q
 cqoP5JKuvuZqHVGr8w6emBJVPGpJf1nVG5Pk76e5+DLcKlKiEH/+S2q2X
 f7ds6elXILmHCaoJUFA5qsKKCETgCSe2YQjJubqMCC8uCldcXpEjdW3Qg
 zh8TmioUAFj7fXfOHDpjpYnQ07wBVCGZ5wn3z8TTYbly2zmmJvtIqZCak Q==;
X-CSE-ConnectionGUID: uUhGVumvTqi/BQaBkyncdw==
X-CSE-MsgGUID: 3+hdfMkxTjCAv2r5xpfPuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3884355"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3884355"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:51:00 -0800
X-CSE-ConnectionGUID: AF1GBJm5TPKPv76zfQM6QA==
X-CSE-MsgGUID: uO4UoE5eQfm6XTFkVvi94A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10524857"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:50:58 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 3/6] drm/i915/de: Flatten the unclaimed mmio code
Date: Thu, 19 Nov 2026 22:50:37 +0200
Message-ID: <20261119205040.31935-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119205040.31935-1-ville.syrjala@linux.intel.com>
References: <20261119205040.31935-1-ville.syrjala@linux.intel.com>
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

The unclaimed register access code is nested a few
too many levels to my linking in places. Flatten it
all out to make it a bit nicer.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c | 51 ++++++++++++++-----------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 799ca57bac65..17954963ddf9 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -250,11 +250,13 @@ static void check_unclaimed_mmio_pre(struct intel_display *display,
 	if (!display->params.mmio_debug)
 		return;
 
-	if (display->mmio.funcs->check_for_unclaimed_mmio(display))
-		drm_dbg_kms(display->drm,
-			    "Unclaimed access detected before %s register 0x%x\n",
-			    write ? "write to" : "read from",
-			    intel_reg_offset(reg));
+	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
+		return;
+
+	drm_dbg_kms(display->drm,
+		    "Unclaimed access detected before %s register 0x%x\n",
+		    write ? "write to" : "read from",
+		    intel_reg_offset(reg));
 }
 
 static void check_unclaimed_mmio_post(struct intel_display *display,
@@ -265,13 +267,16 @@ static void check_unclaimed_mmio_post(struct intel_display *display,
 	if (!display->params.mmio_debug)
 		return;
 
-	if (drm_WARN(display->drm,
-		     display->mmio.funcs->check_for_unclaimed_mmio(display),
-		     "Unclaimed %s register 0x%x\n",
-		     write ? "write to" : "read from",
-		     intel_reg_offset(reg)))
-		/* Only report the first N failures */
-		display->params.mmio_debug--;
+	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
+		return;
+
+	drm_WARN(display->drm, true,
+		 "Unclaimed %s register 0x%x\n",
+		 write ? "write to" : "read from",
+		 intel_reg_offset(reg));
+
+	/* Only report the first N failures */
+	display->params.mmio_debug--;
 }
 
 bool intel_de_unclaimed_mmio_detected(struct intel_display *display)
@@ -300,18 +305,20 @@ bool intel_de_arm_unclaimed_mmio_detection(struct intel_display *display)
 	if (display->mmio.unclaimed_mmio_check <= 0)
 		goto out;
 
-	if (display->mmio.funcs->check_for_unclaimed_mmio(display)) {
-		if (!display->params.mmio_debug) {
-			drm_dbg_kms(display->drm,
-				    "Unclaimed register detected, "
-				    "enabling oneshot unclaimed register reporting. "
-				    "Please use i915.mmio_debug=N for more information.\n");
-			display->params.mmio_debug++;
-		}
-		display->mmio.unclaimed_mmio_check--;
-		ret = true;
+	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
+		goto out;
+
+	if (!display->params.mmio_debug) {
+		drm_dbg_kms(display->drm,
+			    "Unclaimed register detected, "
+			    "enabling oneshot unclaimed register reporting. "
+			    "Please use i915.mmio_debug=N for more information.\n");
+		display->params.mmio_debug++;
 	}
 
+	display->mmio.unclaimed_mmio_check--;
+	ret = true;
+
 out:
 	spin_unlock_irq(&display->mmio.lock);
 
-- 
2.56.0

