Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADA5C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 04:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03E110E13F;
	Tue, 30 Jun 2026 04:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaP1/Uj6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FAA10E13F
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 04:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782793965; x=1814329965;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D8adUVzMp7KBlfSN7PvYAjNTuFmzJ4xFse0vyMuVN+4=;
 b=VaP1/Uj6uEAZFsXZRonLqiE8MuerkdfSievkqP1/N0Eu9K+fVf0WedMR
 VhGl+Say0hVfqzjxVu9z/7oJ6AeJLeAoVJluExmBWpjtGCosgkD+s+5WH
 xbDtMY7v+47/TR7WQa7T25qCmOS3yrJ3RZ3JJv6cJHT1Fmo3hbVXlLTho
 n8+o+jqTAryUQ8OKbz8cufUhh+TWJt6BQuwQ/XtuNA6/TeaspE3rVPWZZ
 xLRqAVRMjQGaV6/ShYHrAOYz74JqSL9ETSX6unTGQBg5sfXJe/LwzXgob
 f3I0LR28bJQXLZwJaAasszt2KbJD1Hp7l+asCU0W/+wdbLY89OpTK7AYp w==;
X-CSE-ConnectionGUID: uE9VWz4vQ62JLysEogRiGA==
X-CSE-MsgGUID: Lj9dXfGUTxKLGQscNQdJnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87185014"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="87185014"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 21:32:44 -0700
X-CSE-ConnectionGUID: 4nfc/N7cRR6DVWhkv/T/1w==
X-CSE-MsgGUID: WDwWbAO0SA6EaqfaJh1tZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="290273358"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 21:32:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 21:32:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 21:32:43 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 21:32:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4XQlLVhEo4huoVQheF7iDn/GS/pk0LCAwaE/B/0AIWpbXfgshpnaezzbn9w7OgoLyUcnGTCLsPeUbqhyJ6cUIYvDD+CnhDdME+GNVz0G1EeRTPlZDbAUaOY1Ob7pXKdbAieH/JWU+UWyBykgjFpV5hrAlOpZUonKT936tO5NaSJ2ZbbYa31OHWetIOcnRv9DWuEAcZpDdVyj9zTCukx0a5q7KhZsSEZWRPTjdBCbexSsaGqbx2i8+Qyz26DBigsWI7SUla76Fswc13rALESgVmVTviEftgHS2YK1ta2fYXmNrZGVOyA3n12G0k7QWooDIkQGYZytgH9i1B+qQnvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zNmgfayp9dw1XS/OU58WY+tHHHITNPJLMVpwcJAkoo=;
 b=LsT/LbQusDpuBFWedCb6xME79GTxwV/tf441o5Y47c9srQB05qdGeKnfNfbchSM+YPbMzPxyb2zoj1y8LilLRy2ZTRGB1kc9VWMWlcR6ea2LE/N4+krm4vq1ydUe+zDDVacPjkYqaYhxK99HWPJUZvIYt5qL5MuhsGfip42FVqf4dHKIRD+YPFrPkEBKlr1CAc0PSLweqVpuyry1sDk2IlUIo/f2afWUHKt5BrK4LN74dr/gN95vbsQpWLQelKXPU/S8beN4W0ON/6NvvB7RlwCdCgtQqd7dQSRcGBmBSA5iG/RNPxds6RcBs6qraV8SWsJmVgrHirECBhMCkGoVOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7744.namprd11.prod.outlook.com (2603:10b6:208:409::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 04:32:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 04:32:38 +0000
Date: Mon, 29 Jun 2026 21:32:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Message-ID: <akNG5Nv/dp6+m4mP@gsse-cloud1.jf.intel.com>
References: <20260629172239.2377117-1-zhanjun.dong@intel.com>
 <20260629172239.2377117-3-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260629172239.2377117-3-zhanjun.dong@intel.com>
X-ClientProxiedBy: SJ0PR13CA0079.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: b08e95a5-d62b-4edf-33b0-08ded6609dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|3023799007|4143699003|22082099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: c+b/fU2fgTG+JTAjsPJk27hYe4EzEexd9+DSnsTTbPAuEQv0BJNv8tsjxLDRZQr6iZ9doMNeaC2ojpTV3mKQknmoalEkcDRg8JLMipiq00dWWk4eHAavbeXahD0+YDotPz/3P+8NPMgZrZ/Y64hAUIINMs77ZC8B1gqsy8E3DXKOtSflHbd5kmJLOtEbmw4gKc83VEaV9hXBSRVvNE7Tvu9wqSp0O5nQ+ix9AyGRBIcjnXoSa75sSpaMDbNQUexwagOJtKiub7/SdpFVYYezHSiQfPkJ7crBROb/y36PytPJHkW0cvWdy49l8vWQJwVKYu3dVk6nGS0+gFY3roFFPBtoRR7u1hHA9imu/N1JPdJ1j2fdt80CyTOLxhmG5hB0V1SnUf8soSqIS6lCiweuL3bAfAbsMLc/w23jh1g8rctNC/N0fmgfhNZQyj48CwhGFVXIOIKv1LAwFuHbvdE62+Gu9YuUXNycPHjH5Je8/UvJGa6pIhfC0fKqyH49A8XnTjiJjpyfIbaaoOptZwKY08FLR90UxD59hfSKZpoaYVv4nWoEcGjOKUx58ggz6eU3VqSRP3zliFT67365UBLL/aSd9k8UZBjbIl5ffwM90Wkjfvn39eCOxwWW9OuNNRFHFirm4HfX+oeTQiQeRnQqSp/C4EMQPTMwp803NAyjRxY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(3023799007)(4143699003)(22082099003)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LjpJvahERd+VlZVTDB348tZI3XefRUReT3N/4dV4djIfT8MFPBuQbKfg5nmN?=
 =?us-ascii?Q?U5LdAKGlXeMNsoHln56QK7Orx8IXUa30imzMAe3Ro3CRbKY+ichrcs1C2O/V?=
 =?us-ascii?Q?4HPHviBiFaSkJ+In27IHRbkPiK/As9D/NdEN71btlW+tA21WrgDh1Jj9hqHZ?=
 =?us-ascii?Q?TqC3JWeqUNabmOMJ0RRnZWPNHkgIcBIgdwMIRLSMUyLMOtVhU+K2angcSnfh?=
 =?us-ascii?Q?ctwHad1XKMF2HHIv6vZzaZFjxmHUWR63dj5SxJNITMo9qNSxQCmDzsu37Px2?=
 =?us-ascii?Q?1v6nsZrAsQq/Ib+DKZDaWOBhtmD0f0x8PcNttQftIYooZl1rBkccl7b12T7A?=
 =?us-ascii?Q?jM3CCiR69iGkAIlGfV00hGQ0odsIqZs/hq7uNzvPzWkqLyaLoWXxoWcp7rXx?=
 =?us-ascii?Q?Fu2otsJy+sSi+eYWXMBcPDqWs8x+urgTSWgTuNeboYxr7XVGeHCN8YS+AJwh?=
 =?us-ascii?Q?k0nR5QaRIEvtriY9Gjj8pVZrydP+fso7V1sx6W/ShZ1irf8+DhnpOyZXVx+S?=
 =?us-ascii?Q?n0xZLqeBjBgpMFRGvzOV7DNRs6z3gt1+u5qdVm94FkaZJzQOmxX3uc4cRGau?=
 =?us-ascii?Q?5zzGDalwaBtgauSZ8Z88cVqk+ypQwW6rTYieotQFwQyY0JMs/Nyjw2NZgbFx?=
 =?us-ascii?Q?zREGtZlyrC7i7HJ/XteRLW5ll0gpd55jwxvoUwJisIzu1EcUGb9I3rZ4UBHO?=
 =?us-ascii?Q?R2pg6eeUZ+yAD8moZKRRcGbVQ5ZNYwx2mNdQUO0nmqKqixE9KPm3cBXLt/hq?=
 =?us-ascii?Q?YHO5kXb3DBCdgvy7Rqe21FUc5i9Q39ult+z0TbjbSS1mAv2LsgniKLBhJahm?=
 =?us-ascii?Q?898e+TY0yBibVzcTmHfX1zqd7xCj0HsEEr7XBmL9nRDe/wg1bcj4YaatgDCX?=
 =?us-ascii?Q?lDFakufrLYL2sHwA583dJ7K1P5tnQ3LkSubFVO4mH56AtG4wglaeSy4pRI9N?=
 =?us-ascii?Q?3Ew9pkSWqkppFHPjngebjA+25N2pmK8x8FE3zjrazj7H58FgU7r25R03xH+e?=
 =?us-ascii?Q?KR6mTsvNIrlSTgThmoYbfmefGUYg/P4OHMjE3xg6tI9fVdfuINOJ8C+lGtEn?=
 =?us-ascii?Q?ZagOVu1hi+30cFMXpTSYi+Cxb+WPuYND6qyqzfM/6zm+3fRjVhpFgGdUZm1P?=
 =?us-ascii?Q?POOktgoSUR4nV0pxbAvzjNxtKOPSvuYmucDYltznIyJ/mKC0QlzOT92c2uby?=
 =?us-ascii?Q?n3Io4RP57iGK28hirFuM/sfB/o0iWP1qFvxc9NpnAjve3Od6jtgnq1lfgnPh?=
 =?us-ascii?Q?rBqEX25yDv9odYMiNcA5asbsaCvRV5/in1FhTV9vukpkFDSRfdQhDqqRwUxP?=
 =?us-ascii?Q?IjxC+2dRAfhsF0MSxMDsSxVqkn2yQt9wXo+t7tzMR3LO40/qEiZdExUg0esI?=
 =?us-ascii?Q?dQHysItKqk0vhm3gbJRvOybn8qNAQ6QNoSM6uvH68AKc/1xtdMlFQpSRR0Jb?=
 =?us-ascii?Q?UnWMGQ+/cAyNcO5RvfWSRCJxPV3tjM3pZvHfsRXPzX3/yy4GVoTpytFM+8Qa?=
 =?us-ascii?Q?tL2tpss/AJw4X5wyAgWn464q/Kla6qRm1GiiJMZy0TS+HM8NxwL2HTF2rVek?=
 =?us-ascii?Q?fqfdqj5bLAZl48osIDCgWVCKfPxxtt5wjLXbYjuOz8F5SXqL8eTvxNiIyoD2?=
 =?us-ascii?Q?Itk2JVvQv/2Jwbo+z6WXNygyCHFWB4nbwEC4LkIF6i1Z8S42UIC5JEG6IhUd?=
 =?us-ascii?Q?XHiYlMIRTnPpF7Eo1cfUaeYGZapXFDiiJI5isaHYAt3beMDxQmaTBUCAxGPh?=
 =?us-ascii?Q?eqKGKUSWxA=3D=3D?=
X-Exchange-RoutingPolicyChecked: VDiLMe+PH2MlZufoyC+BYZKLrIZPLxp/4xmgTV0kd/DzjBFrCc5WTnzJgurWHUZvxT4oJqK8Q5Zd6TMq4FlEbkvay1ifEHXPtl3KynOwl4Z4//VQGruag42ea+3MdTNMO079oPZ93SuGrFsspG49tXWcCRkTEjmvuYYtuXpYVXfi5CD7RFG9Ff4YS9LhyhY7rfd6qEMjTylugwXXRisnNUUtBDMbjxJg+/sBHjziMcUXLfqdezIeawwIsSOIiJbC1uD4r0nCZOGN0fw/nTqOnFEwN8QcYrpKgeqZ0AmMW2mH072d0kGg6EeTZZr4tEPrT6qBA37f6h3qXA9g18QbRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b08e95a5-d62b-4edf-33b0-08ded6609dc2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 04:32:38.6643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQgavxkRo3lLkSb23geixZ2EszJBeeMewVhWY8igTSwAo11HJULi4HcRpMQNOlZFFpM4TbsB1LRA2DV2tPDjhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7744
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

On Mon, Jun 29, 2026 at 01:22:39PM -0400, Zhanjun Dong wrote:
> Replace the raw ascii85 dumps of GuC log snapshots with a
> zstd-compressed ascii85 stream and reuse the same helper for CTB
> snapshot output.
> 
> Use zstd streaming with default level-3 parameters and an estimated
> source size of 0 so the compression workspace stays bounded even for
> multi-megabyte logs.
> 
> Add a new Kconfig option DRM_XE_COMPRESS_DUMP to control whether
> GuC log and CTB dumps are compressed with ZSTD. This allows users to
> choose between reduced dump sizes or lower memory usage.
> 

What is the advantage of doing this the KMD vs. getting the dump and
compressing it in user space before sharing it?

> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig          |  16 +++
>  drivers/gpu/drm/xe/xe_devcoredump.c |   4 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c      |  19 ++--
>  drivers/gpu/drm/xe/xe_guc_ct.h      |   4 +-
>  drivers/gpu/drm/xe/xe_guc_log.c     | 161 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_guc_log.h     |   9 +-
>  6 files changed, 184 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 4d7dcaff2b91..3af15a0c14f7 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -33,6 +33,8 @@ config DRM_XE
>  	select ACPI_WMI if X86 && ACPI
>  	select SYNC_FILE
>  	select CRC32
> +	select ZSTD_COMPRESS if DRM_XE_COMPRESS_DUMP
> +	select ZSTD_DECOMPRESS if DRM_XE_COMPRESS_DUMP
>  	select SND_HDA_I915 if SND_HDA_CORE
>  	select CEC_CORE if CEC_NOTIFIER
>  	select VMAP_PFN
> @@ -101,6 +103,20 @@ config DRM_XE_PAGEMAP
>  
>  	  If in doubt say "Y".
>  
> +config DRM_XE_COMPRESS_DUMP
> +	bool "Enable ZSTD compression for error dumps"
> +	depends on DRM_XE
> +	default y

Are tools to decode GuC logs updated to handle this mode?

Matt 

> +	help
> +	  Enable this option to compress GuC log and CTB dumps with ZSTD
> +	  compression. This can significantly reduce the size of error dumps
> +	  but requires additional memory for compression workspace.
> +
> +	  Disable this option if you want to save memory or prefer uncompressed
> +	  error dumps for debugging.
> +
> +	  If in doubt say "Y".
> +
>  config DRM_XE_FORCE_PROBE
>  	string "Force probe xe for selected Intel hardware IDs"
>  	depends on DRM_XE
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 5f2b90b18f97..27473c25aad2 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -115,9 +115,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
>  	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>  
>  	drm_puts(&p, "\n**** GuC Log ****\n");
> -	xe_guc_log_snapshot_print(ss->guc.log, &p);
> +	xe_guc_log_snapshot_print(ss->guc.log, &p, ss->gt);
>  	drm_puts(&p, "\n**** GuC CT ****\n");
> -	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
> +	xe_guc_ct_snapshot_print(ss->guc.ct, &p, ss->gt);
>  
>  	drm_puts(&p, "\n**** Contexts ****\n");
>  	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 21e0dad9a481..4cedbcdb831e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -2094,11 +2094,12 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct)
>   * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
>   * @snapshot: GuC CT snapshot object.
>   * @p: drm_printer where it will be printed out.
> + * @gt: GT structure for error reporting
>   *
>   * This function prints out a given GuC CT snapshot object.
>   */
>  void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> -			      struct drm_printer *p)
> +			      struct drm_printer *p, struct xe_gt *gt)
>  {
>  	if (!snapshot)
>  		return;
> @@ -2112,11 +2113,10 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>  		drm_printf(p, "\tg2h outstanding: %d\n",
>  			   snapshot->g2h_outstanding);
>  
> -		if (snapshot->ctb) {
> -			drm_printf(p, "[CTB].length: 0x%zx\n", snapshot->ctb_size);
> -			xe_print_blob_ascii85(p, "[CTB].data", '\n',
> -					      snapshot->ctb, 0, snapshot->ctb_size);
> -		}
> +		if (snapshot->ctb)
> +			xe_guc_print_blob(gt, p, "[CTB]", "[CTB].data",
> +					  &snapshot->ctb, 1,
> +					  snapshot->ctb_size, snapshot->ctb_size);
>  	} else {
>  		drm_puts(p, "CT disabled\n");
>  	}
> @@ -2150,9 +2150,10 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
>  void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>  {
>  	struct xe_guc_ct_snapshot *snapshot;
> +	struct xe_gt *gt = ct_to_gt(ct);
>  
>  	snapshot = guc_ct_snapshot_capture(ct, false, want_ctb);
> -	xe_guc_ct_snapshot_print(snapshot, p);
> +	xe_guc_ct_snapshot_print(snapshot, p, gt);
>  	xe_guc_ct_snapshot_free(snapshot);
>  }
>  
> @@ -2250,10 +2251,10 @@ static void ct_dead_print(struct xe_dead_ct *dead)
>  	drm_printf(&lp, "\tTile: %d\n", gt->tile->id);
>  
>  	drm_puts(&lp, "**** GuC Log ****\n");
> -	xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
> +	xe_guc_log_snapshot_print(dead->snapshot_log, &lp, gt);
>  
>  	drm_puts(&lp, "**** GuC CT ****\n");
> -	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
> +	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp, gt);
>  
>  	drm_puts(&lp, "Done.\n");
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 767365a33dee..2005d1a0cd6c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -10,6 +10,7 @@
>  
>  struct drm_printer;
>  struct xe_device;
> +struct xe_gt;
>  
>  int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
> @@ -24,7 +25,8 @@ void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
>  struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
> -void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
> +void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p,
> +			      struct xe_gt *gt);
>  void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>  void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 538d4df0f7aa..d20be1a064f1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -6,6 +6,9 @@
>  #include "xe_guc_log.h"
>  
>  #include <linux/fault-inject.h>
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +#include <linux/zstd.h>
> +#endif
>  
>  #include <linux/utsname.h>
>  #include <drm/drm_managed.h>
> @@ -225,16 +228,148 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>  	return snapshot;
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p,
> +					 const char *length_label, const char *data_label,
> +					 void **chunks, int num_chunks,
> +					 size_t chunk_size, size_t total_size)
> +{
> +	zstd_parameters params;
> +	zstd_cstream *cstream;
> +	zstd_out_buffer outbuf;
> +	size_t wksp_size, dst_size;
> +	size_t remain, ret;
> +	void *wksp = NULL;
> +	char *dst = NULL;
> +	int i;
> +
> +	/*
> +	 * Pass 0 as estimated_src_size to use zstd level-3 defaults
> +	 * (windowLog=18, 256KB window). Passing the full total_size would
> +	 * cause zstd to inflate windowLog proportionally (e.g. windowLog=24
> +	 * for a 19MB log), making the workspace tens of MB.  With 0, the
> +	 * workspace stays ~1.5MB, well within kmalloc limits.
> +	 */
> +	params = zstd_get_params(3, 0);
> +
> +	wksp_size = zstd_cstream_workspace_bound(&params.cParams);
> +	wksp = kvzalloc(wksp_size, GFP_KERNEL);
> +	if (!wksp)
> +		goto err;
> +
> +	dst_size = zstd_compress_bound(total_size);
> +	dst = kvzalloc(dst_size, GFP_KERNEL);
> +	if (!dst)
> +		goto err;
> +
> +	cstream = zstd_init_cstream(&params, 0, wksp, wksp_size);
> +	if (!cstream) {
> +		xe_gt_err(gt, "failed to init zstd cstream\n");
> +		goto err;
> +	}
> +
> +	outbuf.dst = dst;
> +	outbuf.size = dst_size;
> +	outbuf.pos = 0;
> +
> +	remain = total_size;
> +	for (i = 0; i < num_chunks && remain; i++) {
> +		size_t size = min(chunk_size, remain);
> +		zstd_in_buffer inbuf = { .src = chunks[i], .size = size, .pos = 0 };
> +
> +		while (inbuf.pos < inbuf.size) {
> +			ret = zstd_compress_stream(cstream, &outbuf, &inbuf);
> +			if (zstd_is_error(ret)) {
> +				xe_gt_err(gt, "zstd_compress_stream failed: %s\n",
> +					  zstd_get_error_name(ret));
> +				goto err;
> +			}
> +		}
> +		remain -= size;
> +	}
> +
> +	do {
> +		ret = zstd_end_stream(cstream, &outbuf);
> +		if (zstd_is_error(ret)) {
> +			xe_gt_err(gt, "zstd_end_stream failed: %s\n",
> +				  zstd_get_error_name(ret));
> +			goto err;
> +		}
> +	} while (ret > 0 && outbuf.pos < outbuf.size);
> +
> +	drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
> +		   length_label, total_size, outbuf.pos);
> +	xe_print_blob_ascii85(p, data_label, '\n', dst, 0,
> +			      DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32));
> +	goto out;
> +
> +err:
> +	drm_printf(p, "%s.length: 0x%zx Algo: ERROR (compression failed)\n",
> +		   length_label, total_size);
> +out:
> +	kvfree(dst);
> +	kvfree(wksp);
> +}
> +#endif
> +
>  /**
> - * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
> - * @snapshot: a snapshot of the GuC log
> - * @p: the printer object to output to
> + * xe_guc_print_blob - Print binary data (compressed or uncompressed) as ascii85
> + * @gt: GT structure for error reporting
> + * @p: drm_printer for output
> + * @length_label: label prefix for the length/metadata line (e.g. "[LOG]" or "[CTB]")
> + * @data_label: label for the ascii85 blob (e.g. "[LOG].data" or "[CTB].data")
> + * @chunks: array of pointers to source data chunks
> + * @num_chunks: number of elements in @chunks
> + * @chunk_size: nominal size of each chunk; the last chunk may hold fewer valid bytes
> + * @total_size: total uncompressed byte count across all chunks
> + *
> + * If CONFIG_DRM_XE_COMPRESS_DUMP is enabled, compresses @total_size bytes using
> + * zstd level-3 streaming compression and prints the result via @p using ascii85
> + * encoding. Otherwise, directly prints the uncompressed data.
> + * On failure the function returns without printing the data blob.
>   */
> -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
> +void xe_guc_print_blob(struct xe_gt *gt __maybe_unused, struct drm_printer *p,
> +		       const char *length_label, const char *data_label,
> +		       void **chunks, int num_chunks,
> +		       size_t chunk_size, size_t total_size)
>  {
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +	xe_guc_print_blob_compressed(gt, p, length_label, data_label,
> +				     chunks, num_chunks, chunk_size, total_size);
> +#else
> +	/* Compression disabled, output uncompressed data directly */
>  	size_t remain;
>  	int i;
>  
> +	drm_printf(p, "%s.length: 0x%zx Algo: RAW\n", length_label, total_size);
> +
> +	/*
> +	 * Print each chunk directly without merging into a single buffer.
> +	 * xe_print_blob_ascii85() supports multiple calls - use suffix=0
> +	 * for all but the last chunk to omit the newline between chunks.
> +	 */
> +	remain = total_size;
> +	for (i = 0; i < num_chunks && remain; i++) {
> +		size_t size = min(chunk_size, remain);
> +		const char *prefix = i ? NULL : data_label;
> +		/* Add suffix only on the last chunk */
> +		char suffix = (remain == size) ? '\n' : 0;
> +
> +		xe_print_blob_ascii85(p, prefix, suffix, chunks[i], 0,
> +				      DIV_ROUND_UP(size, sizeof(u32)) * sizeof(u32));
> +		remain -= size;
> +	}
> +#endif
> +}
> +
> +/**
> + * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
> + * @snapshot: a snapshot of the GuC log
> + * @p: the printer object to output to
> + */
> +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
> +			       struct xe_gt *gt)
> +{
>  	if (!snapshot) {
>  		drm_printf(p, "GuC log snapshot not allocated!\n");
>  		return;
> @@ -248,16 +383,9 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>  	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
>  	drm_printf(p, "Log level: %u\n", snapshot->level);
>  
> -	drm_printf(p, "[LOG].length: 0x%zx\n", snapshot->size);
> -	remain = snapshot->size;
> -	for (i = 0; i < snapshot->num_chunks; i++) {
> -		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
> -		const char *prefix = i ? NULL : "[LOG].data";
> -		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
> -
> -		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);
> -		remain -= size;
> -	}
> +	xe_guc_print_blob(gt, p, "[LOG]", "[LOG].data",
> +			  snapshot->copy, snapshot->num_chunks,
> +			  GUC_LOG_CHUNK_SIZE, snapshot->size);
>  }
>  
>  static inline void lfd_output_binary(struct drm_printer *p, char *buf, int buf_size)
> @@ -598,12 +726,13 @@ void xe_guc_log_print_dmesg(struct xe_guc_log *log)
>  void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>  {
>  	struct xe_guc_log_snapshot *snapshot;
> +	struct xe_gt *gt = log_to_gt(log);
>  
>  	drm_printf(p, "**** GuC Log ****\n");
>  
>  	snapshot = xe_guc_log_snapshot_capture(log, false);
> -	drm_printf(p, "CS reference clock: %u\n", log_to_gt(log)->info.reference_clock);
> -	xe_guc_log_snapshot_print(snapshot, p);
> +	drm_printf(p, "CS reference clock: %u\n", gt->info.reference_clock);
> +	xe_guc_log_snapshot_print(snapshot, p, gt);
>  	xe_guc_log_snapshot_free(snapshot);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 4649a260755e..3e97647ee8b5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -11,6 +11,7 @@
>  
>  struct drm_printer;
>  struct xe_device;
> +struct xe_gt;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>  #define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_16M
> @@ -59,7 +60,13 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>  void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
>  void xe_guc_log_print_dmesg(struct xe_guc_log *log);
>  struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
> -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
> +
> +void xe_guc_print_blob(struct xe_gt *gt, struct drm_printer *p, const char *length_label,
> +		       const char *data_label, void **chunks, int num_chunks,
> +		       size_t chunk_size, size_t total_size);
> +
> +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
> +			       struct xe_gt *gt);
>  void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
>  
>  static inline u32
> -- 
> 2.34.1
> 
