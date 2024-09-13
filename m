Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6238CFA3757
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 14:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A60410E282;
	Fri, 13 Sep 2024 14:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jqcMbDyZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2D810E282
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 14:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726238209; x=1757774209;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L76eh1slzjE4iGI9Pk4oOiIDMAu86CAXHiLAToex8Cg=;
 b=jqcMbDyZCtp8z7zn3lq5Ez5fF+ETTblXLg4ZPsvcP/ew30S0j0ue57SN
 0w6aMrp6CagN/sZvvXCuGXylfKMOc07wQGvQhE4XmLVOP4acymUvmuwUX
 tm1eJhbr2pWWqTtFCew8L7WNxUPkyj7UvdP49AjAAK9xLJKFPWmzncX2f
 /mSTEn3dC63/Bob1xMkrMfHeA1r1xW1LhhB3+GshP8u2LBeLUA5oj18Ad
 PdDcDLgjnOWVqUljeoYIMpd0NwM8zm7ncM5QfXib6HbBQdQjcwXbTBk4D
 3px8VFsyJqfhtQFU3Jk2i/Tto2ofRP76tReXQdtCuI0mx0+RiFquBm+Ac w==;
X-CSE-ConnectionGUID: 1VkFFyT1QEGdmF902wS8LQ==
X-CSE-MsgGUID: 07KR0rUUTrmrDQO9qJ3IQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35806730"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="35806730"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 07:36:49 -0700
X-CSE-ConnectionGUID: P24M9CFCSaKF74H9NRLayg==
X-CSE-MsgGUID: /ISpXjJMTmymHkizm2USlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="105532544"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 07:36:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 07:36:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 07:36:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 07:36:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 07:36:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTvC9ZVw44Gd0KzTQ2AUNfRh7x1WlEo79urkTTZPnB8+HYMfeccD7YH2VfItUjr9PlQiWuRXuITdSIiRvPs/8rsI+qToJsa78jQpLT+LZMZ9WSgyncV+qO7NQzH+VblzqfjGYrDXTnV1tiZzbSStSRCqaQfn9D2wAhDs6IPPE4aRDO3qi+Ia9Qg4KXyH6UFMix8Mo1bTKduhmeJ+ZstXlbc6vih7ffuL7mBN1LSVna15aQr+ehrjya2PenkDM0+PunYxkrFYx5Iv6suaZTevk4f52s3lWV1v4/UHcp15kp7TXMVlfEVmHW4qMzk7uYoCK6Loz0gXMb/WifUGPTjGJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SegFto+LERU3viYVaviuHiDvqGBkA82MDFYRAI8BfQA=;
 b=WbrMWRmJ4C34a/7rV3Pe0J9i6P4f1fxaTMXTUvLHJrm6P0bdQktxIU3lRfYVPA7/XTjw7o1qgU/4LbMp9RK1I6fXEJJ11eSVilTXrwUfEHQJVLZwnF3RCoFZqTLMiqWaEGGtwZe6XlGnNMAzfWc5BZVC8aXZ+VUOkir+ebxNuqGErk9TJG+L3lnSbk4udmk3c/AV70ZJ/ADaaNq53fjF+bLiZsNUoTE81IgN5yPSYG2qPFVA8cSFIlMfNC6jgxvijJ5tQWkcvOhdY7KwcgwfWchvBtWtfpbglXNiv6Sx99PNRfYVHVfEP1JwAfMGs1B4WSpkDJXwYDv62L86qvRUuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6612.namprd11.prod.outlook.com (2603:10b6:510:1cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 14:36:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 14:36:41 +0000
Date: Fri, 13 Sep 2024 09:36:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Don't try to derive GT clock freq from
 display register on Xe2
Message-ID: <3jhnfvyy23dt6tulqwyqfe7y67wbgecxrsitr2nlfawqknlfcm@ow36lvsdnwm4>
References: <20240912215559.4070443-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240912215559.4070443-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: 93644bdc-49d8-48e9-f231-08dcd4017bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?No5mwmlTXyvPqW2zGJ8n+0Np9Q8QPTmU4izYkzUvUKtS9CoogWaEnVew6dEi?=
 =?us-ascii?Q?K5M67MsHaqXXy4r9mwiqe0owpyJ1TxD6fvQxy54cptHWqQNkkZ0XPtzs3WsU?=
 =?us-ascii?Q?IcyNx315ZFbIxAm9Q8eO/pyPjAZfoQHcIfJcqR0lzVlSCz3d+s3DDZMjH3RJ?=
 =?us-ascii?Q?6OXo5TvDHguksPVVz5vEZZ6v9spJIRxfUmreMZJ9IG6RgTx15YIIOP6Wte3n?=
 =?us-ascii?Q?EKthPtbavv3DbrDzeJ68tHB8NUS+dRHjGiSNSmgFvuGc0B45X9iRuMHx6bly?=
 =?us-ascii?Q?mKvZ9M7jnsbPxSpdnq1EZecWJ6QAR9oVt9B9PTU7c5BFgAN1IeKHyaLKsJrt?=
 =?us-ascii?Q?CnXEJsiVMkP/BHwdDLfqrwwNdNAQUaQ5duZBUdjzUMPpBN+oPTQbjhtSP58J?=
 =?us-ascii?Q?mU3x/m/kn5KSWwWAs17+P60E0ZhpzeBpz5q++ScqIpTot6M0iF6qLBtgyjnA?=
 =?us-ascii?Q?pbZPnvXrszG+bETR+X1rEexr8FETDj4iHthI027qv+2QlNaCa56Dbfg5qaTN?=
 =?us-ascii?Q?mApLs7WX+OuG4g2o2UFPkTzuzjPj84eQ8R9EhTaXaNRsfWyTngE8Vst7cbrh?=
 =?us-ascii?Q?5sFOKipYSva5FFuGOzKdqLTrDIJxbyUJ2zEG1wStP1a87izNLhNCWWL+eIsu?=
 =?us-ascii?Q?hm3SdxwGFaFtUHdevcciKFYWuwZRg3wLNWuwgVtfVHq3bpd626feA7jAFkfS?=
 =?us-ascii?Q?fRak4V9Zt6gVJG3c1VxreNb3cUyx8x2LMXycUo8imX32AFLvW050Tr3Jp1/K?=
 =?us-ascii?Q?iPG/HCAf+JZJKlv68z5FUifqafC8OiObWbpKT1ikkFMwmjs2qQsFRJC3VoE+?=
 =?us-ascii?Q?XC025ic2/q+m7IOlaBEIojUx543mBk0bSreJF5jZyFzqIkZolYKdhVQebWym?=
 =?us-ascii?Q?ORWqOJbYFEP+01xM5ZTgGFWuBP6T0zVpuUAWiMsOvhm0It5lUoINhZANrCgn?=
 =?us-ascii?Q?ULnW/+5EibJ6SaRbR6PRht6eis7wgvr1FJfkqwZ/oDIcTcf68DTq9NxLejxy?=
 =?us-ascii?Q?OBg1Da0PKYUswkEOg5NHYUTENaA8VZgwGT1ruizVos0dYBAdXYVI3Zmkl5zD?=
 =?us-ascii?Q?NVLrsCwwP/B38VFameITHM0Yd2BZLZqcVO/M1QlomitQTPkiXkmd0vyNHKwH?=
 =?us-ascii?Q?sZ0OwTV0LTp1ocETozkNOg57w0uwDK0sS4KK1raZumr4zU237RymW0saFM0O?=
 =?us-ascii?Q?BSzG/iTney1VPGc6akiNnvbu/Wuwpj76BUwiGNttSH73i2Sn69hSBuGk50QV?=
 =?us-ascii?Q?roJ93KTY6ea0XBe8m+C1mnq+FgWp8ICtIkUFOyR8bJsmisupsZ5mCAe5o8LY?=
 =?us-ascii?Q?vEzmBkSkTg9h33EATq4OoJHyxM0ylY0S05cSRdDELST4pg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZXDwVLDfI+WeCoCocSEb6FV5H8eCbzWDa7obni5kr3G3+tjHNdSPJc7/jl22?=
 =?us-ascii?Q?Q7JMzEBY3ZNisfOkvQ2XE2WbWyaJ8giLA6YszPZYx4eytsnsBELhKhxRM9IS?=
 =?us-ascii?Q?eEP3bk7d/2MtJeT2eYmwzKT9fLcEc+LD1mBZEIf8s0bU0VoIzgb+4tssIHLN?=
 =?us-ascii?Q?XNWQo/+Y6D6ki0u8xVhJY7vmkEZci6bopwmXCC+jft8jv3aRKnALdvQ9g3X/?=
 =?us-ascii?Q?oVVrtGUVGTCp3O/fOeao82NJ/2NXsm5pBbHb0ieNetwfTg71Q4/ITYth2d3z?=
 =?us-ascii?Q?GszojZ5LAtPHFCfLtxPzW0MWkKfMCzmPP/e8CTwtLqBSKIoOJWzLK0CTPSKx?=
 =?us-ascii?Q?2mISDhP1AwN82G7QjpK9YYxui9J886kcC8EPdLAgAlGvFEVkAD7QyREKAtMH?=
 =?us-ascii?Q?7n2M4dauGK3Qe4sIny5S1G72n1nrXi79A7Y/JFdDITb2D7QzleNmfUjH47v/?=
 =?us-ascii?Q?WRFDmV2P0FtEbF2Sp+0FoclJnhwuVhMvcB1PjRHTW2Fo1jLxTwjKsfrSKVWV?=
 =?us-ascii?Q?dU5m6iZfolIcC1XrHIA0tsQwOK1C/hxzXjwEivqodjxXM4nRMEDhtz6xkh0c?=
 =?us-ascii?Q?Yeq7J0wawmjgPUFaRpIthn5R6jJc6SQig97ba1WCLsJ2CpRRimooMydeThPb?=
 =?us-ascii?Q?2mupCrn5xJ/BW51JoIrFbmBoR/gxfLHSK7wYPDXkqKRiqb7DW/NP3G/A3M3b?=
 =?us-ascii?Q?WWDjSbsWcopLJmXWmVkc6wbO2b2RHtmpaQxTSHogHwlYUfJCfB1NNTP71pPU?=
 =?us-ascii?Q?8DV9axXiE05fdbL676GAsfwzliTq75BEfzK3yNtQFQrFQe6pBTYiGTYv+PJl?=
 =?us-ascii?Q?Ppu7B2nPXZ7Ud/WD8F599nKLHKb3tzKWUqNB6gTR8LZQUf1EB74Qu313K9wa?=
 =?us-ascii?Q?w0LjQ3OT/jzxbaAImBzebRJUJgjTtbfnw49+7dmDgMdOhDh5hN3hSAD242BE?=
 =?us-ascii?Q?SFfo+YbNmcmRl5emwKy6wUz9mVDTGEYTRq4DCICQhoJtfz6s832siVUaT0Xk?=
 =?us-ascii?Q?cJNWNK9At5r7/c/SK0wGmTWdHCMYdyVpMhJUevmvVjPkT0qV+B17XSIt2b4J?=
 =?us-ascii?Q?qMVjAlFMLj/zGlhbnB54TjDdlei4U6Dl5pq/cEJ4FspgDC8y/09xE7aU9y2E?=
 =?us-ascii?Q?T9cSRCUHjeFwFChfdeFoE9Ell+mBYTsb3Wexq2wwqpEZzqnB161kU1kxUnEo?=
 =?us-ascii?Q?Ed0d+zUvEmmlBoPm1qXc/zwE3yI0OAXJemML4izogY4RebQtuKaVgrbgwVpi?=
 =?us-ascii?Q?e7WptTUUFb2Vk4u4HIlsAUemJIrc2uamcEkVYYE9HTZV6X92DJ1hZHFc7VG3?=
 =?us-ascii?Q?nLaqOIqY+w9XF8lOv2p7plxgf9Fwx4ZMhEH8K1JLSCP6bn8H+ipui0LkBseR?=
 =?us-ascii?Q?vB6C7cB4iYWlYgN3D/MEw1YdEaKFdaWueLngDl8GOxcVaGdXOI+AWlb+DR6T?=
 =?us-ascii?Q?RC9QPAMrtsLPSPYcv/hp5g1nGi+FLymLuuPgSF2Bz9vT+JVFJ1kCn/QjItYI?=
 =?us-ascii?Q?vxjFvCOYy1XJI8l3pmsjg65RRPEuxQj+g36tD75gq+8/oIibSCiYKGNz9dHs?=
 =?us-ascii?Q?+61ob5pffl/Hf4lZx03wov3JJSGomteXFDn+3jFCJGR7pH92rTGMpC/GUyWR?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93644bdc-49d8-48e9-f231-08dcd4017bbd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 14:36:41.8371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztZMzr7GWhn2VYR6FrXDEvGlAl5WhDkcUCkTa42qBYtI+1stcQc1riOoCrocV49itGypPSWgpLeYIM6e+DbQ8kgarkTkypbQT8Yv2jGWZxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6612
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

On Thu, Sep 12, 2024 at 02:56:00PM GMT, Matt Roper wrote:
>Driver initialization has two approaches for calculating the GT clock --
>it either derives it from the crystal clock frequency as read from a GT
>register, or it derives it from the display's TIMESTAMP_OVERRIDE
>register.  The driver is informed of which approach needs to be used by
>a bit setting in the CTC_MODE register.
>
>Use of a display register to initialize the GT frequency seems a bit
>suspicious and doesn't seem to really be documented clearly in the
>bspec.  However there is a note on the CTC_MODE register indicating that
>the setting that corresponds to use of the display register (which the
>bspec simply describes as "Broadwell Divide logic") is no longer
>supported on Xe2 and beyond.  Furthermore, the TIMESTAMP_OVERRIDE
>register itself was removed in display version 20.  Rework the GT clock
>init function to only consider CTC_MODE (and then possibly use display's
>TIMESTAMP_OVERRIDE) on pre-Xe2 platforms.

good catch

>
>Bspec: 62395
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_clock.c | 30 +++++++++++++++---------------
> 1 file changed, 15 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
>index cc2ae159298e..9afa5415d627 100644
>--- a/drivers/gpu/drm/xe/xe_gt_clock.c
>+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
>@@ -57,27 +57,27 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>
> int xe_gt_clock_init(struct xe_gt *gt)
> {
>-	u32 ctc_reg = xe_mmio_read32(&gt->mmio, CTC_MODE);
>-	u32 freq = 0;
>+	u32 c0, freq = 0;
>
> 	/* Assuming gen11+ so assert this assumption is correct */
> 	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>
>-	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
>-		freq = read_reference_ts_freq(gt);
>-	} else {
>-		u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>-
>-		freq = get_crystal_clock_freq(c0);
>-
>-		/*
>-		 * Now figure out how the command stream's timestamp
>-		 * register increments from this frequency (it might
>-		 * increment only every few clock cycle).
>-		 */
>-		freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
>+	if (GRAPHICS_VER(gt_to_xe(gt)) < 20 &&
>+	    xe_mmio_read32(&gt->mmio, CTC_MODE) & CTC_SOURCE_DIVIDE_LOGIC) {
>+		gt->info.reference_clock = read_reference_ts_freq(gt);

should we rename read_reference_ts_freq() to something like
read_display_ref_timestamp_freq()?  Moving it to xe/display would also
be something to consider to avoid future mistakes.

What happens if we don't have display (hopefully CSC_MODE is set
correctly) or display is not initialized (a.k.a. probe_display=0)?
Maybe add a xe_assert() in that function as well that we should only be
using that when we have display.

Lucas De Marchi

>+		return 0;
> 	}
>
>+	c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>+	freq = get_crystal_clock_freq(c0);
>+
>+	/*
>+	 * Now figure out how the command stream's timestamp
>+	 * register increments from this frequency (it might
>+	 * increment only every few clock cycle).
>+	 */
>+	freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
>+
> 	gt->info.reference_clock = freq;
> 	return 0;
> }
>-- 
>2.45.2
>
