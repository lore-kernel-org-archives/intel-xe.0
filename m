Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C6DC7EE2E
	for <intel-xe@archiver.kernel.org>; Mon, 27 Feb 2023 22:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA03110E1ED;
	Mon, 27 Feb 2023 22:59:37 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C8A10E1F1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Feb 2023 22:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677538775; x=1709074775;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q9IBwyK9b1sHM7JK3aMysaKvjd6lXy0lEC+EJnX4tgI=;
 b=DHWh756yjO6jzf4JG76QI/HsE3lfxZOXuqTwJqEJbfaa7Qx9Md8Cp/Au
 984X6bi93ssxuE/Xx6+JXgqJykM41efjTzxBMgB480x98fDtJlBqViPTp
 YoxqT/dKS3WJz7ELt+z/W7peA7Y/TWOpqHF5wREaxx9l/M3UerY1bLRl4
 6Kzc1YVoh82c3z1/71nAqcGLuSSTXVnAiEpJGegZ1Bk1twJKrkjpcXcNv
 4gMR7/7sP5GnnZ7CsKNa7zpIUU2Odr0lbqyiLn/eaathYLCxxjKPmPYOV
 BtRH48+5NIqFnIyDAM5bRtlvffyZAxeSRxgOCrBkLVjfqkBTBikkirzIZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="335477265"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="335477265"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 14:59:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="742742360"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="742742360"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 27 Feb 2023 14:59:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 14:59:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 27 Feb 2023 14:59:34 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 27 Feb 2023 14:59:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjiH4wvH4mm5w/YlqgHJOutH/MqmnNYITqI3LQh7+GtoGzD9Gf09/UqG8Bpu38SlvywmaYv6hSkwRVE3f75mFE3mBLVK5KJnKeMGumDmcGuGjhDcBQ6XCyoZTrKy2h2Lnc2MS/94XpndeXCtfXBdL/8wIXB279CT9qurdKjEDvGpd/7qsJM941mIgrd8K5A6Ctdh4LXKitAMv1l/2Nabua7mvsNtYSYeHN5weXIWXJA4Ub4eS84jwEhifFL4l7FWYNiE/jfzAJTIMYRekSDsqPoWfHRL4/dlvEj0w5RDcOth4weglb/EYc3b4kga4E6pawxrwtJbJaIPTB6zEp9Opg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqREI+dB1m61CSZKYoJbZTYidBLK9CdUWX1q28r75TI=;
 b=U4sRKUkPSc+VUco7cK/KgZroY5piu2+ZUoeQSYhh396SXayvxeND90p7lDr2X5zzS40RSCucqdnhh5dDyWSNaSlSmqdtS5jMWDC6WSmm/LMZwhrVNk05sW9KoSsb/4wmPhx5U21UPYkeIw/qIUVGGOo7/kqmycX7sPzjr352w8BaEdFXFmBMH0TXpQdh2g/aRAPElpyydhQQQ0mq0nte968nGJtRZWihmTe8Wi+MXrvByoTopaDq7ZsnrsJ8uA69Odl3J2rSQzeB0YPGCi2mg/uHTuvyVytulZfQMwUzJpaUVXB07OkFWZIllRV7fzQfbMwOFcpON12UubcafGZrSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.25; Mon, 27 Feb 2023 22:59:31 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6134.025; Mon, 27 Feb 2023
 22:59:31 +0000
Date: Mon, 27 Feb 2023 14:59:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/010MFqCOF0ObXp@mdroper-desk1.amr.corp.intel.com>
References: <20230225002138.1759016-1-lucas.demarchi@intel.com>
 <20230225002138.1759016-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230225002138.1759016-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::45) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW3PR11MB4684:EE_
