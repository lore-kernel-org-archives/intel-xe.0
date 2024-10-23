Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EACD0BB46
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 22:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862F110E0EE;
	Wed, 23 Oct 2024 22:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tjn4TjOI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37E010E0EE
 for <Intel-Xe@lists.freedesktop.org>; Wed, 23 Oct 2024 22:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729723488; x=1761259488;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ARsVHP6CimZnmzF8hNca7reVeydZOKbrlVK3e5M6sIM=;
 b=Tjn4TjOIM9rzaHI3VYQ+reP4aF8vKsLNWFcsPZSQQbmG1VIIZeDojiaw
 mY9h0u+6V3Zrgqwk5AE8QF55xqznsY+4SwHCjpx3Pw8rdlJZP0Tf3Z7OF
 MbK2nXCmnlRPq40ebptvxLbf7y8hD5F/KFDNZTgj0rkg/JQJ3DqNa2GAd
 UbN/6hW4rp/gYYdfIc2YTDQ7rCm3NzHYO2i62zXNGXtYCHD4+2JLC2EBL
 GYdacCvG6eRDKGGycL6YpkfB+ppvWJd3pzjQxJvYsGq2Lu86PwtALf9ch
 /HZRb0C5dBMdiD/XsGg278UrQP8mAFLLIBlftE60drm1enM80U/Oa6jP/ g==;
