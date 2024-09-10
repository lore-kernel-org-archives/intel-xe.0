Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F653ECE57A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 14:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E4E10E835;
	Tue, 10 Sep 2024 14:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTGoDJgv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1292F10E835
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725979904; x=1757515904;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PwbMO+fpF6d6jNhtcJKPN8vdazrrV8xUlGdjGqdgpqI=;
 b=nTGoDJgv7AUQOPCEDGiU2o1fbHOMrtnPW12EWVKyaONzAd2dThKYsfLD
 wMOe6kA1Av3tImfwc1B9t5S03lsUEPRuJzexJXyIJmp0ZOqFXn1qNpRWg
 SUbgyEC9TCju1UeWFLwpo7TjV1ehU8eLa+MDkUqN+DYKTAFX68hSJBxx5
 zjTaSQZX9edji2eSsWcgk1oAPyOQYb2tlaId3KU/qoi49oqRvsBOD70w3
 pDTpgEWjRac0XnNtxtCfgenkfaxqAWuS+oEdWhcyu0ZOtoiuCf0gGThX2
 6xLe70u47rUOeOEQpd22wJBVslfvAfKh+aqmOC7/B82Il5qKhdWioTzp+ w==;
X-CSE-ConnectionGUID: +wDtBInsS3iDw9DV+T381Q==
X-CSE-MsgGUID: 6KXAIoN+ScGKJCV1wx1plQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="13459149"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="13459149"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 07:51:44 -0700
X-CSE-ConnectionGUID: xDJI82VITS+TXebKrWxY6w==
X-CSE-MsgGUID: oUHbV49eTW+1MhCm9spScg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67571501"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 07:51:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 07:51:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 07:51:43 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 07:51:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmR5LnRi9b7ilQSUbSpyEUfTKQwcd452e8zU18oRAJiRdxbZRJVLOWNx64BHq7AFymXY30vmsPJtjrXAHJjyj3lWrRQ0Gr8LdSqqdNoBSr52czO7s9CNkhYdteqGSzsvKlCgrHfhV5mScqTZ3cRbqIqxOa6Bjjnnbi2tFakjccBdw7OW4qYL5dtz7eJNVycEwNX2ZmpWQCvX6f7u5bZhR4GOvmtCzofi4DwDJ55sheaxGUGJxb1ugGVTApvYAM+V5WEYj5PomT0ZBzIQonuP1Dl6jsJwCUVpCTbPXsfqu3h1V8avfpIAMuagvpKPRTuclCm5QlQHTyBl4SORLNQmJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWI4Nw1n899pYfgwpq0R7rTFrKgyM1k9UrABYu0EuE8=;
 b=WoRaHhapcyoUGZi3MaIeqexpYixwb73ijkGAjIvHy2l3gEII1DcIAA2ZaIY3e0tCtKPDTBRuR5HJ9NNnLtXBJpGSw2SoL+0iiKqQ99eMTcWZtGnTnJJ/2xjLXW9a081drrf9U5FM83rIp5p8QSiVZw0RryFRJom+IQKRb6ROZnY1Ch0I1TX4wyZylLx5BPLa0LPpO4FOhc4FlWwJ9F5X/FUwrA0/tuH7J2fywehPapxJR0J//Q61coF24qErHHjnzdIIej7gkawcBG/M6fxjCd64ROvxx/S4UILTXDTHTWOMB9RERfQR9VLgRxG+O6PT06o77Qd+euRBja1mIdn+AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4761.namprd11.prod.outlook.com (2603:10b6:303:53::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 14:51:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 14:51:35 +0000
Date: Tue, 10 Sep 2024 14:49:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>, 
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 4/4] drm/xe/bo: add some annotations in bo_put()
Message-ID: <ZuBccDRC0NkcJsux@DUT025-TGLU.fm.intel.com>
References: <20240910131145.136984-5-matthew.auld@intel.com>
 <20240910131145.136984-8-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910131145.136984-8-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:74::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4761:EE_
