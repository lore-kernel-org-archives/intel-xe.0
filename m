Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0657BC4451E
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 11:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD44210E765;
	Wed, 21 Jan 2026 11:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sg+Ga+h1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E7B10E764;
 Wed, 21 Jan 2026 11:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768996098; x=1800532098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sqctI/o4Nxt2RarSWdgDgB+r7b7zlowPHIQucyWjuZc=;
 b=Sg+Ga+h1e+vbUD3fJCah2gRKPP2mScJPnRovaRc4/Ad1bOrCBA9cJ1Am
 TgHXm7yna41nwLDIju1hDuxwTG2hnnzgQyk7EdAvYlbFla1RPRzhqGrT4
 or/KMcQshOkLzWLWUtvpItkRybJWe35ECJdP+2BVcAoPraa6bkg28x5R2
 SfUKXb+KNGRuHwVQcqxaExc5CsPUASycIOWlhVAzCa7Jxd4/QCdTs3cI/
 WXRn6MMYgK6CPXYRYtEmoPN9bqKJO865Hwr5cgcblq+Zubbn7DfGXsNJH
 VMty0vMWnAinENWG0ebj8YKvRKTWLvCLAkb8XQMWnd2P3Umr+uklNd2eI g==;
X-CSE-ConnectionGUID: Ukc0fD2NTwOeRr24l4ycQA==
X-CSE-MsgGUID: oRzYdOpOR8eJXU0llPp7wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92889113"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="92889113"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:48:18 -0800
X-CSE-ConnectionGUID: fIabzwdjSEyvPeW+HwFVaw==
X-CSE-MsgGUID: obeYY1L+SQ6o5YHk8pbYyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206347771"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.246.125])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:48:16 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t 4/7] lib/igt_device_scan: List PCIe bridge ports after
 their children
Date: Wed, 21 Jan 2026 12:42:22 +0100
Message-ID: <20260121114656.1970684-13-janusz.krzysztofik@linux.intel.com>
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

Current device sorting algorithm positions PCIe bridge upstream ports
between DRM and PCI devices of their GPU children.  Listing those two not
interleaved with bridge ports, and the ports following their PCI GPU
devices, seems more clear.  Go for it.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_device_scan.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 34c7a8131b..61f507a06d 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -23,6 +23,7 @@
  */
 
 #include "drmtest.h"
+#include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_device_scan.h"
 #include "igt_list.h"
@@ -1061,6 +1062,7 @@ static struct igt_device *duplicate_device(struct igt_device *dev) {
 static int devs_compare(const void *a, const void *b)
 {
 	struct igt_device *dev1, *dev2;
+	unsigned int len1, len2;
 	int ret;
 
 	dev1 = *(struct igt_device **) a;
@@ -1069,6 +1071,12 @@ static int devs_compare(const void *a, const void *b)
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

