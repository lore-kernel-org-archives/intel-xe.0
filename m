Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B48CA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 14:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A841710EC73;
	Fri, 12 Sep 2025 14:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJ5BkoFH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D5810EC73
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 14:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757687121; x=1789223121;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Nwpv4hPikK+VWwL8ROYsqv6mvgFNesBUET80JrRwJD8=;
 b=kJ5BkoFHXrUAMR7o+0/vMD775ckopzCUodQqJF4u9XQI/h7YXUPsauWW
 evsm93+yl8s2LEa5R8Y+JO/e7wJTgGdKWIQl9Hcqxz8siJm89UA0F9Wpr
 1RUJdHgwuCm6xiLzKc4fB6Ty7Vv5A6GyTaWPp1sFXBH9Am7UuBH/7MYaZ
 KgD8za18LLfNtO8FJ8MMeTco+VH1jdVetvfw3/aJbDAkiafaCMkVb12jh
 l8oMavbrUMIUaXDdjgjcE5eMFlOURtmOFd2DjqwhgbxFOWR6Wrsd5tE9M
 7rjupmBlx4rQ3EdArRGJFKK/ozp0G9drPj8Aa6QxP/K5jTt3UB5R8XB/o A==;
X-CSE-ConnectionGUID: yWKHdSPqTGqp941aXRi84w==
X-CSE-MsgGUID: 69lEKgUVQIu3bFzfM2ueNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="71461807"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="71461807"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 07:25:21 -0700
X-CSE-ConnectionGUID: 7ucIF5+iTq+7MIVH0uM+WA==
X-CSE-MsgGUID: +xL218EqT0WSBKaHPV+xlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173892308"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 07:25:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 07:25:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 07:25:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 07:25:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofpcN03BVo4VvajIHDhVqYf5oFjEaCFuBIu9eAfki+W1gAxji6jKzRQAQOwZeY7G/pyc1NMh02N/hwciG4ZG/s8Uq2QH6HirAZfkM84I0ee1iSrSsXZ7GuEK9rGPxcCfrHTvkoCwLcjjYjGowUyeMUgc1OGU026eYOeECgbo2UsfZuFIGSAZ4oMsoPq4UTIEorVIDrirYwKGRY+FiDl+VgjfLh7hLK4aU++RzWKpN9muBDyP+qCT7T2P7Hg+Gb/wHz7BiEW9b3Mix3CjdGJMK+aiRc1IB24eIdzzILku81laeuYnI0W3Z68+PwOZt9BJd8fBwda/Hu6qIVUfNib1ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UONY2gcDm1IqYxmZrfdPrNhFJZdt7HHC96pzmIM/CM=;
 b=rKgxDKwvze6pTCwokWcEp8y8AUo2B9T0nDYo7EVHFA4slCcQj8/ya47a8GySaMifmQg2g7ShF4e2ucmshJEXjjdTWQWqrHQLYbgP5ySkSusBDlhvMLvkkRgM1szFxBCIzXXBYYAjOZ45hq6OwwcLDDOdyY0NgaPeRrN7RgavRBzTdjrRlrVVrShGVY43MByV4QdNeHtCgAL2nnw3QzjiVVrZHsS/RoiaC2zI5LlQbKU9Lycrh8TUQB4s7UKpfY9zUelY8WZHxHyNnvdaTW6XohcThB+z6M97GAX4p9vGHGd45O6uXI2OEqSQ7+EibWFNEl5ZFTIvqMfTV7vXQAVQvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB6520.namprd11.prod.outlook.com (2603:10b6:8:d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 14:25:17 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.018; Fri, 12 Sep 2025
 14:25:16 +0000
Date: Fri, 12 Sep 2025 10:25:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v11 04/13] drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs
 platforms
