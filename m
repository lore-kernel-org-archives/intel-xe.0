Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D53CDB474
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 16:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B100610E210;
	Mon, 16 Oct 2023 16:31:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE39B10E210
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 16:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697473896; x=1729009896;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AvRp0UTknOKGgn9sXN+2aL48xfm/rxPJVwVtk8nEWeI=;
 b=Mo3tEF49+2HYhTTgwWzyzuLCykFYma0fA9mCBAUBhn1qnmmtWoKqQNZv
 nhre2ER4ZNAxqtvZva9meHsprI1tIderALToyw3cASyjQEVhhFTjS9YDA
 NLkDaFXR1OIq5yjQsu3bjIqqLLwoNdP9CVA+mvoViGZ294Ta+s3S2cyph
 ORY/sDWoF0BxfIp8TnMoHGN661VBP9qOQRbr2pVELEm+z7QhkkaDV5863
 CxA21pdiHVK2snRIe8xrBxFnB5rgKsv/++LSyfda/fjBuOqXlwLDALXWJ
 1LJ8/62ZnPh2Ezd8sK5iTMAex/rmTo/TG8HeRIOO/KTdxONBqRczU5Vue A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="375937526"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="375937526"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 09:31:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929414291"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="929414291"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 09:31:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 09:31:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 09:31:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 09:31:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 09:31:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEfhyyzfacKrvBEVE6leWg9LdkK6z0Ec27Kq38fQLfK1oqcvXo0/4gqzcw71H7l0pbhzsnz6vASfmnr5Nu44Z49nppAPgQ9wwaspb+nl4PXmE/dfBYFW8SZOYwUZEnwh2WYInm7IweWnw7GgklnUK9fUq6qMNYr2bdbKpW42d4c9DYQb3ajgqn36/vo388xlHljukkAunQKoZmEXpflLquPfNVg/YGGMxONdyV2udZoXT3E9Fg6XGwqrud0rQkoHdgML9J97ctIJ51sIWca/CB59LfBPViWBRs8xY9ZBfPK7Gse8rC1JE+4ijGNr8lOPDcNmSZ/Qgh75lwxT3Lh6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3as/j6jPIXz0fo9BmtdxImu8FCCCyeyIJVHPIbCzc4=;
 b=PzdXkTK6iGYt8Dt0jAJ4V75hvbTYxEWo4O18x40OKClWqzs/gxvYKrPfN5Vtu5HbAtr5kt5inZnVGfm2rofofpKunkXgGrX8uOcQkM6zoVKJYlO/F9ZM9OPznsV8ZLueo73DoK/lmSHEMgDH8RafTW4s3BKjni4kYw6sn0sLOtP24h3WnKNKPXrRrPMdKv5fp8CCiPGoPzZDg23KEOxm+mxr0TXjar6R5T/W24g8JI7F7qMoRrFQopE4WiPjmjZGKOTu0xKHuYKJn+EYhWKuvJeWREBBmYeL94SsrMm3tPYT+PlMiDf2VqWGV+cojjgJantlnhwLW5Om94FyD8Cm3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB6324.namprd11.prod.outlook.com (2603:10b6:208:388::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 16:31:33 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 16:31:32 +0000
Date: Mon, 16 Oct 2023 09:31:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231016163129.GO21382@mdroper-desk1.amr.corp.intel.com>
References: <20231013220250.927876-8-matthew.d.roper@intel.com>
 <20231013220250.927876-12-matthew.d.roper@intel.com>
 <jewedgk4umkokvuy5di2wbzyryinvfxvkmxsmnu6z2cwdtnfoi@ohbe75z6cxfj>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jewedgk4umkokvuy5di2wbzyryinvfxvkmxsmnu6z2cwdtnfoi@ohbe75z6cxfj>
X-ClientProxiedBy: SJ0PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::14) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: f402333b-8d44-4083-765c-08dbce655b7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/Oksj1hwBQkvwGYLwwLtwKt4HTaufp7AdWwp2a+2qcBmTNVwkNX0+9kAxDW9xMNX/UJxtcjC7NrCIm+mLbyB0yh0y3aEios0te+a7D0erhvFb9ILdWQqRdJz1X/6pILG7EQIZDwO2PIWrx5LWbc4IEyMd2pbT4Ci37rR1AGySPWAPU6SzJdVIw1e1SgGneZx+Wg02TUzOZkaWWHQ1A1Ty5Q0OTcUxkxap3zwrgWFYCsa185bVGjFtqeV2X0pxiKE4h6TglQbIoU2734Xndii24Wo8POuDOi4ziqabIXkwtcknkU6ZF/TK2PFSRfjyYMq3YjFVQZrwvBSrplM6VXZQ6Wu3VtpISJFTgosis0Gg1N35skI0Od6+gfvbDm7UEw58Tz0o5IkWzG2L+qrQfixwSZz5arYZRhB9HcpCvgWsIHCsz/CCUfmlh+wP6+c8VT/SAGsF/dQNY9gC/WLjVgBjwqIdVfREqEYmGVRek0OrlBLX6KPO2Ix0hko66sZ3vz62FvkftZr6WJ4jGPizJiMA+XrjlswCJM+n0bK9KmkNbeEAtE845ckkrJqga50r+u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6506007)(5660300002)(6666004)(2906002)(1076003)(26005)(83380400001)(33656002)(82960400001)(38100700002)(86362001)(6512007)(478600001)(6486002)(41300700001)(6636002)(316002)(66556008)(66946007)(66476007)(6862004)(4326008)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EeFdw2TRoTML+g5/ubp+U7qd8nnQR7P0aj6XSS1m8rAZewF6Irx4iwS5QF?=
 =?iso-8859-1?Q?RqrtRFy8CEZvosXONoY/93kVcbGQp5MILp8WloTnWYd+fE/2P9LsDUtLSv?=
 =?iso-8859-1?Q?N9g2x2l2qsQ77YazIHzT5kuq73Tq8k4gcQaRM7r5jB666hl12tQ/6C6Qa7?=
 =?iso-8859-1?Q?EKtI5y2bKME34ykyHk+DfTGSNyXfpbGV7ELoiuFVu04geaQtyvn8Yc3D3Z?=
 =?iso-8859-1?Q?tGB3vQlPpcGWlWNn7ciRNBkzMYdlYjNmFTcENigkpy71vIDNSDYJUTI12a?=
 =?iso-8859-1?Q?1ZW3LxeOSSTxOgqcqhsW3sklS2Gs8+eMGFuqZH/GqS6sD+K2A6FmwxlkZz?=
 =?iso-8859-1?Q?c3meKRn3ZUfkQu97+tjesvlLN5JJRW3ZXU0tpru//x7FJrTTXo/AvH/Szj?=
 =?iso-8859-1?Q?CTOvlQkmCavVWlMwGyJW0sEDQq9HrQQmHLeEhrhw1jxrpKMVeResvFnMb5?=
 =?iso-8859-1?Q?1fB25LdHeXL961VyuANeT/8Gsj6NQ82i4h7u6BCsYF2DBUTZ42qZTyEfqQ?=
 =?iso-8859-1?Q?QmtiBZvWOVClZsa1rNhHw+Q10TrFmIMxMlDOYqKxueH0ETOLNoky2O+9oN?=
 =?iso-8859-1?Q?zBWG+VKuW5LjiBxT2CtHx/Ol2MuVHeOh3pD3IfzfXI9PJqGzfaNIEUltzW?=
 =?iso-8859-1?Q?nzoIOYgxrQUxIn3lLFgRmagQmI3Sfif186ppDqqNuzmyDMLr+jxEPwBFiH?=
 =?iso-8859-1?Q?xaEM3cNZ3a+0ao/gX7SrvtkUgnqfkmVGiA0npUBvYl3szEwMKbBcFeaAfy?=
 =?iso-8859-1?Q?UTJJDzTX2ql4H9ArUquHhbiSEaFaZd1ZC05KNZzpTqi29Hd5mAtM4sSeqf?=
 =?iso-8859-1?Q?Z55fTGCq+4Roz9f7CTBinvcEXawo7moHYH/d6GKMxva4yDQd82A9X3eh1j?=
 =?iso-8859-1?Q?vQHzYg1M7Bc+3vUfMTF0ALEFMgJ7fU3bBer6+mh0xcB+DKSHvJgVoP1rP0?=
 =?iso-8859-1?Q?QSsxk76X/wxEmBNq35DJwlr9RUq9NNKEDrNCyZa+1ISs4Om7ER+YFz3Ae/?=
 =?iso-8859-1?Q?2bWVBGggGPaKSCHzRHC2UohijCLezVx0VpzLASEpPS6kCqiEz9rXEHLJPz?=
 =?iso-8859-1?Q?40UewEnZBrZCL6fplBSGo3qT1Rw8VTgogkiUbv1NzA4X2SD3X3MV/j/Hxf?=
 =?iso-8859-1?Q?Shvqk3gUBl9NR1aBfy4wQENjTB4rWPGcYLrDWMRzDLLjbwCbryDbPndHvS?=
 =?iso-8859-1?Q?uZ1+qyHmoQRyXWgur5F7VCeQzUKFPRFCzcss7aoGhTiDbXlN2vK5uwCJZU?=
 =?iso-8859-1?Q?lZ9B0p4Ufvh6Mwy7hx8j0m8BqK4WiVMg2EzOi1NT9Scdho85/PmpO0AHpO?=
 =?iso-8859-1?Q?jkGRiVoL3a8u2Km3nhXNOlayuvKgPIGV0LRifdZN5zADDllgnrB+hKtbed?=
 =?iso-8859-1?Q?DbScbQOKXohXhXh1Gk6+Y1TunsDpeLHgwGI3oZRl4rrP84656gdaVg98AQ?=
 =?iso-8859-1?Q?5fuzHqxlj22tAorHP4IkKeASzxQ12DrsXM4V4ZsWw43l/sX6zHMlLlmPkQ?=
 =?iso-8859-1?Q?69M5mNJqPDR36GX/dq2vmQgP6UQJKLwJaowwxkLaigoCZmUTXy/c8thtxI?=
 =?iso-8859-1?Q?41vWeXVWw3LKtqxzlRRuI2yEAPfpx1Gjn43MVGAcEabU8DXpfjBBhRGR9M?=
 =?iso-8859-1?Q?3RN/LrtKQfg8/5QrqwtoeSBrBCh4pEufXpRMGZw+jEDtaGWfHgb+qtDQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f402333b-8d44-4083-765c-08dbce655b7e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 16:31:32.7786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPxNMl95AXfJeZAa0O44NzDbpcqkur0u3SU1sJYE4k6xCQvz4x722wag105vRy38RXgIiWe6FrhhE2TPmrh9OXh72qJIxxLt4mvyovqvO5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6324
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/6] drm/xe: Extract MI_* instructions to
 their own header
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

