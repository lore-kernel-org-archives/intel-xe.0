Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899FFC48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 18:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493A010E63D;
	Wed, 21 Feb 2024 18:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eOQTK04G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491D410E63D
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 18:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708539708; x=1740075708;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aQCmhGqqHQCUWBbLD0pw01wBWbSGcI7lzra6Iiewznc=;
 b=eOQTK04G47NfDvqK0f9we9R4MLpv7dZxpakuRp6xG7gkyUAwcWjMwZ4h
 NncCi0sN0W9VjKWMRoxDgn20CCiJVLH64F1YK1p+PMbFy7Mfn2URSMWM+
 e/9vC4ip7UJUV6fufFvWjXf2RnQda1F6BFfOpiqRdWgvH9s59qeGBePKd
 84DAYgZtQXlSfZom6sLojVia0zC9Jl7brje8MgijwbltemgUaqGcC53CV
 W9xW3NFAiODkl44TogNRvi8zhjQ1891RD0O95uySPoszqwPpRmh5lPB3d
 C369Qrbq468I5LDNw2rGaaR6zKSMgIZSpKPIF7obIpJrVLdTtRyoakv+s A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="20263970"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="20263970"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 10:21:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5581672"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 10:21:48 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 10:21:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 10:21:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 10:21:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnVo93lu/SrgmILeVRx8JR9VkTVxx9THErKzGyGt3JT22LZ0Px7iG6P6Vx+iqHSkiCKqzQcvURfTz/YKuA8x2rnNioMtgw8VfSuoU96lnG7Hbbj6FOVUaYsB4MoV2JaF598HmK0xAL4Gvs2u5qDQxu1QzKJCZEkdf4ek92A8/fwmZG9wRC7DeyZXB2NnxSVYaiMXOcYPfelhfuUjbMKP2ppRj/K025n969OmgbOGZwvAMCnB9cTIpOOPF1bOiZDYHPJqATa1soXk5b+zHUhJXnbl1Uanr73im7f1FwF5V0CEdrS4Fr8cLmz1S+dt3m43JsFpCIR3akMkbf2S6v3+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mNjWUXz49IV3YUXa+BaEuBojNuiCViz0WCvqsjtIcA=;
 b=FYQaw6UiCtk0LZRlrdO4R3O/ioX0td2yYJ58EWmVvgVJgBcn+XXDfOxhHl89QvqXVdTvh40w3jCCtVOG9jowOfVeyIJP6R5teyKrzwN3fv1+0muLbES9Vjth5YDR4vUh/HA3SsSWXKP5HQxFwW7OTGdcdEOz4WTH2jVs7/YTf4NIkK9jqUoxOSJuN1W3gU7pY2/YIr0lMhWAE30TxCOPPJywJHRn44cnaKyzPbBHiwrq482de0Us2DDUd5wag/zoNlXMXLzFBopArJMjCJnI/TDXBtLayal/ypmwQJK3Y4+xrGDL1yVC5E90duHQfVsHr7Nh9yvMNOxHSeFHGn2rZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB6727.namprd11.prod.outlook.com (2603:10b6:806:265::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 18:21:39 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03%7]) with mapi id 15.20.7270.036; Wed, 21 Feb 2024
 18:21:39 +0000
