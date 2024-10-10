Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CAACFC5E4
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 16:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E1210E97D;
	Thu, 10 Oct 2024 16:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="baulnrfV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5F010E97D
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 16:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728577054; x=1760113054;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=msosg9tCFy7Zezmy2dgibYPfIE5MigiU++yoK9y3jg8=;
 b=baulnrfVap9sKCUMQudaZIyA/iLJHCx4Mu44ybiWYTdGYkU3h5I1XrG/
 bLdOaN1iR+LZBixbcemej+N0JhAVbKtSh3nqwWAW6yExuWlHWrgpjBfyI
 LUC91nJI7S/ba2xsXT83N5nnIMV71w97ipvYPlyylNMJssi4PRSVnm715
 glRkHLYz5K47q4UkBmOg3WSH00mz43Tz/kpGJgL3zh9yC6cPHrY70EXQk
 QBjWS4VMHVhn7YBcMGd2Kyl4ZXybFC0iv9pLrggW2fLhB4zDJo127hlgB
 MHnn8uKMw7pT/yXGYe33SohAgjiJrPIfqsgk2Y1izSM30R3lFHFYiqiTA w==;
X-CSE-ConnectionGUID: 4n3yLc2yTV6ddd9rSsBjPA==
X-CSE-MsgGUID: DTe48UyLTtG1Smv90pzwmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="53351667"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="53351667"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 09:17:33 -0700
X-CSE-ConnectionGUID: XX8k3NMpSzOxcoSJOXD3Dg==
X-CSE-MsgGUID: Pcs4wRNWQr2zLtrToEDL6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="114114650"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 09:17:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 09:17:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 09:17:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 09:17:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 09:17:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyx95hZmBaa6hB44jLNfptAwhipnwtBTTjfZXLfAu8NqeoqXkdCIJAHhoeAG2P7Nvckh67yj9CmYmPZQUA5GrUnz6wWBnaNgAvf6clAukurKp52AsQxJ7Zsqvd4GLjL1TaNMBibO1AOn6msmqQ0Ubhq8iip9Gh8BswAwzNMiAU7rwV313GhySc/cBwDUcHBYww/4kQnSptyWVx51Iv46pCy8n2bCEHmZ0UArJ3fSVci+7aME8rm7Y+mWdh0zUODF2MjObU0WLK0hIJwEO7SwUFNfPuQmDF1Qmqve3SzKxny7UVRc+F+ppRgo01aJm3IWPkY4/39wUDfonWD16kbUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CSOWKYqw8yMnhY9EI8R9mhNFYaUUbf3P4sKwsL4810=;
 b=tBr/BhiBHJIEM4lqHJNDnLmG5yaMM/2jSMJZbUSHLl0ujhbNpO1ZIgIhjFm2M9bIwxbzJMwvGoVdaAJcAPIywLMYDTExBoW/IHXypVVrRtrq9l48AMEwHu2LlsdQ6Z7Y6Yu5lSddsreZlwkP67RMgHKmg0YTYQID5j8X/E31SLRLJ7eBX5CppBhD5vOWfj5JrrcQ0XgqBxmiOJjiAw2VMJIHIMT3X5op9vH5hywQ/sDgrTFuJO8UFonoLZgh/dDGoXgfoquNMJgQBz1G762u2hR5nGvNzgOIP06gYX0aGG1L5czuyaXr70HiJbP7Iopln51utRi7OJNnJBHXf0JpoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW6PR11MB8440.namprd11.prod.outlook.com (2603:10b6:303:242::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 16:17:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 16:17:23 +0000
Date: Thu, 10 Oct 2024 11:17:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Zongyao Bai <zongyao.bai@intel.com>
Subject: Re: [PATCH v2] drm/xe: Enlarge the invalidation timeout from 150 to
 500
Message-ID: <6gjbjla2xrvr5kjvetbyircxgxp7v3cpe4qgao5z7gl6un4xmb@fyn6m4trbjqv>
References: <20241009213057.958453-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241009213057.958453-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:303:8d::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW6PR11MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a250d1-e2a0-4b80-209c-08dce947063a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DUs/avenJDyi65KbGJE3Du9vCe4s7doIyM2YCDTn+M4ZUpKprrH1bfnr9Ftt?=
 =?us-ascii?Q?zRH3unu4G5TZL60taIMa1hvAHwm/3QCKCaiRAVudrN5zrMWkiRJ28vXgNtox?=
 =?us-ascii?Q?KiokM/tb1+zjE7gKLCr6Qx30PjZ9/B5ePi+sW87oxaQA76EwsCniBtp27P79?=
 =?us-ascii?Q?zjD0c2YHNDAU2HcOT8a4Iis+slRitboG8U8mdntuPu88Q4H0ytFinMugoXH3?=
 =?us-ascii?Q?1v/GHV00U4asWc0//ZSAvxMD8zs4YJGC+rLf7gHGcP/Ub+IG241FHOpXlrQr?=
 =?us-ascii?Q?QXKiKQgFqx5/zmooG8pOUkwtQJT9+P+Bb4kKSuBB95foAVBB+2BwZkNxKFDl?=
 =?us-ascii?Q?XAG2YEuFcBxQR9cAtplYWO4MQEdq2I5IdIiENIGZdPUNTikuZIhoO+KUhsFr?=
 =?us-ascii?Q?IrZbDCMy/O5h4boLXFAOoAqLbbJBCPkxsyPZ7DJ2BjdcJa/2bUuHrUanJ6g9?=
 =?us-ascii?Q?dYF8+ls3frCSdKm+Zdrn07vvcijE+Zz9yoVjvtPA182s4n58Go2X0biz2G43?=
 =?us-ascii?Q?j7VRNNMel7P3pMdwaPCb95KvUOjEa4kHWJw1dslx9/Uh6gpVGiRUSvtzaSAY?=
 =?us-ascii?Q?5sfD+ZGLorobu7Opoa9l/+mAqgJIB5jOqiFEiOJLKZfmFouP9zOYWsIjADme?=
 =?us-ascii?Q?Q5tfIO/F0yLWzUaQKInm+HVGNcL4Oh3iqL+VJ2yQFxVOwomn2qUT+FgPDOVq?=
 =?us-ascii?Q?fRLKn3kRk3iAhVDwBm4O/bzFNSN0mdZmEDmPYivVtlUplw7dr4xOeXUQot7d?=
 =?us-ascii?Q?16Bz4yS71dJ8cKb8kMhmJgPgxxr3F9xPuuMGbIqwiptSCWXamULCHPfz0q74?=
 =?us-ascii?Q?BSy+8n+57oK3O7JsL5oo0ARs3KrdEsRi1pblPrD+oGdLaUb68EWHI5gbNGFp?=
 =?us-ascii?Q?atcy87vcyg7gE7L+afS8cca7BUlO0T5tetX5NkJte2y5kYqhzFFgDVPcKOTQ?=
 =?us-ascii?Q?lfl03T5bjYEzAg7Nb5f8HLCe7ZJG5FU3idbVnUk/9URA/Y/MCcr6lD9Gf4Ge?=
 =?us-ascii?Q?HgSuf8fTq3QrC/6WS6Glt+JU7N5ANaj7Ix147U976n/SSwSVhZqkdkjHihvj?=
 =?us-ascii?Q?eU+0lNikNQF8nBFqu3PLneTabYl1+l2sErg9rgZElmXzecJn7tKml7Ubw5wu?=
 =?us-ascii?Q?TNawjaxve9XWVy0OAmt+fGAaOn1t5B0K4xES7TFqr2vvABxJP7HHMuesIVBb?=
 =?us-ascii?Q?F+c4iiOWroLwzOAqmKY3DqmDAuH+NzmuJ/FJucQlV5la7DwiDd6Tm4SUETJa?=
 =?us-ascii?Q?Z7sPfSSO8+p5x4u9+zQPbvhIQRjQMkcsqCfdatzDhA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YIzz2sCfNMSK0XeHUoJPjyLt0oKkiqOy7g4UQfBeXSY/cx/VXMSxDYIHs5Wg?=
 =?us-ascii?Q?8Y6z1S+Ax5p3GXtQqnX+CJwITz84B6eurZ0YKNtLb7sqpJWyq0XrHUF41wes?=
 =?us-ascii?Q?xp94cxK40xFeR4WDDIVFCVbcAFy2L8Ew2JD/OcuuunDmSidVJQqDvEuto37s?=
 =?us-ascii?Q?FyG5wIFBzZgjPqGyfQcRkL55DRc1pPN6yxV10pSLiGWOWlOSTBZcxKDGxisa?=
 =?us-ascii?Q?+Bv73y1lUZpqhCH0AAFzCi219nvEUF9BpL1JAymiv9+bq+FchkZfYrhUlgzy?=
 =?us-ascii?Q?a9n8Io8k8+tJ/gqZOgtOvK8CxzzrTflkuFEUj6jnhsZBEpwKeKfXNOClHB+P?=
 =?us-ascii?Q?DHIMk8kH2usMTD3mszEziG4DodBVChzOiF4PLLxmpB/VE/jXmB40rkdkGr8g?=
 =?us-ascii?Q?zmDnw4hjwgZNqsjOmagNQ5o14LDA870WtXfG462vhAREkcfRIqaPkYD/S7Xg?=
 =?us-ascii?Q?UaC7RNPnO03h0B16d1HOvckEjywrLhRMv1vwwFYjRwY0x+9jcHgKFKitPSdZ?=
 =?us-ascii?Q?+Lg2p7iO7EfhdIWZk7FEv1IqTwKfDK6C7tL7ecc3C3swhdb4yG7yfMCRr6Dw?=
 =?us-ascii?Q?hjoMPZbuRPWTNUaMXXpwkxUI9/vQQCzkKjIazg8QhcDbIvUmdya2vc2HGlDI?=
 =?us-ascii?Q?P8BDla5K/IGtxF+oaAkKA0Hw8A2aHsD/x/nyge6+0ygHN+rYXC7Uprka+h5O?=
 =?us-ascii?Q?/89Qcu0DEuApcufOdPiYWrALAKuQK94eh5b355G1b6Ul79HuldShqwrZXGQ0?=
 =?us-ascii?Q?IdnaiDRY4sKe4fAC7Hj5KLCQ8mtc04ccnHt7+KlAGDvEv8jkIgt2ptmiA31T?=
 =?us-ascii?Q?MncLF7QOaKjCc3KqcnQsiZahED+6Jg+P9Fdh+fCIOQv2c8nriustCbItFXfU?=
 =?us-ascii?Q?+l283SHGlQ4vcqj6qABkReFXWH3eQiqutJiWwtIsJ6mIse9caQKOch19Hjol?=
 =?us-ascii?Q?uxL7zGc1NT7ej/HspiKcr8o9YG7OS0xMxDcivggmWSE88YbadzbU1e0X/vua?=
 =?us-ascii?Q?fTZmnSuEwIegHpilna82MAO3Rv2i90UNtClZH+24T6ovbOTNvI/vaOVBsEDO?=
 =?us-ascii?Q?HHlURSF8QQW9A57nS0Ea9ryWmevCvuxG+xyryaLytfWumDxYOBW/ws/SNhMx?=
 =?us-ascii?Q?cuwzcoQ683bWmKq3+JwlZs5M0QOaL6MDBwVn8bb/ydn5CYF15N+CJS0N8PmX?=
 =?us-ascii?Q?4zOEOFfTm+43h+IUcH0mzwd3G2js0fOpKoEnEksQLAkgSeYDor7icoRiUb/o?=
 =?us-ascii?Q?VHvO5IRJPoodL2rNG0haQNFgTqpywowhxPGIqlrRJvGlFuuRLKKuC4AZ0OWA?=
 =?us-ascii?Q?GeA2KCHzmpNElnwxQNcigvjIFeiYhAYLKqTu0Sp+/rDSm37/b+HPi24+pxlN?=
 =?us-ascii?Q?m2RdWBAkMVUf6bt81pWX++Tps5bSaDsVrhEqBahu0m0kn0Nczo5r5VIyFF4v?=
 =?us-ascii?Q?3wNJcPYmbipzFHvPzv22U5krl8F/FvgKjFM22qM3GKBtFg1LSaSlYaqPZJxa?=
 =?us-ascii?Q?DUMOVBZhptF3CzWsB/0oAPw1tp5IVHsHIZQlgY8/W/4/i9hjjn0clb0/yJ7f?=
 =?us-ascii?Q?hktlUjSAusl5kZu7naF2FPOWAL7b2J90mX7dI59q+FK9AGCs61bZgBXL8Jql?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a250d1-e2a0-4b80-209c-08dce947063a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 16:17:23.8494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KKgMTEnxUEOy/jPjD5o84RmtM1yP2mDsVKSacRdMv6RhtpEbAOXNaRmINSv3lUTzvyw3HuKWf8p00ny33rTvbP2A2PNF52aGXqG7UmVs8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8440
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

On Wed, Oct 09, 2024 at 09:30:57PM +0000, Shuicheng Lin wrote:
>There are error messages like below that are occurring during stress testing:
>"[   31.004009] xe 0000:03:00.0: [drm] ERROR GT0: Global invalidation timeout"
>Changing the timeout value from 150 to 500 could help avoid these error messages
>in the stress tests.

could help or does help?

Can you run the same stress test and get a conclusive message here like:

Previously it was hitting this after <X> executions of
<name-of-stress-tests>. After raising it to 500, <Y> executions passed
and it didn't fail.

thanks
Lucas De Marchi

>
>Due to the way xe_mmio_wait32() is implemented, the timeout is able to expire
>early when the register matches the expected value due to the wait increments
>starting small. So, the larger timeout value should have no effect during
>normal use cases.
>
>Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>Cc: Matthew Auld <matthew.auld@intel.com>
>Cc: Nirmoy Das <nirmoy.das@intel.com>
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>Tested-by: Zongyao Bai <zongyao.bai@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index cd241a8e1838..60aebf7561ec 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -925,7 +925,7 @@ void xe_device_l2_flush(struct xe_device *xe)
> 	spin_lock(&gt->global_invl_lock);
> 	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
>
>-	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 150, NULL, true))
>+	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 500, NULL, true))
> 		xe_gt_err_once(gt, "Global invalidation timeout\n");
> 	spin_unlock(&gt->global_invl_lock);
>
>-- 
>2.25.1
>
