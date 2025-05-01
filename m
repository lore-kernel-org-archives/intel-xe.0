Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64521C3ABA3
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 19:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2359D10E296;
	Thu,  1 May 2025 19:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdJzqz3F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BD810E296
 for <intel-xe@lists.freedesktop.org>; Thu,  1 May 2025 19:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746129570; x=1777665570;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2POvYlE6mLAfNw8fgp8EDYsQrfjH/hBDY7YqYutJELM=;
 b=mdJzqz3F5x3NsqpJSTBRED9PFqRaZVzEl+VpvGAZ+VjMrNZi9SAWeAJ1
 mNgg5Q6j1jI+oxSEhjIcfAct6krPgvS35AJnEjjkECCfX/rDyi72drGCJ
 CglnYqb+Mvr+a9L0n5BlC+NtqS1K+0Ohi77pzFkmbY9tQYHkFgq4xRLSd
 rlwyVaX+fryyifzgNa72NmOVJsLneNSZlXFSo5KRmg4bB+aJxYsdeWwm4
 DQkOJm2wIUCWXNvcW6fO8faoixa7dZMj3/FM5TsKP5/0xrQbSsqhieLWk
 pKzhRBUWlubPfIQm08zCKf2PkMS8SlEozKW4qTHn7MPFqwREFAoopj9z2 w==;
