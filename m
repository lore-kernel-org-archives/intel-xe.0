Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB425C531FA
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 10:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAE910F36B;
	Fri, 24 Jul 2026 10:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1hfQrxt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B85710F377
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784890757; x=1816426757;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l8yNaLGqlSV9qn/xav3Bcx0b1f9LkmO/46uCScw+AzM=;
 b=e1hfQrxtHy01mBnJR0ilhOY3OMySMHHQHnFdJBdu77YYNspxa3Xfyelf
 ukpyd5AryOIQvIiD8MQ5UvEHYkcdWVJLJtOrzaHpHZbLRHHpzbhqjM8o2
 6upnS4kLBUif4+GUmU0S7xwwCzXddqL+MTXdj9EPj38MxrcmGOHH1K4n0
 TrqnOyIFnat7WKy5nWsKcFcXywaKe7QV2FDXoa/eCA5vpETK3YefXsgjl
 K1Rw/uhkNqXN2tYIhnVoWcIk7X4CCuWkVTaNi7qku/K7V8OLgI4xbzhKA
 ieXl4gkEdLq3++8Qzn8VViEFU1HA957iu8PtOArgTbJl3fty1xOCqKoXT w==;
X-CSE-ConnectionGUID: 9eaSpuTcT56CFTn5oGTZOw==
X-CSE-MsgGUID: lGSSVmVJTqeVxnUqyzP9MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84681848"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="84681848"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 03:59:17 -0700
X-CSE-ConnectionGUID: 803FigQsS+W83pr8WYAXcw==
X-CSE-MsgGUID: bmLv7LCmQuyqnztvHAlUBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="259340973"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 03:59:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 03:59:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 03:59:15 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 03:59:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzHcwgezP66u7SQC0wXU3YtdnfuedVhsG6R/0UPlfVtIlOpT6adCCNbxk0DwgdIxC9A5evfHcSW2Db+sAUgWSULNz5xm6mUe/82ALezWu0BRw9E+QyrxfkDx9Z/s/SxOvqh2eEEEWh5u0ThJj8O45ypYE+tBYW2HJmL79x5zNt0lNkFArSp4BESEpe5pvsHOKO3b7PzJdYe3KPjvw0MXW3yrWVOhGRiK0gXLikwnaHt/ThZ9GhuqHuuIb0OQILi/k4tjxYnNSrv6n6m4THJW53eqLH5YBVAnn+/9KdMvDvcwBc+b6x5P8521o0AE4nITOK6db47aaqKpIj9nsqYQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMVurA6rP5pheHNNVMBjBEjGeMwiQnnmho7RceM8YGs=;
 b=hcDzoD4CuGg9pDixUNFpCjTsylgB7gN2JmMD3R/85DiEDjH3BoiDAuO2Mi7Bpt3+HoqoJ9hG5YwhzNRaDjV/1HWKCma64MDbFvKsnysUla0sutoKHUACHbfFGUNGiAWush/Z0KEg5uM0SGi+/jWHNr9DUXZaTuUEyct4DkES2f1SHCMXBe+TLTtme4P+NEkvQdOyS/0c6ujX2c1Z+hzM2dOa0CT/HajyaG1JszfWIH3Ya0sO/NKlx1pRfH9rEODrrOWdCasp3AQ5P+ksNggerRgfTKlUBR5YrDpOERLKfoNald9nGJ7W0c9WRWOgRB4QHds5y99jKWzRMzSib1asSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8170.namprd11.prod.outlook.com (2603:10b6:208:47c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:59:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 10:59:01 +0000
Date: Fri, 24 Jul 2026 03:58:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] drm/xe/pt: check no-DMA huge-pte cases before DMA
 segment test
