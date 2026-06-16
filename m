Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1237CCD98D2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 21:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B983E10ED14;
	Tue, 16 Jun 2026 21:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NfTFRoD8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D401D10E89D
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 21:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781647009; x=1813183009;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/pVGB/5VLN+/AXBCmX+mR8aHXLg6FNX05DDL7wuy2dI=;
 b=NfTFRoD8rvLZkiwk+gX1xm8gG2NILd5ibiwe6tQrmafvfdAhGjLwljo/
 RdmfFOsksDIQqSRjVt46z75XW7YmsXMbWF3lKGBHdvlES7YZuFRjl6no4
 mQ3UQQ9qHtsLT64vgM1myn1vyKTGbROi1N1tvaZx+ZUyNEifzn/tftu2T
 7ae6/9ElDk+HKNDO+ad4lLy1v3wutnGn7NmdV5EM37fy+4Xzd+7fXadYQ
 PBQkW08SxM1K/9k0Tp6L6NH9/YUwhF6V9thOy6mO2toZy3nNW/5xFBQSD
 tCnbi2pMiDyFJBXCso32FHkS1zOwWuq3qI3IZfqOPj0IEU7+0XNCQ1RK5 w==;
X-CSE-ConnectionGUID: Br6Iz3lcRwapbMuV+RS9eQ==
X-CSE-MsgGUID: 7XREyPcyTCONc3Awa9ASAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="99844597"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="99844597"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 14:56:49 -0700
X-CSE-ConnectionGUID: ZxPpwFayQpeZdSIUsu2llA==
X-CSE-MsgGUID: xXcL+IFRQ3aValgobF9Jrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="271961098"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 14:56:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 14:56:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 14:56:47 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 14:56:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAj9Tbxrc+op5F40Ctl0cQYr0GLi2blt4Nnjv0+KIfmEvulyUH/OfvO2a5cT4NbMOhFJS32ecjIlDfVeBXeA1B2y23uKBZUtn71p4c+6hLo0jhjPH2OAySSoB311auBedngX0gZNNrOkrjHi97h4Yq05+jrQ3YriXY2c32mkqKfsXbs+e2AKdfuH9KNduW/TEMTG6mTfhmUOQLLVDxOk0ufwHtiEFP22cgqweuMVAeMo9LGadRCklCthe+1iMqaql/31Qkxcx0jf/Jh9nTyKRstoBI1P2IixGAwQ1bzDYSBfj4aMvkv6x3mzhvpJzsLHmdByx8g9c6TVRO4zwxKlTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azUQX6oP9qdZRYlp05QXn+P0z1l16kG7Kjo/AHeFs7U=;
 b=dAKl4w/kvO7hyYTo5l5lZ/GPRD8BVcjDYup4OJl7qmlSFTAk16g3H9H6VPiR8sTr/H0RHEuipTZVKQGEPdIiU9g5OvmR3883UpfSACV23sVIfU4Z0RsQHIOcjgaKFUXI/5k9A1PB5M/LkF6Mrrp8b8NA4rqjYF7edaA8CV4YjdxaKtDbcisQui4LVQ8Ftrsuss/+1AuevXUe5Rw9z3gDWjJ0q658cyWnvMuKVUxTJlwo0kyHlDArd3Q/E6kyfT2mvrAL29aU70fYpkDUY8jZaWDHS6t/y/ZHt1+M/S8rqqT/6qRC/QeESM5V8qpGtFyGi6guvv2WuxtY4v3OdgeKnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6968.namprd11.prod.outlook.com (2603:10b6:806:2be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 21:56:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 21:56:45 +0000
Date: Tue, 16 Jun 2026 14:56:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/9] drm/xe: Add framework for info probing
Message-ID: <20260616215642.GN6214@mdroper-desk1.amr.corp.intel.com>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-1-21e83e188e60@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260609-xe-probe-info-v1-1-21e83e188e60@intel.com>
X-ClientProxiedBy: SJ0PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c4bfb52-45f8-47ba-6261-08decbf22811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|4143699003|5023799004|18002099003|56012099006|11063799006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 41/5wYWRbAULOPryRYhY5iloQJ755no0a09vChbSY0uZzBSfK7jJrVrVaRqBNFl9YT+Nz+NSIA8WICZLQKnlNOZbn/9r465f5OlQgxGEdhPb5LWn+E0CwpinTc193QjGQZBznh/WiA4+SIIu4M7fkCsru+aCIDYLbDYqwGyLmIJDQrcqzao6uhTdpw3ZdNxhyswdFa590y+N3qCd5d8MoRNF71cYfMoLOR4yjkZ7+T7SZiVGFjcttejT2IXRmh6fusckjwrhTTTxUz3qIqujIn/vJahA5/2OYSFlk6RV2njB+nzAScxzFSBkE5TvSzolS0pjXo8JXeAk1PnSAgjsczfUcoNWjyKdryjQ1WcJHg8MXXYBKNlOB20K+MwpwbYr5fCb0FrSANxzf+eoZ+AFZLwSe/rZtUDsthvI49kyvEMc3VdghkF4VMYluW8kDephFA6ZzjXQcYXKEoYqv9sdD59ODDtYNfUzoXEEFUQ3hU49LGoUobDW9xb6AkCarziIrQwmTTmQgPKo5aYK20ARHTFP4Wonj1Sa6lkCk1pkBmiWSP4IqHaNvaLqJqiTgCFmcoNu7VB+xfrrC+Z9lBBhi28EJeMaXI22MJ32pB0ZYT7wQxZbiw6a098Jtg/ggdKN3MqTzsHhnMrQIpB6ZFKEJyycYtJjiyqE9wqanKkityMKzPnB/e/Z+3Ks9GRPFV8W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4143699003)(5023799004)(18002099003)(56012099006)(11063799006)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P4ejfcoiGvrNpoXTL/K2rHCOit7rhi2xVwIiMC9zTGq0jaUD+9nv7iIauj2t?=
 =?us-ascii?Q?+lmJcTTAz1dsJeUTbLaEN5Dp3HJsd3tNT9Ofl9TDhwhb2SEjFHO6aZJYR60R?=
 =?us-ascii?Q?MoilA4bb3Um8fcXxxRuKKAeX+ScKsYQhtQQ5Pwt75zqMPpCY/NnhiLrDQ5K3?=
 =?us-ascii?Q?lQD8HvOnwJFGeMcJvhI9fIJW2u0jwfnXfKWXd7xjVp6uaVZWO7BjSiLRjIJe?=
 =?us-ascii?Q?07ha4AJy6FbCJt09gE6OJaBGmIQLMmvMR2L8JC6s9p/qPpJYIMwYXEILEHE8?=
 =?us-ascii?Q?YHoytnzygsXeT96Yd6ippiSIMjlRkdZ1rFuYEkbFh4EHhaUTQecQcckTSrHI?=
 =?us-ascii?Q?KnJ7y4KTaQRS09r9kc3lVUtoZH/zfUfk6T7kBY1srFy10uMtI2CuPIKml2/A?=
 =?us-ascii?Q?bJ7UZ8Lvv/sn1Vm48pvWc77LBmbKecjkd0Gjtrcauut/LDhNGJagH/3A/U9s?=
 =?us-ascii?Q?XUa+4mQQlMEsr4apYErky2C/kRYGX0+R0zoINhq8Ppa7+MGFXxWRZ/MQn//X?=
 =?us-ascii?Q?sRFtyVdZbffaLGQvu9luuJ2xi0YiDZMq3MLdJ6xEYG6Fgp1tHVLHjEeMH0I5?=
 =?us-ascii?Q?h8zR+GmOUowe+7md+7wk9OiI8txJKU5OsIYJ0vPUXSpfHgnjz26+LO6z3VoG?=
 =?us-ascii?Q?rf4bj1DbJqR6vvGevaExI/eXbF+rCALHjHgg/Jo7FVakgCs1PLwaUCd1HPK/?=
 =?us-ascii?Q?5I+swtdCKEq/cXI4H2xTQv5hjmhu61o5kbBidXHeXXqORbEr2oYa4/40DPO7?=
 =?us-ascii?Q?t1MpYwnJCV/xRZSahQ+CotXfng6jDuDwclZzH/DihRyYj8d2+WsM25Tq4hRO?=
 =?us-ascii?Q?LzN9Ll5QRT82R+LXpAGxMeWgMaIFCWyaZEUm9s3jNY6M/Xtic5gEaWJrF5zN?=
 =?us-ascii?Q?hdkPxKI2Nesq+0KFXyfCTFwZEnGCbII/tccO2fLJc5SPcOwlGcFLptsda2qz?=
 =?us-ascii?Q?n3xS+EHPDYfHP6Py9FpGuM/8ds8wpFO+IvINbhgixCOAD0D/wd5PSFQ0Al5n?=
 =?us-ascii?Q?9lZHXSCVTDuYNXwXsOqOwyMIgVPcczqLlc92ualDzlEe/c31+/TdTGAsjfzq?=
 =?us-ascii?Q?JuLU7SXbAdPTXJdVYZvgQiSIj3Zzczu9UflQxP3oADUQD7ibCgSCb8QioNLR?=
 =?us-ascii?Q?nBhs7sqqkjI6ZmJZ7yrQq3xC0FzpUq78+QvBKZ68fD2TCfs8kL8Ih2da+ZjR?=
 =?us-ascii?Q?gGrtgDg/fQQnBdsUPA02Y78EtkgGcJZBj7RZWvdXMVpB4GE752Ju/qNcax7j?=
 =?us-ascii?Q?s0scTaewSA+0FYMxzyD6+5fTJ5t/nPMpWZT22bqeEDdNGoGyH/1dWBQhn6Xz?=
 =?us-ascii?Q?fWGzmUacP0F9ROXutqPJLgcKp21hsX+2ecDR4QYGK69vCR/qcGcTV2n5Mk3f?=
 =?us-ascii?Q?jKA2Srz7SrJKLZKK/h7BieUrcBhV5MDA1sNs11e6mffF6l2GioaTPdoSbx6t?=
 =?us-ascii?Q?qEDSPVEB/7izLsUFo7tnTk/hnpD9MhL0H/lwSlomK5kufGU4niq/WDf1VuC4?=
 =?us-ascii?Q?SzK1mEgcER7glopX6LRC4NZbHotjKaYQAFBC0QGimDBfWxAUTCMnY/XMYj7e?=
 =?us-ascii?Q?HqfFK+iic/oOimaWWh/UuUGIImSw4VBJv9l/8oYrR72u7J3SAdegVNZWqBvj?=
 =?us-ascii?Q?nUhvR09lCqCvdRXE8MtcUyZTx2OYn83L0M/rrrfoK5xqdAdn7pUk6aWR1lOt?=
 =?us-ascii?Q?7DGHAcE1WnUgop+3fSEi2FqtarOAnJNznMtg8Ksa0NlJu8m9CNuraUmCe3PR?=
 =?us-ascii?Q?ZGhFDzmdfSJ4cCM5hF8hNal59aFkhKg=3D?=
