Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41826CCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 15:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0572F10E283;
	Tue,  4 Nov 2025 15:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8ExPNQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0743810E283
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 15:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762268510; x=1793804510;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=02HqZECGiX4EkXS4gvxzEsV0Kebbuen8f2nAIJNMBho=;
 b=V8ExPNQJIJa8uaOunoHaNz9aWL+QDRFeIVOD+oayJ5oXh7oUriaKzBbS
 EPK3nccbsyNGBK7k5G/VmzY5pczxPRt0XdMNZ3cKZUfMt6rbl5Mx5nbdf
 f8wGLfmOvla+ILZr1Ip6xbdM9nlmPo9TDIU8xIPIHmfRI2CWFfG3sNXjM
 /Luovuzt9eLoO5lcE6Sm7SdZSQaJfGniNj6KmHxG4m3BbjsWWjKXY2sC7
 MIigUK8l3ASIZ4Dy1loG7IWeA1IiyvaU5oBBkF8o2ztFmop1N2O0IxNq8
 krVB+npMwwTXVTlmQ7C9Od2iDwHBTey2/USFYbeN2GqWRy7OSQRZZVGJ8 w==;
X-CSE-ConnectionGUID: 6tbWWG2+TrGd7OfEjkj3mQ==
X-CSE-MsgGUID: 9zJXVgZ6TD+xBhQawo7p5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64462386"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="64462386"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 07:01:50 -0800
X-CSE-ConnectionGUID: KuzeheOnQDiDx5daefWxCw==
X-CSE-MsgGUID: vYFp8xxDToO9xi590R9J/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187032592"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 07:01:49 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 07:01:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 07:01:49 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 07:01:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RC0zBe3uSV1xIsPyZFLOEdEylKAiIB3w2XpszIQ4gNda1mxP//IBUp/1c5AV+0O9pycxNYZnd70UIfKK/p3l16mwwhQ7rZC1TuZbRP+lrOkga3F1PYgOZzLXMuvQh6zyEo18eTIjix7C4Cjs2BHFJjwUsu6YrZxNXROM3g2YNo30RasqdF5D5qQIW3YAMboF12QqLvWrzYoXTDGnmJP9bG+EbgX+vvJQWsiwrfDZ+UY/SS5q4MpR9gZg736HYaKUrBTyF0Up4TdfDFWe10vucjLRUJCqGvrwzWaD2vJ1DgooI2YeYJpMg0Ce1JueJuSyLIr8fWv4nhfIux7/EBCGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fb4vEfThbhkF5pthnrQew4Bbs3vli3XsMTNBYXFUiJc=;
 b=EXPRd0Ws4etf9tBLR3EHXiQaMXZbRBAdgxZs1spNzo0IXnabQvDHMaDPF9WXxYTEP0Jh4U0RDwZGxPsosJYuCbxHkPJA3blLWHRaACM04zxHigqu/VUkpgBdt9s3Xc2xSEy9/bsoXC0R5PlPEspvhfm6OlMtKL9RH/Zj0mhT9vDJ3WugAp4R9RB2NgMXLvil5fmw8g9zBwNytfLIx6fj0zqP7k0v2iRQFUKncIOl5XJa2ZpAqNa+8b/rO6DH/+m5uAwowS02gk5JLd+1Q4IhaSiDZn25jyM0V9fzu8aMcIbuq2His68g5lNs38dlZr8YHYShAUgr8h0UHM3B0IXxOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6667.namprd11.prod.outlook.com (2603:10b6:303:1ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 15:01:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 15:01:40 +0000
Date: Tue, 4 Nov 2025 09:01:35 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <francois.dugast@intel.com>
Subject: Re: [PATCH v4 5/7] drm/xe: Implement xe_pagefault_queue_work
Message-ID: <3tzdsapjzs7luwkv5pgmrdc6tuj2v2aphudijkib4jsf5uduz4@tbqopp765dft>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
 <20251031165416.2871503-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251031165416.2871503-6-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fd5d5e-c017-437b-4f11-08de1bb30eda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cIsvXgzUly7/wnHt5cV6Yt3OnZtcvFPVyrAWf24aZDNLU1Hm1gG76QNAu0Sh?=
 =?us-ascii?Q?7CxWNR5XblSCz7ixl9ynHUoVt0SWKjfjpY3IPTu4gzdthOMi9c0MVbnpcRRY?=
 =?us-ascii?Q?ZfxPOr7Vk2lKP7udBhCXHitr4CUlbfzmqSdkMztNd/nRfA4aIzUQUP6kCRzV?=
 =?us-ascii?Q?4joriszgv8SinlshTveIzcndFx4EvoSYh9jYKDytryaHHrCDSadb8qmWBzFr?=
 =?us-ascii?Q?SCfbYhsdvnBTWP0CpEGSsbZsx4p3k/dqKnVqfCTagcAhzX4PL+mRoRpB3fSk?=
 =?us-ascii?Q?8S4bhA97rISmiftgYyAil/a0GfEBSdOts9E0YA6RNreBYK0hUBitIQUkPdO0?=
 =?us-ascii?Q?Hhs7vmgbMI4yKJDOUIMKY0orhZQtk1evs8SezuV0a2QamlmqvAAirEMDO2aZ?=
 =?us-ascii?Q?70gwQI4ZiF/KzwVdFHB5R6/gNyC8scvkpjhKDUlT4+zskNz2tGpZFGjf1H+m?=
 =?us-ascii?Q?JdrwW9oLuoewFlwJBsYlymldONlRa4Wb85aPMc1vyYx243Xd/xUd8mQAb3pM?=
 =?us-ascii?Q?Sdmrc5lCw3Ota9aqiBUblOnoaklJgu/567xdEJK5SI2oSb6HE5APr4PdJO0M?=
 =?us-ascii?Q?73wjjUtCx1xa4zUd42nQOsb6Pb3jlXRHCbjJpbC6a1JaB97xMGfYjp2+oCxX?=
 =?us-ascii?Q?RGcYe1MeA9uUZxNAnjHUp0c/iBVV0AHKIl0KBAb9yU1Arkby2i8Ahy7uVDwm?=
 =?us-ascii?Q?GrAdzhlX256Nn4ON8obKWs4YWPKwEEXmxm5B0dGilQ8gs8uBVUBtD9+JCTyZ?=
 =?us-ascii?Q?J2S4ahwX4paZEa7VAT8jSCLRAyv6E17oCj977huH1D247rfFvSMmKADkLW4K?=
 =?us-ascii?Q?Nv+trl+2BnnPDNJP0UP+9Dg/P7Km2dHRsb+FeEYk7JWDRFwxDTqry7HqeAb9?=
 =?us-ascii?Q?Q55OyWu+d9rz5UKEyP+UPzWFYfPAfcQ+1LFAOoRfi9MpTEPHAANo1d8I1GWW?=
 =?us-ascii?Q?Dys8ngWTIkTC32IQ9zuAImKSLnEw6/brg3wf39e82UfaeX5wa5tP/J/5dNhp?=
 =?us-ascii?Q?V79gZm5ppavsRu+mgt3oOat4LymImTxb5YVc3S98KYZgQpLm59P0UNI0fLW1?=
 =?us-ascii?Q?gQ4fFto/ZxKzl6SQKwBJ9FJnlgagswOy9yEfDgIJSMyDli0cjpGqAiaoLM8C?=
 =?us-ascii?Q?XY6GHJT3x59w9m6MC6ELg82UbCflgEVTHtNHpzyNv5aNBNWEXVWZSWT6m5Q4?=
 =?us-ascii?Q?rUhS3/S1YNGoRPgoigS9qVcqCS6bdJfsLcxWC2mNN/N6IZzrCFFaNRIsEiax?=
 =?us-ascii?Q?8Bj6yxCF82QI6RDCW7Q+wqW5JZt98XeQ1srFEQKTvmGX33goIkk8b1V9iNnK?=
 =?us-ascii?Q?CYyCfMo7NR+Fmbk4WQQOir80xjMJaTItr6hO7tDNzNFylVXHp5VXHICX1mbZ?=
 =?us-ascii?Q?+eLnTS3DCpJtA4x2QhMnK98hAMK+DClNl6vULfrD7rUEeu8MoPqJnw3PzGKt?=
 =?us-ascii?Q?S5nRh0HHWn4QZbdeXGmebdOxb5PvpR0U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FXDZZLw8qoDt+KtDyYUny2zjhSe9p12YPDyvc9+1KXj/Yio3XjcEHJVVURJq?=
 =?us-ascii?Q?WYDUVsPRVUSCLOiEjGf6BoH5fg3c13FL2V+GcK6voYGJ9tBH125D1HalNs6x?=
 =?us-ascii?Q?j32xeuoOSURqkk9dB19/BJbQ2qO+2QdSEzRXmYgv0Msymkj5Yv/XbpWm+wsM?=
 =?us-ascii?Q?UTcFQq15OJhWD8OWUKP2tA07cYo4J15lUDb+HYy+IagoutuHNkO358BTidu2?=
 =?us-ascii?Q?JItWPVO+UjR/EbKvrjmo1kxlFpw1kCQUL8ncTURmc6wlwFOFuYaHpFnGeKGm?=
 =?us-ascii?Q?Ee+3uwuHbCIBmw0hr02B6pRjQ7uFXkKsjWoVnNkP/1QHu+/9tCnj9ldzR86I?=
 =?us-ascii?Q?AYstw9Ix4P3t9fypdu3YNKCq0oFMbaiIvY2EZsHe7jI2lfTU+clCL7nuMsNt?=
 =?us-ascii?Q?IcdP2Jhyxjs3SeXrkJF+JqH8WlKHAlL+EHagL7mMtz2wFxkD6/AdLo1HtPc0?=
 =?us-ascii?Q?mZA27eqJ3FhGAYnTU2Rj4lfeTBKR0kbx2m0Uom8M+vN1/7W7aee2a3n6+T76?=
 =?us-ascii?Q?nim9qeBvLfHJ55PNlaf5BcxHqucAMadFrPkEVXX39xEL/sGe0BCuop8/jesn?=
 =?us-ascii?Q?wUxlSjKQ/Q79exrNQOjKUygY/fp4yHWBa6tT+XHtyuq1RjMK1sutDym/50DY?=
 =?us-ascii?Q?vfYP19XnVAjuEgJcOaxicebzUMkwoEMGIOeNsXp7zaHMj/ZyxZbMjFMXOwN/?=
 =?us-ascii?Q?U7QLR0u+sRn1uUsNh2xIjZ+A/pCDYYfjF9KeSKjfGIcGQWAzdz+j36dLQjgl?=
 =?us-ascii?Q?WniUdemnG8Ny3o2bezNfBxUKNmQoCjzsTscDP+6pjsBrlRvcI/DlbGyRVg+x?=
 =?us-ascii?Q?1NPr0QPlUGklYgy1hy/j//J9modPrRH++2RVJlewyLM7WPjHWz8movnIn5J7?=
 =?us-ascii?Q?f1cQ2N6nze3QcJHfjzefCCORD7aR0E/VEmyPO2Cpjp4bSXmTfMwHpvmSR9ke?=
 =?us-ascii?Q?7TVP21+W8J5oKDpDXhqKFhions03AW4rMKOxrk6TbR8hoW+jwVO6gOJxONe6?=
 =?us-ascii?Q?rI8dWmeUC5c3iicvIm4zek6GRC8zJgqL/6ffWHQUVMIywrz4gg4eqmtGrPwT?=
 =?us-ascii?Q?kgs5RxeadQqvKY7E2w1V9h5h8ZhPIELebOfnglYholVJ4ayT26UlGlbkWlXl?=
 =?us-ascii?Q?5aKwiXtyLnFkhAXK3m8gyO+0wpg2IMEFW5B5grCHUlQrz+ZZEp9KfYK4y2vn?=
 =?us-ascii?Q?ZsXzlp5PMQtpax8gF5IUXDYKwnO4DWS6OECp0+3qaZLnxH/iW7Z61qwWVpCj?=
 =?us-ascii?Q?EabCEcKb2vcpRZ56++LQvFSwzvcquKKqvGOP6KJ1u1U55BwKOYiyaGP9HHDy?=
 =?us-ascii?Q?eu9t2/vcEbVMn/PDCXT6k+e3Lpnviw41deWteotg2EHz9LeVmvXlRuvzr9fI?=
 =?us-ascii?Q?aoLX0MUSHXjbVPdFlm+16czEpdqMDzXDSPDPiCxzymFJe31BeWV+OSpkbadj?=
 =?us-ascii?Q?JevnprhBXwRyRklHmV0wmOTpsIusqiZ90M3CtL4J4Okx7bZHmlnIUjFRp2aI?=
 =?us-ascii?Q?C+nUBpa8AcVdrOSdWqSIBk/AmBD8vlhYQpJhP09ye/m+7JxiEKV9KNkoMX5l?=
 =?us-ascii?Q?fguC5PA4cPUJhDXtUkXCRrNjPBffLZnOfdo2Nbw/25vTg6y3BKOwIJ98lPqp?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fd5d5e-c017-437b-4f11-08de1bb30eda
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 15:01:39.9015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdRFKyha4OUlNyZJdU2CX+Rn+TEpF1/8eyDaglnseKSmdPQjVDCTvThlBEvP1/XuwKJnmtkSZb/9uYQbAwD3RynFbY+Cdq1AB8l+BiKH2Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6667
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

On Fri, Oct 31, 2025 at 09:54:14AM -0700, Matthew Brost wrote:
>Implement a worker that services page faults, using the same
>implementation as in xe_gt_pagefault.c.
>
>v2:
> - Rebase on exhaustive eviction changes
> - Include engine instance in debug prints (Stuart)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>Reviewed-by: Stuart Summers <stuart.summers@intel.com>
>---
> drivers/gpu/drm/xe/xe_pagefault.c | 235 +++++++++++++++++++++++++++++-
> 1 file changed, 234 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>index 194e647a8af6..3ac042c54e8f 100644
>--- a/drivers/gpu/drm/xe/xe_pagefault.c
>+++ b/drivers/gpu/drm/xe/xe_pagefault.c
>@@ -5,12 +5,20 @@
>
> #include <linux/circ_buf.h>
>
>+#include <drm/drm_exec.h>
> #include <drm/drm_managed.h>
>
>+#include "xe_bo.h"
> #include "xe_device.h"
>+#include "xe_gt_printk.h"
> #include "xe_gt_types.h"
>+#include "xe_gt_stats.h"
>+#include "xe_hw_engine.h"
> #include "xe_pagefault.h"
> #include "xe_pagefault_types.h"
>+#include "xe_svm.h"
>+#include "xe_trace_bo.h"
>+#include "xe_vm.h"
>
> /**
>  * DOC: Xe page faults
>@@ -32,9 +40,234 @@ static int xe_pagefault_entry_size(void)
> 	return roundup_pow_of_two(sizeof(struct xe_pagefault));
> }
>
>+static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
>+			      struct xe_vram_region *vram, bool need_vram_move)
>+{
>+	struct xe_bo *bo = xe_vma_bo(vma);
>+	struct xe_vm *vm = xe_vma_vm(vma);
>+	int err;
>+
>+	err = xe_vm_lock_vma(exec, vma);
>+	if (err)
>+		return err;
>+
>+	if (!bo)
>+		return 0;
>+
>+	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
>+		xe_bo_validate(bo, vm, true, exec);
>+}
>+
>+static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
>+				   bool atomic)
>+{
>+	struct xe_vm *vm = xe_vma_vm(vma);
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	struct xe_validation_ctx ctx;
>+	struct drm_exec exec;
>+	struct dma_fence *fence;
>+	int err, needs_vram;
>+
>+	lockdep_assert_held_write(&vm->lock);
>+
>+	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>+	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
>+		return needs_vram < 0 ? needs_vram : -EACCES;
>+
>+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
>+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
>+			 xe_vma_size(vma) / SZ_1K);
>+
>+	trace_xe_vma_pagefault(vma);
>+
>+	/* Check if VMA is valid, opportunistic check only */
>+	if (xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
>+					vma->tile_invalidated) && !atomic)
>+		return 0;
>+
>+retry_userptr:

