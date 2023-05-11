Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6D7C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 19:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B70C10E5D8;
	Thu, 11 May 2023 19:36:11 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E84F10E5D8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 19:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683833770; x=1715369770;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ayisKHBGPKDxcbO6k2NcFthoK5DnZHamFfC7Oh/tZAI=;
 b=YGGOTOuDJJjtvSw+rIP+5By41JqLgV0tLLkia4RQoe7U236j7pmB9cvj
 DIIEs81jZgcCRoOY5CiEFGA0HJW5FPpn9WZTTiOiMarO1SnwiAzOb7WUC
 Le7ZbL4w9SU2/Vv3rxLJ6ezXLfaEhZdXAc09FwsGc/VSq5y/XTn3WVtG8
 gIhVyDJFvObP46i+JtAg4VhMSuFPPLmPp7Ujxv5dc2iXSgOxR6K5ayUuo
 +urB8MmvFUBr7lUG8YaNuLzn4js/B2KSVWd/gugn0ZpIdPRXcOKrVTTGi
 a4roHlAMIlfDXtAUcrUwvpt+XHBI5r+ttocmn3cKAuq29FlShiE2OrvyU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="335122229"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="335122229"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 12:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="844107756"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="844107756"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 11 May 2023 12:34:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 12:34:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 12:34:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 12:34:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wwin1ogDe3VrJVfd6JUknDAJD1QBpWBMi9bbQFrf+VUAPpZuNiE/SqR6+9eV5M736HPw+ZLnqdV9h1GkkS1dtNQysoBMH5Qh2UZ16965hNzC43uqQ/4WGtv2KkOnwF4tlxTEJH/dvaaqEdAf2oAgfOLp5kBN37rW47wlcb0dfB8VKMiBhBc8dzt7GiweGwQwYWsyHpAvIEEuoDZ3kyjOT1VV56rrR+sWdwVM0Y2nNHSMKvMFcLtpuOtVp9V8wmJFBI0gLBRR/66kClbFKTeRRNUM6d5Hfkje6FXxIoP7/hlZDDV2ZNDO/8Td7mtj6QD9klL3UwcxZRoIgnuHlhl5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WSoqF4cqnYHYOmiLvX0CwYKJV6k/K8H5Vk9AjfprBQ=;
 b=PmUMQ/FkUrgzoan4dqXU+Ju8Y0lOKzsyDeYGE2o6v7tot84w8QD2oI3gvpmgCz8HjXXD7P43yusyxEKfqIw3uihLBbZAWrhEO8zA/zgx6HNIqN380X96lbwh6HxMzWKF30Iy63G3IoU+bs4o1ke7wsC0PYx/FizACpMZA4Oqrju88vV29GeDiICsDL0WrqE5ifom/1JYOUW++LM/TXPUd+2dXEIVPd5b7ZRGsex2JjUEc0nxy/w/0+btVg9M8YMRnced82+DHEJDEEp8Sp1aEiujyKkkFV/Yg6a+HDn2uoT97FqgVJ9SOlOe7FJv5OGMxzN/gS7tAjTwLhSbWzMVBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 19:34:09 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b%4]) with mapi id 15.20.6387.019; Thu, 11 May 2023
 19:34:09 +0000
