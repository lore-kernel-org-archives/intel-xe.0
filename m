Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6867BC3DA6E
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 01:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E53310E02B;
	Thu, 21 Dec 2023 01:51:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA6B10E02B
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 01:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703123470; x=1734659470;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a8/37KK5Z8KoYm8onPoMk1K36FLi3a6RQVGyTEQQ7wY=;
 b=KqnaCChzmEneIuvxRzJEIgK3vn0J+QtTvsW77mCTZeLvorQ2N3/2pY5R
 LhO75Xt65pvcg9JuLRr7PYxM9/U++RY4veMTOSnnXmxsb1kSJM+v+ZVEN
 D/pvkctlRcssn9ddinOYOPhZUOb3fJBV31YXdlmjQx0hC+SIJamROjtSP
 U/sYFeeqVcOMctDC7t4sGIY99afQ3gX2q0jtkv4iKjj5mg+dq81n6v/HK
 4ZGtihOEoHtjDoJQejALnTT4tPtl5BXTwAvqsSPH5kamN97Wej67C4a/u
 Jgtfwpqyj/TkPT8sICTbE/AhJsd1U8M227VwHGXpwkNin5dK2Cp7rERQ9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="394793720"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; d="scan'208";a="394793720"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 17:51:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="894916491"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; d="scan'208";a="894916491"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 17:51:09 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 17:51:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 17:51:08 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 17:51:08 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 17:51:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBUAkH1zSacKcHNOtSG0olgB05ADp+m5u5t+rEVOUatH71x4kVE3Bz6UACp71e23sO9QbHDUVxYA0lXniLRywUG1xFf2UUW6HGNpkJsAyCR4SmiAEJcTVnZOmE7I34tN5tPtKKBMy619Fz9Y80CzzdlcdJsM0bwruZ/SYPvFSyAMaqog+eqmypjMF7e4GEHngo1MUVDMEL4MChDhdfY0CnWhCsvSSYecBz9zl6eRqOTnjBoy73mzS4huTOHq5KyPFiFD9MYTeavCcpTGH1rpWXfDLOAP1eS9WdvmreM3OxKT/TAGHFq7aXrdVmI5RuPMcW6cR7vXJYEKvz1eqWe8Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pq141PinNsmdEKet+6ZHJTUVFdVXP6fCRMyiZTXq8s=;
 b=GiS6kISpemKPDKeDA2Bu86qbN1PSpK2UGYTNB1KgdEUbm+08R2rcxa4ktRd9ufUecPi9jEmvuWVKkfCVXpYSufjK8NSzyajbcPczc71bQxB9NN1hWoZydauvSuCq0hF9x5TwPurhdRCGKwKIdtHCBTiu6S3DirFuJ0dQmG4X17MnhlVPb9rzLBGIax0kcMCFYrqgqz6K3CqC6VSeISBsxloBQS52HvN108XaE+5zb1o3wtBRCJvigiLyFLpz2MI8UKdStpjp3WHjzsz1bXMJf7YCSWMgbmPk1oA6gmtOCand8rDgk4VAEU+DowD0yF2xrF+4Fu1IMWIYBLfbzWulSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.18; Thu, 21 Dec 2023 01:51:06 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 01:51:06 +0000
