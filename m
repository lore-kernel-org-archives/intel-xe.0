Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBB6C05027
	for <intel-xe@archiver.kernel.org>; Thu,  9 Feb 2023 04:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C660A10E906;
	Thu,  9 Feb 2023 04:54:12 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D0D10E906
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Feb 2023 04:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675918450; x=1707454450;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dTc+njkHGV8Pg7LmyZoW4zhU3cw+kPHXyNXuQQ5pIr4=;
 b=HgSGOVs98rouvnzmxYeBzS6u4QFYA40wku5TUT6mqvnuu/NMYOOVDIPc
 wTRiE4nqdXq/XMqE9Q4EEqmMoe3ndsR4MAKtNaH49XmRMzAc09lMhi1Aq
 9ozccdOLuD+kW76DfQSPCSs7VANyDfpYuPmt9s5tloA/j/sU2AxeKI9Bi
 LfTpeV99PWR5lqT8RmwQKQzrydOayCxL7NBju0x6QUfHu3ZTZUZViCems
 g9v0fKBRBzSSfaK6dCXeCfeQY9tLZJVxfTe2xHxJ2EofqXMs+igmmmRvW
 +J2koTZR7KZSrHO8aMZpO1BMMxFykEj8UoCVLnuT2mHXg8db56ibORb2M A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="416235257"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="416235257"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 20:54:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="645129334"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="645129334"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 08 Feb 2023 20:54:10 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 8 Feb 2023 20:54:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 8 Feb 2023 20:54:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 8 Feb 2023 20:54:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaWHZPFcnd/OlBlBedg9BTj2Gxc+izUjJDfTxwjl/Jzvov/XlBofA7vKYeT1pJo8gAfg4TeSj/z/sMHxksie81+kO3BRTMsqFI+X32zAwG1kEfSai4TIaAr6W/p6CxtG/No7kkYu+ywt0jYYWZXxjODaGnyWrOD8lf4t4diyztsAYIciz0TpyG0c0OBHYCuJfR9CZHqSho9Ohusq3+er0MNYFu1vRlb2bJ7rB1xPPHBKZvpd83VZknM54UyaIjI48olsMuhrDAYPdbRmaTAFC1GrIIqKklaAJHnm3eLDvZ3CUVJUt/DYEQH4XGnCC9YkraGAzmD7WgGw8MwFkkNIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/fBFb+ea+Syfl2haUp71ORL4m9E5a65Qel3JVKqJFI=;
 b=YOuOu3ZGhtXspqA2IsjQ7jr5R9Idb3t7lPOwwBLeRMbVgh3hsBgm9xgb5miu3xQFN9iYZ4whc5Hesao03rNY7RBdcH90Jwz95CWSAYqR5B1f3OGGIQ+uqIEjtfi4SlhGI9GaG7fP4UgTUGInKtL3IXFibLJ8ZhKtSmOYfQB22sJn0sA655Q9ABs9tTjrFXgps6fVkJKIYOoAUnnZibEH05GazdaWUlKANlrQIfMYxnHt/q0+0XTjscQBNSQBpKp4Rp2mxTyQjiLTNkgeEgs1o7ZfX7K94cUn6ntCMqvKjgEqclI/oHsleTZ+0FCzyHKgW8B7PaCGI+Cb4naiesj6sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH0PR11MB5807.namprd11.prod.outlook.com (2603:10b6:510:140::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Thu, 9 Feb
 2023 04:54:07 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e59c:fb1f:1b37:3412]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e59c:fb1f:1b37:3412%3]) with mapi id 15.20.6064.029; Thu, 9 Feb 2023
 04:54:07 +0000
Date: Wed, 8 Feb 2023 20:54:04 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <Y+R8bMDsLhmYY0jw@nvishwa1-DESK>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
 <Y+GBpdMmLUNZ52Ss@nvishwa1-DESK> <Y+PbZbxvrCV0I0hv@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y+PbZbxvrCV0I0hv@intel.com>
