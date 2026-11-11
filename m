Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD71C606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 19:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z1J7hrqX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA6010EA83;
	Wed, 11 Nov 2026 19:57:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94FB10EA83
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 19:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794427067; x=1825963067;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7+rA41HD5XQh569vLP3YMHEuz7bHEHjvKuswaOIW37k=;
 b=Z1J7hrqXjhXLL0jGpWn5VVRv6MgTd0pUmNiX/en7DpgxNmqxXYcxwSdc
 569WJ9cq9Lfgqv7Uvq4x0TO/NxHWHucXwv7lfQGBhMXPazWW/51AaJGxG
 /4JDuQoUP5yf8NqVO0WLoG389sLkQC+3YzpGmEgaeRE5wB95iLNsPnFXX
 sBor1ERjSMCSJ3XIPcY5260yTKoCWzmJTX49gd9ObVb5Xj8SRVaAXrVoB
 jw7kW/byJ4nX39gf7s4EbivzJw8ILnWIord+lTHgRskOgyB7LB374fa8w
 S9N7eN4oRGXrqe0MSXQY0Q5nMIQdde7/2ZhG+wVHkrDtrXxq/3DmFcHVd Q==;
X-CSE-ConnectionGUID: 3ySXzvJ9T82unCIO+MWdYQ==
X-CSE-MsgGUID: ifTbdl9rQ5yyhd1+poFCtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3125669"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3125669"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 11:57:46 -0800
X-CSE-ConnectionGUID: wVc3OFeFRtSHFp6HfFOz2g==
X-CSE-MsgGUID: E7NVnIimSC23MeNPj6kWHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8366940"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 11:57:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:57:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 11:57:45 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:57:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OX8oCkB457WRTXOGwfKc35trn0JBJw57CU/x8XOh19xvyZ0VkeyKszC+Lmg7Nd8bsU4tSbewI96n0pmPtaiyH2Ew2743I9IIW7pzcUilW9J+/uFjfbB/VWx47MhJkzoen+qQKuIHTTifWABV2cPtnBnmQDmlBmAg8soyg9g6llFDp35iq7GOrxTnGzU5VDoop134N+vMDwO6FkdLzU8MTvguYipBQzByjIY8FMxuFrtxgh79H0TDYpCCwH0eYhzziflsvLifvJuKB4sy5REHPdfWd5RxpH0306fK1o0ewGUhxC6FaPrjJZjhFmXZraS3ofWyjqYYk5loROWZkidJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NS/wEZ8eXa9oVCZ1ApEvGmPGUm5w/xDHm5gVfeIAwzY=;
 b=xnsr1rA1LwM6lrzvhJXZxReOOQ6c0jeO9wu55FtqoZJ9hZI1R8ndbFd3g7eOr6LEH9M3E7Up6OdyVkS1KDJ0J6IdikVMkE6lrgY5devmxX4iiPkfh+bNd+WCF4zWFs/JfMsMxJrGSu/XKYgS8xJrXYP92j2S91Y5xiue/jEMEyu3O1ieMP0oL+7ZWHVObQHS65Dj0psUtfXExnoZUPyWrOQbY+/fksQYf2ETr8rKZcxe7Dmr/v9aX0CkZlXA7xFhyUTIOSAcBhXZ7PEk/YWecOlYMKWHW8K7pMAg9xaDCgJ33/uzEPt6Jce4Bq4ayZ4ksQlOrbpJm/sXJXJEUjqHCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH8PR11MB7095.namprd11.prod.outlook.com (2603:10b6:510:215::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Wed, 11 Nov
 2026 19:57:43 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 19:57:43 +0000
Date: Wed, 11 Nov 2026 14:57:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anoop.c.vijay@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Process device OOB workarounds during early
 info init
Message-ID: <avTIsmNyx96rMfWP@intel.com>
References: <20261104215353.234314-5-stuart.summers@intel.com>
 <20261104215353.234314-7-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261104215353.234314-7-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH8PR11MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: e646e3ab-c03c-49f7-17fe-08df402e0c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|10067099003|261028144727099003|4143699003|11063799006|261009223027099003|261026121527099003|56012099006|261102123227099003|261021121427099003|261022105027099003|261021123027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: QfwmpyCfzp0+pIv2PNpiuHCOV6DdKkiSLWtgj6vCFYyTz7pT1B029Rv5iWDpT9mm56PRj+wIb9OXN8JbxtlqyK87VN5TCAUf4CUdChB5mtAQg86bGeoppu6F9Ly0I4wbXdh3tPMHfX5XE3xp/PgmEIvKDv8bBb6HN04u49XN+2B5dS8RRN885FvAtzr7XGWFFXUGOriT9fbLg5lGWkmPm0tMF/l3ngyn8U3FgNdrxGHuBk0I1NpOjSxfAHPC6hR+289j77sktKDuKQH2t/jAI6XATVytFgv6/ioYF72O6o9LIHo97Fwtq1DQKHhNuk2xM2z5gnTnlG1MRxuakN3J0EpFT3UnuZ6FFvufdfbZWvRqPTPmgs6U4L7tkwgjMgCaDOMjjF3NEdLf6wKOiSH68QhQhBHTtnXS2XnXXxMwvGfRBn+bj9JFbor3tOeWzcJnux0v6DGAJxMwNamiuQFEumxFYsGl+6oDuQ1s49Fqr2METWCT2T7lAF8Prq8afv/GPu4ZKjFjT4Wz5D6hexcDkDQ1b0TLLYdr+hiwbHH+cYQIaQ0yA40PQxe60NbFN8SbIR5Z35Rv8f4iAjj6KW4S0gZZaw4SFUr2TbuBUnm94+rxVw+0yYt3r8aQ1wDW3SAwqHdyZSOsdSrhBd9hMW2TmbMZH7NCleZF04/GS1HzG3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(261028144727099003)(4143699003)(11063799006)(261009223027099003)(261026121527099003)(56012099006)(261102123227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8HO8nythnv25y7g5ffIJ0EwscaNNgS1FfYoAps4vKjsIBPLvqllm/RSxqcqO?=
 =?us-ascii?Q?Oit8opj15+mBzbqWFhG+HvP70cBXon23XmeZvQ/0iAitGY29BLMAVn1s80Qj?=
 =?us-ascii?Q?b9vJccBxIyESFy+yDjWNo6MWVqnQYBPTGdG2nB80G1dBe+sBDKjXL8M5XZhX?=
 =?us-ascii?Q?kmxIh1kWBDerONumRibMYgT6GeM6KbA3UINHayuHReXaU3EkhvWspijX/umn?=
 =?us-ascii?Q?eRUjrBR39A4sQysK7XMJMgvWLp5828TSfBy/KwIOmGHzm+LJWzBmfyKn6R6S?=
 =?us-ascii?Q?Lxp9g/3gyeIdVfRW9WRQCDgabzLv8WRrU5jmuCN4j/6/hYddg9QnayIcayTe?=
 =?us-ascii?Q?B/na7GYRPFwCzBMNNL8n0KDl41sXnPTO9JC2rTYsedGzbyqPFOKLhJyV3SFC?=
 =?us-ascii?Q?9VjrL+Oh9Cd7Enqo7aQLzuIggn5qPsmrP0JhmS8sgcxqJaZztFGcgU94VhaR?=
 =?us-ascii?Q?md2YTrFesjbHk/hcOedOxXuCjjT9xwv4t1Mz3IWDfER9FzhGKKOrtHD6Lpys?=
 =?us-ascii?Q?6VwHe5SUCQt9xgjBxIfd/ssjQ8CqHO9iuazSCD1UTpT20xnsnNMAYn1ycdYW?=
 =?us-ascii?Q?pludhMeSwWcvfL0t4DGBh1uPaWp+rpB6w+8TZ8AL6ckeVH9wDUGEfAQ8gM4Z?=
 =?us-ascii?Q?1Hzurl8A4poWHxDq+7u6DIiJ/Y9ZrgLn4PUpKh5DBiUIE4FNoDonteLUe9Fs?=
 =?us-ascii?Q?bp5VJjvwLbn0qJMmbsYNTySR+w+l3OaU8zluq3eaqN4WVVUDd0MSJ/dWm/ne?=
 =?us-ascii?Q?mLtmb2uB0zeZB5KTPu+rsu9rbjRWrTs4vG+qPROiox/xmb/zAv2mhf7MHpAW?=
 =?us-ascii?Q?RJKitMTSRzuyTTCPXLC0CtKNV/BYNaLmYXj6V0yhDq41QdgCEorv6BqvZKOU?=
 =?us-ascii?Q?DCO4f88vA2T722sio+QeaVEm1NE7U6PlD+zpyVua1OVeDeommr4YVvGP6tKM?=
 =?us-ascii?Q?diVAlTVUzUHXCmzBIrkOJZOlhp1wElBXKFxXCuhqVSmZ9ccBJCk9O8xKCxKZ?=
 =?us-ascii?Q?5Xq88g0bgUJrBeHDuyUuu2u3SjP/90q7f0YzvUzGyv9n5Jrmzo7vAA3cOX9a?=
 =?us-ascii?Q?FuDNQZpOLEDDVDMWMePkDHGEfDffKr+uqzFIR5dgk6zyn1eLj+9T4B0SYCvy?=
 =?us-ascii?Q?LaQK68fmUdw3l4yuhj8dl9Mx9dPnTREHAXJ2PljqU4icJlSC/DfbIZurDO7b?=
 =?us-ascii?Q?IScmBuBffZtaQbZ23Gw+e48Uo5qt4ijRNbg9nNbPg+ycf4cxn9gGOyiKVbrg?=
 =?us-ascii?Q?HUApMcLL16wyiZwQyI6Hbp6ZQlVMwm8q2eAPX1ijUQtAcngo9M36Z1toABz5?=
 =?us-ascii?Q?ZMtBlR4v9z9+qt1vYuScEBBB0kmXchjx3W1LF1MEEt3E5YJhn8sy9l9vTZq7?=
 =?us-ascii?Q?8qZTN60widGXc4BnSx3jPlCKAFROhKDTXBLF1QFMSDDAhbCD3+RDvNh3XPDN?=
 =?us-ascii?Q?mD3wbpyAmMPj044dwwwMQS0aL3WUUGqOMQx3IkwqxPpFKd32ppIY/oIKYKWb?=
 =?us-ascii?Q?nVjyhq51p3Wmv11/t2cLf3wBCBGMaxOS0yh+/XNzJWQ9SqS8XW8ysEJItrgZ?=
 =?us-ascii?Q?4s1J2AguT0U5PY/E0KurmUC+7L9mo/N9qhIbUogck0AhKKJo3E77P1UWsKMK?=
 =?us-ascii?Q?a+Pmy8jsixv49GChMubmzMH08B3hwWapoAMSa6SsY5L/Qo5mdm1/2crkdUkU?=
 =?us-ascii?Q?zJ7oRRpmb45+oJFSzovsWt+CA9lHcaoX6yFB8E6OvtWyahI/v/rgYP/Xb5mP?=
 =?us-ascii?Q?xe+zen571A=3D=3D?=
X-Exchange-RoutingPolicyChecked: pHQ3epfSXSQwfveUm8KgkZcH660k2Xfn7Xm1w92T/Hk0P9TQ5z3BofrC7ClMfHGk4CY5yGWZXqSKJ1xjFfbm5/jemv2h+QnWotkaAMQmEbd7GR4MaUwZl2x5Y5S4pLxpSfLZzHp8ThnpvG0bLq/KcAU4fkRtzpiJtn/ErPIaDlfnZu6qg8I48naeQzSwfYaEIDuCCAdiclQ4yuC7N7JaCERqLXuY0kcZZv3J5wkYa7foVp8HLdqer0uByF7RqOGsW+XNTY6cdJNhgS1KodrApsbTjFxJqEVxQESmE0KK91wVYO1o2kshz5JiSYrq4J3KMQE7yKsD3vCoWm+i3rsm/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: e646e3ab-c03c-49f7-17fe-08df402e0c2d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:57:43.0335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1kL0ywQ78CZnEToYYHQRwjI9ouFTV//ec8lp3NTUb7vCyXVBTjUvf4pK0mIgJSVi8qr+71ThiGPLdx/VSxVBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7095
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 09:53:55PM +0000, Stuart Summers wrote:
> Device OOB workarounds only match on platform, subplatform and platform
> step, all of which are known once xe_info_init_early() has copied them
> out of the device descriptor. Processing them there instead of in
> xe_device_probe_early() makes XE_DEVICE_WA() usable for the rest of
> early probe, which runs before xe_device_probe_early().
> 
> While moving the call, check the return value of xe_wa_device_init(),
> which the old call site silently dropped.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  3 ---
>  drivers/gpu/drm/xe/xe_pci.c    | 14 ++++++++++++++
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 273e2c45fea9..ae28584e1e95 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -712,9 +712,6 @@ int xe_device_probe_early(struct xe_device *xe)
>  {
>  	int err;
>  
> -	xe_wa_device_init(xe);
> -	xe_wa_process_device_oob(xe);
> -
>  	err = xe_mmio_probe_early(xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ba23ec60477b..ee3766e2b938 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -15,6 +15,8 @@
>  #include <drm/drm_drv.h>
>  #include <drm/intel/pciids.h>
>  
> +#include <generated/xe_device_wa_oob.h>
> +
>  #include "display/xe_display.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
> @@ -39,6 +41,7 @@
>  #include "xe_survivability_mode.h"
>  #include "xe_tile.h"
>  #include "xe_tile_printk.h"
> +#include "xe_wa.h"
>  
>  enum toggle_d3cold {
>  	D3COLD_DISABLE,
> @@ -794,6 +797,17 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.subplatform = subplatform_desc ?
>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>  
> +	/*
> +	 * Device OOB workarounds only match on platform, subplatform and
> +	 * platform step, which are all known by now, so process them here and
> +	 * make XE_DEVICE_WA() usable for the remainder of early probe.
> +	 */

I don't believe this comment is necessary here. Probably AI being over verbose?

Anyway,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +	err = xe_wa_device_init(xe);
> +	if (err)
> +		return err;
> +
> +	xe_wa_process_device_oob(xe);
> +
>  	xe->info.dma_mask_size = desc->dma_mask_size;
>  	xe->info.va_bits = desc->va_bits;
>  	xe->info.vm_max_level = desc->vm_max_level;
> -- 
> 2.43.0
> 
