Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DCAC27C52
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 17:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4565C10E02D;
	Thu,  6 Jun 2024 17:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnmbFjw0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6258D10E02D
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 17:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717695541; x=1749231541;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7dt715ARem/isd5544eJG3AE7ijCxiVpPvfBDxE41ig=;
 b=fnmbFjw04RN/c+PNITJxjBBCs6NuGt8SciWNH/MV46+bhRqYEIOy7eYW
 o3dZ4B+HsjDOouT7TyNXQJ1j4khV+WIYHEvVjs0IN+UlzKWizHe42Lwqo
 weQ60dLtRVkQqR0+8l89XrkwjlfznVjF2nTNq8aW0sXACa8VRVntAFZ4U
 qn9L9w1yjitqhAuqEK3LszBFHZxC3duqVDVIGG9xoVptkqqWaN6dp6Rbh
 vfRXnj6nmTUYfLSw/i4CDnk7MGq8apYz2gANeHQu4UFWFs1Rij1nGYepv
 FOGAeX7mJ1nLfn1m4je4Wnn5T1QJFCtrWM4rKjQWSVYT4A2u+LRFTpxPa A==;
X-CSE-ConnectionGUID: MZm8YknTTEW+vca3v3tP5Q==
X-CSE-MsgGUID: Z3ilDlqJS4aLGCnmW/qvmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="24958048"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="24958048"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 10:39:01 -0700
X-CSE-ConnectionGUID: 6wNGQ2t1RYy0996aUme0UQ==
X-CSE-MsgGUID: Dh9SgnrkQC2H5qvfGW89hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38494228"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 10:39:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 10:39:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 10:39:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 10:39:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 10:38:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLPUO0AuY8ofy7nobK4RdVEJ/GLIJd1i/3e7/xNLI6RAuVgd74zuFePQGD/pYS5TjYw5b9ErEfQFa5erdz+xlZaU0yIUQ8eKPVJTpW6PK1J8oDH/xOgYhKfffZXfuB5AmS090ynImBfdVzaTA4xjBRzCfDRVSjjuC9vBqXEWg1CWdQ8piClcIU8cO9ivXxWtaKJ+EJVNmPx/agyEC50/kX9R9uDl4XaE61qboHwUpN7vwPlpx9+cWHifUIwjL9EiDHj5yy+/JpQNh+8kGfuKyrF2LMdH4hyYLUETILDHfqK0zB0cnPFdp2ZqcBBd+vaoLhIeHdlczM3PuCRZuMK7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arTf5Pn+a+/wV4m0WLIzy3TJHqTRmaUPKCIPMgWxa5o=;
 b=lCJiTgZQze2idzLnS/R06Moa2ZKBbusrqKK4M69u+hFEL/BskwKvGrTuiq6e/7TLR0Slwo6UcZ7fLtUrOlkrXzmTimStVURqnACsxfiLk7q0qSHm8mtWUeCloEZeXWrjn9h/PgOIxuQdRtPcqtLP1Si6IUqBZJOFhCKT1Jm4dTgKwGjUhF2S3GpOU0e/29GplJ1ghwwUwcA5jZXCTLONWRyr9zW81Ap9kYLk5LRF1t60RUq2z3pkogadjc4Y14REGSNhH+BQ7Kxzd7qlkBBefSVMM5wjtPSNr2Cm+loUTT6HHDZfdfXMn6wBT3mAqgBZQn+nO+aOaidcSuNiLMrKPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 LV2PR11MB6047.namprd11.prod.outlook.com (2603:10b6:408:179::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Thu, 6 Jun
 2024 17:38:52 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%4]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 17:38:52 +0000
Date: Thu, 6 Jun 2024 17:37:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
Message-ID: <ZmHz9p1EyCyxPlFG@DUT025-TGLU.fm.intel.com>
References: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
 <ZmDiLcMGBdCcz2Rx@intel.com>
 <CH0PR11MB54444909E70839CD751A14E6E5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZmHjAAFZ0i9Xg2-S@intel.com>
 <CH0PR11MB54446ACC83247A5E623A89EDE5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <b5huvz4dqw52xaj64uf4sgxumbn7avp3nm3tfe5rhwtxhf44xc@kq4abeay2rnc>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b5huvz4dqw52xaj64uf4sgxumbn7avp3nm3tfe5rhwtxhf44xc@kq4abeay2rnc>
