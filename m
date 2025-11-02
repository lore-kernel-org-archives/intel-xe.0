Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC4ECCF9F8
	for <intel-xe@archiver.kernel.org>; Sun,  2 Nov 2025 00:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C9810E174;
	Sun,  2 Nov 2025 00:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PToq9HzT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90D010E04D
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Nov 2025 00:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762041710; x=1793577710;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4MTNF6ARIslsvU1xmZJkonE9WHOroaCM3sYCuTXC1Hc=;
 b=PToq9HzT+vZKgD83XfoN20+9Xbidcnz3tqYWoO9Es1wJw1Up71sPwOHN
 PEYrkEcNc4NmsthiqF772LCIonAUeEFFJzAdTpHA9jW5+cEIk7A2hXN+H
 TqHzzqQ33WG80+d9f2lK4w+YdKdB6uMUeDK8b2xP9TBKkl09FlOjKHA6l
 0qlK9oLdkcK+KQeA5HEUYgZ4UTjBvRNxNevpsDNDzktB4I33YUo01nT3l
 25+gDA1vOvV1/XOFRLgFWzxR1RvVrOPTW+7XL757iSWBIXVtpHKQGAvxY
 t4nut1dAhBRoIqqUpGo3nihSAHwD0lWcBJN3nRor8oG1+c+2Md30qzJO9 A==;
X-CSE-ConnectionGUID: jXKb5GPvRJ+xhDifWXQ2bQ==
X-CSE-MsgGUID: u+ptge3FTEiS9Jwu/TIJ7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="63184321"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; d="scan'208";a="63184321"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 17:01:50 -0700
X-CSE-ConnectionGUID: jSY+WtPFS+ekrZR3QhhlXA==
X-CSE-MsgGUID: ahgTXoGIQlK+WPKdnXmFWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; d="scan'208";a="186223477"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 17:01:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 17:01:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 1 Nov 2025 17:01:49 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.58)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 17:01:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eP6+IQtzgveEcy3euIFJI+KEkUsFVv1FMteKulAe6TIF/euFUouSs0ZqnMRZWo0uDbwJ9sU59vimSwKQC+wjx60lzO9MrZHoAkKazeW/9ADqJ1iFo/3V7XNyCtenXjJen7xtpNDXOeWajMKWpQiSzxbXSCbf5uLgwV7dH/s9IQ4sd1HpAhN8zFH9tHDzcopuJe8je2Wzc1/cPkoYKFRY2WHVzPbUpFDD03zQ4LnW0YTC1ZA4iwxImRT7JizEEg2DzCRKClEItUJnJRxZhIGtov24FQE3PkVrClPB1VYRctx3Q0+k28nvoUWPiEZ8nlIcFZ9uBhWPhLrZCTRFJQx+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFgzB1CkiwT4AW4lmaylAkGQOvsDE0kIdMbGiQJXKaA=;
 b=PpF6wIa3u0wyLhnw/gs8i2BsFJdd+65d8LTi1v7mnvfIeXatj8Mm0g6ypNOx2JXRQFE6w3HsSvmaz/4b+6CyITR3leGy4Wgqas3OcvQ6nvIMTHC0SMuMoE2QMregzMOa0K9Eci7nM4KLha5ykkVmgxcjadmipndwcqyEugf1e7/hLQjRzeCy9Pe436dE+C90EcuFTHEOWDwvGZTIw+0cR9crZ+7YZ3Fyur9MpD2xEpqSe6kJnM9/xt5MokwUPlE8JJXj2lNdP/Y4iGd1f85CMiGlBIchDkE1Gqo+Eg/MSDnk81DXtmTUNWBrx+CzL48beaZGhSTnVoRtpELhuOD/1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4996.namprd11.prod.outlook.com (2603:10b6:303:90::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 00:01:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Sun, 2 Nov 2025
 00:01:46 +0000
Date: Sat, 1 Nov 2025 17:01:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 01/16] drm/xe/multi_queue: Add multi_queue_enable_mask to
 gt information
