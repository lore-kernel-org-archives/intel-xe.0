Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19E1C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 11:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8439C10E3D8;
	Tue,  8 Aug 2023 11:46:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075F210E3D9
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691495160; x=1723031160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fywPuGh/6D6XVCKeO8/47kNEIPVzpbwI2yP9aJSqroU=;
 b=NovZGawcRVWAQN6SqTCIwk6tP4zLfIQJs1JzrCaCGSaQwu5gI+0XtNHF
 CGq9JNaZZNkERNez7ORIH6qWQvyab4LO+IXkUJglvZHF4zb585nsXGmeG
 gVYJNQUpkLIWiNp5bBX1GWWw/DTdijGlKoSp+DRIvdJvgXD3iR1K5taMN
 IeDBY85yuD/2t88ND1muzCNYv7p7SkaEm2gazNCiUUpGKqddSi5eA9l1Q
 Gz0Hg3w2JfefEfj0j7kId2HdByd9JdQGRhctjpm81NGcGicBCKddP29re
 gyDPfHZlh1IBUoB+wQV/Rp6GvmFl0QTbuEXsmd0kQ8ljKzlIWRisqaeUx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401758703"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="401758703"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:45:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="905196602"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="905196602"
Received: from sschwar3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:45:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  8 Aug 2023 14:45:30 +0300
Message-Id: <20230808114535.1600595-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808114535.1600595-1-jani.nikula@intel.com>
References: <20230808114535.1600595-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/9] drm/i915/display: add I915 conditional build
 to intel_tv.h
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
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add stubs for !I915.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_tv.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_tv.h b/drivers/gpu/drm/i915/display/intel_tv.h
index 44518575ec5c..f08827b8bf2b 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.h
+++ b/drivers/gpu/drm/i915/display/intel_tv.h
@@ -8,6 +8,12 @@
 
 struct drm_i915_private;
 
+#ifdef I915
 void intel_tv_init(struct drm_i915_private *dev_priv);
+#else
+static inline void intel_tv_init(struct drm_i915_private *dev_priv)
+{
+}
+#endif
 
 #endif /* __INTEL_TV_H__ */
-- 
2.39.2

