Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2E6CCD185
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 00:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DAF10E90B;
	Thu, 16 Oct 2025 00:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XkAtG2r+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA7E10E90D
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 00:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760574649; x=1792110649;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pboz+QugIpYkD4cBrWdFKUkyvek36vZ7haGZxIeVBGQ=;
 b=XkAtG2r+zKM6r+Nd5mAOdjxvrmmlsHI9yAgFU6vnes/A99GPRhd5CLg+
 oFxMf2gkNEPnrdQ55dAkpuqDZQLC7JG9E/nZS8m4erXt3rfRA9Cp73pri
 jEjYw9xepFdyg8kQ7qFcxmwJJhXCy1hhjSKotJalxTz/4pPyW389kCl9A
 cRGkK6o3dd5scSxfgcPP/Yfxp0WEFixR8UaZGYnixkU+rvQVTSLO6obhI
 UM99bLhUhg1o8AGVb+ze2v5JipMUcNHqmB0joqSY31LO/vlxnkUTuxMqT
 aaufGaxYFYf7zsC9MhhE9KETbfiwtbDAJq3+xd2ZQkHF0IrfS5yDntldT Q==;
X-CSE-ConnectionGUID: 899mXQMbSXGu/HRbQ915nA==
X-CSE-MsgGUID: EmhsXj5iR++U4GIeOFfoPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="80394310"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="80394310"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 17:30:48 -0700
X-CSE-ConnectionGUID: g94bjC+uRHO6PHUnpNvZYg==
X-CSE-MsgGUID: 7KZe5BXlTEmo/zddbiKvvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="206012918"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 17:30:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:30:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 17:30:48 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:30:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CX+mf0WSPcVuWd7cofew2MxkNu93Y//AC3t0hI5wUiKYtXW8U8rmHxOmjX0EdHTlWet8Mnlcf8Cyq5AV0vaLP4XmZr8Rjr4y4JEg6CFPiUt5NjE0V2vf7b97iTZbARz12EE0q4dj5EXLtn6aReLJD2WSlvgC79sjnaslzKI/A/QU6n0kUyt0j3ougqEy/9l87OZmlR9F/v7T97D0aFd5LCmLGDayFrNRLC3M8UE4APLHCVrAry/QhMt4ZNeJUkrVETfD7XQbBhPRwBPSP4TI6llGXX4HOeNs9S2BJ3LCuf85uvfc6nUnprXYhF9WytACMcpPrtqDyXcT+P8/N4V65Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfYthxgJCkMaJySeQ9hYswzYLOSXK7sv2JPwqYGeCLc=;
 b=yZIusC2UZ+2gJhwrR2jGlgUVFkwDDde2affXGujmGlG46o1JwjxfrL+eD6mohl4SazOfbn1l+kezPT4S7MOJXXo2Z5ao6U5uvHCwT92iZQRPkZxbz+Ycbz6iTU+6A1G/pH9kj/duYCwBZZj20NjAdISNaktpNUMCqbOO41ZGu0sGw836hzKcvzENjAz7emfQrKjjztTtGFvCy7pMjQ1FIiDRakToqxOoy5fZPbwbfZRicSGMdHNk9WW4O9l5ZzCSYf4GPHoNvJFH4eCcVhqactIMgN+6Gl8VKlXXCyDJ6gEl1GFtPMcZKUUhLLJXjtuPpJ5tCEl4Ca7Q9MAbL5SNlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV1PR11MB8820.namprd11.prod.outlook.com (2603:10b6:408:2b2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 00:30:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 00:30:39 +0000
Date: Wed, 15 Oct 2025 17:30:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 09/12] drm/xe: Rewrite GGTT VF initialisation
Message-ID: <aPA8reaWHTP/zJM+@lstrano-desk.jf.intel.com>
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-23-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015074708.1654014-23-dev@lankhorst.se>
X-ClientProxiedBy: BYAPR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV1PR11MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee8792f-1f0e-4079-31b1-08de0c4b3b50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/tUnNwHy9BDOTztdRC2ZyfVAWrkApJ+486PSYE9ABDfKB4jbtZxF7oW35ZAP?=
 =?us-ascii?Q?5ljfq6oGDSxAeT+bzGDsg/l9OLFDic55xeyKN71IhhbMt9oeL1r7l+wOek4w?=
 =?us-ascii?Q?mqzQVAhLfToZ7XIj47EGA6apt/m/OYApONrXtI2SuNPBZBXQn82udbKOSpwc?=
 =?us-ascii?Q?w/9Vw6mjPQJ6q1I+3ZFWjVLkiVG0vNlqy5dxQZd/6BTJqAEGyf7PhEn4m9lI?=
 =?us-ascii?Q?mqYdVFs52QzkcZyAexq+l5Sp0g6+IUc1iueFnAo7ytq+xHZNbVinNBRAQVsC?=
 =?us-ascii?Q?dHXCVcCEctASdmXZL8nUJX+V6lo0bNk7PuykL/IpJEbxVrlJN70/5ou0Y1S5?=
 =?us-ascii?Q?HtvM5Z1HixzqRAgTfgmu9U4bDELfsClehdD8jyzvvvZOTjN6L6L6E+toM47t?=
 =?us-ascii?Q?Vft/5LgOof3M6r9Sbvi4ahXbKNYo33AUdJjeHsMOaUOjU87GaDR02FuiZWvQ?=
 =?us-ascii?Q?aj6UZY5OAnTzJqDm3cDbmDM0oYPTlnvwy0MKIirUOe3ysyu+6+NA71Tx9NeO?=
 =?us-ascii?Q?mvElLanFolE2W5WuCNELhhD6Wlssy7RQYce/4kNur8oZC6OnIjRrP+ocu4JI?=
 =?us-ascii?Q?pZkQTdOmvwy16+Csg77z/sTTRk5H/Z4lksiYjhBmrx0kCMvAfZvflEsyY5iu?=
 =?us-ascii?Q?9GzNy6mdPqZWAG10HKsoeD4OgN7aL611h519djw/QYJVNdrgaO60BwpNReHy?=
 =?us-ascii?Q?aZF6PHZf8rWCGkW4BkCUu2WMILtMXBsKNjBeUWXoX2VIP5b6DqzKf6X9X0fj?=
 =?us-ascii?Q?UOQt/T6JpbyI3L036T2e3dcug3Mc9f5dxFYjy6KTMsX4oaS6g6z/Se+uG+D0?=
 =?us-ascii?Q?mFD0zVajBJdhKI0qsUlaf9DnkWGkGGHGxxh7cwG4v7iOGiYVyizLy/785j/i?=
 =?us-ascii?Q?2GBMTcUDaU5vUXyR0bDGLzYW7pYZBw8z2uGdXlnvGSLN7VJZFNHBjVtNSyHp?=
 =?us-ascii?Q?a19DXX52DlRGk3nj3x3t5ahE6DlpY0Dku2HasdXaKmw8vLdi9WVTN0hOmlio?=
 =?us-ascii?Q?XPIZYPJVkTFFwvxrkOQshl1fTuMIWEqxgjeVn4cvzLe2FXGX1YhrmyAxBcfP?=
 =?us-ascii?Q?TCTciSYKROcV/f3FdyRsf6DK1CuLhx+grPb9J5mWvfiD3VxFFTTph/9M946d?=
 =?us-ascii?Q?xk2MaQLV+JFMHq7gRLakxKDK6Cey5vKBKyQQCMDd1fa6M/yvXBa7mKqBE2b6?=
 =?us-ascii?Q?YpQCHQksCHxKwPdxkt6l+xfvxaYNnyjVzQGTA5ppKhe4NI/YV3McHhWk6In+?=
 =?us-ascii?Q?Tys6ktccr2Ua+obL2bTd+25NDjN4cuDwq3oezJ3Vq6ptFj0QaLiLD2rVIPr6?=
 =?us-ascii?Q?x3nWayqQSFI9FdfZ1FpysfRz8yoGAPWMfWx4tFgSnmF50252409JzMWg9ee/?=
 =?us-ascii?Q?qQj2N4X3DxtHtYIjJwWlWzPSSXFW0a7cX3WIkABBSpNo1BlLe8ujZJBPNW5O?=
 =?us-ascii?Q?RWlnvzPbEWxpL9d7Mx4qZEZtUM+1QV8f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OXVBvTg2zZKhTVDuEM0JM8MPF+dCB3eiVwgmavtuaVOc/lMTu32848hE0rO2?=
 =?us-ascii?Q?aj8lH70ZnO6KTS8fmEIriEfuOWblKTjRbguQyEf1MxyFBIEMn/fmsjg3eDXJ?=
 =?us-ascii?Q?/dzra75A+Je52bPFIAwYwCnrufk6PnR1Zg//2DuImPFAN5IeKY0YTliHBvTg?=
 =?us-ascii?Q?rtUYkd5l+LBhJdCnLW3qGq1haM0p5dHfdt5tW9RPD7fEcxtVji+2dpbX4uDD?=
 =?us-ascii?Q?eHo2+ZNIyUEXrmD1YegDqevSFUsxImrcMRHHx332/ehd5ZIz7Q/8PwCzn3Ci?=
 =?us-ascii?Q?s6M+QyHKcYtS3LkiaQU9u7GQIAA3HXDiE6xcAIPW8mV+wEsfriR/HfKAer0E?=
 =?us-ascii?Q?pY8P1FSSIpvHpq1Ty0D5v5GpmrOmAnGNHvg8DkbDuGaSjvldHRqjLrkwcN7R?=
 =?us-ascii?Q?iQ8v5SYJ7osrVqa1WWG58fDLSTzJEIMk+kN8GWlglcNhhlEAqexF5iBfoI/W?=
 =?us-ascii?Q?nKW56XKjrVPhcJaWw5nnus6z3/cvCB3io50Sg/U4PPmf68iV0ZvC+x6dByA1?=
 =?us-ascii?Q?4A2aaVEYIDxiwvpXpcXy5mnK9mBWgSS9/VWTKXYlf13Bq7v/Cn6bZHHJmoNX?=
 =?us-ascii?Q?WmwwWl2Fo1YaQNyV8UHCUuaTnm04SSQ9+ifNdL9r6ynT7u1D2XTcR4G2KoT2?=
 =?us-ascii?Q?GZdApvONAzQ38HeX1xA4EkF3SSTlghmgMvC3t2nkb+peK+8bd+twSuh+8/NY?=
 =?us-ascii?Q?i3+8/gIztY86kU8fOGOwC39yEgKIMdO1IZQR7RlW+9r1OjFNM7BNitD/5NvS?=
 =?us-ascii?Q?bO2j9l418991uKika7xQogrA+ZtAyImutBq5be1SZKUEPiWRxK9iv0cwyVJl?=
 =?us-ascii?Q?f4cTTWqBof1K2ph59OH3IdAu/Sdtj14lmdDC41LjHtFphvEpbYuoglpqnHg6?=
 =?us-ascii?Q?i6iGqY5prXF2LeQqzgFi3eoDPRyASato52/bwn97H9R9E015GFuXPzVi63vj?=
 =?us-ascii?Q?MOK2qNYDVMs6kwdAMrAJBRfVCJnn7yxOzNW/ZjPDLcixVFYviU5hkcDbLdpS?=
 =?us-ascii?Q?1tObyS4ZtnswbOgDcnTz3Nuxvxa6oeibShaBMvMVcjnZt8bx8E56iKAKSThr?=
 =?us-ascii?Q?URyO2CgT5gHcWkdc76KotwE3rrHHaQCPOB2b1NixxqBZGnz3nruZG4nCONGi?=
 =?us-ascii?Q?y3dIliKURmrO77MxTQbVSEmZyYFfb+NSRfoREW3jotC7o6DPaB08A2cJm3AW?=
 =?us-ascii?Q?dee97Zy0i7WSGRZPrNVS4ek+kYhJSHLqi4aaLjeRME9/4gEMtB4qK8nkzKJj?=
 =?us-ascii?Q?xO57py4VXgfdihlS6oYzHAtfSdd4MLUbRRCNl7CaNSCGFiDCvkb8Y7trYumE?=
 =?us-ascii?Q?/ArzzGqS2YRLAlVv0QkOFyv3cj4An4UJZ9bUYdXtpDWl27ACsD/iqv8+r6G8?=
 =?us-ascii?Q?vzCDeVlIL7XFkCy3/uy1Ux9njMgMCivKhysbcystKDg1Bm9HcP5uNn/cGYNK?=
 =?us-ascii?Q?clNmW4DfHM0y2qVOhYjmg7GT1M8wuJ3VAj3LRu1sTqF/97xVVV7Nl02HGybf?=
 =?us-ascii?Q?x/z4OyW7dMJeia09gXgOvdSUwIbpU5ONkSDn1jBWjcQ95OyktysxKg9eFsE1?=
 =?us-ascii?Q?0Ixd5o0aU4lCUnFeARyxhupBpuYH8kSqiA8BTLpaQZBcPPmI0l6v0P8TCI0z?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee8792f-1f0e-4079-31b1-08de0c4b3b50
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 00:30:39.2536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8srBd8HF35p+POmMJLdqp5f+XsQBM0Cl2Vf/99W70b8GFKfxXcZ6bg92oBZL029fFQuB3ljCtdVJiLyFjtFYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8820
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

