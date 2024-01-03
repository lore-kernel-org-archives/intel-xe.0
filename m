Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AD8C46CD2
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 01:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5CB10E161;
	Wed,  3 Jan 2024 01:16:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C1F10E161
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 01:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704244585; x=1735780585;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qEmMcFvgnRd86UHD/cAoj0WZPiQFVPRz4mf+kue6HFI=;
 b=IJU8G7UC9szb16ij3uTaYVOFH6grFIYJGZyPOkuiC+fKlLc81nXmBFXE
 5FNWD1+Gdvx7LwtN/CuBiaNLuf7Q1ZoboJ+r3+5qUPWxHw76Q0/32qq9m
 gMeBjWf2mtq2zD3jyq9xGKGZCqnJgtfm4nLCwE1j+p/GnpfnE4nPLgL2D
 GDDZCiRKEDI4Qhq1xqWTlTL49KJCxhZzgjiSbvmEEvfasl3EZKqCUSc4C
 m46el8B/7uFsFkWuzT0sfHP58rZj8CZw1PMvtd5nGxl7UO5SmOFPVmnIO
 pF0Lzs8B0/X2AyQ8nTpWPPIvmR9MPWl374rdWv/RZzD60QMmISgFQRnj4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="18483452"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="18483452"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 17:16:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="779837457"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="779837457"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 17:16:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 17:16:23 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 17:16:23 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 17:16:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNWwAIvhUIPMM+CaKjHhDe/Z3jJ/uec2lPNFGaODEsYwKxFhYUDUSwSDT/2+I0MD/zmZXCdGpos0WnycP0dEBt1953EAP/k64ic6jHaUDIHqjiWtCmDzGvYnvVRWz6aQ4YyVO6z9jyRBukmQBFIbrA0tsenDiqUJdio9junbc71659fmi8+78ol8qm3mCIyI4siTQgcJ61UyvvMAmg997yvqXSGSEfIxNlSQs1BFKZQzW9aJi+aMGM3uUM/Q6OZePapvKv3uZd6H3yjt6qSC53xe24+qkvjVbIIVI3MuQIOgxyvNO/vsJsEbH9fAdSCtOlkLmzTpm9UOLIejz9HFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vU6aP+6qTBU39h3yl4YDo9qvfNiKicl1rUtMfKTfWOk=;
 b=eHylg8Qyxpi1/1wIE25dTsa8VBg3BKWGHSwdsjY3fuQR4iUBOntVibNGbnDVylTMOAuZUPy+oOWZIdz6EXa4MgytEt0I2E4sXbR6DvpBS4RsSAvHg/gOruWu5ek1FhC+IKqfjrzvB7/+k68zYQj6A5e00vO/ZwQOed4CJ+Q/73kz1UUROoYaLCkXlmHQrqHWMQr0byciudS4HmiTCk/xBouKkwe6jrzH55XIoe017Ze6qZ81JRocpaQzAhwh9pkIsVI8P3kalkBBVMZdA3LcrNwJTAyn86rz5JwwkM0cWTrbuTX5fQQSBYF1lVNg8/71U+b1mQc0OwpHiorOlHg1aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 01:16:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 01:16:20 +0000
