Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C322AC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 18:47:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A4D10E0E0;
	Fri, 26 Jul 2024 18:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwTt9ZD3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F2110E2C3
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 18:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722019645; x=1753555645;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Czfnb5PCnyZYRfNCsvB7BGyBJ+RVeKd7YGLS5PZPQBI=;
 b=mwTt9ZD3vijOa4YkPTcdYA27af9W34tUdWws34oAQjFfxPOtbSYGiq5v
 5y3fI0NweOwfamA5F1zWuC24ESoC2Q111V6N13PLh7cOgl8e8vngSOHxi
 uOvkzRYIQ3yCRFJFEgj09fwVCCbmz/elvMP/Bna9suecJ6kdAy+IeVh3d
 mtDGxefotBY47WF8wwe5z6JmFSMjrxakSkYksqTb1NqwT2KXBcM2M4ciW
 6vlKNlFBYWHnb+CksratInJmpaLGLvq/FHIez1mohN3TKRUfj/WKm0yNv
 wZLjHf/pR6LqJP3YkQmbz1LGAKt98hdevQw6r0HaF700R4jAT2MqzzG8V w==;
X-CSE-ConnectionGUID: XBEqp69SRTKGhBw/JLvAGA==
X-CSE-MsgGUID: oy+OV3f7TEW8CiDoEc8deA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="37339337"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="37339337"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 11:47:24 -0700
X-CSE-ConnectionGUID: mC326wQITa2WXVOaTcHOog==
X-CSE-MsgGUID: f9aWsaiKSzSFy0NJ9R3TDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="53262069"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 11:47:25 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 11:47:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 11:47:23 -0700
Received: from outbound.mail.protection.outlook.com (104.47.57.168) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 11:47:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVPnKnT+D2s+eB/TxTao1EBH1sD+RRSBh19neM86L9myMzYgeo1OMLAd3hphAQ6l1pRHYCQIubXcfDa3z7HHqXfXByEoeG0efz4A4QKMK5Wrtz1MLM63lHO0aQEo1+Sq32SRxt+CJrKHN4DyZJRmCBXaBgJ23ueVZFuM4fGpEjo8UShbNKSDtyuOw+rZfCLwXeBGm+wPDV8PIQ9WqVSmUdZKaJTjolgYxK2rlZPXuldOWPl+Bn2ufBipgFrf7829M5S/CRRNtIwJjrt9sGHsd9aGauRTx6YZ078lsVYm0awy2j5THmijwwExKanNZoWLUJFfnan9/RiASeTqaBxWSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqMYqpAFXo0AwCqoB/hNM/47HeQyz45qgvdM8n+hU2Q=;
 b=S7FHTcG1ftZcfhpIn2qxuhyCJE1zG/Kac8q68nedn6jKqDO1GfrDhInfRCVNNq+gckCef3h4gfqgwut7i9/8DiC0ZbYYmTGIQy+dZmCJWxOfR8ljLOrx2eQlVpusppWra47M51R8oegJ1YsNa43n2uYuPBOrQ6dfSi264oqjOAgrKdpij/o0oozsA/5lFToB4Q+gkpq7goLQPQbkZrqU6cWiWUo1aos7eBkFUGQBgIIHeYRn0HG/pONOiCTqrNot18pU5WZxz9/1QMJr7ZT0r02vU1UQJqeD2EiRqJ61RGSiFzeAXjEWL4nIMWQ80Ci7CHD6Xr4dgRRsgQ7CjnHdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6655.namprd11.prod.outlook.com (2603:10b6:806:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 18:47:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 18:47:21 +0000
Date: Fri, 26 Jul 2024 18:46:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 15/21] drm/xe/eudebug: implement userptr_vma access
Message-ID: <ZqPvBYnU4ULY1BxS@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-16-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-16-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: a812e6d0-5b60-4ccb-f779-08dcada361b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U3Lka0ZGUJonQk8wx0FaBbEyFx+Y2C4h7HUHdnc6zFOKA34IUVXl/Gc3RMgg?=
 =?us-ascii?Q?agXgtlEKngmFzq3heg426C2yO6YblgTFCMkY6kO0siHxUu1eF53rv9yU2Wym?=
 =?us-ascii?Q?+M7+4BSSQnuKS3hAnKozcEuO/Gzm8hCJmHFzCWzlnrjF9AfJUNQ6gd5qlKYx?=
 =?us-ascii?Q?WOlD/zzJyCcA+7mwxDSJQ9qjMgUSna4a6U4Npl1tEWKUB0Gho8yszSzzadxu?=
 =?us-ascii?Q?79OTlCHOVAclyjDYEpcF4HuLxFPAvFfKrrYqfCa1jUPj4Bz7EKDX/6m93swo?=
 =?us-ascii?Q?itmBoX5Un/Z3U1oOYx2AVVfg3DWa21p8f0+p3DDDNznaP+OTlS/sQU3KvWTI?=
 =?us-ascii?Q?OXCYkEZbkhFHy0sQXY0LaR5rnDw9rY7+fWgisXf53VjH+zkc+u6Ku0qNcjjw?=
 =?us-ascii?Q?gozomTPLTOEcTnxzQW6dn+77VBCnQg6qMkdcTIi5gRcVwTh73bU268OP1d0L?=
 =?us-ascii?Q?b/vO4dRiGZJcqb0YY/OXLZiSS9bTET+Ip35N6PwlZgpIvEO2f+ysuxdXOKyg?=
 =?us-ascii?Q?YWrZye+ySXG8uvoKFWPzDfNuRd8p8q8ft8utYDeWEdTVPxDkTnW3JYIr7WPO?=
 =?us-ascii?Q?GCqX7onpI4HCLwtgfv/bUOPcMAehlRH3hlWcIgSV8k8cxG0+mvMxFJZL0aIl?=
 =?us-ascii?Q?N/78s74HBDZTsv9YNPX1d9IqMb1d6VimUefEi4aoZtu+FIo1JOITUZBzIhO9?=
 =?us-ascii?Q?rmZbx1Pext9Z0sFwjSSxGWGulb1obMU2jAdKQfLWLLlvdvmbBtfM4fA6bpft?=
 =?us-ascii?Q?3QbHPGtUgL7N7SldMw7bQB7EC4shn3GXg30oXxIgoaCTZ1FjkIYKKU3mDWVf?=
 =?us-ascii?Q?OT5psfVvGJ7bjT+uvZ8Vmzv/Nb1ymeVf9cEIY11JcqmB6MzAxXECoJO7vNcf?=
 =?us-ascii?Q?FrqR+VsN2A6QZ2kYsioB1o8vsbvg8IkBbyGY51PF3vbdGuaaNIA9gpvlD3Jn?=
 =?us-ascii?Q?HS3LQaIvR5dzssf5t9OXGGgoyV6xJ2ejzuAje7Nr2C+gI4NmWzDEAJvH0LrI?=
 =?us-ascii?Q?KTI2kyoeHS990BO/jM+IfBIAxm/OKAl5Vxqff/eKkjefUc4Z3bz/+jDpA+M/?=
 =?us-ascii?Q?YDh/Q0ODZYf4WKL+vXdIaN5VDjGdgwwG+4wiLyEyHJtWLVwbVGsR0W2IEpBn?=
 =?us-ascii?Q?nLK87G8nCS7i+X3TS/ExkO0xhzOMokYZ17HCiFAkbaa6uaJ05BICmb4JWMO8?=
 =?us-ascii?Q?9NKzv9b0rjUV6qLq2Kz+xirkNEboD65C5IwNAGELhnIYYEmCw/mMca3Y6X7Z?=
 =?us-ascii?Q?6xO5/PrMxlt07SCPCtbf8MftXrPNEjh2Swc7krylzyEN1Wl0gkdql9nPde+g?=
 =?us-ascii?Q?47guukyq5RUaMSpxhKxsghomCy3/5MmwhmL9+F7KR5QNLw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RqtMkdNnibMTR8oBaMkdwGdrxUe72a7k6/mxk2XjJZFzIZFIJa5Su4IP3kFl?=
 =?us-ascii?Q?H5Bc6qVxPs/eA8XTDH0LwBh6vxyfck2mHupcrzwXooQnbT5aEcHZW08wATEi?=
 =?us-ascii?Q?oi5O8ZOmZIZglhcq3EIKzfd6nLDw0hkt5bFsoLtO5MuxtQ+CN1eztP//e1z3?=
 =?us-ascii?Q?v6OaRQbNrlsgUbGzmgFjI8FQFZfDsDkxPyKMazHhVqUbH/O0BFK++vwhavc/?=
 =?us-ascii?Q?hHuEMticFQxXprCAt7mumA3+HE4J5gih4o3j9GS1jlDplWi7Z9YEqokUxcix?=
 =?us-ascii?Q?DqUosTl1ruihkxpP+GgBQbM3lBUuiZeb+EhQsEWmqvHd+lYLvTZk++eTWaK1?=
 =?us-ascii?Q?3aBREtj3FgwsHJYRTrHffXiwm9XH6PPvziIF/HcmxbjoLwYuqbot6AG0Hmn2?=
 =?us-ascii?Q?V8k8h4PvHZEeUivYA+smz0aBjsjDs+a1B/OG2xAnDtXMFZqvyrSEeNEDMXQM?=
 =?us-ascii?Q?wX5EzGhfc+F64mFf1DzrcRnPM6wv3kXQAZzSaIUtdtUbZyO3u6qbjGDCcKJN?=
 =?us-ascii?Q?iTMiG12fAd0VHnMmSY2YXJgb8kDFh+08lltTwLiueklSFqWhWQ5hJFpsPgwR?=
 =?us-ascii?Q?PO9RLn2Y9FOPx9+uJeVK8E2UnyRoEWY5B3l34U1SNZgMrowxfjohm249/HE/?=
 =?us-ascii?Q?jPjnqiPxWMQjgTEKEXjTbh+P3Pja4SIgdWSyZif15oD1UjWzTT0rLeRMiTpF?=
 =?us-ascii?Q?eRE0LZ2N1tZg3Bd/Wis7MYjD7IJSxOzUq6jdukP7i/rVZGPoC2fajNZuMIgf?=
 =?us-ascii?Q?LTc7FSOgCjgpiQ5vllo08xxoYzOrBYifm/rScXpY6YFDFeVHnenay3JNlR65?=
 =?us-ascii?Q?sHgY2khoK85Y6EkO/NEwHOfUh5DieW1v6OPoqDdf2y9Yjwrk4sE/WduhEpsB?=
 =?us-ascii?Q?QLBtE5DyiM7hbu2zozCxpxc3Kr5RqFPXLGJpc/TbcO+lVsWUmeaEMEwZPXl+?=
 =?us-ascii?Q?mkd2DaKTAtdk9HVklTy7KkPR3zyaght/Fu/ECkdm/qeQPjkQJ3BFUlmQY+Ql?=
 =?us-ascii?Q?oabJ00V1evxRollqhUXPa4XTdmwpfGy4v8Yrpo4k3iBrJGRrkYKF8j+C31pP?=
 =?us-ascii?Q?I+BgIHP91JO4PJ3WHXLXtWAMhJ6u48PyLfa1PbEnY5ryWkxXqGSe1jUBhXfW?=
 =?us-ascii?Q?Q1ux9gbBlMl+JxwBpqNSLDX9v+sAa3pN0to8fvAme7Q3vjs82eI0ea41DVfF?=
 =?us-ascii?Q?qugyJdYrQE9tCPEBCgGyIN+bWtujbFsSkbrGmhCYTalEDrMPlm7exd858aZ/?=
 =?us-ascii?Q?dGeH4NkD3gah6z/A2Dv9rzeRp4k+ygqQYWPuHzsZdNbMhUihr4HVUbdl9VBR?=
 =?us-ascii?Q?rJiZ7pYzZ/poz4Xa2ZaMD4pyBjnmIyvu/vKFBvZrFEstGNsdCFLsx+MXu9hE?=
 =?us-ascii?Q?UkZP6ZX5AHoe1cnBrJ2mKb1yLxCLK6acR8OwY6+CAH9F6x6uJZFq5Xbtg/ON?=
 =?us-ascii?Q?HkBDcXy+S6B8x5B+wwvbRuOPUr+3WVjsxw3KLd0x9ifLGAERT+2jMoUlAU73?=
 =?us-ascii?Q?y4v3GLw6S0Z2D1VA7fcQlLEi8gzmi2Ry+yY9HySn3tYN26OaLrZJf6pYjg7i?=
 =?us-ascii?Q?9xgHCOYRYo4Re+l6HuofuDqi4OXvwrcKXSQhPs2DKAoqIOz2+aXnp4gOGU1L?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a812e6d0-5b60-4ccb-f779-08dcada361b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 18:47:21.1460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENtAKzAW/UGt+JYBScvRmRg3AnUGa9RFO35NSeVZwFulUYDSjOsbAO2NKAEeNWWFEGRFf4wlh04BqY4XWXFIMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6655
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

