Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1580C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 14:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF3310F7F3;
	Mon, 18 Mar 2024 14:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXUGGSOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4FF10F7F3
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710773337; x=1742309337;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b7jENI1ojzzvwkfXK/AzqpOPYuw2F+2OirebeO1vVrQ=;
 b=ZXUGGSOCqg9UvwsYwdxlwndyDwZvR5j7Q+tzOY9z8un01VTneQMqGOye
 WNjsCJZ5dNmrh0XjyhoPmc/IL5ilAL+oyElg5mYiBFvJC4V0EylN8SMF1
 8wIXPOatKIcxRiAzt1z0bhj2/k/iMeW48fMd9bKS5uMjGmeWvAr/UF9Zc
 BX9RFHZA3HSiu5rgVIN8lWOu11QTTOaZ9oQRZoU5R+i+TDq4pslmUv0Ha
 4Eren+/KZOQaI+Np59Aom36O7PKUGYY1QvGh3Q6E34EAUJbQ6ec08jS5S
 g7yGCx4NTTJLr8U4iqI9iewSNaB3qYsNEhi6jFdqqcyyZP0v5gA0Tg2OD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5453163"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5453163"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="44421445"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 07:48:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 07:48:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 07:48:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 07:48:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOj2yOomShPOa9aZMXGLQAiTqnxwTDW+D9tJCaYt8nFMJkuflVTDrvDe2bdYY9Rrbx/Fe3XFiWLijzz+BdxGkrRflhZpgjVq7TWSp4UZP8iKcP+0iEGt/icyV0gZU6ZGHSGmsbRorEkLrsCBB55IvC8vIEg2dz9FHpcBpe9zgoKTxeK+yRfNFR+SB5uxoF3HNjglYVjVrdCo2UVXdazzL49xLPtv1YNbtkyD+Ci6elCEMKla5Ju+cFQgFvMBHEgU2dut5N9rtgLeW2wLX0ymkY7BTASKxjjNBf+38v2OadKVvlvvEEsBmTDsdfYlrLsguRZKfllJHVHDDdp0eoCfWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amXk/yZTMwCScUDRM7ZPmp+GHAPqlONpuX2DHoU7CdE=;
 b=SP1SrbIofenj2OZNLg4BbTl60Vji4FiiiiSDZu4D5Bf1dKXObF9q265+DyX8qAeGF9+7+EJ1ZP6q8e1j5DKtMvMKZfVLGeqgDksv73ErO3AqxKxJj8O8Pn5SmaZ+M/Bf2Bu/jDlQEsGEwhiGcKrFo9vGSetU5Zj1ZsioIjwPIS0WhsmBY8wkR6oleeePWojxU6WdBKbu7KhKFkv5PkrFPZZN029J1g5gX33j52Afg9u7VX/j38zgfmsSKm/u9pzLEV4auAmCSwjhK2D52HtCywNMZfDwffDNHC4rc8MVjvDLlwHiWRqB2NcDq5FBHb0uk0OWO1LgX/5aRO0Jvt64Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.9; Mon, 18 Mar
 2024 14:48:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 14:48:52 +0000
Date: Mon, 18 Mar 2024 09:48:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/gt: Remove continue statement which has no effect
Message-ID: <5ukhtlrlcyw4n5shqptrlpyxfaye57zrrqtmajoq24xqejvnvd@qdk4jvbnworx>
References: <20240318114057.3831274-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240318114057.3831274-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR17CA0065.namprd17.prod.outlook.com
 (2603:10b6:a03:167::42) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB5963:EE_
