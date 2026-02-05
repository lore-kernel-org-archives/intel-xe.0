Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62033ECD980
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 16:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F146D10E91E;
	Thu,  5 Feb 2026 16:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zj403Rdc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A5E10E91E
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 16:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770307598; x=1801843598;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ufj/ZzAvrtbnPKVGSGz/6ny0+h1n2XW1EI/NL0RykxI=;
 b=Zj403Rdcyz5VEtmshYWl4oaPkuqRbPaTUQCkg6QJ9ud5Evud8O1Z9L7+
 4DaYRTsQrSkgFwkOeSJyd3ADZyHykXC0hzbr1NjCvVzEnm3ja61UiesfE
 TMWAzVHu3GG9ZOX20y6U++bnl8GZQLiXZzE5LdqwYvb7kqWwGeg8wG6YE
 NhM8i4ro6MBfoeRwXhKlWM07yIriI+tVpdk/QELmxRs9J+9sCMjMqnEBL
 9Xaio4pETQi8e698A7PcwB4fGlM6fRD/wDSCEtTdOsOQvUTKFcWdqZV9l
 PPc5eH1sIPR3uOsO2dL9H7BXoa+NYufXc7vPSoKUGtEZJGe9JK549437+ Q==;
X-CSE-ConnectionGUID: PZSiHUKcQAO40uINRhlMjA==
X-CSE-MsgGUID: k+TJcw0dThy5+Tz00uZ3oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71500318"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71500318"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 08:06:38 -0800
X-CSE-ConnectionGUID: /fkGArKJTpuCQrPmZbLQyw==
X-CSE-MsgGUID: 8g88ZCV6SJa1qvdgE3BD3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="241170645"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 08:06:38 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 08:06:37 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 08:06:37 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 08:06:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mxk48QS9ed9kreS9WnAHH78N0WvLD/julOYgUPus1zTAEi38jNn93gXZJe+IQDjt1xuYyf3XKxeE2hXZw7nhunQN9MjChOxmjzh6SsH2Hp24m8ImOMaow2SfH9bZJNNGaz/6B5jQ9yhGX2lC/22a3CynlDr0zUVcflqg/yt7vObj+FaTEbGipcm4FGIFvz/xE20h4zeC9yIcL4hw71Tg87C46i4zGHBO0LX0eYVAleUz0N9LsRDHPNGksgA20yi62zuWUrsg+a9TkUmwlozy4beMun/q5E1Jwia/4TeRC+pR8JoTgOeULovU4ED78MCAEjkrMAzhNW1xoQ3dsJ5Csw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TovOqIirpm9oX9ue0sDLO5ubmT06ZueTJ2/SnM2yEAc=;
 b=rSRO3AMh+IXb6UH1mVrofhBuTjBe4lmgoMRUn1gNFkH0CVLX8jnbHUaWlavIAHcX86Y555+PK4IkMqiT8YAG5iPk3i2owf9Xdgr5kMHop8ycmwqjYMprYavYPRJe3/2K9Xqj7ROAg1Y7AYJqUSm+2XbEXD/P/Qh8y2d84xMfZKaZ1G+7PLUtDQ26/t6TUcsmwV6gS/FH6nvdcIjAKENMgIGJzuFPrgXmSD6GHGKp0yEq2IDVojRbDnssVuMEiGOgLrIewFP2n4/DmVm3iHVW9dhmxTbi7+I/9iULQSIrrQr0PWN1qh5bAbyNlz54ikXnmCSjDuaPfhTPEh2Ci2DE9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6793.namprd11.prod.outlook.com (2603:10b6:510:1b7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 16:06:33 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 16:06:33 +0000
Date: Thu, 5 Feb 2026 11:06:30 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <carlos.santa@intel.com>
Subject: Re: [PATCH v2 14/22] drm/xe: Fix Kconfig.profile newlines
Message-ID: <aYTABoQCi0Y1H9nS@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
 <20260105040237.1307873-15-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260105040237.1307873-15-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e60be2a-136e-4218-36c7-08de64d0882c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DlMPZAySzFM/FffjDy0wtaC3Li3JOG+YBNrtjfPhj+REOBuQQzfJcCAd3zQ3?=
 =?us-ascii?Q?q2Rwi1zNxenTznu61+jOD3NB7hcSJ6U3JbFeNjfgx/FlydAphClp3Qo3sgun?=
 =?us-ascii?Q?gZxjz75cCdVnw14ggNS8Mt66aiWsCoUlKtQuY7r8v5SI0getuFOcrZq9l8xJ?=
 =?us-ascii?Q?LxRhLblgwkz98x1VlIdmk88dTk431Lg78iy6ZTRJXv4lCgXmPSh+1Yx/JtTi?=
 =?us-ascii?Q?LgPKgrAkVRbVDNfGM4anrIQR1vtuClmSfYgHq2h3j8t7rP9gUz7YWFTfsg8P?=
 =?us-ascii?Q?KZUcv3QcaU/355D/OFfcIMCD+2hlJ9bOcQtdACOjiHG92K/6OOVgO+Lwr51y?=
 =?us-ascii?Q?NTNg8zl7UQd4X+jE0P8ISX7aMk20/7ZOcJ2Nim7U5kvlQvGCm7BAMXXjdkNv?=
 =?us-ascii?Q?Eq63LTUOFHQVGpMNEJ8QP8jkmK2//eBCpiRd01psRqluW+rEl88lgiicsAT4?=
 =?us-ascii?Q?joUcYat600D0UAtD7lveu6dFhdYbcZ0S3zfQv9QUTJbR4KLOwCu8sGpRs+LO?=
 =?us-ascii?Q?9kdyxRJzBUH79ZxjXLASx0cCoqxyGtE8xBSjZOjHXfMjBcW/ff0xPlHbJeT0?=
 =?us-ascii?Q?I5UgRcRhZWiXFfK66kQci0QdMEkJW33vuUCvZIyY2aU2eGE/SwmaGEMGlFom?=
 =?us-ascii?Q?WsruxFiXPpNhloGooZoAWUTwQa2yL2FtasTTHu/nzrS6nC/K/EaSH/lM1c1r?=
 =?us-ascii?Q?biA/VVH2hjQ7l2FrV/z+EG+tmRWj1u2gPP6BOtodtuAybmneK+aY3dB1kNUM?=
 =?us-ascii?Q?ZIBRr+vc7NFQZEP55URUZOKgOb7uNiVdzDuWhDQ2W1X5xqKZnaZd9DmcJ3LC?=
 =?us-ascii?Q?uYQPfT72a6xaR9uv38QiYpmouNTW5rW03UX3Qu04a0pTbpam9cReFSWmW7iw?=
 =?us-ascii?Q?7YFBEBsPxz5dUygX+Cv0cAi/OKn2A+8P3l60AXuY6gNt51MvXVJUbeBVfe/j?=
 =?us-ascii?Q?Ccc1dwUtXeTV5mNyKm2gRtaeWli5d+F6TXyOr0uU0TALoC1epl/af4cCQcBg?=
 =?us-ascii?Q?jSP6rUx8+D/0/6omvu6Golto7TCaT1iDBmTlZXGIugbG2N93mpULo2qtyW7L?=
 =?us-ascii?Q?yKf70iLn96RR2nV3b5XNzorBsuCXAmnpi8/mO6ViuJXhf3xPxPCgzjf+KI6P?=
 =?us-ascii?Q?NgN5I7bu7wwip+Wb4pyF6Ag11jCN1hhpTG/8ioplzAECodYipi55QrQbaIgP?=
 =?us-ascii?Q?yPv0vS3t/tT0M9bBMSwC5nr6SjWC6wCAlIHet/YWakUpmIjwRajXfaLE5i+M?=
 =?us-ascii?Q?/kt0WF7TErk7/5B7VL7M8hq+OhkSrh5kQFra58U2SLvjrIgVdDuipRm4boI0?=
 =?us-ascii?Q?DMla6t11ViR/KwSnL63coIf2HzkuesK1Wqo0KstZ5/8TtNhUYURwcTFDaRrA?=
 =?us-ascii?Q?+FPzjvzl4tLKCXpOjATV7ik2mRNuaBfaWyTQ/43oorzLHejK/oDi9m+7YGT8?=
 =?us-ascii?Q?b+VcURkn8RLiscHCSjumpLv9ZOv5p5ylN1dt7nlRdnO4u+kNYjmKdS0uese5?=
 =?us-ascii?Q?2Oov23dD1fN5VteIRAfs/Xn1AnhxqUaSbkHTynzIpKqROhRu+DOoPlTfjOY2?=
 =?us-ascii?Q?LwliN2NVJwyqwvVOiIs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/udWqHdzztpwGQIRNm53JBoXuxbVa8FvH+AkHgOEk5/cUemWfYr+45dlK2dA?=
 =?us-ascii?Q?rR3CzjB5JtDo2e7SuNMf4BimlJ7IZCATcrCX74LCtw3Kn1Pbz6tGzMt4SxUG?=
 =?us-ascii?Q?iDtL+phTMV3jR7Ch1U5GrPvXNSMm5OBh++uTkcqtljDkXzbUtel19jhss1/O?=
 =?us-ascii?Q?6u4D0D2abgsYRv0RY+zyXRFsyaCchluXNx57upD23LVPahBtZBctOAJ/7KIW?=
 =?us-ascii?Q?bfzzf8gnk4tJMPa1/1YEWgfBs4cpShL8PHCg5hUYUfEP/EQHIq3K38f/2Zcj?=
 =?us-ascii?Q?kWWnwBiv739NwY9J2BtLjgJ8OUcXnx/yBcVSZNyM0ndTu5w4Q/4bRvNYJj2N?=
 =?us-ascii?Q?9t1qLQw0LUL7u0U/QwjpvSrOj4Ihs/103pXUYj0ezi5sB3PsmjmE/rtwD1D6?=
 =?us-ascii?Q?ISiSQXaIfzbWE5VxXYXhhORGVCaYJykieSuXuTFA2hjzEG7uPENCbHiIcJVw?=
 =?us-ascii?Q?Uf62nSmp6ypyP258xovGJwlLaGsv5VwFSbDPfAKTOL0kpmSv4VWpmwYmdfZe?=
 =?us-ascii?Q?AWtxC6uBs+RaNkqKL4iCWwY95mZAhqAYr1BNDL8sFVQzG5/JiCD0s5s2JGgM?=
 =?us-ascii?Q?Px5M+gi4ZGe6JiD3UAXJPfxAbRHzlYcyT9k3TrYNRhvl/hj9cz3yuqJo4BNA?=
 =?us-ascii?Q?QWhNN+Jl8FBjyJxGjfOM/SmGEKyfrNlnC8bKu6vrwhVvqKcPtJdRdSwOpSD0?=
 =?us-ascii?Q?0HYOcSxh9egJ/moL4gasfWDDYf1MPC9oehVZ7XsaDW9RnQpM/HS29bJiejjo?=
 =?us-ascii?Q?6Ng82GO0Gpk+sYFakOULzUQrUMSWGc9wTLWq8ZxnMItu2avncUnV7gb2MAsh?=
 =?us-ascii?Q?ot0DP7l5cAODqSlFIzn1OAXgm1CWKnIIFPN0upnbe/VOBxv25L/UB+UPLUoH?=
 =?us-ascii?Q?EJdTv9+3DpENvyMZeGh3Z3oZFBKKQ4GspLCbkERVckdDYkLi6kHy+/aabIah?=
 =?us-ascii?Q?dsedW2sdVZFrLJC0YZfUCcybKKWdqccAWZi3dyt46wfMRpTEKVUFmXmH+O9d?=
 =?us-ascii?Q?DqkYxsT3OUfZekVUihqQQhR6qDOIQK6NeS/f9PR5jO5rxBz6/fXN2QDRLRHY?=
 =?us-ascii?Q?xfFKtd+roKBFe3gEm5qsTzuJp7repGbRpiaqUp4wBNulDKM4+o84b0jN6t5T?=
 =?us-ascii?Q?W+8ZY0HZGTPYXmu/054vYw7WPsEWsanR6sIUS+WzzNN56YMzgWHBse7Gq0Dt?=
 =?us-ascii?Q?Gd82uLUNIgn/9ATaPeFXZppt4ETHFZbJbGFc2AsQm3qsVrVmNDN/i6t6WkcZ?=
 =?us-ascii?Q?s8SI8tVisuHHDckLWCSP3eOVnid36CrGNAEBUC+RdNajUFxde+ChCNowqytk?=
 =?us-ascii?Q?s3r3fa08Vtm4hunPnvNYE50aLraIL9cGgYupWxE4T4YIytPXN5FiNKKndIM0?=
 =?us-ascii?Q?b9uJZTC3PdD4BgJVT9CkZdR92NjdtafbtF8ZC47W4oMq9anTXXJn2if4XF+d?=
 =?us-ascii?Q?8+MZ9oV6/lFXPrCteurc0D24LeyrSlnLkdT8Vlxx/4/TBQVJ14lJs0WBbg0s?=
 =?us-ascii?Q?RJueQm0CCpy9hBjW0QjRs7umcLHQOM9YWxLFTGxw8C488roc0CCl0y1FoyFE?=
 =?us-ascii?Q?/NZzmWGRUkEEpT916BEWOmcEmN2jvPDUklJqg4vCLU8XdPXs3Qt4dZL2KJsH?=
 =?us-ascii?Q?+zjv8u2spv9DxK255dtkBh5/qSn38zP4UMdnjcmKudkMcEm5nRS+1XeFkomn?=
 =?us-ascii?Q?Mk94BCWOs8WLWCU1xG7LUSfOR5OPO9FYc5q2sxvNjBP2RrfHlQsAANKegKGD?=
 =?us-ascii?Q?26l+2I1Trw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e60be2a-136e-4218-36c7-08de64d0882c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:06:33.6085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3tavwT4xwn6G/8s4cBtKfcyYCGpcBwgWNx3zFQ0ubWs1aHMWCcaPYTuJwf0XOsEj8Vpv/Xlm1WsJCa+i9ThDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6793
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

On Sun, Jan 04, 2026 at 08:02:29PM -0800, Matthew Brost wrote:
> Add missing newlines between Kconfig options in Kconfig.profile to
> improve readability.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig.profile | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
> index 7530df998148..594acedf7b56 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -5,24 +5,28 @@ config DRM_XE_JOB_TIMEOUT_MAX
>  	help
>  	  Configures the default max job timeout after which job will
>  	  be forcefully taken away from scheduler.
> +
>  config DRM_XE_JOB_TIMEOUT_MIN
>  	int "Default min job timeout (ms)"
>  	default 1 # milliseconds
>  	help
>  	  Configures the default min job timeout after which job will
>  	  be forcefully taken away from scheduler.
> +
>  config DRM_XE_TIMESLICE_MAX
>  	int "Default max timeslice duration (us)"
>  	default 10000000 # microseconds
>  	help
>  	  Configures the default max timeslice duration between multiple
>  	  contexts by guc scheduling.
> +
>  config DRM_XE_TIMESLICE_MIN
>  	int "Default min timeslice duration (us)"
>  	default 1 # microseconds
>  	help
>  	  Configures the default min timeslice duration between multiple
>  	  contexts by guc scheduling.
> +
>  config DRM_XE_PREEMPT_TIMEOUT
>  	int "Preempt timeout (us, jiffy granularity)"
>  	default 640000 # microseconds
> @@ -31,6 +35,7 @@ config DRM_XE_PREEMPT_TIMEOUT
>  	  when submitting a new context. If the current context does not hit
>  	  an arbitration point and yield to HW before the timer expires, the
>  	  HW will be reset to allow the more important context to execute.
> +
>  config DRM_XE_PREEMPT_TIMEOUT_MAX
>  	int "Default max preempt timeout (us)"
>  	default 10000000 # microseconds
> @@ -38,6 +43,7 @@ config DRM_XE_PREEMPT_TIMEOUT_MAX
>  	  Configures the default max preempt timeout after which context
>  	  will be forcefully taken away and higher priority context will
>  	  run.
> +
>  config DRM_XE_PREEMPT_TIMEOUT_MIN
>  	int "Default min preempt timeout (us)"
>  	default 1 # microseconds
> @@ -45,6 +51,7 @@ config DRM_XE_PREEMPT_TIMEOUT_MIN
>  	  Configures the default min preempt timeout after which context
>  	  will be forcefully taken away and higher priority context will
>  	  run.
> +
>  config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
>  	bool "Default configuration of limitation on scheduler timeout"
>  	default y
> -- 
> 2.34.1
> 
