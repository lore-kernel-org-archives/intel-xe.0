Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB32CA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 19:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC58210E2D4;
	Thu,  4 Sep 2025 19:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dd+0L30t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B1F10E2D4
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 19:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757014625; x=1788550625;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/byxzg+IfXIF/1Fc+x5/COfDW3iL7eqlotWBsSKKHBY=;
 b=dd+0L30tv5D+zn/A5r5IIcNH9HWNJBaxy4xXqA17xur+6ASgEJTVFQCd
 Egh9Y5a36Tu+BdGKrJOl98DcIw4xyWYYyhQ9en5A0OUMoXFS8qbcoK1hS
 kRC90rD34v20+P4NVigcnGhAkcTCA5jEZC7Vts4AZKbHwmb3aEhqrFP3Q
 mKavJnHzHqWK27SLwor7MvVxjBEv1Cv566zhm6qY3yrhzPZFeyKyEKZOM
 8Owt6lORc1YNuihA/55Q+EmHBP4ZyXuYAbHNN5AoulG3FdJFMdiRh+utT
 Hj6uiVqcEqWEBSXmtXuHkWE793EQhcU3FsxHG7aIRWFDMnDsWMRcK0vKF g==;
X-CSE-ConnectionGUID: rFeo20HFQhSSk5YpOKtVYw==
X-CSE-MsgGUID: LH4yYknzTjGYCVmx7RrAgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="69981976"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="69981976"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:37:05 -0700
X-CSE-ConnectionGUID: t/dq145vTg+tnykIGwS9Gw==
X-CSE-MsgGUID: fyx3CbbERc6a8n3MSvJSfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="171262834"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:37:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 12:37:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 12:37:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.89)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 12:37:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMnTqhzDKnrjPkUNMghqIvMY/D4hVLs8VahuXEge5YZH5/nBFjr+iGMFtmMITTJCtkIKmkc2XZJZsWHi1/RDkCClmG6tlK8QmlxdCQmj7RuNJF7rBPUPGNRFkpbw6WDoFcteBvT6LM5TA1DZsCiElG4ZASHsUN9jVw+jaXAJ8bkjgdMQ2r+UReLOEyjT9PcdSyw49mHwCR5kzP8EkhKGIZ3NWVMtBL53c827g+UirkjyI4DNv5TiYbBhtPgxRVnrPkveswXn7GnQvXGttv6RbjkRkJCuDhnJ2xbBMRIires33MwNTxFRmaCxDeD54yghn4k2jxfEYAjUp+nb/zzEOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSPCMwjwwMxhDPYcOL7y+ThLtY0jsfM1siuyki6FFT0=;
 b=TDUpYWyOKUxALTVYwq3UUAyIQN6iXuqZvs3Mp1QjQyPWyua+3qX2qte1tR+Fbwa/XYUP1VFWpQG/L41ltqLvFTrbCTlDrGDWQt3ypi0CmO+7D2HEbfWCfLwmYJ/CBGPv1BckD8oUP4Y66TsuV6mO0+CONPXdCCvkLuiQE56LjzcvESm6ptkuVrdD2YTi9sjqjfrnzYNOzp+j0qDIS/5pdO//MzkMe0ou20JQ8S1duyw3iUSMI6o5Bh4P8j85vy695GZyzCl9wvlG9KBbn40O8SN8VXrhw8UVnt7tLXY0qQgyIN1rKeYY83PY8/KGR+OBCKr2KFD3IVrgt/aQxXf2Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7334.namprd11.prod.outlook.com (2603:10b6:8:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 19:36:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.018; Thu, 4 Sep 2025
 19:36:59 +0000
Date: Thu, 4 Sep 2025 12:36:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe/guc: Use proper flag definitions when
 registering context