Message-ID: <amNFcjG2NdI+LqK8@gsse-cloud1.jf.intel.com>
References: <20260724073050.429768-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260724073050.429768-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0300.namprd04.prod.outlook.com
 (2603:10b6:303:89::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: 60ee0de6-5a3e-4c8d-bd27-08dee9729176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hME/o3BhE+kacG5ABx1o78poGhs+xdhExZhImOeCeXJZLDBTIZm4m5gaLCPmFzmKHJ1M4Wi3mNsNVuneJv9J5MglGHAFz3sNwlcRWB7lqlGjEvXQEyokzmH4PIlRlQZYjj6bc2jnNpb+bOyCUExvgPT2qJ6sEmyD+bvMlPE7OIPWN6RFgftPFvoEE6QGZ2hBQHLhvyvEYWmq1Rpw41DfqOkDhkklhL0K+I02PinLe3S0LXluV8qxJr2VQ5rDudsDAlkrPVN8VbIcTNu8apEd2R5QpKiAYKzv0M+k1aBkScjbiL9J3wVdU38vF2s0zfrnEFoi62Dtn3UjQ8x+LaOs7GbRuP7jP2OeOjztrUEBixLV9lzbVUT/q94vN3xaLc3GJfupJQTSEu93hJD3waKNEQlgoFGJOsiw77blrLHIBu69A/n3/ONVe1oUsNxldPF2NnRtE5Iit0ioBerfJ2kjPszk9gxFrqLO5KdlnwRWJ4K/Wa6lerqcw5kZ4OR1+Dwv6/gRbJWWXsWJSxm3ObYfb79xWULSns0G7JIxq3kS662TELy+6Ssb4/i30HVvatQEcHgdYfUqUFFtN2QFX36N7cQR/Qej50OZOMlM3ptPbE+K7dtI9CpqbvUeiYOznGuJy3kC4f3QQv15BaleXae0+Vz/2fJ7t2NOo/2nNiFbWvg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+nfvzkBRH7G6EryXvHBdEY9X+/MR3+GmdC9FcXVZwPf+qvU+z0lfY/0jx/Hy?=
 =?us-ascii?Q?B5O3jZTcF1Uojk5BFnW8xZEv73au+BUispeI6pKqnrkxtv3Lj5r85SlkcJur?=
 =?us-ascii?Q?7Ne343p57Y+IuNzwVfXjL7CQdNEhEAQ8ZqeGs2Huv3NkPRZm3+kQR9l2knaf?=
 =?us-ascii?Q?Y9nwDiekGkPjtQdgPfTPDu7qtX/vk4+vBPpAQ1ImQ9x3pR7q7atMYnWNbKCN?=
 =?us-ascii?Q?8cNnoTEVXiWVmrf0xY3JzPQgaCpgoWyQTwiu2cOOocPFDOjSAdmZt+qBg0a+?=
 =?us-ascii?Q?b5K0545h0uJ0ZPYkO18MNSlj5qorEVB8Gsd9dPT3aCDolYzlwMXpf+ignqpu?=
 =?us-ascii?Q?K9HXOPKbToSOtU0R5YeLWVn3oj0kTZoQmmD50rUBVeyAMh3udCJF6qC1nnO/?=
 =?us-ascii?Q?rwGB6tZAl0aJmpsYs4PbU+pL1tvGY8Z7ppYaptzd8g6w1E5LbhzuBh9jGLlW?=
 =?us-ascii?Q?8WkXh48nHXsWwpSDOsAFjtbPvrOurZvBoeDmuqEmZ/9nMSfqmrLxbA8llN/e?=
 =?us-ascii?Q?03PWAxJcEFnI5akM0/ONUW90gu9IiVrtmgxdb/vs7tfNE6bCFBJRLLOhYSkb?=
 =?us-ascii?Q?Z8S1BuOJoIc85FcMl+/iiBYPsy8J+eNSraed3N7d7mIEZIAo3yzwGwgS8waN?=
 =?us-ascii?Q?7np2woBSRT+waOqAr4Vn2O40HmopVC69in1sXS7HkjTgxuzc7PIx/fvaggyS?=
 =?us-ascii?Q?oEt5o26wZAsyqvBvZ5eiYA3J/BeQB5Olzw+aeuQqxCixqmK3Vy08HGgNyGME?=
 =?us-ascii?Q?KbmNtqAQaRRo/vi8jAYnYSMIi9KJsxwFlRPUoPLNa6DPk8x9fTyqI1JCAtGB?=
 =?us-ascii?Q?nOco96rlUO5Q2SBciwOZ51MelLasT/SZ79VSHGlUzZMrUIIc7HazgjUAGOQC?=
 =?us-ascii?Q?QDzvyLhU98VAt+Hol4WNm9YVO3MI/ARLSpEsCFTwy3jiceRZrBOheN7tDL8X?=
 =?us-ascii?Q?NhsVlvJxHHQAnsrMSOjihLlYO3PEggw1u7bU+JTbs88PN2hX3pjV0h/x6El1?=
 =?us-ascii?Q?Vy1V+huANcJ4K2J83LTfPF/IRxx6BlYTmih43bKuynfbG1az9T9X6Aq+RDJt?=
 =?us-ascii?Q?J4QBJVrYcfkFUgVmCm07Zy8B4p+NruCEB2CFua/uJW0xZ4mPh4Ug1Wclm+gs?=
 =?us-ascii?Q?+b9XkaMY7CZZipV1cymcHMckvRH/anJuSatIcxaUW3t0TurHD0ViAErx0/Ge?=
 =?us-ascii?Q?DWtVFkYDNcPG9i+MGbb57u3G1MugkMj2VDWw3sUxGZ+pGd8peSVtrk3UJNe7?=
 =?us-ascii?Q?YYr9v+lIibA+fTT11rO+4r9uJ03DB1OoRRbETrB/zQKklNxa/Odjc7u3r3by?=
 =?us-ascii?Q?POZpI6AqWeLZb8w36omJTtEHzAhV2GRSSvhcbgSzoMtdwRbvFh5DXXruFQdw?=
 =?us-ascii?Q?CG2ICDCo350BSnBJbGiI7dxZtUJANLHdtpAUeIqvDQZE+U/Okn1S+GrnAo2O?=
 =?us-ascii?Q?c+GA8CkQ+pB9/yaYkzjUsF/zlhCeMQu3Cho/KRISFjPN/eu0Pqu+t6lwO34N?=
 =?us-ascii?Q?3SLryhpRyEhNuE2eV6a3liRDlc+gYHuQZJgRdMH55+KCbxsfTvtRUSrrI0Bu?=
 =?us-ascii?Q?krDKDQ1htela4D905Plvjhsw3y5RvH5fQcIKhc3kvnQrNlZNx6oRNqXa0deB?=
 =?us-ascii?Q?LFpNiO9LJk++oXwUnvjuZ/GZC6lUAJUcAFDn9EfszFXos0a00qOBaTDEhsNM?=
 =?us-ascii?Q?4hz8QhOrTuzMAxkmn9uVizDJtse1l64ZGhmr9APESlIgxorbivsboEM3VXPu?=
 =?us-ascii?Q?Ll6cZqbwSg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Trw1vQZCh5I8aZnNtZOCG3HoE/VPF0vMc8UZE5+80tMXSR3mQhk9GEPVmIgFg5Y+V7YoR2p9G1JTtkC5hAaE/d+u2cFr+JW6paSN3bMke+cDgpWUbTnxFgbcgYY76FeKvVthY7ZbSzTEZ0ue9CBnzteWFnnIjsFBzCKFby7WtQuP1Hbxbwc+ycfTvpJWIfK3wXZ1k6IsVfnuc6M6HEYpRvxlyOOesWfUDrwMIQa07mCi35E4coLYzzfKEmVlzHOOAcD6lcUGsNZPOwZu1uU/DiR0GtMOswbhiRzWNTGildKLJ3QkwTAL/bMeBIvLikksk7KCwOq2ItzV6pGNANqFJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ee0de6-5a3e-4c8d-bd27-08dee9729176
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:59:01.6589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7p05G6nT1kfDtqXZAnDwagZcth0wuKctI+RulfemDK22QahMMnN/KSJuB8kTW8FV57zZeeojsH3I/xxgB/k/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8170
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

On Fri, Jul 24, 2026 at 01:00:51PM +0530, Himal Prasad Ghimiray wrote:
> On a non-range clear, curs.size is never set, so the segment test

We should probably set that, e.g.,

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 148305a6e9a1..69c50d8a13a0 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -775,8 +775,11 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
        }

        xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
