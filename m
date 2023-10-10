Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222E0CD8CB4
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 20:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E435589BAC;
	Tue, 10 Oct 2023 20:15:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC2389BAC
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 20:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696968952; x=1728504952;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xWrp94BUpNZzfgmG2AB4I7+kED+Mjee/oAvRGSBlPAU=;
 b=VA9Bc6Sr9JRyv4UppWW3iFRAxO43xufTtzeUCg6hA+k+K71/giqo7Ln8
 yJtzc8uubQkx95bX9vR31QaPXnkZTFr16+I/kVOUL/HVNzjweUV7yNtiN
 Cu+vd88dZ0IRPgP4MIIiDeg5Ymjx1ibI3n4/Qi7MzgeAE872bhqH5KUx3
 Mi7ZXXuoE0xd6CngQ07n+70mmO4LMSEgEQu99CsTRtka33fB5qeW6FMRj
 IhsLU13MN34fQc5u6tD5rCyYCdWaSIlQlp7Z5CNMGUWgbCJcAzFW5Ir8S
 93yOEIQ8aZGO2H093l87D6owkVRzMTi5YDqy67tP9/Z/O54tnpbpYLbmC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="369556774"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="369556774"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 13:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897341000"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="897341000"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2023 13:14:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 13:15:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 13:15:51 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 13:15:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+AeqLA685+f6OeCCK95z/t79wHofX3Y1y29XyCo8GRimQdTrfzsdDHa0mMhHKkKporeetH4VUOrbn1n1WbfC7jb7muOCzcahBKqOF88Ty1MJmHwQXEyAPMtklG3B388olihgsDpNR4TR/GjQUkial1Nw9ONFTnCMMmziAbFdiyLyAhdw59vqqxDk+h+UxLriyP49yTUiYpzuWUgZDdw5hAH3i9A5/M453jzEUqYyPXWkQMCGdxGMUyVRy1Xv28xKsVbVGqefdddP2cIpIZYISOUtbvuvwZLEdNER618ZXutdm2Az3y110T5W3MT4GYJVO6L0+MsoZH2Z9+//A6+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02hVbFM1jvhPYFQRVmn48ZVlY9Z92/CadmLTmN1l0XU=;
 b=irIGJVRnnVGIvkRljS3J+Ja5mMMaNql4nHlxzW/+phtD/Tnbliw6rjyvw+cCiX3j40dnvatiAwuxIGMfBhprpJ5Rgw+IE3YX+Xpy2KP3Kka3jn/sJzKC0OmcfDhlS+slwfCndUqPZ8v2WHcRr35N+mvQsH6cM3py/H5DEK+xvaGA6mGgSb2s73JDhWN1xO7t4XhxRpkrctGr7xk/dgBjGAO2iVLc//7fFd+4CXYu5V6pXXOI1SPR7m3rF863Kt3d6RaHzXzqnsXISkiqeOecaDcJDiQCMyvUkufgI3nQRYQjY/9u9cAfgVajaSgwwJuVBkqC+VVYXB1GEDA19cxF0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7193.namprd11.prod.outlook.com (2603:10b6:930:91::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.38; Tue, 10 Oct 2023 20:15:49 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 20:15:48 +0000
