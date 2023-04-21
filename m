Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC32C7618E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 10:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2E210E04A;
	Fri, 21 Apr 2023 10:15:32 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8B510E04A
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 10:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682072131; x=1713608131;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rLlWm6XhOWPGYNA2ly63Z8aVIR8SOHtEzUiSzV9OKaE=;
 b=C/WJKf5ve2sVM0ZvGgpGCcvgopalztygZ8qBKJFlsaxZxBtPkR7doh2i
 HAfiHa+/ewNyUONzORjXXVGEpAx1yc1LTocUVf1ZJTRikztBm+nwTJhoZ
 kLzekJt2C0Pnt0TEy8dNDYHqoLpJTz66lnWIU789g/imJRh+DPIG8tliz
 yUV907T5Lpus+j011D5lFbPeu0fmbXKtpbBKGnM3XGZ2WMl87UoUUJi+y
 uYTa6tik4zyB9rMwOh/WfLkQWYsqmsImkDiXLQ31L6mUt99IsjkRbFv6U
 kk350nhjY837lKGjvnqDOA5iM29Wvbtm2vXWbUkyaAb1gP9UZV6jditLk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="334837997"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="334837997"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 03:15:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="803695442"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="803695442"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 03:15:28 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Apr 2023 15:45:11 +0530
Message-Id: <20230421101511.3532534-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t] test/xe_pm: Assert on unbounded VSP
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, mauro.chehab@intel.com,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Discrete GFX cards gfx may have multiple PCIe endpoints,
they connects to root port via pcie upstream switch port(USP)
and virtual pcie switch port(VSP), sometimes VSP pcie devices
doesn't bind to pcieport driver. Without pcieport driver pcie PM
comes without any warranty and with unbounded VSP runtime pm and
system wide suspend/resume IGT test cases may get pass as false
positive.

Therefore assert the xe_pm igt tests on unbounded VSP.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/xe/xe_pm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index 23b8246ed..78d9374cf 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -33,6 +33,7 @@
 typedef struct {
 	int fd_xe;
 	struct pci_device *pci_xe;
+	struct pci_device *pci_parent;
 	struct pci_device *pci_root;
 } device_t;
 
@@ -344,6 +345,7 @@ NULL));
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_query_config *config;
 	device_t device;
 	char d3cold_allowed[2];
 	const struct s_state {
@@ -369,8 +371,15 @@ igt_main
 		device.fd_xe = drm_open_driver(DRIVER_XE);
 		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
 		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
+		device.pci_parent = pci_device_get_parent_bridge(device.pci_xe);
 
-		xe_device_get(device.fd_xe);
+		config = xe_device_get(device.fd_xe)->config;
+
+		if (config->info[XE_QUERY_CONFIG_FLAGS] & XE_QUERY_CONFIG_FLAGS_HAS_VRAM) {
+			igt_assert(device.pci_parent);
+			igt_assert_f(!pci_device_has_kernel_driver(device.pci_parent),
+				     "pci bridge device does not bind with pcieport driver\n");
+		}
 
 		/* Always perform initial once-basic exec checking for health */
 		xe_for_each_hw_engine(device.fd_xe, hwe)
-- 
2.25.1

