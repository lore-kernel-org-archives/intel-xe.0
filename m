Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DBDCF9C7A
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 18:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD3C10E7A9;
	Thu, 20 Nov 2025 18:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJ/6HqNa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E7C10E7AA
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 18:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763662073; x=1795198073;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kp6NCJc7gciOR2xzMDgOmfz+bWBTvcL8aM1Yl6BiPgE=;
 b=EJ/6HqNas8wkpXmoSRsYjh4H7SKAvmwgi+rYT+RKO0OEYLTJJmTV+tn6
 tU7I9lJxy4FZ4byncW/Ta+z8SrtRPgzyRhfkYkuPkoRQqceAH4PjegCo2
 DBIx8ZYb/uZR65EteWjUGL7+s6OiCKnf/WQzkLUHUgoysmHE9M48+mhGp
 9R4IERT9Mu68j75PQYzNNEtY98BDwLr6hhSbqm2z5GLHdRxJGF+R5BdpV
 qobF7of2i8K4YieYY8nNfx1heHM5aRDYz62sY2J3K+uQhIIMgjxolLn0o
 SZ6oSLFJ/OYCG5VX5dZDbLV4s/YDSUz8aOKwcl6R9s6CHeT7z4fIv0XRP A==;
X-CSE-ConnectionGUID: 0ByX5OZfQaCltQkXSDRHDg==
X-CSE-MsgGUID: AE30Uw//SCWWILdgrLW6vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="88396361"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="88396361"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 10:07:52 -0800
X-CSE-ConnectionGUID: ybabUXm4Tq2b7O7sFDeebQ==
X-CSE-MsgGUID: r5SAVqfgSj6JQP0mL9626A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="196408133"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 10:07:51 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 10:07:51 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 10:07:51 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 10:07:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpquQgw4Xijds//yvhrTrZy2tHpa+wLjXvxrMZZDQ8swQnUgVQHYmPoI9ld6zYcoz6nu467yXzoULgXUcHpkGn5EU6AB4W3bRlKuZjgCDzVmREgSpsWV9/XSjXn+KgpXT/1ViSs1HZk4kLJwFyg1NDFlIYp0kbQ7agEaQ/qCn5RZ8+L0VEwrMd4E+QX/0Pw1HJeyijYUXLRmhJiRzQJsEO4LF5XjDl3RfBm6w2Y1g14+nbVDZAqvwZFyK/eGquy2hGItLqsRm/5ruaWflMvo4vtwOcE+qLNlX3Vac9CqODjVGgyeN8MPJdmYB3dvlAsiXcYJS936aXSrp2sOJc7lBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwGvW40VbLg5QwIt2imaIWe8oyWIOPNeAi3m5l6V3EA=;
 b=QuPhRC6e00Z+epREDbshtlI/qzW8vF+U9cHktN1Dpch50ZdxNyXyUxnjVurAcTfVT34bS2okuS5FyY+UonHcrcNiRPeNMvzIB9ay2sDiKeohz2dGaChGJU5zRkArV2rp+0rKnMfBOSgs0Tsvd/bVU+/eQXduDrzUFgaAerFrayjdM8m03zM7yfAWulKM0jqAilsk7nMq0kStA+YNINv0rgvAsPRJKOlytb6QVJyslKNiuEVdr9EaShfFkx+E71GYMhPV4AXZKlziS25u1bRKiArtw/l03fXcfgohajSyoh5lnhfLTgaR4M5Y73VO6qEeFiAs93MPlFqyH9vzDy13Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4937.namprd11.prod.outlook.com (2603:10b6:806:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 18:07:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 18:07:48 +0000
Date: Thu, 20 Nov 2025 12:07:45 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Track pre-production workaround support
Message-ID: <3zguwnf7qbdsiy6n7vvndbbvtidvmp3q2nzxdz6xi5bkifgtgv@rzmfr7eo3a4n>
References: <20251119220459.3997343-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251119220459.3997343-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4937:EE_
X-MS-Office365-Filtering-Correlation-Id: daeddc69-cc27-4d7f-44a1-08de285fb6b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VHEV3cyPOTPLQBik1i5ta8q+nRhq9bJvpp06uSDHZ8AtfxkCVe54bnCih9dj?=
 =?us-ascii?Q?bVgs2T910WqtrBMxQoSkM5ry9Xv/NBRWiJ8JgFkK3yW/WZGKCmUqS+PoKwH6?=
 =?us-ascii?Q?Jno6M2Jqnsw02Gb4uLbifCKifgFa+n3EvDbodkaVBtu0zv6kW3HYUQmHqa20?=
 =?us-ascii?Q?Phf4gt25Okzscn8MI1y4sR5cd2kdiWo9/LHfHAfzTSs0VeS6Ozn9W5h1IcB7?=
 =?us-ascii?Q?WForSY/jCA5ovRofqnz9eBfmuLCeAl3hBBlWto6CkTpy8kQQ6EwGd0OlJnCp?=
 =?us-ascii?Q?d/626Pz1e2UIIkiMfrzlb+Qhj/JCuJdyXg+0PHxofHerbTMLwvryGVLhFjZg?=
 =?us-ascii?Q?PE5F6OxPNTZwuK4dhVLJFBg+MSRONLjBilESHT+VUP4nEakGMkjXLcC5SjFB?=
 =?us-ascii?Q?P5uxyGAhr7NHelF0pHVsHJajTx8XObu9CLE+WV5zNaQSiyt9yb6jnZ3hNvYP?=
 =?us-ascii?Q?yoYVorHkT28TYihghKHszzptRgIAQBsjXfh/kf/3wGn0TPwS2Cl2JTOTLsI+?=
 =?us-ascii?Q?MsJlK3N+z72tsCWwsn/j/QsQimlhy5BF+pYMDQtNMp60sfh8hyjovTsJxiXc?=
 =?us-ascii?Q?fz4febBzwbXKbGGTf/DiuNwx6OkWS0dBOnOpMLH2Dk2gw/9szj9TC5PSS6VI?=
 =?us-ascii?Q?QO8jUrYf0Ph48GYENbdFsd8sGB7X2dFmj/3Koh3EGnET+ADGMIxmLS43Ty0A?=
 =?us-ascii?Q?Vql/pLc6i2fHtvHgsUYbI520jvu9GScrYiUz7b8wAMJGzElhoT2BdUHPf+Ex?=
 =?us-ascii?Q?gx4vi3jtjghhLiaq2TvMHI753qS06/5Nzcg5UxKSo9wI4LqSlFQuQzcAnART?=
 =?us-ascii?Q?HLDIOULY19xKLZFL/59Dkmayr53dbXPydZUtvZlk+BJMT+0Ozyg2agmYbcfM?=
 =?us-ascii?Q?ZsBVrCNy3aVFjj104H0oqqrZQAUjwelraDnW/s/l5oDcNUVoOHimC/pZEDOO?=
 =?us-ascii?Q?XAzzWAZ6q7FRGdOjq2KeI/ityiAYkjAg+0twgUJOvF3k3KYiJxAWVcxgn8Qb?=
 =?us-ascii?Q?96gTFFm7ljWBtk80gEoDPrV1PPA/ke1mE/pRn3kBZEaq9Yvr5Bu31U0aHq6q?=
 =?us-ascii?Q?R0fKVqeMNXIA+RGforrqaKCbQPvRonbnP+aihr5p6rDCH0QXeJBaO3rYNvrI?=
 =?us-ascii?Q?pKGFyKDGjZREX4Rv3Z51UOiY4/RXBMXbWGZAHykURriX5RENd8PWRzboI9Z/?=
 =?us-ascii?Q?vjfA05pZRFCnWmtFK1kbvC/uU5/BP5QjTlpJ8z0zrqx5aHpTf555PbTX+DSL?=
 =?us-ascii?Q?VkuUc0LCXRjQUZtzpxp3dBxohAJqL2TcX7yYWFuYWDR8ERlvDcJbRFNKKF+V?=
 =?us-ascii?Q?hUqZ7BRw2BBBDWYc2VQzaxEjfBjC9uP7peedKOak75zMiZQQXbyIxGGrk2/l?=
 =?us-ascii?Q?ULMmyO2NyxdISBBEflKNblNcsAZI53ynniWbXhsem2Zq4Dd89rqRF0vrKaJj?=
 =?us-ascii?Q?LWQZrK0as1FBj+rWH7RxlUTRSmzoU/dP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iH0ekG40FcTHfpKKcujoc4YegtxoGtIGNbExKuOL6siFN5HbfoEqUBtNtwqM?=
 =?us-ascii?Q?bx0j8KobqgixBd8k4WMn4+UHJGdR4uuMOnVVhqAn1KC6nUBRdahD5twemAcp?=
 =?us-ascii?Q?0Qg/2RAT5H/GdUS6qthRJQ4V8q3CHw3mTxQDs5k5UJ1/U8drjnfnEaTaL1v7?=
 =?us-ascii?Q?0Ku4XjJtUpQmiiMymj1js3SRUlwAELjFFRcZlKtw145OPi34mRg7k3zWwG2d?=
 =?us-ascii?Q?itEKDJfqtGaocJjQ/nHoFuxGmoZF0cPmKWMPASByU+rpbvRwAI0NxHpwB2yf?=
 =?us-ascii?Q?oRCYI+8iWhfWaYjWE04/UbtAz83eQXG+KgTeHYuNiw6oolCQGFDrP5PvE5oV?=
 =?us-ascii?Q?zZfPk23FMBWIqOeZDDtSn+31LMHt6RWg1kr4y7va9xAExAM9+HswA7q065/8?=
 =?us-ascii?Q?FslkTlOWR3fy16g7DE0VDhsT5cGh9UVaDvsEz9x+aes+e3mC6RqwJXMXC5k7?=
 =?us-ascii?Q?9F+lUHdGmLwoD4W7hklOllu5cS/aQRS4P9zo+FsGQ3lEJurPsRiqDa7NKF9K?=
 =?us-ascii?Q?YN49EBsS9chVmIcC13/fxV9KOKBqNRZz8M3gUct9f0K6TWP68QtVpBika97a?=
 =?us-ascii?Q?I5TtLMqWKjdpOiYK7NI0JMOoai+E3BIFbzoY9ph2RrJZIAoh5W3ciaU7H0m8?=
 =?us-ascii?Q?0l4Ad89lk0DPE+4UTO2KujXejXy1KtWcfy/iiRao3Ry/zQcQ9rHiK9fDCgh3?=
 =?us-ascii?Q?4SOHcotSwgsKnAcvnVQVW71GycbiCKaxolt6YIGQXHvA6e84jtY3glSNx0vu?=
 =?us-ascii?Q?l2DE3e5Awod42HXgFUWn563cPa1fchEJhgKj29pBwcWWpT/BmD3Hm2u9eixj?=
 =?us-ascii?Q?8GyAsNGZltXdBnVTofaOhQQrq8BFxclv9AFy7YHeJW0/gCmQ81VsTa3rTLlX?=
 =?us-ascii?Q?5g3rJfIvVZ8Uz/v/eh9ugjCyO9U7etP916Wj6jfWewO7AiMo4LDefSbzdSIY?=
 =?us-ascii?Q?sUK8PQ63hv9qrB6Y6WhB1lSGmaa7WHpdMVoP7ZCKZmAoc3cvdDxsxCcc5rM4?=
 =?us-ascii?Q?ItKl3B6/r12BwIZlnhv4XpL4lhqqE2olUxzavRQgakL7oLJAGsybvaz/KFBH?=
 =?us-ascii?Q?ktUvkwgP1bFwFIZdvmYmii4U/LA/nMm09kQzS3xpqqZ40ZzdYvzXqdJYAtho?=
 =?us-ascii?Q?xW9kPSE8SUK41c9gI9vvQoQ2vn9bYXwZJnlKLkIygwZuNFw0uKeQHxKrOhUZ?=
 =?us-ascii?Q?SYuUnBVF8to5VPYohtSy7MZ3ZQp1n6p7cTL9Li7mOMOYmCCs4v+/Z+DrSwxx?=
 =?us-ascii?Q?Kb1k+nWDOQ2ZvPGoxDVfEiS5sLXlYmvjZbyEsou7Ztv6pKPGPgBGQikcc4qG?=
 =?us-ascii?Q?ZSem99fndb336NQGbk98gwgDt4k5bDetRXCZePxhERW6Ob45bby7G6TwHY1h?=
 =?us-ascii?Q?xu0vIhdnmdoAo3h5vokwJb4riUk11o3IFG1R9KF+s7ysca1kOdwYKeNtKrJx?=
 =?us-ascii?Q?KvXO2l4SoZQFZ2nNdj5fvCOq36QKCdHyr33ki5vkDDceEgb2Lqq/kQIRdxCp?=
 =?us-ascii?Q?yDAKvVA9qjh942cmUC3vQYkD9MJjoNnS/CqCOfAB5r3AM0D+rw2zF5Jvckvq?=
 =?us-ascii?Q?EUUkueuOfSVmLpYKCI49+rSaZDVyvvoxDnYvgtluB7sLq0Yym2FDx8OQrX7T?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: daeddc69-cc27-4d7f-44a1-08de285fb6b3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 18:07:48.7361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjghee1OJismni4CmxLCdaVwrEJ/4IQmufyBlGfkQfr/pMMFtLk/ACShqzxlzoigVUA49ZMV3EOdhLJ4GEyuTQJX5P868VtNQJm/ZBikLDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4937
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

On Wed, Nov 19, 2025 at 02:05:00PM -0800, Matt Roper wrote:
>When we're initially enabling driver support for a new platform/IP, we
>usually implement all workarounds documented in the WA database in the
>driver.  Many of those workarounds are restricted to early steppings
>that only showed up in pre-production hardware (i.e., internal test
>chips that are not available to the general public).  Since the
>workarounds for early, pre-production steppings tend to be some of the
>ugliest and most complicated workarounds, we generally want to eliminate
>them and simplify the code once the platform has launched and our
>internal usage of those pre-production parts have been phased out.
>
>Let's add a flag to the device info that tracks which platforms we've
>removed pre-production workarounds for so that we can print a warning
>and taint if someone tries to load the driver on a pre-production part.
>This will help our internal users understand the likely problems they'll
>encounter if they try to load the driver on an old pre-production
>device.
>
>The Xe behavior here is similar to what we've done for many years on
>i915 (see intel_detect_preproduction_hw()), except that instead of
>manually coding up ranges of device steppings that we believe to be
>pre-production hardware, Xe will use the hardware's own production vs
>pre-production fusing status, which we can read from the FUSE2 register.
>This fuse didn't exist on older Intel hardware, but should be present on
>all platforms supported by the Xe driver.

another difference it seems is that intel_detect_preproduction_hw() is
executed for any platform, there isn't a flag... but maybe that's
because the platform/revid check is only added on the flag day.

>Going forward, let's set the expectation that we'll start looking into
>removing pre-production workarounds for a platform around the time that
>platforms of the next major IP stepping are having their force_probe
>requirement lifted.  This timing is just a rough guideline; there may be
>cases where some instances of pre-production parts are still being
>actively used in CI farms, internal device pools, etc. and we'll need to
>wait a bit longer for those to be swapped out.
>
>Bspec: 78271, 52544
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 ++
> drivers/gpu/drm/xe/xe_device.c       | 48 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> drivers/gpu/drm/xe/xe_pci.c          |  1 +
> drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
> 5 files changed, 55 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 917a088c28f2..93643da57428 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -227,6 +227,9 @@
>
> #define MIRROR_FUSE1				XE_REG(0x911c)
>
>+#define FUSE2					XE_REG(0x9120)
>+#define   PRODUCTION_HW				REG_BIT(2)
>+
> #define MIRROR_L3BANK_ENABLE			XE_REG(0x9130)
> #define   XE3_L3BANK_ENABLE			REG_GENMASK(31, 0)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 1197f914ef77..ed758888cfa1 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -797,6 +797,52 @@ static int probe_has_flat_ccs(struct xe_device *xe)
> 	return 0;
> }
>
>+/*
>+ * Detect if the driver is being run on pre-production hardware.  We don't
>+ * keep workarounds for pre-production hardware long term, so print an
>+ * error and add taint if we're being loaded on a pre-production platform
>+ * for which the pre-prod workarounds have already been removed.
>+ *
>+ * The general policy is that we'll remove any workarounds that only apply to
>+ * pre-production hardware around the time force_probe restrictions are lifted
>+ * for a platform of the next major IP generation (for example, Xe2 pre-prod
>+ * workarounds should be removed around the time the first Xe3 platforms have
>+ * force_probe lifted).
>+ */
>+static void detect_preproduction_hw(struct xe_device *xe)
>+{
>+	struct xe_gt *gt;
>+	int id;
>+
>+	/*
>+	 * The "SW_CAP" fuse contains a bit indicating whether the device is a
>+	 * production or pre-production device.  This fuse is reflected through
>+	 * the GT "FUSE2" register, even though the contents of the fuse are
>+	 * not GT-specific.  Every GT's reflection of this fuse should show the
>+	 * same value, so we'll just use the first available GT for lookup.
>+	 */
>+	for_each_gt(gt, xe, id)
>+		break;
>+
>+	if (!gt)
>+		return;
>+
>+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+	if (xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT)) {
>+		xe_gt_err(gt, "Forcewake failure; cannot determine production/pre-production hw status.\n");
>+		return;
>+	}
>+
>+	if (xe_mmio_read32(&gt->mmio, FUSE2) & PRODUCTION_HW)
>+		return;
>+
>+	xe_info(xe, "Pre-production hardware detected.\n");
>+	if (xe->info.has_prod_wa_only) {

should we annotate the WA themselves? I was thinking sometime ago that
we could have a configfs to force WAs in/out, so we have a quick path to
test  a) dropping the WAs when they are not needed; and b) extending the
WA, with the same action, to a new platform.

This patch itself lgtm and if we decided to extend, it can be done on
top.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
