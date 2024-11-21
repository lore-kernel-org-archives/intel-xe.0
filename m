Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF37D75BB9
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 05:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A45110E068;
	Thu, 21 Nov 2024 05:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ogf59wH6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AD410E068
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 05:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732166178; x=1763702178;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qD2uIq7r6vuil/nk1Kz3lu8YzY9ZZ7bPD5smTBMrr9I=;
 b=Ogf59wH6v2LLtrtnxaebhC7xvete7BhP5P/BWu4VI1gvUpYwAb0TwNUU
 jVsNDji2InIFUS1HSda3Y0IG//ZgI6oFtyRqR6u8PwIutG+5d984dBTcG
 rCb4gx/lKt72l1Ak6aJW1FuzIdk0wU5PYSTdkeo4+aNfpX679XIsSgH1R
 nHfcqsIjF1CJ2dLz9DKs1ZUNa3sRbtzSKW4qM0eVh9ZWBhBJ6KmX0WGLS
 RrkqIbf9PrSmYuLV9oLIbhzg3NUD/O4aDFjm+3ebM2ECoKSr6phyhAwe/
 /UXHeVHz0oAQqh687+2OuSQgpqMKmJ7spyXSGA3wtULclEowIGieAwYBS A==;
X-CSE-ConnectionGUID: qtOeEx0PTkWaxPS62qVftg==
X-CSE-MsgGUID: DZ0YvEROT7qP3O7zNVs6Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32312720"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="32312720"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 21:16:17 -0800
X-CSE-ConnectionGUID: D+rOu6qxQQGK3mYH3UgpIQ==
X-CSE-MsgGUID: NuQSiNGVR9iK99lTA6TQnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="121084225"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 21:16:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 21:16:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 21:16:16 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 21:16:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xcetsuoq7SocTlR01Sw+4SDkdfyoOn9QwxEFkLxzVggrkMZ9erQGQmxkeLv1saA7S18qXAE8n/5pHviWMUxfYIXT/MT8cRX0k52wHYdbf9Vd7bRfqJ9ilpyag4Cc3LWCuTEO5YEC+mxqYJWO3aoF5fm/LJS0vBRgAkGUudVdSA6iHfJtNkBwHLnlo7PBd6yf2hOSkIwVh/kBCm062rEdwOMlhbyh8/c/xmbL1G3NL8rtuZjTY6fa+hd3Lva9bL82W8Tlf0NUDuyJjn7P6QKDNYb9dooY93+FiRvvsi1WyhNkSiXE3VT/B9EMM0Asf9lAD30WI1BCDM0kzI2sl2PN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDP29FVnq+X48gx8n+e43Zh4i4XfEUmvQjOYf4uYOWg=;
 b=Q1vcQ5qmd7YbTHlQCwk7ELDTH6OlM97Api97H1O2jz8FhXJsuo7jRp0PJXfXsI0fnOGDaVAf1uc67KnD+c9HNq4yVqsIorVfi5GgSX/TDslDhSmUFP1apMgu5E78sbOgzfiFWolPFTr4XXy1nb86+9XJXQUD18HIYDVokHEC1EPCOuqSbfLF+Y26UtW6NAzOQ58MwRwLcdonsmlngEZx4UPr51bwQK0Dt1BWpl0MvRyjP632NWRgMRkKLi+BjLiGB0xZZD8tL5NohBYw1lDOi/xMsjCrPEAQPGrKFBnRG0+D8DtzbdQAoMlPg4p4jWYp9lVua/TubO254vdXwJcpAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 05:16:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 05:16:07 +0000
Date: Wed, 20 Nov 2024 21:16:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe/oa: Disallow OA from being enabled on active
 exec_queue's
