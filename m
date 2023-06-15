Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3C6EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 16:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8B210E51E;
	Thu, 15 Jun 2023 16:36:14 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE80D10E515
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 16:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686846972; x=1718382972;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kdTLD/3RgWR5XlhxwhHfMM3dNz5cVyoR2guadJcgsjE=;
 b=iEgVhJUGBSacbt9tPQ0ASQ7sN3LE6DU1+j+2UJgx46cij/91pE2/kcOc
 KhyxZ5Mgy1lDyp9OBF2AbUWHI7TOH0t13NYCGybHQfXwCIpePhuu3Iepo
 D6QteRpmkKXrO8onO3nUeAfzWl2aeGB2ztVySM5WMBkJi6dOal6m5eYE/
 t+M1lqwNuNSWvKxasX14Zkh/EVhovuHPH/ewVnFoI6OcQwV4W9wu4HGMV
 gd1mJu/65ArgPYtQ+8AA+ogpj0KBHQmMvIUC37SEoQwbIbwj1KIf9Ijna
 Y8I9Iv9VAw46780+Se08qI1WakN0ViGwd89bT63biDgOHTOMzcvsYkwtv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="361479274"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="361479274"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 09:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742306626"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="742306626"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 15 Jun 2023 09:36:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 09:36:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 09:36:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 15 Jun 2023 09:35:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WK1spk+raDblUC6mEf3KnTVsk47W75v8tCMDumb0lsB8Hvjr10ySruUGc0p8zFXLgALUTJk0UezKLYePAO/+yUBpKFvqVjGIas8/OdvLShXkbhj+/UAOIsmxUCmVx0aeGnZXWYugp4QF+xTS6AF+DrMCIg337S4cicx3TfUnq8s6x5EubJTvHb3/pLl46jTOpupXUHn/9t/nqQ0Qc6uWK5GxJyLdmRwM3x3SliH1g1vDvfJ+stWOd8uhLwd6KsFb2XqiVg6LjlOwF7i9FzAKlowqXZYZQo9P37Jn/XGGERrGjKww7EhmwZ2YX7ifOjMSp42z7wvC+P3DrpJk0c5e9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfnZlr6qxYkto6FF+r2mc4N6p4soDy0ZAbfpLN8zMRc=;
 b=V+f3dXC1mTVtIxsuak4gCtwcajAO/zbeIfl/1fq8PPwJdaNPwq+yeok4t8Z15CA7tYD5ddHH+icEXgSKkfoH0mhPehTxaTevNIdfQSl5BG4gYhOpE1pNtB1JnassZd72PrHqUTNv5o4iJqbLwIb7OfwIe40UIRnAhn36q58jNReEYOXA93O9q1KMRR4bn/J24XeWCFNRnwWt5TiSqoq1wQNiFJ4rlzF5wcRtVsy7iYsTRoNvjfYaD5nUwSrSbtaRRxcK8WMv29zGJrCBNpyV1AGvcGfwZs7nAKobPMZ6gX0a+qYYr0Rx+Pux5sk08++8qSx8ZGEa8gIPkhv/ZfK2cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 15 Jun
 2023 16:35:58 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d2fe:fc74:e24b:26da]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d2fe:fc74:e24b:26da%4]) with mapi id 15.20.6477.028; Thu, 15 Jun 2023
 16:35:58 +0000
