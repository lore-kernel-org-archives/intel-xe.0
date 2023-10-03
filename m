Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62199E8FDBD
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 22:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2620910E052;
	Tue,  3 Oct 2023 22:31:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B759F10E052
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 22:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696372284; x=1727908284;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zOz63SIVrzqJqp8RiD4O6qEpLlCPo42YGRjMbW+SzAg=;
 b=a5XeJYkU9r6KRRmpIKYbIC8P/qB9mjG9b2zSkyerCYe3QiTGqur3ntst
 mk+DUV51fYkkp1bCvWIErUNocWgCq8q28184yqlJu/uVRjA30nzsafvN+
 KWDJUiqQ0MROntQNfp8nBHFTCas1sLFjWy9K1RMg/H2UWP+zUwBeRG3Yq
 Lqdeek+14hBCczGWPO/ja1jnP/OmfTUeA+W9y6m5wr/QurGhWpIS7XFes
 Kkolyu2ACg06CwU8xmi7UBAzKh37rnAO/bRt150olaMwHupyO4N+LNXPv
 257VOkSk2WhNTeyiNxPmVV+NBr1poE4hVyQNjlaD6+vk7kvAlW/9a8UO1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="449486651"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="449486651"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 15:31:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="700876183"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="700876183"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 15:31:24 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 15:31:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 15:31:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 15:31:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILmvZVxj+lVLdfGGkysTz73uC/aS07VV/txmXIk8KtY9GAdnAUd4zW3+vr1DjllLcLQF9S3Wc5U1CenjxRBX2L2AVAomwiPBnvjzGb1j85AOe/ycb0gSijk5cnflCf9fVRhd3zomZf8HBj0OgBD/fOiDwRpyGfez6az9Y0v8PPnV9rntRjcv5vCLuXOQ0dZ3XkJrqXl0fQ0uayjANLV6kP/AJPxb/dzx/bqMCwSfKE51PyjHXy20dunhTBh/tpe5qhqJ7vRcEW9ho4i8uCxIMvHb8Efib7d4y18FwWHtfo3BTKm6mphXNg+iAY6fUk8FTwMuIfvidag4ov1C3T2mmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suQGiPiYdvaA+ZgUysU1TqOPtGAxk3pn07JHt0Y4/zU=;
 b=SMVUxjgc/pARhG7OXZBIJBWNeeK79zgVguO8au60bdpFPm6JjDxUYImOcp17cBlbMtNw3D3SiItk9N774I6W+F2gjK9Huckn2lTFx142HiL1lNzWUjoQoHAscghv5DDDkpp9YoUb5JTRilrpR7BEWm0XXaqBnIjGUYwffVJwglBTjjn0OBiyUHULMKqM9gFz9j/JeyiZERQdIab6h/dNOglEF5emHVd9x2h+QcqFT3cy42SMOYoGvTcmI/TI40d6N/vfuaWLqyvrEX7lDCc2jCbYC2qBT+fIK1muK/SFpedsdjXrPD/ZbVYjWMdXjb3BHJweWVz9h7+G5DWq3ZeHRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by SN7PR11MB7668.namprd11.prod.outlook.com (2603:10b6:806:341::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Tue, 3 Oct
 2023 22:31:02 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::42c7:cd4a:ad29:f97c]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::42c7:cd4a:ad29:f97c%7]) with mapi id 15.20.6838.024; Tue, 3 Oct 2023
 22:31:01 +0000
Message-ID: <0e12970d-6581-0a49-4c0b-7888ced96bcb@intel.com>
Date: Wed, 4 Oct 2023 01:31:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-US
To: Matt Atwood <matthew.s.atwood@intel.com>,
 <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>
