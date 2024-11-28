Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E5FD65553
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 05:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82BB10EC2F;
	Thu, 28 Nov 2024 05:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gTdajC+C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEB510EC27;
 Thu, 28 Nov 2024 05:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732773148; x=1764309148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IDvghJba7JjGPaVQsZq4GaUxd0zGSoYzKYUUvegtXB8=;
 b=gTdajC+CXEt69K6f4GXDwNoOijWJJki70EtEx651IxgCTSGS1gWXLABz
 OAKD+K0TdYpddVGRjUcNXK5XtNCRwzoLd/QA+TdGcbIwQGoB8v9va41SN
 ItGlVdFemtcNwK4nxYplPrIYHczEXC3ScyO65W/L4E8mSn/ggDS098SHw
 XR9rAVRgTYf+OEV1KUu2VlyKRc/ZHjLttzDssjgdSopnWNTFgm4UDYLs1
 FEUrv0P9ENboDYUGRuJd1jGN004DcssT/XkQI9z9u6/8z/PdwQFgfA59Z
 +n38ODdXAxop2jz5SUhXx0Z2X7D03A9HyVNz+PCNZSYxzImxT+qlq0q8H Q==;
X-CSE-ConnectionGUID: B4H1RWmHTrK9ogDJgGwr5g==
X-CSE-MsgGUID: DvRcU016ThyQzMJCfiWw5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32366807"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="32366807"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 21:52:28 -0800
X-CSE-ConnectionGUID: +8hNOdBjT5GIaazmMge4Mw==
X-CSE-MsgGUID: b7algIChR+q6yyfFCIXlcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="97201734"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 21:52:26 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [i-g-t V5 3/4] include/intel_drm_local.h: Add
 DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER
Date: Thu, 28 Nov 2024 11:26:46 +0530
Message-Id: <20241128055647.1677371-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128055647.1677371-1-tejas.upadhyay@intel.com>
References: <20241128055647.1677371-1-tejas.upadhyay@intel.com>
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

For now dump into intel_drm_local.h. Once the uapi on the kernel side is
merged, and is part of drm-next, we can sync the kernel headers and
remove this.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 include/drm-uapi-experimental/intel_drm_local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
index b48c9e219..40e8dcc43 100644
--- a/include/drm-uapi-experimental/intel_drm_local.h
+++ b/include/drm-uapi-experimental/intel_drm_local.h
@@ -20,6 +20,8 @@ extern "C" {
  * clean these up when kernel uapi headers are sync'd.
  */
 
+#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER	(1 << 0)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

