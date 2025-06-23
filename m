Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4199BC7115D
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 05:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2AC10E166;
	Mon, 23 Jun 2025 05:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sc71GiB3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624C010E161
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 05:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750657051; x=1782193051;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WSEq5d6zIV9o+5kHFiwP4DxjG5XzGlSC1uZsnQ+wy+U=;
 b=Sc71GiB34+AZrcIbARG4MhHgXKtbOL1QWu19I+PabYHT/Vnezu7oUfym
 ybDTNmFjTSoGRRlghBtOHYfBkD7cx2tP4bgz0FcOY2/0tnZAIwGtzZchN
 tdXCA4nMGrzfOx3aDI0qo9T333/DofeV5jXOPJAqDgp/Fnazr8PGvnsrx
 QDVhFHBmhK4Ckbl+5QrLmkUlyy0GjHlTaYZ/IJCUHKaiK6+LqN3p6oQY2
 UxCWZaQISwjSwPHewwB79HmTiVlAUpKft/9JM42JhAgBAEitqoxbZRzw1
 QZZGYoL46ahwm20HOiMb0LhQA1Se0FKaA4uI98kHuWL/pvg0YnwWxO1qH Q==;
X-CSE-ConnectionGUID: Sims05tsQTqsrs6xL30PGw==
X-CSE-MsgGUID: P8N3JI6BRK6kM6r0Ax4tUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52937544"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52937544"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 22:37:31 -0700
X-CSE-ConnectionGUID: /3UISkLQQY6vE2wqGXNa5Q==
X-CSE-MsgGUID: 52Q/nykERjO1pO9oT250Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="151080293"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 22:37:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 22:37:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 22:37:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 22:37:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVk9wI3mTXBQxKmy88X56OznXKDo+Yw6wxWBjjwi6HJIVC52A9yBNqu354HmRDNLpZWHmd0u90xFRpEiUOWaPyRzkBWUVEhrH7+dloOifSFy1Z+fUHqLEPk2PEXdzCwkUh0vRB/3p0G0qTWVN3iQ1HCL3mbrpeonFKUoIYe/V/hQqrvcxzStOOOz1WLt/+wEGZ8Gq/YGXlFBRSQjCKcbJHRMkLyGhBCdsTAb7UQsVk0Ow3/6kOO1E+bux+SsghaonL1W2BQfr4Dl88368Fc/hHj3ur7TJC9DHcxWVSPCS0J8kEIVkYbjsr5GOMfLD/CsnPuIh4MLYIqNYsXn+BMkcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVJFAaE4u+poLD+n6fQ1FfpESzfWuqFcAZcW2bBWAiE=;
 b=FYAtMv4Hr1H19tI8b2VfgMjcHw/8a9N8xbOQvdBYkFlnPIllRZi6gSM/yJIiOVghvWQNcNveE3a5alRzOsuf1KpWRq5P5I4Vh/BR7Z9xpJly3/qk2zy8sP36GR0xPHzfgufcRLdirDrx3ehp/bj2ke0I5SIKGfXRua5Ze5PJLI4YYfkvfrUx1D9UWAWaFz76hzwRBYs9Bl4UrARigsfoZ6sa+Y198ooU2kcvT5wyNuyOXG026sdBQBwAcdczI5swNhEqQWcmSmkWNHt/wrIMYwOAd71c9Bf0heveViq2V9nmblz15GbiR2SS4JP5CRfOyg6/CfVqQ7F1CUDCQW8SUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 23 Jun
 2025 05:37:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 05:37:00 +0000
Date: Sun, 22 Jun 2025 22:38:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 10/20] drm/xe/vm: Add an identifier for madvise in
 xe_vma_ops
