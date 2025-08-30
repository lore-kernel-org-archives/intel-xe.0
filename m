Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41123CA0EFF
	for <intel-xe@archiver.kernel.org>; Sat, 30 Aug 2025 05:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E139E10E053;
	Sat, 30 Aug 2025 05:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lh3BaWa/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F2410E053
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Aug 2025 05:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756530625; x=1788066625;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rnYbav2zkcYeujEFZ5VZV3hXn1SLkgeAMlBcLLnNRBA=;
 b=Lh3BaWa//GsvXPGt7Mjl4AZnWFh9GhrUw6gQmHur6EWR2cNfrjXFwUT9
 ct6VrFclzV/tNf/isPQ3ihGAaMQmt+fhiKs10KM9imc0cBlE/cBToUr5m
 yhttNhBHgxtOxSvJ/Grn81PKRbcXbMq3YLwk3DW7sgP5Qrse8Wim5HNAD
 TRXjpWEuiPFyZ9H6biemfkM2DkmfG6RZh9UVPuk7fKhjKRcDcoCIheyvd
 RGN4GVPpBRrxpIeorkWOKC5XAr5GbSJgu+hfy/8TtuTjxTkq5Qt2CRw0F
 ZGr0PG18pt0BQsmp1LwbNAvsAm8whwfWxewFQfL0SvJlfI/MBaOw/Ftpi w==;
X-CSE-ConnectionGUID: dQ73OLljTByUCr1J3z7HmA==
X-CSE-MsgGUID: EmbCUMnURQK4zqwb02DRMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="46385281"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="46385281"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 22:10:25 -0700
X-CSE-ConnectionGUID: XpFJAxpzTkeIFBkQxkbv5A==
X-CSE-MsgGUID: 3vnl2PAvTmiUE8cLOHrBZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="174907036"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 22:10:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 22:10:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 22:10:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.55)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 22:10:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntpw+c1yAt++P2MxpSSDL5kldF7xk03knBmS/EJn6iPrtwmJBIM2SmUsfYu5s6JVE0v6l/e++tZRoD9Wcp6+LX8mZaOhYufoPUNb/M0huh+tw4j43iamdCmzTmp+urXzmXdDdzHDdYD1Y7+2PWK6PlqqphQCsyHA9eTRY3/dRZ69qhRKa++UMDiYviYodl9TBdENchYkJfyuood1+Efa/TFI3ypkPHn1VWBYZZTMp2U0tclBksRVvb0xasjUu0fxPjEGfCFMXsPc5zOw9Xzxg38wTw9oUdL5TxMlOTDLt69mUoa9YOdUOJVhRjYnN8ToUEawi8zhGQTbsFSXq8my7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ro/oB2nyUa6BgdNGbpuoShgUORWi3bRWQCkMoIzspIw=;
 b=g1z36GywpJ9nLbEIaqVi/kEN9XyqmQs8oFT8aVDUTF1V8DLNiRTp44eBFegkt2PonRywFm89ZlUZjpPuUvgC6IBnkmQBdrbg1D3CHmciQOYj8/akeFB4fqRfFav//Q8GMec3YrlQFEJkle6HVewC8BgTq+TnT+pfjeeL9FsKx230eu818dimCY97PkVQNhEjv/9F+wJ0hae/fGmX9bcgdQ0sfMPq1XmrZbNyNjgQtaTPvLGFRUNZvpgm+z3EB52hpwiyTayEw1oEAZQFL49vnOVY/NUQm0uzdhJtLjq6/8MAL6YvS95RC5ARUNlkbW9Yl3T9PxIVpwDk/X8gAo77Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Sat, 30 Aug
 2025 05:10:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.021; Sat, 30 Aug 2025
 05:10:12 +0000
Date: Sat, 30 Aug 2025 00:10:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, "Vinay
 Belgaumkar" <vinay.belgaumkar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 3/4] drm/xe/guc: Refactor GuC load to use poll_timeout_us()
