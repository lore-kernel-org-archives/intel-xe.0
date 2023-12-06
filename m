Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB1BC54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 06:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930CE10F139;
	Fri, 22 Mar 2024 06:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZGOY4XT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DC810F139
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 06:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711089004; x=1742625004;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Khsyle4DNZRGntbIJ5zKmF0GVGwXRbZgntG0I2L/zHQ=;
 b=MZGOY4XTBzHKI8dxNTgsBhcphys2LTIMNngWJv3D6BvwdoxcAMOxUmKZ
 YlyD9gRdPa3QugW677IKuk6JJ4EH5mWQCzy+BHhnSN/DI4YXBz1q81xx2
 Ix29RDHY2/O0HJorL0r8dX36dK8x2LR6vODuRwB66OLwQvMNlyh3ZsnG4
 qeWHPhOFxBtvZboiYWTBNCDs5OqYvwf++qfyqLG5Hh9cXWDWBChkNnwdn
 JkENMaGRDNZXOYVHBZmF+5HHFbkdTZj4Q7jhqEZHITSPVRnmEnOsuMubZ
 50veHXkHeDOs/k2TAF4vrDpQvgJKQrO0K3U7eedSbB1TOz4oPQdwW+azf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6729772"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="6729772"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 23:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="14691787"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa010.fm.intel.com with ESMTP; 21 Mar 2024 23:30:02 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/ xe_sync: Check NULL before dereferencing
Date: Thu,  7 Dec 2023 04:00:27 +0530
Message-Id: <20231206223027.46588-1-krishnaiah.bommu@intel.com>
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

checking null pointer before dereferencing schedule job

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 02c9577fe418..3b977061bf9f 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -255,6 +255,9 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
 			dma_fence_put(fence);
 		}
 	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
+		if (!job)
+			drm_err(&sync->ufence->xe->drm, "No schedule job fond\n");
+
 		job->user_fence.used = true;
 		job->user_fence.addr = sync->addr;
 		job->user_fence.value = sync->timeline_value;
-- 
2.25.1

