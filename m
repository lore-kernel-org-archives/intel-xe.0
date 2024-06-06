Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DC8C41513
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 18:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1E010E0CD;
	Thu,  6 Jun 2024 18:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kn9cXh2U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C0910E0CD
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 18:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717697242; x=1749233242;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GVoAAHKAQMCs3W2msVHA5UzQ9b4NkR2MQpqGpDaYjAw=;
 b=Kn9cXh2UI3wTIYlQQDAsgoKiHMCPnmFNksUtBL0iPhQL6LRJV4R211JW
 t0rcm0WGkK1NM74Vz1C1uXMC2uesfST9HiuABM+U2aCftvEkYGtw/emP7
 Fn2odAmXcYxSFvtHTyXgAckyVvnc2GR5QbfaZRf7Iz33uoK4R9OMMHXnB
 M0CnhRYAKHPmTeOFRc5qZbLEj1ycrHr2VltI7gKC+HXU63MWVIqvd4zjZ
 q8NXTulV0kYd4DnQlfkfXD0Jf2/eLAs0q1hWeEMO9y/eIGn56/4ox0qJr
 bgy9HIuxUUmeWVzkPkCWqcq9GSKeaZcE+DYfvPDgaqrkm+awS7Nsgx5su Q==;
X-CSE-ConnectionGUID: rpDetD1uQ2S/j7tQV2oqbA==
X-CSE-MsgGUID: FKWGIFEsQyuz6sM/dPfRrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14224578"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14224578"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 11:07:22 -0700
X-CSE-ConnectionGUID: f43KXXpTRUqTFRnkvVntbA==
X-CSE-MsgGUID: 5kQFzV5kQuqKOq6bOzy9/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38058437"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 11:07:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 11:07:20 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 11:07:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 11:07:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 11:07:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJPmd0i8GjmZP4SgxFAft2j/22DWwE/d94NhQbueKoPJ0SfX98Yx2NBzVO5hB7Sk/79BN4tqH8HPSOGMyzaCMz7KRU/0FQAFMzkwn17AxbQSfzUFX26JxfhufY9u3LKpfnQgE5EUTCFTT834qGv4wp582geoU3O37MTr0hkmq6hAW+jnkNE+7mDIhxyXf1qKrvJiauHAtzWBwp8Bsft1AhLxv2lsYrb5uqCdBdBl8dG89UsBNmP8XYG+gF+dMQLof7q5XCNFHqBFhB1Q83g1UF8xy9KM+ofhtvKZlXz89bKEkmvpYIwrBd+ZpFPVFw7xgaeuHxAjy1PDhK/VjExc4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRVFV4y7qEQexnheiC9UjZhOVOJVkuwzdfqR+PAYxxs=;
 b=HQFly5phB49xJ9eA8JG8u91xzdiJ1a87PES6gxjtI3ANIvI8FMpiaz154l1Z5i36NoPHnajgJudKhCC63Q+usyFhxbnnnXBHIPPE50c77OpqmNc4NfkbRHrMGN+AQnyzD//ieiN/r0WOR5dzmf37krstRLKYULCcQWUQj34QLF9NPIE1udMk0ELZoLQRPmitJRuqwgUDwwFuGDWXvtlvN5qQ/CRYKJrTlXVWpQz5x2dxUJVT7L+kOPM+HslgSzdcIcfIwc52feORqkdjioZo+/zUkVJc8qJ3kdfCI3m54ABPcybSu225yoxyPFTPiyplLamrm7ACQydvtgRyX6BMNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by BY1PR11MB8078.namprd11.prod.outlook.com (2603:10b6:a03:52a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Thu, 6 Jun
 2024 18:07:17 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 18:07:17 +0000
