Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A908C76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 02:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2482610E077;
	Wed,  5 Apr 2023 02:59:13 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA75D10E077
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 02:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680663550; x=1712199550;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f1UYvaAxS3/CBva7zaBH7GMMoEHCmZ3/4NwhPvH34EI=;
 b=Vnd9v3h6h7OHyiCcfhRuI553BzWkOWA5KWEqYtNt4fTYn1vYv0JyHGs4
 j8y4TkyuKq6/PG13r+kQDIIni09CdtTf2OqjVHhgzmToSlnQatara8wvi
 8fIxL6dugRXFfvmfmeaEmynhwOKWjXseGP+wVCpT+C5ld4VDOHrph0Xux
 c983YiW6zT+m1QwCuKrWKL2BUZ9PIc7knhCjQ/+XthyzZWKPmfyvH+3aC
 awW/b2zx3G6ArG0gXoVeGUQB8U3ZOVx8JCGjCSom1rmBIjYxayr3ldwsf
 SeUichxiiO+BmPaXYY0ASm4DAlO+wF2w/Bq3NPwmQpYIZKx29wkWV8Djt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="322017678"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="322017678"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 19:59:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="663874008"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="663874008"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 04 Apr 2023 19:59:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 19:59:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 19:59:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 19:59:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJwPC7GrCJ0tIeUNHu9Mv1WOHIiw3v/uQbLvQFI0U/8GymepYhWDgfllgmHjaSMYh5uYFEpyttdd80aWGZqY1JEMJrO9L8zsdbhGkiaDEe7RdIZHMYGf3U7pDFVyKcj0v6xhIqEWOTqm2hZy/+BjahYQUE4dpyi/kmAA7q693f+ynrSvlkkxvdUhli+C922R+s6i4Z0CTPOuxViW6mWNtQwnNApI5mBw9XZ/88PT24icD0WS57EDbYVlxUwrqXiBZqZV2n0qy9rNXStKTCwGWQDHlxqBbVM5ZQ4Us0KiM075St+fyzslnnWGcLtwfaODmsQCk8Dh5yxaU38O3mDpjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33Dn6GD/R/b8m5p9wBUcouri5msHQXKjH3+BjKfvo5M=;
 b=MO6WfrIC+QrrGPrRVQyHLmYB66v8uKjjCoZFSXkNdW1kgjgfkawV5ADo/23WpL1R6c+M0ZkfPf4DOTZXLGd9lX9kRfaIN6dpyyDu/81FlFXg87YK3YnoSj97ndFUQzWmr2GZyprN8zQRf5k2aGJCWJdCXHUXHGwMc1AETZPdcytQXebAdyirAYttUraWjr0O+twaWncIcj4/keT3YbMqOmlG9o+YmDYydpHFkln6yltyQ7NFJWZTS1LTiN5vXV4WVGY9a6rzYo3eUCdq6G+JoeFGwxfE4OsXX/EN5Pk0s36w0nehtwfuI4TkW0stGsmTPvJyoGmLfDUXUcwiJYLfuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5567.namprd11.prod.outlook.com (2603:10b6:5:39a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.37; Wed, 5 Apr
 2023 02:59:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 02:59:01 +0000
Date: Tue, 4 Apr 2023 19:58:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230405025857.7e6ehyu47qhzt3lk@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230403201702.996400-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5567:EE_
X-MS-Office365-Filtering-Correlation-Id: 306f415b-acd3-4382-a22d-08db3581b4eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4mS8P6iAEhomy0DReHEHEwfUW0UXxsU6NICuHwtztqK053NhU5eIhICJpkleHCbDU2ts+QwHn6TVu2cOtQ4fBMo+8x9I24IygVerUCBvjZY7kE9T1Y6/WlG3EjDtgHOVG/dbt/M6k5g9YO3vPtVDhAUfoHZFkLTSWNxqy7c26OhuN5I3IN+8t4XSqoj5+uOwIAFpweGx4CS9Ae9wyA8nenZVItNBjgX1T36dSKgKFilj36a7qfUCTXAGNh2CXn/nHbh7v7i98k19nsj/GYu1zGPhkJtBckncumLn7UM3BXhowROo9MVW/SmOhNX60LSgy62eIeOU9XZpj0iHcXzitIB4pDXE2fbnQnwbY3KCE8tkRhoD6rLP3eokVfXISZKYDvuv+c/tJPaPOf0VG5njWGydXkTGysItqNkghpkDhz9ac0uj11PHF9lEAHogXDfR9e3eIXrFkE3356rgZVbIKi8+jC68IwDe2fhchyv/iLkHk+i/OSKv4otoY4ZztvUNLaAOsBe4ZRr0jGTKTLz9P3W/RQgS5yvJw1jqWrb/LdkWR35EOgqduVZ/hhdihl7A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(376002)(39860400002)(346002)(366004)(451199021)(1076003)(6506007)(9686003)(26005)(6512007)(186003)(86362001)(66556008)(478600001)(6636002)(316002)(5660300002)(6486002)(8936002)(36756003)(6862004)(66476007)(41300700001)(82960400001)(66946007)(8676002)(38100700002)(2906002)(4326008)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vCMpLjiTU7Rw5PF1ksaZ9LqgwCzjPJCzsKah++/aIr1uxUaGQ+ZF+nL4UCjc?=
 =?us-ascii?Q?ULdNYgSCk8QwSRh2GpyNh0Z8W/G+yv3JZ/dWqBAQEhkvBslplKw4cpNok6eE?=
 =?us-ascii?Q?WLAqFdmdlrZ4KPWQeWWIMLMDEe4v6E5GKw/tABVAXdgQbaYTMd7cOb3sbnhd?=
 =?us-ascii?Q?LDlAc17XC47OSh/u7HsLDSztOxwaz978yXa2ybzgNb4eC9Hj96bMn44CqkWk?=
 =?us-ascii?Q?lDcIW8KZphUiWz186mK/3pRMnHBQbMj72axxGlzgzBKSlL6uRXgulusBn6b7?=
 =?us-ascii?Q?lBqNUSYBM4ElBHQm83NEND/OWOypJ5zZevnQfjftKyY4QevMxyQd8ijPjksC?=
 =?us-ascii?Q?6qFEWN22J0FOpym25l8+fdVqYU54Gt2wPYFU/W/G+B38zZ0hgk7BtHuRL82V?=
 =?us-ascii?Q?+pvZf8CQ8NRgrBfINhDlP6lpcbtiHUzVGjC1dPRVFOjznJhCjx6JGISBnZDF?=
 =?us-ascii?Q?h0mhPhGd8+3tnSoYj1ZRyBHVRXAnvmOvHqowsTLw66lJ1bhrB8b7c1QWZ3Z6?=
 =?us-ascii?Q?xqgL5au1dZ/qXFOWmGUCY1xenkfXtqHs+kM/nZtBbcFKTPV7Tv48DhqoHvPE?=
 =?us-ascii?Q?zd9kFazIeqL9xWsiQyGhzOhb1junWEysYtLf1DgdqpnjXFEJVZx/TxzOlnSl?=
 =?us-ascii?Q?RpFMvXklQW7Xm0AdQPcUzhytQ7MNSJHYQcxjNCh8WaL0zxgqr+2UWb/JXJlz?=
 =?us-ascii?Q?1TWLbrUDrhUezSbFMtSYcxdCrJmWEFvvn73oLONZWaQkU5A4p47LHQH4fzJx?=
 =?us-ascii?Q?dIQ2OFDs7IN0C80mFDq//aB43AnNGXDk5re2uJRMfCfbfr0EEPq6juCZA6Za?=
 =?us-ascii?Q?0BkfyQWcKSRNqr95MG5f6SIL9ThyclVIaXT9gZsmFFg6xtbURe24A7jqyP7I?=
 =?us-ascii?Q?jOSsl0+qbb2WWq22mA8dL9jYUrfskFQcnW8kESlOm9THcNlue+QemDFjxb3C?=
 =?us-ascii?Q?RzHbtgyO7H3q8Efc/HYlSGFAvqXHqY9fntKSBLVy1Naa6fF2wJANHlX46nB8?=
 =?us-ascii?Q?NnJ/atvOkbe2q1qmtBVT4/+IdS3rtc3gm3a3o4cVd3JS9HDxoZD7L6hR71aB?=
 =?us-ascii?Q?3MueTOObNxEorJB4D9u/woDalIOYlBHWbsv40D2ZpX8LoNAHmJZAwi1pCA+U?=
 =?us-ascii?Q?J87IOtE6ATKRCcUDtOLJDhBSLi630Bi5Z8fRHjMLBlNm/7jErAISk7p0kO8+?=
 =?us-ascii?Q?Kx9MmAGHR2kKonVGcO45BfBQRL4Gfa3+yyeb8WLsE9eSCWFnMft6IVAvZ2D4?=
 =?us-ascii?Q?g6seVRGvSdq8yBskIv8HwRmUMidWoqzmMJ7JDlWKUbDHG2TKMBkP4JVJ+bge?=
 =?us-ascii?Q?yLqR0y/G2UeMuG1aDoUDjOIIIe4R1gG3y5bd1BrmM/F9KL/w+nKYifNx5wT/?=
 =?us-ascii?Q?k4YK9nCOgUIUIHCH+no08ojtmV4OEdAUGOLRfCHnoPmCt9X7YsEwV6z7mnlS?=
 =?us-ascii?Q?v93rZxI5NMGZFuiuBlb73foy8JkiC9fXdUu2Dkw+yEErM0gjB1HBpmA7Mo1E?=
 =?us-ascii?Q?Il8Px3dJRhIIvoCxC6V6kWRkB8R0YQsGNk7OkivYscZABIUo5a+qRKY8Fda+?=
 =?us-ascii?Q?KUDtxrW663C3w3W3M3nD72XIqOPtTiWDs7igLB6pQO8TqLdOAaRzxTLOzkvO?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 306f415b-acd3-4382-a22d-08db3581b4eb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 02:59:00.8796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jpvXozj3FteveZxoVAYzmtgU6WVFWmZUb2zyTVCJdDSjdc/KsbhRWN7ElBJyS6s8sqNrYKTtiXVJnVWwmrkSlCj5hOR3Kt9PD7E25EXwYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5567
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/6] Begin adding GMD_ID support for Xe
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

