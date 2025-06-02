Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4834FC5AD49
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 14:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D3910E2A9;
	Mon,  2 Jun 2025 14:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kDXgvHIb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED1110E2A9
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748876230; x=1780412230;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T4OsB5r/iyRz6p1KzJSm1lCTggcQa/3oBOaboa5usdg=;
 b=kDXgvHIbZLN7Fe9G70vCTuCc+EsEg3nnyyJFMqHSn5spLj2qksRSdtAe
 BsOPncquivskLDPZcvD8YYA7KH6ageA2YgNrV2hTHKzYzXd00D/8tFrvH
 /w2wVzAjlcYUnD2TuRUr8Q0mvNG065YI/83O1zc70xZQW3KolEdl8ZNoT
 OPeIVtfkptvMTnorZbdKVBhqEgqQT+ofkOV+oJog4gfr7QuJ9VU6/mjIt
 DZHcITEXQVxQzjJp1FX+0NJMrmqIS19dAl8IzMXUEQpuilEE0fpk+mBCP
 47CTNdZA3w1GFo4tn9AHUZyYdGi10XToGwLqXcl6U6iBcvUkQU7VJbaK4 Q==;
X-CSE-ConnectionGUID: vCRl9c7HTnqTpoIfx7ANTw==
X-CSE-MsgGUID: 2DmfaCERTxSvFfLgV7A3Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62233125"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="62233125"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 07:57:09 -0700
X-CSE-ConnectionGUID: xDQ1yNGFS/iO3jrL0xLTTg==
X-CSE-MsgGUID: ZHnQHp1bQuSK1drifooteA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="145004839"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 07:57:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 07:57:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 07:57:08 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.81)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 07:57:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5ILPAERZ6eG7fO9WZOOhhc1ztAbwkNA5AZll0nn0eD5azC1F08DFgcz8on+EPS8cqnpd06Sx/SWdTsBDcdQOgxwKp+tiTElujqjlSV7RbdPMUs8jwIOhCbFd9/RZFwqIBSI0RMpTwG/FuhK7mloMYs+wLH7WEWDfpSPp2N7eHcRlP+fwL4dadhu9iG3i4PfueDPJPpuBw2Z7wJbVF7HcLfdXfIwIfHa1s//tLZRSPO4/QEucQIAmlluUF7hDYEu2hcTAL/I9sVuFzSA8Pi48XnZvvLqb/txfUGOrfRnvq+9GCgOceyDbsLBGFPT8t8P/jlvpaCbqyI79HT4gij6yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XL54x9nXNHcKl5wQJYhewV+1O34TD5pTkuSexhnpxFo=;
 b=d2D6NofYtV1vFtIEMSeQ3H2uiEFuFqD4mwBbYcsMb9XAbY3Hyb/qsWHdOt45yFQNLmqmTGxrB5zDYshwAiE4PUFgvCcaJdJBAmrDs1RdpxW7a8NDeXO0CIFb0QV4fYVJaQh1nJzi0OYU89R10XP59NuAP859lLbaFYaZy10qctJh5er12xHwOliiXQB0eZsIvjR9faX3fHo30A5SDuhKmRUfGyIFx+onJ2tXw9oBm5UFchOjKRikg9SYueDCnLeAZ1cFoehb5NxE11rkm1P9dqvzvDyDoD8H2pMI1CFFu/OpESCyxKTIqaqKxzGWvRlkJEqAk7SX6EnyEVm+lOoCIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 14:56:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:56:39 +0000
