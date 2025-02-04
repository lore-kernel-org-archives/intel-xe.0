Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218F9C02193
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 23:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E382B10E029;
	Tue,  4 Feb 2025 23:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQ/AThHX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D7C10E029
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 23:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738712110; x=1770248110;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JETnjusTX55LghB70DV3NEOoR3MKV8ZxnWoz12vTFyw=;
 b=RQ/AThHXlaPjsp2w7OVKn+2GtCCjBCRQ9njYE6rVjPz2vAQM6QbL7c3x
 rSZT2hpEQcYizm3D6zoRys79lFjUN9r+WP9gT+CQ2JVAOpcNilOAmG0vW
 U90IIVTRyioHLvQu2ckx/Wa++Gnh4FCJRtVfXOXqBwid0jj2AjVVK4jFk
 DxY2Ui+r/xKlN5+nNpNDnkCdmPe/P+wle47RWsb6QH+Ggk8sXBSCwwWLZ
 h50xLW/qs+gd7djK7dj/uWf8R33lTsE4jwUNEzva8XDAJxS+7MratjV7O
 B40YBbathaisRpQll0ClL1BqaFoeyWjqFTMgJgODI6wf3NLIzIrHP2uic Q==;
X-CSE-ConnectionGUID: xffkzCBkTiygJkkOyZwLuw==
X-CSE-MsgGUID: 02vHb+pfRlSgk3+qM2kkfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49516411"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="49516411"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 15:35:10 -0800
X-CSE-ConnectionGUID: aNm+qXtgR3m0NOJv685wWw==
X-CSE-MsgGUID: 3g36ZDT7SBKMOm+M2mFjOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111609718"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 15:35:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 15:35:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 15:35:09 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 15:35:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqPKMyp9RjgRkwP7yy9qntZemM/D6JlJhDn7pAOth2ByhZsRL+bDKbG93e2bbZXOjwcKYGDfOnvDszE5EVxe9pfPFrsXyqz3Lek5AA/seI4IMtRTzAfh/anrfhxVHe7THA+La3SXGWvmv5QbnaKuMQk5yRNC1BjtKxT5EBRVodgCoiHHIged0dJ5kXqWaS8CZHrosebP9C7cYowk5oAs14JAtd/U5kznnWMynPN0GMExEpfWwVSzhwpgvQGoDQ/ZWQmRrrFfxSejyrnKqC3BMAezuq+q8vNSm8cVIuyKVdmwxEEfEcvzb8jcCK0TMn5TwEwZ33m5BudXYqll7JXXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtOu2iB/6g//GVqnCd0dGopaUPxY6Ci88EjdIThQXZ8=;
 b=vKZnCpdx4hgN6NM9cyySZe9VlqVfD7gZT2LMwqtr1WQKHXgtP+WmzsMGJSRuEeEV//MscuKuzdyXHzPhmz2bRfdG+9E9iPWO1eyJjgU1JUxYYssBAJW4u69BC9BXxx6CbMg2jltRgS5ggjH+jATVw+LEDDYPKMnbD6YTeqaoh98e8GViT7Rx87lnhWVXutEZg8aCAJ7qgYeVfmZpZmKwjJzFj2nLlw1fE1juAWLqPsTPWkjxyjEDHLKSW/x8IWJputrxLoP30G/DjYlAc7oBmv2f3qr5Tdodz7ht3KOIQK3f3btyKSXAUKmnkSlLYy9DFCu/r7+PR/xhgLhPeR3kXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4959.namprd11.prod.outlook.com (2603:10b6:a03:2de::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 23:35:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 23:35:07 +0000
