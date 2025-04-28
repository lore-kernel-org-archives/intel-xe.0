Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CF9C369D5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 21:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997DE10EA69;
	Mon, 28 Apr 2025 21:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PgENQLRB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABDE10EA69
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 21:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745875068; x=1777411068;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GCzJC3YeLrhUwz3BEr7t5pvrwgFz8TXG72YggU0MUto=;
 b=PgENQLRBXt+OaA5KN4LbZ4LXIgoGxK8v/0wjcG/3NSBqZXcpsxPnRZBY
 Ow8XphRl4MPFKFX/SUwJTRa5TWIcevr02XVxh0mWcRvXvjRijHbFiZJ5f
 oHFA9O2fktddHXyaiGMotJPuZeLEXInLORW8FNrqfcU9YH5UPMFlEFx3z
 snN/UxtX1Cn7I4S7229jOhyoVPiT5OsQG82Wmy2p3uCU+YWX6PbbDwwWP
 5OTeekdLWT/Fb6fYJyMGEktuCfxdm3tpmhdYe2uDnVGADOB0kMBlggI+m
 14igkdOVXrRhF6DS9VTwE0O+JH5h7AQHbQuC0W+6NhNAn4fxgYXwV8Nw8 A==;
X-CSE-ConnectionGUID: oTeRLeiRTeGO02p1DCx1tA==
X-CSE-MsgGUID: rqmvMgArTES17gakpbEKCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47622304"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="47622304"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 14:17:47 -0700
X-CSE-ConnectionGUID: EMyIcuKiTuagWxijaceAiQ==
X-CSE-MsgGUID: 7Ff1b/vmSsGsBDVARmfhOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="138821124"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 14:17:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 14:17:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 14:17:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 14:17:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0EdwXk4f1QQvltcAVtTymVQ/SndbCnsOrBm+fRX0eho8P9hG8PeEExc5xcaV++jjo8LuSMZM6gHmDg9vQhPAFH5exYZ9w4kE2jPGNgNU9FJ88aNGg5IhT4zyvW/prj8EsuF5BYH1wVjW+8z+zLGS3Vll0Uccr2LArViWosL8EjaGbsYN6lhzN4RcLTOJKh6m4n376+UUtxjYlRatwOryX2QGgf6/UJz/al9DAJUkyVGQLud92sVxXEXUHYx8Xj2Rg14ZlNF4E89zNnbfsh4UgR0XYE5Y98cncsb52ZncrtiQ6cKFfE5cuZn1HyxJJPU6zIxbGWQSNvdllnFU873hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRkfdqNmUaFWRRArRYTvsKHEtYUXaOCiUEzUAOauYQM=;
 b=iN7hMfXAqsKr3NbvlSNhZKyfS6GBM/dsf1/zKh1PYlPDuECL4Jny4x5E//n562zBnFw+aE1sbXSj+YIPvP/8ZFcdZs4tuoUd+LoaeDaL5R29CkRBMWs9/FwRUlIz5oDo+hlE0+jxhzyylKi7BN6nhF57yTkgs8R8eASPHly8nNsHTL+LxG/vyiCk78k69a9ZDDMr29HUVnvLchIvbY6gRVKEUi6txKnbqd7rpN0GYsw9OcdD9EVIkafHmHEySjf8e3K/oIPmkxHKqRb+wAwhpfXmHe3SG3Howz3QJU9+dQEoVBTvrDxVyMpZnN6kFKfoj9uIX7+syy3AJS9CmG4J5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7258.namprd11.prod.outlook.com (2603:10b6:208:43d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 21:17:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 21:17:44 +0000
Date: Mon, 28 Apr 2025 14:19:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 16/18] drm/xe/svm: Add
 xe_svm_range_validate_and_evict() function