X-ClientProxiedBy: SJ0PR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:334::6) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|LV2PR11MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b257b8b-fe85-459c-369c-08dc864f8833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YdCm4NMlHtROOchTR39BUSW9gShMTxMkyRmq6LMxr1A+TQ1m9OgvEystMkS0?=
 =?us-ascii?Q?6WOsyOhBdy+2oOKxd4VbKP4T69asAo3C+y4joW/5Z75iDG+PlLIABuNyX2Ed?=
 =?us-ascii?Q?zM5B/5JkN6logOxRjNYmIqwShhvXxcIooM0EAeShA86tP0XXQ99LIx9upOBn?=
 =?us-ascii?Q?l7yQ9og+RrJ0RgmmWQPRlKpdbQau7ligA/Xb5OxTKL3tcwXwTkegRVXSKW7z?=
 =?us-ascii?Q?xlxZhqSZF0ALk9Xhi28chvKTFZpeeaZlFin/9kbgc2hjwYfSvtSrhke8A06b?=
 =?us-ascii?Q?3G9g3N/tacMy+zP8Dk4AfMaHOT9koCnXuDAmUyf8XeXK/xniF9WPsFifkl44?=
 =?us-ascii?Q?47VNO5Ld67VSkLH6tExmpbJkTV+ss2xqHIi5rr60TvMrxiqkIsGLnVFrc5lG?=
 =?us-ascii?Q?X//14ksuBn1Ib9PPNCKWHRqyZmhmyDReNzzDfXVMyWgJLj8gvCk34iUEqfze?=
 =?us-ascii?Q?ekGGZ1PoixJorU98uwkgbePRJeTQFw1e9MAVluvXe4JzWQJQvd6q6I8OAcBV?=
 =?us-ascii?Q?ouaQnm57jeLWLG8mBk+1xbj2c1jNm1CT0dJyQC8+pcWFnKeX6iK8jnGZIcWk?=
 =?us-ascii?Q?tllw+zSn97f+7DU+NG8oHOm9IASi1u5AVH3aXQwEKInmjPNt7eViwEIXZVzz?=
 =?us-ascii?Q?alIT+98pOJJfKXfjA7WnWLiOThZV3Wvboljd4gLQIVfm+YQfg7YmLRFoimUO?=
 =?us-ascii?Q?3xWPn5zGK6gElaSqJj+EnZ0iNWkPARUbv4iHxa9fc+smydy8rkcyqbNuN53w?=
 =?us-ascii?Q?2L+0FJDWHMxJYr7XiyyaIdHyzM1zoAywKtL478MM01N2US48fj1Qp+wypQiF?=
 =?us-ascii?Q?M/UowbtI9OorN1JIa0qrgSe1IgNPxzRapwwTAw6CCB+Y95e91XVIV0LOud7o?=
 =?us-ascii?Q?vg+D79hxaTFm57aTSEsOXwnqIx8yxRt+cGukxUp+h8jG8AoFg2ybTna61Euh?=
 =?us-ascii?Q?CjJCaYXxDzW32Zd3K4fnjFRZ+1vKUsgx++suyNVmGGwv5es+h9XnoGcOH0fk?=
 =?us-ascii?Q?V0IXuMIFa24VrlnFl3+ENJopVXjkVVt6KLJiEYxAkZtSZLugMhPkhEf1Bdej?=
 =?us-ascii?Q?OumDIzWqXvT/G0INQoCItRhS+mEfl8frTnHVddliS1bLkVUoR9ajSuF/36Ct?=
 =?us-ascii?Q?/GmSDrdbMPrwl8TSRc0Jf1iRh/LbYl4sNQDub0nPjOUr5v0i8mGN6ZEyTJoF?=
 =?us-ascii?Q?2tRiEdt0PwsmGnrXmDBg633jJJ04hKMid1EfdrXebEHTF1CQh4JucP64iDPR?=
 =?us-ascii?Q?86/Uwc6nWCWRDOTSjjcW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o2wB3t0Np9/dgxIVhcme9rP2SNGn9UxBSmi0E3QdY8qRmkY6Tg4IJliCNty2?=
 =?us-ascii?Q?Jn5OMugCDj62DwTqxYnOXCWCImS2xedz9gZrnHm1LKOp4N/Wr2JsRWmsUnaw?=
 =?us-ascii?Q?RJWcQUgXIvVGRF/TIul95Id6m7oQfDzWCZdXx0QA8M+w8UNQTjdeFk2FCDIa?=
 =?us-ascii?Q?2XyQdqKC++tgeaGmMNQ0LFp/x9KIRaiEke+CGgTEXeXxKGvWl9bCtWinmFha?=
 =?us-ascii?Q?zTAi/NvaIDRzlHtLwUV/Q+ifuMlmlF+SrrJLHa9luMN0BOGj+NP1zqgGjteE?=
 =?us-ascii?Q?tlRi+xf7H60wSN5PyRi/B6MFhEhSW+mO1A7Ik0Bo/Ooc8plc4WJpKwHL26MZ?=
 =?us-ascii?Q?l0sYk2v+Rlla8C6oJ+LOXXlEZO4anX3+O0m1eOZ1h9IjzWxEqrxHVytGQ68L?=
 =?us-ascii?Q?YWUDjpuMDuIvKACW7Cnr5ee2Sw0yi/8S+COpcuxtsugmzoCkVh5dJBgupfkk?=
 =?us-ascii?Q?IznqHxJabvbjH/6wSWi2cbFP/OD3YESJ1V83p342S26XbLFUNRsvB996gevY?=
 =?us-ascii?Q?EWxr2aQ5qGJEh+tmcJCEKIvfpGnwWu20CdkWq0KOMUNOY9P/6390/dTzV/Vz?=
 =?us-ascii?Q?hbdGcSUDTl3DByeFlrwzVr265OIw7+mn8PEznA8gwUe9yA+FRCjAYUehQhPr?=
 =?us-ascii?Q?y2mT3T8Ez60BiiPWIoYA8Yu0nNBeVxuC0FRWHD9DARfz1ZF/EVu6hlHkI7RH?=
 =?us-ascii?Q?1MaC6l8TQBNB5kX5we5I5pw6Nn0KO1nrx5X8VMWcj6IXoU3OfdArfD6HRJtV?=
 =?us-ascii?Q?fkrIeTIBlNqOPkc+/s9trv7iRF2BxkBI20ddhyO248j1/8uLyzr3U9t8tjdP?=
 =?us-ascii?Q?j6g1wqVYtCUvoD03SzAcMCpzyToOjWhhKXV5bMVOucsvHv5m4ullLzVBja2a?=
 =?us-ascii?Q?rv3RglRrkWgwxcDr6zK7jWY93/qrZ1mflhXOGRggz3JnEiMQR2j8cs0N8JJg?=
 =?us-ascii?Q?6PKlOXGbGwnsKne8Idd8viWX1t31gOfZtKEEPmq00PUCgAd6YocyJbETzYjA?=
 =?us-ascii?Q?tio8ZxXIKvHkcgyaMjU+7vZxEyqoMRqxw2dkQohiPSz/18nkq1Y67nDn97jF?=
 =?us-ascii?Q?Y1XxZsp1VSZJ5mZFWqwMexydipcAiJ1BEA1YiBaaLLOFfgA6uVI0xMHwpdfu?=
 =?us-ascii?Q?GrCmXGupTpYGpdVGhAIS2psuptAD/yakYGJjsyT7IosNewykRATPJYUeJZQk?=
 =?us-ascii?Q?19HQUtcBUekgaoxjVoSv4X5AwmHR4wAmeaO3Zy9A9Wmkr3Ur8RQV+lhvav2n?=
 =?us-ascii?Q?+Hi6yi6G/SU+gCB217AwR5yfDTuLP+D3+rLLDoehJEpU2PTwpquS3ltzxncK?=
 =?us-ascii?Q?sWqOQx4NPs+fATDlKhWE4ZfomwtJq6WHd7fFkN5jcyVqijFD+9rhienYRn4Y?=
 =?us-ascii?Q?o9/Xtfk+TQ6xweAKS/iYeyXHHwWtcQF2rmKTnJydzUatilGbNFmIi2MyibRI?=
 =?us-ascii?Q?+LWcg75O18BtlqWqATP3KTPyPTLfT6HU9xSa4Kw5R31/AFIrJke03vNphs9P?=
 =?us-ascii?Q?0k+RVdrZt69tmQej//YSGAoimM0KxXnoUpoPq5B+gVW4HIQugzLgOW0YwaDP?=
 =?us-ascii?Q?mVUH1yyUSmFGj+cGPqAnP7f7FdXbIbQ2lYNpljIIX41hEEqwFb07iN1sO2gO?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b257b8b-fe85-459c-369c-08dc864f8833
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 17:38:52.7209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHVTXdPrQyn61pHeNxa5hIJ4xhBs4hpk06KokkeZ4k0PY+XL6AlnQhbHPCyrsTG9JDbbTFEAU3J1BatdZZi46g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6047
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

