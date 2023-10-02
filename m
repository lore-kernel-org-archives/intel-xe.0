Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861FFE784AF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 10:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C59410E279;
	Mon,  2 Oct 2023 10:11:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CC510E27B
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 10:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696241497; x=1727777497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Z055bXZDQLuHrg3AhOVmAnh//YNmZwHee1fuIeBj0E=;
 b=I0E5Seu8Wa/jsKpie+V/HjL8C+NaS2t8X6U3hJqfYaWtIHD6+WdUbQ76
 myL8IKMMfPq8WgQD1YyAGqi9YrQ+rSe3xe8Sj1z9sa2gN1wMXEGVaFMoX
 ly1SqSfa5orZz+efzx80GJc4ThBu4D1aLnK74lP87oA/NdAT0Htno1Rrh
 QM8McLtr5ozcygcRV2gnUTxyjiei38CLxVsAGy7NmSUfmJ/k91KAz4uQ4
 XhsetKlIHV9tFNZlmtRNsFXcYFvmgh+KMbnh2k5mCqG/Iw/N0a74EUZUK
 55+NZ2/lj16aPDI48u4hpi/HoSUK5dF37qDBoJD5AlE+l5In150evz05B w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="413526583"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="413526583"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 03:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="840940246"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="840940246"
Received: from apascali-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.221.122])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 03:11:35 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  2 Oct 2023 13:10:55 +0300
Message-Id: <20231002101055.3731291-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002101055.3731291-1-jouni.hogander@intel.com>
References: <20231002101055.3731291-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/3] fixup! FIXME: drm/i915/display: Remaining
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

