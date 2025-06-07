Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35784C61CE8
	for <intel-xe@archiver.kernel.org>; Sat,  7 Jun 2025 02:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DC810EBEC;
	Sat,  7 Jun 2025 02:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6JzwCbV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACC910EBF2
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Jun 2025 02:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749263741; x=1780799741;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rsju4aEuXStxACPO96scHm6eR0eHNbSJXfDnslGrIjo=;
 b=M6JzwCbVgkqRt3MZV4VTbK8DoL9MKLYnG8CeIiUkIq4M3IZ8AQJdPyvv
 VpvCUKr4eRxkV+62F56pGQMIWtSDm6RUm/IZCRNz5jVdfKyZSuJpPnrQc
 RjY2m21+O6sAobzDjnlDzRmbGS815QrHhBG7uvoym29v4pe80JepNnhPd
 +blQEq1HPmq6Z7uota6LzY+5sIhaATZiGvGMN5zZKcwRx542cWrGJy4NY
 Kg23TmajapyBiDkf47CnA7qKDgEAgXEEqRB6B3c8E//nbB0yKVUygiODG
 Js4y6cQo3CYUdfxARx87OKawPrUWfpbqnoRallB9201S75AI8HHUIJ8Kx g==;
X-CSE-ConnectionGUID: GjeMEy/AQmquObGyd+UrsQ==
X-CSE-MsgGUID: vS1rqZbNQDm6XeWnu4q9xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="62817816"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="62817816"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 19:35:39 -0700
X-CSE-ConnectionGUID: zuLsoo5sSAmu9DGy0ZaZIA==
X-CSE-MsgGUID: jQ5l7tHZRtK0Jqf54OX+eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="146335669"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 06 Jun 2025 19:35:38 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH] drm/xe/uapi: Correct sync type definition in comments
Date: Sat,  7 Jun 2025 02:34:42 +0000
Message-Id: <20250607023442.1236889-1-shuicheng.lin@intel.com>
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

DRM_XE_SYNC_FLAG_SYNCOBJ is renamed to DRM_XE_SYNC_TYPE_SYNCOBJ.
DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ is renamed to DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.
DRM_XE_SYNC_FLAG_DMA_BUF is removed.

Fixes: dc787f8931af ("drm/xe/uapi: Split xe_sync types from flags")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Zongyao Bai <zongyao.bai@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 include/uapi/drm/xe_drm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 6a702ba7817c..5f1524f466a7 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -925,9 +925,9 @@ struct drm_xe_gem_mmap_offset {
  *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM accepts
  *    exec submissions to its exec_queues that don't have an upper time
  *    limit on the job execution time. But exec submissions to these
- *    don't allow any of the flags DRM_XE_SYNC_FLAG_SYNCOBJ,
- *    DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ, DRM_XE_SYNC_FLAG_DMA_BUF,
- *    used as out-syncobjs, that is, together with DRM_XE_SYNC_FLAG_SIGNAL.
+ *    don't allow any of the sync types DRM_XE_SYNC_TYPE_SYNCOBJ,
+ *    DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ, used as out-syncobjs, that is,
+ *    together with sync flag DRM_XE_SYNC_FLAG_SIGNAL.
  *    LR VMs can be created in recoverable page-fault mode using
  *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE, if the device supports it.
  *    If that flag is omitted, the UMD can not rely on the slightly
@@ -1394,7 +1394,7 @@ struct drm_xe_sync {
 
 	/**
 	 * @timeline_value: Input for the timeline sync object. Needs to be
-	 * different than 0 when used with %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ.
+	 * different than 0 when used with %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.
 	 */
 	__u64 timeline_value;
 
-- 
2.25.1

