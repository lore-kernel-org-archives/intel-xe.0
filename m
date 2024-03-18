Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBD1C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 18:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C3210FA82;
	Mon, 18 Mar 2024 18:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgUvdPZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE1510FA82
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 18:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710784911; x=1742320911;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=WpuB4SM6vc2IPdrq1Yix0xDwrIc4wZLQDQeWmhe+OK4=;
 b=KgUvdPZ5nbFDm9EopmKVS7bGiayEyJMfKhcq0m2nR/L3B8tRsEp+Cssl
 rnyBtGMI37j0b6SiHJX3Tf3pfLqmE8IXOkonbrfgaKUUAeSGoEJu1SwWQ
 R0xqj4+NsSPdRyEJ0EoIM5MRVtE8uJWW1JMKhX0EvKwcvNDi+NIYTxYoj
 vNkDy9NlchTAlDGwADpUY6pmxcCcX2IiiAbE8G4eMlcFOPFHoRjp/JD3B
 EM/620BRg49XX3w3Qb0segWBwqa6Xe2u88pRs/PN2VwAMzkCwS2W2trYx
 szYUIDDyJl8avGC0U8GMGw2u+277U2sNVeF+S687CEjFffnNUIAXrbO4C A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="6223368"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="6223368"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:01:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18155976"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 11:01:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 11:01:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 11:01:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 11:01:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 11:01:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjJq5gqW17nSonoBTRqrGbeFrlJ+suc8sGmA4leArdQIy5GPlUSWHBNnjfziKiGwmhmvo3IzioHegXsPpR88dMRVXZcWzJQKT+0BIqo2MzgnRcrp8GRz2IyLUcrl7KU98tz0tGNKAxbxtaHfJeIkVUcMxPpvVpaHGDWPJiXHPAbNW3DtK8PRGCbeqL0qV86rs5YbF8GguvONfi89X4+f2snIKw4FzsoDj4+E3kLYm/YfvSlty9SaRo7KtROBi2jzPd7B7wdE0Q67ByI9lAc7e71NsteaLSP7eIdaMXNaCdImbx0ZX7agvwq8hLxwKcgXe9GaeH3jvQADmH4pAXFuNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GisYrfDHcLrYkuRBExLa3jamK4aMI/RBCF1TNdSJSA8=;
 b=myc9sjP2lFEX8DoKk7Tl+X+9EyYWvTIHPBr+FIX7lrbYFUfWansU3uJkL3Ub2tayy9wV05cwb9s4V42JgoJYxutHZauIFQSg7B/zrBu/hoKizYziMXPTFiWAzHoRHeHrJFBtnRhDCVCC6w/eXU8PQ7BE7k4IdxjWVcWWPcr0RNltf+jz0xO2GBlfz4vbDM0xGwDFfwiBN42R1r8dX2jhOgIYO/ZeKKeNgJafK6su54B6WSQ5ygGdTYWgbkHVwaXsfV62uGEcHHTpgbStZu6JwOlq88S+18MWNgrT0FxRMeyw3LeFXf9KG35MSyvqsUq8cUUz1eiJcRdXWfIdFbErqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6867.namprd11.prod.outlook.com (2603:10b6:930:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 18:01:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 18:01:45 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <francois.dugast@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/xe: Convert gt suspend/resume messages to debug
Date: Mon, 18 Mar 2024 14:01:40 -0400
Message-ID: <20240318180141.267458-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:a03:338::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 74674156-a8f5-45c9-5fa4-08dc47757966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: japlI1koDK90olPFq3zl1bbgA0n3mckw+z/gUEbUZV4WAMQM8nJ5wYk9iEFFzl0AFsknJqBeusTNwQ0xYOt3zj53AR+ALTgS+2CHp3CJ4gCHbcamMtx9a85bp6xJ+eU7PwTDiY2lNnkMeMlKkiPJJsM7HXIyfvoHgoDC++oVDZi0H9C2wCqpJ75fuZyN/6GB1VoScA/QSlSZtUm3IxsR1lK0KsnUBo7wDACBjuxNf2vlAaYfT8PBxnda9P5qLUaUiOZVteSfGyRMQZ2usn5+wKnMmVAsnRfLcbu/hUyvFeN3qbHyujpedfikuSXJmRAu1nV9getdRCtuDep882OrS8eN4+q9N0m2ygyTT2aGy236pQzQgPzgdU+m5EIj81qlmoJAGZd3jAZiGH0KYlivi67LZy+9+yQoXrqM9hfVPVGb2T+hvMf2KO1RwOPw/qTYKsnmNHKknYkzU0Wv0Ssly82fXy0QQg7fq84zrgPZB5zbfC/B4C9dutR2c8vcVza2mFzeBEzf8glFiSYAFNGhuCo4IWPM60rPHi22I4RPS1n/L6YGU4zpjKdzrLM2LvClym6XLOVI7Wq8GV95I+Jaqis11CXHSqBANnOyQwLQE3tOXK6uB/0QkNZsrf9vmGzDnvOttav6H3B+o4MrgsKvR+HhAu9yXfo2nurIEua1pnM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ziTKqd1ptCfCw5Df/weDn/ZULdIYfUYiXquRVNF9y1f5PytYpgwMEsS9bAKB?=
 =?us-ascii?Q?9meFBImuGmiSVZz634upY9LJTw5Un4w/p0JEpQSJomBO20WzyqDhs6E7GoBd?=
 =?us-ascii?Q?O39cWK7pmGDnsbDdvchzbslPWJ0RcDEnAQNwhpuf2qYxEow3imx4bLpWdTZ0?=
 =?us-ascii?Q?ySVAqQk/pmb2s4C8p7uPf+8TUWLUnWaTJREPjX5HNrikgdqP/4lnZqReMWTk?=
 =?us-ascii?Q?bArdr8DZ5kIQyEFDL8Gk+7CwCK/swTnkUCz59iQ8Ad/nmBigaYO5fSFZ2+Hv?=
 =?us-ascii?Q?LB98NeOr1wGpzGLFXFmiqhbmtskTcEbN7deRPbtR+siC21W6wwDU4NttcHg0?=
 =?us-ascii?Q?xD8ykNyewNlcEoEeYQQ0NTWBy7a0ClY817Ce8vb8s+PC5GfNzwc58nKprmwX?=
 =?us-ascii?Q?KBKltSn7pOfYt/etLfFdui2Vgy0gF/dzdrbPo3YPDUD4xU+wqbJYn8finGUh?=
 =?us-ascii?Q?DS8g5uuBaNDka8tiyg4dPT+Gr9tu/MmXLaLMc2uR2EdxzID/eZL87r7H411G?=
 =?us-ascii?Q?ZwioJ9WuKY5nWJhA4UFY0NokDVC0lcAno6HDBhKBwp3bmQPy9X0ZUn973KZ+?=
 =?us-ascii?Q?fO5WaVOkhmLEVIZbsMKXebVr7lHSyvN97b4SFi0vMDsj1lBUDjo/G+C4uMvu?=
 =?us-ascii?Q?SCFmASIl28PEh9Ffu9h7V2Gli7aSDZhtXGdPq8MpSmUWI8Lx1UCVJWyHMPXK?=
 =?us-ascii?Q?GrwSBBVJIoEYrqir3HsFt6BqGFfyWOSNfNIQvECj+4VQLwNilceAIK+0kQXS?=
 =?us-ascii?Q?LP7BSZHyDhnid75SeAx86eHdrncVbt7QrbHQ9QQg0OJpXLpvAx04QzzZvwDl?=
 =?us-ascii?Q?5yvSTCC3B6EEOUx247P964IBUhFmfBnQ5tLIF0FWMREHaXKtwLD5iQ4uYRce?=
 =?us-ascii?Q?+nb6Hc4fiuMwihoruVZS60OFvCsfq/tC/aDTqJj8zOrVgATkmjvtmQt3kQkW?=
 =?us-ascii?Q?BMg3JmCtRP2OM7b0dLhDM0Xw4eg2GEKjFLe5NkO646+D16J1EcEn0UFk/MUr?=
 =?us-ascii?Q?rx4NgMt0nOCiz8Cxhhgymrbkb1lGMnPUyct0ZfvjVPWU/5DTtL7pNEKEdTek?=
 =?us-ascii?Q?7NbDfTk1QFXFDMIvpQIJsFRc1GB1MbCPjJXc0PrJw06IftqRNb5MsQEpR6Ck?=
 =?us-ascii?Q?wlxhe+0umRYyUTGpza5Ti8RlTRnwCBDTNMpFX2MnBOpLTa3f2mK1SHnAqGVL?=
 =?us-ascii?Q?+KC7GWoKNNGRb1U7ERgSWMPfoW2AyGX/dm173+kEcJg/f7Gr9jlcCm1ODP38?=
 =?us-ascii?Q?F05bMdN0tZw3O02R+DmpH4AEmYAGA6tT/tHdnibgDjyIPUMz+ptHClHfeWkW?=
 =?us-ascii?Q?3WwYUAyVDCHXwrBhP5v8CYl0fPaaLp7u87HNZX4iZ32leAIJvUvc4y5pDUQo?=
 =?us-ascii?Q?ZITSGzn4CkN14SSxORm9FYLVjm3eHxsIEMRRS4ZSSW2iZd3eOv54wzG/PoCe?=
 =?us-ascii?Q?X+YXhRN3I4InapAJcWGdyQmHsm4Hadcg4GC0M+awoToCydCi+BhaMngPvHia?=
 =?us-ascii?Q?ZQIt62JmhOdeAdesFGKGReqWXrPx9JX7scUC9XqYTtMkJBMe0qrtYl+ljXW2?=
 =?us-ascii?Q?HQazn4nx7HLgZoXZX+Po6OUiQ60jaGNxOeTsVyti?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74674156-a8f5-45c9-5fa4-08dc47757966
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 18:01:45.6038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9CJceXnjurwBT51glTkRYI9adFVd3iSY/1jABqRsg7L41URRViRH4LNurQZGHjXlclSOW7hGg+39FFB35421A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6867
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

Let's be quieter on production configuration and let's also
print the entry point of the gt suspend when debug messages
are enabled.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 85408e7a932b..cfa5da900461 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -722,6 +722,7 @@ int xe_gt_suspend(struct xe_gt *gt)
 {
 	int err;
 
+	xe_gt_dbg(gt, "suspending\n");
 	xe_gt_sanitize(gt);
 
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
@@ -733,7 +734,7 @@ int xe_gt_suspend(struct xe_gt *gt)
 		goto err_force_wake;
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_gt_info(gt, "suspended\n");
+	xe_gt_dbg(gt, "suspended\n");
 
 	return 0;
 
@@ -749,6 +750,7 @@ int xe_gt_resume(struct xe_gt *gt)
 {
 	int err;
 
+	xe_gt_dbg(gt, "resuming\n");
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
@@ -758,7 +760,7 @@ int xe_gt_resume(struct xe_gt *gt)
 		goto err_force_wake;
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_gt_info(gt, "resumed\n");
+	xe_gt_dbg(gt, "resumed\n");
 
 	return 0;
 
-- 
2.44.0

