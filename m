Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E183CC47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C5910FE5A;
	Fri, 26 Jan 2024 20:31:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68C910FE5A
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301114; x=1737837114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1ndQw0ggPowPXxl/9JEvMJz2hLV/tjAnI3DsgCVR20c=;
 b=Jy4HQk2IT4SAFWFDD+0xZDjZpamkNv+FjGlc4GAcNrDGRjKfWYQWaFUf
 y4rl8CcbCpXxo30O4QgtY4/l+4w6uFjGkCJZjsfgoHKyEYzhVGmC3czQy
 V6gIc76mZFNO2wHj629Qas4FUv6KLE7LXdfTConQaOvT4y5Ve1L/kRnkv
 HNloS+psA3gajVXK5NSdTI+qFxGWmAOPiOIr0FYV8zWe6ksagIbXkJ2PO
 lrU3LHm2jkuYXTC603eNzh7nPFreXpam7qNHXvF9zbTxc5n6DKEWNKuiW
 xjiOOtjUMmO0Ikt+xEGZ9LzX/SdxIBcHEYsHNzil+f2eK+YGFMfdP8yZd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2406263"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2406263"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="930456259"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="930456259"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:53 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:53 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:53 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6HuynhZq4qmJNvk+zlCAeRJQxe/GcPbCqowK4H4X+UDzri1a6gzq2N53ztMfp8Eapi5YJhTPjJMl3z69lZ9Q2VTw9gvLmAd38I7WXASEplu61F/hZ88Yqc6ZedmEFUr8IBS0WhbJhTWe6suLhnpx2H7bjIfp0DLlI10NalRSfPXzuB5qHd++6eKlJFbMOg4j6lySWDKHCtvMTixjhQRmGyPlkqpPs7nCC7t0oEig9GcD4Echo9mvWBnNeG3d68hCSXAXqwhd8pIev1fuadg0MRlXNbh6xSzzdkXZkmK9MJdmQ+TmwuNI3Q2xWFi1we8KOmsLnghFF9qDJID6nUHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg0CydN3lt6rv8oUyM6J0UnWEhN1C+4/hxUEUYdqWF8=;
 b=PCcVMY5NscbIHO0ZDGNB4JW9Sciu9lNFc4ES1+BTqP4opGNfQfoRw8n3ilyyGTqaLOBzXqiWw3vbN+dpkdr019xnHJQODbTckkh7XX5u4xznjEGr2ve6mXsB7z130yb6PsrvMrN34iraU75fShRZk5XiIFFf6M+d1MJ3NpR+BlwM85wLvpMwT9jx8UYjJOKmpYjiN+ABNFh5v/JuGnTtA2WMzi87MqbmpptjrvGU1Clw8izo6sTkSJwjvqPCRfWvM+DoSzfsHRLQ2D/rGJkyxYJ5D2xxdb1NoTrkwvmLpBuzyht4FPGpPOf/5rbQ8efdMR01MV5KRRAqbRloCYWsNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 20:31:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 17/34] drm/xe: Convert hwmon from mem_access to xe_pm_runtime
 calls
