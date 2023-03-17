Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BA1C7618B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 11:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6F910E0F6;
	Fri, 17 Mar 2023 11:52:57 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C0710E0F6
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 11:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679053975; x=1710589975;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tKST9bOThjE1WIo5tLknw2CoaYCtOCxmb+NF7rvYPP4=;
 b=Z5qWipOM6iRqK27Eou2Y0JebjTnbNpZF1zFlWdYTKiraHiTjd5jM6bLt
 /6Ihh2mDEV5GYPZ45cY1G/WYbdheKXJHAK9SMokw/QUm6q+rOW5NDzgsW
 ejJzC0wnsWYDLjpkQjufh3yZqtKnj4TNK3Mxb5a01jhRjP8AjG8HavaKI
 yyhiY6Wigknl68k6Ax0cw/Ul3kErZRURMdeCpryYTYtk5wrKYfrGKjw4p
 MnF5HlOsUMQXRftP3nf3M14Qdn39SjbtkWXR1Oq84/hxiM0xuRmDZ+4t3
 j6L2IIhxMQQtXQKzIrWUVWGokEgP4GHmkDRMLe/KKPktza3CHaaKJEDpD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="317897450"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="317897450"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 04:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="790683114"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="790683114"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 17 Mar 2023 04:52:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 04:52:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 04:52:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 04:52:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5G6oxeSmVvFj2Z9a7eC7FBK1iQCLTtIhH2WsDHmk+2ha2R2NPm9043Ioyv2wL+OlZXOCX3sqUWyFaaQM2xH01nFdAXdrvzHHQ0svKqQZ6XKLOXjno8M6QwHmA4pAh9JFsYMdjpoxuZduDub7z+KQWYN66RM6eULRSnoEJmu5FvWx/L4QTbwosRFZbyp/hs8fSmVLQn2kIC5Fokp8IfyADW6zdUD3dGH4Cb2hf4a7C0d9IgxGOAFO5B2XhREENJIRLZGxtAcP/EzjKvHXoLnmok4hZCib2FhiLTiEiOJBiVGFnTwC9y05UEmpWzy/LU3lc5fyjPI2wOs0gbAwSM1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndPvv3guUojvYkayISxxv69B2whLUr07aBv2MxjliOw=;
 b=LAGR/jQssJq1+gVSuStMQCXJnMptGVgUVl+e1UL4XK1gRiDcfPT8ta07ELLLzHfin3B2ZbwT7sqB61Y7KSE5E3F/8uYQrkrc3ofzRulywzOlVvzZEKSNzGVhNybjwzKhO5tCQ8zuRfIaGBy1XvN0QqeWsh8dFI3BM3wLvn/z4TU3g/2UR42gz5zpOhVW4qSsx3E5jemm0vlgK7M9CEXyrGWtwVFMP44+6RNcTiFSN+S7+F8KaG1eqKoluLHYKIPvIG8y1GSNUMZTEjBe/3EfKhR0DT1VMqOUKUqh9aLdVY7+EEmS0J8NLTH1ZYVDkvrLexI69/HtrJGyTYoZ0+6bDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by MN2PR11MB4693.namprd11.prod.outlook.com (2603:10b6:208:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 11:52:51 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::de64:d1fd:cc87:a040]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::de64:d1fd:cc87:a040%7]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 11:52:51 +0000
