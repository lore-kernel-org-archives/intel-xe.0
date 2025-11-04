Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B4DCCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 22:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8CA10E67F;
	Tue,  4 Nov 2025 22:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBXYyROw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1C510E67F
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 22:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762294885; x=1793830885;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wRXM8u/72XdjTm/xpZ/cbqePwlg1dVmNWqixX7fRLgw=;
 b=HBXYyROwhUCBcWP3PQkP/NsVFSc70DEUNPSXuGtdczP51hqc9mFJRg44
 qrxXZXDnUMeK0LoAl8zHLG9+PSZlYOCngw+JUgKGOmWCggGcQDu3RCuH4
 W8qCN3Sp3Qn3ej81h7oPTLwK8mYsGIblnnYkakdqjtNYwJfqeEjNfMlIC
 GXSCyGbWKxrQi6rd0miZaT9QlEWd+v8flQsLhrOwCxnrCIXrb9HxP0nHP
 dxDnSFkvoQWIpddD1KLBl1p3DN3xE3h5eaFEj2dsyTWyDxpAgn8qiZ5rZ
 o/AEA/U/JDI/tM1/vvtinoVEWIinqIf7zQG2rHo9ZsaU0RbRj+xELGW8m w==;
X-CSE-ConnectionGUID: pFeaTbjDRWuostkQc+Ua0g==
X-CSE-MsgGUID: C0lXv36pQhmz1JVtGcXBMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="67017412"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="67017412"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 14:21:25 -0800
X-CSE-ConnectionGUID: +ove6I52T82MsONsxtS6rw==
X-CSE-MsgGUID: cmfJKfqjT82xEhd6HqF3Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="186962179"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 14:21:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Date: Tue,  4 Nov 2025 14:20:51 -0800
Message-ID: <20251104-gt-throttle-cri-v5-1-4948b060bbfd@intel.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251023-gt-throttle-cri-06f3c9d33c44
X-Mailer: b4 0.15-dev-50d74
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

It's currently not possible to safely monitor if there's throttling=0D
happening and what are the reasons. The approach of reading the status=0D
and then reading the reasons is not reliable as by the time sysadmin=0D
reads the reason, the throttling could not be happening anymore.=0D
=0D
Previous tentative to fix that[1] was breaking the ABI and potentially=0D
sysadmin's scripts. This takes a different approach of adding and=0D
documenting the additional attribute. It's still valuable, though=0D
redundant, to provide the simpler 0/1 interface.=0D
=0D
In order to avoid userspace knowledge on the bitmask meaning and to be=0D
able to maintain the kernel side in sync with possible changes in=0D
future, just walk the attribute group and check what are the masks that=0D
match the value read.=0D
=0D
[1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@int=
el.com/=0D
=0D
Cc: Raag Jadav <raag.jadav@intel.com>=0D
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
All refactors and CRI support merged - refer to the previous versions=0D
for those. Here there's only the new `reasons` attribute.=0D
=0D
Changes in v5:=0D
- Optimize common "none" path by not checking any masks if reasons is 0=0D
  (Raag)=0D
- Switch the "none" path to use sysfs_emit() (Raag)=0D
- Add warning to catch cases in which the returned value by (future)=0D
  hardware creates a mismatch with available attributes=0D
- Link to v4: https://patch.msgid.link/20251031-gt-throttle-cri-v4-1-b4691e=
e9ebf4@intel.com=0D
=0D
Changes in v4:=0D
- Drop all merged patches, keeping just the last one with new `reasons`=0D
  attribute=0D
- Link to v3: https://patch.msgid.link/20251029-gt-throttle-cri-v3-0-d1f5ab=
bb8114@intel.com=0D
=0D
Changes in v3:=0D
- Use space as separator for the reasons (Rodrigo)=0D
- Link to v2: https://patch.msgid.link/20251026-gt-throttle-cri-v2-0-41f828=
8a71a7@intel.com=0D
=0D
Changes in v2:=0D
- Handle comments on v1, noted on individual patches=0D
- Improve documentation, adding it to the html output=0D
- Add patch to introduce status_reasons attribute to overcome the TOCTOU=0D
  of the current API=0D
- Link to v1: https://patch.msgid.link/20251023-gt-throttle-cri-v1-0-9f36f3=
c8861c@intel.com=0D
---=0D
 drivers/gpu/drm/xe/xe_gt_throttle.c | 58 +++++++++++++++++++++++++++++++++=
++--=0D
 1 file changed, 56 insertions(+), 2 deletions(-)=0D
=0D
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt=
_throttle.c=0D
index fa7068aac3344..82c5fbcdfbe3e 100644=0D
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c=0D
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c=0D
@@ -22,9 +22,15 @@=0D
  * Their availability depend on the platform and some may not be visible i=
f that=0D
  * reason is not available.=0D
  *=0D
+ * The ``reasons`` attribute can be used by sysadmin to monitor all possib=
le=0D
+ * reasons for throttling and report them. It's preferred over monitoring=
=0D
+ * ``status`` and then reading the reason from individual attributes since=
 that=0D
+ * is racy. If there's no throttling happening, "none" is returned.=0D
+ *=0D
  * The following attributes are available on Crescent Island platform:=0D
  *=0D
- * - ``status``: Overall throttle status=0D
+ * - ``status``: Overall throttle status (0: no throttling, 1: throttling)=
=0D
+ * - ``reasons``: Array of reasons causing throttling separated by space=0D
  * - ``reason_pl1``: package PL1=0D
  * - ``reason_pl2``: package PL2=0D
  * - ``reason_pl4``: package PL4=0D
@@ -43,7 +49,8 @@=0D
  *=0D
  * Other platforms support the following reasons:=0D
  *=0D
- * - ``status``: Overall status=0D
+ * - ``status``: Overall throttle status (0: no throttling, 1: throttling)=
=0D
+ * - ``reasons``: Array of reasons causing throttling separated by space=0D
  * - ``reason_pl1``: package PL1=0D
  * - ``reason_pl2``: package PL2=0D
  * - ``reason_pl4``: package PL4, Iccmax etc.=0D
@@ -111,12 +118,57 @@ static ssize_t reason_show(struct kobject *kobj,=0D
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, ta->mask));=0D
 }=0D
 =0D
