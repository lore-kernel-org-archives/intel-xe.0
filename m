Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5461C2BA1A
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 19:32:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E7510E4CC;
	Mon, 17 Jun 2024 19:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jpa6Iod2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E177310E4C9
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 19:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718652771; x=1750188771;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=g+7QVEx3SGrrSOvtP58KAfukv/4k3eqfSNmiDGxhN50=;
 b=Jpa6Iod25hSWnaXTE7DOUBYQ+D9RUNo5TOliIStubBsNhEITy8Z0OmTM
 wQ+v49TQbA26jm37XnTQNnQiTyPbUP43xlnJP0hJ8uWtfBk7YPQ9BrPjc
 iSjbXhz8/AQSZe2Pr10r9Cugc71dqw4gi1lbVV0vtXYMtl4/zlkD94ApO
 HrWd5BowoCwuDZr7heMNeFXefBQYDEAeF5yDZnJgDH6eX+RJ2Nr3q9AVu
 y8OY0nju5aw+o4TwmbL0IullGX+mtvdOjHI34WoHpXHZQ8q2ROmCniAGi
 TgCrwHsOWnON9+dhHm+FXKk9pGqyDfuRwFM8FDHT89U+irL23g6hPkW0q g==;
X-CSE-ConnectionGUID: OyEv6qNXSP2y5MtFaBesvg==
X-CSE-MsgGUID: xgBvXflXT1+GWi5AlHiM2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26618725"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="26618725"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 12:32:51 -0700
X-CSE-ConnectionGUID: hoPbIgp+SgGuPrY0qNKebw==
X-CSE-MsgGUID: h7Z4rfzOQlmDC7KoLMaiXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="45828296"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 12:32:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 12:32:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 12:32:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 12:32:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 12:32:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KboJIcU8RE/iP6vSZftYBvDwDkO1UgVIG2nIKreqRWGzSlXop3IRsUEsrYiHZU715M++qMJw5rxfJ5GbnJmxosrUJJY1Q2a6bCMtQehE6aWq3FbA5mAHAB2+2zrS+rihBp5d9q3WJkoGpTLd9nk2KiLnlGJFcSqvg/7BuB2Pok/UuWqtf14DrNBu5I573STw0tT6JJp2rSsPXOchW35aQBHqosbZniw9qnv12ntuII6PKCYJ97n4j8OOAEuDybiyT4lgGAyuwPStP5qxQQRT6WA4vYK+LklGiReBIzFHNpX4DMvxh4pBsiu1GlrAQ+agrhttaOmw8b25rQUkDAY5lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIoY3T656A/7pgGtPQlRmNVHzO5JeItVH69KbvYFqYA=;
 b=mXGJzJVQDJOtlxhuUKOM8lnBzvVJnIVPz9lEU6rtOdmeHkZGIPeLu9ZM/NyAYj1Bl41KUtECYXU7r8OiQJOm16fOEpVq8SlzZFfFMdwliBSDpwcnfIr3SjoB7qS2hE1KQ4AWG5HKtWRqnzcPtgFtvmnY1sMD4Qv5YmZsN/6Uk+eV7sKCSlvEhcZljpY5ZENbzXNC6OxzluAQavzKq2Tn9oBxpGW2LZ4HSuikXWO8Np5W6qCWdwOWEBRKxe28BRFi93DlNWk/04uTTzKxiwRS3u0hBRVNt+QcfBFGwBNwKWcl+HdVb0iLpDFFs1DvqUiKK84qN29NLzUZkWE6ODNQWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 SA2PR11MB4956.namprd11.prod.outlook.com (2603:10b6:806:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 19:32:47 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 19:32:46 +0000
Date: Mon, 17 Jun 2024 15:32:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/17] drm/xe/oa/uapi: Add OA data formats
Message-ID: <ZnCPWfF-7dfONsT6@intel.com>
References: <20240607204322.1966831-1-ashutosh.dixit@intel.com>
 <20240607204322.1966831-4-ashutosh.dixit@intel.com>
 <35b5e693-edf1-4924-85f2-56f3ba146206@intel.com>
 <871q5229zo.wl-ashutosh.dixit@intel.com>
 <11e9ad2a-7eab-400e-abb8-b3cf2f2a2207@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11e9ad2a-7eab-400e-abb8-b3cf2f2a2207@intel.com>