On Thu, Jun 06, 2024 at 12:35:42PM -0500, Lucas De Marchi wrote:
> On Thu, Jun 06, 2024 at 04:38:49PM GMT, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Thursday, June 6, 2024 9:26 AM
> > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <john.c.harrison@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> > Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
> > > 
> > > On Thu, Jun 06, 2024 at 02:11:02PM +0000, Cavitt, Jonathan wrote:
> > > > -----Original Message-----
> > > > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > Sent: Wednesday, June 5, 2024 3:10 PM
> > > > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <john.c.harrison@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> > > > Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
> > > > >
> > > > > On Wed, Jun 05, 2024 at 08:08:28AM -0700, Jonathan Cavitt wrote:
> > > > > > We currently have debugfs support that allows the userspace to initiate
> > > > > > an asynchronous gt reset on command.  However, userspace may also wish
> > > > > > to wait for the completion of the gt reset before performing any
> > > > > > additional work.  To that end, add a version of the force_reset gt
> > > > > > debugfs function that operates synchronously.
> > > > > >
> > > > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1068
> > > > >
> > > > > do we already have the igt changes that really closes this?
> > > >
> > > > The IGT change that closes this issue has not yet landed.  It relies on
> > > > using the new debugfs, so if it landed first, we'd be attempting to call
> > > > a nonexistent debugfs function.
> > > 
> > > Please provide the IGT and the kernel patch at the same time.
> > > you can copy patchwork or lore links in the one or the other cover letter
> > > to explain and justify each other.
> > 
> > Here's the related IGT change:
> > https://patchwork.freedesktop.org/series/134509/
> 
> great. Let's remove the Closes from this patch then.
> We can do that while applying, but...
> 

