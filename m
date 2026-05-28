Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2653CD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 17:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D52F10F4CC;
	Thu, 28 May 2026 17:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcvsWpRM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB5410F4CC
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 17:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779989646; x=1811525646;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OER+PT/KtC1DztgfIA9i5OeBpZIM5j6ehuaBaNdaoPc=;
 b=LcvsWpRMEZMJ09mTI3imRtJnuJRRIpuVJCq1uGHX/VTkassf06EbvCxX
 qg0JvBbqwnQ/8ju+J4ZWqd6+uuQ+RDpCQwkzHl9B5IxdZjElzwsagjr6F
 CxVuLct90NNCt6YfXORSo+Xrjf+kt8AUeePznzpQ2puSZ5wAUWK4TL3Gc
 nGnSpARSlpLPf8TSkCzwrJe6UqD+BZ9wWHaZPwxnI5HW6iMbKDH5CS9qx
 LUt1PSz37sxlpx70V26sU3lBUPU3OSjuDHapRpIKogyecMAHPQdzPwdQc
 cUQ8QGA5tTFVBV/YzqF0bZneISs/Icfhxhie9eOzfYSVWW6Qdmy3svris A==;
X-CSE-ConnectionGUID: TWKqQ4R/QWaQ2RWwBSeWow==
X-CSE-MsgGUID: xD8aYdjzSbisg2/xE6Pk7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="79871553"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="79871553"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 10:34:05 -0700
X-CSE-ConnectionGUID: Zl9jiF/hTJKE1xI4F47tiQ==
X-CSE-MsgGUID: q8xfu58/QouHNzf0P1F57g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="242708846"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 10:34:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 10:34:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 10:34:04 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 10:34:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUuplZJqPUcN1VzB8V/2X2+hR4Am77QOjWvF+XL26RFociGLn9H3H42W3Cqcd86cqCqKFII3DF4nnZvAIicC3uAmc07NvOsrXV3CVOqbfqn1uuRmq0wndstMvEGLdYFwx5kiv6uWInZeRbsrqvaKXTAtD/OZ5Q7TCr54bHnffzYb1hjafBjOym6nusINFzTmten7QrF7tRX26Ywe9vux5z6qnEyItjnVJt+flXPPdzX7X27uKOz5gkDc1UmBBw93LKIxSs8M3fSIa4gs0fjm4EV9KBoV9iUHYUAv2m58hhUZMG3BdI1jdh5P6BGeFAYKhnu0d2R++Uw1/+2mGwUJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EN8rbkphSEh19r4NBSMoYZPF5oegluo2rgbr/l6GTt0=;
 b=dTQb/miIBz5gkATA91i4horCtfriLpVfDsIpDkvIEjZFdZNcw5crA0ycP7OYsUxALookUmYzGLsq3qXqdqsrAf8fMWR+ZYL1QhAR/ytx/wyy1YtQ1wuaFpP/R0qlHNQACEf5YDtfoCaz21FSrncmuczRL8MiUSOCsMknOy+7Pzs8GUbpGQbAZIkN/Xn6ItzSpoCImzDBfFy/1rlCXrpetIKKEmZ+j3138QUvLs2OZgCu9/ayT1Cv44o1qsJ2aaAsYgiP7m3eRMKKy06va5YMoYGpqwqynG+acEHFucw2Viw8B4cqL5+/zeQKv1rnXuTyHHKHeBEMFuYEHcQvRyNnYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MW5PR11MB5931.namprd11.prod.outlook.com (2603:10b6:303:198::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 17:34:01 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%4]) with mapi id 15.21.0048.016; Thu, 28 May 2026
 17:34:01 +0000
Date: Thu, 28 May 2026 19:33:53 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v3 4/5] drm/xe: Rename EXEC_MODE_LR to EXEC_MODE_FAULT in
 hw engine group
