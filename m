Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B880FEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 08:13:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A86C10E63C;
	Fri, 23 Jun 2023 08:13:43 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD68210E632
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jun 2023 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687508020; x=1719044020;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zOHgifdPwBONLF/6RovNxbTbKY1+mf9pqTcfeVnnZ8I=;
 b=Rbv16nKj5ISuYrmREdMBVhGmP4gYed7fC+a5rgd+4XGM7okckVzlvSTH
 OstKaylHzfiy2mWxZra1YhQGpVYCfXl5NsGZP6mE1XFA7VjQtOn7b835f
 VnTENZDdUibsxVOwN+KpSPli/GpkSgL4lTXzDyLGb0AYIo66xyXd6jtvG
 BfvxAbPTIxF4XsWMDCupNRxgpglOoas6Nc7wDf7l+GPsOOQYoP98TaGXf
 lXJNRf9ZzFH+tzzn8bhn+aLZVDfB2foiYENIvYbq0l0X8XM78l/Axa4cu
 oHMKRtYnRjZ1JojuCvtr7Xj+RyWYVZZvUwOV44/QpWTFIGsV56VhutFfu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="350478756"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="350478756"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 01:13:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="805115159"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="805115159"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Jun 2023 01:13:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 23 Jun 2023 01:13:22 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 23 Jun 2023 01:13:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 23 Jun 2023 01:13:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 23 Jun 2023 01:13:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAdaVUrso6EfdYwM67QX8raHorpPZpFrygblmboA7d+mwosbFsic0Bfy/XvJs+brx2VAXhwBN7pVpUJFnuiTP1mpjwPuxIDUfcnO93rQAH3lIYEqPu7r/UgFSegoJbv6n74jfo+18WfoHxn75EWV/rIfD2s4O03ad5V1UErK4pkEvkw3S09DLw15ssE9plSdgt3QbuOkE9rtNCl3wBrom0DKo0kBEamT6dVe2Kfp8V4IEyR/veaK7Ymkv5cKXudwqdOxAd3QJn8YndPVRESSMr1V2oacEcP6Jmevx09E3Nd+24X+tQCO3sUZnDxlwNf432wp0uvl4GAnz8TrGBVZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5jStDVcxUpA9m9BHkuiZDpgK5+hR2Z64//GHQuOv2o=;
 b=iNYjBc0+xtVbCnunZ4sg172wHmRzFREgnaRXtecn/8z9ZDfFf0oVIpmAPBRCjU4KS/ew1YBPItE6uGmcDiNbzvMNJj840S329hFpYSbc1LpuFWTiqCfKPCZ3OGcGfOty5ojL+arYCCPLcQPBP5ACT3oo1RICLwMQmfdxoAb2y2Q9UOzQ0FPIwailrda0mjOSRhG3C0uyDgGXnE9qDOy/rsVvU4M3HyDai1OQBoW7QKQN/TjdLiBwQHfFyKcIyq94yYzOiaFkQ+rh7l4F4WugWrJ+2lXdHLHDfrDK/9TO1sSWq8E8PdB/APchQmP7hjJh79Qavz0Gik3MBQNaKHgGxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CY8PR11MB6820.namprd11.prod.outlook.com (2603:10b6:930:60::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 08:13:19 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d%5]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 08:13:19 +0000
