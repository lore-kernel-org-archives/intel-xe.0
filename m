Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CE2C76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130B410E9FD;
	Wed,  5 Apr 2023 15:39:55 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A2510E9FD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709194; x=1712245194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xhsBzzp8FRNTnzMGqsCWIlRgaJBt54yI+TGBW7UylhU=;
 b=VJFXwAoGHugtHQi33REkzu8LdruUCol4lFBVofZP+QVwSOAqaVAXzx+b
 ttOqKe3L04c4RRnMQu3yiratk5/QqyLBYR1jl8MEMqdXVYJei+ncFHOSf
 2WDqR9dEztwRjCg5C3NsGIXVDhLiMAFVNqEPjAoWFMU8K6DNdgSIOdNha
 1f27yihNXi3eJO8nOKvWQ3YIUhw35mzquvWHWRkDezdlAb/1YvRAeLbOS
 +n8yTDAQTZX0NgR4T0daZKlWulYs37RpWP1V5ZoUQsB30gHq7KI6QKcFD
 w5XzGpC8OeOcb4CuetxkcmwbzpxWkJ/62Rb2SDMKcLuGKC34dNqT36RMb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="341210854"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="341210854"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751295762"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="751295762"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:39:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:04 +0300
Message-Id: <20230405153920.926583-6-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 05/21] drm/i915/display: add I915 conditional
 build to hsw_ips.h
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
 drivers/gpu/drm/i915/display/hsw_ips.h | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/hsw_ips.h b/drivers/gpu/drm/i915/display/hsw_ips.h
index 7ed6061874f7..9a1bd47127c2 100644
--- a/drivers/gpu/drm/i915/display/hsw_ips.h
+++ b/drivers/gpu/drm/i915/display/hsw_ips.h
@@ -13,6 +13,7 @@ struct intel_atomic_state;
 struct intel_crtc;
 struct intel_crtc_state;
 
+#ifdef I915
 bool hsw_ips_disable(const struct intel_crtc_state *crtc_state);
 bool hsw_ips_pre_update(struct intel_atomic_state *state,
 			struct intel_crtc *crtc);
@@ -24,5 +25,39 @@ int hsw_ips_compute_config(struct intel_atomic_state *state,
 			   struct intel_crtc *crtc);
 void hsw_ips_get_config(struct intel_crtc_state *crtc_state);
 void hsw_ips_debugfs_register(struct drm_i915_private *i915);
+#else
+static inline bool hsw_ips_disable(const struct intel_crtc_state *crtc_state)
+{
+	return false;
+}
+static inline bool hsw_ips_pre_update(struct intel_atomic_state *state,
+				      struct intel_crtc *crtc)
+{
+	return false;
+}
+static inline void hsw_ips_post_update(struct intel_atomic_state *state,
+				       struct intel_crtc *crtc)
+{
+}
+static inline bool hsw_crtc_supports_ips(struct intel_crtc *crtc)
+{
+	return false;
+}
+static inline bool hsw_crtc_state_ips_capable(const struct intel_crtc_state *crtc_state)
+{
+	return false;
+}
+static inline int hsw_ips_compute_config(struct intel_atomic_state *state,
+					 struct intel_crtc *crtc)
+{
+	return 0;
+}
+static inline void hsw_ips_get_config(struct intel_crtc_state *crtc_state)
+{
+}
+static inline void hsw_ips_debugfs_register(struct drm_i915_private *i915)
+{
+}
+#endif
 
 #endif /* __HSW_IPS_H__ */
-- 
2.39.2