Message-ID: <Zz7CPGchRIRrYHaE@lstrano-desk.jf.intel.com>
References: <20241119013256.680030-1-ashutosh.dixit@intel.com>
 <ZzykYzGwr1GXSqoV@lstrano-desk.jf.intel.com>
 <851pz76ie6.wl-ashutosh.dixit@intel.com>
 <Zz0Mg7gL2mQT8ZPw@lstrano-desk.jf.intel.com>
 <85y11djjwy.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <85y11djjwy.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5bfb3d-5a26-4255-7925-08dd09eb9acf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y+tCpVKpkO32jxHmHyQQ5xEphCazrXbrzZ76ym4S0UeB7JvKvLJ8IIWJx+Og?=
 =?us-ascii?Q?tvWHbV1hU70Opv9g5iduDyhIwzZNGIPP81xegtwZzuOHj9B5lwBvfby0JJzy?=
 =?us-ascii?Q?otqpuRgC70byGaPqAHexm6MEL6HRZmwVgZnlNrOu2ajMGRR6z+XLLs8ybaVG?=
 =?us-ascii?Q?ggylH80xT4b2lBVi6Cyh9LR0o8MsmRWwk98NKausHqy3OIXht0nQCHwAhSDi?=
 =?us-ascii?Q?pWUrj5AkOcigWyIIDKAzL7doxWMFJUkGug3Beaz452kbhoZLn827ITy0ie9d?=
 =?us-ascii?Q?acIKfzO1qolNl0SliBwOceS0B1YKkSGXkL6dlNNzQ9/wEt0fV3SWPH98x3xc?=
 =?us-ascii?Q?sEU/JqWAFBwk8PCAMAkw3GaWxc6hVdUYOVsaMQRUlqh48zRz/CiQEYRZXRWR?=
 =?us-ascii?Q?TzEQvE6Q/Ry81PmTwOBgpPMP9koH1BdQpA3p3msX8k+9tOHF6k4myuNqxwes?=
 =?us-ascii?Q?Jqr2kWCRg/2G32J8cUQ7C6FVxFiOVVQ+urZUA9Nwjy9Vp/NSBhAd5AdsFxYC?=
 =?us-ascii?Q?Tb6AgxF3F4sDC8D5Lkyhn3M8HiJQ2JvGT0u57yM4dvr1hJ2tvbAFMXqU7WtP?=
 =?us-ascii?Q?1f8Sf08rW0AQR7pdxN6PQj92pSh9WrTpJiqSniYCv7MfD4xkAZIA8GeNpO5o?=
 =?us-ascii?Q?eCzEPM8TJS3vOBFI+CVres5lNJES16dbU24G/hUBfUv8oIhS5h+1fdTQMynK?=
 =?us-ascii?Q?zC/jlKIf0JJA4iC2xJN3tBy7jxiiLX01x2o5JB4HJmZD3p6LSpDa4f+lGgjr?=
 =?us-ascii?Q?pR/Zz849Ic5dBpgQOydyQ4ZryVvZu07o+aZeYvuEnuu/143P8LrtzF9ycfY6?=
 =?us-ascii?Q?Hiiwp0SUpfXjy9wwMpxt0cnaJHATyZ8TF6ALvtHBxYzsPc6Hy/d/Rds4xD0z?=
 =?us-ascii?Q?lXJlvopecPjbz77zJAizclvswsZtTE2JmAugF0HkuHj4AmkOSaQ3vcYlk3Ai?=
 =?us-ascii?Q?HUMVvOGUFq423w2tjAeMDx8JT20qKnJRFSwrw3pniBzyVoT7SFTFA/eXToF6?=
 =?us-ascii?Q?zrWXv5D/sB4dnc9lZ+jz2wWaLDbGeBZxXm/IPiWdM5rQLA8IZLJg8uJgSnmj?=
 =?us-ascii?Q?uilYK41OUUm4yfRVI+pUytVNF2krTTuusUEssPOrlNR5OIrKrlBE3BcI1uyI?=
 =?us-ascii?Q?BduUZuxY6kk7Bc/wHXYwU6jRGkC2qP8afrKgRYjY+gFr7YR6UQWIBjPnwn1/?=
 =?us-ascii?Q?8QCV9sxsgn1vy3ckKIqHTftIQrtVPNYFD+GOjjGOCy34ua9CpO5RZnt2N56Z?=
 =?us-ascii?Q?SfKbFYhPDqCuJarfCR+cnf6U/klp0NW3c8kYmFR89xNIG+GG3c+d86vL5kUD?=
 =?us-ascii?Q?Vo5Rx1W9o8kfGQqZ9/2hsxyF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gFc+imnVvLVSEWWcc3O0mxznbtgkPGQJ3U6Wof+9VkoZfVRQAfca1rMxMLLg?=
 =?us-ascii?Q?1ILAUwjQtQ/Itsd515d2xLqyox/asH8MGxltMfCJAdUWGOM+bjpDeT/7yftH?=
 =?us-ascii?Q?tMbpL9kRMmkYxQV94EagVIyGUUplznfDKn4JqNB4Q+TpevKLVfKPoyZR6XMS?=
 =?us-ascii?Q?GkjlyXnqcWAyzRj3Bi9+rK8Wlhg1MI+ALzXif8yU2Lu66s1DNTEcaa5eYz7K?=
 =?us-ascii?Q?E6RDH55jrwqyxm3Q1pEEY2cJFfxeJjHkpFg5C4I1jJUySuD1vaMozvjjkeul?=
 =?us-ascii?Q?NaIr7QDl1ocIqUK8Rw2uYvpPbsuuL9LYmf3M/UFZBuu4hPwWDGsFXJ/VNNA8?=
 =?us-ascii?Q?4zGdDSm8rEmOlsVaGjAL71ZuDyRyhpsdRVv5JpAiUs3W4eRPbka/tdWwHtGH?=
 =?us-ascii?Q?QtpiokYQuyBLNMz+BW/2xEOQvse/UbhdBklBPaA/HFYR618QPhgFuRLkibJO?=
 =?us-ascii?Q?EjK+rMk9Tc8tBKxSuSXwG5telWN1R0EGJfUBkXEBBNjWXPFHUEz5QIuhds7v?=
 =?us-ascii?Q?ah7SU9oMlJV13Z33geyFZqiiFBbd4CX569qj70v5+xRTmY291PFVQjni3hw4?=
 =?us-ascii?Q?mXzbYdzILR9jGl6yVd77vSYbWF8Z3VQpmQnASEePbMYEx8I4Dt7AEDtWKdWx?=
 =?us-ascii?Q?Y+u/0ZsQhtDfy0Nyb+yrITU+46Axp0o9sjw/ethwjXTxsnZXrd6duZGiQZof?=
 =?us-ascii?Q?dbfVMBwXXTID/aQI4k5bO9Azb5NMjktF2RaUCoYBumMbgLtbbXmp6DmQhigd?=
 =?us-ascii?Q?nL3TrD4MEKPxzcXfq77m2SrFBPFegY9ZnbSdev6Qn/YA4ewPHYlTzB04htLf?=
 =?us-ascii?Q?P0GbVSguvgKxLGYo55slOXqyXOgMTnE8YqBBrKmftAFSpGntuy2I9cKd949e?=
 =?us-ascii?Q?zZ5dlyM6u/C0PrUpuKRAVBDO66xVS8n1Z89ThOrNQDmuHewTGc06D3BxEaPu?=
 =?us-ascii?Q?LH14PeWzdzggDMOwQwms4PjSmIaVkEpZOx7jlREXeGUoHE0t+aAT8swMlzkp?=
 =?us-ascii?Q?2KJbCoqzg9qIAG3qj7Humr79bASF+Em1O5cWJtdGC1HG998Igb+rfRt/zRYC?=
 =?us-ascii?Q?65kCVI17+SIR1OiJIgWu4Qr+UAo8esySRJ0yiFQmW48SdnCnnSRPVEml0MX2?=
 =?us-ascii?Q?jGv84m5FRbHO8hm4z2qnoxrMKXb5lz8h3pNoO/eKcK3CQ7DJzeEgttmTjXgw?=
 =?us-ascii?Q?/pi9f9hGhrXDovQ4kWJGE6zK0+8MqTcia2u4lhrSNmRgxx9qZFJe8YwXaSfY?=
 =?us-ascii?Q?lny/1wH5rrwfQ2okxLOGhsq8QLH7KU280SYyvM04J96HsP8qoBcIY9jeJwNT?=
 =?us-ascii?Q?yr6Ls/56g232mAkWOmtOGcn1ll8Z72bXcj9UVQkN6ABOJ/NOKcG9EHCXEWY3?=
 =?us-ascii?Q?F18K565M53gdsYv4K8TzWW3ursiPaBamzp/WH3VYC+a+eKM7v8itx2j7KnQ3?=
 =?us-ascii?Q?7mUFDEf4moLqWERze8hlQBBagBGmK/ItPXtav9oQH47t5/Gq8RuCRUmhFb3m?=
 =?us-ascii?Q?M0xx9kGyQqoJBD6pY6lHRCrJasRBI707QFMOCaoPNHsPXx3o8JCcOMvOaGBR?=
 =?us-ascii?Q?p9yGZKU4gkmK8ZBkriP90R/Dih2gHEAHxU+isKajfblUOYIiq898+STy03KG?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5bfb3d-5a26-4255-7925-08dd09eb9acf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 05:16:07.7728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5c7RMb9Qb6ARLx/hcTcYZALTKdD92GJP1vU+9MkJdl5CRhmvPm6kFy3ggRNCnPuJrYuN5VKN+6MXf0xRl7TBtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6252
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

