Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88893E7E0D5
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 20:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB7F10E36C;
	Mon,  9 Feb 2026 20:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XH0Pctnu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DADD10E36C
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Feb 2026 20:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770667358; x=1802203358;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gYVY9MDeDywQbrppk6MmnOsyo7ywTkdJhI0wG8YZrlk=;
 b=XH0Pctnu0aiuJ+pgPCghw+f9ZS2BTHKUsRAzBTsyygeunI/kRrdfeY3F
 gITYcXMRgbWUBE6b+nQ0vmXWWHjp7dNiTHzCAFPOPJs8rm7Cgc/aDixai
 7ftnk7CQGAAzPKauEkLGJubeYf4mDDff4Q8Cj+ZISHltgsKHN0htW45uj
 Jf1kql9QTVbetN4GWL8oZG7GCQL+DHB+efFSPSuQjudRAwoH2o6wS1Rjs
 K7WtaxnRFLQYAfwg2TJVzj8zKbHFzGEtDGp7wji4XIcawdsX5Oa+A0jT9
 Xqn/G8NaLY+7Z3GVkV+zChyJH+WxJldgeSK0GHYMEZE+mQncr5mSgLReK g==;
X-CSE-ConnectionGUID: 88XgvppdQn2RkyS3h9a6Aw==
X-CSE-MsgGUID: p2C+uwDeRiCOfu9bJ2uCSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="83229967"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="83229967"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 12:02:36 -0800
X-CSE-ConnectionGUID: gtz35PB7RlGeE3oZ6VAySQ==
X-CSE-MsgGUID: I3UvTCDhSkie61JjNfBRnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="241778708"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 12:02:36 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 12:02:35 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 12:02:35 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 12:02:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyliATzmQbfOUYX8RYOGGp6gj2X0oq96QwBh7Q29a/pAywXJELjcXm0qCv/MWOBK50sYckSVPnS2jWf/ErG/GBLMyrBm8VliBeXePlKkMCzayhxqkmfkykeJnzfAZiN73pdcRS3Pv5HsCS6KAhjyet5MuikGG7FXBmeTvE9YfiWH5boSNmCfSn3HrCOvCK69j/2kjexyfb/QC1V9mR6hF6kJOuLuZ6qIIVdPuuyRV5zmdUTX/tWrHQQ9I9zg4SsRAAlEPyoNGJVBahZv4fTbwLHoNUyzkgCK9ukz7UmyjYxwf1i7J0jGG5KuI5CLa3gOk8XtlmKZ3CMPI8hNyBsZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkPUW1Xd7kQYpv+D2iX8OET+6dTcRH0KeRxMF46jLtQ=;
 b=xdmIF73nYt47OPeA5aJF6X0DlTTEeywFa/r1yywKRg4oa1xZlCf7Hj/o6VZrwRIT+lWbSfo8wTMXKtltCTHa31j5dlPbdafuyZgLgFtUBkWPXe1g+6sQDx2ZvKG95ihmQl+uhpy7Rw1GEiUadL3dlmDG/R14r1ExvPV72b2ticU8bpK8A51d/Eh8qJJvIGz2t3Gs5s4ep+1954zwWnRiSjFVnKLEIVuD+Bb6dxFk+H1jEkjFy4689XZm/U89DK0M41iFE1jM7tq5Ycfasks+01Q/pbwUDhS0ZRXZi/OX6/oIKtWaEg1R8hHTcP06p7nGsRnKAmbTyyfKOKHm+XMYFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7558.namprd11.prod.outlook.com (2603:10b6:8:148::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 20:02:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 20:02:32 +0000
Date: Mon, 9 Feb 2026 12:02:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Sk Anirban <sk.anirban@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkJBVDogc3VjY2Vz?=
 =?utf-8?Q?s_for_drm=2Fxe=2Fguc?= =?utf-8?Q?=3A?= Add Wa_14025883347 for GuC
 DMA failure on reset (rev4)
Message-ID: <20260209200229.GE458797@mdroper-desk1.amr.corp.intel.com>
References: <20260202105313.3338094-3-sk.anirban@intel.com>
 <177006671445.217507.3323580255112043090@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177006671445.217507.3323580255112043090@a3b018990fe9>
X-ClientProxiedBy: SJ0PR05CA0124.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 175fa3ab-a8d0-44f2-7b32-08de68162916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hkos8/UF0a+/GW/HKoxhvvrDSmNZbEiVNv5MSdRj43hiHvV7rVsAVUKGca3f?=
 =?us-ascii?Q?FZfw+21i20yRYD6O5GGflT4cPl4YCJH2HJ82+eujXLtrJn0mJ+wCdRdPBP/m?=
 =?us-ascii?Q?McBiUGIqy7EM7OGfMpt+R3wBAT2AS8bSlVyUWi+fsL6mTZdP6Tuepx1qrQmY?=
 =?us-ascii?Q?q1dgUfKfZ+fZN/xXA7hshEykzZN8vAEmDNWYIYUf5FQDpmWFStvDSZvGJcAH?=
 =?us-ascii?Q?wZL83UKiNqWrsOchNFXUKLvJxDvWLL9KAc+MNcZdVgsiZqoJP3Eoan+oJf0C?=
 =?us-ascii?Q?W2tFqKDi4NtpSw62DUKRMvznQmOidrix9eEgzjXVbeEyvy35aXz8qUex0imT?=
 =?us-ascii?Q?P2eTTSLB6mASsizdi1R0QNX92P0XH4rLaxP3hizmMtiRGIx/ZA1KQYEfDRcR?=
 =?us-ascii?Q?oN/QCYs/VBsnhss3xxZARuZZyuqsPF8RDhje8dPCrbYxzBErPmFAeYzVccyv?=
 =?us-ascii?Q?wKLPlvFIKoJknrtQRe3KMHs+bV05mItghsY270CFffFLuoOWDoWHwOFQ6h9k?=
 =?us-ascii?Q?bplp+zOTPFHcp06oRvCjW9xoP3FCXyP/GAHIGp5TsWgnZSgWZ6Bio2o3WWqp?=
 =?us-ascii?Q?JK3kMbDepD8Q9bdBI7hsK9s7yGQ+64iEtDWF8MpDYg3/WzhEnn8pXauZj6YC?=
 =?us-ascii?Q?t4NmRFEHlqhQE2i54tyWQCp7raSKWSiqzRE6jUg9dmsknUMZZGLgCCAGVmSB?=
 =?us-ascii?Q?tOZKrQ7R83mqA0adOgt1xdpbMv2BvhyyRFbPXgmpNjOU8Hqf+/3g7HjiLJcz?=
 =?us-ascii?Q?hOrbOghd5JgG6PiuzI1+zTJCVKe5fiuUqkfHdz54ChpnGZ7XWAI6siI9PRD5?=
 =?us-ascii?Q?LmnfImIDQO9LHsFcyjmC1o3qoEO0x3pTqwYYRHKK/0HOxKJo5IVSTJLm93kP?=
 =?us-ascii?Q?SCF1vSUGD1PIOj3vBakWtrQ/vJ1GtrfIc0D/Om01Pn1o20PUWo3DjOdlk8CH?=
 =?us-ascii?Q?JlHB6Q76/FJSPnrSoUXpAzp3fRxq6vo5A3j8VyaXzPtFRtwqJMhTbjsIjryy?=
 =?us-ascii?Q?Qa/1q1YVYq8CdbBnVj844LdNL7nnMyr4Ga1dBzXF4t9BdqW2I/sTZoM2t65e?=
 =?us-ascii?Q?xXFeQEtPdYM3z7piiGnNqm4m1WKVihB/hbd6eC/VKgVVYtVjRMqi7Vf9kAOh?=
 =?us-ascii?Q?cuQXjXGPd6o23mwHT8o5q3T1+nxSjyG8TiEmTnp/vaYuuZviKKOXRPP+jKzP?=
 =?us-ascii?Q?0t6SPLh97o6gBFxXcFmxsKPJr8LaHVwZUrIaxicnLftfy4wHDZ1iLIqqtaZb?=
 =?us-ascii?Q?at0hdomPxBkb9oi4nXJTzLH+FBRZdCG/vMY0v+EaA7I0l6sTre/gZfSiJeOP?=
 =?us-ascii?Q?tyNj5Xphnvk387gn62tCyoaAq2kwqCQP0Iv6v7L1uNrP9x0SaeEMwybIG8wR?=
 =?us-ascii?Q?O1s8o/VdymuNqHowl1vX//Ujlr9VwgLxtaLltWnSpl1EGxLWQLnTCJRtthnY?=
 =?us-ascii?Q?+viebEsg7ukcQZfALC6JUbQ4eFdicy5tmItI0hbBOFd89OsLIdn9zAxzLxNT?=
 =?us-ascii?Q?iN9cG8TBep+5dpY0Zn3ZFtBCtwlqKB2AwDZW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gdRy7hO5fAkv+hfOjgmhJfjqbAi0/EY0XLLkwzrLJj/n7GRJUsmudtyi8Dn/?=
 =?us-ascii?Q?21HbXrXuCH1UAqOQ05rg2AR+14AJBzIfLC2ezoc1J5n369kgZj/FOIVoICmw?=
 =?us-ascii?Q?CwjrPY4Gv5V+vhsb7TSgKXfPfp7GkAUlw3JKgEgtZcgN4tgrygS1budYCOqQ?=
 =?us-ascii?Q?31Dnbv6LCWuFmIVUyBJwSsBsmwZYLnjikFhwfLddxg2pv1unFkhveMwAnmfa?=
 =?us-ascii?Q?zFruqiB9HtwHEkJKyPmSIRCjPGw0rgMfBR3DahhV+YBydpCdkUcyx9pgrHI+?=
 =?us-ascii?Q?a2iGtlxeBmIC7uh2yzHmQ7Z8C6CQuX3lBVFC2+d/Q/CoQ+mDMIVVRzBxuHLj?=
 =?us-ascii?Q?/erOyMkutBOqsjNxTn9S3osqmNGr+mZWvDV0yCozCJiLgBzXhJI/8Ztruxl2?=
 =?us-ascii?Q?W4Ae0xd3ieBUNfR/clcnWE2kmGgAfaJ/qAPBcuAldnAZKlT4yU05+rQD3LGq?=
 =?us-ascii?Q?/8FG7aj1R9CcnMMGLFwpv3fhw4TlVXJ6myfkkg3ZvUEcAeZkqa+5V1p2L6al?=
 =?us-ascii?Q?4i7fccaNJTQZDh9eAnRBSH7silGXa/Gp1GrG432VH7Nzr84FKVRdZKE9xqdd?=
 =?us-ascii?Q?h8rhMLM4/QnibvzONeRUmwuuX9jSQE5S2/awHVW1qloQ+ukLx9KoCUtGNBlj?=
 =?us-ascii?Q?MmLY/fGNES/b7jjnlG0+ivNtou/L0E/C8GUThVhrUG6vZU2/NZQ8x2G+Dh5R?=
 =?us-ascii?Q?HNA9B9qnKl26ZiMwUFddUBXYXpPpO1A2wplE6scBnTG/vFng1wlXMf7yHAtS?=
 =?us-ascii?Q?X5bvqwz7KPTD/E+0uNC0e6SFrv7y60aNS4pq8zHYyuqIuGMmEyYVu8nZ9dx/?=
 =?us-ascii?Q?FzTjRZSRQtrRvLEbgLq+nKdRqpnjk9Q35WdQwNeWh/UmbED0qavqfEgwF/74?=
 =?us-ascii?Q?IUQC9UFDwV9Gu1TyY3aJkDfj6yhajBRaKBEdgUFC8zuoE/B0LYzWt8J/qCE1?=
 =?us-ascii?Q?9HgS3aXEAg6tBwDQWt1ZvDfaK7lVDpA2tQtASO4VQJQTKvy0mdTJi2lp9KyX?=
 =?us-ascii?Q?o/GL2CHG2NOK2fbQuzsX7vFoqRVZlpJPdhz5xrx55thlAoSBv18HmKDwHGI2?=
 =?us-ascii?Q?oFnxTP32SEoXgZ//+YtyJXLjugW5sg4jZfLIUu7uTmb57TYyYRAF/wPmctxX?=
 =?us-ascii?Q?bYDafsLfSCAFHLl3lrduJz7Vbxa6ueGuJKLsK9kqnugFZlWh3kA3l1QG17b5?=
 =?us-ascii?Q?JGW+6203D5V5kRVMj9Xa8o0+3dK65cnci5xd6BoYZsQv7NEelQYmC8KE3ecT?=
 =?us-ascii?Q?5kah/a+6/Kog/e3gvHL3J9kR9hcdw0P5zc4eeRdfEMKlcUaE2oJWtqJHRuwj?=
 =?us-ascii?Q?tyd6cCJf8+kioyJFiu4JJLnaTjMz+OJiKYiHb7QfWMmu9x/rtmA4mZI6tp1Q?=
 =?us-ascii?Q?vif1R4AGLGwWUntz2NodQ41VqAR0Sz8bCm07JogOr1yOZYSYWJSPtxgbmM+i?=
 =?us-ascii?Q?O68wloKF/loMylX1p4bxtkKJUy6/emuZ58VHMtizFWqdYGE+CxXtvZ3BaGOM?=
 =?us-ascii?Q?bCJlFQOhTaMFvhftQwR4QRb0au/lOj6E3uM/DcaFoqcnPIeMWYiJ9+uS/3OT?=
 =?us-ascii?Q?dfX0eX60pgrvZ9lM+MnxgVmwlWksqAKCFLvxGG+QZrcVLtUMWIRQkj3/dDIA?=
 =?us-ascii?Q?gtUwGqO4JdhTPJZMioXkrhyC87EibwRB0ck6QuPNHyjBxAM6wxm0L3btNDad?=
 =?us-ascii?Q?FAUYglEvpG5SbfNlNtMq9/TaecwLYx6uXna8Lp0MHzwioU8Z8UEfJZdc1GpN?=
 =?us-ascii?Q?CP1peeEZOhob2u3dq1dG58kFxTccyH8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 175fa3ab-a8d0-44f2-7b32-08de68162916
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 20:02:32.2820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvOQOKnM5qYhrIck/cM08V+l4Sprz+8gQ8npD8peSWbi49TJrFnBSmTTt5eoBMYjpcohzgnO86XRXa1Unq0c+acTnD1qcoFlEm76gCdbHP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7558
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

On Mon, Feb 02, 2026 at 09:11:54PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on reset (rev4)
> URL   : https://patchwork.freedesktop.org/series/160091/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3_BAT -> xe-pw-160091v4_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

The CI.FULL results never made it to the mailing list for some reason,
but can be seen in patchwork.  The two KMS failures listed there are not
related to the GuC workaround here.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
>   
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3 -> xe-pw-160091v4
> 
>   IGT_8729: 8729
>   xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3: a68485eec77211a46da7bdb6a0f862e4b365f1e3
>   xe-pw-160091v4: 160091v4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160091v4/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
