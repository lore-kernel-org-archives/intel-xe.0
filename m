Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B892AC001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 20:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A4B10E124;
	Fri,  4 Aug 2023 20:51:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571EB10E124
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 20:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691182276; x=1722718276;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ifkRvCRDp8TsKQFTP2yxOvLwYqAALwPYO+P9uHxK5AY=;
 b=HtQJQIfe0BacWkt551oO8dW4Fx1v6UzJg9QNQkOKVRYyF75iiCFgLlZa
 or/8zmq41rksQsDdMOPiT3+I2lvN5bV6JxA94BG+PZNq0Ew3ccY4Q2JNh
 kVhkMeba8sLwKoo/TV2YhKnQCAVWVVGe3TwiT0TbWzlz3OS7Ib7wLgbHS
 Rs25QFhk707mGOzm1X3Rj9EHp5SIeTFiZgSzwequ5XWkmecmdOTCAZWE4
 hx1JMgWApVJYAg3p7YRdkruRDqCrNi0xY1ntxEGOLgQWxMcWFJxxmiNJZ
 4zU0mj/3gjj3PgtW63O82saU47Bi1p95H6mEqfgtXnahtMtPBPVkXdgog g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="355172779"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="355172779"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 13:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="800200556"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="800200556"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 04 Aug 2023 13:51:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 13:51:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 13:51:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 13:51:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kU+3HuvuaMy7MaU4QotlxHsD6wLrsun1+eBlQ1RNJgYsNzRf51W3npmZ2B/uI/mMKa0yISKkTdbaEtRdLsEZChJRCwOMP3NpS2s8vWO05wOcN1iRnAZCz8F3JgZVVeRu9/VisiRq0dwzuCEDrKRgEHq2kE8zD/9IJz6VnRwT+V6cyeDnaWb9F4PqLjYAoW6+qzRY1F25hhxCFD18TIVzjwtC2hfd7HEJbC+RoyJ+fEt42OKDRujDZhGV3/tqSF6idj3fzt1itswjDcrDB/oKEPWC2D8X1FG3hEfor1522/YuT9GY128LNwO7Usl3dBzNq6isP6jH5r7YHJqLC9ZkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJae4i2eA3tKVpBu5rFcvV7XnKrXfL+IP3e0RPGtz4I=;
 b=Xq6HgFSzRySzGgO92IIRlYDRUeunN6gMaFcqxlom/CaPWUrdh5b/56gu8VDVJG6CxqZwaUawl4GeT/ytoe/xU1+TzyGdBkkpvfccyIMaXAKQmjmjzWXUTKq5J9tLaEuxEAEguMV3l1EkeGKXzBOOLcYOLku9E6iSZKN56wMkhDzVs80oCbO5B5eLDHp4TfQxdjWbD3j4id3pbNXBXZO6kNuQYO5hH93PKFguCOLZmQqpPUFew3e6y35GDKcQiRz/TwuGiKGSCZ3+hcRkiyeRlsMgDTYd/ZN2QgF/Yy5l9zoGPU6i2g6JWCTbs/liCj+UJD+apJI2hpuJAWPn7zOCeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6554.namprd11.prod.outlook.com (2603:10b6:510:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 20:51:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Fri, 4 Aug 2023
 20:51:09 +0000
Date: Fri, 4 Aug 2023 16:51:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZM1kuCqXCtWtdU48@intel.com>
References: <20230727174107.532275-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727174107.532275-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:74::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f5727b1-7097-43d0-4298-08db952c87ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /yCC+k9H6rUD9dEKRyw3FW29SCmjBICFiYLsfsE2kqVj1UdViqpL81YsW8JEVyHJgNp8wEehNN4klDqUtGPCXDVGytJeQYSwN1Bxs4tfF4/SrUw5Dd/IDBd+drKCj32f3rmjTQ3w+yKxFj+ousgadES9c6lxjyEQYTErLJEqvseM/IdeCt/VQPH3IPaDCOr+Zmg7zwomgz77lhwUiffdRe2IYo/HaraEMOQvYmXvWgO2QUNJb3fraNun9/K/BXYh1It6usxWMGCDgcdLesyufCSzuHIJiB5wsRarkDi5N6T4EOozXPuO6lEvm8/d4iuOud0he4mc3rG+i1MjfAHzGzrz5n3QtspspFHrdIkOvNKwoJm7+vWF/SrK9NssIWoDiQmBSZeLR65dFWxBv2r1uFBl7GiRMLbcetZ2Vmn994tGNtSKZvjouodexkfbRB5UiQRMTU+VsLGPxl9nM2Werv8wuAJr7zVi8un4SL4hAjKZMG3hGQazoHmh9hmk18HQ71mBrTyLCGEe6jgm8yM/0TIdMPJg+UE3EBIWAiIBLulIPz4e/4eRYu3/tvBn2h/H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(1800799003)(186006)(41300700001)(8936002)(8676002)(6862004)(83380400001)(82960400001)(6506007)(26005)(38100700002)(2616005)(86362001)(6636002)(316002)(478600001)(6486002)(6512007)(66556008)(66476007)(4326008)(36756003)(37006003)(6666004)(2906002)(5660300002)(66946007)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j8sBwIVYf1TcBbDMcvY9o44dMLrWBTVZpK0UXxZUMcvXLVF8nwRu/qi1O3rZ?=
 =?us-ascii?Q?gC6zrYFyM67BWVSee0xibqMobkAPgysctVlAGy+tv6kfvtmdvTTM7JAV+HuY?=
 =?us-ascii?Q?LAfxPkHk1ugMEEMGWoIZp3KhoN2ZU59yQ6l4qV+VwoOKxxXrrnq9uxq0JDdG?=
 =?us-ascii?Q?ch+faeJXUv2mzi6giTiWzyLg37HXj6ZbcfelPP2pGAd43TquqD0ga0LfoAEF?=
 =?us-ascii?Q?YMbgPA00DllaRAmAWcT+W5VplTRRqI6woCeLBMxt3CaD9T2aNZOalbcx6zFh?=
 =?us-ascii?Q?wWvzBXm7ikTH/nqXGfTQiizaon2Psfkj153ggaxuhciRObH9YjmIH37OfNVn?=
 =?us-ascii?Q?EQzsK85sbMpoNT63ZbGkA7Tw03V1SQs7rEi/MAQjS7Oc8wv2+CcaItcxpm/1?=
 =?us-ascii?Q?tZD6m6vBSw+pqapc4RetSFc9k2R4Zm1gbllHjBGkdHjwq4uq32OTuSdZFVSq?=
 =?us-ascii?Q?CZEPtvK2cZQIrJnPMk7Dp/APoO901vANaj9FDzaOPyb99hS5ZyPwLi6S6weM?=
 =?us-ascii?Q?5i4zIEaSvK8pJOUlg6XIwlLz5C2CcXSY5l2NsL2IvMjBgKElgNOKHZrgnYTb?=
 =?us-ascii?Q?fWQNEOZS9YtvAPZfLA+pjLjcMMuCSHSt0jEKBwRThrU7E5gADPFFVyqwTXp2?=
 =?us-ascii?Q?4nrp/+LE+wDqMRCzreWaCK3N+xLRe1vcEIHrjBIZ4uVv6/jh1HVkdeKpHysm?=
 =?us-ascii?Q?RKcyyoLCN24cd+Vqo6uVe0/6RwCu4HZq3CSBUjrwK1I1+/PSwqr+flFU6LdW?=
 =?us-ascii?Q?6U10aFwB4EEpAF/jAngkiJG+sJZ0eDC2VPaDcgtvHBNcAtgSKSQzIicqTp8i?=
 =?us-ascii?Q?jJ2q270QaqgqA9mauh11hHmIyhcyr55wKgFidNFZBFv8HmyhSwgBCbW9qbXR?=
 =?us-ascii?Q?oFWAVh6mU56ajQ5IokMaF5KP/TZ9FmZsIQFdG4uaLHzvxbaRwu741aZk28O7?=
 =?us-ascii?Q?Ym3mie5GTm7Curq2yEdDAP6Hin9mDLC6Y4ikCIfk1yEscyYxrS/v9IwFda/D?=
 =?us-ascii?Q?pbcTCeGynVhbuU2QqhikyVEiIDJEa7idaF3aezQPPQT1hu9VxknAkZm8vyVx?=
 =?us-ascii?Q?+u8bk4fIHbGDbwfmm/YbXFVSscc3tq77/+AvTNV05IySqNQurP8MriCqnP5y?=
 =?us-ascii?Q?/4To5wSTzcHPm15AAbymXV9nRx1hdZOY38xEghBlDDtY4l/nxFvWKTq0Z3iz?=
 =?us-ascii?Q?QkcUcvhAbvsadd2NgtnganQPOGDxHw1K2qvGkH8JK2xkoVsfRNUZ+ZctJNc2?=
 =?us-ascii?Q?FqeDg6EQd0DtUU8xE7MErEBjBdJUNyVf7ufedYsQwenEqPd666onK32lPCcn?=
 =?us-ascii?Q?MP2r0jfnyUQ40yCGfp47iJ+wioKG5mhcJ/F8QD6wrwX1aoHaxjqVEBVc/Ge1?=
 =?us-ascii?Q?qN0kcdzYMEmmKuCjpcyqCxi6u7PsnVvdGlS8uvH8bODQtyYmsLUk6sBdqFOz?=
 =?us-ascii?Q?ZK2L/lSfGff1mQwrLnlUXHSiJFvMr98v5XbYKP/ycWiwLHnfmeWcVW85Ofid?=
 =?us-ascii?Q?dptGj6WKWOQmk+uXs419Njp3HNEiLp+fPM3KK2EHeRqkXRjUdZadEElUuFRl?=
 =?us-ascii?Q?BgLSDD1M3wKyzmYww+7DO9g9Gp0miRuVTUf8Hmjsf+hZjQ7IX0Vb2FyQ7oil?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5727b1-7097-43d0-4298-08db952c87ae
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 20:51:09.3528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmM8UuXGrzNfkL9/6wGp5DRJ6n29Dg4KP8Azl7FYZS0c4WYvVXxoFFT6kaeYEQbWhGHp4Yn4koZFVNpga/IH9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6554
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Call __guc_engine_fini_async direct
 for KERNEL engines
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

On Thu, Jul 27, 2023 at 10:41:07AM -0700, Matthew Brost wrote:
> Usually we call __guc_engine_fini_async via a worker as the engine fini
> can be done from within the GPU scheduler which creates a circular
> dependency without a worker. Kernel engines are fini'd at driver unload
> (not from within the GPU scheduler) so it is safe to directly call
> __guc_engine_fini_async.
> 
> Reported-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

For some reason the BAT result didn't come out :(
it should be better to get some CI on it.
But the code looks correct to me and indeed better,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 911d4965c27c..6cb64a097297 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -943,27 +943,19 @@ static void __guc_engine_fini_async(struct work_struct *w)
>  	drm_sched_entity_fini(&ge->entity);
>  	drm_sched_fini(&ge->sched);
>  
> -	if (!(e->flags & ENGINE_FLAG_KERNEL)) {
> -		kfree(ge);
> -		xe_engine_fini(e);
> -	}
> +	kfree(ge);
> +	xe_engine_fini(e);
>  }
>  
>  static void guc_engine_fini_async(struct xe_engine *e)
>  {
> -	bool kernel = e->flags & ENGINE_FLAG_KERNEL;
> -
>  	INIT_WORK(&e->guc->fini_async, __guc_engine_fini_async);
> -	queue_work(system_wq, &e->guc->fini_async);
>  
>  	/* We must block on kernel engines so slabs are empty on driver unload */
> -	if (kernel) {
> -		struct xe_guc_engine *ge = e->guc;
> -
> -		flush_work(&ge->fini_async);
> -		kfree(ge);
> -		xe_engine_fini(e);
> -	}
> +	if (e->flags & ENGINE_FLAG_KERNEL)
> +		__guc_engine_fini_async(&e->guc->fini_async);
> +	else
> +		queue_work(system_wq, &e->guc->fini_async);
>  }
>  
>  static void __guc_engine_fini(struct xe_guc *guc, struct xe_engine *e)
> -- 
> 2.34.1
> 
