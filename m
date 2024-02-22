Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DFBC54791
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF2D10E9BA;
	Thu, 22 Feb 2024 16:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwiMmTA7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8524810E9B4
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708619999; x=1740155999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Om24etIheXvFWBk2WuDxXgiTH68uV/cb3jJc2q3Oa9M=;
 b=WwiMmTA7aw1l48+SEQNQ9SmYRMONaDHYhoRNIyLRDNuIXZnMzPdP5BSd
 tTtUKW6GK3W5LukJQGNT6Ps8+45R+j3jEteEnr2aA2Yj0/yXZ4cdrjS+E
 W48duFvU9bNz2YriGgCCu9F7tGSVkZCGFyPB1sqn4x/G08js8IvFzJdot
 zWhmdP7sKhW6G0vH9fy4FpAJsNINjM6iVLllcMcc69kp27p+gAeCBOkRq
 klfNlwwZCjjcWYMr6Wpcg/qvvZTCSaYEmMmQQPG5S/OcGgZvft1Ss4bjU
 g3+ZFST/2Vy81rdB4QYgkhs+WgAkVKoTh/3gjElNewYr5C9r/d2437bug Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2730655"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2730655"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:39:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913552832"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="913552832"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 08:39:59 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:39:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 08:39:58 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 08:39:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LotPkBWEsH8mbynwfF4gLj8hRNVcpHcP39+VVTnJ8rBi2yBJ6WpwECa0+lfVTKVvEcZ0ZGJUPuxOnN2ifN1zU8kVGHlL7HWAiAhLR2NdKc/G1Q5OT6lGxyIa2shdy0h1yTZb0vcSXpm7bnVxkg55NnQvn+Bm+tNQJmAfkcznQRWtHFViyzHSNu961esP/PgBT04aHuMBAt236J2ISDmOuqQ5+v20C4JOg0tLbT7iafdnEerU+Tpw2WKdWHMTEIarjMUCdl6SJWnpimJ7ieQXb6mdngpa/IAgL2kRCgPvAdUmiujap880d5NJbDW7RKXeuUeSKvy/Ie7njepz+jXv9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Bc4wxMEDCrcl7TKISb3HIRCVKrTumoFy2iF8cjxvIc=;
 b=OtKbl4Bqi12P98J57PF6mJWjL1EwUIforShQ3Db5FbmI7tc4rPis//Ld1LWOxXSiAphtncg9gAD7KQkcL4aJ3scHQna12/RJSccf1316rZjOR5YaDAgCEy9mqsEmWasUKdAX6Uv/jpU2l648KFKQJUxpgeiT9WySXCaS5IRezPkl7+BoQC4p+nMrT0quFxv+2mmNTeQNavoSOnyxZ3RO769AN4uo6bOaaZxy8m5BQR2piH1i1nbgK2RAB6mwzt7Nqh7C/LiXP3Ew+ij8rCKfhHJeD1qcU+bRAgI+SmnNL96Tyizrgi1BHfnMto446o6Is2I8OmtPQ9xeGHtmKyAWwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 16:39:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 16:39:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 05/14] drm/xe: Runtime PM wake on every sysfs call
