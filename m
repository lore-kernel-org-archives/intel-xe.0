Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E605DC25B6F
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 17:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B5810E6C8;
	Wed, 25 Oct 2023 17:58:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C093810E6C8
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 17:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698256685; x=1729792685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xmUo2GdEWSyhwpRE10EqyP9yk/iNapfkoI2B4AwZwYY=;
 b=ZRYiiIlXLjGEcFpl3p8ul4IgB9vEpx0XQQiyQP1m2aTzE+B9UfMj615u
 EkvNhi8h0yLaOjQkrT5WPWLxXKPT1zOpmZtTQWPUVX0yJqzvD9yAMQwqj
 hK3Z2DrrBPbuEP988deuwTpTU7Z3g7gR/oT3VnrItvLoC69SxHFqCn/UY
 C6IkCbDT7ZBihIYjsO+QFdWoYAeX709huM232k8njLzr5lvduYO7n8O7h
 Alhk5DLWMzkKBEycNmtN355fCFuNuaC0Ktqt5/1DFTgpger4AUuCscqLL
 DVNEIOevU97nImovqclOqk5myFenvzgUDSYB7ZNRcJ/F1ZM7v8HiZPgZ1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="386249966"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="386249966"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="6642424"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:56:38 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 10:57:45 -0700
Message-ID: <20231025175745.1906310-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025175745.1906310-1-daniele.ceraolospurio@intel.com>
References: <20231025175745.1906310-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 5/5] drm/xe/huc: Define HuC for MTL
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

MTL uses a versionless GSC-enabled binary.

v2: don't use the filename to identify the header type (Lucas)
v3: fix commit msg (Lucas)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index bfbc405ba8f2..040ee9bc28f0 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -112,12 +112,13 @@ struct fw_blobs_by_type {
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

