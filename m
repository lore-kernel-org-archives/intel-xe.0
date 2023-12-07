Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4281BC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 11:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B5F10E880;
	Thu,  7 Dec 2023 11:17:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD5F10E880
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 11:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701947845; x=1733483845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6aCLqde4dEbFS4qFsp25lbxvfK3cPmTOpW9TLltYztg=;
 b=jKNWLA8nxrw33ndNspdHQ+zJ+gAoZrtSjL/UAweru1jrkbZ4NTkdBFgE
 7tFByiHQ04lTNlk81f9kScyhHOV+/9EXUpSZgeMyA4sgFjXAItq8rw9mN
 zMBTpp1qOvz7vBDYrIpNbEOi+ciX7zRMs/RYm3dDdcEIHpYwaVXkfn1cb
 V2bMHGjMaKiR/GuEpNV+waJdByS2jZArDm8FxbDBXt2JktmDd92ioI5zT
 gYk+fdWrlNC7WjFf6YzxlNYFlL+vsAvgiYJEfl4iy+Nl6u+nELBTbpx6y
 rcXnQp16k8qruq0MwyvWzlpWu3CjuY8u493T4fN6+sZMqSLTR0ttU7LZ9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="460704529"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="460704529"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:17:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837685916"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="837685916"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:17:24 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/9] fixup! FIXME: drm/i915/display: Remaining changes to make
 xe compile
Date: Thu,  7 Dec 2023 13:16:58 +0200
Message-Id: <20231207111706.2293105-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207111706.2293105-1-jouni.hogander@intel.com>
References: <20231207111706.2293105-1-jouni.hogander@intel.com>
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