X-CSE-ConnectionGUID: njn6XFpjTY+C1E8Vj1IICQ==
X-CSE-MsgGUID: OF7MFjl7S9SWwinmLS7LqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47953430"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="47953430"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 12:59:29 -0700
X-CSE-ConnectionGUID: iLTBn0vxQLGuVeKEnlaDYg==
X-CSE-MsgGUID: dg56rqqtQn+mgTRoTG+FIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="171713782"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 12:59:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 12:59:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 12:59:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 12:59:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u67Jt8UhG17yk3aBL0Dm9Pq5L+RLsDnGkJYEZVm+0c4rSEPrfNmXQTXeo5dcsDd5SOVMCK+dP7ufark/xSYaMRXi1yoORHB60LED0q9WS29U3fSmg9BOY3UBy8SSpakduMD38CJhdXbhFmJCLzvJAPCmzRst0/B/FoUN4QdtUTYZmRrW9i5WWS+0B6KKANyJuKuIjy894XbpVLbm4m41bSFgh/BK9lsgiW3P/Zq2P/J7QhP+kKrSFChDKRGRm3+VRIe6jW93caVsRCC77do1UBMCfi9ODchoPBDZLj2OuKA0K9zTvhJ1ghvrjlBkCfhdzzZUQ3lJdkvwc7bsluqzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cn/nIudtgatq2J+H3rgdTUhqbSghw2QkkRon+Wddqug=;
 b=N7nCcKrKQRzUPAWFJtQ9zDX93VXfWyOt7fp6QuZFdhMYhQsnLZe9IpY7BfhBRzAhAQqt65wj4LUaMx0vqYGo7DOW7rjr0zMrf0qL9h9OvZQqGs5TcE48Llh5icsr4pAWPTPsYMbEZLWRlVIR5GzOPd2Ek2zSt9x8er9Y41OPRwiTUh8NOfVkEwJlPiY0kF+BVs5B7bGdbBAoNDQbYV3qD9va3ccOIJYt1MksTAGWKDi0HkOv1P5ffLS8oFV26NDcKecGBLAzkGOSe4gPfY9OBnUuw8Qh/3DbLYoDq/gDBIqUtFQEEFGPXrwKYxd9YaEUaeY6HzUPPB7Yxh/74gxVUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7789.namprd11.prod.outlook.com (2603:10b6:208:400::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 1 May
 2025 19:58:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 19:58:36 +0000
Date: Thu, 1 May 2025 13:00:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Use copy_from_user() instead of
 __copy_from_user()
Message-ID: <aBPSwAbMSMOTTOIa@lstrano-desk.jf.intel.com>
References: <acabf20aa8621c7bc8de09b1bffb8d14b5376484.1746126614.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <acabf20aa8621c7bc8de09b1bffb8d14b5376484.1746126614.git.harish.chegondi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: fb882dc1-d2ab-4113-1109-08dd88ea8f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lrsoTv5N3kdvTOr+FpxOQiGLRbKjp+qIjLpry+KqezHFOPxiiptgIPyTmli2?=
 =?us-ascii?Q?M+e+p/KDzHybVM9c+XHdl8hoPNbo4V0T5ZVSj5gdLd2ftG986qmdkhgzup0C?=
 =?us-ascii?Q?MzSIZZ33H2IetR/t2JdicFnRHg47XcUMaz7U7KUxqsSApBRMIR+PqBQNClKo?=
 =?us-ascii?Q?b64TjcH4fPyjSSPFg4ykX25vR+oRON5mmlDOXXJ1noxx5qX3ON6nObzRkzxW?=
 =?us-ascii?Q?6KgPRdHGnXpq6HLtfoxYZrdbi0DZG1wZGfYZ1lk0xPzfwyk6FYTcIe8DtJpH?=
 =?us-ascii?Q?9Prm3poJh5kGUbCARY0r9Ymbd5HlRcsqFsSGuD/4MBf+T33O4wGdqXLrGBYl?=
 =?us-ascii?Q?199EYyG8ECjE0Nz7AOCWtTkXC50u4ajrsJ5RTVa0ROvBEcR06K3sQszczhhS?=
 =?us-ascii?Q?y3UYRKJ6OI8Scd6ZhFlwx4I46xIunGV00kHhIyoRqETCTsq8rJS1f3rTggDZ?=
 =?us-ascii?Q?k0rWfNjAdnfQ/bsNmrQEYyysNYUHjVh92FkD8sP5JpqrDcGVh8BQ2oFy7SM+?=
 =?us-ascii?Q?hTAqqVTXeqz6BmhRIQUSCvlssFGMzC+3UiUxHnYdGK8nSOvNtQcTxTlQ/9Ia?=
 =?us-ascii?Q?BmYRIABwzd58oC39oUJDwvOee4tQfreAxCSNccl/W4jZewsGXwA8SCHXIRIV?=
 =?us-ascii?Q?CW4Asgl6l8R4k7JGk+yuy9WATdVJZ6gJ1E8ZslHF6VLCXYISmdhexEkAf1Ze?=
 =?us-ascii?Q?2Pfz2+DlwZ4LPtdYGvV65o9n7B5leffkP6GM57lQ+LKQONyeEJjvFOwytMmr?=
 =?us-ascii?Q?VvK6Llv8yRP68nKz1jSZ6j0n7uyvLFQLuQLzklRRWRBeium0nKf2Jxpgewvv?=
 =?us-ascii?Q?dDTDsbCf/3kpMOFM1LD4d9xZng8narLreyVCtQ5rMDEdax6wLaLyFu9Lb7CG?=
 =?us-ascii?Q?r2aWmCBAJFTC4UA7dOHJf7kaHZr5vPqgPvKhbIPbr6tB2aMFJNwD2wGVoMft?=
 =?us-ascii?Q?eUT71KYj6092qLT7AHpsFt5GSBwcTCpPV0e0ThHmp76xMEJDpqjCh85zK79r?=
 =?us-ascii?Q?z7gTMfJMounPL9pe/IVZp/5CodQPMJpHVXKi5pFVzWW42cYxNa2WcjB1XQN5?=
 =?us-ascii?Q?O4XBggxxNHwjAdEl0Yc5CV9szArJj+SU0KVnp6rcaI2M9sqwANbj4H43bRnY?=
 =?us-ascii?Q?1/YsylWMhNR3G27nfW40DXk0/13dZHtXrSSweL9LDGLOCgT92r9HXqxDeoH7?=
 =?us-ascii?Q?LwtqDhZFrB2LjyKO1Qt/lpe0/wThA8e8zpBDyUFwtamA+QthFTq8nx8A16Z6?=
 =?us-ascii?Q?4zxWKX2GDIKpHTvDyIIn4pBrzeFQZGaFZ4H6N2k6TharNW5odjvrrlcPlMdD?=
 =?us-ascii?Q?VnG94uqliZqR3ZfoWrO0pTKdClT+UFjrr8BgXPYAKdBCuKD2g0njZJ5fUETl?=
 =?us-ascii?Q?Z/RxXQrc6V+2zjPnuTcIvk9pI9FJHSqjoiHymhvNY9QErtGH/w2O37Z1xChx?=
 =?us-ascii?Q?DB/rYbQN1fs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RXNjFY9aMY19q1TqI8f3e9MtJMYMRd+3vIL0imunT5EyTpPsn6bmAnQ5LMce?=
 =?us-ascii?Q?HqRB2AacPpR73mehW7x7IxRrE1bZasCYNWxZ7RmRSTMoAde7Cxn1CkB/v9ts?=
 =?us-ascii?Q?GSq4HdG5E4YYpwe5DwL+QKz0jB4fs6AIXEIOddp+LLem14ud4+ASholOhFrZ?=
 =?us-ascii?Q?p4HXTkSnZZccGK842sg0rIG/vqsuG3VoZE5CHB0SeJ2Zi0wX0hXmPzUUcK9v?=
 =?us-ascii?Q?rowhHOb9iP6pA4VW3k07TQfXUVJYbLY7ULGyYZkY7ijwAgjwgbNlPfvHGvzC?=
 =?us-ascii?Q?A5myNSHZKfrxnTttqY6pASwHjJgSPQzVfuoMI8AB2qN7GWn6bDUzrQ/ab7Ja?=
 =?us-ascii?Q?+bO1MMXVcOO3vJF1eIPJep24pwyN7tTkJ2oQ9r9JJe7kGP2AZyGDz7rntCDe?=
 =?us-ascii?Q?BAjFDyQfD6dZ9phwmCf4qcQdBt9OaIiSCQxmcCHZnRmhcMcQEF+YRuMmc4CC?=
 =?us-ascii?Q?OFW20i3y6YKXNL6t3DXma6QI5DfsIilI1iMxxwUemGnFMsaFhWlEBly1iWr8?=
 =?us-ascii?Q?VilPtbsQKndEspwKL95eZUZmZjhrBzx4uxerMMyJjnPnyvLq8rpoTrLIWBKv?=
 =?us-ascii?Q?JnK68N/hoJqoQsOQE6vs7lYKuGqDDFZkJ9IVVLbl0NTRTPeKyF/yYxBe/Spb?=
 =?us-ascii?Q?5EWZPUgqpCCgPmKmFk1QLEU6Cmu3HS8vuqQCJorJbUV74ixFgxzOwzo0sdhN?=
 =?us-ascii?Q?2UeCnCSJi63amG04uSJEzZCHtujUBwWewTn8gnoF3kYLxsseOMhEjBK8ynQ9?=
 =?us-ascii?Q?AtFl6GtUAx4hbWMsaXzw5Icc6IpdTb+nFCC3SmWnE7GEbRgxXZIldxU+sJDa?=
 =?us-ascii?Q?b5bTEE7zPXDbI0N+cPoPcrRNvKUbR+tA/5sWAos9wVMJAsKxiYA8LXdZbgKA?=
 =?us-ascii?Q?tVTpFq3ULucmP3SD0iu9NHQtKY6shk2qcWh/8n7RF83XAcDwcszApMX4uZKV?=
 =?us-ascii?Q?h6zUHVtPLGS4Olt0dW/HGRuG1tcDi8UGcu1KRZUWh3SZJZpfVirNAGlSpkRN?=
 =?us-ascii?Q?cbj+CEnfjIr6Tdd7WR1FVk1nR5W3u9iPvh9ian0BenYsSVlOp7NLIjdQagUK?=
 =?us-ascii?Q?tDBraL42No5qRVIuttCvuSNK5hV13rRAso8VFumqyB37IGoyIoKdGa3eVZSw?=
 =?us-ascii?Q?vA1u22QNdCby2Ck+eljI2soSd02z6L77A7y0pHOrnQdNSRoxfUyuCC1rWMtI?=
 =?us-ascii?Q?1gy9LYiyJ5w8eWGVpDuM67z4gwEbvPekFAS3M0IUuUxHSFV9LGK5Z7ZqZqL0?=
 =?us-ascii?Q?3STQ6kGrDO25vtt31y2Kx4WT/ece+OU2LfKyNZlDZKmUGCagEJL0rFTPuNoV?=
 =?us-ascii?Q?24W6Z6+kbYnWHCB1VN9nF6VDDK0/IeIbfOFjd7+iLls9IhllzHjNuRDXFbPm?=
 =?us-ascii?Q?s5bquL6LoxY0jKxC7ekv0rw5cslnuLpQBWEHihoJjLI6aynBEnlNGqABbUlu?=
 =?us-ascii?Q?9LxtpOC4suOM9ATAFz1y/OslPOBPrDjfVoTAQ1lGKIZBe95hK6JCTwWGdaPj?=
 =?us-ascii?Q?WxD6R3qajoUCs8gznl1os/YbQik8nvcnXN8FBERsgupnX3/5F+ivXpT4qK5E?=
 =?us-ascii?Q?eDHYSm2jxHBAZgIAJWK1vsnosbBIAy1+dJQ+Rsh85JWmn5Ixmlm1mj9JCL7C?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb882dc1-d2ab-4113-1109-08dd88ea8f58
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 19:58:36.6272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cm++KqtxXyER6qbDEpRHlnUJx00OBmVBlDenwjNXjj4vaT1IrNd5Y1KWHknQgz8LEXqonRB0EZPRMVWjVeP0jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7789
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

On Thu, May 01, 2025 at 12:14:45PM -0700, Harish Chegondi wrote:
> copy_from_user() has more checks and is more safer than
> __copy_from_user()
> 
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c         | 4 ++--
>  drivers/gpu/drm/xe/xe_eu_stall.c   | 4 ++--
>  drivers/gpu/drm/xe/xe_exec.c       | 4 ++--
>  drivers/gpu/drm/xe/xe_exec_queue.c | 9 ++++-----
>  drivers/gpu/drm/xe/xe_oa.c         | 6 +++---
>  drivers/gpu/drm/xe/xe_vm.c         | 6 +++---
>  6 files changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 3a84a9d92c48..d99d91fe8aa9 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2569,7 +2569,7 @@ static int gem_create_user_ext_set_property(struct xe_device *xe,
>  	int err;
>  	u32 idx;
>  
> -	err = __copy_from_user(&ext, address, sizeof(ext));
> +	err = copy_from_user(&ext, address, sizeof(ext));
>  	if (XE_IOCTL_DBG(xe, err))
>  		return -EFAULT;
>  
> @@ -2606,7 +2606,7 @@ static int gem_create_user_extensions(struct xe_device *xe, struct xe_bo *bo,
>  	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
>  		return -E2BIG;
>  
> -	err = __copy_from_user(&ext, address, sizeof(ext));
> +	err = copy_from_user(&ext, address, sizeof(ext));
>  	if (XE_IOCTL_DBG(xe, err))
>  		return -EFAULT;
>  
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index e2bb156c71fb..96732613b4b7 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -283,7 +283,7 @@ static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 extension
>  	int err;
>  	u32 idx;
>  
> -	err = __copy_from_user(&ext, address, sizeof(ext));
> +	err = copy_from_user(&ext, address, sizeof(ext));
>  	if (XE_IOCTL_DBG(xe, err))
>  		return -EFAULT;
>  
> @@ -313,7 +313,7 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
>  	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
>  		return -E2BIG;
>  
> -	err = __copy_from_user(&ext, address, sizeof(ext));
> +	err = copy_from_user(&ext, address, sizeof(ext));
>  	if (XE_IOCTL_DBG(xe, err))
>  		return -EFAULT;
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index b75adfc99fb7..44364c042ad7 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -176,8 +176,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	}
>  
>  	if (xe_exec_queue_is_parallel(q)) {
> -		err = __copy_from_user(addresses, addresses_user, sizeof(u64) *
> -				       q->width);
> +		err = copy_from_user(addresses, addresses_user, sizeof(u64) *
> +				     q->width);
>  		if (err) {
>  			err = -EFAULT;
>  			goto err_syncs;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 606922d9dd73..21d4ced31dd9 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -479,7 +479,7 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  	int err;
>  	u32 idx;
>  
> -	err = __copy_from_user(&ext, address, sizeof(ext));
> +	err = copy_from_user(&ext, address, sizeof(ext));
>  	if (XE_IOCTL_DBG(xe, err))
>  		return -EFAULT;
>  
> @@ -518,7 +518,7 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>  	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
>  		return -E2BIG;
>  
> -	err = __copy_from_user(&ext, address, sizeof(ext));
> +	err = copy_from_user(&ext, address, sizeof(ext));
>  	if (XE_IOCTL_DBG(xe, err))
>  		return -EFAULT;
>  
> @@ -618,9 +618,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, !len || len > XE_HW_ENGINE_MAX_INSTANCE))
>  		return -EINVAL;
>  
> -	err = __copy_from_user(eci, user_eci,
> -			       sizeof(struct drm_xe_engine_class_instance) *
> -			       len);
> +	err = copy_from_user(eci, user_eci,
> +			     sizeof(struct drm_xe_engine_class_instance) * len);
>  	if (XE_IOCTL_DBG(xe, err))
>  		return -EFAULT;
>  
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 346f357b3d1f..fb842fa0552e 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1301,7 +1301,7 @@ static int xe_oa_user_ext_set_property(struct xe_oa *oa, enum xe_oa_user_extn_fr
>  	int err;
>  	u32 idx;
>  
> -	err = __copy_from_user(&ext, address, sizeof(ext));
> +	err = copy_from_user(&ext, address, sizeof(ext));
>  	if (XE_IOCTL_DBG(oa->xe, err))
>  		return -EFAULT;
>  
> @@ -1338,7 +1338,7 @@ static int xe_oa_user_extensions(struct xe_oa *oa, enum xe_oa_user_extn_from fro
>  	if (XE_IOCTL_DBG(oa->xe, ext_number >= MAX_USER_EXTENSIONS))
>  		return -E2BIG;
>  
> -	err = __copy_from_user(&ext, address, sizeof(ext));
> +	err = copy_from_user(&ext, address, sizeof(ext));
>  	if (XE_IOCTL_DBG(oa->xe, err))
>  		return -EFAULT;
>  
> @@ -2281,7 +2281,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
>  		return -EACCES;
>  	}
>  
> -	err = __copy_from_user(&param, u64_to_user_ptr(data), sizeof(param));
> +	err = copy_from_user(&param, u64_to_user_ptr(data), sizeof(param));
>  	if (XE_IOCTL_DBG(oa->xe, err))
>  		return -EFAULT;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 80e56e232685..62fbc746c883 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3101,9 +3101,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  		if (!*bind_ops)
>  			return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
>  
> -		err = __copy_from_user(*bind_ops, bind_user,
> -				       sizeof(struct drm_xe_vm_bind_op) *
> -				       args->num_binds);
> +		err = copy_from_user(*bind_ops, bind_user,
> +				     sizeof(struct drm_xe_vm_bind_op) *
> +				     args->num_binds);
>  		if (XE_IOCTL_DBG(xe, err)) {
>  			err = -EFAULT;
>  			goto free_bind_ops;
> -- 
> 2.48.1
> 
