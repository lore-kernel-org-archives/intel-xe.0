Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6A7C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 15:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0621710E713;
	Fri, 28 Jul 2023 15:00:18 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FC410E713
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 15:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690556416; x=1722092416;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O04b9c5PWFGP2Hzop9ahfU/X0+nOoXOsi9mgvQ12xEs=;
 b=RWcY2yHw3rXAwxNmlU9xrr8T8bN2Zvtrsz+hAVbmILr4wk9OUPyf4rr9
 IIqH3Z75JUbHblaemVYYnJYr//ob77metsRxY/oRl8Z6PEmFevrTOqlTo
 bIqykFuj792TD6JGy+TcyT48XhpFovDEDyjLd940g1o4ZOZWYfsnBQQdP
 bXmY7g+3q31EY7Df/hexm8fq0VxoqCbgtW5EYwpafHAAM4j6o9EjuBrUH
 ekugI7BadT2hjsp9iKB7+LsnUoPhUMGgB94d2SQeV4TSfZsFgItIcn5E1
 I19pINZtfePdhZgKlo18CvNaQzsVzyG3pRJnhcY+7ufxkM/2SOQPCQv26 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="454967306"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="454967306"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 08:00:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="870900426"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2023 08:00:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 08:00:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 08:00:00 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 08:00:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAk8M8GZg6zcpAs+f3W4DitnrI3PQN2mq3SBPIHRxGT/MCcPNeHLZzWzDKih2+DdsGFFg5g8rM373yqif94TQjCm3I7wmfQLjuQYyVJ2BPcnOdywy+QuEz0JBelWso07+DalpIYRgeo0REhzyNygo9fJjb002XTvmHJ2dvkfh1A9rF1AyA5vWEuop89p3mZMgnnbbPzgie/Vva7h6bxn3py1jKr7JWVo/iRIrTH/8fSM9Hv63+yiFwjd+z1rsr+jx0u7TLhAcHigiBNxfapyLadTZ000OLOyQSQF74z6858kIwf9VPZk9IWvvYKj9K0U3xrmA6gct5iZPXiKPtaP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXpuP8VqhpMbM6A2UtLZd9uRnwWDNE+0ZX+IRpEKf8w=;
 b=G8dEp+2eaVDovpVbwZ4Er2YkNsvEU3g3kJB66zop2U9Z9KvcBP1TE52aSe/yzW/uEBsZ95xNu1QI2YuHsZF7BdGYQrUBOjZ1rJDpJRSEU5QjcSr9gLHi/40wJjKrHjTFFO0MWURnDLWEXBBUyUwX9LTR0f80jL3ACUTu6jIj/bDc98lIniTur8RiUpJSnMXGiAn18QnbfwxoNhcv2qYFTYwSJk+DnFUi8e8MG2cw6PsO8Tg2ccaGYidQ87d0lQawSmrjMft4OSMxNjscpCTVv7Vus7wIESDcxMQBdF+05pAA9+1wWjrab3uCfEEkfmXEQQE3yoLwHYD+wlzrygXumg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 14:59:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 14:59:40 +0000