Date: Tue, 4 Feb 2025 17:34:59 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/pmu: Add GT frequency events
Message-ID: <ov7lvbbzsc6nsyobkgt4eimuy4kk22u5pkzzaidohqnxfroam3@vlx3sigss3v3>
References: <20250204180905.1347210-1-vinay.belgaumkar@intel.com>
 <20250204180905.1347210-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250204180905.1347210-3-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR04CA0215.namprd04.prod.outlook.com
 (2603:10b6:303:87::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7939eb-602d-4084-e4ed-08dd45748ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dhdmzsIzJNUgKiUBNIdppxYbBCOI8RKdfrVzBqbsNhbhHfevI+FgOGCuAXa2?=
 =?us-ascii?Q?uDjMMr4p8tSHXmk+jAIBcaK/mJLCWJGTIcwqip6hjsxrVC7qQ4oe8S5/eiLg?=
 =?us-ascii?Q?qC5f+WMuhr9SNs5O9xnNIr2g2g/KKS6TxhZv2KKcM58IrAfqwOfYjC+6VRso?=
 =?us-ascii?Q?T4UhqaiASocvS6WWTQ8BxsNqIhvw7TliAyYmiX2dwolJMf4Xx/t3A7a5mhiT?=
 =?us-ascii?Q?RGJWUV/evcKlWLyyqYeQ9Lub7iVaoZI3upcKaa+g2HuUpafVfxJ/HbFf72QP?=
 =?us-ascii?Q?duvHZ/Mc7pbQJzKkuSUIXC+jy82ptH7WXGUzb9U6lYWJVZ3CQgdgxccRFDIq?=
 =?us-ascii?Q?jOH5hCjrTLwDRhIh/KgGlvBwiIRsiPRE9h8NWhVtBR/Ah3Er3QMEWHhxoHPf?=
 =?us-ascii?Q?Jc0ZCoRbSF7Yn7Fl4WhSZfB3Ij4EvD/1cE5GH9vbsm2r7hnbUvZuQhAXX5Dw?=
 =?us-ascii?Q?87y59PLY83eewCO8EGY53DO0sXdp5hyc033UHidZguca30cbUW/24vE2sSPt?=
 =?us-ascii?Q?WzkLbTGj7jI3j/aXHcocLa04TTPDVtLZ1WUatyHO5Iequf8tcIp0xJfRtPIW?=
 =?us-ascii?Q?ARaqedvPRxro92EDUoH8FRnyCKn3tj5H1AvzBe0FppSjggChgE5clbNQfwo/?=
 =?us-ascii?Q?aHq2TawoeSCOQeRiE0lAFsSUe58cCBiXqfN92uHeYdsNxmTxGPQndokR0Hv5?=
 =?us-ascii?Q?34nGYOeUFrHI3nRxJNsQQ2Zmd52NuMG2rsIopX63EoNu4MaEYvnXr1s9Fezu?=
 =?us-ascii?Q?U8PgwIl7431e4Kehrky12MRxN9sTugLJN3YZfiNSQ/C1brr6wK/cyAt9KCdh?=
 =?us-ascii?Q?f/kYpBRIlnoq61FSvykzvQNcngg0LcZujKyigcqxDjZci5zI+O9xqGf6A8Wh?=
 =?us-ascii?Q?rP//QG/yxcB5h39hBORv3rq/gA+5tzko1+NVtIIMCt4eC5zXjk/ktHgC5atW?=
 =?us-ascii?Q?JsqvsXbF4yPI8BGqYgrJfAgHDSNtX1eBXgHj/XRaXbAuqnEkoTG/9nk00qP/?=
 =?us-ascii?Q?glf2SieRkgHVwz4sidw6gx7KnkFIBudEfWYRz5cd6swY6nU7d07TgRb957+F?=
 =?us-ascii?Q?BWPtX+Rn3cgFTs9SttP/h3aSRv0JOmlCNl++A5zz2JnTIGfoVus8bl679Mo3?=
 =?us-ascii?Q?DkwTG3PDklnmeL3lA6zgXMxBZR05/oNak0jwe8hPQ48vm9Ew35sjzCXqiNHj?=
 =?us-ascii?Q?0kfWUhSvYhBQqDhyEce3e8dCBZzGr/2IZHeoXt26O6QYeVYcYDsgBx6p2zXo?=
 =?us-ascii?Q?GKq0XBlCrIdiYVuvhzEpEXDtS5IUbpYimVnw1nyNblpniPNhUYGTJh5rSSUp?=
 =?us-ascii?Q?GTcYf6qMHa9i2qY8cETm9WbTvUiNSX5PX3CnxAbIdw5MAGLAllL1cnLPfqjj?=
 =?us-ascii?Q?E2dyoj9ZEzfBg902Snj3cAnv7wrI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bSsZv9V8njdirZlHYTtUyNeXDEAJpMrGRmx7D54AF8j/2dd3YIH230H6X2KB?=
 =?us-ascii?Q?XbNrUkMdtuJNR0hHMQr9eccffQaUEDNhlLpUcfaCOnQfT7oCizFOqabKd6UA?=
 =?us-ascii?Q?MgRGS3ATl/DDQWUiLbv3tkaMf1Yz8QGruBZH1V8RwqIcEMpDaJK+bCC2M78I?=
 =?us-ascii?Q?3iPzlb1Y5ars4bCVKZddJ65q/k9CaR2DrZt3DbpQCD9OrV0Z15udUV0wOc86?=
 =?us-ascii?Q?nq+JGDsKSfPs3fXHcPBpJpEwmSOswibgOFc5DI4qgE2dgCN8KJPcJ/bXIiVn?=
 =?us-ascii?Q?pD4rTZvyKJhwLlAyoxq2vuyefBvi5lFGFmeJ1dIsIhBQPmD3J19KJt4cQ2S9?=
 =?us-ascii?Q?Z46NCQini60zlyWY30bpEWvCIpB9+ds9T6IxGbA0e2Vap23WW58TIMZKuoQ+?=
 =?us-ascii?Q?swRIOOAGIRAoQCm0ddKFX3mkgD1eRcPZ1r2x8lwRsDhAvGoPSBZmj9T18QPA?=
 =?us-ascii?Q?yUae6ILkkg1Fnhw1sIJgKtPwRgVkAsBNRmzMXcYjs8Rz7qbqcKRJa6aUrlL5?=
 =?us-ascii?Q?9NchQn86MtK2pkOjXdAE8/VRKAv2Su2ROP3YKio9BRSVm6MAuPSwgs735+S/?=
 =?us-ascii?Q?N77igunftZPy9zQDJG/u7gDucTStZk/k1OzJq7GeGmgBimk0mIGzplPHjbYk?=
 =?us-ascii?Q?UCDuqJQbYUNDRDHOy4vm7p0/z5V+b/gjYLWsZ2MwWi9EyukSaDteFOpajC5/?=
 =?us-ascii?Q?MdqSkyqFXdPL3UwEhuBO0T4sM9VqYGhz2mDYuPUHWdYqwP4fqI35k73j5z/F?=
 =?us-ascii?Q?K8M4KVdRJCWCb5sFR8j3jdVQ8kvBLFkC4DMdEYvqu6mquwEcWcFQgTVWNyQO?=
 =?us-ascii?Q?I2Ae2JwIOlzb0Sh1A0X3lqBOAIFqWzkJ3x/XM3mUUzA+IZBSiUSam7cv31DE?=
 =?us-ascii?Q?yvmaDmCIM0NNUjeMeNcXfSDBqyoXNKB5iRxdGy21fhtCPi05dOBQuERWST6A?=
 =?us-ascii?Q?D8MTYjcqUNiZbuq0PbDI0Z0TNvxs68uzGbg8xNFMhfrW5S8jnD8wJVUsZpuC?=
 =?us-ascii?Q?xbWmlfaxfPlOmgmISYBH6vO3GU8rvqS1i0GON2ileblVr+IP0ltwNJxaUwZ0?=
 =?us-ascii?Q?7+RC9xVsXpbRpyu2VcB04tQ+oQATlAFNsMjasOGjEAAo4GSRBAyXcJBZUshS?=
 =?us-ascii?Q?bR6Lqwsq9uTkpD/amPjcZIq7hSWMoQYHIZ3IOycTo0UqSQPUaSIMLJE1Rh9T?=
 =?us-ascii?Q?u8xexoGMvLAg7A4rjJU9L0ANlys6bEX/+MWtHm9CzcAFwucxn92T2F7JYCeb?=
 =?us-ascii?Q?wxRToVyWtXuChf6s5dL0njM4YsGj1M7YbDgJmZK26G96lThrvY40d6f6QBSU?=
 =?us-ascii?Q?Yb74pno3k7wyJYuJbrLykHg+zhfAWPhF7wys43f8aJnMjMCLm9MLRYIUgVVC?=
 =?us-ascii?Q?xubzOMG/MxsXaNfKG2lxQzxFjJjnPjSCbseqJ7QF65o1Mw8D9njbMaVyyvic?=
 =?us-ascii?Q?U2IveIiRgpsoQbeTjGoHJe+2UfOPV69VeGwKYSdJ/VJNXsU7k+AlJIlMeau+?=
 =?us-ascii?Q?3fY0XGi4FXHEyAfdpWEMMrGYI0cGf+ZaCCOnT58ChISd5fIVyutezyGAGkGJ?=
 =?us-ascii?Q?pKolhDeWJ7XEoGRqD2Ej/lYpHvQcZdOxJDTsQm0HyI3+80gii6DE/bcTniS3?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7939eb-602d-4084-e4ed-08dd45748ea2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 23:35:07.0809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jj0dzePTIH6rYGGMhycnN2oqJWiXfCeKpzSaR0Mc7+Z9/tTNnDRVAZMgNh0ff1iE/ba+u53wlsqjAAB5NnDSmSfHokL56StfOI2dj/zpxpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4959
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

On Tue, Feb 04, 2025 at 10:09:05AM -0800, Vinay Belgaumkar wrote:
>Define PMU events for GT frequency (actual and requested). This is
>a port from the i915 driver implementation, where an internal timer
>is used to aggregate GT frequencies over certain fixed interval.
>Following PMU events are being added-
>
>  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>
>Standard perf commands can be used to monitor GT frequency-
>  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>
>     1.001175175                700 M    xe/gt-requested-frequency,gt=0/
>     2.005891881                703 M    xe/gt-requested-frequency,gt=0/
>     3.007318169                700 M    xe/gt-requested-frequency,gt=0/
>
>Actual frequencies will be reported as 0 when GT is suspended.
>
>v2: Use locks while storing samples, keep track of multiple clients (Lucas)
>
>Cc: Riana Tauro <riana.tauro@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>---
> drivers/gpu/drm/xe/xe_pmu.c       | 140 +++++++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_pmu_types.h |  16 ++++
> 2 files changed, 153 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index 10603e7c3eff..95ebdbd40930 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -8,6 +8,7 @@
>
> #include "xe_device.h"
> #include "xe_gt_idle.h"
>+#include "xe_guc_pc.h"
> #include "xe_macros.h"
> #include "xe_pm.h"
> #include "xe_pmu.h"
>@@ -38,6 +39,7 @@
>
> #define XE_PMU_EVENT_GT_MASK		GENMASK_ULL(63, 60)
> #define XE_PMU_EVENT_ID_MASK		GENMASK_ULL(11, 0)
>+#define SAMPLING_TIMER_FREQUENCY_HZ	200
>
> static struct xe_pmu *event_to_pmu(struct perf_event *event)
> {
>@@ -55,6 +57,8 @@ static unsigned int config_to_gt_id(u64 config)
> }
>
> #define XE_PMU_EVENT_GT_C6_RESIDENCY	0x01
>+#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY	0x02
>+#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY	0x03
>
> static struct xe_gt *event_to_gt(struct perf_event *event)
> {
>@@ -119,16 +123,45 @@ static int xe_pmu_event_init(struct perf_event *event)
> 	return 0;
> }
>
>+static u64 get_stored_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)
>+{
>+	return pmu->event_sample[gt_id][sample];

lock?

>+}
>+
>+static void
>+add_sample_mult(struct xe_pmu *pmu, unsigned int gt_id, int sample, u32 val, u32 mul)
>+{
>+	unsigned long flags;
>+
>+	raw_spin_lock_irqsave(&pmu->lock, flags);
>+	pmu->event_sample[gt_id][sample] += mul_u32_u32(val, mul);
>+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>+}
>+
> static u64 __xe_pmu_event_read(struct perf_event *event)
> {
> 	struct xe_gt *gt = event_to_gt(event);
>+	struct xe_device *xe =
>+		container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+	unsigned long event_id;
>+	u64 gt_id;
>
> 	if (!gt)
> 		return 0;
>+	else
>+		gt_id = gt->info.id;
>+
>+	event_id = config_to_event_id(event->attr.config);
>
>-	switch (config_to_event_id(event->attr.config)) {
>+	switch (event_id) {
> 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
> 		return xe_gt_idle_residency_msec(&gt->gtidle);
>+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>+	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>+		return div_u64(get_stored_sample(pmu, gt_id,
>+			       event_id),
>+			       USEC_PER_SEC /* to MHz */);

why do we do intermediary conversions to usec?

> 	}
>
> 	return 0;
>@@ -160,6 +193,87 @@ static void xe_pmu_event_read(struct perf_event *event)
> 	xe_pmu_event_update(event);
> }
>
>+#define CONFIG_EVENT_ENABLED(config, event) \
>+	(FIELD_GET(XE_PMU_EVENT_ID_MASK, config) & event)
>+
>+#define CONFIG_EVENT_ENABLED_GT(config, event, gt) \
>+	(CONFIG_EVENT_ENABLED(config, event) && \
>+	(FIELD_GET(XE_PMU_EVENT_GT_MASK, config) == gt))

yeah, like I said in patch 1, I don't think this will work.
... FIELD_GET(XE_PMU_EVENT_GT_MASK, pmu->enable) can be
anything.

if you are sampling gt0 and gt1, it will actually be 3. Then if you stop
sampling gt0, it will be 2.


>+
>+static bool pmu_needs_timer(struct xe_pmu *pmu)
>+{
>+	return CONFIG_EVENT_ENABLED(pmu->enable,
>+				    (XE_PMU_EVENT_GT_ACTUAL_FREQUENCY |
>+				     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY));
>+}
>+
>+static void xe_pmu_start_timer(struct xe_pmu *pmu)
>+{
>+	u64 period = max_t(u64, 10000, NSEC_PER_SEC / SAMPLING_TIMER_FREQUENCY_HZ);
>+
>+	if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
>+		pmu->timer_enabled = true;
>+		pmu->timer_last = ktime_get();
>+		hrtimer_start_range_ns(&pmu->timer,
>+				       ns_to_ktime(period), 0,
>+				       HRTIMER_MODE_REL_PINNED);
>+	}
>+}
>+
>+static void
>+frequency_sample(struct xe_gt *gt, unsigned int period_ns)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+	struct xe_pmu *pmu = &xe->pmu;
>+	int ret;
>+	u32 cur_freq;
>+
>+	if (CONFIG_EVENT_ENABLED_GT(pmu->enable, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, gt->info.id)) {
>+		u32 val;
>+
>+		/* Actual freq will be 0 when GT is in C6 */
>+		val = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>+		add_sample_mult(pmu, gt->info.id, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY,
>+				val, period_ns / 1000);
>+	}
>+
>+	if (CONFIG_EVENT_ENABLED_GT(pmu->enable, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
>+				    gt->info.id)) {
>+		ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
>+		if (!ret)
>+			add_sample_mult(pmu, gt->info.id, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
>+					cur_freq, period_ns / 1000);
>+	}
>+}
>+
>+static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
>+{
>+	struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
>+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>+	u64 period = max_t(u64, 10000, NSEC_PER_SEC / SAMPLING_TIMER_FREQUENCY_HZ);
>+	unsigned int period_ns;
>+	struct xe_gt *gt;
>+	ktime_t now;
>+	unsigned int i;
>+
>+	if (!READ_ONCE(pmu->timer_enabled))
>+		return HRTIMER_NORESTART;
>+
>+	now = ktime_get();
>+	period_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
>+	pmu->timer_last = now;
>+
>+	/*
>+	 * The passed in period includes the time needed for grabbing the forcewake.
>+	 */
>+	for_each_gt(gt, xe, i)
>+		frequency_sample(gt, period_ns);
>+
>+	hrtimer_forward(hrtimer, now, ns_to_ktime(period));
>+
>+	return HRTIMER_RESTART;
>+}
>+
> static void xe_pmu_enable(struct perf_event *event)
> {
> 	struct xe_pmu *pmu = event_to_pmu(event);
>@@ -176,6 +290,9 @@ static void xe_pmu_enable(struct perf_event *event)
> 	pmu->enable |= event->attr.config;
> 	pmu->enable_count[event_bit]++;
>
>+	/* Start a timer, if needed, to collect samples */
>+	xe_pmu_start_timer(pmu);
>+
> 	raw_spin_unlock_irqrestore(&pmu->lock, flags);
> 	/*
> 	 * Store the current counter value so we can report the correct delta
>@@ -205,10 +322,13 @@ static void xe_pmu_disable(struct perf_event *event)
> 	unsigned int event_bit = config_to_event_id(event->attr.config);
>
> 	XE_WARN_ON(event_bit >= XE_PMU_MAX_EVENT_TYPES);
>+
> 	raw_spin_lock_irqsave(&pmu->lock, flags);
>
>-	if (--pmu->enable_count[event_bit] == 0)
>+	if (--pmu->enable_count[event_bit] == 0) {
> 		pmu->enable &=  ~event->attr.config;
>+		pmu->timer_enabled &= pmu_needs_timer(pmu);
>+	}
>
> 	raw_spin_unlock_irqrestore(&pmu->lock, flags);
> }
>@@ -310,6 +430,10 @@ static ssize_t event_attr_show(struct device *dev,
> 	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)
>
> XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
>+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
>+		     XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
>+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
>+		     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>
> static struct attribute *pmu_empty_event_attrs[] = {
> 	/* Empty - all events are added as groups with .attr_update() */
>@@ -323,6 +447,8 @@ static const struct attribute_group pmu_events_attr_group = {
>
> static const struct attribute_group *pmu_events_attr_update[] = {
> 	&pmu_group_gt_c6_residency,
>+	&pmu_group_gt_actual_frequency,
>+	&pmu_group_gt_requested_frequency,
> 	NULL,
> };
>
>@@ -330,8 +456,11 @@ static void set_supported_events(struct xe_pmu *pmu)
> {
> 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>
>-	if (!xe->info.skip_guc_pc)
>+	if (!xe->info.skip_guc_pc) {
> 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
>+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>+	}
> }
>
> /**
>@@ -346,6 +475,8 @@ static void xe_pmu_unregister(void *arg)
> 	if (!pmu->registered)
> 		return;
>
>+	hrtimer_cancel(&pmu->timer);
>+
> 	pmu->registered = false;
>
> 	perf_pmu_unregister(&pmu->base);
>@@ -376,6 +507,9 @@ int xe_pmu_register(struct xe_pmu *pmu)
>
> 	raw_spin_lock_init(&pmu->lock);
>
>+	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>+	pmu->timer.function = xe_sample;
>+
> 	name = kasprintf(GFP_KERNEL, "xe_%s",
> 			 dev_name(xe->drm.dev));
> 	if (!name)
>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>index b15858d4d4a9..808d0e854f75 100644
>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>@@ -48,6 +48,22 @@ struct xe_pmu {
> 	 * @enable_count: Reference counts for the enabled events.
> 	 */
> 	unsigned int enable_count[XE_PMU_MAX_EVENT_TYPES];
>+	/**
>+	 * @timer: Timer for sampling GT frequency.
>+	 */
>+	struct hrtimer timer;
>+	/**
>+	 * @timer_last: Timestmap of the previous timer invocation.
>+	 */
>+	ktime_t timer_last;
>+	/**
>+	 * @timer_enabled: Should the internal sampling timer be running.
>+	 */
>+	bool timer_enabled;
>+	/**
>+	 * @event_sample: Store freq related counters.
>+	 */
>+	u64 event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
> };
>
> #endif
>-- 
>2.38.1
>
