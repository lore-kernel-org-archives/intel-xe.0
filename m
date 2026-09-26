Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D0BC9830E
	for <intel-xe@archiver.kernel.org>; Sat, 26 Sep 2026 01:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA68510FD1C;
	Sat, 26 Sep 2026 01:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h4IwcjPC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0CB10FD1C
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Sep 2026 01:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790386966; x=1821922966;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XPw23aBxldvVlGSZeJO1sSpTrritErAxqrzlG3iwJTs=;
 b=h4IwcjPCQI4CpQoPEEVAvLlQtjlv7vogUYraLSrncMkVUWSGjjbeDJND
 sDZalZOmdLFw73sckUEhsYUXtPi02uNv6GdtpVc5e6zz1iGNFSxqiCu8T
 oeqM+M+KDXXfswBz6rV9jImfU5rzcCa9JMZJN/1sTFmbtmE3cLehK6Kqc
 xU5AIXP8PWNid/dIf1H8hotVISMa5zeFof6ro6EWRzY4yxX+KWajZxl/Z
 CodGz/sPFcrG9JTGD+L6Lhh1eKrnzwDZEXdEy5drZlkNW+heqsOKivCnu
 yZia9wmh4/m00rlHxJPZ7PqPWCybdE2jirMSLztrKr8G182/aM9urUFOL Q==;
