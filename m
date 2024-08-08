Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DEBC52D6F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 03:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B6D10E09F;
	Thu,  8 Aug 2024 03:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwQkDWaH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD90910E09F
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 03:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723086892; x=1754622892;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SJJLmpFIkN3tyiD57B+NQNbKEFePphmFnusruMbBMOg=;
 b=dwQkDWaHMJ4Ip2Ah3KF/Z2UfcnWXgGemdx2NU1GOq5PK5FITDnMGCMy3
 vHz2nm2N13OF+FgRhjQxR4iT1BDoDu8Hu2PmjiJgAC2fjAHafPMpvbBck
 KznbHdBczB46G8r4qrTQNUXkgADgemoPaSAOu2y8O1MZPM3bqgmZntM74
 Js6IT3RUFfFmWQDqSQI4IRIUBsdxS7SXcw2apmpLCR/yH8R/Ay1wCtwOn
 JaMtMQZLBoTrMXBXjBjT5Xv/oIhHCSbJwURodF1xwnHOJ0Z32bXl5GoVd
 Rm7/r2JmWHw8UeuV2l93+L48ZkIn8X4CmvOwK47GQC1Qw3J8RNR8f4z7A A==;
X-CSE-ConnectionGUID: 1BN5C235T1qSiU7Ku1yR/Q==
X-CSE-MsgGUID: qgF/tTCWTr2SpKutJElY5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31861366"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="31861366"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 20:14:50 -0700
X-CSE-ConnectionGUID: JfyzUIG0Qq+BWtO3+zfeIg==
X-CSE-MsgGUID: F66FZkG3SBC7XJqTKPAjJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="61477499"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 20:14:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:14:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 20:14:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 20:14:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbVfpZJmQGMEq1mtZlO05NGsKppaxEEBifM8OSvpAuSzpGFO5Kctxnb9dhGkd0g2XsP0kawRozwSSD0OpO4vMT4d4C39ypUcitMW+CQ7i3jBzDcXDchaLidIy/BNt++IFZlCmcnuhnIWt7YUxhTmxrdz3TIm7GolLyBZ7j8CVSSe8Qbb3+eRaxYRMnzE6n5R3zhpzQN2dFxmTiI/iLAv3w6zjRA7RbSA3P283qkrNbeS0P3ntpSuj+dSx0w7KaVAFQoEBbbmZ5u79hACTPJXKjMNiMUU4QprOz4xIGXbC3eFo235qZsRwAA0ukKKRW0CYCFyybrJO4nTZl03va2rQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o84foZ9aJLh7ugk5XDeOp8F9EccAkk8XUmT++Y2X2NA=;
 b=LWjhMTmEKJgdg9QGPwUWyMkfShh7jghQ/XttreWVS55+HjE63QufL4l93OAUsT+lXnwNsta8uvnzbZ/kdYMScyMXhaihl6DP/X6D8HvoJ1YVgUyFQWS6K9XpxKgy8JHCIqTE5CX0ZKP2YiKHZbQeZwmpHmrI2cN4ZxN2Vwz4On1nKFrGh5ujX2Wqvd7WAqMb0o0CY9YYfd0JqMOaPccpfdaEa0EqsBSJD36TS5/ctpya8JZw9Nf/txOlAcEkmxTuRECud/AQlrlS2v1AQhuf9zTrRkS6xT0hyY0giU9+2HWe8vUnyGbBHxPffmrvhgL/6kEpxjBCckqRcOFEwTHirQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8171.namprd11.prod.outlook.com (2603:10b6:208:471::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Thu, 8 Aug
 2024 03:14:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 03:14:41 +0000
Date: Thu, 8 Aug 2024 03:13:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 02/13] drm/xe/guc_submit: Make suspend_wait
 interruptible
