Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5E4CD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 19:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40DA10E5F8;
	Tue, 26 May 2026 19:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWVYHVKb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C3F10E5F8
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 19:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779823896; x=1811359896;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EeFm7C0OwNJUT02YzmhSt2tevIhCXBSPUxEuBUPPT/8=;
 b=BWVYHVKbcx5HRfc+/39MRXNh/TPi69SHn8O73aQzBsutdUkoFYmYPWy7
 PwrhRBBapZh01UxYSFOGCnpVxOzW5aJcJN8UlTGPqr45UDwF0J8zUwaFh
 SIzhq8oo4e6GN3T53RWpnCkYZfiBdF5yz3pBF6XsviaLsJ2F8TNh8BKri
 DcAP95FnopycR4nyPOeVuMG6DDxrLCQAqHdckzqiqIerjefSngWPwepsJ
 0kRMVJkluv1WnGjckMrmQlusnZEk6eCQ9/ahxAyUsIm/y5MflzfILnJZc
 4FVcDQks2jaWdmh85juFd2cSmw8rO/BsOLQRBimV8xUwa30iLx3xMqvPT Q==;
X-CSE-ConnectionGUID: InIcRSDHT9i4D1/MA4c+CA==
X-CSE-MsgGUID: Js/sWpivRf2NAYZlXrJefw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91340235"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="91340235"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:31:35 -0700
X-CSE-ConnectionGUID: iqwSTSUbTBO7wvcJwm8r4w==
X-CSE-MsgGUID: w/3atMxvTauyWwxWw2hNfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="265876024"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:31:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 12:31:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 12:31:34 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 12:31:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKccMG8NXabFYks+LdE49NCLqEVDyjZ2JQfgFfTVSdC+t9tDg9M+ciMtJmOXUfsmvZoPbLDmwpnAxiSPQxfoW8GLuHp4RJhFhwTkK3azcN8LeD/YCIkwTOUcJbq0/eoA/Coi1k+GKmJYpJ5WTUZIeFFdnozgn3eUXzb1W4e8pP/a7wvf/gTUKE89ma0gQT+jinp5nYplv2lSzQcd+p7UW2k7osmHk3u4cTfjqKOsFfuPh0ztIiK7bY8vuktWWzyKy3JIhle4+9qhQ+s03KvWUzNLAAwYnh9vPqlTbTqZWKy3RpiHfuAlXFOdlqwLFmrvs8B1OLy5hiw7ry59spgASw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ii40HYmgRuxuIUq4s2B3JKoUtLRCRFUmyp4o80Elcs=;
 b=wh8Ex6ATtt0GVzoQ77vDiw13JwJ0p/Dr/InA06/Guo5GRyNGhrH+y9hD+TamQpC+3L8HhubY/aHWF2KwxHDECrC2T8zIai4BreTkktvJnQk3O2AGTNRdnJlrl/pi3rDsNyz58DsGKjf5CpxD0EYC46Sf+egglUX562/47MnezWKxdj4QzaOIr6zgi60XlKlYJEiCuzehHr1NuPt6FThRUXv1Mrr52bNmyMq8I2Mk+QEk/zEzGAKxwwxUe9SRtnNiIK+WDsNql5WcwYu1Xwh1cpQGbEv1pn6lKR2I10mlvzgfVvkvdh4lZwSIsY5+abrXKjlrF7bWdrQeN2mHrZL3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by MW4PR11MB7077.namprd11.prod.outlook.com (2603:10b6:303:223::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 19:31:18 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 19:31:16 +0000
Date: Tue, 26 May 2026 15:31:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matthew Brost
 <matthew.brost@intel.com>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Assign queue name in time for drm_sched_init
Message-ID: <ahX0-lRU99pynQDa@intel.com>
References: <20260523103418.61832-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260523103418.61832-1-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::27) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|MW4PR11MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fe6e263-7418-458c-02a7-08debb5d5a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: lLv889sgY0ykK1+kraT+llRm/6pJdChcYRpvAaXPWyUfkTStNXxqx9VCKbSxhi7kZoxdkv9XGgKF+l1x9E/W7+j1iLgQ5u++9oz3jIhu4Ug3OY7feVOSy07BHBehEjB816iCnWpGMzPCJpMhsx+5lDh5cK1idZ0gx2UuoN/StNQkQ+w4q44nI9lDwMPOXMBpeisCQWlct+o1fsuEdMUNsrXHAm34jzIlf8bloqtQuBvxH216gMv6BJ5xrgYbeKAl6k53dL4stp9XZb3q3Wiuxmj6EHnQxm9VwIRd6FfMKJj9yGnVDPguzfpxotG9r3Ua13e2pP6vudxuiuIW2ZNvXOrizvGesZ4YlYBVlfDOPcUQn5BGG3d15RXF6E+lpQwu/2mVn7oWtglPlRRc84HfxKlxWGm+lR48sZhi6seaX7HdAXjQ6+J/XICjzPY0PZldnhBnydmPLF3nlwNsnCTK5kv9AUCHSzuXB4NwHiB2yd8MrpenzUvgQA0kUjWr6YEtaKSMHMcIwXnoknMLaA3DxvaYYyCN602UrmwuU9lytYRFEQz00UNU9vVkVnbjZNcDUDR5e7U3AnzIFfd04G1o7t2UalsfgmzfN14iMJz7MXEyR3sMaXhassJ9N3G35Isi6L4tdR3e/C5bfuIrteKXvwmZn/ul+g2R5ILG40b3SlDfwoDvFqB+fkze3iCco1on
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099006)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kqC2CGJ2YVUNDH1SJXZwvYjDZ1pjHMhVADKd8w/3aBpG56zYr/Flyas5erfA?=
 =?us-ascii?Q?YiqEUBYJLsRx48QBrKPZ0+67VXNvYZBZ4nAks4GXTwGzERAYYaWtqGyT7qcL?=
 =?us-ascii?Q?EoHS5vT2nb+cE19yZC/eet8u2zxORMViI4/xK7zEexMlu3iSIlakWCGqEWTB?=
 =?us-ascii?Q?yejlVijJNF6aMeFWxWuBQfPVLa2D4dtCaoJlXYJ1plpfQnPDcSYlrHj9BvWZ?=
 =?us-ascii?Q?j3wrPHH2wz0i8krYk6HppbrwaZsPHRL8+EBrwCKlI1aV/1YMr6xNeEAAF1TU?=
 =?us-ascii?Q?+yC0WaCbfXeQRJYLNOWTq1mWrnQSyW0w2IBfQz0wp7joX5ho4X37CLYQ0UW3?=
 =?us-ascii?Q?ogHZD9McfEI6PGeH1i9TpYurdXIzqsFlTQ0X+XF4J/IuFj1PVIUtTS7uOhwJ?=
 =?us-ascii?Q?7GRQxVs4rEcgvMcdS5jJ7BmcqNpyXkrUYL1Ey7AjSDlUEs6pY75bqz6RJQ9r?=
 =?us-ascii?Q?H9DU5yFuAgRnzdy9UPEHqJ9S8t1tjseGGtjKUvHrhQEpo06rr/fGYMEiexZv?=
 =?us-ascii?Q?pG5enG+ePeV8S9Zq2odwMz22uz/JAqlLHlecxmzy6jN2mrilgx7qG9w6EWcv?=
 =?us-ascii?Q?q5tafhijW7e3vvA8GW80jRX5GSQ1Hnb5diHA1cuLCjC3gmzMUAU4jtie1dFM?=
 =?us-ascii?Q?nPgD4R39IrFJZ2D3G0tWPqmHamtilLoiU3R0a+Y+F3vMMhYfHUuNaOyq+C4K?=
 =?us-ascii?Q?kPAIx5v9s7hAYsvdMeoeuL3YhSEbKp9w7Dk9v1Ze7/EsR42UrKqnDb8qSeq0?=
 =?us-ascii?Q?3rTi3BPFdlXlz1NBQ56KOaSWrltTWaWnymJNIQZa17snpPXpdwwuBHJGArMu?=
 =?us-ascii?Q?ALiRNkH1yGtCwTUHezHxqzY2NHnIhPRi4OFz/LyWLbx/egsE8erY73Psw7RA?=
 =?us-ascii?Q?iPZ5veN/EQBUmg+EymMOLnX8172iz6tNnWWeDng0a6S+diGrcUexRJzeukQg?=
 =?us-ascii?Q?XF/XJeaKK7FFjc5K288epSp1xTEJ7I+uEdxDm6l48Vf2fChoRnrmwSYim2MN?=
 =?us-ascii?Q?58Apd94ZCVhGu5+2NpGdBfkY9ZJXvHj/EuV4cWazNBP6b4b7qhR2VPeAFyFg?=
 =?us-ascii?Q?ufUk3oSCSb2FPwfIlUo1SWtezdfSkWRWgeOacAwLXKJLEn7cCzC2BZahs03b?=
 =?us-ascii?Q?VoD4CqWeQL0tWYIykMm7HbK7JQJaMX3KBsSOVmMCY/WAtwUNrvhx+0bZ7UUw?=
 =?us-ascii?Q?kbxrPsgaLwJGv7ZGDiKLCSx+xp2IduALlRtFcg57xrvOEsmemOhkIj6YA4a7?=
 =?us-ascii?Q?N0Ntlu73MVSPDieKhExG79X4JxO1TNGVRYNccvzrrEQSxH/jnZ0P2Gb+YW6p?=
 =?us-ascii?Q?w2luJMGOwHo5YIbhB4QwzcOI1WQxMusiA5si5GM/dHLL3sVgIW8bKttGES0A?=
 =?us-ascii?Q?+RkZ/tf8p5yFenJaHeSVqSRtE0X/MKxhTHg36qVQvoh5JHpzLXlv3X1jW+MQ?=
 =?us-ascii?Q?J3eV9lcbWIoMpyNbLLP8IeNulnNXqOuANuAuU7gK95oJpz3vb8v67DjnPKYW?=
 =?us-ascii?Q?5WqOnmhhu0NlfEz4qrfhoFXuL2JFdzsKgazZag3UX+4kvlk3BKOqXr3T26pW?=
 =?us-ascii?Q?F89hs/yiduuffUhQGtmdw4J8IaZsfc0cK1RI4qYNWm2K+ylRvF+cpvobV1B9?=
 =?us-ascii?Q?EwUGBJhhPgSl4psXEX9lcAPcvFtLct2g97b/DBUQ2oSy4ShotiLJ2+2q6TRA?=
 =?us-ascii?Q?eZhWw7FnxR4vpDzhqVxNkO1NjCBWhqpZzZmfZYiZh+VRjc2UlBu+qEVD9nHv?=
 =?us-ascii?Q?uDo637AcpA=3D=3D?=
