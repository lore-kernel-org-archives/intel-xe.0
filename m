Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F965E77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 20:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095A610E928;
	Wed,  8 Jan 2025 20:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sx4G/tqh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3F510E928
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 20:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736367082; x=1767903082;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uIpiVJB3yoQLPmqeowZFB7D9kVmEOSGUJEuZisV/tQs=;
 b=Sx4G/tqhzAmgKwdOGRyBR1ZvxP1wa59lXRpKGBDSdfQTfB7NMwxD61cl
 owSCq4Q9J088QmnUCE+LaP6bW59VObJjqtjEXLPdSEQia96t63sWpQ4hJ
 gfINAGUdhW+S7SMLTy6F9pFmEgGlJEXZYWXxruTxlLVEDfWU+argCrhk3
 N/bMXeZT1To8H0rB6mhfjPxObT5kGVEj6RchZcz3JF9cjVhdNOdZjC5WP
 dVPRWYyTPFgyeMj5OFNPqa2lvNk7DmfOAtt8RvURpS5px8eRJm9gc9f3M
 tenpShQyr32oBwcpVEJTp5epah1OAmHf4uw3XZ95OoEz7bDD2DY28WAJ8 Q==;
X-CSE-ConnectionGUID: NW8yvCfpQbmyaUzahc5PCg==
X-CSE-MsgGUID: LSngYQBgSe2+KTAnTzNbag==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36492704"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="36492704"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 12:11:22 -0800
X-CSE-ConnectionGUID: 60MzvH4NSYKCzBTwRPp4jw==
X-CSE-MsgGUID: 63GUrIDERBiurS7xK0TthA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107235884"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2025 12:11:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 12:11:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 12:11:20 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 12:11:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mz+TgTugTYspctV+0Iatn7CweXpfgAQqYGDYJAQs2Eo+Yn4JU3kC8+7osfLOG5A0tLuH+NkPDazxbovjJv8/4GJarcsNEzHhGuultBN2bdQaU4MZFoAbHXnNiH6oF0rKvGCkP/zZZz3ojR17B8buKlzUtinaStojAJzCd+TrUxOqpxAn48WL4OEibY27CapwmI29kPeEK/8wdn1TuaXm4V7ag3PFwYEQ4te9lCzAdrXNsflu6NYMUgCrqhTJw12RcTshStAXeS1Lj1qw3jl3aU4gLl3yEYraTENs/kjgtRXhLmqbW+orgu9WCFXpth+bi+y0AcWj8jnOBi2mwfQLYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84yqSH+XubI2fBjoqBJjqwgwHB+n9HWjSlT0pKnsKHQ=;
 b=Ma7E+UevL3/Ep7pjGGJIV5R5cszOEaJSeccOEXSd5B8Grc1ynuI43nrA7DAKUfa5hJkLHB6sUNxilz8wtKQpMIcN6+IBmKeny9oMs8z01kU2lB/8CndhSp3LSqzHPork326abQPmMBk2QXuUuiwm/PwtFnQSo0LJoxgRFa566bTyMMAmbJjTYv1FlOvh7o/e/IvUmX4V7byeCEAGxPSzXJxv6IW1bdnO8xXFF/sc0U2AOb6pvPNKgA12rTbvHawei8ukAFj7Pjcis8pKSsd3xSdpAthoQkfaVq25dSUS4AYpWm7K9bIrY8+TZjTBRYSaY2/07RSkJwZxrSPGk3sUuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6474.namprd11.prod.outlook.com (2603:10b6:510:1f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 20:11:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 20:11:14 +0000
Date: Wed, 8 Jan 2025 12:11:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v2] drm/xe/ptl: Apply Wa_14023061436
Message-ID: <20250108201111.GE3224633@mdroper-desk1.amr.corp.intel.com>
References: <20250108141323.311601-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250108141323.311601-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR06CA0002.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fefe69b-ee4f-4e6b-5a34-08dd30209a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?slhnXr++FDTfV/wyUpSvZBkZEzhBL1WU1i70TtvSlR0LMpl4HAbKxN3SZas6?=
 =?us-ascii?Q?T+kdv/ctWgkyT8e3pMCaSV99UaYlakDwQFb1wWc7xX3EJmGKG9rxk8PoJMMq?=
 =?us-ascii?Q?DEkbt8ThI7tHDF76jKKW9M3oWTgsFbI5CfbTstxAmLN4rAHlJ7zwcZgz9W9W?=
 =?us-ascii?Q?CoKk7VFn/L+F5pofQ5A8VdIquSQG+UbSmWETx/gi5Pca0SDNEXy9vMf3rAa5?=
 =?us-ascii?Q?UxvEJELuTq72f+qHK5W8brRxuknAufJG2jQg6gGjv2Txgrp0WkvNTcwhvqM3?=
 =?us-ascii?Q?oHfD5d6eh7jAmER5+RsVCjhcj/kjcJ2k7pYc1xk9TnYbIePOwsaRkJWBp++q?=
 =?us-ascii?Q?IdNeWJYZhvxyJHlBqw+M/ezz/lXrTOYPiEazAK9OYwcPh8FwKRW2x7qlesM7?=
 =?us-ascii?Q?OYRIYD1Duv7uitJmNJjsyGl5S6F6zim4cuImmfm2I1y6A97vvVMsU3b7lR+4?=
 =?us-ascii?Q?NeSUOVSTRM9GixAaNMyFrtgKzBhspuWVCnogimkcMo0gP2PLue1t9NNPlfbz?=
 =?us-ascii?Q?SC/nbrvmKyXjUdFHFLkvcVdOBbhd5KYyjHOIMApbN68KXR5GmHFD0MCxDFd7?=
 =?us-ascii?Q?C1NdzKxNp5Q7bJ9cCbntjgovjVd6ey/+ICKvhXQAAW5cIKd/PevOP85dnoVP?=
 =?us-ascii?Q?VvIzJmTR+vXb9NBEP4sQVT5Qnl0aievwL8egnLqDAjsIElbN78feeHfj7Fa5?=
 =?us-ascii?Q?v81Do1Vm/dLZTYbvU+l8ZQ/2IeOTnNRiFohVGKZJpFdt6H72kuqyyoKeD86o?=
 =?us-ascii?Q?Rt/uv/Y72P56MOk2fJ/CcC1sYBJGF6WNPULhvoOS8u6vPTQJ+L+TO0laorPV?=
 =?us-ascii?Q?2/sEtG8FSz9EUi/e3aHxV6BL4sn2SbN4IIXttmYzGM9Rl1/EXGLbN2VDvgdn?=
 =?us-ascii?Q?UCofHAfy4ZTVTnghNh2Yq/jvIpffA4P5dpTCrWmWH94JewOlK37aa0OCPYiK?=
 =?us-ascii?Q?vXT+wgXejj3iSu51/UpA033khDB8hLQcAy6Pn0OeDaY+/t0uZZVyTOZvlbqc?=
 =?us-ascii?Q?aWjMgrPy6ShxeP1KrAuXFoA5CY8rKh3C5L41t17objf2pWvatY/L68LN3gFW?=
 =?us-ascii?Q?YGNR6fGpXtppERAzMmRT1unV+8lu2aokdAU0H9xg94XciL0k4sOtEiPIdTjx?=
 =?us-ascii?Q?zM+Lht9oJZEMndxfeV5tAQnDcCVw7OUXCYUqlCx6hKelB4xiAknjpsEWgzkf?=
 =?us-ascii?Q?sCdqBJmITEYjJjB8zVZm6sch7H8WRUd9wiC8Cw+3VFWlC9xn+wPE64QnyBO6?=
 =?us-ascii?Q?Ey1364sl2XgfHFRY3t5+rqTwqUXgcDs2Pa2q8OnlzySajo8ceg68YJS+1VA1?=
 =?us-ascii?Q?hbVmT/t1LuQAX0JEW/qhwACFQEJy5X0CYrVFoaccIv91Unv6l2SugJcvvX/U?=
 =?us-ascii?Q?mvlXXJNjvN6hSkmzGATPXiN1rw0E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OFJmrG3heIyT1EPTWefkISx7sOI1fmcK0gpR0me6XdquEnI8BnJfvmQnvWbC?=
 =?us-ascii?Q?7iEhNJVvcZoG2U3SQPs8x7p6daad/FBUQShLTzUjZvae9xBxIdEauUAb9kOw?=
 =?us-ascii?Q?lqwYeLM/N+htecDP0WdZcXGwIHpjVxWFodFNw968OetEteIer3m3pVDPbHTr?=
 =?us-ascii?Q?YQWk9YdARtZSRHZFoSDbOrU0ahdPZ9l/s/eUYIEheN+q+Q47qx8XhzW5Ihql?=
 =?us-ascii?Q?kCwh/3HtpIEx8MbNr0dAMWOUkP0Lw3OOl7xveOAVTUpp+dXOxPKnKI5Utyy4?=
 =?us-ascii?Q?odllDjU2wNcMGDjkvjjfEhUhiFWg4co+Ci2cVHC2M01VRuX30wRdV4NGAz/T?=
 =?us-ascii?Q?YYpZc1BsF7A+YDs3s2dEANuyTwJwZqcbs7a8kQtRghl/wwjIb2xmCiAgdo82?=
 =?us-ascii?Q?whkUrLzarsUI4zvBIo78iq5kRxqofgBVTnDL1Zohk+sOmgT1RY3KU5zs6ay4?=
 =?us-ascii?Q?SdliPkjbijwiczQWgNPrznCkazY1BKlHYsamRYXvdrZfQCqDMq0UfMvcd/1C?=
 =?us-ascii?Q?OPaSBPsOuTFegOuL8FOE8qHYEGrHzlJozukfMHqwtLVAlej6a7IH8rB/Rxik?=
 =?us-ascii?Q?8s7br66NMR2nP6WrI+XLNJfYkovwtknK1YuE3aUlPzNXU2S3g+g492A50p3x?=
 =?us-ascii?Q?ZaNDvUDAPw/daEerD867w4nAgFGEKwaDd1vIawrNtS8XEVgSs7JhCP2vXG9w?=
 =?us-ascii?Q?yzQLLse3io/Nh5U59lSgIVnNKR31/9nRBBThvWi4n+K0x5Sogz6yh/CBSLmV?=
 =?us-ascii?Q?Uu1ori90mbDbK484hxjq1Li1d3SnlmS+SoR8TbwwfExU5B4c7p2BDzpp1WjK?=
 =?us-ascii?Q?pVY5hV0qonGMnyQAdXtb893KXL95znr9wkB1zm2h9cdPBnfMbU70GwlWvqWG?=
 =?us-ascii?Q?d3ib9mROpleDI6vzgFUhvCVf3Pg6vBquHRVq3LaPDyJ8Ur0hM7dbwok8/MVL?=
 =?us-ascii?Q?5Nsv4rz26+hqPzrl3FFL+5oBLxlZTQbttFeo7Q9o5jbvWIv6YWQSejmpaUcC?=
 =?us-ascii?Q?2SSa2BrLg+GlJrCdAtF+xGYMOIxLg36TMjni1ai/qTxuEHT9wB+XKLTDtg1S?=
 =?us-ascii?Q?HaNo+AS8UqJpeA6biCsBFuvh55Yv056axygPEhZRWDqFZNiFGfPbYeog/Pcy?=
 =?us-ascii?Q?ENoSm8PZwd8hx9BYvZgxsVPrDRH0rmzl4ssSiVtZ9g9m59ZR9yQ/ldHzptJ1?=
 =?us-ascii?Q?JnpUA53ZlotAn3ijQRf6JlK1oN0qUEWuJCoHQM5CdntW6wR54D5EiJYXQxjl?=
 =?us-ascii?Q?fS043RrKV/lv8eNPcEPBXRLwOVPwP+8iIP2lTuTE1QMh7Ajfo52r+FRrJF3P?=
 =?us-ascii?Q?y5r4dPyUu89v3YH9i6SJWYk2QsIfY+BgaWW+RBYWwDUhbOv1ueDa2E28Q+dw?=
 =?us-ascii?Q?DH4X+5aZYe0EcdJMEHR4SFA1sqIyZcuLRLE3kjdMi3FxmWEKLueUC1sdpvDU?=
 =?us-ascii?Q?XsxOUegaD/WkUxSaObtgImEvRPAT+uhtdakSV/nuGtU9LKhfLoX99xAAO/vp?=
 =?us-ascii?Q?AODTuLlqGp/AJ74mscyi9f9Rw4vqCgNr5mJ90ccWqYVAjziKt3UFr46qol04?=
 =?us-ascii?Q?a8VoSOCBJZXcx2FTlLhuHIzWRjpHQzyCK5J4KM+eCNvTqsVkG1JeaomaL2kP?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fefe69b-ee4f-4e6b-5a34-08dd30209a1c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 20:11:14.0383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvp/ZvJntbHPLr3CgWvQNAhG2/gNuRDDdJ3KZ51P7APPgYX3QMh1E+8P1Od4eQyy+IGsfpeovKDA5zMSJscW4VGPX1viCdWXpWiOFTlasO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6474
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

On Wed, Jan 08, 2025 at 03:13:23PM +0100, Nirmoy Das wrote:
> Enable WMTP for the BTD kernel to address Wa14023061436 by setting the
> proper TDL Chicken Bit.
> 
> v2: Apply it on engine_was[] as this register is not part of LRC(Matt)
>     Apply it for first_render_or_compute in case this gets extended to
>     compute only platforms(Matt).
> 
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 162f18e975da..b4283ac030f4 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -500,6 +500,9 @@
>  #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
>  #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
>  
> +#define TDL_CHICKEN				XE_REG_MCR(0xe5f4, XE_REG_OPTION_MASKED)
> +#define   QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE	REG_BIT(12)
> +
>  #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
>  #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
>  #define   WR_REQ_CHAINING_DIS			REG_BIT(26)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 570fe0376402..744dba4fdb58 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -613,6 +613,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(FIELD_SET(SAMPLER_MODE, SMP_WAIT_FETCH_MERGING_COUNTER,
>  				   SMP_FORCE_128B_OVERFETCH))
>  	},
> +	{ XE_RTP_NAME("14023061436"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
> +	},
>  
>  	{}
>  };
> -- 
> 2.46.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