X-CSE-ConnectionGUID: biZsUxV2SXiMliHgRHuIKQ==
X-CSE-MsgGUID: QvT3+ID5TLWYNkbKIMZd6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46801403"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="46801403"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 15:44:47 -0700
X-CSE-ConnectionGUID: JSctXarNRQGuOJa4atYbbw==
X-CSE-MsgGUID: rDnm1ynOSO2QL6Vd46iCSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="80411366"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 15:44:47 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 15:44:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 15:44:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 15:44:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0TgqH4vpKKCPN6hGuDXAPItBvOZwcCovQMeYN5f34DlghwcoNui6l56THxDyqT/Cl6jGJDGxEe8dKTyXjZ8q7/CodJICBblqBZ8K15pm/SD8fEkYm+hANNYcZO8VBT9QBhC99HkWvoAVvW+ujh1Sdyw6i8+cDYY6diy3Ocjo9o7V+gNBUV1oAENYQg+vdxkR1/AsV3F1R4HpNpu511XeNMbk70+X35omXB3jLB+HfpdMlh43lk31fF/8KEsAVAva4szEwLqiSu2D22HLrQ7J1mgIwX+UWKwua5Pbs9e00T5ps1PDu3xOo/drjOXVNvxsQiryg+d7UzeGi2/2KIs4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+shg7x0OzMlAxadv2Mo8xCM+xZ1xmtBWqsOPHqUUABA=;
 b=Mf2Kayucxzm3UP7ZDQFUBfdVwW5IsMH+bG9jB6RBLEkzL1n36MMsS29tO7A+FCL6IrzQMVR+wK0QP134MpwxDNVy7MIq4F5H5YLS/5sY3tzrkJaKc4260SEi2cgVuIL/Xlpat387WYaGlGl/49PdPY+41SZ2sAD1Z7p5euPXDMRVcS3FxZ3yIpYLC+PDYZQoE+1n1985wfaHFNkp0BOt8Mt1+CCpjXTfccU6WAu8vseSXMbQROVlqmwwp08JY8l1gnYJWfy82O5C6qqauXOlIjigthjwj5vlAt7/PnRJt9NeKMf3t5aI6MZMXruJv6mAqalM2it9het35mVRFozbwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB7661.namprd11.prod.outlook.com (2603:10b6:510:27b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Wed, 23 Oct
 2024 22:44:39 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 22:44:39 +0000
Date: Wed, 23 Oct 2024 22:44:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Separate full CTB content from guc_info
 debugfs
Message-ID: <Zxl8Q5uEf8rIAIBI@DUT025-TGLU.fm.intel.com>
References: <20241023001736.1766523-1-John.C.Harrison@Intel.com>
 <20241023001736.1766523-3-John.C.Harrison@Intel.com>
 <Zxl2Bj56VnzU4S2n@DUT025-TGLU.fm.intel.com>
 <0a1d002f-b6df-46fe-935c-3ab1504affd7@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0a1d002f-b6df-46fe-935c-3ab1504affd7@intel.com>
X-ClientProxiedBy: SJ0PR05CA0171.namprd05.prod.outlook.com
 (2603:10b6:a03:339::26) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b108ac-5ede-41a0-2faf-08dcf3b446e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cAKeDd5MndEGWuowJ33/8J5tJcjarnZf070OF+zduK2fkiR+kk2pnL4i0q5z?=
 =?us-ascii?Q?DisEfM0cL6bobixYrXmywJ+3PU1wKQsNRodbgAw5zwXe3cQ7cVjCcPPrW7l3?=
 =?us-ascii?Q?+1FsHd5wNZUtWcBCS1vYTVJxd9tCfOv3UpFEC3Wg8xZVw7Gd9nRPx6mezmf4?=
 =?us-ascii?Q?ysn5VIoe6y9fGU73/8tAtCJhaSREiulpwYNe5qxAymAWIs/X2v9AC9H3Chng?=
 =?us-ascii?Q?tbWhnU33EP8rDUupucgi8Vs0oHbRA/oL3Cb+gicqe/WXsa7tBf3ZFHbgFazb?=
 =?us-ascii?Q?zhjnf2Fcf0sumTfaX0chONhn//xLoOOnXczjbTXhOLlyzcUEtsa87D0qb3pJ?=
 =?us-ascii?Q?dJ4SCtU2ZBheKBgRKv4UO2tsh3Ke/+UcICTDVjsuIpyplPB+DmObTLVTxDhF?=
 =?us-ascii?Q?Q1zAXZ2SNwSXrlzNVPM1eepWw71v9JcgI+KYNP4fDIqIs/hAC5PGdNwBivYn?=
 =?us-ascii?Q?lrgBG88PXaDKhDj3cTngpR5tbn56ekPgEx7M+kvvz8//Xq610rgEWmhfZwbL?=
 =?us-ascii?Q?Lvc9NIYNMcHoQopiyD2a9zqBHlT3fJ9aM3KvKY+i7v4x+A+cErzMpiAZ8nfw?=
 =?us-ascii?Q?p1uItzwgQb9sUJSQODhPezfxn0UFxe4gaWhK0zeVVjzAv8VHHi5eaI16MAtA?=
 =?us-ascii?Q?JdZQ+7IqzWsGijAbz1LM52+lQRA7LCNolFhm3A/y1+nmqEFyclpx5WLIbDZp?=
 =?us-ascii?Q?CM7T+R9NpcZV2IeBxdKt0Pg0ypUx+8dDdW/STPxhGWdhpE0kL/hHot9LdNDc?=
 =?us-ascii?Q?avFluWCPB8ytfxWM0MxaJC2ysiBbAWkyOcaEu15E5yzVTVG2xNbawVhzEKKU?=
 =?us-ascii?Q?gWLr3OTusWyO52ec0XNOADOshafxadBtS740qhfQlAxMouI1Husk2WzrmIEw?=
 =?us-ascii?Q?iMuVgUYoaZLpwh4xm21oqPTinZZmW8BwKBtx1GmEYz3IjKa2+ZCfc2U4PYQt?=
 =?us-ascii?Q?/d5WADpWpyut8Uk/B3aQnd/OMpRuXQmqiu4lyqgL1IwxizYGGZunZra2MLQy?=
 =?us-ascii?Q?rqpXCNczWt3svE6vSX5FkJNHzxVIf9GBi1wa+mAfwxfqnbhfM5fgN56/ZGnz?=
 =?us-ascii?Q?BArx2/Vqwdb2ctnEXbTy+y+OpUhSuMrYQBICNdiPqz1ah6zMau8AltxeJ3TD?=
 =?us-ascii?Q?O8jrlllcQeJgumimtMzOFJGZexJgXQezC6Myl5cYtfzgmI7UUbsZsTukt+fn?=
 =?us-ascii?Q?4fjJnrJJgGXI8xFT9T1ABd0ArqsKLUZ+kB8MasYHHv1g8wtAPD5phf+jqxnI?=
 =?us-ascii?Q?v1xglh29YcLx+hbxgPOPY/crPaK6r5vVJY9vvdEIvZ/IqcSkeTfwRr0w8vzo?=
 =?us-ascii?Q?L0wHooEE6OwOboSqeR+8SLkH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UPuq4C4gCQf8OvbZNNB37fqboF+i82kUame6uxTTPuUpvWBd7MkUmHW7x1wX?=
 =?us-ascii?Q?9mtt57bfNNeC3SLLEuxxoZPx3hDXeQgqV5+xbfsFWh1mtMS9IJaL7mukBvKe?=
 =?us-ascii?Q?rvQvBNzDfui+axVTLRvkC6ppvE8jf6EApd/vNCIZUgbxIaFaEU4rS0dWiU+r?=
 =?us-ascii?Q?XBIvLWmk8Gmya7Nlvb0aGxK3xac/4cxAdqMr/Ex5oZgg7ryp6yR0fZbucEdK?=
 =?us-ascii?Q?tlfQEnRn/YFBxDtuy2FIAwQj/BwzA/QZUtnHOLE96839frlZIohNCjpS51mX?=
 =?us-ascii?Q?HGvWO2S96XCFuUA3XJaDdpAXW+qzQ/D0P+k2vWBjmpwrcCOT9O8Yxo/50XVo?=
 =?us-ascii?Q?T2Loyj6LjgKHb1BL+a0bi9sw6Ybj9hRVvIK4U31isqXXA8KsgHLnwAM7yQYG?=
 =?us-ascii?Q?yY9EgmPAKdnOngElwjPJUBoS7PI3J0p/LkKHREIiRBKLUb7Xa7llfPAtiFPj?=
 =?us-ascii?Q?xbsdFzsQ4jQH6Pc97i4xtqB8he9SW69EU1tQyA4Gtv09ARfC6odi9t0vB2I9?=
 =?us-ascii?Q?QOCXJF/2fLLfJk3/99AnguBkwfUP/oN5JCTrDJATWgKQmwaQiRnqGH3qFBH5?=
 =?us-ascii?Q?7FmFmZO+UCKkEwYSjnTKy0VwxlTq7pQC/1mJo5lPtuJ1LHeOFmbmkodZQXRv?=
 =?us-ascii?Q?jD+8h3GX7XDhCbfVOfaTxx4wHe3eK1oCwoUa357+v6FPR8MaYl3iQr4tEXET?=
 =?us-ascii?Q?XEnZoA9UsNRBtmrO42yYj5Lm/3CKll8xgpv++s7eQV+WetM6VFJmBxuAkMGQ?=
 =?us-ascii?Q?Jpaginc008dLTEYPzn/FvJfrRfy4Uaii9HhFXpP/KPM9RP/UoHda12p2AkCD?=
 =?us-ascii?Q?jZElC2eE4h/kfz6ABZ8MVsSzxSRx2gDY9clSx19S/cv8Du0sT0X8ysvKRndD?=
 =?us-ascii?Q?K6R8PJazhG1Pya9peHvoFENIVMrNkPIjnz0j8M/AeMRogwI/bBzkxEWGNJI0?=
 =?us-ascii?Q?+K+UfYA9PdzJxgueQzJogJ0gmnhxPpkCHaLtbuOCx7INx5jcH8OhkdH9P6Aw?=
 =?us-ascii?Q?PWaRj1ZFApEHKMzsunipEpTBCtotIY8fBuikShnWUJGpDReyGXspk5LW257J?=
 =?us-ascii?Q?74MGqMSnpDLxP1Vl7Fl9Y/cU1LHfD1PehJmXGNL2f/9NYX7PQE7UuLhxLRaW?=
 =?us-ascii?Q?kf+jGaxNyQyNyvz6lxr+ayT0DaXLaHzcJzwAA1nViu8JQWDiql0/fHV2e551?=
 =?us-ascii?Q?1gYP9NBVB4dMGBW0UhiXWhP4lakqfCoFDdZFShRvrhvl4lWxvHO0iRWwkcn/?=
 =?us-ascii?Q?lVRIPzQCIyZKBxphNeIUVR97OKjlEnSN2Nf0ESf7aw6ktd3h2xl/C/nrXgAz?=
 =?us-ascii?Q?Qc1vEFSdMjiMuWeGDK//zHN9TjrOP3tyapYj/e+D72Z3rGqbHe3eAgakHvWF?=
 =?us-ascii?Q?85K70kd8+O/5hAflbfvkH7Nk4jbaaCLT3JZsrHnzWdpsi05m9qom3fTePPNd?=
 =?us-ascii?Q?yqeqHXcEs2VLfpVPuCkKvCZBnqsNvWw/PSfES1y69SaO8fZekcemh8pih0ZZ?=
 =?us-ascii?Q?k54Ut1iI4RlkRko6vMTCElgmN6uvkcdDE0S+39hb4EPBWXgN9TyxC+q9W0T4?=
 =?us-ascii?Q?VjLuHU9qupCGM9dPG1SVxk1qj+LqFBeu90I0aoYl+mtRjxGoyXiLo83TwJKP?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b108ac-5ede-41a0-2faf-08dcf3b446e0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 22:44:38.9407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6tP1LQj2rO/7gveZsBHAE2kUtCcQnk3zcyoquI+sMG5xE9a3jQ+MAH1m0VAi8tsj4vbYKTbHsutaxwycmLFYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7661
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

On Wed, Oct 23, 2024 at 03:40:45PM -0700, John Harrison wrote:
> On 10/23/2024 15:17, Matthew Brost wrote:
> > On Tue, Oct 22, 2024 at 05:17:35PM -0700, John.C.Harrison@Intel.com wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > The guc_info debugfs file is meant to be a quick view of the current
> > > software state of the GuC interface. Including the full CTN contents
> > > makes the file as a whole much less human readable and is not
> > > partiular useful in the general case. So don't pollute the info dump
> > > with the full buffers. Instead, move those into a separate debugfs
> > > entry that can be read when that information is actually required.
> > > 
> > I did notice this when using the debugfs entry and yea a bunch of asic
> > isn't all that helpful in the common case. So change LGTM but one nit.
> > 
> > > Also, improve the human readability by adding a few extra blank lines
> > > to delimt the sections.
> > > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_devcoredump.c |  2 +-
> > >   drivers/gpu/drm/xe/xe_guc.c         |  5 ++++-
> > >   drivers/gpu/drm/xe/xe_guc_ct.c      | 25 ++++++++++++-------------
> > >   drivers/gpu/drm/xe/xe_guc_ct.h      |  8 +++++---
> > >   drivers/gpu/drm/xe/xe_guc_debugfs.c | 14 ++++++++++++++
> > >   5 files changed, 36 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > index 8b0ea77661b2..5d7d8192d6f3 100644
> > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > @@ -267,7 +267,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > >   	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> > >   	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
> > > -	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
> > > +	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true, true);
> > One bool, not great. Two bools, yuck. Anyway to refactor this without
> > bools all over the place?
> It seemed excessive to create a whole set of flags. But given that this is
> the only instance outside of the GuC internals, it would be simple to create
> a wrapper that hides all of the internal only params.
> 

