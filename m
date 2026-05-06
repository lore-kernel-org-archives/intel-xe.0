Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C83CD342C
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 19:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B42E10E564;
	Wed,  6 May 2026 19:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bUUVt19M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C1A10E280
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 19:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778095926; x=1809631926;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SD2On92BypFRfHqsXH+cGSrlauQqB8Ys/ls0T+hjZLA=;
 b=bUUVt19MmDjhB2eVby/m0BVDaH9hTPSsB4YkhahePD1WxNwlXLVErewE
 0MJRt9BE0YEL2PQwO/0xslv3IHcPw5ullFMNNYAwlqBjdzWG6EVlt0MmW
 7gNOqgJSRQsbVTZg7k9ef3KKbeIGaiw0Ala27qg5O7I2E8PIyZiCeTNtP
 Ypq0qmHpJw7vbC9YbcurI+7M1Iyt7Pw2ksOn9s6/JO9gZumnXRrIXWhOl
 bXPFKad36615NHokut4QsxxglPxZJwXab6MS1aECDrQ+S0EYAPGdmhCxz
 kiOZ6QRO2j2+6jmCmiuahbo5hzbdxfnE3CzqoNwwoq2NeJazlwVwlqVzo Q==;
X-CSE-ConnectionGUID: 3ayUQsesSuWPjNjBx3XGzA==
X-CSE-MsgGUID: Noj76Sp4S6KCjEIA2CpYlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="89737232"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="89737232"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 12:32:06 -0700
X-CSE-ConnectionGUID: w1g5jI3ZSqKVmGcKcP/zxw==
X-CSE-MsgGUID: tCnCDKSqQxCGrdK3Z/caOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="238045214"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 12:32:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 12:32:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 12:32:05 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 12:32:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyBj8+pv57u6Wpz71YbYlHpUvEjIgGQj5jM8E62W8YH1HKh7eBO+SK1eW5SuOu8NEQ4hFOWUGQXspXR9Yx9txlbm1GaE+25Le3xDAl5FiTcr0fby6vF8K3x2QfBA2gAl2TybJbWAEeT1WhAZnPU1qjI7H5d47hzFvg/g0ryKGm5gQf3/mnihOWNFgapnCx+Dy6yweoDQOIP9+00ry/kgIcj/8Uy8cmmHDg7sBEW8rrhiEzpVoncfTPOrAKnbw+mdYufs1THyt2XZgpBuGL5lAnRcGKiG2PA+BQGWn/zFlcdTBXZvm8LxMql4MWNlg4xKCH1BXrq7gTKrDMNKvb072w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5S7Xhd/wkPPgRbU4S32aGV/Aci4DNiZgY8+TezbQ4rw=;
 b=XnDSXF3Mmjp8pR8idbLDYIbLvf42Lh+DISK3Bq8tFMn46ZpNlRCcczvwmRoNRRsbMhhvxGMwNNNu0V1yLBGRuqHKjMP7+YkrQnmR2WXy2O/xcQmtlLuipWPl3nHVg+PUFkXD7hNBLH7CyeL0QrgmptxIRA2hzIx5lrKUaxI4sMB4M+01g30RveyZGp14+SvHRiYXM9AUvcPRZB/G04JusY744KW3Bamy/7dj9RT/073F+oBR1/dES9nbzH8r0EkGFDEWi61OsYo8RkRF/91XUj0LHNoVdhRxqHHhJWX+g+t5uOylNrUKUFiEDUP0hv+6vmj7emJ0tPdf2X04m1k1Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF33E90C8BE.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 19:32:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 19:32:02 +0000
