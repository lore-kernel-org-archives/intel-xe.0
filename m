Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D36C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 19:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5141F10E638;
	Wed, 14 May 2025 19:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhZEnQCz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF12710E638
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 19:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747249211; x=1778785211;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jc2RQxICXJ7+DRmQ0rBdk/lidnmc5NZE2F3B/edxj4w=;
 b=ZhZEnQCzzVlkVQ6rfiuzZMv8O7kFUr9v1Ro0RzXlV+OrHQ7qpfV6SIIV
 UjWALrgWN7NHam56wDSlVdq7tdRWc4g0gdaXVz+gfDZZf0DOpKWxjY5mo
 hKRVYFHo5X506wTICwIHgxZT+++vuMzTk/VxVPmOV6lvAzUdiHSPMLUtm
 PAerXOHK8gJctgEY4APPhbY8z2PIOao2lVUrLllZdh0gzehEeE1MHvjez
 xpWhO0TFR+AQuIb3UoAPxwbr1kX89eetMpzI5feNYH6RGMBVfo0ADbrXe
 s4ElHFCxOlEaJCrejYAl6NrXRlqxrqlIXTF/3tW5whdQv15vlYJYSSOy2 Q==;
X-CSE-ConnectionGUID: pBQbkcwPT9yqhWnrG4MK5w==
X-CSE-MsgGUID: d83MqdPhTjy6rEDra/qMZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49098436"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49098436"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 12:00:11 -0700
X-CSE-ConnectionGUID: BqfGSh1VS4SvXC0ofj+NFg==
X-CSE-MsgGUID: WGBv0MdASxy3kxQvOGdMgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138008359"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 12:00:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 12:00:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 12:00:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 12:00:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsKaKa+CRbSQINtZFi7y+W3BJJrFGnzIlV5PGh20qZvmAJTkj1yqk/2KqoSbAcSP+HWnKFgBogkuQ3W18ZsA3g7CyzGL6nOQ/cOEjrMlkde14yaxiud7iANS7nbz09AQ1rlVznkQiAWH+dvNRPF9UoN8o+dS57oE3cA2rPWgTjExFlOY0fkWi+Vm1obtX5dUq8QrvRrrNPt9Jc8JaHoUzqC8zFCLjbzjHHNQSDzpGIMx0pcXgpjE8UAFcJUpF/EjC0enKUBlUQwf0Jo4W0p/oCvYH1uArP/ICJ5dQIUQoNuMTSIqzJpdsc282KCzx9huYfaClTfqggPGNVKWQl/ldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxLkkjNTCzb9zxS0w79q+MUw9crNe/uVHNE07aTtm2o=;
 b=lZI22IgZzq554gfUy0fpvMdKD3KAYdWbLPLPQCDTexf0BJ8xI149uwMxWw44HavycFAzptaoi1g7vPxMFdRsQJgMhRei+6qi5OJMHDl4AzV3iQbA2U50m9l+FY52LMCqjE63T3HXwyxcPHrctFa/7O/gXsVZbqcWZQPd8RLBukwAIneNgjDqcxXoDCN3mJzzRnk9ooPjrwsIKA6B+FhtQzd61GNrUVkB1GdJBTH54dPna+L/JigsutLP7tEQt/J/G32cx+wKKvIu/U/J/Raecf+nqzjoJT32kr9bOrvQlH8LGuQsHeZqtAcW+7feRk01K8zXQyZD+2ZUW4DeciLujQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8306.namprd11.prod.outlook.com (2603:10b6:930:c6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 19:00:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 19:00:05 +0000
Date: Wed, 14 May 2025 12:01:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 22/32] drm/xe/svm: Split system allocator vma incase
 of madvise call
