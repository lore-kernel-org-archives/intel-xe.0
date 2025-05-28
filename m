Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7D9C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 23:11:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCFF10E19A;
	Wed, 28 May 2025 23:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDqCFvvx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C421C10E19A
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 23:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748473866; x=1780009866;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V/zWiv7zmiPv2V56ebAzH7DwW26vA4KD83ZfOBUHmsg=;
 b=eDqCFvvxrp1QqK+jBjMLUliyug90TLAGFj4Ab4BNjwCY0TVg2LqA11jY
 0c+JUlXatKfb5AjRFYSkl/CO0fiJVyiLrG8p6Yk/nbPy5ClUC+vFB51EU
 qEm7pZ0fugwoxrVlOX6bwYtc+cf1iELjPOoZorN/nv9osqK791j/aweN/
 hmx5eodG3QacSmbDC+u9Rv2AbF4Z5er0bGTn06aMVscANFVXnVEcgbxr0
 +RfbuUriRwZvz3TE7ykJ+KB+Qe7nnv+CiUWu4mU26M2u8ZOXUUUiCGp/t
 rqJejeopLRawjWKaSK1fxtWHLAwQxgVH1yK7wdb0u6+juv25QHRi+yUu5 g==;
X-CSE-ConnectionGUID: AwGdcNJ7RoOWIRj3W7jB6A==
X-CSE-MsgGUID: VBT4kyciSJeGOxu/f/Cbfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61154046"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="61154046"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:11:05 -0700
X-CSE-ConnectionGUID: rfgG/08xTAChpLyorU/jRA==
X-CSE-MsgGUID: dhMNzDF+Tt6m3piy6KMtCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143215149"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:11:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 16:11:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 16:11:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.80)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 16:11:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoujGnMWg7aaXeVv+hh/k8jIshrST8qyM/sgJXHvbNHl7sl5uliK7fMafn5SqPgXxrRLZg+4fwXZe43XKQk0XFfMZ+dMtyw6IQAGSPDgRosfnXkKh6rr+i8WZAe/i/efFrkAHhBU8tu/+BOOC2Mgkk5ZzNhQpPNI2PLuYqDcrNDNBreE/Xf6fnCn6zjxZLlvamoOw0GBG21dL/raabWqXqZZRhPSNFU8Dd9WvkctFKY14vEi9r42RpldGCmzuwiZ+fEg9VjG8NMG0/+M307WXnRhRgs+tLApNTPVhZTMbogQ9NKlw56+Bn7bWELOoCnBa+/jpSjinW7puWjb++AFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WV1JfVuKCQcve3Bexl3bp4NgtiSYmu85WiargAfRYM=;
 b=ftcRgib9jXZjh77d+p8I5RPOATw7lQuMJsOM8N8CfYKWwgM06X8ZklIuWuXB3FsTCepWl3x0Zu6jq2SjF7v5FQdZVhn3cc+dLYLOyFMJBgG0n3iQRW5JW6wViexMIJFCM8skMnknum1v39+lLJ8fkUT94nQJKIeePYLWtGekg/seT5LxtilTba4s2wqUeZuwjNi6LAmaXolfWxKtE2gJ8bSze876zD8nrZLKcsUL2ceiwU72qyg1gxa9ogyXZ30vp7ox1yzPm/tfUKH0+ItCaXsC231+JlKDgcP7hhPXFk6/jrJJBdVNdlAa5cEnKH54CQlzZrLi+lNb5lxewLJciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8071.namprd11.prod.outlook.com (2603:10b6:8:12e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 23:11:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 23:11:02 +0000
Date: Wed, 28 May 2025 16:12:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 07/19] drm/xe/vm: Add a helper
 xe_vm_range_tilemask_tlb_invalidation()
