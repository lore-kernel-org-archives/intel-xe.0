Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539CBC4451E
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 11:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D47C10E76F;
	Wed, 21 Jan 2026 11:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4S8NWe4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5898710E767;
 Wed, 21 Jan 2026 11:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768996101; x=1800532101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L66AL8TgVp+OQl0Dlt0rejBB2Dpi5oKjHDja7pbq+YI=;
 b=X4S8NWe4vtmzsKYnLQl6iRCRmlWFWn72I2bxuwW0nF5h/ww9wCopAfAQ
 y31wYcfrSLlLeQVTo3fl6lW4ab7xynmEd6n+CwY8CnQtjoTJc/eQDoOri
 B/n4CPlzBaKFo1ARWj4ciKpadqRem3xXGtfax+PiUMx95fm9JZFdeHeUS
 6MWm3XQ5uz+sKmgu8krkBSTZNSkvaC/k4UGyS5OIoXZktvqWFcZxKMJ3l
 CP99IM96Uaqt0FuJWIsdpCLRKaRPfkZR9e+Nwles8aBRa/XjkybR5EIYl
 SALFlm5A0HWts5FsfHYmdqGNTJTQ63wJ/8Gku2hXy5x8qidXVUdLgAqyf g==;
X-CSE-ConnectionGUID: L0122JtSTCWWDEiBweXuvQ==
X-CSE-MsgGUID: S2zTApZ8TiWsIfZcIf+9/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92889117"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="92889117"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:48:21 -0800
X-CSE-ConnectionGUID: yCJgOeH6TCSg8/5YsCu6yA==
X-CSE-MsgGUID: C9/lmlIsR5CvZZyPUs8fKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206347781"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.246.125])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:48:19 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t 5/7] lib/igt_device_scan: Omit AER statistics data from
 attributes
Date: Wed, 21 Jan 2026 12:42:23 +0100
Message-ID: <20260121114656.1970684-14-janusz.krzysztofik@linux.intel.com>
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

Among attributes of a PCIe bridge upstream port of a discrete graphics
card, there are three AER statistics attributes: aer_dev_correctable,
aer_dev_nonfatal and aer_dev_fatal.  Each consists of a number of key-
value pairs, while the library now expects only single value attributes.
That affects formatting of lsgpu -p output.  In order to print that data
correctly in a human readable form, extra formatting effort would be
needed.  However, users of lsgpu, the only call site of that printing
function of the igt_device_scan library, are not necessarily interested in
that data.  Just drop those attributes from the printout.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_device_scan.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 61f507a06d..7c58ab84e8 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -623,6 +623,12 @@ static void dump_props_and_attrs(const struct igt_device *dev)
 		     !strcmp(entry->key, "current_link_width")))
 			continue;
 
+		/* omit multi-line AER statistics data */
+		if (!strcmp(entry->key, "aer_dev_correctable") ||
+		    !strcmp(entry->key, "aer_dev_nonfatal") ||
+		    !strcmp(entry->key, "aer_dev_fatal"))
+			continue;
+
 		_print_key_value((char *)entry->key, (char *)entry->data);
 	}
 	printf("\n");
-- 
2.52.0

