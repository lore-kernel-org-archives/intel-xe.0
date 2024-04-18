Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783C0C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 12:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A7F10FC35;
	Thu, 18 Apr 2024 12:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvNRNaMf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EED10FC35
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713442808; x=1744978808;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JClVLsh3g6aAseE19hemBT9olc8oSnWWCOZAdYxc1WI=;
 b=lvNRNaMfM/beDlQ6R6h8zpYmgHiqex1qzJxFZiAhUAFHUYynnbnLqw61
 sDrwD531oPlhAjkyr69QceaYsGmfjPfxyF+il87y6bFjxCap8lDchpCVi
 6H9laHKql0Hk7GDkjmTjwjaawmv9X+hrwKhLHum/ZwKEpgDXYrV0pNQmx
 afZWozlTM6R2pIFetxn2r1cKjCIkq4fIK3sXbMRiOUkgdXA5LfPqSkSjF
 dY9YU2BLtJJ6yU9s7tI33c5NQRTt9O38pbEyfPCAstDpVb0jrn79db0ov
 D/ibExryVPlEh+48/VJ+HXMd75UhVG4ZQrnmpK6IPU3j4wbRJXrLzSdIk A==;
X-CSE-ConnectionGUID: gLutiAmWSO2iJZEemvYKrA==
X-CSE-MsgGUID: F2MQ0478RyemmIYAO9LoeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8851393"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8851393"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 05:20:07 -0700
X-CSE-ConnectionGUID: WyKvMo6CS/u2a87w6yKhjg==
X-CSE-MsgGUID: s6Jao6UGRkG8pJsLcuUQTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="22992993"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 05:20:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 05:20:07 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 05:20:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 05:20:06 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 05:20:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OA7pmeSV5g0GPaNGcN61kde5FxRgMD88rNHtXwCglFLSZ1QuuVtK+pfvFJpozIQT2uvYSpzb8jS2QHS4XmU5k637YBbZ21w5CGEJGqCk4YkM+I05eR2CXFfnq3B9kuj9V9hRm87XHl0TNq6YwM73oNW5Sp/AHYJKF567uU2Ylp/SOtrsPsHeZAzn5Xh2YuXf5AXRNPV+hcSuSXtpJw5P9UoiItRaTBBeH5ZEf3DR+9Kt1uxfJGpKBnDqXEBLDMd7d/DmYpD2NS79g8rurRCo8EpnwxiiFmUtE3bVu++BzPOGyNlxb8iLBUe2FVEKuxmmuMH/24VPw22gQrEhjzRbJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcnLmJYb3w+Ar4rz9y+v4ZVhqLctnWj6AIW5HjgaPBM=;
 b=docO0uHuX9ZucJFkeUoCCd7BbdPPmmY2Mlf+5COHXcQ46DlR9DpBEVMSCbf1ydjCq7fVw/BUhKl00cWp3Hfg1l1DM8bXVq4c9O7W6Vcuad2wh94Rcobcr0YTMxTfFvGwI0gyaFxcTNoZ0xgGXaUSgjRfYqoRfcyWfIzPlB9/AqG4tJ/mRhv19t7noU2mwHPhk4NCooRV34LVuHVKGzJ38YZy1jxl1Iuyg3W4vSPqC7wo1RajqQrl+CKog+lpRS+JN4U7H1EWLr65D89XezMja6WgBJg1v4lgTLT3UTStkHIb9O3isM/NjMAn3e3Xo9PmulDRu+5LtmaSQgxUPcwr9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8592.namprd11.prod.outlook.com (2603:10b6:610:1b1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Thu, 18 Apr
 2024 12:20:04 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 12:20:04 +0000
Message-ID: <25e4de50-50e6-42ad-888a-591363ab64d5@intel.com>
Date: Thu, 18 Apr 2024 17:49:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe2: Add workaround 14021402888
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20240418111534.481568-1-krishnaiah.bommu@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240418111534.481568-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::31) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: 099f450f-ff7e-47ff-a3b7-08dc5fa1e08f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CbfKeZXvBCHAUwHQEb48BCK+5Dvp4yyb+wnlBpjllVLqzgSPcoJgUSdxLNejsjFFcw163kwoB0e/S6VqN5PbP8JTfABIkOi439jQEe8equuiWmdqGw017t3FaChhwMsAab7bCuLRCX41LSXUolL1ONTdTOvmwLJFeSyH6igO2yIRevG7PfokbBEvZoq2jiss5/PHxi/4qYT4UntjtgE6pB5KDyzS8rgWSOx240cd2A5N8uLIvm99AWYNtaN/t6z3cimGj9bumbNOVf5zzXvcC9r8YOx8US2O6FvFSGJJX6i8TO59l5Dtbp2s3Ecu0pkvslrdXfXwkQKS6RfEZFBpHhJsucJbDlCXUpCCkxv4G/MG4aPRhVpq488SqzG38IO7crKc2+XZHGnv6JFWH0MxTbB0Akt2QW+/NCrTMs7ms1pE/5B0Yd/1+EwL5JwVxLEUgYrqIXdD0jyND9A0bihgw65cfG1mznf2p3feCTYZsI6rlBxgtCZ070cMPjp5SlmACGlLYLuPjKvZUXBORn5ZYnsDAr0Y7xEa6fXQv4lbb6KZ723i+VMw7oxQoCeCpRLzKWofSXrEmT8qzJjkFsD4b6G1H+KeMJI/3V2ovYAstcPcWq3VGJK9zBlyTzyPwZUqt1iwl2gF3IKSsBCafkLxiuvRiipeA9yRcnZY7xLdVM8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OStxM3o3bmhTbmwwd1YvSFAxSk5YSU14VlNybkNkZzJ2T29PQWQzdlJmN2t4?=
 =?utf-8?B?WVFpWDZtK2hlbG4wb0RuYXJjVk9DRmhGLzZ2WlphWTFqbWtpdGIrdjlNWGlB?=
 =?utf-8?B?ZEpYcURISDBtRDE5TmtvTTVTTDBESGY0M1pyT2ZQT2NLZDdTZjJjWDIzSVNn?=
 =?utf-8?B?QUlETE94SWZ2NlhWWHJqazk4eFkvQTE3L3lPcGpHaDdhQnB1VW9aYkVmOW81?=
 =?utf-8?B?dEd0dDZYUFVDM2F2bkFlMVp5bWZzSUpzaDZYTlZYZk5YZnVCOGRnUy8vdXFk?=
 =?utf-8?B?RHJwNXZuSGkxTi9oVkhQYXUyNnRXS0dhUDZHL1FGTWNMNElzNWt4RlZ0aks5?=
 =?utf-8?B?SWdkVzZUVzBSelg1TEN3SG9vRFVBVnlnalR2MEtGVmpqejlTMkZpSzhnbDIy?=
 =?utf-8?B?ZHBMdWFkMHpoUEhsbFArdDJPT2dlMlhsTVRhNVFyK1JTZEw4SmxuM3hwUzFP?=
 =?utf-8?B?UXUvZlBOV285TkhVbVh4U3ZqK2h5TTR4Y2xkWUhLTVRueUN5SHZBUlREKzND?=
 =?utf-8?B?S3p3aTFXVEFwbzhuSi9XNlYySm9QQ0JrVXpHNVJmL2RmTmU4SElmdzd0dGkx?=
 =?utf-8?B?ZHpMYjRRM3hCbU1YdHQxbzFiWllhWC8wQnpFRExIY2hrL0lNcW1weEh5S2Iv?=
 =?utf-8?B?TVZyZ29RU3l0S2ZtdU5YeEUvdC9lWERDSW8zUHZCSEFmY3g4eUFnbkdoVlI2?=
 =?utf-8?B?cktScmQxa0tPK1d1ZEdDRjJVMEUyNG1uUUx1MVJPbjlpMG9lYndFUTMvR0tw?=
 =?utf-8?B?QnJxUjZoREUremkxS0pYMDNkWWFxL1FUMkRtcnJkbnJFVTdXM2JENDZaMmxo?=
 =?utf-8?B?ejZhM3RzRGl0aTJhNVpJazgvcjViQ0RFNVZiU09qS1YwYzRjVlZyVXIzdHJE?=
 =?utf-8?B?V2syYVJJMEhCVk1kRVJUMW41S2VzYWFqcjg3dTlydENsbUozTjZxMXIvQ2dl?=
 =?utf-8?B?SFo3TmdSVGhtZ21Sc3FiSHY1RUJsajFqNlZLbFRWQ1p0NXdJbmFGbVo2S3BQ?=
 =?utf-8?B?eXY1VDVOTWZUV1NYU3BUM1ptbGUzUE90SnNSOUdFbFhLbjBZZllyWjJacnd6?=
 =?utf-8?B?NkpNS2x2TFdYT3FRMVBrNTk1N01tODNHaW1EMTZrWVVXQ3VCdUJGaUhkbmxi?=
 =?utf-8?B?b3ZscFlHSUtDN0lVSk0rZVdtTUJrVkk4NmtHQngrS1lOSzdlUlBSQXdERyt4?=
 =?utf-8?B?dklMTEQzZUpNZTdOekxQbUNORU85RkN1RjBtcFhzU1J4cVVuUzh2VjNIczNn?=
 =?utf-8?B?RFVTazgrc0EzMGF5ZjQzd3I1NDJ3V0xOby9rT2EvdEhNNEJCNjlXLy9EOEVR?=
 =?utf-8?B?M1NhNExqMnhDNHFadDlkRk5NL2UwWTFWR2gyZ3hWNXd6L1lORkVlc3JsT04v?=
 =?utf-8?B?Yy9pR3Y5VVBqNlhIN3BmS1hSclRDampNaERZSXMraEJ5c0lYbGJOYWFlTUR5?=
 =?utf-8?B?TlVLY2c0OVFKdVBNZGlwU2E2NFppYzNQNmtEZTlUa3Q4SjR3Y3ZaYlF1M1o1?=
 =?utf-8?B?QVl5TmZrYWJ3UmFzVkdWM1dZWC93b1RSYjlSZzdQRnMwUWkyTnpURERlMVJ1?=
 =?utf-8?B?SnVqYnRHNmltK3BSN2sxTitzVE5EY2hDREtucWNGV0JDbU5qdlFRNi9HeW9v?=
 =?utf-8?B?SEhxYk9iMkJOTnVrWTVSSEwxcnRZa1V6K1VYWTBJTzgrczRkYm5mdG50N1U2?=
 =?utf-8?B?dy83UnJGNUNwaENRbzhscHc0QTlFOXpsTk15bHRIcU5XRkt0ZkRheFNZdDVq?=
 =?utf-8?B?R3lHSlZDeE0zM1JTUk5YU1FoM29XMHN0alNJaG01ZW9zNlRtTFQvOUoyekdo?=
 =?utf-8?B?K2VyUldOOWJ5My9rZHpUN0pqbFlyR2JJaU82SEZhWVNDMFhqVVJFOVR5ZkVT?=
 =?utf-8?B?OXhtZ0YwRTNOUUpTWFJGamR2ckxZdlJXaDlmNEthRUNHYTZiUkVkZEFsenpY?=
 =?utf-8?B?a1NhOS9nSDM2ODRIQUx1UkRON2ovSGN4eU93a1JEcW5DREJwYkxSd1dZSjdI?=
 =?utf-8?B?aHpkMEFNdTVVajNWMVFpMWQ0Z0ROeFBKUnAraDhGV2cyNit2SDAwMWtxS1Z2?=
 =?utf-8?B?WVcwcWVtTzJXYzZjL2RXaU8xRFg4ZFBaSjgxWFZlak1XMncyR0dIT2szUVRt?=
 =?utf-8?B?QXBuYmVJRk1USXJWZ0l1SXdocGduYWxKdjZaSFBKd3pUMElPVlN5S3M3dFlL?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 099f450f-ff7e-47ff-a3b7-08dc5fa1e08f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 12:20:04.4887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBb8mhB0NRRc2MMLjfi1ZCVAZN6hXaQLuTjB4e+ggBnVMSRW+CSk6ZMp+gHFfZubyJ1nrvmS1fLLstl31asn/CimdiJtPVicBp5bMUZESEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8592
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


On 18-04-2024 16:45, Bommu Krishnaiah wrote:
> This workaround applies to Graphics 20.01 as RCS engine workaround
>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>   drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>   2 files changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 94445810ccc9..23c302af4cd5 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -350,6 +350,7 @@
>   
>   #define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
>   #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
> +#define   CLEAR_OPTIMIZATION_DISABLE			REG_BIT(6)
>   
>   #define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
>   #define   DISABLE_ECC				REG_BIT(5)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 632bd9066f8d..31e140968f4a 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -534,6 +534,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>   		       FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
>   	},
> +	{ XE_RTP_NAME("14021402888"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
> +	},


LGTM.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   
>   	/* Xe2_HPM */
>   
