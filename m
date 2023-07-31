Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990F7C001DC
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 16:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CCF10E2BA;
	Mon, 31 Jul 2023 16:07:31 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0901F10E2BD
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690819648; x=1722355648;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7PMysE26l+j2g+LRPpUcFKJ/4MueCYhippqBQm0POT8=;
 b=DIu0fbIOsOruy2kWBmPAmf3eONXdXwtLVWFZSn40nWTMsy7mIyk6ZGpN
 GYtA9yLcD3zFV/tswP74A+ihs5jESC3tSE/fQFq4UlRerDKNc/bY7Ka0S
 PVm3SweaKPxlph5C7TPBn8dl1b1nxRrzzA5+giJcZl6c4CpN7iQGZzyIL
 NzIaQVcWROwMRwySVUtM4u7WOOvwTNlUYXgKY+QHJFMPpn6yinfH1ewGY
 gC7qzRkNCdX/XqiVwvmwM6MkC5cOxSSy7F+qvTu4kTKUvUXuJTch3ElcZ
 niYjfty0f8UVqHQkZU+sSXTeQ1XevCKNmWPTQzvhZ67VuprkSz6niSdbe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="348656671"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="348656671"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 09:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="705464657"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="705464657"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 31 Jul 2023 09:05:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 09:05:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 09:05:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 09:05:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QO3LMjq+F/swvpuNRRTb256tRIVBCrNoVvwDX0Qwz69J2FRzTxY4XF0VEGREzwU/02gXxc/599aPcD/oMWpBn2Xdenv3IdRc2a6SNq2Im8Ml/iKvL+WmwLghqb0PBzpG6Y31SQfTPXcxZw/ot7UblOHvUs6OlHo0iexO8ph0jy/v+bUb832yAv7iRSxGybLOZ/bwN1vObyrFnOvsR9NNpQ5sIbWVUscMuTGZT4XphkbmY22VprSfVtn/0KCeLmoE1roIa2lAxhSdn6s8em9+C7poPU6mYjksu+TTth8odIYVCxvHPrAGEoZqsb0nWEQOujvIuPeWKjJ2R+DVL9SCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1evZydGCzl3NImaRvUkgEvtPm+r7IOF3/npkR3OZ3A=;
 b=QKSJHM9b/nHt+DunccUOp1vFgeCmumJdoE6/wqn/l6M26bCMuM7DtwKifCfl3Im1pUXofbnPwU9jm3ZNgyrrDCahDEzL2zp1fs6Lz0MgR/MoOOVl0QIkrgeQZaEq+1b0TgogC34nPe3L7kbbbuQ1cS8yFbYnKScspcJPW1CAkdQjKDoTTgUSHmIKrPUdds1DrRlaBk18NfiLfbz2J2wlMXmgl0yqaL9Hiyv2QX5lraHHw9hTieiWd2HMpqjxDavAn+GamnIJBCroxagWFF4OtdnMWL+uvn1Jj9DE+1bMXuZiu3JRqz0odrGf7DxK7YbIBRv3wzAp0scNtB1U8zy8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 CY8PR11MB7363.namprd11.prod.outlook.com (2603:10b6:930:86::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.42; Mon, 31 Jul 2023 16:05:40 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::b9a3:5861:febd:8ecd]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::b9a3:5861:febd:8ecd%6]) with mapi id 15.20.6631.039; Mon, 31 Jul 2023
 16:05:40 +0000
