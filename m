Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1A9C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 12:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F96410E182;
	Fri, 19 Jan 2024 12:19:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4151310E971
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 12:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705666740; x=1737202740;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZfuulHLaN1pDQUu9MxASZZ2VPEDN+R5oZm03vgCjOtg=;
 b=NPBQMCO4GAZa4Dukmm2ngHc96JdJNztMg1Wja6UjN7k9Hn+3pAiEz1Rf
 02GJY2BSEGDJfpIjf+3aMDWwx7jqAKr5oLIEISpbsXKpWpXjJXTMjlhDT
 CoYC8es1Gax/Xbr2YbgkF0p50Z9Rrm6g7xjW9WL9WVMRoDhUhOGKB+6MH
 A5e3K/1RjbupyT1WEVAwH1U5FgFTZvu/7fNZe+DhivTDyt5JekNhpLnhL
 bVLiW9vBWwJFRuR80pweW4gPCtmBCduAuwxNrLSwfOavfSOARm3d+IJYO
 B+6n9DJQxfKpMy7b32C5DkVYISkMpF78PTXxYI8pxacjC06IOo+WMDH8w Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="14254439"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="14254439"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 04:19:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="645569"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 04:19:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 04:18:58 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 04:18:58 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 04:18:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhUQNLy8cQdkQ6cSi/jzL3c4S+ro48X2uu8odNA9mt1lqjAis9RPdf5/HPcAmyQGz+PY92t2CQ3rNrdhvRZdNIiOSr1z70kI3JFg9Xjvczan0B8XAMR4JxtCMUzID47OMeXoKUN9CNN3qKLOOE13CqZCgMJr7QqF7rEiZjVnBS+4AcC7VZ+dXsof/S+OI0Vrq2wR6L2HYgEQELXnNkqYv5VLz+cw6lpsniVgYQb+E80cLHXXp15NwkZNp1G5Ajvji9cmLk8OedwsF6sBKM1M+5R43wWaouVRKd6PEqOcGJ3EkRjCMxbQSaE8zSiKncHCKyUVmMOd8bE6Bx86R6CDaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CdndbkMblJMBhgsHlIcF9pQw0EUQHi6eecD5CwNw5w=;
 b=fLGe4wyNz50gaLpO4DOxQIid9l5p7FQn9KLdLb2b7SanY5cRlERtyKt5m+FWhGHhrbQsLhk7GNoO7rXmOPZeNwaOGajPDTzZyD71+Jinv+n0Wx71zxFSRGA+cfgIkMmUVtCbMiJ1hhLqWuL8Hk6CTr4pG5ciQ38yWcPJ5qKJZHdZoKytZp/K6enh7t6FzH/QOUYJCM6gjpEn1ZKU+uUNZlHeW1eeJ88ZShym0p/UIShNZSBj8kLaCHPiQoRcQ17a2ftHCBa83eWXkTgND9DGXpkCVBYMMMem7g9l0sEJMOtHujFeO3NmFMIWaHzTHXeknzouodCiBqX2/jIwe+mbDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ0PR11MB4863.namprd11.prod.outlook.com (2603:10b6:a03:2ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 12:18:56 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 12:18:56 +0000
Message-ID: <7fc421ee-f10c-47d7-8815-d14d8ddf8714@intel.com>
Date: Fri, 19 Jan 2024 17:48:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] drm/xe/guc: Expose engine busyness only for
 supported GuC version
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231222074602.817518-1-riana.tauro@intel.com>
 <20231222074602.817518-7-riana.tauro@intel.com>
 <18424588-8d90-4c5b-8b25-e652e5288349@intel.com>
 <0289da11-2c4f-403e-9ac8-9e335318ae43@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <0289da11-2c4f-403e-9ac8-9e335318ae43@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::6) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ0PR11MB4863:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5a0732-a795-42ff-d589-08dc18e8cefd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SPanCqndSXlfdftx0T2m0sWgd9U7wDlQ1pgR09zAlwLUEWckqygu4TjeYPZFBbfek9W0WZshT05K03jNwzzBjGY/vHHiiRJ5YBX3SkzFn34OSHe8I/lVExHviXVWz89rOGeoMX//wVSo4WOqrhkNw9EAT7Ms2FSiSMextqLVFVHYXmMxkzFEfQZRGtDest+kWDjXHzAHJ5VcOq7XByTgx7rxy/Rn1ia84ce8qVpqcLM/l53jFZs7WBS03Z1q9nqGwGo16zjYacyVv2eWeAyKY8RIxozl/r0c47ECeMJtgJsu1EQY1oH3XR/7ErEll2PvmwWq7IvC6EYl0Sxe6f30PlyaNrEreHMirJy3SMbMmrsd7/EOgReTsVSd4qnkQOgFWko5OjOUahHd3qHPHWQ9FUgdj6M2hwg9Ovo+KmgQBrXzoIItdDK5eJOabmcH09dv4qLN0kIh/JoQFtBHxhsfKh9fFBM9wlzQzkMUSxlGkIWwYx4Mu0vh5SFTjRaIz1W1mxbYR0XJRWpcheXlbuwaUwRsg8Jphu1tvP4VMPYJyajbm7IoxYhsGZT/WBTaWx1xESZnvfc+zwp+Dowu44OY2uQbc4lwfeGsZg5vgj4tjo4d470MfjInQObOL0lCdkFfwB/1a9A2JF6j6WsX3YT0Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(38100700002)(66946007)(66476007)(316002)(66556008)(31696002)(6506007)(86362001)(478600001)(6666004)(53546011)(2906002)(6486002)(8676002)(8936002)(36756003)(5660300002)(31686004)(26005)(2616005)(83380400001)(6512007)(41300700001)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDBkRjNFMWs5YlpmR3RydHFweHRzUTIvMFdPeEhxQTRKWk1sM2wvWnVwZ0Iv?=
 =?utf-8?B?djRlSm1IdCtVdkZLWUN6N2o4L0pyclE0NHFkR29KMVlGV0tZYU1qeFBobC9k?=
 =?utf-8?B?VnFzZm1lOUk4SUhwMFZPRTJmWGZBTWZHV2FncDU3ZmZsMmJHQlg4ZFBUeWw4?=
 =?utf-8?B?QW9OR0lxOGljZC9DaGpPalptU3FRZHZVeGNYMjgwdkpQenVYVk94NGIxTVl1?=
 =?utf-8?B?T1pYdmNmOWRPbHFhZGJZVCtPUnBaZXhLS1Z1UmVLSW5NRDJmeG5zb0dNcFF1?=
 =?utf-8?B?eS9helhEeGZQSkZjY1hyTThSS2J5UjBhamt1d1pteUVrNmdPdWRDWFNUNFlD?=
 =?utf-8?B?NTQyWVJhZWQrT3d0SDN3YzZTMGZ2RGNQSGUzVlRmQTFhWGNlbGFITC9VQ2NZ?=
 =?utf-8?B?TUFVNnNvbXorVUJwenlVa204VUJRTEc4TVl2ZytwTjVFcTZoSFVFTklIUHdq?=
 =?utf-8?B?ZytUbEp2emt1Z1IxSTBvWkV0R0pTc0NtVStmN2VTZXpSMUZFTmNaQUhKVnRv?=
 =?utf-8?B?Szl2OEZ1aUY0Sk84YUNnOFBEc1p3K0l1SEpQaEJvWDVhZTFoZGpjTWdtMmto?=
 =?utf-8?B?U2t2SkU0UjU2c3hCZ0FIK1YwU2hRbTZZbkQ3QzhNU05wZnp0RHh0aW8zcWpP?=
 =?utf-8?B?aDlucTk0NlBzL3h3ZDR6U2Y0QnhuajRRYXYrdjFNR21ZQ1JMcU5CZGhQR1lw?=
 =?utf-8?B?anZLaXN0djRkUnNVbEVRT3FOR1l0Q3Y1VFRaek1Ud2R5S01mRVpYaml2N3Uz?=
 =?utf-8?B?NzdBRFdmYWZjVHhZeUtyTFBHbldoQW5rdHkydFlHRng4dmtKaEpDOXMydEFq?=
 =?utf-8?B?VmRzRDlCdW1MaXlaVFF0a0paSUZtUUF1b1FUanM3bzYxZW1NZ3I1b1pHWFdj?=
 =?utf-8?B?R2NGemRmQkIwMzdMbGFKdDQ1K1FWWlMyV3FjUVRham5KdTlnbjUyc0JxS3cv?=
 =?utf-8?B?S1BQUGlzR2xRemc0U3E0YlJEbTU1bCt1L1QrckN1MXd2MGNxWjMyOTR0WUJp?=
 =?utf-8?B?UHVKYlhoM1RFVXVuT25ON3lRNEUyU3JvVjdmSnljbGhob1ZjcjNGVmU3cjFX?=
 =?utf-8?B?V2g2VHlCaG1NRittenRMSFFHNEx3OXExSWRINE80VGxTUStpb1NLeWhRUWZu?=
 =?utf-8?B?TFQvUTM2Mm44c0xjWVcyZ2owbCs3YTZhOFBmZExmNGdoVGxnYWxTWUgrUkdD?=
 =?utf-8?B?NEswY21qdzI4Qnh1cXIyMU1uOFpYTTJueWZHN3hZU282ay84VFU2NE5MNDEx?=
 =?utf-8?B?UjZDQXhuRldxUy9GbnZlUEZva2RQWWI5RkhPd09OeXNTbW94LytYT3JBcjRB?=
 =?utf-8?B?cHlFNDJielNhQ28waVoySnNQUk5vZG0yenZYMGtLVlZma2pwWXV0RjRTYm1J?=
 =?utf-8?B?SkpUM0IvZm1QWFdCWlRNM0VreU9JbmdZbGlKdmxPRk1WYXBDcHBHeW5MaUVI?=
 =?utf-8?B?VStvYWdxTW9aUEFPd01sNER3WlVWc0w2bGpFZXM2MEFBakxsbi9KMGZLR3pM?=
 =?utf-8?B?V0FRRzdROEFJMVpRdjVGZjBVWXRKa2pDNW5RS0cyYlEvZ1gxTHh0dVl6ZlpI?=
 =?utf-8?B?TkQzRENmK0dRMHFJSmJjNFVKZFFhQkJFME9YQkg3RU5PR0xnTzEzUWRPa25J?=
 =?utf-8?B?a0NGSjBXQVBwcXZOeGx3UC9sQWlENE9NWHRGeENLa0lLMzR4UWwzMVlhcHVi?=
 =?utf-8?B?S1pUK01KWEk0VmdyMUFPd0VmQ0o4TjNVZmt1UnJSdXJDSHZUOHVpSzMxblMx?=
 =?utf-8?B?cWpZdC93dEpXZ1dNWVlLOTZpSWxRTGdQZnNmalpnTTUzZldxd29kbVY5clBQ?=
 =?utf-8?B?MThubWRJeEhsUGVTTk9PRERiTktTREZWYWFUbC9CUXZIaUdSWmlqMzlYUFlE?=
 =?utf-8?B?cG5BbUZHbis5RnZlYUZKOHV5c0pnUSs2cVF5SkNVbGlVeGNnUlZLQ1VZYXY2?=
 =?utf-8?B?TVlSWU4xZmxFWnJDRDVGeXJwNHdlMkxWNHJ1bHp0YXBzRWJKL0NVVWhsa0FB?=
 =?utf-8?B?Z1U1SGhFUFUya2JvandiWCtiNFNldUlJK3BhelVBOUhHVldFYmNMQ1BvNWtx?=
 =?utf-8?B?K0RZdStHb3VjcERwU3d3cVVNUmpoSjcveHJTVE5XMjcxZzdva3Q2eXlMVTEy?=
 =?utf-8?B?K0V3Qm5haUF1SWlnMUNCNHk3OWxIWVdzMDIxc0N3WjYwUDNoOHpMT2ljaTF3?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5a0732-a795-42ff-d589-08dc18e8cefd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 12:18:56.6699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lr+GV5Aep5cjUymyFEQ7I+o2H1f+Wf4dXKdU99xzqwOvza48bFH7hfsMisk7pAnI37t82dRdZMp4f0zWkp7xGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4863
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



