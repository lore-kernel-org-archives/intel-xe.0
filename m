Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4283D5C0E2
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 05:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3999310E00D;
	Sat,  9 Nov 2024 05:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPy+xSpL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC7B10E00D
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Nov 2024 05:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731128971; x=1762664971;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=09sqaSerMhdKb3Up1R7MbqygaQ8eF5P1qiGmCAu3/Fs=;
 b=lPy+xSpLkReSvBkQLgE66kxgEGBJclz+WbdziyYijLR4oIoA1f/4NLpW
 aAOu83nhgtcQURG1nFvGbAvH2OIhfhcLdUAP9U9U7lnuzQn6U0KNVKBtC
 kQcJ8Z2V2pnMV3qGtOND77ob9/uDBKawVOxFq38wT9xfci64Xasq9dDhT
 JLJDKm4MeUkLxyWGyLJJuzM5TKott1gJ0nUd6XSWhgG5K+hdvPqzgSf34
 ua77h9ufzRO8NSE7i05gE9BTFg2Czq3WNNYjQKEXxIuoHAn+4bxp5kZ45
 6C3sfGDHbd8ZECPAJ0cRpOesh0elbkTdUydW9YA984oj8R1rDTwHIL+Fw w==;
X-CSE-ConnectionGUID: iYNA8wBORzeLkhPn0giuLw==
X-CSE-MsgGUID: Rpyy1BpMSMyVtkfhGKKziA==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30432927"
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; d="scan'208";a="30432927"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 21:09:30 -0800
X-CSE-ConnectionGUID: fdIZYyC5SIibSHTCKSveRg==
X-CSE-MsgGUID: TihueZMkSEuydwTI21pFgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; d="scan'208";a="89845921"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 21:09:30 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 21:09:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 21:09:29 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 21:09:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgie/ikMfGvbAJm+saCRgJeGlgYNLqh3xskNTvLm8fo5vknGjDC8pN3JINqYdLVb69rv/LzwMsIpZN4ZUfkANlhvLvvF9bXXn0B+3eJNEKrn41d8sS6jGNzTikMtNKxh+jx91G/C6WSloZTSct/Ef+MESWP1hTZJfv08meJ764KP6VYh76DOeRfsNEAP7PZpseOVfB0nnCTbuSZ/7y0w9rkUPcss6869yw2Oe17RjeorkyjcQA77BtpYML7S9ZLlbPxFk3u3FWa84JM+ka/mZiuPF+LbYD9l7St0WL1mF1RfkO8lJHtB+xTjOr0ca6ckGww5zTe2LjmKrvRG/cXcQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aFf30Ul2gqzC6kYfAPQeS4/vlbzodN9RmIYGpEKkNk=;
 b=KFUQQomwN1IL0Ef4EvPAhBnJyDb62fJ1qAygXjnuvbF0gon8Odf3vKKNWaax9cJEWtoH7nOlkQLxAH5Hd1yjVsjYRULYGjcy11gKMy065JsyN9OS3M6m2bZ+HshxynDV6T+d+v1PgpDhpDMc9FOc+HpiKItKtvYS/7XAnhh011loFDkCcjijHDQzhcW4K8pFGsjOyRj5naR1ygur70TH+2J5NvXUZpCUXic+6hmiPwIMtzAYDbYb6Y2GYUBGNFYJK8cRa2ORjzny8Ln1sGGGRqGU9MAoHinFBCC+3UKU9JUz5NSljJISqdQ299Pzdpys9YIvJXYvpA1HpQWcWQJYyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7731.namprd11.prod.outlook.com (2603:10b6:930:75::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Sat, 9 Nov
 2024 05:09:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Sat, 9 Nov 2024
 05:09:26 +0000
Date: Fri, 8 Nov 2024 21:09:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH] drm/xe/oa: Fix "Missing outer runtime PM protection"
 warning
