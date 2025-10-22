Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768C7CCD1BE
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 05:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0531710E6A7;
	Wed, 22 Oct 2025 05:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHbg2gA6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA3310E6A4
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 05:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761110318; x=1792646318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R3Al38BASOU2j5uSXJy8BBSPzY4rD8/7Qdxg3t/1R1E=;
 b=OHbg2gA6W+eP188gHG3JdQI0akwbnfDFN4W5AeSuJ3gE/Q3ZkGRq3Acy
 tHqtcco0s59u5IavVMo/TGGsX5IdBPiPNHyPVuiXwJPokrxkc516TdVKU
 owU6uW8wvBjyLzYmUQgDRfUt/MFmhRpPFq1PDuhX8rCWKCRjbTA6JMhqm
 dCcPdTR+c1BsGYfzhUABvq3IOOpu8eS/FwHnDIj4dRWKEkc/fHrSe96dT
 OMDBQIXeq1/4OXBIjissCzdw1lNnnKbFCoQbESxxU0C28lMdbW3zHFET+
 +snEaiHZK1dcEvrLVHBrdIlHy7SDnemS8Q6v7feJJ2Hm751hVU/FFBkFH Q==;
X-CSE-ConnectionGUID: Pl3b6dutTPeI5qPEIJHGRA==
X-CSE-MsgGUID: xgozhS6hQSOI/CV0vYBpqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67083972"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67083972"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
X-CSE-ConnectionGUID: 2gfbZMCuRbi57Qlf2vVZsg==
X-CSE-MsgGUID: UHkGTGZsTmmysoNIj7yJ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="220959684"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 02/12] topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI
Date: Tue, 21 Oct 2025 22:17:34 -0700
Message-ID: <20251021-cri-v1-2-bf11e61d9f49@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Define GuC firmware, still using the mpp version that is intended to be
merged only to help with the platform enabling in topic/for-xe-CI.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e589c7e38f125..b4cd6226ad31d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 49, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 49, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 49, 4))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 49, 4))	\

-- 
2.51.0

