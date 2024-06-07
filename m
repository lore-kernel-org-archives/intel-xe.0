Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF7FC27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 15:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A383B10ECB1;
	Fri,  7 Jun 2024 15:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kr2xFLsK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65BA10ECB1
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 15:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717773840; x=1749309840;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3Q5DeaMfTBL6AcxykPAnJfQgTaPYz7hiePzTMST2h1A=;
 b=kr2xFLsKpVDMRXYU9Ho53Gd8ls+45sdGxtXn+ml30sQf8zhFd37CSURJ
 W3iGO6G4JynHJ+m4wlKefxIje27WqjZMDR9zj45uKNAEof612ENrN1Ifv
 IXqaOl59LkEda/JQXDIxAgybroFInEq9kAH0bAr4M2L/KYPWcN71Rr8Fi
 evgS2TB6e+g9lOObVusPgBR7tYnB/perX4Zo2TG5w6CxBEFdDQkxaJ0jS
 dfaGwUo+ybovTLwgLWZ9HB1GHMrZ1KziLZOXdbGOCu3kjvnwWTCEaNHb5
 Yf2J3KdIDTZMvkvOEUKG7abV7DX1Yyg/QWMpB43FoXchm6IevN6eYTwe9 Q==;
X-CSE-ConnectionGUID: yWFjNU5HQKKwLgz7GJ3MKQ==
X-CSE-MsgGUID: tkkU4gDSR1uwduSYnW7CTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14384145"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14384145"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:24:00 -0700
X-CSE-ConnectionGUID: TXWO3rIETEilf+4x/hGLIw==
X-CSE-MsgGUID: 7/+jJfSJS8CGKcVbfqdnVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="61555310"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 08:23:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 08:23:59 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 08:23:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 08:23:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 08:23:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAjso0beiabS5xY93MamRGueLlbOqERcG6NL1DyarngHayhkDenfeAHEn8mraxyi7s+UZUZP0WraN4Xi2hl5riGJ6bsPl8c40+NZiLfi+QRIwnKU4o/+M1aWYctuLIpxASEAxajbNsrO8BehLsKcb2PVAZ9ne9AQZpCjtsr2KCiLWZsiosz4rIualz4gSUkpp6l1I5pVwvcJu9xKfhZx/QXI1Wp/Aa1J4ykWr3QRwClLNSCot5IQgCYhOTX1xyssvYTj3pcIWsnDII7NBC2zOjXLCIHB32DisphZEYywMVmuZJYLvQoQriU3s8mNUGqwu0CHDMP0TPvdgONltODN8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsWqg41gpYNBFj1nrnW/0VBtgMJgg2EIsjeoj+cyvbM=;
 b=LfjD7o4flHRD4aDdPIfW8Cdtrf2PXKe0BOTCOjcOFqmOjk9wMlnnbMdRu8bQ0m/JxdhCHpxri0wzXo+YJ+wWOIWvdjeec9rUDSE2ki3yKgUf24yFE3C3AETrdPnwSSCIf5+oR75GSJ0h4+k3GAiDOMrue/DFQO/2601Xzmd7zNHyZQYDGAYAimzV42X7aIfm25jCoiSjkZoVzZl+TBEsEI/AHf8kJOt8stChLgOGtO23N5kl82jEnQahKVQ8TJxpdGELqyP6uDWV9Yf2kP3IR5L5H/FCeKFm1sqWmWo8pXEJOZQX3Z5HCgcAnECrqwey3gzWAE3JAsQ+AN8aWzWLTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 15:23:56 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%3]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 15:23:56 +0000
Date: Fri, 7 Jun 2024 15:22:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [RFC PATCH 2/5] drm/xe: Add MI_COPY_MEM_MEM GPU instruction
 definitions
Message-ID: <ZmMl0rCBHnw8gPZz@DUT025-TGLU.fm.intel.com>
References: <20240607065219.2264624-1-matthew.brost@intel.com>
 <20240607065219.2264624-3-matthew.brost@intel.com>
 <2dfb69a3-d74f-4988-8643-b9801b343161@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2dfb69a3-d74f-4988-8643-b9801b343161@intel.com>