Message-ID: <3b49b124-8535-4955-aaa5-efd62c583b3f@intel.com>
Date: Wed, 21 Feb 2024 10:21:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gsc: Handle GSCCS ER interrupt
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240125215543.3990593-1-daniele.ceraolospurio@intel.com>
 <800bf321453080d002525f6d880b1b912ea857b5.camel@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <800bf321453080d002525f6d880b1b912ea857b5.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:a03:331::11) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc6c824-29af-473f-79aa-08dc3309f24d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9vsH7jqIIAx9/GtTzAT+9sNwJ/5GAjgHBlXp6uZCcBsuloH2KgUQQ2B8eD8av4NOv3ujHIFDXEpk1oR6WbPPFwuE573besRZQ12TTsulmae54B9oOw5b/Ns7y3m1Vo9ruyDrcURbJNLQcEmsGDEe3GRYj0a1DPAi4KDn5y57aFtNMMmDGYghaKeGa1mDpn+a2uggyFe/vOOBZeeigLVFRGPt5nF4A1BaFvykC//smbwT0Djad5HRbJlqk4YYC8oJQ6DDFgG1CKf90EsTaDFlNYRezxNH70hY6LAJ2MPf0jF4ZLjVI0DzqcGX7fFuAZowZNvWLoQ+QfNybxk0GhLkle6SJ2jks09i4pFqyhogA51D2MmVXaxkT1nKkAIMa5SxuYmGSSB10H5SYlagoJs5ZEQXdjkukw9KhXzAlQGlmD80QDvdv0nE0LBCiXf8+IBYV9bOQ/Y8wJiuENNQQiAhw03x61VvVLXtzaMLMklP2WrbK061vUACbbQpxaJnTNbbLxJdxDsT0XAMsy43I0Q0RfpfP2j2vUy8M0vgJN4wAZqsjDGDcjdRvPUuU4qE2oy7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek5ZZ1J1bzdwaWhnVW91ZSt3Sko3WlR6eHlIZGl1czVzS1NncU9ZWlAyMGVS?=
 =?utf-8?B?M3ZsZnBhWXNhRFEvQkNDRlM0dzFHc1lDV3U0VjJ3RDREeWdMcW5GUTdZVlNS?=
 =?utf-8?B?Rk9oM1RaYzJ1cXgvTmw3OE1UTkRXdVdJc0NlNFNTUUVXTVpZcDREbVZ6UWcw?=
 =?utf-8?B?c29XdFlXcFJsblpUMUx0TVRGWWk3Zm41VWQvcHAvdFNUamtLMlNYaFhRak5v?=
 =?utf-8?B?ZkJuU3dlKyt3NnBTOUpJMlNKVm5scWFVUUw2WWZqY0dINWFiRjRGUlpMVDF6?=
 =?utf-8?B?SjdtL0xhNlhoRTk2ZFdyQSt3Vlh6bVFSbFZRL01YaHZaeE1sNk5iQk01ZUpa?=
 =?utf-8?B?amJxdWlyYWZ5dm41TE1yUHNmMGFOcWNFRFlYbVZ5R0pLSlREMmNuV3lCclV0?=
 =?utf-8?B?RG9VWk1UUXdHdFJPSGJMY2ljWkdHNVVwclIyNXlJS3ZrdFliQ1R2NWFBbzFz?=
 =?utf-8?B?dklDVEx6UjJQd21ERlQ4RUFXREF0TS9sMzdzdW9HZGVuMTF3c3dZK1dMZHlN?=
 =?utf-8?B?NGxHNG9HN0JJdlVqWHpYWXZyU1N0anV1YlZ3M1FkTHBLb1pxUjdJV29yZFNM?=
 =?utf-8?B?SCtsS1haYXVZVkEyc25uVE5UYVlEUU5FT2JCbmJVbk92T2lrT21TQnlwckdS?=
 =?utf-8?B?Z2loR3RWc0tZS29oNVJlc2pXaW1FOEsxVG1MQ2VkU0E3R2doMVB0WkhyNzBU?=
 =?utf-8?B?SWlFT3gxREZCYzhsbjRoVENPTy9KdExnZmswS093UVp3NGt2L05vKzAwY0M3?=
 =?utf-8?B?eDduenZDQzFSeFdBS3NSdFBULzA5bTdFdUdxdzRUN2RXY1RpcUduZVZOc0h6?=
 =?utf-8?B?OUhscE14cHFYc3pVZ01aZG1GRnFMWDBUai9SUFMzaVNudG5vbFF3MHE4ay9X?=
 =?utf-8?B?ZHVJVFBWc1hHSWQ1YnpPTGtxRzBkQ0hRYjlWT2Q1azBJMlF3V3hJYjJ4Y291?=
 =?utf-8?B?MUY2Zmk5a2VobEtZV1dXLzEvdzQ1WHVKOXBoSHFmSDFySXgxUU15ZTdERnZP?=
 =?utf-8?B?ZklEcVh0NkkrMDg5eWR2L2kycnF6VUd1REYvZDh0dXZwaEUrQ0U3S3Fxd3c3?=
 =?utf-8?B?YlNNUkFrTS9nK2dGWEQyaUoxM1JlcWZBVXQwcENqdDJKSkMybDdDV1BKVTB0?=
 =?utf-8?B?c2FkVnd5OWtxd0JmTVp0UXZ6KzR0M1JaM2lLNWNPUDZVSWZSN0Y2RjJSVFhi?=
 =?utf-8?B?NjQ0cGZwN2VmOGk4VGxNUXNSR3llcmxpeHVCOWhkdWNKWU0yR1V1MUFuWnBH?=
 =?utf-8?B?dlhuRm8xMkRWWm1JTzNMT2tzUDZvamxyS2ZUNHBaR01EbXlYZTlSWU42aU9W?=
 =?utf-8?B?OWp5djlMbkRVa2RlUER6YWl5dUdiajZpVFNSL0xTaDkwaE5SV3pvelRTVGs3?=
 =?utf-8?B?RFA1OGdVZ1dqS0ppZ3A4YTVxb2orMGVlU0U3ekU5MHF2anpEV3B4cHFKbGpt?=
 =?utf-8?B?V2xzSGRQemwvM3R6ODg1THZwVWVzS1dDR0pGVlFKQUdJUDdQSzlMTDNBZkNm?=
 =?utf-8?B?MDBUc2FRazBnTlhsYTh4V1dyT3RlbUQvQXYramdmMmIySXNSSkZCamdCRzRR?=
 =?utf-8?B?K2pFRlVZamV3WlVhRU51KzNVRXBKY2JTQ2x3elY0ekNYVHhabDhQaHZjYS93?=
 =?utf-8?B?TXl4R05rWWxheWw5blVISjlpUVFMTFFwUi91Z0tPdURSMFNwRlVWZ2VEbDBW?=
 =?utf-8?B?c3cvL2l3SmUxLzNIU0pvZGhuR1hYS3A0Q05RMkVpWk1NVnd6cmtCWnQrTlRL?=
 =?utf-8?B?VGlZNnY5STBEekh6ZlR6Z2RFZUROT29rb0JyQmxFQVpieHlPNkNUZ1dENWxM?=
 =?utf-8?B?dXBiMWYzbVFPeTZQMStSQ0RYcTZQam9uczlLTTdBcnlmYkEvQkVrUHlzSXo5?=
 =?utf-8?B?dzFnQWpJMTBRWWR4ZitYbXRGOW13Rm5WRFFpY01TREhLcnVaNUlwbG51dlZY?=
 =?utf-8?B?ZHpnWGJ6NjNiV3lEcVppMXZDVUxsN25tVGN5OWJWSzVsM1RmMURrRTNpMjF2?=
 =?utf-8?B?SW9wY2M4b0NUZWd5REJRWjlEYUFTVmlxN0R6THRCTU8rUXRmZ2Qwc3ZWb2ph?=
 =?utf-8?B?OThqdmRWYm1NQnpNOGhlbGNDZkI2TDVvVEJqU1VqRE5naWUwREpqRDlOckpW?=
 =?utf-8?B?aFJnclllQWFOUk1teVRqNkRuTlVqTFloclFtWUoxamlMYTBIeHVCNzVoN01L?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc6c824-29af-473f-79aa-08dc3309f24d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 18:21:39.4214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTmW5Ixgg+pwu/3Jg4OZm078fEcd9JV7VumgYUyEfPmQSxqs3j5pyJGGcwSnZllau+5qbTi2rhLRgDMdRjuCT9NF1srXaCzyLH5u7beyJ0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6727
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

