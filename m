Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081A3CD4F2B
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 08:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09A810E194;
	Fri, 22 Sep 2023 08:31:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD80110E03E
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695371466; x=1726907466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S+WODGJM9ixJPe0jRUoPbjHqZ9tj/mEw8zpflYaoEqA=;
 b=YuwAzTO2uWccGMeUDjWIS3R1LnfXdiroZOjsHLsM4aqgr8AC5pzFeEPf
 o6RLRpGan/ieAVk7yV3h97kv4Uq35GfKXG9VeSFK5irN9/eLi0Z5YuMlh
 DSo/ElwOFWhbEvQYP81Frhp9qgdKVxVWWQV1ZjnOahNUJitoB4xRxE4RT
 sguXgcG4lTvofoMOn90SYhkQ1XFioTWXD+fAGsvDI+Dr4v0F1o9e9qunY
 0bX6y1iAhVWwNa5uRlqhWxh39sIKsPIyd5wnHw9lPOlG47lgnLGhgYgYA
 GEx/objM4izflbWb/fjmVNRXdECbEGIKLqP9tdM0/QnR2hq/rspwMvzwG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="371098042"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="371098042"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 01:31:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="817698736"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="817698736"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmsmga004.fm.intel.com with ESMTP; 22 Sep 2023 01:31:04 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 13:59:07 +0530
Message-Id: <20230922082909.334085-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230922082909.334085-1-suraj.kandpal@intel.com>
References: <20230922082909.334085-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/i915/hdcp: Remove i915 check stubs
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove i915 check stubs the subsequent patch will add function
which implements a cleaner method to share code between
i915 and Xe

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index f617ccd206c8..a42549fa9691 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -174,7 +174,6 @@ bool intel_hdcp2_capable(struct intel_connector *connector)
 
 	/* If MTL+ make sure gsc is loaded and proxy is setup */
 	if (intel_hdcp_gsc_cs_required(i915)) {
-#ifdef I915
 		struct intel_gt *gt = i915->media_gt;
 		struct intel_gsc_uc *gsc = gt ? &gt->uc.gsc : NULL;
 
@@ -183,10 +182,6 @@ bool intel_hdcp2_capable(struct intel_connector *connector)
 				    "GSC components required for HDCP2.2 are not ready\n");
 			return false;
 		}
-#else
-		/* TODO */
-		return false;
-#endif
 	}
 
 	/* MEI/GSC interface is solid depending on which is used */
-- 
2.25.1