X-Exchange-RoutingPolicyChecked: COt0O7H4eyaGsOYUeKWL0N3pmdkJjU1t5A5y8fZ9iafS7eA2U/NsP5bR+cUVeHOu0WFdI6CB94TfF7/k54uaT+ivbIxI3nSyMHT/w7Kev39xL21TW4tluKWNMW01gysOr4XSAr9I4rws9r2zgZX7glI0tGvd1RgFxurCB5JT4BRZWYxE7t6IHpk4/iJnXVnfQFI7l1vw51OFcdEkQ6BJpP7+sLWAEV8eObsx/vCz5Y+qpbI3xfj1HsCB6+bPOL2Im2s4iHqCHUPgSq8lz9AofUcl03roqKWmnojT4pB5aMMw2X2sIwkNOlOhMKfLe6CCus32/X+q7tZBed2Wh4jEPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4bfb52-45f8-47ba-6261-08decbf22811
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 21:56:44.9395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1fUwRDLjfleiPodM+8cRu+zfo7IMkOcjnWkKB1RPhC2stvZeLQpH/XIFaTfdMpR9cYTy8zQbDxml1DS2OMWVDUw1XnQDNnJGFRF76J5MhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6968
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

On Tue, Jun 09, 2026 at 05:17:33PM -0300, Gustavo Sousa wrote:
> Functions xe_info_init_early() and xe_info_init() currently probe some
> information from the hardware while doing initialization of info