X-MS-Office365-Filtering-Correlation-Id: e30aadd3-c170-4eb8-554d-08db19164943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pt68MJpwbD4Z34u1OV2XBZ4N5H3FfIBI8uleJ7kWrzsXC8VOYwoXZOzq2JDBB6gP0/94YrNeo2acSovlGrlT7wj8bZmUifpHY2vHAhAa3cs9OsEwUnwI4u2vv2Yw21XTx/vkKKCSyA5v5A1gIBQOJVU7X0WbPohiBFAgXQUC33re3hPdVuPrOxPrp+ycLyNM2S8OlX3XXt/q45Vu8zNEZmBPtu1bPlHMRrRgW7i3+14DJcwCxwLxN1BU5//TjoE1U0Kjle2hU22FNjOs+2gfnELy41rGbJX5NYXeQ9RpsgxzzwcvQz/dFoHMWMMU2YRQh8jbOU094ByRDu1VfR5oWTPAQ9OSPVd4dpdRmayglJWrq+3HF9kZt1z3k9NEioQeeDszbUW9mHLKYeJ5EmgQEzrLMeW5f/RCPI6/q+T7C3NAo74bD2Y4N1H/Y6hXVj4xJjG0slVtovwaaF9WKmSWzGftC9TCEy07XejcmXWOfdAZOyyxlrfSWvqFjVuMdjSqE/a5XRO3l7ufbsJDHhEIsFJdepCtVz2gS9Y0GTZtBZQ0gfoP4c2uONvdPXq8gq8fiee898hmAuhASh5UF7WWWoCExQgRdg9PFDlWUA6H4CV3WutD7unXrNyaLFBy2OxZ4F0/nR/VK267sqqzNyLOzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199018)(86362001)(66946007)(478600001)(41300700001)(66556008)(4326008)(6862004)(8676002)(66476007)(8936002)(6636002)(316002)(2906002)(5660300002)(186003)(83380400001)(26005)(6666004)(6512007)(6506007)(82960400001)(38100700002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O8KZP30j4qxNp66aCtCdb9jXqOtFlQbL5USQPIWkPoWvbBUvgDZodqJXHaRF?=
 =?us-ascii?Q?eWiCdobL407dSPggPASnnnJo6pwavqLfiuPhdB2ECDnHdDTxn9KS87nd/HhB?=
 =?us-ascii?Q?x6CI0KFTft8boHRzLyyqBejFPZDFjoF2klZUZkyXTIUIENk/Yf8UTrNJ/64W?=
 =?us-ascii?Q?L3jegzGNrzgl/hnv8VBcFlenRkjSR2hRcUXtUXtkNDglb4UNrYmjHqFuGTv5?=
 =?us-ascii?Q?art2YS0NMatVuJtYjqAye8tlVlpuUu1YGbYg8QTQOoKo4P7/K23UFwGTfyhp?=
 =?us-ascii?Q?0ewOUBP0Knpr/DhgUdeDCjCmJ/bgA3Uf1cvc/58zP+QwKuJyzzVmHFAUH+9F?=
 =?us-ascii?Q?tV2gGf9jicrFUyMI621tDtlKGGHVx2s9ZFB7/U04vs+J4S0G3xa9bcNB2uo1?=
 =?us-ascii?Q?BbPlbDp0hTF9u49Yhai2ri3ZNHxsyvOTJwFTneCMu4AqM6J1ftP9uSxvvs04?=
 =?us-ascii?Q?pmt6OT9uQNprvIuGj1IRgHhliM8N/Et+3ncDZzcWr0McBPkGflLhYw8K++1/?=
 =?us-ascii?Q?fHptMXySJQLZcXV6P3qryptUzgL2pnJ5F6X/OdZRg9xEskbMEfoTyx2ge9g3?=
 =?us-ascii?Q?CHczh+2n7xzvnxVJcX8AWxSkGEq2C3HG83WbvmTLVv+jVBynlY780hsJcBrD?=
 =?us-ascii?Q?/Lfn8uFbQhutLSV/q+Zl4IuZegDJsQROxo7F3mm6C5oq99f7sGsPeek8J0R7?=
 =?us-ascii?Q?+4SvRAQgcr6QFw5R0qZ2gVNGk+hl4pZDHTA9aSySUL86AbOz/jDCFaLCCeif?=
 =?us-ascii?Q?p2/mGSH7+S9gAZ1NmT22nHqBGap4GNqbLWm+ABIP9ZX+9Jx6aHj5FGZQT8q8?=
 =?us-ascii?Q?NPBQ8eUz0de6qeNdAj/2tA88aFdOQaFK+t0KluCXtK11kcyRiBfuEIbX8rF9?=
 =?us-ascii?Q?O1Jd0WTMYu2hOxcm+npYa+1DuNQE/9NTgz6qn/SGyo1LWtmsEk9FGX0/2OSY?=
 =?us-ascii?Q?RZnVXBiWD5Z2MjYOQsJWudUD7oGpoaKqyysWaxquuIoVbznAgXtz4IG0aGn8?=
 =?us-ascii?Q?gNXzTVQL9IKv4RD6f6osBSVTANehZqbJzdYOv09bxn/oCpXQt8kHMsvKZbst?=
 =?us-ascii?Q?JZ/9UXVRWathcyFA/UhwDumk/RC1EmoywhFL9t16zpUroDV8qH++FQ0UwK4h?=
 =?us-ascii?Q?ksRJEhYSvNzVYJo4iI8WluM4xEcOGV9NGk08Uai1AgBSKgkKheyxq+8AI3aI?=
 =?us-ascii?Q?zBZzIizunWOHmT5Gk9TQvfn7ossHwgdmDFuN+UBo9B/5YBXnjfaH8TQ6YZ8y?=
 =?us-ascii?Q?lv6/ge9/9qaYvavd6bQ14ttaQQBPiW1B7xd5Dw3bOejLCHrhC1fbFuyDpS37?=
 =?us-ascii?Q?/xnVZl+UDTlZXAGiH+F4iSoj+UbdscDQSTLiWtFHe41iakLjuHbqgclaxZG5?=
 =?us-ascii?Q?RZsIxY1rfEaolx2QebTv0Q5VpCfFXNILwL2CVGapZdeoWali1xoX3ME9Q648?=
 =?us-ascii?Q?VhcIQujZBij/EgEjzsyGnasJYDsLpi/RZKXbHb0CsioXyqcvHv9nMU5ry1rb?=
 =?us-ascii?Q?kBafQ5rxvWtYDUneMhUpH399WJ0Y5W1zUVM1vWCPat5M3nyq0V6If3IptvNx?=
 =?us-ascii?Q?zzW9uRNaHyBjTFgQZ9rN3TGT5beJ0/CwNIX3l2h7Z75PUIVvN8t0+L1jJrq0?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e30aadd3-c170-4eb8-554d-08db19164943
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 22:59:31.4213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sEfMN31lmkvbe69YaGDTqoh0oy5E5tYTyz4V2Qn8/OISN5ybS4fEATBVIzhBLgJrMJLQryDjaRr1GH9kNUQ5SVz9V1xJLN9Lwg1q4zhFxfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4684
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/device: Prefer the drm-managed
 mutex_init
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

