Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7121BC04A94
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 19:13:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B20D10E053;
	Mon, 31 Jul 2023 19:13:28 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672FF10E04B
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 19:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690830806; x=1722366806;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jjUtmg1z7sxwFf04tw/iLdPxlX4IiSZZ7uyzEf6LCHc=;
 b=aqJdJjfNOt2R2ZAsdj1Qo4+r7sBdYGmJ1VP9uTXjlvNYgFvH3QPqLHfw
 OFKFsbbb+LB0EoqpR+P4QlJasELa728yJL0PVtbitwBLPUTnTAeoTNyO4
 pClj+tdp+h7jMXEbbEnVD5IkM33F+0Pp2xtmqBbItiYONaHYOlak1DO2D
 mWIG+pxZwwOcnD6z5hEPav9/aMZ9HU0tUvC54Ga7STg4+ad9RmXt87mej
 P1TxwVhaSNTBoJRQ1v9cIQYyQbySph8iVUvQtwVPOPXdc6uqPrgd84ovF
 tCAsNlwSKh+RGQVDQCrL03gsaDajFjk1pIHXrqrKIE5tzLaT6kwsB6J6m w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="354030726"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="354030726"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 12:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="974997882"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="974997882"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 31 Jul 2023 12:13:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 12:13:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 12:13:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 12:13:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 12:13:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I157ZlqZ/J360i4pESf/lHy/ABtAWEL99t6JiF+a88xZSpOjkQL00xlv17L3CKrVZkJa1PKO5OzDuLYm4XsHpKavY8HWJjr0IJI+1MnoCzLZE1IG7/mNzw4Pv14yvhrkyxS1CRztX8HDU3ZqE9PUmaGi+xj9vRCyzatPmXWeduthfC6m/FifvCCL/5GFZeHGYUZINN7wmTe2qNtSKy1zyNb9QZSiycUjami3VAZB7czi5fmc/a8RZFsTWr0ngWEEJYibuO5jeCmFoPcqtVLeGkVZRzt6PWjeV6jtfJ4DyufZEDQWkgoJwhsGTIPIK0g2lPko4KKAUgnWELTzvOYSKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoqLYI35br2Zh3gbiWVg/STEQGMbXigUbmFny4/8BqM=;
 b=bJ+hUKaEk0kKvx76VZ7PxNrqSUBjfC4mm0S1ruNMcO3iHCnXjN2JBscB4pblSKTP8BIbeSMAufXxMo6qrsUJdi71LGoHioj2cahBcnzlLiHriiAwGkxuVumPGNoupCTn+2tA/bN/f4mVDxll47K+Ujh2bjg6/8DCbySnxl1M2OYKwgLpog6UYghR/V0ORFco2zGZMeXnzle6f3dJQqCnIIUyQtnrEHM7HgDV+qxwpwZu4qbHJYpCCHGfyyQqA8YtuVCSnHm8aXJQWgNO7wE/xdzLBH9hAi1pnNSn3/MK6DyfAYbe6yq4se0xKVNE9F9I+5qHNkZ5meZrwN1PjlXF3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 BL1PR11MB5256.namprd11.prod.outlook.com (2603:10b6:208:30a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Mon, 31 Jul
 2023 19:13:22 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::b9a3:5861:febd:8ecd]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::b9a3:5861:febd:8ecd%6]) with mapi id 15.20.6631.039; Mon, 31 Jul 2023
 19:13:21 +0000
