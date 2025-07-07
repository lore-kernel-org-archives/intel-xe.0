Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B89C83030
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 20:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2888310E06F;
	Mon,  7 Jul 2025 20:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6pdPWu1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59A310E06F
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751919603; x=1783455603;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gmt0JkVOVbOQfxAzOfGxVD14AQrYffDPwJhrlqdrRfA=;
 b=M6pdPWu1D7ZWB7oZMbo0RsqeCGDy3NFZToZPcgvI43+UJ7rTfaJ/nR8S
 TR8qXKujm5SR9WJaDaadYpWFtd8ORW1nxoKAnwlsfauU/PKSAW3GnT7zo
 GHSGF8iU0iTGe4PA/VxAI6lrwSRN5lCpcKxhN8rXzlExWKJvGy/eZhcCP
 buLAUP54ILg9gPI/Q/EwK0TojZyFfqSJAUsujn336qnnvHJA7Y29LcFqm
 RZwYdhPCl/L+i9qZLg2W0syA71+ymtzVcqattYaeDqWuWWBVcAEnVzykd
 pGBB3kjpB2224JnE7ju2OmMADd3w1/blR85d7iOkHjVmGUFiAaZiqbwj7 A==;
X-CSE-ConnectionGUID: kNWajktuSgKj9g/RGv9w9A==
X-CSE-MsgGUID: o1X2hDwJSmSSyZ+mtJax4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57951247"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="57951247"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 13:20:03 -0700
X-CSE-ConnectionGUID: fWAFncXXR/O9BS+N09AKwQ==
X-CSE-MsgGUID: DYhqXgKTRVaAwiCXntw2xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="154710983"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.121])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 13:20:03 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com,
	Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH] drm/xe/ptl: Drop force_probe requirement
Date: Mon,  7 Jul 2025 13:19:59 -0700
Message-ID: <20250707201959.319406-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
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

Panther Lake has proven to be stable through testing and use.

Remove the force_probe requirement and enable the platform by default.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
Panther Lake is running internal CI for the moment, but running upstream
branches. Tests show all greens and work in progress to get the machines
approved for moving to the upstream CI.

 drivers/gpu/drm/xe/xe_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e9c5d3150efc..ffd6ad569b7c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -341,7 +341,6 @@ static const struct xe_device_desc ptl_desc = {
 	.has_display = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
-	.require_force_probe = true,
 	.needs_scratch = true,
 };
 
-- 
2.49.0

