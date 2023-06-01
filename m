Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752F8C77B73
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 00:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AD210E0EE;
	Thu,  1 Jun 2023 00:35:10 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFD010E1F7
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 00:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685579707; x=1717115707;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2pGjUGWPuSjyA4OVzhnbyqLqfcLi+ShAXtJrU2ql7xg=;
 b=VsvqOrOOuE4a1VCX7ws18mEVCmXr/ONS0WY7JnjGfnIoG+bk4+lAVCN3
 niNRcqk5Ml98GDoLDKS7+vT1rXcHuPah4GVKeyZC0Ej9oodaocKq6aC4O
 WzPxbpG/2E4GNg5HF10rwHoOYKBoYErOP/sfDe/b+qFJcOTzB95PaE+tR
 WIlNCrTNMnbexlBi74XNxMDFC+92W+XqA41h7b23JiJyC4VNZ+hnQuLyh
 dCC4Fu3wV2dI0Nf2C7BYF4vz3Tr1Kj30WDJkwNr7yRQEJVgv0EQ0DkUKM
 MAHHbEafvlCsYK0IL7AnwJM0MIdOY488uxz9Uh42yjWlKPJ2xTYgxAGHX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="357804825"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="357804825"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="819535047"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="819535047"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 31 May 2023 17:35:03 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 17:34:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 17:34:54 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 17:34:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BclLrnKEq9f+tOhDf5ryUSQctUjZlwm7qrtEaj/opkVcPEGRSKmLEzY8bROEN3Cqil+31NaoZH12Jjf5d0XYBZeJCqW3Sv1FTm7yaJr6uKqPO2GHApVon3H3QVi38Q0JDeRtPIxB8iNxCFIV8fI5gowIL36onRSckdha9jFbmhYZ8EoN1/ohPISEv7eyFII1oQA0jgaeEsgjTIo+teTNuw9MRARzTfqXDoWkjJi4/iZhvJyOfXOeQFoBRI3m9ic7x+XNCfvfnE20MAWtFAxJK3udzn9m6iFUdlullLd+jpwGeSV/w+0+d2vr57KJlE8ba9IvyouK2kAphEU8VkM0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mWxuuKw2LemQrHvYhos5SwVlCbs2/95OwQ8y8l8bWk=;
 b=NaKIqSTlQpjXWAKXNeWC1nPvW20MHJF3WvHncECamakJU/5povWb95VpoPvtT0FglOwPn9O1D2XQ/LsoR2D2h2dXy6ddl9cYXAJW8Wl022EKyI+0CDuO+EjVT9FBK/SB/B5xjwiteykTJo6G8/HzENA/GEN3KOhzZjC5eeL86iIaBSMh+//9DPh9OYwdgacEh0Mxx+OJU9d8tUbVJRbq9Ad8d4n2XYNKfKNK1/Syi5yJUBfyKD2ectQuWrVYyFdj1+5W6VfqeiZ7QPRbOrfrNeHmPGBKnGkjctRzjgkcvU0V4fT0HVCwYNv3cNHI08YK/vCfzLctx4d2LhMdlnr6AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by BN9PR11MB5307.namprd11.prod.outlook.com (2603:10b6:408:118::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 00:34:51 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7fc1:e8a4:1646:c9f8]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7fc1:e8a4:1646:c9f8%5]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 00:34:51 +0000
