Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8ED4C02182
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 03:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7803710E33E;
	Fri, 24 Jan 2025 03:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RP0BPZtf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829F410E33E
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jan 2025 03:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737688692; x=1769224692;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dfNQqXssv6UddLovUJm+1gG2P4/Z+Asht259THztZLE=;
 b=RP0BPZtf/DPql/lD7OF0vL96mJvXdmFvelzdsiLez+k6QaFiDrfj6+Hg
 WmqT50bhNI344z1IWUSPQsB+v88FSsIoLqn2okzy5CukG23k2KPdTSLk1
 DooA5HXp5sx4frudt5eLUp0QOp38t2ZAT/wLO/QuX5daM4YmKPBZ1qGZG
 sHMvDduoQ7565udpOjbVK1pzVh3C3dfrEgUyHrHX+L2+evz2keEvC8zBg
 NDgwfIqVQy7Lh9wWhVPT5a8SsoOngRwusTLQnAMssFjIAUHA740MW8baJ
 /nm63KULH7N8j9Mv4HmXIDGBZopFiIfVC/tvxS+lxaeytiqM8qdlgmGGL A==;
X-CSE-ConnectionGUID: Y31UL+bZRiCToV1MB+dMfA==
X-CSE-MsgGUID: ILvRhpX1RnWaDxlMiUK0Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55631374"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="55631374"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 19:18:12 -0800
X-CSE-ConnectionGUID: qL/j3ufrRTO+hQEykm8k/Q==
X-CSE-MsgGUID: w/NcEPfsT4ylvobWm6s6rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="130946416"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 19:18:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 19:18:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 19:18:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 19:18:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Njj5UFhWTtURtEMDsTM46yVeBJWWgCQcPpf93pkpK9H26OE8wI0nJlsvxinYjeCw3NQ0pKWPJReDZXgugTn7V1LoH2wUzctuA0mNd573Up6uQpXWpGyanpq0M+iHOMdts8tlklY+WCHGHUotatywMo1v8S3I+2O0VBTDHDlpkAvFyr9tNZ6vePDp4wSN9uMYZgwZ6fYA3AkQjoXyoK3JNbD9TPhZMP0V+gbqYYW5SEebAFI+YXI83PyhGtyw0wkW7YHAxUBy6k2fQRsh8KUJ2iJZ1S4bwl1FYtMmMlth7k3LyJuOA/PvMDB/AR1U0hotMskMEz8FkZ8e9wDlxZU/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8k/uRQK+ARCkqsgYLbkx8MDV+5RH5jk8+0gyBbiXgU=;
 b=NGeJWWBQ1GAEcpyIrtqOfXdMwETEaEpiqhqL6dNBdw4ulk+IlU6pY+aeIFw68XvBCAqmxx24kyrDYREditB++HnQdvemMb8xDM5n0vybRoY2dYVecPzWyOQp0KdMI76PfTqS8dgjioqlwQq/tWGHfkmw0eV2Yj+vXOIaRfYIZoWxrMgg7TDP87kmx3zsoNlMdbLShyW2ov7PU/GqHt4QT/KtJ1cxX1Uk9IcX89DMu/W+32uadsjEcnx0+3hgpqfDJ7frNxoL2io+bj0LDn4Mgs/vO4S3SGH8NKDi+27Uch8dUJGMTDOzt5448/7XLt57f3Di8GnRgoeFfmmlGzyV2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by DM4PR11MB6068.namprd11.prod.outlook.com (2603:10b6:8:64::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.16; Fri, 24 Jan 2025 03:18:06 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%6]) with mapi id 15.20.8356.020; Fri, 24 Jan 2025
 03:18:06 +0000
Date: Thu, 23 Jan 2025 22:18:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLmNoZWNrcGF0Y2g=?= =?utf-8?Q?=3A?= warning for
 Enable Survivability mode (rev4)
Message-ID: <Z5MGajYlnZuTbaD_@intel.com>
References: <20250123072343.326919-1-riana.tauro@intel.com>
 <173762471212.3478681.6566213440894312967@b555e5b46a47>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173762471212.3478681.6566213440894312967@b555e5b46a47>
