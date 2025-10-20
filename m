Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2FDCCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 15:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3C010E471;
	Mon, 20 Oct 2025 15:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfyJhwAn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E3A10E471
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 15:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760974780; x=1792510780;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pb83nSl700f+hBqbHTgy9hyr6Yrb4/wAFysnQSJYiTM=;
 b=XfyJhwAnmKULGp7tTAsxw2bR8dAgn6zJpdqSlytWS/+cU+78Y/0/bK5S
 Mlx3VqKemeqaeunCjbMIAvjevMMopIjg//fx30QY8AGP9FF4BuvVTUp59
 exXsUHA7mpaqtzOx2GlMw5hfXcszgzlwpzB5HQqzq/7p6ShmPDCYZVMDa
 dsQGb1ZFludUOSobhbTqKW8HYZQtsxjiW7aWlC25iQefIxjIRd6JAwb+X
 5LDjIGtQFAu87zT3w/dBtOw8JHfHIPiBzCKB9GkgIWTZhE6fEgmFSSBbE
 eDfVw73cLHpQ6U/wb/vjyuZrqb+6OBscExoTqE1gkygV/SMFTMfC6OnZG g==;
X-CSE-ConnectionGUID: xooYJnE3TQi6+kYIHAn0YQ==
X-CSE-MsgGUID: 8PM1XsmkS4mQsRjg9d2xag==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50661140"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="50661140"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 08:39:40 -0700
X-CSE-ConnectionGUID: L93QNSusTXy9TgFTzz8TtA==
X-CSE-MsgGUID: 2oK/JBhRRye25rCojNznPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="187766063"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 08:39:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 08:39:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 08:39:29 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 08:39:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QT5gAky8ACfbfaRWB500z8UAskCaa7daW1Hc2HW0MbflxA4iM7y4MqEtOUj4el+qT+xYQW2lqlpCCICUjR6HNviRE1BZLPxHa5VB3/6P85qZiMBZUbty5fSkJOUkvp0kLWxCWRhmKw0JZFuqli10LmRfEJbgDjnRE7E1wpfcuV+hmLoW2J1Y2tjgWCaT709YfNLDhZMVHwmXuFHwIB9MDPBu+UlnR73B50spdlbP2/hPNXe5K1A0lnyBUgfJzsQN2I7uV8qX20TPgIBp3WUDITHSSVCTXw5WUqx5f6WVV+sXwBIi+kpDMh7JsG0q256REUn2tKHK/Z4CnC/03+PGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIJEPz5oUvXdL0RzjyNUHfjFh4eVvavujXMrDdxGZAA=;
 b=MdV4bRe7xOLZiGQOUI9L8ipP0zkb69qTvfnaaZ9UoI6dNTXi8TYS60K3ksSh3ZHxWCNYkgzDqa+9hC+BrAtBo47to7lv88ygnsAGKz+/97dF4rbZkQhF6ALZLJBzyycfRCwhN1Z7ANwAcgxvQM5XxoxCL+t1SeieSaIz3hozJ54KPadZc7CECxK/JzfkFfC3oMyq5dGVRBzcVgQsFGT1lFDDarMkcqYPHIOOxxDgvTf03hSAm7JtdPdDfkyy+8nzAKA9PJt9ru1wYVDU+LWLEnsNzOHSYbDy3GTNgpIKO+HT2c8SLzvKT0P2tLjmMZrcTBIhMVW/nwKXZK3wNRUbmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV1PR11MB8849.namprd11.prod.outlook.com (2603:10b6:408:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:39:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 15:39:26 +0000
Date: Mon, 20 Oct 2025 08:39:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/xe3p_lpm: Configure MAIN_GAMCTRL_QUEUE_SELECT
Message-ID: <20251020153923.GC1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251019-xe3p-gamctrl-v1-0-ad66d3c1908f@intel.com>
 <20251019-xe3p-gamctrl-v1-1-ad66d3c1908f@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251019-xe3p-gamctrl-v1-1-ad66d3c1908f@intel.com>
X-ClientProxiedBy: SJ0PR13CA0238.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV1PR11MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ff4061-e7a9-462a-3848-08de0feed9bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?27aS4FccnXPCXpTHt66X7H1Y15kXu/dl4znMe02TCaIiHvd4Y+UC73NkZfV4?=
 =?us-ascii?Q?0mcrvcEZbgScj/wOi7jCkT4Bz05kNRYJf1wT+dakx1KMOzPgj76tOwyJW3av?=
 =?us-ascii?Q?7u+NyTTP40XmAP8vT8SftAV2/YApAUt+tgl0xBUsILUKk1ToZME+Tafpr1Un?=
 =?us-ascii?Q?5bnc+Mpe0hp2CP8iXpwEpsFNtTufoBIhU1yg0CQBGFMFvDVo9seXaHbXq+Ec?=
 =?us-ascii?Q?rNBVqoOMUScGRzBxcgVyMxmYJ+EtLaZC+iSwsZWFTfDOPltcm+FqP9htpwjF?=
 =?us-ascii?Q?oJRi17pDWFGHRvhIQHwmhdrSneOO3i5W8pmRkdyQRyrgNT8JVYT15Il00wgJ?=
 =?us-ascii?Q?8zJW1iku4jcCI5J8zgr0kwWOyPyxF/OMAdOP302WZW0lYLCiH5dghDmdRrI8?=
 =?us-ascii?Q?cO8fp7tjN3CSw4iTMHfyejCusOcjQ8Zjt+hecWbcH/LkfQzGDx1kVQ0pP0fv?=
 =?us-ascii?Q?Ozm0rPTrLulpERacTqjtGKT3EyhqjyU0GIuZdhTzNkT3YqXoL/7Co7Tg7SKN?=
 =?us-ascii?Q?Ix/o/PER4hbraQWYXocRHnAXYN34k5o3dsRtFgzR9iO9M7kmRJXBFmU267ve?=
 =?us-ascii?Q?uKkonLn9P+PMCPUDa9dfIOaKEwo4a0vx6zS+oBZR6wZ5vV3aVOhJKkTyY8/t?=
 =?us-ascii?Q?E1ctQIUQ3A/MswMqpLYSMjP+z/osm/yYZfG6N2vuRiCmry4lTCUa9KyPQ2Yu?=
 =?us-ascii?Q?xw1TWXKZYnKV4EO1d8NFGRbVnJIpFO+3B8Wxqisa/Kd6zNB2XS1fkKXni4h9?=
 =?us-ascii?Q?UDYxbPFJanpxMMtZKYF2s9jR8N+VpbnlD5Qb8Mp+Kf5eeR2bNTtT7PGvpUzX?=
 =?us-ascii?Q?KegeGS6gukcJml5rAEp7UwO64YYO7JWAlClywB9tkYRmc+E7MQzspy+sVtzo?=
 =?us-ascii?Q?beoI+6D4wkOBZYpFOa4WhcCNdR0BywV79Ef985P/XuISdXtOSb5g1GeKdrkt?=
 =?us-ascii?Q?DaFtLf3tk9ULzoh6cCFtuO2Kr0pLySElvN7hnr0ePsX886ChMSeuNj84KCKo?=
 =?us-ascii?Q?7inv7m21xB9kmnq0qw2ltCOJMF4rrfzEgCG+gnFhiRHpoquPAQO6X9QUfJO9?=
 =?us-ascii?Q?jYeEjcPe1abq0jbWS23blGXTTUCnEZVIr9/e9ayhG7qZxypbC7m/oJZHORXX?=
 =?us-ascii?Q?b/kkhF1FcY+62OajXpXQPrjZeVewHs2GImwGMx3qo5jYLrtav5FScdGeYNRH?=
 =?us-ascii?Q?F1n1uVjeJ5OxD33W5BQ1FA7QPlH1KtKEuUxMPE9s4TzmcSBGdTU4Onh9L1+W?=
 =?us-ascii?Q?8fjfWKTjRqzu+Jkz87XZS+AEjyGswO592Nmj+p3itOwT2mgg20z+3pfwPcdb?=
 =?us-ascii?Q?jS2ulveZvtM1+2WkgnlgfliAtyTZ8YC3lFm1hJ6ExVJSMzHLEdL3biYaN/5x?=
 =?us-ascii?Q?naCKtPIis+tAeW6JRaoSDIdxnxKk/1BHvb9r7r472+Ak8+LtqCP3eyNYKrLk?=
 =?us-ascii?Q?EBLuQz40evKf9soD3LBMAE+8vMW+fIVx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MwC5+DOOML9jL1u5MMJ0RUdEHHCLhVI3PRp99c214kUMtleFnolX/HTJXWw/?=
 =?us-ascii?Q?UOr9R5YvIX/IZSz6veaqI2t0cihlmyvXFfQPkMvenph7+SM6Ty2J/lTBTsbj?=
 =?us-ascii?Q?WaNjjWOZYjeLIgw93/ymVu0iQouoCEhltpu7EUC8qTIHwlfw2XTWBrwjPVXQ?=
 =?us-ascii?Q?bs/AFwv2R82xOx0k5nIIkfebOSA1EVc1cJMSiTCmNlmDgildgaBpnIuMhyrX?=
 =?us-ascii?Q?rMVAhVQ8TLKHhrBGgbqlNZGFPkboAZ4XDW/z9rS9heVshP/B6p/ugmuVEW5O?=
 =?us-ascii?Q?gcsfNR88wCoEzrT6TN+iz3IslUCfnBD2bikbBY4lQCkrSclqPt2cdLebf//X?=
 =?us-ascii?Q?ZpiWMcF+YmkPOHhCFiuGjx8Dgg0CT6UIMhloPN32jOuwISQOwvuLPFoMYnA5?=
 =?us-ascii?Q?XIiYNK/HxyX6l1GSegfLDKA6QNSaV15go41Mcysz1t5OoDO9ZcvjqAaVOhqM?=
 =?us-ascii?Q?8e+ZuBjX7QgPU5IT++gQaop6yRZByLHLFP1GR3EwAQ7ivFiqJhrkleOr44ip?=
 =?us-ascii?Q?Mu1FMFLmjb2YaTHjGWS+De7h6zFY7iclrGYp8Osh14pAqnCwv1WCplnfStYb?=
 =?us-ascii?Q?4zn09z/FSmq6y9xie8gYKSuWJ8V5e4ZokpIP01mEROnCr6AZmeOnef5s3h7j?=
 =?us-ascii?Q?8Pan3kOd1ifoM9shZk3Muy49LMgPlM4pPsziy5LvhOGUIn+oqoWcTIvRsTEZ?=
 =?us-ascii?Q?rGHDHPUZwRXwWVM5MNGdFTS/UNnNrWmdOpE+z8b1EjCgFUqxBp2qLCTQf/Ne?=
 =?us-ascii?Q?qt6u6sUYhql0CridsueRjWgtdC3OT3AoFp05pCysuW+FlhIQsjLv20csaayX?=
 =?us-ascii?Q?Rr8RKKQfyslQhzQGB9gwnds49ogo8W2IYDmLGPeRyXLlcIWaNZQ33zLw9ux2?=
 =?us-ascii?Q?7VWudQ6iWe0u0Z1dns4QB7TPW0vHAVUIQSrjmMq8oOPpTPtTYPgX5lmJBXpI?=
 =?us-ascii?Q?bU3kO996uZV3Ik8+WZi0HJ8cNFbAJ/2svnDhZEFBp68y4h5o/LlajTAsBudm?=
 =?us-ascii?Q?fYIKIBJ3+YjBGnz6oN2WJL3cKmNpsf+bCU9sIUe1QkT2dcwJ3u/duuATbVA4?=
 =?us-ascii?Q?/NoWiY0j9x4OD/oKA8iRjqTtQPh2s0x1e+KSC8Np1GSy4ixeLz2jWryTX15w?=
 =?us-ascii?Q?2wDIYEZmZFAW65dQXJ6jExvath94kp3Hh0C2sDiHwj0UO9FzDRc2N+8qd1cK?=
 =?us-ascii?Q?Lpepnzy0rfahep9sA9ha1bUhjOOcG9yHQzAhvVlpZV5gsykWGib4TMW3818j?=
 =?us-ascii?Q?qxb/8WFImTnGKqad950vh/SjmT8/pt/R1LQde2fPGhWMjB3sQ5vGtubLxFw5?=
 =?us-ascii?Q?/kh8zb89mUkmLZIvQn+Zaf4mNGVZ3DpAO2MgLM+D+uuYu1lACxMHaGw6En5Y?=
 =?us-ascii?Q?M1Z99Zif3oLQFbL2FHmTQGDyjnDjA52GWDCqUTqCT93OORtVmjcX/97AD/eK?=
 =?us-ascii?Q?TUl7uCZiUuuOY/sQww+xAlz00DWZscZD5oj5Jn7xWvzpHH6ZITqpuP616axv?=
 =?us-ascii?Q?6dn+E78iAwYkjLn178kVW4HGAY9lv/+LCPuWagqaHIzhfmCmPGFA0OSfY7dz?=
 =?us-ascii?Q?sNsw2BCAHB/ry6MrTBjc+PgJcUeAKNBiiJZuoapELySOmLvdXKVvORVxiWKx?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ff4061-e7a9-462a-3848-08de0feed9bc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:39:26.4999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeOgIHA/ezDAjuYmyIAmhbuznHg8TJKgsufNXR/UR3ejZFiE3DNM4InE53aeAgxNTCtN5yRr3AKQlVDX0gqTiwl3WLr/RHbeUijcH87wmr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8849
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

On Sun, Oct 19, 2025 at 07:05:46PM -0700, Lucas De Marchi wrote:
> From: Brian Welty <brian.welty@intel.com>
> 
> Starting from Xe3p, there are two different copies of some of the GAM
> registers:  the traditional MCR variant at their old locations, and a
> new unicast copy known as "main_gamctrl."  The Xe driver doesn't use
> these registers directly, but we need to instruct the GuC on which set
> it should use.  Since the new, unicast registers are preferred (since
> they avoid the need for unnecessary MCR synchronization), set a new GuC
> feature flag, GUC_CTL_MAIN_GAMCTRL_QUEUES to convey this decision.  A
> new helper function, xe_guc_using_main_gamctrl_queues(), is added for
> use in the 3 independent places that need to handle configuration of the
> new reporting queues.
> 
> The mmio write to enable the main gamctl is only done during the general
> GuC upload.  The gamctrl registers are not accessed by the GuC during
> hwconfig load.
> 
> Last, the ADS blob for communicating the queue addresses contains both a
> DPA and GGTT offset. The GuC documentation states that DPA is now MBZ
> when using the MAIN_GAMCTRL queues.
> 
> Bspec: 76445, 73540
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_guc.c          | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h          |  1 +
>  drivers/gpu/drm/xe/xe_guc_ads.c      |  6 +++++-
>  drivers/gpu/drm/xe/xe_guc_fwif.h     |  1 +
>  5 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 228de47c0f3f5..1876f2957c6df 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -544,6 +544,9 @@
>  #define SARB_CHICKEN1				XE_REG_MCR(0xe90c)
>  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>  
> +#define MAIN_GAMCTRL_MODE			XE_REG(0xef00)
> +#define   MAIN_GAMCTRL_QUEUE_SELECT		REG_BIT(0)
> +
>  #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
>  #define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
>  #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d94490979adc0..37e3735f34e63 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -91,6 +91,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>  	if (xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev)))
>  		flags |= GUC_CTL_ENABLE_PSMI_LOGGING;
>  
> +	if (xe_guc_using_main_gamctrl_queues(guc))
> +		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
> +
>  	return flags;
>  }
>  
> @@ -1255,8 +1258,13 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  
>  int xe_guc_upload(struct xe_guc *guc)
>  {
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
>  	xe_guc_ads_populate(&guc->ads);
>  
> +	if (xe_guc_using_main_gamctrl_queues(guc))
> +		xe_mmio_write32(&gt->mmio, MAIN_GAMCTRL_MODE, MAIN_GAMCTRL_QUEUE_SELECT);
> +
>  	return __xe_guc_upload(guc);
>  }
>  
> @@ -1657,6 +1665,25 @@ void xe_guc_declare_wedged(struct xe_guc *guc)
>  	xe_guc_submit_wedge(guc);
>  }
>  
> +/**
> + * xe_guc_using_main_gamctrl_queues() - Detect which reporting queues to use.
> + * @guc: The GuC object
> + *
> + * For Xe3p and beyond, we want to program the hardware to use the
> + * "Main GAMCTRL queue" rather than the legacy queue before we upload
> + * the GuC firmware.  This will allow the GuC to use a new set of
> + * registers for pagefault handling and avoid some unnecessary
> + * complications with MCR register range handling.
> + *
> + * Return: true if can use new main gamctrl queues.
> + */
> +bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	return GT_VER(gt) >= 35;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  #include "tests/xe_guc_g2g_test.c"
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 1cca05967e621..e2d4c5f44ae34 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -52,6 +52,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc);
>  void xe_guc_stop(struct xe_guc *guc);
>  int xe_guc_start(struct xe_guc *guc);
>  void xe_guc_declare_wedged(struct xe_guc *guc);
> +bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 22ac2a8b74c80..bcb85a1bf26d9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -820,16 +820,20 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
>  static void guc_um_init_params(struct xe_guc_ads *ads)
>  {
>  	u32 um_queue_offset = guc_ads_um_queues_offset(ads);
> +	struct xe_guc *guc = ads_to_guc(ads);
>  	u64 base_dpa;
>  	u32 base_ggtt;
> +	bool with_dpa;
>  	int i;
>  
> +	with_dpa = !xe_guc_using_main_gamctrl_queues(guc);
> +
>  	base_ggtt = xe_bo_ggtt_addr(ads->bo) + um_queue_offset;
>  	base_dpa = xe_bo_main_addr(ads->bo, PAGE_SIZE) + um_queue_offset;
>  
>  	for (i = 0; i < GUC_UM_HW_QUEUE_MAX; ++i) {
>  		ads_blob_write(ads, um_init_params.queue_params[i].base_dpa,
> -			       base_dpa + (i * GUC_UM_QUEUE_SIZE));
> +			       with_dpa ? (base_dpa + (i * GUC_UM_QUEUE_SIZE)) : 0);
>  		ads_blob_write(ads, um_init_params.queue_params[i].base_ggtt_address,
>  			       base_ggtt + (i * GUC_UM_QUEUE_SIZE));
>  		ads_blob_write(ads, um_init_params.queue_params[i].size_in_bytes,
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 50c4c2406132e..c90dd266e9cf9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -113,6 +113,7 @@ struct guc_update_exec_queue_policy {
>  #define   GUC_CTL_ENABLE_SLPC		BIT(2)
>  #define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
>  #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
> +#define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
>  #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
>  
>  #define GUC_CTL_DEBUG			3
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
