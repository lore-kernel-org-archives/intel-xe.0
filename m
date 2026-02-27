Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C565104891D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 23:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B487C10E157;
	Fri, 27 Feb 2026 23:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izgzQ6ky";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1819B10E157
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 23:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772233891; x=1803769891;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SRUsRAhau2RwhdhmDq9zpVqJgMdtG8pyYPpotw9fAbQ=;
 b=izgzQ6ky5yPrK1Rug35n04fRdOYkEnr0Q73WcKl7v7VMiOGq34jDElVH
 QkBTRaeN1xUbk2BdjnhTtavFvcwf1Jy0Xkf7O3FzEEs+YTGkwN9BVyBgH
 yPtZ202OQXQEc6DE5XYfifjAf5IfgGdh256IIXWNzzSiNRC/CDW/OCyET
 gUoKOGaCmO0gCklxwU7W2uJgM2sWTDqg/+5kT8iLWQKGlJIEsuZPmZX6M
 /cdPxAVVX3dxRaN42cG8+C/H5UtrVe5G5PtUOkkJ9VwAzg0hGHUG8xsrW
 kH3U+F3zd4/5oxNuqW+I7JM3Z1PFsuAL4f5PeGlgrjAeFXc8NxGAEEx2Z A==;
X-CSE-ConnectionGUID: sWlCoefLR6W7UGlVLU5plQ==
X-CSE-MsgGUID: wT2bB8SqR/eskVC8suZ0Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77191836"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="77191836"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 15:11:27 -0800
X-CSE-ConnectionGUID: +QEz3icqQM6mEPEVpGcD/w==
X-CSE-MsgGUID: d1uFHetCTT6ZdjaU18AV5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="216165611"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 15:11:27 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 15:11:26 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 15:11:26 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 15:11:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xd73vYrIjpsm3uagVpfPS3VEgNlqyQ1roRMUwe+wenGAEz/GfpOxA2pUpuORBZ+i4/QUetrnLN4dEG/MkebtNPMyvtH7JHTAYWcBxDxZae8LCtCp2nd9yaaucAsvkLIAmzRsBkFWntNedPGYg/CRJb7fO4ZysCjpBP4uo8hY1EmGdvypnO2kuZZuw2wE5Iu1iW3ArxV9JPjIeODhZOMyfuC7q0shRb3GRf5XbQcAoF+DVd3Ex5yc3yogwoE2xRBuUIPHaXmTPyjRFA6GXFB/ucmGQ3IisxtOLY9nrmflhuzjfI4KLmKwifMKJTB+RHvpuKK+nIHJuSPXYP7NJvrypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJVYvQRY2ccX7y65PYQPiOblTl6DTL+9QEdJQxRoJs0=;
 b=lVmT0KTiVHE82FQTJkLlc2Dr2Q2YBi1PmKtFAnPOLbh7FNiRoyN/qpHgSx9WOCJ/QIVgbdnmtj1Uf8hINvtX22Vbr+DYRcO3py2jx7XzcpTGsOdrOwh9nXIH8s2KmfykrHC/1HBEX7hmRa6DCPBTyKPqVpB6wHWcPLx/JRyJMf3ayza9lqMXfeMYSePX4AfTR2l2GlzNNWUvac6eDBqvd7SQMyjS1aB/eJHt4gtXE0XbrhTMexfgKIR9NKJOsKHOu4sGTNpciaox+sNPnQVviyhx6ClA0x0QztGr1ldoeBqIBkBXXJSRUP/GeSQiHRfXHacvCc5SASIa3v2bh0+jUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB4981.namprd11.prod.outlook.com (2603:10b6:510:39::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 23:11:24 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%6]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 23:11:24 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <simona.vetter@ffwll.ch>, <matthew.brost@intel.com>,
 <christian.koenig@amd.com>, <thomas.hellstrom@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <christoph.manszewski@intel.com>,
 <rodrigo.vivi@intel.com>, <andrzej.hajda@intel.com>,
 <matthew.auld@intel.com>, <maciej.patelczyk@intel.com>,
 <gwan-gyeong.mun@intel.com>, Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH 22/22] drm/xe/eudebug: Enable EU pagefault handling
In-Reply-To: <20260223140318.1822138-23-mika.kuoppala@linux.intel.com>
References: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
 <20260223140318.1822138-23-mika.kuoppala@linux.intel.com>
