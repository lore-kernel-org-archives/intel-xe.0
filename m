Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F305FC64ED8
	for <intel-xe@archiver.kernel.org>; Mon, 27 Feb 2023 15:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B769410E055;
	Mon, 27 Feb 2023 15:53:17 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEAC10E055
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Feb 2023 15:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677513195; x=1709049195;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7D6t1Q9tizIErEvcMnTHBPtGZugP9kkoBvaExF87B2Y=;
 b=jjdO4imvHBBEyxh5ndc2pXDE6bitniz7kzSMGEl8w1KAAulDnBeU+f33
 yllN4MzxDuonV95QimI4E7WBciPqQ/pkhTaYY2bAIYoPZNKYDZO/TrUGO
 JOLxYnZ+sWRSIM/YlgXvw4oKe/Z24zcSj8mBH9G6hlehx4A3PID+P81x6
 TaXC1i98Ln6CvBv+YLfAyW+N8JT5mhRVnStTKuS5OyGZtbhf7EBrXOTPI
 JVUx/Nh1YYOF97fdqllL3Uu15yLN8PhV1WzaS1BxCcEaCpK1OetAewYTs
 N/iCzTjfxXnEUDHwoczuJS0BU45bYX8Ed+AjIbdDpK8w9VGVyMzPaB5dO A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="420151271"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="420151271"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 07:53:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="1002829922"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="1002829922"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 27 Feb 2023 07:53:13 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 07:53:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 27 Feb 2023 07:53:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 27 Feb 2023 07:53:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEPJZPNFB9SeGWIeHrV5NIZwYN2kbbQZXRAoPSdVvlKdt2wP5BetqBmL8MYJdZIJaDbUhw8nf5qzXLlLwYWS5QcBEg75P6MQEpxIBD9M/8DBfFLIlYba5AHmkRgkroaKAkI+Sx+JCrT2gu5z65HCfwmIbaCrwWBk0GYhRfyQqX99Ye84vMm5d/ZBxYW4ZU1CtpM/P9IqBDM8Molnrem9xLYOJjkWbvScin+5EfvtVE8PMPVZdQg1NlS/MUHGu0BKZqHiIM+Oix2WYcP190CGzITKts6bPOIBpIYHXSu8VSbteu40xi/CPaOyI7KYm8ZFqHpCZ14pB7D3SfH54aw9wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4ul5lLDGaCg2O4Kp9KgdC5YAD2wB8KoYdOJ8VnQ3zo=;
 b=WKmhrGZHhOCkawDjqGmmoagV9r3LE6VRqRXsdc6JDI0rsLH/Eoz/saMWmrCbo36Es5D93c5OyNySxxZVkvSVT8N39yWPWXueQ6C6+nCB+MmqHIRuLZl633dSksbYs90w7Ale6EeYfqqTV3EgR6sdlM2DIlSw0ZzJN6ZYpd51yjGu8Ku4VkWqoiXevRSsCDXaMlNtQYNipqnjmpqnTglBKduINpuWumyyZqmW+oRLR8DC1pteAAH/CU1BaCJeABt+hJk+ka2pnX5obMggs04ekejbcJPt6bfRDql2yY5G3YOLo98kgogWJrIi7cOQaUy7ooANE+a1Xl8RNU73FWNgXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB4959.namprd11.prod.outlook.com (2603:10b6:a03:2de::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.29; Mon, 27 Feb 2023 15:53:10 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6134.025; Mon, 27 Feb 2023
 15:53:10 +0000
Date: Mon, 27 Feb 2023 07:53:06 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/zR4l5+tqnMkwG1@mdroper-desk1.amr.corp.intel.com>
References: <20230225201039.2232172-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230225201039.2232172-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0189.namprd04.prod.outlook.com
 (2603:10b6:303:86::14) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c443ea-a539-4475-15f1-08db18dab9c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /f5c3rRaPAFQ7UI5uHAKTCv/sHID4VnQg9YekoqUMp+XYBuzXhiOO/RGrDPXVvqJBw5goW7cqLtanKMwuSWprmyfLVwkzaUcI5C4LgPr9vNQdWgzsIUc+q2ktSyWJxTvTkj8yCBK3rqdEgBVsUDovBURoKp2WtGsbNl/WEk1CotcvvWQkSx5Y3nhp8Y7W2AFmkcT2wwJSn/YiEcz1V45R+ASSRtOdT5mfC6DX7HbqQFKZZV0TkUxgfLwDbhFyUE8y7Pqihf5UuY5mzSAy5rdbdmY9Ij3gZrKNXKS0PceOtHAZUoZLU7J44orx1B2d87NfsQwywi1nrNLZ+pm5VaaZ4+Y+ygFoCpCoifbLT3Oply2YvYk5pSZZdNm2IDKUwKmd+4Wz2v2xLeB88YBb89SXdoTLkwH6rGjhzk//OexD0r3XpHRenu9LZ6dGbjUtIH1WcAo7I2OHbezbEpHKgwoaec0zf8up5zCU7d0aPqXgUnDp0CWiliQDSfnQmMwSfXENKhNsiYgUdD3CHc8880SixRSQUlztBTCNp2XaOje8ByKtYrEAthXL3iZSZwlt9Q+Ytf8ryTS8Hkv8V164l7EBMYE+W1gs2cwBVbb7I54AN2whbwlZHnuYX9WNCtBYJ4Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199018)(316002)(6486002)(966005)(86362001)(6636002)(186003)(5660300002)(30864003)(66946007)(4326008)(8936002)(6862004)(41300700001)(2906002)(66556008)(8676002)(6506007)(478600001)(6666004)(26005)(6512007)(66476007)(38100700002)(82960400001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5WQv0rMUKBO9fY2sHAe7t1m7T1UuL2YIWP7hGmvoEDCQ1gJex5MkcTqZZE?=
 =?iso-8859-1?Q?7K6v8Q9+l22qhesmMXEXByAm9uRhBNs00uxMb7uKWjn+uml+19MFg5Zl5D?=
 =?iso-8859-1?Q?Y18uk97W5xPwqQ4LntgvuL/xzM/NapvVOBhgtJEwQu80xvBLO3kJcks9Bd?=
 =?iso-8859-1?Q?ZbGRKO5wQLnCba5PwsozSyc8HiuLiEK92FZtC0SgmfRznRpAQWRez1A9bz?=
 =?iso-8859-1?Q?8QQQkZN0s0pcE0CLvzg+TF6ysuvcI784xVxme71cuUTtjJfgXudK8rK2xh?=
 =?iso-8859-1?Q?GA+9Aw66cFxd1Man0TvlLch1utf2bwCyytV5PWEImK+HjZ97ir5q1INPBd?=
 =?iso-8859-1?Q?b56gu09mopPegdDLYULllBvvXn5HQlzNN1fAMsc1FU20Tc8lRYwNGL+5we?=
 =?iso-8859-1?Q?4OyYqOTQ3ElSNVAg0awa0jbPVp6s7mYf81c0Z9oyF+pziZQSyxmq/Nuaci?=
 =?iso-8859-1?Q?+B2/y3Pmy8TSNToWYDLSvv3gj0dlfBrOdXyJVx5uj8fOZtJZ13vamp54gp?=
 =?iso-8859-1?Q?th4Rhu/ce+47tFOMy6WU0aixHf1uouM1jGeK32naBMVZLvmACdyRT6wrjp?=
 =?iso-8859-1?Q?RSnI2YpGTdjKcX20Snl5+WGQdZcCRch/nBtsETDofqTzpoMxHvsb2Kq2sf?=
 =?iso-8859-1?Q?jjqkaLoRTW43vGyMkICiyrLNHRw++mnUuvyA0b8jVci53H/3jz8I9jlNpp?=
 =?iso-8859-1?Q?oyqOcbyDbp2zCTXQpdD7l72h7DyN0oDq0mRggK+xO4AlAW3gs107C/YFb9?=
 =?iso-8859-1?Q?RnFjm17i/mSk39vF1Kd39XX50C3QoQI+eO613vT+DwQXFc81WzlQFnxhXp?=
 =?iso-8859-1?Q?tcujOqccmCmIaLqnboao2T8d8JUEcsKntdFR2V424cQUjOr56CWeDvxYWF?=
 =?iso-8859-1?Q?1qpgLnoYT6JRu78EY7gtdlMW9b8+YriYOos2zmzytiRw0OxBhjR/h7DtM2?=
 =?iso-8859-1?Q?O94heHYHshVeTgor89uLB7IcipZlRVxNuYpnS/hEqk+NSA8N2XmDRX0d2D?=
 =?iso-8859-1?Q?FfLgjYoz2qgKhk7e894fmWakEtEeWkX37BgSRZbSABghEwe2xevfcH1EIZ?=
 =?iso-8859-1?Q?wOePQnaB0gXrvM7eqOHxMwfpdgMAZFQMgpomdvaPPlKbTgmS9RcMouk1Lt?=
 =?iso-8859-1?Q?kneayS9xFNF6LhaqjxcCkx99RngDaovjvdhdBjPIRVP6Spo2JkML+Rbb/M?=
 =?iso-8859-1?Q?f35122MBF2MJIt9qkz9iK5v+fUfHEhYL6gF+xcI/Yo6c/gtVjS4Q5OPsBi?=
 =?iso-8859-1?Q?7F1iGlYx1N5RSv7jnyeFLJVMBMGN7wB7qN/d60Jahne1EiHsHgyyucH3ZV?=
 =?iso-8859-1?Q?9hy8rpw4CsxhfFrkh/t2NOmoeaOwmpX26cnzXyzgR7x4MffpzhxmeD7ULw?=
 =?iso-8859-1?Q?7fYcs6ZWbAjwaloELRvGb6xiEu4INBgDpjytkKIRTQvLaV4CUyauQKI83R?=
 =?iso-8859-1?Q?t3XZ/bpuD9CDyD3dXfVfWUZNszrycEiVP1exgOagO3wDtrIEc+ae4S6X6v?=
 =?iso-8859-1?Q?BZ4AH6JzqUJf2lDNW1/yhdtWJjkjBSnfNnuyQ5U9cBk6SzpOwTKv1CwNub?=
 =?iso-8859-1?Q?Y5KnDdS2TS71oyAM4lRlcsCDLSLB/LK1JblPlHqEapUXhxeNDMd53+lNTr?=
 =?iso-8859-1?Q?pTXW5rWt43uZV38c4ofQGfqvAKUK5xeYP++VE/IN2ZaJGjrpurIrZfbA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c443ea-a539-4475-15f1-08db18dab9c0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 15:53:10.3242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GV8HgTwnQKKOxp4YZBuL6W7MZa8Xvuo+ecqgo5OvJXKxyhtskhgz+bOSDSxQrhNU9k5v0CnlHrRh5WEoU4lDcpJ/8/FeMN/tRf6s4oLKQ0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4959
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Do not spread i915_reg_defs.h include
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Feb 25, 2023 at 12:10:39PM -0800, Lucas De Marchi wrote:
> Reduce the use of i915_reg_defs.h so it can be encapsulated in a single
> place.
> 
> 1) If it was being included by mistake, remove
> 2) If it was included for FIELD_GET()/FIELD_PREP()/GENMASK() and the
>    like, just include <linux/bitfield.h>
> 3) If it was included to be able to define additional registers, move
>    the registers to the relavant headers (regs/xe_regs.h or
>    regs/xe_gt_regs.h)
> 
> v2:
>   - Squash commit fixing i915_reg_defs.h include and with the one
>     introducing regs/xe_reg_defs.h
>   - Remove more cases of i915_reg_defs.h being used when all it was
>     needed was linux/bitfield.h  (Matt Roper)
>   - Move some  registers to the corresponding regs/*.h file (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> 
> This is the leftover change from
> https://lore.kernel.org/intel-xe/20230225001548.1743820-1-lucas.demarchi@intel.com
> The resst has been applied.
> 
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 +-
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  8 +++++++-
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h    | 11 +++++++++++
>  drivers/gpu/drm/xe/regs/xe_regs.h        |  4 +++-
>  drivers/gpu/drm/xe/xe_device.c           |  3 +--
>  drivers/gpu/drm/xe/xe_gt_mcr.h           |  2 +-
>  drivers/gpu/drm/xe/xe_gt_pagefault.c     |  1 +
>  drivers/gpu/drm/xe/xe_gt_topology.c      | 15 +++++----------
>  drivers/gpu/drm/xe/xe_guc.c              |  8 --------
>  drivers/gpu/drm/xe/xe_guc_reg.h          |  6 +++++-
>  drivers/gpu/drm/xe/xe_migrate.c          |  1 +
>  drivers/gpu/drm/xe/xe_pcode_api.h        |  2 ++
>  drivers/gpu/drm/xe/xe_reg_sr_types.h     |  2 --
>  drivers/gpu/drm/xe/xe_rtp.h              |  2 --
>  drivers/gpu/drm/xe/xe_rtp_types.h        |  2 --
>  drivers/gpu/drm/xe/xe_step.c             |  2 ++
>  16 files changed, 40 insertions(+), 31 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_reg_defs.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 6dfa3cf2fd43..2aa67d001c34 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -8,7 +8,7 @@
>  
>  #include <asm/page.h>
>  
> -#include "i915_reg_defs.h"
> +#include "regs/xe_reg_defs.h"
>  
>  #define RING_TAIL(base)				_MMIO((base) + 0x30)
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 9290505d6596..4d0f09cd447c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -6,7 +6,7 @@
>  #ifndef _XE_GT_REGS_H_
>  #define _XE_GT_REGS_H_
>  
> -#include "i915_reg_defs.h"
> +#include "regs/xe_reg_defs.h"
>  
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0				_MMIO(0xd00)
> @@ -108,6 +108,12 @@
>  #define   GEN11_GT_VEBOX_DISABLE_SHIFT		16
>  #define   GEN11_GT_VEBOX_DISABLE_MASK		(0x0f << GEN11_GT_VEBOX_DISABLE_SHIFT)
>  
> +#define XELP_EU_ENABLE				_MMIO(0x9134)	/* "_DISABLE" on Xe_LP */
> +#define   XELP_EU_MASK				REG_GENMASK(7, 0)
> +#define XELP_GT_GEOMETRY_DSS_ENABLE		_MMIO(0x913c)
> +#define XEHP_GT_COMPUTE_DSS_ENABLE		_MMIO(0x9144)
> +#define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		_MMIO(0x9148)
> +
>  #define GEN6_GDRST				_MMIO(0x941c)
>  #define   GEN11_GRDOM_GUC			REG_BIT(3)
>  #define   GEN6_GRDOM_FULL			(1 << 0)
> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> new file mode 100644
> index 000000000000..5f6735697d9c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_REG_DEFS_H_
> +#define _XE_REG_DEFS_H_
> +
> +#include "../../i915/i915_reg_defs.h"
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index a697162e1a77..2e7fbdedb5eb 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -5,7 +5,7 @@
>  #ifndef _XE_REGS_H_
>  #define _XE_REGS_H_
>  
> -#include "i915_reg_defs.h"
> +#include "regs/xe_reg_defs.h"
>  
>  #define GU_CNTL					_MMIO(0x101010)
>  #define   LMEM_INIT				REG_BIT(7)
> @@ -70,6 +70,8 @@
>  #define PIPE_DSI0_OFFSET			0x7b000
>  #define PIPE_DSI1_OFFSET			0x7b800
>  
> +#define SOFTWARE_FLAGS_SPR33			_MMIO(0x4f084)
> +
>  #define GEN8_PCU_ISR				_MMIO(0x444e0)
>  #define GEN8_PCU_IMR				_MMIO(0x444e4)
>  #define GEN8_PCU_IIR				_MMIO(0x444e8)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 45e3c740fda2..4eb6786b11f0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/xe_drm.h>
>  
> +#include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_debugfs.h"
>  #include "xe_display.h"
> @@ -405,8 +406,6 @@ static void device_kill_persitent_engines(struct xe_device *xe,
>  	mutex_unlock(&xe->persitent_engines.lock);
>  }
>  
> -#define SOFTWARE_FLAGS_SPR33         _MMIO(0x4F084)
> -
>  void xe_device_wmb(struct xe_device *xe)
>  {
>  	struct xe_gt *gt = xe_device_get_gt(xe, 0);
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index c31987d2177c..2a6cd38c8cb7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -6,7 +6,7 @@
>  #ifndef _XE_GT_MCR_H_
>  #define _XE_GT_MCR_H_
>  
> -#include "i915_reg_defs.h"
> +#include "regs/xe_reg_defs.h"
>  
>  struct drm_printer;
>  struct xe_gt;
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 0e7047b89a83..1677640e1075 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_gt_pagefault.h"
>  
> +#include <linux/bitfield.h>
>  #include <linux/circ_buf.h>
>  
>  #include <drm/drm_managed.h>
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index c76aaea1887c..2123f84be336 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -7,18 +7,13 @@
>  
>  #include <linux/bitmap.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  
>  #define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>  
> -#define XELP_EU_ENABLE				0x9134	/* "_DISABLE" on Xe_LP */
> -#define   XELP_EU_MASK				REG_GENMASK(7, 0)
> -#define XELP_GT_GEOMETRY_DSS_ENABLE		0x913c
> -#define XEHP_GT_COMPUTE_DSS_ENABLE		0x9144
> -#define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		0x9148
> -
>  static void
>  load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>  {
> @@ -41,7 +36,7 @@ static void
>  load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	u32 reg = xe_mmio_read32(gt, XELP_EU_ENABLE);
> +	u32 reg = xe_mmio_read32(gt, XELP_EU_ENABLE.reg);
>  	u32 val = 0;
>  	int i;
>  
> @@ -86,10 +81,10 @@ xe_gt_topology_init(struct xe_gt *gt)
>  	}
>  
>  	load_dss_mask(gt, gt->fuse_topo.g_dss_mask, num_geometry_regs,
> -		      XELP_GT_GEOMETRY_DSS_ENABLE);
> +		      XELP_GT_GEOMETRY_DSS_ENABLE.reg);
>  	load_dss_mask(gt, gt->fuse_topo.c_dss_mask, num_compute_regs,
> -		      XEHP_GT_COMPUTE_DSS_ENABLE,
> -		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT);
> +		      XEHP_GT_COMPUTE_DSS_ENABLE.reg,
> +		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT.reg);
>  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
>  
>  	xe_gt_topology_dump(gt, &p);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 661effa9830f..58b9841616e4 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -22,14 +22,6 @@
>  #include "xe_uc_fw.h"
>  #include "xe_wopcm.h"
>  
> -#include "i915_reg_defs.h"
> -
> -/* TODO: move to common file */
> -#define GUC_PVC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
> -#define PVC_MOCS_UC_INDEX		1
> -#define PVC_GUC_MOCS_INDEX(index)	REG_FIELD_PREP(GUC_PVC_MOCS_INDEX_MASK,\
> -						       index)
> -
>  static struct xe_gt *
>  guc_to_gt(struct xe_guc *guc)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_reg.h b/drivers/gpu/drm/xe/xe_guc_reg.h
> index 513a7e0c8a5a..efd60c186bbc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_reg.h
> +++ b/drivers/gpu/drm/xe/xe_guc_reg.h
> @@ -9,7 +9,7 @@
>  #include <linux/compiler.h>
>  #include <linux/types.h>
>  
> -#include "i915_reg_defs.h"
> +#include "regs/xe_reg_defs.h"
>  
>  /* Definitions of GuC H/W registers, bits, etc */
>  
> @@ -93,6 +93,10 @@
>  #define   GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA	(1<<10)
>  #define   GUC_ENABLE_MIA_CLOCK_GATING		(1<<15)
>  #define   GUC_GEN10_SHIM_WC_ENABLE		(1<<21)
> +#define   PVC_GUC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
> +#define   PVC_MOCS_UC_INDEX			1
> +#define   PVC_GUC_MOCS_INDEX(index)		REG_FIELD_PREP(PVC_GUC_MOCS_INDEX_MASK,\
> +							       index)
>  
>  #define GUC_SEND_INTERRUPT		_MMIO(0xc4c8)
>  #define   GUC_SEND_TRIGGER		  (1<<0)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 6c0033cb238f..bc69ec17d5ad 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_migrate.h"
>  
> +#include <linux/bitfield.h>
>  #include <linux/sizes.h>
>  
>  #include <drm/drm_managed.h>
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 0762c8a912c7..4e689cd4b23b 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -5,6 +5,8 @@
>  
>  /* Internal to xe_pcode */
>  
> +#include "regs/xe_reg_defs.h"
> +
>  #define PCODE_MAILBOX			_MMIO(0x138124)
>  #define   PCODE_READY			REG_BIT(31)
>  #define   PCODE_MB_PARAM2		REG_GENMASK(23, 16)
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> index b234a8673e54..0e6d542ff1b4 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> @@ -9,8 +9,6 @@
>  #include <linux/types.h>
>  #include <linux/xarray.h>
>  
> -#include "i915_reg_defs.h"
> -
>  struct xe_reg_sr_entry {
>  	u32		clr_bits;
>  	u32		set_bits;
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index d6ba0b7e5042..bd44fd8bbe05 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -11,8 +11,6 @@
>  
>  #include "xe_rtp_types.h"
>  
> -#include "i915_reg_defs.h"
> -
>  /*
>   * Register table poke infrastructure
>   */
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index fac0bd6d5b1e..e87f1b280d96 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -8,8 +8,6 @@
>  
>  #include <linux/types.h>
>  
> -#include "i915_reg_defs.h"
> -
>  struct xe_hw_engine;
>  struct xe_gt;
>  
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index ca77d0971529..14f482f29ae4 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -5,6 +5,8 @@
>  
>  #include "xe_step.h"
>  
> +#include <linux/bitfield.h>
> +
>  #include "xe_device.h"
>  #include "xe_platform_types.h"
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
