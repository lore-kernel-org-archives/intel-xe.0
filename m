Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35131C77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166B310E5AD;
	Fri,  5 May 2023 08:31:24 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CFD10E5AD
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683275481; x=1714811481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v24ytxQF1zBfoR0NJL03IdhCABntkHU5CdwZPyjcZlU=;
 b=NJbZ+Us1HfZRQ3espGi0MAjwOA99wMWkl60cc+B9kovocRSRLSpcY9Jn
 EU0InTVGwOkCGrzPC8kYv54n9p54al/mXGyrbMjw4t6l56raODo6Hw5eF
 KmKDVr9nAD4LMDD4YMdyOsCtdYBNcso88z+N2vM++/Q8ZkARYHubF931B
 Na86kuBOLaNVd7FNsfLkDyJP0OwpYUvObftf60rDGl5bUG/fvt2K3TsnY
 MMxcwilA+tMOlXHj8nL+peWpZ8RNi22LA1BpzTBdTEE8es9PZFc1ErR4H
 vf1FyB16jJpX3RXnVS37ZPS4xJ3Nv3ueYUCFqNCDz5fCqXupSuQvGG2Wk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328783326"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328783326"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943749653"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943749653"
Received: from pklosowski.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.36.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:19 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 11:29:52 +0300
Message-Id: <20230505082956.2247875-17-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505082956.2247875-1-jouni.hogander@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 16/20] drm/i915/display: Use
 drm_gem_object_get/put
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

Use drm_gem_object_ge/put directly instead of i915_gem_object_get/put.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index f44a36b3af3b..5eb46991185c 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -237,7 +237,8 @@ static void frontbuffer_release(struct kref *ref)
 
 	i915_active_fini(&front->write);
 
-	i915_gem_object_put(obj);
+	drm_gem_object_put(&intel_bo_to_drm_bo(obj));
+
 	kfree_rcu(front, rcu);
 }
 
@@ -269,7 +270,7 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 		front = rcu_dereference_protected(obj->frontbuffer, true);
 		kref_get(&front->ref);
 	} else {
-		i915_gem_object_get(obj);
+		drm_gem_object_get(&intel_bo_to_drm_bo(obj));
 		rcu_assign_pointer(obj->frontbuffer, front);
 	}
 	spin_unlock(&i915->display.fb_tracking.lock);
-- 
2.34.1