Date: Fri, 27 Feb 2026 20:11:18 -0300
Message-ID: <87ikbhok89.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::11) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB4981:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c86ca6-7f24-4ec5-5fe1-08de765586ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: UnFaNsZJ/5N123Zk5H6kcx8/WQs0c95+THjRznhGGItAGEnGNFFt4efoyZXJbTyYmSiubKuXyE6JCdeiRgsbq53pyUpK6Np8ohvk71/RuI/T26rS6a8Zp5Ii3xyF6QSDK7u22ibhR3UH0cidRrQ7oBJPHVQjbfPnhmbxhTMoSJ6V73yodSnMCr58sX5OLWuNlAwidR7KlQffJHRFprdbGUX1gX8ZfGdl3ga+B8mKi/k9xuv2VRB1tqg+OJP30dZRYFOmYX6FKCd3H0AsSFPn4vP+ABFn3YSpyVke0Q99xTTGRMTx6igXEKFAQ39XMbP1eRGpkViR1LU/MFCIDF5vYaR7vxELz+j+hFQO6g+uIIjj4R319eZi66koyT0w0JxOysGrwU195Deq6DiRSmmgxAPzroayqq+cisl4SsENJGhZpwT0YYInTiU5alkNX6g85SBrfxEHgvSbWg/vcZh+ZZpORFHj1seTK4pKUoPVn9BD9sytY0H4L9RFaJdKIDZtDBrO+B1CwmZ/JTkHkPjVsuvoq/vEh65w17Pp0D7q2ucASFZgvSOAoUsFVc1NqNmyLcnnORW7Ws75vFSfBB2/KF83J7IyJOx68JzUZPoLkHM43cN2B9ze8NhL3RG/4pVefqRFbVWhp14sM+bZTq5ZW9oUfIP3I9EUaFeHtiTzHxg6bWSKCjLt2wXBQ66EUZgFU3tWLpT6RM6rhTiYlFLLgtGC1GyiOdyi3RIJIFhiujk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v6e2HouY0V77ZbGT2Eu/Y17eqY7WzQahy+NuZQtF6ke8zJKeUiPt215QhWfI?=
 =?us-ascii?Q?kAeR8gHlD6g8QJ05hAQTw8b2sCLcPlHHY62/XxWbA6ofnal584WdxWGlMqcv?=
 =?us-ascii?Q?vSbqGs8kJe5yDpe8ue5Ot4IO6r48rbYDs3Q9Y1ZzjSKhCuc9jAf3p2V9naVk?=
 =?us-ascii?Q?FB5GflwddIZl1uwUi8LAj2McHgBa3KH/x1RzxJlFXs91qVYyjf8xfOARrwtk?=
 =?us-ascii?Q?yH8QoAPio1gQ4eVMEZF0w6OJ4EZGrQs1Z91XbYLFKDgD2/L7yhnLDFk+1wib?=
 =?us-ascii?Q?lDClcqXZL1V/fjaHSrCVaDKo70xCH+/K/OoSVZfPOqkrvwZsvMYqwmfjHSdj?=
 =?us-ascii?Q?ErQA2r+M7in16vNpVyAqEuJ1lBEVw/Bss0xu19uNtYx8UwSyWl6pA0qm4WKs?=
 =?us-ascii?Q?KvpAwToHJ8Opm1/OlZclPK8GeCDgdxkAwNvBPxPeq40i5GQrFkHdIZCTBc2+?=
 =?us-ascii?Q?taSnTGbahCrOUtYYxsd0jhJ8JYISKvX+ZC6V2j/BJC+uNN7B+d7FbAJdmwGo?=
 =?us-ascii?Q?NWzgZSrCARWWPHezqMgxoexoFSRf+0dnhFzZrMdbuqbslY9b+YwgML0xNcYz?=
 =?us-ascii?Q?5XLWkorXy2Mg0h0ZN4yZiSaSRFavVScYfBmRUFL81RbkEqVo36PVvwB1r6fd?=
 =?us-ascii?Q?k0Y5LxnjCdbI1G+rrIYqrkkxgFRGa4iU2opeaapHROj3C7wJ4o9aAf+VBwz5?=
 =?us-ascii?Q?1ZaOT1ubgEkcKtOKbklUndFMQK/gxsKe+76msnGgxUpWaHuinLdN+3uLnDAm?=
 =?us-ascii?Q?glku1cBHwWczHuLEmnxCChs9TBPGgW9M+WiAJ5xJn+2cnUGbRDwu3FG591cU?=
 =?us-ascii?Q?/Wk0tPVg9aKyxjIJqCjlqdHkZ5DhHu1VuX45dTnVfnp0JT1cfiR+8AycqJFr?=
 =?us-ascii?Q?t2YUpdAf7ipZ53AK8Ju498YwQ5eYYpkjFBc0+dUDEWhDsXjUmUY4Yi99oanB?=
 =?us-ascii?Q?gSHdCQslvR2WE+ZWA2Dl6KK2oQkpAey+nKW1U4pRvAh90VkJcdTCGY/fPvP2?=
 =?us-ascii?Q?1Y1MqhhOJDp4mWiNvmMlUmH742qUtutu7oX2UzVawv0O++dAEVUbJ+oLlFyz?=
 =?us-ascii?Q?zmWvvb7sn+YS5/dSZUhsR+qTDjSFGFrVl4rk5WU5C75DPhFJHJMW7n4byx+D?=
 =?us-ascii?Q?OVuBWAFeDe3M+WUk869vDGpjBTp/Cz3QOPNOnv67heMyfjo7AYOzZQoPbbeS?=
 =?us-ascii?Q?EBf+YBcI6FeGJym45BpFg54K8JOfe/qqXtdx1dMX73cBPH0he6lPItgs2+yG?=
 =?us-ascii?Q?Q1Ok4oAtguLa3txXDflssUbWC35pNWIfLaOkUSYL3lRnJ63Q9wC6tX0A7XTU?=
 =?us-ascii?Q?ZByB24uU9fPKlMaAmEUIxFLVzojETuW9NyNvrPhSSgUVgDDz/1WRG0V0zpIm?=
 =?us-ascii?Q?RwY5OnLZxhqE9SHEqt86dEO7rSMaAWFIIKTdnuySMFlxQdHznhs1twR+L5fu?=
 =?us-ascii?Q?QCMtQFKO1F+Z6ymUKxmPFTGxJcedRwObJjTrmIBUK0Gw+vrWP2S4cuorQSkG?=
 =?us-ascii?Q?B6iXMsFFcWoMlO6UXJRYuTywJPk4u+URwmRA0U5O8vLVQsad46yNWziWHwNS?=
 =?us-ascii?Q?MnGhlan5UlH7UxbCZQzwElgK2gYH/rAcZQuYn3FaLnttgdyrxBHdlQBjAj5r?=
 =?us-ascii?Q?LvjDZ75TIQ7SAnS73KVN9bpmh3oHVbLyZlSCj9PNMG2YgcYhpX3Or2mpV5Qj?=
 =?us-ascii?Q?AqXVMFy0QsHsOmSv8oMi4/0Dg0OOLC4jXS2scU1/MCDkcfq1YJWTxC+VwyPY?=
 =?us-ascii?Q?iQ9dF376sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c86ca6-7f24-4ec5-5fe1-08de765586ad
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 23:11:23.9488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z41FYxlMD5XIHI78sMd4NxN4cqU2YLRb7zN80EuGoNKA3b/F2ArfLd++sNbvrf/ak8Gvqwk7xgeJMAd0ABdHjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4981
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

