Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7895CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 19:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F14810E0A0;
	Wed, 27 Aug 2025 19:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oCCGDIhd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B2610E0A0
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 19:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756321819; x=1787857819;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kcXCKCLqlzuz/dlQ5q525bs0k/LPp/h6WLUeHfW8URw=;
 b=oCCGDIhdjXNZHo8TOfmhKKtf5s3JLB3P08tQbDmAw4AjAVib2sryQFDB
 z0Hok8UFRDOkfvqTTeNlWej1Sf+eUIpU6FmlehB6+OHt6e+tHTJaBjGGj
 JRYmX2C4K1PSK83WAKI5PcIka+/l5OEHHMF7Kc2MwGc0L2jtdLG1+FQcL
 pud+HMlNbSWPf2ih/bnAKBTy1IFyYHf+skPZvvXxe7y+XscfkH9bNxHvT
 E3cf4+OsH2yuRAc2CrqYVQ7QtCLFXIORoGyNVmozpcqEZqkgyYf3uAOOr
 zpXc5RpSfv5UqRX//s+EJJ+cLKF8KLiLGdwbNiaJOZ5DKgNX9Ybp64vP2 A==;
X-CSE-ConnectionGUID: Fobzt/8oThGi2Z1DNZ4h8A==
X-CSE-MsgGUID: 2qJQNybiQ8qSY5/UMI33+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="57782534"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="57782534"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:10:19 -0700
X-CSE-ConnectionGUID: MPwj8i14R8GN0s04+RCJ+Q==
X-CSE-MsgGUID: 7vkNdEN+Q26DWBAgoR7ejw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="174088721"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:10:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 12:10:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 12:10:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.68)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 12:10:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTtrl2eYFlzbgq5yPIB7zLI6dZV8f9Y6rFReXDzdF+KvaZiGpHOEy/4jEQdasllYynSzKVzL0fuHhFFMrBgSrK1pYUn5lVH2blq+VnSuXydfuKo83Z2ATlYxCFgyNzdUF6KZJWbGrn8BIpQzfyoXJQLndXuUjSvKYMWmk2ODEIF+4oWBDJl5UYXYqFuZQmfuH93TpPF1hmGOU0deyC1rvXi547cu2zluHJ2ZzucERE0U2/q6BbZ3jMPYF1UthrbtmBtXQ7SpXl+FfMFHakfLPz2PBbNRg8bkeEom4q8BYcf+UnRXbt9Vjel+9CCHFrX2vg7F9iYfphBTFG88lycwMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcHqXQ8U2DwBStgyvYKnIGdkfkp4OnZbPsm4SWR5ulw=;
 b=YHgIFri/mSvGr+XouSLKli6qaBAH66zSsAXwuclBbPib5nd5yBEdyNHH/Mlk74Iq7+gKS+1QmOeCG6t7zDRKdnYBX2SxATq40K5NezS9UAGlNDNXa5rykj2AmagpGHKpyYFajHilqdmF+BeCam8xXXVPVv+ExOU5Xh+aqlXU33lvVe24iIGy5Sns/7EXV3vNKbE788x0JtooDHzMPJuVHLnpuHuul0vEWM4VBKJ0SidvSFZhRRb53zmEzkMl99EY6jfovaI84kNm8jmCSoiILrFKjA/mv7OO0mSrVo+yEw/8G0OmcXSRa6voPz0XrcjQnro8tKrEi5/OlbBR9WqE0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB7005.namprd11.prod.outlook.com (2603:10b6:303:22e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 19:10:16 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 19:10:16 +0000
Date: Wed, 27 Aug 2025 12:10:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/3] drm/xe/guc: Track pending-enable source in
 submission state
Message-ID: <aK9YFYaTHiOhK69o@lstrano-desk.jf.intel.com>
References: <20250818172243.2649863-1-matthew.brost@intel.com>
 <20250818172243.2649863-3-matthew.brost@intel.com>
 <8295cb2d-ded1-4a00-837a-e89d1c3bdf89@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8295cb2d-ded1-4a00-837a-e89d1c3bdf89@intel.com>
