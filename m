Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A950CC2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 17:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB3D10E30C;
	Thu, 27 Jun 2024 17:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JomOP9tV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED4510E30C
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719511194; x=1751047194;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=irqF2kHP/YloAfMQczt7zCtTZn9hGylFc2eZGVLVMz4=;
 b=JomOP9tV0ExvkciVb7Juf8S6V+ePaPd+Rgflwpeb0xeVUXL4j8KczC8m
 EpiRnmeryNe55/+JYUrtJk2Zr/Bp2mWg+MP7YKLNGoY54wjqSIgU4UzUs
 PQdpTcCXLqvSBH2/MEBHawJRKX5VPOke0Di8cysJ89FFcdXTWmo8Fe0Wl
 WPH7YuSl9YH8BXpkDpRjFThCpRurInE/uIu6u+IfCtVzL23s5imY57Bv7
 +TeLOe0kH3Zho+nsL1f0jJOhS0aKJwS4M/zdRhaNK5kgSO9J/UHvW/fYS
 5JMQPSeSI1bxJI9oJ/2cLsBvWuKsut7J5Z4BnNXkyOA25t0vhhBJFUJG/ A==;
X-CSE-ConnectionGUID: kp5/+2igSwqKE44UR0kpGQ==
X-CSE-MsgGUID: Ek55ze91ST+o3Yl96FJAtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="42083200"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="42083200"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 10:59:53 -0700
X-CSE-ConnectionGUID: PwiW79nrRiK26x9wqPaJBg==
X-CSE-MsgGUID: 07ZemfhsSMyyeestg+wklA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="75665898"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 10:59:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 10:59:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 10:59:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 10:59:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlST8MDgjiLe6RU1DQ8JldWoG8yqQWK0ztFmaHD+IjLnSu0LmTLkut0Uh7hyK9WxivhTthWqLEAxlMzQTTED7fC/XfS76jvJkEFDAw6f14RedaN8diIz0IuWIyUY4YaLLcQC8iv5T+S53jgDUMPxTdFLjlQDvxWvkQHHO5h8Ttu+3mfPMSeoudsfh7+FwfIK6VOk00Rxcqzh8KKocdNul8caGZHf3iuDopzlzYYxMZayI/j/6rkq3edqybS5EVqQrWfHe14s7Jw4ObfRZ4JAP3BDFOq8NR7SJ+I2NoQrEzLm9CqKtylkZy8lD6d3BKd7i1N3qJfGGIoGb/eHVJCnPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faD7b/AeJ0ER0WZGSGInIH/G1RSzltBk+EMoosqyQc0=;
 b=NHCQZiT5prAIC1HIXI2Jm6tIxCZXU5VSp3IQJVsPWc/ETL0V3ugj0FizwBqwg+Pnke/QB3C87ihsVEE1X5jV5OeCPff4ni9bHooRRC9Hv05DA7ed/dcJo0LA+waxqV7yW+Edw9qpC9DGhRXHFOgpJcQknZzJOspu2pgof7dBgW4phBJvki4I6joGaA8tdg/Xrj3ctnZKyUvOvgWAFqUkV8OwEjK+MExxOBmxEocNcUlK++53O5JAVRV8zAz5Rg2Z8WsmG0nYCF5ROdrd7u2bE8fG+DRjqUI5pTOuqVm0qmbWt3yn7ubyjPRT9teThmRI0AcvRjTogVoW/yd4xGY1nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB6294.namprd11.prod.outlook.com (2603:10b6:8:96::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 17:59:50 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 17:59:49 +0000
Date: Thu, 27 Jun 2024 17:59:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 3/7] drm/xe: Add xe_exec_queue_last_fence_test_dep
Message-ID: <Zn2oajnReHlJH+6j@DUT025-TGLU.fm.intel.com>
References: <20240626211546.4099339-1-matthew.brost@intel.com>
 <20240626211546.4099339-4-matthew.brost@intel.com>
 <2434297e-bbf5-456a-886c-4abd9a1aed22@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2434297e-bbf5-456a-886c-4abd9a1aed22@intel.com>
