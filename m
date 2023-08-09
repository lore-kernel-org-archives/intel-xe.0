Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748E6C0015E
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 19:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D71E10E49B;
	Wed,  9 Aug 2023 19:05:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A6510E49B
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 19:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691607921; x=1723143921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0rquB23ZWJ7ERKJe9oEhK1tdEkaVWKzLVtuA7t364Rw=;
 b=kPJ796uO5CU/gc9PMgpADZ7iPX4EGiKTSLww+VatBZOmq216y9Hd2hCp
 QuXrpu82AfaDWkNtyizeMgTKuBifI4DJ079tMAgINpyFGYcNRM22/PbIE
 ExnJ32SDnLFaY4IAKeU+UCtfWJjEgL9od8jcFqktovDQK7ZAt/tizxiqZ
 fTf0voQ1qak3gwlSoBOxK1IDUZdSlicwgnRsWMelpeAzfDohRJEnydPaC
 n85b281x550oVfIe7vSxFGFxQ0LuCUmTH5IQPn+hQDMkuJCYipDYxdNo/
 mZvmKIfTtWR4uPUmDE8dew3VpEWyp4Q9Xr+KYSv8gLX6s/Q4tW+675EKf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370108207"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="370108207"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 12:05:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="905768024"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="905768024"
Received: from rbujor-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.48])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 12:05:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  9 Aug 2023 22:04:47 +0300
Message-Id: <20230809190453.1927134-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809190453.1927134-1-jani.nikula@intel.com>
References: <20230809190453.1927134-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/9] drm/i915/display: add I915 conditional
 build to intel_sdvo.h
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
Cc: jani.nikula@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add stubs for !I915.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_sdvo.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.h b/drivers/gpu/drm/i915/display/intel_sdvo.h
index 2868852c85f2..d1815b4103d4 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.h
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.h
@@ -14,9 +14,22 @@ struct drm_i915_private;
 enum pipe;
 enum port;
 
+#ifdef I915
 bool intel_sdvo_port_enabled(struct drm_i915_private *dev_priv,
 			     i915_reg_t sdvo_reg, enum pipe *pipe);
 bool intel_sdvo_init(struct drm_i915_private *dev_priv,
 		     i915_reg_t reg, enum port port);
+#else
+static inline bool intel_sdvo_port_enabled(struct drm_i915_private *dev_priv,
+					   i915_reg_t sdvo_reg, enum pipe *pipe)
+{
+	return false;
+}
+static inline bool intel_sdvo_init(struct drm_i915_private *dev_priv,
+				   i915_reg_t reg, enum port port)
+{
+	return false;
+}
+#endif
 
 #endif /* __INTEL_SDVO_H__ */
-- 
2.39.2