Message-ID: <aDeYYU+vwvc1fzB1@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-8-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-8-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0305.namprd03.prod.outlook.com
 (2603:10b6:303:dd::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: faba08c8-13ed-4fd5-fa4c-08dd9e3cea6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VVgxGL0KtyR9eBLB/kDWFz0lakKUS7UtK4XQ56MscyhhTDZhTdzM8dLJysEI?=
 =?us-ascii?Q?O11DFQa9aeo4c3v6HYZmpaZO0/rpXQK6D7oMlAG5JhSAPNtzAVcJ1sTGNGde?=
 =?us-ascii?Q?2VfiY+HZEqmCwCanXBDSZo+j4wamYTxASkx5WHoKVP0VhISY/ObjZBXvtTgE?=
 =?us-ascii?Q?P81ZtznSdVLMMyKiz3Tr3DSbiPTDRwIdxxBCOcUxeibTQud9AXmmxegksDuX?=
 =?us-ascii?Q?6QlpteaWtFgkLoQDk0LG0rq93q2tkpTv0rAbH7wcz9cFXyucJJCeF9MDyGcW?=
 =?us-ascii?Q?1VMf2fSB3yODLx7ZL+AnUgUV6Y8oF6M3Mi/+Ll8Fl4YU+bdJdt0//M6e0hXe?=
 =?us-ascii?Q?8r2RblLNmQLYcnLr0ZeHE8N11rSiN1j17CKXQ1ABXs6Rjn2T3DZ6EoFpxd6h?=
 =?us-ascii?Q?kO/UfWk17+g9bnYJZ9P2RJtiC+iOl+mmkxMasfE69Tq18FqiXhXrr9Sa55VT?=
 =?us-ascii?Q?bsW0OkGebNha/aNHP3JbViMP5eKXF4FhwP/+l/5CXM6rgEIWO/nYJNsZ0o8U?=
 =?us-ascii?Q?s+26C5nnScmRfSu97Vl/GVr8FGyYDVCLZVsbP2cmOQ2pz98AmKDrxPBXMqW7?=
 =?us-ascii?Q?oG8bvdYWz4vUxv/V7kMTKl00UqAoxSGluKhkO5F3XlYkrFw+nuKwtiDSY5iD?=
 =?us-ascii?Q?i5ZZSJohOli2Xa5yIwk0COXvPPILNjz/OWljeJEfTQpx784MOfoTJfu6BYsy?=
 =?us-ascii?Q?EoqBp/EjLT3Z1YXVZUaxSy0eUa/xz4Q9jWUiRwgbiB5HjKIKrprnQ4c0Al3g?=
 =?us-ascii?Q?I2G/FPeEj/chyMynI0ouZUC+Hy0H9+ZmKP5d84f21eNlRFrIzfkwUeJJF3Aw?=
 =?us-ascii?Q?rL6ItNN18CNNh54LTsdA9mftwEwUxfXw3plWgjtjGkV8B4dFw+R4X8TCtTpm?=
 =?us-ascii?Q?/6xUovSxvvnLe4yOFxnPREunmoGrVFrVTQ8W3cXsQ77D94JhsgwEisdDRMJu?=
 =?us-ascii?Q?0WV5fkEO8rjf0NGVsmdJu4z+0P15XK7S47UwDiDXcAx7egog7W75yVs+jL8g?=
 =?us-ascii?Q?3huf8SEiaDfvX3MwQxV+JqsvSNnw3y7nNopf+ZVExck8U2r8//b+QEatKUF+?=
 =?us-ascii?Q?SuRNOEdQLV9O/z+nsNLSeCoQAQX26OGb959PRUmJurZweNlqIHail/Mz98Hf?=
 =?us-ascii?Q?XGUM6Z46n9BDNLqxe07TXsu5tXChI/yTra0E4ywLyzlfRetG4ORY+Ho6FkFZ?=
 =?us-ascii?Q?2GLVbBVHFEtog9nCuhqrL3MhZy4KWFpSG5Nq91+9oyFfEVTXC6fSSf0Y6DpX?=
 =?us-ascii?Q?i0ixslNWlM/W17nJ8LXqEW9oNE7RJOXrLzhgImY1wcvwEve0wcCA5e/zTGAd?=
 =?us-ascii?Q?o6+NMgFbFNLeOgl7sU+YXFJ6gmieYgh8/q1TeXK6RevSQJtcMuM2Pi4n2NEi?=
 =?us-ascii?Q?lxX8F91mu5B9jyTM9T20AoZOQ3TaHXmw4ABfmifyC9jttubfvTKhjcs23lfk?=
 =?us-ascii?Q?AZ9JIUwxCqw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vKeqgL054BTV/CBJAFx9NaquyHmtfARemdhqBGhZg7J8V0WIgCbdkl6fKZK/?=
 =?us-ascii?Q?g785snfYoXsllf/G3vnmI6h55zkustUzoqxIbb4SDw/NhSf8oQbrD2NXu2G1?=
 =?us-ascii?Q?an601qgOn6G/9TxiwqcJKGY4jwgmvdgl2Qs9jUdL1JuUt0A+UlUwHR5Azrh1?=
 =?us-ascii?Q?iN5zz9UsnUKZir2vNZyGFZYtBiweQXSPCmik0hUE9LCwnAbK7bUjpBELsk+f?=
 =?us-ascii?Q?pzRfpU/W7cAiY8vtQ/13I4JvFbnJ6qxsFBVI6KHi1lyFTnE4FphEdWdG7hr3?=
 =?us-ascii?Q?eh9woUV+cbdKo4fXalNbc28VtHELPS57eJ/bIJYI8wG0Ulz2NPO8xRoE9nKC?=
 =?us-ascii?Q?cT0Kc7ZG2E3YOW5Rby7El30gPRQTMKsOgAnDMeGByJ0NX6AAZeFCoes0umTK?=
 =?us-ascii?Q?W4UOH+S/TTxskJiUoOEMx45lgn9Crxj6jZzZMvfW8T7PsTja4gyCjRIdYDVa?=
 =?us-ascii?Q?cegoVQjj3KbAug0QRGbaNF6PTmPqmks2TZnit9BoUgS+oNTJ+lz3Fwbug2OQ?=
 =?us-ascii?Q?CLE2KTBps+eauoMbAwK2ba6PHaXIduA0b/7vuW7+vZvSvGDv9JOUSv/Jwf5v?=
 =?us-ascii?Q?TerF4IO+fOEqHUVAigg/XEYffnL2BM9uziKYTR+0rqoM6F8E9J9hU+LiOLb0?=
 =?us-ascii?Q?0TN6YikqjTbcAEd/9yCx7mWm8VfHbSIEmkAmKC8iJZvP8+Vex/4Py3Dk0wvF?=
 =?us-ascii?Q?fdjZtWft81ONew0LBSbsFPuj0jdRDxYkmHijmGkguVeu2+bx/eKjgPyFt0Yg?=
 =?us-ascii?Q?1q9kxNIfzCXugY0mEf07Zv1BA3pYh+z7bF2XT2kFwl5u3rAVIZLrC8jdjjd3?=
 =?us-ascii?Q?ELhgPChjwV+7aX2tf5khVtNeHbauvWtSYk6YHsYS7oXzlbc9CAAMtCez1kPs?=
 =?us-ascii?Q?1N4URFgWp4S+3/4+JGiC3fH4XKwLxk/umBH/jM00NISFXvxhR4wiFMFrGAvG?=
 =?us-ascii?Q?A7Yb+MN1llcMCCQf2lRrDtKDkk4rMTfpd8RRKqj+iIUjg3iRsTdYf6HK6JIm?=
 =?us-ascii?Q?Fij256mUqdm4GucKQ91CwmtXruCoZZ/Pk+6PsJfsHddYkk1D41ZoqbbstGg4?=
 =?us-ascii?Q?xS27fdUO69hBHx3QTW2er4TLEwl1Hd9UJlbxV3sS3sYHimd2+nN1W0VSZTym?=
 =?us-ascii?Q?hRREtCL89jZP3OXbqCVVHm6I+PliUnQNkVthIW6c/pJV7V6o/dnrtihRwNQa?=
 =?us-ascii?Q?JuH14vVRLPd2mA8zJyZi3e2iNj8XKmcybDvc4L6LxHmCFt+BTAxBGTQ4uJrD?=
 =?us-ascii?Q?g2Iw5T9lebzceT3oK81AVuhfuOqR/oxPw1S7ff0Vb0AXT08SYT7h2F0wGaUv?=
 =?us-ascii?Q?LFmg/QUz5281byh1FLsGAXHnMQYjgLESZfMn40GvTpwi5NkBY2avU4K7D7sb?=
 =?us-ascii?Q?K6MWI+dLRXyn49mI1urDnIvisfoi6L3d7Yk0FAezz3t1ULJGGqJZ+Aid+9fO?=
 =?us-ascii?Q?Jbd4sMYQ9Dy1G+YQC6N8ktwi6xrbv1XTnA1lRqsnf/gV+wxylGX1qeSL2fmd?=
 =?us-ascii?Q?VuwTpmK0c4p30BGa7O++QSZqljjhEguwY+YHZFosGk0xCTRTLXTOu/xCSN1G?=
 =?us-ascii?Q?IO+6gRGuFxfE+FbdAFWaJrutw/SA9YHu2XmL8WpvgvnfievS7kWmXZasF3t2?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faba08c8-13ed-4fd5-fa4c-08dd9e3cea6a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 23:11:02.5807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: te1tPdiLevSotlyRvw+Rmn8JXgz7xiDqnUK2sgzAL12k5pRdfP+7p8XKCHZPkyLddgGHg1JU+T57uVZqEmsdVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8071
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

On Tue, May 27, 2025 at 10:09:51PM +0530, Himal Prasad Ghimiray wrote:
> Introduce xe_vm_range_tilemask_tlb_invalidation(), which issues a TLB
> invalidation for a specified address range across GTs indicated by a
> tilemask.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

A couple nits, but feel free to post a follow up as independent patch to
merge ahead of madvise.

> ---
>  drivers/gpu/drm/xe/xe_svm.c |  43 +--------------
>  drivers/gpu/drm/xe/xe_vm.c  | 103 ++++++++++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_vm.h  |   3 ++
>  3 files changed, 75 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 871ac81bb04a..59e73187114d 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -167,14 +167,9 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  {
>  	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
>  	struct xe_device *xe = vm->xe;
> -	struct xe_tile *tile;
>  	struct drm_gpusvm_range *r, *first;
> -	struct xe_gt_tlb_invalidation_fence
> -		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
>  	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
>  	u8 tile_mask = 0;
> -	u8 id;
> -	u32 fence_id = 0;
>  	long err;
>  
>  	xe_svm_assert_in_notifier(vm);
> @@ -220,42 +215,8 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  
>  	xe_device_wmb(xe);
>  
> -	for_each_tile(tile, xe, id) {
> -		if (tile_mask & BIT(id)) {
> -			int err;
> -
> -			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
> -							  &fence[fence_id], true);
> -
> -			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
> -							   &fence[fence_id],
> -							   adj_start,
> -							   adj_end,
> -							   vm->usm.asid);
> -			if (WARN_ON_ONCE(err < 0))
> -				goto wait;
> -			++fence_id;
> -
> -			if (!tile->media_gt)
> -				continue;
> -
> -			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
> -							  &fence[fence_id], true);
> -
> -			err = xe_gt_tlb_invalidation_range(tile->media_gt,
> -							   &fence[fence_id],
> -							   adj_start,
> -							   adj_end,
> -							   vm->usm.asid);
> -			if (WARN_ON_ONCE(err < 0))
> -				goto wait;
> -			++fence_id;
> -		}
> -	}
> -
> -wait:
> -	for (id = 0; id < fence_id; ++id)
> -		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> +	err = xe_vm_range_tilemask_tlb_invalidation(vm, adj_start, adj_end, tile_mask);
> +	XE_WARN_ON(err);

