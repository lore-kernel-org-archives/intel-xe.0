Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B84C1112240
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 23:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3E110E191;
	Wed,  1 Apr 2026 23:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmsRIxvr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A76810E191
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 23:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775087812; x=1806623812;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9PTkgb+cSEgW/TwLfITsp95A9JbxT7XS4xG81UGI4zI=;
 b=GmsRIxvrj2M43JtFCPV1UU9FDjSnccfxXooZMXg9ZJtZW0j2KgxAmthO
 vZksxhIPSqDbCnJ+nKmEoor3hDOz1Jn07CR7SlQu5OjedJ5KgOgFzgfZe
 SoLiOO5Wol23Kmzzgiw71JIz9sSmtedFwYu/4Vxh3DOZx31u7HRSrvC3g
 JkGvfqXDb2R5t0kVOnGuxGGROXkJazdia++8fhhWXGjd7tj0vo7y2IB0I
 RvTS4lxSiW0JrB9Dce/QD3tIIgNTsHBtYZ/6acsqkJdhgtLnkFIGGEBxZ
 t/KzeUMZJQGRwQsZODBHt7MQeDys0VxWA7AQojWDxnZ+7cuWZX4cjJNeR w==;
X-CSE-ConnectionGUID: aDN82QfESlqS0QcPbmtmCA==
X-CSE-MsgGUID: 2RWkYdOtQLCuzYgJ5yESCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76328747"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="76328747"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 16:56:51 -0700
X-CSE-ConnectionGUID: yzR0k9IxQTquL0Lo3/DfLw==
X-CSE-MsgGUID: BTpqjM5tQC2LSUDN6/BJQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="223530084"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 16:56:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 16:56:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 16:56:50 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 16:56:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARpni27lrCkj1CBD9KR0he2XpgGRM4uMp47HruqwidnaAn2/p4Jx3FPpA5dlewQd/3SXXUi4G5T9ZVZYUh46qLejQsf5ZKsuHw9Rjw1u7SECAekIOvQb0z29jXz4EC1pccDbZ/8XaV71reOT/xH4DGw8KKfU6AGDo31fxCPF1vcZ2idAkOQBg/g6a8pmRs3rSI3HUtYJiULnYaMN2sZLaXT67teq5tgfVIQRiBoo7Ob2/V89THFHLjWKvmImNWg0s+i2sfEBcIsx7wuIESw23WK9DkHh1KsjR1zbWKF6zhJtMooXIFtDsHN2lIdPqrVlhWa2ZZILwkR1XDPV+2GjlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJsFuwKweWj/qv5ob1b6Gy9A/9wRxgVEw+qghBD+KLc=;
 b=hb0xC3N/UhIbwOgLKAmdVE7b4wsXhTmiVjodIxTu7g+kOi4Jht/1+zT5/y+qpc0isnu/Ni6Ud5APc+CF21nrT84BOHyh/YfiAm2NVkKZjFHVNC0MGar2HzoZBCYjJ5gND4cEJFjssgNejX/NDL17ngsWcWbtak3Xqyu3BqCjk41AiPhGsCCGqWVDT0dYLh2K4rguW+Ol6VtoujPMeui5v+qxOXCAtuDWbsTrNxhkBLH0jMGIYTY6CT2jobl10xD8A5+AAdqewxO7vgD11phLpzYVycwKYPPUIq/AZHFNfoeBZLj1s9/4rRjFw5EgjgOdcSsbCU9/nOzPomQLQ/K1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB8336.namprd11.prod.outlook.com (2603:10b6:208:490::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 23:56:46 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 23:56:46 +0000
Date: Wed, 1 Apr 2026 16:56:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH V6 1/7] drm/xe: Link VRAM object with gpu buddy
Message-ID: <ac2wu2u5wNhkmzx9@gsse-cloud1.jf.intel.com>
References: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
 <20260327114829.2678240-10-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260327114829.2678240-10-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b364b2b-44c3-46ea-8546-08de904a5534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: S8REwdjODliClbhkl+Z7+RItJeEvuzgqhZBUO6XicgB7SXsKkxSek45DozaOJpCbY/hBifrvhasuKnzAtVRyY5J2tHN8NYM6cTzV0+ZGxv76hETkjJiQJDrQPS6T8UMT8xiDvKxFn4n9s5SHylgoh3M3HAOaLBqL1O+5UBHLr6ZaEJe0HFeeYAhmSAUF90BIthuP9Mnp/PYAXnDR569IfMH0S7wxRBBeVGvXUEvprS02lx+iCEMj1AZ8LxDKwV6tMiYrab/XMAPO6RSHxzTdvfBEKSchnSw6kkzNdTmc6DGTBN9Fy9QX1iGwYfeVRpgUUThipoF3dBO+4SmYzaeq2LM+qK5JzblO+m8Bm/31CRtHOZbTzDGuG420vllM33q6VTKiJsnLDufeuA1lCltyOjOFbVuRjqCDLatIUiH+sfzJaH//TeJTonwpO+mGiEThNEV/5KV/wsVmEJyanKzi3Q4UvuaeJmqwcVE/1Y/q9F1FIVm98r/lUNvVkOTwhMqkU/dCy2cvC+5I+ou0YPhCt438MGYKSixtuPQTFIvbE78Ug3/u4accUBaYBnJwXkwFWBcnv4JWfRLJSP3j4+53DJHoQjnJsKgbnq9hAgL/3nluV7Jp2rQkScO5QV1reitmrxLZFOIY3mZuGYDPM22eoaD1wxN+lLgDOF4C++Xwtf8+Kmx3Jymggc0Iikm5kh/2kxmGJgK5/tt511TSFLFKSmOmVJX2KY0utV1ml5+3h70=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CczGkZ26i0Ds3bI89z40vx3SDrlrklbrjQdAedmGarK5BG/QMFchl/qMdpvj?=
 =?us-ascii?Q?aGjVQteYbmD7Wrv9selwiCp8Msf6BjmvzayUqfoovxwG98QmqoP28U951d5q?=
 =?us-ascii?Q?QTJVXNbyON9JOuC+GOw8mOY/+NJ1XUDLalxqKgkjGC1s9jFDIR9JJ5lDUOqJ?=
 =?us-ascii?Q?8L9SJ+yKCPI2JgFPdHmyRWhXzeDlnjduXj2cpGUjs+JWhyljn9W7ZJm/PErG?=
 =?us-ascii?Q?YNkjS4HYC1N6NN3JzvI2cT6qlZmrHlBRCkKSEiDbkQExuu6W4jyIurKatgKz?=
 =?us-ascii?Q?jWeVt5t7DHCMBdGIXMgEeBwvV7coQvAI+UDzdEDst9gW1XyCsKkR9kQgu/ca?=
 =?us-ascii?Q?KCctWaNza/P9UuCCSWH9Tvre3uywyf5B2t+CWuZBRXs0Uxfr5rGwaGiLUdFq?=
 =?us-ascii?Q?YtBrHmT52JA5ThkzjWa0oJsHFHliEY7wPUBoYb5bd6spL1i1+MwFkfu7XIX1?=
 =?us-ascii?Q?Y3UvOo/FarQ91X98cIh4JWBBeGrh3NbWd0OwrNOkrfi5PWUDxL0UYkJMPoui?=
 =?us-ascii?Q?oAJUtLFd0OcTg3q9o7UgcFx70LPnZwZXEsKrAM5JT7dfc6uK2U9n0yHqjOXm?=
 =?us-ascii?Q?ydL0PxtAz77K+aLkCEvbi5FQPT52hMFaeq2rbeJQ1kY+poDpygg7fw+InjW8?=
 =?us-ascii?Q?DJP7r+hWoNJJ9xAvk7Y0fgwLeEd/QskqQt0fuTwkJu4sgnxNPL8VtddVAthI?=
 =?us-ascii?Q?a42DQ1mpxo3u3iqZGM/Dd6RoxTXOKm5aq9yXBo2YRyI0IycN4lfpcwtJG6hf?=
 =?us-ascii?Q?4ietCWXS4kTOwl0t9cljYJtt3IY8WA1C9kZYeXhqNglsxdgG4m0SqNFCvwc+?=
 =?us-ascii?Q?CP2jIvv4gbzUGWDjT9jEDedaQJogetOwwUWoRZ7X/aROP1TKG163V9BKTdSn?=
 =?us-ascii?Q?fzaHUgnLLNLoX5n7p2SfgWhJO77Q9FzYkv67mcJo6uCW5/sTJ15Q0UHHhFEH?=
 =?us-ascii?Q?SjTimCdoA6vDcYD/8gJRmoXI5XXTIXNPfmKiiEp4MWBP+fKI4a7SRThvhIz/?=
 =?us-ascii?Q?4lhqRcP721ll3sO/97YxGvfGieGqijmPOgObTFVc8DjpsSqPageOJkCnQqLr?=
 =?us-ascii?Q?KmYl4nOtbf+dpxIch0fk9DOVdhHCWkIqSRW7uNgEojlFd1eOxrgmAhH/L6Dm?=
 =?us-ascii?Q?HjOE87Q+uuf7mvo4/kUg0NdNDzBq3x2GGnF1BxehliLH31mToBfB9obFzXP6?=
 =?us-ascii?Q?fJRmVsjLdOIRl8JJHnJUaj/dDJKHyHe7U6ID10dgC34Or0+DmeIXej3eQDqh?=
 =?us-ascii?Q?xOBa62qlFD0xP5OfnwDPh6uaz4n7nCqXaPOkT3OtQBrb/39GklzWsvQxteK0?=
 =?us-ascii?Q?vFn/ktaqFfmTzDEE2Wdzu2apP2/SbOUBAP2DhXDDPZMoyzvNTJkNIWVZoMSR?=
 =?us-ascii?Q?lIemLnn0WEzZQDgAG2ZiXxuzd2eE1ee4FjccOdUkEp0aRfhbqNpNhml6ctXI?=
 =?us-ascii?Q?RvNJ74jjyyGBSiK/Xpbco1Mz6Xw50LLsteioqr9CHHXBDKqOZSutvFnJCZqm?=
 =?us-ascii?Q?fjDJCZremCLMQecZ117XvubXWNgLhnr7h7WuD+322hlruQjf0ikIS/59Sh4M?=
 =?us-ascii?Q?v5KF0lns6N24xrs6ClAazRTZyHngBPiZFKLp8QgXQemYTug14ibOlsjlm/I2?=
 =?us-ascii?Q?4mb2OWx1oIQRDtTyYMO7pA+VXIn+W5Nnj/9RxZ7P+vMYBw2G3NSIXC+jT0EJ?=
 =?us-ascii?Q?gNp0BmmXPFY6lFaaHGq+264DnjWuY1xbXY4jIqt7ao+h4ZbWVi2MX7ARj0F6?=
 =?us-ascii?Q?rEfG+QSULGhvzF0Q+GH3bXC601hKyhM=3D?=
