Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37A8C6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 15:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AC510E539;
	Fri, 24 Mar 2023 15:56:25 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802CE10E539
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 15:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679673384; x=1711209384;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=y8RsJg46czK4YEXoMCuzNUrP2nu/e0C3XA5EPi+NOpw=;
 b=HgwZjhDJpSbtqoF47ORgok1vq1EZ9lVZL7QKywQcOUNeKOPg8j1fHVUx
 fqBy4q8XXnAgOtZpY+Ku8iMffiIbrZwIiu1mOaTrS/gijmhaBGz0N0voc
 EB0vPCQ3SbO1Sc9V6Dob6sNu9BamNqbk2ibEtAx9x5iajvYRTQJxtr2vM
 9/hxenO8PlmYGVJfAUbe4Zp6RvIhiDgmbEccwOo9s9eST4LcItV5yjjAf
 q35gkv5x13X+nzy654BtfR4jxw5fxGHuj8020O3oF5LGLA/ztorvYqm1w
 ePo3dtR5JrP7m+iAM3Z2Wl2uiP2YOWIPhmTwJ1mfloCtg4+OHa7L8b/xv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="323687192"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="323687192"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 08:56:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="856907373"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="856907373"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 24 Mar 2023 08:56:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:56:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 08:56:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 08:55:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aI2VwZryOjHwhy4Z33CsEjuqoNkhA9yzbQRRcGqAKQPkisT4oOwOiCX2fqluGp+/U1YzTvIRrc2mrTLDp3acY1ZZa2uoMHHmia8NOrKOT6iuCYM9ukfIe+4hKSyzGEbXUhPAqs6mBgMXSSjNoLXSm7p91a5X/fKkjRwsNQzIOv5HM1mqRHnsTqNt4wFVaFDaTjunqeKqokclo4+5ofHJERltgRsKGFrejCt58ixZQLCV8M+lhXFVEBrLrVl/6q1pU74D45Zjf74E9tpsLkRPkzJQ4uvNig7GvWLbbKhcYWgf1OU++lZ8H47B6CXe6quOP18uL/9DO9wjCPuK2NmRkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tx31D2hk5sDAklr79NWadoPswfCUshjTO70+QM+uYl4=;
 b=BNGCG3v/czWUUOC4/vWahAaK6LN/8jJCWCIpjzZ5CwU4GIG5npejBtXFQxah3X/VzzG/Mlq39nxJY4tyWeQ+vOAihoN1udoQ2s8jqJBLqMRSWxEMPtKUYlhBIFsc9oGEZfUa+779xqr+3lhUXmBz2f54K3fzBjn/HYjZVf4wEapGRhFrrgxbJjrDIqtfwWhzjSZZWcVJOZvgi6/Sz/+fyA6JL7GpDDPETL/7Cl2B2f7Pym+gNLiqcFkRmiSdf4gFwy0ZRp8kUiK6+/2UQtbO0coEjussqVSFtDqIXjE6MCX6jRHc/Qprfg0MJPWK/kbLhA93KSBWu81NSHy5cvbAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Fri, 24 Mar
 2023 15:55:54 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%4]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 15:55:54 +0000
