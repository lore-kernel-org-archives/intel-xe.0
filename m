Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C16C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 08:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A4F10E5D9;
	Fri, 16 Aug 2024 08:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGkMItaa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2393E10E5D9
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 08:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723796960; x=1755332960;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IBu0Y4tsQZVTHmdacNZqNMWPc/hrd/tmklQ43xUIeyw=;
 b=WGkMItaa+cSAnXUtu4WaXHIs3iYRFPovLIIzPJbNHgY0JBUZP8M48xpm
 Ogn+lo+PvcIQCGYmd9rqgSAAWZS1zeRJaVO7rNGDiw7FUkXq83+ML+SbR
 L6UI8cKsYKw4pwZRFRbp4XbJBPJny/DmdhfSsaPA6sd699jaGcwejf7DD
 PxSEv1FG6iYj4VItp2JRuG6QozQ/YBXJnWarH+DwNqCNoOhTYMIi732w5
 3SKQ5/9A+DDQnxmgUq/QUan/y5VRitVXjHbqBtXe6Mnv4sFzu5PvXGurG
 OLRvNHSS92bixPiAk0IH/SKs/+jETh9JN/VvY0HbY7Aig7+o96imBxGdF Q==;
X-CSE-ConnectionGUID: C/gKYHEZTt6LuLbz4169uA==
X-CSE-MsgGUID: KvcHfawZRImxDXJKMG0FJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="33474076"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="33474076"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 01:29:20 -0700
X-CSE-ConnectionGUID: ahjAab2zQg2uD/B46hwMVQ==
X-CSE-MsgGUID: DCFF08/eQZGzWauC7MH+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="59446252"
Received: from singhapo-nuc7i7bnh.iind.intel.com ([10.145.169.50])
 by orviesa010.jf.intel.com with ESMTP; 16 Aug 2024 01:29:18 -0700
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH] drm/xe: Remove a redundant NULL lrc->bo check as a lrc will
 always have a bo
Date: Fri, 16 Aug 2024 13:58:20 +0530
Message-Id: <20240816082820.897326-1-apoorva.singh@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Apoorva Singh <apoorva.singh@intel.com>

Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 974a9cd8c379..aec7db39c061 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1649,7 +1649,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	if (!snapshot)
 		return NULL;
 
-	if (lrc->bo && lrc->bo->vm)
+	if (lrc->bo->vm)
 		xe_vm_get(lrc->bo->vm);
 
 	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
-- 
2.34.1

