Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13479D3B7E2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 03:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8AB10E1AC;
	Tue,  9 Dec 2025 03:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VzCCWDZJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B4510E1AC
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 03:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765251102; x=1796787102;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7U4It/0KPGggPGR7QFJyV3X8pcjn5QhZmJbokCepHiw=;
 b=VzCCWDZJ5nPos4Ep178/wZvu8aBGgt7UwKViqukQCnQFu5lxZ/AZLK9Y
 XqSonCaZKRfSaQoXktZbGdvF61ssj+F3SrutIxx0Q+7WcplYAqXsi3nEw
 2yzkyzV0zDrAEuvvJ9VZA1YBL3mqvZOz5E3/LsaU2s8K3S4ve4EfYQOnc
 DC3NDneItSTFp/GmBxL9YQTWqK3tNHKLnOIqArtqTCwEWLjbc43swWALJ
 H6p2LLseu0YlT7SCN3AUPwUkcUHCUVCbPXKYrPxz32xwn1utEJ0F1Se/u
 oNx2kESpM62hhNQJQnNf7xR1EE09MO3LHOFeoQVsiuL+BfdWYEYf1ezQM w==;
X-CSE-ConnectionGUID: mKlpCG0ySWOAM1uBqVO4Ww==
X-CSE-MsgGUID: V+sDoH3ARb+Ju8VQECv9pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="71048736"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="71048736"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:31:42 -0800
X-CSE-ConnectionGUID: fsruYhLyQ4uQ4gH18t0/PA==
X-CSE-MsgGUID: blor5u+KQzS2OHVLyISEBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196013735"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:31:40 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 19:31:39 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 19:31:39 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 19:31:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ik3pSw/mt5+U9fpnPjlSefyf6mTTkUnMey4+fcwpxopVOu6DTHxyXG15MZVeQvwtQCqw1W8pqDuAG55rhcyFPA9n3antPXX9B4PNsU35QIeXxpPDzS7CFO7sP2ZlXUNV8dKSSbFngdqoFOTWN/PEcBCnieHdNSucYr4JBPISsoPPkfbej5zzFDEo59MBhAv+DcF/NJH0FnvxRyaXo/FPOIJXQVcNXK12y02+/jrjpcfo8dcDKjwSJzXuPOYMDgF34RUP8aQ+Dq9sX4IFklD1JbVUY0HDWWENO612DoAiFG6WDD3QCO4RT/RwHXTPqR4S73SQ4Rmj7135Rv2LEH8RQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EEaY4IlSKRMErTPkXMEhSHRUlnBzy/S8onkY8YkvsI=;
 b=rd4WmdJniKvSmFhL6kGlCXHbUWV27UHw80xIyFegrzGxMQeeqzqui7h+jCb6oOUZf88khV+yy9rJlNKvw64MjNieCj7gD9WGwmhxC8csEpTwHl5kULEiiRvsDEYCiPhF1Hznighs1diBGRoct6kdGUeYDh7VSOSD5ldXNGB3ooyF/WwnAsAhJcPbZeV56w11L+pl/AW/w7EUBhBi87g14MYzZsWxl9l61g/9ieeL9MnYZY6vcbS7bIhej4YW7nviipZCUGX5FxI/jh6ZeQzaBCQvIgmL9k+tJLCQi5lOpfvAuJpN5dA+2YxQgOguWl3VVpokQpRvhqffCIORLkoKJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SA1PR11MB8318.namprd11.prod.outlook.com (2603:10b6:806:373::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 03:31:33 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 03:31:33 +0000
Date: Mon, 8 Dec 2025 19:31:31 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 09/18] drm/xe/multi_queue: Handle tearing down of a
 multi queue
