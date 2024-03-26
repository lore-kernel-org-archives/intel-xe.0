Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FA4C54E58
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 05:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC6710EC9D;
	Tue, 26 Mar 2024 05:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bX4XGaq/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE4E10EC9D
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 05:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711430199; x=1742966199;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CkKXDZ2WRLI/i6RzO80xdB9OUCNU4Phdbm83MigjLvw=;
 b=bX4XGaq//g0gVnqpzjc5LrcI92B3ZoPTXkC2lhpL9OPwC4qojr1sUL+M
 PPaNjhRd8M+17uTe5AJmWvLUXYL0datM/oJNvmQYdVZARQ9LfIae9quCa
 QN0ux6vplFZfxCIs1YE2KbVczZ8279dUeuiUZyM0fbaD8kw60aiSRPTZh
 b5NONsBoteywR04Z7t4rcRhshgLpctrLkDZqixHUxoq7tgCz8zfS2cQ79
 kO//E4/xEW8ZDtGFedm8sqJlvMQulI3vUiZulcuKr36QvXDKNX4fJ1jIm
 sGT3WSGshAZOxirjtVkR+X9Z2IzUUma+HOYA0NXcCLwL698WlQ/mcPSCq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10242560"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="10242560"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 22:16:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="16239290"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 22:16:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 22:16:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 22:16:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 22:16:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcEWSYMm3xOWdL3dYBQtLdcCp3zmIpim/elqu2VSUOSu9q8buHH7e0SIXHbsZBeheF+OtVKifEhIEVSW/8b2dDcG4OgSvOR8D5rmnm+OE6kThNocvoBZfJ/Cf81gbch3K45lrouCSWSm7NYktOa6q/s9qn6YjPqx1WKnoDeuq6ojfHQmx9bweH+th37m3Wjfdhb8tsmjt8WNzL2/GtxUD3BjTCZQ8l05KtKXf5ZUp9aAPGuw7cHW7WEUWlGxctaI7lpgr7VNJKeOdROWqvu5ziqZcZuqWLp9z4cZAjn3JwNHrF1aaxWto9zTFlkLdKfp0oJnypgbdX78mn1TNzX1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbhL7cNgqgbjS8d3zLnsOdY7RidEuUJvytvADWdqlx8=;
 b=X5UcRWfN0ou5mXWPMy9Zw2OXEX0lTD90ALJ9l6OwBlq/TvVbCngssIE8jEMaO/4zenYmBu79OcavuFEw77LAF+z0PUq6xWh+L+DeAHf/VGK3DicEfxOwLvXveB+ztGEmMg3gc/ZGpixKfALqibASt3xaoXnO1ikvmSZ/iEA+KVhMNBwKxkWEOsTrkjzuIZOug8YXMqljO765Lo8CGrlyPgwEaX4ZryNHvbt7h7M8AZk6c0Pbk8XvQupbaNBCz+6d6ZCG8wjMkBz3Qb5Y+0FrrkuEsxOjPcFPkH7xmqu3+q9D7T6COcoeP1V4Ei8pWNxzeX/lw93pVgWbiqJYXu6Hew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY5PR11MB6140.namprd11.prod.outlook.com (2603:10b6:930:28::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.32; Tue, 26 Mar 2024 05:16:36 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5%4]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 05:16:34 +0000
Message-ID: <49419c17-02da-403b-879c-9bcfa0565993@intel.com>
Date: Tue, 26 Mar 2024 10:46:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] RFC drm/xe: add fault injection for lmem init check
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <lucas.demarchi@intel.com>,
 <himal.prasad.ghimiray@intel.com>
