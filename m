Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C14ECEACCC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 22:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5370D10EB38;
	Fri, 14 Nov 2025 22:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvHPzA6u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4430610EB38
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 22:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763158529; x=1794694529;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OU50tNRBySI4q9nUVtIszDdDkWo33vdvIXW3dg8JDjE=;
 b=LvHPzA6uj4n0guhHvNgNmj12KMRYO+7mTklZvY6oVYwX3Xm+/YtepzzI
 +gUkAHldQdL/9JnYPDONDKiA1AleShHPrPmf9P/0F15DtvR+BlpbbjERN
 17Ucj98Fj95D+9tgci9D4pLcBLz1pAc7pfTlE+et8+i+QWetxs7Hvqzmb
 mrZ1ZVR0PCTgKpuw6NyVU5SSEVETqVcBFaNam9rJx2yHzzOFy/AOYWlKj
 45zVKpkMNiNLATN0KhPs+suejl5zH/TaNDU0MJycQ58nJsQi8PpKTP0V0
 YxBjqaY65AAMhwDP/+mRNuA1tpqVjAi8D+dSvbTGyOhdu7UbmXlv1IXD6 w==;
X-CSE-ConnectionGUID: vP8rGNkWRxyqa1/J+appkg==
X-CSE-MsgGUID: +4R2kYaeRYK2rjHuOg+RJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="67864482"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="67864482"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 14:15:29 -0800
X-CSE-ConnectionGUID: aVdX+SfVRpy6x7ju7dqlmg==
X-CSE-MsgGUID: uM90iDLUSv2w7WndHtdOVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="189699818"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 14:15:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 14:15:28 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 14:15:28 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 14:15:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMpse1NTig4lQZUsvLwIzzAGEyrwS9u0X8PV3N0CeVNZcIZrLf4pvw5uSAOiUiaxFBMvUc7QedwZvQH4dqDBl7dGGYlsyTuf0AwT7fnaNLuERnDwT95KBHdWiYp8edrNnvYV5gSlvn94waQMxmgZndMsWwmlcjoG5rh8eh7cza3PBrOz5108s3i+Zc7X6quI5HXaSrurl5pzQ/G3kkaoOp2fUDPhJId5ulQGYAy1tHbcmbDaI9jKpcbtaodDe+pAkSLAHuvQJ4Gjb+P6zl2oTfzroUClHnaraX1SkKZHNBM2Xc4XbmJjbZjuhf2pXs+/hESG9XpvgZQ7o+Ee1dcNng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VIub4i0MsOau/K6xj0kuGyvAvZofDylgLmAAvgWLws=;
 b=OuD7RQYgMUltKQOKedwf5gObAKEsimKxuWtGrUOddAKgvnSBlPivHgvNaVd1yUPe4eu+3lw3gfSgmTazTq+S8NRXSem6g/bv8H9Vvr8S1zqlW92zCUd5ISX/GWi8ygYKtcUZJbcZp9gDLR8IkEeSSwHD/mizfi1053kpSj6SzHdJYfi8UCtmOzItjmGnoDlcrzOeev2qUrpemU7YEUNtjuSlac5y3MEBru96Q3mNWoYVDGBSqMRLE5ozkdQPZ02kKsvYSK9u21zYgftUNVdV3piadyhjYHZw+psjBhJrJo15k/Du2vynZwFBKTHtAsLjYBl6socHOXuat0maNC52tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 14 Nov
 2025 22:15:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 22:15:24 +0000
Date: Fri, 14 Nov 2025 14:15:21 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <shuicheng.lin@intel.com>,
 <alex.zuo@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v2] drm/xe: expose PAT software table via debugfs
