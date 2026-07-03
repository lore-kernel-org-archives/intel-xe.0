Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41CDC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 18:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E55810E65D;
	Fri,  3 Jul 2026 18:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aiPf5Zin";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F6D10E65D
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 18:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783103510; x=1814639510;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fVqgyaXf4F29+j9zrSEmFZzdziUcGWRUt5wS4vC9f3Q=;
 b=aiPf5ZinD9MCpqpzbh4juPrqAdJPw8Kyb9YS18pC/b4mBkeaXKm797Yk
 cdr4xFWc3olQhb1x7fH7fZFdUreEeqEvzS/hiCiVwu3YJg73L0uEenMvI
 8kWQBYAWBPXlatXJ9yYuHOq/rWA8mCz9K5sraKgPbkcyHkTg42etxIHxd
 28aNQyWYAV0yGxGdHXcGurUFB2vVxIIB9rRpP0j882eiVAtCm4zmTbdUN
 mKH2kFI7P07MMGdVQBHUuZydMcbfCZGZI84ZAv/WKXDgbwBN8k93MVfLX
 0V4hAHCHwhwT0cdTk1OmxXTtky8y6rIOb3nx/idDFz3olYYGEB6ZimbP7 w==;
X-CSE-ConnectionGUID: WGTFTupaRum/J24+kaImwQ==
X-CSE-MsgGUID: ETC/PtkUTzCXn5G4hB6yAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83838043"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83838043"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 11:31:50 -0700
X-CSE-ConnectionGUID: P0GOFyf5RzW6e+YL8zVcAA==
X-CSE-MsgGUID: yaoFBQlmTVKs/XheTeAGUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="258060769"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 11:31:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 11:31:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 11:31:49 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 11:31:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVnbXkck9G3zAxUtjlUkT6o+VnEa/EydYT24SS2/RrAwg3BoRGhbZh8LWtQv9RoBi2LT3vrwCXLbT52V3Y1HxYEbPkMWQyRIiFJtDyuczv+PI5G+on6zcbBr2BXMIAP/+1nSIzZQ9l/q4n+5m+4ky8vu7l4DMq+5xQdY0Msc3TNCrKNTTv0wFnpxO3b7ThCUfuApXt8U53mTuZ2d1Vo8uWBDiAuvdHl5bBIYoLjIVOVrVaDOXoSlhniCsiCAyDeucvhIaOQEVKl98NFJLyyXmzUohFX1G00VaW0bXusBfE9CjaoqhkcBM0H0pR/75JfNXUNj7CpOTymqBlRtK+bTfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeVDeZ9AT7xOqfOggjNCzKPMz+iDW2zQmVd1HXYI+ls=;
 b=LTyLEy0f10GcC172F48LU14sNqjIZCKQEt6M+WOx0RSA1EVap7mvtOsQI/l/iku9JXd9FcESsDGoynUzXmPEXAIMcyPmpjnBmlUIGDJBTTUgZLs4YEyHRrKP7w5t4MH2PrhIYYgBTQo8jwkkmiYiBXNoP5pqrG/I7aneWRi8li6/rn0E9qiF8UgW0qHW9ed9Meb8SYTJsYDOcxBhTLMIZP7f6JdhLCbM6U0IpQqRt/IAh1grhcDs8d6oZvXpZWSH4lZcGuGGAg4NmC6GgDLsoQh5iajxFEERIUxFq3/3Igh37FsoXXo/LSc3XWxw7TeppAWyzlIoclxifiNkz0RcJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 18:31:47 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 18:31:47 +0000
