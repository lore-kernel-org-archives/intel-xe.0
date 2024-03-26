Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C857DC54E58
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 07:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F1810E3CF;
	Tue, 26 Mar 2024 07:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfOHeb+V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0332510E3CF
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 07:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711436942; x=1742972942;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=lQ/K72Vro6zrrq0S3O5gQHztVixh9fAhWZ2foGefBJQ=;
 b=dfOHeb+VXnWugE31sah9oD+XnHUZVDOAiu4vxiCErOsK5osB3MeiFpzJ
 3U/kozzD4XxeWzNzYVMR3DRHrqJ1J1pjP9ObpU8pAUF3kcSf4DiVb0BlI
 0x+4Si10VxvrAwmhFnEs+rzjjf32z/Wky8ix2XVlyGKwSOKBi+Itt2GNn
 vCb5DUZ2c7gnviJVITcKqkPBKf1n99mIwU+7pGo1NoRrPAn012DYJuNhh
 UR9E1fTF1J4PcRd8BrfER+bGv7gnZLj2AZ+GRnJ4I0v933qyLmggAWlcO
 mM5hQLPKxRcelfi9LbUGmMaBS1Je/goHwg4fYG+1wRMJlTJgzbNT/CC2H w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="28953056"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208,217";a="28953056"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 00:09:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208,217";a="16532244"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 00:09:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 00:09:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 00:09:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 00:09:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 00:09:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6XgAzS92GBmux+DcGlnMBVAag3xVug0wvfy4QS/7g6AK7e35QZrG3sDwxH85mUOetdYk9op8eBGyCO0Dnhncl81viNQhd7PvTgQYsd+c5UbIohmhZkd7ts5b1Wz1px4zFTBWymVq5W2O+DNg7o7fW3d7UbR3yh83xbqBzro3/ha4p9IeUDapUwlgopfWeYHB/dM8swfB41+yCVrXkKxnpo2l+osndl/rCScFiRBMLRKbC3uJNeLyabuPZuUxGMr1EAEjdzyWFDLFKXlYz9VXxEVw+k5+Pj8wIAsVqKpSejfYzs2VT6h34AWic0h+2gv7EF4Up0SXKDWuWk2r4XugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oxm7Oidvp9A8AKjJrW/9LVYJNPhEeTjpidhUbbsHrBY=;
 b=Cc2+Jyu0yCHivQ7buEyAxazNZg8t5jb0V3cr+CglyWTolHZrXUTn+4Eo6lj7okqtI3nt3ts2jFNNe7n5npljP3FTTzW4Wh3S+qUizCynRtbuSQPnxvhSWy8vOFVYrckL3zrM3yo5DK/VzyGizTMPA+S9QF7BD2w897jEDIbRRx62WUXbg0NV6JHFekBPJvDzBPmqZUnKFl25PTRltiZEuUwxKeJCnLBit3AU3+OX2ybF/sGqQpR5uypZWuPa3VvMBTvXMFwDyC9r+1wsYNbBegUs9Yr5PkLGSWb0AoRV3PzfcPggx9YKKX2RyHtSUEm9phOBh02Bz/cSCr6AuziNGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 07:08:58 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 07:08:58 +0000
Content-Type: multipart/alternative;
 boundary="------------HSHXt9DbHNyjh4B9vfKdtSwH"
