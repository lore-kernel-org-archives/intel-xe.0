Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44128C71130
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 05:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0911410E582;
	Tue,  8 Jul 2025 05:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZZ3cP/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB56B10E582
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 05:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751951044; x=1783487044;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gm3JN8NuKBZ6PECIJcIATNJv0v9ZjDL+W32vljdHRTw=;
 b=RZZ3cP/sniNY9MesJeleORGCAUlKKIuMUwxFIIf/McIMbvWKi21aiU+2
 71uO+CRRrsYW0bn1l++mVYCHl2v1onkBBR7z0JoHFVdfaQFDQjGL2atmG
 a6dPkAwD7um9PiZs+fzkUkSPFG6zrE5jeLJsSnd6/7T5XPxM8ssXYX3Wq
 Tq7SbPC5Rmsk3p+grRBracbBpshr63X8v+j2euNEvWTlpay9HXt2Dcn4M
 ZheNq/pdGmhtv4b/Ey6dweYSwCSgAUIyF54XHzdXoa6spj1EG0ed1dULs
 Qc3Pi2qJR0mMZCq4iKyIGBB4yYIN6K0RRH8RnTNfZR+hWnwKrWa4mR46i Q==;
X-CSE-ConnectionGUID: orqVYH3HR6CsSGKncKB1zg==
X-CSE-MsgGUID: MONyDi8GSg+YshAw4yuReg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64427115"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="64427115"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 22:04:04 -0700
X-CSE-ConnectionGUID: nNQrwxk2QxyJHZD71C2YAw==
X-CSE-MsgGUID: 4vT8tpe5SIOUgMXjQ1Gtyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="155135549"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 22:04:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 22:04:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 22:04:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 22:04:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1sTEfDUBR3fi2nWWm23OTMsWNvDBaAYj1VmM+6w1AsyIynDHxMcnTq777+b7+7lIZUe93lVuc+/GS2gsqEOyUJ+GCmI4mu2awO9phi6r2Sif0dvByU14t7nUpk8bH+mZof9i8nFhf4C8Lq4Cr/v1xrlft23hQliho5rFbXaeA+sceS9WoKN6IFzKj+V/oorAhoBZiLqoQcA8SDSum4uax083ONCkHcQWWnexdUAozpYPNOjpYLwXLc1arNhoRopQyQWGLX5qTPffaJ8NUcpsJqbipIaHohDH0ubFid2guE0niR00tzPfOmjQ7XsX3FazMUAe4Ijkhu98GdsPW9JWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+1h2NZrlxc5yvPKCrHg2ESsgbUA2Wb9NI89u2DbY4o=;
 b=e3EzC3EXKAhWR9UbTFnMA8bXnQUipYJTt1flohhvxEDEz+V3zMHbStRXX/acvbGxhfWsniPkDDz9vYofgB9anvyuk/LLzwU8K6vDs7rTB+8aZAGg/qFoAaKbm0w5nFMHMhNfqwPQUpV577p6fRV7K7DVSzJ2XYIMKq2u7JhptdwyorXmp134g+YB/xgQeBheMtPQec20JOMIzZ54FRklpUNX/QsyrmC/AdIcMMABLtYBdVs7nSeExF/3w2DLS3l4KDRFG7Xp1EVsBkdfEDh8oofpDXxYyq2yrHz/sBSiltXSshFpZjrnfNVZf6T1YJvXF3MB1ZZd7fsSYp2wkxMU7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6188.namprd11.prod.outlook.com (2603:10b6:930:24::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 05:03:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Tue, 8 Jul 2025
 05:03:45 +0000
Date: Mon, 7 Jul 2025 22:05:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 6/7] drm/xe/gt: Drop third submission for default context
Message-ID: <aGynF6DoRB0zhrRS@lstrano-desk.jf.intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-6-6aa22f174041@intel.com>
 <32e154a8-4c01-47eb-8ac9-bbdb42a3eeb5@igalia.com>
 <nxvygecgyeh43k4pru36f4v3g2qcgweh7wsz5mhphiky435dwn@hc2hw4emmzav>
 <aGylzRvFQBqCF6be@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aGylzRvFQBqCF6be@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0185.namprd04.prod.outlook.com
 (2603:10b6:303:86::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ba9186-9216-410d-9c32-08ddbddcd05b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C+hjUVVaexGjR0uWzJvP4T9c/DJcPgmmguGxwd11YREsuhu5Ny3fZkziTTA0?=
 =?us-ascii?Q?1we3Jt/7VfDEbE2wps7zrPGiRZiDp+1fHM0GvG3VmtEgGDuv0ywqD7CuK9fB?=
 =?us-ascii?Q?EarLqXylZpc4fL96tuirlzHwfRVWXajH30yYNRk/estU6+r7JmEbf/Eyc9ha?=
 =?us-ascii?Q?IHTKeymPT4Ul29+3PTe0L0AB22VEcbfrJsElqtfAiWfWTdzp277DRqTiskrU?=
 =?us-ascii?Q?kddaPnSZoM/skruy7HRlrreXFy1JH2VnTobuBpZt4J6+4BVqzTNen9Mzb7o6?=
 =?us-ascii?Q?DvObvWATUOoeougGsA9ZyAxB/nvg/SXDB8KidYna4wo4fn8o052ndoV4oJk2?=
 =?us-ascii?Q?NBroAHT5ATkbKmK7B14kUFj6pbL/j4NLJiL5SoZPxIP3aUrKvrcYwiWd+Xxb?=
 =?us-ascii?Q?YqYEZ9XB6pIZh3rPCMF8O5mYTWblGmmvwEtVbnRTIyZyBEb9H4hzjApkwbQp?=
 =?us-ascii?Q?QRZ2nzpLppfGboHFh9E2Kk9cUr/QnN8Z0GDhybPwKqdG1QevEAQsxlJR3NMd?=
 =?us-ascii?Q?GMIS5zWIaas/r04BGigXW1NKn70l4/aiuKZYt/UgqfeWpveKelJTbtuMXuCU?=
 =?us-ascii?Q?LeNFOafFEC12wTMaJewySOCEfqsLm06YoxKlydiByr70NWJsmkFKwA5haZPK?=
 =?us-ascii?Q?jwjRsSENBr6U0P1lk4sRLidVEzoqOHwnAPJK6IV+rWDuuk+smhsTEwmY3Xjs?=
 =?us-ascii?Q?3MokGcSRlU8vO8bwGWiqRWVlvmLkNqgiSzoy0Okj/GliF+++pJK/FQG9EeXY?=
 =?us-ascii?Q?KdbLoyUYR2ZE0Q6ksFLssWqDeteWWzW2SimyYldMXJJohOWv0iWDWl52Y/3v?=
 =?us-ascii?Q?BaEND9yz3PtGleI5tNZ1ViVT+j7QLze8Upq5elqZJ3ldNMXQe3B0EsQw+Rpd?=
 =?us-ascii?Q?j7MERMi9YXhHVK6d6P9kEYIYDKZ8j7uOQzEflu1GRwOsoLpAkd9G9Lkluoty?=
 =?us-ascii?Q?cM+D8F7bBYdQy/pIvrM43FESVp+2A8xiX5jkjmejSwfN0JuAX5Y0fwA1R+nc?=
 =?us-ascii?Q?YfzqXSmmvsGAmAWjQVxvSCpn4TdvS+pEmniYwX1jYSSJDD9pOhgxA3gsNDJ0?=
 =?us-ascii?Q?YicbwdntexuwFgMXgc9x7Jsuk+B+qEqAptWM8JnFUsp/6bgDeUmkkU0NR48k?=
 =?us-ascii?Q?HOWcWM2+I6vkpcvEad+8AbJFwEqsRiCyjPZAGrrquKMeUMPaPSB7lejIqcWn?=
 =?us-ascii?Q?6Ic9BmZX0tTwTaJE+voU1zGMOMXnaJvmF6qw51ns2cTrn2ABrfFcDu/t11cn?=
 =?us-ascii?Q?LgnGkcXW7TvX375ufmIQ19p/2b3ZTETQo80TeDCzf7YSF78HIG4AImZcb19A?=
 =?us-ascii?Q?5XKwpNllKnVqm7omMiFgtsKXWcLDphYLQSP1DysBZ7wAwY9jjfdcZeT3sHPe?=
 =?us-ascii?Q?QMhlSs43QhBcj6InBYCRh84NjqTPhqoClhxCwCJ9DDmkGbkWu2HEKKFjrzMK?=
 =?us-ascii?Q?dLzpfKPtTvk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dLoYtkW30He+ovTUyEKUZWDUStyZnMzzL5lZgWcWwsv4YmWMlROocQc7Di9j?=
 =?us-ascii?Q?3JhbImTIeDVJoaMhKVv9DcOS2LlR2YYFGUzyogaGzCQm31eNEHVqrmPEXDs7?=
 =?us-ascii?Q?U7NrBxAtrK5+LQvU3Fzw/rj9z7NcTdr/WVXpc10uau87FA6spkcKcnyqIeWg?=
 =?us-ascii?Q?ZTdRXfy/g0PSHUy2O+RtfiXevSCXcE5zS0qNjKiFZUtPeEoUN4WQ4Sa+/S3l?=
 =?us-ascii?Q?cE9lrUAG7FjoP0+sAuijVzYvDAxyuFm4jRjsAa8o5XkCcHjXzOjTbByG2jAM?=
 =?us-ascii?Q?WfYKnD76C2DeRetDTUARZGWr01S7c5LBDAzhM6iUkOQ8C7Y/jgKwiSf3MW/C?=
 =?us-ascii?Q?/LUTrS9yQ5Hv12DPxi6kfWVPjt1G7pFv/n+5EFg1RQhtN8EazK/McbqMp/Vt?=
 =?us-ascii?Q?5XNDkTI1Q1EtZoLbTsGsrj+QwahqhJmw/JRCGZtdbwi4nt6v+EfXYcMnCNCR?=
 =?us-ascii?Q?/4MX0Dm625vwdW8O7/kf1l4ryUuBEFZMBK7FNjqGd5oT/D498qFeLFAwtIJV?=
 =?us-ascii?Q?e3lDddy5OUm/FPJ0ruiN2vk787duryI4UtFM59QiN2Qg5X7/hrB3X9p8o8Jg?=
 =?us-ascii?Q?6UbGono5LWvGZt83ojuH7PbqDIbbO328Zdv5wjhBIHXkSuRlqeHZhWSRydf3?=
 =?us-ascii?Q?2aQeVdPe/druzchur3XkCM1lo4HrSrb2m2/CuXCO6gwjApSZzuE+JbkCrUKl?=
 =?us-ascii?Q?3GFDYnL/jpa1MIzKKPYSzXmdePf5YogLlp6eGdBDys9wooT/Unw9svnc34hd?=
 =?us-ascii?Q?Bg6S4R7AyqVA81NszkTboqykhvNBxIMUKZxR1TNGQOD0C4Yl/U6uv6Sl18nz?=
 =?us-ascii?Q?TGIcqAksaNDKj3A6TKGACPN6KQ4o8TYX779uWjDdsA9aN2Iay1hjd5SleUm7?=
 =?us-ascii?Q?DcWPqQ19d7mbkl+xsuO5ZaXoa10EkceRrE56rux0aUbxO5kUKtFHrONxKSX0?=
 =?us-ascii?Q?Tqq6FlFh+E37wza2XgR9/c9UY2te+mPmM1DnWEdJASL3mSJyPZph5fci+Tzz?=
 =?us-ascii?Q?63Vpu0KI1Ob1iPEoeWA+vxtKNsk2xJpR9baSD+Kcw1RA3KpJYUEl75mepoWL?=
 =?us-ascii?Q?gyAvky/MtCoBlhFVrXjunGiqhKh51DQ3mrTz//UguN7s+I3dQuxz+uSDbhGi?=
 =?us-ascii?Q?9bNZn5kFgpMWurXzYNy8AJCPCkbQHzEOmF95GxQcUi1Gn8eBtEqQD6iRFPT8?=
 =?us-ascii?Q?KFJgUiaxbZO5mMNlu4YB+SO1OFElpC9J4alHjQ81P739UFkonudGL+pP7EQd?=
 =?us-ascii?Q?a2EYz2+pZyKl3zPJEppP6D3/lwMRB97oMUu/HuD9GesYs8gwxrVXqzj2IHrx?=
 =?us-ascii?Q?f7g5h3jDi+/MHpEQn5JDsJyodwm7RcUq1Hgqdc10EAh4jdp+4KbbH4rI8/g4?=
 =?us-ascii?Q?X/oNg7t+u5PRlZBUfr1oqrykrT3VB3/ijGwK9W0bemkoVfw3oSJcm8f4gB+k?=
 =?us-ascii?Q?K3zzNjDyQ7CDRWpxYW1+6fWnmasSEFJtSQ984k/Z8njpTAUQ2UJeXsub7zXZ?=
 =?us-ascii?Q?utuU7bCWcMbGJX/hcdwQfFpc9mQJftHimQxZLLpKPAM3QLDBFNqXoV4R+Kv2?=
 =?us-ascii?Q?LRZoWTJ9jeGcoLnL2riBdJeUZm2TGKN0MpFFRYyKEVqdU645KAxLO03a3z8s?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ba9186-9216-410d-9c32-08ddbddcd05b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 05:03:45.1315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOhZJNrYK+NGvk/IU5vU7IKPVPatDvb+S7ykbcf66wUmZHAOCNgau+GkVVjn8e3Vk+Nv2L/rdUzMGb6efkrkMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6188
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

On Mon, Jul 07, 2025 at 09:59:57PM -0700, Matthew Brost wrote:
> On Mon, Jul 07, 2025 at 09:55:58PM -0500, Lucas De Marchi wrote:
> > On Fri, Jul 04, 2025 at 12:21:50PM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 03/07/2025 23:41, Lucas De Marchi wrote:
> > > > There's no need to submit the nop job again on the first queue. Any
> > > > state needed is already saved when the first LRC is switched out. The
> > > > comment is a little misleading regarding indirect W/A: first of all
> > > > there's still no indirect W/A enabled and secondly, even after they are,
> > > > there's no need to submit this job again for having their state
> > > > propagated: the indirect W/A will actually run on every LRC switch.
> > > > 
> > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt.c | 8 --------
> > > >  1 file changed, 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > index 67425e37c2187..439e7c703ed84 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > @@ -361,14 +361,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> > > >  			goto put_nop_q;
> > > >  		}
> > > > -		/* Reload golden LRC to record the effect of any indirect W/A */
> > > > -		err = emit_nop_job(gt, q);
> > > > -		if (err) {
> > > > -			xe_gt_err(gt, "hwe %s: emit_nop_job failed (%pe) guc_id=%u\n",
> > > > -				  hwe->name, ERR_PTR(err), q->guc->id);
> > > > -			goto put_nop_q;
> > > > -		}
> > > > -
> > > >  		xe_map_memcpy_from(xe, default_lrc,
> > > >  				   &q->lrc[0]->bo->vmap,
> > > >  				   xe_lrc_pphwsp_offset(q->lrc[0]),
> > > > 
> > > 
> > > Wasn't it also racy to memcpy from q's LRC without guaranteeing context
> > > save had completed? I don't think dma_fence_wait in emit_nop_job
> > > guarantees it. If that is so this patch should actually have Fixes:
> > > added and commit message adjusted accordingly.
> > 
> > I don't think it really fixes anything, it's just pointless to do it.
> > It would just save the same information from the first time it executed
> > even if there was a race.
> > 
> 
> Agree with Lucas, this pointless yet harmless.
> 

Forgot to include:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Matt
> 
> > Lucas De Marchi
> > 
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
