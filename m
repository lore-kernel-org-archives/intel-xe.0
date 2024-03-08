Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61519C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 10:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2224C10F354;
	Fri,  8 Mar 2024 10:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqLV3tmC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC38D10F354
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709894693; x=1741430693;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LK/kmO3Xu+S6kOP/pfEE6I9nkf/0+zjI8CL6BxRHbpk=;
 b=dqLV3tmCV3xHyYVdz6VZn+pVi9j8tDHhT7btoG2tpJac8VC/7dX3IgUa
 S5+n5aDL7F5RpzkNoK3wHalvV0a/R522YhDUNKqFgdAC9jFBNsw2JeP6C
 B9fz/ZNF6KK3yQWzUmFS5MzCePPAcTAXhjFuOncyWJp27LTg5OXwZm6Yp
 rU6F+7By2JFuaeyJbmYstD5IkA7buvqean5nTl6eFa75g6/Swn+8g7oYR
 WND8J2Yf3ETcUCB/1YQCkwIG0kpopgAWWooWJK4JduS3/ogFSm2VGU0B/
 iBQORcmGSlZ5Rlxp7Z4JxN+/29T5EfGcL9rR4qS6zADgNJioVH8Wx3eBH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4537137"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4537137"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 02:44:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10440421"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa010.jf.intel.com with ESMTP; 08 Mar 2024 02:44:39 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Modify min various scheduler timeout to 0.
Date: Fri,  8 Mar 2024 16:27:44 +0530
Message-Id: <20240308105744.2478794-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

The sysman teams needs to disable preemption and timneslice to
test exclusivity mode and are relying on setting 'timeslice_duration_us'
and 'preempt_timeout_us' to 0 for using exclusive mode. Hence seting the
min configs to 0.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index ba17a25e8db3..80e80b55467f 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -18,7 +18,7 @@ config DRM_XE_TIMESLICE_MAX
 	  contexts by guc scheduling.
 config DRM_XE_TIMESLICE_MIN
 	int "Default min timeslice duration (us)"
-	default 1 # microseconds
+	default 0 # microseconds
 	help
 	  Configures the default min timeslice duration between multiple
 	  contexts by guc scheduling.
@@ -39,7 +39,7 @@ config DRM_XE_PREEMPT_TIMEOUT_MAX
 	  run.
 config DRM_XE_PREEMPT_TIMEOUT_MIN
 	int "Default min preempt timeout (us)"
-	default 1 # microseconds
+	default 0 # microseconds
 	help
 	  Configures the default min preempt timeout after which context
 	  will be forcefully taken away and higher priority context will
-- 
2.25.1

