Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456CBCE7AA0
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 21:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE33710E8E5;
	Thu,  5 Sep 2024 21:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4hoARt8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED12210E8E5
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 21:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725571203; x=1757107203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ndSl46cobCc35c7eWYPHLRsKv51iBb1uMokjjyfv9uU=;
 b=B4hoARt87YSSbzSYombdJrx2hQY4PcFTJqHln0Y7mmjUnr2+gcfnGtRT
 AZbDHiw+fBO038bFWRcn1YFSH0Krd9pnRoHF7pNHBH1BQ82O6SCykgBt/
 Opo6D4yaQCSNeyOV68GCn6U5Wg19VaiR4mDI55BkQGg1qbUuxsjFWZ8MD
 fnFnvNPC07/fUeIQHv4Fu4wleOP5sqHGHLTHFquwpx/rzx59TXYc/dFd3
 qj83DgkUwuaRzgVq1Qpg1RS5lXA+SBlK2qP9p9gZb+dLYzIaVkls7/XHi
 AKbMS8ioXbJ/YTxfB41eg5DomEOdSloWgHps+G9iNk4UwotV1j1FyIM4u Q==;
X-CSE-ConnectionGUID: rHgdZSqoSwa5POpQ4Docqw==
X-CSE-MsgGUID: QO2zt+b0R/GJU5IxprOmLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="28201272"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="28201272"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 14:20:02 -0700
X-CSE-ConnectionGUID: 1f1VgWdNTzyjsZ7sqwkKVQ==
X-CSE-MsgGUID: 1yGsdtkzQtq8UXB9ppZJhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="66080085"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 14:20:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 14:20:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 14:20:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 14:20:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 14:20:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEdq+6/b5utacwzSnHlYzVGZcxwV2vW5Kvl3R7BM/0fiYj3Z7KPE9HLZTupsJHb98e3b8SLDWmKnWj2/AUVt8/W//10qV3tYI7rLEtU36LMIdO3zgRyWQ5SK92Y0/1g3qncTgHeWrnKe5pq0aeQN2JJ+08jaMa+/XS549hiqvP0DnUsOUBTWrvJXjY5varOiId2cp1sCwOj73G76vsd2D2/KlSzb3UjVe4NgH5Lnk+jMcualaqVFni2dzw/1l0bqAZ262rtqLsuEls2Nz1Addluse4u+uupYpmoNt7WoJvFkiSsCbfodBHGmJ4xLrQqJXSeOxudnjEDiy71mPt/5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIONrPlznw/k6PVGYEYo86fBo3uVq7gBK++Boj0CPcU=;
 b=QqYjV47+WttmZmGH/wk1er2pYxPwSlP4JceDYKBwlj6m2Gfc4fOsh4K45WM9j2DSVGVB8GB6YFTs78vGRZlHLo1NSOr0eAZ3lknHF6HEikI5JEfL5sG2mQvV71Xh6Txx5ASYnSP4yucdSrNnjiNx5ETiCdgjQU2HOp8IGrPAYtsCzS9QomposC9k4Jydo2V0xXfv95aNOIayyDljtrVa+/ypJvtSjsKXi3GS+kFv3byhuv25zXLgfDVTRcMSk6FvwZWPwo1y+sq4M6nIH9U01n/IpcL9Kb5v09HvR+dFjfyQV8kUB8I+sCD+8SDUd4v4M1rmuSwjWu3Wq/L/pzj8HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4644.namprd11.prod.outlook.com (2603:10b6:5:28f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 5 Sep
 2024 21:19:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 21:19:58 +0000
Date: Thu, 5 Sep 2024 16:19:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/43] drm/xe: Clarify size of MMIO region
Message-ID: <paxfvqpoibrtmyiblzi3hhbrgrqebaijog7ze2oo2fuunq6tdb@uwh7on4nomqn>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-48-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240904002100.2023834-48-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:303:dc::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4644:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d2f4dab-4ed4-46aa-c544-08dccdf07f0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?paHUliOJxKv7TZa0fvSkv+TkLNxM2b/yABTkzJRSon6DhWbduOUzbtIeP4di?=
 =?us-ascii?Q?bSnHxsE5RkoiUTh5Wfs9Ruxo3wYLguJNAA2xDLAX+dGe28T5i7XbYdDw7Bw1?=
 =?us-ascii?Q?C/KmbqDISpUYaoE3mYw90iyFi5Jf/Dpsmk/VfTAD1bKl3kLav5PUbpljJlsz?=
 =?us-ascii?Q?Jj2O70tSzd6iiy9fNsX9MwUIWhMtZgZhATOjdgKP0pw4oW/5L1oDjkldMu4e?=
 =?us-ascii?Q?5ouGDbgfVKAmFG5fyixL4CqBpnuAQI1jvWJDamaWvfMc7MavgfK1IMxGMIOj?=
 =?us-ascii?Q?tQEU+ZMeUpf3Y8hoS1rIXtoJQPZjJtIhP5VjF3alyBsVK/TjEVALP6Ix4MdL?=
 =?us-ascii?Q?mH9NKUsSB6xGV62Sr60/dutWbnQKIqeiPvja+s2QgrKXm1ZV///EIQ4PxJil?=
 =?us-ascii?Q?otwgg8smp8JoEAaV3/b5xgSJ5WiLyFW7y2TNqLPCKlZBossRHbpXFChguro+?=
 =?us-ascii?Q?FxKt6tDvbxYXmSrz/GNH11xZIB+0VaS1I7+7qXa552CM0RTdySYsvzQOTYnK?=
 =?us-ascii?Q?pkGpEGXYwf2/dfcT4Z4i5mVPcE51APwuuv/iL3d105srybIrQd513h76kpUy?=
 =?us-ascii?Q?NXqWtkPlHQCRj4mogN+b04ZuAM3j0bQVAjQCYVqpTm2WhoetfNa0obX74Md5?=
 =?us-ascii?Q?FynhX9DnPmowK36NEo8QSBoHvxZdsjI0r8doOvg0G0O5fkyPTLxPxd5CBOj1?=
 =?us-ascii?Q?CyqU08+WXBQmsjyvf7YYSx6p0G+q30z/V8ziLhJriyTnxOaUW7PR4VvIc3NZ?=
 =?us-ascii?Q?XhlCUeCWiOjO27YvbsmnykfgVo1gCecA/kP75AcH5dfTPuOW//dndWR/3w9j?=
 =?us-ascii?Q?oBkR4KLZdlcqQZ/gvj2E/XIykpT9i0GASGiU2DSCqrs2zFMCPYRVQJx3jO5z?=
 =?us-ascii?Q?gqSTjNo7xf4kWTkndmWCzw/8Qs0mvjVwWPctkNnOWOVgZbnSm6k0CVTX8UnO?=
 =?us-ascii?Q?99obazO4fJCUKXibOr6M4uyd4SToZbcVQvvl9Lyuimsr43T3xOsowrjPiZSs?=
 =?us-ascii?Q?q0yQ1WyoVLhJ/W+V4yIlxyyahMer3FQ8o+4XYxy21kn2x21WlOonLaQQYlr0?=
 =?us-ascii?Q?LT56qiX6GAsLo7jVCuiNbs+fDXqVO6fzbm8NTVUIRAAQyYkXZUlpkU/kT/VZ?=
 =?us-ascii?Q?DnJK7Y5lCswuuIWjkrpuo8G0Hayq3iXDF3unkSiOXhabRscKg/mTJgnSIHrr?=
 =?us-ascii?Q?yxKiwzoRsuzjda8M6O7+Tfz+LHMhjNvM1nNbhVGvghYGcA6B2my4UXJ3DfDW?=
 =?us-ascii?Q?YuZBkpZ7jtE193m3bXqDZEtAKRJO0xHVGei5dTLCGJQCdcDqXRZEqvXHovA5?=
 =?us-ascii?Q?Zn+Z+vFPs3jnKRQHQ8L4bgWKbSZ3IMCetl2EEVXeJm0vmw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D1NTX0zPrzQXNceojHb2o0weNRE3994Ihcbhc/hokUXzRJ/LkhXTWoGf/gme?=
 =?us-ascii?Q?LA0eZB/78Qb6JfFIQ5FL7UVWaPLftmVa0BYHDQrK3qev8g4VnBiGl7RLguTS?=
 =?us-ascii?Q?STtoTxGfAtCUk0S7qUTVKmY9jzr4mYxabpvtJvFVcKBZt1gKswOgYYrYnMy8?=
 =?us-ascii?Q?YbUNT823Q9RFB2ai/sjoAtKmK7ibTsDsfj4lTX20MtUg+1+W/hUqGpnG1ih+?=
 =?us-ascii?Q?5n6OGvNpsmUQWJ6ffGuOCenDUuZd+KKXR7AdvGDqqElEQ5qqs5ODrSK6GvVw?=
 =?us-ascii?Q?Vx33sDQQ5bc43iLed0WIqvKd7zi63qshCyqt928rgGyDewKmaaFZxqa2wuok?=
 =?us-ascii?Q?ZMi9t6RkzsKuYlm3auB511NVKpdtHWEioYji1bK4BtnsMRIL0y8UTRm5f5rd?=
 =?us-ascii?Q?6lF7Z6qsYFGa0ZYrLozKkyPs+/QDCYqhqORTwzlpx20t0CvVeqkMXEX8UP0M?=
 =?us-ascii?Q?Bx0FYa1zCexsBESvOXlozq2Biwti5pvFG1E2G0GRsiMOoZu2u1g02MK6SSyw?=
 =?us-ascii?Q?MxnpEQM5sFRJ9YnfQQclh7YaF+jDBVb9cw8K7cFx8OJ7Lc90XN8l6c2Ag8T0?=
 =?us-ascii?Q?ho0xBgFDkdpV2jL0bkCfUqbfeRLBH66CBZtC1xU8Dp63VNyKwN0IOQTkULWY?=
 =?us-ascii?Q?1dcz1R62gRBFCaiqDQWVBBhg0GEnLJC2MXs7QPKe6+sG3bmF6y0jZt+3uRJN?=
 =?us-ascii?Q?FYkmSPiXld7HdEmQoCE7HbXMV2hdMWSsz+ULV+vqAP4tI4KNPXfs11PtvCe2?=
 =?us-ascii?Q?nRkJrwAVuD5xW1aOoR9QCxFUT9+y5eaSAfkA9SV7JzxzT/7R9GbCYYFSECO8?=
 =?us-ascii?Q?cR5UZQBGwqpWCjPXrnOuUPfahkoLgIWRe/Aw0OXQiHv6s8J8wpNg/42aWvWg?=
 =?us-ascii?Q?E+AvRyoFI3Q93CfbFnj8hBMtj+S7Zm3ttpbj1bpd3jSIcUK1YnXwqUIYaFJ4?=
 =?us-ascii?Q?/aSAkqWj5G0cySMqjlMxRBbP83lBq0dcft9zijP1rgvk8Lv2T4wdxYC2+m+z?=
 =?us-ascii?Q?A09qXX7dSnBb25KuR6w/UIyHrE/oPfi4UTt8y9CKl5Vs9c4HnjnYZx5ZxmE0?=
 =?us-ascii?Q?HLYr5GhCL2OqjuF5KLfXODYW8abrJ4o4/jIySuMnLmId4+AQJaM0MdjE9CT0?=
 =?us-ascii?Q?jDQlAvvzOCJm4/ruY61jLL7mypES69D9BqH1pc0pXcKrAZqM6SlNlmdJdBom?=
 =?us-ascii?Q?vvdKM6sBA57DZOspmStCzywJZlGcu0zphQ67Y90mKfyouO/anqg1hcV/8ZKV?=
 =?us-ascii?Q?FM5tnuuBHAm0Py7sqMNVcyzYafeu57VqMPN92uo9BFlShPsTv/EYBpeOlALK?=
 =?us-ascii?Q?mwcU/aN//GrcfSWmNaX8P0g9gk+NIjioRl2xueUxumsQv+/+Aobz2U2vazF+?=
 =?us-ascii?Q?s/+kr6s0UoRcYMZit4OZN4KDrJXH7B8sNxIkg2U/YqxGXc9yk8F2nTam5+qT?=
 =?us-ascii?Q?FYH9JvuM7IARDwf8uiGE+6jh3w4tuz1gYR5yWqFW2r66j/zi3b464SEZJLs1?=
 =?us-ascii?Q?YN6wP9Sh6mKR5zXdVvGUjWTlzaIWAA81xh+KnMyif2D7gKBInP3TakYAvBXq?=
 =?us-ascii?Q?8uTKFDzd/SCaJhr3J/ev69H4LGDOQjjuiNfV7+f8vhDDKvM2cCddYm5ROwdm?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2f4dab-4ed4-46aa-c544-08dccdf07f0b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 21:19:58.9065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jB7N2Pe7Jey6iHbWpFRfVYzziLjlpfODw3MTKhpXYDn8fJC3W2ixKXwwPxUnsCm31g9BvSrh8g1zxQ07F6Hacya8DOQAM7M25amo701hTJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4644
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