Message-ID: <3f48da8f-7c9a-5cdc-f323-826a50f256ef@intel.com>
Date: Fri, 17 Mar 2023 13:52:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230314085842.134239-1-matthew.auld@intel.com>
 <20230314085842.134239-5-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230314085842.134239-5-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB6PR0202CA0039.eurprd02.prod.outlook.com
 (2603:10a6:4:a5::25) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|MN2PR11MB4693:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a13a0a-10de-4762-d206-08db26de2296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P586OObsWb7br5DPhfiFslLZfeNxdUBw9RSjzTHQwkHu+X/9NTVaS6sb55gnAlH9+QE/9j9WoHgS98R53kZXe0MsBRIgcgO2WqvCTXE2MUGFd4l4h9F2LHG3VhdjplsxEzOmEfIrnUnyCJvtHfGbIC5pKpk2kCnjQsj4zG1zuawKoMfHNY5/BjsO6EpwqP2UKx+4sBnRfoi9TZDjqXT1I1E0w6GK847n20jDC3OmEYN33oRH0jpOBiQOKoaurRRCBBl+Z0g5t14+RtAL7vC6iixE0tcJ29oH1FLKF7I2vWz2ULeSK/ee6i0IdFmD7RdEVp0ifKdDxMeLm0MJgJ2h44orQrPpneb5QINSy3/YoOmRsw6bqVrPzLMGv1CwyZD3S/641NIUBnmUFvE6/TA6PFbQ70s8Di05dusl3zfvmObIWwLrUPXO8QS7FrqvbpoUOOLLJ8DXu4XYkS2XKNn9BSQI5wYnciwINSvPuPPNQI0hhcC4kohgNdKlyisfJZm7BVrlcre1SpwyYZLmpN9aSGJHANjRVCZGpDZkWKO+ngG/EKC2KyTDXfuxdwAb/xmbLUagwP1os1h6l/6eRMcU5+n/kPaO6G+opy73ODf87aKMyJt/B8ANUeM3Yn00Bw3FQxVgxYLcV9TUSxwkNIxq8qYZ+JFO75k5GRtzbyM89d/30fJQM1CtVZ3K3l3T/yjER7EdqhJmCGvD8Eucbyzxr8F+taLX+o1Ajt8KzENvYzk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199018)(31696002)(38100700002)(82960400001)(36756003)(86362001)(4326008)(5660300002)(2906002)(8676002)(66476007)(66556008)(66946007)(8936002)(2616005)(186003)(83380400001)(316002)(6506007)(53546011)(6666004)(107886003)(26005)(6512007)(6486002)(41300700001)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGRiNStqTFhlajhVY1NqRUd2RWJxM2xGcXJ0SW44UTBRUE1xcWRxSFg0NXMz?=
 =?utf-8?B?d1JFOFh0M2xmcVZFeEZESUliWUxQRmJjYjlVRnpodTc3UjVROWkvWm9oUkRS?=
 =?utf-8?B?aTVDZmF0WCt0R29DaFNuaGN1TTVqVVVIZnhzdkFFWFRGQVEzdmJVSnFLaE1J?=
 =?utf-8?B?eWk4UDZzVEFXMXlObHoxTjhybUpNUUhDVVRmbFBEaHcvcGo0VTU3ZnZmbWMz?=
 =?utf-8?B?Q0VaZ1B6Szg4aG9vT2VDN3FaS1FjcGMvZlAramV4bXV4S1k1eTA5T2hWVWNu?=
 =?utf-8?B?T0tZb3R6SzlpaFE2bGxDT1ZDVVpCeVlVcE4yWFI1U0c4MnNoUDg2YmNDSzY0?=
 =?utf-8?B?ZHR4NFJJSTFSZFVJOVhHT0owZTdXWnlGSXFIK2xqM1FsdGZnWXZnU3cyTTBu?=
 =?utf-8?B?UFZ4QUZzR3pXaGQrWjV1dFFTeGZjWFpJQThjWHJCUHROUzN1Q1Z5cjNBNWh5?=
 =?utf-8?B?VnJJVXdNa09GZURkY1BQM3F5VWVlQ1IycDVFR0QzZkl4MzdnY1RwUDRzTU9E?=
 =?utf-8?B?dG4zc2h4VmpNYktibDhTUjFqakhlcmtnODQvaW9VWWFORStTUzM0clFrbUJ3?=
 =?utf-8?B?VVgwSWx1dFpRVElLQ2JJYlRzMjRQVXgvL1RzN1Y3ZE5OYlVBb2hPdVNJR0R6?=
 =?utf-8?B?YThadjdLVDJpbzVpOFp0Rm5YMzZZQ2lxTDhsSUdzRHZRNHJDOWlFcUJDZUdZ?=
 =?utf-8?B?UVRvSUFQRjVDMXhIQlRsSnpMSHB4TFVJM2VXdXRjbmFqRlVJc0RLL1J6QWtT?=
 =?utf-8?B?NDZtWUcvcXY4WTFIeHZ4UlZlamlrU1l0SHB1S1Q4UGU5RlA0RFdVOWxUZStB?=
 =?utf-8?B?eFJOK0FibU42V29nVXlyTjE2cmY4Z0NCanNGakgwNitiUGhVc2hPWlZwUW0r?=
 =?utf-8?B?UktSOHUyT1V1eW1FcUpiYVBSYm5yRzRRdnltQzhqd1N4cG1WUXZHdSsvQjRQ?=
 =?utf-8?B?b0JNdWNQVjBkcnRJeVIvK0RNRmZuNzBJN2tWWmNhN0x4UG1XZ1dpVmQ2dHZm?=
 =?utf-8?B?a0pZYzJpVk1hemJLMVZtbi94OEVOMU1jWnVRUXF5Ti9yR1ZhVXJCUWs5MTdt?=
 =?utf-8?B?V3YwdDVZMUZHV1duTnFSSnhLbGhMSGRpTGFUdzZnNEc4U1dlSnpyenhVakQ0?=
 =?utf-8?B?d3htVkpoKzIxalIwVlNOUndGcS96MWZiQTcyb0Zwa2ZSaWhaZm5KTGVNQllP?=
 =?utf-8?B?RklDdWFoVnZ3SGtrU09sdVNUY29idmlJNU1xRkdxSmRCTUF4WkNpakJEM2RD?=
 =?utf-8?B?cFhwN1ltQVI5RXFKNFNoQktHRDdpamxNcDFraFR0a3VHVnFzQ1YwVVEyRXVK?=
 =?utf-8?B?bGJwMjNHUEY0N3k1U0x1N3V6Ti9aM2tRSFg0cDBGNWJ1REdRNHJIRGhGRFVM?=
 =?utf-8?B?Wm9UT1ladUFKb1lZbzdTcUZYTWtiY1pScGtxT0hxN2NkYS9yWk91WHFldk1t?=
 =?utf-8?B?ZE53bkV2SUx1Rkg2dG14NzRlSk01Z1YwUHdvYUdNREJLa3BzOWxjRGxxZlQx?=
 =?utf-8?B?THltK0N3U2hFc2ZIL3lESGVLQUZuRXJBU1c3bHBuQ09pc1ZwZkJYNk9CMEJa?=
 =?utf-8?B?NDE1VjZtTVZkeFZrQ0ZHSW5FcTR1UlhDajBsdEc5MHpEL0J2UDVaT0MySzAx?=
 =?utf-8?B?cnNyaWpaQUpTamE5emJlbUM2S2Iwcm1NRWppRk01SUdONWpSdzlSV2lVM3Rp?=
 =?utf-8?B?VjRLZDlWa29yNXc1akFIZElVak5oaHJZbkdDNytqL2lQdWx5Y0t2ZFlySzRj?=
 =?utf-8?B?dXNJQ05zc3lPR0NXTzNEcDZhN0J3Q2pDNEhaS2dNUXVFQi9uempaM0RieVJt?=
 =?utf-8?B?TVRWcTRsRitROTRjRmNxVmpTbzEwdUNodzdudS9vckROTjAxRml1WnJiT0Ur?=
 =?utf-8?B?MHd1R1JEdFBpU21tWVhXZFFYaXI5M2VSMjRmcE5yTXY1b1JwbThyYTlQN0pZ?=
 =?utf-8?B?ZXdpblQ1eTRVa1JFa05nTTJpc2RiT2kxZDMzbzhvbk1XMVlFbnRnVDdKMjFt?=
 =?utf-8?B?SWdGb0xmdDVVWDFSSVRKOG0zUDhiRFNXbXhHVzVrcU5kTC82ZHV4NFNmK1Bj?=
 =?utf-8?B?Qmo2emxuZ1V2bTBVRE5MRmU4YisyczhxN1RXejM5UHp0N3NyaXJGNjlnV0hK?=
 =?utf-8?B?bERCQmQ2dUM4M25EL3lsYVF1TmcvdEpQVlp0eWNGNjJsc2F6bVBDSkowL3VM?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a13a0a-10de-4762-d206-08db26de2296
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 11:52:51.2335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ED8gIwpL34YEDIElq57MJVI9rMbiwr1DDLhEHq1O2lky5zD3BcfeYH2XOkFgPpgCm+9bZGpGtww9uRbWmwa/hAcshSHyAyCHyqAJoW6N0II=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 4/6] drm/xe/buddy: remove the virtualized
 start
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 3/14/23 10:58 AM, Matthew Auld wrote:
> Hopefully not needed anymore. We can add a .compatible() hook once we
> need to differentiate between mappable and non-mappable vram. If the
> allocation is not contiguous then the start value is kind of
> meaningless, so rather just mark as invalid.
> 
> In upstream, TTM wants to eventually remove the ttm_resource.start
> usage.
Hi Matt,
If there is a related rfc or discussion, could you please share a reference?
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c           |  6 ++++++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 29 ++++++++++++++--------------
>   2 files changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 73a7f2cd4ad8..346573f406c2 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -662,6 +662,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   				void *new_addr = gt->mem.vram.mapping +
>   					(new_mem->start << PAGE_SHIFT);
>   
> +				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
Are there really any use cases for moving to memory allocated with 
xe_ttm_gtt_mgr_func()?

