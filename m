Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789A9C54E67
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 10:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA9710E1C5;
	Thu, 14 Mar 2024 10:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXfhwiOT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FFE10E1C5
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710410909; x=1741946909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YZ8vKGOXHZ3LdF3moFZ3z76axHEkxDQX9TStg6IPS08=;
 b=RXfhwiOTlZqwWAMj1A5OEOi08/rQBD6XMHGz5+hSqQqtUTAobZRZhdia
 YKLlw5nSOZ2J6j7COWB9Kw/oidAkwqG8GiIg/2sFHrzARrLLKM/vOD+xS
 mncsxu8b64EVSwTxFdZ1zFekfFLmWlBB+t6h1ffiGDBCpf56mnsjgVRGB
 IPXKZvzo9KZr454szvAF/jJEHtBHPjCYzosZrLziJDXDfhfVv9EvCm+Ol
 NqM+LimXBhH0triQ1lmosrlxtqakbSjlBviPO5haeMAyTCrqBre0ZFEzu
 V82g6wjU/9NMnl6cOdfTYm/bCWZjYldkiYC1NVb1XsziDzW/yra7aQyU7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5346227"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5346227"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12127372"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:08:27 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 1/3] drm/xe: Fix out-of-bounds warning in
 vm_bind_ioctl_check_args
Date: Thu, 14 Mar 2024 10:54:40 +0100
Message-ID: <20240314095442.32153-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Modify how bind_ops is assigned and used within the for loop to
accommodate both array and single bind scenarios which should prevent
out-of-bounds access warning from static code analysis tool.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cbb9b8935c90..0b742d8d82a5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2839,15 +2839,16 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	}
 
 	for (i = 0; i < args->num_binds; ++i) {
-		u64 range = (*bind_ops)[i].range;
-		u64 addr = (*bind_ops)[i].addr;
-		u32 op = (*bind_ops)[i].op;
-		u32 flags = (*bind_ops)[i].flags;
-		u32 obj = (*bind_ops)[i].obj;
-		u64 obj_offset = (*bind_ops)[i].obj_offset;
-		u32 prefetch_region = (*bind_ops)[i].prefetch_mem_region_instance;
+		struct drm_xe_vm_bind_op *cur_ops = &(*bind_ops)[i];
+		u64 range = cur_ops->range;
+		u64 addr = cur_ops->addr;
+		u32 op = cur_ops->op;
+		u32 flags = cur_ops->flags;
+		u32 obj = cur_ops->obj;
+		u64 obj_offset = cur_ops->obj_offset;
+		u32 prefetch_region = cur_ops->prefetch_mem_region_instance;
 		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
-		u16 pat_index = (*bind_ops)[i].pat_index;
+		u16 pat_index = cur_ops->pat_index;
 		u16 coh_mode;
 
 		if (XE_IOCTL_DBG(xe, pat_index >= xe->pat.n_entries)) {
@@ -2856,7 +2857,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		}
 
 		pat_index = array_index_nospec(pat_index, xe->pat.n_entries);
-		(*bind_ops)[i].pat_index = pat_index;
+		cur_ops->pat_index = pat_index;
 		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
 		if (XE_IOCTL_DBG(xe, !coh_mode)) { /* hw reserved */
 			err = -EINVAL;
-- 
2.42.0