Message-ID: <aTeYE9TwK4xjU9RS@nvishwa1-desk>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-29-niranjana.vishwanathapura@intel.com>
 <aSFOXpGsDupxuKTT@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aSFOXpGsDupxuKTT@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY5PR17CA0018.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::31) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SA1PR11MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: ef4bb17e-74b5-4519-5bda-08de36d37375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uR2s5t/WVZapmLZ1w5T9OOS+/vTnulhBCecCKXxAEJD/AKT8I03p7voj/WHA?=
 =?us-ascii?Q?UKlIIdBNjIv9fW29DXWYDEYerN87g26ZDvBDt0Y+9cU+3d36oUsPlbNH1+tL?=
 =?us-ascii?Q?WQdVWfrf70HhAQ5M+jlxqUCVH63K7DkgVaj6R3soBdbGGWY2XY6wSoJoK+LL?=
 =?us-ascii?Q?2lmJXMTZzg9vZbY7xlnqNCD05r9zH83zByi6SB01lWrLjJxaqE8bDvwRJwr4?=
 =?us-ascii?Q?V52cz1UfiQbp1O3lu9rBpIPERFZ1E3PkPgw1yd8RFX/taf0ZlLt3OGZmmhri?=
 =?us-ascii?Q?J+8LVjbx+5FwZzExEZtP1PqQkzro4xPNzmjLeH0Tz56wgIyWcURvAmmw3qhU?=
 =?us-ascii?Q?PaW3yjK7PWF/powsEjLYsWdvRx4FWr46nMRoSBPAhTfIBG4fBpsRJi8zjFpX?=
 =?us-ascii?Q?Jq66ciSA8DE0K4yAt85OzsHFxV9XRkdfmJhFVpi1I7oV1qe0PIME5zNnURaV?=
 =?us-ascii?Q?6QEN3kyPX4s02in7lhp4hhE31EiZTS4M8vjHLPSGllhPdbtvM5Tc8CYntLPe?=
 =?us-ascii?Q?XCMPq09m8so65v3XaDavvDXQDHPgo7gMnLJGgTybSr35o4HaEzCYoXAWPImx?=
 =?us-ascii?Q?98iranA6y79jfEMk5KnHAm3Cf5Xj9gkHTo2aCxkBPuwlImRhbrmMWlYtZptg?=
 =?us-ascii?Q?ACwC3ekWAgU3p/7rmKFuju862Lsh2VU5vznpm+8yDae0U27m7RtZ9q97AFaG?=
 =?us-ascii?Q?HwxhH/Xhd82Ok3116jDFJTjiMvPmtVnyibJDcJbq7Rb55XZ8OU67sMGFKLhn?=
 =?us-ascii?Q?Pa09QhQPCz3RrhrmwoH13VGSBv6FTSgCwNGmZGnMk6EeuwBaj1JsMUHX/ZeN?=
 =?us-ascii?Q?RWU/VOg9EoRPK4oXuEvtE+ZH+RCl8OKopgUJfstRk82KnBsLoMkWXDK76J7v?=
 =?us-ascii?Q?XLWX2/mYNamAjIuKooeETjEQgDHsg3GwgNo6+K47Ncmx/+VMLM/d6mmTLHkl?=
 =?us-ascii?Q?FdjjbjTU/oMLiPeThyYLIRuqAcQTOY15dSyWjICOO+MovEBRojLnNe5W3iLM?=
 =?us-ascii?Q?4LkRjS6bCnZlquS2UOjvcE+RSwjYGfcSZ2BYZC/wyHLQcw53tXcvI2vZW/D6?=
 =?us-ascii?Q?kNryMv4hB3kVIVtgJkwJ+53ahq2bOHzbHIh9hszsm6c7kLZt8jAhUKFQ4OdH?=
 =?us-ascii?Q?P3f0zeu32U5u/o8G8oosY1onKUGlx5FCR7INw5cacOOcpCyKLiwOqTLUdMx2?=
 =?us-ascii?Q?KLC4hVAazWJTK/IfGpM3k5mH3lPhE36CyZIsc4duOtgMoNCm59MmiyM5OQ3V?=
 =?us-ascii?Q?iKqY1D9t7+sE+a90NfpAtGHTK9AQVHuo7b+MuUf/Q6wE9NMdGtgoJqaUV+G2?=
 =?us-ascii?Q?aXIkA+N0V+nHMaunaPDZBeibPDNIsRoi6eeGO+GzW2ii5wOBArazqyjHuVqt?=
 =?us-ascii?Q?c/RSoI+Xk2T2KWw5Y1kTEa0xeAtsXpLe0qf7iCx30gTZ+oRJmQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T52TUtKsqa5nhNHFGPzJH5O3nTPomWZlRL9hEX1cabVLQALbVGFX6hWWyS9m?=
 =?us-ascii?Q?wX3n3BvmRsuTmJibFKiuwhiD/6lHQzsnVPZONzjoEreH6cFuX0+ODc796VsV?=
 =?us-ascii?Q?SZ/dYeg+uL6DBtvC5NpsMfy1phsGn2zOSWMD1HtFi2X1i/KkrXa+V7Mt+AG8?=
 =?us-ascii?Q?1wjPYCF80tqd3Ykm2oG+ENv5XLOwdwY6Kfz/z95SOkNPUeXZhzkm6hilg5W5?=
 =?us-ascii?Q?9UUzr/4s7YqCicKZZpLXMA5SgsjP7hfI+vuc3k54dr0kKPIafVLLlZY/r/n2?=
 =?us-ascii?Q?thzS30ZMVBcPQUC7/LFLSx4VfkM9PW6Bi+k/w2P5OgIe/ldQXx2GsFnrsRTN?=
 =?us-ascii?Q?5eATdpp9Llj9YoJJZXmGY0lf8BHy8+zQjAGolxzc8I0WXdcqm+BMRPnE+npC?=
 =?us-ascii?Q?8Lpw9uEbAnEUgiezzSrxn1tRH8oTPlGLTLjCuYvAGS80KIIWarxxJxDHl5Gy?=
 =?us-ascii?Q?nfNgIAvyYnuNwofToNPfP0ZFPHAC0NhDVwiU6+T1zTPLSVrzIsDtgzXmPY46?=
 =?us-ascii?Q?SozGnIcReUKPpj042JGONPAf8OV5NYEqY9sgMrEjvNhXsWx71o2lctn7G7t1?=
 =?us-ascii?Q?x8irZee1QA06UbobmYgn0mD03bikevjp/6INFAwJjohONHXTA3v7FK3nkfJO?=
 =?us-ascii?Q?UNIMjvarRAsTEm4sTC3bbHNC2q9rMpSUW9ndenycmUOWwmWar0y4qgjkurp4?=
 =?us-ascii?Q?37bzmmo4RG0NnfSPB05FcMLRWGB+FqwcQnduUi9+IdcA9cGtSHvTnszmMtoi?=
 =?us-ascii?Q?I9fajx4Q+eVyf/5zT6iB0VLUCnw7UYTQKc1If3rKVAGGPf3MpuMGd/o+7DxF?=
 =?us-ascii?Q?kStf8xsCEAF3vHYmmAXQ/uN+i9uwFZtckqjDsrDnKnj5KJdpqXyQvMG1NGpa?=
 =?us-ascii?Q?nLlQs22V0QS3RVAXIYTfG4TYJR5oDhKGg7yVycAraEGkrB4Y/U8DEcUXX2wB?=
 =?us-ascii?Q?ZNWHj7+4jiSJOYWYnA3iPXgVN7JrmnXdcJBKcYa9oIxfZzKtE37Tn5SdTXY2?=
 =?us-ascii?Q?kyLjNjJZdchzK9w/oZjMIZXeWd/8rKR1mss/+scHWB/4DG/1HdwhgkHzcKCD?=
 =?us-ascii?Q?d1zJflUzxHO8XGJRTu7icjqt/R4ozyl3KhcnGv+a+P8z4E1ffANJYtwvxBMX?=
 =?us-ascii?Q?vBp8WLvDXrU1zwQGh6eTOAy1UtWYVmbHOMCZUfEZGu+Cfhtc6HNXdYoT2jl7?=
 =?us-ascii?Q?Malej2PSMrDUVoOOPBk5f8qqgrTGhL8/eqw20NUeQ2lBYua7TNY7/4h0Ek+z?=
 =?us-ascii?Q?WP3vbK5ywDbLov5Td9flaPux94a8Vy0gE/FW+kSWQbGjIItqm6iRyNiZp3nn?=
 =?us-ascii?Q?2DJwFRM9FXvKY0MXkcf7h1D3hOMUxJZv8H4WrR68Pp4MQ+Qnkl1uiNTbCj6z?=
 =?us-ascii?Q?zXnnLZyawpP29a1yB5F/wQtWubD3zDzcVDUOutkyPyisGogj3h2WhuL6U8MT?=
 =?us-ascii?Q?wLQamj/X2ub5SGfTCipu2YJoigS1pMEUFWJ5GFpOTKWRJuyQ7H0r7t3ON+q/?=
 =?us-ascii?Q?bjW66jSYvWBO2V2ZzlZbLLs+sk8ynxRkNjsCxOwML010cLkkpup5nSZOPIYr?=
 =?us-ascii?Q?jq+5a43FZjFr9XxK+1jzvQBa/GHfzXvqTcMmHJiCLQq8D9QJiE0xBddBZ1Ea?=
 =?us-ascii?Q?JuftOyFTg7dHfgK+n8yfvg0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4bb17e-74b5-4519-5bda-08de36d37375
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 03:31:33.8174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDIm7ljT0CFjSKJgSCOgWICOADxJBUXndVrrZ4Cwsbub2IDbJiEWGr+VZEOerBFDs8r/Ct/UYz/4ulp58RT3wR/0hi+2hWb3J81RfwUj/awn0nI+BstMyXWJC3pF/IfG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8318
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