just realized I hadn't replied to this. Sorry for the late reply!
Answers below.

On 2/9/2024 10:36 AM, Teres Alexis, Alan Previn wrote:
> On Thu, 2024-01-25 at 13:55 -0800, Daniele Ceraolo Spurio wrote:
>> Starting on Xe2, the GSCCS engine reset is a 2-step process. When the
>> driver or the GuC hit the GDRST register, the CS is immediately reset
> alan: minor nit %s/hit/hits
>
>> and a success is reported, but the GSC shim keeps resetting in the
> alan: minor nit %s/keeps resetting/continues the reset
>> background. While the shim reset is ongoing, the CS is able to accept
>> new context submission, but any commands that require the shim will
>> be stalled until the reset is completed. This means that we can keep
>> submitting to the GSCCS as long as we make sure that the preemption
>> timeout is big enough to cover any delay introduced by the reset
>> (which it already is).
> alan: as per offline conversation, we believe that reserved engines
> like GSC isnt effected by sysfs knobs to change engine preemption
> tmeouts. However, in the event a system integrator decides to play
> around with the default preemption timeout CONFIG, then perhaps we
> should add some kind of build or runtime warning like this in
> hw_engine_init? :
>
> if (hwe->class == XE_ENGINE_CLASS_OTHER &&
>      CONFIG_DRM_XE_PREEMPT_TIMEOUT> [that-shim-timeout])
> 	drm_warn(blah..)