On Mon, Apr 03, 2023 at 01:16:56PM -0700, Matt Roper wrote:
>As Intel GPUs move toward chiplet-based designs with disaggregated IP
>blocks, it's no longer considered correct to determine platform IP
>versions and most of the behavior/capabilities based on a simple PCI
>devid/revid lookup.  From Meteor Lake onward, the driver is instead
>expected to identify the specific IP blocks present on the platform by
>reading GMD_ID registers that provide the version/stepping of each unit.
>PCI IDs should only be used in the rare cases where the driver needs to
>identify the SoC and its characteristics.  Going forward, we could
>theoretically see products mixing and matching chiplets in ways that
>cross the traditional platform boundaries (e.g., it would be possible
>for a "MTL" to show up with a future graphics and/or media IP chiplet,
>or it would be possible for some future platform to directly reuse a
>graphics and/or media chiplet from MTL).  In the long term we can no
>longer rely on PCI IDs to properly reflect these types of cases.

humn... I'm not sure about this reasoning since the platform would still
be called SOMETHING and that SOMETHING could have display 14.0,
graphics 18.0, media 16.0, etc (number are just example, not a future
anything). It's still a platform that needs to have unique PCI ID.

>
>This series provides the initial framework for GMD_ID matching.  The
>xe_device_desc structures used to describe platforms are broken up so
>that most of the important characteristics now reside in separate
>xe_graphics_desc and xe_media_desc structures for each IP rather than in
>the platform-level structure.  PCI devid matching will still happen at
>probe and will operate mostly unchanged on pre-MTL platforms where the
>xe_device_desc will point directly at the appropriate xe_graphics_desc
>and xe_media_desc descriptors.  However on MTL and beyond, the
>xe_device_desc structure associated with a PCI ID will initially just
>point at generic pair of descriptors with no real feature flags set,
>indicating that true matching needs to happen based on GMD_ID readout.