On Wed, Nov 20, 2024 at 08:22:05PM -0800, Dixit, Ashutosh wrote:
> On Tue, 19 Nov 2024 14:09:07 -0800, Matthew Brost wrote:
> >
> 
> Hi Matt,
> 
> > On Tue, Nov 19, 2024 at 01:08:49PM -0800, Dixit, Ashutosh wrote:
> > > On Tue, 19 Nov 2024 06:44:51 -0800, Matthew Brost wrote:
> > > >
> > > > On Mon, Nov 18, 2024 at 05:32:56PM -0800, Ashutosh Dixit wrote:
> > > > > Enabling OA on an exec_queue toggles the OAC_CONTEXT_ENABLE bit in
> > > > > CTXT_SR_CTL register. Toggling this bit changes the size and layout of the
> > > > > underlying HW context image. Therefore, enabling OA on an already active
> > > > > exec_queue (as currently implemented in xe) is an invalid operation and can
> > > > > cause hangs. Therefore, disallow OA from being enabled on active
> > > > > exec_queue's (here, by active we mean a context on which submissions have
> > > > > previously happened).
> > > > >
> > > >
> > > > This is something we will need to keep on eye on then because in various
> > > > experimental code I've played around enabling exec queues upon creation.
> > > > e.g., If we want to allocate a doorbell. I seem to recall Habana wanting
> > > > to enable exec queues upon creation too.
> > >
> > > The real requirement here is that HW context image should not have been
> > > loaded before OA is enabled on the exec queue. That is what happens today
> > > in the ENABLED state, correct, when user space submissions start?
> > >
> >
> > Yea, that is the current flow. If we change this to enable an exec queue
> > upon allocation we probably could check for ring head & tail == 0.
> >
> > Also note LR queues with preemption fences do toggle the enabled state
> > too. Does OA apply to those queues? If so, a registered check may be
> > better than enabled or maybe just start with ring head & tail == 0.
> 
> Yes I could do 'ring head & tail == 0' but not sure how it works, since
> ring head and tail could have wrapped round back to 0 (giving the false
> impression that exec_queue was not active when it was).
> 

