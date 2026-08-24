Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B318C5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 19:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61D510E12C;
	Mon, 24 Aug 2026 19:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZQ8bthk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839E010E12C
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 19:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787599620; x=1819135620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eMcyDKHBkxfd1oNR2kriA2kjshzm+gWjYRnUEbNV4e4=;
 b=UZQ8bthkyPTnyjF57tjzozvwzbswjspuYwbKiRlCs3Qk9sEc66GRbMrR
 ybneQ94VqNvQdBVucZJvznC2hv6Yeq5NM5cBt5Z6eMH8lm55GVEhivGBd
 NSmkxyJyqGPKC6M9Y1MtER65gM1HwnIPxV5rD4XPMl0xFr7GETNrQFCYz
 XM8IQWRMnkYDO7gNNg5uhH8b+f+5xIffTeFzXaGMqbSykrQFcqkdTt47T
 ISBL/I3RcrQcmKIxcIW3KJAxb+4kf9X67x/YhC8msLHU1L9pUti28sxAH
 Gzxx89TyXRt9NlkNBoMcx4TNMVrDSOvr4QgmuocV5AGirw/6PtsemdSua w==;
X-CSE-ConnectionGUID: Fsx+R06bQvKF0R0Eyr97pA==
X-CSE-MsgGUID: ksPucT5DS4GlxHSvi5+CtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="113597957"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="113597957"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 12:26:59 -0700
X-CSE-ConnectionGUID: +Dn/t0SRRF2+UAzSR7jHbA==
X-CSE-MsgGUID: mjhtIqB4T22c9T3DE9sVlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="271285501"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 12:26:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:26:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 12:26:58 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:26:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8X0vzjxrPofNQfunRR4aourN8oYMgpmSEVFh+fyLvPpI5pgaYFaSBVEOM4VykP0ihnQp4GcHbluuk4yPlm5JdzlP9KyoG3G3BLQ8FRg8XYPlsygLdisxb4j61E9uYJoQPiSJ1kpmKisw6RvtGxyt73L7TJeGTCGL+0eXdQfmRBDI6a81VKXrwAWB6J3F2sX13TM8vwBBre/+TvP2V9btURjEsXD6EGXz/oyzF92HahnNZNMsKtJ7Qd5ZcwON23tJV2UxCmPc9kEbRA6CHHRbbfRS2wh9eJHqFIFjsYyBotP4Mn9zfBAOAfebN+abngNlQS+Fmh8ZF0zZwsV0k2cJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzSRdmiC34ZS9eOQvBA3/8u7/zsV8dz4nAtoQqw18Kg=;
 b=S/UGdWt6bXWkeVh1z2dfBWkIUseLRvAe9ZuTrzd696d1OfA/BwBxHOR/GZ2psw6nJzKVGMfVuLqM1cPvP6T0xp5K2VxIGJLQwe8lbizS1ld+xzg1hRaUC3LK+HFq1dGChmUMK6aZaz1bjK+4I+lTWmkMiOC1NiCJ2wFwfv6FZQtUyzaJZErW+XB89xYlkg58rAJvCytU2UROskX8Hqhy/y57l6LP8Jdtl0NJpm7uzBJ5+QvMf0whDgt9/VBPqftjGnkcwHXL7mwU/Z9dqy/sqJFwTtIOZ8nlRt0SBzIlPLrDzGuGr4CAy5edQ97ktHsTeskVyaDb7SemQf4xsYUNKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by PH0PR11MB4933.namprd11.prod.outlook.com (2603:10b6:510:33::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 19:26:55 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 19:26:55 +0000
Date: Mon, 24 Aug 2026 15:26:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <heikki.krogerus@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/i2c: Expose AMC Alert reason sysfs
Message-ID: <aoya-4fWW7pLb9bc@intel.com>
References: <20260823103523.554184-4-badal.nilawar@intel.com>
 <20260823103523.554184-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260823103523.554184-6-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|PH0PR11MB4933:EE_
X-MS-Office365-Filtering-Correlation-Id: 45fa4e9f-759a-443f-a098-08df0215a83c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: f8Zw0mc2RBXFmC8Ju/kDatE+25CRJLWbY3gJF27+SlZaKo8sEsJV/+cYIGhNoBh0rTxxJzDaPLP/mLE2h09fIoZnSDNdv3bGyWtssPTq3iOm+agnuDa+KZ0iwqHdcG7YsZhoC04Sz86xEzZCH7477NqvzXVgIDa88ZNGrnVQuXBAWkfzRy6F9dlDTNT/ObMxyvgGchg4atZwZTo71GrPbyVqDK8N0wjWhL0I3Z/abJYj3cLRvIPW+3AAVjY6jXvPjmhDnOl10QHtwm1ItHOKzugQnahr0n62SciIrJJeSZ8hEPTUpatOS5ly+ZcgPUuONC1bSWcCSGhxxzrmsglyvqwl+qGSUbqwDISR052ynN98XsnPWA+kzkMPA7cA0xKdxYjwSy91z5+SsPNuhuUFDiHV8AZLc/FpVQrZ4INBQ3VaccdB38cVr9CXK3mEFQZPjs+6LWakKC7yDt8VmjAye0QspVJH9Dnfu+SflMMT3NkzgomCW95OPCRfwNnqJj6CFO0hj/6HtKkvQ7mbVV93cifTQuB61DReQpF9/ms0x4aNflfbwhqqD1uYJpzJKCEQKJBLU3pygKmkxNech7OjkXQYyqAOJpyfsw8hCv9EcgeF9WSlaGsPDv2BB2gsEtcrvJRJvYDjGdcHVep7rEu48eSKcH0A90RmUP5etYhZ0rk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mutBw1KNg7QIFzSsZneCV71HFvEBG/x0osATG1SiPkP81K2FcoMLVWai9Sce?=
 =?us-ascii?Q?Y/9GjlQ01nPmEcnpZDNLqWZadytLbEkU/LuTa4gyhZzm0NUARCP0QoJt+UX7?=
 =?us-ascii?Q?SGy9P0YCCvsW7ila5GB9leGLa3QXyrzYa/7T4KNtrRYFqD9svyDhtYQgDuVT?=
 =?us-ascii?Q?OQgpEMt/sEC96Y8ggdtkswzrpHWx957MuZeceF+LbRXDB10i/JBxy7Ucpf75?=
 =?us-ascii?Q?68YAyiWmuZfmB1Ib2tUbJDO2kQbaOizN1Yx5vvuFyaWt6hWzUvgjaedwLMT5?=
 =?us-ascii?Q?qTdfWhEtEUVy9tTc49C0AsqUWMfYEfqdDLlALanejQ7mrv/68f3/y3vvqmdZ?=
 =?us-ascii?Q?PsIOfjsOYqMotarq0Ww0dU9enudux2+SvzaAX4S9TxziH3oFLzk9H5S9jTsQ?=
 =?us-ascii?Q?a4VKmUAydRVyaUgtt5xoF4P7+rBWLx7nRQNtIM3hT5Z+5Znc+jkcUbjYddmc?=
 =?us-ascii?Q?d/f8KgdAicH+AgLurlrDktqkYzWotiTylSMCQthZD5IVGhQMipfNi3AdmAZs?=
 =?us-ascii?Q?HHZ9/vwuinoi33XhjBe9HzxfR9epf9lv/8GqHYXNIkzrzWfufHnRa2lEV6E0?=
 =?us-ascii?Q?kum4QLFINAVjAyZS7DJAadDlmReUlBL5OIimQ+9HLrHeHi9Em9dzDKkHH5R4?=
 =?us-ascii?Q?hN6RqZE2FT1uIE9zYrrqdE2HbFVMDRCV+bEWLDxhKbatvtX+ZXVjNN5jAHke?=
 =?us-ascii?Q?xjISBmBEXjp47p5P+qh26DWyYu6uevKubcNhK8KOvZmMXWs4jBx2PP9NCOLw?=
 =?us-ascii?Q?+CCx6xiUh5b4KdioUeyLFTzXEYeBVrrAC/eNt65WFZPF/vm73nQRlon+S/Ul?=
 =?us-ascii?Q?7YYxvff6NQY33Iu14eJmsaYScs7ZeMbxwcSTxOPonEmIpRSjCJfK2OASLPa9?=
 =?us-ascii?Q?vc+qZEvC6xCbGurJqBLwh0eWqPkVIFyVYqi4gOP15JupOnBwoDruuh6TnWiq?=
 =?us-ascii?Q?OPjjO+DE2kXQpc2YS6XuHmQ/93BujSetQ0oyN5Jk4WT8eHautRLEMCt9cHs0?=
 =?us-ascii?Q?bFkZi0Z5pUbQI5AvpakRabaBOi5DMD+xYEJnd4y8utmLXXOCFqVxdPgVd5WC?=
 =?us-ascii?Q?+B7ZMdCzK0CpS7uIklSVr+bcRngtxMDjQwvXODhdJ1U8exUFwiwV0NRvNTMF?=
 =?us-ascii?Q?tIAiRiZ46rVPMbnr5OoaZ6xGUsIluKgKfXRFv+/r49xVMqXiNI5CowaAz8qL?=
 =?us-ascii?Q?OhCekfyypK5ohgMy46BXnwJlayHMP/p0ctESqcS+TrHfXb/0StD2y1CP9GvB?=
 =?us-ascii?Q?fTZyJlBvdHQMJRdV3Gjb8y78WUo1iPANOcF04z5/4KNewgx5PHxdzcLnRxj8?=
 =?us-ascii?Q?3Yjen9rNAm4nssO+FRIQUJwmYGScU0P7Uu7l/8GlOxGA+3L4UV67tkGd3FEP?=
 =?us-ascii?Q?oz98JvNsT7V2426xa6Y4Pl4W3LBR1QUESbDD4UGoVE33bKYYQgR5/1NcdnLm?=
 =?us-ascii?Q?RC+0H0eQqy8YSWQ9yfbeju6zlzioWrm73VZQvSOayFwKma6txsIMAhyx/yYE?=
 =?us-ascii?Q?uun+Q4Wal0hmbbpz+mncwhInA8CVo67oS8S2LcXvUixumL64d0hfn0gNMFru?=
 =?us-ascii?Q?ubBtpakJA98Q0oMMRlB3eRYaBoiYQmPBm2usOcJwPvjZRiSkn70688JCMLbm?=
 =?us-ascii?Q?eL+i1xhcwhb7kUyiO3WzqjN5odtlpE24KNpihA9YBY/vNPdBtTjLAHrRT3gy?=
 =?us-ascii?Q?rfPzqQl94XeayvMXwOzRgPiy6hv4TnbbLmMHFtkyoC1ppKB4TJAUN3wjzDeQ?=
 =?us-ascii?Q?K0DGQ6Sn+w=3D=3D?=
X-Exchange-RoutingPolicyChecked: mH43Zi6mfFlgO9t23p6bH2LtVhjM0NNDfJbVsWDw9HLPNWxIuQHlSqbaY9hUQ51ILu9fgr1KCdzWfhXnbUsm+tK/zbP3Zr0dtOQbAHlF79RTqxNPQZhPbyc09l2Qo+LBDvUMbtKWuf63h3Ey2p3VynaGSuyDa6WGN1azHlCgl0hKQV5BAYnwreN2SNshbB4vBhN0vs9KbwypMW3tsroClyOWYQPek6iso7LL2Jr6eTMfCkJot+A/reGqPFL975U10+WxWf+/pLUQ6pWGXE16FylzpBbnmyPaQGnqa2uYiDg7XT8Ld9lo5egdjHf9HFWopX+UEvrOU4yi098QJ5STAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fa4e9f-759a-443f-a098-08df0215a83c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 19:26:55.2016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVYbV/7vRxLEloY3votYesi/VBNkKmg6vTTEFPycQigFawP7Xj6j2F5kJ+dw6iJhfpkBm+q1bsi7n/OsDPlq+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4933
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

On Sun, Aug 23, 2026 at 04:05:26PM +0530, Badal Nilawar wrote:
> AMC raises an SMBUS alert before performing a power removal or
> power-cycle operation. The xe driver then places the device into
> vendor-specific wedge mode until the recovery is performed.
> 
> Expose a read-only xe_amc_alert_reason sysfs attribute to help users
> identify the required recovery action.
> 
> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-amc     | 21 ++++++
>  drivers/gpu/drm/xe/xe_amc.c                   | 65 ++++++++++++++++++-
>  2 files changed, 84 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> new file mode 100644
> index 000000000000..b3de933efe11
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> @@ -0,0 +1,21 @@
> +What:		/sys/bus/pci/drivers/xe/.../xe_amc_alert_reason

Should we do <bdf> instead of ... ?!

> +Date:		August 2026
> +KernelVersion:	7.3

this will be 7.4

> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This file exposes the reason for the most recent Add-In
> +		Management Controller (AMC) alert on Intel Xe platforms.
> +
> +		An AMC alert is delivered via an SMBUS interrupt and causes the
> +		device to be wedged, requiring vendor-specific recovery. This
> +		attribute is created when such an alert is handled and is
> +		available to all users as read-only.
> +
> +		Read returns a single line containing one of the following
> +		alert reasons:
> +
> +			Firmware Download
> +			Thermal Trip
> +			OOB Request
> +			OOB Reset
> +			Catastrophic
> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> index 8ecadee6eea3..ceb2c4d618fe 100644
> --- a/drivers/gpu/drm/xe/xe_amc.c
> +++ b/drivers/gpu/drm/xe/xe_amc.c
> @@ -18,6 +18,7 @@
>  #include "xe_device.h"
>  #include "xe_i2c.h"
>  #include "xe_mmio.h"
> +#include "xe_printk.h"
>  
>  /**
>   * DOC: Add-In Management Controller (AMC)
> @@ -56,6 +57,8 @@ static const char * const amc_alert[] = {
>  struct xe_amc {
>  	struct xe_i2c *i2c;
>  	struct work_struct work;
> +	u8 alert_reason;
> +	bool sysfs_created;
>  };
>  
>  struct amc_header {
> @@ -104,6 +107,54 @@ static const struct amc_request amc_get_alert_reason = {
>  	},
>  };
>  
> +/**
> + * DOC: AMC Alert Reason
> + *
> + * On Intel Xe platforms, AMC sends an alert notification via an SMBUS interrupt
> + * to notify events such as firmware download, thermal trip or a
> + * catastrophic error. See enum xe_amc_alert for the full list of reasons.
> + * Upon an AMC alert the device is wedged and requires vendor-specific recovery.
> + *
> + * The alert reason is exposed through
> + * /sys/bus/pci/drivers/xe/.../xe_amc_alert_reason

ditto

> + *
> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
> + * specification.
> + */
> +
> +static ssize_t xe_amc_alert_reason_show(struct device *dev,
> +					struct device_attribute *attr, char *buff)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_amc *amc = xe->i2c->amc;
> +
> +	return sysfs_emit(buff, "%s\n", amc_alert[amc->alert_reason]);
> +}
> +static DEVICE_ATTR_RO(xe_amc_alert_reason);
> +
> +static void xe_remove_amc_alert_sysfs(struct xe_device *xe)
> +{
> +	if (xe->i2c->amc->sysfs_created)
> +		device_remove_file(xe->drm.dev, &dev_attr_xe_amc_alert_reason);
> +}
> +
> +static void xe_create_amc_alert_sysfs(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	int ret;
> +
> +	if (xe->i2c->amc->sysfs_created)
> +		return;

Why do you need to track this?!
if this can be called from multiple places shoulnd't you protect with lock?

But I prefer that you ensure this is absolutely called only once and
remove this check.

> +
> +	ret = device_create_file(dev, &dev_attr_xe_amc_alert_reason);
> +	if (ret)
> +		goto failed;
> +
> +	xe->i2c->amc->sysfs_created = true;
> +failed:
> +	dev_err(dev, "Failed to create sysfs file for amc alert reason\n");
> +}
> +
>  static void xe_amc_work(struct work_struct *work)
>  {
>  	const struct amc_request *request = &amc_get_alert_reason;
> @@ -158,10 +209,16 @@ static void xe_amc_work(struct work_struct *work)
>  	case AMC_ALERT_THERMAL_TRIP:
>  	case AMC_ALERT_OOB_REQUEST:
>  	case AMC_ALERT_OOB_RESET:
> -	case AMC_ALERT_CATERR:
> +	case AMC_ALERT_CATERR: {
> +		struct xe_device *xe = i2c_client_to_xe_device(client);
> +
>  		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
> -		xe_device_declare_wedged(i2c_client_to_xe_device(client));
> +		amc->alert_reason = alert_reason;
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
> +		xe_device_declare_wedged(xe);
> +		xe_create_amc_alert_sysfs(xe);
>  		break;
> +	}
>  	default:
>  		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
>  		break;
> @@ -190,8 +247,12 @@ int xe_amc_init(struct xe_i2c *i2c)
>  
>  void xe_amc_exit(struct xe_i2c *i2c)
>  {
> +	struct xe_device *xe;
> +
>  	if (i2c->amc) {
>  		cancel_work_sync(&i2c->amc->work);
> +		xe = i2c_client_to_xe_device(i2c->client[XE_I2C_CLIENT_AMC]);
> +		xe_remove_amc_alert_sysfs(xe);
>  		kfree(i2c->amc);
>  	}
>  }
> -- 
> 2.54.0
> 
