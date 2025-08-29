Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931AFCA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 23:53:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3835910E21F;
	Fri, 29 Aug 2025 23:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DarbDyEG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C439210E21F
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 23:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756511602; x=1788047602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rb3SI7DobGZfKLxQdTYnS5Y5ad1W46bZyiTnKVJZQRk=;
 b=DarbDyEG6mwUWroP86d89srq9jI4RmXUvmV7I2dFqSkstb5jI+uzZlyb
 g3zd+1hFgzrM2wA42kRrKeWHCn6N9oBDg5FHlvcVa6cQpL983HF/cG+no
 838C4HYsXzpbh6aqHUKSYvKX5h7TTFltiX5rwsSbvjuX0613KTCDlC+Ld
 AQ8TLuj6gFpsxyCCK8ne+kmUBfAlB2xmaMgqDrZssApTaIKaIUS9eSslz
 p/6pfp/eWAPbPXT20TlZoIz1pkL1t7Jzv3QOWr3dpX9fuDHa5mhorAVop
 P1nrgJXXlArbtYUSxUyOgZnrBd/LLCF4VKJQsM2qrJC3TDVnST9sj/+uk Q==;
X-CSE-ConnectionGUID: ZuaGNPTLRa6+GGFLxEni1g==
X-CSE-MsgGUID: c08X6gBKRqeKoo1mD89TXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58906774"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58906774"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 16:53:22 -0700
X-CSE-ConnectionGUID: UxCR/dK3T6KzoDsxeuPSdw==
X-CSE-MsgGUID: JWw+9+F+TLmFtNDlQHpufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170406647"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 16:53:21 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 1/3] Revert "drm/xe/pvc: Add GuC firmware definition"
Date: Fri, 29 Aug 2025 16:46:55 -0700
Message-ID: <20250829235305.672287-6-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829235305.672287-5-julia.filipchuk@intel.com>
References: <20250829235305.672287-5-julia.filipchuk@intel.com>
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

This reverts commit 3dd32a625a5d1493b7bc2efaa72d5516f8119101.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index a236f1d37248..9bbdde604923 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -119,7 +119,6 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 45, 2))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
-	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 45, 2))	\
 	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
 	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
-- 
2.50.1

