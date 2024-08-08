Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB85C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 06:40:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3FE10E661;
	Thu,  8 Aug 2024 06:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V7ZF77vY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A0B10E663
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 06:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723099220; x=1754635220;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2lPZFh9WnziQjq+Dv/vIrX2dMtyMMBIOfM6pxE655ew=;
 b=V7ZF77vYKetkGbW9FVYQyqdrrasmrBbhcjMyfQAKBMw7vGsxYOd7vy0n
 x7XtHA/WnkrTiN+vAyFBw1OLpqPqt6HFW41uzYzb70Cq2E9h/s7npIn1o
 Hb7eZupDuHu6NCNNbRuh6rK9ydo4ZpRZihlmptcaLgmLDbFojZPGMDQqj
 jVWTLokU5BoxincIe3l4kkkzag5HQHoPCdeW1fTSLOuuzYnxv3iNR/sFc
 LvsJqjiNZfpRbiW+ikLW50jhPITi1hJMhYTv0Owl4sLuNc3bv9FSACzmk
 Dy/VO1cMVaoHeg/F1d23X/hGYzMfRDIOcmHuvTTjwtz+IOnAcDjL0YS8H g==;
X-CSE-ConnectionGUID: 5Jg1DH8nTjGoM2ki6wUr1w==
X-CSE-MsgGUID: /q/CdNBRR1KklYOITCvemw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="25079699"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="25079699"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 23:40:19 -0700
X-CSE-ConnectionGUID: 0Qf7xSFSTVi8vB5qkVkVAw==
X-CSE-MsgGUID: fVi0tEBCTUOfy9jZuppHKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="61226082"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 23:40:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 23:40:18 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 23:40:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 23:40:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 23:40:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Smh5yhuvDDI7JnDaIXcBOK/ULnUcmuWlthsFYkUwh+eGqnh5qGT/YExXTdK9VnRMgNeGiQGpYF9UF5u/NkH/qUkct0ozBV67EP+YkHa6HuZ116Qi6gXvpGkWZa9RnNml4aSg0Wt02fFNdxU3inVCtJrFE9MpXXNv/y0qa4r5D79dcmy9Kp0NQ/OHi/TMOy2OQrT0NH8UbrsjXXWDI1fDQOGGVuols/k89vRlM4PUynG5hJOk2k6yauGFj/5eU0MvIIcDBdSLf2tUXBB2+dkENxRfB5B9gec10TpbdhxIFuO3IUBxVuLlCGwnjNVExs5v1sb5GyuX5ER9KbWuJVZIoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZhzBM3gx5dwT3qK7jp9SQA63oStNOww6jpW1clxf4U=;
 b=WlCz5YOFhNzyXTwjmYH2IA89urWJ8QHNeBKmUxkdjKXVaUTa5vj6TnjgMrJb3m+ckeDMb8+AKLhvA/5Tl5ycEcNyh7YUYFixXCEINMs+dEuCAQsEtO3Syf+VN/yucM2OSgZRBrrwTQrhKtyJIwnADTggX7qz5ZZxrgRe/jKVAKl/2Sf7cqhqpV0nZySEl0gQzIzE12fv2ngoYxEMFm47IN4XOLoqaivt/5FrpST58CO0cFjsvVjhR58h5c1HJc7KVN16C2e0Y+6wO+gMA6q4zjoM9+zczVCgVOkuNOefWKLkxakrwIfwIMAatTBz3uJeG6yCOBoinl26Vx1Z1U2mUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 8 Aug
 2024 06:40:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 06:40:15 +0000
