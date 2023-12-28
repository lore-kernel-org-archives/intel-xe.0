Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427BEC46CD4
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D6410E256;
	Thu, 28 Dec 2023 02:13:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE39B10E256
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729590; x=1735265590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xM5nT4dzgYPMkgD8qI7dcw5wFIcDYHGjOChvT9k/VZQ=;
 b=RpXvqKGUYd0jDkBnTdA6T/25ZLWJGjCCXTwjQo2M3rvnZtRFj1h3DpJq
 64HSvQ/ai4ji6RNg6X1PKvyYChPx46njfxGLCsHTDs4ADyS4H2UVodJTW
 TCz228yNFMhd24yjVYD93bmOv/DVwbZfykYmC0HohUwLU1Ehccd2lwEwF
 rlt1Cx3Ex422TzGVyH8dG+A6fy0ffwnw7vEntMkvyEFRXUgabV9JOHd8L
 ua8jQk/0WZMJP7qCR8AOwHynn99gHc3cwapKR2mLA8c+B/WVc2mWqMw9w
 mL3gArrN8MiHzMFmALww/KL8DGhyxb5PJtZVYz/ZsDmlu7PQiLK/RWgsc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="460830262"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="460830262"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:13:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="20451661"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:13:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:13:10 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYbZeaQACDF4p62ZVwKLEfaI8IgaJAVFCvvWvZnTLEOAUwJJucEkT8RZhGy1kUWBa/3sLr5B/6iyCsIvNawjWWi9tu9+hmQR0XM/fAVsW4BJzeKBM4b6j0nYrFjqZmwGPQ3G++DV2vRpqUR3GFzhyJ8YN1FvDfN9dyMoXJr0jVis8EMOKKmhBs8je4YkgxiyWKSoFitw+PKPc4fwMQRO1AJ06oIiNohHbhEQhfGT8ordjlnPpzAg9LOIGWUccyAvUPEVduOlijw+249mcWxCyTVcXXJH1J51tCTz8iyz6zlniRcruHvEDWp7kN8IpoIvlUI7+6go+KWruHzNh1bMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gShc0BUNZUhqUuYF4JSUgTb7DWBWX74qI7j+oav9g8=;
 b=QvFRVe+VamdG74GXQeItw7h1QsEIm6HxSOkG6CgQ8GAniZqE3h1Tij0TsoxFEuBqqG2Ogr+qBFIqJd2wR9KXJhjO0m2svbi7Y8RldwTVPmG9QDwbeUW/KkWdLmiJYa2gphgHSyl1YKp0iArjWXmNHud2Ypil/FC7r1AWzuRC6/sLgBJ4lcp8sLiELNZEAuhpea2GASQ8K6r51oP2KbL8ZO0YkUtEOTRyE2Nn/NWgoiWBz6UmcoMh/EELp7gJB+E5UM/301/eJRJ45kZQxvO/mtPai7pw+RrK8KJ0KyEnOK6agwFTzBCGgO3uIwMjLWBbVkh76N4eRrUZdOvlNfmPIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:13:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:13:08 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 09/20] drm/xe: Runtime PM wake on every sysfs call