X-ClientProxiedBy: SJ0PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::8) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH0PR11MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6c7d7e-435b-4a4f-f1b4-08db0a59ace9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fv4BEz6ruXyZtQrUx9MpGO3haChKyEZFWmjJ4WBG+x+iNz5ClIan9RR2m5HGphDPpVWApAt3xpABr1UubEyauN2NuRHPNX75nqpexSxXKKvoxEVe13jBdA6L580s6/zckTGN1GQ8gaQT+kEDU0NmX4240+YqxJJJVEQx5aV/KDQT59Z5tQMdFPhoNJzIsQMVl1Q/PgYGW7ECU4tnzFXu9CKVj8A+4qCji0FYhFOKGC6Xso0BijC83h2wFpvi5WCcxq2VMO/nBC7SLqN+m29gkvYvnxnBdcn13K/tEaNwgYLLybqjXqvTyNpViQIuhDC/o3g+srl4qO2493EscUM4jQ1aJLzjq8194XOUIoHUg8wbJUfz8LN0lc9b+AIAcneSe3mgJ+9x6RO8XsfFfFhLbg1TWnEnwbgj7PhIUYevvZPS0/mKF9CPm0YRbd5ONzqa5/GQH/RSRRyro4TFSX26839HEqZohzzFQfrvI+yBPiwRGppIT1VQtnwxyMLPcNZKfAbDJutQJ5J5vrnXfaNAi0xAZ6J4260GK46T1wPh5B0vDMvRUBSCIoMUifjkk1pDBq7TV28kZMvwSsmFdwFEdKuUE414WccRCA2R/AeVkP9iocH1+tsUN2fbdFsloZs5n84wGBgO2dKvdKnj9WWDb5Wf08L80QSnU0Z8R5dbd3F1f1j7S6T+4AgJkGkt1aNC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(26005)(5660300002)(86362001)(8936002)(6862004)(186003)(41300700001)(83380400001)(9686003)(4326008)(38100700002)(6512007)(66946007)(8676002)(316002)(6636002)(66476007)(66556008)(33716001)(82960400001)(6666004)(478600001)(6506007)(6486002)(44832011)(2906002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?apVhrGFkE2cGkHe9jA8DNyNKE+A38eO3gWQk1OIlVT2BGpEGut5Uvs2izX5d?=
 =?us-ascii?Q?j6x/nYdzhDXwSj3wDkBM1cIVplZs0Luw3Bb37OBM+aTVj7pJrYQjLVx9Mvq1?=
 =?us-ascii?Q?SiyOk/LGIqz2eoWgHJS00hmQ80B3m1FcI6sogyZ48nFE9Ygecc6wkE4DJB82?=
 =?us-ascii?Q?VXmTeNvkjU8g11neL/pOvzLp5cHHOVJedw4r3di+YyQk02oUaac3h/1Xov1K?=
 =?us-ascii?Q?z0xbviB4jV3E0qP/mT830c6lcFkzrzOXS2IF9dmaoystc1MjR/Xc5f/16I6L?=
 =?us-ascii?Q?aBhcQ+bAxQUPkniYq2Ad8Ql5xgg2gHq6JxwjNFYKmJfn9hmUu/w1UbQEyOlV?=
 =?us-ascii?Q?CSaWo01knR/mniyYA8Z/3BurznqMStvJDiGVB7B9SFSpmvtzps70gO0VXHx0?=
 =?us-ascii?Q?AtbQ03PuZr7IhP+zC15KzH8/fJL4yHbIcIM/TfnVS1VOmEGHhFgO+qGvV/Kp?=
 =?us-ascii?Q?QPTL1PfzT5c40rRBLfXn9Gdtopn/Iq5qlKnoN5TPiDZ/Z61EVR2CHbeqK4an?=
 =?us-ascii?Q?uIrZ0cy8FENKqUBQ0azA19yfxVSIv2BCGysCrRFOjwbzTVLWL9WNJK57ghz0?=
 =?us-ascii?Q?SVRN+UNDM9n7tX2r9XMoR+riyHz2OdjsehacFxfhMo6yneMrIPJoygspNtO+?=
 =?us-ascii?Q?K81WQa1lFbaav//csb5sufedsr8Yzc0+494dYDT5LD95pYMU0scyDf10uLnJ?=
 =?us-ascii?Q?5k2K59TunsKbUL/YD0t5WXfOff1fcCRwprzfHepSiOcmucz8ir8whx/Vkl0P?=
 =?us-ascii?Q?3ekSv38IfRAsg/l52PTBdk3EiQUu14mgF983MDBkSXjvBRTLlyquat1TUbvi?=
 =?us-ascii?Q?4oBsQvIJYrOlM31f47lGiGWTtopAGt4PzFO4xPik9iBk2Dy50lWOeUwMPC38?=
 =?us-ascii?Q?On/5zIM57JwMD32urz+JAQ6lxoHpjL6q390qhxFifYBehMqH4ol+yYE59bcl?=
 =?us-ascii?Q?3fBqgvBAu0931Wl8wPUoKJiyhlc/rk84twdkdNzQNupwGyjrqCrvK6rM2Rvp?=
 =?us-ascii?Q?X+U1FykBkcC7eHC6lPGZ8iJmlBRvcZYVmXuj5CVbx/enM9pCzHIAe75nVRMq?=
 =?us-ascii?Q?z3muziihLoFdzs4zpyTOaYmtk+V+xk9c8L1q43pHrT/pGt/tZEddHRkZAbSh?=
 =?us-ascii?Q?QIJOw9XVckgZzXhwnyJ6QDzBwvgXJ7FRCdiytzSuV0ewPcrdbTtcpMi2tag5?=
 =?us-ascii?Q?eb2AK/AiBUH6jwcAVOZIS1wJSNBW7HEn/p2LZcARENYzhFYtXsTpKhNHktES?=
 =?us-ascii?Q?w5n+bOEtHJEX54Zt1yF75k7wXyXsMR4QuHFoMsMLhdnszd0TmYXqMk6dqi/6?=
 =?us-ascii?Q?ImRCvlEAqXV2mTdfdtiMlB+he2Ku2N+4aCHIJyyOieHmJGjAVLrO9oPHHWWm?=
 =?us-ascii?Q?FOJfDXk7mAtTIPS9Q6WJac/1C9Xw/AsnfwDeLhLpv6oEJf4ZMdVEAlCxbXgD?=
 =?us-ascii?Q?qrbfDuJ119WIiRC5TmH494MF45EzuMqhyLslQxbFki/kCdqrc9LICWKUHMuP?=
 =?us-ascii?Q?pJLFRKkoqLNr9A4CMv8a6Rkq0I7yEbzN0XAPQ3JZwrqAzjhv7zzVZBSGDbG8?=
 =?us-ascii?Q?leObuPRI1iWwfsGHkroxHHI1jHdq21Fa+oMir5RwUkGN65Ha0YQjJKLKNTCu?=
 =?us-ascii?Q?lKMlOvIPcIjxu3C8HBQSra4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6c7d7e-435b-4a4f-f1b4-08db0a59ace9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 04:54:07.4324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZoZZ+ZB24BSS3Cd6IkElfcCu/nrwrT8vhE7pxg0rJETkhW8UPDxkdzBoKoSltHRfoplFslnseFlkQHTyGMKJFfyd6mfKXulplZv4TXYxCxEDMFFEe9sNriOdGGyk5eIA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5807
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/22] TLB Invalidation
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