References: <20240315100530.3051944-1-riana.tauro@intel.com>
 <20240315100530.3051944-4-riana.tauro@intel.com> <Zfiu8C6FJGA3xezD@intel.com>
 <d214b05e-2107-4ee5-9b4d-ebfb5b7dd0f0@intel.com> <ZfmjTgCTsppFxe6j@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZfmjTgCTsppFxe6j@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0157.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::27) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY5PR11MB6140:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KUbpSA8QMq0FWGECtuoz2n8zZnT55xc/SBRYjtzbUlUB6yAnfrlQchnYtokLqtAea6Gx6KUMcbZB1YsEJr4/rkgk15zypCMPeGR1Bbwhl/cu9yMsCmuAPlXaDMduFeas0FFaohYEe6L+8yDyDQEd23F35238PF5GivLAR9pxGKmwWo5enan7mfXAuU9sPksGbDSBR8+lTkEfRnX7EvIvf1yj24tfqFSNHQc6HK4UjmPnjxeOmeBuhJPJsjBKHqhOdY86UpMKd7RjQqxOI3KLXK1HPiVk/3ycs1k72BcqaUPGShCuuztVo8HVdd8LWBPGYruGtxcGWR/s/BXu69PYwiuh4KhfhE+H3eIC45ZDTA8BGoSflPEE29coAi2KBjULEDX62VzdRXOKxsNwEdkG+SfbxAhr0Yq+Yg8Q5OTflyrVvgbYR+JxRjVTqk2cTlupyZolGxJq36oOgpiz/GjJI1NSI+99FIm5OGyu7kk8VNw+IRrPX910Nsjit0tdf0VIwqa51aBrW05F/7h2xYDD0n8lols4vpnrq/dWuBY0D+4rVv5C+/DdjvXLfmku0H0c1BR5PVi0Uq+nI2ECcudWtmm6fjt0lFzfv3x91YPkb+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU1qMnZ0ZU01SFluMW5FOUNTbzJVY2JkSnVxZGFyMUxWUVJTT2Uxc3dOUU5H?=
 =?utf-8?B?ZlVua1BCbzZ0dk4yZWhycW1Wdzk5eHBzcFZrdG5sN2hCQVFJbVdzOGlHT3hn?=
 =?utf-8?B?cVY4M2xLaFNzbXFBZEthNVlHc1VEcTVFdlJpbUNhQlV4NC9xVW04bU40RW93?=
 =?utf-8?B?cTFHTzlBZUt0WldLdUFjaHVGZzdNdHpSUmZaWkVqMXlFWUdFTlhka3YvMWth?=
 =?utf-8?B?OWE0UzFKcWNHRitWQk52ZFZ4RDdGT3IwK3NCa1BrK1B1cTNxTTdmcmJYOGw4?=
 =?utf-8?B?T2puUjFrMkJidk9BSkVGbmdadkFoVUxhc2FhTk1jaUVFcTV1cktzRlN0b2Jw?=
 =?utf-8?B?UDJQeVpIaVRmdmNuajV6NmZ6V0pXMDQwUXNndmdiZXVsKy9xM2VXOE5FYVVv?=
 =?utf-8?B?VTAzdlcrY3NKV05zaGM0S3pLZG0zMWluVkRiVmJtRCtxQndsOS9WNGRvRHpZ?=
 =?utf-8?B?TytqTU16dXZBZjNhYnVtZi9za3p4UkNla3pCVDI0UVVTeTNEVUpTZjE1TjRP?=
 =?utf-8?B?a0NjTDgrYjRpeWw0c3VMa281R2x2V2luUHNoWkNVTGI0aHFxTm9IUCtweEhP?=
 =?utf-8?B?UWszeHYwRjdZODV5b2Zwbk9nd0NWc1VuY0dQbVBoQVg0aW53S0FmNHNsK25s?=
 =?utf-8?B?N1ltVGtySEw3am5FQUZMNlRkR0lOUGlpZ3Fmb3h4LzRhZHh5eTY1NjhNY3By?=
 =?utf-8?B?SGY3VWZ1dkY4dFgwbGtCQktKOHRUVmFLb0JMQjVNaCtReWhtc1k3YXBpOElw?=
 =?utf-8?B?a0hZTmJkeGR2T0RMMlJJbGRlSTl3YVhoNzBJcFROWEZ2Yk5uWnFleTlXanhC?=
 =?utf-8?B?U09NVkJxVUNnaVBMR0E5d0VWUGtrRDhIek90RzZXMWE3aUVmTzFlMUN5dEI5?=
 =?utf-8?B?RDRnOVkrRlN4TS9sdDRYSWlzSzU1RFhnVW1lUDhWV0lRRVpuLy9CbzRwTU5F?=
 =?utf-8?B?aXFSTW5nVFVEaDVYVWJYQ2htMmtjMWxZVjlKcTRManphYUYram1KbTh4NzBU?=
 =?utf-8?B?MGFBbkc1alNRa2Y1UXJqaHMrYmdERkthM0JwTzNzUG9mZVpzbWtSbU55SU4y?=
 =?utf-8?B?UTZZTnpHSU9aL2I4Y2JJWnJZQ2JoT2hnR2s2dlIrcGI3dUI1ajIyclY5cHg5?=
 =?utf-8?B?TGg2R1JqYnVZSW5yeHA3WUdRZlVwWVFDU2kxWFFGM0FrVmZ6cE9MNnJLckYr?=
 =?utf-8?B?Qm11bGgvcktsQVRHR092UDgvdTBYemMvdUp0RGlzTEFIR2lBSVJldWFPb29k?=
 =?utf-8?B?SDRXVFhJVWtjYUhhQlNEN2NMMWRQbXFtbGFhS3RBelFlQk5naWJUVHFpZVdH?=
 =?utf-8?B?SGZySWZvZXNseFRpdXFJV09wMW95VDYrWGtOVmRvMDBtczFMeTdPNSsrRjk5?=
 =?utf-8?B?TnZFdmgvcjFWMjlCbVJvSEV6R1U0SlNkY0NtRjJrUEoxc2poK1FtSVNpQjNR?=
 =?utf-8?B?OTBXcnJrRTdwUGpJUWhaTXRzeDFLMldPVGVRWHozOTU1Zk8wcVNOQS83LzNX?=
 =?utf-8?B?ZEdtYXI0YkNQRDFDWGxXT2pSZ0J5RDg2T0szZmloRnhOZHJVeHZLWEFDVUtY?=
 =?utf-8?B?dVFSVFBZRFQycnRXT3N3V0ZzekRicEowM1daZFZnb2YzYVoydjREQjZDWFkz?=
 =?utf-8?B?T1dFQ01FZHo0U25IN2lxbUV5Z21pYXdhd05ZT2habEYyOW5iVmZyNWs5aHdB?=
 =?utf-8?B?ZTlDTDJXYTV0b1JBaDVsWmJXSE15em5lUWlxTVVpTFlHMlZ4d3E1ZWh4QzI2?=
 =?utf-8?B?OXMzc0RHbmFLL2FRcDRqNCtPakhrZ2JHS0QvSmN4K0ZQeE43NWxJUGU0cGZh?=
 =?utf-8?B?cG9TaHVucWk0YjlDcisyZW94eDNPM1VLQnJXcHFTYlc4MURIdzhHMXNpY1du?=
 =?utf-8?B?a3dialR2Szk3ZGpyWnRZZDJUU0YweVV6UXpTSFJZeGR0SkZJWHUzVFdBam1J?=
 =?utf-8?B?bk5veWhjazlUam13bnlkVis1akxFOEkxb1o3eEs1MzlwNTlZUStud3V4Q0RU?=
 =?utf-8?B?SDE0dHdCekZpOVdJZGFoWnR0VDgzYjFTRVJjenE2YmVsUldWNy9kbVJ5VVhD?=
 =?utf-8?B?alNwajZQK1pseXdNNVRVWVRJc0RUZlJBcjFzcVZ0RXFGNFZGWjJOM2t2djFG?=
 =?utf-8?Q?NRzLotwDcWekR6y1bnPVksaY+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5d6fa9-c412-440e-66a4-08dc4d53e7a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 05:16:34.7272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTgfI6qeNfyqVIu4wcHWU7I3YH4+imQes/GDm/dJcJN6mkf2B63bg7lzpbxBmRv8OVL/e1zPKfV4ZkwdyDATVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6140
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