Message-ID: <Zy7up6Jw6rvEB649@lstrano-desk.jf.intel.com>
References: <20241109032003.3093811-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241109032003.3093811-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:303:8c::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c7efeb-2a3e-4244-10e3-08dd007caee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KODi+C9w4HwGzwO1DVIr6YmiFy552U9hIfeoY4Ifr85cBrF9uKD8sU7jGx5n?=
 =?us-ascii?Q?PPhUgAV2TPWhFar+4AsxQMMAq3gLv/gZqpntqfCO6MOfxyqe4/1zuG5GhM+a?=
 =?us-ascii?Q?LHwQMDFVyEBGbYrz+AeGX9CeI5msiG/ZbodS13e63yrAP42FB/V4lWYLIbip?=
 =?us-ascii?Q?VB45W5vkcE3AAYJbp6jzZVEKIEkIGabgrozWaGizWRbNqC9IdsyY6u+SljMV?=
 =?us-ascii?Q?VkR3QTqNZNQKLTIhSOSCwn41uNdCVd/Qpgg6tXPgy4/zSkATpUkaykQfEGNS?=
 =?us-ascii?Q?lPzIRp2lcIV91z8GlvLpWXA/6Ne6BXi+083wXDaDsQqOcqdaaYGBPh6aaMmr?=
 =?us-ascii?Q?TanLwK3ipOd9Ylv4FWr6b46zCZTA0xxY06orD3ERmae24Zlx5Js1hV04wXXh?=
 =?us-ascii?Q?qyiFPH1r1k9MZyBQnnP0BjB32g+PtgpHAHicAZ1AFDODTI8kc9JVLsZfAvOc?=
 =?us-ascii?Q?fqx2jmz8M2ETkyt2JWskiY5irOt32yt/d2Hr3syqC+31eCZ7JLEBugAQw/IN?=
 =?us-ascii?Q?0IlXD4HyjVtq+pJowYIVd7jFXDzxduse2DmsevnlAKv8vEg8ABCjpr+2khJA?=
 =?us-ascii?Q?nG8hmTHs1Oqs+L505FkztKMKr00M5E7l7GlKXxp8bPhKOBerPrckRwatpBrF?=
 =?us-ascii?Q?eI9n3+G6vHO5YFHt+3aXLLY0Qb23VTmPwvDPwXDLd298eTBd4SpJsquchpaY?=
 =?us-ascii?Q?pFsNSSBDBMTC3gOejQew2lJAtHzz9w13sUjEOwGAkBoQIR+J9iQTHiLePrNI?=
 =?us-ascii?Q?Zqt9XlFM8PCPlypbIW9DvfPULX1Net/2hbWong9VuDkYS1ofmuBLzHiueR5r?=
 =?us-ascii?Q?vpR2x8UY91YzAMnIXrgZzL8eKoGoaPuwxU1/gXfJOJ63QIpN6P4iylk4rqQ1?=
 =?us-ascii?Q?7JMBhaF+lNSLwP+8pOYXw4vPNy5nYOM3eBzggQAbTTK85BJUbY+gGMoMbaXW?=
 =?us-ascii?Q?CG74dJP+R+yFrdXxQsN7q2w3bt2RTRVHd7iC2cnzhI5gAX1LU7m0wnXozxv3?=
 =?us-ascii?Q?Le3+Yg6Dtx40pfoaXF4SbrF1JccI0sjKBGyi55Ni06xxhGAH0vKRLhQdeSpz?=
 =?us-ascii?Q?AHy+qVAcworR5dgf1cj4IuIvYn+n2fWqpyDMG9ZURqrDyFLM1QaIZMhEaWYH?=
 =?us-ascii?Q?o++KKFOueo9kL0Mh26EJp24wGYPrJ1eISAMcyH8wDVNb/N1sMzgOY+QoMmlC?=
 =?us-ascii?Q?olejAJa3i8kRP+1D4qJhW/mgSdLGzzHGLoPxJIX+tzhdmpzA2m0XNw6ezsb6?=
 =?us-ascii?Q?6X8CkClRP52D4Q8qOvSLIiSkqFtlYHDO//urE4psWB8vImrPKnDkDDgKzGiP?=
 =?us-ascii?Q?5sQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3RccdCINo+5RADlMCdl/QSMVWTRDaJuSo94TOCeS9f8DW9+MYOWXyg5ync0A?=
 =?us-ascii?Q?f3/9Rs25LiGe1AF01M4E+G6AV/OVy73LFbVT51U/sA5JmAW9org6f1zIPtGE?=
 =?us-ascii?Q?AlC50HTjiGCFryKCdewVPePI3gPHcmXWAwA9pzgp6NlaoKmEacb/FfUT0l2Y?=
 =?us-ascii?Q?ZsOTk6WquELAMhHqAjIJ97UKK2OWW/VZsax1JZitoN9mogAk7SSJH+mah1II?=
 =?us-ascii?Q?B3ClWHbPd8g3Jklk91P3kF7N0n9K5v2pnF6aUDI4XxAMa7uoebURDVx6BzQ1?=
 =?us-ascii?Q?DPxPNa3OKMFLo9N58zn6WfOsqfuiEvqIzGkTyh4sUdw5x9MRyiU4QuSe121A?=
 =?us-ascii?Q?gRUBmYONYyFhNBmxLjvSn057tWsRWj/jnnPODDwSqZj92CcIcO88J6xyXXnp?=
 =?us-ascii?Q?IjWBRE3AcuzlvCYxCJ/TIAW+sGGj0dW8adiXQ/+0/BFz4zvQxR9cJ0cl//hq?=
 =?us-ascii?Q?SViXIhTTkFxEssdkcVHqbagOHfkhKc0I7iOGd43UsT8wTErknQXpmHg7OyP9?=
 =?us-ascii?Q?HY8AHhtXmMHBa987y2VoYV8PQitcA+/fQEclAlQyO8lX48ir6WVyaxK7ABJ3?=
 =?us-ascii?Q?lhYNBXSr4wr0XtgaZA0oBV+wYXJ9gD1Z8HNB18Q6mrRbXJs2kW+2vLLDnOSW?=
 =?us-ascii?Q?S4V1etJIX6BtMrNI1KUEnjTW2VUzQSUBAeKnN2l6KeogutPmJoIMFLbxKVtn?=
 =?us-ascii?Q?LtFUxiivS6yIuHY1MJ8sADB/PTRHzu/FmDxlW9im0n6i+QRUXkJyMyDLO/YP?=
 =?us-ascii?Q?MLW3xznaTT9/zfJNLChzWNrAKPfmsE5i0IR34MU9/Egzbruj6mbKxg0UXsE9?=
 =?us-ascii?Q?c+LpXgEZ23NPutMOCpLtKkYBE4hunxXe1UwA7hi3b+2A1wmgkRsg7PPXmB1J?=
 =?us-ascii?Q?sqa+jt0eSQEC+hhPvlOz/NBYM9Jf+EJWIKCyrlRRVSBwKntRAECjs4yTkrZE?=
 =?us-ascii?Q?8g6Y2U4TxXLhGY0erEzSQIxLbsSfefHw1umhktQIlIn3ggdGSaNVM7ueNj20?=
 =?us-ascii?Q?qKw1i/g4hHuvkyEpHz8LE3ImZN0i6q/QrqZbsQ4QnZya97O9c9jQy6oV3nzA?=
 =?us-ascii?Q?rQk53ls//f7tYE2cQdFhYSXvstr6/cKhUNbZyzrdg0gx1yw2QI34nbauIG/L?=
 =?us-ascii?Q?FzbSpk+i1h9bgH7MqlWoDrNA43PD71o3FFFzxeh2im8AkvgAyju8i2UvgFOo?=
 =?us-ascii?Q?00DLMMkt36ky/UA0mOPHun+yX6h8FozZZqfIq9W2iQPIhORI+4NBvsLbV5lr?=
 =?us-ascii?Q?XgzJZjpQkEEcYkjlhv3wCrVGrxhUj4u3nNOSOzckx43oc7t8ovWKPZGbrGNw?=
 =?us-ascii?Q?xfnZLDEH5747OCkpetRXrqDh/bvJSNzqBEwe3ADaQCPDMdB7FCCDiOZdzWTC?=
 =?us-ascii?Q?fJGmtf56BaqgsWTBW/MUR/k/udN9kVivXHqpNyEFCkkKu8V5Pp0DP1U0OQCs?=
 =?us-ascii?Q?4zg8rhr+Wemam3IBD77MzRsy3m54HqnMchGIOSfPSCPkaLisHdBSSPVWr+y/?=
 =?us-ascii?Q?jFWPPc5hM746FokG6tbWwsD4kcYMMtK8Y2gle44FFiknBqrfLrWdGfgTy49W?=
 =?us-ascii?Q?TbhjUgUC4aY19MCIMgMhVjh+XfP7HiKpNadiOv/NfDNz/X3jEFbF7svDB5S9?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c7efeb-2a3e-4244-10e3-08dd007caee7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2024 05:09:26.8560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UWeUrI5xtW9U7RlDxwy46LLIjqaubs8UXQb7KegH8fAsNRR/NzbqWXPdpBwkZMARAIjRsMrR6Gt5wHu+VA9/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7731
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

