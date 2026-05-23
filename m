Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1252CD5BB8
	for <intel-xe@archiver.kernel.org>; Sat, 23 May 2026 02:01:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C5210E040;
	Sat, 23 May 2026 02:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AwMZ7CwH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B07110E040
 for <intel-xe@lists.freedesktop.org>; Sat, 23 May 2026 02:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779501698; x=1811037698;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cip8qHdGk+VAM7HZ8uQbR3JbkN0qL2mtuEEmrD8yKb0=;
 b=AwMZ7CwHSKzPcFvZ35xdwXw3qAz/KoYAuJqvwd12d1oDJ/4c4Cr8VWQR
 xeP5OuxmzWGrduWInklZKACQbuENpl7P/o9448+Pfo22fpa/qH9q6YC/K
 b5tiavP8xCLShqQt6qRjYyStflLX74Sbj++t6rZD+9Ua5wlc2XplUvXrt
 7Hq0LR3D2yUjnnYTfI20J1gG2l+MVTqiH/jHzQeMgn/G8xv0B6L3TeaGv
 QhG16E3Y5t2n34gUcIRRxC049wmxnvxI1Vbt7D+GoTPlnVAmYwrzIcJGI
 /Efu0F3s/6UjnzydAPMeGVqtHpXk1gW9Kr/+lyAHLQLhtlmQlIDzUvBn+ g==;
