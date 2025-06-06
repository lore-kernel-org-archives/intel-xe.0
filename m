Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C9DC61DB8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 16:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9333010EAEF;
	Fri,  6 Jun 2025 16:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfIwytTQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E3610EAEC
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749225784; x=1780761784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H8J6BGf8UBRd/cbDOeaEHKVggIMydGwDqrn+2u3N2kY=;
 b=JfIwytTQW1g8sk/TZR2Th7wCfg0nK0R4QchNV3V1NaLnranbzDZa5iI/
 +DC95xynteOnFF76f/c/79nicHRowduyNLYkAUaGxtJj9G3Wdi83o0aVI
 CZJkadqdg8kXY2pUTAqJRG63dOE9nm0FESK7FOOKx1jAkunpdxyICdYnW
 EdWTmaExL3zj/viP9yXa+GIHKXaayC5fokILK2oemDpxeDfUo4dqu6H/Y
 Z7bnByfuxhBhKEXAN5zxUm5T0u2O782fhT+1m9K0AkotAF+gL/ZdOV0Fa
 n6LBkqY6OHuewX8kiI3QSUyoQ9pHW8d1vvqlpwJRyzBechLMXEmlHtp9z w==;
X-CSE-ConnectionGUID: XZLHzp/uQeCA320aMsnuSQ==
X-CSE-MsgGUID: xXBQdsVeSLOeiideQK6WGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51526356"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51526356"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 09:03:03 -0700
X-CSE-ConnectionGUID: fAsEPLDXTH2m48WRJUf5/A==
X-CSE-MsgGUID: hBLERJicSfGcZ1gpLUyLlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145748892"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 09:03:02 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/5] drm/xe/oa: Print hwe to OA unit mapping
Date: Fri,  6 Jun 2025 09:02:50 -0700
Message-ID: <20250606160253.4054668-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606160253.4054668-1-ashutosh.dixit@intel.com>
References: <20250606160253.4054668-1-ashutosh.dixit@intel.com>
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

Print hwe to OA unit mapping to dmesg, to help debug for current and new
platforms.

v2: Separate out xe_oa_print_gt_oa_units() (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 0de0d5a18df74..e22405166db6b 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2603,6 +2603,36 @@ static int xe_oa_init_gt(struct xe_gt *gt)
 	return 0;
 }
 
+static void xe_oa_print_gt_oa_units(struct xe_gt *gt)
+{
+	enum xe_hw_engine_id hwe_id;
+	struct xe_hw_engine *hwe;
+	struct xe_oa_unit *u;
+	char buf[256];
+	int i, n;
+
+	for (i = 0; i < gt->oa.num_oa_units; i++) {
+		u = &gt->oa.oa_unit[i];
+		buf[0] = '\0';
+		n = 0;
+
+		for_each_hw_engine(hwe, gt, hwe_id)
+			if (xe_oa_unit_id(hwe) == u->oa_unit_id)
+				n += scnprintf(buf + n, sizeof(buf) - n, "%s ", hwe->name);
+
+		xe_gt_dbg(gt, "oa_unit %d, type %d, Engines: %s\n", u->oa_unit_id, u->type, buf);
+	}
+}
+
+static void xe_oa_print_oa_units(struct xe_oa *oa)
+{
+	struct xe_gt *gt;
+	int gt_id;
+
+	for_each_gt(gt, oa->xe, gt_id)
+		xe_oa_print_gt_oa_units(gt);
+}
+
 static int xe_oa_init_oa_units(struct xe_oa *oa)
 {
 	struct xe_gt *gt;
@@ -2619,6 +2649,8 @@ static int xe_oa_init_oa_units(struct xe_oa *oa)
 			return ret;
 	}
 
+	xe_oa_print_oa_units(oa);
+
 	return 0;
 }
 
-- 
2.48.1

