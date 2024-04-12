Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2F6C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 15:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD3C10F6C1;
	Fri, 12 Apr 2024 15:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ClerQRPy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F9810F6C1
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 15:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712934536; x=1744470536;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yar7cXVK+QYsfrKCKZnZKQdARxskU9ZDGIJ9WzeFBDM=;
 b=ClerQRPyhpUSwYys0VsFngKEUvW1gKW2mcn65tlLFUYXuNPiplgFbpWc
 dmdD7maAKgD9n7BxuabAuRY/wndsMOitnIDh/DWWXDLhR9XJQWl1uqDYg
 fjvDRhF1Ed1EXWn3vsCOa00u86mQzIu+UlWXiAoKdD3srAhmjy7hlw3O6
 M2FP6XK2hT/ZgCJFwJHnWvN2wL1UQeFVYwBDXMXhG+bOVPm2Zag3mMS2d
 yxsPgwWFsiMk2rOfi4D/A0Yssk+LAJQKzgp6PLucE13Vf5In5G2D2rKHV
 yvcpOi189JJgzEfQCOitA5on/9NBV2B662bgjVZpzSF1srInprzMiujIL Q==;
X-CSE-ConnectionGUID: 2COxy79iT8elTdAYmHar5w==
X-CSE-MsgGUID: +Lujqn/YSpSR4QhXiEG9qw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8499100"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8499100"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 08:08:56 -0700
X-CSE-ConnectionGUID: LOS/VFiSRfmsWIDFJudadQ==
X-CSE-MsgGUID: rDvvDS/qST2JSauau5ttqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="44518550"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 08:08:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 08:08:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 08:08:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 08:08:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n00R5phTWN8jxnoFMK3aJpBtSJp+Gq+zWOgDpNTOTgnhCKndi+ghjkI2EUEhINzL4QDsGcq6ki7DIfu9/iOH+Oi3n4bPa8YWPqaRhtRCHHkclx05uA4imdqZbDlTg23boidnGfPiGHsYUBfLLwpymCLHuk6SLBv3c9MPIibImC0wbmKQ5Efqnrg3AnMLAqAuHphy4o+5a29+xWhIUbn4fVT2Vv/Fk19S/aTuDwL5rdvZqOsDmXIH84X2cLcinoiDxtKHz/0dUUspo1DMhRvxA27rurgNyymq5vbjQJUZ/VdURm1dV0xvVGAbFwP9WrJtP7b5qFslRtDclEP2s9PzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54ngvC3Ejvan7dYdyVZpvpDT7UMxdKSdcd+xI0jzhfU=;
 b=fP6evhUzbK8ohsRZCx/84SGnpNq/oqNUp/eiJpIt0UyEDu9vKA5JZr6aMZGceNnyuoxvAJKGy7qwhUyxiUCAKzGm7/x8YKzjMzCfQ9EdtyXbtiUCSnxCr3Jb36rK4sh2IPZedLt+ufwkI5UL0cvb1xb6i0m03l/9rmpjaer7YpTwAynoBYQCWogmM9N1gIQ2UtB/EBzhVSPHSu+c7uoP/uvqQszkHmMEPxNcAwTMFjdIeg57SZJqG4+VG//BQN5z0yH7farX+Rh2yqUWoAU3z1KsUO1CWBN6+34zmouixCgNruIUNsTfJE5I/Cc3KTHNUP8Re2R/jg1TA7vsNSJi/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Fri, 12 Apr 2024 15:08:51 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 15:08:51 +0000
Message-ID: <f51d839a-3245-4665-9ead-379b385bf278@intel.com>
Date: Fri, 12 Apr 2024 17:08:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use drm_sched_priority enum instead of 0
To: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240412113426.12518-1-nirmoy.das@intel.com>
 <319c54d5-7652-4328-b9fa-d7c808881ca7@linux.intel.com>
 <8e7025c2-033b-4be0-a32e-f97aed327430@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <8e7025c2-033b-4be0-a32e-f97aed327430@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0039.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::13) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|DS0PR11MB6519:EE_
