Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653C1C3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 18:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BF710E132;
	Mon,  8 Jan 2024 18:19:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1A810E132
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 18:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704737987; x=1736273987;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tcTvaeA5bwuVE2C9Cw0xOdU20ieFJMTlQKS6mvM6gIU=;
 b=VNhE1HWvSN9R3tUk4ZIeQxw6ohRHtK2Pxxesojg/Ty1z7BNey9QTQXpr
 LYxix+Talz8DmhAI1b4ekrsinTffLcN+j+r3jlRy3QC8HiwdorzPtHiP9
 pw7AQW3SCEbL36mogbmkTsFX6bzY311hX2tSQJXZyNFXa8c/5UTkiA5Kr
 DbjVt+Xbvs6XhqX02pPrz5R9Xg3Yg/MJntpaJS4FN36Oa79IbZVv9eb/N
 RpnO9ZOveax/0ZWUVL06BArQPSS0T61/+nR/HY+MOezhsynyVvYV/Wwjl
 EvXG+NjTnp3NRC3pHq9xZEJSMFh2mwGr6qqeJ4brt4UQrQITag8g3vUBi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4725743"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="4725743"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 10:19:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="954731567"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="954731567"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 10:18:33 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 10:18:32 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 10:18:32 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 10:18:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mw2grEPqst0Yl+RGWOu51MqSQJRBCL/SNRXSHFQBdlnsHeo7uaYZz3Uj0HiCuNY0EV7H6p0fSlsQkW7BSzvvai7OXlvHXve6V4ao7Ehvf75ZHxqdig0YXBYhw+Q3QJazK1zVENAbhr1cqctzXgw2j2xWpNahzKLOSlIQNhhhaVOAsS/dpAXPtIjqhHTtGI51ZDogJg7ntb+rtBAlCJxEJSMc5+RIqMAstfMAppJiY8etbOO5N1EWkRJtB8aD2c54BPTsnMT6bqLUVF5nhKZ5reOw9BC68oLRjhN+A3CpVNUMn0Ud468QBEUzullKf58cXuhi2Qd+Ieizv+sXWMMsrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5N1OlFN9Gkib/Pu5vKCdtvgHQoHSadr23Hw4aVJz+KU=;
 b=PVL0heKAJH9nw9mY3O+xNRyhniXD9TDVN6PESbuFWY9LMTfRIzFESPuv749eo0pMHBpBKss+FQHeL5PjgYBHXp5cpJmZ1VWw3y8XRg2PYLKTIGeW68xRr5DpF3q7EFzJcuE/Ekj4DN6NbukD5gZ4VsgRp9Mes6bbZPsbvYyeVV+89mVrpjDk/uFzoxkuzvoTMwtkzD4F/YVgc+ETlejNpa44K6kPyW39frXjIm4v5GTJTHlsJYrAzLEIUlgm9a+HDxTbM+eKdDBS6ViSAlR37vZYqHitYqNZ1czxFPOdDaNMBUemqWN3Y9mSoCnmizZJsHxiix2amBulefrJ45DtRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ0PR11MB4991.namprd11.prod.outlook.com (2603:10b6:a03:2df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 8 Jan
 2024 18:18:29 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::e4bf:f84b:b278:8ff3]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::e4bf:f84b:b278:8ff3%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 18:18:29 +0000
