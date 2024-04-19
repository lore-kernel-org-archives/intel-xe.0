Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8AFC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 19:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC2D112005;
	Fri, 19 Apr 2024 19:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dxuTjVc0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5316C112005
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 19:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713555248; x=1745091248;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SGcAvsb3VEaqUvt4IuY75DeErYtQ23jNkxKibuGX1Ao=;
 b=dxuTjVc02SE6/g/NVIu7RmGg8bAONa8yJxZm++NN2OltXE5jaKoVaQ+L
 KIXo7zeU/tQP21d0vIh9Vv/Hy8tNEEGavmpIwnH9Q7TuuA3W28/7RmuBa
 mVk0dZi6baasBNm4I59Gft2BTzcvuMkB8L26PKPOQICaj0Oljqet++w/u
 lgRginOnzqSu9uO3kd2S4xxOIQCRskqpGRHjav3y8q6cnr3GzvXAONz35
 pBz6vHWWBuCyjd9O5pzpwCPZ51NkVj5VfybGiBPjrUggLNEUGo+Ixrj9d
 7XD6rD5FhEg7SIcNG4kEQWPoXbnuSt2RWbd5M+5N+QsakNqE82OLg9Q2r w==;
X-CSE-ConnectionGUID: eBbZdUUpQhqPqhXXTrJO9g==
X-CSE-MsgGUID: k14LvjmsSeCwxfGK5TNi+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20573406"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="20573406"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 12:34:08 -0700
X-CSE-ConnectionGUID: YfdOGUpjTzi9w9iWWN0hEw==
X-CSE-MsgGUID: Di0yGgatTJ6Hse+CxtK8hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23459823"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 12:34:08 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 12:34:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 12:34:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 12:33:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfKq0ISWDsLgBvqEY+pFFHUib2G79sclzJnC1w5gIkkomTZzyg9ldtnXClexBv+WPXcxmdUeN9iHaKgP8ULHwuXAI57dxNdAUhCiSi0y4OahQ59KMrzI5iAq93kr+ybETMomGK/axRjLcgudSteQ0lKSKAErw0Wi2Hon1InOTICknLCWiH63wOK30MKVDt2vrYmNwqDbFpW9UVIq+vseDXmdKTWB475PD2dEbCfoJZCkRAWBLvGQYL/UYk+q0HpDPlADD9qMV7NxgHjzPG6Mk9a/RB5cnqURYz34JYwZHixHRRQOo2vORiMhuimD3w+16BzgUPDWsgT1DZUwOuKsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOx7LlrTgO9g2z5kHaqmX8Hlf1lOVlyhPn/Qc9L6Og0=;
 b=KnmjuEAoHWuNi3o20WQ42iiIQ84kIyBeesjnZqRNaDtikAIfuXaAdOYSObTONwB6clDczAJM0JMoDV1CsINBPG5LxTGz371KnTUG+Dv6IS7cLoxWLdJDfDygYrI0aGgDBBsDrWeCu/PnkqWCiRnEDgc6gMDeFzljwFqzI+1fyLPwtlcfaaBELymRd5O/9hAGkUMp5JAS3REW/S39hLsUWW5OZdKKKjOkJ5KuWIk299d4JKAFjMmBThLokcXnMlBYUpzOR3YqNLllN2UU+W14ZNjyMeND4ljNONYAGhbwGx76JcXMMnmNl38oMUmxl2DXxDs2oHywvF36ZYkO/aDzYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7101.namprd11.prod.outlook.com (2603:10b6:303:219::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.16; Fri, 19 Apr
 2024 19:33:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Fri, 19 Apr 2024
 19:33:55 +0000
Date: Fri, 19 Apr 2024 19:33:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 07/13] drm/xe: Use xe_vma_ops to implement page fault
 rebinds
