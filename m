Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D47CA0FF0
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 22:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1221C10E2F9;
	Tue, 26 Aug 2025 22:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6cbOwek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B6710E2F9
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 22:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756246094; x=1787782094;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qm77869D12avse8RYXpfllshUfMAo7a6LvVw04VygfQ=;
 b=Z6cbOwekCcWhPsXEaJ96cDb85DIiqrtRjRg+RRg7E7Zxhs6d50EsbIps
 nIASrHrLmbStH6zDlebE2VRd0hQLFzsg8LoKDcr2jt9B4PnzQZUXiSvwS
 nbuLa0U4vy3xBhHw4TvyCF6XvE+kLI0dqxDotdD3s+o6qb85CcNiFSGdw
 86wcchLdn/vTIXvAkkPnl5lsF9yyekj+wl/jwCmy//6PcgfvDw+PYija+
 gipsigmqsNIbxp7XrW/dcdnZ0xnrtUt8/wy1dWRw5C6L47XSPvTtWXNF8
 DQXYr7NCGOaNKbZ5YYiM0qecuVS9SvXFsZg8pUibRcn1SjjHiaeTzwyuK A==;
X-CSE-ConnectionGUID: PjKiyjigTUCSU1LU7dg4hA==
X-CSE-MsgGUID: CxbNqfDzT023auzqor9Fsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58648034"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58648034"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 15:08:13 -0700
X-CSE-ConnectionGUID: rtDEs0EuTcyT8cd8cV9IHw==
X-CSE-MsgGUID: iGz34nuHRo6oBT9aG1avhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174949684"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 15:08:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 15:08:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 15:08:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.59)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 15:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHhrtU/hbXR4wJiT0G93XuU+1jcXf/AF+e6O3irEVhsbkLE2RWeWDfyz9TkZfOpXX5UotPLShOGHHBYUPOQzyaFo+42p0y2eQjBmZywAWWLjkZOmvblYOQDu/UpumbmjQAW2ATg4jzzmFA3fK1aD+JVYUZ+zgoCpoltDzu5sFH89/nbxUN8JU8KDAqYVfmXUQaWtEEzNm7nbt/fmMU/o+7fVPn1BnDiNF0r/CnHaw5h4vGnMWyLbAP3z5hyVsYorop+ZEkkAek+I0ws454iOnHjYZPwTk7J+bSwMdqJV2KPauD5ObtLiARb3E5rsUi+ifdJdp5bxKLOhwCZ0YYZd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uoQ1v3XOxRXyUZ0Ybw5DW2lFU0yL2r9eX3x4+gRHb4=;
 b=oPZhKGo/BtifsxORPn0VQJKvOknd20wAm1FzSuaMG0O9k/IIoxbEPGyisxCu5/M3GOs1Ea8gwo7V3xs7JNg2P6cME5AO7r0kY+oOyPctwo6kk9KmzQegSaL95Og2SYe9aW5Q3g0rtEaxZlMphHu7NVJr0z1LG/p8aSCEqQqv9f2NbpMw9WSrqGH2r6bIMbnzhAhEz0TSiLIaZRTPwy5sjvIwaC2Mq/kUBAoxL6Bx8LafG+sjNHyZkIUZB4g/G/KtA2Yf9ecoEC5EeLijNC68TKUimuCcv1dpg4xmW3EK2ZYaW7aJ94d9mFg93BqE/UoDN/SckOpv9/6b+jgtkY5tTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5865.namprd11.prod.outlook.com (2603:10b6:a03:428::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 22:08:10 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 22:08:10 +0000
Date: Tue, 26 Aug 2025 15:08:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v2 16/16] drm/xe: Convert pinned suspend eviction for
 exhaustive eviction
