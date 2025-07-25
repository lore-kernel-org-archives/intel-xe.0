Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97749C87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 21:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D02B10E23C;
	Fri, 25 Jul 2025 21:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XpK++CUf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2049E10E23C
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 21:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753480251; x=1785016251;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZSd6NI5kBzh5eMdy01sHGk2kpcr3MtFKnwC0u9JFSOA=;
 b=XpK++CUfbRZDcoKuTlb8WZqjszMDxGMUA87XU4KiFqgF5c/Nv5hufbeO
 6CFTJfp0vHvEDRTXIsYRZuJnPKYqOtqyzfpGW8xM8Tu3KYd8ocn1pN8XC
 Ulvn87GK6bESJtYoyJqUoJWI/c0Iz1/hqqLCkOmBFka6SN2brx0yrnvqP
 ebsannh56h6xgYJLcG3l1yzvDM0qsHYnlio6Dzc7dYmpXOkZn2CgpKtpV
 3f65pGZjlOI5srYY2mWYCgfdB17zeDb8eZ7NzYgg7U7Aec6PTwFas4gN/
 4PfrjQH2BpMbBPzrTKmmMUU458zLBF2xQ2W80GvVN205yx1LcJkMSO+tI Q==;
X-CSE-ConnectionGUID: iEtcE3izQ76ClsIwvqHBiA==
X-CSE-MsgGUID: PL4f8hzpSxyIQ4CRMorqug==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55970475"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55970475"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 14:50:51 -0700
X-CSE-ConnectionGUID: wUk559Z2RUuVde6U5sbzXQ==
X-CSE-MsgGUID: mdTjNXizTCyTZzcRMsbzFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166515066"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 14:50:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 14:50:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 14:50:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.67)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 14:50:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jubgCkjbffFyF1N7fmV2Z4bFBFGGfU7pY9hL2aUzjp/0eT4/k+VJDY81NU+MO3cLg0YpHHVYkBfK3ojYwxM2/hckHQOn/BFECur1k8W6cuUXbT16STSbcXqxEODY2DLGEfDKjKahvV3nsnCVzoTJNfe8wyZhiOrAahdJDn0d1ls7GYWU80Rt2vmHq/LchSeGy3LSoTOVTmGeK2Rb91T92bay7EnrqXfSCdMhdhCz9lwKJ8uIejpw5fBf5Tki11mhAjBz37Vom201vls9FcJK2bF+rlEVQ+1aX12AF/TT4BcQwBhIvTgSJ0rl4ZL4CJqnrVIjoX5AJACfCdv4crqsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4+uSauBTvxnaImeU+aZjFth9EPwxkURVuzvu4jdXIc=;
 b=jcZU7PZXmVfZM/42/ebpg3VKbAW40YXO5PlIK+QZJtxCzzLTSOEK8hcfwuVfycfrgEfGZUgXJPX61x7HCHYvnxAZK0os3YS7UC+pwG5H2E7Pkj+snny9jc09WXcYfuzq0c7f+u4d4xvx2On9aCvI3VGsygw1TCnVCpJNJuo4kun5B1EVrRKVFT8sId2MVrdHHJX04x6O3DWLXI2LjgB4KqcAMm0O2ImikNT2j1blTK9vPNeg5OEGSlc2yAvQyk9P6Xh6mwVs2XlFaK0KFbyWaWe2sx6MZkHIZ/wEWx595j7tTqEuRLrLAhsjvi12u+/LMT3CKMsBEZsL8gH+NnTwsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8408.namprd11.prod.outlook.com (2603:10b6:930:b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 21:50:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 21:50:41 +0000
Date: Fri, 25 Jul 2025 14:52:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/6] drm/pagemap: Use struct drm_pagemap_addr in
 mapping and copy functions
