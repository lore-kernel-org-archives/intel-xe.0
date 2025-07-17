Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F209C83F34
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 18:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156D910E324;
	Thu, 17 Jul 2025 18:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YY7MyTql";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B16810E0B7
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 18:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752778118; x=1784314118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0mGZUiJMN8e84FtHmgLL0/h+Qdx46o/ZmkP8fNLRZPs=;
 b=YY7MyTqltm7tVF4+T2R7VXBVstnz2v8U2ShikTmQmA7RM5VnaMjRgGSC
 /uzF1XNwaicM8Z4beVX+MOLTKQ3Olbwz0QYR+bJwIP97mvI6Jjvo3BT8j
 zAXLOFBZzElkih1c0CcVUN02E89SrCT9FRs7q7AtVE0eU9ka1DcPrHAvx
 W8O0n27Zl2YNj0Vm8X1cdc6Gs4XxI3o0x3WsfL+MxQeZUD+/iDcf2el47
 D8yrW43v58fsjlIvHMxybYfUBH+JLFOu7fM5P3wsnk/lygNfqrOv2h1ga
 jUsDoORmK4wjgp9IrX5FkOn32f00OMi6G1sc/g64qqfJq9gdSBNknK9OI g==;
X-CSE-ConnectionGUID: M5k7cHPVTZm6IqX/ecEegw==
X-CSE-MsgGUID: 8B9wGc24TS+dwl5s4vkEEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="80513736"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="80513736"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 11:48:38 -0700
X-CSE-ConnectionGUID: oRRfZeAcQPOhYLMLrIGSHQ==
X-CSE-MsgGUID: RpbnjdlRQmOnZw57z9dRGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="181580948"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 11:48:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/5] drm/xe/configfs: Fix pci_dev reference leak
Date: Thu, 17 Jul 2025 20:48:21 +0200
Message-Id: <20250717184825.851-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250717184825.851-1-michal.wajdeczko@intel.com>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
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

We are using pci_get_domain_bus_and_slot() function to verify if
the given config directory name matches any existing PCI device,
but we missed to call matching pci_dev_put() to release reference.

While around, also change error code in case of no device match,
to make it more specific than generic formatting error.

Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 8ec1ff1e4e80..e9b46a2d0019 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -267,7 +267,8 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 
 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
 	if (!pdev)
-		return ERR_PTR(-EINVAL);
+		return ERR_PTR(-ENODEV);
+	pci_dev_put(pdev);
 
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
-- 
2.47.1

