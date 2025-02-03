Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D85EC02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 20:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4CD10E565;
	Mon,  3 Feb 2025 20:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKGOxFso";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A1610E565
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 20:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738614818; x=1770150818;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=607dxRbqHaKo8Uhup0T6T7xxMLA1CgMn2sT1ti6TVbQ=;
 b=FKGOxFsoyziE8w5ujnGC5GiAIm1iMD41nEVpgxmA8jreE+Jmc8NuSWZ3
 mq5uWckr3ELyVkhqApb73wtFSSOrjVsC415o9OrMboFHUY3AojD3xXNyy
 HcRlVQXJEOyQG5M3XR6Urq/ALEBW89123+yRDEFx4n2WvQm2hp2YhTDT4
 fkqxLra74zaNaM+4Ey/wSJU56MFkMUAii0FEgeB09njfgBqrMLxj+9gcU
 syBdcb4EdtRth9VwVCGTxgUHxgULg+XggOYYNJ02xkwR18eSXVek3U0xs
 Ff28DDHqX1h+J5W8sRDO2wWINhbuqjOET8QXzMmZWyZxlNP+G2rMUe321 w==;
X-CSE-ConnectionGUID: 5zjL8SY3RJmKSl3hthslbg==
X-CSE-MsgGUID: TcwIjGchRt+NOZp8YLr9RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39262163"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="39262163"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 12:33:38 -0800
X-CSE-ConnectionGUID: ZF6AzHToTWCT2LfBO5k+HQ==
X-CSE-MsgGUID: frcm7s16TaONXcbdMDQSjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="115377380"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 12:33:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 12:33:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 12:33:37 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 12:33:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnOEfO4IMDztUkqndMe+EBY0rnkopQZiyxQsUJac/1bMy0HM+HX54h2WqOUhOXmdq19O/gE9nw/jx4uEtZObaWnfr3SiwVpsvwG11GVUG+eHXtqYGDQACCSP4YfOkvayD4Ld2idmcUhYgQhyZMlQNCOIy9sTQse3HSeDwUL7VETJKAroYXSdbQ+6T1TIOGwMuXbx+cOHno5rWnWFWqd/sdLI8JOQlRwI64qSnNmsaGAVQN92yQ1NEe10yeORiyzw8lbgmL5lh6M7m4ss8zVFNvrDwEvj4SzIq5X/WExAXcFCC5KDCjtuOZTSJ3CrFnGFm7qt9hWketUxKBrX1hVhhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsXII3RTkYRBkOFCjEPLuJeFPcuxxQiUnubxmy4OP9g=;
 b=h2Q4Zfl/vsBMgfiTHV542oMo0LbAN3/f4strzkH8CbiPLIHW6wql+mmICZHNZWcFL6+YYRnv63ySpVvCH6pTbvopHh9u3RZ4Bq4Uj3x6DfN0a8C7x72kYKC8N0DHYpe2wN0ybOlt2s326qK2AT0SGdNK8vZcV16tZ92EjAgrv5t/timyWPZKnMlJ8dDdNF5FNIwvYs5x7OTJMOzWiDXxSu79WoL9tjW0QE356uJU5MUhGj9dzilkd84CMTUmKA7AG2QBzbMtoUaD7IbcHw+Sw/rPWdSeBwAO1GTj40uTUxUhAvOeVmOUjvzNXwu7D/QpypOGuKgdbwGzQjL9nH40Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by LV1PR11MB8842.namprd11.prod.outlook.com (2603:10b6:408:2b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 20:32:53 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 20:32:52 +0000
Date: Mon, 3 Feb 2025 15:32:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>
Subject: Re: [PATCH 1/7] drm/xe: Fix xe_display_fini() calls
Message-ID: <Z6En8FB8DY9zQjoH@intel.com>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
 <20250131223140.4144292-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250131223140.4144292-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0320.namprd04.prod.outlook.com
 (2603:10b6:303:82::25) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|LV1PR11MB8842:EE_
X-MS-Office365-Filtering-Correlation-Id: b81f5091-3b1b-4a8c-8632-08dd4491eebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s3N1WyAx87pg6dKYB0bXEXxSSLKANyMkaL8t93WUYorzgymJUq+hMnhQmujW?=
 =?us-ascii?Q?bc4yiCAg4I4+4keysorDs8CpfXsBJI8pbVCkq2LfJiX4SD0T/NPA5Si0B+Mi?=
 =?us-ascii?Q?TMZ0kAg/kv2tmzLIRxRP8XA56KloGvWawLrqyN6iEFBNunAv33WUnK0meGgV?=
 =?us-ascii?Q?ttkUgE/AZ2mLbYTppPbkvuiNqNyXLjIbjszOVsEQzPsKN/L90BUqbUgonoNb?=
 =?us-ascii?Q?D/8W9KkgHQdI7kdor7xnAZ8umBMfjxg7lzZy0hs7w9D0iXkq7lOFF6/qi/4s?=
 =?us-ascii?Q?hLphTs5sAoquJXDrkkcQyaqGLJUdVftXfDU8Tx+kTXOnSWC/w9zgEIIf5zE/?=
 =?us-ascii?Q?G6PO3XNNkpy8ZF9JKYx/mlD+cIm2+s6Hel2udBTaBzseqgZOrwEWAw8I2fWD?=
 =?us-ascii?Q?Sit1LnGgkfyJMGJzvyo+aC187B7GS7EdMtynk+6phmCWQfk3Ic7ER9OM3XIR?=
 =?us-ascii?Q?T9cZgjz3/2OvK3nD/Guv4325pdX3D43hnKMdYMKcoTjm4pKbh5UblAdWvhHK?=
 =?us-ascii?Q?IHeFoqxtBR2LvWlfW3yk+v8nvVIPN8dFXeHlZbrutcPmxFOAT8htruLwbfck?=
 =?us-ascii?Q?fL1NX9lNhNbPFvbgxaKPaCnC7lZ+ZoOLBI51GjMA980NQpVtcFh4aej7obcW?=
 =?us-ascii?Q?pHBgGmE3axficl2MxFrGOWVsoUn2u5Oj2p/B+KZ/0BTdYCUIC1PPguBfceBO?=
 =?us-ascii?Q?kD+WXIfKiNYblelpf4v6/IqnQTy4TKozkIr6B8pX+dsmzWtFNwYIVGK/VM4r?=
 =?us-ascii?Q?VKq1etbNDrUUWRtDjbhqCTgKmWAb+64MSDSj3tVnSWMkpk7LY+Zse2S8QnvR?=
 =?us-ascii?Q?vOEsflqwYp8lRI+ycaiic/3p785fjx/u3TNo5882UYR+KQvcIdZxUXtvHCzb?=
 =?us-ascii?Q?nVh/+HLPBZai4lPDPWvlwGuCZhmCqIrPLfS0Kc57c3DTKJVIJNJxMLjAnvb1?=
 =?us-ascii?Q?1BLaj0eZg5Ruh0zVkxpoeG68q48Di42Y9r5/jEJ/haKhyPolEGvNdmNcxcfz?=
 =?us-ascii?Q?milQ7Ga1epd0AJmzxvtVoI+5yKfhBTW+QxCvFaLWC9ADr3nrU/V4oLC/xpoy?=
 =?us-ascii?Q?OXpOTbKnkYaLtMI9BTuf7xorKU/nTsP6AT1zj8+ERjHCpiWfirSOfjIDl6JS?=
 =?us-ascii?Q?4IbJqlWkQUuSOPTMoqbUYbKSNzioUbx7MVyWPTs0lFqaOJiNmolnU83vZZkx?=
 =?us-ascii?Q?qQOxp9UC0CH1xshiVGvudWTXH21G4qOD71cj6Vy1CJhnn8/COZOP/P6+fJPg?=
 =?us-ascii?Q?uyoikSxZUrJxyUOQ4G14P+AVATTmHxio/9NQ3xNUOom8b9OmTlwpRlB4mql3?=
 =?us-ascii?Q?t1iudcxCIuc+aepl0wLCk2JCeRRjjE2Ib6IHDHhqhKJSYxx2WzVg2/3xdlcw?=
 =?us-ascii?Q?6yYRZV4y1j02dRCebWACIiq/zfi/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dnllbb23o7+NIScMbIK6jkCAKaNWVcl0V2l6xrAeuvBCHcfZv+rN4JieYH6/?=
 =?us-ascii?Q?+BfOUFwLzgt+Buu6wx37Kealx+e5PIGBMLnYfWs/wK0o8d7aUCDBF0MA6KJH?=
 =?us-ascii?Q?u7SsLY9iAm6MdSbuXtvdNZMAqP9GdpF5pZnB2NiFe/6/MvijHza3AUGHIZjS?=
 =?us-ascii?Q?5ZppEaIMZ9OtPrAybIvYcIvk+h1rNnkWhvP6n46EOFKtEHHkzsmSIXNnFJgO?=
 =?us-ascii?Q?InebA0Hty0g33NJnudTsAK8mu49u3A8wBzwllTiZJ0HKpyOkIviryMPn+5Up?=
 =?us-ascii?Q?zRNfbc8SGqIMlUPnZGMrZxXBr8Yp5unmERRQ9nxwMwMsDph8H+XBeio/fQj0?=
 =?us-ascii?Q?tZUfQ/kXdf2i4YPYEmTEa4YehgBf8lFUJRl9xnL/fq7FFN5VP+kBL6ik88bR?=
 =?us-ascii?Q?Mzjo4ilrt7uYrnhO9lsbpmr9eRuuz8LmEE7oCCvaNELjjive0qfZFrxB3WOO?=
 =?us-ascii?Q?t7xTNnKpdVUtXBJ8KuUSdlR6wxNwQa6sJaPemwI4oWsYDG+iWgbu+uLAsPGn?=
 =?us-ascii?Q?W3osbcr/uZ/RjtZepbdA9ikpI6TiAfM5gtmirGMQLb+WMeryIW0srvQaQgWV?=
 =?us-ascii?Q?Msi59yLEUdtUPUcSq4ClsQQVBLQ1AadQ2eskF/r+50l1a1VTUhAYytsAKqMr?=
 =?us-ascii?Q?EyleOSpE9nDT3XrXs2grbw9t3YHRzxOrDzhuzoBksx3yhhj6ae/KtDB6e9gZ?=
 =?us-ascii?Q?wWS3LHSJS4XYOMBsYVYaX/KgTuj4mKZGMovDKm99fzPVLZZ9y/Wp6MKv46YH?=
 =?us-ascii?Q?gGI/7UOqgZA1YMOiEtLo18XE3xPJv5TO94Fb/ewFfo3KKQR+EdqjOPj+/9gI?=
 =?us-ascii?Q?CAMtLaH4IEWN4QQYWSV+0daEQb9E01DD6QpJf+CheTFZVLBV1NQLu8II2TNc?=
 =?us-ascii?Q?QULXAedeSGPRpH9zNLRDRN4k33XmeKUhYr1801AXEpFzsHAmYdKeSEIjPqpR?=
 =?us-ascii?Q?5lcq+kbXSadW+fAWbhCD7n5UlKhxvuYtuNLTDBDGWouDdFPuH7Uy4LqsOuFD?=
 =?us-ascii?Q?YtUWAW1NC5qtPBHe9Qsv3OUOwbCQ2pHFItu/Rrrb3AQugHp4xTnNn0SkshDa?=
 =?us-ascii?Q?j4jRoKGPDc9ljdaH2Doe+ZOsGOD4UHoJa1e+nTYk08fC+Bq3/UqfN0zBT5J8?=
 =?us-ascii?Q?BIGjxsclLsX5YeWoDFpJEJUSmHyGD6udFhWFTBaRvJRNhfJFF59pWGc3Niif?=
 =?us-ascii?Q?KjJ9QA2bFPJRPi3H4bjPxaAiizMbp8rcyGh6s7Q/TDhuRFfv4qLz7JieO4mZ?=
 =?us-ascii?Q?YK6iyT3kiINvy5Unlt+Sx8CborVghQ/ldBB5IANcgEH5u7vPbuzDeX6ggSjq?=
 =?us-ascii?Q?K0qwW8saa6Q4fFpyLjLIdMD14Yi5CL86vGpDtbcgzA3hkqjmEN1WtsRh7HNC?=
 =?us-ascii?Q?KBDFthyhEQt0yhGY21bk1BF+RBr5d3Euj0v9xHC5F+KtS5+nbN+HM6C8yaTS?=
 =?us-ascii?Q?DsMX5HO/x2qjw5BOzSeMHU7V7G6QpDrwcGk4msRcfx8CFRLIfY+DPryeTKa2?=
 =?us-ascii?Q?kiuxt4j61VOC/bJ3f5IZZuAyPKlUlL3pQs7LdBKSjcYEOMZ/bTi253J1w2co?=
 =?us-ascii?Q?PrkV3h5yep6ASNEIbCWYnyNu75sjC2tg5zLYjjxxB4OWwmFM9yNRIC63i2yS?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b81f5091-3b1b-4a8c-8632-08dd4491eebe
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 20:32:52.4704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRjSBa/CBDR5sNZYC2Ba1FUGHgufl8gPFzmqV7sAlKvTFHohEE20QFAoKEQwYS/H0G4XuVVnJe74H5Y/tpMGfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8842
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

On Fri, Jan 31, 2025 at 02:31:34PM -0800, Lucas De Marchi wrote:
> xe_display_fini() undoes things from xe_display_init() (technically from
> intel_display_driver_probe()). Those `goto err` in xe_device_probe()
> were wrong and being accumulated over time.
> 
> Commit 65e366ace5ee ("drm/xe/display: Use a single early init call for
> display") made it easier to fix now that we don't have xe_display_* init
> calls spread on xe_device_probe(). Change xe_display_init() to use
> devm_add_action_or_reset() that will finalize display in the right
> order.
> 
> While at it, also add a newline and comment about calling
> xe_driver_flr_fini.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 22 ++++++++++++----------
>  drivers/gpu/drm/xe/display/xe_display.h |  2 --
>  drivers/gpu/drm/xe/xe_device.c          | 19 ++++++++++---------
>  3 files changed, 22 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 651799c946ace..302f533af037d 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -161,27 +161,29 @@ int xe_display_init_early(struct xe_device *xe)
>  	return err;
>  }
>  
> -int xe_display_init(struct xe_device *xe)
> +static void xe_display_fini(void *arg)
>  {
> +	struct xe_device *xe = arg;
>  	struct intel_display *display = &xe->display;
>  
> -	if (!xe->info.probe_display)
> -		return 0;
> -
> -	return intel_display_driver_probe(display);
> +	intel_hpd_poll_fini(xe);
> +	intel_hdcp_component_fini(display);
> +	intel_audio_deinit(display);
>  }
>  
> -void xe_display_fini(struct xe_device *xe)
> +int xe_display_init(struct xe_device *xe)
>  {
>  	struct intel_display *display = &xe->display;
> +	int err;
>  
>  	if (!xe->info.probe_display)
> -		return;
> +		return 0;
>  
> -	intel_hpd_poll_fini(xe);
> +	err = intel_display_driver_probe(display);
> +	if (err)
> +		return err;
>  
> -	intel_hdcp_component_fini(display);
> -	intel_audio_deinit(display);
> +	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini, xe);
>  }
>  
>  void xe_display_register(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> index e2a99624f7064..685dc74402fb8 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -22,7 +22,6 @@ int xe_display_probe(struct xe_device *xe);
>  
>  int xe_display_init_early(struct xe_device *xe);
>  int xe_display_init(struct xe_device *xe);
> -void xe_display_fini(struct xe_device *xe);
>  
>  void xe_display_register(struct xe_device *xe);
>  void xe_display_unregister(struct xe_device *xe);
> @@ -54,7 +53,6 @@ static inline int xe_display_probe(struct xe_device *xe) { return 0; }
>  
>  static inline int xe_display_init_early(struct xe_device *xe) { return 0; }
>  static inline int xe_display_init(struct xe_device *xe) { return 0; }
> -static inline void xe_display_fini(struct xe_device *xe) {}
>  
>  static inline void xe_display_register(struct xe_device *xe) {}
>  static inline void xe_display_unregister(struct xe_device *xe) {}
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8a2763e8a6e27..589bbe21c32b4 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -734,6 +734,7 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>  			"Flat CCS has been disabled in bios, May lead to performance impact");
>  
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
>  	return 0;
>  }
>  
> @@ -802,22 +803,26 @@ int xe_device_probe(struct xe_device *xe)
>  	err = xe_devcoredump_init(xe);
>  	if (err)
>  		return err;
> +
> +	/*
> +	 * From here on, if a step fails, make sure a Driver-FLR is triggereed
> +	 */
>  	err = devm_add_action_or_reset(xe->drm.dev, xe_driver_flr_fini, xe);
>  	if (err)
>  		return err;
>  
>  	err = probe_has_flat_ccs(xe);
>  	if (err)
> -		goto err;
> +		return err;
>  
>  	err = xe_vram_probe(xe);
>  	if (err)
> -		goto err;
> +		return err;
>  
>  	for_each_tile(tile, xe, id) {
>  		err = xe_tile_init_noalloc(tile);
>  		if (err)
> -			goto err;
> +			return err;
>  	}
>  
>  	/* Allocate and map stolen after potential VRAM resize */
> @@ -831,12 +836,12 @@ int xe_device_probe(struct xe_device *xe)
>  	 */
>  	err = xe_display_init_early(xe);
>  	if (err)
> -		goto err;
> +		return err;
>  
>  	for_each_tile(tile, xe, id) {
>  		err = xe_tile_init(tile);
>  		if (err)
> -			goto err;
> +			return err;
>  	}
>  
>  	err = xe_irq_install(xe);
> @@ -896,8 +901,6 @@ int xe_device_probe(struct xe_device *xe)
>  			break;
>  	}
>  
> -err:
> -	xe_display_fini(xe);
>  	return err;
>  }
>  
> @@ -918,8 +921,6 @@ void xe_device_remove(struct xe_device *xe)
>  
>  	xe_device_remove_display(xe);
>  
> -	xe_display_fini(xe);
> -
>  	xe_oa_fini(xe);
>  
>  	xe_heci_gsc_fini(xe);
> -- 
> 2.48.0
> 