Message-ID: <3756f73d-5607-4c43-a803-fffe4fe16695@intel.com>
Date: Tue, 26 Mar 2024 12:38:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Use enum instead of hard coding
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240322031558.3343719-1-himal.prasad.ghimiray@intel.com>
 <ZgJhpTlz6OfqiaQg@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZgJhpTlz6OfqiaQg@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: PN3PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::11) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN0PR11MB6277:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eTN/VBPiG3shyvWv9ocE35esMVz3N/qYX+/D9NWdDSunKNafs4w9Wovq9Rb14xTpGaRM69Pv7NQqwjNvFA6zwx4LkYq+h0n8jNTQtaPOBYqpnOmQXDtaJruIjzZ8isL7NCVN1JJBIJ+BCM4XU70CzhdKRh7yLcG4D69jQ1wLueHsromvP11w9ib90Kf5xB3ZBQLtHVZsqpQyI6m0O4WUNmajpwPpQFBDsD7U6TA03qHXZa73181lafCqcR0LwwfEM+IO2AyVs8im8RHp3/vAH70hto1Varkc8/V2DfqDVk6R0cbCUHB8u7KBI6RiOZBYHQIjsZssc8zmtXbteA/Lr6PBsF8JSg4B1mZ5ZibUADrwvQ+ySqjSB5M8SmBMvHPYjWFPtGf+CDNcRi+G2rcqGTTBkxaDhIOq3ZHzzg3VHDiTuIJ3ZHnCvUMeUFbUg6f2Uni8LHDlLzoWZA6AP00KVpV4ykGReioep5Xs4aZ8gqNWXiCPjk9eKl+CfIufQDPCc7NGUoEClw3DeJ5AX0FHTk7fyNeSrS+fHjPfC3rkJ+Ou2r1mQQ5QNpauh68ekX8OSvEXMPmcAyUP/V/yHUkWpLcZXKMbIWWElSPf+APAzY0JflHLFWOeY3ic6q3qMuzJgG/52cmwTYAVIMo2VNWH5Xxy9wEomdLnwHlo/L2rH0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVRFdkIvUUNIa0RFSitaRmMvbGFxckhLZWlobHFzZ0hHd2RmRkQ1alJ5KzJw?=
 =?utf-8?B?UHNPbWE1WU5hY2RLbm9NUmxqbzR1a3lvK2ExZ0FiR0dDM2lRSjNSTGxQMjNv?=
 =?utf-8?B?R1E0aVRqaEtLblNUa2lBMVpMcTJvVVQ3aldaU2JQVi9CazU0YlVJVU1YZTNU?=
 =?utf-8?B?U1JMY1dyNlY1RUFTTzJoeFQza1RXd0xxU2lwdExaUG44eTZURWZBYzRIblBX?=
 =?utf-8?B?UWxvdTV1UHpjUG5XVEIvTUpnSmZES1NRWjVNSUplOEVYNEgzV1ZYc1pRRE9p?=
 =?utf-8?B?bmdNMDFJSDYxRXgrQzk4SUttWmpqc09kM2tCbW0xUksxbDM2akpCN1Q3dW16?=
 =?utf-8?B?VEU0ck94U29RUG15c2ZlazJWc29SMTBFdm5OQ2xqWmRLZTkwNUNJN2M2dmh0?=
 =?utf-8?B?V2Y1L3ZMNlZCeVU4d3VOMTdIbEVRRXc4dm5yL0pMQUJDeDBETlRxbmZ3eGha?=
 =?utf-8?B?RUVjU3hFc2NOMVVzNG5UMzlNd3hYNTlveVhVTWQ2Q1pIU0hMSlVqc0ZrZjVi?=
 =?utf-8?B?Q1ZMR3k2TytPWlFJZ2doTmpmU1BTbXhLbGh3OEg3SDZlKzVjY0pHNjNhVEMw?=
 =?utf-8?B?bFZwM3E1NjFyaGtKNStGSURoZGdJWXF4UHlzN2plWDJCUm5idWJVbFRtNmt0?=
 =?utf-8?B?M0l2UTlCaHNJcU5OTW1yT0dEd2xrTXNEMUcyOHM2RHBBTmJrSW15d3ZXRmta?=
 =?utf-8?B?bWtwTjlRbDYycTdBVTVsVzU4b1JOMDlYWU9yK1ZuUjRsSndCN0RZdlUvZlg4?=
 =?utf-8?B?Y2VQajFTNkY5SW1aRXA4dVNjYStFTjV3WjdIQnM1ZkswaVRVQS9rb1d6OFRO?=
 =?utf-8?B?Q1YzU1M1SWcyZkZEL1BjUmJoT3lDR1Y1NTlVL2gycDZHTEVHOXREaTVyQmY2?=
 =?utf-8?B?VmpDZEljbFl5ak9aOS9jTnpPNlJ0Y0REOGwrK3dZRTZhVHhiS0lVUjg3L3Bu?=
 =?utf-8?B?cGhvQ1F4V2tiV04yVWEyVmtmKzJQSldIb0R6OTB0TXFxeDVDWDVQZGpqZ0tw?=
 =?utf-8?B?M3RCamp5SDJVbGd4VUNOUXViQ1ErWEIyYm9Td0ZYUnMvOE5hb3VCaU0yT25a?=
 =?utf-8?B?VS9DOUY1ODJhbE5ZV3oxWCtqa0ZMVDNVR0kxUE1UdnNWU1BIck1uRXQ3aU5i?=
 =?utf-8?B?NHBoVWtBcmt5WGdXRloxNWZ5Nm1LYVg5MHlZZmVqL3ZsNjF2VGt3UTlNOHdP?=
 =?utf-8?B?NWhOZmxSUERVdXBZYmR1Sk1xOERzcjJ4WGg5YWVlYitybjlxbk1yemk2OXhI?=
 =?utf-8?B?NXF4TnY0aDFzeWlVTkx5Uzlzc3draHJtTy9FcmdmWktTNmdrV0VzdW1LV1lG?=
 =?utf-8?B?SmVQb3BndHYxaXkvK29MYWFYdVFuZHRUUXNlV3RpZ3JKcThIWnhiNFhXQUdr?=
 =?utf-8?B?aE9iNG5TV1FOZE9WWldrN0FRVlA5OHdmK3J2ZDBzYU5QeFc3Mmt0aGZPRmZv?=
 =?utf-8?B?bGh6U1hydGxNbm1IYWhNdS9GRll4NDV2Wmx0MVhnUlNhSGVhMy9wR00yN242?=
 =?utf-8?B?UE9VZEpKMTZoMnliV3hqTjI0VG5MUzk0K0ZvUmpXM2hNUUwxRXRFSDFuMWJt?=
 =?utf-8?B?eEhhbTFVTEdSRU9vbFBFaTBxK1I3Wm1qNFZUK1MvbXlNSnYvUFNpR3NWcFFi?=
 =?utf-8?B?TFJVaGNvemxUNE1MeU9KdmpMbjdrNk5rSlV1TXRxSTk1bWUrYmVOTG0xUk1h?=
 =?utf-8?B?ZjBvTXQ0THdISkIybW1rL0RQZlVXYi9iWng5cW4yODFHd1kvVzlZOHVINnRt?=
 =?utf-8?B?S05vak9zdzRKOFFmUEIyWGFUK08zMWZrbEh6REZRc0VWOXVadjV3VVF3MlVn?=
 =?utf-8?B?VUN2SUxLQmUrS21kYUpHNDlHQk84VWNXL0I1aW9ZOVd3K1kvdmlVZ2hNL085?=
 =?utf-8?B?VnpqaDk1elV4SFZGb1BQTldBaE5hL0pRb0ZKZ05CTTNZcXRUL0J1RGlrdDZB?=
 =?utf-8?B?aFNzcDRFR203bGVsdDBIeE9QeDlxdzVZZVdvOWkvam10ZE9aNzVNV0pKZ2cx?=
 =?utf-8?B?ZGptNWZJb0oxdkFWUkZNSWlUdm80UDZvamFaMXF5R01LZEdRa1pham5hT24x?=
 =?utf-8?B?NHZOaEV3WDU5OVJxSTAvR2xwclZlK3dSaGh0dGQveFB4VGNhQktOaDhETTJP?=
 =?utf-8?B?RGZSZ0lEeWIvYm9OQTBSYmZGL2g1dW9sakpMOVlaNUZXejV2aGxpZjZ4QzlI?=
 =?utf-8?Q?XN0sNG2r7hYAI79ylEdTULo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b166c43-c9d9-4a68-420c-08dc4d639b0a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 07:08:58.1044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UgFl/Ddz3CvLHMiXsYp71t3tr3q5EBXDKRVsS4Lou87yL+bk9dNOlbepwL1F9OeDFmboaSWoVMgSNjllTMIIJs9q7sbIpmIBj/2jqPJMAao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277
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

