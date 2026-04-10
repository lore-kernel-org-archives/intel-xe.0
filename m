Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D5EF45A0A
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 20:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F3910E066;
	Fri, 10 Apr 2026 20:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPE8B6s2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC5510E066
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Apr 2026 20:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775852667; x=1807388667;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DY6JaDvdgeGMDbf9JrfBg2E5uhx+G1UyDpq4bcxWGHM=;
 b=LPE8B6s2GWTDQvdqoTt3yj6Ja7IzcIfQC/DaHcEyU9GcDcTP7RIhnvB5
 u2Ly7VzqXSNedA8wNcll3omegDYRNpYIMbV1iRnnxpQ76FGLxFqnXAjd7
 MW3DIJH1rOt8Qs2CpJNUIQX1XT/SY+j9QJMIp0YI59PvfAPVSmXABYfPf
 KbhutlrdfpHy5DYadhcrGB7An2BagyrAZlRPiHny2Rix0R5qREgBfBOyp
 BQX5Mjyvgudus0mQLpJcGbRCPDYr0rQg9QSttAZreXjthM7m1dNlRHfFh
 9dLO5aXcyfW/X/gHdMwX+JR0zrx5edj13PFFNjHXt1I5S4IvbP3NAfls+ Q==;
X-CSE-ConnectionGUID: 6NaoAs+tSA2j6KybXkhPvw==
X-CSE-MsgGUID: VZnUm7hoRm6rT1bQmi/WMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87958005"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="87958005"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 13:24:26 -0700
X-CSE-ConnectionGUID: h+OnMFhEReWbbgBQUl9aeg==
X-CSE-MsgGUID: ce/b/4gmSE+nEBmX+Bi+wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="226456120"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 13:24:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 13:24:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 13:24:26 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 13:24:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BErOmc9R/MA56VaKpp94Qwyliu8KBMUJobSvwiNLuaByJ9JR0o5SJdXAvS4b8MkRiF/Cg6wZapVYvTgfHlR/J7iBuFVtcdD8L9/t7njiBEqZ9UJrcZ762t9oecxRSQ/qt0OnGgQY8wVEno/70noYEoQ9kTeiPjGNQSxOeAUl1wO4A+8eCrCYeJsLg5SLvhys7HnypOcLzmVCk52OQHm4QTQyU/IkKgbC3NAQKHSHMi7r9sxnFeLz/L/sdVPo8c14LDCTc4092AGlIZnCxp2ycEhFin+Cr76zOlXV82zHvLopy6RPkEBsfFRZ1MBiDjxNA/vN4gqBmqb2OEE+1UU/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3flTRYFgIAcJpTtEQfj3tl1338ElCo/mXC2Mm/aSUUo=;
 b=VyaIc3bVfEDwF9FleDzBFkB3O1faXYHU+dY7ec2s1kaLvmqXqHbcb3Hagq+cOVTVjmbxDFd1whR2NBtuzuZJCpLzzQxeXsV3FVN0Y+D7WrHSZz/uxtGm3PqFGnvf0l1+2CUc2oLHcESJtODCzS+gD2y6lrDDceMDhBRZ/5Brdrcmq4gfc/OBgzXp5p5ty3wqjnk6ldeYnsRNwI2UNJ6r+gl+BYrkI13mY0+5tslqpBgqxL0YgIKLspOXahpvRIujC1u8+YyysbXUCGx/oYlsnfkVBUhbxNwUGMgytLaGRF5P5hKG+bh/1HBYZLcDDMFye+7U+REX2miqTpj+hz5UZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Fri, 10 Apr
 2026 20:24:23 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9791.032; Fri, 10 Apr 2026
 20:24:23 +0000
