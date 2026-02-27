Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4006BFEFB6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 16:59:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0194710EBCE;
	Fri, 27 Feb 2026 16:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJbAYxmn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638BB10EBCE
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 16:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772211566; x=1803747566;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xig18ozt1o+RszvgBMea1IYSb0LU5THh/qyb4K7YO0Q=;
 b=GJbAYxmnLvhsKIKsPZjyrjKLgBSSQTUox/SngCOrG0PEl72kIpx4u5Gz
 WpZEUngjazyTXnI2kck1Qb+Zo65rySpxAc9qFKh45cMxxVXBkkTtFn+Je
 YUBcs2bRkTZHeTs2T7+uTCpT5RYIn/T+Zj7Bf5dnB5QLG661rgsNsorm4
 EI2Dotck/qlWflcj7jPCmXkG2moi6Ib1FBsZ1VwPAwtR3aphxzgX2gwu8
 lGEo/0Z3h8vfSwbGN3xD8X5O6KNmSS2b9qDFEz7CW/mcGU1VOdLDIUVYX
 N1QKgDSPKUDu2BZuxbTdiqb6SdLu23zGHwOm/TpXHGwXmyHowVg4ucNAT A==;
X-CSE-ConnectionGUID: Z7MF0bbMSD+RbhSeHmYzzg==
X-CSE-MsgGUID: UXBWaQSZRomwv+GUKKtbog==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73266554"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73266554"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:59:26 -0800
X-CSE-ConnectionGUID: BdtNlWm0SQKwXd3P++4oUQ==
X-CSE-MsgGUID: pufwElzAT7uoUF/jXYPMbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="244300663"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:59:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 08:59:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 08:59:24 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 08:59:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHOCjZY83vY74+KUHDdj9NL1GJTJW79YwvQ+jlclqKYT4rKJu6ktEuL4fLyU5gfgeyi3ZklexunpSwvxwtS2whEbKHyqKoHANFG8j1ZL/ycz/EEHyzLuTKB3vdjj99EMhOoRncJ+7DtY6U6KePRAuder+Q9G23C7n+r92XoIn3OzMvaNT/N8VreN0Jtu+vKokMn2fXboxl2MZGDPPF3b2ewnt7x+tnN3/gO6tVl3qQS6/R/xhY5ZlXvZrU3D2vihG783nu+9qWVF5ODCIFPGUOl0mJgH49/qQRMqp1kTkGEwwEXgNjdqDW/sxAM+XF52Iyf/mA5aygixcvnu2uqKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGURKO/rSF3R/37om2YAr+iDgKlP+fpC+9bRnXJdde4=;
 b=TzVrsWL2BL1e90MyAsznG7+UJ+drtKnnbVInGygy3rNXBI63XkxyvMhZch4VdjRGixpt8biThgMiaMs5ouvCbjxUriaZn95GfweSATjqLASQ4jQVvQr6Qu7jE04km7PfGVlWqkGlwQ0LVYEmL9o65Xh8rwRNMoYWOBfg4QGHa+Ksq2OMTpbBNupfDm5dQ0Ejf0m1Mg8MfuSQFdCvfI3FdAjjZOtXtzZvOnvP7TgsIofOItnWDORO82NfkVN3LNfPXoWPdFy0h4LktjNssdj8gn4AMGfYvtUrS1Y+7ti4P0ITKXAICUhcN/dLzqtdIwR6jLTr0MhXI1D2k8GlkeNZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6310.namprd11.prod.outlook.com (2603:10b6:8:a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 16:59:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:59:21 +0000
Date: Fri, 27 Feb 2026 08:59:19 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: "Wang, X" <x.wang@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe: restrict multi-lrc to VCS/VECS engines (rev3)
Message-ID: <20260227165919.GC4694@mdroper-desk1.amr.corp.intel.com>
References: <20260225022014.45394-1-x.wang@intel.com>
 <177201319781.284987.11572938846238540790@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177201319781.284987.11572938846238540790@a3b018990fe9>
X-ClientProxiedBy: SJ0PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: 95379ebe-2307-41b9-f9a6-08de76218d8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: Kr7V7lfOYCyxZO/Y6BOkT4nKR/qINkupo1DRRw147I08vHNWX+tQkxRAVTblscxeUN+jf9XTrCOLQ0YW9K43qy9+rW1gTgEnkqWh55jp/a6PxFpYHJkeeupD+QR0A+rFlxHmCDZXsJIWR5Uzv5jPEsRxJYmZCOEGXJUPUywYL864yBYYMiidgW6Zp1C8DF7u03PoBTgg7QSwnfoKJUjfVhAsw6rBIesCiABLrLnwDmb4fDuY96DPSk7T4tB6mteP3sLhQimmincRDv0ZbZzGr//CsZfMF+EwZy9dTe8kjTKxKKRtQ+bWztTSfb6UBLriP0q4m9+DG42WwHTd3W7penNsjaFjOrjlPyqyVRK3h+KHVbIrEC12QPWsYxKgHVzoy0ru3vk1C6ioHQ87vSEx3VwWd8Bn+QMJsWEq9THwmJwz9V2vfXZWnnRhnivNTqLWJSHaSno/o/ElNhKVfMhbzZElvOyDmqRqXvtpauMaTBPgXyuhv3apAgigm/oNuYr8e2HzJGh/sij3OvUus/Y8GDYB8ADFL2OnH3iHQDvbYTDl0FVpoFdEcA4uXxn08Rx8PGPtpnKJFEAIrXZZqB0Hgnp40WMtbR3O05am3gEOGnfVYTr/mOcNrkfAhQ2iYAqsmBkMtqb+lpoS83OeSCG31fGIDshw8O96okL+us8fipA+0ubZlInODN9+Qaay0RRM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qvyXzxjt8QA+7gSvNKCCkstttSDg2tKSlfU+t5DOy2mKRlUBJqP2bLQZIxxv?=
 =?us-ascii?Q?z6Qwk1/bx3oc0tVSkdIlrpYuMkHEnXaNfHftCgAanALaA1gBmHTFss5SUtVm?=
 =?us-ascii?Q?fIRSP7KYI5kiP9toHUCWWVUs+4ejhMVQo2bU7BYHnOpP/0KFtNTzwjLjsuhR?=
 =?us-ascii?Q?kNqqzdh+Njt5sJXxKqz0fY6YLK6i4VdweiQwxy7Z5rSxJqomA/ax1OUIA3eZ?=
 =?us-ascii?Q?VmAw9N47zQrY/KyhAa5L7qBfSWO1ga4U++Cak5C1RDVJYRwbVCeXQg/ctPcs?=
 =?us-ascii?Q?H88fPi7+OdpLPYxrRL9fZps871cGBXH0RhCWYIwYMBzWInMYi8y9WsbAxg3K?=
 =?us-ascii?Q?JVDKFUiYGTuYqL1MY6MzGWBsOZTgBZg55VnDp6Mo+Cju7hS1feV1dyUy7SvX?=
 =?us-ascii?Q?V4NKXq2HCfJqziltM/q5kverKuqkYz7nDOpOWRZRARtN3JDsQN8BNuSWahRC?=
 =?us-ascii?Q?5Rsmi1Oxu48nMafDV4ZgC8LgoHfPJCgMXJjX0eM0eHqnLEdhqN5nkbAHo0iY?=
 =?us-ascii?Q?GPS+vbC3wbsxt9Lj/CRNBY2OQ/U7FTwtEIOdlfEp2hIH8BtExL1u08vSXvNt?=
 =?us-ascii?Q?M+MrxCxBw3kM5wHilq4Oev3WTONcNCduKDGqDDX77bWSGd0b1u8RI2XACPGu?=
 =?us-ascii?Q?IkHGzqk+MDbwGkFjI0h8sqN1zk74ZnrBydoNyxD1VgpxSBvSmGRTDInV2H0d?=
 =?us-ascii?Q?MNC7jOSBxhte8079M+BwZamFI4zxil+B+/vorHiRE9IgXcw4pMQnvOmY007d?=
 =?us-ascii?Q?QF9sFXInxbNtbSJzDRMuch5QJTK0vr8RfCKP4J6f/AOCAwYbceVrZLjRWJx2?=
 =?us-ascii?Q?0ZLB/Dka2pYTSQzj8pRUE1KFkeIITKiCKynSw8xEbWsgg/X8cJ1wOoBUy7jm?=
 =?us-ascii?Q?4b9j4mTR2ou0QgesV0fquIkZmdV2nePxnpOOceDHLHFLUf6mQCuHTIjQJhJm?=
 =?us-ascii?Q?c7D9bj/ukiNpWpCf3Fj4QuF1UZzPwJTHS7FoT2td3gc8YgnRttRucaN04F3n?=
 =?us-ascii?Q?xH4Jl7UbYW7hYBgzwUYdSZNDCnz7kfwc5bZbsEomjZjtBhls1K6OIt0/I4c2?=
 =?us-ascii?Q?S5ke72w45pOyBhxItLAoI2m/Md5ZwdjqGxYo4dh9fXBEjWoA0LccqEP6YcCU?=
 =?us-ascii?Q?wgVxxvScvCvVR7G+2iaG58f2tNlJGIyivI3VDEmpbEn+zHSkUTyifp+R/iYB?=
 =?us-ascii?Q?b2Dc0Bs1Uwp37OnQ5mplov1CR1or1EOca44FO90LnwKfKbvcCcAi3aTjOqWC?=
 =?us-ascii?Q?9LUXkJI7whGKPIWl6W6F93BfU8t9Ujf0dmh3hdxV7kxWIMDAuVVFLjEkqqn8?=
 =?us-ascii?Q?n5EEvsgWU/cwwl0/XQCZ3jD4/kxo9Ssm560kVJfIBGJkfTVOldsv2EvMAF34?=
 =?us-ascii?Q?jDfdjh/LPusf6i8ZwS6sDgFo5u5Aje3DSBz5M5Pgzv58XP6/v4B/jKumyDzX?=
 =?us-ascii?Q?blSgFGj0F0hFEFSXm7rP39ZXK6IYkhu56e+i0VINqMXQPk656Gb+JaQV+BLn?=
 =?us-ascii?Q?GnGSqvQWGw0Rc8HGitXn4ABFOTlfhsH2AcP2UDrHQ99sDbrfK3wbRlVfP8yq?=
 =?us-ascii?Q?nV0hAYVqVqysRMlIaPmutbj6rb93DSRRI/jJKn2YFSkdwxUMSwxZW38pGYeV?=
 =?us-ascii?Q?S8ieClC7a5TJ0HgNnOsvg6Co+L17G/r6qSl5hzsEtnb8e5Kkt6g2qYC4n2wX?=
 =?us-ascii?Q?94g61xSMPlrfQa6P1U+xBUyAM+ecIvqOi6n7WzejhC7uhdmxVi0L2vI8LKkZ?=
 =?us-ascii?Q?Op7sUsU2rCVbBNkOoyYLMrSGyMjuaWc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95379ebe-2307-41b9-f9a6-08de76218d8c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:59:21.5618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXOA3EiY7CwHfP/xZxHCzEAPj/yAFdZHGVdzqRbTsEb77Mkewikr3VC4NYl3QAYIkx6sDn5WH6peo0OIB0b0r9CzcvWYORjqQ332k6QCmaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6310
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

On Wed, Feb 25, 2026 at 09:53:17AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: restrict multi-lrc to VCS/VECS engines (rev3)
> URL   : https://patchwork.freedesktop.org/series/161799/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe_FULL -> xe-pw-161799v3_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-161799v3_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-161799v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-161799v3_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new:
>     - shard-bmg:          NOTRUN -> [ABORT][1] +23 other tests abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset:
>     - shard-lnl:          NOTRUN -> [ABORT][2] +22 other tests abort
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-8/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset.html

The failures here (and on BAT) are
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7414 and are not
related to this patch.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-161799v3_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1124])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-bmg-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#2887]) +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#306])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-4/igt@kms_chamelium_color@ctm-negative.html
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2325])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-bmg-7/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_edid@hdmi-mode-timings:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#373]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-3/igt@kms_chamelium_edid@hdmi-mode-timings.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2252]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1421])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-rte:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#656]) +6 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#4141])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2311]) +5 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2313]) +3 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1406] / [Intel XE#1489])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1406] / [Intel XE#2893])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-bmg-2/igt@kms_psr@fbc-psr-cursor-plane-move.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7136])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#7136])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-8/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-close-fd-smem:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#6874]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-close-fd-smem.html
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#6874]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-close-fd-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7138]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7138]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2236])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#979])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-8/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#4650])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-3/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>   * igt@xe_sriov_auto_provisioning@fair-allocation:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#4130])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/shard-lnl-3/igt@xe_sriov_auto_provisioning@fair-allocation.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8769 -> IGT_8770
>   * Linux: xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe -> xe-pw-161799v3
> 
>   IGT_8769: 8769
>   IGT_8770: 8770
>   xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe: 4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe
>   xe-pw-161799v3: 161799v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161799v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
