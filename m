Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C5DCCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 17:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01C910ECB7;
	Fri, 17 Oct 2025 17:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYaolcyI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CFD10ECB7
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 17:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760723527; x=1792259527;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jfOf7pH88eJ4HIXudRIQsBUTojJ9x/L3g7D+hl1EzM8=;
 b=PYaolcyIHYmDJfS7mLzlduB2rL6wWGEvSOrA984QIOGRJ1zXsWkd9xi4
 ExB5M0iB0KKWftnf4AQ+OCIFxgY7ltVPS9UhlNXByxTM9w2AD2aNF58Z4
 Alzct3mQKUQ84sfBqvP77X6S8OtMm1JRUNEmKUqNhyZHTSIzl4X3x7TGF
 MFO404OrrKDNXIlMylke0+qzvp2hXpOMNI3WuhDcqd1My6Eb4HeI3UgnP
 utuLLywmvO/xbjXucxM5/L4sYVBBtO9OjRSWPQSnNCE32zmjCTSakuxlU
 CV0weB3m9eNE3W2KnXIEgNXggHbcCkJi2vbFCNeOEiPyb6hnCj4Qov9xQ g==;
X-CSE-ConnectionGUID: FUT+502gQGSgTjS9ZJ0Jhg==
X-CSE-MsgGUID: CT5fNiKnR6enMA/BuXZkoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62987552"
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; d="scan'208";a="62987552"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 10:52:07 -0700
X-CSE-ConnectionGUID: nCeEMCK5TM6pMxRS1j9hxw==
X-CSE-MsgGUID: mJUeHgcOQpaBfL3IOOwTtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; d="scan'208";a="181986560"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 10:52:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 10:52:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 10:52:05 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 10:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJ6c1EcO3cfN0/iR8I4/lDB1AD/dzYb4tUmcSaPe37Oj0QUXXVDgX624aAYuOrCfqldgxxJzQXuEbueizByzp0Qu7Qv6cTM6tYL34suJ+aV1af03R4rC/AgKwgxFSJzZKuzBuyL8Wuxsv9SgrKqeIRGlZ/MAJnkBszUiejVv5Go2Ixib6LroeGigrXgWdd3tJ9KLjMncyPE7kfk3sHb0IHZB0FY1BZeWg7+r2FmWV3sFFxopeglV/hprZ6ouRKLFNQcl3igGelSBjmTXrnXEN8Aqq30Aq7DECBZ0SBCw6xShfTF5hqSG+8tdjHrQBSJ3Wo2R9q5kbRAgLTsXRlipdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+rxtvr1wSjbUHcYEKE+sgpBgWJ8pQDchl6QkYbGE8A=;
 b=ALQd6Yqtm8CLZOemwfebgqRVzBo4kxMsFKY/lZAXqb4z7+7tljm7792MInuI9BlVrVATexJLKS7XitIGkpGxOJKC7rUOUcy7mm6Ko1CYv+q1IoUYYbsi8hInHKxj96QNkpj7kJTgQvTGMkObeE3pXVxzbnxWyoAKmnbMQ4ll/qKloSeILvfKEoL5pPKvJ6DZkOaBdNh9nEved6tiM/sETLsZS4CHdfSApFvNtgRCGwirsJWbq1j8aeO9uXu4FKXxfDCjdrrmLaOY/nqUjbcV7isZ62N76JzYyc9Den+V5KJxNWmAOolR2OBVyU4O4DqzYxZkL/iZT65EMr8c+euDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ1PR11MB6249.namprd11.prod.outlook.com (2603:10b6:a03:45a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 17:51:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 17:51:57 +0000
Date: Fri, 17 Oct 2025 10:51:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Fei Yang <fei.yang@intel.com>
Subject: Re: [PATCH v3 15/24] drm/xe/xe3p_xpc: Add L3 bank mask
Message-ID: <20251017175155.GW1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
 <20251016-xe3p-v3-15-3dd173a3097a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251016-xe3p-v3-15-3dd173a3097a@intel.com>
X-ClientProxiedBy: SJ0PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:a03:333::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ1PR11MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: 06e67f8b-fee2-4ed9-18bc-08de0da5dde3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KZJ19qqOLhOStQcobFYZeuMQ+TR/GcWhBCXVk06vLsfrUACiWaAp4+kpVdt6?=
 =?us-ascii?Q?mU6iINwLqpk4w0oWYmBFZijNmBtFFbMO712ueDttVgqq7LD2iWLKt4kxGnFo?=
 =?us-ascii?Q?DUUM6AsQxrtKl038RlEbxs26IpjC7Ts4v0ByYaDj5y0WZpLkMylRKSGM54pO?=
 =?us-ascii?Q?6aZhMNntTvbpR/Ze0RWh4XgTCThDm5OBqlVSfoVhFZm6BShhZ2St+CiFExcc?=
 =?us-ascii?Q?Acw5Hmf1/G42gP4yUr1GI2JLkAH9spmSVcPjJrTe45QGUhZtMFuf/9VN/maO?=
 =?us-ascii?Q?o1FWIH274WTsjDYWuNNfWURCMR/EAZMZxGjgQttnvy1z+UFWAep3bHeROnlb?=
 =?us-ascii?Q?/zz3sL+dIfyzuzoBhsa5pj7dRtPOlZxxCf7iYbenaRsQqKK0/v/s3tdH0Pks?=
 =?us-ascii?Q?YNrKtetivZhfyAsvL19O65GE8PFbQGDphc4ZMCn6X7izbgY1wNYNpkiL9IYt?=
 =?us-ascii?Q?4SM9vOP6jql2TUB5euclDhUH2fpGkVLWAGoTmueAEbfrpgzcuBHs4tgBDm6B?=
 =?us-ascii?Q?SKItDCPyjs/bfYViMS6LXYoDI3nig363Tqaoh9tm9P6ADk40KEGuiuULSjhN?=
 =?us-ascii?Q?FjyK2bNi4HLp6y43+O7U6lmapkbA/Xo8dRlF38SvY77zpDqxGO6oR1Qj2sps?=
 =?us-ascii?Q?9PT5Xads7M/15Itz98MvWKSdM7vsPp6gN44wt9XLb099gHutu3ojni3lhcie?=
 =?us-ascii?Q?i3e03Ve1jLW1whb9q3i9Gty+Cx1lzTEvj7h1ul8fSIhIWFPcCQBqT6jzNpaR?=
 =?us-ascii?Q?gcE3FMO+lZdnFHxdceJOPsS9vGhC4AbpasjyPPOobAYaPEtRMcg6Jvp7t1lB?=
 =?us-ascii?Q?keUJBzI3f2pODCKsXAkP7r1rFeAvrI/tuCvWklC8Olex1FNeYU8uxM861/tF?=
 =?us-ascii?Q?t6TTLb3pVmw9/s1z75Oy9PB9wBqSjCFDZ/rXxUaczb7GxNuooT+wF8Ao0+21?=
 =?us-ascii?Q?j9hJoDP7rg6sml/pQBMeXe03bWm8Vm0BDFzLvcS0TAHdM1w9AlJXdkuLBLJw?=
 =?us-ascii?Q?8zLLwAWedbrpoKnHydydZYRq3p+dBZk8egDJwesd4+JNVJEE1hXvYYM22jQj?=
 =?us-ascii?Q?uW8xo3w5JfUbDq8YzHqaoiihbtLQn7APwgfolfNOBwJNWJt9juxPasyZqJpe?=
 =?us-ascii?Q?MhLytpyII/jioqtEyiyE1CvnTnLLddVL3+Px5VTw/+1tscyBxX5TlX/mYgVl?=
 =?us-ascii?Q?BF9DUjAkknRAg46TMJT1jWAXIeSLDBtZ7yviKZ6j+d+mSoeZ509sADRYgdUH?=
 =?us-ascii?Q?lHKGxjvfAW6RkYbvwJXqID17thcp8zy58PhnyPhN5o70QTyxcuT6/pBclbsf?=
 =?us-ascii?Q?Tc+96Lny4o4hT5FIk36KabZl3sw6V+UmEMVvcCJ3Xr9sSE9/HO+5BJAPa3qK?=
 =?us-ascii?Q?0WOE3qQDUsSKV+wEA43yP4XYWshDtCoFe6ZGBohZUupfxKEblMJm6wucq8gs?=
 =?us-ascii?Q?KCSCsK6Qc6j+iy3tH6vV1V37J5icDq+C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l6cwsKzvRXnueeRcwM9SWpS6L9mi1NoVxavg0ubA4D5boUPqP/mzS8mN+jid?=
 =?us-ascii?Q?KcfCkIjgsC7RYh/HzqNxDHvHfSPvab6NsMp1Zf95qsP+z0R6nkxLvKiRgpEx?=
 =?us-ascii?Q?cmf+YH3bZ7B640J2/FymQDx+ifV5YyaitMPirWh5lcyJ6R8YfuZCnWCKXaab?=
 =?us-ascii?Q?2D4OnY242cys/0UVhXopSXuh+7Z17MwRTnlrWp222SLc9PTYdxLdYxao8rmo?=
 =?us-ascii?Q?FzL3FiOaQfWixNNyoQ3Rde4N3VmqRbUJ6LQdTxnnc30FmalOwmTnL08knuXP?=
 =?us-ascii?Q?beQEqwOQBwvsaKmPq3YMjCMFF63nSOl7R5pZ2/tvPcqqt1phhA0o+oZ54CIx?=
 =?us-ascii?Q?rXVeg/kbiOCt0lY6meJTMTt5DsJpwkOGRSS2J7aa5j2oVRyqvw6w9sUyt9AU?=
 =?us-ascii?Q?xQkZ8LIZXq/q/RFbDKms1vu+bCMmSlwKYE9crNvh6n/fCPuS08UOlBzhVudM?=
 =?us-ascii?Q?ya7MEIvdZmwNGi+XdFGp7qxIE7laQKhdIMX6dSxEtInHRwxBmcnnoDPiSVWW?=
 =?us-ascii?Q?HldVLEhFH4p6plMeZgxbzOdhB2tdNldjPo0YcglNTqhsv9csQt3rSXm/mslu?=
 =?us-ascii?Q?EqVNy41FyAYSFnBEIVGpxkYAFcdC3mmKDBYKebzOPLLy4e6pQZcvHKYauYPF?=
 =?us-ascii?Q?4B1riAf6BZRKVe7Dj9m8Mz+ET0TdKvZXOoN+pnG8I/UJuu7Z2POmeV9ZcwTs?=
 =?us-ascii?Q?dmEWl6SuIWOMOCPI5kz1rb1ldPJym9Q59M4PEGaXaCgSNoO9jZJ15UVsoLYE?=
 =?us-ascii?Q?mlVyiCjnxzcLnEDtwHcdJndbO4U7WHGanRFrg+nsHpkgbYtaapHOs6D5FOFF?=
 =?us-ascii?Q?CFAyEDD889Y1gp3jK1OFynG/ODEMWA8JK2XhcaOz2UFhfKZHOjcpFLKW/w+z?=
 =?us-ascii?Q?G+IGuSJUjhiyEBcfHz/yYuyz5qCI/gptrsr5ibPnOK9b6D+FFaqNV1zoO2gc?=
 =?us-ascii?Q?uLDjKSGOXPzMvwqn80tMhl2WZ/Y5rSLayqYXHWd2/cqhibqF+9uywT2NeeCd?=
 =?us-ascii?Q?+AQt9Y/2M+vpzfcdWGWiaRxCdo7U+ronFF2Ht2v9bCRagShemPQUvrVApBUD?=
 =?us-ascii?Q?KuUKmaZ44LEANlUk7+jsYPM/7Rd8MmK+aZc6tHl1SWPaJFXtC697X3QTY+cj?=
 =?us-ascii?Q?e+1y5kSb556UssdbNAyuE3Haek2wzaxa15NXY7b4BDxIyCg4z054JeJrR607?=
 =?us-ascii?Q?daPvDhC3bhtn+LE8IeQvmCY1j/VC+l7MleTu2JMsZPfriSBdhHmPipmfQsRw?=
 =?us-ascii?Q?5zq+qXyeRZoeuOaa2upuyKH986zC3SegCZMWM2EA0XcbS+Ifv0rLHpn+8P05?=
 =?us-ascii?Q?/hO9TZeL0GSYw81T5Z2jSVW/CyI2cjJsMPVwe6UitTRBjmXWUwwwAJl4HCWy?=
 =?us-ascii?Q?9JbWD7K8IkIacQs/KhegYBOB2xeTcRs/cjiFTNiQHslLZxwXzVUTQ8ZV4czB?=
 =?us-ascii?Q?rVVnl1TtcHu1TzeH+41PXzv2RO6nyK+mC6UkaCd+2AUcHYBaV+vf9QrKriIs?=
 =?us-ascii?Q?Tpotcg83sAHbV5tW4LXjnl2BLvzFbagS0pSof+iQW7NQ1BZWd+uWbB9Nzkmz?=
 =?us-ascii?Q?vaSIkCi9KAt8NASAr0POu/C89Y5Sn/Ygtz4Aq0jas3rCRud9rMonxowaeINw?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e67f8b-fee2-4ed9-18bc-08de0da5dde3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 17:51:57.8167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnGjciJ26vZwhjMxR/jI1ApKxXBRW2HW26YpDo6P45xvKkX8TK7QQTfKhP4FTsT4NyePDw9mSebeQcy9c1eL1A2/MzWfN01Mrbi96/BEW4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6249
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

On Thu, Oct 16, 2025 at 07:26:34PM -0700, Lucas De Marchi wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Expose L3 bank mask through topology query interface.
> 
> In Xe3p_XPC, MIRROR_L3BANK_ENABLE represents the full L3 bank mask (not
> just a per-node mask), and each bit represents a single bank. With that
> there's no extra complexity to calculate the L3 bank mask like there was
> in previous platforms.
> 
> Bspec: 73439
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Actually, although this patch is correct, I don't think it needs to be
specific to Xe3p_XPC / 35.11.  It should be equally correct (and more
future-proof) to make it a general Xe3p patch:

        if (GRAPHICS_VER(xe) >= 35)


Matt

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2: Better commit message (Matt Roper)
> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 80ef3a6e0a3b5..14af073783ad3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -148,7 +148,11 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
>  	if (!xe_gt_topology_report_l3(gt))
>  		return;
>  
> -	if (GRAPHICS_VER(xe) >= 30) {
> +	if (GRAPHICS_VERx100(xe) == 3511) {
> +		u32 fuse_val = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);
> +
> +		bitmap_from_arr32(l3_bank_mask, &fuse_val, 32);
> +	} else if (GRAPHICS_VER(xe) >= 30) {
>  		xe_l3_bank_mask_t per_node = {};
>  		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
>  		u32 mirror_l3bank_enable = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
