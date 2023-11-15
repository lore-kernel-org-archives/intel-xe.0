Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64047C4167D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 00:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB3310E381;
	Wed, 15 Nov 2023 00:46:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E5810E235
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 00:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700009190; x=1731545190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fqo6R76sLhqJ29Vsp8KzBsOxQd59QxwXfBZG4bMls50=;
 b=dPghewNsG+g6CYxi6Mik2qKfcI3LOWGHN659PJnJgsquKJcsXB7nVV2D
 P4hP0oLVX6tsZ+jYC9iFiyN9WS4PtAQ7OjCpUXdZ203LxQiQqSF2oI/pP
 mKCH4zr4QlC3z3ACJ1rrcyHCEVTh8fXHSLcFvInYa6Y6gni7slOK7pXuX
 S4BhNPkNdofQWdaNUICex7mm0RV3SEuJXd3coInZ4lCRCYVwq/lEsnQyq
 AyzaEIqlggAN7eNEKkQMEg6hDfantcOskSNSYXGIo7uk0DCOO+GBEngpm
 QVXti/P22qVCPsQ3+ibDtxfdhmA1CN9C5DirGLRv9Ry8z0menyli0urMC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="3890967"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="3890967"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 16:46:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="12609380"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 16:46:30 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 16:46:07 -0800
Message-ID: <20231115004615.2424177-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
References: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 04/11] drm/xe/gsc: Parse GSC FW header
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

The GSC blob starts with a layout header, from which we can move to the
boot directory, which in turns allows us to find the CPD. The CPD uses
the same format as the one in the HuC binary, so we can re-use the same
parsing code to get to the manifest, which contains the release and
security versions of the FW.

