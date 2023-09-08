Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01780EE7FE3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 12:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB67910E8A4;
	Fri,  8 Sep 2023 12:24:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B361410E8A2
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 12:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694175880; x=1725711880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/SsgO8kClnm7YVyvVqAKWp9Tw7CWWXwqCq6FzTdOaOg=;
 b=m44/R007kufVK91VbudGPK63y3zW5648dZR0UguA2Mx4Be2Iwr7+M4tR
 NFHhkJasND++BmXg9zvJELwbCbgwHUfDyT93g58DZQLXMFjKY9NvevYmX
 7p4lvK3AMBEWFLrlNRre7tR2y5Ejo+deUl95Nsbsa0ybcDukefUGAeY5z
 6R6J7EayLSuvYxj7twtWtnojqBXgHFtpgewuNFsWSo8V5RknstuclL1Si
 rx/Ml2pGZ4lbCsq2U74YnIZRZ494NVsnCM2wlnXv7GgOgjz6L5Ce/IZl9
 kGlIAOY8StI3bnebypJEHczqjvaNCaL0JTXvZoAxxU04UedwzZn77PzR/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441650053"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="441650053"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692244190"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="692244190"
Received: from akorchin-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.73])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:39 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 15:24:09 +0300
Message-Id: <20230908122415.1886366-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908122415.1886366-1-jouni.hogander@intel.com>
References: <20230908122415.1886366-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 05/11] drm/xe: Add frontbuffer setter/getter
 for xe_bo
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

Xe is not carrying frontbuffer pointer in xe_bo. Define it's getter as
NULL.  Setter simply returns pointer which was provided as a
parameter and taking/releasing reference to xe_bo.

v2: Handle xe_bo_put as well

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 0823dda0f31b..148b097dd2f8 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -325,6 +325,16 @@ static inline unsigned int xe_sg_segment_size(struct device *dev)
 	return round_down(max / 2, PAGE_SIZE);
 }
 
+#define i915_gem_object_get_frontbuffer(obj) NULL
+
+static inline struct intel_frontbuffer *
+i915_gem_object_set_frontbuffer(struct xe_bo *bo,
+				struct intel_frontbuffer *front)
+{
+	front ? xe_bo_get(bo) : xe_bo_put(bo);
+	return front;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
-- 
2.34.1

