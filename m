Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FD2C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 15:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82F110E488;
	Wed, 26 Jul 2023 15:13:48 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CEB10E488
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 15:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690384426; x=1721920426;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GCTYThHPzZD2JlJuZbKcsSATj+RchIqYh5lRrhfJd+o=;
 b=NGKfQ6a51j4wJH2ccySkcfdQUGm9/6sM/nXdukcvCCkAR5xsc/iPLtuX
 pplcseWmXZIIhzlzrmtoiNOSwos3xoUhYXHS+YeMh95FJl0F+OxEqFv22
 ZRMBwmEA84mU5noXRkb9dtO/CsgL7HzzSEVoe5y2yx1e49QJ0p9s3X24M
 +33HTljpun99mcFvPeykcyRFH4NKmc+tZXi2EX0UxClwhRugiTzr2yRtB
 NMmQleYTAncKDGRt15LhkKgViPZaxbqdGKc7WElMj2ii4WIstDjZYis+T
 C4oMG48RL9usQFxS/vsRazlJcxlUjOP7SDlSAfAjmX+IMePfF/9D9jMsq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371656122"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="371656122"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 08:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840290563"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="840290563"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2023 08:13:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 08:13:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 08:13:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 08:13:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMlS1x3gOjvRy2Hg7laHLEzFKEYsqlFn8qrLU3KqN/Z9fQGUAjFytA9Llf8tMCx8yzqLtQ1tOytTv8iHqF5g/4cHh5TuJo/mzMD+LKiB4xPeGiRlXvHPr9yH4UuS0hi7BmWP4L9rrAmxDb5VDFYqpPYIOpqlJnTVsFlOGaDjd/7rrQbN2sz/vGHI6o1RoAK3BjY+6O5U83QCscIG86FQ3j0y9Ppg8FOkLBquT7tvInI/swWRDoOyH3vnaScJKnQQbP7U9cNWgEeFV+WRbWZv1X8Vu/L+jVfoTYQj8Rciqah0P53CbqLNkFrfqwd6wK8LIw68MnFB5fKemnxuElkACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsMlDZwzzKpkxgqjolROIXa8ACNj+YqO0oPJajkIqOw=;
 b=PqaSkeeCcfY+Rgd4hwCuROi795pGeEVtbrJD7ewXdsmZECXujM9n3ms45xoH+sjKwuBB32SFnpPoW5AIuuGiBEuLT7cnzjKNRcgFLg+bxEvshmG5+yXaUbOSJRdn8ydIC8z98EYfkBNJa3Z5lZkA/Q7PsO+guKAp4pwYZFe6FyZZ9BQVGOcKuc/BBG0tOJsGSHP2vKRdZsrVEqjo27gqOB9INlQV48fDdkhYH6whN4uoGe484gSgpob5xzC1ijc23rCnTMKSqn4PPSCUF2QSkt+4RdYxnTscpO3I1MB7m8bv8NmrXIpnC/I/s7UhkwsN9WZXMkvIvpxruOfUJIENVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6524.namprd11.prod.outlook.com (2603:10b6:510:210::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 15:13:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 15:13:33 +0000
Date: Wed, 26 Jul 2023 12:13:28 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <a4ig4q3ytypqnzssnymrxzwpqq2fovr2wonl5lfrqbxghnsobp@3b7vuuaynau3>
References: <20230725202836.3854908-1-lucas.demarchi@intel.com>
 <20230725202836.3854908-2-lucas.demarchi@intel.com>
 <20230725224718.GX209733@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230725224718.GX209733@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR11CA0068.namprd11.prod.outlook.com
 (2603:10b6:a03:80::45) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: ea99736d-5764-43cc-b772-08db8deae032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X2jRN9z1RACe1kbNPwTuT7UUM60RtuJgPMyF41kBLYAunAgg0S5dLL+1n2vBM1IdgiAXoADV1PJt0xjS3pzfPfEfB43n+hTlmfswIZKV+z5dwN5zH6Kf0gH8Dd0bpDjlpUAT2fseIEIIs0m/2Bwx5SfqkbDcokNiseRPkdcwb+PNETXhnrqmx64Rd9oHHfRgutI+13NKfRc+fGhlQ4/+w0APWt93C3MjdqiQPHCzoQ4SMnrTfh2ONXssv12aI1zlQS2A8caA51KYnIxgRANDExm2KTcybPpl0mRT99B+GY2/Mu3kv8j7kwKNaUTmz6fCpLRtbYqM96EtLKI+x6dbsz6rn+OZJRnLvLqO7qp+6/BdxNuOgwcZeyecDfLDJQ0PT5L+xhQ1uYZG8kU+8F80hDUcqVLetzEzU9UsMbQ5ATeZ6FbNoFZUfGRrvPa/sgUBCVMkWYh4dgZbqp+rL913F/aqOX4U3ZElzEqGPBid4Lc6m6YL611eL4k9bravEmHCIimwkqYlFSVNaDd9sHvMvuyYr7D7LMIixjCTYsCDsr6cqlsvYXOWMMitQAiCogeJXNUGWjctyCp7d4DW5sHOA5dsxNDD2Jy6juYT4u0IV0Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199021)(6486002)(82960400001)(6666004)(83380400001)(8936002)(478600001)(26005)(6506007)(6512007)(9686003)(66946007)(38100700002)(66476007)(54906003)(66556008)(6636002)(4326008)(186003)(6862004)(8676002)(5660300002)(41300700001)(316002)(2906002)(33716001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PnHUZ40rWFNmxyxq/tWWTeJiKnKyrtKbTRo8zBDdbJ6aT7nuBGkAmyjqGH+z?=
 =?us-ascii?Q?QXPkjsKQBmv5boixZrcHhgSgkbJjLP9nLW4yEnF+7wP43nSLq+Ox/ok5MDQa?=
 =?us-ascii?Q?6AM9GWSeCCWtAM/BB3/X7WinkPg/rXI7mFz5/6axqgB+dWI4J1k21Wukx26F?=
 =?us-ascii?Q?8xX5dXdzedQ4bKXlO+iTGJBCq3Ib1Lk0BjWOQ4McYVteiPyyZKQ8igZdUhRz?=
 =?us-ascii?Q?Xa7vl0/DWhtamATSN3OJbiT0R/YN+qeKVjU/wLBOQvkeZcij78hGmHTpmKoN?=
 =?us-ascii?Q?cng70n+2/h+rYbch5rJvsvgfDo50d12j0vrcRsTqsh1Kk95/AAZr12iFs3Po?=
 =?us-ascii?Q?o324QghP4HM2ELD/Hx4LJW+NuMrt4ob5erYXwNze/I7XyPaKjE+7ygUpW9nI?=
 =?us-ascii?Q?jTUB0YVe1tMie2WbkeHVv7EtTIs0E+kVTVe3bX8ydIo1iPHbWU2MwTgkix94?=
 =?us-ascii?Q?rCkl6cNteKMeWy2FJrhjni8NBGIXwkGKbrl+3zM0HKOgf6gFOa2s42FKEkjs?=
 =?us-ascii?Q?CZY+hN/StNU7coya7KvSDPk1N1VfK60zkmhOcIM438bI8o9ElaJZv2gIv90r?=
 =?us-ascii?Q?5FE+3Mzu0sLo54ZXFLHQcZR6wTggnHKfSDYsZxSS7Tgt068OeQCKLD5BYcwN?=
 =?us-ascii?Q?d+u9YO4G7PLJ2kO1Mg0Ls7JwVaKjJm0pp/Ndy4D/vvXSff/VegsH42dRXB0s?=
 =?us-ascii?Q?A+TWfwV46YBz/pp/FFh+k7neF4CBpv8l3E/SO53sxN4SzfYLstJQRYEmx18l?=
 =?us-ascii?Q?bDJbiJq/W9YnOLA4tyzRpDVUOgfoOpROgkwlVDaQ4clI2ZOSbY1S3wWuOfjC?=
 =?us-ascii?Q?/ilFFaafaA4lMgQ5hoWXzkVFS6HsNkcs54aquFL3jR1ACfqp5oaxf29BoDCS?=
 =?us-ascii?Q?ZUUy7Uhx6ZiYmtUaD8rRPgXQrmJ+yTYdOz7/5RkjPAi+JxKysylrvaIc+wov?=
 =?us-ascii?Q?SUYq7fhzx+Ou9RC7sBgBvwnL0iieFSdViJefl3f+chHS9Xu96gxO4MTXc6+9?=
 =?us-ascii?Q?huo6g3qPN3oI+5row2+CcAfcDnSU3Qs4iwCrTiX1cDxSKPSytt+pvTFA9ZO+?=
 =?us-ascii?Q?9udjeMmjD8WmpLtKy9Cny5ydcdxMe0NgLj2x2eiY6PRMngWtWDEYjsOqNm6n?=
 =?us-ascii?Q?OZa+fjhVRJtTL97RqfZtJ/iMLtLyokwCNYQj5rRaEENPiZH//jwxvJD4aCaQ?=
 =?us-ascii?Q?my3b3B5WCh+XU73NzHUd7FOZwzBg/vLeUMUeGgad8QMBaUDgPoLkBV3Tw9VZ?=
 =?us-ascii?Q?Xc1V6eYU2v4zxPM0ibtYAuVBXdFvBR360jPVKsOwKVygDdH4GtBBnhkA/pgI?=
 =?us-ascii?Q?E7eRqmhhC+NlPi6vnY8E+O1lOFGWvFsfBNwqwQy8N1fNhjIkOWuVNu5aur7F?=
 =?us-ascii?Q?NSDuq3n0O/eVnnRT8Hbys7HgykiqyfzSA5Hb8ydN4/mg53S5iHGa53A3ZUtz?=
 =?us-ascii?Q?/aMbgZJKky51KJozQh8ChvkIaNQVYx2e7f4ufS995i1wInUy+Y8M4j/3nrRx?=
 =?us-ascii?Q?/K16vDSX0Osy1W4z7XQS3GM1ZUtf6GnWQ1CAImQ/q1CwDcMwkpJwsD6Xm5kh?=
 =?us-ascii?Q?f7GFDW2JvBXwDXlJ6YCT+L/qLUm4Nv810QOecgQVen1+hVQkTBOuECuMZEJI?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea99736d-5764-43cc-b772-08db8deae032
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 15:13:32.9605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0r3EqLlQqSohtKcOmQerHfIEhSV4IHZ/OJ1BCWBw7WuzqbTPIpv1DF3qrkXZB6kjSfvrooIL+IFixssnXVotaazt8D6wZ2JPCgxQreM92m4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6524
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Fix MTL+ stolen memory mapping
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jul 25, 2023 at 03:47:18PM -0700, Matt Roper wrote:
>On Tue, Jul 25, 2023 at 01:28:33PM -0700, Lucas De Marchi wrote:
>> Based on commit 8d8d062be6b9 ("drm/i915/mtl: Fix MTL stolen memory GGTT
>> mapping"). For stolen on MTL and beyond, the address in the PTE is the
>> offset from DSM base. While at it, update the comments explaining each
>> part of the calculation.
>>
>> v2: Also change resource_is_stolen_vram() so the right PTE bit is set
>
>With a bit more testing locally I noticed that I'm seeing some warnings
>and crashes on driver unload when display is enabled.  I'm not 100% sure
>they're tied to this, but it seems like they could be.
>
>The first warning is
>
>    WARNING: CPU: 10 PID: 4710 at drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:324 ttm_vram_mgr_fini+0x15e/0x170 [xe]
>
>which is
>
>        WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
>
>From there things go downhill --- circular locking detected, slab cache
>problems, and KASAN use-after-free reports.

I can only reproduce the warnings above, not the crashes, circular
lockings etc. They don't seem related to this patch. More below.

>
>Without digging through the code in depth, my worry is that by just
>marking this stolen memory as vram everywhere in the driver, we try to
>return the framebuffer to the otherwise empty/uninitialized VRAM pool,
>even though it isn't truly VRAM.
>
>Maybe it would be better to make a change with less side effects
>elsewhere in the code.  E.g., add a "resource_is_stolen_devmem" that
>only gets called from the pagetable encoding functions to set the DM=1
>bit and not anywhere else?

I think it would make it clearer about the intent since the stolen
memory is not actually vram, it's just accessed through the PCI BAR. I
did typed this all into new patches for this series, but it I still
reproduce the warnings above. They seem related to the small BAR
addition that added the tracking for the visible portion of the BAR.

For stolen, it's always 100% visible. Loading the driver without
display (no warning on module removal):

root@mtl: ~# cat  /sys/kernel/debug/dri/0/stolen_mm
   use_type: 1
   use_tt: 0
   size: 62914560
   usage: 0
default_page_size: 4KiB
visible_avail: 60MiB
visible_size: 60MiB
chunk_size: 4KiB, total: 60MiB, free: 60MiB
...

vs loading it with display:

root@mtl # cat  /sys/kernel/debug/dri/0/stolen_mm
   use_type: 1
   use_tt: 0
   size: 62914560
   usage: 25165824
default_page_size: 4KiB
visible_avail: 36MiB
visible_size: 60MiB
chunk_size: 4KiB, total: 60MiB, free: 36MiB

 From dmesg:
[ 3026.756075] xe 0000:00:02.0: [drm:xe_ttm_stolen_mgr_init [xe]] Initialized stolen memory support with 62914560 bytes
[ 3029.670666] xe 0000:00:02.0: [drm] Allocated fbdev into stolen
[ 3030.009260] xe 0000:00:02.0: [drm:intel_fbc_update [xe]] reserved 16777216 bytes of contiguous stolen space for FBC, limit: 1

So the allocations that remain on stolen seem to be the fbdev + FBC.
I wonder if the fini order is correct wrt display and we are returning
those before destroying the ttm mananger. Cc'ing Matt Auld and Maarten
to check if they have additional clues. I will send the next version
since I believe the approach without overriding is_vram is clearer and I
have several other fixes/cleanups piling there.

I will try it on TGL or ADL-P to see if I can reproduce there too.

Lucas De Marchi

>
>Or maybe these warnings are unrelated; I haven't tried unloading with
>display on any other platforms recently, so maybe it's a pre-existing
>problem.
>
>
>Matt
>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_bo.c             |  3 ++-
>>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 15 +++++++++++++--
>>  2 files changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 10858fcf4f62..5379d8e5affb 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -61,7 +61,8 @@ bool mem_type_is_vram(u32 mem_type)
>>
>>  static bool resource_is_stolen_vram(struct xe_device *xe, struct ttm_resource *res)
>>  {
>> -	return res->mem_type == XE_PL_STOLEN && IS_DGFX(xe);
>> +	return res->mem_type == XE_PL_STOLEN &&
>> +		(IS_DGFX(xe) || GRAPHICS_VERx100(xe) >= 1270);
>>  }
>>
>>  static bool resource_is_vram(struct ttm_resource *res)
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> index 21ecc734f10a..271b3fba4129 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> @@ -94,11 +94,22 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
>>
>>  	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
>>
>> -	/* check GGMS, should be fixed 0x3 (8MB) */
>> +	/*
>> +	 * Check GGMS: it should be fixed 0x3 (8MB), which corresponds to the
>> +	 * GTT size
>> +	 */
>>  	if (drm_WARN_ON(&xe->drm, (ggc & GGMS_MASK) != GGMS_MASK))
>>  		return 0;
>>
>> -	mgr->stolen_base = mgr->io_base = pci_resource_start(pdev, 2) + SZ_8M;
>> +	/*
>> +	 * Graphics >= 1270 uses the offset to the GSMBASE as address in the
>> +	 * PTEs, together with the DM flag being set. Previously there was no
>> +	 * such flag so the address was the io_base.
>> +	 *
>> +	 * DSMBASE = GSMBASE + 8MB
>> +	 */
>> +	mgr->stolen_base = SZ_8M;
>> +	mgr->io_base = pci_resource_start(pdev, 2) + mgr->stolen_base;
>>
>>  	/* return valid GMS value, -EIO if invalid */
>>  	gms = REG_FIELD_GET(GMS_MASK, ggc);
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
