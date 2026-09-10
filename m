Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BA6C79FB7
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 05:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5081010E8C2;
	Thu, 10 Sep 2026 05:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loQdtyCQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DB710EB24
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 05:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789016451; x=1820552451;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W5JYvqptXLFL6JlB8Kd1jPm16XY3Wh3VVVjzEU0y37U=;
 b=loQdtyCQhIzDCY0EqDiTNVPItKupo5JDQ2yb+RLlxc+nEfDCQNyGSW8k
 6bG5061/QdMxrBrdCNXArTDNzGjdKDeRoC/ht9DpyLLjE48kfRKEZckjI
 TEt2Npik31QQycl+saz9fk+aJ4Bpq62queo2Tv4lq9h0MQMw7b3PPDFY5
 rDWBwC6Lznnvb+vheSRTl8l9o/UxJqIpIUZCsUwDi6Iff1KVVzcHAjdlf
 tW7TWQPU1Wdpef1Vjxjbg0n/4r+n1XXCzcQ3hGcpKgcMuyKvBtdct+Zpd
 v0I9w8PGW8i++l4NR+a4/V8fs2LYshWR8UE0mMW82y+//m+ARMAhjLQKX A==;
X-CSE-ConnectionGUID: Bra89zE/TFm6UJ4xOI3HlQ==
X-CSE-MsgGUID: xANr1CObQ6CsgBENDceuNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89329670"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="89329670"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 22:00:51 -0700
X-CSE-ConnectionGUID: ZKrEflS7R12c+oKe6MDr/Q==
X-CSE-MsgGUID: mGNnpF+vSkWHauxuBut3kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="272016739"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 22:00:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 22:00:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 22:00:50 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.57)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 22:00:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOcSUa1x5D6H4KZnqwEqsBgqhCwaV/BUfTwXkJVMck9LJA/2lVUKvs8q+KSGvxtpImlHdU80ZXkPAuD/b836uwjIX6e0wnrQ1kQzKvB4x2ZmMqMGlOx0yMXTfqoRjRaE+iVRZxUk03aIl7J9CC6Pd9BohIXjEsA07iW6WWCZrkljcwaMRbhbCYWen42+o8Q4X8n76vjZHO3KKXgBi+qzFprGSic7yrAB96fU3ovEg22wWnkUKA57pI/5ww7A1pJQDfrTM33TMxVAfNTZbcNV+rzFNR9bVup9UhGkyykBhJvlo59e5g/Y2+Lutg7Bl3Te9qxnwKJGJAg5O3+p0mXVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JmTgwXNfd/bhvXh6dHvm0lKos/Je1s3f2M3SPFfpXY=;
 b=j+idPx/iMKbjprpeNq/9zVEi8JVQEGFjFcuCoxHqXnhCBInArRRj9cH1Q47IscOK86L65JnSrdndBpoCh/zXumqRJXJbPCTyPITSavnIm1eBXHcobjWBV7zAR46okzfUNHzK9EvVJV3nAgKEN6ZhAo4KnfAAn1PGz+zYWR+XhtSABXwffAcTeegBjWWg59Z2YF+GED7nWYXWTS/WLgf8x7/FgJdFR9hKU4GmiULnRSqXnQjvdJgX4CNseBTmfOkejgcK3Quo0erjfoY7oMPF9BX5v1Ku8v+EqxZPYKUbrZmXg6TrKS7UnKdImT8nzJkCtokfKruyhy8VhfCiKDTlnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DM3PPF607052E81.namprd11.prod.outlook.com (2603:10b6:f:fc00::f26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 05:00:45 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%3]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 05:00:44 +0000
