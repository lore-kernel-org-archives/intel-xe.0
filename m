Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53315CD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 18:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1561410E351;
	Mon, 25 May 2026 18:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NA1c5Oef";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17FA10E351
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 18:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779733279; x=1811269279;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2YK9zidamsb4MJ1wyukC9eMdBiCRmVbFTDaXIR5KqPo=;
 b=NA1c5OefGDLPsLhxw6m50kvOSB6LgTOdOsdpBAY9Pjqfg1x0n2lCMU/J
 jqJLqec5XdFH+pzq5NAoYBKHYHm06OoTF3qal7IZdbFxqCO6UM9f7lcsX
 Yg9J87wL/F2+X4VNbIelYjtKKfCXXRUCZdtQPk5z/KfH5Za6QdXL42P6a
 t8EvzaxMzGvO8MGETyV5ByF3r5Est2/4gaaY8S8aL0M9kaXESiDVNXFt+
 z0NLHjT7aN8+kBwEp50tCtcTFuAehmPKh83BdI7nfjA8DKcK6IjZP6oPr
 6a8+Rz33DUNzA98iD39+ua1ZSdNZFTGcHZ7Jt4cQDH/DXUQRSWZidiIKT Q==;
X-CSE-ConnectionGUID: I8Q1Ep+ZQ/iWda1hKEVLoQ==
X-CSE-MsgGUID: S7RAuoZkSlCzfDVFCo2raQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="97980576"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="97980576"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:21:19 -0700
X-CSE-ConnectionGUID: S8hjR8N+S2ScA4jEZin3Fw==
X-CSE-MsgGUID: gBNwvEdKSnWAk7poLjm8+Q==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:21:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:21:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 11:21:18 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:21:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlU5sKcSgcvF6LYA52HK0gq7LRVLbJ/op2hS5qrCb/x0I1xpGveBszmdGShSWQhKJliOMzrKFs0HgyFioOvxOpJYq40ti2/dBWrxTmcZ6E79eUNY8T4QBXafEAiWod/gz1UxY9i1p9B+q+AaCy0ZqQpPzaGCI9E1RxFhoBv38TT2yznYRELKYBQ3b6WSkPWTvuHOri9E/sY0n+tkv09tPFUP140mdWiub/cjVOZHGGZzrJATFGfUihoZkAHtZLDsyu37GAjGVx7caoQTyz/LIdWUas0iYqykEl761hF+kzOR6TNiA2DKiei79B2RtCbE7G671nh8rso6u6neAoFBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDOBZKtqcajDga9piROxNBzPE4baCNxrDudo/u4LuB0=;
 b=SQ2kazDRkMfS8oelRngBiHEsXfkSF9hbEdKN0oN/OPYYaNnIkYloVJpJiT0JK+7gl66OxqKQYccYusI5VxBsvprXjFhLWs8TNA1wUoZnDjE+HNGytEreblWRx6UzQ9c0TFGsBCeJPJHE/3U997QONg8ZGWYCDzBg/sXOdiXunLUYqi/jl5WCbOiE9JxitMXxMyd6V40qDOcItxeaHmU53KA7Dxt5avFA7sWN3wSSxBozTK0ijONT1AI8I0YYoe/o2GaLSkn5W3kpOm6nJ1iC1Y7mJ8bxDnqCGAv9kz+cCDGHpZQicxLs9j7yQth2pp5msTDMzv98gsMRo3t7g62gGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by BL1PR11MB5286.namprd11.prod.outlook.com (2603:10b6:208:312::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 18:21:14 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 18:21:14 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 4/6] drm/xe: Separate early xe_device initialization
