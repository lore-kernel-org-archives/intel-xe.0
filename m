Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3CFD1950F
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 19:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367E710E478;
	Mon, 26 Jan 2026 19:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxatS9WD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B102B10E471
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769455183; x=1800991183;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r8K4cXrs0GF1i+iojusa5n7WOzt7t93wvlaQ6cvamF0=;
 b=hxatS9WDwTFDh2Rn/Kkx4eGUtwh5mHVsfbfvva5rAMFT6V7zLTf+Ag9a
 wFQyFAgx1wFCCb19QpD1p71Gq3vlp7I/4lY2hvgeG9VtKsWP26lbVlt1S
 2WbLFTOmh3sFvCYnEV6V8v4y5/orAJR39nFEj+u5XhpcIr0Kh9m5gOcO+
 foOzFYQJNZI/uyvcw8jpIjETApJ0p3cuIFs97XQsgZDqoRtj3EDnCvy2x
 OSwV4SNHzmu/rrOg7HGRX/H+4GpUZmwoRYiw8FNNWN3IXOWLwuIe4KXJW
 oDyOka2oJrBOfAUsiilghQCNIBfBf25eShQ5N6YFIEMiJSRAUBy0wZ04W Q==;
X-CSE-ConnectionGUID: bobiX/mFSKWbvvgYe4OfvQ==
X-CSE-MsgGUID: Juvp7y4lQhKJ3MZ9YYOSGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81749235"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="81749235"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 11:19:43 -0800
X-CSE-ConnectionGUID: mj/XsRDjRLuQ9hyY4/YC3A==
X-CSE-MsgGUID: 51w6yxPbRdSF+qf+W93iJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="207561868"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 11:19:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 11:19:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 11:19:42 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 11:19:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONx7tXwDa2pu2VVCrx6Jsa8tOOr5KAinwUX+fRsdfZOMe9uc04H79iWEuHcRJVEZub1NgywsL9dur8PLvdQ3h5MPuP3KOhnalq28Eok4SIA7PtS7YEFIRL28crMmv37HdycVryLyujEhyj5S7GPkk95ZYasNqGh9gPbwLuai2ON0NC8lWH+K31F876LvO3CoO1ygru0D9z6t4P2YqsDgAGQOSI5MScWmJpIIvbC2QMtzujOgEIF7O1aGv0vgV+nQ7An4Wwdwj25PEyEU4pwqk+/Pgs9QXawkr5wiGXDOAzAvZa9BdOcB3UPXEcfCFSn9XK3+Lh9Xz/ZgtW3/z/MuIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QxV2KSTSPsSVRm2h6yYzw8FPVrUx0vfvJqfhRSujII=;
 b=EIw1exZ+BG9OH2sFrt4GMWHF4SVp88jMwPprlEz3hrA8Sq0sinYMu4aKT1ECiBIi69iM6rHwMNap+O4CiS1d8HAuIOD1Ah3eSnkvucMJRlUmHpKR/CCerUqgp/0zlqFJQnSi/fiYxcFOTcG4CHfO28aSKePOJ0Iuu1oDRjT/D0TvJgqrTG26NXAgytSKWoJEaqx98FEkq7b4lDGxfFBMJPAqLyQaDAlC1lCvk+JSq2uKEuRYw3uzRu2ZyDawn12TgVncpqGLdeckh8GMg6GxSK7T37FVskYxk5m0nOm2ocXaABe9TrhcKM+tJCLq2yf4toWn5TcR6L9/z6v90/FWvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8547.namprd11.prod.outlook.com (2603:10b6:610:1bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 19:19:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 19:19:39 +0000
Date: Mon, 26 Jan 2026 11:19:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 3/3] drm/xe: Add migration selftest for validating
 job submission and basic features work
