Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F93C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 20:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B2A10E364;
	Thu, 27 Jun 2024 20:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8XU9FAT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC2C10E364
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 20:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719519869; x=1751055869;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=siNM7BLGoHgKOihLk3kr/QX78XlvJmZ9pUjRHMmcRd8=;
 b=F8XU9FATnh8jkAf/s3SHFcRlawaSpNv934qNCx+DEJ3VRpmxrkjix5wD
 qSdOm4TKAv1sMVoG86nkQuX6cLvBOkg88PGjbLTu1Lwe9rHzntnsX18b+
 bZGHr+MIeXB3mKiqAqCYdREdc8M4HuBfYgWsKvirus3QVqR0FiuZkaEOQ
 VIsOw1vKjSlU9IUcJ/FuWBsRA3ii1sFu9oyxGr1b/82UD1wMsSNGFoFT+
 zatsdqLFYL4XcuAgHpIZ5XU1vxaTnJRvTGNc3YreGa28JyWWuM15PMMtr
 a6pcCtmRemNULi/r0EGVIYnvGRhBIrpVIrL67SpYmB/EbxMI6wk52q+eg g==;
X-CSE-ConnectionGUID: CF1bAbRDSm+pdIg89dq2wA==
X-CSE-MsgGUID: UiIH7qJ3Q/q09Ucd1ZtSWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="12288496"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="12288496"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 13:24:29 -0700
X-CSE-ConnectionGUID: uoepVIuPTVW0pyljDmVnoA==
X-CSE-MsgGUID: DUsK+M8tSby9/x+VOCCXHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="44570919"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 13:24:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 13:24:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 13:24:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 13:24:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 13:24:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyoq0BTKxNheUR57CGpyvG5aFYZOjIbUNEZndPPRQl2PrCVFtc4uRzf0pjvs30ZgbNIEjD5SBlSQ0cwD9sMdBhUhN2ttsP9WO8bq7aXTJBIeDbs6PeowSkV+0lrMjoNOK8ag+mcJgOe0uqLgy6U85QPHcuqPmn796uNI66fx6vHFY6E/J6tAzYJEUIhcgfzflhwxLlJlbf3MHKkjYSPNndoyANnr/RHEcChpmyY1Khmd1VGsZryjmkec40FeYD9SiGCJxo5XWcFcHi6cB990cDWsCLPVDW5VOkWGxMOts/0qZ7yB0P/ChbHRQi0J4Rp0fq3Px+Zu6aKJJdpTNFLYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPytbcfkp4NxIdYTG7t7lnxGDujVcIrJ++VftDdA+GM=;
 b=eryOPuktOP6ewZfemJiQQs8702fNJLd07ZBpk/iCtAM3lb2PMVqhE9t8PVCRGAUhdvIOHJlqLRVve8adMJOQTXqN2BYSAeLhhf6N69EEZm2LL0v+mAZfd/+ssG89uw0vbdIMFILbThL1UeWdFeNe7EGRaa3QSltOkafdLfo9xMB4uhmAQ3uS2yHXFu1AAspFz7/xZ7uxFcZU0LY1rEVSWCmAOLf32pRNA+yBQxH5IkMF3kGueuhQzleF52O0KMXrr41XhY4NN5kyuCli0NdGjqpI9AW263C5IXZtCtnIUyuWRrpzJS0+uBrbt+64SEUmSGsKRf5xcPDkrcaypsHh1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8137.namprd11.prod.outlook.com (2603:10b6:610:15c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 20:24:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 20:24:25 +0000
Date: Thu, 27 Jun 2024 15:24:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 1/2] drm/xe: Use a helper to get delta run ticks from the
 exec queue