On Fri, Nov 08, 2024 at 07:20:03PM -0800, Ashutosh Dixit wrote:
> Fix the following drm_WARN:
> 
> [953.586396] xe 0000:00:02.0: [drm] Missing outer runtime PM protection
> ...
> <4> [953.587090]  ? xe_pm_runtime_get_noresume+0x8d/0xa0 [xe]
> <4> [953.587208]  guc_exec_queue_add_msg+0x28/0x130 [xe]
> <4> [953.587319]  guc_exec_queue_fini+0x3a/0x40 [xe]
> <4> [953.587425]  xe_exec_queue_destroy+0xb3/0xf0 [xe]
> <4> [953.587515]  xe_oa_release+0x9c/0xc0 [xe]
> 
> Suggested-by: John Harrison <john.c.harrison@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 53d2946ea3052..b0928daf2f308 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1615,9 +1615,11 @@ static int xe_oa_release(struct inode *inode, struct file *file)
>  	struct xe_oa_stream *stream = file->private_data;
>  	struct xe_gt *gt = stream->gt;
>  
> +	xe_pm_runtime_get(gt_to_xe(gt));
>  	mutex_lock(&gt->oa.gt_lock);
>  	xe_oa_destroy_locked(stream);
>  	mutex_unlock(&gt->oa.gt_lock);
> +	xe_pm_runtime_put(gt_to_xe(gt));
>  
>  	/* Release the reference the OA stream kept on the driver */
>  	drm_dev_put(&gt_to_xe(gt)->drm);
> -- 
> 2.41.0
> 