Indeed wrapping is a corner...

What about ring head & tail == 0 && ctx timestamp == 0?

That seems correct and future proof.

Matt

> I am assuming you mean the ring is "0 to N" rather than "gtt_addr to
> gtt_addr + N", correct?
> 
> Thanks.
> --
> Ashutosh
> 
> > > If operations such as doorbell are only management requests to GuC (which
> > > don't cause HW context image to be loaded) and if we can name a new state
> > > when the exec queue is handed off to userspace for starting submissions, we
> > > should be able to stay with this approach.
> > >
> > > > Just curious if it was ever explored having exec queue creation
> > > > extension which enables OA? It seems like this is something we may need
> > > > at some point if our exec queue creation semantics change of course
> > > > being careful to not break existing flows.
> > >
> > > Yeah I did think of it but didn't want to change the uapi.
> > >
> >
> > Makes sense.
> >
> > > Also, a different implementation is possible which avoids this resizing of
> > > the context image altogether. It requires the kernel OA code submit its
> > > submissions on the user exec queue (and use that exec queue's VM, currently
> > > OA code uses a kernel exec queue). There are some reasons I don't want to
> > > implement that just yet, but worst case, we can do that if absolutely
> > > needed.
> > >
> > > Thanks.
> > > --
> > > Ashutosh
> > >
> > > > > Transition from 1 -> 0 for this bit was disallowed in
> > > > > '0c8650b09a36 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream
> > > > > close")'. Here we disallow the 0 -> 1 transition on active contexts.
> > > > >
> > > > > v2: Don't export exec_queue_enabled, define new xe_exec_queue_op (M Brost)
> > > > >     Directly check OAC_CONTEXT_ENABLE bit from context image (J Cavitt)
> > > > >
> > > > > Bspec: 60314
> > > > > Fixes: 2f4a730fcd2d ("drm/xe/oa: Add OAR support")
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
> > > > >  drivers/gpu/drm/xe/xe_guc_submit.c       |  1 +
> > > > >  drivers/gpu/drm/xe/xe_oa.c               | 13 +++++++++++++
> > > > >  3 files changed, 16 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > index 1158b6062a6cd..b88d617c37b33 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > @@ -184,6 +184,8 @@ struct xe_exec_queue_ops {
> > > > >	void (*resume)(struct xe_exec_queue *q);
> > > > >	/** @reset_status: check exec queue reset status */
> > > > >	bool (*reset_status)(struct xe_exec_queue *q);
> > > > > +	/** @enabled: check if exec queue is in enabled state */
> > > > > +	bool (*enabled)(struct xe_exec_queue *q);
> > > > >  };
> > > > >
> > > > >  #endif
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > index f9ecee5364d82..b9b9cdb6f768b 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > @@ -1660,6 +1660,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
> > > > >	.suspend_wait = guc_exec_queue_suspend_wait,
> > > > >	.resume = guc_exec_queue_resume,
> > > > >	.reset_status = guc_exec_queue_reset_status,
> > > > > +	.enabled = exec_queue_enabled,
> > > > >  };
> > > > >
> > > > >  static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> > > > > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > > > > index 8dd55798ab312..4a7440c40978c 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_oa.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > > > > @@ -2066,6 +2066,19 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
> > > > >		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
> > > > >			return -ENOENT;
> > > > >
> > > > > +		/*
> > > > > +		 * Disallow OA from being enabled on active exec_queue's. Enabling OA sets the
> > > > > +		 * OAC_CONTEXT_ENABLE bit in CTXT_SR_CTL register. Toggling the bit changes
> > > > > +		 * the size and layout of the underlying HW context image and can cause hangs.
> > > > > +		 */
> > > > > +		if (XE_IOCTL_DBG(oa->xe,
> > > > > +				 !(xe_lrc_read_ctx_reg(param.exec_q->lrc[0],
> > > > > +				       CTX_CONTEXT_CONTROL) & CTX_CTRL_OAC_CONTEXT_ENABLE) &&
> > > > > +				 param.exec_q->ops->enabled(param.exec_q))) {
> > > > > +			ret = -EADDRINUSE;
> > > > > +			goto err_exec_q;
> > > > > +		}
> > > > > +
> > > > >		if (param.exec_q->width > 1)
> > > > >			drm_dbg(&oa->xe->drm, "exec_q->width > 1, programming only exec_q->lrc[0]\n");
> > > > >	}
> > > > > --
> > > > > 2.41.0
> > > > >
