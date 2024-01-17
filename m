Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD65C47DA2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 12:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFC610E677;
	Wed, 17 Jan 2024 12:28:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636D310E677
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 12:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705494500; x=1737030500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FTMGZ0C+Ipf8Iq5kEXWJhVN1KmBmN+6NgmHVgCzQC3M=;
 b=j/yWayh3DBRndhVmGOKHSLWZPXKXwLGhsa4nX/If5Q/7ng6N8XcDujuC
 aJL6uWAo4nwlVh6qOEO6PFwY9zl43PMzZEMksltzKNO44D4qPIZI9ocPU
 5VF5BTmXvbZesd3xcGKkLAidpiCI+q+mq96OJ5f0tiAfVRnRJRMzy83+Z
 2KeRF1NYVIl9Ni4po/hVKRFN9RmTEYbEy8HL8ibkg8L55eMysBGhbd5TV
 1fKi3MkevxoJW8RhkRuc76Be+21wo6NfYYD/qg6dI0I3k7Xo7Id+iNmn5
 5rnx9k3gceptFXP736629JaUfCbNbCdk2lWQzra9VrkCxmEBnp8KMXhpR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="43997"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="43997"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:21:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="784502350"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="784502350"
Received: from msznigir-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.230])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:21:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/5] drm/xe: constify engine class sysfs attributes
Date: Wed, 17 Jan 2024 14:20:44 +0200
Message-Id: <20240117122044.1544174-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240117122044.1544174-1-jani.nikula@intel.com>
References: <20240117122044.1544174-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

All of the attributes, as well as the array of attributes, can be const
and placed in rodata.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index e49bc14f0ecf..2345fb42fa39 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -73,7 +73,7 @@ static ssize_t job_timeout_max_show(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
 }
 
