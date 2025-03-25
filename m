Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFDBC3600B
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 19:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E893710E5DF;
	Tue, 25 Mar 2025 19:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cw5P0f2+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC68210E5DF
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 19:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742929964; x=1774465964;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6x1UQJgT75HmM8rEGKfpN32svKlA6/2FeWYFyVCNiBU=;
 b=Cw5P0f2+QYZj53NWbSOxduoTGK7hIl8CzzlhKLHIhvmMtxhn+OfY8KrO
 33A7egCtdDgfXg5yALafujI6sel5NtHejH8pwKsRKLZEu7wcxitss6WO3
 F16POcZzkASPAqyaRZxyaVVwnumNb5f3AEXgennT0FLtPqfOr71c3ZYQ3
 1eI3aFLcQeLbKjgTrJDua/Fw/CDUdNX35ioOQeTSi2JbTYaW7qpFAXVhr
 x4vYl/zc7oarIFSFNowy0agEN95eUC39++Rvy52Pd14PBEo7uw/oGvcf4
 KY/bqJdF1vKb9X21h8jqVF96PvyP3fOX0udf6hbCQpx3icsJ8+O+75hrp A==;
X-CSE-ConnectionGUID: xtxArdhwT8K2TaNpZnBhYQ==
X-CSE-MsgGUID: ktQ7uOMCSqSqHBKk2JJ2mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44209590"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="44209590"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 12:12:43 -0700
X-CSE-ConnectionGUID: sQPZIG0HSCGUaSXddk6RuA==
X-CSE-MsgGUID: Cejaabl8SdSXz5Yghz027Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="124941513"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 12:12:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 12:12:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 12:12:42 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 12:12:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKQV8Oawq9I4k+cq064h0jokzMp6jDAub+b/DJaHXdNgBUt/Bk85slxtwF2q2sJGV9VnfBHh+pUQ/kJLp6JXcfIG4CaBC67p7buOpOlTCq4pWaeHas5URwemY+xMWI1FnoCyDXLEDtmM5NZuQOOIAAutJJQ8vkLJi1F3ddufcrRyZQPFJKLalR6YZJXgdLyrCJefZRIntsSR5W7sJ6wedGpEgBSlO+Xz0w13D6AVkBL1IrxSHzEbLapqXTNOtsDRPSRHZRH4JfVekCnyYWtJB8q88qNUowfaq4bNWec1KFhp1hD+4kvrD/rqzPbVeejlWR9jax6SuFJ26xAaYi71SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vp6b0Zls/eeMn8Zort2ZXy0tx8HwP/zu7lb0IGvGCCY=;
 b=xxdfof20whFq79ufeBj+wCBF98P6koC87Zhef/IFtschGAiaiaacAa1LWONKhUhvBVGSd/4ziNhKFGq4lKXNEcu2QnI0VZH86v6EiP3EfZzZNUKx08Fbab8l6L36j63Eivg+YzgUgM25c6k+QRMma2sKH7UZFldkMBNYk1maa+BgVUmi7zb3xlrRURzX2bNw9y/SyUh234Bo/XYxAamMsAUADDgXB7kOd/rC14lyoq7fxqDFEQY8Rk/4bttuNEJ8sLr4ERAvsyVKahsf+2mnJyUrQBuS2WdQ1FvYu3bzducR3jWAyEzU6FcDs3lwXEsLZxOP4UQHysGVV0TUUdISlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 19:12:41 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 19:12:41 +0000
