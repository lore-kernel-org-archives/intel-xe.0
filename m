Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85507C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 16:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342D510E13E;
	Wed, 23 Jul 2025 16:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+LGDfs6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E95F10E13E
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 16:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753287837; x=1784823837;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sUyXgs5DErjCj+wT7+rZEOtdNX1oN3EM4yDmD4lJgII=;
 b=B+LGDfs6P0oeJSp8KCIL9ZEjPtB2nyI8h5uw+5b8EBYEAUeGHKkkAjC4
 cLt66oCnNaELY99zW423baY/UUT1+FHXpS9PFWY/yBRmR41GM2jcJshZ2
 o7iDb19OLxEb/FT7KLd/3/ddUXKXltv99MrkWxGIgfeVNFYv4LlJ6lSNV
 W6CgVk9U1EGeQhMmKKQZ59A6ciHpRex+Z9jbmsm5n5WPpOCVJqmndxtmi
 ju/Mag61g+/v6YdcG4Xg2D3OIFTvnthBpmzo0k4Hyxr6ogj6s/Qol89Fi
 ddTix015cKCGwlJkx/jv2TG8N/8gczo+rtb2oQnYgpHYlSLkqmRYIICfA w==;
X-CSE-ConnectionGUID: PkgWWeWVRxivurXy00ZU+w==
X-CSE-MsgGUID: /4zW9ugZTQWmRiczwHvx6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59392486"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="59392486"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 09:23:57 -0700
X-CSE-ConnectionGUID: 1t8rXbe9QLejK8FPolQV5w==
X-CSE-MsgGUID: 2xbByJnBRD+MWisUaKkRUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159692857"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 09:23:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 09:23:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 09:23:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.87) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 09:23:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLe8maYx7lFmXs8RhTbS8fbcUjfDylsxImdXCn62R0VsHvJRifFVNBffceRSm+Lia1OywG3Y2/GG+sak3FiloSkeNjCRsec/ssZGFF2OBDc0f0U9GjfyVv15CTK17v10sVoTSpx9FOcyrFiu8bqKgov6V5MCkyvXSU9FC58qFiqbucAAKqWlP1C6siy0oM1BPHChOnao87N+2cdpt4cN29PW3MnhEVnT/76yRF8DEInlbNtTMtXfxdJSuhCeddEDVgEbzavE7p9g12Y67hqrqV0CFR82B8+aOX6k8OHU2MSBbk6QXB/3lBJYuLwWQGghxgZUIaXzqvHucONMcjbYlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbH2/+9seMAd0Vxb+45RjXjRJE9/IMmdOvyMZiNfA70=;
 b=rcj5qirw8QOND2vndZwOqQZqzG0F1gMsEqqfV5du0HfWIafmToSY0DRFi1ZGRRUY4HSjnksVPQFjF23FUjN9Hks7kfiznLAWcvnaR2ngamrWCozD865WY/Dog6pmGKe9POw7wCOgAD8ptLPuJD87RDSOuEV/IABfehkLk1FeCCZ/awKjod+i/zSLz43YaV2nsPeUw6KKG7eziJ7+FmPwRgQcPytW2c7uOFkEMwb2WoWPPeDdwZVzFQv4RFlabM8E9BR1PYPS79YCzbUg32yHZHiXlrNX89gxAFjE0CXitG+lOBGjRZoJuBnkHFYiFo6pc1hz+6FGI2l320htBBb+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4984.namprd11.prod.outlook.com (2603:10b6:510:34::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 16:23:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 16:23:07 +0000
Date: Wed, 23 Jul 2025 09:24:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Summers
 Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH v3] drm/xe: Improve VF provision stability with fault
 injection
