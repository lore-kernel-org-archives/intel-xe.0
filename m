Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7B7ECD6DA
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 19:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA3410E0BE;
	Wed, 11 Feb 2026 19:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAikolBG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D74210E0BE
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 19:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770839613; x=1802375613;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Uig4rKmgC4JN88F5AZuSxgQ8rWhO5oI1QZN8nozJOao=;
 b=iAikolBG3Fyh4kMJ6HLptz+DxD1xZbFsBVtk6bsdL6GkxQFMxFM1zKw5
 epMFxlPkduIV7bOF50WPLW28rEoUtP3XbM4B/BEt+GeBjDWCmtdILy+Xc
 J0ozpzSSctSCwTMGmnoH14VQk5zdA2vOWF0TA7BdTNwUJmRuFEdCqYCf3
 DhguZantB615VKMtnkdJl0yaWcpSUPQEU4CE9IeTEzIylUHY2x7HZ+goJ
 6NNK1OpYwa+17faBpgLukuOSd/XfTJupcV7dwx1SgpMK2ngJ1xxMEga8g
 SigsJJboL8d/i8Ust0n8CyKQl158E5xruA2Gcovo9ZzxVpv31G6a/9TWW A==;
X-CSE-ConnectionGUID: vlvmHJ6nT6echsGzCour7g==
X-CSE-MsgGUID: OoSnx7/9R96/9Pd6oMjvzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="97455784"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="97455784"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 11:53:33 -0800
X-CSE-ConnectionGUID: jvpzdmnBSGW7Bkl3NZzdNw==
X-CSE-MsgGUID: KCbQrj91RvGzkJ2jUnAQ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212174302"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 11 Feb 2026 11:53:31 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 riana.tauro@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/bo: Redirect faults to dummy page for wedged device
Date: Thu, 12 Feb 2026 01:21:09 +0530
Message-ID: <20260211195109.2053038-1-raag.jadav@intel.com>
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

The prerequisite for wedged device is to redirected page faults to a
dummy page. Follow it.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index cb8a177ec02b..d6c2cb959cdd 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1941,7 +1941,7 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 	int err = 0;
 	int idx;
 
-	if (!drm_dev_enter(&xe->drm, &idx))
+	if (xe_device_wedged(xe) || !drm_dev_enter(&xe->drm, &idx))
 		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
 
 	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
-- 
2.43.0

