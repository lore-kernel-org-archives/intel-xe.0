Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7346C30658
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 21:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7364D10E0BB;
	Fri, 28 Jun 2024 21:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPAhE7Dz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D6810E0BB
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 21:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719608943; x=1751144943;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=21ckgTG6+VGwTZ85GeRnOq08RFJoxkDA3pJuOkk1ukQ=;
 b=gPAhE7DzWYQV+wWCitHSFVnc9IAI520M2M3uHccAWsb7Fft4PDKMcORl
 AJvIzaAsAiE0gVQ25t40r9IEsFv8NM7bZeagAjVxG/5g7tvwI31VR6CSV
 J98yDk9wCdkb2DumvfScUqrHykMIkZao9/cH8dVLEQ9Lc57+pMyRPf+3f
 WwKNRQO9amCThf4oMg6sXlxxv/1VSQUCf9Vatz27UzBvxDfqHQy/aMJTR
 UY+/cKWcUmi8gMftWkpXf4LAgk5QHFfmaae5X1G3dWUAfgh7XFxl/SSIk
 IheKY6vVIkNRQoDX57hzcdOMnGOcuO2BEnayVk3ylmvw6phXspssShh76 g==;
X-CSE-ConnectionGUID: dTgD8PNBRxSJTJNLntADLw==
X-CSE-MsgGUID: YTa4yZExQTGJrib4yaYDJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="28205549"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="28205549"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 14:09:03 -0700
X-CSE-ConnectionGUID: aYtJklIMQi6FJnwZAV8pow==
X-CSE-MsgGUID: woVgrB55Tc6HJ1RJ6fVikA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="49819087"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 14:09:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 14:09:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 14:09:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 14:09:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 14:09:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXPU7yCXhy7HXsWzNPCnE57b7YlOjs/HmrQgF4FAELz7klzyq+S4+GPO+mSVWmSekOpylMueuhQPYkJgkoDQ3N7AGNZ0XW6jqdKl9Mfn4vjZyJFbb7qYPhxrpriG822w7OEN0eKakZb6dXlRZ7+KnLMYiKt49IYG0mmAoZfr4te8ZCnKr5k8Ap+vTEQ+qgOdp2867rcmKJNheomLtPAxuYFQ8GOrfo/KuzkZrWz375/ZS7ByRJZWkUC9nSNu4TVdHPi4G30Vk0FDquYOVjytvP+WuzVavvNWrj3h0sB1dEsuB+92lW5LI12E/WeG4m/4CHg8zWbTJ5qegDjoPNQeVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9mW7lAFQSeue9qv35h2289BxUDM9d9o8SEYednAwP0=;
 b=GbyCM8H/TuvRnzNBAnyurFlzLRU5nGRMoa5ttEOe9zMjy5eN4kIBCiyCZNbG1AOT1l7s6oJ4uZxxi+2bPWgD5BgXAfV1U4N7B5fMGO1xdac6Ym0WE1TOAzEO2FOSJPvM8sYgEbOYQ7eia7vP1kfM062Xft+qSTgZE1tF9uq88w6SLnWOOXHmFeNaKjmi2bXTQbklkq1AGz6o3pNMsVK+jaJeBHTn8ggC8mp07P5Nr8V9jLa1+7Ow5MasLRgLklpzOyXaC4sIkrMNEySjFLv9P/U7vrszK2rFSFPw7TLBJxacIiUnEVnm5pEHsV5jV6dNua/ckW1wIsZ6f4tnXYtK9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4726.namprd11.prod.outlook.com (2603:10b6:208:269::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 21:08:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 21:08:57 +0000
Date: Fri, 28 Jun 2024 16:08:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/mcr: Avoid clobbering DSS steering
Message-ID: <oo4y4ov6b55m5srmvxktwuv4v6ivumhln4eaz7ulsixpbda425@hxiutxeh2ir4>
References: <20240626210536.1620176-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240626210536.1620176-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:303:b7::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4726:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb6a63c-8213-4a2d-b8ff-08dc97b68607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hCtsZVMX+ELWrHE27hmXuJ5vUPZteia/fc9EfQI0kQhARWw9NYQIbDF8TxkU?=
 =?us-ascii?Q?CyZsyM8g+Wl/Dl0Wu1lO8BXt1o0PBHf+uGy/8JuUi3AnULOF9zk5Pbky+wAC?=
 =?us-ascii?Q?9jc6pUhPxNF1dSjjdn5j/4jwCZQT4f4EMgGpsyTtDFwY2+wybcmWpHCUIZFY?=
 =?us-ascii?Q?418vt+kUN4XvC0Mfsk8Pfl2zGvyraqu7px0mY5MDsPGbrWYOQyAWCOdyil1e?=
 =?us-ascii?Q?J141p8oRuC5incPkjd393sRnciYbkjlKGwV4faSbLQa71zzYQb9B74ljwUq+?=
 =?us-ascii?Q?hxRztDRE2UzDZ+gBT9u7c7TYKVN3zrS1JOySIHgfLDKBGp9zSf+N9YWCIndd?=
 =?us-ascii?Q?0GMdHGIrsotaPX+J2tdb1zFnioyAdaLCJ+3RNLjsiYdKNwe3bqSLBjx65PT6?=
 =?us-ascii?Q?0L6PwAz4JRhgxLhUeC9HkWCZh4gzgGheq02MZk6tuHoQcdqOBsUHHFWhWPFe?=
 =?us-ascii?Q?7MW9inM87AjdtDzDEOG9ZyY4aOXPAivVGjjso2XHfAQ7BTnqCxqODw3EdJXn?=
 =?us-ascii?Q?Ip5LYP831vOCgFsd/pQ8Xq+pgPRjDNMa5M2mHMHjNCFuqzIAARo/aZy64nST?=
 =?us-ascii?Q?hmGZvAEnK6PFEML4fnTXoeVgElNC72YMZluKTrpA1lDSUvtkJ+yUFEm34iTx?=
 =?us-ascii?Q?mOOhfukOj2inwyBauGTQoMkwEI2y3VUmtvz3iMcfT1//s3jNJb/6xbEVVfx/?=
 =?us-ascii?Q?cqAFeWxUsLFoZi9cxvc6MmbFEyjNWpfK+AP1lLH9p6VV61/7atCuTmafE+p7?=
 =?us-ascii?Q?WrFUonFpy7Pu5OUCHbb3W9ijBTsWDXWb3rZpYZrjj0y/tks+Aj18mIX+KPpc?=
 =?us-ascii?Q?EWOYoeFuWAcTCbSzDzh6Hs1GquqbBEV2mjLKUD34dXyQm+KqyphbU9V/suoY?=
 =?us-ascii?Q?E7+F41HX9GNgJlbx/3I/h36be4ZQrSyH9P4dFcaxKhrzxpts8p++gW0UEeSN?=
 =?us-ascii?Q?L/QTSTRhFVqOboDiS+8zDf3zqLTZMfg3rT6o6KjVoR+gMcolPtmomKwyMb64?=
 =?us-ascii?Q?tdbZ1Kvd0bYTZyJkeCWVA/Juox9IOj3cfeojdKe2pyL7f1cP7CG4j1ra+FnT?=
 =?us-ascii?Q?y/yE3aWNVVuFUsp96YFGU2jTookmtYHRQfEB+O08OVJ8NGHmYh81wlHMxX8C?=
 =?us-ascii?Q?koURVNDkc9nlL0JR98SX3DnSIekPq9sssNrnJyortrbTLx4rUWpdKt6UhKx8?=
 =?us-ascii?Q?urt2UNlyDqxFSWi43BaO3nrGNeYDJQXru1qlc0WcUPYUXTvaTTXtMIm/wVf/?=
 =?us-ascii?Q?9K9GtTQA/ASzPmQGWRtTnwgAgT8vbqIXAeJ1CTanr2FkcyaM6znNp+pOI+0Z?=
 =?us-ascii?Q?IQco9kpg1qPU6dyeDT2Wn5Mt1LDMx6FzbE/H6hCR82HAIg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zQtfxiBLaNoxN8oBEkFNWL2T0Cw4o05JgIR8u5l0AXrNiTIzw7GnEZwR1R+z?=
 =?us-ascii?Q?kM0hJjC/2UjycvGFyr4JTugpwGbqUfoLGiqcUMJtiP8yfiVtSkBnAFnMsT8g?=
 =?us-ascii?Q?SSEf5ZKeaa4s2JEjymoHozh4epzN+rDZOk2HY3d1XKnrxOfiRM86Ar79cmlO?=
 =?us-ascii?Q?apVSR1JlPpNlABAVYvaDeB+OYYNpwx1gbbijHJ9HO0E4D0clXquGCLcPCHwO?=
 =?us-ascii?Q?HvsQYu7Gzy5dvt54YDSsfrk7nCudBZuqVYEaFiBpmgLooT4K4WPx3IKMwh01?=
 =?us-ascii?Q?rHVPIk0aYp6wC2V4EJ0I3UHHktc9ICvOYiAjUaI4NW9XwZ+7HS10pg39phnn?=
 =?us-ascii?Q?icELoeNXI6s9qkLZnzVykLS/GE5ByngndpStBqbr5MB6X3kFXaZLr3GJCl6r?=
 =?us-ascii?Q?JndFTHc3V2N3WtvQ98dw8Ai7y2ZUpXwCwhInfH46Wc2wZdhlR59Yr2vTAgHP?=
 =?us-ascii?Q?iMrquTlqqemHIyVHs3nmS2pSiIaFovEDP+eTF2LfZDET9yxXNNWKZy8aOA/i?=
 =?us-ascii?Q?6ZRcNNPg4B4tSl7ub+ywzy444b/QJI5yH35YVLsJBr8JaU71CX/hwx/gYVo4?=
 =?us-ascii?Q?INrjOUylhJkzu7cTt0wVU0TJaSHof9ODWU6FsZbd3nNALL02eHCWGPMP2Wky?=
 =?us-ascii?Q?4BLuT8eHDCa3Zw+kGnRya43UHbVvsUTq1FQS0L1d+OCFhxf5r3sVT1cE/mbF?=
 =?us-ascii?Q?ttPztWKw4ahVtVxK7NTrxCSQZ41SiKddOgmFUu8Kgmde+zo84oVCPClIJQBA?=
 =?us-ascii?Q?+pwjChQLZPi3zcB2iR/tfNtP4KFT2feqpEflz1vvimAIn/YFhlFBNQOm9cRD?=
 =?us-ascii?Q?AtjacRlxX7QZfd7kE8LVVxw/2Rrbxtfi8wSh4g9CXQu+eexoW1FLU63lo7DV?=
 =?us-ascii?Q?uINCimWdik6dtQrWnweLLkcsIHF2jVZ0zrjbmXva4/Gq4cg7fH35kdAJWjEZ?=
 =?us-ascii?Q?f6J5ERmH2ccJlXGegNODcR0fGcpZdIlv5m/ntK61ylTvZuYobl5eWunNRuwu?=
 =?us-ascii?Q?HkWL3MZZ6mAGU9MMixeu/cDRyKjfA/3K1w9gi7m/2ylwhjO3gsMoE4AOVF1z?=
 =?us-ascii?Q?HGoLkNCgMvyHrbS3S5BK5R2sceHVgXvId0UZdHdQz/HtQuXK45URUMA4/BDJ?=
 =?us-ascii?Q?zDza+kNen0Vpi+i/m8qwZEMumfgPiQMFKZwtH3/pk896NDvssg57Tfgpn9N4?=
 =?us-ascii?Q?MyB+RxQBcGqyT03AAPCX+MoYB6r3Z1VkQ8u5BbLtd78VFSFmnvp94C7/9dq5?=
 =?us-ascii?Q?UKMQV0+E4y/LbxwTKikljKiz/p9QgWhNPOzqETKKde9CG3dSnbke0iyAFeOH?=
 =?us-ascii?Q?Dr5KLv08fWrIfDdnzVI6hoVY9sbQaLFxMrerIFbGkUqcduCNRkw8TPA5wKyr?=
 =?us-ascii?Q?bZv43wjKJTAZalnJei8B301zI0sFo9sITWCLV+z0LQ7Sg6+PaUMO/q/HNmip?=
 =?us-ascii?Q?wuYnXr+GIwSfS0XLz2kLYbKgbNz/B/zGFjUbJjBuFKIj8bFglaHX1f2UUG+8?=
 =?us-ascii?Q?KuiXokI1qZSaiUBs57tlNSdK7Ffg49TdKliD1kaq62P4auuL58eOrXKYbhGf?=
 =?us-ascii?Q?h5EGcaIR7UXPae9xToOgWxlLdHdvkhekO+BHJ0ZCsnQLxB8pLStmdU9MzT7u?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb6a63c-8213-4a2d-b8ff-08dc97b68607
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 21:08:56.9819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRHn8bfHPFprE7rDYXqmJue4jJHb6OUGHKYV2MCQ5ae91P393l4NiWF8Xf3DTxC+1KxEh69Mdc2972A21/4TtMn1R4t4A0pTD83H5kVdc+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4726
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

On Wed, Jun 26, 2024 at 02:05:37PM GMT, Matt Roper wrote:
>A couple copy/paste mistakes in the code that selects steering targets
>for OADDRM and INSTANCE0 unintentionally clobbered the steering target
>for DSS ranges in some cases.
>
>The OADDRM/INSTANCE0 values were also not assigned as intended, although
>that mistake wound up being harmless since the desired values for those
>specific ranges were '0' which the kzalloc of the GT structure should
>have already taken care of implicitly.
>
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt_mcr.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>index 386ac3269909..6d948a469126 100644
>--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>@@ -342,7 +342,7 @@ static void init_steering_oaddrm(struct xe_gt *gt)
> 	else
> 		gt->steering[OADDRM].group_target = 1;
>
>-	gt->steering[DSS].instance_target = 0;		/* unused */
>+	gt->steering[OADDRM].instance_target = 0;	/* unused */
> }
>
> static void init_steering_sqidi_psmi(struct xe_gt *gt)
>@@ -357,8 +357,8 @@ static void init_steering_sqidi_psmi(struct xe_gt *gt)
>
> static void init_steering_inst0(struct xe_gt *gt)
> {
>-	gt->steering[DSS].group_target = 0;		/* unused */
>-	gt->steering[DSS].instance_target = 0;		/* unused */
>+	gt->steering[INSTANCE0].group_target = 0;	/* unused */
>+	gt->steering[INSTANCE0].instance_target = 0;	/* unused */
> }
>
> static const struct {
>-- 
>2.45.0
>
