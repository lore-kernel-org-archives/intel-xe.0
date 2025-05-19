Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB2CC54756
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 23:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C0810E047;
	Mon, 19 May 2025 23:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/WqTLBw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A537210E297
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 23:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747697575; x=1779233575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6mx5Kj9lecUBSwT3mpZ1oakbeJi7og+gf6sRoGGvfMI=;
 b=H/WqTLBw6gaDUL4S39njgy/a83WMt6TUjy+DUpbz8CN3J6rleJLmrl0T
 3MLrRMti5qNRuzQn/I2GtHu44HXsDHKLqxLW0te8DQdDgiy+canP1Azc2
 RGVhiKEOzdJuRt+0KN3AEZbMNmJ48kaVA3EIEMLXcguDcNYIx2u8EEotw
 Q0jY0mFJwV9W+oFdnbIKUoZh+gWW8tw7m3C6PwjITSSE3WUHmvUl9+3R3
 oEojbZaCbLcxxk1DTUeDujh2OD4kU/cdINaDKsHWgXZVhMuyxOVVmZ3Sa
 rNQhuJ6ZkdcIfVsxkTBJx3BwMtvucrabDORiAYkNPG6oEUwE+622KYTRJ w==;
X-CSE-ConnectionGUID: u0hs43IgTTSlbXJRTby4Dg==
X-CSE-MsgGUID: lNyU519HQp6HFs027sWi5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52244896"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="52244896"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 16:32:54 -0700
X-CSE-ConnectionGUID: 3YeCZfVnQsOrHLEdCrg5QQ==
X-CSE-MsgGUID: h4AZ/LYXRVm+ofaFE5OZKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139419028"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 16:32:43 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/3] drm/xe/pxp: Use the correct define in the
 set_property_funcs array
Date: Mon, 19 May 2025 16:32:30 -0700
Message-ID: <20250519233228.3754667-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519233228.3754667-5-daniele.ceraolospurio@intel.com>
References: <20250519233228.3754667-5-daniele.ceraolospurio@intel.com>
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

