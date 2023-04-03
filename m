Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7596BC76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 04:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA05510E11F;
	Mon,  3 Apr 2023 04:05:28 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A008C10E11F
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 04:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680494727; x=1712030727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0+ThdH9oaGu5ywWWfjtxRdaBvuKxThjfEKZgIsB5S34=;
 b=a/QD9Mk8rZ0Jk9Blcax+n8cfqEbQOLgdte0VKn4PtTeWXXsBSLCn0buG
 +6bqbWzVGFWljd/XuE6VUTrWGi2QOSw8R8Ig3JQIaCYOtOc6L/RECTkbM
 0OUD04Wpo//Ig/JC16papTmKc2IINhHhW0Bls+idlwwSUq5EOOTcvPZe4
 E80oaZT6JM63EpnfXc0Apb7/3D4A5bsuVqk2eOopO19sIkCRdNIg4cg0c
 Q8wDvYA5GAc8owG7p8TeTCwKJ5bXxs3ygRHFZ9w4l5oNRkl1udHhaj+sz
 q6mC4Rtww3pshDwnwQsudhyd8XRrZT3M/sc+E1+6+I8KMEVnCKpkMv8q/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="344357398"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="344357398"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 21:05:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="860024196"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="860024196"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 21:05:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Sun,  2 Apr 2023 21:05:32 -0700
Message-Id: <20230403040533.3079812-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] CI: Try to get ADL working
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

---
 drivers/gpu/drm/xe/xe_guc_log.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 2d25ab28b4b3..480c8b246a8a 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -10,15 +10,10 @@
 
 struct drm_printer;
 
-#if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
-#define CRASH_BUFFER_SIZE       SZ_1M
-#define DEBUG_BUFFER_SIZE       SZ_8M
-#define CAPTURE_BUFFER_SIZE     SZ_2M
-#else
 #define CRASH_BUFFER_SIZE	SZ_8K
 #define DEBUG_BUFFER_SIZE	SZ_64K
 #define CAPTURE_BUFFER_SIZE	SZ_16K
-#endif
+
 /*
  * While we're using plain log level in i915, GuC controls are much more...
  * "elaborate"? We have a couple of bits for verbosity, separate bit for actual
-- 
2.34.1

