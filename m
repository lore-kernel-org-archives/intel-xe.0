Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B3DCA1005
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 16:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B16010E79B;
	Fri, 30 Aug 2024 16:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HW4mk1Uq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E7910E79B
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725033756; x=1756569756;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=kCDokrfN/PqwKrO7Jdgxy1aLyqm98N+A7Sv9gTiDR28=;
 b=HW4mk1Uq0ykAi3j/JTm8VS7fbJLETCzU4nkPxMuoKsIhRdc52RdQRr+8
 MY30P2v0+ZOnGSxM/aAoo4CLhaGujjowpz1l3Bg58jlSO5BX+LJARHCXP
 YkZqsOJ/vOnksiRaivEnDv1hFXB3wd3glUwvEs+YvVwhADCOehw+L3E1f
 v9JFhN0P472J5iccg/Qol60sKCe2GbbmKJsVUsq6zY1iErWhmBuw3W1PI
 Ofkhj3xw/lthCL6jsaG3oU5xzKgNtx6GIsOZuaVHbxP44Pg6MHs3hr+Yo
 l9XQUUqV01DCyGDS9b8UUkFsou9qbUjWo0zc0JQ1ktJ3XQrZc+qhjxAlf g==;
X-CSE-ConnectionGUID: vUzatvm/ReKNQD2v7GBNrg==
X-CSE-MsgGUID: yzA6SjQMQTiynfZZaiuaYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="35051697"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="35051697"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 09:02:36 -0700
X-CSE-ConnectionGUID: jwAhT1SMT9ma3bqg2MUPlg==
X-CSE-MsgGUID: lbkld+02Qj62yaw4giQkMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="68337104"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 09:02:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 09:02:35 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 09:02:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 09:02:34 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 09:02:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yz2/LMluoQiGfrEnO1Kkjmy/AaKwT3yoN0meeAK7fZCTOf1fzPiiosHtA/0x1mNhd5GJYNf8mTahZ8IQcdNY3smuF6hKo7OBXcMcLcyBabFeDVIalAy3Mkl0yckjkhzQ6tWgzp3JmB9fOPQIAWLu9Mc1hskQETfuUWoPgIYWZJq0fKmjrRVSHFsQTQBqV+FBaEy5XweKFspRLvM/hyAkm/eSS74UXkh7Xe9aOXrBM3/qqo4ZqjpVwaggOFy7xWY201w7pOr6ZQVluxrwy/dHXK035sywsKsNZIef9KYPtWRh+PFu1c1JU3iuDuuBuHJY8OrAx592mPt42Yg6+ca4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4yWPxKCB8ESl/aKyHLTKA/svam21qDD61MmYiUaz9I=;
 b=qqkiCJGFkIcP6tZWZ+PvxCyh7mw6Nc/a/PudN+8Ybq6m1STT/cqRPWEsaFxsWvOlWYRDDKev2czK45ulHa54Y0dWQWyG7Ap69ncG7P4zZbnpYWdXNe5O4iEjqIxRZcw8MketqrvUdFRKM6qkX2DIzmZBR5m/KwEYMUF3ZnHWVRXWPGbJIx5G9otuhI7RC0y866ehLpKttTV7YijkhmQs05D8xt+3pvnMUqNEkiUqhH722G5WVgL/xL6f73Qmha2oGE4Ew8J2x7k/ptdJHanuC6QzQ9OvCsnfNuXNHvlWBCUfFQ6UdTQV0DZ/5XlbkII+Z6IetLYGo6mPN54xYciROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7313.namprd11.prod.outlook.com (2603:10b6:930:9c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Fri, 30 Aug
 2024 16:02:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 16:02:21 +0000
Date: Fri, 30 Aug 2024 09:02:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 Remove falsely GT-centric design in pcode and hwmon
Message-ID: <20240830160218.GH5091@mdroper-desk1.amr.corp.intel.com>
References: <20240829220619.789159-4-matthew.d.roper@intel.com>
 <172502417135.854720.15949900184506392408@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172502417135.854720.15949900184506392408@2413ebb6fbb6>
X-ClientProxiedBy: BY5PR20CA0036.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::49) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 190da895-3313-4c87-4729-08dcc90d2145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ys4nQ+k6BNQXQ4UJwgDQJixdBnGHX5j6RkFuJcph13X0O0OaMn6sWtMq82B9?=
 =?us-ascii?Q?7/CF/dQcOhuZ14cFw30Ym0iDQzdIUb/T9qgQcQTEdD9BDAwWm2sNu6x3r+h2?=
 =?us-ascii?Q?XV1VLCERGy4OvoAUH64fVIW5pEjP0FTrR2YWmN4oXKf9l1JGymciLxd0ruIW?=
 =?us-ascii?Q?5iFShel01ufG2WNlqkMdB+HcDPNGt9pILPrGDVvRZywU05A2MUoSjP06IKqb?=
 =?us-ascii?Q?9BvKLiNPE7DixAgTngUda9+XzMVlTdPRO2U/jcvg5IMoFUAj9u2a1E8ygtl/?=
 =?us-ascii?Q?1XOgv1nOu0uiKUNEEhPlSeSVa6KvVnIcDyo+VJu0CTmzSXKdCq3V/zfv4LU9?=
 =?us-ascii?Q?XNKlwzUmzlJYuVI2TN+QPC1sV+Epbl8LBLDOc1ThQwNkdsHuF3hrKZjVNEcn?=
 =?us-ascii?Q?tn/fWzZzPRELo6qXVm3abgTmDspxXxCjAbiY7daluuH0uMpU1EC9EOXWjrJB?=
 =?us-ascii?Q?GUSS2Nl+KzU/qRLGWpmnRp4su2Hqr1Dw7TlCQ7QBLwwe9OSFNcdoEDKIlR6Z?=
 =?us-ascii?Q?7BnCEgNuR1tBVsB8C5wF5nF3Bvj5alXmdD4eOuVrWKWPBWTUOputQT6CJDpX?=
 =?us-ascii?Q?udeETV606WAI1EVjVdLxvdyqiFDBTL/LOg+fSW0KKWVwUfg4d51wum6kPzTr?=
 =?us-ascii?Q?GIjjSL5rqM67DFpZNbnyXjSSvGMEhywMPYNU01a4VRYkV0BFm+g1yG1LJdmX?=
 =?us-ascii?Q?VIRsuNyCPGQWe0d1yK91A2GskbGkuG6HVcevqPYJRK99z3EVEv/3M7T7BocB?=
 =?us-ascii?Q?iP6lCcohC5ObrKjHw2LilHsejafyi/CepaANJA5yR9NndTFGObvWNZw2B1yT?=
 =?us-ascii?Q?SifEqAZqlq3IUmpoN8ofLlVkF/a/yNQ+2pFgQpgVzkpHquEh1oycfvS8JcNL?=
 =?us-ascii?Q?xVqPCGbrF9ooX0oGaVo7AHfoYgTZ3ZhrrDPmKmOUf4Ijl8yTawj1SSK566SF?=
 =?us-ascii?Q?rLiLUNUG5LvTMaAZh3p8cRlzCkwCxdRTGJXbPwhi7qGIyel+0XHsquRA6pT7?=
 =?us-ascii?Q?k2zFZPH8IahlhVALdajYFIV4hWT/qVENGbo1XEgZvmn/m6kqbO+nVuxUVS9Z?=
 =?us-ascii?Q?10AVP05HhDcpyeIrbNKwVUNPRGRwAopFXGDv9wxz0HOT4K0qut3PflayilII?=
 =?us-ascii?Q?9Y0Rm5WXrXAO/xNTm0bH/AfzquIv1xgbY+kuBknTyZlvlH6uqZiQX5KWBpig?=
 =?us-ascii?Q?xgQBGf5BC2JBwj/XQFJvdUACOtQ2yLfa4COO9Upoe3YFJFCYt/1PS216Pinn?=
 =?us-ascii?Q?QsWNzk98oRfsiOT8IBLZ7nxkZbPbyN3h98YM3YoVIMt8uve0vrvHcre9rrKb?=
 =?us-ascii?Q?60E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xu+p1TEuzba4/lH8nVAPCbFlmFjkHSUJHmTkS9EGUuQdU/0K5Z8MfEGFjDEb?=
 =?us-ascii?Q?j9Rn9GvXqpovo9q8a0CfM125VsNenTue+KBNbFxPz3vvKTTV7YOdz1Gr329t?=
 =?us-ascii?Q?UxxApwxqaGa+WGsp6uLTXOQDSzwcYE73Rj3LtctzA3iO6ZzlTXCD9QYUtEhT?=
 =?us-ascii?Q?YWCCEQwdUzPKsgQr1/9p8SEwEOEEWHJMsFPxMwYgSbaaWP3023kTHkVmC4nw?=
 =?us-ascii?Q?9qqT6WkYGjPf/QBiFVRTHrzlf/YibM81WQplVhzfkdMbXEJAMUea1O7fezib?=
 =?us-ascii?Q?6CDcQR6t7A6ZqTQKC1TkoeSfi8XrQeQPDG+oRV/GTHfh6k7yX8QuETUXvAl3?=
 =?us-ascii?Q?lsTYG20uXOlTSMs+W8OpOG0ggiR20YZWGq+6DlRx/GIUjbZS4v+B54OBfOO9?=
 =?us-ascii?Q?cMrFVOl858WEgoUTsXJMJtQLkqoIntEXY+RW75eF0jqmBCXGjwpHc7mkWXKw?=
 =?us-ascii?Q?Lo49TaRfz4dBHJnbp1cFXuyvVD9cp21N6Kz6f7PK8SLeq2Yrr2OzrtPtClNG?=
 =?us-ascii?Q?Vw3KQjVQNtWC4yKTb57CGuA4RDSxD3cHtJOgoclBpjhV20f4/uvURQDd7xxq?=
 =?us-ascii?Q?fWBZx8n4Pf/OQ4ts5Nc8razMLLH3IPcef8B/Ncd3jbSushaI1vROlJNDrkGc?=
 =?us-ascii?Q?iw2s94qHTxYKMBByRqNzIQogSwINj9gc0Y+dNBrnGcr4rbvlD+63ZBhjUjgm?=
 =?us-ascii?Q?jphRBjVAN5GMcUm+fIEpXLcW++l5EaDbRmGGwPJw7KOb6Lxd3CnNurj+cFyS?=
 =?us-ascii?Q?omr+OkND4GC+PqElbKMQKUttJdxkhOFsjEZuWUkNZ0gcUr2Sa0tC1STEOKsQ?=
 =?us-ascii?Q?vsBBeriZJ5qYPKFJLB29oMJP+0LbvHRYLeMmT/YdBsPidM/Yo8u4RVqNyqci?=
 =?us-ascii?Q?t5KICdMF3f94yJZ9ioxuIVdUaR7kh89JcrtzPxD/1lXtrRG2IYZpANGRMhdp?=
 =?us-ascii?Q?vypTY4FyQqbe2WChvTQNztgACxCzuqM7aC9Ecqsw/ExJr4UoaCfg6paxvoXi?=
 =?us-ascii?Q?HCFRI6CiYCFZYb43AOt1AT2co09mALOfqiQ2XFPDh9mOvBc0CmhgD8C/Y+gK?=
 =?us-ascii?Q?Gtq1GDlK+HlheP/QEdL+t6OaA91cLMWxdzwV6+0/kL2KkGtkunqWxnP4TyjA?=
 =?us-ascii?Q?TL8NMmi6qx8jlsRNlI+j17tMR9p0wG57TTF+LWRX6uxYATE6qMxQF+DI8wsL?=
 =?us-ascii?Q?zUTVyv96m/Ie/7SFWUU1q9uNA8hNBhR5/Gq2NXoPXhzeMyMFI+fciEmHGWOh?=
 =?us-ascii?Q?IzOg/sB3C/BSWnoI1IwKMJsQRSSmRAtFM9o6ezLs5oJmrsjaK6DGZcV7/7sX?=
 =?us-ascii?Q?T+4sweOqbuZZp7EKvYxCvfVG7IUs/8ua+SIndhzMP/O4Ob8vCfmFc6BqrLZ9?=
 =?us-ascii?Q?fw0t14VuB4PsznkepVBk0rPAqKbss5aZTJZ/JmJuJ1IYYygeXvVBkG0EK4M6?=
 =?us-ascii?Q?zuaQRaRro47AxK4BorSSukFcMRIW5n5Gf9pEFaw1vmaeq3kvzIpqpu2Bwnrh?=
 =?us-ascii?Q?rx8il610jT/lsBuvq4wHO9dsOUV69LLYHiAeVAmt479WZEzDGqj4huF+zsBk?=
 =?us-ascii?Q?tv6TM2FER53Y+otSnYGQAKZFTBfpPR3IccR2bFaKuKgADcjXIVYIC4XeS8en?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 190da895-3313-4c87-4729-08dcc90d2145
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 16:02:21.6544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 36lCxYpmCPXFQV5cIdsDFh0sy4b5oxyKhPmA6t1/QjDI9QThOwHhhoS3nAUatJ2yJB2WX9Y65DLpOeOBHrartkzgwTmpdSgO3lo5T05//lM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7313
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

