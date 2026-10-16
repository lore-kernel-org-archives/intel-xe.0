Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE5ACC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 18:49:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5821B10E19A;
	Fri, 16 Oct 2026 18:49:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09A710E19A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 18:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792176570; x=1823712570;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jxe7+duxnxb/c9QVNz314UA0g3dF+SC2iVwK0PcU/Bw=;
 b=nlcS96tknxL+cVeZQZ/ifBXLwRObx9BDQyfGiAZxUFGwnUkmd7TaA9yc
 ybmG4dEfYvOGPWBVWRep3e8yNX9f0h4fRlZuHTHe5wodj7cz8G4GBvmn+
 +rxwq/vM6+p2eKPJY/illtRCy1fPBZWnHtPhdc8bWDNeXX5X8ZMJT+gHR
 1JTkgBuxMwU1DiohHCrKzLxQvt0c6e9to9EHcXl02+MFdS/LjML1SRYly
 KphHxKeKF+EVAAF7NqfimDzEBEAPcrSoZ3KFO8qveuoGLSZlE7ssGadSz
 qBQXfrdRjUvdfmeZY1clbleTxK6iKF2IbF0fzr04txzVpWXRK8m0IkP/A g==;
X-CSE-ConnectionGUID: TgO0XXSNS+K/4L9RtPpT/Q==
X-CSE-MsgGUID: ZpqvA+/KRGe0/rKpicISiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="977465"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="977465"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:49:29 -0700
X-CSE-ConnectionGUID: KHnKcfWPTJWOY2DApKfrag==
X-CSE-MsgGUID: UqCbbk2xSyaFM2u8FAK2dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2002879"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:49:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:49:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 11:49:28 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:49:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRpaLREiTiiVh5Cuacn6gMLYlDL8oe5rRXm+c7EaNe9l8blr+VC9SHHdmFLvZgvpUx9Si2/WwQb3OeCKaF96Dic5YxovM4zMk7AQ5PQXIG0YiaUpGysBjtuYTMjoZcJ7pJjoJg7piIrrXdVYITr1gToOKIVlTm4lnaBRH7PecKah/5tRFarRTqyoJElKpznf8X31Hg/nPFGH70MlwrHKJSS0hGakJf+srnzhUBwHU3uKV/oAZVWq6Ud9fikUWsA6HWd00SL5W26FkTkzTgpQhdXRzdNnC8CVYgyRu90U6vT75jirirFltOZJVuc0+CBjgF6uDstdyaubJ2zY/EHaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+l64ED2yjKAZEGGsCNxAiZOwsoDX+JdymavHyvzbR8=;
 b=apaL1d427Yy1EjnGjja8OEtY8VZTCvdn6svCAl7N3H5ovT9E0P1zL8EXGwqJBQBfuppnb/gUgUVChH2r2zn+jtyO3nbWZtjHnP3aH7jtH08iFtvkNyJbxAd0LKuWJ1qHtjFsy1ausXpi51670MQN8XK4lp8vRrW+mrekPadpf3KPgiIGHaCeAhF4sXXqPOjBtE4XzhUDc1AA9mMijWOZBOK1Uh8H9abs8h8SgU9Pi60dORQH3w/2OHBsZmv2JmqO6CndvtKmMsq/waA0PGc/epGrpsWW1oqFqQlEEbttulyun2FujsWd5qTPUA6fF0pHeyWmfKhwbVudLJMb+5/QAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by CH8PR11MB680836.namprd11.prod.outlook.com (2603:10b6:610:37a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 18:49:27 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 18:49:26 +0000
Date: Fri, 16 Oct 2026 11:49:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Memset g2g buffer on resume
Message-ID: <atJxs5BOjChYDEaX@gsse-cloud1.jf.intel.com>
References: <20261015165451.154495-5-vinay.belgaumkar@intel.com>
 <20261015165451.154495-8-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261015165451.154495-8-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR04CA0233.namprd04.prod.outlook.com
 (2603:10b6:303:87::28) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|CH8PR11MB680836:EE_
X-MS-Office365-Filtering-Correlation-Id: efacb1f2-1172-4f43-e86a-08df2bb63408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|10067099003|18002099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 4sNHL+5UVYpW8XYjd168jWFEpqFlwRan7G7sRq0qqoUAbQxd2b6CWPSqtrHl8okKw0MB1zZfGVSIgq74dMXAnBw8rYH1Ib2Mhc76+7ARHnnFx0mRJMC4bfP4MJpwC7/hshuQroJuydLSrcW63ObqR4ubp2gwQQUHOIJWGt7P375FDYTePi3LJx6UnOepCmXiB25F2mP/Aiw9JSpA76Gakl1ouoC5yQx/iBazbLoOlcvgS1SbfIZ724/k42NpgoCP+cMOd7TRDGciMTmPBnD4jU+ikY7OrhC+y1669xcpHbuTUfAgHe0gtVHX7g7eayNndhb8uu+7eeM9EwlMAd4cSC7sU6OjpR+Pg7P5ZfjKhWUo9oQE/3UgdG5s2QWkIlZXXHFJd657mBl3E5al6VrworkuPPo6Aidc38Mxa3E+dKsd77B3AORcrIEvsW6sJo9CXFqJ6SFyZXcLAZb8kpqqUrGy+/GEZ3ky7E0J8V1ZDGspZKSzUrr2B45naYWH46SinXDwJkJoJFUP8yCiQ8ExLfgKgdt8ZoYfr+Le/YE1GP9ijtJmcdEdJSIOzOUcKM+qIiw8M4+mJiD1MEEDTRvdO7Vtqc8yYo0VdjyEcn7mjSUWsrXUhCdIt6yVXotMke7L9LJpT4iO49plAe7L1WRy6scyEopgctgs5J3dD2jGqjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(10067099003)(18002099003)(4143699003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kWQixNM+F3h8HpGxsvJWCCwYPgESzR+p41ewUq/cUYpV5dBIohRH23OO04y9?=
 =?us-ascii?Q?chjaaBcgNq5GKr+ly+/WISJhWk8oCi0ve6c2lfyesvaFJiuIlyKB3zIpRSrj?=
 =?us-ascii?Q?AVvM9NHLhAyoGGQxYL6M5ejnNo1t/5c1UyXyZZ1XvB7786tlBC3qujleO6IA?=
 =?us-ascii?Q?pYecdGTbGkU2aM7yA8/60eZpLQdS6Qa8tvC2hrjGOqxNOoOuH19EovO+HAIQ?=
 =?us-ascii?Q?RfVWIW0E2Py147iP9+IoHSfDLe+hGS6jOpFqeSud09/LOMpCygfhq9zZse2F?=
 =?us-ascii?Q?adCsZNt98idCnFMTraw40pzf4DAlQt/62ZCfoEioV/C5yqkeifr3uDAcCfj4?=
 =?us-ascii?Q?NNcpJwU/yf4PL+uKMQEEIrGQR/AMRCNwZgVmYsFirtvcRznm3OGwBWgmk/VM?=
 =?us-ascii?Q?nrswoLUlcnVDY6jKRUXTaq02dUKs4eYwunQo+TE/5dqcF57fHA3kARmXejzd?=
 =?us-ascii?Q?L9kv+chDYrP0HeiI+Cm9h/uL1rnn6fFydgP7FscO+vzb+pAqV8x0r7UC9+ZG?=
 =?us-ascii?Q?Bsc4tephH1w+oaW648BMAlLdyEW87r7iOkFPTJjaOIiESX9dOIF7Kw608+f8?=
 =?us-ascii?Q?4bMCxT6DZCaBtiF/tWtfvODoAZ3WckTC1tYfwiQNytiZ3sU0ZDQfWuvMU/T9?=
 =?us-ascii?Q?/h4wg0RinK9hA3ZZ08fkovJbJNz9S+kkl60+W2Jo0yjkOzYLqGxoOCKE2gkW?=
 =?us-ascii?Q?KojamYwY4nTJHqOO6GZfy3XH8Dqj5efkgAHV6kdak4n7+xdOUVvL4KGql8VM?=
 =?us-ascii?Q?kuA+gCRvZAF4FM5Mpswu6zD1vqSZSoN4NsvCUItyrBJKD0KT1/eTZdxdnlvx?=
 =?us-ascii?Q?oQjXcoGrktJN/DdY9RALG4GJ+gOzOFmheswkc6i54obW8k8vH/2LnHocpNnb?=
 =?us-ascii?Q?uTkI2o9wpJyNLCML0BmXejX1Cii2Fgnh/rDbAeEO+Tkw++ffHXqb7SWrPIG7?=
 =?us-ascii?Q?ObyWut32PbiBmhURAj52kb2SlFnZPfP2QI8QE1n++3Dh0ZWWW2vWb2ZjHkLf?=
 =?us-ascii?Q?n9HJl7A7PGSvIGrbFMaSroytKaRwoIGXTG8dXzdJEAkehQd/tUJUqZ9DrR3h?=
 =?us-ascii?Q?SFAg7b839W+CeTtMNBArlxQfp2NoDjV1lrZETRA3Mrp2FOqeWJR/rzJDToes?=
 =?us-ascii?Q?OGwv+Je3/AUebJPcqZVRhi5Gp32n6D9JveD4pZN06XUosB1qH06F/rgrGGmO?=
 =?us-ascii?Q?yGF1eNnXmrwB1cBgOP5YzZ/e6YRYBzjJYfhip7oUoj8E+zwq/U+dNTN0vqFC?=
 =?us-ascii?Q?1Hd078ak7/vZPBefv3vzU3mGCfv1sWsib5dwEzkOkguW1BqcG+vFYO/TIuTv?=
 =?us-ascii?Q?dX8saVuzehiB+c6W0BIRLIzDI/C4hiwysfH6wxy6yI5syqjR7woe+FPr8+fo?=
 =?us-ascii?Q?fLbeIBQJDfZLlbmQOQ3pWXFoVFBfkr+haIivH98l/n4L2xwgMrqlgDvxf7eu?=
 =?us-ascii?Q?b3TjeaJHKnJRWZ5kGXSZGEOtaxgktuyKJqlWZSqOkSNuIwE22SBVtNa1yfeJ?=
 =?us-ascii?Q?jD5WPvB/xU9P666hAVQn9T9IJxnORwFtEd45ethcnC0aByK+LOwkUvHLXYMg?=
 =?us-ascii?Q?1J3TDV3mV77E8Ean4TxZ3hEvrn9a5wUX7WiSl8+S5vqoTP0PhWbYSWheaTYx?=
 =?us-ascii?Q?fogvo4c5qcQSpJR2HEYjOufMW9Hd3tSZesaN4sNLS+/UlRXU7WvBpwSsCaTm?=
 =?us-ascii?Q?i2GtPnnQk2o1fGubx9DcdVWcB0xmWnhnp/JxMWfQcqdAsrp2N8OQ+3T2WtDw?=
 =?us-ascii?Q?egNZXt3F3Ul4TH5c/FgZChLrsui0Ad0=3D?=
X-Exchange-RoutingPolicyChecked: WG3Byy3fRmqUoFTQvsYa+YrghyF6ETsBvnZtm0HswY8STnk87yiqdKaIIzUv4KLx80ZIHCt88lxKT/+mwbD9odmDGP+HOccB339QcdiZwItSc64jajKa59jYVWDnrw4CrG5U/1bw9jE9VldANu0ElEUshaeGamkgTzQ+/t7OuIB8Fakx02YWdXiEvEedYeP3snDbeJ3pbB0Ihs4l4YJjls+sq/3LXFBK+AOipqHelBNB505PyhBD65VihMSk3YA4gJjXQDD3WwjSGiRlXHzfA0FWeEIWjvkJ8o7ttZP91doxtd14EW3Z75qik9UzOg55P5/SVLv4jxWJtP3yd3cFYw==
X-MS-Exchange-CrossTenant-Network-Message-Id: efacb1f2-1172-4f43-e86a-08df2bb63408
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 18:49:26.8554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbfjY3+QLjS+VIy3ZFHnU2xG0xQw7OHztEoMeur65EwQ8GozEm0L7kF4FpT0ufAiPIU6FO4Rg2VU46muTaB9Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB680836
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

On Thu, Oct 15, 2026 at 09:54:55AM -0700, Vinay Belgaumkar wrote:
> KMD creates this buffer for use by GuC, it is also responsible for zeroing
> it during resume. The buffer is marked as XE_BO_FLAG_PINNED_NORESTORE,
> so we cannot trust its contents after a suspend cycle. This commit adds
> xe_gt_resume_early() function for handling this and the C6 disable
> during resume.
> 

Fixes?

Also I have question here: Does this mean after d3cold memory does not
init to zero? This was an open question I had which merging
clear-of-free as I didn't know upon d3cold exit if buddy blocks in
cleared list would still be cleared? Any insight here would be helpful
as I think Tejas is picking up the clear-on-free work and this would be
good input to give him.

Matt 

> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h |  1 +
>  drivers/gpu/drm/xe/xe_pm.c |  4 ++--
>  3 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 775c826b68b4..02f5d48b1a65 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -1069,6 +1069,24 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>  	return ret;
>  }
>  
> +/**
> + * xe_gt_resume_early() - Early init for GT resume
> + * @gt: the GT object
> + *
> + * Handles GT related init before GT restart after a suspend cycle.
> + */
> +void xe_gt_resume_early(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_guc *guc = &gt->uc.guc;
> +
> +	xe_gt_idle_disable_c6(gt);
> +
> +	/* clear the g2g buffer which is marked as NORESTORE during alloc */
> +	if (guc->g2g.bo && guc->g2g.owned)
> +		xe_map_memset(xe, &guc->g2g.bo->vmap, 0, 0, xe_bo_size(guc->g2g.bo));
> +}
> +
>  int xe_gt_resume(struct xe_gt *gt)
>  {
>  	int err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 92d934d50244..9b69f36ebc7a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -58,6 +58,7 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
>  void xe_gt_suspend_prepare(struct xe_gt *gt);
>  int xe_gt_suspend(struct xe_gt *gt);
>  void xe_gt_shutdown(struct xe_gt *gt);
> +void xe_gt_resume_early(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
>  int xe_gt_runtime_resume(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 1f5097875bcd..89d64aa6577d 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -249,7 +249,7 @@ int xe_pm_resume(struct xe_device *xe)
>  		return err;
>  
>  	for_each_gt(gt, xe, id)
> -		xe_gt_idle_disable_c6(gt);
> +		xe_gt_resume_early(gt);
>  
>  	xe_display_pm_resume_early(xe);
>  
> @@ -703,7 +703,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  			goto out;
>  
>  		for_each_gt(gt, xe, id)
> -			xe_gt_idle_disable_c6(gt);
> +			xe_gt_resume_early(gt);
>  
>  		xe_display_pm_resume_early(xe);
>  
> -- 
> 2.53.0
> 
