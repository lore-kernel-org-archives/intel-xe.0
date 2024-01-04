Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EBCC4706F
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 06:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1448510E38C;
	Thu,  4 Jan 2024 06:06:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C5E10E38C
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 06:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704348372; x=1735884372;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oGC9dcxEL7lVpdm2yYl8IrJZV3HFXY/GwwGM8TEcsqo=;
 b=abxaRUgo1EctyRigWBbxfQtVWaHnJbe1nnbVdmU2OPA8N811wfjB8zPO
 cbkWrnQFB1eaioS9lXUfJLZ0/x59nqn0b4tdn/EyBUeCCpXlil0Vfi3RZ
 du7W8jY1qdlRzpOmRTlQ3XoDSNQtQffPafPK9spRT6NIi9b9yRoK4uOcl
 OOE8Q+glzJuhhr1PNd5kGTeajmYs5x0Ni8mmr+VqmzIoO31giKlEx6eI2
 GBRsroe5ING7WY+mjaOWCnqVITejKcMHcwjqMTIMFOKP3bYtUxOmKNxwS
 yPpfHFi7hXgasIBevx4iIl6N12KJ8gM4Lm3N6iPOrttEag7ANFHrEp4Tt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="4478157"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; 
   d="scan'208";a="4478157"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 22:06:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="903683064"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; d="scan'208";a="903683064"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 22:06:07 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 22:06:06 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 22:06:06 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 22:06:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VA1WKd9x+wt/3hMmStmedL03xD9CwuSYoK+lZWo7wzDXoEGsKpT12KLe+VK0by5h/GHBHgASAZi+mS2UdP6ZOBTuocA24KE06iS+m8DevTkurjH50P42h5qH+0kGNPl4XuAh+oCk4NWW4RUsRcsJPm2/caq1nyqMmlVaS/2bf12RkWGUT0Fz1SYzUfzsCvVhvm0T/a1RCKzrtSOTM9GNdDivPSmDqwFkVYR8gK0a/cCuydVDzCSgVly64CHe0j67IQeQl/Hb9GmfkDamJPT+d6psZym75im8T6utvK7D91+xOJb7Ysjy9PpPsZew76wGYJhVEQjLryyorK5rwyEyOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGlXTteIb9Qao0HvuFtz6PptnwLL5UjbJfrMcFI4Ag8=;
 b=cNE6TklmPdBDbNe/bdiV6h7lVA2lRttLWo6bKaGYfNgPJb2oy6m3uwGDb40VuQ4xOOm4+XpFiLRHxBVJHG7jNdKKtsdu4nVHVFuPCFsV4rcWS1LuyGHRVfYIU+bR0mcfLf/nu3kPsFPRlbEKK7/6ABfKU5fB7rMwJa5e0KzgwEQ7zDsOsTTCqjFiskLodkjVHGnfgAZkyeNFpw8q/zF2UGNbrGIdGyFJLkTIGJH6AxVRebmea6f4+7p2+Abn87nz2uRlTxEWPUMe5VL9uOAPt6go61149JfQgMOhOTCntpy7VNFWzRRzODy0tcS40xYFuQ5ardDbWLnK4UcY9HKTOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 06:06:04 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13%7]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 06:06:04 +0000
