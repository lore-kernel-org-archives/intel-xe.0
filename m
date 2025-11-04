Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FD5CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 15:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D4F10E27D;
	Tue,  4 Nov 2025 15:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpYTQ3lF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A0C10E27D
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 15:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762271705; x=1793807705;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C3JpHfwrb2tVjCFz9/7kmolAyMff0JhMLBQEuM0Qe54=;
 b=GpYTQ3lFtR8vEFeWzLFPx8In5c2MQGD1OBrUQFh5ln46kGU1WD0R9fxQ
 AWABhbG+erwI9/QzlYqOSJFZLWeimuGECwD1/CRYLDfMe9nT2nYYGzlm4
 P2z65UPl/31D9/SZDaV00bsR6XlMO4GD12VKP59Yyi5XF1MCT9A6Y616G
 DYKfoXvP3/adBK4tNOvYqfH1hdWEm4yp13g120gizjbWaORHcI6sSzM6J
 gHb4wPudnspQFPh58LlJwofmXhJ9CXvbgAGs/TLqnGMaGy/EYihG5gwNU
 kGLpLwiAFKNxk1UBzRHIA3aRlHL3bUKhBNPcfDwv/XMDD1TX9oYWSgDHd A==;
X-CSE-ConnectionGUID: A5hSm3LhQLKDdn6dz7lSDA==
X-CSE-MsgGUID: G9CzBOn3SW6GlQQ8hTtPBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68024806"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="68024806"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 07:55:04 -0800
X-CSE-ConnectionGUID: vgdmOuPvQ6mNfM0OTPUsuA==
X-CSE-MsgGUID: Ej1eT6d9SNaqMeHT5MHv5Q==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 07:55:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 07:55:02 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 07:55:02 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 07:55:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jf52JNQnRg0LoQRD9bU0EzNuqT6VcN8EGyqyBXO3tdV+ETD7SYJJsPooIwPseXAL86RAe2qN082zbHDBY3WOXJt0V+UfWTZkd9vwZ7teL80ajanbDuw1eWzrwVYyMPI8zORk+TE+YCZ2dq/TbK7MEiuuhQxZsbH6cgaUaWPw4r51/L2G2LkCkgMzF34N1WZZJwgfDNbegWNXgEDxJ+ZAa0yrAvk6a/hFnTrZhJXipnH0bf97HtDVjIiiBaYAhTkMmUEF6S++NEEAENOm0e6kb3NcYXRldi94eBq/Cb8H0s4+nRKhHZXRIAR0GO4CEVOV0zEIga50Qf2HywTInqEM6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fh7hIgJpPW9RUmQIeXRcYRhW+xbGJXaXZ1dd86YFugI=;
 b=OxvgovA3PK3jPzXY/Dh7uP4Uk04F9cL6ZJCxsn1mbbYe0X9Nrs16338E6eqpwuNu0p4jpUt3zAONc4WscEfkYWcrbUzuVi9+/G5fVfG7kqmwxcXF0+bpR4WpTOO/zvVK23ogIBAIqcM4lCoXjkZ1hmLGLVnb7lCbCodTL8k6jpm8VaqSDDSQVxbLjUun/c6F47RyCHa9rsndsDvUCPcScTHVTZsYq2emV5BW9PQDR96+38WicW2OUawzoCDGOcMVpfTxDA+5MkmgQPT+ZcABUq6U0Y+Mg7+O9Q4dTuiEMnpVh9MdQ7Z/SRRw3EiPi2cYs4HJeF6uD78YHrTDGQMusA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8198.namprd11.prod.outlook.com (2603:10b6:208:453::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 15:55:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 15:55:00 +0000
Date: Tue, 4 Nov 2025 07:54:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <michal.mrozek@intel.com>
Subject: Re: [PATCH v4 2/3] drm/xe: add xe_migrate_resolve wrapper and
 is_vram_resolve support
Message-ID: <aQoh0R8rER6DuVct@lstrano-desk.jf.intel.com>
References: <20251104105305.2100460-1-nitin.r.gote@intel.com>
 <20251104105305.2100460-3-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251104105305.2100460-3-nitin.r.gote@intel.com>
X-ClientProxiedBy: MW4PR04CA0322.namprd04.prod.outlook.com
 (2603:10b6:303:82::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d55c8bb-b347-4e1b-eb3b-08de1bba82a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QC4G34CtQMo4XVqfh1SE8IdnfQmF2GjJC1eYXPBg+Ry09ceYcrwUdgfQ12YX?=
 =?us-ascii?Q?cYCJCsZoKxLn3TxcygiRMqA6I6sjIdXoG8oip4/xX9wHpF34JJsFEuoHlcM/?=
 =?us-ascii?Q?XabC9PAYfWYOlITVj8zOIbf9xke6VW+7JDC1HRiTUMwLgIgJeBp9KGsy26x8?=
 =?us-ascii?Q?vlGbySXQJZ85Of+CacjUxnFKjwi+c2ahQQk2MO1oWN2zSMBIKG7o2CLgyJ4t?=
 =?us-ascii?Q?zlNcEskQpztfAAQa2Gr8hoVh/PAAoeXyMjF3fsL0/18+exRFEj0f1ZRoEROG?=
 =?us-ascii?Q?BFaXoLBME+mTfXG6bLe0JmQyPjsT+8o2kctGnyzqz1nW+Y9y+y99+Lc5V3OP?=
 =?us-ascii?Q?hc+wR44hgFlAnuQvGnx0qFq/8faaErG4xvfx8leRzOqlmSX22EhivSgyq9Rz?=
 =?us-ascii?Q?RlL0uXKtGgnDN05Gf5Sz6fedb/He0/DMRmeSB9nUjvpXvP+w2fqf9bbqGCsN?=
 =?us-ascii?Q?9fu7C0HuBBTpdWq4UWyY4VdhphmL49ADpqKRqEniDeZ1a6EUF6GczcVr2rFR?=
 =?us-ascii?Q?jBWwuAjrTpNfIOT/pplNH9H3VZUgnfqTfZNWoKQiMIab+Wyuq44Xm6BePftE?=
 =?us-ascii?Q?+uM99aE3ohOxCwDEVD2qei+PTtZLys15+3EI3d/Qc65q8eKJWzg6sjiIGOad?=
 =?us-ascii?Q?S3MObyGZp2R7iC6oZaM09VWOo68XxRqJx5UY58jIq5fcOSjUkVVMONfzrVSm?=
 =?us-ascii?Q?DGkDQungp1fwvWcvvBYpg4jkyz4x7kQchMGd5JPiHueSMruGGXND62oOoPvB?=
 =?us-ascii?Q?jJk9z4vB73I0BdJWklaA3lY089i2w3mgoMtfqmJQSsf/XZCHmJKpL4KBcPK7?=
 =?us-ascii?Q?E6twTTmtHeHQ8am/evUV7vcWRrCcuVEpdHnPgjfZdYB1xK0JEGIY+OVQ0LOO?=
 =?us-ascii?Q?IwZL3ahQzlDcZtDs57fko/ilqCk1of7klAVRGrQv4SjGgwS96ZbjwLTeRBka?=
 =?us-ascii?Q?9vj5xWsAMEFwy3mn4kFegCX6B/oY6v4TlQDI31QaSp8QPpCSfmyUZhltQJ+F?=
 =?us-ascii?Q?gjeh5A/WNVLq47ph6t3iR7HoIhZT21K7zj6rFiWPH/RnXaEa74MNJSkVcCkM?=
 =?us-ascii?Q?T91aRMMeIiVC3yvF3/zHyALFCUdPsYD/XoZNCRy0uvzi9M2yNQ02Rc3tLmuV?=
 =?us-ascii?Q?1Fi8N8EjI+ONYV7DWBQyo1+NCD96hZCRCIFXJ/zhgjBaNtTlGwAUWXhXhOdt?=
 =?us-ascii?Q?2wT7veQDVKKZgsSvMzihexcfr0hHAsYIlruPP5BhjqWaLbwHV0UuEdxoOsLI?=
 =?us-ascii?Q?89A7GTFhO4tkdBgduNMgnKcvKt5Hraw0acJRUwA1vz+4FM7P4+gYrpgZV9mA?=
 =?us-ascii?Q?ybZg10+jJhx8101Zp80VGoeNZCtOQRgr3u72WLITMbkk2SsMdobqlgkio2nm?=
 =?us-ascii?Q?Ke8t42RqFrdM/KR4bxrs2ZwfzgfiGpn5ILT0k+nTdZO6QvaE5j4KwHU/gka5?=
 =?us-ascii?Q?0rZkvIAxD5BuiKeuZBiualgA+vphHx6i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZQH3rqdq01ITKHnS6QbjRgghtNKSL9sEAoM5gBZReTbW9v44h8FTVbqwIP/y?=
 =?us-ascii?Q?yHldlA1+7N++OdBR4Z9AXFc1VyitMy1PJQmWYKLo0lZVoHGGriznwTZCs0kd?=
 =?us-ascii?Q?KmOkr1TNqBmo7DeEWkc9rK24b8CwJ2RsDgpQ2QCSXrzTRcGBwQxyIjQHzIFd?=
 =?us-ascii?Q?m5ypKnlgOndVlXn5RmG7BLoXLcnYd8qetuAmnnMjl5NThH+55jZdzDXGA6J+?=
 =?us-ascii?Q?ndLf3ocN60nHcOlPWkpPw56f5SQb/e4vBO9sIurg4/6CQ8hr4ybjCyAusKCy?=
 =?us-ascii?Q?Whr2LVPP57v86ArDcEBuVE9JgZlqPROzYeXybMmqXbRfy9rlXW10U54J/UPa?=
 =?us-ascii?Q?ZnGxFbnPSm1RGg6PbDDxZqyjmxc0GRiFQyU0DVLPT4G/s0O6buHB3b11qNuT?=
 =?us-ascii?Q?xLN8OhtCi5JQo2WrkU+nWdy9fyUHq9oQmLKJi0XsnKRxHeIICid7dQrfea+7?=
 =?us-ascii?Q?i/FjMpx16TuJdY164CQxmTedwJtl//GAL4dunWgDi2xBsNpbaRR1JPOQxsUl?=
 =?us-ascii?Q?AvCaw7vxas1hn9aQeGboR9J7JARom65M+4ZpsU5wxIfARF9aiTnCZMutkwh0?=
 =?us-ascii?Q?8qHwzyZIBqOFAKYx8zDIb4gOz0wpDeCTzaml/86Be577vwYYGCQmPcxpfX1V?=
 =?us-ascii?Q?6COyMLGTpIKPdPov8MDTn9dSn5qdH/JjjKZbAneUy46MSZ6Kqg6LdfdOqKxa?=
 =?us-ascii?Q?XoLHal1NBiXoQAdS/9WnAM5P4KLKylHr/7VwnR1cTxoCiR25pd66bdfn8jiv?=
 =?us-ascii?Q?1OEUyKPmTCYJFTtHhJxadkefusp1D8iIIFU2rdPEkS9CJqxyUHUXO5MI27Vr?=
 =?us-ascii?Q?pjSZRa2FnNG0LyrdV3UXOnhZAwsJhT3bgCcq8tlLoE+A9+hjNCZnfdjstPQL?=
 =?us-ascii?Q?LGyEwMx6m2Myn7XUR7xhYto9/GEWZcXVMqsuX1m8+7tpGdcwt/cXG5rWAasp?=
 =?us-ascii?Q?RyWY4cHZ3bUZPCn3Thz5FJPoy31+OyWX+iRt62zqSV14AGQWlTK8XPVgoini?=
 =?us-ascii?Q?sUiCdUVRFIE1nAXWhE6X8AngThrcw2nBX2bcVdNGsGL8aJju77u4cprs82R5?=
 =?us-ascii?Q?MqjUYiKFKvyA9yKObmQ0j6sYFZ1RuoXRM4zK6tTyAtHSt+3f/v2leroUEjJ9?=
 =?us-ascii?Q?JCq1hd0gL1QyflTiuTwyiczdE1U0nf7dlTjmg0b3PTdm7cO0XpMudyo1LjTU?=
 =?us-ascii?Q?b5Hcj9FGkeiFH0P/5fGi7Me3WeutasHPgpX+Y0tEZdDVbTYP5q02kcwU7HMw?=
 =?us-ascii?Q?qgwxlsSJ0Ff2J2H6/Kkk6MH7YBBw/T5k7kNBzz1V3aebQV3Y40ZcX5+0DzkX?=
 =?us-ascii?Q?q7xM9y1Prr3xaC+o8wRBQZMaQOgcm0FETW5TKRLYDdZ+3l7DCX6arAcpm61l?=
 =?us-ascii?Q?/EXjRmxapi1ARWWEl2lSHRy2IWK2bMP4wB16eOqPYBFFmoH6fU9XoLZe5LGs?=
 =?us-ascii?Q?+Sfbl/Ill6fAtBBgUfUQ3M2XVpLBKdMLjifzzZrGhoFZ+NqrKWD34ATQ9/6L?=
 =?us-ascii?Q?pR4stoaQ1kN2GXzKjYzVd9I3N1JsNxBuWhEm6XPSme6Ef5+dVDeNyF6bgCyO?=
 =?us-ascii?Q?jLYgr9xBGDEPFdeUVpJMec9TNw9V2BBSHQXbCWRKbpaBDoy2OgZj2muCVn9w?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d55c8bb-b347-4e1b-eb3b-08de1bba82a0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 15:55:00.4747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nq78ioEo5A9vSTbIckosEaxPQ7Vh6sv11g+liwxuXOrhVIpK2JJSAaMIrPJCqJNhjBxBrn5LzoS3cTyTedXyGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8198
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

On Tue, Nov 04, 2025 at 04:23:04PM +0530, Nitin Gote wrote:
> Introduce an internal __xe_migrate_copy(..., is_vram_resolve) path and
> expose a small wrapper xe_migrate_resolve() that calls it with
> is_vram_resolve=true.
> 
> For resolve/decompression operations we must ensure the copy code uses
> the compression PAT index when appropriate; this change centralizes that
> behavior and allows callers to schedule a resolve (decompress) operation
> via the migrate API.
> 
> v2: (Matt)
>   - Simplify xe_migrate_resolve(), use single BO/resource;
>     remove copy_only_ccs argument as it's always false.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 83 ++++++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_migrate.h |  4 ++
>  2 files changed, 60 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 56a5804726e9..1c0971671534 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -832,31 +832,13 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>  	return flush_flags;
>  }
>  
> -/**
> - * xe_migrate_copy() - Copy content of TTM resources.
> - * @m: The migration context.
> - * @src_bo: The buffer object @src is currently bound to.
> - * @dst_bo: If copying between resources created for the same bo, set this to
> - * the same value as @src_bo. If copying between buffer objects, set it to
> - * the buffer object @dst is currently bound to.
> - * @src: The source TTM resource.
> - * @dst: The dst TTM resource.
> - * @copy_only_ccs: If true copy only CCS metadata
> - *
> - * Copies the contents of @src to @dst: On flat CCS devices,
> - * the CCS metadata is copied as well if needed, or if not present,
> - * the CCS metadata of @dst is cleared for security reasons.
> - *
> - * Return: Pointer to a dma_fence representing the last copy batch, or
> - * an error pointer on failure. If there is a failure, any copy operation
> - * started by the function call has been synced.
> - */
> -struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> -				  struct xe_bo *src_bo,
> -				  struct xe_bo *dst_bo,
> -				  struct ttm_resource *src,
> -				  struct ttm_resource *dst,
> -				  bool copy_only_ccs)
> +static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
> +					   struct xe_bo *src_bo,
> +					   struct xe_bo *dst_bo,
> +					   struct ttm_resource *src,
> +					   struct ttm_resource *dst,
> +					   bool copy_only_ccs,
> +					   bool is_vram_resolve)
>  {
>  	struct xe_gt *gt = m->tile->primary_gt;
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -877,8 +859,15 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
>  		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
>  	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> -	bool use_comp_pat = type_device && xe_device_has_flat_ccs(xe) &&
> -		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
> +
> +	/*
> +	 * For decompression operation, always use the compression PAT index.
> +	 * Otherwise, only use the compression PAT index for device memory
> +	 * when copying from VRAM to system memory.
> +	 */
> +	bool use_comp_pat = is_vram_resolve || (type_device &&
> +			    xe_device_has_flat_ccs(xe) &&
> +			    GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram);
>  
>  	/* Copying CCS between two different BOs is not supported yet. */
>  	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
> @@ -1037,6 +1026,46 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  	return fence;
>  }
>  
> +/**
> + * xe_migrate_copy() - Copy content of TTM resources.
> + * @m: The migration context.
> + * @src_bo: The buffer object @src is currently bound to.
> + * @dst_bo: If copying between resources created for the same bo, set this to
> + * the same value as @src_bo. If copying between buffer objects, set it to
> + * the buffer object @dst is currently bound to.
> + * @src: The source TTM resource.
> + * @dst: The dst TTM resource.
> + * @copy_only_ccs: If true copy only CCS metadata
> + *
> + * Copies the contents of @src to @dst: On flat CCS devices,
> + * the CCS metadata is copied as well if needed, or if not present,
> + * the CCS metadata of @dst is cleared for security reasons.
> + *
> + * Return: Pointer to a dma_fence representing the last copy batch, or
> + * an error pointer on failure. If there is a failure, any copy operation
> + * started by the function call has been synced.
> + */
> +struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> +				  struct xe_bo *src_bo,
> +				  struct xe_bo *dst_bo,
> +				  struct ttm_resource *src,
> +				  struct ttm_resource *dst,
> +				  bool copy_only_ccs)
> +{
> +	return __xe_migrate_copy(m, src_bo, dst_bo, src, dst, copy_only_ccs, false);
> +}
> +
> +/**
> + * xe_migrate_resolve() - Resolve and decompress a buffer object if required.
> + * This wrapper forwards to __xe_migrate_copy() with is_vram_resolve=true.
> + */
> +struct dma_fence *xe_migrate_resolve(struct xe_migrate *m,
> +				     struct xe_bo *bo,
> +				     struct ttm_resource *res)
> +{
> +	return __xe_migrate_copy(m, bo, bo, res, res, false, true);
> +}
> +
>  /**
>   * xe_migrate_lrc() - Get the LRC from migrate context.
>   * @migrate: Migrate context.
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 4fad324b6253..302180c9e38b 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -125,6 +125,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				  struct ttm_resource *dst,
>  				  bool copy_only_ccs);
>  
> +struct dma_fence *xe_migrate_resolve(struct xe_migrate *m,
> +				     struct xe_bo *bo,
> +				     struct ttm_resource *res);
> +
>  int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  			   struct xe_bo *src_bo,
>  			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
> -- 
> 2.25.1
> 
