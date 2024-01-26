Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537CAC47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D9710FE5F;
	Fri, 26 Jan 2024 20:31:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D9110FE63
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301085; x=1737837085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zWtIn1su+H1e4Gr31dB72dF3V9ED7nyW848su9E22KA=;
 b=bnK+wkmP7tnuJk5RgTNcWBoDTZvbvfXcMMsw/LUr35pwGwVeXnQZ4dl+
 Emmb0BFlotMtk52BjY62M8WENHwo1dVrx1DWkGyVP2O+6KEfNwl7jTAty
 gdIJPOebU+PaonhfUMGdKIgI1sqCiBNUgjXiBSGJ9E85/GYEGus2CDMmJ
 2hjkUIB6MIUEX3biinbuWb1u3ULaGaL41uGGmQpuhp0SGRGWTLhZTjIxn
 MVIVZoU54C0pqzowrVQ5oiWfUHalbEc+0kvEwhnYKXsUjPweMleOyxuOA
 NIYLgSxuJ5HELkylP5+UdklALIjxugP9Nu15kd2I0j6FBo9Snp8I2xLry w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948460"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948460"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877481931"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877481931"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:25 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:24 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:24 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:24 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaaIWAJJGhT/sz7nliOyrR1vuPpOQww/UuQ6Y0pFwKPE7yOsK98D0HwUEPqxES2izweU7GJF+aI16bJDcniHjp84+pCum/8d94bHOdqvTdBQV1tXwTSaC3Tnrk3wG8of9aU+sP57ouVSYMLtiHKq14dgpq15lXKZoE8m+bX+sqFm0DvXRONU6tIg38mXBSZ3p6Ae6nM3QejFLWnVWVSRz9dN+9hfdigxJplVPyrdpPb50S3Pc5QhHiE+yZ4j79gywuyVoRIDd6C1FQMK6L6KnxkqVxA2+uZfD/lpjKDpUky/Mc+jsjnhcV5eIvHSr5CYSonPuH/F1Ya6Kf2pVJMc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf3flOPbnmeSXd+I6ADpNPwzUaDbkPPWOfBnky+y/h4=;
 b=Q280PPoTyTl5XjKo1e+S5HGvLUwhtYMcDIPzqBPFGoSbJjP/PBv6+Oq4xQOra9CYxsM2wJkWHhZgpML8nSB3+RiYwZ2LkJ69rAG2qwvbJgToORTlDQasrjsAU3DPBCFeeiDxVxmMXpeESUc7H+PUSyNPk9rq6moN782An1YlV1BrgiMiFy5sQp8/X32TDo4Cu9iTwyE3/xCEKW8pAbF8Aoe+zvTvfquPreIh/s1UbLRjrNy2+oMxR13M+ywxohNb/9azyyGH9fDwWHVoMckl3vEjoBNGLGxxjGcCM8qsdyhSh4ieWotW2v2gRCCIYTsnp1+A4p00HTTyYWpZ90D3yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 20:31:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 11/34] drm/xe: Runtime PM wake on every sysfs call