X-ClientProxiedBy: SJ0PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::35) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|LV3PR11MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 57460d06-1d42-4532-e5eb-08dc8705d8ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q/HA77tDsAO44tSvbTGj8K0U3VZxLEgfx4ksrrz02nAu7XUlQgWjz0lvXrMw?=
 =?us-ascii?Q?kGhghcQjSKi75BK0q8VcCd+0mMC70Kvi8zuQ68VBQkcedeQ7R1vVRxlgWNUD?=
 =?us-ascii?Q?utj801ZloZQ7a9AvERkymI9K+BZB0+cDnIeVapt13rHK+6+SJAJAvcT2XJoK?=
 =?us-ascii?Q?HU2tgsU4SHjOx55y2EHFa/HqfWRIp8aHvU5JLwFRuUbrHZQZSbBGwPf6twbU?=
 =?us-ascii?Q?ccixH3dLeT9XokOn16CQhmrWKPitVQEbG/xjmr3SK0QgAgSEWHf+u/8tUQze?=
 =?us-ascii?Q?2Jgjkuy2RXKQDqjmVgKCFl8FYJwEOBOy0Gbc457aNeGnbS2DsPn/rp8wvyxR?=
 =?us-ascii?Q?ZRa9NmcNWzUJhP7gsm22FMFQF+PHKeyPj+UeATEKIPCXOn1mQXhJXuoRMiFJ?=
 =?us-ascii?Q?jOWgeAxoTX98sxqjAOiQryDCUpi16iOn0qk2yZYR05fLHa8GSNJlm6ymyYSU?=
 =?us-ascii?Q?u8791kRtA+RJa9HLuHjWQc0YdLfYNOM7xSVLGKvlczjt6OrE6RueB2CFjGPK?=
 =?us-ascii?Q?eF7L5e4n+0U2xL/gJSPWYPm6Jt7gMKDe6WNYBXj1Aebciuzxwtxws/WrIsGP?=
 =?us-ascii?Q?nKzaH0sNcP+yb76FQ/IzjRHSgkf35W/1ITOb93hTysH4FPbiEbtiwHiJm+Hy?=
 =?us-ascii?Q?BqVvQ3J4cvetmCvcC1djZrSE3311oOT7rAbWT2pOOhwNjAduh3NMpRlpDb82?=
 =?us-ascii?Q?dcF6wdzsMgalfTy4Et6wVrDXD+749ITZte2UCqETUqUp29tnYdn4Io5cI65N?=
 =?us-ascii?Q?DzsX7PYHpyDzX+sege8X9v5YCpUAp2+z7YSBozt7JQ+6xjENwLbn2xHLL3Bk?=
 =?us-ascii?Q?Xdz/8JgzdQTlAwxVbMgUhnmCkXIeggQAB3N96fL4EKRCNWY57NKRWdMCqM1P?=
 =?us-ascii?Q?jAiv0XDOjvmWU1go8079gSl3eE5IzmrhlFESKlcl3J4amY1HlCdA1hFdrb7j?=
 =?us-ascii?Q?dEdg7TyFhq7d2kLMT0MXJNX/EHPxqrDAbRIe2MIhZaZ8NQCUMy0E0M8hz0bf?=
 =?us-ascii?Q?JOMXug2GiKTaLp9FQ6gzRLMqTumfZ0jrKa6aG+YU2g8uYLwd8Jl0QVhw8oEc?=
 =?us-ascii?Q?U845rYK55Ria3SDM9dVV5cIaLJG9w1SaouLSGjDaPK9aZ3mj0IllIS8yVu8c?=
 =?us-ascii?Q?e2YgaIqF+JnitGTijwZWAd2WYHwx+/CWGT7C2YCW7UhUKek5y+SDzw6xrI1t?=
 =?us-ascii?Q?HL9aGhslTmAogQIWBR8MQJqC07gGJjyDECBLItx+/9NgOtwOftk3PJfgGlu2?=
 =?us-ascii?Q?oNpR5csoPdPqXCrOXvPZVcMfL8/cOZE0ygBsj6PeV8/MhzUORJWDgDVA/2YP?=
 =?us-ascii?Q?aWhGcdzdPWhdPmCtrcbYBYE/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ytuj95RKRvSF5JV2TWwkdmrdMCwFag3Bq0VxJWsaqpgOPQG3OaKljpy0q7QY?=
 =?us-ascii?Q?IiBLpNQBErB58EbFu1QHf2sf/aAp7ogRLJoZpV6XmydZsuNndsmrFzcIIim9?=
 =?us-ascii?Q?dMtwg+Bl9/XWOQ3dyqoUjl7om0xjePuW8/t40ypjqcRXrun0jHT0l1clG1di?=
 =?us-ascii?Q?8ma5Tw2RwpNBxO+R1QCSp04Lf32njfp7oOsKl8yBQT9Eymgx/C8a6ja5IOHw?=
 =?us-ascii?Q?nbaFGspY6Skq8/9zo8zm3Syi/Moj/0MK29jBnwpVOjZrqVcwT2YC5zfRRsZM?=
 =?us-ascii?Q?qMZJI3veyUmMpbcHUzse1tpknFGNWmN4dqDuDzKnqBpehYIUSMJxmOWZkFGD?=
 =?us-ascii?Q?Xu1YNYMe6dHDvhyCtVMe8wLkz2atq+a2xyUuaRNrjbmYp12pJUwpRVgkuzvy?=
 =?us-ascii?Q?j/V1Myrn4WOYuBzOb99e8vSsF14I4+m7M0os0AdPG/OqDTxUEk2efvYvKhmA?=
 =?us-ascii?Q?wywz5WLqoplfnE3/8prft9ZZg/7v2Du19wXWUxOV8MCEdXl6UQP4LEW5+wzT?=
 =?us-ascii?Q?m+NL8UzhgnVTLiIs3NyTnNF/O4TzSLM4bZHWZE7TIhZOC+bdr6e/TzTQNUAS?=
 =?us-ascii?Q?IKQ2F7jQXQ3u4I+vrkEdZ/qNVvc/NV0xChSFbyeUbDtoFDazxBnRVmNaubKm?=
 =?us-ascii?Q?RiNArsTTl4UUXnbVLfo/kKWCkHKLMunttqjXct8CfCGjLia+uyqEtLZXcz79?=
 =?us-ascii?Q?A9DF4KXTUrYIqE4KawJq23VVIlJBqZhRFiEd3Qa5RhDXCRYlNwWzcftEJKBs?=
 =?us-ascii?Q?wl72CgKniUCNic8kDHHqCNC+UA1iCBMx7nwLzm6+h1U8OqGZjIbGTGeuiLa0?=
 =?us-ascii?Q?fOe6dnIQ2Hcn7IjIXWUvezehFAX8KpPc4Xq8BKFPLDXPE13VAM6mvlBHB0s9?=
 =?us-ascii?Q?gK1x6BJ7YW3wk/hzjiuInAE/geK1mwRKUQ6gYilroJQ1n0LEpbTqeyMZCEzD?=
 =?us-ascii?Q?73+5nUAYIDAy4g5YgSxHNOwZe+YlU5EFJriMSFNjPf00js/b+cCQwfB4pIcR?=
 =?us-ascii?Q?abYqIQ4bdRffTZgQj+PtGLVMlnySZLOMD4GeLNtlrSd8DeYd/HugH0X106Qu?=
 =?us-ascii?Q?paSl0779BrKYCtlG7RBViZBRagRzj2c8e1YvhPPnvdxk/oMhXgjWnZzQH2AS?=
 =?us-ascii?Q?G/ZdK92FIFtCJOyawsE6QP+6LbhlH83SHsmot6VP5r0tFtKwgUDL1quXbuDF?=
 =?us-ascii?Q?lZMTOK8mT/On4xu6TzxGB47XR4kudpDE/sOwRdBUoYfQXuBDGK+eueE1QsrN?=
 =?us-ascii?Q?AzosBDrFOAnmy7oojxv56mSNqmfdTYctWvl3zELs++9UcsZgowbriXLZBB/Q?=
 =?us-ascii?Q?17NT/MPAPkSeMLbZr8n5GC/Jo3sTGPmpmLPf5Pz12tYaGBBIJ4sea5tlHepF?=
 =?us-ascii?Q?CAuy/s3PoMskaJB51FOe//MD5pxQRWehUq2qLMQ6ucM/in9/DM6Qbt/CpeeL?=
 =?us-ascii?Q?Y66fXDTOoC/mv6uduiWKII07bdwKS2iX8VoKKcR4RNDs1d3yC3IcB/AvbqO8?=
 =?us-ascii?Q?agk4Js1XUfuF/RhOF+aGpZAqkLMU/USaTaykwZ5mSvZZhKC4txPz+9vIwu2r?=
 =?us-ascii?Q?x7g6VkTILHTP4GJkPySZm9DqQtdU8ywnOkA+uat8hNi294XoudFDJURS6H2o?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57460d06-1d42-4532-e5eb-08dc8705d8ce
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 15:23:56.2669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YG4wZiajY0khKyUifVOb9Kk9wwXwiMeYDhCCY3todj+f4YeSPkfEYJCcIUwkH6gD1F/Qyv7bEK/qsEABLXqIwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8602
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

