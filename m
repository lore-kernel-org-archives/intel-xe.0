Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F77C369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 04:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC6910EA1C;
	Thu, 17 Apr 2025 04:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9PVrG7D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1EB10EA1C
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 04:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744865698; x=1776401698;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BZJgAvYxBhvodeRFHWyssnWzlad9VHQ0Uh/srUUEtIc=;
 b=b9PVrG7DLH/Lg/QqFoz1I2hmCZxN89k71B8AKalsvTdJGxzJtMuw98ZW
 6C978Wbdstd+/jAuP1vxw6MMmMeUytau8J+eYBroVlXAVJkvN9VHC/aU9
 QuXbuiBwybQ1vGP4QRVJyJnc9hVZuurbcMCTYtwq9yexmmpdoELRZZ31u
 VUTO7eBTD6qrpN9LZZm+kMwBKeIk4kQPSyjgo915vjxSpxNZtqagA0sqq
 ioBuuMv+zJYcTYe4aQnoMOQ1d2W/aqVlcopsnLefAaU1MCSR3ur9EyAnR
 VX8qV00bsfd5WCiLIUHzbbslhqkK1jIZoDkMklTEunAtT4cQhPVfFeG25 Q==;
X-CSE-ConnectionGUID: U+w/e4X+SX+G44Nbiy+3SQ==
X-CSE-MsgGUID: sTN/jsPfS4GUS3DQypMTsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46567632"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46567632"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 21:54:57 -0700
X-CSE-ConnectionGUID: tFVRtlBISNCzPU2FdEZVUA==
X-CSE-MsgGUID: YCtWRICqQDqHD419XCsGcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="135545003"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 21:54:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 21:54:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 21:54:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 21:54:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqipJAa1ucozgO+0kyW2BlMLWt1NCvPNZ+dYHrBcgsYe9sXedkk3UH8U0o0dQ024ugb6I3pMnhcP7GlOk215jdXmdZqhg4Rz98KIVPRQUL8EU9AhLY4WVMmwMbOktzpn4cKuuQV7/nIuCP8N6PmAooYBaJUONXgu8sO6qWxraM/caOqgdSOGFn6ZsMfMSyvEMti3/9IN18PQgZd7G4a1PYJpgWCnVFaiwrleIhWk/z/ZzEY6sdC4ssc1lTG9jKUII/7vmUTt9tScuAYbbtUDktI3P7jXPyjkwY2MYPnntJxDqBi/uVifCfeGIFC/VscdYrvsHs+aFfOPhkqZc+rW+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrBckxemWLk+qqwUr8KmLz0196QKDRq5EYQlOXmtF3I=;
 b=B7WI1gI9oEgN2aOR6/eQ0RiFjSUwYoc9SDOWMVTsP1N/X9/mhHLI6HlEp3RDeB1mQAgK1sFG+y1HjKe+5MbH991Qzj2NUvL2fwS4dnY5UwDHVLwsZk0cAnY3qMLEdvAjvnNCz6B+U5gPPaZdlBsQw1KliXzKGqc8x+KDNPX+SSHfkLGQk4TJJhzZN3i5lqBavDsjdQcYlW9671cF0U/tkMW0d+H7xgQDiG1SlIq8EHhy/rQkYNmVfHRdgsNQCqTisAxw/LEM0Ndl7xivIZLv/E8XXoQaAA/VkpQb0ZYuEDOC4DGKZhnVuA0kR2vKOls/OxUWql9j+1PWWvcmbBY1AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9086.namprd11.prod.outlook.com (2603:10b6:208:57b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.38; Thu, 17 Apr
 2025 04:54:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Thu, 17 Apr 2025
 04:54:41 +0000
Date: Wed, 16 Apr 2025 21:56:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 15/32] drm/xe/vm: Add debug prints for SVM range
 prefetch
