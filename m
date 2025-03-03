Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E7BC19F32
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 00:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE0410E0BE;
	Mon,  3 Mar 2025 00:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hLvPZRTl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A1D10E0BE
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 00:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740962991; x=1772498991;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=um6dZk6awyQb8/yxedGDaGDKIyt8Wuibh7FzpAY6eMI=;
 b=hLvPZRTlYKazV4np7yeN9d2dzegOaoRl9BejxB6//aAD92JWNPl7KQ/n
 cv6284bgVdnNc++k3Ci0xqnQG3kg2Maw8gek8VzHk9ROOtdLkNBuIwVkM
 hDdWrDqIfIfDCGtr1zX5m8njfRTZQwLXG/Q9FsOouDgBmV0wkilBf1Tty
 hDJhXyVqXBWfjbP1fUmIXaUTw7OJwC425twvmLT1tR/wLmniRYI0tP9N/
 rgGetEKCEaQeXLbVxOHKpiZo+MrNEdMxEG6g7RkLWVNFs0KoHu29QB8NU
 E1BAxrigXZnfgxZcQKdCNCgGjN9SnpN+OJmDOLDCRJK/6xkbraJAzyKYU A==;
X-CSE-ConnectionGUID: JDXn2gUlRuuUQfuIrq3JgQ==
X-CSE-MsgGUID: E5DvqAwCTEGhHagLTQlDjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="52032523"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; d="scan'208";a="52032523"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 16:49:49 -0800
X-CSE-ConnectionGUID: CB2v+hi2QtW1uMQ8E7GCeQ==
X-CSE-MsgGUID: cHJVX9OMRsaapLmeT4bsmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; d="scan'208";a="141075402"
Received: from osgc-sh-rabbit.sh.intel.com ([10.239.81.90])
 by fmviesa002.fm.intel.com with ESMTP; 02 Mar 2025 16:49:47 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: remove redundant check in xe_vm_create_ioctl()
Date: Mon,  3 Mar 2025 08:49:41 +0800
Message-ID: <20250303004942.951699-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
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

The check for args->extensions is repeated twice in xe_vm_create_ioctl().
This commit removes the redundant check to streamline the code.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 996000f2424e..eb76f6854b2f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1798,9 +1798,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->extensions))
-		return -EINVAL;
-
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
 		flags |= XE_VM_FLAG_SCRATCH_PAGE;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
-- 
2.43.0

