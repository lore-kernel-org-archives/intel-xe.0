Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D38C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 17:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3260D10EB55;
	Fri, 16 May 2025 17:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtXTwtqz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD00310EB55
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 17:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747417651; x=1778953651;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sFyqBGM/BbhfqsdlWPzK/yg2htuID6V3JYuik8FoSbk=;
 b=QtXTwtqzK4pME/1LoHYTTY/XUqT3BbRUC9VJS8uvb8Yf0GBpWnEa9yzB
 Cdp1oXKaq/kXuW88I7UyH2s/NF+tARiuQWdvQzmdftXADfbYnRajjFWS8
 P7CW5lP49pRtoo2/3wW8iqhjO8DkdjSBNdKPXplJkVA7UTgAPCJyaL6k9
 hDj+JRpJPyQAZJ1dzUFAgpCKebtMDzSwCmQSUUD3jDg5vO2BnAellsbnB
 ADp0xKlRKWdkQMMmDUnqlvPkcFE6an11do6/4BidWc15urWQgfUyljpKl
 sAjGxMkUv1BjGOjRWfjPvYkVhl5rd6vV/7VDQLMiGcMYA+Uv3TnXveS2I g==;
X-CSE-ConnectionGUID: T0+muUImQJqZxo37P3zCkA==
X-CSE-MsgGUID: ilGcJqXHTcWIanPs7mBpBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53215823"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="53215823"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:47:31 -0700
X-CSE-ConnectionGUID: kYavQ592S4+6ZJEneDfYsw==
X-CSE-MsgGUID: iZSk4gEaT+qcSs7Jps+msQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169794150"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:47:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 10:47:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 10:47:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 10:47:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQjSG8+bFQt+278X+f/qohj0SQ8sc5fy9DItvY14cjjUzDQTvFoI1N2j8v3XnbskPk50Ne9+6QRZK2pj3G3YMmzAZXfCTaait/X30edEfwNsYojAxxju7/HaGLm4gedvMkAfAsTz4z0F2D5gaLgSvPURHVtUc2mmE3Lypc3x1dV1DnF6aTtw4aivuP417e2f1U43RTi38u7E1sMq8Zdy73BcSIX+bb0zQI0LT9Rh9UxXn+Uok/5XYMvJrnlDHksDKlysRfWxw360MhiUZyXoJ1MUls5cBt1RYtlleJ5UUhL7Ub7g6Ssx5jxXjsllfYJlj3typRyC+KOOzO8ECheZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrZCu9TWY+kyWvofbS7Cv4U30gIN/eKAcodVIr6MsXo=;
 b=C3qtKl15knHcCVjCJjymKm92viL77XMDZTijsrRcysGtXS+bp42IwneiO3HP4xyhP53/bay5E/czuIc/BL8Dq7RhNcWZENBQfUwEQbgG2kUaY9XB7v4e07Y9D4xAJkZzwpfPEY4S3cGTKYhrdvoTw+ps58Rkw3anZaup9/PN5StheSoq4xiVnga7h1+7Gj2sHVsDqn+pfe6qv2ltUlI2635r5Hmixb+N4LKoMAwV9j42BgZAb0Wy9iuK9BW2BqArPgh0zBBJYgmyWgZeFG/DUywzULTOX925QehAagbN1VHgCvY9UawSbJxKTzRTNs6wA+UrZA19yIr+k6xLRdMj5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 16 May
 2025 17:47:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 17:47:25 +0000
Date: Fri, 16 May 2025 10:47:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 1/3] drm/xe: Clarify LRC size when allocating
Message-ID: <20250516174722.GK5080@mdroper-desk1.amr.corp.intel.com>
References: <20250516074412.46863-1-tvrtko.ursulin@igalia.com>
 <20250516074412.46863-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250516074412.46863-2-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BY5PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB5963:EE_
