Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D42C47074
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 06:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF0E10E3A2;
	Thu,  4 Jan 2024 06:15:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F1F10E3A2
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 06:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704348949; x=1735884949;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k6yv6gQ/LqNlMx+3RasDGnMPGzej0kLJGT+HN0IZCes=;
 b=Bn9NOtEBn1TRO8jlRRAhRtJYvJ1A+hZQ5aatqYNZBOKXB63nkpcG1thX
 FqXCo2gHvxEuTXFXXcQOw7BweOK2/fdqYjUTziOms3nc7p6JbH0WaQjPp
 98Pb7OK86eMvmavVKqiyvCc/N39Uv57grm05azM09YO0gKshxHUOk/mHF
 JiyT2UiTGGoLaxSVZ2SEz4gWrU51kxupCY26ffvF4ovB6KNbnWNaQwaaG
 vAJAqUNbbHrMi2vtrDvUC+ZOT46sc023qFf5KBQyX7ytAwzhw35Vib0CB
 TvLuQCtuoSXlVCI9CNSMKOHyyNVFM0ywiId5l1h8A8LX2IZ++H6Qvv7DW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="428296913"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="428296913"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 22:15:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="783758648"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="783758648"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 22:15:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 22:15:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 22:15:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 22:15:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQ4fomujlQI5q9sXKhEoMjBcGM6DrKcffvlTlptQ0SOjUAhldV2KyOM+JXI2hdsaPYQ2vltTbtwDFBv3EaBU/gTbJTSBsJNsfAXgiVYTvjdQ2aqwRALxKKeHrWJESDN9jDKnAGdKcvQy3g7Xmq3pPxoXysjcxLR/zjQBXiroXokgAc4nHjWS6ecqrIAMp94f6f5EY4WB+OZabetDoxNlfZkQ/bY2w/xNDV2iymSMeOkO0XFjKKRDIpvdTbt9OvrVPISfnl8MGlO8wpvqhGl5C713Nheg+TNJ1VL6P0PBiNQHjg9VVDR3WgTjldyNXj9fmw0z97jMcUbtqQZY/umrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZiCC2XpLTPKih957kNKyyvDB0QdNz6o6doOKdQjKGg=;
 b=OhBhLHNW4noFvHlEpu2CtRcZsudTGUaUzGc3j2KDsF6Bt51Mm00qZazm6a8M4vYH8aKlRZ6o74JxjvUWry7+7lCjaULZS9NrrgFTiX/5zsYeTZtVtnFXh1i3dpfZQ/UUOqWzTLKecOTGex98C4ZY1YFI6mNdcttkGhjMAI/1ErQ97wq+aIfCTHlh1pec3hmN1LdXBx0II/0SCfdxZHHq8kfJJ1yN+rl2yDPCaNX9VJw4nbzN31gmPpgt7n6Nnq3fgiDK7V7ifyZj9cyaxPrGlV+LehWPYrOD0GFpPuRp5sxRYp30PrgzQoFR1lCk1EOn/NxNz1PR/h9GAIwRBiHWug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MN2PR11MB4757.namprd11.prod.outlook.com (2603:10b6:208:26b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Thu, 4 Jan
 2024 06:15:45 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::7c9d:1857:d17d:53da]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::7c9d:1857:d17d:53da%3]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 06:15:44 +0000
