Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED7DC3DA7F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 22:21:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378E210E030;
	Fri,  2 Aug 2024 22:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmopvVUC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9651010E030
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Aug 2024 22:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722637292; x=1754173292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fd2aUiWjfzPeNRKVkCd8YJf0XY5SZ1+bn3h0vSMy4dc=;
 b=bmopvVUC8NcasKkRNyZbT7p0PWk9QAvVOD6EPjXKUJVa/gnF9/ygno86
 mzw15KpVddvvfM6ASjKlxV3JuJtjD/9oN9nOHtyq9VTyv5sL9dm1BGw3L
 Mm8mDci6W28ZhOWmWWOiyC8RIcE1l0Uat6ntTf6WqMh7PaYM53mX7xCuS
 gsuoFC5bFlKdcImCvphOGix8QQ7g2HzaYZMFJs6OfA6lYCrbQEP/zTrpv
 smVID4gokc9xep/T3m+IJIVOPFKFTdIJchqha/tev7xnj8HDDDpiVTQ9R
 wJcaXBI4ftXaZ3xsWw4V5Lm5pCGYCbYUa1ex4eQUL3Pbat9hl+PUGy7JN Q==;
X-CSE-ConnectionGUID: u2CDUZwCQ/iJiEyH2QlhxQ==
X-CSE-MsgGUID: nR42uYbQSTKNRK4GaPJlAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20808501"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="20808501"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 15:21:31 -0700
X-CSE-ConnectionGUID: xzQy78LUTBqSh02o4vWqqw==
X-CSE-MsgGUID: zxwXkg8JStKqqiql6APLZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="60385233"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa005.jf.intel.com with ESMTP; 02 Aug 2024 15:21:30 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 1/4] Revert "drm/xe/guc: Pre-release GuC firmware v70.24.0
 for LNL/BMG/PVC"
Date: Fri,  2 Aug 2024 15:21:26 -0700
Message-ID: <20240802222129.3976212-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
References: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: Julia Filipchuk <julia.filipchuk@intel.com>

This reverts commit dbd3e63b48f43788cb31eac045a848508a5c14df.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6b92255a769d..5b70d23724c4 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -105,10 +105,8 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
-	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
+	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
-	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-- 
2.45.2