Message-ID: <aQafaLieY4yC/55s@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4996:EE_
X-MS-Office365-Filtering-Correlation-Id: 292f64c1-68b6-4b38-5909-08de19a303b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I8jMTtPGZQeT3cJU2ZPfP9tBkdygwBtGegPl6fTn8pCXn0TkcuN5Ea7SqCvM?=
 =?us-ascii?Q?8+bT2Tm69km720PhH1G5gRMq5ZWhiM6ui/ejUOe0aHfUul9u87ngsIBr0ARu?=
 =?us-ascii?Q?TrL9ad6zUj2HyGaWVQTJ3DI1/Ywh0ekAzjhTFI4v/Xc3vpO7iFaXmC1gK1si?=
 =?us-ascii?Q?BlYUOL9rET2UizfDKo2srkSLxaA8UPqqoPxflbZ3cre17xtS/S6ZZQmcK1sR?=
 =?us-ascii?Q?HYLD5CtYTO7WMj6RUEYGW5c5+yYLlEiTlF3H4rdLSndPOhu4BmO/u2Cx5mp6?=
 =?us-ascii?Q?sHbnmlosEUh37thhXmQwUJnM1xGfSyw0Y7z27e0J6QAsiyldw7ZhNlTSEKWc?=
 =?us-ascii?Q?T+Lh+xkNRwmPWIsAiYB4NZpxZbumKUB4BkNJZ1jcCdL4IlYCVLolr+AAj4Ox?=
 =?us-ascii?Q?WNjeZuBea12t4ANcTH6Tf0joFw8w99GqMj7HeLaWummfdh9pvcvZ59Y0VgaD?=
 =?us-ascii?Q?mk4bU/DsT+Fqa7Jp33vQs5JlSQzg5SrY3L08rJiTFiJAMMDXROApm/PvpI1C?=
 =?us-ascii?Q?S7Cn5P+3VnH6s0aiGgJ/01ipgpJAqcyp6ET2JWd6UYaVF8QwnFylmYA4Sagl?=
 =?us-ascii?Q?wQVEGePR+JuMISOm+3Foa6fnIqPUzovHyHIqf+Ldt1HSNVW8U5ETNAzWacCU?=
 =?us-ascii?Q?zUQpa4Ev1AtAgltEBhnEpwjHigzKS+AdkWnaqTdjlZLBU2nCUty0iHrx/aFD?=
 =?us-ascii?Q?HG0b0d7grnDW1KlKGJX9bOtIo5+akkpW3eoCgQ+tHgOXio3nzwzgqvn6QQ0q?=
 =?us-ascii?Q?4wAmpHNCF2n1edXzHO3MbSU4Fb7r490Ndh7pHEGN5eqwy2ltEziyFuYwokT4?=
 =?us-ascii?Q?2gwg9F0GNkP/8uBQ7YE4HUftlR6NI/J9m9iyULMzm+L1efqZVYiNgpSi0ytL?=
 =?us-ascii?Q?VSxJj9MVJmTedUImywQLE1R7QOjBSNyEpBMUgLByWM62tRdvH7pZb91p7lh8?=
 =?us-ascii?Q?BOYEA1rlsNA9QBPplcvFVz6bg1NcjylLFqRO/+SNk80701PINABR6EbuMKfd?=
 =?us-ascii?Q?qOcl7cmqsCW+ZSfPOPEV3RIITzkFrs+7ul3MDtjNApTZT4NmWlqz5yypm6+/?=
 =?us-ascii?Q?EvJNiO/Avk2ilTOnTFAfl5LwlIUXP9EaKgm72lWaqVmh8dF13mIoRDItzbKK?=
 =?us-ascii?Q?DfvQDjAanbSVw+BfvjWI4/f+ZBp3Eeng6fp5A8HGzX8dgi21uEwZ5ImxCs70?=
 =?us-ascii?Q?gbAy8PhprYQoTJeA6xRWHqQudOjPQ32Rpo24n/kerYGgm1VPMPRUaRZ0GFPF?=
 =?us-ascii?Q?nzJVtegTnBHtWx0vXZZ5BDs/oVz0PtdgFFiTvBrazFnSCQMAgef3t8FEebqz?=
 =?us-ascii?Q?xpf28F2jMTkxEWN7K2EqO0pBILn+tTtxMkmxXmDxlQZL0d2pEsIvWF5TDGEK?=
 =?us-ascii?Q?SMEyax6OEPQq3hDtGr8jnWudnDK4/YSWcBZmUkw/52AY0H1SQIMkxIJqbhB+?=
 =?us-ascii?Q?Yj4qOhPGf4uZcAQhKlOPqlV7SVLv0IYi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fr89pa8PUkwgLHIuLSrxE2sI8naveML4JFBmCMfE7AhAW2LMVxOkX0JAf7Bc?=
 =?us-ascii?Q?YCBKMoh/4uhVhO2C/cC21A3/IV+YPGvB/BtgfVH55Vnb5yCLLZSyj/DIhZ2D?=
 =?us-ascii?Q?d6DazPUIzygf1lfO7GQWKLLgYj+99X2vNfvI31GvXlMCBsE5rgReRhTSg/ws?=
 =?us-ascii?Q?Gkp/0Q4adFRtlqsdQQDF4v708MKqZ+JQhV5xrDpQYEIH2u/OwzkDjpKDY/s8?=
 =?us-ascii?Q?sCJY5+vSd+I0PUJq22FYP/3ibbEAtpXRwiYL7P8zksnU5xMEuwu0OcN4GRET?=
 =?us-ascii?Q?boxqVLVS0wbAytFGrxAcUN7RYkOpSmLj9Rj+YGd5UiG5s/Ky6vVUcRGSr3gr?=
 =?us-ascii?Q?pklI6HN2cFVVD2SHsG4CTD2FS1rNEl2pBF0iTfvhK7MZhQzVUkyDCNDMh8Jj?=
 =?us-ascii?Q?CDKNAkQ2FD/MST35EXoIHjLQKNLIndv9xdYOUMZ6dQGCPYOFPG+OER/71haF?=
 =?us-ascii?Q?Yf8xVcZwADvEY/8Z4e9oJWzJY5u4/BHOCy73xzssr0jgE6vOOWL1c4kCLsbP?=
 =?us-ascii?Q?xzqUEAtOid1dHJOPtvGng2pnoL/bmShZOo1/uR1bqnB5lj9sTezQi2sAd3y0?=
 =?us-ascii?Q?mn9EYE52DcEmGPtcM0OSwz9oxMD2Z3T5pZBXAvy9Ya0ZPvq91Tlb2ZTP9kSe?=
 =?us-ascii?Q?W0hTJ8d42YxnsMFLHo4U0aKkurPTf+3wJR3t7KWGp3gFbsqoOBsxg4ktraV3?=
 =?us-ascii?Q?irSkKEbRooa9Pd0Y7Wqb4MTCOepsB8QGOSKxDoQJyW0c0ZpF+gPzJG1cauic?=
 =?us-ascii?Q?RmuFhLVxQLDtfcJxoZwFtccZe/6e/WuFfKZ5Xn5RfwJseYG09GGEw5S6CWG1?=
 =?us-ascii?Q?TUT504v9bDSSkmQayKFa7jOa606kqJuXFWM6/f3DmZEgPzLN+froOU+T87is?=
 =?us-ascii?Q?tC3brtCgD6FfFcskrS5A5fYpN6Q0NFETDuhAICXJdofwu6U/5sCpGUi9yEGx?=
 =?us-ascii?Q?WJTDT97PvjRMDAuqJRbQoir9rpRJsSF5q2QWDnYFSJoE7UuQMfXTLQOICIE4?=
 =?us-ascii?Q?rbm6ZA7XZbVPh/SZ6IcikBy02ZfMZqAibm6lIb9g7wdMoZuZVgNaogs/pWTE?=
 =?us-ascii?Q?K+q9dxpnis5F2NuZU+EWE00Cn5g5Q+KkBWRbtzhhMET7S2MiR7QOxNbUv/tW?=
 =?us-ascii?Q?R/Gb8ZNxlthP9z1WrFqK86n0Zj8Rsd0bZNwz3lDaGV3Cyh8MHmGAC0FQaozE?=
 =?us-ascii?Q?P2cwy8vhaPamWHYNf7VuQku8PxeXkkm3Sar/jJpDm8VXgOxtAaYxFq79IXfA?=
 =?us-ascii?Q?tte+pv3MTuJUDm+6rbNKJz+1q8eZ3NrENzCRFLsHczLiCrYtTleb1daQWCe8?=
 =?us-ascii?Q?MrqTWpgHFzW/H3hkBotOqpoGhaQrgOO8Jk9QgEfq0yxOXRZbf6NiT8XK2dJM?=
 =?us-ascii?Q?HqBH4WVpTDI2v6byFturh4xuEBhWtEROSuywuTG0y2c+cOLJEzXITzY0Wad9?=
 =?us-ascii?Q?ZBQHHqke9/OgzxJCVx86vBC84AEEqVM/VgM9C5l8dV7TVzpHhcE+huvwwV6j?=
 =?us-ascii?Q?s0/fklFXCwcly+wCPh2I/VXjfXuBltHUaPPdrBWyEhBPWymP2OWM3EzKmj6a?=
 =?us-ascii?Q?gsFfeZXDu0GuORQo4+VJa3j8Nvcvt1jaLJaV1k9FdpX6Y5YgpWLqKQFRLwr1?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 292f64c1-68b6-4b38-5909-08de19a303b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 00:01:46.6925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDLUvVgH3dQq3WzPIntMBeBxSbzfPlNZlcuoY/wpsooM7+s52bZdMS+TNbOUbBk3vMutjWHsYLq+QkApzZGl8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4996
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

