Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC00EFF8873
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 13:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E01710E1C2;
	Thu, 30 Apr 2026 13:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F32uqIV2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26AB10E1C2
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777554173; x=1809090173;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CokvTpyO46Ndrt0wCNBAtlqIY6MBCImVi3fhRALe/AU=;
 b=F32uqIV2k775B1QWyKJueeeMzFtMqWAQhQdv6eFDDTU1TyxSC0oQZK5H
 u7tqY3tSp++2pLyDV9zUanZ5kn/wGF3AsFPpY72DojRezwZmLbAKiH9gQ
 RGQ7FlLqrY0GDwoC/dSl/ji5TJIXoJa8H8l1fo43yUz128nre7YW8iNlq
 Qm8+kagkMk+6+b+IRqAyR1qVYnYO5Pk7Rk0vn9wXwFygfKKW7dgOYrigf
 YPIXsFZ1o4mepofdvKFJ9aoSGig+tl68luSW1u8tnzHudpwVJ2QiVCaul
 XRIp1OB0VCsJVVKwggzWQQUAREPNViOQYN6OiebypiFN02i7Twovwr/No w==;
X-CSE-ConnectionGUID: 7Qo+Ub1SQ32mKOGGJqv68Q==
X-CSE-MsgGUID: cRC+TiJHRZ2cctB6NEdE+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89098518"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="89098518"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:02:53 -0700
X-CSE-ConnectionGUID: 2gbdp9g1RKqBljYewGDn0g==
X-CSE-MsgGUID: iLNnywg/QrmXn3ZqAGme0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="239562023"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:02:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 06:02:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 06:02:53 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.67)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 06:02:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ji2EHwTCILfo9TUVi5Kia4tH+CuldYqMciFinc10qh9dr5eCnI+Nzf4msvXfokv2L8PHH98ht/JSvBY8JJNOoSACl1pI4f6vxi/+tEIEizoxIdcAkA5VpkCIkU1KeZTgFD8gC+v1Y4TBEnH+nAQSgqrLZzs1dRPWFUD1tBD0ASiNn5n4yNXF3xfdUCF0jUT0NEh4CPxAmHLNwIdITDVFG7efhcvJV7Rpu1BknDBmfqRCNKKq2x4nW6Uh9FYkOOy/FPobhUyF52i/jW7E0CA+vhG5pRv58MdauyDmNUfPDoblCBq88ojg28RMPg0KDa8VptlS2pqymMld+acu3HGXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFEbzniG+/Areo4F/cJHsIk30QR7DJcP9ELfeYtLlz4=;
 b=hoxhUWftZTNMN11iKwB0WfWz/ie4dRwYt+ak+nNRgFFKiLlyhNiGSZ//kecRwtHBhv9JOQfiNNy1rioEAJWW/O/EvtvXOo3kTXNeKv6mY+31PiEZxSQLjMYz89dthXu0sjNgm0Mcst6ELezqXQRC9o9XndQjkjQ7moJJ8oMR1QNdMPpCUr0ixzOtH/xmLK/3bG0DoJ/E1uFqr9bilZfgSMDFOyuaadjX4YrxVl3yUP3ka2E8PEwS584rsX+xRK0Gk1ZP2UqYlfuNSdZ+9HvOSsXIMd02wEEnQ+cYBptNvwAcns/8fkFeda3cyZ9EWZdH4lwmqyBRsxdKdsNgLV+AaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 by PH3PPF37F43E35D.namprd11.prod.outlook.com (2603:10b6:518:1::d16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 13:02:47 +0000
Received: from BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5]) by BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5%5]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 13:02:47 +0000
Date: Thu, 30 Apr 2026 18:28:20 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 04/13] drm/xe: Skip device access during PCI error
 recovery