Date: Mon, 2 Jun 2025 09:56:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 2/6] drm/xe: Use iosys_map helpers for WA BB emission
Message-ID: <r2alqrhauj7b3dbtmc6oicp2jevhlniogxjgggovw4axlyxzqd@5mnufxsin23l>
References: <20250602111956.14854-1-tvrtko.ursulin@igalia.com>
 <20250602111956.14854-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250602111956.14854-3-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: ac70ac53-667e-40d5-655f-08dda1e5add1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+1x/QGAUG6FGaWyx9waUDmJfYVPiaxwoMdNDTbFG7nR9yVF+cYhx1Bw97e7Y?=
 =?us-ascii?Q?h58IoqjJGgJtFJverhHl9mtnng21gfivRUc/SyKr6VutEHQqhZV+82jFudYW?=
 =?us-ascii?Q?PJvBcjOYBFKalrYh0ZVPeyLzU+i3IZdQuRDnYX9AXh4PYOjVDMB/2evZ1CUy?=
 =?us-ascii?Q?40FE3tVTpDiMXKTS6VvIM4ycYXPKulQRvpMwPAXsz/BAOihh+q4ukybPTOHm?=
 =?us-ascii?Q?s33gJ4Yh0F6kQ/i2trhRfB+VbICaB+KT+cV8K3dAPK/4GZpoNM0A0gIj+PY4?=
 =?us-ascii?Q?pEyMlq6DILw249vTjJ6hCKEGcAW+DBhDO2hRIy+eGBBpTJsQBbVMaBVFYKvF?=
 =?us-ascii?Q?h64ec+bhN/PQUgoK7bN+BxbzLdpEEtKJH0gt47rgS+kw9p6lOHag4zhAIgX+?=
 =?us-ascii?Q?i+Hrn/GETmQ2TvfSOgbpZbJzEqb39OX2K0LLK3gQchdSkd1qvHze+5CSAjxg?=
 =?us-ascii?Q?RH3a0knlzUnZPrtvJKFAb9BW2X6G0F7Jr+kyCa3E7Ht0t/V9EfY+QiekXPFS?=
 =?us-ascii?Q?pB2shKD7B+fN/iZYxGunHI9gCvAQ1D6Y07dPei7J6DSy1+pDqPZdkmilbrHw?=
 =?us-ascii?Q?ts/MK2utvZY9RV+TtNIE+IagLEeZG0yPg2W7vvUtqmBFh5tObQeMqLLI5ZOb?=
 =?us-ascii?Q?mykTxVdsV7aXsFb14PSUCvrEzCSFqoA0EEXk/IZRi09ICzswVeLnG2mJqYt3?=
 =?us-ascii?Q?/BmVLxhzkMoSF8TIb3YAPhecpccP2VSw8BXK+wC7toVYyc41lgKbtvOuBPFO?=
 =?us-ascii?Q?z7n1ycU6RETQ0OOd1Yvd3OV/uYlT6XbATFmjtIbMoM4XVq9klVnpRxMTwVo8?=
 =?us-ascii?Q?OOoqHdwYyyrNzabS9JaIcZ0gDAyRslK8uFvnkZulBOmFVt2WDCEd01mtqo+K?=
 =?us-ascii?Q?PNLr8nCp68FISiB5gS06EzSwKUSfSA3QsA76fU/xtYkoOn8GlR1dHz2IfjsJ?=
 =?us-ascii?Q?lhjF0PfgkdLHjRsJWactUQvbLqdn9I8Bw3YOgIlXDbZpeMUSXA+t/M25DC0A?=
 =?us-ascii?Q?cAh9eD4LB+ogr5+S6vhAbO6Y0alQl3bpcSBhzc8cHjN8grzxZJoQEWL/WQAS?=
 =?us-ascii?Q?KHrCS2NSVdOZ1X6X1wYBV1RjptUE7xuJ7oqaQNbMNvBm33xUTl4A8C+ssE0x?=
 =?us-ascii?Q?+uX2J3M0Ze4ywvf639Y37PMmw+//QzAPhCFxXzGbZF85dIq6rYZAWp3hTHaA?=
 =?us-ascii?Q?RhXP+lKtdYvjRmz8f6ffJvzZFGLvEUrtl31To2Egx2p+e3YqfgEj0DnsrWjh?=
 =?us-ascii?Q?toIkq3p9iLX2FpiA1XtvPICGBBaqQ596zw08ZBXDMGCqeVIAKPvVJvhcJbCb?=
 =?us-ascii?Q?RO0MYcFA7lXEiy/STWGZfwtOZ6RZTJt8lbxeFx3S8w9jM2JB6bZ+JxUoRJxL?=
 =?us-ascii?Q?pgka27NF59qpRfoun1IEHzHqpu8IqoQg+I1iDzxhsw5MtKRonwPLYEeP7HA8?=
 =?us-ascii?Q?0zB+cCtrxbo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vr83NueMC4kNGBkXbfQ0SQcPNu3swMF0ji9RTsI6h9UAm6FUkW0Agw9v18RT?=
 =?us-ascii?Q?QCYiW7H6H0e/1ci/bKO01HN5Yqzyqn9MWNaZvfFV2ftdhXL8xsSH5gxQyzUs?=
 =?us-ascii?Q?FqL67v0aW7WXLuEYRWS/UvxCqRO/tiGEBI1qUNWpab7c5QzZkzrncv6dvbsE?=
 =?us-ascii?Q?ovn/A5ptEK8JskNm+99pi0UjZPDcIyDle0YJvbELiC2kEu477dDnyix1oueF?=
 =?us-ascii?Q?NK2DFsCb1Y3XwYS22NVWPhgXLo4D5jDbdshK84JjST8a4/zu7PxL+Zrif5vl?=
 =?us-ascii?Q?Om6dWg34w+xLt3FhtrbUiIVgd4GnR5i20TTCpE8K1AAib5sZtjxADPBAcbNy?=
 =?us-ascii?Q?kLjjaM2gcO+Ub/2PF3quRB8XggMjRTS9UP8ZTet+43+G6idFa+t5qWfIV9s4?=
 =?us-ascii?Q?5GMT4hQHil46bgj7okb+bouaNEqVCbDbiObB2L/0Sey/VCEG9xbsfywjwsJ7?=
 =?us-ascii?Q?VJcNSzR0v0lKNfsQLjh+XEkRHAvYEKNuJuPDxHYk64brlYK0KlSjMvF+ApyM?=
 =?us-ascii?Q?40JYxaJenm3buYQG4oaWZnkJwnIvWE6ZjA6+3ppgkBSNqH1qR4qIkQ6kbL/h?=
 =?us-ascii?Q?Nar+g4LdnDEYEE8AyFx3Tztt3pK6vuOplDTcXF+5QnjxIqNflWHy2xS79T/R?=
 =?us-ascii?Q?MqBsGOf3IcSlT5ml0/HKX/ll989s2xfuKeYVUcu5qXwnA9yD97fcQsYMOfOb?=
 =?us-ascii?Q?UiG7sFbi6UZtv86jOWGXXysWeAW1Kn2LQvmAj3ZjlDxhRV2wJe5qYKnm6q1g?=
 =?us-ascii?Q?qDJgTVG55Sd3M7vEtCK5lKFmwAIdi8kEYqYEpxHLXo/qHR2xzV4wSXUjxDt9?=
 =?us-ascii?Q?ExbtN2u5utre+OC+nntn3qUJ1DAmww9LU4oCla2LDXCYuUesBoX9nAqkahRU?=
 =?us-ascii?Q?YLqdDNbw9BUqfPmuQ3sW0q1HtcBfn3jFIJg/ZuvU9Xro6zGcta0rRfqmFPFP?=
 =?us-ascii?Q?6jpKYYRrRfGLZeEA0T8t7zCdCUsHgIiI2HBzI8TDRz75lu69mQrB+fO6QYGk?=
 =?us-ascii?Q?n4gjuuemBic6RI/Cdpg1dqiBZ7skxUQ9lpo4y+SBh1ZS9bxwwq8+UsBrdH7D?=
 =?us-ascii?Q?JGHmxLs+DlV0CJJ9+BQNC+8JLDMJIcbtCSV8d/+hYL+WGc/HF7qMk793GA84?=
 =?us-ascii?Q?uUEWpFcoQW0oNqHTAxUcw1f844EYk/YP3MZDOHFXDPlK2gjJQOwXGVLJr/CY?=
 =?us-ascii?Q?hm+hXQA0qcKeq3UU0y3sAB+s2/aAzwoBEws3gIxbsgkU6pSfglqYb9nybFUr?=
 =?us-ascii?Q?4LGSc2tN5Y6PJsvUphOnjDgKvtWeISwqseIkc1I+Q6+VWquAiWHFjavb7Uz2?=
 =?us-ascii?Q?wUWShZ+kjd0cYYID8oJN/rAeqIPp/HHco67oOFIU3xxFAYYWZf9703+2Qqla?=
 =?us-ascii?Q?MEvBYkJtfrN0Y8EeuuIrtaIH8eZ+8X18lD1frMhvgnztXpOtyDQXTrfibav1?=
 =?us-ascii?Q?83XO44OfXGVpaKrqoPYcnyUEnPxgxAx5uKsOB2jhu9JoWFo5pczbriHTx+wt?=
 =?us-ascii?Q?DB2cl9KlToXHkYqwR9esmxpVuQuLMQBj3CeTbsiUb5kJH0cSMmLixiSHEd1X?=
 =?us-ascii?Q?w5NIaHJ6ESP6UKOYJ6AA+ps49whHwdPvN8fiv/AQQZ5LiL2XX+n6PolboReK?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac70ac53-667e-40d5-655f-08dda1e5add1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:56:39.3989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iETcCHkB6x/5nGoI/W1Xr9glHjn5wS4WFCJYSQ3Tg+C/rH3t8xbbXp/LBigEhJpt+l+XXKetOJ7BpdLKC6glL4x8yjlote7TjmdH0z62SC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
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

