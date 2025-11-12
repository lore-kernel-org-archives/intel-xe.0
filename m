Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5084CD1297
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 16:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF7B10E76F;
	Wed, 12 Nov 2025 16:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceFaoBaN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E0310E76D
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 16:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762963374; x=1794499374;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qUC3it3N6HB0kS/NLSq9Pg8KtXGhAYolED3QqQ3Ks38=;
 b=ceFaoBaNSWh8NCqbRwm8mb4SZ4nLSlLZn4h2Z8j9zaKIXSy2j+HNfbtc
 0o6jQ2HIuGEtjv0WdTIdtXz+XA18Yl0p841kueQv2x9rBzPKUzC9s3OCT
 +r6FFEUOlOlSSX7UJeojrYyp4ev/fhNb1HRJFqLlWuKWNSKVluStMoQMM
 8idjbA7jbIaxows46eLYJFHpOAI2uRHIkLR8pBi7A65T4iOn3hPXjEOTT
 GjrBVTc8O4gb3IAjYhAdNgVazvqlE12KnJ6m1gt1+tf4IdubmjJWHAfE2
 gjcx4Le/OyrpXeglT/iCbOfx1h50sgzsRcPXSYWRoaCKn429tJJOI7fsd Q==;
X-CSE-ConnectionGUID: I8N1bFT+QGyPPK2Uc4TWbA==
X-CSE-MsgGUID: z3KV/1ihQ0yAr0uYXO2Ahg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76132052"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="76132052"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 08:02:53 -0800
X-CSE-ConnectionGUID: g8EJd/ZoRna6Se+Gx/XB0Q==
X-CSE-MsgGUID: 7U4QV+pUSxOlkdLnD8BQnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189989546"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 08:02:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 08:01:25 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 08:01:25 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 08:01:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aO4GjNvsosjA1hBSt8HKWH3RHBymFjhCu9rjYDG8Y5TOt1MvCjgTB+gcA4czEYGwIgZFZAXhA3lB+DH8oOhcqIJN6VLXGCTcC4HaZ0JibK335ShQuJm9fIpzFmuVy+2RlNYhBYi4Ei/7qDR6ijj61Ad1SKX7hchQwuD2AZ2SFHxi4fpE5EbVH++LMKtfaNc7XngQ4xAAHBmYHRR8kP7EmDJdratCVuqKIPPuZQ/QFGZpEYkYjnsFDc4QmYYNUo7jFXBIE4IlfqwfyXtXTM2EskDvDc/tjisj3RuaH3E8eTuW8f5Q/KNAqzecvhuT91zy0+OWZR3C5BPM+rdb6BlCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyRau6hwuyjN2v9b5UIhB9trTMHszBw/ATDA3YMsr1c=;
 b=qzAdYCdry5xAshYhJpZQv7PnG2jJf0t4r/BDWRCycjhQFtAyE8V24mj/JXnRZbGxABDauGrhCFMIJ10a+JUe46h361Wj4RnMuZ0RoTM/V5WP5OJv78CBUw6q3NJl+o5dL4/ZuS76F3VzuwjnIdD2oFUFJqkOuUz84tHjLl8ZE9eBdzcHceB45fzeKqyTXWnUThYaJtzQuE2p/MAA0EY9gXOkV34m+g0aqCSifp2ZffspQxG37hq4KWn2sfwbqsd5CIyi9Ugiq+A34dXf1GEOHwyBGFUVFwcrMyeJOkxxDxUcW6Aq8qlY3lRfho/WVeKjjiP0WjClcyxJ9wXpfsYRfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8382.namprd11.prod.outlook.com (2603:10b6:610:173::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 16:01:22 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 16:01:22 +0000
Date: Wed, 12 Nov 2025 08:01:19 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: Re: [PATCH v2 00/30] Scope-based forcewake and runtime PM
Message-ID: <20251112160119.GF4063759@mdroper-desk1.amr.corp.intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <5e03b0fae8290a95733dda5a6627b12f5d70e6d6@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5e03b0fae8290a95733dda5a6627b12f5d70e6d6@intel.com>
X-ClientProxiedBy: BY5PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::36) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8382:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f95ad79-1a4a-4fc5-6368-08de2204b95a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2gUy/GI+qAFY685lFL7oo7x8Qgc0/Gsd8cfv8ltpsgYztRPMqR8XKZQGyaEg?=
 =?us-ascii?Q?uluqj7Idfv13tQI6HsU0XEIoZmTTbR42BXBO8YE04WCH29tBu3AvSvl2F9n8?=
 =?us-ascii?Q?Ez4iqCH3o5AR76J5pWhh/W2nhjYToYgSg0fc/zAjtGg51as18kacUcEsO8EL?=
 =?us-ascii?Q?MZy+intm9JzKg/FHH1AL4AzWlFIR9ngj3ooUXfJSfxm4xiaxQmocta0d3xwz?=
 =?us-ascii?Q?tOEYz1L4xLRQBEhIrGUpzoBFjtH3DOmmLLLbWc5WKLfd2kHWF5FXxiGnBWNN?=
 =?us-ascii?Q?qdVYwsCs7fp3YTzIqonbCrKy7Aapp5Q3Ao5L1txxghchvepaBqfEdS+qxFrO?=
 =?us-ascii?Q?SXKx1zc/uKMqbbiLN+5B7UHOZ6y2Lb73gBj5OTm9udP3Picx3tSM7b2JQtXW?=
 =?us-ascii?Q?2Z3gL26VT50OR32ngkwVnfsPb6YI8OwaHDsNp+O4NUkAH7pCC41aHGynqgA8?=
 =?us-ascii?Q?WJTolJGFmQ9FV1Hr5Hgns6qZhXi3XTvnqklV7AMMCWp5W4SN+qIfTug0AAyQ?=
 =?us-ascii?Q?hJ+excpRYpWWNstoAozxzmM9iGtxtH4cGW1YX1FWcC2coBO0xf8OijhnTetK?=
 =?us-ascii?Q?jeYF6Vg48fara7Mt2WCxg0J4nwLomEKnbzkgQfqxnAvjZ8gSiL7TkMfvE0c3?=
 =?us-ascii?Q?rQW5cpCWP3ZxQ/nOefykqdHFiRETj5kO3YvbyaC+pvZtvhX663danJB10r55?=
 =?us-ascii?Q?t0pOurRBbDx/+bjfZMevjhnCKXulJAJD3HUZM0unB7xoNr/senh8hS8R5J8f?=
 =?us-ascii?Q?Tx++YH2XnzOZ/0Ymgty+LU6W+g22r8Kwoo3BnhtKXMV2EM7toEQbM1f972mt?=
 =?us-ascii?Q?rwUTmxLeRrErZg00MkIaDJajEJQnBLDnxeRVGJHyDat/Dh+UVVdAXp64gZ10?=
 =?us-ascii?Q?Lu8P0WvXSHjZTElFMRO/E+O0J7AW327b0pGJrGJWSOpaTvjtqMjyv/bxywvK?=
 =?us-ascii?Q?vhqLqCBFwWFQ4UI37Fz1PquLM8KhLhrLG7M9uyO4oruUV4JCTIjDLUYpoT1t?=
 =?us-ascii?Q?Oc1H4dR6pVRYZ3hTuxCwuoK//ALYYLPMNewKEkU5kvGe+V9oLZvfLMW+WCsg?=
 =?us-ascii?Q?wpRQFDwMb30hTlK3T+UgdAV4SyPrLl6o9aOdt+xx3bEHbtJgMVCdePNplKSc?=
 =?us-ascii?Q?Qc3WiFgsWFTvC+xYezBLl8rJFlNTZNc5eoV2Cdk6P8foJRbTTHeDV19efwR7?=
 =?us-ascii?Q?U85yJR0e5NPp0QyulEYaeqf2KmKzAK8hkO5wf8JDQaecQ6O7pdXg8Ics2ySt?=
 =?us-ascii?Q?EuFWjNHnPUZmJGdgUBIsn+KGPfxbLXZ9CuHWcR1NJCKL6/v8GYI6S5Y8NQNU?=
 =?us-ascii?Q?ZAr196Y/QHNg/DdfmHfugbwLpuZbpVvZPAQLpwnhy6m1L6ZeNY3WpA0nsS2P?=
 =?us-ascii?Q?+D/1VgceTK4409FiNTgAtPR0sH/H5WpEpxwkFyN1/+1BUeQZYigXeSDBf+SH?=
 =?us-ascii?Q?qWl0hCRaU7mgTBC+HN2vhlQRoFuWm62YYUxctN0Dd0uXokWmvXXhUA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eEpyIVKHHhhQXXZfHfYMIIh/UAMVHZywriuQvI/6q17I6v2yRggyaSThiARG?=
 =?us-ascii?Q?pjg4eUkThvtdxOH7EbgQY9eXQH7ZGuJUndIMvmcxZQ2f1VoxM/SDulgFtyr3?=
 =?us-ascii?Q?Z0P8iGqS8q+68fkTemtXiPN76a4a8QLRJR2ZUF2+NcDW9bZHGtsZelhXQM1E?=
 =?us-ascii?Q?f3RQc2NE1jNk0yE/c3pYvEp+TOw7fb6RwWhDALZcdpKfzzQtAbUJDbAsfFVM?=
 =?us-ascii?Q?35xHtwjgKLlrQMVr/z5NQjKCGjqOCWtvnChEfZSE6mLXd03T8zC22lYYx6CB?=
 =?us-ascii?Q?Xzvsa5UHaoz89Uw5FYBtnN4M/5Inw9FkUxBeidKjbz4+/O25ujpJF4OIybiV?=
 =?us-ascii?Q?4e9voK8N9cJ687drwFsACz/z74u0y7VWAtmdNPgEN3tJfg4mPGNBfiRjqgOe?=
 =?us-ascii?Q?+FICD3SCDRh0neVrUTPleZ/Qbh9vOuw180a1I8IAStF2r4syzbelhaUawEZs?=
 =?us-ascii?Q?tnX/q+pFkRop1jErNIp0Qp/albupWZXUFAqwQxkz/k/aEQG3Vr4JRTAryCLW?=
 =?us-ascii?Q?X8VWwSuxjAt5d3OaQuBp5h7Xmaycz0myLfKcNEmMPnYheWHtqOqXOGmknLF0?=
 =?us-ascii?Q?sAD5N0B/azd+clFwtVYwaF9x1B2KQDmVB+ifYehnn4yalzTZJRieIa5MGznh?=
 =?us-ascii?Q?hhKb6NWe/Yi+weLeAgy14RnNc8SKUrfpA72wNLas6gnxV6ytSJBv+1MbYRcl?=
 =?us-ascii?Q?KVZL8TsJTBXUYTekTkr04PpT+umNCZ4XqRnf+bHC2od57DHwfvkIOKTLqNqz?=
 =?us-ascii?Q?NiWEvJOoo5SZ3JjNUJnnN9uvJwliPJTGXA2mi7lLJ+VeKC0vGJe/jUPmOQYJ?=
 =?us-ascii?Q?GUD6Ut+B8ZTHAWvtHElFjhvzeMfz4KXhnFw8/w3l7aWx7UM99sKbJ11kJEbW?=
 =?us-ascii?Q?SSbgytNIDfd+YILtVNaP8vcNbZnBzlMAOw2OIG9Qk4B2Niq8ZF135Pwqoo2S?=
 =?us-ascii?Q?yOnBTLSCKx+gscRw+gLZvxHLm/VW+BhQ8fIlo8MIFtaSQKJVnp3EyBFsV9wD?=
 =?us-ascii?Q?bn3K4lZEyhuGhtUJM5zWA9RuMLnsVoZCZwcYIKlRHpJBp8TNd88NQltGv6qr?=
 =?us-ascii?Q?Sv0W6RCOlHDOSAVIQAT8clSwe7Bl6qgNVifQ04kV0ohAOeB16Z8G5LNYp9s8?=
 =?us-ascii?Q?+ceZMPJaV/MdtqnBfmGbXBai9ZtOKPQujrHkJnFTjl9DzYykhprYOBkWhITv?=
 =?us-ascii?Q?k0ISYbnTSeMdiqHmglFy5t9Gt8qckhgL0XXGfQ09L15PeeLpnBVDs5Af+Kfg?=
 =?us-ascii?Q?ON2zbmWS5sAcAjofBAPb0VVUwloI92GS43sEt3q/mPW3kvf5S+ORfEx0I4OA?=
 =?us-ascii?Q?b7CoNHTor34KAxQV5VrFJzvoXwtItlhsHkCYU2E5ohQm8sVyQBaz3h6pDUwn?=
 =?us-ascii?Q?1M3lc3U7HDccb0kdUnOIk2QylZLOiOjtgCMJ5MRRL0yUcA9S2hcL0lpimEHn?=
 =?us-ascii?Q?tjLpCuWJX9bufec180Evh7ks8b2kweDlJgU/BoRZl9dll3fR/rzb1DpgLNtg?=
 =?us-ascii?Q?G05PKDeVgQrPpdJIooQVlsr8vyIagnJMPcSduB8zrPoRkA8zRlv8OleLw1hN?=
 =?us-ascii?Q?Rl5IwSwRVWrM1gCXa2Gsr+FlIC26hJJtOcd9TBvjKJkj+3i5TM3WxsH+O0LE?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f95ad79-1a4a-4fc5-6368-08de2204b95a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:01:21.9955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N57G4DaQcbWfy+7/Vbrx4E+lVTcje7e2sTenAeDz5Q75Ve+VCQGYpHRByHPoBn8EMbz2HQlCqG1OGseNHkh6yuyJ2riRgVtk2SBLav9vDFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8382
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

