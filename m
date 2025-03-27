Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63BBC3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 22:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515F710E183;
	Thu, 27 Mar 2025 22:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZKhFYc9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D91510E183
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 22:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743115490; x=1774651490;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1KIboJmIMuGCc0RCZm0pMKf3DZoaLyuxDRgXEFPiUCU=;
 b=hZKhFYc9QXvw4nk1pwbFw3vmvkdjzJx5ii+nrp2pNN0pd+r2cvqXqYVD
 mqtLvh5/TgotK6FH6cEk/nBIHiIa4gSeL/bcUEkXkPIsAIlVVBDyt16r6
 8aIA3lkGHdv7UnP4wuhyLwRIiDX1MKFZFzE62hcDI4D+OLibidoubjfT2
 k10QmDoDU5kpZWWUhN4ALZbY9x2MbgtQQmfnNTfOoyEjoGcv9OlRIhGfD
 jV94Vjq3kn6Hht6nMaG+OxNKVhuS7upa3vVgU3gEEE4rMJr1FddWrKj6P
 y4AJjscSsvR8AatzXYeaJrhbRW/6ZMezAHqRCtlNH6PxhB7Fm48uceTh8 A==;
X-CSE-ConnectionGUID: z6nJhGwfQsqfwq2tBDDl1A==
X-CSE-MsgGUID: NJEBxCSMRzqNVLl0VyHJTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44486401"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="44486401"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 15:44:49 -0700
X-CSE-ConnectionGUID: fm4N8c84T1OUBs/4nHz8mA==
X-CSE-MsgGUID: iub9QFdAQr2jbbH7p+dQgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="130480826"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 15:44:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 15:44:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 15:44:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 15:44:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwTwQKCmk4YxeStScfG5ov5ukj+nHxmm4JT3Ieb70Qz0Q2Nc/xqK7LFyYeFTT34qB+qw2ejPV1fnKJ94Ysd+vWfxr1DhA6d36Fbylo7ApLyVghaXqLi/+7dDZbkARxlKyZErypvLkZqz05m1BMK7/h5A3+sua3KujYMpU0bMIPno2K5V3+dQQToRSZZYaN+0cQVQ8OGAOJt6sqU//pGX+7yqpIQT294A8nyDSZo6zOSv7iI+EgKGWVOZVjeGHe/runOVZj31Ag0fsaFWHy20jzUh1r2YWqRzZtD+7SswZgfUEXPf/TSq4W1kW0LWRAh3JrUbu1GFCqkx2XAfU31gXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mULVUayDxMFC87n4pt1hKvOEVFB5cfytFblJeQps9wk=;
 b=R2U3My2K6ZLVnQFfn6EZKTr330kIcMnV3nLlNHa+NytZ6PgIyGHvLQTHpmG0GAajBuaTWEckwXJ2blBleR0a3z1JXfRfDuxKMI4KI+P0/BECbebg7nJ2z1wvPiV6oV2InvNJiI0CewcmadTo1u0iWsIsiolzisTbz1jwQjrRsjsKveABQi8e1YA2aEh3uvE8qxjz3w0yn747DnlVQwK2gWE11moLWJJ8nacig4ILtyRlfVIblhhTpIK1xugwcoMxqEtKlnE9oZPnxBvbhKTB6YWt+z0UwyknedyxiymyY7J5bybRIqElcpSvganmZAL1V0xkKhYYa7jU1kDdBw6Jqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB8112.namprd11.prod.outlook.com (2603:10b6:806:2ea::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 22:44:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 22:44:00 +0000
Date: Thu, 27 Mar 2025 15:45:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
Subject: Re: [RFC 02/29] drm/xe: Make xe_svm_alloc_vram public
Message-ID: <Z+XU+ZtuoXFEbLzH@lstrano-desk.jf.intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250314080226.2059819-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:907::41)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB8112:EE_
X-MS-Office365-Filtering-Correlation-Id: ab8f57af-8261-44d4-c2ae-08dd6d80ddb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TbycZf49WvCEgZhtsI3r3iScFFFlxN+fV1ilZcKDvMp3Nm4o6LNm0BC1foGR?=
 =?us-ascii?Q?IgsCSU49qVzLFj1ydQ2JQ9KyEZTgDUN7Jsu/aBqPfZRhPd018PCSTF8wUQal?=
 =?us-ascii?Q?bl/S2kOIniLEh2DfebsaFFR1arzZGYJuG01yTW+gHrgudawKvTYuijzNyIeA?=
 =?us-ascii?Q?96qNeJ5pnbLFrYwaWf7IRcgtS7ObAu8XcWCItOGr1Gy/mgtb2kMHwmlYZ/pH?=
 =?us-ascii?Q?Utkrm2dQcGLOsMde2WfgoZ/bz7IfWiH1fMxlBHFpDs/+smfeXw2E05VkQISo?=
 =?us-ascii?Q?T5oAZjopwKEMAfL93cFY9YG9Bd1NOewJpc2qdPkl2B9lMGml1H0kKhm2J1zA?=
 =?us-ascii?Q?CNqDhTSb5+jBk6DblePlaNwRrNAHMLg/kP6oXNNmHePBxRHAMUg17yC+HN3c?=
 =?us-ascii?Q?Yrp3zrXLGRGFBO1rEPrSboC2JL/YrLzNp46+wrKD/HsBiszBz+Et0M8AtEZ9?=
 =?us-ascii?Q?W1YW0B01l4PiP1nkyAqd1STBtYCxP7vHtBQqfEy7ZvMktQCWsgQw6PTtSdgF?=
 =?us-ascii?Q?RGu4pFT399Vt+ORoRtEEYb2y9KKCfjZ8eZkQsLHSghAtp5/jE7CZ/BFeXDpt?=
 =?us-ascii?Q?sngjQwZpEjynZQXgkOHH0dW2tzThvxVVrjIVYYBnS6BwlYZPG/nR8zEMcKB0?=
 =?us-ascii?Q?4RZov+puxnFKYYg8BtXieN9XLawzM8SKYaopTiMyPK4BCzFXdS/CHyaig0vT?=
 =?us-ascii?Q?Rmwbh106C1Hy2YGBz3L4IjLhjoVbuMhDAQbaau5hlu6/IaBIFolhF7zUDmHV?=
 =?us-ascii?Q?D8lhKzlp6llikoaDZMRI5kiH5XWS6F3DwNq3uaBjKxlexz9oi9MW1iw/G49B?=
 =?us-ascii?Q?G3ZxdjhQ8ArTXw73GPJMyDE9lbvNqS6giui3d8sZgiQgahFNNT8xwh/dhiov?=
 =?us-ascii?Q?PeGJrjTz45JMgNcX0Wu80VpUm52Q5FG5zILPiMZhRMdJKj71x8WcKlOvkXzx?=
 =?us-ascii?Q?mQyPSRFwbjIaK5nxI+uocBP5jf5AbaiKUx0CvIPE8pCVQPsHkpdgXQzb56Um?=
 =?us-ascii?Q?JDJHz2MNxhj5AScJeL96KjfLBHMxUghuLAhjqQXTgYOE45W0OYrnK8K4KOND?=
 =?us-ascii?Q?pdNRuK//NgqO1Cb8+l0OPrgWMFg0YIP31hDUr0j3EF2fYs5ou8+2qZE32NJa?=
 =?us-ascii?Q?diE1iSpuhD1IDuT63kgocbdCPJLiGtLCCcparJ6enm9v+iXl8oYiqwxBBPcT?=
 =?us-ascii?Q?IKy6AoN98rAMONHLuJAYbmWlCyvrm1+nb5M/vpDCtFt0A0ZWbwGy93/Gk7ww?=
 =?us-ascii?Q?J786CYStJioePkLuJbFMQAzrNIJiYHA/0cZ4iHMzxRR5bh4Ywl0N+BMx4NzY?=
 =?us-ascii?Q?o6b68wSEi4/gYmiLBIFyVyMO6PoBWS0ORhZoz4+W0a71S2JFyBqAKlLsOZoi?=
 =?us-ascii?Q?d9zIsEtfjDaVrrRATN3WySRB6VZz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nGRxszK4LQHOn6vEDMBCvoSxb/De+LVJ8ZG6wZuMIc/6ZBoOP+yizh0ZCuew?=
 =?us-ascii?Q?qNFqu3p4aoLOUunHYnqEjvPT3HCSTkf8CMlKBbIpzTw+Y4epAiONoT5iOrUd?=
 =?us-ascii?Q?TyLsPYjC9Rg/m7DKZHiGyf0NsylkyhS5HG2rNTCFEQSzvL5D9YAhtPCuYKCj?=
 =?us-ascii?Q?VkbWI9WGeGmWcE4yQue/9Aalt2O56RMG3GW9BAlBaobTcm0HKDE8f3gfAQvF?=
 =?us-ascii?Q?9JjCT7S/hAj1/MitOr4GWLs4dflElYtLWDNjavawCsMyB2FqP91D7OBYRiyf?=
 =?us-ascii?Q?nvjOSnDRxnbO+ctB3O1NViuaSI2Ia9LjlCJtQBNEw7xOgq6lqvIZ71iWwx0I?=
 =?us-ascii?Q?ro2pcm47eTrOtHViXmtHuInWRj6BDOM4ZYrPu7j2c4NRjY1TdkevzDeWcrrX?=
 =?us-ascii?Q?3g6RPTDmatDVFF6+dlgkNkNEpCQRnU0zazXwx4DSsXScvVSH+i8aHyRMuFfb?=
 =?us-ascii?Q?gZ1X0mzRKVvztfSeVdBvrkA94VCisx56mnXvWSQG4EWCKJnkab1V/w4qgRkY?=
 =?us-ascii?Q?rwHkpPBL84ENgTg/+tIUCU1wNGRYw1B6jJ4z3c6ojEgqP5/NDXmdi5BxGvpl?=
 =?us-ascii?Q?yQgA+I9FboMyDD3A+2ve2a8QBfXGMHW9fUWmRbte53rNXzRr5AenFoEi9Zrz?=
 =?us-ascii?Q?Eqoq+rXIHvEsDWFXmNOBq0C+yMzYfth49BdHwy7PyvoCoxH7eCwJ8dEjfhn+?=
 =?us-ascii?Q?cvJZ52hYlR2KSW2ON2tyqDqLMDrBRCkBhNjU3fcPYJnL6NovYIOXkI2hv3LP?=
 =?us-ascii?Q?7lt4rg/ksnv/HlnVsOrKjc9b3BnqzJDXuLRGBvcKSdLTFFnFP2lzwjPuVOnp?=
 =?us-ascii?Q?iZoPnf9a/9GI6ElzYVFeqEqQPN+nfmJUM5AqzMzoSc1Ij6KuwB4CfLcQnHOc?=
 =?us-ascii?Q?Qk8oDHs4kbyFscbciBBY5o/qOhZ62Byz/CvEqC6lNzUJJnWYiKMV1mLpesoo?=
 =?us-ascii?Q?naQdEHwf6lmZeEY8fAsQ/+9zWUKWe2/XqV6mytmGns9t/qhxN907c5W8FeRY?=
 =?us-ascii?Q?dOPcspXUiU+AmVkV1FNfqf9WK2c8huepomXsQRqx9c7GCoOsl4FKZNA11xkj?=
 =?us-ascii?Q?jYhLHEeEn/+gqGv7oHgSk5c3MUqLSxFLMNNv4Q6HkL2mxSMNfR207U7NGkbi?=
 =?us-ascii?Q?q91pZFxpVOB8RDuGLqaPZGOxiomS+3ncKfS6Rk1HnVf67YUXfm/DDSBXTFQz?=
 =?us-ascii?Q?QY4gM/Qpt8ITXrcFG1I3j+YR0GbJRCYQeI45RLGDnz4YzyHeEyH7BTn7st4m?=
 =?us-ascii?Q?pXaIot+4fMmjKDZ/kmHsYGJQ84Wv6G6gLKm0mj09lsSvGmmIt/lXoaZuXagV?=
 =?us-ascii?Q?eZYpNaHiHfWwTxhO0n6oCj9vlka6DIwlBKCx5SXkXJazB+0HGCSqMrsGG5qf?=
 =?us-ascii?Q?5yp9RFAYlsVzWJ+6GJc1hO+RIlYwTjMw+ktTdWwMVSL11FNusBZ0gWAoqe4h?=
 =?us-ascii?Q?9YwdgTjguQISRJUtIRJUUCwVLTCbgu2ol9fMnUGW5Mxk4NBC8wb2F2Q7fzVy?=
 =?us-ascii?Q?QOKflnShb7lvhyAjBYEN6OkbEfq5Bm4+xUDBY/kQYqTfpQLiLQs5h38hdaoE?=
 =?us-ascii?Q?et/h65bX1NNiS9ogu0KnfzGmgzZZmZvJJb+psVj9VLt7qqjFWd99Nwkf9yFB?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8f57af-8261-44d4-c2ae-08dd6d80ddb6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 22:44:00.3197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8zBFNEAKMRWZ140slQGc6P/AsLNLKNX4b5+ykyTOSBDqAGUgM6NQyFLpUI5nBwiuPWhec5dQTjvpApF7mdokw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8112
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

On Fri, Mar 14, 2025 at 01:31:59PM +0530, Himal Prasad Ghimiray wrote:
> This function will be used in prefetch too, hence make it public.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c |  6 +++---
>  drivers/gpu/drm/xe/xe_svm.h | 13 +++++++++++++
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 516898e99b26..2d2b385b691e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -655,9 +655,9 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>  	return &tile->mem.vram;
>  }
>  
> -static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> -			     struct xe_svm_range *range,
> -			     const struct drm_gpusvm_ctx *ctx)

All public functions need kernel doc. Patch LGTM though.

Matt

> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +		      struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx)
>  {
>  	struct mm_struct *mm = vm->svm.gpusvm.mm;
>  	struct xe_vram_region *vr = tile_to_vr(tile);
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index e059590e5076..976059545173 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -72,6 +72,10 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
>  int xe_svm_bo_evict(struct xe_bo *bo);
>  
>  void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
> +
> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +		      struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx);
>  #else
>  static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
>  {
> @@ -124,6 +128,15 @@ static inline
>  void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
>  {
>  }
> +
> +static inline
> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +		      struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx)
> +{
> +	return 0;
> +}
> +
>  #endif
>  
>  /**
> -- 
> 2.34.1
> 
