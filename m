Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80166FF8864
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 22:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403EF10E0AA;
	Mon, 27 Apr 2026 22:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V7mZlHoC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970B810E0AA
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 22:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777327629; x=1808863629;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=59/pVH5+7TYsX7eM9Q4dBw2ndWRPK1ZzT/0x7bEkeAI=;
 b=V7mZlHoCioJdPknmoJcHjVeuW/4aXKHSbi9y41EfGciPqojoy6jhgszz
 nT9wkMn1UxXibegZnlRFyC55M7/GumaPLzmhnFLG7S7JN0b4WJHvMGh8u
 INCGHAvgqcH+PX3hCppMJVpTuxWIOavXaaD/Fof9SSFu2OckZTdBZVJ1B
 FX+2QauWBpIK0EHHy5qsXshI8mBDlh6jZM9p8N2K9przzMG0dC7Ls6tD8
 yTokGxy9no/9Zqr7mlVXqhQzLO5tunZ1YIe0JbaLjbqqknFXor2mnwjXt
 EfU0aWK9yTxHacMj2Wr8GLducOqAuUZFBUUQ4WOuOQcwLvb0PZJ30Xc9j Q==;
X-CSE-ConnectionGUID: gtJEfePjT/GMn1japVwNRA==
X-CSE-MsgGUID: 6ZymQCoPQK2Z6SVxGwV6YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="103689745"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="103689745"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 15:07:09 -0700
X-CSE-ConnectionGUID: FRV0ULtUSPuLwcoeN2U8bA==
X-CSE-MsgGUID: 3y5MZ7iQSfCPJ6O/sRMiEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="238796300"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 15:07:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 15:07:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 15:07:08 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 15:07:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vd6ijupK+r8RvgsaLPc4gH7JtjSOg6qTNHlafLSMb9RTl6nzmuzhWtuk+QqOu0lnCBxbcd80w9y/KkFZbeK5yKUid0nHigXES5lDPncw5IYt3r3u3HcX/gLd06BZTFgGsGgc5D9POEff6Bp/fC2TAl2BOsBpP1GIe/1vDr8B6y2eXhT/AD47BoZDEEMiH31vK93AASSeTNDpopJdJXlgTWaAbtcqfh+vTjBo1MUgE+wkMQjcuyboHr4xwXBWuHDseGDrs+Xt7mozx7R2s7tu6w8IRCyARAb6mwTrv6hS7cVhnYzb77hbKMPV5KJ1zBCK6PQ2FckEwRFLgZFLie/SrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyPK+LH7updnJa3nUyqNY5pvkhyBEEd8NqLjIF425CA=;
 b=HpOKXPzuskw/pTlKtgnnbMkJ4MtzL4lLC7UXKnyqz7txWo4gOb5qRMDWSPCLEh36PXofNoI1j0jhJCszQNbTwFEn65rwHfCmt9hNY0Yi2p+fsr84rX0aATsFtDEWf4EY974ENJDz6OBYcC2y/p4Ooq9IZN8XiCRz0xdHGdp0I+Iclp6DB2ro0CriH6JdbgQeYQvocPOzur34p316jm40DxxXeJMncBcCogiLbBVC8p1vhA+loFqzORgKK86ru48tTwDY27g+I05NLdTt1WEnU1qGXHI3fk+3l9n9be1zzFj2vvjpA5eKSdetSrSTXYp/Hhfflwmu30j5p0tLbdCmkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by DS0PR11MB7288.namprd11.prod.outlook.com (2603:10b6:8:13b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 22:07:06 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::79a1:7b0a:45ee:cdee]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::79a1:7b0a:45ee:cdee%5]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 22:07:06 +0000
Date: Mon, 27 Apr 2026 18:07:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>,
 <badal.nilawar@intel.com>, <sk.anirban@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe/guc_pc: Make xe_guc_pc_stop() void
