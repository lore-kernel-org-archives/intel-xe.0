Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0537DEB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 22:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EE110E1C9;
	Tue, 25 Jul 2023 22:12:19 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E853110E1C9
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 22:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690323137; x=1721859137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=oksh2j/2MXZrHdAnfB2CVqjg9jJf4pjPwQgGSxN2D2c=;
 b=e8CrkcycxaXCnTOvuwuyjUMXY+ErjFKLcmDmI9nJOmXk28mAe27GEOzf
 51Razoq8wOinbFeL0M8yZPtOBGicVIiE6BapAByyZyT5gziu7CJGfRzD5
 JzQm9BacnyLvLhojaloBsnO22C0qo44zzQnHcQoTrvAW+qjs44if26Hdi
 1Y8zQilBdsCTARKN+lVR8Ps3j3+gwxsQVHUsaP7FUH0yXao8ZHpeE596s
 6413MURdTjKIQNb/+ApnoX2SoSjK8GV3fxq/N2mlk4l/q4272ousLvCdv
 JMPm0umhpnuvI5dpL6hUdS83Z/HSueiX+MHGWNIujxkRe0lI5cRZlTnZF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398775356"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="398775356"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 15:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729552586"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="729552586"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2023 15:12:15 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:12:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 15:12:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 15:12:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YG46C9uX+vemRWsyPCVsz7ic1/ClL1WNQYKknEhReGpwcJAQrCVadQpl6gwHg9bvWbrbc0qoYYtV3D1ob5YzB/omoBVnR+t+3wfZrpdSmz3gNkTRnW81OjuO93axEJE4VJ694rUIHeDwgLMfJhraTx5aLPPLf5STPGdUCPwMZnej27jkDhaIYVheD3Fap3XoweM2m32jJgL9A6g82Tg04w9paU15H421+Skr+9+9BYP+EK3Sth3UXTPSiOBo739Z5jKVAc+waPYR2TQMm9X9+9uOPeKwv5Og2yVUI8RLT6/UutAf2Pbibhq1nbnQ8Tv+U5hZgIvO3A3gZ9w+aGWHpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IQlGr3/X+FzXoQL4m3IreO0VXuzUT+yaqxuh0sDTLE=;
 b=BNL8apFEjhvHJkNzpwFNzPdMt+tcEi5Lso8rEpcynS4kxh5vBI+ly2LzUvCOC6d4PrFA+0oxzVYWHfMO+fBwoPIf0uHyK3zV/hFHKnDlB4BKK9nMsERYm/C+g/8xyFjowhZjARkfJzxEmAQuxLFX9ZRHSZfzojcnmwaK9mln0jWxmRk47HHncVsGKH/5Z4wzS2lmDHcMR8L0TqUI8f7d36fh2kXJsvgphz9pcj7NdpMg3J2CIL1hWQr87Kt6/Hu8a7PXE0qz4CMrCbRE3DebfO7IWdooYQMEJEZNPK4QqRWWBkpM990TiCMgVlE3uhZUNG5BDj5pJS32YeZTWjZkOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6781.namprd11.prod.outlook.com (2603:10b6:806:25d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 22:12:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 22:12:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 25 Jul 2023 18:11:57 -0400
Message-ID: <20230725221159.354618-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725221159.354618-1-rodrigo.vivi@intel.com>
References: <20230725221159.354618-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:a03:255::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: b06bf769-330e-459f-fd52-08db8d5c3149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MIDnYZiZVCZyTg4X2vMv9n1udfLCzyEV6C0PI/hlrgyk3u7AijK7ne91o/YxKwUKdvg1ahaORT6zrAhteb5q879jRwXHpaCtUZ6y9+5a4zQgVFBzDDyurwAZuvyTfS1B3ughNYj/hbj8eXRBnfwOCi1A9xSOBLRY85d2oRCmq1u1rXF8bDjIRQilPJk8SwGP3bJW96AV93keGumyThwm36sw4DDoAXT8kKncgOzVEyb6GLZdAkUqvUHeMAq7fQdRU0NPB63EjUsJHJARjBKaK1y6ZDc8o9Zb0NtkPxFtf42+YL6mSveUpLRYAawCqF+L2dHmKJRmPc44//pIjIbAxSGT5CdcvZ/oECuYtcKdt88PzLeDHwz2Q8C/7rap3IPu2uw5h9SWPBiDRcYIPrWouxMhKR8GUuUHGBqStj8otlWyLKlzw62L+hCM/PvYbWoZ3yMX6YkHX9vAwB0s7uwF1+EMWI84xF2+pfr2nIdxnPTQ8COVXPumoME86RnufnBgj9dJ59O/oZxiMcDL2GLJR1qMaIfx3eB2EuSs+8GY9zLqbIprMdqkPpLUuicDEbzoVjBKoVNS2bVOz8inABDNYR7ejAqSLesBN81t8EMYRI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(44832011)(5660300002)(41300700001)(316002)(4326008)(6916009)(2906002)(54906003)(66946007)(66556008)(66476007)(6486002)(26005)(107886003)(186003)(478600001)(6512007)(1076003)(6506007)(6666004)(82960400001)(86362001)(36756003)(2616005)(83380400001)(38100700002)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O/ogYLz7RFKDszP+mY9Nhjv5Kl1lgIKyTM7a+lr4ZcDccpnZSteVSRmOcceT?=
 =?us-ascii?Q?AhT8AI0aEcFzeZAxIIMkbcBYXGNd5Xkdiskm6HyoSdvdb24I3H4D5sDGbeS5?=
 =?us-ascii?Q?6tLxpaHCmWNVXBjASIU0HzOP8cxf3xQX4UD+LtcxMLkkNqD+eXmTIYjRB2V2?=
 =?us-ascii?Q?uLcAwEujAqKnWRibZ5Xv3gvDDMn8EYF0CTYm0clG1MvJm8RNSzv16Wkl0g01?=
 =?us-ascii?Q?1FeURHn11NHsFE8k3opToKdA9HYSxG0yGgwFSHCMOSUk/wtOoSPabSfdF3YW?=
 =?us-ascii?Q?Zl5IjpVe/de5f+mLY2Ihw26JdV/Ryk8PExVnjRGWjy3lnq5CPrJCDkPbDkaN?=
 =?us-ascii?Q?1hcJr51KvtKXA4bATdns6wzcRSjS8QQj+vNWmPhDdvOaMAaGDLSU7Q8KZ+IK?=
 =?us-ascii?Q?IOvbyQ94iqGAi1/Hg0Zw+S0krtp6ZAwzkBXb4Est9XMh3u3viU77sq+0Jiba?=
 =?us-ascii?Q?/hdRQi97B3zmWtBP/Lwj2fGloT+JaMH8KD/BS6bhV2cd194PcXZsZluJ2ojC?=
 =?us-ascii?Q?FiN4JBaHczNz6WmXHLSZHMfgzGkHXIbIqO2asgImdX6IWsOkCdxIyEQuNzHj?=
 =?us-ascii?Q?mKu9dSwzJqdiGijkwqHBnCroo0KsqMPDjLFQBxtzSOKRQGzo/jgyVUm4+L7p?=
 =?us-ascii?Q?Mkyekmy5685ABU568TjB/kNns+NTzoUmamv9kf4g0NOMAyEkrKK4HDge+O/J?=
 =?us-ascii?Q?7N0zzsbZXbHlyj3ESRvIXVH1/7DV7XAZyEaZD+eU8lpF1Y3QjgD5rdzHJlPU?=
 =?us-ascii?Q?kkuV1e2M01ZA0JJvItfP3Q0cCSx8Q2X6c9XwyfOoGkCkgv7LZFoypGpJpxRi?=
 =?us-ascii?Q?jQUJdH76kPhB+22vjWfPQpJ7vY71Rr1DsU2A7NEZ+vCdA8JzSWI6yYI8I43N?=
 =?us-ascii?Q?Pb5NIMTOT9edfSC8hwgOI9+vAF3Ou063cHQ6klLCXSuxJl1L/JRr6U56TzF4?=
 =?us-ascii?Q?D0dUUIEbVDutPNqJbh4tFi90JcVOe5n5G6VSjR8LTiwOyD6PQNdybV+kddUR?=
 =?us-ascii?Q?1cCWpuvzTQ2rJ6wtD2w5pdc3efrz6rLgoQ3PrigHIQVyMRwSkxvH0bNxBUQC?=
 =?us-ascii?Q?A0mUBvy9MJIog3LhyRVMrpQDle9XRgrOTmXVbkZbOdzHohvoKn+JTz31I3GA?=
 =?us-ascii?Q?WggrjFtfs8Wl3uL4KMvxBIsiLZDLjI6H8rLZFo12kh4Qw4B8hSTWhL4SX6tJ?=
 =?us-ascii?Q?LQw4ZaNp4r+JejydWViM+mRQiNUN1d+HmCK3kDsye2c2rHCKvtWRCFMYsh27?=
 =?us-ascii?Q?ekoNfu0rcLxX1TszMFRShVVeF/YCVfOBo+T7qVVyPGeSFD4vVAqiWRy25Wy7?=
 =?us-ascii?Q?UCtlEIslvvoqIubfK61UUPGbjVEJXzsbQn2t6duYwgb1DPxmJ0Fg6KHDRIBa?=
 =?us-ascii?Q?Woxz//5VjiiH5rbSBqzrmYyErAjkbkzxkTv5M3ZExPZv+noFTAzSfpRbLwjS?=
 =?us-ascii?Q?Sh1TNbx6mvJi23R70ljTJz5d0EjkZ/NOQpiOzVxVoQoJv4LMBHibEVd/OLgj?=
 =?us-ascii?Q?x8oJtvldHyzXPAF6bYphXXiNfzzBisNOs2UFgXTBo0KLjgeW+Tdr/hqDYugz?=
 =?us-ascii?Q?TiS6d0xKQxIHBV7/rmQ+skyDBWQseH+W09niSDD2MhbRdBfhsWcS2s/OR7dv?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b06bf769-330e-459f-fd52-08db8d5c3149
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 22:12:11.0358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sn5YgZpQY4FmcuEc9OyL78HbvJ4zEVf+hsB4GDu7ZPsovspOsY+sqpLZqOql9rNU9Fh9h/xgODDMs6+ZdWctpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6781
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 3/5] drm/xe: Fix the runtime_idle call and
 d3cold.allowed decision.
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