Date: Wed, 9 Sep 2026 22:00:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [V4] drm/xe: Skip clearing purged page-table BOs
Message-ID: <aqI5ei8nKmWfjTCb@gsse-cloud1.jf.intel.com>
References: <20260909111620.1276402-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260909111620.1276402-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DM3PPF607052E81:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6a5181-9eb8-4e35-fc59-08df0ef87894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CMZ/qWXrURpflH2y3vT1RLdmoQrZVUvroDzaSchlbzjMRZmsDn+RylfWo1nvH4dpwnjrylFZ4QafaRp9SxtgLAgOVrbdtxD/FjbSmn+j+UlWwRQJqP7ezu1H04cT3ult2qr4ZvBiagn+/nd/+j+AKv5uXzuUsQuCDbpBbIEId8Dig9lpWCdO4e2ahmE6wHi9w2nroj7ppU1YTycv779jKoTZaJ4DuhaIusQ6JBXLybWkgpX3xV9ollkL5g0Lmd5FLK0Nq6t2jIkwAcsnTJJPSpB60d3/eVof8FPaOTpMiA+EMGZA5ZpOsXJrSS9jUONRLGEseBJ36n1SmPM7+8d46f0OZ/3E3n6CLnAaA+ou7M0wQdMjg1L7Zrh4J4lLO3Q+yw89E+2La66GBWhM246trDFJaBstvHeS+7yhObLUBZyH3ZH1wBeEPtlZNELKJA+nOdGb3iuY/FxfItCUBgxSrrFB9H0n3QRzkEuS2Uhw03DE1LOH2btNzIH072s/6u6jeIeD7c0qzi1ehJ1mhnoAlanmjnKZZRq399PJ3CmHAciePzlHGU68Q714jrCXEtNgFYoiQZhOBHkhvEvCIrgHR1fnX8AfFdfe6+o6myzCRRTEWmJBZBeTk4+/o6TXDYIHy1bRs843tTTnli/CqVHSn7eCzxi91BRIwrg7xyU+Q70=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GQuVIhLXAfGMoFcCAjRJ5uknoaz3ZcJ6dRbciygRZbo0vAV/PkS425BcTQNs?=
 =?us-ascii?Q?Mi9JsZCKqIH1exIW0wibcG2mYGskIgs4QD5Z1vwDmCA714my6USvL6MA/XC3?=
 =?us-ascii?Q?q16dbyjJXAboXcTPXc5VljpH8uYwFO5Y54HIwpq4WHbJMApOkAM1cJjVfMuP?=
 =?us-ascii?Q?hXtpOW8wCEhlivmbX0dbI84pwTPGeUex33GYnw0N1u2MTRNaDh9haxbKxiLN?=
 =?us-ascii?Q?4B5fjLGrNW0UBxOjn50g1r9Tg+95FmCltga2VKjh8NAjvETAsZMe3Xtpohyw?=
 =?us-ascii?Q?dyrQLby4in0eUYFOucpc/axy7xy6noRwzsWxAUsQmaWawu+oHrpephE7ScA3?=
 =?us-ascii?Q?n7xXT5EdYE8twpehYfQupEUpBMvLdb9D/S7nG22SxGeq+KMg2d5r9XJmttMK?=
 =?us-ascii?Q?fiDB/fhF9e0immNabCTS+WypM3+Iw1l4v3DuTRP0pbQgxdFpVqoB+/uxOAX/?=
 =?us-ascii?Q?lmIcybZvppJU0aB1SgRpH1Oai1jukM4UMLfWzQj3LXOVq/5vT7M7rK/LSA4o?=
 =?us-ascii?Q?22MDmbxny1szrH9PSP8pos2RdQvDsYo1rxk1RvsaBY2ock/5GGRJe9hqzvr8?=
 =?us-ascii?Q?bPC0M0hg8RLNQ9LGQl7oTAjpSrG9SyTQRc9ZM60b/Rf/ZmJbLy7Tz780oHCT?=
 =?us-ascii?Q?sWZJIEPXam+/fdX+NbB0KyL9O5QoBiXYieRRYY7Fj9zRzQMhg8Dx4fSm1dBw?=
 =?us-ascii?Q?n5m1x9AnYN4vuy6elJy5ePrkwiXxUfmRmBt8YV/lGAj80jFR4GO6n4ijcSwv?=
 =?us-ascii?Q?Pg+qrGYUrBTGI7+CrSkSG1mPNK+socO9Szf8fDCsUSgNpH/Y6I2bR53jIXNF?=
 =?us-ascii?Q?YZLp8ZRTkYjfLAnWFz6tEKYRYs4geHZls7GQZn8YCSXPOW9oEi1IVXe7c/y3?=
 =?us-ascii?Q?TmVJMwCYhqxL/bz6ESsJMee0jYgNyrwYU6ApMcMHNIpYPdJAR87xqNCuubdS?=
 =?us-ascii?Q?gn0RjNJHiG6pExNUiS+DNwUZk28TUsYDe/cbZwfF0BZtCnXwIf8QOhIHwk3b?=
 =?us-ascii?Q?hAqCzpDQpbDtgxAF5xnpBvbGkdF87QO9P8gFANZGsUmytiuI21QS+/QBZGJP?=
 =?us-ascii?Q?OXTJH7pNm+Q+yKHjzn6m5davXxsvkDyD2TTXlyDtFafTIHeTkXnZ4uA6bgMz?=
 =?us-ascii?Q?lHS01ZRYRxbHM0NiQdR+2own3bfi+t9WFWKrmi/q1dj2AD2ry6M4g2qDL1Xw?=
 =?us-ascii?Q?LrGWI60ldCLAURq+rJbEksxuMrIoS5XaoVG1KWIEo7iOpN7lc9kIfKK7EAUc?=
 =?us-ascii?Q?TmButjpDbeTZE9EeKEo5S80+P4VyZmRNs0IZ1DDjR+RpgSuMuGbH0dD1P9/L?=
 =?us-ascii?Q?Gz8kuiumajIhxRUTGIeRag5052MchQ5CnnbgSg/frf3UGH174RMFb8mH39dd?=
 =?us-ascii?Q?wWhJoAWJLJStvSTr3ezDV02DDjbD80I5nrNEOZAuNg7NNrLGc5hriuSn/9CZ?=
 =?us-ascii?Q?n2dSqhB33twq2v/8ShW7ZTajEh9ss+GM3zjr0cTOdSuRGYDiLUY89QEsdyU7?=
 =?us-ascii?Q?6O9O+q7kcYMOAaWS1bcQ9zdteKEWTLAgbk70gWYQjs4RkqKd2+di9Z+zORn4?=
 =?us-ascii?Q?eauooM0Mb07fHZseQm3L6v/r/9i+IttcmYY4q62ctth8o9p2O88pdxIAAoRw?=
 =?us-ascii?Q?QDA5QUCvCO/5rDaioEj4i34YqwN/Dn6IHm+xS05dLSOwnuFos+YYc7pKit9k?=
 =?us-ascii?Q?07o20yveZELec3++0Qh8PLu0d+TsJOgUmsXgGT2TcblwfPJNoAVLDvwAxneE?=
 =?us-ascii?Q?CHM4UelwJ9rzghbFLAI1SUzzBLLTHLU=3D?=
