Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52851CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 18:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B1E10E354;
	Fri, 16 Oct 2026 18:42:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F01410E354
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 18:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792176166; x=1823712166;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6PKd8zeKfypU+/op3HnKePpXP2qqFOukWKE/okQPXpA=;
 b=KdMr6hMXPUTUQYqi7Jy5YlJClMVWbTuTOrHjJgsny6UGhFciCoBe5Fvb
 sj63BZmSEcMTpSOMMEQBgnWv+GEW1BYpHJE3xekqWZooCXtNk/y7fz4fT
 5gjdibdMM3xIWG7VGLOXQY5g9tii7NsWclZKwJhIbRSeKQq31EzTyM0Xe
 5UgBsWQ5s5Aaf3qGVowaNVuHoSeOaUigZpGZ/orCsga/MEwLqaTgRNt0U
 aAOJKiDYEYkXDRp263XnBsVpLsFyiUCGld+NGveGw0e5YhwbiicD8yGcI
 kJf863lOMyLbPdCRLNf6xnH/NjYXM8emrAyYDCRcG/YkXGgq9suaWQdBU w==;
X-CSE-ConnectionGUID: fK7t51NnTeCNlIeIMrEK6Q==
X-CSE-MsgGUID: wOIkAtrlTKytP3q/bHz/jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="854752"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="854752"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:42:46 -0700
X-CSE-ConnectionGUID: jKNHDNnAT0S0adHhVBM5ZA==
X-CSE-MsgGUID: 4JKaW0MwQCmV46WDXNe3Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="3787105"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:42:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:42:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 11:42:45 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:42:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTLXm7cK65U9RPcJkLk+Hjd9I3kCVOCURycVGIn1wYu+b1csIhKiBX0tH7LzOj0et0OggCMxzfbPR0ZPFsOBjLJayLH63B1GEwsrD43QbgKXLLMKgjBO7h8R7374Cz3keTUU9Hu0ljDLcCULxiuzl8oSKdjomo7p+BrjeYxe0UniJ4l/o/A1faZgzRENU2jEukajgsWGXgqvpqIzh8bn6GqzariVlfG2sFKVzLsN1PpuDjXNxCgQ94wPY7y9dV/1D0s1x7SAk6xvwf8rvdVGmC5T70mFdMxCEJej9TdpWN/dp8KyhTAF1rCks4a0F+gdWxOdjFGoW81iHU6Nj9Z9LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9jR3H5b7ZNae1R27s3HB/MHEVT2nklzUf2aNqGIYNk=;
 b=sZ/CeScaI+jlkDzLrnICasTvtQ9Iy0Jr9uvhFbSGP1P5aUeDlFulPBB0rhzLztya0RE9AJtpWOccMX57A/vJXhrOUv1VYG7tJN/spCIpd8+8nBJzm+k9KumHmwnR7xVQUPzjpO/ILkcA35YAXScTOEGs3V7jqM57UCtQb2Y3g5bnbsfEheep2c9tNtJplK9VQM+M4hlfuxEpksxgG4I50Ki3mt09tJ56F0lom/+P/+eF0/zege/BzTh5zutyUfkg6DKB0CU0IoKOX+s4a0WMrew6T9od6XQyWfbEYGUXia8VkHcLj1jhHm853NOtKug1hjx3YGD9vqDXXXlIrbvnoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by LV0PR11MB9790.namprd11.prod.outlook.com (2603:10b6:408:385::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 18:42:41 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 18:42:40 +0000
Date: Fri, 16 Oct 2026 11:42:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 4/4] drm/xe: Update non-purgeable shrinker batch size
 based on average BO size