Message-ID: <1ddaea08-ed16-9cab-c8f3-b1222787722e@intel.com>
Date: Wed, 31 May 2023 17:34:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
 <20230601000403.432517-30-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20230601000403.432517-30-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::24) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|BN9PR11MB5307:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b8c4fb-8197-45c6-2662-08db6238028d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P8MpUbnlHBPkFyuAlVNKwPKSrPLxKpoCvPIzv+5BwEsOn9KpXhdQGhlgfn2YlstHJkvFIK9gezocqDNbYhdgBxnv4a0j2qxxRiQAsbwIthWA72Y5vnGeG1cRT4ZAcfdqLFJzVaf1cOAQXU3jHZ7xH7ZZBZurEtbdxpiejiJ1bftEUAuONGhQUmZY83BUG9YkfDyraz047TzLgWs68OVio3j6z0HdGQeMgYuBckadfLaqfAWQnP3BGL22UAMFcLWhlVdb3scjrA2nyBhgOdUFBnJx8EsEUsIUdJJWVQgPNcn8HYoIiShn/mkj8pPK4GNQMGZCVbQ/t/Mi2XMaiCvCLPMMNv42tdgftcPSrwqll1a7fJa4jOZk8IVQuTFIz2Fs8LX7P/Hkejsm9gf5MtiUQ8Gym6OLHWuMLpzyzjNdeSk9Ddgv657wwlpDi2wvgDjY1sHKR08TsCwaAfpl7LuMjlcU/DDyx1aqn9sII9p4YKmlqmGRJI4NiphtHzDlCPUDnrE/6qUqCs14Aeroh34trd6XZOGhAO+fX/AX3dnmaTERN+X4ts8iILGVA/uUICtEONxm05W07bfWYHHoODiGftiinMedZbJY/JM7eQ2GFby3IFwN0EInaIwZzy1gnaLxvlnsqECd/8K931+G9Mj28ah4bDDYpI2dQKcKDNVKkXA87cIxQpcfV44WjFI7ABU5n/+jv4d15b1FiS19IoTqgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199021)(6486002)(31696002)(86362001)(41300700001)(478600001)(6666004)(316002)(66946007)(36756003)(66556008)(66476007)(15650500001)(5660300002)(31686004)(2906002)(186003)(6506007)(53546011)(6512007)(26005)(83380400001)(38100700002)(82960400001)(8936002)(2616005)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UldzemNvbVV0QjBFOENSbExId1QwaUZPQ01qT1hhaHU2RTZYT0FjY3NhTThQ?=
 =?utf-8?B?Zlc2MVVhMWJOcm9ORlFDUmcrUmlFbGdQaG52VWFVdVRMY3JHNGw2TjJPN0xK?=
 =?utf-8?B?UFFwUysrUW9nckRwS2g3L0Y2Vk8zTGY2bnJ1WnVWK1lWYVJVajZwa0VGT29K?=
 =?utf-8?B?TlQ1bHVkMnN1d2JNYnViRW5IS2tYdDB5RXVVTkRaSFUrNEQ3cmdXZFZPVXpl?=
 =?utf-8?B?bURJUDgrWEpwcXdPaHZvazkyZXFpa0orK09idnVzYUt6amNRYW5DWmJMZmNp?=
 =?utf-8?B?QVJ6NW0wcVFsMUJSUG1zcGZrVVRPcFNZUG5zSjkzRjNXVVd5QVVtQVJmbHBG?=
 =?utf-8?B?bEk4T1dpMWFZdTl0THFGNjNkZzUrTFJ0MGltT2g1SHB4dm1laFBGcmJFSnds?=
 =?utf-8?B?SXhQanFZT2NidjVncnB2ZUIyd3Z3WkRiUEI5ZHpaZW0wMU9udndnL0c2emNo?=
 =?utf-8?B?V1R3Nlk2NmxBVzZHVm92UGRYK2ZBTjRBR3ZmK1pQUHNMUFBYY3BCVld6c1dU?=
 =?utf-8?B?dnk4Tlp3elVieTVEU0lsS2paZ1JuV0xzRmwzYkU0czNudUZDVmFKZG1xZ2JH?=
 =?utf-8?B?dkEwN1ZqWVBPeHNHcHdZbll4aU1yUnNjSC9LMW1aM1NNbVJOOGJUTGlZeFVm?=
 =?utf-8?B?T3hQQkxsQTFYUUZwMWtQMjYzdFFVTUx0TjdyK1FjNytMbkRqSWRpcGxGV21X?=
 =?utf-8?B?NXkvOWp6ZVBlcVZrZUozaHNwSmtEZkFqQ2x1eGlQK2Z5Sjcvaitmd2xOWEor?=
 =?utf-8?B?d0JzdXFIci83azVaN2lvM01LQVhONTd0WU1Uc2ozVVFEYmJhc016MEo0eWZs?=
 =?utf-8?B?eGtxYWhuS0RwTGlSK1gvL0ZyTmtaVlg0aXpwamRoVHdXcXdXM1dycyt4S082?=
 =?utf-8?B?aUVUWGNxbUdoLzZpcHFoRjNmZWs1dVhIOVFCMllVTy85QVZ1dk05YzdNRzk1?=
 =?utf-8?B?MWtBTEtadTIrR1RXdzl4NU5oelc1Z1Nlb2NwTjRJRS9hTEkwRzR5ZkxJblNH?=
 =?utf-8?B?U0xIVDZDY285dFpKeElPR1NQQVJONFR6V1ErVm5HMGFhc3BWeW9EUzZBcndh?=
 =?utf-8?B?TUJYeTZsUFpSZ3hEQ2pvemlGVE1kTGxBaU5hdi9icFpjNSt4aW41TWhNVkZk?=
 =?utf-8?B?eVFvN093eCtrdTlXL29YM1lydGpYVm13Y3ZJR0piOWlxdGVHaiswZlhkWHVj?=
 =?utf-8?B?ZGFvajAxWDBiT1ZpMkNJaXFlQXM5R1JhQzZkYmljbG5uVE1LenJHYWxqTXFO?=
 =?utf-8?B?OGwxc2FpbUNiMHY4ZThHS3VuL2ZMcnNKN1gyUkhUa0ZSRy9aYVhCYm5tOFN0?=
 =?utf-8?B?WkVoTnBZbUFsNDVGRVl3dVhTMGIybDRzbENFWjVLTWZiZTdrK0VTKzlqUW9O?=
 =?utf-8?B?VVdtTmorNXhpVFAyTGd5ZVBiUlE3d2xNNFlMNWZyd0FTaURPc0NWZzg4ZnZR?=
 =?utf-8?B?U3YvOUhEbEhZaG5PcmlUWHVZN3lUa3RQTFU3dGN0Q2xKazZIeFRJYTd4ZzVw?=
 =?utf-8?B?WW9pS0tEZ05tRkdlZUx6VENRVlk1R3Y1aXhWVXZROUhKbUJ4T05jWnhBM3lt?=
 =?utf-8?B?RUhranZiNUZlYWZNL3FKKzdhbFZGbVExdHlEQWdCTnBIb0xCYWpOdUhaVVUv?=
 =?utf-8?B?MUdQb0pGN25xV3d6aU51TXBHODBnbjJGc0xyK2ZCcExNNXdVcmdxN1hLN1Jt?=
 =?utf-8?B?Y2QxTU9MVFcwOWo0Vlg4RDVscTVwc1Fsc1BibUo2aHBDVWwycUtOV0c1N1k3?=
 =?utf-8?B?Qi9QMTlPcWluOFRtbWpuMlo5R2c4UjJjbHVOdkVRQ2lCWjhjdStuMHFYWGUz?=
 =?utf-8?B?ZkF5MXBmSlk3Q1E4SHUwUGFGMjFrV2h3MS9UY0pNVTJhZ1owcWZhb1pxWXho?=
 =?utf-8?B?OGpLVVNGQXJpMFA2S1JUTFdNMHdqS3h4M05CcUVBaHF4VlpFemhLamxwNTVC?=
 =?utf-8?B?MWJiUEF0b0kzQU5EUlI5ZVQ1Nm5lTmNNa3pCUGlSQ0ZTVkh5Q0Z2L2JZMzJs?=
 =?utf-8?B?NlhxN3VjbmFvVmc0RkUvN1k2VjZMTkkvSXRLUzRGZW9aVHN6ZHhqVXFpMnpa?=
 =?utf-8?B?NHZkWlBleTVVR21kMDhxenpsakhUM2NzSllTNFdodTFEYVlxQktmaWtjanNN?=
 =?utf-8?Q?ocZVP2P8V1+cUVZkCBFQCb2HQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b8c4fb-8197-45c6-2662-08db6238028d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 00:34:50.5885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ge17g1ppyJEVTby1B9+x5UUoaicUdVy3P43vvG6hdNBXpDyxtS3nJj+OOyi30l8o7gdsXdjSZsASevdao0sPrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5307
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 29/31] drm/xe: Update query uapi to
 support standalone media
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



