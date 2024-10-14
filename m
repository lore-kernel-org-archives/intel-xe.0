Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE3CD16242
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 11:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772C410E432;
	Mon, 14 Oct 2024 11:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DafJTKEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5C910E432
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 11:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728904440; x=1760440440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EHGmdOmf4sMgC7OTdRLNHeBTRsmBIPObEuaWU3d/lFU=;
 b=DafJTKEWQugcsvytlg/UWpuaNszdXzKqVUGICs4mmGHNqS0vw6X320AE
 +wbx1ITW9x+bbsfr3IFNkRcAPSKb59C9WHVG0H3Iayq59d/rObS9jV9OH
 p8wSpP78F7uo3gYOqF4Ift5hOnDNAN3v9K/RdA8KT2HZo/X+ZvDJn/dh1
 Y3wbYnrhlwAYtoiyxI5T52W9/Z9hCQzGhY9gjJjA93y6k0L2gQUpBU/1P
 IQP4K856z5GfzEmEljQNOMpbna8zCEgZE6mTOBoaD2ZXiFheym/Hh9Q2k
 1+Kh7h4Hs5TPEXj0j1PB5BBvrZ1BXUgDdNSJGCIUKQNqAFYMGuZpJRjUM g==;
X-CSE-ConnectionGUID: HqoKCFsfT0qUYcQTQbCNpw==
X-CSE-MsgGUID: web+N8niQHifnmccjImETg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="53667974"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="53667974"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 04:13:59 -0700
X-CSE-ConnectionGUID: 7d+bWyXqR0KhAN8F5Hdz6Q==
X-CSE-MsgGUID: 04lqMeZgSEOhlJTVjuh3XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77192733"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa007.fm.intel.com with ESMTP; 14 Oct 2024 04:13:58 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH v2 1/5] drm: Introduce sharpness strength property
Date: Mon, 14 Oct 2024 16:44:38 +0530
Message-Id: <20241014111442.95530-2-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241014111442.95530-1-nemesa.garg@intel.com>
References: <20241014111442.95530-1-nemesa.garg@intel.com>
MIME-Version: 1.0
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

Introduces the new crtc property "SHARPNESS_STRENGTH" that allows
the user to set the intensity so as to get the sharpness effect.
The value of this property can be set from 0-255.
It is useful in scenario when the output is blurry and user
want to sharpen the pixels. User can increase/decrease the
sharpness level depending on the content displayed.

v2: Rename crtc property variable [Arun]
    Add modeset detail in uapi doc[Uma]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_crtc.c        | 35 +++++++++++++++++++++++++++++++
 include/drm/drm_crtc.h            | 17 +++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7936c2023955..515ddc472f41 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -417,6 +417,8 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
 	} else if (property == crtc->scaling_filter_property) {
 		state->scaling_filter = val;
+	} else if (property == crtc->sharpness_strength_property) {
+		state->sharpness_strength = val;
 	} else if (crtc->funcs->atomic_set_property) {
 		return crtc->funcs->atomic_set_property(crtc, state, property, val);
 	} else {
@@ -454,6 +456,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = 0;
 	else if (property == crtc->scaling_filter_property)
 		*val = state->scaling_filter;
+	else if (property == crtc->sharpness_strength_property)
+		*val = state->sharpness_strength;
 	else if (crtc->funcs->atomic_get_property)
 		return crtc->funcs->atomic_get_property(crtc, state, property, val);
 	else {
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 3488ff067c69..c4a267fa3402 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -229,6 +229,25 @@ struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc)
  * 		Driver's default scaling filter
  * 	Nearest Neighbor:
  * 		Nearest Neighbor scaling filter
+ * SHARPNESS_STRENGTH:
+ *	Atomic property for setting the sharpness strength/intensity by userspace.
+ *
+ *	The value of this property is set as an integer value ranging
+ *	from 0 - 255 where:
+ *
+ *	0 means feature is disabled.
+ *
+ *	1 means minimum sharpness.
+ *
+ *	255 means maximum sharpness.
+ *
+ *	User can gradually increase or decrease the sharpness level and can
+ *	set the optimum value depending on content and this value will be
+ *	passed to kernel through the Uapi.
+ *	The setting of this property does not require modeset.
+ *	The sharpness effect takes place post blending on the final composed output.
+ *	If the feature is disabled, the content remains same without any sharpening effect
+ *	and when this feature is applied, it enhances the clarity of the content.
  */
 
 __printf(6, 0)
@@ -939,3 +958,19 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 	return 0;
 }
 EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
+
+int drm_crtc_create_sharpness_strength_property(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_property *prop =
+		drm_property_create_range(dev, 0, "SHARPNESS_STRENGTH", 0, 255);
+
+	if (!prop)
+		return -ENOMEM;
+
+	crtc->sharpness_strength_property = prop;
+	drm_object_attach_property(&crtc->base, prop, 0);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_create_sharpness_strength_property);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8b48a1974da3..37a879350b4e 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -317,6 +317,16 @@ struct drm_crtc_state {
 	 */
 	enum drm_scaling_filter scaling_filter;
 
+	/**
+	 * @sharpness_strength
+	 *
+	 * Used by the user to set the sharpness intensity.
+	 * The value ranges from 0-255.
+	 * Any value greater than 0 means enabling the featuring
+	 * along with setting the value for sharpness.
+	 */
+	u8 sharpness_strength;
+
 	/**
 	 * @event:
 	 *
@@ -1088,6 +1098,12 @@ struct drm_crtc {
 	 */
 	struct drm_property *scaling_filter_property;
 
+	/**
+	 * @sharpness_strength_prop: property to apply
+	 * the intensity of the sharpness requested.
+	 */
+	struct drm_property *sharpness_strength_property;
+
 	/**
 	 * @state:
 	 *
@@ -1324,4 +1340,5 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
 
+int drm_crtc_create_sharpness_strength_property(struct drm_crtc *crtc);
 #endif /* __DRM_CRTC_H__ */
-- 
2.25.1

