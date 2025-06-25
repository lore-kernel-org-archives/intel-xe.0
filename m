Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F98AC7EE31
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 16:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C056510E7A7;
	Wed, 25 Jun 2025 16:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEE6cOH3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D68C10E79E;
 Wed, 25 Jun 2025 16:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750870619; x=1782406619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KOQQsCoE0oqkeAm/Y0aoPQ+O5D3xfSmk4KxH6jeeGRY=;
 b=lEE6cOH3VtYlMZK8lCmPvrT2wxKKIOqnc1G0NKeKFBUCza8L8Dx2qop7
 z2MfVs1JkMT8D6/ty5jFU0J9t/UeRwmZsCLlH4ZNiiO3vxPXiROJcSyee
 BnGBUQBZv6MlkIM+Qflq/CIplqxp7/dWV9THVB5dSJcDKKVaDy1e1SqYj
 be2LWvGQ5JdPDfrvWO7lQ48O+JSZfjfrsXg+pVjQ3ZyRqDgMu2LnocY8w
 L7BK3w/zLC5cg5hpboSkM3x8eq7PI1jsbywR5tfMMtpcC1VDliP7aoro1
 oOpYpE89Ywae7aqhUJPP+Tr4vOoo2Mk8W96k9YvX//xRJGPCagqsc1LyJ g==;
X-CSE-ConnectionGUID: APxCWtTOTrqotTBLggNH/A==
X-CSE-MsgGUID: bF7DG+WuT/299gTA6lXJ1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53214459"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53214459"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 09:56:59 -0700
X-CSE-ConnectionGUID: 6xHZ9QIXS+aLcdDHtaz0pg==
X-CSE-MsgGUID: gHz9xzKtR1CzDvLpoKgVnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="151696709"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:56:56 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v4 07/10] drm/xe/xe_late_bind_fw: Reload late binding fw
 during system resume
Date: Wed, 25 Jun 2025 22:30:12 +0530
Message-Id: <20250625170015.33912-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625170015.33912-1-badal.nilawar@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
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

Reload late binding fw during resume from system suspend

v2:
  - Unconditionally reload late binding fw (Rodrigo)
  - Flush worker during system suspend

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 91923fd4af80..f49b7b6eab97 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -127,6 +127,8 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
@@ -205,6 +207,8 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	xe_late_bind_fw_load(&xe->late_bind);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
-- 
2.34.1