X-MS-Office365-Filtering-Correlation-Id: c4034d73-9249-478f-6a98-08dc5b027609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2D4jUe3MfxCjpKuep+9Pd9yYbBP6SlFDZoeOShdbwXOPOfyUL77u5ob8fltaU1QhqsRguXvZ2G45cTY1SPeAGETA7EhUhUgnxUQ3ZA4gdBne09mDj07t8sy3sm5mEJkhjuGlFhaRNqTxqcFJoccVjVU67sz018YpPz0x/znGwiB3yH9WMwesGpC1Eu5Iby99vR4SnYeFBwPFgAO/lrwGzRNYddCap2pXNRiiZkoJbSM7nkxswTpMSqKIsMLZ1h5DnAPBbEYhSr/Y4XeQEnoBotvLRrT1sTQ5/1LHR8i1FZdfF6Yl2SAwJqK/jXCPHiJAocyM2TvCCBnCfkQ16YBzoifNEkqIb7fe1+HdiC5+rVl4nYIgJCgBPKWy24cAa/TJCkT0T/ytdzLNEsJoGpeoOsM6TL+0guz1fMoxEZ5kDPTXLGH9dDEJAUgOIvAusL6cr1S3r024On9FJJ1sySsTpX41PjMgv5PDtM67JFRrUpv6wgJeObaY8/K704df/22BruNTrdXvzusH2+EolibnqyHbMl8bhi//JoeZgmFZpzDXkDeuzmdVE1x0vEL1A0KatyhuPLr84ALzMjRggsWRfP6Zjpbj3ptlOQaPdUKk9YIHoDPWFcNHyoTsjY4GuV8z9m2ssY+xPDGpEJCreO9YO74wC/TKUos4XvfZkxE8pok=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0ZycGFIOEFLc2VqSXhXQVlCaDNDRVRhTUVYT0REdWwyV0RkM2h4SERRNFpP?=
 =?utf-8?B?eTQ0ZEs0aTFicUVYblZlbTl6WWhiRWJhWklDV1ZtRjBtdllzU0ZSTUFlakcr?=
 =?utf-8?B?MStMNGR4RHgrZlpab3V4ejFhZmw3QWtvNis3UEwvVi9Lc3loSFdCMzl1N3lT?=
 =?utf-8?B?TitoT3p6NXBDU3dncVoreGJwT2tZUWhUcTJjR3pmNUpXMW1WRDdTMnZwOCt5?=
 =?utf-8?B?WVpNMmxoSHd1bGhZbWlTaU43SWhQTXlGN2RCcTZvSVY5aWpwM01UNW90Z3ZE?=
 =?utf-8?B?N2RSWmY3ZVlMUWxGSjNvS1ltenIxSEM2MGlnYnZZRndnRnNGeGJMOW5vVHQx?=
 =?utf-8?B?RjdaaFJ3bVp3eU9xNFNTano1VmRhYVk2eTU1cjk3WStRNXdiUG1ML1VZamd1?=
 =?utf-8?B?cUZsK3dMNHVqZXBrMEhtTlZVWldPYTJlNW9kYllhdDNEU0kwSWl1dTdPa01X?=
 =?utf-8?B?TUExczloYUlyV0FvQkhVVmVtVXJnQkhDNE5IM1FVeWYvVjRPaFZpNHdaTk9H?=
 =?utf-8?B?MDVTNXUwRE9XeUlQUU9WOXhndHkyS0twQzlFTVdJNGVWYjV6ZWZKa25maEZ4?=
 =?utf-8?B?RFZJMXM0VkZDdkZVemk2Sld3Nll4OEpFQ2NHMFpvMzJydEdIUXVQQjRlOXFJ?=
 =?utf-8?B?TGFzQ2k3Wm4zMHQvY1krZDVXOWlySm1rUVpRQ1JHZE84K25rYmIrL1FWQVJl?=
 =?utf-8?B?RHdZUmd1QnZZSG54VUV2R2M5OUpBMGowU1U5RzJWN01LZnU2ZS94OEtJVnI2?=
 =?utf-8?B?S1l6NUZpckhZZTV4dWFYQTVKc1N2MGJiQ1Z0bFRVWXdNdExTeHZpSkRGS0cw?=
 =?utf-8?B?LzdmU0NiWndISy9QRkVvb0I2TE1NMzdvSzY5YmVTRFNnclVIYjZiNlJrbEhL?=
 =?utf-8?B?VGZFdlRSMHoyZ055UmlPR2V4TU5GWWs1WWx3VWVhd3VUSkJNZExxTnRXSDVS?=
 =?utf-8?B?ZDZzVmtwaUtlMnZUaWpOQ3YyUTUrdHNZeFRRMmZOSytKY0x5d2JnNGVPbDMw?=
 =?utf-8?B?bjFydVpJekNydHJkNU9PTzBhR1VuZElMcXh5Ymt5YzM3cStCTllUeUkyU1Mx?=
 =?utf-8?B?RU1rdVdxNmtISGkyVzZydWJnbDZ4UUVVUGNXT3VHeitwWkd2OXZ4OWg1Rlp0?=
 =?utf-8?B?T0RyRzE3U3dQczA0TGdyelI4M0MrbmNBWDlQUkpPaDZGMkVGZUdTYWZWa09Z?=
 =?utf-8?B?YWFjekZpZ1ZuRjdpV3FJVVdEeC9MamdERlJCZytEYStzZWhWVzEyM3JEd1hV?=
 =?utf-8?B?WUNiOW44WTBsbVJ1OHNTS3I0Wkt2THUwOHNTazhscWp3TWZxdmU4TlJJdUo5?=
 =?utf-8?B?cHZGeGRRZHVxaDYyVFh0UWRTVHpUelVxcDdoclgxakRVRUg4OUUwSkVQUW5o?=
 =?utf-8?B?blJXUkR3QVJQTXkxQThBdzJrZDJPUUEwaExwZG5KZ1h1bDd6MTBoRURacnpI?=
 =?utf-8?B?ZTUwTW5BS0VrK3BMQ2Z2N3UrR0VnOTkxbjJBQThGZnVXV25Hb2E1Tm5ldDBB?=
 =?utf-8?B?VXplY0JuRXErbXErSTlWcTVTVlBvbExzSktXYk1ka212d2p6N2ZOWEk3WWhH?=
 =?utf-8?B?TjdWd2ZNZzdmWUF2ODBlTUoxRzFtR2dEMVBjckhUYVMyOFlyM2ZRdmJlTzZK?=
 =?utf-8?B?eUFjMDJnU0o4UzBRUUlQcEJWeVpQL3FiaG5Femt6dEN5a2NQSk5wTDdxOTdZ?=
 =?utf-8?B?T1lvZTBSMlRnM1FibU1GeUswbmxHN0R0VENnaWJWVTBSYTF4S3JTNGVPdVVr?=
 =?utf-8?B?K3l4N1RhcFZ0b0lJTGN2MzkyYVVPNHNPc0JSejZKRlRycjE1TjlpTmJsb3Vs?=
 =?utf-8?B?Vmp4QnhSYnFnMXkzN25kbnpxZXRET0RVR0E4MW1oSFZYU2prQzdNNGFFT3BK?=
 =?utf-8?B?dVE1R1NrRmdnbDdxUWhTRGJlSzN4cmFSL3N6ZXM5VXlnUVFOZFFlM3k5TW02?=
 =?utf-8?B?dDlTTFhmU2JSSUo2dEpGd0ZaeURCZ2VsUFJ2VnA1eHB1RmhOWmIwNWlhQUha?=
 =?utf-8?B?TTlMdytzQjZpNHpRZGJVTTlzZjN0cFZCTEF4RXg3Vkthei9LcWZTU1l2QnFq?=
 =?utf-8?B?dWFDcjh1Mlp2KzVaYVZia1NZSThteVJWc212ZGxzQXF3VEpQeW90T3JESzJQ?=
 =?utf-8?Q?jdq01zIE4fP8GUgtA2I6syALd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4034d73-9249-478f-6a98-08dc5b027609
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 15:08:51.0659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaJAU/Ytzce6ja7TkSULNm0Gv3UMjCx5suPkHIFb2naulsqIIRchhxwxEYcY8uyOMYg8AUgS8yCKhve+6I9x4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6519
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


