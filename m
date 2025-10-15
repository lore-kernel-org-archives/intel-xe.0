Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2481CCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F3C10E0DA;
	Wed, 15 Oct 2025 22:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igTDfC+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FCE10E0DA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760568330; x=1792104330;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4XodqMkhWHfoCjh2GMtClkxSChcVr64llO4yCyrVcGk=;
 b=igTDfC+c+o7IQOWCBJLwfuqwpiFeqg73+aBfzTh9xOr2D2FCFo5Lz1tE
 Bbs4n8FH+/TYCyG43mVwWcK603gs0i1mfqKmBhovWbtzS2J88OqWxQNo+
 AdIui9IlJ2dSu9QMsx7Llr0zDjScC7O0hPloUBs0xbbc/xLIQ6C/vP4q7
 ty652e7o+pwEYdlasJtlr0cg2IQcdFtOLR4jwHii3C5Jx0wYR0gmiBvux
 cgOnGwuao98bvbZl52k5fdiLAToY7z9cBal2Jv3DH1vul0KJMfLBszUYL
 t0qXG7pEj8Fxbxgwi1URaIrWwnqeOJPCRxnVmCxceykLmnGtMGiZn34qf g==;
X-CSE-ConnectionGUID: Taoup5t3RBWvxyD0GoGiHw==
X-CSE-MsgGUID: JZWUb8m0QCiwG9oIRz3JKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62664471"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62664471"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:44:57 -0700
X-CSE-ConnectionGUID: 9/YnWsQ1R32LZtziZ0QzNw==
X-CSE-MsgGUID: K0xxOOF4SmOB5cFHDVymwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182758123"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:44:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 15:44:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 15:44:54 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 15:44:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFCe5nYNcWnjWLq6PMLEfupTCgR7RjbJ/G/JGM8vGpnoOQea3gWQqm045ex/mD0RJub+fHcIFZzlRE4eGw5picd9/3KuwYYz94X/BJGKdjP3NIrslBsDUnpnUve30LjqaHOo3IfHCMzy9MQSmYC/RdAJVQU5ZckYDRRWikimJC8a78a8TdPmXycnO+hYAMuaxXdhkY0d05HZVCCwBkfv4MQ+XvChYxnpvwQCaZnQD+ZCAvzV6LMy4RfucIr80X88XjADZK83O+cjiArJfs3tFkLbYzX8WbpUPTQYAVGoowceMVtqVu4vOi7YeF5M2YfwyLzhOAX8IQn6f52S/fdwBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irgIDGf8m6HFN4s37ZqmNawgWkcvPpBVXwmxQXzekT4=;
 b=iPCllT7DYJ9f4GwsHwVtx0yqIv03FEpYm6dTp+E1VQ5kcCUb85PYNxGP2baFBLGll6RF85fIUrP7HDdEsCMUp3O/C/HZEn4ayWKSDJ++Wdn0ov5gxRf/EOTXcArPhsOtfAp/9VxloRBMBBxAPKuyJBvGxDuaaRLNfv7SiHxnw5R11fH2f9pXWgnX/gr9JReiOMbmxrgiDj2BsaYGzRaF1tFAktsfK+s1Xheter9ojtd6p1VgVrWDdZULiBZFfEnSxaz5HV65Z0KHs79xMTosGrnxbVtOTpZn2BIlewUFOa1fWbDqNhaxn2/wjW//8H7VsdAZQVr/LPaoAbP4mlnzOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB7701.namprd11.prod.outlook.com (2603:10b6:a03:4e4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 22:44:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 22:44:51 +0000
