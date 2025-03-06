Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF90FC282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 11:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A6110E93B;
	Thu,  6 Mar 2025 11:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ChHsy5sv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07A510E939
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741258857; x=1772794857;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HzXLyy0TPvdM1rCZUQxS3zYX3v3TikwOmB36QGuxhW4=;
 b=ChHsy5svfex4imRRriOx5h7tEJZYg45NpVhW7SyxpJM7f6hsEzE3dtSe
 WnmyM5vOuzfwy9cX5611RRbYu6KA8T5SzJBXPdhTa9mc88v20L74bhciR
 KbcTIqYpUK+0H11xCSZWH+wGXw+GxmAf6r/D2cVhvklQrmuMAbLHzZgyN
 mo0WDqzI1ImVI2sVk26mniBpKHe2hxBmEao5UiADIT97oDue7X0CD24py
 CtPfkmC4O+U+ga3FWWvOr9YwRZ1wDF1FNsZQOHbq6x+EubhC44DXzEYFI
 aBs+J6BtqyMnzG5UG3phvlA/5YjJ4nH5JXNhluPjnS8Sgdf5WvlGNaji0 w==;
X-CSE-ConnectionGUID: 8GzIc5tmTSKhxmA7SQQpCQ==
X-CSE-MsgGUID: HCKV3H40T6GW2nXdUqXCjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42286022"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="42286022"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 03:00:57 -0800
X-CSE-ConnectionGUID: iIItgWKPTy+0/U1S3MSgpA==
X-CSE-MsgGUID: DrK80W08QliSunFzDRyxGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="119002266"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 03:00:55 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 6 Mar 2025 03:00:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Mar 2025 03:00:56 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 03:00:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upNlIr7uIWwTzWVQh3+jSbv5TdlrgtkghJdn1D6kKv/baNolfPy12SwHJh+ejUDlVDhxakFhZMGn0JsaDBgxk9laqGPsPqtGKJqyK5KPHk0F3PM53NznKRVf2cP5FZ6RcwMt4bjmpPDjoc+aB3R5Ur2RF4k/6kHJEbGHAO5Scjn7n87ViedYUJ33AtaPpPSOBWq/EGmTQFF7X/vBe8/4Kj8Gw4jgBsf0P3ioZxhIxJ+T2c+/P28hlOuuK8Mipo15mUz7Fy7VCZOhOm5ToQV3qYEduaeGoM3zA8XvWQ9b0F5iRuabEVCQAnODLGlIa4z+hTGpTmkmphhozdxHLFxmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVxkaU7U8t0unrZJiL6BUaW0bIJroEFOP2iw/HQIg3s=;
 b=nw0ZsKV2JEh6QktDPOBN4oHDYzXB4A1JU1aGB+XQo0IMNqC4kzrDc6CFSq29Zgr/y91F12SJSJ/768wnIYjU5aS4IaW7021kE0jtgIQQixLWXCL0ltzKfoGcsrucxJUqZbnkDfzLJyJkjTbeROkFK4CreeAwu5iJXZWegZqgH6vMqtgleGKpB4sbT0oSzh0Ocdx1MqB9WOl6FZCzc3sURATEfz9qS+l6qMuK2fCi0eAliBuF1mjaMFzr/ThUwTSAAQbEWX7LZ245rIwt1cDEvQ4EZ4rje9D2NEcoEmt8zEXhayXZG2yEcUprIGizGRiXOM/DFlaSaSLte/b/AGcNkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CYYPR11MB8432.namprd11.prod.outlook.com (2603:10b6:930:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 11:00:20 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8489.025; Thu, 6 Mar 2025
 11:00:20 +0000
Date: Thu, 6 Mar 2025 12:00:09 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: fix enable survivability mode
Message-ID: <Z8mAOQxYlyYmW5hl@fdugast-desk>
References: <20250306055407.511405-1-riana.tauro@intel.com>
 <v7b65hpbmftedtbgq6qggel2xcvyal6wmxukx462rp2a75464w@5blgurlukprs>
 <uszj2ekc7jiapwdqd2a7mseokpu2iabr74qczkzfpfqahky7jq@vmfro22jihmt>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <uszj2ekc7jiapwdqd2a7mseokpu2iabr74qczkzfpfqahky7jq@vmfro22jihmt>
Organization: Intel Corporation
X-ClientProxiedBy: ZR2P278CA0061.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CYYPR11MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: b3233279-0440-499d-4d39-08dd5c9e1613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HXsGwIsEP/P8xk4k8qDWoWScMkEnI81ubr6/v9ddfdRSnRnSiaT0D+Evw5aY?=
 =?us-ascii?Q?VMU1HJg1P+STsNzdab4HnKdfd4JyVCyJz+haD+9EQehMHtoyRFxbltmbdJq2?=
 =?us-ascii?Q?eKFJdmhQ7cgi/8bMGi+ph0ZNMcRo0sS7qyALbG37EPIy86AOg9g8jlFS31qw?=
 =?us-ascii?Q?LVrGr8bWro30wjNefSvYD35ljisMrNM2Xqpyt2czWoRstloNWxqXJy1/lj6N?=
 =?us-ascii?Q?ev6BPypBVpNFMF9sZDtrCNyi4jTDpeorT5DPzSwmLXL1nAzUsiaPVqXJkBWk?=
 =?us-ascii?Q?DRNQ4fiW9HkY3+to2VFu8xk7TMzhIKatkHVQaL9IU6tE4qTggNfXyxpfzGfu?=
 =?us-ascii?Q?/EtppW1o2q0SfrFEtp7eqvdlvP9t5OFhLND9HgIlX5e2Fdt1Iq3qwc6HugEL?=
 =?us-ascii?Q?Mpf55p4FuM5IDkC9geQaAbnewmc6o3HFSGsoEaD5+6Q62OJj4wYvnlZFA7HK?=
 =?us-ascii?Q?/veLgLGte68Vx/ReQkF/aEoklmFJ32s2betxWHnUH9cs/hQ5Nb0G3CsPCKpD?=
 =?us-ascii?Q?mEV8UO5x+K3ivXDD0+lSJjNn0n1mEYaq9b3h0CIJ8fWdpTRoNvcD1zyE2kZS?=
 =?us-ascii?Q?OLuwkhhE2iMCAkL82y+yxLhDaVf25EZo2RLc4whPpONfcQrGl/ZI4sfqbtX3?=
 =?us-ascii?Q?lsLhwkKVbTChl4e5hd0Szqi7MSbUTRrbv0bZC9LO4FJleoThW+4a5IqsODO9?=
 =?us-ascii?Q?+edNG2MhZZQEak96188alnrBPdD03RQ/S64rvh4YELeCoGXm6HWi9EoYSt+1?=
 =?us-ascii?Q?/IlJysdWD3rfvsXd3h9ljvKCuTceEds3/O/cwH97LBtdh5H+01estlYGaX9E?=
 =?us-ascii?Q?25vibTZPVKDvqX2NeYWwVDDvXvEOixNIPP1UJyR+DYTrETSkyoU4epNXh2jm?=
 =?us-ascii?Q?m/Jt3PzXUp8NsyaZFpyuyLFst2ojyAgTt/BDmGs5ciDgxSkn2hcVNA7OYjaO?=
 =?us-ascii?Q?fJknzY/mTfnV2zzUfQMR7zGcXNPMsVgOJw7RaKrQrEX1vZaF7Daa2T+sPEbq?=
 =?us-ascii?Q?Nj5wRtAWmkujX38VWOFBZhYmld+TyH8BMA3ZJqzmMCin9lU2JyW1KA4tKY+o?=
 =?us-ascii?Q?jDtYO2qcRI+xLlaslH0UemsF717fPNDNvcED4NcTAfg12YSGFJC5cak+KGYx?=
 =?us-ascii?Q?Vcr8N9Cw9w+JmRnXbVAgqXrBwc/B6u/zyCoGAZcrnc2VZPbONJps4SYS2HNz?=
 =?us-ascii?Q?NdcMFDXr/niMEYP+tLFD3LLoffX1b/5WKrewmGzN2I25HA9wC0bjAY+KOAHI?=
 =?us-ascii?Q?jKSiERzXohjQi66/Wh40ZqHz62KG7lz9WBQF/wGhAzs8cyCA28vozdqBrJk9?=
 =?us-ascii?Q?87AK/v0oaIHrWS0krws/S2v628vyCNU+w1MVbIdQTt0iE4QWB93tNhX8jNRy?=
 =?us-ascii?Q?nac1n1LtVu5x6dMXRHdVR4MnGfRE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nMbSuLwxwE8FoT4CG2+8QMUcdIP6ERj8Qj2P16hPrXuSkiK7n1HgCYbTIdSk?=
 =?us-ascii?Q?ENW/uZLDP2DU23xoot19pMM3E6NXN+2UEsRCICJguB4n8+K0pMwhdOA9bel5?=
 =?us-ascii?Q?wylApIZTlrRi5WD9LUJEVVmRMOlCH0wQNjrYomIVTknrypKSPJTUCrFX94A3?=
 =?us-ascii?Q?riHYtRsyXFWSuKXSA+Orc5W050coY16h6lu994afCj+Izy/Cnu7cU+KndeK/?=
 =?us-ascii?Q?kGZALV++YnGkz38OVTJgMB1vM9nye8vvfzlk02BDfyGbVjkPXkM9v/ea2w2m?=
 =?us-ascii?Q?QP1uWkTW8sTQq4HxHlAi3SyN+jN28LY+zFuFo/DrJ2e0oKebMZ27AvW7FC7+?=
 =?us-ascii?Q?9rdZs0Rn5c/Y9uB86NtWjukbPnP/L88sUcLgu7DAZjYTCB0sXVgoN0Y0D62v?=
 =?us-ascii?Q?P1hpwNlCKQGW3nQ77BlQPOmjoPH9t9QiNra625OtDa9AwmPGe5PaaTbgcF6h?=
 =?us-ascii?Q?hizDzvwCtktgprM8Zj4P71u+Vdj47lpLe/zlk/63oNcrbwXGXAYuHMD3IBwl?=
 =?us-ascii?Q?xdDCRZ3HMyDz9ce4NV/lDMsECB2XeJg/F5V7ZUc/ZiHVghxtd2rUAJC/8eNR?=
 =?us-ascii?Q?U0ZiF7DF9u/Si4sao/Rs37b3kE5HuLnqnZ7AHXm/yHnVS1qCHa0m6oIlzWRo?=
 =?us-ascii?Q?miaDo0pkbaqJ0D+bPb3t94mdJxppyHvLw/89fQjYvHrXvSQ6YBWiSrZpEcjM?=
 =?us-ascii?Q?xJHYjclXBcjKvYSUCz/2xjPpNGGSjFW3MWFTiWtnMVAM8mTuWcpd6vZ6kUDH?=
 =?us-ascii?Q?Pl7virvWPZhWOsIGMuyenm8hmBWrlJmkKZI+QFI33UUdJSGtirRVySB13r6q?=
 =?us-ascii?Q?adsiSrso1IdKS5pp2aVgPJM3lyRa6fCOGrHKqp2GOItuM8fLR0q9lYjlo1Tq?=
 =?us-ascii?Q?AMPZV/Q+qN0zaf3EsizKBsiDFpwl1LKodC/IzxC0Djuxzb6/VQYUpKIOGXYo?=
 =?us-ascii?Q?vQw8v3HZkXibu8GMguH85hP90Xl27wb4WYQ5Dj0LTwxe68UJf+LIzGLN0HiS?=
 =?us-ascii?Q?lapQdObS6G4TENldBrfsHQ7tKSoaHh+GByd3FqRZlTwCKGoqqeDBcKuFR8ak?=
 =?us-ascii?Q?7uLGYYzquu0c8h6q4ETu3AIU6c8R8qa28PeWGyhqzemej5KbgDTbQfTcSs4h?=
 =?us-ascii?Q?A93FQcSrxqGb2n5pM2sd6OZ2wHtq5Idf7reSPMqIVeuHobuTWhkicd6JqBJy?=
 =?us-ascii?Q?P9pbZGPsWlZn9P8hB3kVoJJ/hPQXnu5xWT1emHJhOKwwaO0GOFY05uxk+rHt?=
 =?us-ascii?Q?IeqQTdbFjXRfEK+JV8BEJM63cMZn8aMGMvqqVm4aDv+gfrtxTzFwJv+7tLGf?=
 =?us-ascii?Q?8Ajk9RlbnbP13GeChIa8DW7/sqhzJT9A6nsHmw8ghWj6CNQD3ylYMUIJc70N?=
 =?us-ascii?Q?2b40shrC9fjc6CU/G/ZB6mjhmWsIf1jZ7rWvr+8ZSzKcN1zyXIq8EcWHg2Ww?=
 =?us-ascii?Q?qtSdvsf5ZrV0D3+JHVGjQsVDa8P9fe/zzf4yrTeeMnIT6HAqkwgwg4DVEy3i?=
 =?us-ascii?Q?eXSYxxAWtFEIXJvrkhgtaCSH9R8D31wSpEmUGikhDMqlJxhTjAgcZRWwZONT?=
 =?us-ascii?Q?/p3zJx6wxNqs1tNUQQkiByKnxBfdnr563hGyu2fTvRyfLk8E3Vur640gccUS?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3233279-0440-499d-4d39-08dd5c9e1613
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 11:00:20.3410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3atDhlNFg0XHHZKb/tmo0qtAVgZ8Abjv6P9jNlTrplHuVeQIsjhjZc1jX//XhIx8QAalWmj5IzwYCsbHwYHYH+5cxFkWjBxx58zlahR3N7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8432
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

On Thu, Mar 06, 2025 at 12:05:53AM -0600, Lucas De Marchi wrote:
> On Thu, Mar 06, 2025 at 12:04:06AM -0600, Lucas De Marchi wrote:
> > On Thu, Mar 06, 2025 at 11:24:07AM +0530, Riana Tauro wrote:
> > > The current implementation skipped entering survivability mode even when
> > > survivability enable returned success. Enter survivability mode
> > > if enable returns success
> > > 
> > > Fixes: d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Lucas De Marchi
> 
> > > ---
> > > drivers/gpu/drm/xe/xe_pci.c | 5 ++---
> > > 1 file changed, 2 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 6b5fa067b39b..ee0665e54489 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -857,9 +857,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > > 	 * HW to be enabled. In that case enable it and return success.
> > > 	 */
> > > 	if (err) {
> > > -		if (xe_survivability_mode_required(xe) &&
> > > -		    xe_survivability_mode_enable(xe))
> > > -			return 0;
> > > +		if (xe_survivability_mode_required(xe))
> > > +			return xe_survivability_mode_enable(xe);
> > 
> > ugh... the mix of bool and int above threw me off. I remember fixing it
> > but probably forgot to put it in the series.
> > 
> > +Francois
> > 
> > Can we inject 2 errors to easily test this in igt?
> > 
> > 1. xe_device_probe_early() to return error

Yes sure. BTW just tried that locally and it leads to a kernel NULL
pointer dereference. If that is confirmed, this is another good example
why we should test error paths with fault injection.

> > 2. xe_survivability_mode_required to return true

That seems not to work, we would need to change return type to int.

Francois

> > 
> > Thanks,
> > Lucas De Marchi
> > 
> > 
> > > 
> > > 		return err;
> > > 	}
> > > -- 
> > > 2.47.1
> > > 
