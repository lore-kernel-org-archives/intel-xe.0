Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D77CCD1292
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 20:55:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0869011204B;
	Tue,  2 Apr 2024 20:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfY2AYVe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A7A112048;
 Tue,  2 Apr 2024 20:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712091341; x=1743627341;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZiUhgr1KtkVx3QxlwrahOKHtFHMyYSYRDSSlrfwtVLQ=;
 b=TfY2AYVeMVwxDli5LUaImjzEkyTHjeuNG27QQShWFzUkl59pqq1sAbqw
 Eh9snSEf9KdO/AXRW/eBghmGcpbcnFw5/hiS/os2u85i/MQtglOLqdeZl
 4X20a6uR9cBr6LD3CC4aK9Sot/KYBJnEqNzPsr5uu6uSv/Hcller92Bjw
 I0kQ95bVadU0EOq3aREqMMF/e4V+bTGEBpnngyle2p/p3NO+9Hvv6rBiv
 yGCICq3Nh1X2n66rNf76DNBuCtTsYH9MVfXkJuprmivzUgLJicKBxp4WW
 bAIt0H4NikKVj0JG7uOM5t5oeSZmGxfHaLKz/SXcx82blYB0BrGa0aHkY w==;
X-CSE-ConnectionGUID: eYOqGSNiQd+7lEnA0lIe7A==
X-CSE-MsgGUID: WILA0KszQ+OUp6UMh6Olpw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7135650"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7135650"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 13:55:38 -0700
X-CSE-ConnectionGUID: 3BSrhJYuT3GACP4tKcSzzA==
X-CSE-MsgGUID: L+SIy/9lTIGfCuB4ltAbiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="49426812"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 13:55:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 13:55:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 13:55:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 13:55:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NS5kKalzPBZYKZUVKQmY0BVYwVQwlYa7vDODPnLxlKEZk7Tu01LIQHiLAfkR+VipSFfnZ9JlGQkSbMMqGcdyaKgrkIga53ZMJUhCHVOO7dlTravLbB7U62FYwnKk3iRt8P10rUiP7DDvGdJeaF56revus8gwvojWshSuIXmmdF6cU9/rwFL2GpV0uXBjRmPNLQdqCXTsxofnInTdYW5ydwWvMI/RlTmsgRcFyg1QBn2efNxkaGSJIXwsset9MDgfBW/xyFz+g0zhn/fQUwAzVI/qunQXbdcorvkI+JVsvNngklyu1F+zyiPmfIBAEAnNwVPvPBhz1Ua5nggb6BqrYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2+6lbeF1O9+6UpSPaJk1O9+N5+BLSNQxBda72kRXQI=;
 b=LwDw9KfkibvlLg1YW3bbxXSoMglPvblEupz1hLmatImP0LweZpX6Cq7roU59Iu/pKxbWA7cpoX88vRgu/VDZ0v62mvVqihjLwCwId30ddMv59kGUzgJS5hIDk/1JNDfHxCBBBdRHlj7SFtAwM2Wp4BV+WjP5g6XPjboU7WQLnj3fmezjhwVC+djnU+da2m903yVq3LPAECfaxhIVgl2BBDArdHlyN7MLuJX5FiyVeLagQxh6jwNwrrEOGSevFNkJc17hwSf+xns3bQKkyb8ijS/Y0iT16BM8Y8n04qEwWvH1Rx6ubUVC95JqRzr0ynt9jyCYeuK46y4F69+um20wEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5814.namprd11.prod.outlook.com (2603:10b6:a03:423::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Tue, 2 Apr
 2024 20:55:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 20:55:34 +0000
Date: Tue, 2 Apr 2024 15:55:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Matthew
 Brost" <matthew.brost@intel.com>
Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
Message-ID: <kss23fgx24bvhlarkvrivrvvh32pxugpvgavdo3tc4u55jmidf@rnr7terjza6w>
References: <20240402122223.643413-1-tejas.upadhyay@intel.com>
 <20240402194017.GJ6574@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240402194017.GJ6574@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ2PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a03:505::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5814:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a7MbdoHdAFGLazn6HQvz92sQYxbz7Z50jyEsdIGijkHMk8D79NsYDeQUjuUGxyp3ScU9P/dyopewFVlnJNkGuxPnFZL4blwbeBtXtSGcTNODpAk9sqjEuh8I6dBZSzxdc9rwxAYGRJ928pxuIWTad2FKp9u1Ddnm5sBbS3kO6wT8RdArhKyYxLcGy5pTh3kj5cu9wkqluL+++0SE/lEnvGlmnI6fcKbRaXVIrI4S+COw3lOskQ0hcjGz12jEg8wEUJrRx5pmvXzgwB6FAGaQwOYBBPmuJbl6dM7szzHjPVgTnohjZltjcO1DzFtFCr3lUHbIglqR/KSq3gUrl3rOuj5m5W8B2gBqhemo4t86lKX5u7Ma/Npd0HV41v0C5nj2NWqURIQq9g4MQsgJdRenwHDsqOR9NV3DG9HKGEotnJpJpCixNJmogTsNoPJogunD2v5LLFLCYARTEsRoXmoo7S5xf9MohV0R6Z/V3r93+1Tjj/uMQwA1MchqBxQeFgbliAgISWVL2pDYkNB3ob2dXJjx8EIMXpL4H2yTrtP16meewEYnukhCpNC4XC/n77b/h3ZWRe3wqCIYNRhpCUtu/ZjqzIUeRF5GlFdmxJK9ZpqMgWc70G0YhsX4+wFdDntEUnQzRDargg94eUq8YaGBvCz6b6LZiBBcVLJNL43HkJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e0CUUxKwMQ61PyupO0nv0US3AaYl2/OhFdZGgvP8FSvFFcT1PByBHY9pdVxI?=
 =?us-ascii?Q?mceIETw+pEkO+WM5CYyTJv9X8eDrf28X+F0fLCUM9UpsPIXoIWmIP3J9LpA+?=
 =?us-ascii?Q?LOxYkc3lsIP8s/wqiuf0lzf+ySMmwWh2MZsH0fSYwEMR6isyX6xkIEOhMDXp?=
 =?us-ascii?Q?u//9/mA1WEYkMNtOiL0H3wenpXmuDh4OaltWdMg1ZeTnHyCf3+Ki5jFa0fvX?=
 =?us-ascii?Q?dN18o8MxlDQ+cWUqKM3+G9iUqUkshglHPj/8UCStOCFxlBLotNVExhds0GUk?=
 =?us-ascii?Q?rDVBnMem3vlhDW1QLffIbpGEpBYH2nNXLiG0Tv0sOUuKgzR+/VogpvExN04M?=
 =?us-ascii?Q?lTSsMX4xHZCRPowVKoygxtRtb3x9oC+9zVhzSN5AdiFMl9AfMnd12txOs85b?=
 =?us-ascii?Q?ON1N1wL7O/ShI5p09jQ34Z64bKsUWQ7ah+meRIR1pjj+NMopaPDnm0msZulC?=
 =?us-ascii?Q?GVFAkvUwjB4gDoywF8gOZON03yRt572tCkCzSb6yRMZuLcyVfDNuXtpG+gYJ?=
 =?us-ascii?Q?OzGuWwQIUAOKGjknNiLoU6F7keQFCBsV+mOuxDl+crt8WrcS+HoOLO+eU1yO?=
 =?us-ascii?Q?bNA13ZFH3eKCekcFwVaqeEuY51dp2lc+wEn8UrrnbqyHifCMulqpIUOyJKrH?=
 =?us-ascii?Q?GJfcHZ0a8fuQvSG7dj3t2GFkfPCs7QQmyQdYc83pq7RGkruRAUUb/HsjHilx?=
 =?us-ascii?Q?ifEGchF0OerHsQlLwrmPSVUcCTv19ESywgpbXpIFEc0j154C8rCh1GCCk4di?=
 =?us-ascii?Q?nOKKCHrJh3vQSvPqotd7YoQPPPx+hAFbA95mYTPcZXs7IdbuJqmbAg5G3I7T?=
 =?us-ascii?Q?gp+I3FVEmx91SpUhDaBfa6jYPu0xunkwnUNZ+cksxabrBTEQjdGsluM9Kx11?=
 =?us-ascii?Q?qvb+cXr+x8dMha8WW1U5pCPQay4vN9kUM3XmE1WH9A/l7Med7RrYgV68/ARh?=
 =?us-ascii?Q?l4BJZiOQj7AUdlc+CnaI37KdHwqh58k7jTGXR8sTsy+a5Zwp4k2fHv15lwBj?=
 =?us-ascii?Q?wqpgA96fETyfKR0+Y+zp7TWXAUbIiQA8Z8wrnySFMFmb6VDaV4DPmSGl9uQb?=
 =?us-ascii?Q?41qFI4INPsaBQ7e7/1hlNQoLcvQXF+8ZDExMFMswIefrpT5at1NVP519Z6u4?=
 =?us-ascii?Q?NwW9m8hQRv9kKZ6xRcZ7boAZJeDEGQrXH6sRaeRsgeD8CYhjv/d0QTLOfikk?=
 =?us-ascii?Q?/jBLJ7smXB9QMV0qq3iHllo5QigCw9NiDsMBo7BE0DylP+qfxH6DOhZ0mIcP?=
 =?us-ascii?Q?7CKadhnLQGatmbFO8j5LIy3kT6T3+1HJplnRVh3qch6b2FjXojAyKgiZseig?=
 =?us-ascii?Q?FECI+krFL6oXJQ39ItUZRn56elxsE1k0m9J68wDrzMLWhbZCZIiWOu6OA6KO?=
 =?us-ascii?Q?SIXrv2ypWfBQ6embf9T4ARqnh/WVjtPQ4p0GKG8gQKOnP/mQrfNKhnIPFiWD?=
 =?us-ascii?Q?jQQWJr7kyDoV2j4HkZWo88XfqInzMjTQyU27d7Q/z7LD5I9lYaN9mGYI7pY9?=
 =?us-ascii?Q?pmB9qQItWUiADUNDHYxnIMstRDK7PFsaS5oOmDR/VePEVuyZPMYLZERfFdZY?=
 =?us-ascii?Q?qRtbT3gtn9fLroVs/OZKVFiJE07f3kc4KshWwFSh7RQwHGMRZLuREHAoH/pi?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb590fd3-67ee-4478-cab3-08dc53573d93
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 20:55:34.4326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L13/HCuSMrGNk3Jbrsx7YK72SLUXNHq4gqCf9D8Zbm7BU1XdSoW1umJnPQpHeeUqpiboY8tKTYZeySfEhnFnZ6MSuOsdMZz4qkqUjuv72vA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5814
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

On Tue, Apr 02, 2024 at 12:40:17PM -0700, Matt Roper wrote:
>On Tue, Apr 02, 2024 at 05:52:23PM +0530, Tejas Upadhyay wrote:
>> RCS/CCS are dependent engines as they are sharing reset
>> domain. Whenever there is reset from CCS, all the exec queues
>> running on RCS are victimised mainly on Lunarlake.
>>
>> Lets skip parallel execution on CCS with RCS.
>
>I haven't really looked at this specific test in detail, but based on
>your explanation here, you're also going to run into problems with
>multiple CCS engines since they all share the same reset.  You won't see
>that on platforms like LNL that only have a single CCS, but platforms

but it is seen on LNL because of having both RCS and CCS.

>like PVC, ATS-M, DG2, etc. can all have multiple CCS where a reset on
>one kills anything running on the others.
>
>
>Matt
>
>>
>> It helps in fixing following errors:
>> 1. Test assertion failure function test_legacy_mode, file, Failed assertion: data[i].data == 0xc0ffee
>>
>> 2.Test assertion failure function xe_exec, file ../lib/xe/xe_ioctl.c, Failed assertion: __xe_exec(fd, exec) == 0, error: -125 != 0
>>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>  tests/intel/xe_exec_threads.c | 26 +++++++++++++++++++++++++-
>>  1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>> index 8083980f9..31af61dc9 100644
>> --- a/tests/intel/xe_exec_threads.c
>> +++ b/tests/intel/xe_exec_threads.c
>> @@ -710,6 +710,17 @@ static void *thread(void *data)
>>  	return NULL;
>>  }
>>
>> +static bool is_engine_contexts_victimized(int fd, unsigned int flags)
>> +{
>> +	if (!IS_LUNARLAKE(intel_get_drm_devid(fd)))
>> +		return false;

as above, I don't think we should add any platform check here. It's
impossible to keep it up to date and it's also testing the wrong thing.
AFAIU you don't want parallel submission on engines that share the same
reset domain. So, this is actually what should be tested.

Lucas De Marchi

>> +
>> +	if (flags & HANG)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>>  /**
>>   * SUBTEST: threads-%s
>>   * Description: Run threads %arg[1] test with multi threads
>> @@ -955,9 +966,13 @@ static void threads(int fd, int flags)
>>  	bool go = false;
>>  	int n_threads = 0;
>>  	int gt;
>> +	bool has_rcs = false;
>>
>> -	xe_for_each_engine(fd, hwe)
>> +	xe_for_each_engine(fd, hwe) {
>> +		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER)
>> +			has_rcs = true;
>>  		++n_engines;
>> +	}
>>
>>  	if (flags & BALANCER) {
>>  		xe_for_each_gt(fd, gt)
>> @@ -990,6 +1005,15 @@ static void threads(int fd, int flags)
>>  	}
>>
>>  	xe_for_each_engine(fd, hwe) {
>> +		/* RCS/CCS sharing reset domain hence dependent engines.
>> +		 * When CCS is doing reset, all the contexts of RCS are
>> +		 * victimized, so skip the compute engine avoiding
>> +		 * parallel execution with RCS
>> +		 */
>> +		if (has_rcs && hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE &&
>> +		    is_engine_contexts_victimized(fd, flags))
>> +			continue;
>> +
>>  		threads_data[i].mutex = &mutex;
>>  		threads_data[i].cond = &cond;
>>  #define ADDRESS_SHIFT	39
>> --
>> 2.25.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