Message-ID: <16fe2718-b2c5-170e-9419-ab5367e9b5ac@intel.com>
Date: Fri, 24 Mar 2023 17:53:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230323115926.391900-1-matthew.auld@intel.com>
 <20230323115926.391900-3-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230323115926.391900-3-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::11) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 289fdafc-e4b9-4226-9631-08db2c803f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ad63K0ms8VmPl1RJqlv2XkdyXaF5t17aO12yMAtvVW5vFaLV4xXJJxIARDvsF2wJjSXCFzO0c8GeXCWnhvg/fBsbriJRLSrQArhv1fSs6odtTV0iQ5rSdOw566KaN5a5LS+13Mhahpm6gBU7RgBRrDIwf6q75tilkFMwvoNTW81K28EE77TqPNATkSMVpulMJocSfLgsVT+CFr+vK1XtcSHpMf5zGjniVz5MGYwiJj+6Zq0fL2veEk0rFGc4EAOOXcNn17pJkPIdE7X+TRTS8Q75WC1zdC3Xfq8LfPabdgT1VyR3NdCT70CotmX357+cYsAZRzSitCxq7Q9BAA+pzIvudRQn/IMO8JIZgKjSBtf+S7qvyV6L/EbmQMU1qTLF82jDTIyv8l0IPt/zvvaGq/YOt9uOEJRZtcQ0bOM/VY3eJWpN0lvh4IC+VZ4D720qgG7tmoScAF5SfElTwiJlCt6yMe0SYIGrSLGRu1zMBjqt6OumG8vUnRFtr/aEQhyU/yiRB4TWD7pluiw6niBLP9aEFota3VwIALLDexW5ZuGNj+WEbDnYS/Xux2mYSBgxqNJiVxtK9xGI3/ppDf5QrfCXLXDH9P8bnBzFUdkNKRKh3yMyEmGELUHOD8hpIgkCFqw4ZsgDBSpL/2Ded673Jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199018)(38100700002)(82960400001)(66476007)(8676002)(66946007)(66556008)(186003)(26005)(6506007)(5660300002)(53546011)(2616005)(2906002)(6512007)(31686004)(6666004)(8936002)(41300700001)(86362001)(316002)(31696002)(6486002)(83380400001)(36756003)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3BadGIrS2NXL29aN2tvaVh4cWZwc3M2aHRtT01Xb0lyMXREWE5ZNFY4MVJG?=
 =?utf-8?B?Z0Q5L3dndFVRZ0tSdHVyY0FyRE5MdVZuMWFFUCt1bFB4cWpsZmhuVDQrN1lF?=
 =?utf-8?B?ZVd5YlJWckxqNjFPMmk4UGlaTDNQNkpuS1VZcFlDT3dMQllsa2dXSFk2M3VI?=
 =?utf-8?B?SHNJdVMxTFdOQy9EbndrTkI3MG9CalBzaitqTGxpN000d2Vsb1VtcGRQakE0?=
 =?utf-8?B?RVU3b09mUU9GVjM1S1k5MEVQYmVaTmI4bVpyd1lBWC9FVmRiL242MTBIRmFv?=
 =?utf-8?B?RmorZUNFcGhiRnNBOFZFYnV1WXZkT2RKSTNaSXFrVEJOUjlLM2VmRkxLUUR1?=
 =?utf-8?B?S1lwWGlmN0xLUTNYZEIrN3Z2VzY1c3dnNDlnV2ljRTdHK3ZTaWNNekV1LzIw?=
 =?utf-8?B?TE56QUFDb1l3UGVnekYvay8wK1lHNVE4M2RVM2pOd1UvYVVWM1VlOFRYekhz?=
 =?utf-8?B?MjNSU1RWcUMrRktValZUQWNpZ1VnNGJPTHNhU3VxM0ZlMEF2YWpMQ0NhdHhm?=
 =?utf-8?B?Z2x2Uzg5TFhDVXJxV2p6STlEYWtETUtEdDl6TmtmN0tTcHFXQmhPSHRRb2ZG?=
 =?utf-8?B?SXlhQnhEN1VrZzh0TEpKaUIyZ1h2Y2ovSStDb1Q1KzNIZHJ6OEo2RDdXL2VU?=
 =?utf-8?B?WVVEV24zWk9GaER3azNDdjhnUEQzWFpsWE93SXdJaWdaT0FXRzQ0WVJJdHhV?=
 =?utf-8?B?dS9xR21DQ1NWbXlrWUluMjdBRlB3UmdNMkFadXM5WnF5bUNPYkV4UGRrVHl2?=
 =?utf-8?B?eGlDbFplQlFtd1JpeGpPekx0MllZU3NWTmlZSVhVRlE2aDdxYjNpZG9xem82?=
 =?utf-8?B?OUZtTFZObFI3eWFhY3hmNmhqK0xPU2VDdTlERmFpd0tmaUtET0FTOUg0Q1NV?=
 =?utf-8?B?NmlIbHM2SlBmeHQyTzFHaUg3dEVGNytqTDdtYlIrb0piQjA4aCtub1lnbFg5?=
 =?utf-8?B?RjdPellaVUlza3pmZUMzMEM5UmlpQy9oRkhyL2hWYXJpcXJkQkJ4VmdlbTJP?=
 =?utf-8?B?M2h6OHNmVllYUGsxVHkyZEVoMmNXd3NsamZrQjdJVWJiSE9HaTF1WGM2Zjkr?=
 =?utf-8?B?NFhzYUh1dmhCcDJ5SkdJWHoyRHo0Rkc0R3VZQW40VGphVWt6eElpZnYvVXpp?=
 =?utf-8?B?Rlp0WStHTXhzMUIvcUtveEhLTnIxbWMxV0JYWTdRV2RXL2FTTldBNkxleUhn?=
 =?utf-8?B?VHpCa1l0UVpBczFOTkJlamNQenVoSEVSZklCVTlyaitKSDhSaEIrSXJvd3Va?=
 =?utf-8?B?d2l3MEgyLzFiSUErTEk5dENQSVUxMzBpUW5kMDROWkRpVGZxVEQ3Z2tWNGZC?=
 =?utf-8?B?YXZrakk1NCswRlIreitQY2FVSFo4NEtQdVFPRHk1c1F0a09EL2FmUi9ObHFK?=
 =?utf-8?B?aXg2YWtBRmtVMGZ3SmlYT0V0NWN2MDhoVElxQ3pVNTVMV0hHOVlsTklyNUJi?=
 =?utf-8?B?Sm1XdldwQlF6cnFNTFhQRm4yTS8vZHBITm40SFJWWGFaZXI4WEtDV3Z2b3hp?=
 =?utf-8?B?dVN3VlVqRE4ySWRNbFltVTJPaWppbi9TRk9XWnR3bnBlME9MNVhhMkFNNUxY?=
 =?utf-8?B?QXRZNVhPNkdWdmppS1VtUmhBZFdXa3RSMmxrdWxnMEQwWGxhcXNvV3ovcVhS?=
 =?utf-8?B?TlE2emhCeGkrc3JGbnJqYUdRODNIejB2VEJQNzBJMWhhRmpyMDJTaDd6VzlH?=
 =?utf-8?B?TjBKMlk4NzFkWnhFMXVGOWlhNnNRZXk5MzhCR0tTSVk4OXRWM2V3TWgxMDJO?=
 =?utf-8?B?NHR2Sm84NUZjdSs3dk5FZmhGUWF0bjhJb1JNdE1yRVZOL01RMFA4bFR6bE9Q?=
 =?utf-8?B?eHg2b0JYSUZyQXU0Skt3WDdtZUdkMS9BOXpmU3BIRUpUTGdxOWJPVG5JcXlO?=
 =?utf-8?B?YzVFUDhQKzFEaEYvMkxKUksvVVM2Qko3UCtkZzQvSnhWVzBGYUxoUEpYdC9t?=
 =?utf-8?B?V2xncE1wM3g0R09GK1E3ZWRIWUo1MnE3Q0xIWXZzQ2JqblhIaVd3K3NBSW16?=
 =?utf-8?B?ZURkS0Z1SW5ZVmNSZHlCVy9tcHlrQU9QOURNQWhyWlA1RSsvbFFCMjhWMHkr?=
 =?utf-8?B?QzBkQlVDQXN0czNpdEdDSXhEbmlKR1pqWmpzTTNGRmdEelVxekdVYjlFcHV3?=
 =?utf-8?B?bFh0Zm9JUFhCOWNVRnM5cnVkMkdmR3J1SGtOdXFIZlJWalNObnAzWjlhWnBh?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 289fdafc-e4b9-4226-9631-08db2c803f82
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 15:55:54.0248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4nJpyQsrPqaiAmLMbyDbMElpa4i81633vZb9I83BN/OhaL8ILjgG6aYWNp3zLhbglPOxwDzNmw1HfvQjebEaqwksWGbaECEhGxIKcWsx5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/6] drm/xe/bo: refactor try_add_vram
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