X-ClientProxiedBy: SJ0PR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:334::11) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: 245b95c7-3451-4158-0316-08dc96d2f03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+Xx18NoTOefNCtDprR3H/BIAwtYnpWnODFIbdQl2sEpIp5is4SNbsNDh3ooW?=
 =?us-ascii?Q?DcRcjYC/lTIe5rXTUJDxJRybWd0Ze1HH6bZnUt+IDL8fvbhT640evG3THaBf?=
 =?us-ascii?Q?CP0Zd3c+3dzqq9gHfL5HGKLxTf7ty3aRByUc82OLKzugbKG+FuY8/LUHe0xp?=
 =?us-ascii?Q?8nZYuCajtQWqtlwhc6hD5yOU8960foA9VxdH2qdkj0v3ltVtRE8UE9AYFgwG?=
 =?us-ascii?Q?YZOE0fmPJeoERRGq7lXjoCIc89XLPLVK2gXOPnxRg53Ku50Gg9dMhxFBdMKz?=
 =?us-ascii?Q?hbuvBKxQNqu7N6VjCVnsHqWjHDvaxEwZcPdytJ6p5O0W/Pp+tajPYv6WOqg2?=
 =?us-ascii?Q?+1dLnIbnwD72/RQUw4o6d64VKNMm8rQ75PzT0KVuOCIs2+jPrxw0SUamBhWK?=
 =?us-ascii?Q?zocXJZfngeu5tyYzGxPf/+mtiJ3BKv0VWQZ++JJDsG5Mc6nB7u4mtg64xFfD?=
 =?us-ascii?Q?XiExcljPtoJKBnfV2p3Hv/TJBBlQ0h/M5xclrJ3LI16BtNt79TrM8gyUe0W1?=
 =?us-ascii?Q?iiK3mJuoRgs/nJHS50XpPBPZpwMx6TEtl929/UzaaVis1XiA21xc/VUReqHa?=
 =?us-ascii?Q?auVIFqRFESUtfEiStETcA3VElBTb/3pYK888q/fnlCva0qgoLNO5EQgNJjmo?=
 =?us-ascii?Q?x2GWcNREzFs28VaJImUlG+0i0Ns/nbZxUt3va6VEhYL8J3iYDNUH0QwubTwk?=
 =?us-ascii?Q?QPAc3iELLFrX1YtDR6aTp2Dt3PBP3IZOS4lOHKmxdmm5esQg5Gl1xcwT8Oky?=
 =?us-ascii?Q?DA61TjxGc4a1MdvYYUxEjD86n5Y7U9s1wHlXaBJs/0EJCem/dWBnp+Wo1ceD?=
 =?us-ascii?Q?EwYCBCFTYNYXBjScOWlSf5xFksppqgH8zCRZ3aFlf7IuH/4msqDvUiMxWb+Z?=
 =?us-ascii?Q?ZJu6+X5G67aKGXOPrsw306e6KLvZRKvS1lHPnu0Lk7SngodjUtbNS8uQuTaL?=
 =?us-ascii?Q?l7MNwVM7Y8Yfqf7eDOwC+AWozOvfyWZWNPDzdq6nR77uH82qgZvO0Plrr6fH?=
 =?us-ascii?Q?jP30VIes7c95dGaPOmnceZ4qyuSSSM+Bqq5fA5AOmWXEGsNE8qoyO0ZLrYQ/?=
 =?us-ascii?Q?aRVmU6CGEoOXhSIZReU0gX+UTHRv/MnyLlCwFRVQhi3swJW7Trpkn8XWgjsG?=
 =?us-ascii?Q?NWSvbsi2ofj+KXv/2DP1pXi3VUtMM12fza37G8WIS1MBqGxmF6lGk7x2JFjp?=
 =?us-ascii?Q?0jpZpH3kzflM6l/JqmlDVRJAeYAcInkEGzIjpAwC05lTYxLfOacBRz6amSri?=
 =?us-ascii?Q?U4glVjNlTdmsd7Ire6I35u58r032tuMHux+SkablFp2U0OvhuXDRqLm3R42n?=
 =?us-ascii?Q?3f9GOdGCTDLUv6l4tmQX7W5i7WcZOYQNJbK1C1IC8UHT+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gqs/lyCwK0q6b4iooJH8EO1bPXP6z5BgTMwk1lx8ZHdgq/LmDZ1bmYTOoBzI?=
 =?us-ascii?Q?tWyke2s5zQiJhgbonHE7O8OkiYTL1a3d7oxfioWQlOm7K6yL/o9AJ4W6d8tX?=
 =?us-ascii?Q?m7H8jGqSl6/WpmOfG2t9z5R0hQ0RZAh6CXwXNq9ze62FgiUi7g+4pXRSMAQ7?=
 =?us-ascii?Q?BDIJP6YWez3D5ZD8BuPrrlbA4kqsOsGoukt+GwbwI+ZQtHmXqHGanFo2Q8rA?=
 =?us-ascii?Q?H5Jxx8fHJSkZjVsKdon9I3B7k916t5zIPvlA/hQ8NaNM/wEfI9zvedQmioNd?=
 =?us-ascii?Q?VmQijL3v388zzFn3XSxiVQuVYPHg8H0iKdXz0YJ3WSQ2a98Ionou9dgXCw+t?=
 =?us-ascii?Q?NfTLlZt2uHLEMt/4oOweQyRyJ3NIO0GpeXKpn+7/v0twlhB3GKMdtgzqMEk8?=
 =?us-ascii?Q?srw4CFoH0vmZnmN7ZLtl/5KkBTtwabA+PBiWOEAkwNujWaXqH/5kzkLJGdH/?=
 =?us-ascii?Q?sTuZppwwXsc2xMpOGOXp9YqCi8L5bhX+WHbnLtL3wQ8hh1CcgogMK1mWdnD+?=
 =?us-ascii?Q?NZN2xb3zqjD9KWw8Jg0/lTr/wc/+pfUiRfyu8POik5cAXBJ0Vd22odz49gBN?=
 =?us-ascii?Q?YUWCHSUOTYsQJw3pCtU0e/sFnF0mVvENNqmiV1gWsnuy/OxAFKM/A+62imQP?=
 =?us-ascii?Q?Kuhc9PAtzQYmXmB8tty1PCAQHEHIuNyzXxnozB1UAS2Ae4Jxg6MT5CaqbH1W?=
 =?us-ascii?Q?A01KYM/IfDcoQadz6IFuVztm+JIn/p/ocPjNbndn2xs/zS52hplasM/wwROm?=
 =?us-ascii?Q?rSpGO1GbuDJ1PorTQRSU3ssceBjpgbNgT4WuTGAO07Muven3QAO0zXX17zhc?=
 =?us-ascii?Q?Q5BzXMjjtFrsAznJgiQKHUHCfS8K5ElOb816huVaq0uFBbzLZOj2AMUCBK60?=
 =?us-ascii?Q?Uj+rRLsF1USyeHqetHU7yzIYzqa06tnpr0Jb2jjfSLsFAH+AaiZRB6It6+3z?=
 =?us-ascii?Q?wwdSBRFy/1M/eWrKvcRkCQNMqjYpvRuxRmrOUkSno7zFsKPw/O/nb5WmxoiY?=
 =?us-ascii?Q?X4RoqnxZ347l7No+y9PmLiMPaxYQ83GIUgmP2rZ/R24vD2IeuJ8BSqz5SXR6?=
 =?us-ascii?Q?llOPLMb87u2ZGSn2tbGlGoeRNK/mL0bGDibEDA+8PX7lk9rZIS7dNPN9JKU1?=
 =?us-ascii?Q?+2R3KqvMQ0l4UPL6n5bLNxOgTj4jApUFGorvqynNjcE3caENQ/FqoVFvaBbx?=
 =?us-ascii?Q?3egQoBk6wuIHmRh0nCAoGkKMNwdHaozcfOZilAfL0A1gFMfNDwOXJHQex3Sr?=
 =?us-ascii?Q?iTD6x3Xz45HzfwxUjqNJQG9hNwSI52ac7v0MIlubx/rDfVkvqhrMm68KBgk8?=
 =?us-ascii?Q?u0x3EROdCYlhKyEdFdza0GpXiWMJtgdx3K28FtRZpVsi3ZA4ZBYprs34aMMu?=
 =?us-ascii?Q?uZTP8XNRKKsyaiWmyXP2AjR5+A1q/4WSxP3Sm4e9TfBYeJLoyLTuuSSS5fCk?=
 =?us-ascii?Q?L/h8rEk55VBG+O0xfUKsyuNTJwbljYK0eUD/mTpC1iGDJ0+gB183QcVfMDgB?=
 =?us-ascii?Q?jMhtWXqMYU3p+TbEeXq1h2RwzcA2UbHo3+gkd3YuklNeFyt2UER5ryUBSJtd?=
 =?us-ascii?Q?5uZq7CGDTMiIxBiLj8khY5ds239SptpTP/4zBsGsblwZh/03OdtEgKzEYUJF?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 245b95c7-3451-4158-0316-08dc96d2f03f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 17:59:49.8701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5a+aBhlOl/pFeZ//AIpiygQqkaK8qLp7xFwxOP/3BVDg+iaiUnuFoUkwiXaDpwCF4TfeOFGq6bm/9GunderxZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6294
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

