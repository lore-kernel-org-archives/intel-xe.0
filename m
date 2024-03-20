Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A035DC54E68
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 00:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516AB10F238;
	Wed, 20 Mar 2024 00:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQ9YnXfQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A8A10F238
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 00:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710894911; x=1742430911;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9CMiZbMm1bCo24REA4fBO8kMmTEJ8DiidGath2uSNnw=;
 b=GQ9YnXfQAVtlNAHPZkIiEKw2+1q9A08cp958t+yHqOgRoSfluIG8+hnh
 2qnk3+4dwzXEViVcqhbrCNi6H/SY0jJTpTiaHrJDkbaUI1Tpyo6mhCyBH
 sAHBwVs9qSn0iO/P4dOLYg5R3dhafXOfgfG27Qq/TBPkZQ/O63QOCCgp+
 bkefSRzzY1fAPTZ6Khxnir11PuKo2i30Ukk0v1XhotuToiUkeeg6cSuz7
 Z2QZItA8aoIoZm7qPsv6II4tMKa6xhTrKlBobEKjMEgDu03JtGP6qjrlP
 a0zsNipBh2iTsaZcWM26T4Bof14pTZJcR49HXqbJ7GuegNcgQP9Jo0q81 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5666210"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="5666210"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 17:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="14013065"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 17:35:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 17:35:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 17:35:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 17:35:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSm8S+JXoNNduQwRK7cNhf5wH7Gu6puDYXhUAynCy3MGXiml6u1TTNcP270yUkxJLRWu923fnTDqgaRixZ1Ho7wG3CghEqNyMiu18FXqVzEAacxUpQng841rBvZYSVPXuoBTOLE/hFbtUnUYeDzAuA99zTetGTiA7i3J2VqEozx74fhkoOWtlOvlADhCTfbkGJUi8Cg3Eaff9D8Nzb4Hmdag4JmJ4VCEEhKUouYJeteNM7u62iaZ+/qqJXUqR2ZWZkzjvAidifNpgNPdzdN2i9R1oNrTCTrKNk5YSqLtJAF6VZUrSHqYLqMWpuUq9xdUsAJNn+ABxM4AJohtWpLPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yI0CtCdFijhRzSpqswqp6PQjX6iLM0oPk1SYeiVpIrE=;
 b=h2XJWuT+o1wtY7Y8lPDNUgfT5kMOpf95PhL5eqVIhrhcxmPRzjF53GCCXBjHk43TU2EbCVyZQXwhjXX/AxeS98/yP/vaqaFYOb2TrbxpeZyG9bcM8wpWFphEtCvizhmPhIMjHyFCxIr+DDXxVzCkhBdlWqZN+NQHWz32lidgS6R6+uVOoZUOPfCtgPhTLH9pSHMTdakJbKGVsARkifTmvh5TJLHMzSyVMnEXSfa8o5NsEYHOU44P0ON3oQlo+DT/Wz2sEAl/n6AoEwlyMrMXu35cUnX7bXfQkNruasSQDUj5hIFIOM11CKEdI96Uwv6Q5s2J5Dwm1uTR6mkPqBXnmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 00:35:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 00:35:02 +0000