Date: Fri, 3 Jul 2026 14:31:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 2/2] drm/xe: Add sysfs for GT/IA bias
Message-ID: <akgAD4rCNg1Ztdxb@intel.com>
References: <20260702005614.2621735-1-vinay.belgaumkar@intel.com>
 <20260702005614.2621735-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260702005614.2621735-3-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0256.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::21) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SJ2PR11MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e1da33-884e-43df-3240-08ded93156e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|4143699003|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: wtZViTIEqrPknMzMjVt7ecEyT0JS6xBKPBYXToznU8wDJ7Pa/V3NqHBYBFqwOhgzb6zKyltNo+g+/dyLhwUFFdlETh3jIMtJ8CNwEbML5pFaHVF5gVH6OozPnMic5f7X0hFGdrUX/QQDayCHptarYuPPypBaBDjoJ7gMjK6dp9JB6fZsKBgxk7jjkfNtpnDUBa3itl9Y28biJBpTCLSaMba5tIGifVkudCHvIcXhxmHoIUptDpQBASQe+Ho9c+uXKxTxwdMnrttXAexPvJoAYvs2Iq/G0rGqZ/x6Fna+hANmhhXFYdIvzzNySkGsYhAci08fW6WDbPgZ4Xjj6XdU0uIGNRT18vBvALod2+7IQe02YqD3qETwNLcnmVkY11N8lDbZ8JLwuVjycSKFsAwoZeaKT9CJT3Wp6oXJYOYEp6SLSLCqu6hTkfGg3ahodKUKN0+M8gwaoBE5s1IzSjQ+mjKbyaNHOTxTu8Z7B1kcrYRc41pPqwyW/fur4Wms5tQazZ+IrUCNvtJDscOkPIM/DZI6nnSdzs5V3z/SfN+Uk9G9CpIuk/stf2znhRYaFoN84OH6/Nk2LfExCsKmTt2ai6Si59rXFxjIoXB39pDM6ZORMgQRPHWI74sz4KpOgqyBM7f08O+oPdXYPjAmCaTgqeb+CJXHD/VtSF0BnhW7Skc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KpcKx70dXdu2eNj7peNmR69UhlR4fkYzvRcd6qUgiR4zismULzYn8yVrcJhL?=
 =?us-ascii?Q?er+4twCG8doHyCmcvBRL4yUwRIEHb8YQOvTC0t0aYvhS4/HtX6+e5nH1NxvC?=
 =?us-ascii?Q?zn4LRNMMBlfPo4VsfEj3MFoatmwW5AmoLJBMovvacwWdAMFmeiU7dGCWn1DG?=
 =?us-ascii?Q?UxQO5ffKlKwHFJhy5hjYbttslVKM89kH5sir324cJPK8nmhmOB9M6GKEtIk9?=
 =?us-ascii?Q?j+PVHZeO0G/09A5xoSmMHbAcUIEaB1yhX0Drdl0JCLvXwq7F4Uzn69wGRoHo?=
 =?us-ascii?Q?xKQEp/GGU+kPmnOoPeruUPJ3bJ+LxeFY+cOJi9j3t8wQHjHyRVZeZB+de15j?=
 =?us-ascii?Q?NzPN3tjwTqcjNsvTBXJIyzaqtYbPfquitf3mF+Ois7fUriiqiRlawmfRt+rC?=
 =?us-ascii?Q?Y5vhBrVIfIrY1AbqSivnvDkguAGXuOURNm7y7zHPMR4vEiY+kOdrPO5KMTtb?=
 =?us-ascii?Q?ZjhM5nwTS7yVpQgAQcEnPQ3/CxhqH/CYpYjV5b+RJM+Q0uLLgeVG1pexBKc6?=
 =?us-ascii?Q?7OFKzv3v5eHX6yoBUfj7QHRqYsLoqk6Z6Z+q6vpnLKwxLokh8ABt1FJ56cHr?=
 =?us-ascii?Q?5jgWbTYe/7p/5WsrGSPHiGdxUMnqalZMNq5e6luFvd2ZKvrdy41STpTobzYJ?=
 =?us-ascii?Q?ZcyDndiiLv+e353Mt6W85riRIIiemJxvJra92N7CmAWfp2kCmwtVwWDHXfNr?=
 =?us-ascii?Q?R7Rw7JyF50ZcpG9PmFxFEOT3w8wozFWm6oM2ne72AhB+VC7gRrsUycNohfel?=
 =?us-ascii?Q?9V04eqZj3tkRnlUdHKHcO+VOOP4be7g3zzfPSTc3rYecxixKHrw0HW2wCON7?=
 =?us-ascii?Q?ePNG10JT3fyW7uF5sU4xPt7NTljjIICy/iXjKTIfF0ZUOwz35zUdA9kG77gQ?=
 =?us-ascii?Q?Wm10yLxzJpxiyWz49TF3V3KHqw9joGs61Jd0KDaksxMcsc/Yb6kJ1/55a2PT?=
 =?us-ascii?Q?MH5cKWf4PvkLxiM/ERbjuo4qXvIXE4PJfCuOrmMzOokyDpIS1kVvWPw+iPpi?=
 =?us-ascii?Q?oQnuWB8Zs+jgSjE8Iluix79kC7sPbPssMnc6BtKDo41zVazxqZmYZaQPpXBd?=
 =?us-ascii?Q?2JYGKHU8UPVFKtC2p/uinE/s7bW+QQU0qHSgew5Jp4YwYviss+Kbp/Wmccw+?=
 =?us-ascii?Q?eLY82+Lyv3f3UD/KEJemQ/1L8vs8xIaezoD/T0gqMnjyOcRiY0PCpdWYMc7n?=
 =?us-ascii?Q?eKRLN92jtO6yU+72gMNPJMNtCmr/Cl/3NucF8RJQC4ke7dnFlWuULuRW2nCc?=
 =?us-ascii?Q?qaxTSp01ZAFN20c57/OomzoS7oAbngJtD2Y+dTreiz1zWutb5jQ1SKz2vdQd?=
 =?us-ascii?Q?b4xLI3YqE1Vgqity5ZHSyo+24Y9WxgML9J25JqVuFx6MWgvhGF1TtdNWMaJe?=
 =?us-ascii?Q?uApFI00dmxu2dZ1znNSOF4yM6cAtqW4xk0HLSTH8Pj+fXKC5rNim7euHdqhh?=
 =?us-ascii?Q?kYhJXwhVZ0/t9PWtNSQlY89SjDVzDPWMry47dalFjAXvlF+e1bZfeoeQCV7X?=
 =?us-ascii?Q?JMTSLFHC2CxU0h8Jv2IFmpDMljzPNBCez42LJ+kHIcW93+PSe18j9DwZQNLV?=
 =?us-ascii?Q?m59LZ3zXR03r7uMtdaUz3gVMnjIdgWd/meirO6NEfB7R0/xB042nFQpzNJko?=
 =?us-ascii?Q?dfYGqqEwhoxJQLFOUp+PTWotZZ49BWmiWnzGSY/46M/l4jF9mn2zUWX+zNxl?=
 =?us-ascii?Q?GGvPez0Wrcm9/urlroOuBmmV+A/Q7IOIKKo7PFjTZZskloji9/lLdie/2e6r?=
 =?us-ascii?Q?0uLJwYH0ow=3D=3D?=
