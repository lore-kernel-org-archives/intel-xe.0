Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5C7C677C4
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 17:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD90E10EB10;
	Fri,  6 Jun 2025 17:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIrbsUwI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAA210EB08;
 Fri,  6 Jun 2025 17:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749232447; x=1780768447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gCLVITQ4U3VBqGOkYKSedaQ+KAHsWSFa7aspvkAeS9w=;
 b=dIrbsUwIYi6FStVfYh470VEpm1gqmnkHxpNrYcDPu5BoMT3nTTiXhlyc
 hpbGVNCS86skvaqg/WV9ZInzbZHGRtccp1X5i2gBba/Rz3u0H1av0e9sH
 0u1ZHeWXz63iDnrChpv7JaNKiwD0Vria46ruGMDgM/9KujKUZUPD+Pn3d
 fbavPV+E9YXRg/bMtOlu2JNA2VLcQRz15PpJNxQe6F9+yXwIRRMF4GnPl
 +YOcdAH6zWTdQWdexOABmmieWFXm9tuKyZvl9X/207I9vlQgFKwtE+Z7P
 OywF3S2417b68vnU/6sY7rj4AJMUbmU6QYvx2l4wY2XqSVAUDlYMqbckr g==;
X-CSE-ConnectionGUID: XQFG2qJWQjK1+ZwJ6Af2gQ==
X-CSE-MsgGUID: NZuYnZTvTYGMsQIxZNNufA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51486802"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51486802"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:54:06 -0700
X-CSE-ConnectionGUID: rthbL4zeSnaqjsy3K94gEw==
X-CSE-MsgGUID: Hg8HMHBXTIWkNzW7hWTTXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145787139"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 10:54:04 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, jgg@nvidia.com
Subject: [PATCH v2 10/10] [CI]drm/xe/xe_late_bind_fw: Select
 INTEL_MEI_LATE_BIND for CI Do not review
Date: Fri,  6 Jun 2025 23:27:07 +0530
Message-Id: <20250606175707.1403384-11-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606175707.1403384-1-badal.nilawar@intel.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
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

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 27a06d7359c7..2211365827d7 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -45,6 +45,7 @@ config DRM_XE
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
 	select HMM_MIRROR
+	select INTEL_MEI_LATE_BIND
 	select FWCTL
 	help
 	  Experimental driver for Intel Xe series GPUs
-- 
2.34.1