X-ClientProxiedBy: SJ0PR13CA0240.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::35) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|SA2PR11MB4956:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b88e87d-d9dc-42c8-1491-08dc8f0443d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XokWvwceGCh8Z15RgQ8tIns6Y23pWlumF0Ap0CH4mpgMoKavfaWXg9x/tz?=
 =?iso-8859-1?Q?0VRCiW073VjK46WTO0tSuQqCWfJCKGAYK2LBNZv8+psatZpD2YoDmpntBw?=
 =?iso-8859-1?Q?CwRDpOFbDsFCOoAkldOJlVc0db1JTtVf7d9LMJQY7OWaCed8dhX3s1CPLx?=
 =?iso-8859-1?Q?Se1XNXShx4FweY+Q7cEEqD94t9CA/7eZhuBk7+1M5EuzJg46K7Z9aWZwpH?=
 =?iso-8859-1?Q?y4OLiKNCvF/VIfFW4VW4KEkNMcV/v1sk8ObO0UlGVp0n86I9UuTc3Wofb0?=
 =?iso-8859-1?Q?dt7QjCXXon+disLMVpt+/ccDFW4lyKe/svGeERcQCjoCueG+mU4n2guw8t?=
 =?iso-8859-1?Q?yp35OjEb/dckkin9M7jJeQc0za3IFWklC/CYT6fYnRx5qheH8g7eCs2xCT?=
 =?iso-8859-1?Q?WcKCtHFvBWbglF+WWJOsK0Zyp2iLZ+uHWlgi2nCysGbgvAajKaQjDsCX3B?=
 =?iso-8859-1?Q?NMV0gPJFao9P8v7mpiCJeSv3oegg2aWdkcH73VFLolYrUqy2vYp+WzvSl6?=
 =?iso-8859-1?Q?vjAcPRePJBIVbwLSf1kgv1U3ZjX1MKaxmFyVYn7mfebNyxX1lpFZvnYdR/?=
 =?iso-8859-1?Q?b1H3J0C9meZnqfNS5yWKnGM+PDLLcsL8rEJ5DgoziDpq0UYNKsbf3O0n92?=
 =?iso-8859-1?Q?iXNlNegu3uAOCWi2pIDhEXteB5Thfc6YVYe25ST/MERG+G6xSydLuJL3MG?=
 =?iso-8859-1?Q?Bjl2CXydcakjZ/z8dkYGlrpRqZzpUrFxU17JiHb83JeLoSoGvaCe6gIEi3?=
 =?iso-8859-1?Q?24cCD5xHQeOoWCeUVImkmppgdW3apTPC4egkEiSrlFOUfNcQdJbW+F73iY?=
 =?iso-8859-1?Q?d5Pk+WRSPW3nPSVrffruct/Bn/nGEcboXTZSlwVG8hRIlKTNSfjA6kwO7s?=
 =?iso-8859-1?Q?UE5TLU/Y2FaTifdruBWfYB5KdImr5d4RG0VMs4WJmd1nd8J4KrWLB0H43i?=
 =?iso-8859-1?Q?WGV7csPcycQrzozKjjbCTsfczeSqhDaqkFdPkOWCh3Pu7E9/Ax+9fn/jM4?=
 =?iso-8859-1?Q?y1hFgQlxbk/Au1oEauNGb65kYNFehO5vITB40I8qimAylb2Lz8Q+CjV8Mb?=
 =?iso-8859-1?Q?P5x9BjQW70w/eHbWfudpnEFWDTVAa0Ba0G3/Hgs0PqtbuiMVW8XmPZbDZX?=
 =?iso-8859-1?Q?KJP8CqCzfY8pGL7H1CWTrIQ5nIi1HVA6H3kysji/L5t0Ulr1JBaRYoaJRo?=
 =?iso-8859-1?Q?mTr2DUBhR92nPSm7R9QByDb6gqaSkYocmUt+R+vTNoY+uN6g089BZDzJBN?=
 =?iso-8859-1?Q?2fpUSQ7l6iODMCuHudCq6ShctxARUQyCMrjTCpdu+ek6I75FZwbz3UovWU?=
 =?iso-8859-1?Q?MDQOTPJGPqTwZNCJYxjq9X5IZkGOigcX1VjuDnajZkKmjAQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?t0Z5MLbpyjAW4po7XqvaRplmcH8QQpTf7tMP8n+SXBZfF0W/HFlOTV1YUp?=
 =?iso-8859-1?Q?czXUO3phTthvDQTPc2q1aZeakZBa+ngpqKAoleraADjr/3CwvxrdEjZMGV?=
 =?iso-8859-1?Q?vJkgBUzyd7rUVxz0xjaWASAK0LCHv5z1VSDO1PGIwROEQl8XAb+gbMUycx?=
 =?iso-8859-1?Q?Y/2vvGmUQYFwrTKULwZJptDw5QePWR4C8So6echS7Nij5Om9De49F/40a7?=
 =?iso-8859-1?Q?gA2CjLa0S43fzXH7xTuoSxbEpW8rj8ToyYdmKe4kKH4Xnt/mYMd+854SZ7?=
 =?iso-8859-1?Q?wXadFoL+DGi43tjIcpXqcuHtGooeUTtDdO95kh/xjZ3X4RYrvGJSm2+rPg?=
 =?iso-8859-1?Q?Xi7qZqzZaCvRJ++mkyeaHCLX9FViGNNFrhPBGsBiuD61NOIXIDOjt5KEYE?=
 =?iso-8859-1?Q?N/da2yANbFik+MgjKaGIWyO/iYG66PpAPEsj67EZeyECrUq+gUgorzl4u4?=
 =?iso-8859-1?Q?cSMiH5ECnWw3ibsd1JQZoPlX/V38K5I9ZJp1Pv2dl9nrd/WE43ZifHVNrt?=
 =?iso-8859-1?Q?NU0qYZRn6Zv3ztmEyooeh1XNIDBBe6nHCtI4NqogI+eXvzGBv/jCsoux2f?=
 =?iso-8859-1?Q?eDfhKsZ1nk4Xu//JM97/LFRELUbWlQefvMFKgD7RxT/Kn99X16tRQXAmyl?=
 =?iso-8859-1?Q?SjIvsMhPwwbxXywC8NUTOlLVppZ1hfvm+0K+ArKCksrzf9+eyjg/URyeRV?=
 =?iso-8859-1?Q?Pwgv+SWEaakUhiM3xi72+p1KFO+p4ZNzov9uE7PPIAKpxulzalCHIvehQL?=
 =?iso-8859-1?Q?GIMYvFhvi1SFDUt3mzCDNFSlGi5cdirWQbwjotIpv71GCShJa+/M2CV0Ex?=
 =?iso-8859-1?Q?8HEAwTjKbXjvK9fr0/wnU8/AIX46dpzp2D7jVtV9AF8oyp3FWP8rPU6wJS?=
 =?iso-8859-1?Q?HIOBuZx0EXJWMbx+ZPbQAAumt6Ollq3mQNFKyXJW2+YGiWGQ7b/NEGONpO?=
 =?iso-8859-1?Q?Jn2Grg/NBwsit3wE7M9sP9QfQREGBZLWy8k/588sqNQFPUcxnNA0QfpIHu?=
 =?iso-8859-1?Q?niQYvKle6jj7X7wxxgFGpUYgjEVmCAcQbiUiQULpLRar4QSg+wW0RAxbbZ?=
 =?iso-8859-1?Q?W5jb9ZqoWLDDrwgXIGOARpkJWympBXgqe3yq0to3bNXKutGRkdqeAPiFyI?=
 =?iso-8859-1?Q?KYVfRWhe+QE+h9Uws1OI8CItoZ+q+DcRqhSPZeNdpoTfx6KmHzBPynZp5D?=
 =?iso-8859-1?Q?3Q2qxdNJNsG/6dwYmZ7lFYvX2Ma5UOl3b7OOrzo7JYCaI3Mzw9CKTlml6n?=
 =?iso-8859-1?Q?VXWCTK/T7SxRxYDN4EZEU5xuluZoqZAjs2tGx7UqCC9XSnhNHWQj1ZXc6o?=
 =?iso-8859-1?Q?WguDWI/sIoOBL4FRy/ggngl9hSTTCC6ArMC+fL8F0Ma+feTgrlQtFYLhKj?=
 =?iso-8859-1?Q?x2uK+yMvXWsory5jcSoPbDqHwbCKuX3+w/9tRbMeWqd7/nWHL85dTc2niw?=
 =?iso-8859-1?Q?BFjtiXSqlR7ph9LYIyPIaX4EL+nhdXYbEeb03c66vTaSTzTfYy716Vpy24?=
 =?iso-8859-1?Q?Lr25Js5BfhQHwDcOM6k9YS2BpX3Jsjvxyuklsj83gQPfSa8+URfkmoePPL?=
 =?iso-8859-1?Q?Mz7fqxvQWUlKJABjH8RsJWmdOjR13DaowJKVBN8V2optIkG4weVJRdpq/o?=
 =?iso-8859-1?Q?3B/LIw/oCBuBuieBNSBs38zcAhQ2c1NjtS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b88e87d-d9dc-42c8-1491-08dc8f0443d7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 19:32:46.6283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F03MYgngXE7mjXrPJmyQtUhOoI2QoeTi8aiUCLPTmzzJ/3gWFPVs1nQxeJkgcSis9+PFgNtFlCL+NpZgJGIJXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4956
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

