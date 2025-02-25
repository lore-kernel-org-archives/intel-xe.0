Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27E1C021BC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 15:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9E610E733;
	Tue, 25 Feb 2025 15:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XtzIfpSj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C83210E1CE
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740498441; x=1772034441;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U3jNc7qHw5FGe4SEmd3YXUIvkawWcnbeLmOHgSryYRc=;
 b=XtzIfpSjuMngFXU4jtVkJxIeJsm0xxMWWq6iOqszEE9+NwwB7+u2RSZg
 BQQ2s4HzaHx2ISCOMeQaAd6DRmIggdzU1amoB1egnUoO2HgDNC7QLrKXG
 89Qi0KcD+oxzbKyWxFx4mpwRKE1Erw+NIbOnPf/PmoNIhIbO+LV9QUptT
 WvwKmxuUVi1O9EiRywB5HdxkQ2VlB+s14FYOZpLbgV6qUruAnnJGAXmip
 AVH1xZwkqBN9WsD6lsbPACzoGN1jqYasyWIz8AZPTxv3xMW44KRWQDMyi
 4T+kOf3ebuKBgvBaNWSrvcxGOwbjgAgV41wK7Wu7xVtpB/TwN/+PqNkjS A==;
X-CSE-ConnectionGUID: PZ+DXoP9Q+mtIHQsf07dvA==
X-CSE-MsgGUID: C7C8A5p/Q0iY++iuA4arFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="63774700"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="63774700"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 07:47:19 -0800
X-CSE-ConnectionGUID: eAqHU6DZTtG7FE5xSqfUAA==
X-CSE-MsgGUID: j6x4Ug66TW2dusP+TOvYsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="121513518"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 07:47:20 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 07:47:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 07:47:20 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 07:47:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ec/u/LL9Dil67vtHGgrKw1rTGb+a/gnP5r5X2tT/Fub25Q+FNQ7GQSMeCGC7ZG/1HcSD+tTnN7Ew1RnY2lu05tLNvblAXhZMLPHyMSW0HIBnzn1akKJPySfMDkU1RCMIl7AOsQguO1XSnCkYgC9lo6vcBf3E1hFMqKjrH1e48Oz9TpYcW0tWxIjZvBW/FSNrrdAb8hLJmjSqH4ADzTMspKbz2e95JHtE0FnmB3H0d+Jj8VRSkrHOzVlvKWiLPvZfEZ+sg8NFELGY9Zj9fV9UkAhbgBiREVvKWmH7TZvam1tvIxNhLK+1mKtIMbnZxUiQ478EOF8doe6yyQvDVeAuRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fhpb/JjOBkRHomSLIykHXJ/xVThoPAvuUKAEKA9exM=;
 b=RW0sYAcyvxxmn5RceVHgxvKzJoLuZvCE62gisKbfun/d1ffG5dVcIDTk7v4FI/5MOB/6c8rhsOFMBjoRhhGOi9TClALipSRdqT2N0Ee4jknX3Z/J2ttJTm3E147k+gvyx3MEKXFs8TBaw2z94+S8jZF1X8MU378X7ek0oOg5C/zkf5mUmNDezMATpfMZ8O3IcKlVx8/2A/V4XJlQlw7W2kO66BY8Iaj8E/l9D8lX9+M6vTrmDdsGJ/ncdRowF2BPdbEM3i/2obh1QOWCoQsf8hi6CIWJmP4Fahxx6xHWTKsllDSkUK/JVJi2L+Nd7tSSfQwkbbd2M1aTJv8Ib8yQXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB8044.namprd11.prod.outlook.com (2603:10b6:806:2ef::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 15:46:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 15:46:37 +0000
Date: Tue, 25 Feb 2025 09:46:34 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/gt_stats: Detect and log overflow
Message-ID: <jjufxv3tfsgngg2vvlqomfr4rw7q6k2f4kprzuxuohknf4rsay@o3degl3kggej>
References: <20250225131753.1170520-1-francois.dugast@intel.com>
 <20250225131753.1170520-2-francois.dugast@intel.com>
 <u2rjimcjpdknreojf22kyb3s6j4b7h6ki2zr6455nxgqxj4xzn@jpb6jxsp3chy>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <u2rjimcjpdknreojf22kyb3s6j4b7h6ki2zr6455nxgqxj4xzn@jpb6jxsp3chy>
X-ClientProxiedBy: MW4PR03CA0203.namprd03.prod.outlook.com
 (2603:10b6:303:b8::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB8044:EE_
X-MS-Office365-Filtering-Correlation-Id: 59978c67-7355-49f2-da10-08dd55b39671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3oBoyTAzpft3POtU34f1EzwLQLkpkHD+CsAeIEysodu6Yc6jKS658IU1iltB?=
 =?us-ascii?Q?r2hHmJUxbgXqoWJlmPqrBTSERNFlys11Gq9afYNLu9FhmUDh0XI6H6xf75v7?=
 =?us-ascii?Q?H7CfliwaJmvlQlG0GPI7t5/xZI3gcFPrD3kCyhMnQ33Ahpiy0lpZQpV31emb?=
 =?us-ascii?Q?a1mUhnalCbvN3ecqaDkLZhpwjYrCiUoO5/QRhCQDCuxP1yxyrGEc747IB2HN?=
 =?us-ascii?Q?mL1QYHcXtXWoEp9XPZkel9AfyX4fMibiUCjlOwfbbrKqMu6ND/wXeGn6yVw2?=
 =?us-ascii?Q?EFPKJCACdM8fgnSLWQDHMSXLZOhvtsaP8sl0MA3HPhUPSP8nOn+xep0ByLUi?=
 =?us-ascii?Q?fF0IbqC7eCrnCsp4FtMsX0ZVq+ZZhrHmJbyFqd0nMZ6Zoj5EgdZvWvGqxCDL?=
 =?us-ascii?Q?G5qGLty0AOmdQdQrl7IV1WXvugv9QMWEr0/71O0Wp4Z9vE1wzF8rfDWKdS+B?=
 =?us-ascii?Q?66KkBdTCweanQdHqCYrwwjxSR1eAkdJMrF67czBtRAAtipSzA3q7wgaXViPG?=
 =?us-ascii?Q?GLGKHCBKtc1aER661pUCRIoz8/gIOq280iXeJtfeT6C24R9JGLhyJ3TdzL/w?=
 =?us-ascii?Q?bz39gos1lPX1muGHknc7qEsQPxUhGYj+WvuM0Ge8VDB86TkveCbANDtLWoyL?=
 =?us-ascii?Q?SxmikI5+1Qe2RAgoS6f3XzVzNtzEQN6p9LeMS2EB8MdrdRQRv6+M394em0jk?=
 =?us-ascii?Q?RH1BUKb/tHkRJgzJuQmrGX941srjVduhfc8NSKSgw/DbGx4QRGcGuuJpkqg5?=
 =?us-ascii?Q?TBzF7J4sGtjaXRZEoX6Rj8I91/n8DVIeyGdt6ham54f5jHasU/Ksrna3fp3u?=
 =?us-ascii?Q?b2AKKuHGhTn+NcOiiv31TC31P0wqKEMX3F+AznJto3C5d2K8vV8ruc8Rddrd?=
 =?us-ascii?Q?8OCaa4TGead94q+bUcwHRauKzdq9cgK2bdDPuiBBy/tAR+jgT9DE8KnMHWVJ?=
 =?us-ascii?Q?7GaUqEksnSqG/SGVGUdSgr1vgdP1cNfgN5cqM1YsmJir4yzT26Ty/GAo5Mvu?=
 =?us-ascii?Q?L5X9+0of/1MlhtnOdgw3QlSa/myxNCyYTAXEEANLBSRBLIjf1EpU1Gn45FrV?=
 =?us-ascii?Q?hor2+axgm9RYEU8/tTjqGBTSgGBc3fqaGJogSFmuD+5/3WuuFLsIFe17wdcl?=
 =?us-ascii?Q?xJr45KoT8ZF/nI1qkrprn90/0wMmcc6q4doLHFsfqjCho2YYXlp8WVpSspyj?=
 =?us-ascii?Q?g+rSldE+J0KBOBYJp9mX9ZLkGtgVsQ23LlhHBRlASfHPD1erF2kpBEp8aYEX?=
 =?us-ascii?Q?UkjY6GxfdjgVC7APElJAn9j3KbRBOLtTSItEj2isDeqD52puMhttd5UTAFOb?=
 =?us-ascii?Q?QeyxuXoZ5PidtEO9KM3vi9sYu5soYr/51rJCktLbDgn2lvZm05nWfrCrYo7y?=
 =?us-ascii?Q?pypZoq1yR2midqSqL/XDRO4M/Mzw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MVuHlAzIyLjL6wSzYgQ8ekmG9vpb1Dvuy/TldSOhJhDVb44zxNLCUe3hp1F7?=
 =?us-ascii?Q?QdA8Xgpkcp8DPAoa/2n/23uirgspm6Rd+cvGwn39s2cXlEXpynyMx4isW2KK?=
 =?us-ascii?Q?un5B53dGEgncGKbXzXN3Vd9fx3dGOdHUszrx4mjpLCZtWAnPRmyFgW6bFvkd?=
 =?us-ascii?Q?qj2z9f2ltpUNGGDdJUtajZb8QNZzfmBMz4lNDk4mx5gRf+P8QRammhLRIH9M?=
 =?us-ascii?Q?7ZN8FyDMUZhYYudVcLSRzrvZXW7rk8799spHVPrjLkZ3TWQsajF+6vP6UA17?=
 =?us-ascii?Q?+ejGpS40cBHpRwC9NknX2VU8C2hTOBeUJQ58uCnhaQTEa80NBK2teCLniQ85?=
 =?us-ascii?Q?pYZpWdflLQdezGIu/cnoeTiaWziB0XT31AOp44lUPvri7lnNGR5lLU6LmOiC?=
 =?us-ascii?Q?O+kHGhQg4mMB8DowJG4BRVbBtGrTbnfjIG/0CxocBh4UfM/b9GZfOOZ+rJs/?=
 =?us-ascii?Q?Qbn698JjwqtmJh/1ejie4PYvzz7CZoJUNK5Zb4RSs94Dicsq8VArFh45EhZC?=
 =?us-ascii?Q?jp7kUv2a1dSr1w4zlqiNDwxHv/4ImX+Edz14rEaUYjIJGszB8DZsReKEg1qM?=
 =?us-ascii?Q?/tyRGs6gUllTrXXvjNAKVjytHGEvRL3fdLqKFNfn/b0tTxYUAnQbUGuDLj6A?=
 =?us-ascii?Q?LUQXxIR76bZyoH3ATAYbMjlsYEO2m8TdLyC5XyqyBWaVajYGz9DarxzLDYJj?=
 =?us-ascii?Q?F+0mXHQlQwDZBb9SZ5l2+5okPczP/lsaq2Gw1jtmNveLcWoiT3vGzLxwHUXG?=
 =?us-ascii?Q?RAZvOjGf7OC6L04ybsCCaSu0Ji0ey3JCWx9WOiaMjwKQbTYb/Mfwvry4ZFRl?=
 =?us-ascii?Q?ALsZdjF54I/2jPNN/xSdc78fBlpsGPGYXmp8q5blRgznpNxRNbPPaMjitxpg?=
 =?us-ascii?Q?yv7Zxy1XwNtP6iOhKv8OyPy/l164HO/R6dDeD7fgQTXX1FpmwLaaMHhHNBHh?=
 =?us-ascii?Q?3uG9Y9Q0bwCFPE4tAj7KIx+2dtDrA8zr/j8jMCJMSeHP4jw82KNSqi7T6ADt?=
 =?us-ascii?Q?Jg9oelDiwEGgxgiNrH12LS5v81rWSYyP8180sfOpKxJIqu6DAZbVbLokEfmu?=
 =?us-ascii?Q?Is+W9ToB16FCF3baAs+cXMUUMofkq6a2r2hJ3s9v1ueM1YwyrcuzdBplOx0e?=
 =?us-ascii?Q?+R7GbullCnsDY8SwDD1HYEE7Svt8OBQwLGjiKYR7dmN9LktHZ/gJILSkQ7Cu?=
 =?us-ascii?Q?lCuFHfESkFZpzildzWwEZTGbz2j9tWDaMSwOn8KImqHPIADVQz6db62mvbjY?=
 =?us-ascii?Q?5in6Vv1c5Q6R9lHrdQlRWks+dCYHtWFpEcfCuL+tqyQu/78Qb8kKkGRxfzVP?=
 =?us-ascii?Q?PB0bbdm90L7ZUAz/cFguY4f4s6OpyzET/e7ur5z1WJn+KV0xKB5gzupFIyUK?=
 =?us-ascii?Q?KYrBWs7pZOqP88MFr2xLzBCE66ysvIKzuktTIPt1+ZuCwluGdTkeAj0b1zg/?=
 =?us-ascii?Q?xW+Og2Akhhfnw9cEVPKfP69mHO6G1tsfZBdXEX+1/k0MlAFu68J8A+JoSMri?=
 =?us-ascii?Q?4btUmcA1uWey7hUIWxmhhYuFgRzIVjzjstxRWUffccMbrJ/NI25MTjOgM3FT?=
 =?us-ascii?Q?K9cQemZd+20E6h5GWvwA2XHLHV2BWLIFt/zUqAyyUH2AXxUmuN6bPXAkixq3?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59978c67-7355-49f2-da10-08dd55b39671
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 15:46:36.9971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eU+7P/DomDUj+ZUh6gUMHc2GZBROjJAmwHFzEHRKVg2rHYYIa7o18Zo1CMqd28VfdbysLtJCpPXxCr9zmbiTLFpjyvsrEgHQ6CGhAKxGKhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8044
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

On Tue, Feb 25, 2025 at 09:41:15AM -0600, Lucas De Marchi wrote:
>On Tue, Feb 25, 2025 at 02:17:04PM +0100, Francois Dugast wrote:
>>Check if the atomic counter limit has been reached and if that is the
>>case, set the counter value to the new increment to prevent keeping
>>a garbage value, and notify it in the kernel log as below:
>>
>>   [drm:xe_gt_stats_incr [xe]] GT0: stats vma_pagefault_bytes overflow, resetting
>>
>>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_gt_stats.c | 18 ++++++++++++------
>>1 file changed, 12 insertions(+), 6 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
>>index 2e9879ea4674..753c081b68a6 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_stats.c
>>+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
>>@@ -8,8 +8,15 @@
>>#include <drm/drm_print.h>
>>
>>#include "xe_gt.h"
>>+#include "xe_gt_printk.h"
>>#include "xe_gt_stats.h"
>>
>>+static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>>+	"tlb_inval_count",
>>+	"vma_pagefault_count",
>>+	"vma_pagefault_bytes",
>>+};
>>+
>>/**
>> * xe_gt_stats_incr - Increments the specified stats counter
>> * @gt: GT structure
>>@@ -24,13 +31,12 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
>>		return;
>>
>>	atomic_add(incr, &gt->stats.counters[id]);
>>-}
>>
>>-static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>>-	"tlb_inval_count",
>>-	"vma_pagefault_count",
>>-	"vma_pagefault_bytes",
>>-};
>>+	if (atomic_read(&gt->stats.counters[id]) < 0) {
>
>why are we not using unsigned logic? it stops being atomic when you
>update/read/set.

Also see "TYPES (signed vs unsigned)" in Documentation/atomic_t.txt
as I don't think what you did here really works.

Lucas De Marchi

>
>Lucas De Marchi
>
>>+		xe_gt_dbg(gt, "stats %s overflow, resetting\n", stat_description[id]);
>>+		atomic_set(&gt->stats.counters[id], incr);
>>+	}
>>+}
>>
>>/**
>> * xe_gt_stats_print_info - Print the GT stats
>>-- 
>>2.43.0
>>
