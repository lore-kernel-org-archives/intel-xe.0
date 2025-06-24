Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C40C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 19:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991AA10E103;
	Tue, 24 Jun 2025 19:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Scbu1nlb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC4710E103
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 19:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750793159; x=1782329159;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=unkBzpRrkrTb4vw68OX8uYiwNHcg0uadDQJrEl2YqGA=;
 b=Scbu1nlbrU2JV0/cyTPgS1SPnwUZliwj+AxUuv3Gg0ipPXn0mWzHyl71
 B7LkAXqRiXMaYfBjqb+UhGhp5WhTxB3Xhm403uunbBOK5KsaKvQOwjRdN
 feH00febO5pseCjms//juVLfalZsSMFqxRprXpMwxy34qpm53NG/xVP98
 zcpJAQrdgDnmZU8pwPZkt4DUDgfrjPWpOUEDg34O2GrvP+CZ40sj55XIm
 Wc0kuEI5fED615YgXWjpfOnUkVpEzXDfyZphOxe4KvYV3RZvQO3YgNYPx
 TXkX3KwkhiscNAysybrJQgcJlryaqPZs/VYcreCKcvReuDu2HIrG0D1Vn Q==;
X-CSE-ConnectionGUID: 0lGneVLYSCemD/roJDAb2A==
X-CSE-MsgGUID: 6w2lYprISwSbC6Ai+Qm+/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64480602"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="64480602"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 12:25:59 -0700
X-CSE-ConnectionGUID: Pq8FCTGGTruKHoJXXMtGig==
X-CSE-MsgGUID: rLOeJSY8RKGSLrtSli1rgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="152530952"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 12:25:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 12:25:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 12:25:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 12:25:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsNdN9deCUxKSWVSHT+2PiSarBCWh60VyGPrDfW3dKQmWodrQ3xVEjCvF7d3X08e9tosGL76yQb9D0mME1t7WKN+cL5x17WqxGIRSqeYVHyDrq+2LvfgGEaBwdbFwPoPW/XA1/gwY5ggnBJiymLUAXUK5oDZMJll1NXKSb9/l+l0IM6oafeetkRme6hdk5OQsDWNKW/G/pGdirkEoXO/NPJjX4LBJunQcoiiVYsknF15YPN+Mt6t/nSTiQioSj9i0lpIKy649EoThveE4Spo6KlhFuhL49CflajJO1nbDVKsyupTU1d+8pp9lTDhi6ZTIETVOm6jl4+KowvSXQ8mGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiSB+JovCeZChRiFLMOo9RP2XnEylZlZcu4QI3L8UsI=;
 b=GlSY1IwKB3C9nlGORbeNIt0gBOKQPJY4n/b1h50ALqZGB32I7MHB5mOnizydR/9FRfR/RiqTBCRIOBkppN6WeWNMYfR626w0jPHxL0WRYgccXTc+0nVg1rRTij2SnmavXFTFj8u2bdSahunucjKZvOjHfxzzWfjYnGq19VAr0dpUdqAXnfIdR+ZbJM4KcxLA1pwIzvEZN6wrbE+evo+Q67srsltXNlhpixqkgCyqC18YvG+YRuGCrOiqpHxSyLev8nYA5/Oksmx9uT32lCDgavC0kZvJ5aJUeUPw+6UmRPRldQmQI5q+V7W29XeBStcVBIeLyAaLNK8+mamthOMZkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8561.namprd11.prod.outlook.com (2603:10b6:610:1ad::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 19:25:40 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 19:25:40 +0000
Date: Tue, 24 Jun 2025 15:25:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Matt Atwood <matthew.s.atwood@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/xe: disable wa_15015404425 for PTL B0
Message-ID: <aFr7scFlNsmNy32h@intel.com>
References: <20250620214920.718179-1-matthew.s.atwood@intel.com>
 <20250620214920.718179-6-matthew.s.atwood@intel.com>
 <aFnDJdKKgT_-j69u@intel.com>
 <20250623233130.GE4868@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250623233130.GE4868@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: c615c68a-8e56-4a29-e61e-08ddb354e7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HW9kpANtjVr1T2qP2yIshDwiHT2mYIVhq+S4ipXC8xQPEqJ95DAoct/+9iuH?=
 =?us-ascii?Q?Ij0ECFo9c5fhZMcpEuvRDJiwywAHh/2GrMR2FVnZHWvwsvT02KOIwvzhrngR?=
 =?us-ascii?Q?NasOH9+KSwWP21LzsIR764mBHNQLvpyLc2xk/B68xug2seUuyRL9U+PaHA+Q?=
 =?us-ascii?Q?xIojmp/i9239YNqyOo3hh+EQ299oQULpO+PcRSPPvXCw3MafwoA+tWYAACbX?=
 =?us-ascii?Q?RtK/nw8yQwiomAXNK7mFJbF5OKKljLu/s4wQiGJdqjVhVYgtSMDPvEBs1DeZ?=
 =?us-ascii?Q?YooqsVVmDvMDvNU1lB6iIxqGbECFMPoreRjl7cWuGG/77+zcoQlAhi0uPMRB?=
 =?us-ascii?Q?W4y92MyXkATgncVpbAqeMQeOA8d19B8v7/JWhYZiSZUtF5kedZswmSpwqWoO?=
 =?us-ascii?Q?akjZzxB5ozl5sXezGb/hoBKsxwv3J8FCPv8PliPDbfPF3zRrrsT3tJFNsr27?=
 =?us-ascii?Q?ErYfrUtWxF+4yaU2UD39OQ2WVo45b+oYxMV7umv4tPdNVgy9OaORhpN1qe57?=
 =?us-ascii?Q?0oM6fhvlOpHhEElIjgSRQauC0MY+ilMPACl0fzugYaH7P+xJUKJL2PLk69aP?=
 =?us-ascii?Q?sFk1l0w8ek1mS+vadWMpcn10MbaH5gRzE5Chll2iRevP6F12HljgDvZTQ2kl?=
 =?us-ascii?Q?HFxK0eymUCX/wikd6tA+FdF0WGgJ4FSiNfUo7Kmmo2UJvHGjDgfAqtiiP5TW?=
 =?us-ascii?Q?iFJ4GSRhbW06BNCijXikd70klvhuQSkaTX6iP3GUFMLptwRC19IaI3rtesu8?=
 =?us-ascii?Q?MAOuCWiNgVNUXGqQb7jFUDpJ7XtKRv3tsesvHNLMalVTT1yyEZp/UZiaxWL+?=
 =?us-ascii?Q?UTiIrmYkAQD4F/1+ExaaCZJsbwiRW64Rq4n85HQiu8zQZ+KHkUUR+GFiwqGS?=
 =?us-ascii?Q?3xG0g3k3NRcPmQzGTh1pn1SrBo5YgZ51kErhjUMwOvcz2zGvreETgv3bRC4x?=
 =?us-ascii?Q?kw3OLK85JuHPreEDdhgr4eRhHjjdaVriHybEdrbzAM24NC/EbN5gtEC4Bh+8?=
 =?us-ascii?Q?fD1AysQDScneNbj8w1NxHCNHM8aIVQ974mgZ4KKBl4piQevA6z/DyFGH7IeF?=
 =?us-ascii?Q?Ayloe/UvZVAcbeDXyDv1lwhCB6URU5RfSZtQ7beA6W6QPQuZjozs0zqlX/Ir?=
 =?us-ascii?Q?L5ZV/EviEE3Z1eofSM2jiy0a7/EIz2Xntu2bS21zv2vDv21vxFPXbcVnoNB2?=
 =?us-ascii?Q?+u/AXkAk4UBtETdn1TGSwJDvQAqxHZdLOJk8vgLgqbAn7NxBjHNwE84Xcwlj?=
 =?us-ascii?Q?bkGK6YEfEdtNxBsE5F0BiLXyB72V8i5245WtKxOcxEA26ZNPKQ0k+ayQX1Rw?=
 =?us-ascii?Q?X37cByC6Tu2lil4O+2AkGEjaVN3An0W+jyE+2QdLhOX+bsFMG/v3da/u85Zr?=
 =?us-ascii?Q?OobgYOgcYFnDGQokVaq5xqbL6wgFhVhvk5NEmRHwlp6BE0IUv39A9qLAnBlB?=
 =?us-ascii?Q?n2uKTi8oe3I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oQoR+DlfXVSYSZLUPQQs250aoGkuRNq8t37lRIcWFi5qg8t8430leV+Q0gBI?=
 =?us-ascii?Q?NtVgHGeITdPFY8m7BzGKZ5yKbvtY1fs94XwDDHjFfrQid1jhGu7og7DJK46F?=
 =?us-ascii?Q?TNWxzBNDj2hde4kBMOr2NCMubH6YRuyKRTJPFSzGgT+UHSqxgQcUuOLroB2O?=
 =?us-ascii?Q?Xn0ZKtJO1XiT+uP957jKmHrm2X3s9KWHVc6bOvt3spVDybrXUexw/hcHUkg7?=
 =?us-ascii?Q?xM+GoYUIhKyzdZEvU6GTFO4WT1r9C2RvZqwHIUzcvW9LehABCthkWtBD+nz8?=
 =?us-ascii?Q?+nYKjXdWVLLilDACDrAhFdCj3CkpxH43FLUyYamiijCg+fvD9jPJtPkrINqk?=
 =?us-ascii?Q?MzD+/B5SZ2ErAIvk0zyHy2sEcp7nfwt2QHgttRq0QAQrz2WAU/VAAG1kfKyf?=
 =?us-ascii?Q?6xcD1VR6Ujcv3fuR56lID0mwp09/vFnfR3jmFMgOr2y0/y8Wk6yhwlkgHD9r?=
 =?us-ascii?Q?wPEIBIUDmNEPmhKC5AppM19cWR0REE5cNVKI6XSBcx3QCaREp4QY11oKl+YQ?=
 =?us-ascii?Q?Ycml2RKCYNmy723Jcm5jl7/Z5xgHSM+8I3lSbSFs0bffUOcdUnDTgulcrpub?=
 =?us-ascii?Q?2rEhruU1TNASYyMcW61zSbKyrzhwJwHVBspt3m0nldrRz8C+L9RV9+5LkaAr?=
 =?us-ascii?Q?QB+o5FpUcxvJLVoaHIg2oygJ2h/xptXc+Mgu213yAoTYX85GObVQE7IpdUXK?=
 =?us-ascii?Q?orh6FqfF/xN7iulh0EFfiyOaV8RB7mNoo3PnZXtIpa1OQTlNDrzmo31lA1UA?=
 =?us-ascii?Q?41z6KPIHesLNlhF83/bmuc0rZZP4MgNNnEOZ3vSawjdcyxtp9vHIpjUZA7rH?=
 =?us-ascii?Q?gMe6Rm5GTZp/VQkL3B05WhsNfRDJS5H6mrDUfP3AfBbzDEozlYkFrRDI4QOL?=
 =?us-ascii?Q?BLnvE0WgJmnCNZ6b5CR5brDiRXiToKCIb5ZSn1MpDmDeg6BvZ+3yQNKpbI5P?=
 =?us-ascii?Q?uhATi/ToOB4lpGLbO61Mf17TisbY+ekjaHiebiEBNRGP79gxJMQDpJj8yyti?=
 =?us-ascii?Q?o8jl27CgtNBmiZ1unxnnnnLZc1Y1+mphzN8RPnrKwT44wPC3gzUAsuX0OhfV?=
 =?us-ascii?Q?d5wvzvaoslhMc2F9voV9AOIWzX8s/AO7+NzxJ8TY6xhb5p87lGrv3S58YSGu?=
 =?us-ascii?Q?lBtbRSI2+c/H6n+sgH2VuyKQbbcxkr1bviA1NZscueowvUMzzYxbtdMd2/vo?=
 =?us-ascii?Q?3f6HXZTX0u2I7BNSUNtw+91zBKLR37GXS7ofLq1SINJ/Qj0YXcOLvxKDt4xE?=
 =?us-ascii?Q?1D9RAVggUpfpmto9FO2wAtQtDuvn5+WZYwYr+fstB2+YDa9l4yeN9vv2bKQv?=
 =?us-ascii?Q?DjoMR5m5PSZEPgm3wi76cZj0RzSw+OtMmCNjc49fGG2YhdWr5PJMA4+9Ccjk?=
 =?us-ascii?Q?YmkUJHTpdr2tqkIYlnYRGb8VL+FtmL2jbwRCfqtiWVXeh13jOR5dHJDvZPfk?=
 =?us-ascii?Q?tDDrzcbil23p3DGUSV2It9Dq0v5N5s2V0TWTl6+xlFnIoQ/3DjJFw+O2LVGk?=
 =?us-ascii?Q?HHhuOmzt6cxiSPe94kQiKE31CjBY289CwjqQqp87xiAWLGbXCIeTk4oV9DTe?=
 =?us-ascii?Q?bEteQPQFmIwVNrtIIc12Lr+LTW2LjKOuy3JyZlshuyYZBR1tDOG59Xf3AbtF?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c615c68a-8e56-4a29-e61e-08ddb354e7b4
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 19:25:40.6056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pfI/P1V4JFmT0Utf3+goMUkUfeM1Oa4vwUsCZQu82qyWdBbVjqJD6RcYiOF63zvfyLPGnfNdG4+/JeYAmSeWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8561
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

On Mon, Jun 23, 2025 at 04:31:30PM -0700, Matt Roper wrote:
> On Mon, Jun 23, 2025 at 05:12:05PM -0400, Rodrigo Vivi wrote:
> > On Fri, Jun 20, 2025 at 02:49:20PM -0700, Matt Atwood wrote:
> > > This workaround only applies to PTL Compute Die A0. However, this
> > > information cannot be determined until after the GT is brought up. This
> > > means that we will assume that it is required for the initial bring up of
> > > the gt. After GT init, the oob workarounds are enabled for the GT. Use
> > > this flag to then manually set the bit in the soc oob bit field to 0
> > > which will help performance after device bring up.
> > > 
> > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pci.c        | 6 ++++++
> > >  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
> > >  2 files changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index ded0f3dc8d73..a624c3fb9498 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -34,6 +34,9 @@
> > >  #include "xe_tile.h"
> > >  #include "xe_wa.h"
> > >  
> > > +#include "generated/xe_wa_oob.h"
> > > +#include "generated/xe_soc_wa_oob.h"
> > > +
> > >  enum toggle_d3cold {
> > >  	D3COLD_DISABLE,
> > >  	D3COLD_ENABLE,
> > > @@ -890,6 +893,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > >  	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
> > >  		str_yes_no(xe->d3cold.capable));
> > >  
> > > +	if (XE_WA(xe->tiles->media_gt, 15015404425_disable))
> > > +		xe->oob[XE_SOC_WA_OOB_15015404425] = 0;
> > 
> > We are discussing this offline, but I need to make it very clear here
> > that we should not move forward with this as is.
> > 
> > Two unnaceptable points in here:
> > \
> > 1. _disable. We either enable or we don't. If we need to wait for the gmdid,
> > let it be and enable the workaround after that. GMDID should be one of the
> > first things and I confirmed this workaround is so rare that in an a0 situation
> > you could wait to only enable after you read the gmd-id and confirm the
> > media is A0.
> 
> This is exactly what we *can't* do for this workaround.  The requirement
> is that on any impacted platform, every single register read must be
> preceded by four extra dummy writes.  There's no such thing as "early
> enough to ignore" ---

What I got from the Architects on this is that it would be safe enough to
read the GMDID without this workaround since the condition for the issue
to manifest is not on a single read like this, although the protection is
global.

But okay, let's work with the assumption that it is better to protect
anyway.

> it's specifically noted that even pre-OS firmware
> and such needs to be careful about doing this as well.  So this causes a
> bit of a chicken-and-egg issue:  we cannot read the GMD_ID register
> without having the workaround active on impacted platforms, but we
> cannot figure out whether the platform is impacted until after we've
> read that register[*].  We also do a bunch of other register reads
> during early driver probe before the xe_gt is initialized enough to be
> able to service workaround lookup queries.  So there are a few options
> here:
> 
>  * Mark the platform as always being active on PTL, then come back and
>    disable it later if/when we confirm that we're on a stepping that
>    isn't impacted by the issue.  This is pretty simple conceptually, and
>    is quite likely something we'll need in the future for other
>    workarounds.  That's the approach MattA has taken here.

ack.

> 
>  * Add two separate workarounds in the driver: 15015404425_early and
>    15015404425.  15015404425_early is an SoC workaround that applies
>    unconditionally on PTL, and 15015404425 is a GT workaround that
>    applies only on specific media steppings.  Both do exactly the same
>    thing (4 dummy writes before any register read), but
>    15015404425_early is checked before all early MMIO accesses and
>    15015404425 is checked on all others.  The downside of this approach
>    is that we'd need to use a completely different set of MMIO
>    operations for early driver boot (i.e., no xe_mmio_read32 and such).
> 
>  * Ignore this workaround completely if we can confirm that it only
>    impacts pre-production steppings.  I don't think we have confirmation
>    yet that A-step hardware is preprod-only, so we can't take this easy
>    path yet.
> 
> > 
> > 2. Don't mix SoC with Media. If the Bug is SoC don't wait of the media stepping
> > and check directly for the SoC that needs this. So, don't create an infra that
> > already has an exception in it. And if possible, avoid the infra at all. This
> > might bring even more confusion to the w/a handling.
> > 
> > This w/a in specific here is soc, but it is getting mapped to our media-ip,
> > so let's use the media check...
> 
> I think more explanation needs to be added to the patches to clarify
> exactly what's going on since it's still a bit non-obvious.  The reality
> is that our modern platforms aren't actually "SOCs" at all anymore;
> they're technically MCP's --- Multi Chip Packages with logic (and
> sometimes hardware issues) spread across the various dies.  The hardware
> teams still refer certain things to be "SoC" logic for historical
> reasons, even though that logic is technically distributed across
> multiple chips these days.

Well, I still see the glue of all the chips as the SoC. It is easier to
understand.

> 
> We absolutely need some kind of "device" workaround framework that isn't
> tied to the GT and that can be used before GTs are even up; we have some
> non-GT workarounds today that we're not really handling properly, and we
> know there are more coming.  I think when this workaround first came up
> I suggested a "device workaround" infrastructure and using the same
> general XE_WA() calls, with a _Generic() implementation to lookup the
> status of a workaround in either the xe_device or the xe_gt depending on
> which is passed (with the xe_device workaround table being initialized
> much earlier in the probe sequence).

If we split in device_wa and gt_wa that would make much more sense with
our Xe design indeed.

> 
> Issues outside of the GT can live in different places:  the GCD die, the
> compute (aka CPU) die, the IO die, etc.  Each of these have their own
> steppings, and the MCP itself has a stepping too.  In some of these
> cases, the proper way to determine a stepping is to map PCI revid into a
> die stepping.  In other cases the proper approach is to "fingerprint" a
> die's stepping by inspecting some other IP that lives on the same die
> (similar to how we used to fingerprint the PCH back in the day by
> inspecting the ISA bus device).  For this workaround the stepping we
> care about is the compute (CPU) die stepping, and since standalone media
> happens to live on that same die, the bspec tells us how to figure out
> compute die stepping from media stepping (A-step compute die <=> A-step
> media IP in this case, although that isn't something that's guaranteed
> to always be true).
> 
> 
> [*] An alternative to fingerprinting compute die based on media stepping
>     would probably be to check the CPU stepping through whatever
>     mechanism is used to print the stepping in /proc/cpuinfo.  We'd have
>     to find separate documentation on how to map the numeric value there
>     into somthing like "B0;" I don't know off the top of my head where
>     that documentation would be but the core kernel guys could probably
>     point us in the right direction.

Yeap, in this case it would be the combination of the pci id + cpu-revid.
This makes much more sense for this w/a, but it is hard to generalize indeed.

But also, any device_wa is hard to generalize anyway, since we won't have
a device stepping or anything like that.

So, okay, 15015404425 in xe_device_wa enables it and
15015404425_disable in xe_gt_wa disables it for MEDIA_STEP(B0, FOREVER)

> 
> 
> Matt
> 
> > 
> > > +
> > >  	return 0;
> > >  
> > >  err_driver_cleanup:
> > > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > index 8c2aa48cb33a..822cbff13819 100644
> > > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > @@ -71,3 +71,4 @@ no_media_l3	MEDIA_VERSION(3000)
> > >  # primary GT GMDID
> > >  14022085890	GRAPHICS_VERSION(2001)
> > >  16026007364 	MEDIA_VERSION(3000)
> > > +15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
> > > -- 
> > > 2.49.0
> > > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
