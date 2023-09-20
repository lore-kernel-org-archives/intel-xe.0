Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F21C27C7B
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 21:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9117B10E566;
	Wed, 20 Sep 2023 21:20:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623FD10E566
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695244855; x=1726780855;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JEMFar1EcpGToOFn5uLhfsiUO5LKXL3QcbonW9xDozQ=;
 b=AjjY3H36Jymli5lZG8ol8qumygmrNd2tGmC6SOMrwhh4b0xr2VhWmbM6
 CvhdcEjxFxZK28xmU7ssbs6mqpcz88NidLo2t+LCfQSK2spGcrZXvjlp2
 WlEGk6XaCkTeSsyDazx5vgWTA9LF7F9964NK8hfS2bgpnQWtx9HNuhwnC
 75eN3duM2NymGJgVyUCW9UbyLXn0sQXI86JCluXJSrs3qOq+g1Cqko5Fl
 ATNcX8INHEE9OkimMRvicDK0rOO6ao0g8lRvKeZHXGAL9oP10FfjS8SiH
 33MQIqWrGdxwrXOUvocpDwn44XVKRmLArBn8epD4MAQrxKMrYbf8UsIEy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="383088520"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="383088520"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 14:20:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="862156372"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="862156372"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 14:20:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 20 Sep 2023 14:21:02 -0700
Message-Id: <20230920212103.2145677-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Avoid overflow on shift left
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The current logic only works with the value read from the register being
up to 16 bits. We should also not be using bits other than
XELP_EU_ENABLE_MASK to define the EU fuses.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index a8d7f272c30a..011ad7f2325c 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -36,7 +36,7 @@ static void
 load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 reg_val = xe_mmio_read32(gt, XELP_EU_ENABLE);
+	u32 reg_val = xe_mmio_read32(gt, XELP_EU_ENABLE) & XELP_EU_MASK;
 	u32 val = 0;
 	int i;
 
-- 
2.40.1

