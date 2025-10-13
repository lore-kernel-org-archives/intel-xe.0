Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624FBCCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 16:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0130110E190;
	Mon, 13 Oct 2025 16:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EiVivVd9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285C210E190
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 16:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760373733; x=1791909733;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pW9jubhS6RqXZPkuw2VXAqd7AQT1VJo4YBkN6JzRTrg=;
 b=EiVivVd93SKXvPUZzQhCfhjaTNDftzlYdgoeZh3pGbElSJ86QpKZzsrS
 y20RdyMd2PMrx57ECTT6gTBQMwJXOTpm/hzy3xL7Jul56ihgtScVR7kJg
 WjdExgwWS/+V/joB3T3e41kzIsE1PRPbDoolesH2Wqq5xkCjEFOvTteNV
 t46hHeZxDgjOJCXWknrFNtLiuaboqwff7zvIwjJ/tesTDz4WWoWJtANLL
 SSILCi1fFin/SqllvLpYYJDEqlWrxAckF2KMiB3v96Jk5huf4FFxGdf8u
 6ZbY5nm/JVJgwVaJZ2Q1TvJNBD3KJmaheERIcT03r8wFCKR0KH4Qtcr1K A==;
X-CSE-ConnectionGUID: LS7TfDUcQWGzGGf2nicrng==
X-CSE-MsgGUID: 0HjSmbVqQB2x/z6tN2QG7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62671646"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="62671646"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:42:12 -0700
X-CSE-ConnectionGUID: X58CFfthTI+Yy45i6yWwXw==
X-CSE-MsgGUID: bQUEQ6DUQT2yZIUM7WxHng==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:42:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 09:42:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 09:42:11 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 09:42:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tm8lcdsMi00pYgp+zzo5RzwaaQeNKmMKH/mNIii1FQ/gKQ0xuxvELXFykTwA2gB4FEkbIXrDqrrhjS73JchVattFXsdBUPN0rY5qb0KdAmOgGcNO+Gzayjskvxw2ezwqH6rgNy8be/0Z56WRFniRGNx7OTNLn9JXHLawQXMBeLDpUlI3+F4H+6oGP6HzqiFJSoKajq2/DdUR/QWX59jqeJzj4bVQrCiYPT177IO6pTyfISzawIqT3DB97+ZdTKHj5fvL1nmOkQ6KONYH8CoS4lKrG9HxO1r5q1PuWZt5LD1NTmnQGBmXHRarO16zOzsaFOzOLQIMhl1Y9Z51Ruk18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMJIloPnUgEIFEsKZ00rs2ZrdscpEU80rcg8Npgoums=;
 b=a8mevI6MmLmT6H35WFABFR+/k6VWr9Q+egimFLz7nXQoop8zaQs0RWShBqKHIJ6vtruuh3+RthKhH30RhkaJgSo7FPr5mQnl6WVneMBkmnoIDCdTO1FW1+ztz3pI1zwSS+MozAWb7x3Y+Rk+yesUR85vn5/zn05xnAEYUJzJIicQTo7DboJTQIovUNAhlN9pPvR00HEaaGa9l3pVTarj0q7OAiqhLb44IC6UKZeDMOqM4A8YzOkaMHakhKrqpN+DTeCfTaT5eCNcTqhMbFOnJT9bTNhWh8Yt2nzFlIuUzjNZjc8Xb98fTGihak2EKmccTf1FIWtchacGapyzeqL5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 16:42:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 16:42:07 +0000
Date: Mon, 13 Oct 2025 09:42:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 06/23] drm/xe: Move 'has_flatccs' flag back to
 platform descriptor
Message-ID: <20251013164204.GI5409@mdroper-desk1.amr.corp.intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-31-matthew.d.roper@intel.com>
 <dc7266763823a6b8876dc0d6e9cfa6bb0297d999@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dc7266763823a6b8876dc0d6e9cfa6bb0297d999@intel.com>
