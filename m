Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95151C27C52
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 19:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543C910E0CD;
	Thu,  6 Jun 2024 19:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gh/6bbJn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3091210E0CD
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 19:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717700906; x=1749236906;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RJhM5UdsKH5v79KaDi5HDmfgPO9h/poJW835O1w9suk=;
 b=Gh/6bbJn3UlkxJFUIEsIe7XfFAqLFGBy+b9ME479BPidrzLGgOuhBKXz
 B1xtjoXm84FGWPxv9rQI0d4j5I/XpKVu5OeSgXldAODqaauM3Errh1iUw
 7YaGoLePRKQ4x0vM6jTskIj+E2s4kZYT6yUwyKB2TLjIU4LnKm+bNLl6d
 E5sj6vWkzQZjjiOll2IdzLmktJtZPX/eQPjhwVQXBPR5TaDaB6An0Zy4e
 IjJkDC78J4NPGqeyUucUjVzU2hK35/JkqlIidin/wiV8SFN6dPYjF5zty
 /NHHzTsOnZEI9KLkCiDWxaYTUZ9Tb7S5XYnzIxmx9MZRv3Zam+xy/Ot2/ g==;
X-CSE-ConnectionGUID: iAGGep2WSTWmjuMLCoT3LQ==
X-CSE-MsgGUID: 7spAiUZqTAabCCpC57kykw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18245907"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="18245907"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 12:08:25 -0700
X-CSE-ConnectionGUID: gWQvq+IHTce6whd8FPGe0g==
X-CSE-MsgGUID: lvmnjLk3TEKmc7CwwWjVUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="61278979"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 12:08:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 12:08:25 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 12:08:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 12:08:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 12:08:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+kSyu8JeWyuxkHffwzLCm8xaNOq/Z3/Ex/WsuEsTQZ5w0CLRbsUoOlYwWhWCPhkM5QOdm1ZXqTtvrGTuRpMaKI/USKnpGjevHzLeeRLZU4Qm5ws5er/EW8dH8qPyP+QjPF53JbQIRRslfBoTa+F6+ghSZhrtQD95L3DCWHp6u6QfmTQQfyH3rbtMiIURkKUoH2Mxa1Q8ofr41Vu3iBFCi4HTHPoJOqX8bN2J8tUig2MjL/j0sfaipKKtGmWD2YXKw22Plhy7Kjfe2P2+u0skLzMTWHjeFq2Cw51d46Li5MHDeofsvu7MXdsY7XqkoByJtKtduvL2bjKw2RlN/yWJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETpXlRlR1iFGa32YyAAdN8nvtuft75TcMwIFuPvKKwI=;
 b=EEJ20S5cPUQD92jwl44+lIsVYPtEGnQzsb409Wj9bGUdhtp2I56tcKD0XcJKl6CYO2JYGUP7D7eFbWxDkCVxfAp3MVEOWAeCP18YYmoQeDh4SLL+zQ8TD11TxXqXM7il5De/mN+7WNN8ImTho1eNq5QgWysy5NWcMOR0rlDADX4ptijIXhpz89EESutjc/pYUqT6YBVHxnS59YgZHuEKjGLpx2TCJGH2L7lgt/6OCHVfZ3t1Q39R0ttgpAdm7Auvk4K60ITkxINRcKq5SYxiRrUAuIXJxKmSyxt51whaitU3NZnD38+AOG1eshoOxr2C1LMRvdDvqQWbGF1rzv9yMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Thu, 6 Jun
 2024 19:08:22 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 19:08:22 +0000