Message-ID: <aIEM193mPnzNTPBG@lstrano-desk.jf.intel.com>
References: <20250723131008.26916-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250723131008.26916-1-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW3PR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:303:2a::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: 265033fb-bdb1-4837-2429-08ddca053567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sfxRvtpk793sjpTlIicN99JwospCIfbDjq3Hd8q3+A2zrBUQr3wE7lybI8UI?=
 =?us-ascii?Q?LOzMS5YvoBH2W3LzU+jk8SwCznQdCBBDeTFVL6WqbhWo52reLEbTQxJK1pZ7?=
 =?us-ascii?Q?43Pugblc20GXJwDZjcYMeQtXORikIHgBdc74EITK6raYjYNUjgzOX+RXkOAm?=
 =?us-ascii?Q?J3MOkVDQgHRkAIPnOjLaDimLhQJCBP74sgzzeSDEP+zooOJJ6sFypRbQwwR4?=
 =?us-ascii?Q?W6ThxFBjsGEx2Wjxzcub9ciighiI3VsD9dlESMBMXAwrOvp2wtsbzswWt0+L?=
 =?us-ascii?Q?X8DI6YbssSwgk5+IRJKjkydYnH+yaSlKFItkDBSwhFvp/QfXkWUxYFJuJDYU?=
 =?us-ascii?Q?DydWE/ndWGFfWlsrfNhKh+fIQt/gHcA/omOHPDlon0SY2G3UgGrWOrTt3CFh?=
 =?us-ascii?Q?c8CpEr4CmQCbPLDN3kZv7Cmcgwfqit7zzi5IqzwBYQzIPRa475QcEt1oTbk7?=
 =?us-ascii?Q?u3ZIr5LrtAvCrC7UNaamgFNSuXGs+W7VDEhLyYWz+cucfYCnZH/9DqcuKSe6?=
 =?us-ascii?Q?L9BlrtJ2syrpUw65Ycxq/sOnM7hoxSeSduWJMvaYEkprtVgRoSjBWCn+Uyol?=
 =?us-ascii?Q?qnuS9SBzOWmw6b07tQdxtviF6ZI0dyUAXnGBYWfLgGkESOxcAvYRMDtyuxpT?=
 =?us-ascii?Q?ax9zZP8KJ5H76hnxgmT+FwWMeeM7dzApXUZ+1zunkBLkU72xrEDzN3nOnt3G?=
 =?us-ascii?Q?dFHAD9papga2I4klnfOP5JCLgYoMzY5r29rydebBsEMcX8PR1mnIFG+NeVV5?=
 =?us-ascii?Q?OWUmaWfktt2PI8KQ8QiWLaJlHXUvc1b8cwtQeK3EBLRX9WyDAiPy4xwtrDPM?=
 =?us-ascii?Q?hQnhGuMPsi9diFC4lGc/8fy8RlhJIm2NV387FzlEgObtyxM8bPibEFhrJ4A0?=
 =?us-ascii?Q?sswniPbia/SA9MR0azuMxyTLXwKuL8vWT0729D0MzJUggaQmRb31pMT5Tq+f?=
 =?us-ascii?Q?vTpv2WVgojOe9GsXXuqMW5Q9C6/H4G/Nw17eunaDtweMXmV/3Lzzn69dwTn9?=
 =?us-ascii?Q?jgDtzKp6Q335fZzI5/sZGR8ZPuG6PT+HfAMQ5+Msv0TgB2LDrseFBG7YSQaF?=
 =?us-ascii?Q?YK77w7veHOAreNyyEZV9NDR+0E4GCiSE8HM3wrMZSnLyeGlizrIPPtuXUtCd?=
 =?us-ascii?Q?nUM5W9/SYXrowPQoKc2RL8wk6rvQG9C9aZ0CRmYxIvKFkh54Bh0ZCURHWD+C?=
 =?us-ascii?Q?JHO6p1qw7KvTBLp3ix5X8xFv9sxWRZCmkteu8D8UpD1y9oC25gc6av7xMYYf?=
 =?us-ascii?Q?cSgGbS+P/Wb4cqraxdyaAVXknljfzAHbCbkTk4bvEDwnrM9VwtRUD+4sOna8?=
 =?us-ascii?Q?6DDmS7+GoLg4oO8tt/1MR1/G0rdxtBB4fmvTei8cHXtpRczoM5Vtb45VcEkv?=
 =?us-ascii?Q?H8JaBtsMYAFcbnfVRylu5pLtlvwJ+Z2kMIQBwcqCm0FRRzBOviHV+hq1WQDc?=
 =?us-ascii?Q?iDeTR9IfGe8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uICnR54j0PjK8qRzRmF4OR9XR3mtLd1nJ69qrzChBVy3kkY071NCLbZ+Nnnk?=
 =?us-ascii?Q?e2kSLyOLG75bZH+qo9uTXxo397UYAIFKboTXfaZjUyAouRcd9lGHtRhx+OAD?=
 =?us-ascii?Q?A7Z4zVE4PP/VhGR6G2YychpLkz6W2QmPDqO8j0DlAGNCURHqGZt1Q7tXkuqA?=
 =?us-ascii?Q?mHhWPpeYxgZEowI9EY9h8HiUoHvHYs9r+54eoqLToXeDASYq+JweEo7Zwded?=
 =?us-ascii?Q?JcAvs2/87RknROPlgd8QeRH7BJ22frGwL7g8LjZR1pF5BITVZH0QTINZBGlZ?=
 =?us-ascii?Q?b4zEcUXeak0lQY8mNoLFTnQ8P66Psb4bbcX3P4Ozi4GiRvLBFJTFDbqggLwM?=
 =?us-ascii?Q?wfFiUWr2Sxs0bIVD8uk1pSybwbfmhVc+mcXbw9J6X1CGNbZ8fFjhlPdcHc34?=
 =?us-ascii?Q?V2uP+LxGtB8NFiFtSWoiW+GXIewhgrh8csYz4EmDN6cShpwkcN4WKux+ORh4?=
 =?us-ascii?Q?J6exb/m8zK0+H6Tv+2uOMUkxMaA3K0C9R9eyCh10v0zfTPg6YxKX4YSbzkRi?=
 =?us-ascii?Q?ernTS+NrOzgCr3iBBdDn/2ndbAD2zmEzVbUWoVex7KgMgTnwYbYg9XEptCzc?=
 =?us-ascii?Q?/rA2KNtAmFNRTyY8orI2EV1SbARTQgbx/Vp5emgG7Caii7+qmYTFHWBmHhz8?=
 =?us-ascii?Q?InM4eYspguC4FYq3t/NMAWY2n4fThSeULDl4S7QuoqOyde2sDnluUhVMB5uP?=
 =?us-ascii?Q?V1vOrFULxCIlICZnFr0iJ8Syu/BVzqFTTK+Ja97nNcuS2b4vXaBUkIJW41eW?=
 =?us-ascii?Q?yND/lDFEQk4FZtZMhOMq1lhGxO/7jXzHQaFdRL3JHFjfz6d+kM2jqheNH9fE?=
 =?us-ascii?Q?xtsTNMYCE0ALQ2LBXVwnXT/2HkA2dZjmJCHkA+sDT9voF53ThJjywwegQay5?=
 =?us-ascii?Q?KmqfZCrdOCCF/mAY4wj1wAXU5fJ9Ueo+T8ViYt0vioAB0bn/3X57RCGySuvz?=
 =?us-ascii?Q?B1nPIeH23NKs+f60RqnVlOJR1SLaAQ1OJwCYvFBlOVx2PQMy8spclMJNGoSX?=
 =?us-ascii?Q?P56MUgR3oiakiJOHWP9+8bcxHbGnGplCc6EfjxxrpuYmeY4KHz9ZZNbYs0/f?=
 =?us-ascii?Q?z+V8k40LjkadGCCdprx269X9Q0P58N50lwDo3/m3t/AEFS7qOncgjFilmXHj?=
 =?us-ascii?Q?S+pRQwFu2kUTUcAvp4KkJ0H2CoHtd0UOzl84OlKEZPUSBreyvy49SMoEno5/?=
 =?us-ascii?Q?9jg+2AMOEE1hE3oU3LeX5qQvvDLc9wlIo9Q3iBFoery1Ya1AYPQ8DuUn4y5t?=
 =?us-ascii?Q?botSSJE7umzRfUEVHgmkrtg5DuacAkOu9xC2StrWwN9DLBzhiNvYAz8O2vAh?=
 =?us-ascii?Q?txDNZIEeJRFEUAKWa7j3gdMUSBXgY6qrcngfhYdT024jgumNWBOq2KBpFHjh?=
 =?us-ascii?Q?feE1iMNs9je0nZNSdJom4jLV3p3dATQERGTyQq+mjkdDRtfwJ7a7ZxKGnHyQ?=
 =?us-ascii?Q?u3SBIDLMZrFXFwzsrZ4P1okTMB9giErPcllJgLX9+YBcsw+/Pe+lclqKF84+?=
 =?us-ascii?Q?I6/sqdM4AcDiq1zqaajYxq7v6CfQHago9PoT/2NgwozMIm40vbmaM/lpOBtD?=
 =?us-ascii?Q?ciywDdOzoDTIPA4Po01qPW+sWwpvF4orQKaQRDtD2DhGZYUMVKOJ9CMu6cF0?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 265033fb-bdb1-4837-2429-08ddca053567
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 16:23:07.7493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdzC1chvPLpBlJhZtZINlhWLpiP/FziokxorrzmgBLf2SvSNunn5ohTbzqemCP546P7lxmNlrWNSoMUEEHk4WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4984
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