On Wed, Oct 15, 2025 at 09:47:18AM +0200, Maarten Lankhorst wrote:
> The previous code was using a complicated system with 2 balloons to
> set GGTT size and adjust GGTT offset. While it works, it's overly
> complicated.
> 
> A better approach is to set the offset and size when initialising GGTT,
> this removes the need for adding balloons. The resize function only
> needs readjust ggtt->start to have GGTT at the new offset.
> 
> This removes the need to manipulate the internals of xe_ggtt outside
> of xe_ggtt, and cleans up a lot of now unneeded code.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Co-developed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |   2 +-
>  drivers/gpu/drm/xe/xe_device_types.h        |   2 -
>  drivers/gpu/drm/xe/xe_ggtt.c                | 158 +++-------------
>  drivers/gpu/drm/xe/xe_ggtt.h                |   5 +-
>  drivers/gpu/drm/xe/xe_ggtt_types.h          |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |   5 +-
>  drivers/gpu/drm/xe/xe_pci.c                 |   7 +
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.c       | 197 ++------------------
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   4 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h |   4 +
>  10 files changed, 60 insertions(+), 325 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> index d266882adc0e0..acddbedcf17cb 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> @@ -67,7 +67,7 @@ static int guc_buf_test_init(struct kunit *test)
>  
>  	KUNIT_ASSERT_EQ(test, 0,
>  			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
> -					   DUT_GGTT_START + DUT_GGTT_SIZE));
> +					   DUT_GGTT_SIZE));
>  
>  	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
>  				   replacement_xe_managed_bo_create_pin_map);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 02c04ad7296e4..a05164cc669f9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -192,8 +192,6 @@ struct xe_tile {
>  			struct xe_lmtt lmtt;
>  		} pf;
>  		struct {
> -			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> -			struct xe_ggtt_node *ggtt_balloon[2];
>  			/** @sriov.vf.self_config: VF configuration data */
>  			struct xe_tile_sriov_vf_selfconfig self_config;
>  		} vf;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 1c97a06424b5c..3b7f6a8dca242 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -38,8 +38,8 @@
>   * struct xe_ggtt_node - A node in GGTT.
>   *
>   * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
> - * insertion, reservation, or 'ballooning'.
> - * It will, then, be finalized by either xe_ggtt_node_remove() or xe_ggtt_node_deballoon().
> + * insertion or reservation.
> + * It will, then, be finalized by xe_ggtt_node_remove().
>   */
>  struct xe_ggtt_node {
>  	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
> @@ -337,9 +337,15 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  		ggtt_start = wopcm;
>  		ggtt_size = (gsm_size / 8) * (u64) XE_PAGE_SIZE - ggtt_start;
>  	} else {
> -		/* GGTT is expected to be 4GiB */
> -		ggtt_start = wopcm;
> -		ggtt_size = SZ_4G - ggtt_start;
> +		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
> +		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
> +
> +		if (ggtt_start < wopcm || ggtt_start > GUC_GGTT_TOP ||
> +		    ggtt_size > GUC_GGTT_TOP - ggtt_start) {
> +			xe_tile_err(ggtt->tile, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
> +				     ggtt->tile->id, ggtt_start, ggtt_start + ggtt_size - 1);
> +			return -ERANGE;
> +		}
>  	}
>  
>  	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
> @@ -364,17 +370,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (err)
>  		return err;
>  
> -	err = devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
> -	if (err)
> -		return err;
> -
> -	if (IS_SRIOV_VF(xe)) {
> -		err = xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
> -		if (err)
> -			return err;
> -	}
> -
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
>  }
>  ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
>  
> @@ -526,119 +522,29 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
>  	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
>  }
>  
> -static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
> -			      const struct drm_mm_node *node, const char *description)
> -{
> -	char buf[10];
> -
> -	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> -		string_get_size(node->size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -		xe_tile_dbg(ggtt->tile, "GGTT %#llx-%#llx (%s) %s\n",
> -			    node->start, node->start + node->size, buf, description);
> -	}
> -}
> -
> -/**
> - * xe_ggtt_node_insert_balloon_locked - prevent allocation of specified GGTT addresses
> - * @node: the &xe_ggtt_node to hold reserved GGTT node
> - * @start: the starting GGTT address of the reserved region
> - * @end: then end GGTT address of the reserved region
> - *
> - * To be used in cases where ggtt->lock is already taken.
> - * Use xe_ggtt_node_remove_balloon_locked() to release a reserved GGTT node.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64 end)
> -{
> -	struct xe_ggtt *ggtt = node->ggtt;
> -	int err;
> -
> -	xe_tile_assert(ggtt->tile, start < end);
> -	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
> -	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
> -	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
> -	lockdep_assert_held(&ggtt->lock);
> -
> -	node->base.color = 0;
> -	node->base.start = start - ggtt->start;
> -	node->base.size = end - start;
> -
> -	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
> -
> -	if (xe_tile_WARN(ggtt->tile, err, "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> -			 xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + node->base.size, ERR_PTR(err)))
> -		return err;
> -
> -	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
> -	return 0;
> -}
> -
> -/**
> - * xe_ggtt_node_remove_balloon_locked - release a reserved GGTT region
> - * @node: the &xe_ggtt_node with reserved GGTT region
> - *
> - * To be used in cases where ggtt->lock is already taken.
> - * See xe_ggtt_node_insert_balloon_locked() for details.
> - */
> -void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
> -{
> -	if (!xe_ggtt_node_allocated(node))
> -		return;
> -
> -	lockdep_assert_held(&node->ggtt->lock);
> -
> -	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
> -
> -	drm_mm_remove_node(&node->base);
> -}
> -
> -static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
> -{
> -	struct xe_tile *tile = ggtt->tile;
> -
> -	xe_tile_assert(tile, start >= ggtt->start);
> -	xe_tile_assert(tile, start + size <= ggtt->start + ggtt->size);
> -}
> -
>  /**
> - * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
> + * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
>   * @ggtt: the &xe_ggtt struct instance
>   * @shift: change to the location of area provisioned for current VF
>   *
> - * This function moves all nodes from the GGTT VM, to a temp list. These nodes are expected
> - * to represent allocations in range formerly assigned to current VF, before the range changed.
> - * When the GGTT VM is completely clear of any nodes, they are re-added with shifted offsets.
> - *
> - * The function has no ability of failing - because it shifts existing nodes, without
> - * any additional processing. If the nodes were successfully existing at the old address,
> - * they will do the same at the new one. A fail inside this function would indicate that
> - * the list of nodes was either already damaged, or that the shift brings the address range
> - * outside of valid bounds. Both cases justify an assert rather than error code.
> + * Adjust the base offset of the GGTT.
>   */
> -void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift)
>  {
> -	struct xe_tile *tile __maybe_unused = ggtt->tile;
> -	struct drm_mm_node *node, *tmpn;
> -	LIST_HEAD(temp_list_head);
> +	s64 new_start;
>  
> -	lockdep_assert_held(&ggtt->lock);
> +	if (!ggtt->size) {
> +		xe_tile_err(ggtt->tile, "Asked to resize before xe_ggtt_init_early()?\n");
> +		return;
> +	}
>  
> -	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> -		drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm)
> -			xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
> +	guard(mutex)(&ggtt->lock);
>  
> -	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
> -		drm_mm_remove_node(node);
> -		list_add(&node->node_list, &temp_list_head);
> -	}
> +	new_start = ggtt->start + shift;
> +	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
> +	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
>  
> -	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
> -		list_del(&node->node_list);
> -		node->start += shift;
> -		drm_mm_reserve_node(&ggtt->mm, node);
> -		xe_tile_assert(tile, drm_mm_node_allocated(node));
> -	}

