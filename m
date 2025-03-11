Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EF0C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 20:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57FB10E282;
	Tue, 11 Mar 2025 20:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvyjL3iP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE4610E282
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 20:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741726538; x=1773262538;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y1U2aI6B4Fa+I+kcNHFqBWeg+AktSJy8GgMoq4AjScU=;
 b=fvyjL3iPyc18GXBRmK3Z5koNxYAV/jl535p0ZE9EQ6RqkidCI7lApSTl
 PZM3fpXOAv/Sk/nFqgquvW5PJXXQJsp1GM/bNMYMaGpFEzLy6KuOTJ/1K
 u6VBG5dFsxH26nTDH6VWL7abTxjM2L/g9mk1zGnwhkQaoron3jMsUOWiU
 MKK7rL4ePZhANtAXo6I/AN41i9Xph7NRH4MQCQuOCk997ymyx4WjP2SaZ
 HLellMfvkAofhw3xAT0hnl+iSQM/dzQXM8sFYGbefDxysUV4IjaofhBmb
 DUWF0b1UmZnIyVliHoEVUBxpni4aXvOMiUr0Q+eN6nlQJJk+nAHv1unSS w==;
X-CSE-ConnectionGUID: KHpVqbHRT7iZbYCbdqr88Q==
X-CSE-MsgGUID: qXlP5NeITlS9oGwys11NzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46431867"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="46431867"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 13:55:36 -0700
X-CSE-ConnectionGUID: J0VcKYulQpeSlygJbuIcSQ==
X-CSE-MsgGUID: n/20jDp1RXWSBZ0syuZF1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="125465857"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 13:55:36 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 13:55:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Mar 2025 13:55:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 13:55:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbTaBFoGy2IHTM0QPpDtUkpFrUto9RRgUrSeB6OfmrnnZCSDoKWnBH+DaYRsFt3ugXvmvhPtIOHf4gsGbK+cB3231HCmgvEZGuZdjRGegQji5rIHPb02jTkHyY6PMQ6cCARcvfLxCw9jJ1p4FQjKtLct9xxIhiHjDH9v4y48nYdr1NGAwuSxtiMrfZ/i+D1dO2FRbFY6MBOxHNf19WLE72p9qWc1GCkyY33udumNMjzaVZKYgnHRVqRqVvXlK0MZdyxSxk+SOMQQCovIWVzHEONvVGA1KlFyKcg3xerIwkNGFQa5f88GGIMM4CH3PeDwWLjbSm7h1xs684VTlQPpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kt1FUOUk/vZIQJdgmNAlVD8bLS5WdDn5UnUeg8khVLY=;
 b=d2kg3q29VVC2FJfQbrEkbuezfCHepefyxS32b2rk5xjLYqdUhPHXvr55P/xuKMQIZO5RIUd8A6OeDfKeG9s0JXokkaMqLIUnGwlTXwd61YYfTzqRIjmbVMGsMye3XSNLL17rus4qyW8PbrBVXJ0kO2MI/maXzy3xzYl8tqDt94MfF8bvclhTOeRyKpORx6rYXQV829IJ6iNZ1yhbbUkZbBhFw5wraGUMpSHM7YcxikCDBsh9B9BpGNrhYi3A2pn+MkIdNPbPvrJVyEN873uHy1HZzB0+4cnls3Cwguu/W355TUcLYxeL75MZXRO1TF8FvcE76Gqt+W+3z55ezjp4Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB8350.namprd11.prod.outlook.com (2603:10b6:806:387::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 20:55:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 20:55:20 +0000
Date: Tue, 11 Mar 2025 16:55:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: intel-xe <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Move survivability back to xe
Message-ID: <Z9CjNDYFg40wqT5l@intel.com>
References: <20250311-fix-survivability-v2-0-729ce081155e@intel.com>
 <20250311-fix-survivability-v2-1-729ce081155e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250311-fix-survivability-v2-1-729ce081155e@intel.com>
X-ClientProxiedBy: MW4PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:303:b7::6) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: ed8b2f80-ea8b-4245-816e-08dd60df08cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QZRcjLxfxMg0M8kxEFNnzaA4/vJ0ePdKGD1rppJuuifvavyYU1zhYvCgeMMU?=
 =?us-ascii?Q?9+y5H+GLPPcs6xCTI5HVtfncSYQbrUIaqIvaSNsR3PDt6hY+e5e1fWyFJ4jS?=
 =?us-ascii?Q?lL9F+WkV+xeqU4QVMj6B00X4tth49Aan9QcMS+YhFbeF799vPUyshGfehRGT?=
 =?us-ascii?Q?pq4kIyT9scYEF7elWWsw3iN9G7XUGKIiCtNI7USVTTThatbDV4rdwvR4eHim?=
 =?us-ascii?Q?8ITq3JwURhcQ1wAbpYobX0KOMKTM+UnIC9vtcekxQo818E84qKAI3KCAhWJH?=
 =?us-ascii?Q?wB2A+xh4n01kuw+6dbmTr5/1FbcvvKrknvInM0sZxwu4359EfGt/kHIiUZId?=
 =?us-ascii?Q?4hRlKnDz2hdfF+kjyremN8ZTsn+CxMv2oTkf/a+BEWaB7WywAyp82kDVdh8H?=
 =?us-ascii?Q?YxPMii3lQ5PxZVLigpnwiKZlTe3rVMoOaIoNDDTDl0raXblbmKznHAkzHyIf?=
 =?us-ascii?Q?PxrMlt6Fv1XHELsxSO0gQBNXExZzpE0SkrEh7qrCXDrEpa5TmL4xnjvl19hu?=
 =?us-ascii?Q?tBpG1Z+Dbh3UPo6H7zFo9ZJ7SzlgwUQrg9yomF9E9J1gBwdMlnxiLTQ4mMyY?=
 =?us-ascii?Q?zrSZtCzIvyfMsHh1PdbbNIVDkRLZLTBUEs9Hg+318ZRN1W87850iohFpsjRA?=
 =?us-ascii?Q?vb0JE4eI6pk1rnhfo/OzB66xxroo1bdioiOYmjmyJheRymrQ38BZ2W5BzYQ0?=
 =?us-ascii?Q?zxCbatIoTHrWW3H8bFs/0cuL8MCpjZki6h+tfJMqC9LNV/mahwItSupv6Xxp?=
 =?us-ascii?Q?Ddk7uLARnxTg+diLRSJwWxZ4GpioB82y5BEdiSoRBUB5yp06nNA5O+P/RLgZ?=
 =?us-ascii?Q?Engy//NpSbSOg6zto2rEsaQ5Tnc+G9aaT5R0X9IWoL0xYqg853rHy9l8VmT7?=
 =?us-ascii?Q?ctW3u/NE0k+6YzsEqOyEeJhewaTlLBTRxfOkxfoNzaatOIYUtIPJg5C+KqMr?=
 =?us-ascii?Q?pSpSFhCRAV/Wo7fMR7Lh5d/YN1ERXDiS+BWo3NmG/Pm83wvvUEuIFBCfgnAK?=
 =?us-ascii?Q?tJxuY/EtIYhItvJcKmeTGcrao9j2Xp9ToM9ETOuDlGWUSnIhmYHKx+b2KB7H?=
 =?us-ascii?Q?cZKFO3zIL0qNdZ+AVHrZrqeX8B5pvdKF1wncYKuG22INknk3OrovXntvZLaD?=
 =?us-ascii?Q?7NVpfpIEaRGQOQZhxrnfoWmHmdaMdWDho5PmMSD4m2pRGkPGx8cIdzc8j/Is?=
 =?us-ascii?Q?4Mlkbyecrkg68sVUXkCWSxglaaCxaOFrJ75dOkqY53CB+1VKZjSLU5Gh0fw8?=
 =?us-ascii?Q?zYy+9z2oAx2+tb8Yg+8Ge9F4G0WM89tcDydM8DaSjqQuMOzvFx0Pqi1vXhdP?=
 =?us-ascii?Q?VY1UbXYu3nNkhmpVq6PwQJ0kz6a9E0NgwFDt8pkQRmGvQg8JUNQMF5fIoZOL?=
 =?us-ascii?Q?g36ePNaWvadcc4tpmrQTPc7u46A2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IzGDRQ1HuinIW3QdwwPL+12CaF60eWF8JwfbsOIZs2lFsA8NqcZhvU73ZbS5?=
 =?us-ascii?Q?cGS8AJi4z02Azo+p6j60k/K2xNBl5P6C+TvAN/92G+0aiYANjO/8x0FM+ApM?=
 =?us-ascii?Q?bN0mFxSBdcjBc/29had4R2jGLYdGeYn1wcFX6GLX1I/d35IwlZUdB4ugV1cA?=
 =?us-ascii?Q?1aVdfVMS4m+3qLtjWnTqYQ308rF1/PDqHCERLefxkwEXMnHY9SjhP9IZdC4+?=
 =?us-ascii?Q?YHmA7e2EuTNYs/kCXs6qKSfbc/TQ/xcas+y4FQbbRk7nydqL3Qzg+UwMOBJ7?=
 =?us-ascii?Q?zKi70eYdNp8lQ6+bkDIsioiSkUKHD+lkJU2mXeKifbQswObBdZP91MeCMWPN?=
 =?us-ascii?Q?GmI8+Mwbt5YCuWN/txNu8gF5Bt+dpKXcKP61+2D83NM8S/8m1WSjAs4vs6ni?=
 =?us-ascii?Q?yDgJuRjp9ygA6z9moLt4wa7fyOhZSzht2O83nd6GYT9YsXpFnNM34drro0cl?=
 =?us-ascii?Q?6MGSCH/Rv9eU5uwtOhtn7SrF5MZuWJ2Izw6+LLKEpngpsSdBdmLPgBfPwX2D?=
 =?us-ascii?Q?nYQSK0p9rtlB5oU8D0xcM5o5l7CnyCTMM6y2gaCpFrKjR/CbYIHCdCeIexVy?=
 =?us-ascii?Q?2th2ZKMH2ou9xzWlNnehgcyH+NmOQazlRVtbIFoIQ51pvwjYdPb55L5N9hfM?=
 =?us-ascii?Q?SV9DjmgFHAfyg/pfKgUQeNa9l1W4cwMpr2YxwaIIg1WiHN77ZDMrVwOBoE3z?=
 =?us-ascii?Q?c+BAhRFkSk0Ab5qcWaGNbwL9gUihh4znOr0WAX82M9/k4ztntTuTZwDKZ5Kw?=
 =?us-ascii?Q?nBY5zN6Erw+1ZS5zhVuK8Psqw6+vgRNZKYBuchjIk7n/AL3s9NgXtKPXK4pl?=
 =?us-ascii?Q?hqmukWfZGlsUYbJcmAN57LpbgQI52EG35u/7O9Y9jHiPe5aGBS1NvZVH9k8n?=
 =?us-ascii?Q?pG/kskAHtY9RZl6wPc0iAJ2wgzzoc90xld0ZxO7iWRSWZ4oiUZhnfGRSuVcZ?=
 =?us-ascii?Q?A1iQ6ffWYivefFV0VZnOJDLYfw2cuhRMeh+PBZ73mYs5vfE+3XugfndoAzmS?=
 =?us-ascii?Q?x81Ld84m1aFc0YxhWSlqH+G4CL3uYjlr4/fTKdao/Ir/kUXOWQPfj4KTMyqu?=
 =?us-ascii?Q?Br4nN/anXedFhIT4ieLXu1qvvBfCz7sGaPIdw4wyul1KK/VDxWNTOhC8GcGb?=
 =?us-ascii?Q?Kc3RG99hngGBuosk/J2XI4T15OsbRuw9rtiL3PPQo1dEjfy9fTta/NpLmgcl?=
 =?us-ascii?Q?s4hyLYznU02+GL6pt8vbIdWCnBzZeBvOjUyQ2BZnhl4WjFLmEsk8xzdLdav1?=
 =?us-ascii?Q?oB2w4s8z8ry4sYQkvMY2K8VhnWtGax8Mw1rh4d3fpRWx7zNTf6WmN57Kk7+2?=
 =?us-ascii?Q?OTSP2hOH0qMdlxbKyQWfr5D4BPpUAcG9OPmpVtDufjnykrIP2hOpZP/3UjBZ?=
 =?us-ascii?Q?uhjT+RsGpNCqrzHMSEYAgbZZHKBmHRGL8URgSPP/A7aHX45uegl66/fSZYdp?=
 =?us-ascii?Q?jZMOJ5L/Q7t8oxo9Ssb7b053ovCXAm1dOPMkqKIK9mSfbV/PlG7o2Loj55t6?=
 =?us-ascii?Q?kYM0OaBFDLWD59bSHUIS7CyTXFVv8jxXE5l0Dp++fFHsBxF4xUnCwulRjE6a?=
 =?us-ascii?Q?Yxk3XjwjaDdZz9KCMODpBvJ3v0mz0UbRvqxJupsrid9hiDdDRFvYdl7PuIw2?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8b2f80-ea8b-4245-816e-08dd60df08cc
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 20:55:20.0293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVONLsWyufZTaIS4SJwjqM4LUYRBWlPvLSRM5QpMcf6iqfhTj7iB7aIi8qXLIa5H4JkCG5F5hPdodebwbh8gaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8350
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