WARN_ON_ONCE

>  
>  range_notifier_event_end:
>  	r = first;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index de6ecff237a6..d60b711e97e9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3851,6 +3851,68 @@ void xe_vm_unlock(struct xe_vm *vm)
>  	dma_resv_unlock(xe_vm_resv(vm));
>  }
>  
> +/**
> + * xe_vm_range_tilemask_tlb_invalidation - Issue a TLB invalidation on this tilemask for an
> + * address range
> + * @vm: The VM
> + * @start: start address
> + * @end: end address
> + * @tile_mask: mask for which gt's issue tlb invalidation
> + *
> + * Issue a range based TLB invalidation for gt's in tilemask
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
> +int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
> +					  u64 end, u8 tile_mask)
> +{
> +	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> +	struct xe_tile *tile;
> +	u32 fence_id = 0;
> +	u8 id;
> +	int err;
> +
> +	if (!tile_mask)
> +		return 0;
> +
> +	for_each_tile(tile, vm->xe, id) {
> +		if (tile_mask & BIT(id)) {
> +			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
> +							  &fence[fence_id], true);
> +
> +			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
> +							   &fence[fence_id],
> +							   start,
> +							   end,
> +							   vm->usm.asid);
> +			if (WARN_ON_ONCE(err < 0))
> +				goto wait;

Let's just have the WARN_ON_ONCE in the SVM code at the caller - that is
the place where we can't really fail and warrents the warn. 

> +			++fence_id;
> +
> +			if (!tile->media_gt)
> +				continue;
> +
> +			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
> +							  &fence[fence_id], true);
> +
> +			err = xe_gt_tlb_invalidation_range(tile->media_gt,
> +							   &fence[fence_id],
> +							   start,
> +							   end,
> +							   vm->usm.asid);
> +			if (WARN_ON_ONCE(err < 0))
> +				goto wait;
> +			++fence_id;
> +		}
> +	}
> +
> +wait:
> +	for (id = 0; id < fence_id; ++id)
> +		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> +
> +	return err;
> +}
> +
>  /**
>   * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
>   * @vma: VMA to invalidate
> @@ -3865,11 +3927,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  {
>  	struct xe_device *xe = xe_vma_vm(vma)->xe;
>  	struct xe_tile *tile;
> -	struct xe_gt_tlb_invalidation_fence
> -		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> -	u8 id;
> -	u32 fence_id = 0;
> +	u8 tile_mask = 0;
>  	int ret = 0;
> +	u8 id;
>  
>  	xe_assert(xe, !xe_vma_is_null(vma));
>  	xe_assert(xe, !xe_vma_is_cpu_addr_mirror(vma));
> @@ -3893,37 +3953,14 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  		}
>  	}
>  
> -	for_each_tile(tile, xe, id) {
> -		if (xe_pt_zap_ptes(tile, vma)) {
> -			xe_device_wmb(xe);
> -			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
> -							  &fence[fence_id],
> -							  true);
> -
> -			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
> -							 &fence[fence_id], vma);

You can delete xe_gt_tlb_invalidation_vma now as this was the only
caller.

Matt

> -			if (ret)
> -				goto wait;
> -			++fence_id;
> +	for_each_tile(tile, xe, id)
> +		if (xe_pt_zap_ptes(tile, vma))
> +			tile_mask |= BIT(id);
>  
> -			if (!tile->media_gt)
> -				continue;
> +	xe_device_wmb(xe);
>  
> -			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
> -							  &fence[fence_id],
> -							  true);
> -
> -			ret = xe_gt_tlb_invalidation_vma(tile->media_gt,
> -							 &fence[fence_id], vma);
> -			if (ret)
> -				goto wait;
> -			++fence_id;
> -		}
> -	}
> -
> -wait:
> -	for (id = 0; id < fence_id; ++id)
> -		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> +	ret = xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma), xe_vma_start(vma),
> +						    xe_vma_end(vma), tile_mask);
>  
>  	vma->tile_invalidated = vma->tile_mask;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 99e164852f63..1ef98113fa5b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -228,6 +228,9 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
>  struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
>  				     struct xe_svm_range *range);
>  
> +int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
> +					  u64 end, u8 tile_mask);
> +
>  int xe_vm_invalidate_vma(struct xe_vma *vma);
>  
>  int xe_vm_validate_protected(struct xe_vm *vm);
> -- 
> 2.34.1
> 