Message-ID: <aIP8ni38QBBucOjA@lstrano-desk.jf.intel.com>
References: <20250725154011.2807655-1-francois.dugast@intel.com>
 <20250725154011.2807655-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250725154011.2807655-3-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 22dfdb98-3471-49ff-822a-08ddcbc54cb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iavp1R26Zb4t1AwtTGaaPBbBS9TKxUf8klcyLDuf0f+O4pK5n3/jS5aER/eO?=
 =?us-ascii?Q?MMLsxJXW15Z2zzGU8XUOK3zomnSqbHdy2SQfMtZEb1Ar74XF4YpHldGJzoLx?=
 =?us-ascii?Q?ePsFfa8PzzdEBvEcVh0guW/s0XsL/vZDt2f2NQepY5MD7dAIsa1ZPtk3Df+r?=
 =?us-ascii?Q?XR1n9T4mwT4TxwkjXg69wGsaY7S5o4nmzlXxeT79QpNLJ/6MkxTgWHQHVKtr?=
 =?us-ascii?Q?VX9jSMlgpBr02lkgq/U+U9HHhtV3u9PmUGgTOmsSYUTimbqBdcAaGggtnaAv?=
 =?us-ascii?Q?F4O0Uds4P7ShbLR3NpoRCExRsWUMGTpfGqDaRVXvxjsiM0UGy3fvzPbjVKrF?=
 =?us-ascii?Q?sCnGntkVhAkkYPvLNNACCGRmdoWSiUmz2kO8xptmILgFziTxWHmgPYDKMrx6?=
 =?us-ascii?Q?ZbT+eEp4CRN14IVMoCpyXGohU5Xs28eseB1x/QOohCBCssTH4skikgv6/tGm?=
 =?us-ascii?Q?VToBjZ4hPjO2t9wuA79r9LGCF+JjU+W1A/1V+da14MITbCkBVA/hrCrAXIr3?=
 =?us-ascii?Q?u8mYCrFoFFTyqzrLxbFNNkhi20Cw66wpY3luyFCVdosLNR5eqe/PeCy/pGG7?=
 =?us-ascii?Q?Ui/ufyqkK0NwUxXhRDxZf/xQFyFMskbeBhaPXxhdFZMyUTz5VVG6oPYV8lfJ?=
 =?us-ascii?Q?jJ4MsnSs3NfrnTDMd9+Pbs1RgWe43rYg6OPhO8oGQFOT851KppZ0koYBbykY?=
 =?us-ascii?Q?4hSSYA8YQKrh0xeFuP8LE93hOvgO+I0rxkWadZrxWIn6bH9++FQ2CQqjTi2n?=
 =?us-ascii?Q?pZ/CqqOKmbFPBOVxkFqeWtwhLc+rDZz49bUhoF15OLZhInIww1M+dTeac/pH?=
 =?us-ascii?Q?BHz9Vdan/Mw7NyUPx2Wl4otXSO1Y4cAKK3hLmMHA7dPJGokFvzku+X713Uil?=
 =?us-ascii?Q?GlGCx0ZCKsmBo/bVG3A1OUGdkaJxnIixzUEwU8rk/22FqaMen2BjaZnkf0u5?=
 =?us-ascii?Q?cloMxjF8XM9URRZCwKgZYJ3a8Wd4nsu4qLU/ti16ob/3Ve1gxfYO7wjDlp4T?=
 =?us-ascii?Q?qCNypNBc1XWVzwis72lwNTQnOebE45tMcJnqyxCvgOZz/VV2IEnZn6RWTlNX?=
 =?us-ascii?Q?YPuzmh9g/9Z+TUWaVof6STZdGI9adPMbqNNf9Y/dzpcMQaB3ZGL9e61dxDy+?=
 =?us-ascii?Q?mciknrPT/EK4t7/qC/Ng7hRSn9eh1kv9LjaMYrBxj9qVsYtr7H0M529yPfAb?=
 =?us-ascii?Q?OoctjovkGkrp00p8x7dg1oC0FUBJKWlhQAB2um2MBNXRLJKjEkboRIMjm1Fo?=
 =?us-ascii?Q?p4uhciKg51YMwZShLMs/BvyPmt6qiZes8IJA6uqUIMiIlsYQl5sxuH3MhF7g?=
 =?us-ascii?Q?7sC2ZeEQj/8nFEZcwSNHm2oLgK56q2nlVu1FzfP568cWA9ye5jS/s3Fv0vlO?=
 =?us-ascii?Q?GkOmo13g6mKXzWgp+T1c5rGCS79R7hf9+P0U53xprBZqwIUXnxqmTYY+BHl+?=
 =?us-ascii?Q?+7y6g5fB1hw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nMe/7HLIIGqEOx/beNbeerKmfQgJuhlJ/vozcQso1kxUuycyyOVJqvU+iP23?=
 =?us-ascii?Q?3X7DW0U5GcsLeiF87Q5YjT8PUesL1W8sKTO6YjWZQH8tFJFDaTS9JfqdDoy3?=
 =?us-ascii?Q?j4lwEe92r4YS5AaXBMr7RkxgnGABAlTN381gZoMjY9DFIzes+OFrbeUH5m2b?=
 =?us-ascii?Q?fLWEdtW9+uGtzwMs/WNMgPnjMBg2aFbQG5ToVhFUjFz6TpuT3QWw83sKCZEs?=
 =?us-ascii?Q?i+dD4rU21CudGhTg2aaMWmZ4Ot0eeraKDnTvoUXYF4N0JEIbo3CstSqcTxPA?=
 =?us-ascii?Q?LUti+6gB7Qm+33mSB8jOhoBgIvnBw9OILzpSRnCEBTy8FEz0e6NKkZFWhBFu?=
 =?us-ascii?Q?OSkwqcm5ozc/gXhf5Jt8uhtNs6xz2kcGxfHdx5+JAXPStOzlKr/svCxdPVDZ?=
 =?us-ascii?Q?8mkl6iXn991wbedkOli0YBc7lOiLxde98pt9DfLNT7Z7yAzwYp8JsxHsjZ3C?=
 =?us-ascii?Q?4OwoxgsiTd49kyKmV/giHWDAuUPHIcB9hJbmKnmo+2clM4Rd9gObyXyc3IT7?=
 =?us-ascii?Q?DsddAy559Lp8TmP8RDcfivR1EefFgON2BgQqSd96gmpVvOO+xog3oWP3sPO5?=
 =?us-ascii?Q?DBxc2TA72AgjwnJ7z6ov7bUZyxwuUgomFmXvny28ST/NW5ifvQE5y+qJKcBs?=
 =?us-ascii?Q?T2YmmFRmwg4B24O73dBfCfdMX1mGEJgCYVIM5xaoWl5qSAdoWzDjeITYt3C3?=
 =?us-ascii?Q?m77Q4DRw4IffNe5SKtFOzUqOsViLgrdF91i6EvbqDXpk1LDE6Dv/Phw3HBqL?=
 =?us-ascii?Q?REzuzBvGI4t+7MGTJhuoNQHEm9PVMFeQ9i++16DN3lx82taqz/2z83lyw/DJ?=
 =?us-ascii?Q?nUKAJlhHJFJL9Ooteow8lIf/D+2W34YZM/1iAMDlROogvGX7IsJ4sYBNfkCz?=
 =?us-ascii?Q?vF1LYZpZOLE32Um0Pv7ptvpVwJsP4O9C++vF5er4/7alFlOKIIw1E6VAjfcF?=
 =?us-ascii?Q?G9s9AyugFFFztakkSMSKWgCjNrdNCy2a0mdK0dwhX/6w4yj6HIYhHY2f4x/C?=
 =?us-ascii?Q?T1KJ3MHo197wlJpTHlCgr0LPYB7QUNk7O8DhpOozfhfMy2IQAz7A9aYyGPuC?=
 =?us-ascii?Q?PqATLhqdOukup6qOOdXZYo3+1gVvY9h82ORTSN+/2+9cZH0G2zrQco36oIQZ?=
 =?us-ascii?Q?87q8keRObHto/3OtK0TlR9trV9H9OC8g2xt2PyTWn+9jFY+FBq0gb8faIO/y?=
 =?us-ascii?Q?Xg7Ma4jQDuD7DRDKCx+gWAm6LlbFP1Eza/vYPELJaFjmG+JPM5JjFSQXcnFj?=
 =?us-ascii?Q?9iOqP0V6FQiawGDTXkmI+I095b0yuQwa+x6zTzGtH6gd8/LvMZxyF8Imi737?=
 =?us-ascii?Q?/5s7Yo20G9JFFNM6TkQZd8QMIc2nq/e4XmQgbGdqiGY/2ODoYHOQLckWHxWa?=
 =?us-ascii?Q?eVxU4uR1mgjGUBTPDXBjzn68m/eXw50KQY0mTBLGMcRIncZGvqOrT1ZWYjxi?=
 =?us-ascii?Q?f8t/u/Dvc4ZAv1rGDH97VyUbzGVITV/gZ0nXVbDYgJL02HQvVeE7H++xbGhX?=
 =?us-ascii?Q?QmUXahb1bUQdqTFh/4c4n6cE/XzKNfQbHLLdUwDLHup+3CkwCTaRsCufRCfg?=
 =?us-ascii?Q?aR8z41WkAdZjtLs0A4+mfFo40VX+byoomz2xAV735o/34eIEnFl9vrbdLju6?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22dfdb98-3471-49ff-822a-08ddcbc54cb3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 21:50:41.4440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLagNLZ/KpEs3hDC3og9Sm0M+dwmAD3Fq7AmjgAwglZ1EO4z31VshzoM1lBFeeFrop7By66I1qwx0u5hmLOKVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8408
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

