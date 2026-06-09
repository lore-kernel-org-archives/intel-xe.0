Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178E0CD8C9D
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 00:32:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDA010E021;
	Tue,  9 Jun 2026 00:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ma86YPEH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA96710E021
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 00:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780965177; x=1812501177;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oCV0PjtdLtDX9In4fhNKGfqAgyj7P4gOm1eEkGKIT7g=;
 b=ma86YPEHXHz1FoFYxP9/Fuzgn3E1bex3mSstq+cPIOHCiUbhg658/NRG
 Av2vl+WMUU9Y+gtsjf7mRgi77aDSb53h4uuWTyPGgmcQxqbLDUm1FFooU
 QOng7F38Lj2teKUAYkadIeGRSF6JZPHxheQMJH1NK9uIzHBJKHgL713K8
 GU0zBjR5TXI5wuE2bKeTSe8n4hDnPiEcFqId16Rx5bh0FtxWMefu1p+7j
 WT+5eBYWcq6bjJp4WkjUwdGc0s5t7NPt6zIpHmU6IdBe16vfxIRXmR5fA
 eKW+azp09BcZdzd/b0SYH9ZoKgPLkRVXSKWPotHxeT0yboQCZnuu4x+hT w==;
X-CSE-ConnectionGUID: sVETEJH9QCmMbe1bAZseug==
X-CSE-MsgGUID: ySoRryIsTciGqZ/Epu1dBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="93102509"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="93102509"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 17:32:57 -0700
X-CSE-ConnectionGUID: W/Ede4IeS0uT21IlsWhyMA==
X-CSE-MsgGUID: 7VExVmZ4Qf+3dC2BNws/LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="269402339"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 17:32:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 17:32:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 17:32:55 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 17:32:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymN2MAf54x42SYBv/2VT+uHYHTKAQ81VgNCAVvd2b4JhLJS3fv+U+T9z5iMoOenhdmsEnHizVr/0/NR5aXXXbwoREpIcdLj4GOfAzyAm7n/3CQrxITW9Brdb3Bd9dKhOQ4GEcRpgPL4Og2icNXjUYWZvXgpDywHING9WxKvCvCK78XUX7qNTDuX3Lxrxlxb35c6L3gdBtFhmV2UT3Dm2jwudZQ1reOieH1Nk7bZFtXIMluHKrvDgkvKp0ZaC4rde8M9GtVTh374bSo6hH6cjLaI1jSS9AQSoNEk+jKSvKrfqFSWNqbVNIBKA9x4081Os+2BOJ54gVWBLV9R5Ok56AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEph8ZWjt/a38fO+xdtHglmzVWPOw4ngEdvaeMRMAJE=;
 b=VVsAv1AaMPldgtuF5SKiYGj3Yy7twfM+FHaziYDkwpoDM+3QTELUij6JKSaiJamAJou+X5FIfUJHVSuz62dpFUqlkuUA7ZNZT38wjWCyKecdBvgPYe41/GRsbhTMccq0nDI9lUuejzgaE0HfJFA6rjH9KXhmf6k56OvjcBLR7U6H6yV7vg2GicgLPbMX9pujoME9pCOsqxCMsfvfqR5cxaekopFJW5PFHnCQtCGbRNMr9war1/567vH51cH0Aj0+uzTfrjFHlYZeW5l9xZnrKrFHcJ7ucvntlsW8ILLvtFSEx1UAdxle8Y+w6NxndFBJaKvc1uff5xxPB+k2Ea25Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DSWPR11MB9956.namprd11.prod.outlook.com (2603:10b6:8:3a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 00:32:51 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:32:51 +0000
Date: Mon, 8 Jun 2026 20:32:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/mcr: Prefer GT-oriented WARN messages
Message-ID: <aidfMHxf-qfN36yU@intel.com>
References: <20260608182829.913-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260608182829.913-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:a03:331::9) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DSWPR11MB9956:EE_
X-MS-Office365-Filtering-Correlation-Id: d35509ae-b360-4c7d-96bb-08dec5bea383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: zaj7DnJyZJDldd/FJfvquj3Euv4Cif6SnMddplKoEIizjh2rC0m8Y030Q9xcOO/7wfscT6EAPTKxoIH9E1iQqE1jkZ4bZrO3RWushouI8ZbgREGWqjW2pNNjlpphdSQF0RjN4ey2xK6U5sXchGOyaa2IxeBv4SUSI9rhPYRJdDVgAoZyd3iW5qiCHM29NjO/JfLvm+wP9JustDqsq7FOncGgdVfX8pKmokpiHd+mJOR9NJlQefyWom/fuU5yAq+dYoQbTfRgyVrysxHWakGtxEy/7tqFEcIZ1JQAmch1qMDrWYgEDg1piBjde7JVw7RPsyU3KvgxtM/quZu0EpnRVNoc0go8/qnQC29HrxUFByCsu8MbETOJXx0b9YW+MvI44P8Xo0OAQsk5iLZgFGYo/80EhPEvw6JWt3Aey/fZ0azcHqrjZ1Ytj+3E3/jh2N5OSS1F7GGJJ2mzWJBqX5Plo1K8t/pOZYtSBByuQQ5nqMu59tzW9YArePnK2R0lGg4/AFub0+kswuBf2RGiPGOU+MzvuwqqrVWrbqJc2d+cmSKvTOqw8p+v3ys9m3W6Qi7cb9A+9+Jyb39yQx+pkPlFcZF2mxU0QLsCQO/S5VxPC/VVBn73oFoRnKviU32L2dIw9qPUT2cG1J9gbu8jAe9ppxj2WznpTsN6d3QdYEAqSthnq6Iiw8so1NES9kf9mTnk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fYs1qoAIqWXmMY41U0B/OXhYAbaaqq6ABvhuMHuaIEemBrlR8kqP3jX4TG1j?=
 =?us-ascii?Q?in6Tnu1NGNianjDCGkPeEpArfQEFtpBLgvuj+oLez3rPMc5u2YQXRU62F7YP?=
 =?us-ascii?Q?NHvtZlwgERmDLaXVNynczIvxW7y9uxguiUDsXEryIWkoBu/LuYjAsmhfeqpE?=
 =?us-ascii?Q?TrvZj5nVxU0PtXn0p+/aREjOkAk3Tx7FNhb49ZOgzJVhm1oDHPW0R9D4WVFH?=
 =?us-ascii?Q?6gcGb9CigxlNowXD/32IgQ2g7L/C+SKsqAGeJwAE+drKABH3ci6zyviVxbPg?=
 =?us-ascii?Q?0w+uZMVm/aGqxshQzYZNKg62BgQIVBj4c5uKdB/9ARLxcEk0IZHJUnJxR/wh?=
 =?us-ascii?Q?dGsyAOAjNqFUW4lyRLhu05lwejcSUE9fg8bd6evkDD+iiITdGvC9uQEjFq7i?=
 =?us-ascii?Q?xFlAJ8tRF8X6Tb8kP3fVM1mC+1t6dMkwaRUBZ4cQZwUVWaJgKbYhxZ6p7t6l?=
 =?us-ascii?Q?pctVSHyV/igk3p06DFH315HYU1lejYiIb3HSZcWUfS1je9OJBwfqrzIVoULu?=
 =?us-ascii?Q?B0f2MIuVtqaHETRsto4/viBGmkx9M+/PzbSe9rWXY02AqBTi8lCRO4jibQGZ?=
 =?us-ascii?Q?2bPIV19uOkRLY0tNIe4Nv8O08mjAri3BOWCgX1dhxJYnQnNS8BrENpSd3+1e?=
 =?us-ascii?Q?tiTtePOZ7TeqtYKctUIQ2XDzBnIq/LUAR4M2Ns4gDm4jVVTJsuPkkeNCw73f?=
 =?us-ascii?Q?w7/9XPFGPRSV4snYcxxu7uNIJg/N8kxHIq0aKtVyImdx/Z7WFoEzRDL0tW0F?=
 =?us-ascii?Q?1Akna6nctfkYhrisgZI0fsQBGm4oelJbkQpAj0fpA63g47SQ8znjN+TGrKOY?=
 =?us-ascii?Q?cQ18yOXvdqEoR2fpbSsOsfH0X4brvTkjn1AX9naZjZZjCyeYUNVsP+3utfw5?=
 =?us-ascii?Q?7rnaIXSC+WQUTMJtvuvaz+AomBG0ohySKG3rIaS1vTYNdqp5mWJMYN19mZUV?=
 =?us-ascii?Q?aScUdFeYsrqksviIhaV2KoeWOTgA2BMhbZOGHN1Ta++3J3X/4uDl3afCIDms?=
 =?us-ascii?Q?kb8I2Isfd2aUpCPcVSUvFz+vHhIsvKscOlHFCa5cE5gB3CK90BNVBNc3DDet?=
 =?us-ascii?Q?s+h59LV7OUUp3+M0CG533aaWIyd/94quuTb/bbooz6+F66y648jPJ0wIIo6b?=
 =?us-ascii?Q?zWQzsLUPFXpHdlXhBV1dNUnPb5t9fJVy4qbQrC7PRdqa/q2a9csp+46ecL2N?=
 =?us-ascii?Q?k5yVwZOR/b8zNtOGofIDEHbZAbr0sk5MIhIfS160XDjaWQPfYypT3OcwuR4b?=
 =?us-ascii?Q?eHnoHlWFVXbF3/u/o7r79limQVgi1yUSD6jb6+mILqShRh9fNFrTmLSrE07h?=
 =?us-ascii?Q?4PQaFhbYJb3voh4mwh/V57DXRAUFEJhLLK5apPtYaFgWymji2mhrBtS8bgUz?=
 =?us-ascii?Q?yr8dO3apNts4SY9fdJDfFNCaypnIFU7TTuxArIpDXzkMvPnaiC3gf3zYSvAN?=
 =?us-ascii?Q?G4CRW7BSLceSlvzaY7bgwj1t0JKRH1tZoepNtyvuCgjOO0Q9/Z3aV6jaQUfw?=
 =?us-ascii?Q?wgDWBa13frBAJNfX6Z99PyYWVdVCVMo7lvTv6NHC0vCwhQ89rmeknv4tkEGA?=
 =?us-ascii?Q?Y81bH+wr6V8YGotRj1n1Hu59KDnbj6zfQFAz7CEs9LsI6/JG8nH1V1as1w6n?=
 =?us-ascii?Q?fxFGnpIwJiZXrsYx5/g9LnS+YvaJq6djjl5iM5/6QyCBBggy4CsUW7OQIZLB?=
 =?us-ascii?Q?4OGF9l1DsYhaL76FjIT07ubOtPM9UQjVU53tbLk360MEqymD7FdD4/LAg6kP?=
 =?us-ascii?Q?fIsl58R88Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: BfgZZcXfJKbS3hZbuF9QqPq5siGHwq/LiFJcKGHCAl+7CJHBJ+GQmLfJ9chDrD+SwZQ2MzwsArf79Bi6GlFumSXi7kNxnPRWF5cza1+ovSGqs0bXey3v6CNN8P4In2DCD4be+VhElmz6iusBphLE9mkVEk81scDz/kgr4Tsx8z+4d78hpY4ej+kpNglsU78CacehAwboJ5fElKIpxlOI/2LgV0FuTCApMqh5wIGTwo1/FAQqzEXKjI8Ro6a0hPQfovSttTaxuaqTJo5l7NeMlwSBEvBYqU1Qb014UmRLp26n9nI5TNFNiDpKDfvjLd2uIVdqiaKIrmC8q999q+WuOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d35509ae-b360-4c7d-96bb-08dec5bea383
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:32:51.7298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBkhAvbADoTyawGDVq02Q5JITlIsRLcmRG913R9cj2PTeM3STYDbcM9KUWdhnrmETvHauZcdire0cF2d0whpEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9956
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