Message-ID: <ae_eB7_JJPVl307O@intel.com>
References: <20260427092928.1181893-1-raag.jadav@intel.com>
 <20260427092928.1181893-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260427092928.1181893-2-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:a03:338::12) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|DS0PR11MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c5ef6c-b23a-417b-655a-08dea4a951c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: VUV1fefUH0aNhgcz1NZvh9ttbEtTuIrHznF60+vYxhNg5hI6wTXi4rGKt9KY6v48yeuRjQCkI6QYZP9yIPKWgfX+uwEFdGSKiUikb+4fVu0OrUyaKmFtCCciv9CcrMBbQ1rYJRvVI9h+vHeolQgQjyRP2683Kb0GCE10jNaXn6gyofDM/hzxulc+j0ibKfACON+gcz5NTmqEmmrcOWIURq0wPBS2HR5rEH4Zll3TpZy1OAKdstNRFdGc0zVnBwbEbcM8oXnQXy0x8BJTDvPpOR+X6Xixuey6npfsv1HBkg71LgjUop5vIBwGmgD2S1aztNB9doMXAv4EFLBAtxBC63Z2ufJ6cgdoIyIFUxZ92NrGlkGPFOX48Nx/drR3pDuwGdZ4RDRK45I3CUZ4X3f6TrYcddUO/eS3NmAn7I+ZZSZ4tDezY393wVpNLZQGLIDz4YTchOZjJ1sMZxmCbAUlvHCW/bExY9Dp55CQNSs6pekb84hJi0cQdJfvDxBfw6REtH936t0ozyVAU2x/8YO1oda1BbYqFZ/AJBVhFf/uv2CO/BuxLNSDYRWQ/crVvMZ28tyiPn+V/z38GUtoLpttHTXpMRAQaEuHsqI51t+VB9VcN1gZYaH+s9kPuX3CxLj0SiMkYcRZ9Hc8rdMYI7eq36I9FX5KwafS/fwLcgfWJPh4KVx+BCwDSqrgk5wi8XbsEo8winHqMWoJgWaDQ8DIpn2k9zvEMT+Tw7mpwLJ96jY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VmrYWouDAvCI0oWqKE/598yEO7k5SC4lsxF0f5seGmvYnVHsuvpDQtK8UWIM?=
 =?us-ascii?Q?VIXld1izYrzjvMhb1Kl13SkmOcZpZcQavdTnbnpGGpCxgFyKm/Si/ToIcRUb?=
 =?us-ascii?Q?seYrgYdcqWpA9Kr+xJgk76dKSq5fV65rtNPMDkcQi4lxxVNzBSkJLQBCLUCW?=
 =?us-ascii?Q?XeDPAdWME4zfvK2MovTjR9PcJgv9+pOncQ91l0mNCl43DrmGXFs/bj4cMMzV?=
 =?us-ascii?Q?kxkShZKvZqocBv4tp3E0VEnXgHK7bM5q8dNcq4Nobzle/DYAeQ5MK6LQsOfj?=
 =?us-ascii?Q?f77r8bt/Lk5HA5nWnh2ge4jOUaJ0WtNl0A7My8sGwhho6tC4dIDMIyOZVKol?=
 =?us-ascii?Q?+bnySO18lY9hpMjGid7m7v61LqqHpX/8WYE9gRalj9W4VutZXaIKiyN3SWyg?=
 =?us-ascii?Q?/CTMUOZ9qCnjO5QyV2xWZnzLH4WqcMmPy/ajGqYqJo0Xn9Az+spLpdS+73cn?=
 =?us-ascii?Q?1AdFwA5Nbnx+waIZC/5bWsFVTYhbCyoAGL2A/4PBjgqHZa2BqBUnGw2KzOFY?=
 =?us-ascii?Q?BMZpTwYCaFZXFHADqj9wyr9dNfKofUqvfSSqZFSMieAOUcRi9MKoYWVrdQUI?=
 =?us-ascii?Q?Xjfx0un5IvHaUtQx7oLF8TZShpeo5QepvF9lcArH/iwVpUWpNOgHtYOfSPow?=
 =?us-ascii?Q?RJPfOHu6hSDmPs1FjdgczOzzZVGamXfbfl0w8hKBUwxDrAEm0+f5+QyfHnFR?=
 =?us-ascii?Q?V05aP0C5TMvw6ieyS+zO8GS6IsmGh9XZudbwm9qxK62H7SHaX5aFTlJwAZd3?=
 =?us-ascii?Q?uUiU41CzimW1ZAXQptuigOlIHPJmYn3DgCSxA7ApSjBHrRsbIzGkLuJa+xEO?=
 =?us-ascii?Q?g3ttvb+Q0+w9CScu87Wc2aHB8h6BHQeKuM2VL6r/4qUgXh0X6CoHV+GY2B7g?=
 =?us-ascii?Q?tX73Pq0Rzgz+SnKKVa0SFYvJSn6zG+F332oVwnbIh8DtFhmqD4YXnpxezTcL?=
 =?us-ascii?Q?P5qwGaKqUF6N2aawd+zQq7+IyVSNwxQzo3VHVzS4LXAhF+2gjTaIsmHuAZQ/?=
 =?us-ascii?Q?YsghNO1saGeem9AQ96HLC2t555fU0MCde8h3R2gjnVT2F6+2O2HsbtFfvKP4?=
 =?us-ascii?Q?U1KoZQTsTrM3WGGZzkpwV8KRR61tFecZ7vTIFoJZR1LtzoX56Sp1r6MQ6MPM?=
 =?us-ascii?Q?UpBrIz8OlKmcrB113ajZV0ZOTSgcee8Rmlc9GUgIpNJoOE4/QJ3PZhhte5/S?=
 =?us-ascii?Q?Ofxd14Q6jmEF5G8AE7Sq6eSYbtqqExTdKAeOj5oOsteFoa7Pq1X9t6p0rfuA?=
 =?us-ascii?Q?8GdmdLjryiR3BSo8jE8aeeFDJ2orE3Bsq2j3g1pdX8tHkUeJgGt9qPhMHI2g?=
 =?us-ascii?Q?BSYNGIDtaTzSOaUb1Y3rpD0eKRtgfRkSuM6HcfTro0m9Kh6RWYUel6h9wC+C?=
 =?us-ascii?Q?38jvNUMpSV+uhXJonpSQLtaLTNEePrMkWi7HWS+KEMeoKL63NDmlU0B8ZmQw?=
 =?us-ascii?Q?2LRSianmtxLyHkqniQQjAAcxnP/4D8CIsmymoqZKyU9wc7tgwi9QbKqO+1ep?=
 =?us-ascii?Q?TPiaLNe9CpFsvJBOqOURjsm2O948cv/xT2XgI9NIh9H1/5A5pim/fWugknM0?=
 =?us-ascii?Q?Yb1FAGd0M+PnWDH1gY6vQGLA+LdBcB3seBid2O2TwFskHobHdXKpS4jcClgD?=
 =?us-ascii?Q?pOm7MyXzei0w/5wwx277F8iqooMjLz6s/o/LBoe3vlCJGb9KBZ/A82Ixvh40?=
 =?us-ascii?Q?rxtPUxKDeyX9DaY36TLWck9E34Axj3fwzFWytC9CyzwHYsZPmYRDTE5PmNpB?=
 =?us-ascii?Q?+SFy/hhRbg=3D=3D?=