Date: Wed, 27 Dec 2023 21:12:21 -0500
Message-ID: <20231228021232.2366249-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:a03:338::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dce3afe-fdd1-45c9-b2f5-08dc074a888b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JQ3BoIlzyisFAAGun6NjZL7plp83wJNAMXXOrDGZbFjZj3sdL9exdXwi58pQKzaqIKVYWBg+TtP5P0ruQpYRZkMnLWsMdBMEmyLJOMhv6dZF6nHd9qBRYSjgc4rQYuVsjL1bo6CIzGcRYUNEncKghSvCZK4fkq3Qd29OMlbXBArAAb8u1sA9fJpSdSOE+/drmSvVX0/sCE/plA/ClohpkPM5dvUYCSdgZq2fNN4rpT227cQJmGklF+DvHKuGSI5X4N0mBZiIgl4AWvIjpbdXPGa2b4D5e/RHEAZyzZiah3isAPm1jHlUKFM1TNNZrcFbRTnaed3QjazC8Zix/FNegw4YgkKrR5oceBAwc1CyskyTTm4Y2m9cj/Sor2xJo+HaWlCWbI4UUzOuvcwoJsD/nZSix46Ejo8okCzcuBcfoJ2aERnUzkDUoO67ICjgGB2MpD5hGhhEccheQdHP+YPsj6bAmb4NdItVLeyy4Jhqhv7pw2APuzYuMppHZCy9rc7fNbxTMr+Ujg7fMYFShyRO7Glf7st/fx/8EhQJCFiARvkhdOqeyhmS96SJfgqiiZA4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(30864003)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(6666004)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qW/wt8MZIeA21Izw4XMX8Elh65vMALK1F59nk2q4KCM4Zd/BJPWbDgipseiB?=
 =?us-ascii?Q?RFD65A+JYsUGFJeEGutzYEIeYLsmywAkU3R7VPkaJlGklXkm5bMI9XgWhGAU?=
 =?us-ascii?Q?JNjtkmC+UEreaVf6fJ9j062JMebpWnLt0H983QF6D/H1bh696PhBsWKy01gL?=
 =?us-ascii?Q?0NsxzLCaFCLd6W0aMmrR2o+wjZQkWdt3bI/FX4NFwV7BVus/pLz/qF4ogNSt?=
 =?us-ascii?Q?fF4KzJ+QFFz69RieeKJDawbcFd83gyAoN/Q9Sqx2GoluFiMuaa/9LC5/q2ll?=
 =?us-ascii?Q?iV29gepz8VGA/9Pf9m4PjqvuTc7Og4Q/oCXSXxQKi3vkRmNd2A/LvAYtRwq5?=
 =?us-ascii?Q?HUuZcYWr7EEyDgbI1Ne1Rt5jw1LAg+Q3e0Tsaly65YQi4XbpxLqE4LfH74Z1?=
 =?us-ascii?Q?0SP18WDblGCJIz3pGpeWu0uDmSvSs9FYhQ9AOQPte1tJC8lW6H5Dh0ciFVkj?=
 =?us-ascii?Q?x9dQ5gd3ple1cymi6MHVXNF/FpNN4Rzkwkoz9VZXEbLbGQUEi2YMRO9aY3pN?=
 =?us-ascii?Q?CWDtnnKQwQKZaG6g7pe9U3aMqxhvFxCLaBHbPy8yml0vss6qpC4XN+HY4NfL?=
 =?us-ascii?Q?/iPj0YDPQoUkT8DzaqsOqnmAYV7e1QSxXaGPq69/a6946+ldO2bDG98M6xrb?=
 =?us-ascii?Q?FN1D16LemI2UMO0gSE+OCQnKBVWNi/iUYGuc3F/L4CjlvQifcL/WCyb4QrOU?=
 =?us-ascii?Q?3tPYiMPdPer79sKBKe6Jc0DgVAKSApcMJIS3crny4p9AfaQjhjbryq1O0489?=
 =?us-ascii?Q?gqwM7ZrBcxWCLx5N70uNZIORlpDBvRl0RSaFO/jOaG04U5XynwDJlL9gki0x?=
 =?us-ascii?Q?sBxTbJfMjMqT5XrIaM4xmoK2zarABI3mFPauTMwuGRJsfblxYrv8+JALCxoP?=
 =?us-ascii?Q?/5L7b6KBnQVJg5NZApwNcSNk/dgryIY14QQNLyAFgcgX7w7g619W3dPtS+gX?=
 =?us-ascii?Q?S8SGrKv460dFMNovzppyUswzwH4TOm6hYlxxWOm+rSCXZiKLl1sOOs7OmX0W?=
 =?us-ascii?Q?u87C/BCUfGVmHjGcfl70o2woOfXsT3YreCUK84a++M2liLYHw98RcTiPqXoX?=
 =?us-ascii?Q?yNZB+IOz0VHim9rJRTTw2fxH8gX4y5yifr95LSmL58bMLbVrrSGCP/G+1aGB?=
 =?us-ascii?Q?vTxeALTmIocvRDKduJTxpJhJS8Zaey11cr8mZLs/jS0y10Dp2F2Lfbe7rHo8?=
 =?us-ascii?Q?sQnwkjAx7mxm+gZqOQ8po9NQ4yIJzi2uBRa2cX2kyaTpBbeGx9laj718scgj?=
 =?us-ascii?Q?/UQl6gEmQ5BiUQGndlGua0CjKwlxz49Pqet8cKyyajGWArlnm0/ZFn6xozkT?=
 =?us-ascii?Q?1lMZjHY3YteVy+taTTNsOFCzWS+fYiA4G/YivF0074TNbyyOfMLL5pFhvHQt?=
 =?us-ascii?Q?57U18orDsclrsCMm0wvBbXWEiLho7XldRLAp9k0cSVLSUEvZMS7R1vxOxooB?=
 =?us-ascii?Q?xJtbuz3mNeSXhZxH/eB21L6Jm4AFKVcAEWetKjlFZAVV2uTv0APbLYCHXjhY?=
 =?us-ascii?Q?XvBXylQlNlYt+MiWFnjj62aU35PzSdAmHw4wB12mxBQwzu29QaOTR2x4FK9r?=
 =?us-ascii?Q?sVsH5sdLqJKmUTUBZwSKlPnGVi1dj5eOSFpIKSRPdBEqD5I8QAAHrNi80NUw?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dce3afe-fdd1-45c9-b2f5-08dc074a888b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:13:08.1429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXb6ndzi7NRM21supFuQk38mz/GvuCroeVQxBALTJ/UcyU3xfHLrbgGcGqvGOOrKG8sGi8MBoQ9BeFfMdoQzag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let's ensure our PCI device is awaken on every sysfs call.
Let's increase the runtime_pm protection and start moving
that to the outer bounds.

For now, for the files with small number of attr functions,
let's only call the runtime pm functions directly.
For the hw_engines entries with many files, let's add
the sysfs_ops wrapper.

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
index 99113a5a2b849..e47c8ad1bb17a 100644
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
index 3adfa6686e7cf..2f1f7afb55345 100644
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
index 9358f73368896..824ff458011fd 100644
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
index 63d640591a527..9c33045ff1ef4 100644
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
index e49bc14f0ecf0..756ec3320b697 100644
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
+static inline struct xe_device *to_xe_device(const struct drm_device *dev)
+{
+	return container_of(dev, struct xe_device, drm);
+}
+
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
index ec5ba673b314b..28a0d7c909c01 100644
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
index 0f8d3e7fce46a..5b55d1801c1e0 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -9,6 +9,7 @@
 
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
+#include "xe_pm.h"
 
 static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
 {
-- 
2.43.0