Date: Thu, 8 Aug 2024 01:40:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Init MCR before any mcr register read
Message-ID: <q2slfjvbj4n57vzocgx6rqlu77jhbltd5o2dutu6oz6z3mrf3f@brzfergpr45e>
References: <20240808060251.510586-1-tejas.upadhyay@intel.com>
 <20240808060251.510586-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240808060251.510586-3-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:303:b8::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eeaa571-2c1a-4557-f3f7-08dcb774f64b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jfrb7vw08/9pBs9n/KvsvbHG7ZQWCS8MRiIXCeJ8M2HMptLk1mTkh+p/yTal?=
 =?us-ascii?Q?vbtkjVwOeZ65ErHyDLPaC+bhgdlS9eAAN0pNJGMLERwMOgQooa9yVebM1OIB?=
 =?us-ascii?Q?5yp05ScVU6YgW8v1yw0ooetpKGMzR68LC8QrS0G8h6uAYF1rDf1MklqQeaJb?=
 =?us-ascii?Q?ZQngsEwkaMcq3gUeQ8Hrox8Wj1vG6FqssEDyquUgXqpWQWzL9tVuQ5k6qssS?=
 =?us-ascii?Q?+8HehHx6EtMGBNHVLWR0FCGEhdR2Q+otNNaFcQfh/cxQ7LPf+go6WS5W+yyQ?=
 =?us-ascii?Q?7r1AT7mTwlF5vz3/iDOBSuW1FunqM2T+Ns1E552BLCQsVcr3H1aNKQUn7i+2?=
 =?us-ascii?Q?JEEkyEqJFj+DEnb8O2cAgOUoVprWIst6iwgOgKVHOQdteHQAprS2ZJ63u4Be?=
 =?us-ascii?Q?gWhRJHDeRwpitqDO6NKkIqJWgbVAhrvXWPv24SpHfCePg6HD1uIMtWUf/lBj?=
 =?us-ascii?Q?qsI4cmwPgoQBWLZxDEcncFQOgbI1jFlaHkV4oF8GdVujG+/sVjIfAx04JXTl?=
 =?us-ascii?Q?RSEfjEi4o2B33e0dflYHXRkHtrl+p+pgqVHsR7OyNsGFUUqOW/KMCMJC9vlT?=
 =?us-ascii?Q?IqeZHKRXyjh1Z11UuDewaN7aevduDzI/xz7+Ly4kBHK7fZBqZQbM9+0MM9hE?=
 =?us-ascii?Q?O7wxOE8/Gx49KWtsIrFT/1WL3jrDc/Sjs2rpHWOU7NBMR991Ch7dKCDcjw6X?=
 =?us-ascii?Q?7NjAlFRCbyYywV5Yky4TU2OhrEJ+CF/BUyzyFNPR2JJgbpF2HMIiH/B9hdGb?=
 =?us-ascii?Q?zvxych+Hir/Nt924clYJnmpqnmaZIR2IC/gTutCmsUoJRFt8z6vE/tADtz7V?=
 =?us-ascii?Q?4mo5jAlI5ksov/ZAiOHirgSbqQfculBh4U/Zfv1dvtmS8vUKd27QtsWdrA4V?=
 =?us-ascii?Q?zJAofdid17tN7HdnkGxa6GFKtQbK45EWPqiSMQZClnGutq1bjS8od4f11xXT?=
 =?us-ascii?Q?YFyheACT4VTqXFJTgx5SZPWWDifHb8yPeTP5hGW8Tzag/AKdX5OmLCl6FmdR?=
 =?us-ascii?Q?/zWwt2499FpGWyu/1BPYB+Ib7vuiiyv21jGk5gtGhi8Y6CIU3gJgeazqVTi+?=
 =?us-ascii?Q?ud/gV8LeeI4rolcRaqhJ/d/6Af2xpLNy3WfwYYtYfn3RNDBLYgMUSEPK/w/q?=
 =?us-ascii?Q?rYZ0DeOs9V4zH6Jj76HtHO41QQhYXKI17YuURCINRR7sdhIsLz0MbuLtmcNh?=
 =?us-ascii?Q?ypY+hZk/JUxsaPrZl0oXdjwhuYZM51IajbJMgstt4zNyByk8QYOhpEyTCV3F?=
 =?us-ascii?Q?/caJQQBW2S2QZVFfwxcxtQ11T6fX0c5MWGJ1ws8CpAsRQ8AG4b7k5CRKhAWb?=
 =?us-ascii?Q?gk+olvAQCV6Tss9k9gAj4nSX/Wt51vWjY4t5RUulwM22JA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gCga0i5g+9rx1C/KV+16Wit2LTCEMDMSTQMvBMfBXDv4Ne0GLyhKcVAAw9xy?=
 =?us-ascii?Q?Cnsf00WpFkKn0zJlQCrboEXUv52KKKwyuLQ7eJLSuJqNVRCzObpnlsbeK7JQ?=
 =?us-ascii?Q?C6tmydBiAFyqpMcy0BweF4AzC+4BTJNQtPi534zUwuooVrw9zAYyAsaVzKWo?=
 =?us-ascii?Q?0sW2OG0lL62N/fHra2jBEaMGBDB08ahgq8XRXrma9WOu8ckkJ7mdC4JKCxLr?=
 =?us-ascii?Q?q8yyNP8AwE6aLevo1uPXZSUoQkwIEuQa+Zjr4SwoutS5kLA1nQTAFYgcBw1c?=
 =?us-ascii?Q?2ucGjzMTM1yEruoXWsUojE1Ni+ouwakDOItVLFMAoTjktMX5kBmPxBvInXJ4?=
 =?us-ascii?Q?xs7jzGzg6SM5uU/SLamaPJzMr8RDcBYkBgbICxnEE1vOhrvIlTRVt+wjHdiN?=
 =?us-ascii?Q?Ny3+F1gtGjd/36Xswh98LNJllv8gtCDdsLRhmLvWFB9g0My4/0sPEFPFwHAO?=
 =?us-ascii?Q?E4GB9cN6PE3Vbl+vXpAHKDhwYIM03MA0eZKO3PX06Kqogcp6kEmH2srtUomr?=
 =?us-ascii?Q?00/0GuokVuFf9b410osWpgIi8WlQXO/ylC9WyNbIl8DLCviXUiDrhmiXEvpq?=
 =?us-ascii?Q?D5vo9za2HqVHmuSf/OSjRCXMoz6DNl/II2SDoili9/4cKcH4tajfegUapqop?=
 =?us-ascii?Q?76FCSL2GXuowwKs3OxkPHUg7FqBHpNnOjUkPHDDisQO4ZUT4G7nXYCHAVVjz?=
 =?us-ascii?Q?MoDNhNyJzTSelnJD3VKxXRCT8jvjwefxXuoJPXPMVW007TzDC/5WnV2eLRYE?=
 =?us-ascii?Q?e28ivk7EjNQchT9U0cZWv6Mb6r4yxy8U/ZKPl9okTYIPaVfCRqjQgMIFCvuD?=
 =?us-ascii?Q?nxfUjUYZMcMiCrBTqi3n0OLByEAoDcIPSDA335xIaaie9trbLkXACijmWisB?=
 =?us-ascii?Q?hOyV0e2+JW5l6/3XAUpf6i82JPAo8bAq0rxx6iiVOX/5gCa9gJAOMDcuzGff?=
 =?us-ascii?Q?WFLMYFwj9wkzA32BfsuQN4p+gqKBOMzj57Ub8GdxGgDtXNDi5wV7HsXdeWBY?=
 =?us-ascii?Q?NcK2UHLt7ctQ5Hl2cQcwrezBKU5L8ocWRN9SE+22zrVRhfUAzwYViiSOV12j?=
 =?us-ascii?Q?0Cyo4R4OGFRHz34hWXg0Lls+zu3vGS0N1ceHc5UjaTbAV2RTCcU/eg7snIeG?=
 =?us-ascii?Q?JvSGVXPpC65h2jBdkYlqQPL+3+ZtzrV1Dn4TkUh17wtfl5cSDRGod4H+J0vl?=
 =?us-ascii?Q?qE+cZMZXSfBjpDkzYf1AsBtUWj4+vChE4PSHdNVMRAyBKz6bE0oI4CxztdUy?=
 =?us-ascii?Q?D1pH1oO/WaAPkUAf+5H1WA/qRPUau7vX5dJ4i6ojaIulgsF85uQH3urmXsW9?=
 =?us-ascii?Q?OKWoHPIRxhdM774E90cdkQSIncHly05PkSH+NA7tUwCsgK3rWhfOPSbgvl9V?=
 =?us-ascii?Q?HQ46du7sK7oKcbTPizCCGAp96/qpbAb/bjC+aUrnOq0Anfg9gKGWXoj7GwGy?=
 =?us-ascii?Q?iRNT/C5bRW26+VS7pjBVQPU+sExk5p+idwidRz7tAeNvBOnJ6gqyGwF0Liru?=
 =?us-ascii?Q?hegwX+aGOnsId9grjt1wCeTSCYcY+70pzzNsNF2L6V4OfaNyhIU6EWBv9VsA?=
 =?us-ascii?Q?DGJXt4O9Xskw8iuZIUNJx9rncjeVyz7ez82jkQOmEKbHAdsCtCv7jw6+Dfvl?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eeaa571-2c1a-4557-f3f7-08dcb774f64b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 06:40:15.7462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BrYql6bz6vlk1fPJOftcseogF+ZgupuxHu1xkPf10HD0bXo4pW+BOObGOo/voofyWCVuK7p89TZxI3vibcsn2/RspacourjpDuJ8CXuMmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8040
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

