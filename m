Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD58C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 21:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4646110E0A6;
	Fri, 27 Jun 2025 21:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRlolHef";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB3D10E0A6
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 21:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751059487; x=1782595487;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7xvcFv9TZn6HI/9e0cncwmEjvr6qavKS1ANeu6KZiN8=;
 b=HRlolHefYJUspmg6dgadDm2GuDOEI+JFsO5TVkMCOL7+WuO5bmYiSPGJ
 4FQh5H3I1umb3TZSRCup883dmpSoouU+cSXXBPssqQ0TOWVQlzxOzHwf6
 pGN4w2cXXEW6+9IMh+0+2IndE/YFVZvulpMJhc9XOEqdA3oDJPOch63LX
 lpxBDiVlhLkN67I9iZK/0W4e5vDSgCXmHHN9+FXrtZXmLKt9xKzN/+Kvv
 KWGGcLTTjd10OqRLTB0J3nJkvLIh5AKlPeGWuQtq6jCJT9lj+3wT5zZm9
 Z4oU+nYIm4VxBgfidEsIo1kk4cyIbVRNC8taxLr81cvhf6H0nazhkqfi0 Q==;
X-CSE-ConnectionGUID: UADxH/LOQGGHLYtiW+GO6w==
X-CSE-MsgGUID: y9yNNG9FQTiwHsJ1EQQXGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57062455"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="57062455"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 14:24:46 -0700
X-CSE-ConnectionGUID: lrtxL4AHQ8mbb2NvOIRb3A==
X-CSE-MsgGUID: LuNsZb9LSEesnVTix3S/qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="190088715"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 14:24:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:24:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 14:24:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:24:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uraxod90m9Nckcur28ioVXU4PIu4KTkRyvTHed1+jIET/CFfwliJUQTHotVvks/6/XhMGzG+iFe9kgxa+Oi3cYzunaIhJOplq8hlRmDUbzanRXHvhIP66Q4JvRy3rXMElzJk2KYDjTyhAxEx9QtMxG/d5YpgdYwor8RS1IDKG+gUcYDLGCb1Eq4waNNsUaJCLG50CUHNsEb2vLsGgoM/WbYjQxC7tmDGCEvoLpb2y4YH87wOaeE5LNaXo3rQRZVkI0S2YV0lsl+W+9b/5BPtLXrED1xoDeVtmRVlASzAG9tvmuG9GP0l520UERAgxiAPOnWcG4LWuGOxUOEY+pJadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbBC1jOufb9GcgRSo1BfmeSorJemVPXVYv6ebPkB/Yw=;
 b=e7cKWZTZVhfy6bu3ka0ICkkasvyB7kMWhgVGaKP+v+0ca+sKAwsTi7mKqAEQcjGRw4deOanhDP9U3H/W2/+cECtT5w6BFJLhg6oEa1Ze1KBDSaxQKccw8NMCZB2EsU4hyyO2tTdXeEi+gwaGN1D5/Z4rXATVy8f8xk0gIXm+jG6H+0fla/jkWt6nBiWQEzejWpZZKxwyEN9I3SKD9BxmBImPNEkjLK2TxKsrsuQPVu+NyKzeKPGtiOCEVSk+eoJnuEMLHJBo0tRhaxnX8nvNHV1Hmtk/R8LHKQTnZ2NtQwtYon9diOhq9P2LUM5YD9ZXhmWe60FvmORuBsybidLyeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN0PR11MB6159.namprd11.prod.outlook.com (2603:10b6:208:3c9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 21:24:15 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 21:24:15 +0000
Date: Fri, 27 Jun 2025 17:24:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@intel.com>, Harry Austen <hpausten@protonmail.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Fix conflicting intel_pcode_* symbols
Message-ID: <aF8L-1josZR6yUuN@intel.com>
References: <20250627-xe-kunit-v2-0-756fe5cd56cf@intel.com>
 <20250627-xe-kunit-v2-1-756fe5cd56cf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250627-xe-kunit-v2-1-756fe5cd56cf@intel.com>
X-ClientProxiedBy: BYAPR06CA0010.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN0PR11MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: 1764670e-e141-4810-6c6a-08ddb5c0f7b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w7MJ3ugSsYYZcdS16cVwTx8TCjTRXBa+jpI/ClUs9LI5nHtN1fkvFu4Vzh/S?=
 =?us-ascii?Q?xVrF+TjrCbDVBKPLbNkPdQbkudD9DhALyq0BdOTzKSBBfB8OfiJVMamy3apw?=
 =?us-ascii?Q?ljDvZ8fkjF1TTA6oGRhRjbl5FxyXZ8WL3720e3eIDLgsGQ1ob045BGdgGw8i?=
 =?us-ascii?Q?Md6ajo8bi4fx2t6MPYMECBFFsAuzal1Yf5bJOCHJHFft7hN0V5HKs2yCyp9q?=
 =?us-ascii?Q?Do//sUNJj4hqQY0ahF1DmjPJl1lw7mtkpI78oZgTpyyYxe9gTZR0XEtPy29B?=
 =?us-ascii?Q?J/xR5V2d0zjoVggCWlNrAm2FWghLF/19hlC9vdWdI7vd0LlMgaRxsBGZUIdV?=
 =?us-ascii?Q?QnFqwxbcv+SUW0Ue7Y0H1+n5MFhFC5sDPNHlJAnC48yT+IPGd+eTX98kYpOR?=
 =?us-ascii?Q?8l4s/sOlrOdHLfZh+bWXcSf/wT7Fh0quOSdK5XJ71Awx1hXrYqv4h68isrUc?=
 =?us-ascii?Q?GI2qKE5j5Rs0glDLRAWLLdl+cAiJNdiQlFSO4aqPMnKr/RGBQ+UL+v6f0XV2?=
 =?us-ascii?Q?MvmAjn15gj/YI2IrjbdldH4m3mpvKna30RQFPB9TKgcmNuepYALLRrMMZ7zE?=
 =?us-ascii?Q?r7LENAAJ+Zo4AZXD6anfPmcQG1kjtiQOOvq8OT7KXMsM+xYVSlUdI7Nnmzxq?=
 =?us-ascii?Q?JjFAb3OyHF9qQZck3xBWvbwfF2tVVNwPVnSDEplIfX0LUDzAgG4FSUbPl97X?=
 =?us-ascii?Q?CSTHjKtSzO9noMESneovpr3BZ0/k+jQ8H9BsQVM05ujD8EYt+h59l/fn66HM?=
 =?us-ascii?Q?zdCeyz9eIffD6ol3j4ZIayaGWRd5AY7OvLQ9wvtQ1TMpUihfnI/8uNcqhg9u?=
 =?us-ascii?Q?kxOKsV0fNebtuflyuPRSV6wqTEjRTtZ5huz8Aotz/6R1LQR501FgbS8ABUMG?=
 =?us-ascii?Q?AWMyG+tNjPMdwqaRoGCWtX/1UjGa9ZdBREf8u5yPSuSfuL+v4IC2SiMtr0MS?=
 =?us-ascii?Q?59qep+1XHa81cYOWQyeyzIhftR3/k7UbFiHowoSEXACfzSM7qfNHPMfcgmTK?=
 =?us-ascii?Q?9vL0wVINU2DmzkAeqcYxUQxEW3aP0wNCnKN5+KSll+IBulHUCiJjEqyvDhJW?=
 =?us-ascii?Q?s0YCpshxOdPMCBCOM4uPLgZJrT5TXFCi+86V4+N1xhBsrXJDEyzbyUqo0m4R?=
 =?us-ascii?Q?npZUMzTWdkgefGRVC5pZ4F+Kp7B3pGEzaLnmMWgwq9IFUMigBjW5LAnTpmPi?=
 =?us-ascii?Q?28tMNSOmmjdLb40pIkkgzSBudKwsHhyMzW/J2DzQvXiFc2QtoFRDa8odsBSV?=
 =?us-ascii?Q?3w/saq5FH0crlM5eQZgBc8FU5vv5WzYih+sYOg3e+U6wEe/Z/6CIhyYWWj7E?=
 =?us-ascii?Q?hAbcnL7u8KBm/P4JCH4W4oh3RNyM9XG3VSdRHJRW7eQ66lp2XuYeqogY524X?=
 =?us-ascii?Q?j3ztHk22uwF447pVauLOT2OjYkhvcgQAM2ps+c5OWussge2m4WywYuNMH7Wh?=
 =?us-ascii?Q?Zk6L0lN8oCc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qXADAlUGeLZqwUkmUo/j74PHGSTcLdqz+aoXESLDo6+suRamtvM3Ivqaiw0O?=
 =?us-ascii?Q?UKnNxYmKLEFT5RcuzCPdI17H+AD+ZwwbNpKzWT+lwcCFEQsUUw6mpPVNGecE?=
 =?us-ascii?Q?nYZ+RWfCHLpnLzKzongH8WJrQ9hKgb3M79lfMP22iwrqz5gsmDQwXy5AWIBg?=
 =?us-ascii?Q?7YwbYmFCpUzVYf/0lFhE0Mxl0Ngk+KcaEy5zk/G0hlYD5x0glRvbSeaAR4Qs?=
 =?us-ascii?Q?PZOrWb6YLQPSY9n2+GPGDsax8tSl+F0plIJcUS3Fk0aO0wvWFNTyv9L7EJxh?=
 =?us-ascii?Q?P3bXugZTgTsu/cMWD5/XYgmSigDhZdcwcpy3f3jsIzbZNz80gjrSJiAVlILw?=
 =?us-ascii?Q?ENSpClCHwoGDA2dthS8k9dOVXLEv7qCD9NuNbXWqMQ69nOzbXeY6iDmBSTPr?=
 =?us-ascii?Q?7xaxSeLdkv/6qc8UCsaMtZP92FUZa7M3FwgoyCRx6doLwzAZA2Ona7J/Gacr?=
 =?us-ascii?Q?V6iNdWKP4WFvWyzJ4cjU4v1SkJrd5sv4FKwI243iprLVhXWjtnVie0iz+Oul?=
 =?us-ascii?Q?wfuXCMHKltvWvTtfZb3uK1zUBDICRg7VmyihXT9PB4vDYTStxm5JDmcQnWxf?=
 =?us-ascii?Q?IpOblvZ2VheS6s3NdSJuuCLiVzHgv/Kcp5AtGDUM2ZNdipKb8+MHrC1kssTq?=
 =?us-ascii?Q?0CLGKBsw1SUt8+IHyPwWDa6x+8cOEUJ0Yw7mjOR0Uz50JwhWgPsGqpaBdx2D?=
 =?us-ascii?Q?dQZG3LGUzvfarHFO2aqG4Bye3ft/9eh8IEust8sYYBb3ErSyZCkAXeGbOz3U?=
 =?us-ascii?Q?4bYfcmp6tkN1uaio6ySyd/IyhOv4wPCdNsoHacmfhrO3r3d8w1LDFQL/Zb5i?=
 =?us-ascii?Q?CT8TuQ2DGjAaJMseYfPjuGOEhs8SWQJqKrUCc7ruBBT6SkCTb2hfJLzNMbGo?=
 =?us-ascii?Q?hqEKSGoCEwcslYSxXAbcoYJ9FGiMqXjy1NcFTGFM6f7Lgx/BGIrPGt/7BGMX?=
 =?us-ascii?Q?5kz7Rx6dsVnsW75rzUO3RWnVdzNMQLVs7Kf4hsbNCbsIceNREXbPD2UQd7vF?=
 =?us-ascii?Q?8x4WXOXR4BNZaDn28S1fG5b9h7G0BPpdi4vXU5+NaQLBrSmr7xBMz6YYso44?=
 =?us-ascii?Q?SHCx1GjsQx2SRjsLWZPFi8U4P2v95Dm1VwUJoaIe3JTG9X7vcmToIC/5hU8f?=
 =?us-ascii?Q?KWwFwKeg72btjHzRD2fEaHAMxgSPeUfHiYAycrky5kkrkJP5ccMx9KiSQ0tb?=
 =?us-ascii?Q?YAsxKCz/Ad86D3gcjMvVXu2HzSXTdtdRXpcvbTaAm1m02CTZ+WJM9bGMKN34?=
 =?us-ascii?Q?ne2uVJqRySRqMg8TJqM8ktvf66Yl6qhcRoF0dmEFNdcLFXFEYDL50yxaX0m2?=
 =?us-ascii?Q?5sj1jBBzIa7R+mfPgP3XCXUqqVF8vAC4Y72eUdrBxEssYAIBOTAORta7pPPP?=
 =?us-ascii?Q?toUxXVTnT1q+qrmqAZcSmwPx9yWgZ930zUmdibf0nNeX0AuAnwWhB35Y2zkR?=
 =?us-ascii?Q?kho9ES+HTwxyXC9IwnVL+3I3QBCn2ChGyfCsjpvJcRU/0g4lYHSUempuKPmN?=
 =?us-ascii?Q?o47ZEtAL6EeRD19E1V0hYj9bBqb974JaPL8yWCaveWOmWvSFkVcUdZI5iXoZ?=
 =?us-ascii?Q?iQqgBxz5kS8rO+7eXcwftXsGodz4zlspabxNPk1ehi1RkVa7gxUDEKIayUur?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1764670e-e141-4810-6c6a-08ddb5c0f7b3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 21:24:15.2552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3NJSlxres8HnXtJDNveVruSaRFaWlq1ZNy15y8RREh5BsJWJkQwUgu2FvfZ/W2HmWt62Bu+SAMR49oyKwzz2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6159
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

On Fri, Jun 27, 2025 at 01:30:34PM -0700, Lucas De Marchi wrote:
> If CONFIG_DRM_XE_DISPLAY is set, the xe module can only be built as
> module to avoid duplicate symbols from i915. The interface for pcode was
> added without considering that, so the build breaks if both xe and i915
> are built-in.
> 
> Since the intel_pcode_* functions should only be called from the display
> side (xe side should call the xe interface directly) and there's already
> a protection in Kconfig to avoid the problematic configuration, ifdef it
> out in case CONFIG_DRM_XE_DISPLAY is disabled.
> 
> Closes: https://lore.kernel.org/r/3667a992-a24b-4e49-aab2-5ca73f2c0a56@infradead.org
> Fixes: d9465cc8ac2d ("drm/xe/pcode: add struct drm_device based interface")
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 87323ad0cbbb2..6a7ddb9005f99 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -337,7 +337,9 @@ int xe_pcode_probe_early(struct xe_device *xe)
>  }
>  ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
>  
> -/* Helpers with drm device */
> +/* Helpers with drm device. These should only be called by the display side */
> +#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> +
>  int intel_pcode_read(struct drm_device *drm, u32 mbox, u32 *val, u32 *val1)
>  {
>  	struct xe_device *xe = to_xe_device(drm);
> @@ -362,3 +364,5 @@ int intel_pcode_request(struct drm_device *drm, u32 mbox, u32 request,
>  
>  	return xe_pcode_request(tile, mbox, request, reply_mask, reply, timeout_base_ms);
>  }
> +
> +#endif
> 
> -- 
> 2.49.0
> 
