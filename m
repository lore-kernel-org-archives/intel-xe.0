Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ADFC61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 20:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCA510E33D;
	Wed, 26 Aug 2026 20:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMtE5iU6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D3F10E33D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 20:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787775846; x=1819311846;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3Yxy0f7i0ZOh+F8jc+LlIXVuvRxZchLOag6v8om3RYk=;
 b=kMtE5iU6v3pKZlktuPvZ5goPisRkm2lkGunuJPdYCFgRJ+rEDuLsPmNO
 iJ0HB5df4CYP0Ls9HD5XUF6kp8zq2GJO3h9cjAageei5XSbEvfsVbz8wl
 Uik5c7traHa8g1l9QmJy53EdejULo7dQWblMiL9pqF08o/NasCF9SpOS+
 bVnHxVwqOviBMJRANQeuCCEVnZSMiwv0K7kbXQ7V+C5RN82L/splVP38p
 IlIDUQSyoA3iLtPtr+ld8adws/vBq7or5FSak3g3+mZiaQr2kwQI2rTwX
 PxPaTsmlTUn3pEWDnc+VMuJhWBKpom8TwocTQu/4VTNAUu9Im+lIPceRc A==;
X-CSE-ConnectionGUID: ESU7xj9yQgqEcQMC8BVmzg==
X-CSE-MsgGUID: Bos36EAKQcSn2jHhg04wRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="113801290"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="113801290"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:24:06 -0700
X-CSE-ConnectionGUID: QmTu/wy2Qj23F0JP+NpVww==
X-CSE-MsgGUID: DmiQHgKRTx2Kk+sBL35AVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="263906828"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:24:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 13:24:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 13:24:05 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 13:24:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7/Fbrj121DWduFq/VXcwJu2+vtCdQruD6BRaMFFgDYa+Hez8UfxY1d5XnmU/rrUUxGUbv+qrPcFWDivRv6vXqgeoT5z+ALOJkMam8qUlx+Bddbp2rw4h/FffGnfMN16GtL+gIh7566zRDc8qO48VecJTS9U/iz655WzesLjc5Utlldn8Liv1LNUMtBrUrGaaQVWecl1rGgyya4yHE2SUxW2RqwwEDGGSXTVRaAnqMG+7wOHFkJXM48PqY0L6Y2fvxfEqXUG0DqZtfenGsqHIZ9aIa55T0CfNzBwpMLbLHT7vfGVhrhLAdaIYld731ggv/BrQbl9oFQWwV56lY7ZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDzwT4umj3XWTm9MHCnESXxqeRC+7sZ3chzLtR5kqo0=;
 b=ZgsYIgHz+sVEaoG/p/UnuuD/Tefiiq7j7NOWl3NcEWbg14QhBfSyl1WB/up4fylpR/JCAjbnc/8rj6aPHnYjGY4laiZriPj6h96ARJxmQcNKr6tbZat+FJFGWVZZG8VPev/MOHsBegMFo4BO3sw8DtFZBvxJZ8RaIp37ifBaY1YjHrXea0i8taZsd8IE3zWob1os4GYmUl4qMhOIZkEijRmRCMmqt3OjUoe8Gnm18qTaQIweVI99VzgOgweOh+a24iZ5RUOmdtkFhWIAWzQMLhPWISHclykVMdu8k9pJEMsbj5jOyhf6daZ47kHnL3BKHfq/hkkDUgLSmymsI5XVHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6917.namprd11.prod.outlook.com (2603:10b6:806:2bd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 20:24:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 20:24:00 +0000
Date: Wed, 26 Aug 2026 13:23:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <tilak.tirumalesh.tangudu@intel.com>,
 <niranjana.vishwanathapura@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/ggtt: fault on unmapped GGTT for multi-queue
 platforms
Message-ID: <ao9LXSeD1awMkzdD@gsse-cloud1.jf.intel.com>
References: <20260826112533.3289978-1-tilak.tirumalesh.tangudu@intel.com>
 <20260826112533.3289978-2-tilak.tirumalesh.tangudu@intel.com>
 <20260826201034.GL681121@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260826201034.GL681121@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0048.namprd04.prod.outlook.com
 (2603:10b6:303:6a::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: ef346da7-fb12-4549-2dc6-08df03aff6a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|11063799006|4143699003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: ExkOc/THa3/YjUjnmUBTP9GzoSv4ycGVQniTEJvtWU23WZqnE02LcLfkkOHbdA5enS/CbzC1pjNeWuVY/pF3CoI/AlxW8GAjDRHJHyH+D1Mn9Ku7L9lOwlfevZjawPScMqrcnki+tJCisW63G/38fK8O8UvRqFcUlI+nCTBU1zJT8GXVV4EGjs/66IEJ6xzK4DJHcD72kOmD52cJm9JfX6QuJuFeWGbUfGXz/Nfk8xP8SeyKZBgWHkV/7T+LpeOoLNH1gCpzfBvj7vIXjeWtOQyKmltiAlXWng3Kh7jy4mmbp7oNX3s0RuxhikP8UWNrdTtffw7gJvLr547G9u5cWxmRN8G+HursHYJewPUB9dNVzBahDwwNwBWeMfKDh3VroJOLERC7UlXkIxRbjmhnqLu0YP46g6nNL/yfSbu3MrAEOvZj+VawRdwtzplLkeL3cpT/H1KrkLki/szPWRhxT3N4QYvH0FTeCaIHZyS2iKZML2zt2udqFjqi3h6Lu1nqIEzezlmTd78tdP+MUGSj9M0n2UrgwSw62XHmbVjBKC7o6Gvg3TWLu42uLeyqmjiuE95RE3kvLWBDgZyeOzQ9ndTUfr8CUURsIEzR9sJFX9/kCBGnziw0Hl7aSCbvxK8T2fmLq2hcccPyfv1ISiIFHLPhgyAxAvl9tgB4p82B9EA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WJW0kWw7ICA2j1QQMUIfbFyhkjoDei6EkRZa//YToGt0rbFB4ETVt5zFUy/e?=
 =?us-ascii?Q?PjJtN56abDse/fOA6qKWO8xAHZ1nrL6yuYkQ2YGpjv2v0F1hXpHr35kqbql2?=
 =?us-ascii?Q?ca/XcVDWbikWNsqD3/VjasdYoTUYBJbi931LgBiFUknMoh59beMz4QMDMYes?=
 =?us-ascii?Q?71i7V1BAGVSPgjd+39ugrDKp2ECoYOKyhQX0/vTVitTPZ5/ddtTYOQptQnAH?=
 =?us-ascii?Q?PEZUFC+eKFxJez/qIHvH2oS6y0r+VczUnOyHvJXezdNral/ee4rjjGWC+GzE?=
 =?us-ascii?Q?frao4Sd1jEbhTLyjRM+smCkfsxtigNBcah4wEaBVybtdZBvNdQr4Vu2JXGdg?=
 =?us-ascii?Q?81JpI1eTxwbh4lXVNDgC+GzKQqPDB27BPKRDNGq1JBQw31Yvlg4L0yaAKzVV?=
 =?us-ascii?Q?VEJrkRBxKit/0EkH0qcYJfjEyIP53VhKOoeHc4+WUuiQWlZalw5ituDe1Vit?=
 =?us-ascii?Q?tz0/8nzR0U2n1C5Y1pBBWPmhOzcNYE2Mf3Gn7ExovIzeTlkuUBNwNahgya84?=
 =?us-ascii?Q?6Qrgt74phnCGtL4rlgmBaf7+BBANpirowORrksSq0ZTCA1HfRhdueiWaNixr?=
 =?us-ascii?Q?PszoyQ4db0qnYBMJOg0IEVbMgyR64SNgs/5pFKze7kWtRrEMIzRe3TLm8ySA?=
 =?us-ascii?Q?+ClnRYk+/k97/RGcDL9H6ldqu7eqOlR6jHZIOrAdf7/mA/1obRud4kxadeGJ?=
 =?us-ascii?Q?0G516sybIguG90Zd0jSYsVyYHePAOtHvvnCSiqZhGaJq5LMUkv9C9N4wP1d8?=
 =?us-ascii?Q?2hyOW9j179HDG1Pd1UUmddDTPIdGf7MIFQAxn92ktEuVg2jenaDCCaNRgrr9?=
 =?us-ascii?Q?ptPh6x2I/+34vMv5S2LOBmQoOUpv/t4Zr/bxipsMLrrDeP/emVIluGjtxchN?=
 =?us-ascii?Q?v5Un8vFZoCIC2k9fcCPf/PmihlrjQ7609tZifwYPfo8UVxHVwPwazsgcvOyG?=
 =?us-ascii?Q?HZwE1rSd7IswbWZa4HxNclSSXzmJa2jKxvqMV0bbeGxqB11hiOF5+X9swc5E?=
 =?us-ascii?Q?l28B0PFb2U4jjtZ3R66cVgOahs5wb3vuV1v41rdbcbNr96BUu7FguN4zwnv+?=
 =?us-ascii?Q?y7JMN2F0A+4c5tRO0e+WNrgK39b0yt4A/oE4Ad9hAW/fjZEX5b0j5CHb0Q/t?=
 =?us-ascii?Q?19naZ0ljl+GxOZIiPnySN4WhgMiSszcGAJWZkq3o3fGXPLcKx7SQ9IDy11r6?=
 =?us-ascii?Q?va2fleuQtxwwN/g9LuVnMwpZzJubPA9aXfnK+rIyt2AeSKXCBr5suhPTtE7Z?=
 =?us-ascii?Q?FD7HTJSwMm2mnxZlSI9PbxZxWCz1AvrM6XpIRHW2SwktcXJhlVa+DvZIzTm7?=
 =?us-ascii?Q?bHl76iV1Cp8hywDOGxaIG0xU2nlNF+aqSizpK7MepcylvAi6Ndi+t3wSvcXL?=
 =?us-ascii?Q?VJtGiszTTIwYlEveXkHQTK0ClbMhPbnnbBKL0M2IDNJWvfCY7MqJGDyV66n3?=
 =?us-ascii?Q?KFTSrm3dZDw72N5k1Lk0tKrP4oaJZx9cLbA/hmEvGqMWqAftKfNFGRptEgZQ?=
 =?us-ascii?Q?Whrybx3pcb9pwEtCkyRBEAoEf7MkJDzh15S8IHo5uGp5N/wpO8F0l44UVvra?=
 =?us-ascii?Q?tNqTJ6AEW8v5yamskE5ode1dYwTCvbP4C72222zAcHkXa5UYehbW8kr3Yq8T?=
 =?us-ascii?Q?SMXvChdm8GZ31G79LgCVnx3THYkcufvPhdXG55/HrJsThBB0QRam2frKD+1y?=
 =?us-ascii?Q?fOULlwwPAKdwATXC69U1jqitkiym1fcA9A4j0z+6/h757yyCK7w+nHzVFZaf?=
 =?us-ascii?Q?7MqEceUBPmjeap51hRP0gDJf/qN7quE=3D?=
X-Exchange-RoutingPolicyChecked: mjm12qxP87F2OQh1RTGOqo1vhoe0/38EsyWd3cp9KgkdNa77OCzsLEuZW7fNaMCetB6Xa1eSsstkVFnnUpqQnL4mGVu4R+EqzUMEM2e4vl1nMpIkO0FhpxOHEXetDUIJF3tCRz2Y7g0DBRoQ+Q3XrVmLUHr7U22obPbs1GLHF1zyDCxRJakWBEHShnUjkaHvaJRl4MZEjd5s737ffnPJwe/+n/3+7rncLvABElXSZ26j6GLQzp7RYMlu6iyDLBHZ8VQsR1uTy/ORg5+itBKUEA/c378IBQKcDWtIYIuTfJ26x9PTGx2BpfLFziJjwhvVmptT7zo8UPMSZP1CO3a61w==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef346da7-fb12-4549-2dc6-08df03aff6a6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 20:24:00.4068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+YJAwNlthS0NgEcoo5skEfcyH5r/fYlad41TrPDpE8A5bcaWnpU0vX1MrwHXDLT6tg864sozPPx4HoBDH1crQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6917
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

On Wed, Aug 26, 2026 at 01:10:34PM -0700, Matt Roper wrote:
> On Wed, Aug 26, 2026 at 04:55:31PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
> > From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> > 
> > On multi-queue platforms an engine can retain a stale GGTT TLB entry
> > for a range that has since been unmapped and recycled. When unmapped
> > GGTT entries resolve to the scratch page, such a stale access lands on
> > scratch silently instead of faulting, masking the error.
> 
> Drive-by question; I haven't reviewed the changes in depth.  How does
> multi-queue relate to GGTT here?  Multi-queue submission is something

The ring buffer is GGTT mapped (?), multi-q doesn't context switch like
normal q, if we missed TLB invalidations we get slient errors as scratch
could be prefetched into the TLBs - this is my *guess*. More below.

> userspace can do, but those userspace submissions can't access the GGTT,
> only the PPGTT.  GGTT accesses would only come from privileged
> instructions that the KMD inserts into the ring and I don't think those
> are ever multi-queue.  Am I overlooking something?  It seems like GGTT
> and multi-queue should be orthogonal.
> 

Also my question from the last rev has yet to be answered:

I'm a little confused about the rationale here. Can you elaborate on why
this is being done?

I'm inferring this is done to detect missing TLB invalidations but this
is not stated anywhere - i.e., a reader of the code can't lookat the at
the git log or comments in the code to figure why multi-q doesn't use
scratch and everyone else does. Likewise the commit message should or
code comment should answer Matt's R question as well.

Matt

> 
> Matt
> 
> > 
> > On multi-queue platforms, skip allocating the GGTT scratch page so
> > cleared and unmapped ranges hold PTE=0. The whole GGTT then
> > consistently faults on unmapped access for the entire boot; other
> > platforms keep the scratch page and are unaffected.
> > 
> > v2:
> > - Add xe_gt_has_multi_queue() helper and address nits (Niranjana)
> > v3:
> > - Drop scratch entirely instead of toggling per-unmap (Matt Brost)
> > 
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ggtt.c | 39 ++++++++++++++++++++++--------------
> >  drivers/gpu/drm/xe/xe_gt.h   | 13 ++++++++++++
> >  2 files changed, 37 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index 8ec23862477f..bd65100283e3 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -20,6 +20,7 @@
> >  #include "regs/xe_regs.h"
> >  #include "xe_assert.h"
> >  #include "xe_bo.h"
> > +#include "xe_gt.h"
> >  #include "xe_gt_printk.h"
> >  #include "xe_gt_types.h"
> >  #include "xe_map.h"
> > @@ -533,27 +534,35 @@ void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
> >  int xe_ggtt_init(struct xe_ggtt *ggtt)
> >  {
> >  	struct xe_device *xe = tile_to_xe(ggtt->tile);
> > -	unsigned int flags;
> >  	int err;
> >  
> >  	/*
> > -	 * So we don't need to worry about 64K GGTT layout when dealing with
> > -	 * scratch entries, rather keep the scratch page in system memory on
> > -	 * platforms where 64K pages are needed for VRAM.
> > +	 * Multi-queue platforms leave unmapped GGTT faulting (no scratch) so a
> > +	 * stale engine TLB entry can't silently resolve to the scratch page.
> >  	 */
> > -	flags = 0;
> > -	if (ggtt->flags & XE_GGTT_FLAGS_64K)
> > -		flags |= XE_BO_FLAG_SYSTEM;
> > -	else
> > -		flags |= XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
> > +	if (!xe_gt_has_multi_queue(ggtt->tile->primary_gt)) {
> > +		unsigned int flags = 0;
> > +
> > +		/*
> > +		 * So we don't need to worry about 64K GGTT layout when dealing
> > +		 * with scratch entries, rather keep the scratch page in system
> > +		 * memory on platforms where 64K pages are needed for VRAM.
> > +		 */
> > +		if (ggtt->flags & XE_GGTT_FLAGS_64K)
> > +			flags |= XE_BO_FLAG_SYSTEM;
> > +		else
> > +			flags |= XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
> >  
> > -	ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile, XE_PAGE_SIZE, flags);
> > -	if (IS_ERR(ggtt->scratch)) {
> > -		err = PTR_ERR(ggtt->scratch);
> > -		goto err;
> > -	}
> > +		ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile,
> > +							     XE_PAGE_SIZE, flags);
> > +		if (IS_ERR(ggtt->scratch)) {
> > +			err = PTR_ERR(ggtt->scratch);
> > +			goto err;
> > +		}
> >  
> > -	xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0, xe_bo_size(ggtt->scratch));
> > +		xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0,
> > +			      xe_bo_size(ggtt->scratch));
> > +	}
> >  
> >  	xe_ggtt_initial_clear(ggtt);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 65a4655b0994..92d934d50244 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -160,4 +160,17 @@ static inline bool xe_gt_supports_multi_queue(const struct xe_gt *gt,
> >  	return gt->info.multi_queue_engine_class_mask & BIT(class);
> >  }
> >  
> > +/**
> > + * xe_gt_has_multi_queue() - Check if gt supports multi-queue on
> > + * any engine class.
> > + *
> > + * @gt: the GT object (may be NULL)
> > + *
> > + * Return: true if any engine class on @gt supports multi queue, else false
> > + */
> > +static inline bool xe_gt_has_multi_queue(const struct xe_gt *gt)
> > +{
> > +	return gt && gt->info.multi_queue_engine_class_mask;
> > +}
> > +
> >  #endif
> > -- 
> > 2.46.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