ok

> alan:snip
>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index cd27480f6486..4acc8f3d646c 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>   b/drivers/gpu/drm/xe/xe_gsc.c
>> index 0b90fd9ef63a..42dd61a197cb 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> @@ -25,6 +25,7 @@
>>   #include "xe_wa.h"
>>   #include "instructions/xe_gsc_commands.h"
>>   #include "regs/xe_gsc_regs.h"
>> +#include "regs/xe_gt_regs.h"
>>   
>>   static struct xe_gt *
>>   gsc_to_gt(struct xe_gsc *gsc)
>> @@ -271,6 +272,44 @@ static int gsc_upload_and_init(struct xe_gsc
>> *gsc)
>>          return 0;
>>   }
>>   
>> +static int gsc_er_complete(struct xe_gt *gt)
>> +{
> alan:snip
>> +       if (er_status == GSCI_TIMER_STATUS_TIMER_EXPIRED) {
>> +               /*
>> +                * XXX: we should trigger an FLR here, but we don't
>> have support
>> +                * for that yet.
>> +                */
>> +               xe_gt_err(gt, "GSC ER timed out!\n");
> alan: in a case like this, GSC is basically dead right? (i.e. until we
> support driver-flr). Wonder if should mark fw status as
> XE_UC_FIRMWARE_LOAD_FAIL with a comment "eventually we can replace this
> with a trigger to perform driver flr when that becomes available"

Changing the FW status wouldn't do anything, because after the load is 
complete the driver works off the values reported in the registers. As 
far as I understand those gets cleared when the reset fails, so PXP and 
HDCP should automatically be stopped that way.

>
>> +               return -EIO;
>> +       }
>> +
> alan: do you think we should add a drm_dbg here if er_status is some
> other unexpected value like "GSCI_TIMER_STATUS_RESET_IN_PROGRESS"?

No, GSCI_TIMER_STATUS_RESET_IN_PROGRESS is a valid case if you get 2 
resets back to back and the other are either the failure or the ok values.

Daniele

>> +       return 0;
>> +}
>> +
>>   static void gsc_work(struct work_struct *work)
>>
> alan:snip
>
>>   int xe_gsc_init(struct xe_gsc *gsc)
>>   {
>>          struct xe_gt *gt = gsc_to_gt(gsc);
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.h
>> b/drivers/gpu/drm/xe/xe_gsc.h
>> index c6fb32e3fd79..dd16e9b8b894 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.h
>> +++ b/drivers/gpu/drm/xe/xe_gsc.h
>> @@ -9,12 +9,14 @@
>>   #include "xe_gsc_types.h"
>>   
>>   struct xe_gt;
>> +struct xe_hw_engine;
>>   
>>   int xe_gsc_init(struct xe_gsc *gsc);
>>   int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
>>   void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
>>   void xe_gsc_load_start(struct xe_gsc *gsc);
>>   void xe_gsc_remove(struct xe_gsc *gsc);
>> +void xe_gsc_hwe_irq_handler(struct xe_hw_engine *hwe, u16 intr_vec);
>>   
>>   void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep);
>>   
> alan:snip