Message-ID: <aXe+SVr4mstKFLA/@lstrano-desk.jf.intel.com>
References: <20260126125207.1119351-1-dev@lankhorst.se>
 <20260126125207.1119351-4-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260126125207.1119351-4-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0120.namprd04.prod.outlook.com
 (2603:10b6:303:83::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 22383cc6-48b1-498e-e5fc-08de5d0fd9f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?saJl1Nn4kfsA79dBXxQb4hLAJYDmOA687zstFqoNHIsfUGDoquYvz7h+d6yf?=
 =?us-ascii?Q?0rCqInBHOgYL9VQsOCSPFYYUH9zotlcjQuTnB4rK0+Y6lgBPIqmrlRZcgQsJ?=
 =?us-ascii?Q?YVG/v9mYIYq4AENUYifW2TjnDBtrGjRLa/kqLrN2cmyc1qucYo+dCmI4DJ5h?=
 =?us-ascii?Q?TZkt7ghB8siDfcQ+Iixw++jDCmyYcB3VZ8lJG/B/Ytt6fnbMwfKL7Vch7gDh?=
 =?us-ascii?Q?NFYhhICLH5RHLkj8mAd3LTEk/VNCpKNi4ScFdmC0apHbk4ySjbEbLOnNXR53?=
 =?us-ascii?Q?fNznGbUEglMHYZjWdqAqRsqDX9WcVjBmt2Fip5E53QRQG/PU0jKWpfnQYmSo?=
 =?us-ascii?Q?W0ve6cJmYKXqDjpAzwYgaUR3T9hh5q6xqJ6SK0Uq/z09vsTwd8WwdJkZPxP1?=
 =?us-ascii?Q?dcjSH5goc1m57wLOK+UB6i9M2nBCY6QwYn9jrA2/qVonmcNLFQadbBhmH3Oe?=
 =?us-ascii?Q?M0WeYfCiAy0c2i5xjgW1EdPs/8gEA4r3Z2K08NJNemMjT3RwsE6VOpLvNOwm?=
 =?us-ascii?Q?D5bxAYW1wKyVnPoPqjzLxIR/gb2e4t0qhQZekEtj63ONEqemRjZm1SWG2Gbt?=
 =?us-ascii?Q?jtu8zwp2TFGqFDklOSxLEmt6EKjaDw+zhpuZ5PI+fykRelj8VxDus5Jwhi3w?=
 =?us-ascii?Q?sYVJNGaSH/XUdaQFts0zJEQxQNCAdgVdvBcNaAsepEq93lwdJkhsmzOgGkgp?=
 =?us-ascii?Q?AhXwTzD1n2dCwFyAtrZdlIFT0I3U68AGv6LK1QBSBYtZC942h2dLEFzVLr6y?=
 =?us-ascii?Q?nLvNmzwp7EtViCEDEUm0P9bPR16nqPcVhQtvUQ6mMLtyjB+dyFlHalZvCIeI?=
 =?us-ascii?Q?23wTIlvG4AEVA/C5/5rdrbuj/Fc6Q6+dTm4unKiYMm2MKEY4bT4lfbXHWOrQ?=
 =?us-ascii?Q?ObhiIvBB5m5qtKUMynXLRiDpPVKNRdzq2HWLZOiKZwn0oaPz1gWV2k92u/iG?=
 =?us-ascii?Q?HmZSLdJV307nwDxia560WqCeBOJlC7VGP4KDfnAZExMY0SujzjicxE5GpTJf?=
 =?us-ascii?Q?AbrhDArwNZug4K88HbcUU7PgEGzI3Bef8VPNqjAm+nR2DRKTyJKslxzqsjq0?=
 =?us-ascii?Q?kVx8s47UUWLc98p/Ouf9Csum9ufP/XW3J52Tw1W2Q+HD0hDdouXPut8uOS7x?=
 =?us-ascii?Q?8iiIOf/nAcFSrBZyCZTitWSuwvBB9UbDNmx3RHeXknLBe/t0NzKsfrgrnS16?=
 =?us-ascii?Q?hl4u8pWHhLD8nQxbtIKx+ZsYLxuYF5lkY2G7GhK6HtVX1I3DQ/oo74IXtmIY?=
 =?us-ascii?Q?BSsy7vG2n7fjyASXIk47Qq4Z6flIMmmc6H+ij8CaiU8AhoogkhQr5nk9R2mQ?=
 =?us-ascii?Q?aymXmLmfgrnNqPbMyf/j15eSBkWVLH/DYYrlTkm+AZqdsc+6zG6iutn9Ds9t?=
 =?us-ascii?Q?AM9ADaU2/docLFw8jQqgTuEyBj4RD0Su4X5uf219d6HAXnOjtevK3D6bQqMk?=
 =?us-ascii?Q?eGn+wP6ZyvGgAAny/QALxCFhTGEZnXwK9jIJZSQpq75gES8G4bnzFXO8JBxW?=
 =?us-ascii?Q?X+zMsBbStKS3scbOEtTMntLKWRJ5mi3YkaoORZTinYVwU+O1GnXrvwpHWNJB?=
 =?us-ascii?Q?ldyT9DONOBK1w5esfkI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1R3lQTN3dQX6PzOAPAYiluEy+PuLtfssSUW8ktOpgCinWFPStoPF58HRvkrP?=
 =?us-ascii?Q?FddT36ZUTGfaToKxflSI2/+Z7FBF3V3vwTpDVcNcyZdOGql8dPrJlfM9emN0?=
 =?us-ascii?Q?gLCNpHjgz0Ucybd+e1Vi8WVg2wS5QQDM/aMzdRKb41V68YopokEI2ia+lQvd?=
 =?us-ascii?Q?K6uhzNzM6/+fIyiPr/UKmR3NH8wliqP84mu1FYvLBZt7nJ4eT835yGKfPuB8?=
 =?us-ascii?Q?0T2DHjFixm6h9krNa9nRnYaz+xQcea9LH2L/ZaPJ6BGBpXKIsMHg3Mo5PaSI?=
 =?us-ascii?Q?/pQV873RCiiHWPl1R++i9PcwgjU/G+dsqVC7XiHXiVVKH6sA9qddWYDiSzzI?=
 =?us-ascii?Q?EF5Oa5rX09UmvYXBSaKiEBweHegP/B9JodEvBaIakPJbP92FYunjg1kNzXMw?=
 =?us-ascii?Q?2q0+ZCA77AphX0V0/w4E3g0VHPsLxB0DLAYlN+tiAVO7ZOLEEeyXdzF4O4yT?=
 =?us-ascii?Q?2rZJS1gUkLMii763ipFi6bALryr7kKmrhVQrSGip5d/upKtlafYatXhlcZZZ?=
 =?us-ascii?Q?A2MO2vwSioQnRxNQ1aBoSKuINOMejlgEiTnP4yKDV13rxiOj4OvGIUwGaeKQ?=
 =?us-ascii?Q?rdh9+YQYtytVTuJC+LwhnQK0Z/jnnlsyzonly/+SlTSGSw/o/YBhkXXEMQfb?=
 =?us-ascii?Q?tVU4UVfkMfgh44B8H3kLUyFVE8J3PzRpM1FrxsxaBviFEPBjTfeVyjsP8XYY?=
 =?us-ascii?Q?bsA5xl+nwl6MxnK+JNzefGB/qWblYnzFCFJTldbjGfky+Jn5LQ2Nqraa3MKY?=
 =?us-ascii?Q?KwXQ1iCs6LRNHg/XC8Isb0O/sonTxZXOWjv1WDzOVaQSj+bYcbM/4znza2Xu?=
 =?us-ascii?Q?UUJc/XclnSbqSO/QqMGsL4F6nfvXzkN+Oz/hM3x+Odv7nM9DgHuWoHV0pNiv?=
 =?us-ascii?Q?63u0q7hDOPoXuMFyhDUTrZjn2JJEGdnbq2BM11z83VKDHI7qXq2IU1soEP/y?=
 =?us-ascii?Q?wW4PeA1wGAMvPHc3UP6sBw4OILOuLfDnJneneoRqc4BXzaDgHvCzOobt+L0+?=
 =?us-ascii?Q?727L6PlM3BHDtCnO8UQTsGgVsGkhAtNwxfM39+ZSGlVnvxQR/Z6qQ3d1HJvz?=
 =?us-ascii?Q?G8lOpJLsNV1cJK+DB2pTuHTL3lKnXi0Nuo35NVMHkjr9WwgnDvE29ZNp4SlI?=
 =?us-ascii?Q?P1OmgoD8Nn0zMhhccSRBEMHsMIl8mOjS7uEDB2h++P8Mz+sylnUVY2C3A2CX?=
 =?us-ascii?Q?+kkYOahIv2TpCxmUah+mO7BkHVBtTRel5BR9PQadRdd4c45ocoVoDwstOryp?=
 =?us-ascii?Q?Jgv6kM4xnSAW7MSlq8kq7O0RwIwf0Uv0GDILqKHRecGn0s3jwuoC0DCMp1ez?=
 =?us-ascii?Q?YAcaSqrOmZcoGOgPrhHSYoPxwkACqWjVRxxz1z2f8Ajn5TJf3vLNuGPH2vsy?=
 =?us-ascii?Q?T1c2K1zUyYABmdFR8K6FgUO28TZIuD0pJ8dD+YCLa1Fr1jApFcLW5XBTYEGO?=
 =?us-ascii?Q?5XAhq08t/0bhhHNrd/rOi/LNQ+YtI2+nnpaN1DeXPZsWZJU4G+Ed7u60D2ZD?=
 =?us-ascii?Q?tY5Gbdc8bbuZ/L5AoiQi60NHcPphzHszS1INqUJzveoGCG/bG0bTkvLIT3Xe?=
 =?us-ascii?Q?ZdZoydTFZ7sVb3Wo/JjkYqyJSnGm7L48+g5wL0U0147LS+EIAnL4Hebg3O5e?=
 =?us-ascii?Q?55rQ2n0aeseCR/VaiHiJNBDnpm1c1Ch3tIdTDzgTaYhKnVw/ds11egADDlhk?=
 =?us-ascii?Q?no21vHfc5jmTXI9wZRiEoXfxUuWC3q6GCRJ7d6p7b8gj7qp9ZDT/8wV8dgvp?=
 =?us-ascii?Q?f6upvt1e8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22383cc6-48b1-498e-e5fc-08de5d0fd9f4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 19:19:39.8264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ik3HSsKfXFC1jYPKaox1LsCmFQ6rZAHOUNnJ7jMGYpaRAhFIZTAq5q5KsPAhKWNC5oIpbkxTkNCLwcAP/T2Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8547
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

On Mon, Jan 26, 2026 at 01:52:07PM +0100, Maarten Lankhorst wrote:
> Add a migration selftest that copies either from local VRAM to sysmem,
> or sysmem to sysmem. The idea is to validate whether accessing VRAM and
> system memory works, so we don't run into slightly harder issues later
> if ATS fails.
> 
> TODO: Do we want to run this all the time, put it behind a module
> parameter, or only if DRM_XE_DEBUG_VM is set?
> 

Yes, behind DRM_XE_DEBUG_VM or just make this a standalone selftest. Or
just drop as once ATS works CI should be very stable.

> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_device.c  |  7 ++++++
>  drivers/gpu/drm/xe/xe_migrate.c | 43 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_migrate.h |  1 +
>  3 files changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index aad4aa53a51f9..4e244c0ed23cc 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -46,6 +46,7 @@
>  #include "xe_i2c.h"
>  #include "xe_irq.h"
>  #include "xe_late_bind_fw.h"
> +#include "xe_migrate.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  #include "xe_nvm.h"
> @@ -974,6 +975,12 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	for_each_tile(tile, xe, id) {
> +		err = xe_migrate_selftest(tile->migrate);
> +		if (err)
> +			return err;
> +	}
> +
>  	err = drm_dev_register(&xe->drm, 0);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index cbcac57b2c760..bf2000d8d7c23 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -37,6 +37,7 @@
>  #include "xe_sriov_vf_ccs.h"
>  #include "xe_svm.h"
>  #include "xe_sync.h"
> +#include "xe_tile_printk.h"
>  #include "xe_trace_bo.h"
>  #include "xe_validation.h"
>  #include "xe_vm.h"
> @@ -519,6 +520,48 @@ int xe_migrate_init(struct xe_migrate *m)
>  
>  }
>  
> +int xe_migrate_selftest(struct xe_migrate *m)
> +{
> +	struct xe_tile *tile = m->tile;
> +	struct xe_device *xe = tile->xe;
> +	struct xe_bo *mem_bo;
> +	struct xe_bo *tile_bo;
> +	struct dma_fence *fence;
> +	int err;
> +
> +	tile_bo = xe_bo_create_pin_map_novm(xe, tile, SZ_2M, ttm_bo_type_kernel,
> +					    XE_BO_FLAG_VRAM_IF_DGFX(tile), false);
> +
> +	if (IS_ERR(tile_bo))
> +		return PTR_ERR(tile_bo);
> +
> +	mem_bo = xe_bo_create_pin_map_novm(xe, tile, xe_bo_size(tile_bo), ttm_bo_type_kernel,
> +					   XE_BO_FLAG_SYSTEM, false);
> +
> +	if (IS_ERR(mem_bo)) {
> +		err = PTR_ERR(mem_bo);
> +		goto out_put_tile;
> +	}
> +
> +	xe_map_memset(xe, &mem_bo->vmap, 0, 0xc0, xe_bo_size(mem_bo));
> +

CI is complaining because tile_bo and mem_bo dma-resv locks are not held
when DRM scheduler dependecies in xe_migrate_copy -> xe_sched_job_add_deps
-> drm_sched_job_add_resv_dependencies.

Matt

> +	fence = xe_migrate_copy(m, tile_bo, mem_bo, tile_bo->ttm.resource, mem_bo->ttm.resource, false);
> +	if (IS_ERR(fence)) {
> +		err = PTR_ERR(fence);
> +		goto out_put_mem;
> +	}
> +	err = dma_fence_wait(fence, false);
> +	dma_fence_put(fence);
> +
> +out_put_mem:
> +	xe_bo_unpin_map_no_vm(mem_bo);
> +out_put_tile:
> +	xe_bo_unpin_map_no_vm(tile_bo);
> +	if (err)
> +		xe_tile_err(tile, "Migration selftest failed with %pe\n", ERR_PTR(err));
> +	return err;
> +}
> +
>  static u64 max_mem_transfer_per_pass(struct xe_device *xe)
>  {
>  	if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 1522afb37dcfa..92f40bc671d40 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -112,6 +112,7 @@ struct xe_migrate_pt_update {
>  
>  struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
>  int xe_migrate_init(struct xe_migrate *m);
> +int xe_migrate_selftest(struct xe_migrate *m);
>  
>  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  				     unsigned long npages,
> -- 
> 2.51.0
> 
