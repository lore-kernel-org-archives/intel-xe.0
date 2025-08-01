Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26022C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 20:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD12E10E065;
	Fri,  1 Aug 2025 20:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZ4AGgE5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B43710E065
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 20:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754081158; x=1785617158;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mA4WxCaj7irnKgLt5GsH6l3zgiOZfzSgQVR1ztnrtAc=;
 b=MZ4AGgE5ruyOfZAvYSyLblEkVNE9pvVpRH/AMUixkl36DaUqQAzA7UME
 JcgPC2B3TmNjYjpk7+/9RIRgNXi9ivpiNlVfAx3t+QCmaOrdSzvv5MZiN
 qthsp3OPDopKevWF1wop01ytVb10fMTvEYcU+4wOtZi0Q/kgPe/N+4j82
 PuvJONFR2fNfBNPJK+N92WvFbIp0yhujmH4UnCZ9y4eFs6M90QjgaMB8t
 Imcz2q5vUEEINbGHkBA+ZZlTfYxKUZym6PtdsIgbEaohSZw/yVB+8P852
 tbySO345VWQH2MkeGZecJMvUIlOFUtqohzcEA3a4JjdR0E93xtC08u9Uo Q==;
X-CSE-ConnectionGUID: UNkHoK6iSP+fdliCG0z5yQ==
X-CSE-MsgGUID: JfHzP4GmTm2E9UpY9thliA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60254729"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="60254729"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:45:58 -0700
X-CSE-ConnectionGUID: 3dZl32+4RFiGkiKZjk/DEw==
X-CSE-MsgGUID: 0vm5whm2QDO99vuiA72AvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163669120"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:45:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 13:45:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 13:45:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.75)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 1 Aug 2025 13:45:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsi+h5EhAk/MGMHSNp4T/VnloGhGql2HLnNaVMrvZmMg9bT1SoMMlQ+2cpWTh3uaWrFL8yFU1O7i3RbdJ3hUbFTPdpKMjaWOAiDnQbhfedP00diMKClHI2jnA/r+Dxn2AXu0xu1n33Pm7ETE2r3Br5neJEZHdhQ5pi1cCxzET7cg5fbcLSUfXZRCRXETKhTURofBqQafqci1dOtRi9Lfdtu1C+Dx2NeQpeif7AeI/k9a0Rvvnx+tiKmrEG4U7Jn16EZBJeIvwyf/vmp/RfDh339jX/jaik97xpYYt+mLsihirDZHrv9JCt1KgjCdQRkB8uNJhIUecMc9fZLPNexFpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/ENDkqZttIjdnOVZhGWLnyeRJf7EqCCciP/A12crkQ=;
 b=rg06hadRyMhsZ/WTBSr+R83BOyTUZfnaw4IjCUQVfWurCRuGtE5q3Csc2QnCww+GBqxsir7nKLUgd+tVt/Q6+9koefqgGwlEF7uaxdH+a75GisnWPJMh92RIViw6Cqp4rirKoQbV6wokoJxFSqYFSMO8ZnXy3DLxiK1/iGP1M+mu9HLEbX9pdlanvVUYAwUSvTFm9+pN6NkT8gjXEJIY245ruZHTuz8auj+QeJTLPU7rJTe2YXBwLtc14RA/gUIGTkz3CJfwVctrOQ9/4zIAy5SmZGAJNc6lzL2i2jcNeU3U3V2yWh/RwIuxLyJHuNWLdrYtPOoOZKGh2q8MJBYECg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7314.namprd11.prod.outlook.com (2603:10b6:930:9d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Fri, 1 Aug
 2025 20:45:56 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 20:45:56 +0000
Date: Fri, 1 Aug 2025 16:45:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/pf: Don't resume device from restart worker
Message-ID: <aI0ngX8onl4C8_3x@intel.com>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
 <20250730174913.178434-4-michal.wajdeczko@intel.com>
 <CH0PR11MB54447BED0BF0F6D4F435D43FE524A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <e2df3e6b-c377-4c91-b107-518ae7e0c3b6@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e2df3e6b-c377-4c91-b107-518ae7e0c3b6@intel.com>
X-ClientProxiedBy: CY5PR22CA0020.namprd22.prod.outlook.com
 (2603:10b6:930:16::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: 649b9543-7d7a-471f-4971-08ddd13c69e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hFkNcp7WmvB5u7OhL1CEigwmNi+PA6gEuqwezkZ0Zxz8VYsHaX1cG28593xi?=
 =?us-ascii?Q?Pdm6fUWgSnnboJ+AgJLYiuEbyqmp+uzloYG4oUrpN9PtHCUgvJAAxUFlE+Wo?=
 =?us-ascii?Q?3SOssjXAwxEyPTetPUkQNtqER+/Vc1DUoUucnBzE2vRFFOWGX/pHGRFFRbze?=
 =?us-ascii?Q?X5QrVEYTEyFHqG+vmBV/hujOhKcNMchuMH3Qwa3+zkvcBM+lvsz2n6wCh8y1?=
 =?us-ascii?Q?PKtnBmp3HS22bdthCwHaSw3ndfVjPgMSV3Igkk/qu5bhWpbfNEupwUYzCJFm?=
 =?us-ascii?Q?5m7nRD3PfTTRzCrB58lOIQCmV/USy4S0uxXsc64V1UGtpRb//xhtbAPZojk6?=
 =?us-ascii?Q?2qXhB16NQM6oLaqFEXfOD9hqg2FAgb04qHMZn0HqCW9myDhJLZfGwlp5hAod?=
 =?us-ascii?Q?KtyH5i5BZw01qNiSoemAP6kL+nbW8XBZ9daJCKUSyUCnVEirxJwkQqMfqYhQ?=
 =?us-ascii?Q?DXdU5jV729d5onl0SQ8e7xFOTgx9VmWkbmO8HCpJHXyth7NERSPEb6+LDRN1?=
 =?us-ascii?Q?dFmWkUAORTsd+nto3zjh4RpCvYdPJQFBhrh0uAKpmoqqYJbTKpX39EmQsLf/?=
 =?us-ascii?Q?QlC8zgfdpPgIdsu90VX2AdnEoTcCalwdF304b0SY5rzmRiRdRhrZbSkr/uEq?=
 =?us-ascii?Q?rt/g94TkTFV91JWijT+rcbSTisJYTgpRnO9RtxFhbS1GAGsPWMxg7TRTzR+e?=
 =?us-ascii?Q?hVpAUMNHSzmWQ4E51MiPqASaSHtmltVgV2U1z5CC6B7YlsIrODsaH7pDZ6PQ?=
 =?us-ascii?Q?i0+OoKonVC0QLyHCTDcxzQd6tEiY52cPmv9BGL8MjeVhlFnnqDmwl3zWYHFM?=
 =?us-ascii?Q?i9UqK75394UCBDRkwaESSqHHVJKXpTNM76F6VpPZlMwo0Sup333z2bN7P3dy?=
 =?us-ascii?Q?nIFbPsm0TaJaR668rFI19IX8Y7NmN7PVD8VG8d46OIEFRiKdRiIb+sVW75Ag?=
 =?us-ascii?Q?efEvi5EbwRPt0iUC/aF/HuFnnn+xMeXopkoLTVHkHdfI+8K9+19G/BdD/oXk?=
 =?us-ascii?Q?4mKxJEL4BHNhS5se0TxUp4KGthd4xyt1O2JzkYIEa17ELQiQurTfKqTAqpEj?=
 =?us-ascii?Q?v3ygFafRvu2xyK9RpqWswDPN1v16am6bfxdoJ7dlYvikMOOvHzwq56W3HTI8?=
 =?us-ascii?Q?Y0VNgvLCb0Ic/YpzgYvbqHXVElvknUdGEjml0SWlomGBkmrSK39JkPhIm2ts?=
 =?us-ascii?Q?CRVGEquS/yyUD4rrpHFfqPSe/5nRnzCxFBEVpLEj30Bu2k+jg4sThUoWVZt8?=
 =?us-ascii?Q?BetygTK+5sdWbnOMjcCkKwUpB1kti0EP9GovIPrMGM3QtrShmM8k0ZeNdz1e?=
 =?us-ascii?Q?NVqK94vYTbnHEf5M+m1aVeAo9yFiV7FfEfFbTQbsVD16OcOns1TKYjJgT6iU?=
 =?us-ascii?Q?ubjdXRNdAwxYqvbLWVbC+rhvh4dth5ZpKx/oCar2JZg/POmmjyU/aA3d1Lrd?=
 =?us-ascii?Q?ht8Y2v2VrAs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zuedJG+KnDpL4jLjlzzYYMIUWCxRv6wn4iGsNyO0YvURT9r8jwJs5p5YoNY/?=
 =?us-ascii?Q?ayVVmy2mR+WYpj55/Wj43wPP8woApliVVPZQ49b572i+24Z6OKZ0wl62kP7M?=
 =?us-ascii?Q?z/E+IFSteOVNzj+pi7sr1G7EUeh8BKYi5NHlLs3JPv7jfekQSKujmFBKXP7Y?=
 =?us-ascii?Q?7qLex6WNbEfIoxjeYp4nxsUkPTyLyA6tfMgjhOezKpMG0B6P8EmZYaHigOv0?=
 =?us-ascii?Q?sqFr/8RfZXCbw1/Z590LU/E2lr+32yXcYAvXjTFvvTcZPE7QJJBsGmZIxaca?=
 =?us-ascii?Q?HA/yZmC2oSqSHZFX9cRtZmKb94FoVY7bJ7vSuH4kLuDe0fgZWEzxH8XDnmOA?=
 =?us-ascii?Q?ISm70lL8bv2/C8XLaUnMPNlx3qIjYkHTkF4GeMUc5NEJYJgruTRifJAHiNY9?=
 =?us-ascii?Q?ZD/l9Y6WrZXOWjSC/HPqBhsT3XpjJcgQdjbWfxYoDFFmhyWZOjTFKTT5Ye9R?=
 =?us-ascii?Q?OxGPZZ+mq2mRATE+BSTDg6ja8NmmLEbvjIZCPdIJNS7rpSasYSj2zcJ8PFqA?=
 =?us-ascii?Q?neOzTbg7FMbzH4k74EkTjdGqqjWBfZsvjruveket4ZqoqJ0U7v4kMXhNf5+F?=
 =?us-ascii?Q?0riZjbfrKQO9qr3O0D9omhUncQLa7dLUkKNEVbR1hgTNhb2BHkvoUUBnRarE?=
 =?us-ascii?Q?V4Q9WUUTNlNg4GNBayuvnI/y+xaGES0+7WJ2XGbo4aP30RlHTjDpw3hr7sd4?=
 =?us-ascii?Q?BAPGO1xOQafmxxXag9w7qWeOoNDroi8SEkEl40LIDZpFurvmr5TI5m8q1USl?=
 =?us-ascii?Q?7C5UeKuJ6UBYhuGUnu+A6adxSlp0WXwvJV/PeVleG0s2TP3tpF0zaIhY1kf0?=
 =?us-ascii?Q?gIyPLh8ok7PCVcNNaJCZ/psxzkFNVH2mpPOBvLX6NiCPuXyirHZDS+PJ7020?=
 =?us-ascii?Q?xodjqHHsSMJv5+9y+t0t0h4fNsPAgQdaqpdcMI+ZEfeWhxBwroyYDCnm1jT0?=
 =?us-ascii?Q?fKmEW+AT+Wt/iFXO1X1/gc6XEFq1bkGUgP9SpsIBvnlJaR7JMlz7ZIleVVnx?=
 =?us-ascii?Q?jOYDFhtKeaGbjQR1kOk2NxI6peTk+fVNkB+w78ncLrX71vlEmwCM05iPIsp2?=
 =?us-ascii?Q?IQGdtyKiPBOKJMhRHo4c9S7d9WcC9FLXj3Gtp+PpIzMExMoW3vDe6P4+fEkH?=
 =?us-ascii?Q?MpgjJVkmt4hFebQRUAObPbHlYSS4uAI7WB7WmN9O4hYm+MuhQ9lHkXl5MNZS?=
 =?us-ascii?Q?z1dwOHlGLqWtxSxp0HqX17ftBbEQWWSoC8JopUHLs7Y2nzTW+mqktYDnFrQZ?=
 =?us-ascii?Q?H4Z9SpN+npC/ejxoZvaWmZQIp+JL8CwIjoB7EFmCsbJRr9hZSuCLbwtLZlTk?=
 =?us-ascii?Q?smEGchfJhsntXh820xiegCoQzJ7VTzsG8fP+JOiWD1UdstFfE2Fo61nMsvqU?=
 =?us-ascii?Q?kAjnMyiusFqzSC2OpXvc4lIrWjk8PFBopgTV+Jwg9dE/aEYciCmpJeUq3D2B?=
 =?us-ascii?Q?z0cCQC3iT6r29UT0Sf/PIaw/MgizB4VDjQNDTa6xJpIawiL4adRYBOCZh52k?=
 =?us-ascii?Q?86wGHADrFLxrUbhoq+NdWjFGbm6/m1oHPmFdQ3ORr1Cbf+iN3oig1v1aRihm?=
 =?us-ascii?Q?+2u+Dp8IEKzCbei1ttSD418VJ+m/yjrtZmzNyZg/YHACfWI1l3pqOzHeZQ5l?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 649b9543-7d7a-471f-4971-08ddd13c69e6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 20:45:56.3544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2EJqQVfGKffDbpBSKnDMvu5fnnwejgc2CZE0Zcp58nFKYOeYJjkL0n5CrHzNKaTQbPlpAZFpNric0fJUKI0nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7314
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

On Wed, Jul 30, 2025 at 11:48:01PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 7/30/2025 11:10 PM, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> > Sent: Wednesday, July 30, 2025 10:49 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> > Subject: [PATCH 3/3] drm/xe/pf: Don't resume device from restart worker
> >>
> >> The PF's restart worker shouldn't attempt to resume the device on
> >> its own, since its goal is to finish PF and VFs reprovisioning on
> >> the recently reset GuC. Take extra RPM reference while scheduling
> >> a work and release it from the worker or when we cancel a work.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 23 +++++++++++++++++++----
> >>  1 file changed, 19 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> >> index 8bc7d7f9f47a..0c9012fb625d 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> >> @@ -53,7 +53,11 @@ static void pf_init_workers(struct xe_gt *gt)
> >>  
> >>  static void pf_fini_workers(struct xe_gt *gt)
> >>  {
> >> -	disable_work_sync(&gt->sriov.pf.workers.restart);
> >> +	if (disable_work_sync(&gt->sriov.pf.workers.restart)) {
> >> +		xe_gt_sriov_dbg_verbose(gt, "pending restart disabled!\n");
> >> +		/* release a rpm reference taken on the worker behalf */
> >> +		xe_pm_runtime_put(gt_to_xe(gt));
> >> +	}
> >>  }
> >>  
> >>  /**
> >> @@ -205,8 +209,11 @@ static void pf_cancel_restart(struct xe_gt *gt)
> >>  {
> >>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> >>  
> >> -	if (cancel_work_sync(&gt->sriov.pf.workers.restart))
> >> +	if (cancel_work_sync(&gt->sriov.pf.workers.restart)) {
> >>  		xe_gt_sriov_dbg_verbose(gt, "pending restart canceled!\n");
> >> +		/* release a rpm reference taken on the worker behalf */
> >> +		xe_pm_runtime_put(gt_to_xe(gt));
> >> +	}
> >>  }
> >>  
> >>  /**
> >> @@ -224,9 +231,12 @@ static void pf_restart(struct xe_gt *gt)
> >>  {
> >>  	struct xe_device *xe = gt_to_xe(gt);
> >>  
> >> -	xe_pm_runtime_get(xe);
> >> +	xe_gt_assert(gt, !xe_pm_runtime_suspended(xe));
> >> +
> >>  	xe_gt_sriov_pf_config_restart(gt);
> >>  	xe_gt_sriov_pf_control_restart(gt);
> >> +
> >> +	/* release a rpm reference taken on our behalf */
> > 
> > NIT:
> > For consistency with the other two comments, maybe:
> > s/our/the worker
> > Or is the pm reference taken in this instance different from the pm reference
> > taken in pf_cancel_restart and pf_fini_workers?
> 
> this is the worker context, hence 'our'

