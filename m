Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D749CA0ECF
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 06:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B0A10E36D;
	Tue, 12 Sep 2023 06:47:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7655210E350
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 06:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694501244; x=1726037244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MA/f5KUmHmCRvVSx1pfe3ZbvGoF/ON3ECXYIfKP1ias=;
 b=SG82oE1qpkEPeHgaNwVq5B33yFHA8v4wlHHxsDsXMqMIbaVsWvbGHWVo
 CcE4UrdyuXcTJv0GVxX1yKznXellYtSkKE/dZBGv1yGTUaTgMR2oPtesO
 f31Hrwql11a9CboD9uzJpjjh2R8j0SMkAWCi4s9+FAmz91O36PSgPm7rj
 UKY+8FDkKE6yHqGG2X+xJRbl0CPIzyneMM14Dkd/XDObEtK3uVe1yYgzd
 9l+84QhxhVSA0ToG6FX0NIp3TmS3EvYV2PxiVOYDOvy0n7ds+Iw6AwAYL
 9mBMUt8zSnFpJ0aMckNIYwX0cYUQNzHlxuNZsVhGeIQCS6dof1Zic56oZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444730318"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="444730318"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813699006"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="813699006"
Received: from sptommas-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.216.207])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:22 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 09:46:58 +0300
Message-Id: <20230912064709.2802305-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912064709.2802305-1-jouni.hogander@intel.com>
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 01/12] drm/i915/display: Move releasing gem
 object away from fb tracking
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
from frontbuffer tacking code. Due to this mobe releasing gem object
reference to i915_gem_object_set_frontbuffer.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 2 --
 drivers/gpu/drm/i915/gem/i915_gem_object.h       | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 4f077b222b36..a9a8c75b8236 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -244,8 +244,6 @@ static void frontbuffer_release(struct kref *ref)
 
 #ifdef I915
 	i915_active_fini(&front->write);
-
-	i915_gem_object_put(obj);
 #endif
 	kfree_rcu(front, rcu);
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index f607b87890dd..525cb440cc15 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -943,6 +943,7 @@ i915_gem_object_set_frontbuffer(struct drm_i915_gem_object *obj,
 
 	if (!front) {
 		RCU_INIT_POINTER(obj->frontbuffer, NULL);
+		i915_gem_object_put(obj);
 	} else if (rcu_access_pointer(obj->frontbuffer)) {
 		cur = rcu_dereference_protected(obj->frontbuffer, true);
 		kref_get(&cur->ref);
-- 
2.34.1

