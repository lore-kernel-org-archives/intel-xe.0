Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B940DC0015E
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 19:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA0010E49C;
	Wed,  9 Aug 2023 19:05:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE5E10E49C
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 19:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691607925; x=1723143925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=syiAoV7zxsEG5Fb4P974qO/cs3eS6UiLwuOSKIb8JaY=;
 b=Hxh+1V5BuUdEg0RJ2jtAM4cix7+Lxlp/XowCMwO0y3jwNcLpsOfeFt+3
 0r/vqLCDpS7QF9xC7MJFJ7mVAi7GxFr6vxWuYJx5Z58nRSUQ7K7VT5lO2
 dfF0eIqbigpSBW5jAJDlU/SRd5mNJWeJGMjEdIr7qLfkXKsvowlccmQp1
 sx4XdH+ODonlASRXPiZuaqJHVI6jstlUicRgSTU3NkZXA49A8ZvFzVc47
 BJp80sPOe0iAJyEDRyk0HCvvpa4F8lZhi1uIhQ2evj4Q4kBtbrAFl1DnY
 Sb+Zdg0Q4pV9BD2DPQU+fedV+b+MpZ0RBo5JD5dORInZeDosMYJ0gzmoj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370108214"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="370108214"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 12:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="905768029"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="905768029"
Received: from rbujor-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.48])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 12:05:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  9 Aug 2023 22:04:48 +0300
Message-Id: <20230809190453.1927134-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809190453.1927134-1-jani.nikula@intel.com>
References: <20230809190453.1927134-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/9] drm/i915/display: add I915 conditional
 build to intel_tv.h
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

