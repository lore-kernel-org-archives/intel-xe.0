Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7B8C61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 10:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB6310E7DF;
	Mon, 31 Aug 2026 10:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pz5umoPI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59C010E7C8
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 10:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788170788; x=1819706788;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HZUyJ7f97quJH7zGmaPYuCQc3JXwyKC/5mY6MHHikfU=;
 b=Pz5umoPIaKhudnkB7hfPPIfLDyUH+Dwn2Dik9dGa50uKf/3+230r4ExY
 7mIDYUdqyIsBp2t5bdhFGkn1dW1HdbWijwBWDk2KgJIO6OILk8MOqNOhk
 dIaGjv6DDn4QcCcYXKlwDCy/1ukn1/6DhpWwTCsymYbS0xAkmMLBxz6EH
 +PNNi7mSsohknE33RrQZLUWmqcvCJ4LXN+vfudaYg7epJ1QiI6Lt3WkVE
 7Uys+aQDgoe/0b/yxg229OeQoIwICAwX2mO7stPTHVjxIiRjM1phzVBBW
 bMZgJy+pqJEX79xTnj9Y8pglag8THc3C7SrWTqHwxkfHlE7H1RXVSflnH Q==;
X-CSE-ConnectionGUID: UvUr32f9TzaNTCfZ7X/6eQ==
X-CSE-MsgGUID: w6iNneo/Sx2hUiheW+c+9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106097397"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106097397"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 03:06:26 -0700
X-CSE-ConnectionGUID: EtAHKz35SreZg5f9q2bhoA==
X-CSE-MsgGUID: lrr7goxGR3CTgRF7Ac20uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="292259137"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 03:06:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 03:06:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 03:06:18 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 03:06:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0YeJePq72osEJJSJRX534DIyQATc9Lc2BRtCirWINKShFpmq7tR2tupeabmCwHJZfDqbyMcUQCpBHu7ebUfc9sE7j82grAPlk1Kdj6vwZQoF+FeVKDUwVG17xTur5L0jbW8VchglCHBx5IgTQ6lgqIe1cVRPFBmxenXCyi0YoUPD79sdBR+KYGOMjNtrqmyMwHjpZ0Jpa7yoAMsc2mUH2f2myv7sZ7t9n6f8NhnaE/aic+iq01E+F/2s6AfxcXo9IVvpa9R2YQYFdP1xpvZjaizwVsnwzPGhDpdiLCtLAzV/nqiMOIxRktyYg5/AwfWPrVphojdNLYeKXslVk8N6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkC2YT5K0TnR/kJhd7aJ7AkP9BpWV91n14FBWr5pQj8=;
 b=oKAseLPcUKDlqrOsvwo7e41G+yKqW67w8QvgqskbmZHkmcIQnB70YKI57e34GQKTpHoBFsZrWOjCSmiwNVpUnu6gJR+RWFrXTBtYf9/wxJkswelOy74xQVAdczQxKht7G14uNIgqUtxKh0XCNsT+VLk4gJTf22n/wTMQSt3KbEEhXg7wMsoddZ69Mf9vO0DcqWQAoO7IVwlK+F4QdsdrEGDNXaoJgtzQO0upXzPUq8t4nQ1hgTtgQOZz6IWOLpq19XaUTBvzfDZUQKXyTkZPYn2It+msEuvX6OsVBllJ+lyYArP92lC5dHUJduYSQcm36xbe5v0lVgAv7xMfm3J22Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW3PR11MB4521.namprd11.prod.outlook.com (2603:10b6:303:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 10:06:15 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 10:06:15 +0000
Message-ID: <602fcc3e-78bc-45e7-93ad-fa3f3ee43a1d@intel.com>
Date: Mon, 31 Aug 2026 12:06:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Retry GuC state reset until timeout
To: Lukasz Laguna <lukasz.laguna@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <satyanarayana.k.v.p@intel.com>
References: <20260831092118.488317-1-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260831092118.488317-1-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI5PEPF00000916.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::935) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW3PR11MB4521:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2c1727-b2e9-4141-ad82-08df07477e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5GKA12TrJuuwjh76rnWQSte3k4DI7mtsY6/1h2i/V0A5Hcer9yHAsGUevMmxDkN41xbvl8ci2aADzwCgJlJDr9aitQZS963w29vPQc1vSB4aZpBMdpjy+v818IyMj8aa/c27x94A9PC6m3teDkbIm0vx6wlVq+mEPjeVSRvvNTjEo3ZX3UJPch88RYYSe570wXAYdsXoMXOjpXFH5XvprJnCW+xnDrv2k80Z7eKWZx/P5HnVAZ3IngfL3jrolcn+OSfGiPtA3EGMOt3rHLGzFOJ+JvpZannjpujYNOVolxpmvT5bMgspM4wS+PkY1y1Xg3CjemQokZGQDOro3+qF5dquImrq8gYYS8Y0aJ/LH1km+Lk2Fn/DQuTSRua/G3VlyHLjVDNN6qvJYJbxYNW3FQh+YXhXXUrvhgREgXa+vbv4ihAxK5d5aMW1+04NBjTK0trTUibjR9T4Ca9dK8Oe/IHdYrX6z/ndJS6NP/Pg23jx2DEPX7PTucpPkfxjh8FUHiBKs6IuU5Gd3lz2qUTgJbGYg7Yh+fuHQuTTV4GZLeeFi5ftRp4TiivfFOf4ASKrx+GUZ4hz9vqvFpgcUFaGc/wYl4uNevoNoLQQo7HArt1anaBEmTRP3ZraK8MFGa/5vQJK8Hd800wW8Frl5mycSkotUhYewypWY2zNRemwtfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkcyRCtCdWVGRDhWdnRxNEtEOVVsejYxQnV0U25DWDZORmNJUVpTbDhsOU1P?=
 =?utf-8?B?Wnp3VFZDd29mQWlrQkp0V1JycW94R3hTUG5ZU2RQVXpuVktJRkxBQ0NVSitO?=
 =?utf-8?B?VFJlNEtEWjNUTEx5T3BYSzA3cUtKcllsbDhOcmFzeGFlZ3pMSXNRYXVNTU9S?=
 =?utf-8?B?alRybXJ6ejVFeFFjUENpaG1ZaVZNbmhIeXNqMnV1ajJ4SDBCWlhBQ1AxTFJY?=
 =?utf-8?B?Sm9qNWlGK3E0MURqSTVkRUNPeDZXQ0JHS2FTMVUzNFFBa2xJUTdqdjVCYkwy?=
 =?utf-8?B?eVpCdVZudjh1ZVNmNFhQWG9sandkNzBFMjFDY0hIbEpvQkJYckNoL2FVOFU4?=
 =?utf-8?B?NTY2dFRPcUs2ZC9EcDBtVzZKLy9wSDUrU3I0RVlvaE84aFZRbE1xQmZ5Zmpr?=
 =?utf-8?B?QUVXWUhQZWRoS2NHejIwaUx4N2R4c2NJajBnZUxtODJXY3NteHpiRk5jUzl3?=
 =?utf-8?B?QzJZdnhCZFZzaW5vdVE4VW1ObkdFUFlqbGdNbkQxL0ZwcHNsSVRvMTZsU2NY?=
 =?utf-8?B?MVBVUnpvY0JsZXNEcDdnd2wrVHFzTlZ2U2o4SXQ2N2hmN3NTUHNjQkVCWklR?=
 =?utf-8?B?SHNjaEZxa3MxUEFWci82Skhudys4OWpQcm9zc3ZMbkpzU3o3d0tYNnA3OTZG?=
 =?utf-8?B?LzNNVHhuZW1oWlJoSWJsMUhTNm9jaXhJR0V2bWphNXArSnNMSXNmcmNsL25U?=
 =?utf-8?B?Ym1tSk9xV3RwUkFTMDJ4TTFhOTIxWXMxYmloWlhoTGVwdlNDTG9idWZFQXlo?=
 =?utf-8?B?VjNCUUdpRW14SEE1SXNhL0RHZXVOTzlXVi9BSWp1eDBKRTFGejJORkpXZElR?=
 =?utf-8?B?U01hUlBIemZNNEk2YWFGV2ZURkxmamNKNzVUK0dIamtrczV3UW9rRHVzcEc5?=
 =?utf-8?B?K1pGd3hQS2Z6T1V3cnZIUDAvZWJDRlhvakRIYytHbGlTRnVXaGttdG1QM1pt?=
 =?utf-8?B?SEt2VDhkMTBOR24yZWN6dUU5OU1ReXVoTU9vbVBkV041S0Z5VFRuY3AzOXNq?=
 =?utf-8?B?Y1pHc2pXVHB1ckNrRSsySHBwVnZoaFo2cTVHMzExRFBMUFpxVUxBMEEzNCtW?=
 =?utf-8?B?dytsK0V2YVJRaklhc1hvcXhGanVCemdKWC9OcUlqSGhqNUp3SEFIWnRsem1M?=
 =?utf-8?B?bXdQRDhWZEVVaUQ3ZExqUUdDYUUwWFVmRDNHdWt0ejlqMkx3ODJpVEw0WnVm?=
 =?utf-8?B?S2Z2ZmFvbHp2d1FCRGVBSjNQNFFxSXc5WnpLaDB1dERFVy9nbkY1M2p0VFRJ?=
 =?utf-8?B?cUJuY2VEVHhYZTVONXZ6VWRiekZvU1BpNWtTamZ5VUlRcHJnc0xOV0ZZa003?=
 =?utf-8?B?a2JqVkVkbVNScHlick84WllTS3hEWEJjMGIwaGdUOHR1cElvKzZBSnltY2tB?=
 =?utf-8?B?MUV5MzY3c0ZnVGZ6Z0M4aGYzTTU4Y09tcWJ1RXViUVY0NXF2N2s2SjRaRUo4?=
 =?utf-8?B?aE9wZWJaNDFENVZPYlhWOGtSZHM4bis5N3NIR0piVkV3ejVTWTI5WW1CTmVO?=
 =?utf-8?B?RHJ4NXorMzZsNVp0a3RZcmJvQU4yMm9qQXpRYVRZdElkemFob01sZHhIQmJP?=
 =?utf-8?B?TWRXVWhZUXMzVGtaSEtRczJyaFBDVlRtZkcxQjltcnJHcy9neWhtZyttR1Zv?=
 =?utf-8?B?dUV4N0szcnN1cEZrc0NHdldEdHFSUE83TVk2RGFvOVJya3E0Z1phS0NhdUVZ?=
 =?utf-8?B?R09FVFdlVkNEQ29nWHVadytaeDBWZXB2ZEo4Ujh6UnVNZE91Q3dPTzRGQjEz?=
 =?utf-8?B?Wkh2NFVKaUVFOC9OUGE4NEhwYkhJQ0s1b1ZsSHVWSzJkVkdsK3pnemdWU1RN?=
 =?utf-8?B?SG1lZmZJVFVub0R6WFpwQ3NiZzI5M3V2OHd0Mm9aR3VNSW53R3hvUHBCVDlt?=
 =?utf-8?B?U3ZwSmdmZW9oaXJZK3dXMkQwYzRZVVVkallyYXM1Um1GNE1mWmtYOUY3Z1Q2?=
 =?utf-8?B?d3BQYVdCeUsydk1CZDNaNnBYalExM29kRmhsMmhhRGdiZVVoajVYQml2ZnJD?=
 =?utf-8?B?aXNsZ0tvQUpRbHJyTnZuT2hsQUk2RVRGQmFocnNrbERkVWVhY25ySmVhdGxQ?=
 =?utf-8?B?a1VjcHc2Zll3NThSQm9UUGFZT3JEZVI5VVYvWE1UUGdaL21jczZWSkRGdkky?=
 =?utf-8?B?ZkVBSVBqNFRlYldMTFNzTnVZTVZCYlhLWG5qc3UyaVl3azNiNzViNjFTREhR?=
 =?utf-8?B?VFdmUCtqMWhPY0tqdlFFL2Fvd3hqNStCY1J3QVd5Q21GUlRzbFh3dkwrSFA5?=
 =?utf-8?B?L093a3VmWHQ4Y0E3eEF5Njgyd2Q1NWtxd1FrQ0M4VytCK20rUUFOUGlUZ1M3?=
 =?utf-8?B?TnQ1RCtIN1lJNjRLemxWTHZjRFB0aU10MXhDdmFDWVB3M28rY05yYU9jaXBr?=
 =?utf-8?Q?u/d6IVGzW5lBwvGA=3D?=
