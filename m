Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8E5C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 10:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA90310E01F;
	Fri, 19 Jan 2024 10:14:08 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0FA10E01F
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 10:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705659247; x=1737195247;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WULeHaNPgrRntlx59aOVyFjnKysFF0GY7S2TtgIuMw0=;
 b=Rx8Gwxko6765qC38T83sjQ0E7wt+1OF0xougATqwspSwZ9e9YXj6wvdp
 ZzDPCBMssIA/7Ll7qwWlGug2P0JbyeyJPaHyfWI8dSxYxyH2B4Tg1Pgr8
 rLnh/R5AQE5gcvceKmGjeN1YVDOEUfCeJ/7HGnRJ7TfXgToNlekom3v7r
 6gqtH9NeAe0eCAdiTknmZ0+NUTtZom8fyfq9jQho5Cg1SXQT++hUjizo9
 TQeQmApHZnga6GZHLh2WdyXuj+Wy9XUoNLnL2APTINZ5j/UxaTFWrtqX+
 hB/hrHd9soP9+Xbq3++QmymQSmJvZIjTuvkACW/zmULqFrfqeJhVTl7it A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="8114458"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="8114458"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 02:13:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="651903"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 02:13:56 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 02:13:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 02:13:55 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 02:13:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HD9PlWy/W2R0Zlt9gjiLcIHFyh3t6PQr+2m5z2i8JIFyzJ2yi2hKQaSq004uIZIgYDoAWiMa2M8FMUzTREq84wzbyoB51ElJgvphH7QqU/ZPv4kawPODByG6Qo9w6h8QAdaGAzXTJm0Yal2/hqkx4ZNCZfBYxJbYDdwyQZC2gR6jSWgxfumkrBpbbFUK0UW0LTBLZ/X3D9r+edREeJO7YnltBR5DC4HMyBuSlX+9X3Jzmnc5igAikQMKgtSOBiDm7T0qno4zNaoVpSc+2DnZKbb9JLW83wnJmN8c/da4x5C39QMiP3zzf5FwLP/M8c81cozQrmAP62xqP9dYv9gwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3JLYeQi9GuMKbjUxUj9C9pZiLMaygqcfedNhMU2gW0=;
 b=PWa1CqWipRXVNpDwqgEvAfBFAdBfl1bZCOo4yh0eSnTzcQ8zvtMWzM15DmA12ojJP6M899pK9lwrvcgwjwwOy98ygPYpq1QToLEPPiR3imD7DX8L9stiYqcKE7QoWmFZx5pCoLzZzYSySLgwUJELOcl1GaGuLDc0JWERnevvgyGZ+T/7H16aBxJ6cGJGs9TyAMeGzSQqB6N7VgBBiLK/iRdyicxz6VejGr8co/W/IxFnn8jB55L+r1d7LQabO2CRRyD1LEg0/BKHD+uT1vhha8MipquDxZuJnju4f/TSPI6Iam0b9gGMZYwLK8fghiJyDowBZZcO++dq0o/S7VAcew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.24; Fri, 19 Jan 2024 10:13:48 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 10:13:48 +0000
