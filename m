Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95121E728F3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AB410E143;
	Fri, 29 Sep 2023 20:45:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4788410E143
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696020325; x=1727556325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BYzJ2LPeok5GcxoFl+gYb4fVh+I3rLmbc0eqMstZzXg=;
 b=NmfHNiAkwbfDNDezfGcbgcU4qP0qy2GdeSlIiL4natUz07Mh0LFUzB+U
 FCQ0rPRtx7JOfWmsLtF619HXcx6JO7oOIt/21E296NKBmz/1AXvlzDrCX
 cOPC3bGdp/K/gZtI337Qdc+tMeuhqH78K88zgAqQ6VjBmgZZpPl6BZKAf
 mACWXl94SngrUdw3ziQvYiMGOucuK3S/qlpgnourzV4JQDh7/d4LSoGUW
 NJ0CIjMjzADwcDuKXLzdZtKN5wGUS2P5NCW0u80jk4uJHZ2yxG8SsSgsk
 UA/xuQB8/JEN+zNw8lbUWc+DXjpIO5XDnv09htjBWKAjClOomlnWQHJgK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="367427388"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="367427388"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="726691233"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="726691233"
Received: from anushasr-simics.jf.intel.com ([10.165.21.200])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:18:56 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 13:16:56 -0700
Message-Id: <20230929201659.2840724-3-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230929201659.2840724-1-anusha.srivatsa@intel.com>
References: <20230929201659.2840724-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/5] drm/xe: s/ADL_P/ALDERLAKE_P
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Extend the change introduced in the previous patch to xe
driver.

Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 03ac39efba38..012d15565727 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -144,7 +144,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define IS_DG2_G10(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G10)
 #define IS_DG2_G11(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G11)
 #define IS_DG2_G12(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G12)
-#define IS_RAPTORLAKE_U(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU)
+#define IS_RAPTORLAKE_U(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ALDERLAKE_P_RPLU)
 #define IS_ICL_WITH_PORT_F(xe) (xe && 0)
 #define HAS_FLAT_CCS(xe) (xe_device_has_flat_ccs(xe))
 #define to_intel_bo(x) gem_to_xe_bo((x))
-- 
2.25.1

