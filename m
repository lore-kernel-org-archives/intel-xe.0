Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CABC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4DE10E7DB;
	Wed, 25 Jun 2025 19:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N6XZ9mft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FAA10E7DB
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 19:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750879015; x=1782415015;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=08I2vGqzDGJsE4lp1QZNuBPiPPZ2k18ozuHIptCV5o4=;
 b=N6XZ9mft3vyXAduOq3Yn/9+oyrhjARW9ZB4H3x0IxWhW+KEDpYWQ6bRF
 23oZFjTCg2p2XaNtrFRMYigq1VH0Jvo5RVq3lgLQa7FFTZV79BxiCNJp5
 INsE9uJw0HzZtSg8mIEJ35v5E0j6WnNq0Ssr8dVUGW7MLqqkp/kk1OuYt
 c6HuKodaHNh0vhvNQDZ8QLWRb1vJMyLXs6YLFiIVj2whDNQcf+aC8JuR0
 1rMCzYjDQGz+daVRDwaMI3nOTBgAD5jc+ISvZEg/GUPzgO7zBRGHUP1Em
 aT//hd8KCMg7c5Z6hUgLN0fTb6Zd8XQ30ZEFQsd5u28JcLB9UtjkfMq9n g==;
X-CSE-ConnectionGUID: ODZwr7gJQNW9hHCsEa/s5w==
X-CSE-MsgGUID: YRh2Z+AbQKygt0IsEhQRjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56965632"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="56965632"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:16:55 -0700
X-CSE-ConnectionGUID: p+EpaO9pSiGoItvuqE6HWg==
X-CSE-MsgGUID: Df6fXtjLRhO3yTYOirRqag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="152482693"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:16:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:16:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 12:16:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.48)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:16:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfe7e0DOqgZu8chaJPqij84KfNrq4SucKgfZuf0ASPQaF2e8m52QyV2TzkOW1SD/DCZevzQsDna6R4VBHitVTDNAcdoAIGyN4Tbp6m1pkZzqAFom+eoOQs/+/rQYHhoSZUOArmZoXAQ5o1JHuTB6Bpdtw9ZReTwURV3NSQ5m0bhHIijDwZp/wATliw2BU1zlugNLluA1UIyMV9XJqXfUJiPdWOCtScQw2WGKeVzhVS9gNQjHsJP8Us0WPkNqY/k/PBO2rnP6/4ru0jCFZLaryg+VkzcJC/S+/JVG8o/YAwtd0SLLX27IpsLKdt8Nr+ig3aF9fyI8mMW1zF3jgBlexg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KQ0Ls+T6PYATen+zoefixgz6TkyiqmO6iE6Z012nnI=;
 b=ZxeIGv/vM0a+0+37nF43rWCC442mL9KPCjKTMMgSq2Vb4YJU4d9WF2WYMn+r09cEkbOD6gPG5PsbwlhcxWKTlvb7miR4/xzBdMbMhZRIBN0ov8zV1siXEbwn5+FEhpl9YD826zZiCVXJaNu9dgsJYC54ho7EeCAWtFdUVSOCcmo9h8zYG/00Z1saDtfVFMwDa6/8ttoyJ+g+KNqzzpYYjBJAdQLERJScaBik4nSMFJ6BTk+bVM8DjBEExDtnlqcvCndq4Q99RaKwwFAZs3swg+DTdVQPrHkLzgi1j0bNGqkPuWNzO+/b6v1PNUE+nbAto3p9bfDX5y61vcwJQtaHwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7398.namprd11.prod.outlook.com (2603:10b6:8:102::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 19:16:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 19:16:52 +0000
Date: Wed, 25 Jun 2025 14:16:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 09/11] drm/xe: Remove xe_uc_init_hwconfig()
Message-ID: <mi6s6ni2df5thsn6i2oxdkfgmw6h6biwfy7yd6bsegzzwdr6jc@va2eeipkkckd>
References: <20250619104858.418440-13-dev@lankhorst.se>
 <20250619104858.418440-22-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250619104858.418440-22-dev@lankhorst.se>
