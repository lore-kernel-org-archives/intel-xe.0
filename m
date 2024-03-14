Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED99C54E67
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 10:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2187610FA17;
	Thu, 14 Mar 2024 10:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="En3VZGJH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62DB10FA17
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 10:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710410914; x=1741946914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oGuP6b4WAX35wMvBpddu3l1HcPH16Hj7iChfHJ1YizM=;
 b=En3VZGJHBkQ7KKhIiB8x0dAbR8E7+06EvYeETl9paomg62i7SSs1/dR7
 iXHSG95ManVLL9lJ83/5HCdWBWy/GDxJsgA4bSdcnTrt9Qnf1TzuHScU8
 Lumatfn/EPAsG6dDupHH1aAjqDzIiUHI9gvbnVNQp5Qx5QdcfHU0CiFGO
 VKokVHCNa5jK+81Idbc5v8tpgxLdPIh40NOwfCGtkwjhMx21em+Iam5v1
 lBHkXz6ufBcZA7h30IfvHJIiTMD84B3FV5VlMzc9XvyMrQFC4DwYP72R1
 iPSp7nz2HxcDHvOcd9FUJrEdkFtZFr0JcVCLz0fyMbzN86UtiR/K6wqPa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5346236"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5346236"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12127380"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:08:29 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 3/3] drm/xe: Warn on NULL job when user fence used in
 xe_sync_entry_signal
Date: Thu, 14 Mar 2024 10:54:42 +0100
Message-ID: <20240314095442.32153-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240314095442.32153-1-nirmoy.das@intel.com>
References: <20240314095442.32153-1-nirmoy.das@intel.com>
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

Added a check and warn for NULL job when sync->type is
DRM_XE_SYNC_TYPE_USER_FENCE to prevent potential crashes
and aid in debugging

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 02c9577fe418..fae466ba8e75 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -255,9 +255,13 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
 			dma_fence_put(fence);
 		}
 	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
-		job->user_fence.used = true;
-		job->user_fence.addr = sync->addr;
-		job->user_fence.value = sync->timeline_value;
+		if (job) {
+			job->user_fence.used = true;
+			job->user_fence.addr = sync->addr;
+			job->user_fence.value = sync->timeline_value;
+		} else {
+			XE_WARN_ON("NULL job passed with DRM_XE_SYNC_TYPE_USER_FENCE");
+		}
 	}
 }
 
-- 
2.42.0