one thing that will be good here is to be able to pass 0 as the arg in
the pciidlist. By doing that we basically allow binding to a device
without requiring the driver_data to point to memory address, which
means we can bind via sysfs.  I think this would even give the
opportunity to sunset force_probe and provide a better way for
experimental platform support.



>The driver will then read the appropriate GMD_ID registers and select
>the corresponding set of feature flags to use, independently of the base
>platform.
>
>MTL still isn't loading and running properly on the Xe driver, so this
>is only lightly tested; with these patches the driver seems to identify
>the IP versions correctly (already more correctly than the old
>PCI-matching code did) and pick the correct set of feature flags before
>the load fails for other pre-existing reasons.
>
>Note that there's still more work to be done in this area after this
>series:
> - Most subplatform matching (e.g., MTL-M vs MTL-P) should also be tied
>   to GMD_ID rather than PCI ID.
> - Graphics/Media stepping information also comes from GMD_ID; PCI revid
>   should only be used to identify the SoC stepping (which is seldom
>   used by the driver).
> - Various places in the driver that match a platform directly will need
>   to be updated to match on the IP version instead.  Some examples
>   would be places like GuC firmware loading or workaround definition,
>   where we only care about the graphics chiplet, not the base platform
>   it happens to be plugged into.

this is what bothers me. If we try to retrofit this into e.g. DG2, I
think we are going to make it harder to read. The WAs are defined per
platform. It's harder to get a platform definition, decode on what is
the DISPLAY/GRAPHICS/etc it's using, based on what is the register it
needs to set or what are the WA details, just to write it based on IP
rather the platform

> - i915 has basic GMD_ID support for version identification, but needs
>   similar reworks to select feature flags based on the GMD_ID.  Since

since we are plumbing the next platforms here, why  bother with i915
now?

>   Xe recycles i915's display code, these i915 updates will be needed to
>   fully handle display IP matching properly.

but it's only the display part....

Anyway, just wanted to give a general feedback on the cover. I'm yet to
read the patches.

thanks
Lucas De Marchi

>
>
>Matt Roper (6):
>  drm/xe: Start splitting xe_device_desc into graphics/media structures
>  drm/xe: Set require_force_probe in each platform's description
>  drm/xe: Move most platform traits to graphics IP
>  drm/xe: Move engine masks into IP descriptor structures
>  drm/xe: Clarify GT counting logic
>  drm/xe: Select graphics/media descriptors from GMD_ID
>
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |   6 +
> drivers/gpu/drm/xe/xe_pci.c          | 432 ++++++++++++++++++---------
> 2 files changed, 300 insertions(+), 138 deletions(-)
>
>-- 
>2.39.2
>
