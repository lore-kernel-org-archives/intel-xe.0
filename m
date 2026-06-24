Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9EACDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 11:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8985310EED1;
	Wed, 24 Jun 2026 11:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YuqMjVcC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F97B10EEAD
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 11:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782301141; x=1813837141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cNHy02676o+Vrq4dGaHFXSZ24gMmqA6NOamYrdL30kM=;
 b=YuqMjVcCWVEhuDpWbmasFVHtc3oiTmU4zOeoou9u6wtXG9uibTmlu0ON
 /rCEcojaFAKX4ItCDGvPWy7gd7GT0q25pXh0/c9/a64nMu70uQNhU7H5F
 lKHSQW8yzuIKxuDN+fF/ixujZuwIiQBaaAkVdjIi6Az9xpUN3O1TWJaYY
 JTu8IZN44INWGJ7iXguB/0ySjCPsiTb9SDT8drMZn1yBUMdomMh4VwmzS
 YSlllZKps3l//i6SBINDzhkFRwjLNSjelEIGXKT5GQFvnXfCOmDCgeiMU
 sudTy5C5OQEdTUxVz0EZAaGWlJLjJSj5/Z7CYZOs2pJNvhTNL/IemiF/Q g==;
X-CSE-ConnectionGUID: l14P5+FQReqtbltLjxoqLg==
X-CSE-MsgGUID: UoyniYSKQsqdlqYE7dnPlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83109452"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83109452"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:39:01 -0700
X-CSE-ConnectionGUID: zivRJ/lJQTGMQ+QU5+UUcQ==
X-CSE-MsgGUID: BwCsUYl5QlC+6LAgu89cgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="243443573"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.217])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:38:59 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>
Subject: [PATCH 2/2] drm/xe: account for dontneed in fdinfo purgeable
Date: Wed, 24 Jun 2026 12:38:40 +0100
Message-ID: <20260624113837.342961-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624113837.342961-4-matthew.auld@intel.com>
References: <20260624113837.342961-4-matthew.auld@intel.com>
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

Assisted-by: Copilot:gemini-3.1-pro-preview
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 34a34c7e4083..f8af2e84700b 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -188,7 +188,7 @@ static void bo_meminfo(struct xe_bo *bo,
 		if (!dma_resv_test_signaled(bo->ttm.base.resv,
 					    DMA_RESV_USAGE_BOOKKEEP))
 			stats[mem_type].active += sz;
-		else if (mem_type == XE_PL_SYSTEM)
+		else if (mem_type == XE_PL_SYSTEM || xe_bo_madv_is_dontneed(bo))
 			stats[mem_type].purgeable += sz;
 	}
 }
-- 
2.54.0

