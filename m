Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA08CD37AA
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 22:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0FB10E6AA;
	Fri, 15 Sep 2023 22:35:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873FE10E6AC
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 22:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694817318; x=1726353318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zJvLr8NUOOHK7ap27G/0A90GiqaoRolfNZ/9YAQ0DwA=;
 b=RMw6P8Mil0HUkpCC0bWS3PvoWtt1IFJYTm+2Y9WT6pZuGJ+W0j1NOFiI
 9VZS+Bg6i81XYcc67gpVSVB8OyUT8IUTZzb1ZYSPce+y4TKKTRr/MjRWk
 iJhsfXe/VpFPDc69JC1tTYFmHnLsp6AruHwtX4ZxDr4GSf3qbD7TCT2Jo
 KSuel5/gvCw314hyvxRy2SsMw5McNFXJvp3/cAJVUDDsA0NAC0BA4hd24
 Bq5OevStJgPhKXq31BGKQjP7KsUvJvZ1AKy5zt7o2SNuFmkpGysKGPnFF
 U5vxbnl00jbqnLf/sQRhIC17aWk+9s9SIcAht7Ucmj+RbXwCMDcrwK1yW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="359603206"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="359603206"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 15:35:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="745156210"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="745156210"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 15:35:18 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 15:34:58 -0700
Message-ID: <20230915223459.2964036-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
References: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe/huc: Define HuC for MTL
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

MTL uses a GSC-enabled binary. We expect all GSC-enabled binaries to be
defined with a "_gsc", so we can check for that in the name to
determine if the binary has the GSC headers or not.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index f956457d0b11..4e43b16a61d5 100644
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
@@ -207,6 +208,10 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 			uc_fw->major_ver_wanted = entries[i].major;
 			uc_fw->minor_ver_wanted = entries[i].minor;
 			uc_fw->full_ver_required = entries[i].full_ver_required;
+
+			if (strstr(uc_fw->path, "gsc"))
+				uc_fw->has_gsc_headers = true;
+
 			break;
 		}
 	}
-- 
2.41.0

