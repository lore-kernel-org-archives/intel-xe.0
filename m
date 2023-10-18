Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADF5CDB483
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 22:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2E910E463;
	Wed, 18 Oct 2023 22:57:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE0B8903B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 22:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697669838; x=1729205838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8/WC9E7WpjsaBu3NlxOdvtUWwpJyxQx/0I/8HR+EzCM=;
 b=aNnO3z5dMgmm5+243XS5x803YhxCKcxOk5d26qCbCASiGZ2ziJjIx3jH
 GTdvIa+KEL/vmv0aAkde1A0OXJajEn1QZE9/SgN1L9rTwQw3+9pK+4lPX
 wbrhFrEhUfKBNCappnvyrSjhYRVbxpNWAEMg/4kAKefEgfw4Uzs0Cv/pI
 e4v5iYhbvckfn5cRE7feqHxFgTktmChlczfWEto7lxOiVX+TsklvsSMoj
 U9PvsxTkX3Wr4SVMGmiG+2IvfOpoyit2w8u9ubohzB8R5OXgW79KP1Bmm
 nTqTLE8dargOyCGU6uITjaL2PT5BIXjCgh8qNFfpSgc7QM7PhnJD7YBN8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="450353331"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="450353331"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 15:57:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="822613257"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="822613257"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 15:57:17 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 18 Oct 2023 15:57:04 -0700
Message-ID: <20231018225707.1685294-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018225707.1685294-1-daniele.ceraolospurio@intel.com>
References: <20231018225707.1685294-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/5] drm/xe/huc: Extract version and binary
 offset from new HuC headers
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

The GSC-enabled HuC binary starts with a GSC header, which is followed
by the legacy-style CSS header and the binary itself. We can parse the
GSC headers to find the HuC version and the location of the binary to
be used for the DMA transfer.

The parsing function has been designed to be re-used for the GSC binary,
so the entry names are external parameters (because the GSC uses
different ones) and the CSS entry is optional (because the GSC doesn't
have it).

v2: move new code to uc_fw.c, better comments and error checking, split
    old code move to separate patch (Lucas), move headers and
    documentation to uc_fw_abi.h.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/xe/xe_firmware.rst |   3 +
 drivers/gpu/drm/xe/xe_uc_fw.c        | 137 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_uc_fw.h        |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw_abi.h    | 120 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc_fw_types.h  |   2 +
 5 files changed, 261 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
index f1ac6f608930..afcb561cd37d 100644
--- a/Documentation/gpu/xe/xe_firmware.rst
+++ b/Documentation/gpu/xe/xe_firmware.rst
@@ -10,6 +10,9 @@ Firmware Layout
 .. kernel-doc:: drivers/gpu/drm/xe/xe_uc_fw_abi.h
    :doc: CSS-based Firmware Layout
 
+.. kernel-doc:: drivers/gpu/drm/xe/xe_uc_fw_abi.h
+   :doc: GSC-based Firmware Layout
+
 Write Once Protected Content Memory (WOPCM) Layout
 ==================================================
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 7345f0409cf9..2680b5082ea0 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -403,9 +403,142 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
 	return 0;
 }
 