X-Exchange-RoutingPolicyChecked: HXkzudLeyUMqmv9S7CiGaVuIyrlDrCrUnPu6zbWxQVzRoqKphEw7hbQ/4sTfktzbN2EkGk4ldwcTMl81F6wPOu/urWlqc3HVrudaA+US/Kn+HiVp4CsnepmeuVDTKj97cgM3hBKHQrhU+yl83RJl8NFrOzLgkh70ZxWe6g7dss6mxhyzPpybHJXt8FfS8Fv3bNebQ59i3DC3Oec9KQ8hBP6Sa0Gr/1au9R/b3vY1btJVj9tDVmqITOWYl77MbbcfkUdBAaHsOGBgJGABhPh6KTpMYWJ1c3d5k7ZUHNyEbSurtPM9mNhqCIhl17q4qTCyldKIuqEVbbltkD3YmLz7Dg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2c1727-b2e9-4141-ad82-08df07477e93
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 10:06:15.8632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+qY6s1MLlMP6yNS2vyD7I8PQTN95phGt/RswUPXeTYvMeKL/1mKxMvRS31zLlNKn0jZhhy56Ba51A8lhmdGMaw2FSBW8UzP/Ya6qiMScIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4521
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



On 8/31/2026 11:21 AM, Lukasz Laguna wrote:
> Instead of using a fixed number of GuC state reset retries, keep
> retrying until timeout with sleeps between attempts.

