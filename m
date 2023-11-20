Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E80C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 14:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E3210E3E2;
	Mon, 20 Nov 2023 14:24:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38F410E3E3
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 14:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700490268; x=1732026268;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZbPpOa7sGs5xqqNXcam8o8E9ySweeggmoyFe4Qv41Jo=;
 b=P7KP3FGTQghGD/AvIAwOVOW3QqBlyD8Z7ccLfqtpMxyz/brIteFZ3BgW
 OGrK4/kwvRYvdIZfp384L/qGeZVjZOqTDwSSn7znwDOI1F1sWT/4PvBVt
 juvd06PaTy1bKRPNRtRWMkrudIxA5b/OwF+GxbJ0vXuowtCIuWjnJ9jzY
 Be2x0C0fUZtbksnf+N5Pg4XVFGAYPgBkg167kQ+LZOOxOHrkrpUvElFvd
 SoQ+xj82GNaHYBSgjbEF2RIplVzxR45dYEHBr9wdbDoKJHuOzSgbbPQYB
 7fiF9XvSHy+kHfIP8Antm/9Y4M2nmGbGpQgSROwLlDq1BfMV5DMBykoJ1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422721741"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="422721741"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 06:23:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="14183604"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 06:23:30 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 06:23:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 06:23:29 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 06:23:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CK9IdofjWz9bvDjPl3M2Lg/vu+q8g390pIC4N4WNPQXfGXY+JmCA1kM7512tp7FGlMy+c2ba+oMsFOVE2MTSveCGYTbxcvTt+Xs3SJGA0E4pAdbdSy6cN8B7+zUaZWe6Iou7utYmpkOP252UDYRK5AojnpXDucWBvD41sevU7AarLQKSsPJwL/Dx75bpworpnBejw7pz1wQHUTowMGnSgtOXWthAc+FRxykwjg8e0ZW89lpxK9t65QtuqUabBc4iZ1tx/wnosSEnIoswB5kDoDpOtiMWUeGuo7KdJ5y18/SQtnyMT3ecT7tqjssM/dn8JXr/mYEKCU1SdRhujJv7Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2zz+BXEK9r7kCSDCKikBqVdc9HOHpncq3rkuhqaF0I=;
 b=eJboHKg/NONxu0QBpb3QRB5qzIJrFMBnZHsSo/9zlVKRDxMHraYBMnHpf6tc+amn1XHUG/7txATIion6cU25fFJFYaP1cJesafeEu4O8Aey1c1nWvZs7g21VmZnHcMQWX9TBk82ORRxq3nRkT6k4n3ZA4gVDYjVNR5Vq6k0HyuqxlZcc8RBAt/aKRo8S3zfxtcbqNAWeVh8Vcb1yZeqTHSKfWsaY2YPeRPYnFvw78zEh0/4KXJebjKo7D+UuvxaBirGzGha86yIVm6D37B7sI9o4Xxh2BzsV7IQ6LqTVcv0xORugzmSojTk8FKIJnfWvxVKFo0z7YuAOtgNgY85hAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 BL1PR11MB5955.namprd11.prod.outlook.com (2603:10b6:208:386::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 14:23:14 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7002.018; Mon, 20 Nov 2023
 14:23:14 +0000
Message-ID: <612cc929-1e50-40f8-9fb6-948bf7a2c723@intel.com>
Date: Mon, 20 Nov 2023 19:53:08 +0530
User-Agent: Mozilla Thunderbird
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231115030111.770130-1-sujaritha.sundaresan@intel.com>
 <20231115030111.770130-2-sujaritha.sundaresan@intel.com>
 <ZVfcEpiH4QGOX7Gx@intel.com> <ebfaa922-6608-41f5-b8cb-b63d5c7617b1@intel.com>
Content-Language: en-US
In-Reply-To: <ebfaa922-6608-41f5-b8cb-b63d5c7617b1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::7) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|BL1PR11MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: cb0e5e4c-0356-426e-c39b-08dbe9d43b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w4DPbaR8q1mEun27z2h8uFFl9d4Y+wl37lZuVP/EOMQTh7QvufSflqok3lt/EX6YKmolYzaChq5Z+/zv7qN8CoaLKm/l/jEehHtVrCcn2sydifdPPX7IcycQuJk18I6DsMVC3hthtBQQO/ExYoZJdJk6rVDgZvpOyNzMJFJ0/NkuhtbohST+gK/YqCSMbDZJqaCH2KDexN0nwvcgBtIjOUf1ew9ME+FL1mki9hXREF7Qi2vZUkOZv34SJ9TSjS1eXUaex2MA0LNL7Q/eJ8KuiG2aUFm8PjE8UwuS9BzbRKm08zSgAp0juDYg2xzh4XwGIYAJ+2X8N4bZe8zHJiLuzd309bN9UVTdJ6Q/QNAdNhnUvEsk4LMHFGe7AYZmVjLs4kAOu/iy1+HmkgI4a3YTa3TqTVjb5LrbE9r+xeVN6dHjp33KUy0s5GIND1TSlQ/eBPOJmlmMvxT/cy1FwZVAAscCOaGYuwug7BPu0TORYVweRd7k7W4dGlmYoT4YlT/KlU2cT1iFTs65wcvRJloiTaM97RPGbPsd5fMixo4dUjytnFqVG+2RQWcNZ/+8NYnyiGbPh9D2NAWEkpVZVvRJQCqCy1VnQHYMGLyrEypPouCOo/aL/LIytjijdQumkR8GV7tNi35fLWczKCjGykuIPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(346002)(376002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(5660300002)(2906002)(66556008)(6486002)(38100700002)(82960400001)(53546011)(107886003)(86362001)(31696002)(6512007)(36756003)(83380400001)(6506007)(26005)(2616005)(478600001)(6666004)(41300700001)(8676002)(6862004)(8936002)(4326008)(66946007)(316002)(66476007)(6636002)(37006003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkcvWFc1R2FYVUxzbWVvU1hrUDJleFJtY2h0SG1NdEFGY01YTTh3K2VWeW9Q?=
 =?utf-8?B?dVVYOWZ5WWdMTldCc0VsL0NNbkpmL0FVc2xhZUliYklGWm9oV3VuYmFnZFVk?=
 =?utf-8?B?S2pUWkg1YWxpZHdVZDFnWm9nUG8zQkYwaFRFM2Vib2V1SHJibDJqQTA0WkVQ?=
 =?utf-8?B?aTJDOWFCVWQxN2FkSTRjNVJiSm1ja2R0K0dPQ1Z4VE9USXlRZ3VFb2xCYlZ0?=
 =?utf-8?B?RitqL2Y1bzllMTFlMklDamh3RmRqRWo5Nm83dFVxNkRXV0tyaU1hVHhCRTBh?=
 =?utf-8?B?ZnY0NGlBeVlMakxhR3Qrbk9GYnR0QzErOWg4NWt1RmU3TktjTy9Rd2lQeERG?=
 =?utf-8?B?MXM3d3BlM09VNjlKTjlCYkhuTmN3U0p2blByZW0vdzdWZzAwd0VqWXdhUkt3?=
 =?utf-8?B?VEpFU0VIZ013Nk01YU9zMzhHM2xNVHpoaUx5Q2YwZFArcHppNDAyWHlIS2xz?=
 =?utf-8?B?TnViZ2dyQ0xFck0xc0VGd3hRVDc3UUZ1QW14RkJXVzkySnBHSzZFYS81OHlI?=
 =?utf-8?B?RVBmcEJMNUtoLzBsRFVZaUZlNHRvdFdjc1MrZU9NbXBzaDFWaFMvSmVjbFNk?=
 =?utf-8?B?WGR4UXZKM2dxZnIxK2FNcG5JQ1pnYkNrRUM5aGNUb0VIdUJCZWJLbTM2UVd0?=
 =?utf-8?B?cndHZEsyV2xhSk51ZzhRQXg5UUE4Nml2ZVpTenRqVjdtUzR6ZUZpU20vbEVj?=
 =?utf-8?B?TDdxMUcxWmtVWEhMTDFVZlFFSXp5TUoyVnJCb3NpVWlhWHdDY1ErV3B1MWhn?=
 =?utf-8?B?Q0N2cDRHV2IyNVVpU2JDQ0RuZW9Qa0ZVQlBRZlZWbFZSQ0hKSDkxVUlIZHRU?=
 =?utf-8?B?aXpneG5INm44aUowY0t2MHJzbXViM09oTWhsY3NzdXZkeG05TERpSk9IOVFw?=
 =?utf-8?B?Q08vWnlidk5sb1lRT3VmY0VjQjhXR1dqVStaSy9uL2QwVnQ0a1lrRTl2VG9Z?=
 =?utf-8?B?Tk11d2V6eit2RDVhZXFXRGpveXdtTGpia1hZekwxeDF3bVoya1pBZk5INGx5?=
 =?utf-8?B?Ti9Fa0ZONmpKdzVOaWVGejJrQ01kTGVNbzVzY0FMTHJKWTlIODZFTHJCejh6?=
 =?utf-8?B?cC9lVHFQZXdHYXl3NXRhejRpdVZvakVrWVA2bUdQWGtsWUQ1MFpjdHRYQ09G?=
 =?utf-8?B?WUw0TFpMRVVtU09jM0lqZEhWYWxaWjF5MUJxQXRjYTlEb3dEVnhQLzc4bGlF?=
 =?utf-8?B?czAwQ0xma1M2TXg3ek9QWDB2bHcvcmRHMzkrUDFCWWJLMEdPMnNVZkZuRVZa?=
 =?utf-8?B?L3VxUVhOdXE2RlZac3FqNU9FMU5oM3pjTEN0Q1FFMzNsN3o0OXRSQnVhME9F?=
 =?utf-8?B?U2VscGhTbDVPY1RoS29Dd2txT0poM0pmdVFjdlAvV1lTUmtwT2NxOUdMc0gy?=
 =?utf-8?B?MzVHZkdDcEtrTDJaVi9tU3pwMFgrWHlGYWZZKzg4MmphRmI0R2xTLzVUOG13?=
 =?utf-8?B?cUNuZm45SkNTY3U1MjNlR211Wlc2RFBHVW16K0YxWXhjR2paQVd6cFlibGVS?=
 =?utf-8?B?OTVFeUt2Vm9odjJSbHNrWVN2NlZNUjJ0emx1czdTd0dPUm83ZXZmYnlHTVM5?=
 =?utf-8?B?TUE0VGVnVTRWTkUwdjk4dWlIZWkrOGUzMnhrdUdRN0dOQ2RaZlk3TDV4NUV4?=
 =?utf-8?B?S3RiRjc3blFzZFNielpxRFF3SXFYNktJbTZyL21JdGJTcVlsakVkNk81Nzh5?=
 =?utf-8?B?MHU0NHNBc2xKWTNBYUZzNSs4bjdOb1dJUTRiSEFscXVaKzlNLzV5RFpXL2Rp?=
 =?utf-8?B?Z0E2VkdIY3dqYkk5Vjg2d1pOVk05a0FjTFJ6N2FGTGFIQWxJZUdldUpKb05p?=
 =?utf-8?B?VjlPS2xkcGd6Tzc2bnYzenovL1R4dXR6dUVWWDZPcG5CWXpwUEZ5OUZMbDJM?=
 =?utf-8?B?NGNOc1ZrZWUyMEhJM0x0K29QMXhsSW4zTURtcXkzL2JWRHcxV2ovR0pjQmtn?=
 =?utf-8?B?WGtIQWRjeWZ6N2lscEdXU3pyaGZaYmpkUXBWQy9VTDJkYitYMHhSMFdZT2pq?=
 =?utf-8?B?bXUrUHJjMmR1bVRVTjJMRFhHSWZEa0lUQS94UTREVFdhSUF1TXp1aThtZWlu?=
 =?utf-8?B?dzRjWk1yQ1pXdUFKQnZONnlYd3VYUEpmVzYxcHoyblFPS1RoWXB2OFlWM0Nh?=
 =?utf-8?B?TDdrOW5zcWFTbE5STzVBeXRGVXU5ZnNnbHFiREQ2T3U0TzlDWE5DOWxXSnEr?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0e5e4c-0356-426e-c39b-08dbe9d43b7b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 14:23:14.7361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xNFjROsp1QN3/jtEWUkRkjF5AKD2adBgj9CEHPJm/fmlyAB8KilyHmyG72rcy6+unZjVYFu4A42e4UQdtYeu7i9jLqkwsC1fR7pYUgF0MI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5955
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Moving and renaming existing
 frequency sysfs attributes
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


On 11/20/2023 9:02 AM, Sundaresan, Sujaritha wrote:
>
> On 11/18/2023 3:03 AM, Rodrigo Vivi wrote:
>> On Wed, Nov 15, 2023 at 08:31:11AM +0530, Sujaritha Sundaresan wrote:
>>> Creating a new freq directory to move frequency sysfs attributes.
>>> Additonally, renaming the frequency sysfs to align with devfreq
>>> requirements.
>>>
>>> /device/tile<n>/gt<n>/freq
>>>             |- act_freq
>>>             |- cur_freq
>>>             |- max_freq
>>>             |- min_freq
>>>             |- rp0_freq
>>>             |- rpn_freq
>>>             |- rpe_freq
>>>
>> on top of this we should become future proof by having a possibility of
>> N freq directory for different domains/PLLs.
>>
>> /device/tile<n>/gt<n>/freq<n>
>>
>> under each freq dir a file 'name' that would contain the differentiator
>> name. probably useful already on PVC with media freq, although there
>> we could only read the act_freq.
>>
>> But this patch is great. Thanks for taking care of this!
>>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> Hi Rodrigo !
>
> Thanks for the review. Agree that it would good to have this future 
> proof.
>
> Will merge this one for now, along with the needed IGT fixes.
>
> Thanks,
>
> Suja
>
>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_pc.c | 65 
>>> ++++++++++++++++++----------------
>>>   1 file changed, 34 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> index f4ac76d6b2dd..5d64cd041db2 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -57,15 +57,15 @@
>>>    * Xe's GuC PC provides a sysfs API for frequency management:
>>>    *
>>>    * device/gt#/freq_* *read-only* files:
>>> - * - freq_act: The actual resolved frequency decided by PCODE.
>>> - * - freq_cur: The current one requested by GuC PC to the Hardware.
>>> - * - freq_rpn: The Render Performance (RP) N level, which is the 
>>> minimal one.
>>> - * - freq_rpe: The Render Performance (RP) E level, which is the 
>>> efficient one.
>>> - * - freq_rp0: The Render Performance (RP) 0 level, which is the 
>>> maximum one.
>>> + * - act_freq: The actual resolved frequency decided by PCODE.
>>> + * - cur_freq: The current one requested by GuC PC to the Hardware.
>>> + * - rpn_freq: The Render Performance (RP) N level, which is the 
>>> minimal one.
>>> + * - rpe_freq: The Render Performance (RP) E level, which is the 
>>> efficient one.
>>> + * - rp0_freq: The Render Performance (RP) 0 level, which is the 
>>> maximum one.
>>>    *
>>>    * device/gt#/freq_* *read-write* files:
>>> - * - freq_min: GuC PC min request.
>>> - * - freq_max: GuC PC max request.
>>> + * - min_freq: GuC PC min request.
>>> + * - max_freq: GuC PC max request.
>>>    *             If max <= min, then freq_min becomes a fixed 
>>> frequency request.
>>>    *
>>>    * Render-C States:
>>> @@ -385,7 +385,7 @@ static void pc_update_rp_values(struct xe_guc_pc 
>>> *pc)
>>>       pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>>>   }
>>>   -static ssize_t freq_act_show(struct device *dev,
>>> +static ssize_t act_freq_show(struct device *dev,
>>>                    struct device_attribute *attr, char *buf)
>>>   {
>>>       struct kobject *kobj = &dev->kobj;
>>> @@ -410,9 +410,9 @@ static ssize_t freq_act_show(struct device *dev,
>>>       xe_device_mem_access_put(gt_to_xe(gt));
>>>       return ret;
>>>   }
>>> -static DEVICE_ATTR_RO(freq_act);
>>> +static DEVICE_ATTR_RO(act_freq);
>>>   -static ssize_t freq_cur_show(struct device *dev,
>>> +static ssize_t cur_freq_show(struct device *dev,
>>>                    struct device_attribute *attr, char *buf)
>>>   {
>>>       struct kobject *kobj = &dev->kobj;
>>> @@ -439,18 +439,18 @@ static ssize_t freq_cur_show(struct device *dev,
>>>       xe_device_mem_access_put(gt_to_xe(gt));
>>>       return ret;
>>>   }
>>> -static DEVICE_ATTR_RO(freq_cur);
>>> +static DEVICE_ATTR_RO(cur_freq);
>>>   -static ssize_t freq_rp0_show(struct device *dev,
>>> +static ssize_t rp0_freq_show(struct device *dev,
>>>                    struct device_attribute *attr, char *buf)
>>>   {
>>>       struct xe_guc_pc *pc = dev_to_pc(dev);
>>>         return sysfs_emit(buf, "%d\n", pc->rp0_freq);
>>>   }
>>> -static DEVICE_ATTR_RO(freq_rp0);
>>> +static DEVICE_ATTR_RO(rp0_freq);
>>>   -static ssize_t freq_rpe_show(struct device *dev,
>>> +static ssize_t rpe_freq_show(struct device *dev,
>>>                    struct device_attribute *attr, char *buf)
>>>   {
>>>       struct xe_guc_pc *pc = dev_to_pc(dev);
>>> @@ -462,18 +462,18 @@ static ssize_t freq_rpe_show(struct device *dev,
>>>       xe_device_mem_access_put(xe);
>>>       return sysfs_emit(buf, "%d\n", pc->rpe_freq);
>>>   }
>>> -static DEVICE_ATTR_RO(freq_rpe);
>>> +static DEVICE_ATTR_RO(rpe_freq);
>>>   -static ssize_t freq_rpn_show(struct device *dev,
>>> +static ssize_t rpn_freq_show(struct device *dev,
>>>                    struct device_attribute *attr, char *buf)
>>>   {
>>>       struct xe_guc_pc *pc = dev_to_pc(dev);
>>>         return sysfs_emit(buf, "%d\n", pc->rpn_freq);
>>>   }
>>> -static DEVICE_ATTR_RO(freq_rpn);
>>> +static DEVICE_ATTR_RO(rpn_freq);
>>>   -static ssize_t freq_min_show(struct device *dev,
>>> +static ssize_t min_freq_show(struct device *dev,
>>>                    struct device_attribute *attr, char *buf)
>>>   {
>>>       struct xe_guc_pc *pc = dev_to_pc(dev);
>>> @@ -510,7 +510,7 @@ static ssize_t freq_min_show(struct device *dev,
>>>       return ret;
>>>   }
>>>   -static ssize_t freq_min_store(struct device *dev, struct 
>>> device_attribute *attr,
>>> +static ssize_t min_freq_store(struct device *dev, struct 
>>> device_attribute *attr,
>>>                     const char *buff, size_t count)
>>>   {
>>>       struct xe_guc_pc *pc = dev_to_pc(dev);
>>> @@ -540,9 +540,9 @@ static ssize_t freq_min_store(struct device 
>>> *dev, struct device_attribute *attr,
>>>       xe_device_mem_access_put(pc_to_xe(pc));
>>>       return ret ?: count;
>>>   }
>>> -static DEVICE_ATTR_RW(freq_min);
>>> +static DEVICE_ATTR_RW(min_freq);
>>>   -static ssize_t freq_max_show(struct device *dev,
>>> +static ssize_t max_freq_show(struct device *dev,
>>>                    struct device_attribute *attr, char *buf)
>>>   {
>>>       struct xe_guc_pc *pc = dev_to_pc(dev);
>>> @@ -568,7 +568,7 @@ static ssize_t freq_max_show(struct device *dev,
>>>       return ret;
>>>   }
>>>   -static ssize_t freq_max_store(struct device *dev, struct 
>>> device_attribute *attr,
>>> +static ssize_t max_freq_store(struct device *dev, struct 
>>> device_attribute *attr,
>>>                     const char *buff, size_t count)
>>>   {
>>>       struct xe_guc_pc *pc = dev_to_pc(dev);
>>> @@ -598,7 +598,7 @@ static ssize_t freq_max_store(struct device 
>>> *dev, struct device_attribute *attr,
>>>       xe_device_mem_access_put(pc_to_xe(pc));
>>>       return ret ?: count;
>>>   }
>>> -static DEVICE_ATTR_RW(freq_max);
>>> +static DEVICE_ATTR_RW(max_freq);
>>>     /**
>>>    * xe_guc_pc_c_status - get the current GT C state
>>> @@ -664,13 +664,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
>>>   }
>>>     static const struct attribute *pc_attrs[] = {
>>> -    &dev_attr_freq_act.attr,
>>> -    &dev_attr_freq_cur.attr,
>>> -    &dev_attr_freq_rp0.attr,
>>> -    &dev_attr_freq_rpe.attr,
>>> -    &dev_attr_freq_rpn.attr,
>>> -    &dev_attr_freq_min.attr,
>>> -    &dev_attr_freq_max.attr,
>>> +    &dev_attr_act_freq.attr,
>>> +    &dev_attr_cur_freq.attr,
>>> +    &dev_attr_rp0_freq.attr,
>>> +    &dev_attr_rpe_freq.attr,
>>> +    &dev_attr_rpn_freq.attr,
>>> +    &dev_attr_min_freq.attr,
>>> +    &dev_attr_max_freq.attr,
>>>       NULL
>>>   };
>>>   @@ -950,6 +950,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>>       struct xe_tile *tile = gt_to_tile(gt);
>>>       struct xe_device *xe = gt_to_xe(gt);
>>>       struct xe_bo *bo;
>>> +    struct kobject *kobj;
>>>       u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>>>       int err;
>>>   @@ -965,7 +966,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>>         pc->bo = bo;
>>>   -    err = sysfs_create_files(gt->sysfs, pc_attrs);
>>> +    kobj = kobject_create_and_add("freq", gt->sysfs);
>>> +
>>> +    err = sysfs_create_files(kobj, pc_attrs);
>>>       if (err)
>>>           return err;
>>>   --
>>> 2.25.1
>>>
Patch is merged.

Thanks,

Suja

