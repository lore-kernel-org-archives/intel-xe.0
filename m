Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02301CCFA1A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 15:29:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DB210E5FB;
	Tue, 11 Nov 2025 15:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYAD6/Ee";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3117110E5F9
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Nov 2025 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762874948; x=1794410948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sHV4YCriJE6MHGsGQWPgrOX/gNbP+xPxtR6RU0E9fDY=;
 b=bYAD6/EeX0xb1TQJjUoPgN0GTKDjEUin9fBfgFK2MREjybaMaAsMv3+J
 Quhs4W73bN20C2MoVwwv2TqlvRUFoWsB4IBiddYndFwoWjkR0Pt7X46gd
 Vd6fTdERyGF3gMqhCnULYjmmlMSG9BToYswGI4bF5J3W1KtN63LrTERvv
 ywwdCmO67iDir+uwrYlc+xSUV1xLGIBh6R6MLL/XNkhdwCwNbhPXM/7Qi
 YlMPeYGxNvhD0Y5/D1i2hbCGD/1CBudP16KV9PDM6dIazbg3MV1AayNIN
 RgCan6hBmxq7IU4NSY9+kIvAMlIT092FJXvc2QMZwaWn2e4Vmtj1XTE6K A==;
X-CSE-ConnectionGUID: mcuxtqrxQVik9Jb3C0fVBw==
X-CSE-MsgGUID: aJgMsxuJREeUm/RJzSLwoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64854869"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64854869"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 07:29:07 -0800
X-CSE-ConnectionGUID: f7ybnT3wTeaeyy5BxAvp3A==
X-CSE-MsgGUID: tQ2osJ4ERGCYOccNK9PqSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="212383820"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 07:29:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Jani Partanen <jiipee@sotapeli.fi>
Subject: [PATCH] mtd: intel-dg: Fix accessing regions before setting nregions
Date: Tue, 11 Nov 2025 07:28:25 -0800
Message-ID: <20251111-mtd-nregions-v1-1-61db61e78c63@intel.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251110-mtd-nregions-e9c66d5fcfae
X-Mailer: b4 0.15-dev-50d74
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

The regions array is counted by nregions, but it's set only after
accessing it:

	[] UBSAN: array-index-out-of-bounds in drivers/mtd/devices/mtd_intel_dg.c:750:15
	[] index 0 is out of range for type '<unknown> [*]'

Fix it by also fixing an undesired behavior: the loop silently ignores
ENOMEM and continues setting the other entries.

Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Reported-by: Jani Partanen <jiipee@sotapeli.fi>
Closes: https://lore.kernel.org/all/caca6c67-4f1d-49f1-948f-e63b6b937b29@sotapeli.fi
Fixes: ceb5ab3cb646 ("mtd: add driver for intel graphics non-volatile memory device")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/mtd/devices/mtd_intel_dg.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index b438ee5aacc34..114e69135b8d9 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -738,6 +738,7 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 
 	kref_init(&nvm->refcnt);
 	mutex_init(&nvm->lock);
+	nvm->nregions = nregions;
 
 	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
 		if (!invm->regions[i].name)
@@ -745,13 +746,15 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 
 		char *name = kasprintf(GFP_KERNEL, "%s.%s",
 				       dev_name(&aux_dev->dev), invm->regions[i].name);
-		if (!name)
-			continue;
+		if (!name) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
 		nvm->regions[n].name = name;
 		nvm->regions[n].id = i;
 		n++;
 	}
-	nvm->nregions = n; /* in case where kasprintf fail */
 
 	nvm->base = devm_ioremap_resource(device, &invm->bar);
 	if (IS_ERR(nvm->base)) {



