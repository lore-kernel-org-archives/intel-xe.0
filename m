Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B0DCD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 06:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D5A10E0F0;
	Fri,  5 Apr 2024 06:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IX6pMWMl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BDB113969
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 06:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712298147; x=1743834147;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=7z+tJKGCq+vg60ZELiO1pV6yQ6mRcMwDOXbCoHbtzWk=;
 b=IX6pMWMlLYhDC2yM2H+yqcp6SzRL3zhgfaVL3DlYI2tI2XTm1jvZN+JV
 IkpfQjP4JC1RTdPCsNKHVvB2cWiEFYofCZYbKY1rnABlYHqgit8kCXaxU
 /RubKvrfXoev+2bXXQvuMg0aH08WejztKn3bF3Esaw9hTp/aT1s7ZYg82
 WEai5OH2VjLQ+rs62kZ3WLjPxi/6pkcsq93ino85RWBAI4Gk3m0MPV2mE
 odHNzQLtBxbRXyykOe0Acvg8FyFQt0c4cOAjP8mF4BcPlv/lE75m04DiU
 K93qnobrs6uHkJAi38lj3wXMbgeVWJjoN37qtHhQWvGa5nZBovntVtKPF A==;
X-CSE-ConnectionGUID: jPwhGeG7Rs+GJdfF9s7EBA==
X-CSE-MsgGUID: FHnC7YgNQre917nUbZ2fPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7480339"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7480339"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:22:24 -0700
X-CSE-ConnectionGUID: SrSSbSN3TjyNtpl7O1Fd6w==
X-CSE-MsgGUID: K2uVioAoRA6WmcPzXQG9Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19165427"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:22:23 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 05 Apr 2024 08:23:36 +0200
Subject: [PATCH v2] drm/xe: fix multicast support for Xe_LP platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240405-mcr_adlp-v2-1-2fd1e4325ef2@intel.com>
X-B4-Tracking: v=1; b=H4sIAOeYD2YC/22NywqDMBBFf6XMutOaGK101f8oUvIYa0CjTKxYx
 H9vdF3u5h64jxUisacI99MKTLOPfggJ5PkEttXhTehdYpCZVFkS9pZf2nUj2qZQlbGVKfMcUnx
 kavxyTD3rxEZHQsM62HYfWAg/Y7w67jHZQMu0l1ofp4G/x/0s9uqfp1mgQCdyrUslVeFuDx8m6
 i526KHetu0HUTxIYsUAAAA=
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
 Zhanjun Dong <zhanjun.dong@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1182;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=7z+tJKGCq+vg60ZELiO1pV6yQ6mRcMwDOXbCoHbtzWk=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmD5j+pX6DMaHxmHoH0GfVpcIO/MA/PMEyEN4+Ozj8
 O61TCHqJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZg+Y/gAKCRAjYrKT3hD91/ixC/
 9UqObZkcJhLcc05Abuodwlw5mYiizqwws7olC1Lt2vVmuNRsFDjSpTyAjwWkH07Ck0F7pZFxkpq8uh
 Z4w1WvORdl+ATb+eEjdRpWoT8nlME74S5Iim8I1eQrOm8bQuFOqKtn1o3AWTu/3iJgjPNUFrpvJ069
 BkEjOaFZDnjOlGjJa33g8YOIyxj0YtnorpghY38vsUqjowMjel1BCrrVOcdBlX61jzbmkqHC7i2MWf
 oBRIKX95o+M2S1B1hULk/CfQK/pWqgwVnmamr502X+x99GPEoqHsu98HPdXVoDMNy3xW37HYQ/O7gK
 QoZcK8i1Pqi2hJabaW22C9cJLn+Wh4IPUhOcFHd4PxuCL7vds1nVuhCi+wiN3f3Ymh8HxIBhUclsml
 IYgq2cJ/hI9y/PpPxMkkywhAxsih13hTMaOU4qmT0KJLmMzglm4rxLIxHZ07IcMllikBf9MdUT5+lr
 iKbQEoSuE2m1HthduiJof5nhfMitG6u19ePcdRNYKdhiQ=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Xe_LP has six sublices per slice.

v2: fixed commit message and subject (Matt)

Bspec: 66696
Fixes: bde5d76785bc ("drm/xe: Add helper macro to loop each DSS")
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
- Link to v1: https://lore.kernel.org/r/20240404-mcr_adlp-v1-1-d13aa64245d7@intel.com
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 866bbd26ba3f..577bd7043740 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -297,7 +297,12 @@ static void init_steering_mslice(struct xe_gt *gt)
 
 static unsigned int dss_per_group(struct xe_gt *gt)
 {
-	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
+	if (gt_to_xe(gt)->info.platform == XE_PVC)
+		return 8;
+	else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
+		return 4;
+	else
+		return 6;
 }
 
 /**

---
base-commit: 34820967ae7b45411f8f4f737c2d63b0c608e0d7
change-id: 20240404-mcr_adlp-cf548bc8b633

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

