Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3E9C27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 17:48:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EFE10E038;
	Fri, 21 Jun 2024 17:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMbvjHq2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E809910E038
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jun 2024 17:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718992082; x=1750528082;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0gErtlFqWoZ5SMzWjE/kh0v4iwlaWr0z34d/w8DjlEM=;
 b=PMbvjHq2W7xoGy5vHkNG69HLOnRKi7yLkbi9s7EBFZoaBsdPbM/ztkzj
 pOWOdZywO/tfs0W22EClh01wEXe59yGMEUW0k5C7VLHEAMmeBkexaupe7
 +oS51yZCctlBy8EjD0o7cBNd8tOMOh7DRDYzSjV2nYdN94ri4S/FuXK79
 V5AaWbiOYBjpLmZzo5Fpqn481Qp7/XHsKE0LK3bA2/nEn6QxYA/LmssV7
 Rvkx71CbKT39QOqmqDToHYsn72apJsiNjjvWi8dvnAgkDkbePQA+U7elC
 d/lu2wiR5Cpkbolvsx/FmgCkiWKDcgqKRZEKM3s2N5fM2Cjdr43ZciKlD w==;
X-CSE-ConnectionGUID: EwqTT0xMSqquZ1lf4j28Bw==
X-CSE-MsgGUID: cW+4VE0RROyCHXALHa0Skg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="26726010"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="26726010"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 10:48:00 -0700
X-CSE-ConnectionGUID: s4uJnKZSRrSAHqFGCVfl3A==
X-CSE-MsgGUID: xQr6q4S4QcWisiiW/SRVhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="42622123"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 10:48:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 10:48:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 10:48:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 10:47:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n30tbk11PTPQ8efastK7rt7Rm58khA8EhouWifOF1rnVJeXnq2HYU4AjHzLBmQBTi6aga9fnYoNwIDAoiR7CplsidaaZ+P+Ys5yw+9YbbXpfK3yI3LxpVrefQydkzOMzfEbEqUUctozLhlSdC6nzLGKI54r9uIgNlL8vYg9fOdfSmvg6Fo8BrfdflEGw8oMkp1msE+eySblnN0hvgDCcDSzkPL1O+MyNutth1aZFDBIZPtSMUQRspZaIswcHalhIbk7EhvsuOfsk1r1+3AA9C3w8BXs3tKTwfabWUl/lPavqP6zKD5jDagHNtUzvoQ5wHBkQ0wQmbsMRMQcB8vBR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=api4EZvpYSjOcloYgEUnpU25PoRu/gtMPtQcwfL3SRU=;
 b=fl/giX+hNEz63NvVNLEKZYx2t78vsR3+EYxl/oamYHab3YsdnqHqXDjvja0qYInUHZWLUG5KmgxItfpChNR0VPInwIMGdMo+WCKvMCLopNbVhkWkEzGuETCYVJAItqbYlSm52K6fnJkUP1ObixZRzynN5YBTwyxUSLboOwUTLQtuY8bQjY+JgHNfJMA+a9dqs1+gjQn+I9K14uMeYxZKMxGOSC0Sh1jkx2ZsWSSYrk7Yweu5PHEaCkZuP27Ceh6W58eufTgDysXW/ZhqK6/JqbYP4H5/RRrtV6tUprx6COiVWIzrfUGs6dZ3eH/nqZtVwnrAY55F9GSx4Akz2XdUeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7367.namprd11.prod.outlook.com (2603:10b6:208:421::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 17:47:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.033; Fri, 21 Jun 2024
 17:47:57 +0000
Date: Fri, 21 Jun 2024 17:47:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/huc: Use GT oriented error messages in xe_huc.c
Message-ID: <ZnW8qfILB4O6g4Ei@DUT025-TGLU.fm.intel.com>
References: <20240621172522.1037-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240621172522.1037-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0219.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: eb38ccb7-0b51-4c59-f550-08dc921a491f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iRGoeBEge8uAb0jp1WV1jMHOUtCCWX0ysMUrY/R7qjEbIab4EfiYFds4v9il?=
 =?us-ascii?Q?VML7sVynejNOjvAQ7F5E+ebJqaIcBM0Zrzfy9NVTqrtmB12IipehrCtc2QIN?=
 =?us-ascii?Q?SHBHITu6OUAM6n5vYLz5Kpq7GeMeU/83el3CebnaKCzfgL+vqLCEqP3kQpvP?=
 =?us-ascii?Q?/WK40Y3hrEZ7NRmKbIZDH/+Z35XYjzU3U9nB3VSPb1Nq0u0U2lsYlAbbrpQT?=
 =?us-ascii?Q?GSPHabiBYxPElw+CyZ3ZNbJ69wCyawylFuBt/M8f18BM/2XNL0sE86D4laHJ?=
 =?us-ascii?Q?XhBCWSQYnaUxRnH29i4A4z5wjr+R/tDOnzyQqPpxQ1vS2lw3ebtiP6+0S4T+?=
 =?us-ascii?Q?K0GY+4W3FX5t9TR0ppiguF7BRI+7nQie4dkeu4FYUIts1BmTd3ImrMO3xcec?=
 =?us-ascii?Q?mawJo6muw/jk7X1TEaunp4psEctDdHP1oyJtSddOGHAfHYoRqqZ5fmVnlpdK?=
 =?us-ascii?Q?B7q0yzGTcKG2oZOnaIyGNt3MoCxhaUgVhMhEt1UthLJJ/2f6ozz7pGr0cK8Q?=
 =?us-ascii?Q?w+f+bwHObp/CWidQ8R02IKZB3TGVXWB0UnCUIbWDg99Qm37LLwJOpUbXXc8V?=
 =?us-ascii?Q?3yecdcG/+08ZbGJprcdz98OPC1FBHrcf4eqVUIEadfzzR9aUvMWDF12py5Z0?=
 =?us-ascii?Q?WcqJHi14qUIXQEzH0MZRUJ+5skM9XiNeZL3Ez8wiAK2fX4rkwLInLNMIIXMN?=
 =?us-ascii?Q?HRgTcxiyn6wpZ04/BAgUBZkmEdOR2PSx8nTpuHABJLxTiwXiR7snlnsdQ4AC?=
 =?us-ascii?Q?HZIU6ngeDDFy4KyHOn5p6/C4Zya5pJN1P7nZXP4aJs/RMCsqs6K5KaKLhBra?=
 =?us-ascii?Q?hTcVjmIp+nX2K53jfzb+FARHVI25eNIo5fH4dLfdOduIeOjXdV83ACikpTYt?=
 =?us-ascii?Q?MbK9/U2r5G/E/EN4b70byeodKJ/PS6m8spzDQj9hizfY/QLuDN6dJqK4mEkd?=
 =?us-ascii?Q?gL2ZmjOMQTTauZawGQBbQuYCqFZA0gygoHSWhpCi9wx/hHcYenRd69/zYkKS?=
 =?us-ascii?Q?mJbd5CilOEb3lHb4HkprIrU60XuZIQOAaKzWETyPdBNuriAvL3kTr83RJlR+?=
 =?us-ascii?Q?qZR6BIR+OdmjQDuCQsM7yWRSTiL+rc+zA2C6Qc4AC9X4jIeQS7gIapglVpQ9?=
 =?us-ascii?Q?QuTK0Lsd2YqJy3WSdG5VaI7To0ERmXxkQ1///4X6EcnnD8zPO0+bgn3pP3lR?=
 =?us-ascii?Q?PRJOVxkX0VW/2veZF4EKqf5ooVGjVj2K3sk+px5nUtwhLUkt6MdplXHEo6fP?=
 =?us-ascii?Q?xN2vnRZeVH+YArie8jpQPXMu9QS8PulsC+Nu76ZVnC7HnLAj1p2iG55Uau3l?=
 =?us-ascii?Q?ybbl5X+XRnIo5LqkyIzCcQEz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lchfvYTWs0sXBRbhK6x4JLr8bw0OuEaxSZElZEnGj6WkZ79Je8r+TYkZ0ErC?=
 =?us-ascii?Q?LXTloEubPCSTzqy+FyS3u7KjFnpQSpn/QnkRTesRgDV4WL7gAba0uZkIm9at?=
 =?us-ascii?Q?6x5dd/sBaGhweHO2q32cMSRELUAd0plHiazNVHzL7TPoVBcXEKOnQ5UjFhpI?=
 =?us-ascii?Q?nxh5Mup/x1qUx5xZvIN7muQBUdmOuTb+NGpzZeZS+rMg20iHJBn/ClCkpmU7?=
 =?us-ascii?Q?R+U4irPwt2vsWY0UO+V8bQZxcOkliNy34J9QP+2ZS4gFnGy1B4JVV2lc+vw8?=
 =?us-ascii?Q?MJcrEv4Z9wNs8I6k2ID4wLfMV4vvwJMQGrZ6XesRjETO+B0PoCS8qltUarwt?=
 =?us-ascii?Q?pCZN0EFovcq2RPY+PYZ536lW476ammKOZ6GaQp5AT36K9lm3lzlzHNBgI9do?=
 =?us-ascii?Q?EHhbWtfhZHt/6PYd5RfY9chuLtbOPQ3ofhLPWfyw1Xu3ORx5wBefgdcWkL+Q?=
 =?us-ascii?Q?8U2a3j3Up+na4bNNSYPHLQENyoRjcwn4OEHGEXIZtNSZYRFHNJO0hbA1rrql?=
 =?us-ascii?Q?J7edXrjUboPcB8536hrovZM+EMW72Tm84IA1v2DyEFKyNP1LMN5iEnP1UJEX?=
 =?us-ascii?Q?GG0+pt5vdounfTa7mP195sHqD33sKNTWMioGs6E/XIO7mbE4dz0SpaUxefKU?=
 =?us-ascii?Q?F/2246/oVqWoo9CwLP3Z9/xZq9jn3PZopATf9P/2JuY/qvL2kWi/Rw2jVnqx?=
 =?us-ascii?Q?w5F4IhMd85yVP7E7/Viz13yGT94SyeEx6rNJASVcaiYNQG/lIL6CmX+ipRGk?=
 =?us-ascii?Q?4FI0KutBNQuMC571H+CJ9uIb9nboTa9soEPOEqG7XrSffFm+D5vk2ie43JZS?=
 =?us-ascii?Q?NOQ7RDGFJJOV9PXjK6jsDzLRL7VBEucYWA+R1UYXkeHB0TASmzp69uuPK/wZ?=
 =?us-ascii?Q?E0gU09gKFrC+5oBcUXZJA12gwu5cAka6eEnpQFgJE521KZqlO0UV35Woxuov?=
 =?us-ascii?Q?1oaEzIfzbnGHH+Cuou20gjnC1rT09RnOXFKucGfdL5QJiE8K1z4+NgpF8Rv4?=
 =?us-ascii?Q?bb/iKex6HxNeXTRzQ5iFgdSVkbgxurHbxLUlV5LixShpntoHtTctS/m9sp7j?=
 =?us-ascii?Q?6QCIuKiEqfnjCquce05MqUElxPvDdYAhLhmmujUsFnibC2cBdhet1shErkB/?=
 =?us-ascii?Q?mCY8H+JepEJ1241NxWxUeDoTQMTSs2YM805+sx3xpq9IDGCHxBSBOsiYKT6j?=
 =?us-ascii?Q?FnJ9Rv0nZRb1lXACjqAzbfI4xqMhwAKoF7w9tXAAj1Fe3Am1oCYhgGgoef8H?=
 =?us-ascii?Q?0AfP2Pdk+BzI3Bn/79FmmtNpEAsAgE94ELzGi1YqDPo/gtisbiWoz/aBmbKv?=
 =?us-ascii?Q?SszE0K8bwdg2PiVZ9MRId8Q7yNfcBWrO5YQjTt54Oa0p6cfzisNw8thledKb?=
 =?us-ascii?Q?tgO1Rjd9V7GaC2jtsQKUPMS2XmlbEgMrVC+yq+SwlZFUHqdWQ9QjHuHBPKot?=
 =?us-ascii?Q?+YcNVc9DVi8Od817CJTXE61jZ4e71ahqbL6YpzxVo9EarvhQUHw1x9rfotug?=
 =?us-ascii?Q?5+/JjGBLD3n1LPW2AEQVZnhDkDs7AA14NcNsiAxaSbhj7MkSDmWIUBQBLE3H?=
 =?us-ascii?Q?/b2ruLTmEeqk2PJOnWZ/xBbh5Iq4VwdJKdufNHAMMh13gdAkItMV6IEK9L+e?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb38ccb7-0b51-4c59-f550-08dc921a491f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 17:47:57.4622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zX14YDD7RIOXjS3FckJ0lsydo+XdTrWKuIsFe1cox2e3pv7zEbJseDiPXvvXvMz8FP+4WDosRVsD3zywoc26w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7367
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

On Fri, Jun 21, 2024 at 07:25:22PM +0200, Michal Wajdeczko wrote:
> If applicable, we prefer GT oriented dmesg messages. Update all
> HuC related messages and use more user friendly error codes.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_huc.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index c88761fe31c9..bec4366e5513 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -18,6 +18,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_gsc_submit.h"
>  #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>  #include "xe_guc.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> @@ -107,7 +108,7 @@ int xe_huc_init(struct xe_huc *huc)
>  	return 0;
>  
>  out:
> -	drm_err(&xe->drm, "HuC init failed with %d", ret);
> +	xe_gt_err(gt, "HuC: initialization failed: %pe\n", ERR_PTR(ret));

Why the ERR_PTR change? I think this make everything less clear. Or does
%pe convert this back to an easily readable value?

Matt

>  	return ret;
>  }
>  
> @@ -195,14 +196,14 @@ static int huc_auth_via_gsccs(struct xe_huc *huc)
>  	} while (--retry && err == -EBUSY);
>  
>  	if (err) {
> -		drm_err(&xe->drm, "failed to submit GSC request to auth: %d\n", err);
> +		xe_gt_err(gt, "HuC: failed to submit GSC request to auth: %pe\n", ERR_PTR(err));
>  		return err;
>  	}
>  
>  	err = xe_gsc_read_out_header(xe, &pkt->vmap, PXP43_HUC_AUTH_INOUT_SIZE,
>  				     sizeof(struct pxp43_huc_auth_out), &rd_offset);
>  	if (err) {
> -		drm_err(&xe->drm, "HuC: invalid GSC reply for auth (err=%d)\n", err);
> +		xe_gt_err(gt, "HuC: invalid GSC reply for auth: %pe\n", ERR_PTR(err));
>  		return err;
>  	}
>  
> @@ -213,7 +214,7 @@ static int huc_auth_via_gsccs(struct xe_huc *huc)
>  	 */
>  	out_status = huc_auth_msg_rd(xe, &pkt->vmap, rd_offset, header.status);
>  	if (out_status != PXP_STATUS_SUCCESS && out_status != PXP_STATUS_OP_NOT_PERMITTED) {
> -		drm_err(&xe->drm, "auth failed with GSC error = 0x%x\n", out_status);
> +		xe_gt_err(gt, "HuC: authentication failed with GSC error = %#x\n", out_status);
>  		return -EIO;
>  	}
>  
> @@ -242,7 +243,6 @@ bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type)
>  
>  int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
>  {
> -	struct xe_device *xe = huc_to_xe(huc);
>  	struct xe_gt *gt = huc_to_gt(huc);
>  	struct xe_guc *guc = huc_to_guc(huc);
>  	int ret;
> @@ -272,26 +272,26 @@ int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
>  		return -EINVAL;
>  	}
>  	if (ret) {
> -		drm_err(&xe->drm, "Failed to trigger HuC auth via %s: %d\n",
> -			huc_auth_modes[type].name, ret);
> +		xe_gt_err(gt, "HuC: failed to trigger auth via %s: %pe\n",
> +			  huc_auth_modes[type].name, ERR_PTR(ret));
>  		goto fail;
>  	}
>  
>  	ret = xe_mmio_wait32(gt, huc_auth_modes[type].reg, huc_auth_modes[type].val,
>  			     huc_auth_modes[type].val, 100000, NULL, false);
>  	if (ret) {
> -		drm_err(&xe->drm, "HuC: Firmware not verified %d\n", ret);
> +		xe_gt_err(gt, "HuC: firmware not verified: %pe\n", ERR_PTR(ret));
>  		goto fail;
>  	}
>  
>  	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
> -	drm_dbg(&xe->drm, "HuC authenticated via %s\n", huc_auth_modes[type].name);
> +	xe_gt_dbg(gt, "HuC: authenticated via %s\n", huc_auth_modes[type].name);
>  
>  	return 0;
>  
>  fail:
> -	drm_err(&xe->drm, "HuC: Auth via %s failed: %d\n",
> -		huc_auth_modes[type].name, ret);
> +	xe_gt_err(gt, "HuC: authentication via %s failed: %pe\n",
> +		  huc_auth_modes[type].name, ERR_PTR(ret));
>  	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
>  
>  	return ret;
> -- 
> 2.43.0
> 