X-ClientProxiedBy: BYAPR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::17) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c0f2aa3-4d38-4d75-de5f-08dde59d5b6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5dXHIW1Y/3lLvlSqVKgU7EaqaS1E8Mkyjd8GSlO2P6GGgn6nN6D+7XuSoVQX?=
 =?us-ascii?Q?6VQWVaWbe2AUGBFYv94ENmkuAkig9SFJHNwOTOf0JGJjQCkJ+x5pyCDfyUVr?=
 =?us-ascii?Q?Vnk+SsalIZ7R8jFSZhmuK2/L9iEVGsebre2ZaYzw4e12bNdwEE150ziKoqPT?=
 =?us-ascii?Q?uiLl6TjwdVPvUA3Utr4jjNsc7i4Z8PqgT5+LlKZ0U6oID3ZG1S+LZ1Mk/gSk?=
 =?us-ascii?Q?MZvcwAVU6ZSuIK3j/RzBWoH4Kj0rdF3ZEq87kPuP7n9Flov+e63/NMc+yS/z?=
 =?us-ascii?Q?PMhGxGctfY8TcKfr5glR1yw2PtRWC+iqy5sMecNZRuZBLX/8I1kKGFkQQ8FZ?=
 =?us-ascii?Q?pi/2kdAnPNiB1ahTks9B2P9sJSAWiUH1YgQ3smg3zq/7Y7x4h8ZRznH0zbC8?=
 =?us-ascii?Q?VpHT8AiMKhX8zE9sZlVvJD6r5ssaHvBGVxWVt+0b/dix4TL5homuKth7E0Z1?=
 =?us-ascii?Q?HR8ZKTahpXt630O1IxmTRB9DbTNlUY6IFaFxxRdF2JNFnEYi8ufRHAblycDq?=
 =?us-ascii?Q?nyw8E8LTqTuyO9sIberoxMqkYEcRktqqB13MJCYP95ybjF7U3Idw2ygyTbpN?=
 =?us-ascii?Q?nPThb76ih0BFM77IfOVGfKOFLWo7Ry7ruxLNkibYxVSNIh9xVAfz+SQ8TeUa?=
 =?us-ascii?Q?MZ6uHXaKsin420Ne0fAUBi7K3E5TQx46zj41nIR4l9yICGWaf7wPG5ZjWoCE?=
 =?us-ascii?Q?GoDPBrnq0RvmRh5JJX0TbzhTLDEbuKr0E3tYNiQ3rmP/RdTUNd6vbdqYmF+Q?=
 =?us-ascii?Q?BkCEX/kz+LjuRiauOYot4gLi570wNiXh5bhQKHma/uzfUPX6+RClxx7M3wnS?=
 =?us-ascii?Q?nJuI2TziiRnIDQKsWudKoSqsRVe/kC4Tiyg3u4w9qDs01sleNlVz+cbOcdcv?=
 =?us-ascii?Q?v5QLW021IrdrQNgwL4daQK8/KNEkYGLzPVJ0eaG49BNQ2wjUgK/MXb7fCY0W?=
 =?us-ascii?Q?zefg7T+Ck2CKsv1vhNurP2HRH2HgLHWKBp2EUdE3n5UpEXYVjSo2hAz+eAKT?=
 =?us-ascii?Q?lWP9WyRq5jaLEP32s5sAlq4sd95iWjea9e8licz9tDTDH1xTJw1TpHZj8KrH?=
 =?us-ascii?Q?MVkTNGhDX40H/weQPOZH1dJypeN32HxAdQ+ybidw4by3lg4mX+TeNlkrjn20?=
 =?us-ascii?Q?I9Sg1+p9iXmyw2Gl+toIzOqo/6hqdbdi5kDN8qkmLn9y2B75DG9jZVVWBO+b?=
 =?us-ascii?Q?0gUb/jLnDcCpJ57APrwr5ZYFcf3IvbIYT6qxVgQBe/YcV16vS6TxQXVtxUAZ?=
 =?us-ascii?Q?FtfzItWd+R+UJIuhUhYAeJsaU/nXsSQBq8seIMP01xAPzaY5IqmpNJJxG49N?=
 =?us-ascii?Q?iGuD7SdaNb7OTWmF7dqS3WwjSSwbt1IZN6Cp2OGZ+mZOpFwL6YXO3mc+YG+g?=
 =?us-ascii?Q?JGlXomUaVV/RU4yyrJOtcXFgPTPBMt8ivlt6h335PZ62iCp1nuJ/X+CzDGzX?=
 =?us-ascii?Q?vZpha2UFa44=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bGx7zbhb8FpoRt3Q/QLrkbGEG9W4vw1JmBKOC0GiB90t1kWa6k0budP7hh7u?=
 =?us-ascii?Q?QJ1BDPhe8+m2o7ZmGr+1tC9hI7NDOLGG6qpZ+2XCvYd3rg7u2kR1yrbnLwJ2?=
 =?us-ascii?Q?NPBzlyaC82ji4Wwnc462TY3lQl1Idm7W5t9nxsgXIu0vSXjubTL3FbpHj4t8?=
 =?us-ascii?Q?5dS7eGol7ZEf6A/Fpy5zz6IdBuBdPbnKnrRA7664KJZuj2iinSyazHg9f/Nx?=
 =?us-ascii?Q?5mO2JKoRqMjXefEyYiUt8D45z9KYuIPSMCs/LoyuPXQxxtzHPAidr7XAAkdn?=
 =?us-ascii?Q?9Bkg//VPPspZFjnF3ZW9qP+jXB16KyNMbJlxp959He93dm83VpCzKJ3B4ZYJ?=
 =?us-ascii?Q?uDG0Fz1zdbOenAr1NPqJhgbnxA+MleXe+pvkANs/6xY3E48ZK/vhrnVT17tb?=
 =?us-ascii?Q?6Vv0uCDdIpXV3Se15rLfCqPCawq8QQnBgSLk03C8jBl/EZdy/xTskATRgIyE?=
 =?us-ascii?Q?Iy9NUWMIwO/32W6ESdwulg7jLmdyfBJZe0J6zKfgnrtgdI5FOdahTTdwFk3e?=
 =?us-ascii?Q?/CgFnLTerw61EppURgQovkLc/tQXNzTccsViv239H2N7OWeH/ihmzTiTKUO7?=
 =?us-ascii?Q?tBnp5r32FVkhvDnY4DHejpnsICKuamaw0lm0ZaBwzcWlghboYAuhe8jlYleY?=
 =?us-ascii?Q?//aNsKM9yzZHIc6fXv42iMhNZx7mWnoapZmquNtwWlRR6EHUvH2vXPNxwUUC?=
 =?us-ascii?Q?pUwIk9VlrIf99OHMEpoFJEHptYL6h4PLciAeaWCoEn60i+mvQLytskrP0uIk?=
 =?us-ascii?Q?rrrjY8KHYf+vtu1vDhIKyznnVPvE9ljiBsYpoT338CvpseMhYz811vS0M1eY?=
 =?us-ascii?Q?78jL3J7uOac12JpzX+gxx6hORzu5oOBHLzJV5UgwegCD7MclDD9SYOaVMckg?=
 =?us-ascii?Q?JJXfwFF6hqGYidAidweS9qjNme4wTFEKcVltcl97ukP/X43rELByU5lpK91c?=
 =?us-ascii?Q?pSG01QbbqI0iY70ASfTm6TWL3FVDPOr80TZ9I/yJE42w3mR0edp85vNjHpwl?=
 =?us-ascii?Q?4Xdop7Hx456zCZcf0R03wGkM8JV+flzvYAWBzsKF5y+AxKtp4Rtbk1AIE1hP?=
 =?us-ascii?Q?C3nkMNDxbm9hDeesKZWUSfQBHTc1+iO3hpwg6mthwOJtR/aRqeF0DLwv2ocN?=
 =?us-ascii?Q?/w7jV01PLoiK/Vtgj+Z9HeEPMY+K+C0rPSLPsGCTjq7b1qBn9/XRfIuLS+r8?=
 =?us-ascii?Q?FntkLRXpKttQ2FVVJP9P81rPrVA7i2jDqK/8o25/xWrTxmLXe4OG/96oDuvF?=
 =?us-ascii?Q?3J2XjnvjUVfxfoExQXL7R2OJc6NUbXUKgvbfCPuiA8rCUsz1HH1dyY0Bn2Jm?=
 =?us-ascii?Q?NO1pFg8LkeorNbkz6fLGp4No+3f1qv1vaGeM/Vj1G5ShGvKBKNJJGdZN+Jhb?=
 =?us-ascii?Q?46/RfG8puLTRYw2bp7SHhotvj3v0uJCLCdn4A1PL92831xvE303xMHnS8+QN?=
 =?us-ascii?Q?o0LQhmoYzfWvqUQzqvzHBoSWbmpJkVwKbZ1enWi7YcgvNgDUpYNMJne/CtyX?=
 =?us-ascii?Q?ok3f0amC1j2heS25et4YbuJT1TVpp26HcAjWDjoOEr2sU2duwjBBHof1q49/?=
 =?us-ascii?Q?gEl9sZz+9HTd8yNrR9MEv5b810MDxaXu9/DlBvRAVD5Vjm59Il695coY3M+B?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0f2aa3-4d38-4d75-de5f-08dde59d5b6e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 19:10:16.6030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZ4u4AOKPf/81rn9YgsbWgg9zDPJEfndUVEfUxjnlmCkKmbUucanjYMpiAdJE0vqTTMtlloaXCNq7CneFKAraw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7005
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

