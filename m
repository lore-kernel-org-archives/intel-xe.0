Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6706C76196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 14:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6597010EBD0;
	Thu,  6 Apr 2023 14:18:06 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F5110EBD0
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 14:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680790684; x=1712326684;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P2x0I3ZUrvPbAN+ICC7ZaxG2E1SzQPTEG/OR9Zgijj4=;
 b=lwVfIgOd7NJPoZalkbWtlpCuVnlErX8itAgbA6jkwIPmtHdWVwp00aZt
 iogKJsTNeZFQCMBKfQkXPsT5eYgESjAE12N/W4QGP9si4uRV6El8Hvwtt
 PltDi4VKDtX4wFiqqbLMoMVMdKSBssLXRox8xzdz3K+zdJTflwiRhWlw9
 uXH9XRWAOCUJNvl9oSWXpN1G0K280xRKRAWeGQd5yzV/43Ea9MpMj+lwJ
 CMwTsnM6u5hycMza4goUi5tpejr2jyJEV7nJdZAVZvLk+KPthVVXQyh/g
 M9xh496ojHMr9WFp34CqzEtllj/MySxXNtQdbpe2uyTgsOAwgBXNwFZwe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344501384"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="344501384"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 07:18:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="637322483"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="637322483"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 06 Apr 2023 07:18:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 07:18:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 07:18:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 07:18:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 07:18:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqBtLnzprHTab/oNx1+cKuPKhLWaHRYP482LRok8QS39xaJ5QkJXUnSO7PGBpmP4f9P5FAJUwZAI+nPwhdpfHMISjopcYWgUu+nXB3mtlQWymL/526Ich1nPYPqvNcHTOnTG1Y44GKxPmnl5NTo1+8N7ajRLrfq/C9+cMyKfP3DgXVJFJEbiQ7Y3Pt/go6a60rwEt+g8zNX3rLpAC2U2G0jbfYkiXGDygg4nRtfrkl6pNCo/DwkxjAP8Xt9GH5DT3LDDeHSU6X/NpACBqyvf1ym5XfzGY+yLA/oyUySClkXgd53wAqzLnWUP2SIYW5DrprKPDzcdMxkyuTI4Px4fnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9YB7eIU8BhpQdE7pPEUGsesRS6OWQXc+6fR5c6np8A=;
 b=FJ3XsP71QI8xkjoX01Dkxcz3+0w96/ymcb3nNO4+awgfIp/rTU884olxCDvJASWaqtvpXiJGZkx7FFMn6s/1oTljrZldiMc2C5PV0P0Y381y9gmrloVv+mrQvLhySCyfsnOu0z7uwbBMcjyA5mPncsW3h4CffPeTTHBJrNekAdrtJLOLZTBYLt9OkpHdBKjg5zd35EyEkyR0b++5MmKtio8X4i/GIa9U3Mmv0y0snk9hfZqzbcGiWG/YXtzINKNE1lxML4XMs0UE6iFrN4EgOiqLnc/vS6c0RGVxLFXFpYOLCV+z8UkMAPbLFkAxm5bJVSYx5kZSxhE6hE+eXRCd3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.31; Thu, 6 Apr 2023 14:17:59 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Thu, 6 Apr 2023
 14:17:59 +0000
Date: Thu, 6 Apr 2023 07:17:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <20230406141755.GL4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
 <20230331102419.521392-3-maarten.lankhorst@linux.intel.com>
 <20230403202725.GX4085390@mdroper-desk1.amr.corp.intel.com>
 <fb5a81af-e95e-cbca-ec5b-7a98bafdcc34@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fb5a81af-e95e-cbca-ec5b-7a98bafdcc34@linux.intel.com>
