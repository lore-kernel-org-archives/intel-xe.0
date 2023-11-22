Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA97C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 08:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7493410E5E5;
	Wed, 22 Nov 2023 08:37:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C270E10E5E1
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 08:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700642242; x=1732178242;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hpFK1rjyZei3v0Ok7oRbnO1IX/HrPUQsAweBP+gg4ao=;
 b=jgCN3FAr3gNrWXBNmOcnyZn+E3F/5Ggvm0PBGg0QMePFWNlEoup6bOsb
 N9eUje48i88XclxZYsg86MBgruo4eTaZYC1MckzNOK3lSgIF/nkCVA2hj
 sb/PLzWhb1Fe4Nl4gZ0oDgy1X2slRvwbnVKWilsHHqtl5VIbwsfavmlZr
 kWn0vC0Izf+b7UX00NcIxvTktRBCl1XOZ6Y3u5Flk/kvTuRIkzG482uJ9
 6ZnY55vuk2fTePo0LiM2uc5ULEFmve6GhQ+CcyHMH58QR81c7cf29oy7U
 KWw5jXVsBVZEAcQrLXXBEFUnoVShE/LyaW77PwKkNB5Ds7g/2T7QOm/hl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="456338719"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="456338719"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 00:37:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857612027"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="857612027"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 00:37:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 00:37:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 00:37:14 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 00:37:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLcX0BNWPkOpUH2lY/du7yTyqcrr2WJTK0sRJsIcBv7n8zRkXRQoT19W2dVRY23xEBXyseztr8gkCyTgx0FKSc9YDeFuMLQxDtkCNW08lprpidR2Tt67YLT2AX6e7ZNjmrq36cWT49ZDSgEiwnfjcIafqaN+xI7YBGr1y4qNMDys/aO+CGN27gi4RD/JOJJ7RJy77RtWHIr6Nv1IcigrCn26vLtb2xmy6tgGVhvImN4rmzIwuq9jobv+f1PLIp6+Tx94yUK++zrayjHzNQ/Q2uxCROz6BfDVqpgHd4XYAzobKBn9FHPBZvdKRQgb4rECTbE5CKdhIK/XGbEhzFx/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQd6X/5/TsyFxHoaFrYoSyJRTV+SLk+YpuXIgz4Q9XY=;
 b=Mpg60yBjv7bPTbS9HOwGX4uQ5Me/yRIE1e5NFepB2lkOQcNC8Eu/BaPyPvfrhdA6Y8Z98Gre7q6QSAa7BTorruVxIPhfGtO+9lEJFBknChqRkweqJEqv7EkDE5T02X8dwjGsf8Olaxlymh2qb1iB/J5alYW76dZlEaR2LSH2x+nZ80EYf0rTX9RqaS2POGFPsX22WLvN1JbJAuy5UCeexkH+vGGo0YLuYZ2CdT/ihL48due5i8YPV32i6Q/QFrBv/EDRiy55eF2CHe4GWiybDkxthtcUzXCn4Um8pU5OoHB+sLI5I9dUODW2Mh/pxjV9GDcBMB46yPmt6djykNy5AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.18; Wed, 22 Nov 2023 08:37:06 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7025.020; Wed, 22 Nov 2023
 08:37:05 +0000
