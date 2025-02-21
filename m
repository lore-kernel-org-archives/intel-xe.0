Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FE2C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 21:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1015110EB3F;
	Fri, 21 Feb 2025 21:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYYQ52oQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6665010EB3F
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 21:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740174750; x=1771710750;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZEFpWtHcl2uFUXA2Sta9exrWasGmELLyuXRdhPcsCFA=;
 b=BYYQ52oQBrR8hYcBZcd7t6b9EWH9RK3Is07mkmRjn9mK/gGfGWd/c3TZ
 +3wifE3JyhQXIfKjJ4m5M4iiY+tzefs2XJd8jlyhU/u43pIZdErnMmwFL
 MK6ef0xYjyPrpqKAtkBwvw53Zqez3OGvQTI2ukxBVOl0gC2ZwscOv0PKR
 uo414iLyrfSrnsOdZC/pedPBMKC9OMGEsFmdswIHNzDa8fh4oenNawUYn
 rSCeecq5ZoBScICI7U0cS2BCQrHoaBeWxyIzx0wZp9SUekf4w4GFYkI4j
 WswQi3rNFoEufmsLAE3SrXRaj1YFUSzDiqemYN62RjuQfaLj/A4piQGnE g==;
X-CSE-ConnectionGUID: 8VJURfxAQSKECkpyOGekDQ==
X-CSE-MsgGUID: 93/sZbqUTbuXrZOlHDfOXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58554539"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="58554539"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 13:52:28 -0800
X-CSE-ConnectionGUID: NyaE5CsASXOo5KvLqkd2nA==
X-CSE-MsgGUID: 4aRmrGB8QsiF9bBKG0s7ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="146325729"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 13:52:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 13:52:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 13:52:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 13:52:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzQwKI7/+j5Xk8DIIs0uH+VgzA33Mcag3SM0OdFQfNzd4s2t0O/eWzvP2OpxEQzUt4rMBCMi9u967PuM4sDVI8ESmJj9zj+OW28wthyI9VcuSUaQa3ZuMtxXL59d5/jxAm3+SfpRX635RdkfisMwVcPbVs3R4GJaofIxEDYbS8MYRjqeC77o59ahT1kZZC4SQXbp/SnkjkKNe3BzeBcpuoOxbajxBM6khu3x40ZYDu0MQRvsc767S0wC7iRqrxrePhlFH85Zhw32TppxQEK1txcgBcrUBhQP/wd/67E7OYGoGwgzA8V8BONJ7nAHWkGgm/FJcYPdwuC/LBYuFqXhDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgKC61kF7E8tZcUB0Bdbwjkj2OVIRZ8CHClRU4B8tXI=;
 b=Wpc9s+yMcgwJGHjrIWgZKRJWp2Dr6kuht4fzZEmvvkimI16dvd0mVTTihGzqzHhfoLzH6YPwFm/f0VRnQqS4UzU9ukwrldI2kdlm26EAhEc34BbeEDPEeInxIycmyyhdkxFq51+1n3kCuX+YiU5kKut0MsMC+gPkjTkMq9UQkgQL2TITDAjhqQjyIhyyId65HugRMv5beUr4KjoEfQvTEGqeJLeaqVpm8FTndoWQyHvd7cMnbztdQtxULbWlKpppJ9JIF2DSQFYff1YkOU/L0Dh59OQMimSRvSCKEmqHnCaSYs8wmLLAUHK6CsnfvrP6G9YVyKF/7MJffM/T+Wid0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8594.namprd11.prod.outlook.com (2603:10b6:806:3b1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 21:52:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 21:52:05 +0000
Date: Fri, 21 Feb 2025 13:52:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 7/7] drm/xe: Simplify setting release info in xe->info
Message-ID: <20250221215203.GB5109@mdroper-desk1.amr.corp.intel.com>
References: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
 <20250221-xe-unify-ip-descriptors-v2-7-5bc0c6d0c13f@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250221-xe-unify-ip-descriptors-v2-7-5bc0c6d0c13f@intel.com>
