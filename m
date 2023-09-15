Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3876ECD37AA
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 22:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108A310E6AB;
	Fri, 15 Sep 2023 22:35:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB55610E6AA
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 22:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694817316; x=1726353316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vbqHkDKbKdjRLz0q1B8oY6WrqMhYgpmWW8huoR8AoBo=;
 b=mry73YV+DgCm5T5IEROgtZr5Ecqntop1OmC7LVF1gZgBrG4cIAoY033A
 8OQ78DBq+ceLSjU3xV/rCrpW03Nf+wTis6ArrzsSsBT/36Zb0O79fZge6
 ilDF1gp91x4sCiLmETMqdWfTeZ1iMXmZ+1dZJI1TmjKpMkKj3uvHqfioW
 IHca4jDUS31ZgxaCCizSI+zb94H7m77XXTjKu36z1alv698JKqogiPIxC
 hsdSKcvun+nqutp/ivzuobGvX/ghR1/1B/XBMxDfu5QoCoxpSoh0IpYch
 x6Nl8pvO3BYYYVty8cdfKDP3KOvGWSSR3gEfUsJEg/rS3PscxPn7BAu6u A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="359603203"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="359603203"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 15:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="745156199"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="745156199"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 15:35:13 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 15:34:56 -0700
Message-ID: <20230915223459.2964036-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
References: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe/huc: HuC is not supported on GTs that
 don't have video engines
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

On MTL-style multi-gt platforms, the HuC is only available on the media
GT, so we need to consider it as not supported on the render GT.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index ff86b7d8633e..700c43fe287b 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -166,10 +166,19 @@ int xe_huc_parse_gsc_header(struct xe_uc_fw *huc_fw, const void *data, size_t si
 
 int xe_huc_init(struct xe_huc *huc)
 {
-	struct xe_device *xe = huc_to_xe(huc);
+	struct xe_gt *gt = huc_to_gt(huc);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = gt_to_xe(gt);
 	int ret;
 
 	huc->fw.type = XE_UC_FW_TYPE_HUC;
+
+	/* On platforms with a media GT the HuC is only available there */
+	if (tile->media_gt && (gt != tile->media_gt)) {
+		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_NOT_SUPPORTED);
+		return 0;
+	}
+
 	ret = xe_uc_fw_init(&huc->fw);
 	if (ret)
 		goto out;
-- 
2.41.0