Date: Wed, 6 May 2026 12:32:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/xe/dma-buf: handle empty bo and UAF races
Message-ID: <afuXMP5SURv5d54j@gsse-cloud1.jf.intel.com>
References: <20260506184332.86743-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506184332.86743-2-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0141.namprd04.prod.outlook.com
 (2603:10b6:303:84::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF33E90C8BE:EE_
X-MS-Office365-Filtering-Correlation-Id: bf72c44f-31e8-460f-d6a3-08deaba62617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: yT0cXEOBSNtImyiPkkBYRWOW2+QOPCa/OUlSZVNqX1QfPY1HuCWDi5Ygn1nGmq5R/mY8i/mg9LzOsZWNuR2CwUCc3H25P2pUuwLKjQKvHEC7QiHntgS/OS/5OVKIp4XlrVQ1xwMrsOibBMp/Ei5y10YC1J5gsXcsquJCjRgx3PQMPVqnedKFrOGbjsyVcFyHAZbSeRMVqVsqqqGItiyDWi3K99zHKzaWEOJYdozQaHUkX7u2B0LQpfOIv7sIgu3CKc+hVnFBpE0hpA8HVMeNBoL8yhRE1C6C8wVDitFGpLJW3lcbmxrauK7U3yW0xkinOuSAZlvmAK+iK9x6r8a64AGwnCGC3MXi/Sp3WnI0nGOJk62Qvm5sm79aY6538L43JDLpi9PrMBn7acajfKzq09KAsCkuHk8d2qWV1k3canLWCzNC9pgVbPT/5Lp7MULTmGHwaJoIxf1XhAGbWvRkhLK7dvLEoK1UFHa74UaXjj8E31kDavmOZ3Yqwuh6REIx4hgkGzkrn+/PcyhDHG6j86O3dX/dLubr4KgfE7vIPxAq1zstLpwiwTBVKmAGjc+0o1VLZb29mU+z+0uU0UYEsq60r4K0vqIJuL4qk+t6GGAXWF7U5mQ2bozifplmr/1ntkUu1o+PuuRzzwRniURDgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?G31bFtUHB1M8NM9y7iFLwFUdN/C86TIH6OIwindAazWtew9SuqYaINYBgb?=
 =?iso-8859-1?Q?5B6PgYdHyQZ/lVVPoOqLYzXDZnxoPigjpgM+6svQVIQbVKtS2etkut2aP0?=
 =?iso-8859-1?Q?VerTXYISQVquBPsWJctSkdvC9EBjH1/B7J6QcTAra+XsGkm71PBM5JEi7h?=
 =?iso-8859-1?Q?I5D0yocm4shNyr44aS8Y6Cn1REXbI8a5K75a6i2lo8tfUXSQAg0xfsaOKw?=
 =?iso-8859-1?Q?ZAIkBpuBSIs9ynJnxYBIoobG+/+mJVE0DSu1ezgwRT8nSPKBZbB9r2r5OJ?=
 =?iso-8859-1?Q?JYKDS2aHdlvgPIeAfDA7GfgAoScP/t+WJ4A0wD3+/vQB8fE9pSl3Y98MR7?=
 =?iso-8859-1?Q?8ccMKROZU/p3E3SslIqubz9k9sYe6q1+7Zm6Wy+X2yt9oxq03T3BiERAwC?=
 =?iso-8859-1?Q?kN3Afqqd7wdS9nlCGmOXH+P7dMvObcGu2WHEX8e4iKo7JBd0zj7sgPnFgb?=
 =?iso-8859-1?Q?MHZEIhQIaOrFa4M3Iv7LYsjuK61ef6xJZ5ZoNAvUuBlwjIqhfGrYrZFjEx?=
 =?iso-8859-1?Q?ialhX46ndNcAgdweQgzkPYZv4CxvvdvCX8UmSRMBwzpRtejQm6pZqlZ62X?=
 =?iso-8859-1?Q?3AyV4xOzOEr/IEtF1aC5P4Dgz8KTs9Nb7d59Zp7EAU/h/ecXBZygLYhnFs?=
 =?iso-8859-1?Q?nfJ755FMUn/DslOfg23Ala5mIg30MFlhAaPYZhdyrAVCbA6AA9PW5+IRO0?=
 =?iso-8859-1?Q?d/P17Ch4ekMPbEhsbwnUgwcvHo/fKi6ba62r3m2OwRItZwX2dKkwAqVK6/?=
 =?iso-8859-1?Q?qK2wNDP1JOBVNjbq2Y4RQZplbPevs212ppUP+OhuLLzL9HsUDrTkPnKn5O?=
 =?iso-8859-1?Q?lbHok2OBh9L1vvUpUpFBB2r+xcKBieAy38rjlx+SLU48rCMWK7HnO1aEqK?=
 =?iso-8859-1?Q?ZuvYd8xp6rLh8ZJZ2CDkfJHVOCXIGNwDioCXw4Ti+9EiglTG3YXKwXyQfW?=
 =?iso-8859-1?Q?kRHMjx9kXb9ahmwkx0bIfymYFD9hjtayxagkjKXRjBJ0sIconBYu09BSvn?=
 =?iso-8859-1?Q?neusDL9ly8FA8oTtswVWQ8fRfeSmavxVhQLdSQ+m0GhNXiynYA8yvsImv4?=
 =?iso-8859-1?Q?dTbpcOZROpetBRdDIKTZ/Zk9HfXxN8mDsvnS0Yz+ig7A/JOuXMYk6XIpSA?=
 =?iso-8859-1?Q?Yqi/fDptXH2KhMGGyAOc2lURDaT5S1ZC6RSwArujpqKqPuNgp6qCXAbHiz?=
 =?iso-8859-1?Q?J58ZBvp46Hw5VDD4CByHJ+ow5Li7Baq9wYu35+mJVLitlQvHJXl7SSWAET?=
 =?iso-8859-1?Q?px6KAGNSs1R04CiPCtrJQuDIJVN3NLaBW/f/Ba6nqJcXwU7oZJjkQ/+bZ1?=
 =?iso-8859-1?Q?YfP330EGHlLn1Pm8dkJ+kUt995YQ3J3Y0SLahdKPCVfzys9bn6h5vwlX1y?=
 =?iso-8859-1?Q?X+zogijmeZyGzbBqiaG46X3JDmmQBF2/VnQpw0qYcA54dEyHZFa0KIh3E1?=
 =?iso-8859-1?Q?dMSNIQPYjOLeS3kj+B5E6KWcTDQVy5RJ701KtYHuBp7YgWBj9gLVrRyQQT?=
 =?iso-8859-1?Q?gTYjUvqOmVrH1wl5jfgRIg3P2DfzUbVjxZtsGtdNjxH6VLpkP+3iC0zwle?=
 =?iso-8859-1?Q?k8WwLHNkJCl3t1dk+a8jrdFI+yLcbmE+8ICY/NGfxKCMP6NsUgDlr+O4gw?=
 =?iso-8859-1?Q?cpdNSPu3lBQl/TuXpfmM15MJPPSg3OLqrIV5U093bWca+yB8EhkSwMiVsb?=
 =?iso-8859-1?Q?I6sdvAgeMTS30kLaQJRtmxbtfCM9nEgJvYlZ7WeVwtepw2/pDI8q7+RhI1?=
 =?iso-8859-1?Q?1ed0Kj2H/OmhR9aaKLIAbF68DcELQtei0jtGMqq7l3eDLCv4z1K6KAjNM3?=
 =?iso-8859-1?Q?OcfK/axiSGh2XfSKrdNuPXE//60SiXs=3D?=
X-Exchange-RoutingPolicyChecked: T71Xy5c21dWyPJWuS9hVnp28ewYh9WVaFpqpj7ElfLpk7+R31FxFqpt75Sj2fP60SSLtM499ff5CdVA+xG7+t3bR/ybyfBAoA2Os0GnFIiQgs+xK9pCZJ9ERlItLiX1BZZi4xkX4dDjB4rDfGtIPHJeWTCJreQtXLwDyFXayxaaW7pJ+Ev5eSzCu819yLIB6TLn54pMODVw7yBmtbXxdhEnLXbEnB5mDfVY6/GrX0kF5vOt+ROy/sRr35LGZDX95j2nVt/4F/yKWNtpErBHlECH2Mt5+z/TZuE+f9skHAVz8UGonO1od0KycQDG++mwpkPsN7TZ0IE8SvablF4ox4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: bf72c44f-31e8-460f-d6a3-08deaba62617
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 19:32:02.6804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ygdvH1o4iSW0dA5CuuEMVPYoPRDujgr8oLIwHwFLTmSOdezeB+Fzrcdw1l3/WEGF7xZSnO37A0a+nbxO+XSAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF33E90C8BE
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

On Wed, May 06, 2026 at 07:43:33PM +0100, Matthew Auld wrote:
> There look to be some nasty races here when triggering the
> invalidate_mappings hook:
> 
> 1) We do xe_bo_alloc() followed by the attach, before the actual full bo
>    init step in xe_dma_buf_init_obj(). However the bo is visible on the
>    attachments list after the attach.  This is bad since exporter driver,
>    say amdgpu, can at any time call back into our invalidate_mappings hook,
>    with an empty/bogus bo, leading to potential bugs/crashes.
> 
> 2) Similar to 1) but here we get a UAF, when the invalidate_mappings
>    hook is triggered. For example, we get as far as xe_bo_init_locked()
>    but this fails in some way. But here the bo will be freed on error, but
>    we still have it attached from dma-buf pov, so if the
>    invalidate_mappings is now triggered then the bo we access is gone and
>    we trigger UAF and more bugs/crashes.
> 
> To fix this, move the attach step until after we actually have a fully
> set up buffer object. Note that the bo is not published to userspace
> until later, so not sure what the comment "Don't publish the bo
> until we have a valid attachment", is referring to.
> 
> We have at least two different customers reporting hitting a NULL ptr
> deref in evict_flags when importing something from amdgpu, followed by
> triggering the evict flow. Hit rate is also pretty low, which would
> hint at some kind of race, so something like 1) or 2) might explain
> this.
> 
> Assisted-by: Gemini:gemini-3 #debug
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7903
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/4055
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

