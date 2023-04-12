Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3BDC77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A24210E82A;
	Wed, 12 Apr 2023 14:20:50 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1668D10E839
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309248; x=1712845248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QO26e7S2l7LAcr3aQcjcXvewO22iDIxzsqQgeMgD/y8=;
 b=ZM/+IlAvlTevGxOpyvFUFklZgM+wEPYGxvaNNoeEsLsof2qxkTNnhOht
 7HdH9y153lXMQyLmQ0bFDfJNAltypdm5WlvsIgJCu9RYNWp5mIFcrM4Xv
 0IgecG1xwOznCNf1tIGDDIMpXIyHM9oyO9IgyBdyZCzSvep8DRyJAoCOG
 AcQES39YFRWRWWKC0VYnN1eHbvUIOjb5W2SEdsa+3iJgQwCwRpU5zUtYf
 41il2RGoMcuIHgiqJuvY28d73/8KN+XQG940yZxFieWfPZ6hSkLmWgabY
 iE987xzWw3RKz4N0rw5P0+w4LWkM6ArVMKHVVAvR/NMZ+vGvjaNZUeK9/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328020080"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="328020080"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="753544166"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="753544166"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:27 +0300
Message-Id: <20230412142006.877109-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 02/41] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove intel_dpio_phy.h hacky conditional compile. To be replaced with
better stubs.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpio_phy.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpio_phy.h b/drivers/gpu/drm/i915/display/intel_dpio_phy.h
index 952e8d446425..855d96d670cd 100644
--- a/drivers/gpu/drm/i915/display/intel_dpio_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_dpio_phy.h
@@ -27,7 +27,6 @@ enum dpio_phy {
 	DPIO_PHY2,
 };
 
-#ifdef I915
 void bxt_port_to_phy_channel(struct drm_i915_private *dev_priv, enum port port,
 			     enum dpio_phy *phy, enum dpio_channel *ch);
 void bxt_ddi_phy_set_signal_levels(struct intel_encoder *encoder,
@@ -73,17 +72,4 @@ void vlv_phy_pre_encoder_enable(struct intel_encoder *encoder,
 void vlv_phy_reset_lanes(struct intel_encoder *encoder,
 			 const struct intel_crtc_state *old_crtc_state);
 
-#else
-#define bxt_port_to_phy_channel(xe, port, phy, ch) do { *phy = 0; *ch = 0; } while (xe && port && 0)
-static inline void bxt_ddi_phy_set_signal_levels(struct intel_encoder *x,
-						 const struct intel_crtc_state *y) {}
-#define bxt_ddi_phy_init(xe, phy) do { } while (xe && phy && 0)
-#define bxt_ddi_phy_uninit(xe, phy) do { } while (xe && phy && 0)
-#define bxt_ddi_phy_is_enabled(xe, phy) (xe && phy && 0)
-static inline bool bxt_ddi_phy_verify_state(struct xe_device *xe, enum dpio_phy phy) { return false; }
-#define bxt_ddi_phy_calc_lane_lat_optim_mask(x) (x && 0)
-#define bxt_ddi_phy_set_lane_optim_mask(x, y) do { } while (x && y && 0)
-#define bxt_ddi_phy_get_lane_lat_optim_mask(x) (x && 0)
-#endif
-
 #endif /* __INTEL_DPIO_PHY_H__ */
-- 
2.39.2