Date: Thu, 22 Feb 2024 11:39:28 -0500
Message-ID: <20240222163937.138342-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ed443f-12fa-4402-7150-08dc33c4e6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xtxF7KDKFhRix2GAy4rE9q8RoYMnWt/Tt2kHynnm8L4kq/dqS69mOxCCRf9KtZ59TwfmadPbpDyfh4glj2+gKNAuT6MfGqjhuPi3qwp4H+PMOCpZvsy2i4U3/PAo+GQkTdcPSTv7hU8V7zatBK7gDuh9JpDGNLLOQwQg7ByyPAMG2xFOHbO6BzShMtWFWz95BkWmaXJ7fhbFgrr194j3fkdEjlwsDWahI6wWDFCrjv4zuVPe8/0hElKhn2/F3KIVzHw2QR4joZWFuDWuuyv2kiF0Cc9KXaosE4FflOiSsBmEan+wNPzdlzE8WpW7x5p6Ax3ahYOOXVTfqGv6TT4CrwnXjfjOrrbxa/hXVgP3aIebH57DH+oZr5tene8OL3UeV/eCTypxJXkcMlT+qEkNelJxZQN6CUelIM5HEKxNDGIuK9HrFu5bkcs0F8XVBJ4HP9ffQGgw3ayz2zhqoW7TB7lguZReSHlUTTc4lmOalW6QhMdBHd+OWYgUp9KxLFRfuXjTz4lonIQgn1PjRZqCW6ru+jWcBky/fN9DrJ+P/xk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/rMg4HuSOnTaos/+rv3RWZU1ajgf5BSghSDfGOOXMgnjbplO3bxiumFrfXEn?=
 =?us-ascii?Q?RptkgrZeWX5x4BgjiLTL+fJb8wgWg5el36v+KdDhzS1Rlfd4CSfQI4UoDw0Q?=
 =?us-ascii?Q?gGUIWiaNsBvDUy6fYkZuf2HkwRuh1nGQf4d4VYgfnAKwokF8saudykjfoDL/?=
 =?us-ascii?Q?to+Xo0erSoT9/Ho0C23dYRl2V7sc9SWtagQ7uX4sTbLbfNGRNk8Bgm9vZDGf?=
 =?us-ascii?Q?dKjj+g7gcgWJrgamxoFCn7ECNpG7vR4nFAw/tqSAlNxgDl/z79iU00thD0ii?=
 =?us-ascii?Q?857CkEejRwLLfUogCcvHIGicw9cyiu61/Az7Y1dIJzdkSAOFBSdxEZwC63uE?=
 =?us-ascii?Q?1IYfDOst1QZhAIBtO92OLvSIHEkowi/cMGahvEMHahrR647xWyz1iOhZfxQB?=
 =?us-ascii?Q?laIv1mhEVIkLBS+oSV4zYEv4MDbWvWwddV/NVph4sa//NQr3arsxXbJIhaPK?=
 =?us-ascii?Q?mtIBN0fkBypRSmwBKcbKuWHZam/7wa/37Doh5klOMIitLG3UZneLttXVz2nE?=
 =?us-ascii?Q?W3CKCa2zvcbgZz8CMIjgcSaApCx4DuMYjrBrKDGm6eoqWS/HtFI2M0neEqwE?=
 =?us-ascii?Q?vkuG3wunn7PApkeUErJBwCoYt18a9O25cI0bayNa5dNVaZimX4cyT7Q64aMD?=
 =?us-ascii?Q?iBj8NxKHQU/QPVcz7citNOZ2XCkG26Pb/F9uXzEFk/5nUVrm8EsegBbEQt5F?=
 =?us-ascii?Q?STNwWkv2tt4V3w5U/rwOf3buoRfwvqpND1uqhUQGEMAlUOoMmr8+toOd7VDP?=
 =?us-ascii?Q?c/pmb9DwVFhEY5vQfOL7rgsBPI+eKTmXPFU1H9upiDb8HUV8JB+LTMi9ZkzD?=
 =?us-ascii?Q?CDlwMCsJj4Rhxa2wRVUkFqfCYTVSXshM0ti5CSKnAqELsvD1sHce3G6j7hxC?=
 =?us-ascii?Q?AOe7aRoPF9f59mEE8NEmgzlk/yZva7Cxq32JZ2DbER2pxwJ6/zQUZKhc0yQX?=
 =?us-ascii?Q?WwrQUcvdnuUmx0bWJ+CIM2xB07Efw2NLuii70DbeNVgvbTikHWM3OBcGdwBp?=
 =?us-ascii?Q?Mw9iORKr2VzDbl/Nverl9anYP0EbiZunpb8xYvdJX/+7vB7Kq3EGL/0WJLHy?=
 =?us-ascii?Q?/xo50/sufjDuowk0hF29sWVMhGJcAknHSw1j2BOGmaiJLVV6/R6dBz+t1YjN?=
 =?us-ascii?Q?ihxzTNuvC6NuZiQhNhE3YttkZa+23QGRj20tMKBWoC5Ir+PUKmbjKzpWSwMt?=
 =?us-ascii?Q?BL5aj/Co8M/bB76vR2XdjKT/b9KMljpLznTvPUoTHYJbI2p5r8mU8bIHOaXE?=
 =?us-ascii?Q?864M1ilrkUSEoddcsY1bI8EU9wM1QrglURPB76/LFawUTsexWA4afi1exYtM?=
 =?us-ascii?Q?qNtVvtXrAMNmLGUMZOm1H8v489xIQGZuIFf1AyH5UaUlVttarEkd+15RGoO9?=
 =?us-ascii?Q?IgiHWb7sIKjWOMpL6azA2G0nIOQnQ+H3H9ZzCkrhDBFS4Uiqxj8Gn/uNZqSM?=
 =?us-ascii?Q?ngaci39M7yDRJsWwsbGsZp75rEwCo21qTkXswZk5GlLahRZ+w6cq25sK8MyA?=
 =?us-ascii?Q?X0cyP2dzQl8pNo4Eob/9e1sohiQ9CwjVEkK0lKiR60j29EyFZHdLW3qVyE8R?=
 =?us-ascii?Q?Au02fXR+VHWiH8e/RqzfiEF+nqp+JMAQ+pnjx/6rN039eM2w6LqPA0FXyoi7?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ed443f-12fa-4402-7150-08dc33c4e6b1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:39:55.8726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Tv+YFQGuLbHJlTwKJimbVOX6gayI49H9SbqMQJYAp0p9voQHdoZE0/HNk16xsCfOzkUaB5CyEW/hFw5TxAiBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6816