In-Reply-To: <20260525160529.15890-5-michal.wajdeczko@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-5-michal.wajdeczko@intel.com>
Date: Mon, 25 May 2026 15:21:11 -0300
Message-ID: <87bje3ic4o.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:a03:255::25) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|BL1PR11MB5286:EE_
X-MS-Office365-Filtering-Correlation-Id: 721a3541-dc12-4ad9-c069-08deba8a67fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|4143699003|6133799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PgMBw6EHs/qArnm8OrhB5gRH40dbZ3UVPbxdMkIoysAuuqXLa5GeopU0J/ZgxwGm6oqFGcx3DzoVVdR2ZabJdQCq9Iy+esFocs5Wf7G1nHnuy0fspQAAFsuiTbl6IdielbO09KCivv0GLcvljOEIKPKkaxMxqvTtJgZLQx7aH9BV+aEY+S1IilKkPMWpUkE5XJcq3rnyJdjBGTblXEqqMh7S/aM4J9Sj2XycyHwdQVFw1RaYqDDlvsYiKe9Uy1Z1lz7C+oLJw29Qyhckx/S0KPuMao8HLCizQEFueA0mSgmIk3DZUhuo5eTS/YZbIfm3BbkCwlDcWOYQS//9OstHB/kkY7RmhVA9+M7kP5fJKK0gMYB39ayVp6RNxJl+9tTYMamxYRLzknMQJn9azgNIChCr87rj886v16Q1+ZyGH38opMbnbmxCj/JxhC9n5e0suf/rkgdQqi63VwtxOjjJx3frhbPk4LfZrDYsEsvgMs/SyQVNb9yygyqU+Av3S2SPhLTBgD8daKpjpD+QAK5x3LjMbs0gmoDy0d/7jSyx2UAjiXM/X5h7YRBgGDS+tP3f6fLitaeQdwrG3Vwr0RbLL75oe3VqMGUAzdt/hDSPAdHFq4W8R28BVOtpaLA4IChy4PB4ILRiNWmXXId+xtD2oHMdl5/EeFc5EcHR9tk77ZzWRWUyw2WWjIqLT0pyipqP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(6133799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1HAijoGcAL+rrdvLM8piFxSCwaaK2AC8SARwxi4Er458eORpms9rNJOi4Tgj?=
 =?us-ascii?Q?RiKpdbZhpvxM7mor3HtxWCFKqiQ/Vix7ooBpWi3DH5w17YN0ELOUVV20/EiP?=
 =?us-ascii?Q?1PBptmd5JqKGO6zgKCfjtWzwQqJyH66C77vp/X9koNiXF7oLnwY229Mu+k1f?=
 =?us-ascii?Q?pukWy+RQqVTlJfkpaSPmoMReU2BhJ4xiQUrMDgvyvBRApBSmSR/MCK48e/Po?=
 =?us-ascii?Q?4N5K4okGoNjXDueW1wBb1zEO/jepgq++AdsRk7fXChXMshdDr02TnP9lgSvi?=
 =?us-ascii?Q?96N4Jff6Sp9DyYfQJGP+tT9H6juaZ/+z/GFav5YQknOnv7EU1NgKpPg/vIMw?=
 =?us-ascii?Q?NFVfEnC+9B78d5v47zB98yUpd8HWkKir7E2ckvQVOiii+2aFxjoErIIJAdpg?=
 =?us-ascii?Q?fVyjaBgG8V4esSh+uKqBuJ/D+YFF9LSMHm42Ea4ZfGMp5PC48BrxKzTEGibU?=
 =?us-ascii?Q?qjZWsUJSm0LO7lMkfJGCEGUUb15yc3s7WP2DSGuWyFLUL2Qcr1lvRDYTCNTA?=
 =?us-ascii?Q?j7VZmAEImDZ7kSCG1O0EjlrSr/v3GIc5W01K69kINbH333gQPI1oGzJcA8M2?=
 =?us-ascii?Q?+NNthsQKRv3sYoqz2IFgv5Jfmd4I9VZXk5Ru7Mo+UfkUr0Q5CfLRJ32H6Qwt?=
 =?us-ascii?Q?QEPyNPgZVJfJgb/QhrLgLV9JAEdUTaCF+Zxe2I11dzJDUdmoxWZXRE8InmSZ?=
 =?us-ascii?Q?9g+MyjNfT3A7/2cpmndDUp1mtBOsajSbe9qjgkDrSwlEK0vodLwAQwpMR/b0?=
 =?us-ascii?Q?lq0b0yt2dkiKglpftFU/RtOJ5s1hXhcNobx4r4zAE5OAOcLKbOyEtzj5UpBH?=
 =?us-ascii?Q?YJMBASWPQ996EI/bIT3FKNTXPy1W2ApqPKQ7wIBElhTaI/8j2wwnGFL1+pto?=
 =?us-ascii?Q?2j/h2FydQeaUmVcsrw6HdYHY1SpdC5vEcgG/PL/nXGWn1v2o2PWYqdQcZSvC?=
 =?us-ascii?Q?3MCOe2N3F3J/Ruf4A3uZ1QudSdU24hJv7fm7eTgx+UUdtdXkufkB4jsNXGhK?=
 =?us-ascii?Q?2GpAjdhekFA7d6DnNBbRN5FMWcpaY9QtMicoZaN6p2wlq2iRj4+3Kp1UJZNu?=
 =?us-ascii?Q?fZUVjri5+Asg0eiUfM6gg+jUtYjUKvg0BnYP0ID0JuMnSTeYO6svXTYWBxRh?=
 =?us-ascii?Q?Yio5y4i5yPDAAEEttovowVq57Mc448mHhP0ffUW1CbNNQ3OcRrQXxRAsr5tj?=
 =?us-ascii?Q?SNZoUJ4DtqqXj4Lmm1HJlF5gqCP3HS09rybyavHjxHCqSBt1zsYZyNDdjs3Z?=
 =?us-ascii?Q?uX6l7izqSacJqatrBdp36cvcS5mxiZfzplFrSmMoIaq8AJWiNcczt2yHSqe4?=
 =?us-ascii?Q?E6BQd3klYnQnmUmfzySRrgZpADhbrn/xsp3yvBIwrgwEEwyof3M7kvtnf5bf?=
 =?us-ascii?Q?++aMzlhDqMEqzLlx1iuDj90jtxRjLwkcsJNYWVEH5VOw9cyVOb1K9SXUVnCh?=
 =?us-ascii?Q?2r8MsGBKJ7LQ5hHE712tzIxbeu8ebwKC4e7Kuce/YaGlkpdlx2CUFuJTX0jT?=
 =?us-ascii?Q?AcGuaQ9JW9R3IUp2OH3s55dzSNTvRhr+y8pqPeO9w63bFRlGqbl87ycw6dyz?=
 =?us-ascii?Q?OspSwm9yZAnaPGkSBWEHkiwKRjwLYOEOTXexsRC2X+6k6N5dEaDyEsNdCivM?=
 =?us-ascii?Q?2izdAQN+ukwsJOFCf8aulJaXW7McZX3eEffkMZD0HZHJHo3Sse0DlQe8nkbB?=
 =?us-ascii?Q?Df51Vx0ftYofiKvDOb/xBcnbjS6B9DhsbPYeYeSZrVuEw2RrGBQf5iVYyZv6?=
 =?us-ascii?Q?BfMQvf3s/A=3D=3D?=
