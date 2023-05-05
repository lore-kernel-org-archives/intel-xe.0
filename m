Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0F5C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E22610E5A7;
	Fri,  5 May 2023 08:31:51 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4677510E5A6
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683275507; x=1714811507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U7cknOriXli7spi36y8vToMIxqFeCqNDP9/hK+ezxLo=;
 b=mczoW6wfZn/iS6RTpp2Z3iC1E4avAolxHDE/fp1p5Mg4vx4dxT8AqbTc
 xALPtYHRZ8aGNtatPUD4AxWfUhbydDGmDucbqDvx2VE+fHGNwpQslA73f
 Uu6hpZYIoFJawLakgPVeTua1jOi513g7HnLEJNZUoOHcSeFchMxQN7mRz
 swJ1Hz2oEGo246sVLBwA1UlaU9MnjkWfF9rhOnogbD4vsYzo6KHcjFzHF
 jcqTQZEfKOuX/qWLRbOWOkO/o6vJdfAAJb42eyBdKMo7lAqWoKFzgmlT2
 1g7iD3tNpQT0vs13ZhFEG9wKchzXDXs4ZwIQFoi7zqv+Idw0VMefPB0PU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328783350"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328783350"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943749718"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943749718"
Received: from pklosowski.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.36.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:30 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 11:29:56 +0300
Message-Id: <20230505082956.2247875-21-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505082956.2247875-1-jouni.hogander@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 20/20] drm/xe/display: Use custom dirtyfb for
 Xe as well
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
Cc: jani.nikula@intel.com,
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