On Tue, Mar 11, 2025 at 11:34:55AM -0700, Lucas De Marchi wrote:
> Commit d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
> moved the survivability handling to be done entirely in the xe_pci
> layer. However there are some issues with that approach:
> 
> 1) Survivability mode needs at least the mmio initialized, otherwise it
>    can't really read a register to decide if it should enter that state
> 2) SR-IOV mode should be initialized, otherwise it's not possible to
>    check if it's VF
> 
> Besides, as pointed by Riana the check for
> xe_survivability_mode_enable() was wrong in xe_pci_probe() since it's
> not a bool return.
> 
> Fix that by moving the initialization to be entirely in the xe_device
> layer, with the correct dependencies handled. The xe_pci now only checks
> for "is it enabled?", like it's doing in
> xe_pci_suspend()/xe_pci_remove(), etc.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Fixes: d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c             | 14 +++++++++++++-
>  drivers/gpu/drm/xe/xe_pci.c                | 16 +++++++---------
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 14 +++++++++-----
>  3 files changed, 29 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5d79b439dd625..023290e5be392 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -53,6 +53,7 @@
>  #include "xe_pxp.h"
>  #include "xe_query.h"
>  #include "xe_shrinker.h"
> +#include "xe_survivability_mode.h"
>  #include "xe_sriov.h"
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
> @@ -705,8 +706,19 @@ int xe_device_probe_early(struct xe_device *xe)
>  	sriov_update_device_info(xe);
>  
>  	err = xe_pcode_probe_early(xe);
> -	if (err)
> +	if (err) {
> +		int save_err = err;
> +
> +		/*
> +		 * Try to leave device in survivability mode if device is
> +		 * capable
> +		 */
> +		err = xe_survivability_mode_enable(xe);
> +		if (!err || err == -ENOTRECOVERABLE)
> +			return save_err;
> +
>  		return err;
> +	}
>  
>  	err = wait_for_lmem_ready(xe);

