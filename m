Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ECACD98ED
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 22:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D9910E8C8;
	Thu, 18 Jun 2026 22:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bw9+131J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B84210E8C8
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 22:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781821547; x=1813357547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hBXCfUD3skBzmd/68golxuz7pnKW/wqbhq0J4lqQJJo=;
 b=Bw9+131JqQaIS0OoxViIMdE2wkw8RY54ImiGFsA3Ygdq8/1Ip3Rb3rbA
 0nOoHeBwMjzRSFARLRN6Lhp2IdEWJxeFWfSvrOUbqMEPUnEoEZuIxHEBI
 ZN6ldC33hy+1NuBk2ucXaHhlLD5xCv3hn1DHYrge7Gz+ACGV461R+ivdV
 w3sYvY9AFdV8Aedd5Z3Yh3dxm+A0t0CbWr0b/YlE1RLouhCnfYRARGwY6
 1ivnKjJ/QZ/81AmKZqwkJaFuKvVCS3p/9YydQsCYWer5xTsjf5/2TgmlE
 YX308D7dfeMSf+S5Iwr/aiXppHPNMMUSByHSFr5Oq1WJExoK2BMJpW04g w==;
X-CSE-ConnectionGUID: XwD4A+VhTLaGKTnTO2a5Jg==
X-CSE-MsgGUID: GDzGeMA7R9Kl8+92qSUB7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="81785769"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="81785769"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 15:25:47 -0700
X-CSE-ConnectionGUID: SQ2MssXrQ1WlcSGXyrz/sw==
X-CSE-MsgGUID: 04KXXPVDTCOQ59hQQz6d7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="278661308"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 15:25:48 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCHES topic/xe-for-CI 1/6] Revert "topic/xe-for-CI: Define GuC
 firmware for NVL-P"
Date: Thu, 18 Jun 2026 15:25:28 -0700
Message-ID: <20260618222536.3351750-9-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260618222536.3351750-8-julia.filipchuk@intel.com>
References: <20260618222536.3351750-8-julia.filipchuk@intel.com>
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

This reverts commit 1cf7dc778fc0682a29c228939df45bb7be27a433.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index c0c02ecacf8e..7cec96a2a41e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,8 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 68, 0))	\
-	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 68, 0))	\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 68, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 68, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
-- 
2.51.0

