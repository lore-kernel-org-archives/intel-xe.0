Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D884BC83F27
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 14:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17E410E6C4;
	Tue, 22 Jul 2025 14:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XS11d6Ij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F0710E6BB
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753193495; x=1784729495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ak8MUEr0Nq2TFxU290ftdCgBe47ELQePX3DmdAt2ViE=;
 b=XS11d6IjlUIjct5vTnDZVqzt3rpxoVVfJr1IX0+q+B5awsLSAbqxx+p4
 b64t3i6p0e1r0Iyw7z3WoTNLGDEvQXOhAoOtMusoVyuXssnZBtcI1FblY
 6SDzSJTZjoO9/j4roJjnT+Xc/6HDLtsHn57U4+qENnosSNC6kYNpM3HxC
 L3Lw0OIu2Lwb46XF2kglKnKOXaHdYSV6ItQmALIq0q8Xs6dDada5mmQ0r
 JtGvwEyO9Lw5suxLcRyQvq/vtE49dC/IHR45nvlRUaZAgT84MGWBwNfjb
 R5Kv6DW3fUKhsXr1nVAkEPZYffs3G16BXt0YvgH9sQEzJsGa3kpoBQx81 Q==;
X-CSE-ConnectionGUID: Ni4cWWc9QD6XI4Skhx8WbQ==
X-CSE-MsgGUID: OMdA90WaRr+2VoBD883QeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="54663031"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="54663031"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:11:35 -0700
X-CSE-ConnectionGUID: xf1HMaYrQSGpvreNu+EQlA==
X-CSE-MsgGUID: ansC2xzUTuii8G64THOyRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163396265"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:11:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 2/6] drm/xe/configfs: Enforce canonical device names
Date: Tue, 22 Jul 2025 16:10:55 +0200
Message-ID: <20250722141059.30707-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722141059.30707-1-michal.wajdeczko@intel.com>
References: <20250722141059.30707-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

