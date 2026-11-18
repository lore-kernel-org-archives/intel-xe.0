Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C28606A32C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 21:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MMulZWQc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C80610EC87;
	Wed, 18 Nov 2026 21:32:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F3610EC87
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 21:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795037564; x=1826573564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IO8923yW2SEF6p7qwZbSbOes/ZLuEhbhepbLHgXTS5I=;
 b=MMulZWQc8EHR6EoVqteYjbyNJ1yEJEkvyMxdSM0b49e7eKcsUpO32Mcy
 yznYQgJIL0JF4A06bu8LRflqa+IAIuKnmE75dtxei0xUfqu1PFmxK6cOu
 Dhsmy4b+0qbBcQIgqt95enSoF+rlHJy1xXGSiAV+QKG9oFvbwHE0QyYrS
 F8Dx0pgt9UGhcJD6yyBZ3xT3vG0X2f96ba+3aAMx2GwUiX5o1egJZQ1Dj
 Il9ZnYAXb7rfw32HMtX60YIPMTE2lsQFZJOacmKzWaromEGpSv0h4Zp0+
 RiFG86SLOSmgZw3UWPSWmcTE1BVnJgkOtxGWCBj/eUAwDBcZwO16Z/8ek g==;
X-CSE-ConnectionGUID: u5mIdxEqRYW7wRxAOn85sQ==
X-CSE-MsgGUID: kzqc+kHyR+ilMCIR1h4URA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3762398"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3762398"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 13:32:44 -0800
X-CSE-ConnectionGUID: nvgKKd1UQEeb9AfvQxUskw==
X-CSE-MsgGUID: /4RP78IFS0ilyCNPC7o8YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10494898"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 13:32:44 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 1/2] drm/xe/gsc: Define GSC firmware for NVL-P
Date: Wed, 18 Nov 2026 21:32:35 +0000
Message-ID: <20261118213234.59171-3-daniele.ceraolospurio@intel.com>
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
v2: Use EOPNOTSUPP (checkpatch), check the full GSC version number and
not just the build number
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index c042075a36e5..64b1e51c02ab 100644
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
+	 * newer version (at least build 108.0.0.1242)
+	 */
+	if (uc_fw->type == XE_UC_FW_TYPE_GSC && xe->info.platform == XE_NOVALAKE_P) {
+		struct xe_uc_fw_version *ver = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
+
+		if (ver->major == 108 && ver->minor == 0 && ver->patch == 0 && ver->build < 1242) {
+			xe_gt_info(gt, "%s firmware too old (got build %u, wanted at least 1242)\n",
+				   xe_uc_fw_type_repr(uc_fw->type), ver->build);
+			err = -EOPNOTSUPP;
+			goto fail;
+		}
+	}
+
 	*firmware_p = fw;
 
 	return 0;
-- 
2.53.0

