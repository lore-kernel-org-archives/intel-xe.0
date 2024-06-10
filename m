Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA483C27C5E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 19:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868ED10E134;
	Mon, 10 Jun 2024 19:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIWq4do4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C7310E134
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 19:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718049099; x=1749585099;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G0SUQZ2BQug95SHm2Ga6yZB921y+d30XiyVyoG6rkK4=;
 b=QIWq4do4u5wvJNt0Uo3eGdCiaLLRWf2nyaG5+ZDq4IboM4pT3LKw2rhD
 xyVMS5dqYdEwDCombNPluxPaM2UEFMagZQ7do1r6Zl7qLTJV9XGQQDejL
 YUaLZxd+IYMA5uys2sWiPX/cO48rBNfiFbx/pSvY9QWyEBPzbxxUJAY6e
 r5x+Px2M2fwT24TUfp1vI1s+Hkvk8pGg1ELMEQEU1P7pHAuzKewmtM8HJ
 0Yo7ZLMTZMygYZLaPtAVKjfrnjXajc2CvN91oeHpLIr0rrNsojEMelOGV
 tuYcwleEiwtvrwtCQzCy10wvX3rUGid6EPwG4TZpzouRUBg+XwGf3/WRi A==;
X-CSE-ConnectionGUID: 8ZXFSnb9TMKgacFcKes4OQ==
X-CSE-MsgGUID: 732sFhytT72KnKzq+ipspA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18513295"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="18513295"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 12:51:39 -0700
X-CSE-ConnectionGUID: L2XsDjfkT0aV87o6tnh91Q==
X-CSE-MsgGUID: 4NDtPb9KS7CyF0vMRwmTYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="76628714"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 12:51:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 12:51:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 12:51:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 12:51:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaEO8j6W3T56bpGJAIzN0GxHIJZSxktLrbhQAIsAtrmUznlyc3Uhgu1n0MsuizDvjRaechDU0LXTlfOzZS+A0BLygTd5z5TYv63swxRsMPndlu6ZAoNLr2hGKdlXdvrI4n9Me9X281gJ5Fbh03aX/qzFpwnBnigFqRmQ8FKdXFY2Ne0rD/xaf193CoWTL55KyfUwyzyg5SSc/lpnf9LNwBlPiMYzE2l1ebce0uAIrB613s9Lyu3dPiRXED2Wg0lCXcFwNcEqH/xYT8mQBjMzHanm7++5+sgcgvI/GVUV2GkxtbqBAccFuiYqlptEHvTa1wH4dgyuJJg762te/VzEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpYoPU80DRWva9au3SPTjPbkGqA9eVuTkOUFZpTA6zw=;
 b=mrTYXcut8rOOa0/KZa09DltTcFxAp1HNzHfC/7M/H7KnHchC0X87RoJzY+ZrEhgDefX+hkvNHah2OR0z33W+aYPk7qmgFGrZoghsJyakcqFn3bbmQcbsQlM7jTGIpS5kXZbplzXtCOuQ7diV1exskOTHL0s/PpeHWmhPdZQXE5resMxgt3dyhZSipQk8gn0f4AxqtSaRyYW+BowFLp53X0aBjihZpcWqoYe6yJvyvik5aGj8YOnjomgPYomHlNby06Mw1+6POshkwHjvXhnihhziW+kFRMbK5VwCalw21glLq+HE6pi6DZR//vHobaT6ZzDaFx4u3ZbjLwwuqacEpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by BN9PR11MB5257.namprd11.prod.outlook.com (2603:10b6:408:132::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 19:51:30 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 19:51:30 +0000