X-ClientProxiedBy: MW3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:303:2b::16) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|DM4PR11MB6068:EE_
X-MS-Office365-Filtering-Correlation-Id: d78e1a2c-89b1-4170-52d3-08dd3c25b7ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bgeiz8vKi6ehTUJg26jl6NUP9N7w0+jTgjKCIvf+7jbEzCHpZA1jXRlby6Uw?=
 =?us-ascii?Q?ceVBm0M4ArLJsDaJsIsj2Vw8DTNYllZorpPUAY8YgH1xA3OMYvur5fFOhfIV?=
 =?us-ascii?Q?ctmbzFhlZd8Ec0fiSCAGLQ56OmRwfG8iSnuxmIL7XxQb0DHRc3BnCDXgRCSI?=
 =?us-ascii?Q?Vyg1bOcRW7r1GkpFxzWXFdBeNNR4l+auVunY474LYOECWHlsvhK/PR4IcxGK?=
 =?us-ascii?Q?PIFSU9Osl8AoQ+IXizRQ0WzsispuP6nO8Biug8qGZEI+sh01yEpf03E4O5et?=
 =?us-ascii?Q?AatvkMWkIfTJ/Ze5gdkzM3fjs7+uTg2R5HcxnSpAj4Xlaor/2y+JETgeGVWf?=
 =?us-ascii?Q?0dplXxHj8eELwSuvVDyEkZvEDVdnX7FYyVQ2WzO+WpfmXoNOmRhXpOxbMJSY?=
 =?us-ascii?Q?d8oJR+Jq0Ad7U+voqM7/C4t0avF75nqQPfvPKC+IY2eNV6amgSU9DGFKibQ4?=
 =?us-ascii?Q?+akD7kuOlXpE2NqGF05M44UpKiuxRMPat7p49ZvKhLV7hQLs4yXbHFeXGAPm?=
 =?us-ascii?Q?/FBeKHNR2f6xrmkhRJhSYI/WluzTTB8LjxOJiSiDVw0qd48rwYmCFnHTuKX1?=
 =?us-ascii?Q?gGBqkJekiznhVFF5gy3bLsYbsp0iyC3yvFhDS3nzGDFa4lzQOcL9ncmAN25J?=
 =?us-ascii?Q?JHCQoN4tYLYo0kbYl8bffQdvBCdIhPTM/6FHlhUrAaW1HYvXD+M8k3AN4FVk?=
 =?us-ascii?Q?tJTA0JI1/WnE/7PkHeWTj5h9p+s0RS5fDsG6wxSwAj6EsLVE2h6WBmkgK51Q?=
 =?us-ascii?Q?n1RjU/CrIoqKmokggD9g70uqHMFwExFlr/nbrnggWqk9kS6fnLFU/+zwp8EL?=
 =?us-ascii?Q?pPoAYFDTF3I6xJOdRMSTyRmVujIP9BPrmPXog0mV6J6UnNWQjENnB9tviRup?=
 =?us-ascii?Q?JfBSTI2vHoVg7XupN76lM9wduux5pjpeRh96pxf3TgXmqV/CcBeE5/QH1eTH?=
 =?us-ascii?Q?/EmtOQV8x9VvB5bTBM3A3MXJxlDI5oB78GSjvqyw+lp6qNw/gfRAObdo4bqq?=
 =?us-ascii?Q?JbnM13AVyvntdSQMamo38t7R00Lj0Bq+rzHDLNgO+hhGCXuc6jV1Zo03sJ9c?=
 =?us-ascii?Q?8n6ZFGsa8lqx2/23gTulYVmBco1Dk0iQREtle9IRvVHjqTwIAt8AHKgLu0TD?=
 =?us-ascii?Q?uuvgZK/trlC+mgT6RlGdgZeR0lUYc2QTlXVMzsyotoJOSB5OQye5Ec8v3xHL?=
 =?us-ascii?Q?A2xvJWdcFol3aYPINCK/gwI/E+2l/aBPhigxLG9LTSQp8t76TDJggTM1ritl?=
 =?us-ascii?Q?PklTiOUiWdQvfWnfi+XvWepp4TlaLU+5mJiJg9W5/hnm2WUYIkDdcynco0PP?=
 =?us-ascii?Q?GOkeYVB33j1tKrCx9X/Sa94bUAGeAL6wX4qMTEZiyZ2Kvg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BsdVpEr78D741mJtk+hcE+kzEZj9MbJjNjzYvVSNwUcSGiTyBwvK7eF8EaO1?=
 =?us-ascii?Q?nj/auEMyduBio3N8DHX7jDfJW549zkvhaXP1uUUD1EnS9MSouPt30J8rgl50?=
 =?us-ascii?Q?TmHMWUzOwTE6r41gwiGajsymiDGcYMRp/14POmioB3KfQNuU+z8am7K2+vsU?=
 =?us-ascii?Q?jS4Hhuaj4C1ORxi4FDG7Hy/kWGgMBbbCg8e94ovVdhgrp0jdfJSd0y1T6D0l?=
 =?us-ascii?Q?MlZdcZ6H+H8wioIjuUwaWKADjkGz/Ri64g79X1/AHCcp5Zr/mJVkShJgxGnr?=
 =?us-ascii?Q?oheUXPo3KTYNaeZfsWVNEZLA7QC1ATcuWhhvT0vn160dHQm1XEX0JRWCjqyj?=
 =?us-ascii?Q?eozKe/SXFOO7Bhroo0v1wXCk46SxpoX0+pifarsmpWlEJo9ijBxbjixqjTAP?=
 =?us-ascii?Q?EJQ5y2im/g3XbowFMTA9FbUR9kMBPsIwS53mqEqnJR3/cgr7wMdtJUB0J6X+?=
 =?us-ascii?Q?CPIYnrt6vl3Gx6ZRjQr2TP1Rfna1oAr4Bf8RuxNlKaprMqzLpKSbsFeV86UW?=
 =?us-ascii?Q?xYI0bvsYrVkcW3jrN8D5Wiwd/eDMQr8z98/93qsUdX6jTpyrMwKx9CI4rl2R?=
 =?us-ascii?Q?S0iZVEVIdlVfZyzHjAcNi1IeQPRJy8iofKp7wHNThCZrHhy9oVuUkKWUyLHr?=
 =?us-ascii?Q?YbRhSzTDpQymknBW5+Qww8vU+Xr8ip4KShTtCi79d6SI8iOhzr/zWcgE+Uzo?=
 =?us-ascii?Q?qXkgB7BZrMqS8fKhKbb6miEZ0ARnSnpeD34JsDpJm951SuJIfRhy0UcwAdG5?=
 =?us-ascii?Q?aqdDYgoqMTfMpzSucOke6whq/b8+8+BGF7cDkZy6+G5Rrp9I5bvoKC39Ooyq?=
 =?us-ascii?Q?coPy6lhRkHv9IKXKSHnejbgqGWvVcyPDG5/Y+S1wM1LlGNWPVresEztgrYFG?=
 =?us-ascii?Q?/5qrEAyEeEk04yPah0oDul65+gM4uEFyaKHS2/fyEWC7PO2eskQyngwZgCcb?=
 =?us-ascii?Q?LrwVOLVMmtHacT1/NLZv9GKmKMR4NaEAq4lqcDCbjI1S3iZJrsUgtmx4E2Ae?=
 =?us-ascii?Q?xJFAf/WlhoSkg1cS8koLW9H28E8S2V8dV8ST3QyCc6OfFuiao61cAYvdE+rG?=
 =?us-ascii?Q?7KUU/EaniOLY0oTlZiIYO/Sjo4qRLKUvagFl9gR2+n2tYtf9FzWQoASvU31G?=
 =?us-ascii?Q?GRGDkdbSouEXQV4vZH6Ey3HxN47JvK3d08DYhON98mRK2wxXxS7BJ5vWfny6?=
 =?us-ascii?Q?8Aazu77O9DGukPjXmf2hL0bMM+ts+96AGPqb5J1xw/c7xbvfRsicxbjsdVsC?=
 =?us-ascii?Q?1TMxPMHb32Hj3oqGEfQer+6pA1By5pS5izX/OZ02HH4IW71Qm0hgOI3MCE3y?=
 =?us-ascii?Q?HkN3FImxDZBTA1tKiQfi+4M71Jhxmo/VX6BhOjOH6yPaiusQFb+5ZIYnTqKt?=
 =?us-ascii?Q?rnS1Vg1unKV2e8qOjBch7+JxAsOzGJfT4tu/ea3hm/PwzOifTyRUmVX8PbLm?=
 =?us-ascii?Q?u5nM2ECyvWaodmJNJzAFv1CecS2oKy7Bgxm1uExo22INjqPJko/wmNDWZton?=
 =?us-ascii?Q?Xvmn7mEb2eGFoTraoJUssmn80NP1jVJpNCCufuX7kFAt7KVNyl7ahI6/uTwz?=
 =?us-ascii?Q?mLufFZoULCDPqhZUzsFab3wmVHPVSpkBM5xGb/paWt6HLm3+MW4iNlqfe6kq?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d78e1a2c-89b1-4170-52d3-08dd3c25b7ef
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 03:18:05.6013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUdQ85sP0KNfwYn4zvNbqKx6c4R4RTm7qmyedmGmox3Mfy9Dm/K7pVliagj1iVc2IdJePdgIGxjtOp9J5zcBVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6068
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

