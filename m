Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B15C5AE59
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 03:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7C610E1C6;
	Thu, 29 May 2025 03:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KnviwWS2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DF910E1C6
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 03:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748491181; x=1780027181;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zbVzmd3+5BBFqd2BZAI7Ail6c797ZM4LAtztX4+vJGU=;
 b=KnviwWS29xbp3JoTTfr/BkuM8dQMUX92OMegSGl+abV62H3xa/yLH7qN
 yuhmJZZQqJnFVKlJBNnO9nYF2XONFIwEp4M7b8YZ1BkriRhBdnLwVodHa
 qq+4Nf53zwkDFfZyHCdE+H78eu+VFKJj3SFYxEj9lsaNpjpA5Z4RfRvI7
 u/1I0oUSgstzSzs5huYOEKM+l4U+hly4frSlzjL7NlM7SNi1D54X7enBA
 eTPVnYGA/2PdI4QDIPoJDdNp7k0iapxEG0an38lcNyVzf8KDz2ojAYH4y
 DlDV9RAj1qbYCBJMYsOGAiLhU7FN1M2TThwO27KwBWy7XFV041iDoudoI Q==;
X-CSE-ConnectionGUID: M7Yg9dOVTceqdIG4mB+6AQ==
X-CSE-MsgGUID: xlRDIYrWTWytXmA1t9evpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61198854"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="61198854"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 20:59:36 -0700
X-CSE-ConnectionGUID: UiHfPFQNQU27qSZ6JmjCRQ==
X-CSE-MsgGUID: KzvBP6OqTMiEK1FdftC+6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143462550"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 20:59:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 20:59:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 20:59:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.89) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 20:59:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMAalQIWEg01Cyew5jvvyZJX4/ZixayKjdjob2rfeJOKOfUiRCe0GeVXqk4q/a2wuK5hwlLx+wgFhjcmLedkmYjEJf7/jaYFMstGj7dYul8sIwWQtU9fy/fy/7J1lhCrH6LbQL2NYgWmGPxN/DXnIZeH6cya1eRFFd98MkJN3MXfKV1h/4esmsT0UA695ATYZE/iLOW0HwkRe1Z2iP/IT9P72UIoRKWlEWf7wg2esImJ7HhwuvY9/SXC00H3z2V4BGRzWD5lvyHMAvIKGzBeqafNM/tytpF5BN7I5OTbb4EyczhbMLo1v+NlpZ6YMPmjPtikiHyvCoJf72gp0j/9EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+VMTkotkWJRNcYSghkU1RoCwSTOJQz4vUPDRlXd4r0=;
 b=rXIe4vmmdGmXUPRZ3wYrpiXow4ATyGv9o2f5HACp1Nn48zzvqlHS5epCFxmKVf6xA0G6thRI+fjdeo4Ec+x6bjqegAhvVYqdZ7KGqmYqsMPZB96gN6Uk2FFmLurB1ZqCrOpZ4IFopAUpIr9DU2xwrhHDAyJ2Qqmsq3BePmiAGeH6Z55Vc4rbUKOtLMvd62uAk0LZfvLgT1ftOjnFJFCru+Iq5lU+6DWBfstcx7cgPcZPt5gLlSdE+wCkDjKEXmeFosxhZy9s78kpmct7UqhcITzoAW2xOTf7eFhQAFYaG/Q2d7sFxxaH1onc/LuJCt/Gns1TPJz58x5Ji9UaSGjefA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF10012BF96.namprd11.prod.outlook.com (2603:10b6:f:fc02::a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 03:59:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Thu, 29 May 2025
 03:59:00 +0000
Date: Wed, 28 May 2025 21:00:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 08/19] drm/xe/svm: Add
 xe_svm_ranges_zap_ptes_in_range() for PTE zapping
Message-ID: <aDfb21fATPB4xyyJ@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-9-himal.prasad.ghimiray@intel.com>
 <aDeZHeonaIwMzu0j@lstrano-desk.jf.intel.com>
 <adc4f3d7-7a75-4672-8ba4-7269f6e71b2e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <adc4f3d7-7a75-4672-8ba4-7269f6e71b2e@intel.com>