v2: Fix comments in struct definition (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc_types.h |   3 +
 drivers/gpu/drm/xe/xe_uc_fw.c     |  77 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc_fw_abi.h | 113 ++++++++++++++++++++++++++++++
 3 files changed, 193 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
index 135f156e3736..1bc50583fe58 100644
--- a/drivers/gpu/drm/xe/xe_gsc_types.h
+++ b/drivers/gpu/drm/xe/xe_gsc_types.h
@@ -14,6 +14,9 @@
 struct xe_gsc {
 	/** @fw: Generic uC firmware management */
 	struct xe_uc_fw fw;
+
+	/** @security_version: SVN found in the fetched blob */
+	u32 security_version;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 16217aacdbfb..c354f7b51103 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -12,6 +12,7 @@
 #include "xe_bo.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
+#include "xe_gsc.h"
 #include "xe_gt.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
@@ -488,6 +489,13 @@ static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t siz
 	release->minor = manifest->fw_version.minor;
 	release->patch = manifest->fw_version.hotfix;
 
+	if (uc_fw->type == XE_UC_FW_TYPE_GSC) {
+		struct xe_gsc *gsc = container_of(uc_fw, struct xe_gsc, fw);
+
+		release->build = manifest->fw_version.build;
+		gsc->security_version = manifest->security_version;
+	}
+
 	/* then optionally look for the css header */
 	if (css_entry) {
 		int ret;
@@ -517,6 +525,73 @@ static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t siz
 	return 0;
 }
 
+static int parse_gsc_layout(struct xe_uc_fw *uc_fw, const void *data, size_t size)
+{
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
+	const struct gsc_layout_pointers *layout = data;
+	const struct gsc_bpdt_header *bpdt_header = NULL;
+	const struct gsc_bpdt_entry *bpdt_entry = NULL;
+	size_t min_size = sizeof(*layout);
+	int i;
+
+	if (size < min_size) {
+		xe_gt_err(gt, "GSC FW too small! %zu < %zu\n", size, min_size);
+		return -ENODATA;
+	}
+
+	min_size = layout->boot1.offset + layout->boot1.size;
+	if (size < min_size) {
+		xe_gt_err(gt, "GSC FW too small for boot section! %zu < %zu\n",
+			  size, min_size);
+		return -ENODATA;
+	}
+
+	min_size = sizeof(*bpdt_header);
+	if (layout->boot1.size < min_size) {
+		xe_gt_err(gt, "GSC FW boot section too small for BPDT header: %u < %zu\n",
+			  layout->boot1.size, min_size);
+		return -ENODATA;
+	}
+
+	bpdt_header = data + layout->boot1.offset;
+	if (bpdt_header->signature != GSC_BPDT_HEADER_SIGNATURE) {
+		xe_gt_err(gt, "invalid signature for BPDT header: 0x%08x!\n",
+			  bpdt_header->signature);
+		return -EINVAL;
+	}
+
+	min_size += sizeof(*bpdt_entry) * bpdt_header->descriptor_count;
+	if (layout->boot1.size < min_size) {
+		xe_gt_err(gt, "GSC FW boot section too small for BPDT entries: %u < %zu\n",
+			  layout->boot1.size, min_size);
+		return -ENODATA;
+	}
+
+	bpdt_entry = (void *)bpdt_header + sizeof(*bpdt_header);
+	for (i = 0; i < bpdt_header->descriptor_count; i++, bpdt_entry++) {
+		if ((bpdt_entry->type & GSC_BPDT_ENTRY_TYPE_MASK) !=
+		    GSC_BPDT_ENTRY_TYPE_GSC_RBE)
+			continue;
+
+		min_size = bpdt_entry->sub_partition_offset;
+
+		/* the CPD header parser will check that the CPD header fits */
+		if (layout->boot1.size < min_size) {
+			xe_gt_err(gt, "GSC FW boot section too small for CPD offset: %u < %zu\n",
+				  layout->boot1.size, min_size);
+			return -ENODATA;
+		}
+
+		return parse_cpd_header(uc_fw,
+					(void *)bpdt_header + min_size,
+					layout->boot1.size - min_size,
+					"RBEP.man", NULL);
+	}
+
+	xe_gt_err(gt, "couldn't find CPD header in GSC binary!\n");
+	return -ENODATA;
+}
+
 static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
 {
 	int ret;
@@ -526,6 +601,8 @@ static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
 	 * releases use GSC CPD headers.
 	 */
 	switch (uc_fw->type) {
+	case XE_UC_FW_TYPE_GSC:
+		return parse_gsc_layout(uc_fw, fw->data, fw->size);
 	case XE_UC_FW_TYPE_HUC:
 		ret = parse_cpd_header(uc_fw, fw->data, fw->size, "HUCP.man", "huc_fw");
 		if (!ret || ret != -ENOENT)
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
index d6725c963251..87ade41209d0 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
@@ -140,6 +140,58 @@ static_assert(sizeof(struct uc_css_header) == 128);
  *	|      RSA Key (MTL+ only)                       |
  *	|      ...                                       |
  *	+================================================+
+ *
+ * The GSC binary starts instead with a layout header, which contains the
+ * locations of the various partitions of the binary. The one we're interested
+ * in is the boot1 partition, where we can find a BPDT header followed by
+ * entries, one of which points to the RBE sub-section of the partition, which
+ * contains the CPD. The GSC blob does not contain a CSS-based binary, so we
+ * only need to look for the manifest, which is under the "RBEP.man" CPD entry.
+ * Note that we have no need to find where the actual FW code is inside the
+ * image because the GSC ROM will itself parse the headers to find it and load
+ * it.
+ * The GSC firmware header layout looks like this::
+ *
+ *	+================================================+
+ *	|  Layout Pointers                               |
+ *	|      ...                                       |
+ *	|      Boot1 offset  >---------------------------|------o
+ *	|      ...                                       |      |
+ *	+================================================+      |
+ *	                                                        |
+ *	+================================================+      |
+ *	|  BPDT header                                   |<-----o
+ *	+================================================+
+ *	|  BPDT entries[]                                |
+ *	|      entry1                                    |
+ *	|      ...                                       |
+ *	|      entryX                                    |
+ *	|          type == GSC_RBE                       |
+ *	|          offset  >-----------------------------|------o
+ *	|      ...                                       |      |
+ *	+================================================+      |
+ *	                                                        |
+ *	+================================================+      |
+ *	|  CPD Header                                    |<-----o
+ *	+================================================+
+ *	|  CPD entries[]                                 |
+ *	|      entry1                                    |
+ *	|      ...                                       |
+ *	|      entryX                                    |
+ *	|          "RBEP.man"                            |
+ *	|           ...                                  |
+ *	|           offset  >----------------------------|------o
+ *	|      ...                                       |      |
+ *	+================================================+      |
+ *	                                                        |
+ *	+================================================+      |
+ *	| Manifest Header                                |<-----o
+ *	|  ...                                           |
+ *	|  FW version                                    |
+ *	|  ...                                           |
+ *	|  Security version                              |
+ *	|  ...                                           |
+ *	+================================================+
  */
 
 struct gsc_version {
@@ -149,6 +201,67 @@ struct gsc_version {
 	u16 build;
 } __packed;
 
+struct gsc_partition {
+	u32 offset;
+	u32 size;
+} __packed;
+
+struct gsc_layout_pointers {
+	u8 rom_bypass_vector[16];
+
+	/* size of this header section, not including ROM bypass vector */
+	u16 size;
+
+	/*
+	 * bit0: Backup copy of layout pointers exists
+	 * bits1-15: reserved
+	 */
+	u8 flags;
+
+	u8 reserved;
+
+	u32 crc32;
+
+	struct gsc_partition datap;
+	struct gsc_partition boot1;
+	struct gsc_partition boot2;
+	struct gsc_partition boot3;
+	struct gsc_partition boot4;
+	struct gsc_partition boot5;
+	struct gsc_partition temp_pages;
+} __packed;
+
+/* Boot partition structures */
+struct gsc_bpdt_header {
+	u32 signature;
+#define GSC_BPDT_HEADER_SIGNATURE 0x000055AA
+
+	u16 descriptor_count; /* num of entries after the header */
+
+	u8 version;
+	u8 configuration;
+
+	u32 crc32;
+
+	u32 build_version;
+	struct gsc_version tool_version;
+} __packed;
+
+struct gsc_bpdt_entry {
+	/*
+	 * Bits 0-15: BPDT entry type
+	 * Bits 16-17: reserved
+	 * Bit 18: code sub-partition
+	 * Bits 19-31: reserved
+	 */
+	u32 type;
+#define GSC_BPDT_ENTRY_TYPE_MASK GENMASK(15, 0)
+#define GSC_BPDT_ENTRY_TYPE_GSC_RBE 0x1
+
+	u32 sub_partition_offset; /* from the base of the BPDT header */
+	u32 sub_partition_size;
+} __packed;
+
 /* Code partition directory (CPD) structures */
 struct gsc_cpd_header_v2 {
 	u32 header_marker;
-- 
2.41.0

