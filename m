Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3C6C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 19:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E0510E4E5;
	Tue, 20 Aug 2024 19:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ne/lzsop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9215110E4E5
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 19:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724181879; x=1755717879;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FpkTHvhflkKbjWN6LnXjWjLX44eLaHWCCHeRGkJnTGk=;
 b=Ne/lzsopEbUAog3wB+wYe6A+bOpHD7qgmbEYWO3aG24IEsz5mrY31+Pj
 Dd6mjEym8LX3JQXZolHd3yss0CFTFk682+9BXysXEb6Wo5ZhecWm+EL/g
 a7V8Y2PgIcibhkM+ry7iv2sraWUIwLHwTuE8bzX7ZhZX6XrJBeuh5MgCR
 0d3x9iwkwWqeP6odrXdfpR3oUR1TUgU3dMJTNP44Sal+BK4FJRX9mqi2x
 n8hL3ShFs78mGq7sBQXwohvJmB75gSc+etz90lJkZPQGWQsZkA9cveFAa
 F5tIkPV1tU0b4105VYswAgiyJDp13QNvUJdJVQW1dw34Ua46U0JYBH3mQ A==;
X-CSE-ConnectionGUID: 3ymDIscORhWnxOG2nGPzvg==
X-CSE-MsgGUID: HUPQXE1dRzG9PNOVBOVKOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22673726"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22673726"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 12:24:39 -0700
X-CSE-ConnectionGUID: s5vdRF12TbumzQgpz8B4tQ==
X-CSE-MsgGUID: f329S4LIROmlou1OrQ1jeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="91611917"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 12:24:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 12:24:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 12:24:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 12:24:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grdUhq2E31s4A/EzWgf4VxHpvubsZWFWp/wFOC3lJyHASNtYdqwF69Q0DPwvFG44DXKqXHi8NEc/+I6ZAIp5uiJwPEMzN3JnL3/zA3E1NpS0RF58XTyHht57HJ0VVoBZgV1wPu6hd0obv3GW9iDK62EKk7Tx3DjMXeU0rhrHYa5lSqirh387Emp/iGEjy8ImfBzUF5feZLgFfL08/Bslhvfv95prFr8F70ohkpjKi4+5vZEPyJ4hGCOThwy1f0scsJ2QOAhSIvirR2s0+6c1oom45UnD+8lGtHET2Ep67ah1Y/5PknaU36+N4C7B0ZNyi6sYzABPeAik8/PrZnQ5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0NH2KAK7l2CYGAJxQy8EI8AAoqHOfOXmrlf424EQas=;
 b=GayrngJiETqVyCqTeJccq27fAwnp9mJre2rW/UkvSOIQTd5roN1/sNJ4wzGrhPztlIsEYtxnoAVElL8Lk0OPZgawrgTpzOnbUSRAPUP4DWpDs8yTL0hfESJupyYmayDp+lGXvobRq3sQ2zUAaI76Z+hZJNlqMRqsWJ2U80c4qIFF+gRx/q+XiXbocn2kQyE0Q5X5tStL8wPTFLoLzA/FEMcfrQuYS0I4+5rbeOWXuXt+4+yCQ3PoyHefUS47PollB5B0PO7U4eHC8+LgMbVOvGS/xJD2kxWLbaoYCat9E7IN5YPbkx2RkmcHJyGDY5GD0ol+SSmEvKaFTxVJGBI2qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6322.namprd11.prod.outlook.com (2603:10b6:208:38a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 19:24:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Tue, 20 Aug 2024
 19:24:33 +0000
Date: Tue, 20 Aug 2024 19:23:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 4/7] drm/xe/oa: Signal output fences
Message-ID: <ZsTtIUxkOuPxNlMe@DUT025-TGLU.fm.intel.com>
References: <20240820005808.1412649-1-ashutosh.dixit@intel.com>
 <20240820005808.1412649-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240820005808.1412649-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d4ea9e-f898-4049-53e6-08dcc14db89c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/pmBSWcSeBFIpVUfymYcsqosyT3a4iLwEFqpYqrLXBziAFmLcOlnlG5hvEkT?=
 =?us-ascii?Q?P21c3nXrdybyTKLCeg/GHUYgHhj3IKdB7iVdGr5uoVq88hcjRyeLfpsgr49x?=
 =?us-ascii?Q?4mE5W2Um0uwhuZGRNz0epPRUD3bmnQJce6SrBdLS4tV3tyydEo76S35Pid0c?=
 =?us-ascii?Q?xU7OSZY6bEgLSvzwqU5Uv0ddaPPa4YQVmsfic9XEzU9KJbWhhcwz2mz4IWeK?=
 =?us-ascii?Q?dZ7cNA/rhGqr4t17WOuCEgtMhdmeQXWgMGcAEBBL89SOvw0IDG7KRR2tqv50?=
 =?us-ascii?Q?L5sgFpbBXp6Vunn/n3sRIktzJcjdSCsbn+7kAdhc0o0sCPN3ZbgIFlj01MRq?=
 =?us-ascii?Q?8JEMWZna5Uh0u0idW+I8keUFAJ1wOGd1L60SgFLNgzgiyGuuYgDRGPW3R3CU?=
 =?us-ascii?Q?gXaKt9tUUdXbnKgVJYp8A9/90tDO1apJoodFJUvGPuaiJDXioJblPHAPzFwu?=
 =?us-ascii?Q?OSQse5jMUC/RUFP4TPTFBKUKKixXUmNQoDFCWxFGI8ldJepdY18zRhkFh0SR?=
 =?us-ascii?Q?wSi/wbZSEnhdKzJPy03ZUPcVh86RAX66tpB+4g8fRNnaqCVRUBiBOHxPb7Ms?=
 =?us-ascii?Q?0BD2GUNnm3g6seA2oA1W13BvSnIEgy/oglfPRdmLQrhjDAnutiExP8AI0rx9?=
 =?us-ascii?Q?LpnX69ayAchqYizsSrSx2WR7r79ELzLKANjEVa7K3laGXujXu5x6Q4tm7krv?=
 =?us-ascii?Q?RKGRsbn7B9QCQZ7JuURQys/5FnA3PuON646G7fv64tBXjf1NOk1rG399aVGC?=
 =?us-ascii?Q?csGZwtDI/6lcuGW0I3IPDdHmUDTKve6KCYddbkUuzxEjnKA+cbdFHCo1vKZo?=
 =?us-ascii?Q?AHAcPiwwiRLGH4UrPhgpXjucdPXr/BzTIk4ezkMTRe6EIi7xhHgSXZEaN7kN?=
 =?us-ascii?Q?1MPoMW1vjgqUiPvDilV5r/j/eJBGb9ukh+hAv3aiPi7lthjiihXkOMVu5IKh?=
 =?us-ascii?Q?1ZchyH6jZdeGZBdvIOtp1zdtHgRg8SSZ9JZ95tTQn8YgiCWDox8wAJ7ae3d+?=
 =?us-ascii?Q?mRf6DeHqPSY69j/UklcPcb1eWZX4PqVOVE90+EHeplb/4/D5sYHJJzmjY2ur?=
 =?us-ascii?Q?5MhrtfSzHziz0EOubjHcGZBenVZ6ED26TAqJvBRjbjudadc+aI/boZBUeMPt?=
 =?us-ascii?Q?PNK9cwn/6TbfEbA2T4xbAMtj7wf+otpWy6qpu60Z3szWgegX3z5jq2l3bFKQ?=
 =?us-ascii?Q?lHDMEqcZ0YmFcJcOgpaIeq6ZILKLRblp8SlJLJuyiNPam8aWNWowUvEn36Vo?=
 =?us-ascii?Q?hSlRNwh4u7OsOhb7toAhbULBfq4sJVbHuL7H0fM0jwev08RCeRtsr5CAxAws?=
 =?us-ascii?Q?KrOQR6QYs5yakCOtZ6JTwdpUZJAgu7MSFcqxYXvpI86UOQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EccT+JnEU/3UeHf+7uVcqwAaXTlmhdxD2EMWqmXQtNSLUlux2oB7NXYTRSCW?=
 =?us-ascii?Q?/YAYdGT7eiWr+GaUwFYWZZ6jTyrfAmy3okzK7zTSR50bQ9pOFxfKk73MufjE?=
 =?us-ascii?Q?i9zbHLb3z+Jt0mENBUUSORZN1rEPMj5M+A1RGEVhSyIl78I4UK4rp08fm44/?=
 =?us-ascii?Q?H/NMDY7Sgkvvfm+JUDzn+rdxLxuvo3CZpepP41u1dAvmUmcCnUA41GzTaDlw?=
 =?us-ascii?Q?79olf0B9j2UTm7Z8VyR6v4QT5PSxr3iLsb68aG5mIXkVodsGfX8Y+Lq8zZFG?=
 =?us-ascii?Q?lHPvmu2JdQ+Ov4VNdclQVtwtIAXtv2ggTVIaRm8t0vgU/O9Z8P0ySWyMH0eI?=
 =?us-ascii?Q?mWqg3bPOz7jksgDSEzS23blhZP5X/XG4+ohUXpp3V85+vt2dDHW+e4OThm2s?=
 =?us-ascii?Q?fwENHxAJjhSqAcIXYgVMcNnOM4rx7TKVYb0ji43zObGqNgeQkuAmSDgquvog?=
 =?us-ascii?Q?7BsYj/gANeKHtLLmT69uG/brBwyIKq1tBfuvtvOJmsBY3ZsPLYvbpb9mmmkk?=
 =?us-ascii?Q?UTnvTg3KELM4NQji85Fy4QVWRqNKKDmo8umdXa97VNX+d7Td7Z+i2s8TyYyZ?=
 =?us-ascii?Q?mnZWCxfj/jrabhrDH/CLAlmnqCDYPX0tyKSjQ2aNebk0RXukObXWzJpO1sk1?=
 =?us-ascii?Q?rornlVv1KBh+NvaKoEflP03DR2wlFgMFnJp+BCpltmQPQUfSni/f4kqt3/0j?=
 =?us-ascii?Q?CKLrNxFAx/2PrzmGhi7Ewv9g9cd8JqUfbqM5sS9dr5KYNHEgh2DbYqfd0hTD?=
 =?us-ascii?Q?vWdOGblDZ+SiXYo/yhb6Hk3oA0hdqRrejxnQj+qUSzsmR94mHfe9Q9SwYEE+?=
 =?us-ascii?Q?3qEzIjPsZa9sN0SaS9F/WpNUE84+srFFSNCUTIWpsiRqG1Y4Cuqnm/GHbzhT?=
 =?us-ascii?Q?sJe6oQYshU1G+V/EeisfduTNcO81VuqGT+YBLXUd9hHiAALoEm1SLMyZFOED?=
 =?us-ascii?Q?uAL1tfcAhtptiV1s3v5J8vY/pGMnftHNFfZpN//lDMpDOf9ltV3ZiI6Natvk?=
 =?us-ascii?Q?Q1lbN6L572+DnWkFH3oSYSdbsiivppqr1oFvUlGRBBYTigXSPd7F89LfaB1A?=
 =?us-ascii?Q?PZ4MmLNV2EsVYc0fu7g5LfV3R9DbcPUMXvNWVRrjrNOL0oex4H48DHVTMIC4?=
 =?us-ascii?Q?00ZPq58ZSHlkiDm7SXvxILNWCstqeMxTcRvWvoi8OwCh6NiUy25qmk85thTy?=
 =?us-ascii?Q?EOPYvV4Lob4EPbDpBR7iYx9QCNe7dvKqK84fjw1omw1QwK1Og88OmV1hd4ZZ?=
 =?us-ascii?Q?kOOKmFoJdNTnajNVui2sOnjdVm+IIZIXMMT1tq3s50lu0568pXFThCxAlnCj?=
 =?us-ascii?Q?p72fgl17Sz/k1dZhN95BQzNx50Y9EiNdwGXDy1/wP1YatRAUOtsnjlAKZ3ik?=
 =?us-ascii?Q?6+ymVK7p+GmO/U2xkSB8DV1sMissT93Tth+K8ienRvhi4I7OdJFlMzqjr8ws?=
 =?us-ascii?Q?8C4c5sTPTjhtBq0rmpn0y0dSYfb5anwM7FOkBkw/GG8YDEWfGqTqjSu1LC1t?=
 =?us-ascii?Q?8waP+yyHwLDmVpN+YtLPHw8Mre4flhjIB0Q+fo+xyF+kPvrM3vvJ2M64F3uw?=
 =?us-ascii?Q?En7/0YHiwaw2x1094eWXJW2Tz881DgcVk0FmF7O4S22nur0beW1+VFdEC9d4?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d4ea9e-f898-4049-53e6-08dcc14db89c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 19:24:33.5046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+7DidLQoKkzqX7Fyo/hIRjV5qCYmUCvCnc0hqsQp7TQJvX3SojLLMGekjr6gasKdjzYbF3KyKuI8rAZcBbxLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6322
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

