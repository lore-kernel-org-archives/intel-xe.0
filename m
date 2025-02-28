Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C312C282C6
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 18:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A75C10E31E;
	Fri, 28 Feb 2025 18:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQOkwe/L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7441110E31E
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 18:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740768226; x=1772304226;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x1f4m9iUfK8rpmW1QTBvp6qbwKa6x/PLd7/2uMv2F98=;
 b=nQOkwe/LjSvJkK2DaGNXoS8hjF0j9Q1rixqAAzXIACl+4aYbzMZXCFBD
 3aPOTHK6yoKpegzUNkcMmgJM/wBKPlKuzsMkQk8uCDg+U5bkAZriG+Hn4
 cU1I/JBDcnNBrd0rs5QV1ubqRpY+xpRE7WU6sAmPBOIrilRvxLg/sBQjb
 Luny3UFoSLCfSardId/tMUdiE6zDVZ9nkhLu8FGmyH0r2vbkgQRJ7X5u/
 h09DUNQ1wXu8/ZPfH17UnPikWr9AedNj87rSQIDNIWmUM7dIh5PXFHzIn
 Wvuf3xMVkXik0FEjdFnyh2yO1/nb0OB1LFgJsO4n2VSmXRajOYQJ1G2BS w==;
X-CSE-ConnectionGUID: fMxVPo3RQrCMZtQFg5/CfQ==
X-CSE-MsgGUID: h3kpCt03TDGlDkV7co83Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41555447"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="41555447"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 10:43:46 -0800
X-CSE-ConnectionGUID: /OQenniiQhCyWoBTFOBAgw==
X-CSE-MsgGUID: TDxBwICbTCe0cerfGg1vbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="122370654"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2025 10:43:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Feb 2025 10:43:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 10:43:45 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 10:43:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXH/TugnPYDyUjM9FWlRSNNDHxrOlgyahw/aCwe+iTAuRh+4FOwBeLUiWRHWaEsGICvF8x0v8P89S1ES2bYMUm3Voyd+YG6tMRo3/b14uT7zy9XFi6UyIY01gfsPrLKfKfGCFq6Te6NFkivWQS7yHqM/Hcadvwm6owQWsbRSKbYxJQPdDNVnYGlA8Mq7sSDaDYWyIZYLRzxku0SZMBVO+dIPlLKgJRr40MMaU8qO7MYKo0bC9Wt6JV7gfQ6pa84DKYsz9n9xkPoJC6TZs5D/6KWkrBvBLE/TrrCxontLACn0zBru0Zgw+/14O8GjCLTlmD+NmRuM+HEoOft3oIj3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xo6zf7JkqVVy0c6RxUZwrepbb+Pjsl7c8pE73DsPuf0=;
 b=mVQeh4O4xqFPuB094ZRdkIJ612Ab6kSh+g1H3URU+5C3dw2nU4WMa4FUZntGULsi5cWtxJA921DKU/RmHdDyRCEqMgWWLywynBV2gX3JUGtOh7CuUQhKKD/cADTwnLGYl8QjLoySk2HfcWvshvJeSu4k3Lz24g/XJcIFhdpyUnQ3L6szUqSAeIHTLuOEoObaDGkysfoofbYlOwx9FBNIzKWs/e7IijweeTiyARjmffgm0GJyPCgIrnuezrZCUrnkIHVflr8PKCatKvlgPLZ3aC7Zn7diQfPTG10+c35wrIq9vuOxUXc1XvF2NvHHVimL9hc7pyKmYUsrxMtcYnRCDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6134.namprd11.prod.outlook.com (2603:10b6:208:3ca::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 18:43:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 18:43:15 +0000
Date: Fri, 28 Feb 2025 10:44:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>,
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v7 2/3] drm/xe: Clear scratch page on vm_bind
Message-ID: <Z8IEBD+4cfH/UsCO@lstrano-desk.jf.intel.com>
References: <20250228153058.1039188-1-oak.zeng@intel.com>
 <20250228153058.1039188-3-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250228153058.1039188-3-oak.zeng@intel.com>