Message-ID: <42fcabc8-4c3b-48ca-92ba-718333b539a2@intel.com>
Date: Thu, 21 Dec 2023 07:20:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Add base balance sysfs attributes
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231219100711.645011-1-sujaritha.sundaresan@intel.com>
 <20231219100711.645011-2-sujaritha.sundaresan@intel.com>
 <ZYMcoWPtLEuJST4w@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ZYMcoWPtLEuJST4w@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|DS0PR11MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f370012-d5b5-4584-2c2d-08dc01c74b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: owsXJ1HW0ZeOO4hxNgmtiAIKb0nkDqCUyM3UEPixN4OJ5tHRL6a6Xsbm3DZ9NNIh7OfLQ8MdS8O3it7IhRG3ef5wwR8mbBYGq6L6hPk6JcyylGgIQEaYUnS6TVoL8YDIx6uV7qBU2sHrCYqjXT5ye4/w52MxIJ/gAfnomhz7TlhXW5VWFJuBx2VSw4IzYhusilrZH25lQcrwcmefBmiQTCrv+34ckv2RccnPFHAIyTa7kv8kPJ9OjNyQoHFLqEu1EeHx02+H5JcWab4y2O8loJ5maEHVeWTfM8NQKfhb1QNhF0QTk1i1VeJT0iL5YsiGYKsKIbOh84SevH6sxF4RLHRRLkELBz9XFLGUkm90qBDnoKbIwRJG94N1XbGlPllZenzMZ+fPscR4jOSPov2A4AXRXtXfFV7KBuxDYp/h5MLeusLfzhXoTKRhBaDtUHE/soRF+h/SWoYBhFDBTbOWxVuY6+BicyDGk7PmcKkTYK2hAB3eAnV5JcmOoiGqQA8zh06ikzbPsUwBmDFAVuNPabbds6t5y8OQ/zahAJeb34up/yzvN4NB1nwXFeVZiK0NQYb4xroND4SeonRcEwn2YatIUkSqRDFN+I6lWxnQfG3E1tdh1acN+UWoaz0jYPH0TTlPVWVMuYdgYdbept7E3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6512007)(6506007)(478600001)(26005)(6486002)(107886003)(2616005)(41300700001)(6636002)(66946007)(83380400001)(66556008)(66476007)(37006003)(31696002)(6666004)(31686004)(53546011)(316002)(86362001)(82960400001)(36756003)(8676002)(8936002)(38100700002)(2906002)(5660300002)(6862004)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHlEYkxUMTFYbnZJRFVTVGMrZmYrS3UyUjEzTkRDcGlQODkvZ21KMVBxNERo?=
 =?utf-8?B?NCs3d3lnU0V6RndLNzhMd3AzSXFoRXUxZ2QzT1dkMm9EREowcURockg2N3Ex?=
 =?utf-8?B?UnFrMkF1WmJXQXVUZzFVOFc0eHhwRklUekxleEl6T29STW4rVThnQklOaklh?=
 =?utf-8?B?aG1jMnkxLytyZHNrYXNnbGJvQ2VzWTgyLzJkUmswbjFjcnpNVkY5Q0hOYVpR?=
 =?utf-8?B?QWlFMlBLdXNxbmdSMHJIWFlJbGY0L1dLNW9zMXhjek9oeDhJQ3NWOEROcmxk?=
 =?utf-8?B?MGFSN1JPRFdNLzBEK2ZPNHV1NDh0QzEyRWhvWjhHV2R4QXBqcmRoZUVvVkp5?=
 =?utf-8?B?dEF5VURXMWRvamRIbGFIU2dKUVJ5Yjh3MmN5Wnc4SGV4eVVrQTk2S29aUzFI?=
 =?utf-8?B?R0RaRE9qYUJqQ2NGMlZPKzhFWXpZM0lzMnlxTmVWNWhiSDFJQmFGK2hlT3l0?=
 =?utf-8?B?bE5ESUhZaUUzSCtEQVBTcCtnVXNBK0IzNnNLQ0lrRlZmcFpvNWQxQkxDQVpo?=
 =?utf-8?B?M2plcXpiQ29SUGFxNjRMa3pLMXhzRXZnZzVWQ2p0Mkgzem9HeUFwT1dpY3Mw?=
 =?utf-8?B?SzU4akNVSHl4Q1VZdkRTbnV5TWlkME1JS1BVL2FZSXRTUGg4WWdLZWtJVitH?=
 =?utf-8?B?TGNDcjhMajhCVjNDK2x5OUlaMHZPb0FqSDlJLzZpTnlDQmpUOTNmbjJNYXpv?=
 =?utf-8?B?U0JvQUo2YlJTQ2tmUk5YMVlyUFNxVzNpa0tpaWJxS3dxWTBtL0xpZXE2ZmJX?=
 =?utf-8?B?YnVVTS9FTjVBRXd1eHRiMEJ0ZG1Ldit3djE2RWIxNmtmVVZRdEREdlI1WVg5?=
 =?utf-8?B?a1d3eXNqS1FyUjFETHZJUW4wVnNXN1RTSUhVQzJKZkdPNTQxUnZWaEpnV0Zi?=
 =?utf-8?B?YkRlZy9zSjF4TDRWQSt5VW8xYWlGOXNQQzA5RU1JRGlTNTBKSTZJNTlqampj?=
 =?utf-8?B?R2hGbEIyU3NOUjA2NjJ5MVQ1dzNXeWFPc1VNcGM3U0hCWnBUaDVaMStmUlVM?=
 =?utf-8?B?S2tTU1ovL0RDdGFwV3FXM0pGUUNXRnh1Qkp4cy96TldZU0hERDZLQ0xDQ2Ex?=
 =?utf-8?B?OFh2MEZSTUt4cU54bkU1YTdXeUt0djRHcUI3RzcxbTlTcjArdDJkU0xIdWJK?=
 =?utf-8?B?QjRhRlpjbVQzWHFIWkYzYXJtOFRNWGxkYldGZVNveTlGVEhFaFF3bWZnZWtj?=
 =?utf-8?B?bWdyQkdjczJodFFxT2Q5Q0tnSGJGNE5sS0EvR1pXN1hUMXNPUkpmUnNua3Bm?=
 =?utf-8?B?dXhFM0xxRHdNeEs1cnNmN1Z5czlZVzNMaGNDZElvTHdTVm1YamhjMWNHeDhW?=
 =?utf-8?B?cnZOT0xmcXRsclBLSmVvd3BleXFHMXVPc3RmTU9ReVV4UEVVS0hhRmsvSU1F?=
 =?utf-8?B?VFQ5c21jWUZmL0RnampPZmlLaFF4cmJsZU1zRmJlcTFua0JwTHpWNjZ1clFI?=
 =?utf-8?B?LzZXSXZtTk5ycDhkVW9SaXYyWHpZbGp5cExiR3dxYkJUdVM1dWcrN1FMTklE?=
 =?utf-8?B?UmMwQWJvK1h1cXRuNDQrQk5iVFo2dGk2U01Id25pNGNUNjVsdVVwOVNmNnZr?=
 =?utf-8?B?M0dvdzkza2RjY2FXVGVjV1ROUXZsRlZER0NpSHBWc0c4ZW9nd3VZdmxkUEdH?=
 =?utf-8?B?Tm8zdER1dnJqVXpPWWlnNU9zMk5tQUpTa3FDUTh4VHZTTW91L0dXNWZJVUps?=
 =?utf-8?B?UnpLbmo5UnAzTHMwdEJ0L28xd1YzYkphRDk1NHRFQjY1UnFXZHJQOFZpbHMv?=
 =?utf-8?B?S2t4MDdZbW9LS2JKR2thWTRnUVdLbFdPcHdjeW0rNnAwSW5tQzlCS2JuMXBw?=
 =?utf-8?B?eVhTV09sNkZRaXI0OVczWWxLYjVGSm1wL04xaEprQ3IzUXAzYi9WQTRGRGhB?=
 =?utf-8?B?R3hvWnFwSzhTTzlmV0dCK2c0VVZ4cjBMeUlJdFR6Q2IwRFQvVTNrb3JySjA0?=
 =?utf-8?B?aHcxaDE1eUdtUWRkWVBpYlJxTk1vNC9Udm1tOUFOQmFUZTY2ak5xZVowbkoz?=
 =?utf-8?B?NW8vTGhnZW52N0tNRnVzV2N6MWsrN2ZZOVlIYmdCRTB3S0xaSW1FMUJTRjFr?=
 =?utf-8?B?RjhCV3JrMy9CWHhRY0ZoV2VQVkNlVzNaSWFQSittSEg0aUwrbUVSRTExMFQ5?=
 =?utf-8?B?WEVpZDIwejROSWlYVGlXU1J4Z0RYWVltU2ZhcFVMWHE0QklQVE5hbWluSWU0?=
 =?utf-8?Q?jQl7UJq811ueI1FOg7bjUAI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f370012-d5b5-4584-2c2d-08dc01c74b7a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 01:51:05.9749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fKuexOq5JwBk0ijSkPvlO58o1Xrh3mQ7F4hNSAqTLNEgcSBIa0WEH2/t/fZbINPSU8PcsElDlbKCuqz8slCt8YKqMKEdLGydGiEAodtfeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8049
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


