Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5ED10AB810
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 19:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9FB10EB28;
	Thu, 26 Mar 2026 19:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YM492Tyd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596C110EAEF
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 19:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774554652; x=1806090652;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4v8hjsH91xS8dHcE3cyPxbqFY2H3ww/frRVWK54yVz0=;
 b=YM492TydFbd0xv2QKRSuJonQ+bhHiaQ4w4UAHs3dDc0RzhUU/Wlw970S
 ZPO5w/psYCem2aOogKFVXNHtNA54bMApZDE4IIyiTzLaQWfqd8bwRKmDm
 krhn6QDxZ0Q3oGnK3CVZs/+JtYs97DJup86flX/4jJLZJHpSJT+eMhXYs
 8G+E/QG3F8ZFzHX+AsmsK/tGm/7fcgOpsClusglEOpRMUoXJIQlccS43W
 G0Nvvd+yng6Phgu88pHbONDGiGdeMAFyKR9LIB27xc7NdIYlEfzIkgjLZ
 K2N6EcOstVqrxEx+MaPtJbVes7dnoHUDeX3PlLEyyxcfumF113dU8FUm1 Q==;
X-CSE-ConnectionGUID: ljOJAxn1RBuN/iRhpFaevw==
X-CSE-MsgGUID: sjCd2/fsQj6tlo+W4wibmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75594025"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75594025"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 12:50:52 -0700
X-CSE-ConnectionGUID: JL6wiI9wQEWnV8/jXjCIqQ==
X-CSE-MsgGUID: zfFiCSVOQFmbCe9KHolvJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="255600007"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 12:50:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 12:50:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 12:50:51 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 12:50:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFpcQ0OCc5MyMoGjCmWHnbr915pxqIq3gOQAno7N9RidW43WQb+Rxdc9R9jglzUHJGWf6Az/MqZBeUbFJncUesHDLKhsz3iLF84OCH5fFIHm0L40AnU5x5h1fRzzpE4kNjnR4IzK1rhL/URfJGe/rj7Bx65WU8tEtPG6zrWmRYVsOhCDdZmob/Duhqj3YyxQd9EhhOWSUbmdhvsGsB7kEd6hk7m2sIWIM8DtBtUvVrDnuNijXVqgQhga/rM5X1EMGs7rUhoG6ZFD43V1Z5aDFtzbhfEOTambiZNNL3uu/+SgZcIZXiVswVFwBJqw1Be4JDUpmdU/c6Dag4y7HZ8TXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uirFPbNfBmFJ0TYmW2wvBJ7WhShCAlrurg14WfGd1DA=;
 b=ly24gmC1mYb/Tc+iNyINHuTOnqUgL8RwGKU8Zq15Zztr6DJcMPV5+t5/UCMhSG/uOJeg1Y4e/Dp/H/RiDpWRAMFa4p+S6gqhLokkoXXLRbezOWk35wUKKX80a94KDZfU/RxuAcz97vZCwMrcEdHrwC0/0WAO/SjM0dHFT5yslWdgcDJILYmQRfekNZAJAXg5Kv7F6wQtQJXmI6+4foUA/5Tp+Z8CPEtG65nLolKf7ApqgryiHhGSvlkQITJdZxo9E3dlDh2mHdsR2BUhulX3FKOmVignq1Mn14N85U2fbtmq3+Qv2Syo9SaEcTd5afAgQtOcZuCumZLtd6bz3WGb5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) by
 LV3PR11MB8458.namprd11.prod.outlook.com (2603:10b6:408:1bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 19:50:40 +0000
Received: from DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414]) by DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414%3]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 19:50:39 +0000
Date: Thu, 26 Mar 2026 12:50:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/mm: Add batch buffer allocation functions for
 xe_drm_mm manager