Looks good to me.
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 3/23/23 1:59 PM, Matthew Auld wrote:
> Get rid of some of the duplication here. In a future patch we need to
> also consider [fpfn, lpfn], so better adjust in only one place.
> 
> Suggested-by: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 86 ++++++++++++++------------------------
>   1 file changed, 31 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index af4200aa949f..1c8e0fbaf1df 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -93,55 +93,42 @@ static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
>   	}
>   }
>   
> -static void try_add_vram0(struct xe_device *xe, struct xe_bo *bo,
> -			  struct ttm_place *places, u32 bo_flags, u32 *c)
> +static void add_vram(struct xe_device *xe, struct xe_bo *bo,
> +		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
>   {
> -	struct xe_gt *gt;
> +	struct xe_gt *gt = mem_type_to_gt(xe, mem_type);
>   
> -	if (bo_flags & XE_BO_CREATE_VRAM0_BIT) {
> -		gt = mem_type_to_gt(xe, XE_PL_VRAM0);
> -		XE_BUG_ON(!gt->mem.vram.size);
> +	XE_BUG_ON(!gt->mem.vram.size);
>   
> -		places[*c] = (struct ttm_place) {
> -			.mem_type = XE_PL_VRAM0,
> -			/*
> -			 * For eviction / restore on suspend / resume objects
> -			 * pinned in VRAM must be contiguous
> -			 */
> -			.flags = bo_flags & (XE_BO_CREATE_PINNED_BIT |
> -					     XE_BO_CREATE_GGTT_BIT) ?
> -				TTM_PL_FLAG_CONTIGUOUS : 0,
> -		};
> -		*c += 1;
> +	places[*c] = (struct ttm_place) {
> +		.mem_type = mem_type,
> +		/*
> +		 * For eviction / restore on suspend / resume objects
> +		 * pinned in VRAM must be contiguous
> +		 */
> +		.flags = bo_flags & (XE_BO_CREATE_PINNED_BIT |
> +				     XE_BO_CREATE_GGTT_BIT) ?
> +			TTM_PL_FLAG_CONTIGUOUS : 0,
> +	};
> +	*c += 1;
>   
> -		if (bo->props.preferred_mem_type == XE_BO_PROPS_INVALID)
> -			bo->props.preferred_mem_type = XE_PL_VRAM0;
> -	}
> +	if (bo->props.preferred_mem_type == XE_BO_PROPS_INVALID)
> +		bo->props.preferred_mem_type = mem_type;
>   }
>   
> -static void try_add_vram1(struct xe_device *xe, struct xe_bo *bo,
> -			  struct ttm_place *places, u32 bo_flags, u32 *c)
> +static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
> +			 struct ttm_place *places, u32 bo_flags, u32 *c)
>   {
> -	struct xe_gt *gt;
> -
> -	if (bo_flags & XE_BO_CREATE_VRAM1_BIT) {
> -		gt = mem_type_to_gt(xe, XE_PL_VRAM1);
> -		XE_BUG_ON(!gt->mem.vram.size);
> -
> -		places[*c] = (struct ttm_place) {
> -			.mem_type = XE_PL_VRAM1,
> -			/*
> -			 * For eviction / restore on suspend / resume objects
> -			 * pinned in VRAM must be contiguous
> -			 */
> -			.flags = bo_flags & (XE_BO_CREATE_PINNED_BIT |
> -					     XE_BO_CREATE_GGTT_BIT) ?
> -				TTM_PL_FLAG_CONTIGUOUS : 0,
> -		};
> -		*c += 1;
> -
> -		if (bo->props.preferred_mem_type == XE_BO_PROPS_INVALID)
> -			bo->props.preferred_mem_type = XE_PL_VRAM1;
> +	if (bo->props.preferred_gt == XE_GT1) {
> +		if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
> +			add_vram(xe, bo, places, bo_flags, XE_PL_VRAM1, c);
> +		if (bo_flags & XE_BO_CREATE_VRAM0_BIT)
> +			add_vram(xe, bo, places, bo_flags, XE_PL_VRAM0, c);
> +	} else {
> +		if (bo_flags & XE_BO_CREATE_VRAM0_BIT)
> +			add_vram(xe, bo, places, bo_flags, XE_PL_VRAM0, c);
> +		if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
> +			add_vram(xe, bo, places, bo_flags, XE_PL_VRAM1, c);
>   	}
>   }
>   
> @@ -171,20 +158,9 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>   
>   	if (bo->props.preferred_mem_class == XE_MEM_REGION_CLASS_SYSMEM) {
>   		try_add_system(bo, places, bo_flags, &c);
> -		if (bo->props.preferred_gt == XE_GT1) {
> -			try_add_vram1(xe, bo, places, bo_flags, &c);
> -			try_add_vram0(xe, bo, places, bo_flags, &c);
> -		} else {
> -			try_add_vram0(xe, bo, places, bo_flags, &c);
> -			try_add_vram1(xe, bo, places, bo_flags, &c);
> -		}
> -	} else if (bo->props.preferred_gt == XE_GT1) {
> -		try_add_vram1(xe, bo, places, bo_flags, &c);
> -		try_add_vram0(xe, bo, places, bo_flags, &c);
> -		try_add_system(bo, places, bo_flags, &c);
> +		try_add_vram(xe, bo, places, bo_flags, &c);
>   	} else {
> -		try_add_vram0(xe, bo, places, bo_flags, &c);
> -		try_add_vram1(xe, bo, places, bo_flags, &c);
> +		try_add_vram(xe, bo, places, bo_flags, &c);
>   		try_add_system(bo, places, bo_flags, &c);
>   	}
>   	try_add_stolen(xe, bo, places, bo_flags, &c);
