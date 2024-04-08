Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F77EC67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 16:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21820112778;
	Mon,  8 Apr 2024 16:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Spe5/SwR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E1A112777
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 16:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712593754; x=1744129754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tf1i90WYf0FkApkRw24/buFnf9eZ3LKTAnm0ae7AYVM=;
 b=Spe5/SwRWuse6x3qgBAOj9kIeF3eozPS3ChIJH00AwvuB7W2gY9Xfhqj
 uE2Fg1gxqCPfsSxi0Ul8IByMzS6G2nxQ6jbd2xiWR8+AYCQdSrQsjYb1W
 pzNbbmZL2/ik1IvXmWdIcQElXB7dFNGfqmYQ880i1guUpWrZnPsfk7J3w
 awqTsWbMHTPCPGu66DCu7QUS/uspVrwz6l9/12A87og88V4dW7bgEPyUY
 aakCTcpkqT3+OCpBEFTNmOYjD0uAzDBV+jykK73yZd2k7vivkRgIlsch8
 pqHZ88fKg/IRIeABjRaB/1IEP2zsEdjOW7F7S7elwR4IajtcRTAUiJdbO g==;
X-CSE-ConnectionGUID: djV7LRLlSeGyOMiobNVUzg==
X-CSE-MsgGUID: lWQaoHm9SMijorHVXmD+dA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19024961"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208,146";a="19024961"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:29:14 -0700
X-CSE-ConnectionGUID: 12VWnwW6TJWUfIAKvYp4Hw==
X-CSE-MsgGUID: JXsAGrYjTKyL7S6b6b0Cog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208,146";a="24683487"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:29:12 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 05/11] drm/xe/bmg: Add BMG mocs table
Date: Mon,  8 Apr 2024 21:59:06 +0530
Message-Id: <20240408162916.3767771-10-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408162916.3767771-1-balasubramani.vivekanandan@intel.com>
References: <20240408162916.3767771-1-balasubramani.vivekanandan@intel.com>
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

BMG uses the same MOCS table as LNL.

Bpsec: 71582
CC: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index bff659d20062..4f836aeeabff 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -375,6 +375,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 
 	switch (xe->info.platform) {
 	case XE_LUNARLAKE:
+	case XE_BATTLEMAGE:
 		info->size = ARRAY_SIZE(xe2_mocs_table);
 		info->table = xe2_mocs_table;
 		info->n_entries = XE2_NUM_MOCS_ENTRIES;
-- 
2.25.1