Hi Rodrigo

On 3/19/2024 8:08 PM, Rodrigo Vivi wrote:
> On Tue, Mar 19, 2024 at 10:16:47AM +0530, Riana Tauro wrote:
>> Hi Rodrigo
>>
>> On 3/19/2024 2:45 AM, Rodrigo Vivi wrote:
>>> On Fri, Mar 15, 2024 at 03:35:30PM +0530, Riana Tauro wrote:
>>>> add a boot time fault injection for lmem init check.
>>>> This can be triggered by adding a modparam fail_lmem_init
>>>>
>>>> xe.fail_lmem_init=<interval>,<probability>,<space>,<times>
>>>
>>> Please let's avoid module parameters as much as we can.
>>>
>>> Let's use the CONFIG_FAULT_INJECTION_DEBUG_FS
>>> similarly to
>>>
>>> fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_f\
>>> ailure);
>>>
>> lmem init check is done during early probe. We cannot set debugfs before
>> probe completes. So i added the module parameter.
> 
> doh! indeed! sorry about that.
> 
>>
>> I can try to set static values before injecting fault if module param is not
>> needed.
>>
>> lmem_init_fail.times = 1;
>> lmem_init_fail.probability = 100;
> 
> no, let's go with the module parameter. It would be good if we could have
> something per-device, but there's no way to pass argument to the bind/probe
> operation...
> 
> hmm, unless if we also require the pci id as the input to the param.
> The bad part would be that we need to parse the str, then make another
> string for the setup_fault_attr().
> 
Since this will be used only in igt, would we need per-device?
> also I agree with Himal, an igt case is important here.

