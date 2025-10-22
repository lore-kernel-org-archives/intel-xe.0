Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1991ACCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 18:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C741510E829;
	Wed, 22 Oct 2025 18:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSxjqOC8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ECB10E175
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 18:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761156003; x=1792692003;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E9vr8dW7JV/OcQkOB/FzuvN4+jwSEvHyiXsOD+qqzOY=;
 b=PSxjqOC83qGJevHp004h33VRdj/UdtPWI1xAkrHId+2afZvG3SNLlAX6
 mZchiCBQ629gcM9iVsV5Mh9fJEk+rqqUZMcm1MIMxC7k2RxZ5OzmJCsrd
 sLfdENaMxbaR4uKZY3SuJ+i+w23ALq5NsJtz9N1S+vtHPx5IyS+3pJ/X5
 OUTwYAIA8bS9nRGIjyXM/Gix86Hi3B6m8woby1MdDzABqijQRBr6Jf5Hu
 o5L2tj7oOA38Qe3vQGSEpDHNNyjoLRLu6Lyb3CTO+nfrhCgvFUTNvYxBZ
 XPMeLShmEyXkdCBDPGNI+jBp+WxsfeIyiTEMv5MkumamBKLwYR9MjH3Mx Q==;
X-CSE-ConnectionGUID: Q0O0wrHlS66sFoAPw3bc4Q==
X-CSE-MsgGUID: 2aOnq8lNQRGBNoiTCwXW6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73983813"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="73983813"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 11:00:02 -0700
X-CSE-ConnectionGUID: 4SKMJ/EyQkeJRZRvNXJQAA==
X-CSE-MsgGUID: 6GDh8KELSAWhSF3XNGjBTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="221130639"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 11:00:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 11:00:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 11:00:02 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 11:00:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMsqUYBnDD50bjDHYBMWPmehf6KvanvcPgKp807MD+8TNlbXzkkjQwGPVA2abBYRFttSkS6OK9PrmDECdw9+dnCBHPu09vs+TfrP+Rm2IqE1kINcmXOXsE7XpnbjLff7IJZg5H4jp1DBn7I+qmQ+/ETPvQ69zyUv87BR+xEewfOreWGrKDNcExjq7SsEndMTawFIFKj2CjWqarNqJHcZkMM2SeyR3lE3Xb5rMwK129OXIrirVNbofndGeoaw2kvBa1gb+Kgoa+tT/5tK2iB7lxIsncLpoJtxgLfTtcNQDoMsNO3SoT7PzmmnWcnK+jt3JD1P35SQiAqgkOFqDboBlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUQMfa7R47OdhQx+8FRZmnOt1/9p4wATQ0687FAGgpA=;
 b=pbISa5VvkunuQe+xx+umveqsUgVtkikUkbAl5zFydW8aBwilS+rvpXMhLKpzkmdphqUR7tFmcb0a8XeA5EHZ7QNrAUisHK1L/OaeNLmWQV0l45mUlfRVASSFOTmHZ4xn2+wXQXRWCogC7pVl4MrisHlZG2GS4uB6VCt2QZHCsK0QQgPIiYMKPf1O9O76WXz2cmGK2Rb+013UMB3eNNBAJFEXtzWqRkVBz9i6h5n8UO7/BCYwUseDQgES6Yzw4CRRxq1HDDbUTp9tB0ARoQIB0g7aDansMJHjXmTwuuApwF9TQ4s9Sqk+1cnQUhFPRcxgTw4zBOZkBs8hSBtodd7paw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF44E8B88DF.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::825) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 18:00:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 18:00:00 +0000
Date: Wed, 22 Oct 2025 10:59:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 7/7] drm/xe/migrate: skip bounce buffer path on xe2
Message-ID: <aPkbnWE7pLRODu+i@lstrano-desk.jf.intel.com>
References: <20251022163836.191405-1-matthew.auld@intel.com>
 <20251022163836.191405-8-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251022163836.191405-8-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:303:8d::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF44E8B88DF:EE_
