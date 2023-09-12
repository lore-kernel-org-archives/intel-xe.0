Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DE3CA0EC6
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 00:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4119210E02F;
	Tue, 12 Sep 2023 00:22:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A313710E02F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 00:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694478171; x=1726014171;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nNWLfkRHdrMfWnhDFRikTBX4d58bxRlh5rq7Ef5uwsI=;
 b=OxtOhhHL6afHHj0ggS7c286Ng6e8DlvbynN8w5MktMjnp0s+JEYSr0WB
 e65/3tNABAaJTVdELSu/sQ3GaJVY7zkfl1sFHdA1s0fURia3LrB22CN3V
 zUShUTCHDPd0hwVwrkc+4794gtYNEYVJm6GRvcXsHozTdrkMzpH6l5xnv
 pCDL+7H5pHXupPtSZxXR48l9MuodU5anMBkJQzbPMFx4JL46nPWKtdGjx
 lbMBcXxSp+cyqZZcA3YOK0FkpGVuY3e5D1nw7+l7oLaY+wCJ+ElrAzYzn
 kbeIajYGcppZsJRb1xDY0xXA1aD0FqWLkDqIHW7nzJFJrRsRSJiRlmoYF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="409197927"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="409197927"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 17:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="858560138"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="858560138"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 17:22:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 17:22:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 17:22:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 17:22:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 17:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luioq82owVQ1Gnv7QbFxvpFF7brehKI8FqPOHeOvFe4MWFp6xaHmUgnWWrFbxd7MtQ3pYFEvJPoTM8Dyo+/UkzDy0DGh8fONjuqSuFG2wbWZ1Wd4glXjZypeAAztzkLuIc1y7OoXwgyJ6C62aYPTFk+KBCm8pujEkztP9TAScRmhY5ICwWV8blayn14dJ+ztdJC3nQQMP0V1IGt8ti9Xim1oXkp8HuEw7lAre5UgLndpTaaBgCcP5HqNAiHUuD7AGpCbQV7Jt3zLN+LtQp9d6WxJ9oulAbbM7DIV5ca44YRs4iaDCFeGO3kqnN1PsugTeUybozIoK/a4xff+AlnbvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpZn3co1PwPuAQRU/zhlGiRcvBypl/7OFTNHCJRTajo=;
 b=ZB71GuY4vNB3PwDHZL9tr492o2rPpRnBhWvJLKQZTru+Q7J+f46jsz8VuedbPOm/D8U2uCK+3SKQSLxwvSiSVd4kHTm5X9a0NumHWatjwklT3fEm+RwY9omK2El6ZkLkkusBlgHvFry2hPAbVps9Rs48dUCKDKUdoZ4vvPCBWVCUjp9jxNIscIV0HjBHXrL2ny5ZfXbL2rWy/71AMfnXQe7utPg7h7B5m4iBT80KFTsqcvszX6gKiqbQRODHP5kvBYwq+lCF7nAT4Xt+CoYp3FUIDanE3TEkrKKbpXYmLmAyXq1ilOe2RWm18GakB+s8J6ov+51bvvUS7jQjHAs7/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 00:22:39 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f%4]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 00:22:38 +0000
