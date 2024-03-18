Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180E3C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 14:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF1C10E6EA;
	Mon, 18 Mar 2024 14:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YvyoeFLU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821F110E4AC
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 14:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710770630; x=1742306630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P75xuoAsQWw28tnIHD1mzvanWR2mYg7OOADPss09f30=;
 b=YvyoeFLU2oaFxynxfWe7gxY0iVcLsMC4GvSgnuVfxwRWkvag/thj8wuz
 U5WI7j2/jK63019rEhbWEsOf/wGurZbBRehUtxBlzSVFF1Y6K9Z0yPvQa
 YWZLGzC+8rQQ+ttbOMDfgZxgK3/zhiTQjYuioc7S06tgdfmW12Vy1mIJT
 D/R7fUemN123zjKfHRyTJ+izVM6zkk/jfgLUW5AbiOE2oAPgTYON8GaeW
 7FVqL3rIwa7C18p4aIQJBjt4f06w+vFgz09BuQppkDFUK0RdYEDAVuxZx
 oK7lezYp6Ms5uicS8h9BChakY2MorfHSqS/QQv7s213UMIJiEpn4L8SW4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="23098538"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="23098538"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="44410218"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:03:47 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe: Add a WARN_ON for NULL job in xe_sync_entry_signal
Date: Mon, 18 Mar 2024 14:50:00 +0100
Message-ID: <20240318135000.13032-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240318135000.13032-1-nirmoy.das@intel.com>
References: <20240318135000.13032-1-nirmoy.das@intel.com>
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
index 02c9577fe418..2b45950aa0af 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -255,6 +255,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
 			dma_fence_put(fence);
 		}
 	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
+		XE_WARN_ON(job);
 		job->user_fence.used = true;
 		job->user_fence.addr = sync->addr;
 		job->user_fence.value = sync->timeline_value;
-- 
2.42.0

