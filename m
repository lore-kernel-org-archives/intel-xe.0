Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74D2C83F12
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 14:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A06610E2A2;
	Tue, 29 Aug 2023 14:13:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FCF10E29B;
 Tue, 29 Aug 2023 14:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693318379; x=1724854379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6bkhIi3dsxdMBvUC861TItuohA/k234xYrs1vbiAS24=;
 b=Prp3R5h8hP1Eyu2ilU0RC4TkRyDTGWLtK+RQbb54OCLgRST23It9vsti
 4vuRSeaWoGo6kfE0aqqMcidAMpsUelNnrHee/h2XqnnXCTAh9+vPIReLi
 cRjpPmh13X4RxyIB/D/K+qKCMwonxRIIYe+GErl4nUuqjirxHWlEqCBa9
 cKtkHsiu3zEPlGNON2evYZRnRMWq36w9amHyp/fb/4+1H4CEBeJePW32m
 eCioMoJgB9nwPJ6kX5r14shOvr/gl9/CSJCLmi4u0SxjcUpJNYhinv/V/
 OWoO4b90rqbLN558ZyjE0XtboEjFo+fXEkY1HxwfvuJKPXm+xcNbIYDIz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441733935"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441733935"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804123951"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="804123951"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:11:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 07:11:05 -0700
Message-Id: <20230829141107.1505705-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230829141107.1505705-1-lucas.demarchi@intel.com>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH igt 2/4] lib/intel_chipset: Add Lunar Lake support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add basic definition for the Lunar Lake platform. This uses the PCI ID
from the xe_pciids.h which has a macro in a slighlty different form.

Going forward we could also trim down a little bit the the info struct
like was done in the kernel, relying on gmdid and IP version checks.
This is left for later.

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/intel_chipset.h     |  5 +++++
 lib/intel_device_info.c | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 84cf1799e..52b15ccea 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -46,6 +46,7 @@ struct intel_device_info {
 	bool has_4tile : 1;
 	bool has_flatccs : 1;
 	bool has_oam : 1;
+	bool has_gmdid : 1;
 	bool is_mobile : 1;
 	bool is_whitney : 1;
 	bool is_almador : 1;
@@ -90,6 +91,7 @@ struct intel_device_info {
 	bool is_alderlake_n : 1;
 	bool is_meteorlake : 1;
 	bool is_pontevecchio : 1;
+	bool is_lunarlake : 1;
 	const struct intel_cmds_info *cmds_info;
 	const char *codename;
 };
@@ -203,6 +205,7 @@ void intel_check_pch(void);
 #define IS_ALDERLAKE_N(devid)	(intel_get_device_info(devid)->is_alderlake_n)
 #define IS_METEORLAKE(devid)	(intel_get_device_info(devid)->is_meteorlake)
 #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
+#define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
 #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
@@ -236,4 +239,6 @@ void intel_check_pch(void);
 
 #define HAS_OAM(devid)		(intel_get_device_info(devid)->has_oam)
 
+#define HAS_GMDID(devid)	(intel_get_device_info(devid)->has_gmdid)
+
 #endif /* _INTEL_CHIPSET_H */
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 5d53d2906..86a8b3650 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -504,6 +504,16 @@ static const struct intel_device_info intel_pontevecchio_info = {
 	.cmds_info = &gen12_pvc_cmds_info,
 };
 
+static const struct intel_device_info intel_lunarlake_info = {
+	.graphics_ver = 20,
+	.graphics_rel = 4,
+	.display_ver = 20,
+	.has_4tile = true,
+	.has_gmdid = true,
+	.is_lunarlake = true,
+	.codename = "lunarlake"
+};
+
 static const struct pci_id_match intel_device_match[] = {
 	INTEL_I810_IDS(&intel_i810_info),
 	INTEL_I815_IDS(&intel_i815_info),
@@ -607,6 +617,8 @@ static const struct pci_id_match intel_device_match[] = {
 
 	INTEL_PVC_IDS(&intel_pontevecchio_info),
 
+	XE_LNL_IDS(INTEL_VGA_DEVICE, &intel_lunarlake_info),
+
 	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
 };
 
-- 
2.40.1