X-Exchange-RoutingPolicyChecked: jYqHJoEHIo7thqKCvL5ZDaKGXWEz1XM6PslWilU85Vkbvb+dmnD52dTB/9aLpvr9juI31IZmXoREJvx6SCIjI7/RQq8+nLgbiMdv/qLJruGQfqZgRFETgp1uDO8jp49XDrkNzEGMLVwO5auo+jQ2c387nyCVGt0o8GAzRgOrzcguf0YP5IxpoIlzJFNrcHBFkKWQnbfPinM0j7zWHYsN9q+YvJ+fhlLJ+QscFmAa+GBwA6OFyJ/YV8olptRasErU+pq6s5EVSpMS9bnM0/oPqHyoEFqM8ZP6eX3ejVNefzeYedyIQnCT4YyCJNwRZNTfFX1U8hWwEnfSHvSiRe258g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e1da33-884e-43df-3240-08ded93156e8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 18:31:46.9637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfxC7C89oct6glhdbj3muQi2h9wy7eY7Lk2Bb6P2W3tB8thZ1unarvGvC5qIejjLGwLVKWMtMbX4tuI5ljLqGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7715
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

On Wed, Jul 01, 2026 at 05:56:14PM -0700, Vinay Belgaumkar wrote:
> GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
> Lower 16 bits correspond to IA and upper to GT. Higher value
> indicates more bias towards that plane. The values are in U1.15
> format.
> 
> $ cat /sys/class/drm/card1/device/tile0/gt0/freq0/gt_ia_bias
> 0x80002666

