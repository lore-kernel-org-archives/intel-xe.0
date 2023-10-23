Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABF4CDB474
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 06:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852B610E150;
	Mon, 23 Oct 2023 06:34:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE8D10E14F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 06:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698042889; x=1729578889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/pjH4msC+Fcafx1eH8BHgDGGCK/r/enbErzFGNWm3aU=;
 b=RYnSeNNIgY5k2wnE38h2X7HH/ivD4gnks9Bqz91IpBf7Pl36XGwsHIUH
 jn18vgvF5IpUyV5G/E6GOY1anuzHQwUV3MM0ritLgjUFWsMzZWvuYHjTT
 pI19br/JVKnhAcf1m2ecGhJnmqFGY6i9K8/ScpE51EfezPE89Dx6EMGCz
 XoxUlpw550rhZLNZ+wHR+xJQhhoAWmdDsiIIpf7cPbklcv8GSKolOPybZ
 QdVUpuFFv39CZzAoffrME4QKL6OgPYqfF7tCWoJjIwsnwaK2PCOW9w0a0
 VEgEAZuOy9ql2inUh2S/XjR0AJayMBfDXAwe7hjpUimJjdx9mrsCYONhH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="472990967"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="472990967"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2023 23:34:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="901704661"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="901704661"
Received: from spalanis-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.62.239])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2023 23:32:30 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 23 Oct 2023 09:34:19 +0300
Message-Id: <20231023063420.3298731-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023063420.3298731-1-jouni.hogander@intel.com>
References: <20231023063420.3298731-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/i915/display: Move releasing gem object
 away from fb tracking
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

As a preparation for Xe we want to remove all i915_gem_object details away
from frontbuffer tacking code. Due to this move releasing gem object
reference to i915_gem_object_set_frontbuffer.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231012072158.4115795-2-jouni.hogander@intel.com
(cherry picked from commit 501069dad5214fafe1b8ba38fa26a5d07df784c3)
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c       | 2 --
 drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 3e77dac6bebe..d64ce5bfeca8 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -264,8 +264,6 @@ static void frontbuffer_release(struct kref *ref)
 	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);
 
 	i915_active_fini(&front->write);
-
-	i915_gem_object_put(obj);
 	kfree_rcu(front, rcu);
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h b/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
index e5e870b6f186..9fbf14867a2a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
@@ -89,6 +89,7 @@ i915_gem_object_set_frontbuffer(struct drm_i915_gem_object *obj,
 
 	if (!front) {
 		RCU_INIT_POINTER(obj->frontbuffer, NULL);
+		drm_gem_object_put(intel_bo_to_drm_bo(obj));
 	} else if (rcu_access_pointer(obj->frontbuffer)) {
 		cur = rcu_dereference_protected(obj->frontbuffer, true);
 		kref_get(&cur->ref);
-- 
2.34.1

