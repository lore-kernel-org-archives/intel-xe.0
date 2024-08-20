Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7742C5320E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 08:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8491910E528;
	Tue, 20 Aug 2024 08:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6LHHpMN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B8010E525
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 08:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724143503; x=1755679503;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wANK5BAIxNn4/eXgrpWJiGLBvtU4aY4AQEPNttTfoPo=;
 b=K6LHHpMNeSkGpHrMJP9HMKuC10RaeJNjOVJVT0rfuLO94LUICRrkDq1b
 2jSHe/U+0OJ1CQ+AMRC10uXFwSzk+OkZc2u7O6gtcc24zJEAbbV/QOmnS
 olSv7GHfbBvtT0wlnm9pinNvYDmAZju0ppk2FNEs3OzkLqscNjCXloYcl
 IAfqpV5oe8VmNVLobAqsuQwmoq0ylnn7ohQi+qGMA0uY8maaZ+/FNgnul
 OpFjLLsy3K5FklobJQg0qgwtCy18c6oz4SjtQLHSiEbYeLQf3avYy8qVd
 n1T1372N4HXu94AaV/819bEfGw7/AG/gErjYg/9FsDftAjm7LKPnPn5Sr w==;
X-CSE-ConnectionGUID: pci7QeoCRsq2iBfKRMdo2g==
X-CSE-MsgGUID: fc6ihpyWSvCNVO8hr0Gnnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22606791"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22606791"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:45:02 -0700
X-CSE-ConnectionGUID: 2yrJTa1ARWSw4LIDba2XWA==
X-CSE-MsgGUID: CHtc2lFiRDuE7AVQuatWCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60701194"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa009.fm.intel.com with ESMTP; 20 Aug 2024 01:45:01 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 1/3] drm/xe: Remove extra dma_fence_put on
 xe_sync_entry_add_deps failure
Date: Tue, 20 Aug 2024 14:32:28 +0530
Message-Id: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
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

drm_sched_job_add_dependency() drops references even in case of error,
no need for caller to call dma_fence_put.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index ca826aeb41ea..a0675f57a398 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -206,16 +206,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
 {
-	int err;
-
-	if (sync->fence) {
-		err = drm_sched_job_add_dependency(&job->drm,
-						   dma_fence_get(sync->fence));
-		if (err) {
-			dma_fence_put(sync->fence);
-			return err;
-		}
-	}
+	if (sync->fence)
+		return  drm_sched_job_add_dependency(&job->drm,
+						     dma_fence_get(sync->fence));
 
 	return 0;
 }
-- 
2.34.1