X-MS-Office365-Filtering-Correlation-Id: 7588cff0-930c-40a6-422b-08dc475a876c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N5xQIIj4VHHR82BlksSOH6c/CZTKwICh85hoMfGH1TkQO+AX8ZMS6z4wEeqyVIuWs8Wd4/L0xwIG+2zV6H1d3myu2R/rnBrPPCfOzFnwha5RT8nA13zC4oIRBLOxsJafhTOYgbpGOUAWf5Dl2BgTuS4D1XWUTuLcD49TNDqFhd8qw3+eOUVl7k//f5di1XI/d0+ZrM9xvr4VS/htsfRB0X6JM1RFjIY6BM40n48zs5k0Bp0I4lHHEDKg36qPP9Nn/qU03GSFhriJhpxZKesuxUJwMpJosN8UAYbgzt7OP9W9HeDcec29M9BBcQ7jMOfsT65Mrmm8fUd86lifgTrLi7ihWB5UGGiWUCOwSC0Lv3mWTSivkuTbKDN/bdukiIuGzPyc1EAyWn6aynoGP65E4UC5+dobbsx9q3bMbDrqGrgDW0xOkmUalAH58J+CutC1JizWWlBVUVgGtTidVKXepvySU3+RdDfrsf2yxbY7obkcKE1uw6mHqtuM56oWFt72Ry7VhH9Qhi4Ovlw05BtLckBIQ7w1ptTEBFNiIFmWQz03mbtmwvbX/H1Q7NjFOYo3cpg2YOB+v64y9A+hXoWkuGWDqg1MXBfl0gUJu9Yosud1lhMO+QWva1EyKuMBgW2zpSk7bPyJxdbdlEGIzSD32m8Mab2sxDIImdbZPF/436E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y+rh/wUDBbYonpBiZuV3iz1DwaSD3t5l0CM/sE5JG6H9L54RUuSDFFZYypa2?=
 =?us-ascii?Q?bVBiWdMpN69AfM8tRE1/p4SV7CvWzfV/8IUrBJ9PvRg+jUGVwG1bnG7TKy81?=
 =?us-ascii?Q?/d3N965iLJZ/LQqIyOii41KOcsOygIMyiehNxN+uVcf31lZgelBVpL/BO20d?=
 =?us-ascii?Q?Ai9BYCXa9ejLIVf0DqnVVr1+QAtFvcfk6VFRdM1c+AswHU27h3ikc1JHxgoP?=
 =?us-ascii?Q?QWQphPc1N4p+2Itjyw7aFJ0gEDsolBcqQ1lSy2nN80Ck+j8oOOd/X/2I+D1X?=
 =?us-ascii?Q?1UlKW7NZEdIJ2KIuEwahvEhj3HyUQaNxXwUc0NBVPEaMTUFdScVxK59Rp3BT?=
 =?us-ascii?Q?NX9v0jNTlMWwLqqkA+RlJuVW4D65rnM4inM+scM0nBpV/OigPXEKYbR6OFkf?=
 =?us-ascii?Q?UHpjO3dCSeQUY3OTAl01ABGWjgffG/7eyNKnPUhIYQtOa8wogHqdbuRaScAj?=
 =?us-ascii?Q?KsD5VNpRsjEkh2odaeTykwG8ZnbnwjvJRY/N4+NvLwl4op95Knk5mgWLEeQ9?=
 =?us-ascii?Q?rez9jsaMehFFmoNwSHS+pMuhc63MVCP3t0MIx+qBMIldfn5rC8hWG0Dp1iwt?=
 =?us-ascii?Q?9dZJaXeGKYKwCBYbySXOPwFpnf/r+c+aPKAATm5OYr2BicYZYUrnir31vkPA?=
 =?us-ascii?Q?ztOFlox4vCb0huBrLp0sbJEGh8MetlZcuCYzBOD/Ev2LTMJjjVXEDJOXzXK/?=
 =?us-ascii?Q?MGf6i7iqqzc0OPb8OGBgm7qNTQq1gr7IfpEEGvwQaH0gLg2OzvTZXmNVRSzo?=
 =?us-ascii?Q?2nvTgcY3j+XXFfMQhgtPD9zxSnAmyhQuJ42sBC4V4BI0kUit49z7F+5eQEVB?=
 =?us-ascii?Q?hpSPg6i7Nyz7kPaNQQxF7DAKg7tQTXiWvOSg576sUbU1YDwe+fQox8+SShbR?=
 =?us-ascii?Q?hesAxI9ClJnn3cpiMaZBh0R2cTt6l5P4CiNjHA5vL2q+J+mEgdy77uB47VrH?=
 =?us-ascii?Q?VT77oR60/uX5V5wlRxgBVNCZl4o4UpWxy5tCLkX2kSPuSK5r1ihiXl+6hQUW?=
 =?us-ascii?Q?Vq/sDAG6GGqQEhAjNWpe+ghdGdvzl/4xmpWvygbrgHV4IwgMXQB6wJfvGZT/?=
 =?us-ascii?Q?de6ort4kvSfPsIiYniRiA3odeCMGxUfSf+OJRjT8s82mLbtY1yeenGn5s3bm?=
 =?us-ascii?Q?LxKd1Nq5NCQtWq0jk7sj10LwjJrW4V/N/0kayOKAboPB18j61UbXlRjzt2RV?=
 =?us-ascii?Q?ofY3NSYQrukB2PvDaYcgJl/cjsNRpKhoyNGWryjjXXkVVA0DtE2aCFQL6iWo?=
 =?us-ascii?Q?yKAF0aIrjrmaqG3DPfrc+m7wUaUGVvA0dcDc2SEHRlzEXC4eEk7rBezuMkoJ?=
 =?us-ascii?Q?pqgcwbUifhpbyj3A7j+u+p1j/m1Z/RAxcZzQLAaXfJTHx5/sa5dY0L2dNAJk?=
 =?us-ascii?Q?jTUUDpgh2ltwq+ahqxLw575y1dh+AxMzo/iyZaOGqCFwZH5AMHnVqHRzby6L?=
 =?us-ascii?Q?HCtxrtOxdyCK39bv17h534yT/p/WenTUhNdaJExwecf6+780LMVh9EsXo7U3?=
 =?us-ascii?Q?RESkkgKjZzC9Hj6WHdJBVf/g6lBWGwL32sSaw/I2T56EQPyz8ESa1fplTiC3?=
 =?us-ascii?Q?pXk1ePZy0u2TqgV01Zf5rd6sss1Hy+39YZLzqOgQLKWo7ZpOuwyCUVZPtIYg?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7588cff0-930c-40a6-422b-08dc475a876c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 14:48:52.6528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Szn1grfApJ1tw2IcCQ9bjqoU1n7ifkSz9E8xS72G+DpNDOtkCo95lPBU06cvW8hwGa5Pa/fazQm1QgP4B1UrKQ6o4krjrBAhLgG4BiVen38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5963
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

On Mon, Mar 18, 2024 at 05:10:57PM +0530, Tejas Upadhyay wrote:
>Remove continue statement which does not have real effect
>as no actions are to be taken post continue.
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

as this comes from commit 3d2b5d4e28d9 ("drm/xe: add GSCCS irq support")

apparently we needed to invert the check for class since GSCCS is
OTHER_CLASS, but it's expected to return a hwe from xe_gt_hw_engine().

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_irq.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 2275ca35a3c7..996806353171 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -326,7 +326,6 @@ static void gt_irq_handler(struct xe_tile *tile,
> 					xe_heci_gsc_irq_handler(xe, intr_vec);
> 				else
> 					gt_other_irq_handler(engine_gt, instance, intr_vec);
>-				continue;
> 			}
> 		}
> 	}
>-- 
>2.25.1
>
