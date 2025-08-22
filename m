Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664AECA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 20:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187F410EB9E;
	Fri, 22 Aug 2025 20:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWHLLZqx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107CB10EB9C
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 20:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755893611; x=1787429611;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LLZZzCq0FloIdl7HEfc8pFMjlTkXcfjm/DA8D3Zb/9c=;
 b=dWHLLZqxOSR9EAf4je62nT8ZyiadlVmH8B3jRekWP/aA2MjiSoEujnMg
 75RT+yjmcT5wo50CO/fHN902g+4jo0WvQp6DzlItuNoFPTrztqN8AizTn
 demOoxkJsqsfZ+r8QrKny4o4PNNjMvv6/u4Pf6MD2i5XKG5PDMLj1EoY4
 g24/BZDRLjd/wzOluTHASsnQfDZvLOQ9iPd5uifmynS54gG+K/ggfVxLh
 0o7TGmbmz1W5unVhFvXZoFTUlSgIQFZgdp0c1vNcKMTCMXg1RSqekr69r
 rK/4K5AAaxGqQ4BJH0XJ6ffS/FCkn4ClNbLKn9GpmNy8J2P77nEInvsHC g==;
X-CSE-ConnectionGUID: tiEdr7gYQ4u7mb3FWD88og==
X-CSE-MsgGUID: z+GIvhoXRD+DlJHBaF8E/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="62020090"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62020090"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:13:31 -0700
X-CSE-ConnectionGUID: m2i0HRSiQD+ZFWTOAvYEyA==
X-CSE-MsgGUID: 0awEMnGbQlq5WoEmMDZTig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="199669871"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:13:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 13:13:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 13:13:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.82)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 13:13:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJIDyQd5amJSSuDTWTTdUoMx3vO3koVg3ca3/sUAcn4Q9MdOy5xalcIzRTIxXqG18zd9lZRKHXwpNpcCQ2u0PQ/TZuSvBkirRLKwFN0FVcHCLIP+Pn90ZXQ+4O8r2qaUKTfvaRvYI+YceRXpb8wZSdwclrHRdgU3OWgA7jriUpLYpsZxi0j3Uv022Vq6fb8wE8Bdbs8jyo1+WH5W1Z4cvPqHi/Z2KiHcebcXNCIGdNeeQD/8cdHmXnmCtgKV2kJibyYLJGV1e34TOkOCO9WNa/s3ADUAx9+CoZCtU1NGNt6HlKh3xPR2SOwOC3K7lG5zPK6N9UR+FmDVHfdBAgpwzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3pA5z23WjbXyqdmh0ZGAQ6MWbeqLp9YTaGJWamc2Qc=;
 b=j6goT1ThCbN+FBjoEyweD4DBWZl9dTEy6va5cEpQF7CSSaOfP4P/Sp+MSduJ4F4XfyWh0NpFWCf0n2GDdfbymqhJaMMoR1m+DdpIUCANkrIed8byOwHWlfEVCyA/38UWee23eZ41pc131JIn0Acxays4yEgPWNjtSH+Kb1uw1BcZiZhErkGPnW8JGtHviLREj5zL5C/zirO+JEL+5KXMnGLvAxYO7yLfTxplF6zWkOTZQ9B/uRICsaIp3cv2Pgpk/jA4mhPO/0cLC8le2bRpj1m/SHqBpdbblJVi0k8OyTBpzgsr86nb7L1wqxgsmBjgY7n7wZwGtrfjUno05BAk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB6957.namprd11.prod.outlook.com (2603:10b6:303:22a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 20:13:26 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 20:13:26 +0000
Date: Fri, 22 Aug 2025 16:13:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <karthik.poosa@intel.com>,
 <james.xiong@intel.com>, <stuart.summers@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: make xe_gt_idle_disable_c6() handle the
 forcewake internally
Message-ID: <aKjPYq8q0BC31Q1J@intel.com>
References: <20250822195340.1246075-1-x.wang@intel.com>
 <20250822195340.1246075-2-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250822195340.1246075-2-x.wang@intel.com>
X-ClientProxiedBy: BYAPR02CA0032.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::45) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 10efc3a6-7f50-4d5b-df35-08dde1b85a7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PCZvlO4EpxhLTyUCHEodyfuAgdcVOiY2d4Fik0MjjET97UVhrbP4r3foGfV0?=
 =?us-ascii?Q?hxQIVR9quyCtf7XC6gpk4l3h20MuccQew5/zS/044IZTuR0fDSWXUcLbYYmk?=
 =?us-ascii?Q?uRpkX8NhXrjVEIV+A6/ELukYwkaqJxvOII3Gp3lgDXPmjz36h5XgrV5+hrYh?=
 =?us-ascii?Q?2A8Nf9XWY9M8Rwf51MeCWPKoKckjyPdIl+azBO2ng6Kah+J0KQ2wj7rnMtpq?=
 =?us-ascii?Q?vZpjlDZw4v3Fe07NzUCkDXUu42cD3OPRhSCFKlzTP4dsjKC9KF18jUKU8l2/?=
 =?us-ascii?Q?/wJMaNcAuBhiS2wTWJvghxWZIG5UVJTInsC0IVpZ3C8YeNBmSME4XzTqB20p?=
 =?us-ascii?Q?T5GIY3R1ZblPnmhTmG/2wittq77rxmptn6wxZJU2w05f9C1lb61zKQB8YOrH?=
 =?us-ascii?Q?ePw1xllg2bOMEa6DNkqQFb7RmnGYAzHOSOaYsZoK3i7Al2cwQvYlRqA7fQMD?=
 =?us-ascii?Q?2+dqFGAL5wsekWK5h0/8leJ/G0IaYNpbOeVBrVu2kwmNGxdkgvaBcGjNkJCV?=
 =?us-ascii?Q?SrTdVJt0sWcedgKMrIzutpIfX4Of70mNZptL/Duk1wuqUebTfTrKMpA5IqvY?=
 =?us-ascii?Q?xp/OjNm/hkRMZvEohvoDlS2TleFwZA98SKuwFrM3HpXirUwhvxNN/0hNF/jy?=
 =?us-ascii?Q?l4YnqM8P+SN/R9K+RNE5hs+6Zw2nt7owbrdDXXLIO53aFav1sR0cfqK5+ADL?=
 =?us-ascii?Q?2538sPNivgpJeedmPBTCQW5YXcyjm6tobjV8t0QCkJ1qjrQbS8OnOpAZnYco?=
 =?us-ascii?Q?wQeT6YD7UTAXgWmZ7zHK1RPNldjS7CmVGtOGOq4+yr6icLX1KuWCmx5Bq8Dk?=
 =?us-ascii?Q?Se2/GbM4ddZ7LO5lDOuPAVNhADWxDBMNyxk/hgwCNYfobV2TMPMbtoTX5dIB?=
 =?us-ascii?Q?dSjWXFScgeT3Zxy2inhCuCDjJjitUPl5Bjgv4Gfqv6yxCAC3VbSEdAHpkbN7?=
 =?us-ascii?Q?icDdYnz1CKe5k1hO7tK6Vs+8cw5Ppte5a9f8bLppVaBaGEp/zoUzeIxJmuyR?=
 =?us-ascii?Q?mkoZx4ABy3p94YJdLNoXLTjnrsdHuV/FdcrlmQWsWdDWoIh0SGFgKKWi7xKj?=
 =?us-ascii?Q?qZjTf02Wadk+QMV8Eem8qKFiKWpHWl7jqL8kMfEQQy9Qx9HWa/ad2XMnDiHq?=
 =?us-ascii?Q?z1t/gGP4yPrVEzcNgYAZ4wD6xY7UNO1/1xuE5Y+KhF6wzl9VhZavm6Zu/ae+?=
 =?us-ascii?Q?QXjxvbHuMnpkAd8K28FxroV7B7nABs69Vm8pXuzblYCQssq/gZbvLCSJeVHq?=
 =?us-ascii?Q?AhEsB610tsPyALBS2uhx+AlWjJb5eyx1QuXYzHPpTUaL6+gUOxjkDE7/hz2A?=
 =?us-ascii?Q?NwXW4Ceml/0Tiq8xovB/8ailQW1qAGzn0KqX6QwtEtowEV7HHv4L+LkdJk4T?=
 =?us-ascii?Q?Es3V+OQPY9K4J9N95Vc0c3Za48+yY6lIommBemlRJVsryKbZPywZh8D9LGfK?=
 =?us-ascii?Q?EdxIvhKZAZ8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9M+mINE0I1IEWTuoK8Neo69hqLJUK+zkoriVBHLfbhqmQlnx3frzYrwt0XMw?=
 =?us-ascii?Q?jYmExFVQqogXB5XaJwuMOT5vRa84bhR2qDvtfFPwy4ZTbltkgp3Dp6YTAoL1?=
 =?us-ascii?Q?x0b79RS48d1Y53ia80LqY7Svpa9wuZU1zZWHsVJlbeTIJCQoDJYgWPaJ9ayz?=
 =?us-ascii?Q?KzHVL776jXgyj37XfYfw6gfiXBQII1nFi3FBOyFDD+xagcFRqPGcgkmduto3?=
 =?us-ascii?Q?nCvjiMTxlX6xT1kogqQ6jLJwCd/rVNQoYw1fmKhwkcLNoMKcR88HY8CRgZYy?=
 =?us-ascii?Q?WYS+Lcmdxgy9MWG693y+p22UiSppY2iuc1boQVPD7LSWWyhp9zOkxSlLAUOO?=
 =?us-ascii?Q?ocvNNRUfSCXX4Nzhs+k+/FM8isMT9+l8rr+fpP5lmLvr3Pucj1rW39vFI+/9?=
 =?us-ascii?Q?/iLn/RD643sx4J3yOno33fkCkU6LE1HKIoMsO/7Jlnsf3kMoHr1RKtyEL3Qh?=
 =?us-ascii?Q?I6Q4SnqyQUAjmvsU3h7zjIkpYFoiGjADTERfNnTRIPNhequLgdBjML0Uqk8K?=
 =?us-ascii?Q?W2EURHREL/Q8O5FrPStaxuRwMxVIgxtJrQq/gT/o2TnkKUwB0LJBeZPtH/da?=
 =?us-ascii?Q?F6NgEp2Ylw2iQEsT6bh3a+5LkREFwzP2qwRox/a15VOhtfb1az+EgR1k7U/d?=
 =?us-ascii?Q?9xSuQRESeIwyHireIHBfEz6N15qcF5jWs+AOOMG6CKbzx3JvI2YGw+3zlFCW?=
 =?us-ascii?Q?WBFPVDjUFpdPkK7ZaIkISCzb2g+YC1WlgjehPZmjPPQHD10vrotJadxB6lEm?=
 =?us-ascii?Q?Yn43mwVI33iJvFRLujkfjrhb/vK8MLJ4JUVmBeQUf7VhbflP02+8KbW1tmwB?=
 =?us-ascii?Q?hqrDvp+yd1aoBWsvrXTemQP168QFVt9gymuJ18PlGlNM37sJITgVMHNnf1eB?=
 =?us-ascii?Q?uWyZEAcrbr3sDTP7+TKLJw3hn7b6YY5xLNTTC5zLsCHrzDeEOud67qdR3kGk?=
 =?us-ascii?Q?//2C3srj5e5n+skRAIMnYTXLE+ZDNDablTaQVJ3KIf37qtzIXt5Lx5Tjfiu9?=
 =?us-ascii?Q?tVq7hqU4eFWbK9NfjCNth502aGouyAIvG7ISpA1YJObNBr9OMDjztjjDLmyc?=
 =?us-ascii?Q?YN8u7iqwI7lweXvcIwO6aRts5I7BT2is0tE7k24I72GGBDVTzy1JcjBA/HrC?=
 =?us-ascii?Q?KhpOCjOYifR9NN/iN+2ElVCZQpSn50e9Ugo0Emt4jgq8Stg2A8KUfat1tFys?=
 =?us-ascii?Q?wnvwqFPzVcoJ8E98GN5fNHtjuibOxgV++VM31VtVMUs9y0X/kRxWw/O0p5a/?=
 =?us-ascii?Q?y1QERvQW40At4Is1+V860prjgyyLkTSmIvKIrVFJL1kIfTwYkkuGRTyJ7oTn?=
 =?us-ascii?Q?euNEV2hKA7dcTKcq70fpjSrLy0xnU0Lda65ApAbwHq0B6WwRp3GdgVIVoAMv?=
 =?us-ascii?Q?Lb//KZueMFhYxMlEUmLKwuRlFWLYmrBsJTg2uC9jS0nqU1W4GvGd5IEBdYC9?=
 =?us-ascii?Q?OxP3tr3dbRfaUiJKPE/gEqsHYz7cZRhv0OCgNBLnSVZskTyBDadOsGF2mIbx?=
 =?us-ascii?Q?e2p2z4qKV3uyH8N/Azbt36yUq0SWLTDiksx1bT7lYt5rls/mC8YaTQuXKLj1?=
 =?us-ascii?Q?NNTLhOIHmM14VgCgY8NyeVaDnKpBF3PlQlAMrJeYAMB45jysJEAPDXThJUUY?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10efc3a6-7f50-4d5b-df35-08dde1b85a7e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 20:13:26.6850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgDSbXIp7LbOcmNmYANfBc94DU3VhwzKBbs19NOYzwTAfHDSSvj244yJWpVzu9lhrCoVdAN4vr5K4GRQOXnVzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6957
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

