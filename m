Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186B3CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 21:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D291110E097;
	Wed,  1 Oct 2025 21:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aYqdwtFB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535E910E097
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 21:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759353050; x=1790889050;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rLgVHThEtHqjjSxogh2S+o7gau2vvxAT5SgMoqgkTIA=;
 b=aYqdwtFBtuYk0I58GfqZy1u8AURxEDYYL/DSCXdJtYgyT2z5V4AIGucv
 B9iPH6vwgrLjQA9qjt1FUwJX5kAFyFQ+8pVFlcAM3luPp0gTCE0ov5/Ac
 wr9Ac8pwAYykyr08K9pjEPlamtwOmJ5xjSeHt+i6VfDF9tbUrERSYqLoy
 rq7H+LJTtZpHbJIXivEilMTjtEHb0uUnRAG5cHoIpz74/zSrXzOlr+M9G
 jiGb1ZEI0rOgFXz6jLzCneLF8hksDI/7MWW+pJk7pV0uxLttzcdBHJkgr
 OeIKx1wp1PkqpODnQXocsK2/9BfScFte9AkvnqXOeE02AezFhwI/pkMRU A==;
X-CSE-ConnectionGUID: HFJZ6xAsRN+uKoBv3AJtuQ==
X-CSE-MsgGUID: KJ1OZq3ATyitP2oQ4SW59g==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60853837"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="60853837"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 14:10:49 -0700
X-CSE-ConnectionGUID: hqGL7oTAS3Gwolq7P3gBcA==
X-CSE-MsgGUID: 3GkrWa2UQKyJh4xxYKdJDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="178000273"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 14:10:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 14:10:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 14:10:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 14:10:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbihCkNuLEwpPFSWjWweES+AA7Ss3pESUuNNFSFPUvIV6oaYgHSEORbyf+dNYfvM3MJBsCI3M+x/QqeXukvUV5EsLAgTqwdAbb8Buifg35xL2veP1DFrtmsQFj+YpS1dnHp/6GbQl8HZz1dDZ8cCqbINMVxPCfmxo3yWogmuYu3T9xjEi9fDqkDHGoPYb5GBYRzPFXv0R6Qe7UPVQ5H5lxqE08GCFlEQ/+MgmaacO9rafXD8+ZOLOaLrlnuQcMoAjQwE1zdw/odY6r5L7VVZOaSAkQg0BogVbek3TgejzFEVyNPFGecar+2/6YVvnEuvxruEPROg6J79Obkwlq5whw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgV3mN15gmI/CCKGxarQcFqUgbcfi438InSijKQMzIg=;
 b=YtOadpZipkYUf85aIIPUg4U1p6QwHo5sey4W8mLMRlrWtYRV9PbvtXUtvkRAy6IHJtdKeirKjeLtsvCXv6I8l3bdp4N6tO4EQllg2MkvaEMtavdpXELtSTlfITV5h/Z2UkJosgNceJjHZROewWZh7BP2fgBufqfiFdWgMfFWPRLKFtJNbh3Yws9H0ONX7Y/nMw4cT/jfxw6k4ADtt816U4z5hOOrYEMnBQUmMCCkLgdtFfTTGoHFXvtEx5WTG0HI3eBK6gKjdtlJQyEkeEbqW8nCNQv0txV2nezRO66MNan+M8sZWD4PbcM60dYHo3mtVl+7eunfmw+ojOLAPtbXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Wed, 1 Oct
 2025 21:10:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:10:46 +0000
Date: Wed, 1 Oct 2025 16:10:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 12/23] drm/xe: Check for primary GT before looking up
 Wa_22019338487
