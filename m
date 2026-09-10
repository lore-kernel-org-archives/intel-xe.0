Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778B8C79FBB
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 21:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DB810E97F;
	Thu, 10 Sep 2026 21:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ckRue1o7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCCE10E8BE
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 21:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789076256; x=1820612256;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KCZAPh44aYyzrnZinTFTf24Wp6uFfkv+d/51BGaw9w8=;
 b=ckRue1o7bpaTgYxIT+W8uZX/zYyJogRvJjJhPKLZiw7gcC4GKufauGcG
 mAWEPVS+AhzPBzkObWYh1MwO9GtPG/viF0ppNntclGFWf1UJsGbSqL4sU
 qsr92iXjbVV2BCG+90C6U3QfzvXp/q47gyXtphfD2sxuCru0vGoGaD5Se
 eOxKkGheLEJN25U7oouXOChuQLRGmo9Ifv9UEyaRbBLjY04RQsZWCPz4u
 5QBVndbaJKDHpUg9I6dskwfmcRA+g1xdVrfw43pM+US6YZ3v8Q5hMsa7H
 oGxej2ZP2yAPvWHc6U4CG2/ppxuOMKRTMx9/EUmSQLF7zGUT0AeZ0dPe4 Q==;
X-CSE-ConnectionGUID: 9q7BPVibSICEQn2YX1aSbA==
X-CSE-MsgGUID: t+fXpETrTd6S9qjZu3ITDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89578016"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89578016"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 14:37:36 -0700
X-CSE-ConnectionGUID: c51fRp1oTjyPaOin5IyB7A==
X-CSE-MsgGUID: FvkT03mTTrqAONljXRvGkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="295226340"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 14:37:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 14:37:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 14:37:35 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 14:37:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k24JhQ8J5YF4KgkScZFopxdP449K04FqYLdScK8LV+hAax1kI5rtgSRYSvxcHrNDRvECHLEUmCrhqs5yJuot0UftsMXKi13qdjyhlx1chfKLJh42toKkvxzY92cb150EBENNZXcjcoa7/Kjv2sfwrnKeQ6rsZbhOJ6wo/OenYmPJ/N5i/zrl+X/fV1C1KDgQB/zI5Xoka3qj2tvXqJOpnAmJtSVl4gU5DI8j7VirXKuvz6Gn3J4HQ7GnEWkSM/5uzWvdonV9Bv4Jsf7bn+/D0bLallb+kEA2mC5Bz5K07xmj9QwNvk+wAHUz11nMnhbOU7YsZqIDm7xm7oeAbr3cyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qwfmZKA2twGVZnxrElJY/8uev/TorA/6ZcDhnQ1I9c=;
 b=wzr2GoQI52rIG9CvpCMhy9mtaXCLX0woFBAFC8ge37dD35ifxRVjW+cfltFpcNVE5UAAMx0FP70977167uaJWWHDz8hFs/uBzj55/CkfS7A/ZkNjyEpf0vX3NILBpa49VrDkz6lmFV2t6imZpyzU/ByiaKDkIztobL6vuqd1Nk5zpjJ5dNKvauPLffarjRlbZhObjS9iLqSdKn/kEkVXhBT3DP2Dyqq0U6DbtYzhZB0u6mBli0RBJX6ju8nDdcKI5owEujrR8CiJUVneA/YN2KsTiXwzbMfNsuDWRsGCZBa/GuxDq86a12873Sc5MpQEadMujdY9rLLjLAX6KIPfnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CY5PR11MB6485.namprd11.prod.outlook.com (2603:10b6:930:33::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 21:37:28 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 21:37:28 +0000
Date: Thu, 10 Sep 2026 17:37:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v5 2/3] drm/xe/sysctrl: Add RAS error injection debugfs
 interface
Message-ID: <aqMjEgQpqHDQm5EF@intel.com>
References: <20260910175619.3176089-5-anoop.c.vijay@intel.com>
 <20260910175619.3176089-7-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260910175619.3176089-7-anoop.c.vijay@intel.com>
