Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B280C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 04:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A6410E573;
	Fri, 16 Aug 2024 04:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cl4aJYqC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C02610E573
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 04:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723780876; x=1755316876;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wIXc4mNMINB6s0ktgXdpNdmwDJJWqShMMAnFEUU4B3c=;
 b=cl4aJYqC/xacCkHXRF6gh0X8k8U65/9rSLVOPu0XFVkWS0B4WXa2Z/7v
 Jb9h2vnEvHDOzaF8hPHKVo9wUY7p0JRH4vA7SHT16gfh0tiIfopjcSj1c
 HyMWntNQn2e/k/5ZuS+4Fx7Gqy/pLggob6aklYLQDZPYG181Aj5S2O6/9
 HLOhM40P0ahsm/hozuxewZFs9XgAdO3b2X57H/nqvu8h3RnHTiqivBt0s
 k+XQrgSTrJFSe4UghCjkwF3GCoIB3yvVA1j0RrVQKO2gYRfzeYK0UMjUz
 YtIeUwQ4xQk+CS5hfwojSpykzrCHyf1NtSR+1MoYGvZx2P6snpX7Uw2ZJ w==;
X-CSE-ConnectionGUID: MXT8fgERTU+fFO/yREljnA==
X-CSE-MsgGUID: UXpc3NceTlG9X6ZU5PB+Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="25867698"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="25867698"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 21:01:15 -0700
X-CSE-ConnectionGUID: Nj12rVsyRv+6lZKKVu8cAw==
X-CSE-MsgGUID: wFn/iIruTMysg8Y2hFmiyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="63742845"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 21:01:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Use for_each_remote_tile rather than manual check
Date: Thu, 15 Aug 2024 21:02:08 -0700
Message-Id: <20240816040208.62695-1-matthew.brost@intel.com>
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

Replace for_each_tile plus a check against primary tile with
for_each_remote_tile in tiles_fini. The latter macro does this for us.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f5bdb540e823..3fd462fda625 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -29,9 +29,8 @@ static void tiles_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	for_each_tile(tile, xe, id)
-		if (tile != xe_device_get_root_tile(xe))
-			tile->mmio.regs = NULL;
+	for_each_remote_tile(tile, xe, id)
+		tile->mmio.regs = NULL;
 }
 
 /*
-- 
2.34.1

