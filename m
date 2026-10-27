Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89C9606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 22:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xzw61nt1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A077910F87A;
	Tue, 27 Oct 2026 22:45:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3688D10F87B
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 22:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793141108; x=1824677108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wXJTaq1V9OsCwTXKqTQg9aEBP3wcUX7ROQTReFKFFMg=;
 b=Xzw61nt1JAE/pvZGX5ZLcjgN8Uf90dCFCOEAA3GOkZTJRJ4TbUQk1egF
 YGaTu8htP9BHRB1AcmrGgRGSaOcAis1r9Qm9hrh0XM96lNw297A6Js7BX
 Fy6o1Rr7KTre4bJRN7UkRMyFrCNv6sFSqFuo4S0EpC1fFLWg9OkzfK9cG
 laU+aoYPZhLy2j6oLlGogFjgbJLY3GWFpA+5wGFB5c9eN9EXK1Uq0oiMF
 s2oWugaq0ubrmqQFucko880wdhW+ycC4cjRRUJyPE5yq2Is0oILTqWpMN
 KEfH6y+SOp5XsByDmZY36LmBkrGB698kAH4FRztT0p5/z92s0KlXCGTgy A==;
X-CSE-ConnectionGUID: gIcX54vFTumK19FdayYG3A==
X-CSE-MsgGUID: 6XeBMH7wSFSKu8Atc7Ufbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1878246"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1878246"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 15:45:08 -0700
X-CSE-ConnectionGUID: n+9kv6c7SayClNdnZaMjqQ==
X-CSE-MsgGUID: GO6vz22vTsOxmGj6kRHP8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4722031"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 15:45:07 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 4/4] topic/xe-for-CI: Define GuC firmware for NVL-P
Date: Tue, 27 Oct 2026 22:44:53 +0000
Message-ID: <20261027224448.1672411-10-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027224448.1672411-6-daniele.ceraolospurio@intel.com>
References: <20261027224448.1672411-6-daniele.ceraolospurio@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: John Harrison <John.C.Harrison@Intel.com>

Novalake P has different IP on each GT and requires a different GuC
for each. So add separate graphics and media GT entries or NVL-P.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7235
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://patch.msgid.link/20260202-nvl-p-upstreaming-v1-16-653e4ff105dc@intel.com
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Link: https://patch.msgid.link/20260529193558.185436-14-daniele.ceraolospurio@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://patch.msgid.link/20260618222536.3351750-14-julia.filipchuk@intel.com
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 56337f510378..658a48508ed2 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -116,6 +116,8 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 80, 0))	\
+	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 80, 0))	\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 80, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
-- 
2.53.0

