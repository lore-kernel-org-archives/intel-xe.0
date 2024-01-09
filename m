Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE113C47073
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 11:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8E510E429;
	Tue,  9 Jan 2024 11:24:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A311810E426
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 11:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704799482; x=1736335482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XTCgOXZGfTD8wfvC551LRNNp17NzH+xHdeJLEQc2I84=;
 b=hERq+SbOliR/mrtDS02qXOh5LE7l7J3HA+65yShOloEwPuCrTFI91mE9
 N8DU+Oj/ufi/6HYEDUNsYEgPTVkgINZ2Cc4esyLPOAhNgyPP4Agskbz7E
 2iLgCvJYVLLBEZv/Y4tuWN00eUzCqedDguVcILi9IZkcIADU1kb77EwTV
 QmlBfsZCUvZPGM/VaZo1O3e6s/mjHFv6+fsbAiOE3/9D3XsCSURAZoHjv
 pSd9AAwoexakdlY9EQYUbAsIOYFQUHTXvJyw15Lhksn8zmagTBv+wf7PS
 R7oXMpdj04/H4UmwQjkXbf7mSMXv7vevAAD72sGg5DzMZA+Y18ZjZ0u6w Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5537255"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="5537255"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:24:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="900737640"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="900737640"
Received: from djustese-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:24:34 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/4] drm/xe: Annotate xe_ttm_stolen_mgr::mapping with __iomem
Date: Tue,  9 Jan 2024 12:24:05 +0100
Message-ID: <20240109112405.108136-5-thomas.hellstrom@linux.intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The pointer points to IO memory, but the __iomem annotation was
incorrectly placed. Annotate it correctly, update its usage accordingly
and fix the corresponding sparse error.

Fixes: d8b52a02cb40 ("drm/xe: Implement stolen memory.")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index d2b00d0bf1e2..e5d7d5e2bec1 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -31,7 +31,7 @@ struct xe_ttm_stolen_mgr {
 	/* GPU base offset */
 	resource_size_t stolen_base;
 
-	void *__iomem mapping;
+	void __iomem *mapping;
 };
 
 static inline struct xe_ttm_stolen_mgr *
@@ -275,7 +275,7 @@ static int __xe_ttm_stolen_io_mem_reserve_bar2(struct xe_device *xe,
 	drm_WARN_ON(&xe->drm, !(mem->placement & TTM_PL_FLAG_CONTIGUOUS));
 
 	if (mem->placement & TTM_PL_FLAG_CONTIGUOUS && mgr->mapping)
-		mem->bus.addr = (u8 *)mgr->mapping + mem->bus.offset;
+		mem->bus.addr = (u8 __force *)mgr->mapping + mem->bus.offset;
 
 	mem->bus.offset += mgr->io_base;
 	mem->bus.is_iomem = true;
-- 
2.43.0

