Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A98EE6431
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 07:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25E910E5CD;
	Fri, 15 Sep 2023 07:49:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E906810E5C6
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694764145; x=1726300145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=va+OsQxgOaaorae0MVvTKk0m5MdNudmWUKhlQmdgo6M=;
 b=PH64+veqv66dPcZWYnki9JWjBfYJaf8B2FvjX6Q/8awVq8JAZ+rPp7lW
 hejsF1nQqC6Dti/s5trVaRBXmSla47V7PsvAOT1ke8DuFWAU2B7DPv0Bd
 r9A23Crs8WCsicIhevZOzFtwhqr2Y9BUK1ZEVlH6BX9+b9ij/5suIPliR
 cdps7xi+AlO6J+0Sp1WMXtFI6nEz5RwOq8FVSyIL6TjJ7m0AL4A/ny1RR
 EKFtujFTUkNiU6XVq9mts1kGSTwc4kZ103Fokrt7QC0SOiecs2Sq29u24
 4LI6y9MfP/M6fer2PYkJ5PlpbHZ3xnm7yjPuF4cjSWOlRquA4QY0X+JBH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369507572"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="369507572"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="1075711600"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="1075711600"
Received: from cohrs-mobl1.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.48.100])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:39 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 10:48:13 +0300
Message-Id: <20230915074818.903353-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915074818.903353-1-jouni.hogander@intel.com>
References: <20230915074818.903353-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/7] fixup! FIXME: drm/i915/display: Remaining
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
index f5a96b94cfba..8891ff14a446 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1930,7 +1930,6 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 	return drm_gem_handle_create(file, &obj->ttm.base, handle);
 }
 
-#ifdef I915
 static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 					struct drm_file *file,
 					unsigned int flags, unsigned int color,
@@ -1944,16 +1943,11 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 
 	return 0;
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