why?
why 10s?

you should describe the problem first

> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 37899fcf5b22..01873896f77b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -31,6 +31,7 @@
>  #include "xe_lrc.h"
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
> +#include "xe_sleep.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_vf.h"
>  #include "xe_sriov_vf_ccs.h"
> @@ -86,18 +87,23 @@ static int guc_action_vf_reset(struct xe_guc *guc)
>  	return ret > 0 ? -EPROTO : ret;
>  }
>  
> -#define GUC_RESET_VF_STATE_RETRY_MAX	10
> +#define GUC_RESET_VF_STATE_TIMEOUT_MS	10000

	10 * MSEC_PER_SEC /* 10s */

> +#define GUC_RESET_VF_STATE_SLEEP_MS	10
> +
>  static int vf_reset_guc_state(struct xe_gt *gt)
>  {
> -	unsigned int retry = GUC_RESET_VF_STATE_RETRY_MAX;
>  	struct xe_guc *guc = &gt->uc.guc;
> +	unsigned long jiffies_end;
>  	int err;
>  
> +	jiffies_end = jiffies + msecs_to_jiffies(GUC_RESET_VF_STATE_TIMEOUT_MS);
>  	do {
>  		err = guc_action_vf_reset(guc);
>  		if (!err || err != -ETIMEDOUT)
>  			break;
> -	} while (--retry);
> +
> +		xe_sleep_relaxed_ms(GUC_RESET_VF_STATE_SLEEP_MS);
> +	} while (time_before(jiffies, jiffies_end));

btw, maybe we can use poll_timeout_us() here?

>  
>  	if (unlikely(err))
>  		xe_gt_sriov_err(gt, "Failed to reset GuC state (%pe)\n", ERR_PTR(err));

