Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E17C52D6F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 20:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB9D10E1B6;
	Wed,  7 Aug 2024 20:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WC+c6ouj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6262810E1B6
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 20:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723061681; x=1754597681;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=98Dn/zcAr6j1iGIKN3ld69GlUNVKtn+wbxkzvUGgzA0=;
 b=WC+c6ouj5a2+6DfYTGUEKNCc4M8uxSn7BPHWX0Ipjk8qo74kjIt9rnRw
 s7RBInkmzKlF9Zp33INnltBZrpBJkZwogbdkw48jXgAmIukkvvrgfjxt7
 OsZp8syTje9xU19kC9CzObRXG3gbNLf0vIt/OpqF82THDZ4UQaE0JuwFw
 K8pB6JU/SIZUVX6jYVd4BDplSSaYSaAvi4AhfvPCbF1QviJNKD8JLvZWk
 DMJ2i4BbEZtiV51VolMew7UyWx3XoY2JY8L26oWicsjjtieXaqhh4lNag
 o+HKIVJkIZfmI7nwo61n18PvV1I4d1dc/ZbIs711gsxf5BTFFuuBUvYEK w==;
X-CSE-ConnectionGUID: yjtWRv2RSkG/fCBPYcuYfQ==
X-CSE-MsgGUID: j7oiYAT3QJi7S65nLBsQ7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24947724"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="24947724"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 13:13:57 -0700
X-CSE-ConnectionGUID: HgDR68PVS9i4ZUU3CQXtkA==
X-CSE-MsgGUID: DhoK1lq/Tu6HAvMC4sYHaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="87631217"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 13:13:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 13:13:56 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 13:13:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 13:13:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 13:13:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xM9R0GIxtY4a6t/9nwxL1g0WUL4NnRugLDSbsEh9SZhmlSTvPrRTp7GAJxLQ20jlhVeBB4hVW4XUxPurvM9MoBr+v9fb1NNvpgwN9L6iHTjMbsWROgQYMtdIyhsZONKLg1oPkiwnAz3gtsaxl9VUiwHo6jPgcccHPOglqlcgQ57OMFJIzd5mximJacHbgpHGauwAtIPHfax9oa9hk1/UygRjVrWgM7I5nfLN43qLD6MEuFSQ8SSxVGkoij0JNuja+s9yIMq3CtSWyHE3pQgSqsRmpyc/8PsfD8HStrJXLj6EqxULdP7mR2mJutZh8AyuKO+Q86sAKZi9DMluNqVdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGk6pEvK0JlOTOsfZZlDGTWYvRvNs4AWamgMxmq8i9Y=;
 b=pnU2cz2/1YqkaD585w58LpR9nmBGlywUfkpJXvXbNTeQzzKhr5Sy3Qzh1WtokHyLl3AnBkQOY1xdvp//+A3p009UDxWaETPWlsn0M+w0tu3LHdHyPMsRvD1tuxqbx4p3eSeZdmri87p1ZuT6Dy1YjLi6nP6Q/k/0LfK3/ixrO0XuvVd9F1U9SYH3YpeROYvy7Fqa1vcRiLbb8S8e1qKn8Ka1shPrTQLilXmbMttjooWm0Y0m+rPhO2sf9n2mfLlL2TMwMztCYMPAmOgtfG7KfafBky96XC9p01ipd3xSYv66+kxLQOoq/BS7U/skEMvkuTdHnBkbm2tmO5Xs+6evqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7244.namprd11.prod.outlook.com (2603:10b6:930:97::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 20:13:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 20:13:52 +0000
Date: Wed, 7 Aug 2024 15:13:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Julia Filipchuk
 <julia.filipchuk@intel.com>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH v5] drm/xe/guc: Enable w/a 14022293748 and 22019794406
