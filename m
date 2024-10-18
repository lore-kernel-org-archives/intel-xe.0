Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A35AD3000D
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 13:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FBA10E930;
	Fri, 18 Oct 2024 13:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ln7nJCCZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605F310E930
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729259642; x=1760795642;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YQBKgOkXDzJDCrvm5GPrjKSjZ572fDYOb06lCIk0Hdc=;
 b=Ln7nJCCZGovstgrVla1owWjskGpD3kj2zNvb3EQY0sPpYwJMjpgQda2k
 bE0mHudr8AR6/gd9go7wPbVmTknN5L6yiKsO3z5UfwoF88MhfrIRFplpQ
 ia1d9cV75fhjJAVv65m2tXlCvREunzSwP7sOAZaD7/nSjynkGrCXFrrap
 V0VNXIxQOJHN9zocVXIxPigltmOPL6ZRZEA9mWqkuTjf1tHf9lBd8gvNZ
 ixRWi7bIgkYykXMaodIETOf56YOICm8o5xtcznHH447C1PenzX090WWGY
 QMGw/se/OWKZfkyXWQHrFY4q0mSSZcccJYdyj6eYEtH7zR33RzZKQRbqu w==;
X-CSE-ConnectionGUID: t0BM5YfxSVy9AFr9xQur/w==
X-CSE-MsgGUID: nsxZ3GyJRXK2skZ1KmrRBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28896599"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28896599"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 06:54:01 -0700
X-CSE-ConnectionGUID: hlVWG0n3T+idaS/+TjWQug==
X-CSE-MsgGUID: SS0Uf8LaQl2b+Gh6AsLeBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="78476081"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 06:54:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 06:54:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 06:54:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 06:54:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 06:53:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8WuvGxHNiTbS2TpP5EuvP6AwyNYdtVDnDBbO8yHxRUMELoN9UMV3/4h1vBBD1bJqMJVv8/nrma9R/ZHQ0UjnOss1d51H2A7MOq6HSSOhHFf1Surfxqa9EkDICn2MdofW1p1Yvg5JGdhNzXPBYxG9vCmxkkWSuLywwt2MU5mEz57nE5Xc7hLKBR9Dl+TxSLbbfv6uQBi3wpuj1AycijpeVQ6bhveWbgOIONYnyPU1S/nII9J6fm9aSv/TOSSBE4sr7gM60UPD+XCJyGrEGZkR7vgJJKO90AytfmsLu31uudv50QDvYOkoy3GBC6KQ0DiMQoYhDebk1AulCqbgBEqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQaYqJ50mwIq/8HK4qHhl3g3zThH4ju+TOkyQPR/n38=;
 b=rxJddre01FQLb6Agpjfp5NF8oBSD97MchpBl1feWcQav5utTi0ZAAgJC3mqqPr6JFWEpOLC6H+4KRR1UtAPFq1qFQt37YN+U+0NnGf6HlkOx6PKLNI8k7ywRG1MUw5XL5o3KMB9uW0/V5Gt1SaiV7DE4i1Hfm4cJKHzAJSPvZ258+9mmn7g7/118UXEqKY7PmEcfsTcJgosj7RGhWdJCiijGcGz62/IxufEdKblCe/AaAYHSFm5nhl4FGl29RByHI9kAXkyLeia2Iys5/V7RAa95hDvyhGbuvLOuz102MqRUjbSmPecoxrF38sEaWxxodG+5aoS2BzDSWTddr3qD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB7088.namprd11.prod.outlook.com (2603:10b6:806:2b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Fri, 18 Oct
 2024 13:53:57 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 13:53:57 +0000
Date: Fri, 18 Oct 2024 15:53:49 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/ufence: Warn if mmget_not_zero() fails
Message-ID: <ZxJobXkrqE5Ibns2@fdugast-desk>
References: <20241016082304.66009-1-nirmoy.das@intel.com>
 <20241016082304.66009-3-nirmoy.das@intel.com>
 <8f873b94-ac9a-430c-901b-30bc47a6ccd2@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8f873b94-ac9a-430c-901b-30bc47a6ccd2@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU7P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::26) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 30994ac8-3efd-4f02-2a26-08dcef7c4f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uvtD8AzF8+h6RkzXaYpOl+xnGF1jCQcicviYei9AVSikACoaifm8k4rcv4d2?=
 =?us-ascii?Q?mXscYVFGv/o6Nrp5SUlIoCDgMQqMWcqxXnjkUexI4apivSs03duMyJuFm91d?=
 =?us-ascii?Q?9YDQ7l3xzSYzuRO1morSjjGu9UKP+VXOMHMVtWlLiS9j+Qm0n3jxfa8ipKb0?=
 =?us-ascii?Q?iOESdnoFD3ZYL4xGmTNgqql44qbokhD9Tip3Fk74eu6lvYBikoTGPun+8PK0?=
 =?us-ascii?Q?RoVHN2ulkwxXdED4dnWYEVgGHYzKWsyi22MCgBfWA0b467oxGbxd/hVbyQ68?=
 =?us-ascii?Q?XT9DgvELvem9/VLyUbaw/kVG3DYP6WejIe4UENXOpDhCLHRIn42s2nLWAO4J?=
 =?us-ascii?Q?raTe68ZU050wmpiEoOuaK++CPMFYFTcjttZgbFxAz882ruJBHtPjdShvJ9JP?=
 =?us-ascii?Q?RYGzEXmsKUqraJEIM8NkqNEYpY//KDhyUde93SxovrVTaSq/skXiW9IlMCX8?=
 =?us-ascii?Q?OEkZR+jZ03wg4x5bdEFmGtqlPozG1m8Etnh86pIkQkcEgRADhwn36E9006Nh?=
 =?us-ascii?Q?5VsQIPOn2XiRITg5vX1KwBifQpo057QOa35L4LZ45etHgtPFgtfHKt6+V0wM?=
 =?us-ascii?Q?xgufXsk4GrXDMD6NZFy2LFpRce3prxmOI/3eZsNi7oblJRFH5UMP8Uel/HR1?=
 =?us-ascii?Q?7GsFF5yPCIiu0jWUYM+9hVcaipK6Pu0sMdj/4FcLSZE9xO1r0+VA7FK8RfJU?=
 =?us-ascii?Q?O8KqT9CcVAxL8DDQprA5YtocXO5bnRXzpZkWX6Jp3VSL3xW6j1eFDKfc0OtG?=
 =?us-ascii?Q?c9gAIc0m2FvS3Jdyzh4PniU7kxAbf5JEvAlJkfMiSzo8qznN1DTqoTJNO9Uv?=
 =?us-ascii?Q?fC1qJRjfqkdNeSOZ7mIdXfxlJVbYjrvOwzQK5lCAndSt30+pzyza96zlz1KG?=
 =?us-ascii?Q?IduKd7SB5qCj1x01QJ/5S+5PFtHw8qoRMfbkLC0vgLCcmRg2bR6fp9LzXnFp?=
 =?us-ascii?Q?wtUz8z+dOisAbN1aZBZXx9OxvTakrrPcmbEADKsYr7Z7HX6LHYfXSMEmR2rF?=
 =?us-ascii?Q?9bKeWB5c481wLWo0URorhxhDKw3AshdtYCE5+hSbijsHYEbGO9T27cHrBCsh?=
 =?us-ascii?Q?1cEf/4IzBLziBc6hNl717XTv8vfPnhScj6wDcSi1YyxJxLcWlaYyC0RAqz5R?=
 =?us-ascii?Q?eWYoeDO89hC4ebL23OAr54/Tw/2FhzbszOSvbTOtQShpXhAJq8Vd7QmpAW+Y?=
 =?us-ascii?Q?KbFVrWbZ3jN7Zux6aimmqCEEQ5FJHEx09coE5JEdWZBz+VfdKihfh00in0Rm?=
 =?us-ascii?Q?LEIg4iGnUrmP/wCPpsVv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rmHnpw03UVqChIOLbXkBZWU7fW98b6m/qWAfm5aRqDJTFo9QIMaKv5nWpoeq?=
 =?us-ascii?Q?kvNIQUyztdnso0SZetzp8o/vTdMUKsNOBzRdWBp+qJ1+fZRhIMwDnJCG9WyV?=
 =?us-ascii?Q?YXQgofdz5wWh5W5lemkhl5Dg1diXKFXtu5X2ncWaJRTUlK0nBn3QvM0UNYqp?=
 =?us-ascii?Q?f/lHfdXhpRO12cTWlMBF2qC2k6z1glapN7XoKcnFXeV5mAQmrNm6od892/oP?=
 =?us-ascii?Q?j/aQXVQ/c8lVZ8uHQdROpVcjLmj9xni6gAEr8VwLkEpD1R93HMgL2hoj/E0V?=
 =?us-ascii?Q?7qc44yo5sKTZgRloynkf/FG0R2jowiMv5lxGs7yrUTYFXYWJHfuB50slPkAV?=
 =?us-ascii?Q?QntQwujaKrtWNQh//g6Hrjhm39PxhasITdIVtGzOtjVfFcSxA7q89NOHtRwI?=
 =?us-ascii?Q?jS+8p1Dbc87W5MEs0pdEVsz/SjoWZ92x4npxeQmouZMazwF+a37BXak2tyRN?=
 =?us-ascii?Q?F06xBXuIwH+Irk0UCpZ1ZdHTTuYyl2qnU3XWkSrrfKLD4kxE84Ibe4HJ+wL+?=
 =?us-ascii?Q?AJm/a5C/vuE6b3lllFoFfWv9fNsPg3JoWavI5aQA2K+Qs6foNIMB1RbM+YBY?=
 =?us-ascii?Q?iOA8jA2K/0VDkVG1NhHfkkBsvtIlh+0i6laY2QUtG2F8W2Sh1DLMNPhewdEX?=
 =?us-ascii?Q?CMXERraiIR9WpfkrYmnoiONTtySywF0hQpHMm+zx158NbyP5mRy/hGFwii9H?=
 =?us-ascii?Q?NyUbJf9vrdnL6XrHFL3D5gTsnqCt+wwDjCN3As/RFQxsE8MSY6c69n1DtLcI?=
 =?us-ascii?Q?HLGK8gHB2gJrv5z5UIpapSSJ7YqOAQqR1nR6V98s+kaIrLxP5Pv+bYnoptu+?=
 =?us-ascii?Q?TumDvYxj2vpET1tDihiYEO89Dk+MwPdFOLtGVxo4m/jrmiy71z4g5phfR3c3?=
 =?us-ascii?Q?A4TgetVpchmYMAdFaVzLA0cg0atHOvFJdEA0tGXxKOtAyz+wfkQ7QBlHDULP?=
 =?us-ascii?Q?r+voEcqtO6CtXllgulINvsakbaMC3q+ZisHYzEmk+INsmT9/4/7MAMBtnFD9?=
 =?us-ascii?Q?k1iXMvEVKUWseDY2yKIbImuTkx7790pK0oYPPdK/9kn3hYo7cpAhePW/gEX3?=
 =?us-ascii?Q?JIGmdBLVZwwPm06wxbUUx2eQvzKJdvxYSmsGn2swUwfjeN4/D0xZidxrgzSR?=
 =?us-ascii?Q?DAAhgF7bUVKOFagl2IobEl2hpWuXaftv0d69DkrsiT4T3QDdGIiHtr6NnAdc?=
 =?us-ascii?Q?A2oXkZGoSuqu667pLkNVVEm+JVe+v92Ue792c/wCdZZeFZt9r97M91dTCP4T?=
 =?us-ascii?Q?VNbxPXd7p3tqdHmOD45aaGkZUOkWeYQ2quu5aX6ohbN17BCszIwH67qwTsXX?=
 =?us-ascii?Q?N7Aoxl4wngQ9DAC0A810U5jvSUtisJp7cAXgH13S4MP/O434ypg1ey7VriW3?=
 =?us-ascii?Q?sUxHGWYuzJ44FC9H/ZFHak8s7qc5X0yNEagdcKlF3HhOtRlfwDqX+/kmOJ7Z?=
 =?us-ascii?Q?zJrdajbjYfaDTKHpIqEn8nm6XHdSzyagF3pHsowT4ILgQQBGsNnrB/H19+qH?=
 =?us-ascii?Q?tTXKLdM0BxSx6m8ikCqbE3B/QyYYs7cYcDTQDbdVRYiJSe7Eb/EiF2yz4j+Z?=
 =?us-ascii?Q?mv6vv6wXLxEYfzca9iqBfozwTho60ANE0IMjKhuSyP6tzg+DNAk5+GN+J5Hr?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30994ac8-3efd-4f02-2a26-08dcef7c4f95
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 13:53:57.2129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELsMVYuMk48dFRqiHtieiZ/hCAUPG3Z6VnwmQK+6if8zlCNTpA6io7HTvwWLbI7E0KVILaLnw76Q5AgzOkpAfvfaWj/j9YwbIx78LT0laUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7088
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

On Fri, Oct 18, 2024 at 03:41:16PM +0200, Nirmoy Das wrote:
> Hi Francois,
> 
> On 10/16/2024 10:23 AM, Nirmoy Das wrote:
> > This shouldn't happen but seen this while debugging ufence timeout
> > issue time to time so log it to isolate this particular case.
> >
> > v2: s/XE_WARN_ON/drm_dbg(Maarten)
> >
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Francois Dugast <francois.dugast@intel.com> #v1
> 
> 
> is your r-b valid for v2 as well ?

Yes it is.

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> 
> 
> Regards,
> 
> Nirmoy
> 
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sync.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > index 2e72c06fd40d..a90480c6aecf 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -83,6 +83,8 @@ static void user_fence_worker(struct work_struct *w)
> >  			XE_WARN_ON("Copy to user failed");
> >  		kthread_unuse_mm(ufence->mm);
> >  		mmput(ufence->mm);
> > +	} else {
> > +		drm_dbg(&ufence->xe->drm, "mmget_not_zero() failed, ufence wasn't signaled\n");
> >  	}
> >  
> >  	wake_up_all(&ufence->xe->ufence_wq);