On 4/12/2024 2:48 PM, Matthew Auld wrote:
> On 12/04/2024 13:03, Nirmoy Das wrote:
>> Hi Matt,
>>
>>
>> Shouldn't this be DRM_SCHED_PRIORITY_NORMAL ?
>
> Looks like this was already sent: 
> https://lore.kernel.org/intel-xe/ZgJhpTlz6OfqiaQg@DUT025-TGLU.fm.intel.com/
Ah I missed it. This need to be documented so someone else doesn't 
stumble upon again.
>
>>
>> Regards,
>>
>> Nirmoy
>>
>> On 4/12/2024 1:34 PM, Nirmoy Das wrote:
>>> Use enum drm_sched_priority, DRM_SCHED_PRIORITY_KERNEL
>>> instead of 0.
>>>
>>> Cc: Matthew Auld<matthew.auld@intel.com>
>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_execlist.c      | 3 ++-
>>>   drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 +-
>>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c 
>>> b/drivers/gpu/drm/xe/xe_execlist.c
>>> index dece2785933c..a8c83b36289f 100644
>>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>>> @@ -341,7 +341,8 @@ static int execlist_exec_queue_init(struct 
>>> xe_exec_queue *q)
>>>           goto err_free;
>>>         sched = &exl->sched;
>>> -    err = drm_sched_entity_init(&exl->entity, 0, &sched, 1, NULL);
>>> +    err = drm_sched_entity_init(&exl->entity, 
>>> DRM_SCHED_PRIORITY_KERNEL,
>>> +                    &sched, 1, NULL);
>>>       if (err)
>>>           goto err_sched;
>>>   diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h 
>>> b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>>> index 10c6bb9c9386..1f712f4fc76a 100644
>>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>>> @@ -63,7 +63,7 @@ static inline int
>>>   xe_sched_entity_init(struct xe_sched_entity *entity,
>>>                struct xe_gpu_scheduler *sched)
>>>   {
>>> -    return drm_sched_entity_init(entity, 0,
>>> +    return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_KERNEL,
>>>                        (struct drm_gpu_scheduler **)&sched,
>>>                        1, NULL);
>>>   }