Sure will float an igt patch for this.

Thanks,
Riana
> 
> Thanks,
> Rodrigo.
> 
>>
>> Thanks
>> Riana
>>> And then use it like this:
>>>
>>> https://lore.kernel.org/all/20240315010843.194335-1-rodrigo.vivi@intel.com/
>>>
>>>>
>>>> Adding this causes the lmem init check to fail causing
>>>> the probe to defer.
>>>>
>>>> v2: add fault injection (Lucas)
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_device.c | 21 +++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_module.c |  5 +++++
>>>>    drivers/gpu/drm/xe/xe_module.h |  3 +++
>>>>    3 files changed, 29 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>> index 50473329cce7..393610e95bd1 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -51,6 +51,10 @@ struct lockdep_map xe_device_mem_access_lockdep_map = {
>>>>    };
>>>>    #endif
>>>> +#ifdef CONFIG_FAULT_INJECTION
>>>> +DECLARE_FAULT_ATTR(lmem_init_fail);
>>>> +#endif
>>>> +
>>>>    static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>>>    {
>>>>    	struct xe_device *xe = to_xe_device(dev);
>>>> @@ -431,6 +435,23 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>>>>    	if (IS_SRIOV_VF(xe))
>>>>    		return 0;
>>>> +#ifdef CONFIG_FAULT_INJECTION
>>>> +	/*
>>>> +	 * use fault injection to cause a lmem init failure to validate
>>>> +	 * deferred probe. Set the verbose to 0 to  avoid dump stack
>>>> +	 */
>>>> +	if (xe_modparam.fail_lmem_init) {
>>>> +		setup_fault_attr(&lmem_init_fail, xe_modparam.fail_lmem_init);
>>>> +		lmem_init_fail.verbose = 0;
>>>> +		if (should_fail(&lmem_init_fail, 1)) {
>>>> +			/* add delay to reduce the number of deferred probe attempts */
>>>> +			msleep(500);
>>>> +			drm_dbg(&xe->drm, "Fault Injection lmem init failure\n");
>>>> +			return -EPROBE_DEFER;
>>>> +		}
>>>> +	}
>>>> +#endif
>>>> +
>>>>    	if (verify_lmem_ready(gt))
>>>>    		return 0;
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>>>> index 110b69864656..c4efbab430a7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>>> @@ -48,6 +48,11 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>>>>    MODULE_PARM_DESC(force_probe,
>>>>    		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>>>> +#ifdef CONFIG_FAULT_INJECTION
>>>> +module_param_named_unsafe(fail_lmem_init, xe_modparam.fail_lmem_init, charp, 0400);
>>>> +MODULE_PARM_DESC(fail_lmem_init, "Fault injection. fail_lmem_init=<interval>,<probability>,<space>,<times>");
>>>> +#endif
>>>> +
>>>>    struct init_funcs {
>>>>    	int (*init)(void);
>>>>    	void (*exit)(void);
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>>>> index 88ef0e8b2bfd..ccbeacbc3efb 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.h
>>>> +++ b/drivers/gpu/drm/xe/xe_module.h
>>>> @@ -18,6 +18,9 @@ struct xe_modparam {
>>>>    	char *huc_firmware_path;
>>>>    	char *gsc_firmware_path;
>>>>    	char *force_probe;
>>>> +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
>>>> +	char *fail_lmem_init;
>>>> +#endif /* CONFIG_FAULT_INJECTION */
>>>>    };
>>>>    extern struct xe_modparam xe_modparam;
>>>> -- 
>>>> 2.40.0
>>>>
