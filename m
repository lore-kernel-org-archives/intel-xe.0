Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08A6C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 18:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E02610E0AB;
	Tue,  8 Aug 2023 18:37:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465E910E0AB
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 18:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691519825; x=1723055825;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AcChgYQfxaU7NsF5zEUiXfDKqhZC+9bZCcGN6/ejFfk=;
 b=Rf+ntwFUDbviB7j7JavHXIv5CZ5m7bkJ45ZwM9znrrisdbHMtkYWvrr4
 y5xGNNO9FQnyOCKbSx6pTFulreXgvM9s8QT60M3zW8+FaexugMkgCHn9o
 YEZ+Kw0Lj2S4HmrtdJGlYEQQ6zIf8akK69FE5CJCcJ92t6lhd6BqMYnzZ
 hfu+WGpuC94lVPyC4zNc3iS6wnnksUzffEKkhbgWXmC26oWKKn97BEp8V
 s0arx6SAg9D/SV2I64A5IU3J35uFk+bptTYrc26HVMcfzf30gJmMj5JV2
 dB/8pGqVESe+Gyjwsx7cEz9Xc6Dhac2/hUa2dCdVLbJmxRfp5C2iF+93I g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="351223018"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="351223018"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731514442"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="731514442"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 08 Aug 2023 11:36:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 11:36:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 11:36:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 11:36:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiHo2mD2Umi7VwErkX8iiBli5YUHoL0rY8uE47NgEJ5DsWUIqlDMDpCqN6fu8cZWYYvlpmjBVoG0PW/IVucPQJ57UK+InnysVngVsnGIKrgM630NKySiwAfm3I3zqq0Vi6rS9PkPcfLRYvGpoDus+v/N0de35c7ifRbEdYXmzT1QDmy9X9OqPKqw1AdWKoeM7zt3umH7LRbgcY4bBVjWmh+KwI4Y8zWMIC7uObhfD2poHZUvzkXRXh+FbI+f8SammZvvarZqnZeu294Hts0XnXVrLLDukyOZ1zLHb2+JxF7msqPQq5DYzBuj4vrX3lCUuoGs9WkEX9v18rOrpDqPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyJtGZJECyzW+rbmEEC9QeVd/xW307ImDb7C3tFmO8o=;
 b=W9qqweJQlpmr4IJzPFcS1CFqk9GIl8VgfYz1D+CIzdM/FwvMUyysq21epoGEx82JAWDfDY+RE1+J2XGeW0kp04ZHaAAXZQ2rd+FCGYldgd1lH2iJltb6gn1P7hoV9k2GQq4c6xy4kiJ5/bBXaJIWmneDB5qq7BFIRnbRFnVCp3prw4Tf8sWEbrcmhkiZNx4fKGVH78AfoIP8DJWVQfNLgmK5iA4ZrB/qvNW0WItqk6LzRLG/6bBxpYuQxP+FmYJGnMvLLsXH6KqJJuk4oGKKgroHu3ImAGOZ191NRi/HZjRzldS1fNnl9C+fggxW0yQg5KIbfw3vZwRLLH4ZrBKd4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5414.namprd11.prod.outlook.com (2603:10b6:208:31e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 18:36:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 18:36:42 +0000
Date: Tue, 8 Aug 2023 14:36:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZNKLNaxJnVSvqzVO@intel.com>
References: <20230807173446.2039-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230807173446.2039-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:332::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5414:EE_
X-MS-Office365-Filtering-Correlation-Id: 962af87b-455e-44a7-be19-08db983e68c4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mjYiJdAcb1A5+TrqYTfhiZePgndurWwGsB2KD18TSmvWUkEDL1YwXbWTVXX9QLnui+KEer6pSjxOGFV4hLiU06Lgc2tlAw4jzlv5CMev/TmSja+5qymRhdktonteU5CnkVbHnATmFUo7CZyzeb8FZ95o1/XEPyhdC8W72ZSjgEW/Wts/ELxpzSMc160obS1J0EyAW8ZPLdCvM6oY3H+vja61/aVLWuN4DiHlbB1DMgQJXYI9ycogYi85jQ6hhSzGfOtkcxVI0Nsyog9dnLQ7lKbU6Nzd6BBA8xqpz6IjqIXZZ7nonm0PPwZ550j6Ghg/pelIwCmGRc0/f3BQ3GnuzfBpuOroT3h2ziIh4mJ4EY1yfVroD/5CmQJcrULuFKOxt/LaSXdn5enz27zva5awKSAXaoJw7+3Qs30LVa6yNnOfBUPlV4eEwKH1Mb68aGDSnueZjg8xDBNDOCHqbhIB6NgH5YwLDK55zBfJkqk32OGrYPG9lJQGpzA64tpmET855bBp+7moC0+frPSeVx7JwHqVE9S+v8CfspUsbbq6koAv7TEGPOAinCuhfA0ccJv6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(1800799003)(186006)(2616005)(6666004)(6486002)(316002)(478600001)(6512007)(86362001)(82960400001)(26005)(36756003)(107886003)(6506007)(41300700001)(5660300002)(44832011)(6862004)(8676002)(8936002)(37006003)(38100700002)(54906003)(4326008)(6636002)(2906002)(66476007)(66556008)(66946007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hYom4sTAbUMrK2ztlPvzeuRv6VHkGq8eIMhRbZyhJtR0QmWL3LcAU9Kx8c?=
 =?iso-8859-1?Q?yBbJgiawHpePQ1MlTAAu05oJSfOCZIKGWtUH8XG5pKrjk20cqncIUPhPTE?=
 =?iso-8859-1?Q?1041EtAjV5v+4BA0KdJVnhe6Q4Z4xozFk+qyXy8eZ63AqSa/RerjaONayU?=
 =?iso-8859-1?Q?BkDC8ZN4UREXZnTt8esZNQUwW0iOM3aiQr2PpG1z33i9oUwWpVoHqbbYNo?=
 =?iso-8859-1?Q?Gxc0XlL/+smgHM7DAzOM9zx3rYm6CvmKcW75EZA0782NXLli9zB5KbYCax?=
 =?iso-8859-1?Q?jUnlCkueUDYjvqXI3ecp5a6TpgHPzi3PdTPylqUX46QxUN8jo99s1f5RKi?=
 =?iso-8859-1?Q?YsmV9c7RaduwPreIl427AC3s/C9aqxyCLxjsDR+ERPO1FoUMg89SYvizZv?=
 =?iso-8859-1?Q?ufWqghDriEc7Q1habCGTABBcyXgFYiLydp9yHTW4pg+u8a4DzLwokrFCsg?=
 =?iso-8859-1?Q?d8XgDDT+A/bBUNhUxMeMbKEmndRAAj4/xChv6DA0YEC2K6HFBukDSQQ3cS?=
 =?iso-8859-1?Q?xxNNW5v9W4zVwCqoc+/HJ6wflSb2zHCb6JZ6ymX7DWq/+dYb5LqSh+jcTP?=
 =?iso-8859-1?Q?ypB4IJ7bXZ0Wq1eysDfIPvJPFkZG3JWqXU2fpDdgkeKyukHEUcLxQuzd7r?=
 =?iso-8859-1?Q?dQpQgivQvWe0VVUW7y/0EoH8Ac0toE8l4zJn7QQu8JcU4fT0ppeujkl53L?=
 =?iso-8859-1?Q?vMVXbkNonC6mbSmt2yFkjD2BzgG0GGAlAJj3sywU3/Q9CqDFU9ADsZkq9y?=
 =?iso-8859-1?Q?pjogKoZrgCSdgP3SQDd8hJo0B+tQ9mC8MIi0IWP6QyzVZ6D78Nh+mc6N8D?=
 =?iso-8859-1?Q?fbDgmrWOQ7Y7PBnquvtXbm/8Y8zKcK+fRixkuqRi304irI4Fnq9zB83yAs?=
 =?iso-8859-1?Q?3xLiwn94Kj1McYSKXBB9qBdFttcf6sOYsY1qGoAZG95P/TeES/tk1DGtEz?=
 =?iso-8859-1?Q?7ZXg2MMaHqumHftICyKgy5Wr7myajdmsdQ3VPaPqhFV7nR5lS1wHi8XHKh?=
 =?iso-8859-1?Q?F/subxjrwIJxe3vZeVn7ilGokPp2QnJd34TE6v+vSwP+aZUpgejpSBKpzQ?=
 =?iso-8859-1?Q?kzjIacAtK+g4x4e9yKmN7QpM9dy0PUzjXxmzqtjjKb8iI+VKPBQ0Mdi8Ne?=
 =?iso-8859-1?Q?6RprLXPQDhaIXF9iDCQad+vxHw8MO0fsv2vI3ASHQ9/QZ/mHd1phvqwoOS?=
 =?iso-8859-1?Q?xLJaZ3jolTbHoHmr6k7WiPviYU4ahXnr4niMOKQHmAp7wOZVn1Jdmtg5yI?=
 =?iso-8859-1?Q?Q/kK454UPMn8ri66o8AjVOejkhBvAt8ORQJ2r0WadE1ftuRx0VA2sz5AI5?=
 =?iso-8859-1?Q?BI5M+luXSPneAfiON3HX7hHBUS5OtZ04baqSmv3uLx1R65mGFhRUt6/10l?=
 =?iso-8859-1?Q?F8n3WJVHwSqs3u0xoOUGuRLio2wClHC7VD5xsCEw71uoAFK2GTF3L+QED8?=
 =?iso-8859-1?Q?yJAA/bu/fE1NkI5aKUOUjIb4l6PVU4+ANJOGN5u32kjMuJf8dEo7vbcIkx?=
 =?iso-8859-1?Q?3UC30YUkBvHcTcq52h2gJ2UIHrT6L/EPgs+SG5yFi5NcZDKcT/ax5XvKwe?=
 =?iso-8859-1?Q?u2bVEA34OmRLW6/k6rhlR7cGppWhBuLBCYxKNn3eNiWREscI5rr0ak7IWS?=
 =?iso-8859-1?Q?sNhqgC+ZdzNjQJYKrkJA/+NOPgjoyUM9zf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 962af87b-455e-44a7-be19-08db983e68c4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 18:36:42.0702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5aVRu4k3SnMyCqW00itkJhu1YCtiECXLU20Xxvp6dK0m0udYGRn180nYUYvImJhpq+rxrx4ztQh0mqXslxRHsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5414
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Introduce xe_ASSERT macros
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
Cc: Jani
 Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Aug 07, 2023 at 07:34:46PM +0200, Michal Wajdeczko wrote:
> As we are moving away from the controversial XE_BUG_ON macro,
> relying just on WARN_ON or drm_err does not cover the cases
> where we want to annotate functions with additional detailed
> debug checks to assert that all prerequisites are satisfied,
> without paying footprint or performance penalty on non-debug
> builds, where all misuses introduced during code integration
> were already fixed.
> 
> Introduce family of xe_ASSERT macros that try to follow classic
> assert() utility and can be compiled out on non-debug builds.

I agree with other folks that all capital letters in the macro
should be better.

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
>     graphics: Xe_LP 12.0 step B0
>     media: Xe_M 12.0 step B0
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
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_assert.h | 160 +++++++++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> new file mode 100644
> index 000000000000..7ea295b7091c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_assert.h
> @@ -0,0 +1,160 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __XE_ASSERT_H__
> +#define __XE_ASSERT_H__
> +
> +#include <linux/string_helpers.h>
> +#include <drm/drm_print.h>
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
> + * of ASSERT macros that try to follow classic assert() utility and can be
> + * compiled out on non-debug builds:
> + *
> + *  * &xe_ASSERT
> + *  * &xe_tile_ASSERT
> + *  * &xe_gt_ASSERT
> + *
> + * These macros are based on &drm_WARN, but unlikely to the origin, we disallow
> + * use of them in an expressions since we will compile that code out.
> + *
> + * Note that these macros shall not be used to cover known gaps in the
> + * implementation, for such cases use &drm_WARN or &drm_err and provide valid
> + * safe fallback.

Here we could put 2 emphasis:
1. Same text as you have on both macros below stating this cannot be used as conditions
2. Also highlight that in cases where performance or footprint is not as impacting, we
should use the regular drm_ variants to ensure we get meagningful bug reports wihtout
having to ask the user to recompile in debug mode.


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> + *
> + * Below code shows how asserts could help in debug to catch unplanned use::
> + *
> + *	static void one_igfx(struct xe_device *xe)
> + *	{
> + *		xe_ASSERT(xe, xe->info.is_dgfx == false);
> + *		xe_ASSERT(xe, xe->info.tile_count == 1);
> + *	}
> + *
> + *	static void two_dgfx(struct xe_device *xe)
> + *	{
> + *		xe_ASSERT(xe, xe->info.is_dgfx);
> + *		xe_ASSERT(xe, xe->info.tile_count == 2);
> + *	}
> + *
> + *	void foo(struct xe_device *xe)
> + *	{
> + *		if (xe->info.dgfx)
> + *			return two_dgfx(xe);
> + *		return one_igfx(xe);
> + *	}
> + */
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +#define __XE_ASSERT_MSG(xe, condition, msg, arg...) ({						\
> +	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s` failed!\n" msg,	\
> +		       __stringify(condition), ## arg);						\
> +})
> +#else
> +#define __XE_ASSERT_MSG(xe, condition, msg, arg...) ({						\
> +	typecheck(struct xe_device *, xe);							\
> +	BUILD_BUG_ON_INVALID(condition);							\
> +})
> +#endif
> +
> +/**
> + * xe_ASSERT - warn if condition is false when debugging.
> + * @xe: the &struct xe_device pointer to which &condition applies
> + * @condition: condition to check
> + *
> + * xe_ASSERT() uses &drm_WARN to emit a warning and print additional information
> + * that could be read from the &xe pointer if provided &condition is false.
> + *
> + * Contrary to &drm_WARN, xe_ASSERT() is effective only on debug builds
> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> + * or as a condition.
> + *
> + * See `Xe ASSERTs`_ for general usage guidelines.
> + */
> +#define xe_ASSERT(xe, condition) xe_ASSERT_MSG((xe), condition, "")
> +#define xe_ASSERT_MSG(xe, condition, msg, arg...) ({						\
> +	struct xe_device *__xe = (xe);								\
> +	__XE_ASSERT_MSG(__xe, condition,							\
> +			"platform: %d subplatform: %d\n"					\
> +			"graphics: %s %u.%u step %s\n"						\
> +			"media: %s %u.%u step %s\n"						\
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
> + * xe_tile_ASSERT - warn if condition is false when debugging.
> + * @tile: the &struct xe_tile pointer to which &condition applies
> + * @condition: condition to check
> + *
> + * xe_tile_ASSERT() uses &drm_WARN to emit a warning and print additional
> + * information that could be read from the &tile pointer if provided &condition
> + * is false.
> + *
> + * Contrary to &drm_WARN, xe_tile_ASSERT() is effective only on debug builds
> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> + * or as a condition.
> + *
> + * See `Xe ASSERTs`_ for general usage guidelines.
> + */
> +#define xe_tile_ASSERT(tile, condition) xe_tile_ASSERT_MSG((tile), condition, "")
> +#define xe_tile_ASSERT_MSG(tile, condition, msg, arg...) ({					\
> +	struct xe_tile *__tile = (tile);							\
> +	char __buf[10];										\
> +	xe_ASSERT_MSG(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
> +		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
> +				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
> +})
> +
> +/**
> + * xe_gt_ASSERT - warn if condition is false when debugging.
> + * @gt: the &struct xe_gt pointer to which &condition applies
> + * @condition: condition to check
> + *
> + * xe_gt_ASSERT() uses &drm_WARN to emit a warning and print additional
> + * information that could be safetely read from the &gt pointer if provided
> + * &condition is false.
> + *
> + * Contrary to &drm_WARN, xe_gt_ASSERT() is effective only on debug builds
> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> + * or as a condition.
> + *
> + * See `Xe ASSERTs`_ for general usage guidelines.
> + */
> +#define xe_gt_ASSERT(gt, condition) xe_gt_ASSERT_MSG((gt), condition, "")
> +#define xe_gt_ASSERT_MSG(gt, condition, msg, arg...) ({						\
> +	struct xe_gt *__gt = (gt);								\
> +	xe_tile_ASSERT_MSG(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,			\
> +			   __gt->info.id, __gt->info.type, ## arg);				\
> +})
> +
> +#endif /* __XE_ASSERT_H__ */
> -- 
> 2.25.1
> 
