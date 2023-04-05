Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020FCC77B60
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A3710E9FD;
	Wed,  5 Apr 2023 15:40:45 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4AC10E9FD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709244; x=1712245244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eR6U3wGrUl9y3C/W8ue69z+jLpseWEDAt7uM6TWxig4=;
 b=hiE870C/TZO1v+7c7B1pXOUo/0GcZi70q9ez6t6g87fdRKH0FPLKwaz9
 LgDYTzKo/ERS4UivJWq4DITcWLTOWnbQynhHbbvDr2B1/VZpy5mfhP18l
 96rJjVcvFWk4G69b//E3wGn1+JemyF5o+tki6L8KNcYgyUuz+IIayaPl0
 WgHL8OW9xy2OUQZYAh+BFTimtriRz5eoXPQiHvpBcMyOT1OUfph6sHZZy
 tbaoIRiXN4vgbL5G7dJtd/bh1ozwhkgYjxOfmiDTcYl+UPa5od9bLK+I+
 rgbsYwegOaLJmLy30i/Q98WsFOBgEbpnzeQIVkrqyXh/0g4P0tDL65f62 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="342501092"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="342501092"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="756033452"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="756033452"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:14 +0300
Message-Id: <20230405153920.926583-16-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 15/21] drm/i915/display: add I915 conditional
 build to intel_pch_display.h
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
Cc: tvrtko.ursulin@linux.intel.com, Jani Nikula <jani.nikula@intel.com>,
 joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add stubs for !I915.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/i915/display/intel_pch_display.h  | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_pch_display.h b/drivers/gpu/drm/i915/display/intel_pch_display.h
index 41a63413cb3d..35f8288af3d1 100644
--- a/drivers/gpu/drm/i915/display/intel_pch_display.h
+++ b/drivers/gpu/drm/i915/display/intel_pch_display.h
@@ -15,6 +15,7 @@ struct intel_crtc;
 struct intel_crtc_state;
 struct intel_link_m_n;
 
+#ifdef I915
 bool intel_has_pch_trancoder(struct drm_i915_private *i915,
 			     enum pipe pch_transcoder);
 enum pipe intel_crtc_pch_transcoder(struct intel_crtc *crtc);
@@ -41,5 +42,57 @@ void intel_pch_transcoder_get_m2_n2(struct intel_crtc *crtc,
 				    struct intel_link_m_n *m_n);
 
 void intel_pch_sanitize(struct drm_i915_private *i915);
+#else
+static inline bool intel_has_pch_trancoder(struct drm_i915_private *i915,
+					   enum pipe pch_transcoder)
+{
+	return false;
+}
+static inline int intel_crtc_pch_transcoder(struct intel_crtc *crtc)
+{
+	return 0;
+}
+static inline void ilk_pch_pre_enable(struct intel_atomic_state *state,
+				      struct intel_crtc *crtc)
+{
+}
+static inline void ilk_pch_enable(struct intel_atomic_state *state,
+				  struct intel_crtc *crtc)
+{
+}
+static inline void ilk_pch_disable(struct intel_atomic_state *state,
+				   struct intel_crtc *crtc)
+{
+}
+static inline void ilk_pch_post_disable(struct intel_atomic_state *state,
+					struct intel_crtc *crtc)
+{
+}
+static inline void ilk_pch_get_config(struct intel_crtc_state *crtc_state)
+{
+}
+static inline void lpt_pch_enable(struct intel_atomic_state *state,
+				  struct intel_crtc *crtc)
+{
+}
+static inline void lpt_pch_disable(struct intel_atomic_state *state,
+				   struct intel_crtc *crtc)
+{
+}
+static inline void lpt_pch_get_config(struct intel_crtc_state *crtc_state)
+{
+}
+static inline void intel_pch_transcoder_get_m1_n1(struct intel_crtc *crtc,
+						  struct intel_link_m_n *m_n)
+{
+}
+static inline void intel_pch_transcoder_get_m2_n2(struct intel_crtc *crtc,
+						  struct intel_link_m_n *m_n)
+{
+}
+static inline void intel_pch_sanitize(struct drm_i915_private *i915)
+{
+}
+#endif
 
 #endif
-- 
2.39.2

