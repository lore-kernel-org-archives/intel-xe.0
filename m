Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035B5C5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14CD10F6B1;
	Fri, 14 Aug 2026 17:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsiIXwJs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3519110F6B1
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727937; x=1818263937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eyf7bZx7PU9Fy0/ZIn7Dpw65psqFMoreARaaNu0xH9M=;
 b=gsiIXwJsXASTTWOGcMmu7Ox5mek/SCAnX8ZOXOZuXEh0nL+EddOzB7Wd
 u9zJ+FQXINISnZjp2crSMrOP1CUvWqjHI48uzGpTSTfjDcje3lA8nS4Y9
 7cbdD7Qp06zVKcu3lozLx3sgf6X5hUbBAHSXkNu9/ZkJUx5os0YvI7fpU
 yQ+iVqHRll1ph20FznFiqQ6UjrELm/X6we/WgJ0KUqPaHEsY56NI2B1M9
 KfAhet+dNebEUaf/231ME9nu4yp06onDYsBcuP/K4+eJy2JyNJ7ZCw4Mr
 IsbPptDA6XBZhx4qt7n/Xe6F5AzuIfc0emKohS2b/+HWAUbZo2u+zWg6t w==;
X-CSE-ConnectionGUID: 0gPKK85HTvujZPws1dsrhQ==
X-CSE-MsgGUID: SyXnO/txRGuZagHBte8KGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464084"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464084"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:57 -0700
X-CSE-ConnectionGUID: HtFp8QtlTUOJFPZTXuNNwg==
X-CSE-MsgGUID: moQ1mwjzQCmJvbnkwFhkug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946272"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 22/33] drm/xe/survivability: Report 'boot status' on sysfs
 failure
Date: Fri, 14 Aug 2026 19:17:48 +0200
Message-ID: <20260814171801.13347-23-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

If we fail to create any of the survivability sysfs files, the user
can't view boot status registers any more. Report them into dmesg
instead using our existing SIGID helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 8b74bbc96390..e14553295171 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -305,8 +305,10 @@ static const struct attribute_group survivability_info_group = {
 
 static int create_survivability_sysfs(struct pci_dev *pdev)
 {
-	struct device *dev = &pdev->dev;
+	/* Survivability info is required if not enabled via configfs */
+	bool needs_info = !xe_configfs_get_survivability_mode(pdev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct device *dev = &pdev->dev;
 	int ret;
 
 	ret = device_create_file(dev, &dev_attr_survivability_mode);
@@ -318,8 +320,7 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
 	if (ret)
 		goto failed;
 
-	/* Survivability info is not required if enabled via configfs */
-	if (!xe_configfs_get_survivability_mode(pdev)) {
+	if (needs_info) {
 		ret = devm_device_add_group(dev, &survivability_info_group);
 		if (ret)
 			goto failed;
@@ -329,6 +330,9 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
 
 failed:
 	xe_err(xe, "Failed to create survivability sysfs files: %pe\n", ERR_PTR(ret));
+	/* no sysfs, dump Survivability info to dmesg instead */
+	if (needs_info)
+		log_survivability_info(xe);
 	return ret;
 }
 
-- 
2.47.1