Ah, I see where this pairs with a READ_ONCE. Can you add comments to
both the WRITE_ONCE / READ_ONCE indicating where it pairs with? 

> +	WRITE_ONCE(ggtt->start, new_start);
>  }
>  
>  static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
> @@ -679,12 +585,8 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
>   *
>   * This function will allocate the struct %xe_ggtt_node and return its pointer.
>   * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
> - * or xe_ggtt_node_remove_balloon_locked().
> - *
> - * Having %xe_ggtt_node struct allocated doesn't mean that the node is already
> - * allocated in GGTT. Only xe_ggtt_node_insert(), allocation through
> - * xe_ggtt_node_insert_transform(), or xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved
> - * in GGTT.
> + * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
> + * in GGTT. Only xe_ggtt_node_insert() will ensure the node is inserted or reserved in GGTT.
>   *
>   * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
>   **/
> @@ -705,9 +607,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
>   * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
>   * @node: the &xe_ggtt_node to be freed
>   *
> - * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
> - * or xe_ggtt_node_insert_balloon_locked(); and this @node is not going to be reused, then,
> - * this function needs to be called to free the %xe_ggtt_node struct
> + * If anything went wrong with either xe_ggtt_node_insert() and this @node is
> + * not going to be reused, then this function needs to be called to free the
> + * %xe_ggtt_node struct
>   **/
>  void xe_ggtt_node_fini(struct xe_ggtt_node *node)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 4a8ef1b824156..dd321261bd599 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -19,10 +19,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
>  
>  struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
>  void xe_ggtt_node_fini(struct xe_ggtt_node *node);
> -int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
> -				       u64 start, u64 size);
> -void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
> -void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift);
>  u64 xe_ggtt_start(struct xe_ggtt *ggtt);
>  u64 xe_ggtt_size(struct xe_ggtt *ggtt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index 31054e00daa6b..2058082234591 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -59,6 +59,7 @@ typedef void (*xe_ggtt_transform_cb)(struct xe_ggtt *ggtt,
>  				     struct xe_ggtt_node *node,
>  				     u64 pte_flags,
>  				     xe_ggtt_set_pte_fn set_pte, void *arg);
> +
>  /**
>   * struct xe_ggtt_pt_ops - GGTT Page table operations
>   * Which can vary from platform to platform.
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 46518e629ba36..dd3cd7f140cd1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -442,7 +442,6 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  static int vf_get_ggtt_info(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  	struct xe_guc *guc = &gt->uc.guc;
>  	u64 start, size, ggtt_size;
>  	s64 shift;
> @@ -450,7 +449,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	guard(mutex)(&ggtt->lock);
> +	guard(mutex)(&tile->sriov.vf.self_config.ggtt_move_mutex);
>  

Again a small helper to return mutex rather than reaching into another
layers structures.

>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>  	if (unlikely(err))
> @@ -480,7 +479,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	if (shift && shift != start) {
>  		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\n",
>  				 shift, start);
> -		xe_tile_sriov_vf_fixup_ggtt_nodes_locked(gt_to_tile(gt), shift);
> +		xe_ggtt_shift_nodes(tile->mem.ggtt, shift);
>  	}
>  
>  	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 24a38904bb508..1a799e6bd4bcb 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -32,6 +32,7 @@
>  #include "xe_pm.h"
>  #include "xe_printk.h"
>  #include "xe_sriov.h"
> +#include "xe_tile_sriov_vf.h"
>  #include "xe_step.h"
>  #include "xe_survivability_mode.h"
>  #include "xe_tile.h"
> @@ -836,6 +837,12 @@ static int xe_info_init(struct xe_device *xe,
>  	for_each_tile(tile, xe, id) {
>  		int err;
>  
> +		if (IS_SRIOV_VF(xe)) {
> +			err = xe_tile_sriov_vf_init(tile);
> +			if (err)
> +				return err;
> +		}
> +
>  		err = xe_tile_alloc_vram(tile);
>  		if (err)
>  			return err;
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> index c9bac2cfdd044..d1fa46e268350 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> @@ -14,173 +14,12 @@
>  #include "xe_tile_sriov_vf.h"
>  #include "xe_wopcm.h"
>  
> -static int vf_init_ggtt_balloons(struct xe_tile *tile)
> -{
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> -
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -
> -	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
> -	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
> -		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
> -
> -	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
> -	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
> -		xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> -		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * xe_tile_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
> - * @tile: the &xe_tile struct instance
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> -{
> -	u64 ggtt_base = tile->sriov.vf.self_config.ggtt_base;
> -	u64 ggtt_size = tile->sriov.vf.self_config.ggtt_size;
> -	struct xe_device *xe = tile_to_xe(tile);
> -	u64 wopcm = xe_wopcm_size(xe);
> -	u64 start, end;
> -	int err;
> -
> -	xe_tile_assert(tile, IS_SRIOV_VF(xe));
> -	xe_tile_assert(tile, ggtt_size);
> -	lockdep_assert_held(&tile->mem.ggtt->lock);
> -
> -	/*
> -	 * VF can only use part of the GGTT as allocated by the PF:
> -	 *
> -	 *      WOPCM                                  GUC_GGTT_TOP
> -	 *      |<------------ Total GGTT size ------------------>|
> -	 *
> -	 *           VF GGTT base -->|<- size ->|
> -	 *
> -	 *      +--------------------+----------+-----------------+
> -	 *      |////////////////////|   block  |\\\\\\\\\\\\\\\\\|
> -	 *      +--------------------+----------+-----------------+
> -	 *
> -	 *      |<--- balloon[0] --->|<-- VF -->|<-- balloon[1] ->|
> -	 */
> -
> -	if (ggtt_base < wopcm || ggtt_base > GUC_GGTT_TOP ||
> -	    ggtt_size > GUC_GGTT_TOP - ggtt_base) {
> -		xe_sriov_err(xe, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
> -			     tile->id, ggtt_base, ggtt_base + ggtt_size - 1);
> -		return -ERANGE;
> -	}
> -
> -	start = wopcm;
> -	end = ggtt_base;
> -	if (end != start) {
> -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
> -							 start, end);
> -		if (err)
> -			return err;
> -	}
> -
> -	start = ggtt_base + ggtt_size;
> -	end = GUC_GGTT_TOP;
> -	if (end != start) {
> -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1],
> -							 start, end);
> -		if (err) {
> -			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> -			return err;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -static int vf_balloon_ggtt(struct xe_tile *tile)
> -{
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> -	int err;
> -
> -	mutex_lock(&ggtt->lock);
> -	err = xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> -	mutex_unlock(&ggtt->lock);
> -
> -	return err;
> -}
> -
> -/**
> - * xe_tile_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
> - * @tile: the &xe_tile struct instance
> - */
> -void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile)
> -{
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -
> -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
> -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> -}
> -
> -static void vf_deballoon_ggtt(struct xe_tile *tile)
> -{
> -	mutex_lock(&tile->mem.ggtt->lock);
> -	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> -	mutex_unlock(&tile->mem.ggtt->lock);
> -}
> -
> -static void vf_fini_ggtt_balloons(struct xe_tile *tile)
> -{
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -
> -	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
> -	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> -}
> -
> -static void cleanup_ggtt(struct drm_device *drm, void *arg)
> -{
> -	struct xe_tile *tile = arg;
> -
> -	vf_deballoon_ggtt(tile);
> -	vf_fini_ggtt_balloons(tile);
> -}
> -
> -/**
> - * xe_tile_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
> - * @tile: the &xe_tile
> - *
> - * This function is for VF use only.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
> -{
> -	struct xe_device *xe = tile_to_xe(tile);
> -	int err;
> -
> -	err = vf_init_ggtt_balloons(tile);
> -	if (err)
> -		return err;
> -
> -	err = vf_balloon_ggtt(tile);
> -	if (err) {
> -		vf_fini_ggtt_balloons(tile);
> -		return err;
> -	}
> -
> -	return drmm_add_action_or_reset(&xe->drm, cleanup_ggtt, tile);
> -}
> -
>  /**
>   * DOC: GGTT nodes shifting during VF post-migration recovery
>   *
>   * The first fixup applied to the VF KMD structures as part of post-migration
>   * recovery is shifting nodes within &xe_ggtt instance. The nodes are moved
>   * from range previously assigned to this VF, into newly provisioned area.
> - * The changes include balloons, which are resized accordingly.
> - *
> - * The balloon nodes are there to eliminate unavailable ranges from use: one
> - * reserves the GGTT area below the range for current VF, and another one
> - * reserves area above.
>   *
>   * Below is a GGTT layout of example VF, with a certain address range assigned to
>   * said VF, and inaccessible areas above and below:
> @@ -198,10 +37,6 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
>   *
>   *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
>   *
> - * GGTT nodes used for tracking allocations:
> - *
> - *      |<---------- balloon ------------>|<- nodes->|<----- balloon ------>|
> - *
>   * After the migration, GGTT area assigned to the VF might have shifted, either
>   * to lower or to higher address. But we expect the total size and extra areas to
>   * be identical, as migration can only happen between matching platforms.
> @@ -219,35 +54,27 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
>   * So the VF has a new slice of GGTT assigned, and during migration process, the
>   * memory content was copied to that new area. But the &xe_ggtt nodes are still
>   * tracking allocations using the old addresses. The nodes within VF owned area
> - * have to be shifted, and balloon nodes need to be resized to properly mask out
> - * areas not owned by the VF.
> - *
> - * Fixed &xe_ggtt nodes used for tracking allocations:
> + * have to be shifted, and the start offset for GGTT adjusted.
>   *
> - *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
> - *
> - * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
> + * Due to use of GPU profiles, we do not expect the old and new GGTT areas to
>   * overlap; but our node shifting will fix addresses properly regardless.
>   */
>  
>  /**
> - * xe_tile_sriov_vf_fixup_ggtt_nodes_locked - Shift GGTT allocations to match assigned range.
> - * @tile: the &xe_tile struct instance
> - * @shift: the shift value
> + * xe_tile_sriov_vf_init - Init tile specific GGTT configuration.
> + * @tile: the &xe_tile
>   *
> - * Since Global GTT is not virtualized, each VF has an assigned range
> - * within the global space. This range might have changed during migration,
> - * which requires all memory addresses pointing to GGTT to be shifted.
> + * This function is for VF use only.
> + *
> + * Return: 0 on success, negative value on error.
>   */
> -void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift)
> +int xe_tile_sriov_vf_init(struct xe_tile *tile)
>  {
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
>  
> -	lockdep_assert_held(&ggtt->lock);
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
>  
> -	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> -	xe_ggtt_shift_nodes_locked(ggtt, shift);
> -	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> +	return drmm_mutex_init(&tile->xe->drm, &config->ggtt_move_mutex);
>  }
>  
>  /**
> @@ -312,6 +139,7 @@ void xe_tile_sriov_vf_ggtt_store(struct xe_tile *tile, u64 ggtt_size)
>  	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
>  
>  	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +	lockdep_assert_held(&config->ggtt_move_mutex);
>  
>  	config->ggtt_size = ggtt_size;
>  }
> @@ -345,6 +173,7 @@ void xe_tile_sriov_vf_ggtt_base_store(struct xe_tile *tile, u64 ggtt_base)
>  	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
>  
>  	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +	lockdep_assert_held(&config->ggtt_move_mutex);
>  
>  	config->ggtt_base = ggtt_base;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> index 749f41504883c..1ca5bc87963f0 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> @@ -10,9 +10,7 @@
>  
>  struct xe_tile;
>  
> -int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> -void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
> -void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift);
> +int xe_tile_sriov_vf_init(struct xe_tile *tile);
>  u64 xe_tile_sriov_vf_ggtt(struct xe_tile *tile);
>  void xe_tile_sriov_vf_ggtt_store(struct xe_tile *tile, u64 ggtt_size);
>  u64 xe_tile_sriov_vf_ggtt_base(struct xe_tile *tile);
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> index 4807ca51614cf..2cbbc51c101d4 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> @@ -7,11 +7,15 @@
>  #define _XE_TILE_SRIOV_VF_TYPES_H_
>  
>  #include <linux/types.h>
> +#include <linux/mutex.h>
>  
>  /**
>   * struct xe_tile_sriov_vf_selfconfig - VF configuration data.
>   */
>  struct xe_tile_sriov_vf_selfconfig {
> +	/** @ggtt_move_mutex: Prevents multiple movements from happening in parallel */
> +	struct mutex ggtt_move_mutex;
> +

Extra newline.

Matt

>  	/** @ggtt_base: assigned base offset of the GGTT region. */
>  	u64 ggtt_base;
>  	/** @ggtt_size: assigned size of the GGTT region. */
> -- 
> 2.51.0
> 