Message-ID: <aA/wy2hC6DDCitDL@lstrano-desk.jf.intel.com>
References: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
 <20250428103224.69534-17-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250428103224.69534-17-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ab5cfc-2ed5-4048-1d3f-08dd869a1dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UaYDWipN3Q0HvRlM6/Pi8TISGTbNNLrV7Y/2Wae4InjaUl3V0wnBXeZ44O66?=
 =?us-ascii?Q?ZkSLL7cNDS4aA9kgTwV/47IvuuOUgXykCucXNdvgCLJQjB4S9ihCV+8/v4ZX?=
 =?us-ascii?Q?h3g4LaP275o0172Lk21srzwyHrwZ0u/8QGf9/freVtmFLp8rKKj+OZsM0r24?=
 =?us-ascii?Q?r+uIbeYRjljLgDS0zQnEf7iVV7KPrqV8cxoofIhxUyaASknTyNpM/AVS0Xr5?=
 =?us-ascii?Q?C4F1sWHyiIYQ2nr3qSKZC3v92hBxx211cYBkLoCzY+0NZDi3gsp5qa1Ugv4C?=
 =?us-ascii?Q?qckBmkppqCz2s2AWNcIBdbcIY099cOM6WcgEg0Gi1gmrAtZtyCruybnk3kI+?=
 =?us-ascii?Q?3FkuJ0eMAeykzXK1E6Jio92Z5xb46THkEXYZZTqnshNYJDwhJ3jqW858fFsY?=
 =?us-ascii?Q?INNIPd7M3xvjdk11qONgcpDB7rvwwvUJ7886+z5TQwwgoetNGLMbGx3hQTyS?=
 =?us-ascii?Q?1wQGC1s87voqH9pFHKlWt1q3ZmwjlotRUJQf3gsfHgigHQ9s60hDL2ijq8O9?=
 =?us-ascii?Q?U0YMRvmABk5AgHuJeS34zN8SiWi7vuop6T1vLi3HC1SDXeiIvl4Dd13wEmrL?=
 =?us-ascii?Q?HhJJva6BxOVqmoA2CcSDYQwTw5S2pIhlIcbfoUuok9y5/+3Wxzdj+mD7rkhj?=
 =?us-ascii?Q?82cOsP33VnCFtqzKIo3xCNGtAZf2c1Mzr39G/N4qsVHuvrR2A67C4DORTLxz?=
 =?us-ascii?Q?6iucmCRojT28zV6b2zfS2fTaFFWfHbNStS/L2kVtyu5K89L+Ru0zfZAfv4rw?=
 =?us-ascii?Q?/ekQ5W0dRkoq6Y3VGcyIf1sJecnTJ/KO6D2A8R+NK+BGlEIo614uAmUcOzyI?=
 =?us-ascii?Q?zbWq0XlFdpqoQL4Qr63t00vBQVDaHFfOh4dNl/tCafq/pzV3oOuG/nresQI+?=
 =?us-ascii?Q?jL1o8C9Z7V8x5XFMiTknDZRAIDJ+8yIBZ+Aos8mtJV/qErNwwhNJRcyv73JP?=
 =?us-ascii?Q?GMlKU/sP2RnSJR4rsBM9TwLFQhFMYYjfpBQGj6VYgzRpYOcPLr1vCClSrUys?=
 =?us-ascii?Q?UskWSzy3MRkFx8CLBCCXkGC1UpRJv4QaaJOKWvTgZzJuuOvB5+H4zxy7CG2O?=
 =?us-ascii?Q?hrkPttgxpo4dt0wLc7BMYkouTae6O13F8l2RVOLxAZj9ffipPofIT2L2bJ4Y?=
 =?us-ascii?Q?gv0tLdlzOaJ+mJ5W32hWskNvNUbAmCE9ZuRd+xzTzkaIor5FRYAZ8n6OuM4/?=
 =?us-ascii?Q?5nQF5dAmcjP5PyzrxM1Xm5U2RaNyW8RbF5FPuNJYROS2bokMMefaPLbEJmsV?=
 =?us-ascii?Q?S/+j4LSn3PKAS7v0eITw6r08LBiBPJXBFqzAnrVqyd1CZkCtv0UEv6UBnsun?=
 =?us-ascii?Q?hRGqUCvi/8m5LgiL+8eBfrxZAUHc5ORtmOU03RmysJ9zh0PF2g0fsZ9ntDt7?=
 =?us-ascii?Q?NMJyZGs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oJoQW1B+QC7eCifP7J5ULZT3S7yb1VSWF/g+Mq84UukAHQRy6VjkgIfSgTfC?=
 =?us-ascii?Q?KHf7EX639bkqofDGzhMlUrwqL37jKKY3XCRMza2gPyhUkQS/O13wzlOcsBz5?=
 =?us-ascii?Q?KhzkomLevvLT+sG6dXXArdQLwxhjvGqq9g+SqtXj3MmXQp/V1HM8iBsoKO1x?=
 =?us-ascii?Q?hmw4KNzZ17WSnpkwzASTh0/6RnnRBnZg91uTgvGeJoL16g2GDG09DNk7HmSJ?=
 =?us-ascii?Q?ZMr0viZ4ozwsPcVgtrNcKXRPETB4vj6QMggaXfXHA+4FCO4KWGFY6IzwSNLn?=
 =?us-ascii?Q?DoeuEu0H58rtVM7CwEi82xt44lyDL0WJGVYWv4Wg2ZGL7qAuDThOPa9woS5V?=
 =?us-ascii?Q?9aZihA/dWrWCeIBMHkChhmTj0mumxYxXzqZ8NZrHKRRD+wokpBzbG2mAF2py?=
 =?us-ascii?Q?oFZ1vCQ4bUMWCJiaFCYqQ98JMWRnDp4CdIF10LPBZizZMcSKE7hQLOQdB+iF?=
 =?us-ascii?Q?gvL6cvnjwbvEgDQygS0rvruLgjCdSRwbW0yfQefRDkaGFXj2XX+YeROEcqwm?=
 =?us-ascii?Q?J8NwEWnNplSjuntmTtkCz4Fu9QcUm3WlI1YdgiywDQOCTlmiziNMh+kZINwm?=
 =?us-ascii?Q?ysW1zci9pf4fVP7/L5qNr9FJa4R/IEpKJDuJ4q8IvHE7CbWTJgyPQYZ+N/Za?=
 =?us-ascii?Q?uvvv6TapIeBD4DkHC9HNHEKiTbLwnAhSJ1w1H9t6zk6YdNTHxM8zCvgiAgY6?=
 =?us-ascii?Q?ro96o01zJjjmh6HsAeO7Aawwubq0w5jEUcGKAxsFa8dtRoLMBeC+R+fOg0ua?=
 =?us-ascii?Q?PJnlEgKrE+L0WxSxBA9GdRwr3/DavcQGyoOZEQ+OwPqfJhOVfmB5oTWbaxT1?=
 =?us-ascii?Q?2usZsCCa9yaoMAAQvSUr6ToMP+l6pOnuVfF8egOxDb+hR3n2WLvgnIOK2PJ2?=
 =?us-ascii?Q?5Ny+az0OIda0F2AEHC5725LCQwC3D+9uDE72csa3G+ziZTZAv2A891dzPihH?=
 =?us-ascii?Q?nyLFOUzg6lLWEdQMhqhKit4XxuabFBaQ/Dy9+/oxFsdRL1UmxEPBDozmNpO1?=
 =?us-ascii?Q?uDB4Fe/4AycmIuw1c6KB0mmPtEh55vcEt7UbcJu+zwOe/IMsBibw3BQiK37O?=
 =?us-ascii?Q?6o/49QMaDxeJMG+ycbnFabvRnfUEkzCA4LhQDhx2iyRUCYWo3A/2Kj0JG2sP?=
 =?us-ascii?Q?dnly74yWOEtDMDQ8864ag1ZL6yYE2YfHo3MPmaTMU/DcZlk1y7iVmH+WmEA+?=
 =?us-ascii?Q?ezJFPKvWJk+EVagphrjporRtC/6asBUlIFHubNQO/ro3KsLYwgAH7WdySrWH?=
 =?us-ascii?Q?t80xhRcfByuVThyCVxgCQ98+BQQTfG88yyeFv/ywQkVQ5qOHGtgNK7Qomasm?=
 =?us-ascii?Q?sXhnvfmAJGYQy60MsgscWW1NIMIBu/Xt51vSyFQT6CqDA+7DK20tTRdiUbxG?=
 =?us-ascii?Q?Isek+4a9pr6sQGWbIotUl651Pfj1Ykv/RqKWVj68UxpH6mLEHvMnhvXCEYpI?=
 =?us-ascii?Q?VONJ44r1jxrswPBSFeITZQsHsta3Su2r1S5AZi6kNSLQG1ivRupFzBeYKpeS?=
 =?us-ascii?Q?oIekp0BTWlQbjsX/QT1K/1o4PbhKKuZ2sC3T3W0xemwTVhkFYPiJ0tSPCdLT?=
 =?us-ascii?Q?Z4rYdeTz/3rZ5BMgaIe82Wv+pHCXNNNBw/MPZg7OtvhObQ6yRhdsvBGT+mDa?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ab5cfc-2ed5-4048-1d3f-08dd869a1dee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 21:17:44.3218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GoLJAgQX3YzWQrmTiu2FgAXEeZ6G1wgVsYCQMgEJwThrBM6kt89Qyj4IDzvFnrXxMcy5YmfXmF0iFAu/aoZchg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7258
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

