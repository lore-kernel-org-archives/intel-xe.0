Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A270C88CB2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 09:39:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B9210E64D;
	Fri, 25 Aug 2023 09:39:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C395F10E64C
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 09:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692956367; x=1724492367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x1JIrBCm3IBA3v8kwn1hshvNdvoW+zplPX6t1uYDysA=;
 b=d8htib1R5Z9ajXAwMiApMQb8NuvqOC2GH1VhgjotXq341c4k4Ro6g9dy
 MzoiqyTHzV3B6WzQlHLDd+4Jj2DHLMBgfU5ylac3RTbjn4F1vFdZ/hK9v
 vALBWKV+zq+ua8i0dlQrGog36E7lEwE9LJn6t2zsEMOxQiyM08mQXUtDb
 F1gNo9hVEaARGje3R7qIh691MP5R+Tw3uLIUd1s/sBkw9QHKyJTbQp/B9
 /CIovunwFoUWOmG9gk05vII6z3VIuF9NaTBI7QA3f3BgKE7PCb3Zc9ALV
 gvS1BMlqDnUUSWEiHJHrbFTpAyOBhexb0pBe/4f4CKhjbnKqLpMh2viCL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="461037111"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="461037111"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687246801"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="687246801"
Received: from janlundk-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.56.87])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:26 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 12:38:56 +0300
Message-Id: <20230825093904.1230143-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825093904.1230143-1-jouni.hogander@intel.com>
References: <20230825093904.1230143-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 04/12] drm/xe: Add frontbuffer setter/getter for
 xe_bo
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
parameter.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 0823dda0f31b..d04edfd6ee38 100644
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
+	xe_bo_get(bo);
+	return front;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
-- 
2.34.1

