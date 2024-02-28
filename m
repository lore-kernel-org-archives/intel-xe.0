Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A0BC5478C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 16:12:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64BB10E713;
	Wed, 28 Feb 2024 16:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dkd7ps3u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201E510E713
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 16:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709136745; x=1740672745;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZAUvCEP32NbMekWlys6DIzuw/XFQg7CQhIb6YktYssg=;
 b=Dkd7ps3uF8H2JoUBVypk540X2bstppYPWwYzVAF39E1oCOvStjvD7NrG
 fBQ9iqwYZ2cv7BGrXogu9aGSIUhEdD5Wsr9ZFRyreKzI3vVZaJ7GLm4Fp
 /y6JOLIw3HtQqC/lZ3Y2m7Mjqtvl2fecQ8tIJGI93SmR3CmffYDInusVW
 I3aKStffeBlJN6xvLdX3PBeE5tPMuxwU8ji7qJypgBOfS3i4z+B4viefx
 nEukBRZK4A/1k98N8OqUaYIafvgKbwkY+7xqMRam88bjuM97Q7Rg891xb
 yAFXjO6B0hCBK4r2NXIuRNZKWEM98AIUSNNsFwgVWPtibL5VHxtIrFQe2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3708531"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3708531"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:12:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7529887"
Received: from shekharc-ms-7d25.iind.intel.com ([10.190.239.16])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:12:23 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	shekhar.chauhan@intel.com
Subject: [PATCH] drm/i915/lnl: Modeset sequence change for DP on LNL
Date: Wed, 28 Feb 2024 21:41:44 +0530
Message-Id: <20240228161144.648776-1-shekhar.chauhan@intel.com>
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

Currently, the driver is only waiting for 1ms for
idle patterns. But starting from LNL and beyond,
the MST wants the driver to wait for 1640us before
timing out (which we round up to 2ms).

BSpec: 68849
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index bea441590204..05ba3642d486 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3680,7 +3680,7 @@ static void intel_ddi_set_idle_link_train(struct intel_dp *intel_dp,
 
 	if (intel_de_wait_for_set(dev_priv,
 				  dp_tp_status_reg(encoder, crtc_state),
-				  DP_TP_STATUS_IDLE_DONE, 1))
+				  DP_TP_STATUS_IDLE_DONE, 2))
 		drm_err(&dev_priv->drm,
 			"Timed out waiting for DP idle patterns\n");
 }
-- 
2.34.1

