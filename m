Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6E4CD11DF
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 19:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D75410E5B6;
	Thu, 28 Mar 2024 19:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crwHxTH4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7076A10E5B6
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 19:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711652626; x=1743188626;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ptzcUAgg8vUmltgokPlV4eVr9f/rO01GlLaeoQWXhSk=;
 b=crwHxTH400reL2nAQgz+f8fGW8D3Nu/p9rX2zFVGW4K2IO+MWjpO+HRz
 bwu1WYVOTON//9sBqE4WWXeC7MHCcfMxwF3Q2Km1h1zH8q7XSnV8jRVp0
 60BQB3WAk8eOPA9/CEfvkMyPO0JFA9pilwmuU4vGqFvu3sT303Q/zBcz0
 Dc8EcGlmDJ8FkrnCpIVnYAfACLu0oOuQK8JAJAfJXwMOSdP3BZveXD0KV
 yyDm+HtD972+JYMd89TKa9SkW4vl5I2aG9BoDQU/A+bdcBHlr4BV7CPTU
 FUleL9Z6E+RF0lwNifYmkC4aYOOw6mTZqVR2RdkdEMq0diXywIqspubUI Q==;
X-CSE-ConnectionGUID: /9nct//jQsqlAy3i6GZVsA==
X-CSE-MsgGUID: 0knJxe2XRae+1sDNQSwlNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17382325"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17382325"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 12:02:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16616601"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 12:02:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 12:02:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 12:02:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 12:02:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 12:02:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxQ3fOEVGMh6+HLRuXniA8gRYb5aDI1S04oYx+q4dCSdwZwmcsXec8HUyAx+iuimfkwlHQyYoZggmsuFkmYFm3xQyx3q7OGaD2LJOHX+xlwsu5zkGIrvN7y5LzCTR19E90eZun6LYIGJvO/HAZ08H/PHjzIX6WblPeBibdlU8CetX4ZHdulLNJbNIRfnczi3GsdZSTy9TyD//B5YGTnhpb2NJgHnGm9NkHzXXJs5F/ZBuTK7CYKPdxFpuDPIfJinUNAmpAt0zYxO+c/Jplx0WsoqjNZA65AKm+wLOY4mVqNm5xL4eayKvm4i3JnBSD7VDHLm/fy2JmgRBkyvKNS8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zc0BmWypbnV6vIxBulKRR8J825FcDaZFX0h39HhPEX8=;
 b=mEmFajH7cuf2IT3yADU9Tv5OAMavNfKNPhmx30HlXD2hP9bMHaRYaHuUW84at7Q0UoSmaV7CFuwyeVVMganTIB30pHVMuqnqnnrTiCNObKIv0JGAwDO5fJZLX8khaIeaSSiNEEh56aQu5oqpaKlRLpr698sV/fIvbZ3+9IGJoFbd1yVRdF28lskR6gOglJ/jECbiqpeBKL4myxuYCiDhzSw5qB51nL0qTdnb1HqnjizHXkLKhciyGbx7badiOquDdhlvrcu2r/fqkBRG07LgSU9AfSVxw9XrNFhkXkBg1vLU8oSeaRbChNJx5nDtdsLQUVQGKjeZyJ1HwQpbVKbyYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8274.namprd11.prod.outlook.com (2603:10b6:510:1ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Thu, 28 Mar
 2024 19:02:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 19:02:49 +0000
Date: Thu, 28 Mar 2024 14:02:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 0/3] Rework work queue usage
Message-ID: <rfc2tu5zx5qd4sbgpd7rcqproacelziemigx5wrs7xyjmr2fb4@w6wsqxkcpvnr>
References: <20240328182147.4169656-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240328182147.4169656-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8274:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MA0AN4j3vr9QEri2OLRjIAO893//iDVs4XKGvNZakB+ZaGGXTNhHcjBXWwYpHscVIzDW1gOEPHCL0O3uOTGBym0Uehop2fDIIjABqE46aFwy42uzRlzHJJB4REpKEOU2lI1cAOnVTzxzjFAC1aCpDD0sca5vSiQb5cKO1aAs6Rg1ThgRGhq4wgrNxFS83f9gIiGggUlHtHg/kcqQ9xJQUKP4mtteOuKCO1x7/gXBsVSPCOrQH323zuAyUGS7Z8ZAaGJbjaWd95X7vvnYD17hFhU7AfSDDJbs75uTaklEHqt28GpUEnF5KWT60aPdoYwA3GBVSptlFpmQ/F3UvEeLOzak5bSYvrcKa/LbdIxyaep7HpIIzS2MGyZpI0zcZ3w8pNlgeZ1Sl9vTOCcBPSrylL9A3pyOc4lxOW7Dxi6PkHYBo7gobVyfIkwTzQWiZ8WXnZCRezxJM89wvewYYBG1ec8T6p2+mtyyaKDCMgPYxbPhbKp8Gq/iGtQ4k3+156+uvuuge4x6KmdyD6msB2SFaS6mbRH9sVQUUxNGTUS/NWGivJDrRtasD4wtcFjrDp6c1p9wl5u4Fg3CK/MQfD5TI1C8qn5QE0KvdyAWnGYRXiWnN0oua6TxvEP+KmqX0Cem
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?38RM/TMIZyKC+8fNwjlNZqtSY5/8Z4OMi4jjWU8LyoENCSb9fSj8/2ZJ5s2v?=
 =?us-ascii?Q?lygEinE8HywrSdQjIQcEj8jkqS/8HJeyccnzNR+0kgdagFS5ssByfB2Cs9Ht?=
 =?us-ascii?Q?dsleZJBYDcE01eCHdCGsYyRuUiryZhEJGNTANdWUEQh760jJrKdSylTR+48J?=
 =?us-ascii?Q?FlADr5qj/Kf+dj4HzCoGi7jrcfUmlm1V/GCxCYXqGNYW1jK1q6F6hOIbciGH?=
 =?us-ascii?Q?WxuWN8Jc8gh3i3HB5udzzAKFEKZTdCpsedQhbHCvVjmQcGvX5pMnTWp65vlV?=
 =?us-ascii?Q?Jw0M3TpJG05jcvLVcpbPux4yNehR77xNR5dyk3RuwlM/SmCpPJ17LoDen0EO?=
 =?us-ascii?Q?BfzTf2VkPz+TY+Xios0yYnaOi2fgrjFBjARYYsUxbHF9MouwxfYa+S14/Sxw?=
 =?us-ascii?Q?w0fCwFYxM9cNy7zPF9ghr9dHXx+pl6gmYhoke+kHRG/C6x2Z/l9KSrbaDBuT?=
 =?us-ascii?Q?Nsy0SA94DyhwC/ZZVR9op8EYnQBRwzKs9q0bgTq8GeQkUJCLowhRxpLRPthC?=
 =?us-ascii?Q?69wd337g21jijOapR+ERH7Nd442FCCwGY65FnLxNtFYxP8DWOpKIUDgV8Jof?=
 =?us-ascii?Q?Ov2P9jDyn/+KlWEVcAL8Snowy7qNdwwhyV3lN6X7AZ+hFz6LW/ZGRaF8sQnZ?=
 =?us-ascii?Q?AWXDqMCc6jIB+He9qwsEabPdiFkGUIyDxjzeiV7VWkQV91lR/oWUthNFQ9wa?=
 =?us-ascii?Q?JF5hr88bgJCyVdBspiwNa3JOAMwuJn1SlS3hlHPjegNEaMl8OLHIlEFsqatH?=
 =?us-ascii?Q?EktAlcoTer4gonbW4UtjeGMAftgyykQFWhf4XgvTl/vH3LG3uawmava3yPjc?=
 =?us-ascii?Q?mHeNGOEqAGkPZd7b+MvwoypLW2z2kX8R+9J0dZ4epji+RiYYRtPQpBOje/3x?=
 =?us-ascii?Q?U0lto9OR11OQKEBtFxQEUqkJo/qOPvhqMVeKxRDTqLcYzxKYeitp4JPBrAvC?=
 =?us-ascii?Q?Ic7AeH45X//lDOGd4AKBMMRn31Dr+/Nv/9GTnkNhE5ZCmbK3Gi4dH7DH+eTz?=
 =?us-ascii?Q?pGTJ62V6vQn0vKNLYBOfvA9GmCdRAZ+/JqXacqx4pxTAsSSZO1prloRStyv7?=
 =?us-ascii?Q?ClkEczlY01RQhLoYak34NtdxOZj7alqtx9XMqs93CMiASovcxRS7JUm7eJz0?=
 =?us-ascii?Q?ep8XvMnMSbDDGWcxjU0JSaZx7SWoZYVJ5jTPgzk6qCgtjgDi7YkrnYNT7KDN?=
 =?us-ascii?Q?teb3oWpfWUVV4CqF4ejAjs3STvalken+Dfj6OxARZf0g1kGHTlS1akrXo64m?=
 =?us-ascii?Q?8CFi9FDsmXmRe5WAfRVpYBNMO+8v5Gb4AGgPrjjShQgJe/i3/xEnBiy2WJmg?=
 =?us-ascii?Q?CHofiLRffu8XYhIAG7hOH33p2wSy55bauLLsZtw7gbKyDfzlqejkvVL0SUTL?=
 =?us-ascii?Q?KsCfmwC1XcvbWSTg7ZX/7qGUFY/qYzX1NVlH1QRzvnWiJLTV516vPKQ04c8s?=
 =?us-ascii?Q?LGaaM9VBtGGynoWpMWVZd7rgl4evVf7yFT0NSjDuC+1uEtmSiq2aSvzGHHVQ?=
 =?us-ascii?Q?6XP35BtiqFxz7vyiJhO5hOCoTB7YsMnVwjj8l9Ei34S0iC9m2YUkmRXrveT7?=
 =?us-ascii?Q?cn4MHhu7kO3SQ+wdh3LKb4MXQyQWlTjjWaDFGjn9mnQ6B6kYWWWNimFnkPgy?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78125b4c-a985-43f3-009f-08dc4f59a964
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 19:02:49.4036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0IDAdBRzhAVC4pusP5MyljgOsLJ1ZfDQ3kJxT81/+Y3FNyQPQEHc1np5eT13ATv/ArJIyYxiEHX3d1yA45jRRd8wLcCbpbpXV3Qn3lcHJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8274
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