On Wed, Aug 27, 2025 at 03:56:59PM +0200, Lis, Tomasz wrote:
> 
> On 8/18/2025 7:22 PM, Matthew Brost wrote:
> > Add explicit tracking in the GuC submission state to record the source
> > of a pending enable (TDR vs. resume path vs. submission). Disambiguating
> > the origin lets the GuC submission state machine apply the correct
> > recovery/replay behavior.
> > 
> > This helps VF resume:
> VF restore

Yes.

> >   when the device comes back, the state machine knows
> > whether the pending enable stems from timeout recovery, from a resume
> VF post-migration recovery

No, resume is done a per queue thing. Resume can be triggered from
preempt fence resume worker or page fault resume worker. It is about
toggling the queues runnable state to enabled so it can be switched back
on the hardware.

> > sequence, or submission and can gate sequencing and fixups accordingly.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 36 ++++++++++++++++++++++++++++++
> >   1 file changed, 36 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 1185b23b1384..9e4118126ef9 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -68,6 +68,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> >   #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> >   #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> >   #define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
> > +#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
> 
> you meant RESTORE. But restore is mostly done by PF side, small part remains
> 
> when we reach raising this flag, so that is not the best name either..
> 
> VF_FIXUPS? VF_RECOVERY? GGTT_FIXUPS?
> 
> Maybe VF_FIXUPS is the best for this context, as fixups will be applied both
> 
> for migration recovery and for VF PM resume. GGTT_FIXUPS is longer and
> 
> will likely not match future platforms, where other fixups will likely be
> 
> required (we already have compression metadata restore, and the future
> 
> looks like more are coming).
> 

