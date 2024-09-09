Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D083ECE577
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 17:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032B610E5E3;
	Mon,  9 Sep 2024 17:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cix1wst/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0B310E5E3
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 17:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725901471; x=1757437471;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=7HAPQTrC/7po9HqDWPbDnCkn6tIft9J9tRMz6D15xDI=;
 b=Cix1wst//Y4fAynzm7dwuO0a59TCY6olFqtYHqwbjrIBDw+mmQ7P/zN3
 5jgPaMPJjWl9BZopRP8FLMYjw4gqjK3wq4nFH7CYFWyA/KDLbTL+KhEE4
 MIrxUVGMTpl2+9Jp1ZjQ6iRujIM86QyjcXO9APQHht5GVq9h5gD8wbgL/
 0IBqiuVig++tJQjlMCWCeahDNx+eEEjQqzhFlOd+h3r0QnXL2ohguV6xq
 VLTwDkIxFBPPq9Zb+ZJcyPKVsBqmnKYz2VNiCur/xphqT2EeHBwcuhAS5
 NLAZUdC2liR3xiQ23jujBxmhYmKHxau6YKMutAxGJmCPuPAnCvG8vkXvy Q==;
X-CSE-ConnectionGUID: sLMdtHQqTPWAVEgLMd3pVg==
X-CSE-MsgGUID: jT6/YJbWRROrF5bIF3kq6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35756221"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="35756221"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 10:04:31 -0700
X-CSE-ConnectionGUID: 5fWMmUHrS/24IyOdnXDu3Q==
X-CSE-MsgGUID: qzYTF2HDS6ii5sjrEztRPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="71520047"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 10:04:31 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 10:04:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 10:04:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 10:04:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrX5ywHJRATwew6IJgfldSevoMJWPx9RK7jO/uMkvHLyGaNyFeFcl9xbT2rjhVBDnJdwyWL32WuJqkFs1rcAQK93inMPHhCckbAv8ST8sCVatpOw2PmFOrb3tvP3l2hLeDCoF9ITWhcLtvTB7Ii1C9NuKeFhba5W4AZylsiPoWfNZGqu1FMXDpPUYP35N4wHxPKB5kfOBtbnSH6WRqqsoiRuknZM2GgQMQ+l/2LfTwvYQp93NU1nHV+59ykhhuH5VNvAp8IeczitOE1FDqEBz/qdVg69rs2UD5jB5EWBTVB1fSOtO1RIYI4pO9aOBVTa+1h8tkP/1RNQj8aKf+jNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ta36uOfwoORiWmGuTyYoo625uWyoRTFz38LdMEdvSHw=;
 b=q3dX30wr9Dzll0mF82N39QHnObJ9snTFYtKCZ0U3CnuRaO/JSokxN8qLYm1r5ItqYdCryfkNoOC09oVQVhy2F43ymIlU0l9b+nhPnRPtB6mwg7G9FDKupHGzAdQIjedcMKkVJxQVVtgNyaSlTXuREEoldz57IN3dCc91mGgiNrOy64J8pIJ0opwjR2e58Kxzj6QV121SYiyl/9nYHJ1DNLB2WzBcQmLAPNfP3r/M2hz+33W7VqZsB0WzhSn+pv1H5va4nyrdxPAmN03mF8yyLf4tLBmulbilgBCGyH8zXlSzaUfxapdrvf+y/ZKJiS4o7I3Fa84qkgCpHEfjXrp/mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7363.namprd11.prod.outlook.com (2603:10b6:930:86::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Mon, 9 Sep
 2024 17:04:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 17:04:27 +0000
Date: Mon, 9 Sep 2024 10:04:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for Stop
 using xe_gt as a register MMIO target (rev2)
Message-ID: <20240909170424.GL5091@mdroper-desk1.amr.corp.intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <172568295403.955480.16668910984517881317@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172568295403.955480.16668910984517881317@2413ebb6fbb6>
X-ClientProxiedBy: SJ0PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dbdc7ab-c75d-4eb6-9421-08dcd0f17629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?in9SGcG3cWqr9weKfJX7rFoKZOg4lIkHXgm20GYTc/zdhUAVP1dh9vx95hKo?=
 =?us-ascii?Q?UyULiIiZsMXDz2GeWLntQTaRz6u9aG5wpvm6GMqyiCua5ezZnHecAIKHY+eH?=
 =?us-ascii?Q?pJQm6RPpNMYWVXZKe+UdD29+UReBo/aCe9xpVpisRozb382L/Lb+ehZey1by?=
 =?us-ascii?Q?T79sW3HxhW9cZ9RdNGmGN9Po8yjEQuEbPvcICafyu6i83LNS/LWpFtLACUTi?=
 =?us-ascii?Q?98Ajbim6xYvF6LDjuZTs0uE1Eql7qgclH+ptszjcPcITO+YBv3kJ0Qrw4KUh?=
 =?us-ascii?Q?R82Pj8OEOUIHxyY2Y5ZgQw/wTJtwfJjmTIEJ8VKTbK4lm05V1aSm1uvCXVh8?=
 =?us-ascii?Q?LKnxAhcQWVwOrY+p628jxuoSwo6CbiUOKYuQAQ4e0tTotw9YVXtaNJcoxwuM?=
 =?us-ascii?Q?hq6jS8OL3gCkeTSe+zWU6obuCuT72Eql88ZSaLJo5V2WjShe5JdYDMBa4nBD?=
 =?us-ascii?Q?BjlA82EVzqlgH9u6ITXoBU6gYTtMfBpinOvLcIfYL8/iVD9IY7GFPVm2QhLf?=
 =?us-ascii?Q?TbJBSMWNmnW5T+bCiB1Yv/Id/Z2cFeFKiicrqGayviQrNA+HSwOtrzS3IYPb?=
 =?us-ascii?Q?IDYBjZixtRu3QsK79MIsF5yLdfW3ZJ/0VAmxoa0aAsBUOuvfS3O4/yw52iah?=
 =?us-ascii?Q?H4a+UFt6yREw3pzveItZmGimW05P8GFzOLS/mxM6iwfIbOFQQ283qc0GUVJp?=
 =?us-ascii?Q?zr094LuZTrBTC7adBr6jbuxV2tluGVdQqJQFYc9fRc5/ts7VA39Dab/DgIFt?=
 =?us-ascii?Q?9GeMYeywZuDucoarIT6qENZZYi7iS+xI+dkZWIEXVoxfaM7S1eEPOiFq05S2?=
 =?us-ascii?Q?jy1/kXVOcbfTVlm4KCue6VFy+EqeMwW70a4PlRwX4mMyfvKmqTQDaLLaMXZ8?=
 =?us-ascii?Q?eFYlRR01Hz79zq/hilqdHKUoZXWP0JJMIR+SirtrhCm3qmPzpJd1ZcJGH0Y+?=
 =?us-ascii?Q?+PpqSamT/vBx55KNmBHkIa6IGNzjNagj9IhteoOUOiemVbLLZvOCWsMWmzMI?=
 =?us-ascii?Q?D1tgwAs7hUCK3YcUfMZBdZ/9MbKGJkrRCgcIemEWKoVorbbnWvyHtwGqXcgk?=
 =?us-ascii?Q?u1uE2QsC9iNFmGqfQXIZ0ie+ACDPtdk6tNB13NByhCPoeFNu5opp/KT6sq+A?=
 =?us-ascii?Q?bdATFbvF2u9t8epPCyPxCIjDslkjkviNO6q1slCoa/t5ROVWtxTN4u7ow8qe?=
 =?us-ascii?Q?GEi9XAy0fF6vCDqWdlgOIbn4MKMWHH9B9YB2UMI9SIKe7QR5pQ14u/YqKWtx?=
 =?us-ascii?Q?AfA/oIzt/fBJi/nzonhhiiWE3tzh2umQHxZuI2uu2ykDp3xu1CWdliaPJjX9?=
 =?us-ascii?Q?HCQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XeJEiNFp622CUdUXQY2M7ACFHwZCl8OiW72BKuKcSZOfSA3qF1dNmsbs8BzF?=
 =?us-ascii?Q?4kYSc2Ub0SaXd5JcfCxsAuVXBSgEtr85vK/zfwFIwaYRwgodasgO2cwPvZt3?=
 =?us-ascii?Q?zlpZZSqhmjGtxqgDcWJiO+RylHnze8KRx9L/VpqhqZfxcPl3qwjr/vrv9RIE?=
 =?us-ascii?Q?QWUAbH2F6LucuFbRpXhD8KmRoRgeaXrPJZZvv96O1ozSPQ/avR2HIYoD5P2o?=
 =?us-ascii?Q?jxEJBfvekM5vOtNMfwTSZAXeAZW9eqOw6t6UmOJerNwrGvyuPnPfuOpllYL9?=
 =?us-ascii?Q?ot5VQUyHPZuhgCmTRz1RfSO03ZQ9ZsLUr0O6qhecSdjxglG2Ha0yj8xY7+5Q?=
 =?us-ascii?Q?Lh89GtumhpLUtQMdMtxZLr4S3VKDV5kVictQ80yiu4fP152B1K+UfKKVxsLe?=
 =?us-ascii?Q?GNnedq1FVc14/WVIaNePpU9W2lgzvp9oZlg3VIZD+iSzuFc4SniUH3pFUSyg?=
 =?us-ascii?Q?5RAJzairKJjbakRKCF6n1gfZziK0qufDG266xKEXjW6FUSILhyK+86gommKt?=
 =?us-ascii?Q?XLCDbY5vnqqghOUqvdvEavBTtKonIEbdMAw07+AWt0WavtLCD4rrfoFhWhAZ?=
 =?us-ascii?Q?5KZmlUPVt2zBH9MaUEMFLL19hnFrNtACyZMQFo3TIPmvg8a4kmNdtB0b+GqD?=
 =?us-ascii?Q?r5anS9YgpBfKOJC9h1iCy1DfPs6Uje5+tXYUEX3Aro3C3NfjxxGXKTnKd3ct?=
 =?us-ascii?Q?bOh06DI6CJqj4deZ1yr50wDNKB6NqP3VSzJNhh2JtZdUkrzEOCsL6AgKRQYk?=
 =?us-ascii?Q?/DWOUoUZjzPSXxfFGC+TiELjK+INwdUHdwRMy6qzWvucrXRoZO7OkpSfYZVv?=
 =?us-ascii?Q?HUjAOxQrZXVK1uf3bcTFbEstUdiuArGsvrnS0Cg0aSOZX1uhQS0AYNUVhO1o?=
 =?us-ascii?Q?Xor8bHXHBWF/r77RG3rs4v0vPdzKYuLxEiFSQbC+GUZJ3Qoubq/fBR/mWL6o?=
 =?us-ascii?Q?u5s6JwgNKeGFCURpG9w2U0tAPLQnX2QGegZcd6mqZpH0riQQaFLyPCfoFMXr?=
 =?us-ascii?Q?JdjfuC7i92uQD1uyiezAYL0qfqqCxE1DstO/pkit2X5siMDihFUb+cOVc/N+?=
 =?us-ascii?Q?2N4tLjruwIV/tinGjDhwLqJ7Q8vt+bGxuT+41y8qUUBhib7Deo/6x6oF2THz?=
 =?us-ascii?Q?AlSP48xcf/UPLShveRo0cVOyVcBW3MjoWkrFw0sKwmAxeLQKWKQtLiG8PA3n?=
 =?us-ascii?Q?4SuH99QjOEbajJ6mXkVO858Fc1VFaQhjlly1zIljwhUOKEOjYoJ8ubAalp95?=
 =?us-ascii?Q?8SQWLaA3zclUYudC7Mf9iRpvvHk9ObtZhcGXs9Cx8eUVCYFUXwINqOx87sAa?=
 =?us-ascii?Q?f6IPq5mVcflLvzFo8IiAGZO0H0qzsVJFbAaR2lfukSTx2tfmj+ynTijoVYxv?=
 =?us-ascii?Q?Wor4/w9fD7vYx0HwPQMXUYQlyNhmHDwyCJhyWo7MrWiOIvJ58y504G6imvyW?=
 =?us-ascii?Q?DL2+OjCeDKIQoWVBY4Qrw+w27CjxkfORbMHWU/kJIyMjEQBSq9rkTfSgmvZh?=
 =?us-ascii?Q?fzXGYUGf00QFReJByL3Vq0nYnXH66y1WE/XwdlDJH85NNaS732uVU2p/SmUX?=
 =?us-ascii?Q?Lpps0qcnyEGysqM/jmCEdYBy8NjBGgE6HoqRBCSsMFsRjQWeDjwuMBfvf/Ol?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dbdc7ab-c75d-4eb6-9421-08dcd0f17629
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 17:04:26.9838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /y7kyxeGN9Y/Z/faqjPFIUh8BlHN0HboU8NmZeY7HxYoYVyKGs0/536TP7W3gmJU4dEyd1HcQug5qYFbcBMsgNSJpwcvitFAyc3/STCIJbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7363
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

On Sat, Sep 07, 2024 at 04:22:34AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Stop using xe_gt as a register MMIO target (rev2)
> URL   : https://patchwork.freedesktop.org/series/138168/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a_BAT -> xe-pw-138168v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-138168v2_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-138168v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (8 -> 0)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in xe-pw-138168v2_BAT prevented too many machines from booting.
> 
>   Missing    (8): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 

I don't see any issues locally, and despite this error being reported,
CI.FULL still ran successfully on all of these platforms (and passed).
So this BAT report might have been a CI infrastructure glitch I guess?


Matt

> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8008 -> IGT_8010
>   * Linux: xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a -> xe-pw-138168v2
> 
>   IGT_8008: 91925eef7a79b1402b9422758311a4d693825362 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8010: 8010
>   xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a: 217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a
>   xe-pw-138168v2: 138168v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
