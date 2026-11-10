Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18B9606A325
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 18:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CBCIrHeS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48DD10E971;
	Tue, 10 Nov 2026 18:35:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A1E10E321
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 18:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794335737; x=1825871737;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EeHgNXW5bIO+3Lbnrvm8KBSTP+svn49I51oxeuYwQkA=;
 b=CBCIrHeSp94mxIc1xXV8HRQbdh/so/TMA1WviMjEWCGVVAGLOBu4+xE2
 7GQUnxEDdCDJnv1H4VQd0t09Bw90owqIQOwXWypx/qae36RhGgAWBTnq5
 /I2PBOFOakrTSK6a2hu+FrY3etj/jsm0jv/w1k0J8LpWf9TCblraChgV0
 KFNpFLAGP1nyc9sZ8YgWbzeyHf9hIrTkduO5D38Zw5YCee7Ewq/BLUfsp
 V0hwu9EPchCt35m4ce53oKeCPO0mZ7g3b+TxwzVLu9DHmEBYckGmYw0d3
 c85y6UkyYy5BtC7GULRx9xbCGTBvOLPAF8WcH5Z64ZEfHDLCNeNrhbHTU w==;
X-CSE-ConnectionGUID: u60kg2kBTXq49l/TOo5UcQ==
X-CSE-MsgGUID: gbB+WF4wR2CX23yPr8Na1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2990113"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2990113"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:35:17 -0800
X-CSE-ConnectionGUID: uaqA8JOHTKqXicTpay1pwQ==
X-CSE-MsgGUID: D+fqexN3TMmQmwOKZC2sOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8253148"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:35:17 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v14 14/17] drm/xe/vsec: Add PMT GUID internal access
Date: Tue, 10 Nov 2026 10:35:19 -0800
Message-ID: <20261110183505.694124-33-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110183505.694124-19-michael.j.ruhl@intel.com>
References: <20261110183505.694124-19-michael.j.ruhl@intel.com>
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

Xe accesses the PMT infrastructure directly. The current usage is
supported ONLY by BMG devices.

CRI has further requirements for access.

Add the platform id to the GUID register define and use that for the
register access.

Add an API to allow access the GUID based on the platform.

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h     |  4 +-
 drivers/gpu/drm/xe/xe_debugfs.c      |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_hwmon.c        |  2 +-
 drivers/gpu/drm/xe/xe_pcode.c        |  2 +-
 drivers/gpu/drm/xe/xe_vsec.c         | 55 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h         |  1 +
 7 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index 2f6658395587..fb5b5a8648ba 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -10,7 +10,7 @@
 #define BMG_PMT_BASE_OFFSET		0xDB000
 #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
 
-#define PUNIT_TELEMETRY_GUID		XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
+#define BMG_PUNIT_TELEMETRY_GUID	XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
 #define BMG_ENERGY_STATUS_PMT_OFFSET	(0x30)
 #define	ENERGY_PKG			REG_GENMASK64(31, 0)
 #define	ENERGY_CARD			REG_GENMASK64(63, 32)
@@ -24,6 +24,8 @@
 /* for CRI discovery and telemetry are in an indexed window */
 #define CRI_PMT_OFFSET			(SOC_BASE + XE_PMT_BASE_OFFSET)
 
+#define CRI_PUNIT_TELEMETRY_GUID	XE_REG(CRI_PMT_OFFSET + 0x4)
+
 #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
 #define BMG_G2_RESIDENCY_OFFSET		(0x530)
 #define BMG_G6_RESIDENCY_OFFSET		(0x538)
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index e59d4964d811..8a470fe967d5 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -154,7 +154,7 @@ static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
 	int ret;
 
 	ret = xe_pmt_telem_read(xe->drm.dev,
-				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+				xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
 				&residency, offset, sizeof(residency));
 	if (ret != sizeof(residency)) {
 		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0fc9ab556146..a35a8b6e733e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -490,6 +490,8 @@ struct xe_device {
 		struct delayed_work work;
 		/** @pmt.retry_count: late-bind probe retry */
 		u32 retry_count;
+		/** @pmt.punit_guid_cache: cache of the PUNIT GUID */
+		u32 punit_guid_cache;
 	} pmt;
 
 	/** @soc_remapper: SoC remapper object */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index defe8aaca7c1..d9636eca0133 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -605,7 +605,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 		u64 pmt_val;
 
 		ret = xe_pmt_telem_read(hwmon->xe->drm.dev,
-					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+					xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
 					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
 		if (ret != sizeof(pmt_val)) {
 			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 266deecbb100..8c901e54f384 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -369,7 +369,7 @@ int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
 	guard(xe_pm_runtime)(xe);
 
 	ret = xe_pmt_telem_read(xe->drm.dev,
-				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
+				xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PUNIT_TELEMETRY_GUID),
 				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
 	if (ret != sizeof(*version)) {
 		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index f400a6d6ec8d..f27bfe8218d7 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -583,6 +583,61 @@ static void vsec_disable_late_bind_work(void *arg)
 		xe_pm_runtime_put(xe);
 }
 
+/**
+ * xe_vsec_get_guid - Get and cache the PUNIT guid value
+ * @xe: valid xe device
+ * @guid: returned guid
+ *
+ * Return:
+ * * -ENODATA device is not active
+ * * -EINVAL unsupported platform
+ * * 0 success
+ */
+int xe_vsec_get_guid(struct xe_device *xe, u32 *guid)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	int ret = 0;
+
+	xe_assert(xe, !IS_SRIOV_VF(xe));
+
+	if (!xe_pm_runtime_get_if_active(xe))
+		return -ENODATA;
+
+	mutex_lock(&xe->pmt.lock);
+
+	if (xe->pmt.punit_guid_cache) {
+		*guid = xe->pmt.punit_guid_cache;
+		goto unlock;
+	}
+
+	switch (xe->info.platform) {
+	case XE_BATTLEMAGE:
+		*guid = xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID);
+		break;
+
+	case XE_CRESCENTISLAND:
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+		*guid = xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
+		break;
+
+	default:
+		*guid = 0;
+		drm_err(&xe->drm, "Unsupported platform: %u\n", xe->info.platform);
+		ret = -EINVAL;
+		break;
+	}
+
+	/* the GUID is static, read once and cache for all requests */
+	if (*guid)
+		xe->pmt.punit_guid_cache = *guid;
+
+unlock:
+	mutex_unlock(&xe->pmt.lock);
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
 /**
  * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
  * interface
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
index c4a1e2fc67d8..50187fdc1207 100644
--- a/drivers/gpu/drm/xe/xe_vsec.h
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -10,6 +10,7 @@ struct device;
 struct xe_device;
 
 int xe_vsec_init(struct xe_device *xe);
+int xe_vsec_get_guid(struct xe_device *xe, u32 *guid);
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
 
 #endif
-- 
2.43.0