X-Exchange-RoutingPolicyChecked: ZOlJrKgLk8jRZ9Jq3JgLegM1mm3oBOLwya6KtjxtcgVbUtu4zho02IAOd/ZzGpheFboP05zPGCUIUG8ejGSjGNpHMO1AibBcRK4wC517OVatKQp2zxJZ5si9YmCdY4o5i2+tye76N7vGXmXEipApRlPhpwv87CyKiM4uadIc3PAvv3gQq1lrajAjuVW/yw2aTvdMCw8vYPtP7RmGxIx5Wam/zbnOAjxGZsurMEG2/++qbk5AOqtzrCyAk7GjwKwD9YmkqO4DNx4QTT/JuH/+D657DhNKi+YxSMQHic2GXd63qEoeu/YnajtvPtspXnfX/SD1woTxtq+LKPISpTPsmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 721a3541-dc12-4ad9-c069-08deba8a67fa
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 18:21:14.7369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AsC6w5sjnFj73MSRsChFqi9RELY2Aw3BqJhdNZ91uAhg1B/kq1zlvoPWF3HQaZb/S0MBDuYT6Nitatc8Pvh7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5286
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> We would like to initialize more of the xe_device struct also from
> the kunit code, as it should be safe to use most of the generic drm
> or xe components without doing any additional tweaks. Separate early
> xe initialization code to a new function, so it can be reused.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 39 ++++++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_device.h |  1 +
>  2 files changed, 29 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b498147dcf61..7ba407f73a02 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -506,27 +506,45 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>  	if (IS_ERR(xe))
>  		return xe;
>  
> +	err = xe_device_init_early(xe);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	return xe;
> +}
> +ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
> +
> +/**
> + * xe_device_init_early() - Initialize a new &xe_device instance
> + * @xe: the &xe_device to initialize
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_device_init_early(struct xe_device *xe)
> +{
> +	int err;
> +
>  	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>  			      xe->drm.anon_inode->i_mapping,
>  			      xe->drm.vma_offset_manager, 0);
> -	if (WARN_ON(err))
> -		return ERR_PTR(err);
> +	if (err)
> +		return err;
>  
>  	xe_bo_dev_init(&xe->bo_device);
>  	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);

Curious: are the drmm_* calls going to work fine for the automated
teardown when they are called from a kunit context?

What about devm_* calls? From a quick look, I know that at least
xe_bo_pinned_init() will make one of those.

>  	if (err)
> -		return ERR_PTR(err);
> +		return err;
>  
>  	err = xe_shrinker_create(xe);
>  	if (err)
> -		return ERR_PTR(err);
> +		return err;
>  
>  	xe->atomic_svm_timeslice_ms = 5;
>  	xe->min_run_period_lr_ms = 5;
>  
>  	err = xe_irq_init(xe);
>  	if (err)
> -		return ERR_PTR(err);
> +		return err;
>  
>  	xe_validation_device_init(&xe->val);
>  
> @@ -536,7 +554,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>  
>  	err = xe_pagemap_shrinker_create(xe);
>  	if (err)
> -		return ERR_PTR(err);
> +		return err;
>  
>  	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
>  
> @@ -555,7 +573,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>  
>  	err = xe_bo_pinned_init(xe);
>  	if (err)
> -		return ERR_PTR(err);
> +		return err;
>  
>  	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
>  						       WQ_MEM_RECLAIM);
> @@ -569,16 +587,15 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>  		 * drmm_add_action_or_reset register above
>  		 */
>  		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
> -		return ERR_PTR(-ENOMEM);
> +		return -ENOMEM;
>  	}
>  
>  	err = drmm_mutex_init(&xe->drm, &xe->pmt.lock);
>  	if (err)
> -		return ERR_PTR(err);
> +		return err;
>  
> -	return xe;
> +	return 0;
>  }
> -ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */

So, there are things allocated/initialized in xe_device_create() that
get deallocated/finalized in xe_device_destroy().  With this change, we
now have things extracted out of xe_device_create() into
xe_device_init_early(), and it appears that xe_device_destroy() is now
really the counterpart of the latter than the former.

I think we should just call the function xe_device_init() and then
rename xe_device_destroy() to xe_device_fini().

>  
>  static bool xe_driver_flr_disabled(struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 27cd2329b99f..975768a6a9c8 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -44,6 +44,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>  }
>  
>  struct xe_device *xe_device_create(struct pci_dev *pdev);
> +int xe_device_init_early(struct xe_device *xe);

Right now we do not have any external users for this function.  We could
keep it static until we get to use them in kunit.

That said, I think it would also make sense to separate it completely
from xe_device_create(), i.e., have xe_pci.c call the two functions
instead of xe_device_init_early() being implicitly called by
xe_device_create().  I think that would be more alligned with the
function names.

--
Gustavo Sousa

>  int xe_device_probe_early(struct xe_device *xe);
>  int xe_device_probe(struct xe_device *xe);
>  void xe_device_remove(struct xe_device *xe);
> -- 
> 2.47.1
