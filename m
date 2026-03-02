Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC93EB362A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 18:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C08510E587;
	Mon,  2 Mar 2026 18:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Max25J1w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4451610E587;
 Mon,  2 Mar 2026 18:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772475498; x=1804011498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cp+1S3F+kwe4pQ2kn3xsFFMNJJviKaUyzkA0z/JhdBw=;
 b=Max25J1wOg+jN/m9WWwLUsA/SFxDWP/9nvqF8O0o8A5JMN2BI1sFfrPk
 aHvXJo/RkutvpxEvCXiIOlabtXXib/OQi/D1Q49ZsybjNcvyNq3YEBaf1
 VedPVqIy+N0jnSe3hr6QPCLTnvcRxqvRwzvbPgapOSKrzSDBEGkLqLlMl
 gY6uIyc/FjzOv/kTzU8ijKviKkUbFrtQ/PJDTuBk2iuMgsMgPFKzVl3+U
 VVmnRLD4ZRbAd1l9vp3SfH0yKGz36x8faqmn5jgZoP6BBI2YuMbLcPORb
 +dbZihCt2Vw4Zq+3TuTf2lVouUFrd9KeDXfkDeqvwhD/Titey4zzCSqgl g==;
X-CSE-ConnectionGUID: ePWOdldgS86fikpJjZtRHg==
X-CSE-MsgGUID: m1OIpMPET+e5kJfGuAiscA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77362152"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="77362152"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 10:18:18 -0800
X-CSE-ConnectionGUID: wnpyeuD5Rpa+mPEmEgLd1w==
X-CSE-MsgGUID: IzPFv1EbSPK51D41EM2URQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="222378248"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 10:18:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 7/7] drm/i915/frontbuffer: reduce fb for frontbuffer
 abbreviation usage
Date: Mon,  2 Mar 2026 20:17:39 +0200
Message-ID: <f7f04d63771891d1c3b1aa280485437bc4a70f20.1772475391.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772475391.git.jani.nikula@intel.com>
References: <cover.1772475391.git.jani.nikula@intel.com>
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

Using fb for frontbuffer is a bit misleading, as framebuffer is the more
common fb. Reduce fb usage in frontbuffer function naming.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 12 ++++++------
 drivers/gpu/drm/i915/display/intel_frontbuffer.h | 16 ++++++++--------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 61ce82f85dad..705742e117ca 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -123,9 +123,9 @@ void intel_frontbuffer_flip(struct intel_display *display,
 	frontbuffer_flush(display, frontbuffer_bits, ORIGIN_FLIP);
 }
 
-void __intel_fb_invalidate(struct intel_frontbuffer *front,
-			   enum fb_op_origin origin,
-			   unsigned int frontbuffer_bits)
+void __intel_frontbuffer_invalidate(struct intel_frontbuffer *front,
+				    enum fb_op_origin origin,
+				    unsigned int frontbuffer_bits)
 {
 	struct intel_display *display = front->display;
 
@@ -143,9 +143,9 @@ void __intel_fb_invalidate(struct intel_frontbuffer *front,
 	intel_fbc_invalidate(display, frontbuffer_bits, origin);
 }
 
-void __intel_fb_flush(struct intel_frontbuffer *front,
-		      enum fb_op_origin origin,
-		      unsigned int frontbuffer_bits)
+void __intel_frontbuffer_flush(struct intel_frontbuffer *front,
+			       enum fb_op_origin origin,
+			       unsigned int frontbuffer_bits)
 {
 	struct intel_display *display = front->display;
 
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
index c9a22b6ccfd6..a89ce352b12b 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -66,9 +66,9 @@ struct intel_frontbuffer {
 void intel_frontbuffer_flip(struct intel_display *display,
 			    unsigned frontbuffer_bits);
 
-void __intel_fb_invalidate(struct intel_frontbuffer *front,
-			   enum fb_op_origin origin,
-			   unsigned int frontbuffer_bits);
+void __intel_frontbuffer_invalidate(struct intel_frontbuffer *front,
+				    enum fb_op_origin origin,
+				    unsigned int frontbuffer_bits);
 
 /**
  * intel_frontbuffer_invalidate - invalidate frontbuffer object
@@ -93,13 +93,13 @@ static inline bool intel_frontbuffer_invalidate(struct intel_frontbuffer *front,
 	if (!frontbuffer_bits)
 		return false;
 
-	__intel_fb_invalidate(front, origin, frontbuffer_bits);
+	__intel_frontbuffer_invalidate(front, origin, frontbuffer_bits);
 	return true;
 }
 
-void __intel_fb_flush(struct intel_frontbuffer *front,
-		      enum fb_op_origin origin,
-		      unsigned int frontbuffer_bits);
+void __intel_frontbuffer_flush(struct intel_frontbuffer *front,
+			       enum fb_op_origin origin,
+			       unsigned int frontbuffer_bits);
 
 /**
  * intel_frontbuffer_flush - flush frontbuffer object
@@ -121,7 +121,7 @@ static inline void intel_frontbuffer_flush(struct intel_frontbuffer *front,
 	if (!frontbuffer_bits)
 		return;
 
-	__intel_fb_flush(front, origin, frontbuffer_bits);
+	__intel_frontbuffer_flush(front, origin, frontbuffer_bits);
 }
 
 void intel_frontbuffer_queue_flush(struct intel_frontbuffer *front);
-- 
2.47.3