Date: Thu, 11 May 2023 12:34:05 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZF1DLbzdirUOFwiG@msatwood-mobl>
References: <20230511192015.1816-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230511192015.1816-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::46) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|IA0PR11MB7185:EE_
X-MS-Office365-Filtering-Correlation-Id: 579b71b0-f778-414f-1131-08db5256b0e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: giph08eggvFI78jgADtcFyI0/WNDtFU8QN206MlJcix1uMkhY7gZ/3AwMVFMYynpUOc/u+RQpKVijiPyjFG7FJAppXv+d0diA9OHv/L7WXbHtbwFbc2TIIcfXYpaAqXgpdkHjjbanbaMocYcM42X9olQZ5xXwvzubxwojD7hvOqemWPvgMjaXzczYwp6bClFED6R1YgCCA5iFlGrUJDZCX/+5s2fmEXTj9vswRh+GjuRIzo/9Mjw1/FXC/z59BWuB/lPeaw/hXPo8dHBKWNP1Hq8omuZOlgH3nHysVEqEqVwTShBSCVBCW7AJbZCrrymqFsReTtJvu5qSlicGepTU81dwQQiCD1DN99HXXSCimaag1tkpQ56l1zFJVy9IlGlJABmD8p/AFmIjs8YSWUA9yqnwU74mXl3pwk4boHyT5eE4guwkg+sknt7WUpfveSpdFp/4QUvL5E0+eMvITApLMDKbsTOb9dv57/+0DmY+IBn5ldoMo3tv5T0+lzzN6FzMR1YlTtYQtk51zx/W3mOpIs+Z42eSE3eFT3DhxZ1Qo7EUBLyLJHsMbHp2ni+ncUu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(366004)(396003)(136003)(376002)(39860400002)(451199021)(6486002)(8936002)(6666004)(66946007)(82960400001)(2906002)(26005)(33716001)(66476007)(41300700001)(86362001)(38100700002)(316002)(8676002)(5660300002)(4326008)(66556008)(478600001)(6506007)(9686003)(6512007)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjRHUGJIb3RocGFMRlEvUUczdVpTWEo1NEd2eXpZUFc4WDNRejZFa1Uza1lw?=
 =?utf-8?B?K0lleXBYcFJWSm85NXFDbm5Wc2cycmwrNGFqMS9Zc0RmMHVnSEhycFlQMm53?=
 =?utf-8?B?QmRLY2h6cytieENYNFU3eE9QaFIzUHczSysvaFZSVEE2azE1V2hmOTBxL0dJ?=
 =?utf-8?B?aVBqc2lOYXlENmY1dHFIYlFOZzROWXNhNmdRc2pjcmVjdDIrZFVyRUhrS0ZG?=
 =?utf-8?B?OXZ1SDBEZGVaNU1KZFk2d3RhWm44blB4YldMeUsxSmJ0a2s0dVBkOEltUFZU?=
 =?utf-8?B?RVN1Vlc1VnM3dm9HNEExN3kyQi9xa1hxTnloSVZBUUl4WCtYSFVadXhZRXVR?=
 =?utf-8?B?U0Y4ajNFV1JTYUZucGJyR3FzM0cxd3BDY3JEQ2pyOWhRWFJLZ2p5cloyak1B?=
 =?utf-8?B?ZkFEaDFPWjIvamdTa3BtY0lkU3BpY1RWVXZrNFM3ZlVwZUtocTR4UlVndTdX?=
 =?utf-8?B?WGN2ZG5aRm04UGdscUp6elUzNDBYMUo1ZVM4dlB0cDRYMXRGaUs0cDVmY0dl?=
 =?utf-8?B?OERaSitQZFRQVktkVHh0SHFZTFV4NEVKWjh4d1ljRGlNb1hkblhReHEzTjhX?=
 =?utf-8?B?RkZhWlQ5VzBDcU92T0syVjdOUFNiN0Y0blVselgweVBKdFJDNVdrYVV0amhO?=
 =?utf-8?B?cFBHZGVRaDZMOTNjQ0hWK2RhT2VVVk9WaXVzSW5PKzkyTndQdUxmVFI5VzJV?=
 =?utf-8?B?MUlHMUZwTG1MbUV5MERDZThITUNrb2NEZGFObFJYKzRPQXVrKzZLRkJSc2ZJ?=
 =?utf-8?B?c2hIOVgydERDdnpETzlWa0pGOFhoMnhzQ2V0WHZYcTNDaTF3ZE1ZclZRdWdN?=
 =?utf-8?B?ZTBkQVFzMzZGSy80SVFGd2J6NS9LYjdFekYwN09zU3F6Sy9PVC9teFNFVE0v?=
 =?utf-8?B?N0ZZQ2JDOVgyeXRFVGQyMjFiVks0VU4xMS91RGkydlI2N2RnN1lyaVBlU3J0?=
 =?utf-8?B?ZThmaTdNQ0s5enA2OWpqdHMxY205TkhkclpkYjRUMXcwdWRxaGRxRGFmREoy?=
 =?utf-8?B?aVA0V2w1YkdqMmJkTTZrdDYxeFliUUNMS3BUOHBkRzZNYW0rT2pyRjZGbkdJ?=
 =?utf-8?B?UW5vKzZGekZsTG8xKzVUby9hellMdE5LdHpDSmdIbldTZ1lUc3VDY0tvd1JE?=
 =?utf-8?B?Vzh3YkVhbjBKdGJKd3IrVUNCbmo3NzhnUHREMFdFZk0veThLbXAvcnVQMFV2?=
 =?utf-8?B?a29MNlVQRHRLL2JSZ0JPRHl4RzRqbHBEZ1BEelBYb2ZDSDUyZjA4cWJlNENU?=
 =?utf-8?B?eFRmRTIzRXpQVUluZkhmS21JYWEwNDJvVUUyVU5mL1NVQWI4R3pGR2ZMdnVz?=
 =?utf-8?B?V0lHbkpJM20zeWpDczdXQVRYb1dob1ZRV1cwb0tLQk9RdDFvTk94K1Yycno0?=
 =?utf-8?B?cGE5dy9DR3NNVDhMejV0Q3puSW5ndTVVSXlrUElPbkxIUDFXdlRRalVJdmtM?=
 =?utf-8?B?NUY4bExwOC96VFJ4ajhoQ1BGQlJ4a2pIM0pLbWl2UEZ6Z0grWUNQZkY4NUpl?=
 =?utf-8?B?ZUErSzRTdWF1cllKSllWRitIbDNSWmJmSXpON25EK0JsRHczTkt3d3hHRElK?=
 =?utf-8?B?cjl0cit4bU5ydFdRMXp3bWIrQWY5cDlnMTYyZys2RXp5YXh1MGl6REJ2bG5z?=
 =?utf-8?B?RHhGUndMM1d4MW1aVFN1OFFHWVkra1kzcHQ1Q2dZVE9hT2xqV0JCWFVuNlVY?=
 =?utf-8?B?OGFRTGVJWWVSaVo3NmNmampobzREdkVpc3BDbCtMcy8zRzByR2FaM2szdjVu?=
 =?utf-8?B?VG9ldzRsaElKejZURXlTaGZ4NkxHdEtua0lqWUhoRk9GdTd1U0xGZDFaSDlP?=
 =?utf-8?B?VUZjNzZUM3A2a3UvemIyWmhuV1R1QUVWVWFlMi95eVBxc0NqbDlFSUh2K045?=
 =?utf-8?B?Ukx1VWM4OWhBZ2ZtM1NRWFVPRmJxYzBrTjlQUlJYTXdkVDVnMGp2MUVLNWpE?=
 =?utf-8?B?a2YzcG9wZzFIZ2ZJNmNiSVF0OElxMExYRTN1UmlWVnQ5Vklrcm96R1cvTUlm?=
 =?utf-8?B?OGVLSXRaVGllVVI2WlI0emI1MnFyQ3IyY28ydkRVMEo0UVB0Z3M5OWhmYkZF?=
 =?utf-8?B?U2JqL2RodXI3ZEo1NzEwemxKdEVHV0pMbTI4NS83NU51dmExK2thR25ZckdY?=
 =?utf-8?B?ZDY0L2NDOUFIYjZZWXd5c0FLQlFLWFA3eW0vbFEzRmk5YTdZSXdPNzFYSjBH?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 579b71b0-f778-414f-1131-08db5256b0e5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 19:34:09.5879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fi54Mempe4YA23GQqm5r5VATbPQP2dlgBuRoykO/loAB6AxO/+0stNU199XKvTJk9Zkb7whGXPcXH51/BqDjvcI/LFBk2q55msv1euyJGeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7185
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Move Media GuC register definition
 to proper header
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 11, 2023 at 09:20:15PM +0200, Michal Wajdeczko wrote:
> All register definitions shall be kept in dedicated regs.h files,
> not defined locally in .c files. While at it, rename it to match
> name from the Bspec.
> 
Bspec: 63363
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 2 ++
>  drivers/gpu/drm/xe/xe_guc.c           | 4 +---
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 37e0ac550931..01a8b0679679 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -122,6 +122,8 @@ struct guc_doorbell_info {
>  #define MED_VF_SW_FLAG(n)			XE_REG(0x190310 + (n) * 4)
>  #define MED_VF_SW_FLAG_COUNT			4
>  
> +#define MED_GUC_HOST_INTERRUPT			XE_REG(0x190304)
> +
>  /* GuC Interrupt Vector */
>  #define GUC_INTR_GUC2HOST			BIT(15)
>  #define GUC_INTR_EXEC_ERROR			BIT(14)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index eb4af4c71124..18bce8c1fbf7 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -22,8 +22,6 @@
>  #include "xe_uc_fw.h"
>  #include "xe_wopcm.h"
>  
> -#define MEDIA_GUC_HOST_INTERRUPT        XE_REG(0x190304)
> -
>  static struct xe_gt *
>  guc_to_gt(struct xe_guc *guc)
>  {
> @@ -268,7 +266,7 @@ int xe_guc_init(struct xe_guc *guc)
>  	guc_init_params(guc);
>  
>  	if (xe_gt_is_media_type(gt))
> -		guc->notify_reg = MEDIA_GUC_HOST_INTERRUPT;
> +		guc->notify_reg = MED_GUC_HOST_INTERRUPT;
>  	else
>  		guc->notify_reg = GUC_HOST_INTERRUPT;
>  
> -- 
> 2.25.1
> 
