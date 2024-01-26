Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE95C47DDF
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 15:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5425510FB31;
	Fri, 26 Jan 2024 15:04:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCC110FB31
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 15:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706281491; x=1737817491;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yjdoSx3AOFDojnNpN3wytSDAA2lUS8a/J7M75DYnKVo=;
 b=SdvwV2fE57+Mnnn13t9B4fcS54pvNCd+jvyzEUidYbBoGd0+9/7vMuiN
 CH4F9fWlSLZUh2jE0p8bHlKpWryevHnnuMctmHsy54R9dIqo2dqFqrfUK
 rmcWT/Q9GPw4VW3AbLdTyvQshb7FGB3BMHA4uX7o5lFFKMiedHfexhOip
 yxsGDNgmDjQ0LePDHrlKifCGI7IwAcSffmXOLZuRQIVYtGLG0ZDskeTkn
 xatNmHlYV/ZJzcpmmgZs0doLc+jH/naYz3Ydg3KSaDgOrYCrFVmE132L7
 vLCf7s8NDcMyBH5nj+cRdadfC3vkaiaEn5ytEx1Dj0LyLvzx7Q2gXMptc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="466766194"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="466766194"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 07:04:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2636038"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 07:04:13 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 07:04:12 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 07:04:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 07:04:12 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 07:04:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpWF823loUA8qA0B9aLewMdQZcE22h/tvsmZEaM3BD8hu69ey8vF30HYwp4qkXizSYhRXVM0rkb69HBwgOVh0pu9XqIHzLb6/BWv28bAyOTgYpwxuAF6AhB1cfO+dYJLTVyuUz7iAIguv7tRax6LOnwJftadBU0Gc4W214tebRYlTbbIi6bPkT1hnlYEqEcTO1Mq1umr961dNDEp+xJig2bR2LBEg5MPsqpXQTejrSuYj35TOv8tnzz5QlqHzcS5b2dUCEwirVrTxWXSoshw8zIS+xFg+BgD3fkZStKVccp/5Z93/YXDt8zmBDQt6P5xgtnezMeh9To0rLL6a/vlmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JP1KFctqy28Ia82K0o6pn8Mz/bW25/PNbzFMQxNZpWw=;
 b=ffWKixK63w9ZWch04lFKDHUwRGotwAg6z6REWOjWQoVLUAhoMuXIAiGEJ1J/QYrMsFjGYpHDVnUwUjOlwo9rDlBXd1Uqt5zJntfblqpnznyuXRO0U1Nlwgny7exV46WC7/sb1uVFv9zqTiJmHQbYKWGRmH8TkiUw1rj72O6hXOJqrE5adgD4Zt8V2cMeGNzbzjeO3LKnjifdlUx15Z+94AbJb73SBNi+LYhFamY+KB4Wsd7qt0wANd9VuyZ11dIAPY/dTSnBoB4WLb0fMSP1p3DgW6zTzKAs31DVZiYQt2ojr15TRyVoyz04V/x5qzLdgIYv95zZaoN3vyRinNv/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS0PR11MB7622.namprd11.prod.outlook.com (2603:10b6:8:144::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Fri, 26 Jan
 2024 15:04:04 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb%6]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 15:04:04 +0000