On Fri, Aug 22, 2025 at 12:53:39PM -0700, Xin Wang wrote:
> This change streamlines the code and makes the API easier to use.

I'm sorry for not noticing this earlier.

This phrase here is the why, but the commit message itself doesn't tell
the *what* part.

I believe we should have something:

Move forcewake calls to inside xe_gt_idle_enable_c6 to
streamline the code and make it easier to use.

I would also avoid the 'API' term for in-driver usage. Perhaps ABI is okay.

Oh, and one more thing below that I just noticed...

> 
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c | 25 ++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_gt_idle.h |  2 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c  | 13 +------------
>  3 files changed, 18 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index ffb210216aa9..7a2e5b50b1ec 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -322,15 +322,11 @@ static void gt_idle_fini(void *arg)
>  {
>  	struct kobject *kobj = arg;
>  	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> -	unsigned int fw_ref;
>  
>  	xe_gt_idle_disable_pg(gt);
>  
> -	if (gt_to_xe(gt)->info.skip_guc_pc) {
> -		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (gt_to_xe(gt)->info.skip_guc_pc)
>  		xe_gt_idle_disable_c6(gt);
> -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	}
>  
>  	sysfs_remove_files(kobj, gt_idle_attrs);
>  	kobject_put(kobj);
> @@ -390,14 +386,25 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
>  			RC_CTL_HW_ENABLE | RC_CTL_TO_MODE | RC_CTL_RC6_ENABLE);
>  }
>  
> -void xe_gt_idle_disable_c6(struct xe_gt *gt)
> +int xe_gt_idle_disable_c6(struct xe_gt *gt)
>  {
> -	xe_device_assert_mem_access(gt_to_xe(gt));

we should keep this or remove in a separate patch with justification.

> -	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> +	unsigned int fw_ref;
>  
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
> -		return;
> +		return 0;
> +
> +	xe_device_assert_mem_access(gt_to_xe(gt));
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +		return -ETIMEDOUT;
> +	}
>  
>  	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
>  	xe_mmio_write32(&gt->mmio, RC_STATE, 0);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 591a01e181bc..9c34a155e102 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -13,7 +13,7 @@ struct xe_gt;
>  
>  int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>  void xe_gt_idle_enable_c6(struct xe_gt *gt);
> -void xe_gt_idle_disable_c6(struct xe_gt *gt);
> +int xe_gt_idle_disable_c6(struct xe_gt *gt);
>  void xe_gt_idle_enable_pg(struct xe_gt *gt);
>  void xe_gt_idle_disable_pg(struct xe_gt *gt);
>  int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 0f8430acd16d..88557e86d637 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1076,7 +1076,6 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  {
>  	struct xe_device *xe = pc_to_xe(pc);
>  	struct xe_gt *gt = pc_to_gt(pc);
> -	unsigned int fw_ref;
>  	int ret = 0;
>  
>  	if (xe->info.skip_guc_pc)
> @@ -1086,17 +1085,7 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  	if (ret)
>  		return ret;
>  
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -		return -ETIMEDOUT;
> -	}
> -
> -	xe_gt_idle_disable_c6(gt);
> -
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -
> -	return 0;
> +	return xe_gt_idle_disable_c6(gt);
>  }
>  
>  /**
> -- 
> 2.43.0
> 
