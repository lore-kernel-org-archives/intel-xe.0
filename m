Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9258AD6ACF4
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 17:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F34110EB80;
	Wed, 27 Nov 2024 17:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ciey3fuS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F7C10EB73;
 Wed, 27 Nov 2024 17:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732727189; x=1764263189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I1c+RTQH8HHBlPmboS7NuyAeabjMooDgLheVmRula5M=;
 b=ciey3fuSADXdaGZprGMez3ncT4gB2CBHyGATOKmhPvapmDV9eQ21++II
 Sx/ocmL+08PyK/NBl+h6+x6F9ycBucEIQilcNtp7Xz/flzQVy+Xb6vN2r
 RWb7bzybX4jF0yne92DLYqB8egBF6XHHlQo3Rqc21BfLh+MBACzDEoE8B
 WYbU0KVtByfMx+DmsLG/4hlVl9BSQwhOXGF+S+EzcFyq/vMjXLUoMxjy8
 GCx8ol/gHAuAygdO5w8zJ5hAF18cyW+XhCksv0UmF2idB4kqEaXP0FrtT
 /k2+1ZZGW9LwkG0ljXj6AG+ytMVoKIDGyouw9pGMNwlq7WlJ39lOH7ZbY w==;
X-CSE-ConnectionGUID: lof4ZOqvQXOI66tCp/N4fg==
X-CSE-MsgGUID: sstmoycXRbOczgp/yzGqzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32994353"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="32994353"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 09:06:29 -0800
X-CSE-ConnectionGUID: AGeWSobgS9iSWTRc2pU6RA==
X-CSE-MsgGUID: 9NxzLGgXSpS8UvOUuJny9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="91621190"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.110])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 09:06:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	imre.deak@intel.com
Subject: [PATCH 3/7] drm/i915/display: convert for_each_power_domain_well() to
 struct intel_display
Date: Wed, 27 Nov 2024 19:06:04 +0200
Message-Id: <244f1c30eea6e5eb2804224b00e030331ef25987.1732727056.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1732727056.git.jani.nikula@intel.com>
References: <cover.1732727056.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Start converting display power domain code to struct
intel_display. Start off with for_each_power_domain_well() and the
reverse variant.

Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/i915/display/intel_display_power.c  | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 6f278964cdaf..c6252b2c40a4 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -28,12 +28,12 @@
 #include "skl_watermark_regs.h"
 #include "vlv_sideband.h"
 
-#define for_each_power_domain_well(__dev_priv, __power_well, __domain)	\
-	for_each_power_well(&(__dev_priv)->display, __power_well)	\
+#define for_each_power_domain_well(__display, __power_well, __domain)	\
+	for_each_power_well((__display), __power_well)			\
 		for_each_if(test_bit((__domain), (__power_well)->domains.bits))
 
-#define for_each_power_domain_well_reverse(__dev_priv, __power_well, __domain) \
-	for_each_power_well_reverse(&(__dev_priv)->display, __power_well) \
+#define for_each_power_domain_well_reverse(__display, __power_well, __domain) \
+	for_each_power_well_reverse((__display), __power_well) \
 		for_each_if(test_bit((__domain), (__power_well)->domains.bits))
 
 static const char *
@@ -201,6 +201,7 @@ intel_display_power_domain_str(enum intel_display_power_domain domain)
 static bool __intel_display_power_is_enabled(struct drm_i915_private *dev_priv,
 					     enum intel_display_power_domain domain)
 {
+	struct intel_display *display = &dev_priv->display;
 	struct i915_power_well *power_well;
 	bool is_enabled;
 
@@ -209,7 +210,7 @@ static bool __intel_display_power_is_enabled(struct drm_i915_private *dev_priv,
 
 	is_enabled = true;
 
-	for_each_power_domain_well_reverse(dev_priv, power_well, domain) {
+	for_each_power_domain_well_reverse(display, power_well, domain) {
 		if (intel_power_well_is_always_on(power_well))
 			continue;
 
@@ -486,13 +487,14 @@ static void
 __intel_display_power_get_domain(struct drm_i915_private *dev_priv,
 				 enum intel_display_power_domain domain)
 {
+	struct intel_display *display = &dev_priv->display;
 	struct i915_power_domains *power_domains = &dev_priv->display.power.domains;
 	struct i915_power_well *power_well;
 
 	if (intel_display_power_grab_async_put_ref(dev_priv, domain))
 		return;
 
-	for_each_power_domain_well(dev_priv, power_well, domain)
+	for_each_power_domain_well(display, power_well, domain)
 		intel_power_well_get(dev_priv, power_well);
 
 	power_domains->domain_use_count[domain]++;
@@ -570,6 +572,7 @@ static void
 __intel_display_power_put_domain(struct drm_i915_private *dev_priv,
 				 enum intel_display_power_domain domain)
 {
+	struct intel_display *display = &dev_priv->display;
 	struct i915_power_domains *power_domains;
 	struct i915_power_well *power_well;
 	const char *name = intel_display_power_domain_str(domain);
@@ -588,7 +591,7 @@ __intel_display_power_put_domain(struct drm_i915_private *dev_priv,
 
 	power_domains->domain_use_count[domain]--;
 
-	for_each_power_domain_well_reverse(dev_priv, power_well, domain)
+	for_each_power_domain_well_reverse(display, power_well, domain)
 		intel_power_well_put(dev_priv, power_well);
 }
 
-- 
2.39.5