On Thu, Jun 13, 2024 at 05:39:48PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 12.06.2024 04:03, Dixit, Ashutosh wrote:
> > On Sat, 08 Jun 2024 03:54:16 -0700, Michal Wajdeczko wrote:
> 
> ...
> 
> >>> diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
> >>> new file mode 100644
> >>> index 000000000000..a2f301e2be57
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/drm/xe/xe_oa.h
> >>> @@ -0,0 +1,16 @@
> >>> +/* SPDX-License-Identifier: MIT */
> >>> +/*
> >>> + * Copyright © 2023 Intel Corporation
> >>> + */
> >>> +
> >>> +#ifndef _XE_OA_H_
> >>> +#define _XE_OA_H_
> >>> +
> >>> +#include "xe_oa_types.h"
> >>
> >> don't include full header if you already have required forward decl
> > 
> > This one is unrelated. xe_oa.h is included in other files such as
> > xe_device.c and those files need declarations in xe_oa_types.h. So I have
> > left this as is. This is the same pattern as followed e.g. in
> > xe_bb.h/xe_bb_types.h, xe_bo.h/xe_bo_types.h, xe_device.h/xe_device_types.h
> > etc.
> > 
> 
> I didn't know that we have that pattern defined as BKM, usually extra
> includes are defined only if you provide some inline helpers that would
> need them, so I would ask Lucas for opinion here

Well, I don't have a very strong preference here.
In general we shouldn't include header from header, but I don't see
an issue with the header including its own 'types' header.

Perhaps for consistency we should avoid it and then come back later aand fix
these mentioned precedences here. But since we have these cases I would also
not block if everything is ready to get merged. Then we can work on a follow
up fixing this and the older cases all together.

> 
> Michal
> 
> 
> >
> >> +
> >> +struct xe_device;
> >> +
> >> +int xe_oa_init(struct xe_device *xe);
> >> +void xe_oa_fini(struct xe_device *xe);
> >> +
> >> +#endif