X-ClientProxiedBy: BYAPR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::33) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: 39739eb2-bc05-45f9-1af9-08db36a9b91b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R1Ffo9IeR8//KBIZXsDlgNGRiB/CHkUKN6/WIsN5hYi+XbOuZXDN0jH3SFZYe9y0Mpkr02IzX5tZKU0He89m6XSKkU5eANRNRWB3xXQSmLAr9fsSTky5mURC0N61EedAnM5Fmpko0T6QGUahr3JU+tWtaPlFORJxiTLXAzys5MDXS1kHv28eb7OAWh+1CNM8OLyXjKK6od/esHWvHzweVCXNu72WrMqVUw+GU67AsvDczAE4KXDAJnK9xqRhgyssJVLikR1TozXWrBgUFOZiONlBCQKaur84Y7IiJeeiRl8dDbi54kSQzdGEtm4atv/8qMtdbAQfz8yzO3OS70cY6ae3aMYqh3e0SAMPDMBI5lPf5M90UcqJv/qK5Qz7P2CS6ov3HFao+tQst2vO3I7uQCJFKG6HJKYyQX20bCCOZiJeTTDjpPzrdD42ZZ1wHRW50O/QNT2wksjqeSk9wYCgQmhP4LOslhjcGowK5mRr88pHB1qvLHev4Ari6x2DWS/wE8oNl6Fh9Li2HjvwNF8PR3Hhe2gARLP7LwDEU18l5U9izMmA2oOIiU/GxOWlb7JY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199021)(33656002)(38100700002)(5660300002)(2906002)(4326008)(8936002)(66476007)(6916009)(8676002)(86362001)(41300700001)(66556008)(82960400001)(66946007)(6486002)(83380400001)(186003)(1076003)(26005)(6506007)(6512007)(53546011)(6666004)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lWDymDec6r3+Jh8lxHg+BLNVcYJcOavBN76tPTJRAXdisLqgn0PuOJ0Q6LdY?=
 =?us-ascii?Q?ifvs7kQvKjKiGdPOxFgdVE+kIY6UBhwWBImsyuqLd7tnnSvdlRpkV/coULGA?=
 =?us-ascii?Q?3dhuptZxT+CvUUAvc4lX2pUoSEqKivR5yItWNxhIohVRZS6WGHH/qZoBc+do?=
 =?us-ascii?Q?Cc8yNsr7z7qtJrHflGbT1kxt+b2uDxz32jsXKS5Itnguz8CKT5Aw2vS5gX+G?=
 =?us-ascii?Q?vNt1fDnEuKb3YERZCLUj7DzQvFhcNE2/ewD4dK7rfE6uRJdrD2woCIrYXeZz?=
 =?us-ascii?Q?D780HoRfkMoJ6oKc2JtOw0DFwZTamAsjG0l3ZhCl69n+qnmK6zsqx8oOy9pm?=
 =?us-ascii?Q?WGKzfmiLXYR9D02JUDtsGyV9SuQjT97hr1+IjiVI4m9OzTuS1mDF46KgGdGA?=
 =?us-ascii?Q?6IFBWvMtRILOzEFRx7qEXCCFan3rufKcI7h4Eck5ps80V7Qp9IlU1E79mm2I?=
 =?us-ascii?Q?UZuXYOOU2IVKLWrFn93t55WLgB/jQ0bThii8vOuIRaosZyXyQw3C/Kzkf5Uj?=
 =?us-ascii?Q?WtJoth0urzq/zm/+kIoShLfA/1R+VYFoPL8TAfQMi/jxxXsknB0kft66/dX6?=
 =?us-ascii?Q?+PieEC7zDVUDssfNYhcfF0Vmi7lFNHzykSfo2IZXHANsPMaktskyIkZDsK8V?=
 =?us-ascii?Q?kmVEjeFolJuBeTrTDuSCxfF+y4dvGsv200/f8H0Pq1zYolsVnA0roDRoaIqq?=
 =?us-ascii?Q?G5KzzcwDqloEb6RDO6EXuqiy6rQo8RfvMWDZy0T2vbYdIUYNGdXyz2kxZaXP?=
 =?us-ascii?Q?Et3+Y6n13f/YICRsliax+fyUi9gvZq0rdfavpoRU3saiHvz3eE6ongBDI6ng?=
 =?us-ascii?Q?a10YY0qDH4H28WvyHpzsFWbw2ty3viEWmQ/zE2fe7zHzzKvVlEaM9Rwp7dBJ?=
 =?us-ascii?Q?Hz2noVOaIi5agMYik72/wNbKapXeVQK8g6gRBSSxUV979HVqqUT9rxl0p0xH?=
 =?us-ascii?Q?s0MGCYaMcHLBvCeAIFGUA7tqeN2KkxbsRjVDFL6qMSsJQTiAsoeSs5WptqCZ?=
 =?us-ascii?Q?zPmkXLCF18vgLAOlWfKypQz5K592OQXUVh9QCkwYAyOUAFpCz+D1DfEh9OmK?=
 =?us-ascii?Q?co2EKQOleWltKZ7vucow2ArbXVtn68y9OD/AAKa9FYfn1UXGMb0YN3xGCRBs?=
 =?us-ascii?Q?TsMD7TgCHTLYuWFrDxURsChZXNN7qVy59PpizIVQk2OEh5lARUfZ+QlydqjZ?=
 =?us-ascii?Q?BCNr/kLyJ8X0vLLMNTFd/lIchGuNMpU+ahdhrZF5fn7g1bI3xthmFWLW0tkK?=
 =?us-ascii?Q?p5CHi9MbRKCC3cimxknm5/EfhAJxZ22tQXbmQwm/Rb14CEUs1CRGR7zQeENr?=
 =?us-ascii?Q?tQ+f74i9BbJWA+8lfM1Q5JmlgW9BaLxYMndAc73iLOnL666MKm8Sozl+Z4v2?=
 =?us-ascii?Q?mlfGH08fXzJYhaFxSZDe+nYG96CXjZLxbHNgb+sB/2gHT2OjtgJbOdl0t/5g?=
 =?us-ascii?Q?bAk8mMnGZbdxdKQ8IB2d2go6NwfeblsGcTl4pFo0t8YmtaQvfTDDBps4D4Fr?=
 =?us-ascii?Q?i4rtszwcehAkBY3gzB7A803b59CT8oNoVX+tY9l8WJKrY+DhTOOLl+NiGVe/?=
 =?us-ascii?Q?YjL54LkLcQkzzLzWBGYaHIG5jN9qTv3OikZ0Ys4Cn/hCIkU68ss7TFmeFfrh?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39739eb2-bc05-45f9-1af9-08db36a9b91b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 14:17:58.9452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBdQ8Ks14VMNzhrS5YoDxquwEWkyJJhpAlMIDwz6jjQjesMUEJisz1DTmMbs879u1crZeSVLqpc7S89lFGqrqmMIJ3Zm9Ip2untzQFiK2oE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6541
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: Use full_gt batchbuffer
 allocation for media tiles.
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

