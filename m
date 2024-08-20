Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4807C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 17:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722B310E7F2;
	Tue, 20 Aug 2024 17:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFGoGfO4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A79810E7F2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 17:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174943; x=1755710943;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pvW7/+QePGBr8lDiQqDXHtexWWgbWGk+YkrV9ysMc2A=;
 b=dFGoGfO4+NwsRhnhR96bj4YbsQu2Nt7qQgeNPHpehkVlv7LJUjEnj+gV
 AmrKhu5mhm4qKe9dGlJ1kxCg+7/u2tsrjxJgITyGBJcb3+J9tnsArZZ01
 LEsHKU0/WyQFxurCHLa/zalqwxWpOSL95UVGCfMNFmquKiHt2BAvdrstv
 OMzdFX/xGplpofSFRSMlj86hfcjAkCpglCdb1n6fKwxmfIzfqd6fO9o5A
 uhXOmK90AtLEDCODnuLVmJo5Odw40H75C9smw6QrIsRJRhE+0Qavb69qk
 VKSGjRUT8mqdbLsccBR9WFFzHoCL7QUJghkHQ6YDYE+2RT3WC8n7ozJY+ w==;
X-CSE-ConnectionGUID: QP0o0rDlTRyBz95m1Z3hxw==
X-CSE-MsgGUID: Kp/IImn5S9+SKTbP0IeaHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26365496"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26365496"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:02 -0700
X-CSE-ConnectionGUID: P+Z0DSbiTiCw9T4EIwRBag==
X-CSE-MsgGUID: imdWfMUsQaGdMC2YKyQkOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65651739"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 5/6] drm/xe: Move HuC init before GuC init
Date: Tue, 20 Aug 2024 10:29:57 -0700
Message-Id: <20240820172958.1095143-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820172958.1095143-1-matthew.brost@intel.com>
References: <20240820172958.1095143-1-matthew.brost@intel.com>
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

The GuC fini, also fini the HuC so move HuC init first.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_uc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 0d073a9987c2..5b7d6f44a7de 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -36,6 +36,10 @@ int xe_uc_init(struct xe_uc *uc)
 {
 	int ret;
 
+	ret = xe_huc_init(&uc->huc);
+	if (ret)
+		goto err;
+
 	/*
 	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
 	 * to correctly move our tracking of the FW state to "disabled".
@@ -44,10 +48,6 @@ int xe_uc_init(struct xe_uc *uc)
 	if (ret)
 		goto err;
 
-	ret = xe_huc_init(&uc->huc);
-	if (ret)
-		goto err;
-
 	ret = xe_gsc_init(&uc->gsc);
 	if (ret)
 		goto err;
-- 
2.34.1

