Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F70EC44501
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 17:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D238B10EE87;
	Tue,  7 Jul 2026 17:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EryhJRKq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6166A10EE87
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 17:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783447033; x=1814983033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VAyIjItKqeOfA8PHB6kF2DlcOrAxjYm5EAfdEZVpGKc=;
 b=EryhJRKqaFJxNA5Y8CbuM3flqfwi8DmhJ2i8HeI28wONg64xRkEsqexe
 IwCLTOPapaS5l3V3xd2ugWUp2ZQM2js4a4EjoDb86h5nB1t9R2QP6hDDn
 UAcSt0wn9HuiYBGsldHBcxXu/Psf7dKDM9QzjsGK+CTfpPOz3wAJiZigI
 D6bxAJNLxwny1mb5If2EjIxnygSPgUzmkTo/sIDPLwlHhHA/3h/b9f6yQ
 eXqQZTSI6Krciwbt/ji4os1Fa9VVCUtUyj+JeNIIaFuCwINSc58c4511c
 7Y4Eoga6yShPGfcJuoSz8Gaa/PQkvjRKf0CwfgOA0+Ke3/Uk148SU4Sb0 Q==;
X-CSE-ConnectionGUID: ixz+5FyrTDym135KTxfmlg==
X-CSE-MsgGUID: hMc5oAGWQZ2etmgzEW4G8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="86651284"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="86651284"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 10:57:12 -0700
X-CSE-ConnectionGUID: YQNiYNO1Qgakh11Os3becQ==
X-CSE-MsgGUID: dPcU3lvgQRuBPD7Ntoc16g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278436352"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 10:57:12 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 2/6] Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware
 for CRI"
Date: Tue,  7 Jul 2026 10:56:35 -0700
Message-ID: <20260707175638.30935-10-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260707175638.30935-8-julia.filipchuk@intel.com>
References: <20260707175638.30935-8-julia.filipchuk@intel.com>
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

This reverts commit 5fa121ad5e6425277d5eb01088cef5aa126a6fa7.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 02502a954144..3ef3b3740e29 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 70, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 70, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-- 
2.51.0