I'm not 100% sure if we can skip this...
Before this patch if lmem_ready failed we would also check for the
survivability bit...

>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 4d982a5a4ffd9..6fea3091e2348 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -808,16 +808,14 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return err;
>  
>  	err = xe_device_probe_early(xe);
> -
> -	/*
> -	 * In Boot Survivability mode, no drm card is exposed and driver is
> -	 * loaded with bare minimum to allow for firmware to be flashed through
> -	 * mei. If early probe fails, check if survivability mode is flagged by
> -	 * HW to be enabled. In that case enable it and return success.
> -	 */
>  	if (err) {
> -		if (xe_survivability_mode_required(xe) &&
> -		    xe_survivability_mode_enable(xe))
> +		/*
> +		 * In Boot Survivability mode, no drm card is exposed and driver
> +		 * is loaded with bare minimum to allow for firmware to be
> +		 * flashed through mei. If early probe failed, but it managed to
> +		 * enable survivability mode, return success.
> +		 */
> +		if (xe_survivability_mode_is_enabled(xe))
>  			return 0;
>  
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index d939ce70e6fa8..153b8d598a270 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -178,15 +178,16 @@ bool xe_survivability_mode_is_enabled(struct xe_device *xe)
>  	return xe->survivability.mode;
>  }
>  
> -/**
> - * xe_survivability_mode_required - checks if survivability mode is required
> +/*
> + * xe_survivability_mode_capable - checks if it's possible to enable
> + * survivability mode

that bit doesn't indicate capabitility, but if mode is required by FW
after identifying if something went wrong like done checks and lmem
link trainings...

>   * @xe: xe device instance
>   *
> - * This function reads the boot status from Pcode
> + * This function reads the boot status from Pcode.
>   *
> - * Return: true if boot status indicates failure, false otherwise
> + * Return: true if boot status indicates failure, false otherwise.
>   */
> -bool xe_survivability_mode_required(struct xe_device *xe)
> +static bool xe_survivability_mode_capable(struct xe_device *xe)
>  {
>  	struct xe_survivability *survivability = &xe->survivability;
>  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> @@ -216,6 +217,9 @@ int xe_survivability_mode_enable(struct xe_device *xe)
>  	struct xe_survivability_info *info;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  
> +	if (!xe_survivability_mode_capable(xe))
> +		return -ENOTRECOVERABLE;

We might want to enter survivability regardless of that bit as well.
With that configfs work that Riana is doing for instance, you set
that, but you disregard if that was requested by PCODE in that
'required' bit.

> +
>  	survivability->size = MAX_SCRATCH_MMIO;
>  
>  	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
> 
> -- 
> 2.48.1
> 
