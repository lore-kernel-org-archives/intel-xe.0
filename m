Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C48CD3F090
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 16:11:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0354110E742;
	Wed, 28 Jan 2026 16:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOtua6gM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D1010E740;
 Wed, 28 Jan 2026 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769616676; x=1801152676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Aa6yZVedBCpO1gMTLD6kxFOO0eKs2nH/7uhnRYFv+/k=;
 b=dOtua6gMBYJf2S3MaNAnD/YYxxmoKsm+J+ATgWktjfJCgsRkCFuKBLzH
 oqW436lnGjlEB5qRSOKOTfZX1JP93m15hxSYTX4/N6bV7F7VFDgg4Qh/N
 ZkCpphxAmuiGgbbVyVFmukOmrmjmRNF5J6A9mKAwbCls1mFR/slLBA0gc
 nVPUOB3Ga3nrCFR+Wkpecig9bze/8fQWjncdNKCD8qix5p9+5gJwNaQEb
 DXFeJg4GeV5y68oOrnVvgClIHGYxrcKuilRoKr99nNVjzB30iCFvplohX
 MEtOIxFmz6uTVUkozWOhidPiT2vzDgghyqLh13BEZo60EopUQkaIWfgqt g==;
X-CSE-ConnectionGUID: ETbk9pOtR+e5gbAzw4rwtQ==
X-CSE-MsgGUID: bkJr/ePtRoakEX7j4y/Nww==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82262462"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82262462"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:11:15 -0800
X-CSE-ConnectionGUID: +QN1EVbZQuqnNBUr8WdBig==
X-CSE-MsgGUID: OsENfbnAR2GHhPD6GeWFLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208546992"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.210])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:11:12 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v3 6/6] lib/igt_device_scan: Print GPU upstream port
 parent/child relations
Date: Wed, 28 Jan 2026 17:09:04 +0100
Message-ID: <20260128161041.225652-14-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128161041.225652-8-janusz.krzysztofik@linux.intel.com>
References: <20260128161041.225652-8-janusz.krzysztofik@linux.intel.com>
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

In a short listing, lsgpu prints a sysfs path of a PCI GPU parent as a
local attribute of a DRM device.  However, if that's a discrete GPU and
its associated PCIe upstream bridge port has been identified, no
information on that bridge is listed among the GPU attributes.  Follow the
pattern used with DRM devices and also show a PCI slot of the bridge port
as a local attribute of the discrete GPU device.

Moreover, in both short and detailed listings, local attributes intended
for providing device names of GPU associated DRM devices and the GPU
codename are also printed as attributes of related PCIe upstream bridge
port, however, the DRM device names are shown as (null), and the codename
attribute provides raw vendor:device codes of the bridge itself.  Replace
those with PCI slot and codename of the GPU device.

v2: Allocate memory to local attributes of a bridge for safety (Sebastian),
  - merge with a formerly separate patch "lib/igt_device_scan: Don't print
    bridge not applicable attributes" (Sebastian),
  - no need for DEVTYPE_BRIDGE, just skip attributes if NULL.

Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_device_scan.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index f4d2eb6568..96bf0e359d 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -249,6 +249,8 @@ struct igt_device {
 	char *codename; /* For grouping by codename */
 	enum dev_type dev_type; /* For grouping by integrated/discrete */
 
+	char *pci_gpu; /* Filled for upstream bridge ports */
+
 	struct igt_list_head link;
 };
 
@@ -1063,6 +1065,9 @@ static void update_or_add_parent(struct udev *udev,
 
 	/* override DEVTYPE_INTEGRATED so link attributes won't be omitted */
 	bridge_idev->dev_type = DEVTYPE_ALL;
+	bridge_idev->pci_gpu = strdup(parent_idev->pci_slot_name);
+	bridge_idev->codename = strdup(parent_idev->codename);
+	parent_idev->parent = bridge_idev;
 }
 
 static struct igt_device *duplicate_device(struct igt_device *dev) {
@@ -1234,6 +1239,7 @@ static void igt_device_free(struct igt_device *dev)
 	free(dev->device);
 	free(dev->driver);
 	free(dev->pci_slot_name);
+	free(dev->pci_gpu);
 	igt_map_destroy(dev->attrs_map, free_key_value);
 	igt_map_destroy(dev->props_map, free_key_value);
 }
@@ -1330,7 +1336,11 @@ igt_devs_print_simple(struct igt_list_head *view,
 			if (is_pci_subsystem(dev)) {
 				_pr_simple("vendor", dev->vendor);
 				_pr_simple("device", dev->device);
+				if (dev->pci_gpu)
+					_pr_simple("GPU device", dev->pci_gpu);
 				_pr_simple("codename", dev->codename);
+				if (dev->parent && dev->parent->pci_slot_name)
+					_pr_simple("upstream port", dev->parent->pci_slot_name);
 			}
 		}
 		printf("\n");
@@ -1483,8 +1493,12 @@ igt_devs_print_detail(struct igt_list_head *view,
 		printf("========== %s:%s ==========\n",
 		       dev->subsystem, dev->syspath);
 		if (!is_drm_subsystem(dev)) {
-			_print_key_value("card device", dev->drm_card);
-			_print_key_value("render device", dev->drm_render);
+			if (dev->drm_card)
+				_print_key_value("card device", dev->drm_card);
+			if (dev->drm_render)
+				_print_key_value("render device", dev->drm_render);
+			if (dev->pci_gpu)
+				_print_key_value("GPU device", dev->pci_gpu);
 			_print_key_value("codename", dev->codename);
 		}
 
-- 
2.52.0

