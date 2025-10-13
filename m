Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7DECCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 21:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACFE10E153;
	Mon, 13 Oct 2025 21:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fiVjYv74";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E5B10E153
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 21:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760390360; x=1791926360;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=loPvzJ+ZfXuNVsUPIrP3xUrxTPSFdSwhbf8VeNf+IDQ=;
 b=fiVjYv74TUwZwO/19r310tCabE/XkyluLy+g1Xot651yjZ1Dcfzfrh1E
 qouX7UYnQuJLB+6XplIDO6GJb7ZRd70e+wMFQpRJ+lJuNdTSZlOGctNhC
 NFSWt8utbZzE1ECmtZe9hQKbTNNuht06x/us8TRRNk6u/betKVGSNWVvj
 kB22WZnv7wca0Xt4RygGivk8+qhnjk/764v+LLQrAlbt8Chn9z1OiST96
 EveksaKpVDASPzAvZ+Xuw+2oxFudbZrdJ8252ndA9H1FneRTwmFtEYfpY
 eMadSl7XEFljtwqsHeHEQhnyVApR3/pqq+dH1md5Yhrasuj/+vTc1iIlE A==;
X-CSE-ConnectionGUID: uHVw61vDT3OAZ0bG3Kvh3Q==
X-CSE-MsgGUID: CIG5Py8ARyWdG0o28OkZlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62247380"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="62247380"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 14:19:20 -0700
X-CSE-ConnectionGUID: VEMPvj3kQo6dciUfK7mB3g==
X-CSE-MsgGUID: nj/f8RkLRXqehK6fgZM4zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="212667134"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 14:19:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 14:19:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 14:19:18 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 14:19:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3uaDR/n7VXxj3rAHjY7f8m8Udb8mw19x3JoE+FJlEEysq8+dqd4roV92ZeXbnKIa4ym75gmnx12wOZEvPI16IKtt+dyKTR85XQd4Vec9kGB8CsSWH59IIrq8LLilZg5exrjy38k+hq/P/vR8W4BF3ORjyhZnT1tfe/RzU5pVmwLhZFzbFx1/ls/tft/zl6IvPwe6P5H9oC42nWc/QZgnbbkRjTM/3mHJLFJek5kfzyHmxZxfhFqq41yorOuMfEiyVaJotBdcFUI9ZIgISFyPBumbDmNvOn4MADiDcUWL5OFp1CyymLRLDFltzwEuIqEECXjnbAKIWg2HWnteWRTPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hxYvlRkoYNVNgWjoQOYJ/N+BzkRP9HnEZoQcj2Ll78=;
 b=yK9Iccrg+eD9YJZSvf6ZVTkNaXP6rZlryjrbHoYpsoInOverLhoV0UBa3TgO6npGUzUSNSfsu9wCL+O5/+PQSXFmNSa6wTetb2PLjIgi94e0td116yTJu1xc7u04i9Yf5HtxAYDzZpDWrpYz2vPOWwTD/OdU2E6yfQazMRyiKfuJpQbl9MhV496gey2as9kmgWHlGR9C6veZUx/FTcytFKI73YkbB57oQyUAjpfmgc5JkQwxKzm1x3Drnu3bz6qG+mcU7h1YVvrSZHNf8BdC5yCIHuA5UPF1yjXN8MNIMjjf2k0u7DZyK5I5if6Xq4q3WcDjnwZvMD2VudbUq8mVWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA0PR11MB7884.namprd11.prod.outlook.com (2603:10b6:208:3dc::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 21:19:15 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 21:19:15 +0000
Date: Mon, 13 Oct 2025 17:19:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 2/5] drm/xe: Guard against NULL GT in xe_pmu.c
Message-ID: <aO1szvHuOgTR0FWV@intel.com>
References: <20250926200917.164618-7-jonathan.cavitt@intel.com>
 <20250926200917.164618-9-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250926200917.164618-9-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BYAPR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:74::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA0PR11MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa0c9cf-9cfd-4fb1-de3a-08de0a9e2926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ai7j/r6t/oUpTX2XQiUB8PR77CvRTjpyhSc/B9cdrQtBivqve+A9ksptTDbz?=
 =?us-ascii?Q?2yt3Ie3jg4mK6qIEOX2lsmOxYZyl9s5f3phtIhVDgdf+5SMCCcgrtgQ/P2dT?=
 =?us-ascii?Q?lcVBub+GZ3HgYEzfOQ992cN4aM2GMdu+QkcDfmA64nPY/nUzdap0QUFWuJzh?=
 =?us-ascii?Q?qFYmhTkW2uGddnCvm4izsrw0FSbWaC/QJXBsntIFoTxqeUrjGn54w1GqxOyg?=
 =?us-ascii?Q?dlYkRE2c84tJ85CWFX5bciSGLJV+SAInr/RQf//YJw4gNGAka/h9cx91t4Yt?=
 =?us-ascii?Q?lh1odUIzeDXhWncut6xCDiG3lu0j01px6KiqrZApVgNPxoO5jj1rpgLWVjPC?=
 =?us-ascii?Q?VVMfGGIVvvQDJIz6nD4C1MOWQ3JKV1WJ1HbRzneHCnefj4SNhqH+oLtJ5xLv?=
 =?us-ascii?Q?AaPvAUfOjJh5lMG232DRgZPnSA9dn1WtqYYdTUK11agRIHtEYCkMXqCz5Yl+?=
 =?us-ascii?Q?AplPJbltmACzmH/QoGiOx3eyR/GKX0CQpPswR9bBOoYsNu2iHncPqtg6C96w?=
 =?us-ascii?Q?t4YDjfgE1upndtoMIXgVLgtBUi81VqQsPyA5V/pK2wXTXgXcwaMf81BmZUAK?=
 =?us-ascii?Q?DYXrRBIP6q6BtaeY0KNArf+b9OtIHa2x4tS1BYoeFCjUX1665i+NmT3w39uQ?=
 =?us-ascii?Q?E7ZqcwYeCaZLfJ+prqsVtaR0ytUVDazueE2HiwjJoWP0/4jBEqOfr3iI370r?=
 =?us-ascii?Q?byu+uHrwnzdDPM1b45UTppDCiewiyhkT6SwmtBiVCJZNASVag2qoEhJs8BJA?=
 =?us-ascii?Q?Z6mIRYn6px8LWKUSETJyaqObeetTjxJIA89/EWyy2UAx2QB2ZKkUa8u/bCoH?=
 =?us-ascii?Q?GiLJBvO5yV62bF5Hxykj+07ditRYhy9XUe8gk1K7ik46he7o91XP44P23kej?=
 =?us-ascii?Q?fNs/n3TJAgAb8a3Q8Jn1muzVIEaVPGwsAc+RTroiL9fqNOYmapQ3BYSo8pah?=
 =?us-ascii?Q?yPvQp3D0POg8E6k48lBorpahWDCJ6/L8uU19VS6+ji1qg2aEA/+jJVf6OQLp?=
 =?us-ascii?Q?lHLftB1ZfQydthMuOgyWu9pSNpLqaTtF7t1P2o+wLzQKEGaaRopPok86l5I9?=
 =?us-ascii?Q?uuuGL0Dc0ckMYSrM5aBmKHeSojcdjhqjdsygdCctJbjWcjG8ElZ4rbJlpNN8?=
 =?us-ascii?Q?qxVCbpePd3ZoMF7XgwVCsb9UaVifCv7zv1vISW8vPiAZZW2MLxFSXnM0pX4l?=
 =?us-ascii?Q?VwgIm91Hp49PckqNlWiRPyMgVs0BamYT4btttvTcdL25tWjnAc1oEvLDv4nb?=
 =?us-ascii?Q?utfo7XT0QZDlJnD31/fvEDKHqCUIu1/TCpz6Dl/2hYDUBpolxrYaUavIHdIA?=
 =?us-ascii?Q?uzzW9Lp+xEKjtlzEfpqWbCHjvkAYsSSIfsK5KaSK0NzJzuryL/Fz82SOLDT1?=
 =?us-ascii?Q?Ie/yvGGg1/+XWaiU5OvPzUPmCSILUVZnxKsL2RzF4VPwtddW7VCPlhX7cbrj?=
 =?us-ascii?Q?HyjFLMeGPoX3ER1o49ThQLaPkhVQOIwp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Tosd9bB2cMKpvbErPipeACmsdwwfxXi3KWlMZ0+sCXe0Sl0vfDq56yGRdzY?=
 =?us-ascii?Q?EFj7TYJQsfH5PIbYYkrZ8reK/1Q610Ocz0SRXOnolGu/EreLu/wK3v1+oe6S?=
 =?us-ascii?Q?/HORcer7zYJUY8gsfJxAgN8doDrqOjjgFXjoHS6XTVWoQYHTIBh3VUnTk8cI?=
 =?us-ascii?Q?sSasj21RJyYllv3dww51dMh9/wryYGvsmbtqH1az7ZzflMjFioRc3MWs5P5r?=
 =?us-ascii?Q?LoqPCR7paZBC0CODRPSL9KEClf/BrHXXf1mJ8OVHAcDyaEdbLwkB1r8BO9+f?=
 =?us-ascii?Q?y1pCPkoIeEhsAZFfoEiclNb2KLgZcXDbnu0My28osM574uQQXyZg64l7oayS?=
 =?us-ascii?Q?MNoWCYZH3ctsL2or/XWHp8x+PS/0Q23feuzOBZJqLtGUs9tKCSzxJscD3l3H?=
 =?us-ascii?Q?F+2BcK778TeCGFi9KOBaE07r+T/BUQRZogEFHlWi9K2sALEXtqkreIefQy2X?=
 =?us-ascii?Q?Pys5jSRbVtC3BRy0+RhIBBLwGaYiKagE8N6ZiX8YLeOrvvbrWHF7ZOvhAJ9z?=
 =?us-ascii?Q?lXaXaZkvjVp8f24YgEqBDACvUkIYUqZBhcI2bWaugdYvjnfMeVLJOuhJ/L6L?=
 =?us-ascii?Q?83iFvy4lPkgGBm0FJ0ag/4J2APA5lyHJJOW5cmg8WV7PaDgq+FTT0ZpRHAi5?=
 =?us-ascii?Q?JQs+hN9U3uTZ//bia+MARr+6H23XQ9OzhJOCnTyRpJf8Ys8TkmaBNqIaf/bs?=
 =?us-ascii?Q?KRWUpUytRPoSTt1H/31QUFl7yZiayEF0rZJ5T8T+SAP7I7geH67w+UDGJrjo?=
 =?us-ascii?Q?em9zPZzuz/F0wZ57fa0jlweM3mlbZotknfL+zMupezlZY+5grZWH5xVk7Qss?=
 =?us-ascii?Q?NsxldVEU9fjVOikRGs9GYlmwbMOuNV7MkWxVxufpHctwQV8jrRbX58ABEiFq?=
 =?us-ascii?Q?89Cmnu8wHsYBAj6MSCiOoOFNLpOAGCtanLxGcHsqnnwt17l8Lds9SLXXgZud?=
 =?us-ascii?Q?Ai2u4QC3j1HRRAgIRAhIFB+374Uf7b089b0qVHqcln1WiVzDjwX5xpCvH6AI?=
 =?us-ascii?Q?p8/d5qEuuzyMFxTxukA0sxT4vr1vEr2otVtaDvQADW0uptNui1ZxR1BrVt7O?=
 =?us-ascii?Q?3go8AVEPa0zO3ioD+F9BkwNqvmi6tIgQDPnlyaF/5g5Riudv8BeZEvadWiuY?=
 =?us-ascii?Q?gjTL44OaGO8KGzsD6XuMyZiaoHCkMmR9jxEy4uJQ47ZM8P4WW44l8Mw4GStH?=
 =?us-ascii?Q?GnSopn4VP6gx4uK8HIWyaB5oe5ikObanBV9uBw52NrLPqheh5Y7l+AaUumYx?=
 =?us-ascii?Q?srpKgSVRAG/uGC6HVX/S65DcYaHCTRwf2TTNb2JASX3lxbRy7ypQrdeSNc03?=
 =?us-ascii?Q?sAn0htfe7OEoSSN3zHsr2JjBMmXipjmkPLBabYYGW4+yskabx4NThl79WpzQ?=
 =?us-ascii?Q?pEdc0tEML836pn/BFeM7TZVyFNtwGTrFU0EHiu3SRiznzhzEm2/1Is+7ptLw?=
 =?us-ascii?Q?xHRihrxp3VTOYzWpeX2S/AOZw2bHirtPtwxevkEOBGxNeaTgmSryMDcBQtFg?=
 =?us-ascii?Q?ft9EKdNdLfz8uCB0Ql0idomMew76SAojZcycOQeGhARlSkn0uNTiSbipLaEX?=
 =?us-ascii?Q?I450pP+NdtsIsvXxv4D7lq3oLcKd3Sc9+v02pA6m0ZQfjb/ec8h5TURGVbRc?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa0c9cf-9cfd-4fb1-de3a-08de0a9e2926
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 21:19:15.0317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2kSOBkgcm2N8o1+MrMEDUKhh7S9k+UoYkUs4nihXdaxlcJZRLB6HPoj9d8ShomtDHERGnaIOjlYAr9MuzrQKxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7884
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

