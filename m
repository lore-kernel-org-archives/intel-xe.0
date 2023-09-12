Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE55CA0ECE
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 06:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5540C10E35C;
	Tue, 12 Sep 2023 06:47:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19A210E35C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 06:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694501245; x=1726037245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lslEiXZj+OcdRWVhR/yoiO6KotIHOfGUDRTh6UIFQxg=;
 b=eIvngKWk7bnGMSE0TKv69iBgREsmr+qouEsMiekHWybEEcg2CW2bAw9n
 a1ugwcnIiC5PpcwSiHqLI2PnSnkmzFxXQfdoYFeVmD+E2vbwBv10Tl6PQ
 ItZUQo8l2LQ10lld2OChMKziK0k7GgLDQGj6u8r6R5VpyAei90TLTEWHz
 J8aHKqGDlxpK8msOlh+Xn1UAVl1Ts5jYml9mG83WyvBngZ1j5hjHvZ1oT
 c+W7Pd3RHi02mBE6QwMLifF3A50ruUNnvU+iZTVMMuidnOPB6fe+eGW3T
 YeUyjLqBhbzNUb3SlM13jKnV4mHbvctk5laals9FIS0kuFpkK4NOn/7dq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444730322"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="444730322"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813699012"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="813699012"
Received: from sptommas-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.216.207])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:24 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 09:46:59 +0300
Message-Id: <20230912064709.2802305-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912064709.2802305-1-jouni.hogander@intel.com>
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 02/12] drm/i915: Ignore set frontbuffer return
 value on release
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

i915_gem_object_set_frontbuffer returns set frontbuffer pointer.
When we are releasing frontbuffer we are clearing the pointer from
the object and the value can be ignored.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index a9a8c75b8236..629185e5a880 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -238,7 +238,7 @@ static void frontbuffer_release(struct kref *ref)
 #ifdef I915
 	i915_ggtt_clear_scanout(obj);
 
-	i915_gem_object_set_frontbuffer(obj, NULL);
+	(void) i915_gem_object_set_frontbuffer(obj, NULL);
 #endif
 	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);
 
-- 
2.34.1

