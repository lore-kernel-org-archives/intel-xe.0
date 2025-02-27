Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F52C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 21:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D4910E0AB;
	Thu, 27 Feb 2025 21:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCiN1dfR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD2410E0AB
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 21:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740691026; x=1772227026;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=epSQeLx7qTS+8/6DemUe2/Xyoff0oQGMRyBnlfew4Y4=;
 b=nCiN1dfRH5YhNOwGp79YagzoEAcmYgM1fmFM9dklCY1Qr/bsMXizP/py
 a6z2J6Ngvx5oGbXZorJdBkEFKRVxcFKj5CK2ym4AUPACp/GgJYb0KuKNt
 RZASWjQElFFG3aETf2IF38Z2HQIT6BOLkDMbrUzBEjay/IDsvvJ8aCf/B
 cld9Q6z0zGUQLEACdJTNR8Al601y4UoagqK+YpNCOIed3yv4+dO3Y7C73
 O5iz13My5hqOON/VApDMywfhZAv5F8LfBNe3cR6UhqouQ7L88n2/5lj+W
 Q5yhaIrusSyyDRxDlt67AX4FpGV27ehS44wZOpTIPDuCTpyNgaTl64WRg g==;
X-CSE-ConnectionGUID: cv7TspzHSQ6hrRjllP1jNA==
X-CSE-MsgGUID: X9gu3runSViFjOSq4BR8bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52998216"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="52998216"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 13:17:06 -0800
X-CSE-ConnectionGUID: hhMY2q8fR+enS3TfFPAJSg==
X-CSE-MsgGUID: /ZP69T8AR9ClxCBYuLR3og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121269626"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 13:16:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 13:16:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 13:16:51 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 13:16:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnuYnSBq05/CN0Wer6n+BoAEIWUV2SlkqjlOSTV3gQ5D1Pn6WVp4ws4obE0Wfk9Mx8RXKwE5w/wAkr3foIeREc8anOk9HyFtBtwpsXdMyI4ozXX4/z6oKk6YKd3+EU7jkv+p5b14kwQrwW7hinDSGgRIeMOTe10VGfq9IZUar4/S+HzaNmGy4virWp0PWvQDJxugVSUz+LIKwJb9BIOm16NuCedjUHYt53z6D91ZPffLs/4kJUYE0GBI4MLifS9cWDGYWpSJY4TkJy7acmADb/jyaork5ah62rgH9MeUFJFe/G1yb8x+CqxI0szzcgKibaHqkd7ts9toXQPEP4cL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zAMfXJrSdeSN1Xbu9mtiV9/bHr5javUc4iSqivXzEI=;
 b=uvsx+REflMzj9aEBimy1yd0YtVrLgSaKll6OFHxR1e9fOFJtboUDsmtUhFgtB8nfp35fvbyiLyDW0j1ZLs7QuNSnY3u3CzsZCLF6lR5W8aePGf09hMQlH7PhVQ05Iy0qVlz6MOCiR65GGlRR8R7D0RxDOW3GFyieiHzXgQDLUS38j6lw2yqovsNoQsxCXeLlBxrOrZrKY8uQi+k7tyN9LTicwNvKK22ZuyWfRYUhk8gjPKLgrgJ8ffRIKB9YC/gAh8rwHcNtii0g2Rj9iqhBxjpyB/Hy9Tfn8/MlqxuY4wK2qm7C9W+i7NkbsiDUvkw/kgpFsB9kg+e5ZZ5Jrqgo2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7298.namprd11.prod.outlook.com (2603:10b6:610:14c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 21:16:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 21:16:47 +0000
Date: Thu, 27 Feb 2025 15:16:45 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 4/5] drm/xe/xelp: L3 recommended hashing mask
Message-ID: <zbjyqwuiedgcxrxlc65vb5busqbwg3f4pqjwlgc23vw5q4rurf@rdr6g33q367s>
References: <20250227101304.46660-1-tvrtko.ursulin@igalia.com>
 <20250227101304.46660-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250227101304.46660-5-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR04CA0271.namprd04.prod.outlook.com
 (2603:10b6:303:89::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: c51e97e3-1ae2-4269-c6ed-08dd57740b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OUUwsOfIz0EF1qot2aqzlT/0q4XqkFPQtOkGMEsxqy50mUynZDvHAh5+EDkC?=
 =?us-ascii?Q?XsRDNN1ezbKoRmMOwx7l7vqu56KKM1uBckwRSKri2Qk5FiWkRHyajGsEFRUi?=
 =?us-ascii?Q?Q0GRvmBoB5KDMoFIfkL9DvXhfmZ+JxJEdOY5D1dGadVVHfK7dpDH63/ToZmC?=
 =?us-ascii?Q?olPGRJfTueMQfkrxiMKPTtW00q8P7uzGfvNddebC2gd7tWOHgTcXBcv4KIfY?=
 =?us-ascii?Q?+vqGFBb6/MbczxfMoVpYz+TL36hMgUpD4IxQKTN+g9BUx7LuadsaoNGtCZOE?=
 =?us-ascii?Q?JgV3YP82C4AwQQt3P/k7wUKClosm40/k6b7g1hMkuXzUaqcd6ncinFknlGLY?=
 =?us-ascii?Q?DqqmVCzOb035b/6kkj0JC7g8ExZw7OwNmjNsEsrUDLWi+V3jrl9XewIbxkRE?=
 =?us-ascii?Q?Wf9oeqXKwajJrZupSuBpPYI6cpJTXBQi9SZBcEbqJu4VdDt7AsfmIWoAd6zC?=
 =?us-ascii?Q?9jHtt6ns6GyvQcZauUdmoAeoQE8UYfYfTWzi2h+bOcO+Wf7EMIpMffvrHgUh?=
 =?us-ascii?Q?8bVq7d0abnoaXsbnrwuZqO5KeSzsaArLl+xZXQjUKNKm5Vm2uq8tBz9JTPlw?=
 =?us-ascii?Q?8HG+2bOujOEAu9XIlYI+52dWgTCHT/C4XEZYv/5mDmHx9CNdHnvjHo6uEnzj?=
 =?us-ascii?Q?GYG9/hsew2DIQc+eicxcD7nsX7zG4WuJQEl9SKNdA28fpxjgNBAJpxlulooH?=
 =?us-ascii?Q?Bt221+20g7pRydzjpJxksuBlNIpRwbyiMVVEuqHTq6yzci2gqt3dM6ixAi1L?=
 =?us-ascii?Q?ENu+JJs6HYry6AZdT/0TYbKt6bzJ+Y2KCjV5Zo3FmEX1l8eFRcsZCw4nZVHW?=
 =?us-ascii?Q?S1KJ3YkuTW7x6z0/yH0JLZMHC+jVg9B4aZBgrj3nCcJ+iJsylFxoLjTyHo8V?=
 =?us-ascii?Q?1ujzjQB/XPfOfZxxCiBPBHRbnwOBLvo5F9ukoaedwg+ZDw3DwbhUgcAghK+S?=
 =?us-ascii?Q?nwt8ENRBRh2vf1G64ApN7uzBJEeWNASO4nVsPFS+3umFbTL1mSROCuwyOVj1?=
 =?us-ascii?Q?nfZBYl/4uVtAcK5ZDcYoghJFVd6U8YpA/6x7RprFOm5T3a980Gof9fTrZeHR?=
 =?us-ascii?Q?h5nG1pIwTm2rT1gs9/sjuKts0KlXCtkrIIe+wBCSNJ3bk9wwjjt8lStTArzV?=
 =?us-ascii?Q?fuktrBUlvxFmiEWdnYoIpW5hqkEtmWH397Eqe4ktVw+wXFrZsJxqTSYt5Kgy?=
 =?us-ascii?Q?Dl+CnWWhDt84caAu9a0JehTa4ANzEj7csMEGv3yiS7LJM/DuZMVZjnRvxwyD?=
 =?us-ascii?Q?uxgyGOiZPRj/c9u4JzQ0KAAbFsvqSKtc6GHaKXr7Chc9qB/0mdNCTNE1pykw?=
 =?us-ascii?Q?U9VG2dMJC1RopwXULE5pYWIlApqzfcu11ApWEI/DC0VYqj4zobaMS2kYftMw?=
 =?us-ascii?Q?Nv4kKpr9NXkH2sRrljBMddhq1Mz/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3GODZ+JP7VBYZdOBdqJ8dwDiSE3HEw9syDLfBTw/AoeNddfJ5qymPf7KmPxG?=
 =?us-ascii?Q?JvdEHkyQdpFbT/dPt4EiCRoo9v6QIuOVZ2WBtEXXdpfpA1jaf3jVpV8vmGnL?=
 =?us-ascii?Q?gAt96HO3eTNFIYbm4yS0xHmRVrMPMgQcMu+oOdBW9U+Fq63x1aV7lRjmf53i?=
 =?us-ascii?Q?BSQQaPnhtSPFFp0LP6VTM1LhRfwQHS7rJBC78V1VY0WeM5Qk1H5O9t5ASVvW?=
 =?us-ascii?Q?DDDsmczmZw11froEBhv+30yjjnj8BDFVrYAOUjgQX297J1SlhipaZyasI8CF?=
 =?us-ascii?Q?YcEFM36cJR521UO7oyAygh1v2NdszcNPHDKU1A6urN4NvCut+yn9QH56igdd?=
 =?us-ascii?Q?eGb7pBCo/9RltMCtyHpDT/wIIaoGB2T9A+zMzN0/qVtURf/p9MAoVEHy9lvr?=
 =?us-ascii?Q?xXGBzX0N3NVHVXY88u0iFmOhIVsY4sBuP4hyOiihkSYQC65pHyjzlrrTs7qT?=
 =?us-ascii?Q?DPeVdugiL1sQFtWAbJeHq71Mi+61j0JqA0D2kJoYLJ0/nEzOmb0NDkhNsg0C?=
 =?us-ascii?Q?2HY3Sn2aGy9OTTuWqD2tHw702/KxTHlcXgsAU0RdTADAnsK4yj+Jn5ojGOoK?=
 =?us-ascii?Q?8aRC/BJknLQXELxKrQeBROk28duvmMpohGmHHSy0oALGy6gItTHMvgjoou78?=
 =?us-ascii?Q?keVe8Mfxi8A2PFB9pwfGIuyALvcyzXkThN5/LOhmpvOv++RZBXWHakgy89CJ?=
 =?us-ascii?Q?eHqHtFk/JKejRuzXN2uuekwjmrBb9y+iNcTudcH616owqL3BhdBhKMT1CSbD?=
 =?us-ascii?Q?aLtf8UxXMHnM99sJ6svGIs5a/9u2I7V99GcHmdSWQJA48yPU67+zl6Jz6m/8?=
 =?us-ascii?Q?zJA4Co4qP+AUTY2gF9mffgJyAuAbXJSp8k4yh7ffZS/fTwoSlaKSaW/S0jU+?=
 =?us-ascii?Q?pNbt/EDe6AE1YiMnJ7zaawAPgKlk+F65laV9TEm3zQ0VUAX/Aw+CCzfWTgNg?=
 =?us-ascii?Q?oXGK0rCYTtmQibPiukjSRagX5a72BXfmYif16K9ovK1bv2O8XMBcUQJLauKM?=
 =?us-ascii?Q?TwCEsZ4F4FpmbiTxi9wdEWWJtNvJbizfW1iJUiBxgARePWq030h/mWYwBmY0?=
 =?us-ascii?Q?QHKIWCy62Bn3LWCXy4OfmyCa6apyxe99BeO4jSJBmHspvJc6ATNOC6YKKKzC?=
 =?us-ascii?Q?NTGGqUaRBB1OuwpaG6R5op1d7B/fFG98zup9djWXPKcvqhSXnU/t1YH/PLQP?=
 =?us-ascii?Q?47NBL6xD0JyL3kZKnU7BCYchxjDSPxWIPbqb0MjFqTrs+l+DVNk5BOWEFLdc?=
 =?us-ascii?Q?QiqfCQyj+M7V3heFbPGcEF3aG7mj4PoQJtvpzY+4gJ8zNAOgR9Vjex3lU5Ep?=
 =?us-ascii?Q?yYXT0EqJgXlxYf4IxHhxZ3OOe/ohyQyI/WtHgk8SF5/SSdueMrxPv4HgCX5J?=
 =?us-ascii?Q?XZI0DVCvXIRE5JMnxT2x99pHDM8CY4EFMBsnG+yp9SpcZozScnWaaJmD3+Rs?=
 =?us-ascii?Q?+3ah61z7lllYZZHMPXiZ+gCdC4lSf8ssdHhPSVSAUpmfYNlYpwB9H0cL1EWJ?=
 =?us-ascii?Q?uAoJPaK04cwxBq6fZT657JsLsrWjmnwp/vlWkrfRXNhsZE0jVdbGDpC/GxmI?=
 =?us-ascii?Q?d4el1dma4uCiXzWmoOezftDDnMGsXvxnNmJn/H3ETZP9HTlC4utKVqd30bVw?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c51e97e3-1ae2-4269-c6ed-08dd57740b82
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 21:16:47.9411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9jboypikV2ifp2KYyExt+gtzNBCNtc0aOzA1RKV8+tDuEKwOUsRmI9qyD5rxT0VS+tBhwauIF0yHmIo1Gwsu1KbDM1KI/eeCG+e0urhyaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7298
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

On Thu, Feb 27, 2025 at 10:13:03AM +0000, Tvrtko Ursulin wrote:
>According to the i915 codebase xe missed to set the recommended
>performance tuning for L3 hashing which is applicable to all legacy XeLP
>platforms. Lets add it.
>
>v2:
> * Rename prefixes to XELP_.
> * Tweak version end point.
>
>v3:
> * Add bspec tag.
> * Tweak version range.
>
>v4:
> * Move from LRC to engine tunings list.
>
>Bspec: 31870
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>References: c46c5fb725be ("drm/i915/gen12: Apply recommended L3 hashing mask")
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 ++++-
> drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
> 2 files changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 282afd22b68b..da833a147c0c 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -365,10 +365,13 @@
> #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
> #define FORCEWAKE_GSC				XE_REG(0xa618)
>
>+/* L3 Cache Control */
>+#define XELP_GARBCNTL				XE_REG(0xb004)
>+#define   XELP_BUS_HASH_CTL_BIT_EXC		REG_BIT(7)
>+
> #define XEHPC_LNCFMISCCFGREG0			XE_REG_MCR(0xb01c, XE_REG_OPTION_MASKED)
> #define   XEHPC_OVRLSCCC			REG_BIT(0)
>
>-/* L3 Cache Control */
> #define LNCFCMOCS_REG_COUNT			32
> #define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
> #define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>index 3c78f3d71559..551c2f308e1c 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -88,6 +88,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
> };
>
> static const struct xe_rtp_entry_sr engine_tunings[] = {
>+	{ XE_RTP_NAME("Tuning: L3 Hashing Mask"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210),
>+		       FUNC(xe_rtp_match_first_render_or_compute)),
>+	  XE_RTP_ACTIONS(CLR(XELP_GARBCNTL, XELP_BUS_HASH_CTL_BIT_EXC))
>+	},
> 	{ XE_RTP_NAME("Tuning: Set Indirect State Override"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
> 		       ENGINE_CLASS(RENDER)),
>-- 
>2.48.0
>
