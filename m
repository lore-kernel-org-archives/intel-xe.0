Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05960C35274
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 19:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9235110E6EF;
	Thu, 21 Dec 2023 19:00:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6565810E6EF
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 19:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703185202; x=1734721202;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ghr0ZfQgTdkWk6Mj4gL2Bo8GV8NJf7vTHV9NMpVeOAA=;
 b=Toef1q5mzhg+rD/ZTXp1MiwNWzXwWqJpcnYnEF8XSn6fdBN+wPUlka75
 NR4U29ZnGcoj0KFFJ5Ka91oomSj4p8z3AQzs/GgHU08tJl2TQHIPJd7Jl
 U24ybtJRE51MKcUUdc4rx4U8Fzzu5fc7C8Ys66VsI5qot91pI7252aGHo
 eI1LuvyuhNBfu79e0uKYHkDzlLdaVbVTw59BUvQc3iKbK3w/iRJIn8mFy
 mDTZLzWAO5TwK+XyrQf2NnKwkT4iuX9mzZ58JBWvfwdut37cjVeraZPm+
 XemdzgZpKgPQYPmcX73qFDwSbfu6wIo28JkYXRzCKI7/seGa8Z8f8cq5S Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="2869255"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="2869255"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 11:00:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="900183133"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="900183133"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Dec 2023 11:00:01 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 11:00:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 11:00:00 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 11:00:00 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 11:00:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGdB7uoByPdm/hokxStKnxur5dg/Vge6NNxNIf5U9/TEUOqfBjGawSzNcIY2y/4mL7aKNezY/mUb5C+VgMEbLra1ZqGLRc/pFaPpRAjb3A7Evr9qfNZTNjKwC5NELNVwCbEoTWeYVuKE5vAYdMlmIWLwtjIHrYKNm6ORww4tDCp3CW+Gg2T2ruF0ueCmlyz6hun3/AAe020379SLMr8QfiQliiW6b4SigiCJvkGcmupgyV3KeuL722eRfVMXX7wSNLWPz5Uxwk0+1JmMZcwMOVD8rzbfr5MMFHqgYVdlwHHl5/AZlmbTRTCiERf/LCGen4+ak1zenvP5XXt6Bb6Vog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4oulz2Nu4Es+t9NVpX7G99gRW2Zr90OEvwCriuQZlM=;
 b=k9XYgN5x/oNirS3uj4alBZVakS/FQE3dQOAa5lkrzz510+uyYBEW+QPW6Ni2aRuY7/nMn5f3ltzaY7fGkxy1NbOhDDlwMbPsacI1jPw55zOr2eK1n578EBJWUirErNAMkCHgstIZgQnDw/Nrx6LuFXyPcNU+uEec1cICy3L0G18ksYwcFCyE3YlB1SekUYwaEwE0Jy/vOcB+QS0CCsyd8Awu6DO7t6b2tZAzdBnuf5FNFA8TsPel+b2MU1zjMZ10NhGJ2yLuXSKhdeK3lOCNcUznwJ1n7oBPfnsXY+1Cj1dJHtZnI+zv1EJaU6bOSsgHilfBL6iAeFy2dsIOqGi5GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6151.namprd11.prod.outlook.com (2603:10b6:8:9c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Thu, 21 Dec
 2023 18:59:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 18:59:58 +0000
Date: Thu, 21 Dec 2023 18:59:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH] drm/xe: Make sysfs gt force reset synchronous
Message-ID: <ZYSK9V8Q3kWVg8nu@DUT025-TGLU.fm.intel.com>
References: <20231221171641.3336898-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231221171641.3336898-1-karthik.poosa@intel.com>
X-ClientProxiedBy: BYAPR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:a03:100::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: 612548a6-dc2a-4f37-8961-08dc0257068f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ot5jgMRZV4ICSJ/yUQjz0xd3K0voIOuQEcTyR/A3TBFTSLq7aj9YV50XiUbj9uHjMwpwemB1D03l3wohYPXI48RzDt4Nbxvy5OV3LwQjteCWyt+ACyuqYRP+9SBy1g0L79UMCxEEuTZ4sn6eM2zCXCYySVngun+P1QdqCeCrzWXLxILOU/1qwD/KQtdjgTDX76fwKD/d3XBqFvfTtTunWHCmYnEcJFoMhhmzqRYEzpR/y1WjEMiFDOeLUVlOqGsf3Va2xw0Y8WKqPfIqmRVhobX5Z8kgnnT3eF4UCXNB6YP0Ynpn4Q63UAAvhByEnxdEzngvZem/jIKhMKv2QzNBfxHgQd2GroyNzA6gZF3WCyFY6ww4DHhDM18TAP6wzgvu/Ap9J7PbzMS3QClh/F1Dcu8qyHfyu3js+qAicGsPKp8imvhL1pGETY+OiL/9BHUZeUK0M5RWz5kraRAjy0CcZRG5M790G1GLKwvTAnNA1+gc9+FmQzP6zoM033GQYnICZNb7OPUWxBUnF0AadZ+M6LC0+eLk46NdhBi9eFg73nIGA9haJ/IR4EFPSjDXwCYe6breZyYYCEoC50PnLaHE4TinCdLBMWz5sOdNLFMJa6c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(136003)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6506007)(26005)(6512007)(6666004)(107886003)(86362001)(38100700002)(82960400001)(8936002)(44832011)(8676002)(41300700001)(83380400001)(6862004)(4326008)(5660300002)(66556008)(6636002)(2906002)(66946007)(66476007)(316002)(478600001)(6486002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZinG35gnnbPSntC2qoC3kSVv6Ezkq3Dbuyq0EnwEx0aH5KZXH6el3GVbRfq3?=
 =?us-ascii?Q?EOMHnjysYRt/a5zf4sVm5C7VMRdcOz9U9byD7sl46kl88vemeW1Ultm46KpC?=
 =?us-ascii?Q?gJ5kmg6sNqCaqcpC/ZwVWrdZiN/KZmnieLqfnrp/UVdgaDdRUjahocIhNbk9?=
 =?us-ascii?Q?mQbvof2/dL7hjUYKYYfy4GP6JUMNwbb0KsSbf/kX7e5+iZC5CbcNu6rFavd/?=
 =?us-ascii?Q?0HuyuKA3p+vVv4+mWO/GTJBBu0s0g9KKTPLG+EudZ6ralyUnUjZR9pXwcEAW?=
 =?us-ascii?Q?7zpVyDWk7zWDIg+HJuVpDwzRS9rqBYKmuIUerw3OEiEGP13JJ571pKC7a53O?=
 =?us-ascii?Q?72ZfrnjJ3EYaT6YbuYLyc4y3hX760te8avMMsC3U2bYvEwmcnISkV1Htnjdz?=
 =?us-ascii?Q?S5n2MGAXmWpK9Ux+GQuMan36ou+rWJLTIfc90eq+5uHp4MOI4ipkRF3HbEoC?=
 =?us-ascii?Q?yB4qyxP07aQMmCJS7BVox09vhb5FEMNPf3lmUvmXmEEJgWkuZrsAIkhVWCDf?=
 =?us-ascii?Q?yycXY+XETok+iz12HECK3sfQkSDuJjEvhg0Xc7y3KUAGE8rFNDyT7j8DOVjP?=
 =?us-ascii?Q?+PcUJQGvvIzZHzsNyMrKclqJHHx+gS4m3HLDlm6J5u84m/uz0dmxxnNTjSj3?=
 =?us-ascii?Q?IaT197wB0iOyNoRmyqnU7nHqwPCCxaleCQKt8W1Z4bbYv2G5ozKTos96IoHT?=
 =?us-ascii?Q?deVwwOlke0FBjA8/7t0AUu70/oL2t0yBIQihaZq85ODCw+3JVztnuRKJ59uX?=
 =?us-ascii?Q?QjQrGgcuhUk5Pui4U4VBhByqftcR9UuuKZUYecnnbwHmzwMYgjl094ggcJQ9?=
 =?us-ascii?Q?0kydfuBGYF5inOefiWrbGz7B/UqLeLZ4OJzlcmGmleNAdydRdKq7tadteXWt?=
 =?us-ascii?Q?kpETj+a/HTZHwaZvdmuEZAvcH/lgiCKIiip5Od2fsv1DwGzrRWW7F1zN/2Z8?=
 =?us-ascii?Q?7gg86Iokr2n12K5682atVBNRlWV0moYqe5Llc1xPMN8kYVzg9jxr1s5AsdR5?=
 =?us-ascii?Q?TPC+gphAI+wJEM+Z8XJz36MIIL0mVx1ECzDrJ5rTRxyWcJTJGDZTU/Jb8MDx?=
 =?us-ascii?Q?t6TFlr4WxFtXiyM2kwTJD6DpI9f+1t+a9xPpB0y//pq7Gqenf0lSKby/HaD/?=
 =?us-ascii?Q?JZy5PXMZGubNXXk2rC+QCExs1TQ6LE4Lh3z/8BjvKaiDKNh8apWn/WFFsvGE?=
 =?us-ascii?Q?Auc4neQBhTAw5YhR+sIX0zQoFrKEpsAXvnyMf45IKx1qIqXKqD80B63DOqcP?=
 =?us-ascii?Q?U6N/tic5HDaDStfFRMno0m1w4qgsoXTBMEJgIiHLHjc0fRAOc9jBZ/8hjXnE?=
 =?us-ascii?Q?x7FwHM9ReEBBWIOEPtkbznaSvqeb94z5kdCui2FrV7gSKveWCCplQVJycezG?=
 =?us-ascii?Q?hpQVJ+dVXBjRIbk0z4p2hn9oo1XVNCr4UFfc4QBfBImgU5TVOCiGHKFtWa+E?=
 =?us-ascii?Q?VeC+2NzQrqAnCBfq6/Vti4bJxdtI2FxIqw7mSRWcOxTdt9MnhFxRfeyRIv2s?=
 =?us-ascii?Q?Pc2nHkEfxt/I/CYqLj1mfvmUKUb14nWGLxBiMeGPdr1CYwCSNVcj2icxY3ue?=
 =?us-ascii?Q?XzfN8ay+FXSEgY1p9VssKfnh6CJsctlQRNWS5++d60563bu3kTq1JAoB7OYd?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 612548a6-dc2a-4f37-8961-08dc0257068f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 18:59:57.7410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FjJj4Oi5GdsRyrlO88yFlzZDl1rpaW9HUrB5nsrZFVT/AwyJmUVoAq3K+CjNhaP8Fxs4vsPveumlRdg7c2mPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6151
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 21, 2023 at 10:46:41PM +0530, Karthik Poosa wrote:
> Wait for gt reset to complete before returning from force_reset
> sysfs call. Without this igt test freq_reset_multiple fails
> sporadically in case xe_guc_pc is not started.
> 
> v2:
> - Rebase.
> - Changed wait for completion to interruptible (Anshuman).
> - Moved timeout to xe_gt.h (Anshuman).
> 

The patch itself makes sense but small issue / NIT with variable
placement / name. Details below.

> Testcase: igt@xe_guc_pc@freq_reset_multiple
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c         | 2 ++
>  drivers/gpu/drm/xe/xe_gt.h         | 1 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 8 ++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   | 3 +++
>  4 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3af2adec1295..47abb9336c58 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>  
>  	gt->tile = tile;
>  	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
> +	init_completion(&gt->reset_done);
>  
>  	return gt;
>  }
> @@ -633,6 +634,7 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(err);
>  
> +	complete(&gt->reset_done);
>  	xe_gt_info(gt, "reset done\n");
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 4486e083f5ef..591f5271c07d 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -17,6 +17,7 @@
>  			  xe_hw_engine_is_valid((hwe__)))
>  
>  #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
> +#define XE_GT_RESET_TIMEOUT_MS (msecs_to_jiffies(5 * 1000))
>  
>  #ifdef CONFIG_FAULT_INJECTION
>  #include <linux/fault-inject.h> /* XXX: fault-inject.h is broken */
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c4b67cf09f8f..543515e91c3d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -58,8 +58,16 @@ static int hw_engines(struct seq_file *m, void *data)
>  static int force_reset(struct seq_file *m, void *data)
>  {
>  	struct xe_gt *gt = node_to_gt(m->private);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	long ret;
>  
>  	xe_gt_reset_async(gt);
> +	ret = wait_for_completion_interruptible_timeout(&gt->reset_done,
> +							XE_GT_RESET_TIMEOUT_MS);
> +	if (ret <= 0) {
> +		drm_err(&xe->drm, "gt reset timed out/interrputed, ret %ld\n", ret);
> +		return -ETIMEDOUT;
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index f74684660475..58396561fd6c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -358,6 +358,9 @@ struct xe_gt {
>  		/** @oob: bitmap with active OOB workaroudns */
>  		unsigned long *oob;
>  	} wa_active;
> +
> +	/** @reset_done : completion for GT reset */
> +	struct completion reset_done;

This should be reset sub-structure:

144         /** @reset: state for GT resets */
145         struct {
146                 /**
147                  * @worker: work so GT resets can done async allowing to reset
148                  * code to safely flush all code paths
149                  */
150                 struct work_struct worker;
151         } reset;


I'd move here and rename variable to 'done' so in the code it is
'reset.done'.

Matt

>  };
>  
>  #endif
> -- 
> 2.25.1
> 
