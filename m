Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D54C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 21:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4A410E3CF;
	Mon,  8 Jul 2024 21:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3xkqgJg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E571610E3CF
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 21:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720474470; x=1752010470;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WA6uo7b+OwB36GyI0H5dLtvoYEAmUCgzYBuajXbZs0I=;
 b=L3xkqgJg0wYh9+f2I7EdepA/FOLfzBr6NYDht5+rvoHofygMsxD6Jy0q
 p7mVwxFGX0ie/CulRTG+tnMH5Ji4YkTXR8b/EfulivEdqvouZUq47OpiQ
 9MoTob2Ns1MbhATH8yWzSmQAc2npW7RLg4o5MSIe7LSRe3zk9luUAE1o3
 pkls2DCl8FtKaVaYC6jF9IPqxlEeW9hS734lULmkqeLbTVgQNcZNCXUSN
 htkGc/AGk9AjUWNgBgBq+06MeNklFnU1Vi6mAzeTldW9JNCny+H5fvK2R
 CVq0xYIxPqPknCUlN/fAhRykwOlaY6o1iYufenSsUGGKeexqss5sqHnjh w==;
X-CSE-ConnectionGUID: xyTsj+srTKulMCdvKX1pxg==
X-CSE-MsgGUID: ZIka5LpUQnG19FGAzDlrrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21511955"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="21511955"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 14:34:30 -0700
X-CSE-ConnectionGUID: HmlNxB2lSs+WtJeEebcoUA==
X-CSE-MsgGUID: D1Pi4OnSSWmQrT0emShnWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="52230571"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 14:34:29 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 14:34:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 14:34:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 14:34:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFGU5avwWH8K3QEmJABy4kZRf53DU7VQ+5IIxTXTF8MThZC8bPg5Mp6xKvrX7WIAbnhAxp+PHuqsyhhpfiiPt69Q9RuS0NsMxFtJVX+s1CD1AFmOa1CzYtpphhdHMgN573T+r678QbO6hdRjND1ir7Qg6ZfKKjBQcagWYlnMihCJnluha2s+iD9m9iUnvqM5jVQ1eSgfb0TM/CBwEtCShbBYFQpMiwDzBAqNflTXQpSBDXPqj+c2MJzV0fGuOCLwAE0z+eG2D3qUSINq6mkLxXAEOY9X7gaLJ5tnDcXHz2qjMOC5miMBQUuAAYyi8jnMVkZ0tXby6nKZw2kBEgyKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otaLgA50B/C5mlVQQOA6Zh6p/SkIaFXRqqCk2U3MzAo=;
 b=bNj2oaUaZWVBaOEJkhPa5dYb4YrzG7sIbxY3MP2l4jWBYsTIUuUrHMMrHwZhhcldzU0Ftw0BUBxdxd9RqGKFrIQPrqXojGDD0o4R55zjXeRK+yea2/XYSdq0+aaUox5V18Bniz8X2rUtPM7LTzLQF8CIv+qGlJtS9/zstqmZ4JvcJOqb5TjGgCHsuJ+kRkE70w6pkSkiCjQRXl8AMFkLxfSpgb7AypAl8COUxqED48GB5DNpSeioMKjzPXhP3VYgU/0KBO4n2eaxTOQyJKqfmE57tIalinpijXhHoOUHuWDVE48PbTIwJUBVgIEDaIkDpKzCpapnxAnURkydkz5jnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB4965.namprd11.prod.outlook.com (2603:10b6:510:34::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Mon, 8 Jul
 2024 21:34:24 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.017; Mon, 8 Jul 2024
 21:34:24 +0000
Date: Mon, 8 Jul 2024 21:33:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 5/5] Revert "drm/xe: Do not access xe file when updating
 exec queue run_ticks"