Date: Wed, 15 Oct 2025 15:44:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 11/12] drm/xe: Make xe_ggtt_node_insert return a node
Message-ID: <aPAj4VWsq3pmxs9U@lstrano-desk.jf.intel.com>
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-25-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015074708.1654014-25-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:303:b9::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 40af49db-37a4-4fbc-e9ce-08de0c3c7409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nu3fjXow/9+jcVDj9vvti+im6Wd+XkSQ01+6D1EyaNHommbjggVeaHv9/o75?=
 =?us-ascii?Q?eM3IYvFj6mEQ0mClw191bWDnd0KZble1UFJiyiCxypGkXqn6/63HQwpoNI6z?=
 =?us-ascii?Q?09f8B0uEO0zn/xrRrkZ1DMvkHe4PY76MwDjysOpSGCewOJmn/IYdGhivPteC?=
 =?us-ascii?Q?XXg/CNPTZjKCbnCdSCgH7402xi7Ji1v1xP6AOCAWoQSCkEjyAky1S5W1EI4+?=
 =?us-ascii?Q?zqU5w9K0bpNoUaEiFPXhMJvC20X6b1BAIQO2A0BL2RBOfx1VKU0FGd9B/wCJ?=
 =?us-ascii?Q?881Mb2jPmhoTzys7VFXJDqB0GrCy9yJgaiTiROgsqRrv3XKu2sKTryQsFe3l?=
 =?us-ascii?Q?rAX/0Lxd9woQY+8WUXGkjo+glPf/ob8gZHOyiZHcCtaZuDZI5XYh08ORQtX8?=
 =?us-ascii?Q?wGS5+YFUNrUriyuK4psHeM9n4E55r9tcgyl4VBTJQZpLOqXN6143vGDosH+1?=
 =?us-ascii?Q?/QQjuFqD6zv3tJ9iI2xJYmQrLbiLUpkM61cLCUIaI3QZEYxtvOHxcyDOXWYl?=
 =?us-ascii?Q?HQMQnPZLo2yGe+iikl4gH3GY1MPoJRxRXQi94BRUz2MpVdyg3uUDq9MQI5y6?=
 =?us-ascii?Q?42QZiz17S5ONn3FTnOa5eq9ThERmihZmJTIha6Kb7Q2ugMlySZ33OydwhQp1?=
 =?us-ascii?Q?4dgdZbJrL9wdTigJOBiXS1ToEMjXmMvufUmyYHtUZeW3l+Tkl6RX/IFt4GKV?=
 =?us-ascii?Q?BHFl5spofi5+xDtrHkLOx4JNU9Ju0+FXQydvWH3yyo2KCiHaFcGearkZ6fy0?=
 =?us-ascii?Q?l4Z3m4D/I34e2cvN3c2/6NmBFIwgHjOvbGO9Fpauhkt7h+4hf77Wo+huqWBI?=
 =?us-ascii?Q?3SzLLPPzgq1WS81UfHkuRaKcYLLFmfKrmnBbhFDSKwGRkjpep7D5hjMWwE93?=
 =?us-ascii?Q?KR8ZiQOa7Hq1Ygv4lVv0o8HafEhk/EgPbCMOdJxDvgAuXRNkLU1G8WsaqtcC?=
 =?us-ascii?Q?M8kY/IAwUDKR3cqUIkWqDn6GLArMATcBJyS6y7rwTXkPuw9YfXpxXYZht0Lt?=
 =?us-ascii?Q?iGF85M9nF4rcNdaQIs5pR6W2Ox9OdkPEIEdwcsxe9jVBnDEgi8DIloE0VNkE?=
 =?us-ascii?Q?lVPNKtsTDHJIgFY3B1Y4FduyZhs6tTxy6PIkoJaZynScgtU05J6UieMcSsnt?=
 =?us-ascii?Q?ySZnK+RYlx53i0HN+5MEt7wV+biOMKqiDjkO6nk0Lq6CNmPw5nhPhdOUgVK+?=
 =?us-ascii?Q?65DA133NkrmNiXpwtHU/Mx2sYrCSXTutLGA1eVlATxMvrN0/0VoTiYbA8dMg?=
 =?us-ascii?Q?nPagMXhgXdthVmya48SmKdar6gqWJMEI7rp83BuVkMuwxTE7kbp3+hitWpgE?=
 =?us-ascii?Q?MT+4Ss696NUkoerncXb+65fpASmGZFCKpMwGDWz4CnQyOSP74Up2zYeu/w58?=
 =?us-ascii?Q?qO+mHTlokeQ1xP6cbnOcrxTLeA4HzaojAFY7K4RejlcC5B+iECQKTMTFtmie?=
 =?us-ascii?Q?X896VLMs0NGIMEnfprDlF0VeHIOM4KU8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F3do4FXKV7SuF/Se0JkVUobjzqdlHws5Jm0sNK7sM3GofhCILCAdOsxsYbsB?=
 =?us-ascii?Q?tuQLQKf89ZR8ETk6qjfXrEiaNbDJYSnAC9/SgsMtriqc/JTY/Z7znX5myuiU?=
 =?us-ascii?Q?ZFu7dIt+wwmJHVar07bKBjN1MvX3sS6v0+Or/XemFTi2ggYl6y3O9cdkT74d?=
 =?us-ascii?Q?rrk+fwO7PCyThG6rh5thQPgYNVg/M/0Xg3WbqnEHZjJqnZEWfB8vIwN2nq5+?=
 =?us-ascii?Q?Je3wz2WL2i4aIn56DJ3PBvHRrgGpS0lvslUYNX+sLeeJ34Uoo8zxko122M3e?=
 =?us-ascii?Q?7PiylB8unXadsoSxgG6K1xcPR7vPLfJtcXalfazKsqyBOcsxKyc6485quIuF?=
 =?us-ascii?Q?ZZe/yHf6UCNgfnjSosP4oMJiJy8E9vTRDqCvuKSb8vxhmwYB/gzra+mAt1u2?=
 =?us-ascii?Q?Qw8GARTK5PnMrk1FTfJ4IuirzhU2Y6fenhLsnbdpfeRVRBV4Xy+SHdsCHOBC?=
 =?us-ascii?Q?snYhh27I1bM/STklHYdaHiM7bN+56dx7Veh7aWYd1HixLSps3SZZw7DEiPEJ?=
 =?us-ascii?Q?NGPnE0DLdByWtDWigEybSzJviOzvIZHomsxWWuWQZsAq+lcYKRhRfNpKCLv9?=
 =?us-ascii?Q?ImAg2qih8d4VzWKKMxeqLs5F0dpmtzFszzz/ZygHpFyir1piUzjDt0qiNw+a?=
 =?us-ascii?Q?wKMw1EhXyx0jobTTiVXtOkfbYbF4AveTosHIaTHTtKbu4lvHj7DTbrnLHubM?=
 =?us-ascii?Q?yvuGLqmg2DabRW3s/6UyS3vfr4eY0mT1ItiN6Er6oyWwRF+hCIAB1PMcCc9s?=
 =?us-ascii?Q?Ni1uhZga/lkudC4leIc5c9rmoS3Lv7or1ggLrAYNRTMx4mHrsirZWk6COcxR?=
 =?us-ascii?Q?0COcpCiw8eeTNKtkB/78YumnJlLpqf/IIqERjTlSeCDSJSq7B60ZhGYFEkqS?=
 =?us-ascii?Q?q+fKg7Sxx5LpaNWP9IsuIKvyE1gZNNx217lDzzYPVm229OrF6Q1UVKZ7wgJO?=
 =?us-ascii?Q?ZzNFhKse/O9MZffH9KtyeNZ7EPSJnURUzUr5qTYAQX1NvBkjJiZ4i3sdHiQv?=
 =?us-ascii?Q?GFxb9dR5cPIio9re2ikCfTkEG+YdXXYpledmPcxGltpHw7DKytUiKX1N0m+E?=
 =?us-ascii?Q?JAQUbCy+C2RVS0Bz9cHK9tiblFcQXE05kQSDiicD1+2VeXS1MbLM6kHsIbHg?=
 =?us-ascii?Q?6BwCEP2mYGff6NR3MAiM4YvEYJlgxcJ4I/YpFwyZrR+PMhhiIKPxqny1J9C+?=
 =?us-ascii?Q?MU6+1n96OED3rV8/xByj1XPsp/AXnLvwcBgpt94CX+Ws3PwdPWpSsRAJSSMm?=
 =?us-ascii?Q?mVoorjbbYVhG1D+fiWw7DVtmBMmrSZDSo5OPwa71/YeGcUFz9tmFlbpk0ovl?=
 =?us-ascii?Q?qNRUHGHbaCiT9jfT+NQp7eX+mKx7zXfaYPxbaBmyhaStPAIiBWn1wQSrsql2?=
 =?us-ascii?Q?RJJERlZiKzVqpiod1SUh5aklF2nHaPZiu3BTI9r67xHVLnLXThGfBnBPA7xc?=
 =?us-ascii?Q?Plu7d3Xamd4ps+TcCBlCNUyXx1SvMZxbGZenBjzcNif0agAUcfMM6mISd+8l?=
 =?us-ascii?Q?2DApHh/E8HbYli9wWuekiw/2n14asRjCmm5/FS70J4KQPZqXzCJZwu7cJ04V?=
 =?us-ascii?Q?Jgw4sLxUqR8f0HlvxabOCuGzKjHBu5TZCMI4NYuGy8KisRhv4I2jYCbXs1FN?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40af49db-37a4-4fbc-e9ce-08de0c3c7409
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 22:44:51.8784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IDe+Q9tY3y6CgK+OLRfROVE/ji9lCEMWsycDUnguFZnEfXXK65RFkot070Qb8icjzTT8jNHY8yaES1s21Pgbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7701
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