X-MS-Office365-Filtering-Correlation-Id: 04fa2b3b-db0f-497b-78df-08de1194d172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6JBFv+SjOjgrv+MZ+Bt4JZ12enZLfoeVcONi4ew84uADmiJB6RGmn4iVNzRV?=
 =?us-ascii?Q?dtAQtvmw0R0cY5vGe6J6Sm1/kaWbyDS5YXJsO8dcSOMntBOQ/mquWsPYp/nR?=
 =?us-ascii?Q?LDdoJ9BwvxbpU9USypllQrtWbUesRrky3F3rBTa95umxqe7VH26p9voxUdgx?=
 =?us-ascii?Q?L7y6g2xbW6lUteR6BEn9hVlqGhLLHOFy1uqPh9ATVu+POUtJ/O9FOlA+af+B?=
 =?us-ascii?Q?Bs7BWOdD8Afg+x8jjBLDKB+ord+NlozrQFsbIribLdjfer3OUi0m1D8wuH7/?=
 =?us-ascii?Q?UNHKBOzgDBlxdoCxfi6/9T4R3prXThWqmatHm+xGDbGEM2saqO3Qtom/oZrT?=
 =?us-ascii?Q?zzCDEX80WltZ6JjZhxWeHn5TerxwomqmlofCj+gfSEPCd+ZsyZDQn5B+ww3V?=
 =?us-ascii?Q?JpPU4vsEUrys4Zg+DRREZBrM8yOuWvejsI+66yX6+XiKd6WiqeEJr0wDCKoK?=
 =?us-ascii?Q?0X2/PVFOZ5Nsxo9aI5lZCsa3jrlJpJWf8T54zHvStDtNii1Ek6QsZxDT9Pi/?=
 =?us-ascii?Q?mE76PZQxxFH1kmmXu2gmHIxyWvMg+qdUMkkXZs9/FV1RboFqKadmu5zA32VE?=
 =?us-ascii?Q?1BTPdzVvmr6I4bM/H7uARVx8vMlblYJKXQCQF3BF8nm1gaFxGfdwBovOM2SA?=
 =?us-ascii?Q?WcSoDV65ITultQGGXqopBWUIUv2AxxSTQCw2ePWmMU5bW/Np7uiI9FTGy2/8?=
 =?us-ascii?Q?iYuqYzroGfTbWUY909l+Q1oOod7g7V3LYMUYcK/+XTZXeT9DNwJM38sc7Uwk?=
 =?us-ascii?Q?ebnRdSqrV+L9JUzrhOfJ+m3P1xODVbOSGN+oL15duf9xuXUdaGKXIl/Fns9W?=
 =?us-ascii?Q?YhQu+jhar5WOiqJF01kZsii/vqWIQmQOGmDzixuQ57BicH5TgzxdNgJwKwD5?=
 =?us-ascii?Q?m8/QWTrz0dCuLmqUARSqT8jhPBQbWC8LyxvPRoFsF9kcHFow9/U7yhxVaPJU?=
 =?us-ascii?Q?yV16FB+FJNRXJlZAxTMitHDtr25kfHm5Ah/BHKv7awy3NMs67h5+4+jjYL7d?=
 =?us-ascii?Q?GyPgHsNlkbJXuPYAtb5AivqEfxF2HjqphJR8WP0DMGaVUWtS3k/E8L0Ubse8?=
 =?us-ascii?Q?ZFoDZfctECWaSphyo0CmwWV8Cbp06do6p+Dr897hUjaHCp/3Y5qOZyYqIq+W?=
 =?us-ascii?Q?CMI549XZT8TGzpe6kKfp1N2Bii9W3LXbm+FBfWEI8Xse+7kQCz+uDys4ndCV?=
 =?us-ascii?Q?+EkeLWcTYXeh1KaG9ql2jQjji+ZYuvCH0BF+gcX4moE37ABW6c6t5+t1SQQW?=
 =?us-ascii?Q?8YtYKHRQ6l43SY8NF97VArNdtCztWm9QKk9toVMIQwaFL4Bv7dX2ijmIn9eV?=
 =?us-ascii?Q?XvzB9yJRjxA8cgLugd2pPt5TD+trTVlkfQ2q2ZMcWZ8tb9Nb6eyGuOaWc3av?=
 =?us-ascii?Q?/BrUmPy5Tk8K6zH1hzGWJS9HJbpKhWR3WOhYK85YtJeL8AfIlRXXh3K9qG66?=
 =?us-ascii?Q?+SUEMwWjC0Pf4sq7ykWwJhlV1WdbM9p0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8gpOTTtIYRfmwLp30coaeMWIc08D+0FEy5jcg4+2tB+wM7nbPdMkCFr0Z6Ns?=
 =?us-ascii?Q?BaIT90aT6cbrMXyANB1NFR4MvJS0vHPkgz4z+j4ofzuArwFY8VbvtrhPzb8A?=
 =?us-ascii?Q?iIU8D8qpr5QeGB3sDsI0aE4y+SvxASJNx2PXR4Fw11NTVqFYETcw73gavrMu?=
 =?us-ascii?Q?XvI8Cyj5VByJwGntu0GdAapXipAj3cQpBac7VgRzr651lhABP8WjO/j/Mwa4?=
 =?us-ascii?Q?90pJbQS3dwxv9GjVmWDFELNmV4w/IrbLxUJh2bZr26nhUu334Sw0qhyGhh6l?=
 =?us-ascii?Q?pEINfClLyjzmBqonk6M0KGDJED7QBHwQqIx3kgfJnpcmC8pzznm5agVVgdkW?=
 =?us-ascii?Q?wL6Adpk/GWPd5b+PrCpNnFn95pSWFLZk8kx6o4BT7erk9WXT3VP1KGzyvQH4?=
 =?us-ascii?Q?S1Md6aO9Yfkw6pWVbGVtqSqdB5WMDLcYl+xv3h3vGPIdrUj2N5ELq9lFb+jT?=
 =?us-ascii?Q?xEl/I5YISBKp1umeKSKNJVgBr/SEPni8PE2Ho69BFkEAtpSFGUg67teBBJw1?=
 =?us-ascii?Q?iqwMULmVj3DeThUDIu8sWd2kHnbFpU8YA1nmG0cxScsqp2zWAurzNqVIyXNb?=
 =?us-ascii?Q?CS1KLEqFFNYPNKGrcH3EiV/F3cj/EBCTikU46ZeDKXoTmIKH6OXmWnDp+lo2?=
 =?us-ascii?Q?FKsbOsZUjza2n+358H6IyVDlq5LF/PZn5N1g9qaUH2jqKDremz//DtPy62+v?=
 =?us-ascii?Q?xBh7wl0HVlpij8wdf41D4trrhL29TnbEdkbTi86coRQ55N4DKH6ienglvHsO?=
 =?us-ascii?Q?UUSTRoFNmQhLkKeb0uW/wyf92opOo9c218n4ub/RxFjGpkfciAq5/bNMkhOq?=
 =?us-ascii?Q?INAt+VRAMCjceysdiBR1JDHyrikDs2fcZvjbPDNMUi6gAx6IgNLaQ0m38AIm?=
 =?us-ascii?Q?x3YC4AYqNYDjkOD7TN2GZKGx7IHcF6SVXM/aIeYCZzNVt1p6sITilIqDSROR?=
 =?us-ascii?Q?/r5YW+DAaqVlChlSfHsjAuOuO5/QPxi36tLNrrhqzYI0PCTQoohKOn+a1LGj?=
 =?us-ascii?Q?QXN/gEvtZfkr4/mntMO5t+dXX5lKnuj8awdRapWpVZV0rkrQPPVDE4RjKanz?=
 =?us-ascii?Q?SKWu/LQtAC3XWqal5AojhgnKHzFHirz/Kh6UEGvaX41v/TDqMCc+zCy5U3k3?=
 =?us-ascii?Q?f+hiIuOQXFCwbD9vySqXPoM9odWJ6M7KiGQjIe0NrFZDWcEzTDEU2LCyAl3A?=
 =?us-ascii?Q?kiLO3vM/6XpuN7nVsMVlCnIBGwjlcyz8CuwUtqb8t6QUCoPrQvIqEd287fdZ?=
 =?us-ascii?Q?N4cuhm1RuFEoRDpJsef0gPetErFxKUL68ro73GQ1YS7wAPgSR3Va2Xix4M/u?=
 =?us-ascii?Q?IS02fjUINDCql8K5yZ/jAPZfmogy8iK7rSw9iw0Kr/Ea56T8NZL9xBa8dzYI?=
 =?us-ascii?Q?mcwxcoHvjpyqKxN3by/EXkqz9PbNk7b34canPsQKOY07tbaKQyVpU5YOAb/y?=
 =?us-ascii?Q?OnR848K5kf4PLWZgUXQVb2QAP8zwQ52GBWOiqR9fm1G5+jGAeoNMkXujpNWO?=
 =?us-ascii?Q?Op2kts1Wy8gPehUZ8mJnZEDbM0zw9xriV9dOjIyN7SR2ZC7uJna33kQ9Fq+8?=
 =?us-ascii?Q?NRcCz56yt90sG3qCp39udFsQBrakktUfjA3wqxtyWsHwtIn4JADL6J2iy19C?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04fa2b3b-db0f-497b-78df-08de1194d172
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 18:00:00.1492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LEKYKA1Py8bz3SMGadUhZI+UEHlfVj+tMYIw67dg2U0ad/WMfDqPOXo/koSpFKnA0Vns+q9fAFsLj1s4w0L7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF44E8B88DF
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

