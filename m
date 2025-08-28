Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE2BCA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 12:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E7A10E98D;
	Thu, 28 Aug 2025 12:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTwZbk1k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1CA10E98D
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 12:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756384159; x=1787920159;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IiYaglLei2rn+tCsBr06gUZIz4umhmwCjpChkn/dvVA=;
 b=aTwZbk1kH7sWrm2RfQaNYHi7hYAkFktGRb4yMBGUn+sIuZsrxO1+5FmL
 CNNSVJi37B/Q+ovUB4jU5mhwHd+yL5ANFbPNyEx6YHuhZXmiI4h8QTBQL
 oniiHmucTGSPqrw0O5DlqDIrwBGBO6dLyFaehWFsiGrN/cvYCWoQZxXnU
 xU/V2iqfWJYtx5ywxkIa61L8KMHsaKT7dWNPPWZ6E1eoYUfAYPy5JtVn+
 gq7gVrR0i0Wq+Bvkbl1Q/GmcJ0NEwIjxctCMQw6HQkPpOSR0Oyk9ESEQd
 G2qimeWWsLFvffvV3m7OOMfrd62SSNWZV9DeH+yafI6Faddv5XfM6i2T8 A==;
X-CSE-ConnectionGUID: Klwi0NrhQn6WVo/0TlBMGg==
X-CSE-MsgGUID: GXJupwrYSru5dOqnyrHzsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58714173"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58714173"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 05:29:19 -0700
X-CSE-ConnectionGUID: cnBcjOLfSAqt+XWneEmjAA==
X-CSE-MsgGUID: f/GrWmWQQ/C3Ui8BhKMXQg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 05:29:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 05:29:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 05:29:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.85)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 05:29:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMkEEr3iCsJ4Qc/6wQGD4vOCqRmbE+oijPUrGNu5Mr8dBBREZ20xYF5t6dekZVWAf0SAE0f7w+Y7MqR3n+bkgMSxVX0KySKf+GBP1ZM1yF60PB0aAMTDmI3vUEHRhHu5VCieq5rWAmhnBEvd8N61GIu5X9eSA9nk7rLHPD1v4R7vX/PdpRJcQo3t8O0UHEzgu1dY2+AiMPtz1icsB5+R9VCqEuKoAHVpkQUK9XOKMnOl/cFN14NXr833Lc+uvTjrINZ6ictCTY3aGVHu5NWZbKCcWp+fGdP4dKADYDuZ3u/kgulDVSZyqEOe6OvJmBgpJ+IYszRGqtIdI2QQ1lLMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyJNuYlVDsH0jGBFbe0oev2h4k2P5km9FyCQtZM4diw=;
 b=Hrla9rJl/3fHA5/funyx894W8FNtJowBm0VQnNI6v99G8Bbn7PeOM7BMzWKOzExQ3iEODTJ/2UV6CYBSjqLYUFR1bXaolEIhqPHW0c6Lu2r0sluWw3oTG9Bm0bn3621Po4QXvFU7MjB2KFeHTacqOZJPxmn+XSWKw9GqABA9Q2gb+d2FawXr3qzSU2cihYSj7visQTs4kTj93cAELJa3MDfyT3Pv00MIK+hxKEbQHl0jMAqfFYR1JDcLo+M/wE/3QQgPDRgUpbc9uWxHA3CMqTboYmfO6OqXtqOU6V+D8sQ/1gY8EkAtt7lhTYh7DtS5pCsc+cv9Ucz2768Tk2yqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Thu, 28 Aug
 2025 12:29:12 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 12:29:12 +0000
