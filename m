Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6C9CDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 22:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9495410E462;
	Wed, 18 Oct 2023 22:57:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0970F10E462
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 22:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697669842; x=1729205842;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kmqcF5xWXKlb+bA0n0JeRlzBvQWxZ1WhoLJS47VsSOg=;
 b=R3N0aLEkA3WPEguzNqPh3qictcT+8tJCSi1DwQhFyV2Pn9vLDC8gD4CS
 5z9xotE9+vQIx7fIHJWxCl3z3yJfzdNGklTk0clmolCYG5Qf9oWOvp9oI
 Q/psN976cSLNo+CUnL3uuL6b+ndTov1r2tQjQdeUydiizGcUNSAGGNMSJ
 vFoFeCKvbEhw2v49AdFFqTR3KL1pGLI2UYhAVETSBJgPIlhQjYlLY2rrZ
 dhWQ26C5aArykNgAfxz0bqWcVHtTWRNmhj3U7jB3jTLNcs+92Wbaaz4hf
 myMI1atcwFjGeujiTFq3p2igebOyDbRYAbuyIIE8DkETqSS8LUkqhUeDv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="450353350"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="450353350"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 15:57:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="822613272"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="822613272"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 15:57:21 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 18 Oct 2023 15:57:07 -0700
Message-ID: <20231018225707.1685294-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018225707.1685294-1-daniele.ceraolospurio@intel.com>
References: <20231018225707.1685294-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/5] drm/xe/huc: Define HuC for MTL
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

MTL uses a GSC-enabled binary. We expect all GSC-enabled binaries to be
defined with a "_gsc", so we can check for that in the name to
determine if the binary has the GSC headers or not.

v2: don't use the filename to identify the header type (Lucas)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 2680b5082ea0..0fa1b3415eff 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -113,12 +113,13 @@ struct fw_blobs_by_type {
 	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5))		\
 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
 
-#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)				\
-	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
-	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,	tgl))			\
-	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))			\
-	fw_def(ROCKETLAKE,	no_ver(i915,	huc,	tgl))			\
-	fw_def(TIGERLAKE,	no_ver(i915,	huc,	tgl))
+#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
+	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
+	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
+	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,		tgl))		\
+	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,		tgl))		\
+	fw_def(ROCKETLAKE,	no_ver(i915,	huc,		tgl))		\
+	fw_def(TIGERLAKE,	no_ver(i915,	huc,		tgl))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
 	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
-- 
2.41.0

