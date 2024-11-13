Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF5AD462A9
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 14:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEB610E714;
	Wed, 13 Nov 2024 14:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZ7DTAwd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5178510E711;
 Wed, 13 Nov 2024 14:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731506780; x=1763042780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xpFEKBSFsurNNKPAK5JROYVQ5NHMMqF7k73OqIDmEmI=;
 b=RZ7DTAwdfhjrM8WaVpHEqDF0iz+yBUeJ+J5XQHsI9LKiPXvRctw9iaux
 YKu51ArGC6oPw81GgqbwuhfeIFvl0oedgvOFNf4azCtnvGi2rpFcQ/1gj
 YLSby/Ex0xZ+NHoFbgV/pC2ZK8iiUXP9PUAjlHd7vzqtMjtgc7FokmjaS
 Kbzo6Iml9eajiXE+qYAKgruI8VreqFCGZzlki2FrgKL8fFdSSVkKBMwTV
 aPLhhn8TcpaPvd5SKPvqlmkPW99yPp49XNX43mqXG0RK73Yk9bsfBg0O/
 7dkECayx1ZNBnHg0xED2epZgeVFJo6eJUPT0fy9puj8n2BR2tAINaZR72 A==;
X-CSE-ConnectionGUID: AS/wcMeMQoqUjfawikH6BQ==
X-CSE-MsgGUID: 5aMR9R7tSfS4L+IgULsTTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30792357"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="30792357"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:06:20 -0800
X-CSE-ConnectionGUID: X4APuf2mS7yzpVCmJCONiA==
X-CSE-MsgGUID: vB13F/FZSt2I8LQxEPsU1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="92654151"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:06:19 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 3/4] include/intel_drm_local.h: Add
 DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER
Date: Wed, 13 Nov 2024 19:40:11 +0530
Message-Id: <20241113141012.1362064-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113141012.1362064-1-tejas.upadhyay@intel.com>
References: <20241113141012.1362064-1-tejas.upadhyay@intel.com>
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 include/drm-uapi-experimental/intel_drm_local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
index 1773c649b..4afe588ec 100644
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