Message-ID: <ahh8gb_uEO2_W7kv@fdugast-desk>
References: <20260525133051.91636-1-thomas.hellstrom@linux.intel.com>
 <20260525133051.91636-5-thomas.hellstrom@linux.intel.com>
 <ahh2Hvx0xBydhBJ4@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahh2Hvx0xBydhBJ4@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0156.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MW5PR11MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b7b553-6ae4-42d9-a488-08debcdf4e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|11063799006|5023799004|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: p2UjQbwrO9fo7RIYJuX7GqeYq+Kn2s8nWGUC7x7NirJz8+1NNpjWoAzRfcxSL/L5vqUgAOlhCZBUp0+4LHazuBLf2aZVV9uoamqpmPl9yGUkGaIvPVhb6ZKzesqCuyfwjRbpkA7OupSyjnDPMTSlp59h1ztSk3lr1YS8qOp23U5zkM7gQOEYgPlZlOb2TX0VUkvAZPt9F+09z5wNSlth210jLHfnOBFXPAmK8os5V2WrshahRmLTBdCqXZiVieE47O8dz9UiK+N+hbN0rSIfovGyQPsdDjwERJu9oC2DMnZoqPuB9a9N+5Nlyxdgx3dD/bAuW5EuP+ReHVJAEPa7bbsuMU9SoYYRNxiJy7XikUIKRoEyLK5oQbNoFF0EhJ14GrGrmOS0JekgjxWylLXDEhWZb7VZixfCTrSoK9l+ehYhL5LgbC0mC1I97Ip8VzzsENjnurmnTaXYkM5R3QbdfFI98NoOEoKYmE2rNiy+sPjvzbUomWLHaHQCDAYO69csCkxOCinyK4o14zTc0ENRTMmA448FbIZd49lmv8yXNKBfiaF5+C1uz2Qv+BsgY0seyjMoZ7qsEVfT8qjCBQQQQSimp3BfdaVVQEcyU2Fs8pbAsqOOib4/2g9eYkaoq2jXUJ6C4gaz070GUJgqy0UyypM2otIE5ibBdk0zs1JmhnMrWE/qoJblcGNM6017AuEq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?t9pIFfItiVPkbGoq0rlzajX9YlA3viBNFm7ksl8vXwENjZwjAaqGiUPsbR?=
 =?iso-8859-1?Q?G4/ZimN815m3q0MeD08zGlBvGCihD2mWcxCk9tr+HkubKQ6a0/Y956mxZR?=
 =?iso-8859-1?Q?+MLisVJjpnz7QUsATUAJmfJku8IEz+qdb0Cj35/YZgyye/6+fvPanvG6wb?=
 =?iso-8859-1?Q?z54GeXdJBMt32WuAsTrL2BZgRm13dAnARe+GkH23AdMvbEkYCOZXHEyxzw?=
 =?iso-8859-1?Q?NkSOMU4YIv2q1VBpjAHdb9cN1xcRwkakaKTWwnicHJq9zJ7D7le0kol/K8?=
 =?iso-8859-1?Q?X9q0R5X5FOXOm7c5yFsfLZ2Fy9LiGxuBN6Riy/5f4wlXr7HHExe3evv1z/?=
 =?iso-8859-1?Q?E3tg/xWjbM05l7TMb4O6aX+vnAi38WInZWlPSwdq/194vJ1GuXND4NvTUU?=
 =?iso-8859-1?Q?xF0Q3lCj+QlxmA9zgCjlDHn4yEkOvmY+9naJ3dgrbBRvrK5WUp6yQ+Jseu?=
 =?iso-8859-1?Q?uz/2pG7oJ+5rIl/R/TIXRjpDPyM1thg2aZzRD8SoZXnVau4jprwYROOGGT?=
 =?iso-8859-1?Q?CmaB9RcWveJXkyZNkG4Z7OROAl328muiCYBH1QaiYIdtGQawd1HhOZ1eO3?=
 =?iso-8859-1?Q?93L+OIeQyIMOXVgvnAuutGZ7FZZ/toNaCqRa0HKfjfzBjPWtnUoSQQHZnz?=
 =?iso-8859-1?Q?5dyMGWol737D6lT0pb7GqRBjIW1vUQYWbla8txQEoPb/5NuqOK/TYMpj4P?=
 =?iso-8859-1?Q?n08om4rS4T9JQzm4T921v1ws82ggDbiNqmUbJvv1qilSZVGmlUnrDHJab6?=
 =?iso-8859-1?Q?UhHcGgLAQ5qPW2Nvt5whpWAizbNnZVK9Lf/KQs4zkIsJm/QiLksj3y+iRS?=
 =?iso-8859-1?Q?mbvfgugrikhDdxkWocRsVA+7pTKC7BPiE9tmvL03ruyXtEQf797RvULzbW?=
 =?iso-8859-1?Q?20IPm2QKKCudvWeBV5vZXmyIbzqxoNdK9MA8Gdh12iEeqCUWkywpeiEPHd?=
 =?iso-8859-1?Q?cDdi51u71M6cwGrK7KaaOUb7PRXWZeGHLAD4txcO0+ht6gZx7X9ibJgAlV?=
 =?iso-8859-1?Q?35tTXE+YcKu3sRQjuqAZhqcMa7B1akHTX9FNzCOhq0nEHcqbpK9/DwJ+PI?=
 =?iso-8859-1?Q?f7UCDICGcEzsjgrC54NKmrPGAqs5uYe7JHhCS5MJJjvCbU044+TBAZLcAW?=
 =?iso-8859-1?Q?Yed272Xi4pwLla0DIlbJkbMR2mAP0/LcksOjsWa67whgcPjT6i9aOcC3mQ?=
 =?iso-8859-1?Q?DV7qe/u5ttuZpG9CGmUg+33NKyvmC3Nvw80of7G/qaolw490PChmRNKZG1?=
 =?iso-8859-1?Q?/GAgn+hMca0XdhFyhrD6YRpY97T2KKK0gDeStYxemfRITDU2QZLk7k1TRu?=
 =?iso-8859-1?Q?qfGKsraUgJnzpfrpLXnttuyl7JgZhnensunT2BctAROIjhOek0VM0KqQtL?=
 =?iso-8859-1?Q?onej+WcWqlREuqtxyJV7rCpxxj+mY62eiE6WQq09ZgKFq5Sd8YAZrfqou/?=
 =?iso-8859-1?Q?4k0cAKGQebAGsvX6xx2+4FaNOQro/rfyGR9KmYVcWQX5J+PuzfhBv4XKoQ?=
 =?iso-8859-1?Q?Z6WAZuUXE/mHxbbHGTmLD/QcEy2A9glORNAhkOGEP6KnoLfGZEae1x7cTm?=
 =?iso-8859-1?Q?RAqIMrAY+hxJblWJb8RY9dTJAdlKqCrBNL0Dq8IWxfl5eDz6FCCuR4Yf+O?=
 =?iso-8859-1?Q?6swJo0V5S12iCvTHT0Skrl3TOUmpycCuEyYTi2F+8ApqJGddQrOEVaCnwe?=
 =?iso-8859-1?Q?WVKprKuS3Kzwwx49LxU9pvZ+6dq9LreMTWo5qMApDsMuqLHGO6nUeEmKJY?=
 =?iso-8859-1?Q?l8/8JNjifmUORzi68nh/K/4SgxtUEWqUqVj+WHgjYyfCdR0WkmZZDxWXk+?=
 =?iso-8859-1?Q?4reY7QrM9cUVmPMnXu0946BerPrNsxA=3D?=
