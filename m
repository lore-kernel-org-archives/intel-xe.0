Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D74C02198
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 03:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B19910EA18;
	Fri,  7 Feb 2025 03:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGbYI5qb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF2210EA17
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 03:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738898847; x=1770434847;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wlCJevf2Bo4CSWuFLz02BXnzr81gQEtFBm69KYQbfdI=;
 b=ZGbYI5qb1zK7brHGv/ZIvzJxzu1Yn5zovn9efYcNmz/Wdt6CRYugkOtF
 onGqKjr3mObJ3f4VEeooxfQayLHbNm0yBcboSciw4Mz8/OC28a2YKSJCI
 mA6jQ3qIQBxzcfWE5lBOkLGqCyUBa6YCAcUTxXgR1wPHNnm1KhLlhcTT9
 9dPLorz05PfEzNyVu9fIUe9K3GqAhF7EISh2LtkFhmpeML9Q95pagqN94
 BmX7yAEmDKDKgILQ/jc97hFb/LiiK/p8OAI7DpPvOw0wzcyB2wpyNUrMv
 5MIe4vXwow6Wl74/H0OythMkcP1a5isV/ZBM1bN9y0TjhfCLxveM2b2/H g==;
X-CSE-ConnectionGUID: 4srocyhuQ5mRA3e4gzOA1A==
X-CSE-MsgGUID: gm3UTiBxT/+XnDN9MsAN7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38732587"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="38732587"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 19:27:27 -0800
X-CSE-ConnectionGUID: hXyCf7YZRU6/v5VK/FLz2w==
X-CSE-MsgGUID: rNReibCZRWKQGOnk/k7BRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="116415665"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 19:27:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 19:27:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 19:27:25 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 19:27:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EB6vS+5pW32HnaVvoRuewomXuAZswESQbS08OK9LgdfnFTD/S4ksgvGvXFgNL+qK/lQQnSNXcLptl4ateOIg4qJVYG5WMD1fZYm5GdypYbELu49SGL0CIN8OsMfoL8hU6KfvUggGeIgyvakoRlKJT4Xm/BbUORQ2akEFYM9T/acJfH5ryA3uo1YmwGeXvmLq40SiWWAnDZtnPdVyne3qY7ZkSFcuf9pJoeKk5rhDJFCOrL2X/tt903cfw9s11+c1S+aX3ZS6voRgsT+MhUx7F4UFNpcBW5BIpzAMTwwvgR7uL7UTzFARiLM3h9qoUCpCXvIkYuVDgl1RYchS3kX5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BStDFPjsJninMITbDtNvGSdytnaeYuMpM83x6dKeBzM=;
 b=x3DeviMvPV5O7l+gZeyAkWSkcXc8ztLCkLOCJQnHgFDzxYMXXkzAYME54bDV71WE43mGBiEK22QiDTQa22diYewAA2287kwNtdu6WJXUeMXmDakF8oreyokUgkJ4g/TJMeqNc8HNKIP71wtWizW7q8kD9PYNyY6wBuT4GECQicf76dC9n/80wfYdNvf6Zh8C+zfZqa7Hd/Q+Oq3Y/ItrUUiCEpZ/fEj+Q9Yz4RZ+cz75BFmG/57auUNj3f79DkgVOEY2y1wyjhaOjgEK9w1GdV0otAkyN6WkKMINb+FDCqtTIR3FVNsZONkXd+exQ3u0TczC9XfPTZQnl7gOQvLpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5908.namprd11.prod.outlook.com (2603:10b6:303:194::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 03:27:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 03:27:08 +0000
Date: Thu, 6 Feb 2025 21:27:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 "Karthik Poosa" <karthik.poosa@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v2 13/14] drm/xe/hwmon: Fix mutex destroy
Message-ID: <h3qkpwdljkdfi22j3ldgqenhlb6j6k6wuksmazdfnuy3twapjn@umhq67gyaekc>
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
 <20250206232333.2660325-14-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250206232333.2660325-14-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0069.namprd04.prod.outlook.com
 (2603:10b6:303:6b::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: 1030e37b-1f16-4799-eadd-08dd47274d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D7GsNqx16kfxD1i+BlbA69hQ8tTH7WMjUnG7m/76qYyoqzEt4lpgSko+DV3u?=
 =?us-ascii?Q?k7Mi6HcE8FGEhVxSZjuB1250ltblfW5eOW/jMCFRD9FCmHRqU16xzn9WbISp?=
 =?us-ascii?Q?Zg4I0NFpI+2zhZXDb7Wt3nxXr02t2xXgKlZeGXUrgCbHqk67cKAQqoVG6vSQ?=
 =?us-ascii?Q?LYCTaFWSFBmIxEy6HzhBmK3MgZwATscSD+8lyzvFWNLPb+fSL3AtJ2fzWJVn?=
 =?us-ascii?Q?oAG/+9AGetQwceHzQUGPsdfDW2NuarmU0aZw35ioi4uC1d8LkxZu35c9dLRD?=
 =?us-ascii?Q?OmVh4UK3NV9I0gnkIW8q/ib0+tEjvpIlcva+AiQHz+IcDqWLSfwDXI51jAki?=
 =?us-ascii?Q?6ICXLhevzFD82d3Yv39ddhXrD2g3zUr4xoXUCDds43/U0ebaUCracuIQ61L2?=
 =?us-ascii?Q?G7fQbDpy7JwN2ehTVSIFefmqmc2f+0OcCxPnfT2GArzRo7phFkjgNW/8LVqs?=
 =?us-ascii?Q?gFCjmrzMtfEf9Wx3cmxqQUQmRROFG8dVOvHYYoL+LSLnar0QipumAfoSRwd/?=
 =?us-ascii?Q?cOS5qp+8lXBLZEQC6SYXtMc+k87Def36jE6e1Rqcf30qAvi/wnM1aZFaKRA5?=
 =?us-ascii?Q?6DlpsR/KpyPdpf/Kjr5CtT5Trg5lpHtz6aURRCU8o36GoZmrzOEgnxU96Pz9?=
 =?us-ascii?Q?CqHAXw/t1ZqTZ50a0451hRZUC4LYAsCkxHWcDohsx9r2+4Z1K8W41bxL1z5Y?=
 =?us-ascii?Q?U5MIoZifzAr5ZyNPXV3WX/8x6NFtkXqoBwZUC1eLiPOEIBW41rMYtuDj9W5D?=
 =?us-ascii?Q?wGlhQrim1ll/kjDQBrR91oLBAknl9wk97nyU/IxD6LaI7xg90dGFRBvh5jCu?=
 =?us-ascii?Q?gharCCd8OgjglDV5Dc8iObGry3Bj/OhB/KTtHm89TLEJCtbLfLoEKr4TZQfc?=
 =?us-ascii?Q?xefxvcQo0ocppGSuoVnJyLE0j4e1G8gTu1/xaDohyRmTal+msTLQtKPFdiIB?=
 =?us-ascii?Q?rK/ojoiXOBDKAboGErG0KXg/4lNS8wPtDRA0SEE10JLvIKeLUV6RRPDXivaV?=
 =?us-ascii?Q?wN/rnNeyl3mf1QBdPsgGJYdaEHk6AYwmRyO4NpHNll8vY6H7EFGQ5j6bDGgZ?=
 =?us-ascii?Q?vuqGrve4Na2NeMi1EKk2+STmiCc2QZ/ETFWqDlWyyK5JntSFlJTvevfYpFpU?=
 =?us-ascii?Q?4Fr+VmLKc8mRmEopsm/BSxhptVvnd07YHfWrRmQXGka2Ji97bK4WcvVGm6Ed?=
 =?us-ascii?Q?q+2k6AreTxr378+S2ZicmWaY6n1T0k7s6oMygjvOcQIYu5U73n9A4XJ5omMK?=
 =?us-ascii?Q?ciCj6zNG09mxw5XpXSYjRLjvA6lRJYSL/MdaBldhjDKRCnwFOwjbob6gCVWo?=
 =?us-ascii?Q?nOEGtpVgl6691g0jJhNfxhgpoqqap+TWugnxapzl5mRpqwtEaemmyX5PUDaw?=
 =?us-ascii?Q?WApnQmu8nx95T/9UOtyd593szNse?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lXuJ1wj5RF8H0u/4S53t0reaMmNn1HT4AYN14dlPmLMwsarrQNErKSmsd5EQ?=
 =?us-ascii?Q?qAFyKouYwwCt/b5h07IgFUoNOPLd+8HGZXv/ZrwMt1pDjwnm0pPgc3CF3bck?=
 =?us-ascii?Q?E1rCSOKm43D3wK9tcf2XzZUTzoOz6vLKs4LFKxJcHPUmsMYHMY6unKhl/0yd?=
 =?us-ascii?Q?p9UWAHW52jP9YzjJB4BlPDCUr1gN3IKEqvmB0F402EFnPimACFkRHlel4uMA?=
 =?us-ascii?Q?Ya+WrtdswMzK3ipVSr/DjyMPlT4C9oefGjUt/mpQduoy4b3dFm2awpr/7Wd+?=
 =?us-ascii?Q?PqHZugjTxJQRLjsHiSPhgPCVg44R3Iv2pSo36nRio5cTzTtPKtgQ6Xbit/yQ?=
 =?us-ascii?Q?qpVf/aBkhe5yFZq7SBoB2/ZU3msrlhkwP3xkgWWpvJ+vAQMqgWvyjwteVg/D?=
 =?us-ascii?Q?cKFvd+wiC37/RT9E/LBJdOVOrpWhBWMprTtId+u7s5DM2XU6RNS1Ut51deLO?=
 =?us-ascii?Q?njk4NleyG5QjvN97m+AZfiILYaky9TnnpYUY8W2Hv/YOVKaxLUzPWVw/0e0j?=
 =?us-ascii?Q?H0fIKuzQA17/gnBMfmc+W0bfo5BrTTolqC9jVU0gDRqnUH5iebMVBIfbfev+?=
 =?us-ascii?Q?2gBzwZdVkCqps+TnZ9kk8BfOFU0h7XCrOFdYpsmStn68rMRR0QDA2O75Pq40?=
 =?us-ascii?Q?Dpc4fJMf0i9R9Pfg+iQJO4Qpd8qSBLC9s6MRxV/sxaPqWqOv2pXGPyclWqq+?=
 =?us-ascii?Q?JXXFsJZTaxFJlDNrO9B2oPfKQU4HfRebFUiBzi6XMGAOYpbIf2kdFsAz2W6D?=
 =?us-ascii?Q?c+YT9GASFG8Qf5OixBC/R2xZ6u0tgoJib13smq/kVw5if/aIvXPZjkUA9aGY?=
 =?us-ascii?Q?EDYCtNWLR0tNzMsq9ZuRMXN7YTrYlcaI3bMF5pnK/CbdLElNrco6Z1nDSfQk?=
 =?us-ascii?Q?9huCf6GITxNUmVBKnVU3C3MJDxUPb/HJSJafQjB9EQE3648tBAbo2E2xr3/u?=
 =?us-ascii?Q?jdSEoUT1o4gkFG4fYsbCpoIFHRv3dluM2AeNp1aa7hJsUU9WBXlRsa95u0QA?=
 =?us-ascii?Q?RIg56hOUK5EhAL4wF3dYwr8PZxckd2l7sEscjy6NTqddKJzCyfcUBolbOPfM?=
 =?us-ascii?Q?+yYWDF4xARnkDxmKxgOFlH9fzsnRTFyaUbgyzJp/YcrtA+Bs2ziqulv/bFqC?=
 =?us-ascii?Q?ZIbRSrPYiKE5n+4Uzmmk+ZvXvMwm8A2VrPmRUP3hTzrpJef3dQ3mDoT1w3M/?=
 =?us-ascii?Q?xdZSJ4BTbMehzPgpre7g6e8ARXHVlOdpfMLiMUagx3+WioxjR/YZM+G8O+yM?=
 =?us-ascii?Q?xbIsDgtyaHUyHB09AbSx40L5Wm/tnKc4kg855M0CG+m0r9RRiXjUJGmD4uTP?=
 =?us-ascii?Q?vWkGl06Sxb+17Ao+8IMYcZpS3RAoZOjHEmDYcwgd7d/EQe30n7i0Had1/l4d?=
 =?us-ascii?Q?8Yf1CNwKtGXGNUwAWu/pNfFxHtDAJrQ7t8kEV+rjWg1uN9Y3prNAEPC1+Gg3?=
 =?us-ascii?Q?AsTzaph5g0JtW6elbiJ0aLPGJBCREzHDSUwqEANmKx8KS2b0HY2I/93qeYeu?=
 =?us-ascii?Q?gmtxNuC9lC6/g5ua8oqm2tsJh23JacazpLX2FnvKwZtBD1h0TT7JVuaE8o8x?=
 =?us-ascii?Q?dGIe45VFa7wfTfDb4OdvzELCckCIpFskqku1E8bmNDByShX7jO5xzSLg9iZj?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1030e37b-1f16-4799-eadd-08dd47274d05
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 03:27:07.9683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxUVDO8dR00/+DdFaJ4MQu2BmS8t3DBtL1fFI7prK0WQA2dzxYAL4GMlv0YdozM/agLlZLiLNzF3ImDn5eX3A0XCRjvDN2pZWRt2izzDocY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5908
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

On Thu, Feb 06, 2025 at 03:23:31PM -0800, Lucas De Marchi wrote:
>Since the mutex is used if userspace kept the fd open, it can't be
>released together with the dev cleanup and needs to be delayed. Also,
>there's no need to add an action just to release the mutex: use the
>specific drmm_mutex_init() that should be smarter if mutex_destroy() is
>actually a nop.
>
>Cc: Badal Nilawar <badal.nilawar@intel.com>
>Cc: Karthik Poosa <karthik.poosa@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

oops... 3a13c2de442d6bfaef9c102cd1092e6cae22b753

the reasoning is true, but the entire thing is in struct devm allocated.
Then CI complains:

<4> [321.873848] WARNING: CPU: 13 PID: 12544 at kernel/locking/mutex-debug.c:114 mutex_destroy+0x5b/0x60


Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_hwmon.c | 10 +---------
> 1 file changed, 1 insertion(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>index 7f327e3342123..0fc91c184570d 100644
>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>@@ -869,13 +869,6 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
> 			xe_hwmon_energy_get(hwmon, channel, &energy);
> }
>
>-static void xe_hwmon_mutex_destroy(void *arg)
>-{
>-	struct xe_hwmon *hwmon = arg;
>-
>-	mutex_destroy(&hwmon->hwmon_lock);
>-}
>-
> void xe_hwmon_register(struct xe_device *xe)
> {
> 	struct device *dev = xe->drm.dev;
>@@ -895,8 +888,7 @@ void xe_hwmon_register(struct xe_device *xe)
>
> 	xe->hwmon = hwmon;
>
>-	mutex_init(&hwmon->hwmon_lock);
>-	if (devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon))
>+	if (drmm_mutex_init(&xe->drm, &hwmon->hwmon_lock))
> 		return;
>
> 	/* There's only one instance of hwmon per device */
>-- 
>2.48.1
>