+static const struct attribute_group *get_platform_throttle_group(struct xe=
_device *xe);=0D
+=0D
+static ssize_t reasons_show(struct kobject *kobj,=0D
+			    struct kobj_attribute *attr, char *buff)=0D
+{=0D
+	struct xe_gt *gt =3D throttle_to_gt(kobj);=0D
+	struct xe_device *xe =3D gt_to_xe(gt);=0D
+	const struct attribute_group *group;=0D
+	struct attribute **pother;=0D
+	ssize_t ret =3D 0;=0D
+	u32 reasons;=0D
+=0D
+	reasons =3D xe_gt_throttle_get_limit_reasons(gt);=0D
+	if (!reasons)=0D
+		goto ret_none;=0D
+=0D
+	group =3D get_platform_throttle_group(xe);=0D
+	for (pother =3D group->attrs; *pother; pother++) {=0D
+		struct kobj_attribute *kattr =3D container_of(*pother, struct kobj_attri=
bute, attr);=0D
+		struct throttle_attribute *other_ta =3D kobj_attribute_to_throttle(kattr=
);=0D
+=0D
+		if (other_ta->mask !=3D U32_MAX && reasons & other_ta->mask)=0D
+			ret +=3D sysfs_emit_at(buff, ret, "%s ", (*pother)->name);=0D
+	}=0D
+=0D
+	if (drm_WARN_ONCE(&xe->drm, !ret, "Unknown reason: %#x\n", reasons))=0D
+		goto ret_none;=0D
+=0D
+	/* Drop extra space from last iteration above */=0D
+	ret--;=0D
+	ret +=3D sysfs_emit_at(buff, ret, "\n");=0D
+=0D
+	return ret;=0D
+=0D
+ret_none:=0D
+	return sysfs_emit(buff, "none\n");=0D
+}=0D
+=0D
 #define THROTTLE_ATTR_RO(name, _mask)				\=0D
 	struct throttle_attribute attr_##name =3D	{		\=0D
 		.attr =3D __ATTR(name, 0444, reason_show, NULL),	\=0D
 		.mask =3D _mask,					\=0D
 	}=0D
 =0D
+#define THROTTLE_ATTR_RO_FUNC(name, _mask, _show)		\=0D
+	struct throttle_attribute attr_##name =3D	{		\=0D
+		.attr =3D __ATTR(name, 0444, _show, NULL),	\=0D
+		.mask =3D _mask,					\=0D
+	}=0D
+=0D
+static THROTTLE_ATTR_RO_FUNC(reasons, 0, reasons_show);=0D
 static THROTTLE_ATTR_RO(status, U32_MAX);=0D
 static THROTTLE_ATTR_RO(reason_pl1, POWER_LIMIT_1_MASK);=0D
 static THROTTLE_ATTR_RO(reason_pl2, POWER_LIMIT_2_MASK);=0D
@@ -128,6 +180,7 @@ static THROTTLE_ATTR_RO(reason_vr_thermalert, VR_THERMA=
LERT_MASK);=0D
 static THROTTLE_ATTR_RO(reason_vr_tdc, VR_TDC_MASK);=0D
 =0D
 static struct attribute *throttle_attrs[] =3D {=0D
+	&attr_reasons.attr.attr,=0D
 	&attr_status.attr.attr,=0D
 	&attr_reason_pl1.attr.attr,=0D
 	&attr_reason_pl2.attr.attr,=0D
@@ -153,6 +206,7 @@ static THROTTLE_ATTR_RO(reason_psys_crit, PSYS_CRIT_MAS=
K);=0D
 =0D
 static struct attribute *cri_throttle_attrs[] =3D {=0D
 	/* Common */=0D
+	&attr_reasons.attr.attr,=0D
 	&attr_status.attr.attr,=0D
 	&attr_reason_pl1.attr.attr,=0D
 	&attr_reason_pl2.attr.attr,=0D
=0D
=0D
=0D
