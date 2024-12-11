Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B351E7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 23:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C5810E068;
	Wed, 11 Dec 2024 23:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2rvkMIh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBC010E068
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 23:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733961064; x=1765497064;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qXQWfS72h64x96uZ/4KZVrDcZBXm/Lx8eEu6FLvmFXQ=;
 b=M2rvkMIhUI8GgMyW8mYXo+PiZczc3/IKtYEoTNpmWEPGyKiKupxzlTss
 kElxnSCAH5Aht1bhtoczmtl6HEtfLZSy5NxnfzyugIIK1ypl6YQrpyfVD
 kwgLDZ/8XYzwBHWbOfMiF01WKTUAPoLn4HK7oDQYAu1s39LUm6hpc4+4I
 H/MVX1758Cqk/bJmNPqFyY77m1f/fdxSUBGJ+II/babWZvO+h1wwlmJCv
 ikmJ5Tmh7ua9dQhzTgG9KXBYXpTUhIgrM+mo9mMrnoOomGcYGRKFGyzv6
 UWWp567WLbwj05Fm3uw1nfncV/m8dR9gwFojsECe4XzpisbUmwqM5ayfd w==;
X-CSE-ConnectionGUID: wp7Yy40pRwGb/QqScH3sQQ==
X-CSE-MsgGUID: Dv6v8104SeW3r3lkiMewXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38295388"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38295388"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:51:03 -0800
X-CSE-ConnectionGUID: kkSyMGsZR5q0Hn/o/92ncA==
X-CSE-MsgGUID: 23TpF7t+QN2ass0azAazhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96457475"
Received: from carterle-desk.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.55])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:51:01 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com,
	matthew.brost@intel.com
Subject: [PATCH] drm/xe: Remove a redundant argument check
Date: Thu, 12 Dec 2024 01:50:36 +0200
Message-ID: <20241211235036.348143-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
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

Remove a redundant check for the extensions member variable of the
drm_xe_vm_create structure from the xe_vm_create_ioctl function.

Fixes: f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 74d684708b00..f1f6d2ccce51 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1753,9 +1753,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->extensions))
-		return -EINVAL;
-
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
 		flags |= XE_VM_FLAG_SCRATCH_PAGE;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
-- 
2.46.1

