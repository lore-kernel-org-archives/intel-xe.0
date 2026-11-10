Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE737606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 23:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V9J6HpgX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44AA10F519;
	Tue, 10 Nov 2026 23:15:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5467C10E96E
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 23:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794352496; x=1825888496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0ajX4jTSTbC6RlDM0hNTyi6c9TChQgx5mbArupEYaQM=;
 b=V9J6HpgX2RhK/sjT4sC9LFqPN26kw1taZiPfaYDe7tuzQZfFOny8q90y
 BvHZ4x2TUUJc6hf63lYUi/mF77X2ZR+/AsdM7MMRWHGblq6/GTB5l80pB
 +8HZgWakID6ahMuWo6ldvfzJB+sgTDhxwiPHlEoMavjRXzPrw+Y3kL6dz
 SYYEYqcouO+TaCWD2lbJCfZ7KziRWTNoJ9FmP+ZvnWnb6SZVIvPgw0h84
 KpZ5Saq+gYd3NTY4NCmFFgDVI5EWRbzrhTotb1T9/AMDJtipJz6OcWnmj
 2ga7GJfdInxD2asrwHo0ShyIIIpnueCRQX/h8/lj7kD2U/z5lhPLYvpGU g==;
X-CSE-ConnectionGUID: 7z9YVw8cRFS46rjmOgILXg==
X-CSE-MsgGUID: vIAEh/vMR4WvKYsUv9ZHDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3120825"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3120825"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:50 -0800
X-CSE-ConnectionGUID: z7QNCRP3SAuzyKtysVuIjw==
X-CSE-MsgGUID: ViSWfB5XS4aSs9JUzYhf6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8133954"
Received: from dut4463arlhx.fm.intel.com ([10.105.9.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:50 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, matthew.d.roper@intel.com, fei.yang@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 03/11] drm/xe: Verify IP presence against GU_CNTL
Date: Tue, 10 Nov 2026 23:14:45 +0000
Message-ID: <20261110231442.218721-16-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110231442.218721-13-stuart.summers@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
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

GMD_ID is the only thing consulted today to decide whether the graphics
and media IPs exist. Hardware also fuses presence bits into
GU_CNTL_PROTECTED, so check GTPresent and IMPresent as a second level of
verification and leave an IP alone when the two disagree.

Either IP can be dropped this way without failing driver load: an IP
hardware says is absent is simply not detected, which is the same state
as it reporting version 0, and probe then applies the usual rule that
at least one IP has to be left.

VFs have no access to the register, so they keep going by GMD_ID alone.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c       | 28 ++++++++++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 437485b5a0af..5f2c8d348451 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -12,6 +12,8 @@
 #define SOC_BASE				0x280000
 
 #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
+#define   GT_PRESENT				REG_BIT(8)
+#define   IM_PRESENT				REG_BIT(10)
 #define   DRIVERINT_FLR_DIS			REG_BIT(31)
 
 #define GU_CNTL					XE_REG(0x101010)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 34e8ffeeeb09..f2a4aed1dfe2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -706,12 +706,28 @@ static const struct xe_ip *find_media_ip(unsigned int verx100)
 
 static const struct xe_gmdid_desc {
 	const char *name;
+	u32 present;
 	const struct xe_ip *(*find_ip)(unsigned int verx100);
 } gmdid_descs[] = {
-	[GMDID_GRAPHICS] = { "graphics", find_graphics_ip },
-	[GMDID_MEDIA] = { "media", find_media_ip },
+	[GMDID_GRAPHICS] = { "graphics", GT_PRESENT, find_graphics_ip },
+	[GMDID_MEDIA] = { "media", IM_PRESENT, find_media_ip },
 };
 
+/*
+ * Besides the IP version in GMD_ID, hardware reports whether an IP is present
+ * at all through the fuse backed presence bits in GU_CNTL_PROTECTED.  Use
+ * those as a second level of verification, so an IP hardware says is not there
+ * is left alone whatever GMD_ID claims.
+ */
+static bool gt_fused(struct xe_device *xe, u32 present)
+{
+	/* VFs have no access to GU_CNTL_PROTECTED, so go by GMD_ID alone */
+	if (IS_SRIOV_VF(xe))
+		return false;
+
+	return !(xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL_PROTECTED) & present);
+}
+
 /*
  * Read IP version from hardware and select graphics/media IP descriptors
  * based on the result.
@@ -753,6 +769,14 @@ static int handle_gmdid(struct xe_device *xe,
 			continue;
 		}
 
+		if (gt_fused(xe, desc->present)) {
+			xe_log_info(xe, REGS,
+				    "Hardware reports the %s IP is not present, ignoring version %u.%02u\n",
+				    desc->name, ver / 100, ver % 100);
+			*revids[type] = 0;
+			continue;
+		}
+
 		*ips[type] = desc->find_ip(ver);
 		if (!*ips[type])
 			xe_log_err(xe, REGS, -EINVAL,
-- 
2.43.0

