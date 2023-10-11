Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2121CD98F5
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 07:00:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388B210E472;
	Wed, 11 Oct 2023 07:00:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8A110E472
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 07:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697007609; x=1728543609;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9NFM2M+J3BVi7Y2948JxrYPMWcrnqn20NtWE2KvvGwE=;
 b=YVdijKhoMqF657KNPcoBl7jSXTb8NnCJRdudSm4lFsPVre1BD04iTD/I
 QzTjO2DK/xD4Fe4//IA8XInJfvG/Vg2Ndh7LVv5VYaicIXX4n3zB25jXH
 McbBUZEnMactRQFpFlrs5r5PIbqeNZ6yvokxT0CZecq7vCewn3MXhyo4g
 wzpEh43PlPO9iZcszK2cgN0crM3oWMp3DOXw4FJ/zUlrm0Cdwohmx1sQn
 UhK2IL2pkwZciZFOPHenT8RHYj9ck1IhU2n1xNYHoL+pePFYDj85RiVqy
 dN8xDFgq1uim7thMW91FY4Q1ddE+PTgYSkD68QPynTAZSKrgGioTViFDr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387437977"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="387437977"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 23:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="877556263"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="877556263"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2023 23:59:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 23:59:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 23:59:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 23:59:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 23:59:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cj00+mc9pMqnxBdOYLoe8ECVmbENyzOxrjhf1Eg0m5KZ3sXMFKKhrrfjNe3V6MmFQV/XxUabxfNqMH8vI0UiGmW4/c0SfdufrBUDRNur4GAl5PQX4MqmYzY0PlV40MC7TDUbx4kHN6Wsjf282D7eJBhxmXmwsfbV+qKdc7tvlb7JnqelEIDZB50JA3yC7O6k7NabJMtzmSm+uQtN51v4Jw8U+g+I9qWSAleyBvLp1VfGV4M7B07L25DtAPM1jo8Jj8iklaKKByOiIKoYLCysCxI5ziSytRAcEIFBQLxMa5Bse34qTTJZY/0gnKKWldXIL7kSSmHhMMw7C7kkXFi+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXF7A1kPpajiBP5E8gu3B0uWwI/RBBrGMBlXtKt2OsY=;
 b=bFY8jBhJa2+vy9n7siZ8L6ju/PTLubs7BrB3RklCpsb0oVVnufYaEscLRdKYOF74whR1M19NGwD8cXgvfcc+o5lSQBvr3c5O/ZMOgrSv9EPtcHklICgwJI8uV8iS+DRe3wp3y8fdHRiHy48u8c54Pe5Q1hjf1SvrMTnuVTPsGd2vzaYWu82uVvQJr3VfnIF3o6tw9J27eaVbBkRJMgolN3+eWYP012bOfqSW1CA8PPZteuuO55SKtq+h7S1Q5g3HtJbP1nLtEZ3pjxzc7+4MySlZQ3On9BnU0K3n9JeyXWURvollZo+0RRsaof0FGRinlIuKDxiyY3nvDbk+vn33bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM8PR11MB5688.namprd11.prod.outlook.com (2603:10b6:8:23::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43; Wed, 11 Oct
 2023 06:59:50 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514%6]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 06:59:49 +0000
