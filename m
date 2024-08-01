Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF57C52D54
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 22:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FA310E120;
	Thu,  1 Aug 2024 22:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRM2t+Gp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E024D10E120
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 22:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722552169; x=1754088169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BxhRwSUR+J1HBn7weVIuWUkq2bLjRbeuITkJjknjspk=;
 b=iRM2t+GpC2N1VWmnXkEN+tHdpMipfWA0TVDhVDkwBt/6lao02CBII09h
 jW+MtmF/qdwdL4hj7bOSjv+GfyiP8ic7lLWsE23oa6Yd3O5wgERxkCYei
 gr7GwSzIpToYMtda9uV334vIfCysyQAeamQd/AWnEr9DDjHDWSwE2tz0k
 hZV1iEvdW5oVfXQLUoRWkEmvoFeH8PcAhky+yzWz9aaX+0R/LLwD6i/t5
 FR4+Y8fCPsqsU/2q9C1G7yZ/RUPWQjkZKNUD++RjoBk6D4PctOwJDn9t8
 sGsDz4Kho6QDYOpigLBPrEgaR1NS+u8FFh3a27byI/tSH0AbEA451xYCM w==;
X-CSE-ConnectionGUID: jz3fbCvsRPmZf1/7+ng6Cw==
X-CSE-MsgGUID: 52WbKo9QSo+tvWEnx0K/cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="38008319"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="38008319"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:42:48 -0700
X-CSE-ConnectionGUID: hGSZQ6DFQuedZMRBp8vMBg==
X-CSE-MsgGUID: 6p7pflSsSuqvcm91LubDBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55116243"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:42:48 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3 1/4] drm/xe/guc: Drop use of pre-release GuC definitions
 for LNL and BMG
Date: Thu,  1 Aug 2024 15:42:37 -0700
Message-ID: <20240801224241.3050352-2-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801224241.3050352-1-julia.filipchuk@intel.com>
References: <20240801224241.3050352-1-julia.filipchuk@intel.com>
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

With BMG, LNL guc binaries ready in linux-fimware, we remove pre-release
definitions to prepare for final defines of recommended firmware
version.

This patch is meant to be squashed with the patch in xe-for-ci that adds
the definitions ("drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC"). We want to keep the PVC definition from that patch.
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