X-ClientProxiedBy: BY5PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: d72d19e9-4222-4d2f-196f-08ddb41cd724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FuckA1o8Uw3VJFDNYBxAi8zaIj+WiylmyAJ6QA072+ihkhRzzOCu3gczne0u?=
 =?us-ascii?Q?DH4UHsGxGIKMoP6XhXB3CYbZxtiVptu76q4jhaERB7++zDKZvbNn1VKOGSdq?=
 =?us-ascii?Q?pftyP4cEHJ53fjTFpZ61vIUbvbPKbkXK8EWierckMblgmgHwARjTdCHLfIgZ?=
 =?us-ascii?Q?3aY2S0LE3bArULOPpLUEItDTHzt/OCvhaIzKTGUVRmD0GLrkA1Woq4ZpKGlS?=
 =?us-ascii?Q?unt5HWmtD9MJK9P1Ck3OBFqkrPFsjr2SUyMHdhCNwL1vc7oePAJMORGPJkfo?=
 =?us-ascii?Q?52D6lsxN50uOxE7U0Y6TmONXOrmQjeXtQjaaWpunyHebZpaGFgN8jMmDbN7u?=
 =?us-ascii?Q?kL2g8VQoM2RuPx3gL6wqvIHFESOdTgAFmrI0sJs73/Gu72sm/EomX01YqYWy?=
 =?us-ascii?Q?aS7pT9OCRADBYg7DbLdbjraXR4+4fk5F/Wl3f2iwXfkKAzCSQENAKA5S2v7W?=
 =?us-ascii?Q?B33m/vAzbNT8MkfbwIKd2KXqEivUHxA9awM46gR2J1bgWqXdNNuBRVc9+u6x?=
 =?us-ascii?Q?qYBHHmx71p6+dV7xtTPCoQ6g+D9HhmF4hy9pkIcfYzoVTjGp+QM+53v7+n54?=
 =?us-ascii?Q?e8dDNcCiya7jvbWUTzQMugqzXO2n/5vnLVgftM9EPV5YweaDNRSwpp6x0HfW?=
 =?us-ascii?Q?N+5L6WEnKlzFsgRJAXzENqPKZXpMqOKbkpO3Ae4YFXQRObu+Jop4uUrSKR57?=
 =?us-ascii?Q?B21HDpkwUJc/gfsxK4SY0Hs2DtH+3C2tVp8UrRT2loT9ktCX/ZKFPVu/8yBK?=
 =?us-ascii?Q?OP7GP1IzueI50+QrAi2zYGBSJJJAsH70S4WaipT8wOh1FnQE6gieTLH8B6BH?=
 =?us-ascii?Q?GD3ljRBV+wOTQgXY4xBQx4/NvmU9bwmbU9zeq1xSy/QFtrQKwLEihb0TaWom?=
 =?us-ascii?Q?uKYIjxHY9lXGoiNY8yFum+QJr/JFAolUWmiWWk2uo7eIMPIA5yGAnLMi2zVS?=
 =?us-ascii?Q?2nlIUolqrBvVUQ6K2zxL0QJvHFOoJKonFiN/YpGy7ImcuKINz+J49X4F5zN/?=
 =?us-ascii?Q?nKTF3Cp2fGeHwdW9WFaxmI3peCH6unhcclxLSfqqDQbAmlUL1g+JWtWGfBjq?=
 =?us-ascii?Q?s1InyYSMrMDGi8YNy+6+1uyjHWBrLD07Ar/pZdDU+i59W/SubgxaIi3IhBUL?=
 =?us-ascii?Q?Sv2WOdrMOPV62aLw8ms7DlJmTy4nL+S//K5IdDG4bm/egaHTEWJ4b1k9L0qJ?=
 =?us-ascii?Q?WD537KZFpCElk6ZnVRF2VTd3LChT6//+lslbrcurpoYzP+XVxuM1X6iJNtzl?=
 =?us-ascii?Q?H9HFlFxVDzOdw0iPdVJc8Dgp+KoxKKQ5kCI2CcSPGQQ0PhEU/gQ9nU4qHP/U?=
 =?us-ascii?Q?VE4H7tFg6geW0q2Sbm/CXxg19XMaZ8qHW7v7Fe9+4SU/hUITZ0if7I9w9yj3?=
 =?us-ascii?Q?NBhDbKbyUCj2Ppx33ixoVxKGNj8XbJpRg+Wpyt6eG3BGidSgiRSVlvZoMv41?=
 =?us-ascii?Q?PDuQ94S7VUk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9GHK4UxzDPhOiRWIOP9M6OFhOgtThB72+u4tM/D0yd/ukyqFWH1pz4KFqUhY?=
 =?us-ascii?Q?JVVUkimpz7AsXepmRSniC21tqYB4P1qfj0hCDkiInAtnk8iJ08/3KhlGNq+2?=
 =?us-ascii?Q?JBlBou+l73kcDy8ecABnJSLyykp4fc/pG6TUqCXGqJK6CF7p6863wLG40Ohg?=
 =?us-ascii?Q?nAqiDDyLXjD4HjVZDzjudwR594ZCP3MBbs2wSOn3V7J32iUY3jNQluvM5Vht?=
 =?us-ascii?Q?tJtiDNdGUjWPgltrwHp2za61byAD0gGBFEHAf3loiSShQFOO1Dviwhl4Y6RM?=
 =?us-ascii?Q?ukoLY7kKWcyIcTbqHadUoaTqxTAvtAf36Lvcr3yD9SJemmLsuzpv5CK1qdjY?=
 =?us-ascii?Q?fmvCuDgeMCX2b08i1DvNxe2I2P18dkm4gKalRu9NGzb9yafr16VoZ0hfvgQ/?=
 =?us-ascii?Q?+ymSKtJEIGPq2u3kPY+U+4em+Jz863SPp0JVmUskPmqk5d4+G+3vHwhVG4JR?=
 =?us-ascii?Q?wc046CdbBS8fqUANg2aeVP0Sb/QztuzqAIkoJVYFHACQzCLmDq/s5NLeRUWk?=
 =?us-ascii?Q?JSxU1O/GW4K81uEfLYVY+KJ7NjuGFCN69o1EX+zDDtit/cSnqbICkQqEphFc?=
 =?us-ascii?Q?v3uuoyLet3rBgxf1JAFyddilq40eQwRUtPQv1mdMZQjzd9wzcYCb5Mui33o2?=
 =?us-ascii?Q?K4+5bKWNTJTFWp3EQJJoVIGcqs42T9T+N6PoSdEMb97Q7iHqX+tMPZ4UMI5C?=
 =?us-ascii?Q?ne2IacsOUpAn0JW09FwwJaeP/iPjtYnuD2SgzSFwU6/X6bTxEErpgYaDTANM?=
 =?us-ascii?Q?3hIWmyfovH7LMEu1hG/UXBnLDvsa5AvrQhWOSnTNJ5V4sYMrOPx6l1uG7mGq?=
 =?us-ascii?Q?WLf8PiwB5Zq0uxBVsdWyx5vGsYYQAv6GXpeBvATN82RV9OSuM9vkhYUrvrIm?=
 =?us-ascii?Q?VwWvPCETe0BBtdi1uh64vnFiW/tW9iWtUz6Al6tYhujEz0o9R/5opB29ZsZs?=
 =?us-ascii?Q?M+yQymHDmOCZx0lVCXZ+O3jHSn7dCUxXP/RMVYASqQ4ci10/AyC7e1vYJJeI?=
 =?us-ascii?Q?6iCbuCPhtG3evmjkZeA5v47fOveFENcum7G+HHViTaym7j88dsjm4OtuI3OK?=
 =?us-ascii?Q?nSQaVHVKhLL9zwSemZljqsEPpsXe9plArMAj/n8OFgfoUiBa42xAJaH97YON?=
 =?us-ascii?Q?g0bo/FAYzAeEhkQwNy0tJHf0qwUsKGTVpYrUZRmNt34J834Ycl7Wc3EDHQz9?=
 =?us-ascii?Q?Qlhwcwn//rPrr1QU2eTVznxyPiLyFAkOVbtss+gn4BZ7NMEX7p+qbXhUonc8?=
 =?us-ascii?Q?eNe18odTW/uCgnlBo686hLTawHTuIa1wCHYpVwLVJdu9FrNEusD56BAg6dvm?=
 =?us-ascii?Q?UXA/tQXn2bc7yRu8sciYjPZ+/skEGRxzmrHBKn8BBqmLsnYY+qQssvi56YDI?=
 =?us-ascii?Q?j0MAdyXGpoESks1m5oKVXkPeQQGsdtXJFFL+9Hc3ZnrMXdE4lEUYSg6hRKLH?=
 =?us-ascii?Q?qhLhlCe2sXINzRk3/FHx9FN2X8TQMIsoNLMTGR4nNIauqikfG8PoYkw6Q8D0?=
 =?us-ascii?Q?ETosYyVWgiBii66jdST82CxXWH2XEPsyO4u1+NCCO8LSH1ft0383DhcVlvCn?=
 =?us-ascii?Q?0gigXT/eqqNBgWFNwFa7hGNX18d1Mxup9bCuAqMlDq7aHPjIesYsq5oumMhU?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d72d19e9-4222-4d2f-196f-08ddb41cd724
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 19:16:52.0195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03+wA/C+KVDkPr0XgaXungpEElkYRtb3gogfP9jaD/aVL66ksbIHjbSIppD71BcR+zEGtA0Xcl4Qdi8XKlPxwb/LDtvXeTrwQTA3ELxYLqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7398
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

