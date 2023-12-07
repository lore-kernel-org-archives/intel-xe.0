Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C9FC6FD1F
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 09:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404CD10F13A;
	Fri, 22 Mar 2024 09:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/GlZqgQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B0310F1C0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 09:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711099703; x=1742635703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2V59MitLA68wo1vQqlKyv4g1m8xE1k6l/ro6krlfgkA=;
 b=J/GlZqgQKPO7EWjhc/tOJFZr/i1Uw3IFBxlNb/6LtZZ7SCIvyF0lKbhI
 TJgUN8aWjnlqq5wLRVBteoGkemgXODsx810QE9aQerVwMQ24NJ3h+XR2p
 hyM8WLjtN2CbWrXIbmFEKequOW846ke7ZtGPicpCjoQjMzieCQG2w/xRd
 W0r7QwF/4/JqeiZXqrcr6CXsc7Z1hKdqzOY2FV7iYy/ZLCR0+FydDxHdf
 NZkgvxYhTFFN7Tvz/l1BDdeV5ghgrj226x8ePxQ0bhVgcS21xTZgFsRuo
 J9KHNODURJhFh7mDZoT521ZGvo9gejQaURtMKx8qsjRm7zeOkPAJ2Pycz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16774124"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="16774124"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:28:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="19565565"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa005.jf.intel.com with ESMTP; 22 Mar 2024 02:28:17 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 2/2] drm/xe/xe_hw_engine_class_sysfs: prefer sysfs_emit
 over sprintf for sysfs
Date: Thu,  7 Dec 2023 06:58:40 +0530
Message-Id: <20231207012840.48432-3-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207012840.48432-1-krishnaiah.bommu@intel.com>
References: <20231207012840.48432-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Static analyzer Reported "Calling risky function (DC.STRING_BUFFER)”

v2: used sysfs_emit instand of snprintf

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index c17cce53f19d..314d7bf6b1b6 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -71,7 +71,7 @@ static ssize_t job_timeout_max_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.job_timeout_max);
 }
 
 static const struct kobj_attribute job_timeout_max_attr =
@@ -107,7 +107,7 @@ static ssize_t job_timeout_min_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.job_timeout_min);
 }
 
 static const struct kobj_attribute job_timeout_min_attr =
@@ -140,7 +140,7 @@ static ssize_t job_timeout_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_ms);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.job_timeout_ms);
 }
 
 static const struct kobj_attribute job_timeout_attr =
@@ -151,7 +151,7 @@ static ssize_t job_timeout_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_ms);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.job_timeout_ms);
 }
 
 static const struct kobj_attribute job_timeout_def =
@@ -162,7 +162,7 @@ static ssize_t job_timeout_min_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.job_timeout_min);
 }
 
 static const struct kobj_attribute job_timeout_min_def =
@@ -173,7 +173,7 @@ static ssize_t job_timeout_max_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.job_timeout_max);
 }
 
 static const struct kobj_attribute job_timeout_max_def =
@@ -232,7 +232,7 @@ static ssize_t timeslice_duration_max_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.timeslice_max);
 }
 
 static const struct kobj_attribute timeslice_duration_max_attr =
@@ -270,7 +270,7 @@ static ssize_t timeslice_duration_min_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.timeslice_min);
 }
 
 static const struct kobj_attribute timeslice_duration_min_attr =
@@ -282,7 +282,7 @@ static ssize_t timeslice_duration_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_us);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.timeslice_us);
 }
 
 static const struct kobj_attribute timeslice_duration_attr =
@@ -294,7 +294,7 @@ static ssize_t timeslice_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.timeslice_us);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.timeslice_us);
 }
 
 static const struct kobj_attribute timeslice_duration_def =
@@ -305,7 +305,7 @@ static ssize_t timeslice_min_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.timeslice_min);
 }
 
 static const struct kobj_attribute timeslice_duration_min_def =
@@ -316,7 +316,7 @@ static ssize_t timeslice_max_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.timeslice_max);
 }
 
 static const struct kobj_attribute timeslice_duration_max_def =
@@ -349,7 +349,7 @@ static ssize_t preempt_timeout_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_us);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.preempt_timeout_us);
 }
 
 static const struct kobj_attribute preempt_timeout_attr =
@@ -361,7 +361,7 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_us);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.preempt_timeout_us);
 }
 
 static const struct kobj_attribute preempt_timeout_def =
@@ -373,7 +373,7 @@ static ssize_t preempt_timeout_min_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.preempt_timeout_min);
 }
 
 static const struct kobj_attribute preempt_timeout_min_def =
@@ -385,7 +385,7 @@ static ssize_t preempt_timeout_max_default(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
 
-	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
+	return sysfs_emit(buf, "%u\n", eclass->defaults.preempt_timeout_max);
 }
 
 static const struct kobj_attribute preempt_timeout_max_def =
@@ -421,7 +421,7 @@ static ssize_t preempt_timeout_max_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_max);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.preempt_timeout_max);
 }
 
 static const struct kobj_attribute preempt_timeout_max_attr =
@@ -458,7 +458,7 @@ static ssize_t preempt_timeout_min_show(struct kobject *kobj,
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
+	return sysfs_emit(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
 }
 
 static const struct kobj_attribute preempt_timeout_min_attr =
-- 
2.25.1

