Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B777AC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 14:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC5F10E9C7;
	Fri, 18 Jul 2025 14:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGPzf64n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFE910E9C7
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 14:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752847540; x=1784383540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8geZYb6Tls+W/gJnFVxeH6J1jEcZ6G+Tegp4gDAGzNc=;
 b=kGPzf64nb4FzBDzzyeiMGU8i+Wct9anyAlUwYURBG5aQCSp+zaQVKgHH
 fCxLQKduNlqB3iGOapBajVE3ucK6Ve9st1a7DqIXJheFNvjjoPH4iGgav
 4SYJUKeEJkjM0GytW/P+NCsMJPWo4jp9+jGOF4iOJLLq9V8reLG0ysnVL
 SnQvQIBYvJWErILEsixpq66NwC8wPLHrJ+ZvOHAAtNf75ifUDsPG+zw5z
 ZI9jK+SrpfPgW9RcAeIjzj+vI8HoO//il+Aqft8+8496BiAcCnpSCq7zi
 9R3/AotCTfPt6tMzfuuLrqyWYpU6soktpvYn1Y/eSGIhDA36xDQbr2sq+ w==;
X-CSE-ConnectionGUID: LidgQ6lnQ1OX1paNaoa3FA==
X-CSE-MsgGUID: SLEJho/QR4eDNHOlBSkoug==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="57754690"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="57754690"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 07:05:40 -0700
X-CSE-ConnectionGUID: N+J42C88T/+RsRDquxVwog==
X-CSE-MsgGUID: fluwhdpVS6SRPN98kFzDZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="195198661"
Received: from avoron-mobl1.ccr.corp.intel.com (HELO
 mwajdecz-MOBL.ger.corp.intel.com) ([10.245.96.74])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 07:05:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 2/5] drm/xe/configfs: Enforce canonical device names
Date: Fri, 18 Jul 2025 16:05:19 +0200
Message-Id: <20250718140519.895-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250717184825.851-3-michal.wajdeczko@intel.com>
References: <20250717184825.851-3-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

While we expect config directory names to match PCI device name,
currently we are only scanning provided names for domain, bus,
device and function numbers, without checking their format.
This would pass slightly broken entries like:

  /sys/kernel/config/xe/
  ├── 0000:00:02.0000000000000
  │   └── ...
  ├── 0000:00:02.0x
  │   └── ...
  ├──  0: 0: 2. 0
  │   └── ...
  └── 0:0:2.0
      └── ...

To avoid such mistakes, check if the name provided exactly matches
the canonical PCI device address format, which we recreated from
the parsed BDF data. Also simplify scanf format as it can't really
catch all formatting errors.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: keep using %x for function (Lucas)
---
 drivers/gpu/drm/xe/xe_configfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index e9b46a2d0019..f5ce48a0adc8 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -259,12 +259,19 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	unsigned int domain, bus, slot, function;
 	struct xe_config_device *dev;
 	struct pci_dev *pdev;
+	char canonical[16];
 	int ret;
 
-	ret = sscanf(name, "%04x:%02x:%02x.%x", &domain, &bus, &slot, &function);
+	ret = sscanf(name, "%x:%x:%x.%x", &domain, &bus, &slot, &function);
 	if (ret != 4)
 		return ERR_PTR(-EINVAL);
 
+	ret = scnprintf(canonical, sizeof(canonical), "%04x:%02x:%02x.%d", domain, bus,
+			PCI_SLOT(PCI_DEVFN(slot, function)),
+			PCI_FUNC(PCI_DEVFN(slot, function)));
+	if (ret != 12 || strcmp(name, canonical))
+		return ERR_PTR(-EINVAL);
+
 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
 	if (!pdev)
 		return ERR_PTR(-ENODEV);
-- 
2.47.1

