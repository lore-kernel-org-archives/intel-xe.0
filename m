Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DC1CD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 11:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6608E10F28B;
	Thu, 18 Jun 2026 11:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTF8hOXe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967E210F2AC
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 11:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781782303; x=1813318303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qfxfJSNpgz0mmUZEA78XIskHhNTBFTPyZ2eiqMZ3LlQ=;
 b=bTF8hOXeUXD0ShgLhSAYZPPvZgN5nQsEeSMhenuxYGQUmDYKGuaPbp9T
 5GQHCut0OUWe3W2bABvtOy6irk2XSpfUZm54Y7WF8fyCMMzjVhwr+Ct7x
 K4XIYas8tkSFEo/q96JHxNOyoZgWnjg7LkOZZFpZm5Z9UN5bfVW/jQyt3
 wi45ZMFmQbdTsXaKmI0mAPllRLK4I6i9Z2Vad8Rfac3gKtt4FxBY2VFqx
 BlkE4ha35EBqktwre4Rb6pT4ac21FCTcV/q/1OocSHdviau+KPK/TFB5X
 4+spJfAbELFn8rwClcFqueIOzFEGam2knorHxjtfKzESGoqgbVU+RtKHJ g==;
X-CSE-ConnectionGUID: aCKfT1QvQP6DyRsiM3jv2g==
X-CSE-MsgGUID: T4YKWAmCR9m1IgWOFi4w6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86457070"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="86457070"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 04:31:42 -0700
X-CSE-ConnectionGUID: CxCEYxjKR82Hqy9Hbq/GKw==
X-CSE-MsgGUID: Ex+X/vQiSISGyHv4yEYRmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="252661927"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 04:31:39 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 2/2] drm/xe/guc: fix activity stats error message format
Date: Thu, 18 Jun 2026 16:55:31 +0530
Message-ID: <20260618112528.2354371-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618112528.2354371-4-sk.anirban@intel.com>
References: <20260618112528.2354371-4-sk.anirban@intel.com>
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

Use ERR_PTR() to print the error code symbolically.
This makes the failure easier to spot from IGT,
e.g. when the device is wedged.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_engine_activity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 2b99c1ebdd58..f43ca1c76f75 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -473,7 +473,7 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
 
 	ret = enable_engine_activity_stats(guc);
 	if (ret)
-		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
+		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats: %pe\n", ERR_PTR(ret));
 	else
 		engine_activity_set_cpu_ts(guc, 0);
 }
-- 
2.43.0