Message-ID: <b28b6ce6-ab91-af07-f818-839b42856853@intel.com>
Date: Mon, 31 Jul 2023 21:35:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Matthew Brost <matthew.brost@intel.com>
References: <20230726124916.2291245-1-ravi.kumar.vodapalli@intel.com>
 <ZMFzhWchFiy9OBKZ@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <ZMFzhWchFiy9OBKZ@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0128.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::13) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|CY8PR11MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: e979e0a6-6256-4a2b-1184-08db91dffc65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Skr8+9REL9vkCSO+dTnruwxoTSOiK5bKPuccakFQTfJzlO50h6WQuc2k3NxS7VVvP4qxnlEPynwfYZ0DOfLpWmXKQ6p2GhBpKNsR6+dsXIvr0mtngyzV2y03T1e8bDRhDrK1jJGEkmXhCTEEoShAqFMIUWkld8XzZ1wgh1KjyBwcMcFpYZSM/gCAUHZzSmM4g/YGkCPzh+6qcbm5wTPDxoZIQVoY6zDWXoCn/yR1vJ+/t3s9G8JkiELoOtU8VSRhXVQDni5Wk9Ix/ljgqTliTsME8VuM71klEfVyrnTHypRUuPBnqVvp4DTqPUvtTNAQjbZ6HX7DJ4eD2R151uerJkym1eVai9NBgDm+A16ekGJ/r741nrn/m7GeXY++S5+PxrZC4YaI7G7ux69zsyJszODaHLLuQYATfxj8xsg1iOkAtGN5vZzInJ3aJzpukWCRYeYnkEEbaNAWVoPrquiy8/VClP4wWjnaHTXfafx5/IsZC6EtD5+J0wweuzz7JLw2aC+Cl9oneARUFNEu6RUtLcM9og+nkQV2oMH2I2+wxwu3TjBxojMt9TW24gM51tx2cg73YqMmI4UVYonLu8Yujz1zFCL+SoxwWeCQsK3ZbmY6vhQBCvWIBPcVmMHY4+4N/tUD5vbKJXJt4thzxLsrRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199021)(38100700002)(82960400001)(31696002)(86362001)(36756003)(6512007)(6666004)(478600001)(6486002)(2616005)(53546011)(186003)(26005)(8936002)(6506007)(8676002)(6862004)(5660300002)(66556008)(66946007)(66476007)(37006003)(31686004)(2906002)(4326008)(6636002)(41300700001)(316002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTVkNHZ5VkViYjVpQS9rVXpYc1RSYlZZaXpzU2hWRVVDeE55K3lLTUdsUTB5?=
 =?utf-8?B?a2c4bTQ5TDVHNkRTZ0FUdTNSemZWRy9iUU9vMWJKRHBFRWpxVHpnZXNKSDlX?=
 =?utf-8?B?aW1qWCtTSVBNTDBKVFp3ZFp3SzNPUTYvOE1rOFlaR2NUZElxRnhneHZrNG9B?=
 =?utf-8?B?eGdPRnpSTGNMRVdxaUpGS0Qvekd6NmxUNjNWM2FVK2RuT1hWTnVMRlFoNUlk?=
 =?utf-8?B?b2NBR3dUeWdLSWR4OFVReHFSVVkrQTAyek5uWjY1RW9yRldEZCtNQmFiRW56?=
 =?utf-8?B?WS9LTld6MmN2TUhVVTRaVmZjM0N3bytPSzlxYmcxR25KS1FaS2JEYUw0UGYy?=
 =?utf-8?B?cWk1QWtGeG94cmxRQlYyVlk1ZERXS2JLTkd2NDFBWFptbTdJNU1iUjdqZG5B?=
 =?utf-8?B?OUtkVGRYNlZLR0FLdkZmaC9ORStiRGd2NkpEeS9oTG9rbDVycGlrODBRMTlw?=
 =?utf-8?B?enl3NTljZ3Yyd1orUFdVVlpoR1BxcVk4bU5EelV5RlpaNmVjTXlGVXdGLytp?=
 =?utf-8?B?cHFKNDliaW9Pcnk0TmpyK0F5bzMrTjdXMjBLcjNNTUxib3hXdXRIVCtjS0cv?=
 =?utf-8?B?ejdOMUluemltTXNZQTYxWkZDVTNBUWRIQncxUnlqMnhJc0NIZ3UvQmluVFF3?=
 =?utf-8?B?bFBTdTlnNHN5MmxHdWd4UEZnMGpQSlhkVFpCOGVZUWl1aE5PODlCbzRoU0dY?=
 =?utf-8?B?aWVjOFhvZVVQOFZIUFNBaEM1MFlTbjNFSXMyMVluZmlBbU5tZ09sU1N0N0hF?=
 =?utf-8?B?NlZ4KzRxVmJFOXNWdFBxRnkwVzdacEhlNTFVVVpYV2FGZGtQc09Ua2MzWUJH?=
 =?utf-8?B?OTh5K0Z1QlVnTytUbmd5cDRlL1RPdWxUSThXeDVjZjVGbm0weG11YVE5SGEx?=
 =?utf-8?B?ekhPbFhZT1l6VVA0VXVXTFRNUWxrcldjU2VOcTRNWk92Q2x5K0xKd1BQdTdV?=
 =?utf-8?B?MURjUWptNmUrRXkzb3grL210dzBsOFFDaHV5KzVqK2N2S3ZaOFYxeDNPd2FE?=
 =?utf-8?B?TWNabFYrUnI0Slo4ZUZHSC9wa3NnS0t1cStUT0EvM1lrcElmTytranU1dENm?=
 =?utf-8?B?UUxYR1RMSXRnQjdVSkc4TW0vMjVxZmcvQVVNbW81S2lIc1V6bWNSRWdzSzZx?=
 =?utf-8?B?ZTR4YXpBWGRleGFaMlFYR2FQbS92enJJZG9NRTN1dm9SOUk1UWVGZ1UrSWxN?=
 =?utf-8?B?YnNaYWxEUVlLTUluOW94VkYyREl2L2s5eWNtZTRLZ0d5emRKRTg5QituZmRZ?=
 =?utf-8?B?d0xMK3ZXYVdORUVIc3FDdXBkSWVyRVRRZ3lRbGkwbDNJQjQ4a0hieWFBdDNF?=
 =?utf-8?B?R1JzNk96V2RLcWJwaktlbGJVcmpWS2hRQUgyVlplbnQ2OTZwZHNPOWNHNko5?=
 =?utf-8?B?S0l6b1R3bXVlTndwWCtNSkg3T1ZHL25vNWtOak5IU1AwcTBYc3RIRmhiR2Zr?=
 =?utf-8?B?YWxDZVUrNnVIOEZHWTdzZU1wZkE5S0FKYkszcm1WRG9YWXVVcTduTEJFMXJj?=
 =?utf-8?B?OHh0MzBqblkvQllnejNoSy9kb1FiVWNSOG5CMTBRUU4ybU5SNVUwSlFTK3Q1?=
 =?utf-8?B?U1NHMzdkZ0Ryb2h5UU1tc0wyV0RXQ3pEMHNzOWsvck5HY3dKYUdteFNyOHJZ?=
 =?utf-8?B?aGFqckNkeUwwa2x4M0ZHTmZ5M0VIRVVST2p5MjcyNmU5eEZhaktnVnlldlpq?=
 =?utf-8?B?WTIvclJiVmtIZU5PTG84bm5FUFBLU1FNSmVhd0RUZjZ0SmdLKzNrYnBiZTZ1?=
 =?utf-8?B?M1ppcTlxTi9SWjdqTmhoZjdGblFWMzhyUnpkVzlDNUtNL25xZ1ZhT0laRjRT?=
 =?utf-8?B?VTFLTWw3bFdRZU0xczZtdFpYQUlmSHRhVkdYMzRqVlJCU25xQXRaRkdMQW93?=
 =?utf-8?B?b2tZTnpEVWpsdUFMdnNDM1ZwMmxqdHRYNHVlMzNZWU9uMzUyUXRKOHZqeFla?=
 =?utf-8?B?eXJPeEltdnl2UUtpQXdweVQzbnpOQUVsUk9IbjVEcW1iNTRhaEtrV25oSGZy?=
 =?utf-8?B?TWkyby8rclJWdktRNDlDWXFiaXliVUJGQUliOGZkTkR1eUxXUkgvck9HTkY5?=
 =?utf-8?B?M29YSDdNUjJ0Tm1ROEV0Q3ZXNDlaSXZCNU1waVJOdDIwcWVyZG1OSmw0VFIz?=
 =?utf-8?B?VFRhK2I3UUJzc3pCZlBzcThsSEtudG9pRUR0cGFYTDdORFd2dmNVRFhacFhX?=
 =?utf-8?Q?NwkmqUEgFgW4TGbUuuxkwyY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e979e0a6-6256-4a2b-1184-08db91dffc65
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 16:05:40.5097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a19CsByEWhpCx8t9tClKC1kQiMnBF1Jql3JpfqIaZn0hD7cb5+xqIOAs1TyOvQk1KFOBzKdMHNnpHYfFRt8OK1VvcR/9zK/k41Eb/OCSh90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7363
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/ppgtt: Add support for correct PAT
 encoding in PTE and PDE
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



On 7/27/2023 12:57 AM, Matthew Brost wrote:
> On Wed, Jul 26, 2023 at 06:19:16PM +0530, Ravi Kumar Vodapalli wrote:
>> Different platforms has different PAT encoding in PTE and PDE format, add
>> correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
>>
>> Bspec: 45101, 71582
>> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c       | 119 ++++++++++++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_pt.h       |   2 +
>>   drivers/gpu/drm/xe/xe_vm_types.h |   2 +
>>   3 files changed, 106 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index d4660520ac2c..09dafb0e47ea 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -16,6 +16,7 @@
>>   #include "xe_trace.h"
>>   #include "xe_ttm_stolen_mgr.h"
>>   #include "xe_vm.h"
>> +#include "xe_pt.h"
>>   
>>   struct xe_pt_dir {
>>   	struct xe_pt pt;
>> @@ -62,6 +63,8 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>>   {
>>   	u64 pde;
>>   	bool is_vram;
>> +	u8 pat_index = 0;
>> +	struct xe_vm *vm = bo->vm;
>>   
>>   	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE, &is_vram);
>>   	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
>> @@ -70,10 +73,9 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>>   
>>   	/* FIXME: I don't think the PPAT handling is correct for MTL */
> Stale comment, this should be correct after this series.
>
>>   
>> -	if (level != XE_CACHE_NONE)
>> -		pde |= PPAT_CACHED_PDE;
>> -	else
>> -		pde |= PPAT_UNCACHED;
>> +
>> +	pat_index = xe_pat_get_index(xe_bo_device(bo), level);
>> +	pde = vm->ppgtt_pde_encode(pde, pat_index);
>>   
>>   	return pde;
>>   }
>> @@ -103,6 +105,9 @@ static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
>>   static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>>   			struct xe_vma *vma, u32 pt_level)
>>   {
>> +	struct xe_vm *vm = xe_vma_vm(vma);
>> +	u8 pat_index = 0;
>> +
>>   	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>>   
>>   	if (unlikely(vma && xe_vma_read_only(vma)))
>> @@ -111,19 +116,8 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>>   	if (unlikely(vma && xe_vma_is_null(vma)))
>>   		pte |= XE_PTE_NULL;
>>   
>> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
>> -
>> -	switch (cache) {
>> -	case XE_CACHE_NONE:
>> -		pte |= PPAT_UNCACHED;
>> -		break;
>> -	case XE_CACHE_WT:
>> -		pte |= PPAT_DISPLAY_ELLC;
>> -		break;
>> -	default:
>> -		pte |= PPAT_CACHED;
>> -		break;
>> -	}
>> +	pat_index = xe_pat_get_index(vm->xe, cache);
>> +	pte = vm->ppgtt_pte_encode(pte, pat_index);
>>   
>>   	if (pt_level == 1)
>>   		pte |= XE_PDE_PS_2M;
>> @@ -187,6 +181,91 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>>   	}
>>   }
>>   
>> +static u64 __xelp_ppgtt_pde_encode_pat(u64 pte_pat, u8 pat_index)
>> +{
>> +
>> +	pte_pat &= ~(BIT(12) | BIT(4) | BIT(3));
> Defines rather than just doing BITs.
>
>> +
>> +	if (pat_index & BIT(0))
>> +		pte_pat |= BIT(3);
>> +
>> +	if (pat_index & BIT(1))
>> +		pte_pat |= BIT(4);
>> +
>> +	if (pat_index & BIT(2))
>> +		pte_pat |= BIT(12);
>> +
>> +	return pte_pat;
>> +}
>> +
>> +static u64 __xelp_ppgtt_pte_encode_pat(u64 pte_pat, u8 pat_index)
>> +{
>> +
>> +	pte_pat &= ~(BIT(7) | BIT(4) | BIT(3));
>> +
>> +	if (pat_index & BIT(0))
>> +		pte_pat |= BIT(3);
>> +
>> +	if (pat_index & BIT(1))
>> +		pte_pat |= BIT(4);
>> +
>> +	if (pat_index & BIT(2))
>> +		pte_pat |= BIT(7);
>> +
>> +	return pte_pat;
>> +}
>> +
>> +u8 xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
> This doesn't need to be export, i.e. make this static.
>
> Also in general this is a really goofy use of vfuncs vs. if else. The
> vfuncs are only set to 1 function and this function has 3 branches. Very
> confusing.
>
> It would make more sense to have a vfunc for getting the pat index with
> different implementations based on graphics version. Then non-vfuncs to
> the pat in the PTE and PDE.

