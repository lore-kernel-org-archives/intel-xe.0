Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A634CDB474
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 06:34:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1666B10E14E;
	Mon, 23 Oct 2023 06:34:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8562F10E05B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 06:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698042887; x=1729578887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r2fNCBrsO+vrG1PH2abklrBnKV4RVpPqj2EgjrDlW20=;
 b=PlXX0mul0ulwuCWfR2OVomPytS8WkZMur+xFqrsVCgVGSb54mJTNDzt3
 j/HXkL+zolsLe8I07XRd0GiH3BAEw1ofzVNLISSth8pt8k89aXU0j5s32
 EXuJ1qsmn+hlnMrN7OYjATXAnDGiEEjZBlr1tjI2/Vin3PvXVwcE5eGXY
 FuQPNtFnMinIswpON6uucF2pJ3r59VfbsNbxnBsEUUXRm3rsOzcuRVG50
 veKErY9TiNGFIElhpyjeYkCnBu5hNDoMk6h2EVNUHgI0z/UbKjb/z7BB1
 gHpnvAyqoTr7Hzf33Vt4WpiuuEpf4KLGVA6JIwkRcgmkHYe9GNtyTvAjz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="472990965"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="472990965"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2023 23:34:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="901704646"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="901704646"
Received: from spalanis-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.62.239])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2023 23:32:28 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 23 Oct 2023 09:34:18 +0300
Message-Id: <20231023063420.3298731-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023063420.3298731-1-jouni.hogander@intel.com>
References: <20231023063420.3298731-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] Revert "drm/i915/display: Move releasing gem
 object away from fb tracking"
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

This reverts commit 86e3f63f9f1e9bbc3290955c316b17103ef5113e.

We are about to backport same patch from upstream.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c       | 2 ++
 drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index d64ce5bfeca8..3e77dac6bebe 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -264,6 +264,8 @@ static void frontbuffer_release(struct kref *ref)
 	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);
 
 	i915_active_fini(&front->write);
+
+	i915_gem_object_put(obj);
 	kfree_rcu(front, rcu);
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h b/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
index 9fbf14867a2a..e5e870b6f186 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
@@ -89,7 +89,6 @@ i915_gem_object_set_frontbuffer(struct drm_i915_gem_object *obj,
 
 	if (!front) {
 		RCU_INIT_POINTER(obj->frontbuffer, NULL);
-		drm_gem_object_put(intel_bo_to_drm_bo(obj));
 	} else if (rcu_access_pointer(obj->frontbuffer)) {
 		cur = rcu_dereference_protected(obj->frontbuffer, true);
 		kref_get(&cur->ref);
-- 
2.34.1

