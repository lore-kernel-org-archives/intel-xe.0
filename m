Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E255DCA0EC3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 00:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9119610E07D;
	Tue, 12 Sep 2023 00:31:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AFB10E07D
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 00:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694478684; x=1726014684;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WHKHchaZYlf3IQ2bdSohCpYfTTEkMjyWcFdw5Sa+16w=;
 b=THss00Vqc3VtGwYLh57scV5oBI6D71aEIcXrIiNer9RJbAVLio3hXGp9
 Pxi0ylTh8FVNy7XdpEP2S5D+iWoDNVNTBXSPVqMib1dg9SY/eiG5GHrPO
 JF2f+DeUfcq/CEp8V+e98NNhKdRJ/ay1hC7kvEQpLzGcl0QzMIaZvMMbS
 /Msp83MBPO6acdoCW6nQpKLuoeNpPJjO8ovJUrvdCWqrUUXHZVH2nvcsc
 Yv1rj74I8JGseLM97YutYvsgLDh2Dl4LBvHdJ0JDrV+R4u7epn3Hl3wka
 7h18rJERjO+T0t5RSuQqSJ4f/lQve7/6OQe3JzEDw9TQhZu7VmrSyQuH2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444679169"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="444679169"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 17:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="746639341"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="746639341"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 17:31:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 17:31:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 17:31:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 17:31:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ku9KPEbCgrAx121wfBFRS8phrMNgH55jbv/i92PM38285nOhMhHji1yFxxVYTrWFJSfSJ1CClGKQz7/rMRo1Pw/3KbB7ZgyL4mjc0GLO5BiY1sxo1BsEF5ICWaqqqJ35eeO4JNI8PnvsB4Ow+CceNSY6wTdksBvIz9CkRuFrVjH9t8W0ZblxW2H449RYLJQBiRT9AahMbKAMsFIz2nt2iEegR4PoWqXbuReBK1dzf4Kt1S6+4PHbD+G5k2eg3nXFVqWdTYS1G4hWQcoRn7CXpVQ1zYmvp2YRJn+LLSb4LTqQPxRO+aJiJTWaHE3TLN7qok3SaJH41E9V/5MEU9ye2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SR/RCg5+FhTvi4wM9ws1MMCYmJRX/DKOY4u3034/yh8=;
 b=eI7sbLzQ45qr5RxGgudX6vbGuHQw+KUpdVRpv7OKXFWa9bD9wHe1jam5Wp6jEOcKtr67SuKEbldAB56XbbFP8NN2wpCMPyRckTNF3eXV8knW46wGJbdPVnbhLyHICyjwn+WA5UHpZFl2J0bLBAF5DaaVhYrlsHLHrjUU/Vbt39hpxt8wREPaaB0j4jelqrsKqC6yFZwDpM5qYWB8br8AH48WdNTQQ7ULObyEgqNQkXUhdKr+BRduSDwl4hKQhl56SRNq0D6oO7bqHspnKVHENkUs6T6h74yl03WZgDrBMdzkWwCX3vsG731MZuKVuH5/8EB2kwVzkIQA0+z1byJ9Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN9PR11MB5241.namprd11.prod.outlook.com (2603:10b6:408:132::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 00:31:17 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 00:31:17 +0000
Message-ID: <c9c94d8d-f129-45ad-eb4d-a1883fdcddab@intel.com>
Date: Mon, 11 Sep 2023 17:30:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230802212646.838717-1-daniele.ceraolospurio@intel.com>
 <20230802212646.838717-2-daniele.ceraolospurio@intel.com>
 <5ca76588-9822-cc1e-3c91-5f14918312ea@intel.com>
 <6a7efd35-773e-4b61-8f61-8ef733c7edf8@intel.com>
 <69339bbc-c78a-9e7a-ac1e-9ac08c84f79b@intel.com>
 <de1ae6f0-2ef7-46df-8bdf-16b8024e562a@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <de1ae6f0-2ef7-46df-8bdf-16b8024e562a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0230.namprd04.prod.outlook.com
 (2603:10b6:303:87::25) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BN9PR11MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eab5a22-9c40-4b45-bc9d-08dbb3279433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xTfl1YWorDJzeKBkdU5XjDbSc68rsBu8Z3zrguShO3XN0g22VE99pRGgbbaSb3JBy4LhXPg/KvnbIqG3hMU7VmFqowcN3ChSVWQSRfkIJSInSstaPmj7PlqrzhlEVWE9/2rDgnHhqojKW/MVjg03elRZVK7SozWOyBYGImFoBu1Pt+6w9faj8LTlDxR2SOjwYfx5zMI2fuHBEMOYWaMOoa44H0i6CSo4yheVsciuYmPeuSEgKKsnq/fhEQlAxlh3Gg+OJtDf4nuh9lvtGVlQp3eQ8F6Jxmo1zjcs1+n3tqG0dAsOAhgCa5QUQ5mliFGH7TtMVYfWUsjwckAsNjP5mA0Giuwo2jEi9na7bP0V5zZXtFClWTYUwxqqFx+Oikm3TsKBPVeGi5O6pNgDpwy4buTRNnWqBwWjoXu7TBrSyE+/7C2t13wupEvaKhNZPPzJLK3Csn8mgvn4IflsXJQpCqHJlq+KqpmQOw92nu7r/a8zuQ/kVA8vSejYlpLdyZmICgsJTeKmqXryJp3tMW8gbiBWIDYS6G/y/vrfmxbA6PJF3HcEQHxLjqurL5keMX2CkRysi1KwK6UowUFCmZtFpzRizJSV++F3xGhWijw97VTEers8IyeuKskTUAoQqWiKzsh8nL1lSnHCTe1GaDo1+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(396003)(346002)(376002)(451199024)(186009)(1800799009)(2906002)(66476007)(66946007)(316002)(82960400001)(66556008)(38100700002)(5660300002)(41300700001)(36756003)(8676002)(86362001)(31696002)(8936002)(4326008)(6512007)(6506007)(31686004)(53546011)(6666004)(26005)(2616005)(107886003)(6486002)(83380400001)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RS9tWEJUaG9LUFhVWHMrbEc4UTdldWJ2TC9CY2pYcCtMb0cvdk1BSjFwamQ4?=
 =?utf-8?B?NkZZakVLM29LM1B6TE1nbzhySjBRdkh1RG9STWRyL1hKbnhqSlphU0FLSXVP?=
 =?utf-8?B?aWEyWGZQSXFHSVVwSTEvOG43TmNuUnpNNUtoVzhtTTAwMlhRNjU1VXBwOU1y?=
 =?utf-8?B?UkdxdTBtY0gxODFzMkhwd1BJMGpuelBlMmtkTkVBL2IvUnc5UGNma1loTVQz?=
 =?utf-8?B?MW9YbzhRQU9Hck16OVk0Z2RFMWpsYmRsTUtjMW4yYlg2b0JBemd2SURjallJ?=
 =?utf-8?B?Y0lnQ3RrbTVHRURkOE5CTzJqVW03OFU2UFowYnNZcnFyNW4rYmxVTHBqZU0z?=
 =?utf-8?B?ZGFKRnVMc1VCdzJKbmhjN2VINXhGM2k2YVBLM283aEQveGtpTkpsaHdnalJU?=
 =?utf-8?B?aTJISUlpckV2VHUxU0NodGprbHFwUGpJMjg3cWxNOS9PRnBzRSt2allRc0ZZ?=
 =?utf-8?B?VlFnVE5jMlpHTkYxcmN5WTB2MmZQUHVSNWxQdHhkc0xYWGY0NS9nTXY5SE56?=
 =?utf-8?B?QmkrYWN3MngrOFdVSS96OVVGdVBaM2tUZno0MkZER0pSdDJSVHd0UkdNQXlV?=
 =?utf-8?B?SXMvMCtsaXMwSU1rLzRISnlCWlJDTFBrNDRCM2VqOTliSFJ4T1dIcUlWdE9J?=
 =?utf-8?B?MmQxelhuak9RL2lWc0NHUkp2a05VV2d5VGtjcjJCM2RzVStoY1RFRmNTcHE0?=
 =?utf-8?B?RVdpbyt3TmRTMzYyWDlJcFlGZEhIU1BVa2hnMFdTMnhQRUc4azNsY2k1VzM1?=
 =?utf-8?B?Si9ObXcxNmhselRTN1F3MnUxYXVLQnpPdXpOQmVYdTFmZDh1enEzajNXOUdP?=
 =?utf-8?B?U2hDWld3Q2t3MmNBSExFa1h6bFBCVEpuaHpGLzZSZ051em9tenh5RXZoTSs2?=
 =?utf-8?B?Szh3S1B3KzRJNUdNOXZzMEg0cWRPdDFGaFNXeTZOVDRXWWx6amgwQ1JlMW1Y?=
 =?utf-8?B?d0tPeCt2SjM1TVpzMkZadFVwNjhoRlFONmR2dGNjazJDZ2RNbzRITDZ0RGkz?=
 =?utf-8?B?RXlTbnF2WVV0alB2eWtoSklWS1JCYjVQamoyOUFVL0JCQlJqcjgydzVqWmtG?=
 =?utf-8?B?UmtyeHcvRlRBWGNpYlltdm56aHl1ZG9OSG8vekZJa2V5TVRMRFg4VnluMFJW?=
 =?utf-8?B?WjlqTlpOb0xueGNnczRkanczbVF4ejlTdVRmbnhzTldWdGNhTTFwcmJEaVAy?=
 =?utf-8?B?cXdzTlcrTTFZVDNyaWNKSzljNUtLRE9ZNTV5d1FJR0x2Y1dLMWlBT0FReVdS?=
 =?utf-8?B?UmlrTnEzTGdDVlV5UXhuczdCcnZ4MDhOQWtPK01QbTM4QlR3Wk1OZDZxQ1Vv?=
 =?utf-8?B?N25uNEx2TkM3enc1SUZvWXlkY1FJeUpiK1ZvOCtuR0FwTWVrVVdJYVgxajhG?=
 =?utf-8?B?N2t1aGdGWG5HTFlnZjRtQVNNaXpXQUVRd0l4dlptb0pwZ2dvUGZUenVleFdV?=
 =?utf-8?B?Q09GbU16Tm4xME00ZVNJZVRVM1dOZ3JkUk9XYWNGeEZUZG5IekwrTVU3bkZy?=
 =?utf-8?B?MGkxdzRQeXQ5bDd6Qkg2SEd6TGpIY0huaWw0b000Y0Z2S1V1OThTeVZENkFm?=
 =?utf-8?B?d3U0VmM2WitJY2cwZ0x2VldBTjI0eWFaTDdiWmo2TkZWMkU4SWxpS0NsSG1L?=
 =?utf-8?B?clN5TmFramVUZ09icEhmNCtjQldBSkxwdXluWFIvN2EyWU8xa3hsS0l2V1g2?=
 =?utf-8?B?eUdvSko2MFFNUDJEdU9ZaEtXckU5aWtiNFMvOUNzTC9NWjF4eXNobk5Sb05n?=
 =?utf-8?B?YW5wSXJ2YUxRTXBKY3hjQjlyUVBvUHorVVU5VnErNEhTSEJWRFpUNTQycXdD?=
 =?utf-8?B?TnJjdFZvNVVmbHJiOGdGQzJQRDROVHBNeTZlbldLQWZEV0pTYnhSV2FxeUZE?=
 =?utf-8?B?blEyUll2TTlqWmxYelhUZFV3eVdBM0hSVFdUeTdqWjVZeGVRazJvMjBiMW5Y?=
 =?utf-8?B?d1p5RVNOdi8raW9kdGhJVlljcVpuSnpWUWlKNjZTZVVOajFrVlkwQ3VDaDBI?=
 =?utf-8?B?NTV1dWlSUCttamFmVnJEUGV4SmhUMW5EUFdxVEN4OTBuU1NVUkxlV2JhN21a?=
 =?utf-8?B?MmxVUjc2UjEwREdvT0J3UE05ekgxMlNiRUNqLzU1UVRLb0xHQ0xHcThhT1di?=
 =?utf-8?B?Wmg2bnN0WnF2bk1LRmxURytnMzJXa1RhTXB6T3M3TWxyaHhYOGtlUUVXYVBW?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eab5a22-9c40-4b45-bc9d-08dbb3279433
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 00:31:17.5691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAGlO1y0vKHCzXrHpoAVegOxfslmiYcwbIAKZiq8WYPM5JKfoVzemqEU2nnjpbkVHvWgQPkHApXjK4V+74ZJiVd8/Q8lGrFZGCkp3zcK6gA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5241
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

On 9/11/2023 17:22, Daniele Ceraolo Spurio wrote:
> On 9/11/2023 5:16 PM, John Harrison wrote:
>> On 9/11/2023 17:10, Daniele Ceraolo Spurio wrote:
>>> On 9/11/2023 5:00 PM, John Harrison wrote:
>>>> On 8/2/2023 14:26, Daniele Ceraolo Spurio wrote:
>>>>> When testing a new binary and/or debugging binary-related issues, 
>>>>> it is
>>>>> useful to have the option to change which binary is loaded without
>>>>> having to update and re-compile the kernel. To support this 
>>>>> option, this
>>>>> patch adds 2 new modparams to override the FW path for GuC and 
>>>>> HuC. The
>>>>> HuC modparam can also be set to an empty string to disable HuC 
>>>>> loading.
>>>> Why the difference between GuC & HuC? And is 'disabled' 
>>>> significantly different to just setting it to a non-existent file?
>>>
>>> There is the global switch (the one you commented on in the previous 
>>> patch) that can be used to turn off all the FWs. I see no reason for 
>>> wanting an additional switch to turn off just the GuC, as the other 
>>> FWs won't work without it.
>>>
>>> Also, Xe aborts the driver load if any FW file is not found, so yes 
>>> disabled is different than not found.
>> Hmm. Given the firmware paths are 'unsafe' module parameters, I would 
>> argue that it is better to keep the code simple and if the user wants 
>> to shoot themselves in the foot then that is their problem. That is, 
>> just treat all firmware file overrides exactly the same. And if the 
>> driver fails to load because the user has requested an unsupported 
>> configuration then who cares.
>
> I think allowing the override for GuC would actually make things more 
> complicated. The code assumes that the GuC is enabled if the flag is 
> set and that all the GuC features can be used, so having the GuC being 
> disabled under the hood via this override might actually make the 
> driver panic, which would be bad even if the parameter is unsafe. Not 
> allowing disabling the GuC is an extra half-line of code, which IMO is 
> overall simpler and cleaner compared to either risking panics or 
> having to secure all the paths against a missing GuC.
>
Hmm. Xe seems woefully fault intolerant and fragile.

> Daniele
>
>>
>> John.
>>
>>>
>>>>
>>>>>
>>>>> Note that those modparams only take effect on platforms where we 
>>>>> already
>>>>> have a default FW, so we're sure there is support for FW loading 
>>>>> and the
>>>>> kernel isn't going to explode in an undefined path.
>>>>>
>>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>>> <daniele.ceraolospurio@intel.com>
>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_module.c | 10 ++++++++++
>>>>>   drivers/gpu/drm/xe/xe_module.h |  2 ++
>>>>>   drivers/gpu/drm/xe/xe_uc_fw.c  | 30 +++++++++++++++++++++++++++++-
>>>>>   3 files changed, 41 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_module.c 
>>>>> b/drivers/gpu/drm/xe/xe_module.c
>>>>> index de85494e2280..0660017c3e83 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>>>> @@ -30,6 +30,16 @@ int xe_guc_log_level = 5;
>>>>>   module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
>>>>>   MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level 
>>>>> (0=disable, 1..5=enable with verbosity min..max)");
>>>>>   +char *xe_guc_firmware_path = NULL;
>>>>> +module_param_named_unsafe(guc_firmware_path, 
>>>>> xe_guc_firmware_path, charp, 0400);
>>>>> +MODULE_PARM_DESC(guc_firmware_path,
>>>>> +         "GuC firmware path to use instead of the default one");
>>>>> +
>>>>> +char *xe_huc_firmware_path = NULL;
>>>>> +module_param_named_unsafe(huc_firmware_path, 
>>>>> xe_huc_firmware_path, charp, 0400);
>>>>> +MODULE_PARM_DESC(huc_firmware_path,
>>>>> +         "HuC firmware path to use instead of the default one - 
>>>>> empty string disables");
>>>>> +
>>>>>   char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
>>>>>   module_param_named_unsafe(force_probe, xe_param_force_probe, 
>>>>> charp, 0400);
>>>>>   MODULE_PARM_DESC(force_probe,
>>>>> diff --git a/drivers/gpu/drm/xe/xe_module.h 
>>>>> b/drivers/gpu/drm/xe/xe_module.h
>>>>> index 2c1f9199f909..e1da1e9ca5cb 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_module.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_module.h
>>>>> @@ -10,4 +10,6 @@ extern bool force_execlist;
>>>>>   extern bool enable_display;
>>>>>   extern u32 xe_force_vram_bar_size;
>>>>>   extern int xe_guc_log_level;
>>>>> +extern char *xe_guc_firmware_path;
>>>>> +extern char *xe_huc_firmware_path;
>>>>>   extern char *xe_param_force_probe;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>> index fd53ef9e5c99..ef873e894714 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>> @@ -15,6 +15,7 @@
>>>>>   #include "xe_gt.h"
>>>>>   #include "xe_map.h"
>>>>>   #include "xe_mmio.h"
>>>>> +#include "xe_module.h"
>>>>>   #include "xe_uc_fw.h"
>>>>>     /*
>>>>> @@ -209,6 +210,30 @@ uc_fw_auto_select(struct xe_device *xe, 
>>>>> struct xe_uc_fw *uc_fw)
>>>>>       }
>>>>>   }
>>>>>   +static void
>>>>> +uc_fw_override(struct xe_uc_fw *uc_fw)
>>>>> +{
>>>>> +    char *path_override = NULL;
>>>>> +
>>>>> +    /* empty string disables, but it's not allowed for GuC */
>>>>> +    switch (uc_fw->type) {
>>>>> +    case XE_UC_FW_TYPE_GUC:
>>>>> +        if (xe_guc_firmware_path && *xe_guc_firmware_path)
>>>>> +            path_override = xe_guc_firmware_path;
>>>>> +        break;
>>>>> +    case XE_UC_FW_TYPE_HUC:
>>>>> +        path_override = xe_huc_firmware_path;
>>>>> +        break;
>>>>> +    default:
>>>>> +        break;
>>>>> +    }
>>>>> +
>>>>> +    if (path_override) {
>>>>> +        uc_fw->path = path_override;
>>>>> +        uc_fw->user_overridden = true;
>>>>> +    }
>>>>> +}
>>>>> +
>>>>>   /**
>>>>>    * xe_uc_fw_copy_rsa - copy fw RSA to buffer
>>>>>    *
>>>>> @@ -346,7 +371,10 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>>>       if (!xe_uc_fw_is_supported(uc_fw))
>>>>>           return 0;
>>>>>   -    if (!xe_device_guc_submission_enabled(xe)) {
>>>>> +    uc_fw_override(uc_fw);
>>>>> +
>>>>> +    /* user can provide an empty string via the override to 
>>>>> disable */
>>>> But only for HuC?
>>>
>>> And for GSC once I get around to add support for that. I wanted to 
>>> keep the sentence general here, since there is no visibility of 
>>> which FW it is and there is already a proper description of the 
>>> override in the modparam definition, but I can add a "non-GuC FWs" 
>>> at the end if you think it makes things clearer.
Maybe just go with 'an empty path means the firmware is disabled'. Given 
that the actual anti-GuC check is not here but up above, it doesn't 
really make sense to include that restriction in the comment here. And 
it doesn't actually matter whether the empty string came from a user or 
from a compile time edit or somewhere else entirely.

My question was really more about the test below being for 
'guc_submission_enabled' which logically has no connection to HuC or GSC.

With a simplified comment:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


>>>
>>> Daniele
>>>
>>>>
>>>> John.
>>>>
>>>>> +    if (!xe_device_guc_submission_enabled(xe) || !(*uc_fw->path)) {
>>>>>           xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>>>>>           drm_dbg(&xe->drm, "%s disabled", 
>>>>> xe_uc_fw_type_repr(uc_fw->type));
>>>>>           return 0;
>>>>
>>>
>>
>