Message-ID: <kv6aazz5pvucxo64xenzu6zyss3vk32ibja7a6clvf4khnsg7y@22fr4yhyg5ug>
References: <20240627172348.84991-1-umesh.nerlige.ramappa@intel.com>
 <20240627172348.84991-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627172348.84991-2-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0106.namprd04.prod.outlook.com
 (2603:10b6:303:83::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa2d6ac-c6d7-4465-e5c5-08dc96e7233d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wGMcwc4CVxpH3nO7kd5g+oedMWTULUG88GQihEYcaTEOZavCbGEyqFj6V7fU?=
 =?us-ascii?Q?3QB4h+NGZIvgbMB2/ZNA/JVLebYZIU8NcyCkoc7xLibVjCZdeDfo3Of7Q8af?=
 =?us-ascii?Q?6dA7nYusOSuAOphpWy9g8K0/S1ExDRM2T+u6CPYd9rHVCEeJEGfSLiItS2MT?=
 =?us-ascii?Q?WeVQ522bc6/YSqYrD6cRLwOyfpoSL4h3i0pyxmyVsRRQWKohYU9VDQM/GQNX?=
 =?us-ascii?Q?wY3o9zjmOcUFVa+mbt4jYOTPj0EDskPt9V1NVdEcs7QBrQg3LqGZKq1HAnFP?=
 =?us-ascii?Q?DRbHKOoDh0UbQpNPMgbMrElRqUSGwYlhCnUGN4GDSd9aNspRcW3pbke3wT2n?=
 =?us-ascii?Q?M3be33QOsyMPGs2m35N28mB6u+n5d0Sf0iA2gyKzormbk19uu2RHs/2LkNOW?=
 =?us-ascii?Q?wjjZR92SfaYJndnIreMWR8YQTeI5OaLNrTw+9WmowRLPI6L5hY2Tjdv4mhxD?=
 =?us-ascii?Q?m4xRRpf67miM7NuQI4F4VKVd9AXx72g8n/pXqY0TZwhXYm4zEqi8DvVVTDZe?=
 =?us-ascii?Q?hUTOhS9N9iESjTf8SuiCDuOktUjCVSkHH7ByXqqwGR38kJgIGHhIILCbC8Vc?=
 =?us-ascii?Q?boMR6KR3bO8Ky4wlId6iV5Rcy7TgcOW7fgtDtfvTa44irs2StUWSRyG76XCd?=
 =?us-ascii?Q?9my1jOwJ3q+2gdMi2N57cDd30NU6VFHJI9hTsKbNmNDEupS2sNaelxELPy26?=
 =?us-ascii?Q?2+uPshwtJclgoM+TAIzHQaQ2qBErbnN7Q9KOqO9C/ZGt57uiJkJhyKP0Hgvm?=
 =?us-ascii?Q?zQ0aLPYIX3e6zHkKulYS71Ohp7QBpQe2vdTrgvaXW/g0rp71w5F1YQGOKCTL?=
 =?us-ascii?Q?1079UJxHyriRwlOklk0AJ1MoyrSFJvc0VFmtVBLjXLV9L1m8mlanm/Ssy2XA?=
 =?us-ascii?Q?jE12vlWGf73IGa4vRz1ds35ehIOEOmEVo3za7HXE1gKJlc+RE6F6V/PujQC1?=
 =?us-ascii?Q?hQftfA8NFW1RzaU4vtLZ9krVLvHJPsl+bdGRszZskZ7nmLftSJSrlplNuMdn?=
 =?us-ascii?Q?h/LTeDFtnJY7AYM9z7P8ypGMapAgwgQBRC4NP5sinvMso0jNtKD8u9h3BTnB?=
 =?us-ascii?Q?jNhNJtrKgr2gY61y95Oe47U8P3yroyVFMYPrFL2iFh+6LbrS9Vr28S1z+XbA?=
 =?us-ascii?Q?qn/SINyBrXwDtUDgHqSYsBnNS42NNc7EgQdxDej4oZtAaaK7zl6M10UZFpWt?=
 =?us-ascii?Q?QVjdY9gmDnmls8jr+u5IPXP29MK+le+jdeTUSxBiuGNSLDmvWBFm6JUyqJn0?=
 =?us-ascii?Q?Y2BYz/6yzDCPROQ7R9bRExBM00bcaS/w12t9cvEIVDWVLXTyWsB3RqBFYeij?=
 =?us-ascii?Q?LkK1V2zhU3roUidzdVYG5+HOXbnPqq0Ky/DMeP7vssXAOg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4pYRA9SoysAPkOkKMrjEVfkVBvMTtupk4RcJl897VWtb39o6QdPwjp3FjLwP?=
 =?us-ascii?Q?P/M3s0u5wFf6405Soy1rDI3PP/+2oKCCEnpgBRtwSpHRVViXqm2VoklBOXUu?=
 =?us-ascii?Q?4GwGgFj4mNbfKwjEaR0IakmsCihyNtzijma1jLEkWtVf1TvHy9RYkPGLNNZR?=
 =?us-ascii?Q?qfGdkpNYVrbQs1+WoPnAbtum2+MaBnnPFemtuPryp3+08FtIkDZnkDpxumVX?=
 =?us-ascii?Q?q4V0OXrjxPJc2MjZ1hAFiUD4DA7FDm2/GPzVM4SdGDSJRcbRQKfogNMFtC+J?=
 =?us-ascii?Q?tjT+0+PtBhsHmUfQZOCJOCPg49kHHa1kl11SN8PuQ5LbX9S+Z0lC5tUNwjJv?=
 =?us-ascii?Q?Kjb+0qkD6qnSHVKNMpTWWtMls172Qd2HEGdgagPasEUOABYueltDJZ2ZaT4J?=
 =?us-ascii?Q?QGbrYaUekDN45gNEKp7geoCv1blw59fRVNLu7TSWoSaHfFkcDgl8M+oe0ZqE?=
 =?us-ascii?Q?4PDhxXkp52QmQsI5CDz1Rlg4DLL5T/4xfEYx4IOVUTWBq5gF3oamGVjVl1b5?=
 =?us-ascii?Q?6ubwyeap5/ximgYrHFQONmizPEVTCu0foBBbYIz0988/0UYLS4KKb52IAdXB?=
 =?us-ascii?Q?m9/9d/SN98vMQQDC/wz2/ErIgQKPiPuFJ+qEX9etWo3dwVRpTJ7gRQ2Wjv+L?=
 =?us-ascii?Q?fruYH87sE3nY2BSH998rOfJf/GukpftOShrvSh730odzvR0ktWJar35tALQa?=
 =?us-ascii?Q?wg2kzV5Ida2gWiJNaY8sJydjC4SWRJ1nMoyaxz9tmJyQ12J07GvPt6EYgVhe?=
 =?us-ascii?Q?g5ifipxdy1+Kh4BETexgTJPDyTYfwrvOyJyHSmBz/QVijcZBRTE7sz5SSAWW?=
 =?us-ascii?Q?nM+zd3IV32ZD91oennmQiRhkafUofLBmYBsovr97YrCBOwc+v6iS/9ycN56h?=
 =?us-ascii?Q?tme8qoF53PFYQmTxrXD2eyKxDlfoaqv6zu1/DEN1OLyQuXj/lJ/yn32i9ome?=
 =?us-ascii?Q?Vl+5tjBFMPeqCSvXJdSzUQbVT3p9OT7YIARsBHAKzZ3PdSLkuVx8DDACu7+V?=
 =?us-ascii?Q?ffPcw2u2Aj+rzhT35cRKpWecve62vg0nQ/U7g+1KH3qIof21MuTdULwW6Vv1?=
 =?us-ascii?Q?gDQTcDRhXg7HpTFGf5ys2YmVwYVhcmSK2FMiwTyzvEeB/RO3xDBbn6L1M7pa?=
 =?us-ascii?Q?rKa/u/Ns1d7axA8U213kAdc6U0s5t2n1/F+k0K/C+ud87xs0xLP+FwyRGJNi?=
 =?us-ascii?Q?349q3kw9MEXV4PTimo+6USciGIHfnZ0Zsk36k5OnDRRF6bowSc6rOnmZCyf7?=
 =?us-ascii?Q?4XVX2rkF/DGMduBm0epS7n911aq9sqfTQiO//OcSPtWniJSKWmAE0/+Irh2l?=
 =?us-ascii?Q?yLUyhOonnbUzKbXC4gVedCmXZSM3RRP4U85uPhH7kvGL6HJOAjUjvRZJ6xDA?=
 =?us-ascii?Q?Cojbu8UVCaH5dVMtkAJfFqfc7IJt87CqJIn7t3tkii5E66iZRQI1kNBPT5V3?=
 =?us-ascii?Q?LKlhW9nQDAG/hUauXko1vyjYdB4Zgqkn5uRzKpj1ly74fUiX5Zu9VTmj25H6?=
 =?us-ascii?Q?Sa68eSIMGcVDm1OGXVwiUa5RJMsJw3SyxU6ow8y1w7zseXSS7jjmEPMcP9/g?=
 =?us-ascii?Q?tpO6aiEgFjBfxx+2xHScKtt1Jki7Jy3XCGg2VLLIFGkOAckEe9fbXwcWblWq?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa2d6ac-c6d7-4465-e5c5-08dc96e7233d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 20:24:25.4417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1dHi9WvI1I8qNlYOds4yM3Xnmf2TCesj5yfbkpHRRIN+WTkS3Cb0+blvxnj112NJ4XCI0jPSn1nY5AbhsiOw3s/Q+a1XoJoJbO89/6DHXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8137
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

On Fri, Jun 28, 2024 at 01:23:47AM GMT, Umesh Nerlige Ramappa wrote:
>As per earlier review feedback - code manipulating exec queue fields
>should not be present in xe_device.c. Use a helper to get the delta run
>ticks from exec queue.
>
>v2: Drop the Fixes tag
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I think the names are not very good for what this is doing now.  It's
not clear *_delta_xxxx  will flush the previous accumulated values.

Maybe it'd be better to have:

	xe_exec_queue_accumulate_run_ticks();
	xef->run_ticks[q->class] += xe_exec_queue_flush_run_ticks(q);

So names are clearer and you don't have a function that does 2 things.

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_drm_client.c |  7 ++-----
> drivers/gpu/drm/xe/xe_exec_queue.c | 18 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
> 3 files changed, 21 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>index 4a19b771e3a0..e0c4a50d372c 100644
>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>@@ -251,11 +251,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>
> 	/* Accumulate all the exec queues from this client */
> 	mutex_lock(&xef->exec_queue.lock);
>-	xa_for_each(&xef->exec_queue.xa, i, q) {
>-		xe_exec_queue_update_run_ticks(q);
>-		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
>-		q->old_run_ticks = q->run_ticks;
>-	}
>+	xa_for_each(&xef->exec_queue.xa, i, q)
>+		xef->run_ticks[q->class] += xe_exec_queue_delta_run_ticks(q);
> 	mutex_unlock(&xef->exec_queue.lock);
>
> 	/* Get the total GPU cycles */
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 0ba37835849b..4d90a16745d2 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -786,6 +786,24 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
> 	q->run_ticks += (new_ts - old_ts) * q->width;
> }
>
>+/**
>+ * xe_exec_queue_delta_run_ticks() - Get delta of queue run_ticks
>+ * @q: The exec queue
>+ *
>+ * Update run ticks for the specific queue and then return the delta when
>+ * compared to the previous value of run ticks.
>+ */
>+u64 xe_exec_queue_delta_run_ticks(struct xe_exec_queue *q)
>+{
>+	u64 delta_ticks;
>+
>+	xe_exec_queue_update_run_ticks(q);
>+	delta_ticks = q->run_ticks - q->old_run_ticks;
>+	q->old_run_ticks = q->run_ticks;
>+
>+	return delta_ticks;
>+}
>+
> void xe_exec_queue_kill(struct xe_exec_queue *q)
> {
> 	struct xe_exec_queue *eq = q, *next;
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>index 289a3a51d2a2..42f683e5d88a 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>@@ -76,5 +76,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
> void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
> 				  struct dma_fence *fence);
> void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>+u64 xe_exec_queue_delta_run_ticks(struct xe_exec_queue *q);
>
> #endif
>-- 
>2.34.1
>