Date: Thu, 28 Aug 2025 14:29:05 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <michal.mrozek@intel.com>
Subject: Re: [PATCH 05/11] drm/xe: Implement xe_pagefault_queue_work
Message-ID: <aLBLkTH1wixn9e1Y@fdugast-desk>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250806062242.1090416-6-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR0102CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::44) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 3685f13c-fe3d-4763-e252-08dde62e7e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yVYHQZmgPICqB0pXxoP0Iq6aF3YeM6Dezth5qx79YDPn8YDYvlE7Z3M4ZmLs?=
 =?us-ascii?Q?+3aBLHgb2VHbXR6Xmk5iGvskwZeNZRF20Jfs+iiM+gaBEbhpmqTHF+FsD5N2?=
 =?us-ascii?Q?orb3EfBjAopdRZcMeHmlwMdWGCaKT3RaH0rLIT0veh/pNUnbII5qbmrC13z3?=
 =?us-ascii?Q?uHRpz5qxuy2LCxuEVX77q2nb3Uvvf04Q1uaJQGliry7CatemqWN9rjdECjuj?=
 =?us-ascii?Q?aIeIhzuGeGWAbUYji0KXhC97gWvG0aRwVep0/5/kO3dg/NhZwuZmmgdWn6D1?=
 =?us-ascii?Q?VMcqhPONoCMdfoNhSXrEUQ2JuOn/BMcV8EjILqbiRrUZ95xSznZirFCNdI0y?=
 =?us-ascii?Q?XCnRR2ZI8BETEVf+wGLl4zh9trCSnbowjTguY/EkWAVpMjZzAS6atsHY5Hmv?=
 =?us-ascii?Q?H70MBvLpZ14so6dA5XpfnypqDzqkkmv+aEa7L5N5XrI7g950jHYMcAbXANO2?=
 =?us-ascii?Q?VkgIv/J/yFubYhsg4NqCinuN12EThufpgAGw7s8DxT2f1oG59guHbSYqiikV?=
 =?us-ascii?Q?4bZ9R/OfWHHqDd9lEZGR6hlEBzsTVaOVyl6k2nrQaV1ZpRGWsodUYhbiFirA?=
 =?us-ascii?Q?btIuLnZh7oc9YJr09KqQebA7+VQKZzIM3OGnmjcN9ECZifC9bWA8HmeNipYB?=
 =?us-ascii?Q?OQbz6kr0EoJdBJVtkb0ioaUzPchRFMB/l4AXKSHgBz6wfIKZJV8jyHwv66J7?=
 =?us-ascii?Q?tshJMCOm6Tfkc1AagecS03zxDtRZr0peLfhfilnCFhQyNx7Rw3fy0X5cgOB/?=
 =?us-ascii?Q?0AMs6s6l1d1nJgJa2KqXgVWfmpSy7VuEprzpHBjqDKFnWdmKunwucPopCZoY?=
 =?us-ascii?Q?ZwH2LqOJWj7cVAMZey4NCO66qmMyfa7GXA9umjzY3GJULpz1OHlRwgjXa1e1?=
 =?us-ascii?Q?jsFgAGA7rikNqXRApP1g1I5wZ/6izNcUcp0YeaeoAb7mDKuaBqviOsGtEzjo?=
 =?us-ascii?Q?XNbYxNVI7SVlSD/0/fDk7AXLogc+ioUV/+ti+LpYsa2f3Yh9XSFgkUgrc9ag?=
 =?us-ascii?Q?JO2kRED7i7FXIHlJdCRXWEe2+KUMBnlytuxLeJ9FD2+3HsdyCbK1nIDNbTVb?=
 =?us-ascii?Q?m0BLkwMFL/WgBHyER0rtnn6XDHzLvsFcieE7hTr98i3MTJlwuuRFp8JVqxjg?=
 =?us-ascii?Q?ytmN0f6TYRZSeYESyAHBg4jCWkAP9bIlUNwnOvk+zUtqe0dapjBm/ZsvKrrR?=
 =?us-ascii?Q?tA3U38fsmWIjgjm3AkyxrPKDCoanbDBYwwt7nbQMfx5ZxfLpdvRG9a+kCnaA?=
 =?us-ascii?Q?iaXdRhsatorZVUFwAWLixBxxc2yWOmx56hD1/4AT6w7NfINSnUbfz6snQE+g?=
 =?us-ascii?Q?nm+uurEOIbq/u9bDNotNu+ho4KyTetX9rsWazfSsLhK2KPpvNvHq4huMTJDT?=
 =?us-ascii?Q?dDHle+28lw2t1fyJ3Os1qwwSLufJRBkruJ/uFPhcXelwOBmC/00wc4+xejZE?=
 =?us-ascii?Q?N7EFobL59kc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sy7dmKfxvw/M5SNu+0JiIN1Mt+TMvd68ZbnP8fQpzW6GsFN9Fe2K19dgzPvq?=
 =?us-ascii?Q?3MyDXRYEpEVwnPKzTz3SIPmWy2BQjQXlAnHgDK6ARL3YGVvOULm+Jnyr7MVx?=
 =?us-ascii?Q?+oKXh/cWG/yV5+wNSWbySGOuQGAzzdWaq/le7R8Kpx/ackEKYaKzqiL00NfJ?=
 =?us-ascii?Q?No/d4am4qGIrt6wbdGUlcd6j0hxoRjf9bW2+2pLOA7MUppYmm38K8rJinfZh?=
 =?us-ascii?Q?B8yHyktgbICDHtxAkRBaLP5SViJEFb68/JkE7TTDStHjGvVKbhJToFjRlleJ?=
 =?us-ascii?Q?gvlHXOGN+YWarvkXnPiAtIKFe4waw8l1vPfgfGG/2rVcoo9B7JGnz/+5FB53?=
 =?us-ascii?Q?LdllSMVsL3RoxcXwP5HuAzZmuziruNq3goPG2tacyWAp+1hCAXnpKGI8vQDT?=
 =?us-ascii?Q?UsUJAlbWZ3aA4t9VficB/awy0LR1SzN0HL2FCK0vhP03lfcPe/+QIKSPpNbU?=
 =?us-ascii?Q?UktsTXjtUQiMoq3hB/4lyln7CxV2LbC5yN/BVBPDssbdSGMx8epV37MpkDGN?=
 =?us-ascii?Q?tl40/pGWTiHb4NCgDEZtuwgLK0JGloBf0sdNp9ey0n1i2Edq7sDvczfc9pqf?=
 =?us-ascii?Q?7DWQV9FNCdN0BYaQZS8YRTJkbO1PFRRzZe7GGYpiWsnrh49r1Rd8pb3gpePa?=
 =?us-ascii?Q?hsKEu2ZtC46kgAqc6EU6oT1olHmKVQgA/fOGL4jYzLYBJXRSFfvhoO+jxbBL?=
 =?us-ascii?Q?MmUvlopQFvGGbvED88eKIuh+JMcWL9woCCAtdLz23I1cjyvz/oBNIosxkdAb?=
 =?us-ascii?Q?uC5PdD7ZJAPnuy4q+87yMJQ2k+BHfuN1P2S3gdhMsYitrWI2kzU0jDxZuwAm?=
 =?us-ascii?Q?NddwSoo2PVReG/zlsdprhC9VoqiKxeI1Uxex5w9lvU3FH75wkAN9aS61kafW?=
 =?us-ascii?Q?T/bO6Q7eKFJXODjEiksxQrdQph7eUvKFnP/Jg+TV3vXJGQ5fH8qmYeDspaJP?=
 =?us-ascii?Q?KZyjZBGZ/Mi06P3V8dOyQEuRjQVfCAQwbma5fgzdiW4E54vSTHEX0UsLlRV3?=
 =?us-ascii?Q?aStEAP3zH5YQyLs/TAikSeKvJqf9+IR5FjBftX7YsHhDjh8W5gIEdAdqCsHm?=
 =?us-ascii?Q?VDYpDEd832hoiFAtdcFAYJwkWIUc9EFaWyp9iBuussKu5oioZqGk7KWMQM4Q?=
 =?us-ascii?Q?zYpgnchXetGlQaNiEGFbJZ4juIPs9x2us10+xbiaMOObPI0os+8fF52VJ1Ey?=
 =?us-ascii?Q?dFvBT7DFjcaxqgaQd2TgC2yciKncQRoTvc2MkR37nWBkfxOJsbpRz89UqL3p?=
 =?us-ascii?Q?iUie3RcTslHyXQraeS+u7jW/WByTyE8Xu0+hiqKoiEDZEVSZMdyXXro+fGo8?=
 =?us-ascii?Q?wjltE5TS/eb1mK26j955Zk1MtVdwZ5rjzk9jIXoAtTLY0r+GcbUuibxnPOKh?=
 =?us-ascii?Q?uQ/2j5mjwlJmjOGknHabSGwRJon5rv3mwp7Ns6uxn/a3XmaJtx+2JRfl28sz?=
 =?us-ascii?Q?jJY4X3PUPf0jMgEftATCRNIJz9vf4qAvGLYW1343O5egQ/GRVyVzAwocHaOq?=
 =?us-ascii?Q?ZuLYLNE/6R764cApw7uylLvHB713+22TlEcq5HhYnn5qrmVLLVVsI+QTd2Zy?=
 =?us-ascii?Q?6qViNStMOrcOjyzrPfP02xGhqXFYcN9TEJEZx58icPQrK7T/FCajsFwsRjbr?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3685f13c-fe3d-4763-e252-08dde62e7e5b
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 12:29:12.1244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huJbT2r5nWlXqiRwTJkfTT9uy3lxCZhi0U0y5SCOeenqgdMBOEEvwqAa3iQb3WPXgPvG3yCoEiGsjvxyGxWSkhBfCd6tl3nOcob8f3Z6LcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
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

