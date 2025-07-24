Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAF9C87FC5
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 19:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2B010E29D;
	Thu, 24 Jul 2025 19:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9T51plI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084C810E29D
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 19:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753386588; x=1784922588;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0fDmpi0qpBWdVXB4yNDunwvsolr9RyJPv27JncJbIhY=;
 b=I9T51plIQr/rx5awAHESCMXVqOeL2pCg1P7mXLMa40UgBziBSzrxBxen
 np11zg2BHoTheKDZHAZmSHTMaBFR4fvMDKH4KqMTo4xmKzmrL+fBr4QW7
 bGbHRJWtWuoogjDE6F3uJCMPhL5WTPOk28IZ5nqlFyQY7wo/nIMytCVQC
 CVT77eUyGZZv8/CGDGW06YMmPqk+zdnPh1o1Jo70zvFb0CQcKIsENoyOH
 n+nSFqTXWAbVFbrYUuFYqgJ++nm2iilVUPICt/Giw+X5EuAXniHn7M4Xy
 PuLsqSvH20kuVmjwE9skNnKewjOfdcZNXQN4E2yFUPqjSvHS05GQc8u86 A==;
X-CSE-ConnectionGUID: 2EXiAElyTyGmPo/E5lgqVw==
X-CSE-MsgGUID: axijPjAbRaqRweoIC2M+mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55573725"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="55573725"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 12:49:42 -0700
X-CSE-ConnectionGUID: YtznK3bcSTa0/Q4dT/sqfg==
X-CSE-MsgGUID: dEh0R91pR2OsgOtulZ1Szw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="165940553"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 12:49:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 12:49:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 12:49:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 12:49:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZllR+POtf8WxkubmHQWBwlcD9suKGxX5rB3INVqbq/v62GqjCg2Di4d09CZ6TbM+fRfT0KRzG+ec1AwG4N5YC/BHYtHt/6MniN9xPlbgB90lMsEfm8Amq68zKqK9Khp7jq/8m0DUaVyQkj9Dv10D9PGzS8/ukmKE68bUBSoQ3dEFLjXLQi2FbFDb2fVyyNrw4dkpzEOaibtDVyYgrjZmAfWwCgvOUeftvhMJMGZfTfzpRUjn+SoaTLVgtCu0CQM4Q6FRZnbUupHonFhnW/bc++dv8s6wL4e3oSGYQhljyvDVnZ24ueFAh33FfSNg4EaKZVAx/4XmvpqquwoyXI3HGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9ThLncy2vGtZ0D/raOO272mVW0XsPDHT17Nkgbw5s8=;
 b=Vc5Ec4PXdtAyuQhcJ2XyejDa4Br+wuiDyeyI6d6jOCamchzMmqS0arGH0819g0eST5xV8/R9bhJwtEq7UVfG6cxT086bhOaB9Y3HEojIwbj8ZUORgnKEWn3fMQkrzLWohsaC7eYv7AzmUtUs4zDw1vzYiMc3Z7DGMeDHqy4Y/cDL/d7OASZzY2nHPs0lDcOYFIZMOV7jw3f6wbCgj0mAGU7O5vOKkv2ppXM/bz+U12NRvabs5yIl6m79gb48xPFjzTuMIdYZ1+qJ5YZnheM+MJ4X4u5hMgaoLuk+9/YT1C/2mmP3aLrKr2G6icQj2ISJtRZ20IWOQOsy4Do8ua0YnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5046.namprd11.prod.outlook.com (2603:10b6:510:3b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 19:49:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 19:49:33 +0000
Date: Thu, 24 Jul 2025 12:51:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/hw_engine_group: Avoid call kfree() for
 drmm_kzalloc()
Message-ID: <aIKOuVfLX7YmxTeo@lstrano-desk.jf.intel.com>
References: <20250724193854.1124510-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250724193854.1124510-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: BYAPR01CA0072.prod.exchangelabs.com (2603:10b6:a03:94::49)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5046:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5786a3-e3e4-4982-52dd-08ddcaeb3650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HoLC2hk1IMzW2DXJwFFMWzwmwoHZFRR8yszd6l0xW80tQPrx6rf8fl8zx/Zn?=
 =?us-ascii?Q?u5LfQ4ylRpDo50akDXw6gz+lCMkWxUkw8ytZxSETk0pCmsFUbu9iEy2EXT5a?=
 =?us-ascii?Q?Ez+7S9PPDuTwtFVaL20frMeMEc4r3DpEez2cjmFTAmH41RBLQUP1WYRLriaH?=
 =?us-ascii?Q?vHwYqnyYmbqFAROzW68CtMUbvIChjbolXXJQDa9fIX33ruzQMAh3BJwNQLb+?=
 =?us-ascii?Q?gZ/f6gUoRSx+y2WLHih6F0ykWtIuqAtm6zNT8WTsFpUTmEQTmMv9IT5JmGoq?=
 =?us-ascii?Q?Dnw7auNnPKqEwCOxj5KvPlJoBf6LrM/AFeDOnQtVZ6VN0WcX7XPl1kIBS9ew?=
 =?us-ascii?Q?ugoHW+AhjhZPnDXOGZpbgHaDT9TpBhWZq4K8OARoARG0vgyEDkgcBs9eu7wj?=
 =?us-ascii?Q?+s43eBEnRYL07kzArYx5OcPNOHrFwWrXtOd69irDm4cul9VPLDK8a3A5Gk4G?=
 =?us-ascii?Q?NBToRwMV41o0SdOuzhQQXMz1hKc4l2HXxBwSwfF2vws8nNPf4APJqrTeXymt?=
 =?us-ascii?Q?+bTGgQlZ0TuuiwkV3Kd50rZYz5EQhjpap88IlHimDjxyfSb6Sn4NHqtcTQkT?=
 =?us-ascii?Q?wK0OG0XDsg9KwS4LmdVNYqAQU2bHXsYJwhpqUEvjSdB2wnElHXlRSKwYrwW6?=
 =?us-ascii?Q?NZCzjY3dCAp4Ocw0as63Pv+9BwQh1DyeTCAShbHgxN4Z21JY5U2TdZgu9CjR?=
 =?us-ascii?Q?IEvewLAtw+iQIu5HsxgTRE88lAdKyejuy1/mvSvcITyKYapH7R/ezSuZ96vG?=
 =?us-ascii?Q?dledKGWVI2GUANPsIxrtKntcswU80w4MLfIYmx0LlVYY9V1hzVajjIUb2uWZ?=
 =?us-ascii?Q?5srnu+mRnTduIHPayHAdq/A72ysdPLVOlziZgdaa7/ucyVn/HiGgZKPbZhvz?=
 =?us-ascii?Q?0hbpjpiGO0S+Ai6y/x5bR+VNvxWcRWKcwUN0XgtgVJkbNpP0JJfD+XBZNsIS?=
 =?us-ascii?Q?uVgFii9rgyPMg8kLX30hamaiQj0/DgMI+SOOodms5Q4+d38c6Fw7M0eh5EGf?=
 =?us-ascii?Q?LUS+757l+EucBvr4YhKj3e/eQiTo4nQOOhDGb6+7rnWAqeFb4IifOnAe6v0l?=
 =?us-ascii?Q?BEiM7AVlg7FlboJAOTjn7A1Jc69QN4A+0iM9IcNuHSEq9qktpjSSPFVndU1n?=
 =?us-ascii?Q?qqByiIrsF1oiXXofLSpVeVm4XDb1vF4CK6/vlk2JQlWg7xUc9KnD70mxedtI?=
 =?us-ascii?Q?G2PVXzpTLgnyhm+zViVEF2hEFO4vkWzxX3bxuh01TrJrUSez+/GYw7TSV9vv?=
 =?us-ascii?Q?6RDG7mA2YlZnn+bWoII5iIIwlCOUCSsQQFe7S/CQ24SV0r3pf/BJq7mqLnD4?=
 =?us-ascii?Q?MTxZcKh8tzoGKMPl5b6Klt/hrS0rqdERWFRfD92H01apysNyLOXDMBWgs30E?=
 =?us-ascii?Q?ruuFcPO6Mir2kyjqiPW97CgrC0O0pemVzL4ciGRCdXYqic9A8VpC1ec2LQdc?=
 =?us-ascii?Q?vBNCmirQTmo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K6L1ktZN4Rnsf1B07s2bUMKDC4Rn6BN3RBrczlPyAkLzumRdQfR43SvwohsF?=
 =?us-ascii?Q?DdKuhgMxRMWtejQv1yzKNXRtN/1pBuzdEnI2qKL9n5gqHYQ29EhsHxW9TC6H?=
 =?us-ascii?Q?UxZCyk7aa3h/Ezh+mbUfPCToUq97/FCYdm1FOL2b1PEYMgVFgihCZwhS1UBa?=
 =?us-ascii?Q?Okc4gvMahVf4mSNOxnh7SaSO/tYKU45et3wO1Uz2TpeF5XdAlnCeBcruLL5J?=
 =?us-ascii?Q?LOunwBRP31SHeHlh9P8D5gY0ZN6V1Vc+YWoyLWspVRJrTneZjqzH8Ylcx0XC?=
 =?us-ascii?Q?lKDSTfhMSsq1T8LJqFGRcH3z+4q+JjehFZaJpaCQyiKEEGgFSfoeutf793U2?=
 =?us-ascii?Q?f3Gy/QavOg+7TilGdl+xPVONwsxZLhyjxxExUItuQieDpQoh+KD9uKlI1uHy?=
 =?us-ascii?Q?uORq9nhZj8SuNCslUC5SfdcL03H5RdYtYyoPW01TJ+9TQCmXyVBsuGKJTS61?=
 =?us-ascii?Q?3EjhaUYUeVbxH55249WijEhTqBaiyoiZ+yBU0zgc5XLY7rmyieGzzaAhK/LQ?=
 =?us-ascii?Q?HYtNbPW8on/kl6iT4EHUsqyHWuNhOVGFOUQ2EQivEb6dundTeoFpgygxWyz/?=
 =?us-ascii?Q?U67nHrH2H/30ikDIPgwLS6pOMWRQoXS5oR3HiOu3y8L7TOruyl+wF6jVDn+0?=
 =?us-ascii?Q?G6vsEVIfF59ms1wD4ftObfdu5/G1NhZv10IzP0oaE2WvNltZPKlHN9cUlbkC?=
 =?us-ascii?Q?Vyiaw8SthJnDPD628hyuqKQUdzTq3IrtoFc4sLm38LX5f/Z3pNK3XG13e7Ro?=
 =?us-ascii?Q?5HI26MedhmZFR46iXWWMtUlrLjglWWgjwkx2N1ViilthwtO3HYob0/V17wmC?=
 =?us-ascii?Q?SDxHuG2LDXYuoF6rb08xWBQFvMzR9aYgzCMzOXJT/vJanJjOOrhKN0F+RbrK?=
 =?us-ascii?Q?Edjk+bhSfJwEZtlGR9GpyGrfk3sr27akv5sfHvabzk1fbbA+JXLwG/8sKFWh?=
 =?us-ascii?Q?ElnRAp3rjujUzGsYEPV6rVYfNbF43kRT2G4I5C/jOnW0YiNA7Ze0LMvn6/tZ?=
 =?us-ascii?Q?YfmymKYZpkqasqp10lpuA6/ddas1TqEw1GSfAsePqbDdFD46hFkrLJo2NoCw?=
 =?us-ascii?Q?uGGNB6DCYszOmR2ez64QzyUGxP5Jz/RxPwAArlana43heXcyZVla91o9CYGS?=
 =?us-ascii?Q?D4tRQWB8rxRG2we6nCjgS7JhHnAGkvIlxlpYst+dbRYCOa4PzUTV+Cskq3e2?=
 =?us-ascii?Q?z92YAXPZRRLQ7DxEMMeIKD0EDRC+UXHZNzhC5cqgSPk0muPdjv1GN8hVkqKK?=
 =?us-ascii?Q?t/heBHCyuAynpi3xNzft9MZ+Wga85LZ/vOrWABHPf+w5J/k4IX9PHULfpeXK?=
 =?us-ascii?Q?Y06pLffM2GRJAU0rh4PDgDPXEcP8ptmfmgQglkGYS2s9wCQuJJC6dM9MdK97?=
 =?us-ascii?Q?hOEhHP5n9ZjIf+cD7pdBW89PlrhCnttzdWuxQZPn3BY73gktzPWqjCDONXDP?=
 =?us-ascii?Q?Aj/mmsYFxxMEy389TkhaLPjrY3V69s4DBfz0SatTtctnbWiJCAyUCw94j/Cj?=
 =?us-ascii?Q?LBUNrseOIavkf7lg+yB68wfWIKV2anLkljom+2JVTSIV64I2H21HCKvXl6LK?=
 =?us-ascii?Q?2cWYVL30DzAZeXoG+gVl5/6I51WQ63oy6vFBRT276aD7ow0zMPSkoDWcgNIB?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5786a3-e3e4-4982-52dd-08ddcaeb3650
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 19:49:33.6068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmPXMaEhj3ZMLUrlSg1y9jHB1oLsj/ASnBie6tMh8fQJHB9aHtZ6RCdShpspkFrmsT88M0A3HoZL3nWdDZ9BIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5046
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

On Thu, Jul 24, 2025 at 07:38:55PM +0000, Shuicheng Lin wrote:
> Memory allocated with drmm_kzalloc() should not be freed using kfree(), as it
> is managed by the DRM subsystem. The memory will be automatically freed when
> the associated drm_device is released.
> These 3 group pointers are allocated using drmm_kzalloc() in hw_engine_group_alloc(),
> so they don't require manual deallocation.
> 
> Fixes: 67979060740f ("drm/xe/hw_engine_group: Fix potential leak")
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 28 ++++++-------------------
>  1 file changed, 6 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 87a6dcb1b4b5..c926f840c87b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -75,25 +75,18 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
>  	enum xe_hw_engine_id id;
>  	struct xe_hw_engine_group *group_rcs_ccs, *group_bcs, *group_vcs_vecs;
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int err;
>  
>  	group_rcs_ccs = hw_engine_group_alloc(xe);
> -	if (IS_ERR(group_rcs_ccs)) {
> -		err = PTR_ERR(group_rcs_ccs);
> -		goto err_group_rcs_ccs;
> -	}
> +	if (IS_ERR(group_rcs_ccs))
> +		return PTR_ERR(group_rcs_ccs);
>  
>  	group_bcs = hw_engine_group_alloc(xe);
> -	if (IS_ERR(group_bcs)) {
> -		err = PTR_ERR(group_bcs);
> -		goto err_group_bcs;
> -	}
> +	if (IS_ERR(group_bcs))
> +		return PTR_ERR(group_bcs);
>  
>  	group_vcs_vecs = hw_engine_group_alloc(xe);
> -	if (IS_ERR(group_vcs_vecs)) {
> -		err = PTR_ERR(group_vcs_vecs);
> -		goto err_group_vcs_vecs;
> -	}
> +	if (IS_ERR(group_vcs_vecs))
> +		return PTR_ERR(group_vcs_vecs);
>  
>  	for_each_hw_engine(hwe, gt, id) {
>  		switch (hwe->class) {
> @@ -116,15 +109,6 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
>  	}
>  
>  	return 0;
> -
> -err_group_vcs_vecs:
> -	kfree(group_vcs_vecs);
> -err_group_bcs:
> -	kfree(group_bcs);
> -err_group_rcs_ccs:
> -	kfree(group_rcs_ccs);
> -
> -	return err;
>  }
>  
>  /**
> -- 
> 2.49.0
> 
