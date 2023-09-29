Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C151E7F154
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 10:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B3010E114;
	Fri, 29 Sep 2023 10:51:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC9510E113
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 10:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695984671; x=1727520671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MhCsOF6CUZwsTewaJBNBFMKfU8TJy1VScs155M4V7Ks=;
 b=D4gcM4iE4R6N6uq2wkfKKiSnVOtm0dgKUumWEIincoghTAQnfZuy1zjt
 tLGk3x1PEiUSSnKyLRDvS7kcCZpuPTfRI4F5mh4z0YOtJa5bHWCC0XwXq
 m1xk3C9B2h+C6YPqDjvWOEfjDpLetGrTgnoHG/4XZBLSjc0HKCbEOgr5B
 pvDLF6gaVvzqPARZLeyyp4UMp1WJDgk8ak3JvuoBOz/eMyqaMCgeGScoR
 kGIawD/XXJ5OFlkL1ymyC736EXClH9EFPH1UK77QiMqxCnZktcRs3Ndan
 mGa8TYSQ9g0W7AhQuv+JVrQq3z+I5RYaKv3aUwt4rzq7vIzQnUZzzNZrX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="386138628"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="386138628"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 03:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="699609196"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="699609196"
Received: from hkatter-mobl2.amr.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.33.4])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 03:51:08 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 13:50:30 +0300
Message-Id: <20230929105030.1132290-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929105030.1132290-1-jouni.hogander@intel.com>
References: <20230929105030.1132290-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/i915: Warn on if set frontbuffer return
 value is not NULL on release
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

i915_gem_object_set_frontbuffer returns set frontbuffer pointer.  When we
are releasing frontbuffer we are clearing the pointer from the object. Warn
on if return value is not null.

v3: Check i915_gem_object_set_frontbuffer return value separately
v2: Instead of ignoring do drm_WARN_ON

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230928082924.164720-1-jouni.hogander@intel.com
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 21fb5660d977..09c0906c7e74 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -225,7 +225,7 @@ static void frontbuffer_retire(struct i915_active *ref)
 static void frontbuffer_release(struct kref *ref)
 	__releases(&intel_bo_to_i915(front->obj)->display.fb_tracking.lock)
 {
-	struct intel_frontbuffer *front =
+	struct intel_frontbuffer *ret, *front =
 		container_of(ref, typeof(*front), ref);
 	struct drm_i915_gem_object *obj = front->obj;
 
@@ -233,7 +233,8 @@ static void frontbuffer_release(struct kref *ref)
 
 	i915_ggtt_clear_scanout(obj);
 
-	i915_gem_object_set_frontbuffer(obj, NULL);
+	ret = i915_gem_object_set_frontbuffer(obj, NULL);
+	drm_WARN_ON(&intel_bo_to_i915(obj)->drm, ret);
 	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);
 
 	i915_active_fini(&front->write);
-- 
2.34.1

