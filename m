Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B09CCF9E2
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 05:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E6110E6AD;
	Wed, 22 Oct 2025 05:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j45t8oxU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8229010E6A6
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 05:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761110318; x=1792646318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iuE8uI4AE7B22CNWopXVEh3/eCO+01T+Gn4rC1xHNsI=;
 b=j45t8oxU4KQpHZx+gjoQIEYHBn0WYlcyr/j1cQCeRhUCoQDX2JimSdyj
 hxeX1z7w5Qb4YAPJ8PbvIPlJ5n8VRMThlXD+4fXPOX/v9X985RiH149qN
 BcB626o2KR2IERl+p8WdMySB0JqYPgIkpv/yO2AvLlugBaoaEwO6SDr9+
 BWt/Ac61SLsN671KujRqEZS9DzU8xjuubKxUuc+8E1u5iV2Xo9jPrSsnG
 tdMMn2dLxXFeVwgUUQ2iNt/drUVrQJL8/BuujOQneK3tuZrg+ztc6B/N3
 229Wkav0LH5CpZhmPwKUg+5rCb2LiRfG3cn0LuyH/kYDuRW9EDGsWs5JU w==;
X-CSE-ConnectionGUID: +hXSwfoWSVajM2MYnuU76Q==
X-CSE-MsgGUID: FPNtnjwgSKCqZVoMJugMAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67083974"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67083974"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
X-CSE-ConnectionGUID: hZ2E5jqlShOjKoUhruP3aA==
X-CSE-MsgGUID: 65gCZa8ESWm8pjtipHXtxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="220959691"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 04/12] drm/xe/cri: Add new performance limit reasons bits
Date: Tue, 21 Oct 2025 22:17:36 -0700
Message-ID: <20251021-cri-v1-4-bf11e61d9f49@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
Content-Transfer-Encoding: quoted-printable
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

From: Sk Anirban <sk.anirban@intel.com>=0D
=0D
Add support for additional performance limit reasons in=0D
GT0_PERF_LIMIT_REASONS register.=0D
=0D
Signed-off-by: Sk Anirban <sk.anirban@intel.com>=0D
---=0D
=0D
There are some improvements to be made here before applying to reduce=0D
the amount of code for one platform. I plan to take a look on that for=0D
v2.=0D
=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  15 +++=0D
 drivers/gpu/drm/xe/xe_gt_throttle.c  | 249 +++++++++++++++++++++++++++++++=
+++-=0D
 2 files changed, 261 insertions(+), 3 deletions(-)=0D
=0D
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs=
/xe_gt_regs.h=0D
index 3545e0be06dae..bba5500a094ed 100644=0D
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h=0D
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h=0D
@@ -589,6 +589,8 @@=0D
 #define GT_GFX_RC6				XE_REG(0x138108)=0D
 =0D
 #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)=0D
+=0D
+/* Common performance limit reason bits - available on all platforms */=0D
 #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3=0D
 #define   PROCHOT_MASK				REG_BIT(0)=0D
 #define   THERMAL_LIMIT_MASK			REG_BIT(1)=0D
@@ -599,6 +601,19 @@=0D
 #define   POWER_LIMIT_1_MASK			REG_BIT(10)=0D
 #define   POWER_LIMIT_2_MASK			REG_BIT(11)=0D
 =0D
