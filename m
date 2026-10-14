Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DDFCC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 18:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CDF10EA99;
	Wed, 14 Oct 2026 18:10:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43ECC10EA81
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 18:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792001412; x=1823537412;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V2QV/wPVhqIQc1OMgVz2orT5xRXz/zmx8CHEhDjU06Q=;
 b=VZdx8BGL0cbEXZO+XSm6Nn6vfQrl7Dt0u2BVeZxehzOm+VQNzQuygQr0
 3HeH7W50WaxtZaBn2mo4kgQ9n+rwOdUV1BW4up7GkoIUW+cXiczATxled
 3pQrqI5v3byFdTuWlCbl9qi6gXLmhEKCr/efJznhQEFAhuIvm5anv/lEa
 FGr8V/kHYhkVv1enRklQwoIdXiV6hWZ9AFa33vEQuCVAmZjIU4goVFh6v
 hQg/6yEGpKS7bCgRwLmd5moE14BpXj3WuUQtRhXpilXYaUawxuJLXrzzX
 ncS5f4BP8yB9Q2i7+oBWlT40Njmv6A+dhhbUWzQrWF9jxp07dJPMBtYTq w==;
X-CSE-ConnectionGUID: ZnREwt+BRIeNcwe6nnnP9g==
X-CSE-MsgGUID: 9tdwooE6QGGNNyvjwgurXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="762870"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="762870"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 11:10:09 -0700
X-CSE-ConnectionGUID: EuzkrHtHQyeS/4oWW66Cqg==
X-CSE-MsgGUID: L06g91GfTByxTj6y6rkibQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3251912"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 11:10:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 11:10:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 11:10:08 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 11:10:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceJRHNgm3lsdW/0R0JjL5e5wa7ElXBQ/9HN5/9uQ05l86KGD4Iu7Gj6di+j0wvMh8hYBBGm3/BflvY91raJQr88SeS77frPAngJKSZUERukB5zBcz7YIZbBvPMdKW0lQXP8AhBke4BhfxjhOru2ntZRMDWPp38VEvWgSZIquVywgjmh6sG3YHolaW57bGh/QWOCNy0jdd58Mqx6cc63LA6AtEWfDpD74GRFwZWwoq+Dl7+B8VvaPHfZvZJ2sgR6EUOdSpyxYDPvCZla+jFQ8OpOOkz1w56vF3IJNzJ9wiZ0MOUNvJFDNqGI66f3OjG8oCiG+/L2RYNyn9sDnLdwdmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0r1uag0XdOJ1ix3AJaBiq8nTfFkoDu1hdySmQpznvkQ=;
 b=wC9ZaqZamTCWu0igtGQOO7Y1i1bJF4Pu/gKoLXlwetks997IwkKKwqi1bsk8LZg3VkWbL3pemqJSaiDjjCIYhKXggj4AefyV2NUdr9T3p2mvRJuxdldgeq/HFPZWFoCiqitwju+cR6LEll0CoTTJS+rOH8Efbt4uAr+iK0kGKa+bMtiRGtDwv0Z7S0zN5i7X3XUUq17zoMuYmxRdI3/pdnz3N1UZlYf2HI8Ign5eMVLINWND3ua8h6V/iVXu+YTnmBhi1Ssjqgipcneiv9hZqqj+WA4vHGWILDD8N1+yttQgOc1/n1lWbKQ88f134zAmxAMWmye9srWE+4MB+KWxUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by CY8PR11MB7800.namprd11.prod.outlook.com (2603:10b6:930:72::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.24; Wed, 14 Oct
 2026 18:09:57 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 18:09:56 +0000
Date: Wed, 14 Oct 2026 14:09:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>,
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v6 5/7] drm/xe/pci_error: Flush GT wedge worker before
 bus reset
Message-ID: <as_FcP8J_3S4Wsp9@intel.com>
References: <20261014055215.330408-1-raag.jadav@intel.com>
 <20261014055215.330408-6-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261014055215.330408-6-raag.jadav@intel.com>