X-CSE-ConnectionGUID: jTtexkstTeS94fogDv77gA==
X-CSE-MsgGUID: 4hO1yzgjSQ6bBrDuAUSd/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90236278"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="90236278"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 18:42:46 -0700
X-CSE-ConnectionGUID: t2cRPJI9TA6L8n1rdK7lxw==
X-CSE-MsgGUID: T9I2aVeHS2+cXDUSPyCNmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="274560794"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 18:42:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 18:42:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 18:42:45 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 18:42:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8Pr8l5LraL0nB0oPCPx/ygHtNeWYFOPCMBbnOWApvceOnSkvFrTGxiGKtgbS7cb2SNeNwr6jb+PqrntRV6p3DgNcDxdfVGlpHRuisfw1E4XWK+fKHgFuiONF1RNK9NSPJVeKCV3sJkPMH4CSyGP9lg8Gy+U3zzIyBzhSO2+mNbckkEzfYfDdLT25/utKez9GoRTEQux1DhEaHM/pT+Gjgmn3BRzPP3E+odY93af+j30JBP2hsbZgbIuquK+Z73egZDBDtRlGLFSZ9FtDx7GE5Tu6QOOYsCCsTPgbxNq6LXwIawXhNDKjOHcK5vJ5V7873ANh1DLanBbM9PqAsizAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=empRr6BTjgUdTRwImY1nTKAo+g/AH4how5oeevOLOJA=;
 b=QQpuTVmAKekCQBbS03u9cCTcCDg5wj6VHWnRaQxt6tyNnkIrTb1t18xwEltlRciP+k6lLvHzjbD1e3Wi30imdl1gkpg5oN6BqFeIqQ0vhf7hPC1VaDhtI+51zll3UzgrHnDkMkLL3udVm4wWe9HTmoTyVptv1kqLik/H8PFsPZ+8oyTGWGfX5hXcNErlSROmBsWvdpfxC5CDiaGEWKXuYGnRMm7jYiyRazIPXnjpgL6i2hDTiXKGrcy2kMJvGSvY39GMA5HT7Y17Np7mcZzcGAiTytZYozrYybPaRXrAcgJ5TnZ7oGvBM+qu1PDsQFUZKMSvR2kcLgdH1xBu7fjs3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by PH8PR11MB7143.namprd11.prod.outlook.com (2603:10b6:510:22d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sat, 26 Sep
 2026 01:42:37 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 01:42:37 +0000
Date: Fri, 25 Sep 2026 18:42:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/4] drm/gpusvm: Add devmem callback to get_pages
Message-ID: <arcjC0+EQj+Iiu+Z@gsse-cloud1.jf.intel.com>
References: <20260922043759.3057442-6-himal.prasad.ghimiray@intel.com>
 <20260922043759.3057442-8-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260922043759.3057442-8-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0307.namprd03.prod.outlook.com
 (2603:10b6:303:dd::12) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|PH8PR11MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5eb810-bae4-4c37-993b-08df1b6f7199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|22082099003|18002099003|56012099006|5023799004|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: f+b76QsRBcnDwdM4KFKimtHFCXWDDB+3LIGAvWhScsxVlVbfT488ALHS+d8McMAlPzUnuqxbTgvr4zcFNi6uHcifP2KSI3msF1sNVgQ8n9JvMG4b3EQs0T29yqL11slMqKhpqFojXabYWDVLpsuRk8k3cZmnZ5Sb1vY2Awx0WlR+g734Qbo0Q4lVSgJZUUgygZXVDqmCTWA4s08R2sTFTrHC20BjgaNboFMbi7a7C34oAmfY3/3BWszk03w+Rf6CPV1+rkh9U9qjlkMdbzFrzl+OfQuenqa0cFxdeQbQU6QUie6qtk/szzcjFmx7xM89E1Jmni8iKSmaMBP3MefWC29wH2WB+4YzR9VV4NM9bLJB03aUrdXbJM61B0qoQ3tEs7USBjJCfrdK0vr7oqfYNJVR9t2HmSGwL6Su5f0IoTqagO+KTCIxfkdwa1+4uK/WqFcByzpbc7QmkeU+wToUSdn/m1Vh1BGZDZLW/CnCkSgMsu1MTPtFFuSfX0PTuAjwx6qnNEHekgX2tmtOleRUXksh+7VC0dcuptAemDG7/o+15jPPrX9IoXxSKKVRaaLy+w9fHBI1Z3Ll+fa9gwttYv+QU6iUQj5sy5QKzfoOlmaaup1gX6EZ2dpRZN/MXrDNrPHJQbjjtTa7M3so0SnB5b5HS0MZegkcsXSJsTe6XAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(5023799004)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YJlCze/6dqvKiZ+hzC6dgO6kvfO8N2TdRLGzpnDFzMY1OLaWS5a7wD+F4t4l?=
 =?us-ascii?Q?GLyx8mp11iaHio8UgsxP3auP40Wyvq0liQ6fqOL46rZaenxU18ujh+GPMpkf?=
 =?us-ascii?Q?1DpfZhBcHOMksEuddD4uD9lb5r10TiWR/cmT2QJxKWva0uOjNtbuMwIz4S5c?=
 =?us-ascii?Q?vWXdxDtMbGFzHjIJW/pks7xTRqlv+rMBqqYsvGUtbs/fy4zmEg4Xq0KYHwTw?=
 =?us-ascii?Q?91mPa7wj2K3KzFr5VNG6GP8wrolwY08xbwGkr6XIz7KQAqiaQjTRTaAC2xU0?=
 =?us-ascii?Q?Go6ltCDjLgIPFef2QULY7/6xEFkw06dIBkCsjeqDY/LIbLaa2xgOTGJ5BYPL?=
 =?us-ascii?Q?x1SbYiO/nfIINrLdW2RvHLAY24W0cIW/Wg33mblN+K7s4r3oF3+uNNXdk8oi?=
 =?us-ascii?Q?r78in1nAgOG/Y3s7MK4Oxvh7PWQmx/X1IcyHw5stKZhkhiF9u4+l3yZMPzV/?=
 =?us-ascii?Q?LNRSiREWVlo0nk6kREr70CR1rwGX/AmBsnzB2FFKftiWntyihpxvokQjWVaH?=
 =?us-ascii?Q?w2o1ht89E6FZ2bLnb9/dMum3IZeMfCX4HCzhq24pxqAaEGKjXkUAwTLcQchw?=
 =?us-ascii?Q?LOd+n/VgZKXvpwoRNNYPCZ+p7tq86H8CZrmjsKNxzKpIp3orA6Pzoben/qUG?=
 =?us-ascii?Q?e3QZnKDE5xX6byY2Kdfq7EcsYz5U7bjoTcNY8nAIFZtbVpvc52cymdGvb25r?=
 =?us-ascii?Q?S8jEqm6FGojnRKsnEKNkmQ2tXc5aYz0qTUyaMdufnxFzYyJjICMUd/309Qf2?=
 =?us-ascii?Q?sO4z2TN+mJbncFevHgDrc1zwPF5y5cscoL5eEI2pLrTjQECE++Jc/7tDYzgr?=
 =?us-ascii?Q?uu+0+VHbFe1nG0/Cq77VpkxfNlf5UvwEYLoH81g8yrrbA0xlS5K+Ob2cjnxw?=
 =?us-ascii?Q?CK9X+MhOkwnamOkbE48oRncIEtl5O+SOQxdVtKNpjBt5qB1b6BEpJ3zGKUBZ?=
 =?us-ascii?Q?4QUa6jp7q4EmLO4BTGzXeKzYviPqrXmIATwWQOtuMI4m2qpvu6WKWpDEerGy?=
 =?us-ascii?Q?rErGfdVz+Um0ZDRoH9fQHtm7xPrRihG19XxgXzcrAiI2VyRV+DvruKPT0Mhp?=
 =?us-ascii?Q?/FVGm1YJwoVOv1oR6SFQnTvIRXHOsIBP4m2DogHSSAYmxByeTjVRunFAijfO?=
 =?us-ascii?Q?VkudTKJCS9QeYRoPBR/uE66Fz1Oz/f2E+y3kIKIG8v9rLZLygloCQKhl0GE0?=
 =?us-ascii?Q?znpLZ5mn+QWSFmmuRAlz8QHvfF1NlwjaLu3gnCYOMIEu5pHF2IhDd8nzbbT8?=
 =?us-ascii?Q?vgBXzv+8LVjZ1PGEG9toayfhK/9AiHbFdbSc02bG81YLI1bBEtm8579CHOSR?=
 =?us-ascii?Q?yiVwGyPR/tW12ioKrbXKk17qkOwY5W4F2kSxnnmzauAVrHQodKNENhx6Nsvr?=
 =?us-ascii?Q?Hl/1xhHQnjkSHkvBvJqFie7h8Oe0f4dcDFoG3PFN2R4Utyuw0DgSNky+CxfE?=
 =?us-ascii?Q?11UmUrdRhIUt6FJYv2Go32eaysiqnZB30nVLOFK7LLw2hOnEMKdDd2TPc0CK?=
 =?us-ascii?Q?x2tzIXx/V1jXF3H4U7ygsUERzYHV193tuLSdUoYPhQrDF9aO5ch7CN17KSjB?=
 =?us-ascii?Q?D8xuS2knQcVqtCLk3ZfD21+RKwfPj0StOUbp3lxEVDXtbbIGvJoKh3SP4yRh?=
 =?us-ascii?Q?xjjTiHPWIc04j9xfG2sDxjx86HzvTejMQtELnvD/WquhFAQZE7hcpMS7SLyH?=
 =?us-ascii?Q?w5MqWufJ8UZF0lUwD7yYPR5hsjPkRVzxM35NnyAZ/UxzM853UnL4MW334Cvi?=
 =?us-ascii?Q?zk0i+VvuyJ8XNj6H0bUxCAAbA1aw1QE=3D?=