On Wed, Oct 22, 2025 at 05:38:36PM +0100, Matthew Auld wrote:
> Now that we support MEM_COPY we should be able to use the PAGE_COPY
> mode, otherwise falling back to BYTE_COPY mode when we have odd
> sizing/alignment.
> 
> v2:
>  - Use info.has_mem_copy_instr
>  - Rebase on latest changes.
> v3 (Matt Brost):
>  - Allow various pitches including 1byte pitch for MEM_COPY
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 43 ++++++++++++++++++++++++---------
>  1 file changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 1bbc7bca33ed..921c9c1ea41f 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1920,6 +1920,25 @@ enum xe_migrate_copy_dir {
>  #define XE_CACHELINE_BYTES	64ull
>  #define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
>  
> +static u32 xe_migrate_copy_pitch(struct xe_device *xe, u32 len)
> +{
> +	u32 pitch;
> +
> +	if (IS_ALIGNED(len, PAGE_SIZE))
> +		pitch = PAGE_SIZE;
> +	else if (IS_ALIGNED(len, SZ_4K))
> +		pitch = SZ_4K;
> +	else if (IS_ALIGNED(len, SZ_256))
> +		pitch = SZ_256;
> +	else if (IS_ALIGNED(len, 4))
> +		pitch = 4;
> +	else
> +		pitch = 1;
> +
> +	xe_assert(xe, pitch > 1 || xe->info.has_mem_copy_instr);
> +	return pitch;
> +}
> +
>  static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  					 unsigned long len,
>  					 unsigned long sram_offset,
> @@ -1937,14 +1956,14 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  	struct xe_bb *bb;
>  	u32 update_idx, pt_slot = 0;
>  	unsigned long npages = DIV_ROUND_UP(len + sram_offset, PAGE_SIZE);
> -	unsigned int pitch = len >= PAGE_SIZE && !(len & ~PAGE_MASK) ?
> -		PAGE_SIZE : 4;
> +	unsigned int pitch = xe_migrate_copy_pitch(xe, len);
>  	int err;
>  	unsigned long i, j;
>  	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
>  
> -	if (drm_WARN_ON(&xe->drm, (!IS_ALIGNED(len, pitch)) ||
> -			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
> +	if (!xe->info.has_mem_copy_instr &&
> +	    drm_WARN_ON(&xe->drm,
> +			(!IS_ALIGNED(len, pitch)) || (sram_offset | vram_addr) & XE_CACHELINE_MASK))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
>  	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
> @@ -2163,9 +2182,10 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  	xe_bo_assert_held(bo);
>  
>  	/* Use bounce buffer for small access and unaligned access */
> -	if (!IS_ALIGNED(len, 4) ||
> -	    !IS_ALIGNED(page_offset, XE_CACHELINE_BYTES) ||
> -	    !IS_ALIGNED(offset, XE_CACHELINE_BYTES)) {
> +	if (!xe->info.has_mem_copy_instr &&
> +	    (!IS_ALIGNED(len, 4) ||
> +	     !IS_ALIGNED(page_offset, XE_CACHELINE_BYTES) ||
> +	     !IS_ALIGNED(offset, XE_CACHELINE_BYTES))) {
>  		int buf_offset = 0;
>  		void *bounce;
>  		int err;
> @@ -2227,6 +2247,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  		u64 vram_addr = vram_region_gpu_offset(bo->ttm.resource) +
>  			cursor.start;
>  		int current_bytes;
> +		u32 pitch;
>  
>  		if (cursor.size > MAX_PREEMPTDISABLE_TRANSFER)
>  			current_bytes = min_t(int, bytes_left,
> @@ -2234,13 +2255,13 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  		else
>  			current_bytes = min_t(int, bytes_left, cursor.size);
>  
> -		if (current_bytes & ~PAGE_MASK) {
> -			int pitch = 4;
> -
> +		pitch = xe_migrate_copy_pitch(xe, current_bytes);
> +		if (xe->info.has_mem_copy_instr)
> +			current_bytes = min_t(int, current_bytes, U16_MAX * pitch);
> +		else
>  			current_bytes = min_t(int, current_bytes,
>  					      round_down(S16_MAX * pitch,
>  							 XE_CACHELINE_BYTES));
> -		}
>  
>  		__fence = xe_migrate_vram(m, current_bytes,
>  					  (unsigned long)buf & ~PAGE_MASK,
> -- 
> 2.51.0
> 
