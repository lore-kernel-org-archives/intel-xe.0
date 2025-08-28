Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C42C8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 11:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDF810E980;
	Thu, 28 Aug 2025 11:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4LtmcNp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1A410E985
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 11:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756380418; x=1787916418;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=F/IdhmWB/I3+od7hs2hNDEkMkE0LIyIYWNLW9Nb1zY8=;
 b=n4LtmcNpJ88KfY/scGICiLn20sMhWsybLmQUYJj/IR/JrDYVMcDGMTrs
 J3HyuRSY7hSOZV6eEnsE4gUJw5hZ+Sq5G43cLG7Y5Xb5dtbFPXfYy+ezf
 Y+3v7Dz7drgF9mqbz1OIghlEI7Vbh77HrLqU76jJXIYIr8m1i9vBdzdB0
 r8R//87kwGZBpfxlw1Q6kb7FS6MjXKFv08GBPHRsaJggpHNe7quFuEgvd
 1Ehd9OXUOFcXuCjkeCdxK44tluiwBN6oHqlB5XteMREju/B8babAYCrYw
 JDl1PhrBTIYdmZDan5KJ33niYJOfrMTzsg/5Med++uSYHCV63Wx2M81SX g==;
X-CSE-ConnectionGUID: r/Ui0mPtTwGXXN6/1sKRdA==
X-CSE-MsgGUID: b8thOQloS4a//7gRPVCJ6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58498773"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58498773"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 04:26:57 -0700
X-CSE-ConnectionGUID: u6H/LjjXQwuEsbgI7RmJ3g==
X-CSE-MsgGUID: +sIUruHTQVWSHuRhYyrBMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170894629"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 04:26:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 04:26:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 04:26:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 04:26:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XczY4yiCmQg9nKNa9Q7aUU+rOiZPJHlmmZPQoNYHjBdovFTJ8MIU8q6GrcGA2XyOiCeqd0dvvnHGERJwCTUJSUf3OKut6DamM3r1/zvhFOdsIHj5SqRuPpwzvVcD2ySvIrJHveVjZ/SSv1Zv96qseR2j2sc9A0SBTSg4wmJ/mU+7eGYcl6vq0rop4zNKoi+3i1eTm3peEOCDQRa6ptoSkFTwZ1HZgQLR2RaUPLvn9Sai3LWcuOAwFdGxhmH74vn5waYSM8iUZDc8PjSZ0T0B7+W70HBVrTwPk9+cxKYGCEhgd+yaVddRC++0+SDeW1eXrpkVYPZpif6g2dVlcue5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhyD/f/NVJCj1kTXhBEtMc1N1/fZmkSVAdfaKTT7R54=;
 b=Gh2exJ70NJNQsZgBk5WNblH4XPFYgU/tNnT8JeQr8f6lP74+9ofFqz1rbHN0nwN9uOfcUe9eHbxnfNfs0U1UhqKvDcsDAjS+JQrmhRGz1OO5IKJak3B1xOsIXKo1jXog4STcD2eQm2rYtsWRzC5atP2jz8TZodkhT1aeWeDxMm3msyxNAJi74qIKksVXML2a+9CXAnZSXjix+AkS27pJzfIxpwMOFLQkqnnZ9gT6S4l7L4LFsKZUV7W6xtsz5Ghio4nI4o9TtHH7bxRyU733PBM2fe3lNkqg3TT3d96Lcx+ZdbzBpbbSxDTy82l+3CBoZRXX1phTQq1pEs74hpCQPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH0PR11MB8166.namprd11.prod.outlook.com (2603:10b6:610:182::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 11:26:50 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 11:26:50 +0000
Date: Thu, 28 Aug 2025 13:26:43 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <michal.mrozek@intel.com>
Subject: Re: [PATCH 04/11] drm/xe: Implement xe_pagefault_handler
Message-ID: <aLA88yLhaBk4acE8@fdugast-desk>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250806062242.1090416-5-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR09CA0170.eurprd09.prod.outlook.com
 (2603:10a6:800:120::24) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH0PR11MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a17d1eb-204f-412c-80e8-08dde625c83c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YwfimJSpk2fj9r+60SwUl3lLyON52cun58Taa5VBNXB7OWsA2VItR+X1v9?=
 =?iso-8859-1?Q?9xICqI5jaAxVWHsj3XxG40QaSy7LJWQ2vD+UusCqRH2H9Z2cJWrV6+Tk64?=
 =?iso-8859-1?Q?XvrNr1aFX8zPfw0K53IXGfiyIJDElKozGy6C5pD7gXQjanpKN2IuFLYsr9?=
 =?iso-8859-1?Q?8pnC/xL5D+L9ogqfkEaq0E1sTzpBR28wAxy8H0YLt/HiH486AfOMk/ESTD?=
 =?iso-8859-1?Q?bkiiAXgoNpKxalwYsBVPe2ms1uvhRwSHAgG97s9ElRzRqqYsSyC1K3am4o?=
 =?iso-8859-1?Q?1GXZdX5yUNvAYGvAePeb5s/raWbAGuSa/5NBCWAvrrxXw1MRAStTlDkJdl?=
 =?iso-8859-1?Q?FqRGHdxHycyxfI5/AjPIN9lZnKF3YLVggLI487togvtQmv9UrrWas81DY4?=
 =?iso-8859-1?Q?NJcwMXfBUATUMS7CXFXXjk6tvH/xfFg8/ApmPXrEka+mWA85DF4YC9kkeC?=
 =?iso-8859-1?Q?jxJqhITTi/Ul3HaSW9KumKcloSpMSLXYETvtCwW5bjE/oYOC8OKVFGjpYz?=
 =?iso-8859-1?Q?CJ1WBjHUZfcr6SByoz9EWm9JysMeW7htKKOTx3CQFohu8SRM681OTA6T+0?=
 =?iso-8859-1?Q?GFWhEDHayzyZ3DeyZtfucauBhv2YtFLtXzBU3KFdQaTnBD13OkZ6gR+aqT?=
 =?iso-8859-1?Q?O9TTVWpzmPYPi2yumTEATsuCsMRaeeRBkiBrPGBlKg5wKNUQ18fUhpYok0?=
 =?iso-8859-1?Q?t/+PzIl94fb6yt8AIaAcvNBO8AKsywwm5mhVEFFloliBpp4RRlE/KC4Fwh?=
 =?iso-8859-1?Q?xO7fkYLUOdICIag9ZQNv4HHPn0+OuWdzg6zw/PkM2+sTaXWNWJogkjPsfE?=
 =?iso-8859-1?Q?hYRV2rDDAivqKeGuUTOYWtFpIf5D6VwVfiBJWF49TLJ+ZDvSaIUVRGfK5c?=
 =?iso-8859-1?Q?JZvoYATKpFRR602O/PvLFXeLycCUXAA7+R5DRyGxGSMs+vEpcnW7Y/s5pH?=
 =?iso-8859-1?Q?H19DPJKihxdJ5ycT+mm+H/eygiMmDotQmYxFSvZjh1eTNYFVRH6Rg0KGye?=
 =?iso-8859-1?Q?GDOGxUXinIsDwQmTBOu5cpSwoGpN4FN+iGojp+Ry99H4OYRzsgsuAk5m50?=
 =?iso-8859-1?Q?8yRoqNf2+vZUb1iH97vQhfBEyIKOfHDHGBAhIvjwJVkPXD24SZGy74Bu13?=
 =?iso-8859-1?Q?38lRRocYuiKRHcZbtc5BV2lrs3febnfypsxkhzw/EXpl6gsQbfgrvBiXyw?=
 =?iso-8859-1?Q?n5J9zDWT2orQxULl+jL1zKyJlNEjUO8BYtFRhbXbt5gkHQzDKCiH829u3s?=
 =?iso-8859-1?Q?5dP6gqjoCwooQdoxvOmowUx8HSCznn5FrhuwiKYwnBTuEtciYrmqMAmfov?=
 =?iso-8859-1?Q?DzKMkvAtUuHa9hI6LTpVFihNYaXboTO7WN0B2fFyTXCVo3q4pA5GGgR39+?=
 =?iso-8859-1?Q?GD4sUI/NGwXaqb1m4xuELrOGZniuV+ChipYef30ltOpsQegUZ7RPglMpkZ?=
 =?iso-8859-1?Q?iLvd310HUxChXuYCzK99jUyl7zSedSsrsRCkOixkpzzqOBauthy3NJcTH1?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PnbtnSS6lFgZSJcd9BQlEmnNF4/DNpZ4PTfzU8Q0Nfrb26I1Px9hC3Onup?=
 =?iso-8859-1?Q?AYr5EJw5jpHKft9iwJclhvm+6LnVsJ/M5IbqjwlaLGVQUblwd5RekQbdbT?=
 =?iso-8859-1?Q?IAodA7dtOM+n7uTOD7gOf9aAVzwyruTgeJi7xYp7ILsd8upMRv9TIvsMU4?=
 =?iso-8859-1?Q?AbHhI2K34h4tahbRtyPDOxFHd/f7vSctsLqokLzAbmKHBLYO5ifVNZrrfE?=
 =?iso-8859-1?Q?LYAAmQx3wuwjPRykVdbyH/vX6KwFEyZxPQsYOr1RXa0EUwwnc9cLqBsyMb?=
 =?iso-8859-1?Q?vcRaT4PjObuVV4CleCOUHxkV9rFTmqcDGacTvCxgh69ibhrZ+lP969VbPw?=
 =?iso-8859-1?Q?w0TZO4tAtWtNuKZR/KfaqqT4GEiB0/5NNwmKInUoXLlKMIMfwyWkN2CEqX?=
 =?iso-8859-1?Q?Zg5INLD/+jeGApnv95IY/SpCoe5vkatn4etDeBnT9gv4b1fOIuVmWTZFAq?=
 =?iso-8859-1?Q?alZm1wYKD6iFyrD2SSLklXb0TwOYL39KdcxDNNp41TyseLWfh28eBWU+l0?=
 =?iso-8859-1?Q?k0AUPHxvxRJpyhFpGcbc0pLklFOMKR5lPKQzTyBHocWpZIiylEbEHFDzMp?=
 =?iso-8859-1?Q?2FtzSajh/ycs2UfAf/CnyNTsjX7ul3BrxqYVc+rMvM53UtNLFByQZjxntw?=
 =?iso-8859-1?Q?nXAhxZFSNM4g3An5nGKNXjJBMBFXYZE6F5I552rZB3fQR+SroEqcNHwUHC?=
 =?iso-8859-1?Q?WT0Xyx8v9FmKb8C57+8JHSqQtdfzEC4yqapIOdWmDvMa6dLpGAXPvlyIJv?=
 =?iso-8859-1?Q?Jprz9JP25Rwo018uhnAEi8ac6DxApV47hz7SIgPvzG7hjJA53zfA7yUFg5?=
 =?iso-8859-1?Q?7Zb3IR+CDO04eM0Ll+dYZwq/hx9YHnmvLWJC1h/8ofALih3EmfL7XPotsL?=
 =?iso-8859-1?Q?GNaC+q3oykNrhwPZ/MEY/DKrXfYkIZTk0CmIFySismkCvMCA/RSIQrJBxt?=
 =?iso-8859-1?Q?xNCoO19ZdbXkQs9WEf94hdSAGSRQTVkGuC6qhPspap2qrhIiLN3exH7XAS?=
 =?iso-8859-1?Q?rZHmsyZWdPbNvDa5q4W1PCla+mFmdl9bu6HQHDjdFU3oA87TlDlY4VXdlk?=
 =?iso-8859-1?Q?11awjl/DXXdbq3Hqcvg6hmDQigiZv57OGXoBj3WFDtOkY3s3/CAztEfsL/?=
 =?iso-8859-1?Q?GQEa1JxuBp0dE045MAk5crVftcJ5K41kWNB2VqRTQV48tF6OqaUmzo1vYT?=
 =?iso-8859-1?Q?T17KxrDKqng3iw6VWJOj6lVHD2KIWcSgzyXq1Vb2NR6iTYPa/tPcfWsJbV?=
 =?iso-8859-1?Q?vdFuBJyyO+/q6pmPHZbxqTEpsDpNigp1EX1kB1jt+VjBZRSN79E6DLdKJE?=
 =?iso-8859-1?Q?UZvSokDy1+5WoHubsIs9sz3OkLcPgUlZ93iQcgrIemhSKUdfQ+WlTR6EpT?=
 =?iso-8859-1?Q?iiENgRdhV2P/9bRLl2ZIrv2rJ81zsCXh8pO0p8npZH+dLeQvTDrL+6jSDQ?=
 =?iso-8859-1?Q?gKAUJtYiKih30X7yKnLqDzZJXd/fpgVR66FYnZ4EjZBzlrcyIjx1/bt+j8?=
 =?iso-8859-1?Q?L2SNrJMjv6MBr7NUGIPMoebcsAhwA8fy9J4iPJovzW6zdQVca/kGSBxlRB?=
 =?iso-8859-1?Q?gK2tJCkYXk9e/IW9DKOUih9Gej976uNuniyhVzzxP9Fmsl37hPIvg8rCAp?=
 =?iso-8859-1?Q?/pIkMF5X6wlwY3hjbshaXzoovcvsVIKvqSMI3MmNaNikv5XbHQNGQ+GQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a17d1eb-204f-412c-80e8-08dde625c83c
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 11:26:50.5944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aL8u3oCM0+ZkALuYWyh67Cpp9VByiDbg8Ri6oy3Fu3OTiWV/ffGhnWQTTWdjTp6WqU3Q9Bg8qI6ftAF3JZeUQ+jTs0uwJX/4a+27gZmUloI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8166
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

On Tue, Aug 05, 2025 at 11:22:35PM -0700, Matthew Brost wrote:
> Enqueue (copy) the input struct xe_pagefault into a queue (i.e., into a
> memory buffer) and schedule a worker to service it.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 32 +++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index aef389e51612..98be3203a9df 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <linux/circ_buf.h>
> +
>  #include <drm/drm_managed.h>
>  
>  #include "xe_device.h"
> @@ -156,6 +158,14 @@ void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
>  		xe_pagefault_queue_reset(xe, gt, xe->usm.pf_queue + i);
>  }
>  
> +static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
> +{
> +	lockdep_assert_held(&pf_queue->lock);
> +
> +	return CIRC_SPACE(pf_queue->head, pf_queue->tail, pf_queue->size) <=
> +		xe_pagefault_entry_size();
> +}
> +
>  /**
>   * xe_pagefault_handler() - Page fault handler
>   * @xe: xe device instance
> @@ -168,6 +178,24 @@ void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
>   */
>  int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>  {
> -	/* TODO - implement */
> -	return 0;
> +	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue +
> +		(pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
> +	unsigned long flags;
> +	bool full;
> +
> +	spin_lock_irqsave(&pf_queue->lock, flags);
> +	full = xe_pagefault_queue_full(pf_queue);
> +	if (!full) {
> +		memcpy(pf_queue->data + pf_queue->head, pf, sizeof(*pf));
> +		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
> +			pf_queue->size;
> +		queue_work(xe->usm.pf_wq, &pf_queue->worker);
> +	} else {
> +		drm_warn(&xe->drm,
> +			 "PageFault Queue (%d) full, shouldn't be possible\n",
> +			 pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
> +	}
> +	spin_unlock_irqrestore(&pf_queue->lock, flags);
> +
> +	return full ? -ENOSPC : 0;
>  }
> -- 
> 2.34.1
> 