X-Exchange-RoutingPolicyChecked: DPJB7izXGO5okWlN+KurrD08eT8f9cHq/CQM/iTiPRTi9gvMrjzkqWOlImeuRaVQoBGXRmQxbLPRahYKUeKWyT6cM23rkVa4G8z2+rh3LCN69amXLRlTyHiMpvKGIXgp3okLPSA+MWTbcMTFe3AaWAYLfOu/BQUsB+g3gFaQhyCKFqp4dAQuNx29DFZACcXwj7fxAUofhfkSYUwEllRVlJGyTL6CQjQ+29h/dgvT8Z/clzZrP3/1kXZKyr9JxWEVnBrZWmTYdDFxmYErPn3/ZhywknpE6QCM5/kVUWvnNbH8j9dgnBtYxds+lvVMVOwFrEcfFvveDdG2nsoC6P1IHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6a5181-9eb8-4e35-fc59-08df0ef87894
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:00:44.9328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXynDNkdw3SwG1tstY47BtGnO/sXxCSksAkbTDTskSTa+ZVulucy+cooxJRIj/kzuw9UhYx0tsrK7jCGh3BgKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF607052E81
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

On Wed, Sep 09, 2026 at 04:46:21PM +0530, Tejas Upadhyay wrote:
> VRAM page offlining can clear a page-table BO's vmap before VM teardown
> calls xe_pt_clear(). Check for a purged BO under its dma-resv lock before
> writing to the mapping.
> 
> v4(Sashiko):
> - dont leave svm notifier lock early
> v3(Sashiko):
> - Validate NULL vmap
> v2(Sashiko):
> - Fix lock ordering
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pt.c | 6 ++++--
>  drivers/gpu/drm/xe/xe_vm.c | 4 ++++
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 7fb2fe1f826c..4b351dbf6572 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -236,9 +236,11 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
>   */
>  void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
>  {
> -	struct iosys_map *map = &pt->bo->vmap;
> +	struct xe_bo *bo = pt->bo;
>  
> -	xe_map_memset(xe, map, 0, 0, SZ_4K);
> +	xe_bo_assert_held(bo);
> +	if (!iosys_map_is_null(&bo->vmap))
> +		xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9e71567b27cc..efa5ff6cc823 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1876,6 +1876,8 @@ static void xe_vm_close(struct xe_vm *vm)
>  	bound = drm_dev_enter(&xe->drm, &idx);
>  
>  	down_write(&vm->lock);
> +	xe_vm_lock(vm, false);
> +
>  	if (xe_vm_in_fault_mode(vm))
>  		xe_svm_notifier_lock(vm);
>  
> @@ -1903,6 +1905,8 @@ static void xe_vm_close(struct xe_vm *vm)
>  
>  	if (xe_vm_in_fault_mode(vm))
>  		xe_svm_notifier_unlock(vm);
> +
> +	xe_vm_unlock(vm);
>  	up_write(&vm->lock);
>  
>  	if (bound)
> -- 
> 2.52.0
> 
