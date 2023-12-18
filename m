Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA977C35274
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7903F10E3A8;
	Mon, 18 Dec 2023 19:07:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D9010E381
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926402; x=1734462402;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xDTLWYc49V8H4e8O/YCcTZWFxSRkTo/ct/69pRC3hSs=;
 b=VVEaGxzAksmMAuVpidUfYKdNvOeboQ7fPoBPma3QnS5qvesMFIan/4Al
 bNHKGLvu2tpugEoz58YdZbUlblgJQP6Ok2HvB42UQ8c/lLmtNfw5pUeZ8
 1PfXv9xuBf/8FuoySJp18YdjSPiR7z/17YffC9QUxmmztsiuR3eUKLPyZ
 Jsppa/43NKaU9FRVz54LQ8bQwGt1i7GMSCDytrC0uFQNafkttycX37BuG
 W4NEUC1w6V/pJHLmrKWRfzsibJ87Gxo/EcFh++Y1uwP1n4Lf8j25ld2DM
 5CVx2VUIQkfg7q0Y/hWr8CqlBXQb8eClAifLdfZus9Uhix8cgRZI1kePz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="399382191"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="399382191"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 11:06:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="866330872"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="866330872"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.130.107])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 11:06:41 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 04/10] drm/xe/kunit: Set SR-IOV mode of the fake device
Date: Mon, 18 Dec 2023 20:06:23 +0100
Message-Id: <20231218190629.502-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231218190629.502-1-michal.wajdeczko@intel.com>
References: <20231218190629.502-1-michal.wajdeczko@intel.com>
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

We want to add code that will check the driver's SR-IOV mode.

Update xe_pci_fake_device_init() and struct xe_pci_fake_data to
either explicitly specify desired SR-IOV mode of the fake device
or fallback to the default bare-metal mode.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 3 +++
 drivers/gpu/drm/xe/tests/xe_pci_test.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 602793644f61..f62809ca8b51 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -156,6 +156,9 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 		return -ENODEV;
 
 done:
+	xe->sriov.__mode = data && data->sriov_mode ?
+			   data->sriov_mode : XE_SRIOV_MODE_NONE;
+
 	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
 
 	xe_info_init_early(xe, desc, subplatform_desc);
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index 811ffe5bd9fd..f40dcec83992 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 #include "xe_platform_types.h"
+#include "xe_sriov_types.h"
 
 struct xe_device;
 struct xe_graphics_desc;
@@ -23,6 +24,7 @@ void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn);
 void xe_call_for_each_media_ip(xe_media_fn xe_fn);
 
 struct xe_pci_fake_data {
+	enum xe_sriov_mode sriov_mode;
 	enum xe_platform platform;
 	enum xe_subplatform subplatform;
 	u32 graphics_verx100;
-- 
2.25.1