X-ClientProxiedBy: BY3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:254::24) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CY5PR11MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: 07565fc8-3199-4eab-8c5d-08df0f83b59d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|22082099003|56012099006|3023799007|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: OECeiYMQdYop3VT7EB1Sb0bRLHubl7X3l9Vxm1W5yq9TEkiLUgI4kcLqWwexADX2ZLOf1yf16AEVAlzFureobaWQ9P6wuy3WwGksztXJGW/DxN3ZkjplnmHnGhqZ2coGrrsEtKHejHHVgdn5oJMS1gjJGFHrzOFEZAolx1RbvqDT+hxwhhMctEtw+u+wmOx/HonAwRYBvbgQ37oXxwO5GRO3SQ/OVW5j8cepwkEujoIfxgCTnqMMAkgnSV6YgxAg/MW3nKm6+NnE3x2E+FjpEw1d40dy7gO/Ih7XjR6UuyNgpYDYqNw/SKY/rRCmRz10y+jD5iLZt3uQUsP7LUTPtGd2Ewz94V8Gpu+hhnkPszByzGqLHmhcg1Po0h55s4UfsEIBo9Wpg01xEvVREHO3Tqm/XhSJvaJk+91ChQ0Y0j6M5fOgg5EF9DTIpsS0wlzO7HG6zpPXsSr1YTiH38AK8ogXw94RLkFb3w7qxGjGVQO2Y05sJJ9N9SxNsaB3nESO2nDng/c9Q47qLcgSpPgY3Aa1Pwn1618On8TuZjp8gRhi6ShQ8D3mqEp1cr6R2EWEi8riO6aMWz1MljsZP/tndH59js6Yk7re9BIRvbj2T51NjyigPax9uyzIEsLj7NPy3YyPIHEedvUpuiMniNuNd8uXvMcfkbHVONyFuT2GveQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yBo6sVy45tob5yTvpNr48Hd8lWDuiWvoeQnBglwjAix3rQymbyO2XvEzRaDE?=
 =?us-ascii?Q?Tyxs6UBZz/s6GnK1XIFLrJC7gaT5rfChePA3IwER5/Y5sxOlSR3Y1hcpNeJi?=
 =?us-ascii?Q?FwBl+Bi7n8dsr+zs9oDi5c0FqZn99lRfyxGE1bkWvs8RJYj2xCHXBblAj0dU?=
 =?us-ascii?Q?dWm/z9KkFrXmCxqeYc1DzuyYc61cKLYUuaOqEQ24FaFgweIHY0uJPETggSoq?=
 =?us-ascii?Q?i37P+50lKpofXqwOAq2rFrP+zlYw/W8MmZlnUoPCUIBqHjC0eLK/Zm6avu7C?=
 =?us-ascii?Q?kB3u14Yw4b81cyGNljsF3jZkry8iWaAcQsl7xsXSPcMf8fpRn/nLlKeDonFW?=
 =?us-ascii?Q?5yTKg8r/HDelzo734OH9ng5q8B+4g47NaChVKue5hVg1ePWkocH0KeVkxpbM?=
 =?us-ascii?Q?bKJzyHn9pDwcd0C04gdElw3I/hWNf9GHkGNnNly8y2pQTa2bkK4fqUh0ppnA?=
 =?us-ascii?Q?Z5iaYCXKi313QvYCNFsRopPG8/GRZuQkru98xl2zKmTbPf1mhLDtA64RLZ15?=
 =?us-ascii?Q?zi04ugMadPkSzO8UeH0QPaleGZlpsyo1j87FgL8Bl3MSDZ4xsB9kEAFenrVg?=
 =?us-ascii?Q?JMbL9kCNxzJ9Av7eznj3Zmcv5xDdNpulvqpI9KWu8IQ7imK4pySejwwNmFFT?=
 =?us-ascii?Q?b6Yq67MmA1z40XfhFfytW+s6cfO1heI/6CQ8Kh8Nrs8mTrUsvx4s0tqmtZ+W?=
 =?us-ascii?Q?JHdr9y7U6wiRUZkge+lpNFnQf5OD1myfhR0Q/H7uWHltnvzIHArC2Ufj5xFP?=
 =?us-ascii?Q?V4hvJ0VsMSF/9/yZtKsUnPfZHd2Df6ZmT5rWObD9GrqeoDumDezfmLzz6pTd?=
 =?us-ascii?Q?YGlIYJ3tPpqX6923BEGgp3JqfwgHd4aR7MbsImVZ3fft+PlhGmgkJxQ/njcm?=
 =?us-ascii?Q?3Wvzrdt+Gl2ipq/LjMmtAgWdwf2BvkWaPNUO8tCid2E8Q0iBocisNJNSEMxW?=
 =?us-ascii?Q?/ffIN4aTRKvx2O90SYzhj1L6N+gu5TV+2d/4MGbO1MtFItfdnLd5qH/P3cIx?=
 =?us-ascii?Q?+9xIZI1kEcFYEy5Jdb2RVZNFJdceFJ+QK24/58AhX02CJ9GpPx1sLqxGuCEO?=
 =?us-ascii?Q?U5WTHRtLndHJ/b7iJuv4IUdHlrwoh+0uStNALleK9Ulh/s7z9jr+g8I1So2S?=
 =?us-ascii?Q?yyAMfX8lgV8F3m2RgA5vIbihuimTzTKtr3qE48ZrydgyqAFmbzy09GhfJHD4?=
 =?us-ascii?Q?bWuRXzubqObWVojyFS+lrWPZRVGtErHUUcKchoeLPcPwu+5sQJWa+39hmSE6?=
 =?us-ascii?Q?BOy3gT5b28rwe13j4je0UW8q5KgWcH4tfvsXO4qEdZ2Vde49STodGX3hMpjA?=
 =?us-ascii?Q?iL/BJj4xXreZji1J0hH0OAaz70WL6/J4WYjTlC2HgGVMyGmvROUBaNh6UxVr?=
 =?us-ascii?Q?7X/ed/L97k1NCpaVOGUVkreLygxdy1wJ4J4h3drJ61fQcGiMToseUxJBvg45?=
 =?us-ascii?Q?eaKwvUVXFvJ6MiOJEVdaMSpSWT1xxqOlbXe5b9MyzrkW2Y9aGoyCrTikgoWA?=
 =?us-ascii?Q?Bvr0LcOb3oQXBAkBMuPaL5u+1dFi+kAklRmNAXcvJ1YfLRP3WyILAdx7IXgL?=
 =?us-ascii?Q?U9jEBdwQS4g10+rurBSShNug1JWuCDUM1dNJyWmQekp3gCb1Y9OKNKt/C/Yu?=
 =?us-ascii?Q?JXJwNIoTaRDg0VwyRHqFC5kmTigDzkrdhor6iwe29q3zYejGH4xAkzBStQpu?=
 =?us-ascii?Q?wVqqxo/qH3O1gKaG2Q62XXyDWkdsWD+H13fHkC6sTBwDiEArleiIkQu6JtN7?=
 =?us-ascii?Q?wigp/dMrdg=3D=3D?=
