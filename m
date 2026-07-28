Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0981C53219
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 19:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C6710E5C9;
	Tue, 28 Jul 2026 19:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYvNg9Mo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1CD10E5C9
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 19:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785266206; x=1816802206;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JrfTDVVcPlMXXCw3nGSq9ndN3XxjibCVfYzww1xRXvM=;
 b=cYvNg9Mo9zAiXZvkE8VhS//K+7EUF8v3BF8sEqs1kmTlw09M7Myi4oYJ
 B+JTlNPYsslSS4JDbdnexsA/up7PqNcfE80TQf6gQF0KT1OMg3kUSmMIF
 /xiXsLs//WHDhENqqhqiqLhPnAsUldMZCHkcekXSPM7kjANPgUBMdX1vG
 ObZgT3Sm+/06tbS2arWmhWVH7MXrS7ZPlUBafhMMrwAD4EAbNSK2lB6AK
 u5xpzrRB0bcQR5gIZBQTbPJGM9arfrNRjW0z1lXfn00K3ZaqVnk1M99ut
 nRfRls9Dw1tcO6A25H9r+d0MvxYoPyBS6kwIpjJxnIVI6YKAmisMwpTEz g==;
X-CSE-ConnectionGUID: KQuUC5d6QfeqYV2KEENJdA==
X-CSE-MsgGUID: i1iCaosWSiurjwzjW11SfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="73401730"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="73401730"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 12:16:45 -0700
X-CSE-ConnectionGUID: yN4gKhy2QDKsnJRj2ScuGA==
X-CSE-MsgGUID: G+1E8DEuSb2Tj5bdLcCejA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 12:16:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 12:16:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 12:16:44 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 12:16:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2hDvF3bC2rvOp0/KJDCTtYOEDiLJNKRbXysbh1jiE9XLtixSLSah0Lb1Vm0R7E4VGebt3sNw8bGGht72xrZWtuW6vyX93Dby59HvINZf5hVRWlvexmTyBLE/Lubvm4PaZpNdjemDoumcq86B6MywREDeuqMTxNWsmsGNy67PxgQA0L///d3njRwANO/cAlX2AP4dk6WNJ7jXIEv3my9tFJElA+6B4wvdNyn5DCo9xCDGmVxl+uMi6qkSz6ZpaEDIOamaCKEQgLWhNsFACv4pEqyR1XpwC23MRgR1DLFPIjG4Auy2lB2ysCtzp3yzBwK0UVFx1lXW4jXBiiLWZFY7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLHPPfRkbMjsMLXygaEJHuFr/6MaWH3x+UvEEy+YitA=;
 b=YgpcUX78mU3Mq6KYVB1tG38a/HpE3isJ0rrb5mzd7ovFqcFQdUG/RQNiNg/T12FNYBmijKCcdhhXCWhNANUvMXdT/beAsV9kMGllajun0v8fNJPZHXk6gYobxd22Yqqbpxu0a2CyhnjgxUTu3zf2fsIBSW1p7PXiTHfE4jP5Q+y/sbm/4pC2LWqeyCkn5czgZuCVx27W/4QYTr5aITOtytZKtY94ih/uqbikyraVXdoplrDiEE2teImkHIMXMHSCI+7QOKgIBuG7zM/52MHQEC+gDSG8UnYW5tHqSiQrotEt7uYOdmgqJknK8ORwrE16dG7EamV/Cjri2l1a8BwsTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SJ5PPF0D019E8BF.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::809) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Tue, 28 Jul
 2026 19:16:35 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 19:16:35 +0000
Date: Tue, 28 Jul 2026 15:16:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v2 04/22] drm/xe/log: Add component/location decorations
 to dmesg