Message-ID: <8c632706-4cfd-4836-939f-15c830c3ae2c@intel.com>
Date: Thu, 4 Jan 2024 11:45:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Check skip_guc_pc before setting SLPC flag
Content-Language: en-US
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231222210109.533215-1-vinay.belgaumkar@intel.com>
 <dd42753d-5cda-4e95-a299-0cda55df4184@intel.com>
 <5c890fd0-1731-4fa2-a714-6859cfab7874@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <5c890fd0-1731-4fa2-a714-6859cfab7874@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::16) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MN2PR11MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: ee96ff94-455c-4ad8-fcbd-08dc0cec95c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H29wkNs8SNmG+Xh6K2ZhmaIT+hzaEVBUZw2PlrOWInN5oNTRQvuGCMS6M5TKtn37Dk3TJSTcNa5OyGlWRVhAXMJeq3w7I08EAlPNJsoLkT/VFiADEVXyXcAYvutZmQ8NlRAiaXXaw66Np/tFd1CZozWNnUSiwNJJk9pivgjftgs/ctOkfcbhOV069kpodGZVc//grQ9J8TG4Gmu7QLoiVp8wMeZWlmRo7Hu345nOqCNGZ0n5r3f6T8qrATVJV4WCwjLNjca6NTdki+pDG9TjVqw4g4Y86+0/Gs3Z3h0r1UcmO1IuNG+23Msr5zWBce6hfTm6uiXIp8DQZQQ0UNAu+7hcmdzDzXi2LZSgZTCZWg0XOwyoMuOE2bcvyehKG88Wsncx+D+HvQARoS42mHCJBv0F+/ZEnGVqi6Eu8TCRJLZDonpwC8NGrcyihOZcR0t+K+QDLoWY2L1pFCg9FGdvjuSuxvhKRtC69Vd+M+ZBU1LadjfYHt8jRz3Wm0GkSBoVrjcBbiWUXmDYQrA1qCCo4RjX2EP+8ZFdxEQufB8GGz7XdrSvMbcBx4L2N2kTQJ4o+EtuZxeo1tR/aZUG+eGD2I4ijR/1XXNDNlseV/REQReAJ7zXnAtI5H1SUPr5C8nO5W+94IURBwKlZUayGomFdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(376002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(36756003)(31686004)(53546011)(66476007)(6506007)(6512007)(66556008)(66946007)(6486002)(86362001)(31696002)(83380400001)(41300700001)(38100700002)(82960400001)(2616005)(107886003)(26005)(2906002)(316002)(5660300002)(6666004)(478600001)(4326008)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHQ2R0daWlZUaGtJR0NhSVdqRUJMUXhDQjFBbWtlSFFPTm4wbkZTK0RTNEVY?=
 =?utf-8?B?R2JST1p1RDYzTWxjVE1SRlMyc0VyUzAwaVJLLy9KdUdWa05IOVUvNVFTTlF2?=
 =?utf-8?B?aEZxUTVMNjliT1BHVEdVZ2JweDgyS3Y2K3pXcFlJWTFIanFWQWQ2MGhVZXV0?=
 =?utf-8?B?a24vSTlwUjg2RGhBb0NYZHd3UXhqakNXUnJKMXAzSVhqSUx2Q0c0RDU5SGRJ?=
 =?utf-8?B?MkpxMmRKSHVLVnN3c0lZNUR6eEgzY3hFMFcxS3pOM1c0OWhLM0FDTk5acHN1?=
 =?utf-8?B?ck9WOUpUa1NPQVk3L0JxdDdSQVJNYUkvWVhKOXQ5UVJmNEJZaDk5eWhCTU5D?=
 =?utf-8?B?eHM1dWdKQTYzaGVxRDA3ajVQL1VDejBBRUtaeDNldWVyV1FrS0NIZUxwejJM?=
 =?utf-8?B?RjFjMWwrUDhMUGVIT2U3cFZJMkIvVHZwRERSaTBvZytGQ3R1TmU3NzRhMmhu?=
 =?utf-8?B?TWNEQ3dMMzJEV1JVWldSZEZscG5PYm14dGFBRStVQ1I5Nmg5YjNERDFNck1V?=
 =?utf-8?B?NnZNSkJDUGFVSmo5NmF0cWpscldiZCtBbTU3cDUwNTlBN3A5a1BKQ0Ywbm0x?=
 =?utf-8?B?VWFNNHI2WkNzVElxM0xaSTZqT09RZ1QrTU5peFNYbkgwSDNCMHJYWnhOVmFm?=
 =?utf-8?B?WGpIUWZjcmJtbWo1SFZwanNxNW5IMlRVbjJoQ1I1Y1FaVk9LQTV0dk02bW8x?=
 =?utf-8?B?ZTNXR0lWUTc2eDNsZ2dwVHlmTXMxSzhiaXR5WDYvQ3ljSnIwZlRRUzFVTmF5?=
 =?utf-8?B?RWhrZWhVTWhrdnU0bXJhbkRrMkNITmZETkFnMUJidEFvZ2ZqZnRjTTl2bFR5?=
 =?utf-8?B?UVNjM3hOSGFEUUtkWDI3d0tIemtBc2ZvNGc0Slo1ejErWkFJL1IvODVxTTh2?=
 =?utf-8?B?aWsyL3dvbTFPNGJyb3BmaVlOL3NlNFNrTWFjUEFSZE1IdThqbXgwUlNIbWdz?=
 =?utf-8?B?Z0N2NFYwakx6R2pxUDIzWVBRbmo1WkU0VUFib3B0REhzV3dqOGYxNkNKUXVj?=
 =?utf-8?B?dFVwNXgvK2RFYzZRNzVaZWZWdjRmVFZ5MEJsMlYyVkkrd0Vwb1Z0ZkZhMzZi?=
 =?utf-8?B?dHN3QnlpbzFrd1ZMZmVPR3pnTWxFZ09rK1cwMndVN285THNGa2RvN3ZKUUJp?=
 =?utf-8?B?cCt4M25WTEpLYWx4VkV1OGF6bnlmSWI2L3AraDJtNTBXaDJMSmlsZHRPd09Y?=
 =?utf-8?B?MHVFbTJrTDZ0dVNJa0RYTjNob3dXQkJjMVAxdVlXZk9oNG9NREhPb2MvWGUz?=
 =?utf-8?B?STFlSzVlTTlieW44WTBTVllReWorQlAvOEUzZzJ4RUIxT2M2ZGRZZTNMUlBC?=
 =?utf-8?B?VjYrcTQ1S0FtWXRDNm50bEZTNGI2R2JISEt6djhRSjJQZzM1TXBWUituM3JG?=
 =?utf-8?B?QnBUZkIzaXlORm5wQ1dSaHJPWlBybTVDcWNCTlZjZUN3TlU0Vm9CdzZDMDJK?=
 =?utf-8?B?SDhlekRhMjN2U25yVHpjcVlGZ3RBYzNyTDlsM1BnY1U2N1J3ZTFKQmtzS005?=
 =?utf-8?B?R2svU0pBaVVQdDRHemZzWFFaM1c4UFQxQUh4UW55QXFEckszZTdqM1R1eG5S?=
 =?utf-8?B?OC8vTnBHM1JHaXduSmN0M0Jna0dJblEzcHBKNjJxZlJGS0d3OE92U3hHT081?=
 =?utf-8?B?aG1vei9Qc3NER0FhVDlBeFFVbmFDQ0EyeVIvckNyMmJ4dGFhc05LRWRucmxz?=
 =?utf-8?B?WHBmT1AvdEdIRzEzU3VSL3FwaWJzbnJybDBJdm1Ib09maGJtbTIzYkordk1W?=
 =?utf-8?B?WnNVSnJ6cDJYd2ptN3l2VUc4WVVxMG16YmlBNDdMelVvdk04Y2ZWeHFPTEEz?=
 =?utf-8?B?bUtqYjloajJmOWJiQkNPenZ2OWV1Z1l6YXZLM0VUMU1MejhiZUowanZiRHIz?=
 =?utf-8?B?bStZNTZjajJneENpQTNiTlptc3RVTnI3SnUxRnBOWVVheTRrSEtuaTg3eGc2?=
 =?utf-8?B?dzRXK0tCdE00TThwY24yVmREU3FWUmVpZ3ZHNkR5UXJRSnF5TWY2SFlRNm90?=
 =?utf-8?B?YkFsVWxVWW5PTkhPMC9vMWxpQWphREJXL2p1THFYcmQxQlQ3c1ROWGlxQWp2?=
 =?utf-8?B?Zm95UlowVy9odW0wbUpMbzFRMnpjOFh5bDM2REV4NU1wOXJtZkFLVldVc0Jx?=
 =?utf-8?B?U1RTbFJKK01nb3o4aXRvdXBnMjJZNVVZNzNyOXpDYUk5RVNoUWFISUdNek5B?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee96ff94-455c-4ad8-fcbd-08dc0cec95c2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 06:15:44.7444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4K14sBTndmjDsegT8b3ztbYrd9poU2BngJOaDJgdeOGaVdBXZoTDLDJBoHHE07+Qc5fsxoV6j326vWTEFw/cFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4757
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



