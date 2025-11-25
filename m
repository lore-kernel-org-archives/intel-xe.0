Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B5ED0EE0D
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 18:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5499F10E429;
	Tue, 25 Nov 2025 18:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZZoNWMu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F245110E429
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 18:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764094541; x=1795630541;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nnUT+4T79qdZ1Y1fwJ7V4pHtsU1xImj2myUQiVqCwnw=;
 b=MZZoNWMuiez8FES9e1lVA0R8LSAjdSDrSBj6R2BDJ7yheBFpygGYpwE8
 BaA1zviol+iZWMdKUK4zivjoyZGmRzjlfbKIp0llglT+UqbRmnrQaTJ0u
 WWO4PMXxXJUG+KyKdfShyc39T2bUvxU1gnbPYufiN0azag1saH0chAa1z
 /zB+WX3gVn8YUYDr/wHor20snEO6zzgsBdJa6xVA/BLhuESF7NzTTwVbA
 +1dIeY5iTTPTvp6qziJ3tWsW+nz202jkRkuLuIDX6A0GX3tk6DXUr4ltl
 pjkOf+Z/Huy73gGRK4TvH68YOlP9r9JtrfgCibMoHtGCoo9xKcktFfwxl g==;
X-CSE-ConnectionGUID: TdMKzDHAQ9urdYNu5PdVTQ==
X-CSE-MsgGUID: vA+KGNvST3GWZ7L9jp9TwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="69983877"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="69983877"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:15:40 -0800
X-CSE-ConnectionGUID: BIeQpRWXQWylnE1d8pBAjQ==
X-CSE-MsgGUID: Fr+Adj+HTAurBqTWdehuQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="223401372"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:15:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 10:15:40 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 10:15:40 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 10:15:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTESkGwnkDRv0oxjV2LyodN58MU1xWX3AziI+M1cPeLs3pjre1Tan4cP3GNM3YpyJ7FQCztzD9AytR8mButcKpKmvZSdTEuRY00BzwpqtLrvl7n/cAwHjhDeYQf65rDNRxuVBcxiF4iuEDWnihyYBRrZYK4Ouz6kVc6CZMi68Dvfw6q1gv/BluDez1gQ5HApRh4uE7UsuwW7PgAxeudtKzTh1NTdMjgCXMADuJanFuVesiZ93+eOVBbMBRCTv+EYBYJKc6nS4IYQS4iCpSHgia05VTKTAnokloMLUQyBNrEeRB1T3Hq4scGUtkvSmEnRA77vXxiiv+qmKuBVYqsNUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjRwbBjCSVjEP2gIbWSLmbX396pwWqHAoi02lA71fWk=;
 b=q2HPJXfb6k1SW1opcEC46+CS/a3VosCdU7rELk2J15Ifmn8ixZUEyBfEUoYYLnKyQvU/08D8SCFfLCovEUiSbgWgPuBkJVTYf5frAPzKmj+1YVpPyX8tJzVPfpMdgNIhnMp7FOO0A7rT2KTCN4Fp7R97iUk3elcSWysnP6eufPUYKMMxbx+eJGLhjH1XAwqqFNGCk+3jkhelTOyKapIZrV7TqD3S+mVmS0ydxkJyFLRiQas1bzVsGPcCr14IuXz2ICSSLXbc7lGaghMoMLwrxRzQqlhxZ3cGovX1BTb3OSFCgewxQVp4D0NfVrOPQgvhMQR12UodszVW4nfTtUdCLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 18:15:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 18:15:37 +0000
Date: Tue, 25 Nov 2025 10:15:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 2/5] drm/xe: Merge adjacent default-attribute VMAs
 during garbage collection
