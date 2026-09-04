Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA38C79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 17:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BDF10FA8D;
	Fri,  4 Sep 2026 17:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GOroZKQu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B483C10FA8D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 17:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788541546; x=1820077546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LgPXvg0sCkOk6m6a1UF5g4V3RN0Ks2Hpbu8ydHYEqNM=;
 b=GOroZKQumhyUTBxihx8+DpTL8/DICEScU7J1LjfP4T+/zMw4JUTW+2FK
 tzTbev2ZaXkjCp9vr2K2zc8JkqeY8pHJn02PEl+yb3rCa1yHrMNdoe11T
 i8dZ/TdB4AAFmaqq0gR2rdSYnkAZ2Odyk6oVofxTDQ+QrkGTik8BoVogc
 /iUloy+jPWHE2u309+FATFZanhQ9xDcqnDGxiufn3QrNy2tjRpodNAG3N
 KpuNUYN1/Gw8az0Y9r8Pod/ETO/3S9+mdUEgxngaLFicAySZ4Y1J0+OWc
 NudxDas7rhmVakcLwV4Ga+3YyU5pf9yl8ooy86PuqNY/5UmbPYrzWkwto A==;
X-CSE-ConnectionGUID: DoqN4l9XQcW3Jd9Sx7XTVA==
X-CSE-MsgGUID: YWupfuBpQu2Bi/v95MY0aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89082204"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89082204"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:05:45 -0700
X-CSE-ConnectionGUID: tUtiuElrRFSnMPz+VNmHCg==
X-CSE-MsgGUID: lWo3zqd9Th6Sv2k2K0HPmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="273882666"
Received: from johndonn-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.174])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:05:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 2/6] drm/xe: Keep reference to device descriptor
Date: Fri,  4 Sep 2026 19:05:26 +0200
Message-ID: <20260904170531.516-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904170531.516-1-michal.wajdeczko@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
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

While we already use struct intel_device_info, which has some fields
copied or derived from the original struct xe_device_desc, we also
want to keep the reference to the whole device descriptor, in case
we would like to access more non-mutable device parameters.
Similarly keep the reference to matched subplatform descriptor.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c    | 2 ++
 drivers/gpu/drm/xe/xe_device_types.h | 6 ++++++
 drivers/gpu/drm/xe/xe_pci.c          | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 4965a01f6ba5..48d5ee478fe6 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -374,6 +374,8 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 		return -ENODEV;
 
 done:
+	xe->desc = desc;
+	xe->subplatform_desc = subplatform_desc;
 	xe->sriov.__mode = data && data->sriov_mode ?
 			   data->sriov_mode : XE_SRIOV_MODE_NONE;
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 180d450a6deb..6406a1228c38 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -116,6 +116,12 @@ struct xe_device {
 	/** @devcoredump: device coredump */
 	struct xe_devcoredump devcoredump;
 
+	/** @desc: device descriptor */
+	const struct xe_device_desc *desc;
+
+	/** @subplatform_desc: subplatform descriptor */
+	const struct xe_subplatform_desc *subplatform_desc;
+
 	/** @info: device info */
 	struct intel_device_info {
 		/** @info.platform_name: platform name */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 47fad696545c..191e69fb0e3d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1208,6 +1208,8 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
 
+	xe->desc = desc;
+	xe->subplatform_desc = subplatform_desc;
 	xe->devres_group = group;
 
 	pci_set_drvdata(pdev, &xe->drm);
-- 
2.47.1