Message-ID: <ipf4dcxo66vgzybfuiougogrffhpkqu3tzudgq2ioydvrtvwvc@tyc54natvwur>
References: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
 <20250828-xe-iopoll-v1-3-9832ccd1c8b1@intel.com>
 <78533ae2-6c5e-4452-8357-07dda6decce8@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <78533ae2-6c5e-4452-8357-07dda6decce8@intel.com>
X-ClientProxiedBy: BY3PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 374503e0-7d76-4900-9a32-08dde7837f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kN3xrOcaWhqQ2H0/J3AgF8VQ1pWAQUSKGv4TwC0hKPijymOo5cDI8sNdeAGu?=
 =?us-ascii?Q?pBUs4JUn3ycVichSM6FfI6arXPy2vAevzS1UpQYxARalvvxXkUE/AFtMk17T?=
 =?us-ascii?Q?R6RhydsGEQjM6P/7mFwk2F2sMEGhF0F2SwFNOhKXBV4HfaPAOrxk/V95Ndoq?=
 =?us-ascii?Q?eWcfGxUw+meGAlc+thg3EFh8zSGIpIwac2RFnmwAxuyD+JaWH7JZuHuDm0Qv?=
 =?us-ascii?Q?yNz9D3UnH2ZRE3BnhHzubmM9MseB2rXK9LvPp/jDYJAspVR5MzDmsoE7VJEC?=
 =?us-ascii?Q?AGCDm6cC2FK7+nPOAJ7hkFyJWOhA4h6bcHJa7vYKHaCzxqsscKpgvb9FrpPf?=
 =?us-ascii?Q?CtaL0mx8QarsfENwePgAXKGdb+5kxASMSTQpFS4bHRr1nCoL+n5lKuRj1uA8?=
 =?us-ascii?Q?qAkIAU7nY4inKGcmCu1Nzcw7r0UhDVeSkqM0Af/L0PyMhiiqOeYrI7bZOKLJ?=
 =?us-ascii?Q?SCam4P+jtG5PwOgw7XcRODbelAyj3s03Wci8iDB38H6eUZSafy6wCk3j+f1C?=
 =?us-ascii?Q?Fx0Y9u94FBno+NMGxuyg9WIz+WK8wTw6OGdTfK8hrq/mAoMlN+sCAmfIZLS9?=
 =?us-ascii?Q?4ZYNTGE2EefiuzhayiNVUxOgMuJkbodXeHtAoGVJsQfIilERh1ZLykm6u28w?=
 =?us-ascii?Q?oxacD/1Je4kwxJ3MkLcuH5GXMjVyEFYwXc6CHdAiR/awrDGuAwatrrtOeX+F?=
 =?us-ascii?Q?b7I4iI6itItvVKkUfGNzqdv6wtZICVIMlGopoc5U1svuD5H3tCP3K1yC+BLM?=
 =?us-ascii?Q?l3Fu4kFxnXtThLNYRRrR11CmPEAl8Tai5ADQNQJ2WPZx4LQKPRBYIb3IhV5R?=
 =?us-ascii?Q?2DByReFtmmYdInw7ZKOxptvrjPF7pSuTCEoomJdfmm6W4sKfKlIHyIoDnMfa?=
 =?us-ascii?Q?39pIJTPLuSuYMLPD1UrImct7o+x25Ija643s6jARyeTuh1CsfAeBFk7UBT1m?=
 =?us-ascii?Q?RoMYQJCSX+dvXx4YEnmp9mnbfby8WRpo4+ZjnLvE7/cvkKlF8iF86VH8ZBjB?=
 =?us-ascii?Q?jxXQPdNz5fX05PLAiz7O4gHH6o+bb8+KNKijAEufVmLL+5OT3SrMdLsrWWDM?=
 =?us-ascii?Q?CXHCS3zTjBk42NzJXXZ5NSU2WX1b7eE3qG4E7Q0tFyrBlu0bTOxE6sUJhg3t?=
 =?us-ascii?Q?ZCBLhNF+6Ui5xErT+G+hTl9RpUM4yYV8bBeUDTEH0WCqJFbcf1XMDn+FkEEe?=
 =?us-ascii?Q?cy2Vwg+DiG3tRRSpvgOvUUI9PRhK12Yb4m1P1j4iD8zTh6C1bowr96+frEj8?=
 =?us-ascii?Q?qyGeZFZiVd4e5xUyQd0Nrk9wjP+mnk8/kGFzqJNt0EzSn+pR/bYkuxfbyFLn?=
 =?us-ascii?Q?ductEsqHjmFnJTofxTmMQpv/SVM2T0CWkOODXKp9nN7hsL+7oDUoqqAnCruJ?=
 =?us-ascii?Q?JcfvNkVxhWefzFPHHukBdQupf4QyWO6savyjXWRK/oqrZyipggXzCdClve3M?=
 =?us-ascii?Q?114OfMDoPXk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V/WgE79EKVDqVqdT5Jtoe6lcM42xO+QwVpllLjUZkUV0mkicpnWjiGPWxJwK?=
 =?us-ascii?Q?kYM/XGCzjXgiH/5I6Ejy8eKYfsul2eD6XJMF8QvIW7xFHLdSI2/tij/XEiXQ?=
 =?us-ascii?Q?JSzcbjFNwdYX8LgpNo9ZzKLLuvjh8/jUM23ussMr376jYRhMf67ndBY9YYkL?=
 =?us-ascii?Q?jYREh5G7QtthxXvNq62FJEe5Pdm7SiPPRiBHFPl0F6xni7GyVOKJcBAsjGEF?=
 =?us-ascii?Q?IUE3ZxaVHB3uU9JujhQp8FxUOWMIAEU0egtWqiVAiw5uaol+bc78PnhU0s4V?=
 =?us-ascii?Q?QZMgb4/+J933oFXdyX9x2jwmgIrB2W7BRCB5HmEZnAelakgnFiOtZqn6HY8W?=
 =?us-ascii?Q?XTgW4fETCaPLyUnSq/u6oiR1F1uAfxtDJm2qIVV0YKy9kZ/pbkYDQzaW9FVy?=
 =?us-ascii?Q?QznXtZwal9vri/Qs+Hzahp5OQY4sDk9ZnRbdV5Zuz64jdLQK0uoydxMTWdLd?=
 =?us-ascii?Q?Z8qnHbqQvu8QHMszs5uGjnghlZRj0f09ZmKvnrIayVUKpgCzy7I47vr9WN62?=
 =?us-ascii?Q?+6WqYiqjmTYHnIIJbLYSMZme/4+NxajrzCFRBTat9BEQeoHWJzypEKo5ppG0?=
 =?us-ascii?Q?GJmhdscapI9TzngIx2EczxsrCVb4G2+08BiMjtpIfjdQ0xYkBSHbAjOejEIZ?=
 =?us-ascii?Q?xPSKA5EitLTicrwX5rt9F7K2La5PNJdaT+z5MnHJsVS9hoeTkCPiUk0X6+0/?=
 =?us-ascii?Q?F2/Ox6kbrUEsbpwuPoC9ujyKluor2K9MsuXABCotknhH4X5s3HCAIkA1VipD?=
 =?us-ascii?Q?kiC4lPujP8Bna52rshB0Ph2Fj4OaMXN13vnnkmIN6xrt+slrJyqHV5JyNyIB?=
 =?us-ascii?Q?QDBuLJ5WTJq6t2mei2nu6wCVdavek6mRh71DPKIySJAPzS2CxPNxwaq6UcqY?=
 =?us-ascii?Q?54EntkcQouygs7leTUiNtH9Ifowo5UVRs0JGgeMDuA5sdKARehwZ1N/WSx8n?=
 =?us-ascii?Q?2XqrLY2iXunvP5wiNr+P73gGzmO8I5MH+e2ZuTj77phXMrS899c4K2Cq1ZRN?=
 =?us-ascii?Q?k18RGDg3H8ZYHVykaxXQ27tr6Ur4mxhvWLIMknNPZwtLDAXgg2KR6+5153N8?=
 =?us-ascii?Q?8zK6D0zQXsXTEbFlX6p30jvhyF60lv5CGoD8e3Muvct7UL2b2cUbn5bGciNm?=
 =?us-ascii?Q?f5rf7dVeIdW6vMtbHv62QKtx1r7S6vMJNKPJFKU45zI4E+mhirMnEk38zV6A?=
 =?us-ascii?Q?kZLSuuASobWsPFGzWM0pbXGxNL+kTXp1CUJhSHtAB3QVgAS+T4GYVRWsyGUt?=
 =?us-ascii?Q?b+kJeQ1or8+AlELmXg6eWSZQurKD1/yD2TQ5q3F3SAdkCEZdODtXx0JrQe5l?=
 =?us-ascii?Q?LoLQvY5C5YmVy8u7lJIWkxRMK86cYkU5Wls58iEDLsRM09cuIvxqDBP3sFmG?=
 =?us-ascii?Q?uPAU13AQuMdectQ9NAgXNmAl7nEfM7TqI9BsNccbmhzvINUda6JO4nmgAV/F?=
 =?us-ascii?Q?yRv3IJojI0y0C3hz9WPmjLS/OTmrCO7O7uuMQzFtIhGHDBkP8qQ32q/qY/uU?=
 =?us-ascii?Q?JFleNwIfeuOAT2L8FGPLxr3U/p5v+0XHbdaI24SA/s8pW/PvS2Fl0aztPgdF?=
 =?us-ascii?Q?Ixi/2a7B7d+D4PNTspE9wB4KLAOXsT7TTN+Uqi2h6DEVL3k4y2p4LKFQJw3t?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 374503e0-7d76-4900-9a32-08dde7837f28
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 05:10:11.9786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTI89SyGY9BUltefLwF5+KbRmb64KKeVlosTWF31wqSVFW6RI6WLig9DruQK5BEoRjrSq3CtrIQ74rC157Gn3n9DPzv9Z0dQi4dEa1LsHj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7133
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