X-CSE-ConnectionGUID: J0awNOcoTTaRtp1NElsIyg==
X-CSE-MsgGUID: h5PVc3Z1Qb+PYfs1ffkTBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80482124"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="80482124"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 19:01:37 -0700
X-CSE-ConnectionGUID: VhHwDChpTsis5Ps8ESpe5w==
X-CSE-MsgGUID: qBnTzQSkRaOMj9wZ9pmLfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="236635939"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 19:01:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 19:01:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 22 May 2026 19:01:36 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 19:01:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gok3YoIfjqTUAkxum4ZxZG/zVyQkAaU6AWBtlghZ9W9TN2QtkA0uHORgv4r7o0OeovRdusdex0H2TGTeQtMHQ38pVVjnMO3moqaCZVB+4/58Vbf0bMgeL8CbsbodxIf89juXwCTWTsdeHL0/GfD+XzOkrVmMP7Z2dNpaUURr/y8YGfVC+UxpmP8JOmLdogly7j7nXp5SGrpU6+YS3Ez5x6Sz6iom/XM3asOKj2v3NVeXyqDtiIqQGWl+cBw9RMee4U25kmrUdDje3buxiaj7a+ul8FbYff88WkLv1xrGVbMnPtf/uQMmzXfyWcL6ZKNC+CQ3YyPldrcBX04CV594BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNdFlrdp3qhG0PixaH3gzzk92vKP8ERjV0NE69mYfQo=;
 b=CVaTIiAOebryat7MToDLBH4RHi6u9/TWt50m3yJ+lPSQdKP1wWIDkDNvE/nztpo85234XDrM+mZznlvWmx8ygFLmyvIf/2+6lf0wMCAQ3LHZYqr8seMNcte1KmCAvRbNqOfHK5F9WAmEuaIltiFlm6jWILMooifgO4+DX1MehhZ4Z8HUPiF0G6aOYT+no2M3K7KlWKjieN6J9imkbWNJ1sv9Rysp13XF4QV8QbP44/pkZqVAiywdwr5LSq1sXhZiGsYD+0Md0tLx5rr6IMUa+rTThvUxKOJsTpS1Nzqo7296gqWsLOW3RpgYgAom0uN1QhfjDcTQsoiyiwGy6y5UAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB4862.namprd11.prod.outlook.com (2603:10b6:a03:2de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sat, 23 May
 2026 02:01:34 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.21.0048.016; Sat, 23 May 2026
 02:01:33 +0000
Message-ID: <326e7fc3-5c9e-4abe-a68d-d36d4b319ef7@intel.com>
Date: Fri, 22 May 2026 19:01:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/10] drm/xe/hw_engine: don't open code is_usm_hwe()
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260522123720.39656-12-matthew.auld@intel.com>
 <20260522123720.39656-16-matthew.auld@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260522123720.39656-16-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0108.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::23) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB4862:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d4036b-3b5f-4f25-5d29-08deb86f36e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: qUu+kne1JkvBdUlyEa7URl7BORLZhK+KjVqcD4NuQyLYu2h2K105anG/z/PbrEdaqFuHS7ckY7BwyH94wBLDogNe1RuGGPx736If/sxr91Z3c3nqZdwqT5BcGw3rTOHlDSGPeS6TKsCyn0OFIFZTCDw6EbXvrXHCupL0lU/Ebw2sxE/e0ojvdMN1aIJJB+WR0sSFYtek3VW9WFNiYD03FcjhV5hKv2RsrqN8XmDICH6EQAfqCb5KLNdfTljBMGC7KCKVxyoxWPq8PxqpzIPaVRswL374nxxtf146j/ad20w3/SAYJmbpA5Yw2vOZHZVCdT/3gvpJs32172pw8GV4vymnVKQ7VaOk7UNQAPdEf40Xj72IaOZQkV4IGvLBSnwGnXBMIFurd9wl8CBTy/Yr153jU8qRkhcc5XqClTyhpCZGwo0Rig0nQ3T+XN9z6y70nFqKjrxGEDKhkuFbzhcCXMljj2uf2gJtGp1zo9WepFIqbFI++JCuY/fol+rrrVSSTabDVelP8M1VJ+ipBGSzgHVqP6jZyE4tgykKsoIqnx5aRAw+Z2+mlC31ufunV0B2f03f3DcBmkgtq8ip2H+Iv8GI0kfg7f5BD7Nq2EhweKIOVRf5HBzo0jqCDjmPIZxHPLkUFVblnVtnrmuqsOCelwCb7yyf68wQbRjB0XMoQdsIQrssSUMGTCKVB87c8HMN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm41QnBMWmQwdjdZMk40T2NTbVdZRHZMSVRCcmwrazFYd04rLzdLanpDYzVt?=
 =?utf-8?B?cTNUcENxekpMNHpodklPbW1GSmRwN3hCbWF2clVSU3AySThVMlpQQzllWHFO?=
 =?utf-8?B?c0hVRVRYaGY4aW5kY2wyc21sYStDZ1N3VWNmMVJJcWFuRXRBaWZBaWRQS3ZE?=
 =?utf-8?B?dC93MUxlM3R0ZXR1dEUxWlVDRndwNEV3OE1zNEY3czNqcHNRWGV6eHdjaDNH?=
 =?utf-8?B?Q3FVa1dNTlV4cmMwS29kWWFYQjg5WFE4SjhpR3FFSlJiY0s4SEpzd2VpdXg0?=
 =?utf-8?B?STR2WWlWMkJOdGdxU2NPdUFqQ0piZ2Vtb1l3dW1SSFl6VmNiUDRKVHF1N2Nl?=
 =?utf-8?B?TlE4S3NuY2xyblQ5T0JjN1NzODF0K280d1hGR1M0QXFmK2pXYmQzNkJxd2or?=
 =?utf-8?B?SUlYaUdxbnZ0ZEd3QkxrYTgwN1FLVkNPS2s5ZHB0eTVSRlduVDdxNE5jZC95?=
 =?utf-8?B?TkRPVEd6NzAzL3BjVjZjWW03VEdHWW9oN2poNEdiT3VBY2UxbXIrS01abUNO?=
 =?utf-8?B?Y0tqSkcrMkNObWhFNFJEWG9KNyszSHdybWw2a20xc0o2bjhDb1lDL2Y3ZUlE?=
 =?utf-8?B?SU9zWVNURlBNNFEyZVhaR0RYMEJSd09NaXpJbG9jWjI0YnV3OHgxSS9XbGUr?=
 =?utf-8?B?U3ZqRkM0UWxJekpXeTVEOXl1ZmpxMm1uSEhhRW5wRHpmdmFyZ2pWZmQwM3l6?=
 =?utf-8?B?b1NQaDdySzhFdDZ1M0F6K3E0YzBoWnB4QmVpZEEyT0p0MGZtV3VkYXNYRDQ3?=
 =?utf-8?B?T3V0NnRFQnkxK1ZhNEVCcmFsOUU2Q3lTOU5RcksxSDBjcVdzOS9EZnRhNFBw?=
 =?utf-8?B?QkptR3VyUk9kdFg4YXpZR1dISmtoQVphYzY0dWhDcDB5WmJZbkZYR1lnUUF1?=
 =?utf-8?B?M0NjUDlQdkhBRkl3MEhkQ21QYjdOWlp5ektoS1I3OXhmR0JHblYzWjRySWFs?=
 =?utf-8?B?L1FOR2ExTU92dEVkQ1lDaXhscFNzU3g1YXRBUW1CYksvNSs5enFsZHpUOS9W?=
 =?utf-8?B?YWhHdHBiY3VGbE9rT0V4dWljb3FOQ0hsUlZWaUkreGR5RnVBVnVQM1NUeWZR?=
 =?utf-8?B?cWVUQjY1SUp5cU1qWENvcGZwOXdZalZxR3M4UnFZRnJaL2ltRHNJTmZjOG9F?=
 =?utf-8?B?Y0kzTG9LRlJoWmxlRmREb1RMNlBSeU41ZE9VMTEydlFCUDJlV0R1M2R6UkFY?=
 =?utf-8?B?eTZFSzJaTHczK3NzNUs0SytEQkw5QlhMTEZxWXZxdE9YZWZBSlViSE5mSkNr?=
 =?utf-8?B?K1gxdVhnSEZPUFRnRTJqVWVnYTYyMzBHb2o3My9Mb2k5TTdqOVJWNTZxSWti?=
 =?utf-8?B?TzlLWktmdmpvN3RLRzNGVmc1SWp6WXcyRXdwMVpaampFU090L1Z5MURJc2Iw?=
 =?utf-8?B?RHZ0bDA3S29FNHpKdlBkQ0ZaNFFtYmFtTHlLcnF3YUF4bWRkT0tYVU5SU0ZX?=
 =?utf-8?B?WU00ZlBDUjQ5UWVWT2JGNmQxK08zZksyMzJxUmswVTViSnVNTktlelMyR1h2?=
 =?utf-8?B?NkNNN0dIMW5ERitlbVR5S09tRUpmbFdieHNEdlcvVEtpM0tUUW1hd2VmbDE5?=
 =?utf-8?B?Zm9lN3dybDZCb2k5dlZKeTlaS1h0OERabkh0TjJOdTBYd1BkTGlPUUkvcW4v?=
 =?utf-8?B?NmJwUHp3bXdRamZtRFRiM3BzUlo3dXhnKzJsN1ZCY25MTTgyRTk2VW9VbkRm?=
 =?utf-8?B?bFFmVlNmc2V0cjFRRGlYRFdVZ1FMQUlEWjEzbkMydUh2dFF0YkVBKzlwczdO?=
 =?utf-8?B?WmNPaE1kTEZZSWg5OGJUaUk4eGtISzhRczE0OUVXY3lKV0FIQUJ6QjFQcXVz?=
 =?utf-8?B?ZW9zMzZZOWQ3RjVlckRtdUhpMWN2RHgxNjlnMWRjR3BoaWE0OHdBTkdEOVhS?=
 =?utf-8?B?SWdSdFltTWliU3pVakdZY21iTTc3aVNXQks0N3c5ZXp4cjJxbThFdDVzMWNZ?=
 =?utf-8?B?MjVJMEZSNFg3Qk9jNm1ReG1iS1ZDUkNhNnFtYytrai9TZjZQT2M0UURVdVB5?=
 =?utf-8?B?WUZUQ29tQXFldmNwVy9TbXBPRG1QaWYzVWJUOVVxdndacjAzYURSM09ESkZU?=
 =?utf-8?B?SHlGd01McnB0R01sdTZXMVpCOUhqZmwxcHRmbmgzUnN3ejEwZzRzMk1CSW50?=
 =?utf-8?B?RUhwOHliU2s1VHFFeVk0R1NnZFdpYmpMNGdhZkZFWENvenVjRzNzKzFCYXZn?=
 =?utf-8?B?eGtiMEloUHdnNDBsWDNMWVVWUnZTYWw5YzB1eHhKZ2puOUdGOEVqQ0h5UExK?=
 =?utf-8?B?c1lhV1ZhaEJnWWN2TUwvNklVendlUFNobkNTejRlL2Rnb21McHpQbTk0UmU0?=
 =?utf-8?B?Y3hSMUxiM0Jpbm9DWGR0L1g4b0I2dFVmL3FrMk15bjduMTNacDhzSEdSZ3BJ?=
 =?utf-8?Q?YDTGsu2eSVd/uX2E=3D?=