X-ClientProxiedBy: RO2P215CA0049.LAMP215.PROD.OUTLOOK.COM (2603:10d6:10:d::18)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF10012BF96:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e62ff77-94d0-4851-a4e9-08dd9e652488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sjG8fYVrAPjgnB9t0uqfFojo5BU3Xs4+A6kkXsnj4dQ5Y3TkWiObn1m4TuqG?=
 =?us-ascii?Q?D1pjo87Iu98tegGCKgGFpizbFr39atww6c/t7X3+I+VEFTavRYuQujoTIN8l?=
 =?us-ascii?Q?xiOQ3Xy2hhEPIza79u5WUIw29U+n4s4V8zlujBk8v724/R0mLxc+LV7tlnIM?=
 =?us-ascii?Q?7sfdvnEZgTrZtRLtGwlIJFB535y/jIu6xD35+C98E2liCK6EKegT9RiEYHce?=
 =?us-ascii?Q?6s7VMrnqGIovUWRsn+J6D0p6dR3b1Fd08VirUekTdU/pXIxjgxqY0hNRzwgs?=
 =?us-ascii?Q?/+O7P+aO7nLfYmolSo1lesjhQo7zzoTuNQ77ai3veBYXY3Di60JJuA4YYt50?=
 =?us-ascii?Q?a75MeR3oNQQZy2jyEKtRvVmvqkHGV6ug5oqWPsCaq5YtfvMkNR5eluoeYrv2?=
 =?us-ascii?Q?NZu1xLhdbOy9V3SYh//Nkj7DXIzLPLE3Hv4ExOvqeVpt4OmdEwjkovARkJ2k?=
 =?us-ascii?Q?DyjYHRIKvkQm39fO6+W3ScjAPSkwXttt2Hj3RDo8FPPoTmGPhjNozBLiqxvp?=
 =?us-ascii?Q?OleJnhpITvaI9ktp18HLOUPGPZhDnwW0CG4PrbjwCCUOLDDNSW02AcsD3V9V?=
 =?us-ascii?Q?0omzANeRvPqAaPxX9tY/CWIkMtdAHBB4/k5lZyDbJROPNMKUXxOuuE2Nsp5a?=
 =?us-ascii?Q?2fp3ECfuRyXpmzHT1d9fplSZwYJHIEQ4MFMWxc/prPgvlxAb3LJtSjjkJ5Jp?=
 =?us-ascii?Q?cj8e1qaeHlE9v2eg9JhVGzTtjAaRxxc+TE9qmmx948cLvWsIYhE2iw9+J33U?=
 =?us-ascii?Q?aftsJ4ld4Ei7s0PVH4crW+NM8unY1IcmpVLq8zqHqBzw4c6DDhGd0GccuDn/?=
 =?us-ascii?Q?HJZzKWLZjmu/J0KURYMWlTBHsaMoFvN0xguW/LyyH2rMs82dYFDiNfodlaPQ?=
 =?us-ascii?Q?46S/AgbUxTGHikgJC7AqnU9PxGqHoGXpPzTRiYLHSuu0L2THfOzMZVS00WNk?=
 =?us-ascii?Q?A4bnQpcLd5Kvt+nhwSDBW3Tap7DLvuDxCJ+JoMwGoTxa41iCYnNOT4QPN6xd?=
 =?us-ascii?Q?2rwvu9L+SZXLUu12V7Ganob9lRQYq7vxNG6mprCsBQLX6g0zubs5Sj/Wvl00?=
 =?us-ascii?Q?zhRJjiZvhh27b5LC9OPV7BwoOyZkNDqjVsF2H7fwjCFoEEEk3151uMYMA7Uu?=
 =?us-ascii?Q?DXkLDbT0v/G4mEa/8AW7wgnNNdRYOysdGDyFn2cqojupUvKM5Ao0pRUp9i/N?=
 =?us-ascii?Q?Yu2rkW8K1cIy55ULjXmRib7hnxDKOuqKFoTA0K1STBfoIxONRsYhQ1aHjO+9?=
 =?us-ascii?Q?12BNdm25s48XjasbchBmP7njopYDI5VQlwg86R1gESgSlsZSTz4TZbhOrj43?=
 =?us-ascii?Q?xYQB7ny0UveFhi7BNRsbzcSbCyFm/rh8XY8XsHLB95jFXyYmhe5prsCvE6rG?=
 =?us-ascii?Q?FGVbaQGW6yJ0kHtDm8foe/u61KYdMDPESVe1NZQlwdKWlbLY15GD9g77+hNu?=
 =?us-ascii?Q?OAgZed9ewkQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QFyX1BXQOTNJKWNTdxfU0VCnMG0mgtW2YtLefN3u1lyLg7ImiPer3eyiURvt?=
 =?us-ascii?Q?dBWC9zpPIU9vSQTKokFe3w/nCLSO43+PeBTIoZiazqCBTkcHSrpE4YlH3cZS?=
 =?us-ascii?Q?j4a4TPZz7ckRsd0wCSpzYDOOqeLjq+dKQxzD/5hfiVI4dWOjOU8USmiNqdL2?=
 =?us-ascii?Q?/DxsLCRLC/agiLKJdy+TiuDJ4lCuhYI+rJpMMiMM1zcytmjeDhMGvFWvMUDu?=
 =?us-ascii?Q?TZL8cUz5HQ4Pd0YpNTP3eyvmQGax4m5zsrVVMmPh6orLCa6iZ/V5iyyVAZJe?=
 =?us-ascii?Q?Qd26lzAU/LDbRxTIdVKY8/MJQBaFdLi+1sw+LRc300F7lifnTs65LpgDHsjM?=
 =?us-ascii?Q?0hKarcd94pDVhFeXQakWH4cz0Vo5gZISdQzSSBtzxMIGNgoIyzGo/L0gm+Z+?=
 =?us-ascii?Q?VpvfKHwIDx8dKMkmdiRup2blmctJilrwhdztFP63PUlcJ1z/FgGIsxyl797j?=
 =?us-ascii?Q?VnwKaHEFhRGD/zogqFlSL3TsDACzfzOC/Klp8mcQp9pcvUOY60Ob4TuZspTE?=
 =?us-ascii?Q?2NwETl1eokE77Bwx0PYpSJZeyenTIArYPjW/QDU0UWoVmyYCmIiBCpmDc7Pw?=
 =?us-ascii?Q?L5kquL+0JnpXlf67fD0kX32lpNA3Su2jQASMJtXQ+bQnY2SiVpPBugDBAM0w?=
 =?us-ascii?Q?P62vNBMhivLnf47L7hpAInw93EeaM5z2ra1Ram6Sg8eENMcj+G/eAjlRod+y?=
 =?us-ascii?Q?maMBuPO61bqlBAA5ZSS2Nlbwzub31fCYaqZUyo7uUXXlMECPOypRV0uMigzr?=
 =?us-ascii?Q?TY7e/mgJauft7dPoil1yZSH2t3SMHdE+4evcqm22WfbPfUVguojHn/o2U7Pm?=
 =?us-ascii?Q?3PBM2R5PDmPGwtFwKThqfYu+gXmZiPbAfPV/edJ6+IpaOjTelt+aRDtzAxjB?=
 =?us-ascii?Q?ftR1mLEryEeSpR93i55+KOItym3oYmL9AhjkaafLElBxMk094beVM5nbBpv+?=
 =?us-ascii?Q?nTZzySlfvdaNRPmmlix7a9jmxHzWDLL3APVl9u/NMQXS/c1gsVEsdqla3dqW?=
 =?us-ascii?Q?MiAa5OLhCOciDJtXmDdyHTqNm1w+tl8Igzz2AGJTpJtN27nzfoQfln/sTbgd?=
 =?us-ascii?Q?QntxYbwEauCec472HJXXlxsJCI1P0TJ2SjXtkIfR/QZ8jg/jbmIfQ1Ac2vWC?=
 =?us-ascii?Q?7H/g2ltCSil1iZ6XVqstsyDenGK86q16G/XsSZnAcIC+IuyVKIg3Nw/7zKex?=
 =?us-ascii?Q?IqBZIgpyFiUYUCRg73y7BuU+hnL648BHK1szMjM3sEIznGnK6axT0Oyt6dOW?=
 =?us-ascii?Q?djS1wkBhCnZNu4YWu+Bi9hzLrzT2HBNVprRjL1qjJnAM87vzkpZHK5S4PGez?=
 =?us-ascii?Q?tBV61nqEcPHxKxCfq6jaRTzXLRDNn5xVkq7aK/cJ/CXtjyNvAP4t9BolNPEq?=
 =?us-ascii?Q?turib91aYka2TyDYLL4b+7Ey/89Ict+FdCXUFU6KnFtUZNWP7PUu57fEfJuO?=
 =?us-ascii?Q?hJHYSl3+fN9SRlZF36VrrEpLDI0V01QOnbFoax1M1aNgR1NOfwRgdfjmvVBw?=
 =?us-ascii?Q?VyMASB/pgZcLut8dbsM31ZthtPDD8x36MXWtrS91etkOS4eg7/aG3Ku4TYQy?=
 =?us-ascii?Q?hW+fqO6fmHwK7Wt9lvGZobaolN4gg4oyT+ilwkCywjxSFoW88GS6fH9+mTkl?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e62ff77-94d0-4851-a4e9-08dd9e652488
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 03:59:00.1437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+QPIoQa4Ng5yU5KNcOG7dtAFjZoajgqJVsbpXOa3jJ4lZDhft+0qgyaJ9GsPX/TCmCfiDZcJD0oWJP1+RQ1KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF10012BF96
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