On Mon, Oct 16, 2023 at 10:57:07AM -0500, Lucas De Marchi wrote:
> On Fri, Oct 13, 2023 at 03:02:55PM -0700, Matt Roper wrote:
> > Extracting the common MI_* instructions that can be used with any engine
> > to their own header will make it easier as we add additional engine
> > instructions in upcoming patches.
> > 
> > Also, since the majority of GPU instructions (both MI and non-MI) have
> > a "length" field in bits 7:0 of the instruction header, a common define
> > is added for that.  Instruction-specific length fields are still defined
> > for special case instructions that have larger/smaller length fields.
> > 
> > v2:
> > - Use "instr" instead of "inst" as the short form of "instruction"
> >   everywhere.  (Lucas)
> > - Include xe_reg_defs.h instead of the i915 compat header.  (Lucas)
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > .../gpu/drm/xe/instructions/xe_instr_defs.h   | 31 ++++++++++
> > .../gpu/drm/xe/instructions/xe_mi_commands.h  | 58 +++++++++++++++++++
> > drivers/gpu/drm/xe/regs/xe_gpu_commands.h     | 41 -------------
> > drivers/gpu/drm/xe/xe_bb.c                    |  1 +
> > drivers/gpu/drm/xe/xe_execlist.c              |  1 +
> > drivers/gpu/drm/xe/xe_gt.c                    |  1 +
> > drivers/gpu/drm/xe/xe_lrc.c                   |  1 +
> > drivers/gpu/drm/xe/xe_migrate.c               |  1 +
> > drivers/gpu/drm/xe/xe_ring_ops.c              |  3 +-
> > 9 files changed, 96 insertions(+), 42 deletions(-)
> > create mode 100644 drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> > create mode 100644 drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > 
> > diff --git a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> > new file mode 100644
> > index 000000000000..a7ec46395786
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> > @@ -0,0 +1,31 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_INSTR_DEFS_H_
> > +#define _XE_INSTR_DEFS_H_
> > +
> > +#include "regs/xe_reg_defs.h"
> > +
> > +/*
> > + * The first dword of any GPU instruction is the "instruction header."  Bits
> > + * 31:29 identify the general type of the command and determine how exact
> > + * opcodes and sub-opcodes will be encoded in the remaining bits.
> > + */
> > +#define XE_INSTR_CMD_TYPE		GENMASK(31, 29)
> > +#define   XE_INSTR_MI			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x0)
> > +
> > +/*
> > + * Most (but not all) instructions have a "length" field in the instruction
> > + * header.  The value expected is the total number of dwords for the
> > + * instruction, minus two.
> > + *
> > + * Some instructions have length fields longer or shorter than 8 bits, but
> > + * those are rare.  This definition can be used for the common case where
> > + * the length field is from 7:0.
> > + */
> > +#define XE_INSTR_LEN_MASK		GENMASK(7, 0)
> 
> nit: if this is not to be used outside this header, I guess it could use
> double underscore like you did for __MI_INSTR().

It does wind up getting used in instr_dw() in the next patch, so
probably best to leave it as-is for now.


Matt

> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> thanks
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
