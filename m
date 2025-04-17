Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03D9C369C2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 03:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8236010EA10;
	Thu, 17 Apr 2025 03:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPtAtkW4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3CB10EA10
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 03:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744859184; x=1776395184;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2EDFIPpvHbkjqkUCeFoPdYEkdVYQtZ3af6o6qGOASC0=;
 b=jPtAtkW43yZQ6HcaT/cstu8IA0nFkMnOuqdAbZnd3Dt4SXpwETi+XlXa
 PQlEy1ggTf9NbHE2mbfsy9B/d68wzLAR3tfgzKy/m6OlkqBKPXhWfrouI
 SklIvcNtBgS06i2E2gYAYvtMsoW1fU5j1lT8gDQsYzWrk8cjPywy9WJgk
 NNz0yiUfzLZKtoQ3UJFgSx4x8a4Z11Si+/c4hbpTGbjBJ7tDiqZX1jdCr
 iQwOkEpUfb99ylQR6sDhqlQRlpe6JCE2kXA3SGnr233HO5UoEhjqbWfkg
 SWCWRvYA2P3NwdkSYV/VYU6fL4ioNpmy5o+3MwMpmfvRMqrL2WF+mccvG w==;
X-CSE-ConnectionGUID: q1emC0gbSgaBKnlCID3n6g==
X-CSE-MsgGUID: zwRP6WpITAyTdyIUtv2FBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46328034"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="46328034"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 20:06:24 -0700
X-CSE-ConnectionGUID: zBf0aYzqQFu1Xed+XZyc0g==
X-CSE-MsgGUID: e2+K+TjJRUuoj8EKQ5+M+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="135648861"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 20:06:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 20:06:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 20:06:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 20:06:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGWtBVXlrYsdm8sPGtfR6BOsNinPq8S2V/bkPnYdMncR7Z1FzTIAkCXGF0dw+pjqehUoHpAm9tEK7hOQ4MTha+dTiSQn3QTjfHZ4TDuJpG7Dr55/t9wBI2EbRpf4ptFhhaniXMg6fyrhNY7i4eDA1yLTwByq6b9aa0wftnBltjE3wb99J2cVk536hgPrNggLaIW8YSToFnuqJpv19oQ/impU0e3EEkl0QPXDo6466SmjZ5CwIP/JWXP1Q8pcaeBSANkSaZUTcP7YDOXhJhjzN6N4Vnsc4upYWeMee+LBFHhRqB/AMhCpW46VpPi6NJBHHfn0ZG2X8uNY3V7jFV12KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVwlOyAJepxuDNOjEzmEcNTTYkhBmXFgU7rtoOesGn4=;
 b=Ps/ypkn7biQptrYDl9QmuRqc1ulneruWPoVDijSUSSRIwiZ8Z1EecDLN9R64pvnRUwv9O9zyctSkqGLgQIj6JUIUgmplCpTcbccZvyXAmj0hLoaXKjcHS/+WLAQycHL+0bAkf3Yfd2craxB4/8axrECF5qAOvaVJQloAp6Jh/IKFVGFmE9PhZ0CkwczTLVR6O7P+W+vLDmwjh3RYR3tNgQAP30+27ll80zt4QhObxYumAL6dZAHSU61TLLdKMCMuUmrTEKx4mzuceh1OstDpl1+nRpLfry+ShJoP0e/fKFkoMbttfUD2v62KX9ousLUKNuUmW2Kq330NgSUl1Ink5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5885.namprd11.prod.outlook.com (2603:10b6:510:134::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Thu, 17 Apr
 2025 03:06:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Thu, 17 Apr 2025
 03:06:15 +0000
Date: Wed, 16 Apr 2025 20:07:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 12/32] drm/gpusvm: Introduce vram_only flag for VRAM
 allocation