On Mon, Aug 19, 2024 at 05:58:05PM -0700, Ashutosh Dixit wrote:
> Introduce 'struct xe_oa_fence' which includes the dma_fence used to signal
> output fences in the xe_sync array. The fences are signaled
> asynchronously. When there are no output fences to signal, the OA
> configuration wait is synchronously re-introduced into the ioctl.
> 
> v2: Don't wait in the work, use callback + delayed work (Matt B)
>     Use a single, not a per-fence spinlock (Matt Brost)
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c       | 110 +++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_oa_types.h |   3 +
>  2 files changed, 100 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index cad8f54500a10..1478d88722170 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -100,6 +100,15 @@ struct xe_oa_config_bo {
>  	struct xe_bb *bb;
>  };
>  
> +struct xe_oa_fence {
> +	/* @base: dma fence base */
> +	struct dma_fence base;
> +	/* @work: work to signal @base */
> +	struct delayed_work work;
> +	/* @cb: callback to schedule @work */
> +	struct dma_fence_cb cb;
> +};
> +
>  #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
>  
>  static const struct xe_oa_format oa_formats[] = {
> @@ -945,13 +954,62 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
>  	return oa_bo;
>  }
>  
> +static void xe_oa_fence_work_fn(struct work_struct *w)
> +{
> +	struct xe_oa_fence *ofence = container_of(w, typeof(*ofence), work.work);
> +
> +	/* Signal fence to indicate new OA configuration is active */
> +	dma_fence_signal(&ofence->base);
> +	dma_fence_put(&ofence->base);
> +}
> +
> +static void xe_oa_config_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> +{
> +	/* Additional empirical delay needed for NOA programming after registers are written */
> +#define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
> +
> +	struct xe_oa_fence *ofence = container_of(cb, typeof(*ofence), cb);
> +
> +	INIT_DELAYED_WORK(&ofence->work, xe_oa_fence_work_fn);
> +	queue_delayed_work(system_unbound_wq, &ofence->work,
> +			   usecs_to_jiffies(NOA_PROGRAM_ADDITIONAL_DELAY_US));
> +	dma_fence_put(fence);
> +}
> +
> +static const char *xe_oa_get_driver_name(struct dma_fence *fence)
> +{
> +	return "xe_oa";
> +}
> +
> +static const char *xe_oa_get_timeline_name(struct dma_fence *fence)
> +{
> +	return "unbound";
> +}
> +
> +static const struct dma_fence_ops xe_oa_fence_ops = {
> +	.get_driver_name = xe_oa_get_driver_name,
> +	.get_timeline_name = xe_oa_get_timeline_name,
> +};
> +
> +static struct xe_oa_fence *xe_oa_fence_arm(struct xe_oa_stream *stream)
> +{
> +	struct xe_oa_fence *ofence;
> +
> +	ofence = kzalloc(sizeof(*ofence), GFP_KERNEL);
> +	if (!ofence)
> +		return ERR_PTR(-ENOMEM);

I'd split this out so the malloc is done before submitting the job and
done dma_fence_init after. This way once the job submitted there are no
failure points. Also doing malloc after a job is submitted plays into
dma-fence rules too, you have malloc in the path a signaling a user
dma-fence too. It probably works the way you have it, but best practices
we to be follow the changes I suggest.

> +
> +	dma_fence_init(&ofence->base, &xe_oa_fence_ops, &stream->oa_fence_lock, 0, 0);
> +	return ofence;
> +}
> +
>  static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config *config)
>  {
>  #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
>  	struct xe_oa_config_bo *oa_bo;
> -	int err = 0, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
> +	struct xe_oa_fence *ofence;
> +	int i, err, num_signal = 0;
>  	struct dma_fence *fence;
> -	long timeout;
>  
>  	/* Emit OA configuration batch */
>  	oa_bo = xe_oa_alloc_config_buffer(stream, config);
> @@ -966,18 +1024,43 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
>  		goto exit;
>  	}
>  
> -	/* Wait till all previous batches have executed */
> -	timeout = dma_fence_wait_timeout(fence, false, 5 * HZ);
> -	dma_fence_put(fence);
> -	if (timeout < 0)
> -		err = timeout;
> -	else if (!timeout)
> -		err = -ETIME;
> -	if (err)
> -		drm_dbg(&stream->oa->xe->drm, "dma_fence_wait_timeout err %d\n", err);
> +	/* Initialize and set fence to signal */
> +	ofence = xe_oa_fence_arm(stream);
> +	if (IS_ERR(ofence)) {
> +		err = PTR_ERR(ofence);
> +		goto put_fence;
> +	}
>  
> -	/* Additional empirical delay needed for NOA programming after registers are written */
> -	usleep_range(us, 2 * us);
> +	for (i = 0; i < stream->num_syncs; i++) {
> +		if (stream->syncs[i].flags & DRM_XE_SYNC_FLAG_SIGNAL)
> +			num_signal++;
> +		xe_sync_entry_signal(&stream->syncs[i], &ofence->base);
> +	}
> +
> +	/* Add job fence callback to schedule work to signal ofence->base */
> +	err = dma_fence_add_callback(fence, &ofence->cb, xe_oa_config_cb);
> +	if (err == -ENOENT)
> +		xe_oa_config_cb(fence, &ofence->cb);
> +	else if (err)

