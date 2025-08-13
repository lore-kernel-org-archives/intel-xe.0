Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BADCA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 14:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E4310E739;
	Wed, 13 Aug 2025 14:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZMWsqoi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE65D10E73B
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755095328; x=1786631328;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=F/oNMzR2hfdDY/QWYk3bU2w2kp7p5lfb1eumZvfv1rA=;
 b=hZMWsqoiE6atUng6tJfqmMSx34N0FKyGaRS18umN8ImfUWMIYoMQ23d9
 //7M2mwbsixQlbYZ9buwPgEw/JPUPtSmfR5qA/0ruGeb9PIxqB8s+6LoP
 44KlERGIv1KskQuFQdBfGoIx3SVOxPQggOv8ESZOwJ6/9VkOYF1YlK2P4
 xnpG6XdIMIW2T9m9aUjAvvPQXrgLiGMpy61h2moD8xKWNi7biZXiQatYq
 qJ76hUYHpKvtSI1Z1AJTfH0UoybgojNav4nnLJ3hyWv0J8yjY57ukP+T5
 8F3gCLBCGWObY/lD+D0OXmbm+nH4CuOqAoFkXcF8uIEoy8VulobMT7cK3 g==;
X-CSE-ConnectionGUID: 4CsBVpcmT3iHj+7Kh8+OmA==
X-CSE-MsgGUID: oxXbO61OTQ+5oyDiKQFuVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56415372"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="56415372"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 07:28:47 -0700
X-CSE-ConnectionGUID: Lh1sOZ72RQKz/jvRdumbMA==
X-CSE-MsgGUID: QkHmKST0SYWlfHJ8tWvcXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="170697762"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 07:28:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 07:28:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 07:28:47 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 13 Aug 2025 07:28:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lE1YLnxdZTiNMCe1yeFoAIPJHq7fpKHv74WV4toOAiziqOCusW84xJpRvA/Xk4gyXdxwabAIt2Kpuvf1UwmlG7RZtVBXL+wVVrVrkaRiSqMhAMoejDuuxoZK5wx3iZCTpQ6sz20OHjccMmheSdQPz63ovHzsBmE4jONZjSPBFPXfVyswpwm5mUKspP70J7LMh4CNen5n3TPhZrqkxM3UcDjizEvaE00Hy7P5SjJgsNSUSjdCBI55BFpvo8aFoG81a/XfatW/KjBEzMmglfstp6htDlp3M1wuQaJ2d4tn1YRMqzLw68KJnNv5Jec7mxWaIXSr1WY0AmfV/vEwP0w3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETGNM9q3Ok0GQqbams6NG6UGMBU+Tm5QKbnGwrYFFfs=;
 b=gMaaKQ6BqRG6O2DebtZ2QeXcvGAmXguyVvI/XcuEdI3sIm2sikTcJbFM2WihFXtF1teQyZYTYcR/UvUUBwr6vha+k7jdn1oY1oyNM8uR/pEFj1cPPO7+w6cVPhJNoBrqiSAZlIX2DeDVnoriHoUvYQRyR3GmjYSo49RwQQJK1smdS14eJVz+dW8AGonG7gcNxeuYeaGcKYZlVWWc57yArBDiBDXagOOrdLxHzPpaTy7A3sox742GNyRQ2XfPebN69RzY0VdHGXNd1Zui1ISZK39Zsg/voVZ1t6zi/hVjnpjTP6umlHKmhrHhX8swnawRjAV52dBQcCi2kVwKmo+hkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF9E4E1C227.namprd11.prod.outlook.com (2603:10b6:f:fc02::3e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Wed, 13 Aug
 2025 14:28:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 14:28:44 +0000
Date: Wed, 13 Aug 2025 07:28:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 01/15] drm/xe/vm: Don't use a pin the vm_resv during
 validation
