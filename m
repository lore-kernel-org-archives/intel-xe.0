Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709BCC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 16:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1956010E170;
	Wed, 20 Dec 2023 16:56:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44C710E170
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 16:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703091371; x=1734627371;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=R0JqXTDEHd+K5wC3nGCos4EKlPmkQFNGp7pVA+iussA=;
 b=L4xQQAZCx0Nrd/BJ2t6/EuLvnO6LuGTrdGI5gNKoBPvd6xCsKr1y2ycI
 Q4Q8hZJdNjAl68N/7NeDKwIHQ8x0rYXsU3Y5jsMzfz3TPfvjMWFdCIGpG
 +9JRcAeF67qR6NC23htILYCVLbOEV4+B9z5l+LKBsalEZl0WBQy8iyOhg
 KTPLLaLzt0MLQeJn59O1vDvHWaifqyo32bUM8OHzNW2k1ZGaZQEksO1DI
 7XEQ73BqQ6Y/wNLNFdQdMhVMeaWxwcpSjSNT23q3mvrJdB+KJ8FUZFzoL
 bdkf8Jsa4Ndj6U9fNo5lU1uz3GvvBPeYjb1719c8WIfCUT1o5t6MLdoZY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="375331451"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="375331451"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 08:56:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="894766967"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="894766967"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 08:56:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 08:56:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 08:56:07 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 08:56:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAOl67tI06dMT+NIO002j0lyThG5ypIqN9DO7XVf+F1lkON2iW+rCIJrN8aybU1ml9GLpCX1PwXHy8ZTbEm5LGLX1wDXfT1Ju5fSMTbqkD9VKxTfSoH9FEsXFCmvw+F6SBQnFXyYpgFpak/fTJgn9c0iTvCsKiNbUJ50OHoOILbDb7OukyV0g2yxnA3KK9V+M0pIVtY8kvy2VjTBiUylU/HEnMlPiZij81gLZlzD92k/GmA8bamtQGW3iWva3v7RXJiOXp1Bc/y20CugJ5sJcpWBFGLxK8dR3TzMV6LJ7o/ohC5zinplMEnHc7uOe1k0XL6R0rxotu8HIbn9/qGchg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZcjtBRHcCY0Ge4jk8hTErNIuGDQVwp8CY8Qtt1tdBM=;
 b=VhLiX5arBADRa6ST8Xe9sTEajikSgoqFC2DY3vlDL3Aqlp3LLbw/4hEgMhwY9Gu3a9PWdhQU1pjiSqsQEpr+vN5cQcsu5I4cemK4jbun9C7j2c2JhZs2tHVZFURkA0DXG0v15RrUKyWCAhZKRtNV8UsfuLrUiCCoYuCJvjjOUY1cezZdmXL/x2W9vop61u5dtG+R+LobeSQbEI12im4zmtXlAL6x23EGzjXAnN7aA4URoS+2BnYMN2dzMDYC5/D3WiE4eC6QQ9xIVty5E1Av3JxK0BtESyW2cclCkYkq5TwT+uLsoSH64+5N2zFhdI45213HjGQ9TFe03E1h5yAZSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 16:56:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 16:56:04 +0000
Date: Wed, 20 Dec 2023 11:56:01 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Add base balance sysfs attributes
Message-ID: <ZYMcoWPtLEuJST4w@intel.com>
References: <20231219100711.645011-1-sujaritha.sundaresan@intel.com>
 <20231219100711.645011-2-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231219100711.645011-2-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4952:EE_
