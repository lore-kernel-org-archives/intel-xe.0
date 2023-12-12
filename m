Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ADDC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 09:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FE110E598;
	Tue, 12 Dec 2023 09:01:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C30810E598
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702371667; x=1733907667;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=VVUJdYthrCE7gMsAliWDrl8ch/6GtgjI3mPA0KGSAJQ=;
 b=nx0zO5QMqhEv45HV244Dmz0V1zSluXJ911cpA/13dLJlyGKuNsOnXpQB
 S4j9UHgz/jfH1wS/r93COBwTZb0aODwJsrCwxF9sb2eYCy5EOqAOnBJFL
 8DOk5vCAyfFfwnkYMTNf936Kc6o+L+AWUIA19OVJzUkIRxw1SImL8qNUG
 KOTJ6RUN9KrIMGc+Ah9dC9GG4EOvIyciHRx/+mxUg95wjWmx2NNQQSFUZ
 GewppCICbiyaDcDU0MLqi+OGgmZgbG9Oe8HoyQN/Ni9OP/Gg6Zh+pjGgb
 bcCUDa7LDZigEpDbga69ck+qQgiXexSC7SgZrFmlkSKzoJUtGEra/HMQN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="13467638"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208,217";a="13467638"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 01:01:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1020625241"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
 d="scan'208,217";a="1020625241"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 01:01:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 01:01:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 01:01:05 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 01:01:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amSm0WYPzfEBbze7BXZADbzikh4zi2SGomo85o7iK1pCFYwIW2i7zZCWS47aGG3CXdL4LKdASCNI0fQl/ZWjQwsKykmN032VjegxXr10RjnVWwt7uuyIIN8p+aHZWeKaT/wruzP31l5gUbacV755tnSFZJ+gsPV2uCPfqpYYHNo8Tbtns4AJC/A/TbNpyZxNoHRgsjtPiHucYqmXgziDg1sZ0nx3+5M4LNrur2TMnSH9AdDTsyeBpdsi5uii/vH2K6Dbi3XeDcv3VgG5PpDWPOsaGJufoR+Bh8WVAdHsBht+qRzDUtcTwEJowf8dkhkTD4jv4cdrpRUM5sFYs4KJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhFxw7k56kBb9KAwh2lDEENEFJh75nKcvKJXg9gUdnk=;
 b=kD3FJ89eZir7cQmtCwjHO92AAAdPRk0p8HKqYT9dCVvdeKfwWaeTHnk2HDZ1IPXy03UqfQKO8rhJFPQLsMtCMuBgSp7LyAAgxuJsUH6CKiV16CdUFLDmKKkFbRk49jwZFJW66lFnKZOW8xQPijQMoRlF6382ypDqjcpog+E1BlYWTDeywEeyag5f2zpWGEcyYy8jWwZRqgT8Bx99U09AjccVjy2mJI3v8NWxdPqYnU416Kz5xdxVOE4LLaT7Nuf/qrw9f4TdFp0NAd6f8LazMpYBuUNfJRJJQ2JMorlG9ePmiBOpDYxYJqrMXgjiaJqO8w3V0K17b686uxiYdnI5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB6285.namprd11.prod.outlook.com (2603:10b6:8:a8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Tue, 12 Dec
 2023 09:00:54 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 09:00:54 +0000
Content-Type: multipart/alternative;
 boundary="------------Fxtwqm1IdoocP4UC9TXjnNub"
Message-ID: <24aeca0d-f7c4-486f-8187-205cd3cc823e@intel.com>
Date: Tue, 12 Dec 2023 14:30:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] drm/xe/xe2: Allocate extra pages for ccs during
 bo create
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231211134356.1645973-1-himal.prasad.ghimiray@intel.com>
 <20231211134356.1645973-4-himal.prasad.ghimiray@intel.com>
 <20231212004132.GD1327160@mdroper-desk1.amr.corp.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231212004132.GD1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: PN2PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0de27b-e103-45f6-49da-08dbfaf0d8fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1CzyLe5tAo2JNflJmAjQRXUb97cdwfF0ZcHr7KJDOAffR8fKMAX7kg0QZj307nvqZ8mvJ0RHNBkb04ljmRHA3xCwxFertDxYAoLLfI7a3oLSXB4HyRyYRKytYH7xE1841iOzL7zrvzh1oU5XnKzK/Lh07vMZl65XjQuAitdlPldNsUBQr324mWGfwpj7/pILeM1Lkg4YfLzSS+/SYzQCEBM7vc8KFyz1VkwJIC+CF3aKqAnR3idKP/n48US0t+H6+CKx/iyx4Jq07przOpG5E1erujVHbAjWxl17ASj0xPgevR2NDrmYoOWC3iPpRqPhfDnZ3vWEWlqhhrujuDHJi7o71B+mJa5lvUsjK/H7WGpUThKwt7OHx7qk+i7FrvArdqNHHaB5kPF+ZVWskt9E4rzNP+d3OKoCbrVPcmmHmbZp9HDhwbx9/yX0aTLAk4MxppzdLgY6aqS8c85PRdRcHgiSYVLJ+gTFAUiJppGphqqU3fAiA6lC8B+sRUtQwPIcd8FUrBUt/3EVSO8Qf8GBIyO3KMruHvHaRcD4MZd6fX+B/8Wdp0xsZdfnsu17UUbHgidt5km6GQr9+W3mW2hM0YacWSrXxGC4wLa9diVb+gST0FQb9ZgHWDM5WCyi51QMv0h0Pf7/6dVUaxCWLE0/kA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(346002)(136003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(41300700001)(86362001)(31696002)(2906002)(83380400001)(6506007)(53546011)(82960400001)(6512007)(6486002)(478600001)(36756003)(33964004)(6666004)(5660300002)(2616005)(26005)(66574015)(38100700002)(8676002)(316002)(37006003)(66476007)(66556008)(8936002)(6862004)(31686004)(4326008)(66946007)(6636002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1gwSFpNR2VZVmkxOW11bFZhMWtKQUNlcjh6NEd0ZkVnWFRHMWJvR1ljR21k?=
 =?utf-8?B?MlFwR3F1SmNjMXI2QUtseGYyNTZJN1FQdENTZTlPUmVCSUlCaW56K3UxY291?=
 =?utf-8?B?alQvOTYyWWtmcjJhZGJ3RytQYlZYZzZ5WW1SdWRxVllwZnJSVithVmhvTmN2?=
 =?utf-8?B?RkRHY2NERWxlK3pnaE1qODNlcVgwWE03SGJ2ZE1iTUdGeXRHZW95REpIV2Rk?=
 =?utf-8?B?VE9QUjU4bHk2TlpGSlpPMEhUbzR4cCtoSjFndCsybUptS2dReGM5Tk1lK24r?=
 =?utf-8?B?REJiVTV3UVhtcm83NlRaaFBDUENUbjVVYkl0SDN6a0F5WlVWQzc5dHBuR2JG?=
 =?utf-8?B?aGpPbXlQQXhLVUZWSjQ3RHllaFgzM1ZSS1kvT1MvTGhJcDByUjVIbkpucUpz?=
 =?utf-8?B?RkdlR2hvemZaUCtZODNNUFZSVjNWZkN5ZU5xK21zZ0JPNnNWeFRqWFMwSEFP?=
 =?utf-8?B?bTJ5a0FvU0dTQ0JDVzRSaHBwdXQ0NnVsRzA0bDB5aEo0dFArS1FOTW9mOVha?=
 =?utf-8?B?SEdjM1Eya3JHSkpydlBYNVNLckNuVWljYTB5enJwNUFTRzN5a0NyTjdvdFQ4?=
 =?utf-8?B?U0dFSk85QTJ3cHFzUFNqVW4zM3RHbUZUMGg3akNKckNyRXlJNWxLekNiLzBk?=
 =?utf-8?B?bVpkcnQ0cXYyM2FFWDZNVldHeEwrbisreS9LakF5MGV4RW5iZE85QytiblB3?=
 =?utf-8?B?cncrTGF6ejd1ZVlveFU2SFJiVFZSUFplMEJLZkQyWlJMRmlrandhV0E0clZv?=
 =?utf-8?B?VUlhV3g3QTh2RXNPdHdUMVJ2bFNmdERPbkZRVjVUQkZKV3ZhTm5YQ05ZdkhU?=
 =?utf-8?B?eVBRVWVUcm03ZGdZV210ME5reiswUG9Cd2Uwd1dWLy8rSHNhNnNtZlZVSFh4?=
 =?utf-8?B?KzFqS1VRUlN0ZVNrVGVxZnJmQU1FSllXNjNYanc5ekdFSDg2Nkc5ZUErRlQ0?=
 =?utf-8?B?dStCczdYeWFqdDZYUDliU21adGxRaGo5am1CZC9IaHY3M2ZrTXdvUklBazc1?=
 =?utf-8?B?YURhMmdEaUx2bndnYWFDRW1KWVNlZFV2aU5ucTQzQ0lncXpyb1RJc0s5dVVq?=
 =?utf-8?B?Mm1seW41d1gwcEg0RytSYVdYVGtEdFdJZTJJS1BSTm5jNHAwbGVZL0xsTXFi?=
 =?utf-8?B?NXBBYXBveUJ4Z3N1RGRjTlI0YXVHWTJiNVN2TjBIVk5XOCswNEkzalBlaGla?=
 =?utf-8?B?Z011ekRESm5Vck5udEliZm9IeXJLdW5DWnFhZ3p2TjAxKzZMWklyMnlCMzI3?=
 =?utf-8?B?d2VnazgyVEg4dW9RdlpFU2oreHRIMGEyK21ZZW1TaTZ6dEZRaEVpVC9yaThF?=
 =?utf-8?B?MGJRKzZwRGxWQll6akJiaTVmVHFobU1oYThYSEV1ZW5BU3N2anFPQm1LUDhl?=
 =?utf-8?B?aXVsWVpKVlp0M0JSQllmQ1ZQMVJSZWZEUzg5aTF2TGRZWUltZFQ2MzlIb3FN?=
 =?utf-8?B?eDczQThORVJJSXQrdDh0SlJUVG5hdlphQzN1V3N3STlhT0VaMkEySEVLbmJK?=
 =?utf-8?B?ZjVncm5aa1ptVWdkTEVkYmFjakIvcmQ4VkU5aXdGelpEd1kzYjJaWW9tWXBQ?=
 =?utf-8?B?SzR2SDRjbkY2SnNqTnJWV2R1OEZrLzlSWkRBZmhOc3F2U01rRno3NUQwcVpD?=
 =?utf-8?B?dHRFa25vZXRIUXBBaVJJUWV2QjhWTW16OGgva0pxcVREYlg4eVlrQ1FJSzRW?=
 =?utf-8?B?MU96QXVRUGI2RVM1T3o2Wm53ZzU3R0JzQnU1UDZIam5Zb2lZVWNHRVhmMlhW?=
 =?utf-8?B?dVNBbVlmaDJDNGlYRzM1c0hyblY4WUt6Y3hyNXlNblllbzRzK3VBT1VMRFRz?=
 =?utf-8?B?UVpyeUtuVzBhVU5tOEZVMC9mUGJZU05XNlZYQkdaVmpNN2IwNHBtMENaSGlV?=
 =?utf-8?B?aTdCZVYrOVBFNUxVZktlYWtuejhIQnNTMzhxdm9uTU1McTNYcGFVa2crUWxy?=
 =?utf-8?B?YlRNL3hPV1ljVldMcnpHbHZMeTV6d0txYXZtTGdubXZ2WWRQYmlXTVB1cTZw?=
 =?utf-8?B?bEh3bmEyTFhpZ2RaTkp5alJVMVBGWkFmeXdYOHcySjZGaUU4TUR2WEJtaGFD?=
 =?utf-8?B?SGk2QktMb09WODhsVFl5cFpHYmFUd3dpaWd2S0dWcmJlaGlHdmliNmM5N09Q?=
 =?utf-8?B?bnZUSUdDaUNuWG5mOGpnSjF0VUZKNXB5aTNKdEl4MGtIN3pXcGFMbmVWVys1?=
 =?utf-8?Q?E07CYOCCglgv8LtSzgYaV3s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0de27b-e103-45f6-49da-08dbfaf0d8fd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 09:00:54.5674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qp53HLKefLbGOV2w1OFyeER8nXhjQ4NwvvxmKe/ay6HmslCrNmLfM/V7ksMEukfECfTojdK7b4XGk0l176teVbvc+GxyU/EYTCBk/adX9rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6285
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

--------------Fxtwqm1IdoocP4UC9TXjnNub
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 12-12-2023 06:11, Matt Roper wrote:
> On Mon, Dec 11, 2023 at 07:13:49PM +0530, Himal Prasad Ghimiray wrote:
>> Allocate extra pages to handle ccs region for igfx too.
> I still think we need more explanation on this patch since this commit
> message makes it sound like we're allocating the CCS region itself,
> which isn't the case.  The CCS region is already pre-allocated at a
> fixed location reserved by the BIOS.  My understanding is that every
> location in physical system memory has a corresponding location in the
> reserved region to hold its CCS data, regardless of whether that memory
> is being used for "graphics" purposes or not, right?  So if a buffer was
> staying in RAM forever, you'd never need any extra storage.  However if
> the buffer can get swapped out to disk, that's when you need extra space
> to hold an extra copy of the CCS data for swapout.
>
> I'm still not super familiar with TTM details, but I _think_ that means
> that a buffer in PL_SYSTEM (which isn't mapped into any GTT or being
> touched by hardware) potentially needs the extra storage space because
> the OS might wind up swapping it out to disk, whereas a buffer in PL_TT
> wouldn't actually need any extra CCS storage since it can't be swapped
> out [yet].  And I'm guessing it's simpler / more efficient to just
> allocate the extra storage once up front rather than trying to just
> allocate it when a buffer moves from PL_TT -> PL_SYSTEM?

The explanation provided by you is exactly how ccs metadata handling 
works in case of

igfx. Will update the commit message with  explanation.

>> Bspec:58796
>>
>> v2:
>>   - For dgfx ensure system bit is not set.
>>   - Modify comments.(Thomas)
>>
>> v3:
>>   - Seperate out patch to modify main memory to ccs memory ratio.(Matt)
>>
>> Cc: Matt Roper<matthew.d.roper@intel.com>
>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 14 +++++++++-----
>>   1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 7e25c8b7a01a..0df8f6a77040 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -2183,8 +2183,8 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
>>    * placed in system memory.
>>    * @bo: The xe_bo
>>    *
>> - * If a bo has an allowable placement in XE_PL_TT memory, it can't use
>> - * flat CCS compression, because the GPU then has no way to access the
>> + * For dgfx if a bo has an allowable placement in XE_PL_TT memory, it can't
>> + * use flat CCS compression, because the GPU then has no way to access the
>>    * CCS metadata using relevant commands. For the opposite case, we need to
>>    * allocate storage for the CCS metadata when the BO is not resident in
>>    * VRAM memory.
>> @@ -2193,9 +2193,13 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
>>    */
>>   bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>>   {
>> -	return bo->ttm.type == ttm_bo_type_device &&
>> -		!(bo->flags & XE_BO_CREATE_SYSTEM_BIT) &&
>> -		(bo->flags & XE_BO_CREATE_VRAM_MASK);
>> +	struct xe_device *xe = xe_bo_device(bo);
>> +
>> +	return (xe_device_has_flat_ccs(xe) &&
>> +		bo->ttm.type == ttm_bo_type_device &&
>> +		((IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_VRAM_MASK) &&
>> +		  !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)) ||
>> +		(!IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_SYSTEM_BIT))));
> On an IGPU platform, is there ever a case where XE_BO_CREATE_SYSTEM_BIT
> isn't set?  For that matter, is there ever a case on igpu where
> compression is supported by the device and we _don't_ need the extra
> storage to hold the CCS data during swapout?
Apart from bo type being ttm_bo_type_device there shouldn't be any such 
case.
>
> In general, this function might be easier to read if the condition was
> broken up.  E.g.,

