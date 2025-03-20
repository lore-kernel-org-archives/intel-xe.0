Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C92C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 19:27:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA7410E69D;
	Thu, 20 Mar 2025 19:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEWiMuJD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DD710E69D
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 19:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742498848; x=1774034848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lBgRW4U/HQbN6GXIZDlQFCqdmy4at7d0XNP/fZJkHCs=;
 b=lEWiMuJDuS8WN+YrTXwJghLLdLuoRJ+eDZFLHk0KzTSOjTD0mNkRGwoh
 kYL/EqHc7JCHP/1GLKRlbUU5GkpPKgQfbOkIi4YivN31E29sWIM7NFLzA
 hJixL2BpKXvMeEqLUoRHRJ76duwAFxruEyWXh02GFZKbvvsoqgwAmjx3J
 Q4+dkghhiPTym5efy9Vcvu7ssY1DJUMzZjvE9SGQu1cvW6HSqfmXtmF6p
 k36sXxcbHhhb42ZjTUAtdb9SqwGx4YN8SCcnSRPJ3WzyDKRdn4Mm9cLq6
 MXRHgcWGgFjiCHZUGC30A5UgjMTGj3iiebd8my6iZWs72Ow0LbD7J9ZFU Q==;
X-CSE-ConnectionGUID: c+jIiMdqReGNBscIJ5CDQQ==
X-CSE-MsgGUID: rfH8ZpyMQsaMzj0V1CiFSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43678749"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43678749"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:27:23 -0700
X-CSE-ConnectionGUID: F6J/OWxDSQykwRWmhaz1IQ==
X-CSE-MsgGUID: HG85hqw2SmeHZ2JMjCBH5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123156819"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:27:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v3 5/9] drm/xe: Add cpu_caching to properties line in VM
 snapshot capture
Date: Thu, 20 Mar 2025 12:28:27 -0700
Message-Id: <20250320192831.3842138-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320192831.3842138-1-matthew.brost@intel.com>
References: <20250320192831.3842138-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add CPU caching to properties line in VM snapshot capture indicating
the BO caching properites. This is useful information for debug and
will help build a robust GPU hang replay tool.

The current format is:

[<vma address>]: <permissions>|<type>|mem_region=0x%x|pat_index=%d|cpu_caching=%d

Permissions has two options, either "read_only" or "read_write".

Type has three options, either "userptr", "null_sparse", or "bo".

Memory region is a bit mask of where the memory is located.

Pat index corresponds to the value setup upon VM bind.

CPU caching corresponds to the value of BO setup upon creation.

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 34bec27a5f45..94bf056da5b9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3859,7 +3859,7 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 	for (i = 0; i < snap->num_snaps; i++) {
 		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
 
-		drm_printf(p, "[%llx].properties: %s|%s|mem_region=0x%lx|pat_index=%d\n",
+		drm_printf(p, "[%llx].properties: %s|%s|mem_region=0x%lx|pat_index=%d|cpu_caching=%d\n",
 			   snap->snap[i].ofs,
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
 			   "read_only" : "read_write",
@@ -3869,7 +3869,8 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 			   "userptr" : "bo",
 			   snap->snap[i].uapi_mem_region == -1 ? 0 :
 			   BIT(snap->snap[i].uapi_mem_region),
-			   snap->snap[i].pat_index);
+			   snap->snap[i].pat_index,
+			   snap->snap[i].bo ? snap->snap[i].bo->cpu_caching : 0);
 
 		if (IS_ERR(snap->snap[i].data)) {
 			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,
-- 
2.34.1

