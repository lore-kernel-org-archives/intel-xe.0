Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30F3C001B0
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 20:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973DA10E6FA;
	Fri, 11 Aug 2023 20:41:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6217610E6FA
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 20:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691786508; x=1723322508;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VC54r6WBZba+6Q3no3MVF3kRkZwxxYD4uMaR97SP6eA=;
 b=kwf61HlGzCCVXStghTyM2gnF0C/WXlL3fcJ4Qup5GRKr4+31YRFnsD16
 BWXvRkBFzbRuqRWy6BBwmKDRu91X0AYs12TwiX3Y/IYDwsZk4CgQPsXXE
 CSk2dcs8Hrj+lDNwQbR21OmAXsPWiOiRSJIYpIZl8mg6vNJCEai0R9cYe
 UpeJtrqlnH13Ofy4929govH44otUQLwyJi87U0Q6rTiHk1Ddy7xodds8J
 zrrcT/6LvbxaMdgPeo9Z1f77u2awq5jh3HWUuB+mP62c2VZ8KMD4F/tkd
 T4RvrFDGFvlLDXIqGEOvuPujbpMZJsH5s7GiMoGdk/mAiNWtKS9djogEf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="356719231"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="356719231"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 13:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="798156044"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="798156044"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 11 Aug 2023 13:40:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 13:40:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 13:40:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 13:40:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgysctpBPF6grDmFXtRkB+UUAAUsTPQRP5U7zwZg/N446bfnHoAM/7ChpemxV83jvGk2jTlnNAh86EoHZUx4AoFG3blbFfJl/abMpzIfQjur/KVCWdvgfhgXKMIRXemBpu1S0lFpfkKKxrNcw8ncweTT3aaminUZ84Og3jzqDx8Totvhr93Svr2pAnjo3ehxh3udflRTGPrVyne6UtenZ7e2hO8cg4VeanPC9j1mlPWo9niFQPkEzfnS6YHy+EX7c+mn0AESme0ou/bsQVcTDx2PnCxuvNX6YL+jleBmBzlUMUyeFtju94jphkRpdhYWCBdp3wIAID0fi9ZYobnRGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTjQoDn7g67a792P36wx3eawzBaMZSLYtSq23GWnHQQ=;
 b=ijDqfDOAlNFjbwMKn8R+cmJqaKvRuLe4C+pyd17SWwF3FyfIqq6MzNx1cE7OQb8Gap5JRXV/RyRCHnlJ1KBdJ37AVLT55GO6oSD71AvTfUF9spWFRg99vvd+pRaFQklMHsJ3dsoNj82lSAyPbWb8rylr/E819j019JtAYNCCLNeMd9q/+WTolDWMWNXZNYVJI/2DwB4nPRS8WzPpnGxnXxi8ne9sF6trEWGauQDPJAN6yDQvKYU/g3ZOUr1xUuoHbXhWkw7tWVQhPoTQ6SxMt2uJq0+mRRmXa/xMqIInzEtzcMgjqGcmpAG/ce/l2c6VpTt62GHBYcN/RVHFlWChxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5067.namprd11.prod.outlook.com (2603:10b6:806:111::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Fri, 11 Aug
 2023 20:40:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%4]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 20:40:53 +0000
Date: Fri, 11 Aug 2023 20:40:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
Message-ID: <ZNacoh/IWD+W8T11@DUT025-TGLU.fm.intel.com>
References: <20230811193923.132091-1-oak.zeng@intel.com>
 <20230811193923.132091-2-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230811193923.132091-2-oak.zeng@intel.com>
