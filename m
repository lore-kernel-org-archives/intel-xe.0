Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE02AC71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 20:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FB210E2A9;
	Fri, 13 Jun 2025 20:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XvGdzQYp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9103A10E2A9
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 20:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749846793; x=1781382793;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EbU2CudKiWSPt1sstYEEsaREtfuxqZXq5TjK+DahPRM=;
 b=XvGdzQYpbAhER5NK3DGgTqtMkDBWn+VZmO08FKP2I0CMZowU474AJ6Ct
 aIpigxH5QTA/SgR63ERV3wdu2E1R9koda2pvY4rC159/qKsKhnVqdFG6A
 XktkVp5k56KogffTKzg94HVi0GWVmAr7ZzjruS6qeXMIdRwF0XCz3P9hZ
 lA08FurVZoO1sP5M14yf9WyQEOJtDiSWYIbczji2k7pWPbymKDd3GPboJ
 zzw70F8CJFSzIS9h31eQe2rLJj2V2wrI9YXs7IIqcA0dLBONMJ/IPKyv+
 Cme7KTCFLH0JBi0pc6zBElN25s/XXH1+Pr2qKnywx3L0o842twict4Pj7 Q==;
X-CSE-ConnectionGUID: xo7jT57PSFOjwVL6ynXn8w==
X-CSE-MsgGUID: 0NHzEPYASpifEvSTkeOVBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51940776"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="51940776"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:33:10 -0700
X-CSE-ConnectionGUID: PJ2iR0kUS7m5BAk1+/FqJA==
X-CSE-MsgGUID: aeD8rFt8QECUEqwsH215+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="147764773"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:33:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 13:33:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 13:33:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.85) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 13:33:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F99PysYUct/hTMNx0iBtSwTvxhhTF1NY/kDOayY96xBKtB8fdenzCx/qvXopoi87UrSNhNBFpXFTxJ3EzHbmhE/z5m6JdYcpSy7hRpuqRlRedd8b4TNqa8A1xCB9NDkByIsrRvI296f/kbB+pZaX31xKdOItTRWj/Hp04HhPpylQ5I3z8Gfx75EV6fg3qb2rSXPKboo6QJbW8nO32il2W/GRGgbZXIU01h9CZGLVaXhp+eca7FYS4A6oxoJ40ZJMWSfZLIMhjs2xH+OhBsZs+vJQCh9nqzKnLP5X4tMw2SS5LWZRe7eABWk73/nINyTvxpzXlhiDSdQAjKJHjwcLJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Wrf5zByurl7N+TO1Xv6xR++XbLDQ649ZmSegO4lrB8=;
 b=fUvb1yZFEIc743FdcW1aSbpu51unGtXP5PsfFDEExYZux5gbu1DAr3Ig3BGvQ+HYZ37mShJXQSf/WBlk5yEEvMrrj0qjoRNf5mFUj7zu5+4h5Tzf6p48+BJ/OKl379pj8kVNL+PWs/HaqbdksoP6fomfw4YGpcI0TlJLnE+jFyQi5lL8GQiQaItvThq3cPMAagM96xeUyEG4wtkb+YQJkas8jk7st/v08YkDg+QLdyjTD9VVNwzumJPpEV9sWMo7+P1CV3MglOO1oTWzzQ71nIQNe6uDq3tcLcD1dBis+IrT5xLj4wkiliWZ06b9EqRIkgh4sF6NOD19wOBRhxRI5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7595.namprd11.prod.outlook.com (2603:10b6:510:27a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Fri, 13 Jun
 2025 20:32:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 20:32:43 +0000
Date: Fri, 13 Jun 2025 15:32:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe: Track maximum GTs per tile on a per-platform
 basis
Message-ID: <mzf226hxs5ao4655nlbyyac2m7fj56zposxsrzctgij25tux7w@6wlhagx5l6nk>
References: <20250613001438.678728-7-matthew.d.roper@intel.com>
 <20250613001438.678728-9-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250613001438.678728-9-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0231.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 2695714b-997b-4617-0ba1-08ddaab97338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wFmOOyR1cZJ9J/zumyr0GPB1ooEvMm97ovjJP/vfP9/GOEapd9fXAXjU+S1M?=
 =?us-ascii?Q?IMf5zKf+iS1LjbqyPUatgWbbnmzeLCRP9QmcJtLo6Vg+t3Lfth1zV2BvG2HF?=
 =?us-ascii?Q?B18IqRrCCFRgvDkZJbEBGXFZTnI3gPExWipYi4BevZcwgigXjW39aV1rlCub?=
 =?us-ascii?Q?qLtwdHH83/Rz92z97LCL5mvZuanhwj2yPkVPcO0BeLQeOQ0z0+zsCa0d0RCf?=
 =?us-ascii?Q?ChLWELFbQKh/UUIndAfm4ngUuQwcD94g75FEPc6HQLg+Z9eiXOKj1uTXhxSc?=
 =?us-ascii?Q?dJ/S43rVr5GtDZOApUUVFK2I4r23HzUtEI4PUJImB3eLZHf41tOKgQv4UIFP?=
 =?us-ascii?Q?OhuW3NKSfk0nHjLb7ecn5ay6s1rsoyjMtPbuRe+MrSW54Prnov5LkxNPHdm6?=
 =?us-ascii?Q?8kX0AR7yKC4RELHRZ0ZoEt121eiJMl6vmxlHIKTWtiqjgNwF+U4B19kfXNtp?=
 =?us-ascii?Q?d+VeD6S+6q6HTzbauJWwIGsLefWv+BKtJUQVEGBm/TOHsm1qBqF5w90mwSqr?=
 =?us-ascii?Q?9WeF1KOuADuaqC2sAtHJfVuWA3n2TsX506nquxwNAP9rijowV6Ev0KA+zhJc?=
 =?us-ascii?Q?YWcAk0uN0/DGSUvlvZWMMoT0DoasQydJc0m0rmwUwTbkSOyD6OI0z7JGKFU/?=
 =?us-ascii?Q?hPQqG7fHW6FRydWXwTP8JBe9jZbwH+7RL+wxTgD5D4tutVycCzcIKBKulPmu?=
 =?us-ascii?Q?7vOsXIZLULHBxzD0JCPWhjV/uaJf9ymsUuwlpMzdlMZDcnKmChrI5s1tb/9j?=
 =?us-ascii?Q?fFx2I1WUzt4xog0QumTYLZ4ezbxp0BZsiSz2Lhc78nZdAv6I5biVliWomJ9D?=
 =?us-ascii?Q?/2+CsVR5CgPpkVl9tDAKkikNaToFxTnUxjAApOJ81l+5EgbqFnKOgKzlIuRD?=
 =?us-ascii?Q?x4sVoAYPWF88d/weGqFVznjy503E2hmLE/KrKUVvwF8adK0owAC5SDus1bWj?=
 =?us-ascii?Q?w4aGwtA8pZs8lcsL/Hja0FRwYw/Aj4ZEe3c5zmjoc82s/BSZjXtEeLyh0mgt?=
 =?us-ascii?Q?+F1yLE54BtlZ9Cj5WrJaD0kqhiXj1PDIFfx5P1w9+wuskzHqHkDtDOhyOPFq?=
 =?us-ascii?Q?IxSiRsoJXXX7tBciUzdBDRPxT1BdeufUSs6uzef9oLnN6COf9E+3a6cluuo4?=
 =?us-ascii?Q?iUCPmFLkgDGaf0mWWbQTNJ3iP5QDzrmmc+kMoQl6QzdDUBPirG0p/+VgPlVc?=
 =?us-ascii?Q?yg0rjF3CetJFp0xtYKklhc89LesHRwHgQpwD+w6YqPNF6RL2FyW2gV0YwbuB?=
 =?us-ascii?Q?eoEEkoP11Y6Ab5e39x9Guoh8YvKvTAytnEvz/O2AT8meoiMyLQE28m3v3hyw?=
 =?us-ascii?Q?b+DXcmpwzE3l8secQElUMFihff96Alc+1yKr3e/XYH9JVJIsHoR5R5lZIaSX?=
 =?us-ascii?Q?0Xr4xd+qYVMh2R2kp6OKQuK/GO+Ry42+endSwPcTc3B7RY5+yulEiCR4y1zu?=
 =?us-ascii?Q?9oewpQcW3b2Qlf2DNTgsYF6/C+/wgvsEhGm/by15Ldmfw26H/J1N5WEl/kLr?=
 =?us-ascii?Q?BsLZapdJ1tbUBIdI9VBqbDogckPlvrF4X3GLx/orZeNHQ1Z3uAdBo9ZMa9Sp?=
 =?us-ascii?Q?dGsUuHgA2d8BeuJLNucS2r8dmgWNOz0gzmrEyibDEOfrrLSbj5ozmKrpYcso?=
 =?us-ascii?Q?iOYbrr08xmtrkuTH/52PE4+MoYkKa3m0Zmcz6JWjzcjNQPg91Q3zHL3Rnair?=
 =?us-ascii?Q?Kg6/SKEJk6i+0rH/TscNpVlGSNtMh0FQMb77HEn1CyWiP2zK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wYwELeL6X06t5rPZ/J9H3wD+xhc/Zo29YK1ryDPg8V4Z1rFFtyhcy1GuID+A?=
 =?us-ascii?Q?ZMlRt5CNr9J2ETjRH1F/EhgEx0vKFY3z9r4+kDjPIAhSGeFQhpL8kDdaRl6H?=
 =?us-ascii?Q?TN7NnhKffOjLKvQHbl9bn2hTju73xYe39WczT/9Xh16O2KrCSa+oxP9aLSvJ?=
 =?us-ascii?Q?lM/P1+w7Eqwe1LInDEzgAKMHhGqFm6jfMhSoR6a75KxMh6XuYaARFszOswCo?=
 =?us-ascii?Q?lsjky9ylZiAP18UnJ4QxiXZneHoDahK0wqHojValTAV85p1CJktOBch5FLer?=
 =?us-ascii?Q?2SXXoZ6dTdOyAASduN+u0w7K/K7p/m2L+P33aZi40zqs98jx232I5WM9oUs8?=
 =?us-ascii?Q?IDgHFm/i3q4HO8c4fN+Z24V4AgQfxEgvx0N0M3N28n2xIyMuN5DfQwbeMUXQ?=
 =?us-ascii?Q?nzHD6xLG+Xabdv3xe30T848bInfD5IJVRDYE3OTYRe+FtVLBg5pgQ6wBuZqA?=
 =?us-ascii?Q?OyNQ5M138diGeltbOCifvoc/Ft8Yz21ODb766yq2tALbB1M/WInFzPAkA6pQ?=
 =?us-ascii?Q?zqXy+G+Vrwl4kr037huDZx1qV7BaM9faV29RAeraf2Dg7UFw5kKyMUcAY9EF?=
 =?us-ascii?Q?r2UdEGsYGHVlXwtw3eh22GW0H3rjLw4vHJzChPcL5tP4wHzLjH9ISWFMyggG?=
 =?us-ascii?Q?9xwBNTi87vZNlhsq3HH7w/ktBpCEWpLyoy/XttbN+W4QDyBW8AvDZYYnDcAg?=
 =?us-ascii?Q?IKj6y8MhTVKbVcWO9LkIq1fWMxRyE4UWr0C/mGaL/FVXCsS/FcTuUIM9AV7I?=
 =?us-ascii?Q?gDRNFDDUpE/WYi53Gg6quQahfH3qBiJm72yrtqYX/NgsMgClMlfpYOrrOxoc?=
 =?us-ascii?Q?PXE+ssAaPWACjdK4cQabtxy6KjiSkT7ANkdNIdhF7haexj1GVlCwoLt7BMty?=
 =?us-ascii?Q?DnMjvevMB87Bq/1fc4uvX9hNTg2Ay5XfatQhxGWXpSR9Rjg0Y7caaTX8dmlL?=
 =?us-ascii?Q?yMXUxtdbIYFF5TRjHF/nT8bpZ4g7BGIJ5fORyhVmFbpgda4+OpJrL3V4CVHo?=
 =?us-ascii?Q?P+1+glZO/9QHqgLMJfOkIDux9mGNY3heD9mN0ny6xNIZAE6WSwoynJbFsO+J?=
 =?us-ascii?Q?8KsyW0I7z0j6VUGXbFN2zanrJIVrbtlqCXSwMp7pkjBpDYMwP5J3e7BiRxWt?=
 =?us-ascii?Q?cop5ksYeXmgAoy6Glx3x8v2wQYlBumqnossK4RXA0xzwgKyGVY4nbt6jTkEx?=
 =?us-ascii?Q?nFvmlQZ3g9yMeIllcbCPl3h/Q+SJQkkf9q3Q1mJ0W0an22c9k5kzLwtXNj/h?=
 =?us-ascii?Q?XeQGvwCGt++lN/tj/ICKJsssZvlFgLQpZaka41vonhzp1g8YyqDkD3KJFIsf?=
 =?us-ascii?Q?dYtGSQKXRpvwXmhPZHF12QIM07SVyqEO/F4cB1SXzEy3RVezWFvb66ZmHV24?=
 =?us-ascii?Q?wIgSQ6g7zqju2s6YjlygIH1gGVVZzb+Jw319TnC0CT8SfuX9RWSoaVIOOScj?=
 =?us-ascii?Q?GwhgMXOdtp4dqLppzIwxfNFtmmh6TnNNRVgoK7eI7XizfWnJNoj0VfT1o/uz?=
 =?us-ascii?Q?UvUKVUzOqLW07wcMFQE9JvypkPFjf2JhEIXGee7KuCYMLZQ7InR1lPi7OMgu?=
 =?us-ascii?Q?0uoe9H2Zaq52Nrt8FDbYYjcF9mmjFoS+PowHPSkjYQ5iRe6f2Es/eFgM0+EU?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2695714b-997b-4617-0ba1-08ddaab97338
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 20:32:43.7070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39ELmWPA/jqhMFzq/PAatzEyMH1bfYTHGF+x3CmrvexTSGNFSs22XGR2KbQcwfdmhGGtDKoiPbwfMt+yjWxEnhkJGkEdfpuw3qQNABbFDac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7595
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

On Thu, Jun 12, 2025 at 05:14:41PM -0700, Matt Roper wrote:
>Today all of our platforms fall into one of three cases:
> * Single tile platforms with a single (primary) GT
> * Single tile platforms with two GTs (primary + media)
> * Two-tile platforms with a single GT (primary) in each
>
>Our numbering of GTs has been a bit inconsistent between platforms
>(e.g., GT1 is the media GT on some platforms, but the second tile's
>primary GT on others).  In the future we'll likely have platforms that
>are both multi-tile and multi-GT, which will make the situation more
>confusing.  We could also wind up with more than just two types of GTs
>at some point in the future.
>
>Going forward we should standardize the way we assign uapi GT IDs to
>internal GT structures.  Let's declare that for userspace GT ID n,
>
>  GT[n]'s tile             = n / (max gt per tile)
>  GT[n]'s slot within tile = n % (max gt per tile)
>
>We don't want the GT numbering to change for any of our current
>platforms since the current IDs are part of our ABI contract with
>userspace so this means we should track the 'max gt per tile' value on a
>per-platform basis rather than just using a single value across the
>driver.  Encode this into device descriptors in xe_pci.c and use the
>per-platform number for various checks in the code.  Constant
>XE_MAX_GT_PER_TILE will remain just as the maximum across all platforms
>for easy of sizing array allocations.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
