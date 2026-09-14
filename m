Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC11C88E50
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 08:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D7F10EB4F;
	Mon, 14 Sep 2026 08:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVikRIXX";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Mon, 14 Sep 2026 08:48:03 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC7510EB4F
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Sep 2026 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789375683; x=1820911683;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+6LeM0oiSBWX56+YAIjNuhvr+5QXSsecsV7D0HfMhX8=;
 b=XVikRIXXmWyKpzfGaUfO5xOuwVU+UQIrFx+tFHySWJhWdozfkEJ8kBwB
 s08ShAb4nhS1EO87mN5vlZWWVSO/mQA8EIGSygZ1kd4IwdjxpDUB/fRq4
 Hx4d+EXkAXhXwbYTSlo9yHii3cXZDrICAsAEyE+bH6rvps6kirnMla3OE
 yjr/FvE6W6IdBt6rM7NY6sB9Jc/ThozKABplVJpqgMOR3p+3XBiMbkonr
 wkGqhX01mBDu9qdgsNzUI/gIfXdt9fHX3rkgoJNIHAfPHTAB3Nmib+iJU
 94UXd0F6mki09YGOmMIBwklu8z/HDQLncH7JjwgKzOPxCWvd6JsaWaaCX w==;
X-CSE-ConnectionGUID: XVATZR+ETj6qDgN3u+3YLg==
X-CSE-MsgGUID: nY2OdYv2S1KDFu7sboTG7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="231267"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="231267"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 01:40:56 -0700
X-CSE-ConnectionGUID: I7TRleSMQxKu9TZSZh6p5w==
X-CSE-MsgGUID: v2QthXhIT9ut0nHfJ8rk9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="272081570"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 01:40:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 01:40:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 01:40:56 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 01:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONimDBDrbxUZD9xXwCZv8GwehfneBwjSHsq/rbSGPnPiNQgDpk2W1K/esXqPvlThd/AJ+ihgNNZRw4O7pGT85AMn0fKrmbbTGSGocefW6gF9Vm+9Sf5KpQT7cOCuCnU+APdxiuU2dPj49myNVNlyJD08/SyvP8fg/ck7navz7Ba4CTc3Rb2pdZfs8P0ObfaeeeOXeoLW55WI49GJIJ+Nt+Xs7mqA5kPkadRHRstlIhwkxjH3WetLe+eeRwEaDpDQIFWdoA1prgRBWxlTc+ShM85/zCUaCrswsn2pS9wvHUnUTXuesVCEZFOJMR73he32nX74TnTlV1dePUqLlAnpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxnSxD525AwpndZZg7jxbIPE0bvEIw1CAhgFp1Qlta0=;
 b=TYtQzVaiuOcods0fBaQBdn6T4adRFi1LBE8qW6iISJIBj0ZQ+d0eVWAtC3C9mJHf4znVoGfisPZm2a/JkuMFbZkyIYod3kUihqRXagAC22+q+OIO7MWmj5LTPe01EL031DB8FvvBtHHLefYStyXWURA5MFroYJmVehWxUJORiYcspIk5tgQpDNUDP87C0jchf7i9lPPt8/g3se117c3Kp1VYwvXjcC5Tf9dBmyyqIJryWGq4dz38UFCHl2Bp044ANiTHK4cMYsVofZJ8Tuul8TJPwUOFb3WNn4DxLrZB+dmwxt3wwFWLyXoAdtgc5+hN85AB9w7/BgveeU8zLYnhjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV4PR11MB9516.namprd11.prod.outlook.com (2603:10b6:408:2dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 08:40:47 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 08:40:47 +0000
Date: Mon, 14 Sep 2026 10:40:44 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/pf: Add _locked variant of the fair sched
 config function
Message-ID: <20260914084044.c4mwuzixmffdkkis@intel.com>
References: <20260911183257.14999-1-michal.wajdeczko@intel.com>
 <20260911183257.14999-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911183257.14999-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VIUP296CA0116.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:350::14) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV4PR11MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: b69b4e3d-1c9d-41e9-d5bd-08df123bdfbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vcom+5lBoT73yFMJ+IsPflFDh+EkrZwbjIXaJvl1r7det394JEMrY+8ykVS5HiHzCr3htaog7+d8xx+fIE43Ibgfjzkvo2+8jYlcO/mst2UI7N/gT99p1Lw/+D7j9bnidgfPU3+hYp7AsqXSeawWj5oID+t/0iczB2gslLW7fab1wy6Z/+oOXmpFG9TSzbb16xf5FRPnKQeityVHHk7qYzAATPYJpB+qqFlAHJbZSXc0YwNTh7/u+1HOsGNjpN042JX/XmydwimtvYj27RZ0ujUXlzvS2ySIVkByKFf2Ab6nbAgFFpWchCIJhBnXemusuSMDbo2kyWBHdF9OzfeEODK2SnAWLd9re6vzuXl0huFl+Wdvs1+78TejqC5PIwgU84pRwypSRl8LMzvYVGOTOw144wYAY2tiuTpRdQf7meRRhKanhmzhHcPnJaJxiAu29L4OFTBZoCm43Aq2WYwZ/G4O4+JZg9aT1NhvfFGdF89QdZWE7FWSgJVmTRuijEvNBlFDVcx2SVNB55JKFYTnKQgrC9Wj4sOYFnRY78W19492p9P39473TBrxaKT96lF7IwCk/TxGaa6xYvUdKUGTipLTWP18ENb/JoAk6RdOe1LnULDeuyLgSNm0EZi0jmQjzSg0wl31FxY2xFSffBkEHVefAMUxaJhVu9YgYol+vnQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWpWTEplZmpPZXZTeGVWZjR3MjBTQWpBU2xvWHh0RnBBQ0Q3TWlsK3AwRU5h?=
 =?utf-8?B?dnlydHRlelFGOVhzSkdpbjZGMFpES3Q5c0ZQSjFSd3l0Y05TNlJlRkV6aklK?=
 =?utf-8?B?dXorVkhhL0tHMnNvTHhGejNsb240dzlzdXRyeWpZMVlrdThkRTg2SU5JNFhV?=
 =?utf-8?B?VXhhMzlYZUdYL1VKZG1IMGpxN0szNnlYSFJQMTBsV1ZHdzVObHhxREtQaVF1?=
 =?utf-8?B?V2g4Tm5xSWVyWFIyRzJ6Rk41Q0xjL01NZWZZaFNoTlVqYlZmNElxV21ZS2pt?=
 =?utf-8?B?QTNrcWt1N1Q3Y1MxbVgvMXd4ZGlSWXR5RHJpYjE2dm14SnQrZkRlSVNId0Rn?=
 =?utf-8?B?d1h3aG41b2d2VXJ2dGloVkovVmoyaWNoYTBsbjNpL0F1blBPbkZ3OHg4VWds?=
 =?utf-8?B?QUM5L1IwcVJSdTVzTDR0VGYvdDZNUjM0UnpnamVkdnlvZW1vL2U5SDdjdzhm?=
 =?utf-8?B?WCt4UFFFU0NpR2RhUGdEdVJUUXFXUUNLZGNmbGdRRnNyeGpVSXdUODFjZkNN?=
 =?utf-8?B?d1ozYkc3bXk5UGVKMFdMemxZeWR2N0liNU1oQW5QS3ZQVjh3aGxGcVV4WHdR?=
 =?utf-8?B?Q1p6Wmxib05va00rZnJKSllMcnVlSzE2eHlYVHpGOS9yL2NxaXhOZEVjMGhq?=
 =?utf-8?B?MEVZNXFlRGU1MkFYWDlGRVREZnl1WFVuVXNYdTRtaXhyd1pzY0tFK0picnEx?=
 =?utf-8?B?dXFjU2JiK1l0T0VrbXdta0lFckJTMHB1VVNNRUN4cjNsMy9ZUGJQNytvaEJO?=
 =?utf-8?B?MktrRXpmaDhDcThWcGZzc0thZVhweWU0TmJ2eTQ1c0YvMGxXNXp5VjU1Rk95?=
 =?utf-8?B?L0lwUW0rai9vbytKOHhiQzRsNXM3ZWNvYmNBT2FYTGtOb0Z6UE9XU3pUcHND?=
 =?utf-8?B?dDVKTXFpa3YxbUcxY01tUG13L2FWNTJCT3UrYm5XMFFuRGs0QzZkZnR2MEtm?=
 =?utf-8?B?T3QzbzI3SUFLekdQd2dPL25SUmxERytzcm0xV0VCNFFEZi91YjJxT25CKzgw?=
 =?utf-8?B?OGYvYzVjSVF6U0hmQVR3N0hKdGtheng4MW5hY0NzcEtQRXBGSm1oVlBvVWdC?=
 =?utf-8?B?Q1dyb3FERyttZmwyT2QrWjRnR21nN0gwbWdYK2RNRkpBSGJ4V2ZyVVl0SDYv?=
 =?utf-8?B?ZHprSG1iUnlJTmxaS0hqQmNQTm02TEVyOENIKzI2WUl3RUF3UWJWWXpjTE9R?=
 =?utf-8?B?dEFRd1FyYmx3bEt3bVpZZW9zZm0yYUZQK3JOQWhYbGxQYjBZOEdGWFloR3dG?=
 =?utf-8?B?ZUtMcTF5TWFpM2tkWkluRWREWDNUVWdOVm9yM1h2UlZGb2hMNnJFUUZYUXBk?=
 =?utf-8?B?S0plQW9OSDZ0ZmlUSGxUcTJvR21xT0pDNTB6S2dMUlJZaDBPNlZXT2Y3ZDdQ?=
 =?utf-8?B?OEVsa3FoVWkzc2g4cG5qN0hPckNER0FGcVJCVC9LVitYYm16WlNXNWFmSG8w?=
 =?utf-8?B?L1Y4YWwrbUR2dDNDQUg1M2NkOC9iSGE3K3NROFlQTGlibzR3L3BOM3IyRkhW?=
 =?utf-8?B?dEQ5VW11R2xkckZhc1dKQTkrTk1IZ3lkc3Y5QmNpMEwyTEFVVGdCekcrRndy?=
 =?utf-8?B?K2NXemtJNml1dnFSVk5WUGNTY0xlb0xYME9XREg4UzQ5OFpzWUt2U1J1UU1s?=
 =?utf-8?B?OVhBQ3J5b05qM0NJbEd0OE1EOU51Y2hxcXc3N2kyZVhKNkd2Ly81WGdreGZU?=
 =?utf-8?B?SW9QSG93ZCtMdDFHU3VScmFnQmRBTiszcHc3eHluVzBTaS9vbjROZVp1TFRa?=
 =?utf-8?B?RGJjVnBmZklTNlRuRWtFbEQ3T2hKcDlwSkp3REFSdkd0eFlVOVBWbzhhNHFG?=
 =?utf-8?B?NmRBNU9xVmlBMmNFRnJoLyt1TXB0Z3JHNEYyYS9uRnFYclVjU3JzS1Mzc2c3?=
 =?utf-8?B?RzcxY1ZuTzFKR0VHb2FSYTh4eHlYbGxVVEpYUHJpcUdiQ3I4OHZOaW91alhh?=
 =?utf-8?B?QmtYRmxjbWNFT3lyNnRzTFVwVG9yZWhGNThQL3R1L092eTIrTDRzclN6NFFW?=
 =?utf-8?B?azkwQ0kwa1pldmdJdXRGd3ZIYTdPNm9FYkpvL3FLZnF5SHNpTjh4cjJPQXNL?=
 =?utf-8?B?aCtsMWZsT3ZVbUtxVk9HWHJHdG9DdkhwMElESEpHMTAwdS9qdDFObTI3YWdo?=
 =?utf-8?B?YmFGUDA3SThNQlNydXBWOE9RSXpjd2wvSjdSbkZSaEFjUEp0TDJjejdnckxP?=
 =?utf-8?B?SDk0MHFXWjdoeGEvTzN4RStPZFR0UzRNK25xTzBIYnFmZVE2K1VObU0wWkhm?=
 =?utf-8?B?eXZBdlhSYzBIVnUvVGh0ZytscFFsZ3lZeXAyNHMwcWpEUkQzYTBxeVNDL0F5?=
 =?utf-8?B?YTVBNXVjRW91ejA2cTFKWFBVYTF6am5nbWErMTgvVjkxRG9RbTJMd3UwaEZl?=
 =?utf-8?Q?y5UflodtZRINQrEo=3D?=
