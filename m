Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DF9EE7FF4
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 17:15:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42FD10E344;
	Mon, 11 Sep 2023 17:15:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B049F10E344
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 17:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694452544; x=1725988544;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3vI/Tqcf8lILLhPyaqRh2591ja6oGpl3USllwTiTN1M=;
 b=HnoGWRyPhxTobPvOy0owhx5X4w/rgi17ZYboEZdQ4xqPK+m2S6jhFQ6v
 LDUSPHzbfs+pZdwjL7vkvo56jUSVmhSjWkRdQ4aRhIyfaBun6GbsZaazM
 p4SBBJWoXarp8XvadPGq0KN0N9OXVgNjmdEB2zRn8F5DUlS1QeASI7R5H
 zesTkfEVFaRMGwv7T3jz1FWoFpue07fLYHvHSq6VwL2Na2LhAUowIYSPq
 gaCljXci22l4x1pY8cdknUUJu0xL1rCPLoVec6cZwZ02XjCfy1gyn1B1W
 Bxm3F3ugESr/IKwoPzJ+WUrCqhhjPgjcmjHyYTOJrKkKwarKCMLvLmPn4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="442158925"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="442158925"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 10:13:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="772664430"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="772664430"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 10:13:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 10:13:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 10:13:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 10:13:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 10:13:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrMGCB4k9krTIOjm3vM7DDu+0hvPQeU1+MvXiltVjGiUd1rVZVRiUMzHDixK+Xb0xHd4Qgsxxyjghpy1zvwKAlQOYrainbCZx7+4Mkl3p/xjcfNqRiz/GFv6EBTTnvXOI6yCYH9qprn/NfZ0QTo00uPWE4/Sj7AGVWRl3e6oXdVdvDZpdG+gDyItRYm9AcoC8AL8pcSGJjZvoyJ8uZy4QaDN83qwIZY5uYIliPK7SF+Fx2DsNiKD5LEdd6eWHiI0DwhnOrmE0x/FuyRTiLRXnCU5OPShDx2bVvBapz2WH3toUwxe8ScpnnphEavqvlUsO5xW6bvg8FwotvGlVsvqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZteXPQjEmmXBBUJNUlQWSJtVhXBMrlZt7FQEBiObz3M=;
 b=afizbbahXuS2a9mE86oHRyrizKBr/KSLrg4x0Pq86oDuyBkMGBoVd5h6aLb5hOU4/hWoekH8A3suKXu6ZWBgrJqO5mW+sGOs5nqLMF6cM3TFDBQwUKz6lUKdmKos/0r0iHE7iUyFqovbe5QeEJFmmpXPkl+P4PhJcknRyflWkXtNOUlXkqkpUxvGKTV7FoJwwmwWOxyGZKhZ7zYbxWy8ZxrqQxP1tD/4Bvjj/UZLNHV0rFrNKnJixoxQn4MXH04lk9MmjQEoOw6SSPGiJfyZcH1Cyh89UxUayHZc0XpOaGgQLdOtzlSbupq2gZK/VazqfA4s5eVnHu2EwdFmugFKHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8576.namprd11.prod.outlook.com (2603:10b6:806:3b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 11 Sep
 2023 17:12:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Mon, 11 Sep 2023
 17:12:58 +0000
Date: Mon, 11 Sep 2023 13:12:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZP9KlQCRiv3YxuF7@intel.com>
References: <20230907122334.7-1-francois.dugast@intel.com>
 <20230907122334.7-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230907122334.7-3-francois.dugast@intel.com>
X-ClientProxiedBy: MW4P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d7e2f4c-18da-4bd0-92f5-08dbb2ea586c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y1qnbZ3LVagX2AOxNtdoLNqaI6QxYsZ4QQAAZI5kWwdu8wH/VvX7X4nXQnT2wRhNVP24CLskFWgQwSLCE29Cyxm8jwA1AHeAq0wJuWxAm7w7GFPdpystEolrCmyi9Ei3kkHaz1lCdN3wIJsfKdfbRkmdqsSsTCdIcV9w1aL33VzYCEWrGDwvEquxP2Jb0K83HIeschouR/qVNHSfdvQEVtQypdkiKlL9t5VZhIWSfJfxkEX9Cu5LYI3qAk2RAlDAlJolYQXNN6Nv7oXEm6KGhrvNpiALd1c8zbluJJHbH2n9Dz38RAI6ZuldjETEuQaXU8dOo9LfUvo5b3IlK3TjMQM0VoOOkmjAbmZXxs1eBpjIBxVvFMtYpOqSezxNzItFLyohU0mMMRh90NNkg0ZiTWiitj4x+7fP+AoUi0ku1ajxQg1cClwLVfn4WBr6azJIdcKq+iwigvqcliN/WV0h2ptyroLkQYqq+o86Tu5GWm/Utm/2D3cH6b0UorH+gkOpQ7nWg/a6IXiJGeB9Qqokg+a1QidF0OAW7eyicb3nfbMzmzHET6JmFrcOeQGTChPb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199024)(1800799009)(186009)(6862004)(4326008)(8676002)(44832011)(83380400001)(66556008)(6636002)(37006003)(316002)(66946007)(66476007)(54906003)(478600001)(2906002)(8936002)(41300700001)(6666004)(5660300002)(6506007)(6512007)(107886003)(26005)(2616005)(6486002)(82960400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OFhzfz/xlmNtR6ksut7G9tKwa3QQxaOPc7xZPlFnBJOwVp9+S56HyMGP3/?=
 =?iso-8859-1?Q?gNdLzPDxsy5ZGGTrOiE1M8YiBnGP5r41f/aR79/E3nSPM3nOEhjeB83wjD?=
 =?iso-8859-1?Q?2hjV7dfTgQnqz65pvrvXTSATY2gVqvks8Jkp9r5/hONa6MCxaR394DqdtW?=
 =?iso-8859-1?Q?/rlLwLHtu9xfxrGTGlFOTDJHyYRUvrCpyzoYKh+5z76A+dpHwa51qkY1xp?=
 =?iso-8859-1?Q?PfxvSeoOhIWZNsf2g2KORSy5//Z87vTeS+Vxxu2NzinLYbqOrpY/u7HmEt?=
 =?iso-8859-1?Q?RZ7+V2Ph3E7qmlUpnoU9WzJaxzE5L0VvXmg80e1vqL1wDZfxQQTssNXsyn?=
 =?iso-8859-1?Q?ZlJTu/X9vLHwTASH0UipTaYW9dvUEGlygYsMNNY8cg5vBG1z1zt/G+0zuP?=
 =?iso-8859-1?Q?Zeb88fTckxPj88jlWoi/T2wwssSkyinFsk0V8a78YsD6RT4/czgY211fT2?=
 =?iso-8859-1?Q?yLSYnONat4CSSyN3JgL5JJYUQQRS+XyqR5yh7hZ70L+cdJP1xbr3WgQk/h?=
 =?iso-8859-1?Q?nZHb8xJoBtXiPrMYTgWNJmtTq6+AfWBXkd6zU98eY3P16hhA3a2/vyKabl?=
 =?iso-8859-1?Q?0KOPHXv36hxe4/8tNhXs/W5UZmc25Iluwj0M0MYpOQzsEozXWqPIemlyn/?=
 =?iso-8859-1?Q?KQTh3F5Hh2/kNWANrpu0XQgiyCgObFuKEm/2dS5J/vlKwLazBYW+NTIxDt?=
 =?iso-8859-1?Q?xbCbu8lzpNqPNb8egYiPdiCLbZJCZmnQrraR1BxYhqGt/H4d0I6JLEFE2o?=
 =?iso-8859-1?Q?8UW/w5o2lZeMEpA/TQLXLjQLV10yAXe505J9PmsM2ttDzZpT6GUl3xv61D?=
 =?iso-8859-1?Q?u8Q6vBTc3RGASBgYfyysJ6tW/2axDa7S40GN6dWTlA+okcZ6hfpBCKuWzl?=
 =?iso-8859-1?Q?diZoufn1W7gJ47uHXV0xLhMedORorcfcUdlAOm83mg6a61/SFSkLAtcAIo?=
 =?iso-8859-1?Q?9xcj/UWqnEEZl5IZ4mbI+8mU1pI1VY9jGpM8A1QUbuSVb7bn0tiYDEedCx?=
 =?iso-8859-1?Q?BKxtSQeYD83XUAMBb76pADsVMzeeHptznfnB/PdU2C9X/642793amgr9K4?=
 =?iso-8859-1?Q?HEN8thtOgf5K2kvQm2/71vTMOzJIqaZxLwAFDFMchKpL7Ts5C/zCOCOlfr?=
 =?iso-8859-1?Q?aoop7ZISh2Iavk9Kh4yt5kjf+do+Gt7oEZ339u4JPpQaSpj+QmQ8G+1lBg?=
 =?iso-8859-1?Q?6v6D/cIgPZ8jhqkYnbzjc3V7ndejgHQvenVHsTjsEozj1P4BgrLpRklFPN?=
 =?iso-8859-1?Q?iR7Hj85y4pkAudms5O5j2kpWKP8UlOj1Pfvq4RazNb6es8PKRRNZRStAiX?=
 =?iso-8859-1?Q?O6Siu4kroc8wyTfd29dVs6ST0ryTjvo5CQz5q31orPMQ3oWUeZcqdExsjU?=
 =?iso-8859-1?Q?3bBdURWOFbjkUF7F1PF9tBHmuE9W4LPvTJQi9VyQwOy10iOI4UzdalHcZa?=
 =?iso-8859-1?Q?z6NRvTAWwiVl+0Ho8xWs5HI/XRUAaG4S56372rdm83xevmbh6Hhfb4KV9w?=
 =?iso-8859-1?Q?PRuKua0OGRlmQmOHTFHyWZcDce8h/eljdWXcvfa145jQ3+tBoOLxI8PQxO?=
 =?iso-8859-1?Q?aWp+tW0rL0Kld+3QIeqc6o/ARaQ97QGwGughn8sCJIHbMdgsr+0ksQuhGJ?=
 =?iso-8859-1?Q?xvle9WRgOWwTkEV3SA0N1QhK6k5EYbQgeN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7e2f4c-18da-4bd0-92f5-08dbb2ea586c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 17:12:58.1948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: og5I1OTSyBlXI1ojv2bj0KEKT1gP0bKczXl9FVFEQI1CL9sXzK+DRiDjN4jtR6HLdD1KJjhdg+L6yoNbsiFRRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8576
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/3] drm/xe: Introduce Xe assert macros
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
Cc: Jani Nikula <jani.nikula@intel.com>, matthew.d.roper@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 07, 2023 at 12:23:33PM +0000, Francois Dugast wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> As we are moving away from the controversial XE_BUG_ON macro,
> relying just on WARN_ON or drm_err does not cover the cases
> where we want to annotate functions with additional detailed
> debug checks to assert that all prerequisites are satisfied,
> without paying footprint or performance penalty on non-debug
> builds, where all misuses introduced during code integration
> were already fixed.
> 
> Introduce family of Xe assert macros that try to follow classic
> assert() utility and can be compiled out on non-debug builds.
> 
> Macros are based on drm_WARN, but unlikely to origin, disallow
> use in expressions since we will compile that code out.
> 
> As we are operating on the xe pointers, we can print additional
> information about the device, like tile or GT identifier, that
> is not available from generic WARN report:
> 
> [ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
>     platform: 1 subplatform: 1
>     graphics: Xe_LP 12.00 step B0
>     media: Xe_M 12.00 step B0
>     display: enabled step D0
>     tile: 0 VRAM 0 B
>     GT: 0 type 1
> 
> [ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
>     platform: 7 subplatform: 3
>     graphics: Xe_HPG 12.55 step A1
>     media: Xe_HPM 12.55 step A1
>     display: disabled step **
>     tile: 0 VRAM 14.0 GiB
>     GT: 0 type 1
> 
> [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
> [ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
> [ ] Call Trace:
> [ ]  ? __warn+0x7b/0x160
> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> [ ]  ? report_bug+0x1c3/0x1d0
> [ ]  ? handle_bug+0x42/0x70
> [ ]  ? exc_invalid_op+0x14/0x70
> [ ]  ? asm_exc_invalid_op+0x16/0x20
> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> [ ]  xe_pci_probe+0x6e3/0x950 [xe]
> [ ]  ? lockdep_hardirqs_on+0xc7/0x140
> [ ]  pci_device_probe+0x9e/0x160
> [ ]  really_probe+0x19d/0x400
> 
> v2: use lowercase names
> v3: apply xe coding style
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_assert.h | 177 +++++++++++++++++++++++++++++++++
>  1 file changed, 177 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> new file mode 100644
> index 000000000000..b2d3c9b82b31
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_assert.h
> @@ -0,0 +1,177 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_ASSERT_H_
> +#define _XE_ASSERT_H_
> +
> +#include <linux/string_helpers.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_step.h"
> +
> +/**
> + * DOC: Xe ASSERTs
> + *
> + * While Xe driver aims to be simpler than legacy i915 driver it is still
> + * complex enough that some changes introduced while adding new functionality
> + * could break the existing code.
> + *
> + * Adding &drm_WARN or &drm_err to catch unwanted programming usage could lead
> + * to undesired increased driver footprint and may impact production driver
> + * performance as this additional code will be always present.
> + *
> + * To allow annotate functions with additional detailed debug checks to assert
> + * that all prerequisites are satisfied, without worrying about footprint or
> + * performance penalty on production builds where all potential misuses
> + * introduced during code integration were already fixed, we introduce family
> + * of Xe assert macros that try to follow classic assert() utility:
> + *
> + *  * &xe_assert
> + *  * &xe_tile_assert
> + *  * &xe_gt_assert
> + *
> + * These macros are implemented on top of &drm_WARN, but unlikely to the origin,
> + * warning is triggered when provided condition is false. Additionally all above
> + * assert macros cannot be used in expressions or as a condition, since
> + * underlying code will be compiled out on non-debug builds.
> + *
> + * Note that these macros are not intended for use to cover known gaps in the
> + * implementation; for such cases use regular &drm_WARN or &drm_err and provide
> + * valid safe fallback.
> + *
> + * Also in cases where performance or footprint is not an issue, developers
> + * should continue to use the regular &drm_WARN or &drm_err to ensure that bug
> + * reports from production builds will contain meagningful diagnostics data.
> + *
> + * Below code shows how asserts could help in debug to catch unplanned use::
> + *
> + *	static void one_igfx(struct xe_device *xe)
> + *	{
> + *		xe_assert(xe, xe->info.is_dgfx == false);
> + *		xe_assert(xe, xe->info.tile_count == 1);
> + *	}
> + *
> + *	static void two_dgfx(struct xe_device *xe)
> + *	{
> + *		xe_assert(xe, xe->info.is_dgfx);
> + *		xe_assert(xe, xe->info.tile_count == 2);
> + *	}
> + *
> + *	void foo(struct xe_device *xe)
> + *	{
> + *		if (xe->info.dgfx)
> + *			return two_dgfx(xe);
> + *		return one_igfx(xe);
> + *	}
> + *
> + *	void bar(struct xe_device *xe)
> + *	{
> + *		if (drm_WARN_ON(xe->drm, xe->info.tile_count > 2))
> + *			return;
> + *
> + *		if (xe->info.tile_count == 2)
> + *			return two_dgfx(xe);
> + *		return one_igfx(xe);
> + *	}
> + */
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
> +	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s` failed!\n" msg,	\
> +		       __stringify(condition), ## arg);						\
> +})
> +#else
> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
> +	typecheck(struct xe_device *, xe);							\
> +	BUILD_BUG_ON_INVALID(condition);							\
> +})
> +#endif
> +
> +/**
> + * xe_assert - warn if condition is false when debugging.
> + * @xe: the &struct xe_device pointer to which &condition applies
> + * @condition: condition to check
> + *
> + * xe_assert() uses &drm_WARN to emit a warning and print additional information
> + * that could be read from the &xe pointer if provided &condition is false.
> + *
> + * Contrary to &drm_WARN, xe_assert() is effective only on debug builds
> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> + * or as a condition.
> + *
> + * See `Xe ASSERTs`_ for general usage guidelines.
> + */
> +#define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
> +#define xe_assert_msg(xe, condition, msg, arg...) ({						\
> +	struct xe_device *__xe = (xe);								\
> +	__xe_assert_msg(__xe, condition,							\
> +			"platform: %d subplatform: %d\n"					\
> +			"graphics: %s %u.%02u step %s\n"					\
> +			"media: %s %u.%02u step %s\n"						\
> +			"display: %s step %s\n"							\
> +			msg,									\
> +			__xe->info.platform, __xe->info.subplatform,				\
> +			__xe->info.graphics_name,						\
> +			__xe->info.graphics_verx100 / 100,					\
> +			__xe->info.graphics_verx100 % 100,					\
> +			xe_step_name(__xe->info.step.graphics),					\
> +			__xe->info.media_name,							\
> +			__xe->info.media_verx100 / 100,						\
> +			__xe->info.media_verx100 % 100,						\
> +			xe_step_name(__xe->info.step.media),					\
> +			str_enabled_disabled(__xe->info.enable_display),			\
> +			xe_step_name(__xe->info.step.display),					\
> +			## arg);								\
> +})
> +
> +/**
> + * xe_tile_assert - warn if condition is false when debugging.
> + * @tile: the &struct xe_tile pointer to which &condition applies
> + * @condition: condition to check
> + *
> + * xe_tile_assert() uses &drm_WARN to emit a warning and print additional
> + * information that could be read from the &tile pointer if provided &condition
> + * is false.
> + *
> + * Contrary to &drm_WARN, xe_tile_assert() is effective only on debug builds
> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> + * or as a condition.
> + *
> + * See `Xe ASSERTs`_ for general usage guidelines.
> + */
> +#define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
> +#define xe_tile_assert_msg(tile, condition, msg, arg...) ({					\
> +	struct xe_tile *__tile = (tile);							\
> +	char __buf[10];										\
> +	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
> +		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
> +				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
> +})
> +
> +/**
> + * xe_gt_assert - warn if condition is false when debugging.
> + * @gt: the &struct xe_gt pointer to which &condition applies
> + * @condition: condition to check
> + *
> + * xe_gt_assert() uses &drm_WARN to emit a warning and print additional
> + * information that could be safetely read from the &gt pointer if provided
> + * &condition is false.
> + *
> + * Contrary to &drm_WARN, xe_gt_assert() is effective only on debug builds
> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> + * or as a condition.
> + *
> + * See `Xe ASSERTs`_ for general usage guidelines.
> + */
> +#define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
> +#define xe_gt_assert_msg(gt, condition, msg, arg...) ({						\
> +	struct xe_gt *__gt = (gt);								\
> +	xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,			\
> +			   __gt->info.id, __gt->info.type, ## arg);				\
> +})
> +
> +#endif
> -- 
> 2.34.1
> 