On Thu, Jan 23, 2025 at 09:31:52AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Enable Survivability mode (rev4)
> URL   : https://patchwork.freedesktop.org/series/142464/
> State : warning
> 
> == Summary ==
> 
> + KERNEL=/kernel
> + git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
> Cloning into 'mt'...
> warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
> + git -C mt rev-list -n1 origin/master
> 30ab6715fc09baee6cc14cb3c89ad8858688d474
> + cd /kernel
> + git config --global --add safe.directory /kernel
> + git log -n1
> commit 90df7c63e163190682318f3655989cd8d91e6d12
> Author: Riana Tauro <riana.tauro@intel.com>
> Date:   Thu Jan 23 12:53:43 2025 +0530
> 
>     drm/xe: Initialize mei-gsc and vsec in survivability mode
>     
>     Initialize mei-gsc in survivability mode and disable HECI
>     interrupts. Also initialize vsec in survivability mode
>     
>     Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>     Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>     Reviewed-by: Alexander Usyskin <alexander.usyskin@intel.com>
> + /mt/dim checkpatch 33906a7032dfca356fd7309e6abbdf5a7ea97db4 drm-intel
> e920d9351992 drm/xe: Add functions and sysfs for boot survivability
> -:101: WARNING:TYPO_SPELLING: 'Auxillary' may be misspelled - perhaps 'Auxiliary'?
> #101: FILE: drivers/gpu/drm/xe/xe_pcode_api.h:63:
> +/* Auxillary info bits */
>     ^^^^^^^^^
> 
> -:108: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
> #108: 
> new file mode 100644
> 
> -:153: WARNING:TYPO_SPELLING: 'Auxillary' may be misspelled - perhaps 'Auxiliary'?
> #153: FILE: drivers/gpu/drm/xe/xe_survivability_mode.c:41:
> + *			      Auxillary Information  - Certain failures may have information in
>    			      ^^^^^^^^^
> 
> -:198: WARNING:TYPO_SPELLING: 'Auxillary' may be misspelled - perhaps 'Auxiliary'?
> #198: FILE: drivers/gpu/drm/xe/xe_survivability_mode.c:86:
> +			snprintf(name, NAME_MAX, "Auxillary Info %d", index);
>  			                          ^^^^^^^^^

I was going to merge this right now, but then I noticed these typos.
Could you please fix and resend?

Thanks,
Rodrigo.

> 
> total: 0 errors, 4 warnings, 0 checks, 310 lines checked
> 84d53f48b613 drm/xe: Enable Boot Survivability mode
> 90df7c63e163 drm/xe: Initialize mei-gsc and vsec in survivability mode
> 
> 