-static struct kobj_attribute job_timeout_max_attr =
+static const struct kobj_attribute job_timeout_max_attr =
 __ATTR(job_timeout_max, 0644, job_timeout_max_show, job_timeout_max_store);
 
 static ssize_t job_timeout_min_store(struct kobject *kobj,
@@ -109,7 +109,7 @@ static ssize_t job_timeout_min_show(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
 }
 
-static struct kobj_attribute job_timeout_min_attr =
+static const struct kobj_attribute job_timeout_min_attr =
 __ATTR(job_timeout_min, 0644, job_timeout_min_show, job_timeout_min_store);
 
 static ssize_t job_timeout_store(struct kobject *kobj,
@@ -142,7 +142,7 @@ static ssize_t job_timeout_show(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_ms);
 }
 
-static struct kobj_attribute job_timeout_attr =
+static const struct kobj_attribute job_timeout_attr =
 __ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
 
 static ssize_t job_timeout_default(struct kobject *kobj,
@@ -153,7 +153,7 @@ static ssize_t job_timeout_default(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_ms);
 }
 
-static struct kobj_attribute job_timeout_def =
+static const struct kobj_attribute job_timeout_def =
 __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
 
 static ssize_t job_timeout_min_default(struct kobject *kobj,
@@ -164,7 +164,7 @@ static ssize_t job_timeout_min_default(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
 }
 
-static struct kobj_attribute job_timeout_min_def =
+static const struct kobj_attribute job_timeout_min_def =
 __ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
 
 static ssize_t job_timeout_max_default(struct kobject *kobj,
@@ -175,7 +175,7 @@ static ssize_t job_timeout_max_default(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
 }
 
-static struct kobj_attribute job_timeout_max_def =
+static const struct kobj_attribute job_timeout_max_def =
 __ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
 
 static ssize_t timeslice_duration_store(struct kobject *kobj,
@@ -234,7 +234,7 @@ static ssize_t timeslice_duration_max_show(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
 }
 
-static struct kobj_attribute timeslice_duration_max_attr =
+static const struct kobj_attribute timeslice_duration_max_attr =
 	__ATTR(timeslice_duration_max, 0644, timeslice_duration_max_show,
 	       timeslice_duration_max_store);
 
@@ -272,7 +272,7 @@ static ssize_t timeslice_duration_min_show(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
 }
 
-static struct kobj_attribute timeslice_duration_min_attr =
+static const struct kobj_attribute timeslice_duration_min_attr =
 	__ATTR(timeslice_duration_min, 0644, timeslice_duration_min_show,
 	       timeslice_duration_min_store);
 
@@ -284,7 +284,7 @@ static ssize_t timeslice_duration_show(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_us);
 }
 
-static struct kobj_attribute timeslice_duration_attr =
+static const struct kobj_attribute timeslice_duration_attr =
 	__ATTR(timeslice_duration_us, 0644, timeslice_duration_show,
 	       timeslice_duration_store);
 
@@ -296,7 +296,7 @@ static ssize_t timeslice_default(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->defaults.timeslice_us);
 }
 
-static struct kobj_attribute timeslice_duration_def =
+static const struct kobj_attribute timeslice_duration_def =
 __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
 
 static ssize_t timeslice_min_default(struct kobject *kobj,
@@ -307,7 +307,7 @@ static ssize_t timeslice_min_default(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
 }
 
-static struct kobj_attribute timeslice_duration_min_def =
+static const struct kobj_attribute timeslice_duration_min_def =
 __ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
 
 static ssize_t timeslice_max_default(struct kobject *kobj,
@@ -318,7 +318,7 @@ static ssize_t timeslice_max_default(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
 }
 
-static struct kobj_attribute timeslice_duration_max_def =
+static const struct kobj_attribute timeslice_duration_max_def =
 __ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
 
 static ssize_t preempt_timeout_store(struct kobject *kobj,
@@ -351,7 +351,7 @@ static ssize_t preempt_timeout_show(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_us);
 }
 
-static struct kobj_attribute preempt_timeout_attr =
+static const struct kobj_attribute preempt_timeout_attr =
 __ATTR(preempt_timeout_us, 0644, preempt_timeout_show, preempt_timeout_store);
 
 static ssize_t preempt_timeout_default(struct kobject *kobj,
@@ -363,7 +363,7 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_us);
 }
 
-static struct kobj_attribute preempt_timeout_def =
+static const struct kobj_attribute preempt_timeout_def =
 __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
 
 static ssize_t preempt_timeout_min_default(struct kobject *kobj,
@@ -375,7 +375,7 @@ static ssize_t preempt_timeout_min_default(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
 }
 
-static struct kobj_attribute preempt_timeout_min_def =
+static const struct kobj_attribute preempt_timeout_min_def =
 __ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default, NULL);
 
 static ssize_t preempt_timeout_max_default(struct kobject *kobj,
@@ -387,7 +387,7 @@ static ssize_t preempt_timeout_max_default(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
 }
 
-static struct kobj_attribute preempt_timeout_max_def =
+static const struct kobj_attribute preempt_timeout_max_def =
 __ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default, NULL);
 
 static ssize_t preempt_timeout_max_store(struct kobject *kobj,
@@ -423,7 +423,7 @@ static ssize_t preempt_timeout_max_show(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_max);
 }
 
-static struct kobj_attribute preempt_timeout_max_attr =
+static const struct kobj_attribute preempt_timeout_max_attr =
 	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
 	       preempt_timeout_max_store);
 
@@ -460,7 +460,7 @@ static ssize_t preempt_timeout_min_show(struct kobject *kobj,
 	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
 }
 
-static struct kobj_attribute preempt_timeout_min_attr =
+static const struct kobj_attribute preempt_timeout_min_attr =
 	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
 	       preempt_timeout_min_store);
 
@@ -477,7 +477,7 @@ static const struct attribute *defaults[] = {
 	NULL
 };
 
-static const struct attribute *files[] = {
+static const struct attribute * const files[] = {
 	&job_timeout_attr.attr,
 	&job_timeout_min_attr.attr,
 	&job_timeout_max_attr.attr,
-- 
2.39.2

