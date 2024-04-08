Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB77CD1292
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 17:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269401128C3;
	Mon,  8 Apr 2024 17:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dtH+rv52";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1781D1128B9
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595933; x=1744131933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tf1i90WYf0FkApkRw24/buFnf9eZ3LKTAnm0ae7AYVM=;
 b=dtH+rv52HaL522dTtY+mU6f83InOZUl0WV6bOKVjtFwgMRl8vyunR0QR
 s8xy4WuKLYl+/oB+gg2RFLdV7SFD0gr+AzKYhxwzP9yotT8l1vwFM5Ymm
 hT8dm/39ZhWYx5wVoyFLmiZ22RIQcYsZB5S0womUGziSoaPj9EQGdal5B
 9pbPm0hIiTz4QjLCykhxs6YTWv2yvkwzPH/UV+7zlYjfgFWLJUHZArqWG
 09ogb2kYCD6jYHoyf8+rmBCvevZYYQ/DqD/jYiaO7cP6XEv2+TGaLxGya
 NOIVkN76bhg3WvpLar3xNKggI+4AVyoewkbbkGOfTNhrqs9KcPrqKMvTA w==;
X-CSE-ConnectionGUID: RTatKkcPT0GXq1vqNTpdtw==
X-CSE-MsgGUID: BZNT5Ez6TGmVEh4Se8BlXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11679147"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208,146";a="11679147"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:32 -0700
X-CSE-ConnectionGUID: I4myq6MtS8iHLswKHGYNFg==
X-CSE-MsgGUID: iGc3W5PeTZu86cbyZdpvPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208,146";a="24733852"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:31 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3 04/11] drm/xe/bmg: Add BMG mocs table
Date: Mon,  8 Apr 2024 22:35:38 +0530
Message-Id: <20240408170545.3769566-5-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
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