Message-ID: <5c890fd0-1731-4fa2-a714-6859cfab7874@intel.com>
Date: Wed, 3 Jan 2024 22:06:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Check skip_guc_pc before setting SLPC flag
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231222210109.533215-1-vinay.belgaumkar@intel.com>
 <dd42753d-5cda-4e95-a299-0cda55df4184@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <dd42753d-5cda-4e95-a299-0cda55df4184@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::18) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f71f8e-b9fe-4da5-1890-08dc0ceb3c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mJp326PHquyOdTo+8B5hTlg/zYMSI2Pc8x+L4h2Ua3ZNVbo3h7+J5c7bV5MYqsUP4BiPFlYJazZ4b988Uou9WnPBn395xVOeNtsh1HPseG5C2QpIZyxM5gTc44Ek4jMoS/i1cuMZFvpnH3PZ32e2WN+Rt4IoryFyAD+8JqE+ZUcLH4s0dQRz8YbapPfC2rZnu02lleZWIxlFft50g5xwYkADpVMFHaEkZClkbTEFldTxidL4PFFlywQMMMKrM3CX11VBpSp2v/98zBR89dB1QkOTaNktgP5wa+ijzTO/qziqE/OwK8H83oL2VUTg08oXo1+0iz0n7g3sReuH905nNyNWVN5CtN3ilkkciSYHW9jrSaVm4VflFvG5pvSbQYqXhcbMxkkpuso1NepFK3AL1Y8kzAQRQfueAreFgw+y704KJ40YYyrvHdbzjbktLypLyrY5bV6RKVMmrzjWBoi2t6nkqVD5H4S1nybssQrhvOv9edo23fwxu+ytsUVCmpWHmszAXB708C7vex0/5ZBcUemqdySf8lvxxi6mocMg6XB/5rz3Xt1vJfONo230k5Xv0oVheR+es6tA7kPSBVWSmJx43+arDalh6Uyvx3vGgtxz8e+perMSFuNmGO6yJy2LiSknPUYn0MZhjCECzuGIMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(2906002)(26005)(38100700002)(107886003)(41300700001)(83380400001)(2616005)(82960400001)(8676002)(8936002)(316002)(4326008)(478600001)(5660300002)(6506007)(66946007)(66556008)(66476007)(6512007)(6486002)(53546011)(86362001)(31696002)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE9MM0dFdVZSZUJ6RFBOUGJvemZZUFdWdU12bkloMTV0T1lJdEFMbDFxYlhh?=
 =?utf-8?B?V29kR1AyY1VFcWVUUFZNZGtVTndVU1YxSWNGVXdkV2cxNXd3Y2dYb3k2Ryty?=
 =?utf-8?B?YVVNYTBMRWpPS0lRUnl4MjJNSG5XMUwya0htMFlvbWJVWUlPdkxkdzAzSnNL?=
 =?utf-8?B?emZJZ2dKT0VUOGZWRDNiQ0NKN3cwYmVjWEhDaGNuZ0VLeE5vdXRjRWMwelJs?=
 =?utf-8?B?UnpMUTdnT1pyb1U2K3VYdm84ZDNLVjFRR05vYVFXeGlDZmxsS2NNVnhnZGxa?=
 =?utf-8?B?Q0Y0bWpNZkZzQ2pOQnA2TW1hdnRxTTA4Tmt3Nkpua21DQUFEUHhlbG00VjVB?=
 =?utf-8?B?dnFSdzdFNkdGY3l4TDlidUJlQTZwb21HVUNxTmNmQWFhWXRkWElBMkdKTEdv?=
 =?utf-8?B?aTAzYmY3ZG92Z003ZUplaFJQNmFxZVZwaGhxdG1zSVBSRmx1b1dKRHRlYlBM?=
 =?utf-8?B?T1VrTGdxaDl0bi9sTFZZU2daT2paOFlJQ0RFNWc3NzZNOWROejFkSHo1UktL?=
 =?utf-8?B?b2VXSmRMRUdlVmNjQTZDQ3pQQmwzMzJaM0YzYThNOTVYRmo0QzBGSkdHNWxS?=
 =?utf-8?B?UW54dERnNkVkVEpnZ1E2bjFTWG9jN3VqZ2RJS3U5VXB4Q3Q5NmZzMmk5bGR4?=
 =?utf-8?B?MlZMblh6ZmdyR2N5VHY1bWxQaEFEUFhmZ2kvYS83eGhva2d5NmFlQjhlWDFV?=
 =?utf-8?B?R21nQ1R2eHlEazRZaWNqOTgwb1NWdmp4a054S1Bkb2NOQ3NmRnc2MHFERWRr?=
 =?utf-8?B?M09WWXZOaitvZ3pqbVlhaHdScTRIMHBTR0QveWtjSUVCdkZGOTFqNEtLc244?=
 =?utf-8?B?UHpXNVNPbk5Mczd4U095YmpHQnBTWUEvU2kyL3I1RlY2MXNhMlBWREtoT1NE?=
 =?utf-8?B?cEx4NlBvKzcvTXIrbWtYKzZEV2hxL0FwUnBxblZJbXo5eGZwbUhNejkrTXR6?=
 =?utf-8?B?TU9QVzVTdlEyb3ptd055VGp2MExQL25kOWpLYWNjMEo2UGlzTHlnTDVScUlh?=
 =?utf-8?B?YU1zNTE4L29nWkNwOU5CSDdWMnR5QlhQNTJOamJ6eGVyaUZxWGREOWcycWI3?=
 =?utf-8?B?WWFBS1cvdllMUFhRU2svazQ4L3Z0TTIxNHRQeWpHZUUyRjhzWDZ4NWI0RUlr?=
 =?utf-8?B?ZkZXeWR4QUlSM0RRYmtyY3IwSnRWNzUwSUNRNTBNYzFMZVlCUVFpRzdCOEpo?=
 =?utf-8?B?ZUYrNlNVbHVwdGhHNTNVZ3BTNmZoVWZMN1hhRXg5YTEvenBwUVFzTlh3VjFJ?=
 =?utf-8?B?clAwcEdrR1ozVE9YYy9ONkxBUUdqeTFmM0V5U05PSk8xeG1icDVWcFNKOHMr?=
 =?utf-8?B?cU43MWdRWTNBY1BickdJem13UmM2cGtyL3dGYWFEcDMraHZvZm1waUJyUWxn?=
 =?utf-8?B?d3dFcmNtNGhJQjJ3eWhLK0xXRVJiQTJPU0Rka3pKRlNnV2lxaWluVkNOZzBC?=
 =?utf-8?B?ZlNxc3E0WGxabmJpRU11QU81M295RGh2bTlOU1RTdzdiTnJGaE1xVEJleFpy?=
 =?utf-8?B?S3daQlJvZElzcjFmam1Fc0VJczluZkdmMnFjZUczLzNzejQxMVNnWVF2S0dw?=
 =?utf-8?B?aWNobitEWG43U3JNZEtWVTFkRzk5YUsyTTV1YWR0eEVBNUFOWEpZTlIzZ0Jk?=
 =?utf-8?B?enBKMHR1U1BHNlBLSVluUUEwTDloYWpmQUN2VVdHaUcxdEhYcWtFQ1Vkcngz?=
 =?utf-8?B?dTJMOFlGUE42dXN2eHg1ZUh0VGFNRGFlRnVwc2x3S1cxclJGMnVCL0VxYk5R?=
 =?utf-8?B?eGpwR2pvY0NBY1VTV1VUaWZIZldha28yUjZkS1dIaFZnQXNtNjFaeFBha2NW?=
 =?utf-8?B?dnNHait6aDJCMCswdnIwbGVmUFVmR2NURVI3RzNndUFoWGNzbGNvVGRGODk5?=
 =?utf-8?B?SC9wMU9PQlphRThiZ3R3NnBYTm5Bb2hwY25GSGxDaXlwUFJWek5ZblNKYnJW?=
 =?utf-8?B?ckIycTdKaFJQVUdTY3YydWxQMHZXdW1JWWlxdzZSMG9GeU9KeHh4U0JoRmFI?=
 =?utf-8?B?NHQxM3NpazU5eUZxc1FPd01jak9UWHZYQkF1Sjd1TGpnbHdzTXZJZndOQTFs?=
 =?utf-8?B?VzZrOXpiOUZNSldPYzdQZjB3amJpaU4rd3lZRzRvY2FWZHc0V2hzMGluTTlM?=
 =?utf-8?B?TGVWeWF2M2FnL3owWGJyQmkzNzFQUmhYUjA1MnNKWGRJM0NtRW9SL01QcjM4?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f71f8e-b9fe-4da5-1890-08dc0ceb3c0e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 06:06:04.5493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oa47MHnQXWT6MBmHvckqFttO4EmffFmI6FmraB903rQ2Ei1cIk/TUa3F0aagbpHuyvfqNoA0zrF/4h/nXeia26bR6G89XKpcn7sR+GsUiEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 1/3/2024 8:56 PM, Nilawar, Badal wrote:
> Hi Vinay,
>
> On 23-12-2023 02:31, Vinay Belgaumkar wrote:
>> Don't set SLPC GuC feature ctl flag if skip_guc_pc is true.
>>
>> Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is 
>> set")
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 811e8b201270..0e112b144ec8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -62,7 +62,12 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>>     static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>>   {
>> -    return GUC_CTL_ENABLE_SLPC;
>> +    u32 flags = 0;
>> +
>> +    if (!(guc_to_xe(guc))->info.skip_guc_pc)
> Frequency attributes freq_min/freq_max may not work when skip_guc_pc 
> is set. freq_curr also may not work. I think these freq attributes 
> shouldn't be exposed for skip_guc_pc case.

We already skip pc_init() (whihc creates the sysfs attribs)  when this 
flag is set, that was in a previously merged patch.

Thanks,

Vinay.

>
> Regards,
> Badal
>> +        flags |= GUC_CTL_ENABLE_SLPC;
>> +
>> +    return flags;
>>   }
>>     static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