Date: Thu, 6 Jun 2024 14:07:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/guc: Request max GT freq during resume
Message-ID: <ZmH60kHKKefMJvry@intel.com>
References: <20240604233751.3947374-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240604233751.3947374-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0237.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::32) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|BY1PR11MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: ec605862-671b-4125-2b59-08dc86538042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GRqViaB4gakTHVnqDgUScD9jT4bGVnBhJTbJ6GxHlGtxjmsyhB3nFnTzJPRQ?=
 =?us-ascii?Q?GV6gOsNR60Y17lXfYoBBumO2ZswT1y8qv9ns0v7tINGUh3y6qscv5O1vTVEm?=
 =?us-ascii?Q?vQlgg1O9bnr0Hq3wR6VkgJTQ2wDY7qmATeqAL8WexE0VdixBAcuVkvG64qML?=
 =?us-ascii?Q?RpXO6Dqq7XrIhGlwVzolKbh1QbCKQkKIOOtykw0MJSoSCHS9Gta/fk+SvToi?=
 =?us-ascii?Q?9TQxmAxYjmlMmggSbYkuPVfMCqsCgVw5E1sGv9zMeWvNol+AjgG3STm4z3UF?=
 =?us-ascii?Q?14mYpYun9HGdQTnaYGBdyNG+5dGiu/HkzRIBe54EHs9xBBmeHZ10iDeqjwe/?=
 =?us-ascii?Q?VPH0dyZXrPe75FouSURnndWtOigQxjEH0wNY4Q4iDEwc9rlYR095WsQbJQMh?=
 =?us-ascii?Q?kthwQK8dozIlDBUscqXQmn/JeQhp5FpGSxmDdNvRETYMLUNlW7kU2BVrr/b3?=
 =?us-ascii?Q?6Fo5eBwR0hDevhXqOfmsjgs92T+s6H0LyB2KxtO4IFoCARckRk+ANvR86NA7?=
 =?us-ascii?Q?pxB+SKuAE5k/8FZi83c7ZuFWb3fer2pU4lmVTtRN51dFj9gFZ5rpRomVXSVB?=
 =?us-ascii?Q?16rjiaqplGC3Zcz4YyYSevEP0AiSXPq4gTVkPbEwP7wg968EXB1xMN74Nnth?=
 =?us-ascii?Q?/pzbjw4zRcANeWbwVdQ048FW9cT5PuWhDpEQ3rFGaPP7LLb4HjxJvhYwOpNt?=
 =?us-ascii?Q?7lUIGTyX/W6PILj5lsrbxpnAgLi6BkkHcT0sKpQlvWGdTm9ZVS+Wu9K64QEe?=
 =?us-ascii?Q?nAgnH3M0vAd8nKADhtj+zmQwsz+w8Z+qQ5l17P9TgSJsVl8/Qa9YNT6PbWhJ?=
 =?us-ascii?Q?LczS/UJ5Vaw2FSIFp8yLQC3imNJgDmYaNraSiL/6Qo7BczhM+F/t+MiImGAj?=
 =?us-ascii?Q?QIJdfG6ccC9Z0wQZaZ5XTGq9IpZfOPeN50JiKQK4UmYmcuqU1nOd5x3NdB6Q?=
 =?us-ascii?Q?FLwjlJcpkARH+WMKvm6sdnpQQpDaWYwXqn8OPNzC2Id4iYqRjiQYuWQA8jzZ?=
 =?us-ascii?Q?4vKDR2zuWJSGzTAfFlvQKqdhErR5GXR/JJ+10LleEXtobi9phs1cSTVHdUs2?=
 =?us-ascii?Q?Xm5oWsMZZjWE4+ZotH/4f5jueD+5/Own3vkAR2AxYc6XVgc20Oex9uHWiLGE?=
 =?us-ascii?Q?T46Y2qZhK8cSSgkpL6Pq1hHynmBuXTpoyb7DFUP9HzXUvudyrRPJM0FNHVJm?=
 =?us-ascii?Q?Cfx0ub1lDYZpIj2Sl2KqiLqQ1tJJxeCTi8y5TwHDWray/vJLQngf1EzqU5kN?=
 =?us-ascii?Q?JtG6/QIzbNiIFMc+hJJxpxDm+CyqfSscqScvOjH7BCl+yAiFvISCt193382K?=
 =?us-ascii?Q?oa0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kLZoyKPapMJuz/SaVPRrSlvsurf2Wfj7R6AEhXmCuL2DMdh91dPz4EpNvQIm?=
 =?us-ascii?Q?U4tbg1fNkWuLb06qRT5C15odwOesomRgJaH5kvAtL1Ph4nnVxyT7mN5xRe0V?=
 =?us-ascii?Q?quRxp4g5g9/0u1h+IZWmaaxp9mwEq2nH4TdVsNzCjQVYOdqLTDZl4Rmze0G+?=
 =?us-ascii?Q?OtXcXeU9+H3CsUlQvItWJmEX//ib2YYW2kOO79VX/sM3r7mvsTGPkFdPY86N?=
 =?us-ascii?Q?SyXTajl4C52c2S+ipTsk8XFoxx0WFBZw8YwrT2FLAjZaagYNTS2qQxU9Niuy?=
 =?us-ascii?Q?3ARiXe1F/4foFO2gzaeapLdg4BCG+kUkDSwcZWJI7FgdZ6YAchpEcQP+1EW6?=
 =?us-ascii?Q?XJ4+vZ2ax7XEtpKo9alTVTle0uqFiXAcQipnnLPRXHfpcgGjPnlFKE3hRAfs?=
 =?us-ascii?Q?ATxc4QpmEZda8POAYN51fuOJZ9t/4of6mPubzNnHFNAhn2m+zzsSnASVgDaW?=
 =?us-ascii?Q?8mCrjap9ID0iZv78x9hvHSy3mE69zaaPHlKNWuHlqyGjqVn03zh52TLfk+ti?=
 =?us-ascii?Q?KRG6y/e7A0HlEIZwMn/evCYsvUraTpnHGoI8toA8GkuCvncjrkMRyeZJ1EZD?=
 =?us-ascii?Q?NLuSkM3iYNZF8zuiSesbCJ7Y8lonhUuItCjh4pe3j3UcdxrCxrIHppB2Ljh6?=
 =?us-ascii?Q?tPzTOlBwdrAft8l9HF5TSUs8mVGpdTy0fYkLbs1sLW9Dnu6sAWdx17JQKprb?=
 =?us-ascii?Q?Htd/Cks41gvqxcrQ2AmUiDgXQ52s6HOyUnGG/p1Np0cUj+q/gEdKvfEVLMaS?=
 =?us-ascii?Q?BLSJJvrtI9cdBbfawJCKXLmd4gDwB60yvtoQSPSXC1LAq3mVcySTBXSJPJdI?=
 =?us-ascii?Q?9xn2V/Aq0wa8lv/mUUz3n72o46w/7UyDwgwbm0SK4sR2Ksl/97OG//bYIdbt?=
 =?us-ascii?Q?L/02m8IZXmna9Y+kqQZcSNRyzPuw2TFQc6i/WnoYDVVpy8rdLnujenC95cvy?=
 =?us-ascii?Q?0bAUjx/VpG3UExETLGeHWXb0orQiwR6BXmPnNYquyL8H8W+PfWi4lnzvEY1r?=
 =?us-ascii?Q?H54UjFdcFYGpz6VHg+cB5NaOf1EQqU5sWvgbPA9jaWgoOWfH3FrtsU4rTu1M?=
 =?us-ascii?Q?V2TpCKk2JOAiBiKML62ek3AvfQ1QihLeIFog5sJciCtU2o9e1FF/DTI4+XMv?=
 =?us-ascii?Q?N43Vot8OAH2umzGho69UDpcI52P7IJjyJ8YtgWNLXGhQaWvmM/59nr0iqcD4?=
 =?us-ascii?Q?zY9vaAhNBXa7V0UlW/8JA51pINmrpBR4draQdyjyW1d+3kLSDGJ+PuJrBTmX?=
 =?us-ascii?Q?6gLO86fMhgP2aJrcQIwHDv/416IOmStwtAQbP8HJbTojXR3MK7vzZbkzUp7x?=
 =?us-ascii?Q?Y93jBxCyvoCaQlLoBmBOKwLqE9bhFXHO+BschBUFgOE09V4FVFrM/sWXxgK9?=
 =?us-ascii?Q?rgdz0mvnY/8+dd2Zbno3cp67H8Vut8YjWyAuumtUtB1EJgt9taq84RRL2+Gj?=
 =?us-ascii?Q?9quZRE+Co7iK9Y1X73hObdgav17JxpPLIKwNZcjLKnHmbFMgjrS4SpoyLI5O?=
 =?us-ascii?Q?P3c8BNyLsG039L1a1YhwArfet300fNoCVFU8NIg/iaowWSuWhiCG9ttj1qao?=
 =?us-ascii?Q?IFa/Tv//88Y8NGVA4oUSZG6Ej56jmzBUFGdQi21h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec605862-671b-4125-2b59-08dc86538042
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 18:07:17.3656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lT79xX5J+cv05r/PS7irxI5UW8hIHOu/1qqFS25RnSyh0eyDXh1IVxo2QGyZ7Vr12dl0yV6YdGuHSGCGKMaCHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8078
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

