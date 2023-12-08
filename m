Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189DDC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 04:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B751610E9CA;
	Fri,  8 Dec 2023 04:33:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CD410E9CA
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 04:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702010011; x=1733546011;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CvjTILfEzyq0lPuvbLVF0Ct/gzhPliK504lsO//2kIw=;
 b=n/b6vJ4VEzedfKlVKBsNOO3XJtuILUq9SBbpueh4sjdKTBdXSoZx5rgu
 /Jd5zn949vgSOjMiwmNlRaZkTfsyZldJHfux9vtOyk0nOuGsEjQCfD/9j
 eLi409Mg+P0mb5dMRUgcPhEYYU48pLdpXu/DMMJ+Sr1yREPPKjHrQkxNt
 DwlAJmgRg25U/XCBhUCSTXjpdYEHbppbTJCq1ASHigedMJv9yuxCDSk+t
 BAeN/E6GW75gQSTrsjQlGwPFgrGctGN6kaTRAwuyqVtOLL6GBwajONMMV
 kiQF5Yle2jdy0EM55/B+/broaqzClg07w8XqrcoqJvz21XmKK8GoM2OY0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="394095465"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="394095465"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 20:33:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765360701"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="765360701"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 20:33:31 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 20:33:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 20:33:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 20:33:29 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 20:33:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyWXBGVo8VhQwd3osKw3oUX60Cgq57FQSqodAm4Sz3mTIusup/p/D1cMfAN3pEBR2KbvZSXc57r1Am8wsInevyUnEnElCPeF6+lSxlgGr4K4+Y/XRbTYpbNLF9b15fxtVx4Ne4HaUm/GLbNsKb6N9JAfBPx7M9GczvkHbYELqjrv+7/UV/A9f5uirsj2rLmCmorsRRUkcjLlIU16jT9+45BVpzchfBjbJm+7Q1NBFMTxAkos25VcpZl42zqcjYHAv9JNBCBHUBigbwj91YRBuiS7WkvuIiQ4kCWnzNwxMW4rGd0ll8lW3GttiDMY7FlnGDbjoyg5QGLoaQptvJU48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyPbIC6OzvfXooJmCB/7riu5OCWucEPJR6qO6V/IWkM=;
 b=Z417wBcnpNWvDcgRRB21AqghAm5Vbi939kzxURxDy9Eqz9KBJi/pL5naQ8eaBgxDMOV8x2tb9Ipd0oxhWumr3EmNwFJl8+CHg+aHDJOrfcBavFAwSdOUYGTUckOt9vRznIVoaRO1F4Y8Dr61g5eKhTBlJSQJMMt7tNz+nM8rBAdsJF3wk7vm3UGw1mVj7X9jQZB4a4iVgx86eQV0Q6TbYYv+VKuIagIASrYs48Wjz7OxwkRditdlWZZAMR2zPeKYA6c5IL1sVIrQ6k0FLplxchhfSBMAx0ZLVDPMBny87XX0G55Ct5lWzutek+f0kzHEVgOmUcnFd8Xftn2GXMQgPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB5972.namprd11.prod.outlook.com (2603:10b6:8:5f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Fri, 8 Dec 2023 04:33:27 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Fri, 8 Dec 2023
 04:33:27 +0000
Message-ID: <75c6d856-a3f4-41e8-9773-bfc634b920b4@intel.com>
Date: Fri, 8 Dec 2023 10:02:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH v4 7/9] drm/xe/xe2: Handle flat ccs move for
 igfx.
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
 <20231206043126.984049-8-himal.prasad.ghimiray@intel.com>
 <20231207001753.GV1327160@mdroper-desk1.amr.corp.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231207001753.GV1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: bf0fbf16-d79f-42ad-4f0d-08dbf7a6a6a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l6SjNFnRFY1HeLmntlVan/EPhlgnris7BJFA2XNXm0Rv6Z5KbdfyiVZNgX9+9Bwaep+oxZKUJ6QVeDsiTUHw/hmxrTvjUflVYBaTnDvuAygX58I0v3WjqMfiM1SJ5l45noeoT2HsH+/qGEqg0qI93VW2x2yoKc7yimGyjM1l/f48Hb279+Mr4YzwUhaNgkRdF1gYAd/p8rCdimec0VW+jFfrgjY531zGwKnZyt16/ZnOtqYAmWNwftUf8czdxBSIXi1LWp36/NXLLAtIKRF+2I9Bq3WZmE6inEY9EuI+sNpHu0gIj4Ai7DWHckEOOsaIkgmDdSxoRBlmdJBIVkeMl4PgWWJ+uK+5xeXb5UG/ElYuPdVhJ64Vt+++apghgvKoeS8OQGdyZjZJpYAx41zZybdUOtj5CCLJ8IBsQkAD/LjVE9zTDNATzYlnLv2Y9N5F013s2aP4m4dMmpTiMTwPTVWe7Cbf9fxZBxa8bdVxZJOLPR01s5kQyMzvatKqrgBVCTF4ZKHOfjDpICM1ImzsYpnU06jXipyELs0qFnCOid4II49XJnsaVgKPFaWAnJRg0bMNyY3VJAHzO9HKTRONBU5BpouZtiurBJlk5Gg+rZpCuBgQA2hVe+7SjCESpojEiv9KPXqXL56wfz9rwgM4Eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(36756003)(86362001)(5660300002)(2906002)(2616005)(53546011)(6512007)(83380400001)(82960400001)(26005)(66574015)(6506007)(6666004)(478600001)(6486002)(38100700002)(31686004)(6636002)(37006003)(66556008)(8676002)(8936002)(66946007)(66476007)(316002)(4326008)(6862004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnJFdlpqaG4rVm55TE9aVGxjZmMwaENQSXFSNGV2NkF3b3dmS3Nmbnpza2Ni?=
 =?utf-8?B?SWFlK3ZrZ3lLeEFhZlQrOUhJMWFBb1QvbjRDOFkveGZnRDdEb0tmTXBHZ2M4?=
 =?utf-8?B?Y3JqNnJWTEozZDd5R200dHBTU0RoKzlQbm1HODl1VlEwYkVjZ1FlaVZpUGhS?=
 =?utf-8?B?LzlhOWdEQjAyTkQ3MWRxMFhCeDFnYUVrUDE2YVVJWGMvQjZLTTliMkJMOC82?=
 =?utf-8?B?UktScTIzM1A4aDNNeDVNZ2thanNGQm8rYy9DVHlCeE1tcDY1M2xYOTNJNm9B?=
 =?utf-8?B?YmhJS1R5R3dhamk4UStvc0VzNTd3aUVxVUtoTThOcTh4MjU2SlNGcTgzUHJ4?=
 =?utf-8?B?UHBoaGRBL3g5WFZNc09ib3ZhUVdIazBjR2ZPbEZTaWttUi9mUlBUbThNOGNF?=
 =?utf-8?B?NHNHZHpGNE44cmtKdGhMNmNMWnd6WnlESlE1OTh0S3liWjZ1QUVZallTT3NH?=
 =?utf-8?B?OVh0TnVPQnM1a20yckhId3VLeHByd3Q3Y2I4NUtDdml3WitjT2ptQjFCS2gz?=
 =?utf-8?B?Vzd6d0k0dG8vMDAzanIxU2UzSDRMOVJnRVdWblJLU1hqaFBSYlNjWTNYSjdR?=
 =?utf-8?B?TGRXeG5jU0l0K2VuaE5yK0NhV1FCMWNvZzRFMXZ0TVFZSHlzVUlGMHJFZ2k1?=
 =?utf-8?B?S0FUREtLOWpUZTgyZzhnZDN5LzVJdWJxSWRQRVFzRy9oL2tyUUgxS25tanlW?=
 =?utf-8?B?RWFDQTJHemNJWlhMSGNndDBaeW05QkJYcjNjK2FHcEtBK01ITUpLNWc3anUy?=
 =?utf-8?B?S0NPV1BZTVJNeThDNEdwVjNoRlZOU2pqWVd4aERxNVpvUXkwYmtHL2s4cDdB?=
 =?utf-8?B?ZlZPL09nNC9TNlIzWU9oN1B3WTV4eCtxZmJEK2tLZ3YveXlnbDd5c0tqWmZu?=
 =?utf-8?B?ZjFUMElONXphcjBETW02WVBSOExiZWV1dGdGS3ZmcUg5Qzg1WGJjb2hQKzNS?=
 =?utf-8?B?MG5BdWUvWXJsRE5ibVNRLzgxWnJwdUpZcnFqKy8rUU9PZWljTzc2WG8rQ0VO?=
 =?utf-8?B?NnYvd2xCRElZWXlkRmZKVFFXekFUQTVkWXlsWE5ZZjFxNllSWWRaREpnL3Np?=
 =?utf-8?B?VkIvT0RQYUZPMVJzMGp2b2krTmpZdS9nOWZVQUw4Vk5RdFpWak5QZEh1NSt3?=
 =?utf-8?B?cDdrM2hoMmNiSmNGd1Q3U3ZLbmhCZ3UyY2JKc2RKNkxGQ3p3WTM0bEVTc2Ev?=
 =?utf-8?B?NHNTa0ZOTjVTdys2L3M3OHl3RDhCVm5xcUlqcUU5QU0rK1E0N3RiQ2k5dnVr?=
 =?utf-8?B?NkM5Sys3NStHci9DajBTTnNEckxHTFRDcW1yWE0vWHlsd0o2VWk4VmV3ektx?=
 =?utf-8?B?R3B2anJuZjR0NlgrbGN0VndIaitWMk1EeXMzWnR0Y2xDUmszQi9CR253SmYv?=
 =?utf-8?B?cVFqdGdzVStjL0NqbXpTNVR1REtnOVdHdFVZRTdaOHM3cHlGZ0kzSkhmdlpX?=
 =?utf-8?B?TWVRU09xaDI3TU5PYlo3MWMvRlJIQnhkVEt6VnpVUW54VkVMNnJBcVIydVZK?=
 =?utf-8?B?KzhOaHZDMmxLZFpqcmVSdWdhc1lFWHlXWk92V0tjRkw1d3B1MS9MeTNOb2k4?=
 =?utf-8?B?TzlrVjl1ZzBTN1BzY09PdmJZY21kY2duVFJXNGRyMC9JcFpZVFA5eTFUaElh?=
 =?utf-8?B?SXRoN2IvS2VNR1FUd2NKUDNuVG1ZT2RWR1Bpc2tkMW9ISG0wakFiM2VMNVAr?=
 =?utf-8?B?QUlBS0xPNHFoWnUvYUplMSt3ckZqMTRQVUdnL0hCUmorWnFkay9hQWdzTlN0?=
 =?utf-8?B?TjFRMWw4ZmpOZEVhM3NYdHdEUXNCMk94NGY1czI2QVpxTlBlTUxZeE1vK0NN?=
 =?utf-8?B?TlN1c0Y1VG9vSzBrVTZlODVqNWlWT0U4SHlET0xRODliM0ROV3pxWk95OUQ4?=
 =?utf-8?B?VWZybFNrRXJpK214MmlJWWhmakJYRWQ1YytEOGM5bVBIY1BkTzMxa09CUllD?=
 =?utf-8?B?amJuWXB1djF2OFhnOE5YMnNIckpSaDI2NDNGYlhad1ZrbnF4WVF0Qm1QcWRC?=
 =?utf-8?B?SUtPODdhbTRZZW1WNXNTY2FKUTVBTEFUNHk5VUdNSVlLcTI0c1k1amFyY0F5?=
 =?utf-8?B?YlhrVmNUSFBzbGtZd0Jpelp0aVVMemxlclpKOVlRTEIyKzFJWVlQK2w3R0E4?=
 =?utf-8?B?cittbkhYSW9KNFdqODllYUZuYWczSVhNWXhzaWk5WDVlb3VwZWlldWlHd2pK?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0fbf16-d79f-42ad-4f0d-08dbf7a6a6a9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 04:33:27.2995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHonkFnxQew08k8PV7SHY3LKkW/EBi4WRxlQcvh8VZZEVkMhy2x8ZJYLTvhVTEpGFvqlNrTx7cfZZ3yg4WkIwOibenc81/LkcFRrNa92lYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5972
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 07-12-2023 05:47, Matt Roper wrote:
> On Wed, Dec 06, 2023 at 10:01:24AM +0530, Himal Prasad Ghimiray wrote:
>> - Clear flat ccs during user bo creation.
>> - copy ccs meta data between flat ccs and bo during eviction and
>> restore.
>> - Add a bool field ccs_cleared in bo, true means ccs region of bo is
>> already cleared.
> What does a "ccs move" refer to in the context of an igpu that doesn't
> have vram?

It means ccs metadata copy from/to flat ccs  during movement of bo 
between gpu domain and

system domain.

BR

Himal

>
>
> Matt
>
>> v2:
>>   - Rebase.
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c       | 25 ++++++++-----
>>   drivers/gpu/drm/xe/xe_bo_types.h |  4 +++
>>   drivers/gpu/drm/xe/xe_migrate.c  | 60 ++++++++++++++++++--------------
>>   3 files changed, 53 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 81630838d769..e9b6c67b2523 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -647,10 +647,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   	bool move_lacks_source;
>>   	bool tt_has_data;
>>   	bool needs_clear;
>> +	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
>> +				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
>>   	int ret = 0;
>> -
>> -	/* Bo creation path, moving to system or TT. No clearing required. */
>> -	if (!old_mem && ttm) {
>> +	/* Bo creation path, moving to system or TT. */
>> +	if (((old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT) ||
>> +	     (!old_mem && ttm)) && !handle_system_ccs) {
>>   		ttm_bo_move_null(ttm_bo, new_mem);
>>   		return 0;
>>   	}
>> @@ -665,14 +667,13 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
>>   			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
>>   
>> -	move_lacks_source = !mem_type_is_vram(old_mem_type) && !tt_has_data;
>> +	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
>> +						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
>>   
>>   	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
>>   		(!ttm && ttm_bo->type == ttm_bo_type_device);
>>   
>> -	if ((move_lacks_source && !needs_clear) ||
>> -	    (old_mem_type == XE_PL_SYSTEM &&
>> -	     new_mem->mem_type == XE_PL_TT)) {
>> +	if ((move_lacks_source && !needs_clear)) {
>>   		ttm_bo_move_null(ttm_bo, new_mem);
>>   		goto out;
>>   	}
>> @@ -703,8 +704,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   			ret = timeout;
>>   			goto out;
>>   		}
>> -		ttm_bo_move_null(ttm_bo, new_mem);
>> -		goto out;
>> +
>> +		if (!handle_system_ccs) {
>> +			ttm_bo_move_null(ttm_bo, new_mem);
>> +			goto out;
>> +		}
>>   	}
>>   
>>   	if (!move_lacks_source &&
>> @@ -725,6 +729,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   		migrate = mem_type_to_migrate(xe, new_mem->mem_type);
>>   	else if (mem_type_is_vram(old_mem_type))
>>   		migrate = mem_type_to_migrate(xe, old_mem_type);
>> +	else
>> +		migrate = xe->tiles[0].migrate;
>>   
>>   	xe_assert(xe, migrate);
>>   
>> @@ -1254,6 +1260,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>>   			return bo;
>>   	}
>>   
>> +	bo->ccs_cleared = false;
>>   	bo->tile = tile;
>>   	bo->size = size;
>>   	bo->flags = flags;
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> index f71dbc518958..64c2249a4e40 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -79,6 +79,10 @@ struct xe_bo {
>>   	struct llist_node freed;
>>   	/** @created: Whether the bo has passed initial creation */
>>   	bool created;
>> +
>> +	/** @ccs_cleared */
>> +	bool ccs_cleared;
>> +
>>   	/**
>>   	 * @cpu_caching: CPU caching mode. Currently only used for userspace
>>   	 * objects.
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 1bfb249680f4..ae11701408a9 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -567,14 +567,14 @@ static u64 xe_migrate_batch_base(struct xe_migrate *m, bool usm)
>>   
>>   static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>>   			       struct xe_bb *bb,
>> -			       u64 src_ofs, bool src_is_vram,
>> -			       u64 dst_ofs, bool dst_is_vram, u32 dst_size,
>> +			       u64 src_ofs, bool src_is_indirect,
>> +			       u64 dst_ofs, bool dst_is_indirect, u32 dst_size,
>>   			       u64 ccs_ofs, bool copy_ccs)
>>   {
>>   	struct xe_gt *gt = m->tile->primary_gt;
>>   	u32 flush_flags = 0;
>>   
>> -	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_vram) {
>> +	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {
>>   		/*
>>   		 * If the src is already in vram, then it should already
>>   		 * have been cleared by us, or has been populated by the
>> @@ -583,28 +583,24 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>>   		 * Otherwise if the bo doesn't have any CCS metadata attached,
>>   		 * we still need to clear it for security reasons.
>>   		 */
>> -		u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_mem_ofs;
>> +		u64 ccs_src_ofs =  src_is_indirect ? src_ofs : m->cleared_mem_ofs;
>>   
>>   		emit_copy_ccs(gt, bb,
>>   			      dst_ofs, true,
>> -			      ccs_src_ofs, src_is_vram, dst_size);
>> +			      ccs_src_ofs, src_is_indirect, dst_size);
>>   
>>   		flush_flags = MI_FLUSH_DW_CCS;
>>   	} else if (copy_ccs) {
>> -		if (!src_is_vram)
>> +		if (!src_is_indirect)
>>   			src_ofs = ccs_ofs;
>> -		else if (!dst_is_vram)
>> +		else if (!dst_is_indirect)
>>   			dst_ofs = ccs_ofs;
>>   
>> -		/*
>> -		 * At the moment, we don't support copying CCS metadata from
>> -		 * system to system.
>> -		 */
>> -		xe_gt_assert(gt, src_is_vram || dst_is_vram);
>> +		xe_gt_assert(gt, src_is_indirect || dst_is_indirect);
>>   
>> -		emit_copy_ccs(gt, bb, dst_ofs, dst_is_vram, src_ofs,
>> -			      src_is_vram, dst_size);
>> -		if (dst_is_vram)
>> +		emit_copy_ccs(gt, bb, dst_ofs, dst_is_indirect, src_ofs,
>> +			      src_is_indirect, dst_size);
>> +		if (dst_is_indirect)
>>   			flush_flags = MI_FLUSH_DW_CCS;
>>   	}
>>   
>> @@ -645,6 +641,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>   	u64 src_L0, dst_L0;
>>   	int pass = 0;
>>   	int err;
>> +	bool src_is_pltt = src->mem_type == XE_PL_TT;
>> +	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
>>   	bool src_is_vram = mem_type_is_vram(src->mem_type);
>>   	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
>>   	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
>> @@ -720,8 +718,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>   		}
>>   
>>   		/* Add copy commands size here */
>> -		batch_size += EMIT_COPY_DW +
>> -			(xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0);
>> +		batch_size += ((!src_is_vram && !dst_is_vram) ? 0 : EMIT_COPY_DW) +
>> +			((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0));
>>   
>>   		bb = xe_bb_new(gt, batch_size, usm);
>>   		if (IS_ERR(bb)) {
>> @@ -747,10 +745,13 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>   		update_idx = bb->len;
>>   
>> -		emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0,
>> -			  XE_PAGE_SIZE);
>> -		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_vram,
>> -						  dst_L0_ofs, dst_is_vram,
>> +		if (src_is_vram || dst_is_vram)
>> +			emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, XE_PAGE_SIZE);
>> +
>> +		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
>> +						  IS_DGFX(xe) ? src_is_vram : src_is_pltt,
>> +						  dst_L0_ofs,
>> +						  IS_DGFX(xe) ? dst_is_vram : dst_is_pltt,
>>   						  src_L0, ccs_ofs, copy_ccs);
>>   
>>   		mutex_lock(&m->job_mutex);
>> @@ -923,6 +924,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   	bool clear_vram = mem_type_is_vram(dst->mem_type);
>>   	struct xe_gt *gt = m->tile->primary_gt;
>>   	struct xe_device *xe = gt_to_xe(gt);
>> +	bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(xe)) ? true : false;
>>   	struct dma_fence *fence = NULL;
>>   	u64 size = bo->size;
>>   	struct xe_res_cursor src_it;
>> @@ -963,9 +965,10 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   		batch_size = 2 +
>>   			pte_update_size(m, clear_vram, src, &src_it,
>>   					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
>> -					emit_clear_cmd_len(gt), 0,
>> +					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
>>   					avail_pts);
>> -		if (xe_device_has_flat_ccs(xe) && clear_vram)
>> +
>> +		if (xe_bo_needs_ccs_pages(bo))
>>   			batch_size += EMIT_COPY_CCS_DW;
>>   
>>   		/* Clear commands */
>> @@ -980,7 +983,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   		}
>>   
>>   		size -= clear_L0;
>> -
>>   		/* Preemption is enabled again by the ring ops. */
>>   		if (!clear_vram) {
>>   			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
>> @@ -991,9 +993,10 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>   		update_idx = bb->len;
>>   
>> -		emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE,
>> -			   clear_vram);
>> -		if (xe_device_has_flat_ccs(xe) && clear_vram) {
>> +		if (!clear_system_ccs)
>> +			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
>> +
>> +		if (xe_bo_needs_ccs_pages(bo)) {
>>   			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>>   				      m->cleared_mem_ofs, false, clear_L0);
>>   			flush_flags = MI_FLUSH_DW_CCS;
>> @@ -1050,6 +1053,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   		return ERR_PTR(err);
>>   	}
>>   
>> +	if (clear_system_ccs)
>> +		bo->ccs_cleared = true;
>> +
>>   	return fence;
>>   }
>>   
>> -- 
>> 2.25.1
>>