Message-ID: <ZoxbNHOdG1gnVkvx@DUT025-TGLU.fm.intel.com>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240708202103.3347869-6-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:a03:331::23) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB4965:EE_
X-MS-Office365-Filtering-Correlation-Id: 659df9e2-a944-4e34-77d7-08dc9f95bc63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ko1vX8v5iaVOTFmeBwSbcvBRwrjSM/Hlo0Nm+rMEf/TASoQkzGqwFpCh0wk5?=
 =?us-ascii?Q?oSgpRdFkTyHkvGpT7Ha5S5XpZn7J66OtQlSq6DfMyaouuTrIfEsyJPK640b5?=
 =?us-ascii?Q?F/H5UroRjmBjGzGPl1Qo7ZmGI5ZGOkzsmqy0bxfoRrPXDuCRLU3WktKN6nkG?=
 =?us-ascii?Q?mcF2Bo+QjfFT8niQEDLdChR4PjFd9+0xaG+pLAry6rbec+r62b2EbpudMR4c?=
 =?us-ascii?Q?6zoL+Rn/4JhLVRnxoU0FfLXwMkBiPKeDsQcfxHLpmPxwI7iNbqXKb0k2Jc2m?=
 =?us-ascii?Q?eu/SV2O2dyx0pkT3u32HUpk1wTNdFRYRj6eYjJxlsjWFmfyDPwo4YJEJ+s/9?=
 =?us-ascii?Q?H/t5Qzcl2tETN3yhhpiVfivGI6ZbDE4kSh33D6SHlQRu28fjMVDyI/HNnQLR?=
 =?us-ascii?Q?ngU0giTlEu2hX0L7hdx/VajYwPcufScfrFg01Jbh4ATicNRoRV3dErkG4oTs?=
 =?us-ascii?Q?oI4iGS4mKJ8MnOUcV0JJhR9qUrePlOavvN3dJYJbN8NHCaqiymhHqW2p8adh?=
 =?us-ascii?Q?SsEiOJCY/5LkmQecH8ckpTCXDDSvi9KztWSS20Ew9QBm9ki9YiPqH4iGYlfK?=
 =?us-ascii?Q?8iBRVt2F8DAZ9sOR4NjGLcQyHLILfFXVJctpinEfPmXAobJI4aLinw98m29R?=
 =?us-ascii?Q?nI7aTp7pGjqFjsnciDzVe3BzUDWr/013ylrPWYReuSollWyMBtTPggNFg+qw?=
 =?us-ascii?Q?waqHP0ffxMa8jnN5dkja6Xfmm3IyQRfLAMI6DutGEonUwV7Z/l+PF4NL8wSf?=
 =?us-ascii?Q?fNOho7+t1smV8MgJaqA+BxQjqXMDSTaAmonrgjXjFbsnmP16HDZZXoW/oe7M?=
 =?us-ascii?Q?MAnmME1a2s/IMIopWOxcrvG4YgOPytQHTtgiMmG33k0fx+9I6A2qX/zkPrS3?=
 =?us-ascii?Q?DfX17URJE67wyjFOR3srcIJTsQfwTICuQCDcvDnxB5sqlOcP4rspekOGF/rg?=
 =?us-ascii?Q?eoOF4pTHxftIVIzWRKOb5lopc7UrJ84z3UHYLLt1yU+DDccjo6SwjKZNIBro?=
 =?us-ascii?Q?OE5TGoBpbOShoju/TFkz0tD+XeSQVqmNGmhg0K6Wm9VsNFxCIqVZtLF0+aV7?=
 =?us-ascii?Q?GmHJouZdOgoXBJ1tP7MKya1yBH7oS8k3QZOCmL89K2pnrBqbCvq+WUTDZJ3G?=
 =?us-ascii?Q?QrB4MWeU6JRdNnBo7Yw5t4brjno35R2K40PnW7IhmHLwoRCHNBoVisET8Ynt?=
 =?us-ascii?Q?p9hhwfELDG9Z56Mn7xMueMoVjz1Dlm3h/+OAEXT+FNxfOtLwo6g22q+A1Jp1?=
 =?us-ascii?Q?XX8SQn6hzBj8VSnD5zpwpLNEIb2Z2aijlJXRpoATIAIphwTmBT7Q2/6iqOuP?=
 =?us-ascii?Q?Vas=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D96Zw7U3AOjRgRh6NAjqedXbgHJe69TCc/UZhj4hCITnxy4vJwbJRm0mGGvw?=
 =?us-ascii?Q?jT6zI82qaGnDZS3Ee/pc/UmRE5g3NdajabqwcGTKE/CmQNifeASbjjKUzL52?=
 =?us-ascii?Q?iHoMdJPloZuWHnmaJH9s5uBmT7mY5yKaOu5dGFapheenS9LTtfHhlEMrMu1y?=
 =?us-ascii?Q?gKY4JajawilKZVkjJ9rhUbpQx+ggNPrpMKCr1+C5tpEJnrnFhOtbiSNSctzb?=
 =?us-ascii?Q?73p1fPxMIW30LilKBgGSqvbtyZ7NkypUNUz6ZBnAXXLjYOfSWuonYbZw8llJ?=
 =?us-ascii?Q?VEqSPik2Vsoyf0LxyUtN+SNUKZtYRvGqx291bXbppUZDCgNY5G15oxoh+JnL?=
 =?us-ascii?Q?BHXv3FdoHBRQOtcd2KLuw7Pyask8b2lltD6Drae0NZrYCKUebDDz6h8GpeWg?=
 =?us-ascii?Q?mRB7UBHfGUrHDhcdEViLVse4hXJTeku6pGNYac1vVY7C7D6d3LYnbAO5bepp?=
 =?us-ascii?Q?PQ+1nHzeTNqJRTxJu6D8kqchl8Ihm7gQnFXaCVrq9eyvZMAXwPEZu2wKEnDt?=
 =?us-ascii?Q?B/VYrdakVmNpMG3KbHoam9ub30R2V9/8cxQu8V11ykVN4KZOS2lcNvLB/lXI?=
 =?us-ascii?Q?kCJ83S4Qz5ldhMWqnvzBHAjLVv1FmjPsaVojuECz0SzU8pAdC/sBuzkdlnIb?=
 =?us-ascii?Q?ZVLatjw4p4ENK/nCMd9cHXxDFoqP5BPpqXvXcMiosqC9BkEAHh8xh2U/AMLV?=
 =?us-ascii?Q?+NwgIzT0r3kgH2W9QO/LhCszbjj7SjuNLMYtxfRzDvjndeLwmZ2e8AO8/3NX?=
 =?us-ascii?Q?k3ow2vGSHIjk95FQr3qcY+aHAIb3gAKdRxkoDIC887UoDfNZG6ubJnVFfVkO?=
 =?us-ascii?Q?Mjl6gXo4yJcwDKNK2N1ZEZHU4wRRZ6vdp0VTmaHjXhfLb/KTQb2jTdUMFof1?=
 =?us-ascii?Q?REzxvpHHZWmlbWJcvmNlP6U9JFZ4nPrqqKu7dqbMkXZcSBsKE4bicDl4C4nI?=
 =?us-ascii?Q?TcxcbQbS39SvnsgCQ4VxEdbokVTJa2C0NQ7mPDuQLza5vIhvbvix2hnDGxu7?=
 =?us-ascii?Q?zxFHEdpuLo+eYGHn0yzta9tMgjkXt7h+32B5FSlmjrtHJvav58l5ZVd+VsFT?=
 =?us-ascii?Q?USPJvWSoSkI2CtqNw4j1YfjBweQTgqZk8cJrJv6DebvFfpFAWkV+nwa332vp?=
 =?us-ascii?Q?6e5FaBM5A+U2GujOBghYWUSN0rwX3yB1jiSi0tn3d/+mzMECyKBpHYnEvFa3?=
 =?us-ascii?Q?8dxqElId13Lvc0YQPe7Wj8giwbXQdDs/pnMxSYSWTni6v9/HoWgm0Tl+/Kfc?=
 =?us-ascii?Q?jHIrTza1J7nAy27+/LRy45A5H/ficFgR5tB2IrrXtVPdw9rB83k9Z7Azfc6F?=
 =?us-ascii?Q?lm9GlwDBjZfArcJ1YEUbxJI0+bNTJqpvtaHJv0jSt0coB7LEtvOpm3HEuqLq?=
 =?us-ascii?Q?vukKCYPZqBFUQqDl9XcKhZb84Zmwyqf19aVJmqdZkYq+Unr8UNVFwC8YPYtY?=
 =?us-ascii?Q?UzM1d0f9JQMi0NX3hi49FdokcSbjwQh5ZsPKxSZa4qcyiN3zTzC39TFCpgbf?=
 =?us-ascii?Q?7jiD/hFQ9NGrwc7odpT1DFfpD3US+WUKjbt4wIL0i2UbV/s3P9cfkAQ+aGAE?=
 =?us-ascii?Q?B6y+tpePKwU6emYc2xE/4E3NX401BUcJTOTZlrtV+orrXYEbxRlIY4mUAK2R?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 659df9e2-a944-4e34-77d7-08dc9f95bc63
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 21:34:24.0223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJhX44shZCGeTi5EsxeH7i0cfCllqVJ9zxhCDFK/0vsGdyAsPB0uO2IQVQRATJn6+zOahVpczEXcOi1Oxx0YxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4965
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

