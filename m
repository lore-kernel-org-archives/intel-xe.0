Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D020C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65E41137CD;
	Wed, 17 Apr 2024 20:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frwM3XQq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C070B1137D1
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713384621; x=1744920621;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oVSKDmji5cwLFMV2XSnSMaHoLeqVAx3p3JO8xPDOX0o=;
 b=frwM3XQqUkis0PImqX2qahJ9iEKRxdx+eETUxbUdYvEE1EiX8TxluKTh
 KqY93pRZyGBmf5GZTpWc61oCkN+bwv5Q1rc8vBFspdfO3ZoivcR2mOicp
 Be+sHrtZ9beKmqSpqpRS8d53jX5GGNbyfWsh+q+F4WsFZXsJ4GTRJSZ/8
 iKIrrsKWzh5FRVS9+IbZFXK3c2/wP2N+XEJCpGWBjlif3ISp+Yh63m0ok
 tkIHao/YVCMhBPf5+mWry0B97JkuKxHThUUBn+vdA8OtyfVxDf0VRd8xq
 j70CuAzLJXaSXAEheXPS/YjCmLDLc874bhFgqa+tWppyv6f1H/BratsvI g==;
X-CSE-ConnectionGUID: mbeixm/CSw+9J3GDEA7e/Q==
X-CSE-MsgGUID: g6C+EffYTn2UEQOmJvCjUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26359173"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="26359173"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:10:20 -0700
X-CSE-ConnectionGUID: AKEOFKxjQYah0Am+oHyc3g==
X-CSE-MsgGUID: +c/YplvKS+ebtq8OoQgmKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="22800419"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:10:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:10:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:10:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:10:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:10:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uj0oa1mH+ZveReMESXVBfn9DtKvucEH4DhxpQQp5NgqKt04zjlQEodSdrZ1KLC7h1TQF4B8G36rO7vRtq9KvJ9q0pxig4RaydttjMIG5sWW0aFKxVdwnIReqCj0Yg5ySV4zNdzGY7JtCE/8NyvufFyk5cDQtliUAv28C4Jawjg8fhjBkXBOwzRrzXw2k3m+0dkrdwxgBW8eeLZ0HMODTQYnGE9RvJnbgpg57cZrb1Jkd/Cyr2atZjcuZvc2Iwgiec37gI4tlE3j5byVDYbhgXRge68OEB4tsVrjSr23Df604OsCUjWZ4kpA59oU9f+ekxr9SX/Q62FFjMwfJbntqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6i1Iek/QYDt/Du5WiGyOwWz8OBsSpJRqs8i3RFtkf8=;
 b=ZdFRezW4IxfxmkmKeuoVdm/pTIVYJMvfv1Z+bBKdyg7Z4dxwxqfGpv/mMgoVnrN1UU56ObiLNhJPUQh/fcUshkEu/ECjU1MaDOlQ702LEkaNgn0ojD/3F8tx3exIZnK8JZ3hpsmVs4E73YrttN6VwMtT8t0gBIWNOc/oN+2OWWQkpDISiABnzcC9V9wHa5QiyJuGrrYhVW/aAiaThp8JIJKAPEPOCRroE+m1I7D2VCSsQDRNcT4oHEfIo9GbWdtoZdYg5GJTIimB0n+cNWZOR0TyXi4qr84ms5UDk7rnWXmP/LEVDXbplKcQkVzvnjon/S97ffEj8dCOLuKmLPIkWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7375.namprd11.prod.outlook.com (2603:10b6:8:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Wed, 17 Apr
 2024 20:10:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Wed, 17 Apr 2024
 20:10:09 +0000
Date: Wed, 17 Apr 2024 20:10:00 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe: Add outer runtime_pm protection to
 xe_live_ktest@xe_dma_buf
Message-ID: <ZiAsmERgUb0x5KlW@DUT025-TGLU.fm.intel.com>
References: <171271725279.1318876.10825510039289922734@8e613ede5ea5>
 <20240417193411.21833-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240417193411.21833-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0387.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: e37b42bb-3953-48bd-ed84-08dc5f1a61ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JkbPGQzmygFBXXMtnwCzuyhxasRYZJq1rHkIvUNum3EES+7/02kZUrkbH0xsFAzgDGjOaziqiBgcCiP6Ujp/g6nk8l/qKwwB/r7maKRKJz0V+8wlenurNQM/2Fqenw+Af4GvJsPx2Yh5u7weNq2LQd+5VnOh0QSzlVkmuhgPC3M9XWGjidk5aJgFazsY5/4JZEtQTmcHKenj1qIoT4WJ/9NN1A9V8ODGGg57+km22EWk0526u1Tm26V7Q0umQ9zi0YQ+aHGDdZvI0tnIczrOEbaKwqrTzuBh7Ek9bT/l2yIFGNPzZiOVI6BEN0G0ugk1TWpjdAteKFCuxJkgiIkN3hvpoSN6PdW3NEO4fNUL0pX+98HMDLOYY3EL/8y19oAIqw6eWwH/oPQOj0sZmAkZq+2H5lsiTP0Ls3aB3/dM8X8VnN+pBsPNor+GOxP2GbBdiwWJzpXbXVUVGQAfFMUw6g2OoJeYcOR1kntant/aEqE1RZNxvFJZYjhksn4+3Klepp9LqLAKM2Z/MzLT2ttAwctRQYd2Myjxw8R/yJwWWOzQ0EvAUYm6BtfnJfdau5YBgVzvh9akoiPyCiW6IQijPhsJzeUO/I3QtsgaMxavfBtgQ69wCOMVDCiJFAjFfibCcVam2LA1odNAsHAXerKDY2LKH0n7TJ0SZvgJNj+Kc8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eWhh3JlzpD/ktWZNddFP8YGv9taWD16rGRQOi8AEXSiqaEbKsBnDkTQQnJxr?=
 =?us-ascii?Q?UamHdO0VzkjSJ8LID4IKURTN2KCm90drHpccJvNKIF5ajoIfqfqs9QMv5uCo?=
 =?us-ascii?Q?zH/qPXNDM+6SuRizCtJV/MMBxoWH3/7CHiNirTQgbmsvw+ihMB/dxMZY1NWd?=
 =?us-ascii?Q?6zPuw73S0wXhVzLpfZOEecAbXv2t9BnEHyiwnx8TisjRg8etiOhFiUkLfrOJ?=
 =?us-ascii?Q?jRWOWapcATmH+Py8Qw0q2jBGy7qJkJUYhUz1Nc/T+McrPMCnGvp4zBNTlNti?=
 =?us-ascii?Q?Wvi2r6broE4J1iheBvU0XTrF+YTwNIKHDakLa/BtmmPGy8frCSGTxiL77soK?=
 =?us-ascii?Q?NKeFWJkxLDdpgQtUzTU1VRoD6tXC/C62HSvOocWPu4aQa40QTTc3QXWgfNcE?=
 =?us-ascii?Q?FMx1rQ2qPZ0eTFe+rXqOQ1Ee00wKMt/cd5TQK0v2InwJILPlnzfukqDaOAkD?=
 =?us-ascii?Q?hHFxhSSgHxBHCakcJDnJa/it+4RntvrqDS6CqAjwCaF3s0mBbRymD1QT03Gx?=
 =?us-ascii?Q?W7JGmrru1DNT51XA2d96PAVPziybkxPcdWs8tirAgOZgTxvYEMqdH2dj7D+n?=
 =?us-ascii?Q?FgpzxbVqy8rDBu+whketL6PhKUpXvRSJnNJePvnJ3JEYonqXKkl+Ecm7+VJw?=
 =?us-ascii?Q?Ur+5nwrbsz5pF0cBbM6cGSDWLdPMT4uVVI7Rt/csMOoBuWQFHD86KfKjZcp3?=
 =?us-ascii?Q?Vw+bFJBK/9jPgWdg1kR1uLP/slRaBMbKnL2pbNDEzptqaNgavMemMW35frIl?=
 =?us-ascii?Q?kJpFu/cdO9opkWkfrYhhQ793AtAy6Wrn7X+uH2M4dI+IYlzY7e4PJFdEGqUy?=
 =?us-ascii?Q?s/dJJ57QdO6h1gWDqVlU2ZTBnx2EwxaAVzfvznPX1c2VV8i1RtyYvXSiQ+dR?=
 =?us-ascii?Q?g2n4SWXt+a0biYBUr4sS1uFAhucZIau4IPj1Xj1bRlGMosSnH2MnHBKHq/gq?=
 =?us-ascii?Q?wOT6JDYNj4d23/pmlQ4pDFUKCxv42NjQq66fSwxaryPGGL4xvwGd2L6j/67v?=
 =?us-ascii?Q?axKoICbTtNsBc85GlmGTE3fKiVv0Obe3/yBzkDkEuW5EX7UWWpzL1WFu/wa+?=
 =?us-ascii?Q?LVzCoUIoSWMcihKYeoDgeueMONNX8aMpsJlcVJqKT31HJ7HmadP7ydS+14Cr?=
 =?us-ascii?Q?ilWL2f4lJGCIhuR12/Pv/9o/hx/EC69VcM9Ex7obtvENdW/xx0QF1DyB54/5?=
 =?us-ascii?Q?8g3KgzSzti03X7uGgLPHDFcY4SpugObSE04dhIIy/P2F4VJTOzkUbHxHrZK9?=
 =?us-ascii?Q?gTxquQKTMur23ViVSgLU2hLlrFhBjV1Te2EEVRqrNGvf7PkWY36wU6Tg03Ae?=
 =?us-ascii?Q?vxfWGp0wxTwLilRcrndQs8Kwqfc3KljIErZm5/8YTtGN7nJefme2GkG5KfnJ?=
 =?us-ascii?Q?mKjGz3+hJs8FaipQX+NC2dmVI71RpqvC0CvzVtgcvkpY+ObkfADTfA0qs5D3?=
 =?us-ascii?Q?YL2mhFcgzEHxCoLz4+fK4AQBURi3EOOM02uH4/YoQFZemmI2O6TojdKg3JfB?=
 =?us-ascii?Q?wbOQ8WiioGGvC629EhmHhFkEQsxiQs5Orvy63IQkJUIiiI31mPgm25o2DYyt?=
 =?us-ascii?Q?5J5qUi9L4PP+kq7dXQKyfzyyolAATO7GoKcZ4UG8WUCyN39+r1tHYool2b/b?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e37b42bb-3953-48bd-ed84-08dc5f1a61ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:10:09.4863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfxJzbjD5kbuJQ5uKVeNtgVReI0ZFOZ4msCDpL3NvbS5tqPoSY3mYnc06sRrZpLmdPAObD7Vl5AN0T0QOzu1gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7375
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

On Wed, Apr 17, 2024 at 03:34:11PM -0400, Rodrigo Vivi wrote:
> Any kunit doing any memory access should get their own runtime_pm

So maybe we grab a ref for any live kunit tests in a generic way?

Matt

> outer references since they don't use the standard driver API
> entries. In special this dma_buf from the same driver.
> 
> Found by pre-merge CI on adding WARN calls for unprotected
> inner callers:
> 
> <6> [318.639739]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> <4> [318.639957] ------------[ cut here ]------------
> <4> [318.639967] xe 0000:4d:00.0: Missing outer runtime PM protection
> <4> [318.640049] WARNING: CPU: 117 PID: 3832 at drivers/gpu/drm/xe/xe_pm.c:533 xe_pm_runtime_get_noresume+0x48/0x60 [xe]
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index d54dd5b43007..e7f9b531c465 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -12,6 +12,7 @@
>  #include "tests/xe_pci_test.h"
>  
>  #include "xe_pci.h"
> +#include "xe_pm.h"
>  
>  static bool p2p_enabled(struct dma_buf_test_params *params)
>  {
> @@ -259,6 +260,7 @@ static int dma_buf_run_device(struct xe_device *xe)
>  	const struct dma_buf_test_params *params;
>  	struct kunit *test = xe_cur_kunit();
>  
> +	xe_pm_runtime_get(xe);
>  	for (params = test_params; params->mem_mask; ++params) {
>  		struct dma_buf_test_params p = *params;
>  
> @@ -266,6 +268,7 @@ static int dma_buf_run_device(struct xe_device *xe)
>  		test->priv = &p;
>  		xe_test_dmabuf_import_same_driver(xe);
>  	}
> +	xe_pm_runtime_put(xe);
>  
>  	/* A non-zero return would halt iteration over driver devices */
>  	return 0;
> -- 
> 2.44.0
> 
