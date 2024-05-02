Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8BCC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 17:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3202B10F46F;
	Thu,  2 May 2024 17:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8kbleLV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236AD10F46F
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 17:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714670465; x=1746206465;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=q9AEanbwSvVTAzHKYkyE4v4PEhPMYeALzsH+frQH0sU=;
 b=B8kbleLVAIfJABX/4TIg/23Sy8Ut9MSiJyUzTFrb/uKEwq2NYYlXKnAn
 TJT3AsISxrdC5RfTYfS2rDbnj0cnWGgf+Io4hu3DtcXIOd0EEsLZoQme6
 +zwun5+BP29sfyHCI9wLL+/19GpubtBwR75qIMX44U1jVHiNiR+pnCkka
 domxf6aC9xc19P5juXCKIr3RhG4WKqgox2j3tontx3uZZlVBDypFb2ITE
 ejmBHIdfD14Jb6RV69zuIUCU82SC+1Xm7J9G+plQb5q4WdOEfcAC+Kav/
 MmJg9dajLPbUqMs3nX378pWT4QXNOzmw3/8NpuiC+slkBYASzSFm+/N3f Q==;
X-CSE-ConnectionGUID: TqS15853RVuqO1CiZC0NtA==
X-CSE-MsgGUID: ++Blj2oWTQKbcwWZRlRn9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10577610"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10577610"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 10:21:04 -0700
X-CSE-ConnectionGUID: envlV/SlTsqk9RpCSrpSSQ==
X-CSE-MsgGUID: t+YO0Y0zQUe80/FkglQveg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27165990"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 10:21:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 10:21:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 10:21:03 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 10:21:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+7wjr4VCOLPhq5R2enB9GsHn5U0WsCjk41iHoJ721hCPeF2+LgctO78KtFgz17fxI4CJOqBADtz2lXcSqWiIrgZ/YmZY1f6+PFcBNAb7bNM8Iyu0xB0I3PgtwiGsRqs6lebgGyxG1N2v064IaounR3Ir9LfeAVt4JZ4BIH7BzxreNenjQ6yXSIqtAzExy2Q60SI6qr3dm38oA9ubpAeuRoU8YxnsehKSebW8Of+YztzL8K4TujQX9U/x71eni7ENhBxR4VFWwYCt1ui3qeqi3NKBj589oHIwOqcnbQ69U8GCv9C0UFPUi+r/emOxRfOcPj/1/n7PjU/AJ0L9l08Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tx0tKPsy4xn5L9Kr2hcw5VGkbnQjGDyeZY7bCcnUxyQ=;
 b=Go1DJtb2vsFf16mn5mvS52+WpNK24D2PT40fFcHX3oqCoxva8wsOG6DJdb+bl0fDCwwmYrX/KsgemEJZHsd8NDmlC9sEhr2RIvVMaXGR3XDZu1N3FRf9Rg4RDsjwukDcqgN1WPyhz6IFVNMGu6U/xlKGI0x6Dq5YStiPtT9atAz8smJ986kEPdpicHWZLaDzglGNhwrsRCKBAof9Gut5F0fh2WAQeyF0YRcO30ukZaywDziCLjVndYtZTvNhqXy6/vf3TAQEWY1MGLhxRAsfER3oRh+27aiY82+ax9/PitRGtINbCZZDCUrCbQ7yWXyeylY99YRVpBPXL/BL8mpscA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7246.namprd11.prod.outlook.com (2603:10b6:208:42e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Thu, 2 May
 2024 17:20:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.023; Thu, 2 May 2024
 17:20:58 +0000
Date: Thu, 2 May 2024 17:20:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Perform dma_map when moving system buffer
 objects to TT
Message-ID: <ZjPLa8H08IVmR6Fe@DUT025-TGLU.fm.intel.com>
References: <20240430120214.5372-1-thomas.hellstrom@linux.intel.com>
 <ZjEgowaMK2IUexXO@DUT025-TGLU.fm.intel.com>
 <203d2774f5f901041bb9d20efd759001f968ffdf.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <203d2774f5f901041bb9d20efd759001f968ffdf.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 7525f880-3a91-4653-2f61-08dc6acc3b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?udHbfCOlGQWqMVlPW2xcouJhHQupKbO6R2hiKRfi+WtAZWN6eCpQJ12DA4?=
 =?iso-8859-1?Q?bPFUT2MgU0HSJH4xFnF3P5YFkpTGDELlWsNK+d4qjZFcKz5wTf/9zQZFMp?=
 =?iso-8859-1?Q?Mo7Hr2jwqw9Z9Z/XkdGc6XWMxjWRWeywwKFr9JsHUZCbyiXMoNdtm9i3OY?=
 =?iso-8859-1?Q?++Wo3PRj0dbHam+4uZ6xZ2YNtHeVA9xrQMaaq3rsefIlCH0oLQioTcEc+/?=
 =?iso-8859-1?Q?jQKsWKpL3QYig7K9EMblJ/yCZgaKI3V64+Omr5Gspz4wJ6lG5roROezhNo?=
 =?iso-8859-1?Q?TwuIp4jms2aoM4cbFHNeneSl6h2cm45g1PjKhjsmtJluuWn/qtrQycFilq?=
 =?iso-8859-1?Q?EyvNDl6gXEDet8hE7fb4qtDY1gRtHIsy2n5lnNFgIdbtXL5/jcKbGsi3rZ?=
 =?iso-8859-1?Q?zE92XiFsjE9bnwfYWcoZqbo514o01C0f1o9L5jmMyBeXyxl/JUzWZvoE4X?=
 =?iso-8859-1?Q?hb3LpvH+IiI1AHo0i2F9USGJ5INHX2gAlaYIs7Cs6Yfkd1bDZ5/5WarmuN?=
 =?iso-8859-1?Q?uI1yRRZJWU+d+EL2rEY3fWosQrESk9CYOsMCzklJtT4YZIjyZLLCvog+58?=
 =?iso-8859-1?Q?SB64sw15vtPW22g0Q5S9aRhauVrJ/Vq4DhA+Q2X9pz8ztoTCov6Z3Mwbgu?=
 =?iso-8859-1?Q?1uEfDYVCcxg/BMtlfH6Jq6Hoj9zcKzzDUmjjnr3+7+onfzWK5oWRdI6xKQ?=
 =?iso-8859-1?Q?QH3rZk8UjnuzZXln9UV9Q43iL3Igms7u2DHXnqfRsu28p0pcYWtsEtGrfN?=
 =?iso-8859-1?Q?zDxwQg9clLmFiuTgIDslgSw/b5vIy9FcLyhWk7VoduyUqjTwjMkTUCZLn7?=
 =?iso-8859-1?Q?lZS984xbIls7CexzaB0ISfhBx5py7TH9GBgmMmahuVqIdsOsb+QcePXn27?=
 =?iso-8859-1?Q?KHVRZO831tbeFQpwtNfccBDWfbabGrXjIIUWaECw7lZxy4cT63qh1GyOOU?=
 =?iso-8859-1?Q?ClTcJRUC6JIXv1M9SBu4dLgQTx9S395x9w5n52lHnz8Ayep9pZOKlv16qW?=
 =?iso-8859-1?Q?AUKJwQnaj8sbeYXZkbyzDwvsp66V7lKzPFOsb0fVnhZFnzPKV9Wpytudxg?=
 =?iso-8859-1?Q?3KGroorfjTWht4PI4icL3ZV6tutxsrrlHyTydMem50jgkJWiuS+nHS67cO?=
 =?iso-8859-1?Q?4oV/Xmvey37ofbDtRXcmZYDLCC8+Uj+CZxTBWNDPeCJaitGR4LhXKUiW6v?=
 =?iso-8859-1?Q?YQiDlMA3lqhmPO47tuJR8tTmqvQlDIr2Ljps+4Kre4Sb/nKpoxbL688Pwq?=
 =?iso-8859-1?Q?9NSmu0tpSiteRuEj4RwrjzYcaubqAmjaugkIE4I8mQqBw+hPsISlB79I7i?=
 =?iso-8859-1?Q?IhfpDhc9WCXjLdFnFHj0+IIUHw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DgRyWJwBj8Qq/geAR8C10aoSStZimHFgZLM3i2WEgws3pLpZaRTwhtetc3?=
 =?iso-8859-1?Q?BV5EGLZepeiyoJwb9LOgMjHXLrUOAbai0RiezZI639BwM766SfYwzxzm9k?=
 =?iso-8859-1?Q?6Pfjg7Q1TwcpY5DGPaSIpyslxhR2ICd9De93kh3yEMyMTroivwWA3od+AJ?=
 =?iso-8859-1?Q?mQKNwP0WweVqu/RNY41CnHS6AWhQr5JgpvyjlQs7XT7X8U6Zr8w87tBRt/?=
 =?iso-8859-1?Q?k+11ZZ8HqqjeIkV3G8Z23IUZ9qFUt4TLLSy2kIAvERUIkSJ1BUnv1qHf2E?=
 =?iso-8859-1?Q?tkB8kDkve3vFzmd/kIti7k31jnY3weYzntpkHmT951gpGvTJxp2mKjchZt?=
 =?iso-8859-1?Q?OlOdO/bl0ff27CQllTDSnfMpuWPpGNW999PeFfgROj5IiJWNvlXxW4YYu7?=
 =?iso-8859-1?Q?vubBNQSM0SsRWRjcpLBkiUG++AyWoEQJbDowev897YDeI60yBvWQfe+qKA?=
 =?iso-8859-1?Q?SOyYPizu3IXS3uXOcaXLxmfROh08vYs/27azbM2rOIK/l1imJak6ycDnwB?=
 =?iso-8859-1?Q?iwZ5HQ67ReGX+ZMGuB4UlM6RWorFwf2rAd4jEA1g6OjDFs2QwpeCzLxnbZ?=
 =?iso-8859-1?Q?RAuNysi7zjkOJDjcXCTsHiSZgEdevhWNNoGRgGlIF1bPdHKVdIudxUvTWJ?=
 =?iso-8859-1?Q?F6hWcWpxJODdvKLI9EY35Ti7RObSaC9nQvfcjTlFFG3wPCK20sRADYPBV1?=
 =?iso-8859-1?Q?I0XMHgB7AibQlE9rrifzJWQM6kAryFrxLO6L1b5Xl+zUzEprgv2Je1eRwG?=
 =?iso-8859-1?Q?qiZCic4SyybjtALS9gU/agi7rcrlaQikeNXQt+LhXEMkTd/2qX8ojACVJB?=
 =?iso-8859-1?Q?4XtrgntN5tbj+fShzjzeKrJ2VdsYhzplGG5MLdLwz+qWBfMvjhB9fpB35+?=
 =?iso-8859-1?Q?2GAeCmhDjOacx6jhYttQ1hTfxTBADkZRFB1pL54ao2c2X50wMgpUcS06+T?=
 =?iso-8859-1?Q?jo6CnF2UARPOEpcYcDbOfh0LoBx3g9iB2c9ml8PSm2wZyUTPQeMYo7Uoa6?=
 =?iso-8859-1?Q?TyR4AR2K/685qk1wTChKMcNXa2K1omJVY0m0RMg5Z4mYSL/NzjoJTaOfYd?=
 =?iso-8859-1?Q?Z6PbaKcvA1S16bj9I8S2a2U5KjF1r9CbF6/3RzzHBiMPs6V+TZpcQnfjk6?=
 =?iso-8859-1?Q?ENEVeeOVWOpa9KQHe4Ow3QMtKm4StW1gkdwE30KRXlpDxR1/VQw37TtMoZ?=
 =?iso-8859-1?Q?pDthSmTkK2c6CQOi7K5cuwy6qX772ZpLA4fwBbDzuzjLdRQCy7+3iqp2t6?=
 =?iso-8859-1?Q?bpPFfthmPJbqdEGs65whIv+aG0Yae5qVJeiqYLL8KBbmaQIY9ogLwl42IO?=
 =?iso-8859-1?Q?Z9wGaF7j3R2W3NxR2Y84HodmAlG/y/N1RWQl0GQ5UrSItMwX+e7EmRzzFQ?=
 =?iso-8859-1?Q?5ViEx0IKWZ64TpN2Wob9cNfKrkJQxUDqcLclSZl2+d129uDYcNpAMFhFzy?=
 =?iso-8859-1?Q?atcYlzs0OkX4QpJTnU8HDxNXn6fdCvxYybMG8gkW8KGQTaoMfjRcaidLOn?=
 =?iso-8859-1?Q?agJqUvZC4uf7cSVikkGxGgqc8oeln7msYvAObBEwd1Py1COn7yiw+lCETT?=
 =?iso-8859-1?Q?HQpkfgiPmwe+z0d6PUxpgMZSxUM8EtdlRSLqTT1yQV+kbwDS6tCcbPW2DM?=
 =?iso-8859-1?Q?Ci3IWurIJv47kB995s3bUolmEZyhjSzA/PidE8bVr3Ay0hEgTtz8avpA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7525f880-3a91-4653-2f61-08dc6acc3b8a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 17:20:58.6094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWe+WCrYsI+UiBjnbzOReVsr9qb3b+dHvATyWUo4+TULufK+GogsmCDmU/2BKGY6qiqHTwjWD9uYF9NnUcsLHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7246
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

On Thu, May 02, 2024 at 01:31:37PM +0200, Thomas Hellström wrote:
> On Tue, 2024-04-30 at 16:47 +0000, Matthew Brost wrote:
> > On Tue, Apr 30, 2024 at 02:02:14PM +0200, Thomas Hellström wrote:
> > > Currently we dma_map on ttm_tt population and dma_unmap when
> > > the pages are released in ttm_tt unpopulate.
> > > 
> > > Strictly, the dma_map is not needed until the bo is moved to the
> > > XE_PL_TT placement, so perform the dma_mapping on such moves
> > > instead, and remove the dma_mappig when moving to XE_PL_SYSTEM.
> > > 
> > > This is desired for the upcoming shrinker series where shrinking
> > > of a ttm_tt might fail. That would lead to an odd construct where
> > > we first dma_unmap, then shrink and if shrinking fails dma_map
> > > again. If dma_mapping instead is performed on move like this,
> > > shrinking does not need to care at all about dma mapping.
> > > 
> > > Finally, where a ttm_tt is destroyed while bound to a different
> > > memory type than XE_PL_SYSTEM, we keep the dma_unmap in
> > > unpopulate().
> > > 
> > 
> > Makes sense.
> >  
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c | 45 ++++++++++++++++++++++++----------
> > > ----
> > >  1 file changed, 29 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index bc1f794e3e61..4c1dd67a4588 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -302,6 +302,18 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
> > >  	return 0;
> > >  }
> > >  
> > > +static void xe_tt_unmap_sg(struct ttm_tt *tt)
> > > +{
> > > +	struct xe_ttm_tt *xe_tt = container_of(tt, struct
> > > xe_ttm_tt, ttm);
> > > +
> > > +	if (xe_tt->sg) {
> > > +		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
> > > +				  DMA_BIDIRECTIONAL, 0);
> > > +		sg_free_table(xe_tt->sg);
> > > +		xe_tt->sg = NULL;
> > > +	}
> > > +}
> > > +
> > >  struct sg_table *xe_bo_sg(struct xe_bo *bo)
> > >  {
> > >  	struct ttm_tt *tt = bo->ttm.ttm;
> > > @@ -377,27 +389,15 @@ static int xe_ttm_tt_populate(struct
> > > ttm_device *ttm_dev, struct ttm_tt *tt,
> > >  	if (err)
> > >  		return err;
> > >  
> > > -	/* A follow up may move this xe_bo_move when BO is moved
> > > to XE_PL_TT */
> > > -	err = xe_tt_map_sg(tt);
> > > -	if (err)
> > > -		ttm_pool_free(&ttm_dev->pool, tt);
> > > -
> > >  	return err;
> > >  }
> > >  
> > >  static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev,
> > > struct ttm_tt *tt)
> > >  {
> > > -	struct xe_ttm_tt *xe_tt = container_of(tt, struct
> > > xe_ttm_tt, ttm);
> > > -
> > >  	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
> > >  		return;
> > >  
> > > -	if (xe_tt->sg) {
> > > -		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
> > > -				  DMA_BIDIRECTIONAL, 0);
> > > -		sg_free_table(xe_tt->sg);
> > > -		xe_tt->sg = NULL;
> > > -	}
> > > +	xe_tt_unmap_sg(tt);
> > >  
> > >  	return ttm_pool_free(&ttm_dev->pool, tt);
> > >  }
> > > @@ -628,10 +628,14 @@ static int xe_bo_move(struct
> > > ttm_buffer_object *ttm_bo, bool evict,
> > >  	bool handle_system_ccs = (!IS_DGFX(xe) &&
> > > xe_bo_needs_ccs_pages(bo) &&
> > >  				  ttm && ttm_tt_is_populated(ttm))
> > > ? true : false;
> > >  	int ret = 0;
> > > +
> > >  	/* Bo creation path, moving to system or TT. */
> > >  	if ((!old_mem && ttm) && !handle_system_ccs) {
> > > -		ttm_bo_move_null(ttm_bo, new_mem);
> > > -		return 0;
> > > +		if (new_mem->mem_type == XE_PL_TT)
> > > +			ret = xe_tt_map_sg(ttm);
> > > +		if (!ret)
> > > +			ttm_bo_move_null(ttm_bo, new_mem);
> > 
> > Random ranting, ttm_bo_move_null is a terrible name. It is freeing
> > the
> > old memory and assigning a new one.
> 
> I guess it stems from the move operation itself being a no-op, and at
> that time the resource assignment was only a metadata update...
> 
> 
> > 
> > > +		goto out;
> > >  	}
> > >  
> > >  	if (ttm_bo->type == ttm_bo_type_sg) {
> > > @@ -650,6 +654,12 @@ static int xe_bo_move(struct ttm_buffer_object
> > > *ttm_bo, bool evict,
> > >  	needs_clear = (ttm && ttm->page_flags &
> > > TTM_TT_FLAG_ZERO_ALLOC) ||
> > >  		(!ttm && ttm_bo->type == ttm_bo_type_device);
> > >  
> > > +	if (new_mem->mem_type == XE_PL_TT) {
> > > +		ret = xe_tt_map_sg(ttm);
> > > +		if (ret)
> > > +			goto out;
> > > +	}
> > > +
> > >  	if ((move_lacks_source && !needs_clear)) {
> > >  		ttm_bo_move_null(ttm_bo, new_mem);
> > >  		goto out;
> > > @@ -786,8 +796,11 @@ static int xe_bo_move(struct ttm_buffer_object
> > > *ttm_bo, bool evict,
> > >  	xe_pm_runtime_put(xe);
> > >  
> > >  out:
> > > -	return ret;
> > > +	if ((!ttm_bo->resource || ttm_bo->resource->mem_type ==
> > > XE_PL_SYSTEM) &&
> > > +	    ttm_bo->ttm)
> > 
> > So this is covering the case where we have moved to system and had
> > pages.
> > 
> > What about the case where evict fails after the 2nd instance of
> > 'xe_tt_map_sg' in this function. I'm guessing xe_ttm_tt_unpopulate
> > covers that case?
> 
> Yes, in that case we have a struct ttm_tt in the PL_TT placement. It
> can either get moved to system, or more likely get unpopulated and
> destroyed. In the latter case, the dma-umap happens in unpopulate.
> 

Thanks for the explaination.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>


> /Thomas
> 
> 
> 
> > 
> > Matt
> > 
> > > +		xe_tt_unmap_sg(ttm_bo->ttm);
> > >  
> > > +	return ret;
> > >  }
> > >  
> > >  /**
> > > -- 
> > > 2.44.0
> > > 
> 
