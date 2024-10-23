Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3593D0BB43
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 22:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4BE10E139;
	Wed, 23 Oct 2024 22:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="blrIQ9D4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11F310E139
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 22:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729723365; x=1761259365;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1mcn9ctpfACbtaOG8pa58/8IEoDK7kS4Om8PJmuKXqE=;
 b=blrIQ9D4Vx2bpASvC7Ui5av5zto79kb+xbhoNN76aHAgyFsZnggNIgjE
 DBy4G84bVvKXrZ4GCA5itD4sxND59DovcYU7G7zC3wVRA3O3VclNWG51G
 tg9rDGwUFbrSx2N0RM9mOKis3BhNVpJK0uLiPnKhuR8ADvBeMXcA2W0Oi
 g2/mwlKfKP5Gz+v9WP3wm+vojwn5LYWXr+SYYPythqTytNi/FKz4wle/i
 hN0Vb/R1IDUjThnh2vMoJdjk0pVgxxffnSzRZyMtPvIu0fRWJi1zrefzR
 RylgKp278uA54PE00pkxQ9L5xFlN21PuiYhs22h69RGuC8R15im6toORm A==;
X-CSE-ConnectionGUID: 3zAnsJVBS16bNzB49f79/w==
X-CSE-MsgGUID: evGMWoFCQiec8AfWSt8Uiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="40704023"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="40704023"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 15:42:45 -0700
X-CSE-ConnectionGUID: VYD9ZHD7TQaMC6FqqDb9rA==
X-CSE-MsgGUID: GqO6UuLgSmuCOeaq2XOu+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="80511159"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 15:42:45 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 15:42:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 15:42:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 15:42:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNBvDuf4txquZgB1ULl6v/FOkknmuD6mdZTLB2tfGMNDRPPOsRwCLyVMC0QEksnxs32/yeo4PSNLITHFuBGKO07v4sAJKOnIzEFx//OWXife76AdgElcyqS0EJ97JipR5jzcbS5nqoiVYarEBIN4SUGKm989fJHgWajbQrwN5D1IuuqW/e9gELBKSytAuMZrN7ORBZnqoeNBPizxxKj8w9rUnqzM5Jz9spzioeSc/i1LrBmA3RGQwF+42HF84P+MQNp9x4z0EEzwTpFFZf4aB9LsmjIuZc7a6vOesqu34/zLxB/tCfS3H+0n8UVCqnIGcMZAGlokkvu2eMhs3a476Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+AckkYVtgGLZkPH88SZGgjNARkJF0odrXtnLFX5x08=;
 b=xS89PljqtdrRtxMjAQynXVOSPgHtzn0Qrvdir6tcvfGVfS0Ov2u0I3LmHNtPcr9weMgMRc5EWA/Ew9tXSeFvVy6KubxNVqnQaUS6G07RXLfklvaq3UNgIPrWLDsAUwkY4X+bH1Z1k9kZc1/sg5HEyR9KZ9OG/PMHOJ+wd4eQxqBPoh44YrRHzoJzj2VpQB9nKspKJNhxaZclw/7t2+aOnk3GewjmYlY5MIGZHvW+i9yXSPyVPqeNyUJYtaxCXoMBLHQs8HrPlzBmD9QUPR1vj2v/889k98Msid0BLZQZCAPXP1K/uSeCtecQy1SvCEnaPK5VpSLMl9eQUodaelouBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB7661.namprd11.prod.outlook.com (2603:10b6:510:27b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Wed, 23 Oct
 2024 22:42:40 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 22:42:40 +0000
Date: Wed, 23 Oct 2024 22:42:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, John Harrison
 <John.C.Harrison@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
Message-ID: <Zxl7zbka6vcp4sht@DUT025-TGLU.fm.intel.com>
References: <20241023151343.3463640-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241023151343.3463640-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b24fa8b-57d8-4daf-c1a0-08dcf3b40064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sjlrZ4bYsNn5MyaEkTfYGJpFancSxHIsjcDmiYMJSMFqxa0AbiCUQkcvhiUB?=
 =?us-ascii?Q?Q76fDhPO4bfWi4Xv4NskorwIWQrxsTETOst/V4JND9Zv0vNOzyFqbxtEOepv?=
 =?us-ascii?Q?jkcNRe8w9QiZNne4pbS/CyfeCaLi4bgHhxm+J35is2RinP1ADaixsbFEIYEF?=
 =?us-ascii?Q?b2T9XdaIA9MngoQp/cLMlo6W7JIcBa5nqcp1hW0TUFrCHBCnQBdQsG/Mf7Xi?=
 =?us-ascii?Q?UvkOrwICHpxoB9zg1BR/X2+In3cnUr4t52En4vtwEqn70MI8RDO6c0VF3TOC?=
 =?us-ascii?Q?+CjSA03+g7r5rag+c2LZqiOWvMKwesUijPVj12djW2DkOS35oZw4wxvwVA2y?=
 =?us-ascii?Q?8KQkODmrYInBvboidnX4M8zVAN3anqg2e80xW7zhdW26ANefSa56FOSKnz7e?=
 =?us-ascii?Q?vFevGly29367qn/Oa2ZtVcomvBprEATSVI1TwWYZasmIEtQsEl+qSFy0i142?=
 =?us-ascii?Q?0E9jBTyTzlXanDvq3+skSt7PZ3PoQ75sfRLQ0SSZzYX4hgsvsN8cw7+uOKzi?=
 =?us-ascii?Q?gUA17GgwZaxlOWvv3OUm5D0OVIi4TXAsnV1XJjV9+IfmZTGdqdh798EYw5qM?=
 =?us-ascii?Q?0gKPaTkriE6oKSuiOP2RqtjKQP2m9aQlc7d5Ib0rLyO+FcwNehkenkdJfi3+?=
 =?us-ascii?Q?f+0zHnZ5UXYU+ou+xTOA6xPz0GcsWNQ0ipFijgJ2w7qKBS8+FDg+XRV32hs8?=
 =?us-ascii?Q?thiG+/OVpYuJ25CzhKtNACG5juLq/FtV1cZkZBdP1C9j7hTjvAARjkhCwRRO?=
 =?us-ascii?Q?RsuXKAOCCjYPs5hg8Itxnbz4g/+VB8dJYBGd26S1fFXdUX4hJLh074XSmmnT?=
 =?us-ascii?Q?h5HaTauaybzeK0Or1XhJyMC+3lbnjQ9kF15NygA0WBopGSz6c9EY8bXL7Sb1?=
 =?us-ascii?Q?vjLOdyJU7hcQx2HpZwWS4YRuKhp9+cwbJEb+6qNzZf3GxYgrgMNST+cvZoCg?=
 =?us-ascii?Q?IJpxHwAdUV60/xnwimSCypFa1AYnvpZJbVPWiDTLNmUiaVnaNahdo6/0phVq?=
 =?us-ascii?Q?TCQXPtmUqdsGiJrNUOGAXE3Zwtq2hiWspLkTORUNFONYmw6YkPfFOiw+HMv1?=
 =?us-ascii?Q?5dUdbTfvdBzePoCJyWlBL2xfKMRRgNvFkHz4XL9+6xsMPVpKi/qTPvGmpjgF?=
 =?us-ascii?Q?YongMNaSwjet7fQFyOtBcJtuKM1d1nWFgz5GuP6vwibVjNUGNBc848CuY8nn?=
 =?us-ascii?Q?5q6C6ncPe4QST9iCLvjhMGTJVm0/OCSFfxS6i1Pl9HNAfmDbWxTRoqdze6rJ?=
 =?us-ascii?Q?NXmPq8NNGVJmlG7uRlJX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bSAUr/EqgdeFaI2wxFNCCo4RhPmrJrv8fXV+Yfe4GMbBEUpeOuQamQJGdwYQ?=
 =?us-ascii?Q?Q5EHZg/+/JChhi9m2qMXYMjsynXeMv5QfdYeRkh8RzCs+iIJiYUpHR4iwV9a?=
 =?us-ascii?Q?FEtLzVeNjAmLqlkTMXNmTSI9TA+XsskVDHva/EMc7zG/i17h1mTJvuBfB4hn?=
 =?us-ascii?Q?FAUbvenwku88aVAe0xf88PQageUswusVMUhtS42+xUtTRG4nRU2R5KGI59a+?=
 =?us-ascii?Q?98VieoOhZRPF4h3TRYqNl1E+tVMRkkyd1yuz1/enb4RU5GzXo64Z+jCuh/UT?=
 =?us-ascii?Q?MHeFdvn1M+SQYPWzo37gBwy1O285WAEUFwZHjlqdMry9VJB9DV19f4Xe2Yht?=
 =?us-ascii?Q?G5RVYX5BiimzKMtdMCtPit9DPZbHFZDJXSjV1C6Cq755dMpdQ55hLzCDVXnP?=
 =?us-ascii?Q?9OnWx6ERrnDWsGRAQNQqAlWWW5f2WeRBHdHo+yDU18hCvo+aAZGzK07o/Fry?=
 =?us-ascii?Q?272l/SPXi0uXfY1ZTDwS4rtucA/Bg4+RUDMckO3lMaTglrAGpHSFZR++wu/V?=
 =?us-ascii?Q?yewFy+FA4sq5goMLK8cnIqjzhdcImaZwu1cxY3owEU17FXE89lqJEKa2uCRv?=
 =?us-ascii?Q?+npIxg4d0e5q5mcJcLcER1J9WUeLCsElI3f+pwyHD9auNOIF0K4f34G1vdhn?=
 =?us-ascii?Q?7VamD/K6l71C/F2BWrxbe6kJwbWA2ijkonBBrTevzV8+/cSCj+3OUMzwzJJF?=
 =?us-ascii?Q?F9sG5WtGMPan6h7VZ7fAz+LYHQoPE8ntNXiKp/gFvrMVjI58w91iaGv/EEgv?=
 =?us-ascii?Q?mmDvH86yTN96xCCKCzul259LWqaAfDT+qyEfDnejR7yReJizMJxxW+VvE/Kg?=
 =?us-ascii?Q?CuCTjEQa3CvLPKo6FGnw8xgitH1fMKfZWgOQLQwCy0m0gM40xnKW+42eQOHY?=
 =?us-ascii?Q?eUIT/YegJHGYdh51k7LH4ZluRHDYMLX+vAYNID27LMfJqjdc+KzvSYasBSNY?=
 =?us-ascii?Q?a8LnJmWRQwrOhHr6gTFtfEJILyggXuqniRsQTILG6QXktTRroHw4BRtTWOUp?=
 =?us-ascii?Q?SByyV+tHp7VWE94WzAmYjKLPsyeK09xniurc3Cb0Mp2ObUZG09TOUEKSSDP6?=
 =?us-ascii?Q?mRsBcCYU3gnCc0QCpjYMvm0aDEXS5mFvSZ9gdLCvLcqbIUARPcxVhZvXiM4l?=
 =?us-ascii?Q?bnSc+RqT/NhEt+Bw0ylFP7HBim9ud3QNKDcIYCVVQ3W5f+p7cjgawA/QdiOh?=
 =?us-ascii?Q?0sAu1Bnc9lAsV0jzYqoZTvlxdhiPLYGTYJgUOJHdzV43uklq/SyRhDDDqAPY?=
 =?us-ascii?Q?6M9H5JRm9ow2HDsi+wef6hErYvkKAAvVKkgb2P5HAL9AnzLhnSmcZT7cXzEn?=
 =?us-ascii?Q?a99zQ7o+IUU+GAOptmDMKxeWdJc1v+57iwuPO+/lGH5f0ZU2dCgoXY11zKOa?=
 =?us-ascii?Q?kTsR8dg0nG/3HQOtoadCwCIzuHU1f659QreGaA5YvsNu68YI7/dUrFPvkACt?=
 =?us-ascii?Q?iGNXUS52dDlpWWfblHL8q4IwIm//ikqGyHyPRq04xwj6BBtRY1+KPk5YRj05?=
 =?us-ascii?Q?gHQutC1CMyvAiIa+7kGA56QE+r61+HIMqQ18C+yCubZcFTt1JWR9v6ohORTZ?=
 =?us-ascii?Q?xUduWmpM8pdtgQ6J15bG1nUYni2z+4WNG/gBnWQZtKPP0zaN7Ixc581S3r79?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b24fa8b-57d8-4daf-c1a0-08dcf3b40064
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 22:42:40.7002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h42HQizMK76sZXE0sZoQklUmjglOLOjz5C5XVHFfDc8RiaApVZd8kpFt/MzUzQEfRMDJD8mbmE3+BWtTz2nuPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7661
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

On Wed, Oct 23, 2024 at 05:13:43PM +0200, Nirmoy Das wrote:
> Flush the g2h worker explicitly if TLB timeout happens which is
> observed on LNL and that points recent scheduling issue with E-cores.
> This is similar to the recent fix:
> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
> response timeout") and should be removed once there is E core
> scheduling fix.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 773de1f08db9..2c327dccbd74 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -72,6 +72,15 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_gt_tlb_invalidation_fence *fence, *next;
>  
> +	/*
> +	 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
> +	 * in case of g2h response timeout")
> +	 *
> +	 * TODO: Drop this change once workqueue scheduling delay issue is
> +	 * fixed on LNL Hybrid CPU.
> +	 */
> +	flush_work(&gt->uc.guc.ct.g2h_worker);
> +

Same comments as last patch, probably get into 6.12 too.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>  	list_for_each_entry_safe(fence, next,
>  				 &gt->tlb_invalidation.pending_fences, link) {
> -- 
> 2.46.0
> 