On 04-01-2024 11:36, Belgaumkar, Vinay wrote:
> 
> On 1/3/2024 8:56 PM, Nilawar, Badal wrote:
>> Hi Vinay,
>>
>> On 23-12-2023 02:31, Vinay Belgaumkar wrote:
>>> Don't set SLPC GuC feature ctl flag if skip_guc_pc is true.
>>>
>>> Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is 
>>> set")
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc.c | 7 ++++++-
>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 811e8b201270..0e112b144ec8 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -62,7 +62,12 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>>>     static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>>>   {
>>> -    return GUC_CTL_ENABLE_SLPC;
>>> +    u32 flags = 0;
>>> +
>>> +    if (!(guc_to_xe(guc))->info.skip_guc_pc)
>> Frequency attributes freq_min/freq_max may not work when skip_guc_pc 
>> is set. freq_curr also may not work. I think these freq attributes 
>> shouldn't be exposed for skip_guc_pc case.
> 
> We already skip pc_init() (whihc creates the sysfs attribs)  when this 
> flag is set, that was in a previously merged patch.
With recent changes in bef52b5c7a19 ("drm/xe: Create a xe_gt_freq 
component for raw management and sysfs") attributes are created by 
xe_gt_freq_init() which is called in xe_gt_init().

Regards,
Badal
> 
> Thanks,
> 
> Vinay.
> 
>>
>> Regards,
>> Badal
>>> +        flags |= GUC_CTL_ENABLE_SLPC;
>>> +
>>> +    return flags;
>>>   }
>>>     static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