On Thu, Jun 19, 2025 at 12:49:08PM +0200, Maarten Lankhorst wrote:
>This function is called immediately after xe_uc_init(), so just put it
>there instead.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt.c |  4 ----
> drivers/gpu/drm/xe/xe_uc.c | 31 ++++++-------------------------
> drivers/gpu/drm/xe/xe_uc.h |  1 -
> 3 files changed, 6 insertions(+), 30 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 3942f1ac253e7..14761849390d8 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -466,10 +466,6 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
> 	if (err)
> 		goto err_force_wake;
>
>-	err = xe_uc_init_hwconfig(&gt->uc);
>-	if (err)
>-		goto err_force_wake;
>-
> 	xe_gt_topology_init(gt);
> 	xe_gt_mcr_init(gt);
> 	xe_gt_enable_host_l2_vram(gt);
>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>index 0e9ea57fcc88c..8f56a5ef41e24 100644
>--- a/drivers/gpu/drm/xe/xe_uc.c
>+++ b/drivers/gpu/drm/xe/xe_uc.c
>@@ -72,15 +72,17 @@ int xe_uc_init(struct xe_uc *uc)
> 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> 		return 0;
>
>-	if (IS_SRIOV_VF(uc_to_xe(uc)))
>-		return 0;
>+	if (!IS_SRIOV_VF(uc_to_xe(uc))) {
>+		ret = xe_wopcm_init(&uc->wopcm);
>+		if (ret)
>+			goto err;
>+	}
>
>-	ret = xe_wopcm_init(&uc->wopcm);
>+	ret = xe_guc_min_load_for_hwconfig(&uc->guc);
> 	if (ret)
> 		goto err;
>
> 	return 0;
>-
> err:
> 	xe_gt_err(uc_to_gt(uc), "Failed to initialize uC (%pe)\n", ERR_PTR(ret));
> 	return ret;
>@@ -142,27 +144,6 @@ int xe_uc_sanitize_reset(struct xe_uc *uc)
> 	return uc_reset(uc);
> }
>
>-/**
>- * xe_uc_init_hwconfig - minimally init Uc, read and parse hwconfig
>- * @uc: The UC object
>- *
>- * Return: 0 on success, negative error code on error.
>- */
>-int xe_uc_init_hwconfig(struct xe_uc *uc)
>-{
>-	int ret;
>-
>-	/* GuC submission not enabled, nothing to do */
>-	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>-		return 0;
>-
>-	ret = xe_guc_min_load_for_hwconfig(&uc->guc);
>-	if (ret)
>-		return ret;
>-
>-	return 0;
>-}
>-
> static int vf_uc_init_hw(struct xe_uc *uc)
> {
> 	int err;
>diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>index b573b7731f62e..c13d705fe02c4 100644
>--- a/drivers/gpu/drm/xe/xe_uc.h
>+++ b/drivers/gpu/drm/xe/xe_uc.h
>@@ -10,7 +10,6 @@ struct xe_uc;
>
> int xe_uc_init_noalloc(struct xe_uc *uc);
> int xe_uc_init(struct xe_uc *uc);
>-int xe_uc_init_hwconfig(struct xe_uc *uc);
> int xe_uc_init_post_hwconfig(struct xe_uc *uc);
> int xe_uc_init_hw(struct xe_uc *uc);
> int xe_uc_fini_hw(struct xe_uc *uc);
>-- 
>2.45.2
>
