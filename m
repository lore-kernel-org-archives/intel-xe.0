Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BE7EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 15:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A10610E0F9;
	Fri, 14 Jul 2023 15:40:49 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4F310E0E7
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 15:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689349246; x=1720885246;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ibWOHeoV1nJvc3+8EjQ8JMxjEGt0zYhy2JHtYU74+IE=;
 b=j2KUGtZX1oScmfZwQnNk+1CyvuuvS8bnCjVy7Ak9GGZkpb687FEMes2L
 lpwFNFJZ5MDvlUiZ+ua0DZsJd6CcJ9nnoz3Q6ZGZoM1VzE9hFJbQ6cSja
 HobjzENp8t6mI6CSwv4Ne3Jg1JgqoTaWarC2ErXLrslkFGxOHvMdDx6q/
 V1Wtn+IA6uKixt363NoVeuncUtjkbBa6vnpZFV5gL7YeVa4/lTAh2DzYy
 d13Xr9VtvaYfwSouVfa9QQhv+13KB+flg85jzxQB9u60+1DQwcJWtvu8w
 QFDvGF1qySazLVyHk2vBo58EMGhANEwWAjvAI94kUBxSyMowOO9AfrdWV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="368142974"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="368142974"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 08:40:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="722442146"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="722442146"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 14 Jul 2023 08:40:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 08:40:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 08:40:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 08:40:44 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 08:40:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAG0Chy8vdegvGpPuzWY1MjdiXLfsO9iuSXoxm+ExtaHxCrSdWS1T18LihBfjjKHOvJweEd4SJxpEP7N03cD7kGVNZGc5KD6e27pwFsdrq6VE6T9rd3n+Ucuryye9ef8Dk9l3H6pPhhmqgmiT1cctyX8//iyHPoqfdDn318I3MwWMKD1YfdYkC2DNzTrwrpU1VlthjO6+hKRJR01L268O+Wt4h3J04LEiKj0CmmNwb5LBkPC+BaGzr7KMnBMIRA//ChDBt10VK6YI150BOqIyzBJuaBFqd38zqGOgA5lmhxWy8tiWGefH8Qy2kwPYtpF8Rrggh5VEC4vX4AOWQ7cyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=escULrrvhhAuiUVdC1Eqy3QoI4dOcaRczr/1DUYJ/qU=;
 b=ULiRDncPnNqCE6ctXuOztjusqfrh/fgyec4WI27ZxE+qLtTrmHFD7M1Dy8LJrTU33IrPBqjh1aOILR6Mv/fvwGlWokybs+R7ZB27RObyy7wBkaR/g9pHFCUQDRj0URgCypkKD/OFKos9s6VWetZAmdisFnS77CniTJ/piqinq1MpJOgpWoPy3vdu91ZgQUsvoQOnJd1qtBOtmusQ3aMHbInZhWXLC3ZYaHDCTuVjC/C49M1VMh7Tk9m+/5smeQ8Ago/smPeZ+0S6HOuF5zIsHASQsq2n3dNUMLI32y4EthbW52c3AnUvn/6OAH/Q7hMDxw+SZby5YEWMAmakAGkDIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 15:40:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Fri, 14 Jul 2023
 15:40:41 +0000