On Thu, Jun 27, 2024 at 05:36:42PM +0100, Matthew Auld wrote:
> On 26/06/2024 22:15, Matthew Brost wrote:
> > Helpful to determine if a bind can immediately use CPU or needs to be
> > deferred a drm scheduler job.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec_queue.c | 23 +++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
> >   2 files changed, 25 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 0ba37835849b..65b4d1da6c93 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -906,3 +906,26 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
> >   	xe_exec_queue_last_fence_put(q, vm);
> >   	q->last_fence = dma_fence_get(fence);
> >   }
> > +
> > +/**
> > + * xe_exec_queue_last_fence_test_dep - Test last fence dependency of queue
> > + * @q: The exec queue
> > + * @vm: The VM the engine does a bind or exec for
> > + *
> > + * Returns:
> > + * 0 on success on dependency, -ETIME on dependency
> 
> Could maybe improve the wording here?
> 
> "-ETIME if there exists an unsignalled last fence dependency, zero
> otherwise."
> 

Will fix upon merge or in next rev if one is required.

Matt

> ?
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > + */
> > +int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
> > +{
> > +	struct dma_fence *fence;
> > +	int err = 0;
> > +
> > +	fence = xe_exec_queue_last_fence_get(q, vm);
> > +	if (fence) {
> > +		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
> > +			0 : -ETIME;
> > +		dma_fence_put(fence);
> > +	}
> > +
> > +	return err;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > index 289a3a51d2a2..ded77b0f3b90 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > @@ -75,6 +75,8 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
> >   					       struct xe_vm *vm);
> >   void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
> >   				  struct dma_fence *fence);
> > +int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> > +				      struct xe_vm *vm);
> >   void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
> >   #endif