Mika Kuoppala <mika.kuoppala@linux.intel.com> writes:

> From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>
> The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
> access will halt the corresponding EUs. To solve this problem, enable
> EU pagefault handling functionality, which allows to unhalt pagefaulted
> eu threads and to EU debugger to get inform about the eu attentions state
> of EU threads during execution.
>
> If a pagefault occurs, send the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event
> after handling the pagefault.
>
> The pagefault handling is a mechanism that allows a stalled EU thread to
> enter SIP mode by installing a temporal null page to the page table entry
> where the pagefault happened.
>
> A brief description of the page fault handling mechanism flow between KMD
> and the eu thread is as follows
>
> (1) eu thread accesses unallocated address
> (2) pagefault happens and eu thread stalls
> (3) XE kmd set an force eu thread exception to allow the running eu thread
>     to enter SIP mode (kmd set ForceException / ForceExternalHalt bit of
>     TD_CTL register)
>     Not stalled (none-pagefaulted) eu threads enter SIP mode
> (4) XE kmd installs temporal null page to the pagetable entry of the
>     address where pagefault happened.
> (5) XE kmd replies pagefault successful message to GUC
> (6) stalled eu thread resumes as per pagefault condition has resolved
> (7) resumed eu thread enters SIP mode due to force exception set by (3)
> (8) adapted to consumer/produced pagefaults
>
> As designed this feature to only work when eudbug is enabled, it should
> have no impact to regular recoverable pagefault code path.
>
> v2: - pf->q holds the vm ref so drop it (Mika)
>     - streamline uapi (Mika)
>     - cleanup the pagefault through producer if (Mika)
>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   |  8 +++++++
>  drivers/gpu/drm/xe/xe_pagefault.c       | 31 ++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pagefault_types.h |  9 +++++++
>  3 files changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index d48f6ed103bb..6adf3bf73b1c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -8,6 +8,7 @@
>  #include "xe_guc_ct.h"
>  #include "xe_guc_pagefault.h"
>  #include "xe_pagefault.h"
> +#include "xe_eudebug_pagefault.h"
>  
>  static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  {
> @@ -37,8 +38,15 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>  }
>  
> +static void guc_cleanup_fault(struct xe_pagefault *pf, int err)
> +{
> +	xe_eudebug_pagefault_service(pf);
> +	xe_eudebug_pagefault_destroy(pf, 0);
> +}
> +
>  static const struct xe_pagefault_ops guc_pagefault_ops = {
>  	.ack_fault = guc_ack_fault,
> +	.cleanup_fault = guc_cleanup_fault,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 72f589fd2b64..9dcd854e99f9 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -10,6 +10,7 @@
>  
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_eudebug_pagefault.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_types.h"
>  #include "xe_gt_stats.h"
> @@ -171,6 +172,8 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>  	if (IS_ERR(vm))
>  		return PTR_ERR(vm);
>  
> +	xe_eudebug_pagefault_create(vm, pf);

This might not get called because of the early returns above. And
looking at xe_guc_pagefault_handler(), we don't seem to zero initialize
the "pf" variable there.  Couldn't this cause a risk of
xe_eudebug_pagefault_destroy() being called with pf->consumer.epf
containing garbage?

--
Gustavo Sousa

> +
>  	/*
>  	 * TODO: Change to read lock? Using write lock for simplicity.
>  	 */
> @@ -184,9 +187,28 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>  	vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
>  	if (!vma) {
>  		err = -EINVAL;
> -		goto unlock_vm;
> +		vma = xe_eudebug_create_vma(vm, pf);
> +		if (IS_ERR(vma)) {
> +			err = PTR_ERR(vma);
> +			vma = NULL;
> +		}
>  	}
>  
> +	if (vma) {
> +		/*
> +		 * When creating an instance of eudebug_pagefault, there was
> +		 * no vma containing the ppgtt address where the pagefault occurred,
> +		 * but when reacquiring vm->lock, there is.
> +		 * During not aquiring the vm->lock from this context,
> +		 * but vma corresponding to the address where the pagefault occurred
> +		 * in another context has allocated.
> +		 */
> +		err = 0;
> +	}
> +
> +	if (err)
> +		goto unlock_vm;
> +
>  	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
>  
>  	if (xe_vma_is_cpu_addr_mirror(vma))
> @@ -198,6 +220,10 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>  unlock_vm:
>  	if (!err)
>  		vm->usm.last_fault_vma = vma;
> +
> +	if (err)
> +		xe_eudebug_pagefault_destroy(pf, err);
> +
>  	up_write(&vm->lock);
>  	xe_vm_put(vm);
>  
> @@ -268,6 +294,9 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  
>  		pf.producer.ops->ack_fault(&pf, err);
>  
> +		if (pf.producer.ops->cleanup_fault)
> +			pf.producer.ops->cleanup_fault(&pf, err);
> +
>  		if (time_after(jiffies, threshold)) {
>  			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
>  			break;
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index 2bee858da597..9d2d29d35a4b 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -43,6 +43,15 @@ struct xe_pagefault_ops {
>  	 * sends the result to the HW/FW interface.
>  	 */
>  	void (*ack_fault)(struct xe_pagefault *pf, int err);
> +
> +	/**
> +	 * @cleanup_fault: Cleanup for producer, if any
> +	 * @pf: Page fault
> +	 * @err: Error state of fault
> +	 *
> +	 * Page fault producer received cleanup request from consumer
> +	 */
> +	void (*cleanup_fault)(struct xe_pagefault *pf, int err);
>  };
>  
>  /**
> -- 
> 2.43.0