X-Exchange-RoutingPolicyChecked: L7YZAgBcPJabvbs2BHWLt5iABM9vug45gc2RoqQMPXj4ib3BPnnvBRVUiHg/v5vfRtPFxTRtcXT9XewWDN2JtPdZofXyZWdTrLSCS77V+rTRDMyj/TlL1eG9uKiR5PcPGaIe8zgHMNvgkfbkG1I8XTmDdO/ktQp17Zskbe+RL7I5OXENDihAY2gOjpTSWRr7Lg4YQMQSSb+HPEmnvEBqdFsyypeS+QJZ4tJWfMxfhq7dUUyvq5bc5FxCaSPnWgMxQV1RNwaaBNXdomEmAsgvrB1OHyJG0n8mo2n+0mw1A3H3eutZCSjhyY87MkGn1LZQif/7vyT3beuTfEwyxnOIuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5eb810-bae4-4c37-993b-08df1b6f7199
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 01:42:37.2817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0WpjJYMPUQvsIBDAgwh6HS3cQV+0rHxdm/lti0EuwYizRH8ENOWDu3eC2knQoKHj1jfHbUvTWJRHTz3oAP6Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7143
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

On Tue, Sep 22, 2026 at 10:08:02AM +0530, Himal Prasad Ghimiray wrote:
> Add an optional drm_gpusvm_ctx.devmem_fn, invoked for each device-memory
> allocation backing the range's faulted pages. It runs under the notifier
> lock and independently of the DMA map, so it also fires with no_dma_map.
> Adjacent pages of one allocation are coalesced, so the callback must be
> idempotent.
> 
> v2
> Reset last to NULL for non-devmem pages(Sashiko/Matt)
> 
> v3
> Run drm_gpusvm_pages_valid_unlocked() on the map_dma path even when
> devmem_fn is set, so an invalidated range's stale inline mapping is
> reset.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 105 ++++++++++++++++++++++++++---------
>  include/drm/drm_gpusvm.h     |   6 ++
>  2 files changed, 86 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index b6c9d3a07dc8..a37b26881b73 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1528,7 +1528,49 @@ static bool drm_gpusvm_pages_inlinable(struct drm_gpusvm_pages *svm_pages,
>  }
>  
>  /**
> - * drm_gpusvm_dma_map_pages() - DMA map one drm_gpusvm_pages instance
> + * drm_gpusvm_walk_devmem() - Invoke the devmem callback across faulted pages
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @pfns: The already-faulted pfn array (size @npages)
> + * @npages: Number of pages in the CPU range
> + * @ctx: GPU SVM context, with a non-NULL &drm_gpusvm_ctx.devmem_fn
> + *
> + * Invoke &drm_gpusvm_ctx.devmem_fn once per contiguous run of @pfns backed by
> + * the same device-memory allocation. Must be called under the notifier lock.
> + */
> +static void drm_gpusvm_walk_devmem(struct drm_gpusvm *gpusvm,
> +				   unsigned long *pfns,
> +				   unsigned long npages,
> +				   const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct drm_pagemap_devmem *last = NULL;
> +	unsigned int order = 0;
> +	unsigned long i;
> +
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	for (i = 0; i < npages; i += 1 << order) {
> +		struct page *page = hmm_pfn_to_page(pfns[i]);
> +		struct drm_pagemap_devmem *devmem;
> +
> +		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
> +
> +		if (!is_device_private_page(page) &&
> +		    !is_device_coherent_page(page)) {
> +			last = NULL;
> +			continue;
> +		}
> +
> +		devmem = drm_pagemap_page_to_devmem(page);
> +		if (devmem == last)
> +			continue;
> +
> +		last = devmem;
> +		ctx->devmem_fn(devmem);
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_dma_map_pages() - Walk and DMA map one drm_gpusvm_pages instance
>   * @gpusvm: Pointer to the GPU SVM structure
>   * @svm_pages: The SVM pages instance to populate with dma-addresses
>   * @pfns: The already-faulted pfn array (size @npages)
> @@ -1536,10 +1578,10 @@ static bool drm_gpusvm_pages_inlinable(struct drm_gpusvm_pages *svm_pages,
>   * @ctx: GPU SVM context
>   * @dma_dir: DMA data direction for the mappings
>   *
> - * Map the faulted @pfns into @svm_pages for DMA access through its owning
> - * drm_device. Must be called under the notifier lock and only for an instance
> - * without a live mapping. On failure this unwinds the partial mapping of this
> - * instance before returning.
> + * Walk the faulted @pfns and map them into @svm_pages for DMA access through
> + * its owning drm_device. Must be called under the notifier lock and only for
> + * an instance without a live mapping. On failure this unwinds the partial
> + * mapping of this instance before returning.
>   *
>   * Return: 0 on success, negative error code on failure.
>   */
> @@ -1774,9 +1816,20 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>  
>  	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>  
> -	if (map_dma &&
> -	    drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages, num_pages))
> -		goto set_seqno;
> +	/*
> +	 * drm_gpusvm_pages_valid_unlocked() also resets any instance whose
> +	 * mapping was invalidated, so it must run on the map_dma path even when
> +	 * devmem_fn suppresses the fast path; otherwise a stale inline mapping
> +	 * is later mistaken for a dma_addr array by drm_gpusvm_dma_map_pages().
> +	 */
> +	if (map_dma) {
> +		bool pages_valid = drm_gpusvm_pages_valid_unlocked(gpusvm,
> +								   svm_pages,
> +								   num_pages);
> +
> +		if (!ctx->devmem_fn && pages_valid)
> +			goto set_seqno;
> +	}
>  
>  	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
>  	if (!pfns)
> @@ -1829,28 +1882,30 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>  		goto retry;
>  	}
>  
> -	if (!map_dma)
> -		goto done_mapping;
> +	if (ctx->devmem_fn)
> +		drm_gpusvm_walk_devmem(gpusvm, pfns, npages, ctx);
>  
> -	for (p = 0; p < num_pages; ++p) {
> -		if (drm_gpusvm_pages_valid(gpusvm, &svm_pages[p]))
> -			continue;
> +	if (map_dma) {
> +		for (p = 0; p < num_pages; ++p) {
> +			if (drm_gpusvm_pages_valid(gpusvm, &svm_pages[p]))
> +				continue;
>  
> -		err = drm_gpusvm_dma_map_pages(gpusvm, &svm_pages[p], pfns,
> -					       npages, ctx, dma_dir);
> -		if (err) {
> -			/*
> -			 * The failing instance was unwound by the helper. Keep
> -			 * the ones mapped earlier: the -EAGAIN retry reuses
> -			 * them, and the driver unmaps every instance with the
> -			 * range on the other error paths.
> -			 */
> -			drm_gpusvm_notifier_unlock(gpusvm);
> -			goto err_free;
> +			err = drm_gpusvm_dma_map_pages(gpusvm, &svm_pages[p], pfns,
> +						       npages, ctx, dma_dir);
> +			if (err) {
> +				/*
> +				 * The failing instance was unwound by the
> +				 * helper. Keep the ones mapped earlier: the
> +				 * -EAGAIN retry reuses them, and the driver
> +				 * unmaps every instance with the range on the
> +				 * other error paths.
> +				 */
> +				drm_gpusvm_notifier_unlock(gpusvm);
> +				goto err_free;
> +			}
>  		}
>  	}
>  
> -done_mapping:
>  	drm_gpusvm_notifier_unlock(gpusvm);
>  	kvfree(pfns);
>  set_seqno:
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index 9e35584812fd..4d31c6bba745 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -274,6 +274,11 @@ struct drm_gpusvm {
>   *              pages as valid; the caller revalidates the snapshot itself, see
>   *              drm_gpusvm_get_pages(). @devmem_only is rejected and no page
>   *              type check is performed, so @allow_mixed has no effect.
> + * @devmem_fn: Optional callback invoked under the notifier lock, once per
> + *             contiguous run of pages backed by the same &drm_pagemap_devmem.
> + *             Must not sleep and must be idempotent, as a non-contiguous
> + *             allocation is reported more than once. Fires even with
> + *             @no_dma_map. May be NULL.
>   *
>   * Context that is DRM GPUSVM is operating in (i.e. user arguments).
>   */
> @@ -281,6 +286,7 @@ struct drm_gpusvm_ctx {
>  	void *device_private_page_owner;
>  	unsigned long check_pages_threshold;
>  	unsigned long timeslice_ms;
> +	void (*devmem_fn)(struct drm_pagemap_devmem *devmem);
>  	unsigned int in_notifier :1;
>  	unsigned int read_only :1;
>  	unsigned int devmem_possible :1;
> -- 
> 2.43.0
> 
