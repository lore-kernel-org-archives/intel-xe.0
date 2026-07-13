Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCF0C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 15:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6FB10E315;
	Mon, 13 Jul 2026 15:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEpOFMq+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CD910E315
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783958350; x=1815494350;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Dn9E7Tg9lKXKTC2YrseXZesqhTt9u/kJix1qvNXnHH4=;
 b=EEpOFMq+EdYYzevyxcTz+VnkstZrUEf1JhqJJY/KorGoQ0DBoAhedYYa
 +bhgDx3pMMB8U68ON4JvFM539MpSdli7E7madnQ7eoVuvUFOUA4hFoiis
 bii2KslF1JHIAzjxH8jeCjinJSPI4Lf2XqUBRa1Nb4DFhG+kOZtZcNFtP
 cY7Uz+YOyyOygoTLDvpMUc+otmG5SLBk2BGoQJ5p6Kr1NnilwlAy5eVbp
 gILHgFxjsUsoUZDnG8+ZQT3S6KsJX9XPY3diXQfCF4xiUbfM02BINlrrs
 QNGbvA/z0mCgIY4NvHfFlqOmSsCfzWjDUFiColfk5aNOauUQH20XcBQ4A A==;
X-CSE-ConnectionGUID: ONX3oxX1QHy0gEhLTST0/g==
X-CSE-MsgGUID: 8K1ZCxzaQ6GWiOTVjXVAEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84535784"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84535784"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 08:59:10 -0700
X-CSE-ConnectionGUID: hvXJ39F7Qey38sAFAHWBYQ==
X-CSE-MsgGUID: e6Ls/BRGTwGhFLpCszcTzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="259443478"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 08:59:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 08:59:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 08:59:09 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 08:59:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cj8AjRLxhBiRoCKngglxDGE1QxhYwM2BMhSQB3CwfQKhjJ+Uvj4rwhLiKMSO0RPsK+/EHbFnc8e/Xelzb2AOv3pqhDUTLXR1WecPinLXWgws+t1KD99yQpT1hmsDg64IUfmZTQhk7HK05r4+dH6XhAawCCB5H98WaaZDKl7yHUniO6hUhTA/2uQ2+uHfr7iZdOC6WFFuvL72jWJVLXvJWeR5GMMIFrqVqULdgpj6nzgKtZVuqu9mmXn9p9LqSBldwWg+vay7Ujf2pGsMg7f2YLpQD4vywbsZP2iSV5iMFRGWgX7O9tIvDAAEaKLg4stv3662mqmNR25ytD91Guv3qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMQTJvRVMJw2NQ+oBLObNbcR0EMCxDwZBcFJE0kcfko=;
 b=aOYt5O94spDOaAe1d0D/kwJ/3KbIqRkS0K+WGJ7e1dlQ8PmgT5vaZUTUsVChrrEyNnktAOGKJg7vQ1p6rqRwuy7lopWYhhuVTwdVP9CA3CVHwEC87zZgb7/ZAw5qsrMQd4zxAYFScbOHC1KVkjrKZHO25x8ZkP2wU2JBtPj3p2+j6xUJ2b9PaOxENGBWq/cRfqcLQUigS9HGGWnVZNovJUt4QwmfK1HJOo5P8UiNKKtpfVka+GTdbI3rSd4AsC85YV4Xgl3UktrYXJkUrA2BZ1p5oid60TfZjWQuxeOuTEUYdTDDiZZs2MTphjXK1yr6Rx14BL1srQh1iTKrX7dLKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7553.namprd11.prod.outlook.com (2603:10b6:806:316::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 15:59:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 15:59:06 +0000
Date: Mon, 13 Jul 2026 08:59:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Honglei Huang <honghuan@amd.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 0/3] drm/gpusvm: fix IOVA/DMA unmap leaks in
 __drm_gpusvm_unmap_pages()