Message-ID: <8f1ff9d3-c214-40d6-a7a9-cdf0690919a2@intel.com>
Date: Mon, 8 Jan 2024 10:18:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Check skip_guc_pc before setting SLPC flag
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240105003341.124422-1-vinay.belgaumkar@intel.com>
 <2ypah5a7qa5erqw2ha7mj2zs3mblomtnpu2yahu2bbyojblsm3@qvpuxz6cgo5d>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <2ypah5a7qa5erqw2ha7mj2zs3mblomtnpu2yahu2bbyojblsm3@qvpuxz6cgo5d>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0384.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::29) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ0PR11MB4991:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad2c3db-2c28-4a34-f82b-08dc107636fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1U7gzoM5GOKN0rxd7JI51ZRGHxcjsoEIZoZJ/k7JyXfYYzFWecI1GNwSHhVE9KOXlgVatiBxFrTiJoE99NMI51XJQNDEptwXnjdN7CtJmosmWimR4El/3dnXdnxzSQN0kJNKHaCzEIL5rkDawXjMCYrWVNGfoGR8IqKhGChGc/mPX01PjAOxX/RCYpxybij2FDsfePYtUUEU/3QO9fNSPHzFESuuZE1uEw2c9a02zGkRDUyafxO5v53QwUouK0OTFLm5ECgCx/9OSgtMblTUDrff2Y8ecfO+2Rt4XqNpNFM8ALEnF2Z/aJaD5CXm2YJy48K1FWtser5e49nkpfuGSr75RLNOhVQJXs8hvtXTmtQ6yojhdbX3LQtexdpi6xfySJpX8dBrGvknEGzzdH/4nLaNBygYlVAcH78Py9EKTHXGchk23GVM2hPaNXUnqp9Snk5wIhpHw0zSk4lVLQmVY/6JxbBS5R9dt7YgMu9XSm1vZjMXjGbMg3pzAfii5bT+uXQPrucx6RtJ+pG1ocELQzEjDBHieYV2n3C6s2ED4KM1vYcxHQ90+rHfrvPSjP6kzAvIgCSZvq3aJtQOuYi+ufW2uWXZrQGBL5IUmDJFq/ptKzJYmVms1w9SlUlK6FHBaPGfJ6Lt+TEmMngn7eFk2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(26005)(2616005)(53546011)(6486002)(6506007)(478600001)(6512007)(5660300002)(83380400001)(2906002)(41300700001)(37006003)(66476007)(66946007)(6636002)(66556008)(4326008)(8936002)(8676002)(6862004)(316002)(38100700002)(31696002)(36756003)(86362001)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bi9aOHJCUzMvM1NVak5rU3VJd2lMS0dodlZXYS9RWkFSUTNWN2dQTUNlZGU5?=
 =?utf-8?B?QTVoSVZhKzdzTFRmb2pGT2pZOUw2ZThJVGFzczZvejZ1WlZmVzYrRm5HNUQy?=
 =?utf-8?B?S3FmbkdJZUVmTVJ5NGs5OFpEN2JYWDJkekdydnNpMG0xTWY4aDJiSkc4bmRw?=
 =?utf-8?B?aVZDaGhRVVRGRW9EN0RmSmZpZzNuczcyN3p4ZnNFOWNoZXdaWXU1YStCaDds?=
 =?utf-8?B?MlJZNjd3d1EvU0M0UmpOaWllaDBJb3pDb3dXVXNkTkJiV2NtTFdackY4YnZ2?=
 =?utf-8?B?N1phY3ZDdFZxbzdBVjJZNzdjTkJkTHFaMXFqdk5GQUlQQ1p0WGV0bHF3UlBn?=
 =?utf-8?B?QmVxMmxzMGVUV29rdGh3Z1hmdlNnU2c4SDhGVGQyQlFxZGNmUFAzdlZJTEdl?=
 =?utf-8?B?SGZPazhoWlppR1RDK3g1MVdZYlVrZTZXZVpzWUdxR0pnVUJKdm9QOXlZb29u?=
 =?utf-8?B?R0RWYXZ1NVVHQUNuQXRvRDNBR01La1NGeklXajVORURISjhMU3ljYXM1Mzk2?=
 =?utf-8?B?QU9nTm13ckV6T1FUbXpRVVBHVTh1TjJqUWVQTzdyQUpDYnVUOG5DYTBYeHNO?=
 =?utf-8?B?WGtLOGZiV0lNckdsQ1Mxd09MSDZacWNWQ3Y1Tjk0R2hlUmFXc0Q3Q3VxaVRa?=
 =?utf-8?B?b1ZpOFlMdmF1Z2ZqaW9xVWNXbXZNTDFLcW5PK2NldlVlQ05UZXA0aWJrYjlC?=
 =?utf-8?B?bmNpMktaTExNMUVTakk0QzdWUC85K0pGZDNkOXNCVURYVjM3eEc3WkFzZWNJ?=
 =?utf-8?B?MFZJaHYwZDg0OVQ2QlVxc0NVeklpaUppRWk4cVNuOFM0bGFQUDBENGtHRzhC?=
 =?utf-8?B?ZWFya0dKL0dRUW9kUk9pTGZ5MjRldVFISXloMUdnWXQ0NXFFME9BeWd6S05J?=
 =?utf-8?B?K3krTDlLaGN2N2dURWJ6Q1BpNnJmM1dOOTFkRkJYK2hVWlFnQ2daQzVKV0dH?=
 =?utf-8?B?VFh6T3NUMEZTWDF2ZHRyYi9YWWJXRkJyNjZpeWNvZTZRNGZSYTMyOVFpeVly?=
 =?utf-8?B?eFBwbkVyREpZNDZ0enVKTlBlbHFnK1g4VEpuV1JaMWlpMVhYMEt0cjdBTHNU?=
 =?utf-8?B?YzltQUNudWtwY3VQUmJ6clNRdHVPSStUUVFHNzVTYU1GOU0xa2tUTFQ3ODNF?=
 =?utf-8?B?WklubEprajFpL0d3NkwxR3l2bU5Yd3ZzeU90ZnVoRHlieUNhOUgxL2lXMHBu?=
 =?utf-8?B?MERWcFl4eUtOakJjdTlyV3IwbFd3TzlZMkpNU1A3aUVzbXBjZnFUc1h3d3lQ?=
 =?utf-8?B?dFp5UXFOMDlQVXhsVmVtWHRtTWF2aktaaUcrcWd5YVYraWRLRFd4dnJmTUJZ?=
 =?utf-8?B?REhTNUNVeTJSbG50S3lKYnl1TGpGRFNydytrdmpLTTZBLy9LMHRLdy84MHpq?=
 =?utf-8?B?WVJIUDRPRXIwRGZ4U3ljUmdZcGdKR3JEUzU1anZ2Q2RnRkxueW9rY0hMNmxr?=
 =?utf-8?B?TnIxNEhjaHNtRyt1ZEZkZWFmUEk5ZGVrWWNDajgwdjJDQm13ZC95SzNtWFl2?=
 =?utf-8?B?bWhacCtsUEMwdTJOM3BFYnhNVXRZTllxdHJhVUs3T0ZSL20vZEFRYklnRXlu?=
 =?utf-8?B?d0JvV0I3blJudHp4NWoraUJFbW1lb3ZIYUp4bUFEOXpYZTFWQm9HS2ZwTkph?=
 =?utf-8?B?WEtVbEpKY3grMHI0Z0xZV1JWZ1kvVDNWVVNheHpjSEJtQ2hkbHZSa2FBelY1?=
 =?utf-8?B?dTFGcXhkbHluNHNJdjNjTldscmdvOGdBSDl0TDhlRmY2ZXJjNHpDTU1qTE1t?=
 =?utf-8?B?MElzdjB0dDVaR3VkVWFBbWhXVGpvQjBpV2NFUUQ2NzNvSjZVRFJyMXRaUnhh?=
 =?utf-8?B?UlJTYlJ5bnh3MDJqeVdIM0ZOMzRaWkxHR1ZaL1lORFpHcEZESXpJRFlsWmd5?=
 =?utf-8?B?b285NXdub3ZOZTVuOXlvT3RFeWxTdUNwaEZXaUtNSS9ScVBwcm9SczkxOWQ0?=
 =?utf-8?B?RGZwYlQ0SHVsOEtJaXlWcUMyTTh6ZXpyeGFmZVpFa1MxUmhiK1B6WTAvK01W?=
 =?utf-8?B?YzZaUmkvTm41VU0xb283TTlzMC9Nc0tYRHFQMmc1YU5mU295d0xUMCtEbXRP?=
 =?utf-8?B?bjArVFFrOUlIemQ2ZmpycnhWQ3NtVnpQYjE1RnRZSkt4MFh3eGtiVkwyVktR?=
 =?utf-8?B?SFRTQUdBaGo4ZGxDY2FYT2ZPQXBIcjBQOG1kdVFSQW5Cd1cvbWwzd24ybk02?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad2c3db-2c28-4a34-f82b-08dc107636fe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 18:18:29.6699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPo+P1HpnPZ9cKC9XCKLmMwYIDCZXtztu3fjAySF6fHvUTrDxaL2FTcdHjljpgeemWyVSTvplEC1NxEhh1DX/LJedmjgwwbLnPU+lLWLxAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4991
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 1/8/2024 10:14 AM, Lucas De Marchi wrote:
> On Thu, Jan 04, 2024 at 04:33:41PM -0800, Vinay Belgaumkar wrote:
>> Don't set SLPC GuC feature ctl flag if skip_guc_pc is true.
>>
>> v2: Skip the freq related sysfs creation as well (Badal)
>>
>> Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is 
>> set")
>> Fixes: bef52b5c7a19 ("drm/xe: Create a xe_gt_freq component for raw 
>> management and sysfs")
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_gt_freq.c | 3 +++
>> drivers/gpu/drm/xe/xe_guc.c     | 7 ++++++-
>> 2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c 
>> b/drivers/gpu/drm/xe/xe_gt_freq.c
>> index 3adfa6686e7c..e5b0f4ecdbe8 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>> @@ -196,6 +196,9 @@ void xe_gt_freq_init(struct xe_gt *gt)
>>     struct xe_device *xe = gt_to_xe(gt);
>>     int err;
>>
>> +    if (xe->info.skip_guc_pc)
>> +        return;
>> +
>>     gt->freq = kobject_create_and_add("freq0", gt->sysfs);
>>     if (!gt->freq) {
>>         drm_warn(&xe->drm, "failed to add freq0 directory to %s\n",
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 811e8b201270..0e112b144ec8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -62,7 +62,12 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>>
>> static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>> {
>> -    return GUC_CTL_ENABLE_SLPC;
>> +    u32 flags = 0;
>> +
>> +    if (!(guc_to_xe(guc))->info.skip_guc_pc)
>
> I was about to apply this, but then noticed this weird parenthesis.
> Did you intend to do !(guc_to_xe(guc)->info.skip_guc_pc) to clarify the
> operator precedence? Anyway, the parenthesis is not really needed and
> also not used anywhere else in the code base
> (git grep -e '_to_xe.*->info')... it's actually confusing.

Ok, we can remove the parenthesis in that case. Should I resend with that?

Thanks,

Vinay.

>
> Lucas De Marchi
>
>> +        flags |= GUC_CTL_ENABLE_SLPC;
>> +
>> +    return flags;
>> }
>>
>> static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>> -- 
>> 2.38.1
>>
