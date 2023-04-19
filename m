Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC0EC6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 12:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC12210E96B;
	Wed, 19 Apr 2023 12:40:14 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AE110E96B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681908012; x=1713444012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P0cElYOitY9ppHpI2d7RvgE23u/lZogtas5Ihfn5W4Y=;
 b=jZSr3BBxr2KXgDdoPoglt7hc8prWBo2suXs1AklhNeOFNzEUl4/BwedV
 s59VWdBhPE9HjAKc0OJ+/Qj0jPn/Y42DNn6b1GHlSAWs77sJc1RTfDARp
 TvSpcyTFNF4h+XojM8/IVuQ0so0h8k6jdA2A3Hckn/EJUWy79efmhKLzS
 9Brc/gNcpb50uxFmcOWiBzoj0l0eUi6CvHtTahfERf/Y2QkMEnTa0y+E9
 Br+eNzu38FGg38FvUbu1U964TgxCJr/dEQnc2hW6AphTNitz+NtOqwDx6
 33JjTwZYy1Lzuaw4a+crB64HwbJN+rrPg6wLN8t0Zg9XCCcn4kIr/7mkp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="348189377"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="348189377"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="802909801"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="802909801"
Received: from yedidyal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.37])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 15:39:41 +0300
Message-Id: <20230419123947.543175-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230419123947.543175-1-jani.nikula@intel.com>
References: <20230419123947.543175-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/9] drm/i915/display: add I915 conditional build
 to i9xx_wm.h
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

Add stubs for !I915.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_wm.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.h b/drivers/gpu/drm/i915/display/i9xx_wm.h
index b87ae369685a..de0920730ab2 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.h
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.h
@@ -12,9 +12,26 @@ struct drm_i915_private;
 struct intel_crtc_state;
 struct intel_plane_state;
 
+#ifdef I915
 bool ilk_disable_lp_wm(struct drm_i915_private *i915);
 void ilk_wm_sanitize(struct drm_i915_private *i915);
 bool intel_set_memory_cxsr(struct drm_i915_private *i915, bool enable);
 void i9xx_wm_init(struct drm_i915_private *i915);
+#else
+static inline bool ilk_disable_lp_wm(struct drm_i915_private *i915)
+{
+	return false;
+}
+static inline void ilk_wm_sanitize(struct drm_i915_private *i915)
+{
+}
+static inline bool intel_set_memory_cxsr(struct drm_i915_private *i915, bool enable)
+{
+	return false;
+}
+static inline void i9xx_wm_init(struct drm_i915_private *i915)
+{
+}
+#endif
 
 #endif /* __I9XX_WM_H__ */
-- 
2.39.2