Message-ID: <atJwH4nJTCVHH0gG@gsse-cloud1.jf.intel.com>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
 <20261016133523.3622-5-thomas.hellstrom@linux.intel.com>
 <sashiko-outbox-174403@kernel.org>
 <1ae33b56ae85d938aab41458e289d5124468cf5f.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ae33b56ae85d938aab41458e289d5124468cf5f.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:303:8c::15) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|LV0PR11MB9790:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2717aa-07ec-414b-e39e-08df2bb541f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9xfvRbMcZYG9BIRac+xLzAu2OdEstQ3E0o0t1lVJ3w1CbEUx6CUi2QsoW0Jx+nNHQfQntnQNpKN7QNqi0QHSfOvRJFr0K8D7cj/0tF3YLYRhV8fNhehhuj8ulYBiLEf6YAxt+KkNN9Bb0loP+jQstf5QzfDj5o7EZgGBE3CwewwPfmt4v0oNXgk7LY16hHf4LbuBLqvsh1eatrS7/qJM5sARlIU4eOavys/GXfKWEXsZcNFw6ZvyN3EFZ4xK2PNqFHQtAfX82shkoUOqgyxSTnsYCNicV9pN53ANHqN0APOiulxJShiRHqAMP7KxM9uN4Y29XAE/KTQL2TVIF6Sr8jzbMOO7kJ5H7Owvp+me1yH4wlS42z3zXYzDVNOvAcRoB8ofqNu+H8psYUaJAk/Z8A+3HkyMAX3J6SmSZvnpDZUxRMGrvS/UGcpY4v8r9ct8oWuIZNOMJc2aBIzOkqvH+mcZQBfH6tcNRu+Ns830+dVUyZSkdboaBnpGtibff6aA4cE8tSEiH1aIIKa6rrCX4Y3CpPiNn63hi8qIMNebzGGt/GjPkEs0UvHbH7QaWPdn1vprt+CILJODUJX6XmFua+c/OM6fIbzAU6FfwKUd/JEDbD4Q0XirFAOLx98k7Fjb7S8F1BXCeEd7Q8O/cgc4Ymq1AtIDWTLWCwDcjK/m8rA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EvZ8iBnTViqYmBAMlloBptNIOQ20RoMNF4RxsaQHkoVlNbkbmnlTr6kPpn?=
 =?iso-8859-1?Q?Tl1pungWdRD1eFpJqMLT1vZhfSv1CgdjkPPsujEEUQV8+MxXfgz9MSJApJ?=
 =?iso-8859-1?Q?IydCg08pO8YIHSBHKsx4DyWyucXg/gLoM2NvZHkrF2zd98Ki0WZ0jHyeMg?=
 =?iso-8859-1?Q?CO1Sp+nrZBi99IU6Q8nIBZMQsvRyvQcZmHx86oGwWzxsz4lzzEYA2ziVj9?=
 =?iso-8859-1?Q?6t0H771dJVIfwd+X4asX/iFSAL2Vog+oX3FZKdenvswiB9NTL7BsWP14Qp?=
 =?iso-8859-1?Q?k8yUAAk+KukJ8DSDI0S3V1tfSQKticRhUrNUudzUVb+6OA4ZLZ5TrJuI3E?=
 =?iso-8859-1?Q?0D+6Wig22kUvs1K/J/UQMi8iEEM7jT2fG8i0VKMJtXK5iVcFt6wBc0Ed/L?=
 =?iso-8859-1?Q?I5909La8ACPlJtjeaxOhzJPCM1P9GJ+EOrolh6Hxy8a3CrypeE7LoY2e30?=
 =?iso-8859-1?Q?4DOq/Wvo92MCpezRzQX+vLX4Cy40j7FbT0WVxkv2ZXQTLq2T2fM2WaMUXB?=
 =?iso-8859-1?Q?3brgR3U9O29f53CcCyhC6I0XElboCykg5JLm0TOYfhzV4bB+xxMpr4XtCL?=
 =?iso-8859-1?Q?VQ5FHfVXErEjfAE0yrCp+E6bgmZ0KhvaCBf4lqhYp7j/nWsailMXbRaZhH?=
 =?iso-8859-1?Q?gm/56Al6BM2d6rlWPe6Oti3B7ZHNOCdMP7eG1Cr6t9aU7nO+x/t2e2Iul5?=
 =?iso-8859-1?Q?Bp0dToBMCNHd0k6j5qXFFcpJVE49p/tlw+9ZDXsPwJ702Q5AC3+9TKJzi5?=
 =?iso-8859-1?Q?cZo4KHjm4r51qTGO20uYsR1Bqt5siO7+GGbapMoBlbYx1l1/wmGtjPW8vz?=
 =?iso-8859-1?Q?c0lBW3zaTPS1+YjwSBkQQlCL6tEH+aqfvski7hbaiz0qHxlhUP7VGDExiO?=
 =?iso-8859-1?Q?NjLceACfrLR3BuctomD/n2cf58LfHpUCSeRk3rgorupgE6N3YDCxBbUzuO?=
 =?iso-8859-1?Q?BU/cVxE0Hj3VwZ4sUvLVdsnI03nlowp/LPPAwPcq8jW68kqiTgB4/8QYRW?=
 =?iso-8859-1?Q?KXW5NpHWfhHKov6WiI4l4N4Z5bVjVrMMHoaMF2FKBPDS9MxcDI5th4bQ95?=
 =?iso-8859-1?Q?XekzCvw49SRA0kCNRB6eX9H5Mp+33RjzVzH8AOk3Fh2dINdH7hXWddEX6h?=
 =?iso-8859-1?Q?9fefSzWXda4y7bSFQox+6r+Y7izP3S2rHU8U0+cgkAvz3Q33L1mGUp7H55?=
 =?iso-8859-1?Q?WoYsa0UGpYsYtnKhp7Sjuck0hC436P+LZkqZGdi1saglqnE2Hltbve0/7T?=
 =?iso-8859-1?Q?/ZstcIhaBZt1H17WIxLTTvsddfw8g4uJiCELNk8dEr5XaAX1tiIwnfS1pj?=
 =?iso-8859-1?Q?c1uueCgQOKJEwZiMFQb4d08Lrqalxw/mWQH/P1AvD1ik3q7YfNJk2o8wMG?=
 =?iso-8859-1?Q?kgBn4PsBPI+lViqRah3skt2B+jaJJN/b9VxEIifMmgzesdxjaJbY2GaHgk?=
 =?iso-8859-1?Q?Zaalc9VG+5Ig4tuaYC/y2NBYUGJoWJtMuuOyukKewNC/Bt9XETnDtf3UM8?=
 =?iso-8859-1?Q?Iaq7rYymM00UZvgCNQLo0aOCIO8igi26vii8oKvPuT9uYIiT9h/IbNawir?=
 =?iso-8859-1?Q?DcuL1ZGoUbsqPL8rI+lpH9MXZQEYTFoacuqUkVgIMoLdF/upe9063fwXPr?=
 =?iso-8859-1?Q?MBY7+xOH/Qrm/mOYPTjey/B2C/r85g1Nj/oEtwEd73TGnSQ/OyxVAiWntu?=
 =?iso-8859-1?Q?dEARUPghxmuswGmcyiyIQYM0jC80cFssj6IJjyUdKn42goxHHQpr4ApPp+?=
 =?iso-8859-1?Q?IFYeX5SeFzfjoHgl6IqpsZ5cho2VXR81zTPCQZSAlDDswfHjL8ofjYwtFj?=
 =?iso-8859-1?Q?6jz3rsYILQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: QsXcjW4xIXUXjxjSZXbfZ38GnauTONGMic65pMBBFMwe4GU/xaRCq4oimZTABasDDfuUFZ23GEJpMzJBfIwv2c2CoD4DRCluY/Y+7jnERP840XoRIjPmQ0OyvK+/AVUfjas/Q6NuIoVwe52UucctSwklfOgN2gVj2oaq92FgB0F5NKn3mpm0H5p/035F7K7sLQoSLpWiguKabJ6XDlN7yj/G7UCDSJiJfKexJkIAt+sYWogiWk5ZMendLHtxUPbT8NO9EXlIYPWe47X/3NCB8R/FduEzPu4qfipvtW1X9Fr33hXDNqT8k4zSJHHqGv6q2QXLJp6LisZMCWq5vqrCyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2717aa-07ec-414b-e39e-08df2bb541f3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 18:42:40.6931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtlXFM0lb2OoLhuJrFCaYGs3DYYrCylCKZzJ6XtFYAWrIXKXsIyFixYF1M4F225s+MPU1bTR2URFcCiSxzxN3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9790
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