See above. This has nothing to do VFs or PFs, it is an internal
submission thing for LR queues.

Matt

> -Tomasz
> 
> > +#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
> >   static bool exec_queue_registered(struct xe_exec_queue *q)
> >   {
> > @@ -219,6 +221,36 @@ static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
> >   	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> >   }
> > +static bool __maybe_unused exec_queue_pending_resume(struct xe_exec_queue *q)
> > +{
> > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
> > +}
> > +
> > +static void set_exec_queue_pending_resume(struct xe_exec_queue *q)
> > +{
> > +	atomic_or(EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
> > +}
> > +
> > +static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
> > +{
> > +	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
> > +}
> > +
> > +static bool __maybe_unused exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> > +{
> > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
> > +}
> > +
> > +static void set_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> > +{
> > +	atomic_or(EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
> > +}
> > +
> > +static void clear_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> > +{
> > +	atomic_and(~EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
> > +}
> > +
> >   static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> >   {
> >   	return (atomic_read(&q->guc->state) &
> > @@ -1344,6 +1376,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   	return DRM_GPU_SCHED_STAT_RESET;
> >   sched_enable:
> > +	set_exec_queue_pending_tdr_exit(q);
> >   	enable_scheduling(q);
> >   rearm:
> >   	/*
> > @@ -1494,6 +1527,7 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
> >   		clear_exec_queue_suspended(q);
> >   		if (!exec_queue_enabled(q)) {
> >   			q->guc->resume_time = RESUME_PENDING;
> > +			set_exec_queue_pending_resume(q);
> >   			enable_scheduling(q);
> >   		}
> >   	} else {
> > @@ -2065,6 +2099,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> >   		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_enable(q));
> >   		q->guc->resume_time = ktime_get();
> > +		clear_exec_queue_pending_resume(q);
> > +		clear_exec_queue_pending_tdr_exit(q);
> >   		clear_exec_queue_pending_enable(q);
> >   		smp_wmb();
> >   		wake_up_all(&guc->ct.wq);