One suggestion...

> Cc: <stable@vger.kernel.org> # v6.8+
> ---
>  drivers/gpu/drm/xe/xe_dma_buf.c | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index b9828da15897..e6c2f7d30abb 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -357,11 +357,6 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
>  		}
>  	}
>  
> -	/*
> -	 * Don't publish the bo until we have a valid attachment, and a
> -	 * valid attachment needs the bo address. So pre-create a bo before
> -	 * creating the attachment and publish.
> -	 */
>  	bo = xe_bo_alloc();
>  	if (IS_ERR(bo))
>  		return ERR_CAST(bo);
> @@ -371,6 +366,13 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
>  	if (test)
>  		attach_ops = test->attach_ops;
>  #endif
> +	/*
> +	 * xe_dma_buf_init_obj() takes ownership of bo on both success
> +	 * and failure, so we must not touch bo after this call.

Maybe quick comment indicating something like in the commit message why
this must be done before dma_buf_dynamic_attach.

Matt

> +	 */
> +	obj = xe_dma_buf_init_obj(dev, bo, dma_buf);
> +	if (IS_ERR(obj))
> +		return obj;
>  
>  	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, &bo->ttm.base);
>  	if (IS_ERR(attach)) {
> @@ -378,21 +380,12 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
>  		goto out_err;
>  	}
>  
> -	/*
> -	 * xe_dma_buf_init_obj() takes ownership of bo on both success
> -	 * and failure, so we must not touch bo after this call.
> -	 */
> -	obj = xe_dma_buf_init_obj(dev, bo, dma_buf);
> -	if (IS_ERR(obj)) {
> -		dma_buf_detach(dma_buf, attach);
> -		return obj;
> -	}
>  	get_dma_buf(dma_buf);
>  	obj->import_attach = attach;
>  	return obj;
>  
>  out_err:
> -	xe_bo_free(bo);
> +	xe_bo_put(bo);
>  
>  	return obj;
>  }
> -- 
> 2.53.0
> 
