Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E63CCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 15:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2379A10EC4E;
	Fri, 10 Oct 2025 15:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3Pe1nsf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC9710EC4E
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760109918; x=1791645918;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sZDarCMUtUqwsT82QNeknwLpUYi4szN1lMmG9GVf/3s=;
 b=e3Pe1nsfrnXGyV5TdI62v/lVBoUGhDxjA5bOH1h4v+nfPET3c9r6TDDo
 DJrQmLQTeweHuEqRepA7xaxpvJKYH007c11BcTqyjWl0KJxxcxke6RVxU
 z4FRc6V2eYwINr3d/GJCMhrZKojU8H4Vv/N9mK1BKH2qGHtrSDQVasTAl
 VdkKz/UrhRWXVsODYG9pHBMq3W3L2NH08B3ciXwI1q3JA9QAEGrN3IN1c
 ZxQ8PePi6s+uBA7jBroNF1aeRfz5zfVHyyKI10HgxduFtEotWEfhIcsqy
 c2kHcxg9KgHohXIqYYpVCmg3SHA9iTdiL1VdGZJC4vNZEKxGzj+diA+JL A==;
X-CSE-ConnectionGUID: 0DwBNNpJR1CTLq5s68zVhQ==
X-CSE-MsgGUID: oEEFdR35QX209YsGKI4AEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="61362426"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="61362426"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 08:25:18 -0700
X-CSE-ConnectionGUID: U9wKQ016QwqNHbDO9zZR9Q==
X-CSE-MsgGUID: OLfNWs6uTJqTcuTtIG151g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="211948851"
Received: from abityuts-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.153])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 08:25:17 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/evict: drop bogus assert
Date: Fri, 10 Oct 2025 16:24:58 +0100
Message-ID: <20251010152457.177884-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
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

This assert can trigger here with non pin_map users that select
LATE_RESTORE, since the vmap is allowed to be NULL given that
save/restore can now use the blitter instead. The check here doesn't
seem to have much value anymore given that we no longer move pinned
memory, so any existing vmap is left well alone, and doesn't need to be
recreated upon restore, so just drop the assert here.

Fixes: 86f69c26113c ("drm/xe: use backup object for pinned save/restore")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6213
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_evict.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 1a12675b2ea9..7661fca7f278 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -191,7 +191,6 @@ int xe_bo_evict_all(struct xe_device *xe)
 
 static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
 {
-	struct xe_device *xe = xe_bo_device(bo);
 	int ret;
 
 	ret = xe_bo_restore_pinned(bo);
@@ -210,13 +209,6 @@ static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
 		}
 	}
 
-	/*
-	 * We expect validate to trigger a move VRAM and our move code
-	 * should setup the iosys map.
-	 */
-	xe_assert(xe, !(bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE) ||
-		  !iosys_map_is_null(&bo->vmap));
-
 	return 0;
 }
 
-- 
2.51.0

