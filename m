Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6057CC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 18:48:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2433810E9BC;
	Thu, 30 Jan 2025 18:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EIVz4tGk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C851A10E9BC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 18:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738262896; x=1769798896;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=me2yYjd0VKVRyp0i4S6S8XspZ876fLbzeWv9nCcCmh4=;
 b=EIVz4tGkgHmKd7WQJIN3/NhkupHi79EdaZJi8tEv53brVypHpkLuS1P7
 AL8rAK9NQ0tJWfQQE5cK1hYbYkBiYxoSE6Bw4GpGMkHorm6s9uuq1sSbW
 o4njt9PxzxImOMYaM5Y6d3x++FpPan440Px+h4SPPUHz+u52h8myvQike
 chXh1/EkwghfSGczPyj4W5iOGg+nutX0iQFLSuE9bhczxlw9Ax33S5k3Q
 JnO3z7dWpHmp+JL4LlrIaRZlzIOJ5POzev6cbofzAK/pp4obLNFH385or
 mjYNmvn+IZWRLZZ2uWdajvURJfhAUx8lzMotPcGLR/pGSNRLY7fDpKsXV A==;
X-CSE-ConnectionGUID: H0tZqT6LSTCuR/CJ5xhp9g==
X-CSE-MsgGUID: N7b+USGhQ2+PoBcmHQqJ8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="61296551"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="61296551"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 10:48:16 -0800
X-CSE-ConnectionGUID: cQk32/qzQVCANZqFeg4vbw==
X-CSE-MsgGUID: cAhQbyHNQguJFSI3z7fBuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140303500"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 10:48:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 10:48:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 10:48:14 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 10:48:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBmTnbzD9vkcEp9c2X9D0ZPpt2U3gcLJEv6UqDtkVZHLI1l0w9SxR5EhQKN5NqhJ0OUQsP5qlwovziBMDBYtM1hY/ZTATbEZrbz6aTjX6YD6d9+VxiYOB18pldsLCH8CFiI7o06nBsrXFS+NTCtJ2v8/CFDmgyp4e5kPw2t2wf7O4v9wmJW2nW53D0TAYdYjUVhVEno4fj8e9uVYIhLsnAm2gAJFbjmEFh4JM0YPAV3YARBE/Mgoddh4koENuZauvo/6qMy31cJbbvsMau9tJXS2VtQ2gf5104SLOpuP9PMB6XGmGiIKJM5j9GTIU2bbmucceQMmJYzAARYeMhbWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCwSpojZbpfzh6IFIWEn+b4GBXaBqPV8lVisylDUE2E=;
 b=Uc1SWbS6xeJplkWb2anLyqgLpoSEcH/TNiHk3FieaXCY1iRf2fKY2d9OLeK7fdtQLwiARMYpD6qc3xtZes6dEx41qWwnK2pU8ASCdBTwcdE5Ru/dRhEsY0etW0eUoE7e5YAkIE2uvr3AcosbPMoQs2X2jxNo7iGIIvgAbcaITJJpd9MOHSpsawbWSpX7pjyZQhpVXwvqPthPHU5Y2J7uxR5wByQ0X+ogYxoKKuI66zrkJMg7Afw6OdBOOTDHRu4o6W0W7nJOb8z/L/QBj7VbQcoU+tAqFjfVR9JmFUqKwKkbd4gUjrA8+1X2G3jkeqVEOaOX2CmGCKojiqo5DUPxwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH7PR11MB7001.namprd11.prod.outlook.com (2603:10b6:510:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 18:48:12 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 18:48:12 +0000
Date: Thu, 30 Jan 2025 12:48:07 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: s/xe_mmio_init/xe_mmio_probe_early
Message-ID: <prhev7jdw2fipymnc5bisbn6hked3dqryktevi66jjop72tgmh@4uz6cmnamgev>
References: <20250130105057.136586-1-ilia.levi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250130105057.136586-1-ilia.levi@intel.com>
X-ClientProxiedBy: MW4PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:303:6a::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH7PR11MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: 24039239-6df9-4b74-8acf-08dd415ea5af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SInzkn+TWoj3h4llwu8Jx0JY2UyRf6PzLfiN869CHjd8IvlpwmlZXHW6Bmn1?=
 =?us-ascii?Q?mJIImiwWEWDVNpSTRH4WDMPfoQU4BFYJ9mliIZtbNkn4B4i9ePeKYleuhqqc?=
 =?us-ascii?Q?M9FKXmxm+eh6D0De/k1tNr5jVy52Awc78gnVdyE/O6iNeQWtbb1xGfmRq+Xn?=
 =?us-ascii?Q?roU1UnILxpBGFDq5QZ6925VsM3t2HYVlfCujt5mGilPfusX10RhUnaRZQqaY?=
 =?us-ascii?Q?DEO7M1ao9iKLiZrDFXpXhcIs+GEGb0IuS/ZrAYvme27InTQ4wLFMoNQnmutC?=
 =?us-ascii?Q?WqEYd0I9a5kb+rER+hBUCKIETT5fOmSRC7Uc00X2E89brqo7/U4TpebnDXfP?=
 =?us-ascii?Q?v5DSvSXecRJ6JdmiybXsR0A6VKAtM0LCnooqhmZHLHTVGKq+UIEWo90cRCZR?=
 =?us-ascii?Q?GP9yK7zcclKVRpVBEtu3PVwtTwe3kTtssSjY0jxgU7VvkvhAzW+RXA2maVZW?=
 =?us-ascii?Q?bz/G/CM3D9DGrx8SFu9hRtm/z26nIjgGgJndG//JDe4WEDR+E/aS8xy5t/3d?=
 =?us-ascii?Q?EU0ep/p6QFaDV2SUWqP+rSf3bDtpeAHGDpg9jB9l4RhGSrlvua1zco2OpCBd?=
 =?us-ascii?Q?gYDYmXEwWOfo/g7mO7jfNJkr6kPH/s+wd6IyuWwkwn0LIb6g7rkvXDmJ3PE0?=
 =?us-ascii?Q?4YAd9jAPA0bvJJ++WnMIPlbHBEmDUvyV20P7cemczCMA6v5PbwrnmbJDbTUV?=
 =?us-ascii?Q?aroxXc0Tu6p9PbETqXVcEHNIJMterCMBSbktxBEi0hSRheruI7CUnuGk/oeG?=
 =?us-ascii?Q?GFcYEiL4Wsy3hLcobLHmY6jE15ee6BTqtzDv/JKQktyayC4OWoo8zFFuFItP?=
 =?us-ascii?Q?utHnzrpd78xaPbBI0QtYFLQHoNnW0bT6UOgjGW9RqlQ/ydAJdlj+g7Arkfz/?=
 =?us-ascii?Q?F8tUEL18nRpBZxelo7B+qmWmTfQV/hR47NnQEvd7GuNOVhq1JoZ6YZNp6PJu?=
 =?us-ascii?Q?k2JOH9XfYzW6TYSQg/LERmDCsIItCRyn3L0gW+HYzXyICeixuFmpKJQd33SQ?=
 =?us-ascii?Q?nyqAzoNGjuQjUuoKMzR8nWLESDRTUDij3Q+DxMpkzMqHPlzPx3aCCl8W7ViI?=
 =?us-ascii?Q?4sqQvip0EgoXi/+jiIPkVULakqPxEvgSXqDNr4S+5BAdQ5aPCJQY0BeNrN+M?=
 =?us-ascii?Q?7my+0yNoBWn+MMSBddBvghwW+xrEGMP4B2KF3JKTfKl2DACRVHFxSufT05db?=
 =?us-ascii?Q?H9x8v8p9su0Ihhroj+34fhxKZGhCjJ7jumcQL/r+i/6oojA6qOtOvxbwtCDG?=
 =?us-ascii?Q?hTRBQH0RphuSpHkrxQ1WmvJ5tUOtZVDEvzvTgK8t4uX3iKkvi+KMbaW7xfX2?=
 =?us-ascii?Q?zeqO1vH9Ljv9cOw0axq55oIfrDAgGnLS4E74CMi3KHJmcADZzdNvlErjMVxR?=
 =?us-ascii?Q?4CVNXRWQFFw5BSOoA/B++nkLBQnt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uLqp+A5sRKeyzONJ3xonps9HtkJUYMUTXUnJX73JE/+nacz+H6ha/w5hkkZ/?=
 =?us-ascii?Q?cFTDT2gvkREY9r3rrjpWyp0m1SAbQIgb9xdxhJ6wNmWJ2iTaAsf/D1a//qRs?=
 =?us-ascii?Q?07JyWIx5dZUWB2zjE4r0fP5vGv56U99gNG6t04JdC6ZQ/fK1xsPjBKTdGSo5?=
 =?us-ascii?Q?8mh3G5lt27mJM/rF8j2USzpbKFX43vJGRPpWAZpE9RF8k5li+NJwPfd5i60n?=
 =?us-ascii?Q?6ejwq4ZB2t2FTNMjjkwoPvbULdlvKIz0krEBmFK8VOfJnW1b3LxdmA5kco3e?=
 =?us-ascii?Q?UeasU43pYlnx0kvkvoZe13h2tJMnkpFwYDKfczxc5rpo4iF2/nPB7KBJ492p?=
 =?us-ascii?Q?yhs9SryFil5HVWCwqlWBaZD2CzU2GLQGRPgvKLIyigoBSxhafZ1CQSSKw+Dk?=
 =?us-ascii?Q?ZhhamF13Mm3jkRlZ4Jwr85NtVK0mqTfs0gCCMgGtF4B2ijhtWQPUQ8Q80Oas?=
 =?us-ascii?Q?s7jtUROU9nT1jHdPJBnW/VWpFbccUD17M+l3YkXsJVdOIV1jRJBS7oYhoW8R?=
 =?us-ascii?Q?hm8H2nlFUb8/xbzHRNTx1WyoOSmPuDiB2W2A/byzxf+UAjOXUz3zJa35JRVy?=
 =?us-ascii?Q?HZ2Aa/O5V0jFvwJFAUunLpWOHOOKvj4zsCOr1YyxqzB3eFGTqcK/TfIR9gI+?=
 =?us-ascii?Q?2ovTL6gVwVTznkINgF0FG4UbJFvQJHyaKfjgSIyD7aT9rKjVmDtZRMn48kE2?=
 =?us-ascii?Q?5PooiX9FY27b/fI6pWaZWYTxx3S+bPbcmcjuUMbA8a0HGb5+pVEr2L9DQBZU?=
 =?us-ascii?Q?7/JhEu35j/qjQKdagvHhTSKlDWQqa95y6XVxHbidOR/8CQrmMErTX37z67z3?=
 =?us-ascii?Q?atIcnfEeM5BD+n7SGLUJ+tID3B5PrjCjz7pdBgMKHGFpBRH4vGz4esumMN2Z?=
 =?us-ascii?Q?T4/4BkVcHBdzsZCoORHbWYoKY20SgQwmpmNBAGYBlP4hpy+5KJsLPvMVvMUi?=
 =?us-ascii?Q?tcn98Yh9/K2yZg6vKGOBI6wmRJZDBOE16LC+qGoKH0b9gpaE2u4IzteOn1N9?=
 =?us-ascii?Q?b2eS7YrIlKx2n66jU4xrGPk5L8uPJDPr3ebgQxtztFI4qGP7TBzsoximkqmx?=
 =?us-ascii?Q?l0QlmGUn6rCi2JbNKqQowRw/AiMZLvTFFGqy9Fdu8olD/lBViOViG+5y1V7g?=
 =?us-ascii?Q?pXzgzgbQjsBx3R/lwmC73c4Dv5Y0kAJq5LAnRIldvYxCHPlQkMxREtR6C0ka?=
 =?us-ascii?Q?No2PtNAm30kGL+NDGsKKxqZSaXE4QE0gXM3RGzOpslFT6kUkZf4Ed6dNhNv9?=
 =?us-ascii?Q?VuYetCX7PNx/J5UqmVrz3Xd2BBrZGbx0WbV/cYjjUYCrqntdmwQkc5cz47hP?=
 =?us-ascii?Q?xe6tU9Wl+bCipzUh0THCFJa0KIUp8a9KeHe/NQ+xUqIMo5DxMlqrIvmLlweX?=
 =?us-ascii?Q?dRYSzNORJ2smYjqdhsTu6FLOpkk+xRWZ99ABcMqsnayxzf/8wOAjLqM6fdcx?=
 =?us-ascii?Q?HNnB0iw6heAvEToiJgjEgUi24EO50SYwimBjjhwniowEJ3LyVrqylyAX5/b8?=
 =?us-ascii?Q?7osISFjVZZFiCHYxWTqNqHsxF2IJQuMWFF1hqFKUZLGcrxkpo05B84oz4kb0?=
 =?us-ascii?Q?0DUBq3ndFAwc2Vl5977sYIfrp4yb3Me7uQrT+y4wrOLwwUPrhTNWWwMTMmEO?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24039239-6df9-4b74-8acf-08dd415ea5af
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 18:48:12.1041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFYoNTArsa2/E0xe/MWsTZ17ZtMCWI4twtOjsC5mXmjPiBuiD0aapyYbjrWlbV23abFKbCBSlf1OFJwcHkmZwdEJ/zRBXyjaeGTO5ck4eOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7001
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

On Thu, Jan 30, 2025 at 12:50:56PM +0200, Ilia Levi wrote:
>Rename so that xe_mmio_init() can be used in subsequent patches to
>initialize an instance of struct xe_mmio.
>
>Signed-off-by: Ilia Levi <ilia.levi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_device.c | 2 +-
> drivers/gpu/drm/xe/xe_mmio.c   | 6 +++---
> drivers/gpu/drm/xe/xe_mmio.h   | 2 +-
> 3 files changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 8fedc72e9db4..f6c01028c527 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -685,7 +685,7 @@ int xe_device_probe_early(struct xe_device *xe)
> {
> 	int err;
>
>-	err = xe_mmio_init(xe);
>+	err = xe_mmio_probe_early(xe);
> 	if (err)
> 		return err;
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index d321a21aacf0..3aed849a128b 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -60,7 +60,7 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>
> 	/*
> 	 * Nothing to be done as tile 0 has already been setup earlier with the
>-	 * entire BAR mapped - see xe_mmio_init()
>+	 * entire BAR mapped - see xe_mmio_probe_early()
> 	 */
> 	if (xe->info.tile_count == 1)
> 		return;
>@@ -74,7 +74,7 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
> 		/*
> 		 * Although the per-tile mmio regs are not yet initialized, this
> 		 * is fine as it's going to the root tile's mmio, that's
>-		 * guaranteed to be initialized earlier in xe_mmio_init()
>+		 * guaranteed to be initialized earlier in xe_mmio_probe_early()
> 		 */
> 		mtcfg = xe_mmio_read64_2x32(mmio, XEHP_MTCFG_ADDR);
> 		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>@@ -122,7 +122,7 @@ static void mmio_fini(void *arg)
> 	root_tile->mmio.regs = NULL;
> }
>
>-int xe_mmio_init(struct xe_device *xe)
>+int xe_mmio_probe_early(struct xe_device *xe)
> {
> 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index 8a46f4006a84..b32e7ee4b23e 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -11,7 +11,7 @@
> struct xe_device;
> struct xe_reg;
>
>-int xe_mmio_init(struct xe_device *xe);
>+int xe_mmio_probe_early(struct xe_device *xe);
> int xe_mmio_probe_tiles(struct xe_device *xe);
>
> u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
>-- 
>2.43.2
>