Message-ID: <aCTojH5BA0qM5tFv@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-23-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-23-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0125.namprd04.prod.outlook.com
 (2603:10b6:303:84::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6ac164-cccd-49ef-2e4d-08dd93198a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wM36v4Z5twazyc5LOWxxKrT6YQuou0uX7ifu4yNUDHmB1MyCcrPaxVo35L8A?=
 =?us-ascii?Q?/P7vrRJYPb1Su3Rbz8F+JVJoN4cCZE/pExkS5k5keCGGFYtmbQ7zYfENvmKg?=
 =?us-ascii?Q?jIIGcozQ+FfBZwedNMqmMy1l+0j+7s7KTMUvBgT74FgmXeHhZL234NetG+V0?=
 =?us-ascii?Q?NDcpHbZPJc5AhNO/nJS8HtBNIzwNd/PdQ8T9xfT5tlVHkU6zJiJLqP61L+Gp?=
 =?us-ascii?Q?tdLZ04uthA+21RVvytUeWKVd5meb1lHEJzKSqa1q2Ki/avF/fi4ryA7a5LrQ?=
 =?us-ascii?Q?wPFL+jxOlhr9g2cLbVfRrL2J4Kl4TtUQVWMEzXvDoCx5NVh81xcEWg6oQNJK?=
 =?us-ascii?Q?2Ejlon4S/RaidzvnkLengsezY2JhmbjGXwtv0zIEyReytzF9oknHNHQFS6dM?=
 =?us-ascii?Q?44yhNbGM3Ih3whUaMfbpFMofRYJEY0fprKGRdSzc86V34P/L9UzO+wkZWN13?=
 =?us-ascii?Q?3GoIMZ3ZndXl6dpCLpun6SGUMam7O+aBU/DUNuxDQS1XFfYdw+WC4Vq10H18?=
 =?us-ascii?Q?WoEtx0AJRITEXNtL3QIlH128AhvVxmxB4zwCKoCRM0TzyqsouWamgnqFgmK7?=
 =?us-ascii?Q?nDtPcqRgyizD8gccUjCryK6oWSrhMz/TnEJu64iY+kPtZaE2Ap3+YMR1TXnc?=
 =?us-ascii?Q?nitLM0xB6SRlNasK/mM+7AUbbNOkVKjkz1KR6mZ5EMkFS26Bdo8iavSX/3RW?=
 =?us-ascii?Q?qrz1a5xJveITk4snpvZ12kxzqSfRddneLkLcD5tNi2EKDqirafQNaA6TFGa8?=
 =?us-ascii?Q?H4AuVKVZtZyYxjmlbEpPw/itvVf5cTKObfQf5pcWoNsAIIUnXU/qWloOW/gK?=
 =?us-ascii?Q?xoUhXb5s52jMCQkjdKnk7nTjlTahM9S09iPMt6jyMWvHN4z8mMXT+c3ZjdQt?=
 =?us-ascii?Q?wCSxhEgsLQSpFVaSW/PE0lei2i6lXz9CZIxrODkEzvVO/rX28GM5LtsZW8lj?=
 =?us-ascii?Q?5DaT5jRqM2Dwkb+6Vp4zzDUxMwiIyIaBuVIZu6U54ErrqpCGZINWd6L986Wj?=
 =?us-ascii?Q?GcsTgm+TBsFu1qRiWG3ifIpnK++rZuIN1RPAvGfEj0NC2R14//QjA37V9z16?=
 =?us-ascii?Q?1dusOvKUQti5p9BuiZfP/kWHRbxPX1beMk41nGnQoPr359FZwenihJ6ce94R?=
 =?us-ascii?Q?QFu8GFyHeP2A2czwcBqzGQS8v2NezvTOIgAuLNyGp6r33b57orXxJJziLANb?=
 =?us-ascii?Q?T22gQDTWuYkhp5H5cRGSfZch6fw9bqJ5cEUpboPvidLL+irfCgHQ9bHWUCh6?=
 =?us-ascii?Q?thCxlbmC4tAPFIRL3EAgZuntiOwpZoiX9W93wQ/40GWmlyetTa6QQZsPZqqd?=
 =?us-ascii?Q?RGk0DIyODo5z7K0B/feFDmpZh5t6rT4GFK6UAzIAPpOAn17bZlAPuwhzJJt1?=
 =?us-ascii?Q?oitsKUtekNRcnYmHzkaH4BGhGLdol9JF7EVYQLeRtjVHVuMynkKrXlyIuBUh?=
 =?us-ascii?Q?jLT/4+Q/unI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?23WXkoEOeLo0zJeFcWBLPHl6TCWrLQpD4ub15ew+hVBp9vAIgRokAhWQOCeq?=
 =?us-ascii?Q?LCh+/3qP6TyZAIS+BKF55ox3Q/puXYtpKs77d9ZsNUKVUT3GAGYVJgLUt9Qk?=
 =?us-ascii?Q?+b7q00Y2uMAD+/C9HmLYe6jsOKJ9/lmcYykV0lcMzCdfZDvItYh9O5NgnNA9?=
 =?us-ascii?Q?3dAum904Rz6D5HSWhTqxMhFG9fKK25xBqXqB+cfNC5YFT/XsEqasylxwks/H?=
 =?us-ascii?Q?6/Wl+oBjFtm3AZli5/0B+0vdQlAY6L7R/945rhu2zNiCV5M+sz1W7ua+JfOq?=
 =?us-ascii?Q?tsryfpFAFDIhhRto87xHrsh48IwTBXy3GSfbOehwvCH7LzOCNGHgqroe5hNH?=
 =?us-ascii?Q?vccQ+p4NuJyAeYdlZCXrSC/nrztzfghzr1CoYVOKqLrAOI6trkSrN7yv6Ujz?=
 =?us-ascii?Q?Ya0rzAICnZ8NslTXQ2PEYharcIJ2iNHtYpAV0RxV+2SGpIq046ugpSB9W6Gu?=
 =?us-ascii?Q?SExFMStO+/0WoWcNcftIhwtP/NFAiFHYXXrgKBgVa99pW2sCQrU0S2U7mrxo?=
 =?us-ascii?Q?XQen8m3bTJ9egt+MelxA/fgkfZqTkCye/9fq/M1QJmJoiblrSQeUYWS5LFGN?=
 =?us-ascii?Q?bIODeWPL1IOuqMldPBcQrtNjH7ujpzRfdfXf/2OEFreNvMr551EWoDXz9/JU?=
 =?us-ascii?Q?dFEy+D3nObXoO9W3gzBu6S/LC+SUpdpKJU6GfwykFkaaJraxSRUF97f6SN9s?=
 =?us-ascii?Q?EIvXKyRz1rm8eWzpD8ozXK3j888ayHUpVAgFRQ9e8/QhjSgNWoyjA0Vjqw6u?=
 =?us-ascii?Q?2GRXjVp2YddSDoZr8NKpvBJPlFUZ/PvEnp46wUmDQiTszKsHMMps40McQEj0?=
 =?us-ascii?Q?McFpC/cF4stNYLUNwKDnC5MXkqt0J/M9ZQ3VjpbFFXE1sFtdrawD6ZBIogth?=
 =?us-ascii?Q?GtXhKP0wykI8GB498gBJ1DLKKNNrR0JkTRDCkajbNGwILWQPRC6fKU0ZAm6D?=
 =?us-ascii?Q?YGxuSbhcwnPVWoqk03vhJs/QLu4lnnyQT/u4Zg2snIWFFE8k4LOrUcpWlHzv?=
 =?us-ascii?Q?HWV32QngCPjU6Bkm8m07Kg+AUpcPLS9W5ZV3MeiNmnSs6jeRI8K35RB0fNI7?=
 =?us-ascii?Q?zy1OnBVpZsPVA9dHMTMU59QYpdG6Rh6A9dyHr/lM1Z5ssAnxF7trBwAPYX6s?=
 =?us-ascii?Q?P5jMjBkO20dgW7chy3eTwgg9DtchDs2u6kRQLdo4HQojwXnP3NsDILTnTUOg?=
 =?us-ascii?Q?jQlWCNMf+znOW/LqF8HD5npS3Qjn5k/ZK0nITTgJ6w+r8SQEoNzFvnHyeWuz?=
 =?us-ascii?Q?Z3HUJdjRDjxFqBabNCWPsttuxz84zWq8XFxeuFWApIY6fMdw4GwXu3y/Z1uC?=
 =?us-ascii?Q?2XhyIovA8QyLVTXHZs5YNYlqTfak1HjosRbf564cNbCVZSFnEzEiCgmjNdGu?=
 =?us-ascii?Q?tZXB2QAnz7QTErBV6tpEpqDHcc1R3FTvPouGgr+D38ndB1tJ6qf9wyZFLKo6?=
 =?us-ascii?Q?bj2X9Fyn1SuPZRPaPK/KU6QSESt1a8I4oiV8kPZvSUSZePpAE3CpqSU1r+lP?=
 =?us-ascii?Q?FeEPBq6CghTg+WZv95i32sjo7f679QdXYG47pPZYFBye1600CL/Rzb4Pe1Z3?=
 =?us-ascii?Q?VauIqtA5EXgjoWkfFAiiq7aaHiDd253XYbMLtXBXpX9hVmqX/ufyfjAWyLH2?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6ac164-cccd-49ef-2e4d-08dd93198a15
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 19:00:05.8327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArOC36ofyT0BkIq876pTQUkhQqBSujPb6b7vqnXAm+AGuNCN+7KNOqIVnDCIQYD5RbsA6WqJGX0XNJcA8vm99A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8306
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

On Mon, Apr 07, 2025 at 03:47:09PM +0530, Himal Prasad Ghimiray wrote:
> If the start or end of input address range lies within system allocator
> vma split the vma to create new vma's as per input range.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 84 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h |  2 +
>  2 files changed, 86 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6e5ba58d475e..c7c012afe9eb 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4127,3 +4127,87 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>  	}
>  	kvfree(snap);
>  }
> +
> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> +{
> +	struct xe_vma_ops vops;
> +	struct drm_gpuva_ops *ops = NULL;
> +	struct drm_gpuva_op *__op;
> +	bool is_cpu_addr_mirror = false;
> +	int err;
> +
> +	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
> +

lockdep assert for vm->lock, I assume we should have it in write mode
here.

> +	if (start & ~PAGE_MASK)
> +		start = ALIGN_DOWN(start, SZ_4K);
> +
> +	if (range & ~PAGE_MASK)
> +		range = ALIGN(range, SZ_4K);

We discussed this - not needed as UMD should align to GPU page size.

BTW - mismatch of PAGE_MASK, SZ_4K - they mean different things as
PAGE_SIZE depends CPU arch. We do this all over the driver but let's not
make this worse.

> +
> +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
> +	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
> +					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
> +					  NULL, start);
> +	if (IS_ERR(ops)) {
> +		err = PTR_ERR(ops);
> +		goto unwind_ops;

You don't need to unwind here, you can just return.

> +	}
> +
> +	if (list_empty(&ops->list)) {
> +		err = 0;
> +		goto free_ops;
> +	}
> +
> +	drm_gpuva_for_each_op(__op, ops) {
> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +
> +		if (__op->op == DRM_GPUVA_OP_REMAP) {
> +			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
> +				is_cpu_addr_mirror = true;
> +			else
> +				is_cpu_addr_mirror = false;
> +		}
> +
> +		if (__op->op == DRM_GPUVA_OP_MAP)
> +			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
> +

I think this is right, but it took a minute to remember why this code is
needed. I think we need a comment here on is_cpu_addr_mirror usage.

> +		print_op(vm->xe, __op);
> +	}
> +
> +	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> +	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
> +	if (err)
> +		goto unwind_ops;
> +
> +	xe_vm_lock(vm, false);
> +
> +	drm_gpuva_for_each_op(__op, ops) {
> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +		struct xe_vma *vma;
> +		struct xe_vma_mem_attr temp_attr;
> +
> +		if (__op->op == DRM_GPUVA_OP_UNMAP) {
> +			/* There should be no unmap */
> +			xe_assert(vm->xe, true);

xe_assert(vm->xe, true) will pop. How about...

XE_WARN_ON("UNEXPECTED UNMAP");

> +			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
> +		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
> +			vma = gpuva_to_vma(op->base.remap.unmap->va);
> +			cp_mem_attr(&temp_attr, &vma->attr);

See my comments about cp_mem_attr in a prior patch.

> +			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
> +		} else if (__op->op == DRM_GPUVA_OP_MAP) {
> +			vma = op->map.vma;
> +			cp_mem_attr(&vma->attr, &temp_attr);
> +		}

Also perhaps ref the comment above of why copying the attributes is
needed.

Matt

> +	}
> +
> +	xe_vm_unlock(vm);
> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
> +	return 0;
> +
> +unwind_ops:
> +	vm_bind_ioctl_ops_unwind(vm, &ops, 1);
> +free_ops:
> +	if (ops)
> +		drm_gpuva_ops_free(&vm->gpuvm, ops);
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 99e164852f63..4e45230b7205 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  
>  struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>  
> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
> +
>  /**
>   * to_userptr_vma() - Return a pointer to an embedding userptr vma
>   * @vma: Pointer to the embedded struct xe_vma
> -- 
> 2.34.1
> 
