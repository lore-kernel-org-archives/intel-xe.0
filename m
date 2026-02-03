Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9FAE8307A
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 10:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE26910E5C6;
	Tue,  3 Feb 2026 10:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBqT3QxR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D8110E5C3;
 Tue,  3 Feb 2026 10:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770113380; x=1801649380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ZPJLwfoYPMkCd1/CgY9PsK+NIGduKmW+giSQPdOHak=;
 b=KBqT3QxRqpt1hWCrmKJVDyesoFZo7D9T2OCmc4lxRqNagJAAgcIjUxjF
 6MBWKehf8XV7iOPd0F6i7fVfRn4YOC5jKFeILeSKYbBFhoyohrFxNAA7E
 box7H3v1idWhb7kD7/i8VTfbfelnbn0iTwMMKqkCyRWK5dMguFGGNcFCK
 r2vuJS7mFC4OundLHt7N08m15GRcPI5GGsDmfe6DL44ZsCm2hCPYn/eWO
 vFaq6CYjquZwicqpgC9Sgv7HL/Tv5CYqb5XGcrtiCOR/PIhjOuzgKKRAJ
 pn2UdgHj4ejMIWOuy+cpQVHPZKWUh5l/G67NQIeUgaKTgRIkQVUlP8/i0 w==;
X-CSE-ConnectionGUID: kMs3fgMjQ4WBjVXk8MnUuA==
X-CSE-MsgGUID: FY+j6DisRomTQVnWqxyenQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="88702705"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="88702705"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 02:09:40 -0800
X-CSE-ConnectionGUID: EJ1THCBKSi2hvgaeAN1X5g==
X-CSE-MsgGUID: dVG5RvHcRyGJi+MToPDlPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="240476151"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.210])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 02:09:37 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v4 1/6] lib/igt_device_scan: Don't print fake link
 bandwidth attributes
Date: Tue,  3 Feb 2026 11:05:03 +0100
Message-ID: <20260203100920.420551-9-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203100920.420551-8-janusz.krzysztofik@linux.intel.com>
References: <20260203100920.420551-8-janusz.krzysztofik@linux.intel.com>
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

Users of Intel discrete graphics adapters are confused with fake
information on PCIe link bandwidth (speed and size) of their GPU devices
reported by tools like lspci or lsgpu.  That fake information is
unfortunately provided by hardware, Linux PCI subsystem just exposes it
untouched to upper layers, including userspace via sysfs, and userspace
tools just report those fake values.

While we can't do much about the kernel side or general purpose userspace
tools like lspci, we can try to address the issue with our lsgpu utility.

Correct link bandwidth attributes of a discrete GPU card can be obtained
from the kernel by looking not at the PCI device of the GPU itself, only
at a PCIe upstream port of the card's PCI bridge.  For integrity with
content of the sysfs and with output from the other tools, we are not
going to replace the fake information with that from the bridge upstream
port, only show that port and its attributes themselves while listing
devices.

Since the tool uses our udev based igt_device_scan library for identifying
GPU devices and printing their properties and attributes, modifications
that we need apply to that library.

As a first step, exclude the fake data from being printed.

v2: Keep dump_props_and_attrs() generic: hand over decision on omitting
    link attributes to the caller, and implementation of the check to a
    helper (Sebastian).

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10753
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_device_scan.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index abd8ca209e..7ae64375b5 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -602,7 +602,15 @@ static inline void _print_key_value(const char *k, const char *v)
 	printf("%-32s: %s\n", k, v);
 }
 
-static void dump_props_and_attrs(const struct igt_device *dev)
+static bool is_link_attr(const char *name)
+{
+	return !strcmp(name, "max_link_speed") ||
+	       !strcmp(name, "max_link_width") ||
+	       !strcmp(name, "current_link_speed") ||
+	       !strcmp(name, "current_link_width");
+}
+
+static void dump_props_and_attrs(const struct igt_device *dev, bool omit_link)
 {
 	struct igt_map_entry *entry;
 
@@ -613,6 +621,10 @@ static void dump_props_and_attrs(const struct igt_device *dev)
 
 	printf("\n[attributes]\n");
 	igt_map_foreach(dev->attrs_map, entry) {
+		/* omit link bandwidth attributes if requested */
+		if (omit_link && is_link_attr(entry->key))
+			continue;
+
 		_print_key_value((char *)entry->key, (char *)entry->data);
 	}
 	printf("\n");
@@ -1366,7 +1378,8 @@ igt_devs_print_detail(struct igt_list_head *view,
 			_print_key_value("codename", dev->codename);
 		}
 
-		dump_props_and_attrs(dev);
+		/* omit fake link bandwidth attributes if a discrete card */
+		dump_props_and_attrs(dev, dev->dev_type == DEVTYPE_DISCRETE);
 	}
 }
 
-- 
2.52.0