Message-ID: <amkAD0VZVBTLWxLq@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
 <20260728161039.579-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728161039.579-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:254::17) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SJ5PPF0D019E8BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a45a3d7-f6f5-47ea-9101-08deecdcbdcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|11063799006|4143699003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: EswVR2+4/soRHfrLul5ltTx8+lmwqrkWDXLoten1gNkN5ue11SYAFUl8fW0rpbhcbA+r+t3hULNa8MrMDManszj4rlKo9xsSw9eSbjOAS95Q8GvrIi42B223e3A3VWkAAY8rlIivY9jLd7tdu/SMGHgRdcQik+A+DEMF/T3vKM8bSJyWRYzC/1zD3+/L3Yc/X6kmaQM2yn+MllzQzD29Ts+jcwo/vVyaPKALBhvTBzZOzKwytLwucBg63cU+UwKRwAx6+jZLGvpL/wW7bhuKH2RSj2zNoBK0yqdD6okK6U2rjMiNO0RSGD4wiSAqy2XNPPofQJXVE/WhR+c/JGP2KRdJldYS6993/WvtcuqDph/wjG8U/BGvDXq3pvmQlrFq98QvW/ru0HMR35/5OMdGlkzV5OGTzpDugLTdjiC8VL3jhR27ooigA+9eHk5dNKYkbsz2mQfireF9TbYfBHg9B2oUIbKVaQQg3j1hIW6NNcm3c1+JZ29dgTxsKBUUU+wYpA4vqD/zfbZVfK4WCkWhZrR7Yxruim6NWTk77jVAi3PR9Hlc/NvQjBYPmUwaUrSNCdSFEIsdAOloCxf6OJDfSN32DILhqGVaSKiw2jsZSeGzsmtaAJKT5W9fwnU4V8cYwFFBQHAL8KvaCjffUAbT0W5tKbt2DCH/qzoS2HZtl0Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(11063799006)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ucGBTZ5UCrWJOAUMbcBFcxQ/q0P9vTLww8Xa+JN+Aj10FfBrbc5fm3AUcH?=
 =?iso-8859-1?Q?dF0F0uDuxCgv8D6H7bgYRN/iIQ6nhbZoFbJ+mAVGnmQHhNcS6GnoEuWpzR?=
 =?iso-8859-1?Q?e/B9BfbYrSDxFmr3xjau2FMMOaHI3SqXYwYCJJ5BE9QXYMkZ7mPsN23Qe4?=
 =?iso-8859-1?Q?6mceFEY3S9O6vIsv8dKf/v7khO5HVRNfFq9bO/5eleB/6aEpO9XRt5XxXr?=
 =?iso-8859-1?Q?3ykF32V3c+ypTcr3rgzZbL4yQA/mth79Cgq1yDGqDjjqfgNWZ+TqhogsvP?=
 =?iso-8859-1?Q?S5/zK0Rz8QwdtiYBIs9/DfY0dDlkO2pskXrOBYm+YLKcUB0PBjDKDFfJFf?=
 =?iso-8859-1?Q?ucHUTBI+JeZOn+c8zA2x5vRJrRwTQym/CIAhsJkuJtGR5IgLBWvAwhfSHZ?=
 =?iso-8859-1?Q?PLfZdesEy0YRwhfNQCdZfQUn4kd1+LXYROmGbjng07Q+YtKnF3LFA4iyok?=
 =?iso-8859-1?Q?DCi1ZBZJ79dHQXQX+KDYu0v2NY7rLhTkI6G6dW6liP6V9NgsiU4azRsF8z?=
 =?iso-8859-1?Q?cPF2QF0qawLFOZKGhtbHesLrUdoaDVRWOEtFe+ZeimxpypWTYlgticxVUD?=
 =?iso-8859-1?Q?bs8n0o6rOynZyDEfKbl0J2kRSDQoJXSSTIZnJ+bGSsWbju807SwS4ey8c3?=
 =?iso-8859-1?Q?iF3msRqmMmqRt++Xl3qAg+rlhrC+3OdbJNpJF9uNh5/PG7xXEAP/Dvd1an?=
 =?iso-8859-1?Q?TEXzP90blhjm/cw0dQnKz1AT9t/3+WGNGjipwjHkwSxyCGi++L3Haq5l8E?=
 =?iso-8859-1?Q?pkeE7TT11odcTS2VKvhBUgcHUvkyqzVv7tRN+Xr9q2775AJQn7zlnJn7dr?=
 =?iso-8859-1?Q?ibIZV0DEaXzym+U0Ye1bb+roZnTVdCdWiYgPfo713qhIIKTs4rNQzoM52o?=
 =?iso-8859-1?Q?dPbqej6F43jESPg1OxCAhOxW4pCL8S5/wCrDG5enkaOVoNrDQt+qDHQaC8?=
 =?iso-8859-1?Q?xpCMHrOjiYhKurbbhNb8SId+YnEvUVuW5pSUC834upChHJxb9hn6jYV3Km?=
 =?iso-8859-1?Q?Ij9Avqh+QfZ7h6mufgQO+tZoHDExI8t+aGXR1zP84cqX+QOHa6SoQHkvmX?=
 =?iso-8859-1?Q?+FNjzLP25Klzjp1U2YCNW78CpJ2aodr+vK12/1o0rG3ta63dqFYk9E+0Su?=
 =?iso-8859-1?Q?WSuLGEeqcP8Psopxcd72I+KvD/DSAYsvG5ew1sCP9tpCNqPF+p1ROX0det?=
 =?iso-8859-1?Q?Qa6Yk/PrNtR1qcL9iFi0NSMAjyLY3wIX/HcHetndY1RTtrF9SVlL8P56xR?=
 =?iso-8859-1?Q?wKoe/lliXzUuJ9ZiaG4kKosqBHc7Af5djoCiThUugEUJ3h8g7oOwW1bmIG?=
 =?iso-8859-1?Q?lShH7lhCtQ6m/8qJYw1pXvOt75F5hul16BpkVja1LeifBKZ5YZq3jiRZ6P?=
 =?iso-8859-1?Q?+eznL8w0Kr4s+uxzF3FpXIMob5jFHbpora809BCkCv8WHjySdIMh9JjgiD?=
 =?iso-8859-1?Q?fA2nEaVfAj4L17bocJG913tu5EqjqrsvSJmdO1NY+C33flQraldYb7l4XN?=
 =?iso-8859-1?Q?272GLaefa18Q0AQhKwFMEk14oIAl1DfiOE6MnT81w+nsciiEaDwJDejyLj?=
 =?iso-8859-1?Q?GbSFqqVdcpKjZ30MOlW/H2SwmhAOgU7005W1CfAtmgkBa09Jy84U/qcBFN?=
 =?iso-8859-1?Q?VCy92dtJg1PWYQ8WLuBIPzjXN5lDStK4wOSU6/79B2Q5IAUE5+hpKT5vdT?=
 =?iso-8859-1?Q?+N54r+bO1dpiKlItK/Wzr9e8kKx5zkUaW8GKcCjFHUD7a7kyZbX2Hz1Q5A?=
 =?iso-8859-1?Q?FIAgtVvrGaNxUj3Gz2P2oxmdAmxh/ypovG/cn8H7995oozpUuPWJ3bB1fO?=
 =?iso-8859-1?Q?bHxWzUE+xA=3D=3D?=
