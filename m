Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300BEC52D54
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 22:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F262510E0D8;
	Thu,  1 Aug 2024 22:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ae6SK/5Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C3210E0D8
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 22:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722550186; x=1754086186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rSlWspdbWsjWPLzFHH3YSWPfBtkrc9hQuo+uk+Z80Lo=;
 b=Ae6SK/5Q3SvHi91/vyQflU8jkwZW/NOQTRlNcPe0bF9r/sXXA2hBU6xo
 HxL8uTRanXP83JgAykj0NEwHWnxB2XRxT1gGf5R4GFBYmV1Kz1zu5+Aii
 NDPKIR+2myQQthiNGGEFurRcfui8lzEaxN+EkoQ4kquMseSi/PYzn1PxS
 54dmFRFKGD00XlmzO1O3/4/v8pA/8CkqZ6d9HfZBzDzp3+7O7c7VgthUt
 w7QmKIdtPni+YLTH/B+6FYo9Xoq5UKXB3SJik3BN0IpP2fB3BoKFggjO5
 R6Uof5/hDtxCNTVGsO1/0UmMF756iNx+5pcmkxHPkeZAnOdv8lR/bOglT Q==;
X-CSE-ConnectionGUID: fFOtlL/NQPKuGA7NyCT36A==
X-CSE-MsgGUID: HN9wKufmQ9yi5T30R7BDmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31943328"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="31943328"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:09:46 -0700
X-CSE-ConnectionGUID: yizmgqj6Te+7xFa38nKVew==
X-CSE-MsgGUID: mWC6X6/BS2WhhEtJtUATpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="54860512"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:09:47 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH xe-for-ci v2 4/4] drm/xe/guc: Pick for-ci GuC v70.29.2 for PVC
Date: Thu,  1 Aug 2024 15:09:34 -0700
Message-ID: <20240801220934.3048796-5-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801220934.3048796-1-julia.filipchuk@intel.com>
References: <20240801220934.3048796-1-julia.filipchuk@intel.com>
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

UAPI version 1.13.4

Restore ci config for pre-release PVC.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 05a3c5b80b5b..c1618d9672c0 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -109,6 +109,7 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 29, 2))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
-- 
2.45.2

