Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12752C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 17:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93D710F186;
	Thu, 23 May 2024 17:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WywLHXNs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F8010F186
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 17:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716485843; x=1748021843;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QNf48hUb6F9xX3eE26ZzQTvEXPqI92t02t2kXjWEdsQ=;
 b=WywLHXNsCT2lkCLdkg86FRGv6qWeYOd13k8x/36ENKALG4MAIGS4G5gx
 6ksdC+oJXFSsadWgaxV6x7VFe7clVeEcx2m+bPPIz4jxrs511mCB0ow2D
 Aq+dOOnkl/rpxHwYKTvreUbBvVNWClcMuIveatbsap0tLIDNCxT/4NcBj
 exDFbcZF9TefIJFa84F8JJNzP8846Xkx1QSWN/eDzntPpQfu36ynT7sOf
 bCfGS1vUeRwSvmbANreyN+UCawtXFaseAbXE1GocJWy58q3SZWauIGegN
 YOEtzUu2etmX6YoQVyrLTZ4hrILF9QGN7UF89aORSm+Lw+O+sXuOOzIkg g==;
X-CSE-ConnectionGUID: E3tXckcrSzaZOTzWGYwV1w==
X-CSE-MsgGUID: Q6gX8DAOR7mPKbKay8QBcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13010761"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="13010761"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 10:37:22 -0700
X-CSE-ConnectionGUID: az6WNJjzSA+IjA8QhvkYOw==
X-CSE-MsgGUID: pKAG99qGQbCHzzQsolgmSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="64572742"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 10:37:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 10:37:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 10:37:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 10:37:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 10:37:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=im0qthpQFDy0/BSheS5JZcrv0IrAkc5THOeVpC1i68aZ2SpozUPcM1paipuWuVnj5ZFzsnGpSmJYRWFyltEILzVZJTtu7GIBKSfC/lu+BB63Z4jeT+JTLRFTEOyxHoywgi10iro/O106rnDweD/4L3eAD58hcmoWJ12VMTSMHV5NpY5LNtyF3PeE/y2s6d/KguXUtaGuupJGvXHrbAOo9IFsyojaoW4h/9DLALdMqTrEHoTOBiz0BnNrRG6Qi708WRrTPtHMKYKQ1aYUFEEZFh9WWAayFtab3yRj2LeNY7kbBYsdA/bL5x3tq3zQpDTMRJCd/wZHZDXOFE37mCo0Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeil25h8GoWbezp67aGHJEK1Hze4V1jy7tsZ3fJg4y4=;
 b=TcZvEsn4/V93mUX1FhgcEkfMKIypQ8lKd7sWqtQAnAvM3G0zfl37Fpzfx+tpV3z5WP0pBJpU2JK3EG/+C8m4fdQ8P58YOUDz7RCDgF/rcs99DvDncFFPAPAxADhApZj/PUY7Rv6So04Gd8HsLYtlNZbjd0ku0yEeLsQ+1hU9y7G8nOWwE4fOlVBQzVQfp0MqjWVmoIn1egU2CAAj2ONHR7EwVu5o7aSM0cDLbckuFQOsGaN2DVuiCLgFVjrSVJNXaCWH9R6Jm3R966xYpQtP3bjrFKTEJHQyyB0gVulVfqGOETajvzzlyxXU4EgSFF5QhLCAUDM166LQc2ovnuLNOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 17:37:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 17:37:17 +0000
Date: Thu, 23 May 2024 13:37:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLlBhdGNoX2FwcGxpZWQ=?= =?utf-8?Q?=3A?= failure
 for Enable Coarse Power Gating
Message-ID: <Zk9-ysDlnpWvxkl8@intel.com>
References: <20240523134710.102037-1-riana.tauro@intel.com>
 <171647165094.2169849.12191764250511822539@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171647165094.2169849.12191764250511822539@8e613ede5ea5>
