Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA1ACAC5BD
	for <intel-xe@archiver.kernel.org>; Sat, 27 Sep 2025 22:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9274F10E1D1;
	Sat, 27 Sep 2025 22:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AqJ1RHIb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8999A10E1D1
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Sep 2025 22:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759012433; x=1790548433;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WXDmfeMz9pxQfnWS01Qg46vXAR3ifhyZv8LNT8l91BU=;
 b=AqJ1RHIbuqI5UpDO32lJNL1sv1GSUIx1Ow14l4ju9oOo6Gq2SRSRdHN1
 OBjeJoJGLoFvHEJRy8GeAvQ7xgZrR64AkyNXRAGt6dfwa1DCjhUdtrBP1
 ZQvfGVoBGw0swEGq81oi/3BtnytoDbVY1BfXg6f22lljloCIrmOux2NLI
 TqVCEnNqW/d7nnlCYrCZfYqB8fSpgrZ3SHddUbBATOeQ9RcZS96rIX3i7
 AT4WH89O1pU1eWb6AHTSKW1WgtayI82+in+7UVyo0TbgPhbWIwKTap+tt
 bDD+ytw2rv0lgTtvIxOr3lXI1f7yZLNjUB0Rkd10+AR2A6xTvmbziQ2qN g==;
X-CSE-ConnectionGUID: W2GwYGEnQMuu12RfmT4Fbg==
X-CSE-MsgGUID: wGQGT3ttR7Oh01NSIInyEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="61221782"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="61221782"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 15:33:52 -0700
X-CSE-ConnectionGUID: C4QcfGaBSRmPqYgPrtN0hg==
X-CSE-MsgGUID: m9GgpjmWS62L1wV+2lbsOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="178338976"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 15:33:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 15:33:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 27 Sep 2025 15:33:51 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 15:33:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+4NUo/JWUarvHwFU5LXY6VTc9U3G3QHGzf48W7erNHT51i/7rm4GiO5IsxJEqRvXU5zbnPLQfOjBP8NGC5nrvrcNs+LV9PVcZdyyiPaOje/eG47maCyo0JppTAKOuhtuzjCdk3j22SEyKGpaq29484tnh0yNZEa4cKUhI9Lyz8TzOECxQU55zZRY+a521rw0MYKoBqPWfObTM1CAFC+37XNGdavuvTEJYAoDca8pRtvxJI8rzvy0lwfLNrx5w78lk/p4f0aDdrWc/lt3PQ8ZGJERpkCGzOsMUNXc/lQ8JLyDUlFZ4TQhZP61Qinxpno1YaZ7ep8t0en5+yh3fNsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1U+FvRuNT6DbjavG4W5F8NUAUpxN+yzTJgHTxSOeZp0=;
 b=V8k2Vd/iaCAwqzTFswVW6ETwfEfZTNcWuCFpS6kDx4NKMK8NQ39wXMMx5vjBNytwKFNkAx4sLbGP1NJ2D8JtHbAcXifMwEQsfR/ykKh5OCZ6gwFRBbPi1kUzhXCkYLUoyhFnRNZeD6dP7PN2gVRe7hnSP0ZRvPwf+4hjqBvfADI8nacCUDcL9SgtYjt+mG6X3J+zH9DcsHtlb3cOFSolwzDbNfFk+ez/BxhTX7pFCnM4ZuLYXlTDwQnRorDAHYQlH+3MgC5gpAy3l3uKKTrVbU51UjP9xgM5psKaYqbSCJCW+oCyzPMb5BlDUfJ39P4opHvK5QYWElNwvymx6qD78Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sat, 27 Sep
 2025 22:33:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Sat, 27 Sep 2025
 22:33:44 +0000
Date: Sat, 27 Sep 2025 15:33:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 17/34] drm/xe/vf: Don't allow GT reset to be queued
 during VF post migration recovery