I honestly prefer the non personal statements. But not an issue

> 
> > 
> > There're also some other minor grammar things ("s/a rpm/an rpm" and 
> > "s/worker behalf/worker's behalf", for example) that can be applied more
> > generally to the whole patch.
> > 
> > I'm not going to block on minor grammatical fixups, though, so:

My english is broken so I usually miss things like this. I even just learned
that the 'an rpm' is the right one...

But anyway, if you notice grammatical issues, please refrain on giving
your reviewed-by. Otherwise we will need to keep accepting small patches
later with small grammar fixes :/

Please ask the author a new revision and only put your rv-b when you are
comfortable that we are not leaving things behind.

> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > -Jonathan Cavitt
> > 
> >>  	xe_pm_runtime_put(xe);
> >>  
> >>  	xe_gt_sriov_dbg(gt, "restart completed\n");
> >> @@ -245,8 +255,13 @@ static void pf_queue_restart(struct xe_gt *gt)
> >>  
> >>  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> >>  
> >> -	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart))
> >> +	/* take a rpm reference on behalf of the worker */
> >> +	xe_pm_runtime_get_noresume(xe);
> >> +
> >> +	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart)) {
> >>  		xe_gt_sriov_dbg(gt, "restart already in queue!\n");
> >> +		xe_pm_runtime_put(xe);

As for the patch itself from the power management perspective, the approach
looks good to me. It is the right thing to do if we don't want to let the
device to suspend and possibly losing power between the scheduling and
the work is done. However the hard part is to ensure that all the work
cancellation is taken care properly, what I believe you did right.

But it is important that the reviewers checked for other possible missed
spots here. I hope this is the case.

Thanks,
Rodrigo.

> >> +	}
> >>  }
> >>  
> >>  /**
> >> -- 
> >> 2.47.1
> >>
> >>
> 