Message-ID: <aABwdyACY3nfxcST@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-13-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-13-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:303:6a::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2b9c91-2fd0-4e6a-b71a-08dd7d5cd12d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t6D3oR4/fWiLxJiSSPW/bEmkLp4UrhtgnNsauSvNyN3Xikxro01zx6yL4k8E?=
 =?us-ascii?Q?Ik7rNhIfWOqoKQgGpysO6uYW8bDBoli9z65BX0UATpsSxwcKa/FfPQI8ezSX?=
 =?us-ascii?Q?PJx/TN3OFxH4ELcVh08lZgF7BCeLBO9ZbSaYafDUNZpZYTFp+Ium09m9BO9q?=
 =?us-ascii?Q?bEMHMB6B7n6vkPNaFwkyCKxx2LB7Cbi/gkjA1wo7w69vT6qiCT59IQ9orsHZ?=
 =?us-ascii?Q?hNZ/L0N+OXbTXPgXW55svgV5ASZtnR7KHbRgLew4sF49bw5V1KoO8ryqS5yC?=
 =?us-ascii?Q?l2wW2oFOLwAU8KXFKIZMgcumi9OrBk/gJEQxu7Cfrb1YyqGAplEpIqmPyu4w?=
 =?us-ascii?Q?I8z26kbsicA1j9ZFlNb+YoWQQbIB0SSJPqM1/lFARy7/6Xly+qFuAXkyuCyP?=
 =?us-ascii?Q?oJnU0IN7il8QzGK+IkMGQQS5dMsMMeFJmfJ14rLTjCWcyLEgreZnI8iHHZbk?=
 =?us-ascii?Q?CnzWzH6LzQmQ8xgMZY6JBP87R5Ax7K9LW5W6znyJLNV7vQ/Cl3MN8DA5ku82?=
 =?us-ascii?Q?gk9lpybFffwSQ19S4Id0Go+3ivZ7bHcSq28XXziJ2kztCHrkv19dOIfviEpL?=
 =?us-ascii?Q?m2IreGMIKjN3SGAyHKOT/J2XGcrn/KwjhC97kKgyXwuN11ndi0cg2dlAmLy8?=
 =?us-ascii?Q?E2k10KMeSPfl40j8oJN5DvBr3wotfb9YgATm7iMKzo1GVyzln0UyaQnPHxbx?=
 =?us-ascii?Q?xwzHLmewQWG9J6h5OJlaTGtN5SKZVx+mK0cpNYE2gAotH47Y4C3FsBNzSzks?=
 =?us-ascii?Q?AXc4RDJGu1R+HAs93AL/jtfNiBEQAlLDgp4D1W/mj7t+XPyuRipK/ARzvOsr?=
 =?us-ascii?Q?G/zEG1SnlY/MG8ozXlWP1EDyIam/GgEqeEUvKvGR19uxmtT3PrZYcoMQW9st?=
 =?us-ascii?Q?qvMUvAXSreha4OCwSp+gF01nitFCtm2RKGllWvJKJpsFJNKUeC/XbomkfS8I?=
 =?us-ascii?Q?eGJ/XIjEd+P42moqoCkRPcdHl9C9V5sXe3SqyyjJ3t8q6CXVzASyvOTBgXEL?=
 =?us-ascii?Q?U3ZMSTym6t5cE+5O5XiPeidiugmczHA9lfAAYft4jX6zA5GGgvN/3cKAUdK7?=
 =?us-ascii?Q?M8YQE+7SSbFDKB8tjjofTG5C8v3dLR0l/fipYFaddV0hMr9y+oRWlLI0vOfQ?=
 =?us-ascii?Q?XMpSt5h1mwEUZEZDFzUTK/MF06SQEFsFrlsEL96dyJipc8O5nl2VjcORUDyU?=
 =?us-ascii?Q?R4cUakoHHKkUSlS+xlEtUyp1malax3M0aYNZGaGK7Ff1/76ukeaU98oMuyf/?=
 =?us-ascii?Q?BdoUP0yUU4VydHsOz8GcxtrTOuLniO8tvLUb5eDhDdmoc5gG0QfEF7/ZBD92?=
 =?us-ascii?Q?qJx0q80e5mK9mvk5hlkLdXxunTT0ppshpAqwFNnx4oUUuvLp3rMllBWDPp3Z?=
 =?us-ascii?Q?zsLrREs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qOoX5HO45ViUXro7KOGkI4m3F7tvudDnFgtT0dwfPAkg5GX8X7H6yxXmMmnu?=
 =?us-ascii?Q?wGQddtxFJCa2HYRnYA6JrwryO1umve6tAdIepdVn3XltHrOboDrzag7a95xT?=
 =?us-ascii?Q?RZzk3tLPjhU9VOIqpjgDqyOYagxYlQZL8muCTgNEHaqlvom3VG2H5c4TDGCI?=
 =?us-ascii?Q?epnkeWTp3XoHDl9Vnao8RdzJy5NxiJIZe+o/nWGo1gavcJItAjfLpQKAj7Ng?=
 =?us-ascii?Q?IkRO5OolDrir2HD6woIHHVI1YC2qgzW4HjAFFHL42tqOrNqCGhUTpjfNNmyP?=
 =?us-ascii?Q?1LGo722sixKNerxpJg11CF+PBMscnh/dYy6XIslnQqVcSYVoDLxbnEZDKNcQ?=
 =?us-ascii?Q?SQ8K1d9WIyPGabrAho1x6NU9sZPNecjewbZQ2SzwVZdZBlUiji4F2B59YRii?=
 =?us-ascii?Q?KlCdu46/Zcf524tGmV4/szWcXoMaSwQGdUD0wd7CTVKTX68LOVg4Vrymm4Qx?=
 =?us-ascii?Q?Z2CjeuJn2/Z6INRGSgGpF0bJCX6PjwDKxnvxq7R26n7aCr9EOMhORVnGsTv9?=
 =?us-ascii?Q?zlq5cFNeV42/1aoU2n7wbG/reg2GNPqsFdyg5geEoCTdVbnvFOMqPxKu735K?=
 =?us-ascii?Q?LXyfMJWUCIoJBaCE4y3ERlH9nnPPiETqycUQArYozGMYaAHpx+154adZlR77?=
 =?us-ascii?Q?0f6BAGymDOkiYKxfKlWeP37objloUxeKoCop0FXnEsFvwrrxCd/v3GnLcqek?=
 =?us-ascii?Q?WKfoFK8wNH4wrX3caSxQvdvWC9rDIPXBFL5rGfuKOIKoyil9OdT2Wrp6B6ub?=
 =?us-ascii?Q?lyAlBxlBObAkVJmAZKry4ilyMZSw25d66oXIx5OhD26J9jEUjSw90xzUXGvW?=
 =?us-ascii?Q?Q0h4xT5ghResWCLOR+hHFLfxZtWQbY0cRNcIxmI+FcMGSNFGphd6lixtpA/C?=
 =?us-ascii?Q?0ZgJq+T36gvv6tgq5+fmiI5aG9fe15AfOWcrpJDdLwVwrB245zKF9AMmIeSg?=
 =?us-ascii?Q?vTpXfWaV3DoADSZ2P/C4S6RrZGfBrp0blskNnu5p18Likl7j5vwl6hdtyYLc?=
 =?us-ascii?Q?tzSUgK/eaSgDsnG84NFc4H0LzEYZ0W0Iz9crqLZPww66i0Lb0vAApaiaDGMD?=
 =?us-ascii?Q?CB0Nj2a0yUrRo6suxgPxHA0ECu+ZVTVPFa7btc9dUrVkKJJVmyaehbbi+wko?=
 =?us-ascii?Q?6qP95O6nEfX2+k+ax4SiiXubuQh+Lu4/RpKfOnR8CdiXOrfMk0D1sqZAiRxT?=
 =?us-ascii?Q?E13JWob5G9amN2MEowezde6eQ8upF4ncB8XKxhUfJuHkn9sbX0zng9q6MODg?=
 =?us-ascii?Q?wEt4vZkWdiI2NoPg6BZIu4RDYc50vbYRZwtYi16Qgr47fmrPk+nXNTjh/0Mj?=
 =?us-ascii?Q?ZfUfteQT3gHe1x3OM/8edw4w75Df08TyJNwDCF5sZMKO8PwLFt7a6g/m2wGh?=
 =?us-ascii?Q?IhJG9ByQ8WZHCGpFYVD/Wfgl8FyUAqoRdZrAp7CkAuVOMW++cBSMLe7apZIy?=
 =?us-ascii?Q?Wr2Bf6OhiWRGbpNPgUg88pZrEJfZblRqOUFZ5PO+swDcEuEuhYsu900SsD4U?=
 =?us-ascii?Q?JXDMQCZ24KPCW4ZuvW/XewEg/s96ZjxGJR431QqBCANGbzyFmffgM1d0KPr9?=
 =?us-ascii?Q?1WH3i8zz+jGXUO64Utku3zdplcWa0rnxnThu9VJM1gCznlY4X35jTFkzjo3V?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2b9c91-2fd0-4e6a-b71a-08dd7d5cd12d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 03:06:15.8306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loh4GjY+UxImF2h+FU2xQQv3YSwvYk/MMZkpEbNVQbRkgkiknFgv3HSkCGGeeJ2EwzWquxEjnZ/YtzUj7XoTYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5885
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

