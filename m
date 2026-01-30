Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15140E6BF30
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 17:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B6310E122;
	Fri, 30 Jan 2026 17:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVUGrmo/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F146010E037
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 17:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769793838; x=1801329838;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TRyTn+WktfDBTVpyOee02T7emiqgX2qJe19aOFenCS8=;
 b=bVUGrmo/cecHAKJD+6+czaL7NiYatJL4h2HzPYsj3vSfcDVr9OjRajn+
 lNBfc1RfMzcqSA2F9Ddy4kPk+vAHJNsK6zXjtotrywKx4weuHPYZU9Ftf
 Gb3YavBwjjYa3QYCQ/kkOv2m2RxFOZ82pD3gXlDoUZipjBzEmHjbEwlNE
 2uQUQpMqks/gKispdT3iqVX1GtJQ8ldpACedWMTHae2paEEwp0RmGsMOj
 An0tR1l1C3AS0kGseARyy4bvizzVmuRwzk0Nh9qPxoHLSvmKGzefwN3Kh
 DHRyTQkzMCmDKtklVwOhDDPxseXiv6d9yQNeSYYC05rPgceJo1LBkbOT0 w==;
X-CSE-ConnectionGUID: HV+kxJa6SAqxknkoKLeCQg==
X-CSE-MsgGUID: W7i1N4UiRI+nvwr8uhK17w==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71104085"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71104085"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 09:23:57 -0800
X-CSE-ConnectionGUID: 3t259XtcR/OOMSH9SpMgjg==
X-CSE-MsgGUID: QTgRXv7vR6udnMLbsYeTTw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 09:23:58 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 09:23:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 09:23:57 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 09:23:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcHW5MreEsA7h7caWIoA6s3y5vUpez1xYIT6EoofIfsmiNDn324Z75z2jAkfKycW0RIDnsjfliEpvibX3uqzBSAsWlc15ZYpYbJA3qB9TaHAiNJU1lVZQY0WOd5YnOS4wB1YN/E52NEv9OcV03YCq3OnTDgsPt2isTtE8WoxeSsM45ebM5aAczlrx0JTOe93wTwcHn9JZnrZw8y9qz3JVpaKmq0rm67cabdGW6CmhrRzDep7igtAXS/lzM43Q/blkfD6ANKBQUIvSrBZyAMDl6+9W27zuJh9Rerp1d8tHKHlFHZ1oi999ZfcYptY08yxDgALdFTskf4KjhoE8Jp9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzG1aaIruRhuU7XVKF56uHbjpMA94WQFowZO4zeKJy8=;
 b=Jghx6l9VgjFn85gj5kIyGJhbYKs0D7fiQUSI9xUJUjVzsdw2yjlM9b8J+ovvro9AvfAJIQ5WQSTghi6RKaqTeqbzqXIIMRhkoN/YUdEFFWiNOgxnd3hIacj05cqKCozvLUR7V0VIhfy0+p7RPicuRp9zbu8jtn3NTwGB3Do5yCWr0k6bMdztlweHpS9/S71u7Ynhm8sUTWqYuEhN8RI0QPxh/xP/yKSL5iIdT3H69rC6ZnKxTJyBoxmnAVnH43j/pnHPCKcSX40zunkHBPPa3FkvyA5IvVUywaffhHC5qSZtkCbJ4TasNcgKnNzNzIkt89rWk6tCRi3x0v49C7UDlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6723.namprd11.prod.outlook.com (2603:10b6:510:1af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:23:48 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.007; Fri, 30 Jan 2026
 17:23:48 +0000
Date: Fri, 30 Jan 2026 09:23:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Brian Nguyen <brian3.nguyen@intel.com>
Subject: Re: [PATCH v3] drm/xe: use entry_dump callbacks for xe2+ PAT dumps
Message-ID: <20260130172346.GA458797@mdroper-desk1.amr.corp.intel.com>
References: <20260130024923.2219501-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260130024923.2219501-1-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: c080942c-c6ef-492c-1ffc-08de60245461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?USaa4U/7l0tk8LpV9Xepr57ScUr5HDZDoOHQEukk6OYLO9aCR/1Py89Pr2iU?=
 =?us-ascii?Q?zLU+7GAJOfW4nSy6MdGZ4kOf9618P8KQm1TAuF8ceoTmiUPVP/2QCB/St/6q?=
 =?us-ascii?Q?cpG5aD4D+0fYgjCWTcJVdi5uHgpcZlL+8KD7KJ4bRnhOPy/TyPiiCAZLCbxq?=
 =?us-ascii?Q?u77PCrebRq6LIY00Yt4tLBnDLN6zrmJKSBEPAoe3blk/VbtzSKiBV7Zpv5H/?=
 =?us-ascii?Q?2OU69ErWaoJPDCtyAKVlpn4/8mTbAPkw+T0iIiWtv4OHNJZhyJf1zzGgMpog?=
 =?us-ascii?Q?VE7hqJ/vvpdK9ldbFQIJk6HFkBQdTZeWFvaS3aRcScZ4hLqEKk8sxddQvce1?=
 =?us-ascii?Q?mV2Xxz7mtVejHYk65LB7pbLXGJsFLY2SL0ilwLUxFxFJf7NBmCKr/V1dKedC?=
 =?us-ascii?Q?airq1WcMYJyQOvbJVj48+4TlekVkEZh8cGvzrhXHCNeaosZBNuU7J5Hn8vbM?=
 =?us-ascii?Q?hYw/ls0t05Rn8cdoNNbjJHWzKpuUHAtGdE7brRdcuiaxIKY9Sfy16BUeJI2X?=
 =?us-ascii?Q?Nxz46S7XK0oWO7xfbedEEx640zCQAT6smseDaR3Yx5JsnUmvnzboYe85DRsi?=
 =?us-ascii?Q?3WQOYExmvn/N0+uukTybwhnFeAs5KntGEvlEOV04UIWYQF9jSc5qZZwS7svH?=
 =?us-ascii?Q?zb7JgTVrsBsUXhWIwT3PGR79YtXs4bbvoWi5ShYQZ9XdGrIEa9sHa0lm5QPB?=
 =?us-ascii?Q?D/JBOzvWx1DubAJuWrlNinO455MpeEy055CRuBPYXaK6VuJl02O5J5H5hpzo?=
 =?us-ascii?Q?Ob48UR+rTztuhyqnAi+1vCXpUniAdhO8ioYEF4diTcLVa6qP2vbHDb6jKQ3Y?=
 =?us-ascii?Q?d43VU4QUgSxbaVBMxUAQMdAJFP0V+RIbdugXv4Y6jEUzCvoTcD64PQBX1PZq?=
 =?us-ascii?Q?mkKyXV70SOtpoZQauoIlUPktQShba9IFw/6HerKFN+1xR9QDq5WjaOkNmGWE?=
 =?us-ascii?Q?JHAXsBb5l37OkBOhTTPx6ysysSjNk0gFRaw0+LBNDxg8TCnOdvmKnUM7RoZC?=
 =?us-ascii?Q?EbwmDhNFn5WLjAfZ/gPXkjJZKykJMyYXJgausrF1djwpUclrN7MVfRz7Vpe8?=
 =?us-ascii?Q?SmQeK2CHz82CYKMnqqgLsId9cG4tGnwgCpto8L7YINk5osLOJq1Q+ufD6iGw?=
 =?us-ascii?Q?NtcEPDhpfBI9Q3XY9xWNCW3mEicIBCb+Mifc3VlaYHX2VTAkEPxcGr+mhe4G?=
 =?us-ascii?Q?Auw+ybZ9kndknXdSfRL3kcXq5m4zfgh452V4rQeFOOxE6UYgVldAHIV/IdN+?=
 =?us-ascii?Q?3C/h2n+RXYBMW6yisu0nDcK0xumHgsxVzvZG0Y0MyK6lO+iThAE6ibxIWqXb?=
 =?us-ascii?Q?GIKVjXhvLXrlnyoXLTTOSPkU9sEFjzcGND+Q4Dm4RiEdK+tnbM3UDdy62Atw?=
 =?us-ascii?Q?MYfHQ/BI9BaG/dGk0K0y0l4Op+oxDWCpIBZZM+ldNEhIdqd6w8BW1jMDsD3g?=
 =?us-ascii?Q?8MuSexNUYp4cUoAJpT78bNwXxFg/ybsi/AysdEPQ4Kl00M2L6N1MHkyS3EQZ?=
 =?us-ascii?Q?zGjDGXDSO80fNohcJ7R6YijTFGFYXtMes0ASXLXG3PT5d7SHKJSmIfD+URAi?=
 =?us-ascii?Q?AJhy/OVZc/Yrm0wbSlE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z78UR5bUR8ZKW6zlE0GrHfPeZYrt2AjWMnHynK9tS4fRGVsOS49C0rQDEf3m?=
 =?us-ascii?Q?0aRsDhR/LvMdwXi01lTwtfat6i0xosrUIA43TZ+8Gnplbs/QABKcZMxpsyiq?=
 =?us-ascii?Q?vNhOs6q6+pzo4yyqbfqAZsgxLMFcax9JYTyaxa02skn+rbxoippJxoo1RNc7?=
 =?us-ascii?Q?RYzk6z9F4jHRFSejCMY05x/7h0Qe+A9zGmgA0z0mnbbRhSspAk/asBJg0tPg?=
 =?us-ascii?Q?028ugwyLyBNBAXLXl4eE+eFp+uQvLwlF5fAmX0MqQJ8SZKmNo4xku+1hvuhK?=
 =?us-ascii?Q?y0n4sP5FwaXWoOe4Z/eyH/bPhVjX1aLaFtM0ShaUT3gDDpBzlZ+rAm0ciGu3?=
 =?us-ascii?Q?gY2je9XSVuMRMPF7V1Ot7wM18tEc2BIoDM/jPmu/vJRtgRf/w3XcCAoRrlg0?=
 =?us-ascii?Q?GAUkErhcd24tVXPvkiPCJRB047cxyccOwbAPrc96tUigD3PqZ760g4KeGvjx?=
 =?us-ascii?Q?oYtPGSTav7J558zfzXfijYXqNwF21H1u/b6dSyzKkl3R/Ey1iyeHhUNnjril?=
 =?us-ascii?Q?ZA11cKl0W7U0J76bpS+AKgVrSmc2fMahv/dN0Y1u+ejicFO/ECXth1AWKFtj?=
 =?us-ascii?Q?A1ClLYwXkRvqaWK4ud2U9zfDc4+OFwLRxnxCUpLk9JoN00rJbmsh5k+oxHOB?=
 =?us-ascii?Q?0wi5+93x3eV42Pqtxr4trrXZykQgklz/IDzPJSyAiVDznz34uGqmdneZv/WP?=
 =?us-ascii?Q?7Gms1gloAJpoeEMPMqZckszIeB9uLlYHZQg4UuXVmhs0DYyTaCswo6vFUlL4?=
 =?us-ascii?Q?QOUxZktRXxPZpHhV5cAAPEShSXGli7r4vCLiMdbJ043ZKKmWMk+gnYSNbZfK?=
 =?us-ascii?Q?ua9P6aepWu7jgZojoZPsP/2v71g7HnEtl+yF4GG3ThmdnQLWiFS3eAEOc6U+?=
 =?us-ascii?Q?8ZA3MH5J++lx4bsQ7dh6mrpPwmDteyf0+8HA4HMG50sD+AseQCr03Bhi1qE+?=
 =?us-ascii?Q?Ncx4FmH5fsN7mpXkQCphBsFfqXIG1kB2BDJLB6m8RsXg/wiv2g7B4kpUeQpF?=
 =?us-ascii?Q?EqKNtDNlOs0jRusY+DK/AIvs8/Q4GgoScNPUtJLqqVAc2DJL5bcaCInRC9ye?=
 =?us-ascii?Q?M3LQ9gJUbrLDD/mn4MEzWgxgj36OK1hiatJwye1GsV/SSYfMwuI6wANHPzr9?=
 =?us-ascii?Q?BNtQUfFGJwzNsx4XHMn1REL0ZNzK4mYA98sGCprnIArOEO9M/XH4BFECauLP?=
 =?us-ascii?Q?1Mo9TQBt6pfIiqOQ4w6eU9zU+PY7DBRxB7bftftUP4JqDMk7uS6DsqqgG2f8?=
 =?us-ascii?Q?yUlN9kCX9qQ5EE3FiGujtsN3iTHvszdbGci4ChgOkXy6fcHKqYxaLU1H/EZ3?=
 =?us-ascii?Q?tSc2fELUiyhm0sg5Uzg6pjYlK1zonWu3iZDykH9YC33mM137TP8AJCwV2Tvk?=
 =?us-ascii?Q?TSDKnW+/9uS4hRjwkRFJQtb8BJE/et2LuWVoyWPtgFlol0G1e/uvNE9So+I7?=
 =?us-ascii?Q?7AkG85y0jRnhnFRw62JA4D/6I+I4sxFebaKs5+b/QUjULguUttK/LJC9T77Y?=
 =?us-ascii?Q?FRN7Pluxrmbp4uPTDpNDuEsnatxI3HXYWkiV51TKLIMEbmS611E1JrQ06VQI?=
 =?us-ascii?Q?feQGFctRYx9pgP71Et1gZ9jywfxGvTiHojiA1ecoOtLJAscB8bTjyjpgkIct?=
 =?us-ascii?Q?VANUbecmDuxefNyD8/W9Ibhgghb1oepBbYim+mqtnVZ+rFsOhVH8XxQs0N3V?=
 =?us-ascii?Q?Si7xUuePRlGuqcwuyuGiyVQ3m74eolgr5k1RQG/D/JiEIxOvw8EGrgDmOgGG?=
 =?us-ascii?Q?Ttv9Ych69ilvfQUd/o0jpLPPROsANW4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c080942c-c6ef-492c-1ffc-08de60245461
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:23:48.5699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87pWdnCz3Nf0NmMQ9FagJ23uyZXCAA4MFg0uoQGWw1MW13Ou5+8bBJo9xPKh2RPYBUy+Y/5uaN7YGOHYtJKBmW01fm/teALRHViKR8t9/nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6723
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

On Fri, Jan 30, 2026 at 02:49:23AM +0000, Xin Wang wrote:
> Move xe2+ PAT entry printing into the entry_dump op so platform
> specific logic stays localized, simplifying future maintenance.
> 
> v2:
>  - Do not null xe->pat.ops for VFs.
>  - Skip PAT init and dump on VFs (-EOPNOTSUPP), avoiding NULL ops use.
> 
> v3:
>  - fixed typo
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Suggested-by: Brian Nguyen <brian3.nguyen@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 14d0dce5190a..b6730fb20f79 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -88,6 +88,8 @@ struct xe_pat_ops {
>  	void (*program_media)(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>  			      int n_entries);
>  	int (*dump)(struct xe_gt *gt, struct drm_printer *p);
> +	void (*entry_dump)(struct drm_printer *p, const char *label, u32 pat, bool rsvd);
> +

We probably don't want this extra blank line here.

>  };
>  
>  static const struct xe_pat_table_entry xelp_pat_table[] = {
> @@ -480,6 +482,7 @@ static const struct xe_pat_ops xe2_pat_ops = {
>  	.program_graphics = program_pat_mcr,
>  	.program_media = program_pat,
>  	.dump = xe2_dump,
> +	.entry_dump = xe2_pat_entry_dump,
>  };
>  
>  static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
> @@ -518,6 +521,7 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
>  	.program_graphics = program_pat_mcr,
>  	.program_media = program_pat,
>  	.dump = xe3p_xpc_dump,

I think if we update xe2_dump() to call the new entry_dump() vfunc
rather than directly calling xe2_pat_entry_dump, we should also be able
to eliminate xe3p_xpc_dump and use the same top-level dump function for
both.  The only difference I see in the two functions is that xe2_dump
handles media properly as a non-MCR register, whereas xe3p_xpc_dump does
not.  According to bspec 76445 the Xe3p_HPM media that gets paired with
xe3p_xpc on platforms like CRI still has unicast handling for the range
that has the PAT registers, so consolidating the two functions will
actually solve another bug.


Matt

> +	.entry_dump = xe3p_xpc_pat_entry_dump,
>  };
>  
>  void xe_pat_init_early(struct xe_device *xe)
> @@ -600,20 +604,17 @@ void xe_pat_init_early(struct xe_device *xe)
>  			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>  	}
>  
> -	/* VFs can't program nor dump PAT settings */
> -	if (IS_SRIOV_VF(xe))
> -		xe->pat.ops = NULL;
> -
> -	xe_assert(xe, !xe->pat.ops || xe->pat.ops->dump);
> -	xe_assert(xe, !xe->pat.ops || xe->pat.ops->program_graphics);
> -	xe_assert(xe, !xe->pat.ops || MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);
> +	xe_assert(xe, xe->pat.ops->dump);
> +	xe_assert(xe, xe->pat.ops->program_graphics);
> +	xe_assert(xe, MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);
> +	xe_assert(xe, GRAPHICS_VER(xe) < 20 || xe->pat.ops->entry_dump);
>  }
>  
>  void xe_pat_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (!xe->pat.ops)
> +	if (IS_SRIOV_VF(xe))
>  		return;
>  
>  	if (xe_gt_is_media_type(gt))
> @@ -633,7 +634,7 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (!xe->pat.ops)
> +	if (IS_SRIOV_VF(xe))
>  		return -EOPNOTSUPP;
>  
>  	return xe->pat.ops->dump(gt, p);
> @@ -658,12 +659,9 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>  	for (u32 i = 0; i < xe->pat.n_entries; i++) {
>  		u32 pat = xe->pat.table[i].value;
>  
> -		if (GRAPHICS_VERx100(xe) == 3511) {
> -			xe_pat_index_label(label, sizeof(label), i);
> -			xe3p_xpc_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
> -		} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
> +		if (GRAPHICS_VER(xe) >= 20) {
>  			xe_pat_index_label(label, sizeof(label), i);
> -			xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
> +			xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
>  		} else if (xe->info.platform == XE_METEORLAKE) {
>  			xelpg_pat_entry_dump(p, i, pat);
>  		} else if (xe->info.platform == XE_PVC) {
> @@ -679,14 +677,14 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>  		u32 pat = xe->pat.pat_pta->value;
>  
>  		drm_printf(p, "Page Table Access:\n");
> -		xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
> +		xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
>  	}
>  
>  	if (xe->pat.pat_ats) {
>  		u32 pat = xe->pat.pat_ats->value;
>  
>  		drm_printf(p, "PCIe ATS/PASID:\n");
> -		xe2_pat_entry_dump(p, "PAT_ATS ", pat, false);
> +		xe->pat.ops->entry_dump(p, "PAT_ATS ", pat, false);
>  	}
>  
>  	drm_printf(p, "Cache Level:\n");
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