Date: Wed, 20 Mar 2024 00:34:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Streamline exec queue freeing path
Message-ID: <ZfovI81GPOS4ZceA@DUT025-TGLU.fm.intel.com>
References: <20240319175947.15890-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240319175947.15890-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: df3dae48-bb5a-466a-7f9e-08dc487594a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t1OJVqCz9MhXZp112mmWTvT56/0dAirPYihLjETfeB6lSPcPCn05UNAROSlLuCaow6G7sXOa//WMg8dCM517eTpIuNPNvaJuf1cBv9XWkSCngAu4cIkDzA501YxZqmz1IyQQclBVlsABuyoaBZxY8TgZ1G731G4E0Seo/pgV+Mm7yx4+0nhmmw4yHRP2GWe+RkJo/ALMnAfny70Aphl+YJAwLda6Y9t8z/+bQQ+zsGDJx+M6ZhVJdX1MyCPIuj/i5v7SlcRIIZ8T3P5CJwVJrRp9QiNm2Ga8pv2JOaCZYpb77pb46isHQ4Or6YCqMB5CSAZ6JsAmNLsEMG31p+BMHofd8C3TSqkoZ0P2G5eolgq0VWooWkWMYoTBss0SdBDWan1B7ZGb9/cIRxCsnoAaHjppcujiZtUg8kJEFftaoIFrlEGaYrCRBXppi7JGvSrLSAkdLrh2L9OTWdx4mPY8k8OrcEyyJDJP554hsKGVdgdvbmy7+02AVCuxkf/5d/ZGR02mnAkz45cs5++jvcSImzCKMt0z5A64VBxXnRw9ORKgYhxr4IZTKjA4elDtbzxnv2ZNlobl7QJXHsb7tD56ggH0oKBHMuDRXq23ty0BHyyLB5v9J4/5+KMqAT910yIXiCYO3lvAYsFg1K61FkZSVtLW1r9MBPOLohJSNuk0RpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dwSsiAOQ+fYh3zNpiBVzWGH2EKeu0cVyMDT+RkxPwRXOy/Rqosb4elUiK+KE?=
 =?us-ascii?Q?WgfKUJ2ep+QLYSJlI11eFiwW8ZbLDyDvXdCyS5ECj4JA7WO2XnnZuITD89IY?=
 =?us-ascii?Q?kv6jk8JHME6G9xi6ymgSjwaCdTMmMxBDznm1ghjIN1c6nVLVoK5G474/uNii?=
 =?us-ascii?Q?YB932ABw0Ni79vg8H8s0eSb7KPbHsbcY62cLZuITQdCCEfYFY6sUNlodzBZC?=
 =?us-ascii?Q?ZXZx4NYsAAWYJPtd+2DBO8C9zuD6RBAXmrYFbPUMnhjyotPzyNWL1N1Ra/5o?=
 =?us-ascii?Q?Z535tyKbvn+6+Nj4gtRB9e8GNqLfx24zJ1m5Iq/jlGqmoQixYmJp8Y9buZW/?=
 =?us-ascii?Q?dVdmj6q00rdiX0yj+b2psqJO3ZBOBuwpfj8+lk+0N5h2chmtd4d5Y2zgCK8d?=
 =?us-ascii?Q?zfuBJRw34e8P/wRP/BxnNo2hkw7cJYokxBVWFDOh1arQJ7K40IiZxv6KXBcG?=
 =?us-ascii?Q?vY8rX2pUh1SI6iMssB8F/B+MxfR2LsyBWVcMdEI7Jfd836VaeiJ6pGmga1gt?=
 =?us-ascii?Q?0ewFkIslGk4CjwwpX3W2HXAadICY9OZlYasMBDTOkn5wjkERj1S5QxSLsB3Q?=
 =?us-ascii?Q?jNxzEueXG13v+K1vvJfnv7azZmFfQ0w5mLSnEt9ubBlxeK2oNHCddaTDNodO?=
 =?us-ascii?Q?uawi6xzosI6sup5oR7X/y5biAKVSc7FWxtIz4YXVSbKLpRDz260Urlz2kaRz?=
 =?us-ascii?Q?J9HxWCXAZWYVgyz2rlnsGgV/fkB5zkAocZ4V4ulG358CMrWKV4XLEuvgugRG?=
 =?us-ascii?Q?QbQ1STDAHgyx+KVSSiQ3FoRtQy31ZlJw2ingH19+y3nOydaIqTj8/3Ngejb3?=
 =?us-ascii?Q?e8fd3CNeAuLLBx8E/hj4nFTVEaxciFlerGt/xLJEghh+M0LPLhoK1vTVDQ2i?=
 =?us-ascii?Q?KtSFcTKr4gxLQ79MgHYw4fsz7NoDnh9d0v+av2SecyfNHbsM5SbxiDiJxLpm?=
 =?us-ascii?Q?yHQNeIvrUH5b524GdYM4enChqzqpFwYxXGGl/t8KHj6tnfpNnzUmdolsWKD0?=
 =?us-ascii?Q?eCGDkBn43/ZmvOAtRO/Vl/rR6+QgKkwlunqINtgdb2xDP7sk31X9/ZhtS1JL?=
 =?us-ascii?Q?cYX6CRdAxmOGl8NkCLrMEGe2W/+aMpDy3MuvmtfC+MXHU0XsLJ5KbucdbZLY?=
 =?us-ascii?Q?g4X4AACY2ypnda9IA2wFcF4MGg40ZtOz3SAueN/X/GctprBDPRzVmtQrfElS?=
 =?us-ascii?Q?xVvm9spbW0BuzohnoH2Lp6iJyVjLppvillK/UAIZCnlaBbHRHWxaO28UWzb1?=
 =?us-ascii?Q?1nX1CKTwgHFUSgNRziCwNPumXl+TEVgAaMYh2aG51ptGe1RhIZIL3Usli4kr?=
 =?us-ascii?Q?N62Hu2i5pd750OO0txJx9WAor4IVxVr1AMDN33DCUfghp9Dy1qO5c79MZeZ6?=
 =?us-ascii?Q?1JKUAsIrOq0+IOIx46JR6Dmx0uYwSWVLC5LNcyG7s4SAW8gspFjj77EyCqIb?=
 =?us-ascii?Q?Xsbx8UhDd4niqv195/R5XfG/2AdaAEEoUiR6hF8yQsn3n8QdKQSjBIkbdOw4?=
 =?us-ascii?Q?MFzighgDHll2b0gcp4UmdkIicOtMYcMZTVC1ZDexoIOrWi0Tuvp9IWcyxUhf?=
 =?us-ascii?Q?7055SNx/JLZxwFpJmxdVUnBsESUEKfz4598Xc1tjq0PazGl27S4sOPw+nv8R?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df3dae48-bb5a-466a-7f9e-08dc487594a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 00:35:02.3553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtZKCQbMvB+1OIpoqcOazG1YVm9U3T6wIi6hYA/6eOQ4ffCVDpcLcRbAKTSau0cZzC2CKesrYAyaxrIzpTespg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8146
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

