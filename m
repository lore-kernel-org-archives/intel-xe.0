Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C241DE7849A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 10:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FB510E278;
	Mon,  2 Oct 2023 10:11:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022EB10E278
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 10:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696241491; x=1727777491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O3qhRKexhliFoOD0TqdFN8gC3K7cvsrdkT6ZltXsC7o=;
 b=LEllJgJyiXEtIipv/REP+WPQTeEO3f7f9xLSihI+DCqS8rf2/yUdOiVY
 fWZOl4A08aaGJDk1ztKKG8QgrLp/rljVOwbSfSNdDO38gN8rdC78ByeGl
 uEPx2fm8aU8iigK2HJ0TgLO5LcKlPdzYOFvWHn14aDUldmCCBNtb7Yt//
 73QIDl6EYQzWR+nfAPSVR/MtTspy33W9oUy4p0vnjb5O7JR1Xsi5P62YD
 Cq/X/qN9lIvME3FstTcVlX9rSg05b8ZbV//g7XRI4cmbCk1IXW/rlmvNP
 TfJSk7sFSZIu67FjwxBVUFETPQ+2QHWp9Qni92DhQy9EzQYc/sPWzCfeI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="413526558"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="413526558"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 03:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="840940197"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="840940197"
Received: from apascali-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.221.122])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 03:11:29 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  2 Oct 2023 13:10:53 +0300
Message-Id: <20231002101055.3731291-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002101055.3731291-1-jouni.hogander@intel.com>
References: <20231002101055.3731291-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/3] Revert "FIXME: drm/i915: More display
 ugly wa needed after rebase"
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

This reverts commit 4bf10efdff69a34bfa55813593bfecbf6f5d6db9.

We have now emtpy define for i915_gem_object_flush_if_display about
to enable custom dirtyfb for Xe as well.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c          | 2 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 961fa778ba88..abca5a3652d4 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1939,7 +1939,6 @@ struct frontbuffer_fence_cb {
 	struct intel_frontbuffer *front;
 };
 
-#ifdef I915
 static void intel_user_framebuffer_fence_wake(struct dma_fence *dma,
 					      struct dma_fence_cb *data)
 {
@@ -1950,6 +1949,7 @@ static void intel_user_framebuffer_fence_wake(struct dma_fence *dma,
 	dma_fence_put(dma);
 }
 
+#ifdef I915
 static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 					struct drm_file *file,
 					unsigned int flags, unsigned int color,
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index b80cf8fb1c97..d64ce5bfeca8 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -209,9 +209,7 @@ static void intel_frontbuffer_flush_work(struct work_struct *work)
 	struct intel_frontbuffer *front =
 		container_of(work, struct intel_frontbuffer, flush_work);
 
-#ifdef I915
 	i915_gem_object_flush_if_display(front->obj);
-#endif
 	intel_frontbuffer_flush(front, ORIGIN_DIRTYFB);
 	intel_frontbuffer_put(front);
 }
-- 
2.34.1

