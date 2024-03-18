Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B67C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 16:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C8010E8C4;
	Mon, 18 Mar 2024 16:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfvA55Dx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D532910E5B8
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 16:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710781052; x=1742317052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RypySymnMl2CElqUAyU08Wvl1GVlE4m2GAtOJEqbEJU=;
 b=BfvA55Dx+NtNYbVc3N+TY1CMIiY5qTycFSnfaG/LPSeIkeKFSApYpT7M
 luD63U+0sYwaunNidlyqkOOwRlf0NGw/PvYnpPr25mOwlofG7u0wz+OKF
 CdIrD1nvSzMjgCDO7BgrqZjO70DVXKoHdNlo2xJsbLAF7HgRPOIquPjwK
 SPBgIDLn0QJcX7uKA2ZFRN/GRQ/x2D7Kwn/CxM9lnxJsygHmNyIETP4BZ
 4WwR08ZZMfUGGjAOwA0izMZZOemwOaxeouNGTOVu9ZL0ZNcyaRaIxxQ5Z
 Rt7acUG9Sf26/Q+Wp3hXwn23YjCHmvr2gt96wY8QMHPYuRgxotZQ3lHp5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5441789"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5441789"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 09:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="44579574"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 09:57:30 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Add a WARN_ON for NULL job in
 xe_sync_entry_signal
Date: Mon, 18 Mar 2024 17:43:42 +0100
Message-ID: <20240318164342.3094-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240318164342.3094-1-nirmoy.das@intel.com>
References: <20240318164342.3094-1-nirmoy.das@intel.com>
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

Add a warn for NULL job when sync->type is
DRM_XE_SYNC_TYPE_USER_FENCE. This should be a programming
error and should never happen so warn and let the kernel crash
if that ever happens.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 02c9577fe418..247505c3478d 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -255,6 +255,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
 			dma_fence_put(fence);
 		}
 	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
+		XE_WARN_ON(!job);
 		job->user_fence.used = true;
 		job->user_fence.addr = sync->addr;
 		job->user_fence.value = sync->timeline_value;
-- 
2.42.0

