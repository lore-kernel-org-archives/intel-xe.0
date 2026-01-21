Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C310C44520
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 11:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40BA10E75D;
	Wed, 21 Jan 2026 11:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LztYWaX+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D4410E12F;
 Wed, 21 Jan 2026 11:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768996088; x=1800532088;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eHXaJggzG1lcO9MrNDZ6KddNlyYqMj8KaMP9wSzWSxQ=;
 b=LztYWaX+B8Xg2I+3x6ilVaGcb7SZ9f0jGLjbSnAQQpTKm83mKnkaJ3Ni
 xq3HyzHrNp/FM/a9g8CJblYESpoS/eWFMH4Cigqbl2EOOloTc//cWh9hi
 Y2CkKfmQGewFsNCohsUFAibcSQMUP80s2TheuOlMs6xO/zQQgMMYCWpKR
 uv/ZFeLw6UF7HkbTkEBKaYYYkrQ8gRmxdQ6Az/8lWBcY89PcCdEwDE4t1
 yGbpqprgmxgWbG1/uhk1xD57j8X3b7afJtBmBvf4v7aNIp61puvuwtQoO
 3P6cIacCFWm3dFJOXjqUIhaUNFFOwCC7uezoW18kJKPAHDj50FOuvuCD2 g==;
X-CSE-ConnectionGUID: sij24A9PSDa8OAuc34p6KQ==
X-CSE-MsgGUID: KvQSeNCmRFuxWrwDHWNaMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92889105"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="92889105"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:48:08 -0800
X-CSE-ConnectionGUID: En6B4UrgQGuDFhO3HkG+tA==
X-CSE-MsgGUID: 47BCdHCwQsOCLhyCAA38cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206347720"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.246.125])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:48:05 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t 0/7] lsgpu: Report upstream port link bandwidth
Date: Wed, 21 Jan 2026 12:42:18 +0100
Message-ID: <20260121114656.1970684-9-janusz.krzysztofik@linux.intel.com>
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

Janusz Krzysztofik (7):
  lib/igt_device_scan: Don't print fake link bandwidth attributes
  lib/igt_device_scan: Split out reusable part of update_or_add_parent
  lib/igt_device_scan: Include PCIe bridge upstream port if available
  lib/igt_device_scan: List PCIe bridge ports after their children
  lib/igt_device_scan: Omit AER statistics data from attributes
  lib/igt_device_scan: Don't print bridge not applicable attributes
  lib/igt_device_scan: Print GPU upstream port parent/child relations

 lib/igt_device_scan.c | 179 +++++++++++++++++++++++++++++++++++-------
 lib/meson.build       |   2 +
 meson.build           |   1 +
 3 files changed, 153 insertions(+), 29 deletions(-)

-- 
2.52.0