X-ClientProxiedBy: BY5PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 8886e735-bce1-4fc5-73ff-08de0a7772be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dq5sRGEVoMd9AN7T4VNmM9iSmlKw0rHw9OmEQudlf1gBxGcPra0KnYJJNUuc?=
 =?us-ascii?Q?LRtKr8fALLkhk4UZgLYW1dqVTYsjq0ccKPfKmyTRP7/Hu8L58LEzm+MFY7Ys?=
 =?us-ascii?Q?cSTvqyTrvCzoEAIqpKJqBaXGpXKtEr7N0bLfDJN696InKyS5Qbrgz/RcColw?=
 =?us-ascii?Q?jy51yI4Ij4gsE+jt6EEL7z3Q3zBjXvKc/GUSIlMtrKR14SuCZzMdRnfMtmdJ?=
 =?us-ascii?Q?G2Nh9N3eDrPvfu1cWf5JtDx4PKrPINwPbXXS2XAtnZLC+8ML8ttmMnO9/qEV?=
 =?us-ascii?Q?UIl+1WXpFkPG9FuWyFMy5+qBb8Xny/nqstWKCwldlg6+tDmnmmhi7++YNHtF?=
 =?us-ascii?Q?rkcMEAgtgYkxQM/crqzs5/EaofhHF2vn89KCx8x1wf7ULDWojfT/006tQa8e?=
 =?us-ascii?Q?AZlEkYkh6GTVZy2KGdNsUBqDmP4hu+bbGubru0Av+X1DQIkrGEUOWKTwu2ix?=
 =?us-ascii?Q?x0Q3JVFcH0nYdTJAbJSBXgHc/XVuOMpXzKq/5gabIeJDT2hHxDpaUiwEeJdj?=
 =?us-ascii?Q?cy9pxKFJ+nf4TW0e5u4B5tQ48dCGOTMa5T/J4M2qjUjisOEKsKqQkWv/e3Jg?=
 =?us-ascii?Q?tE2pLxJDCZ0swv/ZzUojs+HSkCQOMU8LsTAfP04iM7HL5yoPeNYaVmb6jtsX?=
 =?us-ascii?Q?kRQ+2sVqOKqpQOv7j8AaZx2mzIWvrx895vDOSrqSSyvTF1Q4frX47Sgv+v11?=
 =?us-ascii?Q?qqxMT+TG4ipyo2jagcSfPiFJ+qLiPbviouiQnGWLQqxD74HP0b0tjCaVZjpL?=
 =?us-ascii?Q?cOrT56Ry2nHussGZYZJy1IDE4f72ZKU1o3Q0D1E60mV2cxxDgniwz406bwpi?=
 =?us-ascii?Q?Y78vvzkEcxdCI88+G4dhWQiibQg0Kk20uN7cqJllTVLghBS/BMwQwwRbrlE+?=
 =?us-ascii?Q?F1FWgltNX1Ot1Jta6IXbk0Fm5VPFqRD7RL5Lf8ij/6+3XGTtLwx/XPoTAGsm?=
 =?us-ascii?Q?6wgGDufTjVmsAXM7vYMywN53VKTWm4pCl5sJMBmaCo0Peb+RB/Nh2+iy5uVh?=
 =?us-ascii?Q?pkA9W0nByMIYksTBkcOGPpZALrOsQ7n/6B7yuUaittpQZahEE7L+PCVmV7PH?=
 =?us-ascii?Q?XVdtqmHNZ54I3jdFOk1v8pzV3YBxOelWYiu54G6TJR8ta8AcpVEnxXzIvmjm?=
 =?us-ascii?Q?PxDuYWXJhBvJCtYVWDubqCkmt3dgi9mvgoTcCz8KZGYxgTmhigRJIJa0H8Px?=
 =?us-ascii?Q?+lnGsNymI9YP2smpYx4j6iM/SaDr07b4bAoRxezhV2J+z31omDyiAKXwYXcQ?=
 =?us-ascii?Q?y63Rx8grYeFkKOmAQS7RFcxD5P7xVuDFYTeKddeIBtimvEyI1XKDjOqYcqu4?=
 =?us-ascii?Q?9I0KBMttJAdJwutzV15/GDd/tRkV3us3QgS20MBp1Rm2CQ9NC1bi5m7ZoyZT?=
 =?us-ascii?Q?vJmYKcnbEIypReuI5ujEcxukZ8RBR0jVU+O/A5Dj7/qRYhsanKPrb1QOhkJF?=
 =?us-ascii?Q?IWW1olieTmS38amO4ac2caxtJOKcb6rp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jEy3FikuaOTBBdzcCGq9ptXHTAg0QAwP1f68+4R60GnjuKIbYcwLIFjZce2h?=
 =?us-ascii?Q?T8oIXTXwubcPFe9G14fiMm7PWla/vq7tn2Cgc/FQenXJiMVS+nIV/blaO08J?=
 =?us-ascii?Q?vyKhS43jhBXFCYxjLY3JiXUsIwl7sR8isrPnR98TWI2MCM9nSIXL2qREJO5c?=
 =?us-ascii?Q?eJLB1zSihpxu2Ld1JyKD4rQmzjS/Hmzs0QpjRMKDf79cQLQ4cQrhdk6CYNod?=
 =?us-ascii?Q?GSwZBP1lUdmaSje2GJxGwdBkX8U1ayOmxNqzqnnNGDnIQKYkPw+5ryWnqpZZ?=
 =?us-ascii?Q?XAjLZDMVuxnwXsJGXRcMFrVMUorH/+u1BgeGTHi9Pxah8khD7dcJqjYMNdQ5?=
 =?us-ascii?Q?2TmTTlGKveGaaYTGUTnQSsL5bj+ukEYJW8LvNTtGcpmDimju4xXudrRuiuvA?=
 =?us-ascii?Q?Di7aRUZuYWf9uhfqD6birUdBX6Sa+/alrlkfx0GfCrYoG/dxdaznYRQ5FCvZ?=
 =?us-ascii?Q?07g4N3kb45wOsZmtLyJzfgQ/Y/2LdCWqZNG6yO8/IlIC3tZPogxttNV1AJAD?=
 =?us-ascii?Q?hblQArvka6HF0Qx9kgc81m0Wyi8iSLMAMlPtCAZK4MggTwxL+rTtfLHkH8lW?=
 =?us-ascii?Q?FLAAwp5jcqidWS9CU/BG04xvF7tKgLV/Z5EE/umFmFgHPxTHhwW3Dm7PLWBy?=
 =?us-ascii?Q?xukfHlvQdmz5d6ovUBDS4iXc3+UNEpbnID/4xbDvHw7ArFxb9mfavQN7jLFl?=
 =?us-ascii?Q?Ut6FgEy79aWVJNAXDTpMCHCP0nSRg9MLTOPe9TG8Rwo1IRxfA5pN7tK9Ncja?=
 =?us-ascii?Q?aiLa1jJyrTykoLNp+Vq22dsGwH4W/kspoVuuMcXj5GANTIvUIKlTI9ncM+NK?=
 =?us-ascii?Q?h6aoaZ7k6aidwKstRF8Bjahl/M7X6oBon1ugfwtrAlZ+iV/0Ks2cnhYoaEYv?=
 =?us-ascii?Q?YG4Fgbw4cwCCl02wGoomsO7jG2EcRFOLdhSjQ6fbCBkl2zEsiLibn9mOVNOt?=
 =?us-ascii?Q?J+tYsY7EuUE5x/qTUGkYZaiXzqxbfsvnUTFmT/43OslAG06VRWJDc16vqTVr?=
 =?us-ascii?Q?Hi/RlY1MGOIGEP/gwwkyiHhB0s71jpruPDVRV/gHloIza+S5ALc8DtRms8T2?=
 =?us-ascii?Q?xz8PxpuTzVeg5HaCYJIJrHgJ+/zqdbjEltNNxssti42KxXbUvWmQtYp0GkS4?=
 =?us-ascii?Q?ZKg4Cw2E6stXOjGWrK1gFg+wh+/0QsLjixi60e4jjjjzN++d60/x46r0YRTZ?=
 =?us-ascii?Q?/fGiMp2xEP3JxK0DVPIB0QAQqax/CPme8HL3xc34egZTuMz3qJLOLSd809j0?=
 =?us-ascii?Q?eIvcsiLBstWtHkikAUfGzXbBhuWMLjk2fG/wWLiKk55hCIqkKvcwrlgcXF9f?=
 =?us-ascii?Q?twJvDcxMhDDDDD+QAFfQtXgSbs4ofG2pxGNPuCUuOD4VS/rh2DVRBGc12cAp?=
 =?us-ascii?Q?Y0DHDRn2irh1HwEUOn6o+ZWd0DzcIF2UYAx61qBZ1C3N2ixeXS7Cjl80l7yw?=
 =?us-ascii?Q?JPX1ORtr4k5O4Ko0AcajU5I3YpsNy7TrA6Dbga3uWf9wwwelp7M4b2d8KUfJ?=
 =?us-ascii?Q?uSzZum0+XgqmSjqoyHaJzVrsQGFf7T9IspLxqLawAOD6FRvLvgP+VxZEcEFo?=
 =?us-ascii?Q?Y7fV9Ee9FH+t8C/dJ1GIm3ypmriJh49wYJbEkAsehwiXpMvXu0bu40b35k3z?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8886e735-bce1-4fc5-73ff-08de0a7772be
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 16:42:07.8035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUiv2smGYXjs231xDpvLEFtFpjtj0G35iL/WyDXCvlL4BydR57ZAVBDn69YYD1wi1+nkmMqXG4EASoRVYkSsY66DNIdevK3dcIcmTnj/0q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
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

On Fri, Oct 10, 2025 at 01:50:11PM +0300, Jani Nikula wrote:
> On Tue, 07 Oct 2025, Matt Roper <matthew.d.roper@intel.com> wrote:
> > @@ -604,6 +605,8 @@ static int xe_info_init_early(struct xe_device *xe,
> >  
> >  	xe->info.is_dgfx = desc->is_dgfx;
> >  	xe->info.has_fan_control = desc->has_fan_control;
> > +	/* runtime fusing may force flat_ccs to disabled later */
> > +	xe->info.has_flat_ccs = desc->has_flat_ccs;
> 
> Related, but not specific to this patch:
> 
> I'm looking at bspec 59255 and it seems to me the fusing is about CCS in
> general, not about aux vs flat.

FlatCCS is the only kind of CCS that exists anymore from Xe2 onward;
AuxCCS ended with Xe1.  Both igpu and dgpu use FlatCCS now, although it
may be disabled by the BIOS, which is what that register reports.


Matt

> 
> Should the runtime fusing be separated from has_flat_ccs? Am I missing
> something here?
> 
> 
> BR,
> Jani.
> 
> -- 
> Jani Nikula, Intel

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