On 12/20/2023 10:26 PM, Rodrigo Vivi wrote:
> On Tue, Dec 19, 2023 at 03:37:10PM +0530, Sujaritha Sundaresan wrote:
>> Add sysfs attributes for base balance in gt.
>>
>> device/tile#gt#/freq0/balance
>> 			|- base_freq_factor
>> 			|- base_freq_factor.scale
>> 			|- base_rp0_freq
>> 			|- base_rpn_freq
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile              |   1 +
>>   drivers/gpu/drm/xe/xe_gt_balance_sysfs.c | 181 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_balance_sysfs.h |  17 +++
> I always have a mixed feelings with the _sysfs sufix.
> I believe we should only use that in the case that the only
> thing that that component is doing is to provide and handle
> the sysfs objects themselves.
>
> if it provides key hw functionalities, that should be
> the main part of it. Sysfs is just a consequence on how
> that is exposed...
>
> like xe_gt_idle is better then xe_gt_idle_sysfs,
> I believe simply xe_gt_balance is enough here.
Sure I can switch it xe_gt_balance.
>
>>   drivers/gpu/drm/xe/xe_gt_freq.c          |   3 +
>>   drivers/gpu/drm/xe/xe_pcode_api.h        |   5 +
>>   5 files changed, 207 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_balance_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_balance_sysfs.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 53bd2a8ba1ae..64bfd3d6eab4 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>>   	xe_gt_mcr.o \
>>   	xe_gt_pagefault.o \
>>   	xe_gt_sysfs.o \
>> +	xe_gt_balance_sysfs.o \
>>   	xe_gt_throttle_sysfs.o \
>>   	xe_gt_tlb_invalidation.o \
>>   	xe_gt_topology.o \
>> diff --git a/drivers/gpu/drm/xe/xe_gt_balance_sysfs.c b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.c
>> new file mode 100644
>> index 000000000000..054b90ca128d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.c
>> @@ -0,0 +1,181 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include <regs/xe_reg_defs.h>
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_balance_sysfs.h"
>> +#include "xe_gt_sysfs.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>> +#include "xe_mmio.h"
>> +
>> +/**
>> + * DOC: Xe GT Balance
>> + *
>> + * Provides sysfs entries for balance frequency in GT
>> + *
>> + * device/tile#/gt#/freq0/balance/base_freq_factor - Base frequency factor
>> + * device/tile#/gt#/freq0/balance/base_freq_factor.scale - Base frequency factor scale
>> + * device/tile#/gt#/freq0/balance/base_rp0_freq - Base Render Performance 0 level frequency
>> + * device/tile#//gt#/freq0/balance/base_rpn_freq - Base Render Performance N level frequency
>> + */
>> +
>> +#define GT_FREQUENCY_MULTIPLIER	50
>> +
>> +#define U8_8_VAL_MASK           0xffff
>> +#define U8_8_SCALE_TO_VALUE     "0.00390625"
> I believe we should get the explanation in intel_gt_sysfs_pm.c
> about how these values are actually used and add to the kernel
> doc above.
>
> I mean:
>   * Scaling for multipliers (aka frequency factors).
> ...

