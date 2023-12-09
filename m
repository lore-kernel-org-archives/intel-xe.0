Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FC3C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 07:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD4E10E667;
	Mon, 25 Mar 2024 07:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTUu2GDh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783FB10E663
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 07:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711353567; x=1742889567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iKejNBSMNYKjAAcSEEq5HopJlmyAmfN+UANuJkB7Phs=;
 b=FTUu2GDhsjhipI4Nh/ZafVWOJSy8S+Uvr8jo1tvhTtufQrAMH1dzCdGm
 1OKE4ZLa8cn9D5fNTEgvNPvVCzHkS5xOn4BO39fU2yk667715AGAXoUxK
 s0GhdKUpERCDEzxuVhbuSpwSgm2x37uH33GVp0mzhhlkrHPoDN7sgsXHN
 YzaSaxMtX7V2SIhyi6X6Yqs+M2Vhi+7fRmGyjOBvJd1jtGfD30PfcyU4c
 naqINozSW1d6uMWhYHU+BeWIhMWhm0fC5LeFrTUI/AMjZ+ztyMaU0Utwn
 DZOpI5+NlosDjuMerBl7FA4NjWKEmF8F+hfaM7tV8mw7+NFZlcu/sWKgZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6199055"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6199055"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 00:59:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="15525058"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa009.jf.intel.com with ESMTP; 25 Mar 2024 00:59:26 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v4 2/2] drm/xe/xe_hw_engine_class_sysfs: use sysfs_emit() for
 attr's _show()
Date: Sun, 10 Dec 2023 05:29:49 +0530
Message-Id: <20231209235949.54524-3-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231209235949.54524-1-krishnaiah.bommu@intel.com>
References: <20231209235949.54524-1-krishnaiah.bommu@intel.com>
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

sprintf() is deprecated for sysfs, use preferred sysfs_emit() instead.

v2: used sysfs_emit instand of sprintf

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index aba01edffacd..c5084d94c442 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -72,7 +72,7 @@ static ssize_t job_timeout_max_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.job_timeout_max);
 }
 
 static const struct kobj_attribute job_timeout_max_attr =
@@ -108,7 +108,7 @@ static ssize_t job_timeout_min_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.job_timeout_min);
 }
 
 static const struct kobj_attribute job_timeout_min_attr =
@@ -141,7 +141,7 @@ static ssize_t job_timeout_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_ms);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.job_timeout_ms);
 }
 
 static const struct kobj_attribute job_timeout_attr =
@@ -152,7 +152,7 @@ static ssize_t job_timeout_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_ms);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.job_timeout_ms);
 }
 
 static const struct kobj_attribute job_timeout_def =
@@ -163,7 +163,7 @@ static ssize_t job_timeout_min_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.job_timeout_min);
 }
 
 static const struct kobj_attribute job_timeout_min_def =
@@ -174,7 +174,7 @@ static ssize_t job_timeout_max_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.job_timeout_max);
 }
 
 static const struct kobj_attribute job_timeout_max_def =
@@ -233,7 +233,7 @@ static ssize_t timeslice_duration_max_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.timeslice_max);
 }
 
 static const struct kobj_attribute timeslice_duration_max_attr =
@@ -271,7 +271,7 @@ static ssize_t timeslice_duration_min_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.timeslice_min);
 }
 
 static const struct kobj_attribute timeslice_duration_min_attr =
@@ -283,7 +283,7 @@ static ssize_t timeslice_duration_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_us);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.timeslice_us);
 }
 
 static const struct kobj_attribute timeslice_duration_attr =
@@ -295,7 +295,7 @@ static ssize_t timeslice_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.timeslice_us);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.timeslice_us);
 }
 
 static const struct kobj_attribute timeslice_duration_def =
@@ -306,7 +306,7 @@ static ssize_t timeslice_min_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.timeslice_min);
 }
 
 static const struct kobj_attribute timeslice_duration_min_def =
@@ -317,7 +317,7 @@ static ssize_t timeslice_max_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.timeslice_max);
 }
 
 static const struct kobj_attribute timeslice_duration_max_def =
@@ -350,7 +350,7 @@ static ssize_t preempt_timeout_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_us);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.preempt_timeout_us);
 }
 
 static const struct kobj_attribute preempt_timeout_attr =
@@ -362,7 +362,7 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_us);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.preempt_timeout_us);
 }
 
 static const struct kobj_attribute preempt_timeout_def =
@@ -374,7 +374,7 @@ static ssize_t preempt_timeout_min_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.preempt_timeout_min);
 }
 
 static const struct kobj_attribute preempt_timeout_min_def =
@@ -386,7 +386,7 @@ static ssize_t preempt_timeout_max_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.preempt_timeout_max);
 }
 
 static const struct kobj_attribute preempt_timeout_max_def =
@@ -422,7 +422,7 @@ static ssize_t preempt_timeout_max_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_max);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.preempt_timeout_max);
 }
 
 static const struct kobj_attribute preempt_timeout_max_attr =
@@ -459,7 +459,7 @@ static ssize_t preempt_timeout_min_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
 }
 
 static const struct kobj_attribute preempt_timeout_min_attr =
-- 
2.25.1

