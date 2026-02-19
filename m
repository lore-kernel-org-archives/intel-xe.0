Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AA5C531EA
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 23:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7499510E765;
	Thu, 19 Feb 2026 23:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVtUf3cx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCCB10E765
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 23:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771544372; x=1803080372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vAL/5or9ngVWHjIst5bX8LVaLtlV+NB838b48p4pfYI=;
 b=dVtUf3cxw3NYEQG17FCmtL83hgNeKx7mfFjCqT7sw1JouZWQa5gsKDdg
 y0ENLmlSJQWNrnjUOAeRpS7T3/3ZdrLnEDd+o5CQqy+Hc+L/aHxzX0b75
 un7n3m6faIe5omn+Jj8mOeSPgcus45il7KYa7nU+Hvyh6A5E5zqM9IYmF
 Scb3GNDrrezxaEA3x01Kf2rUNu8BY9gA2vhLqzlFMvM8Xh5mmyZnt7qmN
 y/p7dO/CiSDJRQxd7CEdLKsf5wd70sWvKR/90oZgEVBg9a3+TsLqRtj/h
 my0ikxhmGicgNL446Z3CWlsYjr9REooSKAiXNoQKoPbNQzRkUcZTAMh7D Q==;
X-CSE-ConnectionGUID: HsV5r5y7RXKpEXc8kQhcWA==
X-CSE-MsgGUID: Yjt0hTHTS3G4o8YsDlGLOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="60218625"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="60218625"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 15:39:32 -0800
X-CSE-ConnectionGUID: 1VAtZ3n0RyyJpX+vlXZr2w==
X-CSE-MsgGUID: 7XK7uTrTRxqhzKsI7aWTjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="243239595"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa001.fm.intel.com with ESMTP; 19 Feb 2026 15:39:31 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe/sync: Fix user fence leak on alloc failure
Date: Thu, 19 Feb 2026 23:35:19 +0000
Message-ID: <20260219233516.2938172-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260219233516.2938172-4-shuicheng.lin@intel.com>
References: <20260219233516.2938172-4-shuicheng.lin@intel.com>
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

When dma_fence_chain_alloc() fails, properly release the user fence
reference to prevent a memory leak.

Fixes: adda4e855ab6 ("drm/xe: Enforce correct user fence signaling order using")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index f03ab2e27284..52cefbd985ac 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -206,8 +206,10 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
 				return PTR_ERR(sync->ufence);
 			sync->ufence_chain_fence = dma_fence_chain_alloc();
-			if (!sync->ufence_chain_fence)
-				return -ENOMEM;
+			if (!sync->ufence_chain_fence) {
+				err = -ENOMEM;
+				goto free_sync;
+			}
 			sync->ufence_syncobj = ufence_syncobj;
 		}
 
-- 
2.50.1

