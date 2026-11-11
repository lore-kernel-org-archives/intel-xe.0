Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A80606A321
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PRRVpcZP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9F610FB47;
	Wed, 11 Nov 2026 11:21:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2E910FB47;
 Wed, 11 Nov 2026 11:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794396057; x=1825932057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QLJiMyDPB7JJmajaNPWj92TIZ/C4jyi7PlFKCI34bPA=;
 b=PRRVpcZPIx/V7YjQF5ufW1v/bbdjHSxIDXtT9LUb4ldyMsMZhiOip39I
 FceDO91xajrAa5+XqWOGdjxpmnge+M3DOYZ7efZfHh6JCekrFhP4GSx4b
 HXX3vH30H2IrX9lkMxfMVWfO4Jhzy2RGml+3+c1t+uKFO/rkFN3QkdNEI
 cD+DDyHhoQNcrR/PRYa78AJdwz4jS7ppGasdonROa09BFaE1q6cV3/1qR
 OMRBkVY039vQ1/bwQ0oEln+CDjehlhgHAya/2cEHPgoiWGIOpoUJtGaEX
 k2no0+WUWZPbj4MJDvLz7V3MLt8ZERDT61hWxsMEPuVNSvGbtMCE3PMEa A==;
X-CSE-ConnectionGUID: KLrL1eAUS7eWiTuL0QdtFw==
X-CSE-MsgGUID: 5JRDaKJ+R7mN5Ug/FOBKgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3195916"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3195916"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:56 -0800
X-CSE-ConnectionGUID: MesVHJXJSf6bBE55FDeCHw==
X-CSE-MsgGUID: hGxGQsKOTkmFDWBArd66tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8287816"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:56 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 12/13] drm/i915/dpt: Remove dpt->vma
Date: Wed, 11 Nov 2026 13:20:06 +0200
Message-ID: <20261111112007.16790-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
References: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We don't actually have to keep the vma pointer around in the
dpt. It'll anyway be available in the caller (the fb unpin
code) so just get it from there instead of keeping it around.
This also makes the code a bit more uniform with the ggtt
counterpart.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_dpt.c    | 8 +++-----
 drivers/gpu/drm/i915/i915_dpt.h    | 2 +-
 drivers/gpu/drm/i915/i915_fb_pin.c | 4 ++--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_dpt.c b/drivers/gpu/drm/i915/i915_dpt.c
index 53cb07144552..4957e172340e 100644
--- a/drivers/gpu/drm/i915/i915_dpt.c
+++ b/drivers/gpu/drm/i915/i915_dpt.c
@@ -17,7 +17,6 @@ struct intel_dpt {
 	struct i915_address_space vm;
 
 	struct drm_i915_gem_object *obj;
-	struct i915_vma *vma;
 	void __iomem *iomem;
 	struct intel_gtt_view view;
 	struct list_head obj_link;
@@ -159,7 +158,6 @@ struct i915_vma *i915_dpt_pin_to_ggtt(struct intel_dpt *dpt, unsigned int alignm
 			continue;
 		}
 
-		dpt->vma = vma;
 		dpt->iomem = iomem;
 
 		i915_vma_get(vma);
@@ -172,10 +170,10 @@ struct i915_vma *i915_dpt_pin_to_ggtt(struct intel_dpt *dpt, unsigned int alignm
 	return err ? ERR_PTR(err) : vma;
 }
 
-void i915_dpt_unpin_from_ggtt(struct intel_dpt *dpt)
+void i915_dpt_unpin_from_ggtt(struct i915_vma *vma)
 {
-	i915_vma_unpin_iomap(dpt->vma);
-	i915_vma_put(dpt->vma);
+	i915_vma_unpin_iomap(vma);
+	i915_vma_put(vma);
 }
 
 static void i915_dpt_get(struct intel_dpt *dpt)
diff --git a/drivers/gpu/drm/i915/i915_dpt.h b/drivers/gpu/drm/i915/i915_dpt.h
index 3f05311a7e73..5fdd9923ca74 100644
--- a/drivers/gpu/drm/i915/i915_dpt.h
+++ b/drivers/gpu/drm/i915/i915_dpt.h
@@ -22,7 +22,7 @@ struct intel_dpt *i915_dpt_instance(struct drm_i915_gem_object *obj,
 
 struct i915_address_space *i915_dpt_to_vm(struct intel_dpt *dpt);
 struct i915_vma *i915_dpt_pin_to_ggtt(struct intel_dpt *dpt, unsigned int alignment);
-void i915_dpt_unpin_from_ggtt(struct intel_dpt *dpt);
+void i915_dpt_unpin_from_ggtt(struct i915_vma *vma);
 u64 i915_dpt_offset(struct i915_vma *dpt_vma);
 
 void i915_dpt_suspend(struct i915_ggtt *ggtt);
diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i915_fb_pin.c
index 831baf0c6898..81f5b0c4618a 100644
--- a/drivers/gpu/drm/i915/i915_fb_pin.c
+++ b/drivers/gpu/drm/i915/i915_fb_pin.c
@@ -269,7 +269,7 @@ static int i915_fb_pin_dpt_pin(struct drm_gem_object *_obj,
 
 	dpt_vma = intel_fb_pin_to_dpt(obj, dpt, pin_params);
 	if (IS_ERR(dpt_vma)) {
-		i915_dpt_unpin_from_ggtt(dpt);
+		i915_dpt_unpin_from_ggtt(ggtt_vma);
 		return PTR_ERR(dpt_vma);
 	}
 
@@ -304,7 +304,7 @@ static void i915_fb_pin_dpt_unpin(struct drm_gem_object *_obj,
 	drm_WARN_ON(obj->base.dev, !dpt_vma->vm->is_dpt);
 
 	intel_fb_unpin_vma(dpt_vma, -1);
-	i915_dpt_unpin_from_ggtt(dpt);
+	i915_dpt_unpin_from_ggtt(ggtt_vma);
 }
 
 static void i915_fb_pin_get_map(struct i915_vma *vma, struct iosys_map *map)
-- 
2.56.0

