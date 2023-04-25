Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7038CC77B61
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 19:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC9210E5A3;
	Tue, 25 Apr 2023 19:26:42 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05D910E5A0
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 19:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682450798; x=1713986798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mv1LiMKA4dROlZXIXVEPjX/kOhci5VAqQ+5CzMx+K1c=;
 b=Bohs0xQCWWIG6ev7mANtDWrRVSXzQ21xabqqv839ubmyCDzbA8L3m0Su
 SWX3fB2UmDOktkOup4AxH0mZ31esAMrhlFOCeRQz6BNCnQPS0rKU9SfEk
 cPIJ6+aX04JngVL/Ta5DuwHltbX8xc8NjkASTw7oWpZrIO0T5CYoSA4Sg
 ULKRTxFTIYSE6EWa3YufDIN3y7liLbkIJ0Nlm+S+wTAdqIIRRNBvC86n/
 luFSSAyz9KWtQHHhNU/ArcL6uhO6WDProaHd8+erpaZ1FoWjcMEMTewlZ
 j5HyPJNtGxo+NHgxUHrCnnWXggpq1fexw5r0uVOCS0Qg65Uv3TtGl8Q8T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="331100801"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="331100801"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="782990464"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="782990464"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:33 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Apr 2023 12:26:13 -0700
Message-Id: <20230425192624.168640-5-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425192624.168640-1-jose.souza@intel.com>
References: <20230425192624.168640-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 04/15] drm/i915/display: rename
 intel_modeset_probe_defer() -> intel_display_driver_probe_defer()
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

Follow the usual naming conventions.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/ab5023570d8ae55c0d9c98c78f588e51c0790b6c.1681465222.git.jani.nikula@intel.com
(cherry picked from commit 15e4f0b541d4c0b2144955111a1b37b5bfabbf63)
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 2 +-
 drivers/gpu/drm/i915/display/intel_display_driver.h | 2 +-
 drivers/gpu/drm/i915/i915_pci.c                     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 312564aee684b..b341be788b43d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -21,7 +21,7 @@
 #include "intel_fbdev.h"
 #include "intel_opregion.h"
 
-bool intel_modeset_probe_defer(struct pci_dev *pdev)
+bool intel_display_driver_probe_defer(struct pci_dev *pdev)
 {
 	struct drm_privacy_screen *privacy_screen;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/drivers/gpu/drm/i915/display/intel_display_driver.h
index 4c18792fcafd1..744117b04ed42 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.h
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
@@ -11,7 +11,7 @@
 struct drm_i915_private;
 struct pci_dev;
 
-bool intel_modeset_probe_defer(struct pci_dev *pdev);
+bool intel_display_driver_probe_defer(struct pci_dev *pdev);
 void intel_display_driver_register(struct drm_i915_private *i915);
 void intel_display_driver_unregister(struct drm_i915_private *i915);
 
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 15a38059bacb6..0f15087f9fd96 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1358,7 +1358,7 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -ENXIO;
 
 	/* Detect if we need to wait for other drivers early on */
-	if (intel_modeset_probe_defer(pdev))
+	if (intel_display_driver_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
 	err = i915_driver_probe(pdev, ent);
-- 
2.40.0

