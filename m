Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489CCCCF9F1
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 05:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B035D10E344;
	Mon, 27 Oct 2025 05:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYnRW4Hf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE8210E142
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 05:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761544681; x=1793080681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YB/jHUoZMPypf25/GatiprRw3JrCNQ4k76QSCG8z61I=;
 b=SYnRW4HfeW5dqKbXKUaGBKHLCZ5bPdZxnN0iukrBcBFXhlHHmPGuV1YF
 iE2cWYT3SQy6TLrZZHlxjt9Uy3v7fFzmZExlsUx4Pkx1T5/mmpVAJ5uoT
 eopI/AwAA1P/wEosPTT9lOdGrVMMez7Xfh0u8WUcbLAHViZPpY+Pi0qWw
 t/M4grYunH8SdopO1fT978fzroRYXpjMa3IVXMfTDug2WllTt2gSwT/PV
 qHow7SAOwHte1fvHLKWBtsLHktqDfAYBefjWYpnQFnRBOmXoBReyaU+c1
 YhUlwUBHNNYCwiMmp53hpjv2wvfilqQAWbd8lnFS6+U7H6XbEtX/vuR6J w==;
X-CSE-ConnectionGUID: EKNQEFchT16WDjf3doGcpw==
X-CSE-MsgGUID: bZaUCfkpTwa5tr7bLTY12w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73905954"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="73905954"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:58:01 -0700
X-CSE-ConnectionGUID: 9uRgDp9RSGm3hSJqotUK8A==
X-CSE-MsgGUID: YWUmXPoKQDWgFVbsEn+DMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="185308494"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:58:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Date: Sun, 26 Oct 2025 22:57:20 -0700
Message-ID: <20251026-gt-throttle-cri-v2-8-41f8288a71a7@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
References: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-50d74
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

It's currently not possible to safely monitor if there's throttling
happening and what are the reasons. The approach of reading the status
and then reading the reasons is not reliable as by the time sysadmin
reads the reason, the throttling could not be happening anymore.

Previous tentative to fix that[1] was breaking the ABI and potentially
sysadmin's scripts. This takes a different approach of adding and
documenting the additional attribute. It's still valuable, though
redundant, to provide the simpler 0/1 interface.

In order to avoid userspace knowledge on the bitmask meaning and to be
able to maintain the kernel side in sync with possible changes in
future, just walk the attribute group and check what are the masks that
match the value read.

[1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/

Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 46 +++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index fa7068aac3344..fd2988dacbbb6 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -22,9 +22,15 @@
  * Their availability depend on the platform and some may not be visible if that
  * reason is not available.
  *
+ * The ``status_reasons`` attribute can be used by sysadmin monitoring all
+ * possible reasons for throttling and reporting them. It's preferred over
+ * monitoring ``status`` and then reading the reason both for simplicity and to
+ * avoid TOCTOU.
+ *
  * The following attributes are available on Crescent Island platform:
  *
- * - ``status``: Overall throttle status
+ * - ``status``: Overall throttle status (0: no throttling, 1: throttling)
+ * - ``status_reasons``: All reasons causing throttling separated by newline.
  * - ``reason_pl1``: package PL1
  * - ``reason_pl2``: package PL2
  * - ``reason_pl4``: package PL4
@@ -43,7 +49,8 @@
  *
  * Other platforms support the following reasons:
  *
- * - ``status``: Overall status
+ * - ``status``: Overall throttle status (0: no throttling, 1: throttling)
+ * - ``status_reasons``: All reasons causing throttling separated by newline.
  * - ``reason_pl1``: package PL1
  * - ``reason_pl2``: package PL2
  * - ``reason_pl4``: package PL4, Iccmax etc.
@@ -111,12 +118,45 @@ static ssize_t reason_show(struct kobject *kobj,
 	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, ta->mask));
 }
 
+static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe);
+
+static ssize_t status_reasons_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buff)
+{
+	struct xe_gt *gt = throttle_to_gt(kobj);
+	struct xe_device *xe = gt_to_xe(gt);
+	const struct attribute_group *group;
+	struct attribute **pother;
+	ssize_t ret = 0;
+	u32 reasons;
+
+	reasons = xe_gt_throttle_get_limit_reasons(gt);
+	group = get_platform_throttle_group(xe);
+
+	for (pother = group->attrs; *pother; pother++) {
+		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
+		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
+
+		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
+			ret += sysfs_emit_at(buff, ret, "%s\n", (*pother)->name);
+	}
+
+	return ret;
+}
+
 #define THROTTLE_ATTR_RO(name, _mask)				\
 	struct throttle_attribute attr_##name =	{		\
 		.attr = __ATTR(name, 0444, reason_show, NULL),	\
 		.mask = _mask,					\
 	}
 
+#define THROTTLE_ATTR_RO_FUNC(name, _mask, _show)		\
+	struct throttle_attribute attr_##name =	{		\
+		.attr = __ATTR(name, 0444, _show, NULL),	\
+		.mask = _mask,					\
+	}
+
+static THROTTLE_ATTR_RO_FUNC(status_reasons, 0, status_reasons_show);
 static THROTTLE_ATTR_RO(status, U32_MAX);
 static THROTTLE_ATTR_RO(reason_pl1, POWER_LIMIT_1_MASK);
 static THROTTLE_ATTR_RO(reason_pl2, POWER_LIMIT_2_MASK);
@@ -128,6 +168,7 @@ static THROTTLE_ATTR_RO(reason_vr_thermalert, VR_THERMALERT_MASK);
 static THROTTLE_ATTR_RO(reason_vr_tdc, VR_TDC_MASK);
 
 static struct attribute *throttle_attrs[] = {
+	&attr_status_reasons.attr.attr,
 	&attr_status.attr.attr,
 	&attr_reason_pl1.attr.attr,
 	&attr_reason_pl2.attr.attr,
@@ -153,6 +194,7 @@ static THROTTLE_ATTR_RO(reason_psys_crit, PSYS_CRIT_MASK);
 
 static struct attribute *cri_throttle_attrs[] = {
 	/* Common */
+	&attr_status_reasons.attr.attr,
 	&attr_status.attr.attr,
 	&attr_reason_pl1.attr.attr,
 	&attr_reason_pl2.attr.attr,

-- 
2.51.0