I think Rodrigo just pushed these...

> > > > > > @@ -116,6 +116,17 @@ static int force_reset(struct xe_gt *gt, struct drm_printer *p)
> > > > > >  	return 0;
> > > > > >  }
> > > > > >
> > > > > > +static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
> > > > > > +{
> > > > > > +	xe_pm_runtime_get(gt_to_xe(gt));
> > > > > > +	xe_gt_reset_async(gt);
> > > > > > +	xe_pm_runtime_put(gt_to_xe(gt));
> > > > > > +
> 
> why aren't we just calling force_reset(gt, p); here?
> 

Opps, I missed that in my review and agree what you suggest is better.
Given that Rodrigo just pushed this, let's do a quick follow up to fix?

Matt 

> Lucas De Marchi
> 
> > > > > > +	flush_work(&gt->reset.worker);
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > >  static int sa_info(struct xe_gt *gt, struct drm_printer *p)
> > > > > >  {
> > > > > >  	struct xe_tile *tile = gt_to_tile(gt);
> > > > > > @@ -261,6 +272,7 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
> > > > > >  static const struct drm_info_list debugfs_list[] = {
> > > > > >  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> > > > > >  	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> > > > > > +	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
> > > > > >  	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
> > > > > >  	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
> > > > > >  	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
> > > > > > --
> > > > > > 2.25.1
> > > > > >
> > > > >
> > > 
