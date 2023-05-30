Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4790BC87FDC
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B08310E43F;
	Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A4F10E43A
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481369; x=1717017369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kl/OcBzkWh+NXKj5z3fd/9GXdlw+YjBG9eF6sMccJSE=;
 b=Kclty2F7tNYThh8q2TOWXte8Fl9Ui+ahbrPyiJhkmRbDDAtlfLq4ao+0
 hF3eV0n7Kdy1Na3XHeYEVTjjq8RsXEayQQoanRgAs3d7nkf0Vk0wfcX7r
 suwOHJ61OrwIp3I665qWC+rpgIcWOdvGkMzggdxW7hNEQEAX4y93rkcCw
 3GfPJ8bedFeyp6F+d3RVIJYgtVWM/w65wfyuaB0HzR5u9NHwZBpo15ClE
 iXfYfqd1d8ScMN6IKtYRFsrGq3uqbv5/+Sll3WikdikzXrlZNjhkQhO4J
 48sHzp+X8pkNvlmS/bvn2ctfDKdSkbNQ/flxjK4pRa+oDCvy8zRZtRbN0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311951"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311951"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139437"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139437"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:34 -0700
Message-Id: <20230530211549.2632538-17-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 16/31] drm/xe: Drop vram_id
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
index ea3d69607d13..42e6fcb07c94 100644
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
2.40.1