On Mon, Apr 28, 2025 at 04:02:22PM +0530, Himal Prasad Ghimiray wrote:
> The xe_svm_range_validate_and_evict() function checks if a range is
> valid and located in the desired memory region. Additionally, if the
> range is valid in VRAM but the desired region is SMEM, it evicts the
> ranges to SMEM.
> 
> v2
> - Fix function stub in xe_svm.h
> - Fix doc
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 37 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h | 12 ++++++++++++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 90fae13b77ae..0e672e1e68c3 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -637,6 +637,43 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>  		&& (!devmem_only || range->base.flags.migrate_devmem);
>  }
>  
> +/**
> + * xe_svm_range_validate_and_evict() - Check if the SVM range is valid
> + * @vm: xe_vm pointer
> + * @range: Pointer to the SVM range structure
> + * @tile_mask: Mask representing the tiles to be checked
> + * @devmem_only: if true range needs to be in devmem
> + *
> + * The xe_svm_range_validate_and_evict() function checks if a range is
> + * valid and located in the desired memory region. Additionally, if the
> + * range is valid in VRAM but the desired region is SMEM, it evicts the
> + * ranges to SMEM.
> + *
> + * Return: true if the range is valid, false otherwise
> + */
> +

Extra newline.

Again this will need to be refactored for multi-GPU but fine for now.