On Tue, Apr 04, 2023 at 08:59:27AM +0200, Maarten Lankhorst wrote:
> 
> On 2023-04-03 22:27, Matt Roper wrote:
> > On Fri, Mar 31, 2023 at 12:24:15PM +0200, Maarten Lankhorst wrote:
> > > This fixes an oops on media tiles, because we don't initialise the
> > > bb pool.
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt.c | 10 +++++++---
> > >   1 file changed, 7 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index bc821f431c45..c7a2e9baabfb 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -237,6 +237,10 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> > >   		struct xe_engine *e, *nop_e;
> > >   		struct xe_vm *vm;
> > >   		void *default_lrc;
> > > +		struct xe_gt *full_gt = gt;
> > > +
> > > +		if (xe_gt_is_media_type(gt))
> > > +			full_gt = xe_find_full_gt(gt);
> > >   		if (gt->default_lrc[hwe->class])
> > >   			continue;
> > > @@ -262,7 +266,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> > >   		}
> > >   		/* Prime golden LRC with known good state */
> > > -		err = emit_wa_job(gt, e);
> > > +		err = emit_wa_job(full_gt, e);
> > If we pass the primary GT here, then we'll take the wrong path in
> > bb_prefetch().  That doesn't actually matter very much (we'll just
> > overestimate the padding needed for media engines, which is safe and
> > something we already do for BCS engines), but we should probably just
> > drop !xe_gt_is_media_type(gt) condition there as part of this patch
> > since it will always be true now.
> 
> Yeah makes sense. That check doesn't strictly speaking seem to be needed, so
> I'm fine with dropping it.
> 
> We could always request the engine to be specified, but I don't think we
> really use those batchbuffers beyond initialisation outside of
> migration/VM_BIND,
> 
> which is done on a BCS engine anyway.
> 
> Can I have your r-b with that check removed?

Yeah,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Thanks.


Matt

> 
> ~Maarten
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