Date: Mon, 10 Jun 2024 15:51:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/xe/vf: Ignore force-wake requests if VF
Message-ID: <ZmdZQKGsVWAe1yEC@intel.com>
References: <20240610183757.1812-1-michal.wajdeczko@intel.com>
 <20240610183757.1812-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240610183757.1812-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR06CA0053.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::30) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|BN9PR11MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: c9276125-5a8a-48c3-9cb1-08dc8986b937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h6hZW3YEwjQc/C2w8es0DlDW9+m5flx65piPlwOdoZREIX4E1VamCtZiMi8G?=
 =?us-ascii?Q?8P0q7huwTsPhPPqgorSPCuBe6aG1GauU6ZRN5v5387L1e+qUhr05XEAxKfMd?=
 =?us-ascii?Q?2/bUf+T7d9tO2kTxRAnOeaZPk9auN1JSUzYm3NZ8hib4xcbgU9Jbcc0rcXxg?=
 =?us-ascii?Q?nvgfIGuOlu/LP3Nr0fwhVRgAzHfLw6uvtv+fCFsLgKz5juOS1k4VWaXiq5DQ?=
 =?us-ascii?Q?rMPf1nSFKFwWLCqWdQ4ylCoBTNSczzf/myv5tY5abQXrXyb0bZ5/fIYQ/K8k?=
 =?us-ascii?Q?zbDxIoDbCWL84gysdtJdhss40vSlQ3I00fYl4Ik7MzH4lci2xq+cuNu5DNeF?=
 =?us-ascii?Q?jEEzqt03A5SWNyMAr03mcyXAf24OZIxvu8CTwiAuFUlAQIa+2rkYkK6Kpidz?=
 =?us-ascii?Q?4Ygk0vQc5utlyK9pRp+v1CwsEIm9lQI4AtLrVWPh1OBUB5ZwSdnTNDWzFp+U?=
 =?us-ascii?Q?5HMrqCKffaGpHfwkF5Ve68iTX0SdWqTV9LP9J20HpWRPNmV3HcpL/vvCRGb7?=
 =?us-ascii?Q?sSi7mkAeEaVKY847iKq7XlfXHJJbITxXc/J9yPJovGhXZZBxlNaTBcsRYn6Z?=
 =?us-ascii?Q?9VRkAepSkSMm6IaOTG87V5RnG+DzGgGPxVrxtguuUWQmWrW1KlzdWpLLlNHB?=
 =?us-ascii?Q?uicXD81UZF3WkG+5/sA9XUrJ7jDA3zczl8dNDfCgSiH2FKnGFzX8uR5gq8A9?=
 =?us-ascii?Q?mqyXNVzROe+xY5xImoLEf1UmcMhS/t/3h/MXlcAtMw9KXBpVsKErW8j/pZHr?=
 =?us-ascii?Q?HsqzusOb+8eyM/fOvZ1fimtEHUSx1f4l0R7prCyjscswg9Ue5eUFQ1lKf2yH?=
 =?us-ascii?Q?g9NCIsZoF/hRMqeymyFkxNKXkWcXdLM93NzSfdAnQDXYOs+EfhE2a3d1i1u3?=
 =?us-ascii?Q?aubTziASLht13rOnGS77yh5zTCl1TEyyoP3wn2U3Ewfu9pgwQeBDwEAkF+U+?=
 =?us-ascii?Q?S7uHb+mpVBS0z56p2+1YHDf7zEsP1KavYh2rr/oUNzJ/q5Aex8C1cKgCU8ei?=
 =?us-ascii?Q?XiP7L2gkngMQaa9Veo1NDsLTJItgVyaZ8PuD2+edRYx5bll00RTlFxN3if1d?=
 =?us-ascii?Q?p7dfiuaGBvvEw48ANiM8FL2BqvIKrdiN+UrNXVWqyxz5iJCSwXcIJq/G7VTT?=
 =?us-ascii?Q?X/X5aHWtFhuaIMKDwXgiLDeF6fmlE/ilvhAkRhXFxpOPG7baH/vcTMotbb7T?=
 =?us-ascii?Q?5sRTuh4bsOsVyicQP0Nx8K8CTLVZ3zqr0MY8iOCtHoCRiKqdv86SbTTBMM5H?=
 =?us-ascii?Q?yh/7ng3mWZTpLSMQ9xHe6GtObP/hM6Y6cZFb5MFApY3b5OjkAXSC4Ii6lV9a?=
 =?us-ascii?Q?f3UUQnGvUZiEzjfghpoOLMuM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t62lKKcCAccbgQnLQIZ9xn2CLwwEVwY1EGMTLt79MvJrvdgCQv2MqQMMGBwK?=
 =?us-ascii?Q?9DFVK5FH+G1C2PS5DswO4CY/xPAkdhHX05E765MyC3zKLrTnwpdZh2RORpWf?=
 =?us-ascii?Q?DsggAHwESGdXHqOqAQFaT80kntQEqO8gwbpodngEvF2G1UVIRB4jt/00+S+2?=
 =?us-ascii?Q?TXYGYHN2DUs1m4CeO3fn3JfCxlyUgaCdI/EuCtqK/wA0PbCNutoVER0qk4i/?=
 =?us-ascii?Q?YFJEwnbAoRqpEufLfN4Q+y/+OykJdkKs/y21kwAH8nei0jkcKc9VJq3Ewk1D?=
 =?us-ascii?Q?7sJO7w1Oj3SElvGByw6Ed3uQAWVDTBJJgiH0nGPOSVTYQ3PUuURWuLdyLQFl?=
 =?us-ascii?Q?oVcqYUqGMNNMTMskP8IWDe2SkJ1Nv7FmQuHVib4ZvDUagZiKdKDdOcYsAD2O?=
 =?us-ascii?Q?AUkecJhkzvQzyTGuVhVYPgxPeXSQiTSBLdbHHx39aVuYPxHMUusA2kZ5ZQEU?=
 =?us-ascii?Q?urWTKPZkTjCo5vbVq51ap4C70zUzVmO6PJbw2GvnCitCwM4SqptfjVUbDw1z?=
 =?us-ascii?Q?Cg5xGvM+2NuIchKOlBUY9cOGIRgssrxf6rgxOUkQlg7vjUkhrzzdehkvs5K6?=
 =?us-ascii?Q?3HBTCAU0M9Hzo6b928Pek6Ciwi1E6JP0RbkCJcOOjZ8r6Kc3o6AfnG+xIaa9?=
 =?us-ascii?Q?ZULDZuj3ijdk4p34ZDvnCegfy80JBE+36ga0V1uu6iYeBI3B7Y7/BfUTN3sP?=
 =?us-ascii?Q?fFcg1IRKTeM9l3Kbr0l2N/aMg5/piNpKtxkwOZt3O2x6BpLTYbRAtQT8SgEH?=
 =?us-ascii?Q?HDXExGFF3YsXleawVJ1gJPIUr8701MintM2YMk8D7GHsKTcKTNYgW4Cq+rJ4?=
 =?us-ascii?Q?ReSbN2qnFi+YmF4uaMeF9rY0tJffGxnOxwbINABdfdf19i4JFjmhm6Ilwea4?=
 =?us-ascii?Q?mQp9JRGqWzRZzy/5kGQMZS4uLxsiMzSpr5w6zq0LqMHQATb0Yn78swjTr1Fi?=
 =?us-ascii?Q?uHkpMx8MIKdEsCuQzV4kqU1DpMOYZBxEeBgR3VuyrAsDgAU4tzoKu1wICcJU?=
 =?us-ascii?Q?3fiSog/nrEhfkPwnEaW7Nj8wdDEp7vpLDMzgb6MSPSIzfZ7gfeCwoPpnSh3R?=
 =?us-ascii?Q?yMEEcV7xvrZjkG9WTyPVMaKPzKHzHWhkb5p3UAI54PqpKO4eSojfD/czxwRD?=
 =?us-ascii?Q?9tg0tv4zd7UwZ1fR0Z7e/qHIGq3s7JbkZga8df5r9QFlZD6/L7y7QIqgwbe2?=
 =?us-ascii?Q?dl1tU/wKelX++b8JpWd8F2ERo9tQTMteJenEnBV99EybBR4g/x2AVW5bFbRX?=
 =?us-ascii?Q?mlMJCLcc1ixi7HZmtPEwI2b0j/m7zrpT5FqpxlgHbQC3UsGrsq3+ONB2CAPE?=
 =?us-ascii?Q?xHekShhO/ya4YIeaPA6WJBp76XkFS7KajnOVP52dyMRl2Q7leJU+e0Ct1RVh?=
 =?us-ascii?Q?U/rgxRdZaPEz2+ZTY3ssUdt3vJMj7kRcQNPYZZFqSHnNE9yp9/up2PTZsI8k?=
 =?us-ascii?Q?cUbpWXHFn3qPrJGcj4Ff7O2spMSkC8UGOlqb/i+i8NBAxjW1zOsM2TYH+okD?=
 =?us-ascii?Q?e2vDRhpGs2ERKT67Er1Fqcw1qkI9/p8t2riJ0NEPCzi/mQ4Ilc4HCMUnryad?=
 =?us-ascii?Q?kFG9QqegH9PqFwS/kHtys/JmRR27WTePvsTTnE7I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9276125-5a8a-48c3-9cb1-08dc8986b937
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 19:51:30.7302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OfFQobIDfg7Fei1Hi7owg1bGB54UPuPXJtopd7QAq8zS8mMcO2FjmD1IvbJs628QeC+JvG7Jlybw1qRMklxxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5257
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

On Mon, Jun 10, 2024 at 08:37:57PM +0200, Michal Wajdeczko wrote:
> The control and ack force-wake registers are not accessible for
> the VF drivers. To avoid changing existing code logic that tracks
> woken domains, simply ignore all attempts to access control or ack
> registers if we are running as a VF driver.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index b0baa9094418..4d472192e87b 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -12,6 +12,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
>  #include "xe_mmio.h"
> +#include "xe_sriov.h"
>  
>  #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>  
> @@ -101,6 +102,9 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  
>  static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
>  {
> +	if (IS_SRIOV(gt_to_xe(gt)))
> +		return;
> +
>  	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
>  }
>  
> @@ -109,6 +113,9 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
>  	u32 value;
>  	int ret;
>  
> +	if (IS_SRIOV(gt_to_xe(gt)))
> +		return 0;
> +
>  	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, wake ? domain->val : 0,
>  			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
>  			     &value, true);
> -- 
> 2.43.0
> 