On Wed, Jul 23, 2025 at 06:40:08PM +0530, Satyanarayana K V P wrote:
> In unlikely event, due to PF malfunction or misconfiguration, VF may
> receive incomplete or invalid configuration and it must be prepared
> to handle such cases without causing a crash.
> 
> When simulating errors with the kernel's fault injection framework, crashes
> were observed during device unbind. These crashes were primarily due to the
> use of the XE_BO_FLAG_GGTT_INVALIDATE flag when creating buffer objects.
> 
> The GGTT is invalidated using CTB, which is allocated with the
> XE_BO_FLAG_GGTT_INVALIDATE flag. However, the buffer object for CTB is
> freed before GGTT invalidation completes, leading to crashes.
> 
> Similarly, for buffer objects allocated in memirq_alloc_pages() and
> __xe_sa_bo_manager_init(), the CTB is already freed by the time GGTT
> invalidation occurs, resulting in system crashes.
> 
> To prevent these issues, while invalidating GGTT, an additional check for
> validity of GGTT is added which avoids sending CTB to GUC.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Summers Stuart <stuart.summers@intel.com>
> 
> ---
> V2 -> V3:
> - Moved GGTT validity check to xe_ggtt_invalidate(). (Michal Wajdeczko)
> 
> V1 -> V2:
> - An additional check for validity of GGTT is added in
> xe_gt_tlb_invalidation_ggtt() instead of removing XE_BO_FLAG_GGTT_INVALIDATE
> from memirq_alloc_pages(), __xe_sa_bo_manager_init() and xe_guc_ct_init().
> (Summers Stuart)
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 29d4d3f51da1..b3005a462186 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -447,6 +447,16 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
>  {
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
>  
> +	/*
> +	 * To avoid crashes during BO unbind operations, always verify the
> +	 * validity of the GGTT before attempting invalidation. This check is
> +	 * particularly crucial when handling BOs created with the
> +	 * XE_BO_FLAG_GGTT_INVALIDATE flag, as improper invalidation of an
> +	 * invalid GGTT can cause crash.
> +	 */
> +	if (!ggtt->scratch)
> +		return;

Isn't this too late? i.e., Are we sure there are not BO created prior to
xe_ggtt_init with XE_BO_FLAG_GGTT_INVALIDATE set? It seems like a hard
this thing to track / maintain this rule for an extended period of time.

What about in xe_uc_init_post_hwconfig which is very late in the driver
load we add an action (thus the action is run early in driver unload)
which turns off the GuC CTs? Any TLB invalidation client would need to
have similar action too.

Matt

> +
>  	/*
>  	 * XXX: Barrier for GGTT pages. Unsure exactly why this required but
>  	 * without this LNL is having issues with the GuC reading scratch page
> -- 
> 2.43.0
> 
