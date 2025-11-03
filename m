Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52F9CCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 13:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F43810E409;
	Mon,  3 Nov 2025 13:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJv6OK5H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B21E10E402
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 13:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762176181; x=1793712181;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HAUIWgUgzPBMDwpwVJJaPXXdRyRjyHtw8wVTn75urwo=;
 b=eJv6OK5H1EvH+cTJxrZzh9cxM8+EaPwhk0lqZaCXC3tOYErL7klMFi+6
 yNwcDSg3JzIaiqvtCeVWWsU5gAU75436S8MzM0tkZZpstEDdzK+/eyROb
 V6DZoCljE0x/clmLHLI8RUza1bxCFK4Zb04LyPGS1Cl4T3FKezTc4pdpu
 43AaqjLVJvuudvRK//VWmRMpDXB9UdgvtxhbpTXgbPjtTqf9SgVvW4iuW
 l8Co8dNZ0WCpPlcTgha70b3RCF+04I4IBoqz7dMk2dtdtB3gIUyCrZVO7
 YUUYKOE14dXTKuIc8utsuABiiLNm21E8PqbS3uhbaSu87l9h8oJCg3Q1S g==;
X-CSE-ConnectionGUID: LThG7cxcT4Wv7Y5NmqRvyw==
X-CSE-MsgGUID: ofUTgBSrQiKQ4J+aHNigFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64175139"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64175139"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 05:23:01 -0800
X-CSE-ConnectionGUID: ccPq0JcvScGVzb3jf9Jvpw==
X-CSE-MsgGUID: RLbpZjGMQHWkAPFOH4aOrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="224111255"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 05:23:01 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 05:23:00 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 05:23:00 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 05:23:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0iUfm5W6ZEsvx9Po+E/14r1XVI4DNJySMIOqPtqDgW6JDPSP33zW0PTxuncre5yQixgdAyZV8YFKOcXM+fp4ZIBFmGoG47lWhjxHaijT/K2/pbq8jT1n02B4FU2CiYJgN74+0mxUJfiZFd6nw3IhDWdDrv195p591QfUP09MKvL8P36/ydkHsAFV3GoafDKxcBL2tZg0aZ+ucfM1DCIO6TXQUNydY35gvupJLRF/EeJmpRUD3lzruwW0135AU5QiFsPeS0O8ihdLF/UpIFLfJHFJIXpHB09LVE/l64dhcYzI8Ynjd/+RKrfvrd4Vlfl4CK9/DxB6q5H7xPT0Kd+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR2bIfJ6gZIMUJRKmkjZpbTXupHApNWSv5rrr//jx9k=;
 b=TH9mBcY21E68r+hc9J5hsMR/QF5qdDzMtMRoyk3eGYEjzaIafIbT+yijht+7oOoRNNvV1mHdjkYAFSEPg4yuxH2olU8r4I+qtP7jb/dR2tO7fPOpQ+v11dFkvuQ2pdhgs+lcAibsKjYqyNQGznxVxSNoIKZlyFP7I70aT8ivdnK8RfpCEQ9t/2ip8MZMt4ts2WoiD71jTYHVMKOpwJbGXMyWRwsxLEXEiC5GhZZ3ZhmOjWfJ2WAyFNwjMLZYrIq1e/7MpIEpweSrTjwV+vatfplWmMlTK9ZwVXKeOhyfYwfbjXWPbEHstYEFbwc8aX2RN+ppbswph3c4YJJ1fI2rzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB7498.namprd11.prod.outlook.com (2603:10b6:510:276::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 13:22:57 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 13:22:57 +0000
Date: Mon, 3 Nov 2025 14:22:49 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH v4 2/7] drm/xe: Implement xe_pagefault_init
Message-ID: <aQisqd3ftphQdkjY@fdugast-desk>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
 <20251031165416.2871503-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031165416.2871503-3-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: BE1P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::18) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: c435baa8-d469-4806-5f6c-08de1adc1a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Rz7Xa40oS2fsXczBqrihue4v+GX3vPlic3F7d1lqLT/koTZsQ4QxFKrPF6?=
 =?iso-8859-1?Q?ow2AzzwcWiQlglE/3DNsco+dEU0jWe6ZvbAcGPuiTB88UeYnqilvpZ5Emm?=
 =?iso-8859-1?Q?pkBsVJwBnT3OP94VuTSmNA/r0iKvz1JhTdsG4/qnp98CXr9RYdyNEMzIZx?=
 =?iso-8859-1?Q?QgOdEo756aAoL274j70PFNlDfN6mzSFC7lljS8WeimDe+1Ly+4AxaBIi3j?=
 =?iso-8859-1?Q?6lCy4b8fLtXCj5uj43BDT5KnQN/cu/NHxepMWGJyW1N4KEpPpPiO2lKMGF?=
 =?iso-8859-1?Q?R3cZswOBXIDE/qqEcqcivwd2voj7HWVzl+aFxUApGGm5Neh//voDunXFx9?=
 =?iso-8859-1?Q?QX1KMQ4cWi5zj/UsxG29PVCfzImUErjUlWcYkbIepyOop+M8609IzqR9mj?=
 =?iso-8859-1?Q?FnC/esgjehnxz0w2MzbBkmNBcgfEUM8A1rZJYDi3lrJoZA3PUaeBmAlfU/?=
 =?iso-8859-1?Q?2pkeCVOtK2EsOi/VoXTeoNCDr+zJhcLnlFUfNUfrcb8YUQ5p01Z4tg9AaW?=
 =?iso-8859-1?Q?VlaGvPMMa6pSI82raZnHLs9xuvZvMqYoU5N/z91HkPjg+evoDb9ACijLSV?=
 =?iso-8859-1?Q?S8j0KdARq3MxjyhVCjgTa4veqvrLKEXay0CActA0iwOCM1wGxBBeNoTK4C?=
 =?iso-8859-1?Q?AhtPE0paQDSM6eJne+ADXOBD1YRWyyAB6OtLXjmw/c7AVNMVR109e/AMtO?=
 =?iso-8859-1?Q?1EPvNAhAuhMhOtr4cvm2EXDoyTmqibXtBWDiGJXemPJZm3TX1LP4NtDv0u?=
 =?iso-8859-1?Q?OuGghXTtZk9pgNnr3vkgrVj40s5H9cJHkFLqwPg4eA/GwDCRHmdD4lvd5R?=
 =?iso-8859-1?Q?pfsCoH+QWZFk1COGc0VDacDXDwbspnVrNFJST2WWPxmhVro/e6FozJd5Rz?=
 =?iso-8859-1?Q?GaF52Ch33vyoKlPF6T+YQBdDy/05vae8rWwxmtnwhTi7jJPDmznbOD61f2?=
 =?iso-8859-1?Q?yJvMhTwlZS9aNC7huRWF8RvP7bUHJ5asC9gQOEKUc8f7RQtadgkj6B5YDi?=
 =?iso-8859-1?Q?Q4IFF6boW+VI6cauHdyPveXFKZlyJ+tB/ZBahf2mXpo5KXNmY8/qjj2Psy?=
 =?iso-8859-1?Q?drzyiwf3Xy8sTsOUI5ibIDbbhsNnYSsnjK8x3gN77e45jj0BhgWWlhf6KS?=
 =?iso-8859-1?Q?ptwhPBabjBMP4liJ1tH1GC1dCXbvcXJ6JgoEHCP5O3WGp88sdiVfQiN+Mz?=
 =?iso-8859-1?Q?2BXTR2C/u1NdHzEjhgnwPTa4ZQzV53a042obbrNRxz5Wb872D78h25clFh?=
 =?iso-8859-1?Q?lpf7lE/O16Kzj94wtAEIOIs6mhtbiGCQ1fFMvjsbwJfVrcFq6ztbL90pve?=
 =?iso-8859-1?Q?+UIyR30MXwUszfDdbK3DGIQLRTbs1rpTGkaCrZw/totzQPI5WccBp4EAiH?=
 =?iso-8859-1?Q?PE2RexUHCs1rY2fOfE5miuVfN+GG9LFCC4lQxvdV8EQai56CsKUpEltdji?=
 =?iso-8859-1?Q?D1c+uV37jKIZ9vKmA+EImKT5wVkMk8GHldp9Mg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6pb0mLoLNrIgJZpNQfKBbegd8M48qSuMwauYC4QJsW1RRQpGc77Eew2DbF?=
 =?iso-8859-1?Q?Zr0Z6Q4kC9zRV/9UW7rbfS+UA7B3k9X96026qVX//uDx8D+GA6b4srghmO?=
 =?iso-8859-1?Q?oZrY+TH6VkMVbPKu7Sbgpsh6WzqibHlsZGU/5PYGuUcEgbDJzCk57rfOkB?=
 =?iso-8859-1?Q?OcL30NwbyaMWg0A9v4fIuZFNVnzIpdudzOoYCBXnJ8oFrgqPOvGMut+6AK?=
 =?iso-8859-1?Q?beyHl8a+USvt18vS7424d1/OlKWeAjZILEejOpLFSFdNkczWL7JhcpPxqn?=
 =?iso-8859-1?Q?Sah2EkGWQWuzWUN8MKqDlNY269BEQHUJGsjMEqYo6ncKXP0ijV8l834l+v?=
 =?iso-8859-1?Q?cLs5FbrbVV3cnyxpVS00wFU41SL5vNJ35Xfxg/AcC09MHS6J+sqPSaTzOA?=
 =?iso-8859-1?Q?4lCLnALAeaX6rNvZzFCLjx0gdP8m/bsBB92cBoqupfp+jAi7Yugljp4XiC?=
 =?iso-8859-1?Q?+4M+FN3oxjc896L0VEjIWqwtAHKl3njanA1ghNRocvT+UESvZz7YQQJpkh?=
 =?iso-8859-1?Q?uwXOjmEsgw+L85qfuR4aVQFvtAVP1Ib99bmMZPMwghiqSbsbrMuXC3iTMH?=
 =?iso-8859-1?Q?qAHAJeMWMt7naeDF0DZku1gi/dXlrbizzCnzZSDIhnd0qYm5AiwLXc9pR1?=
 =?iso-8859-1?Q?LnuAbwTw/Si60dE/X6BRUZvdsrW57Yh1Gz39XGOi/c27pg1P9gqG43a1yP?=
 =?iso-8859-1?Q?ZlXI2BFocLDg+PQfHYLrJSqzviJHlOHK5dqZyjS3mqdSugw7LIQpDncBB9?=
 =?iso-8859-1?Q?Zead19/8lxN+DUW3m/2EJqVwhiLcN3XjReVrgQ5s5IWumEBC168bsAoso2?=
 =?iso-8859-1?Q?9rbh4QQmYbMBYW71h94Ma7a039bj36wJQSUkjB6Ot58pGi34s/qHWKyJ/x?=
 =?iso-8859-1?Q?qvRutpGuPuPqUC+W2APcpsbYBG2NAFcjmBoMkV94k4YmYLYJnVuO32wokj?=
 =?iso-8859-1?Q?Y928QaLz4Bj/seBCA1kEE49iPtC6y6NbCpc539MIb0E3WSNAIv/X7GCkEo?=
 =?iso-8859-1?Q?dvPZxEigjic60Ql1O7DMIQxnylg7GIYkxb9wue65BA3ACK3sGqyauWXbwe?=
 =?iso-8859-1?Q?Zozm8QHwUUD9m4FIRP1ZKOxauPY1TT7YSqBf9XjLqH6GsG7yb6f5WnL95k?=
 =?iso-8859-1?Q?iM0mnW40YCzKHZkvmQM9s14EU6p/ZSWjMbmVpzbEKLI5+p86g1KkOn83c2?=
 =?iso-8859-1?Q?l0h1sSiCez0v05OcPxrKgw0axZkZ78iUvXQ3Y3q/Ni6h5Bp/zj7rHWwM1W?=
 =?iso-8859-1?Q?8NWPWHl/nVht1ktPiAj2Ouu3XMZqFupbEiR5dQ50kmGF704q6rV32G/tyo?=
 =?iso-8859-1?Q?0+P9zwXMDQng68NWPKOnVbqn+Z6tjO5Yi1/k1Gwd/bhd/ZGdbOrG9cr23e?=
 =?iso-8859-1?Q?OWmMTY5IoIWmnMvr6DS6wlfWC08ctadJqAo/U+WGBl+ngIxvKEDAmsKcNf?=
 =?iso-8859-1?Q?E+bWBktU63jLoTNoCWeGBxX452J3QZC+2Ygu2QwJvRXoGElxykPYwi0Hla?=
 =?iso-8859-1?Q?wdgmzWl3blyuBQryb09hnpc86+GNsr9nWSt4fPmrgI9v0vFRBWa3FsYaRY?=
 =?iso-8859-1?Q?/TPRLd3Cfh0duI8ueC47knE5PHS2J0fFu/SDn+/9D8q+dxoEaDDjB1SoOL?=
 =?iso-8859-1?Q?WmSpN9rckedY3TG/s7q1iV4PXGgV3yzkygsVOH4TGxvcezMwcGkTbsRg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c435baa8-d469-4806-5f6c-08de1adc1a81
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 13:22:57.6184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWW9q8VRMf2LR5RPeF2IZ3V9i/R7W5wId/Vgf5wexph+drQhNNhjXWmniS/ye9vXiO24BSMScW3tCyy3Nn3Nt89psYc1AgjZJJ3BaFc8vdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7498
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