My intention was to avoid multiple if conditions. But if the 
recommendation is to use

it this way for better readability will update in next version.

BR

Himal.

>
>          if (!xe_device_has_flat_ccs(xe))
>                  return false;
>
>          /*
>           * On discrete GPUs, if the GPU can access this buffer from
>           * system memory (i.e., it allows XE_PL_TT placement), FlatCCS
>           * can't be used since there's no CCS storage associated with
>           * non-VRAM addresses.
>           */
>          if ((IS_DGFX(xe) && bo->flags & XE_BO_CREATE_SYSTEM_BIT))
>                  return false;
>
>          /*
>           * ...any cases where extra pages aren't needed on igpu?...
>           */
>          if (!IS_DGFX && ...)
>                  return false;
>
>          return true;
>
>
> Matt
>
>>   }
>>   
>>   /**
>> -- 
>> 2.25.1
>>
--------------Fxtwqm1IdoocP4UC9TXjnNub
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12-12-2023 06:11, Matt Roper wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231212004132.GD1327160@mdroper-desk1.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">On Mon, Dec 11, 2023 at 07:13:49PM +0530, Himal Prasad Ghimiray wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Allocate extra pages to handle ccs region for igfx too.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I still think we need more explanation on this patch since this commit
message makes it sound like we're allocating the CCS region itself,
which isn't the case.  The CCS region is already pre-allocated at a
fixed location reserved by the BIOS.  My understanding is that every
location in physical system memory has a corresponding location in the
reserved region to hold its CCS data, regardless of whether that memory
is being used for &quot;graphics&quot; purposes or not, right?  So if a buffer was
staying in RAM forever, you'd never need any extra storage.  However if
the buffer can get swapped out to disk, that's when you need extra space
to hold an extra copy of the CCS data for swapout.

I'm still not super familiar with TTM details, but I _think_ that means
that a buffer in PL_SYSTEM (which isn't mapped into any GTT or being
touched by hardware) potentially needs the extra storage space because
the OS might wind up swapping it out to disk, whereas a buffer in PL_TT
wouldn't actually need any extra CCS storage since it can't be swapped
out [yet].  And I'm guessing it's simpler / more efficient to just
allocate the extra storage once up front rather than trying to just
allocate it when a buffer moves from PL_TT -&gt; PL_SYSTEM?
</pre>
    </blockquote>
    <p>The explanation provided by you is exactly how ccs metadata
      handling works in case of</p>
    <p>igfx. Will update the commit message with&nbsp; explanation.<br>
    </p>
    <blockquote type="cite" cite="mid:20231212004132.GD1327160@mdroper-desk1.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Bspec:58796

v2:
 - For dgfx ensure system bit is not set.
 - Modify comments.(Thomas)

v3:
 - Seperate out patch to modify main memory to ccs memory ratio.(Matt)

Cc: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Reviewed-by: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Signed-off-by: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_bo.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7e25c8b7a01a..0df8f6a77040 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2183,8 +2183,8 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
  * placed in system memory.
  * @bo: The xe_bo
  *
- * If a bo has an allowable placement in XE_PL_TT memory, it can't use
- * flat CCS compression, because the GPU then has no way to access the
+ * For dgfx if a bo has an allowable placement in XE_PL_TT memory, it can't
+ * use flat CCS compression, because the GPU then has no way to access the
  * CCS metadata using relevant commands. For the opposite case, we need to
  * allocate storage for the CCS metadata when the BO is not resident in
  * VRAM memory.
@@ -2193,9 +2193,13 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
  */
 bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 {
-	return bo-&gt;ttm.type == ttm_bo_type_device &amp;&amp;
-		!(bo-&gt;flags &amp; XE_BO_CREATE_SYSTEM_BIT) &amp;&amp;
-		(bo-&gt;flags &amp; XE_BO_CREATE_VRAM_MASK);
+	struct xe_device *xe = xe_bo_device(bo);
+
+	return (xe_device_has_flat_ccs(xe) &amp;&amp;
+		bo-&gt;ttm.type == ttm_bo_type_device &amp;&amp;
+		((IS_DGFX(xe) &amp;&amp; (bo-&gt;flags &amp; XE_BO_CREATE_VRAM_MASK) &amp;&amp;
+		  !(bo-&gt;flags &amp; XE_BO_CREATE_SYSTEM_BIT)) ||
+		(!IS_DGFX(xe) &amp;&amp; (bo-&gt;flags &amp; XE_BO_CREATE_SYSTEM_BIT))));
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
On an IGPU platform, is there ever a case where XE_BO_CREATE_SYSTEM_BIT
isn't set?  For that matter, is there ever a case on igpu where
compression is supported by the device and we _don't_ need the extra
storage to hold the CCS data during swapout?</pre>
    </blockquote>
    Apart from bo type being <span style="white-space: pre-wrap">ttm_bo_type_device there shouldn't be any such case.</span>
    <blockquote type="cite" cite="mid:20231212004132.GD1327160@mdroper-desk1.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">

In general, this function might be easier to read if the condition was
broken up.  E.g.,</pre>
    </blockquote>
    <p>My intention was to avoid multiple if conditions. But if the
      recommendation is to use <br>
    </p>
    <p>it this way for better readability will update in next version. <br>
    </p>
    <p>BR</p>
    <p>Himal.<br>
    </p>
    <blockquote type="cite" cite="mid:20231212004132.GD1327160@mdroper-desk1.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">

        if (!xe_device_has_flat_ccs(xe))
                return false;

        /*
         * On discrete GPUs, if the GPU can access this buffer from
         * system memory (i.e., it allows XE_PL_TT placement), FlatCCS
         * can't be used since there's no CCS storage associated with
         * non-VRAM addresses.
         */
        if ((IS_DGFX(xe) &amp;&amp; bo-&gt;flags &amp; XE_BO_CREATE_SYSTEM_BIT))
                return false;

        /*
         * ...any cases where extra pages aren't needed on igpu?...
         */
        if (!IS_DGFX &amp;&amp; ...)
                return false;

        return true;


Matt

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> }
 
 /**
-- 
2.25.1

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------Fxtwqm1IdoocP4UC9TXjnNub--