On Fri, Jul 25, 2025 at 05:39:26PM +0200, Francois Dugast wrote:
> This struct embeds more information than just the DMA address. This will
> help later to support folio orders greater than zero. At this point, there
> is no functional change as the only struct member used is addr.
> 
> In Xe, adapt to the new drm_gpusvm_devmem_ops type signatures using struct
> drm_pagemap_addr, as well as the internal xe SVM functions implementing
> those operations. The use of this struct is propagated to xe_migrate as it
> makes indexed accesses to the next DMA address but they are no longer
> contiguous.
> 
> v2:
> - Rename drm_pagemap_device_addr to drm_pagemap_addr (Matthew Brost)
> - Squash with patch for Xe (Matthew Brost)
> - Set proto and dir for completeness (Matthew Brost)
> - Assess DMA map protocol (Matthew Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

One musing below.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_pagemap.c   | 63 +++++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_migrate.c | 67 +++++++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_migrate.h |  5 ++-
>  drivers/gpu/drm/xe/xe_svm.c     | 37 ++++++++++--------
>  include/drm/drm_pagemap.h       |  8 ++--
>  5 files changed, 100 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 1da55322af12..de320aeed812 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -202,7 +202,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>  /**
>   * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
>   * @dev: The device for which the pages are being mapped
> - * @dma_addr: Array to store DMA addresses corresponding to mapped pages
> + * @pagemap_addr: Array to store DMA information corresponding to mapped pages
>   * @migrate_pfn: Array of migrate page frame numbers to map
>   * @npages: Number of pages to map
>   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> @@ -215,7 +215,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>   * Returns: 0 on success, -EFAULT if an error occurs during mapping.
>   */
>  static int drm_pagemap_migrate_map_pages(struct device *dev,
> -					 dma_addr_t *dma_addr,
> +					 struct drm_pagemap_addr *pagemap_addr,
>  					 unsigned long *migrate_pfn,
>  					 unsigned long npages,
>  					 enum dma_data_direction dir)
> @@ -224,6 +224,7 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  
>  	for (i = 0; i < npages; ++i) {
>  		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> +		dma_addr_t dma_addr;
>  
>  		if (!page)
>  			continue;
> @@ -231,9 +232,12 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  		if (WARN_ON_ONCE(is_zone_device_page(page)))
>  			return -EFAULT;
>  
> -		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> -		if (dma_mapping_error(dev, dma_addr[i]))
> +		dma_addr = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> +		if (dma_mapping_error(dev, dma_addr))
>  			return -EFAULT;
> +
> +		pagemap_addr[i] = drm_pagemap_addr_encode(
> +			dma_addr, DRM_INTERCONNECT_SYSTEM, 0, dir);
>  	}
>  
>  	return 0;
> @@ -242,7 +246,7 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  /**
>   * drm_pagemap_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
>   * @dev: The device for which the pages were mapped
> - * @dma_addr: Array of DMA addresses corresponding to mapped pages
> + * @pagemap_addr: Array of DMA information corresponding to mapped pages
>   * @npages: Number of pages to unmap
>   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
>   *
> @@ -251,17 +255,17 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>   * if it's valid and not already unmapped, and unmaps the corresponding page.
>   */
>  static void drm_pagemap_migrate_unmap_pages(struct device *dev,
> -					    dma_addr_t *dma_addr,
> +					    struct drm_pagemap_addr *pagemap_addr,
>  					    unsigned long npages,
>  					    enum dma_data_direction dir)
>  {
>  	unsigned long i;
>  
>  	for (i = 0; i < npages; ++i) {
> -		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
> +		if (!pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))

I think in follow up we want to fully abstract drm_pagemap_addr, i.e.,
add accessor functions for all fields encoded. Thomas and I discussed it
might be possible to fully encode everything in a single u64 and
accessor functions we let use easily change the internal layout. Not a
block for this patch though.

Matt

>  			continue;
>  
> -		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> +		dma_unmap_page(dev, pagemap_addr[i].addr, PAGE_SIZE, dir);
>  	}
>  }
>  
> @@ -314,7 +318,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  	struct vm_area_struct *vas;
>  	struct drm_pagemap_zdd *zdd = NULL;
>  	struct page **pages;
> -	dma_addr_t *dma_addr;
> +	struct drm_pagemap_addr *pagemap_addr;
>  	void *buf;
>  	int err;
>  
> @@ -340,14 +344,14 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		goto err_out;
>  	}
>  
> -	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*pagemap_addr) +
>  		       sizeof(*pages), GFP_KERNEL);
>  	if (!buf) {
>  		err = -ENOMEM;
>  		goto err_out;
>  	}
> -	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> -	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> +	pagemap_addr = buf + (2 * sizeof(*migrate.src) * npages);
> +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*pagemap_addr)) * npages;
>  
>  	zdd = drm_pagemap_zdd_alloc(pgmap_owner);
>  	if (!zdd) {
> @@ -377,8 +381,9 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  	if (err)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
> +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
>  					    migrate.src, npages, DMA_TO_DEVICE);
> +
>  	if (err)
>  		goto err_finalize;
>  
> @@ -390,7 +395,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		drm_pagemap_get_devmem_page(page, zdd);
>  	}
>  
> -	err = ops->copy_to_devmem(pages, dma_addr, npages);
> +	err = ops->copy_to_devmem(pages, pagemap_addr, npages);
>  	if (err)
>  		goto err_finalize;
>  
> @@ -404,7 +409,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
>  	migrate_vma_pages(&migrate);
>  	migrate_vma_finalize(&migrate);
> -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
>  					DMA_TO_DEVICE);
>  err_free:
>  	if (zdd)
> @@ -509,7 +514,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	unsigned long npages, mpages = 0;
>  	struct page **pages;
>  	unsigned long *src, *dst;
> -	dma_addr_t *dma_addr;
> +	struct drm_pagemap_addr *pagemap_addr;
>  	void *buf;
>  	int i, err = 0;
>  	unsigned int retry_count = 2;
> @@ -520,7 +525,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	if (!mmget_not_zero(devmem_allocation->mm))
>  		return -EFAULT;
>  
> -	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
> +	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*pagemap_addr) +
>  		       sizeof(*pages), GFP_KERNEL);
>  	if (!buf) {
>  		err = -ENOMEM;
> @@ -528,8 +533,8 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	}
>  	src = buf;
>  	dst = buf + (sizeof(*src) * npages);
> -	dma_addr = buf + (2 * sizeof(*src) * npages);
> -	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
> +	pagemap_addr = buf + (2 * sizeof(*src) * npages);
> +	pages = buf + (2 * sizeof(*src) + sizeof(*pagemap_addr)) * npages;
>  
>  	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
>  	if (err)
> @@ -544,7 +549,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	if (err || !mpages)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
> +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
>  					    dst, npages, DMA_FROM_DEVICE);
>  	if (err)
>  		goto err_finalize;
> @@ -552,7 +557,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	for (i = 0; i < npages; ++i)
>  		pages[i] = migrate_pfn_to_page(src[i]);
>  
> -	err = ops->copy_to_ram(pages, dma_addr, npages);
> +	err = ops->copy_to_ram(pages, pagemap_addr, npages);
>  	if (err)
>  		goto err_finalize;
>  
> @@ -561,7 +566,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  		drm_pagemap_migration_unlock_put_pages(npages, dst);
>  	migrate_device_pages(src, dst, npages);
>  	migrate_device_finalize(src, dst, npages);
> -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
>  					DMA_FROM_DEVICE);
>  err_free:
>  	kvfree(buf);
> @@ -612,7 +617,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	struct device *dev = NULL;
>  	unsigned long npages, mpages = 0;
>  	struct page **pages;
> -	dma_addr_t *dma_addr;
> +	struct drm_pagemap_addr *pagemap_addr;
>  	unsigned long start, end;
>  	void *buf;
>  	int i, err = 0;
> @@ -637,14 +642,14 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	migrate.end = end;
>  	npages = npages_in_range(start, end);
>  
> -	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*pagemap_addr) +
>  		       sizeof(*pages), GFP_KERNEL);
>  	if (!buf) {
>  		err = -ENOMEM;
>  		goto err_out;
>  	}
> -	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> -	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> +	pagemap_addr = buf + (2 * sizeof(*migrate.src) * npages);
> +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*pagemap_addr)) * npages;
>  
>  	migrate.vma = vas;
>  	migrate.src = buf;
> @@ -680,7 +685,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	if (err)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
> +	err = drm_pagemap_migrate_map_pages(dev, pagemap_addr, migrate.dst, npages,
>  					    DMA_FROM_DEVICE);
>  	if (err)
>  		goto err_finalize;
> @@ -688,7 +693,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	for (i = 0; i < npages; ++i)
>  		pages[i] = migrate_pfn_to_page(migrate.src[i]);
>  
> -	err = ops->copy_to_ram(pages, dma_addr, npages);
> +	err = ops->copy_to_ram(pages, pagemap_addr, npages);
>  	if (err)
>  		goto err_finalize;
>  
> @@ -698,7 +703,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	migrate_vma_pages(&migrate);
>  	migrate_vma_finalize(&migrate);
>  	if (dev)
> -		drm_pagemap_migrate_unmap_pages(dev, dma_addr, npages,
> +		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, npages,
>  						DMA_FROM_DEVICE);
>  err_free:
>  	kvfree(buf);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 90065d7d29ff..c33bd1b139c9 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -9,6 +9,7 @@
>  #include <linux/sizes.h>
>  
>  #include <drm/drm_managed.h>
> +#include <drm/drm_pagemap.h>
>  #include <drm/ttm/ttm_tt.h>
>  #include <uapi/drm/xe_drm.h>
>  
> @@ -1733,7 +1734,8 @@ static u32 pte_update_cmd_size(u64 size)
>  
>  static void build_pt_update_batch_sram(struct xe_migrate *m,
>  				       struct xe_bb *bb, u32 pt_offset,
> -				       dma_addr_t *sram_addr, u32 size)
> +				       struct drm_pagemap_addr *sram_addr,
> +				       u32 size)
>  {
>  	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
>  	u32 ptes;
> @@ -1751,14 +1753,18 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
>  		ptes -= chunk;
>  
>  		while (chunk--) {
> -			u64 addr = sram_addr[i++] & PAGE_MASK;
> +			u64 addr = sram_addr[i].addr & PAGE_MASK;
>  
> +			xe_tile_assert(m->tile, sram_addr[i].proto ==
> +				       DRM_INTERCONNECT_SYSTEM);
>  			xe_tile_assert(m->tile, addr);
>  			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
>  								 addr, pat_index,
>  								 0, false, 0);
>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
> +
> +			i++;
>  		}
>  	}
>  }
> @@ -1774,7 +1780,8 @@ enum xe_migrate_copy_dir {
>  static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  					 unsigned long len,
>  					 unsigned long sram_offset,
> -					 dma_addr_t *sram_addr, u64 vram_addr,
> +					 struct drm_pagemap_addr *sram_addr,
> +					 u64 vram_addr,
>  					 const enum xe_migrate_copy_dir dir)
>  {
>  	struct xe_gt *gt = m->tile->primary_gt;
> @@ -1856,7 +1863,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   * xe_migrate_to_vram() - Migrate to VRAM
>   * @m: The migration context.
>   * @npages: Number of pages to migrate.
> - * @src_addr: Array of dma addresses (source of migrate)
> + * @src_addr: Array of DMA information (source of migrate)
>   * @dst_addr: Device physical address of VRAM (destination of migrate)
>   *
>   * Copy from an array dma addresses to a VRAM device physical address
> @@ -1866,7 +1873,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   */
>  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  				     unsigned long npages,
> -				     dma_addr_t *src_addr,
> +				     struct drm_pagemap_addr *src_addr,
>  				     u64 dst_addr)
>  {
>  	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, src_addr, dst_addr,
> @@ -1878,7 +1885,7 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>   * @m: The migration context.
>   * @npages: Number of pages to migrate.
>   * @src_addr: Device physical address of VRAM (source of migrate)
> - * @dst_addr: Array of dma addresses (destination of migrate)
> + * @dst_addr: Array of DMA information (destination of migrate)
>   *
>   * Copy from a VRAM device physical address to an array dma addresses
>   *
> @@ -1888,61 +1895,63 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
>  				       unsigned long npages,
>  				       u64 src_addr,
> -				       dma_addr_t *dst_addr)
> +				       struct drm_pagemap_addr *dst_addr)
>  {
>  	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, dst_addr, src_addr,
>  			       XE_MIGRATE_COPY_TO_SRAM);
>  }
>  
> -static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t *dma_addr,
> +static void xe_migrate_dma_unmap(struct xe_device *xe,
> +				 struct drm_pagemap_addr *pagemap_addr,
>  				 int len, int write)
>  {
>  	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
>  
>  	for (i = 0; i < npages; ++i) {
> -		if (!dma_addr[i])
> +		if (!pagemap_addr[i].addr)
>  			break;
>  
> -		dma_unmap_page(xe->drm.dev, dma_addr[i], PAGE_SIZE,
> +		dma_unmap_page(xe->drm.dev, pagemap_addr[i].addr, PAGE_SIZE,
>  			       write ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
>  	}
> -	kfree(dma_addr);
> +	kfree(pagemap_addr);
>  }
>  
> -static dma_addr_t *xe_migrate_dma_map(struct xe_device *xe,
> -				      void *buf, int len, int write)
> +static struct drm_pagemap_addr *xe_migrate_dma_map(struct xe_device *xe,
> +							  void *buf, int len,
> +							  int write)
>  {
> -	dma_addr_t *dma_addr;
> +	struct drm_pagemap_addr *pagemap_addr;
>  	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
>  
> -	dma_addr = kcalloc(npages, sizeof(*dma_addr), GFP_KERNEL);
> -	if (!dma_addr)
> +	pagemap_addr = kcalloc(npages, sizeof(*pagemap_addr), GFP_KERNEL);
> +	if (!pagemap_addr)
>  		return ERR_PTR(-ENOMEM);
>  
>  	for (i = 0; i < npages; ++i) {
>  		dma_addr_t addr;
>  		struct page *page;
> +		enum dma_data_direction dir = write ? DMA_TO_DEVICE :
> +						      DMA_FROM_DEVICE;
>  
>  		if (is_vmalloc_addr(buf))
>  			page = vmalloc_to_page(buf);
>  		else
>  			page = virt_to_page(buf);
>  
> -		addr = dma_map_page(xe->drm.dev,
> -				    page, 0, PAGE_SIZE,
> -				    write ? DMA_TO_DEVICE :
> -				    DMA_FROM_DEVICE);
> +		addr = dma_map_page(xe->drm.dev, page, 0, PAGE_SIZE, dir);
>  		if (dma_mapping_error(xe->drm.dev, addr))
>  			goto err_fault;
>  
> -		dma_addr[i] = addr;
> +		pagemap_addr[i] = drm_pagemap_addr_encode(
> +			addr, DRM_INTERCONNECT_SYSTEM, 0, dir);
>  		buf += PAGE_SIZE;
>  	}
>  
> -	return dma_addr;
> +	return pagemap_addr;
>  
>  err_fault:
> -	xe_migrate_dma_unmap(xe, dma_addr, len, write);
> +	xe_migrate_dma_unmap(xe, pagemap_addr, len, write);
>  	return ERR_PTR(-EFAULT);
>  }
>  
> @@ -1971,7 +1980,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_res_cursor cursor;
>  	struct dma_fence *fence = NULL;
> -	dma_addr_t *dma_addr;
> +	struct drm_pagemap_addr *pagemap_addr;
>  	unsigned long page_offset = (unsigned long)buf & ~PAGE_MASK;
>  	int bytes_left = len, current_page = 0;
>  	void *orig_buf = buf;
> @@ -2026,9 +2035,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  		return 0;
>  	}
>  
> -	dma_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
> -	if (IS_ERR(dma_addr))
> -		return PTR_ERR(dma_addr);
> +	pagemap_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
> +	if (IS_ERR(pagemap_addr))
> +		return PTR_ERR(pagemap_addr);
>  
>  	xe_res_first(bo->ttm.resource, offset, xe_bo_size(bo) - offset, &cursor);
>  
> @@ -2049,7 +2058,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  
>  		__fence = xe_migrate_vram(m, current_bytes,
>  					  (unsigned long)buf & ~PAGE_MASK,
> -					  dma_addr + current_page,
> +					  &pagemap_addr[current_page],
>  					  vram_addr, write ?
>  					  XE_MIGRATE_COPY_TO_VRAM :
>  					  XE_MIGRATE_COPY_TO_SRAM);
> @@ -2073,7 +2082,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  	dma_fence_put(fence);
>  
>  out_err:
> -	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
> +	xe_migrate_dma_unmap(xe, pagemap_addr, len + page_offset, write);
>  	return IS_ERR(fence) ? PTR_ERR(fence) : 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 3758f9615484..2ead74c2cea2 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  
>  struct dma_fence;
> +struct drm_pagemap_addr;
>  struct iosys_map;
>  struct ttm_resource;
>  
> @@ -109,13 +110,13 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
>  
>  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  				     unsigned long npages,
> -				     dma_addr_t *src_addr,
> +				     struct drm_pagemap_addr *src_addr,
>  				     u64 dst_addr);
>  
>  struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
>  				       unsigned long npages,
>  				       u64 src_addr,
> -				       dma_addr_t *dst_addr);
> +				       struct drm_pagemap_addr *dst_addr);
>  
>  struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				  struct xe_bo *src_bo,
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 3e4f4a8760ee..1d097e76aabc 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -328,7 +328,8 @@ enum xe_svm_copy_dir {
>  	XE_SVM_COPY_TO_SRAM,
>  };
>  
> -static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> +static int xe_svm_copy(struct page **pages,
> +		       struct drm_pagemap_addr *pagemap_addr,
>  		       unsigned long npages, const enum xe_svm_copy_dir dir)
>  {
>  	struct xe_vram_region *vr = NULL;
> @@ -360,7 +361,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  		last = (i + 1) == npages;
>  
>  		/* No CPU page and no device pages queue'd to copy */
> -		if (!dma_addr[i] && vram_addr == XE_VRAM_ADDR_INVALID)
> +		if (!pagemap_addr[i].addr && vram_addr == XE_VRAM_ADDR_INVALID)
>  			continue;
>  
>  		if (!vr && spage) {
> @@ -374,7 +375,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  		 * first device page, check if physical contiguous on subsequent
>  		 * device pages.
>  		 */
> -		if (dma_addr[i] && spage) {
> +		if (pagemap_addr[i].addr && spage) {
>  			__vram_addr = xe_vram_region_page_to_dpa(vr, spage);
>  			if (vram_addr == XE_VRAM_ADDR_INVALID) {
>  				vram_addr = __vram_addr;
> @@ -399,18 +400,20 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  				if (sram) {
>  					vm_dbg(&xe->drm,
>  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
> -					       vram_addr, (u64)dma_addr[pos], i - pos + incr);
> +					       vram_addr,
> +					       (u64)pagemap_addr[pos].addr, i - pos + incr);
>  					__fence = xe_migrate_from_vram(vr->migrate,
>  								       i - pos + incr,
>  								       vram_addr,
> -								       dma_addr + pos);
> +								       &pagemap_addr[pos]);
>  				} else {
>  					vm_dbg(&xe->drm,
>  					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
> -					       (u64)dma_addr[pos], vram_addr, i - pos + incr);
> +					       (u64)pagemap_addr[pos].addr, vram_addr,
> +					       i - pos + incr);
>  					__fence = xe_migrate_to_vram(vr->migrate,
>  								     i - pos + incr,
> -								     dma_addr + pos,
> +								     &pagemap_addr[pos],
>  								     vram_addr);
>  				}
>  				if (IS_ERR(__fence)) {
> @@ -423,7 +426,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  			}
>  
>  			/* Setup physical address of next device page */
> -			if (dma_addr[i] && spage) {
> +			if (pagemap_addr[i].addr && spage) {
>  				vram_addr = __vram_addr;
>  				pos = i;
>  			} else {
> @@ -435,16 +438,16 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  				if (sram) {
>  					vm_dbg(&xe->drm,
>  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
> -					       vram_addr, (u64)dma_addr[pos], 1);
> +					       vram_addr, (u64)pagemap_addr[pos].addr, 1);
>  					__fence = xe_migrate_from_vram(vr->migrate, 1,
>  								       vram_addr,
> -								       dma_addr + pos);
> +								       &pagemap_addr[pos]);
>  				} else {
>  					vm_dbg(&xe->drm,
>  					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
> -					       (u64)dma_addr[pos], vram_addr, 1);
> +					       (u64)pagemap_addr[pos].addr, vram_addr, 1);
>  					__fence = xe_migrate_to_vram(vr->migrate, 1,
> -								     dma_addr + pos,
> +								     &pagemap_addr[pos],
>  								     vram_addr);
>  				}
>  				if (IS_ERR(__fence)) {
> @@ -470,16 +473,18 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  #undef XE_VRAM_ADDR_INVALID
>  }
>  
> -static int xe_svm_copy_to_devmem(struct page **pages, dma_addr_t *dma_addr,
> +static int xe_svm_copy_to_devmem(struct page **pages,
> +				 struct drm_pagemap_addr *pagemap_addr,
>  				 unsigned long npages)
>  {
> -	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_VRAM);
> +	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_VRAM);
>  }
>  
> -static int xe_svm_copy_to_ram(struct page **pages, dma_addr_t *dma_addr,
> +static int xe_svm_copy_to_ram(struct page **pages,
> +			      struct drm_pagemap_addr *pagemap_addr,
>  			      unsigned long npages)
>  {
> -	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_SRAM);
> +	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_SRAM);
>  }
>  
>  static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 69d6ee49a3de..1d5919a99139 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -170,7 +170,7 @@ struct drm_pagemap_devmem_ops {
>  	/**
>  	 * @copy_to_devmem: Copy to device memory (required for migration)
>  	 * @pages: Pointer to array of device memory pages (destination)
> -	 * @dma_addr: Pointer to array of DMA addresses (source)
> +	 * @pagemap_addr: Pointer to array of DMA information (source)
>  	 * @npages: Number of pages to copy
>  	 *
>  	 * Copy pages to device memory.
> @@ -178,13 +178,13 @@ struct drm_pagemap_devmem_ops {
>  	 * Return: 0 on success, a negative error code on failure.
>  	 */
>  	int (*copy_to_devmem)(struct page **pages,
> -			      dma_addr_t *dma_addr,
> +			      struct drm_pagemap_addr *pagemap_addr,
>  			      unsigned long npages);
>  
>  	/**
>  	 * @copy_to_ram: Copy to system RAM (required for migration)
>  	 * @pages: Pointer to array of device memory pages (source)
> -	 * @dma_addr: Pointer to array of DMA addresses (destination)
> +	 * @pagemap_addr: Pointer to array of DMA information (destination)
>  	 * @npages: Number of pages to copy
>  	 *
>  	 * Copy pages to system RAM.
> @@ -192,7 +192,7 @@ struct drm_pagemap_devmem_ops {
>  	 * Return: 0 on success, a negative error code on failure.
>  	 */
>  	int (*copy_to_ram)(struct page **pages,
> -			   dma_addr_t *dma_addr,
> +			   struct drm_pagemap_addr *pagemap_addr,
>  			   unsigned long npages);
>  };
>  
> -- 
> 2.43.0
> 
