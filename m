Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72731C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 20:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DDD10EB9C;
	Thu, 13 Jun 2024 20:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gs1ML2Uo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1989C10EB9C
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 20:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718311927; x=1749847927;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SgMm5DJ52T3zkj45ojQgDglZ1jFWT19ghX3EFdbi3lI=;
 b=gs1ML2UoDm15bU4zRhQ7mvfxMisLT72huHfDfT5CnxuYnWTNtzJJWZTx
 sGDAH+zuElxPO6QoyP60dZS2QWA92sYVZynzFt8VaIwomQnXiw3wGI6nw
 3GZhHATqlVVeMe45EoXtPvkIRd+vXX1fXk8QJk8hdHSoeVJMpYyXQpylK
 9NYdTjGH780SJg5PBE6jjNppYb/g6l+y7Kb9FV4+DRuxxw6OOktw8W9wi
 fgAaw6DjB+odcTu5aG9XXs1+3YZpCg6NRvM2E+5hkl5l0yFKb5uvMNXB2
 2pob9M9JnAzjeil0tecnexAPGqXhUkBrtMeNGz4dMZ9/sbGaecTkHN6gc g==;
X-CSE-ConnectionGUID: JoEE5KvYShaTmYS0CA8W3w==
X-CSE-MsgGUID: A6/4JIV/TMiHW1Yd6hO1aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15044427"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="15044427"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 13:52:07 -0700
X-CSE-ConnectionGUID: rJd2aDtbQWSNsVQYhucRuA==
X-CSE-MsgGUID: mbTN2NsISZWRMnwQdDpkCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="44649973"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 13:52:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 13:52:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 13:52:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 13:52:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 13:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJ/xTfGugqR8ziK1MoWk1qlDKonEwpGRQYct9+YEYmjhgSVo35e/QSsxk+mBwShN3nRbLx/Es4G4fnStu9fVl0Q6a5e6yDAetD6/CShRmDKUugm0uEDqnvnS1RzNsFpCzE5zewnyZDz4KsfImMlQJ6/LTU5Li+iJKafOwoIpLj+3paVsKL5mrCbxKgaBvFMmt7+WO29GhubuSv8jpNMZ6wiNDUmhb3HzSKdRVnc/nD+6hKOHWJlAoETQhPw51s9J5XUzKhsz8f6285ZSOd+syxscRWnqtyN00js7P0FruKGnqLY/+I6KRadI3VKvbSKA852AqXJBJT7ew9QatjRTQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqWOjn00hr/onU8cPF2TFjvBb6O8CDukfYBVTUdOUlY=;
 b=RRm8IPEgzu1+hetFcVuUlHp8wWBXb6iNxVEW8foOk/aE62bZkdKJ22rVYqx46bzWSaar+PNfdemsgMVbobD8siIDILSPluA3Q04pw7aGPDt9sxhZavwBTOBhqnMCnI+UDsDlThxqgi1ANwmsDTnEjRXXB4Dq6lIgQqCwcyuxCEEQdowvt+8JHNGJvYz6JqkMmTNJk/CJ1b+yFC12yohrAFd1I4uws0CJNOXBwC8evgdhxuOUi5FQlyLglsmPwKMF9gbSa+DAeKU8PuMhFxkbB+SY0FPkHmLik2y2hH1DxFxxSybFAFqUV9OBVsvgUNTb2OpZtJEJq6cU2/PqWkEcaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6062.namprd11.prod.outlook.com (2603:10b6:8:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 20:51:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 20:51:58 +0000
Date: Thu, 13 Jun 2024 15:51:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Use fixed CCS mode when running in SR-IOV mode
Message-ID: <ytfnpy6bbt7bnxgsrwzcm7kafk4alzx2rftuswa3gbbbxpggav@6vkcnb6vc3ab>
References: <20240613135445.2076-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240613135445.2076-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0244.namprd04.prod.outlook.com
 (2603:10b6:303:88::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a23bdd-9112-4e9c-5636-08dc8beaaa7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5J7Nw+3lNMyeuNXlxvK5IdzGiEb8mS5Wh14GWty8zNL8v7R2Z6aPbyyzRJGx?=
 =?us-ascii?Q?JVNk+FgNc5I0ArK9BWE56t12vpZbOaLJ2g7sMSdJEIrI1If58O2y5osx2+IC?=
 =?us-ascii?Q?bAg/nRAtshOTe+MxNOfTVlP1IXBuzOPQEzr3Pp2Xj3Y3Cv9SV9Sn6K7EMeri?=
 =?us-ascii?Q?xleCG+1anUj4crXq+pPDAT5F2kQnk1Yg1gTzVsBHfFKwA/JSwhlDuBzeu/yK?=
 =?us-ascii?Q?l0F0C91C/+WWx1EN/OctVTxerBBfVidXh/FBytXhOJlUVrMLlofYxQM+98IM?=
 =?us-ascii?Q?sAsXy4hhXvayH+RwwL+g/va+ZgD6tCTMp63luIsvB+B6ICSW469pQncRBgkG?=
 =?us-ascii?Q?jmDpK23oxr/f1bqx+mO67n6renu78mJextT3I03TB2qvWGnxVeRFlFPGLBjT?=
 =?us-ascii?Q?xPA2Z5h3vTfrMFneRaWDOG0Wx7Z85KgGKXG2WUed08lQimZQEyQ9GH1aPRge?=
 =?us-ascii?Q?S+FRPPYPWqBmOWEqAd3rR36Z69BEOoKVT3JXxQfDTLudxqfb2segVZuwUcrE?=
 =?us-ascii?Q?eqxY0YWE3faXcWhpPkf4/EjVQ574gDMyFIejv/iAlH4DQcVKROTf+WEHM6+4?=
 =?us-ascii?Q?K/CeeXVXC/G9NCxibBex9PMsX/R9zPnOoepU4EfumA0jhBJEW6rQE6f5uG58?=
 =?us-ascii?Q?24koV88Zcr9j2qscx2KdRwXKwGlUr+n1RFXSF0CnPdUl5yPXs3sKtr0hsLjx?=
 =?us-ascii?Q?lLqK/pHrINXxHwsvHPVkli3FHUhkG6r9U8OrGFjxGQsaJfublH9QUUD6HgQt?=
 =?us-ascii?Q?rn/BXSkrcM6CCA6zLk6qxudSRXEktaSm+zTwqJXCo+W1R43nq6l2FbpaG8U3?=
 =?us-ascii?Q?gC6ZcNYEe0dJkswPy3g5PjPat48r1VIa5YUwtwh9WN80ixoHJYhAwLrPw9o1?=
 =?us-ascii?Q?8Pw6dUQL3TiVwrDUbr2aFkVJHirDzr/aIwtCSuvPjfkffaxQwPWEheKJzFY8?=
 =?us-ascii?Q?lpybzC04CX8YiWjIcJOOhtUwgKBL33jbb8Q1F3T73k/OAXwDQtZ+/9Xfa0+d?=
 =?us-ascii?Q?Cke+CngqTRd44/5VthCzaycFA05cKbiomhVQBgtjifwZgOpsZ5S3dxsROwmP?=
 =?us-ascii?Q?9n7hVwzitxCZdf4HMi1P36Lxv6Wrko8hb60SxOgemLUhNGimRHedUD0danbt?=
 =?us-ascii?Q?AcQBEyExTHXwcSffFbhQS7YWtdOREK9NFCZ+lz/EXNOXxgoTdJZG3F4ojOTF?=
 =?us-ascii?Q?3fEVGxFzr6id9H4PJNDE7oTxUvsq3KaAH394fZ+T0zYF+O+bv8fA+E8eHhbe?=
 =?us-ascii?Q?63NYr2obBXrFIUg93swJCqCf30eg2HZOWDkCNWAhf9k8L1FKJLvgrLc5v3W6?=
 =?us-ascii?Q?TDvgqY6vnBNGvZuABGj6DeXh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?50BLxjqLimCi4YhSsnl7OyU4jxMk2pSXCwNm+JxGnYkS3Djxia7bg35Q+9Jv?=
 =?us-ascii?Q?4vvZJ+4QDb+QLPMZPzHrFUa1RUXhnOIohaQgeHtyL1TIgS/7JDNRlUNNECWy?=
 =?us-ascii?Q?uoX7Tad6vwIZmkmAwrT1g1Mkrv4F/w3k3Sx2kevIRh1rvhuJO2PLM2YG+kSN?=
 =?us-ascii?Q?+QGFwDIAwlt5htQFHvKwzSZ9569TJHEvu6kLzfDO1BWtp5t9KsD3BZ5XwSqR?=
 =?us-ascii?Q?C3IiWIX8SqCZn1BnFZBu4EkFc+TIXJJq3Pc0vc2h8NVyGz4D6FGuEHVyi5AD?=
 =?us-ascii?Q?ZenAPETCg3jbSaALDuy1FaQCLK8648yLw6oz5PjBTMrJg9EBalKmEAMjOkJN?=
 =?us-ascii?Q?BFSDar/TJ3EGklem2B75l5Md4WSks7D0LtdEJHpmaYYSa0puB5WMFUGlUFG3?=
 =?us-ascii?Q?8gRt4TJQVxkq3rakg6UaSML9+9Xpw6Qy+25l/RZ7oB3MmwXpQ+0ZSI5ckqkv?=
 =?us-ascii?Q?BHxwNAbcatzf0CrP3il9Ofaydxet4r9EyHEiTKbmNBO1evPLIqdpYXxemIL/?=
 =?us-ascii?Q?WmHIHgfs88bz4Iqp4ojHW68vwDLp5+fRR05i2HzJf2r3woxPdAT1tegS6/bd?=
 =?us-ascii?Q?1r54o2zi0Rjp1DHduqBU6F095Xf7Cya4lua/6THF2BS3Xus+KAG5QWTzKZtv?=
 =?us-ascii?Q?oDaqdEBLJcrglhosklRPzy+Pz9ZU5f2dAgRxc5ODQh3VJxjPnIajAu/VTghe?=
 =?us-ascii?Q?NxOlQPBJdQJuE9A1rJIw0L8timrBLB7RjvWCdv0lkhIrEctyaLRm3kqAPL3b?=
 =?us-ascii?Q?9XT4sSIFm2SyYNr6Mf6cGWhkmc0b+SssyHD7ZqGDgJHV6FT0zpJpQ70ZVGpq?=
 =?us-ascii?Q?c9dIFM9DJZU7NhCEITQkUypMHMAzrHWtgdreqHtPrDt5r2SCi39oBcspITGv?=
 =?us-ascii?Q?5v1VpHH6B36atyRaYIaOXLxXZGP5Tvd5zKnvKNchMY/ZoFt5lYbcM4dckOw/?=
 =?us-ascii?Q?GI/k6e5DTsqqHkEpNVcy1swt8ZtgUOPet43VTpp7M5FeWmRd5cj3ML7Lx6jk?=
 =?us-ascii?Q?Nq3W6Quhbpqojf4dHfwtU8T/aDwIzsQWMZ6TbDOZxy48oJp9kklm8Zpr42Xs?=
 =?us-ascii?Q?PH9A8MSnnjlxWqNqepniBe/XeHcs98Hrs0ABoMpFqdnVCk4ENjyLLeoVQ9TS?=
 =?us-ascii?Q?moeX0IDImKH2LDRVRc6Y5EOhpIBq5yMsvF13/dQzS4LBgXd6uaSwjrFXL2Ye?=
 =?us-ascii?Q?3YCRDIqMR1T8zrNfNQbG2ZpLpDUc5Iavb7nOs2/dEqA2VevGftzx4q9pQd+p?=
 =?us-ascii?Q?k2a5oJTl8OEilmaB8fZvVVi6tTu42V3+mgGGD053Ukl3DWuqT20byCKb1GvW?=
 =?us-ascii?Q?s6fwVKNzIFF5lReXqC4IsmbDvtPXegxgg2Q54E10/lLlddp9CAj6gy++8CR8?=
 =?us-ascii?Q?DjjX/QGW518FgAborS3LxergzMDhXwVV9CR8U83+MeJsCkJzOGUeqK7/2tGV?=
 =?us-ascii?Q?Ro9zQEVW+8zJKEbBpSr214iPB4mFgGQ4I41pDq0fky2qMrLQAyWhVfh5AA5t?=
 =?us-ascii?Q?8+QJHkYrlOWIxbNCt70InbYPD9QwVMLvTczZItUPKcFSucPecbymZJ3ikFul?=
 =?us-ascii?Q?j4m0ldfcjd427GK+oA6UXDeKwFA3No7QRn3oY2oH8fV/Lb98K85WfDvT2aBC?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a23bdd-9112-4e9c-5636-08dc8beaaa7c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 20:51:58.1063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8obT4LaKB1xgxNS2ph3eGWQ7UtFzFM+Od7n3oyc3G9tx7A/7LjZc3tbchez8VypWwVWsQN59soCx9Zi4+2t5UsO6Z+6pE3BA1EyEVVXBlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6062
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

On Thu, Jun 13, 2024 at 03:54:45PM GMT, Michal Wajdeczko wrote:
>We don't support changing CCS mode when running in SR-IOV mode yet.
>When running as a PF driver just apply default ccs_mode=1 that VF
>drivers will assume as already applied and fixed.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>index 5d4cdbd69bc3..aea49253d9c9 100644
>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>@@ -12,6 +12,7 @@
> #include "xe_gt_printk.h"
> #include "xe_gt_sysfs.h"
> #include "xe_mmio.h"
>+#include "xe_sriov.h"
>
> static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
> {
>@@ -75,7 +76,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>
> void xe_gt_apply_ccs_mode(struct xe_gt *gt)
> {
>-	if (!gt->ccs_mode)
>+	if (!gt->ccs_mode || IS_SRIOV_VF(gt_to_xe(gt)))
> 		return;
>
> 	__xe_gt_apply_ccs_mode(gt, gt->ccs_mode);
>@@ -110,6 +111,12 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
> 	u32 num_engines, num_slices;
> 	int ret;
>
>+	if (IS_SRIOV(xe)) {
>+		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
>+			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>+		return -EPERM;

EPERM? I'd expect ENOTSUPP

Lucas De Marchi

>+	}
>+
> 	ret = kstrtou32(buff, 0, &num_engines);
> 	if (ret)
> 		return ret;
>-- 
>2.43.0
>