X-ClientProxiedBy: BY3PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::12) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|CY8PR11MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ddef806-7df9-481d-51d5-08df2a1e5a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|261009221227099003|261009223327099003|261009221727099003|261009220027099003|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: jDvx43bqN3ffrRe8B5eXyoalRt7jjG1+DXWr1NXF8vSob/3ze3q+Ovq6l1CDZfklItnQKpueohLP8FGssERU81pPpUxcqQiJBJjOfVHOaTKxq+sHSYiGi5Xdz10cUtUvR0DMrTigjPZf74aLRKbD7UHwWIlmzInJJ2ySiAne1Nn474OSmKKPl3Gvb/zxFe5984EqIDNE+G9s1qpskXc7uVWe0FfJE2CkCpt7/p/C5rjdLUKg0UeeIV97T0W/bHRJJ6MzTzPqz5iYKQigtVN1a9aVXQlYzcUR5elJ3j2CiJBtjePx07/pPwtmEypjkU94r3URqcFicCYH3DxTJL6OxytuOgKdHcn22UgELy0PZUw0vakqhSC0Q02oqV12KBzj/RBGRIQD+LrMLTQd5cLIWCyExxqdiT1DRZStMxp418NAgXm5omIppdMqmMwzA8DhzMm2IVUOJAU9asLxu8OWIQWgQO9HeoxJ9StQlnjExXpjxHIyVikkZImdlMkiee15EZ7A5LQj9xm57/OHdfTytohTrYCbtoqjM6JFz5ZXJrjwpPFKofB2XwTLgAjOoMnEJ9+yL8oC+CrPFlhHR1CZ4otQraAIW9fHGIecY/lBs21xRSDsWyIcYa+7nKrjYa5WzKxqi6xgLBRIonfMtyUyMptYaSdMRZwwO7HJnHnGjJE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(261009221227099003)(261009223327099003)(261009221727099003)(261009220027099003)(4143699003)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NcUOqA7vDpqDkMk+fLJWAwT+EphxAAXhn4gFloOG+7mA9AU2nuJlkK28WPAr?=
 =?us-ascii?Q?Xo+LhrWBKt3FgsEowcWnpyFPU+69BrWC8p0RYq912yDqzvcVlF9WFKsSFe2n?=
 =?us-ascii?Q?JkFHpEko2XK6FHCcy4SsfyqJsszbTmyKT9ZBb/yV7HYbmv0ZCiNDygYazhY7?=
 =?us-ascii?Q?Ym4okduiMSS+g0orA2Ls9oei+cGwiEqf2xq7eTc9p2mfqC+Me+5wFt5rRnoh?=
 =?us-ascii?Q?ld2HW8BQYxORSFhtJ7XpviG++8iDDZyiO+I+7cveg/+d7WvB8jJ6QBFXqbxU?=
 =?us-ascii?Q?vECqB3UqFAlxiTQkl+qOR9h3ABIfCutfY/wuouc57YydCnAzCUh44cmBPTJW?=
 =?us-ascii?Q?PzYXI28gHyJsUmyn3AkwL4IEibB+4/BrH1XduL3lK8BkLON0mimBpoD3P3Tb?=
 =?us-ascii?Q?HFfOFIMSp20Ro5KWSn8fiNz8ob/GA3JQIKEDyfHA4Y9dhXw5S+d6zo6/PEN/?=
 =?us-ascii?Q?ldOlDwGRoDg3Opfl7+W/0pWpt7VaDEQj9HQCtThiUAK6KWeaU+AC5FCVq9M/?=
 =?us-ascii?Q?nfLnHwd31/Raki6+Px/0Q2cxnCPWbQe5cT5jKVv/XbTebRZ3JTmtrtVCy2nD?=
 =?us-ascii?Q?hYgkVeDPr/c4yyhabVPoSCUo+2D8ULWQkFJhvK39giIB4/8t9SrcUgRObD0l?=
 =?us-ascii?Q?KJ6ji/zqSb9O/EfqLbcKlN7gd3SCoF/6I0ax8sBYbGxbgqVjyZnsrKzWIQ0e?=
 =?us-ascii?Q?r71//Ab4tZnAsmyEwYEeiySWYnA1F3rB7kmVFw0ioCN3PxRY8cDfiD6T5t+W?=
 =?us-ascii?Q?Y7yEjg4eHqTi9OzVHFB00kKmYDYP1cY/1Q9Ve6fGc9w9M7YzeqBgsf/hnOTE?=
 =?us-ascii?Q?rlTQIXKmjHSYpdeLuhujHg+3881hT4fxgE59cICz0KSi95IKtZO/fGTdrIcC?=
 =?us-ascii?Q?irrp79iljyGMxowXhk15meQ+jCA4ZMEjuWsiTWuPfujm2OKoWw+xGzFU+Ab9?=
 =?us-ascii?Q?gCl/Zurxab9ulxOBw7fwPtsDM//3IQENtiuKUTeFhZxD8SetZDy3Pn9+ljr5?=
 =?us-ascii?Q?NB/sIvtae7AW1uhfr7RFhXwVvzP/59V4eK1hgNljo5dW75yeuL/U0fSmC6Aa?=
 =?us-ascii?Q?z1+q40HzOb8ZaYFAhqsFpR0vXjJndlXN4xOfhMjsUIUf7VE5Dp9lxpmVu6v2?=
 =?us-ascii?Q?ZJ/n6O6lF/8Lay+5xzsf4pTIaRnrmG3WgTLflbZ7bdzyf6yCgUcwNbiutJJA?=
 =?us-ascii?Q?Ma0Bfs+Ph+viH+eq6LKHtafL8wLb4UyO71QlLIhAx3h3ACjkykQaJ4sUYUa4?=
 =?us-ascii?Q?g276MaaWyj71AiB2s8O8jFqeiz+oHAVc87iBF7Dw14cFaaARc2LlO+b7NZTt?=
 =?us-ascii?Q?vAc4MnwVdEOT1LMEGjCTSzKaSFqOaNnkqc8kUgOt61G3ZoN0g/RNOoHPtuHv?=
 =?us-ascii?Q?EQwY6f4DCSoGIJ8r7O8I9sqD67isPANU0w0dYmvDaV5KtgE9cJFAEr+2gn68?=
 =?us-ascii?Q?e7FQV3RI0aoi3WQUN4rTi1NjPSsCbFVxMKUNMbJoRoZDmOaX2xx/kgCmB3m4?=
 =?us-ascii?Q?RcICK5f+pP9Lfnt/HLNXeq8rsm6L7iDc/A4zQTIBQZWXTOKnO6ydzgfwQHul?=
 =?us-ascii?Q?vAjxSJ0cs5q1wVpiRouBzxh9qMkNHArJ/InmoQOzdb4QDLHy1NqBjs0HeChM?=
 =?us-ascii?Q?5p3gw3bGwCJ7nBwvYs3Y801PS0SfGHxDxHOt4CThCXZNwkW1+bbrnT4h/QNk?=
 =?us-ascii?Q?u1WQkS4FYbxLE1Blk8m2cVPUPRgXAwkAqZyaoTRTDMnAFzbS7GnLnwdbS76U?=
 =?us-ascii?Q?sCCEUEt4WA=3D=3D?=