On Tue, Aug 05, 2025 at 11:22:36PM -0700, Matthew Brost wrote:
> Implement a worker that services page faults, using the same
> implementation as in xe_gt_pagefault.c.

Also the minor refactoring and cleanup along the way helps readability.

A few nits below.

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 240 +++++++++++++++++++++++++++++-
>  1 file changed, 239 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 98be3203a9df..474412c21ec3 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -5,12 +5,20 @@
>  
>  #include <linux/circ_buf.h>
>  
> +#include <drm/drm_exec.h>
>  #include <drm/drm_managed.h>
>  
> +#include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_types.h"
> +#include "xe_gt_stats.h"

Move up to maintain alphabetically ordered.

> +#include "xe_hw_engine.h"
>  #include "xe_pagefault.h"
>  #include "xe_pagefault_types.h"
> +#include "xe_svm.h"
> +#include "xe_trace_bo.h"
> +#include "xe_vm.h"
>  
>  /**
>   * DOC: Xe page faults
> @@ -30,9 +38,239 @@ static int xe_pagefault_entry_size(void)
>  	return roundup_pow_of_two(sizeof(struct xe_pagefault));
>  }
>  
> +static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
> +			      bool atomic, unsigned int id)

Please rename id to tile_id for clarity.

Francois

> +{
> +	struct xe_bo *bo = xe_vma_bo(vma);
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	int err;
> +
> +	err = xe_vm_lock_vma(exec, vma);
> +	if (err)
> +		return err;
> +
> +	if (atomic && IS_DGFX(vm->xe)) {
> +		if (xe_vma_is_userptr(vma)) {
> +			err = -EACCES;
> +			return err;
> +		}
> +
> +		/* Migrate to VRAM, move should invalidate the VMA first */
> +		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
> +		if (err)
> +			return err;
> +	} else if (bo) {
> +		/* Create backing store if needed */
> +		err = xe_bo_validate(bo, vm, true);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
> +				   bool atomic)
> +{
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct drm_exec exec;
> +	struct dma_fence *fence;
> +	ktime_t end = 0;
> +	int err;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> +			 xe_vma_size(vma) / SZ_1K);
> +
> +	trace_xe_vma_pagefault(vma);
> +
> +	/* Check if VMA is valid, opportunistic check only */
> +	if (xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
> +					vma->tile_invalidated) && !atomic)
> +		return 0;
> +
> +retry_userptr:
> +	if (xe_vma_is_userptr(vma) &&
> +	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
> +		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> +
> +		err = xe_vma_userptr_pin_pages(uvma);
> +		if (err)
> +			return err;
> +	}
> +
> +	/* Lock VM and BOs dma-resv */
> +	drm_exec_init(&exec, 0, 0);
> +	drm_exec_until_all_locked(&exec) {
> +		err = xe_pagefault_begin(&exec, vma, atomic, tile->id);
> +		drm_exec_retry_on_contention(&exec);
> +		if (xe_vm_validate_should_retry(&exec, err, &end))
> +			err = -EAGAIN;
> +		if (err)
> +			goto unlock_dma_resv;
> +
> +		/* Bind VMA only to the GT that has faulted */
> +		trace_xe_vma_pf_bind(vma);
> +		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
> +		if (IS_ERR(fence)) {
> +			err = PTR_ERR(fence);
> +			if (xe_vm_validate_should_retry(&exec, err, &end))
> +				err = -EAGAIN;
> +			goto unlock_dma_resv;
> +		}
> +	}
> +
> +	dma_fence_wait(fence, false);
> +	dma_fence_put(fence);
> +
> +unlock_dma_resv:
> +	drm_exec_fini(&exec);
> +	if (err == -EAGAIN)
> +		goto retry_userptr;
> +
> +	return err;
> +}
> +
> +static bool
> +xe_pagefault_access_is_atomic(enum xe_pagefault_access_type access_type)
> +{
> +	return access_type == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
> +}
> +
> +static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
> +{
> +	struct xe_vm *vm;
> +
> +	down_read(&xe->usm.lock);
> +	vm = xa_load(&xe->usm.asid_to_vm, asid);
> +	if (vm && xe_vm_in_fault_mode(vm))
> +		xe_vm_get(vm);
> +	else
> +		vm = ERR_PTR(-EINVAL);
> +	up_read(&xe->usm.lock);
> +
> +	return vm;
> +}
> +
> +static int xe_pagefault_service(struct xe_pagefault *pf)
> +{
> +	struct xe_gt *gt = pf->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_vm *vm;
> +	struct xe_vma *vma = NULL;
> +	int err;
> +	bool atomic;
> +
> +	/* Producer flagged this fault to be nacked */
> +	if (pf->consumer.fault_level == XE_PAGEFAULT_LEVEL_NACK)
> +		return -EFAULT;
> +
> +	vm = xe_pagefault_asid_to_vm(xe, pf->consumer.asid);
> +	if (IS_ERR(vm))
> +		return PTR_ERR(vm);
> +
> +	/*
> +	 * TODO: Change to read lock? Using write lock for simplicity.
> +	 */
> +	down_write(&vm->lock);
> +
> +	if (xe_vm_is_closed(vm)) {
> +		err = -ENOENT;
> +		goto unlock_vm;
> +	}
> +
> +	vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
> +	if (!vma) {
> +		err = -EINVAL;
> +		goto unlock_vm;
> +	}
> +
> +	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
> +
> +	if (xe_vma_is_cpu_addr_mirror(vma))
> +		err = xe_svm_handle_pagefault(vm, vma, gt,
> +					      pf->consumer.page_addr, atomic);
> +	else
> +		err = xe_pagefault_handle_vma(gt, vma, atomic);
> +
> +unlock_vm:
> +	if (!err)
> +		vm->usm.last_fault_vma = vma;
> +	up_write(&vm->lock);
> +	xe_vm_put(vm);
> +
> +	return err;
> +}
> +
> +static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
> +				   struct xe_pagefault *pf)
> +{
> +	bool found_fault = false;
> +
> +	spin_lock_irq(&pf_queue->lock);
> +	if (pf_queue->tail != pf_queue->head) {
> +		memcpy(pf, pf_queue->data + pf_queue->tail, sizeof(*pf));
> +		pf_queue->tail = (pf_queue->tail + xe_pagefault_entry_size()) %
> +			pf_queue->size;
> +		found_fault = true;
> +	}
> +	spin_unlock_irq(&pf_queue->lock);
> +
> +	return found_fault;
> +}
> +
> +static void xe_pagefault_print(struct xe_pagefault *pf)
> +{
> +	xe_gt_dbg(pf->gt, "\n\tASID: %d\n"
> +		  "\tFaulted Address: 0x%08x%08x\n"
> +		  "\tFaultType: %d\n"
> +		  "\tAccessType: %d\n"
> +		  "\tFaultLevel: %d\n"
> +		  "\tEngineClass: %d %s\n",
> +		  pf->consumer.asid,
> +		  upper_32_bits(pf->consumer.page_addr),
> +		  lower_32_bits(pf->consumer.page_addr),
> +		  pf->consumer.fault_type,
> +		  pf->consumer.access_type,
> +		  pf->consumer.fault_level,
> +		  pf->consumer.engine_class,
> +		  xe_hw_engine_class_to_str(pf->consumer.engine_class));
> +}
> +
>  static void xe_pagefault_queue_work(struct work_struct *w)
>  {
> -	/* TODO: Implement */
> +	struct xe_pagefault_queue *pf_queue =
> +		container_of(w, typeof(*pf_queue), worker);
> +	struct xe_pagefault pf;
> +	unsigned long threshold;
> +
> +#define USM_QUEUE_MAX_RUNTIME_MS      20
> +	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
> +
> +	while (xe_pagefault_queue_pop(pf_queue, &pf)) {
> +		int err;
> +
> +		if (!pf.gt)	/* Fault squashed during reset */
> +			continue;
> +
> +		err = xe_pagefault_service(&pf);
> +		if (err) {
> +			xe_pagefault_print(&pf);
> +			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
> +				  ERR_PTR(err));
> +		}
> +
> +		pf.producer.ops->ack_fault(&pf, err);
> +
> +		if (time_after(jiffies, threshold)) {
> +			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
> +			break;
> +		}
> +	}
> +#undef USM_QUEUE_MAX_RUNTIME_MS
>  }
>  
>  static int xe_pagefault_queue_init(struct xe_device *xe,
> -- 
> 2.34.1
> 
