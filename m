Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21EDC10DC1
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 23:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7314910E69A;
	Wed, 29 Nov 2023 23:28:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F052A10E0F9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 23:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701300514; x=1732836514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YcrzXrkpNo3IG2RwyccTbkRhRGlhFqF6hvF3oLYo5I4=;
 b=TmZTHKxS7egNgmpXqs94sq8hSnfm1CB7TPVwZuqE1en13jXyF5ioYSLk
 y/84NCp5SXA0tKqxoLJ8X8tH/Dcq233dS7ArIHGsJJXsKJft6mrxHDKC2
 uheJ7sBFx48b0F7wve7vDE4hvZNDBrUg2hXrVSiwHQBEMSlTVA0YlQsBT
 1L4fdmHBoQ2mKDzE0Rjdd3cZvb5T+DErcx9eX3UTEXI4YSnB87JFXW9Yz
 0Mzmkr2m06zoSIAhoWfFDWE+NIvUSJbwFEwjIoYWOsiEdTMDMSH0grDmk
 sTuCE5+qvBc1asB7HtzWAT3y7jLXTqwYIqzcLQ0gNlF7+lsO0dn9LiONP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="14797373"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="14797373"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 15:28:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798088840"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="798088840"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 15:28:32 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 29 Nov 2023 15:28:04 -0800
Message-Id: <20231129232807.1499826-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129232807.1499826-1-lucas.demarchi@intel.com>
References: <20231129232807.1499826-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/5] drm/xe/kunit: Remove handling of
 XE_TEST_SUBPLATFORM_ANY
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The only user passing XE_TEST_SUBPLATFORM_ANY is
xe_pci_fake_device_init_any(), but then the function would return
earlier when handling XE_TEST_PLATFORM_ANY. Platforms without a
subplatform use XE_SUBPLATFORM_NONE.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index f2cdc9bb4612..3d260edd5849 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -128,11 +128,6 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
 	if (!ent->device)
 		return -ENODEV;
 
-	if (subplatform == XE_TEST_SUBPLATFORM_ANY) {
-		subplatform_desc = desc->subplatforms;
-		goto done;
-	}
-
 	for (subplatform_desc = desc->subplatforms;
 	     subplatform_desc && subplatform_desc->subplatform;
 	     subplatform_desc++)
-- 
2.40.1

