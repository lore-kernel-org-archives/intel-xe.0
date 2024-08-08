Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE53C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 20:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CEE10E801;
	Thu,  8 Aug 2024 20:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZfbsUpDe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3C810E801
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 20:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723149129; x=1754685129;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8/AZUh2lMBmCVtrNqjUSDNpipP7bSKffoba0mowdxv4=;
 b=ZfbsUpDea1TufNDWBnhAI+K+TFiPJQEmJtliI3uGU7gNzAKVE76X2eQf
 cvzAB8m6PkrAnyxWrZ6jOFUgMnWNYWh2AwSeooiH+BXDj6RoC9erKMrZu
 bWHLoeIdxA296ClSF/VZLovEnZz/UaPh6xf/pzpsLliNZbCRizF+ALHHJ
 qMKFFoU7xDiZR1MDJrZ3uk0EkCpFhN04VFs1BgVKFAKCjlE92fPfqT5hj
 SqOaCeKDFMUdUX3qz9/xyDAdH5r+m2/C+l0oklyRjLYPJaLBuxUH4vSfO
 jSU2xcnbhQGYzLfFPr6l+6AHIsOskPM8++8ku6TPdp2QUM7ksbk0Avkh+ g==;
X-CSE-ConnectionGUID: kVo0TI2pT427wZfSVSCqrA==
X-CSE-MsgGUID: +hqPH7NyRwWrklhtTpd86Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="25097176"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="25097176"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 13:32:08 -0700
X-CSE-ConnectionGUID: rkOi7NdtSlWm8rpWpVKW2g==
X-CSE-MsgGUID: t2DPKTs+R3ytur2b129nhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="58047839"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 13:32:08 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 13:32:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 13:32:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 13:31:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jn+eDUhTh04VgWvcVQsdi6pdl0tUNZWWaHjE/3AG+Ijh9qbRkVfw5Ft2Xu1Wm6zy+exNNHD6Je+nkKDdvZjOzGoCPamwr1n/r/cLfN+dgY70LFajFKs0LazTTCSFI7l/f2p2LMTuwAMYl+gq140hNWcn1oS09Eod0Q70y11YBx6znPDSCk4HMBXBvozhTt0Nik7qVGUdWRZbif9JHFnpSQc6yZR18CL/xN8824tDKNFbB2qkWHgp4TPgzwQl1SMuxZh6WHkGlxCoTfJ4rw3IAA1q7huRW/t1d34bQ9MXm2V0lGRQ/sugpt+wweiKrlNwbY9IGbLJd0rKr4QwIZnpCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2v8V6RPW8CudfBtn7DS53Ghth18YomzxkpT31vZbBk=;
 b=PASPQTz6mkwkBBZAhuYGNZqLhFMeoblEBMzTNTXU1VvybM0hqIkbALeOaLoqJT/knxifB8qryA2Dsws+xxKoDRvVg1lpoixiInSpRwmhoNLa52ugvgYmgEnPJy3csxpM7BjypRnW+lkaUFf6cIjMkmnI68agERr0N9YgSwGrq27f6syi/Bf2NZBdY8DVZR6sNnjCL9Win3MW8fMJPT/RLFofw6OVYAZ5DdlQvD0mWICeiq4Jpi3Edfe4ul8WDh3BfQYGTkkR2W1Oe/JAfW5oc4xNCYCj/8Ixez097IWd7GnfpS6Qz9Veyy3hat/r712Xo0xTTbv+QV5FuSQQ9lMu6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7888.namprd11.prod.outlook.com (2603:10b6:8:e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Thu, 8 Aug
 2024 20:31:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 20:31:41 +0000
Date: Thu, 8 Aug 2024 20:30:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/xe: Allow to compile out debugfs
Message-ID: <ZrUq3PDVVF+iajOr@DUT025-TGLU.fm.intel.com>
References: <20240808171121.2484237-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240808171121.2484237-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c60bdd6-0ef6-46b1-a7ec-08dcb7e91cb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WAvtJZsbgcBhuafsI66llgdSunTIPR4UeeAjm3Q8ALg+onDLI3BUNkKXLQmk?=
 =?us-ascii?Q?8J1XXzOy9zP9nWrW5D+OFTwWZd0z6/Bp7KhDG9TkMtGqPslur6q5qxqK9gqk?=
 =?us-ascii?Q?2UQZmwcH655sVyOgO4nWhI7wHzfgSzvplOSaOh6iJa35DKVO9HyzdhTZ8BDN?=
 =?us-ascii?Q?Of+gP61JyBFie2fTrn1RP7gtHRozRoHtyNTzSVwS50/J7z7BuBELppX4zSK1?=
 =?us-ascii?Q?KksNsjmcwZJIGCU41F3nuiNcuN8I4Jsj0vFdR7mafCIamTM75Vtg2oLerRNL?=
 =?us-ascii?Q?9Bs5/97qOb7XwW27K247I0C5BLHbdHnTkWPElNdlEGb8ZSZcsHAFanIayjnC?=
 =?us-ascii?Q?YEszxIIrg6njxqqIBWe96zkjMyOfHqIy1jhCPqd6Q0X+TTGGM/pSgPgw+VWs?=
 =?us-ascii?Q?qe+XX8dw40ZtMZhKp2Ut8plWckYYXyV+2VVJyxwjkw7lMW1apfjFKz+sUtje?=
 =?us-ascii?Q?rNLFv91yMQ4sSJwe8bKXc8X7J9DrZw2TPKAt9XQcv21mhhowUyUi7NmdJW2V?=
 =?us-ascii?Q?sgDZ54OnQMkrMBMG89yo+clHIEcvQOK1DjK6XdidAObN1cULpfsoxMEuJTU3?=
 =?us-ascii?Q?6Ff1z1x9Al9pwY6Ywxeb8im73kmr9xg7hgB2j6p7tskgwtJy+q17dc85hVAQ?=
 =?us-ascii?Q?iqcXY4/tyjqQ28pOIY1op948u034p8dOsxe5qPeyko5LTS+8WQydb0ffp5sK?=
 =?us-ascii?Q?SqNWxysVxbmVjiSbPWmTAKDvJjU+CNustLEPVOJOHfI4tZrqji9y/yD+7e01?=
 =?us-ascii?Q?IgPZeYNZxdpvksvefSURfKzi+ScTvFNxHC1VR6UPjS+xjnP4Z9tPwZnjb2bj?=
 =?us-ascii?Q?INKUGv0+q0wNZZYc/Oa7UuUn7nTy8IK4WZS9sYSkeMd6qtWW/zYCokFXyfeF?=
 =?us-ascii?Q?GmKhb2Ebfc7k1C0732C75rs62RWAH6zsl5h3s5Vpf6mUPZv7an9bNfZEf/JJ?=
 =?us-ascii?Q?eRVt8UZYssPOdpT+4j1FFuyrUUfZ+BJ1PJ0TBZRbXKWjnxg3wNr12F6dtYGH?=
 =?us-ascii?Q?6ZNjm2KUXg8GIEvZr5T92cDmf1vhePJoyNalFsjKZ7hf4+Q+NNuQdn88vUGA?=
 =?us-ascii?Q?+3GS+KU9LiqnPzcSZ6EFmbN3/2u0jSUywEppi1i5YpIEB8LIUoFiPnX/4H2w?=
 =?us-ascii?Q?s2aRQQweu54IGLiOP/zI7pLJ2Fd/TXL1bFyEqo3DVync7goH0w0GnPP6pMbG?=
 =?us-ascii?Q?VFVKo0B2VLkNZcZ/4y5+PlUVT8BnZDe4wPgAhwuSJKqQ1FIKCgt3mgLbhXxy?=
 =?us-ascii?Q?/le8rP6v7VjGP9ZFSYJf+4edPbVaj6jAFLSWbWZPjTJ7uC/jxfZ4U51ZRh1b?=
 =?us-ascii?Q?SvdioHZLTaDyrqHfqbkfbovoxuh6rmyiC2Uud/ho8io14Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o4fevxPpIU0hyJp8TT5Cz9T3D/FriszuZ35Nif3hr1UE6KSXg+muzJVb2YSP?=
 =?us-ascii?Q?ySSjrTomwht/AIaNLpO4Stu3RqeqozosazXHGRQ9A2Wb0fDNqk8rh8oENF7g?=
 =?us-ascii?Q?h6+nGcWpX4EUXQJL7x9PYKmusEPRibUOpeAsgIz1uA9ysJ4uZkVuBdnN1QYx?=
 =?us-ascii?Q?0LD6UK6nH3Qh4PRYi7ZYCm4JmeyN+3dOiTk7vnG+Lgv7eteqK1PHy/fKKbLg?=
 =?us-ascii?Q?VgTUzrZQWTU2rw9O9bfoKxLDn9+eZxNrB9J+n0nw+GWgw4znwGBjDw9Te+mV?=
 =?us-ascii?Q?kvbLoc2Vz1PlyINdAqEGP/8ci8HJY6l605A6uk+4uQFysbTde9JwCaRoE9p+?=
 =?us-ascii?Q?u/lJvdp0ZUcYiWGwnWJEmDn0R4p8dHTKRYCRkSaT2uCLD9+gfCNe1OHA/F+B?=
 =?us-ascii?Q?YoCWcuad+xEA2likdb/4yvA36wRu/ujywHuDJl4s3XjN0QTVvygKTxDwTzgE?=
 =?us-ascii?Q?JnnTr5F/28ce2mf7wcT6KslI9zi2fj0lxi8xFLwkEVybs06SgW0lR43vmPpg?=
 =?us-ascii?Q?C4vC/BBd+lKEPfmOT9sJ9ABGdvs4YhjmogYtUOfqlYICHjSqojK+H4GtnmOf?=
 =?us-ascii?Q?3wJpFBhCSnu/bdYkd+7OleqR5itZBXX/PsRuFVI8326dp6rCVMqrZA2jJzMK?=
 =?us-ascii?Q?6vNBdKfxmoBr3h0NSatXLkAjH6dPqKJcHTTWUdASxWG1FRhFMoBsAgLxpMkg?=
 =?us-ascii?Q?cq/tiWKkUPGh1OtytxNsdyK5JnSWMii+wLvUyA81U7qfKqQF1UkUfUSCoMLH?=
 =?us-ascii?Q?hDs+gbiA6feP8WrFWxcIXgEklYQjYFBlSOZIyxWu6EA8Si/SRjjHjml2rOif?=
 =?us-ascii?Q?2oGxAAx7gvFYb7fu20I+RVMh/KhHIsu3XF3ShTTwL192/cb7NNKWScC0gSfF?=
 =?us-ascii?Q?g75DPFIm+rQ70elrs2yJeoBkjOYrTa7Ir1mfNAjAPJqxCQbj3X1pGBMXEH2l?=
 =?us-ascii?Q?Jmu31XTFrrKPBCFU00alZYvq4jdPgGfMUDqxDz8IGgeZPLYQRzM6l+8sZTyt?=
 =?us-ascii?Q?jDPvQjVt/XTX/Noi89/x8e/BcfPHu5I3xlTdApaamHjepOFIjEye6OyjYpR/?=
 =?us-ascii?Q?dGhz8bN2G0cHtB2Mf4cDASDOoKth3vNU4KUzd70WUwjgbUxLLmn3jjW/+NXf?=
 =?us-ascii?Q?TPruzk6hx+0k9RzOVydzkCgKAH5GCSrLAMGZlOf7vHiZ+xPJNZdkAA4Eemcd?=
 =?us-ascii?Q?41jCwFZ8zd8uJ05pEqvx82KGT+8Mdzdyt0ppZi8jS3ERwZgZcGBO/UTSzSRV?=
 =?us-ascii?Q?ESf3Q5N/Rz0E/UUEBqN5vOfwRbb2YXZfm6yYzaaJdx2fN0gd1BW3HUfMO8Fn?=
 =?us-ascii?Q?eAcDslgVX/N993PMnpShlRwNO6tq9zWP6zXWoklidUCV41POHJJmv5n0ICN1?=
 =?us-ascii?Q?AaS9ql/hGdg2N4GdJq+2L8R8e19f4aYA3lUhY7menNlcQGe9EFQoyzSzHiza?=
 =?us-ascii?Q?GB/Yb0lECRLGV2OObmWZB3ujQttYgCoL0Q13tRefRWUOabSjDNKDyS9GmZl5?=
 =?us-ascii?Q?tmQ7piMYeyz0O6I+P10ovDNpN7CGoEseWsqGHmT0JRKI9zhdyHjSJ/NGH/7G?=
 =?us-ascii?Q?Caw59v1KguVyWAFBSfhI7niLPiIHprirebgO/xLilv+65KUOR1eYP4gvLVQp?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c60bdd6-0ef6-46b1-a7ec-08dcb7e91cb2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 20:31:41.8156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kl5eO6P7frtsaMwBaqhJ9eA4vC0ZmTMNZswKzQZyHaMpG2VDhQ+j7IwKX0ZotPfOAjv9WdAY7+0eTrhAlxUjOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7888
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

On Thu, Aug 08, 2024 at 10:11:21AM -0700, Lucas De Marchi wrote:
> Use a dummy xe_debugfs_register() if debugfs is not enabled and move all
> debugfs-related files under `ifeq ($(CONFIG_DEBUG_FS),y)` in the
> Makefile. This is similar to what was done for display in
> commit 439987f6f471 ("drm/xe: don't build debugfs files when
> CONFIG_DEBUG_FS=n").
> 
> This removes the following warning while loading xe with
> CONFIG_DEUBG_FS=n:
> 
> 	xe 0000:03:00.0: [drm] Create GT directory failed
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/Makefile     | 16 +++++++++-------
>  drivers/gpu/drm/xe/xe_debugfs.h |  4 ++++
>  2 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1ff9602a52f6..b846b36a7bfd 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -28,7 +28,6 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>  xe-y += xe_bb.o \
>  	xe_bo.o \
>  	xe_bo_evict.o \
> -	xe_debugfs.o \
>  	xe_devcoredump.o \
>  	xe_device.o \
>  	xe_device_sysfs.o \
> @@ -46,7 +45,6 @@ xe-y += xe_bb.o \
>  	xe_gt.o \
>  	xe_gt_ccs_mode.o \
>  	xe_gt_clock.o \
> -	xe_gt_debugfs.o \
>  	xe_gt_freq.o \
>  	xe_gt_idle.o \
>  	xe_gt_mcr.o \
> @@ -59,7 +57,6 @@ xe-y += xe_bb.o \
>  	xe_guc_ads.o \
>  	xe_guc_ct.o \
>  	xe_guc_db_mgr.o \
> -	xe_guc_debugfs.o \
>  	xe_guc_hwconfig.o \
>  	xe_guc_id_mgr.o \
>  	xe_guc_klv_helpers.o \
> @@ -71,7 +68,6 @@ xe-y += xe_bb.o \
>  	xe_hw_engine_class_sysfs.o \
>  	xe_hw_fence.o \
>  	xe_huc.o \
> -	xe_huc_debugfs.o \
>  	xe_irq.o \
>  	xe_lrc.o \
>  	xe_migrate.o \
> @@ -107,7 +103,6 @@ xe-y += xe_bb.o \
>  	xe_ttm_vram_mgr.o \
>  	xe_tuning.o \
>  	xe_uc.o \
> -	xe_uc_debugfs.o \
>  	xe_uc_fw.o \
>  	xe_vm.o \
>  	xe_vram.o \
> @@ -124,7 +119,6 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>  # graphics virtualization (SR-IOV) support
>  xe-y += \
>  	xe_gt_sriov_vf.o \
> -	xe_gt_sriov_vf_debugfs.o \
>  	xe_guc_relay.o \
>  	xe_memirq.o \
>  	xe_sriov.o
> @@ -133,7 +127,6 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_gt_sriov_pf.o \
>  	xe_gt_sriov_pf_config.o \
>  	xe_gt_sriov_pf_control.o \
> -	xe_gt_sriov_pf_debugfs.o \
>  	xe_gt_sriov_pf_monitor.o \
>  	xe_gt_sriov_pf_policy.o \
>  	xe_gt_sriov_pf_service.o \
> @@ -281,6 +274,15 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>  endif
>  
>  ifeq ($(CONFIG_DEBUG_FS),y)
> +	xe-y += xe_debugfs.o \
> +		xe_gt_debugfs.o \
> +		xe_gt_sriov_vf_debugfs.o \
> +		xe_guc_debugfs.o \
> +		xe_huc_debugfs.o \
> +		xe_uc_debugfs.o
> +
> +	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
> +
>  	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  		i915-display/intel_display_debugfs.o \
>  		i915-display/intel_display_debugfs_params.o \
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
> index 715b8e2e0bd9..17f4c2f1b5e4 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
> @@ -8,6 +8,10 @@
>  
>  struct xe_device;
>  
> +#ifdef CONFIG_DEBUG_FS
>  void xe_debugfs_register(struct xe_device *xe);
> +#else
> +static inline void xe_debugfs_register(struct xe_device *xe) { }
> +#endif
>  
>  #endif
> -- 
> 2.43.0
> 