+static bool is_cpd_header(const void* data)
+{
+	const u32 *marker = data;
+
+	return *marker == GSC_CPD_HEADER_MARKER;
+}
+
+static inline u32 entry_offset(const struct gsc_cpd_entry *entry)
+{
+	return entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
+}
+
+/* Refer to the "GSC-based Firmware Layout" documentation entry for details */
+static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t size,
+			    const char *manifest_entry, const char *css_entry)
+{
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
+	struct xe_device *xe = gt_to_xe(gt);
+	const struct gsc_cpd_header_v2 *header = data;
+	const struct gsc_cpd_entry *entry;
+	size_t min_size = sizeof(*header);
+	int i;
+
+	if (!manifest_entry)
+		return -EINVAL;
+
+	if (size < sizeof(*header)) {
+		xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);
+		return -ENODATA;
+	}
+
+	if (!is_cpd_header(header)) {
+		xe_gt_err(gt, "Trying to CPD parse a non-CPD header\n");
+		return -ENODATA;
+	}
+
+	if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
+		xe_gt_err(gt, "invalid CPD header length %u!\n", header->header_length);
+		return -EINVAL;
+	}
+
+	min_size = header->header_length + sizeof(*entry) * header->num_of_entries;
+	if (size < min_size) {
+		xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);
+		return -ENODATA;
+	}
+
+	entry = data + header->header_length;
+
+	for (i = 0; i < header->num_of_entries; i++, entry++) {
+		if (strcmp(entry->name, manifest_entry) == 0) {
+			const struct gsc_manifest_header *manifest;
+
+			min_size = entry_offset(entry) + sizeof(struct gsc_manifest_header);
+			if (size < min_size) {
+				xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);
+				return -ENODATA;
+			}
+
+			manifest = data + entry_offset(entry);
+
+			uc_fw->major_ver_found = manifest->fw_version.major;
+			uc_fw->minor_ver_found = manifest->fw_version.minor;
+			uc_fw->patch_ver_found = manifest->fw_version.hotfix;
+		}
+
+		if (css_entry && strcmp(entry->name, css_entry) == 0) {
+			u32 offset = entry_offset(entry);
+			int ret;
+
+			/*
+			 * This section does not contain a CSS entry on DG2. We
+			 * don't support DG2 HuC right now, so no need to handle
+			 * it, just add a reminder in case that changes.
+			 */
+			xe_assert(xe, xe->info.platform != XE_DG2);
+
+			/* the CSS header parser will check that the CSS header fits */
+			if (offset > size) {
+				xe_gt_err(gt, "FW too small! %zu < %u\n", size, offset);
+				return -ENODATA;
+			}
+
+			ret = parse_css_header(uc_fw, data + offset, size - offset);
+			if (ret)
+				return ret;
+
+			uc_fw->css_offset = offset;
+		}
+	}
+
+	if (!uc_fw->major_ver_found) {
+		xe_gt_err(gt, "Failed to find %s version in manifest!\n",
+			  xe_uc_fw_type_repr(uc_fw->type));
+		return -ENODATA;
+	}
+
+	if (css_entry && !uc_fw->css_offset) {
+		xe_gt_err(gt, "Failed to find CSS offset for %s\n",
+			  xe_uc_fw_type_repr(uc_fw->type));
+		return -ENODATA;
+	}
+
+	return 0;
+}
+
 static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
 {
-	return parse_css_header(uc_fw, fw->data, fw->size);
+	/*
+	 * Quick check to make sure there is enough space for the headers. FWs
+	 * are expected to be hundreds of KB big, so we can keep it simple and
+	 * start by checking that we have at least a page (which is enough for
+	 * the headers), while further checks will be done based on the headers
+	 * contents.
+	 */
+	if (fw->size < PAGE_SIZE)
+		return -ENODATA;
+
+	/*
+	 * All GuC releases and older HuC ones use CSS headers, while newer HuC
+	 * releases use GSC CPD headers.
+	 */
+	switch (uc_fw->type) {
+	case XE_UC_FW_TYPE_HUC:
+		if (is_cpd_header(fw->data))
+			return parse_cpd_header(uc_fw, fw->data, fw->size,
+						"HUCP.man", "huc_fw");
+		fallthrough;
+	case XE_UC_FW_TYPE_GUC:
+		return parse_css_header(uc_fw, fw->data, fw->size);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
@@ -511,7 +644,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
 	/* Set the source address for the uCode */
-	src_offset = uc_fw_ggtt_offset(uc_fw);
+	src_offset = uc_fw_ggtt_offset(uc_fw) + uc_fw->css_offset;
 	xe_mmio_write32(gt, DMA_ADDR_0_LOW, lower_32_bits(src_offset));
 	xe_mmio_write32(gt, DMA_ADDR_0_HIGH, upper_32_bits(src_offset));
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index a519c77d4962..1d1a0c156cdf 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -21,7 +21,7 @@ void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p);
 
 static inline u32 xe_uc_fw_rsa_offset(struct xe_uc_fw *uc_fw)
 {
-	return sizeof(struct uc_css_header) + uc_fw->ucode_size;
+	return sizeof(struct uc_css_header) + uc_fw->ucode_size + uc_fw->css_offset;
 }
 
 static inline void xe_uc_fw_change_status(struct xe_uc_fw *uc_fw,
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
index edae7bb3cd72..d6725c963251 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
@@ -85,4 +85,124 @@ struct uc_css_header {
 } __packed;
 static_assert(sizeof(struct uc_css_header) == 128);
 
+/**
+ * DOC: GSC-based Firmware Layout
+ *
+ * The GSC-based firmware structure is used for GSC releases on all platforms
+ * and for HuC releases starting from DG2/MTL. Older HuC releases use the
+ * CSS-based layout instead. Differently from the CSS headers, the GSC headers
+ * uses a directory + entries structure (i.e., there is array of addresses
+ * pointing to specific header extensions identified by a name). Although the
+ * header structures are the same, some of the entries are specific to GSC while
+ * others are specific to HuC. The manifest header entry, which includes basic
+ * information about the binary (like the version) is always present, but it is
+ * named differently based on the binary type.
+ *
+ * The HuC binary starts with a Code Partition Directory (CPD) header. The
+ * entries we're interested in for use in the driver are:
+ *
+ * 1. "HUCP.man": points to the manifest header for the HuC.
+ * 2. "huc_fw": points to the FW code. On platforms that support load via DMA
+ *    and 2-step HuC authentication (i.e. MTL+) this is a full CSS-based binary,
+ *    while if the GSC is the one doing the load (which only happens on DG2)
+ *    this section only contains the uCode.
+ *
+ * The GSC-based HuC firmware layout looks like this::
+ *
+ *	+================================================+
+ *	|  CPD Header                                    |
+ *	+================================================+
+ *	|  CPD entries[]                                 |
+ *	|      entry1                                    |
+ *	|      ...                                       |
+ *	|      entryX                                    |
+ *	|          "HUCP.man"                            |
+ *	|           ...                                  |
+ *	|           offset  >----------------------------|------o
+ *	|      ...                                       |      |
+ *	|      entryY                                    |      |
+ *	|          "huc_fw"                              |      |
+ *	|           ...                                  |      |
+ *	|           offset  >----------------------------|----------o
+ *	+================================================+      |   |
+ *	                                                        |   |
+ *	+================================================+      |   |
+ *	|  Manifest Header                               |<-----o   |
+ *	|      ...                                       |          |
+ *	|      FW version                                |          |
+ *	|      ...                                       |          |
+ *	+================================================+          |
+ *	                                                            |
+ *	+================================================+          |
+ *	|  FW binary                                     |<---------o
+ *	|      CSS (MTL+ only)                           |
+ *	|      uCode                                     |
+ *	|      RSA Key (MTL+ only)                       |
+ *	|      ...                                       |
+ *	+================================================+
+ */
+
+struct gsc_version {
+	u16 major;
+	u16 minor;
+	u16 hotfix;
+	u16 build;
+} __packed;
+
+/* Code partition directory (CPD) structures */
+struct gsc_cpd_header_v2 {
+	u32 header_marker;
+#define GSC_CPD_HEADER_MARKER 0x44504324
+
+	u32 num_of_entries;
+	u8 header_version;
+	u8 entry_version;
+	u8 header_length; /* in bytes */
+	u8 flags;
+	u32 partition_name;
+	u32 crc32;
+} __packed;
+
+struct gsc_cpd_entry {
+	u8 name[12];
+
+	/*
+	 * Bits 0-24: offset from the beginning of the code partition
+	 * Bit 25: huffman compressed
+	 * Bits 26-31: reserved
+	 */
+	u32 offset;
+#define GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
+#define GSC_CPD_ENTRY_HUFFMAN_COMP BIT(25)
+
+	/*
+	 * Module/Item length, in bytes. For Huffman-compressed modules, this
+	 * refers to the uncompressed size. For software-compressed modules,
+	 * this refers to the compressed size.
+	 */
+	u32 length;
+
+	u8 reserved[4];
+} __packed;
+
+struct gsc_manifest_header {
+	u32 header_type; /* 0x4 for manifest type */
+	u32 header_length; /* in dwords */
+	u32 header_version;
+	u32 flags;
+	u32 vendor;
+	u32 date;
+	u32 size; /* In dwords, size of entire manifest (header + extensions) */
+	u32 header_id;
+	u32 internal_data;
+	struct gsc_version fw_version;
+	u32 security_version;
+	struct gsc_version meu_kit_version;
+	u32 meu_manifest_version;
+	u8 general_data[4];
+	u8 reserved3[56];
+	u32 modulus_size; /* in dwords */
+	u32 exponent_size; /* in dwords */
+} __packed;
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index 444bff83cdbe..1650599303c8 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -113,6 +113,8 @@ struct xe_uc_fw {
 	u32 rsa_size;
 	/** @ucode_size: micro kernel size */
 	u32 ucode_size;
+	/** @css_offset: offset within the blob at which the CSS is located */
+	u32 css_offset;
 
 	/** @private_data_size: size of private data found in uC css header */
 	u32 private_data_size;
-- 
2.41.0

