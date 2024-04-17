Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82402C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 15:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6E711361C;
	Wed, 17 Apr 2024 15:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nphH4Pfs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477D811361A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 15:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713367600; x=1744903600;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aikK+6IgHEVj+rI+dSMRtEfqTGVup1TAzv1NRyylfv0=;
 b=nphH4PfsB8Vzy2+BX6ZGJ06pJ3rAKj7ZKglotEuDLoEVo7ijoDAdvthD
 WyE2hMB+EYKAiZ461OPy2TvD/EJ6suijNOmmHCQ30kPcjFGCbUD+QIXOk
 +DoK1tW3K6hxxEiJIdUwgiWG8Gu70CGGyBMePJTKtyuulhBWJ3AeXKKYD
 Wm3pDbAK3YQMiX4QFMig6BgGVDULODpyBo9Jc6z+sYR3ZtCv/EmMzlZBj
 QnFFCiWRTCAWR90/fXbhfA8mQekQJvN3gDXBWYCt1pUlHTQA3i/axBAdQ
 vuf9J8+8WMMZiTyIadlCOLHD+M9AAis8axcQmieF5PISDiLHpV3K4WB/L w==;
X-CSE-ConnectionGUID: Umv4Gy7xSZCmGne1a+cK6w==
X-CSE-MsgGUID: 3JwEslrQT3OQSgKk83+wxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12650647"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="12650647"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 08:26:29 -0700
X-CSE-ConnectionGUID: uxaVdFCVRcOY1+pwyno7qQ==
X-CSE-MsgGUID: TjaGWZPFTKKDigFjzVqIwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53604603"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.140])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 08:26:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe: Define all possible engines in media IP descriptors
Date: Wed, 17 Apr 2024 08:26:22 -0700
Message-ID: <20240417152621.3357990-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.44.0
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

Rather than trying to identify exactly which engines are available on
each platform in the IP descriptor, just include the list of all media
engines that the IP could theoretically support (i.e., 8 VCS + 4 VECS).
We still rely on the media fuse registers to tell us which specific
engine instances are actually present on a given platform, so there
shouldn't be any functional change.  This will help prevent mistakes
with engine numbering (for example ambiguity about whether the 2nd VCS
engine on a platform with exactly two engines is numbered "VCS1" or
"VCS2") and will also future-proof the code a bit more in case new SKUs
or platform refreshes extend the engine list in the future.

Note that the media fuse register technically has an 8-bit field for
VECS engine presence starting on Xe2.  However there's still no MMIO
register range reserved for VE engines above VECS3, so VE0-VE3 is still
consider the "maximum" VE engine mask that the driver can support for
now.

Bspec: 52614, 52615, 62567
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3b30353dbc09..0d21306f8995 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -185,8 +185,8 @@ static const struct xe_media_desc media_xem = {
 	.rel = 0,
 
 	.hw_engine_mask =
-		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
-		BIT(XE_HW_ENGINE_VECS0),
+		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
+		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
 };
 
 static const struct xe_media_desc media_xehpm = {
@@ -195,21 +195,23 @@ static const struct xe_media_desc media_xehpm = {
 	.rel = 55,
 
 	.hw_engine_mask =
-		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
-		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VECS1),
+		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
+		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
 };
 
 static const struct xe_media_desc media_xelpmp = {
 	.name = "Xe_LPM+",
 	.hw_engine_mask =
-		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
-		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_GSCCS0)
+		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
+		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
+		BIT(XE_HW_ENGINE_GSCCS0)
 };
 
 static const struct xe_media_desc media_xe2 = {
 	.name = "Xe2_LPM / Xe2_HPM",
 	.hw_engine_mask =
-		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
+		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
+		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
 };
 
 static const struct xe_device_desc tgl_desc = {
-- 
2.44.0