> +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
> +				     struct xe_svm_range *range,
> +				     u8 tile_mask, bool devmem_only)
> +{
> +	bool range_evict = false;
> +	bool ret;
> +
> +	xe_svm_notifier_lock(vm);
> +

I think Thomas and I landed on we are ok with opportunistic checks
without the notifier lock here [1]. I think we can follow that here -
use READ_ONCE where appropriate, document that the checks are
opportunistic.

[1] https://patchwork.freedesktop.org/patch/649590/?series=147846&rev=4#comment_1189676

> +	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask &&
> +	       (devmem_only == range->base.flags.has_devmem_pages);
> +
> +	if (!ret && !devmem_only && range->base.flags.has_devmem_pages)

s/range->base.flags.has_devmem_pages/xe_svm_range_in_vram

Matt

> +		range_evict = true;
> +
> +	xe_svm_notifier_unlock(vm);
> +
> +	if (range_evict)
> +		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> +	return ret;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>  static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 9be7bb25725c..e6f71ad0b17b 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -83,6 +83,10 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
>  					bool preferred_region_is_vram);
>  
> +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
> +				     struct xe_svm_range *range,
> +				     u8 tile_mask, bool devmem_only);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -276,6 +280,14 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>  	return false;
>  }
>  
> +static inline
> +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
> +				     struct xe_svm_range *range,
> +				     u8 tile_mask, bool devmem_only)
> +{
> +	return false;
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> -- 
> 2.34.1
> 