On Thu, Aug 08, 2024 at 11:32:51AM GMT, Tejas Upadhyay wrote:
>enable host l2 RAM is example where MCR register is
>getting read before fully MCR init is done. Lets move
>MCR init early and merge early mcr init into main MCR
>init.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c     |  3 +--
> drivers/gpu/drm/xe/xe_gt_mcr.c | 21 +++++----------------
> drivers/gpu/drm/xe/xe_gt_mcr.h |  1 -
> 3 files changed, 6 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index c6296dc8897f..e2e3a1eabde8 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -555,7 +555,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
> 	if (err)
> 		goto out;
>
>-	xe_gt_mcr_init_early(gt);
>+	xe_gt_mcr_init(gt);
> 	xe_pat_init(gt);
> 	xe_gt_enable_host_l2_vram(gt);
>
>@@ -568,7 +568,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
> 		goto out_fw;
>
> 	xe_gt_topology_init(gt);
>-	xe_gt_mcr_init(gt);

how are you going to init mcr without topology being initialized? That
won't work. I was actually thinking the opposite move:
xe_gt_enable_host_l2_vram() should be after xe_gt_mcr_init()... didn't
realize we had the whole guc load in between, I think that that would
still work for WA 16023588340, but CC Matt Auld.

Lucas De Marchi