X-ClientProxiedBy: SJ0PR05CA0068.namprd05.prod.outlook.com
 (2603:10b6:a03:332::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5302:EE_
X-MS-Office365-Filtering-Correlation-Id: 632d0d03-6cbb-4b11-fab6-08dc7b4efd6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uRmbFTic7s2p90xzdYAULTdTno+ftISjlIAEqxdlJSI64qQPw++FZPT30rMs?=
 =?us-ascii?Q?eQ+nQDNyPd+qJIT8jhZ2kZz24Ob5X5kEq0D5rwH4LeDMOiHC4/ZTPZRv1/+x?=
 =?us-ascii?Q?aZFdnSj1HfasOVQ3jPcLM7DuJ2kalX+leD/soR3ghVIQzh51TjysRsuSk7O5?=
 =?us-ascii?Q?rwntUlskI6IZI0y/uyobOV+oHjmf4GRwDQUu3WuOjrp+r4Sm1B44oJI10Cs5?=
 =?us-ascii?Q?nMopQlfQ6Tud17Trfz6tYpcTihaSMnA4vDcFRc5b+eu2ACMVBHNUIve+UDA2?=
 =?us-ascii?Q?xLphEmo1eAmDOQ9kshycPglKqS2DRpoYLjAp4MAb4tW1/4N53NScKqPfMe2i?=
 =?us-ascii?Q?oqivFUirhNdYWkr62zmhcjYMIsusj2UUoW/AVKuryFyXWwyzZcqakLOiOArc?=
 =?us-ascii?Q?TZxqsZupANkA+IAvJ1kbHgdYi8EfpWhLo5m8qoNBxrO2uSy64A3nJHw6TxMC?=
 =?us-ascii?Q?X9Gr5xQq+Os0xaGJha4z/6kX/Tksx3lgTtO0HN83lswLi9Li1zhcsmtbnlHx?=
 =?us-ascii?Q?PwQa2dTtYjDEMvcRhf1O0/XeyodMkexXY1ALjuHp9CgelZ9K1ZoNoDVOhFxU?=
 =?us-ascii?Q?RhnuHjV4ffmbg7qMhuYEnkfY6/k4XAS9hOZOGiNnsHkNgkOfbJeUuvaGHWqD?=
 =?us-ascii?Q?y7d2R5L1X0eegFXdQqQ5sfYm6BxubZrxHP48r4eVHGf2xJPktOOMnI3grVqQ?=
 =?us-ascii?Q?2dEYrL+uhQQ8oCBlquYsU23Bt8q3QPkdYcticvAWNtVDj0Rjj3R+SVR57fRP?=
 =?us-ascii?Q?dd3LQJHfaUY0RTfQet97z/04iQKES3pfcMVVuVlfi6QMFSEsqY7JaIpZHplF?=
 =?us-ascii?Q?VVIfr523ONR0J3le8H1JbGZVGlK3JSW3c7atrlEGevZwzerYZ7x5Ndarz1/V?=
 =?us-ascii?Q?4+ekOMDAIneXPL+RPGBcd6cNeoT/gaimmmXueiUEMwvSgzI83W74uwqyhGZv?=
 =?us-ascii?Q?Rn+uyk7U2Uv0QrD9/gPqrw1QXkMlI3VTcWQaUoenD8gaB8ITxC4cSRRTqXa3?=
 =?us-ascii?Q?o6yFi6SeMEa5RR+pQ3//h9eg1/0f/UNsNxMkbTFa70CUzrwGNcAMA86TP0Rq?=
 =?us-ascii?Q?mv59X3Jc/G6BSORVQx7AFGk3NLB5Qaxr52eowH0GepcmmvX85yEO89+bWHRs?=
 =?us-ascii?Q?VN3/+AVT6pLUBUvW3xjizjztUS8nQ4ozZrYCI8z8b0MeCmu8UaUAk6dlm060?=
 =?us-ascii?Q?DudpVhiqw2euE22TKJvuWrN1RDIW8b6AjbDJ07rDtJg5/3wJmc+YbCAkaBQ?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZiK3nT18OESC2+rigZRWWUBMshYUsjdM9b3HMszYXNQA0hbZTEyWeX6KtmB+?=
 =?us-ascii?Q?8l4m3J3w8INLF7GGBmesBwv4LLv+OXKN1TqPHyOy1nktyX63veWqZms2SE3D?=
 =?us-ascii?Q?wzJW9f7/nZVouxpyQb2pjs6eC4vXMbTs+rtrbTxNZxlu76iJQZSKvjEMZCWU?=
 =?us-ascii?Q?RJ8p4eHuyntw200/x49uVxBfRQbaF0dA7v6y3V5fLsf1G5NhN6Ac6CfdHUKD?=
 =?us-ascii?Q?g6JpnZvcBN0G7pPy5m5mylcFF289sj3usYvAjMTGv1SigZVsWd7KN6Owb1ET?=
 =?us-ascii?Q?khn+zq2unj4kZ3muQR0CiT9i9/QeosL7+ZHKQDCh4eHdWbwhsNdyZePStGVm?=
 =?us-ascii?Q?Ph4wXaONW80D9w0Vc/aGmZSqLAUWDZQzQs9JPNtQst7FlRBkL9Zkvzj7iKlU?=
 =?us-ascii?Q?j65S819SFNfw7CKXvRPP0Qmv2NLzY0j8Ldc8ocnuRfx8PPeTs7DHbdldUG4+?=
 =?us-ascii?Q?326jt2gmk62ocphMuTHeQlmsdbL6Y/8iJfq0H0N2opB0AkyT3HTpq8tVR210?=
 =?us-ascii?Q?GMbrgqmaPbRNe60tPYOvWGu82poSoAwF8yiD0ciO36SfOkq8NbaywK7sqJnu?=
 =?us-ascii?Q?DrTPzbYqYyz+XppEMowqXaHj5//UVg3Rd2qH9Wb0KtjpJxxQ8JFyKo5niGOa?=
 =?us-ascii?Q?NbgVKwJt4OqRBA0SW8MCqumX/YJLOAePbVwHbYac9nwHxMhjJh5H9LfcobHh?=
 =?us-ascii?Q?uCUmFN/G+hLFPoeFB4bHajzVf/sUmc/rEllxM5vSnqSQe0fk5snmrZZmWsC+?=
 =?us-ascii?Q?QPQx+qBxlUvffwNYoUSm5HZ6rmUGIAu1FHUjR5c1Dzg4UvtRoZvjxTBD6I+r?=
 =?us-ascii?Q?L8t+Aff13pffwaOiWmVEI5l6CtNPda6j5HdD4+sceJjzkK98WFLju7tXHGMx?=
 =?us-ascii?Q?zZYLdjd5Q9ttkeSYyqZ/TCLHODPVNofkPXgEwAUAU1ozQZKFVpUNpoZLqRt/?=
 =?us-ascii?Q?TY4VNXvGhRMoMnIQ8XjHgE96hn1NnSZaRKmRGTqmbFtSRIe1BJFTeECJlXAp?=
 =?us-ascii?Q?a1Ah7u0BCkH98rx+t07XJc70qPA5a5OMLJKH7aaHHSCrckdElSIynoGWlAIk?=
 =?us-ascii?Q?5HeYXSXQoW+ZA4QbPDZld27gh1p1Y7ZFCjWRMpwcW+E2L36Mfni6j3a3LcPj?=
 =?us-ascii?Q?UTFXEc6H1SbxfLphM9ElqNH/dqWr1oTVEtdcmDFh+ghJUAOqnh5maG/wUMOp?=
 =?us-ascii?Q?B72QcrnFwG/LLzJ0b9jTkZHJlUn1U9WJJ9p1GpfdqS/GPFWvzMwjJTnN/8XS?=
 =?us-ascii?Q?8GCFQOcid5gFQU/LFrEnCluzrZPXK5Mtjwi/yTvOPvXHXVUWCZSn8OXL5GAX?=
 =?us-ascii?Q?Yh7SNTPvcEmprj6X8Wpgs41AAx2mvaMO3x/Agm0sybZJlDCrYSNZt+Z7X7gv?=
 =?us-ascii?Q?gJ9STBp4LubN/0iNd5xEj8d08BnNK0Tmz3Ac9s+EwZXwHjZrmwYT2K0FuxPO?=
 =?us-ascii?Q?rtXSWyxxYkhN72DWPLZyvz2snieEz9wMc/LmqtLvEVDkbCOQkHWpk0eP+NEZ?=
 =?us-ascii?Q?ptWZ14YWYjnt6w5aY1Zc/6gsoCzplzuLnTt3IPDHjP2sM8nYDtPw4p/ncHbY?=
 =?us-ascii?Q?zty08Zv3io3/5qh8YdFjLaLrbvPy7f7JWWOyWF329Ab0G2rCqdURMvtM30Z9?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 632d0d03-6cbb-4b11-fab6-08dc7b4efd6e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 17:37:17.1775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJWAbNScwxG42ueluG8vV5hzYsdLkJOc0XPy7rEKSAi9m+aoU3wuSlzcc/htPgXZajL1dp7XqNSvB5TJ8ujiHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5302
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

On Thu, May 23, 2024 at 01:40:50PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Enable Coarse Power Gating
> URL   : https://patchwork.freedesktop.org/series/133964/
> State : failure
> 
> == Summary ==
> 
> === Applying kernel patches on branch 'drm-tip' with base: ===
> Base commit: 8e768c3e813a drm-tip: 2024y-05m-23d-13h-10m-23s UTC integration manifest
> === git am output follows ===
> error: patch failed: drivers/gpu/drm/xe/xe_gt_idle.c:145
> error: drivers/gpu/drm/xe/xe_gt_idle.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> Applying: drm/xe: Standardize power gate registers
> Applying: drm/xe: Enable Coarse Power Gating
> Patch failed at 0002 drm/xe: Enable Coarse Power Gating
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".

it looks you need a new rebase...

> 
> 
