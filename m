Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E83CD11C2
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 03:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6C410F4C3;
	Wed,  3 Apr 2024 03:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jj96HnF1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBD910F4C3
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 03:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712113555; x=1743649555;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bzLO9+wYYyZ0jyzSWpnZ9CsWTTuEETHpkcu26hHHw2M=;
 b=Jj96HnF1g2mtEoB6q1730EDKAh/V0597gjXFt1eBk11CdcyIYbZ25hbT
 nv3z9r10HrVgJKZOwn9HwvrQY+BCIvbsi5CWTSMeMndotlcQvYVzNm0yf
 cRBGLCAnZT4IF6wZm3j9HwzuLUn0mtJ6UONLtMEM0pE50yThlMtiEt7zF
 ++gaawVso1l0AyeMJbR2/z58rP3zbAK8ZVHAi0eYeKfnnscvQmvEQm1Oy
 zhRZUQBALW+xG44HaZlmuVCx6OQqDHrcCmCOrzQQOqXkBNdiTB1VGHRWB
 pSdUZQKjwQz5ISjj4WWG95Gco/DDp8DGPPJXRArJTvpq3lUv+V8HwhzTs w==;
X-CSE-ConnectionGUID: 4alhBaJXSNihUJmsZLeVVg==
X-CSE-MsgGUID: ujFGlbXJTz2uEG7/Z6z5xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="32715378"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="32715378"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 20:05:48 -0700
X-CSE-ConnectionGUID: wYGsBzZdT6i6JHAhPV54uA==
X-CSE-MsgGUID: HiuBz+8YRPCRp9ue4m9o6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="22980497"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 20:05:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 20:05:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 20:05:48 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 20:05:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ml7iA+F9NiKdqsVAoA9klpABixZNheqiRzNwepKdpUDoTtzVgK5I5A09SXNjI7d6/GG36u5wtxvEihvsgMF/t0GS2AUgUu5UU/Mtl8tanPWNmbdCjzkpvNor08Wqr6T1M+t8tVBTeNTKjbQSRkH7ZEOAkpTRSVvzMg196iYSKPFI9ra2wPSuPJVFmufhGzxTuHrQqPj75h2jQehwfVM7h9DZupQkhbEopr94YENWZWVEQH7pZSEaUicfpLcKjemqxieZW61XhgpMszTa4LTlz8H5rCe3KrAnpoHS0wnH1tW4RA/9RNJFEoy9RmzlMRw72IOg4VrIMzCb/qc2q/Gyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAHr4KF4XvI3hGfZJRBFfZfX9o3x+wWg5YeB4/uTDS0=;
 b=cDJUYMuwxYJArZ1TeIjdtsWJPNXWDs4Zm3GbXkimtFd1dxya8ZtBqwkhjo58n7wyuOiD3Hvj2ExAenaueVomqBuZfnk3toerS3Tzq9e2KkzsXaemvErlZw9nsXevC0zU76LANKeyFGT6O0av28fHhGzb7NoWoZUYt4c0R0pb58rYANfiF3y2nEpOVMBdzp/RVs4O2tJKtSRsqvYx14C17ossiqLUONQ91s/ZBcLgsoeowPy4PZhf+UIGJTX+N0ZM8eq28mVq/1oCY3Oeqj+JckdJBnNt3ucrExi2xj0KHZcLvWqb0nvVh8+Hc1NCsnqpCADQNwW1GNekCmzoGA2SJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6224.namprd11.prod.outlook.com (2603:10b6:8:97::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.25; Wed, 3 Apr 2024 03:05:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 03:05:45 +0000
Date: Wed, 3 Apr 2024 03:06:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@intel.com>,
 <brian.welty@intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Introduce a helper to free sg table
Message-ID: <ZgzHvMem5GRl6wuJ@DUT025-TGLU.fm.intel.com>
References: <20240322035520.2382600-1-oak.zeng@intel.com>
 <20240322035520.2382600-3-oak.zeng@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240322035520.2382600-3-oak.zeng@intel.com>
X-ClientProxiedBy: BY5PR17CA0042.namprd17.prod.outlook.com
 (2603:10b6:a03:167::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6224:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lFrhtJYXUJPL/gU+GN3PgRd3h8VoCVazn1iECmWVRnd6KhhoPG5PSV9C8GcKDfovEtLko7gjd/dlpxiccl6WhpPhbg0WPjrYcU3HKWGqJ1t1s1+8hDgXmczgj2Ki7SUXNwkYYZEkeMMJMWFI2pgrKMaZfj4aN6c2igGt8zbZTVI0+iuu51GfhKkX9KyyAbSEG1ogsuyywrvCjDTyKFnGQgJNmw88R/MMtjhDPH6kteTZ4DoRRCodGKty4CxjeWjF7WQagjUBIN0XxREsrgxYhnAriWvt2PsBqv9hXd+v4yx/+RglIjhjdV4Xykv6V850eiISQFLLVvjYdOE1VlP0hx1H8DToDFl2k1ieYqGQgQIXEDi9LnbUgrvlsaZwTJqFpuvqzEycRK699JMjh9UyO5AGkUfol26VW6fxbsOWirYygEgrgP0Z/WkkME+GcDElxB9E/hDaF5t19mL8tDcBd89QBqb8Lbnu26zO0GOcsyCLJOkynRnTrjJbiGgCBi7/cfpu7XDXVS3PLXq5W5TkhijtJJnJ++I9nIL4eCADLO51+y+jYgkmi0kSt221jwoUCyuIt3A9qNPiqtRPkHD16qC1ipVS9nqqnUyGgLZKoiRGLau83bRjg+p7r+v5F8SSy+Aeb7XGLMElBJ66WoQaGdfprf96U2ipocLXizVbjDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Abo4+PCTSfyZaGfOXfetM7zxzeJus+ks0H2rhCNk3ANHyZR8KUlwU+kTaL?=
 =?iso-8859-1?Q?Rx1l7rsXU2VW5RZoUOlJUOIog1o+Lg4U/OD2v5AdYu9Hkr9fccvQpNVhRc?=
 =?iso-8859-1?Q?yddYZecWp8wFvgDVAyjQhI1i0BYho96RgoKpTXqElj388AJ2PROHs2BqKZ?=
 =?iso-8859-1?Q?krNTq1TfUySkYe+92xJ8SnQ7bsWDh1fW3y2uFbB9QaWbZz4Vf/WtBVzqfc?=
 =?iso-8859-1?Q?kgqMpoTOa945tqO90LmaxeQxkWjUXu4tYjU/XuV8ssbYiSwDajC2oC/Skx?=
 =?iso-8859-1?Q?9eOM+0U0XXGOM4Id55WIzmgH+eCN58172SyVxg4w06xX/SvWld/GiGkSap?=
 =?iso-8859-1?Q?iokVO1wcovt7Qth3cOKoIGBQ6x3dZJ4DUbbl5+ITDYwPDk3eAJj3xD+Jav?=
 =?iso-8859-1?Q?2Mlkc1rfTMJsOpF7py31SCUJMVAtRuhyijzTKRPWWQ75p05tSVfb2KhBFO?=
 =?iso-8859-1?Q?ulUkGv2EL4pNj5jlzs68AsVP3mlwHLtWEuj/1VFJtaXOT5+zbLtB9BL7AK?=
 =?iso-8859-1?Q?VKxWAz28riyFRnc4jdxt0drEU0YaCupT05NysE8WFVcFN2mNSYAOHyvQjP?=
 =?iso-8859-1?Q?Z74GrErNomK00mDkUe14HXEz34IKDeTrZo5l91/QrU9fb/L3gHtb9Fkz1I?=
 =?iso-8859-1?Q?TXc8KAXnaJc6fwxToDIcLhiZgk3jOfHm5JIQd8nQo9n5q2AjoYgB2R+iVU?=
 =?iso-8859-1?Q?aq1jiSgrwgKj6foKv9UbsQJ3F3/doCvJt4prTTaSK/DSNRipNowatZMUQs?=
 =?iso-8859-1?Q?UugvadgerTv1UImqo6tobE4OAYpB4Ca8FUenTIY3IW7JqY9+m0iVK6joY0?=
 =?iso-8859-1?Q?xZ9Om8zbAILFmMJKdaBmi4Ac0V5o3GRaa3qwTwvSdx3LUro9VyOFyOPOBg?=
 =?iso-8859-1?Q?xcNcrAzToUpZUkbEMfOlTT5vB68nyuotdTxQN6Fgk3O8FKfMrQRhKyQyOq?=
 =?iso-8859-1?Q?8E1JgJOHB9H9fqzasFJM+jhUT+GYv6cbbEqfXL2WKiLfGUpelFROZGlZ5Z?=
 =?iso-8859-1?Q?UZ+/d2rupx6fPJkj4jjchzkcIgjR4EfS7GknREXcPkx+mhhv1hvkJyjO9b?=
 =?iso-8859-1?Q?DK0jVVdDV8BYlKXESw8XIOThiE11NsCKfskwBEkqXQWsxUxiC4rNtKzGrP?=
 =?iso-8859-1?Q?7SQWvSYtO5gjkDFHeCb+71IaVqI2D4B5KWIarMuyM0Swle/TBt+MrVblsU?=
 =?iso-8859-1?Q?+trqTz/VfLtF3B41geFTVicLzg0UynCCkbdhMZPT+5XPdSS1TIdqXLrubR?=
 =?iso-8859-1?Q?RyIBIFqaBfTgsajP8f17MXLwHQqH8y5K3mjd8cHK8chqqGIbget4rW2Ghl?=
 =?iso-8859-1?Q?C6qH806XF75WLmK9zDcNYxwl+BYAn8rLsUFIKY32e7bfZl40TrtwSSxErF?=
 =?iso-8859-1?Q?zcLaZInqNW7FC/KKwEG2BmwLmEGlJ64922k4TVoizgH/acl5h9kJ41kTI8?=
 =?iso-8859-1?Q?Fe0qKy+xsoWZpE9m0CbHr4mTt/Y1qMIcpXdtO5WLQBuRszVYZma3LVxDYR?=
 =?iso-8859-1?Q?2n4KZF1vfSUIWnPaVF0ZTWNhB2ObKl1V0ioobbEoXgsOBR0Rtu83w75rl+?=
 =?iso-8859-1?Q?Hqu3LoZAGz+aCDsZUP8bDTDL4U070PGods1OQEqdagV0Zi0y72To0NLNAQ?=
 =?iso-8859-1?Q?sCoHj9OyhVMa74cXg3a48YoaPwtKba17XRWqiqNRKE8uf9IT8vgyo7yg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e08db0-09c2-4267-4a14-08dc538af4b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 03:05:45.7313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nFphAGsSvtwqHBSU9a6/S8b6j38eBj8vuB4YYrddr4jWuCaJXEN+XAwwKoGY051QI4VInGWKz7RtOtHyUTTGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6224
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

On Thu, Mar 21, 2024 at 11:55:19PM -0400, Oak Zeng wrote:
> Introduce xe_userptr_free_sg helper to dma-unmap all
> addresses in userptr's sg table and free sg table.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Suggested by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hmm.c | 30 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hmm.h |  1 +
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> index 4011207630a5..427c6bc49949 100644
> --- a/drivers/gpu/drm/xe/xe_hmm.c
> +++ b/drivers/gpu/drm/xe/xe_hmm.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2024 Intel Corporation
>   */
>  
> +#include <linux/scatterlist.h>
>  #include <linux/mmu_notifier.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/memremap.h>
> @@ -107,6 +108,32 @@ static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
>  	return ret;
>  }
>  
> +/**
> + * xe_userptr_free_sg() - Free the scatter gather table of userptr
> + *
> + * @uvma: the userptr vma which hold the scatter gather table
> + *
> + * With function xe_userptr_populate_range, we allocate storage of
> + * the userptr sg table. This is a helper function to free this
> + * sg table, and dma unmap the address in the table.
> + */
> +void xe_userptr_free_sg(struct xe_userptr_vma *uvma)

See my comment about passing in xe_userptr_vma as an argument in the
previous patch, anyways can live with it.

But s/xe_userptr_free_sg/xe_hmm_userptr_free_sg?

Also I'd squash into the previous patch.

Otherwise LGMT.

Matt

> +{
> +	struct xe_userptr *userptr = &uvma->userptr;
> +	struct xe_vma *vma = &uvma->vma;
> +	bool write = !xe_vma_read_only(vma);
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_device *xe = vm->xe;
> +	struct device *dev = xe->drm.dev;
> +
> +	xe_assert(xe, userptr->sg);
> +	dma_unmap_sgtable(dev, userptr->sg,
> +			write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
> +
> +	sg_free_table(userptr->sg);
> +	userptr->sg = NULL;
> +}
> +
>  /**
>   * xe_userptr_populate_range() - Populate physical pages of a virtual
>   * address range
> @@ -156,6 +183,9 @@ int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
>  	if (notifier_seq == userptr->notifier_seq)
>  		return 0;
>  
> +	if (userptr->sg)
> +		xe_userptr_free_sg(uvma);
> +
>  	npages = xe_npages_in_range(start, end);
>  	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
>  	if (unlikely(!pfns))
> diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
> index 91686a751711..7bb49bbde5a4 100644
> --- a/drivers/gpu/drm/xe/xe_hmm.h
> +++ b/drivers/gpu/drm/xe/xe_hmm.h
> @@ -15,3 +15,4 @@ static inline int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
>  	return -ENODEV;
>  }
>  #endif
> +void xe_userptr_free_sg(struct xe_userptr_vma *uvma);
> -- 
> 2.26.3
> 
