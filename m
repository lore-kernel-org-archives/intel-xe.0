Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D49C88CB2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 18:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED9810E2B9;
	Mon, 12 Jun 2023 18:33:49 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C22510E1FB
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 18:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686594827; x=1718130827;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1vnl+ikqBTFyVanLz44UYOxYaLoK6yuofVnYiQrUHh0=;
 b=GS2CwCCYIcCZbbu0o7iYW0IHS7L2D+NmepsnyvfjX64ZlF+TBzDUkG8j
 22QVTUscbc4wOwwyajExkYmyiHb9w4tNZcslC0/KkBPTe82e6AEfkGbqN
 P3E20ipgoKm/cUlyDJOrMBe2nnOfq/6WpHWQ5jadAPwALq65jebdJEHUt
 bIBJN3WJO24zVs3SAJ/nvzbdo2yi3uYhuAWP2l5puEIFEapjfQeiSHZ9M
 TmBD8UtlmGmVQt+fjTIIwKOlCZ18awRjL3gwBmYkn/D9PATJDD+1lxT81
 j0wr+NY8US6RtCCYkyQ8mIAmepPPfPFfo+Z4vCNYJctlrSAoeMKxdMBfK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="355626299"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="355626299"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 11:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="688747488"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="688747488"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 12 Jun 2023 11:33:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 11:33:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 11:33:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 11:33:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 11:33:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=az4QOPHTgy8Bb/EORdlyelZwrX6eYyjpY7VSxK2IXZuHuSbcMyatKx5zpyJ+h/Gg+agFJGSXjZ0C0TMwKL4cnmbism02CUi2k9psDTY4LHWMy2j4vtU52/KK8c3fbzL8FUA2X7J4U+DMi24yraTZeT9QViSHK0jgSj1WG604Kg7xkm/o0/4XItrhW/fAoHmOaR7SaTuXQVrIazll02wvIzvwZA9v7jh3IKioAKmE5H4xWMdFGe5uXUu0Hht/LKURfa9beja8+MjeP8yBCNuVLjDA5uA3sSl3J5YQL/5fOq/zTH5JVVwugFfVexGSkalMfCKLff9kd/59ZXsjPsO74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KWBTbkfj83QKEEEXvUR6pLxV6g+qFpyePDpt1BujDc=;
 b=Wvr3rzqNVmQKcxSCrpihzR01B1KZEcHbtHeJZ86cOTYZeB3BozB0vKQ/x5tZIyKfE6uYYVA1aiwUj3jPZk5p045zh4oX592w0W/g9RQv9DouV96qT2jmyQOdVPYgNMKX+OyQ5TF1gyfH5XvcWJ3DppsXw6ja31uHlQq49FCDo8jug260VpaKjWzguxGvE3X4hZJGPJVgp7UwFrGlYHLes4CD7NTy+Qs8mmptt28nSVFhmTUSRv4kLiuaPvimwDjwwGW1kbKC2oT1e5uK8Kw3/e+mFkfJLfWHmRLk8tXUrd9ZWap4UBCFkArDC96p5kacEPLuGE4oXSNEXDBXNKoEHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Mon, 12 Jun
 2023 18:33:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 18:33:36 +0000
