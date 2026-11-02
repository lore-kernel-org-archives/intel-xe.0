Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C708606B0FF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HT3XeR1c
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DBB10E670;
	Mon,  2 Nov 2026 16:39:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A7610E0A6
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 16:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793637539; x=1825173539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KiSa5HRBkKyCQzwrgJy7tIGPvoa1Oo0hA9lYW0+1Idg=;
 b=HT3XeR1cXZ1pGgHcg3GcO7LalHbGR4jjZclsEVtp/pxMWRDTuuRgAcnJ
 kancIXyiGZlrRp/Ft80RZ1BQZYAqI18zE0rN2jCujGYJUVvYahRaKcnV4
 VY9Ym0u7lZ7MLBHKX6UxZjKz9XgpM2frIf8M9wjXbvnSAeT7nov/1cCyo
 qInYda/R1OcaH6h1CepQKe63mk5cDqmgKxsYSewu/IRVxF+t0PZYg33nS
 UnIrSXzrsfNI9BsrdXuJtHdL3n9Zw10uZJLmRWOkClCiZQlLYBOAJrBop
 PDHWB8/EO1oiYeQUZp1hlncc3oa6KByWgoiGi9MK63vbFUK8T6sqPR8WT w==;
X-CSE-ConnectionGUID: kQXPQEiNTkern2XMMkYj0A==
X-CSE-MsgGUID: T1+GFP4cTy+qG+a5C3T1zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2354338"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2354338"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 08:38:58 -0800
X-CSE-ConnectionGUID: C+t8Oyi2Rmmqgh/BQtK8AQ==
X-CSE-MsgGUID: htopTjz/Ro6vWC5qfnXv5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6159835"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 08:38:58 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 3/4] topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI
Date: Mon,  2 Nov 2026 16:38:44 +0000
Message-ID: <20261102163840.2231293-9-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102163840.2231293-6-daniele.ceraolospurio@intel.com>
References: <20261102163840.2231293-6-daniele.ceraolospurio@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Define GuC firmware, still using the mpp version that is intended to be
merged only to help with the platform enabling in topic/for-xe-CI.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patch.msgid.link/20251021-cri-v1-2-bf11e61d9f49@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://lore.kernel.org/r/20260108181956.1254908-10-julia.filipchuk@intel.com
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://patch.msgid.link/20260529193558.185436-13-daniele.ceraolospurio@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://patch.msgid.link/20260618222536.3351750-13-julia.filipchuk@intel.com
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index f7829942ff18..cb6bd78ab0c1 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -116,6 +116,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 83, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-- 
2.53.0