X-OriginatorOrg: intel.com
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

Let's ensure our PCI device is awaken on every sysfs call.
Let's increase the runtime_pm protection and start moving
that to the outer bounds.

For now, for the files with small number of attr functions,
let's only call the runtime pm functions directly.
For the hw_engines entries with many files, let's add
the sysfs_ops wrapper.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c          |  4 ++
 drivers/gpu/drm/xe/xe_gt_freq.c               | 38 +++++++++++-
 drivers/gpu/drm/xe/xe_gt_idle.c               | 23 +++++++-
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     |  3 +
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 58 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |  7 +++
 drivers/gpu/drm/xe/xe_tile_sysfs.c            |  1 +
 7 files changed, 129 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 99113a5a2b84..e47c8ad1bb17 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -35,7 +35,9 @@ vram_d3cold_threshold_show(struct device *dev,
 	if (!xe)
 		return -EINVAL;
 
+	xe_pm_runtime_get(xe);
 	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
+	xe_pm_runtime_put(xe);
 
 	return ret;
 }
@@ -58,7 +60,9 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
 
 	drm_dbg(&xe->drm, "vram_d3cold_threshold: %u\n", vram_d3cold_threshold);
 
+	xe_pm_runtime_get(xe);
 	ret = xe_pm_set_vram_threshold(xe, vram_d3cold_threshold);
+	xe_pm_runtime_put(xe);
 
 	return ret ?: count;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index e5b0f4ecdbe8..32b9a743629c 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -15,6 +15,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_gt_throttle_sysfs.h"
 #include "xe_guc_pc.h"