+/* Platform-specific performance limit reason bits - for Crescent Island *=
/=0D
+#define   PERF_LIMIT_REASONS_MASK		0xfdff=0D
+#define   SOC_THERMAL_LIMIT_MASK		REG_BIT(1)=0D
+#define   MEM_THERMAL_MASK			REG_BIT(2)=0D
+#define   VR_THERMAL_MASK			REG_BIT(3)=0D
+#define   ICCMAX_MASK				REG_BIT(4)=0D
+#define   SOC_AVG_THERMAL_MASK			REG_BIT(6)=0D
+#define   FASTVMODE_MASK			REG_BIT(7)=0D
+#define   PSYS_PL1_MASK				REG_BIT(12)=0D
+#define   PSYS_PL2_MASK				REG_BIT(13)=0D
+#define   P0_FREQ_MASK				REG_BIT(14)=0D
+#define   PSYS_CRIT_MASK			REG_BIT(15)=0D
+=0D
 #define GT_PERF_STATUS				XE_REG(0x1381b4)=0D
 #define   VOLTAGE_MASK				REG_GENMASK(10, 0)=0D
 =0D
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt=
_throttle.c=0D
index aa962c783cdf7..b38cfd22c6183 100644=0D
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c=0D
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c=0D
@@ -12,6 +12,7 @@=0D
 #include "xe_gt_sysfs.h"=0D
 #include "xe_gt_throttle.h"=0D
 #include "xe_mmio.h"=0D
+#include "xe_platform_types.h"=0D
 #include "xe_pm.h"=0D
 =0D
 /**=0D
@@ -28,6 +29,24 @@=0D
  * device/gt#/freq0/throttle/reason_ratl - Frequency throttle due to RATL=
=0D
  * device/gt#/freq0/throttle/reason_vr_thermalert - Frequency throttle due=
 to VR THERMALERT=0D
  * device/gt#/freq0/throttle/reason_vr_tdc -  Frequency throttle due to VR=
 TDC=0D
+ *=0D
+ * The following attributes are available on Crescent Island platform:=0D
+ * device/gt#/freq0/throttle/status - Overall throttle status=0D
+ * device/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to packag=
e PL1=0D
+ * device/gt#/freq0/throttle/reason_pl2 - Frequency throttle due to packag=
e PL2=0D
+ * device/gt#/freq0/throttle/reason_pl4 - Frequency throttle due to PL4=0D
+ * device/gt#/freq0/throttle/reason_prochot - Frequency throttle due to pr=
ochot=0D
+ * device/gt#/freq0/throttle/reason_soc_thermal - Frequency throttle due t=
o SoC thermal=0D
+ * device/gt#/freq0/throttle/reason_mem_thermal - Frequency throttle due t=
o memory thermal=0D
+ * device/gt#/freq0/throttle/reason_vr_thermal - Frequency throttle due to=
 VR thermal=0D
+ * device/gt#/freq0/throttle/reason_iccmax - Frequency throttle due to ICC=
MAX=0D
+ * device/gt#/freq0/throttle/reason_ratl - Frequency throttle due to RATL =
thermal algorithm=0D
+ * device/gt#/freq0/throttle/reason_soc_avg_thermal - Frequency throttle d=
ue to SoC average temp=0D
+ * device/gt#/freq0/throttle/reason_fastvmode - Frequency throttle due to =
VR is hitting FastVMode=0D
+ * device/gt#/freq0/throttle/reason_psys_pl1 - Frequency throttle due to P=
SYS PL1=0D
+ * device/gt#/freq0/throttle/reason_psys_pl2 - Frequency throttle due to P=
SYS PL2=0D
+ * device/gt#/freq0/throttle/reason_p0_freq - Frequency throttle due to P0=
 frequency=0D
+ * device/gt#/freq0/throttle/reason_psys_crit - Frequency throttle due to =
PSYS critical=0D
  */=0D
 =0D
 static struct xe_gt *=0D
@@ -52,7 +71,13 @@ u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)=0D
 =0D
 static u32 read_status(struct xe_gt *gt)=0D
 {=0D
-	u32 status =3D xe_gt_throttle_get_limit_reasons(gt) & GT0_PERF_LIMIT_REAS=
ONS_MASK;=0D
+	struct xe_device *xe =3D gt_to_xe(gt);=0D
+	u32 status;=0D
+=0D
+	if (xe->info.platform =3D=3D XE_CRESCENTISLAND)=0D
+		status =3D xe_gt_throttle_get_limit_reasons(gt) & PERF_LIMIT_REASONS_MAS=
K;=0D
+	else=0D
+		status =3D xe_gt_throttle_get_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS=
_MASK;=0D
 =0D
 	xe_gt_dbg(gt, "throttle reasons: 0x%08x\n", status);=0D
 	return status;=0D
@@ -86,6 +111,13 @@ static u32 read_reason_thermal(struct xe_gt *gt)=0D
 	return thermal;=0D
 }=0D
 =0D
+static u32 read_reason_soc_thermal(struct xe_gt *gt)=0D
+{=0D
+	u32 thermal =3D xe_gt_throttle_get_limit_reasons(gt) & SOC_THERMAL_LIMIT_=
MASK;=0D
+=0D
+	return thermal;=0D
+}=0D
+=0D
 static u32 read_reason_prochot(struct xe_gt *gt)=0D
 {=0D
 	u32 prochot =3D xe_gt_throttle_get_limit_reasons(gt) & PROCHOT_MASK;=0D
@@ -107,6 +139,13 @@ static u32 read_reason_vr_thermalert(struct xe_gt *gt)=
=0D
 	return thermalert;=0D
 }=0D
 =0D