On Fri, Feb 24, 2023 at 04:21:37PM -0800, Lucas De Marchi wrote:
> There's inconsistent use of mutex_init(), in xe_device_create(), with
> several of them never calling mutex_destroy() in xe_device_destroy().
> Migrate all of them to drmm_mutex_init(), so the destroy part is
> automatically called.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index a028efa8eebe..5e2f5d93f2ce 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -159,7 +159,6 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  
>  	destroy_workqueue(xe->display.hotplug.dp_wq);
>  	destroy_workqueue(xe->ordered_wq);
> -	mutex_destroy(&xe->persitent_engines.lock);
>  	ttm_device_fini(&xe->ttm);
>  }
>  
> @@ -196,10 +195,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  
>  	init_waitqueue_head(&xe->ufence_wq);
>  
> -	mutex_init(&xe->usm.lock);
> +	drmm_mutex_init(&xe->drm, &xe->usm.lock);
>  	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC1);
>  
> -	mutex_init(&xe->persitent_engines.lock);
> +	drmm_mutex_init(&xe->drm, &xe->persitent_engines.lock);
>  	INIT_LIST_HEAD(&xe->persitent_engines.list);

I'm guessing this was supposed to be "persistent" rather than
"persitent?"  But the typo has propagated to so many places in the code
now, that changing it would need to be a separate patch.

>  
>  	spin_lock_init(&xe->pinned.lock);
> @@ -213,12 +212,12 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	/* Initialize display parts here.. */
>  	spin_lock_init(&xe->display.fb_tracking.lock);
>  
> -	mutex_init(&xe->sb_lock);
> -	mutex_init(&xe->display.backlight.lock);
> -	mutex_init(&xe->display.audio.mutex);
> -	mutex_init(&xe->display.wm.wm_mutex);
> -	mutex_init(&xe->display.pps.mutex);
> -	mutex_init(&xe->display.hdcp.comp_mutex);
> +	drmm_mutex_init(&xe->drm, &xe->sb_lock);
> +	drmm_mutex_init(&xe->drm, &xe->display.backlight.lock);
> +	drmm_mutex_init(&xe->drm, &xe->display.audio.mutex);
> +	drmm_mutex_init(&xe->drm, &xe->display.wm.wm_mutex);
> +	drmm_mutex_init(&xe->drm, &xe->display.pps.mutex);
> +	drmm_mutex_init(&xe->drm, &xe->display.hdcp.comp_mutex);

It looks like we've never bothered to destroy these in i915 either.

I sort of feel like we shouldn't even be initializing display mutexes
like this in xe at all.  Rather i915's shared display code should just
be exposing something like an intel_display_early_init() function that
will take care of doing the basic data structure setup for a 'struct
intel_display' and that can be called by either driver's general init.
Then when someone adds a new display mutex to i915, we don't have to go
duplicate the same initialization on the Xe side as well.

Anway, we can move in that direction with future series, so not a
blocker here.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  	xe->enabled_irq_mask = ~0;
>  
>  	xe->params.invert_brightness = -1;
> @@ -236,7 +235,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	if (err)
>  		goto err;
>  
> -	mutex_init(&xe->mem_access.lock);
> +	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
> +
>  	return xe;
>  
>  err_put:
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
