Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E22EE9A04C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 19:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0DE10E302;
	Wed, 18 Feb 2026 19:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNoq5Sw+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD01810E302
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 19:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771442222; x=1802978222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sqWzEe45Afd/19zQCuawiiZtiEydKJFqPkQymHKp1zg=;
 b=HNoq5Sw+X2aeCLDo5WR5tdaK9EfQZXQGannE9yuHWvMd8pTWA4lSO/ky
 WWVMTUd4xnKBoOSHhzEQTTdsbrHdj5sJF2nV37hIbAe/qmR7K4usk5ynM
 7Jutek14AL+TD5goQykVmBUEh5Sc/nL/eUC6gv8SIKsiy5kcIynl1nrHb
 /Un7Gz/CaaIqoCuYMXSFD3x5houdlzHntN+uYxOFwpbiyxIQEpkanCVcF
 0m4EZlUvIZPLPc3/ml86q9NCajT8Z9aqAuz7ffLWj9kA/Gi5C4GCxJRdA
 nCWG7wSnFdWpkS0R/x4jGzN8vr8PyNHkvDhEeVozVuVlAK/BxYVQQES2M Q==;
X-CSE-ConnectionGUID: Q2HZ7LBfQ3yOXVggDYjl1Q==
X-CSE-MsgGUID: aWAL5YhbRxep9E81w3sy2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83629852"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="83629852"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 11:17:01 -0800
X-CSE-ConnectionGUID: iBK/7e2fRfKVdWldlITNHg==
X-CSE-MsgGUID: t3Uns6AiQy2X/a3M4nxI5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="212603362"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 11:17:02 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v5 2/3] Reapply "drm/xe/xe2: Enable Indirect Ring State
 support for Xe2"
Date: Wed, 18 Feb 2026 11:15:48 -0800
Message-ID: <20260218191643.4130621-7-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260218191643.4130621-5-julia.filipchuk@intel.com>
References: <20260218191643.4130621-5-julia.filipchuk@intel.com>
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

