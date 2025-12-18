Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14164D711C7
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 21:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB2610EB73;
	Thu, 18 Dec 2025 21:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nz2yppa7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8DA10EB73
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 21:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766093579; x=1797629579;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EaTLNVnan1Cx25uvTLJdU+Wd7Dt38Nxf2Tq+u0ZN/Yg=;
 b=nz2yppa7r2UYRSR5hsCp1A6zrZ5vL4DFqS1J+TgAgcTFjL8iLEm72qqv
 mwY5UCTTdIWODpwcNK6ck3wdmNwDTnPfuXfAzIW4tO2REbWBQQvZKqHqp
 bzqRAJsxFHwwxDk/0luaiCxY7I82EPwBDmZtlIcZGpyWYAOAvAYYygRNt
 3n2tQDjFcis33FoUBXdExHuakkKfRHYrDc+DGqDHATiFVDDCG1C28cCJW
 0jIU761tYyg9D4rD4Xx3HduFwILVJ/B5jD6nVzXJV+3VVgFlTkCf4NoOx
 jNNGCpUjM+11GwYsCjLpyOaEFc5qLSz3CVIbBc1DWLqvb/73CWtO6gdA0 w==;
X-CSE-ConnectionGUID: gp6pWooQQg68UpVrzSIaPg==
X-CSE-MsgGUID: FG5Al4Z4Q7aTU9fnwhf9nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68103399"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68103399"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:32:59 -0800
X-CSE-ConnectionGUID: xrffunzAQJKu8lY77gq6CQ==
X-CSE-MsgGUID: heW6pVvzSeKkUbcfZEbfYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="199163708"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:32:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:32:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 13:32:58 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.34)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:32:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wj/5I4UerYBw5aTpFCxARjMEpj9fjlG5UcW93vFx1Cu8gm1KuzrjmOWUM+kZFoXu/mTo6GoaWrgjLoWfN/O+IPV62PMz2mhiTNLMKQaCxvXVpSqb3w4nAxYld5esLTt5NRfTl9rli1Gu871zmg7dXRZTQuXwkJNBQOBcmBv14Bjt3h1fy30/zJRFu8A7RjHH9Rd5Jf0ojg8jqHmSH5JOjArrOMjJbHj0I2L8o1xY5iu6QkXj7AhDhTaEqogEe3cCYDv+UJA2jut/NqPyWnf56wdHr35UG9q8jupK6BYujKGM5PxS8LbXovKWbKo+DA9hJjDDoZbf/ztpVD+Rnx4l0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqcfDJCmbnHqXrKr7VlNfO0m8Zgx+G97ZOZXVN4+bKo=;
 b=IuM2qAtWXSjJjcvGskxCfZ9rvspDjNeTZQTWzzJuMR7wY1Dy3FOC8bcErJlDWZ8HgEP2hBx2j7bfsH12lefdae1XQ5vRiHWEPKpLBP0uhsSpherMuV8zHBdJdqV4wmkeRmsaTu0+FNlJnxHkkkGY63X9M2J0egEYO7+opJKQkim8givYguTF6Iyq4avXW+M4lPScTfN9S/e8A3Wy7yILz3UDAGu0aKJzaZ8V25EjcpRK51vE5ve96yTHHfYbtxVFSyI9E7NpFO7oykY9ly2oXg3ZKtxUEzyuSC6HRMlLsdjGRC3VLyrc7GRTbCqfiEUd7ULRqbnqpO5pFodN3ymR9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA3PR11MB9208.namprd11.prod.outlook.com (2603:10b6:208:57c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 21:32:55 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 21:32:54 +0000
Date: Thu, 18 Dec 2025 16:32:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Reuven Abliyev <reuven.abliyev@intel.com>, 
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/nvm: enable cri platform
Message-ID: <aURzAyc7ukMU0AxE@intel.com>
References: <20251216111034.3093507-1-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251216111034.3093507-1-alexander.usyskin@intel.com>
X-ClientProxiedBy: SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA3PR11MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: 222e8a91-b980-436f-020e-08de3e7d014c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A57g3wDl80O+sfvq1947lTo3G2PxWmTggSj2gZdnD2eG5rdLpOcuacgB+WUO?=
 =?us-ascii?Q?IRRuBa/uhpEfV6tJ+JO/LNTLKLU7EkgHF33QzKJqTEMd/B0W+r/7hoiz4KaM?=
 =?us-ascii?Q?1Kl4ea0Ratu+0Y88TDWxVBxNtVVC+H/I1Ks3KaSjz293Wb0om5mQOUSE/eDK?=
 =?us-ascii?Q?ujNA7+QFjRRi414ktAdRRSStzABs1h0Q4wQD0wUErh0uk5e5jUvlmcGfh1j8?=
 =?us-ascii?Q?3pFuO7g5BlYKpoijCK5otP3iqTccHQcGFE+ta1rNHjrcZEPjKYQR97ghsp3x?=
 =?us-ascii?Q?TqoIct1PZ/6dzD7jquBc/ZuyHgsdZgno1IpG7oPlkEDhn3Zl1fkWrepbqy0j?=
 =?us-ascii?Q?C+6OyGAZL9rG6h5vC679EgTqsj33WSz5bbzGApogO1mwc9gSS6z7/yXKjya9?=
 =?us-ascii?Q?ewGGb/tXvS8EWR0s3iy0k/Ux4sPXR7nxO7vj2WoU7OKXtRzJisIqGWj4zLA5?=
 =?us-ascii?Q?FQA4EDQDBhmVfmvA3M7O5LJUZubTuOh2W/Lfr6teq8B7Gd/nBS7PQ+Pte2zg?=
 =?us-ascii?Q?mhDw9eJj9TMcAXkNvfsaGrp5OudVYRXEk1XxQqwbQmyH6BhNEsHvljcOik7G?=
 =?us-ascii?Q?s1zffcH8Lu4X55Tjas2Y+hMeMZ0W5qlOmb3zQA/18O3JpADeMaB2rGTbJ+yD?=
 =?us-ascii?Q?X7Fc0RNGBN+VNzZYjq2DSbRs9v2EML3GDoh0NufPJKNdRZvgxtRvALMKKcH0?=
 =?us-ascii?Q?PcckAdJwQzHJXKqh0Dvh4mDfrx3GT3ZeOkF+l54sxYTAYg3cwpW4krTM0P89?=
 =?us-ascii?Q?LuxFhXJEIc9kotW7Z/sj/egrjSlVPoRR6dXFNtVuP9DGcGe6bASGgebu5wbh?=
 =?us-ascii?Q?/U18//IeKVN893fqUM4oYAqYqF37BGcFZlsXMIpNUUnVGRPTByzCowI7rQlr?=
 =?us-ascii?Q?rJDUQg0CIpzrkLoVctnTXCX4M/syB7HSAo9VF1CB2yRbWvM9eJ8fHbMn7a55?=
 =?us-ascii?Q?OL3SjKvFBSvEw9qsa37smrZlyP4FVf/sjCQoUr/LZ/ljKGL7I0j0IKheOy+3?=
 =?us-ascii?Q?OC+m2C7BTVyk7jvLJstyK7ikYUm+QaUnOCt6dndja26w6tuLfbJvrV4h/Qzc?=
 =?us-ascii?Q?0hbDtcT5yB03ZT7gpNpmqapkiD4WAB+TQHk2/Dcx3Tun04e8+q/5cMB60RuD?=
 =?us-ascii?Q?fnRGrQUtuWeaJZpLLvLy8VyvMU4iKdd+C3qCSZqe56nWHOkk1bPAbgn5Mv4X?=
 =?us-ascii?Q?zNaeqa1pjNBeACKRAQ8auwoXgFvIuch/lZTRxj5/fzrCR7lbIk/ka0wADEA7?=
 =?us-ascii?Q?/kD3EF92GnNYRGlmD6cxOXeuldiCUOU4vj4CenRjTAOO3AqmZJX6rZVK8RBT?=
 =?us-ascii?Q?CSFvbyxNj7uupDXADE564rLqVER9uDMP+nVVb4gU0icaIp78yD1Msc7PIfaa?=
 =?us-ascii?Q?71b0GdbDjrhwokhXa5PmAIGfMiX28R6Me+Y96Qs1Xq4pPQLXq5s9HqGE7tqy?=
 =?us-ascii?Q?LVInvO3eoOqhE+i7nXDguGcVkUb9uAvm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L2M2R36rdzxIs4IMLSTuBcLiWaAahPuoLJ67ynBXBVj0Be4h4iVXYIR0JuQi?=
 =?us-ascii?Q?vGlFFFIPr/ofhOlZOYSatfh1ehTzzZLAWb8n6v9IY6tGsgxqvPb6qNN/jnc+?=
 =?us-ascii?Q?VihzwFR2q7Zpr/l7UPB0X7TsoAFa1IDoElG96AkmYHOLorkrlfWtSmkrKqEG?=
 =?us-ascii?Q?Qptc/jD+USCa7F7XfyS0jUty+5yAkzMZkE8poA3b/VDnKQaboLzDL0qjL4/x?=
 =?us-ascii?Q?MZF9FgzTmXB51+EZuR0D4TxqQgoFbI8/KqGUxCaP4f24+jsMoVk2Gn8xMLAv?=
 =?us-ascii?Q?X/gjk4EjV9F4iPiHCN9EUHA4Wu5dSoy5kZw4gyI2A6BFI4GdqCil6WNQKWZq?=
 =?us-ascii?Q?CZ6WLs66z25uo8jvs1By/BPD9QLMo3pRfMZA1cNzdY+D94YYVuw//2eoykEM?=
 =?us-ascii?Q?XrH4WTElVgZjdsysTw4SSViwrDMOaGxP78y9iWM28Q5tNS5mglRdfvn79bM7?=
 =?us-ascii?Q?VykeHvF4YQEax233EC3oZoCF8F68Ye/nhuNx5Cw44zalYkO/F9kdTd+Ix8MK?=
 =?us-ascii?Q?PwPUuKztKOoo3sZA67ujNQp3AaITa5mAE30tnHNWqj7doAdYYrXRTCZgS3HN?=
 =?us-ascii?Q?mC94wly0nEjG00hUej9uSuaSmWEyG1AwZZkE35qm03TdlRszQFRUHCmLjfkd?=
 =?us-ascii?Q?V4/4aPyWeWMjqcTibUJBLvZCAJCZmfUkZqOLt5hgMKPapU7xzznLFXOQHLHQ?=
 =?us-ascii?Q?otQ0sasNK8v/4zZOcN78caVMKvS1KZEfnyUWdvnCwdCig7cGhKInk3LpUD/Z?=
 =?us-ascii?Q?vMpeKM4bbr1ZrZSqp9bdwRLoYBHyqNJT5RlvjZHdePhNJ8IFOzmLYZaPvUBf?=
 =?us-ascii?Q?dH8uqUBvGY+Wx+yE5ifwrspzQxM3UzHzoR8IVBXD/Zi8ll+QBbc/xAIxPrtz?=
 =?us-ascii?Q?BEZtUr+Fd/5DDrp13ngrm20re3JVyWRP3p161PhV8pKgZrYeQrBCpytVAlk/?=
 =?us-ascii?Q?bN/qpSbQZ7Q1uLkRPaeRE0IxxmYVtH3g7ARA6jGwTmNxQL1ax8z1ms6UjS7D?=
 =?us-ascii?Q?x7kmVsJ2gL/b7Gpf/VtX4tj30L8rttK58dcGWFTgLzynQYaZ34KQHkCivViW?=
 =?us-ascii?Q?GS8eB73s9D9Uf6aCCWtx1mP28scfd+U6+SS01WTjvvh1f2YGQKik9bgBmy1O?=
 =?us-ascii?Q?sm6iNfMl5aTZ3fKJFf4oCqTnXhRsiC0vUPVKfPlsqVe4BCTsRv2pJSbCadGC?=
 =?us-ascii?Q?J7o3Ytd5FFf9D7bmgXl0rF98/gIRpnFIahZYIfqAGdLAOYNf6faxFWZpuK8X?=
 =?us-ascii?Q?1kSWP+qNHk4t3ax541E7gmKPJhcyhgYzXL9I4EjnLeIiug2pqvkQqJtOHziF?=
 =?us-ascii?Q?SEL43+dYprVnf24aRO9KAoN3lYCkq4eBj9Tl7ak74oRQc5Zn4NR9kN0jwtfq?=
 =?us-ascii?Q?tdYPCio/aDWZXbANaUVsxYotrWlZHoAkTWePvaMP1DsxQIO8cC/A0lauHjf4?=
 =?us-ascii?Q?Pt9lyLFovMtUP2VKdVNNM6gwockU+NhR2fP27Bi0o72rMRaCV/lit+OI22+i?=
 =?us-ascii?Q?og55xzxD7uZfRaASWbiHlocp/DXrnsTAOXAISbXR4ZIpI14vcRUL0qW1wxw8?=
 =?us-ascii?Q?uPTMqOSd6w8sFk2R7gWy1EH/ooS3OjyH3v0O6cRebp/U2B2yKZdJypzDYJZO?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 222e8a91-b980-436f-020e-08de3e7d014c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 21:32:54.9151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3wYxVdmbCgeN2T3ELayLEKjb0F1UZTQ4m8iSqOQPGjKzW4dohJac2+CJqEjHaXH1rAy+09UVDS8PhMNTsOGKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9208
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

On Tue, Dec 16, 2025 at 01:10:34PM +0200, Alexander Usyskin wrote:
> Mark CRI as one that have the CSC NVM device.
> Update the writable override flow to take the information from
> the scratch register for CRI.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
> 
> V2: Fix commit message format (Raag)
>     Drop fallthrough; (Raag)
> 
>  drivers/gpu/drm/xe/xe_nvm.c | 34 +++++++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_pci.c |  1 +
>  2 files changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
> index 33f4ac82fc80..01510061d4d4 100644
> --- a/drivers/gpu/drm/xe/xe_nvm.c
> +++ b/drivers/gpu/drm/xe/xe_nvm.c
> @@ -10,6 +10,7 @@
>  #include "xe_device_types.h"
>  #include "xe_mmio.h"
>  #include "xe_nvm.h"
> +#include "xe_pcode_api.h"
>  #include "regs/xe_gsc_regs.h"
>  #include "xe_sriov.h"
>  
> @@ -45,39 +46,50 @@ static bool xe_nvm_non_posted_erase(struct xe_device *xe)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>  
> -	if (xe->info.platform != XE_BATTLEMAGE)
> +	switch (xe->info.platform) {
> +	case XE_CRESCENTISLAND:
> +	case XE_BATTLEMAGE:
> +		return !(xe_mmio_read32(mmio, XE_REG(GEN12_CNTL_PROTECTED_NVM_REG)) &
> +			 NVM_NON_POSTED_ERASE_CHICKEN_BIT);
> +	default:
>  		return false;
> -	return !(xe_mmio_read32(mmio, XE_REG(GEN12_CNTL_PROTECTED_NVM_REG)) &
> -		 NVM_NON_POSTED_ERASE_CHICKEN_BIT);
> +	}
>  }
>  
>  static bool xe_nvm_writable_override(struct xe_device *xe)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>  	bool writable_override;
> -	resource_size_t base;
> +	struct xe_reg reg;
> +	u32 test_bit;
>  
>  	switch (xe->info.platform) {
> +	case XE_CRESCENTISLAND:
> +		reg = PCODE_SCRATCH(0);
> +		test_bit = FDO_MODE;

thanks for pointing out this bit offline....

> +		break;
>  	case XE_BATTLEMAGE:
> -		base = DG2_GSC_HECI2_BASE;
> +		reg = HECI_FWSTS2(DG2_GSC_HECI2_BASE);
> +		test_bit = HECI_FW_STATUS_2_NVM_ACCESS_MODE;
>  		break;
>  	case XE_PVC:
> -		base = PVC_GSC_HECI2_BASE;
> +		reg = HECI_FWSTS2(PVC_GSC_HECI2_BASE);
> +		test_bit = HECI_FW_STATUS_2_NVM_ACCESS_MODE;
>  		break;
>  	case XE_DG2:
> -		base = DG2_GSC_HECI2_BASE;
> +		reg = HECI_FWSTS2(DG2_GSC_HECI2_BASE);
> +		test_bit = HECI_FW_STATUS_2_NVM_ACCESS_MODE;
>  		break;
>  	case XE_DG1:
> -		base = DG1_GSC_HECI2_BASE;
> +		reg = HECI_FWSTS2(DG1_GSC_HECI2_BASE);
> +		test_bit = HECI_FW_STATUS_2_NVM_ACCESS_MODE;
>  		break;
>  	default:
>  		drm_err(&xe->drm, "Unknown platform\n");
>  		return true;
>  	}
>  
> -	writable_override =
> -		!(xe_mmio_read32(mmio, HECI_FWSTS2(base)) &
> -		  HECI_FW_STATUS_2_NVM_ACCESS_MODE);
> +	writable_override = !(xe_mmio_read32(mmio, reg) & test_bit);

I was wondering if we should have another name for this variable...
perhaps read_only_mode... but I couldn't come with anything that
is global, so...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	if (writable_override)
>  		drm_info(&xe->drm, "NVM access overridden by jumper\n");
>  	return writable_override;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 0887d1912283..535325796067 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -416,6 +416,7 @@ static const struct xe_device_desc cri_desc = {
>  	.dma_mask_size = 52,
>  	.has_display = false,
>  	.has_flat_ccs = false,
> +	.has_gsc_nvm = 1,
>  	.has_i2c = true,
>  	.has_mbx_power_limits = true,
>  	.has_mert = true,
> -- 
> 2.43.0
> 
