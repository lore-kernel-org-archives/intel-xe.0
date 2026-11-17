Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C015A606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 00:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dU1ixTg+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CC410E4E9;
	Tue, 17 Nov 2026 00:25:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586B310E4E9
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 00:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794875142; x=1826411142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uOX2f8nzAcLsfbj7iNB0YpioX4FZ+4fMn/Uvj+6mPZs=;
 b=dU1ixTg+hngfSA+gjCJVdUlnleWGOIXfCRj96HXQji4VzVd7UVABGO7L
 WDbSAdB33HeKRbkrAMxq2O8Nu0l85J8ptLaRFEhXyUxg/3Xm6QorrOh0O
 bEiKC743wZ0cU0CJJ9Xke1Dyqx5mTpD+ktjAJFOIJ4ZT9It8P5RCSTMgW
 40xAZqxwW7RjSu4MQY/+sSEG1X9Yrn3s/VJ2dMrK4lmPIaZxbGHd+berq
 d8Wju6l/otsa+emtjZATOmlx0Z6qhaaSqO8/XGL/gSu/kUHanXVVUHpr1
 lnpcSUTVEwPDyVNzVwaezU2TAg9uBddmWzpkf0vq7xEg19w6K5Aa9XFJD w==;
X-CSE-ConnectionGUID: P1MOcbDtSD2j7oP4RRUIDw==
X-CSE-MsgGUID: V/RI8mcZSJ2PWFJ9L+ihug==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3627824"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3627824"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 16:25:41 -0800
X-CSE-ConnectionGUID: MJwwjE4FRSOMrPaGzxOyYA==
X-CSE-MsgGUID: KabGzY0PRXKHrLRUKus+vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9755669"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 16:25:41 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 1/2] drm/xe/gsc: Define GSC firmware for NVL-P
Date: Tue, 17 Nov 2026 00:25:30 +0000
Message-ID: <20261117002529.1925156-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

NVL-P uses the same GSC image as NVL-S, but requires a newer version (at
least build 1242).

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index c042075a36e5..af6ee1f6742a 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -147,6 +147,7 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
+	fw_def(NOVALAKE_P,	GT_TYPE_ANY,	major_ver(xe,	gsc,	nvl,	108, 1, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	gsc,	nvl,	108, 1, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
@@ -778,6 +779,21 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 			goto fail;
 	}
 
+	/*
+	 * NVL-S and NVL-P use the same GSC binary, but NVL-P requires a
+	 * newer version (at least build 1242)
+	 */
+	if (uc_fw->type == XE_UC_FW_TYPE_GSC && xe->info.platform == XE_NOVALAKE_P) {
+		if (uc_fw->versions.found[XE_UC_FW_VER_RELEASE].build < 1242) {
+			xe_gt_info(gt, "%s firmware too old (got build %u, wanted at least 1242)\n",
+				   xe_uc_fw_type_repr(uc_fw->type),
+				   uc_fw->versions.found[XE_UC_FW_VER_RELEASE].build);
+			err = -ENOTSUPP;
+
+			goto fail;
+		}
+	}
+
 	*firmware_p = fw;
 
 	return 0;
-- 
2.53.0