X-ClientProxiedBy: SJ0PR13CA0166.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: f932a7ee-8d21-40b6-20dc-08dd52c1fb79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GY2dc2tI92mzRGEJc5jN6AAEe1EwXwY6Qe6DNlmf//M/4xmpvMczahgqDlyP?=
 =?us-ascii?Q?BSOTnhKkECBdzOy09jhNieuBVjMSNhn4FG++04Y3+T/ILWo7iuYjL/jIckMG?=
 =?us-ascii?Q?zS6dpabjT2GVUASF308KuU6Hhy35z/sPguK9LUqZtMiSqTc0dvKumjBNJ0cx?=
 =?us-ascii?Q?3kLtb8hoT3ZBeKAmJmQYHzXE6JByDqb6Iv5qmC8alzxN0or19+I2Ffx11One?=
 =?us-ascii?Q?mC4Q4Zzr0vD+p3tWK0z3NGyJRXWnbVMH/Nog+eqqQx7ph7qbZWew+Y8VQrti?=
 =?us-ascii?Q?fHKXmppHoSTxfPK2wvYjJXo8G2DyeoWzB03dPE/TrsJXZiP1WK5v5rwM8Z7j?=
 =?us-ascii?Q?FSVraRcUxbY6XBDQuEXO7v52c7FcMKpIpmEUzsbtIMlqmpHYshFEbUi46rBv?=
 =?us-ascii?Q?TifNJAvoMmLHeaIpqlE2+PYQOtFs8UyaUUumgEqZGYKWgs416GFqnpOGqoQI?=
 =?us-ascii?Q?4QGvVEkK9prnqBtjMYHrt4fXQYWU2O5wT43t4+9L/B70Qj0idWKL2CKxmP4L?=
 =?us-ascii?Q?eIs1pghymkKxtRugg1zmZhNF8HESFXDRTzxvlqegx+M5kGIqJCM5zyEOf77C?=
 =?us-ascii?Q?4CPAz/I8YBkf55+JLGYY0ZHqEe5f5MjbiSa8SetO04Xzu/nDA+iwoXalW1r4?=
 =?us-ascii?Q?aQiBLZ/ned94J8kHRPK7TiIXmSdaShKlgVWPOzCfYuKRuSaCsYSj4kHAZXxk?=
 =?us-ascii?Q?gBl2VABVMmNSBoVY9/XgYsb1JrWNvd6bMLmExeuJgutIyIj10yhvj2rd7x9s?=
 =?us-ascii?Q?iNIRclUqBt5HEHgRfUjeRdEAFjdVzdlmQpk1CDn71l5pki6T3opJVSharE0S?=
 =?us-ascii?Q?ujR4q7YPkG0b575Z/iLOGNc7zOLBBqDhQKTYW4ssSi1GF7q3fM35KJzFL73O?=
 =?us-ascii?Q?s92YWxudqap/pKMKf1CulH2osVYEvbK9nMHgZXC4HNJPvhsFnxLyiVhJ2rvQ?=
 =?us-ascii?Q?HKpJ+lK8xMCbSgT3X9wfGOd6kF38KAI8vsYfQH2M2DVaCq38nY6IM9Iqkd8u?=
 =?us-ascii?Q?hQBXZZcHRPgu068TrALHRV0OApEZUnd5EPyiLUL+jsXoM2tYatc7aYT/2fmO?=
 =?us-ascii?Q?DQiDc7Syxs7SORlVmE3b06Nz3t1ryTNyu7RHaseCPnpBJMJ7H5ZsoZzSnhek?=
 =?us-ascii?Q?3zm32y0gSjLmn48na/y2Tdqsmwebusw9i+pekWVQrhUBrrklX2A19n0rKdKg?=
 =?us-ascii?Q?x0VbJPj0V3eYmIgpoFtpnEr6kbLJyJ8NkeAklN8q1kiC21DCNnfDLky0Bwtk?=
 =?us-ascii?Q?ga2Tpdjz5p5Nt3txjKI/v7mQgFX3fcETK/04jpfIXlZTEyKpKxODiKOsUDIi?=
 =?us-ascii?Q?+aUx9/wztW/HRAir029Fnihr41BqMN9ihaIVkLaht93gGUQIXQ/7GvstZzs/?=
 =?us-ascii?Q?7Ll3276gWX/D0C7sHeKewrTaP6wQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zakoSU3x1X3owtAgbbfmXN7Cwh5/a8xDEo951icPkNNt0UR+/rwRf1XKnQmk?=
 =?us-ascii?Q?F9kwEHRQq8aTpav2Lv2mBrddwdtX1fQxiIzKOcafiydXaUcep9w1ibWUxf7N?=
 =?us-ascii?Q?I4ueMvBYi8553VC7JmckumeCF1fkLB4EsaLxGUAPPyJXDbo/LVSD2ue8TIpv?=
 =?us-ascii?Q?jop2mL/kIEGuz08pN95iuA2xj6EohHiGrhwRWwDSHVvg7GJepsLYmZ14WrVu?=
 =?us-ascii?Q?pZ2ZuKd3R9g6OntcXALixKY/odAyYPpCefE6use4Zj7EnhelqDUzkcFqlfou?=
 =?us-ascii?Q?ttFEe2/ImYaTW9VWY7x39R50PKsCvEpVmmMTIzt7dMHzlS5bESMdAx3my/Jv?=
 =?us-ascii?Q?pmQhb15b/21SjN8PC+SborgD3UxnwXuRNVTuwSiSZXn9kwqAl30e9Z5RajUX?=
 =?us-ascii?Q?xJAX7RwAs8aZJMsV7Jgq+U7HlAPf4RcWkrI/IVc8PhZRp9ZLJkgZtRSXQ/Xt?=
 =?us-ascii?Q?yXRqw21R2jRe7WJ6eqNDrI0CiP5eVDBACTDhpS0gdbNyL1uxxjxmVHwyVdhW?=
 =?us-ascii?Q?2zo/9302Fg1TjmP5iBWb2yHAM5QO+IrZav2wMzj3hNHkKDozQQ2R9sqnpdmj?=
 =?us-ascii?Q?JykV2TNBkV6NtMUHLuccvLIDif8Go8NOj6fIMJN/w9QZi8ZdR95Ko8hCiDt/?=
 =?us-ascii?Q?tLLTL0nOFSVSgKn4zUpKAPhFJyRybZnd18JVesO1ZSz6dp3qkBikLbrayOW1?=
 =?us-ascii?Q?jyam+OZw1cIaoAMN3LFZfrBEK3OfJHK+eHoWQ9lh5RZpHx0N+yMy6Zgk9qkJ?=
 =?us-ascii?Q?RbGkDZZs2XmIO9c56qKPsPPA0k2pBP4Su4O3SjSaC1NfDSL7i5OunTkxemzm?=
 =?us-ascii?Q?BdVse2tmotT8owxO7mVnEt3F+8ol/NZidzG3CBGcmk5uPN8tMK9bvhkToMER?=
 =?us-ascii?Q?k4LW1yhR+6HUvdPWrbIMKwfVynuN4I9mofa9dxls0WUEr3q34dW1i0JNsgTs?=
 =?us-ascii?Q?1K+OwWJfoE2a5Eh9+4j0QNz5KKfESSvNit9XIdmYNFTHUVGoPivdcqhzJxl9?=
 =?us-ascii?Q?S+/S2DMUMQejm7wbiqiTpyIoVJ7bxbjl+CA+7hxE5MIXYjKiQELtRsgDMb+D?=
 =?us-ascii?Q?Vh4USZ7iZBza4qWqEL91Y5lztBlfB126jnO3Ozi+XEe+QDtqPCMkolIxI6mM?=
 =?us-ascii?Q?UrV71ebq+Uacs+wqLZb3BN5B0AcHVjUOhqdshQCxTb9Hc+7AlpX9/rkv/HpU?=
 =?us-ascii?Q?KBg80tBmJ6wiRo0acUcF49zvgW3IskdrWrI7F/F5RFR41/QaMcHoyINTNDp7?=
 =?us-ascii?Q?oliIr1HS3gBI/hJN0uncQRsWFWowTftO/dr19YMHVdnBwgCwDoC/ITTIVQLW?=
 =?us-ascii?Q?SM37jacktQnxh1EsmoHg+j0p/+vdYpyYStsn7+Ps/FWCp/52eHdVos854xIO?=
 =?us-ascii?Q?lkmrB0dReiHu+r9Ns3SOdRvDcO+AS4ecBCOtbId7GDhCERhxHaMsdjAWq2vH?=
 =?us-ascii?Q?6rVE6H8QGxobtg0VKhfUBLCTsNZUHDane4gCIetU1JMnaxZYey0Z6a8PH4hU?=
 =?us-ascii?Q?lsTWXRjHQz2p0zo1RK70z+eehAKvDDDNsaV31pXvGKz4I3/i7jyK0nXxYEnR?=
 =?us-ascii?Q?5Kxi54c4WqdEZ7L7B3ga/fVwlC2fg/1vZirRYPlBPVPSgZsbeP55vqeYlKHu?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f932a7ee-8d21-40b6-20dc-08dd52c1fb79
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 21:52:05.8768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkY9abi5faefPEgFWYeEKSWnMjRSIGiWmAkWvRqrQhGtYfVDJY6DJIxFOoJVJiQ0ENXdWojDkDse0vqJdlhxPrYzPraAcesfdZAK9dtvbU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8594
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