Message-ID: <dd3e373e-fa9e-4832-b861-fe6aceb55814@intel.com>
Date: Wed, 11 Oct 2023 12:29:39 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
 <20230927114627.136925-12-himal.prasad.ghimiray@intel.com>
 <afffc88e-6c18-75b7-a968-67574573fe9b@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <afffc88e-6c18-75b7-a968-67574573fe9b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::18) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM8PR11MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: fd7105f6-33e8-48d9-d465-08dbca27a94d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m4wsteiHzyY0kLuobGSOLb0Z99QSg1/tPSBCeiX3JPVrTxfUlGcDv3sVbw1K0oNETGhCqn7dzUvGdP1G7K1ZVDsE3i8pqDVle3hjEHsqHXNLpuNAwdD3Z1usbUvT7k7HCt4TzgSLPVVTUGIooeYewu7C6Jyhgm3Vxz8MFjyzs2iZGm+vUMzIpM3uJ0Z+nGb+g/dY4YCAVXQQxksvL+X2xQ9Qe4YIeehJRHCGrGhFBFu+8ZPKuDdBPfW2dMorPfyDDu0bMp+KRwA3W/GXLf+rzL/wuyq6nvcmvLViS2DvSGn4pKfHZqP19M7xfaMiT5H8tuGZqq9boUEwNxywXYsL5KZdb7xZQx8DX1O2Q+GbX1hq3EdjCwQGT5XTwoBU/xSnyayY8NclOrNfBCgDSN185xEeq7A6I2L/g97UtCvPj8FW4Nnup7a7D6lUsnsL15M+XqKFfh6n1W5n9ncO12nmUFcRiT0xkdRNB6o6n7bFTdJF/TwBCG/0BJpAks0kchhzZQAdVbNOO8H4+0zX4lbLXfkRGX3mNe1qbqbWevM+8z5K927M6vyvTbLmgnzMMy2R69kTxTnqjoUca467i8ePwEHlHwte+hF646jmNJ0a0uJaR2HcdsAU2XA+Sig74AQG65SiuNjctus4TaeYRtwzww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(2616005)(478600001)(6486002)(53546011)(31696002)(6506007)(86362001)(6666004)(41300700001)(36756003)(8936002)(8676002)(31686004)(316002)(66946007)(66476007)(66556008)(2906002)(6512007)(38100700002)(5660300002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2JJbXJqR25Cbmw0aHAxRWZyT1h1R1drQ2tvT0dyaGYvRGJTVENhOWU5Zkxh?=
 =?utf-8?B?K2FMc094RVJ0UkZ0OGlidTI5dUVRaGVRdlFEUHpTS3ZhUnR5UmRiR1N4eDhY?=
 =?utf-8?B?WXNjVytidzhrL28rQzV6bGx1dXZhRm12TTBYeDZlZnhSL3J4V2loT1RSRkpD?=
 =?utf-8?B?cXFuc2U3UHZnRzZJZUJoUWQrZ1o5VFRXQjFrSXhTR1NYRUpHWExhTVF4WWY5?=
 =?utf-8?B?Z1grT3hNUU9kS3NGaFhPZFl1TDlWZEs5R1VaMzNRTmZILyszSExjdEdjUmVp?=
 =?utf-8?B?UjU2RUdsR3huTThodThnSWx2UU9FYnVXU0hhR3M1emNvUUk4SkVwcHZWR1pp?=
 =?utf-8?B?QkVRSkJqZ2NGUUxZQnZzd3l3Z2JmcVJBUTBCZ2o5aHdlMm5waU9mUmgyUjRV?=
 =?utf-8?B?ZDhxWDJEUXNaT04wT25aYW5Femo2ZXFLcjNBOFphbGZnbWJwMHM0WHhsdURk?=
 =?utf-8?B?LzlabXdqOW5LNTEwVDNwOW00OFAxZFEwZ0ZnRHVSL01XWldxLzRJU0dtZWVS?=
 =?utf-8?B?Qm5kMU5tN3hQSC9ieWxXRHhycng4ZDFzK0h6ZUZOMVZ2dTBEWmwwREtDNnZw?=
 =?utf-8?B?ODIzTk9pRWJTK245U01nbkhqZlIwbkJkalRVdXVuNzZ3OTJ6bk5VZk1tajRE?=
 =?utf-8?B?Q21icTllVUVHQjdBeXpiZGlmTnFUUEdqZW11TURGV2JYU3FrZmdhTjkwdDhL?=
 =?utf-8?B?LzZUcW5UR0tDREFZM2R4QUV6ajVQUW1sc0ZodjhPeE14cHZCWnhMYXRqOFNK?=
 =?utf-8?B?SDZOU0F4R1lqakNUZVA2SlptdjNTYkVTZDhXVFZSZWxnSWJBTTJCYWZYVVUw?=
 =?utf-8?B?RExVNHIzQVJncDJIWDlYeGF0RE9HeXFIb0VJbUhBUWJ4Tlg2WVBkMjk4ZEh2?=
 =?utf-8?B?a3Myc2U4VENmWUNyZjIzYUkvM09JSXVSeDIwTjgvWktOQXJyUU9hbXZZaVUz?=
 =?utf-8?B?VVovVlhjQkYvSkZGbDRJdGpBU2tuTjRYMXF1bWZhU3lGNVl2NEswRkt1YWVl?=
 =?utf-8?B?WTM2WWVyODBIWWMyRFJCdWxwa1A3U2RkRngrcG53QW1PSzNReEtlMzA2bG5H?=
 =?utf-8?B?cmVyYU04NDM1RCtnUS9EOFA5Q0pZbXE4b1c2M0FCUnpzSXZkbmRMY0lnblhI?=
 =?utf-8?B?RUZVMkVhUGpXYnRZU01ibzZEOG5xODdpUGFkVHVDbG5tK3pHY3ZreVRielQ1?=
 =?utf-8?B?dWJtL2pKZmJ2cXRNMU1xMXBuajIwVWdpV0pSQjNZZ055OGVyWG9tQmgweGpK?=
 =?utf-8?B?cHZSS1VDUHpPaEgwOXVkQ1IraUt6c2ZJRzlGemVTMmFia0JKdFB6NW9xeE9n?=
 =?utf-8?B?VWhKclhCNERrNTBTNHRNZGdwQXFBRjZQZ2xTSDdrMlpSYVVaTWI2a2t3bExn?=
 =?utf-8?B?OEdyc1lIVUN2NEVaTkVoUHNlVnZqdCtOb2phL1l6NEM0VWF1U2pwWVV4WFEr?=
 =?utf-8?B?TnUzR2RHdDlMWWpXTmg0VzVEZy96V2xqc090L1lsSzF4bDJUZkF3YXJBNUZ0?=
 =?utf-8?B?TUlxWEJBa3BTc09yUTkyUlNJM2Q3S2JXWEh0aWl6WXFwdVI5NDVES2tJSVRz?=
 =?utf-8?B?Z0VIQlRtR2JGb0pSUFhoZnVkWDBGM3dpRDcrd3BVamoxdFVNcCtWM1JEeWFM?=
 =?utf-8?B?ajBWYkVTa2FLbHFvTjJKWkluUHNRZ2VDeWVJdUllQ1d1RUdVOVBMeXhJVUll?=
 =?utf-8?B?RHlOY3l0QTE0ci9Ja3RsWmtNRElhcHBWZllrWGo5WGhjV0hlZURNSU9ta0JZ?=
 =?utf-8?B?TzJ6bFhYVmRDeWtSQ0JKRE9hUFFnckhDNnNPdUxwcVdoWXJ5cUlkdTM3c0lE?=
 =?utf-8?B?ZmJPNjhySVJNclRwVUk2emxxV0ZBQ1kySFFWWWoxQ3BTaEVEQ0xUSENJQ0pw?=
 =?utf-8?B?bXEzVUJLY2xKZTBiUGwrYzVETGZBcWlRNGszNmt5cWEraWlXbTdGRHdnMW1G?=
 =?utf-8?B?cUJRQWUxVy9ORVBxa2dKUDUrbjNHcmJvN2NuMDlBL3FONFZSYkROT3JaSklS?=
 =?utf-8?B?d1ZZV2JicnlVdGVaOTd5T1I1TDdUNDQ5aTZ6UkRsM0NyZENUWHdPV2dxZlpG?=
 =?utf-8?B?eDJyM0w2Z09OWmNNbVZwN0VaVWRkaG5ISWtYOXdqT0d5Y0k5VStmc0x3ZjBk?=
 =?utf-8?B?VlJsc09ERkxKVTNMa0NXVVZudjgzdFBIMmFMS3BYa2x1S0g0TkcvcldHRFFX?=
 =?utf-8?Q?oa6nHvnVzeZINXUVCmflG6A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7105f6-33e8-48d9-d465-08dbca27a94d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 06:59:49.9192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMctdrFTztWC6MK3yrGYA/axLRNRSUDEI6tUhkaQFrg3gUxbur6w2VOusYcD9Mr82pnNd+cLxLpKSHs0qNln+MIrMHPIv+TUTEAlsRoAXjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5688
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/11] drm/xe: Clear all SoC errors post warm
 reset.
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


