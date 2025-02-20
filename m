Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5369C021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 20:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9E410E9DE;
	Thu, 20 Feb 2025 20:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+K72AEB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD46F10E9DE
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 20:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740084376; x=1771620376;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TGcbshBGObdoz2Pxx7ks7y3qAyzH/9MqJg0WssaazCg=;
 b=c+K72AEBJpKYpgYx6NJhpObaclS8ZN3udOst/ECSRWskHsV0aGBwjGMn
 TsuEcrff4TcPb2P8zVVVfBjfJifCTZAURAZVYVm1cKEOIQfLjWzEtlrq3
 +YF4ho7r3F8DuQlBdFzTIe2kNQEoZC7LeqSeXBugwSPa+6Z2HmjKhfYiN
 NPa8fyRNAxoh7mDR5zJpu3q99pFWu8O1WMcFvpH+csmQU5eTFzPQnDswo
 XAjLtiN0id3i04SqVUKi4duc1R6ndVJYN57lSC324L/WuTFJTrkbq6rhp
 VDmKygJ6OMzKiJEl0PNi48+ZsdeI9D2z0XJOuizztOdxcGYhwWP/wulH+ g==;
X-CSE-ConnectionGUID: qyaja5djTUi+ubzby3k1rQ==
X-CSE-MsgGUID: z04fAMe3QdqNEU2qx1nscg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44534142"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="44534142"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:46:15 -0800
X-CSE-ConnectionGUID: jCcbvCzjRPmNxMim2GrI0g==
X-CSE-MsgGUID: 7vUivY8bSzuVfaTSnBhVSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="138374358"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:46:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 12:46:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 12:46:14 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 12:46:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRG0suLsb/NWMPBfOyeSfKYCoJyQ1QkZ8aMeGCt5t2n/znkXsQrIvau/5qRgFLv9vxsMLD/i1HKB8iAm46+SPbiplYz/fUZSR4tFWaoq1tEeh38gbEWbEmOPN4kdflfESgQPBIjsB43StJKRNyleGlWNwldl+ID28sZ/J9q31mAsD3oMQTtiLMvBTkmDj45iyHqEL013M3pcStKRKulaE0uo1mankAxMUypqQ8QCW6x5amGyNkhS1XuMGljde9k2qfPrssTtHuLmeKlKJE8Cb+l3M9BHSivMmLbYvnEiMjHyUceEps0oiTpxN7bDVU4qyB5sJH9gHerf3r17Wjkn3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uf2XS+wEq9AXbdjzU2yfEEWtbzOXyBlQUy4iQAMrcL8=;
 b=CNl1dcEL5NxZnetfjr0yQqvi4tPHhahLbmRtIQXqx5+F1mi8e5Ev0H3ZUXb4ry9sTRDULWczxUDKHe2rBXoI1qJCjdjdH5b3QPCR/ZeCSQQiEaKvOi5n4iKBLmXToo5rGrYhjVQukxajuqJ1ZoLPmwtj4rvGh55SE3WdCJW47FKygUMYlyY6Pq8nQK2rg2VWJwtQHK9/DIR100Nkgxch+wPnA5qciz9bYOZ69IBsvZ7U7JjwEQAO4J87Our5AaFbmm194UCjNrWIBvjG4Rlc0+9wJH6Q5cKRVK3qJlwVaRbVDkPXbZ2zgmRZY00slw1JuZg2pCM51kt0S9qh7+RneQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7884.namprd11.prod.outlook.com (2603:10b6:208:3dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 20:45:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 20:45:43 +0000
Date: Thu, 20 Feb 2025 12:45:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/xe: Disambiguate GMDID-based IP names
Message-ID: <20250220204540.GV4460@mdroper-desk1.amr.corp.intel.com>
References: <20250220172532.66613-1-gustavo.sousa@intel.com>
 <20250220172532.66613-3-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250220172532.66613-3-gustavo.sousa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: b2cb4c5e-b53f-46cd-d2ed-08dd51ef8b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YmQvK2KZGOX2CH+rXCRHvSXfoPmfZAdrGVzWYsHsbqIq0ljZ8kNq0tTKR63j?=
 =?us-ascii?Q?3bfIT7qDxX0e6uEM6pT0b2LP/+6UuxhoIAGGPHKW7O6D10LiiaAWgz50RAb+?=
 =?us-ascii?Q?pBG/fxadLBFuK1+MnnFDNFDGDvI4VNKfdoZIAbMl6q4tbTockou40engBhy4?=
 =?us-ascii?Q?EWY6t0cFsMnGgD/B2Gptvo9wWsUT+lOF3SYgazbF9CftoVODikLtj1kdafHn?=
 =?us-ascii?Q?Ap/OkKRUI4JglbT7jtg0arbGdYG2ausO0p9x0JenEPEKt7D4iW+sTdw3455+?=
 =?us-ascii?Q?wqZsfyRmBe1MywnADJrTruLqstH8URa2dEIqQK6xZsOY4meh3qxUBAl4AwPE?=
 =?us-ascii?Q?5EoylgTqlhci/dg040vR8nwN9pKD6uaILsAuLBaxE/dZyYEyZQg4iiPuTcCu?=
 =?us-ascii?Q?T44Fvalu/J0XCyNBnUo/HTiN9q8/zfbcU9LUWeBCAp7lB0vNMlV6MXLAcywj?=
 =?us-ascii?Q?3N2L4jrLEK7SUT7OAoHRwUgaDDVg0Vv4qRgvqCcGB839S0PitQrcO745xbdq?=
 =?us-ascii?Q?kf5/fAysFmCNiXplbWZlZPJ8juryXUyxLTDDwrdwPI+sy0zMkJoRrIb/bjGD?=
 =?us-ascii?Q?qaDFBTfNzvtA0JG5qDu4E1xGW/xqpWKDirIM8mvGvTxWrHbPYgUNw93cix6F?=
 =?us-ascii?Q?CwECAIJLZT5798hTHQSTVtwtPIKK/Oj1p6CUt778n50LY7eCW8XzyMHgYv1L?=
 =?us-ascii?Q?tNGCPAMEzXpL6lzEnJ9FJhxFJE/pP73jUcbSh93ojAR1A0PQbdg2II2aD6Xv?=
 =?us-ascii?Q?+iafohSQKmrxSK9Zmu1NQa2WY8CJbd8EhPNUQL2LTMaNBc4eoNq2oHvNm9Np?=
 =?us-ascii?Q?8658aeKj/g2J63FK4xEoypD7rhyCC1gxTc39iqw+PH8Rskl1m5MDz3mYTNd0?=
 =?us-ascii?Q?taK7SoDlMI335kyWi8a0QYF2Ag8gZZU/bQpgivqH9mprEnWlliqnHXrldmyP?=
 =?us-ascii?Q?eMGb50cOdeKQ+QPLZFsZ5hMTbHC+IU7q0bBxpIZyGxlMiecYrgs2ChUwgF9v?=
 =?us-ascii?Q?BnYHruZjuWnF9tFSE/0DhVtufECR4LGdHHgWO9VwlN1VT9E67C4JJL9pWKfe?=
 =?us-ascii?Q?KBlcU1zMe+6YBUV8Z3eiRx7kxA0KSBs5ss3x3vq5SE3229YJ+cFAleM0LqUx?=
 =?us-ascii?Q?obJdF3KFJiirhF6PruOnLhFz02VYzYCLA6VIsLztLNknGxnmgAMQSuGKg0E0?=
 =?us-ascii?Q?F4UJJzeuYYwOwqzx9+ankKxtxKZEQrIO1w/yW2KcQU4d/RUwZ145Pl7zpmNm?=
 =?us-ascii?Q?NBbuXGDt2hbSHQ/xgURuFZoJspoGZq4ddSI6Pb3qmaPpuA7lUJfwLA2jxYj/?=
 =?us-ascii?Q?PWOnv3xqCtlXsYhA+DHgPwAv29/N+GB6uAnVeQe7m8oBQ/bNYk6cJnlVSbXz?=
 =?us-ascii?Q?aLp4fN0QhP7zXMA8TR1VO92zozBm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2IBFj0xTnzt0Sjxg4xvMCb9vS0Gd0mS0de2zOuEg7598qQ7rJslyah1dJZbw?=
 =?us-ascii?Q?L8BxNhvyY8r3275Ggcqht1uON5NLN0G62rO6Q3qnSz5WfS8BcxQPz4ZhTOUa?=
 =?us-ascii?Q?Ibfledcy92QOcjiMaovYyD2/XT7QtPh3m8hmf2LDUNPoyIg/QFmJYEmpvY9X?=
 =?us-ascii?Q?4UKlh6oG4kHYRGOylniS9Ban34qMtFr2ZfdfWiRiZ8rWmsZPs6YDZKF94lmm?=
 =?us-ascii?Q?eqQecBZSmohGdwiNMMz5Ece0Zvqoo+Lvmelccqs005CkMxuxgIDjsLshTcLf?=
 =?us-ascii?Q?5XqAWdEdxzB1jcyYsuFeQqvRLlxE/Oih5x5b8ieC/AA+RTYYwksWn28hBxrC?=
 =?us-ascii?Q?QQWhPTnaqV06v+GLQgSqAv7J8uUCdN3WtK+iyLBq7jYJXpruvT6AO+w8lrs5?=
 =?us-ascii?Q?gVnCbPlgLu3L1763om0c/24rnJ6Lj2/YlTVmROtzCp8Glj+ehrDSP+kmpJVC?=
 =?us-ascii?Q?U4CXbEfO3i4vEIh9+5M+MSxwlFw8xYqBuD9nnFgUvQcseGD1y55bno6wp02K?=
 =?us-ascii?Q?2UqBalZ1QCDgicpKza0WGhQ7cVl5R1rlRJ/+KxGzttJq2mLdLLXUyg0tdfW4?=
 =?us-ascii?Q?Stw1aRD9bMGVARVxpE07Ulz+oqeN9Qt9VapRAn6m2fSUaVgKDhxYjsqv4k5G?=
 =?us-ascii?Q?othUkztnL80Syiyc/ZoN2hVVsS4eNPxvkr2P3UFMcCR0N8Twv4PXNpVYYWJ9?=
 =?us-ascii?Q?AtPdHG2ZljTTmvFEGIpJVvBAtR1Z/DaLE9di9tsi2bVUy/Pq5dxQntZjcd6l?=
 =?us-ascii?Q?ZVBDFrD8FWtWZwq6LHV/R66Uj//mdvtamopmXJv6HxDKIw8JpyXDWwxROmKH?=
 =?us-ascii?Q?QlJv4uB8b90C3qXP5H5t1TVKwaY0w1PLQnvxJVBoj1BGbmkHRMaErEy7FiU2?=
 =?us-ascii?Q?Yy/nC2JktRVQSUaSERLeIXE9nnT5Y/sdV6GP6DlAeCcXXa7ASGnFNPf1wzHL?=
 =?us-ascii?Q?aL1eh1K5oicrolQKzE3aj2BeC8M8DzdXAq67YRqDyjF64cTLdveBHinw09kU?=
 =?us-ascii?Q?KsiMrUxgvrHzQ/pAjt8rUeVF1pqe7gN57Y1ya9mdCCqLP1quyhc0YqRTYhWf?=
 =?us-ascii?Q?53Jo4EoUHUHT+JfCbJ4KJrlBoXef9XKXic2R9TdpnJkpzqx07aufZsArwkav?=
 =?us-ascii?Q?B87b+Qe9cC+S0ERukF5Gx9ioCQQRg1TvhEvv2dBcmvyBSF8CAOg+eORY9JY7?=
 =?us-ascii?Q?zAmdYW9p27NtYzJ2RgpYFLkWcBf3xlnECPDNJL3UnkMUPTLgnPJVVeE8LGYK?=
 =?us-ascii?Q?Aoht+Iha3Ym/n/rfC6evW2zLQaj2YViFI6keO9a4yRanT9mTwdPjSqYxkO8w?=
 =?us-ascii?Q?tBBxgncmt2CwL1N++abVMskwcXtQm+7gfFwBH7sITkj87RvDd/a3g12aw7c6?=
 =?us-ascii?Q?dXfnMA61mZnJnlfyciWKgx2RO35AIDS0NPkTERtXjLu8yYl6FJInV72X5uZo?=
 =?us-ascii?Q?gNVoc/DhWo1PYnmeZe8O/ad+wpYBMKG8RxKOBvJvv5Z3y3nEPnR82yU8fMyz?=
 =?us-ascii?Q?b3x7Wo46THj4e3rWdNxHvsRSK12RMCEXI6fcnbKBXMiAD9hIgsDoyYC2ruxm?=
 =?us-ascii?Q?zbNByNjlMDbFKPp2Zp2qvAQ+WbzPM8UXXaDTNAEFc+gHrcdA+ZzBv2S5kGkh?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2cb4c5e-b53f-46cd-d2ed-08dd51ef8b5d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 20:45:43.5094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ypUW4e/PJMGEsQlCizLUEO5tJPD5F4nlG+hMKsvjfacDYGRin8OpZT3Z6kJLlJs8rELzM7752uSnF4DVQR7KL+hPQfjZ78jSxVw4IFVlmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7884
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

On Thu, Feb 20, 2025 at 02:25:09PM -0300, Gustavo Sousa wrote:
> The name of an IP is a function of its version. As such, given an IP
> version, it should be clear to identify the name of that IP release.
> 
> With the current code, we keep that mapping clear for pre-GMDID IPs, but
> ambiguous for GMDID-based ones. That causes two types of inconveniences:
> 
>  1. The end user, who might not have all the necessary mapping at hand,
>     might be confused when seeing different possible IP names in the
>     dmesg log.
> 
>  2. It makes a developer who is not familiar with the "IP version" to
>     "Release name" need to resort to looking at the specs to understand
>     see what version maps to what. While the specs should be the
>     authority on the mapping, we should make our lives easier by
>     reflecting that mapping in the source code.
> 
> Thus, since the IP name is tied to the version, let's  remove the
> ambiguity by using a "name" field in struct gmdid_map instead of
> accumulating names in the descriptor instances.
> 
> This does result in the code having IP name being defined in
> different structs (gmdid_map, xe_graphics_desc, xe_media_desc), but that
> will be resolved in upcoming changes.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c       | 31 +++++++++++++------------------
>  drivers/gpu/drm/xe/xe_pci_types.h |  1 +
>  2 files changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index feea897f130d..a61a8982ab67 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -149,7 +149,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
>  };
>  
>  static const struct xe_graphics_desc graphics_xelpg = {
> -	.name = "Xe_LPG",
>  	.hw_engine_mask =
>  		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>  		BIT(XE_HW_ENGINE_CCS0),
> @@ -172,8 +171,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
>  		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
>  
>  static const struct xe_graphics_desc graphics_xe2 = {
> -	.name = "Xe2_LPG / Xe2_HPG / Xe3_LPG",
> -
>  	XE2_GFX_FEATURES,
>  };
>  
> @@ -198,7 +195,6 @@ static const struct xe_media_desc media_xehpm = {
>  };
>  
>  static const struct xe_media_desc media_xelpmp = {
> -	.name = "Xe_LPM+",
>  	.hw_engine_mask =
>  		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>  		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> @@ -206,7 +202,6 @@ static const struct xe_media_desc media_xelpmp = {
>  };
>  
>  static const struct xe_media_desc media_xe2 = {
> -	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
>  	.hw_engine_mask =
>  		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>  		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> @@ -376,21 +371,21 @@ __diag_pop();
>  
>  /* Map of GMD_ID values to graphics IP */
>  static const struct gmdid_map graphics_ip_map[] = {
> -	{ 1270, &graphics_xelpg },
> -	{ 1271, &graphics_xelpg },
> -	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
> -	{ 2001, &graphics_xe2 },
> -	{ 2004, &graphics_xe2 },
> -	{ 3000, &graphics_xe2 },
> -	{ 3001, &graphics_xe2 },
> +	{ 1270, "Xe_LPG", &graphics_xelpg },
> +	{ 1271, "Xe_LPG", &graphics_xelpg },
> +	{ 1274, "Xe_LPG+", &graphics_xelpg },
> +	{ 2001, "Xe2_HPG", &graphics_xe2 },
> +	{ 2004, "Xe2_LPG", &graphics_xe2 },
> +	{ 3000, "Xe3_LPG", &graphics_xe2 },
> +	{ 3001, "Xe3_LPG", &graphics_xe2 },
>  };
>  
>  /* Map of GMD_ID values to media IP */
>  static const struct gmdid_map media_ip_map[] = {
> -	{ 1300, &media_xelpmp },
> -	{ 1301, &media_xe2 },
> -	{ 2000, &media_xe2 },
> -	{ 3000, &media_xe2 },
> +	{ 1300, "Xe_LPM+", &media_xelpmp },
> +	{ 1301, "Xe2_HPM", &media_xe2 },
> +	{ 2000, "Xe2_LPM", &media_xe2 },
> +	{ 3000, "Xe3_LPM", &media_xe2 },

Can we actually point all of these at media_xelpmp now?  I think early
on there was a difference related to GSC, which is why we had two
different descriptors, but now that Xe2 and beyond have the GSC enabled
I believe the two structures are identical.

Aside from that,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  };
>  
>  /*
> @@ -592,8 +587,8 @@ static void handle_gmdid(struct xe_device *xe,
>  	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
>  		if (ver == graphics_ip_map[i].ver) {
>  			xe->info.graphics_verx100 = ver;
> +			xe->info.graphics_name = graphics_ip_map[i].name;
>  			*graphics = graphics_ip_map[i].ip;
> -			xe->info.graphics_name = (*graphics)->name;
>  
>  			break;
>  		}
> @@ -614,8 +609,8 @@ static void handle_gmdid(struct xe_device *xe,
>  	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
>  		if (ver == media_ip_map[i].ver) {
>  			xe->info.media_verx100 = ver;
> +			xe->info.media_name = media_ip_map[i].name;
>  			*media = media_ip_map[i].ip;
> -			xe->info.media_name = (*media)->name;
>  
>  			break;
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index b96423844952..8e586d02d089 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -39,6 +39,7 @@ struct xe_media_desc {
>  
>  struct gmdid_map {
>  	unsigned int ver;
> +	const char *name;
>  	const void *ip;
>  };
>  
> -- 
> 2.48.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
