Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB58C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 17:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AB410E13C;
	Thu, 23 May 2024 17:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgkS3+Xq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDE010E13C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 17:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716487112; x=1748023112;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oVidS1cNkcy269mscEqT2ijRgBeiSf2DBSdz/tSVVZE=;
 b=bgkS3+Xqgl7HlA+/B8GcYP8qobn1hR+CWWbJDf7Gjo1vHc0LJzlDcK7I
 azht5c/MIyP5b0/ySib+pGk2Nz8Jcu7xLOsUXpPZ8OhSj8+th8ahp7iSE
 zc4P63wmKD7Xe4YYtzuW98LYyQEGX9Rwf2FqV/nXTOAZo04PAq2KCA2L1
 aYWdWz4HXer9GbhURlA0fgiOZ7wZB8QYDDae30ZfSJYRYACu2Ha+ty16/
 a7PlyeT+UaxfGvQGC6Ddtiten5zVeQeWNnskfOIwpxV240kSdoESSmloR
 OPt/0GIZ/7OxYvuB30HJXvrfXOks0Ei5IpiGMnMTSMgCbm7gvKVc0aJz0 A==;
X-CSE-ConnectionGUID: obSgntA5Q6GeyD9t+oiLxQ==
X-CSE-MsgGUID: 6k0VzlmYTp6o5f0AIxpd2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="23959509"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="23959509"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 10:58:31 -0700
X-CSE-ConnectionGUID: K1t8HriISASWspAlm2QEPw==
X-CSE-MsgGUID: KXLFPwnkQO2l3t/nY5FYsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33873127"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 10:58:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 10:58:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 10:58:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 10:58:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 10:58:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbWN/Eh7hPegbd+lNlJroMT691z9Glb3AIMtU6SpTCkKUOiwUQHgnFdQjfihNMCkjK7s2AF3dYLf7NkyT4syBmTFg21tN8oCaAzcU6Yx/vDFkRwwk4IwMMkahHz0/yZbMoIeDU44b3Ngo94lz0zreRNTRVwNZreJyHg2wD0pfowA7DiBSK/wcDdiGjRGuywHRTPHRiPla9M7e0Mrp1khuTtMtl1rT2lkCep1sRTMDvOQtkgguwq8msZYd35EQsIfX9ER7h/3zUpCrS6ZHbDH5JaMXAY3zXq3v8ET8G8WVxEnKRUfeNeneNzNka9rnjEMu4mxxb5nkSMIkx2CMJUSEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEK22XnPNciOFeOKw3RmSn+2plTXIPiMxwt+hmLKWuI=;
 b=hvLTlHq8aHp3S1bPczJrBcRh/hasb2N2mbnOjuCBZxm3aKpxC4KL1QCDNqX8fna7rWhUISzKDeu08xwaj9QVBAv8tu5bTprslxea6aTKdkg0S2cuYrB3Kl6Xr9o8rkSzaaTnIpSs++OS2w6+vLbaf7rhOti4wpZMfkDRgbymN6xyu5Qrv2cexr8xI2BhR1pnlOG66wwTGFb47XJjXZV8FX5u/+CLhIsMLxiDcCvVzuOpImr6nXSH+JyF4DdY+LAFbGgJki3I6/gEG8kciHi8S4VJyy2uNy0L6Q+fl1Erh7SUw0sG4p/nLVsPnTpGJaPWiq+NyVdGXp0UqpQPEH+mNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB7500.namprd11.prod.outlook.com (2603:10b6:510:275::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Thu, 23 May
 2024 17:58:27 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7587.030; Thu, 23 May 2024
 17:58:27 +0000
Date: Thu, 23 May 2024 17:58:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/5] drm/xe: Split lrc seqno fence creation up
Message-ID: <Zk+DrPWceaGBjwm1@DUT025-TGLU.fm.intel.com>
References: <20240523152911.28387-1-thomas.hellstrom@linux.intel.com>
 <20240523152911.28387-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240523152911.28387-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9e0ed6-5a8b-4240-ede9-08dc7b51f2ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bZgG6XP6o80i2uX3AQcsXHpxU8j4gPU45tYijtawmms+wT35ShO+1yfXXu?=
 =?iso-8859-1?Q?angY/eAlqCkL/vi7A018cPXp8HM0HhUi6ExnC7/848zC/pjIZy4WJgZ8hh?=
 =?iso-8859-1?Q?UL1S1OdO/l7u/xyV+ohcs5r4ejPEAbUR8zD6dsrev8990vRZO0/oVSYTuL?=
 =?iso-8859-1?Q?hhlDb1xnIKBvlJ1Ge0ZZZZhAQTamuS0zTn1EFWQoTDqgWXvLTMHAyw99CJ?=
 =?iso-8859-1?Q?Gov44llDRdRl6otVwgbeS81K3Yr7Fq6dwwSZ7GP84MEsy0Jk/Z8Mm7LuHk?=
 =?iso-8859-1?Q?rxPLlLm/aMSzxIdAbMGXLS12vnfMETnN8KeVAARVoeuIvhKk/Kq0nuN0UG?=
 =?iso-8859-1?Q?tQom47fzhyqsJWcQOC7Cg2lxHbdqTblhOhlnsFvkRbGHfqVJvukf0pBjgp?=
 =?iso-8859-1?Q?D7EqHKaYR1wylBjK/7+EWBAa5W9InjxQVpMa15yjeW2rG++qCb5M9mq2pn?=
 =?iso-8859-1?Q?DrUUkSH2Mw51NxrUxhFT4p2VD04pTH2AvH+ipi+HeX3ZBdWIoe9W3gHzFV?=
 =?iso-8859-1?Q?AZIMgFErumv1HachnOzCcVWz+EkXWOXJ/8EXjdX+RgIOg0eUgBsTK7Pfgk?=
 =?iso-8859-1?Q?+CYltep7krhY0yRCRWp7w6818poYsEWUYWXTPGTubCDGL11esxizGh28LE?=
 =?iso-8859-1?Q?sZu4YrQlx0tGyhvAnYIMSSUsdZ4dDGvlQ0Oq1Ql96RCsrK0B8qF5xjG23b?=
 =?iso-8859-1?Q?VZOSYv9Gk89L33INpu+y83DeeGwih2zDbFmFVR2vKNfiWpwim4n58WLhyV?=
 =?iso-8859-1?Q?zuveVfyHnSZit5UNNaRJxtf0YwDyKfvpMTJ8Pqso/7bBEnIN8N3ZxMM3jQ?=
 =?iso-8859-1?Q?Yit21gmkoIAhLizeHtlKXKLa174P4ea8R0njgOCbJsRNhehhAmNM+BbmLH?=
 =?iso-8859-1?Q?skui1jGy75LKHPJLmzCI/bg9W1dDeoU9yXldRuEvyPoSbmhT1KVdSNlQRo?=
 =?iso-8859-1?Q?XVYcRSmU7pz7D08PCihu8kT3hmo6kaUfgtdX/0G6qLQIk7s2IjMzYZUiwH?=
 =?iso-8859-1?Q?dM2gUrsGLdiS2r3rq5H53i9t7r2x4a//l+30DkRZXT7o7TqYKbOkKxyPJq?=
 =?iso-8859-1?Q?S9VveOxpJQ1dc/nA4CXjmWfWJW0MeEifoBza8G+X8vLLh4dtmCxWK7VA2M?=
 =?iso-8859-1?Q?j4elaLJAQWtT0Qq2MXQjdTspIZk1neORidJRzwTNNuDqCt+3O9PhYal2Yt?=
 =?iso-8859-1?Q?L/hYVNi5/iQD+LdLm6/m0qR2bgCjPrULvb7RxE3PfrPKyxKTXV0N2hZ8m3?=
 =?iso-8859-1?Q?u2PwIhIqAXsV2i18XNvoFwdyZVb294AR1Dx0KKUrDT8VmAdmnKhan/Kfye?=
 =?iso-8859-1?Q?FID6baCkj5Lwwqm4gr3UkyC6BQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PkRhKTWhPd+MPF17nw1zojDrheQStbvVAw+R/KZOmLrBIUUCjKSSuLJzDO?=
 =?iso-8859-1?Q?7i8rRXSZHuaPfXUuR1dUy18LkTMP1MgcOQhFcO240TWbw7yZQOUSsna84I?=
 =?iso-8859-1?Q?c9LnvnxTkIhxBT1ZTk9WPKsxqZTBIi0n5ECfsBT3ypNRWcs8yIO5sncTHS?=
 =?iso-8859-1?Q?iptgKh9wOyDSPZrrjhmAjYLXaRrSFeUgGYwSH2wW5SyPxuwJUyajPx2vP0?=
 =?iso-8859-1?Q?clW1NiRpt2EZW8wjFrAG4g1FH7gegbo6mv7YMQfJXZZvijVsBLHd8+rJtu?=
 =?iso-8859-1?Q?YxoY4fkeJS0QP88SFRQ6Os+XBTFVCQJ23FkrdcvwFKKiO/gf8U1KacIGxt?=
 =?iso-8859-1?Q?0/H0S9OiwgRN7pBxoVwODhM6eqk1+phOx73n1K9N0ttqvYeq2+gkqlMlyg?=
 =?iso-8859-1?Q?Bxpp1zOD8JrPIDncC+0nM4lT9NxsURZVtnlzaoC7sVEvvVM1hnSxzPv9AR?=
 =?iso-8859-1?Q?Mv9CslEqiqQscQWqTOrr+RJOgzTNcsSKn5u3CLl+sRm0ox52Yv05lY7+EK?=
 =?iso-8859-1?Q?4m4f+Pzhh3iLaO7ahg95GFFB3TPvN0wS98Vnpq8aVe5WJk9SyZd1/Wgjr7?=
 =?iso-8859-1?Q?7FbvBvplP3lFcnQQAOCwYpNOlqkRKMk2IpCnNghwM3Y18IczYX7FhEUu+6?=
 =?iso-8859-1?Q?icKagAyhlpxukINft7jIOycU+xwxrB/4PaXLLpgb247bGZDNvJ+tQgabb0?=
 =?iso-8859-1?Q?SKzEdT4bQTvIuMTO3+CsksBogCuqMZIMgqrkI2O6TXPDJ8F/l31n/g7QYN?=
 =?iso-8859-1?Q?5kOwySK1YQV2C3CLG1FOdJmdTv6cMKs9sbGk8aulgI4hflu4NDLB/6c3za?=
 =?iso-8859-1?Q?Wfb0JYuUqKvVLryIogOQ6TrG4IbWm/HgKHFL4uicxeZPFDW3VArIrSz0Fc?=
 =?iso-8859-1?Q?lwAciJXfS+AgL8tGA2fnIV60W+rnKvSfRLO7jgJAeE45u3mYlSBOFQ89jm?=
 =?iso-8859-1?Q?riqGlhcyAL9zWvTIaRcKY25n2+tgjWN/7HRGvzbxjtlmtGUSUAQyM1Ed8c?=
 =?iso-8859-1?Q?WW86XHWixOELA5LgEe83d8QxID+n2E9MAujXOMGcpqwC6cratQPOakfdpR?=
 =?iso-8859-1?Q?HdpvdJE1l/SjQ+SGI4xxYaNR+Zq0UczTtECu5AgdTy56zv10ho89GT72H9?=
 =?iso-8859-1?Q?we6YGysidB8j7Tl95ZCg1n5eDfmg6OcNcMjRCt4x7j0GNS0o3B4Fwq8/gU?=
 =?iso-8859-1?Q?F9YrZPbW4TdbUDQ35ppSH6IDb3+x6lkQQFkXzisHVFaHAuqQfDU1lhfAXV?=
 =?iso-8859-1?Q?NE/AczngCAwz7TH/AkkdloGQLgl2iPH0U5em2p5I6mcBHCE4jjAVERpFTY?=
 =?iso-8859-1?Q?3sc2B8iqAfGzLfKizleAQhTEbFEfQWy64cWpGi2osCrTPkafFynwJGSRUI?=
 =?iso-8859-1?Q?pukdHoluyFceUK90O+0cpwZCg7Enz8lKhRImW1lzmT4jjUJfRWIAJKeTwe?=
 =?iso-8859-1?Q?P9YsWBIQrXUCGoiLZ8l2cfsRq5TZxQPs9dqCj61yH/pQlfTab/uHnrvUYZ?=
 =?iso-8859-1?Q?RHSuxOQ4CC6hfQsA/u+EeyWmamX5SU2UjVGBk2ClNJR+GYDAlJf+P7qXNE?=
 =?iso-8859-1?Q?BxwGHWQJnXS9XEBmHrgnZ9XDUuWVAdwS9aItNnxrje+KYGZJqoOhsZ6pcE?=
 =?iso-8859-1?Q?X1e4shMAr3m843GwlTkDnnyAs/zafvLy+C7w1U/fYQIlxYVM6Mpv4xxw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9e0ed6-5a8b-4240-ede9-08dc7b51f2ae
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 17:58:27.4626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /t8FUTKqWg0auBfSw4S/JfhwgV63UT2nylr7BlPuFUrxxZMQKTxsYqKV9tQvNq+l8r7j9N7qKEK+VuagdZMyfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7500
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