On Fri, Nov 21, 2025 at 09:47:10PM -0800, Matthew Brost wrote:
>On Thu, Nov 20, 2025 at 07:51:43PM -0800, Niranjana Vishwanathapura wrote:
>> As all queues of a multi queue group use the primary queue of the group
>> to interface with GuC. Hence there is a dependency between the queues of
>> the group. So, when primary queue of a multi queue group is cleaned up,
>> also trigger a cleanup of the secondary queues also. During cleanup, stop
>> and re-start submission for all queues of a multi queue group to avoid
>> any submission happening in parallel when a queue is being cleaned up.
>>
>> v2: Initialize group->list_lock, add fs_reclaim dependency, remove
>>     unwanted secondary queues cleanup (Matt Brost)
>> v3: Properly handle cleanup of multi-queue group (Matt Brost)
>>
>
>Also discussed privately, I believe the agreement is teardown the group
>on any individual job's timeout within the group. We maybe can leave
>this part out until my series here [1] merges to avoid a conflict with
>that series. Not huge deal as this feature won't be enabled for a bit as
>all supported platforms are behind force probe.
>

I have handled it in v4 of the patch series in a newly added patch.
drm/xe/multi_queue: Teardown group upon job timeout

Niranjana

>Matt
>
>[1] https://patchwork.freedesktop.org/series/155314/
>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c       |  10 ++
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +
>>  drivers/gpu/drm/xe/xe_guc_submit.c       | 154 ++++++++++++++++++-----
>>  3 files changed, 142 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index cdc044d3c96c..ab161b74fef0 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -87,6 +87,7 @@ static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
>>  		xe_lrc_put(lrc);
>>
>>  	xa_destroy(&group->xa);
>> +	mutex_destroy(&group->list_lock);
>>  	xe_bo_unpin_map_no_vm(group->cgp_bo);
>>  	kfree(group);
>>  }
>> @@ -627,9 +628,18 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>>
>>  	group->primary = q;
>>  	group->cgp_bo = bo;
>> +	INIT_LIST_HEAD(&group->list);
>>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>> +	mutex_init(&group->list_lock);
>>  	q->multi_queue.group = group;
>>
>> +	/* group->list_lock is used in submission backend */
>> +	if (!IS_ENABLED(CONFIG_LOCKDEP)) {
>> +		fs_reclaim_acquire(GFP_KERNEL);
>> +		might_lock(&group->list_lock);
>> +		fs_reclaim_release(GFP_KERNEL);
>> +	}
>> +
>>  	return 0;
>>  }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index cafb3ba9a123..5721fb4bad1a 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -58,6 +58,10 @@ struct xe_exec_queue_group {
>>  	struct xe_bo *cgp_bo;
>>  	/** @xa: xarray to store LRCs */
>>  	struct xarray xa;
>> +	/** @list: List of all secondary queues in the group */
>> +	struct list_head list;
>> +	/** @list_lock: Secondary queue list lock */
>> +	struct mutex list_lock;
>>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>>  	bool sync_pending;
>>  };
>> @@ -145,6 +149,8 @@ struct xe_exec_queue {
>>  	struct {
>>  		/** @multi_queue.group: Queue group information */
>>  		struct xe_exec_queue_group *group;
>> +		/** @multi_queue.link: Link into group's secondary queues list */
>> +		struct list_head link;
>>  		/** @multi_queue.priority: Queue priority within the multi-queue group */
>>  		enum xe_multi_queue_priority priority;
>>  		/** @multi_queue.pos: Position of queue within the multi-queue group */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index ce870a119800..2e5fff7ad69b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -577,6 +577,45 @@ static bool vf_recovery(struct xe_guc *guc)
>>  	return xe_gt_recovery_pending(guc_to_gt(guc));
>>  }
>>
>> +static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>> +{
>> +	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +
>> +	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
>> +	wake_up_all(&xe->ufence_wq);
>> +
>> +	if (xe_exec_queue_is_lr(q))
>> +		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
>> +	else
>> +		xe_sched_tdr_queue_imm(&q->guc->sched);
>> +}
>> +
>> +static void xe_guc_exec_queue_reset_trigger_cleanup(struct xe_exec_queue *q)
>> +{
>> +	if (xe_exec_queue_is_multi_queue(q)) {
>> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +		struct xe_exec_queue *eq;
>> +
>> +		set_exec_queue_reset(primary);
>> +		if (!exec_queue_banned(primary) && !exec_queue_check_timeout(primary))
>> +			xe_guc_exec_queue_trigger_cleanup(primary);
>> +
>> +		mutex_lock(&group->list_lock);
>> +		list_for_each_entry(eq, &group->list, multi_queue.link) {
>> +			set_exec_queue_reset(eq);
>> +			if (!exec_queue_banned(eq) && !exec_queue_check_timeout(eq))
>> +				xe_guc_exec_queue_trigger_cleanup(eq);
>> +		}
>> +		mutex_unlock(&group->list_lock);
>> +	} else {
>> +		set_exec_queue_reset(q);
>> +		if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>> +			xe_guc_exec_queue_trigger_cleanup(q);
>> +	}
>> +}
>> +
>>  #define parallel_read(xe_, map_, field_) \
>>  	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>>  			field_)
>> @@ -939,6 +978,50 @@ static void wq_item_append(struct xe_exec_queue *q)
>>  	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
>>  }
>>
>> +static void xe_guc_exec_queue_submission_start(struct xe_exec_queue *q)
>> +{
>> +	/*
>> +	 * If the exec queue is part of a multi queue group, then start submission
>> +	 * on all queues of the multi queue group.
>> +	 */
>> +	if (xe_exec_queue_is_multi_queue(q)) {
>> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +		struct xe_exec_queue *eq;
>> +
>> +		xe_sched_submission_start(&primary->guc->sched);
>> +
>> +		mutex_lock(&group->list_lock);
>> +		list_for_each_entry(eq, &group->list, multi_queue.link)
>> +			xe_sched_submission_start(&eq->guc->sched);
>> +		mutex_unlock(&group->list_lock);
>> +	} else {
>> +		xe_sched_submission_start(&q->guc->sched);
>> +	}
>> +}
>> +
>> +static void xe_guc_exec_queue_submission_stop(struct xe_exec_queue *q)
>> +{
>> +	/*
>> +	 * If the exec queue is part of a multi queue group, then stop submission
>> +	 * on all queues of the multi queue group.
>> +	 */
>> +	if (xe_exec_queue_is_multi_queue(q)) {
>> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +		struct xe_exec_queue *eq;
>> +
>> +		xe_sched_submission_stop(&primary->guc->sched);
>> +
>> +		mutex_lock(&group->list_lock);
>> +		list_for_each_entry(eq, &group->list, multi_queue.link)
>> +			xe_sched_submission_stop(&eq->guc->sched);
>> +		mutex_unlock(&group->list_lock);
>> +	} else {
>> +		xe_sched_submission_stop(&q->guc->sched);
>> +	}
>> +}
>> +
>>  #define RESUME_PENDING	~0x0ull
>>  static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>>  {
>> @@ -1117,20 +1200,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>>  			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>>  }
>>
>> -static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>> -{
>> -	struct xe_guc *guc = exec_queue_to_guc(q);
>> -	struct xe_device *xe = guc_to_xe(guc);
>> -
>> -	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
>> -	wake_up_all(&xe->ufence_wq);
>> -
>> -	if (xe_exec_queue_is_lr(q))
>> -		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
>> -	else
>> -		xe_sched_tdr_queue_imm(&q->guc->sched);
>> -}
>> -
>>  /**
>>   * xe_guc_submit_wedge() - Wedge GuC submission
>>   * @guc: the GuC object
>> @@ -1204,8 +1273,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>>  	if (!exec_queue_killed(q))
>>  		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>>
>> -	/* Kill the run_job / process_msg entry points */
>> -	xe_sched_submission_stop(sched);
>> +	/*
>> +	 * Kill the run_job / process_msg entry points.
>> +	 * As this function is serialized across exec queues, it is safe to
>> +	 * stop and restart submission on all queues of a multi queue group.
>> +	 */
>> +	xe_guc_exec_queue_submission_stop(q);
>>
>>  	/*
>>  	 * Engine state now mostly stable, disable scheduling / deregister if
>> @@ -1241,7 +1314,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>>  				   q->guc->id);
>>  			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
>>  				       q->guc->id);
>> -			xe_sched_submission_start(sched);
>> +			xe_guc_exec_queue_submission_start(q);
>>  			xe_gt_reset_async(q->gt);
>>  			return;
>>  		}
>> @@ -1252,7 +1325,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>>
>>  	xe_hw_fence_irq_stop(q->fence_irq);
>>
>> -	xe_sched_submission_start(sched);
>> +	xe_guc_exec_queue_submission_start(q);
>>
>>  	spin_lock(&sched->base.job_list_lock);
>>  	list_for_each_entry(job, &sched->base.pending_list, drm.list)
>> @@ -1410,8 +1483,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>  	    vf_recovery(guc))
>>  		return DRM_GPU_SCHED_STAT_NO_HANG;
>>
>> -	/* Kill the run_job entry point */
>> -	xe_sched_submission_stop(sched);
>> +	/*
>> +	 * Kill the run_job entry point.
>> +	 * As this function is serialized across exec queues, it is safe to
>> +	 * stop and restart submission on all queues of a multi queue group.
>> +	 */
>> +	xe_guc_exec_queue_submission_stop(q);
>>
>>  	/* Must check all state after stopping scheduler */
>>  	skip_timeout_check = exec_queue_reset(q) ||
>> @@ -1568,7 +1645,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>  	 * fences that are complete
>>  	 */
>>  	xe_sched_add_pending_job(sched, job);
>> -	xe_sched_submission_start(sched);
>> +	xe_guc_exec_queue_submission_start(q);
>>
>>  	xe_guc_exec_queue_trigger_cleanup(q);
>>
>> @@ -1592,7 +1669,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>  	 * but there is not currently an easy way to do in DRM scheduler. With
>>  	 * some thought, do this in a follow up.
>>  	 */
>> -	xe_sched_submission_start(sched);
>> +	xe_guc_exec_queue_submission_start(q);
>>  handle_vf_resume:
>>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>>  }
>> @@ -1623,6 +1700,14 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
>>  	guard(xe_pm_runtime)(guc_to_xe(guc));
>>  	trace_xe_exec_queue_destroy(q);
>>
>> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +
>> +		mutex_lock(&group->list_lock);
>> +		list_del(&q->multi_queue.link);
>> +		mutex_unlock(&group->list_lock);
>> +	}
>> +
>>  	if (xe_exec_queue_is_lr(q))
>>  		cancel_work_sync(&ge->lr_tdr);
>>  	/* Confirm no work left behind accessing device structures */
>> @@ -1913,6 +1998,19 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>
>>  	xe_exec_queue_assign_name(q, q->guc->id);
>>
>> +	/*
>> +	 * Maintain secondary queues of the multi queue group in a list
>> +	 * for handling dependencies across the queues in the group.
>> +	 */
>> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +
>> +		INIT_LIST_HEAD(&q->multi_queue.link);
>> +		mutex_lock(&group->list_lock);
>> +		list_add_tail(&q->multi_queue.link, &group->list);
>> +		mutex_unlock(&group->list_lock);
>> +	}
>> +
>>  	trace_xe_exec_queue_create(q);
>>
>>  	return 0;
>> @@ -2140,6 +2238,10 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>>
>>  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>>  {
>> +	if (xe_exec_queue_is_multi_queue_secondary(q) &&
>> +	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
>> +		return true;
>> +
>>  	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
>>  }
>>
>> @@ -2801,9 +2903,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>  	 * jobs by setting timeout of the job to the minimum value kicking
>>  	 * guc_exec_queue_timedout_job.
>>  	 */
>> -	set_exec_queue_reset(q);
>> -	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>> -		xe_guc_exec_queue_trigger_cleanup(q);
>> +	xe_guc_exec_queue_reset_trigger_cleanup(q);
>>
>>  	return 0;
>>  }
>> @@ -2882,9 +2982,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>  	trace_xe_exec_queue_memory_cat_error(q);
>>
>>  	/* Treat the same as engine reset */
>> -	set_exec_queue_reset(q);
>> -	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>> -		xe_guc_exec_queue_trigger_cleanup(q);
>> +	xe_guc_exec_queue_reset_trigger_cleanup(q);
>>
>>  	return 0;
>>  }
>> --
>> 2.43.0
>>
