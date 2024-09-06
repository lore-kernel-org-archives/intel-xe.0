Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B823DE6FE4B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6823610EB09;
	Fri,  6 Sep 2024 21:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntriF9uR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA47910EB09
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725659556; x=1757195556;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6/uXU2SSF5Xs3lk7uab/cuq2SZD7uzW+u2qAKbzz1LE=;
 b=ntriF9uRKIcYTJcBqgBWd0+g4pDpJUHGczstNMJsdhIhwjW1/zJ2Dm0s
 JJKFS72ZKR0Nwju2EKcoKmeBNnfb8+cCoPgWt10RjLMb2mQD5ZqGFFi7c
 zKm0OcXRSxc+HDL+WMAWdcaUo4rLNKRbrbUDRFpzUwP7z9eD8rmXzCrqi
 uEfum8t1yOt6ZMVxgpzD2he6Y1AQOFGBej2VHFN4HcAhORa0ONrhUTygi
 skvA8UwYW/s/CDmjTvHeN2UAxCvi0794hDIS2xU5giEeEX06s0OUOr+lP
 05fUMXn5rv/DcVEpL1akuI0P1CuQ6hMtZoY2kTyK2OUxE7qBVdIrg6pH0 Q==;
X-CSE-ConnectionGUID: 2hu/wEfBRsCBgVX0YH0btA==
X-CSE-MsgGUID: geW3gAweQFqoNdDTZ1m6rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24297332"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24297332"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:36 -0700
X-CSE-ConnectionGUID: 855oScHqQdyA/KKWA5Taag==
X-CSE-MsgGUID: hiCEi10IQkOm4B3gzMaftw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="96786481"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 14:52:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 14:52:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 14:52:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 14:52:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 14:52:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQdfeG4+mpEx39zEiXMX+hDHA5TnQfSi7PiMx09z/iP8s3WIch63WTsxU60zbtpO2973lBBppBHrMppiUzuGDhmh3j3KlcFe/p+0JzG0CwgLHLioIISTh2nwlV1LjqesSRFTmbrfkIfZ/eCjSdPMIAE/f3hJpLnykR5gEogcPsFBZI6afjOzGnskjX/4BK+hZrmctl0U+bVBHzHbiwxHhVH5fzyotob4uNl/ZPpGX0+tZCT4mQvc4XMRch0UqLU7ZZ0TxGIn/cyHOa+WwfSNzFwzovAHuhBLh20p5yHaoX7N4/cBXhcnDsk+x3foiW0UVGBTTirFSHtBoRXu7AuckA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cg/n+z/knVC7gJbAmebfJ4dMEYtRniQYTkivEb8M8C4=;
 b=Un8vMQe4C/y8JFrauUS6WvRIcYWIiBHVh5mtjCRzlJPk7DvtaCJKydSJhh2JCzY/elYS9ObyWOhdSspHdRUphV/MIpJWOVD8G1MI0lPEVDbrnS0VwhopXzc6e8k3FGm8nTrPv8c8fvKl5AvWR/bnjeeDXeGCNp9Pps9Ovv56WtRHE4AipdDqzoIuFBDKD0WUyKfDN30fRMVSL2Y9qL5cnfI390AYDr8j9Ym1smB7kaGdDuAX7nf4dNHTmPbgGLUBGdSpx9J726B+QvHYzLxD/o97uboLkc+luQIBIy2l8g3UQCTxo7EGPVoa7zHqHD/jkXiA8OSOQMk3voNOvxFdkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5193.namprd11.prod.outlook.com (2603:10b6:806:fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 21:52:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 21:52:32 +0000
Date: Fri, 6 Sep 2024 16:52:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 15/43] drm/xe/lmtt: Convert register access to use xe_mmio
Message-ID: <hcul3ee3xj5jzcndegnuwkbk33enmdt54osoluobgv3wobccwj@pl43uwnt6l4q>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-60-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240904002100.2023834-60-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0194.namprd04.prod.outlook.com
 (2603:10b6:303:86::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5193:EE_
X-MS-Office365-Filtering-Correlation-Id: 382a0e09-2906-45ce-e57f-08dccebe3609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f3azFZl79pZ7i8JUB4oE9nsGerF2hsV48sYuxY9cmdipkXzATmi8NgIZ6LEO?=
 =?us-ascii?Q?aI/6JMp9/+RQ03CwfteU7TAlt582a1acxHvanzkcSoeVOM8KquL5Tu/o0lVR?=
 =?us-ascii?Q?Btfpvnl1VHO0r/OAJqoUN35qdXPp1P4P5Zu+fHSYVY1tanCZIlY4+Fyxt94T?=
 =?us-ascii?Q?mbZh6kbtRVOlevK+m3IHjJnunN7IfnSS4p2zul+HUOEwsSq63bS9odrOq3XI?=
 =?us-ascii?Q?d7RI+0klwhda786c5DZONhBC01lI57CnovALFPydWSNtPUAS+P4FfnKm3Wqp?=
 =?us-ascii?Q?+w8Cn6iqo7bCKm1eYni+9810JT04ldI8qU5JetJsf3ZQEGVhRt1x3KVAnqVc?=
 =?us-ascii?Q?QCjo7K1Cyck+yer4wRjUo7E7/YyW9l0ZxBYbUDoU1gAqux3X5rpvA/liTy0b?=
 =?us-ascii?Q?9JL8ucn264ApKDIocIyc9t33IYj+iRoBNEin9t0u1A+fJkBqT+qNg5cKVD8/?=
 =?us-ascii?Q?ejjoB7y/N3R0R51E/Z0PCmZwBQP6gSoJPNV425D02NGhmRqIAu0f527T+exb?=
 =?us-ascii?Q?7VB9auyTptPMD54Dx0AMS67Mwfbe6/Fy13bwrm9Rk2jvVRcuYjhWRSJZJOAZ?=
 =?us-ascii?Q?+8MeGteCeJwgTknKAqZCut9aeyfhaxzaKGSFrmfeKoazXMFq0jN2ivCXWEHL?=
 =?us-ascii?Q?p8wBLFjeIBsjZJPnQJr3R5d87wGBN8y/APGgmQiOv3HuNc9DKBOT+6QInySA?=
 =?us-ascii?Q?whcCwRKNOM+TA7eM5+Fv70DTkmZE51BhdPbItol3E3cOsb/PbWV05q8+VjKx?=
 =?us-ascii?Q?rfjOcnr2ig3SS8k1Kjhea+8eBc3BHzR0YksNp35FMERZHVxbd2yrYEZ+YZLN?=
 =?us-ascii?Q?/u6EsJTn9ySZ27l12UuHKheXoCi3f66ClO9ka6np+G096PGCLEvfXNO/udCr?=
 =?us-ascii?Q?JZkwbeEI0E5B0O9d+IltxW/SNkd8m1mELD8++481fcF4V0KC22M0B6/WA2QD?=
 =?us-ascii?Q?J6J5/NK03niaNAHjpiCpmj334CvcCbwEjinpWHGDWXs2Xe0nDDzKYmgrOf/k?=
 =?us-ascii?Q?s0UjLrq3Olo5Sj6atZWIbXJyWgMhswP8nG9h9raVoDfkoV8tA/v8Vkri8BDZ?=
 =?us-ascii?Q?MGru/Lu5qrLzwp+0RSubLTAMkkRRwhpskSJG38lJ1qrGtMScYHnE9bVw9tq1?=
 =?us-ascii?Q?CcXCYhau1jgLXmJ6Nx9gSYtbLkv8R8QP3lL82mgXVsGqqn6/OeiHAv+pLhqM?=
 =?us-ascii?Q?HBP2O3vRT6CbxzFXi4KGGLiwDSnQHFYxta6zSAezi6wOFxFASG1wN01Av5gM?=
 =?us-ascii?Q?p0SjMhOC0tuefKZlsYYquqklCED10k8nwes/k7g/Sd3Cx/j5CUZmdshLWduW?=
 =?us-ascii?Q?u4L/Wn4rc1Ffiel5uCkazMB8R18DCriQiIEs6t7Zt2qxQw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FmFaC8XxVn3wFlqXvUEksoAO7S5UxawAT5MZ19H5P0yhbki7zmhe8sd1Wo2k?=
 =?us-ascii?Q?7n39Z+7v12vAjY1O9w2S4V6rUH5CzX/yfr/85oPP29VpiPrSHpmGIKDt/42T?=
 =?us-ascii?Q?4BBS8bhHzRUDEzOVHI3GXpcqkJe7l3O6nrrccK6r69QqwnbybaTVOsBNPl9Q?=
 =?us-ascii?Q?fv32q+7IaG3qqkyUDBnxZGPyaw09xv7uFrhwDEprf4DzXm1bKg/NBTG+dBok?=
 =?us-ascii?Q?2Ko+FKQibDZw5JRaW1kdy+TClm/DW5R+ZziKdhEDkhXPudXg6IbsX1Pcx2uQ?=
 =?us-ascii?Q?P2AsPdwfFBC/OD2Ye0nWtDfDo5Pe/vH1SvJO0WR4qIpc0zx5H0bGne9Nf09B?=
 =?us-ascii?Q?YM7vhqsJ/6UgGoEeVDByn75BIA0XX1PBPRJln0S5pKGaAe+uTKzEK6E2EzP/?=
 =?us-ascii?Q?Fz14h44Orum/sG8a09y2JTBlSi3DsP25pECCMOOAvbRn7A7a9/JdU3kwUOWY?=
 =?us-ascii?Q?JIxAoMxhY2+5Za2Fpgc6+knLzRzEWGPKbsd0ZQjOYj53cKoUQ2l9HuS48M1i?=
 =?us-ascii?Q?uL2DyUsBA9lr2lr9RvsxjcayqMro42m5dIDgHUJ2Lp6ZTCKGLJ6ebBNcsrEW?=
 =?us-ascii?Q?zlkmtlFssfg0ZeZxHiT7TeROvvIbnpZg6f7hbPLSu+3LhzWMo6xLQLB0CG+0?=
 =?us-ascii?Q?1Evd8HBytU329MqCqF5Vi4FQeYHA2cPasApLyxSMbGfY2nGZqjoXzh3U2Q7+?=
 =?us-ascii?Q?IoeMxjonVrRc/SbhcBgya96QWNSRIZ4m9/6Pe0dpqVLvnGjxhshcIgoCAbab?=
 =?us-ascii?Q?WKpwDQy7dur9zRvDtUMq0CxXjnb4CsVBZcRmF5L8Inb01KHzGtJj4GPaAlfD?=
 =?us-ascii?Q?CiJ5TjQL3qn3dOhe67njIAuCYUJS+Ww0lLi09m9k4eN9SBSWncqP/kvHUDHl?=
 =?us-ascii?Q?/Hf8j5UPfUq1JKGqSIIpey7DiS0slKU3/a8LDRACoHn7iX27ps/eOvgOaFIS?=
 =?us-ascii?Q?TANzCJHQikC52E4HolUgArJtzhtAJoiPWnuchDq6mWhRkTYfV6/8EdXgqyvr?=
 =?us-ascii?Q?h81pKGLLqATg9Jf6lcR5GIrqca6q6NkcVa243erN9yNy9mUrydhV0yF3WIAH?=
 =?us-ascii?Q?LtYgzE3pJfMjtlr92zHOc2vehm3McWpsB1hOJ6p0Goxn88E4wwQ4fgTw86Z6?=
 =?us-ascii?Q?EjTvsbAW7Bu4cv1pbFTGQtvkYxdcarKta1EeWWRoYPTGekE5Vg6FcT4lMsaR?=
 =?us-ascii?Q?XPjpqC+WD7hQ8E8Z9yqL/xPqvdkRuh4s8C0vpcKxQTr0KbKpuzDasJRd46Ao?=
 =?us-ascii?Q?4b76DIwkyXVi5Zg4q9kYKl83QUUiwKC+21E7DmtpuqvA24vCbel/V6cYsczx?=
 =?us-ascii?Q?clpeb+z3ZxOkJg714exsiti2Xxz6fMEk4SL4uwir7FkiPuMF+y5DRUIkBFiQ?=
 =?us-ascii?Q?KzaJCEMzT/6fpqCceOwlpIBf1PLcec2E/yX/GXLt4I/tpwL+7NF7PHykqCny?=
 =?us-ascii?Q?iH8po9HSCDFokD/FVEM7UxSA62+rXypQwsZQVDuZdetdGEMMnwz5X/67riiY?=
 =?us-ascii?Q?71SJ8McmPzBM+KDu5MEjmEmrGeZbq35sTCg+vvjI+7ksDwUd2mgK2poiq+da?=
 =?us-ascii?Q?kLF34ogNIRTIRfjtLPgbDqeU2MnrTD38KaKdOQXdIeihrKdciwIf0pKxvYcG?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 382a0e09-2906-45ce-e57f-08dccebe3609
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 21:52:32.6552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GeAGTGDB6rqf62FwdZ5UK2L+cjkgRMo6hLU2Jqj2uuQmDYGWHMEF7FI5p3r34yUwS7c0isNDyVjtYppVYTZ00M5IpkDi++n+UhHYEG/phB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5193
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

On Tue, Sep 03, 2024 at 05:21:16PM GMT, Matt Roper wrote:
>Stop using GT pointers for register access.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_lmtt.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
>index 8999ac511555..a60ceae4c6dd 100644
>--- a/drivers/gpu/drm/xe/xe_lmtt.c
>+++ b/drivers/gpu/drm/xe/xe_lmtt.c
>@@ -193,7 +193,7 @@ static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt)
> 	lmtt_assert(lmtt, xe_bo_is_vram(lmtt->pd->bo));
> 	lmtt_assert(lmtt, IS_ALIGNED(offset, SZ_64K));
>
>-	xe_mmio_write32(tile->primary_gt,
>+	xe_mmio_write32(&tile->mmio,
> 			GRAPHICS_VER(xe) >= 20 ? XE2_LMEM_CFG : LMEM_CFG,
> 			LMEM_EN | REG_FIELD_PREP(LMTT_DIR_PTR, offset / SZ_64K));
> }
>-- 
>2.45.2
>