Message-ID: <6359a737-a290-48fc-ae3c-fa6f460a8032@intel.com>
Date: Fri, 26 Jan 2024 10:04:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Refactor xe hwmon
Content-Language: en-US
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240126074819.3851075-1-karthik.poosa@intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20240126074819.3851075-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0035.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::48) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DS0PR11MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d25e8c5-bb3b-43b6-8059-08dc1e8009a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b1dHNSgPCZy1YkxX1b8wq2YEjGgM8TQf1HWl1UH2nYXEJrUR7/MMrMylSpsLy2SlS4BU1OlIm22XXZWsOrxPrSXw0FIrC50IRfa4oQbtjJ5DqJLpn1gKg2ughwTPeIkXtr6SYLuVrLv+kn9F6ZgsGfLU+9qRXhVUz5dEfObauZL0EseCOkBuGyB+xlVOR0TkmfUneuQBxWWOU6TTjMWhr0YY4AAnXBreUwSUT4day8GpWk2Ubf/Iy8Qh5b5E+jzOfYfjg2ZQKbXYBPb1XMDI5Jdtr0l2OCLSs7uYpbX7PFiUbkrx2AQN/ALwKVIq9hlCU+j2w/bP5hI/eF2/rc9YiouMYOdQsIw7ik3csmqUVmAbA3wOz4gC1+zkBqzav+BSyHfzeK5BX6UvXh3R8VNDqWwPIYFAq92AfR7y96MMtDgTJjtoNXUpcl38r1taDUdlrYtI48dxi+EmMjK1zSe75md+ywMONnow+IEEJEqeJIKBwByG0WuPlJuPmHeqmgoH6Ues5Ae1rWT+WITNzh++xb8YTFEuB3OSjvtwKGhForMJE4f6h37342CkjC6sfNuaSnOqd5qk4G44BDlTbT4uNmOaDEJ4Zco8Fg32+lqRsyZq0PPsnJi8pVyDpmI5nVvOj8jA8uPAShjpZC7k02kwJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2616005)(31686004)(26005)(6506007)(53546011)(6512007)(6666004)(107886003)(6486002)(38100700002)(82960400001)(86362001)(31696002)(36756003)(83380400001)(41300700001)(478600001)(5660300002)(2906002)(316002)(4326008)(8936002)(66556008)(8676002)(66946007)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3pnQTdRdjlqUysvWTRpdkl0N0lpcDVVd08ySjRqd1N3dlREWXUzTnZGZHhO?=
 =?utf-8?B?Z2diTms3MTUwZ3RIbE8wN3NCTTdWVzJvbjhJeFNhUThWYW5FOUNBVDZ0Kys2?=
 =?utf-8?B?cFNRYlNnK1BFVWRQRE9IR2sxODdVc3RUZno1UUZnKzlPbWIvUlNQR2V3QmRo?=
 =?utf-8?B?TEYrbW0zN2VXQklKMXJtNldpa1EwTDUyL0JKWHRmaHA1Qm5wbjBNeit4NVph?=
 =?utf-8?B?VnRPVGxCd1ZxNlNiOXhoeTBMYTRJSFRFODR4bENINEF4b3ZCc2VDb20wMjVC?=
 =?utf-8?B?amxKS3FXNjFBbXRocS9lcTdxa2VtTFZWMlpFKzJTck11RmM1Vzd2QnB3TnB2?=
 =?utf-8?B?ZytQdFp4MGQxaGw3UWhLWlJtL0traTdVOVZUcWNTMTk1eklDV2JRa0hCTFBK?=
 =?utf-8?B?T1dqdy90dVFqWjhqWENzRTRoYWI1YUJHcm1OMld1Tno1ZWdvYXdIWlh3MXI1?=
 =?utf-8?B?aVhkZGh0dE5DTDdvdWlkV2V3MUxjM2pnOVdvWHVFTkdBN2FmdUpYQ0J5TG1F?=
 =?utf-8?B?VlZlUFpxSzhlejZVMW9STVJPUU5BQVB2Y2loMTY1dWx1U2RHT1hYbzJzRjlx?=
 =?utf-8?B?MXl0eVMrcEFRZmYyNnpUdC9uZ21CbUlzbDVpemlHUTlBZnVQbUREWVhScnNZ?=
 =?utf-8?B?TzNxRkw2cGNIUFhIQmpKeHdyTUZRVmpxVGhabjBWUENWR0R1OGhHYmpRN1Vj?=
 =?utf-8?B?QXZFdm40WWFicVJkWlZVYmFhSmlzSWRkMnZET2E0U2NLOE4vNk11MEZXVGtj?=
 =?utf-8?B?UTdwcXg1U2JOZDEzM05jVTFneUFuZWx3N1pBVmpTa2czaDhOTnlwNGlnREV3?=
 =?utf-8?B?R1NjV3lWUXNVVStBM0hqSTY3UDFldmI1elhyRlRXblR6TExCTk90ZXZUdUVh?=
 =?utf-8?B?ejBOcG1ZOEo0bDFkc3hOVHUwdGVqNGdEWXpWNzFFY0VFMTJhZHcvK0xCNm9G?=
 =?utf-8?B?eERPTUY0eDJ1VnNyc3MyaXJ2Wm9xSWVZYlUwczh5QVZXa2dxTmp3cWZUVjZm?=
 =?utf-8?B?Zy9EaEkrR2xQS2VNSGUwc2ROdzlmQ0lxZDAvSFNtOWpla1pxaWZIcDc5SFFn?=
 =?utf-8?B?bldiVzJTcWJKbkMvamIreGtVWEV6NHZLWmtnK3lFVHB3eXJpL0UzK2tueUZL?=
 =?utf-8?B?VEtyQWU4clRSRVRNZHZYTWVBazJJM3c1N2h1WkpUbjhhRkNkYnB5OWtLVkJr?=
 =?utf-8?B?cU13MCs2NEtkdjY5c1RYcEJWbGh1SjQ2TVIvazQxOWIxRVpzdUVoRVhHQmdo?=
 =?utf-8?B?YXBGRHdGeGM1dFY1elZHdnhMRTRXMHluVjh3aS9Ganh4Y3p6OEVpQzFCZnMy?=
 =?utf-8?B?c0Vuc09NU1JmYTRPbThWc3dzSjRKZVVGd1BnWk5wY0NWTytkTW1kV0EvWVFt?=
 =?utf-8?B?OGJYeG45TUVWd2hGTzVEbnpKZFlmS1h4YUtZUmtmaEI3YkJGOUdyWDhBR25Z?=
 =?utf-8?B?L2FVMGR5K1VUbUN5eHlpZmZUTDhLeHAzTE9wdGdkbllxTEUvVytXY1VRR0Vl?=
 =?utf-8?B?WFlyMDIyeVVFUWxOV0NSYUw3NDZpa0ZlV2RzbW5mYnNXbG9USGtURnBad2d4?=
 =?utf-8?B?TzBhL2NuQWRETnVZN0xFb0tneHdNMm1EVXkvVkRESVZVZ3VwTDM0OWw4VCtI?=
 =?utf-8?B?cEpTaHZCcGNTYU9BM2tGRnFGN0hmRDBQTDFvbzZsUml6ZDY2QktURzJqSkVU?=
 =?utf-8?B?NW1DdXJ6TVV0ai9JODhMTlZ2WUllZ1N0SGE1MjZlV3RCMS9Bc2dOM2tEVWwz?=
 =?utf-8?B?dHVPOXp4aC85alR0dGtIbHJ2SDZQMk1pYi90c2xBMERsSTdxNW4zcGtMTXRR?=
 =?utf-8?B?MHBFaUVCWFAvN0VlZnBFenRLbEtMNzRjd3hIbnRFTWZqbk1yRGdpTWx2cE1M?=
 =?utf-8?B?TmVZaEkvak84aWJUMFd4MVorVmZ0MmpIV2dNaS9RY3puZUhOK3ZhdG1tSERl?=
 =?utf-8?B?aVB2dmhnMjBKMVI3cUgzK2ZUNUxrdzR0cFZLWTdPcWRSS0MrK0xGZVBoaE13?=
 =?utf-8?B?RGo3L0F3enpiblZqa1pGRmVDUFc3dk1aTlA2RThpZ09veDdxQy9nZ2N5R1dE?=
 =?utf-8?B?aVg1ZjF4YlhsOW1tTFNuam93ZDJuRGNsQkJiYVJMbzVkVmVTTjFEdDVXVHR4?=
 =?utf-8?B?VElRK0ZUUm54aTBIWU1MY1RCQS9KVWFJaGNFQVhVR2N4akRUN0tYVVZqR2xS?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d25e8c5-bb3b-43b6-8059-08dc1e8009a2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 15:04:04.7628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPUI/pziH5H7PIQ0xdBnPFNCijy0owFLHK51D80SqMkIutUTYWuSXXusSCmR+6QnJkDBYdECVsm5EUYVPqmYQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7622
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 2024-01-26 2:48 a.m., Karthik Poosa wrote:
> Check latest platform first in xe_hwmon_get_reg.
> Move PVC registers to xe_mchbar_regs.h.
> 
> Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  6 ------
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  6 ++++++
>   drivers/gpu/drm/xe/xe_hwmon.c            | 24 ++++++++++++------------
>   3 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cd27480f6486..15ac2d284d48 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -490,10 +490,4 @@
>   #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>   #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>   
> -#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
> -#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
> -#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
> -#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
> -#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
> -
>   #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index 519dd1067a19..97652b4297ff 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -41,4 +41,10 @@
>   #define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
>   #define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
>   
> +#define PVC_GT0_PACKAGE_ENERGY_STATUS           XE_REG(0x281004)
> +#define PVC_GT0_PACKAGE_RAPL_LIMIT              XE_REG(0x281008)
> +#define PVC_GT0_PACKAGE_POWER_SKU_UNIT          XE_REG(0x281068)
> +#define PVC_GT0_PLATFORM_ENERGY_STATUS          XE_REG(0x28106c)
> +#define PVC_GT0_PACKAGE_POWER_SKU               XE_REG(0x281080)
> +
>   #endif /* _XE_MCHBAR_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 89c6f7f84b5a..c19a0daf7fd7 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -77,32 +77,32 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
>   
>   	switch (hwmon_reg) {
>   	case REG_PKG_RAPL_LIMIT:
> -		if (xe->info.platform == XE_DG2)
> -			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
> -		else if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_PVC)
>   			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
> +		else if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
>   		break;
>   	case REG_PKG_POWER_SKU:
> -		if (xe->info.platform == XE_DG2)
> -			reg = PCU_CR_PACKAGE_POWER_SKU;
> -		else if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_PVC)
>   			reg = PVC_GT0_PACKAGE_POWER_SKU;
> +		else if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_POWER_SKU;
>   		break;
>   	case REG_PKG_POWER_SKU_UNIT:
> -		if (xe->info.platform == XE_DG2)
> -			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
> -		else if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_PVC)
>   			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
> +		else if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
>   		break;
>   	case REG_GT_PERF_STATUS:
>   		if (xe->info.platform == XE_DG2)
>   			reg = GT_PERF_STATUS;
>   		break;
>   	case REG_PKG_ENERGY_STATUS:
> -		if (xe->info.platform == XE_DG2)
> -			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
> -		else if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_PVC)
>   			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
> +		else if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
I see concerns about check latest platform first, while for PVC vs DG2, 
I guess the sales for DG2 should be much more than PVC, should we 
consider that factor?

And, above is equal to a read from 5x2 table, reference by array index 
might be more easy to read and expand in the future, and no more if/else 
needed.

Regards,
Zhanjun Dong
>   		break;
>   	default:
>   		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
