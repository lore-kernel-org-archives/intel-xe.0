Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561B5C10F05
	for <intel-xe@archiver.kernel.org>; Sun, 10 Dec 2023 18:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BBC10E335;
	Sun, 10 Dec 2023 18:07:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E23010E32F
 for <intel-xe@lists.freedesktop.org>; Sun, 10 Dec 2023 18:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702231667; x=1733767667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=48RgBEiHn/3Gn2syk+X/1E7RV3MoT/IXWKTgd0Fki7k=;
 b=H+DqYT363x7ItQv96ZD5Ptsvxu6fO91aZ1dQKjo6gf4QStd3uPfEYMw9
 tm+qACt8a5ysT6OOE6tVhZaDXx2X3x5zDd+8S/xBYYrMqyc8BKzNdKPAm
 1v8woOm3QklGHzrTjd5ZFV8qSlR2ga4m18Xpeh7kMpqcdhpN7LCzXQD7t
 2EhtzENB1vd3Q/GE/hp1lh6p9X0Ug7ZNXZoc2P6ITXbs0ehO6ChsUXLNL
 xmeLm6zK9swibb5SaGOqOeJnjoJSBJbPDg3dkR4gO1OG2d9dhYq9iL4oq
 isJph6VofLo9G+bTIlOpB6hI+t4P6x6kGgjX/HB0yXnXsbQQkygnd+JEu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1437962"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="1437962"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 10:07:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="843229526"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; d="scan'208";a="843229526"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.192])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 10:07:44 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/8] drm/xe/kunit: Set SR-IOV mode of the fake device
Date: Sun, 10 Dec 2023 19:06:55 +0100
Message-Id: <20231210180659.1615-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231210180659.1615-1-michal.wajdeczko@intel.com>
References: <20231210180659.1615-1-michal.wajdeczko@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We want to add code that will check the driver's SR-IOV mode.

Update xe_pci_fake_device_init() and struct xe_pci_fake_data to
either explicitly specify desired SR-IOV mode of the fake device
or fallback to the default bare-metal mode.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 3 +++
 drivers/gpu/drm/xe/tests/xe_pci_test.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 602793644f61..dc5a1c3f897d 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -158,6 +158,9 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 done:
 	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
 
+	xe->sriov.__mode = data && data->sriov_mode ?
+			   data->sriov_mode : XE_SRIOV_MODE_NONE;
+
 	xe_info_init_early(xe, desc, subplatform_desc);
 	xe_info_init(xe, desc->graphics, desc->media);
 
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

