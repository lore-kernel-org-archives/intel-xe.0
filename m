Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9EFCE7AAE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 03:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D84E10E970;
	Fri,  6 Sep 2024 03:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCvxpDgL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EF310E970
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 03:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725594499; x=1757130499;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ngPElZXRodcFFz/AT1H3KWflzXvIA6pLEykeiMgo11g=;
 b=WCvxpDgLzJAVBRlaxrO4HKwpwr6zIoGesmZ3hnA9CiT2KUa0EbsaljTx
 riWNAlMoyuKIEaYBZAYsKoiUI1LfFHzNZzopinKCZYE9VE+F8pZgGnBc3
 /K8dGl1y8aZtOsAzAFzL4thK9hGs1aFDo6zOQLfCN357gYctQMaEej10I
 DJX2eSP5KeWDN6+jQqAcWr7IYCRDow6H9jU5hlpq6ovMMYKsdmu2OJfgA
 XU+RUU/7AptVTmdcB1md9QODWTAn/HgpuWyxk+cR7mtcNU6izG1Nz7BGQ
 jX64evvEcmyo1V1QNltzJ/YLba3les1NDIycZmXN+PacMLo04aVWqKLpo Q==;
X-CSE-ConnectionGUID: Zc1lnJ3dSY2MUyAW3qIMAw==
X-CSE-MsgGUID: Pjsn/ILxSV64MWAhrOh+iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35729496"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="35729496"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 20:48:18 -0700
X-CSE-ConnectionGUID: imsKvaSCRLSay1gGtiNo7g==
X-CSE-MsgGUID: C0DF4w+ZRmW/2ib0r7cMdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="103310242"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 20:48:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 20:48:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 20:48:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 20:48:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 20:48:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HayPkrlxNhDArSUcY24BEcvBVErVcDdNCyY2gmXUVY7L66ciB7xzKa3K6npSOwXcTlGB/Q06ExhzLNMxtPenIZ+WXIwpDMSdRBZghd5MjneJujT84Z1MQdtQTychIsfiFmUngnQM9z+dloUOro1uW7w4fZo4bZlA56vzhsq3Nv7Uy05v3OOgC6jZexHIqvZAf+/a4GMHVPaq1TtwHbQwKj4emzWLgogl5Fw0TTYUxLGyNGSoB3bPHSVeOzkfDvG6q7bJmH8KeHENeAojeAUw52o9pNDkEJIyKEJeIdWn6Y9LOv48EjEdAK2kArvBkgUZS71oGA7OwDUkjYd67t2X7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LE0HEVXjnMCuBIKDFcIPfSUb/GiNK5c3dfSIkDvRdG0=;
 b=u5YkNkRA2OMixC3UqHzQIFcs6sf9VddhIvZZWB58rL838PSdgFDgY7bS7oGWUqaUvfEuNCSmTDwm2g5YiCEEI6MALC9l9ih89LDGs8Gp1Z47JfQMGIcr2nAIBocZpJkj0pPbHMaU5Cgr73Aug6lZ/7bagLIOEhKmZ6Woi0EI1UAcCjFqOVsXoGJv0TBG5Wi4vIOwa8pOoj8CQKJb3uafHtpWu4DFLp40L6z6TBFFGfPvaD9DuC1SXRMYcySjN41ydE8+lbpS4qXRflgaLyV4fHAmBzBHGtZ9OhDKyYbzccxEFyOhdgZz0LFOdrnr7UxqOP5E0hh85PcGPGxGyS+uxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 03:47:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 03:47:54 +0000