Message-ID: <3c7c3460-1fa8-2002-d157-f5a925511b02@intel.com>
Date: Tue, 1 Aug 2023 00:43:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230726124916.2291245-1-ravi.kumar.vodapalli@intel.com>
 <ZMdzb7bVMQdN6Ywx@bvivekan-mobl>
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <ZMdzb7bVMQdN6Ywx@bvivekan-mobl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::21) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|BL1PR11MB5256:EE_
X-MS-Office365-Filtering-Correlation-Id: 73fc66c9-d2b3-44cc-b89b-08db91fa3452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pOj8x6QJn1ORzbc91IffV3ZoH/CR5P9jf5jzJpusLxifYiSL5kXe4v8iGInE2q3udSdFYtDWkiEctwQuL5xcQsLtabGgIvbltlZ0pUbGSa40sR+dwa98rcJ+ifuMfdCBfuGS68tDioaBoHK8wC23GtMRNfXL43d7aR5yeBINryPH/kaz7FZIRnatrMX+DShqI+IRmuvp+q7JyqgfuzkQBwjX7Fa8PieoPIvDjj9IOcc33F972FwM8mfrmURUkc2sKEKLy8L2NpwQhM4PTb1MXeny2etsxf85EHvnQqJvDUWA7SopMtsWxrISLOEpSxsg5/NhZCYbuKKK7WWlXWdeRAF4PN99tvBwucyMkjH8PUIzzsLKDzZ6WfzP3EmlTVcjO9AdOChlqczdUDhJgw/Qkv8dRVlDncPm57gVFG7KdX/rgu0UjMKcDypwtG7kTdWiX8ve5sOXXYpV9b55VVwmXjfiSREnVlhrkCCwgElnK1dq5Fe5JShtYIV1QPBiYa4ABY6Cb+fgnn9friAXKCc3PoxtTv998TjlN67iD+GWLr2C4keg4p8nLrajDbdxjDJq5/Fjvi2wUiW5E5y28X/8FDpx+nBSxv/Mg2WYMsgnHBo5rTbD3xezPmd6DU04L5yRJ/cMZWpQBJ7+C+jmnok82Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199021)(31696002)(86362001)(66476007)(8936002)(31686004)(8676002)(316002)(5660300002)(41300700001)(38100700002)(66556008)(66946007)(82960400001)(478600001)(2906002)(6666004)(36756003)(6512007)(6486002)(6506007)(26005)(83380400001)(186003)(53546011)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmtuUGdFUEdDWmlSOXhVYnNreWxaMEZZTVdheFowdElCRmlZUGFEczNZajJv?=
 =?utf-8?B?WEdqeDZvQjNPZjcyRE5USUowVnMxeTJtdkgxSkhuWUplcC9GcHRlbEVib3Ru?=
 =?utf-8?B?SzlWVzJQTnBkeThTYlFmMVVqeTE1SW80Q1RzZjB5b1B3NEMwVWYxd1Rxazd3?=
 =?utf-8?B?YTRIMDkxYmZ0OFc4blRzcTJLYUtWZFdBWlAyeDM1SXdMUVo2cUhoSm9zUXla?=
 =?utf-8?B?SzM4WnlVUUJydHZYZ211VHFxd1hGQm9qbVlOc0huc1NFbjhmRGdaQVo1YVhM?=
 =?utf-8?B?Z1dDRmIyK25wWHgzeitzSXRhTFZiZmNXUmZuQm5LSU1sOVdDblBFR3JpcU1Z?=
 =?utf-8?B?TXhYcExwbzRkdm1CTVFUQW0rT3VKWmt1VTM1dEljZnMxNWpkeUdVVmtEcnpM?=
 =?utf-8?B?dXJPSFY3aTBVQ3dmekF6NWc1aVlCbEVDN3Z3VElOZ1lpL2tUVTNLRWRKODNi?=
 =?utf-8?B?cWkweDF5RmZkVk1aRnZBTHpaWXROdmtPYTlGZVJUOUI4L3M1am9QcEhlTkNW?=
 =?utf-8?B?NUNjNFVRNndud3lWS0ZJcmlKaUJURk90Y05ocHorT3FOcXM1amRac3pPT0Rw?=
 =?utf-8?B?VjU1dHM1dVdlZkR4ZWprVFljbFEwREVFdW9iRFpoZ1ZjczVDKzZPY2JIZ1hW?=
 =?utf-8?B?M1RVZVdxaHBkekhaTmZSdmk4dDd1S2hrNEZpNHpNUVJGcGlGRGxna25CdzU4?=
 =?utf-8?B?RlprejFzUUZvUFhuemhHVU42TnlwNWw1QlJmVzloWmpQM25yK0o1bFliaEF5?=
 =?utf-8?B?NE1PMWprV0plYkM5TFYyZUFZakwvSVc4amtNRGNqVXg1a0MvalREbEFiYlZs?=
 =?utf-8?B?bFJtSUJTT0NaQk1RV0xGaGVLRHlDQW0wOU5FNkFVcERWZGdPTjNGNzNwU3dU?=
 =?utf-8?B?aitKUkZ3TW1EWTRlNlJnRk5LZ2JoN0cwMFpRQU5RdWFpVzFxcVVFSTByZGI3?=
 =?utf-8?B?ZTJ4OU1FZFB6ZzN1djhJaHJDRVd0SGpRNkJqeE9STnpjNHQyTzFGRG9ZMFls?=
 =?utf-8?B?UHk2K1A4elp1bFd3Y0laYjk1RGpLM1MzQWpSOFVDcVpLakZ2VEVEdHZQVDlu?=
 =?utf-8?B?aC9aY2I4a1VjR1A4VTFIU2JpVXorbUpnM213RENVNFpsS2V1aUV0NHU0Z1BV?=
 =?utf-8?B?VjExQmJvL1hIUk1xWjNuTnVsckxzNFdMcnZiS2t5ZDFuYzR1U0lEL3NybURx?=
 =?utf-8?B?TkM5OU4wNXVBcHRIZnc0TEJFT1M1N243VGw4OENTcHdnR3FYQUxMdC9nZEVz?=
 =?utf-8?B?VEdWWERqV01BenNvbWFJaTRCTEZZelF5eHNFMXZXL2VpS2VOM2tiR2w1ZjRB?=
 =?utf-8?B?NnlrVFhtMVBoaDFIb2ltc09TQW9EWnFBbWpLakxtNG1xWHhBUFUvOHJWbDJS?=
 =?utf-8?B?YTFvN3V1TEwwM1BIb2xDVXIrR3AzemNjRlVZa21odHhGb3plaFhKSHBmTXJy?=
 =?utf-8?B?ZFJuTTliMlhjU0c5ZkNjZVVMcVNQcUMyQlZkVVdXUFZvbTV5TFJQRXJwbzBC?=
 =?utf-8?B?SUN5ZC9jZW5PNXo5OFNHaVRYUi95eU5QbDQzNCsxa0hHYlJ0cFJCVWNNa0p4?=
 =?utf-8?B?Y0JSYVRUSk5JMVkyV2xKbUx2SmxmMXNxcDF6N1pDZVJUUkRia0V1Rk5aUHF0?=
 =?utf-8?B?ZWs4WU9oa0IxOUV0M1NDdklqRUtFTE1pNFZRWC9FK00wblI4bG5QTW1QYVBM?=
 =?utf-8?B?MGxwSjcyWjU3Rzl2UVBudkc3K1lid3AyV1hTeUNoRG8yK0FnY1JWT0xMNWlo?=
 =?utf-8?B?Qnc5L0dMcjN3RUxzemJ4SDM5R2VYNHA3YUJLTWIrSlhzU1lHUkFoditBRUlv?=
 =?utf-8?B?cnVubnhubUhRSGdUTkFBYStiM0l4cnlwOERNUjl5Z1Fod0o2ZElIR0M5NnBl?=
 =?utf-8?B?OFlBMWVyOHdzZ1dUMDUvUWFOTEZ3TWhhbXVUeUtJVTlsUlROd2F5VFNzRzJW?=
 =?utf-8?B?ZzhPc1UyM0dxc0pUUmt2N2QyQ05OREJQRzBiL2pjNHcrSzFyWG9Ya3BraXJJ?=
 =?utf-8?B?ek05Q3d0WElSKzNqbmdObUtQa2loNnQ3TjlzM3UyN0Y1YUxHNGlXTHZXYTlZ?=
 =?utf-8?B?WDRMcDhBSXBuNmhFb1lTYjd3bUw0NldWaWYrY094VjVEY3Exd3VQOFVwQmE2?=
 =?utf-8?B?YTBFTTNoa0syajBBYytjd08vNWhrYWMvRUpXb01mMElKZXdOMkVoOUpPMHdz?=
 =?utf-8?Q?Tpmt1MaDS/a2jBFVFgaIh6M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fc66c9-d2b3-44cc-b89b-08db91fa3452
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 19:13:21.2099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Eba7sJHBoO1/urg2ruU29ad3lQKTl9Mnuw2ViKWCc5Vq2CNpkbeXuTj6XI8nFD9kq7Uxv3UAun4A6ZcdU0Dk1KySXx+9DDwcCL0dUeMlzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5256
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 7/31/2023 2:10 PM, Balasubramani Vivekanandan wrote:
> On 26.07.2023 18:19, Ravi Kumar Vodapalli wrote:
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
>>   
>> -	if (level != XE_CACHE_NONE)
>> -		pde |= PPAT_CACHED_PDE;
>> -	else
>> -		pde |= PPAT_UNCACHED;
>> +
>> +	pat_index = xe_pat_get_index(xe_bo_device(bo), level);
> Not really related to the patch. Can you please rename the variable from
> *level* to *cache* to avoid getting confused it as page table level.
>
> Regards,
> Bala

As you said Here variable name level is misused, actually it has to be 
cache...will update in next version, since this function is doing pde 
encode i think it is related to this patch only.

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
>>   };
>>   
>>   /** struct xe_vma_op_map - VMA map operation */
>> -- 
>> 2.25.1
>>

