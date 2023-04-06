Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1157AC7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 17:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7F910EC7F;
	Thu,  6 Apr 2023 17:58:09 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9296F10EC7F
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 17:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680803887; x=1712339887;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EQctx4y9EbZ9055COM32MpFB89DKR/5E0iaJYXrBAIM=;
 b=c/1MEA2PRU+u3IYCvjNRBPVVT+fklbmlCutxd9agLmkVO5sLMQXNPzoR
 nquz4juRPlqCBklwP4g53Am/HeSJ0AJn99wf/J17rgFf7eHKwwTlcb/f6
 2Fa7qp3JV2PRJM64jVyFhblLL2wdp5pd50/lDkW2r1uF3bGlaucGyUFqt
 RmCbUQu/LAULWi18QIz4QsEk3uBM/w+dcliAG//PfOot3Z4q3F7CfZSb5
 PINFAzXwit63Qhu4SuFA4jcifOIgvNFVRzN6jN0uU0fMrVsV4WC2qgixO
 7v8DwHPW+AIQycBGIxk0Tq9eWIHxSp2FINSKigDgppeOe2YvmEkQS3urP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="322450536"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="322450536"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 10:58:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776559842"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="776559842"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 10:58:06 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 10:58:11 -0700
Message-Id: <20230406175812.2294116-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: GuC and HuC loading support for RKL
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rocketlake uses TGL GuC and HuC

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index cd3cbc8981a2..7a682dd85796 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -106,11 +106,13 @@ struct fw_blobs_by_type {
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
 	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5))		\
 	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5))		\
+	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5))		\
 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)				\
 	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))			\
 	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
+	fw_def(ROCKETLAKE,	no_ver(i915,	huc,	tgl))			\
 	fw_def(TIGERLAKE,	no_ver(i915,	huc,	tgl))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
-- 
2.25.1

