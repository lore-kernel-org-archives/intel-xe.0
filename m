Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2812C54755
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 09:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ED410EA0A;
	Fri, 16 May 2025 09:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2NnKqf6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED5410EA0A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747387412; x=1778923412;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6cvJVZ3Xd6pEJ+bm41VMb6/7jHVd0N9B7sae+l0gdCQ=;
 b=B2NnKqf6/sCH2aCRa2yHs4+Rh/Ja7z0wlUGhqXtxXJHuxfUzpRKUhVjw
 W3wjBvJ0nRt2guAGa37XGZqKacu4jGQSjisKZQo1viu/cPeSN6/M9ckGX
 DO3v65i2K1lAMtniyOpkd2KKrApx8pzro7G8Evvnayru6DWGFoYkdZz0q
 aEjgzwc1+LPO8pF4UwTq37ntIw0oG6P/FiChWbpIJcUCOGmMWM0KImCK4
 6ekir8fW3UWd8/3AopyievAVZtANH8j4k9W0UcD5AQiVWA6fgUSMXO1p1
 rof3RSkZFKQK4Uhh1RccCvn40v4cE4drPVnQ5FS/ZMA6DwifBfn6dszfd Q==;
X-CSE-ConnectionGUID: E/bC9BGoRfyN3DtAtx0IWA==
X-CSE-MsgGUID: 2mJ5Fn+bRHaV1UBwyo5yFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60741855"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="60741855"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 02:23:30 -0700
X-CSE-ConnectionGUID: 49BzxvOIR+2eOo3khqJJWg==
X-CSE-MsgGUID: Pp87Us1QTnCKSdCaYppvfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="175772198"
Received: from unknown (HELO DUT2104BMGFRD..) ([10.190.232.102])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 02:23:29 -0700
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH] drm/xe: Default auto_link_downgrade status to false
Date: Fri, 16 May 2025 09:23:25 +0000
Message-ID: <20250516092325.5959-1-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.45.2
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

xe_pcode_read() can return back successfully without updating the
variable 'val'. This can cause an arbitrary value to show up in the
sysfs file. This concern was flagged by the coverity static analysis
tool.

ALlow the auto_link_downgrade_status to default to 0 to avoid any such
complication.

Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 9628e9a0a0af..2e657692e5b5 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -124,7 +124,8 @@ auto_link_downgrade_status_show(struct device *dev, struct device_attribute *att
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
-	u32 val;
+	/* default the auto_link_downgrade status to 0 */
+	u32 val = 0;
 	int ret;
 
 	xe_pm_runtime_get(xe);

base-commit: bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28
-- 
2.43.0

