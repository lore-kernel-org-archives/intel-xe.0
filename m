Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C5BC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B8210E6BC;
	Wed, 30 Jul 2025 14:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nIERFgDD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1707610E6AE
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 14:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753886069; x=1785422069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ve+/DgZraWw2E7m3SVsLMfvtYQyzytYJqdhGm6ucZxU=;
 b=nIERFgDDhaNB0FlQ+o/NCIg6NA10Q9MGxYaSs46/xNer38P3Bkynvwtc
 N6MwJYDxK7ElFhXIVfyG4CNtMmzDvtSGZ0nnoH0ZwTm6Vb7U7OosNOdUk
 g+2+BtF+yUmuz5OGtqAfCdf8Rcn+N76q7weMaRZx6C9RvJSvOOoye4Dj8
 4L+f3I6M1TlbEFTomHXIOHiDBTwdZvUDR2oR+rhDMWbwWtPDrnZb8alIO
 542zR/NilTvHFDeuvT5PsnzLZjsMhvd4lA5BdliDF5w5BZqkyH3pLxzrP
 vscIHcue2S+TDo3rUgXX5G+Vi/LNj4QkAbYeFt+zMnbluRV2lKwaCC5ue A==;
X-CSE-ConnectionGUID: z5BBf5JQTYOwp0cUiTMJeA==
X-CSE-MsgGUID: mBWk+3wtSRq9iqZHCWlbTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56120609"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56120609"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:34:29 -0700
X-CSE-ConnectionGUID: CAeqnqlqS5Cv+45KP25IGQ==
X-CSE-MsgGUID: iEuEVEDVTdKeY3jGSK13yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167220638"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.102])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:34:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/3] drm/xe/migrate: don't overflow max copy size
Date: Wed, 30 Jul 2025 15:33:38 +0100
Message-ID: <20250730143335.174373-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730143335.174373-5-matthew.auld@intel.com>
References: <20250730143335.174373-5-matthew.auld@intel.com>
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

With non-page aligned copy, we need to use byte aligned pitch, however
the size itself might still be close to our maximum of ~8M, and so the
dimensions of the copy can easily exceed the S16_MAX limit of the copy
command leading to the following assert:

xe 0000:03:00.0: [drm] Assertion `size / pitch <= ((s16)(((u16)~0U) >> 1))` failed!
platform: BATTLEMAGE subplatform: 1
graphics: Xe2_HPG 20.01 step A0
media: Xe2_HPM 13.01 step A1
tile: 0 VRAM 10.0 GiB
GT: 0 type 1

WARNING: CPU: 23 PID: 10605 at drivers/gpu/drm/xe/xe_migrate.c:673 emit_copy+0x4b5/0x4e0 [xe]

To fix this account for the pitch when calculating the number of current
bytes to copy.

Fixes: 270172f64b11 ("drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index b6bdc9bd32b0..daca18b5b45f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2056,6 +2056,12 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 		else
 			current_bytes = min_t(int, bytes_left, cursor.size);
 
+		if (current_bytes & ~PAGE_MASK) {
+			int pitch = 4;
+
+			current_bytes = min_t(int, current_bytes, S16_MAX * pitch);
+		}
+
 		if (fence)
 			dma_fence_put(fence);
 
-- 
2.50.1

