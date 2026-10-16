Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9609ECCA48B
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556AA11260C;
	Fri, 16 Oct 2026 07:19:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A3B11261C
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135152; x=1823671152;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4TEXeKq5//OPZDXPv21wvYfrIF/pUmoX78AzAcFfN3Q=;
 b=jnWw2ojI/dieRiPQoeUN6TtQNAW2/MgvB+ec1Edzy+S0B14gAqecyFl1
 lfequj4QT4EuwgwkygYdCDyhNPRZ4dpbtxhc/AXzdKCbf8RQxZecbZZE+
 BsXi1aWz+fWFST0OL2kYosYxf1oN9J0zI8yZBVqMd9fwjmETHietijYQj
 hBNJ0r7j8SUEamHWj8dyy/UY/jsDGO0+15ff7N/+C29BVUi/Y76UrGgYz
 mdqcuFcPNbIdIYQwT4PlAPEwePECRuO0oOWnFwX7vIzOcj/MCiYvfzAl0
 buJXCzhw7rlYtpvPgZC0byqZy4SLyRJlR9uZNheAcXGZALAHTKm0T54vY Q==;
X-CSE-ConnectionGUID: wZZnYshAR++mLLnyn9ZVqA==
X-CSE-MsgGUID: 9hcSKalpRE6wpqNvb3BEhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813662"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813662"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:59 -0700
X-CSE-ConnectionGUID: Zj8gPv/EScGbueSSBaGFtw==
X-CSE-MsgGUID: p2s2UwSeQF24J+icUmSFfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787307"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:58 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 18/18] drm/xe: Block BO VM access when device I/O is
 unavailable
Date: Fri, 16 Oct 2026 12:48:28 +0530
Message-ID: <20261016071832.222574-19-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
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

DO NOT REVIEW

xe_bo_vm_access() may acquire a runtime PM reference and access a BO
during PCI error recovery, after a permanent wedge or during device
unplug.

Use xe_device_io_get() to protect against unplug, PCI error recovery and
permanent wedging. Keep the device I/O gate held until the runtime
PM reference has been released.

Return -EIO for a permanent wedge, -ECANCELED during PCI error recovery
and -ENODEV after device unplug.

v2:
 - Replace the runtime-PM scoped guard with explicit get/put calls
   to avoid mixing scope-based and goto-based cleanup. (Sashiko)
 - Replace the private VRAM SRCU lock with the common device I/O gate.
 - Preserve -EIO for BO access after a permanent wedge.

v3:
 - Combine unplug and blocked-device protection through the common DRM
   device SRCU helper.
 - Return -ENODEV after unplug and -ECANCELED during PCI recovery, while
   preserving -EIO for a permanent wedge.

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e5f8c8b6db94..c92382ff5cbd 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2330,9 +2330,18 @@ static int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 	struct ttm_buffer_object *ttm_bo = vma->vm_private_data;
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct xe_device *xe = xe_bo_device(bo);
+	int idx, ret;
 
-	guard(xe_pm_runtime)(xe);
-	return ttm_bo_vm_access(vma, addr, buf, len, write);
+	ret = xe_device_io_get(xe, &idx);
+	if (ret)
+		return ret == -ECANCELED && xe_device_wedged(xe) ? -EIO : ret;
+
+	xe_pm_runtime_get(xe);
+	ret = ttm_bo_vm_access(vma, addr, buf, len, write);
+	xe_pm_runtime_put(xe);
+
+	xe_device_io_put(idx);
+	return ret;
 }
 
 /**
-- 
2.43.0

