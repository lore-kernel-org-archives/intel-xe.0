Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB066C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 23:53:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802FF10E034;
	Wed, 14 May 2025 23:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/lOArFO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6CB10E034
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 23:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747266806; x=1778802806;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rWZVLdMFJwfE7+zgAqQOSiazXid8mpWxShkOlEnXVa4=;
 b=c/lOArFOtalPes/5H56uMRurHshosypigIdzewLupavSkdouLlAX4+0/
 R9H78aWE28MX83LUO+LZQTPVHAx0EC9TBRbE6f2MmxO9tvOzFPRZiH07/
 Y3aN52MPfj1C8MlMysQ/qvuobqkzuW5EEDaIDGu2tNw2reE7MJj+2jHZ7
 yIJNB3tD1RsQZcw40Rw6AS2WjTw4JpDO5PmatAnUXWyaZYjpYH9dp9deb
 EAx7f7RWMg8ipOW/HdF/rPS/wUQOEQDSH4croyenK2c+8mbAntxxnBEW7
 QQgC+vBHd+w6G/wFefJflF719lKTfUoo+8DkV2JLEEJvL32Z6sOrgd8br g==;
X-CSE-ConnectionGUID: uPQ16TzeRB2T/qvY/0Hn0g==
X-CSE-MsgGUID: dMIPbtwFScq8z08BvPnkIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49122421"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49122421"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 16:53:23 -0700
X-CSE-ConnectionGUID: 6Zxe35jZQ4Cd5+L+bnaokw==
X-CSE-MsgGUID: 7fCSnnP7Q16LK3j/FowULA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="137919106"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 16:53:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 16:53:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 16:53:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 16:53:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSF6mDf3S/YuQMwD0Y4UA2EQYDQv2ojcTJ0b5OHpypgZY31t+liUXZ0G2W/sH0Y5/fWINd/Uq7iifh4Yo8YnUEThJ2KZC/jYFZFXLUI4pWuUi/a2HYMOH6jP/RWUlyBavkyRLE1S4ILeJTBnnkSpx9AyD4GD62thsxjCdsf7u35aFQTDbC53ePDZGgHQsEp7hcV1MXJnDkbnhTD7Igc2rCe/JLm4wfC8kEBucqc6v680RQFl/dyoHzV3scMpYxqPAe5YbLVMKTMxxsSHitTzLADzZ5ArHCmRVqW2WvT35JWNBvSzcdLMGz9XT7lkXIMoBeF/Sfd0PMNMKgoI4YPDSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkI9syCoVYWRqHeQ/3RAfe9JZ36zheK2V6TQYgdNuYM=;
 b=BMtcDqooDsrLgVJEamxAeu6DTC07WJXb3tRjy6Wky2doYIGyzW8XFM0X5Q76Nu68sBgvyU7Qb17XYM8QJpFiSSRFoRhHggIWLqWsKSw4OQ+16vPx/k3Kmw7QgaHF7joltw2iOUUcjO87z2590Lc8l+g9sppqnW7194ERTu41Rhpj06N6DcOSsXkTSkmUDGykQfELoKFkA1k1F01BAiuraTNEOAzYgCjw1NspOZ9aPf1ncPMNaJlwP6Je8DwAI+84sfGRmVT6ojbMvGGlUib2HwqhwmZiQ4VguB1HYPXHt+oYXL9QP9KQ3DbsUN5A0tjL0yZkW6Bpp11IJO1KvL8JJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB7330.namprd11.prod.outlook.com (2603:10b6:208:436::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 23:53:15 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 23:53:15 +0000
Date: Wed, 14 May 2025 16:54:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH] drm/xe/guc_submit: Simplify and fix diff calculation
Message-ID: <aCUtQQMooBiBuOSW@lstrano-desk.jf.intel.com>
References: <20250513-time-wrap-v1-1-fba9a69a65c8@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250513-time-wrap-v1-1-fba9a69a65c8@intel.com>
X-ClientProxiedBy: MW4P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::35) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc88790-9e40-4aa8-b08b-08dd93427e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p1tj2PvyvbDxSNOIi0GMSC1aRSKZhyDDAz7Yakojez9VWYHkEU2x9Q1p79vO?=
 =?us-ascii?Q?4x4zYOzZhQg5N6D1tvKhOUxSUsCxifit97MHA8lxdwIz1mvC9eNsxebNf/a5?=
 =?us-ascii?Q?huUvbi38lpE2b4FILD+P8Y4Gt6mDwVyNwdORfMW1UZd8aMHmHpikkKoIhc9p?=
 =?us-ascii?Q?IeDviW96UxuTmpy7ymULu0N5gPQl6MunGVjamMdfxY3FPxxvZpXrft1sO9+Q?=
 =?us-ascii?Q?WXs+UnuxrWz1dKqXLDOMRQvyDgYkZ28XcCi/OmvSzB2ZYE9XyszHPkj+RRYN?=
 =?us-ascii?Q?4W907nIyCt3H5BQjk8FW7AwB/P7bTzcPTSeYXf/Wt95yspPDQwG8DWDT3a6j?=
 =?us-ascii?Q?Du0e847m312Gqrq1jhHpG9hBvTz8ReCEz9ksBNWRwov3t1zJFf3dSy5fy/2z?=
 =?us-ascii?Q?3iK6oR7dhM1Ca2rpW7nha5SKO1roAykmWr0Jy/564dfh9zUW5bvQIv3OEDG7?=
 =?us-ascii?Q?CSY9D/w5Hv1ZeVHWWeZiKYb/Sdfnwm8fw3RIktqi3WjdkW8chT18DAJZGj8F?=
 =?us-ascii?Q?zAHjmsgPqnaxw6lh7I2svMu/81OgHVM3tjqMCL1MFvwMLIEge2R51HFmjqEv?=
 =?us-ascii?Q?868A28ovPogwoV1NYekkk6e/8fZu/dM/1fVeZNI53XQYOeKoxUp8ug1AD3qn?=
 =?us-ascii?Q?q/gGkTZS+JWXrnmKPzTfJXEIlOiUNvHqxWfy2slKT32HjWpF3oqjElUG8whW?=
 =?us-ascii?Q?IgM1xOF44M86Hw5stfyr8TNhl7Z/scwHv7okSWDw+P7xQZazjINqkleYpOjZ?=
 =?us-ascii?Q?Pftrsr6Y/LOuRvYXA/51OJWHY/e/rC4LYKB6UC9N2PKqNglCiuu9ASQTwxWg?=
 =?us-ascii?Q?Pzwte7AXtzdZcw9/gai2XLFCImhyWEj9plb76NbzjiLP9k6OVwynmCK0aubl?=
 =?us-ascii?Q?h/JSgIzh1yIdg7m8Q0Byt/avr+bTZuBHJV2gg0ui1Ob/ouRTgopVuZ7+W9HV?=
 =?us-ascii?Q?0PkTFBhESj9u04Z3Uqr/vDMCwaHujmTSGzHxlf5QAV4hUFc+/ArjWQJPTQst?=
 =?us-ascii?Q?qoUUN0TpOH1qkBAkIol0BLOOXDkD6K9CS3pmtRtTPZom4Oc9Ihsv6sPZoU6j?=
 =?us-ascii?Q?3+31nIcGgyxpjCM7nQ7P3B7ZT1DrWqdfTYKAGq0iXum9sjYaeUcpu0nRAhKR?=
 =?us-ascii?Q?ESk/gqt1o8H44dkOvHDLu9hRxe+PHnuYVbCoav6DmFGjz0TxIKnOKJpRTm5z?=
 =?us-ascii?Q?/h9DGPjCt2LARgMSK3dl0kcpYaMPrK9E5KVr/WSqZSJJmMVp/gMS/E+e9OZV?=
 =?us-ascii?Q?f3NOxyFw+qundhofVnldkv1dxpaTMQmKb4h+QfvlJjgs0YYeVmS9VyRSZ8LN?=
 =?us-ascii?Q?pHceEmSSEJ8XBkLKNxrHkTYYXE0pVLw3BfN0qTKzlun+JR8JWPOPj4BkG7ss?=
 =?us-ascii?Q?mNnPr8CmaTy8hOi5NGDudv0ERP32tFM+/v7+OoMfHJLVQ27kK6PtCNPA2CV9?=
 =?us-ascii?Q?dZPJ8Pu+6TQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5SnDyZCqWyYO0SQSYvH29dUfrCWVzpx/SEDeX4EOKJKoib4Hm1IsmP/R9Ahm?=
 =?us-ascii?Q?NpIeWLkDHiyP2deCXrgQRu+0W03i+n/l0KWAevU572E+rCsJAYMgwOS9bn7s?=
 =?us-ascii?Q?clzSGurNBO6AFa6X7ZlPCJj7fDUui5Il5WbbEr+dj2Ev5TTmhI+WFhTJhgUk?=
 =?us-ascii?Q?8Kr9vyw8AEGK0AOb+n/xbpoBr5KaRKARu6vJ1zsc04icN1L9iFW56Na0heDu?=
 =?us-ascii?Q?B48R/oZ6SBHkI3wrvIAr0uplocalfz8sYEPSWjUyF8nccZyKX1nq4p8JI3We?=
 =?us-ascii?Q?1VK616TV7d3AZWL+nCxzDQ3oce4Evn5DuA0MLsgrnlD67xXjpjsloB2gXipM?=
 =?us-ascii?Q?im1p3e9bg0r3mPYIlq+vpeq3pCp66UW3HdaevRfEP7MU6KCWj8CvsiIX5iMW?=
 =?us-ascii?Q?Eep1LGTl8vilLDA3/FwU39BYY35lbqlGxvhJUEPbLWOsXJZUcX8AV9IE4NGd?=
 =?us-ascii?Q?mVhdR7AahlFnkJV0fa69kCHSYYOrr8tB1/5LleMw/gx6H4DicGbm6Bvs13r3?=
 =?us-ascii?Q?L0qssjTFvqcGEjCXTYidhlW44dvZZqCAKrATaMb/48BOfxnfHWU8BaLj6HKq?=
 =?us-ascii?Q?CDUeaywWWKJonUDVwD06fQN0JxG9hyT3AxHPtQk6CKcuk02Bqxj/Rd4E9U3N?=
 =?us-ascii?Q?72awEoiOosXZ6vSnYaZ45VnzIk9FhcxUVTxTdaXKXFY2nZD5lpPbZEHfPDs1?=
 =?us-ascii?Q?PT1JvBM7HP5n23UJLDtpZkhdzZt04hNadvk6iUmdd99gyrqTr6ZqHzG3spm/?=
 =?us-ascii?Q?1bWNVPAK0sR9UtAWsqfYEjkJUH1f9nUfLUpc9Ia1rDLAU12RGBhNrSLQ8XZC?=
 =?us-ascii?Q?Zqyi+8j9wAVr5Zgdpv5pcroWgdMTKpiT5fiBXFlgvOG3GdIs7G3wZ8dxmWQM?=
 =?us-ascii?Q?VUtp2pWj6KkQKZMlqQKNOwqeBkc5wVRuY0zYl/t7WMr+J7ZPEi9a0vjDnVEI?=
 =?us-ascii?Q?/UUnp8ipikAvI9xX+gazS9ks+t6GvnvBOf5Vk3pEOQ8RcszajA3W3958Z5Cb?=
 =?us-ascii?Q?AiZqF9z+KBlz0zEHZz7CxMfjERnyZBRn+5oOwMA8R2CyZb0OWhHZWefsJZjT?=
 =?us-ascii?Q?JZ4cOD8gRYVNoTdtvh++1/CK+9wNzjfjLF6e+3EuXAgu2Wrd2YXw2zbaVdY8?=
 =?us-ascii?Q?tpkVbqTNDKdPcHkSN8z7vYmjj2jdk3fYJqxdu0E0xnkFqIbU2KWtGM0ietZ5?=
 =?us-ascii?Q?d9O4g++4AxZP9n8L2Fl/agVOzG1Qbatmf8zT42KFW2a7fQvUFtMdd8fv3GKD?=
 =?us-ascii?Q?AKsuX0lvye3jIn0U+P5OLWomzxtR5iVmNgM+/w7TRiu4Lajk2P+DnP9fh4ZD?=
 =?us-ascii?Q?YslcREc0LZ8E4LtZPIIvDlxosD6V0IzF5kDTf0QRJp5BCdihHlWSpo9745gQ?=
 =?us-ascii?Q?5qYrYjQw1bknJCd+TXQW3U7zeURdWt318e3IJu4+u4/zxJhOGObgPUGiZuJW?=
 =?us-ascii?Q?97Yu9Kr+ulDHkFp9Xsw5Du6EkMqnVF+sZekCC/6dRCqvvCpPr1iK53jPOGYn?=
 =?us-ascii?Q?MjfDSq4A5qX+4R9sfYQd05nwnW06/7KRZTi245ohQf8u+5Yi8w2y/m5hZcVI?=
 =?us-ascii?Q?3/4WOvmySxozwr/E/KCldMxzaDIMDBs3SNP0WIwRgZRwYz0L4apQS5X6jtFe?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc88790-9e40-4aa8-b08b-08dd93427e13
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 23:53:15.0326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjMeEUS98NBe23zBSh4lIBDvnvjjIgCeu/9uh4eF4nz9uKhIUB8aNMm7WXIYNkLMEfqJHzmHmWxYJkSl9AmeVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7330
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

On Tue, May 13, 2025 at 07:25:49AM -0700, Lucas De Marchi wrote:
> With a u32 type, there's no need to check which one is greater: the
> current is always the latest and if it's less than the previous, it's
> because it wrapped: just do the unsigned calculation that will lead to
> the same result, or better the correct one. It fixes an off-by-one in
> the wrapped calculation, however that doesn't really matter for the
> timeout calculation.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index fb125f940de8f..80f748baad3f3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -976,10 +976,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>  	 */
>  	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
>  
> -	if (ctx_timestamp < ctx_job_timestamp)
> -		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> -	else
> -		diff = ctx_timestamp - ctx_job_timestamp;
> +	diff = ctx_timestamp - ctx_job_timestamp;
>  
>  	/*
>  	 * Ensure timeout is within 5% to account for an GuC scheduling latency
> 
> 
> 
