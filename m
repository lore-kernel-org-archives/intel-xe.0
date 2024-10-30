Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB058D6B6C4
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 19:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC43A10E021;
	Wed, 30 Oct 2024 19:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aoOHKgcZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6A810E021
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Oct 2024 19:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730318053; x=1761854053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Rrs2DtkvvXXoARSdtCuvYESwJehKaTSyPh9Hnal755g=;
 b=aoOHKgcZzhwv2xBF/P7XlIaTTwwfmLJoJ5uIAjaLVOkLiUCWbF2B2Q4G
 M6VVvLv0odAjZl1EaxVLh9PkRnChSYisY/wkQBKfriz3AwSuZ2c+NIGy/
 LEOdYTLzJa9V0kwzgjZnvMXWhBQYfaY4ZFQxCghBgHd1cw7dj/pPRGLuA
 gQAx3wPf32D5Zo6oc0YQYH9hZc7aXP+xNHO2ALCojriLkgKLBNY007Ghk
 XDCY1A3Q+9Zw94HN640tSojwzwZ8BCoVg1+qem61SaCUwSLv3Unu31MVv
 MykC8B+vrR4L6jxr+ZX7yXnEu5/keC0nEwxjE2JNt9Y8flI+n1jkDk+yR Q==;
X-CSE-ConnectionGUID: qWZlDJ3GQV2zQvBxRQFwzQ==
X-CSE-MsgGUID: JUix3M4kTVKVfoswluu9Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="32878812"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="32878812"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 12:54:12 -0700
X-CSE-ConnectionGUID: 8uaUORodQv+H/fLF3dbknw==
X-CSE-MsgGUID: wir1yNgwT9GSpzu3c21+4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="82529055"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 12:54:12 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 12:54:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 12:54:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 12:54:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NznmFdSUq1jUNbtR9LCiYuNJdIiXk0VahZEimyBPVwqYDPoWGrzLByku7dc0LpAravbR49LtnW7ZbMk0thjTqIrKgNm7zz2J2Pk7xhTseSLW0YQ6e9RYDLEl4GRgu4Q1B0nZX3YVeGchrQL1Gnd/Q53YKtD61mlShCEYZ9enI3GB7b61d+EpdG80OrsHZP8nEh1+iFAshuSLqJq45GGINIDC6oNrZBZQ4OfAUOMjpSnjm6kR8+Tm+nKtikzRhI7Off5dl+yziNuTVJk0tu/b1xqM7i0MUgKe1LLCHIgWYXGgyNYRUpWt/mlOGrvTVoVBk1imt/zQOGazaSI7mSHs7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSZwSltDVrHp3/63dzkurm1gnMXRxOjbllhyqyG+U/g=;
 b=ntE/5gi4a6r/fEohsla6qb1uHMLZNRr4i1DVcgJ8L9tJ43x+2PRXYMlLWRS+Xi3qAJC4L0gKqJhfnlfKeqnhVsDi1/MgIltgIpuAcvWk69qFEzFQRERqskdiaGp2ve1hN4m0WKJQUoHBaC0f2atf9SgQ4cpuQ+0IZmSFDFihdYFJkxLZV9BtGhkBWl9ofOK9W7oRybtwPGXY2LJP6RkfFEOkIEpa6wDI5YKIyJ1OvgR48Z4uQkomf0sKSTVj5pYhNRZtcR6k7FfoyjrgtuxjZYlGr1ac+9mnRTnC/3Ok0wn9a/Vt4nL84iPjxuxicbDcYeEN+ORXKK0Lf0qIntr9oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:91::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.22; Wed, 30 Oct
 2024 19:54:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 19:54:03 +0000
Date: Wed, 30 Oct 2024 12:54:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVDogc3VjY2VzcyBm?=
 =?utf-8?Q?or_Revert_=22drm=2Fxe=2Fxe=5Fguc=5Fads?= =?utf-8?Q?=3A?=
 save/restore OA registers and allowlist regs"
Message-ID: <20241030195400.GH4891@mdroper-desk1.amr.corp.intel.com>
References: <20241029200147.1476513-1-ashutosh.dixit@intel.com>
 <173024074145.1361174.13550844515398446933@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173024074145.1361174.13550844515398446933@2413ebb6fbb6>