Message-ID: <ze766egvydeczgxmgquj7goft52qgkugswlqxkgzgfc4dbct4m@e475pa2pd32g>
References: <20240805205435.921921-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240805205435.921921-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW3PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:303:2a::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 786cb142-67c7-490d-eae8-08dcb71d7517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6wnfesXbcsSZVNWvUd/+VC9lSDORfG9Nzs0MB83ARQxxcu2GtEDXuX7dsOIi?=
 =?us-ascii?Q?/gAGtsYRFZBK4Z5asIVc8T4uiy4LjmxaVDwApjDCFTqficzv5kNhJlAFGTJ8?=
 =?us-ascii?Q?vCPHRwECgDnhrdXqZuBDCvD5L6XHXFfAV82UVV7wc04KntUOd8+ucRXRUd9G?=
 =?us-ascii?Q?ZqPTHl1ux0g53NFNmlHr9PiQPDXWOq31vv0+QPdtjSXUxr7hJ9V6kBS5cf0d?=
 =?us-ascii?Q?qzg9Wuc7e1B7xui1wffPu633jEVrE1djN8wCV+d0cQMNliCCV1ZXxDdke8Nz?=
 =?us-ascii?Q?mwCPl9pE4WDb2TKPSZ0TuyWo3Kf4zXXgK0BTekmzPZOkX4hd4XoLZkUaHSBV?=
 =?us-ascii?Q?uYrQE/jsxQmMpVI3NlqKMmzhKRHb/lHMTs73JSWTDQUAPu6moJw9QUmDa9Yd?=
 =?us-ascii?Q?VDO7jPLsJJ/I9G+cUghBttctjRBus9q2BzVbNaNx0MTSPCRVenXFigc4iKUp?=
 =?us-ascii?Q?HI8KlHkn8oapbzX6VgSuJngDbXpK/XQ2Xin5D/5UR1oovDr/6t4FdE/segYR?=
 =?us-ascii?Q?ARqO9BfCTAGOAxBvTBABR4YL3ikPaZ8cZMMw5hFhvJzyoy6NSzHZVi1T1Z/Z?=
 =?us-ascii?Q?yJtm4iEJe+lvr1twv4uNrR1+AaDmHgipgQ3DCtPwlQQ0cVC8jgJLcdp1e0ot?=
 =?us-ascii?Q?zjmYjv0fLh+XiHS/TuOQYJpxmQb6jfSccrL9zZz83y8stWHIyNwmxZO0kFvb?=
 =?us-ascii?Q?dTEHa5wit0zGpPEnXDQu/5AsSoRd1tlHclUa7Re+84bMGfWeez3gSwp3vvmf?=
 =?us-ascii?Q?W2C0WGip1uoFvOJ+NUq3FL8t6AOzGR9Rw/wdPimT5iGhJC53kmhnJj7w0Kb4?=
 =?us-ascii?Q?UXc08HZjkJsLdUJiKrQTBXgjgd/hmIrrZ6DJ4RBOYG/O+5AWVkLANXHgvL/S?=
 =?us-ascii?Q?tv7jeZwh3wKaWOFxk/7zreRb94zkZbpwBC2I0bwpAUTt5EreeI5AsRp/e+AQ?=
 =?us-ascii?Q?EG66e7xZ4KuUMgC5ICsQp7XgzvyuicxMbLj9TZoWZVN+PumDhi2WPfvDOU7z?=
 =?us-ascii?Q?TzOaxfBB3ugL/8/aFUSNzd8SyH1oCeAXw+2R9/0dwsbkHjoQgcdhdb7z/7BG?=
 =?us-ascii?Q?CKorI7kw3yygo0SkaXKze5IYzjwUgujWmc3P/MqsXTWRdHMR0CaHnPfRo0HZ?=
 =?us-ascii?Q?iDa2qi9HF52kqx5+aUTTX2aNiPUp9sR1ccpXu6qtFus3zIE63Yab6e/oiC6c?=
 =?us-ascii?Q?pzud4ZGxIP6nF7kh3ijY/t9McEkGQJz2lym74lvWu6pLyd0p+Y6X5pLMz9Ab?=
 =?us-ascii?Q?hiSRSp3MloeXBXn3h3GP460TXDrNOaycBhT+oZV3IVhsGh/tTdMKrMXf4AJ8?=
 =?us-ascii?Q?gxwT6pGX680NaKDypQPlmD0L9rbAqNKw7VTXPg+zYVkeQg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2hXHuCpxG7Ce9XzZpSHCxWMFywGwjNDuw5kvTEhvjO02nZ9aRzTXhS2olN87?=
 =?us-ascii?Q?VKlgxkJt4VE4h/WN+oKOBTu/juEhVxMhb4LXKjc2a+jSsA9u5+hZFgqcflGH?=
 =?us-ascii?Q?JZ1rVlw//onPEfLpJKK5aLmRWPG6Ny2aOExa7HPn2OY3Pdw0Zedq50Be8egd?=
 =?us-ascii?Q?eYxXRtf0JQlnVobQzD2ASSu0qVznog49C2X+nWTg5I24vUW9OnE7ZfVUSX4W?=
 =?us-ascii?Q?C+gMS0lqU5cxAfvLdpNsC6M1KEpHsEcQCP6OCeAo2rv27Iy77/6bT46WnHpJ?=
 =?us-ascii?Q?UcYoDtjc//SSU0pqeUmgZFCTGWkl3IEOpZxjoFyBc/fkNMxOCmW9snR49OIC?=
 =?us-ascii?Q?wieHH+TBqgmgRtiIA2aKH/7Wpw8rsYXh6gcrvbjDHkeNT3mxtQ8th9/wW1MK?=
 =?us-ascii?Q?iXupGoPF8sXembabopPEu2y4KG8yTeFIwkbWQ3xZ91Kq0oobJOjfno4plz+j?=
 =?us-ascii?Q?R7TXk1lHRcLHs9jVy+mDTsxvL2ZQt6v2L7EDjv8h8NlndN6ZUSC1IfrJJETF?=
 =?us-ascii?Q?Cj/X+tW6r/YG2UIORZU+dJ1i1hEttaMI5oJS94sPsyNTlg1o+EHmv0gQ9E68?=
 =?us-ascii?Q?KDn5RQXWvd5H+7g10iMWxbr1tNDYl4hNJlQdmKLFuD53ESu6bR8WDPeOm5yd?=
 =?us-ascii?Q?kWHPBMdLSUizIasE7eteNkRb4zHJ6cU+OzBNSkY8351hetVVg+sx5Q/Lie1K?=
 =?us-ascii?Q?wgEUlg+eKVZEv7BzA90V3d87SzkLrTbXO7/LyJko+qTQ6xkZKxxnCQKEtHzN?=
 =?us-ascii?Q?10As+42T7NAiGvxgD77yACtygUeE2H9mdaIA9fylgBAmit/xUUVb2oi55ziS?=
 =?us-ascii?Q?sUGyezZMBJkUFpXyv5PBFP6jJroWFOxKUcogwTyYYCaS3gM/7jq7IqDwkknQ?=
 =?us-ascii?Q?qSVGxPWCUir4SdIw/nJB9XsCQZWXU/4BGMBR9cbOWn0NnigmzM82wuQENTx0?=
 =?us-ascii?Q?NRsMnMV5ZZ0KgEd88Fe5gQO+voW6+2cW81GTrGb/KblQbJKa6Zf4rKVBmv2a?=
 =?us-ascii?Q?/Lpu3qwUNV6o2x71NUu5HHtag/mOu21WjbSE778jy9gVeVMYZsaGNgoRCA6Q?=
 =?us-ascii?Q?aaD0TNKO0Vf+M2KNIj4JAUCyd2TZP4IwvzKk9fpi6s58VIKqNfMocb+xcAm9?=
 =?us-ascii?Q?jzmiedOHKQzdNtB6Fns64Qe4lJjTqKsB/pBKDZASLfPvfKUisc0dDKE2m8Ka?=
 =?us-ascii?Q?Ki97fJFOhxpENix+3ICfcqcckXkjk1IKW1Ykji+h5lb2bWordGU4w0YMSXz2?=
 =?us-ascii?Q?sWDOoWoUwy/cxWbMYMU5Fpl9/W58hWSVUYzQGP5fie0YOvkBxaYxCtDepv/t?=
 =?us-ascii?Q?viRBoEZ4iCsiRfBq923TzTipwwVEsgTo/kdfGnyYChDbszEq85N+PR0CuBBK?=
 =?us-ascii?Q?Du7Za2/Pi4+MztQP8MKk4VjWkfFhjLNQwBLdfKl67NSQtcjsQHIY3BhQH0D8?=
 =?us-ascii?Q?nIbSXa8M53Hjcf36sCqfiKpTYvAnPR7xQQJC/J1FTCDkD4UCO8dVJYnkuxuN?=
 =?us-ascii?Q?sRrV+2Un1KEtfS4fuMsYadYf3Qgr/CjMnpHMZ5BuHnsQ06SirLE8mttfMciE?=
 =?us-ascii?Q?F/JjX5tq1WQz6G6fUXtlX6lwmV4jIS+uZK5IRyA1sk7YDCvMoFsBnbiiGHbi?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 786cb142-67c7-490d-eae8-08dcb71d7517
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 20:13:52.8291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAHYbLaGqQ4uLInLaAY0YiZr0lXC4ZGi3odpesHq7gxJSUa0Ec0pvhsS4Gzj68Bz2fyi6rs3B6Ssk4dIySvc3lmGEBiunnw48rbfrkfZLco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7244
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