X-Exchange-RoutingPolicyChecked: jzFkf55vw3XWltvkEj4s7/sLLjpEuGa+WKICUd7kmHthaEotSIHPfwQiw6q+FkFYMK6vLlC3ViziSVaqTIf7J40GSihLdW21DtHv/e9cMqUiioHI49LeF5/tv7lb6b2cjOH7JAi9rou44N/alMTIv6zJ8AxFTAmSF0ykHm20Uq5KzWZ3oHDg2tuu+/7hb5SbXIX44d+f56gNoEvKGZDp8t2/+XSKDDiNg6G8Agn990Lg7F8qfNQVytVvJivtgDzMGlHuPRbcWz5coycfxrcNYqWuo5eBwgQlFRQKWpg+cuH52uzXkOT3GlRJjKZo4hviT6OLi/BDvTXgCCefK3G7hQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a45a3d7-f6f5-47ea-9101-08deecdcbdcf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 19:16:35.6315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlNqhww3Da/mSUDO+sSWVJApVFgzX1CupuNKhwxh1VjkUH0NF83Fy1AJQWbtFM34T0W1nKcYNlguyewCtrki3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0D019E8BF
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

On Tue, Jul 28, 2026 at 06:10:19PM +0200, Michal Wajdeczko wrote:
> While we can't directly use our xe_tile|gt_err|info helpers to get
> nice Tile/GT decorations, we can still add them manually based on
> the structured location parameter. Similarly, we can add component
> name prefix based on the component identifier.