X-Exchange-RoutingPolicyChecked: SnXwzIGoAHGc7fkGSeqMdWjPRX12anMKJWdUbb1XB4aH5lLBMhlEAQ9+ygavwab3qASsZzZaf4c0gl4xJhsh/Qbb3LA+CJb1QkqYFLL2Lyt/UsDrT0EbFCyNYXbveRahrpyEwMTxUSK2vfcH7cTf8ADwLlRkkpI0FWTN2+CoNiWKw4XMiBXmh19FYgckE/udNOrbVK7hZw3bhIey+skdZXEZIdeSpgVCar8GrGsuLz9mZmn9ogs95Z+Up3DEMy55kXH0CIdYC9YJoT4SgrQeJ3LQJTF2pq/oVEExQ2kVkMDURwBLdNgl4DGO7DkjG0Rcv54xCRJIzEfLa3IBSwot4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b364b2b-44c3-46ea-8546-08de904a5534
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 23:56:46.6835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xUGsAaOcVNAINb91McwmAeMMLC3G46SRXG/QhI//HTkL93zkpXpBJMmmrIZloGQ+/fTyyYVA6Gu/aDo894Mxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8336
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

On Fri, Mar 27, 2026 at 05:18:14PM +0530, Tejas Upadhyay wrote:
> Setup to link TTM buffer object inside gpu buddy. This functionality
> is critical for supporting the memory page offline feature on CRI,
> where identified faulty pages must be traced back to their
> originating buffer for safe removal.
> 

I just checked the SVM code is still setting 'block->private'.

I thought we had patch for that but I don't see it in this series.

Matt

> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 5fd0d5506a7e..c627dbf94552 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -54,6 +54,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>  	struct xe_ttm_vram_mgr_resource *vres;
>  	struct gpu_buddy *mm = &mgr->mm;
> +	struct gpu_buddy_block *block;
>  	u64 size, min_page_size;
>  	unsigned long lpfn;
>  	int err;
> @@ -138,6 +139,8 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  	}
>  
>  	mgr->visible_avail -= vres->used_visible_size;
> +	list_for_each_entry(block, &vres->blocks, link)
> +		block->private = tbo;
>  	mutex_unlock(&mgr->lock);
>  
>  	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
> -- 
> 2.52.0
> 
