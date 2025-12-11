Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A35FD43356
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 21:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C2D10E06C;
	Thu, 11 Dec 2025 21:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kb5yywe5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1705D10E06C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 21:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765488120; x=1797024120;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nZ/gC4/uS5+vlXol+uIjui+Hz35z1BsDzLJ/SJmd5g8=;
 b=Kb5yywe5RRNbmG1MHDQY/tj71v0gJMizwiFTCIrc+yhqPAfrUIEFZtEE
 c6tl5jtSmB15fIVTHPaLEqFuYqwAjpuNCt2i9/XDbmYlr6Xrt0VGy5JWo
 cxSHbZt6XZAFBwsDHMo9kugTYROPt6poPJpox+cxwHexiN9+a0Tz7KoZ0
 Trah4JgI3eqLDcDA/yzLrjNBMx9NTtTaCC8a0hsAiSAVAxs8bn9nTIOfi
 P5UFIQ4RHxgAOtxs58hD43gE2RyBR8OjCwtBGuw6DtRpJF9VWBJG6kqq0
 Y73v5PVQ9oX13EFF6ZBHGff3JYGpBlqJS94EpCDEuMygXXJaQ+CX+wmfl Q==;
X-CSE-ConnectionGUID: CZjZMK1LQAun20V6F91/XQ==
X-CSE-MsgGUID: bJ8sWp7GR+OFTsxIPgoD6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67214468"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67214468"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:21:59 -0800
X-CSE-ConnectionGUID: 2UXkV2WWR6ynuI5ZnmXc2A==
X-CSE-MsgGUID: t9Gna4hAQuWdeCWjvDe0oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196513641"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:21:58 -0800
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, stuart.summers@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH, v2] drm/xe: Increase TDF timeout
Date: Fri, 12 Dec 2025 05:21:46 +0800
Message-ID: <0201b1d6ec64d3651fcbff1ea21026efa915126a.1765487866.git.jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.52.0
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

There are some corner cases where flushing transient
data may take slightly longer than the 150us timeout
we currently allow.  Update the driver to use a 300us
timeout instead based on the latest guidance from
the hardware team. An update to the bspec to formally
document this is expected to arrive soon.

Fixes: c01c6066e6fa ("drm/xe/device: implement transient flush")

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1197f914ef77..db2f04e1e60e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1050,7 +1050,7 @@ static void tdf_request_sync(struct xe_device *xe)
 		 * transient and need to be flushed..
 		 */
 		if (xe_mmio_wait32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST, 0,
-				   150, NULL, false))
+				   300, NULL, false))
 			xe_gt_err_once(gt, "TD flush timeout\n");
 	}
 }
-- 
2.52.0