On Mon, Jul 08, 2024 at 01:21:03PM -0700, Umesh Nerlige Ramappa wrote:
> This reverts commit ce62827bc294ba5f8b3909bfa5d7dbf9de8aab6b.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

This looks right once the rest of my feedback from the series is addressed.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_drm_client.c       | 5 +----
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 5 ++++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 4 ----
>  3 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 6a26923fa10e..7ddd59908334 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -251,11 +251,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>  
>  	/* Accumulate all the exec queues from this client */
>  	mutex_lock(&xef->exec_queue.lock);
> -	xa_for_each(&xef->exec_queue.xa, i, q) {
> +	xa_for_each(&xef->exec_queue.xa, i, q)
>  		xe_exec_queue_update_run_ticks(q);
> -		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
> -		q->old_run_ticks = q->run_ticks;
> -	}
>  	mutex_unlock(&xef->exec_queue.lock);
>  
>  	/* Get the total GPU cycles */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index b01eccdd75ba..719a70878fe2 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -768,6 +768,7 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>   */
>  void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  {
> +	struct xe_file *xef;
>  	struct xe_lrc *lrc;
>  	u32 old_ts, new_ts;
>  
> @@ -779,6 +780,8 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  	if (!q->vm || !q->vm->xef)
>  		return;
>  
> +	xef = q->vm->xef;
> +
>  	/*
>  	 * Only sample the first LRC. For parallel submission, all of them are
>  	 * scheduled together and we compensate that below by multiplying by
> @@ -789,7 +792,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  	 */
>  	lrc = q->lrc[0];
>  	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> -	q->run_ticks += (new_ts - old_ts) * q->width;
> +	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
>  }
>  
>  void xe_exec_queue_kill(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index f768e48f31e4..b5343cdd0632 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -142,10 +142,6 @@ struct xe_exec_queue {
>  	 * Protected by @vm's resv. Unused if @vm == NULL.
>  	 */
>  	u64 tlb_flush_seqno;
> -	/** @old_run_ticks: prior hw engine class run time in ticks for this exec queue */
> -	u64 old_run_ticks;
> -	/** @run_ticks: hw engine class run time in ticks for this exec queue */
> -	u64 run_ticks;
>  	/** @lrc: logical ring context for this exec queue */
>  	struct xe_lrc *lrc[];
>  };
> -- 
> 2.38.1
> 