X-MS-Office365-Filtering-Correlation-Id: cc5ca0bc-7496-4677-7d23-08dcd1a8113b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KzB2aQL1BRLVkgetSyOAGmf+rw86eBJk1kLcxrqP88ANZ6hPycYngTE0WI?=
 =?iso-8859-1?Q?yZqvLDyfLnSdwc6aVm+U/4Ts99qSiVA/MQ2gL5zFxnw3rcmfTu/5IAk4B7?=
 =?iso-8859-1?Q?JGiWBzMAqgkb/boWMnj65WWRR7NsegtMY+ARDL4mhhi5GvP5v6grxDdYzB?=
 =?iso-8859-1?Q?iewG8NfQpA2JNrThQm4aW9Jt+BjMBIotD5nzUfhmdl3SLRSUtKHSzXtA/5?=
 =?iso-8859-1?Q?Sa13MmpOSH05OY/cvuede0MUr8o+9/XdyDdA0NrLTYX1h4z1ayZ9LCP7VF?=
 =?iso-8859-1?Q?4Q2pQWZr/oZI7gHjIppyh3iLrQbXCmtdT22Cce3kNlUqKaEnVoRiPohKgn?=
 =?iso-8859-1?Q?KSMLnr28NstN/nH7mGPZNOP0djR/W/156FX8KzJT1XOCMycpBe1TnzpBId?=
 =?iso-8859-1?Q?Jz3wdT1YTzvgyWch8uIqtRJ5eCgsaUswbabmes+cuzP60nnTWl59oP7ua3?=
 =?iso-8859-1?Q?f7gxA6/rG1zkMXV0IHU4IHXoZ18wAiVuT8uf20C8bCZbGvC/95jl1PNryB?=
 =?iso-8859-1?Q?F9cg0aSp5HDCtUsa6xDCE0UiFmlssJkWEUmUhhvjqMc8xy7j8rBEMTzfsW?=
 =?iso-8859-1?Q?gL9iLAQ0u0o3fEzmGFWRxpnWQLCnZ9GnTlYLQ3VN/GcqeLMLmXXVAR3tuS?=
 =?iso-8859-1?Q?f8hQSWONeWEz1+pgTWDNjd9wz3ISv+54kDrFHqOA16Lk4WRvpMtxirJGRQ?=
 =?iso-8859-1?Q?i2XJJMNfKeS3Y4Tug0d9NGffz1ZpZBprhLbRjPsZBfV16diWAVLE8ba1E6?=
 =?iso-8859-1?Q?wt1rMfpb8w+LJAnBs68jdejpudVMwFGBdWGA1qVIDKvsNODRjFXM1rqA9F?=
 =?iso-8859-1?Q?P6HX8uXYQc+5jwgRbitmwxpz1TWw3cjj/c5AK1je7biREEav/3zZ6gZVL1?=
 =?iso-8859-1?Q?ljGQj0sNlPojYKVYiOecQbh8aGccNDp1BtNquYOgFuteyVQLpDyQgUVMWJ?=
 =?iso-8859-1?Q?XbOZYZStBRgsxynDi1LoPjro32Xjb8+SVgf5eIAMMeLb1G+EUUdQnLd39X?=
 =?iso-8859-1?Q?H2Y7+KnXCv2pUgq9N//194Er2CBD3XanG5iztlroANdcb8FJsh45dwX0qP?=
 =?iso-8859-1?Q?0JfIVzYtMKCi19xSk91DyII5t11xWuAToZI6Ej8WhuKCLXOH+vJBBPNQv9?=
 =?iso-8859-1?Q?jJaBwjkDwMa3UoTaOEB5gdXsX2T8OeSF4GetnxPA9AmGtJsoNCKNzmUilG?=
 =?iso-8859-1?Q?e2dHs70qU8+hDZ+zCBMdRafLNgbpuBQdN1zXLR6pPxwZxGhA010emn46Jj?=
 =?iso-8859-1?Q?cyjay88RWyzogCvuNkbixV0jfDgcFlHG9THucNhNkjXU7uk0UhZ+H5cJzw?=
 =?iso-8859-1?Q?PbaH5NLl1nCnJwMCTLaoNyXeHosdFvYpOvh4FlT/2eftS+AosQm+UEoFNQ?=
 =?iso-8859-1?Q?eEP7bC1EMy9Cy3JKRdz8tZWmBNir7Ndg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BidORaJmRZLWhKHmve9gVfmKH+mdzcgkqXeEmJDj6nJbWsjIMxszG9tfKb?=
 =?iso-8859-1?Q?hs7+5W6z85YnqGmrYCTbpGLbOq4u+mbjDjNeS4dpBOxjzjATRfOspNdsvp?=
 =?iso-8859-1?Q?UtUjsnFO6MiPDJoo4dtC0Qsl8UU8OqPkKdBhvixE7NCj+tBr+cHfa/eaJu?=
 =?iso-8859-1?Q?EkhJkrIiZA2UVAXOVK8CxpCNTSZKCQnMDaTs7MshQErt3h6CDhnU7pMyaB?=
 =?iso-8859-1?Q?wvSoA/Qyd08oXOBjVliAU1Ur9Cbusil1eVn/N3YRvgqX8rq4hpJRybPmHE?=
 =?iso-8859-1?Q?vD8EC2jJRd/qEq8/GlOjdLDbkfqIaPoW3X0OxEylqh/yPYjqUjxWRlyq6Y?=
 =?iso-8859-1?Q?46qEcjCGPcV2QcRH64pME+p2gDEgXbFldgj7//mnNmE48LcOOlwo7SA+yU?=
 =?iso-8859-1?Q?DXT7jNA1QX5nVeSBPNd92F2jXKiVSfQ8uzMgIvGbmYvEXB0CXJohYkursV?=
 =?iso-8859-1?Q?AxnbjofOyZnNEQ45VrCyQHKE71qjl/NWilYIjej+Vo74mv0ciGW5FA2ELy?=
 =?iso-8859-1?Q?PRDayf9oWnSN4pMsNyhap9QWkDqwHVTglOksJtd2wz4+DTQ+w22+dAX0pa?=
 =?iso-8859-1?Q?xPUylTE/S+QBhYUkhv7I5U1tGyB/Ua4SLGtcT9QmMGCIdHxhhd4dpAle49?=
 =?iso-8859-1?Q?MD/gX09Mb0ZTyOC1+ISHemfAXuI6ed4HtzftozD7Z9lABahOjvCV4p1JW8?=
 =?iso-8859-1?Q?Gys87t4oqjYvABD/DWRXEydAzwx1d290K83l2dHbVeIEi9Pp/LRqlxQVG5?=
 =?iso-8859-1?Q?rLEBRbhkGdGiCa1XAwmi4aeMeFOaUx37yIi6U9oriwCXzwWGl9JNmVQBTJ?=
 =?iso-8859-1?Q?YhJtk43a7i5Sxo3jWZ8iZe+mUf3jawCYXjwgOOU/mmrRCuzZHGuHRUbHFL?=
 =?iso-8859-1?Q?Z4fnhn4I1H4tmm2f7fjJ4b7dioAgwEbK1u+2C3DEfUhK/qsKZdEtd9ramc?=
 =?iso-8859-1?Q?GZmWMgVQ5ct+ZYSaVpMkexgzxr+g0rttPK7FQ+PgbM2fbbJaM5h4iXCbEg?=
 =?iso-8859-1?Q?PIlFM+bdHESPf+Oqjlhymk89e+xDZ4Ktb2xlVKbdtY4u/aOCILGn7mKkTJ?=
 =?iso-8859-1?Q?Wemi3NM/OqRnF4UFiFIqToTzaclSq+AlNEtDpE3bapmvBdb/3UKijqhp+A?=
 =?iso-8859-1?Q?4Shenpdx0If7Yzd1ltB90RjemtHal01wMJsKU34JAm9JCSoMXW5hPtHVxb?=
 =?iso-8859-1?Q?Bl9xDkLsSlvh1B9Xfwp1iUeeIVLGf4YA7elUY9TTxaBIdoBWfhE0y7lApT?=
 =?iso-8859-1?Q?0FgFoKxwoGDKJy9QMLGUXIrCQe3fvEUE+Ds93FIFlHGoTI4SGpybqeVeEt?=
 =?iso-8859-1?Q?Bd5pJ+e/A4tOby6rtzqm9JkWQ7CSgsbAD7HOzvS2iBZhI/jX/ZFGbQI3R8?=
 =?iso-8859-1?Q?SMsIv9DOivJZ01qljZmFbYSH9HWjzGV2fePi+1Ea/hHpIN+w3XnTBq/G6N?=
 =?iso-8859-1?Q?hqcyyKRlSuE5WT/vH0L4t6MwltxZNrWeIoRvrPGjCWEHTq7hj0YbmuDPBW?=
 =?iso-8859-1?Q?PXdIn8fybMbYGbXP+JqPQ8xnTH4MhP0skFh1yGfU2LIV7NP6lExuT3fRbR?=
 =?iso-8859-1?Q?/WbckEV+wddt+gnoADSfzbYL0FeC9WKwNJIU7p5PsVtuQwwy4mVcQz73Kc?=
 =?iso-8859-1?Q?hP71B336dZQ+uqdTAjvnV+TgxcjS2YcdscoTDo46hWel0iUAlaZQhoiw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5ca0bc-7496-4677-7d23-08dcd1a8113b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 14:51:35.5192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMtoT/L6WclhSr0QGOd7OzDtB2OP+0xCFWVuIhvOy95ymaPFGcO3BLL3UwHVof+3pxMwZgKFZGi5aJiHnS+Rtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4761
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