On Tue, Mar 19, 2024 at 10:59:46AM -0700, Niranjana Vishwanathapura wrote:
> Ensure exec queue freeing happens at one place, that is in
> __xe_exec_queue_free(). It releases q->vm reference also. Set
> q->vm before handling extensions as they can potentially reference it.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 2016c1af9633..a1b3c7144977 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -33,6 +33,13 @@ enum xe_exec_queue_sched_prop {
>  static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
>  				      u64 extensions, int ext_number);
>  
> +static void __xe_exec_queue_free(struct xe_exec_queue *q)
> +{
> +	if (q->vm)
> +		xe_vm_put(q->vm);
> +	kfree(q);
> +}
> +
>  static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  						   struct xe_vm *vm,
>  						   u32 logical_mask,
> @@ -74,6 +81,9 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	else
>  		q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
>  
> +	if (vm)
> +		q->vm = xe_vm_get(vm);
> +
>  	if (extensions) {
>  		/*
>  		 * may set q->usm, must come before xe_lrc_init(),
> @@ -81,14 +91,11 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  		 */
>  		err = exec_queue_user_extensions(xe, q, extensions, 0);
>  		if (err) {
> -			kfree(q);
> +			__xe_exec_queue_free(q);
>  			return ERR_PTR(err);
>  		}
>  	}
>  
> -	if (vm)
> -		q->vm = xe_vm_get(vm);
> -
>  	if (xe_exec_queue_is_parallel(q)) {
>  		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
>  		q->parallel.composite_fence_seqno = XE_FENCE_INITIAL_SEQNO;
> @@ -97,13 +104,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	return q;
>  }
>  
> -static void __xe_exec_queue_free(struct xe_exec_queue *q)
> -{
> -	if (q->vm)
> -		xe_vm_put(q->vm);
> -	kfree(q);
> -}
> -
>  static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  {
>  	struct xe_device *xe = gt_to_xe(q->gt);
> -- 
> 2.43.0
> 