Is the mention of xe_info_init_early() here correct?  The general rule
is supposed to be that *_early() functions are software-only setup
(e.g., kzalloc'ing memory, initializing mutexes, etc.), whereas
non-early functions are the ones that touch hardware in some manner
(either for reading and/or writing).  There were a lot of mistakes in
this area early on that we're still cleaning up, but I think
xe_info_init_early() at least is following the rules as far as I can
see?


Matt

> fields.  Besides mixing responsibilities, another issue from this
> approach is that kunit tests need to implement static stubs for the
> probing part.
> 
> Let's prepare the ground to ensuring that those functions stop probing
> the information from the hardware by creating the necessary framework
> for extracting the probing bits out of them.  Do that by creating a
> new struct type called xe_probed_info and the functions responsible
> for populating it.
> 
> In upcoming changes, we will gradually refactor the code so that all
> info needed by xe_info_init_early() and xe_info_init() that is probed
> from the hardware is passed to them via struct xe_probed_info.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c | 16 +++++++++++++--
>  drivers/gpu/drm/xe/xe_pci.c       | 41 +++++++++++++++++++++++++++++++++++----
>  2 files changed, 51 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 9240aff779da..51d032a9e01a 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -338,13 +338,21 @@ static void fake_xe_info_probe_tile_count(struct xe_device *xe)
>  	/* Nothing to do, just use the statically defined value. */
>  }
>  
> +static int fake_probe_info(struct xe_device *xe,
> +			   struct xe_probed_info *probed_info)
> +{
> +	return 0;
> +}
> +
>  int xe_pci_fake_device_init(struct xe_device *xe)
>  {
>  	struct kunit *test = kunit_get_current_test();
>  	struct xe_pci_fake_data *data = test->priv;
> +	struct xe_probed_info probed_info = {};
>  	const struct pci_device_id *ent = pciidlist;
>  	const struct xe_device_desc *desc;
>  	const struct xe_subplatform_desc *subplatform_desc;
> +	int err;
>  
>  	if (!data) {
>  		desc = (const void *)ent->driver_data;
> @@ -379,8 +387,12 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  	kunit_activate_static_stub(test, xe_info_probe_tile_count,
>  				   fake_xe_info_probe_tile_count);
>  
> -	xe_info_init_early(xe, desc, subplatform_desc);
> -	xe_info_init(xe, desc);
> +	err = fake_probe_info(xe, &probed_info);
> +	if (err)
> +		return err;
> +
> +	xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
> +	xe_info_init(xe, desc, &probed_info);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 78fc2e4dcfc6..7f1da6d25011 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -737,13 +737,27 @@ static void init_devid(struct xe_device *xe)
>  	xe->info.revid = pdev->revision;
>  }
>  
> +struct xe_probed_info {
> +	/* Nothing for now. */
> +};
> +
> +/*
> + * Probe from the hardware the info required by xe_info_init_early().
> + */
> +static int xe_probe_info_early(struct xe_device *xe,
> +			       struct xe_probed_info *probed_info)
> +{
> +	return 0;
> +}
> +
>  /*
>   * Initialize device info content that only depends on static driver_data
>   * passed to the driver at probe time from PCI ID table.
>   */
>  static int xe_info_init_early(struct xe_device *xe,
>  			      const struct xe_device_desc *desc,
> -			      const struct xe_subplatform_desc *subplatform_desc)
> +			      const struct xe_subplatform_desc *subplatform_desc,
> +			      struct xe_probed_info *probed_info)
>  {
>  	int err;
>  
> @@ -910,6 +924,15 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>  	return gt;
>  }
>  
> +/*
> + * Probe from the hardware the info required by xe_info_init().
> + */
> +static int xe_probe_info(struct xe_device *xe,
> +			 struct xe_probed_info *probed_info)
> +{
> +	return 0;
> +}
> +
>  /*
>   * Initialize device info content that does require knowledge about
>   * graphics / media IP version.
> @@ -917,7 +940,8 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>   * present in device info.
>   */
>  static int xe_info_init(struct xe_device *xe,
> -			const struct xe_device_desc *desc)
> +			const struct xe_device_desc *desc,
> +			struct xe_probed_info *probed_info)
>  {
>  	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
>  	const struct xe_ip *graphics_ip;
> @@ -1073,6 +1097,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
>   */
>  static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
> +	struct xe_probed_info probed_info = {};
>  	const struct xe_device_desc *desc = (const void *)ent->driver_data;
>  	const struct xe_subplatform_desc *subplatform_desc;
>  	struct xe_device *xe;
> @@ -1117,7 +1142,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  	pci_set_master(pdev);
>  
> -	err = xe_info_init_early(xe, desc, subplatform_desc);
> +	err = xe_probe_info_early(xe, &probed_info);
> +	if (err)
> +		return err;
> +
> +	err = xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
>  	if (err)
>  		return err;
>  
> @@ -1136,7 +1165,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (err)
>  		return err;
>  
> -	err = xe_info_init(xe, desc);
> +	err = xe_probe_info(xe, &probed_info);
> +	if (err)
> +		return err;
> +
> +	err = xe_info_init(xe, desc, &probed_info);
>  	if (err)
>  		return err;
>  
> 
> -- 
> 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
