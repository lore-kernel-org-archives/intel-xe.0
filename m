Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47421CD128D
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 12:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECF710EFF7;
	Tue,  2 Apr 2024 12:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4XxJ1E0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F5310EEB8
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 12:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712062060; x=1743598060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MiabB3z+yhoAIg2iMTMfHuj6Y2ny3wQ/TYQVzxwcc08=;
 b=m4XxJ1E0IIh+4crLJ8wCJxYpAVTWzPamuK8KMw5Th/1mlQX1Bim1PCSx
 5OHR5PxOCDkqFdQ1JacMssUn7w5RJ2uOZSoduPvhcLLoK05BCDTiw0GOs
 YEIVLWpSR7V9gPb5pAevWB9lJEBzPmqPOTrPVdTS+DUc/IXJ0YgZokQNa
 4s0opk2KhfIKtM3gPgi/TRDaeRwvp0akyMzBJdgNM8FTgzAq+vOvug2Zf
 M+yNuVeRgU0OZLM0mg70TxVf9vGDdpCjAv4IZk+GaICUUwyouOxFyUYTh
 lWHLHAnwaTm/Fk+onX+Anv2STt+IiQc1MMOnW+DDzHORug6FQQlr28Tyo Q==;
X-CSE-ConnectionGUID: wQKu8sBqSDCbMbkACcQ9iw==
X-CSE-MsgGUID: kPN/ieOHTP+6+BWvZHVtZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7098079"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208,146";a="7098079"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:26 -0700
X-CSE-ConnectionGUID: KIq/sqDDRSesJQY1CVJ6bw==
X-CSE-MsgGUID: h7IHMeisQl2Gza8UxYmU1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208,146";a="18111184"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:25 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 04/11] drm/xe/bmg: Add BMG mocs table
Date: Tue,  2 Apr 2024 18:17:17 +0530
Message-Id: <20240402124724.1238122-5-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
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