X-ClientProxiedBy: SJ0PR13CA0112.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: 577fb725-40ed-4aa8-4660-08dcf91c9ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YwMfFuZcxbzph7lvE87ZYvBwcrBGZAFTqEcshcbeO92M7uWtuRwFzV0hTGb9?=
 =?us-ascii?Q?dyYuH2KH3/OZpqmd8kBsqjQIoJgHsWxcO+pz7OKTK7LlMmAhIQafIM+D3zHg?=
 =?us-ascii?Q?8Yhzhrx8DcNTj3i22fbXzGWI4afALrM5jwDUtoHQaAjKKodDE8mgiaMlpwuD?=
 =?us-ascii?Q?tTasrFScqNuiOGHjo+kiIpJ2uA8MXQayFr02Jzvpl5fW6nByxbq1Srq3+LCH?=
 =?us-ascii?Q?KeUxXVtpmsQNGxtL1ruTIe+uFDrKwD/JU6rlA/HaCBMwJRnWjXK2wWh8xB24?=
 =?us-ascii?Q?N4Ed4aVkfPkA6wgTjkHvMa1SaS6TBuWZcuU8W4KoOYtZ6//xWHmeTf8yeFXt?=
 =?us-ascii?Q?BTuqsuz1gvgY6Qvl8vG+cnrZ2cR5eYeJ3M2t5vEsgkWussN3gMdRAn9ueJrF?=
 =?us-ascii?Q?qqGlefp9iQG+Ks00IlyK66Ug6jxEKSEy7i2hNNYg/3WNHLeOLm3wq+l9xZ8F?=
 =?us-ascii?Q?MfH34ZtEBkR+Dw/YuhDl3nI6iopfM9eiLal+CkYju318oVDrbAOxYK6SsnLB?=
 =?us-ascii?Q?DXSqe29xebSGXUaC+rLnFAhi2Xynnk7KvVz/Ukw6QOCwA+SXaZ1XH9mANy7T?=
 =?us-ascii?Q?jOOlGMhPqbpNMOIhbWrfaXz63eC05ZJDgOm/iEk04MzbVBJ3al7n5L39axIq?=
 =?us-ascii?Q?Hyt3KUCPx//wHMwtWi6Z4/egvHSwmcF7tsYs8EAa6bOvttdvRSzPnVZ++CLY?=
 =?us-ascii?Q?kWxBEbSsc7dyySJydHTmRLHp4FPTkZkK6j3kW8/FxuSNLU6DgQRiagJC661J?=
 =?us-ascii?Q?gawIfKqgT2grZgy+nMaVYfLKU5ctcyR80hhOoROl3awCKLvYgGn6ZpTitoiz?=
 =?us-ascii?Q?ORB15OO48UP5XJDKGx3PmnPuPCLCqaCKHyi7yuUUUXCZGcO3ht8R8mnt7d9U?=
 =?us-ascii?Q?A0+DPsWFHHEg+fHIAlKZOm/fOPrwAjlNnsVFI1BFNrjsEOuTcuOidiQqipCO?=
 =?us-ascii?Q?9GtaXI00ke4T11TGk5Z+aH2In2CVm5E/7lsIIBQi0kRidDFoN3ikBFR9W17l?=
 =?us-ascii?Q?QkbLXka9+9SCxEQJZxQW2SNdK3DGwJSzGun6w9dS2J3D7flN7+w4xvWjZZu+?=
 =?us-ascii?Q?XW4dfhsj9NhMQXUNKQugYVK7krDI00+2KuqUdtcpSOMuSFb4CN/evNx+aQVv?=
 =?us-ascii?Q?k99Zw3UCxX5pbK51UsmdqD34Y2qgdmK8MweUd8E73HjHXqvIpHPoOrCYA/Ti?=
 =?us-ascii?Q?Ck/3qU+nzqzW/nuBRmdbUpLc+8C4cXxc/438QNBw+q1N8e7/lky4QjWZfuB7?=
 =?us-ascii?Q?bE3VkdkbrESubRzXJj5rMqAX360b1+/S4naYQcNWEg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YZfn8nDuemVt5x68h4/5RKeGSkWkyjKwY5u3wW3gcOYQynjnu/Wr45kRiV9I?=
 =?us-ascii?Q?nwpmDfhL2wCO6WlbLi5+RqVLGlo6K0kiaW6cUyHDND4U3Hrh2TRA8mpfv36t?=
 =?us-ascii?Q?8j/YSNirN/irCWVgRwJVBORVOz1xBa77cJO8GrrzQSdu35KATiHDAJSC72bX?=
 =?us-ascii?Q?zCsK8bDRPYhtGyLB7/IH22178K6tDeZsvUZSqcijYPzZsrWRiJ2Rfw2bk5bH?=
 =?us-ascii?Q?/vh8TrT8bpnPQCpz84n8zq5XJw/vV42H9pNQTvEjkqEV5dn5zn5VYSAycmEm?=
 =?us-ascii?Q?COw5YneU9C2FHm+x+XrEhFR60/Yky6+YATujimPErb/GPJ9WnIlbTKnUCW0W?=
 =?us-ascii?Q?LKOwySzNO+m1uSuMyKvGAbTDHXg53IyOc0TsexDoXhejrcJdU79GL8EceS1Y?=
 =?us-ascii?Q?BmcdJbWU5v83/jtSlHZ0Q/5puMxWXl2i4jyXrRPPXbvKC93X6ulJMTiMPRoh?=
 =?us-ascii?Q?gK2Sl3diwmvUiNHuZ5jPE32aEsNUOp3mN270n8dFwL1+SSZIvDNZAueUgSDD?=
 =?us-ascii?Q?OUQp+hFntO5iiNQtKAuqKQKDZ/eqXdZaD/hjqokxf85SjYi7OFZ1IdKf+baY?=
 =?us-ascii?Q?Es+ryYBhUFbQr+eJrseJTGvUe2ZQrtBKwDnQ5OZ6rI9IbSyJCF2F1oMNlWMN?=
 =?us-ascii?Q?Tw5mv9yAb6I2YU8J2fXszKO6ZVhG9MXF4hQC+mtkMTDXE8A8KqEHAkdnqutt?=
 =?us-ascii?Q?3JOjL4EfqDmm7N7jXu1wA9Gg1vP8fxmkPgqhOyRVbm0wIz9TbC4Q0dtUGhnn?=
 =?us-ascii?Q?+mmRLidfdzm1LhI0uH8u2ziOOkgdOIDUclHZ7vXs2Y1ZxgurwwKH2hi53A9m?=
 =?us-ascii?Q?Sfvw4gsxqoCB5yYVQQqeY7TleGyDLyuGW4idN/KGApvjJgi9aFW/eqzcHDB/?=
 =?us-ascii?Q?T2qEc2FlyVoBjWPj2Q0Mm1nFStIewOBORW7p9o461JhLUUYSzsnyZV6rqKP1?=
 =?us-ascii?Q?2enp1RSewgtT8YXO2iwS6RbHjISDyWDjLN9522Ew/UCCcnVRL8z4N1KQ4yD9?=
 =?us-ascii?Q?p8aA972WJh/tpAYGfnv5QuTIROAaBSoj6a12mjee7OtHShNJyqGtK2OO5kcW?=
 =?us-ascii?Q?aLNAuS6Sf0yTL/p8x1G+aAFl0M9TFdhF9rth4BQW2i9hf9MUrAIMgZyp8sUe?=
 =?us-ascii?Q?8U4CIfTPbEsQIvn0y7IZdTu2QL3FE3RDNjVp9y+eO34+l1uVA/nAi+kqb3Ng?=
 =?us-ascii?Q?nlw7+bGhH032UfBOe5ngaR/j7Kf2MSlbl++In+ES6favXn58vu1RqRQUx0Xz?=
 =?us-ascii?Q?MjO6RTBFg5B1QopMFnFG+KZ/qVYf3tYFn+psxCDOeXxVeIsApLERrWR4cXw/?=
 =?us-ascii?Q?ipXmnoX/feQYjYMI/mvqqO2/N3uSUygt7JgH8Nm8H7nXAYYzZNhCo+pV8YAv?=
 =?us-ascii?Q?2rZrkluP7qX1OPHXsiWMvgFCtiLGq+/tZ8w2czWVd7KO0Y3LYXL9ND+ZwtuK?=
 =?us-ascii?Q?c+ZG+riFtv7V/my919tPxDd4p9hDy39CeJWvt8QdPWJDaDAPUkm1tFjfbYjC?=
 =?us-ascii?Q?GZ8mpPegSjpObsz2RwDmV+tP7NmqLwrHSuPRbVDKYqf+QaHE0f097kgiL8ld?=
 =?us-ascii?Q?jbi+Q3oTYz6VwOgFdDDlV31ENNEXD4XmZp+U/LvHPDYGxT/KkvyJUAWu/oaB?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 577fb725-40ed-4aa8-4660-08dcf91c9ab8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 19:54:03.1270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6EbNauGVU+uTyRy19bkaM2AtHYyHBK5fhBkZRqGAVrq98/mEhpyflsuHn0AsAMgc32sFzgkX0tBeE6NKdy0hPCmmMgT6P3MaH8Nvf2y+sI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
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