On Wed, Oct 15, 2025 at 09:47:20AM +0200, Maarten Lankhorst wrote:
> This extra step is easier to handle inside xe_ggtt.c and makes
> xe_ggtt_node_allocated a simple null check instead, as the intermediate
> state 'allocated but not inserted' is no longer used.
> 
> Privatize xe_ggtt_node_fini() as it's no longer used outside of
> xe_ggtt.c
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Good cleanup.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |  6 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                | 76 +++++++++------------
>  drivers/gpu/drm/xe/xe_ggtt.h                |  5 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 24 +------
>  4 files changed, 38 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> index acddbedcf17cb..7aeee6680d78c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> @@ -38,12 +38,8 @@ static struct xe_bo *replacement_xe_managed_bo_create_pin_map(struct xe_device *
>  	if (flags & XE_BO_FLAG_GGTT) {
>  		struct xe_ggtt *ggtt = tile->mem.ggtt;
>  
> -		bo->ggtt_node[tile->id] = xe_ggtt_node_init(ggtt);
> +		bo->ggtt_node[tile->id] = xe_ggtt_node_insert(ggtt, xe_bo_size(bo), SZ_4K);
>  		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo->ggtt_node[tile->id]);
> -
> -		KUNIT_ASSERT_EQ(test, 0,
> -				xe_ggtt_node_insert(bo->ggtt_node[tile->id],
> -						    xe_bo_size(bo), SZ_4K));
>  	}
>  
>  	return bo;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 94cf886785ca2..e4e8be114786a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -442,6 +442,11 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>  	mutex_unlock(&ggtt->lock);
>  }
>  
> +static void xe_ggtt_node_fini(struct xe_ggtt_node *node)
> +{
> +	kfree(node);
> +}
> +
>  static void ggtt_node_remove(struct xe_ggtt_node *node)
>  {
>  	struct xe_ggtt *ggtt = node->ggtt;
> @@ -606,68 +611,51 @@ static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>  					  mm_flags);
>  }
>  
> +static struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
> +{
> +	struct xe_ggtt_node *node = kzalloc(sizeof(*node), GFP_NOFS);
> +
> +	if (!node)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_WORK(&node->delayed_removal_work, ggtt_node_remove_work_func);
> +	node->ggtt = ggtt;
> +
> +	return node;
> +}
> +
>  /**
>   * xe_ggtt_node_insert - Insert a &xe_ggtt_node into the GGTT
> - * @node: the &xe_ggtt_node to be inserted
> + * @ggtt: the @ggtt into which the node should be inserted.
>   * @size: size of the node
>   * @align: alignment constrain of the node
>   *
> - * It cannot be called without first having called xe_ggtt_init() once.
> - *
> - * Return: 0 on success or a negative error code on failure.
> + * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
>   */
> -int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
> +struct xe_ggtt_node *xe_ggtt_node_insert(struct xe_ggtt *ggtt, u32 size, u32 align)
>  {
> +	struct xe_ggtt_node *node;
>  	int ret;
>  
> -	if (!node || !node->ggtt)
> -		return -ENOENT;
> +	if (!ggtt)
> +		return ERR_PTR(-ENOENT);
> +
> +	node = xe_ggtt_node_init(ggtt);
> +	if (IS_ERR(node))
> +		return node;
>  
>  	mutex_lock(&node->ggtt->lock);
>  	ret = xe_ggtt_node_insert_locked(node, size, align,
>  					 DRM_MM_INSERT_HIGH);
>  	mutex_unlock(&node->ggtt->lock);
> -
> -	return ret;
> -}
> -
> -/**
> - * xe_ggtt_node_init - Initialize %xe_ggtt_node struct
> - * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
> - *
> - * This function will allocate the struct %xe_ggtt_node and return its pointer.
> - * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
> - * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
> - * in GGTT. Only xe_ggtt_node_insert() will ensure the node is inserted or reserved in GGTT.
> - *
> - * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
> - **/
> -struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
> -{
> -	struct xe_ggtt_node *node = kzalloc(sizeof(*node), GFP_NOFS);
> -
> -	if (!node)
> -		return ERR_PTR(-ENOMEM);
> -
> -	INIT_WORK(&node->delayed_removal_work, ggtt_node_remove_work_func);
> -	node->ggtt = ggtt;
> +	if (ret) {
> +		xe_ggtt_node_fini(node);
> +		return ERR_PTR(ret);
> +	}
>  
>  	return node;
>  }
>  
> -/**
> - * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
> - * @node: the &xe_ggtt_node to be freed
> - *
> - * If anything went wrong with either xe_ggtt_node_insert() and this @node is
> - * not going to be reused, then this function needs to be called to free the
> - * %xe_ggtt_node struct
> - **/
> -void xe_ggtt_node_fini(struct xe_ggtt_node *node)
> -{
> -	kfree(node);
> -}
> -
>  /**
>   * xe_ggtt_node_allocated - Check if node is allocated in GGTT
>   * @node: the &xe_ggtt_node to be inspected
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 9f97f63496bcb..d0ad541a40baf 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -18,13 +18,12 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size);
>  int xe_ggtt_init(struct xe_ggtt *ggtt);
>  
> -struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
> -void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>  void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift);
>  u64 xe_ggtt_start(struct xe_ggtt *ggtt);
>  u64 xe_ggtt_size(struct xe_ggtt *ggtt);
>  
> -int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
> +struct xe_ggtt_node *
> +xe_ggtt_node_insert(struct xe_ggtt *ggtt, u32 size, u32 align);
>  struct xe_ggtt_node *
>  xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
>  			      struct xe_bo *bo, u64 pte,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index c0dfffd5c553b..d71041a611d35 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -434,23 +434,9 @@ static int pf_distribute_config_ggtt(struct xe_tile *tile, unsigned int vfid, u6
>  	return err ?: err2;
>  }
>  
> -static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
> -{
> -	if (xe_ggtt_node_allocated(node)) {
> -		/*
> -		 * explicit GGTT PTE assignment to the PF using xe_ggtt_assign()
> -		 * is redundant, as PTE will be implicitly re-assigned to PF by
> -		 * the xe_ggtt_clear() called by below xe_ggtt_remove_node().
> -		 */
> -		xe_ggtt_node_remove(node, false);
> -	} else {
> -		xe_ggtt_node_fini(node);
> -	}
> -}
> -
>  static void pf_release_vf_config_ggtt(struct xe_gt *gt, struct xe_gt_sriov_config *config)
>  {
> -	pf_release_ggtt(gt_to_tile(gt), config->ggtt_region);
> +	xe_ggtt_node_remove(config->ggtt_region, false);
>  	config->ggtt_region = NULL;
>  }
>  
> @@ -485,14 +471,10 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	if (!size)
>  		return 0;
>  
> -	node = xe_ggtt_node_init(ggtt);
> +	node = xe_ggtt_node_insert(ggtt, size, alignment);
>  	if (IS_ERR(node))
>  		return PTR_ERR(node);
>  
> -	err = xe_ggtt_node_insert(node, size, alignment);
> -	if (unlikely(err))
> -		goto err;
> -
>  	xe_ggtt_assign(node, vfid);
>  	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
>  				vfid, xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + size - 1);
> @@ -505,7 +487,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	config->ggtt_size = size;
>  	return 0;
>  err:
> -	pf_release_ggtt(tile, node);
> +	xe_ggtt_node_remove(node, false);
>  	return err;
>  }
>  
> -- 
> 2.51.0
> 
