Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F0FC71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 17:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7090910E06D;
	Tue, 17 Jun 2025 17:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBtoxmr/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EAF10E06D
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 17:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750181316; x=1781717316;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8mlFHDl07xOERCTy+OFR88IRHmqRlwmUS/lmqNI1CQc=;
 b=NBtoxmr/eAHDbK/kLoEZmkq3KTLrjRqjpErqGFDGbqwqNV7vfRX4MnXc
 ktA5X7EISgp8aHoTmoP24TRhIKiZXLvxUN9nFAXZpxV+wbIFBp3281czt
 veka4M2eSsnTzBegeNtcmsyNtyFkTlkrZHHPQXe++1e2JKPxB3TNXvGjY
 0MxXvM/eZFqiKnIUoUvGKkfyiniiKdLVRkjtCY/+byszxAucPOXBt/3hW
 x6BmGKAZFGJO8PpF0DrosnE+Otmn7AYkDdHxU3pF51XOXNgeZaJP3Hags
 hBaX75lXTJfY4diFRe+VobP8mXGSZXuKqAqJQ7dXdhVvQ06uwvRIuGJHG Q==;
X-CSE-ConnectionGUID: FGZZ5HEYRi2UT4lWAS5GoQ==
X-CSE-MsgGUID: zNhjbnfJSpaySu0EjfmWMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63408144"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="63408144"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:28:35 -0700
X-CSE-ConnectionGUID: Z+CJNbGOStCNVkCW2gZXEA==
X-CSE-MsgGUID: ao0dfpIETT6BX5BIrgRqiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="149360533"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:28:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 10:28:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 10:28:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.59)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 10:28:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxv1GMFwDTKT9t2xjUmGSaPCQC2MaimWvRIR23k54x25NyM/OH7P00iWNUPNXo8X0hdEm4/6meQ+xk3e9+NZEzw0coL45h+lpFalNgR/m3WEC9FO85fEbIV+CjuUWOMD6T17gzGbbqeKNnE13gQCVl4U3Jd0L39rEBSVMKkB4J2ouHwMfVci0gcHm27bCPB4im6I3/T1Y3hRVBuQiLUWRUUtib+AchWLGnCk5JfARL9j5RGAGZ/gV2wiZdvxkttfoDJqQiFtIr020M6fS71cm5gdIzGC17OCFcWLWKPlSIbPFZ525+VX1ilM2AceJAq7gS6qtojERVFZ90wTuZJnZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAQDrzBptdcBmUFDSdUPSkuHQELSaz+19chxC7e1sSs=;
 b=R91yIuLYC4MydkMmKwljhdT2Kn0MW+rQ1hBZf/sgZ53uY+Elh4c3kVl38LGKnJ5GOv3m4S6BHFtrlXLqwrueBE2h7zq7DA/Ior5OGaHjxr/uMbCiMqMxad4JEe9hsqkSCAaFI6I0k9I7ZIzZ0GEOY+oWXQn6PbcNa0CpSf8RB8svn085rNmr/pCbejLMKVPhDy9/ranozUmEu6JZwLhXT2oR7R835oBMLPy4WC/bZzWop2dLITAK60Nr8g4hK2LzRi7tswA9/Dn/ZZrYPoyXgEslFLFCV+PkFgAijuvQD5ZS1YfrhybloKNAMR0ZOUDF808iHnvaDmzaCOurbX1x5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY5PR11MB6305.namprd11.prod.outlook.com (2603:10b6:930:23::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Tue, 17 Jun
 2025 17:28:32 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 17:28:32 +0000
Date: Tue, 17 Jun 2025 10:30:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH 0/6] Use DRM scheduler for delayed GT TLB invalidations
Message-ID: <aFGmIO0VLFBcpmmy@lstrano-desk.jf.intel.com>
References: <20250617153730.2136174-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250617153730.2136174-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW4P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::31) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY5PR11MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: ba34070b-bed1-487a-5dbb-08ddadc4618a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2yJyXgl2hTdnpl7PLRjW9CsqvZq4YG+HRGLVeBPxhVZrClHQF8oHN5/Ka9ff?=
 =?us-ascii?Q?kp6PaMOofH9pHTKAdzGkGVCNPC5boVzGlJul5whA3cObhTgjQahpR5GeQZTG?=
 =?us-ascii?Q?UhDzCH41r+k18DoWmmn7+5K5U5fdLAtLewJBDvW0YpctF39BhgAxThycYbCO?=
 =?us-ascii?Q?yDf+6sE20Sl9G9GgKsOYfymc7VtUQ1SfHqewFHz/rLuN73lJjm6BFBx88QEG?=
 =?us-ascii?Q?/Y8qOGbBcBtpxUsijWtdwNvtdUzkJrtC+boOWLN1esQrMPcFEweVuVBJFHZ+?=
 =?us-ascii?Q?SUEgYD0h0LSrJr3LxIezZGvCoOsrEN4tKMuYu2teYrOpK+9jfp5BkGQyr/nz?=
 =?us-ascii?Q?8QaiDpfkA2FZFRhE7nHoNiQZs+BPSmXVK21qAkQf2u8ntNZ7zKp61SLf22ca?=
 =?us-ascii?Q?nKPYTAqCq7EiDsEiUj0gAc5tbCyK6TY0xYbP/xBinmNgDhVLh/Jk5NOW5wfl?=
 =?us-ascii?Q?lPy/8r7bilupB7xk7xlcyNYBftS5NRSKoRXbEA8BuSIulZ4jvuzZXBie/dzl?=
 =?us-ascii?Q?ljoiJYm/ASyAjxj9jH4OCeYiBkzmgcWpiC6DysI0JMleQMVJz+9hEM9LZOHI?=
 =?us-ascii?Q?6c33Ez7ELlUe1t40v8ukNk3EAeAOrP5XsfO4Zph6mFfp1hgx/RRtQUbmtI0P?=
 =?us-ascii?Q?R1m/MeWu8WmB2u7XobEDTwb8x75uP27VDWhEvD5ijzYbrIIZPlOS0mUmubzD?=
 =?us-ascii?Q?D3OYxPC1zS6ERS6qc8m7quG2yeBxEdgobaqpegi9wukhRiOXtMjXki5gnQRO?=
 =?us-ascii?Q?qCJbksPNZMAEcFH6pA60lANsZFzuDDWue3PCWM5e6yCelSCpK2lKqd6tJcDc?=
 =?us-ascii?Q?YoJSKnoe8QdbwMJq9vzXEumAu/TpauEStC2KkJX1Pn4ikiJFDXefxhz2mwS3?=
 =?us-ascii?Q?HEXb9wm0O3Lstv9qMFSeP2lRR1rXjco4niBvHQI0HCD1m4ozaHhYwTbFwFGV?=
 =?us-ascii?Q?04uhlElKhjjtJRGp1kVXrtWPBDU8tr+9q70l/ofwGFq8HVXsfKegfhhq6yBr?=
 =?us-ascii?Q?6WKEpDacf2Hr6VHsx6kZm8XDl0Qj1Ue6e1bvlNtNEKN0q/aleP44KiY1orKy?=
 =?us-ascii?Q?prf7CBmk7YDn2fy4kiGF9PuNU9OCz0AmdPTsMxStlW4LaN38Xqx9ITUfxwNn?=
 =?us-ascii?Q?Al8I+Z59Av3CQ0cclvflJlSJ0sUVWrjjhUvy5TH2aIYRAC17fV9vcoy9e08y?=
 =?us-ascii?Q?7XohtCYokgCiCMdqdG8k+t6LbWEwi1bBBoovGM7BUaoZydQOqfkCv8BqoiGB?=
 =?us-ascii?Q?vRDeKmyYlPcrfY6zsdCS9KCoI/STI0DztDNq+ECG2amkFKg7UMKfnOJZ68GZ?=
 =?us-ascii?Q?9W9bgeF4eCYelfzBIISVDQcsGX6Ni5txFo8dPUFpkKlospcjQt8s9KHeEhCr?=
 =?us-ascii?Q?3365iD4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?92iMgWrEcOgd4Xtv1dxT6x2QCLa/a3y30NXPngkedw/OLqbsGPI93j/oQBml?=
 =?us-ascii?Q?ESL8bUJbwdb+ihYZY25q+UbjOXoXR/xyWDAsNO2aXX+L5oWPlB7EmXZTAvwH?=
 =?us-ascii?Q?wrz/de3WxRnAuTZa6+M8pdX3t2AdaRvWLe6phmD7ONDtmfoMg8PbcZ5z1Nr7?=
 =?us-ascii?Q?J6vRrmv8QDXAbWbvranUeHKHlzPiL1g5ObNg6UcM1VK08/dHHmQfwJTd/A3L?=
 =?us-ascii?Q?48Aav5J1pSKREkF43Myy46sK5ibpxJg4TAN/sXaC4gmt7/XuKc1NNQjT8aTr?=
 =?us-ascii?Q?8KbqkBVR5N1szkm2opLcfH3D2BNk2qTLgq02z5s99iPEJ0i6Qikj4qASZSDv?=
 =?us-ascii?Q?cx/1L25Hkh8epF880oGQ6k7QsT2LYQ/YNyx7LzXmrXM/qp79OEwJY8MHE+8U?=
 =?us-ascii?Q?FsedSUvX+svgdr40P8KGDETl7XUep1YedTUg1ngj0iwgbw8zJXBdfG0WCMMA?=
 =?us-ascii?Q?IxgAWW9rIMxTB2kp9pXGhssot0P7ei/UYT4t5KKRpgv90WmvLo+c5pg/N37E?=
 =?us-ascii?Q?G5F+16IJngVb7a23E1k7rd+QqEGf2iGShrfzTHBSLA3Ezl63m3sQnUHH/y7c?=
 =?us-ascii?Q?6oyx8xmH5RRh+vpUIUBRZMk6yhcIJRjFT/Zvzn17FedDoWmNPiVA8cU3LWtz?=
 =?us-ascii?Q?n2XYJMjI3bKyiKFb5YwAMntkghpTXyjri7b/439WyInw4b/3Cv//yIj1zC4u?=
 =?us-ascii?Q?jp7v884/f4Js4noeYqss/442l83m2iuNZji8GC0M1wco62b3ugqUE4mvQy7C?=
 =?us-ascii?Q?Ph6j/Q0aHciqD40JSSjjjbjLBd5DOZqJllw7lSxJmAKu2/FHXPyeOgMOWc0P?=
 =?us-ascii?Q?OcFHRw22RyWhiFYIuDcd+wZzRaW3pesbaD9L0g62cLY/XnMqDOAsuZMUuOMy?=
 =?us-ascii?Q?EpWWWohWM2ZjN12njbw5043c/euqEki8Dc2pSTcMbeSKyQoa3dEMLTp9SA9Q?=
 =?us-ascii?Q?a+zzY92andALJnzxQp7sG4+aBopuh+luLEnznD1eZfc7o5DodtS9LuMRVf5N?=
 =?us-ascii?Q?+mbYdi53oxQnfAaX0xv93RMYug7BrAn4QiFt0DTsLYy0gU+BqQUf5BQl+XRw?=
 =?us-ascii?Q?z9ZNDE32iowtVzuXky7Ylbp2sH10R24k3TgYIudOxPCKxCZmqUnDk75v9O75?=
 =?us-ascii?Q?PoV28pzXD5iqIl+EwVx+etGzoy3vtA7qH3/PFA/vBNl6k2079FagQl/jdnTa?=
 =?us-ascii?Q?Q7WeLewM1VV1edpXG/RGl4ZWlJdM7LZLZf83D66QmmZ+Z7PXK3oDfHpyaR38?=
 =?us-ascii?Q?FkzeC/QT9JYY792KqX5d5kY2K2UMpEQw8YLeHsRTzZDQwku32YR+qt2a33Ty?=
 =?us-ascii?Q?UILsX7Q02XquqiXUAJHJNA++ulqdua+e1YSOjf28DkEPa+Vuh0pdIhT07cjC?=
 =?us-ascii?Q?Qxjjc5c+onSAPC7gqLG3BLMb9qxs9q39z1igeyFhTEPFrKgBcjT12IEjBvdZ?=
 =?us-ascii?Q?g8MVHo+vGSny97FcO7AZ7oOXnOiRFX0BffPrsV+NC+oXqgELuZU0Tdcpk+Yl?=
 =?us-ascii?Q?BcWuYzU00Kde5d3LuHYAgtMNEDjusKAtbWf0/OkgvhVmMUqnsZ82CNwmWcHG?=
 =?us-ascii?Q?H89eX92Zzk3FQzArGKs5YjvvOLB2CVoXM4HZPKR4SUddC1Cm/pKCGDg1gBcx?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba34070b-bed1-487a-5dbb-08ddadc4618a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:28:32.0449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gthU/DN7TYkLNHIfGiVY17y9sQ5NZyDBuxX+33/PfqrPA1weC2Hw6ryldhnL8wZepP278NmPajRfu5SJxK6JyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6305
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

