Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B068E9A04B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 19:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C820810E5D1;
	Wed, 18 Feb 2026 19:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9vZHIZp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB97F10E30D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771441407; x=1802977407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sqWzEe45Afd/19zQCuawiiZtiEydKJFqPkQymHKp1zg=;
 b=k9vZHIZpkD4IvMCMNXxS6V9SX/iD5JmnrgoeusLoPCqeeg6aF4NgHn5m
 hLYRVE2vnAUoSEMFX3dqOVTD6vhyVHaA4tTha36pazEcHnwIwkXby+Ww+
 fqLGL3ewhIxDelU3t5vYB/7vON0FTmZg2I2DWne0zgtrzG/1+exifV7SY
 JlpV1ynD5Qoe2jLC+PaLeGLqYGNjpJ20x/PNdhQ1ajEueTTnXXafWD9w1
 AS5/kicNJmiPkwOfTji3YUV6lofzk4y8VkZPAjsoMdrSNOqRVuVmq/BOR
 yfBt+1VtwHv+KR1QP+bhCHQOUgFo0b3D1bHh7X3FewNmW37iWttoZvCHD Q==;
X-CSE-ConnectionGUID: HU9qxQvpSvO83iU/IVVa/w==
X-CSE-MsgGUID: iJdaNz4AQtuLeZl8jniErg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72592362"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="72592362"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 11:03:27 -0800
X-CSE-ConnectionGUID: YiXDRxcARUW3+2Lv24t2qg==
X-CSE-MsgGUID: 0E6qLrNwSz20Im8rd3sOjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="237264330"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 11:03:26 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v4 2/3] Reapply "drm/xe/xe2: Enable Indirect Ring State
 support for Xe2"
Date: Wed, 18 Feb 2026 11:03:01 -0800
Message-ID: <20260218190308.4124010-7-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260218190308.4124010-5-julia.filipchuk@intel.com>
References: <20260218190308.4124010-5-julia.filipchuk@intel.com>
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

This reverts commit 03d85ab36bcbcbe9dc962fccd3f8e54d7bb93b35.

Previously this was reverted due to failures on LRC context switch.
Issues should be root-caused and resolved with GuC WA 14025515070. Now
setting indirect ring state is available by default.

Note: Will be cleared if WA not available due to older GuC version.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e1f569235d8a..ff8039198da1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -100,6 +100,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 #define XE2_GFX_FEATURES \
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
+	.has_indirect_ring_state = 1, \
 	.has_range_tlb_inval = 1, \
 	.has_usm = 1, \
 	.has_64bit_timestamp = 1, \
-- 
2.51.0

