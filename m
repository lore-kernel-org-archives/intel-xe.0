Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04660FF510C
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 15:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD0F10E466;
	Tue,  7 Apr 2026 15:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AU3h7oS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A38910E474;
 Tue,  7 Apr 2026 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775577072; x=1807113072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yJL1PCls1LlmUu4UbR4ufYJFRDM0D7RuyJwbD5uRpRU=;
 b=AU3h7oS6JHS0b3wGa/+jXgyKRK3/6opBYMraCOz1GpS89SQW2YFAXBgr
 P2KfXuR74HMytyAcBTDHw7/NAzrsq8HppqgSterKuUkW/FXKF+wAqhb5u
 n1kiToGtAaEoz/30zbIgedZ4D+P++5L6R6txFwM21Pr0id+3+V3WCnZbR
 zDD2DMEXxBY8A4139pNYmS1xuO5BNtUkhYrDcsLBiHygbeYIeJ+KLLAX4
 vppY8rjX6TqTHJOLUiBeCNsb+vgwxUrSwb/40tWdJd9dXUYmF2puv4mi9
 F9N/mqV6MREN1m4B/Z+66eWYaEayBUur9OoE/Mn4nI81kne94WAS8MshO Q==;
X-CSE-ConnectionGUID: j97cW9NHQiKQw2lb4bNO6A==
X-CSE-MsgGUID: aDFxuBiwTOG7UdXCyKZXbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="101999113"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="101999113"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 08:51:11 -0700
X-CSE-ConnectionGUID: ZgimdmIaSbGNc8Y+VmP4ew==
X-CSE-MsgGUID: WHL9t56rSvK75jxAg1CIMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="221633756"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 08:51:10 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/12] drm/xe/fb: Use the correct gtt view for remapped FBs
Date: Tue,  7 Apr 2026 18:50:45 +0300
Message-ID: <20260407155053.32156-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use the proper gtt view from the plane state rather than always
assuming that it came directly from the FB. This is in the DPT
codepath so the view should currently always come from the FB,
but in the future we may also want per-plane remapping with DPT.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index e45a1e7a4670..35e5c322f8b0 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -154,7 +154,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 	if (view->type == I915_GTT_VIEW_NORMAL)
 		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
 	else if (view->type == I915_GTT_VIEW_REMAPPED)
-		dpt_size = ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
+		dpt_size = ALIGN(intel_remapped_info_size(&view->remapped) * 8,
 				 XE_PAGE_SIZE);
 	else
 		/* display uses 4K tiles instead of bytes here, convert to entries.. */
-- 
2.52.0

