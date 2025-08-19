Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE917CA0EE9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 04:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5BD10E0C2;
	Tue, 19 Aug 2025 04:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kdNDuun2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B614D10E0C2
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 04:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755577372; x=1787113372;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ty9aTrjpuzwFfMz5cyibHoELu+IQakkVm9HVsV46PhE=;
 b=kdNDuun2X9GsAUiSjIjEZK1JhLRmDgm48w9qCTnffDP4Krx0e5/QVUeU
 ee5ph9lguuVlqvi11EYbQX+Eeh3JSE/yGUglOMFU3gee5qVZAb3D7kOnE
 aQnQ81c2eOsMbIqwPC3yjzyDOwirNVaRnd5S9b4fwU6hse2V7/en6wYi5
 v6SaPhKftYQntff6v4I6ohUHtVkTESLjGjv5uiTRwKbDB/2QdXMu/W+Ip
 ZfyEHzVXFucZHmf/f9Wq3656r2XvzxyAnng4rCqd2RlJ+pMaIxxQK7Fub
 iLfRfdmCqu5Wguy3r9CWSwXbq3dz3Rdubr5Zhu152mbaFtEBbtsv5JHps g==;
X-CSE-ConnectionGUID: wq/c+mXoQcynUHZRCsyQJw==
X-CSE-MsgGUID: +9gcYHQ/TyK9vtiMDu2Mbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57013409"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57013409"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 21:22:52 -0700
X-CSE-ConnectionGUID: 7Nchwrw+QpOc4S/+j7iXrA==
X-CSE-MsgGUID: Dd5O31HTS5Oz4K+2I+2VAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="166979538"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 21:22:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 21:22:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 21:22:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 21:22:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvJzz2ek7CoJ1t4siZAUwx1e33I3usHtx8ZIJOOAY7zfbw6kT7ytc04Og45sB4ZKOCdfusD6R2E6RyxsWjTkKN56i8I+ncbhvI/y9EH3rGIVmaUkf3REj0lWAj9UCdo2WoDXPCblgZQ6WJlfnaB36yaO3PXrUolpdDmKpRuscN0m8RwNzIFjspZfUWGgO3wOZvvuSPBfhvGPqoRks+ymmi5CLNwMs5DG+WdCa/PVKSHFpDmeGaUyV9oL0gr1j3DrVVfmH7KKSQ536LA2EZE1lEc8w0xZ9D7sDGq4demntRihGi8Z8x7AoUdKeLRk+SWcNb+F7pJH54zADEPlu/9uww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leXmZPg2FF1DQvKfkvmU+JuHvxz50nWpW8c5dCtdqbk=;
 b=HdQW4r6hg7zC5WqBiNbbvqOg1bBoRtuibE4dWtIs0n/xbthEt+zSrXxWL8b84xos0lhB+cvaHrYIbtUTpW4wRnCHmLTJO55zkb9WR+8BRa6SBypbE+2G6UE391Eisyy6/xBqkPDkmzwRjzoZwKmcgkuu4ChO+NpWeicyjdh/i7212k8PLxopT0wZRFxuxx5Vw/6aNU5DQJmRbRQ4UF7th4tBGwYBPg66f6WR+m6nueVt0QbwA1RyqNW0ez7AbKO+5xwTJZe377G94n7/Cdy0pH541U6Rwq1VKnlgaaYVUkCLAay9gLQjJZ++nSssGyYJyfbIG6qRB2h8OaBVxaupDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6688.namprd11.prod.outlook.com (2603:10b6:806:25b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 04:22:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 04:22:49 +0000
Date: Mon, 18 Aug 2025 21:22:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/tile: Release kobject for the failure path
Message-ID: <aKP8FiLPdgp/de/S@lstrano-desk.jf.intel.com>
References: <20250819003957.2868064-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250819003957.2868064-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:303:8d::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: f092a657-276f-46fa-a6c1-08ddded80e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IZe7ibAW1c0PP6xKZgD9We7ahvKxFVnN6ykfL2zVi5jf75vG/wzSnfAjQkFA?=
 =?us-ascii?Q?DuyTiABIGfAdgjvX4rYxGNReuzXK1+3OKtmGdXUwXDRzda2HvPO8Xt2lvYwJ?=
 =?us-ascii?Q?Y5c3FOXzhKjTZXH2h6rY54qhX/A6rSztJZ3v4W0gxfh2v/tj83ig1CNdfYpE?=
 =?us-ascii?Q?nh0axNlWan08rWQTQZd+T840qjHQVpcEk84IhJgA419pCs7X4RqVwAI17Ogw?=
 =?us-ascii?Q?pc8DUvSVnaw2y0TKKIXCrN93NL8948CnfdembBt4g0trUMXu8N2+tBn3k1bY?=
 =?us-ascii?Q?4D19lQMdvyZqRghRXMIgErbvK8HdSeB7G58I6Z1em8PFvmoOehJrh5a02oTE?=
 =?us-ascii?Q?MJoJxkCfhHD7Gh7EXfddDDSQ2U/Yg8tY9UtpkkRpelOdsYozzCWj1zedsVU4?=
 =?us-ascii?Q?QSo5vfWImJp2+IlY/xlXBCwH0SDPpTaQjNQJ8VJMUEWonFJmYGh4dULAkHhr?=
 =?us-ascii?Q?OM0RD0PQ+6IRLigdddm03tLKqgHtiGnGiqHd7jTqypJRCtq8A3xSUveukxQB?=
 =?us-ascii?Q?x6dCdXeIzUNQoGTe34BLgPT2sufLA3gIfbRMpInkWfWAMiduIuLe9zN+6G1P?=
 =?us-ascii?Q?1SLohf+8sCTacQKl6ERuww9LZNVxuwKAjKx0DN3b0j1EBmD9i6tX7Zj6MPVI?=
 =?us-ascii?Q?kNFTD8SCcpZWpGA+GkxExDUcB+1HCAfQzXoNzpLHzE5GgHKmAqGJSt0IXXaQ?=
 =?us-ascii?Q?erqJxav3ig+7Kl2i6nG0P8a8VG01x4owuUwUXa/c0taHIZQ/2Tv4dBY26l4M?=
 =?us-ascii?Q?wS+1AMPZA1SZJMpicqR6ZD/EhEve7Yhn56mfKh1O2CwkqHQu5G3TRTK/m8p8?=
 =?us-ascii?Q?ZsVeQqYdJZ8vbShg86EloXeeqyccn0sF1RfpmPnruOy/gomki9Iv/bn06pvN?=
 =?us-ascii?Q?YKT6rORBI2OxIDRhQx9hrV8ipznzsNVoaCGOw8H8jZt6fvS9d1+kAIifFQba?=
 =?us-ascii?Q?Omk7RGUlZROVzg7hszHiGctuvi9Z7J0W116S2Okn8G+m2moI6GswEOUSt15H?=
 =?us-ascii?Q?teP5WFh9xgasoc4U6Z2CPJ9uJ2uAm10dFvKG8/alFdiVnh20yAzhk9jAfUFA?=
 =?us-ascii?Q?NNdyJBdUGeg1k/4aCZXRaIWbqPEGYo8/sdvCI4nmSSuEV46gMZsAoJeCpxb2?=
 =?us-ascii?Q?TeOCKqfbYVFP0jIg4Lv7ESc1oHLZ+MH8EoAwK44GvINK9C3GQkaFkVmlVVMX?=
 =?us-ascii?Q?Q6Qdnys8SQi+YVMyQeNnPkaBN+dVqM+vD11Wah4YmbdqYLi2CG6hMrIKrEAX?=
 =?us-ascii?Q?ETrNOLIKKa91AEAoH56gYM1F6knwGIkkPVTosmDeWMtws3Z7XuUQzfgQLE7U?=
 =?us-ascii?Q?JN34JaTFjz7XTdQO7s0ey5dRDCMf0mZQnfbzZvXPH7UVwV7hdL+38EEuwQs4?=
 =?us-ascii?Q?pJmXPhcSA1DWvSgKueFcsv5oAD3d/DRrliHlqxEPAlb3Sl3BBzxjqKkF/UYZ?=
 =?us-ascii?Q?KLOanJbuFxc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rtOr+KMxWrruJuH2pQoUOuMyl+U5V9+/P+zfrW6L3hloaTt8+BWtUhQItbiZ?=
 =?us-ascii?Q?mR7KF8MsI7OHySYAGdvnL97JVOB+cnOyNW2Q+4hAyaSwrzj37VBlUFpFF1fr?=
 =?us-ascii?Q?k1hPSDMBa+8Vl4jzzfjRGLdGLlun0m0WKHyqbLbNelUTw4AFbwjqgMwSWDGY?=
 =?us-ascii?Q?QjPON0M2YkyaX5zcnk3PKQ6wVN+bAKynfMHt7CWLJ7tY95MXEicnU2S353xl?=
 =?us-ascii?Q?TGWE/zZb66sNrmV8Yag+KTP+CRI4LIWdlf1BRp4CLFWMdBDL0Jf0+togdKCr?=
 =?us-ascii?Q?bz/Pt+5F9oSuhvjx0sWKNBDG0vg34PlW+K1g3HFyuN/Xlv2pa6G85/6QnU5M?=
 =?us-ascii?Q?mWBWg42mWxVloJxukJSlP7fWSazIueqPNbjBfP/PWt7xpDcjw9LPxy6Gbzus?=
 =?us-ascii?Q?OMcA0N5hQWfMorIOvgupXNnNxY3E6OqawzV6N12AksY4jf95OQ6YsukdFQuZ?=
 =?us-ascii?Q?1RxQkn9Ywgu0SOiqun4apTcBkM8CDBnuIdA7U23xuu2qCfGmc2aVMU/E+LJL?=
 =?us-ascii?Q?/t1OOkWrR+jj2sfc3Gx+pcJ1B99te6F90vUw2CFk+WxnP9DweQPQEv5Bh9Zk?=
 =?us-ascii?Q?wykl0OX2zKC2e1GxjzBl1ZLUTDxCNj+lIELiqD+RF/fJVm2KyNykfe81rI5i?=
 =?us-ascii?Q?QZYpe6iEKaQzHwu71cHQrlLn/f4GJrHDZ+uKcWcWOIrlXsp5srtUTNJ8KpJQ?=
 =?us-ascii?Q?t/so4Wbozzx8c8amiOJofoj1B+P+NcBlgRkWByhBIiIRcU9uCRDxQFC3BHGa?=
 =?us-ascii?Q?BTahZoG+hBm4OMe7OttuL+psutCnZjMHI5kLFniCUTRGUU2YdM2rP6xk5sUz?=
 =?us-ascii?Q?zOnrHLaifbOlQfkrqQTjSsNBMB3O8YhieB4iSwEjZGCfoPYr89tMeea4U3hF?=
 =?us-ascii?Q?GC3wBiBhdrW7AH4g1Y/ZzxlHFWaiBo2sqO1iCHnDPFjPcN80alu0wmDh3IET?=
 =?us-ascii?Q?oxl7z7YW5RGNdyel0eeaRKYHOPBYGKsPxSJ+iBufNrS119yS7CRfarrPJ6KW?=
 =?us-ascii?Q?bUA7a2m1JezOAa3trImxH5sZTItg8ohdyNNE7ArUJ0TR0ES+9YUj85qBM4vi?=
 =?us-ascii?Q?GthrAyIbu+uQfBaoH5kOuvzTse60ihmJeCV4w6wju2A9QEfyrLJ5Efa6zJfq?=
 =?us-ascii?Q?DOsJZVnFsT4bj8JJLEMHABJaCQwiATKRv56UFnA0TWC9RE226xtw/TuE7cqs?=
 =?us-ascii?Q?gst8wTbpO4LkLzvYcRX+H2hCHESiLLSbTHJa9JuHVaOxVJVoWxdd8+Ql6z00?=
 =?us-ascii?Q?AOTirSCVRSijPszddP4hB0udurvp9B1/XD0ydc+rQJvWtshRUvZGEyP37qOt?=
 =?us-ascii?Q?e9IFrxIhzSn8rzAUmRcFSm71I70d6UNOtAE4tVxv8Wcw41PpomkwLKSOEtGA?=
 =?us-ascii?Q?Kv6EQCMgn9Uzv+oyuuumU8fUiLuyNtvMe7KM9DFAm9k93rPNKPGsgwlDc/VG?=
 =?us-ascii?Q?4LhVyOy6MCfDMymNAKe7cKaP47yjYnS1K/FuGVC0I0oFs1uGYHHgm0K7CFcM?=
 =?us-ascii?Q?oEjDAJ0XnJxXyzsJiS2wqDDbA317vPPERx/VRaCPgJF0cWmyj/4yTTqzpJFL?=
 =?us-ascii?Q?8MvPO/9QtP0elsCokK9kGCkMS0q4YYoo6nNGYny3xujayRzKX5pnYCqpngyX?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f092a657-276f-46fa-a6c1-08ddded80e1b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 04:22:48.9304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ocx1jFWTXwGBNDMbjav6kiLYfdmiZP7izVng+mKmpbb3IKJF1XGUFylp5JNPZMe1xBc/Xt5XwzQ6U+r/MWF8Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6688
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

On Tue, Aug 19, 2025 at 12:39:58AM +0000, Shuicheng Lin wrote:
> Call kobject_put() for the failure path to release the kobject
> 
> Fixes: e3d0839aa501 ("drm/xe/tile: Abort driver load for sysfs creation failure")
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index b804234a6551..99dbf232535a 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -44,16 +44,19 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
>  	kt->tile = tile;
>  
>  	err = kobject_add(&kt->base, &dev->kobj, "tile%d", tile->id);
> -	if (err) {
> -		kobject_put(&kt->base);
> -		return err;
> -	}
> +	if (err)
> +		goto err_object;
>  
>  	tile->sysfs = &kt->base;
>
>  	err = xe_vram_freq_sysfs_init(tile);
>  	if (err)
> -		return err;
> +		goto err_object;
> +

Extra newline.

Otherwise LGTM, with the newline fix:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  
>  	return devm_add_action_or_reset(xe->drm.dev, tile_sysfs_fini, tile);
> +
> +err_object:
> +	kobject_put(&kt->base);
> +	return err;
>  }
> -- 
> 2.49.0
> 