X-ClientProxiedBy: MW4PR04CA0057.namprd04.prod.outlook.com
 (2603:10b6:303:6a::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a0f694-4b69-4dd3-ca86-08dd5827c2bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7OoltVqoVDUWsFIgMIDcRzJpeK800ew9+ZIEsYKLaVQO8QXiWdIvUq7TOU7c?=
 =?us-ascii?Q?DDLfVmZbGMH3VrR24vLWKjxIU5OZyN45rxK3yrEZveXF3nXu4qLy35YAyfEB?=
 =?us-ascii?Q?vgI3DtazFoJjAOCfXqLBCTHcoog7Ik6sW9LHzzhM0vkLrFm81Wpiy+VFopSg?=
 =?us-ascii?Q?DgrW4yRDoZSUXhXtRq93m5GCGeK1JrO3iDu8h8gh8JHK1dkM77a/7oEuDP7m?=
 =?us-ascii?Q?PKnRokV3+hOC4tBZGYG71HnRuNAPx0mzR6R/PWLDG/FIksA/Q+0+uV5UiRDJ?=
 =?us-ascii?Q?6m6OS7S09WM6/G+lX767ubtz55V2/QP9PnYrvA/9wSMTjXI21inxZuScnMb7?=
 =?us-ascii?Q?5Hh7AG2PjRYX4mlYdxMyawBJkAVeO9MkpjFltRjj7/m5ZIaZUGKgPAcwfr2y?=
 =?us-ascii?Q?mbNbUdZdtQ33CTGhJc66AuzKCrYUlfzlmEstBRs+0lkzrvpVBTReKTkhqDnX?=
 =?us-ascii?Q?9hHiLWj6/UUSx9BTzSfOqDFt13bQPONr7EwI54wWKaoMDe+X3uzIN5VTxTRQ?=
 =?us-ascii?Q?bSPgEejvLqdpMVL8pcgGgTFJMhcOwuKmfKKHiowtE/cnqV0Xe+gSbxQCWSON?=
 =?us-ascii?Q?+plh56M6qqyzUJ7cFfH1H0xuhK68xMbUJpFu0lVPBnnbU/+65+TRMpiz3Obv?=
 =?us-ascii?Q?PzcxMxzKCgueGHQuPKQ8oL862nwS+sDSjdezWyJI9kB/ywjWnDln/sGPzdpd?=
 =?us-ascii?Q?QmWCM6LD7DmoHCNyKF9sDutPpDDbbprQkQvBFTIxBr1c3TUaVItuvRvpfUjb?=
 =?us-ascii?Q?OHud6glXM4EibD2Xjtpf5DLa0E0ugJ80iyZXq51LBcFwRu5c74db/Tpw/J4Y?=
 =?us-ascii?Q?bqtNF7ctBhMQvF3ApHtxeqnXGfc29Jz0a8jP7nJpkGI+OU/xudbeKFuN/35O?=
 =?us-ascii?Q?agC1Lnw68hCXfC+5pH/3Hsl5HEPEt/fLtFt+pPreJx2dvXYxmTxxi7YvH/JD?=
 =?us-ascii?Q?vSZ+I0oaGxupHm2J3aVouoGM7LeGmSfRIhIGUQ7110a6c/b7vXbMsmHSktiM?=
 =?us-ascii?Q?uzVgKM+0hlRSk0/wBc52IgY0ssiDpmiy3kjScw5IRfqIP35BzNz03i5zNKav?=
 =?us-ascii?Q?mrZpMYUjcEBNS6obLoX5u+s+mULMl+3E9vzNvS34daweWHaqS7HUcGDWUGjL?=
 =?us-ascii?Q?vF5tdpdNj0YszN81RQYd7HcvYR5NNfjaM1tJk2Vm993jxTLcrKmNBnKaPyng?=
 =?us-ascii?Q?iPhCCNwqX/ELSRH0Dro7k8Mqoww24EDv/xPKbJwdvUQROTFGE0I+zCFJP0y6?=
 =?us-ascii?Q?N5EY+6X+cNJVjEv0BB9SNtusB9gYLj5nvvnkg76TVjv/fzAepkvy+8yK4Cix?=
 =?us-ascii?Q?lNpunRtWbUzODZJlyyhziT9LWVt3AeCINjce2pigEEVYUVnolssulN1F92Vi?=
 =?us-ascii?Q?qoDypNbyJo6O/fsGSD6D8MPpoapa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HTmkZWUFth93pdF8e7tBY0MiafquWmJbLY9ReH2FhFij7LoK9q/I3sHtSYfy?=
 =?us-ascii?Q?lIdCdnYwadCLXPChA7m+EcI4IZMpMiVlCr2/HHNkrYpsWbVV8Pi/13BIVHtA?=
 =?us-ascii?Q?wgTTzGL2lXbX1BDlFYCjEaqs1wNW8tozS5fbnDFAuzYv1Z3/hFK3oUXJ8Dhp?=
 =?us-ascii?Q?YDHnndM6lSTOddZabl+WxWFz+FF/TAXKL5W4mEjUCmoGvGjzPhOjeGyG8Ivr?=
 =?us-ascii?Q?Cll/Q327DsDyu8O/5kxFemiF2jf6tPA/9deKwIBqj0M1MqOKTXoJnncNpCKq?=
 =?us-ascii?Q?Y9Xx0oR7N/PpzVyuGCLhL3oG0kRKkMw/tHoJoHTZOrv0woBC9XR9IDndDK0G?=
 =?us-ascii?Q?3UXQxFd5QmrNLWhG/7L6ZrUewzMwHy795rppSz64vJZe1otAL2N1ONAxcAyv?=
 =?us-ascii?Q?jURt6aSg+g1ytmOBUQVT+Sq/J6YLs+/R0/xMM0ZmDdyPQWzx158Ums5PdJRN?=
 =?us-ascii?Q?axzJkP/GOCSr2rzKLSrb75R9Eo8QYg0qhANsE3Q3uHEflmPHpdYIT1pdhBMM?=
 =?us-ascii?Q?8Hi4zCkl3+ieNEpNerxNt1b38Ac1CM8nwVi3jLvh8AxjRWXlmW3F5aPV+avA?=
 =?us-ascii?Q?5hTTHzK21R2b4qPgxl7I/SEURwbsVUhTSoT9C5WomE4HV0WtVEapqw14IRzt?=
 =?us-ascii?Q?iFH61dCg/UiMJMJVA1xcYmR6PmH/e/VNbuSQ2aELaq9o6le4sM+oFIMpjOTi?=
 =?us-ascii?Q?C7bi8U6ZpGLF2ZggAshwjTeFJ+kQEK0hE7SeyORsYtGvGD9o862A76KC1yHO?=
 =?us-ascii?Q?L5LL1YRlJezhX8vFlMVCGcy5rg0EOgfV1zREEnQhWu32B1V04ecpvJanu0Zw?=
 =?us-ascii?Q?G/FlHRDz/3j3p0SGhhsY0T2Q3Akt4vjc9X7V9HvjzMRfFKRLiwGj1a0UTFGx?=
 =?us-ascii?Q?A7GN2KtDqm92yvR7eVGNM5xq3oHWTqO+E7ECvnfluPivZpXYzRHZIVAwWmJt?=
 =?us-ascii?Q?CMTldtF3OTVXwbQAPJWZxJpJ3kTOwom9OZ5KqiNzgVuKqA0Htw3evkCRW/K6?=
 =?us-ascii?Q?xw4QW4dT9reVTC4mDS0VkoX0l8fSMcZpRu6YaXnZxMUhHkXQJ4bFq2UEp5qR?=
 =?us-ascii?Q?mn1zroQPdQiR1UiNL2ms/TZM2+1lyZiVfnW7uSPgM9bP/000jbQ9GbgaYtko?=
 =?us-ascii?Q?rFRWPEs13dqPqSnG3hRE2vXA4EG2NfKNfcfcMihR4xXzPttv4Ila2ONOrat6?=
 =?us-ascii?Q?y+x1FY10si5NmNxEuczc+KmKLyoWq8nAVx/W2Q3+SltNNb//YYCYHp4NkxFK?=
 =?us-ascii?Q?zcy7rtMlw+ZfAdOCszkApPKCray10WsIys385j6FhvSqBwsb0cTLjuXCUboj?=
 =?us-ascii?Q?a1NjlCFjf/SMsmPLhQNcVKDqP1IfhqIYm7YDRygP43szwQoogR24yp7+069b?=
 =?us-ascii?Q?fATuM/NSiEHZRUaQQXhGAki9aiea3v2D0GeLY9oZlsisVjUaDVyeCQNmuPuC?=
 =?us-ascii?Q?bI1ok8xp8nxzhH0ucJOUIasCxl29a7p56kuWrZYXBAAiqSmIZIl30/r5xS3m?=
 =?us-ascii?Q?zG5gBpjGIOeraNfqQwasKxYvborq94tR11M91i8kFWvolLdgk9ePt1cJwPBh?=
 =?us-ascii?Q?m1zEn0GUP503JI+m9Xtrd4l/x1kzvE5q/oLUBnivJMNzuQWeDjPj5OPi9D1R?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a0f694-4b69-4dd3-ca86-08dd5827c2bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 18:43:15.2055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VunAG9mxj1iWzIZCT6GTPadh+coeFOl2XduBw5afe2PDroxdynqAmd5eD0oMOvcYCcQrmkV9EM/Es225mZizQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6134
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

On Fri, Feb 28, 2025 at 10:30:57AM -0500, Oak Zeng wrote:
> When a vm runs under fault mode, if scratch page is enabled, we need
> to clear the scratch page mapping on vm_bind for the vm_bind address
> range. Under fault mode, we depend on recoverable page fault to
> establish mapping in page table. If scratch page is not cleared, GPU
> access of address won't cause page fault because it always hits the
> existing scratch page mapping.
> 
> When vm_bind with IMMEDIATE flag, there is no need of clearing as
> immediate bind can overwrite the scratch page mapping.
> 
> So far only is xe2 and xe3 products are allowed to enable scratch page
> under fault mode. On other platform we don't allow scratch page under
> fault mode, so no need of such clearing.
> 
> v2: Rework vm_bind pipeline to clear scratch page mapping. This is similar
> to a map operation, with the exception that PTEs are cleared instead of
> pointing to valid physical pages. (Matt, Thomas)
> 
> TLB invalidation is needed after clear scratch page mapping as larger
> scratch page mapping could be backed by physical page and cached in
> TLB. (Matt, Thomas)
> 
> v3: Fix the case of clearing huge pte (Thomas)
> 
> Improve commit message (Thomas)
> 
> v4: TLB invalidation on all LR cases, not only the clear on bind
> cases (Thomas)
> 
> v5: Misc cosmetic changes (Matt)
>     Drop pt_update_ops.invalidate_on_bind. Directly wire
>     xe_vma_op.map.invalidata_on_bind to bind_op_prepare/commit (Matt)
> 
> v6: checkpatch fix (Matt)
> 
> v7: No need to check platform needs_scratch deciding invalidate_on_bind (Matt)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pt.c       | 93 ++++++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_vm.c       | 26 +++++++--
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 +
>  3 files changed, 84 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1ddcc7e79a93..4e16df96f3e4 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -268,6 +268,8 @@ struct xe_pt_stage_bind_walk {
>  	 * granularity.
>  	 */
>  	bool needs_64K;
> +	/* @clear_pt: clear page table entries during the bind walk */
> +	bool clear_pt;
>  	/**
>  	 * @vma: VMA being mapped
>  	 */
> @@ -415,6 +417,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>  	if (xe_vma_is_null(xe_walk->vma))
>  		return true;
>  
> +	/* if we are clearing page table, no dma addresses*/
> +	if (xe_walk->clear_pt)
> +		return true;
> +
>  	/* Is the DMA address huge PTE size aligned? */
>  	size = next - addr;
>  	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
> @@ -497,21 +503,27 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
> -		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> -						 xe_res_dma(curs) + xe_walk->dma_offset,
> -						 xe_walk->vma, pat_index, level);
> -		pte |= xe_walk->default_pte;
> +		if (xe_walk->clear_pt) {
> +			pte = 0;
> +		} else {
> +			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> +							 xe_res_dma(curs) +
> +							 xe_walk->dma_offset,
> +							 xe_walk->vma,
> +							 pat_index, level);
> +			pte |= xe_walk->default_pte;
>  
> -		/*
> -		 * Set the XE_PTE_PS64 hint if possible, otherwise if
> -		 * this device *requires* 64K PTE size for VRAM, fail.
> -		 */
> -		if (level == 0 && !xe_parent->is_compact) {
> -			if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
> -				xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
> -				pte |= XE_PTE_PS64;
> -			} else if (XE_WARN_ON(xe_walk->needs_64K)) {
> -				return -EINVAL;
> +			/*
> +			 * Set the XE_PTE_PS64 hint if possible, otherwise if
> +			 * this device *requires* 64K PTE size for VRAM, fail.
> +			 */
> +			if (level == 0 && !xe_parent->is_compact) {
> +				if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
> +					xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
> +					pte |= XE_PTE_PS64;
> +				} else if (XE_WARN_ON(xe_walk->needs_64K)) {
> +					return -EINVAL;
> +				}
>  			}
>  		}
>  
> @@ -519,7 +531,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		if (unlikely(ret))
>  			return ret;
>  
> -		if (!is_null)
> +		if (!is_null && !xe_walk->clear_pt)
>  			xe_res_next(curs, next - addr);
>  		xe_walk->va_curs_start = next;
>  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
> @@ -590,6 +602,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   * @entries: Storage for the update entries used for connecting the tree to
>   * the main tree at commit time.
>   * @num_entries: On output contains the number of @entries used.
> + * @clear_pt: Clear the page table entries.
>   *
>   * This function builds a disconnected page-table tree for a given address
>   * range. The tree is connected to the main vm tree for the gpu using
> @@ -602,7 +615,8 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   */
>  static int
>  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> -		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
> +		 struct xe_vm_pgtable_update *entries,
> +		 u32 *num_entries, bool clear_pt)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_bo *bo = xe_vma_bo(vma);
> @@ -622,10 +636,14 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		.vma = vma,
>  		.wupd.entries = entries,
>  		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
> +		.clear_pt = clear_pt,
>  	};
>  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>  	int ret;
>  
> +	if (clear_pt)
> +		goto walk_pt;
> +
>  	/**
>  	 * Default atomic expectations for different allocation scenarios are as follows:
>  	 *
> @@ -685,6 +703,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		curs.size = xe_vma_size(vma);
>  	}
>  
> +walk_pt:
>  	ret = xe_pt_walk_range(&pt->base, pt->level, xe_vma_start(vma),
>  			       xe_vma_end(vma), &xe_walk.base);
>  
> @@ -981,12 +1000,14 @@ static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
>  
>  static int
>  xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> -		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
> +		   struct xe_vm_pgtable_update *entries,
> +		   u32 *num_entries, bool invalidate_on_bind)
>  {
>  	int err;
>  
>  	*num_entries = 0;
> -	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
> +	err = xe_pt_stage_bind(tile, vma, entries, num_entries,
> +			       invalidate_on_bind);
>  	if (!err)
>  		xe_tile_assert(tile, *num_entries);
>  
> @@ -1640,7 +1661,7 @@ static int vma_reserve_fences(struct xe_device *xe, struct xe_vma *vma)
>  
>  static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  			   struct xe_vm_pgtable_update_ops *pt_update_ops,
> -			   struct xe_vma *vma)
> +			   struct xe_vma *vma, bool invalidate_on_bind)
>  {
>  	u32 current_op = pt_update_ops->current_op;
>  	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> @@ -1661,7 +1682,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  		return err;
>  
>  	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
> -				 &pt_op->num_entries);
> +				 &pt_op->num_entries, invalidate_on_bind);
>  	if (!err) {
>  		xe_tile_assert(tile, pt_op->num_entries <=
>  			       ARRAY_SIZE(pt_op->entries));
> @@ -1681,11 +1702,11 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  		 * If !rebind, and scratch enabled VMs, there is a chance the scratch
>  		 * PTE is already cached in the TLB so it needs to be invalidated.
>  		 * On !LR VMs this is done in the ring ops preceding a batch, but on
> -		 * non-faulting LR, in particular on user-space batch buffer chaining,
> -		 * it needs to be done here.
> +		 * LR, in particular on user-space batch buffer chaining, it needs to
> +		 * be done here.
>  		 */
>  		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> -		     xe_vm_in_preempt_fence_mode(vm)))
> +		     xe_vm_in_lr_mode(vm)))
>  			pt_update_ops->needs_invalidation = true;
>  		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
>  			/* We bump also if batch_invalidate_tlb is true */
> @@ -1759,10 +1780,12 @@ static int op_prepare(struct xe_vm *vm,
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +		if (!op->map.immediate && xe_vm_in_fault_mode(vm) &&
> +		    !op->map.invalidate_on_bind)
>  			break;
>  
> -		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
> +		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma,
> +				      op->map.invalidate_on_bind);
>  		pt_update_ops->wait_vm_kernel = true;
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
> @@ -1771,12 +1794,12 @@ static int op_prepare(struct xe_vm *vm,
>  
>  		if (!err && op->remap.prev) {
>  			err = bind_op_prepare(vm, tile, pt_update_ops,
> -					      op->remap.prev);
> +					      op->remap.prev, false);
>  			pt_update_ops->wait_vm_bookkeep = true;
>  		}
>  		if (!err && op->remap.next) {
>  			err = bind_op_prepare(vm, tile, pt_update_ops,
> -					      op->remap.next);
> +					      op->remap.next, false);
>  			pt_update_ops->wait_vm_bookkeep = true;
>  		}
>  		break;
> @@ -1786,7 +1809,8 @@ static int op_prepare(struct xe_vm *vm,
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
>  		err = bind_op_prepare(vm, tile, pt_update_ops,
> -				      gpuva_to_vma(op->base.prefetch.va));
> +				      gpuva_to_vma(op->base.prefetch.va),
> +				      false);
>  		pt_update_ops->wait_vm_kernel = true;
>  		break;
>  	default:
> @@ -1856,7 +1880,7 @@ ALLOW_ERROR_INJECTION(xe_pt_update_ops_prepare, ERRNO);
>  static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  			   struct xe_vm_pgtable_update_ops *pt_update_ops,
>  			   struct xe_vma *vma, struct dma_fence *fence,
> -			   struct dma_fence *fence2)
> +			   struct dma_fence *fence2, bool invalidate_on_bind)
>  {
>  	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
>  		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> @@ -1871,6 +1895,8 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  	}
>  	vma->tile_present |= BIT(tile->id);
>  	vma->tile_staged &= ~BIT(tile->id);
> +	if (invalidate_on_bind)
> +		vma->tile_invalidated |= BIT(tile->id);
>  	if (xe_vma_is_userptr(vma)) {
>  		lockdep_assert_held_read(&vm->userptr.notifier_lock);
>  		to_userptr_vma(vma)->userptr.initial_bind = true;
> @@ -1929,7 +1955,7 @@ static void op_commit(struct xe_vm *vm,
>  			break;
>  
>  		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
> -			       fence2);
> +			       fence2, op->map.invalidate_on_bind);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		unbind_op_commit(vm, tile, pt_update_ops,
> @@ -1938,10 +1964,10 @@ static void op_commit(struct xe_vm *vm,
>  
>  		if (op->remap.prev)
>  			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
> -				       fence, fence2);
> +				       fence, fence2, false);
>  		if (op->remap.next)
>  			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
> -				       fence, fence2);
> +				       fence, fence2, false);
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
>  		unbind_op_commit(vm, tile, pt_update_ops,
> @@ -1949,7 +1975,8 @@ static void op_commit(struct xe_vm *vm,
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
>  		bind_op_commit(vm, tile, pt_update_ops,
> -			       gpuva_to_vma(op->base.prefetch.va), fence, fence2);
> +			       gpuva_to_vma(op->base.prefetch.va), fence,
> +			       fence2, false);
>  		break;
>  	default:
>  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 996000f2424e..47051735f0e1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1946,6 +1946,20 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  }
>  #endif
>  
> +static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
> +{
> +	if (!xe_vm_in_fault_mode(vm))
> +		return false;
> +
> +	if (!xe_vm_has_scratch(vm))
> +		return false;
> +
> +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> +		return false;
> +
> +	return true;
> +}
> +
>  /*
>   * Create operations list from IOCTL arguments, setup operations fields so parse
>   * and commit steps are decoupled from IOCTL arguments. This step can fail.
> @@ -2016,6 +2030,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>  			op->map.pat_index = pat_index;
> +			op->map.invalidate_on_bind =
> +				__xe_vm_needs_clear_scratch_pages(vm, flags);
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>  			op->prefetch.region = prefetch_region;
>  		}
> @@ -2213,7 +2229,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				return PTR_ERR(vma);
>  
>  			op->map.vma = vma;
> -			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
> +			if (op->map.immediate || !xe_vm_in_fault_mode(vm) ||
> +			    op->map.invalidate_on_bind)
>  				xe_vma_ops_incr_pt_update_ops(vops,
>  							      op->tile_mask);
>  			break;
> @@ -2441,9 +2458,10 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		err = vma_lock_and_validate(exec, op->map.vma,
> -					    !xe_vm_in_fault_mode(vm) ||
> -					    op->map.immediate);
> +		if (!op->map.invalidate_on_bind)
> +			err = vma_lock_and_validate(exec, op->map.vma,
> +						    !xe_vm_in_fault_mode(vm) ||
> +						    op->map.immediate);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 52467b9b5348..dace04f4ea5e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -297,6 +297,8 @@ struct xe_vma_op_map {
>  	bool is_null;
>  	/** @dumpable: whether BO is dumped on GPU hang */
>  	bool dumpable;
> +	/** @invalidate: invalidate the VMA before bind */
> +	bool invalidate_on_bind;
>  	/** @pat_index: The pat index to use for this operation. */
>  	u16 pat_index;
>  };
> -- 
> 2.26.3
> 
