Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B761C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 21:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413B110E0BC;
	Thu,  7 Dec 2023 21:00:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B92510E0BC
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 21:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701982803; x=1733518803;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XpspIb6Nl5oIiqym+iOTSuOIU8DA6rpvM11hSHAOZco=;
 b=lQhkj5QE3SYEiemoiK+Jy/2E0Q/XK4cEFToNle2Vgy9ltq3+ObGVH3Lg
 LPfqV1npbiIGGXYARys5d8dnognwtxdmcPtSW9IsXbSvFaVCRtFuftnx7
 xvk4JJ0lOnBnr0D0Dm6A40NW5e6DAoAcWdHZI4iEwJC8d/pxabRx+xu3z
 f1nYYp9ajSerfy+wQfMlnLtvK3UQutz/ICCYVUiwmmDLqUip37r9xEc9s
 wEgO70nTlN7OWdAV230DRQUfRHI/+bRNiKWq9laGS/uaTRvS56yBq3GrO
 ZjTrZsmX3umPvG9Xr5G+Xkuw8A5XeTGgCa6IyMu3bXy0DZ75Ylbo7Vnrs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="458619079"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="458619079"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 13:00:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="837876531"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="837876531"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 13:00:00 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] !fixup: drm/xe/gsc: GSC FW load
Date: Thu,  7 Dec 2023 22:55:56 +0200
Message-Id: <20231207205556.495523-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

Fix timeout to be in usecs for xe_mmio_wait32

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 4aad6a8c9dde..a8a895cf4b44 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -182,7 +182,7 @@ static int gsc_fw_wait(struct xe_gt *gt)
 	return xe_mmio_wait32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE),
 			      HECI1_FWSTS1_INIT_COMPLETE,
 			      HECI1_FWSTS1_INIT_COMPLETE,
-			      500, NULL, false);
+			      500 * USEC_PER_MSEC, NULL, false);
 }
 
 static int gsc_upload(struct xe_gsc *gsc)
-- 
2.34.1

