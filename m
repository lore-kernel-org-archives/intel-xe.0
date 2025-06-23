Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7885EC7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 16:31:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2337A10E42F;
	Mon, 23 Jun 2025 16:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwSlLh7g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AED610E42F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 16:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750696279; x=1782232279;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RNbfK3IlBZOcOjUN9z80Mgg3CYApkHTK157CCIIfVsk=;
 b=jwSlLh7gTilQjz8EV5upaaQM2uhxtR1bcvmCQHmZIWLrKEzlfX863mA7
 hbkQFw/0ggAALvTrlhYL2UlXD7/rLHO27NCA6xudfk3V5dS2DoLNBtw4V
 /ExsHvboyW3gjFB8JIDSkTXj1bZTxsvdIyY075IflKAnzBTqgmaqOttd2
 r+8AsSnzNDWlucp6D0Hm2aoDr0TAa8n78d/UgT+3+Vn9yDxjHkVkG/9Z0
 hE7/ceRoHP80I2DjefUyp/bm0DGsUCrLR+uGv/i8gXpS1q2IQe4w+7d1v
 t6I83PZxLK8EU4s/TOa7SwlhRnsLm8qosaeKxagc4ZXGM7LjyNRjFwmjj g==;
X-CSE-ConnectionGUID: DwX0py9AR2aDQ4M+PQCWrA==
X-CSE-MsgGUID: cGHqPvzgSvK/bRVd8F20/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="55549304"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="55549304"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:31:18 -0700
X-CSE-ConnectionGUID: QF06x9h/SrukWK4BGVNOQA==
X-CSE-MsgGUID: GGgDCNvSSQyMymIqjr8GOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="155660544"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:31:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:31:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 09:31:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.51)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:31:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0q1PMYx/nHNVGFmKYbAIumPxIGvnoFZ7FC897EPYLG5A0TPa12odqzPDKC+7aeLHaMGI6dXXbnFRumsfcfYaEWfRneq6aH+TwY8A7pGO7u/wq63l3gY4I3EriiR5cMXHIqL5gbiM0b6cfHqrf8r0kS6r3QROEIFoXnsgiXMu8AIpstbHaY9HoS1r+TefK5h3f8jmMYW3A4CyHgLooQVv1Xn7P1kM5yV9QFgub+k29413flNygYIoWKzD+mdS1hMIHWIJyhoPpSFoCKPZrpgjrsHPyBQrar0oWg1a/hldXgxz30NFIBF1Y3jLVwbEZ06zjcQTk0uCOMjbOcSIs2GZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0tzFNp8un5vqq1FGMkVyBD8yF8Iz2qxsJ5Yzg5AFAg=;
 b=lnzcR15Q9yaQgFPDFYQHhI0zyI3XU2wr7tKT3C48K9z8OnyxSCkPqPvZaYFabOpvbgiMRVGCp8z0w//z/uyfoh1iijM2TN+Sp97xp3dctXNoEubbQCKqPZdOSXV4iGPt501UGaiBhO3PGea4Ome1kRFIGKhLocKQw1n+zpKorV6VfIfH3UbLn37dRmEZw2Y9ENNcPoide7JBFJQNmONSM1D5cu6ZjIa6vE+pcwo0d/cqODqh6VImmcazUnNVXDqaqv6meAGB/NGEtLSKqK5lWE6g1d+KgoUgBBvz29Za/hGPpDqKemRl5EG0u0PfmghtT9lKjh3JJunF0bUvw3cCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 16:31:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 16:31:13 +0000
Date: Mon, 23 Jun 2025 09:32:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 12/20] drm/xe/svm : Add svm ranges migration policy on
 atomic access
