Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616EFC54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 14:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEFC1124D2;
	Fri, 22 Mar 2024 14:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMcOC/rw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7024310F0D1
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 14:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711116904; x=1742652904;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SjpamZn5x0m+nH4+oKt52ReEjVzvod1uZDO9NqdjQPQ=;
 b=TMcOC/rwZPNruc++83Z9pUQrhMmTKu+mTiaZKP7367tju6WdguEqastw
 4Yeap7nk0xDpYRsVTrYTrTahFXazwy29YUfqtc+ca4mzFEQcg664Q3otV
 agmAW4OtBuxx2NNzd4+4IbQznNkhbtfkKXQJiXqw4z+NVS0T0oX6u28sY
 hPDRVQeGEnLZg40pPfvtT5YzSZRpjSuvHC7KEZceNwmgC4s1z/VLeQCG1
 h7LqrP+8e5/Rq4PKOqEH9NKHOQy71G+Zn/EuyQM6RPctL675o920KIXG0
 JwoaJj/8r6TUOWl4f9EzS/Ps6fJJvPe/5AiabS4m8CAhev2uE3VtKOiEl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23654460"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="23654460"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="46048049"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 07:15:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 07:15:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 07:15:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 07:15:00 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 07:15:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsj90P7TjS0nPI4NTkeVztUzBkU6bFblo2FfVz2IxSGSkerdS8D6Y2Vs1TCzkHYETrsoVurOv1jvKCb9jLHMnY8wmDXJfIDv3ylU/BcAP7FMN2cYJEFQAF6LQDslUiu7+xhwF4bMZnsFQ0D8VTBhOcnsZs0nF2rI9C2uIbMQMBt4XTRbTo07WMfcPseXt9P+avQu9kgRuAMpLFsIy8fK8FhGm41woibtXfY1Q2GrxsG9f5+vqLpdCd4C6zVn+JtGw0Uwgg8cTXmQkA+jmoFuzr9zKtk9rUj+TJdd9+IniXZAoxqsT9U6wprRwNi2MedouxTNNkA7R5aa2oKROoZt9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGuqAzRvuBgNG1NP5rehhhv7srg1LbX66EPxkDft8Kg=;
 b=cVSUpjqd/GJ6i1UslpNpbRVLqfFwgT4nPYaN4uwv8SvUq8Skha0HGDyFfLThO5Nx5ry27ceE7pqAdxN1zx3iFnzl4lrTIvkG3v1HYAOh6H7n/vHRzTdfsbDUg8xceOPdoRThSzhSygkxuW0LJq7apvx0B0A8pqxOzbu83pHfPQb55ZIBkPyBXI1iOP1UW2aVjJxQ85S0kkP9Yv4X6pMEZ3Brt3xa6v87L9c5olIXNYpCUUB9u3WvOezNwThxAqxnfeH7CQbdAY1GpFL7E+uCBRoY0B6pyMvFf8h1PCkrvuy3aUfRnAGF8UUAcYFxP+leuIlDxrniJpRn1plKph7Ijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 DS7PR11MB6200.namprd11.prod.outlook.com (2603:10b6:8:98::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.13; Fri, 22 Mar 2024 14:14:58 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 14:14:58 +0000
Message-ID: <3c1f75ed-5f28-4fd0-8625-5611c7f95df9@intel.com>
Date: Fri, 22 Mar 2024 19:44:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/hwmon: Fix static analysis tool reported issues
Content-Language: en-GB
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>, Riana Tauro
 <riana.tauro@intel.com>
References: <20240321104624.2205317-1-karthik.poosa@intel.com>
 <20240321104624.2205317-3-karthik.poosa@intel.com> <874jczn3io.fsf@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <874jczn3io.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|DS7PR11MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb9478a-8b83-4030-d713-08dc4a7a74c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wta4STUVDAtmkaDLyriBcHgLGDZVsYUFzt0rAyhyGh1/0bsKGrkT8fPLKiHj5nnsmS8oxEJ0leEJD4QPnH8Py8C2u6ADXEvzXzyR++QSwurJBEoc/FMMijnzvn1nm0uWJB4WgFEfjQnynthsX3oDyIa1+Rfsgf3JbnSrS+Hg4/3XLbPfrL3+/Cnf+dAFhUHzcbd3k5j80OY9g9cdOSR9sfSejPoK/IlU83UacoEN656eWfL+oSNkWQP2oSawyxRYZ/bfFD/6KzEZoPzoTRkFbJC0tv37Dy83UJ0FEGfYl/Vt72avDSBTg+30eQUxezzUQQjErGNwa2CeLLz1tk4GkBYh0GNlWOOt96+CToD3yyqIAk3Oy0xaSJIipyoO3pkMNA2QMOGWXusFnw5PJAq8+yLd+sOGYumZBmLrPo7vubvut/0DJsyTxPK+OPve/8OHdGNKxHiI/Bkh4ET0icMd/lMFw/LueTR2yaflp4/BLKv256BYqjn338qWbEXUL2cFa53FKuvot43d+6ztGdSzqwRkP9xqoAHkB3rmd7qk11ZvvG0giYYEGHNvDZ6Bz9aPN1Xh5G1A7lb8Zuq9Vpjp63xr59b6iNdh+fNGPOJjg/GkzKG88nqFgQOlnH1YLo31cbEh0UO1AO/IPF2+pMq1s0KFPq5b6wYuJqgGp2uALw4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjZmT1lmcFVsdlhmZWU1WFlEdCtSQ0dqTTFqK2I2NzMyOVU4cUY4elNmYUF5?=
 =?utf-8?B?Vi8zVjltK2xoakNiS2ZnTzgxcHBJTk43WTdJbzhTeVpzenU2UEJSUTB0T3pl?=
 =?utf-8?B?dUUrS0JsWndSVVd1Zkg5ZW5lK05DWUhrZzRwZGtienBCZ2FrS2hwWkFSYUdi?=
 =?utf-8?B?cG9EdUZoOEhjVWY5VUVmZ09WM1BLLyswUWZYNjJlU284UlVlcGY4YzZkUUJi?=
 =?utf-8?B?QjhBcnpSNnc0dDdabjB6YVhKVVdBaWY1czV3WjRjYXRYMTNTdWJXWGpRak5G?=
 =?utf-8?B?YUNmUkpwcWFTNDNVTWtacnYwR0w3ZWIzTDAzQUkwbHM5NUkzODZSZitKVk9T?=
 =?utf-8?B?U0VFTnkrMFNTS0RLdnljK3ZFK1cyM2FOUFJJbDE5ejAvUVlIR0c3OUZpQS95?=
 =?utf-8?B?VFBCVGxIOXZMT2ZTSytuVS85Ymg1akowVzVOb21iL2RYcS9PQnhCKzVlWGdr?=
 =?utf-8?B?UFJMODNzVzcrZ205TEpra3dKT2xsRGdsWERBM2hQcmtyc2pPVnVIK1g0RFdZ?=
 =?utf-8?B?VFVUTUVkNDFYQ1Yvc1M3dEVMVDhJYW5pdXZMYmtxK01ZZ2oxTXJKZnN0ME1L?=
 =?utf-8?B?SkR1VWNxQ05NeEwyQW5WWWVuWGgyemwvSXdyZVFGUDRjZUVCaHlMdk5NVytX?=
 =?utf-8?B?NlRXendvV1hZYTV6TWZNcDhKVGlQbE4vRU9Fa29vYjl2eE5IMzQ5SjIxSmZY?=
 =?utf-8?B?WVRrTmEwcEFwVmwvQit2L25Zc0w0Y1lTN1lGaDhZWVQ2emJmTXp0dVVINkZC?=
 =?utf-8?B?aS9kMGlCb0FRRlhoRFBMNG1xOUNXVHBOLytqd2NkYVh4NUUzSkVob0VKMkt6?=
 =?utf-8?B?ZCtWR1p3RVZ3c2tPYzRubGhQL1hPNS9CblJub2dZUDdOQ1plMTVaWmsvemUv?=
 =?utf-8?B?c3QxZEs2OEh6WTRPVTh3T0F6b0ptOWZLMG4weDNWZDQ0SnlnaFIyajVSbkNq?=
 =?utf-8?B?SjdwZkJwTzgrc3JvKyt1M053NjlXMC9NMDRQdjR1VmplSGR5OWErdlVrS29x?=
 =?utf-8?B?ejNqNVZ2M0JNSGJoY3RHUVltS2wrVmdOOGNMVmVocDZpeEQrZnhOMjlDci85?=
 =?utf-8?B?SFJZaXJIQSsrc0ZCTllTcmordlF0bEg3SGltUSt6cWZReXlmR2xGOEtjNXdR?=
 =?utf-8?B?eWlNQUE0RDJMUEZNclYzSUhJV3k3QUZtWDM5R01NeGtIM0JzZFhkTHdmWm5y?=
 =?utf-8?B?bHY4N2kyN2s3ZVFUY1Z2VmZEbDNuWDhwcTBzb20wbmFYTGVNZGo1aE0xamhl?=
 =?utf-8?B?cnRwd3N0QXJMbTUyMXJRbXNhK0VBMjR0MFp0U0c0ZUZ2bWUyalM5amErVDli?=
 =?utf-8?B?Z3JVZS9IRU5tckF4UjhIR1Y0NWdlZmZyL1R4eVVlT2tYNTlHWHdGemlvMVFa?=
 =?utf-8?B?dkVKQnNKekF3NnJsK3FabGQ5YWM5YjB6VzBSU3Yza3NJb0Q1ZTNXd3RJNWxo?=
 =?utf-8?B?Y0lMSFg4b1p2SlBqYU0za29xZ2dMY1p5NEljWkdIRTYvaXZDSVR4VkF4RU5V?=
 =?utf-8?B?S0pnYWpnbndmRjF1MkNQYTNhbVdRa2k5aW5CWDJMemVJdjc2eWxrVk84QnNV?=
 =?utf-8?B?WkZzMzdvVGp4VTJqKzllZzNvcnE5TWd6ZGYvMkZaN2JZWk1kQmZvUHBHYTNP?=
 =?utf-8?B?eDZrU2dZZWExZ3FscHZ4RWFoK0hVODlacmtnSFhOY2JWTENGa0V4SVFXZldq?=
 =?utf-8?B?djduTjczZ0pjc1MzdFNvTmgvLzU1ZEowamNqVTYzUzQwTGIySFRaNEFFV1hy?=
 =?utf-8?B?YUpJcThybnpQNmJPYVhoTXc1QXhuemxkR05ZYjl5Mng3YVp6NDEzTTVVN0x2?=
 =?utf-8?B?WWF1UE50eVh2YUVYb2EwMTc5N3hCendSQ1RZcDFBNXkrWTB6ZEMySGdkK09r?=
 =?utf-8?B?eFR3SzkycXVIcjJWaktiOEtiREpxaHhLS1JTcFJONDQ4d2toWHpaZTFFek1B?=
 =?utf-8?B?dEh4QXRscFB2YVU2aEVYWUpPdWN6ZEFQRys1WnNRUUxheU1DUFdpNlRWaWxo?=
 =?utf-8?B?TFlmOW5IOHZrdTdzbExqZ05sN0FVU2dTbUVHcGdXbS94WCt3RlZDVXE2U0pB?=
 =?utf-8?B?SlRORUwwUU1KclkxTmxUWkw4dWtjeTlSMG1BaTE3SnhXaHdueEFRcm9Ic3Rv?=
 =?utf-8?Q?oBNPeXRf/BM58WgFeelJ0nyL7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb9478a-8b83-4030-d713-08dc4a7a74c7
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 14:14:58.8569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BL1rjk4wJRTXpVkKTSi7Dg8WUGl4Rzv7aNJiGDr1hHYQFTnV4q338hpapd1j82Xk7o7FCqpEKH1zt0k/hsCMiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6200
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

Please find replies inline.

On 21-03-2024 18:30, Jani Nikula wrote:
> On Thu, 21 Mar 2024, Karthik Poosa <karthik.poosa@intel.com> wrote:
>> Update xe hwmon with fixes for issues reported by static analysis
>> tool.
>> Fix integer overflow with upcasting.
>> Initialize uninitialized variables.
>>
>> Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index a256af8c2012..6ed9d5c4f6b1 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -153,7 +153,7 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
>>    */
>>   static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
>>   {
>> -	u64 reg_val, min, max;
>> +	u64 reg_val = 0, min, max;
> Nah. Just fix xe_hwmon_process_reg() to set *value = 0.
I think the caller has to ensure value is set to 0, it is not needed in 
xe_hwmon_process_reg.
> Side note, xe_hwmon_get_reg() should return struct xe_reg instead of
> u32, and xe_hwmon_process_reg() has no business looking into the guts of
> struct xe_reg.
>
>
> BR,
> Jani.
>
That change is not related to this patch series. It will be a major 
change which will be handled in another patch series.

>>   
>>   	mutex_lock(&hwmon->hwmon_lock);
>>   
>> @@ -182,7 +182,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
>>   static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>>   {
>>   	int ret = 0;
>> -	u64 reg_val;
>> +	u64 reg_val = 0;
>>   
>>   	mutex_lock(&hwmon->hwmon_lock);
>>   
>> @@ -212,7 +212,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>>   
>>   static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
>>   {
>> -	u64 reg_val;
>> +	u64 reg_val = 0;
>>   
>>   	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, &reg_val, 0, 0);
>>   	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>> @@ -243,7 +243,7 @@ static void
>>   xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
>>   {
>>   	struct xe_hwmon_energy_info *ei = &hwmon->ei;
>> -	u64 reg_val;
>> +	u64 reg_val = 0;
>>   
>>   	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
>>   			     &reg_val, 0, 0);
>> @@ -264,8 +264,8 @@ xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *a
>>   				  char *buf)
>>   {
>>   	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> -	u32 x, y, x_w = 2; /* 2 bits */
>> -	u64 r, tau4, out;
>> +	u32 x = 0, y = 0, x_w = 2; /* 2 bits */
>> +	u64 r = 0, tau4, out;
>>   
>>   	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
>>   
>> @@ -291,7 +291,7 @@ xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *a
>>   	 * As y can be < 2, we compute tau4 = (4 | x) << y
>>   	 * and then add 2 when doing the final right shift to account for units
>>   	 */
>> -	tau4 = ((1 << x_w) | x) << y;
>> +	tau4 = (u64)((1 << x_w) | x) << y;
>>   
>>   	/* val in hwmon interface units (millisec) */
>>   	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>> @@ -331,7 +331,7 @@ xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *
>>   	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
>>   	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
>>   	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
>> -	tau4 = ((1 << x_w) | x) << y;
>> +	tau4 = (u64)((1 << x_w) | x) << y;
>>   	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>>   
>>   	if (val > max_win)
>> @@ -466,7 +466,7 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, long value, u3
>>   
>>   static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
>>   {
>> -	u64 reg_val;
>> +	u64 reg_val = 0;
>>   
>>   	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
>>   			     REG_READ32, &reg_val, 0, 0);
