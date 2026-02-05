Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BDAE9129E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 14:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F8F10E8F8;
	Thu,  5 Feb 2026 14:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWRmcB0U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F0D10E8F5;
 Thu,  5 Feb 2026 14:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770303302; x=1801839302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z0J1fp5gH0b5KrCvMlVHs7OwcJO3DDihgfki0if6moU=;
 b=bWRmcB0UPUY17R7Xo5l9EdmyBjszS1KG/bqoTVNdpqK9XPFU3eIWH0Fv
 I+4TUbFLiyXWuAW1mELxRtrh5Ac1c1ygO/BqPGmqnLTfHXuOh/YCiA5Fa
 NC7Fgl1n9cC/XWeb31aWFEbL6QUd3PREdVurH099+40LltFz96vLza9eG
 O/CxcewxLl2Y0ex6MPdEiYHWflOYHYnwwHaGGmI/GYspayTZTaQfyeAtO
 Ipat7AMtMxEDQPW+tYBihORkbPZuO3zyJd2StKFrwO3v/ENW5E7/YIFMy
 l1XRrR183ygFuiu670w5f3rHwGY8SQ/cyUAHPN6UIuMbIqbbaStWkTTGk A==;
X-CSE-ConnectionGUID: ZzPerK8fTkapGRJ6sIGlwg==
X-CSE-MsgGUID: fLvW84uuQS2DVB8OYrB4Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="89083618"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="89083618"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:55:02 -0800
X-CSE-ConnectionGUID: p99/KfwBRp2xTKGpMt1jGQ==
X-CSE-MsgGUID: Qdy6tBKbSciZbuAvvtTNfA==
X-ExtLoop1: 1
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.76])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:54:59 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v5 5/6] lib/igt_device_scan: Omit AER statistics data
 from attributes
Date: Thu,  5 Feb 2026 15:51:54 +0100
Message-ID: <20260205145427.1338534-13-janusz.krzysztofik@linux.intel.com>
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

Among attributes of a PCIe bridge upstream port of a discrete graphics
card, there are three AER statistics attributes: aer_dev_correctable,
aer_dev_nonfatal and aer_dev_fatal.  Each consists of a number of key-
value pairs, while the library now expects only single value attributes.
That affects formatting of lsgpu -p output.  In order to print that data
correctly in a human readable form, extra formatting effort would be
needed.  However, users of lsgpu, the only call site of that printing
function of the igt_device_scan library, are not necessarily interested in
that data.  Just drop those attributes from the printout.

v2: Hand over detection of AER attributes to a helper.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_device_scan.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 6fc02a565a..d7ec6c2b96 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -617,6 +617,13 @@ static bool is_link_attr(const char *name)
 	       !strcmp(name, "current_link_width");
 }
 
+static bool is_aer_attr(const char *name)
+{
+	return !strcmp(name, "aer_dev_correctable") ||
+	       !strcmp(name, "aer_dev_nonfatal") ||
+	       !strcmp(name, "aer_dev_fatal");
+}
+
 static void dump_props_and_attrs(const struct igt_device *dev, bool omit_link)
 {
 	struct igt_map_entry *entry;
@@ -632,6 +639,10 @@ static void dump_props_and_attrs(const struct igt_device *dev, bool omit_link)
 		if (omit_link && is_link_attr(entry->key))
 			continue;
 
+		/* omit multi-line AER statistics data */
+		if (is_aer_attr(entry->key))
+			continue;
+
 		_print_key_value((char *)entry->key, (char *)entry->data);
 	}
 	printf("\n");
-- 
2.52.0

