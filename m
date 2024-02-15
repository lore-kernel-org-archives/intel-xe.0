Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4C7C4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1B410E22C;
	Thu, 15 Feb 2024 19:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZD2sZ2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C389C10EA05
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 19:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708025701; x=1739561701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mam05fVA2kqtI88nVlewNeY+03bG4LaCW/Pj+VCI40E=;
 b=NZD2sZ2hyMi7nv1ZIDoCuwMhrpLQdVWwAptlJQVhAw0i0wnLp0ixHh/+
 ug7Rgt9+6nRg7RY4mnH59OHEIo6qoA7Td3HUmNmyQxnKE3CrlN+soABmQ
 ELQUgj1OiMmoq98DmablYxPz1Rh+W7TAZ/NpPNj4uABsu/3ilWx9lPM0N
 /ciOkHmJfXsqdos0+JTlPON97YmePA5umbrr9Tnmkizq2JTYh40AsN9eV
 CG4cPclBKF55nh9OykCzQSmRoNfbD93K9rpDhd0drDiwcI8TmPKfYTxO1
 rXpIqI5oi6HLy9TtagGLSlabL1m+aKZBPX8x36X+tA+vxsGVDemxdUJT2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="24601743"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="24601743"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:34:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3950920"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 11:34:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:34:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:34:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 11:34:57 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 11:34:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ct/VBEoG0fk3+PsYtLufUIfT7/vRLnhuOVBiSGOfAxC7y8TTnXEufHEK3AeHSUw9SAxc/ZsgY4Aedy2p7K5zWsik/2y9aOwigNZLviqrX+NpdK+2j4WOgYzXniOF1nFBN/s+IxZnM2laoa4T+D73+qiL4iQfAXpTxCYCr+XMpUDmKKgwhSxfvF8FmXjuKPPVvQ0zl5HmsmkTncgpYU6yrcS/hgm2LGE8aBZqqD70cfb2N63QXuNdE95dTvqlBmiTlkONrrPkq/f6Hh2W+ov8gx8OKj+j0LjZUS3pgdkkwKGJil3C6c0fiuqxBLhyxRXKjEkVVBGlF+HpzWIh5yVfGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Avws9/MGCR8683OiOgo06ql3p22vdsuFztSgCRU2u0w=;
 b=JneQG9qNV4/Kaw2uJFD2/JsAUtklJKdnwdo3izh7t/+8qPWUHjiF8snf3cK5ZhyqSjSeQWfwNmMbiqZ2dEr+/MgRpyrNhSoOOunTd2iMh/yGIbEnb8f7HpJP59RguIwtKizChdMP3jWftb4erxpUH+Fl/zbMxUY/XN90WfYIohTLoKk7J7dN9Qu7iVbDekalvMN6g0yLmLaTKR+on+rjXHLs8gZErGVH+gqS6vqblO+dccf3Vz+Wlzou7vixae0D+fnH6TUyFhCzZZR2083opsHgEQHp9KgteEb68s7OZJ60IhI9YjGjKAzgM/1QTflJRDEHyJOP6kTR9Vd4gaiPsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 19:34:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 19:34:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 05/14] drm/xe: Runtime PM wake on every sysfs call