Message-ID: <aK4wRhCQ/kN8Sx6/@lstrano-desk.jf.intel.com>
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
 <20250822094030.3499-17-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822094030.3499-17-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0095.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::36) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef1b607-51d8-4aeb-6604-08dde4ed0b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?z6XjNn4XOJE3l4XfEBzpVBQfIvZ1WxInCD2dwv9QZlPNP0PPGgmUf5aANw?=
 =?iso-8859-1?Q?pQFZyUfvcL4qDyo87uyzE8fvfkyPEFtLG25yr/+DncUSn/LK1cd97lZuwb?=
 =?iso-8859-1?Q?RhV6HW+dK2si4b6kk6Xn/+uRaCZqgP5IfzZhfI0RB4Op2hTrTly6K4O2CE?=
 =?iso-8859-1?Q?6WNAm1PPEajtOKbpufAYiflfPgUs7XhEq3DCbLaGYhPlJLUdxIB9rxvlbZ?=
 =?iso-8859-1?Q?Jcg83HEEXBsYsPj18GTVudh9EHzbvDBVk3fzDQCIL1/aZSVwXatEQwCy+v?=
 =?iso-8859-1?Q?btUi8u3lyXDAAGXwUsbCtoLcFr87aEseZSCecBCRctitbG5uVWrSznR2dN?=
 =?iso-8859-1?Q?DRzUIsci/ru3iIp/8oOwYceqYpFyu6DGNx3IYipRWXwDfQNOlQ8Yt4TK7W?=
 =?iso-8859-1?Q?VZ7uNyvIhcXp101ghUHz9OAZuSs2YpTGY1Id9hVt4Av8P0xgclln4+ojyF?=
 =?iso-8859-1?Q?SLO78K6+/AtShcV8nViqL71eQlA4x0Q54zjtEFX3mpDFfuUROSd/osuqTg?=
 =?iso-8859-1?Q?GlzPoYjBiopsOAJOSMzGrDC6h5jvYgm/vXHMqV5Xht04ULoDlZ5DJYZ+aK?=
 =?iso-8859-1?Q?zKrTO3mEOVjGhGeu11R+Dmuj3opArD1jVnOtkSAUbAuX9BsX0rWinS3k3q?=
 =?iso-8859-1?Q?w98TkMJfQsFXFcG7tqm6ZiY1FvVyGJY5QzRqF1LxrTYhEDrgpsQWgLLf05?=
 =?iso-8859-1?Q?w4rwSSJ+hF/YEF13BA/7fa5Uk1kiPABZ3xBjcuR0uEqTbBCNlSXB5G1LfW?=
 =?iso-8859-1?Q?PcAqL4nzIjFupnhmVjaue+A6GA/V0McO1Ef9ADQ9Hm0CnQI5CJ0OhXke2Y?=
 =?iso-8859-1?Q?ZWSIUUUwPCflN85cT9+m/jr1uwV7uXVvGtdbWCROJmry+oSlKKmRXyBKAa?=
 =?iso-8859-1?Q?wHSwR0Upj7451BJuB/Sn8jxGZPnLnEO88z/fgdWaT+3jz9mIxcqt6hFq2v?=
 =?iso-8859-1?Q?Gn+HTHn9AwEOjnY4j0FI+TFwpWZsF+UeeXsDDC5zojnELrXyfQ8WYfpJMZ?=
 =?iso-8859-1?Q?b/w0MSvZAfEpyOHJHB3R76PgigW43NK6CTWT9mV+o0bz3Wnq38GCP909Ta?=
 =?iso-8859-1?Q?m4AIL1h4XfCwnZOWMz0oiNtsxlQH/m8E2RIw/iYCVnKEpRisZrXtkvmvvE?=
 =?iso-8859-1?Q?IE7pk4kIusH3PDl+rowl3OzNKcD3FdeImQ+P8roucDE5QyuioEiQ3vBabu?=
 =?iso-8859-1?Q?O3BU8F0YSrmezGfMQsBMgIJqqti6miJdvzTPMrQk679AfvG48AIkF28qYZ?=
 =?iso-8859-1?Q?cPypl59wo+7SbujWkcn66WD/aBib2oo60NRUG1aVvHAu71LzYbRB0196j4?=
 =?iso-8859-1?Q?nIAfnhAmHgZ+JSY2ulAZ6X+ntlnDpQnrh0eQ9rH6Y+Btdk/Rpiow8IDEzF?=
 =?iso-8859-1?Q?jd6eUVRmuxCcibbknEt1KBI5iSiFVjQSgBx/3hWaY1JFY8a9Vs2ec/qagu?=
 =?iso-8859-1?Q?Ae8t+VG5m+NuZRZj4TIjQBu0EXRXFSKybzsd1nhAqQBKPrMnE4XRMELDwJ?=
 =?iso-8859-1?Q?A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?x0GcxxL/OSZvDrZ/9cl3mwI3bAiKHT/bnLHnRNGZyAJPVIb/SmLd+sjlDc?=
 =?iso-8859-1?Q?mqKV0PuVOsiCY80R77ffBb+azfwpDm6HkR2WHXm9xuofIXV4i9zHxUYVK8?=
 =?iso-8859-1?Q?TB/zH6mrSOyBwtzSYMVmSftwkY1dwC3VMF89QDQ8QTwf6yEFkLgNw3aGoI?=
 =?iso-8859-1?Q?jOGN0nJoKYcUoxhOoxHLvAut8dIXUtZNVDzRpcTsxiebEvA6pt4PIPAeCZ?=
 =?iso-8859-1?Q?g6z6YR53HB5FnTXthXzXfVRoQ7kAvB76T0tYnzOmvX6399xt8pcRq+pYhu?=
 =?iso-8859-1?Q?ljMVguOgG3m1b1e5Toq+j86vF7k4a/1C2LruR8JiRvvCeuhvgOCMGVHkdV?=
 =?iso-8859-1?Q?LepHYQw4GAj9ZZkdOshdh9Js21f1QtIrWqxiv7S23UhRA8DdMYcITf8lZA?=
 =?iso-8859-1?Q?M42LvDNLAqDxCzC/fHEoIcJh/Y9kyif1wdUaUhHf0TjlN3aprXF6ZMjco7?=
 =?iso-8859-1?Q?X6VVay9kJuclWsZsutRDeHxNQNmn+TKljTv+3WDdoxjFT/T5RnACU7pfib?=
 =?iso-8859-1?Q?oZNhGJzh7QU7aMedRt2CCkbZtuIPX0o0LdJ6faUsPr0ijyIrEFHDMd/mtN?=
 =?iso-8859-1?Q?nIVpRbwS8K/YO7M29hYaXoFR7XAEcR7iuoIgk2ZwskMPxjsf7d6KJabZkF?=
 =?iso-8859-1?Q?6a3nprz3cry/P4a7JviAEoIh4TwShSLoBosyCfV9Q1nt9ijY+VQjARiD1+?=
 =?iso-8859-1?Q?zkp0YYbp84cZn20DaxysqwbeL4R2PhydBggVYd5cthcrtYjb9uZ1GeL+tH?=
 =?iso-8859-1?Q?43A9o7MqTZ3HAlIcOLo4PpE4Jv5w3lJ3l2uYcawfJOs44YUQZyWUkY9YpE?=
 =?iso-8859-1?Q?mF6Vl4yX1eWGaZDzqeoSrmcSflNIBHXgtzBzkh0tLo/IwhRfN2c53j8Us5?=
 =?iso-8859-1?Q?KkYLfFPVwUvBwvrphYz/PTUnvUvEmAdLEck0icvO0xUZUKXMdt/L9FtGyG?=
 =?iso-8859-1?Q?pqzk7XrznSNv296qBp15UfdzodSlA8qDdo7c5VY5blOIZynDFoNakX+53V?=
 =?iso-8859-1?Q?oKJuu6gJXzWpKwdEazArhkVbNHWYCCIz8vS3oQFTn2QRR8a2ZU+HoWh8Rm?=
 =?iso-8859-1?Q?pQv7T09YKMdiFqN8rBdlvQZ3+Pr2ed4sOGbz91BPQ+WwDEjSJrLwvxBryU?=
 =?iso-8859-1?Q?5TjiahDy7knyymRq8f82Gj70kQ5IVprrJYJoCz4JvNCUPwOicEcpOB0YBz?=
 =?iso-8859-1?Q?plC5ObXnG2R7ZGxzRWekaRc2j2omcSz5YojPbaqJ6M/b4TugQYGCAld2K3?=
 =?iso-8859-1?Q?SvRGWha8Ez4qhH1eKCcAEnxtxrS01idm3qiT1VG77umwShjMB3M5o39GZj?=
 =?iso-8859-1?Q?SSPWQ6sabkSg2bN1qxovKJYtDNxBLn95WHxbF5ZO7BW70N34Vueg9RBx/W?=
 =?iso-8859-1?Q?RN33m+1jK9Owk2T2hfAB7yLDOFZfuN4WP9HmclOQbo52/NbYnl6AY4ZQmb?=
 =?iso-8859-1?Q?Qy6o/LObe8/bbi2U3lw059bNO6HNj5IGr4jqG8EA29MRRU4m8pUlPhK6Qo?=
 =?iso-8859-1?Q?fRoWmyZB2v1RBdAdYbsb9Qxr75C/iHiryXdGfI8lxaGl+VAudyt+ASGQuW?=
 =?iso-8859-1?Q?dkznMdrPDOkJO+R/zqG4XIqa39avywTsPxODjPWZZvK28RICJjoemuvd9K?=
 =?iso-8859-1?Q?ccyfl/ezreCXIFDnmDIBB5LjfjIbuQhY7UZqTL6zI/IgjuAHqDom/Wrg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef1b607-51d8-4aeb-6604-08dde4ed0b23
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 22:08:10.3863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyJn3YvsIbXF8IoDhhaeNKysqVr4E4C3HOfRlExUxtyk4D/sTzR/6b+BCwyKlc6NEZLswY1iAJY6epyuEcqE3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5865
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