Message-ID: <aFmBtAm795ccYNMl@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-13-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613125558.2607665-13-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0244.namprd04.prod.outlook.com
 (2603:10b6:303:88::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 9438803b-1a11-4682-e77d-08ddb2735eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9u9SZukUX7EqDbIgtzqN3J0X3XtscMC5sU1QRnjWtgz1BebsiHUUf5gOnws+?=
 =?us-ascii?Q?k/snPcM1dwUtGwMqGHdZAOH8fSEqoe6eekdjE666T6qjHv+UNNKTSEPE1SC/?=
 =?us-ascii?Q?VyZBKsOT17U7/qfX6Jm8I2uu6ObNBaERYPfBwrHpv09mAbnFFnvq7YC1OaH6?=
 =?us-ascii?Q?7szxNP0dkdG/G63CM7grEforcXfWOruZMevWncxwLiiK18VuOB66mb5DZrUA?=
 =?us-ascii?Q?1fDnwMnrKtBsZleTg4XECMFlAKQGrIrTN3r0AxYCisZj5R2ynCZ31/WsdZUS?=
 =?us-ascii?Q?dZtPlDC259U1W4wHbtoTNlJw7p7wb3SZiSi+jLHOXTfeVSvpxjDZqz91zdXb?=
 =?us-ascii?Q?+5t00YhmTQKeSS4IeI/C0CAliBB9ShPYoND8umI+RjN3df/Q5gLgGOdqtACt?=
 =?us-ascii?Q?xRG0ZoyyvLW4kFpn/6oAYFzWrG5EXIRE/MoEcGAdPd3PzzWyB3KtE2N2Z93E?=
 =?us-ascii?Q?24KXAIGx67ND0atmPZx+gbjt0gL89P1rnsBBcV6RtpRy4NPUbVJhpGcYK+zS?=
 =?us-ascii?Q?K2EMhfyq9ovdrntcNg/V6HyCedi93LHk26BNreCHJe4gLd+c1OvXqYxvs4vr?=
 =?us-ascii?Q?gN5E0LrjQPufw2BzNahxjr6gVNW0nbXV+sesaLi8XZAFFgoj+m1kLkOnLBTc?=
 =?us-ascii?Q?flezP2S0uBlOw6/GlyaBgfpE4Ks27YrJiUnfNYPw0Uyg4pZM/tMZ+xqnfYe6?=
 =?us-ascii?Q?DGNXci2Box9uLTk0Ee3NL04HLeiJ3xx3yGK4WNhnKIOTZwpW+QvNcu6+TANw?=
 =?us-ascii?Q?7FWGqf7EZWcK3rvL/VVVFZ15Wvfa15U95vCy5C3PeykRGPHiCqTwZrJbcLD8?=
 =?us-ascii?Q?B76eodDztvCfAVCVIHAk64kckT2h0MsmutOpajJrko/B+Ewxl6T4aCklA6q/?=
 =?us-ascii?Q?KJKeLeLCsSJu+mdr+tOn6Ercu9odIUDWObzKLfe9qU7TQFqhcawrYO/v8g0X?=
 =?us-ascii?Q?NJZV9h56q9Ys5UV1SQApYoQuh1nqkzijOmMwb37xG55jYpKNK7wsTfiqbDJb?=
 =?us-ascii?Q?Kkg+ErsCGz8h2wHMKsQMmFQuoTuK4CD8mDJL786l9k7JSICokyXLolN2JbfZ?=
 =?us-ascii?Q?XbmvyHsZBcyC7QozCPfbqljcEIlWkUG6VAoIh/Ar1Ftjdh17jfw9fMiwbfSO?=
 =?us-ascii?Q?5+Gsi1TsfxOq0NAgNCWi8huvBG+IGkTjGzI4KssPlYJgrEbDG3bcyH5BL0Lq?=
 =?us-ascii?Q?EP0aEo6ccWHcxhQJU9mg2tpqSVZwh/VGagcSyklbmIUw15qDgHfvFaSiZmue?=
 =?us-ascii?Q?Jg+bTlD/ZheOOMM4jbAX784wsA/890F4XrPLoRDr9VL9Ys9Wa7ih/TTT65oG?=
 =?us-ascii?Q?/EXuUGO1t0rxraXvIcsfHxwdspg+dLfc1IqztlIZE5KV/+xszZS9YdKyQRft?=
 =?us-ascii?Q?BmrVZTOHq2rRFYRRJao9UMgm/7EVXm+wq9px1kbdyjJm1Uvfne3Ekro7rdoe?=
 =?us-ascii?Q?4Qos8yPSSAE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ek4qyvBRtFA7s+HQtORAF3PBPTzlWTcNtwU2FePwn/I/UyxE1bGkwci3EFqR?=
 =?us-ascii?Q?3wZCn1OmVPLA3bENKjTyN6K9gg1N+ovFFWupuQ4uBn+favRi98um7UnplAE5?=
 =?us-ascii?Q?eFZ5cDt3dfpG6CO4pDXGkVWhCGEjROX+Yg0PDrrgCLg3w1WoaIZR6M3J2hJU?=
 =?us-ascii?Q?EQShLw1mqAk558KaikyNHspMhk07AbG3juS2qta05Lj/CEgrNus/mHCh8p5e?=
 =?us-ascii?Q?8UeRgo3ANKMGoFfVFwMtZMv5exS1q9uT1MvIld8KL1v5kIi2bDkP6hcMu6og?=
 =?us-ascii?Q?0O8pKShp3n116bWBmOo8wtYwUDwYr+7bYzsbwFbmY5GTGjhibH9r82KdZ1qx?=
 =?us-ascii?Q?77IFSnnBdvc9OJxPi0XIh/xKIFzqkTgtg5dE3iUFPfyPKPdrRZ3xl1yQAigZ?=
 =?us-ascii?Q?p4SbTHh+qNZE4wCtixbxTfua0fNi1kQfBL3HhP6jMjzhMsh/MWDSQaaHg+NW?=
 =?us-ascii?Q?49+YtN4HNQXaLh90MTvYW4e/Nuy9JMwfJxTuEjjWg8UznuvsOJpl1M1a9Qfs?=
 =?us-ascii?Q?ovCsBCRlBv4Ax+D5Zk7zBRWmNLg6iAlLhiitguyO5Rvd+G/a4X440NI7wnDA?=
 =?us-ascii?Q?F5lEJcsrGHOo6lKB46Qtvl6nBGC+A21FH9j4g6MXB1CsvNHWjZLmkaRXERhd?=
 =?us-ascii?Q?jgpGvW7cofy34fm5i4zbDMvUGwUp8TGke2or4hPJ9YSIE0/rTqmgIVZUPDNI?=
 =?us-ascii?Q?yP85J9HEMVYj+JtA88CaCCsE9zM8j46706U2VqMRFdDMnbHIpXHVEHzy33gq?=
 =?us-ascii?Q?MnXZycebBa/C1ajvxT+8X/9zCoxcA1KjQKKhjX+9HQ2bD0/Aa4opMR6MKSHV?=
 =?us-ascii?Q?v8k43Yo6M+G+PwvCUiujBsKsW+457MxnwBWyTD0oHFeuIUQLROGyrChJlSvA?=
 =?us-ascii?Q?DrWMfAs3Cg7kYUnocaNTPNShitgN1yDrCIfYLD7n72dCPo8rPizJ3ZNGeu1o?=
 =?us-ascii?Q?EN+0pjc74YBxwNLMH96GTEu/VRLuSNJIxEvpYL9VT5kQE2OVu7F50jsQxXXU?=
 =?us-ascii?Q?eGNZnv4KKAswoEZAVXbsZlgbDfp+Jc8DvePuvyouTL1gnbEB+vxytn0OXrnk?=
 =?us-ascii?Q?RSiM5P91X3/6em4LVBCO3+52XSXwSlcuG8BccC+nkiABfjL04P5qA8cTCz1m?=
 =?us-ascii?Q?E5TAPlsFU12JjbR0ABQxPbxuogY+H1wMsmqNRxf+Ba7ZlrhCjwtaltkvJyAR?=
 =?us-ascii?Q?P0kvUa1nsm68vRm0MY+RuO8YnJbe3eVHtORXMSUysAiX+1Uk5e8kVPDcozbm?=
 =?us-ascii?Q?oNtz/WCzqpuLQ5VdCyqP4kYMLB2enG8HnN1yrpW19OhRY+8zwVtk1lsQY+8W?=
 =?us-ascii?Q?EL5dN2eDTSlsZC/g0H1CCZx76z6wWqpWbmmCooOl4tYbZl9FEyJyb62p96u0?=
 =?us-ascii?Q?jms2f3NiaLXek6tpjODmfYC55pj4U40/vbe/oVO054KpXb2rnfEBDb+0t9lC?=
 =?us-ascii?Q?RzDv7Hp7C2ZekBlwPV266fHvP0Q9jyac3cBJIjc60N3aW8sk0VPQKWLfJHxW?=
 =?us-ascii?Q?hzwGUGW3FuLzdH5v+OzvbJhQcQ4P2c5AAKlx3tO4wtodtKyVVfwz8nA+4pVc?=
 =?us-ascii?Q?XZnRUKJmAuXeylhlH6Rq1K8KNRO3GbfX/gPLMTFpcrwyKfusrgLGHYsexvc2?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9438803b-1a11-4682-e77d-08ddb2735eb7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 16:31:13.8009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20/viyN7xYYPNePvJ5y1ZC7oKLYZCIdNvXWzYfroMrYOMQHK/FxPv+Hhrjx1sMKhjWeUJwpUnEgRvc1JPmTU0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7551
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

On Fri, Jun 13, 2025 at 06:25:50PM +0530, Himal Prasad Ghimiray wrote:
> If the platform does not support atomic access on system memory, and the
> ranges are in system memory, but the user requires atomic accesses on
> the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
> operations as well.
> 
> v2
> - Drop unnecessary vm_dbg
> 
> v3 (Matthew Brost)
> - fix atomic policy
> - prefetch shouldn't have any impact of atomic
> - bo can be accessed from vma, avoid duplicate parameter
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c         |  9 ++++++--
>  drivers/gpu/drm/xe/xe_svm.c        |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c         | 36 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h         |  2 ++
>  drivers/gpu/drm/xe/xe_vm_madvise.c |  9 +++++++-
>  5 files changed, 54 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 9a390ef10852..9dd286853654 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -645,13 +645,18 @@ static bool xe_atomic_for_vram(struct xe_vm *vm)
>  	return true;
>  }
>  
> -static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
> +static bool xe_atomic_for_system(struct xe_vm *vm,
> +				 struct xe_vma *vma)
>  {
>  	struct xe_device *xe = vm->xe;
> +	struct xe_bo *bo = xe_vma_bo(vma);
>  
>  	if (!xe->info.has_device_atomics_on_smem)
>  		return false;
>  
> +	if (vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
> +		return true;

I think this addresses the TODO comment below so it can be deleted.

> +
>  	/*
>  	 * If a SMEM+LMEM allocation is backed by SMEM, a device
>  	 * atomics will cause a gpu page fault and which then
> @@ -745,7 +750,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  
>  	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
>  		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
> -		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
> +		xe_walk.default_system_pte = xe_atomic_for_system(vm, vma) ?
>  			XE_USM_PPGTT_PTE_AE : 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index df6992ee2e2d..003aae9a0d82 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -815,7 +815,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>  		.check_pages_threshold = IS_DGFX(vm->xe) &&
>  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> -		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> +		.devmem_only = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic) &&
>  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>  		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
>  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0872df8d0b15..6dd1f868942d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4177,6 +4177,42 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>  	kvfree(snap);
>  }
>  
> +/**
> + * xe_vma_need_vram_for_atomic - Check if VMA needs VRAM migration for atomic operations
> + * @xe: Pointer to the XE device structure
> + * @vma: Pointer to the virtual memory area (VMA) structure
> + * @is_atomic: In pagefault path and atomic operation
> + *
> + * This function determines whether the given VMA needs to be migrated to
> + * VRAM in order to do atomic GPU operation.
> + *
> + * Return: true if migration to VRAM is required, false otherwise.
> + */
> +bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
> +{
> +	if (!IS_DGFX(xe))
> +		return false;
> +
> +	/* Note: The checks implemented here are platform-specific. For instance,
> +	 * on a device supporting CXL atomics, these would ideally work universally
> +	 * without additional handling.

/*
 * NOTE:

See my comment in patch 18.

Patch LGTM aside from nits.

Matt

> +	 */
> +	switch (vma->attr.atomic_access) {
> +	case DRM_XE_VMA_ATOMIC_DEVICE:
> +		return !xe->info.has_device_atomics_on_smem;
> +
> +	case DRM_XE_VMA_ATOMIC_CPU:
> +	case DRM_XE_VMA_ATOMIC_UNDEFINED:
> +		return is_atomic;
> +
> +	case DRM_XE_VMA_ATOMIC_GLOBAL:
> +		return true;
> +
> +	default:
> +		return is_atomic;
> +	}
> +}
> +
>  /**
>   * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>   * @vm: Pointer to the xe_vm structure
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 66bb6babd319..1fb639a33ffb 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  
>  struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>  
> +bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
> +
>  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index ff560914ad7e..403337d79ea6 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -89,7 +89,14 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  			   struct xe_vma **vmas, int num_vmas,
>  			   struct drm_xe_madvise *op)
>  {
> -	/* Implementation pending */
> +	int i;
> +
> +	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_ATOMIC);
> +	xe_assert(vm->xe, op->atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
> +
> +	for (i = 0; i < num_vmas; i++)
> +		vmas[i]->attr.atomic_access = op->atomic.val;
> +	/*TODO: handle bo backed vmas */
>  }
>  
>  static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> -- 
> 2.34.1
> 
