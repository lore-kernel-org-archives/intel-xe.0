Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CE3CDB47F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 21:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AF610EFE9;
	Wed, 24 Jun 2026 21:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dn/JicQ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EF610EFE9
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 21:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782335316; x=1813871316;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iL1qbPIT+qj+9EZuylkjB5NTI0dcHvubiUBB04bsMFY=;
 b=dn/JicQ90zFUWkE/3BHcEqRNRRyNKExGPElhKvWEBm9xr7FNfi7jxw+g
 ZePHxrYu+DXXlmZdZq3aFbtGQwFDCP3Wo0LB9kgdySz5HNLZ3DXMvPb16
 JwtT4jRew21J65F4SgsmWDI6tbyjQkp722v+xJmKIrpeC5tCTFlDl0jMX
 OwoLpJ57YwtQU//BxDns6R6ti1gcavKSHXXLbVymURjDaPzdjMbyiyed8
 kpM7p4bp/ukLYG72d1fldRgTIPqlrV1PScEdcB726izBRtx3tkemN1Hfj
 trpmXrTEuCbxIBNOQJXHbTpJPppvHFLMxd/3c1y8ibOu+hewZ0g4U7h9F A==;
X-CSE-ConnectionGUID: OMzQmJUXSl6ZUvoVgJRq1Q==
X-CSE-MsgGUID: 4mDTipDyQoCQF5J7SOXhlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="82992945"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="82992945"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 14:08:35 -0700
X-CSE-ConnectionGUID: L2S4WQ7wRFqHeQGF2FuBew==
X-CSE-MsgGUID: g4O5tt8PQaSsHSPmnY/Zyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="252014353"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 14:08:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 14:08:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 14:08:34 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.58)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 14:08:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8pU0VhHQghroxrPlLMUqb7iubv/3f9ZK8gW4t4v5q++Y41XjLH4MagyTco/oYYWn00pEeA2ZcOKDF+wUdzzpR8A+Qc0Bh96x2BQf5oNLjxoQzKB1WWbz92wejMf5TgmmJWq2KEU/QFqtyTyPfaq998Z+/0GyM+8YRWYJ3i7h5C66xHDTzjQr9tFC1vcwTYbdvE7ivAA5nn5IPJ63OXCdN3mxJKTT+Ol09vbIbXewWLpdLRN4JdGueCI03AnEtXDwjNPsE8xbiQj0N5HS6Y5bM7Ufm3ApbYoWvLoa4mGujkKYRcAvBO0ZIvBxikPiy9rJ7FpWGxVRjtn9Ml2BxDF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VNVgkU0tNoQD370JUaIgVm6KiNoH2hSOuT9IWbE9Js=;
 b=VfDPJwSvAdaHoFFnwD5KH9Qxg8lKKGgCsPffB9v08DBDXu/fyVQq7ClozRUxl5YGkZzPFpCQvM2qwcWag0jwp0gTSWhg5s4SGAAIZ+Fd6+L+joIqSJTv5LFiocmV9D7TDR3szFtoK0JndfEzt1txjGUY6nCQW7aiXENXPn9V8NvKn8/Q9yKUx1fmVGI0qMSxDuUbaYN7vlIQue/M01RxqCtVWvxc1vkcYm7gkP6GDYMn+ADyocMIQAHMLUJh4zKLcBL9F/NUlX7RvuAbQZTlxu2p8KTQOP1V/9SYOwdEB8qk087EoIjMqO16cTwE7pwoSagA8VanY/ki41MlkQBHdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 21:08:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.014; Wed, 24 Jun 2026
 21:08:31 +0000
Date: Wed, 24 Jun 2026 14:08:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Martin Hodo <martin.hodo@intel.com>
Subject: Re: [PATCH v2] drm/xe/vm: Fix BO prefetch with
 CONSULT_MEM_ADVISE_PREF_LOC