X-Exchange-RoutingPolicyChecked: KxHKfAHUhQ+in08+JXsD0s+X9b7Q8J/knEjqs1UUoUNIXkmne1gPoylaOXSPlUNgJLS6FCcLlD3bDPunhnwPoGbHqByL6KmIYnV+HAoMgy42UfuDHdCcSojgpcdZcI6X2DkjeHOJoebV7jDuUDcZazpjblwL0mw5+Dw0TyQsjBi/thsyQOiSR/BRGtBiQM/Go351ssbFozlGu09aYAl6usw45hw2ifhoJ3gKva4n9hOY9IqMlznEYaqMqJDDSolZg4OeVUun2EiMJNi/kmUGTWjz8xx5R9cT7uv3n6XljscJBKcbGiHWmNxnRy7779sVWCU0uXU9AlA9G/125p3Wfw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b7b553-6ae4-42d9-a488-08debcdf4e5e
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 17:34:01.3018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Poh4ed7z4yTj33AJ5yz4Uv/vymCzocN2CyRkTj5Frnriix0M8hDTxZAe60seOdqjfodsXos/lrC41djcgAf5glM2QubfIY7lzZxxNyDIWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
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

On Thu, May 28, 2026 at 01:06:38PM -0400, Rodrigo Vivi wrote:
> On Mon, May 25, 2026 at 03:30:50PM +0200, Thomas Hellström wrote:
> > The execution mode tracked by xe_hw_engine_group_execution_mode
> > describes whether the hw engine group is currently executing jobs
> > in fault mode (long-running, fault-capable) or in DMA fence mode.
> > The EXEC_MODE_LR label was misleading since not all LR queues use
> > fault mode; rename it to EXEC_MODE_FAULT for clarity.
> > 
> > No functional change.
> > 
> > Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec.c                  |  2 +-
> >  drivers/gpu/drm/xe/xe_hw_engine_group.c       | 10 +++++-----
> >  drivers/gpu/drm/xe/xe_hw_engine_group_types.h |  4 ++--
> >  3 files changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index e05dabfcd43c..15ad0fee906c 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -342,7 +342,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  		spin_unlock(&xe->ttm.lru_lock);
> >  	}
> >  
> > -	if (mode == EXEC_MODE_LR)
> > +	if (mode == EXEC_MODE_FAULT)
> >  		xe_hw_engine_group_resume_faulting_lr_jobs(group);
> >  
> >  err_repin:
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > index 791be6edd0a4..fba0ed039bad 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > @@ -22,12 +22,12 @@ hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
> >  	int err;
> >  	enum xe_hw_engine_group_execution_mode previous_mode;
> >  
> > -	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR, &previous_mode,
> > +	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_FAULT, &previous_mode,
> >  					  NULL, 0);
> >  	if (err)
> >  		return;
> >  
> > -	if (previous_mode == EXEC_MODE_LR)
> > +	if (previous_mode == EXEC_MODE_FAULT)
> >  		goto put;
> >  
> >  	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> > @@ -292,13 +292,13 @@ static int switch_mode(struct xe_hw_engine_group *group, bool has_deps)
> >  	lockdep_assert_held_write(&group->mode_sem);
> >  
> >  	switch (group->cur_mode) {
> > -	case EXEC_MODE_LR:
> > +	case EXEC_MODE_FAULT:
> >  		new_mode = EXEC_MODE_DMA_FENCE;
> >  		err = xe_hw_engine_group_suspend_faulting_lr_jobs(group,
> >  								  has_deps);
> 
> should we also rename this function?

I think we should, together with other occurrences of "lr" in this file.

Francois

> 
> 
> anyway, for this patch:
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> >  		break;
> >  	case EXEC_MODE_DMA_FENCE:
> > -		new_mode = EXEC_MODE_LR;
> > +		new_mode = EXEC_MODE_FAULT;
> >  		err = xe_hw_engine_group_wait_for_dma_fence_jobs(group);
> >  		break;
> >  	}
> > @@ -395,7 +395,7 @@ enum xe_hw_engine_group_execution_mode
> >  xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q)
> >  {
> >  	if (xe_vm_in_fault_mode(q->vm))
> > -		return EXEC_MODE_LR;
> > +		return EXEC_MODE_FAULT;
> >  	else
> >  		return EXEC_MODE_DMA_FENCE;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group_types.h b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> > index 92b6e0712c03..b4c41de6ba5f 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> > @@ -14,11 +14,11 @@
> >   * enum xe_hw_engine_group_execution_mode - possible execution modes of a hw
> >   * engine group
> >   *
> > - * @EXEC_MODE_LR: execution in long-running mode
> > + * @EXEC_MODE_FAULT: execution in fault mode (long-running, fault-capable)
> >   * @EXEC_MODE_DMA_FENCE: execution in dma fence mode
> >   */
> >  enum xe_hw_engine_group_execution_mode {
> > -	EXEC_MODE_LR,
> > +	EXEC_MODE_FAULT,
> >  	EXEC_MODE_DMA_FENCE,
> >  };
> >  
> > -- 
> > 2.54.0
> > 
