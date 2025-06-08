Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B31C5AD49
	for <intel-xe@archiver.kernel.org>; Sun,  8 Jun 2025 23:02:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0481C10ECD3;
	Sun,  8 Jun 2025 23:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCy79vpe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3837D10ECD3
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Jun 2025 23:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749423748; x=1780959748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EJbvdQF8SgGS/AnY+5BXYNG87qNTpVBBhiBBFlbiknQ=;
 b=bCy79vpezsSfVHE7aE5TlC8HaB3mp4hXt4LhkZTZiqLwhOw8E5NJQCFP
 Y2RRhE2y0wh5shWXFofMP6q7WpazZ7BM3k8xF9YTymh9XbH1ZF6x0RF/6
 ZETiD1U77g6KoWodCWJTkpbsCAhTeVSZFaluhbPSvKB2KHgPUkzN2EZ3q
 5NleXitPi4JaskC5rIiOAF2xe/aBhfLhlpuy+lLftcN/XLpm/tAT8pm4u
 XWPvMs22YN9tAZhiVL86LNvBOhTLzfJxrQt1DrgWN2UicfXr/18E7QX0a
 pG3vyUl1l4QI8O9RO6WeNRYmA88toA04FT6fdPlT9VpbSMkk03eEph8sQ A==;
X-CSE-ConnectionGUID: H9BsNDvUQcKo0kKG6Jr5lw==
X-CSE-MsgGUID: 2AQnYjEaT7SOxzFHvHTGHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51204017"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="51204017"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2025 16:02:28 -0700
X-CSE-ConnectionGUID: TiWVgY4BQ/6C3bcUhRyWgQ==
X-CSE-MsgGUID: /13SOG2IRs+6thodsumB3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="151591719"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa005.jf.intel.com with ESMTP; 08 Jun 2025 16:02:27 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v2] drm/xe/uapi: Correct sync type definition in comments
Date: Sun,  8 Jun 2025 23:01:33 +0000
Message-Id: <20250608230133.1250849-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250607023442.1236889-1-shuicheng.lin@intel.com>
References: <20250607023442.1236889-1-shuicheng.lin@intel.com>
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

Commit 37d078e51b4c ("drm/xe/uapi: Split xe_sync types from flags") renamed some DRM_XE_SYNC_*
defines but later commits kept using the old names. Correct them with the new definition.

v2: correct fixes tag and update commit message to explain why (Lucas)

Fixes: 9329f0667215 ("drm/xe/uapi: Use LR abbrev for long-running vms")
Fixes: 4b437893a826 ("drm/xe/uapi: More uAPI documentation additions and cosmetic updates")
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

