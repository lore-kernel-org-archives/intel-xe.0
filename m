Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3F8606B0F9
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HhPut12t
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD9D10E641;
	Mon,  2 Nov 2026 16:39:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AF610E641
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 16:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793637535; x=1825173535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fLhx0AaPMZZ3SvWKL8TGbxmGMeaJqh9aYzTagH4u4Yg=;
 b=HhPut12tiDNQXLLgtiQhUzz2oIgNj/5Ty35TXCo3zf/Nn66RhRA2D9Et
 /WAbXUnvo3KX3IQKj27r5KeeaH5WWzio7pc/Hg/f64/qXafbjlaU1Rkwd
 6qdKDwJXP6AJXMSopRHyCifYbFXmGrMeFQlqRWtzSv5hIW4HQKDFIr/Jy
 f5ndm9FyKBn8cB504FH6fqXaOy7PId2FzOmyYWCSDvS0IQjvkpKD4GMhz
 jJ2nBGMg70CqxF9J2GJ2M7hsQACeKefy95HoHeoDYK4qFW1xCxgVgvjVA
 MEXE+deGy3vANWyog7i0HoN4OBLOVe5oz7H2CysAcovLiwzP2X1o4da/B w==;
X-CSE-ConnectionGUID: jiUnF/AlRZ2hAcdtJm/loA==
X-CSE-MsgGUID: QZ5qhPTPSGSoXUewxWwHDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2354332"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2354332"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 08:38:55 -0800
X-CSE-ConnectionGUID: zFDWPRGISqKNBUGhQodCpQ==
X-CSE-MsgGUID: Htn0Ug0oTymuWVrVmFeetw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6159821"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 08:38:55 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 1/4] Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
Date: Mon,  2 Nov 2026 16:38:42 +0000
Message-ID: <20261102163840.2231293-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102163840.2231293-6-daniele.ceraolospurio@intel.com>
References: <20261102163840.2231293-6-daniele.ceraolospurio@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This reverts commit b275cb3f07a7ab3ef3bd419db86bd42fa95dcedb.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index fa15c3cfbad1..11408b466a82 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -116,8 +116,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 70, 0))	\
-	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 70, 0))	\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 70, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
-- 
2.53.0