On Fri, Jun 07, 2024 at 01:04:27PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 07.06.2024 08:52, Matthew Brost wrote:
> > MI_COPY_MEM_MEM GPU instructions are used to copy ctx timestamp from a
> > LRC registers to another location at the beginning of every jobs
> > execution. Add MI_COPY_MEM_MEM GPU instruction definitions.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > index c74ceb550dce..f3deabb18ce4 100644
> > --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > @@ -56,6 +56,10 @@
> >  #define   MI_FLUSH_IMM_QW		REG_FIELD_PREP(MI_FLUSH_DW_LEN_DW, 5 - 2)
> >  #define   MI_FLUSH_DW_USE_GTT		REG_BIT(2)
> >  
> > +#define MI_COPY_MEM_MEM			(__MI_INSTR(0x2e) | 3)
> 
> all instruction definitions shall be in the opcode order, so move this
> one with 0x2e below 0x29
> 

Thanks - Will fix.

> and maybe instead of plain "3" better to use magic XE_INSTR_NUM_DW(5) ?
> 

I figured there was macro for this but wasn't immediately clear what to
use. TBH I don't love using a macro like this as it is quite clear in
bspec bits 7:0 the only valid value for this instruction is 3. Now in
our headers we have level of direction... I guess using the macro makes
more sense in variable length instructions but this is a fixed
instruction. Anyways can change if using the macro is the consensus.

> btw, IMO this latter macro would be better if defined as:
> 
> #define XE_INSTR_DW_LEN(dw)	REG_FIELD_PREP(GENMASK(7, 0), (dw))
> #define XE_INSTR_SIZE(size)	XE_INSTR_DW_LEN((size) - 2)
> 
> so for fixed instr length we could use XE_INSTR_DW_LEN(3) as in bspec
> 
> > +#define	  MI_COPY_MEM_MEM_SRC_GGTT	REG_BIT(22)
> > +#define	  MI_COPY_MEM_MEM_DST_GGTT	REG_BIT(21)
> > +
> 
> there should be just extra 2 spaces, not tab + spc + spc

Noticed that in PW link that alignment looked goofy. Will fix.

Matt

> 
> >  #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
> >  #define   MI_LRM_USE_GGTT		REG_BIT(22)
> >  