On Fri, Oct 31, 2025 at 11:29:21AM -0700, Niranjana Vishwanathapura wrote:
> Add multi_queue_enable_mask field to the gt information structure
> which is bitmask of all engine classes with multi queue support
> enabled.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c   | 2 ++
>  drivers/gpu/drm/xe/xe_gt_types.h  | 5 +++++
>  drivers/gpu/drm/xe/xe_pci.c       | 1 +
>  drivers/gpu/drm/xe/xe_pci_types.h | 1 +
>  4 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index e91da9589c5f..34460d7ef71c 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -93,6 +93,8 @@ static int info(struct seq_file *m, void *data)
>  			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
>  		drm_printf(&p, "gt%d engine_mask 0x%llx\n", id,
>  			   gt->info.engine_mask);
> +		drm_printf(&p, "gt%d multi_queue_enable_mask 0x%x\n", id,
> +			   gt->info.multi_queue_enable_mask);
>  	}
>  
>  	xe_pm_runtime_put(xe);
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 0b525643a048..4a18bf772b22 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -140,6 +140,11 @@ struct xe_gt {
>  		u64 engine_mask;
>  		/** @info.gmdid: raw GMD_ID value from hardware */
>  		u32 gmdid;
> +		/**
> +		 * @multi_queue_enable_mask: Bitmask of engine classes with
> +		 * multi queue support enabled.
> +		 */
> +		u16 multi_queue_enable_mask;

s/multi_queue_enable_mask/multi_queue_class_enable_mask ?

Matt

>  		/** @info.id: Unique ID of this GT within the PCI Device */
>  		u8 id;
>  		/** @info.has_indirect_ring_state: GT has indirect ring state support */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6e59642e7820..b5eaf0fc105c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -754,6 +754,7 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
>  	gt->info.type = XE_GT_TYPE_MAIN;
>  	gt->info.id = tile->id * xe->info.max_gt_per_tile;
>  	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
> +	gt->info.multi_queue_enable_mask = graphics_desc->multi_queue_enable_mask;
>  	gt->info.engine_mask = graphics_desc->hw_engine_mask;
>  
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 9892c063a9c5..77e09a53da64 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -58,6 +58,7 @@ struct xe_device_desc {
>  
>  struct xe_graphics_desc {
>  	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
> +	u16 multi_queue_enable_mask; /* bitmask of engine classes which support multi queue */
>  
>  	u8 has_asid:1;
>  	u8 has_atomic_enable_pte_bit:1;
> -- 
> 2.43.0
> 
