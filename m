Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B752DD116F3
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 04:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7748710E705;
	Wed,  3 Dec 2025 04:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9uBmILl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C509C10E705
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 04:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764735474; x=1796271474;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ban11B9PHUorSdQfT4rRTU8PGFyy74EGasLly5TqyHA=;
 b=j9uBmILlA3p+COj7rCRw62Ms1i550wOK74f7VLwgerp4zodEfNOKaiZI
 9sLofEUNUglDj66oebBC3vNEEvj+msuKtHB+fbb+I9Otash99ULisfNsk
 0Euuqz0HOf3Q/FtlRxs1H2Whkkcg+TFrRnTbGy3fLmDeeNmAYhCZwdcNy
 99a7WkGji/0i/o/X5A+Kd8Z8xyfYLHyEICayT7M4soNlgbKgGE2FPqAts
 9hc0NMKeKWHlVOU3DVGDemVn2Rvg4vVMUaL7AiapFGgV1scBnssc2Z5y/
 4O9A63crUv3BYdYpGxRRA7+j6snw0oKgP+HtHXhGj9+yIkqIAK8DTMYJS g==;
X-CSE-ConnectionGUID: pgT1EOl3QD2keOPp3OT+BQ==
X-CSE-MsgGUID: T3S66f7oQfm9mitbibZKSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78065664"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="78065664"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 20:17:54 -0800
X-CSE-ConnectionGUID: IFkaB8q8TNaysQiGgdCgRQ==
X-CSE-MsgGUID: VnhJHg9LTb2JFz5yVuNlpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194561186"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 20:17:55 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:17:53 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 20:17:53 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.68)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:17:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAjpOn31RyCXAtEm1V4QvMBRSP+KVA6ydEnP9WBm4tUdxws7YKQrwBLSKf7WON+RUr23QVSOkkJJMgvDdTq4G+bhNzl2iIN7NVmijxxIm0bhhDbZb0v8ZGI2TvobUabks480K5grNYRurD3B9rZwk7WmLM4V91WYMCfiVAWul7aAtS+ji7+YVO9tykL5ADs1sUgjL2I8Bi8R0zDkC6zUSw6i4vSYdGXhlinJ5ntvSf5ljGMwq7VzbyEnpz5NEYA8FP2ijsj8iGvN8ZaAtSDWjC5EfEeckon4rP2JleFru8+vwOyu0RS4DqzUUqW3WBkBXBcqJxAFRHziLK0R4aYIVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrJ5T/RiYxD1Y8ISH+iM4t+EKU+IdNGonZpo+YNvhMk=;
 b=lhyPGv8NnUmd3nfr/josUaENiaWM5PFPRoxFZqK4iVyDRezyJePSG35Zp9hcCyzEogLOrvQs4cF8YNrGWnCEnK80A1zXPAqBaC0P/TVnBkCCyFnn/kRq3EMtbiYaVnRinf+O8endbIT3pE3enTAcjUEcQCwnOVGcIw2CySLRprUaPyE2vAlsxtSQS65351CMReNKuGLZ8bD/XNxLl1qkzCYY6IVjcerQIEQs6Xv/daV91SjcpdHFo4Rv6/tFWvczYyoHWakASTqTqdqPqerZQUEnu2ypK/3VXoGAwwk+1cjb9UuUP2uXG1Wvij/Ipo7/BoancQjZ8DsY/PODVsV23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CH3PR11MB8545.namprd11.prod.outlook.com (2603:10b6:610:1bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 3 Dec
 2025 04:17:51 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 04:17:51 +0000
Date: Tue, 2 Dec 2025 20:17:48 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc
Message-ID: <aS-57K3sQXZqjuEC@nvishwa1-desk>
References: <20251203035800.1086089-2-niranjana.vishwanathapura@intel.com>
 <aS+48B53fgZG0JPL@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aS+48B53fgZG0JPL@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::8) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CH3PR11MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 7143b5b0-81df-4bce-8cfc-08de3222ecbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3j/6D6IIF4WFGiuNdM9Tx3XgZbZ0vCBu4F5Jh8sDNcYX8yKVdqFmhMOMK2pb?=
 =?us-ascii?Q?ffyAx1S4sbWoS2EdT57wg91AGxur9rcmBAWEUr/yImZNBIBvamxxxtzTwo0Q?=
 =?us-ascii?Q?R081kJPw4c6BAjqdSJ12LGdiB7Nzt7iz66Dy46CD05qzhDzK7pZM3dZK/QqE?=
 =?us-ascii?Q?B2MUqNhIZio+FI7wnJf/SLjOxeR56BSfUPp9ZhifB72xVhaOLzr9buDbuPvy?=
 =?us-ascii?Q?ielKkT7ZyubtpN7GSCrN9lT2UJlX1tOYdMdq1TTAKpQltqQzc4za4T7isfBi?=
 =?us-ascii?Q?luirgFeQCHel38JeYislfg6WI4r05faOTyFwz11zf2ff1imO3N24Hrw0NLgI?=
 =?us-ascii?Q?rNqsL4njJk7A63fZJkp0EZiBAWCqtgs+gQq3sf/GlGz98J9N4sCLyPxKjQAV?=
 =?us-ascii?Q?UqtqrVo01s/OEl+OYG+/N6wQk8f5KgTdO27yyJoQ7Vf4VjcBKA1qMwTzqsAl?=
 =?us-ascii?Q?mRiCkAmtvVf6yJwEgcFzUpUt8NtucnDOX72KhhhvS7V5WJ6Xq9kOWO5LKaR+?=
 =?us-ascii?Q?50JiHiVjP93i+mbGfF+DwhRKsjqj8Tj+ys6UJBpg2IVo58Y5Fx9IbsIyTx4a?=
 =?us-ascii?Q?FvgzorLBifKfo/ts0tWQppNCg2CtRAL5YaYrNEOs6ctx9BbbBobPW8cfxbeT?=
 =?us-ascii?Q?8brA3QYaZfm0MVzvGSWbHRIcp6zfHeKAawBGBuUhFfi/o/+p6SDYA4C3TBQn?=
 =?us-ascii?Q?3iLdDgiRiAzLzIlSaQZoWQO7Dfslqr2D22tI6eo88Mr+fPxusFcVPnjYOUSo?=
 =?us-ascii?Q?3sQzzFrKz2Eno/rrMn6la5HcB/c+YC9Scae/zZLIcObd3N878fYQOncMXpxY?=
 =?us-ascii?Q?ncbnSb5yRN7GT9Ojq90aNfYavM5JB7Gk+kPDCGjITm6bl6DP9vOzbVpAlwBR?=
 =?us-ascii?Q?GVvLAOtv2n8oRy8Ru1n4vbvgF02pC/19cgABqC+ZcKTWdFbMIMoaCHQ347IZ?=
 =?us-ascii?Q?hm5a30d++izqJiS2BgSzvy0ptWxV7OCcWvLY4fYWe9eXmPvWxLVNcbuF/+0U?=
 =?us-ascii?Q?fKYFOxjQIsKbDMG/WW17H4cF4tXx989e+Y+fhLF/8KNTkmGfhmHAfQKMQYGt?=
 =?us-ascii?Q?Q2f8uhp3rgdbqU08TWb2sVXgeVGF450IE4M5xTnAA2Ub0hgEXEaDGUF36K8M?=
 =?us-ascii?Q?O2hHX/xRJ3xiCjVIpQL7LIwXy06/4M/vB+doX6/YtCnMNVqi66mlIBhg/y0S?=
 =?us-ascii?Q?WjysoNIuWDNdw2hvB8hRGAKkrfwEo/sSYUS5o0ZSNXEyGZuixD7TCXZ9DIuC?=
 =?us-ascii?Q?LjmvdVhE9rzbiVMhM4/0rEVIUlprnf5RXjxNswHbTCkMe8PqyizgEe4HcNO+?=
 =?us-ascii?Q?xbGZaW1Igy4kamRP8RMPQCbqjKqn5xRdTTLN3YSVgH8X34WEicahahi/d3vE?=
 =?us-ascii?Q?0V8giWht0FYNj54SsIx4wF7/mRFuzWTj1vj9knHimwUIgfyogGgrGEFpqWwX?=
 =?us-ascii?Q?iU6hkSPlYxuu4JJQryGv+o2dRday28oy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YR5gE5EZXjY317gFIoJQ9U5MuFXyQ4tbJigr0emtODVQA61OfHEVwpCNQgpd?=
 =?us-ascii?Q?JBqb+PM4hKKecSNLArYSEGMSK+R8/hMoUQtEg6oxiX0rC+t1c/JZ9opKkFex?=
 =?us-ascii?Q?qr/fcEfNAYrd/tXIiVnBgbvPB+Yst6W85QPphmyiqbh3KgwliMKZnpIit6JO?=
 =?us-ascii?Q?kTwrvyt2knuqt9/l/+YySmPRo9TfmL94t4O6BFdahp2tUDzj7GweNNb/04r+?=
 =?us-ascii?Q?wNrzFebf91ljEQaT/ywO1bNcC/UOs/te537R2ANL6kvfXcp8ndKNMSQwQ7Qx?=
 =?us-ascii?Q?KkPNgMnhQQkgw1vQb9Yx5+YqkqY9N7jK9o2zbA5/TMHRRUTzvGl9uQNkmPjA?=
 =?us-ascii?Q?MV+91OORIGl9pRuPNVwE8YNMeBjyZVMVr/ElE4hk9+xPiOJjo7cfVnM/49vE?=
 =?us-ascii?Q?sTBuGDqpBuKA6oT6fDP48UhU6OFVFAZWU5BlKPHvkQ/EPn5Z+K/ZxEdFqGD8?=
 =?us-ascii?Q?QUvENjR9btCsCex0S2A6l5y2l3n4SGJeqY/B+qpEUn2LiqQqVXGTLpoRkclH?=
 =?us-ascii?Q?WVndNA20aCClVQDqaFxGoPgrzSlYtgyQZ3HqSiS+l4pey62yUYFKodSfkgTc?=
 =?us-ascii?Q?fEVVK6/LUiKDlW0zVb3BzZj9H/n3c1GlG/SQ/151wwNp5ZnD8zyvK+BZjg48?=
 =?us-ascii?Q?u1pI98aWCeABKlVHQuEcUZMC0/C96F+fOzI7c1IN6JalOFFGYGN9qed0HcFm?=
 =?us-ascii?Q?eoDVCDXjskDHaZHOm+Mgf8AEMq+LtA2wfIf195vncw59rZniH0d6FOkHUJqo?=
 =?us-ascii?Q?ZgLFBRMCG3oNezN9CJC9rfYUhkVV2IQrPXkCxr1B+vHmeJjfVWhZ84oWtH1Y?=
 =?us-ascii?Q?vmkTUuELeK3ZdTXM9PezN3q4mp4rI2PhnXxSs8x2+eoBpaAfTS9F64QJmzos?=
 =?us-ascii?Q?iH2Na/iG3zJPDqvZQdJOnKRPU+AuAPFQnKq25foiJfmM9eBD8npMcoG5iNwE?=
 =?us-ascii?Q?EHIS04rZeWmh2h2FnRljDROODPoZcJXAudqUtbH5R30aAaaAsvlwVAEXpGcB?=
 =?us-ascii?Q?tK9xjHj5F7MEEbjpBU3oSptBu024sl2jeduTqegQ1KyL8pWmGUEpTDxkeGbs?=
 =?us-ascii?Q?Bipe7+q97iASUkl4PvIm0igRiXelShYgAoNpRRegOuSlUGK4Ck4v7DVr0vBP?=
 =?us-ascii?Q?WIveDIPB4vL5y10iLJj0n27GSVNvhsnkibPnQHUnPGwrtHIfkBfA0vPopW2V?=
 =?us-ascii?Q?xzN/vyviSgPAuzoo/yO8UrnFJbNt7IkqsbTNtagXwp2OF4Zvjdcso/P8/BJY?=
 =?us-ascii?Q?YSiuyfwDiCbqlCtuFq+Gk1apfPnaRUSV71mhzkEhIKGW17ZH+CW5jZOUwJJS?=
 =?us-ascii?Q?o03yaW7qxx2qVE/gUCmgghmqHI8EUgcNRDQtYeT7ckAXEaVdlzwjW0OlKtN+?=
 =?us-ascii?Q?I63ityo7MyebYRe7r2e8BZCOtQ0oX88xs9iFTO5Gs5fFp/jhy3uv85ryPFP0?=
 =?us-ascii?Q?X9A9sf7+37YkfMu+eQwNa5B5qDCHYtKb9hm7Ph1+iPwnKDxqmx6tFVVdNSqd?=
 =?us-ascii?Q?zCUDrDFt2f7J9ZhWun2IxZue3o5pLSKS8/R6uAwvo6dPVIbMY7gOpimpJgND?=
 =?us-ascii?Q?v/Bi6sFseXZaWmLJ2OCgBpeBhxBEw/cIq9KPSUY714Jec7p2CLyIYvyK5Cvz?=
 =?us-ascii?Q?PegEcJGk0X27JTz1Zi+Xo/4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7143b5b0-81df-4bce-8cfc-08de3222ecbb
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 04:17:51.6660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNeR8kTQmGNs5LJbtw3DGqthEBh2zm567W2aFT4KKAIWNGpOZ1CN/PQQYXirly+6xViVrITZEo3ruHpmxRwKtS3cEy10zVHm8R/AJ0s6+MjpauMpwrMjZ0fcKe+Oil8j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8545
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

On Tue, Dec 02, 2025 at 08:13:36PM -0800, Matthew Brost wrote:
>On Tue, Dec 02, 2025 at 07:58:01PM -0800, Niranjana Vishwanathapura wrote:
>> The xe3p_xpc platform supports Indirect Ring State and
>> it is required for the upcoming multi-queue feature.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Just to confirm - in Xe2 we had hardwarwe issues with IRS, thus why we
>disabled it. IIRC the GuC eventually implemented a W/A and the HW should
>be fixed in Xe3. Can you confirm one these fixes is in xe3p_xpc?
>

I think the issue is fixed in HW for xe3p_xpc. The workaround is only
for xe2 platforms. Will check.

Niranjana

>If so:
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>> ---
>>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 75e3588242c7..fbee83dc347a 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -108,6 +108,7 @@ static const struct xe_graphics_desc graphics_xe2 = {
>>
>>  static const struct xe_graphics_desc graphics_xe3p_xpc = {
>>  	XE2_GFX_FEATURES,
>> +	.has_indirect_ring_state = 1,
>>  	.hw_engine_mask =
>>  		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
>>  		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
>> --
>> 2.43.0
>>
