Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A96C71157
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 19:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F6410E1DC;
	Wed, 18 Jun 2025 19:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="II4zeVqU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E684510E1DC
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 19:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750275966; x=1781811966;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o2EyQ7Y/4do6uMJ22XSHfc9GZMNUHgiAsvTpamv0HeI=;
 b=II4zeVqUPKxx/uKxCzUgrpbKvh3pQ2aLCESG2uoskF5DGsUh19HNm/Ms
 UH5w7Im41Gw7mMh9Zd3kx37DIyTE3x3wPpFL+eCg8GaOZgmwsr3UjCvjh
 b94RaIxH9JKVUDVSY1DC1zNIk9qdqyp44zEbKUffQctkzPEwsstDJNPQc
 CPn+lq12TqRSnhdEUbcRU61GPg7HyxGnOOXsLhchKPeYbNywTzysQmP5P
 g34VgNqNsr6gnWZ2Q802sCiRDpT71gn2ww6EOrJUMg3CQz3i4Mn43UAW5
 dkJy7cNC/+RyTC5pGVDJADQAOCWgo0GMia6A3GeoGAF9d5SwSD5Pin355 w==;
X-CSE-ConnectionGUID: Sy6RMUcURy+urcFkaGY93w==
X-CSE-MsgGUID: h5bBHPPuTSqENEwPia4k4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52433803"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52433803"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 12:45:55 -0700
X-CSE-ConnectionGUID: APB+42owQOKtW28f3Ag4RQ==
X-CSE-MsgGUID: kHbtBO+yRVa3sdrO1ZZquA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="149763366"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 12:45:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 12:45:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 12:45:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.85) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 12:45:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFWflnd+xuAmKb/1aOvFvrYbo5FmQ4GbxHK+Gv3Q81LYEnGwMI/DEzdWxmi4zrGMtca3d0FxmoDwiS4IUzz3NJGkogqqhVbBbMyRJHQhWwWwouRYmwXmKt0Etr/p+Fk9WQrLiFTB99r3ZzatUUrMhNBLXWjMvjesE4iMT1AHNe+dZzU+Dt6Lnzhn906pfNCYBEG6hZESZW+0GDtv+TJ0AyQuI5a943n6ptt5r8I23l5G4Fsh54D5sKJb9pqMkZIFNsR396WnWR1DVFTz+JbRd3PaBztDsMRxzwgGmF87Y43uw9tuxnIGURTF0zUyYI2yHUcn5/5qxgiDxR55OvveVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VL+BcItF5DIByR9GJR4CFhF+S3lvC8YB4meIQ2ASVOw=;
 b=KyHoiuiQOzaoXOaqxEL+dDiZd7wlQn3piKpaBMxxxNwU/MJ5qVXp2zDhTcEG2Lzi9tgX0kqB+MtY9fteEW6kiLCTJ+adHXN7ay7UvCFSRojf+2hg4v8sEnV0078ob0pBl1IM05m3QkfNPt9trYUqEUNM8cCZA6wQXj1NQ+eCp6lJ3L9+w6ZunUYnGcusGz7PM2GuOKKq+9u2yuHmlvMOafg7CdHn/F2wEve4JBV5bIe+e1YHcu3jlu/GXh2PCmRbRES/UVyT6/eiESfd3l9eQlZ2wbNr1Z3wtnosVwSBy31efl0WDFEsgZzcGgDO1o03NvrQ62FZgpxqwUUQLmbpag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8203.namprd11.prod.outlook.com (2603:10b6:8:187::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Wed, 18 Jun
 2025 19:45:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 19:45:49 +0000
Date: Wed, 18 Jun 2025 14:45:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 9/9] drm/xe: Move xe_ttm_sys_mgr_init() downwards.
Message-ID: <xn4tm4xbbpmzd6k722pegx2sysbmhlnfvyjnrdaf5ufz7v5wdr@yjkpgdz34nst>
References: <20250617180132.7059-11-dev@lankhorst.se>
 <20250617180132.7059-20-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250617180132.7059-20-dev@lankhorst.se>
