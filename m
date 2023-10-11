Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7300ECD6E6E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 13:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CBA10E161;
	Wed, 11 Oct 2023 13:38:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E012010E161
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 13:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697031532; x=1728567532;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OVntCOXrPw9JupvNegbACFAcuOiM7da1NGbUJbSA7pE=;
 b=Ea9f261z5tOwubM3fkFZmP3TxIwpGZKuqQyZmMPvegCNB6sKTEyYbkBQ
 ydu6LCuLIPtO0ARjJB93OgwvMKt0+kjGBne2oOJUKnsewgINhi6ZNBIyS
 o1X3zpbGOyloHof4JqCnChOm5McJ03/A5jAn7aLK3/mcGtz1eRV06+WOe
 /bV5v/YE//3eBRI2mWTUzmNh0yFzEr0KGUxtE0FB8LB2ux9CVY06l+KUN
 G17/3WR57lZO6UqdQtgvHk0rBlCN76RAnZSC4TRqZBhUrjaPRMM6RAUHL
 H8HTSrXwYZF65TOjq6v2oYSB5zo+BKvZchTnpOWwVkFXcJdaZOnbWYuWa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451152820"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="451152820"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="844565375"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="844565375"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 06:38:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 06:38:51 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 06:38:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 06:38:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 06:38:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzndHvrURJX20W7P1eC4DHR7dk74/M4rBYierQ64b6Y0h2tO7pWunW03sWdle3lJOUuU367N1DMFdbbS40F0iHLZ2mbvlBYp+r0VKt0t10VRjojOMI6o2GbRuiZi2w8b1RkrImXwFuDcuFu0ynAqcMTe68qw8VZG5kVM/kXiCbTLADwoil/SVFY/0Lo4WwPltoR8q+HrB1Pj3yBZoVA3UlxNMcTTky3HtxQ04X7oEj05p7k2qrwLQMzoTNPx2SJ+5kSIoIVFJjMwzaqJo93zc+oIWALJxRvY2/fZwINcAI8+iGgbLUF7RRUYnBjeel6R8I0Xh8bSMYXuz2JGxPpxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFKB+H2Sn35zOXFIZczApGdsZYpCVsDvmhXusjcw60E=;
 b=UWGGlbatR5kfPRCEZHO0NpX/jrErsfc6xmO8ApIokm/lwX9STSUVymfMBSBD0JpCapm0CxqQxJm5GZQARGkHUvIweYl7bJevF/i/l0Y0Z27ALNAW/XPmrODl3OhhsrESD1t3vVdX86MYt3eJnyaIdAEDHBU/0g2lrRxgTsNiTm60yoAihg97LkRjzqaNiQnl/qgQhQyrcLgZqWHOc+Rny+je66LDGB/4w/dCNTYofmsE/8A3R4XfzWqFn1dailnsAFMhcQVaAu9T23BYtYSZjB9o0BC9Fn38PEHVhO5YqFpBxu5h0Jo2NDNYfZk/9Zu80i3qPGwucZPx2UYP/M5BmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7716.namprd11.prod.outlook.com (2603:10b6:a03:4f2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 13:38:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 13:38:47 +0000
Date: Wed, 11 Oct 2023 08:38:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <fn77ce5mxdkkiuetx7u5g35njfrhy5vynxzlxku4zizr5o5gva@vfuyihfx5l5o>
References: <20231010200256.126815-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231010200256.126815-1-jose.souza@intel.com>
X-ClientProxiedBy: BY5PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7716:EE_
X-MS-Office365-Filtering-Correlation-Id: eb10b2fe-eda2-4cb4-0f02-08dbca5f652b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8L82D2zRKmYsaEA72piVt7x50ntDLpA5LqaqC1bgbwq7ipV8Wg11Fn/g6ZtAi7H8gii7xsQh8TB+sND7ygcmgPu3o/S4FRSuy+6KckKX3wT1z1fTw0zU0df1edA5qdTtuX7KdT6VmXHdD7EmEFCa4uoSc0lsdcIwq9j8g3eIU2QaE+gvqW7m2vmNr3ED0+JyBSJRTytqt1eTGHXFCjTtoQ9CiwMbPDWx+ZOkT122KkhJALVcBqNJNCyOhzrae8C5hG4Dq390jztciigNRoG+XFif7MuKEFwdd9IvZpMzt2zOMNCa+NIa/CUN4/AIFL753ZGPcybj83W94GyDozKOB5s6+GYCbwKdbMBCIfUY98lZDeobCCgjpEt17f/VlBVxdYM9pi+/cUNsVrVoutzLo1l8Jti7FPpNuaqWcekqbEX6zK4OoSS4ul71qNIivA1QZQWDjxmO7oTUEhKkRPQrrLwnhFwdPKM10hDZSV8CyKJ1Haq681bX8jtwIIyzKhlwnGkKLKbABH3jIU6wCwNusrFMUxyAmMwbhRNPQsjwdO6msRYRTpfBMovj5SAK9bFV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(376002)(39860400002)(136003)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(26005)(86362001)(33716001)(9686003)(6512007)(107886003)(6506007)(83380400001)(66476007)(66556008)(82960400001)(66946007)(4326008)(6862004)(8676002)(8936002)(41300700001)(6636002)(316002)(5660300002)(2906002)(478600001)(6486002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/A45x21JXkdCKwEp9VwxetOHFgDck31ni+VPMgTsX+vzntf47VoZ4bC+Rr?=
 =?iso-8859-1?Q?5nF6Ym/39F6WHwkFEej6L16/eaIKQQ6sgDzA2LrnE/VVDit/lj420NT9/r?=
 =?iso-8859-1?Q?J3cy5aPCw+VU4YePlNnvG7lMhOBdSXx1hsOEnfkmCWcbXkkSAOes+tqV7f?=
 =?iso-8859-1?Q?wTLTfw2CvgNNRFtDzj18BFO8Kzcg1bOrO5CoCJShe4zMKvc7v2akgjCJ2Q?=
 =?iso-8859-1?Q?J3OEv+Z6zk7wqBv+0N/R88hBKqdQugMhPk2tBo+5SNOqytzRhVuI4JZ88y?=
 =?iso-8859-1?Q?TFIMrqgiXu12IcPQ3Ur7tBo28PrgdpxM+pkV8GZGPRTspj7yb3D0w7BaZF?=
 =?iso-8859-1?Q?L4cQaXq2VLZHYoxAEwdmaCZz1WAVhCPJCTVRNCn0NegmLQh5CXqgYbxpX3?=
 =?iso-8859-1?Q?4VN2v5+DF0ukNb2zBXOweJA5IILa3lQvYiYXLXzoMBEL08N4XKjRYg31OC?=
 =?iso-8859-1?Q?67Wanf792DpSnkkEvo0RsE76kiSvpx06UQfbIWXKPm3wrAnk4dUukkQU9k?=
 =?iso-8859-1?Q?aCJWpmUmWaymtk5ycFMAy8s1sA0dIPHEiX67zYCN/fNtXp6sHtomO88gzw?=
 =?iso-8859-1?Q?2jvfbyexfYy8Abw/GCQdKIjANhSwIf0pzydkHQWvu+GIvSHSxpRx3kQJuX?=
 =?iso-8859-1?Q?q55f28sRrctAA++UucbzMaClAdbAvkdedhNwkurdi/HtqKv2jye0cnAtAO?=
 =?iso-8859-1?Q?dTfusONL+TcKXX29y+mEGy4TzfwYhReneZWwgYXxi4rNI9QEhZvKBRK9G1?=
 =?iso-8859-1?Q?1RsjI/JwUJ8GyBCPLf07pMiug6nHxdOksWkxI4RY95ejumfUKfQWmvEa+i?=
 =?iso-8859-1?Q?i+zDS3C/ZHVomkGNdIFV57C7MjE7ksF3HqPSzTHaak7pKWYMKiSfEO+NxD?=
 =?iso-8859-1?Q?hc9O4SuHjvNmD3c0AbrY+n+Uh0SSreA+QHznbVr4bNFgO7gW9WHC0chDOB?=
 =?iso-8859-1?Q?FYeuExjE89LHIV7oKEONjVoRRRt3xVR/F5Mk7q8tcnX1RNfS867+0EN3Q2?=
 =?iso-8859-1?Q?NO96nE22568HO/QcT11GxoIJDJBDyxRBcnEwV6ZTgu9pvdF/SK2WHveLaY?=
 =?iso-8859-1?Q?1fRxqp//94zZ+2eQxmHNdiao5Zz8dBx8TgAChSyZiE0OlQTQU6f3mCuRW+?=
 =?iso-8859-1?Q?qU2LlTC416Lh/OtweP/FFWEyFfYsU4WmzcMYLlOeTKIrZz97KNjThYn1gu?=
 =?iso-8859-1?Q?vVLKOT0QK7y8X9PhepX3oyb0NAvSHqlGtBCHyMntxBzAjjan+07sH/ZSt2?=
 =?iso-8859-1?Q?rdkjc0k+nRAAWTz05bobhdiQdkhRta+fOn+twV5Xj3dgrCs+RWWe2U3JhP?=
 =?iso-8859-1?Q?iTFW5F7D6ZxFqyKnvTAmbNvG+XsbE3Vjj6Tt+7eIg771QWEJ+wX8ywrgKx?=
 =?iso-8859-1?Q?ECKLmpb0k+SNMb7J0WttfkqPsQY9pvl92MOiC7tcO1FKr1P29kfaI+17Ag?=
 =?iso-8859-1?Q?cjFvdJsfGgS+worUZUlMZWFdurWtJuTL1gQCROiKyDu28rQ4Rquh1myvr3?=
 =?iso-8859-1?Q?WsNg0rP8RBQLtOXH33TeKwb17pDcLvmZkC0IyQ/Iav/59JMDFRLKXFYyxJ?=
 =?iso-8859-1?Q?WqF/s+nO7MnBLCL+G+23jDAw23SocVmTO7sCZ6kbOA/EPVDLVXuwp846wL?=
 =?iso-8859-1?Q?r68ilxCrOEQg5/DZ5AOywEFd+6oISiO3VhghqRn4ufSD6i5zqxrqy5Tg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb10b2fe-eda2-4cb4-0f02-08dbca5f652b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 13:38:47.3379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPCVAQi1XvYlTKDbyBFh1kcWMK/kKgXy5gV/qVOV7SJ3kskHxwMhQyLI5xqKQtj1OPoNhQB8sG4miL5+NbRxsJQ+spN9TK/tCiF/ecdeuqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7716
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 10, 2023 at 01:02:56PM -0700, Jose Souza wrote:
>Without this if a atomic operation is executed in Xe2 integrated GPUs
>it causes engine memory catastrophic error.
>
>This fixes at least 3 failures in piglit sanity and 2 failures in
>crucible for LNL.
>
>v3:
>- only add PTE_AE to smem in integrated
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>---
> drivers/gpu/drm/xe/xe_pt.c | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index f7553a2415acc..31afab617b4ed 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -628,6 +628,7 @@ static int
> xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> 		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
> {
>+	struct xe_device *xe = tile_to_xe(tile);
> 	struct xe_bo *bo = xe_vma_bo(vma);
> 	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
> 		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
>@@ -649,10 +650,12 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> 	int ret;
>
>+	if (vma && (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
>+	    (is_devmem || !IS_DGFX(xe)))
>+		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;

it seems strange that we decide if the platform supports it in
xe_vma_create(), then decide if we should honour the flag only here.
Reading it I had the impression that it would start failing on e.g. TGL,
but then I saw that in xe_vma_create() it checks for the graphics
version. So... it does seem to cover all the corner cases.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+
> 	if (is_devmem) {
>-		xe_walk.default_pte = XE_PPGTT_PTE_DM;
>-		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
>-			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>+		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
> 		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
> 		xe_walk.cache = XE_CACHE_WB;
> 	} else {
>-- 
>2.42.0
>