On 11-10-2023 12:26, Aravind Iddamsetty wrote:
> On 27/09/23 17:16, Himal Prasad Ghimiray wrote:
>> There are scenarios where there are no fatal errors reported
>> but Non-fatal/correctable errors being reported from the SoC
>> uncore to IEH and not propogated to SG unit. Clear all previous
>> SoC errors post warm reset.
> the commit msg is not very clear, how fatal error reporting is related to other errors.
Will rephrase it as

There are scenarios where there are errors being reported from the SoC
uncore to IEH and not propagated to SG unit. Since these errors are not propagated to SG unit,
driver wont be able to clean them as part of xe_process_hw_error. Hence clear all SoC register post
xe_process_hw_error.

Is it ok ?

>
> Thanks,
> Aravind.
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hw_error.c | 37 ++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hw_error.h |  1 +
>>   drivers/gpu/drm/xe/xe_irq.c      |  1 +
>>   3 files changed, 39 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 0bcb1bea7ffb..a777c887a7be 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -366,6 +366,43 @@ static void xe_assign_hw_err_regs(struct xe_device *xe)
>>   	}
>>   }
>>   
>> +void xe_clear_all_soc_errors(struct xe_device *xe)
>> +{
>> +	enum hardware_error hw_err;
>> +	u32 base, slave_base;
>> +	struct xe_tile *tile;
>> +	struct xe_gt *gt;
>> +	unsigned int i;
>> +
>> +	base = SOC_PVC_BASE;
>> +	slave_base = SOC_PVC_SLAVE_BASE;
>> +
>> +	hw_err = HARDWARE_ERROR_CORRECTABLE;
>> +
>> +	for_each_tile(tile, xe, i) {
>> +		gt = tile->primary_gt;
>> +
>> +		while (hw_err < HARDWARE_ERROR_MAX) {
>> +			for (i = 0; i < PVC_NUM_IEH; i++)
>> +				xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
>> +						~REG_BIT(hw_err));
>> +
>> +			xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
>> +					REG_GENMASK(31, 0));
>> +			xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err),
>> +					REG_GENMASK(31, 0));
>> +			xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>> +					REG_GENMASK(31, 0));
>> +			xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>> +					REG_GENMASK(31, 0));
>> +			hw_err++;
>> +		}
>> +		for (i = 0; i < PVC_NUM_IEH; i++)
>> +			xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
>> +					(HARDWARE_ERROR_MAX << 1) + 1);
>> +	}
>> +}
>> +
>>   static void
>>   xe_gt_hw_error_status_reg_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
>> index a458a90b34a2..7ada7c97c939 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>> @@ -219,4 +219,5 @@ struct xe_tile;
>>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>>   void xe_process_hw_errors(struct xe_device *xe);
>>   void xe_gsc_hw_error_work(struct work_struct *work);
>> +void xe_clear_all_soc_errors(struct xe_device *xe);
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index 285c657cc789..42a6bb45acba 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -597,6 +597,7 @@ int xe_irq_install(struct xe_device *xe)
>>   	}
>>   
>>   	xe_process_hw_errors(xe);
>> +	xe_clear_all_soc_errors(xe);
>>   
>>   	xe->irq.enabled = true;
>>   
