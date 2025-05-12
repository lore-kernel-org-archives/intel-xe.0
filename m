Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F75C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 22:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276B410E1B0;
	Mon, 12 May 2025 22:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAphg4f4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6783910E072
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 22:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747087830; x=1778623830;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rWMWSZaEZ4PAPZLhz+x+0JxDOJSo7y0UAbk7pBrCzYk=;
 b=DAphg4f4vJjIJT1vazxbFZ13FDnPKCVglAMwsz5bU84A1RHlHwph5bml
 7c00IVSwavdxmDiZyEv4gV8DsPGGu032f+fveL2yrg4HRwiIXuAeM+I/O
 HRMq45bLiFQ7174ecf46d4NQucW708nDp3Xf8oDC+LqpAvvCTZzmzpsCe
 vU5dqJUJAxpSaDKLkcqI3Phl5j3+8kwJ2IyXL2rySjnQCp+Bb2GpueEAR
 zYgV7WgqIffACWft9FjMxebXuPJi565LKgOxQAe+pgX7+c8sOAPSv5rDg
 nGCxctMUA1NLbdb7cTnUdkfhKm9y+YBU+xxuFKLBzjzqlvGZ9kXsJhXr4 w==;
X-CSE-ConnectionGUID: 1OckcSRQQbq8NzO5SdMU7A==
X-CSE-MsgGUID: ZDSw+DZXQiqmDqesJ/touA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52559864"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="52559864"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:10:29 -0700
X-CSE-ConnectionGUID: bZjPEn9PREaDWk2lX6I/2A==
X-CSE-MsgGUID: yB4UFH41Qly9ufSBKT34YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="138434493"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:10:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 15:10:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 15:10:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 15:10:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djnWfw3hRqwOs7XQjqYnSL0kDhkRMVMKnJSHkcX3u0TJGfq05PludOAMlE7UqRja7ucaEmrebXjcu7Q/BLN0t2dme+HR1mBZhflgHKZImhYaZjZI6U4ooy14ZHVw09IdTrFv27lcsY0fLmgCaDtDM5Zoi8Xz8oqyLTDsOLyh6q0/N/gbtOtekxOn8XzzFLX+opz7znov2TAwQsh9OdjHTUUZ+jbL2I7lsBqpCybsc7va7L5khuuoN/qnoGiU4i9uyl1EJyzD8Su15RwRweABLHkl2DR96N3TiGR44YnzbM9QEAvVDiae/L5dXVaHPhweRykjtc9uq17aVD12VW7CqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLC1+6dH/rR3w70U0C0MtLIkB6DF7Cw2Zkji80csWS4=;
 b=CGwnv6jqxq9G5VkyQfG6H1MKFTtBmqwRIoTBA+ur0Sy+mBtu97umWE5Pe2gsoBEwXRSC+JLgbBFwOWQFzug4/82dmGvjmJFZCf3ffY/XI03M7H4ahKqEgJKtxgRikn78b3rOU7wop4rlJeMIj0Afb+UuILhNF9uq4bbBhMxDRHL/YCYDw5iIPEgNbdfQjgHGu4tRkzPKmMi4kw5AL6DSiPVHFfTPhprAnj65JAbis1XM6MJIsACynGl7cCXxeUpr7KIS0HpbYU3LDOnPOlpdMASJuSriheOqBnLMVzmAEesDqD7slRS7fo4MJgYfThkfyfVKoCEdkjw69DamfkUpuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 22:10:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Mon, 12 May 2025
 22:10:26 +0000
