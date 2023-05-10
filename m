Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C58C77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E788D10E486;
	Wed, 10 May 2023 12:13:20 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D36510E486
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720799; x=1715256799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U7cknOriXli7spi36y8vToMIxqFeCqNDP9/hK+ezxLo=;
 b=WcOpjRKU9pdTlXJ8NtFfpNBeliQnR/+o5iSRQC0yd4G+q16IPulwL6Kq
 W0EhVoGmwJaVdyS/Yx1JYE08UuYqniPVDhnEEod6qyXtIDhnQB7FsWYTC
 Vhr8LX+FYfkg16ds/lnCNrjQdbF72QdB7Xq3T+3O+eAsRFUWZv+k2ptNu
 xy0YFmYcqXRYXg90AAbN0B049LExbamaHLVO3BCo0wsbgtnZD5M5cgssR
 hqrs/8zkHiW5LqLS7oi4NQ3vU286yh7nEv1POkdhnkvDL/Fu2hu2Npi9c
 qyQ1WB8if8xM0ORWiTpX0S1ob43AftEye1wufV00u9YEWhJhMVRWiOr4M g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268322"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268322"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:13:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906541"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906541"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:13:16 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:52 +0300
Message-Id: <20230510121152.736148-24-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 23/23] drm/xe/display: Use custom dirtyfb
 for Xe as well
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
Cc: jani.nikula@intel.com, rodrigo.vivi@kernel.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now as we have everything in place for Xe (dma fence aware dirtyfb
ioctl and frontbuffer tracking) we can switch to using our custom
dirtyfb for Xe as well.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index fc325f2299a4..79a6b0b0bd1f 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1890,7 +1890,6 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 	return drm_gem_handle_create(file, &obj->ttm.base, handle);
 }
 
-#ifdef I915
 struct frontbuffer_fence_cb {
 	struct dma_fence_cb base;
 	struct intel_frontbuffer *front;
@@ -1950,16 +1949,11 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 
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

