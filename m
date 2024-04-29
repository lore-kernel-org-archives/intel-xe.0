Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C856C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 16:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A4610EAFE;
	Mon, 29 Apr 2024 16:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J35OYt91";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A8310E82D;
 Mon, 29 Apr 2024 16:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714408162; x=1745944162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZND1thzlY+Ba5ASnhqGZyzFrmiJR8faoYhKqZaVKG1c=;
 b=J35OYt91biteEGTwbB9twDdYqB82dEa8VXcpKT5oixS9O9ROwg5h31wP
 QKL049JTpe8A2iXBD8zcxQJTVMvgep5f3kAmkPuNEFIN85XGTQLB4ZDIc
 2AdMs6iQAqWgkrwkMf+xCuGm0Xf7CGIlCOBw+TcMa8jSoZiAQD+XKVqTW
 wAqBp8wxQ0+vDRaarv9iwbEg3r/2AHnmckmRk8jwEU17IadC1vP/b1Gj1
 1/ArJmjRjjmwSqPsUaSlJo+jbtLlRamFEkG6g/edsZNpvtsZ68OcHGBtk
 Ni2AWfSye4/E8CCVwDWPXs1DBSh6rWiaZ46RPwISlcKo2CZymEQxbOA/b g==;
X-CSE-ConnectionGUID: ePUF8MglSpuZCdEPFjflUQ==
X-CSE-MsgGUID: bk0KkcbPQiqwvJSaTWEiXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10235682"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="10235682"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 09:29:21 -0700
X-CSE-ConnectionGUID: yikJz1hbQqe6QdDR2paypw==
X-CSE-MsgGUID: 4twqwpWzSCiKXYy0wfe7BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="30641915"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 09:29:21 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe_ggtt: No need to use xe_pm_runtime_get_noresume
Date: Mon, 29 Apr 2024 09:29:15 -0700
Message-ID: <20240429162915.1831945-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Switching from xe_device_mem_access_get/put to xe_pm_runtime_get/put
results in the following WARNING in xe_oa:

[11614.356168] xe 0000:00:02.0: Missing outer runtime PM protection
[11614.356187] WARNING: CPU: 1 PID: 13075 at drivers/gpu/drm/xe/xe_pm.c:549 xe_pm_runtime_get_noresume+0x60/0x80 [xe]
...
[11614.356377] Call Trace:
[11614.356379]  <TASK>
[11614.356381]  ? __warn+0x7e/0x180
[11614.356387]  ? xe_pm_runtime_get_noresume+0x60/0x80 [xe]
[11614.356507]  xe_ggtt_remove_node+0x22/0x80 [xe]
[11614.356546]  xe_ttm_bo_destroy+0xea/0xf0 [xe]
[11614.356579]  xe_oa_stream_destroy+0xf7/0x120 [xe]
[11614.356627]  xe_oa_release+0x35/0xc0 [xe]
[11614.356673]  __fput+0xa1/0x2d0
[11614.356679]  __x64_sys_close+0x37/0x80
[11614.356697]  do_syscall_64+0x6d/0x140
[11614.356700]  entry_SYSCALL_64_after_hwframe+0x71/0x79
[11614.356702] RIP: 0033:0x7f2b37314f67

There seems to be no reason to use xe_pm_runtime_get_noresume in xe_ggtt
functions. Just use xe_pm_runtime_get.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0d541f55b4fc..8548a2eb3b32 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -404,7 +404,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
-	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
 					  alignment, 0, start, end, 0);
@@ -433,7 +433,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 			 bool invalidate)
 {
-	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_get(tile_to_xe(ggtt->tile));
 
 	mutex_lock(&ggtt->lock);
 	xe_ggtt_clear(ggtt, node->start, node->size);
-- 
2.41.0