Message-ID: <0ea79610-2d1a-47f5-a784-a596a52b76ca@intel.com>
Date: Fri, 10 Apr 2026 13:24:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] Reapply "drm/xe/nvls: Define GuC firmware for
 NVL-S"
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260406211759.817577-9-julia.filipchuk@intel.com>
 <20260406211759.817577-14-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260406211759.817577-14-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:a03:255::8) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: cab05ccc-1efe-468e-166f-08de973f2775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Wpve8drsP8UVF6igP9wZ1DnMva/9bRXeUkZSTKgubWQtQhqK1HSl6we8JYMtkKv9+Qqm4Mvqpn2OZCcILirekOeag4+0JIVwB1GBVmj/Mak3DowsBTONHlTfqvNDJbCI5zju1khqCeOvZsZZzedPgGu39pqnihXndU/77/D9tamYeu1WXubwPG6fNU0oRngxYiTnfLGr4I6Pgwl65GU0dOay4FS8H/RncMW4dIH8RRDr6h1bAfGbTTpFq3ZRxM2UgMP4GcsF0Seh8gcW7Au7wj/zLD59TiAH3iyglUcZA/VyHopNKylDhy15nwhueua5SNIWwl1gjrZvx0hXyS0pcrze6cxXsvvWYKThL8qd7XdE2YZeQ5gKx8SBYSr5et/AGHy7O36VsHn0YSvPlxii8b/mLWCZ3IjwOclnHrdllVzSpu1bHo9W2LizIHoK49Zw3T6+1tu08K54Ml7cMtykYr1ofIEtgMS0KGRxqnRaG0h/pqOFBqV1jphnmW7lYTNG47NetCWJHLHK6JNMQlOEDIkWQdW+WTov7bhiDNMs1hCpgR1Vp1R6OscKvfKFt9IUSCsmbY5Bb7dYECWtSZ2qo6AJc1eBQ84s0T4C7mrH+e8rX0VaWCze6YqnDlxkY34LsfNH8treuWPI+d2gJR9jPxwepsgFZsquqZWWmrdt1Oe4q4vvFxkT1RlVM2tr59RaFDkf5uE7UtFRhQGXNqIyFwb6i2vT+jI6y9q4qZZm9xQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVpsdlhkcHZNWDhQVTNBUVNqZjJtRElkTTIyV3FvMWQ3d0FLNE9WNTByamVt?=
 =?utf-8?B?QVRQRVpUNHBwWDZHSTgzQXk5M3o4M2ZHUDNpK0NVa2NUTmJyVWNudHkxd1o5?=
 =?utf-8?B?Ti9kSVZMeU9WdmdiSkdvSlFBNVpSMUhpV0c2eWF1Z3pCaWJnQjRIOXd3RDcy?=
 =?utf-8?B?c2ltYUhRNjc3ZlN1TjJsbHJva3U0Yll1d1B0WnBPczFrT1FCZUErUTR6bEFi?=
 =?utf-8?B?UEhhMTdEaG5xTG82L09wKzN1MGR0UWFXeDNUYmRHeWxqS1BtOElaNE42RDBu?=
 =?utf-8?B?Mm1QZnN1RmhldGduYlNFaXU5ZWZKSnRzYWVjWlY2TnpLM1FIUTJIKzlNeUI5?=
 =?utf-8?B?U01wTmhJVjlkRVlNL3pzUDlMc2tPZnJSZjNZS3pxRnczVDhPek56d1JLYjFn?=
 =?utf-8?B?YU5CUXRZdnFaanpzdzQxbHBHb3NnUFRNUVUrd2svRURSSmVjSlRlWndFaHJX?=
 =?utf-8?B?bU1vZzFtRXZlVUtoZW93OUQxWk44Vzk4THMyRHd1cnFlaXN5ZDZ2OUx3a0Y3?=
 =?utf-8?B?RkhhMDRWeVdHQXg5dDJPa01GRzljUUZvYXg2ZXRjUldQQklkcTh1ZmU5QS9j?=
 =?utf-8?B?V1NEbjg0VVZRL3lkR0tiQkJteUpPZVJvK2QwcVZsK2x3RkN1OVlrODRsRnVZ?=
 =?utf-8?B?WTBvMjEzRU5VVVhrUTdQbXVZQTBuV3lQQkxQbmlQdldoY1RTN2Y3NHZ4bEE1?=
 =?utf-8?B?bkxjRHdLdTROVENiYmlmVGxwYTJVeGtJekpqMndHWTJuWTdxalBOOXNGdnlh?=
 =?utf-8?B?NWFnWnNrMUdBaTZYMHZVZFp1Ym5VUmIxMndvaUoyeGhva3dhcTg5cmNOb2RC?=
 =?utf-8?B?czlTeWt0aS9oUlJRNCtNL3NzQ3pPY0pOOUpmeFZXRDdxbjJ2N1RqSFU0RWZ3?=
 =?utf-8?B?dHVkQ3doVzZBTVcrQmhNVkVVa3c4bitNS1ZtL1Z5R3o0TmlSTmR0bmpkSDU4?=
 =?utf-8?B?Q1J5dHdTNUJnd3NOTzliRjlIWncraFhKTzhrSnJFY2JUUURjcWhFbERKLzRm?=
 =?utf-8?B?dm5wTUphODVaNWY1V1B1SWx3WThRYWh1VWJ3SXprMC9rZDcyV0o5OFJVSndH?=
 =?utf-8?B?VGNqbjlBMWJSTU9YMTE2RGxLSkYveHR0WlVZNXhpS2N1RmE1UUkrSW1vZkpC?=
 =?utf-8?B?MHRtRU8wVTMxNkhQbU82VUNSRlM1VkJ4c1JWTWVjTUR4UG5FUzJxdmJzNWxI?=
 =?utf-8?B?c2ZtMGNmYnVrRjhWMWMyUXNDMlFuS1lGQ2gwOVp6R05BTG9oaWZQTktuVmx5?=
 =?utf-8?B?ZU45d2FpM2hUYlcwNEtoZGV3ZXBKTENQTm5lbTNTYWM3d21uTUhSSTU1T21I?=
 =?utf-8?B?MjV3TzRrU1VpRWhpWU5VQit3MCthM21GWktqZlFNajhiSHhEd0tYZktqL1pB?=
 =?utf-8?B?WC93bVRhV2RoQmZDT1pFcklqeTk3bmZhU3pBOUczc3RNcFltU05NNkozNzNO?=
 =?utf-8?B?WDRYbjdBVjlOazQ0OXlXdCtrWFkyNzU5SktuZjlaRUxUQ1VIei83NXdVTDFK?=
 =?utf-8?B?cmdSdy9CclU4MFNpbkJwRHBUeGh6OXkyQ0gwT24wTCs0c2E5SEJuOWg3UU44?=
 =?utf-8?B?LzRKZlNUTklkdWpWLzVzcWh1dVRHWVo1RUx0a1hnbUtJMkNtTEE1R3NrV0tz?=
 =?utf-8?B?OC9DM2M2bWRnQnpFNTRwRE9YY3hyYXdab2dtYUlRdFNWdW1RQ0F5YlFMMUdq?=
 =?utf-8?B?K0UvTkhpelVtZ0VoTTltdmg2eXlOdUhDRkV3TDNhK0xjWkZLQ00wWk1Dc2lF?=
 =?utf-8?B?RU10MHMwbUZZalF0dWxFY2EyUjIvUkRNMXpTU0g0ZUtzUkI1clFKR3k2bmxJ?=
 =?utf-8?B?eXBsTjdZYnNNNERXVk56dVJianBnQWtHZ2xxWExVN01CU081azl5ZHlJcCsx?=
 =?utf-8?B?NWZNMDl2YjlXR285S3AreDhab1VnQXpBMitKdE9VMTNBMHQ2TmxaTmJBYlFs?=
 =?utf-8?B?eWhNd3M0M1hudVpqWStHdUNVN3BUSHBTQ0hkUmMyeU95emhGSzRnRlhYYWNw?=
 =?utf-8?B?WE9MY1YySzFZL1NURUl3dDBrb29HemZFLzZXVzFwL3BkZU9uQUxiZUUyc3ZV?=
 =?utf-8?B?djBZOTlMaFFRV29XV0ZTK1RvZ010cmJGSjd1YnJiMHVaNkQ2RWFqbENydGR6?=
 =?utf-8?B?VW0wY0JvbUxWWFJlSlBCU2swbjhMd0pad0h2TWFQS3VPTEsvcHNyeWtRSTZY?=
 =?utf-8?B?TG54K3dmNGRFaG1yelNKM2J4QlJuQUw3eE1heVllditRSytYUHo2eG92UzR4?=
 =?utf-8?B?Rm1NeTk0WUw3SkMyd3JlVXd3Vm16dUlEbVRtVUNSSTBKWk1LS0hQam5pMVlX?=
 =?utf-8?B?VkJaazE0MlFLR2E2NStlWHRLUnlHbjltbXhjK0E0YmRSNlpmNkVrNWZNNFRr?=
 =?utf-8?Q?rpBVdZDjmz852qyg=3D?=