On Tue, Oct 29, 2024 at 10:25:41PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Revert "drm/xe/xe_guc_ads: save/restore OA registers and allowlist regs"
> URL   : https://patchwork.freedesktop.org/series/140691/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2138-91b5d7af697c6765039b8700127c1740da858065_BAT -> xe-pw-140691v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-140691v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#1861])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2138-91b5d7af697c6765039b8700127c1740da858065/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140691v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][3] ([Intel XE#2229])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140691v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>     - bat-atsm-2:         NOTRUN -> [SKIP][4] ([Intel XE#2229]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140691v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>     - bat-pvc-2:          NOTRUN -> [SKIP][5] ([Intel XE#2229]) +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140691v1/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_exec_fault_mode@twice-basic:
>     - bat-pvc-2:          [DMESG-WARN][6] ([Intel XE#3295]) -> [PASS][7] +1 other test pass
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2138-91b5d7af697c6765039b8700127c1740da858065/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140691v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - bat-pvc-2:          [SKIP][8] ([Intel XE#1192]) -> [PASS][9] +2 other tests pass
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2138-91b5d7af697c6765039b8700127c1740da858065/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140691v1/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - bat-dg2-oem2:       [SKIP][10] ([Intel XE#1192]) -> [PASS][11] +2 other tests pass
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2138-91b5d7af697c6765039b8700127c1740da858065/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140691v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
>     - bat-atsm-2:         [SKIP][12] ([Intel XE#1192]) -> [PASS][13] +2 other tests pass
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2138-91b5d7af697c6765039b8700127c1740da858065/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140691v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_module_load@load:
>     - bat-dg2-oem2:       [DMESG-WARN][14] ([Intel XE#3295]) -> [PASS][15] +6 other tests pass
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2138-91b5d7af697c6765039b8700127c1740da858065/bat-dg2-oem2/igt@xe_module_load@load.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140691v1/bat-dg2-oem2/igt@xe_module_load@load.html
>     - bat-atsm-2:         [DMESG-WARN][16] ([Intel XE#3295]) -> [PASS][17] +1 other test pass
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2138-91b5d7af697c6765039b8700127c1740da858065/bat-atsm-2/igt@xe_module_load@load.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140691v1/bat-atsm-2/igt@xe_module_load@load.html

The revert successfully fixed the regressions here.  Applied to
drm-xe-next.  Thanks for the patch and review.


Matt

> 
>   
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#3295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-2138-91b5d7af697c6765039b8700127c1740da858065 -> xe-pw-140691v1
> 
>   IGT_8087: 7abd9c49a49a9ff1f3300d7c51a92a5af8a789f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2138-91b5d7af697c6765039b8700127c1740da858065: 91b5d7af697c6765039b8700127c1740da858065
>   xe-pw-140691v1: 140691v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140691v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
