Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7951BF55435
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 06:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7AD10E6B9;
	Wed, 25 Feb 2026 06:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJkuEwJc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774CE10E6B5;
 Wed, 25 Feb 2026 06:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772002249; x=1803538249;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SXYh7ORQducfpbRLJLc9DQXegZ1pGhAZlsc9PKQ51oc=;
 b=iJkuEwJcNysC4u7vJG6GKTcQRiY77UCS7cHg0j8BpS2lQcTWE/L0ag9k
 V/c80ka1gNN5vNU/dxtGkQ9R7drgivsPcH+o9uzTAU7TvDaQloSDRoV09
 Kr43+nZuCQdd/xb1U1HVVV6kH6UrrIzdpctxB9hIny4Ni/z5ex+3zwuK8
 8qD4U2+Z4ERpRXV11bgXZU5snaOuI9WYIIkyx8WVCpnI5+kpmUWWiTpmk
 EnjXfg404q+b4MoGfA7BirdK9sCUdkA7IsTvT6DackqIJgzsrAS7nzF96
 HsadFDjvmwK31m4HbdaNp7VcHuw39CLx7sPdrA3ZiCFXIPJ0e9Qwq3Hxr A==;
X-CSE-ConnectionGUID: rNSoIZbtSAmeSKFys4m7gA==
X-CSE-MsgGUID: xpOjsc/kRM6QYK3fKEJuow==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72938485"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72938485"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 22:50:49 -0800
X-CSE-ConnectionGUID: 8LHj4mFmT7aDPoTpG3oTDw==
X-CSE-MsgGUID: aL2I4is6Q6eaHAr6F0yAfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="214943683"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa008.fm.intel.com with ESMTP; 24 Feb 2026 22:50:47 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/hdcp: Take force_hdcp14 into account during
 check_link
Date: Wed, 25 Feb 2026 12:20:45 +0530
Message-Id: <20260225065045.3040787-1-suraj.kandpal@intel.com>
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

During intel_hdcp_check_link phase we need to take into account
if we are currently forcing HDCP 1.4 or not. This is because
we check for HDCP 2.x Link first and only if HDCP 2.x is not being
used check for HDCP 1.4. With force_hdcp14 in picture we should not
be going into intel_hdcp2_check_link because of which we may end
up trying to disable HDCP2.x even if HDCP 1.4 was enabled causing
a lot of issues while IGT tests this.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 116d2e0af878..892eab4b6f92 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2231,7 +2231,7 @@ static void intel_hdcp_check_work(struct work_struct *work)
 	if (drm_connector_is_unregistered(&connector->base))
 		return;
 
-	if (!intel_hdcp2_check_link(connector))
+	if (!hdcp->force_hdcp14 && !intel_hdcp2_check_link(connector))
 		queue_delayed_work(display->wq.unordered, &hdcp->check_work,
 				   DRM_HDCP2_CHECK_PERIOD_MS);
 	else if (!intel_hdcp_check_link(connector))
-- 
2.34.1

