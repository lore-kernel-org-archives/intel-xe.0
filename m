Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD76606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 05:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XU/z12LY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A76112312;
	Thu, 22 Oct 2026 05:13:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE8A112312
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 05:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792646020; x=1824182020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hlztRoBGPa61+oS+R9RDHk0iK6Cv0Vod7puwi9F3ias=;
 b=XU/z12LYC+uFrWwhXqM85nMlU1Ovw7x47IOOMlz6IQp/AYtS2nRmMVot
 vsoula5V9E9OF9vGbrLZQ2R6vEdbGQTFBRxzxe70P71/7v8QElzpq0cX4
 hIkr/fQ5945qu/YkGgi2mm3hxztBmDK4KaYBs4IZcsiabXSnl3aajIIiy
 6yjXmlmZtOHzrxmnRnxP3IB3rigiLEQq/V8BPkKAsOsydNAnDbjjo0nCo
 EyC1Un3V8jr2zrvEHlojlFNbSX3x2IG3D4NjmyhqZqhIomQRzsCWURLPl
 vee2QnD8h3rt/8epY14PXhY+ULJgD+xgmJQU2HXBSvKbzMu98dOU2jCCY Q==;
X-CSE-ConnectionGUID: OBOCq9TgQiOfFtRVddJdVA==
X-CSE-MsgGUID: aP1JD1b8Rfqm97bwmFfJ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1393952"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1393952"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:13:40 -0700
X-CSE-ConnectionGUID: uZEOmSPxQR2740/I+MpGBA==
X-CSE-MsgGUID: Oav4MyRRTd2DKEFqy8Y98Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3268757"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 21 Oct 2026 22:13:38 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v14 6/9] drm/xe/pci_error: Flush GT wedge worker before bus
 reset
Date: Thu, 22 Oct 2026 10:42:30 +0530
Message-ID: <20261022051303.282805-7-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022051303.282805-1-raag.jadav@intel.com>
References: <20261022051303.282805-1-raag.jadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With GT wedging now done async, make sure the wedge worker is flushed to
avoid side-effects during PCI bus reset.

Fixes: 13b9555ffb03 ("drm/xe/xe_pci_error: Implement PCI error recovery callbacks")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_error.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index e1b9dc5f0a6d..a5c8fd67738c 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -30,8 +30,10 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 
 	xe_device_set_in_reset(xe);
 
-	for_each_gt(gt, xe, id)
+	for_each_gt(gt, xe, id) {
 		xe_gt_declare_wedged(gt);
+		flush_work(&gt->wedge.worker);
+	}
 
 	pci_disable_device(pdev);
 }
-- 
2.43.0

