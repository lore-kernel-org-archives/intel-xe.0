Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7E1C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 04:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C860E10E5BD;
	Tue, 29 Jul 2025 04:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0uFn2Tq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD9710E5BD
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 04:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753763616; x=1785299616;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M68d15f1xb1dkyvlz/3xuJ34z4di5EsEM18g7U/UVYM=;
 b=F0uFn2TqC2/Ol6iOI1cw4cdchW2a/ute2ER2gKXBL2sS/1WQCBBtrcBE
 bL9CXWr8xp0Mpcrp/bSAjDOmihI0P+V2cDDDNynjmQzkmCrxMtQ/X83mt
 4H8g7MocZkQ/yqhaKKxllEEw6UPqBJEvfhfFF3X0NugIkVWRmKFnAHvKx
 f8ArshMyh2W/OBu7KUwvYlfaAe86S/DDNi3s5YBec0WKh3i0rE2ke0ayH
 wiaKnsYw2/SNixTcK0bo7KT6u3sWvVCYXMfN9d4l++8KWEyblb6QzFx8x
 nq+N1QnJdTvQjIliB3sCpJvunoU0GBLK8MlULIFQB9o/02zSrT+FUsdIB A==;
X-CSE-ConnectionGUID: hUFv/fw+TtSODO+PdJsSRw==
X-CSE-MsgGUID: VHKjDHruRhadOODEkJ+3Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66728425"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="66728425"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:33:35 -0700
X-CSE-ConnectionGUID: PrFug5RrSgaQKqmGOOtIEA==
X-CSE-MsgGUID: tjBwhQftSlSHieJCSSun8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161854617"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:33:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:33:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 21:33:34 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:33:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqOWoRsQciWU6DwZH3lHjCum7gGd5fWpwjJwC45g6dWTjDczdfub+HYb7zZR1Q53frwBEm8HkBA7KHuQhaGzMRD0VBxmiP85P7rwlG+ECk2p7B5KKO7Lk5v21r/agV6dZ378aHTGzcEAnA+5UtKpnUMNw7NLJs9mohIn7s4ke6ZvWSr3Cnj7TvquOF3H2FavcroBYekBtokZTzi2wyO6a42GmKzvdtBGHeqCMyQwDMpCTQOVHiP1i5ijbT2UX9F9psBdYQS0yth+q23nV8b50ttoN2UxzZjgjiFKNpDVacb46cuQIcazHvZK5Q2n9CyEokQx4Nzg3caPzAGdMovHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abZehXPIxXThT7ZliH7WJ0cf8f/SqTHWhKMK0ddUG7I=;
 b=m5BlMIY3g0QfL9DiOdgxjYLGRZukgTtRBQK5ejjGp+Bt4O/Qtbkksf/3jFzybgMA7cLmY3VRwpYok9rSKL0iAeRaYSv17GS38RIb2BFEkhcnzZ/dBag2fv7kDHpyB/totA/3zwlJDjUEK2DHSL4rsqP8gGRPiB0h8x5AnhruiuogRPjlMNh/xkv/x79KxcFsLasVEeYZvj0AXOcQPiHApMRh7xA0WZzzdOyw/jG0PNsd7hHM4ufP3wo+P6EVVpI0mmDOP2tkLjlYh0n0qC3cN9h7xVBGIddXnSa9gf/j2yAZ75oqjAHeuCBEFwEGQyfD9JsIVo/MEXG7YDP6rKUMrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7431.namprd11.prod.outlook.com (2603:10b6:510:273::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 04:33:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 04:33:04 +0000
Date: Mon, 28 Jul 2025 21:33:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 19/23] drm/xe/vm: Add helper to check for default VMA
 memory attributes
