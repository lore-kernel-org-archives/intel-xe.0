Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281E8EB64D8
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 20:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8ED710E683;
	Fri, 16 Jun 2023 20:05:47 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5FC10E683
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 20:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686945946; x=1718481946;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8KxkkKjQUXxF8dyxZZuFuZes0Ao8uQNOWYbjRXcaUJE=;
 b=UnnWkgVZ0qkRb/SHFHwlChh9AdLrqvvAdd6PqtxNAxDwVSwA/lI/14x9
 WH++KCRINdtatm1yFfGtLchKxQrxibsqOD0ciwPHD/q9eTnZhNtM7SBg4
 rxtpvDBQv6ohcU9uRzMIlLN6v2lQOqB/V5FSNxueQ+tTD+MGGwHH9Cwtv
 ZuDgmtcQcDO7v9rJ793gYQAblxLYPF225Bjw73XKQfsQ0YadRYqXaSiwC
 ZTflczs0SRfyUmeICMeDwaMx2xAzugzIwJ55f/nppnIfnVaE50FwrP6vU
 jYZVRrVrhpNSDA2wAfUXyGW7uYM2AdL23zbDxWF0pVcGMAxXjQlyxM0Z+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="422955345"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="422955345"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 13:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="716148133"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="716148133"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 16 Jun 2023 13:05:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 13:05:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 13:05:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 13:05:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 13:05:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7cvIZEaJNR3fdu7AplzDmmY7XeDqOc3lrrtCXPWLFftknmJ00ikzIMa7zpz/Btsl51XCDpWUckBvkktQgJOjh5bib0nzVrwiasI1dBUvWKZAGS1pn9xz0Vbn6QnWVygaZcNgl5M+c8mjefgwS/Vjds5k9zD2FtriDoBcaEf68SZHrJtgw0EJbWio26eSNK37PEt5pVItYNIylz2jY0fcf0+BDg/ap6b8w6Xhd1Ypw4L5BASRlNOTrrOS5rvPNq321ogPO9TPbZAPDpiLPOLc+6KPG+mMa8p6lHKOgGwHv4UT8wWgA0JucWlc3Ar00AI8+tp1VByBJz3DGplUeaVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTuy9LDdn78htW7R9qXUUEqYoawgKBpIK+S7KUcxQA8=;
 b=Xur+kQ8GcVO4sHpxYx+IOOzg0mqYlDbitWS2NZJyj9dsvTMFk09wxuhUNKf6wed3lid+I+C2ZndjK5VXdQROasoYIZgLTEguwSNJatkiZ3YsGV4laMWDPAK9EGMQLkYGcG9etqhq/wsU7vu7b6RTQ3FQtizlUEdD5PAzPY89geExp9FDdxBu6rtLNE1tzgbiVvNOQKOJ7N8gAHRCpm34IEvPWQiijehPXm2xQXbtHnV2YmNuhj9BB26LZHUt7vonISNZopSaBItUEehby6hEWSNrNQrKXzObt1DJoQZ/bZMerpUZ/ywTGyrFeTY9FaKBKbIS6crdoGmZJ2DrUd6ZLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8231.namprd11.prod.outlook.com (2603:10b6:8:15c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 16 Jun
 2023 20:05:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 20:05:41 +0000
Date: Fri, 16 Jun 2023 20:05:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <ZIzAcvfQnGQvDMb7@DUT025-TGLU.fm.intel.com>
References: <20230616141115.1128000-1-anshuman.gupta@intel.com>
 <20230616141115.1128000-2-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230616141115.1128000-2-anshuman.gupta@intel.com>
X-ClientProxiedBy: BYAPR01CA0057.prod.exchangelabs.com (2603:10b6:a03:94::34)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f3a61d-707f-4232-4a81-08db6ea50f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bKbtQHpQc68OQpAOenpNaN5oHWhWcB1ZRzhzcAslNaUL9a9zqTOO9+bpDOAb1g+9ti6Vi3SshP8kmLwq7K3OGnaSSC6YYJeeZ9++jrLGgU0+xwAYmTDbU1S9AasM9XM2hD0iIM1Yu94PLL0rvfp1m+1KMLzd2l7WzPcaaNrdlDT+zKc2FGazcRLO877bC2v1Mik+EXNwlipIZjeiAiHD9bGBOqVXDMBJYiakoDjqSlnYqrZ9ltV31I8MIVvukUamylE8c+Pj26auAYqlgPbh4ZqToVFUx2oR3HZZqyTlUpQcWen0UoShp/cyEf2Wml0Cjjo7Bmz6+4D6kba0ZHztNKrhNG8Moo+n7VnWgXhLl0uYOAnYk6+/FSf5ub1gsG9BaHON2G5IFibiEQZC92I+aK3zmE4mvJ3vPm+6IvfqKhD8pzvGyV7rjvAspjK9XL7KuL4bvQ8lx1aEHrSOl03hQFSAgK0sDYL0dmo5ZEFvcYmKF0166hf5Sr4yPnF/3TmG1mYH3BjuOvfRGtdLJmXkBehnaXvcLsw0ZsdIi238SnaqKvZEwfyh+Oqm7fQ8aVpX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(39860400002)(366004)(376002)(136003)(451199021)(2906002)(38100700002)(6486002)(478600001)(4326008)(6636002)(66476007)(66556008)(66946007)(6666004)(316002)(86362001)(26005)(6506007)(6512007)(83380400001)(186003)(82960400001)(107886003)(8936002)(41300700001)(5660300002)(6862004)(8676002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/RloTOMn9fHl95GplIDEqocJEM108qybfFNQW1lb4PKJljzilzwHjGXAxOaj?=
 =?us-ascii?Q?jkfdr2QmzCMvN5h0j3LFXlzvd5z73OGPaI3dRvxIb1uR35WOwKwGW8XGZ4v0?=
 =?us-ascii?Q?Oit6YBDerBrZ+vPZiB21MIWbWD/qWuf5KgiV0UJDC2U5JB2nqG0Fy5oMkFSB?=
 =?us-ascii?Q?xEyyGC3EcvVop5aDu4hvka9y7RVWAGk4jnnX+8/RrqE/1rh42VDiKo9ixP67?=
 =?us-ascii?Q?ak/Hjsnb049rw1pR7h9TLoDL6XbMmKhhaBb3AwXwb5NC38IKvGcwvArBERm9?=
 =?us-ascii?Q?Ez09U8pCnjRVprBQOB+a0rjLABOnNDUopTwiSXcS9PTGfcbl2Bte9BcEb9ed?=
 =?us-ascii?Q?EvrXtwZtlkodmY9n99WoImTepxDj++OBJiHMwVkAedWxWvBkthvgKKhaP54q?=
 =?us-ascii?Q?zcJPPI22v9LS39MzFRlYdigMKiVmAhHk05Pak4tVCnvZS9vxebybylCU4m1V?=
 =?us-ascii?Q?iWV2buzHs8XQZHlMRsBj2Wf7ey3u6BZm66ysTMpzAtcllGV1Qt6xqq865pGI?=
 =?us-ascii?Q?zhnXnrI7CNaFEQF1U2CbxD4WkAqNz72YyoKY25YQyrAfeOKcPW+0Ax9P6sQj?=
 =?us-ascii?Q?Ns9cUVglPxyXksIainFlzq0bSek0wm+afXM5v7or2Xfl4iMNw0Zlak2ty1rG?=
 =?us-ascii?Q?D0QvG4e/pa/7T3CiTfLIwh5B9Gt5pDocnIbwhdDu+5qCyE/Bkl/169fosoNi?=
 =?us-ascii?Q?BdS5N0u/WHZStrXjOF7qfLiTufTkRvtf48WsmjUZV80YzHo8IPSmjbWG51Re?=
 =?us-ascii?Q?ytsF0GAL/ku56CNS//YhbbEnySH6+KJFN5uDBfxrlMYAHwlFTIknTaEHYbf8?=
 =?us-ascii?Q?s5hu+SsYMRbr1klwKgxFdo8p7DXHd76wjj1gkXug/FnSjVd5m8BxRzCyymWQ?=
 =?us-ascii?Q?Q20o/bYGdb8m+QozPulCN75w2QPODKlITYh0z1j4ri2s/ucVIIPg9tLlMDRm?=
 =?us-ascii?Q?KzwnGhmIgXplNhovWVUMn0mL1S4eK7+mbP3borQbU11peH1EFxHA5n1aMrMb?=
 =?us-ascii?Q?hqI6jxqfol7EjWjgI8fQ9V2ZDSGsLA3e4v/y+4lsHV8kg0EhaWWtKcb9GaA+?=
 =?us-ascii?Q?GnYX3qMmXQEeM+qMP6SeSErPIooty383ghZSUW2Sz+f8lsai+PDFLPhUeE5h?=
 =?us-ascii?Q?uG5m8X8w96zDDnb9MvlBabE2uTOBxG5T9bwv+ZzyIh3fagY4q9jJH8A1WyCy?=
 =?us-ascii?Q?oB4gLq+2eqq+JynvijV+Kylj/W7KhrTbAAFSKVdvt1z52R1aIR4XpzBHNWHC?=
 =?us-ascii?Q?h0ky3YDBBN2Yp66oZ3yXnu2rsSWLsIemR01w4VxkKbotfebCChDsBn23/tEY?=
 =?us-ascii?Q?jNl7L9lwj2DfqdnL5etRQAxRrofvjVtu7fTHmwrJt0W3SXvp+ZRgRIYHIX9y?=
 =?us-ascii?Q?Kxeff3sqmGgDyu9n7te+NTIfGOTi82DYQiIsjMdfIKyFKVJBtG+vYZJ5FYKG?=
 =?us-ascii?Q?IvzszYCht3VIxlEF4dd27Gr9rU70+sj5XKCL8wrBvoUYNWwv+Qwjp0ss7JEV?=
 =?us-ascii?Q?Hz7P7Bo4Ak3W5tswg8IdATYj7imNrx975wjraj4V0kBNOU/lZ2oFSAR198dX?=
 =?us-ascii?Q?zFOMBJ+eNtdzr2C6LaQhhWQ83+HhAOJ0UrvZQ3X4KYZD9nYOWhGKiu4g470L?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f3a61d-707f-4232-4a81-08db6ea50f71
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 20:05:41.2579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpYRM7/jMyp6Lu0pHXNM2qLgDecxhZ0j0HYwm88uwXoq4/wfGVDyghSKjk96gBRnmV7HK5v+pZrOPrrndJVMhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8231
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/pm: Wrap pm_runtime_suspended
 with power.lock
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
Cc: sujaritha.sundaresan@intel.com, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jun 16, 2023 at 07:41:14PM +0530, Anshuman Gupta wrote:
> pm_runtime_suspended() doc has requirement to use it with
> PM lock of @dev to get the trusted value.
> Wrap pm_runtime_suspended within xe_pm_runtime_suspended()
> with proper locking.
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index b7b57f10ba25..04c5353ba870 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -210,11 +210,23 @@ int xe_pm_runtime_put(struct xe_device *xe)
>  	return pm_runtime_put_autosuspend(xe->drm.dev);
>  }
>  
> +static bool xe_pm_runtime_suspended(struct xe_device *xe)
> +{
> +	unsigned long flags;
> +	bool suspended;
> +
> +	spin_lock_irqsave(&xe->drm.dev->power.lock, flags);
> +	suspended = pm_runtime_suspended(xe->drm.dev);
> +	spin_unlock_irqrestore(&xe->drm.dev->power.lock, flags);

A few things.

First, you probably can make this spin_lock_irq / spin_unlock_irq
as IRQ contexts are not really used in Xe it is doubtful this function
would ever be called from an unknown context.

Second, I have questions if this patch is actually doing anything
useful. Yes, I can see doc which indicates that pm_runtime_suspended can
only be trusted if the lock is held but looking at the code paths where
xe_pm_runtime_suspended is called unsure how this lock helps.

e.g. How is this better?
if (trusted value)
	now the trusted value can change, do something
	
Than?
if (untrusted value)
	do something

Also if you look all over kernel pm_runtime_suspended is called
frequently dev->power.lock.

Matt

> +
> +	return suspended;
> +}
> +
>  /* Return true if resume operation happened and usage count was increased */
>  bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe)
>  {
>  	/* In case we are suspended we need to immediately wake up */
> -	if (pm_runtime_suspended(xe->drm.dev))
> +	if (xe_pm_runtime_suspended(xe))
>  		return !pm_runtime_resume_and_get(xe->drm.dev);
>  
>  	return false;
> @@ -222,6 +234,6 @@ bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe)
>  
>  int xe_pm_runtime_get_if_active(struct xe_device *xe)
>  {
> -	WARN_ON(pm_runtime_suspended(xe->drm.dev));
> +	WARN_ON(xe_pm_runtime_suspended(xe));
>  	return pm_runtime_get_if_active(xe->drm.dev, true);
>  }
> -- 
> 2.38.0
> 