On Tue, Sep 03, 2024 at 05:21:04PM GMT, Matt Roper wrote:
>xe_mmio currently has a size parameter that is assigned but never used
>anywhere.  The current values assigned appear to be the size of the BAR
>region assigned for the tile (both for registers and other purposes such
>as the GGTT).  Since the current field isn't being used for anything,
>change the assignments to 4MB (the size of the register region on all
>current platform) and rename the field to 'regs_length' to more clearly
>describe what it represents.  We can use this value in later patches to
>help ensure no register accesses accidentally go past the end of the
>desired register space (which might not be caught easily if they still
>fall within the iomap).
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h | 10 ++++++++--
> drivers/gpu/drm/xe/xe_mmio.c         | 10 ++++++++--
> 2 files changed, 16 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index a02e5dfcc6a7..7427f40086e8 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -119,8 +119,14 @@ struct xe_mmio {
> 	/** @regs: Map used to access registers. */
> 	void __iomem *regs;
>
>-	/** @map_size: Size of the map. */
>-	size_t size;
>+	/**
>+	 * @map_size: Length of the register region within the map.

see review on previous patch

>+	 *
>+	 * The size of the map itself it generally larger than the iomap; the

... is generally?

>+	 * map itself is generally shared with other regions, and also includes
>+	 * non-register regions such as the GGTT PTEs.

There's some repeated sentences above... Maybe consider a reword like:

"The size of the iomap set in @regs is generally larger than the register
mmio space since it includes non-register regions such as the GGTT PTEs"

I also wonder if we shouldn't break the map into smaller regions so we
don't risk having bugs in a lower region overwritting things above it.

>+	 */
>+	size_t regs_length;

why not regs_size? It seems more natural than "length".


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> };
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 3fd462fda625..ad6a7992b00e 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -36,13 +36,19 @@ static void tiles_fini(void *arg)
> /*
>  * On multi-tile devices, partition the BAR space for MMIO on each tile,
>  * possibly accounting for register override on the number of tiles available.
>+ * tile_mmio_size contains both the tile's 4MB register space, as well as
>+ * additional space for the GTT and other (possibly unused) regions).
>  * Resulting memory layout is like below:
>  *
>  * .----------------------. <- tile_count * tile_mmio_size
>  * |         ....         |
>  * |----------------------| <- 2 * tile_mmio_size
>+ * |   tile1 GTT + other  |
>+ * |----------------------| <- 1 * tile_mmio_size + 4MB
>  * |   tile1->mmio.regs   |
>  * |----------------------| <- 1 * tile_mmio_size
>+ * |   tile0 GTT + other  |
>+ * |----------------------| <- 4MB
>  * |   tile0->mmio.regs   |
>  * '----------------------' <- 0MB
>  */
>@@ -90,7 +96,7 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>
> 	regs = xe->mmio.regs;
> 	for_each_tile(tile, xe, id) {
>-		tile->mmio.size = tile_mmio_size;
>+		tile->mmio.regs_length = SZ_4M;
> 		tile->mmio.regs = regs;
> 		regs += tile_mmio_size;
> 	}
>@@ -172,7 +178,7 @@ int xe_mmio_init(struct xe_device *xe)
> 	}
>
> 	/* Setup first tile; other tiles (if present) will be setup later. */
>-	root_tile->mmio.size = SZ_16M;
>+	root_tile->mmio.regs_length = SZ_4M;
> 	root_tile->mmio.regs = xe->mmio.regs;
>
> 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>-- 
>2.45.2
>
