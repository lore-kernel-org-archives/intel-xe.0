Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEEFC25B7C
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 16:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F7E10E2B8;
	Tue, 28 May 2024 16:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UrwxN8OT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7679D10E2B8
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 16:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716914102; x=1748450102;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F/0Db9922kwZj7er+fIZD3FGt35ecLhAXl2Q0aHEG8w=;
 b=UrwxN8OTW1y7PnO1GW/3p5brdewlbb7Ak0azqmMGfepB36KTE0zmEGrZ
 B86vGSFZQ9n3stWSh3KO4AggCiat1ULkKzk9pyEcfgBq760DAhztm4Qr2
 dy81tJlLXa5ah4hznvx0a9vH5UB6aL1YDngUERMVwkKyuQKeSVyVSFyWH
 JYEB/EOGe/IE5FF8TOKkWNWLaLpMYbexEKgluxuWjh1HoBLBYOs9ZSAfh
 eyS2xoM0wRUpaMFFe1U9ASxHaARQfCjlT/0kOgIdAovwbGA/Ra66J1rOr
 QbCz+wjMD9+Po6BibQ2BS8gRGKqymwi8QzBT9b3BEKZcD6PEE53g4TS0v g==;
X-CSE-ConnectionGUID: 5d88xBa2RXW8E299E5XnKQ==
X-CSE-MsgGUID: s3lExomoTwuHC6gGPLcYrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13147761"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13147761"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 09:35:01 -0700
X-CSE-ConnectionGUID: SE9/HZ23S0+fyVeT+eM2vg==
X-CSE-MsgGUID: uqLv4+OTT2GsgLhWYZw6ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="65984642"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 09:35:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 09:35:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 09:35:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 09:34:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUUAOTmxKtp3XZhITT02YwkyyxO3wtr/dt0Mb82GJtqK2iggRA7or0aOGaLPUsutT22o8uoL1WZdPJ63rXysRy/y9p1YtY5r1ke6wTCAGjRi7w30P6NqgEu3z1iDIwI5GogIdIdqA498O85Bp7Osjfc6x7RuWICEAYL/TuGPqIUtMD2G8d9U/2jc2jNQXehL15LzG9p758jrmWymhrhRQiPiQE3u+BAkgpW1/ZSLvNBJvS0o33ioKQ3gRzTK045ixTgs5SIrwCqJ8nkEzMXkDQ5L1+x5Pp0VjLcwdc5sPWQQNTiaUA19rCr4XUq9wQ/SsBOwrKrLRFbCjS2iqIl/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9M4YlxFxpUJFoLtQKw/IuOWAeJclDr9HYHxUFCYW1p8=;
 b=WHWGkWnN2krcV0eohpHPLd1i3ZXAruYCKcOOVSIoVJLZhoUikCD9gUYJ3GAR0ucpAFyyGxCOpn4KOi1w8/lRkekdJyPyrPhWqK7HuQPZnv82vreFRA1eYYKO5zTqXTFICAV5FjXXddjRvJ5Nkh0FsNjFzHfJSCUOSLIo0MV/X6Jz1RvrzcXvk/2yV5cYfw1p6eHztN6GHkvldMmlnWt7QxAiZVYJYOXrIUlE5LZPuCNXMdiHZRyr97Pe4F2O3iXmaVodmoYkfFOghCWN3piJbXn1RwS2EvnHJWXIRCOar0RoiSb0cJBevIkDHXLysxWgHTDRu1cRf7XAB8ofv0H+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6552.namprd11.prod.outlook.com (2603:10b6:8:8f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.30; Tue, 28 May 2024 16:34:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 16:34:57 +0000
Date: Tue, 28 May 2024 09:34:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Pallavi Mishra <pallavi.mishra@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe2: Enable Priority Mem Read
Message-ID: <20240528163455.GD4990@mdroper-desk1.amr.corp.intel.com>
References: <20240525004933.1124012-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240525004933.1124012-1-pallavi.mishra@intel.com>
X-ClientProxiedBy: SJ0PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 12efd36f-4d2b-4873-4cdf-08dc7f341ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?17gMJoWFSRbyaDxxmEqnbF+zTWw85HGDmw2BXaXZ0KkzdX7YUMlR4crDLLZL?=
 =?us-ascii?Q?SFlev9/qEjVR3dvRk4GhXmFT8pX+kQ2SKPlA7QirDq9GsTiqX2mgWJzu4kon?=
 =?us-ascii?Q?Z4nLJyAhpArsyeQd1ZXkctH5E+BC6ILpbMC+yTExFF/9w7Sy3OP9VuAffp5h?=
 =?us-ascii?Q?vmxFyjLHIEC8BQjagk8+7NL8QbqI7D7x9wbDL8TT7Fey+aiqroksB5wX7sDW?=
 =?us-ascii?Q?UV2A5sLpGUfyBhd3/ToGZEr8GEnIRgqn6zM7xlvxjWgne3vI7NcHzSO6tquk?=
 =?us-ascii?Q?zRLsEFMWrSJVFitzXgUz07PsWfbe1Qc4Lg2Fu1G+3T7QJtY4b6qsu1cbMO7a?=
 =?us-ascii?Q?d6KTiKXlzmkE72JGjN6a5GkhyiyL+TLi/WccGZGfeBjziePIHcPfCxp8vxJj?=
 =?us-ascii?Q?JLeKF+aYcpj741zr4X8EjPiMACkStXrImZSvP642LMfTmUlYMy4mxfttjnjq?=
 =?us-ascii?Q?seoPjfCXofEqkrmGLgnr0SQGkPBRXsdehzCQ89AZx1tNxMWqV67vHng+001A?=
 =?us-ascii?Q?0bm4VcNqA1Pfn8QMEQm5rv5JyboTDXDorBBfPGAULZzPAviTwF1AVpFHmZy1?=
 =?us-ascii?Q?wRm7CCW0ZnURMiNd+6Pmd7xqKj6UbzkOOv6SZJxRbgW4/4u9P3HjNiDLz3+u?=
 =?us-ascii?Q?otyuPv8yRw61YikzjVwLNlP70gxUGnkYfL5e2pdeAFTh9b9783ud+po8SYym?=
 =?us-ascii?Q?kQG1r49ctuQmoWZLZKGmq1pKsqMf9c0+XTgSXsXanJVAxgMhVx2oGxXGMteX?=
 =?us-ascii?Q?RE7DF/W1XGfpo0Pby2R+JDIq4nPtGKkWzqNSJq9n1hbrMYAcVwSrCBcrs+9h?=
 =?us-ascii?Q?C3WRpuHaqIIzqOaKvaFHn2vjROyd2lkw54mgONlk5CcnomhHHnIA+aeDxNJK?=
 =?us-ascii?Q?UuRTiggG60kHnftzQud90IucXZdajO+jZynozfc6D7BnhWeQ+9PdpRSb+xnl?=
 =?us-ascii?Q?zRc3CLpizTNJqDUDAGPkFLLqaL43qIWilYlf5zaQvFmlpvkwWRC1+fuAVw+w?=
 =?us-ascii?Q?/+0/AqBC7+f0mmRP1LhwZRKv42dIunlhDhhw6FsIt+/6cQIwJZfe19Mc5KWu?=
 =?us-ascii?Q?PlscLs3kvxilylqDL1MYeEC1mveuMgsrTpytLHeZSjTaytbW5zF3f0Kj/cdR?=
 =?us-ascii?Q?q6ggiE3hfCpYm0BBTfmkSoYpwE15CXdJfXPSguYO9ECJBRcjLNT4wea4AoIm?=
 =?us-ascii?Q?UXTQVBL6cEj4AMv9qGNTFRecTcUPexjd9TBAJ4bFIh/02XKkCZrLmtq1E0ju?=
 =?us-ascii?Q?qYP/B1+QCWoU+mWCeLiT+kxF4hKtytCrCIAGGlXxIQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ooNCYuLCLRyzI9QZxce3U9aS7E/7+MG+oJblOBLP8l8klSf4d2jX1vg7DcFz?=
 =?us-ascii?Q?/p3inrY0fnj9wlBl/dU4Sc5Ag01CBY8+6O8LMhw7NVuiNojBk10AYiBCPb/l?=
 =?us-ascii?Q?plOXj1//TYM9hK/YBu4IU/06kdUkwnTrUmNDnbmsAv7sxQhao+UMxWJwVCcC?=
 =?us-ascii?Q?c9zEzUjKj2d+0HmTsGcIYyqAyVclm2cenv2nyjVyTimqZiiECVPL5odPtWAB?=
 =?us-ascii?Q?LL2zBfoMrJGXRFvN3f99ldwlUzdwjJoU7GFqbpj9lE6M+C58kr/L9VPlPV2t?=
 =?us-ascii?Q?Cs2cMgi7/NwSRSbz11eBQXvuAZRwjoXfltrZnJSx/QeLyP38u2/AjDuuRw+q?=
 =?us-ascii?Q?3R0dU8fO0mzCfXxFCAY4lQawX/Jf0BW3+pbJ6ZlHdWlT9CTgg1zf856JdgPR?=
 =?us-ascii?Q?esLn5w1fMKt0GMEbNiN3enKQyShUum9SWbJSoPKWyJC+iElWQh7lui7C5yWw?=
 =?us-ascii?Q?lHXr6yoMTXw215/V427wLW68ogTowFJK2OVlX7ykPILQ2hslx073Wx6Nfoyl?=
 =?us-ascii?Q?DTOIM1dmSJEY651lHVw/04mcn5Vjq6qJArFB1PkkUoC/CmSaBoaJu1d3EbqS?=
 =?us-ascii?Q?gzeyYnRjZ+OOya+vYLpPguL6XrS/SwuJXIPX11Kuvlt4Gqd/4RINB4aZMWUD?=
 =?us-ascii?Q?7QPg+J6c4k4njaaLEyRlsyUl65Re99Awlijed16Ai30HfkhhGRHcVbGIxX/t?=
 =?us-ascii?Q?gr4RehC1+IiD07YLD7fz5KNpyYJMLlFIU5k2QdAoSVrfpR5/1ydSn8Rf2+Q7?=
 =?us-ascii?Q?y9iP8y6xv79esjANCgPsOyG9Ot09SpZLXNC1voBF7VDC22r46zp9CudKUpSG?=
 =?us-ascii?Q?81QNqoo5Npaej/kWwt+Kb8jFmPiVRogBwRWo9leFTmLImMJ6jcQXnx7kCI8n?=
 =?us-ascii?Q?HyqyX9NV02TBSpMqsg2EhorOdRj7ve1UER390c/1OYv+jn2pEDgT4vmN3tSD?=
 =?us-ascii?Q?JU8S0rbENGLLHgI5qkino8MiKQRrPik/7AaSHlsBhWoWiKM0YgQsmXsNUf0X?=
 =?us-ascii?Q?2FnjDlG29lhS9o75NhkVAmaM1XGi3IDq9hpQ46N4cfr6Bj2pfG5xngcBVU9c?=
 =?us-ascii?Q?LIeL0uFWVM751yOYWRC/8mLX8vax67WamOVlYwVp08tCZrwN7Wz/b+5N5NRP?=
 =?us-ascii?Q?mEF9iqNN6Yg1TIm2lA8+4nz2j3CKQZr3slNU47dueFMZ98b8MnhhOZoEvBYf?=
 =?us-ascii?Q?shkozX3OyBajnywz2spWBWESJrrLRDhsT4PuzGDPt6dxBNSSfb3fBbtEXelW?=
 =?us-ascii?Q?MMR5ziDchdSTXx0S2/XXMzXGPDiBNWLgoad15WKmXS8oGZbgvXfHrQ5ZTmSh?=
 =?us-ascii?Q?pU4MnMUkslYhZzR/pDgxLdEKROoc+1w9r7mbSuOlJ37q0Vad0Et3Nmpq8WIf?=
 =?us-ascii?Q?VP2XK1rZZwDdwdlY7qpGLAu0ccg8Z6eJpf9EbByV3TO+OfEqL5waJUqSe0F4?=
 =?us-ascii?Q?uIyCLWhOe0jjIBuQJFea/4o8J1jIBiPhwH9GeTkf6I25V1QoNt+jyg/S0cWf?=
 =?us-ascii?Q?ixwjkpJQ2Mq5IB7L602dn43i6ceKWDrAYpgeR2y+RF+1D1nSwd3LlUlgjvWO?=
 =?us-ascii?Q?U9W4M/FJud3gI22WRT9PSSAppjSHTlfc552UP8ZSfVlWcH3uBVcJCp0E+Zeb?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12efd36f-4d2b-4873-4cdf-08dc7f341ca1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 16:34:57.6623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCe027ijRmoCHFwsV2YW01cuMyV4D9Y496Zz4eqzZtO3h8XLF6AXfiB3ekNJz+LSmF7TDkDk5cwDjyEq129OdhaP6YUxdDBy5X76Z2naCOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6552
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

On Sat, May 25, 2024 at 06:19:33AM +0530, Pallavi Mishra wrote:
> Enable feature to allow memory reads to take a
> priority memory path. This will reduce latency
> on the read path, but may introduce RAW hazards.

You might want to elaborate on what "may introduce RAW hazards" means.
I.e., it's worth noting that both kernel *and* userspace-submitted batch
buffers may now be subject to read-after-write hazards if they don't use
MI_MEM_FENCE in cases where there are assumptions about operations
happening in-order, but where a read could potentially leapfrog a
preceding write now that we've enabled this.

Presumably since there aren't any other changes in this patch you've
already confirmed that there's nowhere in the KMD itself that needs
extra fences added to avoid read-after-write hazards...you might want to
mention that in the commit message too.

This could expose previously-harmless bugs in userspace drivers and/or
IGT, so it will be important to make sure we land this before lifting
force_probe on these platforms, otherwise the appearance of those bugs
would be seen as a KMD regression, even though the bugs themselves live
in userspace.

> Bspec: 45845, 60237, 60187, 60188

45845 is a page for pre-Xe2 platforms, so I don't think that's the one
you want here.  I think you want 60298 for the Xe2 equivalent page that
documents the register bit.

> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 263ffc7bc2ef..4e8f9a61f0bf 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -104,6 +104,7 @@
>  #define CSFE_CHICKEN1(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
>  #define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
>  #define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
> +#define   CS_PRIORITY_MEM_READ			REG_BIT(7)
>  
>  #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_MASKED)
>  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index de1aefaa2335..34aa8b5270b0 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -424,6 +424,13 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  					   0xA,
>  					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  		},
> +		/* Enable Priority Mem Read */
> +		{ XE_RTP_NAME("Priority_Mem_Read"),
> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, 2004)),

The current platforms that currently support this are BMG (graphics
version 20.01) and LNL (20.04), so the starting point of this range
should be 2001 rather than 2000.  Also, since this is a new feature
rather than a workaround, the expectation is that it will (probably)
continue to exist on future platforms as well, so it's best to just use
XE_RTP_END_VERSION_UNDEFINED as the end point so that we don't need to
keep coming back here and updating this for every new platform in the
future.

Also, RTP rules using GRAPHICS_VERSION[_RANGE] only get applied on the
primary GT.  If this feature is also available on the media engines (I
think it is since I don't see anything in the bspec implying it wouldn't
be supported), then we'll also want a second table entry for those
(i.e., pretty much a copy of what you have here, but using a
MEDIA_VERSION_RANGE(1301, XE_RTP_END_VERSION_UNDEFINED) to capture the
media IP.


Matt

> +		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> +				     CS_PRIORITY_MEM_READ)),
> +		  XE_RTP_ACTION_FLAG(ENGINE_BASE),
> +		},
>  		{}
>  	};
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
