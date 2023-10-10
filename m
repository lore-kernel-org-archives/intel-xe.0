Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8BDCD8CA2
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 15:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAEA10E394;
	Tue, 10 Oct 2023 15:21:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4796710E32C
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 15:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696951259; x=1728487259;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=N1TF8AWf4XAxFOvG8HpXqcbLcx/AjDTtHb18IuedZJc=;
 b=fmV0YD7DtEDI7AHSGU4IZM7v/jEPyHnyB69qtRg+B6YHokQV9PLROwEK
 PMkEIJfmGf/0n6VDm06loXcmrg6JVBPGZAOT2v6OLgen7YEU2qTPSfCkK
 2xWrc1JIAhoBZ0B7z0VDxPA54JOurkj8Wngny9Tzv3e5lXX/FyfqLObDi
 Ogs2Gsq7UX+wEr6I6k2CFBZZXXGTB8cdwROY3CFi1XBB8+SMzn/tIPzcD
 YMwmsGdq8hfEfMuedTyHkGTDZGyE+jVsp1mUsQMVsVW5jBf3cjK3JswHj
 csVtKgF3rjwCRj7Fb1/rGVT4TvYqLCViMUsTJl43iYKbH7Nx8IgaKGq8i Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="470692636"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="470692636"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 08:20:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897227635"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="897227635"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2023 08:19:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 08:20:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 08:20:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 08:20:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 08:20:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOsqbSHYag0dmf4lit/rVKKqXhAYoW1Elf/e/ivKDaOf+VKk+adY/dykMATEnvYROkMS2lMQwR0TDfUg5aCWq8Vkf9vxan/vPKdSvcgNbtah3UjLaV1m+MZfmg0eOU0s+B5oJwEoMOTRjqXmDGPGjsYISUZY0wxRfRcQisQYl/DLRthBA3IAdbuZNW9y73r0SsnXnUMC+vwVbOmxtKrcQxto8QI4jmgTHwjEfVQXcgGycgbyVCjP/iIAlUOausWYiZmLUk6nbt1CnD9T7FbGJ/S/oMVGVjfizWC53JueqAMipJ9BvdLzHI3aMFQX+SZPgbGQH/7ZVwauuiwgbh3alQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZMH0rBEVUpa3u/1YrsFeDuLdScY+Au1Mwvah14JHSM=;
 b=ZWNlHpcD6wifEDH173ik187VRqDX5mZ7fasNmxp0REhZvpGsqPKDanB9rQGDBzvVCloe5Zvd8TvakAl/qzRZLF0HtPCD70pIRKnMRq1Gywb6aykjvZNx7Nd3hs3bwpqPjzPbith/GfMEfhpcYvZQrBjjbxdh6TAsrriFWYLC1/UrF6iMCHjNRTUkBQR9+QFDEpAyQLpVPH/Wd5n5wenV0GusFDuCIW2FRxMojOEyezvqFG9xGeiVnQk5P07CDEEWAO/lXInZ/YJo5hovry+aFz7GiV6eYvAOU314f5/n2P9TqrcpQ3I4sibmuANwSLbmx091LHX1u0YDXoXu1PnvXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7528.namprd11.prod.outlook.com (2603:10b6:806:317::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.42; Tue, 10 Oct
 2023 15:20:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 15:20:55 +0000
Date: Tue, 10 Oct 2023 10:20:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <kdm5bgzisakhr3v2nqtccz5dche3ujkumjd3wy2u5ry3v7tti6@vn6c7c4ey6wx>
References: <20231005143922.23206-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231005143922.23206-1-jose.souza@intel.com>
X-ClientProxiedBy: BY5PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 5521648c-c82d-4166-88a8-08dbc9a47f62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xyS7/0mURAiLtnDnR/BTQLeK1JlK0hR/pnqx705EQDJKIZLzCUvifKgAtazcTOTs4toH5YhI9kGsyt3/y9BrUxp3KcF2IY9WUoQKrceIqgRGoawCGTD0q5VdcHetp68RcYPlVY5fwbF0qKZV2deAnE/+pIali7jnFYHGmk6t1J3Z5BwVNswysJlZP0nSwcKqmUS4UrdPV9pjE9wFw4r2Y9MgmCEUHGV9TfV28FjCMC3hh1zz25d0xSj1oNsLJQCHU86UZiSlQbpBLi0qEcO+fd+EDz4rpQ9YlYNknExNOQD8MTOQrGhj0n1gXHsNmTJA05hV7TGQJzdW9mCcekSF7aOf7/lIsXmoXY1ZiIVnxop0xqRAjmrqN6zsl1bP6MduTlWORS5TTORS+BCb2S9sIPEKELxBw6jQ3fB3mC1H+J69gS2vaTu4jSt6pMWXgxOs0T4HfHlHcoBkrEGda0c0c2LKnMNS+saDahCj+5C31KusBCQHd8zh1jy9wl5QWuoeUpTzgrs/kzJ3NUctqY3rRwRIXjQ13eR92pyudL/IEizhmCnXPKgYwU7qRofRImEq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(8936002)(6862004)(8676002)(4326008)(6486002)(6512007)(9686003)(38100700002)(26005)(6666004)(6506007)(478600001)(66476007)(316002)(41300700001)(66556008)(6636002)(83380400001)(5660300002)(66946007)(2906002)(66899024)(82960400001)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?50tdF3npTvwKSuE5H+Cg4nPg7RmwCsmrfEr2KRfEqapnaSCbA9db8awCII?=
 =?iso-8859-1?Q?woXiA4ME2Go5zKor5CWtDwZpSlvJzQd+av0lg+6h5RQHe0utdV8UIH/qZC?=
 =?iso-8859-1?Q?To6Mb46rDAch37L6a0M9/o0fLlDQWuCmEpzW2G+72cBGjFOLRpOG2SgCmk?=
 =?iso-8859-1?Q?Ravsw8VAgwgYnJyeME9gdGNldE1i04kqhkadIToa6y60gqfZBDZjxPi5SR?=
 =?iso-8859-1?Q?Z9V3WzHfEshW9tU4JbAygj+5sGAQFAJ3eXMjbuvz6S6cJnJtQA4NXYN2Ao?=
 =?iso-8859-1?Q?BD9FSqu2fTy3F/3DB9bwnih8hm0JaGpR5W9L/NjVsceS7EQBIYa/zG7BeZ?=
 =?iso-8859-1?Q?TQdD/nJStyhd+ehEhUmozGAKArMgwUz036T3HmUCdL3jHc2MGGHr5SHlxG?=
 =?iso-8859-1?Q?EtO/XH7gaxlRjEwYCfLiCkktVetIuPU/PnUQPrTRHBe5ZICOTGuWfnstlp?=
 =?iso-8859-1?Q?gweKGXXG8zCLHXtp+pgtEXYjU4lATJWT+Xv41Z1OdVhm/sFSMeo06cXnYu?=
 =?iso-8859-1?Q?ogDv9r+YgxIJoCIfsbo31otgSvCaRMMgtNa9SlgWYyaXbzriNY2QMOdoIk?=
 =?iso-8859-1?Q?ycSmnURzYq4LoYz+Jf3CkQ+Gt///kpmgZFmVt3H3KUaKjKip3jt6RgDrnS?=
 =?iso-8859-1?Q?ICb9Td4Lm3uCEqnyXs9B9yJHqkrWjGe7Q+0RBC9v80yuSfq/FLTzwnd+rK?=
 =?iso-8859-1?Q?DuwVEtIfYm6s6ADxxNObUqM37XxT6P+S0RxFmqfYv+KpCRVoEsdGH6VG04?=
 =?iso-8859-1?Q?NhLgMOhjh+gv8OEL87BBv1kXeWVGsao+lxoe9Gxp19quk+LAEucflPDaMl?=
 =?iso-8859-1?Q?A2nxuQ5zyXde41tLRZDxVB5YIBr1WxGI+c4tIfrKaU7B5zP3ysu4e0849Y?=
 =?iso-8859-1?Q?NhZma/UDaH7xbeno/2rs++ejDSgV3Vii7fKw/RERXfCPTnERibTjkix9i6?=
 =?iso-8859-1?Q?KIVobxzsg9c8tNH+s7s0r+rkOvVON8x7yddZqHLjcLFDj6ZFVRAHE1L1QS?=
 =?iso-8859-1?Q?99uibsC/mIrYImzPxHIzvEx8Kh5G0SbpJMoHvqsHd1QFaWHYWQ4VBKJZ1v?=
 =?iso-8859-1?Q?0B2efiE9f6uCHPgfrqCl5QJnx5bCW9g8qQ2rLxlCz0DagUZaeOaWfgPu+o?=
 =?iso-8859-1?Q?NCbuWjRPoq9CONNxjpcGj/vTuA7C8jn3kQTPo4hbnKKxOJUq6wEZN/FrGy?=
 =?iso-8859-1?Q?D40AEhflo7ABa91p8wBZYln10E6OZ0tAYFuInScO3ypjMCbuR/oZffe9rY?=
 =?iso-8859-1?Q?ljLVWBFJBiDalLK01GXsAOQrY6PpHNBLdfpHa4UU2FQAhX2UgOAPPu5zwD?=
 =?iso-8859-1?Q?N6Ygfh3g2Vg/BYuC7dSM/+lCAch9ZL2KrfLPEM7YEtk5WSFf3xs/apROZI?=
 =?iso-8859-1?Q?NuWd4IzAyQ3z26KU1iiXgBVBxScQ6qjWL0YM189StDM88owHlxw4PdDIRP?=
 =?iso-8859-1?Q?TOwBLdi+ZBempSwhZyHO+BcSgjY+ytJRHK2JpY5XnUl+pD680m5Y2i+X+O?=
 =?iso-8859-1?Q?Yn6DTqjrbduYH0QuekCACjxI/Z87f9C3T5yJkHEqGt+HF1UdG7QVUjAjYE?=
 =?iso-8859-1?Q?QtnYB8LOzMHUxNH6y4rfXoiDq939/W0XmZtymzQeGqa0D2o84uYfEdnsTw?=
 =?iso-8859-1?Q?RazE/9l96Vtnm/ZX4fPpUMvB7T4Lq971srS/hishELAPlXZaaJCQFPxA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5521648c-c82d-4166-88a8-08dbc9a47f62
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 15:20:55.4655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JB6TiHssAkLMse08B4rpEkuCWmBnPwHDWvliKjaw6RQXIKVR0Iixw7pM3rKqpSQT2oMEzCEsykkaJwwmAvtPkb1Ki5iTF4WGEGYYJZNWDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7528
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Set PTE_AE for smem alocation as
 well
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 05, 2023 at 07:39:21AM -0700, Jose Souza wrote:
>Without this if a atomic operation is executed over smem it causes
>engine memory catastrophic error.
>
>This fixes at least 3 failures in piglit sanity and 2 failures in
>crucible for LNL.
>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

But there's the pending discussion with Matt Roper on whether this is
correct for discrete.  It's different to have an integrated platform
dealing with system memory and a discrete one dealing with system
memory.  Let's wait that settle before merging.

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pt.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index 70a8bd3558c2a..4bdf7edd948d5 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -648,10 +648,11 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> 	int ret;
>
>+	if (vma && (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT))
>+		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
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