-       if (clear_pt)
+       if (clear_pt) {
+               xe_assert(!range);
+               curs.size = xe_vma_size(vma);
                goto walk_pt;
+       }

        if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
                xe_walk.default_vram_pte = xe_atomic_for_vram(vm, vma) ? XE_USM_PPGTT_PTE_AE : 0;

I think this safer so the cursor also makes some bit of sense during the
walk.

Matt

> (next - va_curs_start > curs->size) returns false for every level > 0
> before the clear_pt short-circuit is reached. The clear then descends to
> level 0 instead of forming a huge zero-leaf, wasting page tables and
> risking -ENOMEM on unbind.
> 
> Move the null-VMA, purged-BO and clear_pt short-circuits above the
> curs->size test. The bind path always sets curs.size, so it is unaffected.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Fixes: 5b658b7e89c3 ("drm/xe: Clear scratch page on vm_bind")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 598c6b2571e7..917b464e3db5 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -443,10 +443,6 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>  	if (!xe_pt_covers(addr, next, level, &xe_walk->base))
>  		return false;
>  
> -	/* Does the DMA segment cover the whole pte? */
> -	if (next - xe_walk->va_curs_start > xe_walk->curs->size)
> -		return false;
> -
>  	/* null VMA's and purged BO's do not have dma addresses */
>  	if (xe_vma_is_null(xe_walk->vma) || (bo && xe_bo_is_purged(bo)))
>  		return true;
> @@ -455,6 +451,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>  	if (xe_walk->clear_pt)
>  		return true;
>  
> +	/* Does the DMA segment cover the whole pte? */
> +	if (next - xe_walk->va_curs_start > xe_walk->curs->size)
> +		return false;
> +
>  	/* Is the DMA address huge PTE size aligned? */
>  	size = next - addr;
>  	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
> -- 
> 2.43.0
> 