Message-ID: <aJyhGXq6JEKuPs81@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF9E4E1C227:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b3c3b48-c1e5-4e8b-1cd6-08ddda75b513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4eW+RmRK6XTX9RX1v2uSMejpWMj581wGSIqPtCKvYaicqNHe3aRLqz1S3B?=
 =?iso-8859-1?Q?sk6qfztlFzVtUOI42wC73EQhtnx1/KV11NJBaiNWIUjckb1OruVk5/x3RA?=
 =?iso-8859-1?Q?4sYL8FAlrD1o9Gui9IYr1KQwuZUAXsz2YJhzbh7U24pviI3u8tk4spmxOB?=
 =?iso-8859-1?Q?w4ArA0Eq20rUY8UWrKdy78TpxoVbJ8Hnc+6Ga7Fd7WylFolRC4z6h0ZWgP?=
 =?iso-8859-1?Q?yy2cZKAu/F+3AM6KHRNuLwk1ULo8h7DRni27rehAYlV5GnkvPdfwatlhHu?=
 =?iso-8859-1?Q?4b5Mtn5uAbopThIKa7kjAixow8LaQMl1aSi/g8HZsvixI1ayOwSG90P2Dh?=
 =?iso-8859-1?Q?4rGGAkp8rwr9y0/Pd3GoA7K3TC3U40CVG/8AErbIqN4ics6PbVKb0sYuXW?=
 =?iso-8859-1?Q?2YM14R4lc91nbaZTE0bPMqWMxiO2LQ2bfbaP8O/kbVZHG/3v9g2wE1BEaL?=
 =?iso-8859-1?Q?uM1HuacgvRMsyICKrrsrBjsbkSnK3jvKmdckwXY5RfHFCianulehU0MYgT?=
 =?iso-8859-1?Q?5SpNUGFqrh+Gmzuzo8r2ljkMw7iroyqu+Nz2AE9angOF276douel5LjYF2?=
 =?iso-8859-1?Q?tUKCOU5o8aCcjEDDIHBFaP7joKVw4eieDEGO1u6asWV1nCh4iwJ9cifbr3?=
 =?iso-8859-1?Q?BQccjngvnxko0vD2jhf1S0bRMeSqVk2OrHrAamRM1lEtyWQitZA3ZpntC0?=
 =?iso-8859-1?Q?6u/mG3TRhqBMlArG3FoELLkKqz6/LtHICIK19gyhTsctDEranbW0zYSMwt?=
 =?iso-8859-1?Q?5qBZBntkCYEVBQVawgMX1dR/bwxYPZ6x8euHOF1rpeg5wkSswY72GgNC0Z?=
 =?iso-8859-1?Q?TdlI1uvvVQXxuNPcwY4wgG/dZ7hBBZn55Vmdn6wJHJoJ0qfG4s4MCCBQuV?=
 =?iso-8859-1?Q?QVM9+25+S2jL0LyjWlD8E25/XiZHotuw76V+/oFqeUxGz+uQ41kF/0PRII?=
 =?iso-8859-1?Q?1Rhpc9rxTqR2yV+bGXw7apV9Y3FFE0SR0nWYRUsn7aLt2nsIdOmatCPto1?=
 =?iso-8859-1?Q?QPBWGoNUa2RpOaIn5Qvb3Xfj+OIH8s3J1Pc520xgoMFuQWs8nu4udiOi9Y?=
 =?iso-8859-1?Q?ufa7sZrme+M5V0SmOmngN9aNPdDcOxccbFjNqJqw5IC8f3MlxnhW4ydASk?=
 =?iso-8859-1?Q?fr9teWJ1YS/Vc55CF/LUsMZgNoZ2KuHP1l5iW1NJzu7fOsJeMkGYyLmMgq?=
 =?iso-8859-1?Q?ndlQsA9EJH1Ac5hbIzN2pUnkDEWDb19Ni6bPjOK9i/1vXthOF5/2M04W/7?=
 =?iso-8859-1?Q?j+R0SwlcjJOBbZpgCEoyv2PW0OoHMrsKxmzDSXLhob7GjtWD6wQyJlgKnC?=
 =?iso-8859-1?Q?/VjOi6TED8wMMys0ZD/GZSFWnLcY7TVd4KyNsdzyYt+95fOcBbvILRfGwG?=
 =?iso-8859-1?Q?E3a92gI4IMUza5TnxRqejBAKgIKAFaBSZR+WFYh0Zl9KO7N8M1VXtbnK1c?=
 =?iso-8859-1?Q?9f47/rO3xwI1V+kY3kneShv3EH1gVVtjLiTrb4CneYtS5VBu9iqrMaQclS?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UMJIj0XJTZQwppuef6pR2t34q8GEFPkUwFNty8hWlde0LX6zRAenQTtoiV?=
 =?iso-8859-1?Q?OCvTcMiiurESctzHILN9jR8KJO5sOwrecaA68woHSLV//XtBF+C5URIaqg?=
 =?iso-8859-1?Q?VqAC+DbHr9QFgEpEX8OZqqZm/tlrl8ALQYWI7gSzogLNfwHN4OfCka6fyz?=
 =?iso-8859-1?Q?pFLcVmOQScyqcTGJbRMa2oMZHi8E/FlDk7q4weo+fsS9ixJh6DYhsmPkdl?=
 =?iso-8859-1?Q?OzlDLIHxKB3beGdfhvvC7J5U4uy0254aKrfxdr548Sum6vkadd1/sjKdV8?=
 =?iso-8859-1?Q?vW0dal+DDeH7emJtZtZpvqzrI6tgtYwsxqAfJjjLmHk0Rv5eDAEm5pgKE/?=
 =?iso-8859-1?Q?pN+sWdRw/02I3mBlRIwn/wTrRvPoniVcYVuttv9IBkonDqexQmzB8vnBJ+?=
 =?iso-8859-1?Q?2F5o4WQDOAitTxtPzr+m9L9cOWHc2svVnQe1lqcBlboX+6aibfXIXzjTNo?=
 =?iso-8859-1?Q?sQfx8t/MrJ4Km23pawajA5iwsEmoO+rIC2yGTRcUiZXPJcfbtPDhV58bRE?=
 =?iso-8859-1?Q?NPV7nJ+16Ci67h5SHr/eYkyvA6WejEF0XWDiSGSCaeVtjm6BO1Q+B1Hw38?=
 =?iso-8859-1?Q?dvHfoZ48LMHcoy/Pha3SFp5d33FqtHhjY1qVXA1Sb510aX6TPTm93QMlKc?=
 =?iso-8859-1?Q?PL5xWB7WBlxTnFNvAxImqlJbrUv5XTCdCP+jE0sll5SSQkP9Ke3YVQeWCq?=
 =?iso-8859-1?Q?F8TBwm9TLA1I/ZnYGXV1ATUGoP3OE0LFlmzx/rwOq+Tr9BJY6KyN57oLky?=
 =?iso-8859-1?Q?bkRK4bdFSCiqOUHL0hNN1gDzjMBj0bGu7qlLzMRaKH5ecXi5artsitUgNm?=
 =?iso-8859-1?Q?qSq1NRvoXtVIhw2PLFTDjLfQ9HbjInYDchrJbUlJiUy/POOWEITr8KrzRg?=
 =?iso-8859-1?Q?pSm+mdVX1ok1jp+rB4xibtyg4euYusBELPfnliiLfVqijmkYFbNbakJXmH?=
 =?iso-8859-1?Q?JleKMA3CK6A1IYfwqJZyW+UOEgUEBIFaWIl4MzWH/4x3IosYKMQOSBeHIM?=
 =?iso-8859-1?Q?SjyJhLGWo1uBfqJtAeNL04BQQYNDmtb1qET0iT77X3B/6x14IfwpS4l2nu?=
 =?iso-8859-1?Q?8kbpj+eBkm7d3q5ppQxWjIVpNySmKkBAPNKNrJFVUETI2wphxBOb9CQWkB?=
 =?iso-8859-1?Q?rX88faluJjPBNxSFiewYeWqXhiGmT+7jiEHFGnu/G7sWxY962vP2NHMa2k?=
 =?iso-8859-1?Q?mRT9+3X9LJ8j2FJ49bEUcqB7jxqZPuxg2LImE36xKd4CL52HszxzxzyMOy?=
 =?iso-8859-1?Q?1VQcRvoaDte9wMG2zQ3WSSlkuCQe20CY1FXGLqip/bRzhL+Xeidj8ImHsC?=
 =?iso-8859-1?Q?sPRVdGgir+UrF+3+Ax9VEY5BWmJFKW3NwsOKd5IU9W+2JnP6KlbzMDSOky?=
 =?iso-8859-1?Q?2OU8snyvEQFPq9EpkfuSsdh0XlSh6S5fyOZjB2yaAJxJ97qdHwP2DY/3ul?=
 =?iso-8859-1?Q?YNeIsl+eAGeNOxinuI/otxA5HFaE9fKKSOMXb+nfoYnng56RWdypXKMyKM?=
 =?iso-8859-1?Q?77MW5bxN+pKkedrJ0HLVKHLYAiPwFX2Lu6u6uu5Exyab8m1FsbnDYlGuov?=
 =?iso-8859-1?Q?OSp+apmTdip0x67/MBy0AKUcytZqvxptVRRb+OTCSdM5JSdt1/KKE16pcp?=
 =?iso-8859-1?Q?awy5lXDMtQbw/sWBBB5FUtHlLur7aOKXKIY0e00JekVMYqDSIYV4bEsQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3c3b48-c1e5-4e8b-1cd6-08ddda75b513
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 14:28:44.8424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZ9MA45oFNjPZEiKZHxCe42kfk4u6EYvOUdLMx9/Y6SeuR+pnO4+nFlmITEZSydKDozjnZ0d4k4wfdOBkXocng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF9E4E1C227
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

