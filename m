Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD50EDF040
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 06:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557C310E1DF;
	Thu, 12 Feb 2026 06:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PO+fcG7a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3358810E1DF
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 06:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770876126; x=1802412126;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CcJGk8R7sCGoyXq8bfDL3o/mho/aD5qLDatCYxGR/x4=;
 b=PO+fcG7ah1ELgtnVbnZK48epJuY9wBEk1XaGbA5djyROKf337lqkKzgD
 bkMWn4kqTvK3ndOtmEQ6iemgPNp31jf1lxEK//UIg3rFkr489Q++j70an
 UoxCU8P+/TIpFOAaq76BqydNw6NEQBaF1k6tGJ2gD9KBrgkxMkiGDHSty
 uBXzWwi6bKGqxxxQO/BdOSkAU62YaMnDpDq7ww7qFjX0PD7+pc/oCJY21
 /TTMeWziZTU55Zgk+G8nKBZbl4jTBmlEU8K6wNGGRHyu5IPVvQs5LG+xU
 OQ4QdApBfXuWHEwbUb3RwJIIPPj2LGZxaDxjinPfgnLOtSiDBITjj5FU6 A==;
X-CSE-ConnectionGUID: MNn3wY71RiijjI4Us4SqJQ==
X-CSE-MsgGUID: t/EHo1TsSH6kPIpY87yU1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83407377"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="83407377"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 22:02:06 -0800
X-CSE-ConnectionGUID: Dk/LTx4iRICVZafAPVgYTg==
X-CSE-MsgGUID: XXuZaaS6QUibf0Tg657MSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="243088129"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa002.jf.intel.com with ESMTP; 11 Feb 2026 22:02:04 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 riana.tauro@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe/bo: Redirect faults to dummy page for wedged device
Date: Thu, 12 Feb 2026 11:26:22 +0530
Message-ID: <20260212055622.2054991-1-raag.jadav@intel.com>
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

As per uapi documentation[1], the prerequisite for wedged device is to
redirected page faults to a dummy page. Follow it.

[1] Documentation/gpu/drm-uapi.rst

v2: Add uapi reference and fixes tag (Matthew Brost)

Fixes: 7bc00751f877 ("drm/xe: Use device wedged event")
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