References: <20230414193355.143875-1-matthew.s.atwood@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20230414193355.143875-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::9) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|SN7PR11MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 93361199-159d-453e-50ba-08dbc4606c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: brgIb9rF572V9P29M02rSjZz8Vm/+DEXwVGf7C8QJxOv4qEeiljALU6Q2SSPT1BQqMlUBDhwZvjslZ6tHx0Nzucdaey0w6dZxgbIynhbjUF4f4tzJm7FhILNby6tBd7gWZlyJfU+2L213dTNDoFw/jYqmnYZD8W9KeA99M18xQs2s0q9jYJVWSdaEuLqBiQ3ntBGscnPro17YFRjoQ4bVmygR3IwbchrxVZjxW3qatEeccqW0bOCqEqGAF3cff3n6RZCarq84GwQxwtOzplfDCaMqcMtmgcfboQdW9BF+srpvmLTruqyZLlZt0tUXAS7JRYbAN1sRR56+qiJ2ILlegGbLvfOCs69G/j06jfsem/Z3T75cAG9iVNrplrU/jg7OGlsYbgoSCO8/uVzhgx+1ou/AHDoD8IdOEKjBgvZvDNU85NZedpU/bpVN2FjgVBwXzELV04PTeY2U8M1HlbsiswxyPjXbhjW4glKFTlcbwWS3gzTKT+ZkOAS3F+Loutp3vMLsGK0mO6D2PAbTaBOaOwUcSX9QN1eYmoGUN83VaK41PD4qyGtXHF5JVvbVXycsNmX3CDY/DOshoJl9tzLD1qxJ2WASrQwXESiIkwlZF9AfGlS3499nSLVVJ+SIBZb6D6IBEdEgyitaIhuufQYmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(39860400002)(376002)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6486002)(82960400001)(53546011)(6506007)(26005)(2616005)(6512007)(316002)(6636002)(5660300002)(38100700002)(2906002)(8676002)(66556008)(86362001)(66946007)(31696002)(41300700001)(8936002)(36756003)(66476007)(6666004)(478600001)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG9RVW94NU1iUUg1SEVmWm9wQXpmQnFkK2JGUVNoLzRhUE1NZVd5NFMzNmlo?=
 =?utf-8?B?aDYxMWhSQnJ4Q3dwci9VMnp6cExiZ3lMalBsMEt2c3FRVWN2VjBRVVpJOU1n?=
 =?utf-8?B?THcwSlFBbExMZ1hvSkY2VlZLNVg0TnBDUnN0ekVFdHdhdGg4SEsyQnRNNDRQ?=
 =?utf-8?B?ZHRMWVJ6QzY0aTlRd1ByRlVrbkM1YVhlRTZYakhpR3A0cDllb1UxZXBoenVD?=
 =?utf-8?B?WGxSTGltOHZJR2N2YUNMT3lwT3Z0VDVUUFk3Y091MjU4SkRIeTF5cHczS1Bj?=
 =?utf-8?B?b2xkT1o0NjdlQnViR1dHdUNJaVIvaDJydmp2TnptYTFCU2VZOUJiUFJNSHlx?=
 =?utf-8?B?OFdvbE95RlRLRGhkSXUrZlBXNTFRMkZraVpsVVpicHFVM2w1R3Z1Wkw3cDlF?=
 =?utf-8?B?VjVmRVBrVk1Lc2lZNnZJS1gxdWpleFNEYW9yOXY1Vko1UGNwS3pkWmRGM2ZL?=
 =?utf-8?B?L2lGdEt5cUZrRC9rWWZWcitQOUZvR0ZYbXV1NWM5Q3VhekRGcmNHTmxrTVJG?=
 =?utf-8?B?SnNiM3h2ZXVPTGRPVnJaZjFwUFJDejBvYi9SblZIdHVUY2djdVFNelZzdFJJ?=
 =?utf-8?B?TTlyN09wWmVBangxQTh2SEVRb1YvcnA5WDVsWmdvWXQ1Q05qaTRYU21mekl3?=
 =?utf-8?B?QUdFUUJ2ajVEcFAzNms4L1ZDcFJySGplMFNmQ3pWN3ZCRVVEZkJ3NmpHbEhn?=
 =?utf-8?B?UzFSNWFJMXQ5T0Q4VXI1ZllIcFplZi9uYUJHWkRVT0JwSkVGVHppcFdjTlQy?=
 =?utf-8?B?MzJGNW50QXVHWHhpZVVZQXBMY0didXdId2diSS9sWTRZMW04T1c3bWlmL1dF?=
 =?utf-8?B?bldiRXA5WGl5cUUzRGJCM243TUNQRCtkaFUxbDJhUFdUVCtFMElLd1ZqRnRG?=
 =?utf-8?B?RE5mcFJUZTRZeW9OWUM3azhxT3VvcmkyM0lFN0tIR2E0Z2RVTHNQTkM2SkI1?=
 =?utf-8?B?bFFtZnJOSXFySkpnNEY4TkhvRUZpa3hLVndqOUhGY09qdVQvUUNScFR5aGdM?=
 =?utf-8?B?eDV5ZmU1Z1dMSGgxNVpJUGhUSGVIWmY1ckZrbm43QURVS3FiN3IwVEp1ZTl4?=
 =?utf-8?B?QkJHQUhORnlTNktqYk1TUGxVVVZkNUd6TDFDQ0VKQ2FHdEJQTmZmWlplNG5C?=
 =?utf-8?B?aHRIanhMYW9zcWZpRlVpbnFNekhCTGVzZE1UTlp5WFVtMFVPZmV0VEJvclBT?=
 =?utf-8?B?dlFVUEZkeWNaZ1F2T0puNDFORXhEWU4zRDB3OEx6VzdzUno0YWpTU24xWTdt?=
 =?utf-8?B?ckRKRXAvTFNzSUpYUjJSQlZVOURlNGVxUGZ1bFV4aFBqakZUVnV1ZlRvcmFR?=
 =?utf-8?B?MUlicTdNcHppVzBLTGYySDJVaGlRRldSVURJZkIvUFJsYXNLbDNKZWg2dEFR?=
 =?utf-8?B?ZnRFVE0wM1pSQ2hLN2JwRk95MURxTEVpS3crNEpvZ0lqS1lkd3o0L085RG5Q?=
 =?utf-8?B?SjVBRmhQaDJqbGJOZjlkZFhYV3h2M1pjRm1iQlF3QS9XOGQ4WHlBWkM4TTNJ?=
 =?utf-8?B?V1ZFa29lWE13eFp4SUhNV0kyV0NQNWJwOTVrTmF5R0pXaGFUd2pVVTJ2MFVu?=
 =?utf-8?B?bkttV3l3bU50bm5ZU0xjNzZHWStBM29XaWcyRytVUTZQNFhaRDhlZlBsRjlv?=
 =?utf-8?B?T29yaXRCeU4ydzBZK3hWaW1PaUxzQnVKUGVCMnVSM1FjNzZJdkRVUEdPV2NR?=
 =?utf-8?B?emNaeUZueHNwUzRDdnlyZU9SMkNpaE1wRDJJbFJZVnMwSDVueG8wM2Naemtu?=
 =?utf-8?B?clFXSlNGMzRDNjhHT0RLamJSOW9mZVVrRGpRSW1vV1RtUTRKSlhvK0o3REVu?=
 =?utf-8?B?QjhiUHpGWlJPekZHMHFoNFBwTk9wcjM3Sy92dVlHL0E5alorR0FVbWxnZjRa?=
 =?utf-8?B?ZjYxL2Z1NDdSVmk4L282VjF5cjJEbnMwRzFBL2dpN29RWmQyNmZzeEtFWjh3?=
 =?utf-8?B?K2w1eGR3dGRwWk1ET3RMOHlJQUVyMithamMyVkJPazA0VnRBZmg5T0NGVEQ1?=
 =?utf-8?B?VkwrQ25nclg2SGkvVnRkb2lqQ2VGNEo0c0h4bEFjSGd2ejJZRXpJcHRDdXVM?=
 =?utf-8?B?N1hkZ1E5dkJPRHlkWGNhOU1oeXY0Q3E2UUZSU01reE9ORzhrYUY2bUpMemZW?=
 =?utf-8?B?cVVnY1BJQi93ckF1VHZsN3prZ1A2RkVJOUFpU1FXa0xBd01LSzU4Y3dNa3Ur?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93361199-159d-453e-50ba-08dbc4606c3b
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 22:31:01.6756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3kLothRvvheBqBBPt831bx6KfCB1yGp2ZNFwWoDC4uE1809pCZUraHQE39j2bObKBc4FnkSjmFaeYj0cErnelxxyS4+72A88xVKcjdd7No=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7668
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/: add gt tuning for indirect state
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

On 14/04/2023 22:33, Matt Atwood wrote:
> Force indirect state sampler data to only be in the dynamic state pool,
> which is more convienent for UMD. Behavior change mirrors windows
> behavior.
>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>

Thanks,

For Mesa :

Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>


> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>   drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
>   2 files changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index f174758d8307..b7324aede6b6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -286,6 +286,7 @@
>   #define   ENABLE_SMALLPL			REG_BIT(15)
>   #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>   #define   GEN11_SAMPLER_ENABLE_HEADLESS_MSG	REG_BIT(5)
> +#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
>   
>   #define GEN9_HALF_SLICE_CHICKEN7		MCR_REG(0xe194)
>   #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 27cf1330facd..5abef45a10fc 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -26,6 +26,11 @@ static const struct xe_rtp_entry gt_tunings[] = {
>   	  XE_RTP_RULES(PLATFORM(DG2)),
>   	  XE_RTP_ACTIONS(SET(XEHP_SQCM, EN_32B_ACCESS))
>   	},
> +	{ XE_RTP_NAME("Tuning: Set Indirect State Override"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, -1)),
> +	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
>   	{}
>   };
>   