Message-ID: <ajxHTHe1UsIQYDUo@gsse-cloud1.jf.intel.com>
References: <20260624174943.2808767-2-himal.prasad.ghimiray@intel.com>
 <ajxHAYwu866e2i6m@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ajxHAYwu866e2i6m@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b955c56-3b73-4e65-9601-08ded234be2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|56012099006|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: D5x9PoX19RltiSZuBGMVjwapYODSPSiXw76Jukgm/Xbj0dXJt0SCmfGa0KYsqDrU+7RI+CM/nHxQV3Rq+iyQlqOAsosi8+9G+4KCaPaJpPRoNsWwUEOGfYn/W2kOQf7M34xGLXBQdhPdvw5kR8v66p7aYSidHSimi+WiNkgWS3D7FWpWGbqPLjMjG5X27vCBZRl5mJjbLpI883YDWWv2G+bzaJYR4QStbbEqE++VaOJhuiOeFdLJyHCxN7IUwoU34j0izO1g7tp9sqKD3eGcTNanirg+hgyddLftPFmxkhFphHUx4I0lz++VgP04hjbZ5pqwfFVyGZsABwhc8UT3obznjhNtHlRX2lysuUEkxQvE2h6mtxThZBGwobxTv6DwEUdbPv5Hbq8D0bSKyXCcIXj8drswwo6RXE2iTxf/cxLvRJ683Tzdv8hINg7ArLVbNT8vwW0a1uRgUIyQyCj1oiKKrkuXn4LGqUM7kNLXLCtgy1RoA8Wiy7iQ3RJlc8KZTpDGsZ559KUmbNNC+HnOyX7dtScqKMT/wDG8/i8tUr8sS+HSODRIQPxkTlgH2cvsqjGY12Yoa/wU5/21TCl7tL7fKXww1HYy8H3bqcjnrGwjor4W/hkFdJLfrLnnyHZtR0RV08RY/uDXZrrYZwVsLsqct/96ksfN68tKgyGyy2Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(56012099006)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tj3YRa3meK3vD06KFOTc7nujSehIZZ9wX/bx+kO23JenL+DTvcbENUn4k0K3?=
 =?us-ascii?Q?0cH4bg/QnM1XMi9gBGfRYOvKcnvZugdbdJWqKfpUqTielmR3FDhurvsAIVZW?=
 =?us-ascii?Q?4aZcGJ8wacgN1kFaxVG4yTxH462ck7R1nxfcgFB+h78szBOZFIcHhlAh6pZQ?=
 =?us-ascii?Q?kf3yjDxX49ESP1MClawsyH1+SOqgyo1cdOVVM6P/Etnxxrx+2zNr98y1VW6x?=
 =?us-ascii?Q?WHeMQWDPrp7zsu7B3fwUnp9Uv+HHoH7XYPC7af7DQRhKU1aWVlUFmeXd8RHu?=
 =?us-ascii?Q?tTthasBCfimUqpyZgjj1yk+OURquorm+2seMA0hNgjGkCbrh5nUIPE0QK4M/?=
 =?us-ascii?Q?ttJ1N/+Z3lQnQWGA6gyPZJ15OhCaH6o6x5I92zF/UmkqOG2VJ1oOiuCJBKYO?=
 =?us-ascii?Q?Suq6QrD9hjXE+ZMtF1fBh4Rpt/wvNblLlyfhoKz0TSgGWnYKzq/8b7kSYk1B?=
 =?us-ascii?Q?OTLJPGIsJ7c34HW23Uo1SOONISKB4VnXw7RqMdYT4ZmP1eAvtE4saFVn+ezY?=
 =?us-ascii?Q?zM//vwyxWH/Ga2YKjL1ILYnkq+NeZ9fZRJrOkh6MiYYDZy8ILdNo1ZwgTMxG?=
 =?us-ascii?Q?nXS3sS5ksHEFeKNGC1QP1mTg8cNI7kv2OtKeUtqVDzSmAVAKKgL0KhPn2lOP?=
 =?us-ascii?Q?6R//qB2M2/zfAlaSRr4qgJAnNxX0qZX8sEPtUuU9SOZ86eZ2zz0h7x33lHQ9?=
 =?us-ascii?Q?jHz8PrGpyje/Fw2pBHLJhysAWOySN9+Q7RCgoP3RR8j45GH3/WNI6HzLlFKy?=
 =?us-ascii?Q?k5D199joeanxN9WUNQDITBXBRcVs5HC8L79Q/fEkaOs+zxY7RqClidpOdeLo?=
 =?us-ascii?Q?UDFu1u9ZBorMSL9Ioo1MU0ys4IQaz6+cwA9as+4Z837LVEsF+V3suaKfNkRe?=
 =?us-ascii?Q?pqa+hW1nSEuGkRFRCHVy9LXorO7QsUaZ9THMBR/MV1AkwZa/WVJyZpVn5IJ1?=
 =?us-ascii?Q?A+ODz5cJfGd10SteO1+sIDv5RArMSNcItw++X85hf6mU7xKrfXP+Z48jhDoF?=
 =?us-ascii?Q?bg4yjo+0RT99k5MMIXC3j1iq/xRjB2fcuOphizbRZgCruNg8ZvyjNLohPjCo?=
 =?us-ascii?Q?jxMZQYNFOR0Ku9tlPLy+fW1KNiy19caJ5x1HACb8dQIOV3QM3Hp/S2v9DIMM?=
 =?us-ascii?Q?n1Tz5LREisZNClJ1wzkM6buqciGuSoar/3Rwap427PaJsC0/xnQeyKIJerzl?=
 =?us-ascii?Q?jcDLoK4uG63zOS+IyoPqz3jOOH/8Bf8WaaHaMVKMBkUgfeuMMLl97OEE2Pt+?=
 =?us-ascii?Q?75+dw1pcSFVKdPMHfMQeDsOeexfQhQGTmx+Z/908q27mx4utOZVDvfhEw5ZZ?=
 =?us-ascii?Q?6yzKA28vKyG1W1u/PXHQx+VCj5dPFy2O+hCqrHxssQKjn8erapIKowVhUECO?=
 =?us-ascii?Q?Iem3HF4olXUzG8cEqGuz7FfbodP+BwiDDCIdpuiNI0eHK9JzbXxAhxBy2mjy?=
 =?us-ascii?Q?0kSA5LzHWehZJ6B4E40MVVkzUC/eqU3mFFDw+W1LPYkeaonbXsDQ0C7Bfnmh?=
 =?us-ascii?Q?h2ABIlu0fC4diksblbpe2+m07UolmlrgAX8EDfuQYhFDkA2qVPZYB3JEbwJJ?=
 =?us-ascii?Q?1LohCrV2wz3Ut8MVcDyqOdMT2wjOqfayKedpEgjQ4yeHWsp65p+S1ox+v/cJ?=
 =?us-ascii?Q?ZUN9wLzna4M3v6qxMxdmhIc+PIzZxDBncUUR7Xr0UlcqnvbyaCEZgjO6Jr7X?=
 =?us-ascii?Q?NApS86R4ta+BbDoDZOpJk7o5ROhyUml4idvi9gp6/R7Ki9waFhDsIzXPCY0W?=
 =?us-ascii?Q?sluK8lgCnA=3D=3D?=