On Tue, Nov 11, 2025 at 12:57:13PM +0200, Jani Nikula wrote:
> On Mon, 10 Nov 2025, Matt Roper <matthew.d.roper@intel.com> wrote:
> > Forcewake and runtime PM both follow reference-counted get/put models;
> > when used in functions that can encounter errors and return early, it's
> > easy for developers to make mistakes and fail to drop a reference on all
> > of the error paths.  Cleanup of these reference counts is often
> > addressed by goto-based error handling which is somewhat ugly and
> > subject to its own set of mistakes once we accumulate too many error
> > labels in a function.
> >
> > Scope-based cleanup ([1][2]) has been gaining increasing popularity in
> > the Linux kernel for cleaning up various kinds of resources in a more
> > automated way when code has lots of error paths and early exits.  Let's
> > add scope-based cleanup for both forcewake and runtime PM, based on the
> > mechanisms provided in include/linux/cleanup.h.  Scope-based cleanup
> > allows cleanup destructors to be executed automatically when the current
> > scope is exited by any means (end of block, return, break, etc.).
> >
> > For xe_runtime_pm_{get,put} pairs that were grabbed and released within
> > a single function or block, the preferred replacement is now just
> >
> >         guard(xe_pm_runtime_noresume)(xe);
> >
> > which will take care of releasing the runtime PM reference
> > automatically.  scoped_guard() can be used instead if the reference
> > should only be held over part of the block.  There are also guard
> > variants added for xe_pm_runtime_noresume and xe_pm_runtime_ioctl that
> > allow replacement of those alternate functions as well.
> >
> > Unlike runtime PM, where all reference tracking is done within the
> > object parameter itself, forcewake is currently a model where get
> > operations return a cookie that needs to be passed back to put
> > operations.  That necessitates a slightly different type of cleanup
> > helper (CLASS instead of guard), although the underlying mechanisms are
> > the same.  For forcewake that is grabbed and released within a single
> > function or block, the preferred form is now:
> >
> >         CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> 
> I think it's bad style to use CLASS() directly. Isn't ACQUIRE()
> preferred if you can't use guard() or scoped_guard()?

