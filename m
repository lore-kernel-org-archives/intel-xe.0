Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29237CD1292
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 20:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00E011297C;
	Mon,  8 Apr 2024 20:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knKSMUQ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F5E11297C
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 20:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712609795; x=1744145795;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6rBuM8V0eYrRbuHPdxDrOHqOjOv9ucj58BQLgF/V5Xk=;
 b=knKSMUQ14hfypyfbZUbsbVHJwru8uL5tZkQlrH6QzZ3nPM8DCy6pqvTo
 XkdrXdRVGtPSPbYs8RzJKH8WHXtdHXap5+cXUsovQCbK8IDJbmOthLht1
 5pWCvTwHZxZ2KSNOodaOIFqWtT2fq1jbnS0xWBLylbC3q2DGWa8vZ7+6r
 TByU1hgFPGBIL6ZTsu73JXj+5nY2gmep9zKFmR6tMoSRmzcwCv3mIvS6I
 RtT9EYrLP11zN+vw06ORjDveHtdGHH4ngAEDTZX9b7jQ5+AXiHbf/9QHu
 6imHU7RvTEQu5f5LoNoXeSt/0ygMETQM/4Cw4PxnhAryWAR4RftCEin82 g==;
X-CSE-ConnectionGUID: iffDrvckTfqoMyvJ065AvQ==
X-CSE-MsgGUID: mzV+AvhoSyGI+W/ZhokRtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="18516960"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="18516960"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 13:56:35 -0700
X-CSE-ConnectionGUID: mGRRt/GwR0aUFgGg7SsU5A==
X-CSE-MsgGUID: p3+Lrr2wSXeJggBh3YsUTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24708834"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 13:56:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 13:56:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 13:56:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 13:56:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 13:56:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJ5Jzl06WyYo/9p+FZe1zkT0jpaOAtcEIIpaUX4NLnSI8mpNC2ZIGx/V6BSXIsucbrnQsKVhEDFmSNo8DpwmQfFsDjtiIqFHnIdqbxRDFWORBH1amd/3oflY3ktZZgA761cqwby7QRVkxEEklsrwZMpCF9mckRCJgLew9DyYUq2uqqfHOwifUDb+P+GmD2M/1Hj267fFZU1hnK07rZ6YI2w6Ka0BJT2FRRRtXb/sdriaxiB48+XO19UfyQkNJ7APE32LQfnnehNsAYaultnasVDPDbzWzDMmpBBfkVXc/ql42xWPaA0aQca/r+BZSYHwv4jGQzGB2EC6sKkBXYqWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRg8Oay3KH5+/BO3T/6UD8JqnSMXXvgs/8a5Tq0s9gg=;
 b=NrAypiHfMAqDm1tsVvyvUw/QoVMofgCSHHDv44pdpMSJU8QNzzpsTZQohScDJSLN+ekVKYLsbsJv0FP0Fc/nwcbFwDvys57NT/QMBw5/7HSlh0jv1CtBzDiIlMqekmjrhCxBnSFhjML7RIsRJnZgaoNebGD4wVpoggCkC3mVEnEvhozUroCfjZ/yNsLnPQGxn5M5mpz91wIEQ7gOPppLiWyEXr7Wq0Q2VwJUKbvSoio40ypcVe7x+CEpnuG6RTM+qZN4qizK1zh6Hw3cBNAUpT8yRy8GcyDDEHFIdtT19KOhK5nTVnomDxBMIKR8F39WPgBKxiOZ6RcRwSMbzAcdDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS7PR11MB6078.namprd11.prod.outlook.com (2603:10b6:8:86::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Mon, 8 Apr 2024 20:56:31 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 20:56:31 +0000
Message-ID: <27f2b41c-2bf1-4378-a30e-519cee82de96@intel.com>
Date: Mon, 8 Apr 2024 13:56:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/lnl: Enable GuC Wa_14019882105
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20240405084231.3620848-1-badal.nilawar@intel.com>
 <20240405084231.3620848-3-badal.nilawar@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240405084231.3620848-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0036.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::49) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS7PR11MB6078:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bd/fHM8+OBzPz7usv/Pd1nFoNuF9Ft4R0otA4xX1Pib4gR3Q9itbFNsjqFejZ3qkBvjovkj0UT5gl+PwFXEfrdvSnNCDVl6jwapSPSPRyrsxQEmOm0ns+EUfgAJW6g9F3dqaMnyLpf3BmxVG+O9fz59cQY2PH5ZfE0NQHmK69qzIklOv+27X9H4A6eUhmDuOSi8F1kAIQHhJtZy0vIyXdHPYFFS6irGh0gzjTjlnSsQSg5rJX5X70JZfRN1LZi0CmG32gekQu+ZS6thEVF849L31ha5fQ4TlYyKcRWaoCgM7c5VbzgNpUwvQ/ruRyMGOsFZrj2vt41XxYC9HTgd/V3nDWtVmCxZKTX9/x1bFP5iWdhdtdNHZSxoFrnCNw4gPgcv2VIYmrNFTz9lNrHMmiUpoPirwWFtwuHn6k3NCtdeWDWhkFrc+PT5ejDHgxXCHP1BhEPpjea5jFer+0sak+vfKes9AMtN250u0zj/vPaK/RMaPib0G8lGgDIKHJN8WrIDAnJDKt+iUroK2jc1T4tZnwjzTZw5anJ8sPGjJaZdFF65dl162PTXn/IsoiATpw0KQVUrTBrf4wDlxS9C28NkbZDzD8CKmSWlRNHY1iR+ecj6EFGKAH3Dkx5Xfh+wSGsTEQRPyPQunp5VY0WoWJ7/q81QeRDnO1YoioCrLMIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnlWUDM1VHduajd2Qm1MeGtydlJFcEZFRE9HZVk5SEFoeU5mN0VwcjcybGk2?=
 =?utf-8?B?UUd0ZytDVTlQd2IybVNyelpmWWFTZXJzQzRzc2hxTGNub0g1dG9PTDdTR1Nn?=
 =?utf-8?B?U3pmaUdFQUI0dWVRQzVaM0FYTVhzeG9hRGUrNDQzOXlnZ2labjNsbWc1LzFJ?=
 =?utf-8?B?anBidGtvR0FCTkNNL2RoSmt6TE5jMm9ReDRqZmhjRnFBUTIxK3d6ZmZsbDFZ?=
 =?utf-8?B?TXdFUHh6eHBGNTlnMXpjdVZrVjhmbHhKTDYxZ3BudzdtaWk5VlZ4YWtVQmJm?=
 =?utf-8?B?THVpTlE1bzFIRDUzdWpjaEppbzRyR2tQK1lpZjNIS2RQTlY1ZmZYOWpYbGE4?=
 =?utf-8?B?L3JzcHRuR1p3UWE5VUhGaGY5OFlUa01QczloUDdiQVc4MzBPQjBQTWNiS3ZQ?=
 =?utf-8?B?TmdzcTVGR2FmT2ErVlkzTmpDbXg4NUNNUFc2ejNPQWd1TXFuRnJ2Y2E3dWpn?=
 =?utf-8?B?ZEtTMGZPa3dtc1dmb3ZzUDJ6UG4rR050NDJoV29kelgyai8vcGlzS2JCdGZ1?=
 =?utf-8?B?emZzekxSS2NYZndhTkgxc2RvUmNLeEkyZ0tMbUlwZ3pCamRSaXVQTERvWVFv?=
 =?utf-8?B?UldmM2U2VlByMkp5ZUVUZTVaK01pWlNObDNsNWk5c3BrM1ZVcm1DWWlzMnpH?=
 =?utf-8?B?emYwSnRPWElvVXA0MjJ6aWNDd0FpR3Q4U3FoTm1JSURwMlRjdUdNV2dEVm0x?=
 =?utf-8?B?UytpeTE4UkNIWVZsSXBpV2tnNGN2NXprTmpsMzR2aTJUZ01FUklod2drOGs2?=
 =?utf-8?B?UENydUszdDJRYnpvbEU1aVllZ2RPSGN4em9QTzVhbVgwOUdpS3FoRXNlN3JB?=
 =?utf-8?B?Ujl4TXpzbFFkYW5kekppOGFNTXlpeXpFamJVK2d2ZzFib0ZxWnZRbjJSekQ3?=
 =?utf-8?B?c1d5MGN1YUdCSVVNaWlJUFdRRXBlRHk0N1NBaHh2VEhQbHNGTCs3czdlV2c4?=
 =?utf-8?B?bk1pUlpzcXFtU1pVMVEwODNrQjVROEMxWWF3VkFBREFITlU3YTRZZXB1d3kw?=
 =?utf-8?B?N3RWSkovemNoOG5MZ2tGOWNNZVRXSndtSFltZW91QWpuWnRDVml1MUF4Y0p0?=
 =?utf-8?B?RHJYanpCWHpoakt4ZWh6UWVzTkg1Smt0M21DeUc3MXlJVzd0cXgwYjJhd2Fm?=
 =?utf-8?B?QjdobDVZc3JzOTJFN1BuQ2o1clBBVVFwSGtzbzBxQkpSSXFKZzM4b0J3WFZt?=
 =?utf-8?B?K2oxaDZGR1NNeHQyWG9tOWpObnhIdUhGcGVvdkszTEx1RGFsWXhaUG8wODB0?=
 =?utf-8?B?MEZZRmlHaWVGeDJvSFN5OGZjSmhmL0F3N1dPUHBwZzVha3V5Z3RaZklTQU84?=
 =?utf-8?B?NGRBUnJ0d3hxcWxEaEpka2Ztb0xTU0RiUlBEdTB2QW90dnEyOU5NY2U1TDdj?=
 =?utf-8?B?bG0wNEU5ODR5bC96cnF6elEvS00vOE5DaEZmZVZvMzJkdWNmRUVTT042aW5o?=
 =?utf-8?B?dUJnc2lNRFF5QnlRRThvMVdYU21xd09wMkZJZmFRVFcvanU2QzRUSjFCRjBE?=
 =?utf-8?B?VFlscTJmVjJreVlJWDN0WUsrbUNFcWJyeDd6YkVFREZBMVRvS2NaemdKSU5V?=
 =?utf-8?B?Z05iWU1OSzF1a3dMSVRyd1FWSkhsREttTmFUM2J0YWZyVzBTQmJEM29lS3Nv?=
 =?utf-8?B?LytRbDZYYncwRWMwb2dYUms4MVRMQjVGWG15MnlZYmJMTUJZSC8wMjNxbisy?=
 =?utf-8?B?YytxUVJ4UWw0R1AzcmsxOE43YnlicVdTRERKZ0R1UHUvQWZqZnA4RSt6dWIr?=
 =?utf-8?B?eW81c09IK1dzS2FPZU5PN05sMWJtaHozWXdJOFREUVFQMUtpQnhvL2dwcXds?=
 =?utf-8?B?RERDL3JkODZiZ0hIYndNVVFLSlZWaDNqcjdjenN4c3JEN1lwa0dkOGs0THFm?=
 =?utf-8?B?QUdkS1YvNXBnc2JMRXhnRS94YmVsZ2E1djVGdDFqaXgxZWt4U0FpNXhRNDlW?=
 =?utf-8?B?Z0xtcnJ2N0tlQnJhdnJNK0phZ3BIL01tV0VWdEY4c3BhRm1yVEk2ck8xbXZo?=
 =?utf-8?B?VGtBMkY3bHN0UWhqckUzY2hXSklsV1IzajA4WXFjaW00UVB2NnVWbGIxemJw?=
 =?utf-8?B?UXh6eGc2S2NXY2hPQnR1T2JwbmxyZzJhQUcwSkdBaVFtM3VNVWJMY0psL0E1?=
 =?utf-8?B?M3duTk1NZXZ5YW14ZFBLcGgwMG9XaGl4cERzRDMvSWhNQnBqVjJQS1ozWm54?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a83d94-a612-4777-bb75-08dc580e5e6a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 20:56:31.8442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kbUTGT+wZalR3KY4pPXL3PiwZjwq/0+3phUSL9DKEzK98Fo1BWB6DwZJb/9/CM/j7Mi02eEyp/OP3PRO870gQ5VP54I13gVbz6OSYUIHmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6078
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

