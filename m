Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5687EC5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 10:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF0310F969;
	Fri,  8 Mar 2024 10:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Re/R5CIb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477D310F969
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 10:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709894875; x=1741430875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o4cz1Wld69bulwfAgWCv1At8hChgdBmndMAobSjRjRU=;
 b=Re/R5CIb38mvOe1y/NP9G3QOlBj3YuDx8hV7IqNW63EFiwTYVDFGcqvb
 lElRHlPUaQ8dETMEAgmhp5HUQMhyH2Homdfqm1MLQsj/K5ZfpNUKA60+4
 PRiiin6lJqnvkHUH9uoHprB3dFBgOZ7p2YMAkHtJzc9h3qCN1ynwtgGR2
 1TNc0/WuEHuvDkF/Tn6eme+5o4otbWrjiVC1AFk7fepLq+qJF0QEMvAyy
 ifKw0w4xBOQHyF80FkOBmAs6YGKou23TFIWFtb3/qUv/inpXX72iU0pd9
 huBwpMZxDHnpPrmLrTDl3/89xod1MtuFoFiKE/KBMiiRBdCY9i8Dz+JCF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4778473"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4778473"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 02:47:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15012701"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa004.fm.intel.com with ESMTP; 08 Mar 2024 02:47:53 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Modify minimum of  various scheduler timeout to 0.
Date: Fri,  8 Mar 2024 16:30:58 +0530
Message-Id: <20240308110058.2479126-1-himal.prasad.ghimiray@intel.com>
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

The sysman teams needs to disable preemption and timeslice to
test exclusivity mode and are relying on setting 'timeslice_duration_us'
and 'preempt_timeout_us' to 0 for the same. Hence set the
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