Message-ID: <9a2854ac-0d33-a1cb-fc5e-9bfffcdd2490@intel.com>
Date: Thu, 15 Jun 2023 09:35:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20230615002521.2587250-1-daniele.ceraolospurio@intel.com>
 <CAM0jSHMO+2qWYJMyt7D-vS740NmFcPH+MzcW=Qg+vz+st2kK0A@mail.gmail.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <CAM0jSHMO+2qWYJMyt7D-vS740NmFcPH+MzcW=Qg+vz+st2kK0A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS0PR11MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f48783c-4dcb-4eb9-3539-08db6dbe98df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CJpfs6Bq3Y4uwy8DcUDCW7SJErICCnnPDn6UDt3IA+wOOooBm/+ecL9ZgpS2R1g2UW+bXQ5b/UWl8iuyBoIu45egzurMynZP/5cLYfAUzUMqpJuUstsboDLg+5NsDk0fP+ksO8Hc5l/F/bJS11hAWCyMkE6lmnZB6TjE3uh1xeBDFtYXYo/i7g7b359F8R/yKL/MLZ762mK2bP2nPjGN6t/LbNmHZH1lS1/6x6juxlJn1n9wrJ2ea3AvUeUpf3N0/851EursTTPpCQpUs4tVI4+pVoK5U7C9aPVNmtGyZLaIov5iNYYdLDzVmENWt9/+vSYPYxTvHU1ViJ3/Fwitd77ccJxwJHgd3MQSdGW7kHnhljlEAIOx0dKV+q0n81yvOvOgykY7le2nGLge3tqu3wkLKHjY5u+9iSuSWWZA6ypApJRHRlGKlF4ZcVHf6oe7quJQtM8Lz2igbNp6JXi05vLwQmXIAP6uNrhkwjuG0XIOaBnFZ8rAl1zJPwUWGIzKrG4ygFZMn8sFD0vNXgJzNi1ziqp8oKRGawIoFR2IidL6CA5BPQXgAFOVore1Vxo9yvyb9iE0L7nG2cQrirY+LrB3gipd7VuA+3XGmcWVYrGAdSf9B2TfciaRvv+LQJl6ZVZKAtPLTsBuiCueZTlCRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(31686004)(66946007)(31696002)(36756003)(86362001)(82960400001)(38100700002)(6512007)(6666004)(6486002)(2906002)(53546011)(186003)(316002)(6506007)(2616005)(4326008)(478600001)(83380400001)(66556008)(41300700001)(6916009)(8676002)(66476007)(26005)(5660300002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blNWcjRvYXpIWW1iQk04N084K1M3eGtIS28vMW93Um00VVJyc0lBdm83THZh?=
 =?utf-8?B?OVZUcmxER3NRek5taTh5Ylhxd0hQM25qamZjWGpzenNHSVNaTDlTRmVFSk5h?=
 =?utf-8?B?ZWdJMTVEa3ZwdGNaa1BNQzI0U05MbU03MTl6YkFMZWV0U3lUNlczbGd4TzdQ?=
 =?utf-8?B?ekgvTzhySXU5T01xS1BJd29kSWZmZXl4YnNCaUlMc0o1WlNZRzZDRU02M3Rj?=
 =?utf-8?B?QmZpTS80OHMxUzF2c1dvZXVDa1NNQytBSXd5a0kva3pMclRGcWN6V2FIZU5x?=
 =?utf-8?B?dHA0MVVlZlpTMDdadzZyUjlmUmNrUmhNZzQzL0I2b25zbzlSVTFaQTBMK3F3?=
 =?utf-8?B?TkxPOERUc2RlWW02WDcyK3lOTTdibXl6Y2E5T01jZ1hETmFtaG5mRVJJd2RF?=
 =?utf-8?B?THNEam9iTWJTV05nZHppblpiaENYcVpIQ1lvb3dMTjdQaU9hTzRnM2JpUkpr?=
 =?utf-8?B?UTVxdDdlajFxRDhPa1hMOW0waVFuSFpZY1NLUE1ZS2ZoWFpVdTRUZnlMUElz?=
 =?utf-8?B?bktpaEo0VVdsZjdmeXd2czJrTnJKL0l5dDBYRThsR2hGVVV2KyszMU1rSGR4?=
 =?utf-8?B?azl3YnFLYzlBK1NiSVJ0dXVRVEhQZ2hZZGszNjhMN2FtenJsQzNuZ1dVaDYz?=
 =?utf-8?B?ZDlPRjYwRk9EWXc0Wmc0M3o5Sm45SDdwUjFhN3ZBKzFCTFcxZkE1RkM0KzFL?=
 =?utf-8?B?cUNUWFBsSUwzaDl4SHFYRkdrcTlkMnNObXBoWmV3RXk1UTdNSk5ONjZvTDUx?=
 =?utf-8?B?MXByU0hRL1JrdlNKVSs4NDVkL0g4ZVVrcUVxeHZHNU1kSkE1SUh2L0s0YS9o?=
 =?utf-8?B?MFJjNkFyN3hvNGhsZDNWblg4NGJRdUFER0VJOGVvVWMrVlA0WkZ2ODFCNGw0?=
 =?utf-8?B?MFh4SmtqN2Z0UStuNW9ZSUhTL2tvZmNzNTZ1UmJ2dXVPS3RVb3crOHUxY2Vr?=
 =?utf-8?B?YzREaWw0dEhuVlpEMlp4dUFiUmdpQ3lHM21FL3U4eFE1cm5rYWxXeU5DekNZ?=
 =?utf-8?B?QUVNeWQ3REdSc2ZObEl3a0prYzZTcHRlNk56TnlwVXdrVi9tTWZmRmF1c2J4?=
 =?utf-8?B?dUJDRlNiWHBnblVyN0lWRmRoclpUSWJPWEZGR1Via1kvKy9jdWJVVzg0YU1J?=
 =?utf-8?B?MDFTUXY4bFdLRVlXRkVHM0MxVC9yV0tEdklUWkoxdXhRWkdvbWtJRjVvYjZD?=
 =?utf-8?B?bjFGUHhpQnRYeU5wLzJHRVg5eDJCM2JOUC9BVjRTUnh2bVdCNFB2YVVZdzNm?=
 =?utf-8?B?M09Ec2hLNXFaWmowb3IrT2E3eHUrUlU4QmlMalp6ZksweUlPS1FRNnY5WHA4?=
 =?utf-8?B?WlFDdWRPRVp3QVVJQmU0QncvRkRiM2taRDRHaStxbEpXMVptMTJ4TEcwMDlu?=
 =?utf-8?B?Y2lOQlJ1Y2RMd0tiL28vanlEbUlRUjZDWmJpWmxWd3NBbFFDWUg3bExBeUVr?=
 =?utf-8?B?b3RmOHdUUThNb2RYUnRUMWx2ODQxTFpReEZlVGI0WmthS3UwaiszR094cmVn?=
 =?utf-8?B?NUdHTThkQ0ZaYS9qUWVxaTU3SjZmQTZtUGZwYm90NCtUNnpFZGJIUjBDenM3?=
 =?utf-8?B?NElvaWVFek44M2MweWpYa24yeklDODdIdHY1MWVkak9rR2g1bzJRTGFZN0ox?=
 =?utf-8?B?UzZ2a2gzV3JpQ0pEUU1kZEpkemFtck5LV3NDbFVxajUxKzdtS2JQeThmd3N1?=
 =?utf-8?B?aml2djI2RDEzQTdyMjhkdXFrd1J6VWlndTZOR3JIRnNhMG1QaFpaMG5DdFVO?=
 =?utf-8?B?b3lHYzl5am9QVkNyZDZlMmNSMEMyZlAyYStWL1ZGMERkUjFERzUwc2REcExV?=
 =?utf-8?B?Ry9rNDI5dnFyZDU3YmtoR2MzVk9qTk5QOWE0cERaNDMrTDhPZDJQZFVXdEZW?=
 =?utf-8?B?amtYaTBTMFNIVFpnNWl6dHRBdmFOMXRPZGE1eGhraCt5QmtrNkFNTUhTWlB4?=
 =?utf-8?B?UU5HZURXeWZ5aEZqWUlvTzc0SXh1Sk1mNDNHdVV3Y2taWWVGb1dmOUhvS3A2?=
 =?utf-8?B?Q1dQaGlFYXI0ZWMrRFFEcXJGTmZEREE4NTk5U2tjeCtLeXBIckdtMDFEWS9V?=
 =?utf-8?B?bnY0VFBIaEgyQ29MV2dHK3hUR0tteW5TQnVLcGpMUUZjT1FmSnNDSTM3TzVn?=
 =?utf-8?B?RmQ0R3lmOVNodWU2bVltVlM3NVNXWFJmaUhaczJIVTkvOVlBYmx3RU9taHZT?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f48783c-4dcb-4eb9-3539-08db6dbe98df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 16:35:58.0432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3uGdbeNrHB3CBzudcKLwz0o7IqgD/mFwB493Ea0k+0T+Ovj45c5Nq9KwD+8EPm7equdA8m5ligp+pTcZpeQEtYuzALoZzpv6KZ5X3ipuOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: limit GGTT size to GUC_GGTT_TOP
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



On 6/15/2023 1:55 AM, Matthew Auld wrote:
> On Thu, 15 Jun 2023 at 01:25, Daniele Ceraolo Spurio
> <daniele.ceraolospurio@intel.com> wrote:
>> The GuC can't access addresses above GUC_GGTT_TOP, so any GuC-accessible
>> objects can't be mapped above that offset. Instead of checking each
>> object to see if GuC may access it or not before mapping it, we just
>> limit the GGTT size to GUC_GGTT_TOP. This wastes a bit of address space
>> (about ~18 MBs, which is in addition to what already removed at the bottom
>> of the GGTT), but it is a good tradeoff to keep the code simple.
>>
>> The in-code comment has also been updated to explain the limitation.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ggtt.c | 24 ++++++++++++++++++------
>>   1 file changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index bae9f66a33cb..7588fbc2f278 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -24,6 +24,9 @@
>>   #define MTL_GGTT_PTE_PAT0      BIT_ULL(52)
>>   #define MTL_GGTT_PTE_PAT1      BIT_ULL(53)
>>
>> +/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
>> +#define GUC_GGTT_TOP   0xFEE00000
>> +
>>   u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>>   {
>>          struct xe_device *xe = xe_bo_device(bo);
>> @@ -111,12 +114,18 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
>>          /*
>>           * 8B per entry, each points to a 4KB page.
>>           *
>> -        * The GuC owns the WOPCM space, thus we can't allocate GGTT address in
>> -        * this area. Even though we likely configure the WOPCM to less than the
>> -        * maximum value, to simplify the driver load (no need to fetch HuC +
>> -        * GuC firmwares and determine there sizes before initializing the GGTT)
>> -        * just start the GGTT allocation above the max WOPCM size. This might
>> -        * waste space in the GGTT (WOPCM is 2MB on modern platforms) but we can
>> +        * The GuC address space is limited on both ends of the GGTT, because
>> +        * the GuC shim HW redirects accesses to those addresses to other HW
>> +        * areas instead of going through the GGTT. On the bottom end, the GuC
>> +        * can't access offsets below the WOPCM size, while on the top side the
>> +        * limit is fixed at GUC_GGTT_TOP. To keep things simple, instead of
>> +        * checking each object to see if they are accessed by GuC or not, we
>> +        * just exclude those areas from the allocator. Additionally, to
>> +        * simplify the driver load, we use the maximum WOPCM size in this logic
>> +        * instead of the programmed one, so we don't need to wait until the
>> +        * actual size to be programmed is determined (which requires FW fetch)
>> +        * before initializing the GGTT. These simplifications might waste space
>> +        * in the GGTT (about 20-25 MBs depending on the platform) but we can
>>           * live with this.
>>           *
>>           * Another benifit of this is the GuC bootrom can't access anything
>> @@ -125,6 +134,9 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
>>           * Starting the GGTT allocations above the WOPCM max give us the correct
>>           * placement for free.
>>           */
>> +       if (ggtt->size > GUC_GGTT_TOP)
>> +               ggtt->size = GUC_GGTT_TOP;
>> +
>>          drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
>>                      ggtt->size - xe_wopcm_size(xe));
> We also subtract the xe_wopcm_size(). Do you know if that is still
> needed with GUC_GGTT_TOP?

It is. The GGTT range is reduced from [0, 4GB] to [wopcm_size, 
GUC_GGTT_TOP], so we need to subtract wopcm_size to account for the 
chunk removed at the bottom.

Daniele

>
>>          mutex_init(&ggtt->lock);
>> --
>> 2.40.0
>>