On Mon, Apr 07, 2025 at 03:46:59PM +0530, Himal Prasad Ghimiray wrote:
> This commit adds a new flag, vram_only, to the drm_gpusvm structure. The
> purpose of this flag is to ensure that the get_pages function allocates
> memory exclusively from the device's VRAM. If the allocation from VRAM
> fails, the function will return an -EFAULT error.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Again this is included in [1] with you remaining as the author.

Anyways:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/147846/

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 5 +++++
>  include/drm/drm_gpusvm.h     | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 2451c816edd5..149ac56eff70 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1454,6 +1454,11 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  				goto err_unmap;
>  			}
>  
> +			if (ctx->vram_only) {
> +				err = -EFAULT;
> +				goto err_unmap;
> +			}
> +
>  			addr = dma_map_page(gpusvm->drm->dev,
>  					    page, 0,
>  					    PAGE_SIZE << order,
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index df120b4d1f83..8093cc6ab1f4 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -286,6 +286,7 @@ struct drm_gpusvm {
>   * @in_notifier: entering from a MMU notifier
>   * @read_only: operating on read-only memory
>   * @devmem_possible: possible to use device memory
> + * @vram_only: Use only device memory
>   *
>   * Context that is DRM GPUSVM is operating in (i.e. user arguments).
>   */
> @@ -294,6 +295,7 @@ struct drm_gpusvm_ctx {
>  	unsigned int in_notifier :1;
>  	unsigned int read_only :1;
>  	unsigned int devmem_possible :1;
> +	unsigned int vram_only :1;
>  };
>  
>  int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> -- 
> 2.34.1
> 