Message-ID: <aFjoXh8eORIrcYcb@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-11-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613125558.2607665-11-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:303:b9::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c93c7b1-c6ac-41f4-a694-08ddb217f99b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4/dwbqDbRD2/PVKIqYFloQ4lI9bbiZ1K7A2G67ZB7Rae2Xqqn/YKJDhOAxRy?=
 =?us-ascii?Q?XoIJmCTemtxB1PqZkhggPgeIMBThKfReF+0X8srslLK0qSAJuYkUCHC59Upp?=
 =?us-ascii?Q?iAb+cWl1da2oEAKwBEV3WnD9dqzJW6bnA8jFW+OXGnvTYeN9XInZNEXcrV4s?=
 =?us-ascii?Q?0u71M/kcgItxgU8cfwg1GXFYE5O1ytmbpJrg+G2Q8Q1oaId5W+IZy4DjC5qK?=
 =?us-ascii?Q?vOTomqL5vbxzRfIcwovcyT6LRC7ER1ISuQlOCFHZmsB2CfcobMiRl7NDNJjX?=
 =?us-ascii?Q?yatWyA9y+GbPgq+NY3bR9KNkV8rl23XAReeR5rPmdLJp1jng/VQXnX/BqXV7?=
 =?us-ascii?Q?SpFXyD893SjIatcP3KV+a2m0AUapuUTT5tq88Bd8q44PnEjEJqn+PxV27g26?=
 =?us-ascii?Q?KAVyRx6AJ6P1q3Qxjnw44vkgj11ptVsN9DkfM4BgJbVPMUla6SzN5P1qpxCC?=
 =?us-ascii?Q?ZJmPIGTuoBaEX7atxIdAaQl0rbN4R2oW60WiRQjMxFerj1n9pZCLizdc/6kj?=
 =?us-ascii?Q?KeGCATYPee/O4CgLIS4WFIQGaDHgEnxwcb0sp2tKjw4P8dQS29SKarJVj40X?=
 =?us-ascii?Q?9Q+rZKTXwPtUKFHrDVMO7t6mVLHNeJgKmtBepivrRqq+A1sLVeS1Xj0oS7nf?=
 =?us-ascii?Q?4gvzlVcE9zL3ntZ1gtyXs0ugrmDBKxCQMjgkfQE9RtyvNuS7M0WrkJQ46tSr?=
 =?us-ascii?Q?cm7WdgVR8oWHseWOvxWOsZjLMwyZYsGKwcO8GG8LkODCJSVrjZfT+UfSKSeB?=
 =?us-ascii?Q?iWnHzWGAc2bnrL3vbn8ixGGMPgKWzye2WYLObnhx6wgHWRwnCoWDVoLvyqYw?=
 =?us-ascii?Q?f2MSTsrursnKB2HUtxpcUuPDCDW77Mk322SXXBIpRDmgL34q/mQxn+lWjLvH?=
 =?us-ascii?Q?S50eu4w9uMfBZZ3xalayIdaNwZQLwyIPnIJqCu/PGDwuPWcoqLWcXu4YjtHb?=
 =?us-ascii?Q?rAEH326hMMIguubIWDvg6KYNlIDO/DXddgcWGy27eoZ2sQMV1o/vC48YPNEq?=
 =?us-ascii?Q?Q8CT9TMlAfhBvTTtge5aiGQv4oddTYjRI/KvWNYKIap/6loiocBCcu/gpjPR?=
 =?us-ascii?Q?LrQY3s2GSTuhFQA5xOCcayX/thjkGdhWqIqPbbhT9fMpvxJZOW71pLwMpVza?=
 =?us-ascii?Q?TdIrwhKE47/8RjXZt4HAEBxEC+0RZqslrsuTkRBoBTiGc0MK7+ksoZcN6Vko?=
 =?us-ascii?Q?xzNqx68vV1jMHQg9BEXBNJ+BAONmpePGUuTo2/yaS7E0j4cvqLzeF6mqCb1v?=
 =?us-ascii?Q?BjbsFxvmfdThpaP3TLEbolgyGAarOAQ/WcZEtPhT+dESPvktHS+dfCZ2JAdH?=
 =?us-ascii?Q?7s6ORvf7vUGaMf/zcA7vJBKQn8w93WlI5kvvb1+Tzd/FuSID4H1wdpNXt6zE?=
 =?us-ascii?Q?0YF3OxI8ljU0QEBuJ/whGcU2rW9lyo3WQy6eLYP4EjAuzyvu4zuIEIUcXPD5?=
 =?us-ascii?Q?jKsT+2jxRQk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rFWNx6mrofuDczSSPCmtFgmeCgOO3jDAwKuLXTa6MQe1IHUR/tWkIZ9UdeyR?=
 =?us-ascii?Q?NfeH3AXUUs82kOoCqDic+haXP2i/Vfi9J6WPxg/WusY50oBojU7pKZ1Ez0QV?=
 =?us-ascii?Q?4nr29KfAxiEaV+aB3+RP2PqtqSvGF6neQnbCddlPMCVj17cDvX0drmVZYRxa?=
 =?us-ascii?Q?SCyia7t4hLPtito2sdtRBO8P+Q5mGfFX2Pnx6FNYRB3alMb9HjoWl/6rrIJh?=
 =?us-ascii?Q?33bIg20AssAF0yu/9GeS0yXY1u41moNd4t5kxomluZ7JUEANa5iyTrQBW6N8?=
 =?us-ascii?Q?oXZ5n6dtg09HaFi9dBEGzDLVnmgNRBJei4wwhqnqcqDKGtcDrS+DW9UH+rLP?=
 =?us-ascii?Q?HrFTciBpY2u/M/70MtoC/pqeSs1ob7rMS1p1Vl0bZfZzIr7L1qe4Fwngogl7?=
 =?us-ascii?Q?l9xXIS3Y9549u957u+c99i6Y1yzZMlcES1oOHRqR7QVo/H1Jgu1HzAChf2xa?=
 =?us-ascii?Q?IROe3CuIS4EfFeBGOFYGnjvMCMdSFQXKTq8eI/uHubq4k7lSW/4BqZfa9Tj3?=
 =?us-ascii?Q?jI6iCEiLmwmWrXP7ou66kYIcjb1jRmoSFbf4rEDsQyO8QM38m4enXBbKEa1P?=
 =?us-ascii?Q?jrBosmIArf4SUwRHPn2kpO9voIPavo5oqYzB3KAH0fQESo23mTCRGiQOua2Q?=
 =?us-ascii?Q?kdT5MTLOXMJzNl6GpLjPpHkMBnP+S/mz0OkyzKgib7dNbzh2CAMCMRZXhAWZ?=
 =?us-ascii?Q?F4MM+hy9qFM674wZxwBTGtHLF0F9nEMNHhT5cuGXSGgEWTXynHR5MTI5wZXR?=
 =?us-ascii?Q?WG5nTX2c8LhKW0NfebnORw4xT/whrxNdRvfEtthFpbOz2QlwTyC1TSvQ1MtP?=
 =?us-ascii?Q?lHHQxzpJ55jqsbsn0T5yo9EXl0ToKLZoLAfwsq2R7zdbFhCD6Oqez6R2WOuP?=
 =?us-ascii?Q?AHZKldemjDHybcVyzbRVu4kjOgLJsUHent8wKx7hku6/me6GIbbNFkcOcVp0?=
 =?us-ascii?Q?Mo56QrXNSe0rLxir/zUPOLi8vufvPkBcRo9GcJYzLMil1yZ8OEfK9JOMCnwS?=
 =?us-ascii?Q?HC4aIf23xZzPoZb4T5Qj7xg773v22OpKyRfANpqEc7ZSYrGImgP3kvpLfI44?=
 =?us-ascii?Q?bXL0hW5kni6hGMOfazPE3Jk7ZxE0VI9T/yp+HKVmHveI/QG8E5pIQpF2ib8v?=
 =?us-ascii?Q?OsPuJACg1jk33vKQlQ4Dj3gDkgmvPZMPA5d7NC2eDNs8NMMIEUczmtzko46J?=
 =?us-ascii?Q?ynttaK02yK3zAUQS/FX28k/DMs+hWL9XkkzbIGVgKp5bgxTpivewMRtxnvpA?=
 =?us-ascii?Q?5/Eu2XfdZvL2wUfTLJ74ZJ/r/DUjF2LMa6uZRHFESS90ewxlnx/fLdD2mQmp?=
 =?us-ascii?Q?FUrGD9J/00ASE6pPGwnqaaBoDCsw5gc9F1pOVgT0XwCkNCndijq2QL73zrov?=
 =?us-ascii?Q?9NhDyQ4htFslziM/3iEG0hLQs52XZ82oVUDTk+66guqPJYowVp/k8mN+dSgT?=
 =?us-ascii?Q?k6ooJ4M6dKiMI8KWwfZFAHuxkbpc6SpDM7zLPaRkr2QXazjLMhWnMWIe7aq1?=
 =?us-ascii?Q?yjhchz537Pow1C09Yl097I+c8fScKxNvB0eC29/rcCyQuFtP5wSyUy3wQSfG?=
 =?us-ascii?Q?8QSO+udesSvyCCRtDEPxMxr1WB8byGdBZLBpD6KpMjDKcAhwL6wnP68dblV7?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c93c7b1-c6ac-41f4-a694-08ddb217f99b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 05:36:59.9757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HlcBugNNgpJa2ehEXb+3esOd3Jui1H7Dogjk95Z8rBTSG95SF5gRC+CMOMpkCJWr9KJwii+J9LTld94ItXtCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6109
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

On Fri, Jun 13, 2025 at 06:25:48PM +0530, Himal Prasad Ghimiray wrote:
> The flag XE_VMA_OPS_FLAG_MADVISE is introduced to  determine whether
> xe_vma_ops is initialized by madvise operation on not.
> 

I'd just squash this into patch #7.

Then move patch #11 directly after patch #7 to tell a coherent story.

Matt

> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 1 +
>  drivers/gpu/drm/xe/xe_vm_types.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f5f8de113eae..e059d9810d26 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4237,6 +4237,7 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  	}
>  
>  	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> +	vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
>  	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>  	if (err)
>  		goto unwind_ops;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index cde2583da303..c7156f8e2ed2 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -489,6 +489,7 @@ struct xe_vma_ops {
>  	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
>  	/** @flag: signify the properties within xe_vma_ops*/
>  #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
> +#define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
>  	u32 flags;
>  #ifdef TEST_VM_OPS_ERROR
>  	/** @inject_error: inject error to test error handling */
> -- 
> 2.34.1
> 