Date: Fri, 26 Jan 2024 15:30:26 -0500
Message-ID: <20240126203044.1104705-18-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:a03:60::46) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fca33a9-e879-4128-ce30-08dc1eadcd7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OoHvD8oXHQCmr9TjbjIJgR5kKr1UDIeqg1sxQV7g7NbYzNs71P90yrQcRR9JS0Tc+Iz4QTmefCNqJhVUXsOFZxPSYNb5lGLpuwmh4G8MffW7ois7anNTOiNoyej+gfivcrppJ6fxqQYSCkDIHJeZRcyQ3jAbC/hrftVKZdFWxxUTtjCRPyNMzea/eYaUE8Zplzv54q7anuT2WBmVIkpeV6ok46oKakJQENe/QJtbAAmSoO7u52QVeDkug/rZmb6cNtKa91GEUM5f5oWAqy/S9iMrZiYV+g7Soea4nZKWdTO9FKRMvC4mQ4UEE5QB5ZTqVSm4AVpnN6gvNJ6JbB22yuJpsKS48kEF7yHN9wlC8MxlytT1yy8XqA6kX992n4aZYY2ytTh778ECjgAm9eTaa1Xl6vhob9/6dX+F6tQfJIX7makbdZ6A3Bfy8vvrMOfQuR98ZuKE52Ng3y3bBlLOis5LYOpqt5u9c3+dh108jknIrXXF7zQ4azEjJ2WSSKEQkXQG2O2haFcNUP82gtXiZe4G/yuB0vAT3ri/el9pSk/+HEMr7PD57G/+8DIwcqzO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(82960400001)(6666004)(41300700001)(6486002)(478600001)(26005)(44832011)(2616005)(83380400001)(6512007)(6506007)(316002)(2906002)(4326008)(36756003)(8676002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(86362001)(107886003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oLxue2RCZyIqnyzoVvsGGjWOAsDv1m8A9XerX63W7jxd6CGHTQq3dyW6ojYK?=
 =?us-ascii?Q?HXnDmr/WoYSnzaqJdk7ItnIcDJw6Xa10ZEsRGC3RsYHGCNXrK9fm40POAYR5?=
 =?us-ascii?Q?jFzADEt5d7UYX6jNIXvFT/QtM6jpfax2eKE9v2qOqTSUBBgZ1VEY8+SLdMSo?=
 =?us-ascii?Q?Mtb4Xs62YJcQwkwAiWXNRHIOAwy54XNR2UXpdw47GOlCLyL2HVV8F5OjIAsr?=
 =?us-ascii?Q?XWDVrIXP+IC6V0igSXLJacJVlxPedOadZCFyQ7XlKf9iIZYnUlOaXsE1yfOC?=
 =?us-ascii?Q?1iIZIyN7HjAoOIGLePWzgMOvjK9dHz0BF/vxy5VFEKKqGlphQkplG26VOBn/?=
 =?us-ascii?Q?Qx6QYcqdJaYciGaOGEfKX1zppuKYReN0ieUywDLMxvREKzd4Xzgo40VIntIZ?=
 =?us-ascii?Q?UQMMGokpEhA4W9G6bRPVGBM8tmjmcU1g+FxWb5u4ikXLO7mWbr5wXPsAtyy/?=
 =?us-ascii?Q?KUBox1QYwMe5J/P71h48/CdXw3uWWOqrvTfLyPx064BCDHLa0hbnJFZpEg1J?=
 =?us-ascii?Q?tVQ5qsGO3PRTnaHS7TUBOXdhOYIw7VXQVLtbYHSlPa5ZOAEEQI3MOOCAS453?=
 =?us-ascii?Q?zn5Qwrhu2IIJCiV+73+z5qhop+COeN1brsgA85xYe/jaTp1cT5AttzxCSjb/?=
 =?us-ascii?Q?ea4II49SmdNZvH1q0qqIVCyw4pE0oX2zgiLrt+MkrhiDeKbbkUinMYKTpSSL?=
 =?us-ascii?Q?iLoS9VAl6HgXN/f4FblneVEWBb5Bv8k9Pw0eKebMP8ybME38q2TH86QzpsON?=
 =?us-ascii?Q?AVuYwYBPGTpbIOHZGmuXpBt4UbkSAnplmkuZ6jsT3f3CHD3Wzw6TlGEi25CE?=
 =?us-ascii?Q?YfhZn0O23Y2T81E/FsqtqHgKpN8mMv84dk1XKvFfli+2Tys0CmuslN+WiIM4?=
 =?us-ascii?Q?S82/aOGGlTrnfmzgJeCoH5PgQeGk/kkcQPRP/61aPRaTzkqCuYVSCMtVBI8+?=
 =?us-ascii?Q?wxrxXQIJw5djnyN1But5jhEQX75z2KGIqylvdzpLrY0ldfU7CVCPejr65sAs?=
 =?us-ascii?Q?ZLmMLG2Kedmny1eUH/Wz/cgfMFFvpx+Uztmf+nmkTXNag+idk60W4PI+Fiyj?=
 =?us-ascii?Q?Eo5oDSCwEDT5ta73oiZKU/wczp0VKqMzt5+6I+11cu6weUVfbJfSxSq4rq4r?=
 =?us-ascii?Q?t3dUwGycMDYj5LesIIDSgf4qt2EqfmcaF7xF7DrBi1qUoy+N/YZK1OUDjZ9p?=
 =?us-ascii?Q?cL2VH3vttfi2XF7ZWxETmTHS/JYHTo/CddMkpmR6Mo2tmXwjpKJeXSDVlwYp?=
 =?us-ascii?Q?ai0hDKexltQJYGct+kC6dASnaVoLz0n4u+1P7jWI7f0jHyXDMb2VIELj/fbX?=
 =?us-ascii?Q?idFM34Gi56SmRKLa0YBGj3xN07Sm0bg3GKYjIJIX1NimdnKa5wB8nYANxEiT?=
 =?us-ascii?Q?TLMcgbMRFassBfQhuR5wjK0S6BjOdE/zI1P+DuUWUNsiXO65PKKLjj/18ra9?=
 =?us-ascii?Q?ttlIBblivKh96xXjtAD4RN0qLWlY52GWsMsVVEL+ef/YAqp/11TYQSCTaeGC?=
 =?us-ascii?Q?tm6xVIIKf4G/T45YoZFpeV+PTZCLUg4SM1bcxLM0eGypSapAOBvNDZ6QyCgo?=
 =?us-ascii?Q?QbVNAXpmbcWbAkY3oG4+Z0rm7s1+SGwc+wLtyiY4lLFWDSjc3bP197oRTjMF?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fca33a9-e879-4128-ce30-08dc1eadcd7c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:40.8167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqGwGoHQIJMZdId1Cn8kBAgc6mMfHBBjHHgWwY7Y7woJM1Mp+i48f7BKLMLBCNYILoUlk+bd39V2GEKYyaBMLw==
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

Continue the work to kill the mem_access in favor of a pure runtime pm.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 89c6f7f84b5a..bcb96469b81a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -16,6 +16,7 @@
 #include "xe_mmio.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
+#include "xe_pm.h"
 
 enum xe_hwmon_reg {
 	REG_PKG_RAPL_LIMIT,
@@ -264,7 +265,7 @@ xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *a
 	u32 x, y, x_w = 2; /* 2 bits */
 	u64 r, tau4, out;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	mutex_lock(&hwmon->hwmon_lock);
 
@@ -273,7 +274,7 @@ xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *a
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
 	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
@@ -352,7 +353,7 @@ xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *
 
 	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	mutex_lock(&hwmon->hwmon_lock);
 
@@ -361,7 +362,7 @@ xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	return count;
 }
@@ -382,12 +383,12 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret = 0;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
 		ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? attr->mode : 0;
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	return ret;
 }
@@ -608,7 +609,7 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
 	int ret;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	switch (type) {
 	case hwmon_power:
@@ -628,7 +629,7 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		break;
 	}
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	return ret;
 }
@@ -640,7 +641,7 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	switch (type) {
 	case hwmon_power:
@@ -660,7 +661,7 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		break;
 	}
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	return ret;
 }
@@ -672,7 +673,7 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	switch (type) {
 	case hwmon_power:
@@ -686,7 +687,7 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		break;
 	}
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	return ret;
 }
-- 
2.43.0

