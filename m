Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00A2C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 05:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6332410E106;
	Wed, 10 Jan 2024 05:22:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF79E10E106
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 05:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704864170; x=1736400170;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gwDO0YFHKi1Ju92EufMZtsLjB7ug/cZpLid2YhsA13M=;
 b=U0vlP/dLbrVo4DLpnIM2+nOIBqQXrDRHxPXxC+/cTJ9gF5ygbjohm1Kj
 Id1x7YubOJbLpzRQrbHb9N6hZhcvvXOcyAKeCH5RVv/6UgNOEHtMdR5D7
 /k4KutEFu467DTqrdLf6CFsgSSU9KgBW0Bli0Plq8LqkQkS/uEZLEgHWG
 3LzbfNVQ3Gj+TcHQOQOW99kgUeiUkAW5PDWagOkGlmu3qsF+74xxIDPMQ
 EpZiorW1HTvf09YTuymiH9IkqXEQHc4fu4BIjo22qXe/oevZ7P7i39Prf
 onHXuNpYMU6NNdBZmMvpTUeRyYVBl+d1aJ1y/9QUKd7CrzD2GR2iKLwhT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5772276"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5772276"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 21:22:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="905398899"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="905398899"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 21:22:49 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 21:22:49 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 21:22:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 21:22:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 21:22:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBsl7H6z/GxQmciYwpjtOKw20/ltkBaY6ZoyWKKGiyTR+r8nVGj2QMIOgNd4BhTlE9FOvZh0SjkY2bLPvZd0IZGZFsGmiiMQdpo1mzB3XFdCxV/6rvIaMq+DQ9RR2O/nU3yOdeEKBNsVy3esdy2QtZQHc7lhovXLe4WkomDBtNrdGvHljSdEimIztuC5qWzoKfnra6CIXaNDrINmINbQnAljjjlco/Zc+gXjPb8kse+eNXZ/fzfGvcJ4ohws35g7AI3Ya7g0CIs++pULD8nAbHZePR1p9ZbqXoexlXYJ31gTmpewgJFc/gXd8yNDSrDCXeFP6lLtpZVsgecwtkSEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJKE2XAvBEBuvhTs/K37uQc0KlVp3gOheLFs/kPmYT4=;
 b=EUzLHAHyZ03JtTvML3KkPwveNCIK/f1IDSyr7romrSeiq5o1dOJLCXuNOwEbuVFXQ6jXEZaysPwq1Yz9bLPd6oS14eseA+R7Qe5niYdMFIa8WlDMKtnO22oY0ppDzuNcLRu2S1bFJJV5vytXiLuPsJFqWcDBZr3RLpUn0nZldZ6L+3rETtHpr3hv4/gtfU5KaHHip0zMsI/nS2qCAvhSHkSKctuMsC1GZ8vq5dAj2tziOR/lwnlofAt6S/b7UkOvLvlhXo+QnvNqy11Jsy3NV3Ri7MUTo2BkvLJbmixm9uwUUfehYIXz4LrYudTud2oAUcpxrpQaAhxLomBH412eXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5155.namprd11.prod.outlook.com (2603:10b6:303:91::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 05:22:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 05:22:45 +0000
Date: Wed, 10 Jan 2024 05:21:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [RFC 00/20] First attempt to kill mem_access
Message-ID: <ZZ4pXlyXImJ52o6M@DUT025-TGLU.fm.intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: aedd6a86-25c0-452d-9e2f-08dc119c2d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bwnvvowQkqFqaFwIi15uFoV1Eon82thzNU8WyB0fUqcNKob7P9EBOnbBb7nv0ga6phphYHkJA4ugH343tdGpjkczSFi0GYfxO3h/vy7Xi0+GidNoEn7gKa/AdwdGH7Th1ocHGJsuQ8XmvjaYZfeFAmvyvRO8qCw4L8bRZ/9xqEQ5wA1pN+6LFfpPy+6Sj8stCccDkovK0l7sUGTIZ0I8ygxvn38eSuFK23DawUwguZaJn5ZT5GXZLgfQq8VXOiS82eHaIPbwWalJdwLt2hVVCfGceN5TdvsnvNvVR/fZBl5nO+XncKx1glYXZqdyUdq86oE6z+CkJe3o6W4ysthuLppQh4fSd/auMAHLysbtl3jQde9kGi8fRHDRtED8qg7R8fLuUo0k/tWXv3mRP/E4NtePmvvWplN5utEPPrsbf7mCubOhuEtchMlJPTzLAMhO1xgFsJoE10PQG0ZLl+Uy+5G9UgSDu1bRUEbbuEGpogmMTrVyhLRTuLB8syj6OkVDVy2/Gg72XORj83xG7lM5WnSCIWZA2VRH2pIHvKVKY474brBYL0xoZfHkfBcHP4aJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(39860400002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66556008)(66946007)(66476007)(316002)(6862004)(4326008)(8676002)(26005)(478600001)(6636002)(83380400001)(2906002)(5660300002)(41300700001)(38100700002)(8936002)(82960400001)(86362001)(6666004)(6506007)(6512007)(6486002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jEGf4XqfvuBicGEDLJh+7WpaEHfm+9vKOn1pdBAZKKVORYYqkaHF3DyYEAkl?=
 =?us-ascii?Q?yu/Gh3rFnNlTj87OQIYkhTvYrgFVh1zd4EGyrbZHR1Xaaq4AKGwCQ+P90PGh?=
 =?us-ascii?Q?2Y0G28JXR7UHpITVsPv2Zu+yzz4G/VvwFH/weWtbEmYwYddtPHhsZzwPfWKl?=
 =?us-ascii?Q?QYqOYK7EENv1LeZX9AaNGlCiqkYdnTo3qi7LO4w5ODK0nIw/65ZjY1rjtxKT?=
 =?us-ascii?Q?b1GFqRvnc3VDQscMvokTI3JcX4+N9l7iIBD20oWvT5fZj5vesuDtyD7zOcQr?=
 =?us-ascii?Q?XJ4IGzK+1bHR6PqTmDmuCdEzCTzXCgyhTFdlLQTLAM0sm0kfTWM+2Di4MmvI?=
 =?us-ascii?Q?56sqmwEzrDwrpHMRbDj23sR+QdAJrPnPHRBqHhkkdH0vD5zEM/D/D2nEgVX3?=
 =?us-ascii?Q?P7dKz/fAFHR0LQsqA8qSNYIruWgUNiMs5hMaj/5yWcPJQ6SecfdC/stO0ZoQ?=
 =?us-ascii?Q?2ADtfFcxBsc5jpZMaR14th6JEKBtFA2whmbnVwPOyiX+8mGGcivu8+jgq6Jw?=
 =?us-ascii?Q?ELkQXK1SskoHKNAI12a5aT3Ox8P4PIbv0+Q0PvoYgbyXUAupQJne9rhx9sNX?=
 =?us-ascii?Q?G22vNYQgexurs0Hf6tCPIoSMZu9N2Z261hkA2JKN9BWe8r0g12QzHGhWqFyG?=
 =?us-ascii?Q?sZzUNo5xc5CLpT3dUSa7iWcFvlmFxakLQFL57Uwrx0uWQhzoVTrwsEBVcGC2?=
 =?us-ascii?Q?2nDoxfpdUueevoMXnBwGUCbJn+zzvgbns7HwCiChNxljyX7AOT3RPr5ZOpum?=
 =?us-ascii?Q?wdKz1gePxqHD4VCrOeiqYIrsHbrSxAtTkiFhh1E0O1psggYExwMqLuTulIdk?=
 =?us-ascii?Q?lKNnXoYz8sxpa3w63cn0cngZ6iapkxZ6fAlFzAV0GxuWcjW4cQrU5Fc4gc3p?=
 =?us-ascii?Q?YVSh024kXMxycGWplR49yIx1MR0PjVvlAbmo5uLUYrnxH5CWYEt2+7XgGBM4?=
 =?us-ascii?Q?py6grFw0lwgu3PyAfU77Szz0dpKnN6Sa4XMgEOqg3zomuBnSZ7FwRCgVFYX6?=
 =?us-ascii?Q?M437kiiSiKwFbc/XLGYGnD8mgrK28sv1WZ07z3avipUp8eZhyXNYCcNtnRRI?=
 =?us-ascii?Q?qoJUm5bCqLba1g4Ao6vskiGnCcFIFPCH/8I7x1BKMLwTcLpIEB7M5uJa4IU+?=
 =?us-ascii?Q?3J6tWOegrpdau+eS2QExWJDO3b1kUASklVAVgIw/WwjqJbvVv1OY8So+96XR?=
 =?us-ascii?Q?cEYnyEDJ1TD45uM9hGEdM3lygPUe2/MEUuvsfXOQO3vYq78MwU07OrltMI6P?=
 =?us-ascii?Q?FLy2my2fyfkowPuMFBIXWN+I9nlGSRfJDz//cWs/34rnt5ELp8FHll1AIYpG?=
 =?us-ascii?Q?o0TyPuOxWfNvaCy2FlHyDG2LVU/r4ClC+V/IuEVSfCB0VVPy4isr0ZjN3zZZ?=
 =?us-ascii?Q?mhJeytKO/dfsYU1NW2xQ7UacHk2uO63LuYIdHKM7oRmn7JGXXkSjV838LtiF?=
 =?us-ascii?Q?9LqqFi2RIb4v7YHbgtLMZ733uzMwBtGHipHVK2H0Sdc/LUEKDYN1Z8tZnpRg?=
 =?us-ascii?Q?7Gyxv3pSy94zdKUL0qEIrRYKTXRRIBGmTfTnWRwa2+weKwRjw43nTskptdER?=
 =?us-ascii?Q?8fVHpHxV9gLXCx4GDO6Kyyu70YSool137WZAaAIcsymoJX8s6Mn9qFKdik+e?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aedd6a86-25c0-452d-9e2f-08dc119c2d30
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 05:22:45.1673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98WPy9Df9D1tPw35anyqynBhYy3LjofH0781PlCRY0yU+t2EzEEwCh2uGMembXwvrWaLrVPrLoRQny81zaRCzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5155
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

On Wed, Dec 27, 2023 at 09:12:12PM -0500, Rodrigo Vivi wrote:
> At first the mem_access seemed a good idea since it would ensure
> we could map every memory access and apply some workarounds and
> then use that to ensure that the device is awake.
> 
> However it has become a nightmare in locking conflicts with memory
> locking. The only sane way to go is to move the runtime_pm protection
> to the outer bounds and ensure that the device is resumed way
> before memory locking.
> 
> So, this RFC here is the first attempt to kill the mem access and
> have a clean rpm handling on the outer bounds.
> 
> Well, at this time we already know that we need to solve some TLB
> invalidation issues and the last patch in this series needs to
> be split in smaller pieces. But I'd like to at lest get
> the discussion started.
> 
> Happy New Year,
> Rodrigo.
> 

Hi Rodrigo - I haven't fully reviewed everything but noticed a few
issues to discuss.

1. LR mode VMs
	- I don't think the PM refs taken for LR jobs works. LR job's hw
	  fence is signal immediately after scheduling the job to the
	  hardware. Once the hw fence is signalled, the job can be
	  typically be freed.
	- How about we just take a PM reference when a LR VM is opened?

2. Tearing down exec queues
	- Tearing down exec queues requires a ping-ping with the GuC
	  which likely needs PM ref

3. Schedule enable G2H
	- First job on an exec queue will issue schedule enable H2G
	  which results in a G2H. This G2H could be recieved after the
	  job is freed

4. TLB Invalidations
	- Send H2G, receive G2H when done
	- Four cases
		a) From a (un)bind job
			- Job can free before invalidation issued /
			  complete
		b) GGTT invalidations
			- BO creation, should be covered by IOCTL PM ref
		c) Userptr invalidation / BO move on LR VM
			- should be covered by #1 if LR VM take PM ref
		d) Page fault handler
			- should be covered by #1 if LR VM take PM ref