>
> out_fw:
> 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>index 6d948a469126..9c4c4a627bc4 100644
>--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>@@ -375,22 +375,6 @@ static const struct {
> 	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
> };
>
>-/**
>- * xe_gt_mcr_init_early - Early initialization of the MCR support
>- * @gt: GT structure
>- *
>- * Perform early software only initialization of the MCR lock to allow
>- * the synchronization on accessing the STEER_SEMAPHORE register and
>- * use the xe_gt_mcr_multicast_write() function.
>- */
>-void xe_gt_mcr_init_early(struct xe_gt *gt)
>-{
>-	BUILD_BUG_ON(IMPLICIT_STEERING + 1 != NUM_STEERING_TYPES);
>-	BUILD_BUG_ON(ARRAY_SIZE(xe_steering_types) != NUM_STEERING_TYPES);
>-
>-	spin_lock_init(&gt->mcr_lock);
>-}
>-
> /**
>  * xe_gt_mcr_init - Normal initialization of the MCR support
>  * @gt: GT structure
>@@ -401,9 +385,14 @@ void xe_gt_mcr_init(struct xe_gt *gt)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>
>+	BUILD_BUG_ON(IMPLICIT_STEERING + 1 != NUM_STEERING_TYPES);
>+	BUILD_BUG_ON(ARRAY_SIZE(xe_steering_types) != NUM_STEERING_TYPES);
>+
> 	if (IS_SRIOV_VF(xe))
> 		return;
>
>+	spin_lock_init(&gt->mcr_lock);
>+
> 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
> 		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
>index 8d119a0d5493..e7d03e001a49 100644
>--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
>@@ -12,7 +12,6 @@
> struct drm_printer;
> struct xe_gt;
>
>-void xe_gt_mcr_init_early(struct xe_gt *gt);
> void xe_gt_mcr_init(struct xe_gt *gt);
>
> void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
>-- 
>2.25.1
>
