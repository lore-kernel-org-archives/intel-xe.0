Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7E6C43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 16:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9339B10E1EE;
	Fri, 10 Jul 2026 16:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UiFGzp98";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851A010E1EE
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 16:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783701335; x=1815237335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D8A6HgqmZsCdUOpXXLrOUwJ2PqQoEO62p4xmnaVa0Gg=;
 b=UiFGzp98n6ZVc1d0Ao1iEPfZRAyGDvxg6c9zj+VrSqcz4sFHhPDb4EBG
 zwkB4pFFnGIBI+65tD2zkF+dcCaqe2stkAd7TUhI+EbQMbkr/vwr6JtaG
 N0QmU5P2ysMfMbfyWs6B+h8Y+ner0CxQP1JveGJecBv5HMEwTYbk1rROe
 M84oKw0sbFk+GXOwYDMloFjGqOmejOp5221iKS2uxhwQDMedmjwOAORdN
 jtxtE3MYlO8CvvaOROhLi00uGg41uueOWEJdlZORZWTKzogNi0OVdFytf
 tEpESXPXW5zOMfw75cO8ZiNzG/HP7fqNgYszZ/WXOQ0vLhg1q5Wx015KU A==;
X-CSE-ConnectionGUID: bY1MMBxGTKmwpXAuRN182g==
X-CSE-MsgGUID: dCTHHpCrS9GM+bj5uB5H6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101827248"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="101827248"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 09:35:34 -0700
X-CSE-ConnectionGUID: e8z7UjiaShOgaiWvlj/YRA==
X-CSE-MsgGUID: Dc2mH0DyThOQkX2LuRPXpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="258526700"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 09:35:33 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: alex.zuo@intel.com, jonathan.cavitt@intel.com, matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/pci: Disable Multi-LRC on single VCS/VECS platforms
Date: Sat, 11 Jul 2026 00:35:29 +0800
Message-ID: <20260710163529.1820969-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

Recent platforms like PTL, NVL-S, and NVL-P have only had a single video
decode engine instance and a single video encode engine instance.  As
Multi LRCA requires at least two engines of the same type, this means
these platforms simply haven't been capable of multi-LRC.

Do not expose the uapi for this unused/unsupported feature on these
platforms.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index cd0e42dd4992..7ff4f3e1f34d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -443,7 +443,6 @@ static const struct xe_device_desc ptl_desc = {
 	.has_pre_prod_wa = 1,
 	.has_pxp = true,
 	.max_gt_per_tile = 2,
-	MULTI_LRC_MASK,
 	.needs_scratch = true,
 	.needs_shared_vf_gt_wq = true,
 	.va_bits = 48,
@@ -458,7 +457,6 @@ static const struct xe_device_desc nvls_desc = {
 	.has_pre_prod_wa = 1,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
-	MULTI_LRC_MASK,
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 4,
@@ -498,7 +496,6 @@ static const struct xe_device_desc nvlp_desc = {
 	.has_pre_prod_wa = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
-	MULTI_LRC_MASK,
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 4,
-- 
2.53.0

