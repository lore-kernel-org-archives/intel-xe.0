Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FD7E784AF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 09:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18C110E26F;
	Mon,  2 Oct 2023 09:16:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81ABA10E26F
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 09:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696238165; x=1727774165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Z055bXZDQLuHrg3AhOVmAnh//YNmZwHee1fuIeBj0E=;
 b=ZemlvOA8EjNlNgZwngY6T3AFN1TojwdLLcNzlXplVgF/90t9KSMlYYt+
 dCJY5DM7/H5QsxeIeUuVUoH6BoWzmL/J2lVJ8ASSET7+9R4bDoK8yQckK
 qQNKtAhbq9u3JAu5giGOOedRq94+f18psxRHItcTeKNr0Jcu6OujKRqbL
 HbeEjlycbJg8iXTdnOyKu6MV+AwzRgK4j0+LXsYh7t2GkCZHsHzKeD7s4
 TzJ60IlKdhOVI54g4NTU2/QVffA6artO/32FlloPZltPpNTJeouy/dWgX
 KIrHxz9rfyYNaBlf5WJcG5QK8XTr51e6QKq87caveMMplio8/l0/Gp43U Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="361985410"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="361985410"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 02:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="997570401"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="997570401"
Received: from apascali-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.221.122])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 02:16:03 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  2 Oct 2023 12:15:42 +0300
Message-Id: <20231002091542.3696656-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002091542.3696656-1-jouni.hogander@intel.com>
References: <20231002091542.3696656-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/4] fixup! FIXME: drm/i915/display: Remaining
 changes to make xe compile
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

Generic dirtyfb implementation which Xe is currently using is doing atomic
commit which is inefficient. We have now dma fence handling in our dirtyfb
implementation. This works with Xe and CPU/GPU frontbuffer rendering as
long as sync objects are imported by userspace
(dma_buf_import_sync_file). Switch to our custom dirtyfb implementation.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 6aa1a6ac0728..fd0b978dbef9 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1949,7 +1949,6 @@ static void intel_user_framebuffer_fence_wake(struct dma_fence *dma,
 	dma_fence_put(dma);
 }
 
-#ifdef I915
 static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 					struct drm_file *file,
 					unsigned int flags, unsigned int color,
@@ -1999,16 +1998,11 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 	intel_frontbuffer_flush(front, ORIGIN_DIRTYFB);
 	return ret;
 }
-#endif
 
 static const struct drm_framebuffer_funcs intel_fb_funcs = {
 	.destroy = intel_user_framebuffer_destroy,
 	.create_handle = intel_user_framebuffer_create_handle,
-#ifdef I915
 	.dirty = intel_user_framebuffer_dirty,
-#else
-	.dirty = drm_atomic_helper_dirtyfb,
-#endif
 };
 
 int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
-- 
2.34.1