Date: Tue, 2 Jan 2024 17:16:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe2: Use XE_CACHE_WB pat index
Message-ID: <20240103011618.GT1327160@mdroper-desk1.amr.corp.intel.com>
References: <20240102165142.853141-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240102165142.853141-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY3PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:a03:255::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a92a6c-e398-44ce-2af9-08dc0bf997de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QyAlLr5IJH2MKkDnPP5r3EU9cqwdD1kJDE9Fm/txhExJ52BlrXCSfhe/HmyojK8K4uVdY8wE33cFfjbabvZLHSKJlpsotV6QngPUvPVFSSPGGkUww5p8uObgoYr4zcYK6hhf+2i+MwXsNWEOkBOPxmFqdeQ/yFZi6xt2nofmr4FpnTcqpTssSC3IyEeH9DTC+SDrz+yuF8CDbH0pL9G6k2FwPCcrc6PZ0qtoEih9s2JndDziuXGwfeFThoiLJ3gHmd9hyaTz0xl0uqbg8rESLtHkXd8SWEJ8VSrIesfeI3Wu3WJj22/MCIg5Z3a4MNsvulcLVaAbvclZ/CyyXSx3QSmlco0NQe2dnIBD82H55PRFZ48DDnyGbhmxkmKMB3w3Ma4pxwj6DQsCXe5lF5+aTZzc4fomg4LgY7J9AbG9RhsaYDgn7iZcL7LaH+iKpl5jLD3eSvF008xlCWImA628CMnpRLCQuOH0n5bBRDTf5zc0YHyjBz646Sm19RvmSLNz1TPRQxyey7HJJQbsJc6cH5vG/eUkaMmKbmEb4WYOMkn63SGzENR5s8XPBDPno94R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66556008)(66476007)(6636002)(6486002)(66946007)(4326008)(6862004)(316002)(8936002)(8676002)(83380400001)(66574015)(478600001)(26005)(1076003)(41300700001)(5660300002)(2906002)(33656002)(38100700002)(82960400001)(6512007)(6506007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rwR2D5lqrPa6j6BsaUUJrUVUW5DVyzNEnEFGGPVPk3U9Xi6FCTEv5KP+pF?=
 =?iso-8859-1?Q?Ui9kfwjWhRaroWPI1ttK4oR/KvwGZDXyjN+t5KRPjUrJNKspaYYBnZdeAR?=
 =?iso-8859-1?Q?uloPeJ1VJDLz9TuXuJmkddqbZSRhignGDMGoTvE8+oQElqwhRsiSULcHUe?=
 =?iso-8859-1?Q?QOIerLcILJAOsnDz5P3Jlx+HV+zykn7nejMwPrZguRjIMLGrRgcMq4XJXS?=
 =?iso-8859-1?Q?jCSPLDw74cxIQFDUoiy5pT+e8gMmXKUdHSPV8OYAoz57l4Tp1+bdhypf4S?=
 =?iso-8859-1?Q?zmvy2D+LAcOkDckdcZ6iWjQrySxeJ3m6dfK/1tznTyuj1K79D4cEKvQ8bQ?=
 =?iso-8859-1?Q?8FI1Mf6XcooEuyxHbAgj7cfYmKKOrknEQdLi1qAMiYNuKME11ZlWrGYKaC?=
 =?iso-8859-1?Q?tCgtUek6d+87pMw6qAMVDgmPy/VS1qzRmDwLGQ760eiUkO83uZ7RVKkJfz?=
 =?iso-8859-1?Q?rwLVX4jtnU/g/RTKUjl/ESha9OAjWLatMv7YXz6x9Ffp0XdyqnfSqY3AeO?=
 =?iso-8859-1?Q?M7oN8g5sr108GTrqAJkk2l3r2zHASYOJVF1bIjpwV4inWMZYjwFDkvQfiU?=
 =?iso-8859-1?Q?ZOpb3mGfb1Y4k+VWVOeCz9KWKgwyU3AvE7DNXjFzYLPbB9oIWAopIHqOp9?=
 =?iso-8859-1?Q?TadCro7KOY+Sn1sCcqhptzthp6pW+BzAc+PYW+5fJtmuBe/AFkpuzgfgfX?=
 =?iso-8859-1?Q?fBxEV+VnN3OXtA4UOQ/nvTcO73jdnF0a8+QXNwle9F+9v+68jF7be+taxL?=
 =?iso-8859-1?Q?jjrS5/8SsPoxAeu3cuihmSaCQFpEszCDN/GLKe7vS3HaWwezFPbbkbrwSm?=
 =?iso-8859-1?Q?NfhzrNwKianR8L5Ua3miQJsq5lunwecJbMewX3GpbzFM2stYw6hcFQuNZ4?=
 =?iso-8859-1?Q?BhqYppgoIyqHFi+k6cNM89/U2xHk2b4Y+/Ze9/bWpZfNm8ALp3tHj/m5S1?=
 =?iso-8859-1?Q?ZAj7lkqW/CATbUnMZ4zuOEarEXd/0SlZmS5q8x8iN/NVpCDpJHmfR7DlRP?=
 =?iso-8859-1?Q?RER20SnDNXBCE8Z/R2olafJtsF8YQljBziU37bDr3dOgkYtqkdgHV8BjBa?=
 =?iso-8859-1?Q?1NSCObokK46DA/UKi7hyqH3RfVKKUVv585KxnLOEpBitd30D4+iOikPy/f?=
 =?iso-8859-1?Q?Vux6knkXQwR1+8jqG0Xn1n5gAjo0s5M3MKQfGqukDtfiJk4GHNRLXtYGAy?=
 =?iso-8859-1?Q?vd/VadrrZQAV+eHCJhcZRu1pMbfcxiio4lSu24NnfOP70b8KBIB4fh3EKh?=
 =?iso-8859-1?Q?RpAi3ye3vS2w6oVS/5yLhIU6Gmn8cj8O6P2qPooiNyoALrkNzQQ5Un3hI0?=
 =?iso-8859-1?Q?fewUASNnIZ4n4Nsqu7ZSO9a2gg7v8azXY4l053K6xbRxAQmfjhw8pUB5Xy?=
 =?iso-8859-1?Q?jY9uWzArdgN0ef1Ohj6wPBxlglKhzYPVqwybCAQLgeyBKDG6xYT2SFb3tV?=
 =?iso-8859-1?Q?XG1vRzWWDB/51Q8NHM2ckG7sTzDC1X0ITHApGhSDMLsOFJ4Y/88RbSjtPR?=
 =?iso-8859-1?Q?xb9C2qlpQSttJrHH3yTfOU6/V1cP83aTSxj4H6DVvqDinHvixjdVnc93qP?=
 =?iso-8859-1?Q?XuWgFJ2Ml9vQef23tGV7Je7/pMfydxnNelFvbRvHjTXjqin5W6wZ1RScql?=
 =?iso-8859-1?Q?ap3BxEA6Dnk7zxRloTIwqMeBXUk8x1tfhPEt/fnUs5KsU7TEcohgu90g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a92a6c-e398-44ce-2af9-08dc0bf997de
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 01:16:20.4384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVxUgKBXMoHd0d4jv+uSAhrJCMpK99SC8S+dYfKvNoILiGxTWFpOKi9BrmoeIKYueHlJwkfM2h3QNaps4z4TMLjqimho8yUJUuW+ns7/v3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 02, 2024 at 10:21:42PM +0530, Himal Prasad Ghimiray wrote:
> Use XE_CACHE_WB pat index by default on xe2 platforms and use
> XE_CACHE_NONE_COMPRESSION pat index only if buffer supports
> compression and indirect access of flat ccs.
> 
> Fixes the broken "xe_migrate_test kunit test" on LNL.

How/why does it fix it?  Explaining why this is the right thing to do is
more important than just stating that a test changes from red to green.
Does the WB vs UC even matter here or is it actually the coherency with
the CPU cache that matters (meaning UC+1way would also work, but
WB+NonCoh would fail)?


Matt

> 
> v2
> - Fix the argument to emit_pte, pass the bool directly. (Thomas)
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index adf1dab5eba2..e1a849d74826 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -439,7 +439,7 @@ static void emit_pte(struct xe_migrate *m,
>  	/* Indirect access needs compression enabled uncached PAT index */
>  	if (GRAPHICS_VERx100(xe) >= 2000)
>  		pat_index = is_comp_pte ? xe->pat.idx[XE_CACHE_NONE_COMPRESSION] :
> -					  xe->pat.idx[XE_CACHE_NONE];
> +					  xe->pat.idx[XE_CACHE_WB];
>  	else
>  		pat_index = xe->pat.idx[XE_CACHE_WB];
>  
> @@ -729,14 +729,14 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  		}
>  
>  		if (!src_is_vram)
> -			emit_pte(m, bb, src_L0_pt, src_is_vram, true, &src_it, src_L0,
> -				 src_bo);
> +			emit_pte(m, bb, src_L0_pt, src_is_vram, copy_system_ccs,
> +				 &src_it, src_L0, src_bo);
>  		else
>  			xe_res_next(&src_it, src_L0);
>  
>  		if (!dst_is_vram)
> -			emit_pte(m, bb, dst_L0_pt, dst_is_vram, true, &dst_it, src_L0,
> -				 dst_bo);
> +			emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs,
> +				 &dst_it, src_L0, dst_bo);
>  		else
>  			xe_res_next(&dst_it, src_L0);
>  
> @@ -978,8 +978,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		size -= clear_L0;
>  		/* Preemption is enabled again by the ring ops. */
>  		if (!clear_vram) {
> -			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
> -				 bo);
> +			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_system_ccs,
> +				 &src_it, clear_L0, bo);
>  		} else {
>  			xe_res_next(&src_it, clear_L0);
>  		}
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
