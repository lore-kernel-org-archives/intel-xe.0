Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AED9C531C9
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jul 2026 16:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD12D10E48C;
	Mon, 27 Jul 2026 16:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tj/EGBc+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A620110E48C
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jul 2026 16:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785170490; x=1816706490;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=F5gTf7SI2bsWlT6Wgag04XzXvYJDlA3+NSxwcD+T1qg=;
 b=Tj/EGBc+T8lSrmumz56XiPBS1OGuus8soo9t3b8MvC78gzykzLSCoQmk
 4mZWKh77HttyCtNUXzENyHxfmjBeQ8zqPhNLZE5O2PrziN5omPEuQndpF
 axJ8QN1FnLBdrnVrJdCvucCvyvd5oDKnWzxxkFn2fxRSCHrkPT4pDiHzA
 5VU90M0uEz0bg6Kyb5rrwG2/EIkxOxL3YqSAsFCAirdnHpI1TdYN5zolA
 ToMyD57O/yegGMZIWG8Ig0bSiK7v2yagKlFazFonVGg11cTSI2wzbTItn
 PgGDgbzvxvWM1HaJYnfVR9lyuQVDWi6jOOq0wTWi2gRJeb8fzMn/k/tIb Q==;
X-CSE-ConnectionGUID: TTL4nAKwRCmGWHOAp0EiDw==
X-CSE-MsgGUID: pBhC7go5S+GFKk7WvbmOmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="84721774"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="84721774"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 09:41:30 -0700
X-CSE-ConnectionGUID: tQSXF5dyQZ2MuX9qgpgDrw==
X-CSE-MsgGUID: ojW/TsiSR7yDonnQENYIUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="263239745"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 09:41:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 09:41:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 09:41:29 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 09:41:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLork/Z9IP0FnVUWCVmqfRGcVBI+L+BtthdMMWkWNcBKXqlpIHjTeDleuubKL7vpRHyUS75TjwEciyckxrGdtb3gfKjspeZypPpAgUxwEIcXjTuehvF8kIqRre/e4nQae7MMULRoi1I3nPQeMc5j3w2e6ILPq2lak9aJTAd4n3FSOnxW5YQ03yeHlvxyl3NhNtDu66y6aIMiiWGDxJC7cKxgGFI9NDuH+93GwEYX6/Cs92pz9T23MbdfMjGpqkQFLvK+s8SfNh4JxOOyj4E6Nlb6OiRRG59uqnW6VbHDlTpw7NZcIr8e9E5214BNnMBPLn5SBz1aKLiOAE6jMZggUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRfvxqOhH6R49Wq+vAvgXmVOBhtyOJXpqjWg1L23aV8=;
 b=aEZMwy219HcLf2VKcIXe2NODxOQ10cVcfPuICgfeF8zFSK2z5kz7LxaXdscMVKjFTCQ5Y1PfBL4Mz/GJVamuwNErI1hmFJaEbvP7G5iuDvKT1NZwXHDiTcConMaiewJHpDGEY9dhv5k5L1sz8lmh6TQDDd4nNJL14OyVB8f/l4ue3CAcV/IuJiAf4BiKT2r/746HOl1MaXrxR9zYz5MFZeWndE479RCVZeyx/+p39rOyGmi+4hpt8UO/Aslyr4kQLkFT4uLhygHh5ezilyFUm23ggq3OXsSwemeLENA8RhNWRqlaFPJ0iFpJ8Sllvp6mq934v9Lm2/R/SwaPY/2SUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 by DSSPR11MB9642.namprd11.prod.outlook.com (2603:10b6:8:377::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 16:41:27 +0000
Received: from PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266]) by PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 16:41:26 +0000
Date: Mon, 27 Jul 2026 18:41:22 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Copilot
 <223556219+Copilot@users.noreply.github.com>