So you want to add documentation in general for Frequency 
factors/multipliers in intel_gt_sysfs_pm.c.

And for these defined factors here, if I have that right.

>> +
>> +static struct xe_gt *
>> +dev_to_gt(struct device *dev)
>> +{
>> +	return kobj_to_gt(dev->kobj.parent);
>> +}
>> +
>> +static ssize_t freq_factor_scale_show(struct device *dev,
>> +				      struct device_attribute *attr,
>> +				      char *buff)
>> +{
>> +	return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
>> +}
>> +
>> +static ssize_t base_freq_factor_show(struct device *dev,
>> +				     struct device_attribute *attr,
>> +				     char *buff)
>> +{
>> +	struct xe_gt *gt = dev_to_gt(dev);
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_QOS_MULTIPLIER_GET)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_DOMAIN_CHIPLET)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
>> +
>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>> +	if (err)
>> +		return err;
>> +
>> +	val &= U8_8_VAL_MASK;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +
>> +static ssize_t base_freq_factor_store(struct device *dev,
>> +				      struct device_attribute *attr,
>> +				      const char *buff, size_t count)
>> +{
>> +	struct xe_gt *gt = dev_to_gt(dev);
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	err = kstrtou32(buff, 0, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	if (val > U8_8_VAL_MASK)
>> +		return -EINVAL;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_QOS_MULTIPLIER_SET)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_DOMAIN_CHIPLET)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
>> +
>> +	err = xe_pcode_write(gt, mbox, val);
>> +	if (err)
>> +		return err;
>> +
>> +	return count;
>> +}
>> +static DEVICE_ATTR_RW(base_freq_factor);
>> +static struct device_attribute dev_attr_base_freq_factor_scale =
>> +	__ATTR(base_freq_factor.scale, 0444, freq_factor_scale_show, NULL);
>> +
>> +static ssize_t base_rp0_freq_show(struct device *dev, struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct xe_gt *gt = dev_to_gt(dev);
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
>> +
>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(base_rp0_freq);
>> +
>> +static ssize_t base_rpn_freq_show(struct device *dev, struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct xe_gt *gt = dev_to_gt(dev);
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
>> +
>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(base_rpn_freq);
>> +
>> +static struct attribute *balance_attrs[] = {
>> +	&dev_attr_base_freq_factor.attr,
>> +	&dev_attr_base_freq_factor_scale.attr,
>> +	&dev_attr_base_rp0_freq.attr,
>> +	&dev_attr_base_rpn_freq.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group balance_group_attrs = {
>> +	.name = "balance",
>> +	.attrs = balance_attrs,
>> +};
>> +
>> +static void gt_balance_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +	struct xe_gt *gt = arg;
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (xe->info.platform == XE_PVC)
>> +		sysfs_remove_group(gt->freq, &balance_group_attrs);
>> +}
>> +
>> +void xe_gt_balance_sysfs_init(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int err;
>> +
>> +	if (xe->info.platform == XE_PVC) {
>> +		err = sysfs_create_group(gt->freq, &balance_group_attrs);
>> +		if (err) {
>> +			drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
>> +			return;
>> +		}
>> +	}
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, gt_balance_sysfs_fini, gt);
>> +	if (err) {
>> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> +			 __func__, err);
>> +		sysfs_remove_group(gt->freq, &balance_group_attrs);
>> +	}
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_balance_sysfs.h b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.h
>> new file mode 100644
>> index 000000000000..39cec5223cf3
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_BALANCE_SYSFS_H_
>> +#define _XE_GT_BALANCE_SYSFS_H_
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +
>> +void xe_gt_balance_sysfs_init(struct xe_gt *gt);
>> +
>> +#endif /* _XE_GT_BALANCE_SYSFS_H_ */
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>> index 08eabcafe7bc..5b0e4fc402ec 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>> @@ -13,6 +13,7 @@
>>   
>>   #include "xe_device_types.h"
>>   #include "xe_gt_sysfs.h"
>> +#include "xe_gt_balance_sysfs.h"
>>   #include "xe_gt_throttle_sysfs.h"
>>   #include "xe_guc_pc.h"
>>   
>> @@ -215,5 +216,7 @@ void xe_gt_freq_init(struct xe_gt *gt)
>>   		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
>>   			 kobject_name(gt->freq), err);
>>   
>> +	xe_gt_balance_sysfs_init(gt);
>> +
>>   	xe_gt_throttle_sysfs_init(gt);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 4076a4e9daf3..87213b52df4a 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -49,6 +49,11 @@
>>   /* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>>   /* PCODE_FREQUENCY_CONFIG param2 */
>>   #define     PCODE_MBOX_DOMAIN_HBM		0x2
>> +#define     PCODE_MBOX_DOMAIN_CHIPLET		0x6
>> +#define     PCODE_MBOX_DOMAIN_BASE		0x8
>> +#define   PCODE_QOS_MULTIPLIER_SET		0x67
>> +/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */
> this comment seems off here...

Will fix.

Thanks,

Suja

>
>> +#define   PCODE_QOS_MULTIPLIER_GET		0x66
>>   
>>   struct pcode_err_decode {
>>   	int errno;
>> -- 
>> 2.25.1
>>