Message-ID: <bqankkbhxgkh7xypedkmwvvog7pgtvcufjkqcyqphadvwnruix@u5eet3inihix>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-37-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250930225618.140071-37-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4779:EE_
X-MS-Office365-Filtering-Correlation-Id: e660a09f-0578-4f66-b78f-08de012efd6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S1rgIj8+aLfRPGKB/q447RfTXaWWZFs0fYOduw9S6hyuu3QEx8Tbn6hVGJDF?=
 =?us-ascii?Q?p8OYQA19I8LHHjJ/edo9c7TjrRxBcba1ETbMM+5NRBVh7hTUaiUyHHFAwTD9?=
 =?us-ascii?Q?CUyPQ0MDkeFxsmj8EHQbcqKpWDu5Oykgg2D0MVIRQFbpv4fDOyrSldi3COzj?=
 =?us-ascii?Q?fAdziT8vvYQ3Swv2YFKk8mqPmenQQN5P92t3HYF6m2ryQJiR04FdNl+eqp/j?=
 =?us-ascii?Q?iEDJd8wOOMoC+VvaEoC/mu7XuHK5IcQ5uZkV+xtMFrGwiu0nU4seIXyiRa7z?=
 =?us-ascii?Q?Xp43fnI/e+ENHX1FGmS09TniZhefn0W0WY9K9GbqObgsIi1a1TljwBb8kX8r?=
 =?us-ascii?Q?alBySBSK2D9vwsAA+Z8Kzge6YoZTPkMsUCPhwEw5nop88yTtFetCnuqge5PD?=
 =?us-ascii?Q?P6FUNp2echYcN1pOd/bSMqB84i0pWPRHUw9/1nYMPD4YJRfWeRKlhLKlaecK?=
 =?us-ascii?Q?SVcKDYkjERLt1KHcMgQVcGYP9TbpYH6jUO3/vFOk+Oux4Sz3gRt3UxW2XdZX?=
 =?us-ascii?Q?CTVdAC3+tmGJ6i4GvfAXFJMPpaH7RTDijK5M12GhYr21jQgjrV3gcNTaLuHt?=
 =?us-ascii?Q?chSTkBa5kPhFdrmyjBI/BanJE7lYcrzbCl1lP8nupWSlFYMLGa0VVYjjbzLs?=
 =?us-ascii?Q?ncgQUscgoA1jPfo6MoqKh/00ArJLf3SRRTuxi94cXyjRqVOG7xFfJi8YIxSJ?=
 =?us-ascii?Q?f0vHhQmMw+JRxu6gnyMjoSw7HC+Gulu3cKXG2XF4/GkKBwCraKGp3Y/f3xb7?=
 =?us-ascii?Q?eSomxLgSmHo2BlSAzJhZ4Lk9ZKW9tQ5Gpa/P5V5v0gXoQpSvwYzkChGcqBUo?=
 =?us-ascii?Q?R5qfVE8XnbbzuTP287p8gFIUOr9Xla+gUJQNb/lUcFhFh2l9c9B6Y+ZUrV2O?=
 =?us-ascii?Q?bfJ37yEP09G5Dx5vtZGncNLqDti8jdGlS7fUg7XhSLxF0j/ha5yJjzjBvDls?=
 =?us-ascii?Q?r/MhSTkgUP7RLwPSIvZjdSz1+Sooe5j4V0f4raGRAHudHjuOm2H4+AF178ww?=
 =?us-ascii?Q?r6gKUBFeQS1jMbYXrNYdY90OUyg+8uUvJjdgomoulHCTQ1Te6fAzmcKrY3KL?=
 =?us-ascii?Q?DqXBR17bBBrFFsDGgyyZ2ejS/kkEhYisXGGsGBjh9cLU/p2CMvHf9kjzBN2N?=
 =?us-ascii?Q?l7CPWsPM6BAkfjcErOzK515WVje6MJfzWXS51t76W68IZPX1MDVKs+nE4myr?=
 =?us-ascii?Q?Tzh0yv/px9IS+fmU2zSB6NHMaftfJ41K1iXjFg1RiHtxMr/UFZF99EaKf0Wf?=
 =?us-ascii?Q?Bi92zEBAzLym8UlKYDTq9lpHUZiPuvvEUckl5yU5bYAR2U2l6n6LYMlLghcN?=
 =?us-ascii?Q?rL5UsdBRWebsqZ8BGC4r9Nzeli+eKqM5FF9zIepDD07JLgdiG0GB+YZxigvK?=
 =?us-ascii?Q?ri+ijbv/5LqvRq3ltSiExkHcgRqWuoOm8h/fnBiCDeKRgGL/kGGlBwglha/K?=
 =?us-ascii?Q?z3CouOPpLvcELDMcJNhCJNEvjHEIkVhH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Xdu8TqC/Kn3GpvnDyL7eNr3mIoVKVkeNHfTyDQ2nLvSi+q5VjdS+n4C2BEu?=
 =?us-ascii?Q?K15+Blhj8dvY98z3HjFoKq+R/zxCMzgHp9EEfovIFqrwxiYdQf19JV+x/RY7?=
 =?us-ascii?Q?vOjpjBCp3UY8Laasu7CJxjyGV6g30UEUAeRaNIWReYbma+HOq45QHplkRcPM?=
 =?us-ascii?Q?W3bcFOrLDKpbuAhqk2o3IX3zn6Wsj+EilDlUMntJuyJglKzD/JfKC7kFMHs3?=
 =?us-ascii?Q?kI1w90vpAVZFlm+GMrIwMjO2EieMI7DUW7+niR6bXJVNRWQm2webXgatT0+v?=
 =?us-ascii?Q?acSUjtF/HoHOEc8dyaOiuTjgm+j5ET0Mcgtr1Szfe2fI8XDIQAwI+wcKT5bJ?=
 =?us-ascii?Q?+Qyx7/y2ArIXdCStxC/Qz/7ozOBotUdJzKGY2F90vP3zZWk0Wv54cpDZL1D0?=
 =?us-ascii?Q?CkzCgIthQ6HP01ESN+7/PVXtzqExHNi7BhSu5rNBfsQD7pbHirDMQG1WHi26?=
 =?us-ascii?Q?lfO1l9KoobZDaKlnoE731tOlNyPejdgKV76p96hNKGfYhvV9AyKdRxW3N0tB?=
 =?us-ascii?Q?3e4fIDV+kgCKRDn+XQV0RTwY3UfLvxf0wHDjgvYmDDKPisFujX+rWz+FPLCn?=
 =?us-ascii?Q?0UGvmJ7j5jhbq+8rXMh8p73G82NZH20NShsTt4jj6lY+hPhpwNz8/wN+UsjJ?=
 =?us-ascii?Q?N+a1LHgYmBysAfN9/gZX6VQjn3PaU8LfnaMdGSNFN4oYZatSRCyg4O7OkNOv?=
 =?us-ascii?Q?qF79t9kal8c7eUmXmkzEmPxkiFj/UD9whJh65qu5IY08ukIb9CN8TDe/CKPo?=
 =?us-ascii?Q?hy/brlPsVSQdu3tTkb+mCQKZP1agOLy7bqvTEpKXezS9HYovN14UpiDIDKVb?=
 =?us-ascii?Q?JpDzRF2/6hGO6v2rJvbQvZ692/Y+g2BjnHpXKHxCZ0Z4BuoVJzrCCw/qjEtP?=
 =?us-ascii?Q?JAMd5yF6QdQUOlwlEJzUnBXAOrsUJw3nZG1vM08in+9k3vSYATyCpWRlesaY?=
 =?us-ascii?Q?nWxefmOv3ngjnJcGEefzESylG9vDdUJjFyPk2VtjcJZNplIXJSejfmWjioZt?=
 =?us-ascii?Q?Ua7DX2q5oABLK5+Sij7Sfgg+DoyVbUoJsuoqn5h+6aLB0Dj27kssp5+RKQIa?=
 =?us-ascii?Q?vfitlLhkVtmeB0NWA1ZH8rcJ/XkBu6UTu2ESqjXMebMzao8nv18yXbRfbbKy?=
 =?us-ascii?Q?mcmKAKhT0fUkld9L4QA1R4qS4AdzdXczJ6nUtXPORxr2Y0salFQOqnYiZ2wp?=
 =?us-ascii?Q?7F1GoqdWmR4f7mHMKjcuzDLRg7DWmoud2I5jGXTn6augT6pIed7VtsfeNjDi?=
 =?us-ascii?Q?zZTMnqHMjk1vvzpmptwMF1OP/qptsOQm4H/wpf8MKQhJWveXANad2jPxd1ud?=
 =?us-ascii?Q?3nnRX4v5pxqGRSswIkLw6YMjRI3N2j/hKTJrk/z0okvAA/WNoXRLhKhvDNw7?=
 =?us-ascii?Q?+/n8U25/meMm4SxHk/iv4WfVi5F58/tAXwi7+1fPcgm2D/2Kjp0Rqp9Umibk?=
 =?us-ascii?Q?FQBk2hlHeyKWuM0JyPA4/pMDfT8Nxi9fmI+OP7Tqpv2c88SwA7BWnlJZm4In?=
 =?us-ascii?Q?gOvVFIIoC12fnaHrR+MNk+0GmJzRs3pBEHsvVTx5KWYjHinOQutgWulBeC9U?=
 =?us-ascii?Q?jisTsTVLlGcE2xVGUEvkc9uzND/PVBixsu8DhJoIQS44Uc6COuBhl5I/vSMP?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e660a09f-0578-4f66-b78f-08de012efd6a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:10:46.6692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MPA5+G77AT9myyM5sbrHOjAyp5yENGhEIK5vOJib1pSRSvLupArjZVD36wNIRQ/RQbbIkKCTOmUpc/UV9i/7+yB5LyOK9ikyBVRkLiOmrGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
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