X-Exchange-RoutingPolicyChecked: lNvdJuMMida1OTLqcDWTXvl2vLvVzRJ8vBa8g0WD/YcNV9BNyTeb8WcjuxmczQGqamzfmUDnsWaN/KLXti3fV4pO5EByEPWoWxnkHSAwmtIMhLSBWF+98AnVRzt/DPuY6m6zlxSRcM7gjrKixdfzR70FPcSndMIUaJeccr5g09CsxXHnZ2DUFOguu9lFS4BITX/CQ2XNgLSWjV3d54C8bAoftzmJWkm8uMnm6xFCUgW4WfCFT7w2JGUZsJdQC8m544LviTM1U/N9z+J8XU4iko52p3AzMukJhnq284HtFrZsq7YXcisRk67cPMaQtFec+vp05LDWG6p5qbYBl5hHzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 07565fc8-3199-4eab-8c5d-08df0f83b59d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 21:37:27.8018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +a9GeUl0Lga4iv/jFEdBSssJoFh/thlL+fCr1FgB/B5rfssyMgbzepVovGd3hBCpy5DM9ndERqdAJKgLiwlrlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6485
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

On Thu, Sep 10, 2026 at 10:56:21AM -0700, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add debugfs interface for exercising System Controller's RAS error
> injection command, used to validate RAS error detection and recovery
> paths.
> 
> Command details:
> - Group ID: 0x02 (diag group)
> - Command ID: 0x7E (XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT)
> - Usage: echo "<ras_block_id> <ras_sub_block_id> <err_type> [params]" \
>              > /sys/kernel/debug/dri/0/sc/ras_error_inject
>          cat /sys/kernel/debug/dri/0/sc/ras_error_inject
> 
> This command requires the diag application to have completed firmware
> boot and initialization (late-bind loaded). Both cat and echo are
> rejected with -ENODEV until xe_sysctrl_is_diag_fw_ready() reports the
> diag firmware as ready: the readiness check is done in .open(), so the
> file stays visible under sc/ but is inaccessible for both read and
> write until the diag firmware becomes ready.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v5:
> - Add per-entry locking for debugfs accesses
> - Add xe_pm_runtime guards for ras_error_inject readiness checks
> - Simplify ras_error_inject write-path flow
> 
> v4 (Rodrigo, Anshuman):
> - Gated ras_error_inject on diag firmware readiness in .open()
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 139 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  31 ++++
>  drivers/gpu/drm/xe/xe_sysctrl_types.h         |   3 +
>  3 files changed, 173 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> index c0454c4c0ae0..0c537248b30d 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> @@ -10,6 +10,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <linux/string_choices.h>
>  #include <linux/uaccess.h>
>  
>  #include "xe_pm.h"
> @@ -127,6 +128,140 @@ static const struct file_operations xe_sysctrl_loopback_fops = {
>  	.release = single_release,
>  };
>  
> +static ssize_t xe_sysctrl_ras_error_inject_write(struct file *file, const char __user *ubuf,
> +						 size_t len, loff_t *offp)
> +{
> +	char *kbuf __free(kfree) = NULL;
> +	struct seq_file *m = file->private_data;
> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
> +	struct xe_device *xe = sc_to_xe(entry->sc);
> +	struct xe_sysctrl_diag_ras_err_inj_req req = {};
> +	struct xe_sysctrl_mailbox_command cmd = {};
> +	u8 resp_hdr_only[sizeof(u32)];
> +	unsigned int nfields = 0;
> +	char *token, *tmp;
> +	unsigned long val;
> +	size_t out_len = 0;
> +	int status;
> +
> +	if (len == 0 || len >= PAGE_SIZE)
> +		return -EINVAL;
> +
> +	kbuf = kmalloc(len + 1, GFP_KERNEL);
> +	if (!kbuf)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(kbuf, ubuf, len))
> +		return -EFAULT;
> +	kbuf[len] = '\0';
> +
> +	tmp = kbuf;
> +	while ((token = strsep(&tmp, " \t\n")) != NULL) {
> +		if (*token == '\0')
> +			continue;
> +
> +		if (kstrtoul(token, 0, &val))
> +			goto inval;
> +
> +		switch (nfields) {
> +		case 0:
> +			if (val > U16_MAX)
> +				goto inval;
> +			req.ras_block_id = val;
> +			break;
> +		case 1:
> +			if (val > U16_MAX)
> +				goto inval;
> +			req.ras_sub_block_id = val;
> +			break;
> +		case 2:
> +			if (val > U16_MAX)
> +				goto inval;
> +			req.err_type = val;
> +			break;
> +		case 3:
> +			if (val > U32_MAX)
> +				goto inval;
> +			req.params = val;
> +			break;
> +		default:
> +			xe_err(xe, "sysctrl: too many ras_error_inject arguments\n");
> +			return -EINVAL;
> +		}
> +		nfields++;
> +	}
> +
> +	if (nfields < 3) {
> +		xe_err(xe,
> +		       "sysctrl: usage: <ras_block_id> <ras_sub_block_id> <err_type> [params]\n");
> +		return -EINVAL;
> +	}
> +
> +	xe_sysctrl_create_command(&cmd, entry->group, entry->command,
> +				  &req, sizeof(req), resp_hdr_only,
> +				  sizeof(resp_hdr_only));
> +
> +	scoped_guard(mutex, &entry->lock) {
> +		guard(xe_pm_runtime)(xe);
> +		status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
> +		entry->status = status;
> +	}
> +
> +	return status ? status : len;
> +
> +inval:
> +	xe_err(xe, "sysctrl: invalid ras_error_inject token '%s'\n", token);