On Fri, Jul 26, 2024 at 05:08:12PM +0300, Mika Kuoppala wrote:
> From: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Debugger needs to read/write program's vmas including userptr_vma.
> Since hmm_range_fault is used to pin userptr vmas, it is possible
> to map those vmas from debugger context.
> 
> v2: kmap to kmap_local (Maciej)
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_eudebug.c | 56 ++++++++++++++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index aa383accc468..947331c19f43 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -33,6 +33,7 @@
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  #include "xe_pm.h"
> +#include "xe_res_cursor.h"
>  #include "xe_rtp.h"
>  #include "xe_sched_job.h"
>  #include "xe_vm.h"
> @@ -2852,6 +2853,58 @@ static void discovery_work_fn(struct work_struct *work)
>  	xe_eudebug_put(d);
>  }
>  
> +static int xe_eudebug_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> +				  void *buf, u64 len, bool write)
> +{
> +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> +	struct xe_userptr *up = &uvma->userptr;
> +	struct xe_res_cursor cur = {};
> +	int cur_len, ret = 0;
> +
> +	/* lock notifier in non-invalidation state */
> +	for (unsigned long nseq = uvma->userptr.notifier_seq; true;
> +	     nseq = mmu_interval_read_begin(&uvma->userptr.notifier)) {
> +		down_read(&vm->userptr.notifier_lock);
> +		if (!mmu_interval_read_retry(&uvma->userptr.notifier, nseq))
> +			break;
> +		up_read(&vm->userptr.notifier_lock);
> +	}
> +

I don't think this will work without lockdep blowing up.
'&vm->userptr.notifier_lock' is taken in the MMU notifier, the MMU
notifier is in the path of reclaim, thus you cannot allocate memory
under this lock, xe_vma_userptr_pin_pages allocates memory.

I think you are going to need to pin the pages first, then take the
notifier_lock, recheck the seqno, retry on a miscomapre, once the
compare passes it should be safe to write the userptr.

Matt

> +	/* re-pin if necessary */
> +	if (xe_vma_userptr_check_repin(uvma)) {
> +		spin_lock(&vm->userptr.invalidated_lock);
> +		list_del_init(&uvma->userptr.invalidate_link);
> +		spin_unlock(&vm->userptr.invalidated_lock);
> +
> +		ret = xe_vma_userptr_pin_pages(uvma);
> +		if (ret)
> +			goto out_unlock_notifier;
> +	}
> +
> +	if (!up->sg) {
> +		ret = -EINVAL;
> +		goto out_unlock_notifier;
> +	}
> +
> +	for (xe_res_first_sg(up->sg, offset, len, &cur); cur.remaining;
> +	     xe_res_next(&cur, cur_len)) {
> +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
> +
> +		cur_len = min(cur.size, cur.remaining);
> +		if (write)
> +			memcpy(ptr, buf, cur_len);
> +		else
> +			memcpy(buf, ptr, cur_len);
> +		kunmap_local(ptr);
> +		buf += cur_len;
> +	}
> +	ret = len;
> +
> +out_unlock_notifier:
> +	up_read(&vm->userptr.notifier_lock);
> +	return ret;
> +}
> +
>  static int xe_eudebug_bovma_access(struct xe_bo *bo, u64 offset,
>  				   void *buf, u64 len, bool write)
>  {
> @@ -2895,7 +2948,8 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
>  	if (bo)
>  		return xe_eudebug_bovma_access(bo, offset, buf, bytes, write);
>  
> -	return -EOPNOTSUPP;
> +	return xe_eudebug_uvma_access(to_userptr_vma(vma), offset,
> +				      buf, bytes, write);
>  }
>  
>  static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> -- 
> 2.34.1
> 
