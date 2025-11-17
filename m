Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9537CEACEF
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 18:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7967110E0FC;
	Mon, 17 Nov 2025 18:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZ3jozNx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B0910E0EE
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 18:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763403932; x=1794939932;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xXNtFTwFcPWrPumDFirol+4y5R1NqPBnvx9LWNWxOus=;
 b=dZ3jozNxn26nzV3QLnN8kTzeOO8Lg6RCNaFKGO+Pk27reOihdmTLxIKs
 fg3NABM0AxzvzQprAM15kVvONxBFxIicYRSZu6/j1SFJ4Xd6Jva8NYuLQ
 8IY7Wrx1P5F1+tPbpeEGZgo1YuMo5DM+evFnBRhF9BdaKzmnbrszM4X1/
 3ekDzHu9VtpfmCwdt+VgSONudp6nosaMFGtqJtwI4dXlbhtzEFvWOsoEB
 L6FVzH+yPQzq+QTY5XRiiH7+MkN/ATscrjfH0Z471BIo0Kpc7xyxlVNZU
 XDrHxZ+fHN/Xje7nxfRgZ4M21ONihunKOuxoQHtyjy8MKhEyBU+SR/fYc g==;
X-CSE-ConnectionGUID: v3H1MI+sSW+KpLMRo1jPHw==
X-CSE-MsgGUID: 8u0GHhs7Tmy/JWWfP5WL4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="88061186"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="88061186"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 10:25:32 -0800
X-CSE-ConnectionGUID: zZZRcu/pQQyPJbZXNFMHKw==
X-CSE-MsgGUID: xda2Km66Q+il+UaoZ4eVQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="194989295"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 10:25:31 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 10:25:30 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 10:25:30 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 10:25:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vukEeHBWkoxcnt0WkpZrlaZpmMVLP51SOHFRqDyiRhKyc2hfb30pv+W9fjOh97nGKYNaKMYfnPqxp6HzmfhXE8PUMZEiyFBi8Q3WaCr69ARCtLVWRlanImomjOM8RpX50iu98xQkkOVhwSYW9IqR3tXQkAXBuH4oje37YdosNaOTBVXeb45sQzoWT0B6Wh+q6QyBcXKC/UxE6abaMM8gzHvU6jIdZBwHZFImHq0uQfzzlPH+wKWLVPDjDvpWY7me1dKndmrE0wtBRYoCtMMCifdGDN6bYNm/Yq7iLY9PUQEF8cQxD8IFMTrUFNApwnxB7BJ6oteVz6wFYpVOSMPL1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7qK9NSzBdErUiRY0wuf0D4SRgMtXRNAyqWjp0easdc=;
 b=Qom167TZC0tMPoBBqdhzcedEcf6h/dh0JfevQg+JdgPFgAt+FoP20BLf/qDoNQg47wuVvM9xgXeLS906KTuGUTm26tz7e3q73tBbkykLRWzEaKU7DXEugvlGrsRITXGa51MX4lIlDleBgDa+RfjYrIEkII7r2OsV4e3lQ2VLbQUZ2ErBvxEclcN0nEGatIQRF2Ot0lVjHN0YGYuyxSygHdStpj6hnE07w5K2+FhgdIXRV2jpNQPAEJdrF0PWJK7FdXQoLuGVsTMqMkaaNxhKdNseY87ZGt0OjruqqTp8XinDnQzmCgGG9D2hSVaQFUSIpr6EoFM3j9kFblO0gRdEig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM3PR11MB8760.namprd11.prod.outlook.com (2603:10b6:0:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 18:25:27 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 18:25:26 +0000
Date: Mon, 17 Nov 2025 10:25:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/sa: Shadow buffer support in the
 sub-allocator pool
Message-ID: <aRtokkXM4Iad73gw@lstrano-desk.jf.intel.com>
References: <20251105121151.2680100-1-satyanarayana.k.v.p@intel.com>
 <20251105121151.2680100-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251105121151.2680100-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0293.namprd03.prod.outlook.com
 (2603:10b6:303:b5::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM3PR11MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 18cc7a37-88c2-4b04-1722-08de2606ad9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lHamBJcQ8BM4tu78fDYFWoXplM4AXpNb7L3uyB5f8R2sBfj9MgLg9nwiYr3n?=
 =?us-ascii?Q?2ue9QBkPurgRvY0YnjHt6ddPa12BFInY89wWuXvDyI1tl7i6H2XAXFkzddhT?=
 =?us-ascii?Q?gBY79m0NbqclgA6bnUsirWLokpBlHKnAiIMCW+Q2/enJX0CBli1N1pJgNclI?=
 =?us-ascii?Q?QMdn83okBPvJLZTEkrBbH2ru3WVK+pFIKE+jp7NftckRqW7+Cq6CtQ5Ufxnp?=
 =?us-ascii?Q?SlcvEf3GXhX3wnEjw1+KwNCcx5FMBWlpXg4vFjfmvy7qcY9AQ7I8GH6WeE6X?=
 =?us-ascii?Q?NaXxV74ObFtocP0ONxjAQ0Gi36626SAlyFf4g8MrqVYBhGznBp6Qm4gLn22P?=
 =?us-ascii?Q?MnNFvMKDPsOjo8XhBT0iwq3QbrbvQy0B06AF1yS0Rf7ECR+1JpOFoC1hYvaz?=
 =?us-ascii?Q?JRFxJJmPgd4tNFThrksOp/QX4us+SREmcp6FmFPr6eAzUNLugBbDr3CAOpDi?=
 =?us-ascii?Q?W4I72/JF95A8yaEgEiOv+Gh+P1I1AV4uwvmmBUXgfq0dSEQr5breTBzwnZti?=
 =?us-ascii?Q?w3L86qO9Wv0Wr5lhUeOJI9Q/KmO23mTzZOwz+816vJYthxC1IgknuFPKdsBG?=
 =?us-ascii?Q?OGBU9wpkT1glbOPkSF/w8az+xdUyfh1q8rZqVbMPjl/Ir5sPLtIuZajk/NT/?=
 =?us-ascii?Q?C7Sya1vYWTeCVNEQFcOstY/elaC7jlSKQx4kI9HQkA7VotQGW0KGvVz/uFJ+?=
 =?us-ascii?Q?JAq5YIHxppS+OZs3T7VsERFaADGTGgkqEL6Nl0eZeQEae0UGFchYFTV0CRqz?=
 =?us-ascii?Q?/aCv2HLqElElFdWortrMbH4SlhVULN2BIFok/veBymTwoTRXZum+hr0ic/kG?=
 =?us-ascii?Q?9AWasQsBRqD9aPPZYAFmgUjO4lDUozp3WsupOrCS5t+ikP2pFk2ZwZ92beqj?=
 =?us-ascii?Q?wICA5OTZEZVjuNV07c0Lq2TsU679xeXK9F3JwwqffjPxkCqqvotlLiZE805o?=
 =?us-ascii?Q?2A/ag2GpQK0oryIwJx4Zq0eHeq2TJkHQH7HA+Jtq/YzJ+LiV3n74I3pPfFCO?=
 =?us-ascii?Q?qIMTiRxAwJQ8vK9sHNBPMUzbtR06fmYgme4eJ0P6nyIJdV3ggscAHAa2vzbz?=
 =?us-ascii?Q?9khIp5yRD+ZfxU4d5rzGIsW5kJsQivAW3eUvyf+KlWYQ3oqFhQ50f6BfZ/z+?=
 =?us-ascii?Q?BVAqWO7sWA6K4ak8KfaCCDdZMJnpOob5snS00GpZj69VzbxMGJkzoR+a/S9X?=
 =?us-ascii?Q?km7U/mAU8E4G2CV3E69jcF27dELy4jsRxuHCU29KkH3EdhoWgx7soViGEojw?=
 =?us-ascii?Q?4dxdFM/1no0zJQIxgFcMAlK2gZQky2nHmRwkz0yKJpkBuTydlQTp9WkVGh+E?=
 =?us-ascii?Q?QrmBNtwye1fa4BJMu3JFTA3vIJb9IqgAiURRh82AeCLPfUKeUMi1wex5fAPa?=
 =?us-ascii?Q?+TiBwc1dfKAcQWEtFRMSIaI1vJH4SrWifZ0jeZ8yzSt63T22HOKM3p+XfpWP?=
 =?us-ascii?Q?nNQhM1vew6C9Mdym03lGZQu7WzvquW4E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oFwjIBuQvDKCZKdvnAJGt2kAtZe0bh94N2mzO86Tec6FZvPqYY/l4oWAOfSd?=
 =?us-ascii?Q?G2lp3jSX9xNgMCVjILKrfRnb8VezSIJEZ/JEQzQ6CeCaiGf84P1T83ynBqZv?=
 =?us-ascii?Q?ZQxQPR2hvdUaTcTvhwwlw/TU4A1DR6e31pmOi1JBcPaGMiCk7+SL3q8mv+4K?=
 =?us-ascii?Q?C/z/fU0GthQL2mSl19IvEmNF5+gtS5/fhegpIEcwJwo5WjIY+7BcoFW/C7AT?=
 =?us-ascii?Q?QGlM6kFR6I2eZg2tBlgfv6VBK44+ANCNUvUfJNEzxl6k9ivcuA9eF4PyHAm7?=
 =?us-ascii?Q?rNbAzphR0oXb8CbMIYPgV5p3EKSLN/kVPhFXjqI4NZAyHjIqT7zqN77uvHO/?=
 =?us-ascii?Q?5nN2qbSwMdpYMqCf7wAt4JQl6pvCK9K+hDFqjK0CvQ6YqRsW4MUCI6PgIehh?=
 =?us-ascii?Q?F1bBTm6tH6x3Iycg5JBJjthRp5kk5Nl2InLdjIsrQ8fFPHs1Hzn2U4ELgXp3?=
 =?us-ascii?Q?5rqDF5YHlN9EmVk0ZSciIgmRhPctEdVhXom3VM93AaZGwn8Ssro/a9JdmEMG?=
 =?us-ascii?Q?euF1nHHsAu3bAAzbYbQenKvmSW90EZuUzgYkOOMcQk+HyB351VKISfOvK94o?=
 =?us-ascii?Q?6Em53UXGro/FM7oHuRgVkab2CJIXOmjGoIYp1D/b65rLZAc74p0uvZYWRQDX?=
 =?us-ascii?Q?E2/UeNcg9V+GbKXX/uGWNW9J512N9yBXLLLrzyyG06z6ZK767lAnwVY+HITB?=
 =?us-ascii?Q?XF7uFcX+VYsbFA0WbUjYGwux9lAa0JjzrsOxtWSHSz6/arEmdu5LtCFXKMJf?=
 =?us-ascii?Q?959IVvadX91+7+fajI/FotEO3VU0M6KABRehh15z/EaO43WdAwGGqRibn5nH?=
 =?us-ascii?Q?/Tvo+Nq4uzVChhxPqunPjFsVDk+y4E7IlC/krBUzf7Eqp54oNDMsfJfGC5LW?=
 =?us-ascii?Q?aL96945GJuS1yMGzdsWILWv5/sbNAZNkwvAwT+3TMb8a/7CqCLd5WKwQrX/Y?=
 =?us-ascii?Q?/v6vu6BJUolYMSn1ALlDonqO2YGJoHp7NjSjfb/bFgNzlD7GZq3K6vZgzc+7?=
 =?us-ascii?Q?eMM+v2czyaT8Slxqgb7eN0lniT6O/2+eOCCpCIpgo8/cNK7CR8Tf+Trug4MF?=
 =?us-ascii?Q?lzvxb6xjuQr0SYoYWmwumxHJfF1OZpu0SXafA440Z5y8qKKZ2kT4iRNT7pfd?=
 =?us-ascii?Q?pkDndqjHu7cDVx8hEYEh6VZkzKXJig7zu9L1ppT1Xui2D26cHqls9jCGR+rs?=
 =?us-ascii?Q?wUEha79GUHgIRr/gcSHqgQzSqLNaAjP6snDz+7UD77pQYUEo1jmV9xGHOOeV?=
 =?us-ascii?Q?ea+Kgz5txpkxKKLctkt8Pdazk2wQBLylG/xUj8b7xC7I9+QJNzI8oAuR8ePc?=
 =?us-ascii?Q?pJmvnJAsuq4pUyYOiTsA0DA3qjYZPhLfYH2dzC2Chv7F1GaTDma7MySAkVp3?=
 =?us-ascii?Q?jJ24HSgTZV+UaXdG4FwCKstIh9WrDGIEFw+EYFw0koDLYiOqp+QVAEsnU5BQ?=
 =?us-ascii?Q?QrKeW0et2vedkuwFTjuwnKcELhNzrBsrhV3x8hJju+JrBghABuoxuGHliOQo?=
 =?us-ascii?Q?TBTlRPhaSx9TMMz3kmkZgc3PUPkHzb37FbPhO2xJcbF8qSfI33xXeySKqCed?=
 =?us-ascii?Q?rdzJkB2zPKK0pYo96XUBPdbOyzUONoXCIU2EYErNM2sGr0kjTBQiBCYqe0oL?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cc7a37-88c2-4b04-1722-08de2606ad9b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 18:25:25.9569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCX1DWwxYQI/O3Rv02H7aPqJLVz5Efbhds/VlHsMBIy+jW64yNjiaYKfACkLq+Zu/ie9PAuaOrTlHHBdDRZ9ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8760
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

On Wed, Nov 05, 2025 at 12:11:50PM +0000, Satyanarayana K V P wrote:
> The existing sub-allocator is limited to managing a single buffer object.
> This enhancement introduces shadow buffer functionality to support
> scenarios requiring dual buffer management.
> 
> The changes include added shadow buffer object creation capability,
> Management for both primary and shadow buffers, and appropriate locking
> mechanisms for thread-safe operations.
> 
> This enables more flexible buffer allocation strategies in scenarios where
> shadow buffering is required.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> ---
> V1 -> V2:
> - Added kernel doc for xe_sa_bo_swap_shadow() and xe_sa_bo_sync_shadow()
> functions (Matt B).
> - Removed xe_sa_bo_swap_guard_lock() and xe_sa_bo_swap_guard_unlock() and
> created xe_sa_bo_swap_guard() to which return mutex. (Michal W).
> ---
>  drivers/gpu/drm/xe/xe_guc_buf.c      |  2 +-
>  drivers/gpu/drm/xe/xe_sa.c           | 67 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_sa.h           | 20 ++++++++-
>  drivers/gpu/drm/xe/xe_sa_types.h     |  3 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  3 ++
>  5 files changed, 91 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> index 3ce442500130..c36fc31e0438 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -30,7 +30,7 @@ static int guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size)
>  	struct xe_gt *gt = cache_to_gt(cache);
>  	struct xe_sa_manager *sam;
>  
> -	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32));
> +	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32), 0);
>  	if (IS_ERR(sam))
>  		return PTR_ERR(sam);
>  	cache->sam = sam;
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index 63a5263dcf1b..a87c1436c7c1 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -29,6 +29,7 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
>  		kvfree(sa_manager->cpu_ptr);
>  
>  	sa_manager->bo = NULL;
> +	sa_manager->shadow = NULL;
>  }
>  
>  /**
> @@ -37,12 +38,14 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
>   * @size: number of bytes to allocate
>   * @guard: number of bytes to exclude from suballocations
>   * @align: alignment for each suballocated chunk
> + * @flags: flags for suballocator
>   *
>   * Prepares the suballocation manager for suballocations.
>   *
>   * Return: a pointer to the &xe_sa_manager or an ERR_PTR on failure.
>   */
> -struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align)
> +struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
> +					      u32 guard, u32 align, u32 flags)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_sa_manager *sa_manager;
> @@ -79,6 +82,26 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
>  		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
>  	}
>  
> +	if (flags & XE_SA_BO_MANAGER_FLAG_SHADOW) {
> +		struct xe_bo *shadow;
> +
> +		ret = drmm_mutex_init(&xe->drm, &sa_manager->swap_guard);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		shadow = xe_managed_bo_create_pin_map(xe, tile, size,
> +						      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +						      XE_BO_FLAG_GGTT |
> +						      XE_BO_FLAG_GGTT_INVALIDATE |
> +						      XE_BO_FLAG_PINNED_NORESTORE);
> +		if (IS_ERR(shadow)) {
> +			drm_err(&xe->drm, "Failed to prepare %uKiB BO for SA manager (%pe)\n",
> +				size / SZ_1K, shadow);
> +			return ERR_CAST(shadow);
> +		}
> +		sa_manager->shadow = shadow;
> +	}
> +
>  	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
>  	ret = drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
>  				       sa_manager);
> @@ -88,6 +111,48 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
>  	return sa_manager;
>  }
>  
> +/**
> + * xe_sa_bo_swap_shadow() - Swap the SA BO with shadow BO.
> + * @sa_manager: the XE sub allocator manager
> + *
> + * Swaps the sub-allocator primary buffer object with shadow buffer object.
> + *
> + * Return: None.
> + */
> +void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager)
> +{
> +	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
> +
> +	xe_assert(xe, sa_manager->shadow);
> +	lockdep_assert_held(&sa_manager->swap_guard);
> +
> +	swap(sa_manager->bo, sa_manager->shadow);
> +	if (!sa_manager->bo->vmap.is_iomem)
> +		sa_manager->cpu_ptr = sa_manager->bo->vmap.vaddr;
> +}
> +
> +/**
> + * xe_sa_bo_sync_shadow() - Sync the SA Shadow BO with primary BO.
> + * @sa_bo: the sub-allocator buffer object.
> + *
> + * Synchronize sub-allocator shadow buffer object with primary buffer object.
> + *
> + * Return: None.
> + */
> +void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo)
> +{
> +	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
> +	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
> +
> +	xe_assert(xe, sa_manager->shadow);
> +	lockdep_assert_held(&sa_manager->swap_guard);
> +
> +	xe_map_memcpy_to(xe, &sa_manager->shadow->vmap,
> +			 drm_suballoc_soffset(sa_bo),
> +			 xe_sa_bo_cpu_addr(sa_bo),
> +			 drm_suballoc_size(sa_bo));
> +}
> +
>  /**
>   * __xe_sa_bo_new() - Make a suballocation but use custom gfp flags.
>   * @sa_manager: the &xe_sa_manager
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 1be744350836..05e9a4e00e78 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -14,12 +14,14 @@
>  struct dma_fence;
>  struct xe_tile;
>  
> -struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align);
> +#define XE_SA_BO_MANAGER_FLAG_SHADOW	BIT(0)
> +struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
> +					      u32 guard, u32 align, u32 flags);
>  struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
>  
>  static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
>  {
> -	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align);
> +	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align, 0);
>  }
>  
>  /**
> @@ -69,4 +71,18 @@ static inline void *xe_sa_bo_cpu_addr(struct drm_suballoc *sa)
>  		drm_suballoc_soffset(sa);
>  }
>  
> +void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager);
> +void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo);
> +
> +/**
> + * xe_sa_bo_swap_guard() - Retrieve the SA BO swap guard within sub-allocator.
> + * @sa_manager: the &xe_sa_manager
> + *
> + * Return: Sub alloctor swap guard mutex.
> + */
> +static inline struct mutex *xe_sa_bo_swap_guard(struct xe_sa_manager *sa_manager)
> +{
> +	return &sa_manager->swap_guard;
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sa_types.h b/drivers/gpu/drm/xe/xe_sa_types.h
> index cb7238799dcb..1085c9c37d6b 100644
> --- a/drivers/gpu/drm/xe/xe_sa_types.h
> +++ b/drivers/gpu/drm/xe/xe_sa_types.h
> @@ -12,6 +12,9 @@ struct xe_bo;
>  struct xe_sa_manager {
>  	struct drm_suballoc_manager base;
>  	struct xe_bo *bo;
> +	struct xe_bo *shadow;
> +	/** @swap_guard: Timeline guard updating @bo and @shadow */
> +	struct mutex swap_guard;
>  	void *cpu_ptr;
>  	bool is_iomem;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 797a4b866226..9959d619addc 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -162,9 +162,12 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>  	offset = 0;
>  	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
>  		      bb_pool_size);
> +	xe_map_memset(xe, &sa_manager->shadow->vmap, offset, MI_NOOP,
> +		      bb_pool_size);
>  
>  	offset = bb_pool_size - sizeof(u32);
>  	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> +	xe_map_wr(xe, &sa_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
>  
>  	ctx->mem.ccs_bb_pool = sa_manager;
>  
> -- 
> 2.43.0
> 