On Tue, Sep 30, 2025 at 03:56:29PM -0700, Matt Roper wrote:
>If the primary GT is disabled via configfs, we need to make sure that we
>don't search for this workaround on a NULL xe_gt pointer.  Since we can
>only disable the primary GT on igpu platforms, the media GT is the one
>we'd want to check anyway for this workaround.
>
>The ternary operators in ggtt_update_access_counter() were getting a bit
>long/complicated, so rewrite them with regular if/else statements.
>While we're at it, throw in a couple extra assertions to make sure that
>we're truly picking the expected GT according to igpu/dgpu type.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_ggtt.c | 26 ++++++++++++++++++++------
> 1 file changed, 20 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 7fdd0a97a628..0ed9ffc3278d 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -107,10 +107,23 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
> static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
> {
> 	struct xe_tile *tile = ggtt->tile;
>-	struct xe_gt *affected_gt = XE_GT_WA(tile->primary_gt, 22019338487) ?
>-		tile->primary_gt : tile->media_gt;
>-	struct xe_mmio *mmio = &affected_gt->mmio;
>-	u32 max_gtt_writes = XE_GT_WA(ggtt->tile->primary_gt, 22019338487) ? 1100 : 63;
>+	struct xe_gt *affected_gt;
>+	u32 max_gtt_writes;
>+
>+	if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 22019338487)) {
>+		affected_gt = tile->primary_gt;
>+		max_gtt_writes = 1100;
>+
>+		/* Only expected to apply to primary GT on dgpu platforms */
>+		xe_tile_assert(tile, IS_DGFX(tile_to_xe(tile)));
>+	} else {
>+		affected_gt = tile->media_gt;
>+		max_gtt_writes = 63;
>+
>+		/* Only expected to apply to media GT on igpu platforms */
>+		xe_tile_assert(tile, !IS_DGFX(tile_to_xe(tile)));
>+	}
>+
> 	/*
> 	 * Wa_22019338487: GMD_ID is a RO register, a dummy write forces gunit
> 	 * to wait for completion of prior GTT writes before letting this through.
>@@ -119,7 +132,7 @@ static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
> 	lockdep_assert_held(&ggtt->lock);
>
> 	if ((++ggtt->access_count % max_gtt_writes) == 0) {
>-		xe_mmio_write32(mmio, GMD_ID, 0x0);
>+		xe_mmio_write32(&affected_gt->mmio, GMD_ID, 0x0);
> 		ggtt->access_count = 0;
> 	}
> }
>@@ -286,7 +299,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> 	if (GRAPHICS_VERx100(xe) >= 1270)
> 		ggtt->pt_ops = (ggtt->tile->media_gt &&
> 			       XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||

while at it, maybe fix this indentation? The line break is actually not
buying us anything and I'd rather read the long line.

anyway,


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>-			       XE_GT_WA(ggtt->tile->primary_gt, 22019338487) ?
>+			       (ggtt->tile->primary_gt &&
>+				XE_GT_WA(ggtt->tile->primary_gt, 22019338487)) ?
> 			       &xelpg_pt_wa_ops : &xelpg_pt_ops;
> 	else
> 		ggtt->pt_ops = &xelp_pt_ops;
>-- 
>2.51.0
>