Message-ID: <vtkxftaqr2aaiv7pjo5nxiv6f3eataby3qfpildmz3jko4fhoh@oxuppfnttdzv>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-19-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260417085812.4013309-19-riana.tauro@intel.com>
X-ClientProxiedBy: MA5P287CA0049.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::12) To BN9PR11MB5242.namprd11.prod.outlook.com
 (2603:10b6:408:133::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5242:EE_|PH3PPF37F43E35D:EE_
X-MS-Office365-Filtering-Correlation-Id: dd20506c-5505-4b00-5767-08dea6b8c707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|27256017;
X-Microsoft-Antispam-Message-Info: VfYk7/Q6dP7aevRhH2AGt3bpRW1JwIN6eUC31BOyIyeVLAp62OeBM+RGBYPLywVNBHJlvV3y8yWfdhXQLqYULumgS135MqiU7qYpS6FV3Irbog+XWiO0N/19tLz/vnMqfUvWzJewC02H52d4l4BGv9Kc+h+QDoxaJrqNZ3ATOqRVt7wYk7/JAYkALWvdDxXqBeThOJHpEhU1yjIQnixZrBdOT8u4G3RKZUSkB0xuf27hsBphPkYoWJry9xmhCHZA9LV63zJZYxzCieDSMxc0v2GNkXoAVu1j1dgMcCI82nnfoRhxqPqz24E0fLDGIoX1mFa3jya0DuBiTHGvA5nDyQhzC07fA1dKGgU8+aZ8io2BksWsUdWsamDqD/c/ZVuC9DDgDJKjuDTZ4lQwB2V4DebUNyVgko6q2yluVzEA30NBuVsy3pjPHwyJTpbgP/vV4ssPrT+y9cyocV4ix0AtEXfXZbyFTTrrIF8s1gFnkPq1Disq34wAkyyhr2kDt02O9NxAbVMRNbS/+Vu5HNGNL/Gr6FyYHsTBdLFthuYsdIQQ+GOiePNMXGikLB4EFf/ynLvDNq7OOPaVUqNCyjocouOlOBt+EMkdtfwIEFgksef+ZgV4cZ6CMWNBGW0wGKAJWGNpgo1pzifS/GQMx41giURgX2SBHGCNL2mX7XWV0EXnCMaPXF9RYYb+rUxvpNHmuiZMLer0u2oEvhB7ecoRTSQdC71pb1Bhax7LDy4kHFgbzYBrAOLs0PCgRFmlxtAe1W4F4udaiFUSipEf491DWxsyka8lScJJNQhT1QU7bHA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5242.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zTK7YkXQ/n+NJixM1AQ6qOs4cdoHNjG5uESbXEL9U1xZTjMc58rnVh5bYCmZ?=
 =?us-ascii?Q?5FeOawcOf7xgVE6zkjlX5GEwVojuTp56j1Sk2BsmESej7azhYhdNynxrQZyc?=
 =?us-ascii?Q?G57vToWnIFq42Xod28kBjDR1yGLG3EbSBWRK+iw4P1bntRWEa4LeK3Fmy571?=
 =?us-ascii?Q?4ARZ3zwfmXHGWdX6m+CWoLMC/OLqApfAQpQ4LnqsZTLpJGbjG50jNAVxX0iz?=
 =?us-ascii?Q?CKfbYQ24OFoBASjxMBP9k9amPACWiFfZP6PDzFSJ+ZgCovQQovv8HlqY/65N?=
 =?us-ascii?Q?5p83z2WjoFbbj2ceJPcQn0Ljybg5ydDMflN6Te2FV7yem/yxCULpn04MI2ks?=
 =?us-ascii?Q?gukSc+J2hdOYcqeNADPHDntUvp2XIHQQqkbtPRD7I/deB76to/0YH/FrfTLB?=
 =?us-ascii?Q?kYflBIz1pyInaFT6t9RKad77GMjBJzxh4uZprm+5DyTb7NUPld7pSxjg6Xjd?=
 =?us-ascii?Q?smS5ywzfo9slGv5XbmuwxeUfkYiByS8Qrd8qIrfqqSPsKMSXfwUVtQx5vE2a?=
 =?us-ascii?Q?p00AztQlUuuIfGrGK+vd/Rxd7WlnOU21yhpwAuPDLqJ8Ug4ENGfw+WysSSgi?=
 =?us-ascii?Q?uzwVmds8ADbzBkBi8UScSirxjUaSvX5SylVUCCYYSyGwIWKtTWXQ6sMjgmHX?=
 =?us-ascii?Q?P509jOcSHkSPSvPtOsmqEi4LNen9X3LwoyiJNoYlV3Z1Sg13HksNca1urUrK?=
 =?us-ascii?Q?C5nicPi9z+zI9LlV+t8WrZ6XCmgivmv1/3mEvd8XZflf1AywBO2hcSegpUQS?=
 =?us-ascii?Q?KiJ2tOna6U/XvxqcLu+Oh0dpuzmW8357Pm0MnX9c9RKfhwcCFOlxCJhryyvW?=
 =?us-ascii?Q?ZoyT+BLkNtXTLoqNv6RaGj83KNGtsFlxk/pz+H7FKCnPBxmuI5rXAoI34G0A?=
 =?us-ascii?Q?YNacX1D/t+zz9eXOelp061ieAycbtiT2VKUUEbuQqep+N05IYTJwFe4v+Y75?=
 =?us-ascii?Q?cqzAoGIYOm1rNbKrDajnyw/lPhoBxEjntPWzyxwS3H317DdykapVLykg/N0c?=
 =?us-ascii?Q?uKFpExlgRzm5h+F2Sz8hK7v300OIQJWSypHAr5/H6BX+O1x/MKYn1utHu5J2?=
 =?us-ascii?Q?nKrL6/EniwpraTmmv1ep/uSiv00kKxrt4Ph66pKWO+gUmi8wuWNKQzsg/t84?=
 =?us-ascii?Q?E+bYFfxczabn/EdYOU6oWQDwgVK9fwzepGSVsj9cHQdwp1urVQo4IPHPTClM?=
 =?us-ascii?Q?YayRbLrrlIDT5y1On+AsEaryLwJDOYf6sFy6ujJ7reDGoBIbiKIfR8yAaxAe?=
 =?us-ascii?Q?QyxBQv8WrP6FUdl+WcXRl+IU5WyDHLmDnJA/OkZnAGEuhX5gohLvkXo0tCdt?=
 =?us-ascii?Q?r2VvvfEfdvKu+oMC264gUNIeKD0KfyusQYIKQvT4IepJPntk7vWYF5moN4EW?=
 =?us-ascii?Q?ylB7fIOA0wXWePrj3DWEOGEopZl2smH5eeOYFrPr2kjC2mBqDkL1W7I6AnCu?=
 =?us-ascii?Q?xl3u7vgxgOl9FrI8W57nU1m/a3hVQXDTo1xjlnTqWtYWDa8PBD+Um0F6v5VE?=
 =?us-ascii?Q?RdLqzjv1GBGLDGSH0fzCuPg4Gkd815yPqbvgtLeiIRp3ghjQbQ3i0YE7V08C?=
 =?us-ascii?Q?RI0sp/k4HzI5XGaCDr0YEEpTWAfvQDnVG3wBEIHXLaS5adQZiPyJIJU6/wv1?=
 =?us-ascii?Q?1uad4eircJKsB31phRex0/JDcrxyOXThf1kva4tIIXxw8S8bGUiHuPLWSdNZ?=
 =?us-ascii?Q?Lc8EJGD0voKRrDhmepp1yoW+YTwEPz4RJm5rEvp3r2ybKEUrZCg5qO/mOxU+?=
 =?us-ascii?Q?ivQXhLRtkg=3D=3D?=
X-Exchange-RoutingPolicyChecked: B93Uzcyi98SUPzV//q++mmjqzhARPeyk/9L5YXUTAwNt2YRk5aOcHQfbvu9yYH+Ue9FWOI3XpWZL0gRoivZXAvgD0cXZU9xL00izd+w4ShyD+PUnrbXHnrJHODCfxfjI8Pa58g2Uyn9KZ2o+lY5BLhe2+ptF1ZR/I82OppkoGiXmT/PWtrSwNVqK6EjQQtw+biUEUgQdCXHL/4Wv3Hx0A9XIqEbh98qJ2W6mcEWl1x/VKqi8aMJ50JZwPR4QaLbzuHOV0L2xPfS4foHe63dzDprYkhsCkqz2Ar8MWHsBREJSUs1ND+Ok60iQC68ALBbsfFOyYysUGqI1gXc7CVFGJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd20506c-5505-4b00-5767-08dea6b8c707
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5242.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 13:02:47.7701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BndDc84j9+pJkSJ/tpLhNhWfbYQ2n9QaOPGurtx+yZ3HuKLBpBMjGactYWt44Nh/v7jkOgTJY5PrMPuFQB8FYjzumQscUR6Assg/r15VC6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF37F43E35D
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

On 2026-04-17 at 14:28:16 +0530, Riana Tauro wrote:
> When a fatal error occurs and the error_detected callback is
> invoked the device is inaccessible. The error_detected callback
> wedges the device causing the jobs to timeout.
> 
> The timedout handler acquires forcewake to dump devcoredump and
> triggers a GT reset. Since the device is inacessible this causes
> errors. Skip all mmio accesses and gt reset when the device
> is in recovery.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: add check in worker (Mallesh)
> ---
>  drivers/gpu/drm/xe/xe_gt.c         | 14 +++++++++++---
>  drivers/gpu/drm/xe/xe_guc_submit.c |  9 +++++----
>  2 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 8a31c963c372..5ea5524d83af 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -917,6 +917,9 @@ static void gt_reset_worker(struct work_struct *w)
>  	if (xe_device_wedged(gt_to_xe(gt)))
>  		goto err_pm_put;
>  
> +	if (xe_device_is_in_recovery(gt_to_xe(gt)))
> +		goto err_pm_put;
> +
>  	/* We only support GT resets with GuC submission */
>  	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>  		goto err_pm_put;
> @@ -977,18 +980,23 @@ static void gt_reset_worker(struct work_struct *w)
>  
>  void xe_gt_reset_async(struct xe_gt *gt)
>  {
> -	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (xe_device_is_in_recovery(xe))
> +		return;
How is this synchronize with xe_device_set_in_recovery() a mid flight
reset can still hit the device which already passed the check
xe_device_is_in_recovery() check.

Thanks,
Anshuman
>  
>  	/* Don't do a reset while one is already in flight */
>  	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>  		return;
>  
> +	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
> +
>  	xe_gt_info(gt, "reset queued\n");
>  
>  	/* Pair with put in gt_reset_worker() if work is enqueued */
> -	xe_pm_runtime_get_noresume(gt_to_xe(gt));
> +	xe_pm_runtime_get_noresume(xe);
>  	if (!queue_work(gt->ordered_wq, &gt->reset.worker))
> -		xe_pm_runtime_put(gt_to_xe(gt));
> +		xe_pm_runtime_put(xe);
>  }
>  
>  void xe_gt_suspend_prepare(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 10556156eaad..1f32fb14a5c1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1522,7 +1522,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * If devcoredump not captured and GuC capture for the job is not ready
>  	 * do manual capture first and decide later if we need to use it
>  	 */
> -	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
> +	if (!xe_device_is_in_recovery(xe) && !exec_queue_killed(q) && !xe->devcoredump.captured &&
>  	    !xe_guc_capture_get_matching_and_lock(q)) {
>  		/* take force wake before engine register manual capture */
>  		CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> @@ -1544,8 +1544,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	set_exec_queue_banned(q);
>  
>  	/* Kick job / queue off hardware */
> -	if (!wedged && (exec_queue_enabled(primary) ||
> -			exec_queue_pending_disable(primary))) {
> +	if (!xe_device_is_in_recovery(xe) && !wedged &&
> +	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
>  		int ret;
>  
>  		if (exec_queue_reset(primary))
> @@ -1613,7 +1613,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  
>  	trace_xe_sched_job_timedout(job);
>  
> -	if (!exec_queue_killed(q))
> +	/* Do not access device if in recovery */
> +	if (!xe_device_is_in_recovery(xe) && !exec_queue_killed(q))
>  		xe_devcoredump(q, job,
>  			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
>  			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> -- 
> 2.47.1
> 