Okay, perhaps I was wrong and these levels are indeed useful info there.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_log.c | 82 +++++++++++++++++++++++++++++++++----
>  1 file changed, 74 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> index 70a41bdf1a01..a4f4f2d4e250 100644
> --- a/drivers/gpu/drm/xe/xe_log.c
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -3,6 +3,9 @@
>   * Copyright © 2026 Intel Corporation
>   */
>  
> +#include "abi/xe_log_abi.h"
> +
> +#include "xe_device.h"
>  #include "xe_log.h"
>  #include "xe_printk.h"
>  
> @@ -13,6 +16,65 @@ static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigi
>  	/* TODO */
>  }
>  
> +static const char *log_component_prefix(u32 component)
> +{
> +	switch (component) {
> +#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
> +	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";
> +	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_CASE_PREFIX)
> +#undef MAKE_XE_LOG_COMPONENT_CASE_PREFIX
> +	}
> +	return "";
> +}
> +
> +static struct xe_gt *get_gt_safe(struct pci_dev *pdev, u8 id)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	return xe ? xe_device_get_gt(xe, id) : NULL;
> +}
> +
> +static struct xe_tile *get_tile_safe(struct pci_dev *pdev, u8 id)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	return xe && id < XE_MAX_TILES_PER_DEVICE ? &xe->tiles[id] : NULL;
> +}
> +
> +static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char *buf, size_t size)
> +{
> +	u32 type = FIELD_GET(XE_LOG_LOCATION_TYPE_MASK, location);
> +	u32 id = FIELD_GET(XE_LOG_LOCATION_ID_MASK, location);
> +
> +	if (!location || type == XE_LOG_LOCATION_TYPE_DEVICE) {
> +		if (id)
> +			goto unrecognized;
> +		strscpy(buf, "", size);
> +	} else if (type == XE_LOG_LOCATION_TYPE_TILE) {
> +		struct xe_tile *tile = get_tile_safe(pdev, id);
> +
> +		if (!tile)
> +			goto unrecognized;
> +		snprintf(buf, size, "Tile%u: ", id);
> +	} else if (type == XE_LOG_LOCATION_TYPE_GT) {
> +		struct xe_gt *gt = get_gt_safe(pdev, id);
> +
> +		if (!gt)
> +			goto unrecognized;
> +		snprintf(buf, size, "Tile%u: GT%u: ", gt->tile->id, id);
> +	} else {
> +		goto unrecognized;
> +	}
> +
> +	return buf;
> +
> +unrecognized:
> +	pci_WARN(pdev, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> +		 "LOG: malformed location %#x\n", location);
> +	snprintf(buf, size, "LOC%u? ID%u? ", type, id);
> +	return buf;
> +}
> +
>  static bool is_hw_sigid(enum xe_sigid sigid)
>  {
>  	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> @@ -71,20 +133,24 @@ static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sig
>  			   u32 component, u32 location, const void *data, size_t len,
>  			   struct va_format *vaf)
>  {
> +	char buf[32];
> +	const char *loc_prefix = log_location_prefix(pdev, location, buf, sizeof(buf));
> +	const char *comp_prefix = log_component_prefix(component);
>  	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
>  	const char *sev_prefix = log_sev_prefix(cper_sev);
>  
> -	/* TODO: add component/location details */
> -
>  	if (IS_ERR(data))
> -		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
> -				 sigid, sev_prefix, data, hwe_prefix, vaf);
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%s%s%pV",
> +				 sigid, sev_prefix, data, hwe_prefix,
> +				 loc_prefix, comp_prefix, vaf);
>  	else if (data && len)
> -		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
> -				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%s%s%pV",
> +				 sigid, sev_prefix, (int)len, data, hwe_prefix,
> +				 loc_prefix, comp_prefix, vaf);
>  	else
> -		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
> -				 sigid, sev_prefix, hwe_prefix, vaf);
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%s%s%pV",
> +				 sigid, sev_prefix, hwe_prefix,
> +				 loc_prefix, comp_prefix, vaf);
>  }
>  
>  /**
> -- 
> 2.47.1
> 
