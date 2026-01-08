Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324F2D1D483
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 18:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E567310E377;
	Thu,  8 Jan 2026 18:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ec4C1c1y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F2B10E7B1
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 18:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767896500; x=1799432500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oi8IMurBJVBA8awI2AMbFfKWue1fm+66G8IjkFSTb2s=;
 b=ec4C1c1yKQ40r/rly1uKkkiylap2DUOoHVaCzmL6iQuuErJ3iTXUIrU8
 UzfaYW5Dopm1opTRlQeBgculV2CqH/ng65K21l5cScQ27BJ0yxuoGTLyh
 WXpaBd7xvOujjY2/UsapkXVDAb3EtfxQdGAwYnM0jsnv6LjdEj40xBU0U
 hY9X7N5Y+5dJJGSTxbAX8iRLH6DbvqHoUox0a+d8JbHzWMVkAG8XOmwwo
 pM9tNTpTBoKEpyWIE92ZOrFnNq8YwsbNhaJR0R0Ftw36akitEGxsEtsRi
 UfV8koBKrxOtCgaBitp+y1hTFvuf51+A0cD2mbzl7bBWKa4f4rdht3eP9 A==;
X-CSE-ConnectionGUID: 4CFb02acQoehFPYTg/giAA==
X-CSE-MsgGUID: tBNQ+T+JSum8FJ3GxBmM8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69355226"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="69355226"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 10:21:40 -0800
X-CSE-ConnectionGUID: uUY8aTSeTmmjcmFW1x+OpA==
X-CSE-MsgGUID: mmD9+zymT8+05H9B8CrbAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="202394576"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 10:21:40 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 1/4] Revert "topic/for-xe-CI: drm/xe/cri: Define GuC
 firmware for CRI"
Date: Thu,  8 Jan 2026 10:19:43 -0800
Message-ID: <20260108181956.1254908-7-julia.filipchuk@intel.com>
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

This reverts commit 7f3219f02c00680d63c06e779926b1715c42b51d.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 50458d3bdc7d..290c69032129 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 49, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 49, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-- 
2.51.0