On Wed, Feb 08, 2023 at 12:27:01PM -0500, Rodrigo Vivi wrote:
>On Mon, Feb 06, 2023 at 02:39:33PM -0800, Niranjana Vishwanathapura wrote:
>> On Fri, Feb 03, 2023 at 03:23:47PM -0500, Rodrigo Vivi wrote:
>> > Let's just confirm the reviews on this patch and get them
>> > merged to drm-xe-next.
>> >
>> > Matthew Brost (22):
>> >  drm/xe: Don't process TLB invalidation done in CT fast-path
>> >  drm/xe: Break of TLB invalidation into its own file
>> >  drm/xe: Move TLB invalidation variable to own sub-structure in GT
>> >  drm/xe: Add TLB invalidation fence
>> >  drm/xe: Invalidate TLB after unbind is complete
>> >  drm/xe: Kernel doc GT TLB invalidations
>> >  drm/xe: Add TLB invalidation fence ftrace
>> >  drm/xe: Fix build for CONFIG_DRM_XE_DEBUG
>> >  drm/xe: Add TDR for invalidation fence timeout cleanup
>> >  drm/xe: Only set VM->asid for platforms that support a ASID
>> >  drm/xe: Delete debugfs entry to issue TLB invalidation
>> >  drm/xe: Add has_range_tlb_invalidation device attribute
>> >  drm/xe: Add range based TLB invalidations
>> >  drm/xe: Propagate error from bind operations to async fence
>> >  drm/xe: Use GuC to do GGTT invalidations for the GuC firmware
>> >  drm/xe: Coalesce GGTT invalidations
>> >  drm/xe: Lock GGTT on when restoring kernel BOs
>> >  drm/xe: Propagate VM unbind error to invalidation fence
>> >  drm/xe: Signal invalidation fence immediately if CT send fails
>> >  drm/xe: Add has_asid to device info
>> >  drm/xe: Add TLB invalidation fence after rebinds issued from execs
>> >  drm/xe: Drop TLB invalidation from ring operations
>> >
>>
>> Looks good to me.
>> Some minor comments on patch ordering.
>> Patch #8 can be merged with #10
>
>did you mean squashed together?
>but why 8 and 10? 8 is a build fix, so I'd assume the issue
>happened in a previous patch, not in patch 10.
>
>08 - drm/xe: Fix build for CONFIG_DRM_XE_DEBUG
>10 - drm/xe: Only set VM->asid for platforms that support a ASID
>