Date: Fri, 23 Jun 2023 10:13:10 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <ZJVUFmRdK_yvGkIo@fdugast-desk.home>
References: <20230623043911.3783416-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230623043911.3783416-1-himal.prasad.ghimiray@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0221.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::17) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CY8PR11MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d644ae0-647c-42b7-9370-08db73c1b3cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W5MIA5YgK4i9bRtBB3M4R+MIWlojl82YT74Mb1KyWZmpCw7Jo2Di6MaUSEb2gPoNEhbzwDbHPwkg0iFfw1sLnWC/ZvbO7IRi7WJV91xStrNEpU7yQ6/28glDSXQA9YpN8xQR9QCl6eaahZJHh7jHercmV7gMnknqTfLwijFujbRusPXE9QF8KFqBloIJThm03hP7ylWSqPkTIVO6nJasiAbmZy1GygnLmDATArJCKdAYpW958wSTk3vSbhXWGp8nbqS9niGoth1aGk9yKa0yvBT/cbyS/99z/lrotzuCZEu31wqWXRimYUTNGPBr0gS7wvkHtoE9KY7dXO1R7gT9J5lYxprgkxM6sfqZibrGgPP+FRamE5sVaNCx2j83szFNTGcDWu6o79C/mBQo3T9HH0iCSwZY2+8pcyLph3ZwlEWEJf+mUBtDATFe9bm7vwLoiks685XrYxoXUj+oKmOY9dh2XKz1tTOs8My0e2Xy1VMCOLAZn+d83nEjVrl7ugvIbnvKNkje/uNEWAK7lS85Fq2WHTGLFfaV7KA/rnRiS04LadRU2TyP7VidhqdGED8E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199021)(66946007)(4326008)(6636002)(6862004)(66476007)(8936002)(8676002)(66556008)(478600001)(36756003)(316002)(5660300002)(44832011)(54906003)(41300700001)(86362001)(36916002)(6486002)(2906002)(9686003)(186003)(26005)(6512007)(6506007)(82960400001)(6666004)(38100700002)(107886003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6w1PVwBPmztZaHgETPzi6VDWY2Gj0D+outuZd7Qt33XpLnhuHUVGGyGSpgmt?=
 =?us-ascii?Q?qkVM8xU2clL5icTJ5X/tvhxtQX8nrRcie6XHhqELnAu8QxUHKkmAxMOTIN25?=
 =?us-ascii?Q?K132TLGfxErRbGNnLsIdlj+2m/ceXMOYqpCSs8IVgmawt+XyfuZ9qZ1v3UDm?=
 =?us-ascii?Q?IanubHiaF8W+lv0M4F8sxV8ooEwXKDRNqwonF2RgaaZqjjrHIloRbdiBqFNV?=
 =?us-ascii?Q?o+i8bCgziSTpJVpJoo1bVlVmIIryLKGV4UCHS5gGjt3o44DRCl075y7ZLJ3E?=
 =?us-ascii?Q?vPNbX+txbxiADpCE4vMr2taS8C8WDA5iBffWdFksTPN8KnQCU6SOLDz9hrkq?=
 =?us-ascii?Q?xbJkJYBpt8i91J5WKN0Tgz9FmJcBjxirompLlMVJn1M9lKQLuSpPf+gXb0Fo?=
 =?us-ascii?Q?n12dDN0dCefoZBxuSoUT4ZOVB+QWXLQMNvorAAMjQMsYHQeT4pGI6HCSSE+u?=
 =?us-ascii?Q?r1Q3aTrxR7nKneDKXkDBFDFsHqQaLcE5adaVVa5u1HBqzeRx3YoRl/p4AXJm?=
 =?us-ascii?Q?/S/amYhhoDIZyZXjFhLnZGdIHL1+OaTVemmnGp8NBrMYnw/15FBYxWlC5Qwj?=
 =?us-ascii?Q?XvM1/DY3hycP9UL/3HLg02OM4d2+A5Rqjo+quSH5qBdL6tN2NW0oGnp4fSGd?=
 =?us-ascii?Q?qkfyAu0omKslYG+k4+ThjogP07RJ11Qti4GPDc5GLYxWl28xn1vCHxWuUaJ2?=
 =?us-ascii?Q?MBkcuC3glpJjEvNtZvLURRojCTu5eBHgUEJiBq+rxY1tD4Kyej5tN1kC3tY9?=
 =?us-ascii?Q?hPya/ab/TIQim4gUZR+yE0tBu21QMBEkm23qXynR8MnHPmm/H5FqzrPBSz00?=
 =?us-ascii?Q?YuU+Xejew76qhCxYaqTSMIwl0tkBeAHRI/spjxhirrkWamHDuWg1B1LFUZlW?=
 =?us-ascii?Q?K8Vc/433mpyctkYJKLsH9aMdqj+fyGpZVMuLE7ubXQQbDcwWvgmppNQybruE?=
 =?us-ascii?Q?5Bg2yVwTZ0gX4kOyCfSWky2RNJf4mu6ItAb0v0G1YEX1bugyxsDP0tsjA/+r?=
 =?us-ascii?Q?lPvLdQKDNo7vetHJwdQDSSolexd9NyAO62Gdt3gV/ZJhd13vM9+hXFj63s3J?=
 =?us-ascii?Q?+JGLreKUDjUk7qm3X9FtodaGR8KVnKiuuGlogUQ+ByZTm5bLJ0VJuwRVu9g0?=
 =?us-ascii?Q?oS5urXTb7X5l8yrJ+mHuC9nd5SBQBV2yV7DNp9ckM4P7tSVF9n4zTIVeVoMb?=
 =?us-ascii?Q?JFnNKBN1VndLQYNBFcRrSdB8m5Xoot4Kgkbi0BeFtMoi14WiIbvi4qD+U1Eo?=
 =?us-ascii?Q?eNJvORg1EM3aFTuPq/EfoMD7p4ce1p5aPghzx1ZcvqDbYLZHZ5UrqL+lQPQ6?=
 =?us-ascii?Q?4I7mzXa+OF90qZ+BfGkz3tIRvVaLzLOarZ2qX2QknM6i5gRx+49Eg7p8lDpG?=
 =?us-ascii?Q?xJQqw/VOfm5QTR92A9z/tbQ+pEoLa0AesIhAw97bMlmeEEZx8rrCtlVDTQZY?=
 =?us-ascii?Q?7qOdoEMnBMLJVFCCtMGJmwoZG6y7Gwao/FxFRZWzT36OaImgXu65pzj0/UvK?=
 =?us-ascii?Q?HqYW+y9tA/RziF6p1nFbwT6dFPOo0a0CSB74IAAiDF6A5OnMQkahlaOg7BvW?=
 =?us-ascii?Q?Q++reM18Ic1MuokEo1hxcZU9aPE69A6ou0Gzt5uKSAqlSoAz4hgOqimutLi5?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d644ae0-647c-42b7-9370-08db73c1b3cb
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 08:13:18.8700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPbRSCgHokAHJMDvIbVF/jbVU+/YqomZKC78rc5/Onbn1LWbnHvziYcwlKg7TgG6VK2TFF125QugZNhgs4eE+XXmzKIyK9PZxKbSCedf9ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6820
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 1/1] drm/xe: Add a debugfs for faking gt
 reset failure.
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 10:09:11AM +0530, Himal Prasad Ghimiray wrote:
> In case of gt reset failure, KMD notifies userspace about failure
> via uevent. To validate this notification we need to ensure gt
> reset fails and there is no mechanism to cause failure from hardware.
> Hence added a debugfs which will cause fake reset failure.
> 
> v1(Rodrigo)
> - Change the variable to fake_reset_failure_in_progress.
> - Drop usage of READ_ONCE and WRITE_ONCE.
> - Follow consistency for variable assignment. Either use
>   functions for all the assignments or don't use for any.
> 
> v2
> - Add description for variable.
> - Define xe_fake_reset(gt) function in xe_gt.c to set the
>   fake_reset_failure_in_progress.
> - No need to explicitly initialize the fake_reset_failure_in_progress
>   as false. (Rodrigo)
> - Return proper error code in case of fake reset. (Bala)
> 
> v3
> - Move gt reset worker call to xe_fake_reset(gt) which ensures
> fake reset goes through even in GT suspend state. (Aravind)
> 
> v4
> -Clear whitespaces.
> 
> v5
> - goto label changed from err_cancelled to err_fail.
> - Remove unwanted declaration from xe_gt.h. (Francois)
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c         | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h         |  1 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  9 +++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  5 +++++
>  4 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 2458397ce8af..445a27ff0d04 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -497,10 +497,24 @@ static int do_gt_restart(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +void xe_gt_fake_reset(struct xe_gt *gt)
> +{
> +	gt->reset.fake_reset_failure_in_progress = true;
> +	xe_gt_info(gt, "Fake reset queued\n");
> +	queue_work(gt->ordered_wq, &gt->reset.worker);
> +}
> +
>  static int gt_reset(struct xe_gt *gt)
>  {
>  	int err;
>  
> +	if (gt->reset.fake_reset_failure_in_progress) {
> +		err = -ECANCELED;
> +		xe_gt_info(gt, "Fake GT reset failure is in progress\n");
> +		gt->reset.fake_reset_failure_in_progress = false;
> +		goto err_fail;
> +	}
> +
>  	/* We only support GT resets with GuC submission */
>  	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
>  		return -ENODEV;
> @@ -543,6 +557,7 @@ static int gt_reset(struct xe_gt *gt)
>  err_msg:
>  	XE_WARN_ON(xe_uc_start(&gt->uc));
>  	xe_device_mem_access_put(gt_to_xe(gt));
> +err_fail:
>  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>  
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 21d9044088de..60382efcbb16 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -24,6 +24,7 @@ void xe_gt_suspend_prepare(struct xe_gt *gt);
>  int xe_gt_suspend(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
> +void xe_gt_fake_reset(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index b5a5538ae630..8d888153c477 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -138,6 +138,14 @@ static int workarounds(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int fake_reset_failure(struct seq_file *m, void *data)
> +{
> +	struct xe_gt *gt = node_to_gt(m->private);
> +
> +	xe_gt_fake_reset(gt);
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"hw_engines", hw_engines, 0},
>  	{"force_reset", force_reset, 0},
> @@ -147,6 +155,7 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"ggtt", ggtt, 0},
>  	{"register-save-restore", register_save_restore, 0},
>  	{"workarounds", workarounds, 0},
> +	{"fake_reset_failure", fake_reset_failure, 0},
>  };
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 99ab7ec99ccd..0b6e1df3ca36 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -141,6 +141,11 @@ struct xe_gt {
>  
>  	/** @reset: state for GT resets */
>  	struct {
> +		/**
> +		 * @fake_reset_failure_in_progress: A bool to indicate a fake reset
> +		 * failure has been triggered
> +		 */
> +		bool fake_reset_failure_in_progress;
>  		/**
>  		 * @worker: work so GT resets can done async allowing to reset
>  		 * code to safely flush all code paths
> -- 
> 2.25.1
> 