Date: Tue, 10 Oct 2023 13:15:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20231010201545.GC21382@mdroper-desk1.amr.corp.intel.com>
References: <20231010200256.126815-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231010200256.126815-1-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR05CA0114.namprd05.prod.outlook.com
 (2603:10b6:a03:334::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: b115597c-1640-4e67-0e8f-08dbc9cdb168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XkqJtihoKWwf80yfU8dc+777YDXB2rWVx5pyj+ImBuzulxoya7gW/w98T5cUhDJ5S49ADgKXgXcSvrMaGtd/6uuJRUpIESEVgnu8URnXwgEPPDGtn2E/gASG9zEUb1Z141sHM9spfWZkeSRJE3tlPl6AtFIbR/ptR5+/2EVogqp4TCS0HDcIXnhOXu869lIoCNkqshS5G+7aX/lWMAkRtfk/iBXpVkh6eFMDC8SDS7Qis+3TaQVKxe+GlXKvuYgy11A6RBSzyN6RNryLZoA7p/jQOyJ8d5x29CDpVAgojR+VeLGMXB6QmyPlX4pq+od+KjLwvswyyEYtPHoHrsxSN+UvtXEcf/GM8xwCa7hlsBVK6zKJSqd3ZMgYPialn2uvbmX/sjA+qWKN0wKcprqxIj3RS6KHI52aCUA91TYIUot7kAVof89f6AaDlpqMi1utOBZMjIgHlPn7tua719numhqW9x1bp7STOCdtuVDNY+sESvRESuNrwsaYASdWlMxZGJHCLtDJT0X666l9LEi7Ycszs77+pzg/q4IW77cAmp8tLZ2qPr5AZUD11q9eHNOo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(107886003)(1076003)(26005)(66946007)(66476007)(6636002)(316002)(41300700001)(66556008)(33656002)(38100700002)(6862004)(4326008)(82960400001)(8936002)(2906002)(8676002)(5660300002)(6512007)(6666004)(6506007)(86362001)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dWl93LvJa3X0mp20aWqBRtdglCQr+q8J5fb2AUa+SUot7LpM70mkUKk9G8?=
 =?iso-8859-1?Q?7a3P3s0u2MaILWhKpb/tcYNiL5IijPfMAIX+FcnQCJ2yGW+7CU17A8em60?=
 =?iso-8859-1?Q?1oq3YCChKzyPt7djHiYboYvYcGkNUcq5RTGByyHwkV/P2C0nFJwMbnLB7M?=
 =?iso-8859-1?Q?jopOKM48FGtwoQ9zX659lJEMG7N5wIOP3aXqqyDMYAx90phwcx6rVGDKY2?=
 =?iso-8859-1?Q?pLuvihjiC/GoRG3YzVpPAW/wseTDWi6jhoRAAP8/0miP5LbFJR6an86I8Y?=
 =?iso-8859-1?Q?ubRhM1gOoOELBKDiHEoB0VrU0RZ47IqMV9jXIVHHdpYrVCKdO3/tLv5qyD?=
 =?iso-8859-1?Q?kFpu0qjR7JKl/V0IRWsTJqVFphA+HmYambh6EWwPamzD5j0nXvmrqQN/W6?=
 =?iso-8859-1?Q?Nzw6rFD5tvQqLutMm7k5lG26aRm/LwVrvv5VVc1gB7JSDEsb3H6zFhD2ID?=
 =?iso-8859-1?Q?/5k/NDCTx4lwuuGMR9EXQ7b2mfPmj63/gBV2UEeBuNPSStyxIrMqr3A6+M?=
 =?iso-8859-1?Q?XS10vm8vKTYOL7a2/jYAweHSzdEogIgH2NNIOoXCd2DRjiABGGx0TX4i3g?=
 =?iso-8859-1?Q?AOpxe77wihyPzeSMQCiYqX9D11PArVSf3OWIoOy5cfXUMdpjm9Dk2dYDuV?=
 =?iso-8859-1?Q?LFJhHgdC8oGFnT3+gJ6Vc+Mk4ld7DNMVDTw8i5qF2fsP9RQxOUeRck/QHg?=
 =?iso-8859-1?Q?c9VmV0wk3d/NBG+eycO33X+yAjSRR5WIfKgTs+d9sIAaRJ09E2kaEpZ1C9?=
 =?iso-8859-1?Q?vkepdfi9qpU9QRaP6ZN/yxpjepBUd78VMeJz5wIi56xmYYdOReuZlzaDi3?=
 =?iso-8859-1?Q?5Z7cS8qBwESVERHzksTkcXritoEUTAeahy28AU8nzFlFK2Ly67wn3JL6Ii?=
 =?iso-8859-1?Q?aO4dMg9PV56jluO/sWnz/phYXfbS5c7KMKhfnamFWjAeR81x5SzwUkqi/M?=
 =?iso-8859-1?Q?RFHTj36Qqsvp9exlp2h1srZYGVRJ0QRIdwQeoUwGU0YakB2wWNPWXiIJRM?=
 =?iso-8859-1?Q?zpuRGNNVzqWlA7oeptDVbHMsaDEsycGWiZEymML65y85p8tUzNXnf+gAIL?=
 =?iso-8859-1?Q?1oiIOzWhX4Nm/gmmVqIaPYMlE0oo/rpE3mj2IWeAxwoliTSf/OkwWVW807?=
 =?iso-8859-1?Q?OI4ArR0xGYDOtf2hI8Vf2DLCZGPqkYs1UNpguX4WkiZOM1Mm4sEUhk4W1I?=
 =?iso-8859-1?Q?uQb20hFyvhPJxXvnhWUj4VeFC54g2IDGanDkiq+MFOGlLJSh8Q08kg4eOH?=
 =?iso-8859-1?Q?14Nn2Kq8ru37QOtmdiKOli6WPqSj1N/uMI0eMeN4xnsC9GPrwE+jpvockh?=
 =?iso-8859-1?Q?O7bX/E1fbOS2+KY8H1c7sVlf/C9KJfV/oIrMaDRiquep8OqL86Eu3Ka4cW?=
 =?iso-8859-1?Q?VhgF3DwrlZAXVepjXxeSD3egjg8RrpnB73dwzJ3rpC+8XwGd5ZAKBlG1kG?=
 =?iso-8859-1?Q?WlsxVOyk4g2k3s+uy23dwZGodCSE3abWSVE5L13zCBRXH/gEFW7pd+s/Zr?=
 =?iso-8859-1?Q?BJiJ7rE0HhknMDjhKH1CwJ3ALB3GUbZmubpUBrRhBAxAwKFBj84vdnQ9q5?=
 =?iso-8859-1?Q?ixZlgvfBjMHSCVpwBiQzq0zmYLGX4LcugMoXFJbLt3SuEfAeFE6n5pNBo/?=
 =?iso-8859-1?Q?CmlRoXMG9sq/sadYQ5ow/0GxE8Z7HAskWs423gHk2JBP6gmo1gIq+0QA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b115597c-1640-4e67-0e8f-08dbc9cdb168
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 20:15:48.6266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksUM8HQAnav9rJpiz4ebdEVB3dj281M/U9Y4e42lBw7adRpoxPscHo3G/quUlcRWHwpOwvK24Dq0JJQkIHxmul3WFJ2BgY/MrusWhzq55+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7193
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Set PTE_AE for smem allocations
 in integrated devices
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 10, 2023 at 01:02:56PM -0700, José Roberto de Souza wrote:
> Without this if a atomic operation is executed in Xe2 integrated GPUs
> it causes engine memory catastrophic error.

Technically it just causes a pagefault (which will be handled by the
driver rather than triggering a cat error once we turn on USM support),
right?  But since we're not handling page faults yet, this gets raised
as a cat error today.

Nevertheless, the fix here is correct; even with USM turned on we don't
want to be forcing pagefaults for igpu atomic operations on SMEM
addresses because the igpu can already perform those atomics properly.
Only on dgpu's like PVC do we need to trigger a migration from
smem->vram before letting the atomic operation go forward.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> 
> This fixes at least 3 failures in piglit sanity and 2 failures in
> crucible for LNL.
> 
> v3:
> - only add PTE_AE to smem in integrated
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f7553a2415acc..31afab617b4ed 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -628,6 +628,7 @@ static int
>  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
>  {
> +	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_bo *bo = xe_vma_bo(vma);
>  	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
>  		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
> @@ -649,10 +650,12 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>  	int ret;
>  
> +	if (vma && (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
> +	    (is_devmem || !IS_DGFX(xe)))
> +		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
> +
>  	if (is_devmem) {
> -		xe_walk.default_pte = XE_PPGTT_PTE_DM;
> -		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
> -			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
> +		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
>  		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
>  		xe_walk.cache = XE_CACHE_WB;
>  	} else {
> -- 
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