On Fri, Aug 22, 2025 at 11:40:30AM +0200, Thomas Hellström wrote:
> Pinned suspend eviction and preparation for eviction validates
> system memory for eviction buffers. Do that under a
> validation exclusive lock to avoid interfering with other
> processes validating system graphics memory.
> 
> v2:
> - Avoid gotos from within xe_validation_guard().
> - Adapt to signature change of xe_validation_guard().
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 184 +++++++++++++++++++++----------------
>  1 file changed, 103 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7a62629c88e0..9733f742525a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1139,43 +1139,47 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
>  int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
>  {
>  	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
>  	struct xe_bo *backup;
>  	int ret = 0;
>  
> -	xe_bo_lock(bo, false);
> +	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.exclusive = true}, ret) {
> +		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_assert(xe, !ret);
> +		xe_assert(xe, !bo->backup_obj);
>  
> -	xe_assert(xe, !bo->backup_obj);
> +		/*
> +		 * Since this is called from the PM notifier we might have raced with
> +		 * someone unpinning this after we dropped the pinned list lock and
> +		 * grabbing the above bo lock.
> +		 */
> +		if (!xe_bo_is_pinned(bo))
> +			break;
>  
> -	/*
> -	 * Since this is called from the PM notifier we might have raced with
> -	 * someone unpinning this after we dropped the pinned list lock and
> -	 * grabbing the above bo lock.
> -	 */
> -	if (!xe_bo_is_pinned(bo))
> -		goto out_unlock_bo;
> +		if (!xe_bo_is_vram(bo))
> +			break;
>  
> -	if (!xe_bo_is_vram(bo))
> -		goto out_unlock_bo;
> +		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> +			break;
>  
> -	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> -		goto out_unlock_bo;
> +		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
> +					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> +					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> +					   XE_BO_FLAG_PINNED, &exec);
> +		if (IS_ERR(backup)) {
> +			drm_exec_retry_on_contention(&exec);
> +			ret = PTR_ERR(backup);
> +			xe_validation_retry_on_oom(&ctx, &ret);
> +			break;
> +		}
>  
> -	backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
> -				   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> -				   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -				   XE_BO_FLAG_PINNED, exec);
> -	if (IS_ERR(backup)) {
> -		ret = PTR_ERR(backup);
> -		goto out_unlock_bo;
> +		backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
> +		ttm_bo_pin(&backup->ttm);
> +		bo->backup_obj = backup;
>  	}
>  
> -	backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
> -	ttm_bo_pin(&backup->ttm);
> -	bo->backup_obj = backup;
> -
> -out_unlock_bo:
> -	xe_bo_unlock(bo);
>  	return ret;
>  }
>  
> @@ -1201,57 +1205,12 @@ int xe_bo_notifier_unprepare_pinned(struct xe_bo *bo)
>  	return 0;
>  }
>  
> -/**
> - * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
> - * @bo: The buffer object to move.
> - *
> - * On successful completion, the object memory will be moved to system memory.
> - *
> - * This is needed to for special handling of pinned VRAM object during
> - * suspend-resume.
> - *
> - * Return: 0 on success. Negative error code on failure.
> - */
> -int xe_bo_evict_pinned(struct xe_bo *bo)
> +static int xe_bo_evict_pinned_copy(struct xe_bo *bo, struct xe_bo *backup)
>  {
> -	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> -	struct xe_bo *backup = bo->backup_obj;
> -	bool backup_created = false;
> +	struct xe_device *xe = xe_bo_device(bo);
>  	bool unmap = false;
>  	int ret = 0;
>  
> -	xe_bo_lock(bo, false);
> -
> -	if (WARN_ON(!bo->ttm.resource)) {
> -		ret = -EINVAL;
> -		goto out_unlock_bo;
> -	}
> -
> -	if (WARN_ON(!xe_bo_is_pinned(bo))) {
> -		ret = -EINVAL;
> -		goto out_unlock_bo;
> -	}
> -
> -	if (!xe_bo_is_vram(bo))
> -		goto out_unlock_bo;
> -
> -	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> -		goto out_unlock_bo;
> -
> -	if (!backup) {
> -		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
> -					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> -					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -					   XE_BO_FLAG_PINNED, exec);
> -		if (IS_ERR(backup)) {
> -			ret = PTR_ERR(backup);
> -			goto out_unlock_bo;
> -		}
> -		backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
> -		backup_created = true;
> -	}
> -
>  	if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
>  		struct xe_migrate *migrate;
>  		struct dma_fence *fence;
> @@ -1289,7 +1248,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>  		if (iosys_map_is_null(&bo->vmap)) {
>  			ret = xe_bo_vmap(bo);
>  			if (ret)
> -				goto out_backup;
> +				goto out_vunmap;
>  			unmap = true;
>  		}
>  
> @@ -1299,15 +1258,78 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>  
>  	if (!bo->backup_obj)
>  		bo->backup_obj = backup;
> -
> -out_backup:
> +out_vunmap:
>  	xe_bo_vunmap(backup);
> -	if (ret && backup_created)
> -		xe_bo_put(backup);
> -out_unlock_bo:
> +out_backup:
>  	if (unmap)
>  		xe_bo_vunmap(bo);
> -	xe_bo_unlock(bo);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
> + * @bo: The buffer object to move.
> + *
> + * On successful completion, the object memory will be moved to system memory.
> + *
> + * This is needed to for special handling of pinned VRAM object during
> + * suspend-resume.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_bo_evict_pinned(struct xe_bo *bo)
> +{
> +	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
> +	struct xe_bo *backup = bo->backup_obj;
> +	bool backup_created = false;
> +	int ret = 0;
> +
> +	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.exclusive = true}, ret) {
> +		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_assert(xe, !ret);
> +
> +		if (WARN_ON(!bo->ttm.resource)) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		if (WARN_ON(!xe_bo_is_pinned(bo))) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		if (!xe_bo_is_vram(bo))
> +			break;
> +
> +		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> +			break;
> +
> +		if (!backup) {
> +			backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL,
> +						   xe_bo_size(bo),
> +						   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> +						   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> +						   XE_BO_FLAG_PINNED, &exec);
> +			if (IS_ERR(backup)) {
> +				drm_exec_retry_on_contention(&exec);
> +				ret = PTR_ERR(backup);
> +				xe_validation_retry_on_oom(&ctx, &ret);
> +				break;
> +			}
> +			backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
> +			backup_created = true;
> +		}
> +
> +		ret = xe_bo_evict_pinned_copy(bo, backup);
> +	}
> +
> +	if (ret && backup_created)
> +		xe_bo_put(backup);
> +
>  	return ret;
>  }
>  
> -- 
> 2.50.1
> 
