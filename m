Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810AAC54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 10:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFB610E607;
	Thu, 21 Mar 2024 10:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZYKJKNR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63BD10E607
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 10:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711016776; x=1742552776;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bHiRkzi84MwI42agIwogrnOuxZYmBAi5CxetPKyIZz0=;
 b=AZYKJKNRIkJquWReppfeXbiUYWwv81TqXx9EDvSjLEbOyOk6lmqKvLyl
 5R3G5SxBWnXVmsnMF7xrN2ZDUw5sXYY3RRVn3Ez/sYijz7X7WjUkUPPZY
 miKj6fDiOPNO+0ybeYXVCjo6bTHGTW5gBATmom3Wf4yXEtV+y55CBaTx/
 vQ/zfOviZpEiINugrQwhPOO+MtV4xVnBZO9Cr7/sLMDN3v3v4AbYqH2Jh
 yptSgYMwh0NKt+qO59t1UBnPV5VXoPtD8DxJYEH9DwG5Rx1O/m0zmRM3a
 zI1+ktRFtmvXHl9/bMO1lWE9pFc01rHO0gJxIp0sf7y/bConNb1LVZg7i A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6173327"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="6173327"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14496118"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa009.fm.intel.com with ESMTP; 21 Mar 2024 03:26:14 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/1] drm/xe: Use enum instead of hard coding
Date: Thu, 21 Mar 2024 16:09:28 +0530
Message-Id: <20240321103928.3310349-1-himal.prasad.ghimiray@intel.com>
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

Use DRM_SCHED_PRIORITY_KERNEL instead of hardcoded value 0.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
Coverity Reports "Parse warning (PW.MIXED_ENUM_TYPE)
1. mixed_enum_type enumerated type mixed with another type"

 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 10c6bb9c9386..1f712f4fc76a 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -63,7 +63,7 @@ static inline int
 xe_sched_entity_init(struct xe_sched_entity *entity,
 		     struct xe_gpu_scheduler *sched)
 {
-	return drm_sched_entity_init(entity, 0,
+	return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_KERNEL,
 				     (struct drm_gpu_scheduler **)&sched,
 				     1, NULL);
 }
-- 
2.25.1