Date: Fri, 28 Jul 2023 10:59:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ZMPX1z5DsiDLH2Cp@intel.com>
References: <20230728141322.93703-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230728141322.93703-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BY5PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: be841d41-992d-40a1-ca1f-08db8f7b4497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YqYR66L+1ImEBFrOphQBpoyH1TXpW7qcV5Kbis2FIE2uBmwJIjYlB0F115h5334eQJ+bLjNJoEeHOmNAf3B23z9Q7lV4tUD7FnpFvvd3Q1EGYnq/vKKzmjRhWybMg/L6O2fc0FZp8y7IRk5/PVHM4dCMdT1otyctQXCUQW8un5BT+SJPIMYVBsjRQASz1maEEOpSIccf1IbmXkt7tCEhqMA/mn47P9JeyrO4plU553f3Td3JAxZ3wpEqWeppErXVzDbgz/HYJMKeZuPqaSvcZItDyQ6FcMha+mJWs4cRzlrL6gkkI5RvpM+K5ydlIzaJVWhOmjBqB2Y0hEYKq2MpgO4nIw4Nuiv1dof9Uu19td8IcIpz15xktYjUGlMYp6d3YQU7PRQJmtmDWBVtTDkWv66m0S05GkATrUCuhxNoc0Oetk3PloxhRex+6zRHUqgvnH/aEULsJ29IHOR6WDdFcywMdePUWLWEb8YEanD5LIeGdqiODQ0i+0XNfdF4BypzG/xIsnqJlRNJ3YcBS6iY+Hz9yuIdcebQ8WRPLmEghmY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199021)(26005)(41300700001)(316002)(8676002)(6916009)(4326008)(8936002)(6506007)(478600001)(82960400001)(66476007)(6512007)(66946007)(966005)(66556008)(6486002)(2906002)(38100700002)(36756003)(2616005)(83380400001)(86362001)(6666004)(186003)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RXka88GEGa24AgFgtnbJBeUR601sY/Cdl7xl/syQsIi7t4GpfmI6WYHp2xK0?=
 =?us-ascii?Q?pPf9k8knUhEXbiv1wk3gEYq/6oiHrIQ/rN6+ewaNli8X8tkkyd8iaRDOgVnf?=
 =?us-ascii?Q?S00tCK2NLik/hfWD2xYEP6HWGn27veiYIBtmYJZi5t8YS2LU1jht8lKFZVDO?=
 =?us-ascii?Q?ZUq6SerFEWwCs4twC1DV0HKrwU01ckhrR2JJTIWFnNLCCQgrrIrY+qlGQ3hZ?=
 =?us-ascii?Q?NGOL1TU4obpb3hmWrmZSU8GgDfPSltTaT+AdNRRECtQTOasUwJ8gOs8Ys3Gy?=
 =?us-ascii?Q?gFetnN/FYUsQURzROTEHQBtxXLtjoJSZhj+H2pOSjdWam47V9c7viDAjRa9G?=
 =?us-ascii?Q?GUHB0xsH9+d0hVaXM/9TlafFX+VriMU70uP/CKnezf9NrWYrq54yOUu8Q0RI?=
 =?us-ascii?Q?312EShdCSihVTU0ko+0p2tRUPrhijYbNStRxU+Qg8+TF8tDg6y6nmlfqbmRu?=
 =?us-ascii?Q?UWEhRwHuWNPdjdLv+tQrDVWMt3FKfghr0PSEaNMYRU/s6OxE3yyFITm5l7Fj?=
 =?us-ascii?Q?iVonS2eW9aN7j857azyomh6NoFANfxvLSoBsdKg9dmKV/lsnTg6MM30H8KL9?=
 =?us-ascii?Q?KYStyZUxfGBpR84ZRiaC3rl5KU58Wu65Fo89pjuU31k3gvg18jFSCWbQgQjR?=
 =?us-ascii?Q?nKDeFezniurBHPCBz++jCHD0ybBJAaogoFUJfbQBVFPP6wzIU7Hdy2m8MJXe?=
 =?us-ascii?Q?SYzY8f8/rnEK0rJ/HbpUoxOfFjMRuGZ7rlwbp3O1YMJfqaYApbmoNukWHhOt?=
 =?us-ascii?Q?DQqk58tBa77uTV8MY/C9NBRyao7FFOjfAQF5mA++TgiWwkf9N8cPowlqvkNU?=
 =?us-ascii?Q?gNxgqkijguBFotNcV7ba+YGrykys1FDgRHWvD5e7p59NWvnlmL+7lsbT5Kgo?=
 =?us-ascii?Q?q4gyi8vnB+h7lOtxKrbM7oE9JYgKLW5KOOdzwReX3aOtzNvm7a8NK06goiUH?=
 =?us-ascii?Q?m6JSCfefndFWaikrxPyrQfaoeUqoD1XkGR0uKfaPxFKxSONi6htFI9gWwhzC?=
 =?us-ascii?Q?A4FQ4Ce2mDAcpiiCsyo0o4D9CHfuLObrWN07eKbv4iEq2RJpOoJ9ma1IrWwd?=
 =?us-ascii?Q?7DhXM47K5OvV8UsN8EG01OdVJz5+0fivhHRS5pJw2BZLB2MTTKzW96bHA9Su?=
 =?us-ascii?Q?A0d+RcAWJES80OErHHomIzOjL1kDdoFTXTCGa7eledidRC/WAqWL1AufcHXt?=
 =?us-ascii?Q?1PZvGHKMvi4wsfYKmfByExcZ0syd+Oy3JYeFhV2cBr4L6WRLznYtb/OQM8rs?=
 =?us-ascii?Q?e4AoW74VzYfQ0CjxSn+Rhoi8BCCr7gvcMySDOY6E0xAGImhEtfUfE5Ky+8cL?=
 =?us-ascii?Q?edJRigYVIVLlXZKIj8/6v+U7E7SXAWIfPilg20jOrCmbTr7FUojq8c/OW9CY?=
 =?us-ascii?Q?N5fV7S/vWJkh6oEnJOVH61v6zzal6hi/4oXHTPQQuaf9gF81ZmFothvjKdQf?=
 =?us-ascii?Q?LYxtubISMwPi4sbQEiWL4HukluImnyo3lx+kVIvf6fhFfzxcOiuzaj1Q3PNU?=
 =?us-ascii?Q?UPhoflH8xWOx1rbBdGClVlYEBRUzHI6aV5wjudhW4wakWjfOA1HJJ1lnX1OS?=
 =?us-ascii?Q?4VoW/Cry3IrjtV8oOpKF9BHNXnw/NaE/2nXjstwh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be841d41-992d-40a1-ca1f-08db8f7b4497
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 14:59:40.2113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +82aY74DCzoDYwRbjlUEXTv4sBW9BsThhvkfUl+hVbnxmIK5kaZqCwv+naZJjeo0W9BZRO4BtkF97ll5/9lRXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Improve s2idle handling.
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

