Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E92CD2D8DA
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 10:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7860010E506;
	Tue, 27 Jan 2026 10:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V0UBrVKQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FD410E506;
 Tue, 27 Jan 2026 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769508099; x=1801044099;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QYia554mp1quyVc1FEkYlwYNLcQmGqna5Zbc2X+gZ28=;
 b=V0UBrVKQTZeQ1bdBePNid/Kmr+h13r+1XbEtoFqsijOoIygLPK9tLXaj
 vullOo0RKd8YFlthHtQ/OQ1zmw4c7cWfgwFC1J3Y5wyKVGNuQcgejB5eW
 xulzvZbIl5wdaO/ybXLYfortk9ajkhd9Z8i+l91UKevSfuWOZbE2RJsrx
 kk3TnEGsC/JQWRMQe+VS+XCcnNcuPJdbNxl/ukSOWnWQRLlP4GLN/oa4D
 BCy2p8C5JMcdWNUdI8QNunmr+bl0KR79UF5mA3gmFQzFeGIp8i3OAGGmU
 3ZEScIVNSoajqoLbSreQnsOrEbcUa0ohBUZT6V2WcF+DygeXgsUbiNPPk w==;
X-CSE-ConnectionGUID: s8FWz3i7QR2FwwJ7P4KcUg==
X-CSE-MsgGUID: dF7ymtNqS4KU+e2FucIHqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70602207"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70602207"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 02:01:38 -0800
X-CSE-ConnectionGUID: ugV8p5aPQeuGcxv9Qbdn+Q==
X-CSE-MsgGUID: jsvZGtBcQ16ahmq4In9Xgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207732492"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.153])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 02:01:35 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v2 0/6] lsgpu: Report upstream port link bandwidth
Date: Tue, 27 Jan 2026 10:54:17 +0100
Message-ID: <20260127100123.114516-8-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

v2: Keep dump_props_and_attrs() generic: hand over decision on omitting
    link attributes to the caller, and implementation of the check to a
    helper (Sebastian),
  - drop unclear GET_REG_MASK macro (Sebastian),
  - reuse no longer needed variable containing PCI_HEADER_TYPE for storing
    PCI_EXP_FLAGS_TYPE,
  - maintain a single instance of struct pci_access throughout processing
    of the whole udev device list (Sebastian),
  - hand over detection of AER attributes to a helper,
  - merge a formerly separate patch "lib/igt_device_scan: Don't print
    bridge not applicable attributes" into "lib/igt_device_scan: Print GPU
    upstream port parent/child relations" (Sebastian),
  - allocate memory to local attributes of a bridge for safety (Sebastian),
  - no need for DEVTYPE_BRIDGE, just skip attributes if NULL.

Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

Janusz Krzysztofik (6):
  lib/igt_device_scan: Don't print fake link bandwidth attributes
  lib/igt_device_scan: Split out reusable part of update_or_add_parent
  lib/igt_device_scan: Include PCIe bridge upstream port if available
  lib/igt_device_scan: List PCIe bridge ports after their children
  lib/igt_device_scan: Omit AER statistics data from attributes
  lib/igt_device_scan: Print GPU upstream port parent/child relations

 lib/igt_device_scan.c | 199 +++++++++++++++++++++++++++++++++++-------
 lib/meson.build       |   2 +
 meson.build           |   1 +
 3 files changed, 170 insertions(+), 32 deletions(-)
-- 
2.52.0