Message-ID: <aACJ4D5vxy+UxoAR@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-16-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-16-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:303:8c::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: b42ba70b-8351-44fd-38dc-08dd7d6bf6d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ICSsLh/ucjuq90XvXQ1a7v9mHxblMV0t9O8A1wPza0pnikK/J9sx/G+ZaFf6?=
 =?us-ascii?Q?7PArpN6RLyhxyGg5rgVk1SgV7CKB1rEBgElvBLWLgeNCgZNRtyyguRa41faC?=
 =?us-ascii?Q?nWCzizdTMBWrczzM0wWl3nmGtLv3BWcOX2MnYMTRI/6o6VNWWNhKOMI9PCVm?=
 =?us-ascii?Q?p8vcBN4z7H6rRIafpYYuIKk5zHdpUMlzGYwCcWqu7AQhmhZpZD7xxcc76t2e?=
 =?us-ascii?Q?n9BmVUi1pBVG2Pt6PsE0LpWpLS/TCZZJpDFu/bADDOWkzDpik2DnVTd0eqKf?=
 =?us-ascii?Q?Pc4NEBy7+8ILmta8Esl3Uwg0KaqdXBX00BdK2LtbabCm6+4PEEelvjmFeU3q?=
 =?us-ascii?Q?LArVfO8AetD7/uA7iK+abU6JPN9Yj241P3qXvTQ5LC4xeOjiIvEOTHJfJWqO?=
 =?us-ascii?Q?Ct79wTgknvpoRQQW6aVFUsy3jy3D0+v92zfH0HdfmB5kPsw/0fgsVeRihyUd?=
 =?us-ascii?Q?2xOPiMbKDlBwPXbKmVHodNyip211HrNxJkrKAoCPuM+8wTiY+on5+8b2YpWR?=
 =?us-ascii?Q?xomI+bSUuvcbwgeJEZwcuwAcZxKVStRGN7vCbGtifYQbCWaxZ4WKBzARWjre?=
 =?us-ascii?Q?VPJ1YDMyJXLV+i7Qebb11YZsas4i8hRR8QTvtFiBx7XEFyoMYh7uUoSW2SR6?=
 =?us-ascii?Q?ooAdrP0ZX9VyYd61OCCoMnwHycFLf7frR4p6CZG1aYUGSDckVmK1sAUp9GQ8?=
 =?us-ascii?Q?3O0WK52m45UOjHAxI4H2xrf8Vh7sEf16nD6aHGh860frZ0fV9tliS8pY6gFc?=
 =?us-ascii?Q?31eYI0DqI8EmUJJleU6Cwk0f2/dJRGwMhWShQJWNSx1nuUkPD8jzqF0ZXsjA?=
 =?us-ascii?Q?bwU84YTdzDfAApRRC/9228jxQlOt4PTNkPXF+UoJALZsJJP0Duo9B9xr0Z5P?=
 =?us-ascii?Q?el/cA6FuB4zguPun7zW6KA41TuFHG6Ug4r8Z8p4uqRcs/zg0tMD5eSFVhEWw?=
 =?us-ascii?Q?GbQUfDJabWylYw/1n+WonVhLsQWioFMnxH/t6TPUwG2mAnpJGbpnEI0LgTLj?=
 =?us-ascii?Q?IYHOfrG336ljLIEF6j5C3JvaG3lL9gcFCz4w/HjUlAX33Sev6B4lgwFEvlma?=
 =?us-ascii?Q?mSHyr0HQ8N3mqFQvBRd+KSJ+1g+bq/RilmALwFiOHUuqkpkc4j/FnIiySzDT?=
 =?us-ascii?Q?iGnwrZrIs6MX6kkbmtJKe1haCMUTlGNkp8r60krQXufoYMu3hvvkNY6l7ahB?=
 =?us-ascii?Q?YyUi0coDNvdI1Cji40t7WwBbA0xd6nDKW0gGt0ggN0cx2SYKFqiZYzod8Bey?=
 =?us-ascii?Q?fuwF+XeveYO3UzVXRTr4aDOb5xhI76tSIrNXbCzIFcj2frhjWVNVwjmb9a5O?=
 =?us-ascii?Q?joQYMa3TS/NU2x3g9Cg1VkyRZdCLRw5DS4Pl4W6q8RseEGZxQyZODeTMlHys?=
 =?us-ascii?Q?ize2xsUsP7sH04T60A6MRi2y4egh5E/eWM+ck9Qk0OlbDKhxcGHZCTHImUcd?=
 =?us-ascii?Q?fPIQ4Jtnhp0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5qOiDSFbgMWc4lbkwNaZNM/9SPPC7J/3gK4uA0J/IqNb2QaLN+fKpg0u63kz?=
 =?us-ascii?Q?MjDxXdCxyQVDzfK1Y0wLnXdAH/tgfRaTPUYVt384CGR4Z+fbk8Exj3LSGQpf?=
 =?us-ascii?Q?RA6542Bh3yShz+BgeGO990OYz4WEkB7LvQCon/0XiwCJxCU6IQEnOv11N2nd?=
 =?us-ascii?Q?foP9dRQj/ZNkeEr3bUpf3j7IPFS/Q7ijjETCOxxlxJ8UjdIiji9GKQvLYlbc?=
 =?us-ascii?Q?YzNhtA9a2lKzCyfEiZxzA/ZNEr1q8+px4sbLMweb4Jkzpf9tDK8F6Q07aLPN?=
 =?us-ascii?Q?+fBHaR9pfkvVkblxDAn9XA8g/36DjU8uxActYUePULjUo/XdXORkQ3VkwS0j?=
 =?us-ascii?Q?GkuljVcGx3ks1MzVLTMb3RyGZ5s2Sp/iT4O10TaYwQgtgxiVyMyq/Tu6Xt2v?=
 =?us-ascii?Q?Xfym74X1g/N8ZqMQGuNBa9RvS8R3QErO7wpc6meuBhpPdJqeQop4NpIY0N0B?=
 =?us-ascii?Q?8IleAYTYMLjsMQ35Vz/aHXQ3mF8q+gs2MYFjqXX/0z4hdtvGWShxoROquGQf?=
 =?us-ascii?Q?wP2iUV1PRfOqU7ZzDj+D95F0m9VGEDB7qlbkSWtMbocB2yfDEmiLzGBBK0S4?=
 =?us-ascii?Q?mKHM+BLLNZ7CTZrG01n6tVVpBPSmUMFpoj/qwSav4VmOqX8b5QbmOZMyPzpE?=
 =?us-ascii?Q?ye5PycRUraefll3J8IMhnw0ggReAw7gOt+/A64EyIay8N0vjwnZ8qaTnrCWA?=
 =?us-ascii?Q?sm3hjn6Mq5dUhEpw4XHp4os0di1JwdCjDP/6KlPgFB8Y+DfMqb11dQHTckGy?=
 =?us-ascii?Q?N5cJo7Tv8ZyXyrZknq8rTbR4PCfAjC7Wybpl3q6UUm5opDpAaH2WDUwuYLLC?=
 =?us-ascii?Q?6VRR+mcLUqeQGo9+pCFGpZK/pOVRMrsYiezewurH6/2Bw7aj3W/laUVhfLDg?=
 =?us-ascii?Q?xaA3dj7etdZlg5fNifRbEaX5BEPmzVGgsy/M3HGAWloczQpQjI6uiV6KJT4W?=
 =?us-ascii?Q?tHNKCGPaJM37XY7BaB1AfYBViR1NePEKakF3+B4Je1+t91rQGD2aFq1fqWHd?=
 =?us-ascii?Q?h11vVUUnfIWnCoy+Ea95UILmkM92+qm8Be7IiqyLNWsNsITZOXEwVb32auB7?=
 =?us-ascii?Q?Ml7gtFjgYMIPkQpv3hj3IfDvB1hyIh8J/cfYv/rkZhww+cPz7hTHxXjBbyoK?=
 =?us-ascii?Q?/N8fNK9zAo5/pzQdLVcYlsAN+42/X17iQgzs8Hi7xHN4hS+E/kOQ8PwcMWJ/?=
 =?us-ascii?Q?ewrJWRe6l4BCz85BmzMcYBzbuz5zTCL/6BlcdWcEr2VwfqRmcNNZbCWIDq/b?=
 =?us-ascii?Q?OOmp979RxEkb4q7D5QPu39+yJ5tCBGqiUpc/DkPu43l0HRHRdaQqdlx7kH3l?=
 =?us-ascii?Q?F26gtFbO41PK4ZekE+nC1Z1nt1PTXXK+nocIWvzx2DLJ1OAm9zFWvCyWDYEb?=
 =?us-ascii?Q?J2Gac34zX1NGgN1G68XR3kH0KrO1nSpSvAGNcalsUTLeQZTQJ4TiXcfS2M4p?=
 =?us-ascii?Q?67p1LspuIJ8yDFDSjsHeIoerhtY0osdj4oH+8eJvmw9JSM2tEcj2YSeEi2eo?=
 =?us-ascii?Q?FOREVM5nt+x5t2ZK4x0a5cXFq5CWcWvvxUCEYRmzsMA2TGfVWqEJ5CGWN2Xm?=
 =?us-ascii?Q?Kcpv9xhBqy+SmAtDjyuWhKkkLIeOQCBUIGWfyxt8/e48yYGryL+qQkZTSUqV?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b42ba70b-8351-44fd-38dc-08dd7d6bf6d6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 04:54:41.3727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PaMy3CkhvjnAC/RGaWBE5DjBM/qbFXSvN74j1jJWfMLkzAXAxDfr4ViLheqeavBP5xH2CgxavY2T2Ov0qH5Ifw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9086
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

On Mon, Apr 07, 2025 at 03:47:02PM +0530, Himal Prasad Ghimiray wrote:
> Introduce debug logs for the prefetch operation of SVM ranges.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ffd7ad664921..fd98e74485f4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2398,6 +2398,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  			xa_store(&op->prefetch_range.range, i, svm_range, GFP_KERNEL);
>  			op->prefetch_range.ranges_count++;
>  			vops->flags |= XE_VMA_OPS_HAS_SVM_PREFETCH;
> +			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
>  
>  			if (range_end > xe_svm_range_end(svm_range) &&
>  			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
> @@ -2898,6 +2899,7 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
>  						vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>  					return -ENODATA;
>  				}
> +				xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
>  			}
>  
>  			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> @@ -2909,6 +2911,7 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
>  					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>  				return err;
>  			}
> +			xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
>  		}
>  	}
>  	return err;
> -- 
> 2.34.1
> 
