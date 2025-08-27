Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76362CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 20:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2697510E8A9;
	Wed, 27 Aug 2025 20:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2Hi+gDy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5809810E8A9
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 20:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756325504; x=1787861504;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v5YW7WFbLk3qv7drfiaFJG/890MN9Qr9chUGZeitXXg=;
 b=a2Hi+gDyb2juEkv+uNN7aITz8levevRnMKJTrEUof3AvReNVgo0UC98i
 R57G8RtYi9WCNEStP2eqhMD7WVgcN5DnkTTf0oW2iHQmnlFIOfQ3tFVi4
 GhZxnlAu65WlXELKMHWBHKolVZr5bz/OiKpJfOCZpygB49QjjBUDJY/v0
 /D99TI+TS5qP2E/3Evh/r8tnM1mWU5SSO6HtbhAG6kCRGjguLM8JzBmVa
 Uujr2VjLB8MRTgU3IiEispGLd5G6bRrGyjy9lN78Bo9GR7eimLiMM+Q3i
 vJnkYIGeuGQjIrBSOTHl5AjEPS5YK0bUxNzx40RN+S5PR5rEcB7B+W/zd Q==;
X-CSE-ConnectionGUID: hgrAIQqDQQiQT/nV24kvvg==
X-CSE-MsgGUID: AFEtVAhLTvufvZ1LJNkcTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58299064"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58299064"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:11:44 -0700
X-CSE-ConnectionGUID: miUsnLvwRq+KNmQWK73xbA==
X-CSE-MsgGUID: BRPljNcnQ/CSwffrBvyzhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="174265674"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:11:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 13:11:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 13:11:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.42)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 13:11:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcEIxU5Zs7pdoSaUp7HNeb+eAu7syPkSE+6iXZaqYnMzjI+cpzAshEIr1I2mQIF82pqk3YUsK7KjNXcTGxwCxmXMuwdPRJXdNaXfOYquinxXTucyqR8rwBTuX56Vg1e1CiKy/8fiJjKAmQJuAhKhhHY6FTDWWtW3YHjzfdTHaWqCYrGfhdCvws/Y5gwYRR+oxl+kFwt6txr+fxb07k+EaHEQeybSvqwIDc+EjHooDFM1NxmCZITvS29S1BJuN5YHDQxh+AxEFZDLgrFVr0XHEMq0MwiEiowcI2Z67GzpXo/bc4KvoMyfxdHAMSpqhlQjlmwAQl7vVaENr2eroS9uUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLoRw7W80T3pzY+9k7Y0VBbLfktkq5bVfrA1l19SLDk=;
 b=ScwRvb1sL8rrK3v/Fb3+cD0DkFObsnspwpCayo2nsMekXPJ+gBeZ9wrHmtbMgozotJmUIdmwfo75n9AVf9IlUPJ68gKdl8lHlJvqSLap6lS4eb44imEGMtjV3PTclkaJ/e74ismjSUICglF8XUdOZXIacRw/HntS0L/0GplZbLhbKRItdlX4NOhsTLcfm3J7P3qtAWk2k72jMm2utnlro49r4Au1bTXWLysDLuxiy6icpiill8rJUOuXGoF8Riy166IXSleK1DEluGT0siErXvGFgWrJxpWeWShpReo17oGQJXGme4DMKSYQQsOweQ7yqs8bw8E1y4UWS01352x2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6010.namprd11.prod.outlook.com (2603:10b6:208:371::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 20:11:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 20:11:40 +0000
Date: Wed, 27 Aug 2025 15:11:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe/xe2hpg: Add Wa_18041344222 for Xe2_HPG
Message-ID: <l3o4birrnbgohxtopdx3iv7jbp3d7pe4ifurhapygbixehyvhm@eyh75lwhsn7j>
References: <b131c6dec20a07acab020063df7ff22b7050c14c.1756318068.git.harish.chegondi@intel.com>
 <1b910cab369af1e386b7f8da186a756f6ffe2361.1756318068.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <1b910cab369af1e386b7f8da186a756f6ffe2361.1756318068.git.harish.chegondi@intel.com>
X-ClientProxiedBy: BY3PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:217::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bffb1bf-27cd-46a5-17fa-08dde5a5ef16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E7ltRlp0fPtQFoJh/6w6nia+Er5GIQuRBf2WilnY1yV4KS89+JUX03AoTQC+?=
 =?us-ascii?Q?uNgNDoXx0+wxXjsoWWuQhXSozEAQkoxL9VACzTAndaOcCCBVjaSfKl0dWGYf?=
 =?us-ascii?Q?lALSafu/s4VHZgGXkoA/tbWe4X07jPMLxFPngbi092GT467DLu2o2ZDxyNJn?=
 =?us-ascii?Q?XlQPbOPexyCydMwhVDAHGVf7+NpGJ/t/4NxNcne2OeNStI1NWz6OykyqB4IZ?=
 =?us-ascii?Q?PL8ddjv3rB1xYYvtTv1Q26nHs5/N/a0E5Q0wwn7elg2Vo+R0mYjXA2c6snkk?=
 =?us-ascii?Q?Cm2pnUPMy1TGaeoVudKCZ233+BLNDLRZeCtGbkNTjJjRsn6/lGYv9F+2/8yB?=
 =?us-ascii?Q?q+V0MclZWGgoaIvX5c7Aqv/2p9aGZ95AFVuan68kHFevAMkd60lSUlFLpgaX?=
 =?us-ascii?Q?AtcR6bllUBBqbtt/wd7G/4EIdlER3emYzbX2R7VTGKw8gMROUypI3fKHuFMM?=
 =?us-ascii?Q?+bn4E4zbI9ui/SLCnYaPikTuAnR4gbAj2/+mqty7RAbRRMMaPaN2B6Q8dsKQ?=
 =?us-ascii?Q?7NUpJ6SqvNlQodIrAblSr5J5r/amGEZuyzGfp6CJ/oXscaZ67FQb2BWMe31B?=
 =?us-ascii?Q?ig3M3slW9dlzqaHTjx4hEsSJ/gCtoi+b1FghGHGgZ4aWIcNFucHITCEOHDx5?=
 =?us-ascii?Q?MzvvonQz7MyXaI0vL2bBXkayBC916h43rJXxIGb7eU9SebyMjIke9gsaz/nF?=
 =?us-ascii?Q?D7KnDxQN5IGnE6p3QaKQk8nAeAQFVS0z26hCXTKKbrfNq09Rce9SD63hKJtb?=
 =?us-ascii?Q?FaZC9w5R6j73iOk70SkGgHsjue+nq8HrEA6uuQvreVGSAfNNxARGgNVMVGep?=
 =?us-ascii?Q?c6LbteDOArP1J3AhGKCBnPPUgTapWZ7/8b4CrLNSaI0Hsv54xmnqhRBFl17e?=
 =?us-ascii?Q?ag5k9FGMp0GclPSAT6bWwAEOBWbDgRHsTWI4GpdBZjaqho0OH1Vo7gauvH8J?=
 =?us-ascii?Q?QXGuNW7Ns3D/JsqxEUAci4iPTVmXSU1lw5VXCmXxtqXZ3Gn2q7DDW2os6jqp?=
 =?us-ascii?Q?Wz+5Q7W2rJ8MzFwubJ2XlOc6xE+DwZ70uOua7AoPQRH3QHTz+8Us6rarg2zE?=
 =?us-ascii?Q?pD5vREsXVjAjNYVkqliXYtNerjMLeJaihFOg997pkU6iO7XhYGLFFv6Mw9bM?=
 =?us-ascii?Q?CX6BLi4QyUVDfaFBsxWYuHbyTU13ZC539E2PJfSO/ZTtDU5JtRpzt5M6mTaj?=
 =?us-ascii?Q?yt0fepirknJnFwdzvuXfqYQIbxOo+4AZxr1rFS5+HW83KXXUNtR/8OfGJVlx?=
 =?us-ascii?Q?eJu0OEwI4J2+dfrkeY0Em8jt9scB283j+rC42DCcv5V8Y67je0HJnue3aQ2k?=
 =?us-ascii?Q?V1xbAsD2Y1g5a/ldtWd8j2YDvNIQRPc78ozxKXtWcBWLkm4+6oOG5sv0hzVk?=
 =?us-ascii?Q?mSt3XPrez7AajGtgS9jJkit3QN1QtsAEq0OkhWk5pJLAN9cmQw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XbpAVU3yE7SFZZGQeDtpkg2aN0shxPOLHRdGvJ1Brvesk27jZTp1kQnUk3Xh?=
 =?us-ascii?Q?FzT0T7c031CLM2ID/A8FdL+nwQjMNUD9Wb5gV12SPVzA92jMOA9rv2CQthZ6?=
 =?us-ascii?Q?ic0dvY+QgmZC+q4pdaOmZFDyMsWFsQckiGL60sZHiy2uYSda28wm6j8aHMpN?=
 =?us-ascii?Q?y0pikV9bey/Kf+TaiYcVc84ZUgjISog032ik2CxV1/ICr2NXBFSByj3LPWHw?=
 =?us-ascii?Q?ieYiViTNN6EOP3rujj125+otjkJjPaPqBtvgu9BgdyPA2+7jTG69otWtNJZA?=
 =?us-ascii?Q?jKJ7COpWXXDN38AM4MQaLkWCGDMEAmyIw3ZPVdGBwqxQQOsXNJQvQrN5M8qq?=
 =?us-ascii?Q?glXltsIOkCsxAl642tEOUUFv99nXQkpUQw1bZdyjmvBQZMaJWNP/XocOcCDp?=
 =?us-ascii?Q?0HvBYqAKg+Jkn3XsUCWuq7E930cjkwfx/04di92AYw83Jr4YR1rKZT6xGc0c?=
 =?us-ascii?Q?3ikU8YuKSLEkF+MPtLY1ahhUOhSJX2nkJiPt6Xq/+UtG/FoKiHdkCxdSrXYi?=
 =?us-ascii?Q?jrs9BxiL2jDU4WD9n7BnDVBX7F495dFpmwJgcktEqjaSCFEbXAifBqzO3unK?=
 =?us-ascii?Q?R3/3dViej1XfdaRxGuoCOZslYBx2/4YdB7f1Np8igF85UnbMBEoImKbu9dNe?=
 =?us-ascii?Q?75bI0emmKExavQO42L5LKIvCzAzsXrEPGlPAphHe7l1NQ2jocIjG3/FgTYaS?=
 =?us-ascii?Q?JZEqGjbBiLQmyftYe/mYPw8dZCzTSv2HQavtBIXY74p6YLJhWjWYxhT3UB2W?=
 =?us-ascii?Q?WRbEfiV0m/PbWiPkKhlit6wcc4za8TsMt3uBUReiDD08w4K+5CNAGM9rGLhB?=
 =?us-ascii?Q?Dm7UE7rZMCYFMZGbvJUMya3YngkR/EcfucEoJXwWhCmTQk7xbyaPjnSqHLfI?=
 =?us-ascii?Q?xlD/W2ADYuUCqHkFpTMLJ/RjBTUNJXvNNSvxc7Tv4MWYpPlCqade419qBI9m?=
 =?us-ascii?Q?QklUJsma6ZOxx6rIoiuKQ6BbpEn6KF549rcZJZsCYr0s30TdkjkSrd86aXH9?=
 =?us-ascii?Q?0EbzgNdRiR3twJUtZpy1RIVIwHHolwP9w7Xu8nNn3T+/U5F3WWS2YSiFZPat?=
 =?us-ascii?Q?agPULPfTSt6ujCIauxe2Joox/lw8T73pY99FQaMuiYEyKFaJk1mnk11vV03w?=
 =?us-ascii?Q?hAN5kUjdp3SK1xCdRMjDRbdoZjzMx1mMTItI/8Ld8nnZL/FcBplbBANHOpjL?=
 =?us-ascii?Q?sfvAqvVxSPcphoFmihWLg5IfP0Ktf4C+0G7NaDBngnHz8wa7KbwYWupfbtg2?=
 =?us-ascii?Q?VCfxsu8VRzS2c+aC7bTqS8fTLPCRIkS8i1oYnSbtwNBAXuKpGwlH3H0JUaWn?=
 =?us-ascii?Q?VZaWcXSQG3UXpwTD504NlYrQ+pZm6atVUMwFbld3pi1GHIP0Y3WaY5pE2HkU?=
 =?us-ascii?Q?/kjG/MzB42RSQbOuScthTvnX38F4dmlPGdt93g4DgA5RxIFVCp1w8kymj2kr?=
 =?us-ascii?Q?HX3NSLJ/SOS8+1Zc0tBsOfKL7tKTcTsAXbfc85Bwkb/wmVub8mntyXmA8oW9?=
 =?us-ascii?Q?mM2g5M4F6D+Y/jc+AsMSr4lkB5tiejL6H21Q/3JsV0vFDCPYuW9x3e+Qzjgr?=
 =?us-ascii?Q?9nNizn7LVsIvLLdhkaOQi6IInR4xXhkrLlbI/hQHvnlcFy9jJuTbXrpnQsvB?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bffb1bf-27cd-46a5-17fa-08dde5a5ef16
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 20:11:40.2789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7cjv+s1zI1QZ2aenZg4j72ZAUSZW0XiAhcRoyGMmBwIdpC6AsZdi+bWiahU8g8Km2kO0zq+CSfFhYs0M9cLNbS58g50OCMKhQgnbjAPV/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6010
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

On Wed, Aug 27, 2025 at 11:09:35AM -0700, Harish Chegondi wrote:
>Add Wa_18041344222 for Xe2_HPG that requires disabling
>the perf mode for subslice count for eustall sampling
>when the enabled slices are discontiguous.
>
>v4: Rebase

this changelog is not very useful, is it?

>v3: Skip the workaround for SRIOV VF
>v2: Add Bspec references (Matt A)
>    Rebase
>
>Bspec: 79483, 56024
>Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
>Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
> drivers/gpu/drm/xe/xe_gt_topology.c  | 17 +++++++++++++++++
> drivers/gpu/drm/xe/xe_gt_topology.h  |  1 +
> drivers/gpu/drm/xe/xe_rtp.c          |  6 ++++++
> drivers/gpu/drm/xe/xe_rtp.h          |  2 ++
> drivers/gpu/drm/xe/xe_wa.c           |  7 +++++++
> 6 files changed, 34 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index f96b2e2b3064..06cb6b02ec64 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -522,6 +522,7 @@
>
> #define TDL_CHICKEN				XE_REG_MCR(0xe5f4, XE_REG_OPTION_MASKED)
> #define   QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE	REG_BIT(12)
>+#define   EUSTALL_PERF_SAMPLING_DISABLE		REG_BIT(5)
>
> #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
> #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>index a0baa560dd71..0ed7dc9044a5 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.c
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>@@ -12,6 +12,7 @@
> #include "regs/xe_gt_regs.h"
> #include "xe_assert.h"
> #include "xe_gt.h"
>+#include "xe_gt_mcr.h"
> #include "xe_gt_printk.h"
> #include "xe_mmio.h"
> #include "xe_wa.h"
>@@ -328,3 +329,19 @@ bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
> {
> 	return test_bit(dss, gt->fuse_topo.c_dss_mask);
> }
>+
>+bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt)
>+{
>+	unsigned int xecore;
>+	int last_group = -1;
>+	u16 group, instance;
>+
>+	for_each_dss_steering(xecore, gt, group, instance) {
>+		if (last_group != group) {
>+			if (group - last_group > 1)
>+				return true;
>+			last_group = group;
>+		}
>+	}
>+	return false;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
>index c8140704ad4c..fd08b382e259 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.h
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
>@@ -47,4 +47,5 @@ xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
> bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
> bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
>
>+bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt);

mind the newline

> #endif /* _XE_GT_TOPOLOGY_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index 47ea1521dc80..b5f430d59f80 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -370,3 +370,9 @@ bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
> {
> 	return xe_configfs_get_psmi_enabled(to_pci_dev(gt_to_xe(gt)->drm.dev));
> }
>+
>+bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>+						  const struct xe_hw_engine *hwe)
>+{
>+	return xe_gt_has_discontiguous_dss_groups(gt);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>index 7951fefdbe04..d0adb29db7dd 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.h
>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>@@ -480,4 +480,6 @@ bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
> bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
> 			       const struct xe_hw_engine *hwe);
>
>+bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>+						  const struct xe_hw_engine *hwe);

ditto

> #endif
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 52c7df4c3afd..1d4efaca110e 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -612,6 +612,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> 		       FUNC(xe_rtp_match_first_render_or_compute)),
> 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> 	},
>+	{ XE_RTP_NAME("18041344222"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
>+		       FUNC(xe_rtp_match_first_render_or_compute),
>+		       FUNC(xe_rtp_match_not_sriov_vf),
>+		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
>+	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
>+	},
>
> 	/* Xe2_LPM */
>
>-- 
>2.48.1
>
