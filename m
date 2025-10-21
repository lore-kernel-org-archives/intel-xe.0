Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBBACCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 14:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E85E10E605;
	Tue, 21 Oct 2025 14:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ml0Fr21p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD75C10E615
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 14:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761057004; x=1792593004;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cnKw+jJFHYuaCvR7Q2EO9IVqYRQ0qy2u/GzsBu22yZ0=;
 b=Ml0Fr21p8UzHXXJiAJYv5426kzvebPsjrfKF8qNtBDXn+8oh+VH15U53
 qcByOO72LwaLxnaPTZL7122ZmawaE7k89vx9RLnnrQ6oQRvDbIWhJetvR
 Sx9vD2OGqxg6RgyuR63x1x/s7+PDEjFRfRW1yUCiPjJFilJ7+D/Di0+eq
 j1hCNGRVGLm/9ZAkd0tHBSz/GdjkktxSQrb8T5avMcYPRDL7QN1XG5p7M
 gDuJISWoL0JM1yVgbGiNi5BKn6Fxw61Utz9tt836e9QVpl7/P4clFBu3F
 G6sYizS50c1LeL59K0QNtcbtrVIunliz3QyuG4ATcyuVAns+DDyXvmawv w==;
X-CSE-ConnectionGUID: G6I2OyQoQO6BpfxQAjNChA==
X-CSE-MsgGUID: IraQslrjTAylOJ8eYNQIGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67019451"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67019451"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:30:04 -0700
X-CSE-ConnectionGUID: +yT7kR8wQFy84/6XCHSEhQ==
X-CSE-MsgGUID: 2lAjwem7T1ezu76VB3RAPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="188891697"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:30:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 07:30:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 07:30:03 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 07:30:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4axbrHGRAYChkGk3Nx/m4eB0YWvD47IvZQNU0+4ZNF/5FksMFafQUDj4G+I7tgLSXTOLrKcJiH5ITeS+bolzTO29iFDtPyMt4Y5IxfFcDAa8h0brY8L6Zjc/JIJ3PX1bFSER1122MQnvdaw/dA0w/62DPu8lJ7WK9DxQlgakBliKz9R7AN0gkubG5aOkhpc9Eq59g9ZrthIzRqhe14fewA9d3uUKfc9P407JBSlcwAxIMAqUGEEx0+cRyxGNcOzLCnkZ4oluoNDCSXXbX4U4XxF71Xt5ODmQnam9xR07dwzhOyeGHl3ZQwB+SXLhL1tLRFQs9TC8Q8MQpnISuHEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1+FVto6jyvPmhe3jX4m7P32eag9gTEwX9Tbi50/Lz8=;
 b=BVCmOLzZyc+FYyJzlEbm9rpjH0ncmVoAOLp/rdKPQqsNJDSCf56h+P7fvxuXbJVJ1neuX5NeCfE0QaIN6LxS2e8QuD5GL2HzrfGmTp7WJkDy0q0XiOHNGeKdxbTzDo/ndW3PBMSE/3UZ+R3QP7WVA7g47/wpRToOluOs0g2YmoY2uBMx/UErEczHSs7qWl4SNXke6cfSzle5B0KU9+Dd0K30kvw+2o5Cgk0DzGgZIxwNHCRi1EXdepRfq17PYob5RMXji0e4A7gxUiimorqofGZApoeYnTJQ+Ag3NCZr0jjD9+aQM/s6QlLHGhuh9ZvgSKrxxSHg2AI5FF4GoMMqmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB7726.namprd11.prod.outlook.com (2603:10b6:208:3f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 14:30:01 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 14:30:00 +0000
Message-ID: <d8c5e195-84ca-4326-b0c1-a5c583314ac9@intel.com>
Date: Tue, 21 Oct 2025 16:29:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm/xe/vf: Helper for telling whether CCS
 migration BBs are needed
To: Tomasz Lis <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251021123943.1436375-1-tomasz.lis@intel.com>
 <20251021123943.1436375-2-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021123943.1436375-2-tomasz.lis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ff438c-c5d3-4b30-577f-08de10ae50b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlNCL3JMZERyUGV0NXUrUmo0OXV4Q2F2WWh5TmtSWHEvYVNKVlBCeGMxSXE5?=
 =?utf-8?B?dURYS0lXTElaZXRldXh5SXRnbGcrN1pVUUo3Y1QxTFB0aGpreWh3bFAzNjFZ?=
 =?utf-8?B?QmFDbzBaVWw0aUIwdTBURUh2WmkrYXBWMWJSenJZbVNzTXBKb1QrRjRkckZl?=
 =?utf-8?B?UFVIOHZibDB1QTBjclQ4QTlFWjNHcy84dzFzUEtXWUErTUdsR1VrSzQrU2lV?=
 =?utf-8?B?a0U4R3luUUhxQzBZZkJ2eHVMRE9TUzJhLzNkUGlQbm8zbHdKeGVCY2J0aEVN?=
 =?utf-8?B?TTNiUjZ1MkNITDZ6dGN1dmFCYnlQMEViREY2ZStONkVMYllZc3dvOU9yTjdq?=
 =?utf-8?B?d1E1bVE2ZkNXS3FXYXhqS1lqTjFSdXRuZTd2MmdKQXlnYzdFL2NxSVBJS3FX?=
 =?utf-8?B?TEZON29vNHNuc0Jkd1FGT2ExUjFlTi9SWjFOdVJGcnRWR0p0cEFFYW1vVk1H?=
 =?utf-8?B?VE9FTTkrR0VqaVJIR0ZpU2tjVWZuc0llUll2SFNVMGZITnh6KzNkSGl3QXRa?=
 =?utf-8?B?ZmFnQUtmMVdFODZWU0t4RDdJZm5MRVVIcThsTXZYSmF2bG42aWcvYWdiYVF1?=
 =?utf-8?B?OHJsY0kzWW03eGpWUUJLcXRPT1o5OTBYalk0UTlqVE1YODhiQ0hBeGFlek1Z?=
 =?utf-8?B?dkFLOS9hMmpRR0szT2hCMmU3M3FBTHN0alY0SEVNeDZFL1lhYXF4bWsvYWpz?=
 =?utf-8?B?aVVpdFg4YXh5THJtOGdFZEJKVk10NUNmZkJKUEhhUlM2TGNvRFRsaDI3aTM3?=
 =?utf-8?B?cFdIOWlnVFdEYlJ2am9WU0J6TXB0aHd6VXQyMHJPQ1Bnbm15UFIreDhiSTJt?=
 =?utf-8?B?UWFaSGo1WGRlRmpzc1YzR0lBYjNObSt1M0xabkovYnlkMkRmRXh6b2ZONkxl?=
 =?utf-8?B?anE1VzlselJPcVVCRnVjeS82cHMwWEtFMEcvMHdxTE12RHBrNWdocHBtYXpl?=
 =?utf-8?B?RkNSN28xaVU4enZRNTVsY0xwS0x6djBmQ2dFTUUwRHV2Tm5SZ1NvNnVQRFAx?=
 =?utf-8?B?aXllREhIakMvemtBbktIaGtlcUVHYWRSVEJNd2lVeWVKOUo3OWl6TVRxck50?=
 =?utf-8?B?MEcwMWFLaFgvK1NoMjcreWpMUGYvMnExUnc0aU9VV2gyUC9RNGlobVlDQnJ4?=
 =?utf-8?B?UDJIaGtuQXVBMmVvZzl1Uk1qZUMyaDZtMWZCbzc3dHZmcnBOaHE5RUx5YWJv?=
 =?utf-8?B?VjZ3clJhbjQzY08zNVdlUGpvemNWNm4wbzhsVkZ1WVZXV2tDQUI0U011enUv?=
 =?utf-8?B?RE5KWXI1ckJsNmlGK2s4UUs0bFVRbC9pb3ZtOTFmcmtBTzNYZUNlZHpKY0FH?=
 =?utf-8?B?ekRvQnJkY2doNjEzcHA2bWpQTURTYWV2cGdOVExqWCtTSm5heGFWdVJOTk1G?=
 =?utf-8?B?bzBrc2ltL3J2TEpQYzRaSS91enBseG1yUUZoSktUeU4zYWdBKzdKa2xRcmQ5?=
 =?utf-8?B?Q3BZNVh3bEtoQm5ZdEFyTy9NZSt2aEw1K2FRQXZRTVI0K2ZtM3BtalNNdUFZ?=
 =?utf-8?B?TGdZWDNhMEdSaURQVURVdEloeGVVd3RKcmtCKzlzSnkrVzB0YlBNeWphd1lt?=
 =?utf-8?B?UDc0SmVGUUlOZlA5SXRESHYrTVFwVjVITVB2M3h6MW5oUldiNHV0VXh6NjVV?=
 =?utf-8?B?YjAxQXBhWms1bHg0ZTZ4d3Q3SlUzTFQ4cVhoeDFKcE9CMldvam1wNmxhc3d4?=
 =?utf-8?B?amZNOU1LSXF3Tkd6aWVqcWRZbG0rbGpLekFBbFZqeFBHa3Q5aUVGSW5raGZV?=
 =?utf-8?B?R1dkZjZGaThZYlZSNWNYc3JlL25UWExGdzFycU9xeW9SeTdScmJmeDF5UEJk?=
 =?utf-8?B?SDVWNm1zbW5KSkRRU01GQ1dOL0VLa1BpVllGRVluTEpiVmZGdXl3RU1NcHpw?=
 =?utf-8?B?VHR1b0R5YldVZTE1WjRhMXdQMnZtTzBaNWY2VzdUS0JHSExGNjEwN3NZL2c0?=
 =?utf-8?Q?+OH4uEYkjE+7cts/tcSWiQDEIJafgrEF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WitTdktFKzNBSDQ1MGpTRU5seHFpbUdWWElsM25tcnBnVXZLL09WK2RqWm1D?=
 =?utf-8?B?UVpjOVoyRzNJbXJTYUNOb3F5RTAveHEzRDk3dHBZbzhxT2FpOTdtS1hDZHlN?=
 =?utf-8?B?R2Zrdnh2RURtajdsaUJjZjhsQmxwai8wTjhFak5NSndHM2hIclNEYUJSck9Q?=
 =?utf-8?B?dmJ0RzllMkJBMFpQVEdmdzBmMWc1aWNreDd4UUJNYVFROU5CcHpPbEI2ckY3?=
 =?utf-8?B?SzFpaitkLzNxb1p5cFl5dXV6RDFSeE9KZVJDblUzUW9NWXNBM2Myb2JQUlph?=
 =?utf-8?B?Njk3djNpWUZzVHZ6Zmcyc1dpNHQxV2F0SERPdm1yWTI1MmJGRWJMVEZ5YnQ5?=
 =?utf-8?B?a1ZZZVJ4dW03TzVVVWt3b0RCK01zbUE3Znl4NmdxT09YSGJ2MjdxaktrSWpM?=
 =?utf-8?B?anN2ZTJ3WkhGMUJpaWxSdnZ3bTV5OWg1cXpXNXhqcGZRTW5MTUpIWHFXeEwy?=
 =?utf-8?B?Ry9TU2VnMmNiSFBlR0Q3Nk9jME13WWR1OTJqdWp1T0FBOXFvODNvSW1jbEto?=
 =?utf-8?B?QVRnVGI4N1p0UU50dXhYWWZLem9oUkYvalpCVnFXUUZ3Z1VYOWJDdndsdm9y?=
 =?utf-8?B?L0puMUI5eVFNSUY5SHR5OE9uV29iQjBKc0pmTE5CdU1oV2hVT3FFQVhDZ0F0?=
 =?utf-8?B?U09QSk1RZ0N1cjV1Mnh3QjRHUjBrK3FNdGt5cVJFbXRuVlp6SHB3U2I5RzV2?=
 =?utf-8?B?WHZMeHRYS1NtMHl3K0pyZC85V1I4ZTh6WFk2QUExLy82OExrYUdDNkVTRDNq?=
 =?utf-8?B?YXdWNVZUQlgxMmNjU2I2Z0o1TUM2Wk1Bb3J2dEozUy9rZkVQUnhaeFRvZzU4?=
 =?utf-8?B?Smw2SkdLZTVLaFI4SmQyV0JSK0RRYkdKb2RMcnFETFNhNjFQcklJSVNWQVFN?=
 =?utf-8?B?SGQ3aHdBYU93L1FnbXJWSU1pb1oxcm5DelBGazJxNDRiY3hDR2VZZmRGMUZL?=
 =?utf-8?B?alBjQ2NqTTBlRDBJem5Bb2xOTXhVeGdlSVRvd2Z0aXdjM21jQkRmSGNtK3VE?=
 =?utf-8?B?NlRGQXc2dCtqZkJtdlpmVG1Ia0Y3eXp4djBFcUVJdmdlQ1lTVSthREFZd3lC?=
 =?utf-8?B?VGZNc29rd0orN0dXcWhWU1BaY1p3dGN5RlNKVmxiS2Zuc0ZCek1iTENta3ZK?=
 =?utf-8?B?Sm9LYXZrdCttUTJmOWN6aTRXU3lxUHZEN0R4TzN1YnoraTVnRUZKenV2OC9I?=
 =?utf-8?B?TWFuOW40WFhyVEhoWWl1cWFRRjI2OWZYVFh0c1QyY0JNSWJpWUx2NHlYQmJa?=
 =?utf-8?B?aEhFMzVMMVl0OXhtWFZ1czAxVkZKazZ3ZlFMeDRGUG9vSHZrOS92R01ibWs3?=
 =?utf-8?B?SHRmc1U5cG8yTGZFM3pWSDVaUDJENDlVdkZMQ3NRRlNDQ1NPakIxcXJNVmFl?=
 =?utf-8?B?WGc3VFZBMkFMc0ZNd2syNVkyUC9pK3JiN0czejZBMm9tamIwMjF0UENLMVpM?=
 =?utf-8?B?dHJKV2hQL1hIdk1FYjJmT2lURVRSM2k3NE1OVnprN014T0tEbXhsbHhncWtO?=
 =?utf-8?B?YTBqRnRFNGRRbEVGaDIzdnhNMW5lem9nTHlCZ2puRG1yS1NiT09naUovTjFV?=
 =?utf-8?B?MjFOMkxHVVJqQys2bzdkbjJIZUxkWXdaYStySnJ6djhSYjlwODRNWm11blM0?=
 =?utf-8?B?RmdEREFmS0hUZjdQa3BvUmFCbURqVllnbmxCdk95Vi9JOStvRm5PcDU3QnF1?=
 =?utf-8?B?d0tQZzgzNGIrYmNkTDBiNDV6Z2VBZXppcjZEUWVPQWwxRjdKYTM3b2tHRFZ2?=
 =?utf-8?B?cHQ5RWcrN1RPbTBUYjJwcHpNMGR2VS9HelVEbFBBaHpZQmxtbWRyWU1JeWxS?=
 =?utf-8?B?aHlwYWVzN0kwL0owVlRqZ1lXUWdvV2hJdytteEJZTGFvRzI0UU5IZG9zdjdU?=
 =?utf-8?B?NHFVQm56NXVCT2tPM05rUzVVWDJyTEVpNitaMVdYVGtONWQwRXk2MStpY3dy?=
 =?utf-8?B?Wmkxd005SVZPM2NpZzJIdlAyZjFuVDU5NE5Ca1ZyRmYxU3hrUk5UdWttL1Vw?=
 =?utf-8?B?OWsxQWlhVWZnaDJEekdFRWhVVnAzK0svcGtIK0FyODhSdWJIVFVLMXR3WXZU?=
 =?utf-8?B?U0tYNWVSb2xjdXBlRUFiSE4wVWNYdG90c1dOcE45aTlKNFgrMVVhMmY3SW0z?=
 =?utf-8?B?RFRZU3VsY3pKWVJETkpXVWh4ZUdnbmJnMXluVnRRNzNoWTc1L2xsdkY3alFh?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ff438c-c5d3-4b30-577f-08de10ae50b9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 14:30:00.1737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqLxDJ31kNyAUvFfU3u3goHQdSj1hY2DYTHxIhtGo7Qe8N5Qeg5bIO0+JEmxSM1j3jDjs2HVcObiXTLPubRYr7hK9w/oalgE67by3FFgDVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7726
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

this patch seems to be in large part reverted by patch 3/5

please squash it

On 10/21/2025 2:39 PM, Tomasz Lis wrote:
> To avoid having duplicated checks, and also provide clear
> documentation of what are we checking for, the conditions
> for initing CCS BBs for VF migration are closed into a function.
> 
> v2: shuffled words in the name
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 17 ++++++++++++++++-
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  2 ++
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 790249801364..a2d61b37ff21 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -260,6 +260,21 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
>  	return err;
>  }
>  
> +/**
> + * xe_sriov_vf_migration_ccs_bb_needed - Whether GuC requires CCS copy BBs for VF migration.
> + * @xe: the &xe_device instance.
> + *
> + * Only selected platforms require VF KMD to maintain CCS copy BBs and linked LRCAs.
> + *
> + * Return: true if VF driver must participate in the CCS migration, false otherwise.
> + */
> +bool xe_sriov_vf_migration_ccs_bb_needed(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +
> +	return !IS_DGFX(xe) && xe_device_has_flat_ccs(xe);
> +}
> +
>  static void xe_sriov_vf_ccs_fini(void *arg)
>  {
>  	struct xe_sriov_vf_ccs_ctx *ctx = arg;
> @@ -294,7 +309,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  	xe_assert(xe, IS_SRIOV_VF(xe));
>  	xe_assert(xe, xe_sriov_vf_migration_supported(xe));
>  
> -	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe))
> +	if (!xe_sriov_vf_migration_ccs_bb_needed(xe))
>  		return 0;
>  
>  	for_each_ccs_rw_ctx(ctx_id) {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index f8ca6efce9ee..0e6b27016dac 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -14,6 +14,8 @@ struct drm_printer;
>  struct xe_device;
>  struct xe_bo;
>  
> +bool xe_sriov_vf_migration_ccs_bb_needed(struct xe_device *xe);
> +
>  int xe_sriov_vf_ccs_init(struct xe_device *xe);
>  int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
>  int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);