On Fri, Feb 21, 2025 at 03:51:46PM -0300, Gustavo Sousa wrote:
> Now that we have all IPs being described via struct xe_ip, where release
> information (version and name) is represented in a single struct type,
> we can extract duplicated logic from handle_pre_gmdid() and
> handle_gmdid() and apply it in the body of xe_info_init().
> 
> With this change, there is no point in keeping handle_pre_gmdid()
> anymore, so we just remove it and inline the assignment of
> {graphics,media}_ip.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 71 ++++++++++++++++++---------------------------
>  1 file changed, 29 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 55162296e01873681af006c3102a188ee9a9d100..f010c9471a01fadb7ff2206ec20b1aa1072f6767 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -515,62 +515,35 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
>  }
>  
>  /*
> - * Pre-GMD_ID platform: device descriptor already points to the appropriate
> - * graphics descriptor. Simply forward the description and calculate the version
> - * appropriately. "graphics" should be present in all such platforms, while
> - * media is optional.
> - */
> -static void handle_pre_gmdid(struct xe_device *xe,
> -			     const struct xe_device_desc *desc,
> -			     const struct xe_graphics_desc **graphics,
> -			     const struct xe_media_desc **media)
> -{
> -	xe->info.graphics_verx100 = desc->pre_gmdid_graphics_ip->verx100;
> -	xe->info.graphics_name = desc->pre_gmdid_graphics_ip->name;
> -	*graphics = desc->pre_gmdid_graphics_ip->desc;
> -
> -	if (desc->pre_gmdid_media_ip) {
> -		xe->info.media_verx100 = desc->pre_gmdid_media_ip->verx100;
> -		xe->info.media_name = desc->pre_gmdid_media_ip->name;
> -		*media = desc->pre_gmdid_media_ip->desc;
> -	} else {
> -		xe->info.media_name = "none";
> -		*media = NULL;
> -	}
> -
> -}
> -
> -/*
> - * GMD_ID platform: read IP version from hardware and select graphics descriptor
> + * Read IP version from hardware and select graphics/media IP descriptors
>   * based on the result.
>   */
>  static void handle_gmdid(struct xe_device *xe,
> -			 const struct xe_graphics_desc **graphics,
> -			 const struct xe_media_desc **media,
> +			 const struct xe_ip **graphics_ip,
> +			 const struct xe_ip **media_ip,
>  			 u32 *graphics_revid,
>  			 u32 *media_revid)
>  {
>  	u32 ver;
>  
> +	*graphics_ip = NULL;
> +	*media_ip = NULL;
> +
>  	read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
>  
>  	for (int i = 0; i < ARRAY_SIZE(graphics_ips); i++) {
>  		if (ver == graphics_ips[i].verx100) {
> -			xe->info.graphics_verx100 = ver;
> -			xe->info.graphics_name = graphics_ips[i].name;
> -			*graphics = graphics_ips[i].desc;
> +			*graphics_ip = &graphics_ips[i];
>  
>  			break;
>  		}
>  	}
>  
> -	if (!xe->info.graphics_verx100) {
> +	if (!*graphics_ip) {
>  		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
>  			ver / 100, ver % 100);
>  	}
>  
> -	xe->info.media_name = "none";
> -
>  	read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
>  	/* Media may legitimately be fused off / not present */
>  	if (ver == 0)
> @@ -578,15 +551,13 @@ static void handle_gmdid(struct xe_device *xe,
>  
>  	for (int i = 0; i < ARRAY_SIZE(media_ips); i++) {
>  		if (ver == media_ips[i].verx100) {
> -			xe->info.media_verx100 = ver;
> -			xe->info.media_name = media_ips[i].name;
> -			*media = media_ips[i].desc;
> +			*media_ip = &media_ips[i];
>  
>  			break;
>  		}
>  	}
>  
> -	if (!xe->info.media_verx100) {
> +	if (!*media_ip) {
>  		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
>  			ver / 100, ver % 100);
>  	}
> @@ -640,6 +611,8 @@ static int xe_info_init(struct xe_device *xe,
>  			const struct xe_device_desc *desc)
>  {
>  	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
> +	const struct xe_ip *graphics_ip;
> +	const struct xe_ip *media_ip;
>  	const struct xe_graphics_desc *graphics_desc;
>  	const struct xe_media_desc *media_desc;
>  	struct xe_tile *tile;
> @@ -654,11 +627,12 @@ static int xe_info_init(struct xe_device *xe,
>  	 * versions are simply derived from that.
>  	 */
>  	if (desc->pre_gmdid_graphics_ip) {
> -		handle_pre_gmdid(xe, desc, &graphics_desc, &media_desc);
> +		graphics_ip = desc->pre_gmdid_graphics_ip;
> +		media_ip = desc->pre_gmdid_media_ip;
>  		xe->info.step = xe_step_pre_gmdid_get(xe);
>  	} else {
>  		xe_assert(xe, !desc->pre_gmdid_media_ip);
> -		handle_gmdid(xe, &graphics_desc, &media_desc,
> +		handle_gmdid(xe, &graphics_ip, &media_ip,
>  			     &graphics_gmdid_revid, &media_gmdid_revid);
>  		xe->info.step = xe_step_gmdid_get(xe,
>  						  graphics_gmdid_revid,
> @@ -670,9 +644,22 @@ static int xe_info_init(struct xe_device *xe,
>  	 * error and we should abort driver load.  Failing to detect media
>  	 * IP is non-fatal; we'll just proceed without enabling media support.
>  	 */
> -	if (!graphics_desc)
> +	if (!graphics_ip)
>  		return -ENODEV;
>  
> +	xe->info.graphics_verx100 = graphics_ip->verx100;
> +	xe->info.graphics_name = graphics_ip->name;
> +	graphics_desc = graphics_ip->desc;
> +
> +	if (media_ip) {
> +		xe->info.media_verx100 = media_ip->verx100;
> +		xe->info.media_name = media_ip->name;
> +		media_desc = media_ip->desc;
> +	} else {
> +		xe->info.media_name = "none";
> +		media_desc = NULL;
> +	}
> +
>  	xe->info.vram_flags = graphics_desc->vram_flags;
>  	xe->info.va_bits = graphics_desc->va_bits;
>  	xe->info.vm_max_level = graphics_desc->vm_max_level;
> 
> -- 
> 2.48.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
