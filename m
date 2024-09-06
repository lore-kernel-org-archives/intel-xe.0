Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B267E6FE4B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 22:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA89910EB1F;
	Fri,  6 Sep 2024 22:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IjjXOpha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098AD10EB1F
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 22:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725662684; x=1757198684;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qQWCRDQ0sBJvSeRTpdPqagPR6o/8eyWgrXWCiuesxZI=;
 b=IjjXOpha2HKXb19F4oNkZgAr/2eBMkSbowe0kteJPQDLo7iihEcftSXe
 rI/QyLh4X8b7uAd8lA5vhRMHwOFn2nSaVCdkxSGFWioZAuXJ2HsM4YkpD
 wKrMLe+XiPV2mlp3WP0ZZm9SCgGNk61SI+qP1cnRMB+HQ6movNRMMVuMt
 2KKkMxlozIa7hZjjoPN45RD3HYks5E7XgO0HPeKmQkzoGN0gJfITOE3lT
 ucRQLyjVjJjRr+XERebmvc/OzF+GVhvFRGbTujJ069bow1W/4jTglj8JD
 /V6SIJxOXGjbbDjr/utDFbOTwnRMmVk//MBiF6g1WGii5rU6G5anN0rM7 A==;
X-CSE-ConnectionGUID: JhrjQQTxSne3KjR9W3a7kQ==
X-CSE-MsgGUID: Te9ofWY3SFeo/va3WPaznQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="13416242"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="13416242"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 15:44:44 -0700
X-CSE-ConnectionGUID: ruOw5SGSTsOxxq9AfQl/Qg==
X-CSE-MsgGUID: aB38OxGcSUCOWB3ipR3GWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="96797243"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 15:44:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 15:44:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 15:44:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 15:44:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uktqEY5bvTNtYOcqkFxE65knvQAU6Q3+0wlIWDANYge6bCXlzyTc56xMVrsDZ+yMLPVjN9JG78jctQ590fHGfzT1ORlotDJ48TVPE2pdSV/UsyQSXd7S3oRp8pSJQergyAwpyzR/Sqcl3skCFvORoaN+9zWzqtYFjAX32cYAVppyjHFIfhLd3f6fuWJed2Eed89LES/r1Umiz+/+5ZSaXdGidJhaTeulzVlaV3RalchLFGXXQfcBHHmRSM84NeXfL51UCwDdStBjRfCguzIYj5UCQTGKnfOge37f0+FnL9NwVpDxNx2fQg9Qdb+Y23X3GpYR2XNqlo4APuh6pVvf8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWwASc/eSYK0CrQXCBqL5iEzVv7AxqlMDL4LNXnZbn8=;
 b=LRe30hV2X5wUxtz801Iw8FqqgNzYx6+ETgn0w8bqhRem+aBztHau0Yprlvn60RHnNhYRr3gjN3l9y7emIfKZi5GPbeDmJmrDwVZHArwctyFmpTUxqYYvVd4q8eLOrpSltkiZ7wGrpJi/SToQ0ogglvf0AkqX5o7skJx5pmbmRqsasXe4sjp4zlV/O6DIJvMsEYn1EnuF7WVyUZDPtbh0xYb8c0D3BlQ5kOaz0XH/GL5GI91mANTozEsrh/vxdATIpqAQSbOLAXXG1nARsZoAuTbB3mX5SE+uvWit74x4DN3EDkYaClAVmuNGq1RwbLIY1G5vXR2MXoFZeAhWWC8YvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7532.namprd11.prod.outlook.com (2603:10b6:8:147::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 22:44:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 22:44:39 +0000
Date: Fri, 6 Sep 2024 15:44:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Koby Elbaz <kelbaz@habana.ai>
Subject: Re: [PATCH 09/43] drm/xe: Switch MMIO interface to take xe_mmio
 instead of xe_gt
Message-ID: <20240906224436.GJ5091@mdroper-desk1.amr.corp.intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-54-matthew.d.roper@intel.com>
 <khpssae3waxmeofpm4t4vxvc2bkbadgrn5nts2gkal4yonofq5@bdbbq465bz2e>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <khpssae3waxmeofpm4t4vxvc2bkbadgrn5nts2gkal4yonofq5@bdbbq465bz2e>
X-ClientProxiedBy: BYAPR02CA0052.namprd02.prod.outlook.com
 (2603:10b6:a03:54::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f4edde-2064-4338-7501-08dccec57de4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Iev4NYeaieiM28PwjgmqSi7650D7h8IYnKKq3j8dj210I7Nltk4qaiLpTBN2?=
 =?us-ascii?Q?hHPspnXLDEeFarUkOgow0Z/FlhgxhE1LXUZ2g64LqxccdrZWq9BYg/WomwKC?=
 =?us-ascii?Q?SPsaYCs6Ae5NLWENRz0usEUAsj65aAq5nmBGG6Fz7EOpQ7Kk3akhKudqWn22?=
 =?us-ascii?Q?HeeGJnPbU5PSI++dtHSO2LlUqIK1rHPWsQPgjE234qLcKD8N25GoiDieBlXS?=
 =?us-ascii?Q?zo9FuTzij2CdZacQS6riRq5XWM9WKL+VjRh1XNQ7qnMAWXMVRNfNPVwWq4QT?=
 =?us-ascii?Q?IDkgn6kq35J7Sby1xPZuFDApJKsSVQY/wA8BGPaD/DN36Va6Hkb54KTWoPhb?=
 =?us-ascii?Q?6e4iOlnGBFrgb7lLBdDGEQKXzA/Tf/bRKHgPSkNzq8Mu5cdS6ShnWl9mnNS7?=
 =?us-ascii?Q?A6Yhp8S81/IlFPvYx1dmcvfwn85/Q+7p2daCahsluUiz+QPPWX2PeYtc9/Yw?=
 =?us-ascii?Q?hcbQ4l7oK8myA/XXfoC1jACiCSuAaL60Lhb2H6B1843Vod4oNHSEYVvI5fRf?=
 =?us-ascii?Q?m5s6zkK29YeIfipdwj5xtSEE5EpjdYN9ttSDcBzZu0jd9Lkd0sTbreQpNifF?=
 =?us-ascii?Q?MFSxm9kRY0sj9Oj63jYW3eP3ikPzaMLrqRZBX/aSRRkfg2bfFObMJGzn7oSD?=
 =?us-ascii?Q?JkR0QK4/GtQyfl3/5AfBovVuGPcmXvFC8QngI3vhGM2ry2/Sr1Wejur4JLYX?=
 =?us-ascii?Q?A/cUONmhGMr9tsH8WPegTY5s+JoJM8OnBJ13638B/x813LrAzDT+nELrCnQk?=
 =?us-ascii?Q?FBBq5rqLTXxgbWAq1R6UzFgA+m7WDWmDTF9ml+3PDb+TeqQ3fNwZrMDb3b+8?=
 =?us-ascii?Q?couSijr9oI+mmSBuc/krsG6FbQMQFXT+m9/QsyKhtsX9AyyY38p3XMH3aoMg?=
 =?us-ascii?Q?aBq6/OsO+ottCJzsUgK7skm8pRM+YMJtstbfcy31VZKt918jmhFtbrOQ7qON?=
 =?us-ascii?Q?aKjRc/DD0hKWcDyzmjETx8DyCtEJJgwNUuDPdVabhBeCWc1novTB8z6l2tUA?=
 =?us-ascii?Q?r1y9lKqA3RoYxXq/juhuUk+J3bYqVL6U9m6ErAKnJKoAAY4p/ykinzoKff1N?=
 =?us-ascii?Q?Oh1nQNam+Ww8lXVKJK5n27/olwKqij5z+nN+J/5glNGB9P42MsCCuPf3RFj6?=
 =?us-ascii?Q?unh6iGPfK0rP15sweUUfEAggEgdOkVp81OTMc6e9yCHgRNyBr9R4LjGISHvc?=
 =?us-ascii?Q?MXtxchUEMUL+CPGkuSaZtx8FnqXgGpPk9UsDoySb8VRWgjd1Y7QgpkUBS6Rn?=
 =?us-ascii?Q?1ekEp7InDTkUPBDFfdJsQvnDutFzBof94kQqMcoaG2c6qfZLwcuoDa/QhNbc?=
 =?us-ascii?Q?iBzv06YND7Sdr02+0+ii+S+8yO4jwk1ImSWoOFywCHE1Mw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NG0jqEMCm0WwrM6Fnk0y1jqy3vFudLEGDyUa9bEdo5Q3oqq8L68857eW/LRX?=
 =?us-ascii?Q?J7zIF9CPePGaTFn5dvXGIhY87cQdmEsOhsk9oxrIPzlo3zd/iEi5mEoDHR1d?=
 =?us-ascii?Q?1iG27LoRUAkgKZyxLdLbM+WBBZN9QTl3YHBatnSBDD5nuchTMsQ8INUjWDYd?=
 =?us-ascii?Q?V6/swtjHp/Tv080vvX6bWZ9iZ3sWgNIRxGX++aLKBNdO0YSLLssLndW+Ox9M?=
 =?us-ascii?Q?BtZ8C3BzjtI6Amd86MWwmi8BwrbBRCF0HOneH5mKOyrpYSlW/uZkL37RncaV?=
 =?us-ascii?Q?F367dfiJ/crIWaOYGQnx3Few7MaeL9/AIc5UuZnf4V+/n07OSMczRrCrjLnb?=
 =?us-ascii?Q?rqxtgm7sL8E1CHGAkW8d764fLGmg9j920zgvSM/hufF9cNAuZpVo25OF0b3X?=
 =?us-ascii?Q?CqK3rWi4KLUUiLlYSnhZKwMkqexWb1+GUpBMFIzfjUpK+vYKkn0A21Vl9STB?=
 =?us-ascii?Q?hhn7V8GywQcwdX6i+Qu0ydEVIVaLZN8/28qhkDdaes0AC7xbfePCABXjxLjc?=
 =?us-ascii?Q?T2OqdzKy1mPtumcipaDATq8NYWeeb8eJZhJJ5vdBqQCYTH/sDFINEojMWq8E?=
 =?us-ascii?Q?C+LjlSYcnqdV+GCmgQnieYkAOgNsP9yPJz0HUVu6fX/6P7WXuHzVNc3NQEeh?=
 =?us-ascii?Q?cFGuzmWIfJLPQqstw3o55v9P9FzLYABYqPOb5oDyFac7rmEfxx7OmLsNGc7h?=
 =?us-ascii?Q?NJR+nJapNBPr3x1lNAjOuiZE23EEqqJhbiKWqNv15iCGwn2v1vjzSmHkN3oO?=
 =?us-ascii?Q?yvyhCiGYQ5hAli6lwg6NpXAC33uD803Hgnzy4urTsgpzk6k0KKZM7oVE5uHB?=
 =?us-ascii?Q?fqDYLLfQPme0DaUVWc8fGifsYXM2Lw6dLbiEei32Iq/EhlcBvZNMAK82b9by?=
 =?us-ascii?Q?5HBZ3sRNOzp9EQpahpWYTb79nLUNsGvOEnzZ3Czz5hExNIivhOcOW2HRkFlv?=
 =?us-ascii?Q?cchKa4nkwWdcP8OwHHbz5zqk2P0QNNvJcv3Uvl4r7PMXLx0EtbWIUnUzgCdh?=
 =?us-ascii?Q?tPjArpK/i8BH2yM6/0Rto7hm9gxivI/3MYBwWPF6lJe06jbHouuWGVWmQMcG?=
 =?us-ascii?Q?LEUDSnvE1NCwXOY8CU9L8gHU7sT3JOeMXPGgMTfrs4ObpbHiBFHgbTp5zUJZ?=
 =?us-ascii?Q?e01G4PZWTxl8khENSEJMtRxHg1aXnnFtUKMU8fZSZdHi12T+TZbosvor6z1b?=
 =?us-ascii?Q?Zc+cL2/VG8mCW/bQSyo/7RzvtisrvnG2FR2hewG0RgxiGh0EhO/pa5oIE4yD?=
 =?us-ascii?Q?g+Ysz763Uf7X9ZBNU6CbqKJcV8l5P+ofqYLCs02YmnbuGUo9H/qKI0PJmn3h?=
 =?us-ascii?Q?cYoVrtoYYTZ0HfSyoCqQ8JZykPdE4/eiBdT/GlCmvqGW7oN9Ut750LL0uR6k?=
 =?us-ascii?Q?0tRQe9H9L291ngHavzKiWu1KcSK33gC3JnwM7ANSmZxb3TgQMV4giy/XTwes?=
 =?us-ascii?Q?Pt+fwhmsgNbmo3iYzIKZQFl/KvqKvQVj/NEYdm133ReK9tVCpKl/K5VfxrY5?=
 =?us-ascii?Q?+54wbnevJ27TnIhRshZxQy8AC6OeldK7nVkMzV1xfMZ+HeygcZWVXQsAbOhO?=
 =?us-ascii?Q?3Bk7Ww/5TZUmFZvi4h9ay1Re95DiXaVcga05r+YGabChoWg5rK4WEuNZa/05?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f4edde-2064-4338-7501-08dccec57de4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 22:44:39.6925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VhzfHV2atyprPYAkLlg8XnZhkTlbJyoQn6SiWGJOvN/UyuhhCw3xskJ03vQjUt4PPEgjGy2wuZJ57x4iHbH+wl4CTkcLu00UkC17JY2vTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7532
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

On Thu, Sep 05, 2024 at 10:44:53PM -0500, Lucas De Marchi wrote:
> On Tue, Sep 03, 2024 at 05:21:10PM GMT, Matt Roper wrote:
> > Since much of the MMIO register access done by the driver is to non-GT
> > registers, use of 'xe_gt' in these interfaces has been a long-standing
> > design flaw that's been hard to disentangle.
> > 
> > To avoid a flag day across the whole driver, munge the function names
> > and add temporary compatibility macros with the original function names
> > that can accept either the new xe_mmio or the old xe_gt structure as a
> > parameter.  This will allow us to slowly convert parts of the driver
> > over to the new interface independently.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_mmio.c  | 131 ++++++++++++++++------------------
> > drivers/gpu/drm/xe/xe_mmio.h  |  76 +++++++++++++++-----
> > drivers/gpu/drm/xe/xe_trace.h |   6 +-
> > 3 files changed, 125 insertions(+), 88 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index 8068663e7d28..92f0bda0ae30 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -67,16 +67,16 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
> > 
> > 	/* Possibly override number of tile based on configuration register */
> > 	if (!xe->info.skip_mtcfg) {
> > -		struct xe_gt *gt = xe_root_mmio_gt(xe);
> > +		struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > 		u8 tile_count;
> > 		u32 mtcfg;
> > 
> > 		/*
> > 		 * Although the per-tile mmio regs are not yet initialized, this
> > -		 * is fine as it's going to the root gt, that's guaranteed to be
> > -		 * initialized earlier in xe_mmio_init()
> > +		 * is fine as it's going to the root tile's mmio, that's
> > +		 * guaranteed to be initialized earlier in xe_mmio_init()
> > 		 */
> > -		mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
> > +		mtcfg = xe_mmio_read64_2x32(mmio, XEHP_MTCFG_ADDR);
> > 		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
> > 
> > 		if (tile_count < xe->info.tile_count) {
> > @@ -187,116 +187,111 @@ int xe_mmio_init(struct xe_device *xe)
> > 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
> > }
> > 
> > -static void mmio_flush_pending_writes(struct xe_gt *gt)
> > +static void mmio_flush_pending_writes(struct xe_mmio *mmio)
> > {
> > #define DUMMY_REG_OFFSET	0x130030
> > -	struct xe_tile *tile = gt_to_tile(gt);
> > 	int i;
> > 
> > -	if (tile->xe->info.platform != XE_LUNARLAKE)
> > +	if (mmio->xe->info.platform != XE_LUNARLAKE)
> > 		return;
> > 
> > 	/* 4 dummy writes */
> > 	for (i = 0; i < 4; i++)
> > -		writel(0, tile->mmio.regs + DUMMY_REG_OFFSET);
> > +		writel(0, mmio->regs + DUMMY_REG_OFFSET);
> > }
> > 
> > -u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > +u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
> > {
> > -	struct xe_tile *tile = gt_to_tile(gt);
> > -	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> > +	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> > 	u8 val;
> > 
> > 	/* Wa_15015404425 */
> > -	mmio_flush_pending_writes(gt);
> > +	mmio_flush_pending_writes(mmio);
> > 
> > -	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> 
> not sure I understand the plan to replace this. This previously worked
> by checking what is the type of the register we have declared and
> redirect the access to the other region.
> 
> Do you think we'd rather use the separate mmio object in the caller like
> below?
> 
> 	xe_mmio_read8(tile->mmio_ext, A_REG_WITH_EXT_MMIO_SET)

Yes, now that mmio_ext is a separate MMIO target (which will probably
either use a completely different base pointer into the tile's existing
iomap, or might even use a completely separate iomap), there's no need
to detect "extended" registers at this point anymore for regular,
non-debug builds.  They just take the base pointer from the appropriate
xe_mmio structure and then add the register offset from the xe_reg.

As mentioned elsewhere, there will be a follow-up series that adds extra
sanity checks to debug builds to catch accidental misuse.  One of those
checks will be adding a flag to the mmio_ext structure that turns on
checks to make sure reads/writes only happen for registers that also
have the appropriate flag set.  So debug builds will warn if they see

        xe_mmio_read32(tile->mmio_ext, REG_WITHOUT_EXT_FLAG);

or

        xe_mmio_read32(tile->mmio, REG_WITH_EXT_FLAG);


BTW, we'll probably need to kill off the "ext" naming too.
tile->mmio_ext should probably become something like "tile->foo_mmio"
where "foo" accurately reflects the specific unit that the map is for.
And there can potentially be other "tile->bar_mmio" or "xe->baz_mmio"
targets as well if this infrastructure needs to be used for multiple
register regions that fall outside our traditional gttmmadr registers.


Matt

> 
> ?
> 
> Then maybe we could have a field in struct xe_mmio that we can xe_assert
> with the type of register being passed... ?
> 
> This does look like a more elegant solution. As we don't have any users
> for that, this is entirely delegated for when the users show up.
> 
> Cc Koby
> 
> Lucas De Marchi
> 
> > -	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
> > +	val = readb(mmio->regs + addr);
> > +	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
> > 
> > 	return val;
> > }
> > 
> > -u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
> > +u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
> > {
> > -	struct xe_tile *tile = gt_to_tile(gt);
> > -	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> > +	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> > 	u16 val;
> > 
> > 	/* Wa_15015404425 */
> > -	mmio_flush_pending_writes(gt);
> > +	mmio_flush_pending_writes(mmio);
> > 
> > -	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> > -	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
> > +	val = readw(mmio->regs + addr);
> > +	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
> > 
> > 	return val;
> > }
> > 
> > -void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> > +void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
> > {
> > -	struct xe_tile *tile = gt_to_tile(gt);
> > -	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> > +	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> > 
> > -	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
> > +	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
> > 
> > -	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
> > -		xe_gt_sriov_vf_write32(gt->mmio.sriov_vf, reg, val);
> > +	if (!reg.vf && mmio->sriov_vf)
> > +		xe_gt_sriov_vf_write32(mmio->sriov_vf, reg, val);
> > 	else
> > -		writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> > +		writel(val, mmio->regs + addr);
> > }
> > 
> > -u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> > +u32 __xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
> > {
> > -	struct xe_tile *tile = gt_to_tile(gt);
> > -	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> > +	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> > 	u32 val;
> > 
> > 	/* Wa_15015404425 */
> > -	mmio_flush_pending_writes(gt);
> > +	mmio_flush_pending_writes(mmio);
> > 
> > -	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
> > -		val = xe_gt_sriov_vf_read32(gt->mmio.sriov_vf, reg);
> > +	if (!reg.vf && mmio->sriov_vf)
> > +		val = xe_gt_sriov_vf_read32(mmio->sriov_vf, reg);
> > 	else
> > -		val = readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> > +		val = readl(mmio->regs + addr);
> > 
> > -	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
> > +	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
> > 
> > 	return val;
> > }
> > 
> > -u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
> > +u32 __xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set)
> > {
> > 	u32 old, reg_val;
> > 
> > -	old = xe_mmio_read32(gt, reg);
> > +	old = xe_mmio_read32(mmio, reg);
> > 	reg_val = (old & ~clr) | set;
> > -	xe_mmio_write32(gt, reg, reg_val);
> > +	xe_mmio_write32(mmio, reg, reg_val);
> > 
> > 	return old;
> > }
> > 
> > -int xe_mmio_write32_and_verify(struct xe_gt *gt,
> > -			       struct xe_reg reg, u32 val, u32 mask, u32 eval)
> > +int __xe_mmio_write32_and_verify(struct xe_mmio *mmio,
> > +				 struct xe_reg reg, u32 val, u32 mask, u32 eval)
> > {
> > 	u32 reg_val;
> > 
> > -	xe_mmio_write32(gt, reg, val);
> > -	reg_val = xe_mmio_read32(gt, reg);
> > +	xe_mmio_write32(mmio, reg, val);
> > +	reg_val = xe_mmio_read32(mmio, reg);
> > 
> > 	return (reg_val & mask) != eval ? -EINVAL : 0;
> > }
> > 
> > -bool xe_mmio_in_range(const struct xe_gt *gt,
> > -		      const struct xe_mmio_range *range,
> > -		      struct xe_reg reg)
> > +bool __xe_mmio_in_range(const struct xe_mmio *mmio,
> > +			const struct xe_mmio_range *range,
> > +			struct xe_reg reg)
> > {
> > -	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> > +	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> > 
> > 	return range && addr >= range->start && addr <= range->end;
> > }
> > 
> > /**
> >  * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
> > - * @gt: MMIO target GT
> > + * @mmio: MMIO target
> >  * @reg: register to read value from
> >  *
> >  * Although Intel GPUs have some 64-bit registers, the hardware officially
> > @@ -316,21 +311,21 @@ bool xe_mmio_in_range(const struct xe_gt *gt,
> >  *
> >  * Returns the value of the 64-bit register.
> >  */
> > -u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
> > +u64 __xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
> > {
> > 	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
> > 	u32 ldw, udw, oldudw, retries;
> > 
> > -	reg.addr = xe_mmio_adjusted_addr(gt, reg.addr);
> > -	reg_udw.addr = xe_mmio_adjusted_addr(gt, reg_udw.addr);
> > +	reg.addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> > +	reg_udw.addr = xe_mmio_adjusted_addr(mmio, reg_udw.addr);
> > 
> > 	/* we shouldn't adjust just one register address */
> > -	xe_gt_assert(gt, reg_udw.addr == reg.addr + 0x4);
> > +	xe_assert(mmio->xe, reg_udw.addr == reg.addr + 0x4);
> > 
> > -	oldudw = xe_mmio_read32(gt, reg_udw);
> > +	oldudw = xe_mmio_read32(mmio, reg_udw);
> > 	for (retries = 5; retries; --retries) {
> > -		ldw = xe_mmio_read32(gt, reg);
> > -		udw = xe_mmio_read32(gt, reg_udw);
> > +		ldw = xe_mmio_read32(mmio, reg);
> > +		udw = xe_mmio_read32(mmio, reg_udw);
> > 
> > 		if (udw == oldudw)
> > 			break;
> > @@ -338,14 +333,14 @@ u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
> > 		oldudw = udw;
> > 	}
> > 
> > -	xe_gt_WARN(gt, retries == 0,
> > -		   "64-bit read of %#x did not stabilize\n", reg.addr);
> > +	drm_WARN(&mmio->xe->drm, retries == 0,
> > +		 "64-bit read of %#x did not stabilize\n", reg.addr);
> > 
> > 	return (u64)udw << 32 | ldw;
> > }
> > 
> > -static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> > -			    u32 *out_val, bool atomic, bool expect_match)
> > +static int ____xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> > +			      u32 *out_val, bool atomic, bool expect_match)
> > {
> > 	ktime_t cur = ktime_get_raw();
> > 	const ktime_t end = ktime_add_us(cur, timeout_us);
> > @@ -355,7 +350,7 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
> > 	bool check;
> > 
> > 	for (;;) {
> > -		read = xe_mmio_read32(gt, reg);
> > +		read = xe_mmio_read32(mmio, reg);
> > 
> > 		check = (read & mask) == val;
> > 		if (!expect_match)
> > @@ -381,7 +376,7 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
> > 	}
> > 
> > 	if (ret != 0) {
> > -		read = xe_mmio_read32(gt, reg);
> > +		read = xe_mmio_read32(mmio, reg);
> > 
> > 		check = (read & mask) == val;
> > 		if (!expect_match)
> > @@ -399,7 +394,7 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
> > 
> > /**
> >  * xe_mmio_wait32() - Wait for a register to match the desired masked value
> > - * @gt: MMIO target GT
> > + * @mmio: MMIO target
> >  * @reg: register to read value from
> >  * @mask: mask to be applied to the value read from the register
> >  * @val: desired value after applying the mask
> > @@ -416,15 +411,15 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
> >  * @timeout_us for different reasons, specially in non-atomic contexts. Thus,
> >  * it is possible that this function succeeds even after @timeout_us has passed.
> >  */
> > -int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> > -		   u32 *out_val, bool atomic)
> > +int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> > +		     u32 *out_val, bool atomic)
> > {
> > -	return __xe_mmio_wait32(gt, reg, mask, val, timeout_us, out_val, atomic, true);
> > +	return ____xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, true);
> > }
> > 
> > /**
> >  * xe_mmio_wait32_not() - Wait for a register to return anything other than the given masked value
> > - * @gt: MMIO target GT
> > + * @mmio: MMIO target
> >  * @reg: register to read value from
> >  * @mask: mask to be applied to the value read from the register
> >  * @val: value not to be matched after applying the mask
> > @@ -435,8 +430,8 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 t
> >  * This function works exactly like xe_mmio_wait32() with the exception that
> >  * @val is expected not to be matched.
> >  */
> > -int xe_mmio_wait32_not(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> > -		       u32 *out_val, bool atomic)
> > +int __xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> > +			 u32 *out_val, bool atomic)
> > {
> > -	return __xe_mmio_wait32(gt, reg, mask, val, timeout_us, out_val, atomic, false);
> > +	return ____xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
> > }
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > index 26551410ecc8..ac6846447c52 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > @@ -14,25 +14,67 @@ struct xe_reg;
> > int xe_mmio_init(struct xe_device *xe);
> > int xe_mmio_probe_tiles(struct xe_device *xe);
> > 
> > -u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
> > -u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg);
> > -void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> > -u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg);
> > -u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set);
> > -int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val, u32 mask, u32 eval);
> > -bool xe_mmio_in_range(const struct xe_gt *gt, const struct xe_mmio_range *range, struct xe_reg reg);
> > -
> > -u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
> > -int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> > -		   u32 *out_val, bool atomic);
> > -int xe_mmio_wait32_not(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> > -		       u32 *out_val, bool atomic);
> > -
> > -static inline u32 xe_mmio_adjusted_addr(const struct xe_gt *gt, u32 addr)
> > +/*
> > + * Temporary transition helper for xe_gt -> xe_mmio conversion.  Allows
> > + * continued usage of xe_gt as a parameter to MMIO operations which now
> > + * take an xe_mmio structure instead.  Will be removed once the driver-wide
> > + * conversion is complete.
> > + */
> > +#define __to_xe_mmio(ptr) \
> > +	_Generic(ptr, \
> > +		 const struct xe_gt *: (&((const struct xe_gt *)(ptr))->mmio), \
> > +		 struct xe_gt *: (&((struct xe_gt *)(ptr))->mmio), \
> > +		 const struct xe_mmio *: (ptr), \
> > +		 struct xe_mmio *: (ptr))
> > +
> > +u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
> > +#define xe_mmio_read8(p, reg) __xe_mmio_read8(__to_xe_mmio(p), reg)
> > +
> > +u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
> > +#define xe_mmio_read16(p, reg) __xe_mmio_read16(__to_xe_mmio(p), reg)
> > +
> > +void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
> > +#define xe_mmio_write32(p, reg, val) __xe_mmio_write32(__to_xe_mmio(p), reg, val)
> > +
> > +u32 __xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg);
> > +#define xe_mmio_read32(p, reg) __xe_mmio_read32(__to_xe_mmio(p), reg)
> > +
> > +u32 __xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set);
> > +#define xe_mmio_rmw32(p, reg, clr, set) __xe_mmio_rmw32(__to_xe_mmio(p), reg, clr, set)
> > +
> > +int __xe_mmio_write32_and_verify(struct xe_mmio *mmio, struct xe_reg reg,
> > +				 u32 val, u32 mask, u32 eval);
> > +#define xe_mmio_write32_and_verify(p, reg, val, mask, eval) \
> > +	__xe_mmio_write32_and_verify(__to_xe_mmio(p), reg, val, mask, eval)
> > +
> > +bool __xe_mmio_in_range(const struct xe_mmio *mmio,
> > +			const struct xe_mmio_range *range, struct xe_reg reg);
> > +#define xe_mmio_in_range(p, range, reg) __xe_mmio_in_range(__to_xe_mmio(p), range, reg)
> > +
> > +u64 __xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg);
> > +#define xe_mmio_read64_2x32(p, reg) __xe_mmio_read64_2x32(__to_xe_mmio(p), reg)
> > +
> > +int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val,
> > +		     u32 timeout_us, u32 *out_val, bool atomic);
> > +#define xe_mmio_wait32(p, reg, mask, val, timeout_us, out_val, atomic) \
> > +	__xe_mmio_wait32(__to_xe_mmio(p), reg, mask, val, timeout_us, out_val, atomic)
> > +
> > +int __xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask,
> > +			 u32 val, u32 timeout_us, u32 *out_val, bool atomic);
> > +#define xe_mmio_wait32_not(p, reg, mask, val, timeout_us, out_val, atomic) \
> > +	__xe_mmio_wait32_not(__to_xe_mmio(p), reg, mask, val, timeout_us, out_val, atomic)
> > +
> > +static inline u32 __xe_mmio_adjusted_addr(const struct xe_mmio *mmio, u32 addr)
> > {
> > -	if (addr < gt->mmio.adj_limit)
> > -		addr += gt->mmio.adj_offset;
> > +	if (addr < mmio->adj_limit)
> > +		addr += mmio->adj_offset;
> > 	return addr;
> > }
> > +#define xe_mmio_adjusted_addr(p, addr) __xe_mmio_adjusted_addr(__to_xe_mmio(p), addr)
> > +
> > +static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
> > +{
> > +	return &xe->tiles[0].mmio;
> > +}
> > 
> > #endif
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 8573d7a87d84..d323873dda20 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -342,12 +342,12 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_try_signal,
> > );
> > 
> > TRACE_EVENT(xe_reg_rw,
> > -	TP_PROTO(struct xe_gt *gt, bool write, u32 reg, u64 val, int len),
> > +	TP_PROTO(struct xe_mmio *mmio, bool write, u32 reg, u64 val, int len),
> > 
> > -	TP_ARGS(gt, write, reg, val, len),
> > +	TP_ARGS(mmio, write, reg, val, len),
> > 
> > 	TP_STRUCT__entry(
> > -		__string(dev, __dev_name_gt(gt))
> > +		__string(dev, __dev_name_xe(mmio->xe))
> > 		__field(u64, val)
> > 		__field(u32, reg)
> > 		__field(u16, write)
> > -- 
> > 2.45.2
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