Message-ID: <aMQtSUmO3WZC8vWz@intel.com>
References: <20250821141458.72876-1-tvrtko.ursulin@igalia.com>
 <20250821141458.72876-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250821141458.72876-5-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR05CA0126.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: de6b2c33-bbe1-4a58-d8e9-08ddf20831a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CvvUvyKVXKYhcMJpGoyKY1rkpPtSon4vU8EvfnODJX8wC/Wr7Fh2N6ITzELT?=
 =?us-ascii?Q?JGsB9XwF6JfFoaZhhZxnoQ6fF32mCgUWrNn+nQZr8SJrTSYWybiSngBZOP4D?=
 =?us-ascii?Q?BY1g59wc6J6BUeqp57LQqu3oqgwuC6ruudrw1KPD4FJM5E8liAbu0ZpCSEZe?=
 =?us-ascii?Q?ba6NhBJ5+k7RGD/jml9PATkOgHEnFmDnWzNRu+o7wypQc2gXTym7aMSuNrhO?=
 =?us-ascii?Q?FY6I/FIfuUdtldIVMZL11j++I29C8BcK5tcRqqp3Ii4b88PUaXYjWlxMeA7B?=
 =?us-ascii?Q?uNqM4MSiFCMeRsVsfbrAzExiLl4Q84mTats920CEoavdqlX8MVHvNCHm60Le?=
 =?us-ascii?Q?MIXv1FvsMWCNleEIgvmBgDMCGFGttmjPNIkTO11unNaFutemLsIO+zvq1yY6?=
 =?us-ascii?Q?wSoWHkon1bREoOoAHGM3PzQlXMq6AlujSLKOMlbDuzLLQqXSzWF+tx5oPbEO?=
 =?us-ascii?Q?LVCNxSvltz4zjOrBL7wOYMGPPI43qqoE+NE9Jw+2ZQTMPLdEcIFdWeiaIbyN?=
 =?us-ascii?Q?uBga1gjHbUGaS9M7vPOYSAWQK0NSuU4eMUkEZo/Q6J6gQp/Kz+3K/4Wszfyh?=
 =?us-ascii?Q?h/06qnS6ZiaOIBz466ovKOkogC0Gszx6vO9Cw7vorVnQfy6kcsG7Cqt1gWAk?=
 =?us-ascii?Q?NwJtPlDkeXA0T8I8Fsk4aygVM4MD2pw4K0q4eecXYfmcZRzCwT/oFh/23weW?=
 =?us-ascii?Q?BhbaMtr75r6ZAsqMd66iQA3MfbzLBvO7JNd0fao6DkGNfm34gED8p8A2GE96?=
 =?us-ascii?Q?Fh6l9N1yBr2vFIc2/M3rqqCekEiWU4bC/spMztj6uk+m2Gndjs2rmrcKb4LS?=
 =?us-ascii?Q?4jcju/9diwxpsj9KBq1+frmYLn4DQb3QQK+zn5GUkJ2H9MnZRKhkaTGhNrxp?=
 =?us-ascii?Q?d+7IoD6S4Eq27pvYtQL4gt9w5LGLXxUd5nzBy+OD5JmeyoiX60n5PHUBIfaw?=
 =?us-ascii?Q?P9sXZat7w6yI5OEeQM59vpt3M3/vI/1etoa7rc8wQMwRUni1rRL64CE09Ae7?=
 =?us-ascii?Q?na87Cl/mfV3QTr+72DEx+RZ0PisCU7Vl/KLzHv/W+wVkswSvGrD7s49O2XT7?=
 =?us-ascii?Q?9rxWFub8qfkx3qjssEjE+I25f6+Oxjp1yXTiss4CHswxoFjpfVCDw+jQ6uUR?=
 =?us-ascii?Q?Za7z1mdQlqt+YD0jyNVbVCrlz82EENggEwRuj4xEXWfFEuppJlVHiHhArgEu?=
 =?us-ascii?Q?4zzgGNfSayXF4gRj3OdyvyHX3p/f0U8ItCsZHpYjAIeWA59pAKJiFR6BLiSo?=
 =?us-ascii?Q?8CP8PwT/K3HXjTkVuEKSj1UTh/YRUwU9HYXNwz9MxO0LXZwPYuyvpCkUq+Ac?=
 =?us-ascii?Q?IT3oECX7RNjhVncQaI6GbjKFo4hVcgNTCZjoncGdg4/2/iGS61Qv/LdtHsYN?=
 =?us-ascii?Q?1yR4N7Zrz9HCt4VrjpaklpfuCgCc1+43QXOwS17zuI901poCWX9gRKZ3Mgnn?=
 =?us-ascii?Q?vLLqNJnSx54=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gfNtUmXG/GVdJUh+NFGNfynuL+dYIPnFG2eDJM4UDmWZF/VSd0Ns3sP8S6DY?=
 =?us-ascii?Q?bB5Jri8PTS2faLU4nOzgOw0UgvQ9IVD/uYB+rYKFZI+/nuVDtckr/FHzaFTm?=
 =?us-ascii?Q?5V4KzK8qq99OTOA/f0XUXPWyAgDZYNwnUXrrU7PXRJTv+PYQaPglo2rFjRyn?=
 =?us-ascii?Q?/ZCZLKWj5vFcpNHS+61oaiv/ka89D/HjgrbqfOltfIOreeI5NceuWLrkTq2D?=
 =?us-ascii?Q?cX3gWdjJ+YO6jj6LgAqa1YXn31HUulRTRrhb11tnMiIm8Ze2bcFSciUTm569?=
 =?us-ascii?Q?KiPtgZSSt1HQVi8HgN2Mxv1jb4HqkPZq+x5cEWY+te1N0ZV0dY4WJ95B54xL?=
 =?us-ascii?Q?f6388bKtgFi8fos4BqdPBEhoyfttObGz68ADY3fa9VIwp6RkyUZtdtIgnBtr?=
 =?us-ascii?Q?/H0Ig8czMiopGpRPGgTLUsETxYhCM1Ce5YxVAWXg6DXOKaYQ0ImdT5OkmsBf?=
 =?us-ascii?Q?ht8VlMNlwhJ8A75gm8fy4gohjzzH6p7GsuicZycNXIk5qV8yF0k5fe9yvNxs?=
 =?us-ascii?Q?//83QLHfVSWZ5A/Ge23S0wKxVBzFjvv7V7iYmdgNqNls03tPTK2+X7PC4nX0?=
 =?us-ascii?Q?N3UaB0Pp4WDOcCxn3S6UV0h9qrHYkOlRdK9/9u7vOHPB355mzGJjTwpU3rca?=
 =?us-ascii?Q?GW7VrCLw56IVbd9yiA6uHeWmUFqac7cE4Law8BhlboQnHcCJDj/l4nBXX5eS?=
 =?us-ascii?Q?5pykUYwBrj9oOeluHadhvljO7g4zA6X3O7FDyL2dMpbPc3EQdJamfudmIKDU?=
 =?us-ascii?Q?PnwUi7VTRhQTtxe/y0W3M3QtHUyhrJJDs4Jud/+of1cdODsDHkrmllf5cK0I?=
 =?us-ascii?Q?Z0CQFyQ9V90bbDhy8862RSHxUJcaH95xhVW0Hw7il9Sr8M2xjL8xYyLItbWk?=
 =?us-ascii?Q?BxAk7GAiQT+JHWVTgZd1g9oYDqIQSJ7tcIqiM3F8WR/oIG0V6RUxgxa2o3+j?=
 =?us-ascii?Q?d3sNeM6jCDFBg7KimIjXv8rpAP3heifBWxFow9E5XXuXri58iP02+JHxE3wU?=
 =?us-ascii?Q?W42a6qveJLO607wofKhnccFoHq+oO61I2n9pLidEbf+bzFJBiRQ9k4UHWGhF?=
 =?us-ascii?Q?sd/jFXWRO3gArWau2haf4wisJjd0ET/zsukIYj8/hUneOTvLtJPQxlXzovcT?=
 =?us-ascii?Q?EN/MYi/WukYndTat2nFlIftdSeyoBNAJerDMbujdmActClQX1/JCYWnl9JaL?=
 =?us-ascii?Q?dw7mmKHfuAq8MMEBrmqsnjLvRjeWz02QmIzxroc1jC1hxnYYq/8PhUEr3vsg?=
 =?us-ascii?Q?pD1XGuFUBsug4xFPaDgRiJsy+SIgPy8eJwbEdkRx8irPnMDk48tsmkGefosH?=
 =?us-ascii?Q?VrYXZC0z299GEPydSTOsgNtAeefTXO1hJe+LUhF3oqIJ6BT/RtOq+f9vdt7b?=
 =?us-ascii?Q?90WqGnDykG/nXp+c5NoXZck1ukmBsenGPSoNRRi3o5Mhxa851wIF6FhcsziC?=
 =?us-ascii?Q?3X2kJIxLltzn32z3feJd93wzEUiT/2WI04KPiHU2HJzd90BMOz99efc63haP?=
 =?us-ascii?Q?f+X0MO9WFHuK/rbB9Pfzn6iDJM5pnqUusXceUgfDh6ByHFWXZQueFh9w26CO?=
 =?us-ascii?Q?3r/iswNvOpmIFwiGTHb2hWHgAh3jcsSUpP136E4WE71z6jbMSm7BT8sVNU8t?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de6b2c33-bbe1-4a58-d8e9-08ddf20831a2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:25:16.4888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +U9EwveuEKgbYdCNGKOiBW4pVBZkwBMv3W6pNv+JBZivG5YQn47c3/oBrIp97dBNbCuhICZ/X3E6L4vnYkHfVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6520
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

On Thu, Aug 21, 2025 at 03:14:46PM +0100, Tvrtko Ursulin wrote:
> Emit MI_FLUSH_DW_CCS when invalidating on auxccs platforms.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index e7c23fd04011..752dea0a9234 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -275,15 +275,16 @@ static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
>  			      class == XE_ENGINE_CLASS_VIDEO_DECODE ||
>  			      class == XE_ENGINE_CLASS_VIDEO_ENHANCE);
>  	const bool invalidate_tlb = aux_ccs || job->ring_ops_flush_tlb;
> +	const u32 flags = aux_ccs && class == XE_ENGINE_CLASS_COPY ?
> +			  MI_FLUSH_DW_CCS : 0;
>  
>  	i = emit_copy_timestamp(lrc, dw, i);
>  
>  	if (invalidate_tlb) {
>  		dw[i++] = preparser_disable(true);
>  		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> -					seqno,
> -					MI_INVALIDATE_TLB,
> -					dw, i);
> +					seqno, MI_INVALIDATE_TLB | flags, dw,
> +					i);
>  		/* hsdes: 1809175790 */
>  		if (aux_ccs) {
>  			struct xe_reg reg;
> -- 
> 2.48.0
> 