Date: Tue, 25 Mar 2025 15:12:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe: sysfs_ops needs to be defined on parent directory
Message-ID: <Z-MAJWTFFlbaZZcj@intel.com>
References: <20250319121349.288844-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250319121349.288844-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:303:b9::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 274a9f33-2aab-43b3-5c7e-08dd6bd10385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aKDQ8WH24n0y3beey/VEzZqtg0w6Sqrk618JTQS0LOIrFFocGyuiYv4tN3GB?=
 =?us-ascii?Q?yqpPblj7A0SS0MiedeyEGMQDMBhNCqZf2DsFdx7VaZs85dLa9VKLUEvy+bTi?=
 =?us-ascii?Q?iq8ty5fftVs3LqGJzk3Y13VN1Cfs3wz+2WZyfU1HRKfRhfOiDoqhpw9/EWlh?=
 =?us-ascii?Q?Rvv+Agz0Tu3QC2wV0WsW9VAmA/wo56/UXFiR9Lld2XM3HERzbZHBbmk5nMGY?=
 =?us-ascii?Q?xZQfG6YtKRrKb/oQa1ec1Ip5eofKbpPYIqHEe9oAROa0U5HWB3u/EfWo1qsg?=
 =?us-ascii?Q?lXQxdTf2l/5/p8Q1uFF5lTEaIjeZpUxwui1ilbMnBFJKHDMVA/JIEorUjudh?=
 =?us-ascii?Q?wJAFgLLYEqP4N2TpCiOdeaZv5lVtPgQ3kPGQb7+wPiYXMn1Mpk4C0vANAKyW?=
 =?us-ascii?Q?T3P4NnLK32H+hr4SwDMadIgxy+MtIEqM2j4dZ/QiWEYF9kBmhSGq4bhQ17SP?=
 =?us-ascii?Q?iVZ40vXQrZ0obNmn497vLA/75Jc18oDbiNItrr0n+o7KfQCBH7M+ALTz6c5t?=
 =?us-ascii?Q?rm1oB/dQUccAALqUc/qLPtCLPDDQfDwvE9oLcxsJfd6sNesaMyKg6+Pmo5ju?=
 =?us-ascii?Q?ZFSkqYi11dbi64+QlAcM5vEFa6s2s9Cdndnttes76V6hX400nLz/1Ygrmqyg?=
 =?us-ascii?Q?8sC5cp6NH00iFZu5fy0gGd/X3JM+v3FrYOaTmPTHFnUyLDrw6Aj31hnVHV5Z?=
 =?us-ascii?Q?PE6k1YAnEI1uwU2w+nT5bWIOoAlKJkyqB0mfJiEqCN9DVW6qIfyYSRZe6ScD?=
 =?us-ascii?Q?G5NQ2ks/RCShNy/j+KJIN2qfbHjECyljnQyYlPZTF8P/+/FLkV5CpdVym8cG?=
 =?us-ascii?Q?z9sVfv/pTy6R59EXyH4hLPvuoOMwTOWjw1qweSa8BR9hK6G3/Y+LR6lP5kV/?=
 =?us-ascii?Q?Ut4Hcox+63Y01Ktg0BxyWT+VMs6C5jH7GkqRk3BmOJXRUoUvJz+MVnYUbD77?=
 =?us-ascii?Q?/tK3e8Fn5Mj6wUL0Wi4PEKTDYUiwCiHetf5iqF1My+WR/LYc/nBPmbBiLRy3?=
 =?us-ascii?Q?m+z0OaN7poM731IU25MgG4SW/sQL4uUAIfqgSDJi2DUD1bj/4W+IjgCs4cdj?=
 =?us-ascii?Q?RWo14vmSpw9KEx+7v2tMM+UzDY47h2mKNMiW1bppm7crtTvOsVPt3R0GP7jo?=
 =?us-ascii?Q?mpQBuJH1K3pkMuihnarVtlnqlXTSLXDNU85mWtqKhzEdDrNj8Gwgo4nSsG3+?=
 =?us-ascii?Q?xac9erxzshACxjwMg4tgnK1zhhh2y4bFGVBv1g7O/kJswPqibonw2an6mItl?=
 =?us-ascii?Q?OU1zQss5+htvtxbcLlrOa6Kk6AQ6PIMbRMD29+/atme5EZQt5l4lE/ltxfDy?=
 =?us-ascii?Q?Vh2pT1NXu0gb1uSh7O2tNAWAMA3VkdqjcrOZug8NWFxwxI4dtTX/T132PexS?=
 =?us-ascii?Q?ooCKMdmh/+51w2SX0IxcWRaidGet?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y0F9n3ZKRRcVVpzYfzk6J+JMom6dPVH1pupPoxVyIAUiX9v46kgY5R8ld7sN?=
 =?us-ascii?Q?vGWAF321ZWdJGF8gQl7PbGLXicQxWt3LGs9jGIQl2WXVNUtrSP+D0z15bvIn?=
 =?us-ascii?Q?INuw5kJEPG9u34YLVUPDw0r4bmt7zU6QUMK31xciba2GrNaWRWLuKuPb16by?=
 =?us-ascii?Q?P1h2xcQKfDETi6hiRNbfTIiWv5481fDUutZ00VkCWxZNP5y/DoJJkv2Zjee4?=
 =?us-ascii?Q?zT4yXWxpSxhdWXCRpwLtKvHzPT7xKce0LswjvGYvr5ETdHkgwWBONcR92Oxk?=
 =?us-ascii?Q?HQPVNK4T3m5grKfTJGuIFX04F2TLE2FQSzkNqX7AC68sBVF2Gs2LJd7JtA7l?=
 =?us-ascii?Q?/1SAu9Dy6+l1b+yKYiPVgZmTrza+UOTKgameBBVuNosgtv4VSOs1vqrGMqKN?=
 =?us-ascii?Q?aGoW10+JI9HujnxzyfDz+Le4ZsNuDFB1cnSIqworAUP2LkxR9oHOKfuDC5Vy?=
 =?us-ascii?Q?BULKRkGvfkhqg0cB9BFnqBplLuI4to7sbiLHDLjHLaz/c1WzJ26RNLXU+hff?=
 =?us-ascii?Q?2GWX2BhdluIADjIMbBbrP2qXcQUbYeh76ZKY9kZmAFpt1QvZMpOJwWXF26zh?=
 =?us-ascii?Q?WdbA7n9dcFpypDjB7QPJP0nxdaWVdvpfPBtAJLYDjDju6FEcSn84jX5ZoF03?=
 =?us-ascii?Q?ilmQ71bOjx6A7hKkvkL/lCr+ElX7XiTk0tHJMIGz2/MpZbYFI57bgVeQ+avC?=
 =?us-ascii?Q?qm4UUAl8LKh0uHETVqTOzvfoFyeqCJzpSFUkw3eFbsP48tUfzgpyI7TenUKD?=
 =?us-ascii?Q?3Tae3wWa8ILD+95Tr/wuf3DvhTdqEtVLXgJegiH0bKM6mJIoBpq8E31s5WuE?=
 =?us-ascii?Q?sw95YTn1NvGBbnw2YyrO2bOfZ1PPr2X27q8YiSCHTKfgNnPO8q9TiXANKtPa?=
 =?us-ascii?Q?V0d0pL+skT95S4uB/MjJyyMxs5E9BUVvmHRm2gAJl32Jaa8rCNMkobPtVgga?=
 =?us-ascii?Q?GMrjVXfpe8Vm8XYxz0RfWWhoRNHvpqGUvZk3Hr/SMK3eNIiHFQvaTeRKjHqu?=
 =?us-ascii?Q?ZsrJCc5t5fOqRFk99kw/7SVYcLbKKi4RXpYyJo2hW3KeHYc/2+QMpQg3gomG?=
 =?us-ascii?Q?L9UoFqFgRIRSgcFXh7F/Z6qExhIUWjtg5NmBiviKDNQRmVl0SdVslfpbZ9CI?=
 =?us-ascii?Q?autgYXvh0/c4Ra0eZOvBVZSmUO8M3vtiWUkpT2lSoupdQZwk8gvE2mqc3s1r?=
 =?us-ascii?Q?wNbOFCocRods+giFjGD3u7LRHuMn6ojAotFYl43vbKmSMsjOcSDBZ11WviDG?=
 =?us-ascii?Q?GuMU3wdDQB/S9eEDMMTIurnNij9ZfPmulvXSst7M+fwKhNwV1rFXalfQXoJA?=
 =?us-ascii?Q?1KFBZoJrtdUA/Uu/yPNABUG7iaDQflES27FlDgmqjubgRN3nWQFNbPiyVzR5?=
 =?us-ascii?Q?pTaG3Hx107wypZW9SZzvgARPxBzLK3xFdAmUFXi3LwZMQHMRKcV9/Dm7jfS4?=
 =?us-ascii?Q?vEVaid9tBYGhv332VQWrP2q9pBKVV61ypJ59hj/q+KzRizX2m57/xp1vr+tr?=
 =?us-ascii?Q?Hj7wivAPcS+peHvCnYeiBjHp9M7lS+/SvNVZA0mv37n23Cfa7unUA6FhJfjD?=
 =?us-ascii?Q?AfFKqm/0MNAXRZxTHiVjTokFh2WHgR5qh0FlOsdDEnDLp/e1NCFXjdKHGjBv?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 274a9f33-2aab-43b3-5c7e-08dd6bd10385
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 19:12:41.0272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YJASVnFhOUJFRCkQo7LCur8qpn1tsW6DHaCBuTKuC5QGPBoi1O3s+5GkAk38m0mSIzVYZteRGTdPFoN6UEKMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7746
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

