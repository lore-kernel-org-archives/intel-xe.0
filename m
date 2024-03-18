Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7105EC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 18:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274AB10F67C;
	Mon, 18 Mar 2024 18:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3NVARea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619F310F67C
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 18:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710787324; x=1742323324;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dzah8eZsjTZsslfSy+DVjdn72Wk6ZQMzkIlzx09EUy8=;
 b=D3NVAReaKcZcIJv2IN0IhEGhhsuXLj006pOSP2ZsJO+eeHJk75DfJ0xQ
 c3jGnrusTQp2Qb/4KHhK7XQehHTJbqWr5XXDea3rth6RlK20yhgoeGUtF
 x9ILwSoZycvabBHPkAQ3vI39Kw9Y9d8ln/j5QOew/wrcJ+fGrMZ0q+cyn
 zJ4t3FLIiMz4JtOh07bqpUW/ILoN+zjQAcv2LP9B6GDpJRos5GbCR0AZJ
 MiwO7Lxz8k+NuquMkONxj54f7fszHzpGT6W0+Tgn8VIMeIJuOXNqmpsUK
 P5nYelN7fhe328SZdrF9EAANsb2fNsEFYAn1jNCsL5MMfYqGJ1wHNjrBV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16768665"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="16768665"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:42:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18220372"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 11:42:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 11:42:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 11:42:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 11:42:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnHXLpp0b4MSAZyc9osbqWomygokXHg61XJZHk2pe7db+IOR9BG+JBLnYmb0O5sS5xuS4aU+kL38NFVBCkXt7p9c920sSjHnmAk2qbIN7fZU3Nt4BxDYrcAIq1kDc2zDl0uANLasc8kn0VMzKWLFe7jkbTKAGF9RRlz/0N0gDot2jYQAbsV+Mz0QwakA1syCBjt+aOgYK7NEOirpJoSubI5za+E4awtTcOO/9Vjj/8LDfdFrU3V/qNyqlhuysFIfuvqjBpFDBsWDZhGSTmvCvWUJpKn7pd+o5GRPRXH6quK4of/P5sMVTUDjtu8yYSHU4tU8uY8qz51B+lsiEaXpTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6B+5XH8qsw4bTGSbMezyuUM7xjVBu6Ck+aLgnyDL9k=;
 b=LyqgjWsf+MKJhw89wOw/KwXXNv3a3BcN2AvrHpv78DxglVrmiokG1yOm+JD7DQwS0I655plpwmqMtPTdLXcIGHZXIbHxwpKJYjXvcRG5+fQrk7ffNgaUgBj5SwgPA7R3JpM0318z5BaDuUXbOm9foUxRynibyH0fh9O/1nieIgbYlY0xPU9IPoH7dqqjoe1InVislgbfqICEKegwhexHaP5e/g+aU3oQIECLoj4K62PpYYr5vOWfA/u/EqYloi3aKW53tjSScuxjMghi4kL0kpvkwYUMhZzz8fV/ODygPiCY2mlqz/90Q5wbBYd9O9/Vsy2NnlkqxjQLNe5oi+8HBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 DS0PR11MB7735.namprd11.prod.outlook.com (2603:10b6:8:dd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.12; Mon, 18 Mar 2024 18:42:01 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7386.015; Mon, 18 Mar 2024
 18:42:00 +0000
Message-ID: <3dabee23-9a7a-4f43-be33-d4902a5fc7af@intel.com>
Date: Mon, 18 Mar 2024 19:41:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Add a WARN_ON for NULL job in
 xe_sync_entry_signal
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20240318164342.3094-1-nirmoy.das@intel.com>
 <20240318164342.3094-2-nirmoy.das@intel.com>
 <5f468d07-be94-479d-a0ae-6e8c76486f11@intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <5f468d07-be94-479d-a0ae-6e8c76486f11@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI0P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::18) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|DS0PR11MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: 14753336-30b7-4d23-a635-08dc477b18e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q+B1OS1ym9NUBty61LplJmh78/GArEVAhjABRXK5Hsy0HH9PCEgb4aZ9XZCM7UE3BGIhiqzMfdYhWKZm9xtIx9zpA4DODqlApDGLUn8F8BmFb4Moz0zSWgxPGhQE0cgq7nroKwwVBWB6vhSD2EXJ6ffwMyD3yenYg5VBb7SEMK1J07m9kTIQ1e85HZqnqSJt/09iJ4P5DfZU2jVI0KuZhejI3JWA+1INPy8TQYkkSwy845fqT3EKHz+F3WEQMJrte51AFIpd5ORZTkiNqzGFzwgm8535J4doGgBW0ZEeghOQv9tWRTIokGHWS4twN8rb4g2O/V8ZRQHRAs0tGEZQHcPUOqyduPXyuFFf/o6F2RIKVD0zDdHWnzJgxumroCyxnGgVvKHo1BwQ16w81FowSm2OXE9O9rUZjwI6K8s3YvxqQFBXX0ekm9bSWvICRlYDQD5JTA2KCsTeaq7/OPP6hQIGrBonTWqh+3P5i7fgXCrsE67zKFfX9a3QGtAVKfq2YicUe2cfxhFAvTeaSuZBe9GmoyZ0uDlHMFHgM+D1b3eY2Nn89wRUImfWhYSNSBkqakZgeCh4moynkGTcwvvDzuKy+f+J9U7uLvG5/Tid8abDpDQAjM3v5z+B3eZiSJloE4ySQ+5QyilKw37nm9MU4CgM4Hx++ewYP6a7gsQ+T08=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVdJTlI5Y0VGb3lCN2x1UjlWQWIzMWZhZVFRSFBya1ljYUZjaXJGQ2ZJQ2lL?=
 =?utf-8?B?WmRoaGJFNVFpOEVZdUd2NTlkWmY0czBzcnZuTzZpaVNnK0h2ZnlVTWN2clpy?=
 =?utf-8?B?OGdjK2Z6Mmc2OVpmZERDVWdPN01ia3BxQ25IL1VBekF1M1RzaldUbEF5RFRl?=
 =?utf-8?B?Z3RnRGVwczBPSWpTVjg2TmxtUFBQUWJCQTVSNlVZc2pTY1lQU1lucVRTcDZt?=
 =?utf-8?B?RXNrMnZCRkRVVHE2TjY0WitzU3dxU2JrcG9TYXU0RFVrUDQ1cUF6Z0Nub1lK?=
 =?utf-8?B?UTFtOW9IaGNZQUVJZUZCSitFWnVlT2xjdEcwQWFNVnlRcGExVU5oTE43NlQv?=
 =?utf-8?B?ZngzNG9ERXdjaE5SNVgrZjNWdGZ0c1ViQ1BtbU5vM1ZuWWNHWm91L3dtZ0N2?=
 =?utf-8?B?UFZoOXB3bW1sWVppRW5SZEF2ZFRwd0VBS0JCczRrZitTZ2ZWV0V4cU5GQzBn?=
 =?utf-8?B?Vy9DYkc1VFNTVmFXK3hZeWFIU1p4NjFyelV2OXBZZlNIRTdnaVZ3OVJFVFVB?=
 =?utf-8?B?ck9NQmQwSXRkdm83MkxJTEdFOVJiY0R2NEl1ZzFnTVV2cmJNKytweWVRWUdh?=
 =?utf-8?B?eVVVVFF5d203dEdYVk5VSFA2RkJ2NjFGemM2OXVlSTkwdW1FSEtRZzZqN1p1?=
 =?utf-8?B?VTUyOXZIaklVWi9SV0E4OWVrRDFFajZMMGhlQ2hTM3YxV1hmelRPdWVuN2cy?=
 =?utf-8?B?V3V5K2tjcnNLbEpIR21qRUMzbUNOUmxBbjRMaDJ2T0dBb3lIN01sZmtFY2lL?=
 =?utf-8?B?bVAwOWNoK001Y1RHYWpQTEFCbndtREpscHBRaERoVE5oblBNVjlCSVlXRFBi?=
 =?utf-8?B?RXJvZFdBb3VhUllZM1lUU2tBZmpybFk4Rys1YXRsSE9KY3JTOTlneTFYTGVY?=
 =?utf-8?B?WnZmZURJeXN5VE1rYXBwZGlVMDcxZGt5SEcxVkxoRml5dmlIWlE4WmF3ZlJH?=
 =?utf-8?B?VHFweitEOWV2VVk4L3JnVUxRWkZ6WG8zek1Xa3N3NjhjdTBVZDNmMTI5Ylpw?=
 =?utf-8?B?eFdoUklxVzgxemRmY3BlVW5UdFhVQWFMQlB2SEw3d3pWQW56ejJId1RLOWky?=
 =?utf-8?B?Mm4yclh6b0hualZlNEJJNTNwOFFqQzc1VHhSMlhmNEJiMkxJcFFLRU5iRlNN?=
 =?utf-8?B?OUxzTnJpTU9zMktEajB3Nzg3WGRwa01IaDJZOXpTbllLZzNSQUN2azUyRytW?=
 =?utf-8?B?eXhCS1RSMUlOYkR1Vlg3MjU5QWZGeW05Y3lmbzhMVU5mUDdmMGw0M3NKSm55?=
 =?utf-8?B?NTJmR3JROVhyK0NpZjZvaHJOcG9WYzlmVnUxOEpDcTNQdVozTWFQZjNxelRD?=
 =?utf-8?B?SDhVLzRXSFd0bG15TGdOSHJJTFlWc1Q1OVI1TWtrVlhNU0xrTyswM25XVklV?=
 =?utf-8?B?M092NnZFa1FMNGxZeTJRZ0Q1OTdDNThvcHArakRwbUxmV2ZqelVTRGRzWFF6?=
 =?utf-8?B?YlZpTXRSU3hyYUdTOWNyMGVkRkE2T3MwVWk4c2dTYktIZXBrMU80b3JuUXp3?=
 =?utf-8?B?OVNiS0J2aU1CKzhnSUxNWWlTell2OE9NT3N4b09PRFZUWXkva2F0aVp2MnI3?=
 =?utf-8?B?L25QSFU1R0hQc2ttbGdFck44a1l6T1Q5YmdCQ1EwbjJSQlNvQzF5djhWWXc2?=
 =?utf-8?B?ZnByMU84eDk2QWZVUktJRTJTWjU0WmFjd05LVzRHaHhIOEZja0xVZlNielFV?=
 =?utf-8?B?M3pUUTFJSlZ0aExzS1ZaMEZYTFduYmZZSlN3a0g0SUkzVzRaQWEzT2dmVFBN?=
 =?utf-8?B?SHZGU25QZXFSYmczZ2U3UzZaeEkyalFwZnJ3ZHdYQytNNE1xQ0p4NlFZWnIr?=
 =?utf-8?B?STQxa3k4dURhbXcxM2FUbW41UEp5ZXFNaFpJb3BqYjRoSzJIV0FjSldFWHVs?=
 =?utf-8?B?SC9PZVRLeWVEbHY5eFFxTGx5VnY1Z0UvL2VCNG13clYwZ2xjOHpuU0pHZnc1?=
 =?utf-8?B?R0I3K0UraFJZNVE4U2pETm9JeTJCUlR2RlFYYjE1UTlsdlN3bkdXL21FcUpN?=
 =?utf-8?B?cUdpT2U4UEpMbFVJR1ZMQm55OEp4YzhEQkJ6NEJwRElYYTlYUVRaZ0ZPV1Zq?=
 =?utf-8?B?akdVYmc2bmNUbWFEUndwNERZbjZtN0N1bmFYZFpjenNSL0wwSFBPRk5VUEpH?=
 =?utf-8?Q?lw5STM6xbdUp/QZCk1IzgoD7e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14753336-30b7-4d23-a635-08dc477b18e2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 18:42:00.6785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2zhTHasNicIKatgUvppJgeqDeIZAO+QNFHRK6WjaOKzQF6uC8pfNrq0Zy8PrQaCEi15mhhpMWWlwCD3uIlFcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7735
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


On 3/18/2024 6:41 PM, Michal Wajdeczko wrote:
>
> On 18.03.2024 17:43, Nirmoy Das wrote:
>> Add a warn for NULL job when sync->type is
>> DRM_XE_SYNC_TYPE_USER_FENCE. This should be a programming
>> error and should never happen so warn and let the kernel crash
>> if that ever happens.
> IMO adding WARN and then let kernel crash is pointless as you will have
> almost exactly the same report as from NPD

WARN should give us the line number which is not the case for NDP I think.


Regards,

Nirmoy

>
> for programming errors we should xe_assert() that will provide necessary
> hint during code refactor but will be compiled on production builds
>
> only if you feel that that job could be still (but unlikely) NULL then
> you should use drm_WARN/xe_gt_WARN and provide necessary fallback
>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sync.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>> index 02c9577fe418..247505c3478d 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.c
>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>> @@ -255,6 +255,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
>>   			dma_fence_put(fence);
>>   		}
>>   	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
>> +		XE_WARN_ON(!job);
>>   		job->user_fence.used = true;
>>   		job->user_fence.addr = sync->addr;
>>   		job->user_fence.value = sync->timeline_value;