According to Documentation/power/runtime_pm.txt:

int pm_runtime_put(struct device *dev);
    - decrement the device's usage counter; if the result is 0 then run
      pm_request_idle(dev) and return its result

int pm_runtime_put_autosuspend(struct device *dev);
    - decrement the device's usage counter; if the result is 0 then run
      pm_request_autosuspend(dev) and return its result

We need to ensure that the idle function is called before suspending
so we take the right d3cold.allowed decision and respect the values
set on vram_d3cold_threshold sysfs. So we need pm_runtime_put()
instead of pm_runtime_put_autosuspend().

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index add6f7975b82..834d87d98194 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -144,7 +144,7 @@ static void xe_pm_runtime_init(struct xe_device *xe)
 	pm_runtime_set_active(dev);
 	pm_runtime_allow(dev);
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	pm_runtime_put(dev);
 }
 
 void xe_pm_init(struct xe_device *xe)
@@ -300,7 +300,7 @@ int xe_pm_runtime_get(struct xe_device *xe)
 int xe_pm_runtime_put(struct xe_device *xe)
 {
 	pm_runtime_mark_last_busy(xe->drm.dev);
-	return pm_runtime_put_autosuspend(xe->drm.dev);
+	return pm_runtime_put(xe->drm.dev);
 }
 
 int xe_pm_runtime_get_if_active(struct xe_device *xe)
-- 
2.41.0

