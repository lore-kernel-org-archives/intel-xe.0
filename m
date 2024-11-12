Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12A8D42BAC
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 16:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873F810E27C;
	Tue, 12 Nov 2024 16:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNBbbovk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D9610E27C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731428938; x=1762964938;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pOVFdoX3ulHpIm1jNjxVJrGgtQT39JIvGrtrwxVvTn4=;
 b=kNBbbovktNU0G2OjVto0zY1nTFmsHomw10cMLUNKA+6nk/usb3KhhX18
 WXVX9T9KZJqzdkUTsDsOp5H6gAiIXtpOkbniNCCLb4oa9uBuFFsQRNe2k
 zUaCSJ5F1Vtn78LaPC0cLBL5fo1eDy0zhAGPQmERrFPF/cRUBmwqCL+Me
 Ryy/WzVfdfVl/RDNtOUmVMoHmEB+A6xABfggZDEeQbUsGnZwxI+NPQXVc
 hevW1hP7qJScs4JUY33k2cM2cWzCG157iiZWRDi2D5hRScuGAprR9e9oi
 sNsF+sa6UAOO1OhROH5KBbgFlW/ROKJi7u5sw6NMsmg0FcMgZeEFnWCFM Q==;
X-CSE-ConnectionGUID: pXmbFcYRReCz6A8LnAoEig==
X-CSE-MsgGUID: 1NvSK9jpTQGUBSiqPVsWEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="18885806"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="18885806"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 08:28:57 -0800
X-CSE-ConnectionGUID: JgTfpxVVTHOUQiW4HQ5zJA==
X-CSE-MsgGUID: SKKfsjRESfutujfplQM3Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="91580629"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.231])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 08:28:56 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/xe: handle flat ccs during hibernation on igpu
Date: Tue, 12 Nov 2024 16:28:28 +0000
Message-ID: <20241112162827.116523-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.0
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

Starting from LNL, CCS has moved over to flat CCS model where there is
now dedicated memory reserved for storing compression state. On
platforms like LNL this reserved memory lives inside graphics stolen
memory, which is not treated like normal RAM and is therefore skipped by
the core kernel when creating the hibernation image. Currently if
something was compressed and we enter hibernation all the corresponding
CCS state is lost on such HW, resulting in corrupted memory. To fix this
evict user buffers from TT -> SYSTEM to ensure we take a snapshot of the
raw CCS state when entering hibernation, where upon resuming we can
restore the raw CCS state back when next validating the buffer. This has
been confirmed to fix display corruption on LNL when coming back from
hibernation.

Fixes: cbdc52c11c9b ("drm/xe/xe2: Support flat ccs")
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3409
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_bo_evict.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index b01bc20eb90b..8fb2be061003 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -35,10 +35,21 @@ int xe_bo_evict_all(struct xe_device *xe)
 	int ret;
 
 	/* User memory */
-	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
+	for (mem_type = XE_PL_TT; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		struct ttm_resource_manager *man =
 			ttm_manager_type(bdev, mem_type);
 
+		/*
+		 * On igpu platforms with flat CCS we need to ensure we save and restore any CCS
+		 * state since this state lives inside graphics stolen memory which doesn't survive
+		 * hibernation.
+		 *
+		 * This can be further improved by only evicting objects that we know have actually
+		 * used a compression enabled PAT index.
+		 */
+		if (mem_type == XE_PL_TT && (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe)))
+			continue;
+
 		if (man) {
 			ret = ttm_resource_manager_evict_all(bdev, man);
 			if (ret)
-- 
2.47.0