On Fri, Aug 29, 2025 at 05:24:36PM -0700, John Harrison wrote:
>On 8/28/2025 3:04 PM, Lucas De Marchi wrote:
>>Currently there are 2 wait loops for loading GuC: one in
>>xe_mmio_wait32_not() and one guc_wait_ucode(). Now that there's a
>>generic poll_timeout_us(), refactor the code to use that and be more
>>readable.
>>
>>Main change in behavior is that there's no exponential wait anymore:
>>that is now replaced by a 10msec retry.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_guc.c | 269 ++++++++++++++++++++------------------------
>>  1 file changed, 125 insertions(+), 144 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>index 37d06c51180cb..130492405a982 100644
>>--- a/drivers/gpu/drm/xe/xe_guc.c
>>+++ b/drivers/gpu/drm/xe/xe_guc.c
>>@@ -5,6 +5,7 @@
>>  #include "xe_guc.h"
>>+#include <linux/iopoll.h>
>>  #include <drm/drm_managed.h>
>>  #include <generated/xe_wa_oob.h>
>>@@ -981,21 +982,103 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>>  	return 0;
>>  }
>>+static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>>+{
>>+	u32 freq;
>>+	int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
>>+
>>+	return ret ? ret : freq;
>>+}
>>+
>>  /*
>>- * Check a previously read GuC status register (GUC_STATUS) looking for
>>- * known terminal states (either completion or failure) of either the
>>- * microkernel status field or the boot ROM status field. Returns +1 for
>>- * successful completion, -1 for failure and 0 for any intermediate state.
>>+ * Wait for the GuC to start up.
>>+ *
>>+ * Measurements indicate this should take no more than 20ms (assuming the GT
>>+ * clock is at maximum frequency). However, thermal throttling and other issues
>>+ * can prevent the clock hitting max and thus making the load take significantly
>>+ * longer. Allow up to 3s as a safety marging in norma builds. For
>margin, normal
>
>>+ * CONFIG_DRM_XE_DEBUG allow up to 10s to account for slower execution, issues
>>+ * in PCODE, driver, fan, etc.
>>+ *
>>+ * Keep checking the GUC_STATUS every 10ms with a debug message every 100
>>+ * attempts as a "I'm slow, but alive" message.
>>+ *
>>+ * but emit a warning if greater than
>>+ * 200ms.
>Line wrapping is odd here!
>
>>+ *
>>+ * However, bugs anywhere from KMD to GuC to PCODE to fan failure in a CI farm
>>+ * can lead to even longer times. E.g. if the GT is clamped to minimum frequency
>>+ * then the load times can be in the seconds range. So the timeout is increased
>>+ * for debug builds to ensure that problems can be correctly analysed. For
>>+ * release builds, the timeout is kept short so that users don't wait forever to
>>+ * find out that there is a problem. In either case, if the load took longer
>>+ * than is reasonable even with some 'sensible' throttling, then flag a warning
>>+ * because something is not right.
>This paragraph is just a re-wording of the previous one. No need for 
>both. Although maybe combine rather than drop one because the former 
>has more detail while the latter has more explanation.

don't know what happened here. My intention was to indeed drop this as I
moved information to the paragraph before. Thanks for catching, I will
fix it for next rev.

Lucas De Marchi

>
>John.
>
>>   */
>>-static int guc_load_done(u32 status)
>>+
>>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>+#define GUC_LOAD_TIMEOUT_SEC	10
>>+#else
>>+#define GUC_LOAD_TIMEOUT_SEC	3
>>+#endif
>>+#define GUC_LOAD_TIME_WARN_MSEC	200
>>+
>>+static void print_bootrom_ukernel_err(struct xe_gt *gt, u32 bootrom, u32 ukernel)
>>  {
>>-	u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>>-	u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>>+	switch (bootrom) {
>>+	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>>+		xe_gt_err(gt, "invalid key requested, header = 0x%08X\n",
>>+			  xe_mmio_read32(&gt->mmio, GUC_HEADER_INFO));
>>+		break;
>>+	case XE_BOOTROM_STATUS_RSA_FAILED:
>>+		xe_gt_err(gt, "firmware signature verification failed\n");
>>+		break;
>>+	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>>+		xe_gt_err(gt, "firmware production part check failure\n");
>>+		break;
>>+	}
>>+
>>+	switch (ukernel) {
>>+	case XE_GUC_LOAD_STATUS_HWCONFIG_START:
>>+		xe_gt_err(gt, "still extracting hwconfig table.\n");
>>+		break;
>>+	case XE_GUC_LOAD_STATUS_EXCEPTION:
>>+		xe_gt_err(gt, "firmware exception. EIP: %#x\n",
>>+			  xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(13)));
>>+		break;
>>+	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>>+		xe_gt_err(gt, "illegal init/ADS data\n");
>>+		break;
>>+	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>>+		xe_gt_err(gt, "illegal register in save/restore workaround list\n");
>>+		break;
>>+	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
>>+		xe_gt_err(gt, "illegal workaround KLV data\n");
>>+		break;
>>+	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
>>+		xe_gt_err(gt, "illegal feature flag specified\n");
>>+		break;
>>+	}
>>+}
>>-	switch (uk_val) {
>>+/*
>>+ * Check GUC_STATUS looking for known terminal states (either completion or
>>+ * failure) of either the microkernel status field or the boot ROM status field.
>>+ *
>>+ * Returns 1 for successful completion, -1 for failure and 0 for any
>>+ * intermediate state.
>>+ */
>>+static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
>>+{
>>+	u32 ukernel, bootrom;
>>+
>>+	*status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
>>+	ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, *status);
>>+	bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, *status);
>>+
>>+	switch (ukernel) {
>>  	case XE_GUC_LOAD_STATUS_READY:
>>  		return 1;
>>-
>>  	case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>>  	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>>  	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>>@@ -1011,7 +1094,7 @@ static int guc_load_done(u32 status)
>>  		return -1;
>>  	}
>>-	switch (br_val) {
>>+	switch (bootrom) {
>>  	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>>  	case XE_BOOTROM_STATUS_RSA_FAILED:
>>  	case XE_BOOTROM_STATUS_PAVPC_FAILED:
>>@@ -1025,165 +1108,63 @@ static int guc_load_done(u32 status)
>>  		return -1;
>>  	}
>>-	return 0;
>>-}
>>+	if (++*tries >= 100) {
>>+		struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>>-static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>>-{
>>-	u32 freq;
>>-	int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
>>+		*tries = 0;
>>+		xe_gt_dbg(gt, "GuC load still in progress, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
>>+			  xe_guc_pc_get_act_freq(guc_pc),
>>+			  guc_pc_get_cur_freq(guc_pc),
>>+			  *status, ukernel, bootrom);
>>+	}
>>-	return ret ? ret : freq;
>>+	return 0;
>>  }
>>-/*
>>- * Wait for the GuC to start up.
>>- *
>>- * Measurements indicate this should take no more than 20ms (assuming the GT
>>- * clock is at maximum frequency). However, thermal throttling and other issues
>>- * can prevent the clock hitting max and thus making the load take significantly
>>- * longer. Allow up to 200ms as a safety margin for real world worst case situations.
>>- *
>>- * However, bugs anywhere from KMD to GuC to PCODE to fan failure in a CI farm can
>>- * lead to even longer times. E.g. if the GT is clamped to minimum frequency then
>>- * the load times can be in the seconds range. So the timeout is increased for debug
>>- * builds to ensure that problems can be correctly analysed. For release builds, the
>>- * timeout is kept short so that users don't wait forever to find out that there is a
>>- * problem. In either case, if the load took longer than is reasonable even with some
>>- * 'sensible' throttling, then flag a warning because something is not right.
>>- *
>>- * Note that there is a limit on how long an individual usleep_range() can wait for,
>>- * hence longer waits require wrapping a shorter wait in a loop.
>>- *
>>- * Note that the only reason an end user should hit the shorter timeout is in case of
>>- * extreme thermal throttling. And a system that is that hot during boot is probably
>>- * dead anyway!
>>- */
>>-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>-#define GUC_LOAD_RETRY_LIMIT	20
>>-#else
>>-#define GUC_LOAD_RETRY_LIMIT	3
>>-#endif
>>-#define GUC_LOAD_TIME_WARN_MS      200
>>-
>>  static void guc_wait_ucode(struct xe_guc *guc)
>>  {
>>  	struct xe_gt *gt = guc_to_gt(guc);
>>-	struct xe_mmio *mmio = &gt->mmio;
>>  	struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>>-	ktime_t before, after, delta;
>>-	int load_done;
>>-	u32 status = 0;
>>-	int count = 0;
>>+	u32 before_freq, act_freq, cur_freq;
>>+	u32 status = 0, tries = 0;
>>+	ktime_t before;
>>  	u64 delta_ms;
>>-	u32 before_freq;
>>+	int ret;
>>  	before_freq = xe_guc_pc_get_act_freq(guc_pc);
>>  	before = ktime_get();
>>-	/*
>>-	 * Note, can't use any kind of timing information from the call to xe_mmio_wait.
>>-	 * It could return a thousand intermediate stages at random times. Instead, must
>>-	 * manually track the total time taken and locally implement the timeout.
>>-	 */
>>-	do {
>>-		u32 last_status = status & (GS_UKERNEL_MASK | GS_BOOTROM_MASK);
>>-		int ret;
>>-		/*
>>-		 * Wait for any change (intermediate or terminal) in the status register.
>>-		 * Note, the return value is a don't care. The only failure code is timeout
>>-		 * but the timeouts need to be accumulated over all the intermediate partial
>>-		 * timeouts rather than allowing a huge timeout each time. So basically, need
>>-		 * to treat a timeout no different to a value change.
>>-		 */
>>-		ret = xe_mmio_wait32_not(mmio, GUC_STATUS, GS_UKERNEL_MASK | GS_BOOTROM_MASK,
>>-					 last_status, 1000 * 1000, &status, false);
>>-		if (ret < 0)
>>-			count++;
>>-		after = ktime_get();
>>-		delta = ktime_sub(after, before);
>>-		delta_ms = ktime_to_ms(delta);
>>-
>>-		load_done = guc_load_done(status);
>>-		if (load_done != 0)
>>-			break;
>>+	ret = poll_timeout_us(ret = guc_load_done(gt, &status, &tries), ret,
>>+			      10 * USEC_PER_MSEC,
>>+			      GUC_LOAD_TIMEOUT_SEC * USEC_PER_SEC, false);
>>-		if (delta_ms >= (GUC_LOAD_RETRY_LIMIT * 1000))
>>-			break;
>>-
>>-		xe_gt_dbg(gt, "load still in progress, timeouts = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
>>-			  count, xe_guc_pc_get_act_freq(guc_pc),
>>-			  guc_pc_get_cur_freq(guc_pc), status,
>>-			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
>>-			  REG_FIELD_GET(GS_UKERNEL_MASK, status));
>>-	} while (1);
>>+	delta_ms = ktime_to_ms(ktime_sub(ktime_get(), before));
>>+	act_freq = xe_guc_pc_get_act_freq(guc_pc);
>>+	cur_freq = guc_pc_get_cur_freq(guc_pc);
>>-	if (load_done != 1) {
>>+	if (ret) {
>>  		u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>>  		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>>-		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz), done = %d\n",
>>-			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>>-			  guc_pc_get_cur_freq(guc_pc), load_done);
>>-		xe_gt_err(gt, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>>+		xe_gt_err(gt, "GuC load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
>>+			  status, delta_ms, act_freq, cur_freq);
>>+		xe_gt_err(gt, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>>  			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>  			  bootrom, ukernel,
>>  			  REG_FIELD_GET(GS_MIA_MASK, status),
>>  			  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>>-		switch (bootrom) {
>>-		case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>>-			xe_gt_err(gt, "invalid key requested, header = 0x%08X\n",
>>-				  xe_mmio_read32(mmio, GUC_HEADER_INFO));
>>-			break;
>>-
>>-		case XE_BOOTROM_STATUS_RSA_FAILED:
>>-			xe_gt_err(gt, "firmware signature verification failed\n");
>>-			break;
>>-
>>-		case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>>-			xe_gt_err(gt, "firmware production part check failure\n");
>>-			break;
>>-		}
>>-
>>-		switch (ukernel) {
>>-		case XE_GUC_LOAD_STATUS_HWCONFIG_START:
>>-			xe_gt_err(gt, "still extracting hwconfig table.\n");
>>-			break;
>>-
>>-		case XE_GUC_LOAD_STATUS_EXCEPTION:
>>-			xe_gt_err(gt, "firmware exception. EIP: %#x\n",
>>-				  xe_mmio_read32(mmio, SOFT_SCRATCH(13)));
>>-			break;
>>-
>>-		case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>>-			xe_gt_err(gt, "illegal init/ADS data\n");
>>-			break;
>>-
>>-		case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>>-			xe_gt_err(gt, "illegal register in save/restore workaround list\n");
>>-			break;
>>-
>>-		case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
>>-			xe_gt_err(gt, "illegal workaround KLV data\n");
>>-			break;
>>-
>>-		case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
>>-			xe_gt_err(gt, "illegal feature flag specified\n");
>>-			break;
>>-		}
>>-
>>+		print_bootrom_ukernel_err(gt, bootrom, ukernel);
>>  		xe_device_declare_wedged(gt_to_xe(gt));
>>-	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
>>-		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
>>-			   delta_ms, status, count);
>>-		xe_gt_warn(gt, "excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
>>-			   xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
>>-			   before_freq, xe_gt_throttle_get_limit_reasons(gt));
>>+	} else if (delta_ms > GUC_LOAD_TIME_WARN_MSEC) {
>>+		xe_gt_warn(gt, "GuC load: excessive init time: %lldms! [status = 0x%08X]\n",
>>+			   delta_ms, status);
>>+		xe_gt_warn(gt, "GuC load: excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
>>+			   act_freq, cur_freq, before_freq,
>>+			   xe_gt_throttle_get_limit_reasons(gt));
>>  	} else {
>>-		xe_gt_dbg(gt, "init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X, timeouts = %d\n",
>>-			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
>>-			  before_freq, status, count);
>>+		xe_gt_dbg(gt, "GuC load: init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X\n",
>>+			  delta_ms, act_freq, cur_freq, before_freq, status);
>>  	}
>>  }
>>
>
