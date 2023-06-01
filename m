Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988C7C87FE7
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 00:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B608C10E52C;
	Thu,  1 Jun 2023 00:04:18 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852D110E1F0
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 00:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577854; x=1717113854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IKRvsPtB2rEFah1k9R/rXrG1cU7Idf1Ouq8rOu5SiUc=;
 b=Fl7/pkfXimcvfy1Kbj+c8TWKgQn+jFELzaPH7uMztAw9T+Qj9vfc+eLz
 QyYXxWHR5QobKvsjykFRlw01uLR2F6fthWMwfSr+SdtucyC6PpS8xDMoF
 pecBOYGY+1J2lf+yDlEdzIIqurOt1ZJVZrOCy2ydHX5UZO49JrfUBGlxq
 LjRi4TbBA3T5typQocMxCeRbdnrryu5PA6O+Jc7XW8I0iM/k7WjF9glFd
 FEU3Ko78l6se/QgsT6IDQZxUkXVFSamtLy90HhywIhn3VzTAMmvIGrQKS
 J/0nlOQP7wFXuXuIyTC35uVepYitgARkZQsd75bBKzrKOCivrnN5Hl4dD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339996844"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339996844"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657556203"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="657556203"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 17:03:48 -0700
Message-Id: <20230601000403.432517-17-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601000403.432517-1-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 16/31] drm/xe: Drop vram_id
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
index 7fc91e7ec5a7..4cb4b5810f40 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -33,7 +33,6 @@ struct xe_subplatform_desc {
 
 struct xe_gt_desc {
 	enum xe_gt_type type;
-	u8 vram_id;
 	u32 mmio_adj_limit;
 	u32 mmio_adj_offset;
 };
@@ -275,7 +274,6 @@ static const struct xe_device_desc dg2_desc = {
 static const struct xe_gt_desc pvc_gts[] = {
 	{
 		.type = XE_GT_TYPE_REMOTE,
-		.vram_id = 1,
 		.mmio_adj_limit = 0,
 		.mmio_adj_offset = 0,
 	},
-- 
2.40.1