On Fri, Aug 30, 2024 at 01:22:51PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Remove falsely GT-centric design in pcode and hwmon
> URL   : https://patchwork.freedesktop.org/series/137979/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c_full -> xe-pw-137979v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-137979v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-137979v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-137979v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle:
>     - shard-lnl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-8/igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-3/igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle.html

Not related to this series (and also seen on other recent series).

Patches applied to drm-xe-next.  Thanks Lucas for the reviews.


Matt

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3:
>     - {shard-bmg}:        [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-137979v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@unplug-rescan:
>     - shard-adlp:         [PASS][5] -> [INCOMPLETE][6] ([Intel XE#1195])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-2/igt@core_hotunplug@unplug-rescan.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-1/igt@core_hotunplug@unplug-rescan.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1125])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-6/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
>     - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#1426]) +3 other tests fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#1659])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#316])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [PASS][14] -> [FAIL][15] ([Intel XE#1231]) +1 other test fail
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-1/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1124] / [Intel XE#1201])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1428])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-adlp:         NOTRUN -> [FAIL][19] ([Intel XE#1874]) +2 other tests fail
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#610])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#2191])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#367])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#787]) +29 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1399]) +3 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#1252]) +2 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-9/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#373])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#373]) +2 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#307])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-4/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1413])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1424])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-9/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#323])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#309]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#599])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#776])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-8/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1421]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-3/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#310]) +4 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>     - shard-dg2-set2:     [PASS][47] -> [INCOMPLETE][48] ([Intel XE#1195]) +1 other test incomplete
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][49] -> [FAIL][50] ([Intel XE#886]) +1 other test fail
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1401] / [Intel XE#1745])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1401])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>     - shard-adlp:         [PASS][54] -> [DMESG-FAIL][55] ([Intel XE#324]) +3 other tests dmesg-fail
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][56] ([Intel XE#324]) +1 other test dmesg-fail
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][57] -> [FAIL][58] ([Intel XE#1874]) +9 other tests fail
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#651]) +2 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#656]) +18 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         [PASS][62] -> [FAIL][63] ([Intel XE#1861]) +1 other test fail
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [FAIL][64] ([Intel XE#1861])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#656]) +10 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_invalid_mode@clock-too-high:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1450] / [Intel XE#2568] / [Intel XE#599])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1450]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1450] / [Intel XE#599])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
> 
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][72] ([Intel XE#1035] / [Intel XE#1195])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-9/igt@kms_plane@pixel-format-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
>     - shard-adlp:         NOTRUN -> [WARN][73] ([Intel XE#2078]) +1 other test warn
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-9/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-lnl:          [PASS][74] -> [INCOMPLETE][75] ([Intel XE#1616]) +1 other test incomplete
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-a-plane-4:
>     - shard-lnl:          [PASS][76] -> [DMESG-FAIL][77] ([Intel XE#324]) +1 other test dmesg-fail
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
>     - shard-lnl:          [PASS][78] -> [DMESG-WARN][79] ([Intel XE#324]) +2 other tests dmesg-warn
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][80] ([Intel XE#361])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][81] ([Intel XE#361]) +1 other test fail
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#870])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-1/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#736])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-lnl:          [PASS][86] -> [FAIL][87] ([Intel XE#718])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1439])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#1489])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-update-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201]) +2 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-1/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1122] / [Intel XE#1201])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-primary-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1406]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-4/igt@kms_psr@fbc-pr-primary-blt.html
> 
>   * igt@kms_psr@fbc-psr-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#929])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_psr@fbc-psr-basic.html
> 
>   * igt@kms_psr@psr-suspend@edp-1:
>     - shard-lnl:          [PASS][94] -> [FAIL][95] ([Intel XE#2028]) +1 other test fail
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-6/igt@kms_psr@psr-suspend@edp-1.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-7/igt@kms_psr@psr-suspend@edp-1.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-6/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1149] / [Intel XE#1201])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1127])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#327])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#327])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [PASS][101] -> [FAIL][102] ([Intel XE#771] / [Intel XE#899])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
>     - shard-dg2-set2:     [PASS][103] -> [FAIL][104] ([Intel XE#771] / [Intel XE#899])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][105] -> [FAIL][106] ([Intel XE#899])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][107] -> [FAIL][108] ([Intel XE#899]) +1 other test fail
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-lnl:          [PASS][109] -> [FAIL][110] ([Intel XE#2443]) +1 other test fail
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-1/igt@kms_vrr@flip-basic.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-5/igt@kms_vrr@flip-basic.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1499] / [Intel XE#599])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-5/igt@kms_vrr@negative-basic.html
> 
>   * igt@xe_ccs@block-multicopy-compressed:
>     - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-2/igt@xe_ccs@block-multicopy-compressed.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#1447])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-6/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-8/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][115] -> [TIMEOUT][116] ([Intel XE#1473] / [Intel XE#402])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#1201] / [Intel XE#261])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-1/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small-external-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +2 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-2/igt@xe_evict@evict-small-external-cm.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [PASS][119] -> [TIMEOUT][120] ([Intel XE#1473])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-435/igt@xe_evict@evict-threads-large.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_evict@evict-threads-small-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#688]) +2 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-7/igt@xe_evict@evict-threads-small-multi-vm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#688]) +2 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1201] / [Intel XE#1392]) +4 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1392]) +1 other test skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-9/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#2360])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-8/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-lnl:          [PASS][128] -> [DMESG-FAIL][129] ([Intel XE#1620])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1201] / [Intel XE#2229] / [Intel XE#455]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-8/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#1201] / [Intel XE#2229])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#2229])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>     - shard-adlp:         NOTRUN -> [FAIL][133] ([Intel XE#1999]) +2 other tests fail
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
> 
>   * igt@xe_module_load@reload:
>     - shard-dg2-set2:     [PASS][134] -> [FAIL][135] ([Intel XE#2136])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-436/igt@xe_module_load@reload.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-434/igt@xe_module_load@reload.html
> 
>   * igt@xe_oa@blocking:
>     - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-9/igt@xe_oa@blocking.html
> 
>   * igt@xe_oa@mmio-triggered-reports:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#1201] / [Intel XE#2541])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-433/igt@xe_oa@mmio-triggered-reports.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#1201] / [Intel XE#1337])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1201] / [Intel XE#979])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-8/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-4/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#584])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-8/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [PASS][142] -> [ABORT][143] ([Intel XE#1358] / [Intel XE#1607])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-lnl:          [PASS][144] -> [ABORT][145] ([Intel XE#1794])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-8/igt@xe_pm@s4-mocs.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-2/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#1201] / [Intel XE#944])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-435/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
>     - shard-adlp:         [PASS][147] -> [FAIL][148] ([Intel XE#1081])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][149] ([Intel XE#1760])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>     - shard-lnl:          [FAIL][150] ([Intel XE#911]) -> [PASS][151] +3 other tests pass
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][152] ([Intel XE#1033]) -> [PASS][153]
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking:
>     - shard-lnl:          [FAIL][154] ([Intel XE#1701]) -> [PASS][155] +1 other test pass
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - {shard-bmg}:        [FAIL][156] ([Intel XE#1426]) -> [PASS][157] +1 other test pass
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          [FAIL][158] ([Intel XE#1659]) -> [PASS][159]
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-adlp:         [FAIL][160] ([Intel XE#1231]) -> [PASS][161]
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][162] ([Intel XE#1204]) -> [PASS][163]
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>     - {shard-bmg}:        [INCOMPLETE][164] -> [PASS][165]
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-bmg-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>     - shard-dg2-set2:     [INCOMPLETE][166] ([Intel XE#1195]) -> [PASS][167]
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [INCOMPLETE][168] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][169]
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][170] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][171]
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>     - shard-adlp:         [FAIL][172] ([Intel XE#1861]) -> [PASS][173] +2 other tests pass
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - {shard-bmg}:        [SKIP][174] ([Intel XE#1503]) -> [PASS][175]
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
>     - shard-lnl:          [DMESG-FAIL][176] ([Intel XE#324]) -> [PASS][177] +2 other tests pass
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
>     - shard-lnl:          [DMESG-WARN][178] ([Intel XE#324]) -> [PASS][179] +2 other tests pass
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
>     - shard-adlp:         [FAIL][180] ([Intel XE#1874]) -> [PASS][181] +4 other tests pass
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - {shard-bmg}:        [SKIP][182] -> [PASS][183]
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-bmg-8/igt@kms_plane_scaling@intel-max-src-size.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-bmg-1/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-lnl:          [FAIL][184] ([Intel XE#718]) -> [PASS][185]
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-lnl:          [FAIL][186] ([Intel XE#2443]) -> [PASS][187] +1 other test pass
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-3/igt@kms_vrr@flipline.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-8/igt@kms_vrr@flipline.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - {shard-bmg}:        [TIMEOUT][188] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][189]
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_balancer@many-parallel-rebind:
>     - {shard-bmg}:        [DMESG-WARN][190] ([Intel XE#877]) -> [PASS][191]
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-bmg-8/igt@xe_exec_balancer@many-parallel-rebind.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-bmg-1/igt@xe_exec_balancer@many-parallel-rebind.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-dg2-set2:     [TIMEOUT][192] ([Intel XE#2105]) -> [PASS][193]
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:
>     - shard-lnl:          [FAIL][194] ([Intel XE#1081]) -> [PASS][195]
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-5/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-6/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-lnl:          [SKIP][196] ([Intel XE#1192]) -> [PASS][197]
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-3/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-adlp:         [TIMEOUT][198] ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026]) -> [PASS][199]
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-1/igt@xe_module_load@many-reload.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-2/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-lnl:          [ABORT][200] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][201]
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-2/igt@xe_pm@s4-basic.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-4/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [ABORT][202] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][203]
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-9/igt@xe_pm@s4-exec-after.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-1/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [ABORT][204] ([Intel XE#1794]) -> [PASS][205] +1 other test pass
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-9/igt@xe_pm@s4-mocs.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-4/igt@xe_pm@s4-mocs.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#623]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#623])
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][208] ([Intel XE#324]) -> [DMESG-WARN][209] ([Intel XE#1033]) +1 other test dmesg-warn
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#316]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#316])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][213] ([Intel XE#316]) +3 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#607]) -> [SKIP][215] ([Intel XE#1201] / [Intel XE#607])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#1124]) -> [SKIP][217] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][219] ([Intel XE#1124]) +7 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][221] ([Intel XE#346])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-436/igt@kms_big_joiner@basic.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][222] ([Intel XE#367]) -> [SKIP][223] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#2191]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#2191])
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][227] ([Intel XE#2191])
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][229] ([Intel XE#367]) +1 other test skip
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][231] ([Intel XE#1252])
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#787]) -> [SKIP][233] ([Intel XE#1201] / [Intel XE#787]) +76 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#1252]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#1252])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][237] ([Intel XE#787]) +69 other tests skip
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +21 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][241] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2-set2:     [SKIP][242] ([Intel XE#306]) -> [SKIP][243] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_chamelium_color@degamma.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-466/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-dg2-set2:     [SKIP][244] ([Intel XE#373]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][247] ([Intel XE#373]) +9 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#307]) -> [SKIP][249] ([Intel XE#1201] / [Intel XE#307])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2-set2:     [SKIP][250] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][251] ([Intel XE#308]) +1 other test skip
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-dg2-set2:     [SKIP][252] ([Intel XE#308]) -> [SKIP][253] ([Intel XE#1201] / [Intel XE#308])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][254] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][255] ([Intel XE#323]) +2 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     [SKIP][256] ([Intel XE#323]) -> [SKIP][257] ([Intel XE#1201] / [Intel XE#323])
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2-set2:     [SKIP][258] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][259] ([Intel XE#307])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-433/igt@kms_display_modes@mst-extended-mode-negative.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][260] ([Intel XE#776]) -> [SKIP][261] ([Intel XE#1201] / [Intel XE#776])
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     [SKIP][262] ([Intel XE#703]) -> [SKIP][263] ([Intel XE#1201] / [Intel XE#703])
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-433/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     [SKIP][264] ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][265] ([Intel XE#1138])
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][266] ([Intel XE#1135]) -> [SKIP][267] ([Intel XE#1135] / [Intel XE#1201])
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_feature_discovery@psr2.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-433/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>     - shard-dg2-set2:     [SKIP][268] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][269] ([Intel XE#455]) +9 other tests skip
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][270] ([Intel XE#651]) -> [SKIP][271] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>     - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][273] ([Intel XE#651]) +22 other tests skip
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
>     - shard-dg2-set2:     [SKIP][274] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][275] ([Intel XE#653]) +25 other tests skip
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-dg2-set2:     [SKIP][276] ([Intel XE#653]) -> [SKIP][277] ([Intel XE#1201] / [Intel XE#653]) +23 other tests skip
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     [SKIP][278] ([Intel XE#1158] / [Intel XE#1201]) -> [SKIP][279] ([Intel XE#1158])
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          [DMESG-WARN][280] ([Intel XE#324]) -> [DMESG-FAIL][281] ([Intel XE#324])
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-6/igt@kms_plane@plane-position-covered.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-4/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-adlp:         [SKIP][282] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][283] ([Intel XE#361])
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-adlp-1/igt@kms_plane_scaling@intel-max-src-size.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-adlp-1/igt@kms_plane_scaling@intel-max-src-size.html
>     - shard-dg2-set2:     [SKIP][284] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][285] ([Intel XE#361])
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-dg2-set2:     [SKIP][286] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][287] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][288] ([Intel XE#498]) -> [SKIP][289] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][290] ([Intel XE#2318]) -> [SKIP][291] ([Intel XE#1201] / [Intel XE#2318]) +5 other tests skip
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][292] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][293] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +3 other tests skip
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     [SKIP][294] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][295] ([Intel XE#870])
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][296] ([Intel XE#1489]) -> [SKIP][297] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-463/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][298] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][299] ([Intel XE#1489]) +1 other test skip
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     [SKIP][300] ([Intel XE#1122]) -> [SKIP][301] ([Intel XE#1122] / [Intel XE#1201])
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-dg2-set2:     [SKIP][302] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][303] ([Intel XE#1122])
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-primary-render:
>     - shard-dg2-set2:     [SKIP][304] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][305] ([Intel XE#929]) +11 other tests skip
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][306] ([Intel XE#929]) -> [SKIP][307] ([Intel XE#1201] / [Intel XE#929]) +12 other tests skip
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][308] ([Intel XE#1149]) -> [SKIP][309] ([Intel XE#1149] / [Intel XE#1201])
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     [SKIP][310] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][311] ([Intel XE#1149])
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-dg2-set2:     [SKIP][312] ([Intel XE#327]) -> [SKIP][313] ([Intel XE#1201] / [Intel XE#327])
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     [SKIP][314] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][315] ([Intel XE#327]) +3 other tests skip
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][316] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][317] ([Intel XE#1127])
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][318] ([Intel XE#1127]) -> [SKIP][319] ([Intel XE#1127] / [Intel XE#1201])
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][320] ([Intel XE#455]) -> [SKIP][321] ([Intel XE#1201] / [Intel XE#455]) +20 other tests skip
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_vrr@flipline.html
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-435/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     [SKIP][322] ([Intel XE#756]) -> [SKIP][323] ([Intel XE#1201] / [Intel XE#756])
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-434/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-dg2-set2:     [SKIP][324] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][325] ([Intel XE#1091])
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][326] ([Intel XE#1123]) -> [SKIP][327] ([Intel XE#1123] / [Intel XE#1201])
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     [FAIL][328] -> [TIMEOUT][329] ([Intel XE#1473])
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][330] ([Intel XE#1195] / [Intel XE#1473]) -> [TIMEOUT][331] ([Intel XE#1473])
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>     - shard-dg2-set2:     [SKIP][332] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][333] ([Intel XE#288]) +19 other tests skip
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>     - shard-dg2-set2:     [SKIP][334] ([Intel XE#288]) -> [SKIP][335] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     [SKIP][336] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][337] ([Intel XE#2360])
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][338] ([Intel XE#255]) -> [SKIP][339] ([Intel XE#1201] / [Intel XE#255])
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_oa@non-privileged-access-vaddr:
>     - shard-dg2-set2:     [SKIP][340] ([Intel XE#2541]) -> [SKIP][341] ([Intel XE#1201] / [Intel XE#2541]) +4 other tests skip
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-466/igt@xe_oa@non-privileged-access-vaddr.html
> 
>   * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>     - shard-dg2-set2:     [SKIP][342] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][343] ([Intel XE#2541]) +3 other tests skip
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][344] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][345] ([Intel XE#2284] / [Intel XE#366])
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-463/igt@xe_pm@s3-d3cold-basic-exec.html
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     [SKIP][346] ([Intel XE#579]) -> [SKIP][347] ([Intel XE#1201] / [Intel XE#579])
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-dg2-set2:     [SKIP][348] ([Intel XE#944]) -> [SKIP][349] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-invalid-size:
>     - shard-dg2-set2:     [SKIP][350] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][351] ([Intel XE#944])
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-dg2-433/igt@xe_query@multigpu-query-invalid-size.html
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-lnl:          [DMESG-WARN][352] ([Intel XE#1760]) -> [DMESG-FAIL][353] ([Intel XE#1760])
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c/shard-lnl-4/igt@xe_wedged@wedged-at-any-timeout.html
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/shard-lnl-4/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
>   [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
>   [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
>   [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7997 -> IGT_7999
>   * Linux: xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c -> xe-pw-137979v1
> 
>   IGT_7997: c70810080fa12a37859c45f16445797c5d849d4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7999: a73311079a5d8ac99eb25336a8369a2c3c6b519b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c: c9ae06dbcb2accfef0eec7d34d80063f9c97b18c
>   xe-pw-137979v1: 137979v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