Message-ID: <aNhmRdp5FDbKHLM2@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-18-matthew.brost@intel.com>
 <e9246fdf-a0bb-4345-ac4c-59135181c6d6@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e9246fdf-a0bb-4345-ac4c-59135181c6d6@intel.com>
X-ClientProxiedBy: MW4PR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:303:16d::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df0929b-70f9-4baf-6dba-08ddfe15ea89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xtI7YscjTdWx2sRIoTssBla6VdeFz4VEhpwcoq2jOFp4AJT96GEfzJ3Qcm+5?=
 =?us-ascii?Q?xfPDTiRn1pXocRa6vpf1BK1LJ1ib2Uoxn0ECet37eLnzHhbwLWKkXOXbCydj?=
 =?us-ascii?Q?a+qWCfHchLOwciUBtop/8jj2CT5bTbeCVUj7aDlq/RWrjMdbUzMzv0hOVkp9?=
 =?us-ascii?Q?5yuOf0XIjk8QzzIsNxenF0/btxGdcMXiHfDe3ylIwMRMsmpECpWZDGsTv53/?=
 =?us-ascii?Q?bZPCrgKPoWosk+W8Lqiijnp97NiGjQWhVz3BPYXKlMJ0DxeM1guKruziFoyt?=
 =?us-ascii?Q?N4Y1T/tsgnGRa/W7moZ3qjcaFBxAggUXSP8g8WulH4NdYT1xlMDi82G9NbVG?=
 =?us-ascii?Q?5ZRaNe+sRcuTqdxhIRn2rasKMn8EnYLsWUrfJ/AINMTLZSNgBUuqOxPqBUSc?=
 =?us-ascii?Q?BIZtqHVA9aOUPWsc7s1pCR/J7LSTWdt3H6kN2nvf54YGCv4UsPALZf7M3iSH?=
 =?us-ascii?Q?i7hoiVEY+LkGn4WGlvjSIa01GbpXIQcD9JNJsIs5R/ooP9chnsUgIkvH+5eX?=
 =?us-ascii?Q?zw9mgPRkg96ZmfHu5lliCIvcPm7ogTHRdfOYj3mcP7WA74NNfMCLccmUYAzU?=
 =?us-ascii?Q?ZQTlybvGf0w3/RqC7pS//4YuHFSduC9kUd2QqP4AChZ8UdewvXKX4otbdPCd?=
 =?us-ascii?Q?VSYjE7vqYC1yCx3FDzUWwhWUjkZMincnCtwWxueIPeONJ9RsN0E+i+ZMa2vn?=
 =?us-ascii?Q?RjG0cU1j231YAzCWMeucFmgwhkWzLHRoDNotfUvf/dNB3SPO9cEOUeIFSrF1?=
 =?us-ascii?Q?zMKT1Zcdv5RwGuSvM3S/vYu9HhQUDIIEKBmR1sswoglkfrY2sa0NRb68rJXW?=
 =?us-ascii?Q?nbSVqrolfwth6tRsxSTVEjaoYgQddxdA5K4YD5WlhnpkcIcn4K5tzLt5CE+p?=
 =?us-ascii?Q?ICZa3PdRF11iJTuzop8i+8esY9uam4HxjKU+M/oruxXjtzYMpoaX3BrJje/q?=
 =?us-ascii?Q?oEvs5GUCB57txPbW+GWXwVFL+ze/HzhzJtcB7Y+9y1vo5RAnR2iW9p2JwD3h?=
 =?us-ascii?Q?PkLrkVqTONfmmyT6ZSVJ15TB56AbqxHRN85c2cXpp2AngmawN1rX4p/X5mio?=
 =?us-ascii?Q?7L9MwVsGOHLNJnp1zOeohJdtV60X7RlXIzLU9w64UpeoSnsGbwS/H4fzokRb?=
 =?us-ascii?Q?dswGh9BpfJxnh2FhhnGjM/WtGpz5A6ofp7BnppjA9JsJUg0hgvgfZ6xvNSBx?=
 =?us-ascii?Q?0fHpTcxI0YpOUw4kMQstkGBhUlmSKXl0jnepo9nMjEM2XpYX7OCk1aGli8XB?=
 =?us-ascii?Q?zNSXiKUxoQOGrW0q5YZCwx0U7wgYTSg9xGJj1AD/sWU8I51dmkAGU7W7fZIq?=
 =?us-ascii?Q?3a0KEvdih35bxjwaPOLuNGv72gkGm9DLqgIO6wJ0rYOalLtToZgM5rNHIUdf?=
 =?us-ascii?Q?Sx+0HKGrUf/zlGQoQi63sNxy58kpfW1E2TeDEA6O5ceJ9qZL+QD5xhB6A3rn?=
 =?us-ascii?Q?mYV0SEmThx/CbAfk8AWoF59VwItamM9Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X0PCCx0g4aF/2jFa2ZA+v1937gjSqmUHaXb/nTMh55M5OGT/1eB7FayHLorq?=
 =?us-ascii?Q?Ew9cdqmdjZNkfBrgj0ZkDZGa0IvnKDtJoyfcNAcdnEQzGmG4jhz0ORUT+Sr4?=
 =?us-ascii?Q?59TxgbOS2RyJ93aqEhTu1LLgKfEyofPPXkUqg71t70A3F8HIlp3eVvOdBk/m?=
 =?us-ascii?Q?c9MaO0ZDjpTG4qkzc1Ds0EqGzd2DYfisWbEBVpR44dK3gzFnL2UuIwTLTfBp?=
 =?us-ascii?Q?EYlS1FFK9rxV6kcqpNNIv39QWEaxMwevwUMp7ElN1exyuUg8/+Yy3kEoYYac?=
 =?us-ascii?Q?Lz9Lu0t4ShAa40fupxFD+x55CNy9ZBCZo+AhJDYCIiOdgx7r+2hrsRl4PVbv?=
 =?us-ascii?Q?4AOEkhRp9IE37/jXwH9GT6vI1WYSQkm+tldXbiz+TOtczn/eta+eL93tWS9Q?=
 =?us-ascii?Q?vT2dXrz9c28Y1bl4yTnLq6sbfT/pKbQUMCdcmKgzNkEHVAZn3cMB+TOB9aF1?=
 =?us-ascii?Q?RT1uNyvoCPypRgpnGxLmpiFcMWjnlwy5w45t3J5gMKqaWPuwpkOBngnuU1t5?=
 =?us-ascii?Q?Hm+dThQ2ByE90PgLDEzDz8T28rjHSX6Z4hnMzlBzec3mOcfh+LIDFMzg1JZh?=
 =?us-ascii?Q?fmy4osHKmsfTGnkRb2GLtd7XUEtdnZAaRN1cPCT/lJis8igFSPk4LWpZQ40v?=
 =?us-ascii?Q?k/hzdBOxG5yj0NG9uqdUg7HUcrRm4hDDht8oWKRneStaQhRHkWmCZQtH3xHf?=
 =?us-ascii?Q?mVi7eI+gXb1QJCaNmjowZfDcq+bUYuL/eJ2CM3tMcCFFtH2qnXPgT/i7Mqwu?=
 =?us-ascii?Q?96DAQg/rDU42oUmbLn2RJ2IxpsopAmiVRkf8nhmEQo5S5xdB4pNpu8Iov0Co?=
 =?us-ascii?Q?5+qXH3CbKEYY+zrwtPSQAVpAde5cR8fkXTY/3DR415DNh1Hy05MeL+5S6XgF?=
 =?us-ascii?Q?nKaAtWSkGOemc1EF0KpOFT61GocvZ+VmHcksBmwR/sahbKK8AbqUfLIBoK33?=
 =?us-ascii?Q?ByhPixtCqNiAdGmQTF9pcsRQurzd0KsvYbMgDOk6eJHARbYjW96r75rogK/t?=
 =?us-ascii?Q?M9D4Z6ORWU055/3jAEjUqvdpvjR53p9edXE1SWhvSfXWnganVO7OTxRPJ3Q1?=
 =?us-ascii?Q?4W9MeZL1bMeE17NXOxKZnj6lC8nmQqVO46Fzp9Wcej/F7Z4otQjTWW0aOVrD?=
 =?us-ascii?Q?q5loIKDdgwCPQBqA4/CnEVL522zkWuW7Vt5DDjRc0iS/02Hi5R6Fgfy87zEZ?=
 =?us-ascii?Q?vYTQKE6QLYa3/m8F+hspvz25qPiy050hJzFzApjQpSBcii13wfbYtUnDZzXa?=
 =?us-ascii?Q?Z2jbR7UUcrzvXouzIE76ZanBLjJk8pE9T/D44F2D0V+AfaT9OdpBnCgbqhdB?=
 =?us-ascii?Q?GQLfS/zzKJ90mBpgff/NnKgEWQr7J1g5UDrnhgwSqj8BXRgRDpVsDKVGzXGw?=
 =?us-ascii?Q?gu23nvaUK2bolVT+Q0MizG7+j7eelSGdww7735d/MLaHxsfX8RKeVfLdH95a?=
 =?us-ascii?Q?JMEYjQikTrme16fkbGp3HNw8NwllOPDvMgKxgzJIVLYpbGlKkKMeIpFiMRoF?=
 =?us-ascii?Q?DGCJLMMN2RWvWekUTRmbaqvDmVH/3eBLqi9/p6PxjkRl0GUV+tnyt66he8GI?=
 =?us-ascii?Q?MlgAk09uHrUH2V/ms15Dwt2VltUpK1iHO1xRJgfXhg3tAJxkvdUF2AXiP6H4?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df0929b-70f9-4baf-6dba-08ddfe15ea89
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 22:33:44.0352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJCeHtfyeC1BpBiqn9gB8bSe67Eq+CIN2IBfjOxWWpNMuvlrhRDMXVIS3mxZj2WKMachEsGzfGuRpDBL26QoTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
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