On Thu, May 29, 2025 at 08:36:28AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 29-05-2025 04:45, Matthew Brost wrote:
> > On Tue, May 27, 2025 at 10:09:52PM +0530, Himal Prasad Ghimiray wrote:
> > > Introduce xe_svm_ranges_zap_ptes_in_range(), a function to zap page table
> > > entries (PTEs) for all SVM ranges within a user-specified address range.
> > > 
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_svm.c | 43 +++++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_svm.h |  7 ++++++
> > >   2 files changed, 50 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index 59e73187114d..a4d53c24fcbc 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -1006,6 +1006,49 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
> > >   	return err;
> > >   }
> > > +/**
> > > + * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
> > > + * @vm: Pointer to the xe_vm structure
> > > + * @start: Start of the input range
> > > + * @end: End of the input range
> > > + *
> > > + * This function removes the page table entries (PTEs) associated
> > > + * with the svm ranges within the given input start amnd end
> > > + *
> > > + * Return: tile_mask for which gt's need to be tlb invalidated.
> > > + */
> > > +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier;
> > > +	struct xe_svm_range *range;
> > > +	u64 adj_start, adj_end;
> > > +	struct xe_tile *tile;
> > > +	u8 tile_mask = 0;
> > > +	u8 id;
> > > +
> > > +	down_write(&vm->svm.gpusvm.notifier_lock);
> > 
> > xe_svm_notifier_lock
> 
> xe_pt_zap_ptes_range needs write_lock, whereas xe_svm_notifier_lock/unlock
> provides read lock.

