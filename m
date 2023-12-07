Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA52C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B5710E88D;
	Thu,  7 Dec 2023 13:01:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568C610E1CD
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701954065; x=1733490065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6aCLqde4dEbFS4qFsp25lbxvfK3cPmTOpW9TLltYztg=;
 b=Sisyd04oaPkGdJZw/en6Ht2M0dSI+goZRZbwO+8l0Y5+ty6YM9fPNu9I
 Hx6cOLD7NHerZYNTLau59IEIaxRssp3j+n6mnWGrkNpMuGB9YQxxW5nrK
 DM4mjdeEMdEF1hbrKZyPXsq019p66PEtpx7G2+TJtRQZOO2FuaLaf2vh5
 l0M1TvMUeEa+0tpr21tw6ZdeOtvs7LhvIKrla7rLA2RlZS4FwdS0Y/Lnz
 TNqX/NY90awXHXB5LbiN8AWkNpvC4EI0fAZIIeAN7b8hJUgWRhwlFWsjL
 0pVykFnElvFPhOTOFrYF5uHV0faRk9HtuHCAB32+qKTxjZS5wwuEDKvjg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1308960"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1308960"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="721454167"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721454167"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:01 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/9] fixup! FIXME: drm/i915/display: Remaining changes to
 make xe compile
Date: Thu,  7 Dec 2023 15:00:38 +0200
Message-Id: <20231207130046.2350822-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207130046.2350822-1-jouni.hogander@intel.com>
References: <20231207130046.2350822-1-jouni.hogander@intel.com>
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We are about to backport patch which is helping us to get rid of Xe build
changes in intel_cursor.c:

https://patchwork.freedesktop.org/series/127300/

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 8ed8a623fa98..b342fad180ca 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -30,17 +30,15 @@ static const u32 intel_cursor_formats[] = {
 
 static u32 intel_cursor_base(const struct intel_plane_state *plane_state)
 {
-	__maybe_unused struct drm_i915_private *dev_priv =
+	struct drm_i915_private *dev_priv =
 		to_i915(plane_state->uapi.plane->dev);
-	__maybe_unused const struct drm_framebuffer *fb = plane_state->hw.fb;
-	__maybe_unused const struct drm_i915_gem_object *obj = intel_fb_obj(fb);
+	const struct drm_framebuffer *fb = plane_state->hw.fb;
+	const struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 	u32 base;
 
-#ifdef I915
 	if (DISPLAY_INFO(dev_priv)->cursor_needs_physical)
 		base = sg_dma_address(obj->mm.pages->sgl);
 	else
-#endif
 		base = intel_plane_ggtt_offset(plane_state);
 
 	return base + plane_state->view.color_plane[0].offset;
-- 
2.34.1