Message-ID: <alULRxMpL8x4A9VM@gsse-cloud1.jf.intel.com>
References: <20260706024642.614238-1-honghuan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260706024642.614238-1-honghuan@amd.com>
X-ClientProxiedBy: MW4PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:303:8f::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b211c8-40ec-498e-38a1-08dee0f7aaa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Y5FhT+u5STj4WnSzmTGREQKq3qBe+/HrfIwhFawAcpOtgmw6W3B0dwxnohlbsdkdr8n3TUjadQT1huI0tCGaeV1WVgp/Spzo3kzuTdfpeUxcz5tBuTauNscoatkzCFHCRsWMmiHXaeFWTsY+UZucZhCTXSZFgPNA9v9sqwdDe9n2/N10VaGOsobmFMj7wUnhjLFa+wbOSFqTdtznpI2DdUSUkLOkHFXY6PJ3oVzK6Q5/qZFk7+Cg7r9F1PfNG8Ur/4SNyC2Ratu17LB0ShowIiN1y5+/TIllxislaF/A67WitaHi2V6jnIXwJqOluLOSGzqfAitL9ZCihHhuyFBoH9jATwk+zXyUhQ5GCLMlmbhVP8RvNRUVw/SyU3U/GXO9T8CEaxAHLRt2Xg3f6VwZFcuJgHwEblrAiQxsqMtLdnEWOSmID4gC3EVfQNJ1tascILUxSoAMD+2Bl1RpbUYHnGqAWGgnlyOht3ne+XCbD8sGiP1xrTrcY8dL2DQwSC6/0+MWNYupq1WmiweynpTQDyy8zXCC+QmrDYpHZN0wdZpri20oZhYGLRQ1/qu6V7HrlE/+O/e74FGR14uJsUHQH/+LEOKPyDAaiHI0mkYo3L+myw0JGkUd+FZmP14N8PAQA78u3YmCmI0H8p5vg5I795P/aVadhj6ug73vtLX3k7E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4d6Cm4tRH3sL8O8zEk1iwOd9t2OxGOKlSWqEoPrDBYNuab5G6ttE5ucKX8SI?=
 =?us-ascii?Q?ilU0t7314m2WcJa4J1se43/fo4FVmM2eAfASsE1yELc5I03BPozUu5MuaKu5?=
 =?us-ascii?Q?4sN3uJBYO+0s2LxHIQwVygkZFV162+vJ/U1c3nUFK32OzH7SECVOpkuWIuVY?=
 =?us-ascii?Q?WMVb6k7SiXshLjGC8YwC1TVKSexe2G/PoARc2+tMnRjqqLrwnQ0XnDndIFZw?=
 =?us-ascii?Q?+9rUpH6c+J1+kahPNXACksAPpA7jcLT9bBzF56zFXTDZv3zX+SOdOWtOtgpL?=
 =?us-ascii?Q?Bde/BAjH5GzFCAuwmdRYc0X4CSSHLmO2RI7uFBQtOdR0uA/C5ad2Qive5Ve4?=
 =?us-ascii?Q?5eqXoQz5ABzOQPZU1vwxozn6+I5wxvSQsKzA14WS9/Wt3yyQQ+Ihmy1bT5t3?=
 =?us-ascii?Q?9JJ3IwQmRnly2Cv0hbdssriqfyyNbTrBxDf7j+6pBivC/grWlvW51wkUb3Wv?=
 =?us-ascii?Q?aTw4J893qtJzj8lAiO3fS6MkohWuBECLIwfFvCMUILkftwZs88v3PU/ZXrg3?=
 =?us-ascii?Q?rlsZnDteQBP4jXKDKo7S83YMkgITpGL2Qu+iObvUE96114nIafr2IOlt2mMh?=
 =?us-ascii?Q?OR7jy2+LDWv0UvhpHAEyNpub4KQ43kkI/TIqz68zlEZ4An4ctcdJgWp2oDLu?=
 =?us-ascii?Q?WdzrBhov01ii+uMqg4HWcqt8o91Wn7jBRDf/ZQVi2c25c9MMhcufebgGDYd3?=
 =?us-ascii?Q?N40URZF3wD+SOlOi6/GBLh6A2YR4y2jXINpFI099P9/A/iVo7T4zYbKh8QOJ?=
 =?us-ascii?Q?/S0WjDrOuyA0OtRLI6voc4c8yunFqTTzJtdUL7vbllYL8ZI9VUAOBiPxyXEs?=
 =?us-ascii?Q?0WIyLzU0xQWe+FGk7ogGZNIqaRLv584ldU9PnalpW5csAbq1MxXE+aLbQ2ym?=
 =?us-ascii?Q?nIv0uzbSTRC/R1h7aE3aIRxZ1Ok5SPdL4o+KfNlPhlNlTkLgbq3dYzWvWR/P?=
 =?us-ascii?Q?Q6A5CwYkuOyEqYWadPqO5sCd6vTf7MI2vckqDNxDckMU9ICj+94i/qkTw0Kh?=
 =?us-ascii?Q?esYanTTdgXHdhgXKrg4GRSB606/3arqLDTFMW6BhY89HvbkqzEtElfdHKg4v?=
 =?us-ascii?Q?lyFmNfQSA/jdc9cvLBsrEbA7z+aFtmVoAr8fHc7cy2e6zLmQ14LzS3ojStjV?=
 =?us-ascii?Q?ERmxsrtKNxzdqye84ln4i9iLvPoDsxJ7KmOspDjrsgYeEIBa4qN9BjGWt+I2?=
 =?us-ascii?Q?JMg8cARDaa9RtMOLusb/8UgQDcADcKlF8djFWCV1TAUVF5OYo4DQlDTYLQUL?=
 =?us-ascii?Q?hFHj4VponpxL5GlKvtdcfXITwKFIHsCoYSPRitE12nFkLxaZfXY47RWWJu6B?=
 =?us-ascii?Q?aaIdiZcJyb+goDybOTTS1PpKoPUjEaJW/JVwVdOzRaxI3d36CcHOzEiPvGA5?=
 =?us-ascii?Q?1DuwrgWVgR1lVxqFRBiPer4bS/zKQ+vWxR/4flkPyd6hx6L+qeRaeLPluE09?=
 =?us-ascii?Q?Z6Qu91yMDO3B6RMyuslCaeVlFxfH7vMLZ+YsZvsJ0YVZffg0AhI7mwyq1oDk?=
 =?us-ascii?Q?D8MamKa89Ty7twY/rt/LIRecNxVysK3YUAnrV8cK65EHSiYy6hQ4sVpJ5Usd?=
 =?us-ascii?Q?qC3XqZrANjHQAFJqrG4wQJdEngMKoLrAy70GQW1nf4KGfmbaeIQrt/yIvYoD?=
 =?us-ascii?Q?RlIWy/9b7GdgM2JwtxVIRDk82GivW+8MLzG5vXcA89wJuVjZDzu/koMZet7+?=
 =?us-ascii?Q?rA8/e5huM0aYwjviVgsAPmmfHsewjxTsi8vs07o99K433/bW5ydtZuxgQ+Qu?=
 =?us-ascii?Q?X14L+1ZcLA=3D=3D?=