+#include "xe_pm.h"
 
 /**
  * DOC: Xe GT Frequency Management
@@ -49,12 +50,23 @@ dev_to_pc(struct device *dev)
 	return &kobj_to_gt(dev->kobj.parent)->uc.guc.pc;
 }
 
+static struct xe_device *
+dev_to_xe(struct device *dev)
+{
+	return gt_to_xe(kobj_to_gt(dev->kobj.parent));
+}
+
 static ssize_t act_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 freq;
+
+	xe_pm_runtime_get(dev_to_xe(dev));
+	freq = xe_guc_pc_get_act_freq(pc);
+	xe_pm_runtime_put(dev_to_xe(dev));
 
-	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_act_freq(pc));
+	return sysfs_emit(buf, "%d\n", freq);
 }
 static DEVICE_ATTR_RO(act_freq);
 
@@ -65,7 +77,9 @@ static ssize_t cur_freq_show(struct device *dev,
 	u32 freq;
 	ssize_t ret;
 
+	xe_pm_runtime_get(dev_to_xe(dev));
 	ret = xe_guc_pc_get_cur_freq(pc, &freq);
+	xe_pm_runtime_put(dev_to_xe(dev));
 	if (ret)
 		return ret;
 
@@ -77,8 +91,13 @@ static ssize_t rp0_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 freq;
+
+	xe_pm_runtime_get(dev_to_xe(dev));
+	freq = xe_guc_pc_get_rp0_freq(pc);
+	xe_pm_runtime_put(dev_to_xe(dev));
 
-	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rp0_freq(pc));
+	return sysfs_emit(buf, "%d\n", freq);
 }
 static DEVICE_ATTR_RO(rp0_freq);
 
@@ -86,8 +105,13 @@ static ssize_t rpe_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 freq;
+
+	xe_pm_runtime_get(dev_to_xe(dev));
+	freq = xe_guc_pc_get_rpe_freq(pc);
+	xe_pm_runtime_put(dev_to_xe(dev));
 
-	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rpe_freq(pc));
+	return sysfs_emit(buf, "%d\n", freq);
 }
 static DEVICE_ATTR_RO(rpe_freq);
 
@@ -107,7 +131,9 @@ static ssize_t min_freq_show(struct device *dev,
 	u32 freq;
 	ssize_t ret;
 
+	xe_pm_runtime_get(dev_to_xe(dev));
 	ret = xe_guc_pc_get_min_freq(pc, &freq);
+	xe_pm_runtime_put(dev_to_xe(dev));
 	if (ret)
 		return ret;
 
@@ -125,7 +151,9 @@ static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
+	xe_pm_runtime_get(dev_to_xe(dev));
 	ret = xe_guc_pc_set_min_freq(pc, freq);
+	xe_pm_runtime_put(dev_to_xe(dev));
 	if (ret)
 		return ret;
 
@@ -140,7 +168,9 @@ static ssize_t max_freq_show(struct device *dev,
 	u32 freq;
 	ssize_t ret;
 
+	xe_pm_runtime_get(dev_to_xe(dev));
 	ret = xe_guc_pc_get_max_freq(pc, &freq);
+	xe_pm_runtime_put(dev_to_xe(dev));
 	if (ret)
 		return ret;
 
@@ -158,7 +188,9 @@ static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
+	xe_pm_runtime_get(dev_to_xe(dev));
 	ret = xe_guc_pc_set_max_freq(pc, freq);
+	xe_pm_runtime_put(dev_to_xe(dev));
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 9fcae65b6469..2984680de3f9 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -12,6 +12,7 @@
 #include "xe_guc_pc.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 
 /**
  * DOC: Xe GT Idle
@@ -40,6 +41,15 @@ static struct xe_guc_pc *gtidle_to_pc(struct xe_gt_idle *gtidle)
 	return &gtidle_to_gt(gtidle)->uc.guc.pc;
 }
 
+static struct xe_device *
+pc_to_xe(struct xe_guc_pc *pc)
+{
+	struct xe_guc *guc = container_of(pc, struct xe_guc, pc);
+	struct xe_gt *gt = container_of(guc, struct xe_gt, uc.guc);
+
+	return gt_to_xe(gt);
+}
+
 static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
 {
 	switch (state) {
@@ -86,8 +96,14 @@ static ssize_t name_show(struct device *dev,
 			 struct device_attribute *attr, char *buff)
 {
 	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
+	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
+	ssize_t ret;
+
+	xe_pm_runtime_get(pc_to_xe(pc));
+	ret = sysfs_emit(buff, "%s\n", gtidle->name);
+	xe_pm_runtime_put(pc_to_xe(pc));
 
-	return sysfs_emit(buff, "%s\n", gtidle->name);
+	return ret;
 }
 static DEVICE_ATTR_RO(name);
 
@@ -98,7 +114,9 @@ static ssize_t idle_status_show(struct device *dev,
 	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
 	enum xe_gt_idle_state state;
 
+	xe_pm_runtime_get(pc_to_xe(pc));
 	state = gtidle->idle_status(pc);
+	xe_pm_runtime_put(pc_to_xe(pc));
 
 	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
 }
@@ -111,7 +129,10 @@ static ssize_t idle_residency_ms_show(struct device *dev,
 	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
 	u64 residency;
 
+	xe_pm_runtime_get(pc_to_xe(pc));
 	residency = gtidle->idle_residency(pc);
+	xe_pm_runtime_put(pc_to_xe(pc));
+
 	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
 }
 static DEVICE_ATTR_RO(idle_residency_ms);
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
index 63d640591a52..9c33045ff1ef 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
@@ -11,6 +11,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_gt_throttle_sysfs.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 
 /**
  * DOC: Xe GT Throttle
@@ -38,10 +39,12 @@ static u32 read_perf_limit_reasons(struct xe_gt *gt)
 {
 	u32 reg;
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	if (xe_gt_is_media_type(gt))
 		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
 	else
 		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return reg;
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index 2345fb42fa39..9e23ca7f45ad 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -9,6 +9,7 @@
 
 #include "xe_gt.h"
 #include "xe_hw_engine_class_sysfs.h"
+#include "xe_pm.h"
 
 #define MAX_ENGINE_CLASS_NAME_LEN    16
 static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
@@ -513,6 +514,7 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, char *name
 		kobject_put(&keclass->base);
 		return NULL;
 	}
+	keclass->xe = xe;
 
 	err = drmm_add_action_or_reset(&xe->drm, kobj_xe_hw_engine_class_fini,
 				       &keclass->base);
@@ -567,9 +569,63 @@ static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
 	kfree(kobj);
 }
 
+#include "xe_pm.h"
+
+static inline struct xe_device *pdev_to_xe_device(struct pci_dev *pdev)
+{
+	return pci_get_drvdata(pdev);
+}
+
+static inline struct xe_device *to_xe_device(const struct drm_device *dev)
+{
+	return container_of(dev, struct xe_device, drm);
+}
+
+static ssize_t xe_hw_engine_class_sysfs_attr_show(struct kobject *kobj,
+						  struct attribute *attr,
+						  char *buf)
+{
+	struct xe_device *xe = kobj_to_xe(kobj);
+	struct kobj_attribute *kattr;
+	ssize_t ret = -EIO;
+
+	kattr = container_of(attr, struct kobj_attribute, attr);
+	if (kattr->show) {
+		xe_pm_runtime_get(xe);
+		ret = kattr->show(kobj, kattr, buf);
+		xe_pm_runtime_put(xe);
+	}
+
+	return ret;
+}
+
+static ssize_t xe_hw_engine_class_sysfs_attr_store(struct kobject *kobj,
+						   struct attribute *attr,
+						   const char *buf,
+						   size_t count)
+{
+	struct xe_device *xe = kobj_to_xe(kobj);
+	struct kobj_attribute *kattr;
+	ssize_t ret = -EIO;
+
+	kattr = container_of(attr, struct kobj_attribute, attr);
+	if (kattr->store) {
+		xe_pm_runtime_get(xe);
+		ret = kattr->store(kobj, kattr, buf, count);
+		xe_pm_runtime_put(xe);
+	}
+
+	return ret;
+}
+
+static const struct sysfs_ops xe_hw_engine_class_sysfs_ops = {
+	.show = xe_hw_engine_class_sysfs_attr_show,
+	.store = xe_hw_engine_class_sysfs_attr_store,
+};
+
 static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
 	.release = xe_hw_engine_sysfs_kobj_release,
-	.sysfs_ops = &kobj_sysfs_ops,
+	.sysfs_ops = &xe_hw_engine_class_sysfs_ops,
 };
 
 static void hw_engine_class_sysfs_fini(struct drm_device *drm, void *arg)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
index ec5ba673b314..28a0d7c909c0 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
@@ -26,6 +26,8 @@ struct kobj_eclass {
 	struct kobject base;
 	/** @eclass: A pointer to the hw engine class interface */
 	struct xe_hw_engine_class_intf *eclass;
+	/** @xe: A pointer to the xe device */
+	struct xe_device *xe;
 };
 
 static inline struct xe_hw_engine_class_intf *kobj_to_eclass(struct kobject *kobj)
@@ -33,4 +35,9 @@ static inline struct xe_hw_engine_class_intf *kobj_to_eclass(struct kobject *kob
 	return container_of(kobj, struct kobj_eclass, base)->eclass;
 }
 
+static inline struct xe_device *kobj_to_xe(struct kobject *kobj)
+{
+	return container_of(kobj, struct kobj_eclass, base)->xe;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 0662968d7bcb..237a0761d3ad 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -7,6 +7,7 @@
 #include <linux/sysfs.h>
 #include <drm/drm_managed.h>
 
+#include "xe_pm.h"
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 #include "xe_vram_freq.h"
-- 
2.43.2

