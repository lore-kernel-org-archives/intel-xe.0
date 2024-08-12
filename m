Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD37C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 23:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0732E10E1B4;
	Mon, 12 Aug 2024 23:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DomiWh/R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45E110E1B4
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 23:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723503761; x=1755039761;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MeSZu9LlwdUwmaEShBldp+7a1L1h2QZlIN9MsBdTP2A=;
 b=DomiWh/RvAf7hP1Ysh56yAYLSIYP8b4+5tVxM0lUqyKXWmT64zb63/Y4
 8kp+tfOTDDLBFSzY/OTzItI3aKbg6SI0HOMCVxoaAH8PwxyddF50W9Tyx
 M6YXp7um0ai4TO4UG1d230LgTBtFyCkZJUb5CNAGyqiCUHPw8sTGJq6ku
 QLi3XAN6f+ShIoZH1s+o7rk09Vm1irMaryM2slBTHJAYLpm/8VyADBGoA
 vkIgQ5fMUL9lMJpPbh2roAyTn7vowpe9j4JqgShBM227TKeyTSUYIKeHB
 /o63GCjuMx4yZK8wObcT1w7ydn/YfDXeyLmMc4jtzTpfXUwpd2qizg6rV w==;
X-CSE-ConnectionGUID: ocZP0gCHTQOTu5Lm/3fnMg==
X-CSE-MsgGUID: 2Y57xZDYQmW6zpdKtd222A==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21285388"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="21285388"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 16:02:41 -0700
X-CSE-ConnectionGUID: MP4NQg0rTW6KxxVz3sg/QA==
X-CSE-MsgGUID: XUACf2u/SHebeVKdYOgn2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="89284243"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 16:02:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 16:02:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 16:02:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 16:02:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kq+LyUVK1NzuP1at/eTIywmomyEnMWUuafrAxnE7vPwFqR8lMYYJHzU1dAL4GN2NM3hnhcFLAYjz2b1O+MNUq8e8LnTocxb7jdMtHNLw8tITUKmDoB9Xxco+COHs8MZtXNSvAfeiVj3XIAacoMGoKTI9soIdUnBJwtTi5eCjpWe2RX5kysdaejVpGgK8irQKilfrbN/7ZJBXCmV1hN+orVc8c4QHz6h79Xe+fTFChxBpXjfAC23PM3NDTvnaqVErha+0bjPgWotz0zs1whuQKg5k2O0mjxa+PV+92HbgCZ9UwlJlzHPt9ZlNTyjMeU+nc26X9pRL8npy0p2IWAvLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cq5TA3jtrem+Cira3FaocihSKRbuHN1EZoaU2BOQ0n0=;
 b=XlFjKLG3RIX6PBH/Hr36+Een07AY7+t9/rCjdkVl2yBGOvhs/2eNaLqHzF4ukNB6uW9a+GdVVem5svpMnyv3R60D6mzIAglY5hRRpqMgmw16PHVDOSiAYYgx8KKvHQ7b2IBdIsK/j+25WFV0NtAGyAXevLfaV31wyoAbfVNDw9LFE3uicQtYV87hZOpI/lsldvnyol7eKnMI2YEEcZMeyUr4lJKC1z+5RReRkF6r7DZcH9A4X+Aivd2nnggYEWYAXBIp2eiDjseGRTBaqaFAheQ5l6nKiEaPVcrL2DetJ7DjKxOCOeSU28OQojz1jO1I1177R4dt+quMrQS0Q2eU0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7475.namprd11.prod.outlook.com (2603:10b6:a03:4c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Mon, 12 Aug
 2024 23:02:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 23:02:35 +0000
Date: Mon, 12 Aug 2024 16:02:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe: Rename enable_display module param
Message-ID: <20240812230204.GG5774@mdroper-desk1.amr.corp.intel.com>
References: <20240808180154.2495634-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240808180154.2495634-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa00c25-fd18-4ad6-e60d-08dcbb22daef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R0NGi99y1NaoD6WNGb08J3mp7DSv5L5S0z8PCcZrm43CfB4J07wG65kFSRdt?=
 =?us-ascii?Q?11R7FuPSFQTXr5F/G08rJ9Gat/hbGvpy1OgaWlm7trqETpcZnUzrbzWX5B36?=
 =?us-ascii?Q?aByKNgMjrdWX9Z+hxnGq43AOOORrJAVHNGRCruzeERhFA805VZ559rk2sMv4?=
 =?us-ascii?Q?35fjbMpkoRvtdf+9cfvmG8g6mkoh36frJA7P6FwHDsNOCpY8dO3QjT/M4fFE?=
 =?us-ascii?Q?8TVD//OwmaTJNngmAei3X+JsdgppGSivPO9S6iJxJS+jJFTnzzR9cJ3+EKSc?=
 =?us-ascii?Q?vKwtz4tXCSa00/KCV+0dMQTTIQCOyzUYLJwLiIuFHVv/ri6DT3415RLZ3zNZ?=
 =?us-ascii?Q?YlE1prOObn2prQgj33GFjxI/6/71D8uefqtQzxWEjyZcx2NgaS5/M8YctNJh?=
 =?us-ascii?Q?oz+uLh2iO0m5yrFW3bwB5UY2A6CGzE5nh1xpNzKIXw7aOkLx2qIbw1y9n7A7?=
 =?us-ascii?Q?EwPAY7X/S+qEVKF56Dgo+K0L0th3k2js6yFZCYvImzX5UEWeb+O396VCeOeo?=
 =?us-ascii?Q?VC+OyxU2/qWq0rMVSlnKZxhp1Ol7EYIwsG6bGsbE436LqmfmOWir0L8cHrEu?=
 =?us-ascii?Q?hhRySggmXa2Dc7znN8OHWIUyf7nX9xZJXRwynsSsToDCLWkxZE4+GAsPq/sg?=
 =?us-ascii?Q?lk2ScEvWT4m0pmdiO5cBhcoZXaCPeTb7MVwNChWQ7bBKsWV371qMTF77/Yxs?=
 =?us-ascii?Q?E2aEyvH4O8CqqW1QXEIfpu6uIBBiR1oP4oppLR+PBjqCMV3XBUG3IDTeC/5o?=
 =?us-ascii?Q?He+cu9ynbyFVWeYjmqQ3WUolyxbxThqTP/9UkWd7pBrz+jgrOd0sGJpDqnfq?=
 =?us-ascii?Q?S0f34s4ZAApKoiPZ6OQoTokG38e1I/ZMQsEw7m1hMmRXh7ypiHupq1MUb1Qo?=
 =?us-ascii?Q?Y2RgzP//lbVi7wDjbX4ge0Ajo5ePiuC43Cfk1Z/aeHw+F7Km6VyowfThzJRH?=
 =?us-ascii?Q?pjQ9zvjIGH4EQLGqx+3bJxD/408XPJI1HdtxSTCFP7UFeN4swVcBOPIZVmhW?=
 =?us-ascii?Q?qUs0779d46nQoXH5WulDHIH0ana7ee2WSVsAj3diEfnHRJ9CjL9j6J0XbCvP?=
 =?us-ascii?Q?SIkOXAFum05oG6Z77AdvE4GsWJEbJ2Z7uwOkLsxx813E7btpwjfdATLcYIIm?=
 =?us-ascii?Q?Rd6zoSJpSjoJvbw/T6DJxCgyekKjXcZ/WaxHQCAjdVTjPc4ZHkdhBb0vdQoA?=
 =?us-ascii?Q?vsKcBfFn257tDWK83NGJS/CLHUjksLJzr9ZhXRkmq0NfK2TXS5fUvGp6YEFN?=
 =?us-ascii?Q?Tqx/BYGiTaVduiLkFeFaOJ/YgWpb1EOVreW2ZGdGPpy4lsAxn/8/0o9oS5jm?=
 =?us-ascii?Q?yNo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tu35tEE5NlnwS0Em+gn74lHyZ85isrB7MeaTMuORAeuRqtUhX0R0pY+d9y/r?=
 =?us-ascii?Q?OrtsKz3me8dftBEqD5tibMFypZL0daFtmVEsXjOrqhTqLIfpIAoNVxaZhPGh?=
 =?us-ascii?Q?iaimJeL0c3UHpGA2BU98j8vmVI1dbloufjVNzeKMvOLfkhMrVj6zVkFEXlsH?=
 =?us-ascii?Q?D+Fj9dBdK18JvF/uRJ8gH0T/EPpUOKaV5tlWIWJn5YQ0u38/YZCzwhwlOP0V?=
 =?us-ascii?Q?NvnAGrjkKuDQrjrGoc338bAFDCZKAIASkHUa82VCBraF+2P0aWBFGmZLy1Hc?=
 =?us-ascii?Q?Dv7vVsNc08Kfai1gB0DkS++cxpmbL7XTPa46Ty5ZTLA2uWAMwzXcVK/Y9bDw?=
 =?us-ascii?Q?jxnIuWCaQUq/10CTFSUdUKV8hU0PKQ0cQgIa4ChRHnL81tkiVuTUiSTAFfr8?=
 =?us-ascii?Q?zqlg9H1Fft5LXdeVU6SH7RSF1aJCVfgiapWk9oPOGyvaHPwnqvIgH/SweZBb?=
 =?us-ascii?Q?zR9tElhAFAysCwaJfPMqiWOgqWQIwAzmBGATdx9mSPYXjC7wui4L5w+vg4ut?=
 =?us-ascii?Q?79TPAPQKaePpcy1MEU6Ku0nsck+3X7EB4ltyLYhqdfB+5IKbvwX7da2ZxxeN?=
 =?us-ascii?Q?CCYN5CPeOpcFi5OyfL53HeXKnVWEO/qGG6agxAa3gw4AZXNDf+F0bsq79YrA?=
 =?us-ascii?Q?mwxNIUecz3Kxq0sPCPt5LJi1R8j/9MzKcBMxaDzjb1CNi6JLP9bTTNzJsh+q?=
 =?us-ascii?Q?uxOWZzM+lCABIQF4TSONZxrTbNIfCEGztWoLJ1+w7IGOqSCVQILH8WCs7puU?=
 =?us-ascii?Q?sq3VvEtV23KycVWPz+KejrGmLuk6GPXSfZGEdnZmAQkVDTyyTsZ7XwehCuDU?=
 =?us-ascii?Q?KVNLpYzXVXvLiSdyIk7e7BLUkowz9q0SIf5r8VLcKYK4W9MNDtR19prVk5DV?=
 =?us-ascii?Q?VU3cPCLGeuH1119JnELjWrluhUJRkgLBZQKEYQoPo2tZ1TLveuCr1y62Aa9l?=
 =?us-ascii?Q?tDXbkhF0lWUThseHUYysybJ4J1dsMtR2sz8kUXwyPcHOUuxLLS8J/vDqKUfS?=
 =?us-ascii?Q?PuVY8WNz0Ub+Pzc9sbIw6DGFPwt8QcUxVkcysRLtFJBBmtXEBqqa/HriFB7g?=
 =?us-ascii?Q?cPUzIcwqjeRyNFNLACWJvgON6oE6gqdZOEvrIGGiDOFzCAeGj0XIP5d1UBkn?=
 =?us-ascii?Q?fPLo6E9mDISu+a8wALMx5MF76Z2L2xMS93udPATRN/kalQjMEBQrbWaT5LxG?=
 =?us-ascii?Q?IHil85L7ijy9sXAXD4ZlSzrUxAGX96ZxHqXo/d6NSHpXR8eXX2uDRW/4kxPj?=
 =?us-ascii?Q?bebjRkVlOOAKZu6MSmQPFuKnJqyZbIvCIfRoSXBDRevCMFIa8Sm6F46HLSlH?=
 =?us-ascii?Q?ArNa76J5EN9ePudhGAzPRMItnWxP9nyFUi1V+IhlSg+OPpOyTuEzTCB7LKMY?=
 =?us-ascii?Q?t8VZCWp95FQJYFItobmVLXBMMy1wmfAOFoU/rePq2hhUcvhC7xGB9JaWm39P?=
 =?us-ascii?Q?4pI9MbdWuiclBHnWAvAeRkNHPf5oCWvQgYh/sJ9AuzfaCGLvJyNelC/trMTp?=
 =?us-ascii?Q?PsUQqa6oYK88CSlUVefOghRDaWcDddrGMSL4HiiYi39rdFSjUREQB04s5sFG?=
 =?us-ascii?Q?KIv/0t0TJ3N2pMO/j8R5fH9JqiepFuiRsUYnfOw78RdYzQ9ImYlPUM74OqkL?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa00c25-fd18-4ad6-e60d-08dcbb22daef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 23:02:35.8285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPPBeN4j1/kd02wuuSKMd1RNFunk9l99c2G1mH44KNsjA/LMLrwuvYe0EnWi2YhAxN92YbOPfvq45MsLFGPiU3AVnffWCOCVVbaW9muTdGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7475
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

On Thu, Aug 08, 2024 at 10:49:42AM -0700, Lucas De Marchi wrote:
> The different approach used by xe regarding the initialization of
> display HW has been proved a great additional for early driver bring up:
> core xe can be tested without having all the bits sorted out on the
> display side.
> 
> On the other hand, the approach exposed by i915-display is to *actively*
> disable the display by programming it if needed, i.e. if it was left
> enabled by firmware. It also has its use to make sure the HW is actually
> disabled and not wasting power.
> 
> However having both the way it is in xe doesn't expose a good interface
> wrt module params. From modinfo:
> 
> 	disable_display:Disable display (default: false) (bool)
> 	enable_display:Enable display (bool)
> 
> Rename enable_display do probe_display to try to convey the message that
> the HW is being touched and improve the module param description. To
> avoid confusion, the enable_display is renamed everywhere, not only in
> the module param. New description for the parameters:
> 
> 	disable_display:Disable display (default: false) (bool)
> 	probe_display:Probe display HW, otherwise it's left untouched (default: true) (bool)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> 
> Now that xe settled in upstream, maybe it's also time to consider
> removing the CONFIG_DRM_XE_DISPLAY as discussed in
> https://lore.kernel.org/all/oedsuayuo3wtdea6cvmzaoesji25bwbqohgemayj5ocybbzgtn@el2d34rwqfsn/
> 
> Also relevant: https://lore.kernel.org/all/87sfer1fjj.fsf@intel.com/
> 
> Jani, I think at one point you had a patch to remove enable_display
> (which I was against and still am for the reasons above) or rename it
> (what this patch is doing). However I couldn't find it to check if you
> were trying to rename to a similar thing as I'm doing now.
> 
>  drivers/gpu/drm/xe/display/xe_display.c | 46 ++++++++++++-------------
>  drivers/gpu/drm/xe/xe_device.c          |  2 +-
>  drivers/gpu/drm/xe/xe_device_types.h    |  7 ++--
>  drivers/gpu/drm/xe/xe_module.c          |  6 ++--
>  drivers/gpu/drm/xe/xe_module.h          |  2 +-
>  drivers/gpu/drm/xe/xe_pci.c             |  8 ++---
>  6 files changed, 37 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index ca4468c82078..e30fb482d542 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -46,7 +46,7 @@ static bool has_display(struct xe_device *xe)
>   */
>  bool xe_display_driver_probe_defer(struct pci_dev *pdev)
>  {
> -	if (!xe_modparam.enable_display)
> +	if (!xe_modparam.probe_display)
>  		return 0;
>  
>  	return intel_display_driver_probe_defer(pdev);
> @@ -62,7 +62,7 @@ bool xe_display_driver_probe_defer(struct pci_dev *pdev)
>   */
>  void xe_display_driver_set_hooks(struct drm_driver *driver)
>  {
> -	if (!xe_modparam.enable_display)
> +	if (!xe_modparam.probe_display)
>  		return;
>  
>  	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
> @@ -104,7 +104,7 @@ static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return;
>  
>  	intel_power_domains_cleanup(xe);
> @@ -112,7 +112,7 @@ static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
>  
>  int xe_display_init_nommio(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return 0;
>  
>  	/* Fake uncore lock */
> @@ -128,7 +128,7 @@ static void xe_display_fini_noirq(void *arg)
>  {
>  	struct xe_device *xe = arg;
>  
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return;
>  
>  	intel_display_driver_remove_noirq(xe);
> @@ -139,7 +139,7 @@ int xe_display_init_noirq(struct xe_device *xe)
>  {
>  	int err;
>  
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return 0;
>  
>  	intel_display_driver_early_probe(xe);
> @@ -170,7 +170,7 @@ static void xe_display_fini_noaccel(void *arg)
>  {
>  	struct xe_device *xe = arg;
>  
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return;
>  
>  	intel_display_driver_remove_nogem(xe);
> @@ -180,7 +180,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
>  {
>  	int err;
>  
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return 0;
>  
>  	err = intel_display_driver_probe_nogem(xe);
> @@ -192,7 +192,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
>  
>  int xe_display_init(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return 0;
>  
>  	return intel_display_driver_probe(xe);
> @@ -200,7 +200,7 @@ int xe_display_init(struct xe_device *xe)
>  
>  void xe_display_fini(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return;
>  
>  	intel_hpd_poll_fini(xe);
> @@ -211,7 +211,7 @@ void xe_display_fini(struct xe_device *xe)
>  
>  void xe_display_register(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return;
>  
>  	intel_display_driver_register(xe);
> @@ -221,7 +221,7 @@ void xe_display_register(struct xe_device *xe)
>  
>  void xe_display_unregister(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return;
>  
>  	intel_unregister_dsm_handler();
> @@ -231,7 +231,7 @@ void xe_display_unregister(struct xe_device *xe)
>  
>  void xe_display_driver_remove(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return;
>  
>  	intel_display_driver_remove(xe);
> @@ -241,7 +241,7 @@ void xe_display_driver_remove(struct xe_device *xe)
>  
>  void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
>  {
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return;
>  
>  	if (master_ctl & DISPLAY_IRQ)
> @@ -250,7 +250,7 @@ void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
>  
>  void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
>  {
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return;
>  
>  	if (gu_misc_iir & GU_MISC_GSE)
> @@ -259,7 +259,7 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
>  
>  void xe_display_irq_reset(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return;
>  
>  	gen11_display_irq_reset(xe);
> @@ -267,7 +267,7 @@ void xe_display_irq_reset(struct xe_device *xe)
>  
>  void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>  {
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return;
>  
>  	if (gt->info.id == XE_GT0)
> @@ -286,7 +286,7 @@ static bool suspend_to_idle(void)
>  void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  {
>  	bool s2idle = suspend_to_idle();
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return;
>  
>  	/*
> @@ -316,7 +316,7 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  void xe_display_pm_suspend_late(struct xe_device *xe)
>  {
>  	bool s2idle = suspend_to_idle();
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return;
>  
>  	intel_power_domains_suspend(xe, s2idle);
> @@ -326,7 +326,7 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
>  
>  void xe_display_pm_resume_early(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return;
>  
>  	intel_display_power_resume_early(xe);
> @@ -336,7 +336,7 @@ void xe_display_pm_resume_early(struct xe_device *xe)
>  
>  void xe_display_pm_resume(struct xe_device *xe, bool runtime)
>  {
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		return;
>  
>  	intel_dmc_resume(xe);
> @@ -374,7 +374,7 @@ int xe_display_probe(struct xe_device *xe)
>  {
>  	int err;
>  
> -	if (!xe->info.enable_display)
> +	if (!xe->info.probe_display)
>  		goto no_display;
>  
>  	intel_display_device_probe(xe);
> @@ -387,7 +387,7 @@ int xe_display_probe(struct xe_device *xe)
>  		return 0;
>  
>  no_display:
> -	xe->info.enable_display = false;
> +	xe->info.probe_display = false;
>  	unset_display_features(xe);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1aba6f9eaa19..206328387150 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -543,7 +543,7 @@ static void update_device_info(struct xe_device *xe)
>  {
>  	/* disable features that are not available/applicable to VFs */
>  	if (IS_SRIOV_VF(xe)) {
> -		xe->info.enable_display = 0;
> +		xe->info.probe_display = 0;
>  		xe->info.has_heci_gscfi = 0;
>  		xe->info.skip_guc_pc = 1;
>  		xe->info.skip_pcode = 1;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5b7292a9a66d..82e99a3e084e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -282,8 +282,11 @@ struct xe_device {
>  		u8 has_sriov:1;
>  		/** @info.has_usm: Device has unified shared memory support */
>  		u8 has_usm:1;
> -		/** @info.enable_display: display enabled */
> -		u8 enable_display:1;
> +		/**
> +		 * @info.probe_display: probe display HW, otherwise it's left
> +		 * untouched in whatever state the firmware left it

What do you think of elaborating slightly with something like this?

        Probe display hardware.  If set to false, the driver will
        behave as if there is no display hardware present and will not
        try to read/write to it in any way.  The display hardware, if it
        exists, will not be exposed to userspace and will be left
        untouched in whatever state the firmware or bootloader left it
        in.

I.e., make it clear that this isn't about avoiding a single
reprogramming on module load, but will also make it completely
inaccessible.  Up to you whether you think that's better or not; either
way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> +		 */
> +		u8 probe_display:1;
>  		/** @info.skip_mtcfg: skip Multi-Tile configuration from MTCFG register */
>  		u8 skip_mtcfg:1;
>  		/** @info.skip_pcode: skip access to PCODE uC */
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 7bb99e451fcc..923460119cec 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -15,7 +15,7 @@
>  #include "xe_sched_job.h"
>  
>  struct xe_modparam xe_modparam = {
> -	.enable_display = true,
> +	.probe_display = true,
>  	.guc_log_level = 5,
>  	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>  #ifdef CONFIG_PCI_IOV
> @@ -28,8 +28,8 @@ struct xe_modparam xe_modparam = {
>  module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
>  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>  
> -module_param_named(enable_display, xe_modparam.enable_display, bool, 0444);
> -MODULE_PARM_DESC(enable_display, "Enable display");
> +module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
> +MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched (default: true)");
>  
>  module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, uint, 0600);
>  MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 61a0d28a28c8..161a5e6f717f 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -11,7 +11,7 @@
>  /* Module modprobe variables */
>  struct xe_modparam {
>  	bool force_execlist;
> -	bool enable_display;
> +	bool probe_display;
>  	u32 force_vram_bar_size;
>  	int guc_log_level;
>  	char *guc_firmware_path;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index f818aa69f3ca..b304855624ce 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -621,9 +621,9 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.skip_mtcfg = desc->skip_mtcfg;
>  	xe->info.skip_pcode = desc->skip_pcode;
>  
> -	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> -				  xe_modparam.enable_display &&
> -				  desc->has_display;
> +	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> +				 xe_modparam.probe_display &&
> +				 desc->has_display;
>  
>  	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>  	if (err)
> @@ -834,7 +834,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		xe->info.media_name,
>  		xe->info.media_verx100 / 100,
>  		xe->info.media_verx100 % 100,
> -		str_yes_no(xe->info.enable_display),
> +		str_yes_no(xe->info.probe_display),
>  		xe->info.dma_mask_size, xe->info.tile_count,
>  		xe->info.has_heci_gscfi, xe->info.has_heci_cscfi);
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
