Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F4ECD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 19:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B331122EE;
	Wed,  3 Jun 2026 19:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPlNwrUM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2C71122ED
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 19:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780515376; x=1812051376;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4l0VN8XmhcH1DYH6KU4/GRjq7x/2YhGbI2kOJWEom2U=;
 b=iPlNwrUMy559wg/CRyoS/QxmOldZWAg9K99haI7WR5y1ZK3KfsRmnhic
 o4+OP8w0Q/9bfS5VJ4kQCM9eAEpB/vxT7uwg7BmD+04OXhN9Yu/3mf/yo
 Ed25kpQgK8LiqQnuYtWD4J7KdDhf7IIuwSGtGsCEdzbDPsxTTb0VSQifx
 FyHeaIsL94TpVQVBnHN8dNT+QpOYXD6zA5oxAmv87TDJqjyvBuDWEZYPC
 5BPz8806D2d3timUqdKNwz2DiivVweolhO5626upXix6iNuWAfVsA69oM
 ZzNxSYOk37eZm/ox/TkcmFlH6Woimv2sTMfOLQdD4NwlZzMlNBHz+Lxxp w==;
X-CSE-ConnectionGUID: deSJtx+8RYCgEppAg7D6Xw==
X-CSE-MsgGUID: dB3lcCvsTBCmJII4h8s1aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81368393"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81368393"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 12:36:13 -0700
X-CSE-ConnectionGUID: m+SRERAiSAmH1VymNHhOwA==
X-CSE-MsgGUID: QEpM52acQNyGxmB2UvmNoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="267991651"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 12:36:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 12:36:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 12:36:12 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 12:36:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDqZDfqZU9N/ACnzn6h7OwmRhYC+BTlLAwk87wJHK/sPk3haA4AiHIW/AfhL0e2BZZjHaN8jqxN3jhFrYwNFEpXRzmVA8UFsUxbFFK1kPQ3SB1mbm4Tv64UcBWud+aLlRklPBTEULTzcjsGqri/CYp7E4J2tqwhSQomHhp1Ic/JKEIUnIQ5yukSi7zsZkdY+gVG1328UmIcPevyTXqlTiuhRSB5oyggJrYZfAvua9sW+qLtFxWoXEqRlDxKAXUoeEt4EI3qb4x21RV1VgsoCac3zMkmrcZx0JTgMn2584Eht6fXO56t58Y39LOQgTuHoGf4gJvwjeFu+wkMK7zJ2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8n2q/McYs7IkuHnxHach1RK6WMrjoW9agOKHOjkQQs0=;
 b=PdDOEA6AZV1t8t8bhXp8vQBujUuC9AyXPqKWEk3+cDfRkCxlKL3xZQl0DtzNaD7LAPb5VPXeAWYTx2Zs/dsQXFsxDxes+l0oQ8ummTQBVVqnmDho1RUV+fJYfPHlx+167heOUgbQgN6GscWRghYOKwQ+tFXscsszjBYc4HqjvXY34KeDEFsX0tpkxniExN+4ijd1D4SJNEqilfT6OI9ZHDWTFnpObG1zuVEXAaejgw9Y6KAL6h7n7C6eNEsgC03ohAi2Zr+poENWTGS2Qtld8jAGJhKM7AUyUVyJTubbwjwf1muKZR9jfiloCPZunbRw9LLPaEhf3dgqey/D3d8ayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7268.namprd11.prod.outlook.com (2603:10b6:930:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:36:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 19:36:09 +0000
Date: Wed, 3 Jun 2026 12:36:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Stuart Summers <stuart.summers@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/wopcm: Move WOPCM size to platform info
Message-ID: <20260603193607.GE6262@mdroper-desk1.amr.corp.intel.com>
References: <20260603162619.1550794-1-shuicheng.lin@intel.com>
 <ec9ff2ab-68d1-4264-af8f-c26e2298cb35@intel.com>
 <20260603192547.GD6262@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260603192547.GD6262@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ceed81-b635-446e-be81-08dec1a75ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 8txRKPlxcmYxwvgXNp+OTrgUPWaCd1BU0YV4HoSniSqFNdE/t8qgG/Gvrq+bZoyxjYACLmnCYyzN1PMextCgz8X0Tfpz4o201xbVVg57niskhrvZeQkF4APtQWHLnrHvJS7Z1TnT5YoDDDVJk3NdXDpQ5jfM73AFDelIfc8ajt51MYtkbFOs7lVRT24RExaxIBjM1xuiZwoNxJgPJAC9FiqMN19FKyckjH2B8+QPgzzGuwhOj30lYPIujTx360TA5f6UJn2s/W428LjuhYz/uyvYixbAdTJaEMaX7JL4CN1dvBwo2LdmCAz0ZDoVrU/ICjX+oPhC1IJUNerDMkz+5oD4m5jq2tYW0OPIyA6TAqlb476vIPpxwydS3ZcRVu8uwqiRKdQJlo3cIY2Yu0HM7Wdwx9FDFPZZ7Ur6SAODGmAdSHOt5VfZO8wq+pCNJ+OkMKtJVFq0Amql0PlkN9FE4VKogIMxBr0+4LPFtsZ7XY5ElkkJyTMpj+sUx6yZ7d7OAGE1s6fjTYzZkI65aHl8bFWAAS/6HlmddJSh4eEnFy7zOKzsj6AZ881vT8kHTA+Zrubo0W0FREgBfnUcSkUSg383k71uQYVNX6NKF6ofein1wnblN0S/FOVKHBdGlvDcYBtnVqaUZG+27au9nT5LpFz8YatVJREop1UiuXsb9S1htPrvDYggL9Oc2r3gGQoV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZH+tz2brBnp916HfNpLE073LJS7A2aOSbZQufFlXyndyoGwx4oSRqaKUH+Rb?=
 =?us-ascii?Q?NHK63WfNq4k1Hw6lgF/ui3AQg1j5YFmFimg8NpfnrT//s1pxbTZe3nGbdU9i?=
 =?us-ascii?Q?cUP7KGTViF8dI4tWgdHvDm82wef7zT6u69ysWigboDfMEa7Wk0cJ2mXUStZc?=
 =?us-ascii?Q?FBbqHYUDNp3R9YPy8rIYhSVtELkYyzyZDpN7prV66mw4HQl5230TEkpkret4?=
 =?us-ascii?Q?oN+6iNWQWOz664u3Ob+ReH+llCkGRxYtyhDbRgqxNvpf/wFCOSVmP3iXbIm/?=
 =?us-ascii?Q?IavgJ6s1jE9h/yMkHOx5eot5hjIUq8u0zjlWB6XaWXcHtgIGAYRohNCtoF41?=
 =?us-ascii?Q?xYNd7EcNl6r9mDXvmSaFXI1YuM6Y5GzdWDC1LLfBTWTVWUO7ABD+STrRem06?=
 =?us-ascii?Q?zRDdA5DqcgzNqjcehHuhxAZjiJrU6TcEK7H02mfNG9iXgkoUtneES4fTFicJ?=
 =?us-ascii?Q?LXScdEOACGcZoli6VJTM9md6Zi73bQ1LGSTGbSBQp3R67xCPWFDyvLDIsZE5?=
 =?us-ascii?Q?pT7RDEqpMLQg3a2kvWeEbhaBXWZKwpeor0+XUznW+9Ld8emhTNqSxCOkVWUA?=
 =?us-ascii?Q?8cgoW9MC56lGQJiqeWDWKBnM7a1u5ULDp68iupmDdZ6EBtHkwsP4otGxurOb?=
 =?us-ascii?Q?pb7h9U/pK7x2w50yZH2k6CblbDb9tarYBHvBp25tCkWERmEgXX8W8FtdlLrK?=
 =?us-ascii?Q?rdFxmG5gIm0A5a7wV1Xg1zZgqD/C7Acu0jaiA8wTzrB/G4V/s3DMXI1fiXM1?=
 =?us-ascii?Q?FyncIRweiUZvt/3RCTtIx0kPnAhvIZUCBUbAVPZnIWjIDhc2z3hm3vTTEkqQ?=
 =?us-ascii?Q?Ks3oXpw0hB9mHxaO2FpRis87WuovXQ33lhpC+I/iON3668Xp9OaCSpsEh0oo?=
 =?us-ascii?Q?5S7eH4WXcX4MkBPpFibBykOVYE0z6yd3qMAltdvsAXE0HQT6e5fAclzbIXEP?=
 =?us-ascii?Q?qMSu/PHPB3aLC8C2lRJCLjIL6Uw2wt4glS42H01sqpQOcNFEt9vK+ys8CWIp?=
 =?us-ascii?Q?F4kWa9x/eaRCvzW3gZO9rbUvjoiz1mC6LOJYsW1GSU1AwjQvloy/7y7h0xvL?=
 =?us-ascii?Q?swW4a/CJlX/6Gf1OFdQ7rqdrkMo1b5aoNQyT9yY36N5Nx+PUemIkucT2u0C1?=
 =?us-ascii?Q?SAHamJl1KREPln4ozswrD81EnZIvlMvM3+RSH6tpQ266Qethc6w5vJvN5m+M?=
 =?us-ascii?Q?4TRK+kS5KefTqGfdjVp/EOU4dfzA0MGyaGObzjvMrjitCgAqjAFHTbc+myqc?=
 =?us-ascii?Q?kH3grlqyt7LIwXUAGhi2+YhgYj8Tx/c38JVQv8B5eCUNHkmQQj5fe71O+z7I?=
 =?us-ascii?Q?qP3G/IhlE9CPDYa8MP21ojSbvo507eyeIdRomvsWts9lGygYTVhDOsULC5CT?=
 =?us-ascii?Q?RqSG5NSxcDgTUHDcr7hKiPbmN0zY/4w3qzQ5/wi+sSc1YmgcLZx6qFk0k/tI?=
 =?us-ascii?Q?f/GOqhi8pOHjhwY9AMUgqP2TdhwNOqXGnZUomTG6Y25R8c3AAsnNPqqma7L9?=
 =?us-ascii?Q?CTEVuKeuTfoqbowAlzdrW9Un2syGJZR4k9wZXzrQFVEh0w350hgKw5X/vPrF?=
 =?us-ascii?Q?sIqwdiIeX7HdbHbXqWnRuvvTwsEyZcoIbIjVi6Tkahx9Xd1cC+Lu3Xt9oOfr?=
 =?us-ascii?Q?XiKG35Ct/AKiq+zWqH4FeONNWFNr1diFz+eFnchXZM7gU9wknbmzY+UwxM5T?=
 =?us-ascii?Q?KL9+A6CvEu4Xki/JEWp9v3GKDtKFXJIcjTTNhZUz7HlHiiEIKDulYU5JmBkg?=
 =?us-ascii?Q?A/ngc2f6Gl3bkorAioSpJTemdT+rpCM=3D?=
X-Exchange-RoutingPolicyChecked: j9fClN9KyvlLO5h2591k3EZ3miwkbbc4RiaJY12YoJgfyEx8ePaKLK5pFDh9euTc9CP1FgW0KZG5ug//4uaY/BOyv8eEjshIr/lE9OBY2nICEU5QxQSy/kWVQzkYFzNYlKSoD0Y38WSIWBT6AtaXPwR1ISMVJlNcAB6jKIC2gfEc04FM7flGn6EcTQ2d2t+65z7X3SLuCEZhjWIPnHu4lUeoLp9QLCCg4Tu2TFi37fsSfiiiNZK/VSuMzr8T13lMqU66OYg9eF+sfB04IPWYIZyW02bIpNjJ6e7mfT+SWQ82HKtwWbQI2GoTxjG7U4ZtpZEwrWNTFqXht4Ay/c3dCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ceed81-b635-446e-be81-08dec1a75ccb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:36:09.5644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZs74tJlIeMd5EkunygXrYqt42zbfT7pVH4inyLhWn5T/t/ODggE14WKy6wSgUXUJA0HY5QiJQDa6bVqwLbIhJViPVKgj099PPkxWVQQzkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7268
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

On Wed, Jun 03, 2026 at 12:25:49PM -0700, Matt Roper wrote:
> On Wed, Jun 03, 2026 at 07:18:06PM +0200, Michal Wajdeczko wrote:
> > 
> > 
> > On 6/3/2026 6:26 PM, Shuicheng Lin wrote:
> > > Replace the per-platform ternary chain in xe_wopcm_size() with a
> > > field read from xe->info.wopcm_size, populated from the platform
> > > descriptor.
> > 
> > we might want to update check_platform_desc test to catch any missing
> > definitions of wopcm_size field in new device descriptors
> > 
> > > 
> > > Per-platform values are unchanged: SZ_4M for DGFX and MTL, SZ_2M
> > > for all other platforms.
> 
> Assuming the values here are the total WOPCM size (for the entire PCI
> device, not the per-GT subregion), then are these values even correct
> and being used for any of the platforms officially supported by Xe? From
> what I see on bspec 67090 it sounds like the total size should always
> either be 8MB or 16MB for all of our POR platforms?
> 
> I think in practice we always find on modern platforms that the BIOS has
> already programmed the registers that control the GuC-managed WOPCM
> subregion and locked them before the driver even starts up; in that case
> we don't use the value from xe_wopcm_size() at all and instead just
> verify that the pre-programmed regions fit into the larger sizes
> returned by max_wopcm_size().
> 
> So I guess that raises the questions:
> 
>  - Do we need both xe_wopcm_size() and max_wopcm_size(), and if so what
>    is supposed to be the difference in what they represent?  I think
>    maybe xe_wopcm_size() was trying to represent some subregion that is
>    assumed to be "safe" from collisions with other sub-areas of the
>    WOPCM in cases where we needed to explicitly prorgam the GuC
>    subregion.  But if that's the case, is there a way for us to probe
>    those other subregions' sizes/locations directly to avoid collisions
>    rather than just using an arbitrary small size that doesn't match the
>    total WOPCM size?
> 
>  - Do we even need to worry about programming the GuC-managed area of
>    the WOPCM anymore on modern platforms or is that a cargo-cult from
>    i915 that just isn't relevant anymore?  If it is still relevant, is

I see on Bspec 60549 that the GUC_WOPCM_SIZE register can only be
programmed by the GSC on platforms with a de-privileged GuC, so that
does seem to confirm that reprogramming the GuC-specific area of the
WOPCM isn't relevant to any platforms that the Xe driver officially
supports (Xe2 and later), although it's possible that it might be
relevant for some of the unsupported, developer-only platforms (Xe1).


Matt

>    the GuC subregion the only one that we'd need to program in the KMD?
> 
> If we're moving the size(s) into the xe_device structure, then I think
> we'd expect the field to either contain the total size (which would be
> the values from max_wopcm_size rather than xe_wopcm_size) or we'd expect
> the field name + kerneldoc to very clearly explain what subset of the
> WOPCM it's actually trying to represent and what it can/should be used
> for.
> 
> +Cc Daniele since I think he understands the WOPCM stuff a lot better
> than I do.
> 
> 
> Matt
> 
> > > 
> > > This prepares for newer platforms that may need a different size.
> > > No functional change.
> > > 
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > ---
> > > Cc: Stuart Summers <stuart.summers@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> > >  drivers/gpu/drm/xe/xe_pci.c          | 15 ++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
> > >  drivers/gpu/drm/xe/xe_wopcm.c        | 11 +----------
> > >  4 files changed, 18 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 32dd2ffbc796..f44c031e3553 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -139,6 +139,8 @@ struct xe_device {
> > >  		u8 vm_max_level;
> > >  		/** @info.va_bits: Maximum bits of a virtual address */
> > >  		u8 va_bits;
> > > +		/** @info.wopcm_size: Size of WOPCM region for this platform */
> > > +		u32 wopcm_size;
> > >  
> > >  		/*
> > >  		 * Keep all flags below alphabetically sorted
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 3165686e3e04..6b7dd8661f64 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -10,6 +10,7 @@
> > >  #include <linux/module.h>
> > >  #include <linux/pci.h>
> > >  #include <linux/pm_runtime.h>
> > > +#include <linux/sizes.h>
> > >  
> > >  #include <drm/drm_color_mgmt.h>
> > >  #include <drm/drm_drv.h>
> > > @@ -206,6 +207,7 @@ static const struct xe_device_desc tgl_desc = {
> > >  	.require_force_probe = true,
> > >  	.va_bits = 48,
> > >  	.vm_max_level = 3,
> > > +	.wopcm_size = SZ_2M,
> > >  };
> > >  
> > >  static const struct xe_device_desc rkl_desc = {
> > > @@ -221,6 +223,7 @@ static const struct xe_device_desc rkl_desc = {
> > >  	.require_force_probe = true,
> > >  	.va_bits = 48,
> > >  	.vm_max_level = 3,
> > > +	.wopcm_size = SZ_2M,
> > >  };
> > >  
> > >  static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
> > > @@ -243,6 +246,7 @@ static const struct xe_device_desc adl_s_desc = {
> > >  	},
> > >  	.va_bits = 48,
> > >  	.vm_max_level = 3,
> > > +	.wopcm_size = SZ_2M,
> > >  };
> > >  
> > >  static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
> > > @@ -265,6 +269,7 @@ static const struct xe_device_desc adl_p_desc = {
> > >  	},
> > >  	.va_bits = 48,
> > >  	.vm_max_level = 3,
> > > +	.wopcm_size = SZ_2M,
> > >  };
> > >  
> > >  static const struct xe_device_desc adl_n_desc = {
> > > @@ -281,10 +286,12 @@ static const struct xe_device_desc adl_n_desc = {
> > >  	.require_force_probe = true,
> > >  	.va_bits = 48,
> > >  	.vm_max_level = 3,
> > > +	.wopcm_size = SZ_2M,
> > >  };
> > >  
> > >  #define DGFX_FEATURES \
> > > -	.is_dgfx = 1
> > > +	.is_dgfx = 1, \
> > > +	.wopcm_size = SZ_4M
> > >  
> > >  static const struct xe_device_desc dg1_desc = {
> > >  	.pre_gmdid_graphics_ip = &graphics_ip_xelpp,
> > > @@ -378,6 +385,7 @@ static const struct xe_device_desc mtl_desc = {
> > >  	MULTI_LRC_MASK,
> > >  	.va_bits = 48,
> > >  	.vm_max_level = 3,
> > > +	.wopcm_size = SZ_4M,
> > >  };
> > >  
> > >  static const struct xe_device_desc lnl_desc = {
> > > @@ -391,6 +399,7 @@ static const struct xe_device_desc lnl_desc = {
> > >  	.needs_scratch = true,
> > >  	.va_bits = 48,
> > >  	.vm_max_level = 4,
> > > +	.wopcm_size = SZ_2M,
> > >  };
> > >  
> > >  static const u16 bmg_g21_ids[] = { INTEL_BMG_G21_IDS(NOP), 0 };
> > > @@ -436,6 +445,7 @@ static const struct xe_device_desc ptl_desc = {
> > >  	.needs_shared_vf_gt_wq = true,
> > >  	.va_bits = 48,
> > >  	.vm_max_level = 4,
> > > +	.wopcm_size = SZ_2M,
> > >  };
> > >  
> > >  static const struct xe_device_desc nvls_desc = {
> > > @@ -450,6 +460,7 @@ static const struct xe_device_desc nvls_desc = {
> > >  	.require_force_probe = true,
> > >  	.va_bits = 48,
> > >  	.vm_max_level = 4,
> > > +	.wopcm_size = SZ_2M,
> > >  };
> > >  
> > >  static const struct xe_device_desc cri_desc = {
> > > @@ -489,6 +500,7 @@ static const struct xe_device_desc nvlp_desc = {
> > >  	.require_force_probe = true,
> > >  	.va_bits = 48,
> > >  	.vm_max_level = 4,
> > > +	.wopcm_size = SZ_2M,
> > >  };
> > >  
> > >  #undef PLATFORM
> > > @@ -757,6 +769,7 @@ static int xe_info_init_early(struct xe_device *xe,
> > >  	xe->info.va_bits = desc->va_bits;
> > >  	xe->info.vm_max_level = desc->vm_max_level;
> > >  	xe->info.vram_flags = desc->vram_flags;
> > > +	xe->info.wopcm_size = desc->wopcm_size;
> > >  
> > >  	xe->info.is_dgfx = desc->is_dgfx;
> > >  	xe->info.has_cached_pt = desc->has_cached_pt;
> > > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > > index 5b85e2c24b7b..35acb878c111 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > > @@ -34,6 +34,7 @@ struct xe_device_desc {
> > >  	u8 va_bits;
> > >  	u8 vm_max_level;
> > >  	u8 vram_flags;
> > > +	u32 wopcm_size;
> > >  
> > >  	u8 require_force_probe:1;
> > >  	u8 is_dgfx:1;
> > > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > > index 900daf1d1b1b..783bf37c87ef 100644
> > > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > > @@ -48,13 +48,6 @@
> > >   * context).
> > >   */
> > >  
> > > -/* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
> > > -/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner or later */
> > > -#define DGFX_WOPCM_SIZE			SZ_4M
> > > -/* FIXME: Larger size require for MTL, do a proper probe sooner or later */
> > > -#define MTL_WOPCM_SIZE			SZ_4M
> > > -#define WOPCM_SIZE			SZ_2M
> > > -
> > >  /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
> > >  #define WOPCM_RESERVED_SIZE		SZ_16K
> > >  
> > > @@ -179,9 +172,7 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
> > >  
> > 
> > while around, can you add kernel-doc here?
> > 
> > >  u32 xe_wopcm_size(struct xe_device *xe)
> > >  {
> > > -	return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
> > > -		xe->info.platform == XE_METEORLAKE ? MTL_WOPCM_SIZE :
> > > -		WOPCM_SIZE;
> > > +	return xe->info.wopcm_size;
> > >  }
> > >  
> > >  static u32 max_wopcm_size(struct xe_device *xe)
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