No, ACQUIRE() was something added later to deal with conditional guards
in commit 857d18f23ab1 ("cleanup: Introduce ACQUIRE() and ACQUIRE_ERR()
for conditional locks").  So things like xe_pm_runtime_ioctl() or
mutex_lock_interruptible() which can fail and return error codes would
get converted into an ACQUIRE() / ACQUIRE_ERR() instead of a traditional
guard() so that we can handle the return value.

But CLASS() is something different where you want to create a named
token object in the current scope that the code can also operate on in
other ways.  In the forcewake case, we want to be able to inspect
fw_ref.domains to figure out which specific domain(s) were successfully
obtained by the forcewake request.

guard() itself is build on top of CLASS, but class can be used in
additional settings where guard() is insufficient.  We already have some
other CLASS usage in Xe such as xe_guc_buf, which is created similarly:

        CLASS(xe_guc_buf, buf)(&guc->buf, OPT_IN_MAX_DWORDS);

and then there are various other operations that can be performed on the
'buf' reference.  Another example from outside Xe is gpio_chip_guard
which is used heavily by gpiolib.


Matt

> 
> 
> BR,
> Jani.
> 
> 
> >
> > which, like the runtime PM equivalent, will cause the forcewake
> > reference to be dropped automatically.  If forcewake needs to be held
> > over only a subset of the current block,
> >
> >         xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FW_GT) { ... }
> >
> > can be used in the same way scoped_guard() is used for runtime PM.
> >
> > The first few patches in this series make some general cleanups and
> > restructuring of the existing force wake code.  Then the new guards and
> > classes for runtime PM and forcewake are defined.  Finally, most of the
> > existing runtime PM and forcewake usage in the driver is converted to
> > the scope-based form in the remainder of the series.  Some of the
> > conversions eliminate goto-based cleanup models and/or significantly
> > simplify the code.  Other conversions don't significantly simplify the
> > code (aside from a slight reduction in line count), but are still useful
> > for consistency across our codebase.
> >
> > An advantage of doing the conversion everywhere possible, not just the
> > places where it noticeably simplifies the code, is that it helps
> > highlight the remaining get/put usage as special cases where wake
> > references follow more complicated lifetimes (e.g., obtained in one
> > function and released in a different one, often tied to some other type
> > of resource or operation).  With fewer direct get/put calls overall, its
> > easier to identify the ones that remain as special cases and make sure
> > they truly are paired up properly.
> >
> > There's other areas where scope-based cleanup could potentially be
> > applied in the future (e.g., mutex locks, bo locking, etc.), but this
> > series does not try to address those, even in places where those
> > resources are also part of the same error handling cleanup paths as
> > forcewake and runtime PM.  We can potentially think about converting
> > other types of resources to scope-based cleanup down the road if it
> > winds up working well here for forcewake and PM.
> >
> > v2:
> >  - Add a proper success condition to the xe_pm_runtime_ioctl class so
> >    that conditional guards properly distinguish success (requiring
> >    cleanup) from errors (no cleanup).  (CI)
> >  - Don't bother changing the signature of xe_force_wake_get() before
> >    adding the forcewake class.  Simply create a separate constructor
> >    that wraps xe_force_wake_get().  (Michal)
> >  - Split ACQUIRE_ERR assignments from the condition checks.  Even though
> >    this takes an extra line of code and deviates from most of the other
> >    uses in the kernel, it's easier to read (and avoids checkpatch
> >    warnings).
> >
> >
> > References:
> >  [1] https://www.kernel.org/doc/html/next/core-api/cleanup.html
> >  [2] https://lwn.net/Articles/934679/
> >
> >
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >
> > Matt Roper (30):
> >   drm/xe/forcewake: Improve kerneldoc
> >   drm/xe/eustall: Store forcewake reference in stream structure
> >   drm/xe/oa: Store forcewake reference in stream structure
> >   drm/xe/forcewake: Add scope-based cleanup for forcewake
> >   drm/xe/pm: Add scope-based cleanup helper for runtime PM
> >   drm/xe/gt: Use scope-based cleanup
> >   drm/xe/gt_idle: Use scope-based cleanup
> >   drm/xe/guc: Use scope-based cleanup
> >   drm/xe/guc_pc: Use scope-based cleanup
> >   drm/xe/mocs: Use scope-based cleanup
> >   drm/xe/pat: Use scope-based forcewake
> >   drm/xe/pxp: Use scope-based cleanup
> >   drm/xe/gsc: Use scope-based cleanup
> >   drm/xe/device: Use scope-based cleanup
> >   drm/xe/devcoredump: Use scope-based cleanup
> >   drm/xe/display: Use scoped-cleanup
> >   drm/xe: Create scoped cleanup class for force_wake_get_any_engine()
> >   drm/xe/drm_client: Use scope-based cleanup
> >   drm/xe/gt_debugfs: Use scope-based cleanup
> >   drm/xe/huc: Use scope-based forcewake
> >   drm/xe/query: Use scope-based forcewake
> >   drm/xe/reg_sr: Use scope-based forcewake
> >   drm/xe/vram: Use scope-based forcewake
> >   drm/xe/bo: Use scope-based runtime PM
> >   drm/xe/ggtt: Use scope-based runtime pm
> >   drm/xe/hwmon: Use scope-based runtime PM
> >   drm/xe/sriov: Use scope-based runtime PM
> >   drm/xe/tests: Use scope-based runtime PM
> >   drm/xe/sysfs: Use scope-based runtime power management
> >   drm/xe/debugfs: Use scope-based runtime PM
> >
> >  drivers/gpu/drm/xe/display/xe_fb_pin.c        |  23 ++-
> >  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |  25 +--
> >  drivers/gpu/drm/xe/tests/xe_bo.c              |  10 +-
> >  drivers/gpu/drm/xe/tests/xe_dma_buf.c         |   3 +-
> >  drivers/gpu/drm/xe/tests/xe_migrate.c         |  10 +-
> >  drivers/gpu/drm/xe/tests/xe_mocs.c            |  27 +---
> >  drivers/gpu/drm/xe/xe_bo.c                    |   3 +-
> >  drivers/gpu/drm/xe/xe_debugfs.c               |  16 +-
> >  drivers/gpu/drm/xe/xe_devcoredump.c           |  26 ++-
> >  drivers/gpu/drm/xe/xe_device.c                |  33 ++--
> >  drivers/gpu/drm/xe/xe_device_sysfs.c          |  33 ++--
> >  drivers/gpu/drm/xe/xe_drm_client.c            |  83 +++++-----
> >  drivers/gpu/drm/xe/xe_eu_stall.c              |   8 +-
> >  drivers/gpu/drm/xe/xe_force_wake.h            |  28 ++++
> >  drivers/gpu/drm/xe/xe_force_wake_types.h      |  26 ++-
> >  drivers/gpu/drm/xe/xe_ggtt.c                  |   3 +-
> >  drivers/gpu/drm/xe/xe_gsc.c                   |  21 +--
> >  drivers/gpu/drm/xe/xe_gsc_debugfs.c           |   3 +-
> >  drivers/gpu/drm/xe/xe_gsc_proxy.c             |  17 +-
> >  drivers/gpu/drm/xe/xe_gt.c                    | 151 ++++++------------
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c            |  29 +---
> >  drivers/gpu/drm/xe/xe_gt_freq.c               |  27 ++--
> >  drivers/gpu/drm/xe/xe_gt_idle.c               |  32 ++--
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  12 +-
> >  drivers/gpu/drm/xe/xe_gt_throttle.c           |   3 +-
> >  drivers/gpu/drm/xe/xe_guc.c                   |  13 +-
> >  drivers/gpu/drm/xe/xe_guc_debugfs.c           |   3 +-
> >  drivers/gpu/drm/xe/xe_guc_log.c               |  10 +-
> >  drivers/gpu/drm/xe/xe_guc_pc.c                |  62 ++-----
> >  drivers/gpu/drm/xe/xe_guc_submit.c            |  11 +-
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c         |   4 +-
> >  drivers/gpu/drm/xe/xe_huc.c                   |   7 +-
> >  drivers/gpu/drm/xe/xe_huc_debugfs.c           |   3 +-
> >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |   6 +-
> >  drivers/gpu/drm/xe/xe_hwmon.c                 |  16 +-
> >  drivers/gpu/drm/xe/xe_mocs.c                  |  18 +--
> >  drivers/gpu/drm/xe/xe_oa.c                    |   9 +-
> >  drivers/gpu/drm/xe/xe_oa_types.h              |   3 +
> >  drivers/gpu/drm/xe/xe_pat.c                   |  36 ++---
> >  drivers/gpu/drm/xe/xe_pci_sriov.c             |   3 +-
> >  drivers/gpu/drm/xe/xe_pm.h                    |  17 ++
> >  drivers/gpu/drm/xe/xe_pxp.c                   |  55 +++----
> >  drivers/gpu/drm/xe/xe_query.c                 |  16 +-
> >  drivers/gpu/drm/xe/xe_reg_sr.c                |  17 +-
> >  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |   6 +-
> >  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c        |   6 +-
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c          |   5 +-
> >  drivers/gpu/drm/xe/xe_tile_debugfs.c          |   3 +-
> >  drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c |   3 +-
> >  drivers/gpu/drm/xe/xe_vram.c                  |   7 +-
> >  50 files changed, 387 insertions(+), 604 deletions(-)
> 
> -- 
> Jani Nikula, Intel

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
