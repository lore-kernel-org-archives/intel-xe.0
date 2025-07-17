Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFA4C83F34
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 18:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8379110E886;
	Thu, 17 Jul 2025 18:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9GdTEes";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65D110E0B7
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 18:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752778122; x=1784314122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OJwbxl1XoWq4KtXdcTGEixJWyrOkt0qjzDxN1QP6o50=;
 b=k9GdTEesNBGCEm6zsliREstay5BUyf+Vov5uv9jNtvF+2bVJHaSb/cWF
 ZcYUAz8r8d23vR8EqXB8ikp5SOLtDNF5kh2M71LDE7ZFWautCZw492ydC
 RiSummwAHi9ePdUC8AU9UgIAHCnFOrmQIG94iVJI7qK6lypWDGoDQ3DYW
 ldqDmSCH9O5UXuwfxYLpLnF8PKjd4NA5F25xX6QDOzeM/Q3R2DSpUAWyp
 ZwQj5gWWQjLxiwlwn9rXDUqxsG0WEv2vItOW6Pp8ATQ/ykeogZfy0R0x2
 vGC1Gl1XI9R+68pn1L8ZuBCoBSw+cO8XDsLqzWHtydyFnN/NMXcEzLIWs Q==;
X-CSE-ConnectionGUID: 0i8z8shtSuy7LpAAfKXj2w==
X-CSE-MsgGUID: GgFlQLw6SROTYMswfNhOmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="80513745"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="80513745"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 11:48:42 -0700
X-CSE-ConnectionGUID: hb6CS/u8R2aL508ko+fsyA==
X-CSE-MsgGUID: oyxVGTt3TX+57AtDvODZLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="181580963"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 11:48:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Intel VGA
 devices
Date: Thu, 17 Jul 2025 20:48:24 +0200
Message-Id: <20250717184825.851-5-michal.wajdeczko@intel.com>
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

The Xe driver supports only Intel GPUs devices that all are PCI
VGA class devices. Reject creation of configuration directories
for PCI device addresses that are not Intel or VGA.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 00bb4e412c12..1df8cce78f13 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -260,6 +260,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	struct xe_config_device *dev;
 	struct pci_dev *pdev;
 	char canonical[16];
+	bool match;
 	int ret;
 
 	ret = sscanf(name, "%x:%x:%x.%d", &domain, &bus, &slot, &function);
@@ -275,8 +276,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
 	if (!pdev)
 		return ERR_PTR(-ENODEV);
+
+	match = pci_is_vga(pdev) && pdev->vendor == PCI_VENDOR_ID_INTEL;
+
 	pci_dev_put(pdev);
 
+	if (!match)
+		return ERR_PTR(-ENODEV);
+
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
-- 
2.47.1