On Sat, Sep 27, 2025 at 04:59:26AM +0200, Lis, Tomasz wrote:
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > With well behaved software, this should never happen.
> 
> Not a very reassuring description.
> 
> But the patch doesn't really lead to ignoring that situation as that
> sentence suggests; there is a bailout from reset if VF recovery is in
> progress.
> 
> This will work fine (for migration, it's actually better as we don't need
> any reset of the new HW), and adds way less code. I'd just improve the
> description.
> 

Let me make the description a bit more verbose.

Matt

> -Tomasz
> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt.c          |  9 -------
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 -----
> >   drivers/gpu/drm/xe/xe_guc_submit.c  | 41 +++--------------------------
> >   drivers/gpu/drm/xe/xe_guc_submit.h  |  3 ---
> >   4 files changed, 4 insertions(+), 56 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 3e0ad7e5b5df..1a4796cd885b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -803,11 +803,6 @@ static int do_gt_restart(struct xe_gt *gt)
> >   	return 0;
> >   }
> > -static int gt_wait_reset_unblock(struct xe_gt *gt)
> > -{
> > -	return xe_guc_wait_reset_unblock(&gt->uc.guc);
> > -}
> > -
> >   static int gt_reset(struct xe_gt *gt)
> >   {
> >   	unsigned int fw_ref;
> > @@ -822,10 +817,6 @@ static int gt_reset(struct xe_gt *gt)
> >   	xe_gt_info(gt, "reset started\n");
> > -	err = gt_wait_reset_unblock(gt);
> > -	if (!err)
> > -		xe_gt_warn(gt, "reset block failed to get lifted");
> > -
> >   	xe_pm_runtime_get(gt_to_xe(gt));
> >   	if (xe_fault_inject_gt_reset()) {
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 4eaffad6ebcf..b8e02bba7360 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -1175,17 +1175,11 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
> >   static void vf_post_migration_shutdown(struct xe_gt *gt)
> >   {
> > -	int ret = 0;
> > -
> >   	spin_lock_irq(&gt->sriov.vf.migration.lock);
> >   	gt->sriov.vf.migration.recovery_queued = false;
> >   	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> >   	xe_guc_submit_pause(&gt->uc.guc);
> > -	ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> > -
> > -	if (ret)
> > -		xe_gt_sriov_info(gt, "migration recovery encountered ongoing reset\n");
> >   }
> >   static size_t post_migration_scratch_size(struct xe_device *xe)
> > @@ -1219,7 +1213,6 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
> >   	 */
> >   	xe_irq_resume(gt_to_xe(gt));
> > -	xe_guc_submit_reset_unblock(&gt->uc.guc);
> >   	xe_guc_submit_unpause(&gt->uc.guc);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index cd5e506527fe..b82976f031e5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -27,6 +27,7 @@
> >   #include "xe_gt.h"
> >   #include "xe_gt_clock.h"
> >   #include "xe_gt_printk.h"
> > +#include "xe_gt_sriov_vf.h"
> >   #include "xe_guc.h"
> >   #include "xe_guc_capture.h"
> >   #include "xe_guc_ct.h"
> > @@ -2182,47 +2183,13 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> >   	}
> >   }
> > -/**
> > - * xe_guc_submit_reset_block - Disallow reset calls on given GuC.
> > - * @guc: the &xe_guc struct instance
> > - */
> > -int xe_guc_submit_reset_block(struct xe_guc *guc)
> > -{
> > -	return atomic_fetch_or(1, &guc->submission_state.reset_blocked);
> > -}
> > -
> > -/**
> > - * xe_guc_submit_reset_unblock - Allow back reset calls on given GuC.
> > - * @guc: the &xe_guc struct instance
> > - */
> > -void xe_guc_submit_reset_unblock(struct xe_guc *guc)
> > -{
> > -	atomic_set_release(&guc->submission_state.reset_blocked, 0);
> > -	wake_up_all(&guc->ct.wq);
> > -}
> > -
> > -static int guc_submit_reset_is_blocked(struct xe_guc *guc)
> > -{
> > -	return atomic_read_acquire(&guc->submission_state.reset_blocked);
> > -}
> > -
> > -/* Maximum time of blocking reset */
> > -#define RESET_BLOCK_PERIOD_MAX (HZ * 5)
> > -
> > -/**
> > - * xe_guc_wait_reset_unblock - Wait until reset blocking flag is lifted, or timeout.
> > - * @guc: the &xe_guc struct instance
> > - */
> > -int xe_guc_wait_reset_unblock(struct xe_guc *guc)
> > -{
> > -	return wait_event_timeout(guc->ct.wq,
> > -				  !guc_submit_reset_is_blocked(guc), RESET_BLOCK_PERIOD_MAX);
> > -}
> > -
> >   int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> >   {
> >   	int ret;
> > +	if (WARN_ON_ONCE(xe_gt_sriov_vf_recovery_inprogress(guc_to_gt(guc))))
> > +		return 0;
> > +
> >   	if (!guc->submission_state.initialized)
> >   		return 0;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> > index 5b4a0a6fd818..f535fe3895e5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > @@ -22,9 +22,6 @@ void xe_guc_submit_stop(struct xe_guc *guc);
> >   int xe_guc_submit_start(struct xe_guc *guc);
> >   void xe_guc_submit_pause(struct xe_guc *guc);
> >   void xe_guc_submit_unpause(struct xe_guc *guc);
> > -int xe_guc_submit_reset_block(struct xe_guc *guc);
> > -void xe_guc_submit_reset_unblock(struct xe_guc *guc);
> > -int xe_guc_wait_reset_unblock(struct xe_guc *guc);
> >   void xe_guc_submit_wedge(struct xe_guc *guc);
> >   int xe_guc_read_stopped(struct xe_guc *guc);