X-ClientProxiedBy: SJ0PR05CA0189.namprd05.prod.outlook.com
 (2603:10b6:a03:330::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e1b6c3e-08c8-4d20-ecb0-08ddaea0b9ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hlXUl8ojhWyD3t4BpmHBQxgu9lxJWdkjMO1+CPnnkWcZoudM9ew9ExIai5Zs?=
 =?us-ascii?Q?t2Y3IkAjIfxSONcKK3RX2X1sk22tHvOMnWF+3TMtBBP+21jUQzDsCWw1gKXH?=
 =?us-ascii?Q?ynJe4rtpSuGb6jpN2LD8HDf2F2DcKFKxaPHnc5doDu1tf3t4pKUq2mehXCMk?=
 =?us-ascii?Q?Q0bVpLZhkQSGq5s5d9tubVOayMNLG1OG4Pu+WJi+D5FYOuDvQrYFIUTZbcwb?=
 =?us-ascii?Q?HdfTKGsGA83NM2ofzbn5saN3fwpr1WT8HueWrxJN4wCgEpMu6XmiLj8DSy2Y?=
 =?us-ascii?Q?WLfuAEFhFUbk4xuY/MlnCy7OeNbFHHLSeb5ZpiRShNk3V0gJphLg5calKnCB?=
 =?us-ascii?Q?x4shjTgViM8MV779JHygtjB8A7LFLnpDk0WfHnpXhhx0h4f0AUdDJmoqQV2e?=
 =?us-ascii?Q?9i7csymyJmbxIG+e16s9UKpKt94mv0vQeR+gFfa7VgY2qKcGsGa69Nfyjfw6?=
 =?us-ascii?Q?EUyaak91AzvJX2d/ES/e7gQPkKm4Pf7TuxVk606vze1GaOBaXe63fQgFW55o?=
 =?us-ascii?Q?z0QNlFCln44ph5Ys8eLKBTSgGvCvRtbr6LWlhL6OunTPE0BaM6HWdIg7dUdE?=
 =?us-ascii?Q?U5/35t+1Wu4smCqlr3Qf1ySEr8zvtnh3OXarmJki9TQrRoIn8e3FMUd5eV+R?=
 =?us-ascii?Q?oszEVGvgAFxVu6qrrdHRZGpbf8QomS2ggDE5D/T9wYFksfxFL3ISGQajqDv3?=
 =?us-ascii?Q?Iik1SVwNxdEcjqEqUUo8xX5g6bP8NZhbY/rh5YPtzW9Is4o6Ft0l2P/DvZUn?=
 =?us-ascii?Q?ch7DSj+yI5BPJA/VAtpKPrgOV+sfE3rvhwPWPIUmKss1q9zkBbujqCq3ruGf?=
 =?us-ascii?Q?7wKgiRXLzf/r+oCO3XRpOOxHaC7iHqYaqgFGG0QYOB78wcU0aWjUSCtc6rcW?=
 =?us-ascii?Q?reSdYh0IE2nn6Xe1HyjaQqrhZeAH4neo1VF0i5UBx+0EepXp6Vqw+4f4UffN?=
 =?us-ascii?Q?5Am90voogXqzQbRvFSU7zQsqhx537xluP83AbVXZZln/K1MFlUaPaQ6U4jFd?=
 =?us-ascii?Q?cd579wNOvakONglYCiUJL6VhhJzyQXed8LbiszybPaDyp7hP+D+/GVdKYhyQ?=
 =?us-ascii?Q?0K0pLUNMha9Ul40qe4+05j8/7zEJQ5NHZmr+NHxMvwhizTm1pzGEhMnpBcTX?=
 =?us-ascii?Q?3xqIvIb+jQTBbkCO949FhXnaTBAu0FDLzMw1wJFamLnvCTWldaNONHMDwl2v?=
 =?us-ascii?Q?TRojm2bVpgDvlzwVudFyM4exa76g+Np0AG/aJKNEbcV0kOqwf4wWNjhAgSCv?=
 =?us-ascii?Q?SSO2y4Aq9OMgZrzsfT+hfNHpBqv/vxx53Khku7Q8B6/Ut7zuWnigQD8KXYiN?=
 =?us-ascii?Q?9W/4Th54jDp6iRk4PQOAYzZRBYnJYZG26IskIE2rM9kRLrh0yOKB/zbBk+CN?=
 =?us-ascii?Q?F/IJC7+8atltotjxPe7j8zrR8pthovA1+KtwCl+YhJ7PaleTkRqsSn9v66Cb?=
 =?us-ascii?Q?VWuU1jxk9os=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w7mqQcQIq8pth0+h1k4trvbksD/8CaQxvQG1NXSKyRyZWFJkSK/HeKpfvkLC?=
 =?us-ascii?Q?XGi9zGgRLYKeVCGY4k+K+2KeTgWUtl90BwdK2qbmMR8OF3dDfV20VWymhTyn?=
 =?us-ascii?Q?GFcEjZkUn0gZGDIYy+/IZxDoQIjhvARxjxWXWaQjB5GDY9+b/sX30ip8Fu5T?=
 =?us-ascii?Q?dHw6SJySMe7EiQ4LQ3sfbkyY4nlIvZFjzQbjPCGyzFQMELWF0pT6rF8hGJmI?=
 =?us-ascii?Q?HjxVoMHdmld52+dXrHZ0Wi5j8eMguE7J+BoxhoRj0VfBKFsjW/+nQQRz143b?=
 =?us-ascii?Q?GCLPdcmR2SscOP1kkTJSUMqDXHpwisbnBoTu1cunnkgeus8XBSh5VWTaQ7L5?=
 =?us-ascii?Q?c6Bq6wgas47Mlkg8jZu1OOpW602jQ2XBFxbBQhIVbZVEShUKFKEgrcQRx2au?=
 =?us-ascii?Q?ftPT+JCCqm6jIhCZCTb+HYDhSTqzUvOcXoI/G4uyhSvoqCJ0+PibYjBuivLT?=
 =?us-ascii?Q?K8TmxTywanjUWYLqTY32Snsj3ALVHhCb5bakSpPPX6wxNYtlFQWNJ5ElIPMh?=
 =?us-ascii?Q?mbHz0evwdKyDaI1SCaMqMnqiBytvDDg1XAVsZGdSQ7k/kZaL58ikbbhWq+J8?=
 =?us-ascii?Q?MP664eD5gbbRLaRdUIk/O1UoaTExc+fCMv32h5Xkm35leMRhqKinjW1qTfKR?=
 =?us-ascii?Q?qRSjryIqXbPZyvp8MYfj56a0RO18RwNUYoun8/AkKUI8BnyFwv1DmZlABxIr?=
 =?us-ascii?Q?+tatwpc7zTScO69ck+e6CPPcERFrxu3mXeqFvg8eubL3l5Ixy1cHeOHE2oJ1?=
 =?us-ascii?Q?K6ENcOfQj2HASdRcQtSwbgr3i5tl51iqLIiQUkO4/jZ5upgpxRFnI0pcoK1y?=
 =?us-ascii?Q?AQBGSf1JKNAY7hJkU+GYnEiNzSrZWV5/a5vL8rbmDjKG8QnlVDdiltotQUeT?=
 =?us-ascii?Q?OwGoPReOTT201MBkspwNkuiMbEMgwg3QGrXql7d907RcdKNJvkvnyMq2GW8i?=
 =?us-ascii?Q?/8ovIZeAHwhMdP0YwB5j7huthrVVBH+8uaawX/dzS/E2dflcoFQi+zdoiBWx?=
 =?us-ascii?Q?ZmyveiC1HNTOJAe2i97lOqguxumM1G0qAnkSJPPIz3hkSTh/+ifhYtQ1Xtxs?=
 =?us-ascii?Q?ukFqoNY292QnLRhY9kB7A2fItHquJGWqHWXgI/fQQ2g7EO5LfZj9GqnTuGbb?=
 =?us-ascii?Q?FCr9eVYsTaCAYgZOi39nMWzB1JiWTkoOE93wYx6vEDLaQ2NwkRQF1n/KW+oD?=
 =?us-ascii?Q?/fNmqYYTNlQSxPnA/URJjkICq/7E9TF3/kcGZUMcLXTBG8Dl2bX//Gu4G2IT?=
 =?us-ascii?Q?KIsmdcJDkBw2XfA/D6UYOWzZY+xIZM+PhdJdp4kGqwLT52oQLxgFt0b42km7?=
 =?us-ascii?Q?iqVQz6GeE4bS4TGi8b/gcYA+WO1GKJQTIFTBvEQHWjJjp7c5qNRTc021qvxa?=
 =?us-ascii?Q?FfY/AXKY5xgJOXvi311lD5qHNprKI//FFpc0681OzRAbX1dT/3FVz5hZubPb?=
 =?us-ascii?Q?tgYfz05rbVMcaR++8uy9vCpvmdUTKcgRReCCVSFh36x4fAPKKsQGHlSatcTd?=
 =?us-ascii?Q?qiXL+RdPgrbRZpJk0pDyWK9IDVSi8qUdsnwEi8MnoxTJEwd/vrNeDSP8/Gig?=
 =?us-ascii?Q?pRrCB29TSRC5D7AKYYaNeP87ujNWHWaVrBCumtr1Ze0Bhl/sEZnxB41Xusz0?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e1b6c3e-08c8-4d20-ecb0-08ddaea0b9ea
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 19:45:49.7442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2DpzaXd+3aQaPL9KZ8qfZUcOvNNy4gAYq7tjB1WxupXWK1b5IMsD0MeHJ7L9apHbotRU3ifJPqITkiSpnPWmGHPRlZYtCmTlTjxNMLWtj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8203
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

On Tue, Jun 17, 2025 at 08:01:42PM +0200, Maarten Lankhorst wrote:
>Now that all previous allocations are gone, ensure no new allocations
>will ever be done before xe_display_init_early(), by moving the call
>that allows allocations downwards.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_device.c | 12 ++++++++----
> 1 file changed, 8 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index c8595cc0300fb..c0952f692fb66 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -782,10 +782,6 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		return err;
>
>-	err = xe_ttm_sys_mgr_init(xe);
>-	if (err)
>-		return err;
>-
> 	for_each_gt(gt, xe, id) {
> 		err = xe_gt_init_early(gt);
> 		if (err)
>@@ -823,6 +819,14 @@ int xe_device_probe(struct xe_device *xe)
> 			return err;
> 	}
>
>+	/*
>+	 * Allow allocations only now to ensure xe_display_init_early()
>+	 * is the first to allocate, always.
>+	 */
>+	err = xe_ttm_sys_mgr_init(xe);
>+	if (err)
>+		return err;
>+
> 	/* Allocate and map stolen after potential VRAM resize */
> 	err = xe_ttm_stolen_mgr_init(xe);
> 	if (err)
>-- 
>2.45.2
>