Date: Fri, 26 Jan 2024 15:30:20 -0500
Message-ID: <20240126203044.1104705-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0138.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 717f86b4-5128-46c4-627d-08dc1eadc1b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cVhMQl0EWZoL+J6cfhJT14ygZ1iQtlASTjhgEi9lLuclrzNemljIhIkKOBnuzKImkxbrioHfC7RaM87XhREUr+AuhZYG1LnhbRm0G5LNT6aePCshZsdVMSyQUMiJIk0IVzGkbJuRZKPTjfuOtXdIDzN/X5KRWnx03UWcA4JMYmhQhzJYYmBfj+FYxQ76ynVtknt7Y9dtRu86WZNZBHVM7f7EwWs70oqhFAw+noqnVk9PApQBdO4PXrqXRF2HWyByItLHW8+XgdhibGGyb8yy3KtlqpX3l52Nv78LJlFvdRBDrEMjKTVPQs+JU7zrx1xRdDh4Yb4BR6ckGwBO0dfs+bm2bsTfGNYg9VURISeYPPMkGbimD+KaOHTKt6BDbKC8UI7Dsw52Q+fap2rabWiEqMPLIac858ZHHUoM/zPHN778Wd/6WTGD8e/obA6NsZu/4kMDUG1SYnY4Z0z81PcTOhbETGTtlBuySRrBKQhZIMUl/QD+ZkgW0v+4lVESdcDYLVVXp7aVHbLKhhpp/B0w2BoOOO+18G2a0onxeNaXAXwYI34AXLhwlYoRoVegm+xo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(82960400001)(41300700001)(6486002)(478600001)(26005)(44832011)(2616005)(83380400001)(6512007)(6506007)(316002)(2906002)(4326008)(36756003)(8676002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(86362001)(30864003)(107886003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RVRsR9R0EJvBNBJh8S+RgK4HYJGzhjE5Ztt2qIXaP0DqZfCcGWjFCtoVVVxk?=
 =?us-ascii?Q?sN97qWIL6qiH9u9vndvQ5dsqfAIvxK3Q7ZofrCyU4VOhJcRhriO8MXcR62y9?=
 =?us-ascii?Q?aMicE0pyWaPIV0bVqSc6UtAPa3P5Or/maRmcch0crtHNCB0CvqG7Z1o0SXxs?=
 =?us-ascii?Q?jkv11RdeP241HsEIaktjn71UmCVzgMlwg3GCp/e4U9A23hYnII2H2wQckC83?=
 =?us-ascii?Q?Xxb1ZjUnxaEk6YOmN5T+JfcSPPQ2RHHTFzszxRTeWrtcvctLxZn81J1Jox54?=
 =?us-ascii?Q?YTb6+LjGILHh1vR/7ETyROlngfvk0kczylXGGP+cxV+sWr74NtHtDM/NVAz8?=
 =?us-ascii?Q?LKnQcQ9/GTsvxCON2Txh07pwUPUs2EKm903Kp4WF0iRQLvbbVY3ly3G+WJ5V?=
 =?us-ascii?Q?ZYsSDKXTL3OEnRjdz+iw0t4hVu0mdsUUWTP25wFNBl9FtjzM8619zM5p1PYp?=
 =?us-ascii?Q?M3z2qIExByvr69un8iFyu8/84wfhnX1KyPot7FEsJXpO6P1GdQcKewq2f4Mc?=
 =?us-ascii?Q?/pSn0yfJ9VLyLfdfD1km0JqcN0C0p1+Ezt2Q+ynU6XufEdQgHDdoIDib5ClU?=
 =?us-ascii?Q?Ubw6dy6Fnud+4Da4ZncVlj2GRq+xz4o1NH+nv9pInXCpFya+W187MYyA/+ON?=
 =?us-ascii?Q?Gu51D2vAeK++bwjpBAlXkmQpa7qo1Oy8J1POGaxmKPumz6uEAUAenHOYN4TN?=
 =?us-ascii?Q?VHyfAhvJE9ygewhNoWSkZfueWPlyVcWvtb+DhTiJMzA/Tv8HyWL/ykKpxrz0?=
 =?us-ascii?Q?be2CoWYOsnK00BM7TOhNf2vZyzDDFFgbfUxhi6H0m/O96PGgYrf1rA4nINZC?=
 =?us-ascii?Q?FxQBnKoxVINg2FpV1pkjji7H6vG5AVw/zAXRrB1uSRgqTRRhzjGcfExn4s80?=
 =?us-ascii?Q?oy8Klj8cd+7OzNfP8n1rhaL7hJk2TbM03Jn3nOuEx0gDP2LgJKLCq5bFuEO7?=
 =?us-ascii?Q?2s45hYcjDlD8le1run7OZWdZXZOLEloRJufjkCzII65JjfqXMm39mBVJhQ82?=
 =?us-ascii?Q?P/6JyIH/HzdSAluIf51QwtCm1AKstdhJhBbMJ1JN2SB0hHuP/hMAfT9xu/7t?=
 =?us-ascii?Q?Xj0ndjBF381oqj23yF/3bVoWgBHSpkpbo1cSMfppO4PADP+I4TPFHDdaQc77?=
 =?us-ascii?Q?6IF4quNWAAUkGDpAigx2k4Ts/IxX94vyOfok94l3Egp6mAkBI556jIY/9nMO?=
 =?us-ascii?Q?QNFp2DT6/wXyMO+xJUZkDev4H2MtddbvBbvMT0VaFKkTP+HdVttS60yiXmFT?=
 =?us-ascii?Q?6ttZOg2weW0w0NWZWUxi0H7ETtHSh1IqsYqmxBQuiTJ6NpKDp6wfVXejqPdG?=
 =?us-ascii?Q?E/wmeGgEWhfxLZ0UfHR2qU+JUXX8fXlrTIXkD+mjeQOCRb5ZN/ad1eFP4aEL?=
 =?us-ascii?Q?V8KLvzmKBUMgWhBN3iq/QgKKM5mjOpScD5DuvqymW5iIappSugXP3B4nVOUx?=
 =?us-ascii?Q?WdMgkMPEFYwRbbCGgI5wTE22RW/mHNHpnEWSWOBjlBN3iZhO8la7Mw5jsBIA?=
 =?us-ascii?Q?va+vq5q6LaHKASkkjpsHV02QBC+oH5dpABhpgQn5nK3iPjv3VnJ0ZCVpdbHV?=
 =?us-ascii?Q?KaelpxR/roZev2leJc8WS4tb1w9Vc0qD7mFHy7LlgicB5GFE0ipkmTW2Lauu?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 717f86b4-5128-46c4-627d-08dc1eadc1b2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:21.0482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nr9bFVLQpQ1H7pMjLT15sNxXeY9O1g7mdnmcE4E/5afyhwdICDJep1oeqnMCXauMF/1aCC5M9ofIxOt7Oi8JIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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

