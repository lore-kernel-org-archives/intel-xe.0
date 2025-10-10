Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8747CCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 16:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CC210E2B1;
	Fri, 10 Oct 2025 16:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hppzGPGZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301CB10EC55
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 16:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760113229; x=1791649229;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VKss1otG7/S0mPw9WQwc796IRbO+h353ncwmu3jqdUM=;
 b=hppzGPGZSvj4CTK2IgMI10UsuyegD+Xt3Sp9TRjsU2rzRBYxB+yv4zp+
 fItwz4Qu2KJYNnOHV9hO3dCL/MMjZ1S2wk8fZmS9aQmQrq+wB3Zaffxin
 cnUWhq/QXpeOC6P8YX/Jh3NlohoVLVLgpoM3THVKXGyzd+FDphZT+lOrE
 vXBgjWs253LV8asWRzBa7H7tbOVtZHGtJ8H4TWrJej0OX6LURfaOnHUIg
 rPrxh6uoWYkpFrxtUy0s0J9dYIV/zJLJ32JfPxeQHCdPGf3o3gf07Ry2c
 La1mWaXecmDqO/FWa4h6CeRHXMdG/gAdUDb+G0b+5Mr8ZJEBp0lG8CtKc g==;
X-CSE-ConnectionGUID: SmxrntzRR06+iKGns/YRfw==
X-CSE-MsgGUID: rpo6PlJ/SjOVsluldWLkfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66165706"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66165706"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 09:20:29 -0700
X-CSE-ConnectionGUID: P69ygGHCQ6e+DuHTv6nKSQ==
X-CSE-MsgGUID: qdqUgXi/RAi+KCyjX4R51A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="186147048"
Received: from abityuts-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.153])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 09:20:27 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/migrate: don't misalign current bytes
Date: Fri, 10 Oct 2025 17:20:21 +0100
Message-ID: <20251010162020.190962-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
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

If current bytes exceeds the max copy size, ensure the clamped size
still accounts for the XE_CACHELINE_BYTES alignment, otherwise we
trigger the assert in xe_migrate_vram with the size now being out of
alignment.

Fixes: 8c2d61e0e916 ("drm/xe/migrate: don't overflow max copy size")
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6212
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 7345a5b65169..7fbd346d8310 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2125,7 +2125,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 		if (current_bytes & ~PAGE_MASK) {
 			int pitch = 4;
 
-			current_bytes = min_t(int, current_bytes, S16_MAX * pitch);
+			current_bytes = min_t(int, current_bytes,
+					      round_down(S16_MAX * pitch,
+							 XE_CACHELINE_BYTES));
 		}
 
 		__fence = xe_migrate_vram(m, current_bytes,
-- 
2.51.0

