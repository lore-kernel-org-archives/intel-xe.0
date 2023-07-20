Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4279EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 16:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604CE10E5E4;
	Thu, 20 Jul 2023 16:29:57 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2F710E5E4
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 16:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689870596; x=1721406596;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=raJYlbAi2p3mmF2N+O6c79wqZJd70c6JHqWUz2ar+Rs=;
 b=FYvPLXgOFwxinLrDAoOUMLYsBCMNQ31MBFtZkUDlbltcNMA2F69NlEUc
 h6+pLURVT0KQ/SaOybU8DVgK0GmPzOtT7tNsnM2o4dNBCeUXXp/aw+xL9
 2yxYqcDFkPfNrPF39HOR98//hUh5Ol+V1KsxZp8anH6+mEtptipx43Fk3
 TvlEjtCBo2Thh2C32YBPcKdlq7cwscGyJWwD7HAOzEGhDoILUHimeCgAC
 SZPHvsq2g4rt7mRekbmWpsXFJvhBECDgPnh+bfT5FBPT776WPfLIkTzZD
 BrczOuavzmHhRkYUiC2Vpo0tm6WYebFILqIUBnitRD+qv6tIBOMys7sun A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="430587113"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="430587113"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 09:29:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814594510"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="814594510"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2023 09:29:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 09:29:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 09:29:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 09:29:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 09:28:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQOYyCam0Ylb6Vb0gxkrymWRg1enUE0/h3n/NIJp8C0u5rJOqfvHZDvNmUFHIBjZkRFucjqEvjvxzyoSAThqhjmwLItgYfzJm0rgZZpPbFrhLCxLnyuwcGG+O/hllWCD285nho/1Wn9xr5Wf1ItyPiAYzNmiCHfQnhEXZwQ6pcpF907lerfY1K8KpG4VdQWrrKXfXHmQCCujw6g5VBn1Uaz/tdyBFi50VE0juxc0h/pfaExnF3fINBSk787AAVMtSxh2yAooA3grBl7/sM5q76Emz+qFGu5a3pTF9MWHw3tfGu803AiBinxwyPgV7KkX/z1gnCkgjOjAlgo34LmOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztrEZP6XKwM1rM+OaPIAfR/DBGef/t1C+gVNAdzMIYM=;
 b=DTt+GavDlG3T6IZky5FjvIQf9Xlw4/kkP91rhINZpG1oUR1CWXvH7Lrj9K7fG8HDWhOAYNxn2bklFbTAN/Jk0LvsZINJ6ycG/c5FLE2+twceLVQx26WCfHDPpjHdq00CrPYjbp6PyRRgJ9FwqWGi8dqo0MerZ+SM9tRwKMTi8g8a6xsJ0cvWi/s40PdleXLXD5Z+WdiRuscrk/Rmy2yfbJK0P48yil/ZZTmsLld37RnLHBazYTVKzc2IZCncn0+S8mstuiel3ABg3kcg107LtCQs0UaC0Lh6aYapJzakVWfoO6PqjRH48XU987xrhcdivuLLUon56AvsApiOGBsJrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYXPR11MB8710.namprd11.prod.outlook.com (2603:10b6:930:da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 16:28:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 16:28:57 +0000
Date: Thu, 20 Jul 2023 12:28:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <ZLlgw5A0DebwmGqv@intel.com>
References: <20230718133216.3079521-1-himal.prasad.ghimiray@intel.com>
 <20230718133216.3079521-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230718133216.3079521-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:a03:40::49) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYXPR11MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 320e037e-76f2-453c-b8be-08db893e69a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cPnJ/eVV+lZXmrGysXe+rbHV0vKDQ2el3U8ZBCPWy0RaHYJoeYd6SeYNbmTqE0VOcvqVYCPJwyMWF2bidi50Hil5RlqyBAKuHOK+EH3cfAcownOtKHwjuuSk1TVXSVfjbJVKCb7Dko7Nn9LZygV5dWyx7g4WhTi/tTaomLSpXnT3CFaBYJ1yUPgbMG3TSIECm9qeQP/iaBFZUX6SbXksy7GD4uFsU4uIJ9J2+S3vZsdxcR4daHzbGjBuzq13s9Uj8KZIv53ylA+gXgiwjQZp4ujfQrk2BGGa5s+DC9KRj55S8aP7PS7H4dz0TA/QAAPIMDdt2jXbbiM0nScNiMFvMgpstHdpgVGlUygNNHa5VBYBQJHqXXjAX/IJwUBnNAuiGD0Onmhc5Pn2zT1Cv/L0/AKu/S3BnkdKJQ3eq2Sh24aLmzO2Me7DyfctEKdBmCu6yh7ZeEFwi7Z8BDB8CK/2HW1qUXx1Alxs52Rp+wp0WUIjE1s1NTGPcYJ4orp31zrEdu6FgG+TxydP5V33XZXwGuaB/li5Cj7bufdelbbU0iyzj9tCDySt5gImvn4dAKf1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199021)(2906002)(83380400001)(2616005)(86362001)(36756003)(82960400001)(38100700002)(41300700001)(6506007)(107886003)(6486002)(6666004)(6512007)(66476007)(66556008)(66946007)(316002)(4326008)(6636002)(186003)(26005)(478600001)(8936002)(8676002)(6862004)(37006003)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JTdcrFH0BdiPhWtYqiZyxrTu7aGxhUs75pAubqtBUdfaGvl85u85nn9L/gIU?=
 =?us-ascii?Q?Q3ePmwNX8F1rTPqLPl1q7i7fV5+ej2uYGQOtNsePNe8A6yUeD9Zzmz81Qx3h?=
 =?us-ascii?Q?ZVM1qidKnDu0YofqySR5zFOjsPAaWXibNTXyaGTBeVCVMKl9lHh1TNEW/xAq?=
 =?us-ascii?Q?6GScI8jUxAXyGnBt5/Bx6hyAt2QwlTMZm6cpYicW8sXXrOGUY32JPDMXfWvl?=
 =?us-ascii?Q?Bupx/3KtOyE2RhiMJCKHrCqz34XK01xxlEAFPizoZW00dKmJH76Ko5B3Hejr?=
 =?us-ascii?Q?dVZi3Zh0W8YGktpLpp5yFDjlEHiVjznZzSEyXca03HWLI46y/UbFdK235df7?=
 =?us-ascii?Q?xJz6DX1RH7dmksdBgr3iHOvhGH6TBjFxDuqYdDoDjR0b+uDeGQn60tD8dKZZ?=
 =?us-ascii?Q?aDPXCj1crKj1gQgql74M+zPn0u33TRYk6+DuELveHqlvm0F5yTldoNcN/dzN?=
 =?us-ascii?Q?ctkrvw09GsDic4Qs/3bnXSa0YF94I6pYLiz3VcCB7VUBSiNTU/Nv3soaiene?=
 =?us-ascii?Q?Gv35v3m8z5ym5G3JHXX05phb6oDYwBneZHI7X1f6HdAaBQvNANPaf19bQJN0?=
 =?us-ascii?Q?1qod+yyHbHOJyaYP8FNOoKfpOI7eKSD38vNxLzcAiysltG613pI/0B1KNO+q?=
 =?us-ascii?Q?058Pur5zXD/AAv3vCJ+KNYHAWiA5rCFLNmyBQCwNT2ke57mQTLBf/2jluyZs?=
 =?us-ascii?Q?vD1gT4PBT1KQAUI9X4oW6PMhYnEcrD0+KAoAohnSSobZUSQXPfqeYhuyxKDM?=
 =?us-ascii?Q?tFIjZzlzkjHebm3anTtbfbKkUsfbtLoKtNPKE73QPi+ojS5wgMYbSiBeB3l0?=
 =?us-ascii?Q?HWcZ1dJqxa8lL4JpuqT0U39Ww2C2ZdoiQCTONoVIF8eSEZ0dLslh24irbWHt?=
 =?us-ascii?Q?1JNxW6GY0nrD/oeUgXPU6dJQVwDPeZHREo2M81L0+dqfpn7mHQUgEHq9ux8U?=
 =?us-ascii?Q?stoFiqMYxrW11Vs6WINLbYLYtcvuufMmBnUNJwbCrbn9QkIKQGVOMTcgzQUx?=
 =?us-ascii?Q?cHSL5J9HUeahY+9wqwDH30MMQzHD2W8ssFNOiuo+dbr52l/pPJlEX3YIOu+g?=
 =?us-ascii?Q?QYbLsBKbnqWGRmsSsW920tJRDQug+J8NyapumAOSR6a1zICVKDFYf/xP8CFc?=
 =?us-ascii?Q?veCQCvbqW1i0cXIarb5uYJ3wFSYBFz75Vs6FxbGikq7uW7yGO36ThZFK/f6O?=
 =?us-ascii?Q?QBymTEIjr+ZLuekK20uKlvSqi1d+QGHk8OxAgljDRaE1nL0Jteup+eGvDwmu?=
 =?us-ascii?Q?0d0CRepHjmjac+plmc3grrq7yRUWcpHmBWZ2VRPPTdGYgRZMf1dxh773iwoj?=
 =?us-ascii?Q?WNTUmGjR+N40jGqMIYlw+rw0QvCKo9KcBGYUIdv5XihrVZ8Izl6xp/Yon4Ii?=
 =?us-ascii?Q?BYyDFlxDLTmY02xsQCMXPjQyRkoew3pXsbYA9GL81OtcS3AerojNELeP4YAU?=
 =?us-ascii?Q?dGH0LvoQ1wvkq8swysKigf/yfCrFA6iUQOTdcVB7n8SFOOO6s9IJvl2jgnZl?=
 =?us-ascii?Q?mvjEEsBi4gffNijZCKkSdUwer7rPXcDoNbzhN2Ig2dnVFgdd974vX6LQ+rmg?=
 =?us-ascii?Q?7ueNjLByT/OlBOILuF+tN+tJoVIzJTC/SW/2RKFns3Q16M1vznRI7fkXcMmb?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 320e037e-76f2-453c-b8be-08db893e69a8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 16:28:57.1099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOFJ9vmzMUAB2i5vYE9GBkCQ7kuJEHj0ZID5TXnX7Z/MKC6lxYrYprQm9930C2gjrYazSqp/mMW/4zFHNRyUtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8710
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 2/2] drm/xe: Introduce fault injection for
 gt reset
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 07:02:16PM +0530, Himal Prasad Ghimiray wrote:
> To trigger gt reset failure:
>  echo 100 >  /sys/kernel/debug/dri/<cardX>/fail_gt_reset/probability
>  echo 2 >  /sys/kernel/debug/dri/<cardX>/fail_gt_reset/times