Message-ID: <aSXyR5gq6Lx5k08a@lstrano-desk.jf.intel.com>
References: <20251125075628.1182481-1-himal.prasad.ghimiray@intel.com>
 <20251125075628.1182481-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251125075628.1182481-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:303:16d::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: d52c5120-76d4-4bda-67f5-08de2c4ea274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AL+7sdF+jZw9z4XUQOLFWghZ+9UQ8SrbfxGtS/ZXdi5YmWJweOGO31o4Yh?=
 =?iso-8859-1?Q?EVPm9tWS9nF5+yNXVWk2qa9c7wPmBHgTsv9d6vyRwjtyzor6TiOmBVPo/W?=
 =?iso-8859-1?Q?CZ8L6xzdqK9LPbmF7RL625MszmQq1N7swRIY4MblV0J9tL9gJkzM2zNnvl?=
 =?iso-8859-1?Q?LjC5kxYXOyznhvMA/dx9HK2c5ccH5bjjsaiQB5kMNqxyCjswO5mECZmeZE?=
 =?iso-8859-1?Q?Z7hR22gq2FHG5JhCieyr67zeu08sr+zJFNce1jXnfXwfoBan2oy7c4XNV9?=
 =?iso-8859-1?Q?kct5Qzs9sqjw9pvavgwJaRjpkNEQccDuM7hFOGq25/fJ9Ma+HIrmTMePLg?=
 =?iso-8859-1?Q?kbCjtXW2ptKlGuQpvUUijkkWXqZTunK/5h3PyBdcoCHMc/3vBRpoT3RpY4?=
 =?iso-8859-1?Q?a+FQYJBSEXySQ6OOPR+PGh5FDZD9rZmOrELPFWqu7GQjLguDKsvNttdXvV?=
 =?iso-8859-1?Q?amdsR7/5kkMoPayEAKtxB5gdRhnyFO0blt2BSuvBs6QIthJBfRrGl94nl2?=
 =?iso-8859-1?Q?uSjZBJrN0Zrg+Y2ttCWLhe9H524kBpTT8dkW9lP5it9Yf13dUKq1rhWk+H?=
 =?iso-8859-1?Q?COyn5VZdDAx7knpVqcKinbsgjurIfrA3tITl365JZixLZbLgjIKhZWl4ox?=
 =?iso-8859-1?Q?Mm6JlfVyHvg2K/9QkJzdHUdipK6gj4cC3sEIWYJHv9TZ5zI01WBKFDh0oi?=
 =?iso-8859-1?Q?Dp7+wkV3czU6wLad917Qx057KWJQdEjW7zXJ70qFYAeAfj58Z4zznIDJza?=
 =?iso-8859-1?Q?kXZlPZdi4OpSjdPwzm1Zym1+Fh61kNw3K/Kzq/WWDO9inlCENdL8+enUHl?=
 =?iso-8859-1?Q?8+fRxXZRmMNtofZm7X779VP/CeOlKt7TlzAfUsATVOUoTFHIGnbeFXrlnz?=
 =?iso-8859-1?Q?JZda99jwshe5SID1SFzjFLIUD7AdUgnt8JS3g8POWd/Ml+1audog2rlLii?=
 =?iso-8859-1?Q?lp2CL6wJKCdXBO4lqVTLK8K940Aydm7dCsxY94GuXP3BZRQquhNeQRgpjj?=
 =?iso-8859-1?Q?Va4EDtab7Vrh048FaMg2xrqU14xmfAc70Z71/74jj/+qba1izJl9LYB/k6?=
 =?iso-8859-1?Q?kJhqy+2n4+GzxGYPYzuS17cI1gCMoJ453rlKMJGe7hC2RsNE6IdMvpPW3g?=
 =?iso-8859-1?Q?ZZHMQTRZNXZqY290UG9oe9e9NQSYCaJx7vX0rX/B9oPUkmuYj2gwip79MI?=
 =?iso-8859-1?Q?0p5og/VvHZ29rjpDg/2Zc59dn2shAofbbdE8bx2Lw+D1kpEVTZu/eVEE5N?=
 =?iso-8859-1?Q?Ndmmtt2SA0tq3IQvRXSxfrEwJGKsMWAEQrVRdaYPi/kUqbsx6PVLe8LbPU?=
 =?iso-8859-1?Q?ZEgj+LMXUHIGinUvsXlhkQa392VDrtxGwwHEO/Y00lujEWxRnrL8WnaTGw?=
 =?iso-8859-1?Q?rTfFcGUqzApfMKXGntx5zSNoijwHalLfTOJOYbwlxmg22RfLLdHdSOuv/M?=
 =?iso-8859-1?Q?f8FixQ94ojZDKTr5IvAKr4a555PSstHai1yjrxEDyMmRIWPldo79Ygxead?=
 =?iso-8859-1?Q?iHdCk+6pa24KfG7ZrJzese?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?L8KPkqOx2F6TEpnOQ0OP2a+KAof4YfaODUVk5adRCQSlnEWyHpTJSGlY/r?=
 =?iso-8859-1?Q?yUOIF08AF1BlU+l41lwpvZPNuzOH2vHNz9yEflCCV9KX/A2D32sqDwV7ia?=
 =?iso-8859-1?Q?+80J33qDNBTqot8Pgr4Z/y4JizoDwZOxQlqmTy0ZUH3LhT60WxscMXwKlT?=
 =?iso-8859-1?Q?U3zyBZRnSU+F/6HFO6WCE1yG+WEHJvS8oAzsnVO2Dif/RKvTrT4HblG2lW?=
 =?iso-8859-1?Q?Tu6eTQp4MQh5yTJDFT6O5Lju2Ft8t3oOOZG0U0b+Er5ZnyflQJcIt8uoJQ?=
 =?iso-8859-1?Q?hHrep5qJuKRlbs5NbtVQKs2V3/eR3r8SBOCDgpnmitYdEK23YsT5F23U0J?=
 =?iso-8859-1?Q?2vmj2yJJXkS9N4SR5W1WCO2yulOe8mQvFGGehy3x4XIGbI9oo+aHeo7e4Y?=
 =?iso-8859-1?Q?zST7U2BQashe3qwlymRuUs3MN81et2TdNZz9bH3JKRNtE5G4rcvHuly/XY?=
 =?iso-8859-1?Q?bfZpAcuz8wexwPOMGJQRtzt/xz94BVD77dyrQx2eSSn5LJDcRgPM6fQJNO?=
 =?iso-8859-1?Q?hk6S24mbZWKOJFOQNvHMw2tjKgsdVjjDyDuFwDjXIezmwCzHWCOBBNHTcG?=
 =?iso-8859-1?Q?SiBYOESbANJJPszXBB5scudob6hIDnRD8WDCH4mOIXzjSB4sNd/MkUygd5?=
 =?iso-8859-1?Q?XBQrDEClcwmw3vxZIUvFexXDNpsGeH5tj9pEayCipWD+MasxrKDMMxLK+b?=
 =?iso-8859-1?Q?od9QMHyJAoRn8Xb2Y/Uv8gaA/zTcIXogiaoHVs2c/bVx9nYwcpGYGy+s+y?=
 =?iso-8859-1?Q?qE2mYKBH8f/R1yWLcieUIJtUki4wReP7crIUjT0YB/75wUZLee26rU+AtN?=
 =?iso-8859-1?Q?s3vliVndufctwCNWitg7dTTVe9ygiKHFlIuvRGcJ5Vl+Sh71U+hZ4SknJA?=
 =?iso-8859-1?Q?hT0b6Hk1wvIJ3RucpkEvE+zQeiIhA5P+6gtp5HL0UWu5jZab9TyGZDpFIQ?=
 =?iso-8859-1?Q?NpEffpV4dMiVvIMAGwB/s+QXkODzaBv2V3150S1B1bwjPQnuuYYzATnnuB?=
 =?iso-8859-1?Q?MYbht2ihbllzItuXKb0gVpvgSfayjMNjsWYT+DpmNdjW0PzBX/QyZl60gc?=
 =?iso-8859-1?Q?uB+bIF6pLpyHsRNjBpWWY4xUpyWOn824bdY8kaHpEbfrhAkaFmoWVcxxUN?=
 =?iso-8859-1?Q?xeGBihFTJ2tkd8lWSJLXWPcebUZAciroE5pj88qbVrV7PyE9NDnfzK49sw?=
 =?iso-8859-1?Q?gwBgWDH0NOUBrPU5jNzfaMbNWiyv+KYq2C+O1ck2OP4mWp7EEDiItmsdR9?=
 =?iso-8859-1?Q?rVaxJSz6hFM26oXNXNNRr/rE7Mdw7uq87HljCESg0dHRpVy0OjT7KGiC9H?=
 =?iso-8859-1?Q?shuX29Zi6BxZtjM5GldquwpNXKF7qm6/n+FxyOat77POQ2CC0jpRgEMXCx?=
 =?iso-8859-1?Q?HbGCEe3K3xjRFL5O9ZmWa0a7qBv/RFxULIFcr8inLt4lEAxCEn2jhubAP7?=
 =?iso-8859-1?Q?CDniLvIsEx3Ie/zcheeLIZGx62WlzRNtnrfk6XGgI0lD9S1LxzgBHsdmmW?=
 =?iso-8859-1?Q?IWdVD44zZoqnmdGiwujMh88gJzqdFGqgJGIcUq3U/RcWb/0nA+QfJlgQUP?=
 =?iso-8859-1?Q?QgRLMgYLLP2DdAUBNMKcyxM/DArJEZdCafiELnYY12i+kQjUf6DG/J7V/A?=
 =?iso-8859-1?Q?cXH9uuwUsgdpZTvWcSLbuMV0t6vYueIFi8G83/5jbga9SH9/rCwuSPVQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d52c5120-76d4-4bda-67f5-08de2c4ea274
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 18:15:37.9028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+cMWpV6YE0eUbOBEZ0A1VccVuIrZyGQuoEBPUKc3MHVZzAAehO4oihS05nxS7Z7sbogr0ZvJXYqiS4KHJkwQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
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

