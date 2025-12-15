Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B749D5B857
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 17:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1A910E173;
	Mon, 15 Dec 2025 17:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezKSdZyq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9347310E173
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 17:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765818287; x=1797354287;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0IemRM4j2pbSfJLL6k+djmsIiG9uj/pNYspYV7YEUkE=;
 b=ezKSdZyqvun+Dtaz3HRvLHErS9ik9NDSj66hHRnjSwy0mSZBIDEsUtWx
 ZVLn15OAiNmJJVxvMaMgGt0fHbjw5kx/3ZozsWxwdHV8w9CzKLNKzSRSV
 liRXb0YHLtFsHVJ7/5BFMh0UxWgeWM/Ll1pBzkoCcaA0brZzfNi0Bxyda
 qRqcV3RJEz9QMFIVw2R+8ZIaz0dS/kXrrcKkNtek0U8rKfOCwln5OUASz
 bk1sUWHqKPBDY3ApuShej2LfdDkJp32RotL/r3lzisd1eTMwyKggZ4pDH
 RkauSSClgi12j/CRbVaHXDxw/LYNqJI9zBpYtNBPfA3U1tjFIkA6JfjSz Q==;
X-CSE-ConnectionGUID: iwWb+ZDFTyGWDr9umsQDRQ==
X-CSE-MsgGUID: deJjp3BzRIC0nd2QFdGLfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79182809"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="79182809"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:04:47 -0800
X-CSE-ConnectionGUID: U9VoiWXeT7GIla4qppPE8Q==
X-CSE-MsgGUID: nm1oKipCQWG6GeKXiqedEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197769523"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:04:45 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Brian Nguyen <brian3.nguyen@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe/guc: Fix version check for page-reclaim feature
Date: Mon, 15 Dec 2025 18:04:33 +0100
Message-ID: <20251215170433.196398-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Page reclamation interfaces were introduced in GuC firmware version
70.31.0 (which corresponds to GuC ABI version 1.14.0), but since this
feature is also available for the VFs and VFs don't know the firmware
version, use GuC compatibility version check instead.

Fixes: 77ebc7c10d16 ("drm/xe/guc: Add page reclamation interface to GuC")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 7daae3294665..09ac092c3687 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -768,7 +768,7 @@ int xe_guc_init(struct xe_guc *guc)
 		return 0;
 
 	/* Disable page reclaim if GuC FW does not support */
-	if (GUC_FIRMWARE_VER(guc) < MAKE_GUC_VER(70, 31, 0))
+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 14, 0))
 		xe->info.has_page_reclaim_hw_assist = false;
 
 	if (IS_SRIOV_VF(xe)) {
-- 
2.47.1

