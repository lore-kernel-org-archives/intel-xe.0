Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ECCCAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 16:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D3310E24F;
	Wed, 24 Sep 2025 16:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4GSW27P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B65910E77C;
 Wed, 24 Sep 2025 16:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758732266; x=1790268266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T/SMdfLsTLCwjDuaD5RizbYIkvKe6sgRTjlMI5aHmv8=;
 b=l4GSW27PS4B48DTfd5NlBX6OFFCXaprmvvqHGsCqWaIEArjfXF2SGF2X
 mERiIR7Oxw/Mnh7/DFhJwvMQ6G8MNU3WHGNFJRJF7a9sddNmT4BmpO3LD
 n/cFZJGSAqruDeZxFeTlLJiGb3mz4aPZJGptGLSnaZvQwokZJCDCdyFkO
 /r4mdikn8B5RDOwZQrV0o4kCu6jzaTrPrrd3TCpKVRv6LJ+s0j+m3WiWY
 39iuqFMEkIHiGukWpIemaML0WDVlcYpISlY7xf+7ivhqK/R40mLrwa8Ra
 +r3JztmF9qWsdRknTF3WsPjiR35iVHIgKCG8+GWiN0kelILZTGFJxI9F8 w==;
X-CSE-ConnectionGUID: R4tG9g32Q7St6fx4Csj0fg==
X-CSE-MsgGUID: g0D0xcbsQGi4OCjMaNUYXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64676875"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="64676875"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 09:44:25 -0700
X-CSE-ConnectionGUID: ROU81QHnSaqdtoOmVkL+Og==
X-CSE-MsgGUID: FuZhS3ClQWuO16gFWTvw7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="208009280"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 09:44:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH 08/11] drm/{i915,
 xe}/stolen: add device pointer to struct intel_stolen_node
Date: Wed, 24 Sep 2025 19:43:37 +0300
Message-ID: <321354d47f9e530159caefef510d5394f4177470.1758732183.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1758732183.git.jani.nikula@intel.com>
References: <cover.1758732183.git.jani.nikula@intel.com>
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

Add backpointers to i915/xe to allow simplifying some interfaces in
follow-up.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 4 ++++
 drivers/gpu/drm/xe/display/xe_stolen.c     | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 5991ccd3f328..8bc71fb2a765 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -25,6 +25,7 @@
 #include "intel_pci_config.h"
 
 struct intel_stolen_node {
+	struct drm_i915_private *i915;
 	struct drm_mm_node node;
 };
 
@@ -1064,12 +1065,15 @@ u64 i915_gem_stolen_node_size(const struct intel_stolen_node *node)
 
 struct intel_stolen_node *i915_gem_stolen_node_alloc(struct drm_device *drm)
 {
+	struct drm_i915_private *i915 = to_i915(drm);
 	struct intel_stolen_node *node;
 
 	node = kzalloc(sizeof(*node), GFP_KERNEL);
 	if (!node)
 		return NULL;
 
+	node->i915 = i915;
+
 	return node;
 }
 
diff --git a/drivers/gpu/drm/xe/display/xe_stolen.c b/drivers/gpu/drm/xe/display/xe_stolen.c
index b218df40324a..eea182b569a1 100644
--- a/drivers/gpu/drm/xe/display/xe_stolen.c
+++ b/drivers/gpu/drm/xe/display/xe_stolen.c
@@ -7,6 +7,7 @@
 #include "xe_validation.h"
 
 struct intel_stolen_node {
+	struct xe_device *xe;
 	struct xe_bo *bo;
 };
 
@@ -104,12 +105,15 @@ u64 i915_gem_stolen_node_size(const struct intel_stolen_node *node)
 
 struct intel_stolen_node *i915_gem_stolen_node_alloc(struct drm_device *drm)
 {
+	struct xe_device *xe = to_xe_device(drm);
 	struct intel_stolen_node *node;
 
 	node = kzalloc(sizeof(*node), GFP_KERNEL);
 	if (!node)
 		return NULL;
 
+	node->xe = xe;
+
 	return node;
 }
 
-- 
2.47.3