Message-ID: <ZiLHE6CMev12xTta@DUT025-TGLU.fm.intel.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-8-matthew.brost@intel.com>
 <SA1PR11MB6991E56CAC410886AAFB0A82920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991E56CAC410886AAFB0A82920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: cc26d8e5-6c19-492f-c889-08dc60a7a6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pz+XwdFikBfU2TerbRO8+B2rryZxPiWwDDjP+KYSasuqCUdC9ymZp6F32n0z?=
 =?us-ascii?Q?oKZhBGGHjbRc6UNfiUe5LAU8po7lXnRet6RGg3KJF8rFjDWg+gnM9NrK8el/?=
 =?us-ascii?Q?mmLIFByD7YlzWbMM653sbfL5f0ruD2rghygw3COc5E/h4Hs7swKLKjte2hwH?=
 =?us-ascii?Q?JFA248NbtQUV2N4IhH5O6wrykNhmnwADnxZCM9CPrZR1WBZjiA1iY4a6T6nn?=
 =?us-ascii?Q?F8gbQyL+vVDxYOHu9ibBwwQGP6vvMA9//1JxY3wSMmlJFKsKxuppEQTRXr47?=
 =?us-ascii?Q?Wxl1E8e0g9LtyT1tlI5X129lQI9ffwSjbHxDr9mqgXRoT7tQ8zkciLawn+I1?=
 =?us-ascii?Q?1tJ9HUGX1v3Rr5oAiLXbACg+mPgcDiZ92lqnddgULbeAyZodf3gDz6lWJqZ0?=
 =?us-ascii?Q?W1QelonWzA/KCtCUvKGEOR4c0D1zESg/pOmtM2fYpGH047UkzE+KLe7cl8Yg?=
 =?us-ascii?Q?NQ3V4NZjpS2YdjbPeHN8QBRLqgapkUpIkoMGgrRglg516yi9vi5+w6Zdrl7S?=
 =?us-ascii?Q?u5EvkWOsVy69U7U1if7BTXTa4TfD43ogPdal44+Rhw63565Yg3gB3falYtVX?=
 =?us-ascii?Q?NtL/pqFOXF44Hh0vwp+Toy81T4T7/9f3pS4RheROKnPYHgvof1naysxAzphR?=
 =?us-ascii?Q?0DOAFikMfAXsQiKe27RliXzm6u/ZVBK8AoQ7Ff5SqReyCFe42HYVM5D/2mxj?=
 =?us-ascii?Q?LzQ0iY77dWnLAXWO4E/+LDRKIwcPQWw1dl05IrIpp5rFyuN1Zuo/V8Utv34e?=
 =?us-ascii?Q?wuvHCQJZ6KY5CjGYLx04AXil+YC1Kqy+8p340yKLa5aOt0qx3J0e83Tj7I32?=
 =?us-ascii?Q?eAmCKkZy9bwgavqB2JuDqp/bArFWD0/ZdrSyc/HzzM4wRA9NZhyyBqUTtXeJ?=
 =?us-ascii?Q?Nd3XP+TSBn8YjquSg/Iao5kaWEelguQronp70GCUFlHZDW/kxgXoF2Y8KVmm?=
 =?us-ascii?Q?t3HR++ZGZJPx2l1eLV322wnfsNtuUJ9zzbCyyRX2DTCQBY96kpZRkgHns4qQ?=
 =?us-ascii?Q?mC/oJx/8TkGSgZUHemRh1a4BDAgr1mhw9b3I/R7OnaH4Eb4nRQSEdFBFjnng?=
 =?us-ascii?Q?G1bdvjFTeR5OojVYpcxunap7dZBLZuzXQN/PPkaJFebJRi4IAWXEYEM+sb67?=
 =?us-ascii?Q?AShZ0RCCvjgpZRUech+Cgx9dWtg5K2t/yeEVh8BxpZiRHfTo+R2MpS0ht1uy?=
 =?us-ascii?Q?foz9GDkKlbwqyzs6c0zKV9pOf6qjEmRv4sfhTA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+PAGynbocpOlKXz1nA5r038DV059eISEL7OT9r1ry+Fz6e3TIqvw/TcuIk/8?=
 =?us-ascii?Q?fGCyprGBOjsQ3b7kB22I2bcJZzu7mZUFFYL3VpTDjW0XrtLGJ7rlwzV5gcNg?=
 =?us-ascii?Q?sefKd5Gjfbl8CYgTeyhEblctNtDbh0kNzLJAbeHDQUIPRBLJ25o0/YlhB2xh?=
 =?us-ascii?Q?TSaU6rHN9OtK6EfPX1ujSnuBPwSi644VNe5r9yPuwPdpHSLQv9n0zrzbgtjN?=
 =?us-ascii?Q?vHqBz71MbKh/tY6M1aJIgGPhyVp9B8mnxFxJbFmMOJtSY7B0YmYo3YK/ldeW?=
 =?us-ascii?Q?Ll8J1nV3mXvGAfxbvwk8IbbsSlzlDD5fuUi8Rmc5hbWkuHzyP59LRSfV2W5o?=
 =?us-ascii?Q?eO5YLPBt/AxX5ch2flrQPSDT8i9Tpd9ZjKvp28GrMexPMX3+DHDNn7DRsBYI?=
 =?us-ascii?Q?vpgH2I79hPvjXXhyvvE+dbpaB8NQION0zywCdwvhcC5+48VkwPd1zv2FM21s?=
 =?us-ascii?Q?bZ6A2kAMJk6umrjOx1U3YqHvM8Tul1bIIPMt2hABVXvJFo1nPl5g1uD1f1Ro?=
 =?us-ascii?Q?latWJ+6URUDAw+SDRV3KvrOxi0hqz6auIG2RIuIE1qsdyljlvNOoW6hUxul8?=
 =?us-ascii?Q?reJsDL5teZ1e32aMQ6G5G5AOnCJZYdwEQya0WEwLfyP+k0uFtUgoW+8tTwCk?=
 =?us-ascii?Q?ZNTkg5lDsDAPUiLaLF28Aa2wgSHyhgmAb+EcpaHETxgRHtHhGXLwQ4yZJKZe?=
 =?us-ascii?Q?wo9h1x7UUuOKbYPSVphJmnQ3QAgyKNh1aNNOFS7YORq1np1MylCfH3XL+k/9?=
 =?us-ascii?Q?kxbRnJ1bLJ3H0RCiUcauW7TDfMo2j0SQvUWFI7xNvCthNBWNA9xKJeyn8n+Z?=
 =?us-ascii?Q?Bh4W/zRmJZI5ZTP361ore5sH1D7gS2TZczlwx0oJXPtUFGLgrvFQQcJghmMG?=
 =?us-ascii?Q?5vJ19oQw2ghAMsSxaUJaAnIjffpqfprHbGIrBAV+0h1xxllGNFSH1AJpneOm?=
 =?us-ascii?Q?MzT9UEH1JzEzVN1YhgJd23oR4ndgxe3PpgM6tQLjO740V1OQwv7yTRVe5GvN?=
 =?us-ascii?Q?QeT6+3d2XrvRBp9NYCgS3ajN8ixmYRhfDh+BtCHOI4yeu9QPevVE4isN/nr8?=
 =?us-ascii?Q?+Lms62yh7JlQpLsFN5v3UGLgcQS/P6gtwijCtHGvd2h6hxiz+LnUBAdeRO1b?=
 =?us-ascii?Q?9Ob8Ykjhl0LgcT6B8VLsX9vENJGWCidsSyXp89v0Tor2pgH4UkbLB3Q4cg8l?=
 =?us-ascii?Q?l18qHFC7r30iaCvJKda4tKdSahG7wuXQEGZJD/4NdBEBeog/Nnau3IWEP21+?=
 =?us-ascii?Q?JZq8oIKHzAdZTqGmKJ+YX7SiI9aZfKIr3NdiV+ykEgt7DCviHuXIwKK+eGRf?=
 =?us-ascii?Q?U0fmJmtXpk6oXyxkMCZrRAegF0AzmxpY3OsDCafWCfW7yT9zI7UMNPfP/aqy?=
 =?us-ascii?Q?xH7tcHlCgEQ14YkzyFq24D+qJVAYQtKWJAz2hK6hhDZfl0R+vn6cRgVnCUWo?=
 =?us-ascii?Q?MMUYe6fQon3HWtylwzHc3viOvxcZiX6Ia1EZzRP+uOUUkipv5EnbdOxXd1OX?=
 =?us-ascii?Q?C9StLdX/XY5Tgxf1J576RzkSmY4di4ReedpG5TMb9YH39rkoBZehl5pPh+NJ?=
 =?us-ascii?Q?edfVdD+yI9lMj4T+To5lpJ5IcjU3gcBFnWZGWDrkav63wd5N+pnkIILe7E+r?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc26d8e5-6c19-492f-c889-08dc60a7a6fc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 19:33:55.8310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fFDF+a/g/7+bQEwdeXDMGC7BfKOZRt8aAYCZ6ktX88YxTKTbdMLSp6ZV5na0d5Fih+KgmYphI/reGH1vA5w5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7101
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