Subject: Re: [PATCH v8 03/12] drm/xe: Thread prefetch of SVM ranges
Message-ID: <ameKMjpyQQuDWL5X@fdugast-desk>
References: <20260724232601.1753977-1-matthew.brost@intel.com>
 <20260724232601.1753977-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724232601.1753977-4-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0218.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::13) To PH8PR11MB9534.namprd11.prod.outlook.com
 (2603:10b6:510:39f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB9534:EE_|DSSPR11MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 55269bdd-663d-468c-d476-08deebfde6f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|4143699003|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3/Es1kyenK1ojDWxtTZfH2aIdHf1Rt2m+TLs3yX4PjjxrWrQsWYPmE4Gnnf0VcKKrYUlEphBOT0U3de4ALQPgQRMkyEDe92N/xZXkMpixc/PFaPdpnM2DL4Yz0SQ3vmhAkMQC89ugRm0A9OM96jaWVhLJlx+LkQppUJsx9OU7LhiSz7mdEvk1BCqO0DYV/OwxKiGcUrXHgMKxivGHVsz42wgFKJDHu5Ily8iu6IA9cVv9wn1gSPsmmjsit0HyGJFpLLY+8/MyOv/Fr1yslJwnUMKLh4wMR/9pHGZqq3bzr3INGbTzKPpOkq+2iE0hyEqofGu/BGw00rTnbRSPWcD2bZgX09I90bVOs9OiM57q4yxtgJCDr6k+Mq+Glr7NoWlky4D2mQLoC7m9Urcs8wmKgcSkWl3q6hs937PD7Sjx+ckoO0sDtyRXHDPpD6m8TnuMCW27D+KOeEinWzlx3MwN6qZun7L1CSBb5V3J3SZOZckncDxzt9TEYPOvqLpCpJJz7wSD5yTIO8O+72Bvg9T+l28JxCokIu14VMtpxQvWa89PQT9HWd9iOZdh3/aVqNpuJj+kgLXxklO9G1vWaVClqpd5AC+glm+D/hqXDDJROaFvygxreVvOVkuLd5rzpiQ6kqvi4tbsSZhJHw/JD2/Djd8giH6mxwBtm+7S8V1r50=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB9534.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SwiSQlmiYcCxTgr1KDmyzb6UeuOq9+7eXg2Y9NK0TderXmEuHp6LaUsiOt?=
 =?iso-8859-1?Q?ZpEcOWqNeswJXY5SedMa+Jnbjq2BIZgXre7lw6aeQY8tuVZT4HddWISblH?=
 =?iso-8859-1?Q?Z8fO2woxuqjjyWhUnDVvUnQxxcMBnJKyntz7IPTA1yNEcxmiucfcqqCiXy?=
 =?iso-8859-1?Q?ZD3eGBJxJ8DwiIxcH/L9Hi9R77zBQyzFQqH/LVlvBMysbp3TCNV+aji2jU?=
 =?iso-8859-1?Q?VsEqX+G8SzI3l7ubDiqoQ0qjb0gOVF1r/SDfCE9tMXfpeNaXYfEfJ48OEi?=
 =?iso-8859-1?Q?oEHo8j/a8i90Tj2s2krZvEW344+iAUPL2pqAHne9cm8s3VBdMTTLUZwqjv?=
 =?iso-8859-1?Q?SipD26aFc3955tu4OXgqqK0YJadOkykHR8G558rySPPONKy03am2uqD/74?=
 =?iso-8859-1?Q?ZxHV4EJOAQ6Ch4kzhZ9qx0/cFAHswG3WDdcjd+J/DBnLEm4ctkwC+rN8eF?=
 =?iso-8859-1?Q?NHjJTm/hcXGfK3HAEkPL+PKziapOsCIfyjKc5eHEk4kOIMyEUtFtbrIVQU?=
 =?iso-8859-1?Q?NOmIevPM/G2vurjigr359LXFaOQ/dnuOi17zmVsvLCS9xdZbxnFn2JlkYr?=
 =?iso-8859-1?Q?gt+MsCdCloMEerKg+oDqPTYJnH63uFW7A96SRhQGZttVy1u7RKy5dbcXjJ?=
 =?iso-8859-1?Q?EuftBETjL472fojoCmkpURwrXfeK2YHDujHji1EpGUCR5C9ibypCbTE+KJ?=
 =?iso-8859-1?Q?pOxeeUROlVEOfbSJ2uBPGTqc99PTFiOKpFfxqZ9xM08cAo0ugl5ZQZQ6dF?=
 =?iso-8859-1?Q?G7h6/a5bukuatMbMCmhf3GQZYODf43G9pDLYXwnPyECIMfSOIxqxvYThZb?=
 =?iso-8859-1?Q?RhSvmsArhF9aJhZoeM2DUStvNSjBhZLrcSQlM+EQi9GydSmzYuxxqIqXtz?=
 =?iso-8859-1?Q?S4X+ZlzCEWRkgHKEEWO5Hhe3eYjWZQS6gdeVIZD1P5u382KjFE5MMgh6sH?=
 =?iso-8859-1?Q?vW//Ar4aIEHyZrpTwt+3Gk+hyfOQrE8pDzGqyywuxpR0kEovDjcMTJot5+?=
 =?iso-8859-1?Q?fnS25dqTOUOypDi4NgV+9h17gR5j5LaGUgln3B5N6LwHbMGzD+toCF5G41?=
 =?iso-8859-1?Q?NLKpAA/K1jr3n+8CPOHSOe9ka0EevXubdShN0a5bhQMVcfq5KjInRMTdd7?=
 =?iso-8859-1?Q?QpF+aN0M83Ke6ml3ZHWwFmPg3My00Zb6tTH2yvGdviCb8h0Tze7zsUrjvz?=
 =?iso-8859-1?Q?qKChE0CU5Z9mTVsxLznFGz3QVNHy/IEXWeHnMPNzXhNGrmyOU4oXOvFhHQ?=
 =?iso-8859-1?Q?9hUNLppNH1M0dd2ennqZFukHLi0ptzIp6RaTIelLqb4PhGOeNUVaLnkLAV?=
 =?iso-8859-1?Q?kThI89bKaebKegtN2ra+Ky8DEmFVSGhTnhg7LX64pdVS+JF/8qJEJGBnyH?=
 =?iso-8859-1?Q?1W3QyYTrjknHf29wPz+mB2qXHTMAoam6/tCyhSoWGgzxuquDDXaY1xS+Yh?=
 =?iso-8859-1?Q?Fxnrnk4LSEf8P/o8KqOTSU9JEFzUnBTNeCnALobYpVWSmQ723LtUVHCA6B?=
 =?iso-8859-1?Q?NKLb8MNTlRMojFS/1CI3ppysocsyJAKqnHd4fJ67krS3vKr29YSfUUKpoL?=
 =?iso-8859-1?Q?OVPA7UnHlxch/4be5e/dJUG7UY7wFXntpWo1+uNHbszhqi3Dv3dJASJ97M?=
 =?iso-8859-1?Q?kCgXnHz8fqnnmTjaqMkJHms2rVDe1ZdgTv4cVRQPcPB/53KCc+wVOiLwJk?=
 =?iso-8859-1?Q?Z+jRcDvf9d94Iofxqil4jDNjROjQiPjMP8Leamhedw5MSCV5DNpsqsAmd5?=
 =?iso-8859-1?Q?XrfwbSd3+UTlcrKEepZsi455+UR/zdtA8VY2k74XdRYo+lq4c4FtSAZX4j?=
 =?iso-8859-1?Q?47QjTHCQ31FgpvK4v+6diXnaAxbkLIg=3D?=
X-Exchange-RoutingPolicyChecked: Tt56NJjrN0JRmFruu8CPBhExlPzAeWrid4KG/LmgHPT0TDUW0D743aUgVAC7HUdXUjyLPmavLgxVBwjMB2XLq6mM7FgtfZT6JtplDEdE8alXgs9SfViXh8jAUrXrjJblRqi/dr/t3E6XV7Z75YGXBldPoGsq4rNEKZW9VcuORnQeRLTQ5AruIpb5Lnza8w2QBj+c09D8lLgaJOyp7ScGEYa7UZefi37RAj732s6v2J0w3sJX+dFcJMb+xYnn+ahqV6q5GZvj0GeXe+EN5J6PvCwHCA4oykYR5IraFYZqejRojAgi+IY1E2VpkFeEqQfp2kiJxlznOTE0brDr5JA04g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 55269bdd-663d-468c-d476-08deebfde6f6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB9534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 16:41:26.8519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIlvSX4+ebTjjF+gnotJR4uAIJdBcCyTDCaZv4AlJ6hiTnjH+zxCT7c5fllU77gVKpjrVqb9NNTkLfxvDwl1t90ZUEVV0/i1FuJGALmLn0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9642
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

On Fri, Jul 24, 2026 at 04:25:52PM -0700, Matthew Brost wrote:
> The migrate_vma_* functions are very CPU-intensive; as a result,
> prefetching SVM ranges is limited by CPU performance rather than paging
> copy engine bandwidth. To accelerate SVM range prefetching, the step
> that calls migrate_vma_* is now threaded. A dedicated prefetch
> workqueue is used for threading so prefetch work is never mixed with
> page fault or garbage collector work.
> 
> Running xe_exec_system_allocator --r prefetch-benchmark, which tests
> 64MB prefetches, shows an increase from ~4.35 GB/s to 12.25 GB/s with
> this patch on drm-tip. Enabling high SLPC further increases throughput
> to ~15.25 GB/s, and combining SLPC with ULLS raises it to ~16 GB/s. Both
> of these optimizations are upcoming.
> 
> Since the dedicated prefetch workqueue is not shared with page fault
> or SVM garbage collector work, page fault servicing and garbage
> collection can keep using a plain down_read() on vm->lock: there is no
> risk of a blocked reader starving a worker that a pending writer is
> waiting to flush, because that flushing is now confined to the
> separate prefetch workqueue.
> 
> v2:
>  - Use dedicated prefetch workqueue
>  - Pick dedicated prefetch thread count based on profiling
>  - Skip threaded prefetch for only 1 range or if prefetching to SRAM
>  - Fully tested
> v3:
>  - Use page fault work queue
> v4:
>  - Go back to a dedicated prefetch workqueue (usm.prefetch_wq) rather
>    than reusing the page fault workqueue (usm.pagefault_wq), so
>    threaded prefetches and page fault / garbage collector work no
>    longer contend for the same workqueue. This removes the need for
>    down_read_trylock() based lock avoidance in the page fault and
>    garbage collector paths.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |   6 +-
>  drivers/gpu/drm/xe/xe_pagefault.c    |  29 ++++--
>  drivers/gpu/drm/xe/xe_svm.c          |   8 +-
>  drivers/gpu/drm/xe/xe_svm.h          |   6 +-
>  drivers/gpu/drm/xe/xe_vm.c           | 147 ++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_vm_types.h     |  15 +--
>  6 files changed, 154 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index b8d1726c0513..159ee16ee6d5 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -307,8 +307,10 @@ struct xe_device {
>  		u32 current_pf_queue;
>  		/** @usm.lock: protects UM state */
>  		struct rw_semaphore lock;
> -		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> -		struct workqueue_struct *pf_wq;
> +		/** @usm.pagefault_wq: page fault work queue, unbound, high priority */
> +		struct workqueue_struct *pagefault_wq;
> +		/** @usm.prefetch_wq: threaded prefetch work queue, unbound */
> +		struct workqueue_struct *prefetch_wq;
>  		/*
>  		 * We pick 4 here because, in the current implementation, it
>  		 * yields the best bandwidth utilization of the kernel paging
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 80196e874e06..fd7ef0718153 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -303,8 +303,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  
>  		err = xe_pagefault_service(&pf);
>  		if (err) {
> -			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
>  			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
> +				xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
>  				xe_pagefault_print(&pf);
>  				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
>  					   ERR_PTR(err));
> @@ -318,7 +318,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  		pf.producer.ops->ack_fault(&pf, err);
>  
>  		if (time_after(jiffies, threshold)) {
> -			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
> +			queue_work(gt_to_xe(pf.gt)->usm.pagefault_wq, w);
>  			break;
>  		}
>  	}
> @@ -376,7 +376,8 @@ static void xe_pagefault_fini(void *arg)
>  {
>  	struct xe_device *xe = arg;
>  
> -	destroy_workqueue(xe->usm.pf_wq);
> +	destroy_workqueue(xe->usm.prefetch_wq);
> +	destroy_workqueue(xe->usm.pagefault_wq);
>  }
>  
>  /**
> @@ -394,12 +395,20 @@ int xe_pagefault_init(struct xe_device *xe)
>  	if (!xe->info.has_usm)
>  		return 0;
>  
> -	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> -					WQ_UNBOUND | WQ_HIGHPRI,
> -					XE_PAGEFAULT_QUEUE_COUNT);
> -	if (!xe->usm.pf_wq)
> +	xe->usm.pagefault_wq = alloc_workqueue("xe_page_fault_work_queue",
> +					       WQ_UNBOUND | WQ_HIGHPRI,
> +					       XE_PAGEFAULT_QUEUE_COUNT);
> +	if (!xe->usm.pagefault_wq)
>  		return -ENOMEM;
>  
> +	xe->usm.prefetch_wq = alloc_workqueue("xe_prefetch_work_queue",
> +					      WQ_UNBOUND,
> +					      XE_PAGEFAULT_QUEUE_COUNT);
> +	if (!xe->usm.prefetch_wq) {
> +		err = -ENOMEM;
> +		goto err_pagefault_wq;
> +	}
> +
>  	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
>  		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
>  		if (err)
> @@ -409,7 +418,9 @@ int xe_pagefault_init(struct xe_device *xe)
>  	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
>  
>  err_out:
> -	destroy_workqueue(xe->usm.pf_wq);
> +	destroy_workqueue(xe->usm.prefetch_wq);
> +err_pagefault_wq:
> +	destroy_workqueue(xe->usm.pagefault_wq);
>  	return err;
>  }
>  
> @@ -495,7 +506,7 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>  		memcpy(pf_queue->data + pf_queue->head, pf, sizeof(*pf));
>  		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
>  			pf_queue->size;
> -		queue_work(xe->usm.pf_wq, &pf_queue->worker);
> +		queue_work(xe->usm.pagefault_wq, &pf_queue->worker);
>  	} else {
>  		drm_warn(&xe->drm,
>  			 "PageFault Queue (%d) full, shouldn't be possible\n",
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index cc36addb4f4f..6a470a02fee7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -148,7 +148,7 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
>  			      &vm->svm.garbage_collector.range_list);
>  	spin_unlock(&vm->svm.garbage_collector.list_lock);
>  
> -	queue_work(xe->usm.pf_wq, &vm->svm.garbage_collector.work);
> +	queue_work(xe->usm.pagefault_wq, &vm->svm.garbage_collector.work);
>  }
>  
>  static void xe_svm_tlb_inval_count_stats_incr(struct xe_gt *gt)
> @@ -1051,6 +1051,7 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>   * @tile_mask: Mask representing the tiles to be checked
>   * @dpagemap: if !%NULL, the range is expected to be present
>   * in device memory identified by this parameter.
> + * @valid_pages: Pages are valid, result written back to caller
>   *
>   * The xe_svm_range_validate() function checks if a range is
>   * valid and located in the desired memory region.
> @@ -1059,7 +1060,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>   */
>  bool xe_svm_range_validate(struct xe_vm *vm,
>  			   struct xe_svm_range *range,
> -			   u8 tile_mask, const struct drm_pagemap *dpagemap)
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> +			   bool *valid_pages)
>  {
>  	bool ret;
>  
> @@ -1071,6 +1073,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>  	else
>  		ret = ret && !range->pages.dpagemap;
>  
> +	*valid_pages = xe_svm_range_pages_valid(range);
> +
>  	xe_svm_notifier_unlock(vm);
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 0d1f1107af5f..46be2e5c6f7f 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -134,7 +134,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range);
>  
>  bool xe_svm_range_validate(struct xe_vm *vm,
>  			   struct xe_svm_range *range,
> -			   u8 tile_mask, const struct drm_pagemap *dpagemap);
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> +			   bool *valid_pages);
>  
>  u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>  
> @@ -376,7 +377,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>  static inline
>  bool xe_svm_range_validate(struct xe_vm *vm,
>  			   struct xe_svm_range *range,
> -			   u8 tile_mask, bool devmem_preferred)
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> +			   bool *valid_pages)
>  {
>  	return false;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d7e6644df4bc..7eed38b78e5f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2525,6 +2525,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  			struct drm_pagemap *dpagemap = NULL;
>  			u8 id, tile_mask = 0;
>  			u32 i;
> +			bool valid_pages;
>  
>  			if (xe_vma_is_userptr(vma))
>  				vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
> @@ -2569,9 +2570,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  				goto unwind_prefetch_ops;
>  			}
>  
> -			if (xe_svm_range_validate(vm, svm_range, tile_mask, dpagemap)) {
> +			if (xe_svm_range_validate(vm, svm_range, tile_mask,
> +						  dpagemap, &valid_pages)) {
>  				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
>  				xe_svm_range_put(svm_range);
> +				xe_assert(vm->xe, valid_pages);
>  				goto check_next_range;
>  			}
>  
> @@ -2586,6 +2589,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  
>  			op->prefetch_range.ranges_count++;
>  			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
> +			if (valid_pages)
> +				vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE;
>  			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
>  check_next_range:
>  			if (range_end > xe_svm_range_end(svm_range) &&
> @@ -3151,16 +3156,80 @@ static int check_ufence(struct xe_vma *vma)
>  	return 0;
>  }
>  
> -static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> +struct prefetch_thread {
> +	struct work_struct work;
> +	struct drm_gpusvm_ctx *ctx;
> +	struct xe_vma *vma;
> +	struct xe_svm_range *svm_range;
> +	struct drm_pagemap *dpagemap;
> +	int err;
> +};
> +
> +static void prefetch_thread_func(struct prefetch_thread *thread)
> +{
> +	struct xe_vma *vma = thread->vma;
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_svm_range *svm_range = thread->svm_range;
> +	struct drm_pagemap *dpagemap = thread->dpagemap;
> +	int err = 0;
> +
> +	guard(mutex)(&svm_range->lock);
> +
> +	if (xe_svm_range_is_removed(svm_range))
> +		return;
> +
> +	if (!dpagemap)
> +		xe_svm_range_migrate_to_smem(vm, svm_range);
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
> +		drm_dbg(&vm->xe->drm,
> +			"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
> +			dpagemap ? dpagemap->drm->unique : "system",
> +			xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
> +	}
> +
> +	if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> +		err = xe_svm_alloc_vram(svm_range, thread->ctx, dpagemap);
> +		if (err) {
> +			drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +			return;

We should set the error code like below with

    thread->err = err;

to propagate the error to user space.

Rest LGTM.

Francois

> +		}
> +		xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
> +	}
> +
> +	err = xe_svm_range_get_pages(vm, svm_range, thread->ctx);
> +	if (err) {
> +		drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> +			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> +			err = 0;
> +		thread->err = err;
> +		return;
> +	}
> +	xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
> +}
> +
> +static void prefetch_work_func(struct work_struct *w)
> +{
> +	struct prefetch_thread *thread =
> +		container_of(w, struct prefetch_thread, work);
> +
> +	prefetch_thread_func(thread);
> +}
> +
> +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
> +			   struct xe_vma_op *op)
>  {
>  	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>  	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  	struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
> -	int err = 0;
> -
>  	struct xe_svm_range *svm_range;
>  	struct drm_gpusvm_ctx ctx = {};
> +	struct prefetch_thread stack_thread, *thread, *prefetches;
>  	unsigned long i;
> +	int err = 0, idx = 0;
> +	bool skip_threads;
>  
>  	if (!xe_vma_is_cpu_addr_mirror(vma))
>  		return 0;
> @@ -3170,42 +3239,49 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
>  	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
>  
> -	/* TODO: Threading the migration */
> -	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> -		guard(mutex)(&svm_range->lock);
> -
> -		if (xe_svm_range_is_removed(svm_range))
> -			continue;
> +	skip_threads =  op->prefetch_range.ranges_count == 1 ||
> +		(!dpagemap && !(vops->flags &
> +				XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE)) ||
> +		!(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK);
> +	thread = skip_threads ? &stack_thread : NULL;
>  
> -		if (!dpagemap)
> -			xe_svm_range_migrate_to_smem(vm, svm_range);
> +	if (!skip_threads) {
> +		prefetches = kvmalloc_array(op->prefetch_range.ranges_count,
> +					    sizeof(*prefetches), GFP_KERNEL);
> +		if (!prefetches)
> +			return -ENOMEM;
> +	}
>  
> -		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
> -			drm_dbg(&vm->xe->drm,
> -				"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
> -				dpagemap ? dpagemap->drm->unique : "system",
> -				xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
> +	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> +		if (!skip_threads) {
> +			thread = prefetches + idx++;
> +			INIT_WORK(&thread->work, prefetch_work_func);
>  		}
>  
> -		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> -			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
> -			if (err) {
> -				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> -					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> -				return -ENODATA;
> -			}
> -			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
> +		thread->ctx = &ctx;
> +		thread->vma = vma;
> +		thread->svm_range = svm_range;
> +		thread->dpagemap = dpagemap;
> +		thread->err = 0;
> +
> +		if (skip_threads) {
> +			prefetch_thread_func(thread);
> +			if (thread->err)
> +				return thread->err;
> +		} else {
> +			queue_work(vm->xe->usm.prefetch_wq, &thread->work);
>  		}
> +	}
>  
> -		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> -		if (err) {
> -			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> -				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> -			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> -				err = -ENODATA;
> -			return err;
> +	if (!skip_threads) {
> +		for (i = 0; i < idx; ++i) {
> +			thread = prefetches + i;
> +
> +			flush_work(&thread->work);
> +			if (thread->err && !err)
> +				err = thread->err;
>  		}
> -		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
> +		kvfree(prefetches);
>  	}
>  
>  	return err;
> @@ -3336,7 +3412,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  	return err;
>  }
>  
> -static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
> +static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm,
> +					     struct xe_vma_ops *vops)
>  {
>  	struct xe_vma_op *op;
>  	int err;
> @@ -3346,7 +3423,7 @@ static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
>  
>  	list_for_each_entry(op, &vops->list, link) {
>  		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
> -			err = prefetch_ranges(vm, op);
> +			err = prefetch_ranges(vm, vops, op);
>  			if (err)
>  				return err;
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 2f5f74fed9d2..68588b624212 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -556,13 +556,14 @@ struct xe_vma_ops {
>  	/** @pt_update_ops: page table update operations */
>  	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
>  	/** @flag: signify the properties within xe_vma_ops*/
> -#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
> -#define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
> -#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
> -#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT	 BIT(3)
> -#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(4)
> -#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA	 BIT(5)
> -#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK	 BIT(6)
> +#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH	BIT(0)
> +#define XE_VMA_OPS_FLAG_MADVISE			BIT(1)
> +#define XE_VMA_OPS_ARRAY_OF_BINDS		BIT(2)
> +#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT		BIT(3)
> +#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP		BIT(4)
> +#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA		BIT(5)
> +#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK		BIT(6)
> +#define XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE	BIT(7)
>  	u32 flags;
>  #ifdef TEST_VM_OPS_ERROR
>  	/** @inject_error: inject error to test error handling */
> -- 
> 2.34.1
> 