Date: Fri, 14 Jul 2023 11:40:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZLFsdTPheHDgkUgF@intel.com>
References: <20230713132244.459605-12-matthew.auld@intel.com>
 <20230713132244.459605-22-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230713132244.459605-22-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR06CA0036.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::49) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2e2a3a-49b0-44fd-8cb0-08db8480adb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fvyJKkmt/o+MUnldwdh6QGVZ1vsKvwYVm6k8v9vE+grLTeWNkRB1FK3iJyTYKxrgyrUO75nlRxj1fZ95JqPEpK/NsTOn6mSuCyro5Lq7H6l1iHCHLK6svpxaGzKLh8WtuWNQWxnG2612l0Fh1uIQu6qBCW6yLCRMtKAacbh6pzOkqrUvs2HVN4W3NGv29RMNw16ONqQ6P/wFRaEYUhOfBkxm3JtiqusVjpg2H1pTRmRNa4vqtMwv3JQrWwy3OSgCGsyXrIpG3UeTsqEi1Gs3wkWbAtx/M7GelULsPB2Ph525zEW11en/cZbmgrvmJfK1WQbeXk/kMqKsMcKGexekk6YnV/lmPsD6m7eSgjgYwfU/K3GGouU+l7aChLNQoofYWlG435shUbBrxT97YijX42tKGZ+/03xi+WWoG7k8btNd5TYqaPyJ+tE+noniwOEphxpXCC/rb19iAeyFbZtK3KSZtdqiutKf1pmsm5EsW6hgyHJ0m1qbsjOuOV+p2zhEaTVUIcmGgmtjaPuJJ7nv2ZICXSdqTsxBKSVc0rp/1uspAGRBRX2XRlIEGYpVw7IY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(8676002)(8936002)(6862004)(83380400001)(66574015)(36756003)(2616005)(2906002)(82960400001)(38100700002)(86362001)(26005)(5660300002)(44832011)(6506007)(186003)(316002)(6666004)(66946007)(66476007)(66556008)(6486002)(6636002)(6512007)(4326008)(41300700001)(478600001)(54906003)(37006003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SP29q2FH6fSCx64x80kUcFVKkQmJN9P63S/AlEGdRET2f4uOrA5yvP68p/?=
 =?iso-8859-1?Q?fOx3QNWn74tl4UNFIsG0ql1qNtRdh0ybs2rzmBELkvailtw0I0Wunc1FUq?=
 =?iso-8859-1?Q?GUXRVfYkR/YS3IiYRa87iKn630TD56az+9yE9/tzOEqtKWFqi8C7siKfV9?=
 =?iso-8859-1?Q?wSHGgttnTQGu2eZsUihH/4Ykg8ZKPL8zKHwFo0MNCHPvCSCzueYeLqu1XT?=
 =?iso-8859-1?Q?tYANZTT2b0fH45YueeAES3HsOQ4dxzmYTGYUp+j9minKioySRc1j75YPqo?=
 =?iso-8859-1?Q?PPMIkMadfMveJQOiLbacm+xMHcU4jgN0ft0d1F340VxIRO647U6B8nf31m?=
 =?iso-8859-1?Q?uEUYj4nc/pfUx2fiolEaNTIJuZhtCUvjcwAk6wgxtmc6gOLBo66QVZDC1i?=
 =?iso-8859-1?Q?CaPCq6cW1SoSo1vdK+gj5p65a1tepBAInZw0GH0iHuMS8J91fXW3VuJffR?=
 =?iso-8859-1?Q?X0aAApUO++eMPLJ1AMnuLLftZsXdaYf1SfoIWtnoYewIVrL7VPP/FSWkKz?=
 =?iso-8859-1?Q?DyubVtcdgTA7foVylkx0JsTw2trA+NtWdTz9pF4XTh6Mxr+mqAQwcD7Hel?=
 =?iso-8859-1?Q?25HxtZW6FQYfirGUN/RdjNx0pAMIv6ddhp/7B43QSP8bdi7f3eBaHgNItC?=
 =?iso-8859-1?Q?2RQ90KRgAnTH+4DtkGEPz+gym6DYWLdKymPMhuYf0IYWcLVXGDfSjjEaGl?=
 =?iso-8859-1?Q?m5bXJnMFbD9aN4BxVLm0baZfZIybyTgD3RKmkhdz3NGStnPHStYfBIrzwW?=
 =?iso-8859-1?Q?6nKWunT1HV6WskcfQKrErVlbSS/imZsjRlju27sFQKx+pTRraR2v+OT3gv?=
 =?iso-8859-1?Q?46dKCy/BvXCel4hOcpWikNgRaNvjiNKSFK7a5y9eTpcfnsgiwiyL2l5gt4?=
 =?iso-8859-1?Q?kYz84BoEXRAgkuzsFASSnEmMALMRGpjH4dTZsRa8pRgbPvYubxpIJthpFN?=
 =?iso-8859-1?Q?xiTdvn4EjYE/HfU4tdCkgaHjqwkcqvk+aAfR8Qrd0B5c3x5WXXyWkMLynQ?=
 =?iso-8859-1?Q?2iRKc4x5snMFakfLyTdrvmj6Urt27ZycvFSMEMbjUX3wilcqzps1IgCAej?=
 =?iso-8859-1?Q?XioOGjinsgz6Y/A8VQr8hk+kS0klNwurh0pkHhUhHuyntGUNvWb1aeAkQ9?=
 =?iso-8859-1?Q?jC8RMV/VOCW9a+B0Fu9x6Xgh64MnY4B1LG/FPXrcuGDX5J2DWAuuEG2WHc?=
 =?iso-8859-1?Q?t0w/5oAhfsqiHaZSQCNfRgdn0C/bqzCDvEuiJZhHZfnjndO1iXkD9lVwh9?=
 =?iso-8859-1?Q?wCAMdUM7GUtrYzChx0FdAHByXRdLabIDbRVbDUP+rL8OyTXkqWZISRIdPw?=
 =?iso-8859-1?Q?A/OXGK/oL2XAh380VRGVbrcwmK5s4fDkcRDebIGnsuX1GoVGPOyfzEaxFB?=
 =?iso-8859-1?Q?NWNG+KH9HHOMVl4of0k5qWIWRCD5obPnVCwS/tc9xWBU+FzzpLW2EstdDp?=
 =?iso-8859-1?Q?a393l35neVTqdnvs8+G25f4tcN8t5ivt4HJ4Wm8kML6BfOidyUz56he1ly?=
 =?iso-8859-1?Q?gWjMoyocMxK45GGArOt9DGiU+jkZ85m2ikDhDeEn3BkxzU48i2vKPgZfag?=
 =?iso-8859-1?Q?ZXbKXu2BOFUcc4INfOeBF7aagJXtl/IeDOOSU5+sgu/1gvBbz7HkP5MOzG?=
 =?iso-8859-1?Q?7pLQCuSnFCjaDcr5c0/sQJGSD/64LwVn5Fc/QIGIeSzXjHzcOCujxuRw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2e2a3a-49b0-44fd-8cb0-08db8480adb5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 15:40:41.0646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3aFYcMo1wo2A3BHTVdlcq+P9BhQtI30VgE0bdT/heaJJ4J5ahR1QA86nthjtZe8hVHHAfUd60L0aQlZ39zzSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v13 10/10] drm/xe: add lockdep annotation for
 xe_device_mem_access_get()
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 02:22:55PM +0100, Matthew Auld wrote:
> The atomics here might hide potential issues, also rpm core is not
> holding any lock when calling our rpm resume callback, so add a dummy lock
> with the idea that xe_pm_runtime_resume() is eventually going to be
> called when we are holding it. This only needs to happen once and then
> lockdep can validate all callers and their locks.
> 
> v2: (Thomas Hellström)
>  - Prefer static lockdep_map instead of full blown mutex.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 70f89869b8a6..7eb5d81b330c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -35,6 +35,12 @@
>  #include "xe_vm_madvise.h"
>  #include "xe_wait_user_fence.h"
>  
> +#ifdef CONFIG_LOCKDEP
> +static struct lockdep_map xe_device_mem_access_lockdep_map = {
> +	.name = "xe_device_mem_access_lockdep_map"
> +};
> +#endif
> +
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct xe_file *xef;
> @@ -458,9 +464,27 @@ void xe_device_mem_access_get(struct xe_device *xe)
>  	if (xe_pm_read_callback_task(xe) == current)
>  		return;
>  
> +	/*
> +	 * Since the resume here is synchronous it can be quite easy to deadlock
> +	 * if we are not careful. Also in practice it might be quite timing
> +	 * sensitive to ever see the 0 -> 1 transition with the callers locks
> +	 * held, so deadlocks might exist but are hard for lockdep to ever see.
> +	 * With this in mind, help lockdep learn about the potentially scary
> +	 * stuff that can happen inside the runtime_resume callback by acquiring
> +	 * a dummy lock (it doesn't protect anything and gets compiled out on
> +	 * non-debug builds).  Lockdep then only needs to see the
> +	 * mem_access_lockdep_map -> runtime_resume callback once, and then can
> +	 * hopefully validate all the (callers_locks) -> mem_access_lockdep_map.
> +	 * For example if the (callers_locks) are ever grabbed in the
> +	 * runtime_resume callback, lockdep should give us a nice splat.
> +	 */
> +	lock_map_acquire(&xe_device_mem_access_lockdep_map);
> +
>  	xe_pm_runtime_get(xe);
>  	ref = atomic_inc_return(&xe->mem_access.ref);
>  	XE_WARN_ON(atomic_read(&xe->mem_access.ref) == S32_MAX);
> +
> +	lock_map_release(&xe_device_mem_access_lockdep_map);
>  }
>  
>  void xe_device_mem_access_put(struct xe_device *xe)
> -- 
> 2.41.0
> 