X-Exchange-RoutingPolicyChecked: D0i+DbsdVx2+R9ZaxmO/Wpg4eDqQkt7XqwnmeZb/dEjorAvpPSF+CxwCCf8KT/Iah+0zqFjpE5MQk5ewzMVHShDR3iOLEkqHYc/JmNab/2QfAMWYO16kE2nJAwz0NQUr1b2bEV00ahaTccbLdp1R/EiXvjnSUFeiQbHwB9sRUjbIlATaqvDxDSoJU07b44amqOhG5c6JfzzSHuh1fq3Z4YZcAj5EFbHfln+uOXTAiV8HbJb3PaetRHipyyaIQZyxHJgZWz5cPYSkIf4SlJThHvs97xR6fZOvZjSvzXFNK/c1+c5JxzjGfkh4Eo0ERuy4oiQsF2MVu4uiLEr5MQrDpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe6e263-7418-458c-02a7-08debb5d5a88
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 19:31:16.0702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLINsTKlQuNRuHlGJXFTA6bRxbUsOdVqjPhVWmY+CfJMTYiGCI+SS1WGFeHV096hCnIAKM2bMBeSRO+eM3b45Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7077
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

On Sat, May 23, 2026 at 11:34:18AM +0100, Tvrtko Ursulin wrote:
> Currently the queue name is only assigned after the drm scheduler instance
> has been created. This loses information with all logging or debug
> workqueue facilities so lets re-order things a bit so the name gets
> assigned in time.
> 
> To be able to assign a GuC ID early we split the allocation into
> reservation and publish phases.
> 
> First, with the submission state lock held, we reserve the ID in the GuC
> ID manager, which serves as an authoritative source of truth. Then we can
> drop the lock and reserve entries in the exec queue lookup XArray. This
> can be lockless since the NULL entries are invisible both to the kernel
> and userspace. Only after the queue has been fully created we replace the
> reserved entries with the queue pointer, which can be done locklessly for
> single width queues.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> ---
> v2:
>  * Split the id allocation into reserve and publish. (Rodrigo)


