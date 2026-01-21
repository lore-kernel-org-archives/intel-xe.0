Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CA4C4451E
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 11:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B1110E75F;
	Wed, 21 Jan 2026 11:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lIqrtud9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE4C10E75E;
 Wed, 21 Jan 2026 11:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768996091; x=1800532091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sO71AlJ1XkvEZqe5vQX1RYGuLzomVJxsld02HDnWCOI=;
 b=lIqrtud9L2OwbQWzq5SdetoR4mOn9BjDsbyOhyDke1+OewqKfq0jaISd
 mUg9Q/OdIr4GzFW6ecM1CK+emcbLprhEwjo+TaK39uRjnqmtbND/cWD7A
 cxsonRBVMY4XY//ZKetAzkjWoywR6iNe/focjAu8Bq/qh4RKaljlhS9s8
 k54fxlTeiA3afgdOUu/oXrT/PSMyyfHZqZQ3HrF+6H4VnOPqW3+/ECLtX
 upAqtiZzF+bobhsVPtkHCDFQSUu5NVgvHy+v6K85URewowYjofIwY5rBd
 Drmpjaom/urURc3gjyGusTM1eMiNcm1pBZzSRLDRne4bdIt/YG1vo1eZr g==;
X-CSE-ConnectionGUID: vZcNwsQXRhWLREdDQFhc9A==
X-CSE-MsgGUID: UycWdtV7SKCxGlIPdEYaMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92889106"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="92889106"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:48:10 -0800
X-CSE-ConnectionGUID: pnFRxB+ZQWG++mHq+rai9g==
X-CSE-MsgGUID: qUgre50ESP60W/74zKvI3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206347728"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.246.125])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:48:08 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t 1/7] lib/igt_device_scan: Don't print fake link
 bandwidth attributes
Date: Wed, 21 Jan 2026 12:42:19 +0100
Message-ID: <20260121114656.1970684-10-janusz.krzysztofik@linux.intel.com>
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

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10753
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_device_scan.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index abd8ca209e..7753262a53 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -613,6 +613,14 @@ static void dump_props_and_attrs(const struct igt_device *dev)
 
 	printf("\n[attributes]\n");
 	igt_map_foreach(dev->attrs_map, entry) {
+		/* omit fake link bandwidth attributes */
+		if (dev->dev_type == DEVTYPE_DISCRETE &&
+		    (!strcmp(entry->key, "max_link_speed") ||
+		     !strcmp(entry->key, "max_link_width") ||
+		     !strcmp(entry->key, "current_link_speed") ||
+		     !strcmp(entry->key, "current_link_width")))
+			continue;
+
 		_print_key_value((char *)entry->key, (char *)entry->data);
 	}
 	printf("\n");
-- 
2.52.0

