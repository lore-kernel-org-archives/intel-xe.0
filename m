Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27792EE6434
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 07:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0EA10E5CC;
	Fri, 15 Sep 2023 07:49:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CFC10E5C9
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694764145; x=1726300145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u7RZBgwTMJzAxclYWaErmilAGmihxFZQX2rfxlBBRgU=;
 b=lcqgAhAQM2njELLQM2OojO3rwOPI2j0b7VfgJXwiSNek4RiKBZxT9jn7
 2LilyBh1bC0EtNQAbrYk0itzJ5eWtjiQW901pHSGp0B9UdRDQxLyzWJkX
 VuV0DegdKvaqXGBnUSrqjf3bapoRMUniqbnLA1e8Anm9ZgxNYbe0dVusL
 VyuNbDrS7EIem5vfYU5qjAfs4Uc+ziFMTSMvaigfWqA+PMHttA7Bx0+Xf
 5N/QbzhDJt4r/BY6wTFWk8bvJWd/ky5QVpQaUvzO3WaKlAkKwCTVZmlBh
 wHsN2Ai0HewqXM+cWraGynvxpPonk8mMlsGvMux8prDRQPWU7Ienv8GPs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369507565"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="369507565"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="1075711590"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="1075711590"
Received: from cohrs-mobl1.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.48.100])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:38 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 10:48:12 +0300
Message-Id: <20230915074818.903353-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915074818.903353-1-jouni.hogander@intel.com>
References: <20230915074818.903353-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/7] drm/xe: Add empty def for
 i915_gem_object_flush_if_display
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We don't need i915_gem_object_flush_if_display on Xe side. Add empty
define to tackle compilation errors with display code where it's used.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 4a68d869b3b5..b2c139586d97 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -307,6 +307,7 @@ static inline unsigned int xe_sg_segment_size(struct device *dev)
 
 #define i915_gem_object_get_frontbuffer(obj)		NULL
 #define i915_gem_object_set_frontbuffer(obj, front)	(front)
+#define i915_gem_object_flush_if_display(obj)		((void)(obj))
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
-- 
2.34.1