+Tejun

On Thu, Mar 28, 2024 at 11:21:44AM -0700, Matthew Brost wrote:
>Avoid sleeping or grabbing locks in work queues shared with the system.
>Recent changes to work queues [1] have exposed deadlocks [2] in Xe.
>
>I believe only patch #1 is required to unblock CI in 6.9rc1 [2] but
>likely all patches should be included in stable kernels.
>
>Matt
>
>[1] https://lore.kernel.org/lkml/Ze7Jz9cQcUMtCqfk@slm.duckdns.org/
>[2] https://intel-gfx-ci.01.org/tree/intel-xe/xe-984-093d82c02921344d8d400989af156aaf79b9d961/bat-adlp-7/igt_runner0.txt

I think we need some of this information in the commit message in patch
1. Because patch 1 simply says it's moving to a device private wq to
avoid hogging the system one, but the issue is much more serious.

Also, is the "Fixes:"  really correct? It seems more like a regression
from the wq changes and there could be other drivers showing similar
issues now. But it could alos be my lack of understanding of the real
issue.

Lucas De Marchi

>
>Matthew Brost (3):
>  drm/xe: Use ordered wq for preempt fence waiting
>  drm/xe: Use device, gt ordered work queues for resource cleanup
>  drm/xe: Use ordered WQ for TLB invalidation fences
>
> drivers/gpu/drm/xe/xe_device.c        | 7 ++++++-
> drivers/gpu/drm/xe/xe_device_types.h  | 8 +++++++-
> drivers/gpu/drm/xe/xe_execlist.c      | 2 +-
> drivers/gpu/drm/xe/xe_gt_types.h      | 5 ++++-
> drivers/gpu/drm/xe/xe_guc_submit.c    | 2 +-
> drivers/gpu/drm/xe/xe_preempt_fence.c | 2 +-
> drivers/gpu/drm/xe/xe_pt.c            | 2 +-
> drivers/gpu/drm/xe/xe_vm.c            | 4 ++--
> 8 files changed, 23 insertions(+), 9 deletions(-)
>
>-- 
>2.34.1
>