Date: Thu, 6 Jun 2024 15:08:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v3 0/2] xe_gt_idle fixes
Message-ID: <ZmIJI-G4BF2a-CVd@intel.com>
References: <20240606100842.956072-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240606100842.956072-1-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR01CA0041.prod.exchangelabs.com (2603:10b6:a03:94::18)
 To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: c646576d-dd39-47b8-101a-08dc865c08b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kkw/0UStxiiMf+5UkHiG4mC86FwsHM25wV3sl9eA+Z7Rg7Kp/Bk5pjekxe3R?=
 =?us-ascii?Q?IiVJGC07wD0o26n8lJfUu/wGZJJyjIfJjuz8koYoeKJlkjG1CQAV9v4ch9nr?=
 =?us-ascii?Q?HlOQciaXGHUTpqnmnGHxwiTvkg9mf2z+vnxHPk795m8v/ANxFOlrCPBowUCP?=
 =?us-ascii?Q?6U43dV/j1htoo7WOpiI9PQU3eR6g9I7Ap9jYS92Z7Daym81//4aazSqx43ET?=
 =?us-ascii?Q?O8XoY4Wh+DGuLzfw9P74OX1T2WydmyFLd7oymRAjSkpZ+qEAu8KOpkkfdaJW?=
 =?us-ascii?Q?3NBmyHawABROIZlFTXctJlZBsu7074OqsLC4whwVhD0aw5RsydMcNQYvFpQK?=
 =?us-ascii?Q?e6BdazL1EX02onkHYttkszGGYkXkogmrJXLNzFw9JmPYpXNJ4k018+LVn4gy?=
 =?us-ascii?Q?oOH4nnPlguvFhr8raQZWYBdsHO9UoSs4CXnUFSdSxv5DzfTPZnjaSd+PVV3P?=
 =?us-ascii?Q?vlVU1EAycqokqhQpDTwKPL672oRrCuVev29igTHTm3yM83GDsAn1hfNv5kHF?=
 =?us-ascii?Q?73IwTs3SHk1HiGSgPMVQ/g4FypRVfexLgMUGmRKoNbaeg5kZ7uKaLXkvwfoH?=
 =?us-ascii?Q?IG3/WT4gSA5P55wQECiEJ9Sysvnp2G+pu/DMHPwlOl76gT6ATFMFNC7K8z36?=
 =?us-ascii?Q?4a/9bZQF4tW9cTYN5bYUKDCBcnDky1iNlt3MjuzjvFMzUt9kLXJumz+Gy81y?=
 =?us-ascii?Q?QhGSABjo8wR/ADbPgb6nSPdf8DKPescTlU7Pz4udShjxciIL+0MwaTcBzC/h?=
 =?us-ascii?Q?9TX4D/EMrbtQcEZ2/tsc07oCOnXMwG174DnAj2UdRw1xRlNu3JK8vAA+Jk/3?=
 =?us-ascii?Q?5WsyBFE5jcc6FxaQkMmRbGLBx5jFpPAEnO4T7/G5yg+sFvPhE0MAFWZqrtZk?=
 =?us-ascii?Q?TqbAQAPXWAWBQPS1UkNWT1As0wL7QLhsupAPPl7cECbbUfxd7/ZhxTYpsCWZ?=
 =?us-ascii?Q?C3caMm/Fnxe0LUmmPpCxgDUB6Zrb83Lo/4YEuWaQTfoUbaparLGTJQ46toMI?=
 =?us-ascii?Q?ntmDqoSof7jhIPV+TLRPOFwZW7wd63uqTlaJOtR1SN+8XeB4t37LNPIpPpL0?=
 =?us-ascii?Q?LkBZ7Kpqwf8MnO5MyuEtBgBTkkCIriTwYDIqr/tUBo6Wcn+KCz9HdSUyfiDN?=
 =?us-ascii?Q?WJjlL28ogMyO1Fd7DnkMFomTu93g8IONSKg0zmYhrHZqXhbKa8i7sYjgLszp?=
 =?us-ascii?Q?g3yBLNd2XO7QtqKEPhgEBbHsEYR7Sf7laHe9xQgm1jGHQ69T+A7jPy6PHiTG?=
 =?us-ascii?Q?Hht6lDpabCcvidd1jmwAYptY9yhcjqykzPsKspxqFs6IhmOMMHxEHCqRNswb?=
 =?us-ascii?Q?k5Kfeyje/1t+iqIWBFh29Cn4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gw9RMudjxktzD/Ns+ITkADC56NnyjskKKuoLJp1pR/6N8ZTKTR1kiRUexG1W?=
 =?us-ascii?Q?tEy989S59QYBl8ufoWPGVJ3iH89zcY4H0sPELX76Zkqa8IPjUwdNBJGOJd4F?=
 =?us-ascii?Q?gIGTBft5Zfr1GvlFvKYzexzWs4dMyV4G6w1OKQe50YsoIXC2nXd3UC91B4tZ?=
 =?us-ascii?Q?t5kU8hg94NUQR7aSnbZqCfBw3zRpm4Mjh2PK5RBdWYSxfuLbpYcxJpsA/X68?=
 =?us-ascii?Q?fYQbBpYV6ztqJWw5I4JTMdjXrBT32axIrb7+MwVnWxGDx1TuKTseAdvDz/9V?=
 =?us-ascii?Q?IpAcRBcjMGkaSo5RKH071wWGFrfAL0jKi3UC+RsqF0/j/hmHwqzHVvAT+wDW?=
 =?us-ascii?Q?StsHTWj0eZu2Y5ESbuQWhHNTJZbLZQbcF8tEZh2g9zWVLHD3kjLgK/aPKqkq?=
 =?us-ascii?Q?hiUBXs0rkGyBYXmBiULJW08TxttUY27Bm76CC3gZ9EnN2EfSUWTG4VjBOZl9?=
 =?us-ascii?Q?D6SKULXc2FyVvTiquDAip1aEPw/QLWsfeg6g/Wfp0GnNt3rTlr1qkc4DIBB1?=
 =?us-ascii?Q?i5YjJGwILY2VuH52AK0/+cof2dluqTdkEyeZ8CoaiAZB8QAfCrr+H5a6t1q4?=
 =?us-ascii?Q?SZGcxHfGBYbpMxuGWs+PYVzRwLwnLqxRBA0tMu/tti2qXYiUfXlpAJ578bR4?=
 =?us-ascii?Q?pwObKZ5kKxbirRnJ8ROvgkaiFWgzbAXEZjOIL83cM8hcCNBibWxhPg3cxGuK?=
 =?us-ascii?Q?YPMKIbp5e+DN9LYJUzxBvWd9tfNERECFsap4xkSds6cypETrQ6QWV7Nlrk6t?=
 =?us-ascii?Q?yPW3wZHxy5LSHQRskkhfp8rquR/AYqyyXPETX2sDWhLgl9n9oKzGxkHAicKk?=
 =?us-ascii?Q?JLWESAAiEd4i2f18BR9yP5pzsCDjW2MS6QPHoCzCx03E6KMgcT7crWgywt4j?=
 =?us-ascii?Q?LGmFv5tMYjUm1AA+J7D7XOWIkvrKwQjEuOe7P2O0Qef0CkJl3v6uSdS9eqv3?=
 =?us-ascii?Q?Fsbq5LZRXHPkAvkpHDjr8jd3DbR3THo7Ev8UhOI1Tkz0RuhGjKw4OpB3OPnt?=
 =?us-ascii?Q?i1FCEtnvQlmCAuLXasxIMrNVYYTG0SmUSQnL1YN4ctLXoeBiYCSGLOQdJnE9?=
 =?us-ascii?Q?uvEmijfYIbZVtigQSHGI1Az5EZ4sKcSAuYHVK2RollSFMB7Q8ymEkU7M2KN3?=
 =?us-ascii?Q?evnTampy30jnw7fodCKzZe8o2iScLAVJ/PQ+S1x3Jl+ITm7DUKKFpSGPDipt?=
 =?us-ascii?Q?QiNeTMls4V5vJz7HabpiOtyoXxQpmv4tsW4DNE0wDjfsZj5QMq3Iit3+Py5V?=
 =?us-ascii?Q?sdT3Aq+iiy96svF7mX274/KoY++1L/ihieUpsNCvD/khenvYVZ/IReiaJqb9?=
 =?us-ascii?Q?TwuPvzcH7Q5iG4E1q78FoRFki64QvJIux6T/gyAzvgHfnzVyoF273kQgA0Ed?=
 =?us-ascii?Q?oV2wdF8ek7pF8PyuWvfUvA3OK6uv6QJpI4/9HfM+HgpPwAGr2LcPq29gxlTN?=
 =?us-ascii?Q?VSWny9UHkacwJTZQgEk/1CvnbPA9oAEXHzhvPjpq97LkjLaLr32FWhjVVdHc?=
 =?us-ascii?Q?EUFYlOQinmUXhZ+uubKUbbEbvhDsc/sLG1GldHgU8L5Iie26cNnpOdQtGR+e?=
 =?us-ascii?Q?isxvaZn0AdBkXMe+2cTMrNJSXZ1DrusL9NO4EAmMHOjSbnFPGXClWLJfhHth?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c646576d-dd39-47b8-101a-08dc865c08b1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 19:08:22.3436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27df+Hs1mGzeFYA2KHy/NtvObKWP9H1bODG9w3NgdsF4ljVmZH89TLv7/t4DC+SeBb0+X08EfdIHAH8sa08Zig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7997
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

On Thu, Jun 06, 2024 at 03:38:40PM +0530, Riana Tauro wrote:
11;rgb:ffff/ffff/ffff> Use GT forcewake domain while disabling c6
> Move disable c6 call from GuC Pc to gt_idle
> 
> Rev2: rebase
> Rev3: add fixes tag

pushed it to drm-xe-next. Thanks for the patches

> 
> Riana Tauro (2):
>   drm/xe/xe_gt_idle: use GT forcewake domain assertion
>   drm/xe: move disable_c6 call
> 
>  drivers/gpu/drm/xe/xe_gt_idle.c | 8 +++++++-
>  drivers/gpu/drm/xe/xe_guc_pc.c  | 5 -----
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> -- 
> 2.40.0
> 