On Fri, Sep 26, 2025 at 08:09:20PM +0000, Jonathan Cavitt wrote:
> Static analysis reveals the following issue:
> xe_device_get_gt is theoretically able to return NULL in some cases, but
> several use cases don't check the return value before performing a
> dereference, resulting in a NULL pointer dereference.
> 
> Add guards against this in xe_pmu.c:
> - Use xe_root_mmio_gt instead of xe_device_get_gt for the gt id 0 case.
> - Modify event_supported and event_gt_forcewake to take a
>   struct xe_gt gt pointer.
> - Only perform xe_force_wake_put in xe_pmu_event_destroy if gt exists.
> 
> v2:
> - Pass xe_gt to event_gt_forcewake (Michal)
>   - Above necessitated passing xe_gt to event_supported (jcavitt)
> - Only perform xe_force_wake_put in xe_pmu_event_destroy if gt exists.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pmu.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index cab51d826345..d54981510a43 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -130,18 +130,15 @@ static bool is_gt_frequency_event(struct perf_event *event)
>  	       id == XE_PMU_EVENT_GT_REQUESTED_FREQUENCY;
>  }
>  
> -static bool event_gt_forcewake(struct perf_event *event)
> +static bool event_gt_forcewake(struct perf_event *event, struct xe_gt *gt)
>  {
>  	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>  	u64 config = event->attr.config;
> -	struct xe_gt *gt;
>  	unsigned int *fw_ref;
>  
>  	if (!is_engine_event(config) && !is_gt_frequency_event(event))
>  		return true;
>  
> -	gt = xe_device_get_gt(xe, config_to_gt_id(config));
> -
>  	fw_ref = kzalloc(sizeof(*fw_ref), GFP_KERNEL);
>  	if (!fw_ref)
>  		return false;
> @@ -157,11 +154,10 @@ static bool event_gt_forcewake(struct perf_event *event)
>  	return true;
>  }
>  
> -static bool event_supported(struct xe_pmu *pmu, unsigned int gt_id,
> +static bool event_supported(struct xe_pmu *pmu, struct xe_gt *gt,
>  			    unsigned int id)
>  {
>  	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> -	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>  
>  	if (!gt)
>  		return false;
> @@ -219,7 +215,10 @@ static void xe_pmu_event_destroy(struct perf_event *event)
>  
>  	if (fw_ref) {
>  		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
> -		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
> +
> +		if (gt)
> +			xe_force_wake_put(gt_to_fw(gt), *fw_ref);
> +
>  		kfree(fw_ref);
>  		event->pmu_private = NULL;
>  	}
> @@ -233,7 +232,8 @@ static int xe_pmu_event_init(struct perf_event *event)
>  {
>  	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>  	struct xe_pmu *pmu = &xe->pmu;
> -	unsigned int id, gt;
> +	unsigned int id, gt_id;
> +	struct xe_gt *gt;
>  
>  	if (!pmu->registered)
>  		return -ENODEV;
> @@ -248,8 +248,9 @@ static int xe_pmu_event_init(struct perf_event *event)
>  	if (event->cpu < 0)
>  		return -EINVAL;
>  
> -	gt = config_to_gt_id(event->attr.config);
> +	gt_id = config_to_gt_id(event->attr.config);
>  	id = config_to_event_id(event->attr.config);
> +	gt = xe_device_get_gt(xe, gt_id);
>  	if (!event_supported(pmu, gt, id))
>  		return -ENOENT;
>  
> @@ -262,7 +263,7 @@ static int xe_pmu_event_init(struct perf_event *event)
>  	if (!event->parent) {
>  		drm_dev_get(&xe->drm);
>  		xe_pm_runtime_get(xe);
> -		if (!event_gt_forcewake(event)) {
> +		if (!event_gt_forcewake(event, gt)) {
>  			xe_pm_runtime_put(xe);
>  			drm_dev_put(&xe->drm);
>  			return -EINVAL;
> @@ -443,13 +444,18 @@ static ssize_t event_attr_show(struct device *dev,
>  				       struct attribute *attr, int idx) \
>  	{								\
>  		struct perf_pmu_events_attr *pmu_attr;			\
> +		struct xe_device *xe;					\
>  		struct xe_pmu *pmu;					\
> +		struct xe_gt *gt;					\
>  									\
>  		pmu_attr = container_of(attr, typeof(*pmu_attr), attr.attr); \
>  		pmu = container_of(dev_get_drvdata(kobj_to_dev(kobj)),	\
>  				   typeof(*pmu), base);			\
>  									\
> -		return event_supported(pmu, 0, id_) ? attr->mode : 0;	\
> +		xe = container_of(pmu, typeof(*xe), pmu);		\
> +		gt = xe_root_mmio_gt(xe);				\
> +									\
> +		return event_supported(pmu, gt, id_) ? attr->mode : 0;	\

This case here highlights a big problem with this series, that is the
Michal's comment that was ignored.

event_supported doesn't care about the mmio. it is not getting the gt
because of the mmio area. It is a case where it will receive an id
and you need to lookup for the id and see if that GT exists or not.

That has nothing to do with the mmio itself.

I echo Michal comment on have 2 variants, when that get_gt that never
returns NULL and you mark cases like false positive.

And another variant for lookup-gt where it can return NULL and you need
to check. Intended for cases like this PMU that has nothing to do
with MMIO.

>  	}								\
>  	static const struct attribute_group pmu_group_ ##v_ = {		\
>  		.name = "events",					\
> @@ -497,7 +503,7 @@ static const struct attribute_group *pmu_events_attr_update[] = {
>  static void set_supported_events(struct xe_pmu *pmu)
>  {
>  	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> -	struct xe_gt *gt = xe_device_get_gt(xe, 0);
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
>  
>  	if (!xe->info.skip_guc_pc) {
>  		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
> -- 
> 2.43.0
> 