On Thu, May 23, 2024 at 05:29:08PM +0200, Thomas Hellström wrote:
> Since sometimes a lock is required to initialize a seqno fence,
> and it might be desirable not to hold that lock while performing
> memory allocations, split the lrc seqno fence creation up into an
> allocation phase and an initialization phase.
> 
> Since lrc seqno fences under the hood are hw_fences, do the same
> for these and remove the xe_hw_fence_create() function since it
> is not used anymore.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

I think in general this a patch it actually a really good patch to
perhaps share with the team as a learning. We (mainly me) have conflated
create / init functions frequently in Xe and I think this the 3rd or 4th
time we have had to split a function. Probably best practices going
forward would be always split these upfront.

Anyways, patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_fence.c | 59 +++++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_hw_fence.h |  7 ++--
>  drivers/gpu/drm/xe/xe_lrc.c      | 48 ++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_lrc.h      |  3 ++
>  4 files changed, 101 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> index f872ef103127..35c0063a831a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -208,23 +208,58 @@ static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence)
>  	return container_of(fence, struct xe_hw_fence, dma);
>  }
>  
> -struct xe_hw_fence *xe_hw_fence_create(struct xe_hw_fence_ctx *ctx,
> -				       struct iosys_map seqno_map)
> +/**
> + * xe_hw_fence_alloc() -  Allocate an hw fence.
> + *
> + * Allocate but don't initialize an hw fence.
> + *
> + * Return: Pointer to the allocated fence or
> + * negative error pointer on error.
> + */
> +struct dma_fence *xe_hw_fence_alloc(void)
>  {
> -	struct xe_hw_fence *fence;
> +	struct xe_hw_fence *hw_fence = fence_alloc();
>  
> -	fence = fence_alloc();
> -	if (!fence)
> +	if (!hw_fence)
>  		return ERR_PTR(-ENOMEM);
>  
> -	fence->ctx = ctx;
> -	fence->seqno_map = seqno_map;
> -	INIT_LIST_HEAD(&fence->irq_link);
> +	return &hw_fence->dma;
> +}
>  
> -	dma_fence_init(&fence->dma, &xe_hw_fence_ops, &ctx->irq->lock,
> -		       ctx->dma_fence_ctx, ctx->next_seqno++);
> +/**
> + * xe_hw_fence_free() - Free an hw fence.
> + * @fence: Pointer to the fence to free.
> + *
> + * Frees an hw fence that hasn't yet been
> + * initialized.
> + */
> +void xe_hw_fence_free(struct dma_fence *fence)
> +{
> +	fence_free(&fence->rcu);
> +}
>  
> -	trace_xe_hw_fence_create(fence);
> +/**
> + * xe_hw_fence_init() - Initialize an hw fence.
> + * @fence: Pointer to the fence to initialize.
> + * @ctx: Pointer to the struct xe_hw_fence_ctx fence context.
> + * @seqno_map: Pointer to the map into where the seqno is blitted.
> + *
> + * Initializes a pre-allocated hw fence.
> + * After initialization, the fence is subject to normal
> + * dma-fence refcounting.
> + */
> +void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
> +		      struct iosys_map seqno_map)
> +{
> +	struct  xe_hw_fence *hw_fence =
> +		container_of(fence, typeof(*hw_fence), dma);
> +
> +	hw_fence->ctx = ctx;
> +	hw_fence->seqno_map = seqno_map;
> +	INIT_LIST_HEAD(&hw_fence->irq_link);
> +
> +	dma_fence_init(fence, &xe_hw_fence_ops, &ctx->irq->lock,
> +		       ctx->dma_fence_ctx, ctx->next_seqno++);
>  
> -	return fence;
> +	trace_xe_hw_fence_create(hw_fence);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
> index cfe5fd603787..f13a1c4982c7 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.h
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.h
> @@ -24,7 +24,10 @@ void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
>  			  struct xe_hw_fence_irq *irq, const char *name);
>  void xe_hw_fence_ctx_finish(struct xe_hw_fence_ctx *ctx);
>  
> -struct xe_hw_fence *xe_hw_fence_create(struct xe_hw_fence_ctx *ctx,
> -				       struct iosys_map seqno_map);
> +struct dma_fence *xe_hw_fence_alloc(void);
>  
> +void xe_hw_fence_free(struct dma_fence *fence);
> +
> +void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
> +		      struct iosys_map seqno_map);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 9b0a4078add3..7441230ad627 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1030,10 +1030,54 @@ u32 xe_lrc_seqno_ggtt_addr(struct xe_lrc *lrc)
>  	return __xe_lrc_seqno_ggtt_addr(lrc);
>  }
>  
> +/**
> + * xe_lrc_alloc_seqno_fence() - Allocate an lrc seqno fence.
> + *
> + * Allocate but don't initialize an lrc seqno fence.
> + *
> + * Return: Pointer to the allocated fence or
> + * negative error pointer on error.
> + */
> +struct dma_fence *xe_lrc_alloc_seqno_fence(void)
> +{
> +	return xe_hw_fence_alloc();
> +}
> +
> +/**
> + * xe_lrc_free_seqno_fence() - Free an lrc seqno fence.
> + * @fence: Pointer to the fence to free.
> + *
> + * Frees an lrc seqno fence that hasn't yet been
> + * initialized.
> + */
> +void xe_lrc_free_seqno_fence(struct dma_fence *fence)
> +{
> +	xe_hw_fence_free(fence);
> +}
> +
> +/**
> + * xe_lrc_init_seqno_fence() - Initialize an lrc seqno fence.
> + * @lrc: Pointer to the lrc.
> + * @fence: Pointer to the fence to initialize.
> + *
> + * Initializes a pre-allocated lrc seqno fence.
> + * After initialization, the fence is subject to normal
> + * dma-fence refcounting.
> + */
> +void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence)
> +{
> +	xe_hw_fence_init(fence, &lrc->fence_ctx, __xe_lrc_seqno_map(lrc));
> +}
> +
>  struct dma_fence *xe_lrc_create_seqno_fence(struct xe_lrc *lrc)
>  {
> -	return &xe_hw_fence_create(&lrc->fence_ctx,
> -				   __xe_lrc_seqno_map(lrc))->dma;
> +	struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
> +
> +	if (IS_ERR(fence))
> +		return fence;
> +
> +	xe_lrc_init_seqno_fence(lrc, fence);
> +	return fence;
>  }
>  
>  s32 xe_lrc_seqno(struct xe_lrc *lrc)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index e0e841963c23..84e4f4ef7f68 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -44,6 +44,9 @@ void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
>  u64 xe_lrc_descriptor(struct xe_lrc *lrc);
>  
>  u32 xe_lrc_seqno_ggtt_addr(struct xe_lrc *lrc);
> +struct dma_fence *xe_lrc_alloc_seqno_fence(void);
> +void xe_lrc_free_seqno_fence(struct dma_fence *fence);
> +void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence);
>  struct dma_fence *xe_lrc_create_seqno_fence(struct xe_lrc *lrc);
>  s32 xe_lrc_seqno(struct xe_lrc *lrc);
>  
> -- 
> 2.44.0
> 
