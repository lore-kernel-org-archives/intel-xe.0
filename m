Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62A3C5B552
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 20:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D4610E729;
	Tue,  3 Jun 2025 20:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZUjJL64";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB5710E911
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 20:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748982109; x=1780518109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+qKNntqoluiSmL/stky8BRjjVsMSjz2jBMG1bArSlK4=;
 b=XZUjJL64up9jCwe6Y93CmgGUOzQ9TwHNriIxm8+q4JpjHxeLfkPE/tsv
 wxJip0xzR3CzrTXnhGXTDMv4Iltf89tpZuOnC5WKPsSrXUTjV7LBCihjs
 8Js95eFWy7nmM/z8+qMlYuYnWevBoz9RdqpFAHB+zapPtkiP6nr5htIXk
 wjFstZHk1VST1+v7P39oC8qFkVVlIFIgcMhn0Fe6zqOo7odt2pL8lpsCo
 7w9El2GmOPkRBRMT+IGlU5ca2+UnGjB6w5F+H4J8ZedSTyxvQDdXKEGRM
 gxK1eIi+DAM+lispx4UPFDfXXYmOa131GWR7oRKV3Xg07T4HooVX+daxl Q==;
X-CSE-ConnectionGUID: wr1K0sWXTZeuY3OVsZjgcQ==
X-CSE-MsgGUID: sSdNomZMTa2W6gKDholtFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="76427536"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="76427536"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:21:49 -0700
X-CSE-ConnectionGUID: V5KXkhV5TrK/W3FS8sh+vg==
X-CSE-MsgGUID: tNvYNjqxTcCUO1R3mECYkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="175833204"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:21:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/5] drm/xe/oa: Print hwe to OA unit mapping
Date: Tue,  3 Jun 2025 13:21:30 -0700
Message-ID: <20250603202133.2713863-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250603202133.2713863-1-ashutosh.dixit@intel.com>
References: <20250603202133.2713863-1-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 0de0d5a18df74..94faa4ed2012f 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2603,6 +2603,31 @@ static int xe_oa_init_gt(struct xe_gt *gt)
 	return 0;
 }
 
+static void xe_oa_print_oa_units(struct xe_oa *oa)
+{
+	enum xe_hw_engine_id hwe_id;
+	struct xe_hw_engine *hwe;
+	struct xe_oa_unit *u;
+	struct xe_gt *gt;
+	int gt_id, i, n;
+	char buf[256];
+
+	for_each_gt(gt, oa->xe, gt_id) {
+		for (i = 0; i < gt->oa.num_oa_units; i++) {
+			u = &gt->oa.oa_unit[i];
+			buf[0] = '\0';
+			n = 0;
+
+			for_each_hw_engine(hwe, gt, hwe_id)
+				if (xe_oa_unit_id(hwe) == u->oa_unit_id)
+					n += scnprintf(buf + n, sizeof(buf) - n, "%s ", hwe->name);
+
+			xe_gt_dbg(gt, "oa_unit %d, type %d, Engines: %s\n",
+				  u->oa_unit_id, u->type, buf);
+		}
+	}
+}
+
 static int xe_oa_init_oa_units(struct xe_oa *oa)
 {
 	struct xe_gt *gt;
@@ -2619,6 +2644,8 @@ static int xe_oa_init_oa_units(struct xe_oa *oa)
 			return ret;
 	}
 
+	xe_oa_print_oa_units(oa);
+
 	return 0;
 }
 
-- 
2.48.1

