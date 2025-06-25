Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5855C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 14:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27E110E73D;
	Wed, 25 Jun 2025 14:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cieTwGDl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768DF10E73D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750861302; x=1782397302;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k2SmdBzB+2z+/cqpnPK/4OuYGQSAKWtaDQNl4Cu4Dew=;
 b=cieTwGDlGD11/Ggy3BH19uwbedxOWMTY/JQswqunBEPnYZWbIyC19kOq
 56W7pVVsy0WuVAyEEdm6e/onc017bRZJJ03vQEv27ePFZJqtnKtLywHYe
 oftroZ76HmYQzCMKM/WUouGzxTVn09EInYzMynhdFn/Xz4W8n+CWNSM/s
 aCZ+mnxy09XNK+kZXCxYq1tYWqfiw/ETkWLY47+3YcBhKUxrWUqvTzBow
 VNAD9JFkM3EH9UHXpesA8/o7eUqB4+Rxs/hFjiKWmiqbnjhf194Qj+eHQ
 MgzvxMolHB78ZFP6mlF9iRDKr3RHZxovwqLVbX7gRJjvHC6GhFY8h5pEm w==;
X-CSE-ConnectionGUID: 0qviuDoeTSK8YcjG+r0bsQ==
X-CSE-MsgGUID: wilalif5QOmZb58/LL1ZfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64489950"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="64489950"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:21:42 -0700
X-CSE-ConnectionGUID: S5LtnP8TQnqiEz2eS9IuEw==
X-CSE-MsgGUID: Xs/L4LG7QECp1k9/Ecrapg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="152362443"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:21:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 07:21:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 07:21:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.79) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 07:21:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8j5SU00VLtifz7YE0Khyo/vSsY4TnEHJ6Axy//O8AZekcqYnMz/0akhy/0BjVoetxtYAHIdD9WHugUsqXOifdNEShqM6W4yrfDwDvyCoeqWR2F0u6+r8mStLOvbs3yHc2u0y75AmJVUmZpOV3niOgi5runVzVzt1iqy6YULwvTNSM16PJfehRi0od4eoPkLVtt8KzGLnWF21Pr6pdNRJ0P1H5L0YhmvyKZdSnhSIRzzPajbvGw+QqmMz1i/rfLIONFyT/NeeMK9IymtM2W21E8jNJC/sHbmGVe9YSEw7lUzp6Gji+cfoTRUUToWVpel+Hupkm8NAfi5Rh8W6e/5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7NXRvRq8dERAoCx/LwZDU6iP0GcT6d0KZnOogfUcgQ=;
 b=NN9w2NgKW2RID7k+m5xBw0oW3GCv4kMx4RPa2dxIXQXi5pvqXxwYjgljiG1uFXsYRrfBG2uUxbjLRkpfoZn3q5YMCiq2KydGBVMxxYv1hpjegqzG3U4wWV1S2HW77hMspx9AuvR/dmpj5PMl3VIBd95XMKAPR6FNh6Bi3w+GWCIa3SZYzEk5jFmG+MZKiBkDE88lQVikGJnFiEIpJAemM2R1s4ruli7TcLhtthLrC7SUl2Mh3cmuKewS50ujVf3SDvTUsVS4eYWnTulrQb0wyctKw671G289QqTGwSbDXiicmakDaq6Xhhb/yGatDo6cS9Hpo9GXsLdmYKcLp3Q6RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6651.namprd11.prod.outlook.com (2603:10b6:510:1a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 14:21:33 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 14:21:32 +0000
Date: Wed, 25 Jun 2025 10:21:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <matthew.brost@intel.com>, <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>, <joonas.lahtinen@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Message-ID: <aFwF53I_d8OkwI3_@intel.com>
References: <20250625095805.1390907-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250625095805.1390907-1-nitin.r.gote@intel.com>
X-ClientProxiedBy: SJ0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b48dc9-08da-4a01-0535-08ddb3f39534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RXdr2Esp4UyWe0sBRB4bj9MB5V7DJv8b7DE51atG3ShAnZooULCLUIoz7Xkl?=
 =?us-ascii?Q?97vbU6Ys6nBruxDxphrCqToSITmqMq8+4zqN8xm7GlBh7UE0DRLljeUED2mD?=
 =?us-ascii?Q?j+cTi9Ett05EHeP67ByPLs3ub7ydOFx6FWNgk4/YXetylHwF+JprIHiHI9mu?=
 =?us-ascii?Q?QTS9pxsvUXxsrnGrOGoL3v0T+qmSeywZQlLhNpkQjTQPxoXYoCvf98qgqipd?=
 =?us-ascii?Q?EqSHbHnlVwA0Xw/kyKmc5+3ROfagTVimu6+fCrUnk54tvey3I8XtfssxI48G?=
 =?us-ascii?Q?04V8gYfchXb2IJwKvZx+xz8lTWeFR3nKMdSlpdN1zv7MMAW7JQPfH3O12SOg?=
 =?us-ascii?Q?lqCdh1DMzXVZtVg259BDt3KNtmvUTHynA53I1ypiK0cM0CNU6S0yctIjK2aN?=
 =?us-ascii?Q?Kaw3N1i3TWFhmXqLtqMMoOEqVWTZVWFBlkUk0N+4PYodfiLv05kXSwwqv5yz?=
 =?us-ascii?Q?uY3HaovpnPXwALQhPyCsLRs9sDNRn2eWmG5a7+4lqY0+ackNcAY6XbVF9rE0?=
 =?us-ascii?Q?qC6mB1FVLYTNM1EkyqT2fQFc4wPD/kEk10/cAC+MlkOAS3gSjRXIfFpS5C1G?=
 =?us-ascii?Q?lR72s3THVRQDXZKnhtjFQHyDVjehKSxNh5WqCKHgvleD/a8gT/xC+rSYf+p1?=
 =?us-ascii?Q?Fs043CP+bb7N9Oe2BYtbOqGy1i0V7UJRRaT2v9nsut6n7457VmMd7FdzyrwM?=
 =?us-ascii?Q?4bmeEc+qXIuhRjeElp5s4YlFv7Wx5HkOy9zx8d8g+vEAzKi8lBxv/sd1Eni2?=
 =?us-ascii?Q?YyVLsnXA+/QlAg9gNZhg6o7tF27S7S/QTsv2tCXlFRkLTNStsCSwhDHwbkle?=
 =?us-ascii?Q?worY5A6J17piy49E161pDkkW5cv8T10KIA6b6IV4HRYLlYlLnKjJFuwiKoPF?=
 =?us-ascii?Q?L13/3XrkmKFep+ObPjdmwCloda+30nd9xSKf8K1SrNM4FhiOWZEkiET4ENju?=
 =?us-ascii?Q?PEIujYQRLLI8Y+TvWWBoGU5sKSDuMhzIvH28DF0RpOTc7iYtdDH2eSkbEFv3?=
 =?us-ascii?Q?GYeE5akjt709H2zGtVLkQiCQbTUNArBTZcPBriljGpLu7qZFMqxCK38BZIQj?=
 =?us-ascii?Q?OXVUN/RJI0tc567YxhVgK83tOlRHOkpEuCGo/dJlbAKHfPOWCBNEJai7Zxxl?=
 =?us-ascii?Q?fGR4WuynnewaCqkqxBOVjWThwxRxg9VJQfiZgCxLf234IYSFtnAKAkW/CPFA?=
 =?us-ascii?Q?P1vkPHXd2TwDVM6d0ixBERKmG3f0p3tFvuNkgDg0zW1fjZ277q3y1TR4FEr/?=
 =?us-ascii?Q?/PbT/dbUB0DSgTublwpCpU/r3Tvd4B6WloikgdW9PsXj8044QhACjj/UlBmD?=
 =?us-ascii?Q?dUoNvNC14PGtWMrcP7EaRjyssOoKxs2FTkEcqe5abXTbHtPBB0PtI5ryLqlO?=
 =?us-ascii?Q?44u1Iu1WTJ65JIel/OjK3AX2sADSDk+1n2T03XS33FEPKT9oNFVhXZQoO1pd?=
 =?us-ascii?Q?PHLyJpHK7uQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5GXG2YAF9AUbIvahvm/7J1UECdX8GsFOQqz2g1G5tWPsoyU4kVZtEosdpr2T?=
 =?us-ascii?Q?/AojXIsb5IP3t6Wy2AiYBKXD8NXSBFvjDdhMtSkAC3bpjQnfgz7ZpsEgapOL?=
 =?us-ascii?Q?ZON6z7wb67fj0/ofFpZBcUv5m1TsCxlT9JWX5a6nzvRXCGSseN8UtuEMOw7R?=
 =?us-ascii?Q?3lWMKE2XR8wAEeXsW3isO1ifauqTFJJXIXL80oug7oslgYa81d5UeYm7BGWJ?=
 =?us-ascii?Q?NB88GZ0Ls2R72ZnW9Phm/wduYNeA/Xn0yPXLlIu4KOms6JlHCvVLSGP5hv9t?=
 =?us-ascii?Q?h9iV6Jzdh7ixNaswqQyoyQbz98jgXPg7w0N4CKdDlrQie1XH4QblDcpyCCch?=
 =?us-ascii?Q?8LokdSvRHjHSOfJjRjtOS59h32a38ESkif/dAhnGeehkqUHoP4sSibDWj0ek?=
 =?us-ascii?Q?IJcG8Ajx9k5ETnNJColWOHNlpv9CozxPxLQyUGBLEkOhCQyLJFxNkV5/OMe3?=
 =?us-ascii?Q?R7EkQ08hbdjjPPkkKGOd0HfptzLiNKGQBuLGIN47OJMaF0IeUhFxMzL3SPat?=
 =?us-ascii?Q?N2vVmVqMvUNheOq52BlkHPRTIBXKj/Im3PIZIQzjHfvGMkbagLPvyTrzj58y?=
 =?us-ascii?Q?tag1mOCfE0lfMdJWa9+BxL6t5QR22pBazXbn1SaVVwIHmgB+VlmUk6EgHIUA?=
 =?us-ascii?Q?/bCjzAzcJZceoOKP8r2ZfNDaRizEkDhdZsHJ5CYkZ7w4hsMVsAxSedbFmD1r?=
 =?us-ascii?Q?lWvKCLrSd9FENk5DUBZvKhC1bgBmISz60OUHc61+RA+gTCUuKEFy8DCL1X6W?=
 =?us-ascii?Q?lsOrkJBPvisVMO93OOlTnFaqjN72/nCcfhyr9BA2lE1pwO4xvpZ+1OLdq2rL?=
 =?us-ascii?Q?XsDgr5PRh24ds8g8Nijb/+hwlk98FCaDxKVf9WD6nnAVZe9Nh3DLDcR8P0zL?=
 =?us-ascii?Q?etZuts61g281ZrxuAQIlLu94riIX1st2Sv7+soGpIozXlSscmf010D8+T6ci?=
 =?us-ascii?Q?Nwb8Ix6RsG8kcQ71g7ZRrtWTsZmxikwbw2OUUz6TuE8G0K+lhgF8feB2pWJJ?=
 =?us-ascii?Q?oTGQOjMYfNZD5QuHlLxD+t/vYHp3MPjyxvDMh7ClU78D8GBzIvooZE1WHxuI?=
 =?us-ascii?Q?h1CWCXq7gWWUIJTP2HDQEwxI4oYZj/157ABRkjuHd4bFwhuGs+b6xXG7GAPl?=
 =?us-ascii?Q?gs1E2WsZkUr4CrUCqvH33B/1sTbzFuISTw2AF8l2fi7L6bk/wwZlhdBeWSjB?=
 =?us-ascii?Q?wwavP54INiLoUh+1H0ogIF5HLzpHwLk7w6hafiAigbyJWSgpPWbETV0ry8/Q?=
 =?us-ascii?Q?D9k+fXhb5XyjH/ujwjiLNZ6P9uz30IbZ20Espdd2Fcxjf9fWAIBLlxR/DlR7?=
 =?us-ascii?Q?5+dIWJ9uY/l+9Zxtdnyrwv54xZ2UnPchQKJh6AtM+Nd2fj7g2R7Xbm9ZZVUz?=
 =?us-ascii?Q?SkGt2oM4YGhARkUVN95+paQwqgA1a5yBYYewjVWmq7jBRJdbi4hN/x0DQiao?=
 =?us-ascii?Q?WU/TAKcB2fnppSNw/HALbS/XhgU0Gxyx0E8b1xMHUZii9l92uykDefigtgtY?=
 =?us-ascii?Q?TrkbVoKlV0KMKuRtNBztH3ieXJwibZaGDL+I8q9uxNHEurDUyFSst4ClRGF9?=
 =?us-ascii?Q?z4Uhas27MprMyIyvXsMFXeshmDv14zdKnM3eK5lY4S7QkNKx2d5n7YcOQW6c?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b48dc9-08da-4a01-0535-08ddb3f39534
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 14:21:31.9802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYrkq/fVs9IA9Gf5YJD0EFO7s3oDS8y5gmgn1l7Y3JHh5k9I35y5Tcrr3Kn1m4TyBStginsqqQoMsRev+lh7WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6651
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

On Wed, Jun 25, 2025 at 03:28:05PM +0530, Nitin Gote wrote:
> Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY device query flag
> which indicates whether a device supports DIS_NULL_QUERY (Disable null
> anyhit shader query mechanism). The intent is for UMDs
> to use this query and opt-in DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY flag
> to disable null query mechanism for anyhit shader by setting
> DIS_NULL_QUERY bit of RT_CTRL register for Xe2.
> 
> v2:
>    - Use xe_rtp_match_first_render_or_compute() api to check
>      render_or_compute. (Tejas)
>    - Validate args->flags (Tejas/Matthew)
>    - Add proper kernel-doc for both DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY
>      and DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. (Matthew)

Matt asked for full spelling of DISABLE, no?!

Also, where are the UMD patches/merge-requests for this? And their ack?

Thanks,
Rodrigo.

> 
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 11 ++++++++++-
>  drivers/gpu/drm/xe/xe_query.c      |  3 ++-
>  include/uapi/drm/xe_drm.h          | 12 ++++++++++++
>  3 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index fee22358cc09..ef8b49d2242a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -26,6 +26,9 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  #include "xe_pxp.h"
> +#include "xe_gt_mcr.h"
> +#include "regs/xe_gt_regs.h"
> +#include "xe_rtp.h"
>  
>  enum xe_exec_queue_sched_prop {
>  	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
> @@ -597,7 +600,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	u32 len;
>  	int err;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags & ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
> +	if (XE_IOCTL_DBG(xe, args->flags &
> +	    ~(DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT | DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY)) ||
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
> @@ -693,6 +697,11 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		}
>  	}
>  
> +	if (((GRAPHICS_VER(xe) >= 20) && (GRAPHICS_VER(xe) < 30)) &&
> +	    (args->flags & DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY) &&
> +	    xe_rtp_match_first_render_or_compute(q->gt, q->hwe))
> +		xe_gt_mcr_multicast_write(q->gt, RT_CTRL, DIS_NULL_QUERY);
> +
>  	q->xef = xe_file_get(xef);
>  
>  	/* user id alloc must always be last in ioctl to prevent UAF */
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index e8e1743dcb1e..c5002b8c9ac0 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -344,7 +344,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
>  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> -			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> +			(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY |
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY);
>  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 8e8bbdec8c5c..7c30e707346c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
>   *      has low latency hint support
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
>   *      device has CPU address mirroring support
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY - Flag is set if the
> + *      device has null query support for anyhit shader.
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>   *    required by this device, typically SZ_4K or SZ_64K
>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -415,6 +417,7 @@ struct drm_xe_query_config {
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY	(1 << 3)
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -1270,7 +1273,16 @@ struct drm_xe_exec_queue_create {
>  	/** @vm_id: VM to use for this exec queue */
>  	__u32 vm_id;
>  
> +	/** DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - \
> +	 *	Flag is set if the device has low latency hint support
> +	 */
>  #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> +
> +	/** DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY - \
> +	 *	flag is use to disable null query check for Anyhit shader
> +	 */
> +#define DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY	(1 << 1)
> +
>  	/** @flags: flags to use for this exec queue */
>  	__u32 flags;
>  
> -- 
> 2.25.1
> 
