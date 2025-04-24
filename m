Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE50C369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 21:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9C310E872;
	Thu, 24 Apr 2025 21:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mh2JAHHr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9F610E872
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 21:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745530977; x=1777066977;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DtVLV588wF7TDTLPzx08mZ7SvEv+5Fg6k65t9XnECM0=;
 b=Mh2JAHHr/sjzqEk06uoVmmr57np2KWzFFHMVChBwNXQqpre2Za58Ah/p
 t53GqRJJV94zxASOyDaxDE6UkNalh7VoZLeSfFfup91xksNzwtK7SM9nC
 ocaf+DRnVGfLqF7OGS2JtC4pgcK6v/5yzpSHoAgHw8R9LsSVjMnFOpcL1
 3N11xv8f7A0fFeh2USEeUVqUbVl+QyL5V55tcWTXa3XSk5g7ijC10EGvr
 CHJkX9gAr5Il2F5W3ktUduRDm7jw09I0UwX7m0h4rsDrw/ctbyJLVxywB
 l0wsYNXVMkvgnVNtIw7pe5qVufkFGQVOyVQCKLyswLBz302nUXzzjOTVW w==;
X-CSE-ConnectionGUID: AaPuv20DSiGqS+nqGQRVFQ==
X-CSE-MsgGUID: rOaBWoR4RQ+C4NKcdmmS4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46306924"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="46306924"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 14:42:56 -0700
X-CSE-ConnectionGUID: Slmlv/x5RnCEbcdg8jrjrw==
X-CSE-MsgGUID: e6CsQSaIRkGjJQb7wE2gBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="133264378"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 14:42:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 14:42:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 14:42:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 14:42:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rI+Q0IVDNm8x0haWp36ygWxOYhbNOnQOOEm3qFyvydwnSHouWWWjU3Q0i9U+NNdxgN2xgcPpzHJ2ms6i635o2qISYed/aNKhtWiIu8YYXZLR3GmLAnd8z72uvqV8Onlw2qBmStMPebqplymUNL3n5WHq1wgAgswMB162E/oEPP5Mb9TEOLFE9KVOUKHLQ4E+VXts0xW2Bi8F46+XhDm5etv65S9j/lI2kcgqY4SFWwP3eqMeZ/dgV/3POq6i+MbnW89pK4vLsVCK6/aHa1mQ72DvGa6uhTUw5isfGjFdqNYMD2Mq+BmU2A/ASIjy6qW+L3zwaLXO7gYQBPwlbP2dnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCefBDmfnOXKPM4HfTmG6zf/unhV+NmuERLKuXnTwaM=;
 b=TGqqMi1m2I/zBGLjiX6fo6s3owHt46ez5UioZwSdAFMkNqBDrfGvBepVYoLIIMDn/hhuq9cy5AJ43qJsnh33zWMyYBJzs2wy5n0kL9n/OGYRtP15vSN0g4SfY03cAaFGaNiH8RwZuPizwHm9D7rJTF9w/J4u+qBLPVtDn9Qz6tE58x5wkBh0dlMR7t9jPx1ONsQA+fiS8Wd0pyDH2wYzq2HezfJJEeOFfHDCbZv8JZsnKw/lqotVlKRU6jvk7Kv/4DaOLAgPrX3kftRI8LUGRcWVZPigv0w5eMNwrEPqQs9b2QwIcI7CbXtfVQw6ao8YcBwI7ejLdcZsE++whyE8Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF10DD61CAD.namprd11.prod.outlook.com (2603:10b6:f:fc00::f08)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 21:42:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Thu, 24 Apr 2025
 21:42:34 +0000
Date: Thu, 24 Apr 2025 14:43:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 3/4] drm/xe/vf: Disallow setting wedged_mode=2
Message-ID: <aAqwm2B2yLLyg7AC@lstrano-desk.jf.intel.com>
References: <20250424143043.937-1-lukasz.laguna@intel.com>
 <20250424143043.937-4-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250424143043.937-4-lukasz.laguna@intel.com>
