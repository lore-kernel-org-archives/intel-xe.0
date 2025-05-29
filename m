Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B09C5B543
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 23:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBECE10E111;
	Thu, 29 May 2025 23:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S35p5+cn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4917210E790
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 23:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748563131; x=1780099131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6EFMeJS+/g5/21hMS2TDi5VyIo+9/f2XpgmAhYrDWis=;
 b=S35p5+cn0+TOVUWWcbclyxbt03IEIJcJgI8L+H2mWr/UhGRPKSn3Rus4
 4YSSfDzP/G94e9nUWvPHTPsCyZeP5QMm6GxgNYUoJIIXqECM2poTB/fhw
 bjuV5wGb49bUbaPfZa/B+rPDGesaYiIm6kQ8DISh/QSJfvJ1C+/EWqN7z
 QEx2qk8Wq9LHQ28slWYdq9ITOFVcrkpswYCY5et9dhc4HLC8oXJlySF+o
 KkHI0AQPxV86+sHiWo0JHVI6Fo//Mcs5RfpPLlL0fNMW+pyaRaImPHMDp
 OCl4xH9pMBVhY3kzVUf+UyE7Ig/LSTfJ7QFaVHxSIo5rV1K1AIjvKz0P5 w==;
X-CSE-ConnectionGUID: pVMPty3URbaJYaLCOXZHOA==
X-CSE-MsgGUID: X8XR/rSfTaaCT2hcFAlxtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="49764992"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="49764992"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 16:58:49 -0700
X-CSE-ConnectionGUID: mnBswqoUT0OTGzEJj1l8Mg==
X-CSE-MsgGUID: UYeKONtuRsW3vgWRXyY11w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="166889410"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 16:58:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/4] drm/xe/oa: Print hwe to OA unit mapping
Date: Thu, 29 May 2025 16:58:34 -0700
Message-ID: <20250529235836.145097-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250529235836.145097-1-ashutosh.dixit@intel.com>
References: <20250529235836.145097-1-ashutosh.dixit@intel.com>
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
index 5c9d7ac82e7e4..a7d3fd5d21559 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2601,6 +2601,31 @@ static int xe_oa_init_gt(struct xe_gt *gt)
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
@@ -2617,6 +2642,8 @@ static int xe_oa_init_oa_units(struct xe_oa *oa)
 			return ret;
 	}
 
+	xe_oa_print_oa_units(oa);
+
 	return 0;
 }
 
-- 
2.48.1