As per Lucas comments there should be only one common function to get 
pat index
if we implement to get pat index in one function then there would be if 
else, or we can
do one thing place platform specific get index in separate functions and 
call them from
xe_pat_get_index() again if else cannot be avoided
other possibility is implement vfunc for every platform and initialize 
that in some function
and call it when encode is needed.
Lucas has to comment which would be better approach

>> +{
>> +	u8 pat_index;
>> +
>> +	if (GRAPHICS_VERx100(xe) >= 1270) {
>> +		switch (cache) {
>> +		case XE_CACHE_NONE:
>> +			pat_index = 2;
>> +		break;
>> +		case XE_CACHE_WT:
>> +			pat_index = 1;
>> +		break;
>> +		case XE_CACHE_WB:
>> +		default:
>> +			pat_index = 0;
>> +		break;
>> +		}
>> +	}
>> +	else if (GRAPHICS_VERx100(xe) >= 1260) {
>> +		switch (cache) {
>> +		case XE_CACHE_NONE:
>> +			pat_index = 0;
>> +		break;
>> +		case XE_CACHE_WT:
>> +			pat_index = 2;
>> +		break;
>> +		case XE_CACHE_WB:
>> +		default:
>> +			pat_index = 3;
>> +		break;
>> +		}
>> +	}
>> +	else
>> +	{
>> +		switch (cache) {
>> +		case XE_CACHE_NONE:
>> +			pat_index = 3;
>> +		break;
>> +		case XE_CACHE_WT:
>> +			pat_index = 2;
>> +		break;
>> +		case XE_CACHE_WB:
>> +		default:
>> +			pat_index = 0;
>> +		break;
>> +		}
>> +	}
>> +
>> +	return pat_index;
>> +}
>> +
>>   /**
>>    * xe_pt_create() - Create a page-table.
>>    * @vm: The vm to create for.
>> @@ -216,6 +295,12 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>>   	if (!pt)
>>   		return ERR_PTR(-ENOMEM);
>>   
>> +	/* __xelp_pte_encode applies to xelp, xehpc and xelpg platform*/
>> +	vm->ppgtt_pte_encode = __xelp_ppgtt_pte_encode_pat;
>> +
>> +	/* __xelp_pde_encode applies to xelp, xehpc and xelpg platform*/
>> +	vm->ppgtt_pde_encode = __xelp_ppgtt_pde_encode_pat;
>> +
>>   	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
>>   				  ttm_bo_type_kernel,
>>   				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
>> index aaf4b7b851e2..0ed69abf8202 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.h
>> +++ b/drivers/gpu/drm/xe/xe_pt.h
>> @@ -51,4 +51,6 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>>   u64 xe_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
>>   		  u64 offset, enum xe_cache_level cache,
>>   		  u32 pt_level);
>> +
>> +u8 xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index 261a4b0e8570..fc976e207462 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -336,6 +336,8 @@ struct xe_vm {
>>   
>>   	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>>   	bool batch_invalidate_tlb;
>> +	u64 (*ppgtt_pte_encode)(u64 pte_pat, u8 pat_index);
>> +	u64 (*ppgtt_pde_encode)(u64 pte_pat, u8 pat_index);
> Kernel doc and for vfuncs make this a const struct of ops.
>
> An example of what I'm refering to is 'struct xe_engine_ops'.
>
> Matt
>
>>   };
>>   
>>   /** struct xe_vma_op_map - VMA map operation */
>> -- 
>> 2.25.1
>>