On Fri, Jul 28, 2023 at 04:13:22PM +0200, Maarten Lankhorst wrote:
> We accidentally always pass true as s2idle argument, instead of
> calculating it in the same way as i915.
> 
> Suspend modes were removed to achieve compatibility with i915, but
> accidentally left in the source code.
> 
> While at it, fix all other cases too, s2idle will go into a D1 state and
> setting a lower power state should be handled by PCI core.
> 
> Maybe my laptop stops draining so much power during suspend now? I can
> only hope..
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h | 6 ------
>  drivers/gpu/drm/xe/xe_display.c                           | 6 ++++--
>  drivers/gpu/drm/xe/xe_pci.c                               | 6 ------
>  3 files changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
> index 9251c05dfd11..ce2b9bf3918d 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
> @@ -5,12 +5,6 @@
>  
>  #include "intel_wakeref.h"
>  
> -enum i915_drm_suspend_mode {
> -	I915_DRM_SUSPEND_IDLE,
> -	I915_DRM_SUSPEND_MEM,
> -	I915_DRM_SUSPEND_HIBERNATE,
> -};

good catch on this one. let's kill it.

> -
>  static inline void disable_rpm_wakeref_asserts(void *rpm)
>  {
>  }
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index 8e39fb7f1fc8..ec7a654bf587 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -333,6 +333,7 @@ static void intel_suspend_encoders(struct xe_device *xe)
>  
>  void xe_display_pm_suspend(struct xe_device *xe)
>  {
> +	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
>  	if (!xe->info.enable_display)
>  		return;
>  
> @@ -352,7 +353,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  
>  	intel_suspend_encoders(xe);
>  
> -	intel_opregion_suspend(xe, PCI_D3cold);
> +	intel_opregion_suspend(xe, s2idle ? PCI_D1 : PCI_D3cold);

I don't believe we need this. From what I could dig from i915 history
this was needed in some old bios. But setting the lowest d3cold
should be okay for any platform supported in xe.

>  
>  	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
>  
> @@ -361,10 +362,11 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  
>  void xe_display_pm_suspend_late(struct xe_device *xe)
>  {
> +	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
>  	if (!xe->info.enable_display)
>  		return;
>  
> -	intel_power_domains_suspend(xe, I915_DRM_SUSPEND_MEM);
> +	intel_power_domains_suspend(xe, s2idle);

hmm good catch here as well. I believe it should deserve a separated patch.

But anyway, the patch itself in general is already a good step forward,
specially if this is fixing your battery drainage. So, let's move ahead
with it and leave any bikesheding for later ;)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Btw, please check https://patchwork.freedesktop.org/series/121336/ that
maybe affects you as well.

>
>  	intel_display_power_suspend_late(xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 78df43c20cd2..63387d99b3ed 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -728,10 +728,6 @@ static int xe_pci_suspend(struct device *dev)
>  	pci_save_state(pdev);
>  	pci_disable_device(pdev);
>  
> -	err = pci_set_power_state(pdev, PCI_D3hot);
> -	if (err)
> -		return err;

yeap, we likely don't need to toggle ourselves the pci state on the
regular suspend/resume path.

> -
>  	return 0;
>  }
>  
> @@ -744,8 +740,6 @@ static int xe_pci_resume(struct device *dev)
>  	if (err)
>  		return err;
>  
> -	pci_restore_state(pdev);
> -
>  	err = pci_enable_device(pdev);
>  	if (err)
>  		return err;
> -- 
> 2.39.2
> 