On 4/5/2024 01:42, Badal Nilawar wrote:
> Enable GuC Wa_14019882105 to block interrupts during C6 flow
> when the memory path has been blocked
>
> v2: Make helper function generic and name it as
>      guc_waklv_enable_simple (John Harrison)
> v3: Make warning descriptive (John Harrison)
> v4: s/drm_WARN/xe_gt_WARN/ (Michal)
>
> Cc: John Harrison <john.harrison@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++++
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 38 ++++++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>   3 files changed, 39 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 0400bc0fccdc..5dd45e06f0b6 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -319,4 +319,11 @@ enum  {
>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY	0x8a0b
>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_LEN	1u
>   
> +/*
> + * Workaround keys:
> + */
> +enum xe_guc_klv_ids {
> +	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
> +};
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 0a8f27243c84..757cbbb87869 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -7,6 +7,8 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include <generated/xe_wa_oob.h>
> +
>   #include "regs/xe_engine_regs.h"
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_guc_regs.h"
> @@ -19,6 +21,7 @@
>   #include "xe_map.h"
>   #include "xe_mmio.h"
>   #include "xe_platform_types.h"
> +#include "xe_wa.h"
>   
>   /* Slack of a few additional entries per engine */
>   #define ADS_REGSET_EXTRA_MAX	8
> @@ -279,21 +282,42 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>   	return total_size;
>   }
>   
> +static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
> +				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
> +{
> +	u32 klv_entry[] = {
> +		/* 16:16 key/length */
> +		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> +		FIELD_PREP(GUC_KLV_0_LEN, 0),
> +		/* 0 dwords data */
> +	};
> +	u32 size;
> +
> +	size = sizeof(klv_entry);
> +
> +	if (xe_gt_WARN(ads_to_gt(ads), *remain < size,
> +		       "w/a klv buffer too small to add klv id %d\n", klv_id))
> +		return;
> +
> +	xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
> +			 klv_entry, size);
> +	*offset += size;
> +	*remain -= size;
> +}
> +
>   static void guc_waklv_init(struct xe_guc_ads *ads)
>   {
> +	struct xe_gt *gt = ads_to_gt(ads);
>   	u64 addr_ggtt;
>   	u32 offset, remain, size;
>   
>   	offset = guc_ads_waklv_offset(ads);
>   	remain = guc_ads_waklv_size(ads);
>   
> -	/* Add workarounds here
> -	 *
> -	 * if (XE_WA(gt, wa_id))
> -	 *	guc_waklv_enable_simple(ads,
> -	 *				wa_klv_id,
> -	 *				&offset, &remain);
> -	 */
> +	if (XE_WA(gt, 14019882105))
> +		guc_waklv_enable_simple(ads,
> +					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> +					&offset, &remain);
>   
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 68600cdead84..98a81468bc8e 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -20,3 +20,4 @@
>   		MEDIA_VERSION(1300)
>   		PLATFORM(DG2)
>   14018094691	GRAPHICS_VERSION(2004)
> +14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)