X-MS-Office365-Filtering-Correlation-Id: e82fa4a5-9761-4741-503f-08dd94a1b7e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EGiNVpVUCfdc/L24xVbVtU6rzcR0RmyqaJUQ7DeVplQUj7HmDSutlaaiBPrS?=
 =?us-ascii?Q?A6zrwTbLsp1kGtE8UrmuivxL6Sv1L8K3J2wrWAo4rX2DHbeuTwwtnXgH6rEg?=
 =?us-ascii?Q?x7iRMLwz1ODnuOMgycbCJV+WYYcadSCZ+O+vAs0bIWTLZUtcRMe6TyRNKiWR?=
 =?us-ascii?Q?UVCFB5+5Zl3SDNaDWG+P6eCP4ZtBtSQEh0mlv2zS1nlzkSS8c05k8+bZSnOh?=
 =?us-ascii?Q?gGVsi8EkK477B6z2v/i7T8PfLLfgSebxdzGT63NDWZWF64dp54FaMLhwbpTh?=
 =?us-ascii?Q?WFeDvpERohVJyAKdUPky++b9k4DEm7/qfCtoczCuJQQDRmBHFalWWYz4ySWD?=
 =?us-ascii?Q?ELQSZZdTBlY0Dbb7y1DgSsa0vAat9gusTjxQQKxhLtb2L5i31TGe+fiIpQbR?=
 =?us-ascii?Q?jdtNFe+GsNK+Jz57pAxdLubDJoPlq/eji4hEz7OYbEJVBb1o1+wtRMxI1P90?=
 =?us-ascii?Q?18TkJryVZmYhEnWwczCrCBbCq5Wc0oCm2mdssDZ3Cd7s9Mx1fnIolXJAoVaa?=
 =?us-ascii?Q?IltP4yfSu/9eMKRIr4gT1UqDH0z1/wsh+O3R2V6El7OeXPxYdxvBIa6bkihy?=
 =?us-ascii?Q?SxF30yWuerLYAeWaqmQQbI3OakLR1H5EYGKyZ+SsJ/9vRJgwSBT4ulpaD7mf?=
 =?us-ascii?Q?vDMv3DDyEGs3PCDHCctTiBf58Qbb1lHlKbSY7/C/kGLCA2MkSamIr8tqcoER?=
 =?us-ascii?Q?be8rKgQ3FDeKPteCM/y8Iz9vcAZ/DxcdhZNC3kP9y5BV0jI9VXCh8C9uPTp6?=
 =?us-ascii?Q?xIQSgPi5vg8rmC3P0JkiMmV+FOWXEQ29/C1WUUVfNamDwRLpXuTvxVPxYZk6?=
 =?us-ascii?Q?3UUJ7Nphm9UJuyIzlI3TVcL2ZJx/jVuJiCfGBT8igIEw7I9BuT+zWGFpj1v6?=
 =?us-ascii?Q?MSzdTkA18bDiv4oLb2UZnzBKXgFpRgDp6Oi/nFTdcao22DNZE6w7I98NzkGS?=
 =?us-ascii?Q?vcnAuG6b7Y7zeGVclzzYEC+QfejY4Svksdmuc5gcPH28aPo5GTFS/rnoNVvl?=
 =?us-ascii?Q?Wi3WfT8GTucUnDrq/wh4YtPSNIR7wifP5RA2Abq2dK5ikgIifxGqVgE4h6E4?=
 =?us-ascii?Q?b/pVGDTCss4tVpKfz0htw4vqbaROJILZIVj84lMH3nWs9l2cAqSnM+ig0gI2?=
 =?us-ascii?Q?DuyKjMfayk5/f2Xm0h+w99wWJeggnY4P0EhGHVWvVyaC0HtdeCePf1icRHKp?=
 =?us-ascii?Q?tc6MABNFXYpka2oybAdV0CPm8eSZnYjZp68T4oYeKs11k90ZbNX91FSnmBsl?=
 =?us-ascii?Q?WpjaFlxrFu3iotLPQVdtkQeTShn8teAu8c2ceD/m1KpApROEMBnHgnQlrk5h?=
 =?us-ascii?Q?zLN5E+IisoL59z7MSm/HJCP0PsIj2rm08HDUGrRtWa1r7DGcvGaqXpGZ4Htq?=
 =?us-ascii?Q?g2myAa0xZ6qkKE4gn25AIgryh0+iObYCC0EUWvSXQD+4owe7X/kT+wI12ER1?=
 =?us-ascii?Q?rVlQxzPXuSc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BEOuCt1zK2bFnJQlN9L35mO+eSsUoUKmV11/JXfn1Rx8kZO4pFqbwxaiFCFs?=
 =?us-ascii?Q?rMv/Gpyab8c7oDBvDwji/ymRYzCuT9RlLqOItoVIz2pUKWfQgA5KeDF8VwwK?=
 =?us-ascii?Q?JRkCuANsXUV0lAib1K2LFhgFgPWrN7Pv6MGo8R1t1at9OCuRxLlSTk231KeR?=
 =?us-ascii?Q?NxcYcCBFfS/XZj9f0XOV4sZRQYo+Wvk06gXkLn8iHEZr6XbzCw5hkCRdKOVX?=
 =?us-ascii?Q?6Mk9PE7EMP4qzPP8pBwAMeyGvnSLUkFpO4Qq3PdvSuLpdXR4+ANkHVCU4NbB?=
 =?us-ascii?Q?5Ce7q90SN0l3hjQuIaiuLuhz6T0sdJ/97HS49N35dFu3vJ3bBvgV5Z5aEnNp?=
 =?us-ascii?Q?9nCl28WYPrMSbMRgdjAa3lyjvhuVVyAJJPhNEUxBX/xa4e4+59VD/l8W1Xw/?=
 =?us-ascii?Q?2jYJLuTy5NkBFOkO37CPg8PhrAuwrevJE6ONeY2xb/c7E2MAsP0/8erGW1Tx?=
 =?us-ascii?Q?7BJxOTa2aYRb1xcsKhuqTty4zz1Kf8EWxHjS1ODYj3o/Sb97F8EzBVUN5KOr?=
 =?us-ascii?Q?Cz7L3QdPLTZf10hdQjV1G1s7a8XzW6dTQrYI8531oeNPKzsPENQ+fnbFE0Eh?=
 =?us-ascii?Q?zTVTRnNx8vnCECLN9ybegNzpUzCE5XV2h09aqj5HJntpC7/hPeUc17lepxUC?=
 =?us-ascii?Q?c4CKrOVlgs7bYJmvAUHqLZsNd9BblwbcWuEBhzAsJbynPc74AOzxa/A7rOuy?=
 =?us-ascii?Q?jKyUiZgpnp1A9FuoxH1DXGf28FiSzQ0L5IFNZYQ7y1wmVYDcjg9Fegf+YjiO?=
 =?us-ascii?Q?DrhdfJU43tq3+69Y++UBJGGN6l1/jo1e+nvfOsDDSXU7GxG2l4pHOqsxutAT?=
 =?us-ascii?Q?RL6ETnKDgs2hk2IplsRT6lm8i0gmFcxxO2GgcY/0mpKcWzZ5GHl7Zx7CBqYE?=
 =?us-ascii?Q?BoIocEhx0APEsHxZQPVgcCCqjVf3SzUwUzfaI++HQDZrLdwlb0gILfF09aJO?=
 =?us-ascii?Q?DOwoMsFfgAyQFcW2tNjFQGdNngt8Hb8m08XSKEYe5HM4HWyLKZbXJv/MbUlD?=
 =?us-ascii?Q?T/vCnyUKl1XswZ3Y/ti5DAuCU7nFMBsYLq8eTforwjciCIgDaEARltcYrmgF?=
 =?us-ascii?Q?eRlblivlvI+YuRP6tGmnkYWGk1xMgg8miflMrjc7clWptGtgPoUurqVIzTvb?=
 =?us-ascii?Q?zF9BpExXRoWLLY4fllNz+MW4zsIKI8QK2qa7FiflXSkapBOk652kNYcjtr25?=
 =?us-ascii?Q?Z5VONBhXW/T0nPriexvpud+ERJd4YGs+nUmoCu5tS+QoV6MDfu1FJqS1kNG8?=
 =?us-ascii?Q?gizjQJvCNqMa8KAqtK/Wcsn+GB51bO4DwVXU2LmglTy9yJ+U6Q6wwwCkGmAh?=
 =?us-ascii?Q?uth6/gRusp8KXLG9Rd9EYXpSN0AKygTXd2TswNTco/fLDvocULnDN9WpckAy?=
 =?us-ascii?Q?8irC/mq7Vgh7SVeDHMga4ztHqONfEPfYdMjhJmkkBo3Lj9A1t+vhywm8F/Vi?=
 =?us-ascii?Q?SQbl4nJkdFCx+6IU8edkirOKJ1CcFIWdN1Pdja6ehLzpqS7sW80sJz51fiQR?=
 =?us-ascii?Q?Ay2CaGFtLLI0ZXfpg/xEXFTHyo00sAf/lF6LwMvMNJT9xMefcZ8BnWBBYdMq?=
 =?us-ascii?Q?+CJYAVrStbp6xz21tUHjx87HbNRpw7PHMkzoexC0teZ1kHHJ/7zGSUuXmGbH?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e82fa4a5-9761-4741-503f-08dd94a1b7e7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 17:47:25.4440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dBUIEHx+bMVaX6H57yuImcO8LIXCx2KUhx7DY58niBDf3J8xZgB4lQdrkcF4YCxoIq+GQqBQ5fO7c9qdZh0Yk2LEsyaXJd5XxM62vul0TXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5963
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

