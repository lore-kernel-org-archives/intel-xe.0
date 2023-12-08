Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A42C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45BD10E990;
	Fri,  8 Dec 2023 05:05:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD42F10E990
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702011923; x=1733547923;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NmhvUDlZBqRCMX1W48nWi6xkq783tDqjhUyRhL6XLtA=;
 b=a86yGHjLuDv46Nr9B4q7Q97KbwulOoF2gcT36iHqQ0OpxjkcDl+O4e5D
 9pLCibUv+r/VbKbglxwYS2V4X2tGgPhuYLiMHbSYMVHphRfXoEwBmXSwz
 pLOy8Nv2yx2Y5J8FPUApBXNQENB9BxeJNn+AUBOEjXRbQjv/1wNDBnQzA
 n1l7C397tkbQYjg1ljf0hf8yfLFd2lKEfww9VO8ZgAvo3LMAe+vKCwYFo
 uwsWnzDDBuUc8orw3kxDAQVOF93IVg8XJ5eyaLDBkTePHTloXutaVFt2C
 dgHf0cuTbchqHyrmALM9gVqjUe9dSaeNKNZICKEpEHSZz7xFkI6EFEbi1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480552989"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="480552989"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:05:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1103439665"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="1103439665"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 21:05:23 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:05:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 21:05:22 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 21:05:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U52z/iiz4bmwwHOhtwqTQHRPush4Ria+hG+EFYNgnRfQSVR5f4yaAB9OnCbEoRUUxcBsEVE7VNyJklC+BP3K0ju38Hj13BJf2HZco//h/i1zlq5fbKjiWMAT+J9RGih7W2lmKj3DFwU+WugxexYlvPaEED9/cHjlRzquejN1SOxFfyDGe1TwH86mXX0/FJmdChSva+Dd4alnPTgs/0DtUIQ15Wr78MZlmhT0gsIS/PD5ROI1ExrkD9MUSl4RunxgPSF7hL9QDilAcExVmFybolrfwCYBe5nv1CPUrdVE1DyT98WuOP2EkfKmxK0338Sgvz7xDnfpOevsqkZRc6Jj9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8Xmf+7brLg+pgmYxe/ba8NaUuOmfj0tuqhx1k9M8rI=;
 b=JhS96S0+boe/JoIokldX0k5tVfkQVSKh/XQV+IisE/9Lr0IbQGVz+bzhO/SjoRh6sV9PiRzWFo0mr39psfx6fR3ydO+NzMY+I4nDvFXPz6E2Lh8B7pwwrOxxGd3VPPNeM3MHugsUTTBNKDyBFnk54FHktoh5GAhlOfOejHxgWQFZvD4I6HGC9vBRybZoIzExGEVk1ZAuKlcgWP4K0MkQcxSFuKc82pU99Fqsh70rtT2BksYqw51mlxr1XxylH15WfgwTJIXpnz7NjqKeBxCOuHmwPeLkx1nAdqnUQjvmeJSqKIGJ9jMYHRRQ21drJRy3WLO/PZFGZSQeUBqQ7BVj5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8705.namprd11.prod.outlook.com (2603:10b6:610:1cc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 05:05:20 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Fri, 8 Dec 2023
 05:05:20 +0000
Message-ID: <f175d2c8-f671-47b0-8cbe-a6fd6a117c4f@intel.com>
Date: Fri, 8 Dec 2023 10:35:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] drm/xe/xe2: Update chunk size for each iteration
 of ccs copy
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
 <20231207091922.1224800-6-himal.prasad.ghimiray@intel.com>
 <64600d5a-09e8-e73f-40e7-8ed4486971d2@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <64600d5a-09e8-e73f-40e7-8ed4486971d2@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0219.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: af0b77cb-27fd-4b24-b78b-08dbf7ab46ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PRRp2BBogSTKmFi0E+Q+rpqrYirGQenIL9+tonedROhmrZqP9PSZ9PLxRHjSMydJFSqji8hxhsOhJcIZlGzuD8IjPIZmq1nIsu1du8wepybLASK+TJdYumfz3PrqNCn84Ff+IEXkIL65MHwQpjUb4q85dI7wT3/sAVwvWw8DF/n+47cYddRdaMKbcHNfSf0LCHU382yMnR3OGaGYjGqoqPyZcQP9DYIWecA3/oNPNxB3DQDy4aEUjiWhkwa1VqbcZAGnHfb4qMvZitCVGR1/z2VAC/Ks6g5t3vAWZ5c5X7WrMMRW4hMcLKJqSlOUt46QolwCYFm42DFsoptkm3mcCrlQW7T9VXvmTwA5Yiv8+7p6ZXRip3ciqe7vlpnkQChLGqIowDsFxhGVW6/lIlGmFfLf615fMgeOwpCeNTWiKPOi8GEq7Soi5378t/gEtnoKtLgUx+WDryPiaMPxakIa5eaeajY6pmjzr5Vx+krsa5wavYKl/6r6V9DMhFfWBdrvgBsnuX1ELPSHxhbe/pChzGZJsVG5jjllRXlgDg9yIESnZ66b5nDXhOpf1jNbIWgam+sUh3Wzl50v2IziOW6HL31rb2uj2nmJvKhN9ZUuOvzRt6KRMma7jv4a9MzZTG8HGk+mPxUb40ikpBOKGgQyvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(31696002)(31686004)(6506007)(478600001)(53546011)(6486002)(6512007)(38100700002)(6666004)(5660300002)(15650500001)(26005)(316002)(86362001)(66946007)(66476007)(66556008)(2616005)(8936002)(8676002)(66574015)(2906002)(83380400001)(41300700001)(36756003)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGQ4enNJcEZCOEQ3QUdwL3VZR0UzSXBTbDZyVjQ0ZGlIQ0pMUXM0S1dKdnQy?=
 =?utf-8?B?MDVmRW1WK3FGZEhwVGcyRVJBUDd1ZjZsa1RvdUE3dnFuaTlxS203M1dTTFpa?=
 =?utf-8?B?Y1ZrNU42cWt1MGpDMVN2aGRvQitYdUZ4T0E5QUdDODZMZE1nTXZmRlNRRU9w?=
 =?utf-8?B?emlkTnI2U3hDUUpFTXVESHh2MVZjUi8rSndieG93b0w1WEhTamZNK2dFZFV2?=
 =?utf-8?B?dkdJM094UlM3Y1RwY2ZmREg1c0sydnRLbkZTZjgxRHR0NnRLVmgzNUlRSEtt?=
 =?utf-8?B?c3V6WHU1ZzdyN1lJQUFaYkM2ck05RzhzcFdGNFJja3hra1lHWEl4MkdTYTFa?=
 =?utf-8?B?c0NUQ0Z5SHIrYWI0TE1ZNnNCb2hVMG4vbHpsWUlMSVpMcW90K1FVcVFkODJ0?=
 =?utf-8?B?WVJhVkhHTlBkS0xHeWRzNW1pa1pYTDVKYStJZUJDNWtheDFCN2tvQzhEcEVr?=
 =?utf-8?B?NjVkOVJTdlBRYW9HcXBQSDJIV2dmQnRMck9Nd3RsejRLMEdybEdyclR0VnNx?=
 =?utf-8?B?ZWIwYUczMGNwTWtmaXE1UFV0Y1NYWm1lRElnTjhRaGt6YUxyWjVHaDUwbm5Q?=
 =?utf-8?B?V2FOOEEvWS9udHhhQTU3aWtXV2tFand3bzlHbGxyT0tGSHBhZlovL1JIUlN6?=
 =?utf-8?B?UXdKN0pMbytkd1h5WEZ4QWNyalE4elU0ZjBQUDBjVU5zaTNnY0d3dFpESUox?=
 =?utf-8?B?YmZyelUxb0RpeFJWeGdQaDAvdG4yVnBmWjhJL1NlSHRkWFhqRXZZbmd0Skth?=
 =?utf-8?B?SEFINXc4MHJsanRFZG92cWhMajhvUTh5dUVuR3Y3N1RMMEZobi92aUJJLytV?=
 =?utf-8?B?b3BHVHRpYU9wOWpJbWVaMk04ZlZvczBHbm9xTnV1NE1zNGZ3QnVOdC9YWUY1?=
 =?utf-8?B?dmtENXlNN1kwVWtSMkU5bnNNNWZESWp3Q2hxOUVPbUQzSkVYcVlqUllnSTAx?=
 =?utf-8?B?RWJ4NVZLclJ5TFQ5QnZxc2Yvc0k3OStVQ2xQeXducG9hRm1DMkE3ZjVKclBG?=
 =?utf-8?B?UmJPc0MyWXZaMXgweHUxUytTNi9PYi9HWElTbkJ4TFhZQzNSMU9Sc0cvOUlw?=
 =?utf-8?B?RTRTeFI5YXJROERCTXhDUzJ0U3BQd3A1WEc1SHZOOWRlWVp0NitxUkk0WUhU?=
 =?utf-8?B?MXZ0eC9PcUZMREZkSDJQbXhGYmJJU0FlYlpIU3MvQTgrb2plQ1FmVmZTRHAv?=
 =?utf-8?B?YkNqcjlkMkFTOTBzU0FTbk1DZ2lDdW1xdHoxZ0pLT0Q3azNydHhudFRXREp5?=
 =?utf-8?B?M3dHN3FlYkRxS1dwcmk0V1F3V1NzSDhRWE04d2RvQzFLblVzOHpRL3M0Vkdl?=
 =?utf-8?B?SVRsTm11bFAwYXovMUNzeHpUanIvZHdXSDJlYm5aNklCc0lRT2l5bzZuUjJY?=
 =?utf-8?B?Y2FtMkhXelB1RW9LOGh0N1o2YlhrTGdsRmx4eUJvVFpaSEV0SDF4VDFQcEJN?=
 =?utf-8?B?YytubFRHdmxYVG1XRUVtaisyTnJPZVpMdjllNVZTVFlVWmVVaVl6QkRlRThm?=
 =?utf-8?B?WWhhay9Ndy9jMDNNMEdsNWg3b3NGYjhKMnlIeWJFWmMxb1FWOFFjckdLTXFo?=
 =?utf-8?B?WTI1aTJyQ1BuTnQ3UU9RREhqNFNwOTdiaDczWlB1Zkl1RmtONTFZRHlOa29t?=
 =?utf-8?B?VGxUSFZtYVhhN1FXejBRZHMwMHZGYzY1ZzZhTTZaS3lXdk9oNlN6OUlKS1VL?=
 =?utf-8?B?UmpaM1BRRkwxenlPK3pkaXRVQkZlRU9BaDU3V0ZLcGZZQ3FzRGRzaFpMWm0w?=
 =?utf-8?B?VUlOblJtS2xFbFVNUXhNSWk3S1BkemRFVHNiaFpaZjkxSXc0T2FScjF3YWtN?=
 =?utf-8?B?WnIwN1NDL3lEQk5ueE9naEgyVEFSWU1GcjJlcE1zakJ0dTFIWmtHN0xuZmxT?=
 =?utf-8?B?aURBSkFOL2x0ckp5c0hWOUZBa0JRYTZFVGdoaDJWa2JLc3l0MTZDVmhEZDN2?=
 =?utf-8?B?aFF3WWovM0N1WXVtRy85eE16OThMZmdkcC85Yk1zaHRsVng5YlRJTmpodU1I?=
 =?utf-8?B?N05qZisxNXNPeDZrOEFwOXlBQ1JGdzVOTXlsbExzZ0lHaG5tR05uWHAxbUU2?=
 =?utf-8?B?UDNCMXZRcUlKc2lrWDIyRWpLdjR1bjBaM3UwaklhWmF1TlVLRVNDVTBrVHNy?=
 =?utf-8?B?Z25WK0R5VWxUMk5HRkdjNVdNY3lyUlZOU3FBb2FXc2tHYk5KUVlzWmlVU29V?=
 =?utf-8?Q?Qw+VSmIB+T+U3THqsiqpZ64=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af0b77cb-27fd-4b24-b78b-08dbf7ab46ea
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 05:05:20.8043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsLGBDm+x55khx9dp4XFijg6mGMm2peFLU7CdiKac8+pnothMw13KnLA+5bLf6VT3OWmwm6aNNoGmZ4mxauz82MIKhm9j0427Z/oedKIo4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8705
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