Message-ID: <ZrQ30ibvoh+4QMIj@DUT025-TGLU.fm.intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
 <20240807162416.1307061-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807162416.1307061-3-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: 265d575e-7435-4f0a-4a3a-08dcb7583e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ArxfjLN44CPkOhrlk9pQiCbJ5BWX90WADZ5AwZzkD7OZNOE5po/6IKvY5Pwh?=
 =?us-ascii?Q?KiAR3M1FVehEm/OqTgqf+akmLaecn0Ygk1f+p+yHk2s+HyzKqdjOsS3w/nbY?=
 =?us-ascii?Q?Se7fRGXtiPrE3D6635Eox1iPZHew6jtX1IHqz06qpLikerqs59JgzJw5FEfc?=
 =?us-ascii?Q?WFQwJ6Fxx8HowxtX3TO0eKNSmFcbekQ1cbwXxBY9zfr7uUcDMoPrGoy4vbPc?=
 =?us-ascii?Q?jNIqOLcdTay64IyjIgtzh2BP6LlXXXbvo1nrRe5yX5QZf48hSrtuR+pjUQMa?=
 =?us-ascii?Q?KreEMQI8VoKyAwgcv7OODI9humfrlAP2DmE5MM7tGpYW7u0+jSrvFuNqdWQJ?=
 =?us-ascii?Q?+SLk0tr+dkUVpCeDjwNt1tj5lvULcCdP+Wkh+xE5kvAwVdydMTdt6i4V2na4?=
 =?us-ascii?Q?wXa/k3ct75EFTzEwcMsbzYQCOdhqFd0rJSVNsTxou5233HD70hXWJAfBT3Wy?=
 =?us-ascii?Q?+esDVYNy/I0GzQumJpB3WSZXxu+GT9FWosW8pj3bqYIXFbpoF5y9kzG4tAUc?=
 =?us-ascii?Q?sm13Imiw+EGi5dx75rD2u5e8ERhk2iF1NPcKupsf7TraLfynXH3obGWBJh5J?=
 =?us-ascii?Q?emXRPPXpLCkuWgdd/vC8JLfwMMm+32d2V83+eW07Mwu1bU2h92Q4G4UYEzfm?=
 =?us-ascii?Q?/U3X7Uz5L6xVT7h70QTOnxUcnxXi3j4uPeSmTuEKWHKqKU9FaJMnOcrvBn6X?=
 =?us-ascii?Q?+XyVe68zZsm++05KpYVZ3PWPURSZuG9lweSxJJD+tiZbwuizlkR8aPIUfSLF?=
 =?us-ascii?Q?pnIN7dhVivVToEyKQfuR4DhC3447Jh4QZk4mgirkGunCH0Kl9lTrnKuTJdfa?=
 =?us-ascii?Q?Z2UGupirrioXKkBDZ9pKtZrKUdp6axTXapd67VyAUxNuw3tFfNONkzPE8vht?=
 =?us-ascii?Q?biOn5CA969OmJNZW7TuVlj9ehEyDBF9eHTw8T5a4ZK4ocuKo+p0phBxUGF+X?=
 =?us-ascii?Q?NGlfDaYvHwEYYEkBjHBbAkqewpVzAqyA+RvpNHGPYJ8Fl+kKcGSQEYFvG840?=
 =?us-ascii?Q?nnKnspUiFDjagSdNELxWCOKNCtMuYaEFZduE2+JqcZXqxg7gVTe6m6RpDoUb?=
 =?us-ascii?Q?Qr8MDoBShS3T2G7Szli+wy3+jG/4+dkabjVVvlZKpHuZbijIOwxtn3z66yu8?=
 =?us-ascii?Q?SO7753gkUbMlK1duRLNcYGOxAVYSxuZ7g2FVr424zEGhtZQ+nqFJnHWh3F4J?=
 =?us-ascii?Q?TWCSYFV5CTRfWDd2VElPnf7J0VxpKxbYD3/cHUK3ga6ggLpl/aRkilWFHJlB?=
 =?us-ascii?Q?u96qaYTuTdaNQhLupU5hDVplcYl64n/bcgUaQy68XdYpqHnde3XsrifNYuw+?=
 =?us-ascii?Q?ePpHx+NPscEcejTGBDAL+yZpsX/sfw6+cX/5er3SOv9hHw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mbntfWVf1KEdNhcvvUYqlAC2BKJ5RvckAYIPoV6uJLotndP66BjzuJkFPBWz?=
 =?us-ascii?Q?XjHNwayeCa1+EIvNfoITzojwI5HDYkRbyJUZYHScPcd2fIhl6VNMnZzX9JhC?=
 =?us-ascii?Q?nciqHsSph2kNrgAZEFJvVMsy5vL7DCSpp56mgjgIn2ml6mBk468y/sNB7XLl?=
 =?us-ascii?Q?N+ufTaSgwYee3mR9fur9PjW4qROOWu11Q3Jk2YIQCmhSi8Ly9TvX1y2sW1b8?=
 =?us-ascii?Q?ukfTQDixLZee3xWWpt7qhikDzsBKT9AyOEcwipAOmIaQ9gmXuA2fxqcPRPZ2?=
 =?us-ascii?Q?TRQN4SRXSALmsIFc8OxNtMHFArhMu2BWjB3GVgpoUYNXkC2ghyWl/4+btyVL?=
 =?us-ascii?Q?68d14kMU/9tUIxPSaBOZqo181H4NxQAm7dYOCX13T2xsMzOtaLxajafl9z4d?=
 =?us-ascii?Q?9+Qm8rrtikZXCxYTYgf3OS4tGUbiO+kglB6WEvMRgRWWgi/dPSd5cfTko/yz?=
 =?us-ascii?Q?TXuSdJB/DnG9XEGohpPL7n1c/0Q0DRkBtnBqvpfY8VcImFGxi1w75NMC6h/i?=
 =?us-ascii?Q?e53O+T0T1RBs/wJFW4nzr7fmUyBh6noYPZ8L7XUP4xx7hXaShI8TfWEgLd4I?=
 =?us-ascii?Q?j6qfyoF1rt8SyfpolrMRuISCEZ+tVnt+BR7s5335Q3niBFBuw8NDM/Ig7xLB?=
 =?us-ascii?Q?FpIA6K0ZujobFLzAyG4xMqwYv25VbpSq2Hpb4EzVhcN3B50iWCCvPUH8LcWL?=
 =?us-ascii?Q?SLl03jzzyod6o0ls2GdGf+R5kpTbg319aSEobypQ2C56YNzZ10C5SZegNGeK?=
 =?us-ascii?Q?2ZuWxq80Bv+flTMdQdqpTJZFxp2Tc9Pk/UZCMVOrXJyJWbVId3BR6ZUuVQ/S?=
 =?us-ascii?Q?F9O0UfvqZ6IyiXj2XLQQytUERsDedUaXwhE62F6QrSG2zXNQspUVVj5AoDSL?=
 =?us-ascii?Q?XWLJiMlo5y4g1t6Wq+X7MJCIwKNtSHwhGq03WP0nOrtaaxko/HCSHJF0lMy3?=
 =?us-ascii?Q?SorKTF9J7ITa70S6UXxZvE72L4bcsYpEnoYU7/kGPYBKCO8v1ZZHHD6ghoe4?=
 =?us-ascii?Q?AaKEeI1eb7yDO0cfReuZ1U8ZGvJTAN052Tb+YI/DnBh3zxAHV4+F0Ppzfko6?=
 =?us-ascii?Q?madObYdcRN/EiTexKU7TLKxHN9drkyUrceC9RzJlzVTOEhikpzEdd8uABWdH?=
 =?us-ascii?Q?WUYAR8aBnhvSVSN2Y4mjnRuBIDHyb5i1i6CMBmeSzrfiW2GvNU/lMtM0oag+?=
 =?us-ascii?Q?CyC/w4wp9dfXktWYQ81W8woBx5giWh4owkx31OrA4JDEDiE6CfLb2T8e0gcc?=
 =?us-ascii?Q?Qm7HU5dyLOpuDMQGtCHFtZNp/uR/d5dwoRx0ghUiZXhETuUZNEY+l2j9UK3G?=
 =?us-ascii?Q?j3VvO7CS/4MS/XwrtGUc9SeoEqhaNV7b4pLqSQJowgZImwh+ciXUFjmQXE4g?=
 =?us-ascii?Q?6VLgQtu2Lt7ATffEMiMMzmWue3dmBZtoawCoBZmX9XktSsg794ok6RBj2EB8?=
 =?us-ascii?Q?/4zBea4dZx8xMY8DaDbZ78QoJtJ0I943e325kHB0mRhgSpJjiOvqei04GIv6?=
 =?us-ascii?Q?nkLvzHKLsN41rx5qn5gApzVagPfiHl8mmv9rReBEDfkF5Io5ozi5G+aMmve8?=
 =?us-ascii?Q?Cj0WelbWKVkpfjGAzenFzQLgMpziBGOZHHEoqznlk6FNKim6AIfMsMBezKUp?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 265d575e-7435-4f0a-4a3a-08dcb7583e84
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 03:14:41.4316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ih/TUrLktxuBK9eCq1i9MO+bMHacIlnoTg6nb2IeBLB8Ny2Res9YnunHmf087E/Ikl8VYHg83YvixDgPOTa0Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8171
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 07, 2024 at 06:23:31PM +0200, Francois Dugast wrote:
> Rely on wait_event_interruptible_timeout() to put the process to sleep
> with TASK_INTERRUPTIBLE. It allows using this function in interruptible
> context.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 460808507947..50013e1e7455 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1603,11 +1603,11 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  	 * suspend_pending upon kill but to be paranoid but races in which
>  	 * suspend_pending is set after kill also check kill here.
>  	 */
> -	ret = wait_event_timeout(q->guc->suspend_wait,
> -				 !READ_ONCE(q->guc->suspend_pending) ||
> -				 exec_queue_killed(q) ||
> -				 guc_read_stopped(guc),
> -				 HZ * 5);
> +	ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> +					       !READ_ONCE(q->guc->suspend_pending) ||
> +					       exec_queue_killed(q) ||
> +					       guc_read_stopped(guc),
> +					       HZ * 5);
>  

At the botton of this function we always return 0, that isn't correct now.

>  	if (!ret) {
>  		xe_gt_warn(guc_to_gt(guc),

In unseen code:

s/Return 0;/Return ret < 0 ? ret : 0;

Matt

> -- 
> 2.43.0
> 