+static u32 read_reason_soc_avg_thermal(struct xe_gt *gt)=0D
+{=0D
+	u32 soc_avg_thermal =3D xe_gt_throttle_get_limit_reasons(gt) & SOC_AVG_TH=
ERMAL_MASK;=0D
+=0D
+	return soc_avg_thermal;=0D
+}=0D
+=0D
 static u32 read_reason_vr_tdc(struct xe_gt *gt)=0D
 {=0D
 	u32 tdc =3D xe_gt_throttle_get_limit_reasons(gt) & VR_TDC_MASK;=0D
@@ -114,6 +153,62 @@ static u32 read_reason_vr_tdc(struct xe_gt *gt)=0D
 	return tdc;=0D
 }=0D
 =0D
+static u32 read_reason_fastvmode(struct xe_gt *gt)=0D
+{=0D
+	u32 fastvmode =3D xe_gt_throttle_get_limit_reasons(gt) & FASTVMODE_MASK;=
=0D
+=0D
+	return fastvmode;=0D
+}=0D
+=0D
+static u32 read_reason_mem_thermal(struct xe_gt *gt)=0D
+{=0D
+	u32 mem_thermal =3D xe_gt_throttle_get_limit_reasons(gt) & MEM_THERMAL_MA=
SK;=0D
+=0D
+	return mem_thermal;=0D
+}=0D
+=0D
+static u32 read_reason_vr_thermal(struct xe_gt *gt)=0D
+{=0D
+	u32 vr_thermal =3D xe_gt_throttle_get_limit_reasons(gt) & VR_THERMAL_MASK=
;=0D
+=0D
+	return vr_thermal;=0D
+}=0D
+=0D
+static u32 read_reason_iccmax(struct xe_gt *gt)=0D
+{=0D
+	u32 iccmax =3D xe_gt_throttle_get_limit_reasons(gt) & ICCMAX_MASK;=0D
+=0D
+	return iccmax;=0D
+}=0D
+=0D
+static u32 read_reason_psys_pl1(struct xe_gt *gt)=0D
+{=0D
+	u32 psys_pl1 =3D xe_gt_throttle_get_limit_reasons(gt) & PSYS_PL1_MASK;=0D
+=0D
+	return psys_pl1;=0D
+}=0D
+=0D
+static u32 read_reason_psys_pl2(struct xe_gt *gt)=0D
+{=0D
+	u32 psys_pl2 =3D xe_gt_throttle_get_limit_reasons(gt) & PSYS_PL2_MASK;=0D
+=0D
+	return psys_pl2;=0D
+}=0D
+=0D
+static u32 read_reason_p0_freq(struct xe_gt *gt)=0D
+{=0D
+	u32 p0_freq =3D xe_gt_throttle_get_limit_reasons(gt) & P0_FREQ_MASK;=0D
+=0D
+	return p0_freq;=0D
+}=0D
+=0D
+static u32 read_reason_psys_crit(struct xe_gt *gt)=0D
+{=0D
+	u32 psys_crit =3D xe_gt_throttle_get_limit_reasons(gt) & PSYS_CRIT_MASK;=
=0D
+=0D
+	return psys_crit;=0D
+}=0D
+=0D
 static ssize_t status_show(struct kobject *kobj,=0D
 			   struct kobj_attribute *attr, char *buff)=0D
 {=0D
@@ -169,6 +264,17 @@ static ssize_t reason_thermal_show(struct kobject *kob=
j,=0D
 }=0D
 static struct kobj_attribute attr_reason_thermal =3D __ATTR_RO(reason_ther=
mal);=0D
 =0D
+static ssize_t reason_soc_thermal_show(struct kobject *kobj,=0D
+				       struct kobj_attribute *attr, char *buff)=0D
+{=0D
+	struct device *dev =3D kobj_to_dev(kobj);=0D
+	struct xe_gt *gt =3D dev_to_gt(dev);=0D
+	bool thermal =3D !!read_reason_soc_thermal(gt);=0D
+=0D
+	return sysfs_emit(buff, "%u\n", thermal);=0D
+}=0D
+static struct kobj_attribute attr_reason_soc_thermal =3D __ATTR_RO(reason_=
soc_thermal);=0D
+=0D
 static ssize_t reason_prochot_show(struct kobject *kobj,=0D
 				   struct kobj_attribute *attr, char *buff)=0D
 {=0D
@@ -202,6 +308,17 @@ static ssize_t reason_vr_thermalert_show(struct kobjec=
t *kobj,=0D
 }=0D
 static struct kobj_attribute attr_reason_vr_thermalert =3D __ATTR_RO(reaso=
n_vr_thermalert);=0D
 =0D
+static ssize_t reason_soc_avg_thermal_show(struct kobject *kobj,=0D
+					   struct kobj_attribute *attr, char *buff)=0D
+{=0D
+	struct device *dev =3D kobj_to_dev(kobj);=0D
+	struct xe_gt *gt =3D dev_to_gt(dev);=0D
+	bool avg_thermalert =3D !!read_reason_soc_avg_thermal(gt);=0D
+=0D
+	return sysfs_emit(buff, "%u\n", avg_thermalert);=0D
+}=0D
+static struct kobj_attribute attr_reason_soc_avg_thermal =3D __ATTR_RO(rea=
son_soc_avg_thermal);=0D
+=0D
 static ssize_t reason_vr_tdc_show(struct kobject *kobj,=0D
 				  struct kobj_attribute *attr, char *buff)=0D
 {=0D
@@ -213,6 +330,94 @@ static ssize_t reason_vr_tdc_show(struct kobject *kobj=
,=0D
 }=0D
 static struct kobj_attribute attr_reason_vr_tdc =3D __ATTR_RO(reason_vr_td=
c);=0D
 =0D
+static ssize_t reason_fastvmode_show(struct kobject *kobj,=0D
+				     struct kobj_attribute *attr, char *buff)=0D
+{=0D
+	struct device *dev =3D kobj_to_dev(kobj);=0D
+	struct xe_gt *gt =3D dev_to_gt(dev);=0D
+	bool fastvmode =3D !!read_reason_fastvmode(gt);=0D
+=0D
+	return sysfs_emit(buff, "%u\n", fastvmode);=0D
+}=0D
+static struct kobj_attribute attr_reason_fastvmode =3D __ATTR_RO(reason_fa=
stvmode);=0D
+=0D
+static ssize_t reason_mem_thermal_show(struct kobject *kobj,=0D
+				       struct kobj_attribute *attr, char *buff)=0D
+{=0D
+	struct device *dev =3D kobj_to_dev(kobj);=0D
+	struct xe_gt *gt =3D dev_to_gt(dev);=0D
+	bool mem_thermal =3D !!read_reason_mem_thermal(gt);=0D
+=0D
+	return sysfs_emit(buff, "%u\n", mem_thermal);=0D
+}=0D
+static struct kobj_attribute attr_reason_mem_thermal =3D __ATTR_RO(reason_=
mem_thermal);=0D
+=0D
+static ssize_t reason_vr_thermal_show(struct kobject *kobj,=0D
+				      struct kobj_attribute *attr, char *buff)=0D
+{=0D
+	struct device *dev =3D kobj_to_dev(kobj);=0D
+	struct xe_gt *gt =3D dev_to_gt(dev);=0D
+	bool vr_thermal =3D !!read_reason_vr_thermal(gt);=0D
+=0D
+	return sysfs_emit(buff, "%u\n", vr_thermal);=0D
+}=0D
+static struct kobj_attribute attr_reason_vr_thermal =3D __ATTR_RO(reason_v=
r_thermal);=0D
+=0D
+static ssize_t reason_iccmax_show(struct kobject *kobj,=0D
+				  struct kobj_attribute *attr, char *buff)=0D
+{=0D
+	struct device *dev =3D kobj_to_dev(kobj);=0D
+	struct xe_gt *gt =3D dev_to_gt(dev);=0D
+	bool iccmax =3D !!read_reason_iccmax(gt);=0D
+=0D
+	return sysfs_emit(buff, "%u\n", iccmax);=0D
+}=0D
+static struct kobj_attribute attr_reason_iccmax =3D __ATTR_RO(reason_iccma=
x);=0D
+=0D
+static ssize_t reason_psys_pl1_show(struct kobject *kobj,=0D
+				    struct kobj_attribute *attr, char *buff)=0D
+{=0D
+	struct device *dev =3D kobj_to_dev(kobj);=0D
+	struct xe_gt *gt =3D dev_to_gt(dev);=0D
+	bool psys_pl1 =3D !!read_reason_psys_pl1(gt);=0D
+=0D
+	return sysfs_emit(buff, "%u\n", psys_pl1);=0D
+}=0D
+static struct kobj_attribute attr_reason_psys_pl1 =3D __ATTR_RO(reason_psy=
s_pl1);=0D
+=0D
+static ssize_t reason_psys_pl2_show(struct kobject *kobj,=0D
+				    struct kobj_attribute *attr, char *buff)=0D
+{=0D
+	struct device *dev =3D kobj_to_dev(kobj);=0D
+	struct xe_gt *gt =3D dev_to_gt(dev);=0D
+	bool psys_pl2 =3D !!read_reason_psys_pl2(gt);=0D
+=0D
+	return sysfs_emit(buff, "%u\n", psys_pl2);=0D
+}=0D
+static struct kobj_attribute attr_reason_psys_pl2 =3D __ATTR_RO(reason_psy=
s_pl2);=0D
+=0D
+static ssize_t reason_p0_freq_show(struct kobject *kobj,=0D
+				   struct kobj_attribute *attr, char *buff)=0D
+{=0D
+	struct device *dev =3D kobj_to_dev(kobj);=0D
+	struct xe_gt *gt =3D dev_to_gt(dev);=0D
+	bool p0_freq =3D !!read_reason_p0_freq(gt);=0D
+=0D
+	return sysfs_emit(buff, "%u\n", p0_freq);=0D
+}=0D
+static struct kobj_attribute attr_reason_p0_freq =3D __ATTR_RO(reason_p0_f=
req);=0D
+=0D
+static ssize_t reason_psys_crit_show(struct kobject *kobj,=0D
+				     struct kobj_attribute *attr, char *buff)=0D
+{=0D
+	struct device *dev =3D kobj_to_dev(kobj);=0D
+	struct xe_gt *gt =3D dev_to_gt(dev);=0D
+	bool psys_crit =3D !!read_reason_psys_crit(gt);=0D
+=0D
+	return sysfs_emit(buff, "%u\n", psys_crit);=0D
+}=0D
+static struct kobj_attribute attr_reason_psys_crit =3D __ATTR_RO(reason_ps=
ys_crit);=0D
+=0D
 static struct attribute *throttle_attrs[] =3D {=0D
 	&attr_status.attr,=0D
 	&attr_reason_pl1.attr,=0D
@@ -226,24 +431,62 @@ static struct attribute *throttle_attrs[] =3D {=0D
 	NULL=0D
 };=0D
 =0D
+static struct attribute *throttle_cri_specific_attrs[] =3D {=0D
+	&attr_status.attr,=0D
+	&attr_reason_prochot.attr,=0D
+	&attr_reason_soc_thermal.attr,=0D
+	&attr_reason_mem_thermal.attr,=0D
+	&attr_reason_vr_thermal.attr,=0D
+	&attr_reason_iccmax.attr,=0D
+	&attr_reason_ratl.attr,=0D
+	&attr_reason_soc_avg_thermal.attr,=0D
+	&attr_reason_fastvmode.attr,=0D
+	&attr_reason_pl4.attr,=0D
+	&attr_reason_pl1.attr,=0D
+	&attr_reason_pl2.attr,=0D
+	&attr_reason_psys_pl1.attr,=0D
+	&attr_reason_psys_pl2.attr,=0D
+	&attr_reason_p0_freq.attr,=0D
+	&attr_reason_psys_crit.attr,=0D
+	NULL=0D
+};=0D
+=0D
 static const struct attribute_group throttle_group_attrs =3D {=0D
 	.name =3D "throttle",=0D
 	.attrs =3D throttle_attrs,=0D
 };=0D
 =0D
+static const struct attribute_group cri_throttle_group_attrs =3D {=0D
+	.name =3D "throttle",=0D
+	.attrs =3D throttle_cri_specific_attrs,=0D
+};=0D
+=0D
+static const struct attribute_group *get_platform_throttle_group(struct xe=
_device *xe)=0D
+{=0D
+	switch (xe->info.platform) {=0D
+	case XE_CRESCENTISLAND:=0D
+		return &cri_throttle_group_attrs;=0D
+	default:=0D
+		return &throttle_group_attrs;=0D
+	}=0D
+}=0D
+=0D
 static void gt_throttle_sysfs_fini(void *arg)=0D
 {=0D
 	struct xe_gt *gt =3D arg;=0D
+	struct xe_device *xe =3D gt_to_xe(gt);=0D
+	const struct attribute_group *group =3D get_platform_throttle_group(xe);=
=0D
 =0D
-	sysfs_remove_group(gt->freq, &throttle_group_attrs);=0D
+	sysfs_remove_group(gt->freq, group);=0D
 }=0D
 =0D
 int xe_gt_throttle_init(struct xe_gt *gt)=0D
 {=0D
 	struct xe_device *xe =3D gt_to_xe(gt);=0D
+	const struct attribute_group *group =3D get_platform_throttle_group(xe);=
=0D
 	int err;=0D
 =0D
-	err =3D sysfs_create_group(gt->freq, &throttle_group_attrs);=0D
+	err =3D sysfs_create_group(gt->freq, group);=0D
 	if (err)=0D
 		return err;=0D
 =0D
=0D
-- =0D
2.51.0=0D
=0D