--------------HSHXt9DbHNyjh4B9vfKdtSwH
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 26-03-2024 11:19, Matthew Brost wrote:
> On Fri, Mar 22, 2024 at 08:45:58AM +0530, Himal Prasad Ghimiray wrote:
>> Instead of hardcoding the value 0, pass DRM_SCHED_PRIORITY_KERNEL as an
>> argument to drm_sched_entity_init.
>>
>> v2
>> - Make changes in xe_execlist too. (Rodrigo)
>>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> Reviewed-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Hold on, this is intentionally set to 0 not DRM_SCHED_PRIORITY_KERNEL.
> In Xe we configure the scheduler with 1 priority level, thus the value
> has to be zero. i.e. if enum DRM_SCHED_PRIORITY_KERNEL changes to
> non-zero we are broken.
>
> Better leave as is, or add new define like XE_SCHED_PRIORITY_DEFAULT == 0.
>
> Matt

The function expects a parameter of type |drm_sched_priority|, and a 
static analyzer flagged our usage of hard-coded values.
Upon reviewing the implementation of |drm_sched_entity_init|, I 
discovered that the function is already safeguarded to handle
priority levels based on the scheduler's run_queues. Notably, altering 
|DRM_SCHED_PRIORITY_KERNEL| to a non-zero value could
potentially disrupt scheduler initialization itself (i = 
DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) .