X-Exchange-RoutingPolicyChecked: l+KLQtgZdzRGUWRPlBqFxCPuJeP42c5AfNefSQdd+H7cRiRMEcxaLfOae0j2/ROxkYlZ/Ect/oVdi4+gnqEXz1TzepRrCT0YVdTE86iYZ6bvURLdkoewVYilf/k4vrXzWyIQdlive1d16Knx7HmCnGsZLUpDmMhu2LsQAiOZ7cGzr+n3RNVOAF94JQps93A1aWZnFof/oIStFn4zmFamWj51RzFZ34Xmaokg37UFWyDT8C85LnlPfR67VlbPdVnyM+vj2Ld3eRYtpqHQjupYWTgzcdqfgKU/WkotVcnGqHLru2+QByL+PnhSX//BXet+ifiZ7uQc9LSCPgY1SYDXmQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b955c56-3b73-4e65-9601-08ded234be2b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 21:08:30.8622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CW3Rf9Y2se77ZOEA0LJBQMLl4WjgZa3Ni20Wtej2QZuDy0Bri/GeJcOTHg4nIF9WqUMqYeCER93/a9n+u3Aufg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7651
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

On Wed, Jun 24, 2026 at 02:07:13PM -0700, Matthew Brost wrote:
> On Wed, Jun 24, 2026 at 11:19:44PM +0530, Himal Prasad Ghimiray wrote:
> > When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC for a BO VMA,
> > the code used it as an index into region_to_mem_type[], causing an
> > out-of-bounds access since the value is -1.
> > 
> > Resolve the preferred location for BO VMAs directly: local VRAM on dGFX
> > (using the BO's tile placement) or system memory on iGPU.
> > 
> > Discovered using AI-assisted static analysis confirmed by Intel Product
> > Security.
> > 
> > v2:
> > -Fix null dereference
> > 
> > Reported-by: Martin Hodo <martin.hodo@intel.com>
> > Fixes: c1bb69a2e8e2 ("drm/xe/svm: Consult madvise preferred location in prefetch")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 25 ++++++++++++++++++++-----
> >  1 file changed, 20 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 080c2fff0e95..32ded13491ca 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3255,11 +3255,26 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> >  						    .request_decompress = false,
> >  						    .check_purged = true,
> >  					    });
> > -		if (!err && !xe_vma_has_no_bo(vma))
> > -			err = xe_bo_migrate(xe_vma_bo(vma),
> > -					    region_to_mem_type[region],
> > -					    NULL,
> > -					    exec);
> > +		if (!err && !xe_vma_has_no_bo(vma)) {
> > +			struct xe_bo *bo = xe_vma_bo(vma);
> > +			u32 mem_type;
> > +
> > +			if (region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
> 
> Shouldn't logic more or less look like xe_vma_resolve_pagemap which
> picks the region based on vma->attr.preferred_loc.devmem_fd?
> 
> So roughly:
> 
> mem_type = mem_type = bo->placements[i].mem_type;
> 

typo: s/bo->placements[i].mem_type/bo->placements[0].mem_type/;

Matt

> for (i = 0; i < bo->placement.num_placement; i++) {
> 	if(mem_type_is_vram(bo->placements[i].mem_type) &&
> 	   vma->attr.preferred_loc.devmem_fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE) {
> 		mem_type = bo->placements[i].mem_type;
> 		break;
> 	} else if (!mem_type_is_vram(bo->placements[i].mem_type &&
> 		   vma->attr.preferred_loc.devmem_fd == DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM) {
> 		mem_type = bo->placements[i].mem_type;
> 		break;
> 	}
> }
> 
> Matt
> 
> > +				unsigned int i;
> > +
> > +				mem_type = XE_PL_TT;
> > +				for (i = 0; i < bo->placement.num_placement; i++) {
> > +					if (mem_type_is_vram(bo->placements[i].mem_type)) {
> > +						mem_type = bo->placements[i].mem_type;
> > +						break;
> > +					}
> > +				}
> > +			} else {
> > +				mem_type = region_to_mem_type[region];
> > +			}
> > +
> > +			err = xe_bo_migrate(bo, mem_type, NULL, exec);
> > +		}
> >  		break;
> >  	}
> >  	default:
> > -- 
> > 2.43.0
> > 