Hmm, I think the assert in xe_pt_zap_ptes_range is actually wrong. I
likely just added the in notifier assertion because that was the only
user of it. We want to guarantee that only 1 KMD thread is issuing a zap
or modifying the PTEs at a time.

- The notifier lock in read mode guarantees that an invalidation
  from MMU notifier doesn't race here.

- The VM lock in write mode guarantees no one is modifying the page
  tables.

- The notifier lock in write mode guarantees no one is modifying the
  page tables and invalidation from madvise doesn't race.

I think this complex condition can expressed in lockdep by:

lockdep_assert(lockdep_is_held_type(notifier_lock, 0) ||
	       (lockdep_is_held_type(notifier_lock, 1) &&
		lockdep_is_held_type(vm_lock, 0)));

If this works, a comment explaining above is probably warrented.

If the above doesn't work or we deemed this to complex, maybe it fine to
just take the notifier lock in write mode...

I suggest we get another opinion here, perhaps from Thomas.

Matt

>  >
> > > +
> > > +	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
> > > +		struct drm_gpusvm_range *r = NULL;
> > > +
> > > +		adj_start = max(start, notifier->itree.start);
> > > +		adj_end = min(end, notifier->itree.last + 1);
> > > +		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
> > > +			range = to_xe_range(r);
> > > +			for_each_tile(tile, vm->xe, id) {
> > > +				if (xe_pt_zap_ptes_range(tile, vm, range)) {
> > > +					tile_mask |= BIT(id);
> > > +					range->tile_invalidated |= BIT(id);
> > > +				}
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	up_write(&vm->svm.gpusvm.notifier_lock);
> > > +
> > 
> > xe_svm_notifier_unlock
> > 
> > Matt
> > 
> > > +	return tile_mask;
> > > +}
> > > +
> > >   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > >   static struct drm_pagemap_device_addr
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > index 19ce4f2754a7..af8f285b6caa 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -91,6 +91,7 @@ bool xe_svm_range_validate(struct xe_vm *vm,
> > >   u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
> > > +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
> > >   /**
> > >    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
> > >    * @range: SVM range
> > > @@ -305,6 +306,12 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vm
> > >   	return ULONG_MAX;
> > >   }
> > > +static inline
> > > +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > >   #define xe_svm_assert_in_notifier(...) do {} while (0)
> > >   #define xe_svm_range_has_dma_mapping(...) false
> > > -- 
> > > 2.34.1
> > > 
> 