I'd just assert here rather than fail. The only return currently from
dma_fence_add_callback is -ENOENT, in other code paths we just assert
too. See invalidation_fence_init in xe_pt.c.

> +		goto put_ofence;
> +
> +	/* If nothing needs to be signaled we wait synchronously */
> +	if (!num_signal)
> +		dma_fence_wait(&ofence->base, true);

I think you have a UAF here. The worker which signals the fence puts
'&ofence->base'. So I think you need an extra ref for !num_signal before
calling dma_fence_add_callback which is dropped after dma_fence_wait.

Also since you have interruptable wait here, you likely need to return
an error to the user to retry the IOCTL upon interruption, right?

Matt

> +
> +	/* Done with syncs */
> +	for (i = 0; i < stream->num_syncs; i++)
> +		xe_sync_entry_cleanup(&stream->syncs[i]);
> +	kfree(stream->syncs);
> +
> +	return 0;
> +put_ofence:
> +	for (i = 0; i < stream->num_syncs; i++)
> +		xe_sync_entry_cleanup(&stream->syncs[i]);
> +	kfree(stream->syncs);
> +	dma_fence_put(&ofence->base);
> +put_fence:
> +	dma_fence_put(fence);
>  exit:
>  	return err;
>  }
> @@ -1480,6 +1563,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  		goto err_free_oa_buf;
>  	}
>  
> +	spin_lock_init(&stream->oa_fence_lock);
>  	ret = xe_oa_enable_metric_set(stream);
>  	if (ret) {
>  		drm_dbg(&stream->oa->xe->drm, "Unable to enable metric set\n");
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> index c1ca960af9305..412f1460c1437 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -239,6 +239,9 @@ struct xe_oa_stream {
>  	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
>  	u32 no_preempt;
>  
> +	/** @oa_fence_lock: Lock for struct xe_oa_fence */
> +	spinlock_t oa_fence_lock;
> +
>  	/** @num_syncs: size of @syncs array */
>  	u32 num_syncs;
>  
> -- 
> 2.41.0
> 
