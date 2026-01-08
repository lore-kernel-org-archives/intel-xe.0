Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB257D1D486
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 18:21:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CBF10E7B1;
	Thu,  8 Jan 2026 18:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JcB8PobV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2005F10E7B1
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 18:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767896505; x=1799432505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2iO04NMMgMwzGhgpmJnd0XuEeJz0Rds6pqQg5sY+T3g=;
 b=JcB8PobVN9cxfm0/MHCmPZG8PceTY0+TqA7iUkpOUvhqLbIU4hcOxUSs
 Wzl0H9ulehP6j/Bsrq386ywzi2CUWQD4pdkPV0D4Xo0Czbc/QBryz6oJc
 XDTXINoKIeFUp4fOGvubTQcbfq6sbTVnMtnmAhcF/uQzYWa/fBH8ycNMp
 UY2nBJkcooMhrrvtM+D5rzZ3zwyd6yoEPyfJWF0QtqKyWVZBUwPMnJ2jk
 o65H+FXVmZGnFl6jm6OKXwFolBEVOIktLXXnpQUQFcuY8YyglfVsuXK7u
 D9ytEBSUc2goPJvvVcStttYyUREAkTPXdt9qY2pVmNNW6kJ5AT0TL54Ae A==;
X-CSE-ConnectionGUID: pa8v0nsZSt+Lbjpyx8cYCQ==
X-CSE-MsgGUID: E/2+YaPBQzecFhEwu20BLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69355250"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="69355250"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 10:21:45 -0800
X-CSE-ConnectionGUID: 1KgJJoLmT4WYvR4fDVRHAg==
X-CSE-MsgGUID: nY6IS5LuRKuuf2LcNYlYVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="202394597"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 10:21:45 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 3/4] drm/xe/nvls: Define GuC firmware for NVL-S
Date: Thu,  8 Jan 2026 10:19:45 -0800
Message-ID: <20260108181956.1254908-9-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108181956.1254908-6-julia.filipchuk@intel.com>
References: <20260108181956.1254908-6-julia.filipchuk@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Although NVL-S has a similar Xe3 to PTL/WCL, it requires a unique GuC
firmware.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://lore.kernel.org/r/20251016-xe3p-v3-12-3dd173a3097a@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index cacbf89e8f68..2980d0b99e95 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
-- 
2.51.0

