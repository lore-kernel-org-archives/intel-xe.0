Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B199C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 14:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F26C10E3B3;
	Mon,  9 Jun 2025 14:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mp0SKj4V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8901510E3B0;
 Mon,  9 Jun 2025 14:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749478257; x=1781014257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6nBLbmLyH3nnpvikW8S/tsyRAh1gt+hzEqaoonEoTRo=;
 b=Mp0SKj4VRu5W3zlFtXqkt6002w/NNxPMhA6Crqv+xGMIHpWFAskoMfso
 NiA3dJyXzu0yk0CWnu1+w34MeUgGdFwUtuI61ZV8C/zAtg6HvdhS+BcCk
 lofju7YH9PfiTKLDKJEU/Iu6a58feQTj+0GVbpARler8Ui1wrko0ndFvR
 wcfA8CAYQQOg6FiRoCIHo6/eW/1+FEsDDlux/zTZcoztj3u/nyEY4lnJj
 RCGkUO3FAroz9MqvAVCUOPP4o3DixykwIE2O1Y7f9zB7KHfyKoOzKLoL4
 53rL3EXVhWzbGzlM8gy1NMkH79Wt7bI064fF2odGfUttBX5aVER9YyI6g g==;
X-CSE-ConnectionGUID: sifvF3oES2KY9t6ylC57uA==
X-CSE-MsgGUID: aQwB/+VfRdKIplZPwk+kLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55360713"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="55360713"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 07:10:57 -0700
X-CSE-ConnectionGUID: dEIcB6XwQAiIOt8kmPJyoQ==
X-CSE-MsgGUID: jlBLGW3kRyS0TzyyJt8FuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="151765455"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.244.99])
 by orviesa005.jf.intel.com with SMTP; 09 Jun 2025 07:10:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Jun 2025 17:10:53 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 02/21] drm/i915/dsb: Provide intel_dsb_head() and
 intel_dsb_size()
Date: Mon,  9 Jun 2025 17:10:27 +0300
Message-ID: <20250609141046.6244-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609141046.6244-1-ville.syrjala@linux.intel.com>
References: <20250609141046.6244-1-ville.syrjala@linux.intel.com>
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

The upcoming flip queue implementation will need to know the
DSB buffer head and size. Expose those outside intel_dsb.c.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 9 +++++++--
 drivers/gpu/drm/i915/display/intel_dsb.h | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index abda04d969c7..8cbb5695c651 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -242,14 +242,19 @@ static bool is_dsb_busy(struct intel_display *display, enum pipe pipe,
 	return intel_de_read_fw(display, DSB_CTRL(pipe, dsb_id)) & DSB_STATUS_BUSY;
 }
 
-static unsigned int intel_dsb_head(struct intel_dsb *dsb)
+unsigned int intel_dsb_size(struct intel_dsb *dsb)
+{
+	return dsb->free_pos * 4;
+}
+
+unsigned int intel_dsb_head(struct intel_dsb *dsb)
 {
 	return intel_dsb_buffer_ggtt_offset(&dsb->dsb_buf);
 }
 
 static unsigned int intel_dsb_tail(struct intel_dsb *dsb)
 {
-	return intel_dsb_buffer_ggtt_offset(&dsb->dsb_buf) + dsb->free_pos * 4;
+	return intel_dsb_buffer_ggtt_offset(&dsb->dsb_buf) + intel_dsb_size(dsb);
 }
 
 static void intel_dsb_ins_align(struct intel_dsb *dsb)
diff --git a/drivers/gpu/drm/i915/display/intel_dsb.h b/drivers/gpu/drm/i915/display/intel_dsb.h
index 6900acd603b8..ab6489749866 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.h
+++ b/drivers/gpu/drm/i915/display/intel_dsb.h
@@ -26,6 +26,8 @@ enum intel_dsb_id {
 	I915_MAX_DSBS,
 };
 
+unsigned int intel_dsb_size(struct intel_dsb *dsb);
+unsigned int intel_dsb_head(struct intel_dsb *dsb);
 struct intel_dsb *intel_dsb_prepare(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc,
 				    enum intel_dsb_id dsb_id,
-- 
2.49.0