X-Exchange-RoutingPolicyChecked: WaCpPtqa2wPgqVVCVd9Wp2ZDRM6TKNuVcdMwrVGOTMyPsmdIW53L4IHN9FEvbHuExTsvdpRDPDlVXkPgJCeAeEaSx/oXZWD8lctnpNIJP8zmk6eqrJqf6tXzm4afDbg1k+EG6ZeL2mOHnGnypPxVElw2GFmvruJ2W11cgsKw6XY1fpNWN4/9/qgQMJ8ybOGISENZ04H3iGQ+faxHLsEGtyejc+H6OYjBBxumsOd0pAOv/+oT64siFAIhnxk0pebqFTu7ki+krexG4BOk7TgqXoWH6z43Ux9i6WaOWM2WjWNpmL/KO+cXBnPQayIT966aSiS4UvDyE+Z07XiTNTAFdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cab05ccc-1efe-468e-166f-08de973f2775
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 20:24:23.5581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlzDX3+cD35vsPLhy6nonhDvh/f7tkg2wVTQE0TQVUI86X3YR9qS7mzcI2Og17oUnoJkOK3kF+Dzq3m+K+giInQyDq5YqeIwPBdzYCDJFq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
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

This is not a straight re-apply now since the code has changed. However 
the patch isn't going to really be applied, so it doesn't really matter.

Acked-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

On 4/6/2026 2:17 PM, Julia Filipchuk wrote:
> This reverts commit 24f261475da5fb747640e9cc801b336f5e623611.
>
> Update NVL-S to use GuC v70.60.0
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index eeca044d3aed..6709a27e664b 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -115,6 +115,7 @@ struct fw_blobs_by_type {
>   #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
> +	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 60, 0))	\
>   	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 60, 0))	\
>   	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 60, 0))	\
>   	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 60, 0))	\