I realize this is a copy-paste-diverge from xe_gt_pagefault
but this goto backwards is ugly for no reason.

it could be either

	do {
		...
	} while (err == -EAGAIN)

or a separate function

	while (err == -EAGAIN)
		err = try_pagefault_handle_userptr(...)

this can be done on top though.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+	if (xe_vma_is_userptr(vma) &&
>+	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
>+		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>+
>+		err = xe_vma_userptr_pin_pages(uvma);
>+		if (err)
>+			return err;
>+	}
>+
>+	/* Lock VM and BOs dma-resv */
>+	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
>+	drm_exec_init(&exec, 0, 0);
>+	drm_exec_until_all_locked(&exec) {
>+		err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
>+					 needs_vram == 1);
>+		drm_exec_retry_on_contention(&exec);
>+		xe_validation_retry_on_oom(&ctx, &err);
>+		if (err)
>+			goto unlock_dma_resv;
>+
>+		/* Bind VMA only to the GT that has faulted */
>+		trace_xe_vma_pf_bind(vma);
>+		xe_vm_set_validation_exec(vm, &exec);
>+		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
>+		xe_vm_set_validation_exec(vm, NULL);
>+		if (IS_ERR(fence)) {
>+			err = PTR_ERR(fence);
>+			xe_validation_retry_on_oom(&ctx, &err);
>+			goto unlock_dma_resv;
>+		}
>+	}
>+
>+	dma_fence_wait(fence, false);
>+	dma_fence_put(fence);
>+
>+unlock_dma_resv:
>+	xe_validation_ctx_fini(&ctx);
>+	if (err == -EAGAIN)
>+		goto retry_userptr;
>+
>+	return err;
>+}
>+
>+static bool
>+xe_pagefault_access_is_atomic(enum xe_pagefault_access_type access_type)
>+{
>+	return access_type == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
>+}
>+
>+static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
>+{
>+	struct xe_vm *vm;
>+
>+	down_read(&xe->usm.lock);
>+	vm = xa_load(&xe->usm.asid_to_vm, asid);
>+	if (vm && xe_vm_in_fault_mode(vm))
>+		xe_vm_get(vm);
>+	else
>+		vm = ERR_PTR(-EINVAL);
>+	up_read(&xe->usm.lock);
>+
>+	return vm;
>+}
>+
>+static int xe_pagefault_service(struct xe_pagefault *pf)
>+{
>+	struct xe_gt *gt = pf->gt;
>+	struct xe_device *xe = gt_to_xe(gt);
>+	struct xe_vm *vm;
>+	struct xe_vma *vma = NULL;
>+	int err;
>+	bool atomic;
>+
>+	/* Producer flagged this fault to be nacked */
>+	if (pf->consumer.fault_level == XE_PAGEFAULT_LEVEL_NACK)
>+		return -EFAULT;
>+
>+	vm = xe_pagefault_asid_to_vm(xe, pf->consumer.asid);
>+	if (IS_ERR(vm))
>+		return PTR_ERR(vm);
>+
>+	/*
>+	 * TODO: Change to read lock? Using write lock for simplicity.
>+	 */
>+	down_write(&vm->lock);
>+
>+	if (xe_vm_is_closed(vm)) {
>+		err = -ENOENT;
>+		goto unlock_vm;
>+	}
>+
>+	vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
>+	if (!vma) {
>+		err = -EINVAL;
>+		goto unlock_vm;
>+	}
>+
>+	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
>+
>+	if (xe_vma_is_cpu_addr_mirror(vma))
>+		err = xe_svm_handle_pagefault(vm, vma, gt,
>+					      pf->consumer.page_addr, atomic);
>+	else
>+		err = xe_pagefault_handle_vma(gt, vma, atomic);
>+
>+unlock_vm:
>+	if (!err)
>+		vm->usm.last_fault_vma = vma;
>+	up_write(&vm->lock);
>+	xe_vm_put(vm);
>+
>+	return err;
>+}
>+
>+static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
>+				   struct xe_pagefault *pf)
>+{
>+	bool found_fault = false;
>+
>+	spin_lock_irq(&pf_queue->lock);
>+	if (pf_queue->tail != pf_queue->head) {
>+		memcpy(pf, pf_queue->data + pf_queue->tail, sizeof(*pf));
>+		pf_queue->tail = (pf_queue->tail + xe_pagefault_entry_size()) %
>+			pf_queue->size;
>+		found_fault = true;
>+	}
>+	spin_unlock_irq(&pf_queue->lock);
>+
>+	return found_fault;
>+}
>+
>+static void xe_pagefault_print(struct xe_pagefault *pf)
>+{
>+	xe_gt_dbg(pf->gt, "\n\tASID: %d\n"
>+		  "\tFaulted Address: 0x%08x%08x\n"
>+		  "\tFaultType: %d\n"
>+		  "\tAccessType: %d\n"
>+		  "\tFaultLevel: %d\n"
>+		  "\tEngineClass: %d %s\n"
>+		  "\tEngineInstance: %d\n",
>+		  pf->consumer.asid,
>+		  upper_32_bits(pf->consumer.page_addr),
>+		  lower_32_bits(pf->consumer.page_addr),
>+		  pf->consumer.fault_type,
>+		  pf->consumer.access_type,
>+		  pf->consumer.fault_level,
>+		  pf->consumer.engine_class,
>+		  xe_hw_engine_class_to_str(pf->consumer.engine_class),
>+		  pf->consumer.engine_instance);
>+}
>+
> static void xe_pagefault_queue_work(struct work_struct *w)
> {
>-	/* TODO: Implement */
>+	struct xe_pagefault_queue *pf_queue =
>+		container_of(w, typeof(*pf_queue), worker);
>+	struct xe_pagefault pf;
>+	unsigned long threshold;
>+
>+#define USM_QUEUE_MAX_RUNTIME_MS      20
>+	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>+
>+	while (xe_pagefault_queue_pop(pf_queue, &pf)) {
>+		int err;
>+
>+		if (!pf.gt)	/* Fault squashed during reset */
>+			continue;
>+
>+		err = xe_pagefault_service(&pf);
>+		if (err) {
>+			xe_pagefault_print(&pf);
>+			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
>+				  ERR_PTR(err));
>+		}
>+
>+		pf.producer.ops->ack_fault(&pf, err);
>+
>+		if (time_after(jiffies, threshold)) {
>+			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
>+			break;
>+		}
>+	}
>+#undef USM_QUEUE_MAX_RUNTIME_MS
> }
>
> static int xe_pagefault_queue_init(struct xe_device *xe,
>-- 
>2.34.1
>