What about decoding this?

> 
> This interface will allow us to observe power budget changes while
> running workloads and also, if needed, tune it.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
>  drivers/gpu/drm/xe/xe_gt_freq.c      | 51 ++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 08251c7a1a4b..41c5c5f20964 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -634,6 +634,8 @@
>  #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>  #define GT_GFX_RC6				XE_REG(0x138108)
>  
> +#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
> +
>  #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>  /* Common performance limit reason bits - available on all platforms */
>  #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index a40dd074106f..0847832151f9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -11,10 +11,13 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  
> +#include <regs/xe_gt_regs.h>
> +#include "xe_gt.h"
>  #include "xe_gt_sysfs.h"
>  #include "xe_gt_throttle.h"
>  #include "xe_gt_types.h"
>  #include "xe_guc_pc.h"
> +#include "xe_mmio.h"
>  #include "xe_pm.h"
>  
>  /**
> @@ -242,6 +245,41 @@ static ssize_t power_profile_store(struct kobject *kobj,
>  }
>  static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);
>  
> +static ssize_t gt_ia_bias_show(struct kobject *kobj,
> +			       struct kobj_attribute *attr,
> +			       char *buf)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> +	u32 val;
> +
> +	guard(xe_pm_runtime)(dev_to_xe(dev));
> +	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
> +
> +	return sysfs_emit(buf, "0x%x\n", val);
> +}
> +
> +static ssize_t gt_ia_bias_store(struct kobject *kobj,
> +				struct kobj_attribute *attr,
> +				const char *buff, size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> +	u32 val;
> +	int ret;
> +
> +	ret = kstrtou32(buff, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(xe_pm_runtime)(dev_to_xe(dev));
> +	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
> +
> +	return count;
> +}
> +
> +static struct kobj_attribute attr_gt_ia_bias = __ATTR_RW(gt_ia_bias);
> +
>  static const struct attribute *freq_attrs[] = {
>  	&attr_act_freq.attr,
>  	&attr_cur_freq.attr,
> @@ -258,8 +296,13 @@ static const struct attribute *freq_attrs[] = {
>  static void freq_fini(void *arg)
>  {
>  	struct kobject *kobj = arg;
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
>  
>  	sysfs_remove_files(kobj, freq_attrs);
> +
> +	if (xe_gt_is_main_type(gt) && !IS_DGFX(dev_to_xe(dev)))
> +		sysfs_remove_file(kobj, &attr_gt_ia_bias.attr);
>  	kobject_put(kobj);
>  }
>  
> @@ -289,6 +332,14 @@ int xe_gt_freq_init(struct xe_gt *gt)
>  		return err;
>  	}
>  
> +	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe)) {
> +		err = sysfs_create_file(gt->freq, &attr_gt_ia_bias.attr);
> +		if (err) {
> +			kobject_put(gt->freq);
> +			return err;
> +		}
> +	}
> +
>  	err = devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);
>  	if (err)
>  		return err;
> -- 
> 2.38.1
> 