On 5/31/2023 5:04 PM, Matt Roper wrote:
> Now that a higher GT count can result from either multiple tiles (with
> one GT each) or an extra media GT within the root tile, we need to
> update the query code slightly to stop looking at tile_count.
> 
> FIXME: As noted previously, we need to decide on a formal direction for
> exposing tiles and/or GTs to userspace.
> 
> v2:
>   - Drop num_gt() function in favor of stored xe->info.gt_count.  (Brian)
> 
> Cc: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_query.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 8087c94dd782..a47b0da5ef5c 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -192,7 +192,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>   	config->info[XE_QUERY_CONFIG_VA_BITS] = 12 +
>   		(9 * (xe->info.vm_max_level + 1));
> -	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.tile_count;
> +	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
>   	config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT] =
>   		hweight_long(xe->info.mem_region_mask);
>   	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
> @@ -211,7 +211,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
>   {
>   	struct xe_gt *gt;
>   	size_t size = sizeof(struct drm_xe_query_gts) +
> -		xe->info.tile_count * sizeof(struct drm_xe_query_gt);
> +		xe->info.gt_count * sizeof(struct drm_xe_query_gt);
>   	struct drm_xe_query_gts __user *query_ptr =
>   		u64_to_user_ptr(query->data);
>   	struct drm_xe_query_gts *gts;
> @@ -228,14 +228,12 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
>   	if (XE_IOCTL_ERR(xe, !gts))
>   		return -ENOMEM;
>   
> -	gts->num_gt = xe->info.tile_count;
> +	gts->num_gt = xe->info.gt_count;
>   	for_each_gt(gt, xe, id) {
> -		if (id == 0)
> -			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
> -		else if (xe_gt_is_media_type(gt))
> +		if (xe_gt_is_media_type(gt))
>   			gts->gts[id].type = XE_QUERY_GT_TYPE_MEDIA;
>   		else
> -			gts->gts[id].type = XE_QUERY_GT_TYPE_REMOTE;
> +			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;

For multi-tile device:
It seems before GT_TYPE_MAIN was set for root_tile, and GT_TYPE_REMOTE
for second tile.  Is it okay to now set both to TYPE_MAIN?
Was it important to differentiate these before?  I don't know the 
history here.

At least should mention in commit message that XE_QUERY_GT_TYPE_REMOTE 
is no longer used.

Or maybe you should include pruning this out of the query api in your 
earlier patch:
"drm/xe: Drop extra_gts[] declarations and XE_GT_TYPE_REMOTE"  ?

-Brian

>   		gts->gts[id].instance = id;
>   		gts->gts[id].clock_freq = gt->info.clock_freq;
>   		if (!IS_DGFX(xe))
> @@ -290,7 +288,7 @@ static int query_hwconfig(struct xe_device *xe,
>   
>   static size_t calc_topo_query_size(struct xe_device *xe)
>   {
> -	return xe->info.tile_count *
> +	return xe->info.gt_count *
>   		(3 * sizeof(struct drm_xe_query_topology_mask) +
>   		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
>   		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
