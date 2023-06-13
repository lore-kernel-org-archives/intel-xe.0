Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78DCEB64D0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 17:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9714E10E350;
	Tue, 13 Jun 2023 17:47:40 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F36910E350
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 17:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686678459; x=1718214459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QDIhYrsMRSrxN92G3ephmCXTukkee94lvOr+4nTaYck=;
 b=P8A/uu24Pmokul0WywMSo/qBKBpJRpxrbG+HM+Wq0pWXxL/2B3Uvs/us
 cO6WdWvRaJGlBrBVB8QXEvedDdPRjRKSwXVGwCbQlwt00x8Ewtcw8KBlO
 u34ipFKbJmJOY2CLPplyELyM1vXkkrBC9tfHEwB7da0M5Qh1SrYJfOPoX
 fNmcBVPH74STXBNVn8EI3vCb7aAaTgO+H1aAycHGAOgNIETHWzoXphIdg
 eUALGT9a4k+y+OfKD7xrCMy9LrtliBU4r4I5R8dlqB3wdN69dXc1nfcq2
 LW2KPA927nYyEmVksHReOD/mV4WaE/ETbA3GcyUxW9Nekge6DSuqrytCG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="386811411"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="386811411"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 10:45:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="781770951"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="781770951"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 10:45:49 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 13 Jun 2023 10:47:39 -0700
Message-Id: <20230613174740.786041-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/kunit: Handle fake device creation
 for all platform/subplatform cases
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For platform like Alderlake P there are subplatforms and
just Alderlake P. Unlike DG2 in which every flavour is
either a G10,G11 or G12 variant. In this case(Alderlake P/S),
the Kunit test evaluates the subplatform to NONE and is
unable to create a fake device. Removing the condition
in xe_pci_fake_device_init() to support this corner case
so driver can proceed with the unit testing.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 2178ad71c0da..a40879da2fbe 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -139,9 +139,6 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
 		if (subplatform_desc->subplatform == subplatform)
 			break;
 
-	if (subplatform == XE_SUBPLATFORM_NONE && subplatform_desc)
-		return -ENODEV;
-
 	if (subplatform != XE_SUBPLATFORM_NONE && !subplatform_desc)
 		return -ENODEV;
 
-- 
2.25.1