why 2 and not 1?

anyway, neat solution!

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_gt.c      |  8 +++++++-
>  drivers/gpu/drm/xe/xe_gt.h      | 14 ++++++++++++++
>  3 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 7827a785b020..08d5bdf4cf61 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_debugfs.h"
>  
> +#include <linux/fault-inject.h>
>  #include <linux/string_helpers.h>
>  
>  #include <drm/drm_debugfs.h>
> @@ -20,6 +21,10 @@
>  #include "xe_vm.h"
>  #endif
>  
> +#ifdef CONFIG_FAULT_INJECTION
> +DECLARE_FAULT_ATTR(gt_reset_failure);
> +#endif
> +
>  static struct xe_device *node_to_xe(struct drm_info_node *node)
>  {
>  	return to_xe_device(node->minor->dev);
> @@ -131,4 +136,9 @@ void xe_debugfs_register(struct xe_device *xe)
>  
>  	for_each_gt(gt, xe, id)
>  		xe_gt_debugfs_register(gt);
> +
> +#ifdef CONFIG_FAULT_INJECTION
> +	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> +#endif
> +
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 1db4d610f2fd..370d4b96e616 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -525,6 +525,11 @@ static int gt_reset(struct xe_gt *gt)
>  
>  	xe_gt_info(gt, "reset started\n");
>  
> +	if (xe_fault_inject_gt_reset()) {
> +		err = -ECANCELED;
> +		goto err_fail;
> +	}
> +
>  	xe_gt_sanitize(gt);
>  
>  	xe_device_mem_access_get(gt_to_xe(gt));
> @@ -562,6 +567,7 @@ static int gt_reset(struct xe_gt *gt)
>  err_msg:
>  	XE_WARN_ON(xe_uc_start(&gt->uc));
>  	xe_device_mem_access_put(gt_to_xe(gt));
> +err_fail:
>  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>  
>  	/* Notify userspace about gt reset failure */
> @@ -582,7 +588,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>  	xe_gt_info(gt, "trying reset\n");
>  
>  	/* Don't do a reset while one is already in flight */
> -	if (xe_uc_reset_prepare(&gt->uc))
> +	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>  		return;
>  
>  	xe_gt_info(gt, "reset queued\n");
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 7298653a73de..caded203a8a0 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_H_
>  
>  #include <drm/drm_util.h>
> +#include <linux/fault-inject.h>
>  
>  #include "xe_device_types.h"
>  #include "xe_hw_engine.h"
> @@ -16,6 +17,19 @@
>  		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
>  			  xe_hw_engine_is_valid((hwe__)))
>  
> +#ifdef CONFIG_FAULT_INJECTION
> +extern struct fault_attr gt_reset_failure;
> +static inline bool xe_fault_inject_gt_reset(void)
> +{
> +	return should_fail(&gt_reset_failure, 1);
> +}
> +#else
> +static inline bool xe_fault_inject_gt_reset(void)
> +{
> +	return false;
> +}
> +#endif
> +
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>  int xe_gt_init_early(struct xe_gt *gt);
>  int xe_gt_init(struct xe_gt *gt);
> -- 
> 2.25.1
> 