On Wed, Mar 19, 2025 at 05:43:49PM +0530, Tejas Upadhyay wrote:
> Currently, xe_hw_engine_sysfs_kobj_type is defining sysfs_ops
> on wrong directory. Sysfs_ops needs to be defined on immediate
> parent directory to be able to called on each attribute set/get.

Please bare with me, but I'm having a hard time to follow this
reasoning and the patch, why, and everything else going on here...

> 
> Fixes: 3f0e14651ab0 ("drm/xe: Runtime PM wake on every sysfs call")

Why this patch is claiming to fix this? Please note that this mentioned
patch just replace the default kobj_sysfs_ops per the new introduced
xe_hw_engine_class_sysfs_ops. They are basically identical functions.
The only difference is that the new one call our runtime pm wrappers
around the calls that we need.

It never touched anything that this patch is touching below.

Perhaps if we also need on the sysfs on upper directory, perhaps
we need to also replace the default sysfs_ops on other places like
in the upper directory?

> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 67 +++++++++----------
>  1 file changed, 33 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index b53e8d2accdb..25592f178482 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -492,39 +492,6 @@ static const struct attribute * const files[] = {
>  	NULL
>  };
>  
> -static void kobj_xe_hw_engine_class_fini(void *arg)
> -{
> -	struct kobject *kobj = arg;
> -
> -	sysfs_remove_files(kobj, files);
> -	kobject_put(kobj);
> -}
> -
> -static struct kobj_eclass *
> -kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char *name)
> -{
> -	struct kobj_eclass *keclass;
> -	int err = 0;
> -
> -	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
> -	if (!keclass)
> -		return NULL;
> -
> -	kobject_init(&keclass->base, &kobj_xe_hw_engine_type);
> -	if (kobject_add(&keclass->base, parent, "%s", name)) {
> -		kobject_put(&keclass->base);
> -		return NULL;
> -	}
> -	keclass->xe = xe;
> -
> -	err = devm_add_action_or_reset(xe->drm.dev, kobj_xe_hw_engine_class_fini,
> -				       &keclass->base);
> -	if (err)
> -		return NULL;
> -
> -	return keclass;
> -}
> -
>  static void hw_engine_class_defaults_fini(void *arg)
>  {
>  	struct kobject *kobj = arg;
> @@ -611,6 +578,38 @@ static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
>  	.sysfs_ops = &xe_hw_engine_class_sysfs_ops,
>  };
>  
> +static void kobj_xe_hw_engine_class_fini(void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_files(kobj, files);
> +	kobject_put(kobj);
> +}
> +
> +static struct kobj_eclass *
> +kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char *name)
> +{
> +	struct kobj_eclass *keclass;
> +	int err = 0;
> +
> +	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
> +	if (!keclass)
> +		return NULL;
> +
> +	kobject_init(&keclass->base, &xe_hw_engine_sysfs_kobj_type);
> +	if (kobject_add(&keclass->base, parent, "%s", name)) {
> +		kobject_put(&keclass->base);
> +		return NULL;
> +	}
> +	keclass->xe = xe;
> +
> +	err = devm_add_action_or_reset(xe->drm.dev, kobj_xe_hw_engine_class_fini,
> +				       &keclass->base);
> +	if (err)
> +		return NULL;
> +
> +	return keclass;
> +}

I couldn't spot any difference from the both chunks above. So this patch is more
moving things around than doing any change right? perhaps a different patch or
a mention on the commit message itself?

>  static void hw_engine_class_sysfs_fini(void *arg)
>  {
>  	struct kobject *kobj = arg;
> @@ -640,7 +639,7 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
>  	if (!kobj)
>  		return -ENOMEM;
>  
> -	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
> +	kobject_init(kobj, &kobj_xe_hw_engine_type);

now it looks like this is the only real chunk of this patch, last touched
when you added it:
038ff941afe2 ("drm/xe: Add sysfs entries for engines under its GT")

And now, after this patch, who is now using xe_hw_engine_sysfs_kobj_type?

Looking further to both types, perhaps we need to kill the
kobj_xe_hw_engine_type itself in favor of the xe_ one?

Or perhaps we need something like this:

 static const struct kobj_type kobj_xe_hw_engine_type = {
        .release = kobj_xe_hw_engine_release,
-       .sysfs_ops = &kobj_sysfs_ops
+       .sysfs_ops = &xe_hw_engine_class_sysfs_ops,
 };

>  
>  	err = kobject_add(kobj, gt->sysfs, "engines");
>  	if (err)
> -- 
> 2.34.1
> 