Message-ID: <acWODIA/iepUzYs+@gsse-cloud1.jf.intel.com>
References: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
 <20260320121231.638189-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320121231.638189-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR13CA0239.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::34) To DS0PR11MB6519.namprd11.prod.outlook.com
 (2603:10b6:8:d1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6519:EE_|LV3PR11MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 264c7ab8-066f-4984-06c1-08de8b70f4c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: Kt09TO+TRCvnIQ4VtS0m4+IzNMY4MzI6cnhJwqkkzvyVfGGt3FngKrF9abSF+3lIRzQHDQ/f0Zawmg/dwAPeN92fsQlFFgRSfvVp0EsrSPewHG2e2JGOELFj3EeXWkTkArvXlZvKbouN9k7WrqzVpKvp9SJCuu3OfpDnImqLPauwVkxm/DWaCuNJ5p+D7sRxWQwt/sSzadvzEqX4GU2JzS9iqUtDm28ceXmiMXFedN+6p8A07e+Lm1amRvLMxiH1KBSoto0g+HPVHAMXk++YPO5Bq+3N6py0Z4LA4k7L0Yg2YDAffKCxWqtH2OLCxzCiW+DYHJSL2owu84y3l/PVSwJzujShIv2elrUfGHQ7z3CLyF24S/AzgAB2COxoqOPVs3V7Eiup/uLCT0NRDXca2oHdYYMoXAW5rYbXkNeKMNAOOIChWu9h4E4vLyiHCYkxdq7nmmx9vTYKqepVuHkhV0yU/mURY1tL6SgLwtPE2MRLHdyvJ30SiVpdj1d6606w1Cu/OxRjLDRGQcSPs+ap5tMGFnTvHmKvuIRVaHUsBJIEqdvDBdawg/eOP0XmXuorRIM/UYl7/TURzknGbmFqLerGHN53y2N1puoNeaat13UeLonkgAU4MHSp5Cgn8vkkr6zCnn7onQ3BYDVOTTh4OD7flGZ+TN3g1B6wjyiXU0FPDTpeD1KINajjRhs2TbbR3Zpi9FapFirNzqi4S8mU127VtbNans00clNadA3qWoo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6519.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uqaPSBk7kkcI79HxPpRhsLArWDXl3B9qRuSy8D4EIbqpU4Ex4+emfrZlJk?=
 =?iso-8859-1?Q?Mjl89U70Id/iCR7/m+bxR/OcKUZdsU2HkyOKxtDEIsoBz6lvit9uT2NuFm?=
 =?iso-8859-1?Q?My7GE9yZq9jm9QAkkSKzYSXE7d4kDqQ39KIwDmM79YymgOcanVGu6B80iL?=
 =?iso-8859-1?Q?nlCatzkLLaevL8yrbGki+YVokcPXxJjfxLQEyv/QRn11OVe5GdL1msKWlP?=
 =?iso-8859-1?Q?oSNriJr+xcV5mWfZPHdFmN3K5Vc9/J9DhKanT6O4SxqVC+IJnh7PI9CU/j?=
 =?iso-8859-1?Q?V8NFo267ytfazjo7MGVMYqlFSuP2ym3snb7uGtL4s17zTKjjYH13a1BaZX?=
 =?iso-8859-1?Q?59DEva4QiNlU7spasnN4evLdk2Ko3MLOiPWfylF3PC1zldQs424fbZL2OG?=
 =?iso-8859-1?Q?OvZ8RHnGeKKDqVyfz1GruUSri+/IkiFh8OUnL39UgZO2R4RlLnvgUctjzZ?=
 =?iso-8859-1?Q?rsz11Fytc+SfvnoyT6ySKFFusyuz9npLRht2fOkjRCYTvDfw/MIketsaJ+?=
 =?iso-8859-1?Q?mXyE/SzQKitH36iJfRDibhm6AXz23EHxBQPZy659xQNbEtsm7yEabK1jqv?=
 =?iso-8859-1?Q?sRBNZxr0AkzvZG9az6gW2yAXjODbJW9jXrceJ7iXouFf0Xf8RQny4SnVpA?=
 =?iso-8859-1?Q?1AB1O+MawgPkv+fCW/7UdhpDmYcd9djrkqxWKFHg/iZiMaUsFlxpxUoP43?=
 =?iso-8859-1?Q?Sl+NtrCq/cct/8cP/Yu0LblTzgx5OWID6NXKqxD8Av3kaY/Ai4zeSPqKwl?=
 =?iso-8859-1?Q?ol53LLqDW+LOgBpdKSOemY92FMPEAuwFIr9zuZi4jdCXNT8xJkLIFPmUCk?=
 =?iso-8859-1?Q?Mz7L8gU+DKOgNtLBwLiDu4DhVhcPSNflrl2P0Z6SJ/Nznf6zE4wcRKraAo?=
 =?iso-8859-1?Q?7wg1CfRb+Mj1BDWRWpfrHXYPx2XGgw/Di6fDunBAGdpUdg0UcmacBFUhTr?=
 =?iso-8859-1?Q?fXS/dntIuPXkdMZRiEZHNf4u+M+xAd24KWdovtTPgThTjdPhNI9DUgrxZp?=
 =?iso-8859-1?Q?lBY3eYQYktACDilUzOOSuLR37At3qc3VuwnHsCTq0LReAMYH/O365J9XhH?=
 =?iso-8859-1?Q?YVLhTjRZ1oMoCBd+8UNhqsYPcfIgPZ6IQ1FwaXnPELT57ZXX3H3mZVFDSr?=
 =?iso-8859-1?Q?GDCCkFwOD+HLvy6YugLBbc0mM81Saa579+w7JWYkOnNlgv5bcHuYnb9eNf?=
 =?iso-8859-1?Q?Q+R0tU/0tJy0qP2O5iasoR/LAi/jBqasgGyT0IPZ3Mh9cysu/NpxALwQB9?=
 =?iso-8859-1?Q?Ne4fhpCeqpDeK/Qpf5GJZW77OHBA12nSnEZFkHvxkPAMKMdsdJJNa0a4Gq?=
 =?iso-8859-1?Q?5NcuBPLAhcvhK3LkAV+2Dev2MCUv5G1PUQQkyPbX9Fi9lhBz36JMhgIGgE?=
 =?iso-8859-1?Q?sZWDlQ4E6n0q6Lks+N4F7Xq6FYPxFpyDSy2V2dKIOIM5noYFlqlFZRsoO5?=
 =?iso-8859-1?Q?FSFMUP4DaZaoEyu5lo63qRu8CsEPNnw45SaRHqQFmhoruURjApiEUhpjpp?=
 =?iso-8859-1?Q?oGhXINV8jYrBV5OoB82i+aCThK9AVbIhuL0+9A/lGNMHMliQjJnhmrWWEX?=
 =?iso-8859-1?Q?TUnKYs15TUGSrzDYfcTUl9C4vfgyIt3xHamcsfJKx+uytIU5riG6G5g6d/?=
 =?iso-8859-1?Q?hsu59EIjwQeoWGkNUiQlxg6nU6iDYvTd4A7zlzZ6FX/HOZslrc6qrwvYln?=
 =?iso-8859-1?Q?/xiLYexoK8hYjvDOClN/CNgwC5oxxhNGO3HV//beWGmFoe8U3AeT0xX1yI?=
 =?iso-8859-1?Q?ozngQAMw9LTdaYcZjdE2iARUU6iDynYna/ey//Fz/0CHNkg47txwjNTtg0?=
 =?iso-8859-1?Q?pQ3REly+pbacX8hocaJAu4/pfjhuivM=3D?=
X-Exchange-RoutingPolicyChecked: JWqSjn9duG2814ZAtEt+sE5GVnyv5NcxfH98NnfNUx4skeu/cXHjVoavfjHQwXXOskOnC64+Cm2g4ujMOOvwNc6BNg1dWZBqE8gi3zpV4zx3U9qEdnG4UoYrtl6aFWkGS69xGYCVgcT6RULRSZ5jKMg/9lWfV+ViTSYEUj/QMnpPRzBCrv03Av882BIzQAUVOs15hU90xOKjwgHsfWaFixnjFzfwNP3knfrI/mMjwU7b774uRfTld/Khfgsfz9I/wMShqYnTb1OB4q44GIAPdJsH3uZFTKjZCC+RbT69uHGw2mlwzkXLZmIuJ63ghKsRPFpwQBQDG/kpe+oFGK/Yrw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 264c7ab8-066f-4984-06c1-08de8b70f4c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6519.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 19:50:39.4563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9FsoTpgf2eFNh1YCYeVFvG6CBlNh0iNPU0GWDpxRaoHb0q1rOv/k8gqSSGHnM7IpRRfvyydMCPsPEeHbMuqhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8458
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

On Fri, Mar 20, 2026 at 12:12:30PM +0000, Satyanarayana K V P wrote:
> New APIs xe_drm_mm_bb_alloc(), xe_drm_mm_bb_insert() and
> xe_drm_mm_bb_free() are created to manage allocations from the xe_drm_mm
> manager.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bb.c | 67 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bb.h |  6 ++++
>  2 files changed, 73 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index b896b6f6615c..c366ec5b269a 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -8,6 +8,7 @@
>  #include "instructions/xe_mi_commands.h"
>  #include "xe_assert.h"
>  #include "xe_device_types.h"
> +#include "xe_drm_mm.h"
>  #include "xe_exec_queue_types.h"
>  #include "xe_gt.h"
>  #include "xe_sa.h"
> @@ -172,3 +173,69 @@ void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence)
>  	xe_sa_bo_free(bb->bo, fence);
>  	kfree(bb);
>  }
> +
> +/**
> + * xe_drm_mm_bb_alloc() - Allocate a new batch buffer structure for drm_mm
> + *
> + * Allocates a new xe_drm_mm_bb structure for use with xe_drm_mm memory management.
> + *
> + * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
> + */
> +struct xe_drm_mm_bb *xe_drm_mm_bb_alloc(void)
> +{
> +	struct xe_drm_mm_bb *bb = kzalloc(sizeof(*bb), GFP_KERNEL);
> +
> +	if (!bb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	return bb;
> +}
> +
> +/**
> + * xe_drm_mm_bb_insert() - Initialize a batch buffer and insert a hole
> + * @bb: Batch buffer structure to initialize
> + * @bb_pool: drm_mm manager to allocate from
> + * @dwords: Number of dwords to be allocated
> + *
> + * Initializes the batch buffer by allocating memory from the specified
> + * drm_mm manager.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_drm_mm_bb_insert(struct xe_drm_mm_bb *bb, struct xe_drm_mm_manager *bb_pool, u32 dwords)
> +{
> +	int err;
> +
> +	/*
> +	 * We need to allocate space for the requested number of dwords &
> +	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
> +	 * is submitted to HW, we need to make sure that the last instruction
> +	 * is not over written when the last chunk of SA is allocated for BB.
> +	 * So, this extra DW acts as a guard here.
> +	 */
> +	err = xe_drm_mm_insert_node(bb_pool, &bb->node, 4 * (dwords + 1));
> +	if (err)
> +		return err;
> +
> +	bb->manager = bb_pool;
> +	bb->cs = bb_pool->cpu_addr + bb->node.start;
> +	bb->len = 0;
> +
> +	memset(bb->cs, MI_NOOP, 4 * (dwords + 1));

Again same patch #1, this memset looks unnecessary as default state upon
alloc should be MI_NOOP, right? Then immediately in
xe_migrate_ccs_rw_copy, 'bb->cs' is written with instructions.

Other than this, patch LGTM.

Matt

> +
> +	return 0;
> +}
> +
> +/**
> + * xe_drm_mm_bb_free() - Free a batch buffer allocated with drm_mm
> + * @bb: Batch buffer structure to free
> + */
> +void xe_drm_mm_bb_free(struct xe_drm_mm_bb *bb)
> +{
> +	if (!bb)
> +		return;
> +
> +	xe_drm_mm_remove_node(&bb->node);
> +	kfree(bb);
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index 231870b24c2f..d5417005d09b 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -11,6 +11,8 @@
>  struct dma_fence;
>  
>  struct xe_gt;
> +struct xe_drm_mm_bb;
> +struct xe_drm_mm_manager;
>  struct xe_exec_queue;
>  struct xe_sa_manager;
>  struct xe_sched_job;
> @@ -24,5 +26,9 @@ struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
>  						struct xe_bb *bb, u64 batch_ofs,
>  						u32 second_idx);
>  void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence);
> +struct xe_drm_mm_bb *xe_drm_mm_bb_alloc(void);
> +int xe_drm_mm_bb_insert(struct xe_drm_mm_bb *bb, struct xe_drm_mm_manager
> +		      *bb_pool, u32 dwords);
> +void xe_drm_mm_bb_free(struct xe_drm_mm_bb *bb);
>  
>  #endif
> -- 
> 2.43.0
> 
