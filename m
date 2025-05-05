Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C59C3ABBC
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 19:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7640910E434;
	Mon,  5 May 2025 19:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARfozvg6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8E710E434
 for <intel-xe@lists.freedesktop.org>; Mon,  5 May 2025 19:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746472195; x=1778008195;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2fOYt0YJpoc3EufFv0FeGeRY6GgAbI+ie9MBLSMmBLc=;
 b=ARfozvg6PzS0RDqeynjH/0LPdGxItLjxGd7YvXPGxNDML018lI5D9kST
 mvl6OZm1rYo2AkUJJMzMhRBoI42ddmd7bhAUJlWQCg1LYNjihF860IljD
 YtitLU/PA9Mt2fsUOjXAI422G6A/i+DSeac2EGdgIupaqQ2xCPysCdomw
 bTgjai3bv1KaRZ5DxJLlzAf9im5IAU+7xtJ3zVd195hbMz0nr1+A73KzU
 GVC6CSJdCvln/7T7coygp3NQUoIP4/kSz01xijYY03I4eFBSCu8ZpMZO9
 J2x4YD78Ububehe+N7JUvXSwnEu+ymLQ3sSsOM7frPPIl9gwbre+8ccQb A==;
X-CSE-ConnectionGUID: l/8m3w3tToCxvNkPwy7HVA==
X-CSE-MsgGUID: MZXiKMaITeeE8NF8xoFu6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="47361203"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="47361203"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 12:09:53 -0700
X-CSE-ConnectionGUID: IjHLySVEQbqiAr6aX2oi9w==
X-CSE-MsgGUID: tP/+S5qQSIKxnp85ctrFKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="135340239"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 12:09:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 12:09:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 12:09:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 12:09:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NW/LWOLs1RUuKiBHL8V/yPAx9KfcXqg0dOu2lWx0zANEr5m9b6Pj0Fn1/etfk5XTB/eU2Dp4Z19K3zfz5YnyRZIV6kXbMq3K5yGKeB5j9mk3YbuWTuAOCBaUZj/Q+knkWn4SwmscGtPHR/U4EJuZ4ng5KwLjT/Ma66GJ3zzurqpf21LCJb9Rj5sDVgFGul6nMrnaOti4Tyb/5kLzW6Nye+hKTUWKI603s8yc2XqylGOT4amHYuHOD+EplM2wqUAHcy+WsNl59TKqm7XwksYWdWTAHmiOEiTzy9qXVS6Hbp4iMWxBJFQPgVkqedNyy4OtZhUEL3NCcB2yVTDBurocKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5U3m+KdndY8pcn9sn75yfYmgqCldVGaJa75YFeESi38=;
 b=gTPO1W+KJZOHdJXQ0csDQ5Zrw5hE9VT9v/4G/5QLLhv0D1IR3zriug3dgDOheiTYQF17udJhH7cDip0slMY4+nEzCea3GATcvk9Z3pKuGBULYMxtmCeHL3jzQ7/HFBvD2ERF/I1gQJ4rYCwjGvw6ZNfO9y8YXzRtdgZRgB/y5oSa7o5fCuzIGaLLroS7svGgL5b7sCRU66UrZsVfWXg62klLLT6aY0HmXjI+WYbMNv9V7E63yP8TVbOhURHp8KVXYUge/jCsCda+ivPErOdPO/Dqe1Po2OO0O+Lak+eywpNQujvs65qo7Ft2goFV6R3LLfnNbcEToZazL7Uc09DZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 19:09:47 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%3]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 19:09:47 +0000
