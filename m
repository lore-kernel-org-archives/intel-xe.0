Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC71C8300C
	for <intel-xe@archiver.kernel.org>; Sun, 11 Jun 2023 22:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B89510E14F;
	Sun, 11 Jun 2023 22:25:03 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7510C10E13B
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Jun 2023 22:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686522300; x=1718058300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f92WvFMxqKhtsdRrmbebo1TmdRj7CfT+vYgSYut4O+s=;
 b=XOMuTRz5oxRF5syL0iDvkas/u5kWwU5Xcn0KzHSxQixEU0e5BIzXz/7n
 Xyrkss+lxa1t25U2h480pwfSyfhFMLNoos2yrUi56tb27jfPb5deKDgla
 spDP/704eWh6K9dLXNXKSNx9E6lhrLsy55JITjlCKapEoOxScy9scRtA2
 nyshL9EXAkkhm18Nlll/wA1FQcecxk0zTF8dWYh7N8ElAJkm8SO6LCSEU
 Ye8YVrm4YFusabvoc7wmdl0SlU+9M7NT1qrW3GOGP54uzODP+H9448iyH
 WNSDjGlpb0f2RuT4YVDDMwbcQZUAKDUIAwebqN/7sjQ9dgrJrR/ppRYv2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347552650"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; d="scan'208";a="347552650"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2023 15:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="957778755"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; d="scan'208";a="957778755"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2023 15:24:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun, 11 Jun 2023 15:24:46 -0700
Message-Id: <20230611222447.2837573-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611222447.2837573-1-lucas.demarchi@intel.com>
References: <20230611222447.2837573-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/5] drm/xe: Skip applying copy engine fuses
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

Like commit 69a3738ba57f ("drm/i915: Skip applying copy engine fuses"),
do not apply copy engine fuses for platforms where MEML3_EN is not
relevant for determining the presence of the copy engines.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b42a0cb50159..d3a8dfa1d2cc 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -492,6 +492,9 @@ static void read_copy_fuses(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 bcs_mask;
 
+	if (GRAPHICS_VERx100(xe) < 1260 || GRAPHICS_VERx100(xe) >= 1270)
+		return;
+
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
 	bcs_mask = xe_mmio_read32(gt, MIRROR_FUSE3);
-- 
2.40.1

