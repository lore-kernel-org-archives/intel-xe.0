Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437FBC54ED1
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 22:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C527510E711;
	Thu, 22 May 2025 22:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OyBUUbsA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2853710E196
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 22:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747954454; x=1779490454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lVcRoZcU+bUYer5T0INuk2S9z79P5svVcD0LF7Q9XQ4=;
 b=OyBUUbsAf2CvI9ADIrprRsoGT0aOAYhTVTYKxJZ/QGmN3al4BIIsQP+9
 fB3m52QoXdV8USacFIhNtNvT/d29MIr3hw3oMoSxfh4WBPRW7+8Y8OfvV
 Lk+spBchFZ7ZItHuDfmCMPXh49DaEchAMWWQaI84QblfRNfv5P0iVmurg
 kpQRFWE2QRIbiJpdbB3X2tSYBaBhz6xN2dsnl/og/sK8Ysc6pQAJeqU+L
 GYAv2ysYdgDEiUIUKCi5XLW4p3NKkssXksghhvVhsGF2SA57sjDc6fmLV
 ozt9HtZpoUI74AMS80TTOU7LDjsyyQ8E2K03Yd/1oih4iAXbX7t6aqLyw g==;
X-CSE-ConnectionGUID: Ml58417eR1C0BbfRY8VkaQ==
X-CSE-MsgGUID: 33HKdovwRxKOOOOvH6wJYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49996929"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; d="scan'208";a="49996929"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 15:54:14 -0700
X-CSE-ConnectionGUID: bqoaGoBHTfmE+emV75o+WQ==
X-CSE-MsgGUID: r0RIYOqMS8+QmK5LEC/peA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; d="scan'208";a="145967090"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 15:54:14 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 1/3] drm/xe/pxp: Use the correct define in the
 set_property_funcs array
Date: Thu, 22 May 2025 15:54:03 -0700
Message-ID: <20250522225401.3953243-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522225401.3953243-5-daniele.ceraolospurio@intel.com>
References: <20250522225401.3953243-5-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The define of the extension type was accidentally used instead of the
one of the property itself. They're both zero, so no functional issue,
but we should use the correct define for code correctness.

Fixes: 41a97c4a1294 ("drm/xe/pxp/uapi: Add API to mark a BO as using PXP")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d99d91fe8aa9..99e309642a1c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2557,7 +2557,7 @@ typedef int (*xe_gem_create_set_property_fn)(struct xe_device *xe,
 					     u64 value);
 
 static const xe_gem_create_set_property_fn gem_create_set_property_funcs[] = {
-	[DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY] = gem_create_set_pxp_type,
+	[DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE] = gem_create_set_pxp_type,
 };
 
 static int gem_create_user_ext_set_property(struct xe_device *xe,
-- 
2.43.0