X-ClientProxiedBy: BYAPR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:a03:114::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5067:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f8c72e-286d-4a20-02e5-08db9aab41b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZvuABbKlaJHKHa5vAn2SdpB4MPClX63+dhieb3camfAdLYaN/C1+2YFD73+HJX4yewJtlaMgWufGDzfnClZn/D0w2TusNrjDQ5g+3gCp4OdXpt7jREFU1cj5VjTo3BREGGGIBladkA3kSsm0nX2RUYSJx56XuMgUEXkolzeJuJilYgZ3+uSYWBWKVyDqXFgVC7hhBk7RedmsWJgIZ95IVZj+9K3HbwzWzpWyja+GHo3+sfd2Y/2NtAGKWYYPDtEM2q1P6KQFrFwMS1w2aThnMB/EUqFtXKdOFX03hbLS+2RNSuFpMcY/sgy0ElsYtUuFf6fenS1o+ZPU3KwLH8DQdWAYmeWE75LRiTB2e2lgtmEdr4kNPhlYgEsCwmmeAUUcDi2DH3q3bcA5BrRtZ3/mrBCicovSmW8eZ/zzEZyWLtZSkAfSrdkt3zlAnLMi0mP4VGEqn2s18Q6yL7RWp6VGGumqByLlh3rIjbtoyKO0cAnCUyu1Mll54aPBMyUzfJFDOQ0PU+EzrP+xTAKwINEL3ZxCFwDkAYKWkS2PgBfBE5Q0tL7cblIsV/P1Hvp2HFY8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(39860400002)(396003)(366004)(376002)(186006)(1800799006)(451199021)(6862004)(38100700002)(478600001)(66476007)(66946007)(107886003)(26005)(6506007)(66556008)(316002)(6512007)(6486002)(82960400001)(6666004)(4326008)(86362001)(6636002)(41300700001)(8936002)(2906002)(83380400001)(8676002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m/WUx7EAPEI8z+EzGLuYWaETpE/JkTft4O6ya55Uf1/XKUxVGLOLjo0+eBbY?=
 =?us-ascii?Q?LUi4hCam6Fz/2Pug4aJowoq049Xgh1uT7a/iWAAMasYnvtjeP6E5dO9jV8K6?=
 =?us-ascii?Q?HXmNeA73SZ+NSYi5r9AkWA9M4Uc4YisKLZDTmUV5XAQO+tbfqK3tUZqpzpiL?=
 =?us-ascii?Q?iphsVbaZD831mBHI5jw8KPtasbd72iAqfP0BuiA4LkZicKedqSDCdrsqXUOJ?=
 =?us-ascii?Q?/Mvj0lPg4/+3rsrzhXlhCJ8SRwa7xXUL+0x3WSBp/ijgHTAsCtEOfqAhw4U4?=
 =?us-ascii?Q?vF1VEG83SUD7mCQ7bgCfT9UwWvXOlnm38Wp+hsZqDT5KuOriwZTTIBXjM+wB?=
 =?us-ascii?Q?QoPbsPtos2Wa6KoY0+v0U5J5uN3A/xZAOsffkjB1SJAlGh081a5Wx6ZJkyJC?=
 =?us-ascii?Q?+tyWhZpXjveVo1tCTY3BMk2/1EuK2pHc0s25DuKp+yEdVodHgU33lNktJ4Q3?=
 =?us-ascii?Q?RoOK00tyngCUw8fBS67BE8ut+jGZeRf24hljbE0RHZoqa2Td3pH6nM5sOlH5?=
 =?us-ascii?Q?iagtCUFLfGTW/9ITpJa85DnG4onVHt6mOanZEd16sWhN56YBPgq7F8zapGgY?=
 =?us-ascii?Q?Inc3ONlKTuX8lvEh6B96uLGzCAwZ1Rpimfpw9ipYBNXT3H3WnNGxdAalrZTf?=
 =?us-ascii?Q?4sF5fPQm9nebnrYHXLIpDz/YBmz4lLzjOz1d3v0G6lqct6ntxO/oqV49mvNy?=
 =?us-ascii?Q?Nk2xHEWfcJ7eZvbNdmHZNVbpSxsZYyre15Tm2G1il0YWUZEh9l0XfRrenmlf?=
 =?us-ascii?Q?WMgiOB/+xCL1037ZJXI7dpSVDr/NfyYhxislwC11kX79kvzhU+Dj/F+Vf6M6?=
 =?us-ascii?Q?v4joxOg7px2hXRhXBfoSwQlDc/9lj6tHlE8psctYroJ7n0cMOylk5XO9AxHs?=
 =?us-ascii?Q?NsewyudbA26IGQGn4ygLT7VaMJpcYF2oJDI7mG05dg2jckTTcIup1rz3Exr9?=
 =?us-ascii?Q?0Joiw8X/lFkZnj6AsFi8AAo7qHaldVi0fBK5smvatxqnVWtU6BWCm6cZwQRb?=
 =?us-ascii?Q?5nHvE3NOTQEdnXRmSVA8oMyb+zCUrMB1I998CDhA95qNHgi037mZUUXQhbMf?=
 =?us-ascii?Q?dpyRy9Aujsq5ouCCi17mXL+TjDxHRZLsMpnjDhtJBGUDOb3za9yuDkmJFlyY?=
 =?us-ascii?Q?6WBtPdXYC5gLcCTsf8eXP2gzxHClc9tj5bMuQ8Qd4XQwZTgQw9qbSRz1TfLa?=
 =?us-ascii?Q?1esuey+j0b1h+0hylbQe0+TXs87J8s47qVBn5oOiiCrVHIM+/NrZba55VMAj?=
 =?us-ascii?Q?pAfOJi5u6ATu7LuRUjK1e8+nPjObfPNUAdEP5HCElx6PeTDSdItBsc/Ht3lj?=
 =?us-ascii?Q?7HmCv1XNHMqgOP2yv1jQ4Lym05xgS6cCs6Nr4Ltsso5xSjx2+KUS1lmEYZ96?=
 =?us-ascii?Q?cxORjz/8r1JFeGWsLWvVOOZfLj37qxjYj30d6t3tEuB3oTQGIyE2xwKDjySa?=
 =?us-ascii?Q?7M8ZJDIw8G5NZmT7HbWAguRttIredOgesX2ppcP25cInBwItd2HOaDLygcvp?=
 =?us-ascii?Q?WQrVJnQQk9O8PPvlCtzUYyTKqcdiOXPY8l1VIki/+HAXecyzkzWY2JFgGBO2?=
 =?us-ascii?Q?d/kYEmwrCvFIb5/yw1qg0CXcqd5wx3E6cHX8lWDmeXkxdJrMxLpXD6Yx/i7y?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f8c72e-286d-4a20-02e5-08db9aab41b1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 20:40:53.6311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmNW7ouR4QdR28LwooEOGXiQGZrb/DjSKZrQ+L/4x7WhwSe3fAMxI0GB3qXifm21A9qKYVHQzaKQEKvtWbWMXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5067
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Improve vram info debug printing
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

On Fri, Aug 11, 2023 at 03:39:23PM -0400, Oak Zeng wrote:
> Print both device physical address range and CPU io range
> of vram. Also print vram's actual size, usable size excluding
> stolen memory, and CPU io accessible size.
> V1:
>   - Add back small BAR device info (Matt)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 41ee89247ddb..bb6823db14d4 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -286,12 +286,13 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  		tile->mem.vram.usable_size = vram_size;
>  		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
>  
> -		drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, tile->id,
> -			 &tile->mem.vram.io_start, &tile->mem.vram.usable_size);
> -
>  		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
> -			drm_info(&xe->drm, "VRAM[%u, %u]: CPU access limited to %pa\n", id,
> -				 tile->id, &tile->mem.vram.io_size);
> +			drm_info(&xe->drm, "Small BAR device\n");
> +		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
> +			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
> +		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
> +			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + tile->mem.vram.actual_physical_size,
> +			 &tile->mem.vram.io_start, tile->mem.vram.io_start + tile->mem.vram.io_size);
>  
>  		/* calculate total size using tile size to get the correct HW sizing */
>  		total_size += tile_size;
> -- 
> 2.26.3
> 