5. SRIOV Relay?
	- Haven't looked into this all might have issues here too?

2, 3, 4a all are H2G waiting on G2H. Perhaps it is simplest to build the
PM references into the CT layer? A lower layer but off the top my head
not seeing a better option really.

e.g. A CT send that expects a G2H takes a PM ref with the caveat we
expect the device to already have a PM ref. The receive can drop the PM
ref and it can transition to zero.

Thoughts?

Matt

> Rodrigo Vivi (20):
>   drm/xe: Document Xe PM component
>   drm/xe: Fix display runtime_pm handling
>   drm/xe: Create a xe_pm_runtime_resume_and_get variant for display
>   drm/xe: Convert xe_pm_runtime_{get,put} to void and protect from
>     recursion
>   drm/xe: Prepare display for D3Cold
>   drm/xe: Convert mem_access assertion towards the runtime_pm state
>   drm/xe: Runtime PM wake on every IOCTL
>   drm/xe: Runtime PM wake on every exec
>   drm/xe: Runtime PM wake on every sysfs call
>   drm/xe: Sort some xe_pm_runtime related functions
>   drm/xe: Ensure device is awake before removing it
>   drm/xe: Remove mem_access from guc_pc calls
>   drm/xe: Runtime PM wake on every debugfs call
>   drm/xe: Replace dma_buf mem_access per direct xe_pm_runtime calls
>   drm/xe: Allow GuC CT fast path and worker regardless of runtime_pm
>   drm/xe: Remove mem_access calls from migration
>   drm/xe: Removing extra mem_access protection from runtime pm
>   drm/xe: Convert hwmon from mem_access to xe_pm_runtime calls
>   drm/xe: Remove unused runtime pm helper
>   drm/xe: Mega Kill of mem_access
> 
>  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   8 +-
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        |   7 +-
>  drivers/gpu/drm/xe/tests/xe_bo.c              |   8 -
>  drivers/gpu/drm/xe/tests/xe_migrate.c         |   2 -
>  drivers/gpu/drm/xe/tests/xe_mocs.c            |   4 -
>  drivers/gpu/drm/xe/xe_bo.c                    |   5 -
>  drivers/gpu/drm/xe/xe_debugfs.c               |  10 +-
>  drivers/gpu/drm/xe/xe_device.c                | 129 ++++-------
>  drivers/gpu/drm/xe/xe_device.h                |   9 -
>  drivers/gpu/drm/xe/xe_device_sysfs.c          |   4 +
>  drivers/gpu/drm/xe/xe_device_types.h          |   9 -
>  drivers/gpu/drm/xe/xe_dma_buf.c               |   5 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c            |  18 --
>  drivers/gpu/drm/xe/xe_ggtt.c                  |   6 -
>  drivers/gpu/drm/xe/xe_gsc.c                   |   3 -
>  drivers/gpu/drm/xe/xe_gt.c                    |  17 --
>  drivers/gpu/drm/xe/xe_gt_debugfs.c            |  53 ++++-
>  drivers/gpu/drm/xe/xe_gt_freq.c               |  38 +++-
>  drivers/gpu/drm/xe/xe_gt_idle.c               |  23 +-
>  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     |   3 +
>  drivers/gpu/drm/xe/xe_guc_ct.c                |  40 ----
>  drivers/gpu/drm/xe/xe_guc_debugfs.c           |   9 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c                |  62 +----
>  drivers/gpu/drm/xe/xe_huc_debugfs.c           |   5 +-
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  58 ++++-
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   7 +
>  drivers/gpu/drm/xe/xe_hwmon.c                 |  25 ++-
>  drivers/gpu/drm/xe/xe_pat.c                   |  10 -
>  drivers/gpu/drm/xe/xe_pci.c                   |   2 +-
>  drivers/gpu/drm/xe/xe_pm.c                    | 211 ++++++++++++++----
>  drivers/gpu/drm/xe/xe_pm.h                    |   9 +-
>  drivers/gpu/drm/xe/xe_query.c                 |   4 -
>  drivers/gpu/drm/xe/xe_sched_job.c             |  10 +-
>  drivers/gpu/drm/xe/xe_tile.c                  |  10 +-
>  drivers/gpu/drm/xe/xe_tile_sysfs.c            |   1 +
>  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           |   5 +-
>  drivers/gpu/drm/xe/xe_vm.c                    |   7 -
>  37 files changed, 445 insertions(+), 391 deletions(-)
> 
> -- 
> 2.43.0
> 
