Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47957C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 00:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7D710E05B;
	Tue,  2 Jul 2024 00:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQ9EFRzv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AC110E05B
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 00:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719879135; x=1751415135;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CaxGwJpURWBYIBYEh5sKpuPoPEZyiHPRhTyt/1AiKdc=;
 b=BQ9EFRzvl4IOBe+DnZPl5154N87fzcL9BlMASRVR/VXU2tVN+PnGcmzo
 c/K05bC7ZbjNZMA982U/SH37KPEgwFft0FQ+72o1VI4P+4BGMtlg3eZHF
 E6RbjJhQyGW3hHIhG4XoQhNu/n+oajh+814KYWRIaWXT2LEZlG8om39gY
 fS6B3lqeLex1uIp84eSIU/EbHcj9wB37skz+7Vtw9TeHJc2bKkUED+6K+
 SrgErJ3JIeVghpQTASGnIebcRJXJXG46LbFtCaWr364Lc/sh/AibJmnz5
 PmvV89mU7nBd9q2jJJzEfO/AR4DL47DLmz1AC62AUlg5SpmK354gpqkIx Q==;
X-CSE-ConnectionGUID: wE/fH47bR1OTOCYF2mM2BQ==
X-CSE-MsgGUID: I4RqiLkHTiSk5y1uE/h+pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="17172994"
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="17172994"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 17:12:15 -0700
X-CSE-ConnectionGUID: jaxMtbpdT7GiuLC/3fZIrA==
X-CSE-MsgGUID: /Bcy3LxYQnywSLhvwmKtDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="76870091"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 17:12:14 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] Reapply "drm/xe/gsc: define GSC FW for LNL"
Date: Mon,  1 Jul 2024 17:11:55 -0700
Message-ID: <20240702001155.2163743-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

Wa_22019338487 is now merged, so we can re-enable the GSC now that we
won't hit the HW issue anymore.

Note that this patch is not meant to be merged, but rather the revert
patch should be dropped from the CI topic branch. This patch is being
sent for CI and to get an ack on dropping that patch.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index a69c61f6b064..62ed413bf1c3 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -128,6 +128,7 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe, gsc, lnl, 1, 0, 0))	\
 	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0, 0))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
-- 
2.43.0