On Fri, Oct 16, 2026 at 04:06:18PM +0200, Thomas Hellström wrote:
> On Fri, 2026-10-16 at 13:45 +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue(s) to consider:
> > - [Medium] drm/xe: shrinker count callback serializes direct reclaim
> > via write_lock
> > --
> > 
> > commit a78bd8842e67f957a2ced6d827e1c4a6430ff29b
> > Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > drm/xe: Update non-purgeable shrinker batch size based on average BO
> > size
> > 
> > This commit updates the preferred vmscan batch size for the non-
> > purgeable 
> > shrinker based on the average buffer object size. It introduces an 
> > exponential moving average that is updated during the shrinker count
> > phase.
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > > b/drivers/gpu/drm/xe/xe_shrinker.c
> > > index 8e3fe675e0f34..955908b3bdf3e 100644
> > > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > [ ... ]
> > > @@ -210,15 +235,26 @@ xe_shrinker_count(struct shrinker *shrink,
> > > struct shrink_control *sc)
> > >  	unsigned long num_pages;
> > >  	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
> > >  
> > > +	if (!can_backup)
> > > +		return SHRINK_EMPTY;
> > > +
> > >  	num_pages = ttm_backup_bytes_avail() >> PAGE_SHIFT;
> > > -	read_lock(&shrinker->lock);
> > > +	/* Consistently use write_lock() for simplicity. */
> > > +	write_lock(&shrinker->lock);
> > 
> > [Severity: Medium]
> > Will this exclusive write lock create a system-wide performance
> > bottleneck
> > during memory reclaim?
> > 
> > The core mm subsystem frequently calls the shrinker's count_objects
> > callback
> > (xe_shrinker_count) from do_shrink_slab() during direct reclaim. This
> > occurs
> > concurrently across multiple allocating tasks and CPUs when under
> > memory
> > pressure.
> > 
> > By changing read_lock() to write_lock() to update the batch_avg
> > heuristic,
> > this forces all concurrent direct reclaimers system-wide to serialize
> > on this
> > single lock, which could lead to severe lock contention and
> > performance
> > degradation.
> 
> This is grossly overstated. False positive.
> 

Agree.

Matt

> /Thomas
> 
> 
> 
> > 
> > >  
> > > -	if (can_backup)
> > > -		num_pages = min_t(unsigned long, num_pages,
> > > shrinker->shrinkable_pages);
> > > -	else
> > > -		num_pages = 0;
> > > +	num_pages = min_t(unsigned long, num_pages, shrinker-
> > > >shrinkable_pages);
> > >  
> > > -	read_unlock(&shrinker->lock);
> > > +	if (shrinker->populated_tts) {
> > > +		unsigned long avg = 2 * (shrinker-
> > > >shrinkable_pages +
> > > +					 shrinker-
> > > >purgeable_pages) /
> > > +				     shrinker->populated_tts;
> > > +
> > > +		shrinker->batch_avg = max((shrinker->batch_avg +
> > > (long)avg) >> 1,
> > > +					  128L /* default
> > > SHRINK_BATCH */);
> > > +		WRITE_ONCE(shrink->batch, shrinker->batch_avg);
> > > +	}
> > > +
> > > +	write_unlock(&shrinker->lock);
> > >  
> > >  	return num_pages ? num_pages : SHRINK_EMPTY;
> > >  }