On Wed, Aug 13, 2025 at 12:51:07PM +0200, Thomas Hellström wrote:
> The pinning has the odd side-effect that unlocking *any* resv
> during validation triggers an "unlocking pinned lock" warning.
> 

So this is a cross process thing then - right? e.g., Process A pins a
dma-resv lock, Process B unlock a dma-resv lock and boom lockdep
warning? Just want to make sure I am understandinf the problem
correctly.

Matt 

> Cc: Matthew Brost <matthew.brost@intel.com>
> Fixes: 9d5558649f68 ("drm/xe: Rework eviction rejection of bound external bos")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c |  5 ++---
>  drivers/gpu/drm/xe/xe_vm.h | 15 ++-------------
>  2 files changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6fea39842e1e..11eaf3b06766 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2468,7 +2468,6 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
>  		.no_wait_gpu = false,
>  		.gfp_retry_mayfail = true,
>  	};
> -	struct pin_cookie cookie;
>  	int ret;
>  
>  	if (vm) {
> @@ -2479,10 +2478,10 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
>  		ctx.resv = xe_vm_resv(vm);
>  	}
>  
> -	cookie = xe_vm_set_validating(vm, allow_res_evict);
> +	xe_vm_set_validating(vm, allow_res_evict);
>  	trace_xe_bo_validate(bo);
>  	ret = ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
> -	xe_vm_clear_validating(vm, allow_res_evict, cookie);
> +	xe_vm_clear_validating(vm, allow_res_evict);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 2f213737c7e5..2ecb417c19a2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -315,22 +315,14 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
>   * Register this task as currently making bos resident for the vm. Intended
>   * to avoid eviction by the same task of shared bos bound to the vm.
>   * Call with the vm's resv lock held.
> - *
> - * Return: A pin cookie that should be used for xe_vm_clear_validating().
>   */
> -static inline struct pin_cookie xe_vm_set_validating(struct xe_vm *vm,
> -						     bool allow_res_evict)
> +static inline void xe_vm_set_validating(struct xe_vm *vm, bool allow_res_evict)
>  {
> -	struct pin_cookie cookie = {};
> -
>  	if (vm && !allow_res_evict) {
>  		xe_vm_assert_held(vm);
> -		cookie = lockdep_pin_lock(&xe_vm_resv(vm)->lock.base);
>  		/* Pairs with READ_ONCE in xe_vm_is_validating() */
>  		WRITE_ONCE(vm->validating, current);
>  	}
> -
> -	return cookie;
>  }
>  
>  /**
> @@ -338,17 +330,14 @@ static inline struct pin_cookie xe_vm_set_validating(struct xe_vm *vm,
>   * @vm: Pointer to the vm or NULL
>   * @allow_res_evict: Eviction from @vm was allowed. Must be set to the same
>   * value as for xe_vm_set_validation().
> - * @cookie: Cookie obtained from xe_vm_set_validating().
>   *
>   * Register this task as currently making bos resident for the vm. Intended
>   * to avoid eviction by the same task of shared bos bound to the vm.
>   * Call with the vm's resv lock held.
>   */
> -static inline void xe_vm_clear_validating(struct xe_vm *vm, bool allow_res_evict,
> -					  struct pin_cookie cookie)
> +static inline void xe_vm_clear_validating(struct xe_vm *vm, bool allow_res_evict)
>  {
>  	if (vm && !allow_res_evict) {
> -		lockdep_unpin_lock(&xe_vm_resv(vm)->lock.base, cookie);
>  		/* Pairs with READ_ONCE in xe_vm_is_validating() */
>  		WRITE_ONCE(vm->validating, NULL);
>  	}
> -- 
> 2.50.1
> 
