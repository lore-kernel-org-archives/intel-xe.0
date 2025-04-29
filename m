Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517F0C3ABA9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 07:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132DE10E3A9;
	Tue, 29 Apr 2025 07:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aVK8zqIL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5913010E3C5
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 07:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745912186; x=1777448186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=95m+F+Bbj8H9yosXA2Wqnd/6VzW1AFpOCb9+mRjwq0k=;
 b=aVK8zqILhdQH5VEggRugMbottGnjcSZ0ZsPtiJxzwEXmu/NqJ6ucj4qE
 Btf2/HekncFWsIGuNzc6K9Cnlsg/odgSH7ue9yWCP1jlu2E9ytqlxi+wg
 tvuiPz26JYZXRKrI7FmuT3xUD9ADuBdM2jRmh0hp9N4IUQozimGTAxBzL
 VxFYo+pbyYSDlNdi/VUPMQRSsP+uxzoUERpV78nzkzqh+iXeHRXWM6Z+L
 F7b1f7QW29oC2kp/7fvb/GYNRR/vRiCIYA4i1CuJoJvmiteZS57SoSJGe
 u6SqMWiYhVeVXPbsdj3TMHrJJdsQC6HqGUoC7+wPBQNMc9bfE4WZ9f7yf Q==;
X-CSE-ConnectionGUID: hgiJ3KGtQmGgEVl599bfUQ==
X-CSE-MsgGUID: S/L2g/1oTu2v06r/5+palQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58178190"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="58178190"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 00:36:26 -0700
X-CSE-ConnectionGUID: QS9Z1TcTQRCgKa8BbAUFmg==
X-CSE-MsgGUID: 6FzRzf7TTPG5IThqioItFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="138559844"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 00:36:24 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedeskop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org
Subject: [RFC 7/9] drm/xe/xe_late_bind_fw: Reload late binding fw in S2Idle/S3
 resume
Date: Tue, 29 Apr 2025 13:08:02 +0530
Message-Id: <20250429073804.972137-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429073804.972137-1-badal.nilawar@intel.com>
References: <20250429073804.972137-1-badal.nilawar@intel.com>
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
index da7ee67eefd1..d0a3019caa34 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -206,6 +206,9 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (xe->d3cold.allowed)
+		xe_late_bind_fw_load(&xe->late_bind);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
-- 
2.34.1

