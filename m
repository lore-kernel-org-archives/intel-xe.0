Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F123D3F096
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 16:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B8510E739;
	Wed, 28 Jan 2026 16:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9ECJr1D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6F710E751;
 Wed, 28 Jan 2026 16:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769616671; x=1801152671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lKcQyX3omdng0Y9mD9i03JdmzOQABbNH4/PPbRnCgIc=;
 b=D9ECJr1DIvSbkCXLlF7grtnTvklTcJPXL0DX17kByWMC+Pp35fXKlQN0
 mN32Rcn2WvAdfGqKe9VqRZxiHopmaym5zZqLEb7YHp6WXGgK9c0sbc8W9
 eLyOlBtj4JdGzryQRecAcDm5PA9N1RL98ehcqpFOMAhH/baDbL+byOtvD
 USyraT+O5P9M+EUhIZ7gQvM3yniWnw0L4S17sMigncZik1DKuvmtHWmJp
 Kd2l8+tdUp6orkP5jVhHOgLX6nXofSjmuMzMxQI28wXJjerodXDqB7UUd
 jbrrkb/0qqRXYD1+Uboz+chnC3icQU46y8lCvs8NE7S3bD4DPoFHVbR1m Q==;
X-CSE-ConnectionGUID: EIp5jmzLS+yDInXpM24Cig==
X-CSE-MsgGUID: dbqEoMmLSX6MALbACtDE/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82262446"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82262446"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:11:10 -0800
X-CSE-ConnectionGUID: 6LARn+tNTRipW0nRyHpzpg==
X-CSE-MsgGUID: YhHup8idT2uPBMOb2KFeqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208546982"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.210])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:11:07 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v3 4/6] lib/igt_device_scan: List PCIe bridge ports
 after their children
Date: Wed, 28 Jan 2026 17:09:02 +0100
Message-ID: <20260128161041.225652-12-janusz.krzysztofik@linux.intel.com>
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
index bd88e61b10..32f3a3b977 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -23,6 +23,7 @@
  */
 
 #include "drmtest.h"
+#include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_device_scan.h"
 #include "igt_list.h"
@@ -1064,6 +1065,7 @@ static struct igt_device *duplicate_device(struct igt_device *dev) {
 static int devs_compare(const void *a, const void *b)
 {
 	struct igt_device *dev1, *dev2;
+	unsigned int len1, len2;
 	int ret;
 
 	dev1 = *(struct igt_device **) a;
@@ -1072,6 +1074,12 @@ static int devs_compare(const void *a, const void *b)
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