Br,
G.G.
> +					ret = -EINVAL;
> +					xe_device_mem_access_put(xe);
> +					goto out;
> +				}
> +
>   				XE_BUG_ON(new_mem->start !=
>   					  bo->placements->fpfn);
>   
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 159ca7105df1..bafcadaed6b0 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -54,7 +54,6 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	struct xe_ttm_vram_mgr_resource *vres;
>   	u64 size, remaining_size, lpfn, fpfn;
>   	struct drm_buddy *mm = &mgr->mm;
> -	struct drm_buddy_block *block;
>   	unsigned long pages_per_block;
>   	int r;
>   
> @@ -186,24 +185,24 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   			list_splice_tail(trim_list, &vres->blocks);
>   	}
>   
> -	vres->base.start = 0;
> -	list_for_each_entry(block, &vres->blocks, link) {
> -		unsigned long start;
> +	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
> +	    xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
> +		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>   
> -		start = drm_buddy_block_offset(block) +
> -			drm_buddy_block_size(mm, block);
> -		start >>= PAGE_SHIFT;
> +	/*
> +	 * For some kernel objects we still rely on the start when io mapping
> +	 * the object.
> +	 */
> +	if (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) {
> +		struct drm_buddy_block *block = list_first_entry(&vres->blocks,
> +								 typeof(*block),
> +								 link);
>   
> -		if (start > PFN_UP(vres->base.size))
> -			start -= PFN_UP(vres->base.size);
> -		else
> -			start = 0;
> -		vres->base.start = max(vres->base.start, start);
> +		vres->base.start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
> +	} else {
> +		vres->base.start = XE_BO_INVALID_OFFSET;
>   	}
>   
> -	if (xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
> -		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
> -
>   	*res = &vres->base;
>   	return 0;
>   
