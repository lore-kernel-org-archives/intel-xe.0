Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB92AD5E138
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 11:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9145710E8D9;
	Tue, 16 Dec 2025 11:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5HYKBub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A5410E8D9
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 11:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765885252; x=1797421252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WNCOVMHVcp87/4oZXDrOVDz1ifvA+lJ9/vkwla4aEuo=;
 b=G5HYKBubaUNnKE4Xt72bUdtPq9kbbngEBvHWlnIebHGMBJCRwphLQAlX
 eq2bcKOlwcWpm6AiRh4cl0A14Tv31HNXgl3OBZZ6A/Z286dpKVuvleKdV
 sumfq+Vz9P9kzLevtbYNKiBebNIfY40hQrZgWnBDUEoR5QNwREVRSp+Cs
 NtXHkw+ri+nNN5Fx7fBMkJYk46Bwl0J5eEnS7iaFsR/atYPTqhSHWIpoS
 gfi1uhfD62MaS2fHWQ2/qRaMN+cLK0rK7JUAe8FStWzKYBpVYiz/n3GUJ
 R+bk/mYQy2mSEQnSbjazxiiWs6NdIuzxR0VMNf+QE+x4R5NLVZ+8p3T0L w==;
X-CSE-ConnectionGUID: W4s8d0lTSBmsi2mnL4i4eQ==
X-CSE-MsgGUID: WrbAxSm0QtiPz5UZh4JDvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="70376747"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="70376747"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 03:40:52 -0800
X-CSE-ConnectionGUID: N5EA9dJkRHWU8HInjaRxXA==
X-CSE-MsgGUID: nce9nf/hQtW/6gGLNKIqYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="197977866"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 03:40:50 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 3/4] drm/xe/hwmon: Expose GPU pcie temperature
Date: Tue, 16 Dec 2025 17:10:29 +0530
Message-Id: <20251216114030.226399-4-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251216114030.226399-1-karthik.poosa@intel.com>
References: <20251216114030.226399-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Expose GPU PCIe average temperature and its limits via hwmon
sysfs temp5_xxx.
Update Xe hwmon sysfs documentation for this.

v2: Update kernel version in Xe hwmon documentation. (Raag)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 36 +++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 81f9b5d58850..51a35fcfb393 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -260,3 +260,27 @@ Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. Memory controller critical temperature in millidegree Celsius.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_input
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. GPU PCIe temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_emergency
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. GPU PCIe shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_crit
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. GPU PCIe critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 6d31ad74cd0e..b8519c734b4e 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -44,6 +44,7 @@ enum xe_hwmon_channel {
 	CHANNEL_PKG,
 	CHANNEL_VRAM,
 	CHANNEL_MCTRL,
+	CHANNEL_PCIE,
 	CHANNEL_MAX,
 };
 
@@ -713,6 +714,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |
 			   HWMON_T_MAX,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
@@ -787,6 +789,28 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 	return 0;
 }
 
+static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	int ret = 0;
+	u32 data = 0;
+
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, 2),
+			    &data, NULL);
+	drm_dbg(&hwmon->xe->drm, "thermal data for pcie ret %d, val 0x%x\n", ret, data);
+	if (ret)
+		return ret;
+
+	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
+		data >>= 8;
+	*val = (data & TEMP_MASK_MAILBOX) * MILLIDEGREE_PER_DEGREE;
+
+	if (data & 0x80)
+		*val = *val * -1;
+
+	return 0;
+}
+
 /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
 static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
 {
@@ -895,6 +919,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
 		case CHANNEL_MCTRL:
 			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
+		case CHANNEL_PCIE:
+			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -907,6 +933,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
 		case CHANNEL_MCTRL:
 			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
+		case CHANNEL_PCIE:
+			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -928,6 +956,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 					       channel)) ? 0444 : 0;
 		case CHANNEL_MCTRL:
 			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
+		case CHANNEL_PCIE:
+			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -954,6 +984,8 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			break;
 		case CHANNEL_MCTRL:
 			return get_mc_temp(hwmon, val);
+		case CHANNEL_PCIE:
+			return get_pcie_temp(hwmon, val);
 		default:
 			*val = 0;
 			return -EOPNOTSUPP;
@@ -962,6 +994,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	case hwmon_temp_emergency:
 		switch (channel) {
 		case CHANNEL_PKG:
+		case CHANNEL_PCIE:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			break;
 		case CHANNEL_VRAM:
@@ -976,6 +1009,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	case hwmon_temp_crit:
 		switch (channel) {
 		case CHANNEL_PKG:
+		case CHANNEL_PCIE:
 			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
 			break;
 		case CHANNEL_VRAM:
@@ -1360,6 +1394,8 @@ static int xe_hwmon_read_label(struct device *dev,
 			*str = "vram";
 		else if (channel == CHANNEL_MCTRL)
 			*str = "mctrl_avg";
+		else if (channel == CHANNEL_PCIE)
+			*str = "pcie";
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
-- 
2.25.1