Date: Mon, 12 Jun 2023 18:32:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZIdk1NrXRvs7YUq2@DUT025-TGLU.fm.intel.com>
References: <20230612171225.88689-1-matthew.auld@intel.com>
 <20230612171225.88689-13-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230612171225.88689-13-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR01CA0029.prod.exchangelabs.com (2603:10b6:a02:80::42)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: da30c65c-4792-4ca9-9e3e-08db6b7388ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HzgIrfICFw7GU0MtQiEIbQU8SiycKipxjyhOqeyZHB0yyvsJtCfrcV7eL/VAihiw5sBF/5lYajZabgmKzCvTqbliIm/HAaEHU5igF/BoFEO1hhvFj1cJPX3x6QWorXxHl5PkrOAhwgUSd89Rmn3o8RPXygXHkM9WIt5SyA4ZAImVNYZyvJcRgbDTkGnpXbotaGfy3iVriW3ydt1mPWS/2yXCqBWjApYwYyevBB6byqXvgBqmAwoiSwtJ0TwO/whyjPY9NmVfzpXqtUl9xCj9lRKa6fqslnkSvkb6imNey9jr2dIfTN33QtjeF4ww6lKXVUd0m4B/G/AP2P6bsAu5PgRIszm+CxpLNL63QwRtsywRTi0APdENOwAjejHfsbYnwWX6SNTqKtOS/cE3AuksTu4/ZfVpvuegZKUFdthL1HnErxSCNKGOpb/VjX5XXg8VmA/RVZkCu4Meu133/fsn8raHT3yjtaGDMr0bty/6i/rjRsStqlEtxMwbSwpvbkyua+UQ/Az671cwKQ+uicBPd75++fXFnTlkokhpJyH3Ge00t1VaRgDLUXzx9pQFB/MC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199021)(5660300002)(8936002)(8676002)(6862004)(2906002)(66556008)(66946007)(66476007)(44832011)(6666004)(6486002)(4326008)(107886003)(26005)(6506007)(6512007)(316002)(6636002)(41300700001)(186003)(82960400001)(66574015)(83380400001)(478600001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WzkxAhkjGYbOsroVEx+yezoK51Eri4CWBjBOF87XaJ40LmeNE8SuVmJ0lM?=
 =?iso-8859-1?Q?gyLnq5nvQgCQ+LLseABVl9xxP+l2IlAepLCHDIA8w+/+Ta/gSh8af/iHBy?=
 =?iso-8859-1?Q?amq60xJPmbB0+V2heLYoGO/5MaqC/YMheaICILpMpRWA53u677QdzwCN1b?=
 =?iso-8859-1?Q?nMmkhr1+PFXnoA1JJuz4yrgE03eMcoW4mi7edtBaoLG8Yr4ab7UtacTIIL?=
 =?iso-8859-1?Q?jA69j/BlhD+KTl30VfPVaI/pspNkXpiyeVRBYAPoVgGs7eRaWVCkeDmSe3?=
 =?iso-8859-1?Q?fKFuiREUCP5ogjn7jj7BuikuavyazssdjQmwX3OzkskWG5+Jrg4VdHijrS?=
 =?iso-8859-1?Q?05GWLzDhzhSSsHETfmSuEdglHh97ETHIcbP6KOx8MBXbqtlNrN7iOYZsqg?=
 =?iso-8859-1?Q?hQ22hQeEtrCu53MxQrfRT0d0TFAzaQhGKpwkdTEPvRxvQN0G4wUUEqmdoj?=
 =?iso-8859-1?Q?1IvfAxFbO+he9pwPTxU2i8K45Z5uh2ZhDS/5iU4FyuYFxCl/re2OsTel7R?=
 =?iso-8859-1?Q?w8B6uVRddtdgy8RBwSOANqJdSn8x6pIRSxuru2R5rMC/6x45ZO5h+TA+dk?=
 =?iso-8859-1?Q?k3G0vYpzRyaVUtvwmV99il7Fn8edm6pXsAky8fVFbkX+FckxRco2Y5ePDD?=
 =?iso-8859-1?Q?E5pzR7xuufRw24HNGQ8r+aoz/baWG2vjtkZYDXVNtl0M23XId3nZ98bM6v?=
 =?iso-8859-1?Q?RQasZ1GwACOp6y02U6eLvtelfGjquxWdkdI2LrvzWtyYmEIFHrkHyZEn+w?=
 =?iso-8859-1?Q?Ude0rU2t3ziw6sY6QbTn7UohRCNRhFPG8MORJDsQcmUCYTodqZwLeJ61T5?=
 =?iso-8859-1?Q?b3QtfHwVjnStpxkEhwtC05tYYT6/EI/d+zxaZLaq6eEig1IVkljScF/oH6?=
 =?iso-8859-1?Q?NG4U7tzTkv1Bd9aQgqza8SpbuHYPn9kzGnRBEuB14kfudPk7LV6h0xPU8f?=
 =?iso-8859-1?Q?jflm63mX2erYytZySZHDEa22jU8wqHrDoL6pvR41VCmayipBvo3dZ57zgM?=
 =?iso-8859-1?Q?QwWfcW/aG6xlIQHWWsiz+OSRYKLiHbIkgVOl8SHcWC2xJirBYZKJSS73N3?=
 =?iso-8859-1?Q?VTQqnt94g2Tk9XJie90yWB6xb9g3P/V64RGVUJjn+SGCWFfR6Z20XI1a7o?=
 =?iso-8859-1?Q?L4eqi2EB606vxMaWM8KNvq0RujCYH/i5HJcm/FrVvClaMIK1VxeJj4M3Vs?=
 =?iso-8859-1?Q?qYMyEgZxCtRKOjrhv9I0XZp18N8u/X+NrsfCgIZ4VwXnkM2imTg9dKD7pe?=
 =?iso-8859-1?Q?6ZYk+M+GDnSOQDEetDgS6ofvsJzpMiAM6GXjwN04ZCvhQtiNNfDwY1s94l?=
 =?iso-8859-1?Q?sQ5u94jFmgiTFTagjPah+KwMErciB8NRnOb0mnK8GHZHemaMNEe2D/OfW3?=
 =?iso-8859-1?Q?4UfmrLx2SmrliJS7qcbYt5/cI5UdDw9J+5YieyAjXa/GrmNOjwDEvJvtHC?=
 =?iso-8859-1?Q?uMQM5Ntn1G1QYal5Uk5ujFhNHaQuH8YIjUiAYXk4U5emdddkUZu62AERmZ?=
 =?iso-8859-1?Q?8FykzxomOA9SQljhMriyGKekDp6ktGLgEJrPhOZMEy4WWb2HM/o/sdXpA+?=
 =?iso-8859-1?Q?Ib7PwsFV3bk1yu/mFwMkoDyeqhAju1VGr5/c4S8NICDM3pq+N5KFEXu9DY?=
 =?iso-8859-1?Q?yD8d0STzEmKgD9N1Q/Ay+Sj7Wa/M9ib5hIRtBCxcidDu+B/e+eFsvHvg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da30c65c-4792-4ca9-9e3e-08db6b7388ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 18:33:36.3957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfrUhu0Eszn+JJnpCzZfUhyoSfolEwqqA8RqLLZSSuKkyyFJ24Imw1GgGtJfHawPqlXxvovPSGZ/84hzXdWFLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v11 12/12] drm/xe: add lockdep annotation for
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 06:12:25PM +0100, Matthew Auld wrote:
> The atomics here might hide potential issues, so add a dummy lock with
> the idea that xe_pm_runtime_resume() is eventually going to be called
> when we are holding it. This only need to happen once and then lockdep
> can validate all callers and their locks.
> 