Date: Thu, 5 Sep 2024 22:47:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 10/43] drm/xe/irq: Convert register access to use xe_mmio
Message-ID: <7j6rqovkwqvkyj5z7pko7p7e7dpsjymffgele26veuyrwctl2p@yx65flepssfo>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-55-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240904002100.2023834-55-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0303.namprd04.prod.outlook.com
 (2603:10b6:303:82::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 2941d112-fb45-48e5-a49e-08dcce26b0a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Akvl0L81vWkOfXvcDcLz9QYdXafDrwMaJUTv7+0dfN1+IxG8GsnjHLdCl5G?=
 =?us-ascii?Q?zMsQj4ZYUjSbCSVsmdsZLPuCtvIMEK7ExRi2Byxkwt0MDbUSmspPqpfc11yE?=
 =?us-ascii?Q?QUCFh1tba9eYJIrxZzUB/thsCUK8YY57MT6RyL6MIj8/AiHcPruRhP16QHnr?=
 =?us-ascii?Q?TxGghKV8Hw7ocJYnlIAIBM/UvWL/U3aweHCl655eW3K31YkySuD2Y5WyCkUf?=
 =?us-ascii?Q?63cp0QLuu6RdNuxAe1zbIY3EQEvRsO5QVCcDx+pmaYNXsC2dcyh8h9EQV0Ll?=
 =?us-ascii?Q?aDpAX0/Oas5SvjYK/Cextfrjdej4Lsq/dZvSGOw25FXHe/cHB0W2fyOPRVvJ?=
 =?us-ascii?Q?K4cSS0I5EQYPsGD9QaasRb2NYZWnRu81vaLqFzbYrGUNRXwAYjz2xIY8IjIi?=
 =?us-ascii?Q?x/sLZ8OBqGgZGQOF7NJixLRbBY7/KiI0+zeny8vlk+d22z7e6AcVLK8brY5P?=
 =?us-ascii?Q?bMJszHtvpb9+IywLnLSKPGND859pQmc1jp3YSjSvBDuA35BYhN7bPIHZS9fw?=
 =?us-ascii?Q?OQqe9+/zqHh4n2WrqYecLu8wcDNbYrus2iB6PQ/1i8DUFm7vE6gUZ3QwfmkY?=
 =?us-ascii?Q?gPLb23jLgNqHm8u+ZO2xPCn8GO2QBwMIO/9TdI5J7gl42Ip8gbhN1PRbht1V?=
 =?us-ascii?Q?OmDxhIrHe2x24uqS/T0eff/+i/YFLDgpICOFd+8bSOiae0cB+PvxhY+YcFr/?=
 =?us-ascii?Q?/Pi6aIgYCPDy4/GlFYj/93WWK9iGXRydsdFasIYMrN25juLwHih+Fvk3k5U6?=
 =?us-ascii?Q?mAIsdlF1rbWIa6H6/8gaPVkR0ivJMCNdHlDVXc1G/cxBVb7MTrwgrVKspD6N?=
 =?us-ascii?Q?2DAPBYlhORJSaJVNS11Stievri4IRozctku01OVGvLaoKXWjntXr/Spjc9YN?=
 =?us-ascii?Q?vkRgSWhhyvELA13TYy48w5sTmJEVS3dqzi23NbzqrcOupYTCSP+0ydq4/o36?=
 =?us-ascii?Q?xOGAGzjwRwqVvfdHHvWs9N61uRtrDwVdq39bEBlKcr7G9dHiaBlZGV/I/EXi?=
 =?us-ascii?Q?urjCQr9dFwJulj37OrgzXqEfMHPhh3nCpVP/FA5U1RcIBuLuNNjh+fPcSmhK?=
 =?us-ascii?Q?i7Y7cbzQOQZDlit4ZP6eCqLW0lqt8Q1C8EBEXB/S4+Hc4qAJy4M0hQZycA2a?=
 =?us-ascii?Q?VhrZkZOf3UL3aTUYQWvNCPM6HuUckQGE8oOp07mj0C52iEemTXAXzxV/g1hc?=
 =?us-ascii?Q?o3nek1oPDHqzCwIvwGCEm4jZDtgcaiOPPYi8/SgLLC5HsdT9bRDVeOMn/Gy3?=
 =?us-ascii?Q?6kEef+11WIuakQrCMOG97+cWwjxkuI68ZacJobMFRrB73n99gdmXvRmNpILV?=
 =?us-ascii?Q?QRXaq8JszoG5gsQpiiww+/yMZEVrqSOjzRDhbqUwlBngZA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YJaAS6+rPP3Li27TFUy3d82fc83cAIsXQXkbU7uMHpmPx+z0osI03PnkBx5d?=
 =?us-ascii?Q?uvH4IJIywf5ZNRweJKezKtz13O30rGzlR1fIJmMYh0qRMCsTa64+Epm26Np4?=
 =?us-ascii?Q?z+18mPp85fuQK/vfy+sPvx0hIvDLJ+5lm7U634mjx+3DQ9Rny17zD8A4LnGx?=
 =?us-ascii?Q?O5hFUNwR4V+ZCHkDezkjO0SmCGld5+1D7jvdnVXtFw1ifUFEiDFB2m1NK4wH?=
 =?us-ascii?Q?X+zvDxP+zxuFl/Idaf7NlmHTs5tg4e5Yg1Yvjwqs9PCx/I0tyHJdaifmE+q/?=
 =?us-ascii?Q?/XANpQKEPsgyauId2O/T5zEIlYXCMaa4Pl7gIQLfBGCBIAX/t6nIr15cmh5M?=
 =?us-ascii?Q?5J0OqUEbk3ncx7jBy7Sj8GwBIrf/+LhrHmAPof+6NSqpEaukKxDSy6A3Ae9j?=
 =?us-ascii?Q?JSV7sHwx/z7KM7nicOAH2L7UpN1a33JeYMILMh5cF6edMeppWdQpzGhfV+Br?=
 =?us-ascii?Q?YOSczqwAC9CA6WrHV+zvs1a1YP8T0cSC7eBTVsbqVAVud0HNiL0kfUTbFkCD?=
 =?us-ascii?Q?eV4hHv3GlDd2hi4i0f3SRaVedfIiBxKvs9U1n11TpBLmqijIkCb3PSk3gf73?=
 =?us-ascii?Q?Yklw5mO/fYUq1gfKHAjhMStYP3tDavVJpm2MNmUGG2yqv0WQELHBoA8NuMYB?=
 =?us-ascii?Q?LTfS+Axsq5It2rCjWvpcC79OyxFvlC4qlso27XMzOzIKoT+vx2QNMBEP6NhI?=
 =?us-ascii?Q?rD4Riu69bN98fqwbOSjbXAvFdDk3AavAB1FAO9x1N9sQ6fWj9ib1pTZtIBVs?=
 =?us-ascii?Q?1ERTPa+q4INasqAhDuO+d5E8pZJOYxf5xikMWlPGd43i4+5gI0pyd+4uVyyw?=
 =?us-ascii?Q?L+/1h4qXH496zdUuMkrP/Rng+z00xCPTSbKf/N1IecVKSxa1f7+yW58ahEhh?=
 =?us-ascii?Q?iyb8Jkqz7tIOtJCNmwcPtMW5FTy2GKfZp2D9ss3psOdijz40SnXrxotdOtwl?=
 =?us-ascii?Q?MyGNkgdoPPeGFiXvDVFskvYLxwR5Q+KsjkPo1fLnEPWqZoCkFvGpSmnC1JCa?=
 =?us-ascii?Q?/M02ZMIJ39LipgYK+paQ7vR0p4HEs4jhmUYmD2wRVg+S7D3r3qfKLMuv6YHz?=
 =?us-ascii?Q?EVSrDUNaEA5S7ue/9AzoKzXr8Q9Y/lzWRoNfn9NRDtbUMOH9dXXI+lSV30Hb?=
 =?us-ascii?Q?9TBskan183Pa/YmQ+fV4tR0tY5SAoI1CydvAISF81AOJO5zao0jWyozODCDI?=
 =?us-ascii?Q?RJwTV9PsB76sHIIA6CuGrZ4DhK87zdyskheS6zHygihKa+1TVMYcw3q6v9Lz?=
 =?us-ascii?Q?eERJ/gsFnsrnFK3cvmGy2dBM3QjMDrKkWwu4Y4QRBR0eGHU+sQE2hOuoBTtG?=
 =?us-ascii?Q?KHNp0zjpIbdOBKU4WZKmcpu7047ppj7rDfDzrgU0hWR4PhsfqdNhyHZqg+JS?=
 =?us-ascii?Q?QbEYJnrXf+oWuXHXcLockJi8ssBDP9l8oOcfPL4MUJijbiJEtkCZ+4Jm0X4C?=
 =?us-ascii?Q?yzhpex92e62hU64iWWEIYtTeHag44KW6dEoNLIiB2j2jNFRedjq4XxSvnUFr?=
 =?us-ascii?Q?RsyrfSQj6oiM4WyF3NZjtGxGeEyStpx+LUP17I60/IYMhRJqNF5GlfuMq3w2?=
 =?us-ascii?Q?oZkbYVVmnWdjS5R1dO6FZIvgM9uyiAczrfkmeyqZ8tAsXI3Re3TzoH6TmeKt?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2941d112-fb45-48e5-a49e-08dcce26b0a5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 03:47:54.8324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S00LIutGb1Prr/Ox+tXow6vxwQ+uIK1uCKU+3FDALJCPX/eJ0S2Ki81u5AomglacOTk5oqBr52H2Gn0p8PSHRBLMFdznvbK+fsYDtKjKjbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7585
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

On Tue, Sep 03, 2024 at 05:21:11PM GMT, Matt Roper wrote:
>Stop using GT pointers for register access.  This misusage has been
>especially confusing in interrupt code because even though some of the
>interrupts are related to GTs (or engines within GTs), the interrupt
>registers themselves live outside the GT, in the sgunit.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
