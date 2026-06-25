Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBD4CDB479
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 15:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798C110F30D;
	Thu, 25 Jun 2026 15:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IkHkKVbh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC7B10F30D
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 15:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782400874; x=1813936874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZKWLPY7Qsyd/OnBJGS6bJZMv5zpzrXuU0mc9Y+i8/6Y=;
 b=IkHkKVbhXvNpwXo/bJPOphbTveiBJdo1uibN0iX4pKS9vqO487Io0Mpd
 ldriEzCo03/99GSm0gATUlIIbKJ9B5Mx0M5A4CnX6Z2fdFSws4iOMKkjw
 Dz77aWtVmoRY5uOYX4nHq+TVptxb6CNKWUBTxuTTd7f7CKOHHxFYmVcq4
 b00td9ZLYvhp9omAokSRHt3Xm9Pt0ccuoqI0K1P10q+iis7tXrX+98xiV
 MpNqfMWiMEHW04V3Rfk8FTQzBEwsUI5vSslQP3BM2BoLBpjUr+M1ktEwG
 waXZv0fVzto+p4qzsCLd94w27OhlCEnWQH0UMq0gWcORujKrQdYwfOxav w==;
X-CSE-ConnectionGUID: rhxJLwd5QfyPdsFaQKvfVA==
X-CSE-MsgGUID: r5ckTY5WQTGTXmfElLhcfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94576336"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="94576336"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 08:21:14 -0700
X-CSE-ConnectionGUID: UWjg0fNGSW+7xPn7b4A5Dg==
X-CSE-MsgGUID: kx5pbxjbSsuQtBDTkTyF3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="249734590"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.127])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 08:21:13 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>
Subject: [PATCH 2/3] drm/xe: account for dontneed in fdinfo purgeable
Date: Thu, 25 Jun 2026 16:20:57 +0100
Message-ID: <20260625152054.450125-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625152054.450125-5-matthew.auld@intel.com>
References: <20260625152054.450125-5-matthew.auld@intel.com>
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

Now that Xe supports explicit madvise WILLNEED/DONTNEED states,
userspace can mark memory in any placement as eligible for purging.
Update bo_meminfo to also include any BO explicitly marked as DONTNEED
in the purgeable statistics, ensuring fdinfo accurately reflects all
memory offered up for reclamation.

v2 (Sashiko):
  - Also update the drm_print_memory_stats() so we don't mask out !=
    SYSTEM

Assisted-by: Copilot:gemini-3.1-pro-preview
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 81020b4b344e..e116fb562c4c 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -193,7 +193,7 @@ static void bo_meminfo(struct xe_bo *bo,
 		if (!dma_resv_test_signaled(bo->ttm.base.resv,
 					    DMA_RESV_USAGE_BOOKKEEP))
 			stats[mem_type].active += sz;
-		else if (mem_type == XE_PL_SYSTEM)
+		else if (mem_type == XE_PL_SYSTEM || xe_bo_madv_is_dontneed(bo))
 			stats[mem_type].purgeable += sz;
 	}
 }
@@ -273,8 +273,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 					       &stats[mem_type],
 					       DRM_GEM_OBJECT_ACTIVE |
 					       DRM_GEM_OBJECT_RESIDENT |
-					       (mem_type != XE_PL_SYSTEM ? 0 :
-					       DRM_GEM_OBJECT_PURGEABLE),
+					       DRM_GEM_OBJECT_PURGEABLE,
 					       xe_mem_type_to_name[mem_type]);
 		}
 	}
-- 
2.54.0

