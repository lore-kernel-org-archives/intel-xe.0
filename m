Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498E4E6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 23:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0281B10EB22;
	Fri,  6 Sep 2024 23:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEOD9TSb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BE010EB22
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 23:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725666768; x=1757202768;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z3vFz7m3KvJNowWA11Us59AQKa7SODisrtLbT1PS7e0=;
 b=eEOD9TSbUr0052fw27ZrrH6uSbrTWzjs09Ap+s0CV0hh82YFbFeVPMNl
 4ju4ny6zL040xCS20IEErCEFRuCjl3KQWgH6qnOin/ruYoGd2G7ebxsDk
 CwTmCVcPnGUK1CbcSLhZfSkDAvQ+o4gx+7FuAd2i6R5eyX8hZShiTiz1R
 XWv9St3YZ9loFcXDjNb/OhXB0ZkKXD42z3DYhEjnBhjhw/Bj8C5CvgQk/
 aQEt4/EcmoEMc7jQpzeP8cfeZOPIFXl6H8TxJ31TGO/PfAMykxS283/1C
 1ZnhbbwEmQEV4pfc0GNJ4kJ+8cl5G/IPuXLjHZd9dYxK/HYvgeqfyqnHI A==;
X-CSE-ConnectionGUID: VSxkWysxR1CmldTog8xJkA==
X-CSE-MsgGUID: W/kMxEEfRKGEKgGapO7nEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28184876"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="28184876"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 16:52:48 -0700
X-CSE-ConnectionGUID: //a27nXXTjiOFdfpvHtWxg==
X-CSE-MsgGUID: McQLtBPHSg+GTRmpTEIllg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="70230377"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 16:52:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 16:52:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 16:52:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 16:52:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 16:52:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwnwg2hxl2d3WtJeksg8PHqHOZewet9rxEHfSYh/ftniCMFzT8Vzoeso422J36K9U/7/Kbzr31j2YYEUPO66VfYIANS6bY9juaCU9FmQgiOYqP4JPclgbm9e+5jBSFIrf3utMmi5sdHqkYyrENBDh3aNSEYOZC1zmaVTz5Ohaii4UQ+V5DMFGIFQNlwCzCpwP9X13dPfRR5wau+OipjGMV8A+UQ9Se12ShoU02TaGjV+BQrQxnHFp2cU7aQv13SndDBwERz7WdX6lE0qiOyKFVcrTvSQ/QT71sP/dnIuHL+1tgQ3/j66zZvbjwl3/IiGzuxRUQ7VcvndJGvYof1JsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uhrER5ez+AzS5yJJVBGaDN9iofMXTGFHQZaxBUby54=;
 b=kK8bxqWKhXuuMQ3VjfKV/Qt5gDLjc3MUU5TYayPmgnDD6izAEc0UIYSoZc7HIjObt5f/6ngZoJ5SwA3r7ev3hoIvGIwrDDcWP0HQtvT24GdYRz6M7F2O0pPrJ+P4nTUEDaJrvcdCF0bCDDiciyHVvqG0X9AP2bAVdY6zDQeC3GXIky7pS/PuOqZBn1Kk6XmMZozAEPE71khYE3KpCc24Y1256ntV7h0/bsI2iluBa1lsmsrgYoOZ4Ek+zGz6UywCQLPK01RJI8HzvqGUjK3OboDJWP4WK3BT+58qaJoK2Zs2Gi07tPII0rCdXzlVG0xrumSZrfOkRZpYb4/TbLZGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB5967.namprd11.prod.outlook.com (2603:10b6:8:72::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 23:52:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 23:52:43 +0000
Date: Fri, 6 Sep 2024 16:52:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 5/9] drm/xe/xe3: Extend wa_15015404425 for xe3
Message-ID: <20240906235239.GZ5774@mdroper-desk1.amr.corp.intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
 <20240906215153.31210-6-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906215153.31210-6-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BYAPR11CA0078.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c60ae9-1598-41ad-cdc5-08dccecf001e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lrawJoTEF++2mkDRrEjNDEaGro/hfcfGT8v78+xYYRi9+PDyPcI1Rw7Boha1?=
 =?us-ascii?Q?RkYVwIDu1qdKMY7WB66aVxDGSfGRqLWvVtuIRNf5CbnsnlQ1NV0zjeonbiXM?=
 =?us-ascii?Q?IAR82vrAT8ViloWNRF0C+AzMChjDnpmL3MjFK8zEC7EZh23SMPHAqhaOJnw6?=
 =?us-ascii?Q?W1qstJI6VoE0smtg2dTsG5nz5u25MqwSxgr6dPfKvJ3OTUh39/RJiqz1mAWJ?=
 =?us-ascii?Q?D07JZFWBd5TUjoW2QKDKLT4OTar3HLctks28c5S+cQy6Yswpx9jJ/FPk2Y0y?=
 =?us-ascii?Q?OV9rqCQOzfKuf8tVN1c5UdsuxY2ddKcwI0IzS9e8J2xcTfKrZHNvLmDl0af0?=
 =?us-ascii?Q?mKjWdT9mAO9Nz+l1nXMggZ/fwfi1V6TKWiJYvkG4JpVfFEGXjeS8BXur1kCT?=
 =?us-ascii?Q?Qi+TZep5PVwgmZE8j4XE1p9nceyoRic/kDljsgipjfMIx9ljVy+VmDXBjduo?=
 =?us-ascii?Q?dUMaL0esmQxUpcntBdEmuKPhWmf6ud8HwekEBB1DE5E//6TVG3VMmZcJ52L+?=
 =?us-ascii?Q?aUIZVgdTnwQC4VjzMI7yv9ZtedBExvLban6yau3wzmAzuY6F1O1iyEWvccSs?=
 =?us-ascii?Q?MOhnUjCGv5ahEe8Sr0sfmjyhPhW9wnLIdUigFN22SxTKsC+iD661vlIINoTi?=
 =?us-ascii?Q?I9mgjtKVL03fcP0p4kCTGxi0auyENKjnd6rFSlgFHac27Tcv8RJLMC9jS718?=
 =?us-ascii?Q?RaTspHlSGEpOd7dAqoXa/AEB3U/Ev4QXtm0i4nl4OA4tFTl/SGLY+DLenuo7?=
 =?us-ascii?Q?xuRBo3ZvMvONPzLiSyeu8IECL5TnFciEAIq2MnN0g1Zg+1QAaGMna+NWr38L?=
 =?us-ascii?Q?/e6AyJ8vg0DfPr248fKV1/Vo2To9TVJeWoZuN6Eqr+XEi+9o6qSEb62c8UG+?=
 =?us-ascii?Q?6Vw6zy1DG+FWQ90V1JvkEq9jcmwPUlxb6m3IpKLjuUB+1lRh34xACf0bKifQ?=
 =?us-ascii?Q?ZGWWGmRx8cS7ih0pTmLU07ugU8BmJJIqzN+r1++RwY44GejqIdgUGSvJwvVa?=
 =?us-ascii?Q?H5f0hBc9VeEdYlTwjd4chkl1pzXi+wzdXo1BSCSQy3zgDHjnlN6r48Wgv7lo?=
 =?us-ascii?Q?FQV4aUr3YJ9p84LARqKcGWEohH6BVuojDtCziNZHpO+/NsNM4edTNks4/0fu?=
 =?us-ascii?Q?ob4NM3q1UdHptDdliLTOhOZbn2yIAKSTEPNDD/9ncex1Nk0nUQ8i9ZmC75RB?=
 =?us-ascii?Q?XHL1Z2rbT7G3PREAwW1aezPBy7WSVeSDS/FBA5M8IDlFOa5uK7k9UF+MZ79I?=
 =?us-ascii?Q?xIt2UIKdyPpkeXUeQqzQ+QrlxhNiFgcuZJHCyWseGxhBShDbXLp8weehAL4I?=
 =?us-ascii?Q?Jt1bhaEhoVcBCTGif0ny9gG/0U7OrwiYIPEeCbPB3qWYUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xZ5gulzNcYro/Iu85UnjlbHtFcRMWPpVeusBj1ARnErfFZIAgz/d8Yjs4C4G?=
 =?us-ascii?Q?3dgU2ho+hZRMsIrXBRjZabO0uAXo8bxcL4oJ0QHWTyGxgV4EZKNlyXD/5vA0?=
 =?us-ascii?Q?vZOK9pUDEpwb3tYrQ6XtTl5ZxIpV4paNyj5GbjMBrLqEzvK5zS6Vnnx4H0mx?=
 =?us-ascii?Q?cyKStXp/8NNwME91WjXdxZtmQcQlELvNVzuyzbznKvGa7QLnTFU9zq/30QWc?=
 =?us-ascii?Q?5Vi8GtN4rQYXvmXiHRiA+SaFVTSilSbxBZ/w690CsWGTJIqZbtTF3Lh+wUMz?=
 =?us-ascii?Q?0l0Dpujcglj+5FeK8dVzs9CDsl/+u9S/e3lZP5oyVmAkSYlVLosLGOCI974S?=
 =?us-ascii?Q?DURAiVgc6IuSJxwHkDxZcAMUvHz7Wu/9xhFN1bZubAFGzvOa0Q9Yxv/3M1lV?=
 =?us-ascii?Q?V+r6UwTNPZCb65zIOo9UcYqHWVyqk9ZgkquLQp9V3w92YKpgAiMAo3vPkb9Q?=
 =?us-ascii?Q?sD2wfSvRBwnkbMLzw1WM0ZY+VaVLFxdWBMBLM/40dzv6nScSxBLFvjqpTX9L?=
 =?us-ascii?Q?nbgfusoBPfVZhnnYMuiQJxc6XK4No2lYnw/AIzZrr/rdqrqi77HiRt0QFlfe?=
 =?us-ascii?Q?IBlsI6ZUsn43J/QhaUKkyeqJZ3ap/ZbCjyZjQeJcweOKndMF8mepLzNLDFXD?=
 =?us-ascii?Q?IHNpPM93GATy3gtVnYHPj2p23L86Cy80mXnax4Eh6UhDyYW022qS1eOBHATI?=
 =?us-ascii?Q?uKXFqnl2wsMT7GmyxkzaHHPyY7r5/nBb70RsRGlmZhez2KgEhU54ne3+CEaD?=
 =?us-ascii?Q?6Xgzbf9O9V4p2r7nb2XSufHJiRJtzurRd39a11fxLtHzCTKFuyZ1TWPUl0LO?=
 =?us-ascii?Q?kUBLdntTgdWulku88iQrH5gSA50jh545wJyvqHftfOHwg4RybgpHXDaXnoJO?=
 =?us-ascii?Q?dYEgD8V/8ptgadVWXYsGqGdJ+k3oP6HhEd3uHnSszj+PXWG2azVCmvO9l4GW?=
 =?us-ascii?Q?HgfqvNQtA3oVIASTJlpXB6RFHQ1l0AhGzYQI0C4vvvK/FuIL+yt20n7LNq52?=
 =?us-ascii?Q?lNlirBDmkBS3OY2abl8Xmh+0x2aaSLiRqfgwhnRv+jLVEoIys+js0Akvy7IN?=
 =?us-ascii?Q?nJ066VTkY1yPoqBa5w3eNBbhFJraLurnA3WoKwp8MjpVbbh0JT8ncUZW2PQS?=
 =?us-ascii?Q?LSk/64PtApAMgFD6u4vELbb0u3XRkqfUHPE0e2Y4qBEsZs8/1TSQ77sasdtx?=
 =?us-ascii?Q?dbccawEtfKlTEMnV2rTZeQLYHHmsCO5R8L1pU3LyGvF0+acH05IDmurYOOdJ?=
 =?us-ascii?Q?LtiUoOoDbRMmHtBU5TBIHN6OXo1dkfTlHXlhqPrq2OAyd0HaYAWkuDJw94JP?=
 =?us-ascii?Q?fdF6N3AICbAp1mLOmbL47O5ynK2R96dn2AfN+TfytFp6n9u8y8lc9UtXo5lo?=
 =?us-ascii?Q?JQbsnWtDY1Dvgs1VV1vXYoDvC4+kzG4hLBczG/iMqibjY/bcvEY9+omf/NDJ?=
 =?us-ascii?Q?aHp/T+aeK++mtLLb1ARIdt0nSUhjHfrrrZTzWiXwIWXMOpvGf5MLTzfTjJYU?=
 =?us-ascii?Q?LKmy65gEDsBHRmrWAjYPcsW5AhTFEhWGIlQk7QFAn17/A/cWL5XEGbj+XyCl?=
 =?us-ascii?Q?/K1WRYuNdFjIVQtc+wGKuy0tI67UzBzP0Vegrjtue26PAjnRSZOX+SCR1ixV?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c60ae9-1598-41ad-cdc5-08dccecf001e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 23:52:43.6280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0kRf+jo6m49khAs3ORqEFNDffq64yx0PVF5nkQpqUeY7vel2KmBJSVCkQTZT2viqHEHcZWl72156VEZ1QIg51jpkW5qSA6jmBXKKFiZ2Uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5967
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

