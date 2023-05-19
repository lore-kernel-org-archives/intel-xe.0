Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48594C7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB6310E4A5;
	Fri, 19 May 2023 23:19:58 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AAA10E632
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538331; x=1716074331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XpyN63J5s+hflQ+JT28+sp0RqRQTOGD/KIIesxyCpW8=;
 b=I8+xJstWllmBVBK5CHO+vNwlo73GlmZdzZuY1nEyvU4wjoxUFjo68ctp
 BuN1NNlOGjiHI0SYM57xdnqwPhohAjnvF3Q3JhcR7Hm7Sziu7pO/v02T1
 0pZNEk1DfreSfndGkYVrMKCeEZEaOqgDWX6WTD9xD6onOcZAdupPqROY3
 Pfo+kj2Ufw7u8+kAVMqN5sa97+Xfza2jiKpsfUmtpSvfNQ/DCtPOjD/Ij
 P7xM4X4EAnl/meCzgY3cbVfDP6ZZmyufsM5aqRKm+8kOpnz1WseoAL+7T
 qZF2zeqaeoKwMg0idRQA8BkXgwRXJHEY7paj37KrSoA3DEuq0WAhZyiqu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526367"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526367"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888728"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888728"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:12 -0700
Message-Id: <20230519231827.3572452-16-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 15/30] drm/xe: Drop vram_id
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The VRAM ID is always the tile ID; there's no need to track it
separately within a GT.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 0269327b26e9..b406f33d115c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -34,7 +34,6 @@ struct xe_subplatform_desc {
 
 struct xe_gt_desc {
 	enum xe_gt_type type;
-	u8 vram_id;
 	u32 mmio_adj_limit;
 	u32 mmio_adj_offset;
 };
@@ -276,7 +275,6 @@ static const struct xe_device_desc dg2_desc = {
 static const struct xe_gt_desc pvc_gts[] = {
 	{
 		.type = XE_GT_TYPE_REMOTE,
-		.vram_id = 1,
 		.mmio_adj_limit = 0,
 		.mmio_adj_offset = 0,
 	},
-- 
2.40.0