Message-ID: <aLnqWSFiQoaHnIX/@lstrano-desk.jf.intel.com>
References: <20250904192918.7346-1-michal.wajdeczko@intel.com>
 <20250904192918.7346-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250904192918.7346-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0211.namprd04.prod.outlook.com
 (2603:10b6:303:87::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0453ad-df7b-4879-e4dd-08ddebea6a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rvJ21FOQCG8XrVpJSBNWVx/S8thhf66ynOePBVZeu4FX8v59Qi89NlsiaYsf?=
 =?us-ascii?Q?jEKm/POuE71MdOP9KjzNQrBskK+Fb83X/KSVfFoREnTWarcH9M4dRdVqux/n?=
 =?us-ascii?Q?Tgumabxj9Ff3SxsWp23hl3YlBSlZjr0RnJ9tlDvAd8OqUECBw+zQ4kDWV03Q?=
 =?us-ascii?Q?nVil71Y/ZPN3V9JASXL+2gfa9sudOg1IvmV6EZ7ZD207erFQxLpTcMqtkajB?=
 =?us-ascii?Q?K46QFCgfplere3BkAY5FSGu4o912zS1Cfo3rc1nN/TfnIdFp+uyvSsVgpCnS?=
 =?us-ascii?Q?j1AvX4ZXg9FYlt36LLnlDhC9VNWG3EB9knqPjqzeOKvvFLICfPIiJ7yuqpeV?=
 =?us-ascii?Q?F0IK7VCUsbx7I+PdnpHcEZjDb/WWHcEUAFm0XwNyg0pEBZv1aZ+2h/C/b0kQ?=
 =?us-ascii?Q?aLb6EzEo6gLKNT4j6SBKRPpRjGdoGpo3J7bHw6qoEALtssVTwAstcIBtWL43?=
 =?us-ascii?Q?MLWW10rzOghP4Czez219cXM1ttIJNBRuhqXAwDPEF8i+qsX1UFkpYd8hyJ9j?=
 =?us-ascii?Q?5gxM3gyvLKiL3ckjlDBdHnzz9WhFqUmYHbINx44ch1vyErRAynmwxWWfIss5?=
 =?us-ascii?Q?5tSWM1CkC8DhasAP1AFiTKB3Y8HZ/XrbSNqv8wDbbuG2Hzsuur5+y3jqykoi?=
 =?us-ascii?Q?KhAnLQX7g8O0+A1YEwY9TjfRTxJmM/Ec+tGYaQT/iVzxp76C8/jxlb8GiQNK?=
 =?us-ascii?Q?+G/8kASnTfwG6tjwrcfT7bqq2/VTE0xYtWoj513zFMhTvgQEcyGtrnqI5fcM?=
 =?us-ascii?Q?xaR0iYY/4z/ukk5mNYxP0zVenVSe4rG0cY6aeoc1CwvfLo2oe9Cu8BaosPPz?=
 =?us-ascii?Q?rFYwSBZR6EbuCJ6cbtulaPunEZJBFCVi3VDh7o7Za7yCJeDoj8+8TIGwrYkP?=
 =?us-ascii?Q?yLBiYaWgLCBkWGkeoMbfKtT4ffSuQHsxxYwDA95HsnEVWpjl9GnfVBGwibk4?=
 =?us-ascii?Q?2RI3I+Cevb9YvDqIOoSYCpIhV8L9N/gjglGexXBJdfhaeMJwPeJATRK4LP/7?=
 =?us-ascii?Q?l2VNw2hKr5EhL43NaxJhUgOqOCk4rI8AYDKdRpKl58nJhKITm3nV/7V8tbGH?=
 =?us-ascii?Q?RgPqW1boIRQoOexaB3ueQNxbOVj4eQh/nOSKVKXOAc/whEI5xLRG+WCLMnY7?=
 =?us-ascii?Q?ALGfJ76Vu2nh2XzmhOkXtg1YihxaxGVIQqA/Mikxrtg2Q2Iji/xrfxz/6idL?=
 =?us-ascii?Q?Ss1/xBxYc8XfVzRsu6/tqapU1D5hwUh6AEEBkg5k1IlxC1aqGo8Twzrtp3hT?=
 =?us-ascii?Q?p8VScLQWSu1rNdbcGegUNVpmIrDlOnV7Isxl9xaaEBaFnXLkZhvpxjOqbO/W?=
 =?us-ascii?Q?ANFMS3l/8XpDqDpyzTCyr38q0/niHPJ1Ie5gJARuMKq7CkYvI2eP7bG5hHNy?=
 =?us-ascii?Q?dxqNDUA0y7J5Z7Sel5SHQYexuw/hsHJqxUaF60pcdNNkK8b5v+fA7cZBgsrL?=
 =?us-ascii?Q?xs1dyDuG+4Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?phww2DEjAk/HjwfsYrAFU+fsRGZElonHkBX74x4HHAAzkqNIacKz+jtoPjyl?=
 =?us-ascii?Q?BvG0tZo2SYq4pVexgAxOTcPujl6FZYAOM+964OxbpNa8qCtIvb/24Skp0wwp?=
 =?us-ascii?Q?EqMqlRhJl0VWyRPHlXgpyL3X8PjxWM/KKybvTYi6L0iQKwYluBBCRPg/zJ3t?=
 =?us-ascii?Q?ToHxjKbMjZ92pfO3YdFeWTkGH3Zj95kZ2pa9Zt06nbS66CGHjY8uFHV4LXYg?=
 =?us-ascii?Q?m1B9Wmk8yctZ6tHktRD0BOgi8uBLuo5bQP9Xj3ZXKEBJSY7CNT18cqbT5+FR?=
 =?us-ascii?Q?6B+L/vX/sOQR/9eOXkEncc/b5VDjxKddAT0TioO3fBJ8jlMoER62DFnhgvBd?=
 =?us-ascii?Q?WeZ0YXrfAxiIho8wAh5L/E9bqYcFMKTpdC86M+rJZixJvG/ClJeztSAmWAFf?=
 =?us-ascii?Q?HmzIUIIRhzZkyrydw4ujI54XS83FmiZkc9d/3Z118BCXsWRVsXgHc90QOYfw?=
 =?us-ascii?Q?cdDW+js5FAIznLViGrWZeZyEZJp10VK22MH9AnqXvgO6VySgP/xJKHVzJNLt?=
 =?us-ascii?Q?opMPEXYVGIub4ByW0R7NlXixfPpF55/fIkp4TWoknS3vtUYHB+mLZjgjwhJ5?=
 =?us-ascii?Q?B/7j8eTFdPi8C2R0Rus88LpEx4V+W62371zrBZP1l89E6Rvkpo69ZoK0Gfij?=
 =?us-ascii?Q?7yv+tB9xbp4ByAwRai3F9QpD9MclNfeaLPVPHEgmMHI6tPVMCiFxBLOHjp+p?=
 =?us-ascii?Q?ZaJVxw8UXTD5rX+yh7Bee3iPk1UGLqlSRpMWs66t7UVaMmuS4Obc5FfDGKLK?=
 =?us-ascii?Q?39bFI8qd7zqilHbZ4eMR7bLCupWkLP795XqAYfRVbKHWaWk1HGUKzASnXezo?=
 =?us-ascii?Q?uL8rcNvWscAOxjqz2CNrK4pxPQgAt3r4L8ioxY3m5hzba4AauxYfw6qqIVnP?=
 =?us-ascii?Q?VJWyK1rQQykoG8gCOLCpRUX5mn1WuKrGJ616SAntnpnY8gs+sUPVFnwQw9gz?=
 =?us-ascii?Q?Bw6iIdCp/mBL+dY4oJGd2xae3y5E3TaciPg/RKN5zP7+9UA6vr5lg+zqyIM7?=
 =?us-ascii?Q?0mzYBcKit4PiZ7pEsojCEg1zi7ku9e5W2VkJ8b/Nj/z4Jw/dxUtTLYgpCGT8?=
 =?us-ascii?Q?uGsDlfpvTaPfFhGmGp2VooTKsqT7NZyryOglLsQyEb3Imfv3UJe/7GqswT9U?=
 =?us-ascii?Q?X6/7XJYvMOokaQEFcPZmsdjkrMDY0RXdNwn6vN43qD9gNXlFG8c8g6Sl+YKt?=
 =?us-ascii?Q?iSmjZSB9mvp2VYb/YF6dkrhW+moq0O9ZF2OhSqovi6cv8fMSbdFVk9ZSeZIe?=
 =?us-ascii?Q?n+/5MfQ5rGXUzyoghPqFgcblwFsAZJ88TxQHVoomNUCngvEothKsGCAUj/ZN?=
 =?us-ascii?Q?UbFuZXciroOx7KkIiLJTcyviKE6PPj1pNxdUrHuk2/BFH0CoKoHpWF81iVby?=
 =?us-ascii?Q?pgWniVK3NKsMtQ4OZa6NjQLuCxPI0/fWoWm4GjTEX9Sb4I3s3Q3TbWAJyC6i?=
 =?us-ascii?Q?5ZVp+9IAH6iiH5jP8rlrgrh/bANICwRrv+rK6hsiuzJwx/baAe7VS5P34uEq?=
 =?us-ascii?Q?82Edw7gy+2HuvYENZ6xvYeMcRExFwOkhaiPuiW8v7URqD30dLyVMDtjZ+Iul?=
 =?us-ascii?Q?9YLtgGe6rkvwjs6VPjIvM210TNy1OYXK2TplGiylQ3aV96J1DMMBCOhyI+9Z?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0453ad-df7b-4879-e4dd-08ddebea6a3a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 19:36:59.5218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ykexsRuz1rW+tRJPvSFRVX/szSqiYyZoCKFGHzmmMe0SdDGr6riyZLQxneAmOl90uqXkJxiXgarUdk5rULL2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7334
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

On Thu, Sep 04, 2025 at 09:29:14PM +0200, Michal Wajdeczko wrote:
> In H2G action context type is specified in flags dword in bits 2:1.
> Use generic FIELD_PREP macro instead of misleading BIT logic.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_fwif.h   | 1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++----
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 0508f1064178..561e15e86d58 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -65,6 +65,7 @@ struct guc_ctxt_registration_info {
>  	u32 hwlrca_hi;
>  };
>  #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
> +#define CONTEXT_REGISTRATION_FLAG_TYPE	GENMASK(2, 1)
>  
>  /* 32-bit KLV structure as used by policy updates and others */
>  struct guc_klv_generic_dw_t {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f2920b047b2c..3437206c4a55 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -558,10 +558,8 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  	info.engine_submit_mask = q->logical_mask;
>  	info.hwlrca_lo = lower_32_bits(xe_lrc_descriptor(lrc));
>  	info.hwlrca_hi = upper_32_bits(xe_lrc_descriptor(lrc));
> -	info.flags = CONTEXT_REGISTRATION_FLAG_KMD;
> -
> -	if (ctx_type != GUC_CONTEXT_NORMAL)
> -		info.flags |= BIT(ctx_type);
> +	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |
> +		FIELD_PREP(CONTEXT_REGISTRATION_FLAG_TYPE, ctx_type);
>  
>  	if (xe_exec_queue_is_parallel(q)) {
>  		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
> -- 
> 2.47.1
> 