Message-ID: <ba3816ef-c9b0-4286-b2ce-fb8f4b6de6fa@intel.com>
Date: Wed, 22 Nov 2023 14:06:41 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Welty, Brian" <brian.welty@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
 <20231116143043.908412-3-sujaritha.sundaresan@intel.com>
 <ZVfdHp1M0BPtn457@intel.com> <165bdc38-a10c-4bc4-8a51-40c15e6cbc7d@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <165bdc38-a10c-4bc4-8a51-40c15e6cbc7d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::7) To SJ0PR11MB5664.namprd11.prod.outlook.com
 (2603:10b6:a03:37f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|MW5PR11MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 267b1253-1d94-45d6-d127-08dbeb362ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gqwwo1Mv2EbcHor3Spba+mzlumMfxYWW12kbc3OXIcsohi+5bpF2yycb4MojV3KbHW5HTU3u4tOPShivLW8COezsqzVnxHgvcF9esFDupL6w1+SuJv9HuAGre6Xt4uiAs23RjEIt6Q3EKhNdwHJ4bAmveZIse4TO/QZuMpbYLUJGk8X1LehANSjcHw6RBU8BlHycATAHP7h2Z8qMlap6964wq/mJcOWCuhG2dAWE5leEOfKrNfG8HgIsJnL+xA14jfMbh7j7ZOWmpOVpLGrm3wSJtjShxBuWJzytcGJ7ntf/fDDhQ0fnyxtu41N3/VbjmDyRZ0oYfuFjWC6q+Qs8xq8Vg8VjFo16Vzsv+a+ATsOuvGzf2janXaXc008vuWedphBZlGlK5ShKjTlgPCfGLdDoFmf1wUxchMLDe6ZgmJzTuIlD2k4BdR2oU2s/OpF59vKyyvY6Zqk5CP7Q2PiN9VK+8r8vNL9CQQYvMzUGwL9oc9xXR1suC3I0sCx7OvuJcKx8nmkP6+WT+uYm+Va8nqfhHNYLSPqX66EM6g806TV8oVsGhMLg0UWqOapbttrEyCIiFQt7TP7T4amu5gA7avuSqWYzW1JF3kcWQc8fgTlrpD1ODNPtgcrRAj0BOa0QZpIc2/NBKye54LFW5R5tSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(366004)(136003)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82960400001)(31686004)(31696002)(86362001)(36756003)(66476007)(110136005)(316002)(6486002)(6506007)(66556008)(2616005)(66946007)(6666004)(6512007)(107886003)(26005)(53546011)(38100700002)(83380400001)(6636002)(478600001)(2906002)(5660300002)(41300700001)(4326008)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnZhM29rWnpqalIvRHlpSk9NUy96NFFjckFmaTdhSVUrdlUzeVhIZUdZcGk3?=
 =?utf-8?B?Mnl0NXFYZVRvQjFHMkpzcURIOWd4cGYydE9SbFBYOHV3alBxZkpXVS9DdXZ6?=
 =?utf-8?B?UHFKTnRQQVJrRHlxdktwbmxrNWM5OXpiNWQzSjBTRHNqTXdoZzF3SnIvRG8v?=
 =?utf-8?B?SW1FNHlmWGRuTFpOb0k1VkhTWk9RSjltanp5em9Tcm5SSzEvNUh3c085bGVh?=
 =?utf-8?B?WThESzU2ODBadW10cmx0bHZjbk5jSXg1ejhQNWRFNGNyUGFlNHhmbWVJczZl?=
 =?utf-8?B?eVArbkdFMitVMzlXRVR2UVBNbEU5QUlpb3JseS9qNjZSUENXQm42Vk0rOHZu?=
 =?utf-8?B?UHViaGtOckdwZVpaOWw3S0VMWU5rYXpZdHVlaU5xc1ZzTFZ5dWx4VWc1MEhC?=
 =?utf-8?B?eU8zVzI1RW1sSWFkQUlNWjk2cmV6M2tqQ1FWa01WVSsvTlJXclU2ZjhxQ2Zi?=
 =?utf-8?B?OWNLOG1UYnhFTUpCMVlrd2RPa1V6Z1VFTnRzdDFHeTBZRitMWlV5azBIeDVH?=
 =?utf-8?B?MVF2aUhYWm1NRGNTYzd4TmdxSVo4WjNvYy9CdkwyWXhNTFZlNURocFFydllt?=
 =?utf-8?B?ZmwxRktTeGxYY1RlV29GVEViSlFDam1qam1ZSExhdCtPMHMxUHNDclNaMFh2?=
 =?utf-8?B?aHFEeDFZWDhDbDVCNWYzV3QyOEFvMVcwNG0wMFM5Vy9qaFlTa3FuMWRQZEhw?=
 =?utf-8?B?UFVZakNva2pUUlcvaVJEVkdDalE1Y01sWFBITWxIbVJicFo0MHpiWnFMVTQ1?=
 =?utf-8?B?N2hmKzI2Wk00Zm5BRmQzVWFuNWFnWVVIMkZVZWVEUURCcmZocVdHWmRNdXlZ?=
 =?utf-8?B?aXpZRThFWGx4NXAvMEcrbmpxMlRCSDFkR1NoeTV6azRVeFg3Z0VMQ284RTNW?=
 =?utf-8?B?dzVOc3dEUk9KZU4zR1lZem5KQlJodG9nS3BEZGJjeXBsV3VCTHArcllIeGdO?=
 =?utf-8?B?ejdqVEhNWFFXSC9Jcm1SL05jT0tUa0thZ3F2a2hEVkJuRXhvMSs0RU9kS3l0?=
 =?utf-8?B?L1kwcGtaVUtPSEdTMTAwVUpSSlNUdDdNM0FMOXZzT0RsWENyMmh0dGgzS2NU?=
 =?utf-8?B?YzFiVkxlaHlRUzNZR0d5NSsxZlNLRVVMTmZ0dHo4bEszeXVZUTZncjB6R0ZJ?=
 =?utf-8?B?bnJkZ2NNSTZ4VzRTamJhRDdxRDV2Tk5FU3FsWjdxWkZ3UnpWdmxlaHdjelp4?=
 =?utf-8?B?Z1duaGIxWjRxYlhwcVpuWkpaaitSb1pkaHIxQ2NWMURFSGZsQzBJUkJpRURZ?=
 =?utf-8?B?aXBZa1FqY2d5S3I1cGkya1FOZytDME9NYnpNN3o4V2hFZ2c2UlRDbG03MTRp?=
 =?utf-8?B?RGhVcjRIUGF5ME9HakphV3RFdzdodFFTN25DR3FiWUEvK2NIRlhwdVRPWGRL?=
 =?utf-8?B?NTJmMDc4OWhwVFFLdlU5MXA0U1VpNC81WlU4RU1LNkxRUWxreDYwSFJ0VUhU?=
 =?utf-8?B?VjJWd0tORnRONE4wdHZOSVcyZi9nUFFuL0NOaHBKaytKTUpXN04vTFppeGdn?=
 =?utf-8?B?TWFGNVdCVGdqc0FzNng1SGhKTkZxQVNMRElLOVJTSjVMQjNrY3loZFNxMWg0?=
 =?utf-8?B?SDJIdUpQSnpPdXA2VVppNEM5LzNPdEE3YVlGYTZnb1QrWVFCdmhQOUJEdFJZ?=
 =?utf-8?B?R05WOHhtV0h3Q3hmWXZrL0VwQ0JGZ1hUN3FpOE15bmU4d1VBaTNxZGNQMkls?=
 =?utf-8?B?VldjNGJmMEJQeHhyeC84VmVOREsxK1RSSGNFQ0FWSGR4eERZUUtOSXVIZnBQ?=
 =?utf-8?B?aGJuTStaeGV6MFBQNHMvM3Z4YVkrQTZ6ZjZmeU9NeDN3RFpwR29hZ3JlejRh?=
 =?utf-8?B?YUJSQUdxOTc3UDA4bWY1V2pIcHNyMHEzSVZSTjRtaTBlOU01WlBrbnM1YUxN?=
 =?utf-8?B?c0Y0c1pYek12Qm51UGZua1g5OWlJcjZpcXJOVWVyV1c2RUxsVytBdlcwR1NF?=
 =?utf-8?B?TStXV2laTDlqZFlBQlVHc1lrNm10MEVsQ0JuaTR5MnZubFFBWE4yTUF4cGoy?=
 =?utf-8?B?Wk04dzV5cmY4c0RpTjNmRjJvTk9UTlRmdzl5QlNXaG4wdEQ1c3Q5WFhadHBT?=
 =?utf-8?B?M2VlUlA2UFVTakMvMzVTalA3Q0hYak5sN3QwSkcxWWxnQmtyTUFOV0lOVE5q?=
 =?utf-8?B?Z1R4SDNob1ZSYW4wSGNmZzh4YkJZR1RRN1R3NW92WEgwSGtCN0NYaWpzM3dK?=
 =?utf-8?Q?7XZyEY3ARJSlBKtvgPgEIHs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 267b1253-1d94-45d6-d127-08dbeb362ae4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5664.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 08:37:05.4317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cuc7UFr6TBUYmU1QG+34iLFZn/EpGiB+glsivubPBfUM53OaKov/c9VP6AHyv3xB67l8caEU/JzKZJiiEKFtdNz9OiIvhUppYrLDYqlIchg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 2/4] drm/xe: Add memory directory for vram
 attributes
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
Cc: intel-xe@lists.freedesktop.org, vivi.rodrigo@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 11/18/2023 6:55 AM, Welty, Brian wrote:
>
>
> On 11/17/2023 1:37 PM, Rodrigo Vivi wrote:
>> On Thu, Nov 16, 2023 at 08:00:41PM +0530, Sujaritha Sundaresan wrote:
>>> Adding a new "memory" directory under for vram attributes
>>> under the exisiting tile<n> directory.
>>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>
>> Cc: Brian Welty <brian.welty@intel.com>
>>
>> Brian, should this directory be under the tile, or maybe we create
>> separated xe_vram_sysfs components for
>>
>> /sys/..../device/vram<n>
>>
>> and then if it makes sense inside the tile we just have a symbolic
>> link between them?
>
> Oh. Good question. Seems reasonable to me to have vram<n> in both 
> places as you suggest.
>
>>
>> Or better for now go with what Suja suggested and then later adjust
>> with symbolic links if needed?
>
> Yeah, maybe defer doing anything here until later...
>
> But let me ask....
> Was it considered to make the sysfs hierarchy more flat?
>
> Could also go with -
> /sys/..../device/gt<n>
> and:
> /sys/..../device/vram<n>
>
> and remove 'tile' directory?
>
> Could add:
> /sys/..../device/gt<n>/tile
> /sys/..../device/vram<n>/tile
> if feel is important to communicate which tile they are in.
>
> I don't know, just an idea.  Feel free to ignore.
>
> -Brian
>
I think for now I'll just have the /tile/memory and then add a sub 
directory for frequency

under memory for any vram frequency attributes.

Thanks,

Suja

>
>>
>>> ---
>>>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c 
>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> index 16376607c68f..d61c6fb1df40 100644
>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> @@ -46,6 +46,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>       struct xe_device *xe = tile_to_xe(tile);
>>>       struct device *dev = xe->drm.dev;
>>>       struct kobj_tile *kt;
>>> +    struct kobject *kobj;
>>>       int err;
>>>         kt = kzalloc(sizeof(*kt), GFP_KERNEL);
>>> @@ -64,8 +65,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>         tile->sysfs = &kt->base;
>>>   +    kobj = kobject_create_and_add("memory", tile->sysfs);
>>> +    if (!kobj) {
>>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>>> +        return;
>>> +    }
>>> +
>>>       if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>> -        sysfs_create_file(tile->sysfs, physical_memsize_attr))
>>> +        sysfs_create_file(kobj, physical_memsize_attr))
>>>           drm_warn(&xe->drm,
>>>                "Sysfs creation to read addr_range per tile failed\n");
>>>   --
>>> 2.25.1
>>>