Thank you

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing right now...

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 72 +++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index afd8cc7bd231..ab501513d806 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -408,46 +408,43 @@ void xe_guc_submit_disable(struct xe_guc *guc)
>  	guc->submission_state.enabled = false;
>  }
>  
> -static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa_count)
> +static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q,
> +			     int count)
>  {
>  	int i;
>  
> -	lockdep_assert_held(&guc->submission_state.lock);
> +	mutex_lock(&guc->submission_state.lock);
>  
> -	for (i = 0; i < xa_count; ++i)
> -		xa_erase(&guc->submission_state.exec_queue_lookup, q->guc->id + i);
> +	for (i = 0; i < count; ++i)
> +		xa_erase(&guc->submission_state.exec_queue_lookup,
> +			 q->guc->id + i);
>  
>  	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
>  				     q->guc->id, q->width);
>  
>  	if (xa_empty(&guc->submission_state.exec_queue_lookup))
>  		wake_up(&guc->submission_state.fini_wq);
> +
> +	mutex_unlock(&guc->submission_state.lock);
>  }
>  
>  static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
>  {
> -	int ret;
> -	int i;
> -
> -	/*
> -	 * Must use GFP_NOWAIT as this lock is in the dma fence signalling path,
> -	 * worse case user gets -ENOMEM on engine create and has to try again.
> -	 *
> -	 * FIXME: Have caller pre-alloc or post-alloc /w GFP_KERNEL to prevent
> -	 * failure.
> -	 */
> -	lockdep_assert_held(&guc->submission_state.lock);
> +	int ret, i;
>  
> +	mutex_lock(&guc->submission_state.lock);
>  	ret = xe_guc_id_mgr_reserve_locked(&guc->submission_state.idm,
>  					   q->width);
> +	mutex_unlock(&guc->submission_state.lock);
>  	if (ret < 0)
>  		return ret;
>  
>  	q->guc->id = ret;
>  
> +	/* Reserve empty slots. */
>  	for (i = 0; i < q->width; ++i) {
> -		ret = xa_err(xa_store(&guc->submission_state.exec_queue_lookup,
> -				      q->guc->id + i, q, GFP_NOWAIT));
> +		ret = xa_insert(&guc->submission_state.exec_queue_lookup,
> +				 q->guc->id + i, NULL, GFP_KERNEL);
>  		if (ret)
>  			goto err_release;
>  	}
> @@ -460,11 +457,24 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
>  	return ret;
>  }
>  
> +static void publish_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	int i;
> +
> +	lockdep_assert_held(&guc->submission_state.lock);
> +
> +	for (i = 0; i < q->width; ++i) {
> +		void *old;
> +
> +		old = xa_store(&guc->submission_state.exec_queue_lookup,
> +			       q->guc->id + i, q, GFP_NOWAIT);
> +		XE_WARN_ON(old || xa_is_err(old));
> +	}
> +}
> +
>  static void release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
>  {
> -	mutex_lock(&guc->submission_state.lock);
>  	__release_guc_id(guc, q, q->width);
> -	mutex_unlock(&guc->submission_state.lock);
>  }
>  
>  struct exec_queue_policy {
> @@ -1961,6 +1971,12 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>  		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>  
> +	err = alloc_guc_id(guc, q);
> +	if (err)
> +		goto err_free;
> +
> +	xe_exec_queue_assign_name(q, q->guc->id);
> +
>  	/*
>  	 * Use primary queue's submit_wq for all secondary queues of a
>  	 * multi queue group. This serialization avoids any locking around
> @@ -1977,28 +1993,21 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>  			    q->name, gt_to_xe(q->gt)->drm.dev);
>  	if (err)
> -		goto err_free;
> +		goto err_release_id;
>  
>  	sched = &ge->sched;
>  	err = xe_sched_entity_init(&ge->entity, sched);
>  	if (err)
>  		goto err_sched;
>  
> -	mutex_lock(&guc->submission_state.lock);
> -
> -	err = alloc_guc_id(guc, q);
> -	if (err)
> -		goto err_entity;
> -
>  	q->entity = &ge->entity;
>  
> +	mutex_lock(&guc->submission_state.lock);
>  	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
>  		xe_sched_stop(sched);
> -
> +	publish_guc_id(guc, q);
>  	mutex_unlock(&guc->submission_state.lock);
>  
> -	xe_exec_queue_assign_name(q, q->guc->id);
> -
>  	/*
>  	 * Maintain secondary queues of the multi queue group in a list
>  	 * for handling dependencies across the queues in the group.
> @@ -2021,11 +2030,10 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	return 0;
>  
> -err_entity:
> -	mutex_unlock(&guc->submission_state.lock);
> -	xe_sched_entity_fini(&ge->entity);
>  err_sched:
>  	xe_sched_fini(&ge->sched);
> +err_release_id:
> +	release_guc_id(guc, q);
>  err_free:
>  	kfree(ge);
>  
> -- 
> 2.54.0
> 