Therefore, utilizing it seemed like a safe approach.

However, defining |XE_SCHED_PRIORITY_DEFAULT == 0| and employing it 
doesn't seem logical.

Hence, if you perceive this change as risky or unsafe, lets drop it.

BR
Himal
>> ---
>>   drivers/gpu/drm/xe/xe_execlist.c      | 2 +-
>>   drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>> index dece2785933c..57d3c11da591 100644
>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>> @@ -341,7 +341,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>>   		goto err_free;
>>   
>>   	sched = &exl->sched;
>> -	err = drm_sched_entity_init(&exl->entity, 0, &sched, 1, NULL);
>> +	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_KERNEL, &sched, 1, NULL);
>>   	if (err)
>>   		goto err_sched;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> index 10c6bb9c9386..1f712f4fc76a 100644
>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> @@ -63,7 +63,7 @@ static inline int
>>   xe_sched_entity_init(struct xe_sched_entity *entity,
>>   		     struct xe_gpu_scheduler *sched)
>>   {
>> -	return drm_sched_entity_init(entity, 0,
>> +	return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_KERNEL,
>>   				     (struct drm_gpu_scheduler **)&sched,
>>   				     1, NULL);
>>   }
>> -- 
>> 2.25.1
>>
--------------HSHXt9DbHNyjh4B9vfKdtSwH
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 26-03-2024 11:19, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:ZgJhpTlz6OfqiaQg@DUT025-TGLU.fm.i=
ntel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Mar 22, 2024 at 08:45:=
58AM +0530, Himal Prasad Ghimiray wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Instead of hardcoding the va=
lue 0, pass DRM_SCHED_PRIORITY_KERNEL as an
argument to drm_sched_entity_init.

v2
- Make changes in xe_execlist too. (Rodrigo)

Cc: Matthew Brost <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:matthew=
.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Signed-off-by: Himal Prasad Ghimiray <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@inte=
l.com&gt;</a>
Reviewed-by: Rodrigo Vivi <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Hold on, this is intentionally set to 0 not DRM_SCHED_PRIORITY_KERNEL.
In Xe we configure the scheduler with 1 priority level, thus the value
has to be zero. i.e. if enum DRM_SCHED_PRIORITY_KERNEL changes to
non-zero we are broken.

Better leave as is, or add new define like XE_SCHED_PRIORITY_DEFAULT =3D=3D=
 0.

Matt
</pre>
    </blockquote>
    <br>
    <font face=3D"monospace">The function expects a parameter of type <code=
 style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-box; --t=
w-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-=
translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-=
x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-=
scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-grad=
ient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slas=
hed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fra=
ction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-c=
olor: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0=
 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transpa=
rent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ;=
 --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-=
saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-ba=
ckdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; -=
-tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ;=
 --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 0.875em; color=
