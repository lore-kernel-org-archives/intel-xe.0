Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B4AFD377A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 17:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3217410E80F;
	Wed, 25 Feb 2026 17:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bV8U5OD2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A8510E80F
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 17:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772040527; x=1803576527;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Q4h1vrR8WXk/wbnmjJusvUL/nkyEhZzzPEZO/GwFa2M=;
 b=bV8U5OD2sT6aOh3cahYHbtyT93DZiODE4DuiRQQbmwBFS8/BeE7u4paQ
 QEJwvqxm9YkAOZ/ouKqZzlcTql/jU7xUU9lVoXsKeCSgtTxedJQogBC8E
 vvEvOL0GVo93KnfjV94e2d8AcLTjRwszPJFeqDhLF++yAj7QqJ7gHFwJc
 wBZKGjTeXvDEw9Rg1wGHuQeJCpGowRqp+2vf8dyhi+IlM2autx/GL6HUO
 WFxUTiYAJVmu4R5eKx+5pAfqM2Y9ZFc9pIrQwvLBkXeZ9CQJdZ5jJsqrH
 InNjLbQerOSklug2J/QgTKquw9/EAAa9K9FeQqZ0vk+1Pc1dYFQXl95e3 A==;
X-CSE-ConnectionGUID: 7Rmt7gBBTNmZCNpfG4cyyA==
X-CSE-MsgGUID: D6hvtWvQTGCi9GzA3ieAIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72992228"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72992228"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 09:28:46 -0800
X-CSE-ConnectionGUID: GHd1nWGERr2MFtaxSmGcZw==
X-CSE-MsgGUID: ndD6GTHLRqW9W6gmRiCP/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="220907387"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 09:28:46 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 09:28:45 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 09:28:45 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 09:28:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqtJVo9s5o1bYS1GSDQ6t4Xxcle5EkDxKn5VWL1TjzrRxq18KAgusc4B1U7tE/ZkBibZZpTEFji21aasHvGUKyJqUQg0piBJCv2Rn5xh/6m4KZxE3VwiwhCqqXEZseadJ84L7A5oKJx/LD7PWFRoWGaIoV7TYqOlcYXnZ2Xyfl/g0PurhUa+2iiOCbuuEPXig1VpySJL/zgSawWr/Ma+fQhOeW5FB0spD/oo6M5P1ij2P0dyRJnSAU2qHEDfpOrLEr0p649KtiyiBL9I9QJB7o+ONZiSkMoXslT3TvALh1sowPADNZbcq8VUnOLbATyZ2BphpX6kHW/mZMMg5FJaQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeyfzZXYw4lqjRebDSg0AVN+UHsA4i+wyVFpRDp6t7k=;
 b=sSZqLDiDWCzFSTpNJ4TlYGc+dVf4W+34mevzU6kJs7cYTJFL9NrGouB/+Cp3q9+Ay43zvybevu9FRjmaRBRKDJlqKdPB92PH8HDJJLya9VKsc1AHh5xT6/KiNXUqYw9KqcsmrlkFwtVouUowWWEXCMN5qveDoHJ3HQopDkGgatDFFoX3+tls0vexQydDh5DqKnZBOaKz2Vun2SDSc84I4yEc8lAZT+BDyT5YDHlCV6XjxbJXAEZw6BszJnxtoZMzsyP/xlT52V8Yk8AEm8afM0kPrhg2tPldm59ewfLbT+jK83ZX6+UCTK6NRct4MnPj7EA7SIzSSuk6f7TxIRMN6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB4888.namprd11.prod.outlook.com (2603:10b6:510:32::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 17:28:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 17:28:43 +0000
Date: Wed, 25 Feb 2026 09:28:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 Misc fix for xe_guc_ct.c (rev2)
Message-ID: <20260225172840.GP4694@mdroper-desk1.amr.corp.intel.com>
References: <20260223162350.3205364-4-shuicheng.lin@intel.com>
 <177199849645.284988.1459261199986523919@a3b018990fe9>
 <BL1PR11MB54477BA143E124F7C47C5752EA75A@BL1PR11MB5447.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR11MB54477BA143E124F7C47C5752EA75A@BL1PR11MB5447.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::46) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB4888:EE_
