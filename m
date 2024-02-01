Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DA2C47DDB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 04:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D521910E417;
	Thu,  1 Feb 2024 04:58:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604C510E416
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 04:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706763520; x=1738299520;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+Wx2U7BbHK9O7ALRlM24MLSGgmU7WYDPbvhgi2EsBSI=;
 b=McQWQg+jcdH+BV/sCAdqQRBplXhioWqctO+eDd/6BhEBXE6y/LZiPcFz
 n2uG3gmzPIPmOXRDaN9PNnefsERkqRMxAeeag4wC8S2uGI2dlA6B/Q3Lt
 v1aTgsddLL+AGMSdsNKBTf1WlPGFgABc6u1ilTu0RCgSSnAQ0yNlMJn9W
 VuiXTQyfsZ7G9Z61lCVLLihSclyorkKCM14bK6Eu8NdfyFWLLWJ9+c5jz
 gqNe7WDy41Qp0c/A6Sb8EV23MuBm7tigO1InwAtdKqwul6TiKM65sk01d
 qBy9DZeSEBz/QLSPPzkTlU8cIhFX82wqMz3h4Z9xIgVR9CPCyr9Yt4fxC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17194225"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="17194225"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 20:58:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="908130819"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="908130819"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 20:58:38 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 20:58:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 20:58:37 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 20:58:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0gEP8W3y1RBurFp1fER9S8ITmKjut8Wsvob9RggheBKOYLozwA3edueU9mndZsOXXdt7Juu2ozhGiAfwRYDc8hGeR14aqlpExb4ydyb6X+Kd3PsW7XlrsF1/Y15KfaJiIqWvbvXQlCVZojKxhF+PoUkKbvn+s9nyRQ1QDUpdDT0pSEHx/y1Fs+9sZNHzV6IcWNwZOtQ6/brC1bENVBnbwPhMG8HEcUS8zFXhrKtr+L9wlKOKv41E9k9fEbX9M+RXlweV7i7PQ4tpRsg3ku8sxC09vzFuy4SCnQbXiJKvwPnaNAZmo6OoiLsXJkC0jwllHKjVASq8QZIfLiZVf6AzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mN6dm4GAQ4XXSD/wW4/IRzzwpPhnOaCr4mG2jMXMbU=;
 b=TeEoRTZVKIYDOK64ErUl54E2YqDua0aww1j04u+DqNzH2GQk7iRr9but/MPEkkV+bo/BbRxCErlYR297WEWofSgNzZ7HF2OACANdu9SKWwJdTHGRZyFT/zIEGBwZ6sfbOpP5fejm3gzABNtKAaFpzXzH5brlgqwZB93et8RG8Wxw2QArXMBaYy/pfeUB/AmLbxKKAV8TeXb3VtHOgLuLnde9EmQ939X7iqWrThbv7u1eK8/JgVHI+VEPF3jsulOAuBRkPoQJPMIc+1yLLWEri4RyvUxktuEqEdFDqJF/1yA8BXhKfvn6qi5w0PzfjwuFVcVr+3AHSLvYFmpblbhr4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA2PR11MB5082.namprd11.prod.outlook.com (2603:10b6:806:115::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Thu, 1 Feb
 2024 04:58:35 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7249.024; Thu, 1 Feb 2024
 04:58:35 +0000
Message-ID: <d9c8d655-c710-4c23-9495-098485035146@intel.com>
Date: Thu, 1 Feb 2024 10:28:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Refactor xe hwmon
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240126074819.3851075-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240126074819.3851075-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA2PR11MB5082:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f7e795-db1d-4287-7a0e-08dc22e27225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G24cB0Pv4MYuMPEwGljeHlmhBT/iya5exn4ZMITZHRlpSmXRyKZPomeBrfR5JC7nVGcup2PIaGXx4/lazIqLG3pAruO1rHlA9iOgXwfS9UcyZ4XvO5LhE1hrSVcvcu+aMQ9LwonISJcoBdGXQhqVFg6m5+cE83e82rdxPMcQb+uAnLk4fxJ14PLHZLxb2J91d8j+1NM3+kNNCLTSQbvQ0SyYE3bS1kypTl4xR/C5BQUDtyZaqQlSxtTDpSYJ1lqlWew/gdRvHRMo1t1P+F03cJga4sPWQZpLzTXwkeMr79qmFETmjogeOSFONLDOuB5UJ+b30v0VV2Obt2AB3KkwgB7asL9PGT43pQri8IJBP0nfGxzBYVBRKimfgD8ZTtZlo5znEOTzoC71h7RdIvvGMb/a98f/jD4QhA3LlbPAjD3PrNPSzyqSOZD9jFgLYtHd+QbGQiXMF6MSiwXvbbJM9pytUmJyptd3ZDUpcGgwv3lJtMTw70BB+PvJ5gZrBlZj7PkqDrXGmg7phqrs2s2hBriknDPR5SVu1ZP0nJEFrgxCVaPJOw55n5JIBXnKurKoAJilKAnGE9osRk+Gi4ZKpMU8GLfI9jSanz6w16SvdqthjbDJ3ufEGksqmyDJnztXDJhkDNPHbkIDD6I8POp4pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(396003)(366004)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(6512007)(107886003)(26005)(2616005)(38100700002)(5660300002)(4326008)(8676002)(8936002)(2906002)(478600001)(6486002)(6506007)(53546011)(6666004)(66476007)(66556008)(66946007)(316002)(41300700001)(31696002)(86362001)(82960400001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTFBQnpQNmxhNVYwZmJUaG4yUXQ2Ry9laGJoZU1OQWpkbHpsd2lYQnMzUUZ1?=
 =?utf-8?B?NnNBTzJqZWxGQmg5YkxwcWYrTGNwQmNIVk1rU1gzY2JDMWNYUGszcElEeHJY?=
 =?utf-8?B?SmFIL3lBQ3FzRlk5UUlLcWdFcEhTZHJRaWp5RmJFdFNzSk8yaU0yR3paeUxk?=
 =?utf-8?B?WEllYlhsc1FuVnJXUlllZ0FSckViVjR5KzhyQTBDWm9Tdk5mVnJhM2ZzdVVP?=
 =?utf-8?B?cmJPRUVzdlhrYWM2Rjhac2g1Q2ZyMG90c3dlcllpRmwwMU5ydi9MeWVpUHdq?=
 =?utf-8?B?aHhUSEZ3OXVIK1F2SDczVGY5ZmpOZkc3b2V4b2hRRlNYZEgzaHRYTTBkNXlV?=
 =?utf-8?B?ZXh3RVJEenlYV3lFV3BQUStqcmlDSzJrSkNyUE1qQzRKYWxkSkgyWXJNTUdO?=
 =?utf-8?B?SGEzekRiUjdQdGdmcUtBd0tRemJhUnBqZ1BuRkRXVkY5bWVzWlBJVTdETHhX?=
 =?utf-8?B?eSsxS3dJVGJWQnRwOUFOcjhEMjVPc2tkaFkyNnVMZUNIMGJqYmRRWVczR2tl?=
 =?utf-8?B?ZFVhVTh2YXFmUTllR0J4VzdLRTdVZUJJNWoxVXo1VEl2ZzExcWgvcm1HVmVE?=
 =?utf-8?B?ZnR1eVFLd2svZENNZnRjcUdBaHVZRXBzS1ZhTUZuaENMbGJCZmduNTRmczhu?=
 =?utf-8?B?Z3BRdUUveHFvQ2FTN29zdTc2c091b3JndTY3WE5YNEpZeG5WRHlGcFpLenNI?=
 =?utf-8?B?elZyMWlqVk1RRmk4dTh2b1djYmVWeDROQ0Q5TjJTa0IrNXZmRCtqOXQ0aWpv?=
 =?utf-8?B?d3k3MUFZNlNFY2ZoSVZBaXNJS3VIZlJxRDRoT09EaCtETURNRnlCN01oeldU?=
 =?utf-8?B?Y2s2cE83U0UzWW5RY09qSDA3WExLL0R2V3Y1ZXhOMkpyK0RQUG1udHZzTmdP?=
 =?utf-8?B?Nmd2WkNzSzZQSHI5dnBWNjVuVnJ4MWY4eHJOdzVIWU1oNTNJbTYyL1hoQzAy?=
 =?utf-8?B?RHlKZWIwVm9CZlF2c2c2NHBOY1BaSXJYVnZQWTNBUmRKZHVLYWh3YzVhL0kv?=
 =?utf-8?B?d0wydWQzNXF0N3U1SzZOV2tXbTN2TmZ6cUJQb3RnWGtla2srR0J0SUpCZ3Vj?=
 =?utf-8?B?UU4vNzVPSGsxUlgySU5tUGNmQ0grYXZ2Y3pWeVpqRzhRQ05ScjRFMGNOSkY3?=
 =?utf-8?B?c2FMTXdGOHk2K2lnb29iWEJYQkNjMmlyVUsxNmpMZXpNM1RCMUZkZ2tkM0c5?=
 =?utf-8?B?anVuS0dGMFNoN3dKd0Nha2o4M1lnMzhmeklwOW1FK1VsSU1Nb2R0VEFGU2cv?=
 =?utf-8?B?aEpwVG5ab1d5cFdUd3V2MmhwVCtnbHdPL294Z0xURFZiSzl3dTM0Z1hiU1JP?=
 =?utf-8?B?T3o0ekRkWDlwWDFVZWEwQWNRYWRBSlhJbk5PN2xsMys0NHBzYTBYMWhYYWRx?=
 =?utf-8?B?eEVFOFNjZkxUTHk3dUsyRE9SUWs3THdPUHI3UFNjdENDMlUxcXlzZkFTc1Zv?=
 =?utf-8?B?L3NQOWd1Q1g3M2dOVE5ra0M4OXBrZ3E0dzV2WU16b1VsSnhPRGlVbXkvK2U1?=
 =?utf-8?B?NHdKcGFnbU0vRUhxYm1keSttKzBlZUpuOXlDOTBHSTNtQ0hyVmt3T08wdEVl?=
 =?utf-8?B?UEdUckQrbjVjNTVRNDV6VU9pQlRoWmNHVGJVeWVscldURTdqMG8vQ0ZSOXRH?=
 =?utf-8?B?MDNGNE1IZXJTa056VFdEdFIzREw1bHFLT3QxZVhpUFAwTUVuZnN4T1R0Z3h5?=
 =?utf-8?B?ekJ0d2F5N1RFM0NEaFJnUG90aTZaZXU2czJXRmg1L0NCK1dyUmlqYmhIVnl3?=
 =?utf-8?B?OUM4V2hGckFWRUVVQzhWYk5UK0xKd290VWpyWU9idGRiRlNVYWQ2WlpNMy9W?=
 =?utf-8?B?Vm9jYjQ5K0xKUzhGZGFqVWZwbEpTcUpySEhzcUVJMkRZUGRjKzZrMlcreUw5?=
 =?utf-8?B?ZmhNTGlYL2UvQjVzSHpPL2JCUWNveFo0WjVodmtqaEZNQjRVMHFrVUZyU0E1?=
 =?utf-8?B?aFh1WUhMRHBjWjgyVUlDdm0wWmdYdGpnRko2MjBJajk0MXE3dXovRFNTOGxy?=
 =?utf-8?B?YlBhQWVkdmxVOXNGclNqcEN4YnZDaHUxcXVyRXBGOFE5QmtqcHBhT0FPUm14?=
 =?utf-8?B?QjNmUmhUcVNUNStPQ3pHVGhMQ1BpLy9oQ1FoMzN5UUMyS1JySlVkZitiaWpa?=
 =?utf-8?B?TFJlYlRpTU5MK0hKNFpUczNJVTkyTDNPUHpXSEF3QjBZVnErVllTY0JvYlQ5?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f7e795-db1d-4287-7a0e-08dc22e27225
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 04:58:35.6324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gboNoPfyH0mfiG8m63FNlRCZcedG4n5oVL7hzQ1EQ2RO1jnN4wif/XBFZNN8RAE/tfzwfEmm+lGjeFdUV3sajA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5082
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



On 26-01-2024 13:18, Karthik Poosa wrote:
> Check latest platform first in xe_hwmon_get_reg.
> Move PVC registers to xe_mchbar_regs.h.
> 
> Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
Why Fixes: tag here. This is just refactoring and not fixing any bug. 
Please remove Fixes: tag from here.

Regards,
Badal
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
>   		break;
>   	default:
>   		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
