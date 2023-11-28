Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F48FC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 15:58:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E774710E0A6;
	Tue, 28 Nov 2023 15:58:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5133C10E09F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701187124; x=1732723124;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Vx/rfsblDfXH1IYHFUecvvX6lysWRXZB7jHOKNk+3ZQ=;
 b=RHWOM90RT+08JvBn1Ej4glkrfufg4fx/LTRPe1BJX0w/XfjZV+T/znrj
 3LzyR8WtpDRreeXYfSNYTTO4kdibmmzTjYXvJYGkMKZ6mz5ZI096qvaqF
 9kfTCOGh/qaZgoCPgF4S+F3zgK1lj7yUIeOCjF8bkrWzfLWktXJbEg3CT
 7hn3p5cn1qvzQpKnKJvau5twjeQu3t0RQmzykhJlt2cT1ERhFxhsFzKZw
 ONeUFNq7VhffEyWnFVu2rmjF47TPLxwFLe0mlBHpPINx4J6lUSdpjt9ZA
 5chQS8ukfORtVQl8u1oMgSchXduueiikbDo5OLg+a728a7gOvrGVSAf7o A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383337976"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="383337976"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:58:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="941965820"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="941965820"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 07:58:43 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 07:58:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 07:58:42 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 07:58:42 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 07:58:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuID3cDxz0510LaS56Y6n1LsTYVzVo4YcaAavfXnNB7Gf8mqSL81WNsvDgTkrb6sHBv7ZfOWBzdOTmRScOOgkcmIIHjC8fYV4G5LqGG5NN4NNCuhLFtNS3Yli+AKnJKuDqz5Jf1x8Wf5L0ECJijIGuPeUBv1rmVQGLtxDn1LW48Jj4+hBWYwBuFgr088B51z1zGSNvZbLEVmJlEwcaETBRuCNsuG6O6912UZ1/TjVl9iT3yly2NkPg7K8uKM1naStoX0j5WplIMeSOLF8gdUTCf/ne2wBAMrHlwKVgzKOlW+AVxfY7e8EJ+keebuWgEqPatfzH2CMj9/48uSBSfb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KDzQsQGfGm/ibfIeFGP1FoDfVPE8rCIEjzpzmr2T5U=;
 b=IpoG/qfwWqzcWjfIOqnVU9e1j+EygEVb36jYk9pQVmcDfq5bj+jdg6B8BjDqAyLAAL1LXB+dKEpgDYC8weSpKvB5kJ63tWpiya56DDAxTOs4JuRB7NnwFgI+Id5OvCC4gKjzYPupzdC8TPllUwA98/IpESCsmmeVtjui/AU93Fl+bHUPqm3R/2buqdO/w7fRKLiq6587FPOTQsOvE7bdSMPYGn711WYEkxtTyu+YBm1WRjMnnEneaCJPHv8dbL7yfX37+ejtJhRaoLk9d2DlENRmRgNNpJ1WLiASTs6lqoxmWy89i+XWQuVb2O2AN8R5t9dho9xqBNsLn3tMAEiPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6724.namprd11.prod.outlook.com (2603:10b6:510:1b4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 15:58:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 15:58:40 +0000
Date: Tue, 28 Nov 2023 10:58:36 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Bommithi Sakeena <bommithi.sakeena@intel.com>
Message-ID: <ZWYOLHSEn4rI/Or9@intel.com>
References: <20231117160618.4134-1-bommithi.sakeena@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231117160618.4134-1-bommithi.sakeena@intel.com>
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb259d8-8940-4074-94f7-08dbf02ae363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eysvc1k5ZfrZQW5578ucDugYq9pg7zo37ukdiAYulQzIw4MG8iO7GRdG+FXeSQFIMBkFgUVT03HJBulAMKYiJeadI2R2dcZjjuz/JYFj0XMSBy8Gj5EZ905gWJgzibAVwQqINKymBQ5w1WkRmfWCdKagVMiSzweRYbJLx88oRH6b0IxvOKDzqTorb3EAYlaYmUXnamRJDmmqTlSRQHedral5Uizbo8flTOf6Rlj7LLRehqvEnWwwUDy00Ht4Elm3hRn8f5ewzuTZdX0r/IaXkGj/YHCsysrK/lrNnemslDLbLwRyqR2gZIbL2RgCpmElbD5gNbYMwE8y/ElyjJYrkd76MIqqcpQ+u5LoPOb9BLKyO1KiGXBpbhKQIW5CpZddqXZ50Amsw5pbh39tWd2713bk6l5Ro6XF1xcg0ElVovBQhgtDHpjvM6y8moiS9kD4UVd4kDrErc7kPt5jaM2T7s2i4Tp/OmwUjYtrwsZg+CyPJK/X5d/wHf2g5lmamHbhpheXkwAeB93fBALRt0m5kj8b8ViB+JHcM1YlIztK2P9S1wno/QX73iW4VzXzVvzeEU3rxWjhjmprn3JD+Cz9+vhTU2Ue3Y0dyn6tAACAnBUeC/Nmj1w2L1g9yGtwcneB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6512007)(6506007)(38100700002)(6666004)(82960400001)(83380400001)(107886003)(2616005)(26005)(86362001)(6486002)(36756003)(478600001)(4326008)(8936002)(6862004)(8676002)(44832011)(5660300002)(2906002)(6636002)(37006003)(66556008)(66946007)(316002)(66476007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ibikSiAVhbwT+UqI49EBY5Kzwlayq1esbcS6pRIKu4W/7dcu4w5oIN4p0+?=
 =?iso-8859-1?Q?FabtNkH3N0PVeiihcGZbnQmL1bbxagOUJqfQAD6zN/FMqKBC6rdYudQIZ6?=
 =?iso-8859-1?Q?EwsZpiAVZomVlo5/PR4r6gmn+kE++KR6FI4zQGyeK/iSfKCrl/MaXwqdTj?=
 =?iso-8859-1?Q?+GoOmzeBpJIFRXOrUpZcBooAo0gcxibGkAqle6u0gsRUw5kp1QXs5sFQlm?=
 =?iso-8859-1?Q?2aHsj3a4UbukebVPgrc/YOp1mnw5trad4kw3t5Froz/DyOpTEIcA6UzvX4?=
 =?iso-8859-1?Q?7tJuIsRvJTvnhuYUbKKEzpsrLtqmtxg1Wp3MTFaoie1WMP40sHzyOH/Seq?=
 =?iso-8859-1?Q?xMKsmak/hQzGzJ1LTW3FDprVQJtNm3D/9YAYTOarhU3WZkgQFHyp23/+Ny?=
 =?iso-8859-1?Q?fn1SQWtnoc5ptJ8KBGZlQQvpJ61IaPQpiFEBY+XVdw/lhk6PSs/QphErGd?=
 =?iso-8859-1?Q?zQaKdjr96+1Zeoru486Mn4US/kKe4RbnOyD7vDxb6/2drxZQVDApTbLGWn?=
 =?iso-8859-1?Q?47FKy9+VXevL5QQ75SccPnWiWKItN3FSQGpmbhYS2bE4EXrMGE4cjaGIF0?=
 =?iso-8859-1?Q?ycq7jJKmN+G1AAzhLVVKWQbSCBxI6HCDUbfKoPa8Hn7JMcuwPhTYOO3k3U?=
 =?iso-8859-1?Q?Bkn9NGrn9FwNXIpDbqlEmebcynFILMURCnelwUHDw/N6A7lfV00gzrrKz9?=
 =?iso-8859-1?Q?j5GXmLoh4lO0VvarujLiaSncirLkoK0/dw1hAnvAf+xJ9g/xm9tmrHfeUZ?=
 =?iso-8859-1?Q?NEcXfkMLvBkApHOIrEOQ+8dqY8SzZ2OkeuOZP17nfA0IYwDS823O2mZVOW?=
 =?iso-8859-1?Q?eQA2fXy/zUKX6ZEyhyRyhWh7Y/SYCCZwQwmV1d4+6sSby/PoLFGDPax6fl?=
 =?iso-8859-1?Q?V8+kMMpOqq+8iXAPXRXzZJUjrzfx+/7S+7QQ5fpQ25u7ABs7bhHlJN8Lgu?=
 =?iso-8859-1?Q?JYji0FyEWsN6d5X0lwXVAZb0/dh5zlWu51v7zDj5Aj8KT6O3m67UuwezLT?=
 =?iso-8859-1?Q?+VAm7zQi974LGX/1TfyeSTWb9ZVfyievvH3wsWoUisUxKHtpDx3qKdnPf8?=
 =?iso-8859-1?Q?VQKYky3up6hHBe9CZcqFWt518PWhDa95suvLaV/XopT43MYhVD0H4yaD78?=
 =?iso-8859-1?Q?9i5XmwkwUi80gipwENQGWP/vEqA7xDByyFNpNr3jkIT58gWsvedSxXDaqw?=
 =?iso-8859-1?Q?xsADEBbKXu7c95jYCiCubx2YqJz596AvDYbmQdO4KaDwjuWrHK189R9qdo?=
 =?iso-8859-1?Q?QNMjTnf4hk5OU/SluFNV8Jqf37qIS49rlFBpGNIhC1df0hbtpCbUFGESvl?=
 =?iso-8859-1?Q?YC+WYPAz+HHmhQ95P49aHzgb39NFXPcOxdeQD/UvtFU1bLxOGY+wcEl3Jl?=
 =?iso-8859-1?Q?VWsuEIUP4rXmcoDdzJSabEWiLChAHo0VjRJKCFIYqNNwmCW48rht0Z6qkS?=
 =?iso-8859-1?Q?T+J0lAbwPiSZZCGQFFWq5p1gCa2TCWoPfBNtKgpWCpY0T6iP8cs6d65c0U?=
 =?iso-8859-1?Q?tZsD5IVN49/vMUi3WmRShSS2jiTT5owYTtDPP7JDpS1c2Befq9ypp9q5oZ?=
 =?iso-8859-1?Q?eSH6yZFPy07igZDcfix7/U4hEbmdyIU+2ZP30+TRlhARHbF3Uvfowtz/hD?=
 =?iso-8859-1?Q?YBaK3PZxLh8y9BXYGf+FG3M4bgl2tEk09NsjwPFkxi7pQOaV1IWgeX0Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb259d8-8940-4074-94f7-08dbf02ae363
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 15:58:40.0598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVFAhhppzSeFlBgiS66mQSJ8Bv5KGsZ6chTlExAbLiRX5s/qiwpjftDqTTu4E5u+tBUynHZFnJ8sVHcfNvYpTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6724
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Encapsulate all the module parameters
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

On Fri, Nov 17, 2023 at 04:06:18PM +0000, Bommithi Sakeena wrote:
> Encapsulate all the module parameters in one single global struct
> variable. This also removes the extra xe_module.h from includes.
> 
> v2: naming consistency as suggested by Jani and Lucas
> v3: fix checkpatch errors/warnings
> v4: adding blank line after struct declaration
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

pushed to drm-xe-next, thanks for the patch and reviews

> ---
>  drivers/gpu/drm/xe/xe_device.c  |  2 +-
>  drivers/gpu/drm/xe/xe_display.c |  4 ++--
>  drivers/gpu/drm/xe/xe_guc_log.c |  2 +-
>  drivers/gpu/drm/xe/xe_mmio.c    |  2 +-
>  drivers/gpu/drm/xe/xe_module.c  | 29 ++++++++++++++---------------
>  drivers/gpu/drm/xe/xe_module.h  | 24 +++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_pci.c     |  6 +++---
>  drivers/gpu/drm/xe/xe_uc_fw.c   |  6 +++---
>  8 files changed, 42 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1202f8007f79..f956846c1330 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -225,7 +225,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  
>  	xe->info.devid = pdev->device;
>  	xe->info.revid = pdev->revision;
> -	xe->info.force_execlist = force_execlist;
> +	xe->info.force_execlist = xe_modparam.force_execlist;
>  
>  	spin_lock_init(&xe->irq.lock);
>  
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index da10f16e1c12..74391d9b11ae 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -45,7 +45,7 @@ static bool has_display(struct xe_device *xe)
>   */
>  bool xe_display_driver_probe_defer(struct pci_dev *pdev)
>  {
> -	if (!enable_display)
> +	if (!xe_modparam.enable_display)
>  		return 0;
>  
>  	return intel_display_driver_probe_defer(pdev);
> @@ -69,7 +69,7 @@ static void xe_display_last_close(struct drm_device *dev)
>   */
>  void xe_display_driver_set_hooks(struct drm_driver *driver)
>  {
> -	if (!enable_display)
> +	if (!xe_modparam.enable_display)
>  		return;
>  
>  	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 45c60a9c631c..27c3827bfd05 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -100,7 +100,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  
>  	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
>  	log->bo = bo;
> -	log->level = xe_guc_log_level;
> +	log->level = xe_modparam.guc_log_level;
>  
>  	err = drmm_add_action_or_reset(&xe->drm, guc_log_fini, log);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index d8f9fabf715e..37a6861e83c7 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -73,7 +73,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>   */
>  static void xe_resize_vram_bar(struct xe_device *xe)
>  {
> -	u64 force_vram_bar_size = xe_force_vram_bar_size;
> +	u64 force_vram_bar_size = xe_modparam.force_vram_bar_size;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct pci_bus *root = pdev->bus;
>  	resource_size_t current_size;
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 7194595e7f31..1ea883f48c63 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -10,39 +10,38 @@
>  
>  #include "xe_drv.h"
>  #include "xe_hw_fence.h"
> -#include "xe_module.h"
>  #include "xe_pci.h"
>  #include "xe_pmu.h"
>  #include "xe_sched_job.h"
>  
> -bool force_execlist = false;
> -module_param_named_unsafe(force_execlist, force_execlist, bool, 0444);
> +struct xe_modparam xe_modparam = {
> +	.enable_display = true,
> +	.guc_log_level = 5,
> +	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> +	/* the rest are 0 by default */
> +};
> +
> +module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
>  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>  
> -bool enable_display = true;
> -module_param_named(enable_display, enable_display, bool, 0444);
> +module_param_named(enable_display, xe_modparam.enable_display, bool, 0444);
>  MODULE_PARM_DESC(enable_display, "Enable display");
>  
> -u32 xe_force_vram_bar_size;
> -module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
> +module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, uint, 0600);
>  MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
>  
> -int xe_guc_log_level = 5;
> -module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
> +module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
>  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
>  
> -char *xe_guc_firmware_path;
> -module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, charp, 0400);
> +module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
>  MODULE_PARM_DESC(guc_firmware_path,
>  		 "GuC firmware path to use instead of the default one");
>  
> -char *xe_huc_firmware_path;
> -module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
> +module_param_named_unsafe(huc_firmware_path, xe_modparam.huc_firmware_path, charp, 0400);
>  MODULE_PARM_DESC(huc_firmware_path,
>  		 "HuC firmware path to use instead of the default one - empty string disables");
>  
> -char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
> -module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
> +module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>  MODULE_PARM_DESC(force_probe,
>  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>  
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index e1da1e9ca5cb..51d75ff12376 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -3,13 +3,23 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#ifndef _XE_MODULE_H_
> +#define _XE_MODULE_H_
> +
>  #include <linux/types.h>
>  
>  /* Module modprobe variables */
> -extern bool force_execlist;
> -extern bool enable_display;
> -extern u32 xe_force_vram_bar_size;
> -extern int xe_guc_log_level;
> -extern char *xe_guc_firmware_path;
> -extern char *xe_huc_firmware_path;
> -extern char *xe_param_force_probe;
> +struct xe_modparam {
> +	bool force_execlist;
> +	bool enable_display;
> +	u32 force_vram_bar_size;
> +	int guc_log_level;
> +	char *guc_firmware_path;
> +	char *huc_firmware_path;
> +	char *force_probe;
> +};
> +
> +extern struct xe_modparam xe_modparam;
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 682ba188e456..d56a89da7ff3 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -418,12 +418,12 @@ static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
>  
>  static bool id_forced(u16 device_id)
>  {
> -	return device_id_in_list(device_id, xe_param_force_probe, false);
> +	return device_id_in_list(device_id, xe_modparam.force_probe, false);
>  }
>  
>  static bool id_blocked(u16 device_id)
>  {
> -	return device_id_in_list(device_id, xe_param_force_probe, true);
> +	return device_id_in_list(device_id, xe_modparam.force_probe, true);
>  }
>  
>  static const struct xe_subplatform_desc *
> @@ -592,7 +592,7 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>  
>  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> -				  enable_display &&
> +				  xe_modparam.enable_display &&
>  				  desc->has_display;
>  	/*
>  	 * All platforms have at least one primary GT.  Any platform with media
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 3032c4f148d4..25778887d846 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -220,11 +220,11 @@ uc_fw_override(struct xe_uc_fw *uc_fw)
>  	/* empty string disables, but it's not allowed for GuC */
>  	switch (uc_fw->type) {
>  	case XE_UC_FW_TYPE_GUC:
> -		if (xe_guc_firmware_path && *xe_guc_firmware_path)
> -			path_override = xe_guc_firmware_path;
> +		if (xe_modparam.guc_firmware_path && *xe_modparam.guc_firmware_path)
> +			path_override = xe_modparam.guc_firmware_path;
>  		break;
>  	case XE_UC_FW_TYPE_HUC:
> -		path_override = xe_huc_firmware_path;
> +		path_override = xe_modparam.huc_firmware_path;
>  		break;
>  	default:
>  		break;
> -- 
> 2.34.1
> 