On Tue, Jun 17, 2025 at 08:37:24AM -0700, Matthew Brost wrote:
> Use the DRM scheduler for delayed GT TLB invalidations, which properly
> fixes the issue raised in [1]. GT TLB fences have their own dma-fence
> context, so even if the invalidations are ordered, the dma-resv/DRM
> scheduler cannot squash the fences. This results in O(M*N*N) complexity
> in the garbage collector, where M is the number of ranges in the garbage
> collector and N is the number of pending GT TLB invalidations.

After this patch, the complexity is O(M*C) where C is the total number
of GT, queue tuples with GT TLB invalidations pending.

Matt 

> 
> Admittedly, it's quite a lot of code, but the series includes extensive
> kernel documentation and clear code comments. It introduces a generic
> dependency scheduler that can be reused in the future and is logically
> much cleaner than the previous open-coded solution for delaying GT TLB
> invalidations until a bind job completes.
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/658370/?series=150188&rev=1
> 
> Matthew Brost (6):
>   drm/xe: Explicitly mark migration queues with flag
>   drm/xe: Add generic dependecy jobs / scheduler
>   drm/xe: Add dependency scheduler for GT TLB invalidations to bind
>     queues
>   drm/xe: Add xe_migrate_job_lock/unlock helpers
>   drm/xe: Add GT TLB invalidation jobs
>   drm/xe: Use GT TLB invalidation jobs in PT layer
> 
>  drivers/gpu/drm/xe/Makefile              |   2 +
>  drivers/gpu/drm/xe/xe_dep_job_types.h    |  29 +++
>  drivers/gpu/drm/xe/xe_dep_scheduler.c    | 145 ++++++++++++
>  drivers/gpu/drm/xe/xe_dep_scheduler.h    |  21 ++
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  24 ++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  15 ++
>  drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c | 274 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h |  34 +++
>  drivers/gpu/drm/xe/xe_migrate.c          |  44 +++-
>  drivers/gpu/drm/xe/xe_migrate.h          |  13 ++
>  drivers/gpu/drm/xe/xe_pt.c               | 193 +++++++---------
>  11 files changed, 678 insertions(+), 116 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
>  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h
> 
> -- 
> 2.34.1
> 
