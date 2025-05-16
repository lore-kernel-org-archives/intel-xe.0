Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C596C3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 12:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF7910E14B;
	Fri, 16 May 2025 12:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tekzy/Ob";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEC910E14B
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 12:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747399441; x=1778935441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jlJ+ZLp0gDjrvYKwO+27jaX9+M8ldCTYY9CR/sm1TVA=;
 b=Tekzy/Ob0QZGMcfI9kv9OTAxeia60W62lQo0iSyR3s5sc9mXN667KN88
 /g+TCJm1rUieNXW7uEjnMImT8sBOZmJfEUyt2bIioatg8NnaIGg5R7q/K
 yQAq8/NH+Mu6vViujeuig4xhBTlZGAJO/TQMZCvzehxtNfBYSOCogJPfv
 RnKftOxWXUKL9RMnBelV7dUzce2xkOptZloWG8UYFFT90YeresLZOmCq7
 xpwd1vsnCoEOJlOiSEFf40kKxo7+kh0zCsA0MwAWM/pTtTNZCwrfdwQ4Y
 26NwWHTx/oEBLoszTlbz/aFrjzCE3XMtHx8geI7ydrUSajMSW+McGfaxn w==;
X-CSE-ConnectionGUID: vQHwA0hCSnaRjxntDICtgQ==
X-CSE-MsgGUID: Bm2Hah/NTOyWLtuIkC5/6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49509337"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="49509337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 05:44:01 -0700
X-CSE-ConnectionGUID: c/2Ye/DISFmQZdxqQvFVsQ==
X-CSE-MsgGUID: 3k9SMDiMRcKQN5O9ONRCzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="143802840"
Received: from dut2140ptlh.iind.intel.com (HELO DUT2104BMGFRD..)
 ([10.190.232.57])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 05:43:59 -0700
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH v2] drm/xe: Default auto_link_downgrade status to false
Date: Fri, 16 May 2025 12:43:55 +0000
Message-ID: <20250516124355.4872-1-aradhya.bhatia@intel.com>
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
sysfs file.

Allow the auto_link_downgrade_status to default to 0 to avoid any
arbitrary value from coming up.

Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
---
Changes in v2:
  - Reword the commit description. (Tejas)
  - Add Tejas Upadhyay's R-b tag.

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