On Fri, Apr 19, 2024 at 08:22:29AM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Matthew Brost
> > Sent: Wednesday, April 10, 2024 1:41 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH 07/13] drm/xe: Use xe_vma_ops to implement page fault
> > rebinds
> > 
> > All page tables updates are moving to a xe_vma_ops interface to
> > implement 1 job per VM bind IOCTL.
> 
> Can you explain why using xe_vma_ops interface is necessary even to bind one vma? I understand it make sense to use this interface to bind multiple vmas. See also below
> 

Essentially once we switch to 1 bind per IOCTL [1] xe_vma_ops is passed
around throughout all the layers. The xe_vma_ops list a single atomic
unit for updating the GPUVA state, internal PT, and GPU page tables. If
at point something fails, xe_vma_ops can be unwound restoring all the
original state.

i.e. __xe_pt_bind_vma is will be deleted and replaces with a function
that accepts a xe_vma_ops list, ops_execute() is the correct place to
hook into the software pipeline as we already have the locks and only
internal PT and GPU page tables need to be updated.

[1] https://patchwork.freedesktop.org/patch/582024/?series=125608&rev=5

> 
>  Add xe_vma_rebind function which is
> > implemented using xe_vma_ops interface. Use xe_vma_rebind in page
> > faults
> > for rebinds.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c | 16 ++++----
> >  drivers/gpu/drm/xe/xe_vm.c           | 57 +++++++++++++++++++++++-----
> >  drivers/gpu/drm/xe/xe_vm.h           |  2 +
> >  drivers/gpu/drm/xe/xe_vm_types.h     |  2 +
> >  4 files changed, 58 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index fa9e9853c53b..040dd142c49c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -19,7 +19,6 @@
> >  #include "xe_guc.h"
> >  #include "xe_guc_ct.h"
> >  #include "xe_migrate.h"
> > -#include "xe_pt.h"
> >  #include "xe_trace.h"
> >  #include "xe_vm.h"
> > 
> > @@ -204,15 +203,14 @@ static int handle_pagefault(struct xe_gt *gt, struct
> > pagefault *pf)
> >  		drm_exec_retry_on_contention(&exec);
> >  		if (ret)
> >  			goto unlock_dma_resv;
> > -	}
> > 
> > -	/* Bind VMA only to the GT that has faulted */
> > -	trace_xe_vma_pf_bind(vma);
> > -	fence = __xe_pt_bind_vma(tile, vma, xe_tile_migrate_engine(tile),
> > NULL, 0,
> > -				 vma->tile_present & BIT(tile->id));
> > -	if (IS_ERR(fence)) {
> > -		ret = PTR_ERR(fence);
> > -		goto unlock_dma_resv;
> > +		/* Bind VMA only to the GT that has faulted */
> > +		trace_xe_vma_pf_bind(vma);
> > +		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
> > +		if (IS_ERR(fence)) {
> > +			ret = PTR_ERR(fence);
> > +			goto unlock_dma_resv;
> > +		}
> >  	}
> > 
> >  	/*
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 8f5b24c8f6cd..54a69fbfbb00 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -815,6 +815,7 @@ static void xe_vm_populate_rebind(struct
> > xe_vma_op *op, struct xe_vma *vma,
> >  				  u8 tile_mask)
> >  {
> >  	INIT_LIST_HEAD(&op->link);
> > +	op->tile_mask = tile_mask;
> >  	op->base.op = DRM_GPUVA_OP_MAP;
> >  	op->base.map.va.addr = vma->gpuva.va.addr;
> >  	op->base.map.va.range = vma->gpuva.va.range;
> > @@ -893,6 +894,33 @@ int xe_vm_rebind(struct xe_vm *vm, bool
> > rebind_worker)
> >  	return err;
> >  }
> > 
> > +struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
> > u8 tile_mask)
> 
> 
> I try to figure out why this function is necessary. We are only binding one vma here. Why we need to create xe_vma_ops list? We are only adding one vma to this list....
> 

See above ability to directly modify page tables without a xe_vma_ops
list will be removed.

Matt

> Oak
> 
> > +{
> > +	struct dma_fence *fence = NULL;
> > +	struct xe_vma_ops vops;
> > +	struct xe_vma_op *op, *next_op;
> > +	int err;
> > +
> > +	lockdep_assert_held(&vm->lock);
> > +	xe_vm_assert_held(vm);
> > +	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
> > +
> > +	xe_vma_ops_init(&vops);
> > +
> > +	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
> > +	if (err)
> > +		return ERR_PTR(err);
> > +
> > +	fence = ops_execute(vm, &vops);
> > +
> > +	list_for_each_entry_safe(op, next_op, &vops.list, link) {
> > +		list_del(&op->link);
> > +		kfree(op);
> > +	}
> > +
> > +	return fence;
> > +}
> > +
> >  static void xe_vma_free(struct xe_vma *vma)
> >  {
> >  	if (xe_vma_is_userptr(vma))
> > @@ -1796,7 +1824,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
> > xe_exec_queue *q,
> >  static struct dma_fence *
> >  xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> >  	       struct xe_sync_entry *syncs, u32 num_syncs,
> > -	       bool first_op, bool last_op)
> > +	       u8 tile_mask, bool first_op, bool last_op)
> >  {
> >  	struct xe_tile *tile;
> >  	struct dma_fence *fence;
> > @@ -1804,7 +1832,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct
> > xe_exec_queue *q,
> >  	struct dma_fence_array *cf = NULL;
> >  	struct xe_vm *vm = xe_vma_vm(vma);
> >  	int cur_fence = 0, i;
> > -	int number_tiles = hweight8(vma->tile_mask);
> > +	int number_tiles = hweight8(tile_mask);
> >  	int err;
> >  	u8 id;
> > 
> > @@ -1818,7 +1846,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct
> > xe_exec_queue *q,
> >  	}
> > 
> >  	for_each_tile(tile, vm->xe, id) {
> > -		if (!(vma->tile_mask & BIT(id)))
> > +		if (!(tile_mask & BIT(id)))
> >  			goto next;
> > 
> >  		fence = __xe_pt_bind_vma(tile, vma, q ? q : vm->q[id],
> > @@ -1886,7 +1914,7 @@ find_ufence_get(struct xe_sync_entry *syncs, u32
> > num_syncs)
> >  static struct dma_fence *
> >  xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct
> > xe_exec_queue *q,
> >  	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
> > -	   bool immediate, bool first_op, bool last_op)
> > +	   u8 tile_mask, bool immediate, bool first_op, bool last_op)
> >  {
> >  	struct dma_fence *fence;
> >  	struct xe_exec_queue *wait_exec_queue =
> > to_wait_exec_queue(vm, q);
> > @@ -1902,8 +1930,8 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma
> > *vma, struct xe_exec_queue *q,
> >  	vma->ufence = ufence ?: vma->ufence;
> > 
> >  	if (immediate) {
> > -		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs,
> > first_op,
> > -				       last_op);
> > +		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs,
> > tile_mask,
> > +				       first_op, last_op);
> >  		if (IS_ERR(fence))
> >  			return fence;
> >  	} else {
> > @@ -2095,7 +2123,7 @@ xe_vm_prefetch(struct xe_vm *vm, struct xe_vma
> > *vma,
> > 
> >  	if (vma->tile_mask != (vma->tile_present & ~vma->tile_invalidated))
> > {
> >  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> > num_syncs,
> > -				  true, first_op, last_op);
> > +				  vma->tile_mask, true, first_op, last_op);
> >  	} else {
> >  		struct dma_fence *fence =
> >  			xe_exec_queue_last_fence_get(wait_exec_queue,
> > vm);
> > @@ -2408,10 +2436,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> > *vm, struct xe_exec_queue *q,
> >  	struct xe_device *xe = vm->xe;
> >  	struct xe_vma_op *last_op = NULL;
> >  	struct drm_gpuva_op *__op;
> > +	struct xe_tile *tile;
> > +	u8 id, tile_mask = 0;
> >  	int err = 0;
> > 
> >  	lockdep_assert_held_write(&vm->lock);
> > 
> > +	for_each_tile(tile, vm->xe, id)
> > +		tile_mask |= 0x1 << id;
> > +
> >  	drm_gpuva_for_each_op(__op, ops) {
> >  		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> >  		struct xe_vma *vma;
> > @@ -2428,6 +2461,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> > *vm, struct xe_exec_queue *q,
> >  		}
> > 
> >  		op->q = q;
> > +		op->tile_mask = tile_mask;
> > 
> >  		switch (op->base.op) {
> >  		case DRM_GPUVA_OP_MAP:
> > @@ -2574,6 +2608,7 @@ static struct dma_fence *op_execute(struct xe_vm
> > *vm, struct xe_vma *vma,
> >  		fence = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> >  				   op->syncs, op->num_syncs,
> >  				   op->map.immediate
> > || !xe_vm_in_fault_mode(vm),
> > +				   op->tile_mask,
> >  				   op->flags & XE_VMA_OP_FIRST,
> >  				   op->flags & XE_VMA_OP_LAST);
> >  		break;
> > @@ -2600,7 +2635,9 @@ static struct dma_fence *op_execute(struct xe_vm
> > *vm, struct xe_vma *vma,
> >  			dma_fence_put(fence);
> >  			fence = xe_vm_bind(vm, op->remap.prev, op->q,
> >  					   xe_vma_bo(op->remap.prev), op-
> > >syncs,
> > -					   op->num_syncs, true, false,
> > +					   op->num_syncs,
> > +					   op->remap.prev->tile_mask, true,
> > +					   false,
> >  					   op->flags & XE_VMA_OP_LAST
> > && !next);
> >  			op->remap.prev->gpuva.flags &=
> > ~XE_VMA_LAST_REBIND;
> >  			if (IS_ERR(fence))
> > @@ -2614,8 +2651,8 @@ static struct dma_fence *op_execute(struct xe_vm
> > *vm, struct xe_vma *vma,
> >  			fence = xe_vm_bind(vm, op->remap.next, op->q,
> >  					   xe_vma_bo(op->remap.next),
> >  					   op->syncs, op->num_syncs,
> > -					   true, false,
> > -					   op->flags & XE_VMA_OP_LAST);
> > +					   op->remap.next->tile_mask, true,
> > +					   false, op->flags &
> > XE_VMA_OP_LAST);
> >  			op->remap.next->gpuva.flags &=
> > ~XE_VMA_LAST_REBIND;
> >  			if (IS_ERR(fence))
> >  				break;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 306cd0934a19..204a4ff63f88 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -208,6 +208,8 @@ int __xe_vm_userptr_needs_repin(struct xe_vm
> > *vm);
> >  int xe_vm_userptr_check_repin(struct xe_vm *vm);
> > 
> >  int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
> > +struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
> > +				u8 tile_mask);
> > 
> >  int xe_vm_invalidate_vma(struct xe_vma *vma);
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 149ab892967e..e9cd6da6263a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -343,6 +343,8 @@ struct xe_vma_op {
> >  	struct list_head link;
> >  	/** @flags: operation flags */
> >  	enum xe_vma_op_flags flags;
> > +	/** @tile_mask: Tile mask for operation */
> > +	u8 tile_mask;
> > 
> >  	union {
> >  		/** @map: VMA map operation specific data */
> > --
> > 2.34.1
> 