Message-ID: <20251114221521.GU3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251114191355.211862-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251114191355.211862-1-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aaae3ba-6c23-43b7-002f-08de23cb4ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r9lgIDeaCboe8Wsb+IC+USZTxfQ5utaXGNlVelK1wfBahxZarIUfyEXaWSVV?=
 =?us-ascii?Q?zJPXeTqmrb2GsY/bBYXxLPFUT1ErZc+wu61gBVTqXBz2NarQgza6WBdz67CY?=
 =?us-ascii?Q?6A230A1gJAUCKRvtjC6valbKMQ0sauJuUgdGbZP6AChdkOHp0y0HQKxTiJ5e?=
 =?us-ascii?Q?Wvam+lGOCbjV+6oJC0i2oXzCV/kB6BIIeUD3AKjmnh+S2sV4Z7c1wF6NklD5?=
 =?us-ascii?Q?GL34HtdpU54zSXN3e2o7gBJdkK3sp6ioCT5Hk1ISSh5k1GBOkW1A7R21eW0D?=
 =?us-ascii?Q?Pksx9XJS74FmwwplU4j4peTDlTSA3GqeSGF0DncDaQHrOZ+7TGrJjZiDIhE8?=
 =?us-ascii?Q?v7Q8t2yOcD/PJck9F+mOrgjPNnHh77aYtHhkQs+ZYdJmXSBt1MJv6rXi4WNF?=
 =?us-ascii?Q?pTBWcSu9nbXeG2n7fcF+dNPgV9SK0kf0AvF4Y8uctojbBEvEodp+U3M5FU9n?=
 =?us-ascii?Q?P02kotUWiCD7+YojnSwO5V2zTkFng5t/tnWRz4ChJuprgiIT05e/mfSpNb6w?=
 =?us-ascii?Q?wrJgwe2GaA/di/iHqB8Y0yI2JC2Kd+hjW4Ml5xePtPiFJrT0WC+SPds8PpDu?=
 =?us-ascii?Q?4luJUwXRVn21xjR6vIpG9T1ObS6MfIrbm8Auh8sX8DnTlCNowTLDE0haQcXA?=
 =?us-ascii?Q?iZOckhSuB59aRixHc7GC04q3tsIt72wc586fbwnBtZNybVppJh53O+bT7LoH?=
 =?us-ascii?Q?S+C9ld08Int+h9kLFvjGidDgmRqpUpqhKxgMybJSZI4/YP1dTUIBYp8MR8KV?=
 =?us-ascii?Q?03xWmihXmgdlfiCj+osKgcXCvR/GUvMFbs8ciPt5CTq7gDhb6bUiOhmy2X+l?=
 =?us-ascii?Q?rGUeWmbMDcuQAWpST3MT0xVjl6o5aR9p8yUzy1U54QT1m1G3obiVI4KhIViz?=
 =?us-ascii?Q?CyKfIrXCoPcWOSfoeA048AINdm7eFTNNnXVnMNubpDMNYgCVhEq6wBQDsXrX?=
 =?us-ascii?Q?XaOszToG8xmr37Tg4+ShqHVanITFslakscYwfsa2jPIEzKqC4gsUVxgfVzi2?=
 =?us-ascii?Q?MMctEyBejBwF+VA/YECYBW7a7O0nB7vxsrd57oRpyImE8THPm2knhhoD49Ir?=
 =?us-ascii?Q?V96jrNgU+TjV+6v+iftqzCD6qtXeW1JcDUW/8O+uJTEh5Z0q1BmC+HPz6iqK?=
 =?us-ascii?Q?B2eUVFDpTGt694yXBE9+badfi5d9fdkH+9tjifcrVm3EMN+xHDM3jrsm8Llv?=
 =?us-ascii?Q?dRle4mZjeT7VCoRwPLoT9a6dFndIm94ZEQXmjdR6uFPiVXvN5Sp1Yw4h3g4C?=
 =?us-ascii?Q?Pe/7WIBKl4+fNiMzmloVoIsdMVIkKD6bz1tuC2bOLB/bJ/mm42S/VYrnLX27?=
 =?us-ascii?Q?f9zFX5dMF89vE/Mp5650/tzBbqWmNlkMuEZozhbz2gLxJMaeMtz7ruhsymgv?=
 =?us-ascii?Q?F0rFGCnd9Fd9lk9OwpC4qNX4E2lhvqbPjoBl+q6JW16stH5Vt+5+i5rud4Uq?=
 =?us-ascii?Q?nEDXdmPJNyuqim3A5JIB+Z89DBqbs96+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AsLPPJ58IhqwSPZ9UYhZJgc0kGowyb7/R4VKJetHHJGnlzHqtv8mekf/B7UT?=
 =?us-ascii?Q?0XdUSLUjLaJZmDDD7U0JmEPjyawS/awZBAdj744txd5NTlwphCzbJ20Zaal1?=
 =?us-ascii?Q?7VaZMWxM/4LJAVthrdCN5aC3G6LZzzycB+d+dWaLc+LtF5o+1gphsCVTwL7e?=
 =?us-ascii?Q?3bucvIb9f01bKHoaeKgIKuZqIqpZCauWnmYf8UJJRUvCiFhMY+zFs7cFN09I?=
 =?us-ascii?Q?Bh30mnOItFIqb8ILR+h1NszKYguPN2TzxcnoZeIUbh9lPnNXjyYJcVhuW+/L?=
 =?us-ascii?Q?XRR6yKTPNnzbvENaWkz5l+TwesgqUito7j4xv8he+0N+GJV1EUibTdblFFvV?=
 =?us-ascii?Q?kZILSshS51ccDQhmtLYt0UTqJ73eQIkSaOk9cJ/FWmqKasRsZuc19dFhqJOm?=
 =?us-ascii?Q?mdVV7E4xmXdRKqqlmfAWrmw53r39rw20yoxYlDxZKp4d1LD/DyxClh1ua45Y?=
 =?us-ascii?Q?l0dpXr1UGeDvlDZ3aQgsYvVPdgrGMFtQJgHAIi6xSOnwO5wBG14MyAp+N2BK?=
 =?us-ascii?Q?5hvE5ElQe4F1RebUNjs+ehw9NeFt5iFDpXur9dCsWSk7pcTyS4oq+s4NnY+u?=
 =?us-ascii?Q?J9HUYXYi03its2BYj//41NIEFSlmg3nUiGuW3LQPyB6nREr+tFl5litiVe6H?=
 =?us-ascii?Q?2Zqk6NGDfVzZ3tMgsVKAtn0t7smooHRQdvs+MKGsSiYANLZ0byeWNiWo/LBA?=
 =?us-ascii?Q?wQxfzwRbH8xJH5PwLXKm5MZtDC8PCqpcvdZ9rNAkAK1dgAPHxTBjxzgeeVsw?=
 =?us-ascii?Q?dK/hSvFiEtvCt9TX65DN1ILLQn7gYwUSZT4btzlZBr8C8GXNFb7Dtdt1wFbE?=
 =?us-ascii?Q?//vduYn/H2wN1a66DoxYvTQWmb7GQswx2Nq/fiiNtnbaLxnx/Ad3EIiuxVOl?=
 =?us-ascii?Q?TkZK+a37+XDMmx2HjePOgh1QQCPCtSvITYf8g5ATO/C0/pu3ij241hhWotfZ?=
 =?us-ascii?Q?DVv2D4G0DZASBPfyvwfNbIELFvuGZD5XKnQORiGH29lKtqsVMmruhKD62Ler?=
 =?us-ascii?Q?sNYG6vfL6vYDwYeMg6bkB8oIkH06nbhNXQPZd7t74cC03Ex/0s8Hi9F7n4vz?=
 =?us-ascii?Q?2OdiUM0SmWCPhmTbsx0U4A8IBaqcZenSpvkhS7KHoOBiTwDEnfJ35BmNOFRP?=
 =?us-ascii?Q?OKjUBPn7JeEsQa10RtCB6Oc/DTozyYiz3ukxadErl5skYrAkGVfAMig34Gwz?=
 =?us-ascii?Q?hwbZ9lracfUtEHsqYPVJPTPoILx/5x7hulXReywn3r/3qiv4aMb+yARCQ9K3?=
 =?us-ascii?Q?TmTlfQvDqhcZvmMubMWFaVWNoGzxCEjG0hyTyVewNSygmnPN2n+12mP/+ddn?=
 =?us-ascii?Q?MTTRkc5VXtQ0ovNH+5DwIz+oy+GbO79EhvYFOLIfY/EEfwUrf3cuoqWAg5lg?=
 =?us-ascii?Q?2pbZWMlZTnSq+7f7BraxFh8FHGSjZA7sLOlEHhiTlTuUcnecSSxAwMLxgDpT?=
 =?us-ascii?Q?vRiueOb3Yztah6k4diSh1l1XQ1RfamfCO26mXQRFvdkyr4WvlMuN46f6RHA4?=
 =?us-ascii?Q?yvmUUGqI4KGjy8im8d26DlxD/W+AfCyQgIWKu3VGBJ8/esqWPygKnYeJkEer?=
 =?us-ascii?Q?4Zo8oWt0gFkIT5z7HkVS+PiOLWqiIcSM3stvJW/mIxTIgi+FYY4hAIpjmkSn?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aaae3ba-6c23-43b7-002f-08de23cb4ef6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 22:15:24.5082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pc4mf1IakwLt2TDB5zfAb1x/AYDaJ8nNl389MclJIF9WZlQNXkpEvS3WDDLpcwfcobBHswJR4tDaLev7VMco2sR7qaajZjA1C7c4B/SMIVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7539
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

