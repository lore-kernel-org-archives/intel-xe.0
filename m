Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B521E77173
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 08:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C734B10E66F;
	Mon,  9 Dec 2024 08:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXC1BEu7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A28310E66F;
 Mon,  9 Dec 2024 08:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733734354; x=1765270354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z+9VrDA6rBtOiul3dsriQvdkW7mejAPMofHaWrXPVUM=;
 b=FXC1BEu7hCGB/K3c3sw9aFlTLeqX9fkYBCCaU/g0raYSmU6Aw9R2ftak
 tSWk2K9kxXF4B3KKxS0eAy6/7g0t7uWktWPHUmo5+d7SZwvFGzhMt12RZ
 U2hWdjBHVeaAoPJcnmI077xitFAtigfNY8iWKX/ZEgdy0m46M7z8NOgKm
 q5GXXdyreeoGvz0CtyVD7BDApjxSwgCATqeOUDoWjW6xmWQFNqJ0tcA1p
 lpHWAXMjSCa4xa6zRNC2BIUwDSWGkh3edEco9nJlF7w9lBQ0Oqxo3G5jx
 BOFhNaxa7pzGvslRSBbD6FHf93tR2dYJ7dXwj8OXkApBpFfHtN1oTJwz5 A==;
X-CSE-ConnectionGUID: GB3JtcESS0C75xMhZDfh5Q==
X-CSE-MsgGUID: G8qpxXscQYSylKZIHA/sFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33750990"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="33750990"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:52:33 -0800
X-CSE-ConnectionGUID: PhzrPxAbQ32cv9IZJ22VHg==
X-CSE-MsgGUID: OoYz7wRVTkKmIhkSsKcqbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="132387456"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:52:32 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Jan Maslak <jan.maslak@intel.com>
Subject: [i-g-t] lib/xe: set hwconfig NULL for unsupported platforms
Date: Mon,  9 Dec 2024 14:27:09 +0530
Message-Id: <20241209085709.1979242-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

There are hardware platforms which are not supporting
hwconfig table, for example ADLS. Querying hwconfig
on unsupported platforms leads to assert and failure
for some of tests like,
./build/tests/xe_module_load --r load

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3683

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Jan Maslak <jan.maslak@intel.com>
Fixes: 37a230e50 ("lib/xe_query: add hwconfig to xe_device")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 lib/xe/xe_query.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index f3731d9d3..8f0a5392c 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -51,7 +51,8 @@ static uint32_t *xe_query_hwconfig_new(int fd, uint32_t *hwconfig_size)
 
 	/* Perform the initial query to get the size */
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-	igt_assert_neq(query.size, 0);
+	if (!query.size)
+		return NULL;
 
 	hwconfig = malloc(query.size);
 	igt_assert(hwconfig);
@@ -858,7 +859,8 @@ uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32
 	igt_assert(xe_dev);
 
 	hwconfig = xe_dev->hwconfig;
-	igt_assert(hwconfig);
+	if (!hwconfig)
+		return NULL;
 
 	/* Extract the value from the hwconfig */
 	pos = 0;
-- 
2.34.1