Clever patch, makes sense to me but not a locking expert. I'll Ack but
leave the RB to Thomas or perhaps Maarten.

Acked-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1dc552da434f..3011a72da42f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -225,6 +225,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	if (WARN_ON(err))
>  		goto err_put;
>  
> +	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
> +
>  	return xe;
>  
>  err_put:
> @@ -443,6 +445,22 @@ void xe_device_mem_access_get(struct xe_device *xe)
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
> +	 * mem_access.lock -> runtime_resume callback once, and then can
> +	 * hopefully validate all the (callers_locks) -> mem_access.lock. For
> +	 * example if the (callers_locks) are ever grabbed in the runtime_resume
> +	 * callback, lockdep should give us a nice splat.
> +	 */
> +	lock_map_acquire(&xe->mem_access.lock.dep_map);
> +
>  	if (!atomic_inc_not_zero(&xe->mem_access.ref)) {
>  		bool hold_rpm = xe_pm_runtime_resume_and_get(xe);
>  		int ref;
> @@ -455,6 +473,8 @@ void xe_device_mem_access_get(struct xe_device *xe)
>  	} else {
>  		XE_WARN_ON(atomic_read(&xe->mem_access.ref) == S32_MAX);
>  	}
> +
> +	lock_map_release(&xe->mem_access.lock.dep_map);
>  }
>  
>  void xe_device_mem_access_put(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a39f3d3f3bc7..82b80e3f2d44 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -323,6 +323,14 @@ struct xe_device {
>  	 * triggering additional actions when they occur.
>  	 */
>  	struct {
> +		/**
> +		 * @lock: Dummy lock used as lockdep aid to hopefully ensure
> +		 * that lockep can more easily see any potential deadlocks when
> +		 * calling xe_device_mem_access_get().
> +		 *
> +		 * Doesn't protect anything.
> +		 */
> +		struct mutex lock;
>  		/** @ref: ref count of memory accesses */
>  		atomic_t ref;
>  		/** @hold_rpm: need to put rpm ref back at the end */
> -- 
> 2.40.1
> 