Message-ID: <aIhO/iqn/M4ZB68V@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-20-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250722133526.3550547-20-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0277.namprd04.prod.outlook.com
 (2603:10b6:303:89::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 397473ce-5d8a-4fcf-4f23-08ddce590275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sr2HOzkYu3i+sg5vTRDfUXAeyQUQuVM1lCyKCrAUeWCWSXea1W9E6fCSNlm2?=
 =?us-ascii?Q?FVeJMfURU9l9oyHfHf0fZRJBaasUY5FcHZMr/geip1UVxgD1Ilk653t4iRqu?=
 =?us-ascii?Q?YcJFmz1j1JJ0IT8IgMBWKKb1ybOp4K8KT0kohos38YarKMtO92BPAkkAQBB2?=
 =?us-ascii?Q?A8vlz8/dzOjUkcvXeHu3fE7vIj8AOoLyxdf9Td2m2gHKT4TMf77sw1HDYv/K?=
 =?us-ascii?Q?mtBv3bv866TZsU2vPM1QvDLM3tZ1Zj1KqehGB+5KR+2dPZqm0dzW2Gask8bu?=
 =?us-ascii?Q?54P05XVlPbsCo2nPgd56Gt+YdJTUvwwuouGeUU1b6ebOSW6s0C0nhFeA8+B4?=
 =?us-ascii?Q?vtG4tbsGtiMuGA2iAoMSf/H85WBZK2Y7IWxRybllpLUhP/TQhOTWNMsRyfwE?=
 =?us-ascii?Q?hVah52XXRBhMhLlzZWBnlEWZduA9DkQoTqlSqquO4dpeA/m0LZExVWLvL+s9?=
 =?us-ascii?Q?akD5B495arf2wGFyHVrkXhhJSz1ha5Aigp7FdVgDOhqyB+satyGNm/bL8o1N?=
 =?us-ascii?Q?DkQa3UzcysLeWboEh5DqWdX4R7KkIUccdKW2hPGTGEOPSfMVAUQU8M1Tx3vf?=
 =?us-ascii?Q?lf2M6REV0eKK4MarCGivsfNy19aLdN2fx4dBDN8D+tGeUzutzQeGqsSzLZfP?=
 =?us-ascii?Q?OA1+DS7Cv9EihxmDM0G0zseAxh9sMWBs18ESn2R6A6yETBt+Qubr6h8UTIgy?=
 =?us-ascii?Q?1mZ8yfN9v/cF2zsISRdvQYLUZ9WdJVsg0764cQCm9SV0d1Jml2Lp8Oiphfyq?=
 =?us-ascii?Q?ZqBH3HAMYq0ykpHmXOxXuLw/kKhAZChoXrx9l+bKe3ViQEiy+VX2ya5Utf16?=
 =?us-ascii?Q?Ty0Gsrgacq9RuTRdtLntcUBI3KVQgsA/Fp3+ytcYgGHAC5s//yJ1bdBL6W1z?=
 =?us-ascii?Q?s+mFm6jVwKFXoRdWJN+9zxSoFIlfowZy8sDdBM8P+tE6FfNiR/K86eHCDeYW?=
 =?us-ascii?Q?uxMhsn4tU92GZ4gG2irSwzcnIN5RJCxiaJeB+CPagRyxC3+RUC422v7onPBS?=
 =?us-ascii?Q?taRfdpZGoL6NFauT3aH5MrETIOlwAbuV23K3f/d71qfF8yxyMh5ishA9QVYK?=
 =?us-ascii?Q?npIsDIEV67vBMDnDCw90BZj2mbDlP/wjv7o2VGDO4J7Wd7kpej3zbg7RoD97?=
 =?us-ascii?Q?KDO4SExdZ9HEf5/B37RpJVzddL9xzRKcBt1kGxnnkDx37rQE499vWhQySJtA?=
 =?us-ascii?Q?Ow2fZNl5UHpbjJ9xg2XezK6Rcx5KwI4e+I4ayXMxOQgkRPlKKeyaXv+YC+IJ?=
 =?us-ascii?Q?ndrB8OsyGRnIzTCHg8Fu0ZW5K1egSt8ZOFkwWWSbu7Ys01rA/Sp6mzGWPp2f?=
 =?us-ascii?Q?GZf+/hhAADVEzD+jfpCyM87sbyLu4/zZmyy/h1rBa/b8nKfr566iJjZVb56b?=
 =?us-ascii?Q?Ou2EIZOk4lUHVwlAi0iP2IZs7KWA2ZqPEPdnhmr277FnBfPJxOKcpPHp1XtA?=
 =?us-ascii?Q?66cZnR5k/X8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cq9uJHq8P2gefUcJhvPgi4LKKGZFrkcisbEo2p0HXdLI1IE/WTZEe0G1N2u7?=
 =?us-ascii?Q?uEVc2FeELIeKkbjpy/t+NZcqB+/hiJW8GE4sEZdaJFjluj+DXny/Igu7GKg0?=
 =?us-ascii?Q?RWRwfG1VzxDChyTEmq6+b31ouLJ1qohXEmrvSyzGJNyJD0QAT9h+jRT55fhh?=
 =?us-ascii?Q?i47AnWrQ/cXmIkuHkM53kwrdioGX2QRgaIM52wsKdRSrBQHYJ/ITGEjPEuO6?=
 =?us-ascii?Q?YtmR+eC6nLYe1BTDBPc3NKNFHjDIe8gQr0cy6vQ5wvHYMtGnB3CvCdT1DOFm?=
 =?us-ascii?Q?bSm0ifTI5+HNu+bfpHJeQZ1LyRntbkfHvNmcHoQ9xK8cjBQwgWFPKdFJoKdt?=
 =?us-ascii?Q?o0hLLRzYusTAaiRJ9NyMtTlDXm4ETShrgn3rEq4Xp2Eyfpe8Ppv6dQHTDB+N?=
 =?us-ascii?Q?ciH1sRMBbd4azEyfve1r5DxIdLBw3eX722mzjoSYyLbnzsxwDymworihybIW?=
 =?us-ascii?Q?Sn8BdWtvcywjYy1LCgMDULUy6d41mldxU8ZyHnhFtdF+M8ctVgh83Jt14eTP?=
 =?us-ascii?Q?XIZdcTUGHENPRvvP9wZw5uPCaSNciXazS+uASPdoP+5pkRkD+0d3CBYYQrgc?=
 =?us-ascii?Q?/RwOzo+vktBC4NIZablB78ZExo5X65kSQV3taQFOuOPcvo5dtqDCRZAVq/Y1?=
 =?us-ascii?Q?M2ZXj1hShratWGDT6sxuA6psp2UhDRaC+Xpj5OfaNa6+3Qgg5FloCwmzUhVz?=
 =?us-ascii?Q?QMetgw2XGFPAsZWfXiK4TNaIzlhDdlJ6ceyOR2WqtPrtpgnbJZQc9QzOZxth?=
 =?us-ascii?Q?XhvjKuv8roczaAdnJTDcLf/6+r+/XeMcSUz0oxhN2nbtH9Te0nbjRrnur0c9?=
 =?us-ascii?Q?VOK+USqRxcT9rHbQCn4PFsb6CnUh5HCcJt/gwZrRM8YzCtAnN4fxXyXPmrma?=
 =?us-ascii?Q?UuTLOBNHAlWKYLM7gWzgdQP9etFtpTu8XQHES8MWhT6yS0KJgbIH/tOJPSYQ?=
 =?us-ascii?Q?BSB8CzybFrL67bj+hDDc1UGVt0knEjSiydstmHAe59j/FEjGHFJF2cU9xaSj?=
 =?us-ascii?Q?SU4ip64SgoXwpyVryqbJMINzdHQCCtLFlrg7ELzwPnxDlkd1qT01VprrnY3+?=
 =?us-ascii?Q?sRzhIgzQKFQhX5ew1O5fNBoMiCImyKMPvnJ9W55AR6Z9EZnoSmJyP0BEiOID?=
 =?us-ascii?Q?kpmEXabjYHDtVyzn/imNm7Zx8yXajPr8yVpARvJ53O0zymRvzq4TOyhHEfYk?=
 =?us-ascii?Q?GBKvyEvvxhLy9FV+MQYIPYkwfqzFoQ6cMvENnaOdtX5mFYwyTn4VB1ypr1tV?=
 =?us-ascii?Q?76gr4k0YARNVY9srCF1GdBrn9O/R15MQuy5ly/dsGpzZ9Yw2URV8Sl9zHN1H?=
 =?us-ascii?Q?zQ5bIxjRvytAUa5y1ofmxjD1nwxZd5cYP+uKFiL+EpNVPIzsNiTDBoUMRAsY?=
 =?us-ascii?Q?R+hl3XES8tcDMXn65qOq2Z6GUA4p64lj+4TLuGv7QGEbcoTUOtXS6zRgRKpM?=
 =?us-ascii?Q?Got4sxTNh9rInkaHH3+6TvPPo8U22TZWO38YR7f0VoxsQaBCKYW4VES+FdNy?=
 =?us-ascii?Q?gcqdyEuE3+J0X8LhMrLZYV8QQqmupq+NjIfhE/JUgVJDJsXcPPEAxjUjJYQA?=
 =?us-ascii?Q?UrBVx7Dp2GwVwv4OF1D+REod3Pn5tYP1OsETaMnQDarXXc/6dtpQK2GSDvEW?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 397473ce-5d8a-4fcf-4f23-08ddce590275
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 04:33:04.6548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8So9qkBo+DNmYsoDVJiSKu2UnpX9K6q1ZhA+LzJv4MOqahOsbllNCKv4HUZFuV2taGW4SJujraoagTdYpoPF5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7431
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

On Tue, Jul 22, 2025 at 07:05:22PM +0530, Himal Prasad Ghimiray wrote:
> Introduce a new helper function `xe_vma_has_default_mem_attrs()` to
> determine whether a VMA's memory attributes are set to their default
> values. This includes checks for atomic access, PAT index, and preferred
> location.
> 
> Also, add a new field `default_pat_index` to `struct xe_vma_mem_attr`
> to track the initial PAT index set during the first bind. This helps
> distinguish between default and user-modified pat index, such as those
> changed via madvise.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Ah, I see how you restore the default pat_index here. Different than how
I was thinking but it makes sense.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h       |  2 ++
>  drivers/gpu/drm/xe/xe_vm_types.h |  6 ++++++
>  3 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5dc7cd7769f8..d3f08bf9a3ee 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2592,6 +2592,29 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  	return err;
>  }
>  
> +/**
> + * xe_vma_has_default_mem_attrs - Check if a VMA has default memory attributes
> + * @vma: Pointer to the xe_vma structure to check
> + *
> + * This function determines whether the given VMA (Virtual Memory Area)
> + * has its memory attributes set to their default values. Specifically,
> + * it checks the following conditions:
> + *
> + * - `atomic_access` is `DRM_XE_VMA_ATOMIC_UNDEFINED`
> + * - `pat_index` is equal to `default_pat_index`
> + * - `preferred_loc.devmem_fd` is `DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE`
> + * - `preferred_loc.migration_policy` is `DRM_XE_MIGRATE_ALL_PAGES`
> + *
> + * Return: true if all attributes are at their default values, false otherwise.
> + */
> +bool xe_vma_has_default_mem_attrs(struct xe_vma *vma)
> +{
> +	return (vma->attr.atomic_access == DRM_XE_ATOMIC_UNDEFINED &&
> +		vma->attr.pat_index ==  vma->attr.default_pat_index &&
> +		vma->attr.preferred_loc.devmem_fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE &&
> +		vma->attr.preferred_loc.migration_policy == DRM_XE_MIGRATE_ALL_PAGES);
> +}
> +
>  static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				   struct xe_vma_ops *vops)
>  {
> @@ -2624,6 +2647,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  					.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
>  				},
>  				.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
> +				.default_pat_index = op->map.pat_index,
>  				.pat_index = op->map.pat_index,
>  			};
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index d5bc09ae640c..a4db843de540 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -66,6 +66,8 @@ static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
>  struct xe_vma *
>  xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
>  
> +bool xe_vma_has_default_mem_attrs(struct xe_vma *vma);
> +
>  /**
>   * xe_vm_has_scratch() - Whether the vm is configured for scratch PTEs
>   * @vm: The vm
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 81d92d886578..351242c92c12 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -103,8 +103,14 @@ struct xe_vma_mem_attr {
>  	 */
>  	u32 atomic_access;
>  
> +	/**
> +	 * @default_pat_index: The pat index for VMA set during first bind by user.
> +	 */
> +	u16 default_pat_index;
> +
>  	/**
>  	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
> +	 * same as default_pat_index unless overwritten by madvise.
>  	 */
>  	u16 pat_index;
>  };
> -- 
> 2.34.1
> 
