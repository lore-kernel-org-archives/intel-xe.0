Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4597BCD5BD5
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 21:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077BD10F654;
	Thu, 28 May 2026 21:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOqloqWy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87C510F657
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 21:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780005181; x=1811541181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ieN5LCTv2+SHsHHdgqqjgskLPJIkrGIPLvIBeJKHnTg=;
 b=kOqloqWyHlsa56+g342AU0dBqM5l5GKDDqAVesWcMgwKaPHBsdzgMVDx
 /+8XrB2q3Rcw5JsOa4IvsPRdgedp08KezTM8o16flj9qNgFJpkb9Y9RAI
 GOgxqW3HV5Ojy7wSUSdykye3KsBNhkC1KnmONYzKhGRjJJyrcfgeLCrth
 0q85YMAzbtc/MYjqWswX/afzpl34MBRfvr+FOZtGCCkWSwoBnxxVpAtQ2
 LcOp9Q1Z7/HhoUGYCRNfty4L7RCoUp1U6gKj7biuM0I9nWYiZI1Hcm2sa
 +81MfOTzabYeVXrrFu9JuP+WQWCxh+F2SWAJut7Go+5aYMdGUZhkXpWUX w==;
X-CSE-ConnectionGUID: /x6pUC4FRMqS9ya0t4yJ3A==
X-CSE-MsgGUID: +xNEZP4dSP2HfPyITQhltQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80710770"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="80710770"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 14:53:01 -0700
X-CSE-ConnectionGUID: 91abJbC1RJW++6iE7DmkTg==
X-CSE-MsgGUID: OA+yjPYhSlOeFa4lt3+ZzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="272994693"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 14:53:01 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 05/10] drm/xe/guc: Use GuC v70.65.0 for NVL-S
Date: Thu, 28 May 2026 14:51:32 -0700
Message-ID: <20260528215227.1282471-17-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260528215227.1282471-12-julia.filipchuk@intel.com>
References: <20260528215227.1282471-12-julia.filipchuk@intel.com>
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

Use newer firmware for NVL-S

UAPI compatibility version 1.34.0

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 173cd4d8cc41..203546122479 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 65, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 65, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 65, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 65, 0))	\
-- 
2.51.0

