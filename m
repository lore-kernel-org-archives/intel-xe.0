Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49911C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 16:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D923E10EA37;
	Fri, 27 Jun 2025 16:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U880Y4bg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABAA10E9E5
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 16:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751041819; x=1782577819;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WSU+OujEVsc8c2rB6nMA/0Nhkvyt+mbBJYaQeZs0nAM=;
 b=U880Y4bgmK+4QU/SmsqH2fknuC3jiCM6c2jiUksbLUh+soBXyuguYbS8
 p3CfjUiMAPCmUu2eNz9q8i9VpkQFY4YY3XFHYAta/Kil9259O4Q74MsqT
 0ZbjXIZ5WVkaiO5VikP5v0RRcHqdUeMqORnjAGexBqg3z8GtJQdF34cBq
 w08wE9sPEPkMk1tEUd5rlse4FgtTO4DQJqn3TCuvi/lGAqKieL/oW7baC
 0pv1/SJX9KZActPHQq6j3ktkaSaP6p8/x3DMy+nxwhhX3T/3CWl8n7pAb
 f2bOpQ2MDlx0hyAUEW9xMMeRMjLf4KImBVR/b5fot6H9BLu1sFBPrR0cb g==;
X-CSE-ConnectionGUID: /+phQXKgSXmnIN0S5fB7Cg==
X-CSE-MsgGUID: Th15GhprTeqmjDcePk6T0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57037369"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="57037369"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 09:30:19 -0700
X-CSE-ConnectionGUID: jt+sQBBsSJiW+Wty1Z+S9A==
X-CSE-MsgGUID: Khdfsb9KQsC3KYw2WrwH/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152370728"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 09:30:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 09:30:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 09:30:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 09:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AC4mkaeWNJIE8U47MMnDzMejTAQgLZUUV/15lDF2PJcdqj6/MRxxLa4Ywa49ebTqLXCFQMlY3fiaqZfgjYpBQPcQg/BhwkBIIbHGQaCbugyCq4XyVVTlhZ/HgEWmeiLxWAssBd1MEhFce1vi0faVe3QcYaBUmyHEshQ/k0s6wovXftlo91ChVV0oB+clXbv0IkNTNq3bNVktY4BbR51yPJsVxb21k7V0YHYnr+gaukCcEmFDIRScRu0/KCYiZfsYnukmaezx3yGFKz23hRh/ldZVuF+vVXKXHrRXsr1AMXMNZ78LhDJL4qg+s0EDutIj6KRd9ESkLVak4GiJEhH57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIhWX0j3+KkkjTo/PGsxW3N84KNae0K5fndUDd2HqWI=;
 b=AKY2G5AhN0fDHw6IJwaDfd1Qo6/yOwfb/oefAmJj4dQvrxgK4GaQetTkHJEWhrURQgOrmVqX+GjdLpii/qG8dGiiSKE2F1o76vQQlOuxUblF7fTTP2yPNCnYlhti0gU8J+ERbd5DK3h70tCgIXEoPMZsCl6+5N6aGco1MP1CWYFCc5iBtmkUvOO9oOpDmkGqPe+3fcC7WPJ10ENJ1gITrMHIiXAKSO4s/1pSJ81EgGQcWX3g9ldRXg/26i2Beui1G+Y9ND4CG4Xbeac2UL3gDqVacOX3oJPlJQ8SRYeo19n+47PO1q5/KZy3ask+hDrIl+nqV362ULn7ay3oZsxr2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB6565.namprd11.prod.outlook.com (2603:10b6:806:250::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Fri, 27 Jun
 2025 16:30:01 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 16:30:01 +0000
Date: Fri, 27 Jun 2025 18:29:57 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.mrozek@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe: Add more SVM GT stats
Message-ID: <aF7HBdf7QNKPDVLF@fdugast-desk>
References: <20250603233445.2304383-1-matthew.brost@intel.com>
 <20250603233445.2304383-3-matthew.brost@intel.com>
 <aEAe4dnl5MaFW0r9@fdugast-desk>
 <aEBUhFQIugQ96l1k@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aEBUhFQIugQ96l1k@lstrano-desk.jf.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB7PR03CA0102.eurprd03.prod.outlook.com
 (2603:10a6:10:72::43) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3c1864-15b6-48a2-6394-08ddb597dd3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ef9Cl2ZJHu9pqlzD6A8UnC1MyeXzkIErEGyjJAVO67thehBhVDaX6sCPwUzu?=
 =?us-ascii?Q?loyiUjAitO0PsrajD5LBzLEebVVH0vsVTqmDuLbv7owkWaiXYMq6QEpXXfLE?=
 =?us-ascii?Q?Q1KCl45q3hw5GDzNPuAg30RIhblLgawmjK9XkNzwbkuWBJEux0VK0XHN5ngQ?=
 =?us-ascii?Q?zKC+GwcAn2aI1wCHZVJgOy1KKbmFetWWYTHCK+eWwltPHW7FlQuatYvO4z5A?=
 =?us-ascii?Q?fYH2VfcGZrBghantNzg/VMyL5PKnVkky7vrgiYVIY9SR+plYO7p+9XjMWMU4?=
 =?us-ascii?Q?buwa9cKAd9vlpBLreRHwmd2rV46MyGd41jTw1JmnWiT0vUIO0yjtkbQ4GHiU?=
 =?us-ascii?Q?JFGuXvp8ergYUshdvejW58eFuMi7Gn68buBKcQB8Ii3xHNSvIQG9Wq98dcLr?=
 =?us-ascii?Q?iULVgpAOjiERXYVPdnt0oPvD3ytVqYjjettT2eulaHaz59QAmVahCD6YibeP?=
 =?us-ascii?Q?U8Ovx8CCRdESo0xfM/+88E0vm5s4XQffKInMrRyZsCdGlUCBQHF3MBUfqtoc?=
 =?us-ascii?Q?m9iTKlaR4nHv1KgNn1GSyykQj5aaSNhOlFMHCCgvKNOU/GeJsEKnRL9QYJma?=
 =?us-ascii?Q?rfgVSi6C5L6Ees77kf8XR60HHaLnLY9Teq+CbJ8+XzBpUpBTW7uRBr2ECIdO?=
 =?us-ascii?Q?slYjrI0sam1eXQb9HBLu9dTfgVI+uOH3KNrl46HLbgPFi9AFBNqG0y7cYd+l?=
 =?us-ascii?Q?bgFmsG6W7isEcO6QsFenN4GAomooHoY4O2c5XtUCtaPQ+bCrJUaa9yLRMGAS?=
 =?us-ascii?Q?gaZH5K+jC+WnFD01FBOX67Ebk03h6Nfp3Gvf/vMT4Yz2I2INfgB47EIJQawD?=
 =?us-ascii?Q?miIob9Bag6y38plrinUDY3kc1oF1rAYsbtANH3G1GjLVzPYVsu2lp1uAqwmU?=
 =?us-ascii?Q?CxO6VKgqx+Me6hu8azCzEDaQePZEm/hsdcfPIjUDisBtJVQSml7lZeIFXdJ/?=
 =?us-ascii?Q?HUqYaNDpARTch3CJ9GJ/VFZaxTEh9RXIQJp0rLTawxJEy/tOAdq9iAutyCaD?=
 =?us-ascii?Q?Y1o1vJPX/TnqAgsqAw5LYxAH6pcCpmuKcdoNlnSNTxKvPqAJHXTrc5K0/8JE?=
 =?us-ascii?Q?ef3ujwi7FOzkLgEDRMMGpRYxcVwfDkS8Ppom3PG98ew/eStz2SyIt6JBnHem?=
 =?us-ascii?Q?UvJJbhwRGOk1zkryIzfj7LepsUPT/hr3byb3fsT4i7UzRkg2KioW467JN59c?=
 =?us-ascii?Q?sGjIyQETValyXCN+t/lXaOIvaBMNJMel/0w+FxtpAT/7skuJ5IVw+1E7c3MW?=
 =?us-ascii?Q?K4gkpGFA5zjd7k1xxpWtyYtxWBAUwFe5C2MjUnyhLjEA6ZV5eiJBGwyl8vTY?=
 =?us-ascii?Q?6NBHsuyhvvPEl9JwMaamghWfFbiUOJg1KacGOk2c2JufM2emMqDMAbwVMzAB?=
 =?us-ascii?Q?XL9CqsKG2Od89pPoZR3rF/BOMsNQU5WQzfZjGuOPWlAaeMuCdWWBDsSRim+8?=
 =?us-ascii?Q?dT1fRdV4Dp0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jXtZKeSaQTz8yexISF4+W1Ffif23BD0HiMCnMXLDxejOdo0/VUU5n+0z7pdc?=
 =?us-ascii?Q?KrmB1Rx7eqqNr3dw2DflOvYYmXZWhYrruTeqqlK6QZhArvBmNtoCxdZj4X6D?=
 =?us-ascii?Q?oV7FiH9R6wjJp7PWp/po75mzkbqUTgoS/BGiRm268zjaA79xBbqOkUosJpCH?=
 =?us-ascii?Q?+hjFjozS/mEH+E2yAe7UQwQDiQbzjI+zg6N/SogqxlTW37UJvUPLvqZ4fcNR?=
 =?us-ascii?Q?ipuZSkw/Ay/ow3JW7zQZVDrd7mpJgGHrcbPybN1T40CVUVIsmFtCU9RU00ty?=
 =?us-ascii?Q?6jS3rD9bCco8iBPvkNieGeY6weAic7FLlmTSdrLfbCQrAyCA2gGsAi9P10Al?=
 =?us-ascii?Q?biYpMDJwsEsne8uwqh4txPK3xnD3srnkJzJ3NZxnqgfRwigjRzKNuNj89ACu?=
 =?us-ascii?Q?7pVyktcoiJD2aELagWU9GZ6EPCatrO2UwL1Y+dV2tiw8DYf48o+REXOh96vS?=
 =?us-ascii?Q?gzr7cNR3lBSDF6ZhcoTopt+LNnDuEeMVi5sEZsQ2wN7Vg0E+uZOpl4p6MvGg?=
 =?us-ascii?Q?ncC+AC/a/YLalH0fRvy2doEdUbBU+kkgrHO8JIzQbKKKI6/rrvFi3+3WpX8F?=
 =?us-ascii?Q?VcQrXeFehVzeW/Ha49AdevjHq8eYWmnZPtKk5HeMzuxd19FPPmpFxEisZAeK?=
 =?us-ascii?Q?OD/bqn26cO4/k8RpPmm9paUc6KoBbBgjBk/SJFxhGdcl2qCivpAqjIJBGoS0?=
 =?us-ascii?Q?cGexAGoi6wYMfspFrLQSXbjcVihjdnm3nGN77EQoWSp851DaXDSmWVrlssPL?=
 =?us-ascii?Q?P4pQoa/kGBeNSBUGJnheCppLJuTS0ABtS5zWsfEQVa32ty+Lud0Ka/6GY01v?=
 =?us-ascii?Q?c+I24WRYy8aLCyWQ1TML+2G9vw9nA6AZjd3bAhBuMqWnauusg5NgCUdczQbp?=
 =?us-ascii?Q?AqNSYyqz2PoRdNaKIuDRJEGnm0Ux+kvouXBVG1MnunUPTxaPXD0cbMii7XeM?=
 =?us-ascii?Q?KsvU7BoPjvC99UMuFkbfltI5nNRaw9Yh6w5Bxu6g0qMhNFpcXmEUT84aIgl5?=
 =?us-ascii?Q?ScN4y+hXjmeGpxxVO57D5mv13cFwYsrfpH8D+otCBgWkW4wVOjfSudzX0KHs?=
 =?us-ascii?Q?bSoLGd5MJSYVJFjydRWUikeLd1kEzvxMp21jDsqvaxZEJ/dDuuJ7Q+AnF4Xj?=
 =?us-ascii?Q?whW+KsnrvZft3inmPipRwcfOfzm1PLthyl1RN6MvCQqpy7P/TuVV6/UgNzwM?=
 =?us-ascii?Q?ItsF7YPJ6sYbZCD5P1yW5VRT52q/U+VN3HhCy4O9NL8llL1Op0bIUFSthPTW?=
 =?us-ascii?Q?DywV3Q8k3zG8Hg50u1C+0++WN621J2VWcm7aWfL0sE7YcqiEy8Z9v40OuGNr?=
 =?us-ascii?Q?km8R7UH2g37gv7QU0mt1FPRtCDX3aMc4xJL5ztrEOtFzM8grZ7PIg3Uc+C9m?=
 =?us-ascii?Q?owywoKJ5I/bpKLW7vg5jEcGsnFvup4KD+h+ti5YbVjs/VT5p8RsDYAGocvAX?=
 =?us-ascii?Q?9dnGeaUs2Oesm7IrTARiFszsHoq/helk6zxe3LWK8d+l0dWWQI10oQif/S+N?=
 =?us-ascii?Q?Wet+whdxMYMJP+3bYLocjomcerw+d0CGrnkH4cl8jVpgooWoBXcUR30lvX4k?=
 =?us-ascii?Q?1KkDDqf5BvBYTrB+BLOM3QrRLL1vNCP0w7vweOROqal3tDhFPbo+Hhyf72Zb?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3c1864-15b6-48a2-6394-08ddb597dd3c
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 16:30:01.4392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFdYyHduOmIc6qTCnvqkfCU6f46OqwdK3DDfIuYyIpXTYA6PBcc6A1WGvM3JlmyNCthfgsfMleHYYTavEhjOwRMrTJZJXgryhi7As0kdGAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6565
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

On Wed, Jun 04, 2025 at 07:13:24AM -0700, Matthew Brost wrote:
> On Wed, Jun 04, 2025 at 12:24:41PM +0200, Francois Dugast wrote:
> > Hi,
> > 
> > On Tue, Jun 03, 2025 at 04:34:45PM -0700, Matthew Brost wrote:
> > > Add more SVM GT stats which give visibility to where time is spent in
> > > the SVM page fault handler. Stats include number of faults at a given
> > > size, total SVM page fault time, migration time in us, copy time in us,
> > > copy kb, get pages time in us, and bind time in us. Will help in tuning
> > > SVM for performance.

After using it extensively for SVM profiling, I can confirm this is extremely
helpful. The patch needs rebasing. Also, please see one nit below. With that,

    Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> > 
> > Any idea about performance impact of collecting this data? Should we put
> > more behind IS_ENABLED(CONFIG_DEBUG_FS) to limit function jumps?
> > 
> 
> I think the way I have this coded if CONFIG_DEBUG_FS is false everything
> related to stats should compile or at least that is the intent. Maybe
> should confirm this though.
> 
> > > 
> > > v2:
> > >  - Include local changes
> > > v3:
> > >  - Add tlb invalidation + valid page fault + per size copy size stats
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_stats.c       |  33 +++
> > >  drivers/gpu/drm/xe/xe_gt_stats_types.h |  33 +++
> > >  drivers/gpu/drm/xe/xe_svm.c            | 274 ++++++++++++++++++++++++-
> > >  3 files changed, 332 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> > > index 7e12fc3759e2..8fb43cbb2de4 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > > @@ -29,8 +29,41 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
> > >  static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> > >  	"svm_pagefault_count",
> > 
> > Maybe this one should be removed to prevent confusion with
> > svm_*_pagefault_count entries below.
> > 
> 
> I think this is ok - it total number of faults rather than the
> individual breakdown like some of the stats below.
> 
> Matt
> 
> > Francois
> > 
> > >  	"tlb_inval_count",
> > > +	"svm_tlb_inval_count",
> > > +	"svm_tlb_inval_us",
> > >  	"vma_pagefault_count",
> > >  	"vma_pagefault_kb",
> > > +	"svm_4K_pagefault_count",
> > > +	"svm_64K_pagefault_count",
> > > +	"svm_2M_pagefault_count",
> > > +	"svm_4K_valid_pagefault_count",
> > > +	"svm_64K_valid_pagefault_count",
> > > +	"svm_2M_valid_pagefault_count",
> > > +	"svm_4K_pagefault_us",
> > > +	"svm_64K_pagefault_us",
> > > +	"svm_2M_pagefault_us",
> > > +	"svm_4K_device_copy_count",
> > > +	"svm_64K_device_copy_count",
> > > +	"svm_2M_device_copy_count",
> > > +	"svm_4K_migrate_us",
> > > +	"svm_64K_migrate_us",
> > > +	"svm_2M_migrate_us",
> > > +	"svm_device_copy_us",
> > > +	"svm_device_2M_copy_us",
> > > +	"svm_device_64K_copy_us",
> > > +	"svm_device_4K_copy_us",
> > > +	"svm_cpu_copy_us",
> > > +	"svm_cpu_2M_copy_us",
> > > +	"svm_cpu_64K_copy_us",
> > > +	"svm_cpu_4K_copy_us",
> > > +	"svm_device_copy_kb",
> > > +	"svm_cpu_copy_kb",
> > > +	"svm_4K_get_pages_us",
> > > +	"svm_64K_get_pages_us",
> > > +	"svm_2M_get_pages_us",
> > > +	"svm_4K_bind_us",
> > > +	"svm_64K_bind_us",
> > > +	"svm_2M_bind_us",
> > >  };
> > >  
> > >  /**
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > > index be3244d7133c..5a92226ef033 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > > @@ -9,8 +9,41 @@
> > >  enum xe_gt_stats_id {
> > >  	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
> > >  	XE_GT_STATS_ID_TLB_INVAL,
> > > +	XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT,
> > > +	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
> > >  	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
> > >  	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> > > +	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
> > > +	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
> > > +	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT,
> > > +	XE_GT_STATS_ID_SVM_4K_VALID_PAGEFAULT_COUNT,
> > > +	XE_GT_STATS_ID_SVM_64K_VALID_PAGEFAULT_COUNT,
> > > +	XE_GT_STATS_ID_SVM_2M_VALID_PAGEFAULT_COUNT,
> > > +	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US,
> > > +	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US,
> > > +	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US,
> > > +	XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_COUNT,
> > > +	XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_COUNT,
> > > +	XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_COUNT,
> > > +	XE_GT_STATS_ID_SVM_4K_MIGRATE_US,
> > > +	XE_GT_STATS_ID_SVM_64K_MIGRATE_US,
> > > +	XE_GT_STATS_ID_SVM_2M_MIGRATE_US,
> > > +	XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
> > > +	XE_GT_STATS_ID_SVM_DEVICE_2M_COPY_US,
> > > +	XE_GT_STATS_ID_SVM_DEVICE_64K_COPY_US,
> > > +	XE_GT_STATS_ID_SVM_DEVICE_4K_COPY_US,
> > > +	XE_GT_STATS_ID_SVM_CPU_COPY_US,
> > > +	XE_GT_STATS_ID_SVM_CPU_2M_COPY_US,
> > > +	XE_GT_STATS_ID_SVM_CPU_64K_COPY_US,
> > > +	XE_GT_STATS_ID_SVM_CPU_4K_COPY_US,
> > > +	XE_GT_STATS_ID_SVM_DEVICE_COPY_KB,
> > > +	XE_GT_STATS_ID_SVM_CPU_COPY_KB,
> > > +	XE_GT_STATS_ID_SVM_4K_GET_PAGES_US,
> > > +	XE_GT_STATS_ID_SVM_64K_GET_PAGES_US,
> > > +	XE_GT_STATS_ID_SVM_2M_GET_PAGES_US,
> > > +	XE_GT_STATS_ID_SVM_4K_BIND_US,
> > > +	XE_GT_STATS_ID_SVM_64K_BIND_US,
> > > +	XE_GT_STATS_ID_SVM_2M_BIND_US,
> > >  	/* must be the last entry */
> > >  	__XE_GT_STATS_NUM_IDS,
> > >  };
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index f27fb9b588de..cd7c391282a7 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -108,6 +108,11 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
> > >  		   &vm->svm.garbage_collector.work);
> > >  }
> > >  
> > > +static void xe_svm_tlb_inval_count_stats_incr(struct xe_gt *gt)
> > > +{
> > > +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT, 1);
> > > +}
> > > +
> > >  static u8
> > >  xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
> > >  				  const struct mmu_notifier_range *mmu_range,
> > > @@ -140,6 +145,11 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
> > >  	 */
> > >  	for_each_tile(tile, xe, id)
> > >  		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> > > +			if (!(tile_mask & BIT(id))) {
> > > +				xe_svm_tlb_inval_count_stats_incr(tile->primary_gt);
> > > +				if (tile->media_gt)
> > > +					xe_svm_tlb_inval_count_stats_incr(tile->media_gt);
> > > +			}
> > >  			tile_mask |= BIT(id);
> > >  			range->tile_invalidated |= BIT(id);
> > >  		}
> > > @@ -161,6 +171,24 @@ xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
> > >  						   mmu_range);
> > >  }
> > >  
> > > +static s64 xe_svm_stats_ktime_us_delta(ktime_t start)
> > > +{
> > > +	return IS_ENABLED(CONFIG_DEBUG_FS) ?
> > > +		ktime_us_delta(ktime_get(), start) : 0;
> > > +}
> > > +
> > > +static void xe_svm_tlb_inval_us_stats_incr(struct xe_gt *gt, ktime_t start)
> > > +{
> > > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > > +
> > > +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_US, us_delta);
> > > +}
> > > +
> > > +static ktime_t xe_svm_stats_ktime_get(void)
> > > +{
> > > +	return IS_ENABLED(CONFIG_DEBUG_FS) ? ktime_get() : 0;
> > > +}
> > > +
> > >  static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> > >  			      struct drm_gpusvm_notifier *notifier,
> > >  			      const struct mmu_notifier_range *mmu_range)
> > > @@ -171,6 +199,7 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> > >  	struct drm_gpusvm_range *r, *first;
> > >  	struct xe_gt_tlb_invalidation_fence
> > >  		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> > > +	ktime_t start = xe_svm_stats_ktime_get();
> > >  	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
> > >  	u8 tile_mask = 0;
> > >  	u8 id;
> > > @@ -261,6 +290,13 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> > >  	r = first;
> > >  	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> > >  		xe_svm_range_notifier_event_end(vm, r, mmu_range);
> > > +	for_each_tile(tile, xe, id) {
> > > +		if (tile_mask & BIT(id)) {
> > > +			xe_svm_tlb_inval_us_stats_incr(tile->primary_gt, start);
> > > +			if (tile->media_gt)
> > > +				xe_svm_tlb_inval_us_stats_incr(tile->media_gt, start);
> > > +		}
> > > +	}
> > >  }
> > >  
> > >  static int __xe_svm_garbage_collector(struct xe_vm *vm,
> > > @@ -363,6 +399,60 @@ enum xe_svm_copy_dir {
> > >  	XE_SVM_COPY_TO_SRAM,
> > >  };
> > >  
> > > +static void xe_svm_copy_kb_stats_incr(struct xe_gt *gt,
> > > +				      const enum xe_svm_copy_dir dir,
> > > +				      int kb)
> > > +{
> > > +	if (dir == XE_SVM_COPY_TO_VRAM)
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_KB, kb);
> > > +	else
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_KB, kb);
> > > +}
> > > +
> > > +static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
> > > +				      const enum xe_svm_copy_dir dir,
> > > +				      unsigned long npages,
> > > +				      ktime_t start)
> > > +{
> > > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > > +
> > > +	if (dir == XE_SVM_COPY_TO_VRAM) {
> > > +		switch (npages) {
> > > +		case 1:
> > > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_4K_COPY_US,
> > > +					 us_delta);
> > > +			break;
> > > +		case 16:
> > > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_64K_COPY_US,
> > > +					 us_delta);
> > > +			break;
> > > +		case 512:
> > > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_2M_COPY_US,
> > > +					 us_delta);
> > > +			break;
> > > +		}
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
> > > +				 us_delta);
> > > +	} else {
> > > +		switch (npages) {
> > > +		case 1:
> > > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_4K_COPY_US,
> > > +					 us_delta);
> > > +			break;
> > > +		case 16:
> > > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_64K_COPY_US,
> > > +					 us_delta);
> > > +			break;
> > > +		case 512:
> > > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_2M_COPY_US,
> > > +					 us_delta);
> > > +			break;
> > > +		}
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_US,
> > > +				 us_delta);
> > > +	}
> > > +}
> > > +
> > >  static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> > >  		       unsigned long npages, const enum xe_svm_copy_dir dir)
> > >  {
> > > @@ -374,6 +464,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> > >  	u64 vram_addr = XE_VRAM_ADDR_INVALID;
> > >  	int err = 0, pos = 0;
> > >  	bool sram = dir == XE_SVM_COPY_TO_SRAM;
> > > +	ktime_t start = xe_svm_stats_ktime_get();
> > >  
> > >  	/*
> > >  	 * This flow is complex: it locates physically contiguous device pages,
> > > @@ -431,6 +522,9 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> > >  			int incr = (match && last) ? 1 : 0;
> > >  
> > >  			if (vram_addr != XE_VRAM_ADDR_INVALID) {
> > > +				xe_svm_copy_kb_stats_incr(tile->primary_gt,
> > > +							  dir, (i - pos + incr) *
> > > +							  (PAGE_SIZE / SZ_1K));
> > >  				if (sram) {
> > >  					vm_dbg(&tile->xe->drm,
> > >  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
> > > @@ -467,6 +561,8 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> > >  
> > >  			/* Extra mismatched device page, copy it */
> > >  			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
> > > +				xe_svm_copy_kb_stats_incr(tile->primary_gt,
> > > +							  dir, (PAGE_SIZE / SZ_1K));
> > >  				if (sram) {
> > >  					vm_dbg(&tile->xe->drm,
> > >  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
> > > @@ -500,6 +596,13 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> > >  		dma_fence_put(fence);
> > >  	}
> > >  
> > > +	/*
> > > +	 * XXX: We can't derive the GT here (or anywhere in this functions, but
> > > +	 * compute always uses the primary GT so accumlate stats on the likely
> > > +	 * GT of the fault.
> > > +	 */

To avoid NULL we need here:

    if (tile)

Francois

> > > +	xe_svm_copy_us_stats_incr(tile->primary_gt, dir, npages, start);
> > > +
> > >  	return err;
> > >  #undef XE_MIGRATE_CHUNK_SIZE
> > >  #undef XE_VRAM_ADDR_INVALID
> > > @@ -828,6 +931,142 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
> > >  	return true;
> > >  }
> > >  
> > > +static void xe_svm_range_fault_count_stats_incr(struct xe_gt *gt,
> > > +						struct xe_svm_range *range)
> > > +{
> > > +	switch (xe_svm_range_size(range)) {
> > > +	case SZ_4K:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT, 1);
> > > +		break;
> > > +	case SZ_64K:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT, 1);
> > > +		break;
> > > +	case SZ_2M:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT, 1);
> > > +		break;
> > > +	}
> > > +}
> > > +
> > > +static void xe_svm_range_valid_fault_count_stats_incr(struct xe_gt *gt,
> > > +						      struct xe_svm_range *range)
> > > +{
> > > +	switch (xe_svm_range_size(range)) {
> > > +	case SZ_4K:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_VALID_PAGEFAULT_COUNT, 1);
> > > +		break;
> > > +	case SZ_64K:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_VALID_PAGEFAULT_COUNT, 1);
> > > +		break;
> > > +	case SZ_2M:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_VALID_PAGEFAULT_COUNT, 1);
> > > +		break;
> > > +	}
> > > +}
> > > +
> > > +static void xe_svm_range_fault_copy_count_stats_incr(struct xe_gt *gt,
> > > +						     struct xe_svm_range *range)
> > > +{
> > > +	switch (xe_svm_range_size(range)) {
> > > +	case SZ_4K:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_COUNT, 1);
> > > +		break;
> > > +	case SZ_64K:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_COUNT, 1);
> > > +		break;
> > > +	case SZ_2M:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_COUNT, 1);
> > > +		break;
> > > +	}
> > > +}
> > > +
> > > +static void xe_svm_range_migrate_us_stats_incr(struct xe_gt *gt,
> > > +					       struct xe_svm_range *range,
> > > +					       ktime_t start)
> > > +{
> > > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > > +
> > > +	switch (xe_svm_range_size(range)) {
> > > +	case SZ_4K:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_MIGRATE_US,
> > > +				 us_delta);
> > > +		break;
> > > +	case SZ_64K:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_MIGRATE_US,
> > > +				 us_delta);
> > > +		break;
> > > +	case SZ_2M:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_MIGRATE_US,
> > > +				 us_delta);
> > > +		break;
> > > +	}
> > > +}
> > > +
> > > +static void xe_svm_range_get_pages_us_stats_incr(struct xe_gt *gt,
> > > +						 struct xe_svm_range *range,
> > > +						 ktime_t start)
> > > +{
> > > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > > +
> > > +	switch (xe_svm_range_size(range)) {
> > > +	case SZ_4K:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_GET_PAGES_US,
> > > +				 us_delta);
> > > +		break;
> > > +	case SZ_64K:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_GET_PAGES_US,
> > > +				 us_delta);
> > > +		break;
> > > +	case SZ_2M:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_GET_PAGES_US,
> > > +				 us_delta);
> > > +		break;
> > > +	}
> > > +}
> > > +
> > > +static void xe_svm_range_bind_us_stats_incr(struct xe_gt *gt,
> > > +					    struct xe_svm_range *range,
> > > +					    ktime_t start)
> > > +{
> > > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > > +
> > > +	switch (xe_svm_range_size(range)) {
> > > +	case SZ_4K:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_BIND_US,
> > > +				 us_delta);
> > > +		break;
> > > +	case SZ_64K:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_BIND_US,
> > > +				 us_delta);
> > > +		break;
> > > +	case SZ_2M:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_BIND_US,
> > > +				 us_delta);
> > > +		break;
> > > +	}
> > > +}
> > > +
> > > +static void xe_svm_range_fault_us_stats_incr(struct xe_gt *gt,
> > > +					     struct xe_svm_range *range,
> > > +					     ktime_t start)
> > > +{
> > > +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> > > +
> > > +	switch (xe_svm_range_size(range)) {
> > > +	case SZ_4K:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US,
> > > +				 us_delta);
> > > +		break;
> > > +	case SZ_64K:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US,
> > > +				 us_delta);
> > > +		break;
> > > +	case SZ_2M:
> > > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US,
> > > +				 us_delta);
> > > +		break;
> > > +	}
> > > +}
> > > +
> > >  /**
> > >   * xe_svm_handle_pagefault() - SVM handle page fault
> > >   * @vm: The VM.
> > > @@ -863,6 +1102,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > >  	struct xe_tile *tile = gt_to_tile(gt);
> > >  	int migrate_try_count = ctx.devmem_only ? 3 : 1;
> > >  	ktime_t end = 0;
> > > +	ktime_t start = xe_svm_stats_ktime_get(), bind_start, get_pages_start;
> > >  	int err;
> > >  
> > >  	lockdep_assert_held_write(&vm->lock);
> > > @@ -881,17 +1121,29 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > >  	if (IS_ERR(range))
> > >  		return PTR_ERR(range);
> > >  
> > > -	if (ctx.devmem_only && !range->base.flags.migrate_devmem)
> > > -		return -EACCES;
> > > +	xe_svm_range_fault_count_stats_incr(gt, range);
> > >  
> > > -	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
> > > -		return 0;
> > > +	if (ctx.devmem_only && !range->base.flags.migrate_devmem) {
> > > +		err = -EACCES;
> > > +		goto out;
> > > +	}
> > > +
> > > +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only)) {
> > > +		xe_svm_range_valid_fault_count_stats_incr(gt, range);
> > > +		range_debug(range, "PAGE FAULT - VALID");
> > > +		goto out;;
> > > +	}
> > >  
> > >  	range_debug(range, "PAGE FAULT");
> > >  
> > >  	if (--migrate_try_count >= 0 &&
> > >  	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
> > > +		ktime_t migrate_start = xe_svm_stats_ktime_get();
> > > +
> > > +		xe_svm_range_fault_copy_count_stats_incr(gt, range);
> > > +
> > >  		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > > +		xe_svm_range_migrate_us_stats_incr(gt, range, migrate_start);
> > >  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
> > >  		if (err) {
> > >  			if (migrate_try_count || !ctx.devmem_only) {
> > > @@ -908,6 +1160,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > >  		}
> > >  	}
> > >  
> > > +	get_pages_start = xe_svm_stats_ktime_get();
> > > +
> > >  	range_debug(range, "GET PAGES");
> > >  	err = xe_svm_range_get_pages(vm, range, &ctx);
> > >  	/* Corner where CPU mappings have changed */
> > > @@ -927,11 +1181,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > >  	}
> > >  	if (err) {
> > >  		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
> > > -		goto err_out;
> > > +		goto out;
> > >  	}
> > >  
> > > +	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
> > >  	range_debug(range, "PAGE FAULT - BIND");
> > >  
> > > +	bind_start = xe_svm_stats_ktime_get();
> > >  retry_bind:
> > >  	drm_exec_init(&exec, 0, 0);
> > >  	drm_exec_until_all_locked(&exec) {
> > > @@ -939,7 +1195,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > >  		drm_exec_retry_on_contention(&exec);
> > >  		if (err) {
> > >  			drm_exec_fini(&exec);
> > > -			goto err_out;
> > > +			goto out;
> > >  		}
> > >  
> > >  		fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> > > @@ -953,15 +1209,17 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > >  			}
> > >  			if (xe_vm_validate_should_retry(&exec, err, &end))
> > >  				goto retry_bind;
> > > -			goto err_out;
> > > +			goto out;
> > >  		}
> > >  	}
> > >  	drm_exec_fini(&exec);
> > >  
> > >  	dma_fence_wait(fence, false);
> > >  	dma_fence_put(fence);
> > > +	xe_svm_range_bind_us_stats_incr(gt, range, bind_start);
> > >  
> > > -err_out:
> > > +out:
> > > +	xe_svm_range_fault_us_stats_incr(gt, range, start);
> > >  
> > >  	return err;
> > >  }
> > > -- 
> > > 2.34.1
> > > 