Date: Thu, 15 Feb 2024 14:34:21 -0500
Message-ID: <20240215193430.130106-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215193430.130106-1-rodrigo.vivi@intel.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:40::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: d8488fec-06c8-42a6-976c-08dc2e5d2fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uStBsmHmeqrYgX2HbudsOlaj8XVwG69HoYxtFW2uxSr8Bi4PrffqXP+9cBF6YdrFTL3RhJdfTHRRbfb2LxYNC2XEMomQfdfomuvwjVnMa0JMPiHnwvty4KPbY5W2SDFX9g8nxN9aqocVQTE3j5VQcYokvjaDp+7SUkXzkKmsVBmIwRPj478vZsUvS67eWilnCoz1HsuO5KIULQWaD+qir8Cus+pGn/iBOsqOgqH4+MxU6C7pb4jsr6es+HmhmlKMQZsOfD+dlCY8NhNOe4e7dh2/wjGSomypHHNHYPd1mLEvWI4H5O4cLGMvbQLyDfKw3hSV+RcnCjUjAFcV7b/jkl8sfFM7RhGKGOQavVcpo+LT8nX0N5PWuC2G+iFjEtBnnJmU5N05K2trHBOQkg5FapQeYS4KJ+gQU5H2sxAeDtTl9xN9xzq21zniFmceApfgxE72qbspGCPjJ+PmTCQdRE3S2U/nKhtnAEhOjKskOEpBI/BQtBjoYwSs3U8Z4nTnPh7RwL3f+QgTHH8dql5tjQEMiy3yTE1/rLA7nIKFFY8LI4OXhUQfbMHwzdRAHMAS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(44832011)(36756003)(8936002)(6916009)(66476007)(38100700002)(4326008)(66556008)(30864003)(8676002)(66946007)(5660300002)(82960400001)(316002)(107886003)(41300700001)(83380400001)(1076003)(6506007)(86362001)(6486002)(6666004)(2616005)(26005)(54906003)(478600001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rvgb1nCctyR0ND2BacwShZrN0b9hs1SIVuBJA5X6TySB5iPzBwccfLY1bCCK?=
 =?us-ascii?Q?bF+M54NF6xqyAchjriISsKq0V8Hj4JZWsEjxbCYQeHrJ+v11qawvxNiiCKJs?=
 =?us-ascii?Q?jG+JMIKsd4ALeCtz+QbbjivcV1mN5lSswQjBisi830jfuAXYO6RZ+ejIZJ4x?=
 =?us-ascii?Q?sbqxS41JR+0HhTws6GRiFuK+gpcE5JdvvFCwETOc1WEaLRoXsQoXzupkh4KB?=
 =?us-ascii?Q?UrDSxh01P+5CBpa0hfv4aF6uhtti2yMCxZs4+xBZT1/xinK66ySizdrCuQmu?=
 =?us-ascii?Q?B8E/WmYs16dkdEdDY0s/e5zxtM2QTYYmpNcUIxSv3ULPMN3N9PVJp9I9DyEg?=
 =?us-ascii?Q?ez42ckPILM04WPtVayNmQEG8wggepvIMFvc3R6s4yaFAi0NbWDRHKBGA65XP?=
 =?us-ascii?Q?b+V/sHBvyWFjDQnB+5N6QCQBfRT1uaYYw4OkY8dBDYoLwUbrSNtcxkWwTbYH?=
 =?us-ascii?Q?GU7yycslsLsldhKouNgHpspjw8WpbZFmlCaPy8qp2BxLHE5MFOhsLL7bpegI?=
 =?us-ascii?Q?wiqXMXs8UByCMeYC56srOgKMWuUtZUdniaTzEVhryUMyyroQ1gaqY7CiW6yF?=
 =?us-ascii?Q?fbcIRffGcXeQAjJdvWeZ34zeJyhe0o+EoJXWgyDvpOjj/wYycduUiIQL+qpG?=
 =?us-ascii?Q?VCSvwZbnDAxbLfbP1orIUqwBGlemxR3BMG9Sr06Mr5/LjNfOE+GR7HYFMZls?=
 =?us-ascii?Q?uJpsXo8c8KJxsvYDYjlLC4npbgUD9c4oCN88JQFnkMQ+NuC4hWgAFsSLY8G/?=
 =?us-ascii?Q?C5eZTiDiYJPuz6WXCnLiqFseVVaA7aamlBoVvq8qJmX/QVlJ4HAdzc19xV5n?=
 =?us-ascii?Q?LgVA5Ucp/XhtMJGedP4JqboIGtqQTzoA4DS6XdWQzOiq4qzO9D/T9dSRkpii?=
 =?us-ascii?Q?6FrW5Usa82WzLTIaz8KFH/NSZjDrJL8AIVgaoqXwG3VpfXw3lCxRtq4cD7do?=
 =?us-ascii?Q?kg4WiJwrOK+DpSodtX1A/wSyqhu6HeoIt6WtVdfCU7YPoZPLcQUkMg7RE72S?=
 =?us-ascii?Q?15l5JTLw4wjuP1LLvhz1erG5j85DQPgM8/juxHMe14TA+mQKeGkUY3VVOIvi?=
 =?us-ascii?Q?c8f96OwaEpUJ0lJYkqsJjXdx/QN8fIMenkiklfGYnGeLC/685vq4+3mWTMEf?=
 =?us-ascii?Q?r62yfp4aVMVBiP2SrzXV5Nmraj+nS9c1OyDrIYyWHvRu0xHZ83oGl1H3p2dc?=
 =?us-ascii?Q?bVMCaR8Ay110FEb3dGnbqLzSAvKqbNvwaouZvo/DgrlFuvmoOwHhD7ej5jjY?=
 =?us-ascii?Q?bbqBeLiXMXfDP1U0P4OfwcvDlfBd5/Po8+kCrjjaX2qfx/nKsMgURoyQbugX?=
 =?us-ascii?Q?ZuMtOtADWSd9nHRAbFzhveppHF6qFhN87ES/xdbb+lNiMuziQrAu/hKcFVCZ?=
 =?us-ascii?Q?PT24MxogAVxsTKK+5llJljBAhfxtIuAT3uDey7Z23u7Wwmjv2GzspLyZ2jdK?=
 =?us-ascii?Q?FZWNXExSNH0QWCOToL039eMJ1q1dxoXHqZ8B1bsxqJwqkxfNuVDcSrCuv/Ig?=
 =?us-ascii?Q?uMPhBnTDaBv2xpKm8RDPpogxYgiyVadPbvksXRY+ZRJGRjfLYTIFBhVwKVpj?=
 =?us-ascii?Q?PSHSXl3S42lLnD1Qd9dwEnVoJGmDEJ6+98fNp8qhlrGkahgHD3PWuacjCeVn?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8488fec-06c8-42a6-976c-08dc2e5d2fc7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:34:55.0884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iwzu7VwBAXBXHYjUHX3o4/CS2wY5ansaYGi83UAaUXAL6Dd2cXdwbFQ9fJcGexcDSrzL69kcqHiKp1sFkpGEGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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
index 9358f7336889..824ff458011f 100644
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
2.43.0

