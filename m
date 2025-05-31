Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7606DC5B55A
	for <intel-xe@archiver.kernel.org>; Sat, 31 May 2025 00:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C2210E8A9;
	Sat, 31 May 2025 00:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U9x/mMi+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF8010E00F
 for <intel-xe@lists.freedesktop.org>; Sat, 31 May 2025 00:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748650385; x=1780186385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6EFMeJS+/g5/21hMS2TDi5VyIo+9/f2XpgmAhYrDWis=;
 b=U9x/mMi+CFaQ4RUk0hVgZ4GPpM7PObxC1+pjajTf48zmgQ2xVP6LUT8I
 e8Orj2BMRB89o3YKvh/20WSOKsZo4nWMy76sxTE54r4sKBqfZKN2ovnmP
 s1FNs5/bmvUjPtX3om4/3wFnug/43hPzEOC9KO5GanNSN/mmtmGBCY/I2
 2XDN15BEDKwYn0LgfOQtFZHpkqiT7SpCN8fVU8I6Gg0DEhEq0fFpWZfLZ
 MXi80yOMMTeq84RTBUhLQpWM+pLPKWcm9w5KBv71pjV5Ma6x6P9pleDI1
 kOLulYzU+xngbKENmlx+YUl+/S1oYv1bAPlFK0cj+UJsA72VzrSgcl65R A==;
X-CSE-ConnectionGUID: /Qmn6mK0RYudTJekCdV1Kg==
X-CSE-MsgGUID: 1ILn96jARLSJ8c5zgPDCMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50669551"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="50669551"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 17:13:05 -0700
X-CSE-ConnectionGUID: lHG9lfK7T1idvjNlamNPVA==
X-CSE-MsgGUID: hXg7MctVT6KTRqV/uk9Ejw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="143928013"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 17:13:04 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/5] drm/xe/oa: Print hwe to OA unit mapping
Date: Fri, 30 May 2025 17:12:56 -0700
Message-ID: <20250531001259.630681-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250531001259.630681-1-ashutosh.dixit@intel.com>
References: <20250531001259.630681-1-ashutosh.dixit@intel.com>
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