: var(--tw-prose-code); font-weight: 600;">drm_sched_priority</code>,
      and a static analyzer flagged our usage of hard-coded values. </font>=
<br>
    <font face=3D"monospace">Upon reviewing the implementation of <code sty=
le=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-box; --tw-bo=
rder-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-tran=
slate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1=
; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scro=
ll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient=
-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-=
zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fractio=
n: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color=
: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 t=
ransparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent=
; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --t=
w-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-satu=
rate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdr=
op-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-=
backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --t=
w-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 0.875em; color: va=
r(--tw-prose-code); font-weight: 600;">drm_sched_entity_init</code>,
      I discovered that the function is already safeguarded to handle&nbsp;=
</font><br>
    <font face=3D"monospace">priority levels based on the scheduler's
      run_queues. </font><font face=3D"monospace">Notably, altering <code s=
tyle=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-box; --tw-=
border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-tr=
anslate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x:=
 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-sc=
roll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradie=
nt-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashe=
d-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fract=
ion: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-col=
or: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0=
 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transpare=
nt; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; -=
-tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-sa=
turate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-back=
drop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --t=
w-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; -=
-tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 0.875em; color: =
var(--tw-prose-code); font-weight: 600;">DRM_SCHED_PRIORITY_KERNEL</code>
      to a non-zero value could&nbsp;</font><br>
    <font face=3D"monospace">potentially disrupt scheduler initialization
      itself <span><span class=3D"ui-provider a b c d e f g h i j k l m n o=
 p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir=3D"ltr">(i =3D DRM_S=
CHED_PRIORITY_KERNEL; i &lt;
          sched-&gt;num_rqs; i++) </span></span>. <br>
    </font><br>
    <font face=3D"monospace">Therefore, utilizing it seemed like a safe
      approach.</font><br>
    <font face=3D"monospace"></font><br>
    <font face=3D"monospace">However, defining <code style=3D"border: 0px s=
olid rgb(227, 227, 227); box-sizing: border-box; --tw-border-spacing-x: 0; =
--tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-ro=
tate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; =
--tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness:=
 proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --=
tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeri=
c-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inse=
t: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-c=
olor: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ri=
ng-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-color=
ed: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-=
grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia:=
 ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --=
tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate=
: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate=
: ; --tw-backdrop-sepia: ; font-size: 0.875em; color: var(--tw-prose-code);=
 font-weight: 600;">XE_SCHED_PRIORITY_DEFAULT
        =3D=3D 0</code> and employing it doesn't seem logical. </font><br>
    <p><font face=3D"monospace">Hence, if you perceive this change as
        risky or unsafe, lets drop it.</font></p>
    <font face=3D"monospace">BR</font><br>
    <font face=3D"monospace">Himal </font><br>
    <blockquote type=3D"cite" cite=3D"mid:ZgJhpTlz6OfqiaQg@DUT025-TGLU.fm.i=
ntel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">---
 drivers/gpu/drm/xe/xe_execlist.c      | 2 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execl=
ist.c
index dece2785933c..57d3c11da591 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -341,7 +341,7 @@ static int execlist_exec_queue_init(struct xe_exec_queu=
e *q)
 		goto err_free;
=20
 	sched =3D &amp;exl-&gt;sched;
-	err =3D drm_sched_entity_init(&amp;exl-&gt;entity, 0, &amp;sched, 1, NULL=
);
+	err =3D drm_sched_entity_init(&amp;exl-&gt;entity, DRM_SCHED_PRIORITY_KER=
NEL, &amp;sched, 1, NULL);
 	if (err)
 		goto err_sched;
=20
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_=
gpu_scheduler.h
index 10c6bb9c9386..1f712f4fc76a 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -63,7 +63,7 @@ static inline int
 xe_sched_entity_init(struct xe_sched_entity *entity,
 		     struct xe_gpu_scheduler *sched)
 {
-	return drm_sched_entity_init(entity, 0,
+	return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_KERNEL,
 				     (struct drm_gpu_scheduler **)&amp;sched,
 				     1, NULL);
 }
--=20
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------HSHXt9DbHNyjh4B9vfKdtSwH--