On Tue, Jun 04, 2024 at 04:37:51PM -0700, Vinay Belgaumkar wrote:
> We already request max freq in the load path, moving it
> to __xe_guc_upload will ensure this speeds up GuC load in
> the resume path as well.
> 
> v2: Rename xe_guc_pc_init_early since we now call it per
> GuC load (Michal W)
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c    | 6 +++---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++--
>  drivers/gpu/drm/xe/xe_guc_pc.h | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 086a048876ba..dff9a9dfda87 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -696,6 +696,9 @@ static int __xe_guc_upload(struct xe_guc *guc)
>  {
>  	int ret;
>  
> +	/* Raise GT freq to speed up HuC/GuC load */
> +	xe_guc_pc_raise_unslice(&guc->pc);
> +
>  	guc_write_params(guc);
>  	guc_prepare_xfer(guc);
>  
> @@ -781,9 +784,6 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  
>  	xe_guc_ads_populate_minimal(&guc->ads);
>  
> -	/* Raise GT freq to speed up HuC/GuC load */
> -	xe_guc_pc_init_early(&guc->pc);
> -
>  	ret = __xe_guc_upload(guc);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 8187dfb2ad6c..eb7950c36151 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -675,11 +675,11 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
>  }
>  
>  /**
> - * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
> + * xe_guc_pc_raise_unslice - Initialize RPx values and request a higher GT
>   * frequency to allow faster GuC load times
>   * @pc: Xe_GuC_PC instance
>   */
> -void xe_guc_pc_init_early(struct xe_guc_pc *pc)
> +void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc)

I agree with the intention and the reasoning and the new name.
I just feel that it would be better to move pc_init_fused_rp_values
to some kind of init_early function that gets to run only once
at early stages of the probe.

>  {
>  	struct xe_gt *gt = pc_to_gt(pc);

I was skeptical about the forcewake assert that we have underneath here.
But I'm glad that it doesn't seem to be an issue :)

>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 532cac985a6d..ae000e66684f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -28,6 +28,6 @@ int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
>  enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
> -void xe_guc_pc_init_early(struct xe_guc_pc *pc);
> +void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
>  
>  #endif /* _XE_GUC_PC_H_ */
> -- 
> 2.38.1
> 