Message-ID: <de1ae6f0-2ef7-46df-8bdf-16b8024e562a@intel.com>
Date: Mon, 11 Sep 2023 17:22:37 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230802212646.838717-1-daniele.ceraolospurio@intel.com>
 <20230802212646.838717-2-daniele.ceraolospurio@intel.com>
 <5ca76588-9822-cc1e-3c91-5f14918312ea@intel.com>
 <6a7efd35-773e-4b61-8f61-8ef733c7edf8@intel.com>
 <69339bbc-c78a-9e7a-ac1e-9ac08c84f79b@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <69339bbc-c78a-9e7a-ac1e-9ac08c84f79b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0177.namprd05.prod.outlook.com
 (2603:10b6:a03:339::32) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: 138e3e99-4c7e-429d-9373-08dbb3265eb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wy0M9x8Xaqi3MjaJmJVBPzNE9ghsuFeZnQw4eGlVR+nKv6ojTf76Wx+3Fc8DxA3iB6q8vealf7oi+0n0fUKHo1YQbYIgpS0q9VkMcZw6EsQbNdDIT+DDFvApe5iviNXtNSJHkP7QdAN3e75oVn2d9m/zu1K4xBhMRTlcnPsxxpnBfY3QCJEQnPhUGu+GC2BAoo2DIcFhVQS8ThAFcbs+QnojadDmxKX29ea+p55+ODOb8/7ePwyvdUk1H2jF8LLt0fuJvfBURL+55p4YnVN1xZFzbVz58PfoEzruuQKnwR6VlnRJRS0j9IIS6/Gev4EM+Lg4krGDyIkgcfHwUx8hb6ohPfJH2U0syTW0Wq3F82WQT4Jg/f4z9PdN7VtmTp+73uRIsAbB7UvdpyX0QKcD23A41JeiKM9dJY9XrDew4H9ZBB0VfLa11S0oldBizLncZxdmxLquxf3RM768agkH2gCJ7mhmDnb+zxLGwex4lBxROkKoJ/KAWJn+TZn1NhqVTb8vsBs3ZGyqTdyb9hndNKYdaO07++Rz1yQWpMRzrsFosL5zC5CuzHm1o7tfS2YHPZUjx29pbOejNb6W7KmtnxrUZTtqJdWcu9aQtJVEh7l5keh1vyZUdLMJxO5gG/W/qYafzMiQNmj8ZkRlx0H/VQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199024)(186009)(1800799009)(31686004)(86362001)(36756003)(31696002)(82960400001)(478600001)(38100700002)(2616005)(26005)(107886003)(83380400001)(2906002)(6512007)(41300700001)(5660300002)(53546011)(6486002)(6506007)(66476007)(66946007)(66556008)(4326008)(8936002)(8676002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2dEZjlMc3Z2NlBzdGJXVFNxcWFGTkZNbUxOOEU5NXNyR0UvSEZjemZLbU0w?=
 =?utf-8?B?V1ljUlFJMWFFOThjVWIvNVhHZ2FzdEVLUWhVMVhEUHlpMmdEOW1iUFZ2NHhL?=
 =?utf-8?B?RHprVXdWb2FHNEZQRkVpQnNrbjJXcDNtdkpCV2JmWWlhcXRQdTIzMG9VM25X?=
 =?utf-8?B?VWhsMHZpNkRWZGUrZHM1RUJMd0lOSWFhREdTVGhoQVVRTUlqQ2pUWkhLRy9n?=
 =?utf-8?B?TUMzNGlzNkh2c25mbmU4b0k5WjNOWTN2Y2l1ZDRzTlVSQytUTUlDNHI0eUNy?=
 =?utf-8?B?bW9XRzB3WjZXTHNXSkJsZzBNcHZsRk0va1FTSU5qejdTeGhSR0FoTnZhL1NM?=
 =?utf-8?B?K3FTRHZBSXgvTFZrOVY1VWNnd3BRTTBmQVAxVFQ4a0Q3VDAvZ2xGTFdFRzJ5?=
 =?utf-8?B?Z0VtQm1UcjA1NHJXQ0ZQZjk1VWJ2VFdsMVZtSjdTU2VsSTVMdXg3b0NWMkxo?=
 =?utf-8?B?d2twdXZJT2lncWRYOXNrejRQK1E4b0o5QkVIN01WQVYyUDN5Y1JKNHRjMDda?=
 =?utf-8?B?a1Q5VVhaN2FGdG1lSkdwa0NBM01QL2F6S01zaktKMkFuZklSNUtidHNwWTVY?=
 =?utf-8?B?cGJ5YnZZczlRb0I0bElUUjIvNWg4UFhZY244eldBdUs1WUhaMkpNcnBnOE12?=
 =?utf-8?B?ZHYrQlptRVY1RTRWWS9GZE9vUlVVdE4vMEFrb3Z4djlOcXRyWE1GTzZVNnhq?=
 =?utf-8?B?Wk1jaGpPZVR0MTlickVNN09Ic2VlY0lDYlNCWDBuVjZkdWcrSHNpSWlJR1dR?=
 =?utf-8?B?d05UQUc2Q3dLeVF3QTMvWE1uWVJ3bVhLNTg1Q05ybTFhZEpaSWozQ3RmMkNK?=
 =?utf-8?B?RFhEemJvVVZjNFdyOCtHTXJKUldibUJOQnovNGtDdWMzNFNKeWpNRnJ5ZnBQ?=
 =?utf-8?B?cW5UMnphdW5ROElpNEdUcjlYRmVMVnc2dDJEVUdZTVBMeXk0VkNHTmI1R0g1?=
 =?utf-8?B?QWhsWE1IckppL3U3VkZQWmZKSExVTnlEaTBBOUtLZXhPL3B4S1BLdEJKNVIr?=
 =?utf-8?B?VndWRWpwOGw3bXY4cEVOWHR0eDBnVDBrVXVLa3daVHJHVDFRNXJselY4VElo?=
 =?utf-8?B?RENXU3V5NDRtQmhOK2lIRDZ2NmFOTlNhMWhrS1Zhb0tGWkJzQnNaV3JYK2FB?=
 =?utf-8?B?NmZTNHNUeDU2dHE3ald0SFZEU09iVFJaZHg5ck10MjB1OExWckpaY1JpOU44?=
 =?utf-8?B?QnEwVTNEdmxnVXd5T1ZPZ1VDWGJjUUgxYk4rSE1vbTd4eTBUM3U0NzJNRzdX?=
 =?utf-8?B?SDhHM0pQNWFhWVhTV3V5OEFQcGVYVFdtNCs4MmpTRDI4Smg2MXRBWnR0alVB?=
 =?utf-8?B?ZG1kOFlSd0IxODQrOXpPRkFocWR6MG5xUm9INmlHbTEwRWZlai83WG1KK2VC?=
 =?utf-8?B?OUlvajlHVVd0YVNaS2Ewb3ZxSCtlMi9uOVh5NlFMTld6QlovdHlhRHBpa0dQ?=
 =?utf-8?B?eE1Tcmh1dVlrUW14K1JwUXhsT3dyRXNPLzZiRCsyRW1BRFNZVVBxTHB3bWxy?=
 =?utf-8?B?T25YNUt3ckNuTWJGTGZNZkRvL2RrOHhVQVBUSnF6YThoQ2tPWHRSczdNU0tH?=
 =?utf-8?B?Q05ZUEtoQ0lzdFRzYTVPUkVGOFd1WVZJN0hrcjBCTUR2NDVVaUJpYmRpbXlz?=
 =?utf-8?B?TzQwdVFSRnZCdjNJS1FpejVabWJPSzlRaHYrYjZ6Q1dBSE1lbzFmSExhOGI4?=
 =?utf-8?B?bjdQOVVJMTdZOHp5cDA4SjZFRDZ0V3RZeTJzZVlkcWg5NzlmQUtjTlpBcnl4?=
 =?utf-8?B?V3ZhS3JZR3VaMmN0M3N6eWZUb0ZvczdrSU9qWTVQdE84eW4rR2psZ2J5Qk9z?=
 =?utf-8?B?d0pBbTY3VS92cnowakN0WHZOOEYrbGh6dkliMFg5c1ptZktPajYxVXJHV3VQ?=
 =?utf-8?B?SFFmYUQrVVBDTzB4U055OWRXQ2RPZ3dHL1JJVWh1Wm9WQStOb1lCS3p6TzhQ?=
 =?utf-8?B?bnhJYzFOSDZUNlVMdlBFeXE4bXR0b25DV0hXOTk1T3d1UEpwbHdKZVlsY3JB?=
 =?utf-8?B?TnFPbkxETGdoRHVZVmdqWkcrZkNaa3dreS81ajRtWm1zcHBkcEtVSjFwaTJ2?=
 =?utf-8?B?UFVCWUhpNll5RXNsRjNBY3lDbytZRDdrRWpIQkJva0lKZThBOW1Cdlc3UklE?=
 =?utf-8?B?ZG1vOTZPbi91bnFsSWMzV05ReVVzbkszTWR2RzFqVWFPdG1NSjhqK24yZGFW?=
 =?utf-8?Q?V54YxcHryqqGK4b+y2dsq24=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 138e3e99-4c7e-429d-9373-08dbb3265eb1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 00:22:38.3758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7h9i72F13vMuXCcj3PGFg39/wyx8ckzet3EW/MQvOOgN4stiFTqu8E2V4c/ZA2uCAGO/7HQOUo+zsJw9Bj7i3P1l73GmwDJF/v9FRon/rWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/uc: Add GuC/HuC firmware path
 overrides
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



On 9/11/2023 5:16 PM, John Harrison wrote:
> On 9/11/2023 17:10, Daniele Ceraolo Spurio wrote:
>> On 9/11/2023 5:00 PM, John Harrison wrote:
>>> On 8/2/2023 14:26, Daniele Ceraolo Spurio wrote:
>>>> When testing a new binary and/or debugging binary-related issues, 
>>>> it is
>>>> useful to have the option to change which binary is loaded without
>>>> having to update and re-compile the kernel. To support this option, 
>>>> this
>>>> patch adds 2 new modparams to override the FW path for GuC and HuC. 
>>>> The
>>>> HuC modparam can also be set to an empty string to disable HuC 
>>>> loading.
>>> Why the difference between GuC & HuC? And is 'disabled' 
>>> significantly different to just setting it to a non-existent file?
>>
>> There is the global switch (the one you commented on in the previous 
>> patch) that can be used to turn off all the FWs. I see no reason for 
>> wanting an additional switch to turn off just the GuC, as the other 
>> FWs won't work without it.
>>
>> Also, Xe aborts the driver load if any FW file is not found, so yes 
>> disabled is different than not found.
> Hmm. Given the firmware paths are 'unsafe' module parameters, I would 
> argue that it is better to keep the code simple and if the user wants 
> to shoot themselves in the foot then that is their problem. That is, 
> just treat all firmware file overrides exactly the same. And if the 
> driver fails to load because the user has requested an unsupported 
> configuration then who cares.

I think allowing the override for GuC would actually make things more 
complicated. The code assumes that the GuC is enabled if the flag is set 
and that all the GuC features can be used, so having the GuC being 
disabled under the hood via this override might actually make the driver 
panic, which would be bad even if the parameter is unsafe. Not allowing 
disabling the GuC is an extra half-line of code, which IMO is overall 
simpler and cleaner compared to either risking panics or having to 
secure all the paths against a missing GuC.

Daniele

>
> John.
>
>>
>>>
>>>>
>>>> Note that those modparams only take effect on platforms where we 
>>>> already
>>>> have a default FW, so we're sure there is support for FW loading 
>>>> and the
>>>> kernel isn't going to explode in an undefined path.
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>> <daniele.ceraolospurio@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_module.c | 10 ++++++++++
>>>>   drivers/gpu/drm/xe/xe_module.h |  2 ++
>>>>   drivers/gpu/drm/xe/xe_uc_fw.c  | 30 +++++++++++++++++++++++++++++-
>>>>   3 files changed, 41 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.c 
>>>> b/drivers/gpu/drm/xe/xe_module.c
>>>> index de85494e2280..0660017c3e83 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>>> @@ -30,6 +30,16 @@ int xe_guc_log_level = 5;
>>>>   module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
>>>>   MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level 
>>>> (0=disable, 1..5=enable with verbosity min..max)");
>>>>   +char *xe_guc_firmware_path = NULL;
>>>> +module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, 
>>>> charp, 0400);
>>>> +MODULE_PARM_DESC(guc_firmware_path,
>>>> +         "GuC firmware path to use instead of the default one");
>>>> +
>>>> +char *xe_huc_firmware_path = NULL;
>>>> +module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, 
>>>> charp, 0400);
>>>> +MODULE_PARM_DESC(huc_firmware_path,
>>>> +         "HuC firmware path to use instead of the default one - 
>>>> empty string disables");
>>>> +
>>>>   char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
>>>>   module_param_named_unsafe(force_probe, xe_param_force_probe, 
>>>> charp, 0400);
>>>>   MODULE_PARM_DESC(force_probe,
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.h 
>>>> b/drivers/gpu/drm/xe/xe_module.h
>>>> index 2c1f9199f909..e1da1e9ca5cb 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.h
>>>> +++ b/drivers/gpu/drm/xe/xe_module.h
>>>> @@ -10,4 +10,6 @@ extern bool force_execlist;
>>>>   extern bool enable_display;
>>>>   extern u32 xe_force_vram_bar_size;
>>>>   extern int xe_guc_log_level;
>>>> +extern char *xe_guc_firmware_path;
>>>> +extern char *xe_huc_firmware_path;
>>>>   extern char *xe_param_force_probe;
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> index fd53ef9e5c99..ef873e894714 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> @@ -15,6 +15,7 @@
>>>>   #include "xe_gt.h"
>>>>   #include "xe_map.h"
>>>>   #include "xe_mmio.h"
>>>> +#include "xe_module.h"
>>>>   #include "xe_uc_fw.h"
>>>>     /*
>>>> @@ -209,6 +210,30 @@ uc_fw_auto_select(struct xe_device *xe, struct 
>>>> xe_uc_fw *uc_fw)
>>>>       }
>>>>   }
>>>>   +static void
>>>> +uc_fw_override(struct xe_uc_fw *uc_fw)
>>>> +{
>>>> +    char *path_override = NULL;
>>>> +
>>>> +    /* empty string disables, but it's not allowed for GuC */
>>>> +    switch (uc_fw->type) {
>>>> +    case XE_UC_FW_TYPE_GUC:
>>>> +        if (xe_guc_firmware_path && *xe_guc_firmware_path)
>>>> +            path_override = xe_guc_firmware_path;
>>>> +        break;
>>>> +    case XE_UC_FW_TYPE_HUC:
>>>> +        path_override = xe_huc_firmware_path;
>>>> +        break;
>>>> +    default:
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    if (path_override) {
>>>> +        uc_fw->path = path_override;
>>>> +        uc_fw->user_overridden = true;
>>>> +    }
>>>> +}
>>>> +
>>>>   /**
>>>>    * xe_uc_fw_copy_rsa - copy fw RSA to buffer
>>>>    *
>>>> @@ -346,7 +371,10 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>>       if (!xe_uc_fw_is_supported(uc_fw))
>>>>           return 0;
>>>>   -    if (!xe_device_guc_submission_enabled(xe)) {
>>>> +    uc_fw_override(uc_fw);
>>>> +
>>>> +    /* user can provide an empty string via the override to 
>>>> disable */
>>> But only for HuC?
>>
>> And for GSC once I get around to add support for that. I wanted to 
>> keep the sentence general here, since there is no visibility of which 
>> FW it is and there is already a proper description of the override in 
>> the modparam definition, but I can add a "non-GuC FWs" at the end if 
>> you think it makes things clearer.
>>
>> Daniele
>>
>>>
>>> John.
>>>
>>>> +    if (!xe_device_guc_submission_enabled(xe) || !(*uc_fw->path)) {
>>>>           xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>>>>           drm_dbg(&xe->drm, "%s disabled", 
>>>> xe_uc_fw_type_repr(uc_fw->type));
>>>>           return 0;
>>>
>>
>