On 07-12-2023 18:14, Thomas Hellström wrote:
> Hi, Himal,
>
> On 12/7/23 10:19, Himal Prasad Ghimiray wrote:
>> In xe2 platform XY_CTRL_SURF_COPY_BLT can handle ccs copy for
>> max of 1024 main surface pages.
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 34 ++++++++++++++++++++++++++++-----
>>   1 file changed, 29 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c 
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index b4dd1b6d78f0..98dca906a023 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -672,11 +672,24 @@ struct dma_fence *xe_migrate_copy(struct 
>> xe_migrate *m,
>>           u32 update_idx;
>>           u64 ccs_ofs, ccs_size;
>>           u32 ccs_pt;
>> +
>>           bool usm = xe->info.supports_usm;
>> +        u32 avail_pts = NUM_PT_PER_BLIT;
>>             src_L0 = xe_migrate_res_sizes(&src_it);
>>           dst_L0 = xe_migrate_res_sizes(&dst_it);
>>   +        /* In IGFX the XY_CTRL_SURF_COPY_BLT can handle max of 1024
>> +         * pages. Hence limit the processing size to SZ_4M per
>> +         * iteration.
>> +         */
>> +        if (!IS_DGFX(xe) && GRAPHICS_VER(xe) >= 20) {
>> +            src_L0 = min_t(u64, src_L0, SZ_4M);
>> +            dst_L0 = min_t(u64, dst_L0, SZ_4M);
>> +
>> +            avail_pts = SZ_4M / SZ_2M;
>> +        }
>
> Can we limit the size inside xe_migrate_res_sizes() instead?
>
> if (!is_vram)
>     if (assume_compressed)
>             size = min(size, NUM_COMPRESSED_PAGES_PER_CHUNK);
>
Sure. Will try with the same.
>
>> +
>>           drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n",
>>               pass++, src_L0, dst_L0);
>>   @@ -684,18 +697,18 @@ struct dma_fence *xe_migrate_copy(struct 
>> xe_migrate *m,
>>             batch_size += pte_update_size(m, src_is_vram, src, 
>> &src_it, &src_L0,
>>                             &src_L0_ofs, &src_L0_pt, 0, 0,
>> -                          NUM_PT_PER_BLIT);
>> +                          avail_pts);
>>             batch_size += pte_update_size(m, dst_is_vram, dst, 
>> &dst_it, &src_L0,
>>                             &dst_L0_ofs, &dst_L0_pt, 0,
>> -                          NUM_PT_PER_BLIT, NUM_PT_PER_BLIT);
>> +                          avail_pts, avail_pts);
>>             if (copy_system_ccs) {
>>               ccs_size = xe_device_ccs_bytes(xe, src_L0);
>>               batch_size += pte_update_size(m, false, NULL, &ccs_it, 
>> &ccs_size,
>>                                 &ccs_ofs, &ccs_pt, 0,
>> -                              2 * NUM_PT_PER_BLIT,
>> -                              NUM_PT_PER_BLIT);
>> +                              2 * avail_pts,
>> +                              avail_pts);
>>           }
>>             /* Add copy commands size here */
>> @@ -923,8 +936,19 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>           struct xe_bb *bb;
>>           u32 batch_size, update_idx;
>>           bool usm = xe->info.supports_usm;
>> +        u32 avail_pts = NUM_PT_PER_BLIT;
>>             clear_L0 = xe_migrate_res_sizes(&src_it);
>> +
>> +        /* In IGFX the XY_CTRL_SURF_COPY_BLT can handle max of 1024
>> +         * pages. Hence limit the processing size to SZ_4M per
>> +         * iteration.
>> +         */
>> +        if (!IS_DGFX(xe) && GRAPHICS_VER(xe) >= 20) {
>> +            clear_L0 = min_t(u64, clear_L0, SZ_4M);
>> +            avail_pts = SZ_4M / SZ_2M;
>> +        }
>> +
>>           drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, clear_L0);
>>             /* Calculate final sizes and batch size.. */
>> @@ -932,7 +956,7 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>               pte_update_size(m, clear_vram, src, &src_it,
>>                       &clear_L0, &clear_L0_ofs, &clear_L0_pt,
>>                       emit_clear_cmd_len(gt), 0,
>> -                    NUM_PT_PER_BLIT);
>> +                    avail_pts);
>>           if (xe_device_has_flat_ccs(xe) && clear_vram)
>>               batch_size += EMIT_COPY_CCS_DW;