Date: Mon, 12 May 2025 15:11:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc: Unblock GuC buffer cache for all modes
Message-ID: <aCJyKEpaPHvz/noD@lstrano-desk.jf.intel.com>
References: <20250512220018.172-1-michal.wajdeczko@intel.com>
 <20250512220018.172-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250512220018.172-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0328.namprd04.prod.outlook.com
 (2603:10b6:303:82::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 522aad96-638c-4205-5d09-08dd91a1cc53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KOdFgoq20Pjo2eA0jeEaJYPkaR6ykEZlLor/WXt6Z+mRQ2uJxGicjRvOkx0I?=
 =?us-ascii?Q?OZTMi7LifbRxcnmiEs8pC1TsoJVABHy0BHT896lQhWFavX0c49Fu1ThjW+bF?=
 =?us-ascii?Q?jLYEQN7a7GtevKFQfQiWvKoIbm8e45cA4uS4nmVIEm6MSAxk/lkXHAuja2rI?=
 =?us-ascii?Q?htVMwgpQ6gjDiDpSf+ol4epazKGGmRtx/tpS/hkHlT8MI0T7g0lBfB1ZEopt?=
 =?us-ascii?Q?z2YVtO0IG6KLeEhCl3ISG74GdZN+W+gR0SGo2wiBKddCnzqFfJa/V+Jtvhvv?=
 =?us-ascii?Q?cg8w44j4/Yf+SU94IUpDJZIdK1bwzc4aaWgiELOIilB85kIjF4xJ1mZOSojW?=
 =?us-ascii?Q?avMtVkQEr61pCwerbMlTTLmBMRwt5V8bmE/AdczLpN95JQm8pJMiNj1XpUCS?=
 =?us-ascii?Q?pMoTbhQKktbpejZwkDM+vkjqiaCyMoW4Ib5k6X7IqI/aQ74dxUF8ivuxCXvZ?=
 =?us-ascii?Q?tIYeRXdrHHEI9dLqfhzrF3mn+3hJP3/gAdKNxRRroZqbG7Ws60M2tCF8En64?=
 =?us-ascii?Q?1j3AtqKmmNxxHWXiRlQXGmfo0isG/DVobHyIJI+XjHoSDqA43PTx1Uk/wJgN?=
 =?us-ascii?Q?bDTgmDlCdqzecakPOtmZbe+4pxEEMfvXPOrszFg1EQAkV/KgrsayKForA8gn?=
 =?us-ascii?Q?ob8W4zsyhLgSu2dE+wMhUbIH103qnt/xTaPSkANPji2jFtr4bNdzq70Hyqv9?=
 =?us-ascii?Q?dX9mYx0bgFJ+usm9mZS6qbsQIc/rQpUMPBBh9MUC2kIqZp0k1dGemGExgrvA?=
 =?us-ascii?Q?48I4726DYk5mYYY7qqfqWdVZUyFqypX874IlX8YrLxiGlWtqq6OqBlxpG04c?=
 =?us-ascii?Q?/qgGsz3BKygdlRqE8GyT96ZmVxDs0FhFE60BqrkEbdH7AldpSEGkTT7eFWyU?=
 =?us-ascii?Q?dduOA5X2wicG4RzDzcZCcTKndkJCQpHFCLuNlUESZk7p3s/WQwprwyc0+N38?=
 =?us-ascii?Q?qtDup7tGMudgqcWPFAFTS365UgWw2oXZL/lgMyAedkPZhwz4BaGnLiTzENdy?=
 =?us-ascii?Q?lnHOfDsIAldTcLPL9Keeg3DO2t/LoLak6Qmlw4BHeigbbmacEJs+GLhxez5+?=
 =?us-ascii?Q?KobtYUBIfFNFCv4KfihQc9X4wpF009LNPor8kYvprMdTyKPzkgjnl2Qkdze/?=
 =?us-ascii?Q?4LOgUoYaAAKt+w6dwYnl9CjJuMh3DhqgcJ9ds/U0KoE5ZOIMjwLdj6984yeb?=
 =?us-ascii?Q?4YlEYFTnd39+2qN48ZlRGdlo2QY43IYJg+0UQi6+9RYAjtp2esSnijHiX0O6?=
 =?us-ascii?Q?iDxbHSU+dOKADyID1GJ0mUgV95Tnpg3h8c+nrp6/o7L1ovCvraENay5kZYKy?=
 =?us-ascii?Q?ob/36ozcuz7HLzJCQ54Iko0/RgmARktcicXTlhk48tzkOIGpY6kxwpZC7WHM?=
 =?us-ascii?Q?wIaDaV/eQpOOeUbLCaGlcQbQuEKTHycL8H78wJynh18GUqBoHZ/DTsmd/6UL?=
 =?us-ascii?Q?UWWU+cMSXvo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gZf3B76aL2F5V9Bs7Qvgv9DHSEn+ePH6pmeg+fQkz0X/EJmE+a6k0WXx/Uaz?=
 =?us-ascii?Q?Lnh0NiyfazKkWS/O2eI2X9AYPqIwBYGbiP8AUrgvoPkNq34zHwewQUtz0K8X?=
 =?us-ascii?Q?RMgpFE5iqDysPC6p8TvEg+VpzUckIXIoQgKRK/2dIFumwfHWGJ1VwwP7xvBO?=
 =?us-ascii?Q?xITeOWawlN9+rQWNaZrNAojh+eERpLToijvPMgaof7ed/QBAmX5vupA+9y0B?=
 =?us-ascii?Q?tVRf8n3zbyD0nkNnhnVhQheEvDgGiLBitvQ0I0UQnq4/NVI2Ka1Yzv4BZ9QQ?=
 =?us-ascii?Q?0kNeUX+6lRWxEjHJ1IAWEoXV7RW8+MRUfOT1Hs8vWgMQuEkh3rPfSHgQ4OFK?=
 =?us-ascii?Q?ZdRLXJiy9kQcML98RqdMIDNQmTYUnwhhKnBxNpu/FMzC94kjeBnOZWyObpYt?=
 =?us-ascii?Q?ljgw83RCiSAe9mL1si13gBhWQENP4ALDGXa4esaBEiFaHDfI0ZTsZpP/gpLc?=
 =?us-ascii?Q?aSyKbB64vtQ/M+K73qKK8AwlHadj42nAkCcrXqspxLi6zOsfNqsQtbBxzkS+?=
 =?us-ascii?Q?dq/7uUaHnU/tNv/gqUU9d5r2Ky2ZV2GiU/i43ShQM74orrM/nffAL6ddAgf/?=
 =?us-ascii?Q?6V3bpic3eN++2/qMo1gLJWoo69ie300roMVAaRDhNTKH4jYBztmpJ6OQxlTB?=
 =?us-ascii?Q?MMtyIdB7t/EO54w+ndaxvl1dLPivRxJpwrdFtO6kc8rfPV9PDYNHlCRYRpo6?=
 =?us-ascii?Q?wOXz6XSsP+BD+0cgN92GoUtuAOeHu/1VoT3vIqMdkxnZPG2wXdmj1XFS/cah?=
 =?us-ascii?Q?dyTxGVNDMjFrA6kvqDjMb/fBpODUdvZe6CiU4/722kWlrObonz+Vk2/qzGi7?=
 =?us-ascii?Q?KVhyh4DN3KkYNBTs101Tdl4MtCWCFOg18tuHrFRzexT8D+OOtWop8fHDzqT4?=
 =?us-ascii?Q?4ooYdjnGDjQIWWeOJK6ESem8Dr+KMpuIPqofhhGNRLeltAEIQCVFiprTCX/G?=
 =?us-ascii?Q?LHKuBZy1f3MdFEUtQ5oN17s7Jrt/DgjngjfQtyPymIMn1vKuP/qpbzmKR0nT?=
 =?us-ascii?Q?S/H7VA1SF/a9VNViNZkpzDaeR5rYTR4jX0Kzg5j3WtydWc9RWzE+r7i6NmZQ?=
 =?us-ascii?Q?TmNkQSogTnkY1S6vz+yc7iRFhBpPvFluHrGaAN7yfsdJbjHAYg0daBuX80/P?=
 =?us-ascii?Q?qB7NMW8sT7Rkg4Ja3iKPPSS20y5Yr/kEkHRL0lsnPI/DQP7wgKMBB+qU2aot?=
 =?us-ascii?Q?wBt0iry2v2Q0DGT/j8gDNmkNccWNuA/laZlFCOxDTQzRvihBlY6VkzLTfLoJ?=
 =?us-ascii?Q?foy+Cb5bk82CE3Q3zMRGVX78nv1c8eqYasKsXp/cCru1BqKNVLiTVVs8UnjU?=
 =?us-ascii?Q?qv1aWAnixHj0LZqHvTGpQnWgL2HsJmRyzMRz6dx9SLdRF7vOLL9V7hdDmtpX?=
 =?us-ascii?Q?2fnjRY6NlzdNnPEyZRywiIKBKU4TnFQJVQAtk5NXbsF6cDXj5N1ypzfy77a8?=
 =?us-ascii?Q?ZXxPCm8Jc1krIF5vn8n+tNPloxGWAFHAzrFTKTs90/euw03IAAweK7w9y9+k?=
 =?us-ascii?Q?OWLgvKQm9/ioKMXwnlnd6aFqxxPvsCBHhdTiwL+lqHK/uB6KnGgV8sPkIKVU?=
 =?us-ascii?Q?YhFKPGXcSG/kHbpcq+V41O5O6ItTjAgVOkyijmAwORXoiSMl6tdHuS8peLnF?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 522aad96-638c-4205-5d09-08dd91a1cc53
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 22:10:26.2628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXoCF/4LUTCFGxngPUgv8m3oxOEtDeXqFUHq9MGHnQDr547v/WL2B9S8fSGUarLruXuIsCkDe4kozyxUPHKvbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
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

On Tue, May 13, 2025 at 12:00:17AM +0200, Michal Wajdeczko wrote:
> Today we were using GuC buffer cache only in the PF mode, but
> shortly we will want to use it also in native and VF mode.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Should we mark these patches as fixes? A malicious user could consume
all the VRAM on the device by changing wedged mode via debugfs enough
times... 

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c     | 4 ++++
>  drivers/gpu/drm/xe/xe_guc_buf.c | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index bac5471a1a78..350434a8b953 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -710,6 +710,10 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>  	if (err)
>  		return err;
>  
> +	err = xe_guc_buf_cache_init(&guc->buf);
> +	if (err)
> +		return err;
> +
>  	/* XXX xe_guc_db_mgr_init not needed for now */
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> index 0193c94dd6a0..14a07dca48e7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -37,10 +37,6 @@ int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
>  	struct xe_gt *gt = cache_to_gt(cache);
>  	struct xe_sa_manager *sam;
>  
> -	/* XXX: currently it's useful only for the PF actions */
> -	if (!IS_SRIOV_PF(gt_to_xe(gt)))
> -		return 0;
> -
>  	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), SZ_8K, 0, sizeof(u32));
>  	if (IS_ERR(sam))
>  		return PTR_ERR(sam);
> -- 
> 2.47.1
> 