X-Exchange-RoutingPolicyChecked: IYcsqArMjDxASUWTXBL14w9YAwZoXCXdxI1TPJZ/P58OdeG5xBycMFtduUdM6GOkuq2QI1RkIGlrCdaqdXiHoqXGYK1wbKxdTMg6v5ur+I1e8eYkTob5bVjRDe7uVcNU8f+Iu1cU7B6Ft6pSvh8VUjAUQR2unm5doIOeY18b8Y7d9PtsUVDGAfg1PyLtLSpCjV9+vv4f6TQ00IdaS418SwENw/CfL5hwjiPO7EJ0zfFDqkwJ72fzvPOJprTusagn2KvZcB755yiIZL5hZEJKiL67WRpN4VAEL/ShDlwhFOnXAjPUv1ayXHlrbbJnpHC3m1jk10S2g5kzdPccHZBD7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ddef806-7df9-481d-51d5-08df2a1e5a68
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 18:09:56.8165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbqLgTB4IoyEjfoFIrdNgf6qtoURj3aeJO/GVWuk6hs4nedhFFSkuSBICzMAI0vQFsjfkmTrGek2k6ZHRC3O4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7800
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

On Wed, Oct 14, 2026 at 11:21:22AM +0530, Raag Jadav wrote:
> With GT wedging now done async, make sure the wedge worker is flushed to
> avoid side-effects during PCI bus reset.
> 
> Fixes: 13b9555ffb03 ("drm/xe/xe_pci_error: Implement PCI error recovery callbacks")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci_error.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index fdecd3e0b9a9..1dc8291f37ae 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -30,8 +30,10 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
>  
>  	xe_device_set_in_reset(xe);
>  
> -	for_each_gt(gt, xe, id)
> +	for_each_gt(gt, xe, id) {
>  		xe_gt_declare_wedged(gt);
> +		flush_work(&gt->wedge.worker);
> +	}
>  
>  	pci_disable_device(pdev);
>  }
> -- 
> 2.43.0
> 
