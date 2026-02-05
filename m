Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4355E9129C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 14:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F2610E8F7;
	Thu,  5 Feb 2026 14:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jo9nYI0m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5EF10E8F6;
 Thu,  5 Feb 2026 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770303299; x=1801839299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AXOrB2l0m51bxjC3TVBd0j+SEio9InlQsdwtC0IPQ1g=;
 b=jo9nYI0m55GMOWDQqziXcRqKnaEYsSHo3tkvsd978iyNiE3NYyUUPaKA
 j+ZL4iNQkBp62d2WPX7UbbERs5GBtVZMVeItTPowe78/LCbCpGSP+FqjS
 kiEGsWT5d7uJ2HV5IHDDl+SntIHwmaulWwM8phDiOv74MkPxwv49bWP+R
 VJ/LF1E5yMiGHKk+k70jLk/nflYUlbUwT06c4gvrPRNu0RY3L/Eu+JZeE
 SlofPGRqOFkfb9f1jrlBZPoPr6hc8hvUYDxPyCf+7E/LWyAtxLtcl0c1u
 qdGZtxhc61NE0bk69ahA7+uQHuALFhd1OFIzp+tV/8v7hbi4eetedDWw0 Q==;
X-CSE-ConnectionGUID: e4hf5gFOSLC8PYgIATH8rg==
X-CSE-MsgGUID: hjmD+dOUQLuEB/pw0TwlEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="89083612"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="89083612"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:54:59 -0800
X-CSE-ConnectionGUID: jsCeF6RMTqyAO+GSkib/Qw==
X-CSE-MsgGUID: bT5M7AGJSAq1SbpBxOod+w==
X-ExtLoop1: 1
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.76])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:54:56 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v5 4/6] lib/igt_device_scan: List PCIe bridge ports
 after their children
Date: Thu,  5 Feb 2026 15:51:53 +0100
Message-ID: <20260205145427.1338534-12-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205145427.1338534-8-janusz.krzysztofik@linux.intel.com>
References: <20260205145427.1338534-8-janusz.krzysztofik@linux.intel.com>
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

Current device sorting algorithm positions PCIe bridge upstream ports
between DRM and PCI devices of their GPU children.  Listing those two not
interleaved with bridge ports, and the ports following their PCI GPU
devices, seems more clear.  Go for it.

Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_device_scan.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 9549850005..6fc02a565a 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -23,6 +23,7 @@
  */
 
 #include "drmtest.h"
+#include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_device_scan.h"
 #include "igt_list.h"
@@ -1069,6 +1070,7 @@ static struct igt_device *duplicate_device(struct igt_device *dev) {
 static int devs_compare(const void *a, const void *b)
 {
 	struct igt_device *dev1, *dev2;
+	unsigned int len1, len2;
 	int ret;
 
 	dev1 = *(struct igt_device **) a;
@@ -1077,6 +1079,12 @@ static int devs_compare(const void *a, const void *b)
 	if (ret)
 		return ret;
 
+	len1 = strlen(dev1->syspath);
+	len2 = strlen(dev2->syspath);
+
+	if (len1 != len2 && !strncmp(dev1->syspath, dev2->syspath, min(len1, len2)))
+		return len2 - len1;
+
 	return strcmp(dev1->syspath, dev2->syspath);
 }
 
-- 
2.52.0