On Fri, Sep 06, 2024 at 02:51:49PM -0700, Matt Atwood wrote:
> From: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> wa_15015404425 applies to xe3 A0 step as well.

The workaround database can be a bit confusing for this one because the
workaround is technically a platform / SoC workaround rather than a
graphics workaround so it doesn't show up in the normal manner in the
regular database we look at.  But that means this is "PTL A0" (the
platform) not "Xe3 A0" (the GPU).   And that also means...

> 
> V2:
>   - make condition check simple(guludo)
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 3fd462fda625..4c3f07d89622 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -184,12 +184,12 @@ static void mmio_flush_pending_writes(struct xe_gt *gt)
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	int i;
>  
> -	if (tile->xe->info.platform != XE_LUNARLAKE)
> -		return;
> -
> -	/* 4 dummy writes */
> -	for (i = 0; i < 4; i++)
> -		writel(0, tile->mmio.regs + DUMMY_REG_OFFSET);
> +	if (tile->xe->info.platform == XE_LUNARLAKE ||
> +	    (tile->xe->info.platform == XE_PANTHERLAKE &&
> +	     tile->xe->info.step.graphics == STEP_A0))

...that the graphics stepping isn't really what we should be checking
here either.  While it's likely true that A0 graphics are paired with A0
SoC, we can't say for certain that, for example, A1 graphics won't also
be paired with A0 SoC or that A0 graphics won't be paired with A1 SoC,
etc.

To handle this properly, this is one of the cases where we really should
be looking at the PCI revid to infer an SoC stepping rather than the
GMD_ID's graphics stepping.


Matt

> +		/* 4 dummy writes */
> +		for (i = 0; i < 4; i++)
> +			writel(0, tile->mmio.regs + DUMMY_REG_OFFSET);
>  }
>  
>  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> -- 
> 2.44.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