X-Exchange-RoutingPolicyChecked: ImYRZZpTjfS7czg/x6sfUnWZpa2Rw6Cn2Fu2VOaMm0CKSZSdzMfx/Odo3jXOpdYfXfs/3zLH2oGAQpu2tuaNlCSa9NFybbL5tBbD186IXRskfU7TulE3T5BaEXf0+Rx1aTLwoiJQ6sFS92HqKOwH8ZFCCAPij/sdZUz8ql2ustjGyogbTp3LyrGEjmHgTw9HAJE9BXH01qfbCrmNRY3oNmLZJ45W73gOLEiWyqbitTRndqvwU7jtRbD17AJtC7A4qkm9Es4sHuhnBy6g5qQ0t31G2Opo2jU9E8B4aO7NiPMM+4xKfH3jJt6UvYhSiflwMYt23siJNPtKJDIqrieqQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b69b4e3d-1c9d-41e9-d5bd-08df123bdfbc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 08:40:47.7690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTXy02lA0/YjHj3DntWiXnaWe+MqHyNSHi80FBdRkOzL6NMejS1kBgsl6SDTEueJRYEfGCmvK4C+UloAx+DDRUk4OgOpxi7+Ejmived9GC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9516
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2026-wrz-11 20:32:57 +0200]:
> We will soon want to auto provision all VFs in a single step, while
> already holding the master mutex. Split existing function into two.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 +++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
>  2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 146981aedf5f..6947aeed458e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2784,15 +2784,16 @@ static bool pf_needs_provision_sched(struct xe_gt *gt, unsigned int num_vfs)
>  #define XE_ADMIN_PF_SCHED_PRIORITY	GUC_SCHED_PRIORITY_HIGH
>  
>  /**
> - * xe_gt_sriov_pf_config_set_fair_sched() - Provision PF and VFs with fair scheduling.
> + * xe_gt_sriov_pf_config_set_fair_sched_locked() - Provision PF and VFs with fair scheduling.
>   * @gt: the &xe_gt
>   * @num_vfs: number of VFs to provision (can't be 0)
>   *
> + * The caller must hold the master PF mutex.
>   * This function can only be called on PF.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
> +int xe_gt_sriov_pf_config_set_fair_sched_locked(struct xe_gt *gt, unsigned int num_vfs)
>  {
>  	int result = 0;
>  	int err;
> @@ -2801,7 +2802,7 @@ int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
>  	xe_gt_assert(gt, XE_FAIR_EXEC_QUANTUM_MS);
>  	xe_gt_assert(gt, XE_FAIR_PREEMPT_TIMEOUT_US);
>  
> -	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	if (!pf_needs_provision_sched(gt, num_vfs))
>  		return 0;
> @@ -2822,6 +2823,22 @@ int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
>  	return result;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_set_fair_sched() - Provision PF and VFs with fair scheduling.
> + * @gt: the &xe_gt
> + * @num_vfs: number of VFs to provision (can't be 0)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return xe_gt_sriov_pf_config_set_fair_sched_locked(gt, num_vfs);
> +}
> +
>  static int pf_provision_threshold(struct xe_gt *gt, unsigned int vfid,
>  				  enum xe_guc_klv_threshold_index index, u32 value)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index d43da8599977..3e10697d2174 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -87,6 +87,7 @@ int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
>  					enum xe_guc_klv_threshold_index index, u32 value);
>  
>  int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs);
> +int xe_gt_sriov_pf_config_set_fair_sched_locked(struct xe_gt *gt, unsigned int num_vfs);
>  int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
>  int xe_gt_sriov_pf_config_sanitize(struct xe_gt *gt, unsigned int vfid, long timeout);
>  int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
> -- 
> 2.47.1
> 

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


-- 
