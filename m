Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86574C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 23:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500B910E262;
	Tue, 30 Jul 2024 23:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/PUnkjR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F70E10E262
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jul 2024 23:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722380450; x=1753916450;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A/Ubkop0AQS1+Rb3rnDok7rd/oMGn1Sqr73b09ZXSME=;
 b=X/PUnkjReQ11UTjI6bncviP5mxGGxbIvpU7i8CGnkBPNuR1oFfs9+7hp
 0D8EkDPx5o4BT/g2Bd1k+lThscwsBY0gzjcvVYp7QHnm3AxscNfrEBShn
 SLWrxjLGNxTVWx9574MJHZDC6gyeB78/OOPW+kci8jr6mEPcXfS5+NsR2
 D+xl56EiOE5r8GtZIBkIgXq4UafB9+/lgZa0PpMtSBB/0tFKMZz4DuqTL
 EDJMQXOg1ztCZxmBcCxfVhAzYSSNUo8maKbbchtq4Ka4Y3Qek3S7kGB8h
 nCTpbhOYFyArBvdSYk4jcOS2tofwuSvG1trmdCAnsalR4eUlDKjQlUmBC A==;
X-CSE-ConnectionGUID: 7jpzSrlvTPaxLLUMBSezVg==
X-CSE-MsgGUID: EJsm0x8rTva0iW1RnSv6Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="23995396"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23995396"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 16:00:49 -0700
X-CSE-ConnectionGUID: FU5cDjVXSPGr11zT/JjoIQ==
X-CSE-MsgGUID: KIA1GvoxS8eu0Uldq0ZCsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54748178"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 16:00:48 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 16:00:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 16:00:48 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 16:00:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCI9laDNkijQ3Toq7aqMUf0AT/3RYUzjv6ANLaYpp75/jxZQw0rDgkhjhXCZzhBKrdruP9E4Dt1kqMFtrKLTS2lV+ole6Y5lEFLDrqiPrWsAxduiYUuntmywlvSFJMQ2cy/vQhYFeIuQnAsGQ9F1GUOdRK/46nNNxUX8gtBSmD1wIHUFGW13MKlLBjC7aXmENHKhmlIKV9EXqPfAZnaXREg+bosph4/AjEApwu4MqqTJUSdwpjuvEreRokTc+Jcy1JMbA1lcoguEc6L/KcZmKZcWauuYM4xfzL5/m0c0q7YhH4WQrt190qTYd9eeLStXUGaFqHw3GCY5DaPciazrjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBHQoCIyJI6S0GkOKe0O+4rIDN7P2JjF6W/hiOnA6QA=;
 b=r6+B++7YM2/IRDyptMntZwk6Vk+GiCtTnd0zByNS4v3WnSiHi3PNpKp2ZEks5t+b76FvPCXf6h84tdZ8NSdZYFcFPGGOwSFkHrHMQbnSloiFBIdD0/i2XozE99jzWKQ8q/tAl2NIaXqXO+KPkuYApN7bF01MO5GVuW34n1YDLwftTR11GwM3Fu8FsuT+Oz2TlztMTDu3CWV5uHjei7YzAmEhSGmoEZCuFbH3+Y89rC8XE3o0F9hl/QULjlGU+ZEKdfkWElaVnb2w0LZpAHq9YNC6/SWULdxtDRFxAUSkUnNGdATfvTu+YdjLqur0TqchvLo/GwVBlbVH/BP6BgCOtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB8419.namprd11.prod.outlook.com (2603:10b6:208:48b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 23:00:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.016; Tue, 30 Jul 2024
 23:00:26 +0000
Date: Tue, 30 Jul 2024 16:00:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/gt: Apply Wa_14020881953
Message-ID: <20240730230018.GG2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240730224530.2688251-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240730224530.2688251-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BYAPR01CA0019.prod.exchangelabs.com (2603:10b6:a02:80::32)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d1f0848-5072-4aff-7fbe-08dcb0eb66ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cxSVUPjFhQSrlmCbVL2po8Ox813AS57O5dhixSlSYBJcXz2hz4iX/g79iaZq?=
 =?us-ascii?Q?hlW3IIyjZYw+RZEVAjksW9rFfrLu1CK837roGfztjaA6GX/gWxFoso4ujjan?=
 =?us-ascii?Q?QqohSmQd52yTDRjXZuJhaJ7CCEbfTjiiCEwYrW4K6L1X+DQiFc/UITXD9iMC?=
 =?us-ascii?Q?G3nRbUFBHHY1uwd68C6seKeJ46NmskpbB9lnI2AE6dIcoqqjtCzTMaCBLTYV?=
 =?us-ascii?Q?jEe6LM59BpEzBg1LNjqiBcKMnDJnRiYZo/NJPOiNOtBthecrfMx8fTPSET8F?=
 =?us-ascii?Q?ZTbXcNUjG6WV37O9MyQv7s90SwVqOj7L9Jod65L9l5keQ4J0+BEdb1ZhQv1j?=
 =?us-ascii?Q?FuXdxtS6m3BNLdyKHU6hG9PfNMWgFYzlmBUdMULQeQkQvfyYuuNb+bAyYy/f?=
 =?us-ascii?Q?oQLzObdDP2z5QCvyKVJmoRY8+2oOdyRPa8d6zFaoYEW3XJTnKDzRl0fyHIZR?=
 =?us-ascii?Q?p3o4lYzZ555YTUCPxB1BRdiDeJ4F3izPYLWbUvNHg5Q8XxLWM+d3Rz8mbhZK?=
 =?us-ascii?Q?qCJN2C5nGM7j8I4Mx4rqWzMIqiXyRm7cParRHdC44C73WEQcD1GflFY4lTXX?=
 =?us-ascii?Q?WOJn2YvxmQgUrCOj+LND3AS/LyIDcAx8Dt9cdngDBA9SMbO5YDOlPyI2CY8G?=
 =?us-ascii?Q?DUhzTrinYN+9ulDHtCRoT7iqUg6xRCz0jxr+HoGyP1QanfhT0J6bIvz6v7xS?=
 =?us-ascii?Q?aIg8u5jAMFhUDR6vrlOyKpKbK34d0Atk8hfE2rsQgUNlpezc9qmpnthY3Eqp?=
 =?us-ascii?Q?yFYnAiWRkgJnaG4Q0y6LV/siowGgVn91nCsW+NadgZYpg1TDD5L5OFqn8VgU?=
 =?us-ascii?Q?3BD+HNpk9EGTJmaHK3o8lZWiFzHoG9TzNN521HNFwrXR/vsi8n24MdjzddrO?=
 =?us-ascii?Q?5V08Z59N5JkNi5QOyx/Z65V9yB1au7yKbJ3hhdnBidFhK3pQHANtlsdCCLhJ?=
 =?us-ascii?Q?ZVJXEM9GwTi7qrdi2GhdpbW+KZwC9cTgHnZ5jgmqndYchiB8UY+z1mLpluSq?=
 =?us-ascii?Q?bQ5rnoYroB0yNErPgzqFbCi3m6cssVSPVteuVp72e0ByjzAM4RGmoHyUD0pl?=
 =?us-ascii?Q?5kzoYkbXizybkyuLKNaNmafWuuE/1ydUklpjaK3Vz3qEawn3DXrQyhgSxwBX?=
 =?us-ascii?Q?U4qmp7GLEmGIXKFXsHChuyvsH5LXNrJXZJt/7bxJUn4SECzpsrjFou+v0KVG?=
 =?us-ascii?Q?AD1UiPGjSo1rMDqP0R9DZDkE+A8upOGY9LkPecObga0Y48sCY2ClW4jzkcb7?=
 =?us-ascii?Q?GdcyxI66G59qeBan3p2GDf016wB5fHjkH7ffTorDKBM+YZzgXqJ6Kt5cePXl?=
 =?us-ascii?Q?WTG07ta57lrOA2K4Qzh4lRX8M/X2Y7f8FL/nlCNfJ1QTJg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yHZBP32pMKAi5/jCZhhJ4r11KfvWaeTE10nn8ROOuuozRdqj8s6FZWHYW0na?=
 =?us-ascii?Q?b/QP3MzLnuxkm2ejWIY2kcBAgaqhkx2DUfP0QRXeJ+/D9GScgZc0bZKNGOmh?=
 =?us-ascii?Q?dW4f12+G/F/GKxquS+1PXXvUke1uRazSIoRyMytj0qZBhZOTpC/hDj9kS71v?=
 =?us-ascii?Q?WZ31qPX5T/+nZ5QGm7fgS6BTIEoBCoNDP1Q55FSUJ4gG5f5oVwcMp6j9RCkO?=
 =?us-ascii?Q?Je8sC60a2DV2VCxC98DReICInIbSBB/uzLXf3MNS/kqT0Es2hWMncB0jXzDA?=
 =?us-ascii?Q?FpbA4PiLbmt6MTSrMvtjfp3aDZ8XaguCV1yJYKV7+L7gxPln3wYoSCqDw3D5?=
 =?us-ascii?Q?k5wEOMVc4uAEB//O7tIZyQPAJ4GXGfy4yJ8ipfnTN3SOjLaVkhMy/0ifVMAh?=
 =?us-ascii?Q?QGf3fuHOvQb70yCHJuSERZ+CclqSYsbgXA41fs2RPx+kU9yQjie7Z7sujanK?=
 =?us-ascii?Q?wrBVoN11X3tFy45uSFwRbQmAtOrhTXQfW6cbBTlyhX1q6FvtHOF24r7aAc/v?=
 =?us-ascii?Q?+i/KMBXimTI5NvGBpHhEBxQeWbNX3CwH5gEGbY+tQOxrBJ8ZUYpjpd49JTOP?=
 =?us-ascii?Q?+yADNgC2nGc05t/qjZDu3bEE9ROoT9e++JWG7kaV57ilDZfomaqew/JUnjJ4?=
 =?us-ascii?Q?+7m6Vs7Flx9TpjycW4F7PWWf3iL0ODkBNbIkh2ZgrY1oTMflmtmDRh4PIJA3?=
 =?us-ascii?Q?lOrP34cuqoGcjl5L4sA9ysqiTpnQMTzrsFRRzAu2CvhDHFIWJNn6W21iRO0q?=
 =?us-ascii?Q?164ZbJCs42a0PjzAv+qIAseDdYr0n/ZlAuSPoNx5LkX2McCI/MJOcENCfXgo?=
 =?us-ascii?Q?c3HawbQoL67ef7lN8tP+sy61RzT1eOsf4neGOjq0hxwPKqBNYKxj0TK/+NDv?=
 =?us-ascii?Q?/GlaWJ2WNanwBwBqxO1lx58+hf8TfYb7fxAx4bebGYtn8VY8R3BdkIsZug8M?=
 =?us-ascii?Q?9Qb5jHutFzv3ErJamyVaP53T5oRxOZmkgyiJxLLd46ZvgoQVErjeEy05o6BA?=
 =?us-ascii?Q?tqFd+8eLUTkk4rIldaVbsKXUL4TSIcGU9c+JQ4E2E52pqakxnKaZQMKK5cE/?=
 =?us-ascii?Q?iogBtpJUgEqLGb9ogalJ9u63oIf5ZIBf8dP1b23KcI0vrKnGIM28XYM329Pr?=
 =?us-ascii?Q?sl8/mVAIeKKSur4dE0Nk56w1OTCU5PgWW+I3fW/S68ZPLf/BvVdhDeiF/UTC?=
 =?us-ascii?Q?4wZ6BqA5GFwhDoLJjggFnfYwl4OlMaD1s3ttRmb0s52U6ul/RGqEzJCNPM5M?=
 =?us-ascii?Q?rw+9w3pqeSdVUWDMP1PFaegxnUE2nHECuCHIlXTe3234JzJ40jph2fQ46VHd?=
 =?us-ascii?Q?YJ6sSn32p7wBtlRjffNvOI+vwL/HNVp4yX3HwOZIxaOadNR61u4ounjIXu8k?=
 =?us-ascii?Q?PWaH5ODv6e3NtZRcNw3nxGgvf0OZGbIatprI+p0sRa7tw/z/Twv2tmIoP1Pl?=
 =?us-ascii?Q?ztkaBHBkNrpabBXMgzf812UbDj17fdnnqp7h6DD+ZBUqYOjiL/5HlNwqRAL/?=
 =?us-ascii?Q?LQFF29QNHD3bvjnWQ8b9dyEeFnIkM93H6BAaxcYB3AfIxkONfkKqgvyXijoQ?=
 =?us-ascii?Q?BtjG/NzCkdBLq7BVreK/F3hQOctt9bp6UzCCBDHCWBf022ZRJjcZJSkYte0V?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1f0848-5072-4aff-7fbe-08dcb0eb66ae
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 23:00:26.7847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnwmhUHnxjDjIyIrheuItN65SWGbtR1QAkQA1+ijbuqb+nTUZDQb/8LaNRCU0j0Tpk697iFXDxVqQjI2SwV1US6U7K8oLghsGLZsltOBaWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8419
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

On Tue, Jul 30, 2024 at 03:45:30PM -0700, Vinay Belgaumkar wrote:
> This WA requires us to disable Render power gating. There is a second part
> to the WA which requires setting a WA bit in GuC. That will be done once
> GuC FW has those changes.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c    | 7 ++++++-
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 67aba4140510..3ed60a212ff6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <drm/drm_managed.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "xe_force_wake.h"
>  #include "xe_device.h"
> @@ -16,6 +17,7 @@
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> +#include "xe_wa.h"
>  
>  /**
>   * DOC: Xe GT Idle
> @@ -110,7 +112,10 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>  
>  	xe_device_assert_mem_access(gt_to_xe(gt));
>  
> -	pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
> +	if (XE_WA(gt, 14020881953))
> +		pg_enable = MEDIA_POWERGATE_ENABLE;
> +	else
> +		pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
>  
>  	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>  		if ((gt->info.engine_mask & BIT(i)))
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 540d38603f32..c513b801655c 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -31,3 +31,4 @@
>  		GRAPHICS_VERSION(2001)
>  22019338487_display	PLATFORM(LUNARLAKE)
>  16023588340	GRAPHICS_VERSION(2001)
> +14020881953	GRAPHICS_VERSION_RANGE(2001, 2004)
> -- 
> 2.38.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