On 19-01-2024 15:43, Riana Tauro wrote:
> 
> 
> On 1/18/2024 11:43 AM, Nilawar, Badal wrote:
>> Hi Riana,
>>
>> On 22-12-2023 13:16, Riana Tauro wrote:
>>> Guc version numbers are 8 bits only so convert to 32 bit 8.8.8
>>> to allow version comparisions. use compatibility version
>>> for the same.
>>>
>>> Engine busyness is supported only on GuC versions >= 70.11.1.
>>> Allow enabling/reading engine busyness only on supported
>>> GuC versions. Warn once if not supported.
>>>
>>> v2: rebase
>>>      fix guc comparison error (Matthew Brost)
>>>      add a macro for guc version comparison
>>>
>>> v3: do not show pmu counters if guc engine busyness
>>>      is not supported
>>>
>>> v4: add version check comment only in the check function
>>>      remove it otherwise (Umesh)
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt.c                  | 11 ++++++
>>>   drivers/gpu/drm/xe/xe_gt.h                  |  1 +
>>>   drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 37 +++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  2 +-
>>>   drivers/gpu/drm/xe/xe_pmu.c                 | 12 +++++--
>>>   5 files changed, 59 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index 5825471a3422..a48cceaa7750 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -800,3 +800,14 @@ u64 xe_gt_total_active_ticks(struct xe_gt *gt)
>>>   {
>>>       return xe_guc_engine_busyness_active_ticks(&gt->uc.guc);
>>>   }
>>> +
>>> +/**
>>> + * xe_gt_engine_busyness_supported - Checks support for engine busyness
>>> + * @gt: GT structure
>>> + *
>>> + * Returns true if engine busyness is supported, false otherwise.
>>> + */
>>> +bool xe_gt_engine_busyness_supported(struct xe_gt *gt)
>>> +{
>>> +    return xe_guc_engine_busyness_supported(&gt->uc.guc);
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>> index 9bac85cdf609..bef99eb2fed2 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>> @@ -42,6 +42,7 @@ int xe_gt_resume(struct xe_gt *gt);
>>>   void xe_gt_reset_async(struct xe_gt *gt);
>>>   void xe_gt_sanitize(struct xe_gt *gt);
>>> +bool xe_gt_engine_busyness_supported(struct xe_gt *gt);
>>>   u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine 
>>> *hwe);
>>>   u64 xe_gt_total_active_ticks(struct xe_gt *gt);
>>>   /**
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c 
>>> b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>>> index 24e72555647a..2dd06563d0ad 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>>> @@ -32,6 +32,9 @@
>>>    * engine busyness % = (ticks_engine / ticks_gt) * 100
>>>    */
>>> +/* GuC version number components are only 8-bit, so converting to a 
>>> 32bit 8.8.8 */
>>> +#define GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 8) | 
>>> (pat))
>>> +
>>>   static void guc_engine_busyness_usage_map(struct xe_guc *guc,
>>>                         struct xe_hw_engine *hwe,
>>>                         struct iosys_map *engine_map,
>>> @@ -110,6 +113,9 @@ static void 
>>> guc_engine_busyness_enable_stats(struct xe_guc *guc)
>>>       struct xe_device *xe = guc_to_xe(guc);
>>>       int ret;
>>> +    if (!xe_guc_engine_busyness_supported(guc))
>>> +        return;
>>> +
>>>       ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>>>       if (ret)
>>>           drm_err(&xe->drm, "Failed to enable usage stats %pe", 
>>> ERR_PTR(ret));
>>> @@ -122,6 +128,28 @@ static void guc_engine_busyness_fini(struct 
>>> drm_device *drm, void *arg)
>>>       xe_bo_unpin_map_no_vm(guc->busy.bo);
>>>   }
>>> +/*
>>> + * xe_guc_engine_busynes_supported- check if engine busyness is 
>>> supported
>>> + * @guc: The GuC object
>>> + *
>>> + * Engine busyness is supported only above guc 70.11.1
>>> + *
>>> + * Returns true if supported, false otherwise
>>> + */
>>> +bool xe_guc_engine_busyness_supported(struct xe_guc *guc)
>>> +{
>>> +    struct xe_uc_fw *uc_fw = &guc->fw;
>>> +    struct xe_uc_fw_version *version = 
>>> &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>> Why not XE_UC_FW_VER_RELEASE here? Or should we check firmware type 
>> (compatibility or release) first and then derive version from it.
> Hi Badal
> 
> Even Release can be used. Used submission version (VF compatibility 
> version).
Ok
> Why do we have to check firmware type ?
Sorry, I was confused in release vs compatibility.
> 
> However, This patch is currently on hold.
Ok

Thanks,
Badal
> 
> Thanks
> Riana
>>
>> Regards,
>> Badal
>>> +
>>> +    if (GUC_VER(version->major, version->minor, version->patch) >= 
>>> GUC_VER(1, 3, 1))
>>> +        return true;
>>> +
>>> +    drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
>>> +             "Engine busyness supported from 70.11.1 GuC version\n");
>>> +
>>> +    return false;
>>> +}
>>> +
>>>   /*
>>>    * xe_guc_engine_busyness_active_ticks - Gets the total active ticks
>>>    * @guc: The GuC object
>>> @@ -133,6 +161,9 @@ u64 xe_guc_engine_busyness_active_ticks(struct 
>>> xe_guc *guc)
>>>   {
>>>       u64 ticks_gt;
>>> +    if (!xe_guc_engine_busyness_supported(guc))
>>> +        return 0;
>>> +
>>>       guc_engine_busyness_get_usage(guc, NULL, NULL, &ticks_gt);
>>>       return ticks_gt;
>>> @@ -150,6 +181,9 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc 
>>> *guc, struct xe_hw_engine *hwe)
>>>   {
>>>       u64 ticks_engine;
>>> +    if (!xe_guc_engine_busyness_supported(guc))
>>> +        return 0;
>>> +
>>>       guc_engine_busyness_get_usage(guc, hwe, &ticks_engine, NULL);
>>>       return ticks_engine;
>>> @@ -173,6 +207,9 @@ int xe_guc_engine_busyness_init(struct xe_guc *guc)
>>>       u32 size;
>>>       int err;
>>> +    if (!xe_guc_engine_busyness_supported(guc))
>>> +        return 0;
>>> +
>>>       /* Initialization already done */
>>>       if (guc->busy.bo)
>>>           return 0;
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h 
>>> b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>>> index 57325910ebc4..e3c74e0236af 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>>> @@ -14,5 +14,5 @@ struct xe_guc;
>>>   int xe_guc_engine_busyness_init(struct xe_guc *guc);
>>>   u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc);
>>>   u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct 
>>> xe_hw_engine *hwe);
>>> -
>>> +bool xe_guc_engine_busyness_supported(struct xe_guc *guc);
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>> index c2be157a6f5d..f91652886b67 100644
>>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>> @@ -55,14 +55,16 @@ static int
>>>   config_status(struct xe_device *xe, u64 config)
>>>   {
>>>       unsigned int gt_id = config_gt_id(config);
>>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>>>       if (gt_id >= XE_PMU_MAX_GT)
>>>           return -ENOENT;
>>> -    if (config_counter(config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0))
>>> -        return 0;
>>> +    if (config_counter(config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0) &&
>>> +        !xe_gt_engine_busyness_supported(gt))
>>> +        return -ENOENT;
>>> -    return -ENOENT;
>>> +    return 0;
>>>   }
>>>   static int engine_event_status(struct xe_hw_engine *hwe,
>>> @@ -71,6 +73,10 @@ static int engine_event_status(struct xe_hw_engine 
>>> *hwe,
>>>       if (!hwe)
>>>           return -ENODEV;
>>> +    if (sample == DRM_XE_PMU_SAMPLE_BUSY_TICKS &&
>>> +        !xe_gt_engine_busyness_supported(hwe->gt))
>>> +        return -ENOENT;
>>> +
>>>       /* Other engine events will be added, XE_ENGINE_SAMPLE_COUNT 
>>> will be changed */
>>>       return (sample >= DRM_XE_PMU_SAMPLE_BUSY_TICKS && sample < 
>>> XE_ENGINE_SAMPLE_COUNT)
>>>           ? 0 : -ENOENT;