On Fri, Oct 31, 2025 at 09:54:11AM -0700, Matthew Brost wrote:
> Create pagefault queues and initialize them.
> 
> v2:
>  - Fix kernel doc + add comment for number PF queue (Francois)
> v4:
>  - Move init after GT init (CI, Francois)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  5 ++
>  drivers/gpu/drm/xe/xe_device_types.h | 11 ++++
>  drivers/gpu/drm/xe/xe_pagefault.c    | 93 +++++++++++++++++++++++++++-
>  3 files changed, 107 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 47f5391ad8e9..4238ba28fac7 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -52,6 +52,7 @@
>  #include "xe_nvm.h"
>  #include "xe_oa.h"
>  #include "xe_observation.h"
> +#include "xe_pagefault.h"
>  #include "xe_pat.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> @@ -896,6 +897,10 @@ int xe_device_probe(struct xe_device *xe)
>  			return err;
>  	}
>  
> +	err = xe_pagefault_init(xe);
> +	if (err)
> +		return err;
> +
>  	if (xe->tiles->media_gt &&
>  	    XE_GT_WA(xe->tiles->media_gt, 15015404425_disable))
>  		XE_DEVICE_WA_DISABLE(xe, 15015404425);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index af0ce275b032..7baf15f51575 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -18,6 +18,7 @@
>  #include "xe_lmtt_types.h"
>  #include "xe_memirq_types.h"
>  #include "xe_oa_types.h"
> +#include "xe_pagefault_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_pmu_types.h"
>  #include "xe_pt_types.h"
> @@ -418,6 +419,16 @@ struct xe_device {
>  		u32 next_asid;
>  		/** @usm.lock: protects UM state */
>  		struct rw_semaphore lock;
> +		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> +		struct workqueue_struct *pf_wq;
> +		/*
> +		 * We pick 4 here because, in the current implementation, it
> +		 * yields the best bandwidth utilization of the kernel paging
> +		 * engine.
> +		 */
> +#define XE_PAGEFAULT_QUEUE_COUNT	4
> +		/** @usm.pf_queue: Page fault queues */
> +		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
>  	} usm;
>  
>  	/** @pinned: pinned BO state */
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index d509a80cb1f3..43b26e7d090a 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -3,6 +3,10 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt_types.h"
>  #include "xe_pagefault.h"
>  #include "xe_pagefault_types.h"
>  
> @@ -21,6 +25,71 @@
>   * xe_pagefault.c implements the consumer layer.
>   */
>  
> +static int xe_pagefault_entry_size(void)
> +{
> +	return roundup_pow_of_two(sizeof(struct xe_pagefault));

It seems this is missing:
https://patchwork.freedesktop.org/patch/667318/?series=152565&rev=1#comment_1230914

With that:
	Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> +}
