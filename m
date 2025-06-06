Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C94C61CE7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 17:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D4F10E331;
	Fri,  6 Jun 2025 17:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNB8CYm7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796D510E331;
 Fri,  6 Jun 2025 17:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749232437; x=1780768437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AYNTPQ4CjfepI+4HBFInorQz58j4Brhlf4nC/gcPkGY=;
 b=MNB8CYm7P7LlZEmp0BsRRP/FhuFM6cSCTFXJTpaKT8LseaTm29f8ry6l
 mtn1tWrlT6sobInOqJaYS8+bu9Km4u8I4W4etvHrPkuHdV4HQNyz2HCC0
 Im+a/eIow9T8NXQspM98zvVipEWQhj9zFbowIUIM65TnpzreUbvIlg5Sj
 Vzi6uhV1QrPpu/UtIdfOtszJQU+bP8Ie6fn5XLmgb93qLaGst9cI135R3
 3mZ5LAuVlKm2La9ATvNraXRI8gjTNzI4Sf6Cf2em7v/xULbYRgIOwDEgO
 vGaPS7lJJNeFGFlFa1ePGP0z83tiBeL5IcekIiRXB7hw6Y/7D51P0c8Oa g==;
X-CSE-ConnectionGUID: WtgG7L/2Ql621CZ8YSN4Ug==
X-CSE-MsgGUID: Fpwl+rv/QrawxsyNhU/DDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51486790"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51486790"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:53:57 -0700
X-CSE-ConnectionGUID: +c36qAmdTuKHSpFRSzlVFQ==
X-CSE-MsgGUID: tsGYmpuBTVKEf5gJT3gWnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145787120"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 10:53:55 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, jgg@nvidia.com
Subject: [PATCH v2 07/10] drm/xe/xe_late_bind_fw: Reload late binding fw in
 S2Idle/S3 resume
Date: Fri,  6 Jun 2025 23:27:04 +0530
Message-Id: <20250606175707.1403384-8-badal.nilawar@intel.com>
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

Reload late binding fw during S2Idle/S3 resume.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index af6f6e63ca9c..2fa3d4f1b192 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -205,6 +205,9 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (xe->d3cold.allowed)
+		xe_late_bind_fw_load(&xe->late_bind);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
-- 
2.34.1