X-MS-Office365-Filtering-Correlation-Id: e7bea4e3-836e-4a5c-e23c-08de74935290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: +DUVCo0c4KRvLUuuZLNUiZCYubESS5ZeGR5Obk+qzyaJtj9Zh3tBw69vUnpm913H0mSHbM+rcgKjwagdFqbf4QXCvQOChbN168wxhpqgOfDk98hi0N9s+fUdN4euDuzThMaWP8ciQ27p2dUj6fCsdalWDUoVUnqb4tQUKqbsA0+lI3daC2jRwZI9/khO+OH2R41h+hezZ0vs+aUKGxqMwWNFwkd0qene2BRjGENOUk8vUk+8iMSMKImVsFRQYFr27MWoAXSBqs6xmlerwksc2QK0/MbH4qvgfYYhNLS2VjccaUByUwpbDJ4V+mCz7tod0ZlHm8uFZN+OsddhK2N+gZ9TZkUPDe7Y+Es2+l2knyRfUp6iwtrXL8SgbGnLB6AkHWFAEo8zDkXxUvaFp2TFyICYscwb/6pyxCrNEGNiUSLaF8WrKs9meos2zHwfFW5Mj9I2FR/eQcCCinh2Sq8czixWB8KvNiuT01nkD7W6vTYeHXmKiwVjRjICEAc0idGxSdRYpx+eDQ/YTfrNi4gp9gXY3/1dcIMuHPc5LBvmjcgTLBlv8P3cwymnrzy3fhFipNjcBUrsNUDmuzm3Oq0+s20aOcJezrfWkkfFgH40VvtXzItcVzz/xoFtaDCdCO0BEsVBHaVM5V5ruB8lo0NyyGaMuuPxUg4OV0/XI++JXMvfvRTq3Sl2JtnkkgUla5qdK2iKTeoJATjOQpXW949jCm2FhEEu15K+/3/5CcK7K+oBDaP9tC4awf/aU5dFBLnf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEdLZ0JOUHJSblBsMXZPbkdaV1lrU3BsT2FCZ1ArK2pCR1hGc01kRFJNdzRF?=
 =?utf-8?B?RWpjVFRJYlBPRjlQRVZGb3VhMnUwcUluSXdsSGRLRW1XWWRUcUJKT1B0amJt?=
 =?utf-8?B?K1N6NE4zeWlCVElmQitRbnZnTDdNblJqTXQvNHF1M3A1TDlEQm5ob1ljeU15?=
 =?utf-8?B?MWZqY3liODVGMGYvQkFpbEYvbGdGbWlOVzV1TTRKS0tmdzNSQk1vNmtvSnEx?=
 =?utf-8?B?TnUya1k1RGxpOTlydzdnVWdwRndWVjdsdkh3Mi9EcWRaN0l6aE1PMWx3MUt1?=
 =?utf-8?B?UzRIMUROMC9pSFMvZ3hpOTJnTHhTWEtleGZoMHFpYlpGcWNPLzhFR05TNDVr?=
 =?utf-8?B?LzQvZ2pLTGpQZnVNanJhS0tmbnIwWEdxc3B3SXVwM2l4T1JRUmpCVVFyZ3VN?=
 =?utf-8?B?U3dHYnlYNXVTMlVDTE94UnlIYWpJRjhkR1ROVTR0V3ZZQTVZVWtWcCtJeFYx?=
 =?utf-8?B?S3V5V2lpamFsM0VkK1krdFFsOTV6M2RYeUQrbk9UaHIwRjMyZHNoL2oxZlo4?=
 =?utf-8?B?cWFJR1RyN0pvU01vbFVWMldoL2NpUW9wTCtOQU4zNXF5eXYwSDRRTWMxR3hu?=
 =?utf-8?B?S2hnTHRjdk95V2JlUWZINTJQdkk2aVkwT0ZuZmNzbTREdHpUTEk1bXNsem50?=
 =?utf-8?B?ZTlkZjlzNU1Reko5WlVGcXFLRHY0SnZIaGlhb2tKOWo3SkdScUo2VjU5WitG?=
 =?utf-8?B?S292SVprRUg1UlVyejFFRDJjcDdlektyRWlmOTN6T3drMkpJMUx5SkpiSEE0?=
 =?utf-8?B?Y2JWTmRDLzVwNkFkbU5LZHczV05MdkY1SEZPSEtBa015NWZzQkdOZFZsYXpN?=
 =?utf-8?B?aEdvUEJuY1ZISWI3c0xCQ2laTE92NkpmaEFnWUVOdTdTbFlpd2JDOXVNckJw?=
 =?utf-8?B?RzFFYlg4WkVMWWlMaFJUdVB3Q3FvOHIxZmFQZjhrSEFWbmFlc2JzejlveEJj?=
 =?utf-8?B?Z3NJQ2syR2MwWm5SM0tVcFUzc0s5M2ozb2xCaVRxaGxzdlg2dVE5NEN2NnBq?=
 =?utf-8?B?ekJxL04vSkVkODAxK1YrSmFTNUxTQ1hTY1A5SUllQk9yVzVGQ1MyL1NlTGFK?=
 =?utf-8?B?U0VjT0FtS1JYK2xQRkxtZmRhVThhVGw5a0JobUZHelByakg4ZnUvNlJEZGpV?=
 =?utf-8?B?UVFzN3lob2ZXOWVOc3ZReEJhRnFHSUpJckxwRS9XRXhmVUV0ZGQ3R1NaU1Ew?=
 =?utf-8?B?N0tjMkpyaFNibUpaZWF1WXFKWmgxVXVvdCtBcDlkWWhWSzZWTUU2MndQbmc2?=
 =?utf-8?B?cHpHWmlBVjVEdVVzZitnYUxrVkg1ZGpLaXc3YUUwQU01MENGZ1h3VTFLVXVV?=
 =?utf-8?B?MC8yb1g4alhhaWQxeUdJeU40TkV6QldXdEI0Q25qV2FNY1RMOHB2c0U2NlRn?=
 =?utf-8?B?ZmowWnI3eTNGdTJlbWhoVGxIUEYvcWs5YmJ2VHV3MVpxVkMyMUZuN0RwNmJl?=
 =?utf-8?B?dDRyN1NCUnZZN0xFQm92d05CaCtxYmJNb1h6VldidERManpXbFZwdUVPMXBO?=
 =?utf-8?B?V1Q1VTd0UUYvN1k0MVdZVHVaZTMxRXdYVUo0RzlBMjNRSzJXUlZhVEpKQzF5?=
 =?utf-8?B?S3BiRkxYZ1NFMlgySkRNaTVTemVlUkM2T0hPSEZSWXozMzA3MWZlK2JCWVJw?=
 =?utf-8?B?ZU52d3FtaHhvS1NmckNBZEtlaFdwcEN0UHAyM1BSb0tLMXJ1ak1oR3EzNUZJ?=
 =?utf-8?B?VkFVNVZaNTJPU1BndkZnbWNianBCTXkyTFg5VkVKWHdoUDZzM1B2Y2pvOC9B?=
 =?utf-8?B?TWEvb1YwMUppK01CU2lxSTUzNFdBcEZVTjRxTzMwTExDSkNEWE9wZkd5ei9T?=
 =?utf-8?B?TDM5QU9MQ01uZTMxZWhaL3d0R3hJOXFUbEFoSEVMcjZ0UnUvRGtuOExXbzd2?=
 =?utf-8?B?MmV5MWdXU2pxdWlNclkrTkZ1R01HcmlGTHJWN2hWd0dlL2Mvb1hYUmFSZ3Yx?=
 =?utf-8?B?ZXc1UDlYNXdyL1dReW82VE9tRzRaSlFhajdVeFF1U1JwNW5VUm5UT0xocHY5?=
 =?utf-8?B?bkgzNGpBaFduUUN1d0RUblNQR0w4c2xvWmpreGpYUHQ2MzRuSmF6bk9ENkpL?=
 =?utf-8?B?MTRIa2xrdUEyN0JNQlFsUjk3T1I2a0l2ZkRRcVFVNmVzSS80aVV5d1pUTVIw?=
 =?utf-8?B?N0NGbWxJOGRhUGwvelZsQytvbWFRb3VoRjMzbHJYbC9RSlJUUTJMWlpTb0lk?=
 =?utf-8?B?NGdFVnJDaU83RExqdUZHRHBSbHh1aVBtYWltbnkzSUpWUVVjcWVZWEdEMmJ4?=
 =?utf-8?B?NkhER09hNkNRZGpybnkwd1c5bm8xSXhSNVlMdEp3b1lPMDA1YUY1VkRhZStX?=
 =?utf-8?B?ZUliQUVmeGE4NkJRNGFYaWd6NGhBUmRUd1U4VGJoYmFxeW1wRHhKMnNUMlIr?=
 =?utf-8?Q?hW2DQgKoR1ZRncgg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7bea4e3-836e-4a5c-e23c-08de74935290
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 17:28:42.9941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbRRoSfVCCjxl/A9w8/cgxjBY7GhN6SBXoRksD8/b5KRoq8EzxTGQXWkLBeK7HIGouPOO6e4fDRDRsOYQPNZwVSSnDG6hkxE1baxh9/vNQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4888
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

On Wed, Feb 25, 2026 at 04:15:30PM +0000, Lin, Shuicheng wrote:
> >Possible regressions
> 
> >igt@xe_exec_fault_mode@twice-bindexecqueue-imm:
>     >shard-lnl: NOTRUN -> ABORT<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161990v2/shard-lnl-7/igt@xe_exec_fault_mode@twice-bindexecqueue-imm.html> +23 other tests abort
> 
> >igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:
>     >shard-bmg: NOTRUN -> ABORT<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161990v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html> +23 other tests abort
> I checked the failure log, both test cases are passed, and there is “possible recursive locking detected”, which is not related to my code.
> So, the regression is not caused by my patch.

Applied to drm-xe-next.  Thanks for the patches and reviews.


Matt

> Thanks.
> 
> Best Regards
> Shuicheng

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