On Tue, Nov 25, 2025 at 01:26:25PM +0530, Himal Prasad Ghimiray wrote:
> While restoring default memory attributes for VMAs during garbage
> collection, extend the target range by checking neighboring VMAs. If
> adjacent VMAs are CPU-address-mirrored and have default attributes,
> include them in the mergeable range to reduce fragmentation and improve
> VMA reuse.
> 
> v2
> -Rebase
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 62 +++++++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 55c5a0eb82e1..e895a95af126 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -285,19 +285,21 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
>  	return 0;
>  }
>  
> -static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64 range_end)
> +static void xe_vma_set_default_attributes(struct xe_vma *vma)
> +{
> +	vma->attr.preferred_loc.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
> +	vma->attr.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES;
> +	vma->attr.pat_index = vma->attr.default_pat_index;
> +	vma->attr.atomic_access = DRM_XE_ATOMIC_UNDEFINED;
> +}
> +
> +static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 start, u64 end)
>  {
>  	struct xe_vma *vma;
> -	struct xe_vma_mem_attr default_attr = {
> -		.preferred_loc = {
> -			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
> -			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
> -		},
> -		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
> -	};
> -	int err = 0;
> +	bool has_default_attr;
> +	int err;
>  
> -	vma = xe_vm_find_vma_by_addr(vm, range_start);
> +	vma = xe_vm_find_vma_by_addr(vm, start);
>  	if (!vma)
>  		return -EINVAL;
>  
> @@ -306,25 +308,33 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64
>  		return 0;
>  	}
>  
> -	if (xe_vma_has_default_mem_attrs(vma))
> -		return 0;
> -
>  	vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
>  	       xe_vma_start(vma), xe_vma_end(vma));
>  
> -	if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
> -		default_attr.pat_index = vma->attr.default_pat_index;
> -		default_attr.default_pat_index  = vma->attr.default_pat_index;
> -		vma->attr = default_attr;
> -	} else {
> -		vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
> -		       range_start, range_end);
> -		err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_end - range_start);
> -		if (err) {
> -			drm_warn(&vm->xe->drm, "VMA SPLIT failed: %pe\n", ERR_PTR(err));
> -			xe_vm_kill(vm, true);
> -			return err;
> -		}
> +	has_default_attr = xe_vma_has_default_mem_attrs(vma);
> +
> +	if (has_default_attr) {
> +		if (xe_svm_has_mapping(vm, xe_vma_start(vma), xe_vma_end(vma)))
> +			return 0;
> +
> +		start = xe_vma_start(vma);
> +		end = xe_vma_end(vma);
> +	} else if (xe_vma_start(vma) == start && xe_vma_end(vma) == end) {
> +		xe_vma_set_default_attributes(vma);
> +	}
> +
> +	xe_vm_find_cpu_addr_mirror_vma_range(vm, &start, &end);
> +
> +	if (xe_vma_start(vma) == start && xe_vma_end(vma) == end && has_default_attr)
> +		return 0;
> +
> +	vm_dbg(&vm->xe->drm, "New VMA start=0x%016llx, vma_end=0x%016llx",  start, end);
> +
> +	err = xe_vm_alloc_cpu_addr_mirror_vma(vm, start, end - start);
> +	if (err) {
> +		drm_warn(&vm->xe->drm, "New VMA MAP failed: %pe\n", ERR_PTR(err));
> +		xe_vm_kill(vm, true);
> +		return err;
>  	}
>  
>  	/*
> -- 
> 2.34.1
> 