On Fri, Nov 14, 2025 at 07:13:55PM +0000, Xin Wang wrote:
> The existing "pat" debugfs node dumps the live PAT registers. Under SR-IOV
> the VF cannot touch those registers, so the file vanishes and users lose
> all PAT visibility. Add a VF-safe "pat_sw_config" entry to the VF-safe
> debugfs list. It prints the cached PAT table the driver programmed, rather
> than poking HW, so PF and VF instances present the same view.
> 
> This lets IGT and other tools query the PAT configuration without carrying
> platform-specific tables or mirroring kernel logic.
> 
> v2: (Jonathan)
> - Only append "(* = reserved entry)" to the PAT table header on Xe2+
> platforms where it actually applies.
> - Deduplicate the PTA/ATS mode printing by introducing the small
> drm_printf_pat_mode() helper macro.
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  1 +
>  drivers/gpu/drm/xe/xe_pat.c        | 87 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pat.h        |  1 +
>  3 files changed, 89 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index e4fd632f43cf..ec279f005b10 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -220,6 +220,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{ "default_lrc_vcs", .show = xe_gt_debugfs_show_with_rpm, .data = vcs_default_lrc },
>  	{ "default_lrc_vecs", .show = xe_gt_debugfs_show_with_rpm, .data = vecs_default_lrc },
>  	{ "hwconfig", .show = xe_gt_debugfs_show_with_rpm, .data = hwconfig },
> +	{ "pat_sw_config", .show = xe_gt_debugfs_simple_show, .data = xe_pat_dump_sw_config },
>  };
>  
>  /* everything else should be added here */
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 68171cceea18..7bb18f5d9b98 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -578,3 +578,90 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	return xe->pat.ops->dump(gt, p);
>  }
> +
> +#define drm_printf_pat_mode(p, name, pat) \
> +	{ \
> +		drm_printf(p, name "= [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n", \
> +		   !!(pat & XE2_NO_PROMOTE), \
> +		   !!(pat & XE2_COMP_EN), \
> +		   REG_FIELD_GET(XE2_L3_CLOS, pat), \
> +		   REG_FIELD_GET(XE2_L3_POLICY, pat), \
> +		   REG_FIELD_GET(XE2_L4_POLICY, pat), \
> +		   REG_FIELD_GET(XE2_COH_MODE, pat), \
> +		   pat); \
> +	}
> +/**
> + * xe_pat_dump_sw_config() - Dump the software-configured GT PAT table into a drm printer.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!xe->pat.table || !xe->pat.n_entries)
> +		return -EOPNOTSUPP;
> +
> +	drm_printf(p, "PAT table:%s\n", GRAPHICS_VER(xe) >= 20 ? " (* = reserved entry)" : "");
> +	for (u32 i = 0; i < xe->pat.n_entries; i++) {
> +		u32 pat = xe->pat.table[i].value;
> +
> +		if (GRAPHICS_VER(xe) >= 20) {
> +			drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
> +				   !!(pat & XE2_NO_PROMOTE),
> +				   !!(pat & XE2_COMP_EN),
> +				   REG_FIELD_GET(XE2_L3_CLOS, pat),
> +				   REG_FIELD_GET(XE2_L3_POLICY, pat),
> +				   REG_FIELD_GET(XE2_L4_POLICY, pat),
> +				   REG_FIELD_GET(XE2_COH_MODE, pat),
> +				   pat, xe->pat.table[i].valid ? "" : " *");
> +		} else if (xe->info.platform == XE_METEORLAKE) {
> +			drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", i,
> +				   REG_FIELD_GET(XELPG_L4_POLICY_MASK, pat),
> +				   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
> +		} else if (xe->info.platform == XE_PVC) {
> +			drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", i,
> +				   REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat),
> +				   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
> +		} else if (xe->info.platform == XE_DG2) {
> +			u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> +
> +			drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
> +				   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
> +		} else if (GRAPHICS_VERx100(xe) <= 1210) {
> +			u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> +
> +			drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
> +				   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
> +		} else {
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	if (xe->pat.pat_pta) {
> +		u32 pat = xe->pat.pat_pta->value;
> +
> +		drm_printf(p, "Page Table Access:\n");
> +		drm_printf_pat_mode(p, "PTA_MODE", pat);
> +	}
> +
> +	if (xe->pat.pat_ats) {
> +		u32 pat = xe->pat.pat_ats->value;
> +
> +		drm_printf(p, "PCIe ATS response:\n");
> +		drm_printf_pat_mode(p, "ATS_MODE", pat);
> +	}
> +
> +	drm_printf(p, "Cache Level:\n");
> +	drm_printf(p, "IDX[XE_CACHE_NONE] = %d\n", xe->pat.idx[XE_CACHE_NONE]);
> +	drm_printf(p, "IDX[XE_CACHE_WT] = %d\n", xe->pat.idx[XE_CACHE_WT]);
> +	drm_printf(p, "IDX[XE_CACHE_WB] = %d\n", xe->pat.idx[XE_CACHE_WB]);
> +	if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {

We should probably just print this unconditionally (or at least for
everything Xe2 and beyond).  At the moment we only assign a value for 20
and 30, but the code elsewhere in the driver that _uses_ the value is
only checking for >= 20 (plus other conditions like compression, which
are what prevent it from being used on Xe3p_XPC specifically).  In the
future when we have more IP versions, we don't want to have to remember
to come back and update the condition here.  The value might not
actually be relevant or get used on some platforms (the same is true for
WT), but even when we don't assign something, there is an implicit value
of 0 in our software structures which could get used [accidentally]
elsewhere in the driver, so it's still worth printing out for debugging
purposes.


Matt

> +		drm_printf(p, "IDX[XE_CACHE_NONE_COMPRESSION] = %d\n",
> +			   xe->pat.idx[XE_CACHE_NONE_COMPRESSION]);
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 05dae03a5f54..4a3045f74bfe 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -49,6 +49,7 @@ void xe_pat_init_early(struct xe_device *xe);
>  void xe_pat_init(struct xe_gt *gt);
>  
>  int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
> +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
>  
>  /**
>   * xe_pat_index_get_coh_mode - Extract the coherency mode for the given
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