On Fri, May 16, 2025 at 08:44:10AM +0100, Tvrtko Ursulin wrote:
> Clarify in code and kerneldoc that lrc->size is the size of the kernel
> object backing both the ringbuffer and LRC in one block of memory.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_lrc.c       | 17 +++++++----------
>  drivers/gpu/drm/xe/xe_lrc_types.h |  2 +-
>  2 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 61a2e87990a9..08835e36a60d 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -982,19 +982,21 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		       u32 init_flags)
>  {
>  	struct xe_gt *gt = hwe->gt;
> +	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct iosys_map map;
>  	void *init_data = NULL;
>  	u32 arb_enable;
> -	u32 lrc_size;
>  	u32 bo_flags;
>  	int err;
>  
>  	kref_init(&lrc->refcount);
>  	lrc->gt = gt;
>  	lrc->flags = 0;
> -	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
> +	lrc->size = ring_size + lrc_size;
> +	lrc->ring.size = ring_size;
> +	lrc->ring.tail = 0;
>  	if (xe_gt_has_indirect_ring_state(gt))
>  		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
>  
> @@ -1007,7 +1009,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
>  	 * via VM bind calls.
>  	 */
> -	lrc->bo = xe_bo_create_pin_map(xe, tile, vm, lrc_size,
> +	lrc->bo = xe_bo_create_pin_map(xe, tile, vm, lrc->size,
>  				       ttm_bo_type_kernel,
>  				       bo_flags);
>  	if (IS_ERR(lrc->bo))
> @@ -1021,10 +1023,6 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		goto err_lrc_finish;
>  	}
>  
> -	lrc->size = lrc_size;
> -	lrc->ring.size = ring_size;
> -	lrc->ring.tail = 0;
> -
>  	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
>  			     hwe->fence_irq, hwe->name);
>  
> @@ -1045,10 +1043,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
>  		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
>  				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
> -				 xe_gt_lrc_size(gt, hwe->class) - LRC_PPHWSP_SIZE);
> +				 lrc_size - LRC_PPHWSP_SIZE);
>  	} else {
> -		xe_map_memcpy_to(xe, &map, 0, init_data,
> -				 xe_gt_lrc_size(gt, hwe->class));
> +		xe_map_memcpy_to(xe, &map, 0, init_data, lrc_size);
>  		kfree(init_data);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index ae24cf6f8dd9..559c7c831212 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -22,7 +22,7 @@ struct xe_lrc {
>  	 */
>  	struct xe_bo *bo;
>  
> -	/** @size: size of lrc including any indirect ring state page */
> +	/** @size: size of the ring, lrc and optional indirect ring state */
>  	u32 size;
>  
>  	/** @gt: gt which this LRC belongs to */
> -- 
> 2.48.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
