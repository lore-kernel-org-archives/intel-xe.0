Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F85C28B2E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 08:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4098210E728;
	Wed, 12 Mar 2025 08:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YUE6FURC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC15610E728
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 08:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741767670; x=1773303670;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ILcR1OD0kGkAtjJZ10mxTEWRuMusYTGNs1ZEEkSkmXc=;
 b=YUE6FURCN8MQY5No6Pc8MOC8lWEUXGoZ2/aSzxANYlW+Zm1qTHyd/CN1
 cNtTnsaXCsfCWYgh4AoCnBCcK4EjejbBQhAk1pGMkYMv2ep5BWb6VFjkt
 Jt5SVzhXgmExDWKTbDQkCBjK34oZ6KAvcBvmaiq+DoWlpShgdTU2BI5JF
 +9snHsYeZMOfdrlJ28/5W0YmZCqIjZMhcDt2CSaL4lb/dr18KYjzdSYFF
 k0sWSKWlBq65KIU4Fjy1WsdOK+/XgQc27Fld0dwl/90kCkTvxqI4NmXFJ
 NFQJQgrYNqjj//NCSzDgNJqUPxye5dOtjEDKX5iM5vkDXdLy5Y5gzG6fG A==;
X-CSE-ConnectionGUID: 4uE6osr9SGGFIgV05we5MA==
X-CSE-MsgGUID: It7/hB3jQ/WV+iw0bk0WNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="30412962"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="30412962"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 01:21:09 -0700
X-CSE-ConnectionGUID: rRBaJhvURxOCNGzikqPSTQ==
X-CSE-MsgGUID: nI7RhBKmQIqUQL+Rslqp/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="121468007"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 01:21:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 01:21:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 01:21:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 01:21:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWGQi6QC3FfxMy1eoGS0vGGMLGHp79fhOm2PShFZ7V0H/wuL2gW9TYH3Zi8Gbh1LQ+MdL7+Non8WORGDlmxJjTIkQwfVe/vOsGNNhCF1sOmridmMkxnnLPRMmmtMDmxoVkxWwCkiBXBdpBX4zW2RLiCXRauR4IXGm7uJ76fE6RoriaYR4FDjvSQqejkZlFJbi0VVPxVaKs0a08OIqi06cT61viyAvglhh3D0zUS+HGS8Yf1Wb1hCDbyM31VQ8lfeKHbiXhGPx2P9a/E+xCWQviF60Lz5CDX9p/lwHj1TjTmiwTXgZfrZJYDb+LOLNGnkgCX66E2LmbnSrHv303PfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7IIcdPXJolPvYHpb7thd5jiW3w5OaeFYsV7HkAxRV8=;
 b=M3wnsBedrzjFcqTTBaOHCfPEeymc0UW5jt4pgBtAre+aPPO6R1DVcCxTP62jGqsQrDXnmn9O4yzF4NaupQrwz+rtIiizuLWGZx0k2QleLK9/QKeVivvGwUHJ/owvH2qjITpo3CQ7HKekVyWEjLyYt2Yam/ZTjLRfYfA6jydK/vr5k/PFqyogNuHJBeoVVwaJ7yr8lE8OPfFyAnZRO+Nx+/q9xfERg6jUL3lLI8UxqoCGc4Aj+eK1bcuVKB7nahUk00pgP1i7OLGRDx1YyNgSjxR69pg90KGFOpUsIx8raqNHN+o+QDfou5c9Zb4bhHPq+iFTYk59o6uJxqiyCH/tqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA1PR11MB6241.namprd11.prod.outlook.com (2603:10b6:208:3e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 08:20:25 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 08:20:25 +0000
Date: Wed, 12 Mar 2025 09:20:16 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: intel-xe <intel-xe@lists.freedesktop.org>, Riana Tauro
 <riana.tauro@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Allow to inject error in early probe
Message-ID: <Z9FDtXqmC-e5uxFW@fdugast-desk>
References: <20250311-fix-survivability-v2-0-729ce081155e@intel.com>
 <20250311-fix-survivability-v2-2-729ce081155e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250311-fix-survivability-v2-2-729ce081155e@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR09CA0101.eurprd09.prod.outlook.com
 (2603:10a6:803:78::24) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA1PR11MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 588afc7c-012d-4a1c-665f-08dd613ebd4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XnpSJlJNR/hACbxZuBIel/S4G4yhPOcnxzIrIOh8S3Kh/B+c0MgN3XXwLBB0?=
 =?us-ascii?Q?JMhnmPptvy9Tg7xyItIWaza0nbxfTL/i9dttSTta3ta6rFb3Vns9So+a2rlj?=
 =?us-ascii?Q?lH1M4X8Regh+63yijx9YHiMwUmDXS2kepBDGZmHPusD37dYjt8D9m1RTwc7s?=
 =?us-ascii?Q?Rus2KLDvR7kb+uUcrib+iQr8KijBKcnfTUi4uDDeK+Uq6bbR6P0zbvX1XUKx?=
 =?us-ascii?Q?N9sO1o663c+5mOazP6rGr+4K1D7u0Rkrp4nVHLeoqfnoTcq8ixoLm4f1prwR?=
 =?us-ascii?Q?QLXD5biG0FP5PA0phPmxdOlNmAROm9UnxL8b8r9VhnedQPe+cslMUCiqHyVQ?=
 =?us-ascii?Q?hw+30UpMG7muFOiilt0wVGP76VDH0gsq6eT0Ontx8AyuG/Wd+0IR6XG9Ww28?=
 =?us-ascii?Q?lnwXtYUEl9dUlB2m63bU0z2bN+19jDv/woq8JQPH6wrR8w9tnR6mTW2mgZ6y?=
 =?us-ascii?Q?DC60ovDaeF021n8crUsEz1xXO32N58CJQCA+RYbDnDsIP3/SzoSR8Gyz2NuV?=
 =?us-ascii?Q?+R/GXAotRcXX5VgPnd75zV6dLT99LWigmzGaqiVmMpuUsI+whkr/+MsC5+99?=
 =?us-ascii?Q?FcHa2cnyZ3KsXmmSen8+3osR2p7vv1InzIEFaZzU3dSEzEVaHQtbOcybzzBH?=
 =?us-ascii?Q?y3CBRYzfxFkrBAeAfeBnxIM3F0pjex0XYWDG+g8dgUpX/TeZvvaS5//zc8xH?=
 =?us-ascii?Q?ICOIs+KiuSHvGZBLLQecuFpddMmJXGcxeEukz1vD3kgtqL+elQnDXXUPkqg4?=
 =?us-ascii?Q?lX4towsfYh0RGzV/ShC4dm4HVaqmO72klEvLMSYbSeYX88yi82EEqcOrYQvd?=
 =?us-ascii?Q?Ix24wyCZz8JVW4a6+4Cj6lyKb8H4IXi0WzIKY+/X98vSoR1tiWkBUiFMvAzD?=
 =?us-ascii?Q?6drpbzg6E+FC9RXwbFoXV0QYwre0pOPJGtH7mSY9ao+UfOLpBDzNiWytYD/n?=
 =?us-ascii?Q?eFpqFGWzz+ocdRIj/MpdTkJOHr5su9XNo2iuCwMiyaDBDoq8hgc6jFFfX3rv?=
 =?us-ascii?Q?GCwVkOVePU3jY5Vqq54J/UmGdJM0R6jf0woisRNhHnPTdyV8RC452MdP0Zps?=
 =?us-ascii?Q?YkpEYvWfWhlI2cPp/l0BvvBHd3VbM0+vebdShg+KANQUyOGbvSsai9pt80F8?=
 =?us-ascii?Q?peOIXFpW3wcyyT6BGMVwYS/Dud4RD0vZGElq88hpM7fy4pFbC4iILulZk+Kd?=
 =?us-ascii?Q?cP9a0ZRCIlMLIfmcGsYEgaNn+GfN9b8ESwo3L3AuSxe+sxj0HuX+aTIBxmRR?=
 =?us-ascii?Q?kh4SUal7/4bDmORl5bzAZsgwlLAaV5zmG9FFoIsxpVFbJGYNwoe4OxowY8bQ?=
 =?us-ascii?Q?vKYyt8/Dh+Iu6Lm9cQnanD62QWRqX6kTB++BlNgE2g69pBeKKfQhNLcUGcP8?=
 =?us-ascii?Q?HNBWeZfXnUGzDB8k64nyuzDee/AC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k+WzyoGiSv8OCFpaHghsQs0sA7AXwRTgTAKt465Ss3pfuDqEk4D7pCq2f24l?=
 =?us-ascii?Q?BRjajdcOdCJTu5K0/ipbkg8w+9jqjoGejfP/fLYzbQoCjPVYhG+czzGskQ4K?=
 =?us-ascii?Q?3T/9dPhc5sdidg4nvLIh7NTCLq8Bx9mI0ZymblEmc4vyeVmVMgwXx02wlgQ4?=
 =?us-ascii?Q?LRpSj4pLgiYHZrJrtbDnanlXh8ssjF/OWY4lkZT/dC/5in7K7uBT6j7La7Zd?=
 =?us-ascii?Q?AYMu7TV1zzCfwz1juy7/PykrYtWtaXLq/Mz2yG14a35uwiJNmQOEEcmpboQo?=
 =?us-ascii?Q?/xwzy5NKyGeJYsf8IH8dJ4UZPwu426KTQZJzBsUuI7jlKShXKXI6BVI3saaQ?=
 =?us-ascii?Q?JJ93fN8Ahn4xvn/9hs8fixa4xgrVLvwENpsEq16p+hzNokH6XJ8vcLMMHwzp?=
 =?us-ascii?Q?RkbqCNzsmaFE+QKoc/21z7g6lYneFxxQ+azKjCUvQLLO+YHFcW5EVvdKlxjC?=
 =?us-ascii?Q?BOormTwy+1GP5aKvT+uF/5dOJVAfecPNXse+JK6jrE0EUnwB4iXZwA7wlC+O?=
 =?us-ascii?Q?XxRyNu+nv/KyWWylo5RUjgn/xHKxcP6V/6SV/7jennRl13GkutmmCA2XDyIP?=
 =?us-ascii?Q?uwrCRJXHiw/fXEj0vGisN5loLHDCORLU/OYxQPOdeJ17daS9Mb/yvDzONl3o?=
 =?us-ascii?Q?LSW0aJ7ZJ35CRV6AcEGHrGsQBHNAy9nKrvbQj6TZeG8P7qiIlYcKuodcHN2W?=
 =?us-ascii?Q?pP8l+sn62b2kdc6tcYbBX4ZxVCkYoNzkA7WHzyPjAmD3+AzlPVk1cJPM7JC/?=
 =?us-ascii?Q?D+Ji01OwDNCPKmn1nzNKD+wQJY3D00khI3v+emZAstQmbS/rOdNB45NxtaiV?=
 =?us-ascii?Q?DDkAh1oUL0YU7B+OMIG649Tht43A1JojPJnFHkounKYFRP0znQ0MwRw2enLC?=
 =?us-ascii?Q?RHHG09dAsXGQE7uIDrTsp4MSVwaHfQ2cVD0RXt4e2SfXbabsjoAC6rXY+gng?=
 =?us-ascii?Q?t7iR1m//aKYEnlZzX4ih4t/f7p3B0iylfnzVReIkmDoJWGi+i8PK/26yEO24?=
 =?us-ascii?Q?JSl1A94e9cRy0q3jp1h+eSYOVrBjZvHAo77Oa2NF0H43zA+egX2HHrnuV4EO?=
 =?us-ascii?Q?l8n8idnE5tVB/yKfxNgmT8E/px6y2gTWjkEO3KBRh1fzeNwBJgN/56OHM1pq?=
 =?us-ascii?Q?5Tdcz1v4ptvQqefxSY9MYldwVACION6gxkH1VpCteNmqDDSThgbVpWa5Q7MN?=
 =?us-ascii?Q?QUOq+7KsvEMfYxfuAJdllc88QfSPvLRxz1OzZ4CoC9lEnkNnTrbc1TYe+66f?=
 =?us-ascii?Q?lU0H2ogckk8UxIGuTvYbUE2dVQjGDebTZUgkNt8xDUoJFy0ry2No5e+j/xcf?=
 =?us-ascii?Q?LogmFnrzY6kVkBTEbpc8aqxICM7J8RsJx10ymlAEW0mo31PUgsYtVMIfELob?=
 =?us-ascii?Q?8y9lieH5Nspa6WE2OVcYnrxkrPt9lRT8GzJd/C4sFeWKdAM+RRX4oDwbZQcm?=
 =?us-ascii?Q?NT7ap6X2Gbd0LFAes7Yju7W+2e8uuYDL1bX31V6ltueaVyaAY1Q4gx+gjnZt?=
 =?us-ascii?Q?8/dLPm7cE+LVTYBn8bm2a5DA724/Q9hopfhKNDt8PsNn+B/H6hs/aV4ACfqO?=
 =?us-ascii?Q?IqzYlNkdZ1sJL2+8kG8naL7ZFJU2K04sd9BTfFOJTGHwtDjZNAU4Uiu/Nc4q?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 588afc7c-012d-4a1c-665f-08dd613ebd4f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 08:20:24.9523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2BueRV6QP6hbrpJTzwgc37UXMps9u803e4LikXIRyhPJDdyOlIAYIdniniRxV3DKHMFzhlVUUFW8ChcOq94ApK3dBt5T1ZF1GOGHA9zb9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6241
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

On Tue, Mar 11, 2025 at 11:34:56AM -0700, Lucas De Marchi wrote:
> Allow to test if driver behaves correctly when xe_pcode_probe_early()
> fails. Note that this is not sufficient for testing survivability mode
> as it's still required to read the hw to check for errors, which doesn't
> happen on an injected failure.
> 
> To complete the early probe coverage, allow injection in the other
> functions as well: xe_mmio_probe_early() and xe_device_probe_early().
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 1 +
>  drivers/gpu/drm/xe/xe_mmio.c   | 1 +
>  drivers/gpu/drm/xe/xe_pcode.c  | 2 ++
>  3 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 023290e5be392..1b443f54ee16a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -728,6 +728,7 @@ int xe_device_probe_early(struct xe_device *xe)
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
>  
>  static int probe_has_flat_ccs(struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 70a36e7775466..e1470fcf95d6d 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -138,6 +138,7 @@ int xe_mmio_probe_early(struct xe_device *xe)
>  
>  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>  }
> +ALLOW_ERROR_INJECTION(xe_mmio_probe_early, ERRNO); /* See xe_pci_probe() */
>  
>  /**
>   * xe_mmio_init() - Initialize an MMIO instance
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 9333ce776a6e5..cf955b3ed52cd 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/errno.h>
> +#include <linux/error-injection.h>
>  
>  #include <drm/drm_managed.h>
>  
> @@ -323,3 +324,4 @@ int xe_pcode_probe_early(struct xe_device *xe)
>  {
>  	return xe_pcode_ready(xe, false);
>  }
> +ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
> 
> -- 
> 2.48.1
> 