X-MS-Office365-Filtering-Correlation-Id: d97a0a9b-8399-4ac3-7cda-08dc017c8daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3wLJ69rnTxiGStZHsLethsunjjC9Ouq+5qXhC+077yTg4EV1Muhv8GLdnkNno+KOmpGlmBI83CXBFrhfuXvVhhX+/kM0+AZfNMylvB9qO2ME5QSfg2CUqSxufihkxWDQQXuxS5oiNSfeTQf09WzNStPj9lLIWsI/SsTpsgXwzkZK30SDDKXF4YIEvwvIZpys+By7v46MiNC7PPyI2GVHyLEMm+iU6W/SQyWnlX5YPJPG5X0VMoRLxkGg/8DTWfwfTvLW73H3LwrXG+YcYULzqst85UtQwJRpeV1QURkzXuzEwSoACfFNPHE8OQvlCn8eY4GH/b2tx/Dgaj/mz5IO+rGEZYmvrmqv5w62B4gXpl2RpPv+v7+XF3f4RMuHkaSrtj+ipK2uHPxudvOOQ+JyJacnCk8mZ8GHKT7Uezl5XtDca6aQZXCmZOctxVPHykkt3K2TbC3gnmEGeXtAv4cG19gyQt0mNJM/GzKwHhCKH11ksrAUoYKs42D+IUaQLVaNEkdH1Ug8HVH6RqLIbBCdu5h74YF1xC/ieTbk6xGz8vrALFuDrqOdqMbe28jEg/3Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(478600001)(6636002)(37006003)(66946007)(66556008)(66476007)(316002)(38100700002)(82960400001)(6666004)(86362001)(41300700001)(6506007)(6512007)(36756003)(5660300002)(4326008)(26005)(6862004)(44832011)(83380400001)(8936002)(2616005)(8676002)(2906002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JR1i4Odyg6Cnyyk3VW7DchQt52tw/gHw9gqbMjEjND5MkPurIsR6+g1j0B?=
 =?iso-8859-1?Q?8ykyQ7nN/pLFg3APs2YZSFib9Xv/NTzBDf7ZazEqLJiKGrLgMqC3kXEiJl?=
 =?iso-8859-1?Q?4ylV9Oajarmu1Nesi1gWo/lUQKL3/hQpJHB14lv89SUcYayNktiCp3hPjW?=
 =?iso-8859-1?Q?FrSjNfnTaXXsqobkbDnzIlL10oD1jM9iZwh3GxZ9hRzqvZ+55OzyM+a5Ur?=
 =?iso-8859-1?Q?UpgsfRcHDMZUcjMx6qcLmVAROyMhZqQ92MAn/YvB0jHRaLn1bRMO2wWh7Q?=
 =?iso-8859-1?Q?jn4MpJTlZyy2MxsCmMVv/ZfcmGH9MHvg3fJyY9YphgGaFLQXXg4nw8/Y1Z?=
 =?iso-8859-1?Q?EYqU/Hcx/iu+qnirPX0Hd+crmpYfav1+yBBaGtjS5a9JDYjIUFmaUpB4YN?=
 =?iso-8859-1?Q?4niU6VPLoXkV3vq/9iqrHkfyYlf55SAO0aSGhxOMm0Om0a9sFajI0KYvMj?=
 =?iso-8859-1?Q?YYL05E1qa5f32341BJ37edJwGVbQFKvAJXY9C/yZ2TMuzflCTGFlNH1Vye?=
 =?iso-8859-1?Q?y1s4S5MKYhResczTUCuUa6GrQIf9ylAbSBZStiDivVLOYpI1rHNLZoFm2Q?=
 =?iso-8859-1?Q?afnXpoZ9JrvImr7iBbDS2YZZuSxDA3MprcwG7rIu6BEEfdyBn4CfWtU8h7?=
 =?iso-8859-1?Q?g5GVbhr0CTzOHhD+5o4S2CAUmZVNCdEi8IHl+rdm7ghrAbKlc029k15M+B?=
 =?iso-8859-1?Q?SaXGdllgb5kKEfn3oE3BWemFh0Dn4yWw54t8xMkV/n2l31BDqDZm53htaQ?=
 =?iso-8859-1?Q?z1mrZ1rfvIQAMnDIqrJHDfoRIBOkh1lRolMDY6K63cSYMXHsRSo8KOJrjp?=
 =?iso-8859-1?Q?qlvTA4kJg/wy+7LQiFmpcyPE3IwjKlpFxnCfhc3CdaQzkibAq4Ev3LCgYf?=
 =?iso-8859-1?Q?h0GJzc+XZTlcbP6DSfPJ6ostZIBizNTDSmLrwZ9AptIr9zctUPZ5x5fWfl?=
 =?iso-8859-1?Q?9T8dOK4AanVhnz7Upl1xmyBQbubQ0obDyZxBEVm5CpMbfu2mZQYMLXfz54?=
 =?iso-8859-1?Q?gn3LvvAIFHmU+2os3GpvgIpY2wL/AxaPJTdlrk2NPU8TTOY/S7Fo48MAD9?=
 =?iso-8859-1?Q?cewD38/6u1TX+13vduB4Bqx6noPAZfio9TsinYwhZmlPezJAFfUFoqLrrR?=
 =?iso-8859-1?Q?hTpkppbCtnTYdyXEZ7jgotVUoyt59Q6mS+ngTw909dTBXJgtEvTabvtNZE?=
 =?iso-8859-1?Q?DiHsfzhDezy6nH2evw5ylEDLHWgoYfQ59Aqdbmf6ZxvfqbgJ+ZHV2EujCt?=
 =?iso-8859-1?Q?dlplhAytkgLJo0llD5VA8ebThzy+ea7cFamfluxwKi3aRlP1YbPr1+4c9n?=
 =?iso-8859-1?Q?bJASFaG2zrpWDN0wtofbDf04Gy/pq0uWTTyAVk2pwKvl/L+BSoXELMoiQR?=
 =?iso-8859-1?Q?ScPdRBv6FG1qWJHnRHfKiXTvIBDOGtKCstSuVfWaCikfVpvANg6/MdG4IL?=
 =?iso-8859-1?Q?hj2MBsN3/p9QLGEmmRt8pw5VR2XhKUNaV61tRrEH0ZBK2QZsYZY7OsX1xy?=
 =?iso-8859-1?Q?2CIEkmtR6lYoPfS7s28MD9PgwlI7nbrHolxM47MzL2uJgIZy2KpyKpetOr?=
 =?iso-8859-1?Q?zlXYbdzHnNIYyQ6YOtl69C10ZFwoCHaZgTUqDpUnuekUz5MR5k7z0sIbjz?=
 =?iso-8859-1?Q?u1ulrd4KmSWfgpR3ypKCQLIjXNhezjtY1VkSzscGihj2ov5pR7z05BcQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d97a0a9b-8399-4ac3-7cda-08dc017c8daa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 16:56:04.6814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2cWaDTEwXptVpEUCVZ3X6BZ9dV7zL/5ri+69t1qEJ9jvySgCf0bi3Gu28gDhgecBXMqEMFogXTMD4cziCs2MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4952
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 19, 2023 at 03:37:10PM +0530, Sujaritha Sundaresan wrote:
> Add sysfs attributes for base balance in gt.
> 
> device/tile#gt#/freq0/balance
> 			|- base_freq_factor
> 			|- base_freq_factor.scale
> 			|- base_rp0_freq
> 			|- base_rpn_freq
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile              |   1 +
>  drivers/gpu/drm/xe/xe_gt_balance_sysfs.c | 181 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_balance_sysfs.h |  17 +++

I always have a mixed feelings with the _sysfs sufix.
I believe we should only use that in the case that the only
thing that that component is doing is to provide and handle
the sysfs objects themselves.

if it provides key hw functionalities, that should be
the main part of it. Sysfs is just a consequence on how
that is exposed...

like xe_gt_idle is better then xe_gt_idle_sysfs,
I believe simply xe_gt_balance is enough here.

>  drivers/gpu/drm/xe/xe_gt_freq.c          |   3 +
>  drivers/gpu/drm/xe/xe_pcode_api.h        |   5 +
>  5 files changed, 207 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_balance_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_balance_sysfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 53bd2a8ba1ae..64bfd3d6eab4 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>  	xe_gt_mcr.o \
>  	xe_gt_pagefault.o \
>  	xe_gt_sysfs.o \
> +	xe_gt_balance_sysfs.o \
>  	xe_gt_throttle_sysfs.o \
>  	xe_gt_tlb_invalidation.o \
>  	xe_gt_topology.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt_balance_sysfs.c b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.c
> new file mode 100644
> index 000000000000..054b90ca128d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.c
> @@ -0,0 +1,181 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include <regs/xe_reg_defs.h>
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_balance_sysfs.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
> +#include "xe_mmio.h"
> +
> +/**
> + * DOC: Xe GT Balance
> + *
> + * Provides sysfs entries for balance frequency in GT
> + *
> + * device/tile#/gt#/freq0/balance/base_freq_factor - Base frequency factor
> + * device/tile#/gt#/freq0/balance/base_freq_factor.scale - Base frequency factor scale
> + * device/tile#/gt#/freq0/balance/base_rp0_freq - Base Render Performance 0 level frequency
> + * device/tile#//gt#/freq0/balance/base_rpn_freq - Base Render Performance N level frequency
> + */
> +
> +#define GT_FREQUENCY_MULTIPLIER	50
> +
> +#define U8_8_VAL_MASK           0xffff
> +#define U8_8_SCALE_TO_VALUE     "0.00390625"

I believe we should get the explanation in intel_gt_sysfs_pm.c
about how these values are actually used and add to the kernel
doc above.

I mean:
 * Scaling for multipliers (aka frequency factors).
...

> +
> +static struct xe_gt *
> +dev_to_gt(struct device *dev)
> +{
> +	return kobj_to_gt(dev->kobj.parent);
> +}
> +
> +static ssize_t freq_factor_scale_show(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buff)
> +{
> +	return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
> +}
> +
> +static ssize_t base_freq_factor_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_QOS_MULTIPLIER_GET)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_DOMAIN_CHIPLET)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	val &= U8_8_VAL_MASK;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +
> +static ssize_t base_freq_factor_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *buff, size_t count)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	u32 val, mbox;
> +	int err;
> +
> +	err = kstrtou32(buff, 0, &val);
> +	if (err)
> +		return err;
> +
> +	if (val > U8_8_VAL_MASK)
> +		return -EINVAL;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_QOS_MULTIPLIER_SET)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_DOMAIN_CHIPLET)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
> +
> +	err = xe_pcode_write(gt, mbox, val);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(base_freq_factor);
> +static struct device_attribute dev_attr_base_freq_factor_scale =
> +	__ATTR(base_freq_factor.scale, 0444, freq_factor_scale_show, NULL);
> +
> +static ssize_t base_rp0_freq_show(struct device *dev, struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(base_rp0_freq);
> +
> +static ssize_t base_rpn_freq_show(struct device *dev, struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(base_rpn_freq);
> +
> +static struct attribute *balance_attrs[] = {
> +	&dev_attr_base_freq_factor.attr,
> +	&dev_attr_base_freq_factor_scale.attr,
> +	&dev_attr_base_rp0_freq.attr,
> +	&dev_attr_base_rpn_freq.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group balance_group_attrs = {
> +	.name = "balance",
> +	.attrs = balance_attrs,
> +};
> +
> +static void gt_balance_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (xe->info.platform == XE_PVC)
> +		sysfs_remove_group(gt->freq, &balance_group_attrs);
> +}
> +
> +void xe_gt_balance_sysfs_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	if (xe->info.platform == XE_PVC) {
> +		err = sysfs_create_group(gt->freq, &balance_group_attrs);
> +		if (err) {
> +			drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
> +			return;
> +		}
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_balance_sysfs_fini, gt);
> +	if (err) {
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +		sysfs_remove_group(gt->freq, &balance_group_attrs);
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_balance_sysfs.h b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.h
> new file mode 100644
> index 000000000000..39cec5223cf3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_BALANCE_SYSFS_H_
> +#define _XE_GT_BALANCE_SYSFS_H_
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +
> +void xe_gt_balance_sysfs_init(struct xe_gt *gt);
> +
> +#endif /* _XE_GT_BALANCE_SYSFS_H_ */
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 08eabcafe7bc..5b0e4fc402ec 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -13,6 +13,7 @@
>  
>  #include "xe_device_types.h"
>  #include "xe_gt_sysfs.h"
> +#include "xe_gt_balance_sysfs.h"
>  #include "xe_gt_throttle_sysfs.h"
>  #include "xe_guc_pc.h"
>  
> @@ -215,5 +216,7 @@ void xe_gt_freq_init(struct xe_gt *gt)
>  		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
>  			 kobject_name(gt->freq), err);
>  
> +	xe_gt_balance_sysfs_init(gt);
> +
>  	xe_gt_throttle_sysfs_init(gt);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 4076a4e9daf3..87213b52df4a 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -49,6 +49,11 @@
>  /* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>  /* PCODE_FREQUENCY_CONFIG param2 */
>  #define     PCODE_MBOX_DOMAIN_HBM		0x2
> +#define     PCODE_MBOX_DOMAIN_CHIPLET		0x6
> +#define     PCODE_MBOX_DOMAIN_BASE		0x8
> +#define   PCODE_QOS_MULTIPLIER_SET		0x67
> +/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */

this comment seems off here...

> +#define   PCODE_QOS_MULTIPLIER_GET		0x66
>  
>  struct pcode_err_decode {
>  	int errno;
> -- 
> 2.25.1
> 