X-Exchange-RoutingPolicyChecked: gBkDqhdP/34B+rcFKQyu8FGre9QqShNGcwYNTEApF4RBm6WPbx/51UGcTyAjxjOf8Y19PDG0zk7QN2rHM0kXZTDHHaR5RKqp/xVFdTDITvlAGPRFnpdlpkXpeM8tcY3/jqqrE28KeWdBRU5wzeVERnGVck4ONMBT0mPfUscwtfZlnLpZDAxD32RsCgKtNdQX8ghjEwnikILhH7yPfxXE3VUQ2sr2pYJxu9bCa+OIIBlm2rqCzqU0AkWkoOwvswbSDS/pcn0LPvGDq00DrNs0PmyjY13zT/3lj16rM+WqMFMSeRJPajQQZ7xAGpT06FI3m0JQ1iCIpiufdo9gs9I3sA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b211c8-40ec-498e-38a1-08dee0f7aaa7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 15:59:06.0366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyxRJY3DdDLRLX4bN7sxcNZDPuIgfVdgWD4E/NN58kK+A/HUX62pkwOyW0WuPaFKkY/dKzVTaCHO7op5fz63jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7553
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

On Mon, Jul 06, 2026 at 10:46:39AM +0800, Honglei Huang wrote:
> Three small fixes for the IOVA/DMA unmap path in
> __drm_gpusvm_unmap_pages() and the get_pages() error path, all spotted by
> AI review:
> 
>   - Free the whole IOVA reservation on unmap. In a mixed range only the
>     system pages are linked, so freeing just the linked part leaks the
>     IOVA reserved for the device pages. Unlink the linked portion and
>     free the whole reservation. On the get_pages() error path
>     state_offset is 0, so skip the unlink, also avoiding the
>     uninitialised dma_addr[0].dir read, allocate dma_addr with the
>     zeroing kvzalloc_objs().
>   - Do not route system pages to device_unmap() on the IOVA path. Branch
>     off addr->proto so only real device pages reach device_unmap().
>   - Publish dpagemap early to avoid leaking device mappings on the
>     get_pages() error path. It was only stored on success, so a mid-way
>     failure left svm_pages->dpagemap NULL and skipped device_unmap().
>     Assign it when the first device page is mapped.
> 
> All three issues are preexisting and independent of the gpusvm MM/device
> state split series; they were surfaced by the AI review of that series,
> so this series addresses them separately.
> 
> V4:
>   - Add reviewed-by for Matt's review.

Thanks for the patches, going to merge this to drm-misc-fixes by EOD.

Matt

> 
> V3:
>   - Add fixes for all patches, add Cc stable.
>   - Add reviewed by in patch 1.
>   - Move AI review note into commit message instead of reported by.
> 
> V2:
>   - patch 1: extend the uninitialized dma_addr[0].dir fix into freeing
>     the whole IOVA reservation, fixing the IOVA leak for mixed ranges
>     (the earlier version only guarded the direction argument).
>   - add patch 3: publish dpagemap early to fix the device-mapping leak on
>     the get_pages() error path.
> 
> Honglei Huang (3):
>   drm/gpusvm: free the whole IOVA reservation on unmap
>   drm/gpusvm: do not route system pages to device_unmap() on IOVA unmap
>   drm/gpusvm: publish dpagemap early to avoid device mapping leak on
>     error
> 
>  drivers/gpu/drm/drm_gpusvm.c | 53 +++++++++++++++++++++++++-----------
>  1 file changed, 37 insertions(+), 16 deletions(-)
> 
> -- 
> 2.34.1
> 