X-Exchange-RoutingPolicyChecked: ZZRLGbzBAAZoUk6T+ZWBwNwhj0fpNbXr1D2rD2/b1p/QOcYd/5UjeYdmYWGNIcVcQ2cd2uWjhC8b38VbP9KsSEGwHEQLKdAt7YXGg1EdEGAJ5ZOC6gSe4zgbFt4IAny99s+IHsWWD0rt+jBJZraoDVW5ir9tI1ULmvvqcra1qVPXsnnT0azaBJigdvSlMDka2itAXzUpHYRH+3kHt9AtZ7ENR1M8Y5UOVWuQ+hfajCO7YpeOAsTMSlZ2chSJQURjfkNTCAvH7J0cUZg+EM5w307XhzTv1syxE6Ow55tEhmIal4LuuVAXKecRefOtTyMJAeIkX0rb2fEF78kYM02wrQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d4036b-3b5f-4f25-5d29-08deb86f36e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 02:01:33.7746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSoV415Y5HESTIvDBrI6DTXczMdYZjhZYhM0nJmRhR4qoQOpDZp1ColfckjD5DHCFzqtugTCAztGOV68c98JTfi+YrtKjuq7KuKxCWTzWe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4862
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



On 5/22/2026 5:37 AM, Matthew Auld wrote:
> Prefer is_usm_hwe() here.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_hw_engine.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 8c66ff6f3d3c..768b0cd4c16a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1037,8 +1037,7 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
>   	    hwe->logical_instance >= gt->ccs_mode)
>   		return true;
>   
> -	return xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
> -		hwe->instance == gt->usm.reserved_bcs_instance;
> +	return xe_gt_is_usm_hwe(gt, hwe);
>   }
>   
>   const char *xe_hw_engine_class_to_str(enum xe_engine_class class)