On Mon, Jun 08, 2026 at 08:28:29PM +0200, Michal Wajdeczko wrote:
> In all functions where xe_gt pointer is relevant, we should use
> GT-oriented diagnostic messages using macros from xe_gt_printk.h
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 04f0098070a4..d11cc9e25cdb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -507,7 +507,7 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
>  	spin_lock_init(&gt->mcr_lock);
>  
>  	if (gt->info.type == XE_GT_TYPE_MEDIA) {
> -		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
> +		xe_gt_WARN_ON(gt, MEDIA_VER(xe) < 13);
>  
>  		if (MEDIA_VER(xe) >= 30) {
>  			gt->steering[OADDRM].ranges = xe2lpm_gpmxmt_steering_table;
> @@ -662,9 +662,9 @@ bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>  
>  	for (int type = 0; type < IMPLICIT_STEERING; type++) {
>  		if (reg_in_steering_type_ranges(gt, reg, type)) {
> -			drm_WARN(&gt_to_xe(gt)->drm, !gt->steering[type].initialized,
> -				 "Uninitialized usage of MCR register %s/%#x\n",
> -				 xe_steering_types[type].name, reg.addr);
> +			xe_gt_WARN(gt, !gt->steering[type].initialized,
> +				   "Uninitialized usage of MCR register %s/%#x\n",
> +				   xe_steering_types[type].name, reg.addr);
>  
>  			*group = gt->steering[type].group_target;
>  			*instance = gt->steering[type].instance_target;
> @@ -679,9 +679,9 @@ bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>  	 * Not found in a steering table and not a register with implicit
>  	 * steering. Just steer to 0/0 as a guess and raise a warning.
>  	 */
> -	drm_WARN(&gt_to_xe(gt)->drm, true,
> -		 "Did not find MCR register %#x in any MCR steering table\n",
> -		 reg.addr);
> +	xe_gt_WARN(gt, true,
> +		   "Did not find MCR register %#x in any MCR steering table\n",
> +		   reg.addr);
>  	*group = 0;
>  	*instance = 0;
>  
> @@ -710,7 +710,7 @@ static void mcr_lock(struct xe_gt *gt) __acquires(&gt->mcr_lock)
>  		ret = xe_mmio_wait32(&gt->mmio, STEER_SEMAPHORE, 0x1, 0x1, 10, NULL,
>  				     true);
>  
> -	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
> +	xe_gt_WARN_ON_ONCE(gt, ret == -ETIMEDOUT);
>  }
>  
>  static void mcr_unlock(struct xe_gt *gt) __releases(&gt->mcr_lock)
> -- 
> 2.47.1
> 
