Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36498C2BBCA
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 09:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B324410E0FA;
	Fri, 28 Jun 2024 09:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hFNUpHvm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C77410E0FA
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 09:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719565804; x=1751101804;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=llc1rQ8p5MRKVs/CzZk9BOqluOMQGvsztSgydjhkdKY=;
 b=hFNUpHvmFUYZk4TTcsEfzx4XPQ5k2mOh+I+0gzu75LVw4s8NVHIckL+1
 8OMcz0O1arSJce3EvGUyiAXPDGoLWJHNcsRG10hHB4HzqIX+UNQcW4lH2
 jDGONbrH+U+TC9oBOKe/edXqsVSAAG4fBlRnLHBGAKmc4aIEA056kIWqR
 j7+Q5c+QRw3XhourhvHp8pPjK8s8VjXlUZenJSULEftlz/y2BB1MwPMqZ
 aCA7Sz9RAvfTgghiZoWZ8G+FqFSACFHyUdqdGmMThoApyKeeJcfJtuP05
 rHBptd9cqG0UdMrm86i9KWakw/uaO5d9rk0tHveZxxJgUAjD4dXetKBI3 Q==;
X-CSE-ConnectionGUID: PjG2roZAQo2onS0I2G1ehA==
X-CSE-MsgGUID: ZIE33juISeaiVBrxgBXVpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16478305"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="16478305"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 02:10:03 -0700
X-CSE-ConnectionGUID: PZ10XfHeSRaLQTV7eKMMUw==
X-CSE-MsgGUID: bjR63l1TQeKcl4JGy90BoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="75416498"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 02:10:03 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Remove unused xe var in pf_get_threshold
Date: Fri, 28 Jun 2024 10:54:57 +0200
Message-ID: <20240628085457.21929-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Remove unused xe var which probably came for resolving a merge
conflict, commit 2817ef9704e7 ("Merge remote-tracking branch
'drm/drm-next' into drm-tip")

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index a5c9dfa1077c..694671497f6e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1785,7 +1785,6 @@ static int pf_get_threshold(struct xe_gt *gt, unsigned int vfid,
 			    enum xe_guc_klv_threshold_index index)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	struct xe_device *xe = gt_to_xe(gt);
 
 	return config->thresholds[index];
 }
-- 
2.42.0