Message-ID: <0289da11-2c4f-403e-9ac8-9e335318ae43@intel.com>
Date: Fri, 19 Jan 2024 15:43:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] drm/xe/guc: Expose engine busyness only for
 supported GuC version
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231222074602.817518-1-riana.tauro@intel.com>
 <20231222074602.817518-7-riana.tauro@intel.com>
 <18424588-8d90-4c5b-8b25-e652e5288349@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <18424588-8d90-4c5b-8b25-e652e5288349@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa5b303-e35c-427a-c188-08dc18d7536c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BD0wcG2kyt8OTj0yOzUNkQL6vwb68FfVpsDE2pPI0BcIRu+QO0wEExxpV4W3wVLJb0gJkxaHzo15WKcOG+fJ6v99LC2LfaTI5OM955ixA9GU2YWrVzDd/OeI6v1FdZ+JAaPQqb9sN82o7mCpPkHj+SMLaJ/ku0LicdvP5jQGwhqHlU/ZfKAK2HFfC1KYl4Y9orZtmeSUeSZMNIWj+/KH5QSJk0SJMS+Ps9iX6hsp3L79beCct24DO2gZYCpQHYh5zpc53+1V4SSB+OTGUt+t79SZeBUYwmrEPtc4GG7rEGTWAGNxoiXaHor/L58mkt4vzghgkqhkdi33f/MaNZPUY8pxMd0fXMc8RTB3K12pp0yDVq1ZMARe51wbax1Y35MhQxac3Qe45tu+gkmPCCmqeJJjomhg4K4BrhYe5aLAa2KxISq+TdvSZ65zs8c6TCtG+/Vw+DjmdHaoR3mggz3QRAUXr4O6JnGwPidnJMAcRHP76SDNAXjg+L/baN/VqQ8YdTRbfZZgFTt1WQ0JRHDgqYcrNLci2pbabpQ/vhuhfOTLE7f8vS6AqntklQ5tETwyit3uGBtlR2/ic6sisubqMLrGug4amOMqSR/gnQCr3fU+I5uquDSWaio6gaHQnwhc/Au5qw4r+DXKi4Sbga5TTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(478600001)(31686004)(36756003)(82960400001)(26005)(38100700002)(44832011)(2616005)(31696002)(8676002)(86362001)(8936002)(6486002)(66476007)(66556008)(66946007)(6506007)(6512007)(41300700001)(316002)(6666004)(53546011)(5660300002)(2906002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEM2bGhneU5DVmJDM2paZ09ya0tHVmFhNFErQXViQWs0dzkrT2d1ZE01YTQr?=
 =?utf-8?B?Yjk5Z3NHaTVqVWpjbk1DSVVIWDF4K2t5aFppbnRHeEJ2N0hUTzA3eGFlclVU?=
 =?utf-8?B?NTNUUWRKbWtuNzdMKzd6RlVGRUZ4Lys2NDRqc2d3YTlDRElzUG5HNEhyZ0xB?=
 =?utf-8?B?eTlXc1pxQnRud1R3enlhdjRPaDZBRnNidXNpOHg3TE1ZeEY5UXoxNkNvdi83?=
 =?utf-8?B?Q0lCcjI3VWwvUmZzUHhOYTBTQ0RhZ0hDOHNBOFZ0d0ZkcXNaRCt0amg0RGJK?=
 =?utf-8?B?RkxWU1JtSnV0Tmh0QjgzNDJ6c2F0eXQwSTQzRGdQaXdiampqR05QVWRPcGVR?=
 =?utf-8?B?Y2VmazJudzFXdFREK1krY0NVNlR5TmhJUHlYR2FTNVl6bzRtWmJEektCY25p?=
 =?utf-8?B?VFNmZ3MyQ3M3U0N0c290QURrTDQ3bUtoM3FBUWU4Y3loRXFiQVljS0FackVC?=
 =?utf-8?B?SE4wWEJQVVlOQ2N2NUpIWHoxMTczSzBaL2IvSmVGSkY0bWU0M3lIemFLOUtX?=
 =?utf-8?B?b2tVOVF6c1lQMUxIaDFnNFNxUjZxQmR1Vmd6VmtKaERwd2hkL3ZLY3Zhekpp?=
 =?utf-8?B?aGpxNE80cmNPZWFrV0V1ZG95Y1RPWm9VSEpvYmo0WGdYWjNvZUR1aVpZa2JS?=
 =?utf-8?B?TjB1dUk3YjVzK1JJU2hnTEs5WEhFRk9PdVJKcmQ0aGlnR2xBL0YySi8wengx?=
 =?utf-8?B?Snh3S2xydndQU1NHV3RtRkxscExtTnpIVktCd1Z1VHQwL2JTbzFpYWpFVTha?=
 =?utf-8?B?bXkrWnNqVi9TZTl5Vmk2YWN2aFVqTlJDUjA1RFQ2NmpXQXRwWVo0UC8yQnVU?=
 =?utf-8?B?dGVrSGh5WFdBeitrVlhwc05mL0ZqZzY3SERwZm5hRC9KZzJLRTNHZk80WjZ6?=
 =?utf-8?B?YmZSeWZwWlluTTNTNlRIVThKMnozRkRTaitGTDJXRXBsQ0NBSCtlSXZQNFBH?=
 =?utf-8?B?aUsraVZsd0psS2VIVnF0UTVDemhaWi9uK2NUOFo5TldvWTY4RWpDZGdGdm5C?=
 =?utf-8?B?bzV3Ym5wZCtWb3hIYjl6Mm50L2QvNzFnNHNSY0hoVEhnYUdVakVpYTFFcHYv?=
 =?utf-8?B?c0ZRS3ZrRmRhTEZTYXZ0Z2ZsYytXRWt3WU8yeDhKT296UEZTSkZyeC9vdFh4?=
 =?utf-8?B?YkZRbG1sNy9NMlJWbVZLQ2dNa0dRcVYrOW5kQ0tPbjJkL1RDMC9ya0R4bkJh?=
 =?utf-8?B?QWlDYXBxL3o2NzlZY3hHQjM4Uk5kYW1tT29KTjkraFNlSWJHcGZETmo3ek93?=
 =?utf-8?B?KzJTeWljVGdBeWF0MTBBdVRNcTNEQjRYUjdocTJ1RFgrampvcUdiZVkzWUF2?=
 =?utf-8?B?ZU12OXpTV0RaeldmdnZLbFB3ZDBBMG1kUVpYbVdlL1Ard3ZSM1RzSHVpRlJ3?=
 =?utf-8?B?WUlIaXRlVzdWNndHc2NxdkhGK21qZ2hNNnRmM3hvTmN1SWJKUFI1NmVPdWRh?=
 =?utf-8?B?dklna2lpYUlJY0ZVRHp6d1BqaVcyYmk2blF3eDFwWUV1U0g5VkFETWQyTDVS?=
 =?utf-8?B?OFkxb0d2UmRNOU1DUGNWQ2wrV3ZNWEZoN1M3OEVwWW42dUthMEh6bVNvbHg4?=
 =?utf-8?B?V0VHYU85Mlh0QjBTV0ROdHRMaUhCL0RwWlRieFBkWU9GbDcraXBPL2h6L2pP?=
 =?utf-8?B?cXFIUDRmWFdnVEtIMERMN0laRGc3bVNDRWpUTW41V1lMdlFZOWUyNTE3RXA3?=
 =?utf-8?B?SVhTa2lIeGszUVlidlk3ZG5hdWhHWGVwV2FkUVRpNW5aR0pqSjNGK2hkK1g4?=
 =?utf-8?B?NWZrRWRqTk13N051ZTMyVE9WL3luMGhISnBlbEsyMFB4dVFYY0dvRSthZ0Mw?=
 =?utf-8?B?MW9qRklmTmJyVFExMmhHd3BrVk93dEJYamc2TGV0eUN0ZllNVStjdmRmVXRJ?=
 =?utf-8?B?eXRka01pWnRYZW1tNXZNM09VaVdoQk44Mi9HLzMwS1FvZnlKMlpHR1pZSTRk?=
 =?utf-8?B?MjdrNHFGWWk3cVZTamNtaEo1SXFUQzBWd2tnV0lsNW9zaVppVjlQNzZ4UWF3?=
 =?utf-8?B?VkNjc2cwa1poUzVPc0pUSDF4WXltOFY5OWJPbGk0V1U4UUpBZkJiK05tTEQ5?=
 =?utf-8?B?RzIza0ZTYmZXN0hDb3NJM0diMmg1a1BvM01teHNwc09rcEpWMXhqdTJBU1U2?=
 =?utf-8?Q?pc1Zpm8SlKoFQaLq9r71wBoYM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa5b303-e35c-427a-c188-08dc18d7536c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 10:13:47.9620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJPfWHsLe3E/E32acp9QRv8RVgfp5vEXGmlyvxuyNBGWxF/ocStS5DO7T45hrpE1IKWXNpmEyHbPA0pwX+oPaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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



On 1/18/2024 11:43 AM, Nilawar, Badal wrote:
> Hi Riana,
> 
> On 22-12-2023 13:16, Riana Tauro wrote:
>> Guc version numbers are 8 bits only so convert to 32 bit 8.8.8
>> to allow version comparisions. use compatibility version
>> for the same.
>>
>> Engine busyness is supported only on GuC versions >= 70.11.1.
>> Allow enabling/reading engine busyness only on supported
>> GuC versions. Warn once if not supported.
>>
>> v2: rebase
>>      fix guc comparison error (Matthew Brost)
>>      add a macro for guc version comparison
>>
>> v3: do not show pmu counters if guc engine busyness
>>      is not supported
>>
>> v4: add version check comment only in the check function
>>      remove it otherwise (Umesh)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c                  | 11 ++++++
>>   drivers/gpu/drm/xe/xe_gt.h                  |  1 +
>>   drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 37 +++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  2 +-
>>   drivers/gpu/drm/xe/xe_pmu.c                 | 12 +++++--
>>   5 files changed, 59 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 5825471a3422..a48cceaa7750 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -800,3 +800,14 @@ u64 xe_gt_total_active_ticks(struct xe_gt *gt)
>>   {
>>       return xe_guc_engine_busyness_active_ticks(&gt->uc.guc);
>>   }
>> +
>> +/**
>> + * xe_gt_engine_busyness_supported - Checks support for engine busyness
>> + * @gt: GT structure
>> + *
>> + * Returns true if engine busyness is supported, false otherwise.
>> + */
>> +bool xe_gt_engine_busyness_supported(struct xe_gt *gt)
>> +{
>> +    return xe_guc_engine_busyness_supported(&gt->uc.guc);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 9bac85cdf609..bef99eb2fed2 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -42,6 +42,7 @@ int xe_gt_resume(struct xe_gt *gt);
>>   void xe_gt_reset_async(struct xe_gt *gt);
>>   void xe_gt_sanitize(struct xe_gt *gt);
>> +bool xe_gt_engine_busyness_supported(struct xe_gt *gt);
>>   u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine 
>> *hwe);
>>   u64 xe_gt_total_active_ticks(struct xe_gt *gt);
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c 
>> b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> index 24e72555647a..2dd06563d0ad 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> @@ -32,6 +32,9 @@
>>    * engine busyness % = (ticks_engine / ticks_gt) * 100
>>    */
>> +/* GuC version number components are only 8-bit, so converting to a 
>> 32bit 8.8.8 */
>> +#define GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 8) | (pat))
>> +
>>   static void guc_engine_busyness_usage_map(struct xe_guc *guc,
>>                         struct xe_hw_engine *hwe,
>>                         struct iosys_map *engine_map,
>> @@ -110,6 +113,9 @@ static void 
>> guc_engine_busyness_enable_stats(struct xe_guc *guc)
>>       struct xe_device *xe = guc_to_xe(guc);
>>       int ret;
>> +    if (!xe_guc_engine_busyness_supported(guc))
>> +        return;
>> +
>>       ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>>       if (ret)
>>           drm_err(&xe->drm, "Failed to enable usage stats %pe", 
>> ERR_PTR(ret));
>> @@ -122,6 +128,28 @@ static void guc_engine_busyness_fini(struct 
>> drm_device *drm, void *arg)
>>       xe_bo_unpin_map_no_vm(guc->busy.bo);
>>   }
>> +/*
>> + * xe_guc_engine_busynes_supported- check if engine busyness is 
>> supported
>> + * @guc: The GuC object
>> + *
>> + * Engine busyness is supported only above guc 70.11.1
>> + *
>> + * Returns true if supported, false otherwise
>> + */
>> +bool xe_guc_engine_busyness_supported(struct xe_guc *guc)
>> +{
>> +    struct xe_uc_fw *uc_fw = &guc->fw;
>> +    struct xe_uc_fw_version *version = 
>> &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
> Why not XE_UC_FW_VER_RELEASE here? Or should we check firmware type 
> (compatibility or release) first and then derive version from it.
Hi Badal

Even Release can be used. Used submission version (VF compatibility 
version).
Why do we have to check firmware type ?

However, This patch is currently on hold.

Thanks
Riana
> 
> Regards,
> Badal
>> +
>> +    if (GUC_VER(version->major, version->minor, version->patch) >= 
>> GUC_VER(1, 3, 1))
>> +        return true;
>> +
>> +    drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
>> +             "Engine busyness supported from 70.11.1 GuC version\n");
>> +
>> +    return false;
>> +}
>> +
>>   /*
>>    * xe_guc_engine_busyness_active_ticks - Gets the total active ticks
>>    * @guc: The GuC object
>> @@ -133,6 +161,9 @@ u64 xe_guc_engine_busyness_active_ticks(struct 
>> xe_guc *guc)
>>   {
>>       u64 ticks_gt;
>> +    if (!xe_guc_engine_busyness_supported(guc))
>> +        return 0;
>> +
>>       guc_engine_busyness_get_usage(guc, NULL, NULL, &ticks_gt);
>>       return ticks_gt;
>> @@ -150,6 +181,9 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc 
>> *guc, struct xe_hw_engine *hwe)
>>   {
>>       u64 ticks_engine;
>> +    if (!xe_guc_engine_busyness_supported(guc))
>> +        return 0;
>> +
>>       guc_engine_busyness_get_usage(guc, hwe, &ticks_engine, NULL);
>>       return ticks_engine;
>> @@ -173,6 +207,9 @@ int xe_guc_engine_busyness_init(struct xe_guc *guc)
>>       u32 size;
>>       int err;
>> +    if (!xe_guc_engine_busyness_supported(guc))
>> +        return 0;
>> +
>>       /* Initialization already done */
>>       if (guc->busy.bo)
>>           return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h 
>> b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>> index 57325910ebc4..e3c74e0236af 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>> @@ -14,5 +14,5 @@ struct xe_guc;
>>   int xe_guc_engine_busyness_init(struct xe_guc *guc);
>>   u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc);
>>   u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe);
>> -
>> +bool xe_guc_engine_busyness_supported(struct xe_guc *guc);
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index c2be157a6f5d..f91652886b67 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -55,14 +55,16 @@ static int
>>   config_status(struct xe_device *xe, u64 config)
>>   {
>>       unsigned int gt_id = config_gt_id(config);
>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>>       if (gt_id >= XE_PMU_MAX_GT)
>>           return -ENOENT;
>> -    if (config_counter(config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0))
>> -        return 0;
>> +    if (config_counter(config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0) &&
>> +        !xe_gt_engine_busyness_supported(gt))
>> +        return -ENOENT;
>> -    return -ENOENT;
>> +    return 0;
>>   }
>>   static int engine_event_status(struct xe_hw_engine *hwe,
>> @@ -71,6 +73,10 @@ static int engine_event_status(struct xe_hw_engine 
>> *hwe,
>>       if (!hwe)
>>           return -ENODEV;
>> +    if (sample == DRM_XE_PMU_SAMPLE_BUSY_TICKS &&
>> +        !xe_gt_engine_busyness_supported(hwe->gt))
>> +        return -ENOENT;
>> +
>>       /* Other engine events will be added, XE_ENGINE_SAMPLE_COUNT 
>> will be changed */
>>       return (sample >= DRM_XE_PMU_SAMPLE_BUSY_TICKS && sample < 
>> XE_ENGINE_SAMPLE_COUNT)
>>           ? 0 : -ENOENT;
