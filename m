Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613CDC4451E
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 11:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2699510E77C;
	Wed, 21 Jan 2026 11:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2YKlsfI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C4910E76B;
 Wed, 21 Jan 2026 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768996104; x=1800532104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wHmDze3k12U2BMip5y57/a8YYsTat0TAcxrxNQkYKY4=;
 b=Z2YKlsfIY3FEJPRaBzmx2TCUq/cVmtm94sNE7Fo7HsK99B0udO39AGOZ
 vKP5hDjyzNOH6PD0gRmnfGe1X9gdPg4Aq8jQgaiBBvmGDXdohbdKDIKlS
 uU1AsGzJeniCoD1yXja2IaDFzzTMr9bqQJFVB7ofDrmhyvnNbcB16eCEC
 /DOX1cWLPbdAN6pLNs2vAzVUHGx2mWvsxmvwViFQ9jEojeyIGHbdI2mYF
 lyhpdsJz58EqfdcP5r0J6QoFdTm1YSxM30b7nEbgWQ2hExP47eEcFPCrX
 ENdao8lg8P2n3AWIb0X48aLHusBSCz9bfq2uNjE5lgDASmtTwmuBlHuXV A==;
X-CSE-ConnectionGUID: 4sc0dtzaTX6m7t+TMbl5eA==
X-CSE-MsgGUID: 1N3sCveEQ6GWF8iJk3SUjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92889125"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="92889125"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:48:23 -0800
X-CSE-ConnectionGUID: uObAWglvTEmwam/dV69ZnA==
X-CSE-MsgGUID: j2LQPoIxToefbqsaDBPEXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206347795"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.246.125])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:48:21 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t 6/7] lib/igt_device_scan: Don't print bridge not
 applicable attributes
Date: Wed, 21 Jan 2026 12:42:24 +0100
Message-ID: <20260121114656.1970684-15-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121114656.1970684-9-janusz.krzysztofik@linux.intel.com>
References: <20260121114656.1970684-9-janusz.krzysztofik@linux.intel.com>
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

In addition to properties and attributes obtained from udev, print
functions also list some library specific attributes: drm_card,
drm_render and codename.  Those not necessarily make sense for PCIe
bridge upstream ports that follow their PCI GPU devices on the listing.
Skip them.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_device_scan.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 7c58ab84e8..e86da001a9 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -204,6 +204,7 @@ enum dev_type {
 	DEVTYPE_ALL,
 	DEVTYPE_INTEGRATED,
 	DEVTYPE_DISCRETE,
+	DEVTYPE_BRIDGE,
 };
 
 #define STR_INTEGRATED "integrated"
@@ -1055,6 +1056,8 @@ static void update_or_add_parent(struct udev *udev,
 
 	bridge_idev = find_or_add_igt_device(udev, bridge_dev, limit_attrs);
 	igt_assert(bridge_idev);
+
+	bridge_idev->dev_type = DEVTYPE_BRIDGE;
 }
 
 static struct igt_device *duplicate_device(struct igt_device *dev) {
@@ -1313,7 +1316,8 @@ igt_devs_print_simple(struct igt_list_head *view,
 			if (is_pci_subsystem(dev)) {
 				_pr_simple("vendor", dev->vendor);
 				_pr_simple("device", dev->device);
-				_pr_simple("codename", dev->codename);
+				if (dev->dev_type != DEVTYPE_BRIDGE)
+					_pr_simple("codename", dev->codename);
 			}
 		}
 		printf("\n");
@@ -1465,7 +1469,7 @@ igt_devs_print_detail(struct igt_list_head *view,
 	igt_list_for_each_entry(dev, view, link) {
 		printf("========== %s:%s ==========\n",
 		       dev->subsystem, dev->syspath);
-		if (!is_drm_subsystem(dev)) {
+		if (!is_drm_subsystem(dev) && dev->dev_type != DEVTYPE_BRIDGE) {
 			_print_key_value("card device", dev->drm_card);
 			_print_key_value("render device", dev->drm_render);
 			_print_key_value("codename", dev->codename);
-- 
2.52.0

