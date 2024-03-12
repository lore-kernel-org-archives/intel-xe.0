Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D31C54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 18:37:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB18F10EB6F;
	Tue, 12 Mar 2024 18:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZbGcIeOA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B36710EB6F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 18:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710268625; x=1741804625;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=A3pWKKc0MsX7dKBowReGbyMpMQ71GztQb580mWSjcTE=;
 b=ZbGcIeOAtDW4/qne1yM2ut97qUgq+WF/rIOSkM+XNdSePJhBbpjREk/E
 d6HoysYSYJwm7J79S9luDk5hthlL1+SC7vAJF1JRroaKzmpjSQX8UyPMm
 WuFXm0jg/YXdnJFvuNQh8JpvlgJuco65kXvjNq18dvwbAeRiZehaO+Xoh
 d82wC8FY4WZ8/VAg35q+0UyS1IkExTE46o/o5nEk7HTmS6qK0D5PpGO7v
 jd0kwwO3iMEu7odhBoltn0b/iuGZjN25Oe1dpCtTP33gTmDVwUEmRLloJ
 Bp/qh7L37oUNHdp4v21tZteGwqGZaQbgenPT2GcHnuYcDbGfBZ/VDqxhW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8817338"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="8817338"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 11:37:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="49073006"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 11:37:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 11:37:04 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 11:37:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 11:37:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 11:37:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKTpVAmxz21HYVEBD+VH3qbHpEktXbKjXO7hdU/PjKCdvE/Yh3Eh60+mvVhLzwgIJDeVWgQJQKunKK8TdtIzmr3ZTGFTSvbkl7wrcV+NwUbcx+S4FcvOz2b5RQYtvCxSdMPibwuK5dsnSkQssX0lVtkuLZM4DJ8DFJDnNjP/84O7Fr8ZYWKmcJr4bC+0IX+bu4WdH99YlA0QjPJxS4Ts9A+Je44RJLfFn6okanqx0saLjeOqMSKXRtGt+OGwK9PzHP+XeTzlh4iPELywHpj1dFbTzjK5HNzVkxv47MvgGS3FLeIUlvkn41ynBEP+CaCTV52wgRglUzYzRHzsQ4K06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DV0ZKbK65B+/xVsr/4x+bwZXYdveJ7kFLNgHZIZ4j2A=;
 b=ApAWs40DNyp6NFwgfAZKnYCa8OfNHOauvUXF+v3PEvjCxEfM1OJvXk8tUps8u/o4bx6HSdAI/NfEBFHSCpQs2ZUWnTDtq5O8mGtoBtsDZT0SlkkW2LrFc/QrTaEpxrlA9R+Nu6kh7sYJjEun9+xW41A3xsKb6ePglBmcu/Gw3PNp9UPln533NLNvNxBeaivtNXs995sAEQcqfOYPJX+YnnSjddO2ZCGNfnDocT7FSeEYqiN9gw10E6G191DYnckJ/jc1xdpxPC7MRzthOntRTAYlUUrbFWmJjRZkYHLYDQbUUGynRlq+7Wa/agjUunn8OtVknNfb8np6HYv46rgYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6689.namprd11.prod.outlook.com (2603:10b6:303:1e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Tue, 12 Mar
 2024 18:37:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Tue, 12 Mar 2024
 18:37:01 +0000
Date: Tue, 12 Mar 2024 18:36:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <fei.yang@intel.com>
Subject: Re: [PATCH v3] drm/xe: Invalidate userptr VMA on page pin fault
Message-ID: <ZfCgp9OhIO7sHS8+@DUT025-TGLU.fm.intel.com>
References: <20240311192045.852975-1-matthew.brost@intel.com>
 <3c16d6322a6d0127f9448c11a9b5876c688fe41d.camel@linux.intel.com>
 <Ze9lgpge9lcXpMoM@DUT025-TGLU.fm.intel.com>
 <171fbe6519745c112ee9d11e266e4953b8fb37cf.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171fbe6519745c112ee9d11e266e4953b8fb37cf.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db6fd09-b329-43b1-6cf0-08dc42c36828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F05opO4qxzaPLlED+AstJkVtlbx8OxScZxGj/qIqjHg4SC1qglxzUxINsMjIk24qfms39AQm1anBRZ5WNX/RgkOTDHyyvb3gyGAkPKSsSYyIH0pOhLxyjLfL9xoSG5OhOyr0RTJa668UptazKMl2Yl25QMaa6WsDvPmwCAEa13uRDl0ZF2l7YLahlEKwi9juFgg9pKepImRvxbS18YpDWLSe6ylhgW4n9AiZQD4tNTAFmDP16KlSRpdGnXNbT1Mw8+JMW8N2lHugFZp9Cda/SZcJtjmDf9BIOh7oAmyMOaFFAmQ+A/Fel9lL4QoDlTA7V6evpHdpD1OfvKryOEOj9hpm9zh4swesQHInzelqFgogAZ29Ku8Z3E/WFygANTkhKoOB2e8x8pYLgzobzvHpcrVZUsfd78k3uJThUhgNz4WnW3OtRZfXCWFL89MJNu5lVzwosurKvbr+1PYWts4WpdoALZ6bp5yTfUsODd318lb+uOAT7oGG+4qFWBFp7Cc94zrI8+vynlYuGonBPo52LXMKkctVZT4UKUkeceQUycQaxwQGSqfLS33k5ZI//2Rs2kVkX3xPdSqkx9TadjYeAoBWD2RiuWxlsJkHVyjyGPmzOp9qoBAkpUF0G3PIG/K3jyZM2ADekCIA645POQC0FtU0eLC3m/yyQf0NfEmy2C4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FMLLFzOWKnEOimG1RzmEwMaAncxFKMYzPF9PxCV7rxQ0ipI+B6aIX6cpJq?=
 =?iso-8859-1?Q?rpeC/FT+vCuTCRACXWq/nsh07vyebmu8UPslpXkTfz9hTLrK1vnnyHbeHh?=
 =?iso-8859-1?Q?AwXtcxojwK77Q32TXnEd/vpBn1sm8W+P3/5CPPNpNjInP6yyjIhLe4LPgq?=
 =?iso-8859-1?Q?jfgbRsKKv0jZ73F5ZAv7fupYrnq1PuWW+8ldyOEIUL+Kr1ASeIdp/a5V5X?=
 =?iso-8859-1?Q?qxBKf8R1/3xs9LlgOZK3P7tqsQDoqRkcFQ1IBSt9KxtQSZWUKZ02bbXrVP?=
 =?iso-8859-1?Q?g8UOmAB9lF8F/ov7pPfBjfqFUVVwnvCNJUggLyqU4UEExu8PY0iLjO5m+q?=
 =?iso-8859-1?Q?rbHOlzlHgHKsSG9iS/4Mv0mWoh1+qtSZ6Om3K4FtPcAYSdIOF8F4KE0CN3?=
 =?iso-8859-1?Q?JCCul6t04vsNAOjC3a2fjLyyxE1Ue63ID3QJa0ehfJTUQMFgiT3mSbKxmv?=
 =?iso-8859-1?Q?YO+Ia9gEcD4gYbuKX1n6CDmyorAr5QQbq9lRVo/ClHIw3arb5DwA7b8ZbM?=
 =?iso-8859-1?Q?AK1kqkJK8zDcWEbyMYQvALI0IYvI21pHefKjb1B5l0AmJSvh9GarlbSV4d?=
 =?iso-8859-1?Q?oErf6mF727L3ej4WppvFLLWKUFNrkbI/xEEoin2zYYLs6ouYp/OZLIczRf?=
 =?iso-8859-1?Q?9exB0UZoGJgaq96djlZ+vy98RNxSrkODZjkLNwnXd9VCA9NTpyuj63vF3J?=
 =?iso-8859-1?Q?0SHBs7IxtyI8rATGNnSkIPCdyeC94oKJ7vWqdaSAJFN9XKhLBmhRQB1hAP?=
 =?iso-8859-1?Q?w/xOckksQKFqZw3mhbNzEkw7Hghn4YKdnnFyLgzkHv3vUJUGnNwkszpy5a?=
 =?iso-8859-1?Q?1XpmRvSDyuiEJz+bPhWqAuZImHaokVYkytvQQoAsk/UmxaXNlS6WMARqZv?=
 =?iso-8859-1?Q?oO8asyD4ZgD9qQ0NTj/L5rnGvjncS9qinZWBzyFzW/1D72/R8veBoqZpAM?=
 =?iso-8859-1?Q?iTEmIABEn3/5Q/AeGIOO8ph53I9QaoXCxI70YOKH2nvTfL7TM0husLVUKD?=
 =?iso-8859-1?Q?Vbs9CwPYN1GSYfyl4OYMWIeP0p+u4qYZPw/8d/J9JcmToADBFWG10wbXZY?=
 =?iso-8859-1?Q?zGdC5kWVlgrhuWPRzei9SKSubrDNZ699vlqqavczThU4Oy//mIXswReuzj?=
 =?iso-8859-1?Q?bWcAecHdPd8qySrsdiAT7C6Ino1GrIpb+1mkM88EDqrK3QPi5MtHiS+vyZ?=
 =?iso-8859-1?Q?PE4P9+MN2XOrv+n2ZOn9nJwml4S5Q5Y8V7cJ4uuJoZt2OhVV4t74R+o8+e?=
 =?iso-8859-1?Q?+ahrUb0kGika558RVj80yQtCtIugqQej3VboOKwiwtFbk//oJrNkP++2ux?=
 =?iso-8859-1?Q?4FDxFDWtjDyEZAStXyy0VyvDSONDsSFOWhVOsdxdi6RV959RxGTN19u1a6?=
 =?iso-8859-1?Q?k/8cTryMX3oWWe6d+BYzJGgdLKP4KFTaWGXQtlBVRFlSjTXh5N5o3AM14e?=
 =?iso-8859-1?Q?0XwBjB9jYvJ8edv86R9aWeEEfngSErZ7C7Ds27WymcXbNXaij5DcGaF7j5?=
 =?iso-8859-1?Q?l5UhCqtB/LM9NIxHp+VuIv0DWiA40hztQ55teZkxTSx4NIibam1fADX/5e?=
 =?iso-8859-1?Q?n2hCC9/jD29bCxd1O8TE31lssO4IDe2SmCF3JaSFIyMihWX4609m4EAMv3?=
 =?iso-8859-1?Q?oDgH4Hb/qhNqqNLF63nhO3yFNVaIWtcvqOp+IIUm2zBn2asWjUF1InrQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db6fd09-b329-43b1-6cf0-08dc42c36828
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 18:37:01.4906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61N0i/TKTesgA4DTQfDUuQUNDSZd0X9kUeCDUCdsN3j1grymcGRkSgtbC6WAGZ+XsnsT02ILpNRv4J/0TwzsUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6689
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

On Tue, Mar 12, 2024 at 08:08:04AM +0100, Thomas Hellström wrote:
> On Mon, 2024-03-11 at 20:11 +0000, Matthew Brost wrote:
> > On Mon, Mar 11, 2024 at 08:47:50PM +0100, Thomas Hellström wrote:
> > > On Mon, 2024-03-11 at 12:20 -0700, Matthew Brost wrote:
> > > > Rather than return an error to the user or ban the VM when
> > > > userptr
> > > > VMA
> > > > page pin fails with -EFAULT, invalidate VMA mappings. This
> > > > supports
> > > > the
> > > > UMD use case of freeing userptr while still having bindings.
> > > > 
> > > > Now that non-faulting VMs can invalidate VMAs, drop the usm
> > > > prefix
> > > > for
> > > > the tile_invalidated member.
> > > > 
> > > > v2:
> > > >  - Fix build error (CI)
> > > > v3:
> > > >  - Don't invalidate VMA if in fault mode, rather kill VM (Thomas)
> > > >  - Update commit message with tile_invalidated name chagne
> > > > (Thomas)
> > > >  - Wait VM bookkeep slots with VM resv lock (Thomas)
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt_pagefault.c |  4 ++--
> > > >  drivers/gpu/drm/xe/xe_trace.h        |  2 +-
> > > >  drivers/gpu/drm/xe/xe_vm.c           | 29 ++++++++++++++++++++--
> > > > ----
> > > > --
> > > >  drivers/gpu/drm/xe/xe_vm_types.h     |  7 ++-----
> > > >  4 files changed, 26 insertions(+), 16 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > index 73c535193a98..241c294270d9 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > @@ -69,7 +69,7 @@ static bool access_is_atomic(enum access_type
> > > > access_type)
> > > >  static bool vma_is_valid(struct xe_tile *tile, struct xe_vma
> > > > *vma)
> > > >  {
> > > >  	return BIT(tile->id) & vma->tile_present &&
> > > > -		!(BIT(tile->id) & vma->usm.tile_invalidated);
> > > > +		!(BIT(tile->id) & vma->tile_invalidated);
> > > >  }
> > > >  
> > > >  static bool vma_matches(struct xe_vma *vma, u64 page_addr)
> > > > @@ -226,7 +226,7 @@ static int handle_pagefault(struct xe_gt *gt,
> > > > struct pagefault *pf)
> > > >  
> > > >  	if (xe_vma_is_userptr(vma))
> > > >  		ret =
> > > > xe_vma_userptr_check_repin(to_userptr_vma(vma));
> > > > -	vma->usm.tile_invalidated &= ~BIT(tile->id);
> > > > +	vma->tile_invalidated &= ~BIT(tile->id);
> > > >  
> > > >  unlock_dma_resv:
> > > >  	drm_exec_fini(&exec);
> > > > diff --git a/drivers/gpu/drm/xe/xe_trace.h
> > > > b/drivers/gpu/drm/xe/xe_trace.h
> > > > index 4ddc55527f9a..846f14507d5f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_trace.h
> > > > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > > > @@ -468,7 +468,7 @@ DEFINE_EVENT(xe_vma,
> > > > xe_vma_userptr_invalidate,
> > > >  	     TP_ARGS(vma)
> > > >  );
> > > >  
> > > > -DEFINE_EVENT(xe_vma, xe_vma_usm_invalidate,
> > > > +DEFINE_EVENT(xe_vma, xe_vma_invalidate,
> > > >  	     TP_PROTO(struct xe_vma *vma),
> > > >  	     TP_ARGS(vma)
> > > >  );
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 643b3701a738..19323b411cb2 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -724,11 +724,25 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
> > > >  	list_for_each_entry_safe(uvma, next, &vm-
> > > > > userptr.repin_list,
> > > >  				 userptr.repin_link) {
> > > >  		err = xe_vma_userptr_pin_pages(uvma);
> > > > -		if (err < 0)
> > > > -			return err;
> > > > -
> > > >  		list_del_init(&uvma->userptr.repin_link);
> > > > -		list_move_tail(&uvma->vma.combined_links.rebind,
> > > > &vm->rebind_list);
> > > > +		if (err == -EFAULT && !xe_vm_in_fault_mode(vm))
> > > > {
> > 
> > Just remembered this now. This function is not called in fault mode
> > either. It is called by the exec IOCTL (dma-fence mode) or preempt
> > rebind worker.
> > 
> > I'll delete this part and add an assert at the top of the function.
> > 
> > > > +			/* Wait for pending binds */
> > > > +			xe_vm_lock(vm, false);
> > > > +			dma_resv_wait_timeout(xe_vm_resv(vm),
> > > > +					     
> > > > DMA_RESV_USAGE_BOOKKEEP,
> > > > +					      false,
> > > > MAX_SCHEDULE_TIMEOUT);
> > > > +
> > > > +			err = xe_vm_invalidate_vma(&uvma->vma);
> > > 
> > > This can still race with yet another notifier, I think.
> > > 
> > 
> > Wouldn't another invalidate just add it back to the
> > &vm->userptr.invalidated list and trigger xe_vm_userptr_pin again?
> > That
> > seems to be fine to me.
> 
> What I'm more afraid of is if we modify state without the relevant
> locks held, although that might be restricted to the tile_invalidated
> member. But most probably the invalidation can race against itself as
> well so we might want to look at handling that separately.
>

Still not seeing a race.

This code path is mutually exclusive with any other code path doing
binds as vm->lock is in write mode. We modify the tile_invalidated field
here.

The notifier can run in parallel which only reads the tile_present field
and adds the invalidated userptr to &vm->userptr.invalidated list. The
list has its own looking locking.

Again all of this seems safe to me.
 
> > 
> > The lockdep in xe_vm_invalidate_vma would be unhappy though (I
> > think)?
> 
> I think lockdep should be happy, actually. It only checks whether the
> seqno is invalid and at this point it should be AFAICT, since we
> haven't updated it yet.
> 
> > Maybe we call a version of xe_vm_invalidate_vma here where the
> > lockdep
> > checks are skipped?
> > 
> > > > +			xe_vm_unlock(vm);
> > > > +			if (err)
> > > > +				return err;
> > > > +		} else {
> > > > +			if (err < 0)
> > > 
> > > And here we should've kept the userptr on the repin list.
> > > 
> > 
> > Yes this is a change in behavior but this change is fine as I think
> > we
> > try to kill the VM at this point, right? I can change it back if you
> > feel strongly.
> 
> If it's an exec and hit an -ENOMEM, chances are that the user wants to
> retry after freeing up memory. Not sure if we can see -ERESTARTSYS or -
> EINTR at this point, but we probably will once we make the
> mmu_interval_read_begin() wait interruptible.
> 

Right, will fix.

Matt

> /Thomas
> 
> 
> >  
> > Matt
> > 
> > > 
> > > /Thomas
> > > 
> > > 
> > > > +				return err;
> > > > +
> > > 
> > > 
> > > > +			list_move_tail(&uvma-
> > > > > vma.combined_links.rebind,
> > > > +				       &vm->rebind_list);
> > > > +		}
> > > >  	}
> > > >  
> > > >  	return 0;
> > > > @@ -2024,7 +2038,7 @@ static int xe_vm_prefetch(struct xe_vm *vm,
> > > > struct xe_vma *vma,
> > > >  			return err;
> > > >  	}
> > > >  
> > > > -	if (vma->tile_mask != (vma->tile_present & ~vma-
> > > > > usm.tile_invalidated)) {
> > > > +	if (vma->tile_mask != (vma->tile_present & ~vma-
> > > > > tile_invalidated)) {
> > > >  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma),
> > > > syncs,
> > > > num_syncs,
> > > >  				  true, first_op, last_op);
> > > >  	} else {
> > > > @@ -3214,9 +3228,8 @@ int xe_vm_invalidate_vma(struct xe_vma
> > > > *vma)
> > > >  	u8 id;
> > > >  	int ret;
> > > >  
> > > > -	xe_assert(xe, xe_vm_in_fault_mode(xe_vma_vm(vma)));
> > > >  	xe_assert(xe, !xe_vma_is_null(vma));
> > > > -	trace_xe_vma_usm_invalidate(vma);
> > > > +	trace_xe_vma_invalidate(vma);
> > > >  
> > > >  	/* Check that we don't race with page-table updates */
> > > >  	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> > > > @@ -3254,7 +3267,7 @@ int xe_vm_invalidate_vma(struct xe_vma
> > > > *vma)
> > > >  		}
> > > >  	}
> > > >  
> > > > -	vma->usm.tile_invalidated = vma->tile_mask;
> > > > +	vma->tile_invalidated = vma->tile_mask;
> > > >  
> > > >  	return 0;
> > > >  }
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > index 79b5cab57711..ae5fb565f6bf 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > @@ -84,11 +84,8 @@ struct xe_vma {
> > > >  		struct work_struct destroy_work;
> > > >  	};
> > > >  
> > > > -	/** @usm: unified shared memory state */
> > > > -	struct {
> > > > -		/** @tile_invalidated: VMA has been invalidated
> > > > */
> > > > -		u8 tile_invalidated;
> > > > -	} usm;
> > > > +	/** @tile_invalidated: VMA has been invalidated */
> > > > +	u8 tile_invalidated;
> > > >  
> > > >  	/** @tile_mask: Tile mask of where to create binding for
> > > > this VMA */
> > > >  	u8 tile_mask;
> > > 
> 
