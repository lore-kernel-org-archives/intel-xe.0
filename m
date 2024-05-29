Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802FEC27C44
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 09:23:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE77810FD9F;
	Wed, 29 May 2024 09:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7/SYQkS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1668113608
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716974590; x=1748510590;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2eWD/aliZuypWQYfrX/FM2hkqJCz6h66OR04BByLO3Y=;
 b=Q7/SYQkS7HsvEJpnFyLmRJzsyHXfzSzWKzRjTDajcyWESZuwwP5nYuqp
 5FoJt2z8Eo/jyXf6UFoM6fU3yHr/z5k97Wt3vvQ6Obk9kvQOSwqfjGpzX
 GmNaAv5yRIjaWNygOCp67KNGfw8Q8B9tZuendW1sBwPy7Z03cU4lG6oPt
 JnuFYUwWrh7gk2cDyJqf6uf1uYvdNnrZOSxPVohXPajSK8G2V9i17VDpO
 FdyDxC/3xzZwiv5UgGvThaxmMtOxkm2MIR998RejI5ulgNPGA+8wgpX/b
 8A9gHbscirZ5GWPnXyqBGeNx51pKM/p8ZkBaTy2pVCvxYFPSBy1YRnxBN g==;
X-CSE-ConnectionGUID: XThz5+IXSMauFNgK2AOoMQ==
X-CSE-MsgGUID: XUXuj/UtTSCJdgAIhD23Xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24498367"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="24498367"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 02:23:06 -0700
X-CSE-ConnectionGUID: 3fYLpKZURYGn0MPNN9SG5A==
X-CSE-MsgGUID: D/S14jRHTHOZIOzR3ukQbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="40270017"
Received: from johunt-mobl9.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.38])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 02:23:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/tests: Add a missing Kconfig select
Date: Wed, 29 May 2024 11:22:51 +0200
Message-ID: <20240529092251.173685-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fix the following warning:

WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER
  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=y] && DRM_DISPLAY_HDMI_HELPER [=n]
  Selected by [y]:
  - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y] && MMU [=y]

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 54cb39e2293b ("drm/connector: hdmi: Create an HDMI sub-state")
Cc: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 9703429de6b9..47592b6fc868 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -79,6 +79,7 @@ config DRM_KUNIT_TEST
 	depends on DRM && KUNIT && MMU
 	select DRM_BUDDY
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_EXEC
-- 
2.44.0