X-ClientProxiedBy: MW4PR04CA0188.namprd04.prod.outlook.com
 (2603:10b6:303:86::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF10DD61CAD:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da89376-0b08-45a9-ce3e-08dd8378ec33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C4a/W2I0yPMnvjPgxFt36YydLuPRPdEEWVWMg2b0x+7TfpqJob+d/VFx3Tay?=
 =?us-ascii?Q?oaQIP5231QJImc3WMscwUDaADfjeDJ6prr+Mq49bdPZdb5wIF2o0Q10OSlxV?=
 =?us-ascii?Q?RMN/iOWujVQs6xpNCzL/voxfE1AxT5OlmCua7Q+zJX+3mktaXXBGZMTfyJlU?=
 =?us-ascii?Q?X4WS2donlBMMBtXWXA2c6+QkU7PMHg4cW6Q8i81Ekk68LH9QKxKA2rK95s5/?=
 =?us-ascii?Q?Y0zFPUcgRxt6QQoNZsSgLDs4oJOJTXHMVghGCA4X4k50oWssz17YfDSi9U4t?=
 =?us-ascii?Q?687x5qO1X7T+zQAuR9TeR+jEUbygYAH6bpPrUasHWGO95n8dx1nehCep5EZW?=
 =?us-ascii?Q?XhThObDH+KrJI+4UIXO3QlpXJLREbaGinLAJMaGKKAvZAZDcYFj+5qfqsZ5h?=
 =?us-ascii?Q?pIcNpPES2YfpJQxfuczQ8jUkPWGO6B8eyelFxfuEOFAhNEGKR0g+TcHIYspU?=
 =?us-ascii?Q?nL1YGQOiOjtrJWZ8RRQMqwZp3X9hwpy3jEx9S29TmmVT85aJRquL9GAnyjjC?=
 =?us-ascii?Q?kx4vAk4n/d6Hzf1a1E33n2fJU6xrnfqjKRhXfId9Sq2xJEbbwLYuF/MReF2P?=
 =?us-ascii?Q?awU2VnjvQ8ufFrpl1WiiNUGbfL5yENv6Gh97MW6KTu/tbiOGxryIjJelyyDF?=
 =?us-ascii?Q?7p6bdLDKBo78BZr8ZzRtmBi1Uu8fn3FwFeqdmPP0DaJb/pFuiHlNCQG1PCOf?=
 =?us-ascii?Q?Auy+fhvtqKUswBjW6jSMM0W26TExyIBxU7ExLvVpMlOhsUPl9UZqGty5ZElP?=
 =?us-ascii?Q?Vj54btSZ23x34mx8l7v5D9tEXyAGGxlcgJ8kfMxW1K6An/ZK3mt6p4AyoCbB?=
 =?us-ascii?Q?tNTAcKhnHih4doIs6aP7FJnh0qUIh+Lj1YMdXpfVkVlz2PPe8wS4kNbp9mSq?=
 =?us-ascii?Q?3LKzwlNpQImCvOV6iGAy5QszI3DsPM1RmM+kzunFZkAiAHSDbC8/9YvnXxJp?=
 =?us-ascii?Q?K7/XCD1tUUGPA8DgKYAG3vEABqsSV/Ym1HcrABthyaatipWMKCeJgodK1vZ9?=
 =?us-ascii?Q?kETSgeDOsfQpJIejFxAURLDV7t7ynIQIzlhb6y5drYDJfgos7KXHwB4gWKSf?=
 =?us-ascii?Q?CFy4J3oHi7XlApwBckIOqhhjIpHtVeSJdl4s9JCuV5uSYIIh6OhOjz/oCL0c?=
 =?us-ascii?Q?HDBT9PSxWhwMc6FID+AUtc33ITR7eaUCtahNVGWCpHiYSEpeWbVNfKDJoG7D?=
 =?us-ascii?Q?p/v59x1hMT3iISeqG8+OHnhI4gYiRd0sIwq+/+7JlczNEGHA5hJGOXNCpd5N?=
 =?us-ascii?Q?LzF8T4XpVHi4389RFtaIwomUATvdhvDtrjqV1oQ7GAYYpTSKQ895UIwJnx3v?=
 =?us-ascii?Q?/iFjKdDejr0cnf2Xheh0FRAZRqtFo6GVQitfaVMXUdswz3/cxsiLUiaaqpMD?=
 =?us-ascii?Q?4yokmk8LsbWzCOgZhusXn5HhO6HxT/JJbrgFNx0OBeEDLRUPxCcwbWMZO6Np?=
 =?us-ascii?Q?sFAl23Fpb+A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Adj1VAP8YkMi7VuDsB1dCLSPC4zFoHvEd0sAo8uu9qrhGKR88zR0piY8D326?=
 =?us-ascii?Q?UNzdjiPKXsFAEMprJipz4zWy+W4dFwi5kGVx1LT+QF89JvVXp+dBUjDMQJzG?=
 =?us-ascii?Q?58lBC4KOI8W2kJvT4Mfq92Pn+aqvx+NWsh03ajhdZYRGQQ2Uo2NidR2zy6nj?=
 =?us-ascii?Q?AmBNaQ+S3Rsfupdsb1EFDbUeV3uf1+BgeK8RnkQ/AJcjvmMT0CpIcgYI8QLp?=
 =?us-ascii?Q?HW6zg4j5Q3xkcLAg1dav33sbYs1o+0p3YalB/CedPiiI1zM2yRIhAfIBqcGW?=
 =?us-ascii?Q?QsOC9jDGOqWxwirpBSb7ZtSwuir3+0yY/VB8YSZarp3Fiyejj33KR0qkQqoS?=
 =?us-ascii?Q?QEt9UfOSkVJ298p37Gigdr2y96HHo6aEM0MbROY3mQ+7W8EPChSG6dZPJBDR?=
 =?us-ascii?Q?jpRymnHL2PCQffQ6iHCyLPxUVqqV/dXi7NXb9NC7yzrbaGO9QQWrAtFXjP+k?=
 =?us-ascii?Q?DIdBdgfDbP4S0GeZrJpZXKQHKwgg38T8e3a0wl5jEzJa1l+pI16Ld9Ur8B8D?=
 =?us-ascii?Q?b2+N2SmG4Sa5XshfCOe48MYt5LePIPrvbRPB1RvuMsqXj/91CCR07mejhqdQ?=
 =?us-ascii?Q?bEcabMl8F5xFHtQIS9eVnMQeSkPNwHRh3x7HoP13RC17e1BbELVGWUzSCN4Y?=
 =?us-ascii?Q?S7GJHCu5fhfCfgAlbKxtu0HJVnh3Iz+ENkx8GlvlBmYk6DEKCvh7uHPllqdo?=
 =?us-ascii?Q?s2XcgJzqluymOZ1kJ4Fq2jSP754iiPpY6dCYFv4rfOdmFHGYmb0fgv+NPIap?=
 =?us-ascii?Q?DD8RX8C1MrHbKLvg8xJ+hS7gaOF3naIrEl99ouMcb+I84pk3hJplNGeCxbVx?=
 =?us-ascii?Q?st4Jhtnq1Ac/y6MdLfeQm9ZsrsqAf3FBMI2FEYE+LpsZkEIUJXyOMPuZdXl6?=
 =?us-ascii?Q?3n1u2c9GrOveAQw5lfdB6TNIsSXM7twf+7wsuFSppPQKkyuWQHarrOIA9+jO?=
 =?us-ascii?Q?iFm6bGWTa1nOCrtRUxJp1CXNdjAFgeAeyT0AtEDKVT0U71bCe7hn55fKz/RG?=
 =?us-ascii?Q?+S3NbKT3u7tZn/IjS0LIQBRo+pQxSNAZfu3xxkezQ30aaskn+711+aB6zMpf?=
 =?us-ascii?Q?rUz92dxeOLsyNSplMEoi2SPXTR46G9tLUS/hABZrl/F482MJMLboZ4nacHna?=
 =?us-ascii?Q?FLYdp8cdhz8o53gCoZPn9Uir8Thwo/bLHaUMgxexZRveASFGncvWGO5X1dwT?=
 =?us-ascii?Q?HPIUO3l1aqFpoPdBRnQuTA1aKuMBqWdJ6ndCghbf8a0W0xwMmGtri+KPwbtr?=
 =?us-ascii?Q?m9GMNuSJglBPR/Yv8MlewOpEScYKYyxK8WgbpScKQRmOxh/Y4LgSWv/mPr/W?=
 =?us-ascii?Q?2AuXPBsQk9WL7BFuK50pxaZxecJrVOd1jwIypLgFzcDOHq7+KDehSZoI3eSy?=
 =?us-ascii?Q?aSzZRstJR4OIr11FOok5LIUHyvLiXd9yax/ypoY7H1kvGutaEbEcoenIU5BT?=
 =?us-ascii?Q?ksbr4ZgvIY05P3YcQTZX+FJhBVBB/avoFGT8dPb0GmWY2sNG1xnWmP+yOqJc?=
 =?us-ascii?Q?XAYe7AtvGuAzsSKZxmGGYJZ+AZ94u83gLRh1cU+uDS0g+J/w1QrTsBXpxuFG?=
 =?us-ascii?Q?WwIE6JkNWa6SGh86TDU4Fp2JsiUoW2VJj6SfbCYBpOTxDAswTzAL049WC1e8?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da89376-0b08-45a9-ce3e-08dd8378ec33
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 21:42:34.0214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +D+lTqE+zM4YjykCYY+bBTKA7E3xQu35Y7vFbJKhOV5aQYbR/MO6+hP44RRsr4WkBltPbPqJ01mYv6LA3eTbuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF10DD61CAD
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

On Thu, Apr 24, 2025 at 04:30:42PM +0200, Lukasz Laguna wrote:
> In wedged_mode=2, engine resets need to be disabled, which requires
> changing the GuC reset policy. VFs are not permitted to do that.
> 

Again maybe a fixes tag for this one. I'll leave the review to VF experts.

Matt

> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 3 +++
>  drivers/gpu/drm/xe/xe_device.c  | 5 ++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 2e6d8744003b..369bb2103e4c 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -169,6 +169,9 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (xe->wedged.mode == wedged_mode)
>  		return size;
>  
> +	if (wedged_mode == 2 && IS_SRIOV_VF(xe))
> +		return -EPERM;
> +
>  	xe_pm_runtime_get(xe);
>  	for_each_gt(gt, xe, id) {
>  		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d2de6936cc20..13430538f861 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -731,9 +731,12 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	xe->wedged.mode = 1; /* default */
> +
>  	if (xe_modparam.wedged_mode > 2) {
>  		drm_dbg(&xe->drm, "Used wedged_mode value is invalid. Setting default (1)\n");
> -		xe->wedged.mode = 1; /* default */
> +	} else if (xe_modparam.wedged_mode == 2 && IS_SRIOV_VF(xe)) {
> +		drm_dbg(&xe->drm, "Can't set wedged_mode=2 when running as VF. Setting default (1)\n");
>  	} else {
>  		xe->wedged.mode = xe_modparam.wedged_mode;
>  	}
> -- 
> 2.40.0
> 