> +
> +static void xe_pagefault_queue_work(struct work_struct *w)
> +{
> +	/* TODO: Implement */
> +}
> +
> +static int xe_pagefault_queue_init(struct xe_device *xe,
> +				   struct xe_pagefault_queue *pf_queue)
> +{
> +	struct xe_gt *gt;
> +	int total_num_eus = 0;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id) {
> +		xe_dss_mask_t all_dss;
> +		int num_dss, num_eus;
> +
> +		bitmap_or(all_dss, gt->fuse_topo.g_dss_mask,
> +			  gt->fuse_topo.c_dss_mask, XE_MAX_DSS_FUSE_BITS);
> +
> +		num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
> +		num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
> +					XE_MAX_EU_FUSE_BITS) * num_dss;
> +
> +		total_num_eus += num_eus;
> +	}
> +
> +	xe_assert(xe, total_num_eus);
> +
> +	/*
> +	 * user can issue separate page faults per EU and per CS
> +	 *
> +	 * XXX: Multiplier required as compute UMD are getting PF queue errors
> +	 * without it. Follow on why this multiplier is required.
> +	 */
> +#define PF_MULTIPLIER	8
> +	pf_queue->size = (total_num_eus + XE_NUM_HW_ENGINES) *
> +		xe_pagefault_entry_size() * PF_MULTIPLIER;
> +	pf_queue->size = roundup_pow_of_two(pf_queue->size);
> +#undef PF_MULTIPLIER
> +
> +	drm_dbg(&xe->drm, "xe_pagefault_entry_size=%d, total_num_eus=%d, pf_queue->size=%u",
> +		xe_pagefault_entry_size(), total_num_eus, pf_queue->size);
> +
> +	spin_lock_init(&pf_queue->lock);
> +	INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);
> +
> +	pf_queue->data = drmm_kzalloc(&xe->drm, pf_queue->size, GFP_KERNEL);
> +	if (!pf_queue->data)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static void xe_pagefault_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	destroy_workqueue(xe->usm.pf_wq);
> +}
> +
>  /**
>   * xe_pagefault_init() - Page fault init
>   * @xe: xe device instance
> @@ -31,8 +100,28 @@
>   */
>  int xe_pagefault_init(struct xe_device *xe)
>  {
> -	/* TODO - implement */
> -	return 0;
> +	int err, i;
> +
> +	if (!xe->info.has_usm)
> +		return 0;
> +
> +	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> +					WQ_UNBOUND | WQ_HIGHPRI,
> +					XE_PAGEFAULT_QUEUE_COUNT);
> +	if (!xe->usm.pf_wq)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
> +		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
> +		if (err)
> +			goto err_out;
> +	}
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
> +
> +err_out:
> +	destroy_workqueue(xe->usm.pf_wq);
> +	return err;
>  }
>  
>  /**
> -- 
> 2.34.1
> 