I think that would be better.

Matt

> John.
> 
> > 
> > Matt
> > 
> > >   	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
> > >   	ss->job = xe_sched_job_snapshot_capture(job);
> > >   	ss->vm = xe_vm_snapshot_capture(q->vm);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index b065bb9973e9..fcb540003e53 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -1187,7 +1187,10 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
> > >   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > > -	xe_guc_ct_print(&guc->ct, p);
> > > +	drm_puts(p, "\n");
> > > +	xe_guc_ct_print(&guc->ct, p, false);
> > > +
> > > +	drm_puts(p, "\n");
> > >   	xe_guc_submit_print(guc, p);
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index c260d8840990..352673b6974a 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -1607,7 +1607,8 @@ static void g2h_worker_func(struct work_struct *w)
> > >   	receive_g2h(ct);
> > >   }
> > > -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic)
> > > +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
> > > +						    bool want_ctb)
> > >   {
> > >   	struct xe_guc_ct_snapshot *snapshot;
> > > @@ -1615,7 +1616,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool a
> > >   	if (!snapshot)
> > >   		return NULL;
> > > -	if (ct->bo) {
> > > +	if (ct->bo && want_ctb) {
> > >   		snapshot->ctb_size = ct->bo->size;
> > >   		snapshot->ctb = kmalloc(snapshot->ctb_size, atomic ? GFP_ATOMIC : GFP_KERNEL);
> > >   	}
> > > @@ -1650,6 +1651,7 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
> > >    * @ct: GuC CT object.
> > >    * @atomic: Boolean to indicate if this is called from atomic context like
> > >    * reset or CTB handler or from some regular path like debugfs.
> > > + * @want_ctb: Should the full CTB content be captured (vs just the headers)
> > >    *
> > >    * This can be printed out in a later stage like during dev_coredump
> > >    * analysis.
> > > @@ -1658,12 +1660,12 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
> > >    * by using `xe_guc_ct_snapshot_free`.
> > >    */
> > >   struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> > > -						      bool atomic)
> > > +						      bool atomic, bool want_ctb)
> > >   {
> > >   	struct xe_device *xe = ct_to_xe(ct);
> > >   	struct xe_guc_ct_snapshot *snapshot;
> > > -	snapshot = xe_guc_ct_snapshot_alloc(ct, atomic);
> > > +	snapshot = xe_guc_ct_snapshot_alloc(ct, atomic, want_ctb);
> > >   	if (!snapshot) {
> > >   		xe_gt_err(ct_to_gt(ct), "Skipping CTB snapshot entirely.\n");
> > >   		return NULL;
> > > @@ -1704,12 +1706,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> > >   		drm_printf(p, "\tg2h outstanding: %d\n",
> > >   			   snapshot->g2h_outstanding);
> > > -		if (snapshot->ctb) {
> > > +		if (snapshot->ctb)
> > >   			xe_print_blob_ascii85(p, "CTB data", snapshot->ctb, 0, snapshot->ctb_size);
> > > -		} else {
> > > -			drm_printf(p, "CTB snapshot missing!\n");
> > > -			return;
> > > -		}
> > >   	} else {
> > >   		drm_puts(p, "CT disabled\n");
> > >   	}
> > > @@ -1736,13 +1734,14 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
> > >    * @ct: GuC CT.
> > >    * @p: drm_printer where it will be printed out.
> > >    *
> > > - * This function quickly capture a snapshot and immediately print it out.
> > > + * This function will quickly capture a snapshot of the CT state
> > > + * and immediately print it out.
> > >    */
> > > -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
> > > +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
> > >   {
> > >   	struct xe_guc_ct_snapshot *snapshot;
> > > -	snapshot = xe_guc_ct_snapshot_capture(ct, false);
> > > +	snapshot = xe_guc_ct_snapshot_capture(ct, false, want_ctb);
> > >   	xe_guc_ct_snapshot_print(snapshot, p);
> > >   	xe_guc_ct_snapshot_free(snapshot);
> > >   }
> > > @@ -1776,7 +1775,7 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
> > >   		return;
> > >   	snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
> > > -	snapshot_ct = xe_guc_ct_snapshot_capture((ct), true);
> > > +	snapshot_ct = xe_guc_ct_snapshot_capture((ct), true, true);
> > >   	spin_lock_irqsave(&ct->dead.lock, flags);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > index 338f0b75d29f..01d3b0183bf0 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > @@ -17,11 +17,13 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
> > >   void xe_guc_ct_stop(struct xe_guc_ct *ct);
> > >   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> > > -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic);
> > > -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
> > > +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
> > > +						    bool want_ctb);
> > > +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic,
> > > +						      bool want_ctb);
> > >   void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
> > >   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
> > > -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
> > > +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
> > >   static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> > >   {
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> > > index d3822cbea273..995b306aced7 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> > > @@ -47,9 +47,23 @@ static int guc_log(struct seq_file *m, void *data)
> > >   	return 0;
> > >   }
> > > +static int guc_ctb(struct seq_file *m, void *data)
> > > +{
> > > +	struct xe_guc *guc = node_to_guc(m->private);
> > > +	struct xe_device *xe = guc_to_xe(guc);
> > > +	struct drm_printer p = drm_seq_file_printer(m);
> > > +
> > > +	xe_pm_runtime_get(xe);
> > > +	xe_guc_ct_print(&guc->ct, &p, true);
> > > +	xe_pm_runtime_put(xe);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   static const struct drm_info_list debugfs_list[] = {
> > >   	{"guc_info", guc_info, 0},
> > >   	{"guc_log", guc_log, 0},
> > > +	{"guc_ctb", guc_ctb, 0},
> > >   };
> > >   void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
> > > -- 
> > > 2.47.0
> > > 
> 