On Mon, Jun 02, 2025 at 12:19:52PM +0100, Tvrtko Ursulin wrote:
>To properly support discrete GPUs on all platforms it is required to use
>the iosys_map helpers.
>
>To fix we emit the WA BB into an on stack buffer and copy it over using
>xe_map_memcpy_to().

For https://lore.kernel.org/intel-xe/20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com
we will extend the WA BB to other things (and that is the first
additional user). I don't think we can keep it on stack. For my next
version I was adding the patch below to allocate the buffer. Let me know
what you think.

commit 28dbdf201133d92b0e0b0a0139eae7fe5eb9e33b
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri May 30 16:29:51 2025 -0700

     drm/xe/lrc: Use a temporary buffer for WA BB
     
     In case the BO is in iomem, we can't simply take the vaddr and write to
     it. Instead, prepare a separate buffer that is later copied into io
     memory. Right now it's just a few words that could be using
     xe_map_write32(), but the intention is to grow the WA BB for other
     uses.
     
     Fixes: 82b98cadb01f ("drm/xe: Add WA BB to capture active context utilization")
     Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
     Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 63d74e27f54cf..1b835d7efca2b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -941,11 +941,18 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
   * store it in the PPHSWP.
   */
  #define CONTEXT_ACTIVE 1ULL
-static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
+static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
  {
-	u32 *cmd;
+	u32 *cmd, *buf = NULL;
  
-	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
+	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
+		buf = kmalloc(lrc->bb_per_ctx_bo->size, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+		cmd = buf;
+	} else {
+		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
+	}
  
  	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
  	*cmd++ = ENGINE_ID(0).addr;
@@ -966,9 +973,16 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
  
  	*cmd++ = MI_BATCH_BUFFER_END;
  
+	if (buf) {
+		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bb_per_ctx_bo->vmap, 0,
+				 buf, cmd - buf);
+		kfree(buf);
+	}
+
  	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
  			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
  
+	return 0;
  }
  
  #define PVC_CTX_ASID		(0x2e + 1)
@@ -1125,7 +1139,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  	map = __xe_lrc_start_seqno_map(lrc);
  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
  
-	xe_lrc_setup_utilization(lrc);
+	err = xe_lrc_setup_utilization(lrc);
+	if (err)
+		goto err_lrc_finish;
  
  	return 0;
  
Lucas De Marchi
