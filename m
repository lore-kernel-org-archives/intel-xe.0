Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0227C4450D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 18:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7220B10E2A5;
	Tue, 14 Jul 2026 18:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+3ggDiN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB2F10E2A5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 18:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784053759; x=1815589759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NU+QhhbNZ5V/tSrMZmGVeTOrUGaQKmIJ7zPF771et/k=;
 b=W+3ggDiNQBTwWZE4Xx2ukoRsLPsXVji7FE9NG8Y9PvwaxMFWlVacIECv
 PXOhdkizrDS5pxet9gw3tvxdvdwNOR/hMDV4iAbFtwg9hPuaulX2XXvGr
 /V733WY4iTURsp6/Rr9W0k1Hb0ObBE8NPNMN6IeIh7sLcYMtaf4UN19mQ
 MmGpp1MOUTrvs5/BEG4PSPFkyIuZpQlzHberyxXYKtejt80tSZ5UqifNU
 ByPmVhDOLuD0YKrg9WnebGha5GGL1F1Ra4EQ8n4K0ljhifXX/SOa+4Smm
 LxVKSMdrhxYQminQBm4qEDPATbopP4GwD06ILmmWxihuNcc4uleHGeHQp Q==;
X-CSE-ConnectionGUID: GmBet2DFTq6WurmW5hw+Yg==
X-CSE-MsgGUID: /1RCnm9ETd2RHHNnCdH6EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84880812"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84880812"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 11:29:19 -0700
X-CSE-ConnectionGUID: ZjQ4YxfqStKqd+bbpnoGGg==
X-CSE-MsgGUID: xLT2etDWQhmWQ/ayl5NmJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="260838251"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 11:29:18 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3 3/5] drm/xe/guc: Recommend GuC v70.65.0 for BMG, LNL, PTL
Date: Tue, 14 Jul 2026 11:28:41 -0700
Message-ID: <20260714182904.620871-10-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260714182904.620871-7-julia.filipchuk@intel.com>
References: <20260714182904.620871-7-julia.filipchuk@intel.com>
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

UAPI compatibility version 1.34.0

Update recommended GuC version for BMG, LNL, PTL.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 65f0136859d7..f917c9fb068e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -116,9 +116,9 @@ struct fw_blobs_by_type {
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
-	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 65, 0))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 65, 0))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 65, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
 	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 53, 0))	\
-- 
2.51.0

