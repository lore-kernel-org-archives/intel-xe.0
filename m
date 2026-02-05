Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D62EC1EB2
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 14:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB54F10E8C7;
	Thu,  5 Feb 2026 14:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYGPPsrb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD8D10E8C8;
 Thu,  5 Feb 2026 14:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770300177; x=1801836177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M3S2UPRulMD/x8ogNAKuv+99ArmBGb8oNjorw//H3Mc=;
 b=mYGPPsrbgTZiGY7stY2RyB3bFx7PrVGl7WA09krmrUTYhnjDueo3ormo
 fVClBCMbqRDzBhls+YGuIrS8IeGglvSUru+IbwRj9Tqrox8Pk9HVdTPoO
 hyww9utLLE3anW6X0W37r03jKJOwJfB4COtIDWa51VyORSfpNyYRymRxX
 0kLOD0Ead0Vb/OrFEjksSUVmErTyyaLedfY8V55/WrxbTVnxDq3Titab/
 zAk3pdB8NbzFxqDeAn736jZ/o3kdN5tmZYJIsh1566SSCLtKGf7fUl/Fr
 z87JKewcH/K1m+xX14P8tDJl9lsl73SVw9Nn5bG52Os46n97byUTkvZ0+ g==;
X-CSE-ConnectionGUID: 5DXY24U4QIS/t3qC5uCgNg==
X-CSE-MsgGUID: TlFdjy6PRMGYncAmW0jVNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75350971"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="75350971"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:02:57 -0800
X-CSE-ConnectionGUID: A8P8o0TMSSWEKQ6QYmUOuw==
X-CSE-MsgGUID: 3DnqYbqbTQGRYx08oCGgJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215508851"
Received: from abityuts-desk.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.157])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:02:56 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 uma.shankar@intel.com
Subject: [PATCH 2/6] drm/i915/display: remove the usage of dev_priv
Date: Thu,  5 Feb 2026 16:02:31 +0200
Message-ID: <20260205140235.338410-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205140235.338410-1-vinod.govindapillai@intel.com>
References: <20260205140235.338410-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove the remaining usage of dev_priv in intel_fbdev_fb.c
and use i915 instead.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
index c3202ba141c5..e5251ed15948 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
@@ -19,12 +19,12 @@ u32 intel_fbdev_fb_pitch_align(u32 stride)
 
 struct drm_gem_object *intel_fbdev_fb_bo_create(struct drm_device *drm, int size)
 {
-	struct drm_i915_private *dev_priv = to_i915(drm);
+	struct drm_i915_private *i915 = to_i915(drm);
 	struct drm_i915_gem_object *obj;
 
 	obj = ERR_PTR(-ENODEV);
-	if (HAS_LMEM(dev_priv)) {
-		obj = i915_gem_object_create_lmem(dev_priv, size,
+	if (HAS_LMEM(i915)) {
+		obj = i915_gem_object_create_lmem(i915, size,
 						  I915_BO_ALLOC_CONTIGUOUS |
 						  I915_BO_ALLOC_USER);
 	} else {
@@ -35,10 +35,10 @@ struct drm_gem_object *intel_fbdev_fb_bo_create(struct drm_device *drm, int size
 		 *
 		 * Also skip stolen on MTL as Wa_22018444074 mitigation.
 		 */
-		if (!IS_METEORLAKE(dev_priv) && size * 2 < dev_priv->dsm.usable_size)
-			obj = i915_gem_object_create_stolen(dev_priv, size);
+		if (!IS_METEORLAKE(i915) && size * 2 < i915->dsm.usable_size)
+			obj = i915_gem_object_create_stolen(i915, size);
 		if (IS_ERR(obj))
-			obj = i915_gem_object_create_shmem(dev_priv, size);
+			obj = i915_gem_object_create_shmem(i915, size);
 	}
 
 	if (IS_ERR(obj)) {
-- 
2.43.0

