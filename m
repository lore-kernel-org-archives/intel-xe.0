Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0E3C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 19:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4E810E648;
	Tue,  9 Jul 2024 19:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdL1u7+z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E611E10E648
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 19:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720552564; x=1752088564;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RHJdEnLbKRsg2a925lCA2dZWR7DL0nUgSLEJ1WvZ8ic=;
 b=IdL1u7+zaW7ieqqn0YKcm3LHwlj7ozTxInZikYQvZzLkjZ+7WkKC2Prg
 0D1uzFUeVHyfbpzP2UAtgAS5hHVm6jv2i2a03t0bN3xYkcrKyWbs0TBjo
 UDFVlijVZdmFhuiqUkpmgwRm+WVkFFCuu5G5kluu8/xU7lA4txBr5/GeI
 x4Xbm8zAPftDnTOiHZcn1uTKxi0ir73vFG18Nmisc7tMeF+3uB07Npoli
 ntoovYFJGNpg6g8UOHxBAVZ1R78ljyJ8HzuRsZwwLUlL9sKTDV9U3MIzW
 nnXbXyD/xFA3PcCIJ17k6syqRmGolu1S1untyIWyZ2qgi8hzFlN+Hn3+D w==;
X-CSE-ConnectionGUID: 7iogYC8cSxWQrQT5FnBycw==
X-CSE-MsgGUID: T29wm4EeT927uN+7cYqKFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="18039043"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="18039043"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 12:16:02 -0700
X-CSE-ConnectionGUID: namU+pgLRwyWXQCRku46wg==
X-CSE-MsgGUID: Wf4FMEvBSmaUvFst4XclPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="48620723"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 12:16:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 12:16:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 12:16:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 12:16:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 12:16:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2TZdbrXM4D1GO+RSK4F8H3jdAZ6Ych+L1gZi//1qZh0eICIPIdR9lJMsNXro4RkCjCg99nhYkUc7f9BjNMWmeslNshBWx5KwM1krfRBwvbClP3Uge8mJDk5RzNvFl42ocwGQ0N+VcRlo5gSh9p2xjuOCdkthlymIOlEk8MTsJE8JA2LjJwWERNzo8Ih+zPyiK/fdb1GWGf6/LgFQWlo3AQUtrp/QidjbE5MTNn8z8mj9kY5+snEXK3o3uJ+LjwWBjzPdh+BjbiIN5qmi8be1Yb1CRAcIUdxOICF/8LauZWOX19BxwNHgFIqOGF2UbaesFk0KdDTvNXAWiFX9iMvXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rp8YRx+cFwVvShmiI/ayFyZRFWEj7YIjSDQB45fVtMQ=;
 b=II2HoK3pZLBsfa5sEEygmXazXyc5/xyg+bpScDokn+3+hF7SPlhBgHJIj1sbBZbEQ9c/DCwkjt7GHJ5NxoVLGX6HGAGPKs8eAN8UvGDFakkcBtICyBL2dQ/UjK87YL6nAVTDqwVQkTK+UGSF86vjcVl3c685lOmt9plessgmW+X7+Wjoqf9B0OkYep+DF20QwmIEU7mnHkIoBD9H07LwjoaNZ578aVy7FJCU129qK8Ec8VXONfibtT95TNjp6yiOKX8gY6cdfqkh9Fa/dwyKCavMpMLGfQEulVhNvfQf44nD/dZ1NQf44FRWZ+ZCmjNRk5PCtvntrnu6Tih73lJxkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 PH0PR11MB7422.namprd11.prod.outlook.com (2603:10b6:510:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 19:15:56 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 19:15:56 +0000
Date: Tue, 9 Jul 2024 15:15:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Tomas Winkler <tomas.winkler@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/gsc: add Battlemage support
Message-ID: <Zo2MZKndMo9l3KRh@intel.com>
References: <20240708084906.2827024-1-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240708084906.2827024-1-alexander.usyskin@intel.com>
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|PH0PR11MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: 357af2bd-eefa-4bd5-9453-08dca04b8ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tizxJW8Rbon8j30zvAFiXw+konIZAw9G57yDgrVVc1HQSt64mrRLfBbz2q3n?=
 =?us-ascii?Q?u9+Z6Q7y/4WYnt0Vjmx+dFee9+5Ol0ANid2ohsO6FrjVDmUS9/0BJx1WZ7My?=
 =?us-ascii?Q?sDrriIKoIdk3zsVaEfNClDRGSQfiGYO733LNeGGXOLHvcwAs0fWEReP1nGyr?=
 =?us-ascii?Q?mOacIWfr2WAgLq2ypE/VP0lVI/TLDgyULl1nqtxWMFgnU8sFdidiNp6rvhNE?=
 =?us-ascii?Q?n9KCwH33ohCB+8XVeDKqlxhqwYIcQt6Cu1bD1uWQ/bdDCJj4M1Wgih6eVp7j?=
 =?us-ascii?Q?2dt5Qej702Yjhu+n7nNpYgtD6zcYZu9iewSy9P4d8SY4uY72wGWv6h1kxRGT?=
 =?us-ascii?Q?1LP3t64oguLmKCUsjK8eDHlVlmbYITwfqni5A8iWc9h+dy8B8HMa/BjRm56u?=
 =?us-ascii?Q?n3iTABcOYMM1uAd8mjwEQlrLZfHp1htnTyWM0Y0YXqpsSWtaewg4OSyCq4bF?=
 =?us-ascii?Q?Fi5zh1GXvgfSwkBLCZO3WIJ2YEoOvjupHQNomOllEZILrmtAZhUi3T+4fNgj?=
 =?us-ascii?Q?P2tLBlNi41kTw4FuLmuI4G5VK9qTKulq2xuOqREGjVZ2tJP5hOa7XH8umB7p?=
 =?us-ascii?Q?yGnXcaCZMxaWRsNNQ1GVBToro8UCn/c5sW7r8YWFgZt7HHJunpftIunugmP/?=
 =?us-ascii?Q?W1ujuI6M5VJE4suoWZKDouydN9qGbjSJIr5NQEQAajmDOTJ6yY21YJ75mPiK?=
 =?us-ascii?Q?xuRvjwCE/DFi4AG+s2Iwi6TcEVzO9/Rzrq0Oc94aA0Rsx7mqNpAKzBvGcXMs?=
 =?us-ascii?Q?FhjqsrAsRQiBpI5aacVLI/4E1qUHXw8YeEodYkNDeKW1vMJKJuTGFQpfus3v?=
 =?us-ascii?Q?wu0GOjBRdQ8jNsCKMZeblrjST09eqlgT90TzIFfdY2LZV+VS3tOIX0W9N0MR?=
 =?us-ascii?Q?1mx9WH6C4G3tC4MWvBdudjgRDoEi7ML0By0EW4cqomogCLuEW6Zgf/7EX5ru?=
 =?us-ascii?Q?yiGfdxCsEhMPoFd5NXIKrF5swrZcRQdYoQ+X7rGomO7RG7JFdejWG8iM4YG/?=
 =?us-ascii?Q?xFqqcV/llTfvTxgLG2KAbXXIhYVS7xVBou39lrL1rywfA/KNTVrKVlfS+L6x?=
 =?us-ascii?Q?yDVoCguULCVaWB6AmzBl2DGLrkxIPA2i6Pb7tzLiQ4rJ9mWAJk9cbwXSCtFL?=
 =?us-ascii?Q?tuy9LkP3s7b1fZpeRZeqbYU3dcglHw+AGPgI5tX6qh2x4nKcMgpoMbb02aeZ?=
 =?us-ascii?Q?Q4N+jHy1tD/OQo4UMkIdpjRraerCLhkqcvar0o4Jtrq8VIRm8d0AtPQtvh/T?=
 =?us-ascii?Q?vyN5HfJSXPAi+z3BB76naS5ui8V1syA4zigtgZuZbjw9Ldow6OGsED8bFY2f?=
 =?us-ascii?Q?O9CQrHF1e0jK2/fwpEfRGjfV3l1k4nzqtD+lW0vFgv27Lg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4eIigaJ6323hduAGDvJiXV837llewBvQZyHdbOqgoZbVFsOBNDCy03D9Q9p2?=
 =?us-ascii?Q?rW27eM04C9WI5qvg/qqSw0M2UTjWtKTVneH/cVUuWw4ef5rmqfFiwXhu1hKO?=
 =?us-ascii?Q?F+V60JtB5gXgFjKq1hYYv6kXhDmZbfgjhhPBe4ArGhmKHZ2BLdpWZnF0JFp+?=
 =?us-ascii?Q?ogoKpTvJ1AyyygywFFR655dcGXRWjKbhpHKcvX7Ni+bXoiCWbJmWg3r4KQ3r?=
 =?us-ascii?Q?7KznNMNmQuF2s75LewWMbVrLWbd23xSGOBoY4N1Zhye+S3KBA9G+jNU3qxJr?=
 =?us-ascii?Q?wkXyYXQ+D//xLinYax72zA0nreQ4CFZrGqoPwFpiXZKPfjRqXqXmy/SnuIu/?=
 =?us-ascii?Q?Yf77bWYjeDVVBOmVLrx3OqSxxn5ZSqo5czImWWI8WwxrfW0CaGdp/NBYpCT0?=
 =?us-ascii?Q?SJqwDo3dJWFL36ZZEjUjpuiWPlTiuzVbYHw4STj1Oh6O5llK16dm0fHhhNA3?=
 =?us-ascii?Q?nbWeUtFg4E2nc2VPWSOxZzGGaKrnv/lvcq2zs+IXXPFGj+9dzJF8/TURZpJe?=
 =?us-ascii?Q?1J2j/A4i1W/QCbcLCosBITrwyhS2HSgHZBRFjQiC4G6XSPk3dtMRTbuBqE4h?=
 =?us-ascii?Q?Ud756VjnxD4YWBz0+PUfWQiEtgo3ZfckF/VMsLJSw/+1XSGEgdnbQ5hhOAtD?=
 =?us-ascii?Q?+BAdWqlKKyRy2VZrPd5WbtICKG+/hEj5vN80AsnweNr8KOtzF/UGDuKVv729?=
 =?us-ascii?Q?Fd2Xv+gxhlS0JDA4vIMQ7mcIyldq3882EwnC0Vev/7Nq4XwW9GG96i/OE1g7?=
 =?us-ascii?Q?BUxk5P7sL/qHcVArNp46H9cohQ4lS9oylYU52pmKrulyq7ADPbJvcjfpbyhN?=
 =?us-ascii?Q?B5hdbgkMIj8dTtJS6qlOXFr5UqcpiLrYNaA783uUHcf+gcudh+qqafe/9TRG?=
 =?us-ascii?Q?p0anBqCXhJPZsSlbIxChOyVfO4qwKswpSN1r5F75Q13vTJrJz8Ozk9KU3Akl?=
 =?us-ascii?Q?N67AO28P3rA32AfTjP6UBnus+52SiHBzlyMxOD9w6cpz3E5OWs/oMoZdfXlP?=
 =?us-ascii?Q?5/y0cYXVoceBItRqFMneaA6VnqgJg4Vdrezqt0ZK7XgdKVxQkkXwi9J1AUc3?=
 =?us-ascii?Q?4Yed+cycr/lHS2MKR3XiUbRyjnaj6bUwSsoJGgtUGyF403kC/fmAEC5/Px3U?=
 =?us-ascii?Q?qgqeHFkOnuVSKQss15u3ARK8ZWVEN0hl17/9NQSAbTSEEI6qNlEtyvJ1Ljo6?=
 =?us-ascii?Q?S9WBAFjiyxfwAuIrasZrU+B6s/hdCHrIGWi5elo2SgVTwB2LYd3/3Oyr4SlS?=
 =?us-ascii?Q?yvdInopIicbr9mQP0RyG8aJdyJvpDJECGuscnwAw5wEP0wRl3mHfa668IsaD?=
 =?us-ascii?Q?mSPC8n2svNDxSuXALs93ZZdg9UIqm4Or6VGH0EUNNX6iT3rfzctOHulPtYXg?=
 =?us-ascii?Q?muHzImwoxQYVnsHarJpuY6HyiSxxvBrhrlY32V1Gw1MjFYOldrLsWJjin9gn?=
 =?us-ascii?Q?0l9LjjAxOEUyac8v3ZjUPBWVgyGXyPLHkAf2E+7Z5GXh+n8UYJF7PUmRVdhY?=
 =?us-ascii?Q?usf4MIW2DOH6B6FoP+DrHmlnzAWgS/Bo56IAamye2MSb2MAvOEh2aOBSEh9R?=
 =?us-ascii?Q?mOhfcC4dfzfRiMFSLW+UxAvXACyhij27+qDiy6A+zRCogl5GTfzHLklKmUeV?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 357af2bd-eefa-4bd5-9453-08dca04b8ed3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 19:15:56.1428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ov4fnR2uTcHy5FQb+42jRt1uyaAINSP8dazOTfyqj7rhDYmENHruVMW3sHr/UDkvG0MN/xZxhWuTi5o12wL1nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7422
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

On Mon, Jul 08, 2024 at 11:49:06AM +0300, Alexander Usyskin wrote:
> Add heci_cscfi support bit for new CSC engine type.
> It has same mmio offsets as DG2 GSC but separate interrupt flow.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>  drivers/gpu/drm/xe/xe_heci_gsc.c     | 28 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_heci_gsc.h     | 10 ++++++++--
>  drivers/gpu/drm/xe/xe_irq.c          |  2 ++
>  drivers/gpu/drm/xe/xe_pci.c          |  7 +++++--
>  5 files changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index f0cf9020e463..8e81ade7279b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -44,6 +44,7 @@ struct xe_pat_ops;
>  #define MEDIA_VERx100(xe) ((xe)->info.media_verx100)
>  #define IS_DGFX(xe) ((xe)->info.is_dgfx)
>  #define HAS_HECI_GSCFI(xe) ((xe)->info.has_heci_gscfi)
> +#define HAS_HECI_CSCFI(xe) ((xe)->info.has_heci_cscfi)
>  
>  #define XE_VRAM_FLAGS_NEED64K		BIT(0)
>  
> @@ -289,6 +290,8 @@ struct xe_device {
>  		u8 skip_pcode:1;
>  		/** @info.has_heci_gscfi: device has heci gscfi */
>  		u8 has_heci_gscfi:1;
> +		/** @info.has_heci_cscfi: device has heci cscfi */
> +		u8 has_heci_cscfi:1;
>  		/** @info.skip_guc_pc: Skip GuC based PM feature init */
>  		u8 skip_guc_pc:1;
>  		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
> index 1c9d38b6f5f1..65b2e147c4b9 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -92,7 +92,7 @@ void xe_heci_gsc_fini(struct xe_device *xe)
>  {
>  	struct xe_heci_gsc *heci_gsc = &xe->heci_gsc;
>  
> -	if (!HAS_HECI_GSCFI(xe))
> +	if (!HAS_HECI_GSCFI(xe) && !HAS_HECI_CSCFI(xe))
>  		return;
>  
>  	if (heci_gsc->adev) {
> @@ -177,12 +177,14 @@ void xe_heci_gsc_init(struct xe_device *xe)
>  	const struct heci_gsc_def *def;
>  	int ret;
>  
> -	if (!HAS_HECI_GSCFI(xe))
> +	if (!HAS_HECI_GSCFI(xe) && !HAS_HECI_CSCFI(xe))
>  		return;
>  
>  	heci_gsc->irq = -1;
>  
> -	if (xe->info.platform == XE_PVC) {
> +	if (xe->info.platform == XE_BATTLEMAGE) {
> +		def = &heci_gsc_def_dg2;
> +	} else if (xe->info.platform == XE_PVC) {
>  		def = &heci_gsc_def_pvc;
>  	} else if (xe->info.platform == XE_DG2) {
>  		def = &heci_gsc_def_dg2;
> @@ -232,3 +234,23 @@ void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
>  	if (ret)
>  		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
>  }
> +
> +void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
> +{
> +	int ret;
> +
> +	if ((iir & CSC_IRQ_INTF(1)) == 0)
> +		return;
> +
> +	if (!HAS_HECI_CSCFI(xe)) {
> +		drm_warn_once(&xe->drm, "CSC irq: not supported");
> +		return;
> +	}
> +
> +	if (xe->heci_gsc.irq < 0)
> +		return;
> +
> +	ret = generic_handle_irq(xe->heci_gsc.irq);
> +	if (ret)
> +		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.h b/drivers/gpu/drm/xe/xe_heci_gsc.h
> index 9db454478fae..48b3b1838045 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.h
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.h
> @@ -11,10 +11,15 @@ struct xe_device;
>  struct mei_aux_device;
>  
>  /*
> - * The HECI1 bit corresponds to bit15 and HECI2 to bit14.
> + * GSC HECI1 bit corresponds to bit15 and HECI2 to bit14.
>   * The reason for this is to allow growth for more interfaces in the future.
>   */
> -#define GSC_IRQ_INTF(_x)  BIT(15 - (_x))
> +#define GSC_IRQ_INTF(_x) BIT(15 - (_x))
> +
> +/*
> + * CSC HECI1 bit corresponds to bit9 and HECI2 to bit10.
> + */
> +#define CSC_IRQ_INTF(_x) BIT(9 + (_x))
>  
>  /**
>   * struct xe_heci_gsc - graphics security controller for xe, HECI interface
> @@ -31,5 +36,6 @@ struct xe_heci_gsc {
>  void xe_heci_gsc_init(struct xe_device *xe);
>  void xe_heci_gsc_fini(struct xe_device *xe);
>  void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir);
> +void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir);
>  
>  #endif /* __XE_HECI_GSC_DEV_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 85733f993d09..5f2c368c35ad 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -459,6 +459,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  		 * the primary tile.
>  		 */
>  		if (id == 0) {
> +			if (HAS_HECI_CSCFI(xe))
> +				xe_heci_csc_irq_handler(xe, master_ctl);
>  			xe_display_irq_handler(xe, master_ctl);
>  			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 732ee0d02124..3c4a3c91377a 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -59,6 +59,7 @@ struct xe_device_desc {
>  
>  	u8 has_display:1;
>  	u8 has_heci_gscfi:1;
> +	u8 has_heci_cscfi:1;
>  	u8 has_llc:1;
>  	u8 has_mmio_ext:1;
>  	u8 has_sriov:1;
> @@ -345,6 +346,7 @@ static const struct xe_device_desc bmg_desc = {
>  	PLATFORM(BATTLEMAGE),
>  	.has_display = true,
>  	.require_force_probe = true,
> +	.has_heci_cscfi = 1,
>  };
>  
>  #undef PLATFORM
> @@ -606,6 +608,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
> +	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>  	xe->info.has_llc = desc->has_llc;
>  	xe->info.has_mmio_ext = desc->has_mmio_ext;
>  	xe->info.has_sriov = desc->has_sriov;
> @@ -815,7 +818,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (err)
>  		return err;
>  
> -	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d gscfi:%d",
> +	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d gscfi:%d cscfi:%d",
>  		desc->platform_name,
>  		subplatform_desc ? subplatform_desc->name : "",
>  		xe->info.devid, xe->info.revid,
> @@ -828,7 +831,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		xe->info.media_verx100 % 100,
>  		str_yes_no(xe->info.enable_display),
>  		xe->info.dma_mask_size, xe->info.tile_count,
> -		xe->info.has_heci_gscfi);
> +		xe->info.has_heci_gscfi, xe->info.has_heci_cscfi);
>  
>  	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
>  		xe_step_name(xe->info.step.graphics),
> -- 
> 2.34.1
> 