Date: Mon, 5 May 2025 15:09:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH v1] drm/xe: Introduce xe_pm_sysfs.c
Message-ID: <aBkM9q-BksNG7D5i@intel.com>
References: <20250505053716.3360242-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250505053716.3360242-1-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0380.namprd04.prod.outlook.com
 (2603:10b6:303:81::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB4804:EE_
X-MS-Office365-Filtering-Correlation-Id: 86af0c83-6e43-4828-ccf0-08dd8c08670a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FoMCWKLt2b4YoLPN9YPjw5S4NdslDX18o8iUWftMJhFlBgpsbvTYsHW37f?=
 =?iso-8859-1?Q?deKGdd2TLCB5zdiqdcX6oO1yDdYHgOfv/D1O3kmaJfxTgcLDuri/W7Pr6K?=
 =?iso-8859-1?Q?LxqfEAWcIjBzwUIrVFKTcfYx72fi/IRyuwBgmG4PvmqeI7MRAnPGHKFM/z?=
 =?iso-8859-1?Q?RS6/J5gO09IbSUd/zZm6t/MzQJpDxw+WjSMxCi/J1cUxcsAHne2VbbyBWf?=
 =?iso-8859-1?Q?muVYTJvqxPdDFewU+1l623xbFQk/fMm/+Y6F402egmOC5X40n/GwuWtDly?=
 =?iso-8859-1?Q?8py+e9BlUK2oEzPwnFhpL4nOqeXt1TEw2SuOG1L164UsDuCU7Hg4m+Bwra?=
 =?iso-8859-1?Q?h8ahvQaehzZoumxpUx76zIB/dOWs8+xkfRua1U4Uq+4iWMPx22ZAqMeoBi?=
 =?iso-8859-1?Q?k7BHxyJaSOnho+JRKumeeeezmG/z8CZwo4qWmJFz3UXkpLQWNHZMZwa51p?=
 =?iso-8859-1?Q?qBqDyLpg2UYZRyPFpPvInydSYO2WpvVxnpIelnx35vqZzV0MV/ihe3sYg2?=
 =?iso-8859-1?Q?Wmt49WjjtFD+DkxgTcanwy5jeFeCybCNKywwTpsyB8jJ/WUV1+D3TzkhT6?=
 =?iso-8859-1?Q?t66r8GX4r3OR3KHMHocf7AmeY5QHmpxjAGP5ZdznGEOQEof3trX/YThtEw?=
 =?iso-8859-1?Q?NzgZ5GuWYkLZ+3l3SsfSwaj2T7v/6WB0W37tpaGZWoj5NdQKPYr1ZOQF/A?=
 =?iso-8859-1?Q?dZuYVUCsXQh9Q7Bnx0Cy/0EvSLW5yKnRGopojr8+ll2fBXVTe7H81umSyK?=
 =?iso-8859-1?Q?1/XxM/tch2zrkDmIAIGIj84kO3cxeyq9jlukqtpJXmBAT4XLlipQyEwP6M?=
 =?iso-8859-1?Q?qcOA6VeU4UKf2Rbqc144uv1YGzZPcJikuCUWQl8jT/Hk43AZql4591khJM?=
 =?iso-8859-1?Q?PJlEefr0i4kn/vqjya/8TcsAfmIfybCxsa5oSISEzIC3zKTVsTOfpPcQ5N?=
 =?iso-8859-1?Q?cr5J4lTQbhu3XKdFsAyA0ivxqcqqXcmDRA+GcBGtqPucsbXCPQE9rqC99K?=
 =?iso-8859-1?Q?dw60kOXrdLS5DkDut9tlzmT9t2co10JiEV+DcaJHxroF5MUuy2Cue806oN?=
 =?iso-8859-1?Q?xZWkIvTJj30H+30WHxjSVHZPF7IfjLjaeMxD/kxsSnBqINfDumyjC3/fhk?=
 =?iso-8859-1?Q?gou7TelhhGJQQ9bWHpOQlH5IHsILxtRTEPp24G4GIgnOzZNvGOYT6w9OOd?=
 =?iso-8859-1?Q?MPq1nAg+WlcsuTptn35leXVth3I3B+1gb0nRerJ0Od4m9k1AlIwlNBKMj1?=
 =?iso-8859-1?Q?Gqg8jDdfzUG3d7AQXxmh9vkK83a3CqZykOsErkP0LGQUKtVewXzXYwO37V?=
 =?iso-8859-1?Q?dBEHneuuhRfMal5wE9W/NhtE/Lh0y+BeqVQHd2IIqHZFFtYvHvKNEFLyy4?=
 =?iso-8859-1?Q?dyfm8AAdfLj6oAlkHZrdHbgfF3PBqh+0/2zroawLxLOLlj9jbsNeUoPp4D?=
 =?iso-8859-1?Q?aF7tlpVMuEI7zJt6CBqnGKXvuLey4JJq1oVzMAyGw8MeX1BlOcNqb0gtVM?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9mUy1aXV+AMdeEo8ak0c8zDrTfoFWBcKG2zmI7eXoZA+sZUTRqLzu/6Kz2?=
 =?iso-8859-1?Q?4ufbaSEHy9OIBr9/sZTesgYXRpinIWpmtqFa4lX+IC/5N9IXZK/Phxfmx9?=
 =?iso-8859-1?Q?N2SEhTmu75fB6WdyZNnWNZXK2afFrm+FsDJVkmKwgT9a07CjZOcI01oNbW?=
 =?iso-8859-1?Q?3pwx/6yDT2m8LzY2CQfURh14qwPhtEaCoZVpSOyHZQ/AFSvbWjjNJ5P/Il?=
 =?iso-8859-1?Q?ye+E2EgG5XHkGlLJ1pTMkzeU7NrhzY39M9uKUDhJpWL8zOmaJA2b7gLRiL?=
 =?iso-8859-1?Q?DAG1oC2i7LPtnPgbjY0L3TRM9hWuKXtmfl0jnaaggCqfUHbAsT7qItJZ2A?=
 =?iso-8859-1?Q?tnhynJTY90bur9VTa5z9TcAJI6IO2v2jsifqgEiI+o2VMD+tb7Km9oBFAm?=
 =?iso-8859-1?Q?btl7F7gAG7kv76PMMuC1SmXZsuoD0uf8PXQHhFs4y4CsoJJhRjjBJ2L1ts?=
 =?iso-8859-1?Q?iWvNzUCsgdSP8a++GPTjATa6xMBwxJfGA9WRm1i9HGHRsFtpiIicskL7Rf?=
 =?iso-8859-1?Q?5GGfEKeOGDKx4iYmINfBn6k2dRG7DSp4fJlT6RFugikw3W8UWrTqZJOJeG?=
 =?iso-8859-1?Q?Rh4ES7O75i2avlZrENn0PQpdS+4a5KCylrkI+2kqCwDm+wryPMKH0AlHYO?=
 =?iso-8859-1?Q?x9X98825wrbnPkzNzznNXnB3k6T0wEN7Zt69KAP/NLMaCOKgGXe20T4svQ?=
 =?iso-8859-1?Q?mKXb0yqdBkSPTx90ulvXGPYRIF9PdCFwBgpITtK3YdGV0ygrBIKLH924TP?=
 =?iso-8859-1?Q?c6DU37Bw+dat+0kC4qujNjOnB3pBN/BgMR6l9tcsQP6qzwwhhwChc7IgaZ?=
 =?iso-8859-1?Q?Am8xXzE91VSh5/DuhWbM2EUlu8j9y1vBCNaUx0rWMUwwlrYvmEoqnDyCjG?=
 =?iso-8859-1?Q?AG0Q2MxIrWcNjFrwrLQ2EYYOl49uU4RPi2uwcAsZ/l/ZDPyyeEt0/QvmR5?=
 =?iso-8859-1?Q?M9d/qqX0kTDHLFwCYufgbBxbto+IekN+easeXdaAmV8fol2WiWAUCv/UB5?=
 =?iso-8859-1?Q?sIjURkl8sLwpK6S9pS80Yw9y0mQOwJZQLeeWu6gE6swZhq9drTHb4nFVDC?=
 =?iso-8859-1?Q?agbZajFn+EiN5WnHboDNbAjwOTWsNhteURZqX00688rCTA7yz5vqiEzTu8?=
 =?iso-8859-1?Q?GCYW049ECGbW75Gie1WbILGgNL6oOh0R5NlTN/ThNV8mb2TeWWRJkziWab?=
 =?iso-8859-1?Q?RCPlvMZD9t1ZjsQhfeylmEFycfI4D4lmQTu6Tb+MmQzInHN9JpmY7zzY9Q?=
 =?iso-8859-1?Q?p6HSjjpzDAx1hYo7QrcRw/e9tU+sGjbeCQPxHLozX9Cr2Pik88iyEwxvUM?=
 =?iso-8859-1?Q?N6vq6Pdex9NY+m3KkV4SnVj93iEsMA4Aco97075UOUdMCXrpwZ4XvPdSlK?=
 =?iso-8859-1?Q?L8HAlgiWEdpRcC7v0dnLhDE1/Y6WGwpH+N20Ng+5dar0peKU7YkK+ArsZz?=
 =?iso-8859-1?Q?vM5AN3l/Sg36dOtqcbeahg8LqI539wIxPT3yPnXvtItg/7R16dSNBq48uo?=
 =?iso-8859-1?Q?SR8u2ud0H62LYEKzVVvmxnHRa0Oug0U7fIJsr2w8+xypiV/pPHNQI6gMUF?=
 =?iso-8859-1?Q?0Xiuwwle2Yuvh0IXhnvWdy+qmomJde/Eh7+LzUprC+SzGdvCXuZ2sS7qEp?=
 =?iso-8859-1?Q?9PkYy3xm3jNP1Z7p5uq5xCQtm8mOkwmaHd3dzeIuzGqyvUl4naEzCClg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86af0c83-6e43-4828-ccf0-08dd8c08670a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 19:09:47.7352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNBFGwe/TBWjhOilCE6Nw5Mg4uMKffpy2HFXsY70bcS46dbn6Uwve4EwhvOvKqODkKAwACGV1aWxo4xf2/rH9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
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

On Mon, May 05, 2025 at 11:07:16AM +0530, Raag Jadav wrote:
> Introduce xe_pm_sysfs.c for Power Management knobs and move existing
> attributes to it.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> 
> This depends on BMG PCIe link downgrade series[1].
> [1] https://lore.kernel.org/r/20250502183739.3308069-1-raag.jadav@intel.com
> 
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 64 +---------------------
>  drivers/gpu/drm/xe/xe_device_sysfs.h |  1 -
>  drivers/gpu/drm/xe/xe_pm.c           |  2 +-
>  drivers/gpu/drm/xe/xe_pm_sysfs.c     | 81 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pm_sysfs.h     | 13 +++++
>  6 files changed, 97 insertions(+), 65 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_pm_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pm_sysfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index c5d6681645ed..683b5a7073ba 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -86,6 +86,7 @@ xe-y += xe_bb.o \
>  	xe_pci.o \
>  	xe_pcode.o \
>  	xe_pm.o \
> +	xe_pm_sysfs.o \
>  	xe_preempt_fence.o \
>  	xe_pt.o \
>  	xe_pt_walk.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 7172972b5b60..cdea5e5ebf3d 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -3,12 +3,11 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include <linux/device.h>
>  #include <linux/kobject.h>
>  #include <linux/pci.h>
>  #include <linux/sysfs.h>
>  
> -#include <drm/drm_managed.h>
> -
>  #include "xe_device.h"
>  #include "xe_device_sysfs.h"
>  #include "xe_mmio.h"
> @@ -22,69 +21,8 @@
>   * each graphics device. Considering this, we need to add sysfs attributes at device
>   * level granularity.
>   * These sysfs attributes will be available under pci device kobj directory.
> - *
> - * vram_d3cold_threshold - Report/change vram used threshold(in MB) below
> - * which vram save/restore is permissible during runtime D3cold entry/exit.
>   */
>  
> -static ssize_t
> -vram_d3cold_threshold_show(struct device *dev,
> -			   struct device_attribute *attr, char *buf)
> -{
> -	struct pci_dev *pdev = to_pci_dev(dev);
> -	struct xe_device *xe = pdev_to_xe_device(pdev);
> -	int ret;
> -
> -	xe_pm_runtime_get(xe);
> -	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
> -	xe_pm_runtime_put(xe);
> -
> -	return ret;
> -}
> -
> -static ssize_t
> -vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
> -			    const char *buff, size_t count)
> -{
> -	struct pci_dev *pdev = to_pci_dev(dev);
> -	struct xe_device *xe = pdev_to_xe_device(pdev);
> -	u32 vram_d3cold_threshold;
> -	int ret;
> -
> -	ret = kstrtou32(buff, 0, &vram_d3cold_threshold);
> -	if (ret)
> -		return ret;
> -
> -	drm_dbg(&xe->drm, "vram_d3cold_threshold: %u\n", vram_d3cold_threshold);
> -
> -	xe_pm_runtime_get(xe);
> -	ret = xe_pm_set_vram_threshold(xe, vram_d3cold_threshold);
> -	xe_pm_runtime_put(xe);
> -
> -	return ret ?: count;
> -}
> -
> -static DEVICE_ATTR_RW(vram_d3cold_threshold);
> -
> -static void xe_pm_sysfs_fini(void *arg)
> -{
> -	struct xe_device *xe = arg;
> -
> -	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> -}
> -
> -int xe_pm_sysfs_init(struct xe_device *xe)
> -{
> -	struct device *dev = xe->drm.dev;
> -	int ret;
> -
> -	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> -	if (ret)
> -		return ret;
> -
> -	return devm_add_action_or_reset(dev, xe_pm_sysfs_fini, xe);
> -}
> -
>  /**
>   * DOC: PCIe Gen5 Limitations
>   *
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
> index b557db0a6023..f9e83d8bd2c7 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
> @@ -8,7 +8,6 @@
>  
>  struct xe_device;
>  
> -int xe_pm_sysfs_init(struct xe_device *xe);
>  int xe_device_sysfs_init(struct xe_device *xe);

yeap, clearly 'xe_pm' here is bad...
But I don't believe that making a new component make things better.

Because pm_sysfs can be many things and in many layer, device, tile or gt.

So, perhaps we add a 'xe_device_pm_sysfs, or perhaps we just kill this
pm_sysfs_init functions and move that to inisde the device_sysfs_init
and add the logic of creating it or not inside it.

>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 183813e43b29..365ce76b14ec 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -16,12 +16,12 @@
>  #include "xe_bo.h"
>  #include "xe_bo_evict.h"
>  #include "xe_device.h"
> -#include "xe_device_sysfs.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
>  #include "xe_irq.h"
>  #include "xe_pcode.h"
> +#include "xe_pm_sysfs.h"
>  #include "xe_pxp.h"
>  #include "xe_trace.h"
>  #include "xe_wa.h"
> diff --git a/drivers/gpu/drm/xe/xe_pm_sysfs.c b/drivers/gpu/drm/xe/xe_pm_sysfs.c
> new file mode 100644
> index 000000000000..64ddfbf79424
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pm_sysfs.c
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kobject.h>
> +#include <linux/pci.h>
> +#include <linux/sysfs.h>
> +
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +#include "xe_pm.h"
> +#include "xe_pm_sysfs.h"
> +
> +/**
> + * DOC: Xe PM sysfs
> + * Xe driver requires exposing certain tunable knobs controlled by user space
> + * for Power Management. Considering this, we need to add sysfs attributes for
> + * it. These sysfs attributes will be available under pci device kobj directory.
> + *
> + * vram_d3cold_threshold - Report/change vram used threshold(in MB) below
> + * which vram save/restore is permissible during runtime D3cold entry/exit.
> + */
> +
> +static ssize_t
> +vram_d3cold_threshold_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
> +static ssize_t
> +vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buff, size_t count)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	u32 vram_d3cold_threshold;
> +	int ret;
> +
> +	ret = kstrtou32(buff, 0, &vram_d3cold_threshold);
> +	if (ret)
> +		return ret;
> +
> +	drm_dbg(&xe->drm, "vram_d3cold_threshold: %u\n", vram_d3cold_threshold);
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_pm_set_vram_threshold(xe, vram_d3cold_threshold);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret ?: count;
> +}
> +
> +static DEVICE_ATTR_RW(vram_d3cold_threshold);
> +
> +static void xe_pm_sysfs_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +}
> +
> +int xe_pm_sysfs_init(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	int ret;
> +
> +	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, xe_pm_sysfs_fini, xe);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pm_sysfs.h b/drivers/gpu/drm/xe/xe_pm_sysfs.h
> new file mode 100644
> index 000000000000..9213c178c515
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pm_sysfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PM_SYSFS_H_
> +#define _XE_PM_SYSFS_H_
> +
> +struct xe_device;
> +
> +int xe_pm_sysfs_init(struct xe_device *xe);
> +
> +#endif
> -- 
> 2.34.1
> 
