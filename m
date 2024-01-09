Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AE5C47073
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 11:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E69510E415;
	Tue,  9 Jan 2024 11:24:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADF710E0E4
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 11:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704799477; x=1736335477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zp1v5KSrYQnWDyTcS8FiOKqe7oCfi7/Uxfi/ZTHg508=;
 b=QMqylwfy/EY9UlfI4Zn4GWJ7AgoDseNYTmraFeHl/K14s1xzGVxl9T6W
 Ss50TkMxAqTVyVZeuAEFgbuHeRT5OSxDuE9mlfCSC9+7XhBU2It3dS2K6
 BOUjkWfbAJegb77I+llOuomangp1Aff9WCpCJ6HBcQU/oyK/kEZURvxWX
 dROf1rVZGNZTtxnrVHEbN/ZICdljPyCmHh6XyAOjdGE1fURUjxNc4uYml
 GI27RQ3z718gEOv6vmsgxLXZLMghWxH3agK4dL61MsIKTASqjNwJCWqXC
 9xPcyDZohLUCvtaGXGGnx+rffsRY7CurDJg12iZYWhWHb1jXKujSPjZaW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5537215"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="5537215"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:24:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="900737607"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="900737607"
Received: from djustese-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:24:28 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/4] drm/xe: Use __iomem for the regs pointer
Date: Tue,  9 Jan 2024 12:24:02 +0100
Message-ID: <20240109112405.108136-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
References: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
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
Cc: Moti Haimovski <mhaimovski@habana.ai>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The regs pointer points to IO memory. Annotate it properly and
fix the corresponding sparse warning.

Fixes: a4e2f3a299ea ("drm/xe: refactor xe_mmio_probe_tiles to support MMIO extension")
Cc: Koby Elbaz <kelbaz@habana.ai>
Cc: Ofir Bitton <obitton@habana.ai>
Cc: Moti Haimovski <mhaimovski@habana.ai>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f660cfb79f50..c8c5d74b6e90 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -303,7 +303,7 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 	u8 id, tile_count = xe->info.tile_count;
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	struct xe_tile *tile;
-	void *regs;
+	void __iomem *regs;
 	u32 mtcfg;
 
 	if (tile_count == 1)
-- 
2.43.0