Sorry, I meant #8 and #11. Most of the change in #8 is removed by
patch #11. So, #8 can be squashed with #11.

>> Patch #10 can be simplified if we move #20 before patch #10
>
>indeed, but at this point I prefer to not touch them...
>
>> Patch #17 should probably put ahead of #16
>
>maybe a squash? but I will probably just leave it as is...
>

Ok,
Niranjana

>>
>> In any case,
>> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Thanks you so much
>
>>
>>
>> > drivers/gpu/drm/xe/Makefile                   |   1 +
>> > drivers/gpu/drm/xe/xe_bo_evict.c              |   5 +-
>> > drivers/gpu/drm/xe/xe_device.c                |  14 +
>> > drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>> > drivers/gpu/drm/xe/xe_ggtt.c                  |  23 +-
>> > drivers/gpu/drm/xe/xe_ggtt_types.h            |   2 +
>> > drivers/gpu/drm/xe/xe_gt.c                    |  19 +
>> > drivers/gpu/drm/xe/xe_gt.h                    |   1 +
>> > drivers/gpu/drm/xe/xe_gt_debugfs.c            |  21 --
>> > drivers/gpu/drm/xe/xe_gt_pagefault.c          | 104 +-----
>> > drivers/gpu/drm/xe/xe_gt_pagefault.h          |   3 -
>> > drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 342 ++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  26 ++
>> > .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  28 ++
>> > drivers/gpu/drm/xe/xe_gt_types.h              |  41 ++-
>> > drivers/gpu/drm/xe/xe_guc.c                   |   2 +
>> > drivers/gpu/drm/xe/xe_guc_ct.c                |  10 +-
>> > drivers/gpu/drm/xe/xe_guc_types.h             |   2 +
>> > drivers/gpu/drm/xe/xe_lrc.c                   |   4 +-
>> > drivers/gpu/drm/xe/xe_pci.c                   |   7 +
>> > drivers/gpu/drm/xe/xe_pt.c                    | 130 +++++++
>> > drivers/gpu/drm/xe/xe_ring_ops.c              |  40 +-
>> > drivers/gpu/drm/xe/xe_trace.h                 |  55 +++
>> > drivers/gpu/drm/xe/xe_uc.c                    |   9 +-
>> > drivers/gpu/drm/xe/xe_uc.h                    |   1 +
>> > drivers/gpu/drm/xe/xe_vm.c                    |  42 ++-
>> > 26 files changed, 736 insertions(+), 200 deletions(-)
>> > create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> > create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>> > create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
>> >
>> > --
>> > 2.39.1
>> >