On Tue, Sep 10, 2024 at 02:11:49PM +0100, Matthew Auld wrote:
> If the put() triggers bo destroy then there is at least one potential
> sleeping lock. Also annotate bos_lock and ggtt lock.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h |  6 +-----
>  2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 53948a965404..4176b302c38d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2320,6 +2320,20 @@ void xe_bo_put_commit(struct llist_head *deferred)
>  		drm_gem_object_free(&bo->ttm.base.refcount);
>  }
>  
> +void xe_bo_put(struct xe_bo *bo)
> +{
> +	might_sleep();
> +	if (bo) {
> +#ifdef CONFIG_PROC_FS
> +		if (bo->client)
> +			might_lock(&bo->client->bos_lock);
> +#endif
> +		if (bo->ggtt_node && bo->ggtt_node->ggtt)
> +			might_lock(&bo->ggtt_node->ggtt->lock);

Missed this. We can take dma-resv lock too if we get into the TTM code
upon this put too, right? We should probably add that annotate too.

Matt

> +		drm_gem_object_put(&bo->ttm.base);
> +	}
> +}
> +
>  /**
>   * xe_bo_dumb_create - Create a dumb bo as backing for a fb
>   * @file_priv: ...
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index dbfb3209615d..6e4be52306df 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -126,11 +126,7 @@ static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
>  	return bo;
>  }
>  
> -static inline void xe_bo_put(struct xe_bo *bo)
> -{
> -	if (bo)
> -		drm_gem_object_put(&bo->ttm.base);
> -}
> +void xe_bo_put(struct xe_bo *bo);
>  
>  static inline void __xe_bo_unset_bulk_move(struct xe_bo *bo)
>  {
> -- 
> 2.46.0
> 