On Mon, Aug 05, 2024 at 01:54:35PM GMT, Daniele Ceraolo Spurio wrote:
>From: Julia Filipchuk <julia.filipchuk@intel.com>
>
>Enable workarounds for HW bug where render engine reset fails. Given
>that we're bumping the minimun required GuC version to 70.29, we're
>guaranteed to always have support for this KLV in the GuC.
>
>v2: Enable KLV correctly for either workaround (Lucas)
>v4: Add check for minimum supported GuC firmware version. Enable w/a for
>hw version 20.01 too. (Daniele)
>v5 (Daniele): remove now unneeded fw type and version checks (JohnH)
>
>Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
> drivers/gpu/drm/xe/xe_guc_ads.c       | 6 ++++++
> drivers/gpu/drm/xe/xe_wa_oob.rules    | 4 ++++
> 3 files changed, 11 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>index 8f9f60b28306..6b30743a2f6c 100644
>--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>@@ -351,6 +351,7 @@ enum xe_guc_klv_ids {
> 	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
> 	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
> 	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
>+	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
> };
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index 1c60b685dbc6..d1902a8581ca 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -24,6 +24,7 @@
> #include "xe_map.h"
> #include "xe_mmio.h"
> #include "xe_platform_types.h"
>+#include "xe_uc_fw.h"
> #include "xe_wa.h"
>
> /* Slack of a few additional entries per engine */
>@@ -367,6 +368,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
> 					  0xC40,
> 					  &offset, &remain);
>
>+	if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
>+		guc_waklv_enable_simple(ads,
>+					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
>+					&offset, &remain);
>+
> 	size = guc_ads_waklv_size(ads) - remain;
> 	if (!size)
> 		return;
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>index 540d38603f32..5cf27ff27ce6 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -27,6 +27,10 @@
> 16022287689	GRAPHICS_VERSION(2001)
> 		GRAPHICS_VERSION(2004)
> 13011645652	GRAPHICS_VERSION(2004)
>+14022293748	GRAPHICS_VERSION(2001)
>+		GRAPHICS_VERSION(2004)
>+22019794406	GRAPHICS_VERSION(2001)
>+		GRAPHICS_VERSION(2004)
> 22019338487	MEDIA_VERSION(2000)
> 		GRAPHICS_VERSION(2001)
> 22019338487_display	PLATFORM(LUNARLAKE)
>-- 
>2.43.0
>