X-Exchange-RoutingPolicyChecked: M5x31OUKc3jBpQ0TKclMVXdZA1ahZfwjxBlJI1FVFzEvz65itV8NomC5JxFNnsdecGKFOhPqtpDdLfQeeAVInAydXjjTd66aPx8rdslhCyzWjycKOPnRHVaceed5AV2UpyBAGs+6/jPPjCT3DEY3txiRYDjL14WNoWNPmjobrrNM+Rk0T37azGol1AwKCXAmgj2A3c5crHY0ZywHJECWk4uZPc+7TTcbeMif1qZP9TdV3VyxtZ8/XTInL+IwvwAtUjNJgcgwCmiE5ImovrjDAtNf/lPrKurR+hBLMdq6oM69c0DzZb1mqx4rMzMqt7dqVdiPGa8dLxCtVxKxnXJHsg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c5ef6c-b23a-417b-655a-08dea4a951c5
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 22:07:06.3705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qcURHw+gbjnlf6gjgZcyPfufblpvR/TNTMJKpbs1qkxbcX1sSpPT5eNhKRdbsXMOElLVBI88EhWpkLdNcuUiuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7288
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

On Mon, Apr 27, 2026 at 02:59:26PM +0530, Raag Jadav wrote:
> xe_guc_pc_stop() doesn't return any meaningful value. Refactor it into
> void function.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c    | 9 ++-------
>  drivers/gpu/drm/xe/xe_guc_pc.c | 8 +++-----
>  drivers/gpu/drm/xe/xe_guc_pc.h | 2 +-
>  3 files changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1355b68d3fce..ec291588c482 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1730,13 +1730,8 @@ void xe_guc_reset_wait(struct xe_guc *guc)
>  
>  void xe_guc_stop_prepare(struct xe_guc *guc)
>  {
> -	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
> -		int err;
> -
> -		err = xe_guc_pc_stop(&guc->pc);
> -		xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: %pe\n",
> -			   ERR_PTR(err));
> -	}
> +	if (!IS_SRIOV_VF(guc_to_xe(guc)))
> +		xe_guc_pc_stop(&guc->pc);
>  }
>  
>  void xe_guc_stop(struct xe_guc *guc)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 7ecd91ad6192..9530cddbd11d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1316,18 +1316,16 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   * xe_guc_pc_stop - Stop GuC's Power Conservation component
>   * @pc: Xe_GuC_PC instance
>   */
> -int xe_guc_pc_stop(struct xe_guc_pc *pc)
> +void xe_guc_pc_stop(struct xe_guc_pc *pc)
>  {
>  	struct xe_device *xe = pc_to_xe(pc);
>  
>  	if (xe->info.skip_guc_pc)
> -		return 0;
> +		return;
>  
>  	mutex_lock(&pc->freq_lock);
>  	pc->freq_ready = false;
>  	mutex_unlock(&pc->freq_lock);
> -
> -	return 0;
>  }
>  
>  /**
> @@ -1343,7 +1341,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>  		return;
>  
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
> -	XE_WARN_ON(xe_guc_pc_stop(pc));
> +	xe_guc_pc_stop(pc);
>  
>  	/* Bind requested freq to mert_freq_cap before unload */
>  	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 0678a4e787b3..1025a2b15f5f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -13,7 +13,7 @@ struct drm_printer;
>  
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
> -int xe_guc_pc_stop(struct xe_guc_pc *pc);
> +void xe_guc_pc_stop(struct xe_guc_pc *pc);
>  void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
>  int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value);
>  int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id);
> -- 
> 2.43.0
> 