I understand and agree with your goal of avoiding duplicating this msg above,
but at the same time I agree with Sashiko this mixed style is bad.

Please consider splitting the token parsing in a separate function so you
can better organize this.

probably Claude Opus or Sonnet here can help a bit.

> +	return -EINVAL;
> +}
> +
> +static int xe_sysctrl_ras_error_inject_show(struct seq_file *m, void *data)
> +{
> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
> +	struct xe_device *xe = sc_to_xe(entry->sc);
> +	bool fw_ready;
> +
> +	scoped_guard(xe_pm_runtime, xe)
> +		fw_ready = xe_sysctrl_is_diag_fw_ready(xe);
> +
> +	guard(mutex)(&entry->lock);
> +
> +	seq_printf(m, "Command: group=0x%02x cmd=0x%02x\n", entry->group, entry->command);
> +	seq_printf(m, "Diag firmware ready: %s\n", str_yes_no(fw_ready));
> +	seq_printf(m, "Status: %d (%s)\n", entry->status, entry->status ? "FAILED" : "SUCCESS");
> +
> +	seq_puts(m, "\nUsage:\n");
> +	seq_puts(m, "  echo \"<ras_block_id> <ras_sub_block_id> <err_type> [params]\" > ras_error_inject\n");
> +	seq_puts(m, "  cat ras_error_inject\n");
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_ras_error_inject_open(struct inode *inode, struct file *file)
> +{
> +	struct xe_sysctrl_debugfs_entry *entry = inode->i_private;
> +	struct xe_device *xe = sc_to_xe(entry->sc);
> +	bool fw_ready;
> +
> +	scoped_guard(xe_pm_runtime, xe)
> +		fw_ready = xe_sysctrl_is_diag_fw_ready(xe);
> +
> +	if (!fw_ready) {
> +		xe_err(xe, "sysctrl: diag firmware not ready, ras_error_inject unavailable\n");
> +		return -ENODEV;
> +	}
> +
> +	return single_open(file, xe_sysctrl_ras_error_inject_show, inode->i_private);
> +}
> +
> +static const struct file_operations xe_sysctrl_ras_error_inject_fops = {
> +	.owner = THIS_MODULE,
> +	.open = xe_sysctrl_ras_error_inject_open,
> +	.read = seq_read,
> +	.write = xe_sysctrl_ras_error_inject_write,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
>  static void xe_sysctrl_register_entry(struct dentry *root, struct xe_sysctrl_debugfs_entry *entry,
>  				      struct xe_sysctrl *sc, const char *name,
>  				      u8 group, u8 command,
> @@ -164,4 +299,8 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
>  	xe_sysctrl_register_entry(root, &sc->debugfs.loopback, sc, "loopback",
>  				  XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_LOOPBACK,
>  				  &xe_sysctrl_loopback_fops);
> +
> +	xe_sysctrl_register_entry(root, &sc->debugfs.ras_error_inject, sc, "ras_error_inject",
> +				  XE_SYSCTRL_GROUP_DIAG, XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT,
> +				  &xe_sysctrl_ras_error_inject_fops);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 501a4a4c16ff..0f65bef42399 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -14,10 +14,12 @@
>   * enum xe_sysctrl_group - System Controller command groups
>   *
>   * @XE_SYSCTRL_GROUP_GFSP: GFSP group
> + * @XE_SYSCTRL_GROUP_DIAG: Diag group
>   * @XE_SYSCTRL_GROUP_CORE: Core group
>   */
>  enum xe_sysctrl_group {
>  	XE_SYSCTRL_GROUP_GFSP			= 0x01,
> +	XE_SYSCTRL_GROUP_DIAG			= 0x02,
>  	XE_SYSCTRL_GROUP_CORE			= 0xFF,
>  };
>  
> @@ -55,6 +57,35 @@ enum xe_sysctrl_core_cmd {
>  	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
>  };
>  
> +/**
> + * enum xe_sysctrl_diag_cmd - Commands supported by Diag group
> + *
> + * @XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT: RAS error injection
> + */
> +enum xe_sysctrl_diag_cmd {
> +	XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT		= 0x7E,
> +};
> +
> +/**
> + * struct xe_sysctrl_diag_ras_err_inj_req - DIAG_RAS_ERR_INJECT request payload
> + *
> + * Request payload for XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT. The mailbox layer
> + * prepends the application message header before sending.
> + *
> + * @ras_block_id: RAS block (subsystem) to inject the error into
> + * @ras_sub_block_id: RAS sub-block (IP) within @ras_block_id
> + * @err_type: Type of test error to inject
> + * @reserved: Must be zero
> + * @params: Optional injection parameters (default 0)
> + */
> +struct xe_sysctrl_diag_ras_err_inj_req {
> +	u16 ras_block_id;
> +	u16 ras_sub_block_id;
> +	u16 err_type;
> +	u16 reserved;
> +	u32 params;
> +} __packed;
> +
>  /**
>   * struct xe_sysctrl_app_status_req - Get application status request
>   *
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 9ad3c40de97a..8ea6e1f29ddd 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -68,6 +68,9 @@ struct xe_sysctrl {
>  
>  		/** @debugfs.loopback: Loopback test entry */
>  		struct xe_sysctrl_debugfs_entry loopback;
> +
> +		/** @debugfs.ras_error_inject: RAS error injection test entry */
> +		struct xe_sysctrl_debugfs_entry ras_error_inject;
>  	} debugfs;
>  };
>  
> -- 
> 2.43.0
> 
