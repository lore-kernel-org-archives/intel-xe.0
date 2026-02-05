Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCDFECD99C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 19:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF57810E030;
	Thu,  5 Feb 2026 19:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aoVkSJWj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34A710E030
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 19:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770321550; x=1801857550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ak1TrdgMtd8w2HAigC/9VPabvVBH4xg9N4kTwIxXXsk=;
 b=aoVkSJWjFjYmDzViiWjFZxCc7fmtxGH7QxD9vLXElz3ha3gDIamfZhQo
 1146iu0xfikGyNqttZDSpZMwKGY6B4w3R2N9Yv0A9rOPzAYQ+XRkdiDCK
 lsNi4o/8i57Wzqrvhgrgi0yfL3V0+t3AeTJ4pNjmS9aNpRmT/nf+R4/3R
 dKdjEbiBZAGDvAvFCtd/BwKFydECKaAsbsisUSy1iJ5I7W9x43bwbpRug
 iBhjJvNBCA8mDdokcT0eCCzRhFqG+GopJGhk8A5YHoo04nYgxoSTZvjyt
 Jxp7AoxSdYJ1Ez6ijBNK2Xiz6OyDzoJMIRjp4ow5xN8EsWAyb6uFTa+pK w==;
X-CSE-ConnectionGUID: fXzprEcbTL+FKBAsMMQBXg==
X-CSE-MsgGUID: pAx6Kqq5Rgm/hdQxIs/VSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70548516"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="70548516"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 11:59:09 -0800
X-CSE-ConnectionGUID: t+2j5pn2QUmoWAs8tPXDuA==
X-CSE-MsgGUID: YPgRW1ZIShuvYJBuHQNYpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210705497"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 11:59:10 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 2/7] Revert "drm/xe/nvls: Define GuC firmware for NVL-S"
Date: Thu,  5 Feb 2026 11:57:49 -0800
Message-ID: <20260205195833.2928038-11-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260205195833.2928038-9-julia.filipchuk@intel.com>
References: <20260205195833.2928038-9-julia.filipchuk@intel.com>
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

This reverts commit 4e88de313ff4d1c67b644b1f39f9fb4089711b71.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 70e6276dd468..8904cc696569 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
-- 
2.51.0

