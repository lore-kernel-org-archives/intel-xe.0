Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BE3EB64DA
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 18:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C557510E3DC;
	Tue, 13 Jun 2023 18:28:43 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1955D10E3DB
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 18:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686680921; x=1718216921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p2A7lvSobyXJeyDc8lTOBznPU/hFD1c41PuJ3D9iOUw=;
 b=JNNSToUHXbnFi/tb6i2ikoW/W2akSwnBoL7unohEYLv+XmZlyp4f0cnL
 ldStfCyLGaNxjcmJbpNbLyNR1WKI2zn0u6kARwgnB/T8SosrejyPVNIMe
 fc7a2Hpugi6RLzskyH6VURxT5JcomDGYiifpxXu5qnLUp2FpQQ7JtJTNl
 KMfzl/CA0Xa58MekGBjOmtf+yY0rEZs/DHi5TzmVhH4iB0ezzYIOteYgN
 xb/fCM2sTzanZHJb3XSegD5tliJXfCOxuTY59KxoGxYhFyg8BsK/BqQ91
 Ui4MHqj2xzLXEByy43b5Z3io1FxIMN7Ocw3jd2PYSmD631V8rCnY2RDUS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="358422538"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="358422538"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 11:28:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="689118905"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="689118905"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 11:28:39 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 13 Jun 2023 11:30:46 -0700
Message-Id: <20230613183047.787756-1-anusha.srivatsa@intel.com>
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

