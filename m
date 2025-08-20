Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47227CA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 22:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57CB10E28C;
	Wed, 20 Aug 2025 22:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qz8fX48T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DAF10E7FF
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 22:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755727426; x=1787263426;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PmglHOlcZwiI74jaC6uYkr3zsyLN0sV+VH2M1bVSp6A=;
 b=Qz8fX48TFmlzaXnERbqO9+rt3evYi3DfC3MF1mRveofANb756GU2ZnDT
 LYiAehQ/DK5tBDV8TmA7X8fG1+yxTdby6RI9s/k2vxhIF/20rMGmOmo6j
 Xj2wJ95JGGf8/Wk+KwDsEsC4XpgjOzM+AYMp5mzkMJ5F7dWbCImNGUyIJ
 5yQnMsVYyiO5NWbsebjYuU0uLnNhfEf0rqrsEUvZplCiPKtxf8yYNDWEu
 12L3rUqMtK+NnBtkdZCmKCZO5co1358R1Xfp0L849exxtoGWH2i/rWVHV
 EuzXNNEaIB/FXWw+lVJ+uYFaCbtrBhtzUyRAfBHXRiN4k0Tz9fNYBCOUE Q==;
X-CSE-ConnectionGUID: i7baB+IiQNSk1oqCasDp4Q==
X-CSE-MsgGUID: OmynwDa2QiarS6b7M8b8Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75457211"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="75457211"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 15:03:46 -0700
X-CSE-ConnectionGUID: odz6lJeXQu6bF7paIV/utg==
X-CSE-MsgGUID: 1J50sHQ5R9Gwq1o6HHtURw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="168174912"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 15:03:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 15:03:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 15:03:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.80) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 15:03:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPmjxqj8EYXk1O7uFQp6xb5SbRSffINqbLuiqTG/2csjiLFMKOorDFGUpKQb1FP7SqUXC2mUw1BPpBqIESY/VtZmcnq2LseOI+319itVGvP8/sBBtPl1cBequ70dlpbR4ZeQrdDoU8I8Y1tCilo/qYp54OmaUI942qLznTLPilkWXlsKQaSOyi+qiVs6238lfOX0ETHnhAmPF6+sB7HcUG/6JOk05pwwWKhexsovJMWr6MpFR3M0z6T3TFzDXjkwmrjIS+6blKXeNu5tubTKz/1ybGzquSnLTWoCgDxiMEaTGc7RamtgGGrDIldII9oamVK50FNjCfm9xolhUb4OZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4/7NvXsfc0xO6qLxE6if9Kj7+p28hABLSIbn94osVk=;
 b=VapdfS8AO4hSkcX3Z4PwzZB4He8Mu9YcsCE0+haKK/QtfWiV1leiAaM0FSwFy/k+MoNyXZmZJ4re7N9NpK3hZtFtf+Bgi+/H01BmhqpSezXJ1EmQdIS10KoS+W3fBrxUeoJuX78AtXm4Q5gm23mYQBZaSiiuTmaJPX52LLOlDXfFuDKn4dGWHGHlz723SZFzDG7b8Z9IJvohi2PuO4H0WGzbo9bITGeWmid3fXWlf0YnhWsexFvwEozef251lFljaUY00xHKuy5Zquik40xdJT466FpJBn/74yBS/S0WAgvOhEuWKD2aOONOjFekuKgLeLxdvxC8KIqo/NWQwTfDYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH8PR11MB6780.namprd11.prod.outlook.com (2603:10b6:510:1cb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 22:03:37 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 22:03:37 +0000
Message-ID: <43a78051-42d8-4c9a-950a-fa86201ec1a1@intel.com>
Date: Wed, 20 Aug 2025 18:03:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] drm/xe/guc: Add new debugfs entry for lfd format
 output
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-4-zhanjun.dong@intel.com>
 <242399d9-5945-4230-b897-b7ff32c0f72e@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <242399d9-5945-4230-b897-b7ff32c0f72e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:303:8c::31) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH8PR11MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: d6751686-a99c-40e8-6041-08dde0356a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEV0RXJlSWNzQjBqcTZOTVl0NVIrbys3azJSNjFRb2orS3BydFVwcnRXU2Ur?=
 =?utf-8?B?RFNVWDBZVGJMNDFYb2NvUG9OUERsZDU5L05PT2FlY1pWTExtNUxlb2VOcExY?=
 =?utf-8?B?Vjh0K1pJWXNUUG1rT3ZEUzh0ZlV2QWw3L210RC8zYVF0bi9jNEhrR1JRd0Rj?=
 =?utf-8?B?Zjd6dG42Q0o5ZXpnT1VvVGN1VWpHWUNrRTJiY3M2RVQraXY5eVlsVDdKOFR5?=
 =?utf-8?B?T2FlSHU5aUlCR3BlZWlRcys2bzczM0ZaNmFqSnh2Z0RXTUVTamRLZGwvK2lS?=
 =?utf-8?B?RmJldU1TeTkrbk5sdUNuaWx2SndPMzRMRlpYVEtzMnExbC9COHF6TG5aV2Zs?=
 =?utf-8?B?dzZlTVZ3bmkzWGp5d1hTVERKQUVjR3F4MHA3WEg4bWZBKzNqMThaNGtKbWZy?=
 =?utf-8?B?MXF3dC8wYW9jNmxZVDMxNjBUSE5mTGVScG9SSUt5ckZNa0Z4NWxtZTBYMld2?=
 =?utf-8?B?S0U4Ull0M0d3azF5SFl1ZFRzcDhGVmI2QzQ2K3dTNzJnNmxLbmtBM1UxN2dr?=
 =?utf-8?B?Y2JZbS9LUFlqVEJwVkN6UTQyaTJTYkppR0FHOXBmQUJTU04wek5MZ3FCS1hU?=
 =?utf-8?B?b3k2M3BUTG5RZnJTWU00WVNTem03VWxZK09iUTJHWnQvdnczMXUvazlIM3BV?=
 =?utf-8?B?aU9qN2xBaHJYby9jMVFJcW0xVHBPQUlMSlVIMytRYllHRTNLK2ZuNDloT1JM?=
 =?utf-8?B?MXJydklCR3N3YVo4NGIxQWErSmIwSldpRjlzL2o3Wmp3YkJOSWFjM05lMXJZ?=
 =?utf-8?B?RUcvNFpoUkNWb1NBVlNnNjBVQVJvQ085Mm5jS3BTbzlSQ1dORGI5NTNoa0lk?=
 =?utf-8?B?TFZ0S0VGdElKVVAxR0tlZ3cvVjdZTkZPL25pcm1iSnVlK3NRSkQ4ZUdERUZT?=
 =?utf-8?B?cERSL0RDSkN1YUs5WlY4SDdGQUNWUUNFK1lGNHdtWEV6eVkvWVhDTTFEcnAr?=
 =?utf-8?B?T1FyeXR1T1gzdkJHaFRLT0dwMjVoWlRhTXRXR1BOaFBPZ1hsd0F3VGZVRFds?=
 =?utf-8?B?OGg2ZVlDTlJERVV1eWxpRm5LMWJZNDZzdmd1Lys5a0hwcnduRkFxV05tVndv?=
 =?utf-8?B?d0tmRkFnMm1HaGVWVWRvTXRNdTlWUnlOUDMzYnY3ZURTbTJ0NlVubUNuWEdW?=
 =?utf-8?B?SDU3RktqUkNGWng5L1VpZ1E1cElzZDQzOUtCQ3FzTkI0aDFSN1NhdU8vaWZ1?=
 =?utf-8?B?cmlvVEFHanJFRlRXa0cxY1FnRi8wd3JjSU1MZzlYdk5ZQ3R4bzN2Y2hJN01w?=
 =?utf-8?B?SGNrYnpkTC9yZmR5TFYvS3dPWTVPVG0yMmZaY0k4MUV1dU9GeUFwSGtFaDdp?=
 =?utf-8?B?WDlDVjQwNG1JKzVMd0lhbkowSHp0RzhwNUdQM0FMbkxka2JpYXlIRXY5R2RP?=
 =?utf-8?B?THVpeE1NV2RFUWJhOEZpSER3WDg2eHNpZjlaMEhvaG4wSFR4NXVndE9LbXUz?=
 =?utf-8?B?NFBwbXdJVTlIMFNxMlJyT3RZaVNuTTdMSzFWZFk3UU5sUWlEbDdybTRSUU5W?=
 =?utf-8?B?WmRxZ2lxZGVCRi9YNHFMMmVnckd3NmY4STIvQlZDZXA1UFFMKzh3dzk0VEI4?=
 =?utf-8?B?WGVySXgxZDFuZnlKQm9pWFVVVVNEbU9KLzcrQ1ZTTTZXemhnd1EycTBkT0Z0?=
 =?utf-8?B?bDJobUcrS3djREphS21Jei9jdXRhNm84UXhHazRvTTBOTzdKd3RFcWFDTjZa?=
 =?utf-8?B?VWcxSXB4OEdkbzFteE9FY0plNHB3ak5qejJMOEJTZjJCN25zNXJwUDJKWHVa?=
 =?utf-8?B?akFNSThwUEN3MlozSk8vbmtKdjk2U3BtMDdJZnJQSGVmbkptUzBoV1R5Nlc3?=
 =?utf-8?B?aFBwdWh4U0diRFhCNUxUMi9RK0IxUk1vNklqNzA3alREbWdYMVJVNVQ3bXpt?=
 =?utf-8?B?M0FZOWV4aTRSdU9QVHF0cDljM3BSRnRRVlluY082QzM5YWRiYkRzcCt2RkU4?=
 =?utf-8?Q?AYdEOrcEwlI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjFDNUsrckFxbEJRdGkzMlRNMjFENHFwdS9qcnc2YmJhc2xBUzNnTUhZU1oy?=
 =?utf-8?B?R1pFWFNyUkszOFVldm9YcElLdnB6MW9jamNqcDN2UFE2S0FxYnBSTWhSdmlQ?=
 =?utf-8?B?ODF5NUlDZ085QUJ5SGdpUnpXNjM4UTMrR0FmaFFSUHlCdkZ5ckt5N1lYT3dw?=
 =?utf-8?B?cFRiSVB6OTZTcHZlWGZqVEhUcGNOeTFkNFhtZndxOVBZaTNBemhjK0lJdFho?=
 =?utf-8?B?bnd0Y05jQ0lDby9RaklNTnBHK084YWhQU1BjRldZUGVhQnIwQWFQOE5qNVgw?=
 =?utf-8?B?MkUrVTZmWmtkU0VSVDNoK2FUZHdkRE9kbnEveTVzcFl2MlZVdUdqekdMTVJU?=
 =?utf-8?B?L1EvWkZQS0diRXVqcUprbHI3V3NmUllQUHRuTWF6WlluVitnbWVjcVk1RDRE?=
 =?utf-8?B?aThqSW9iVXBYbXkrMlpqeTV2OVhOUUQ1V2V1bE5SR0wzUGVuYlY5UzM5S0Fj?=
 =?utf-8?B?OHh4Yk1IakZxUGFQUWNJKzFGckZjczYwdUV0b3ljclVNakpqQ0I2Tnk1TFc3?=
 =?utf-8?B?VmZubkt5Si9EcnlDd2poMWlyNVNjeks1Y1kyZHFnbjJ0T3h6YmxZYVdwdFJk?=
 =?utf-8?B?T0x6Q2M4aGloNDQ0ek1XaXova3hibTFOZnBBVWx0VFlmTzlhajJWSldOSXBs?=
 =?utf-8?B?NFlyV0lNclhjcGoxaTROUlBNcm9EWG02L3dMeUpTaG55Q2p2Mlgva3drVFRQ?=
 =?utf-8?B?MW9ZRkZ0SkYwemxvSnFEa0dmeUE0Mk1JcCtocWUwOWhKVHpONldYUW5EZ1Fw?=
 =?utf-8?B?TGpjYkdjWXo4U05TQjhCZGhQOVVSbVI3ZWVGVUV2Tkw0WVRrQm9LbGxHc3p1?=
 =?utf-8?B?Sko0V0JNcE5JRVJqc0x5ZFZtelF6N2p0ZXkzVFUwTnZEMGhCM3RFc1hjdWN5?=
 =?utf-8?B?ZlgzSHJkenNMK0RJNzRQSUlNN2lhS1o0bnNiNGZjUG15UU04RlhkVnRJRFVQ?=
 =?utf-8?B?YW52QUNXNTBGN1Q5VHRRc002M1RUQ1NQcEhOSjY1dHlFdGlGa2M2dmlNQXNu?=
 =?utf-8?B?d01PYmFUUFJBYTMwUTZ3V011WEZmUUpmbUJHT2UwWDFqb0FGaWhaQzN1UDFU?=
 =?utf-8?B?dmJjUSt1OU45dkppdlV5dFpJTGx3TXJqU21WOWFPQTNlYTVDcmZKMkRLYllQ?=
 =?utf-8?B?S2ZlMjZxVGt3bFZINzBEdmUrYXBUejRjSE5ZcStXUWRDV0NsZFNVa2V1bllv?=
 =?utf-8?B?RWZNUVhmQmI0K0c5N3JLeXJWRUd3cndzL1p0VHNDb05sU0Z2K3QvNk9wVU5G?=
 =?utf-8?B?YU5mUTNVdmdaeHJWWGJaVFdEN0x0WDNZaDNscDlzZVhqWmZwa3BEOUg3RDg2?=
 =?utf-8?B?YW1QaTVaQTFNeURWMHdzRHp2cjY0VnJSdG8zQTVxc1ZvRDBnRE8rbjFDTVpG?=
 =?utf-8?B?ZUVzSGJCU2FwcTAzNkE5aitLZ1JiY2ZnUVJXUXN5eXd0bjdNQWd0K2E0T1My?=
 =?utf-8?B?Yk5UQ3V1aEgxTXFCNEI0TjJSZzlRU1lPNmlSZlZuWlRIbjkyQ3l1WWNneHY3?=
 =?utf-8?B?ZXM5Y3Joa3hIM29rbFJabktycmxYSThVN2taTlFydU9HMDR5NEhhVXZlQU1H?=
 =?utf-8?B?UERsWG1XYWRRS1daamNxQ0hBTnBkalNtMTFOU1piSWNheDVkUm1Gdm9UZGhk?=
 =?utf-8?B?ajdYejFvaEQvcDZPc2FjZFFycUd4d05WVnczeWtad09VYlMxVnROdTgvZm5r?=
 =?utf-8?B?R2dpWkl4K0RxSVRLdCsvZFdXQzVXbkNFM2xnSU9qRVh3VXlsZGVQMnlUWW1J?=
 =?utf-8?B?Y2IvSVJ3VXVTOXNMN1VzYXhUVE9wd1FvS1NGRG85dmhNYnZCcit4ZDNsays5?=
 =?utf-8?B?L1RtZUM3blgrWW5qSGNHRVBLdkxucTVGakJmaUdqREdtYXQzclJTZm1kdkhh?=
 =?utf-8?B?akc5S1huMDhuVjJER1E1M1dnbVhYUXNqaFdMcWxJckR2OGhOc2hKa25leVZj?=
 =?utf-8?B?TnkwUlJEaFhEWmFSbms1K1lvNlJ5Wi9HZnpaMGNNVXNWQjlETEYyNldkOXpM?=
 =?utf-8?B?NUY0UEZHSVpkbUt1NnB6TVNRZk4wYy9sYm1yeTY4eXhrNUR4ZEdLOWNsUVkw?=
 =?utf-8?B?RC8wMU8ybHJ6TnFoTnowU1VoQ0FFbzRZcjZmcDhuWTdDWTdwUjN1QTlxZVVQ?=
 =?utf-8?B?SUlJY081dlJUV1JFYnlySDFGYnZ0dFV4OFB5NUVGc1J3cEZSM0ZwdUcySVlP?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6751686-a99c-40e8-6041-08dde0356a2e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 22:03:37.7567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPHRPLVs4ldCmAvZmxKqEttaEQq1/3pfUMrMONJFDhOQrJGGhbpDJ/sJvw59HzrCZcaXAjq23Y8GeVXlCnE6yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6780
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

See my comments inline below.

Regards,
Zhanjun Dong

On 2025-07-29 3:19 p.m., John Harrison wrote:
> On 7/21/2025 6:35 PM, Zhanjun Dong wrote:
>> Add new debugfs entry "guc_log_lfd", prepared for output guc log
>> in LFD(Log Format Descriptors) format.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_debugfs.c |  7 +++++++
>>   drivers/gpu/drm/xe/xe_guc_log.c     | 32 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_log.h     |  1 +
>>   3 files changed, 40 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/ 
>> xe_guc_debugfs.c
>> index 0b102ab46c4d..6cbc4240a3bd 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> @@ -85,6 +85,12 @@ static int guc_log(struct xe_guc *guc, struct 
>> drm_printer *p)
>>       return 0;
>>   }
>> +static int guc_log_lfd(struct xe_guc *guc, struct drm_printer *p)
>> +{
>> +    xe_guc_log_print_lfd(&guc->log, p);
>> +    return 0;
>> +}
>> +
>>   static int guc_log_dmesg(struct xe_guc *guc, struct drm_printer *p)
>>   {
>>       xe_guc_log_print_dmesg(&guc->log);
>> @@ -121,6 +127,7 @@ static const struct drm_info_list 
>> slpc_debugfs_list[] = {
>>   /* everything else should be added here */
>>   static const struct drm_info_list pf_only_debugfs_list[] = {
>>       { "guc_log", .show = guc_debugfs_show, .data = guc_log },
>> +    { "guc_log_lfd", .show = guc_debugfs_show, .data = guc_log_lfd },
>>       { "guc_log_dmesg", .show = guc_debugfs_show, .data = 
>> guc_log_dmesg },
>>   };
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/ 
>> xe_guc_log.c
>> index c01ccb35dc75..d2256773aaf3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -9,6 +9,7 @@
>>   #include <drm/drm_managed.h>
>> +#include "abi/guc_lfd_abi.h"
>>   #include "regs/xe_guc_regs.h"
>>   #include "xe_bo.h"
>>   #include "xe_devcoredump.h"
>> @@ -19,6 +20,12 @@
>>   #include "xe_mmio.h"
>>   #include "xe_module.h"
>> +static const struct guc_lfd_file_header default_guc_lfd_file_header = {
>> +    .magic = GUC_LFD_DRIVER_KEY_STREAMING,
>> +    .version.dw0 = FIELD_PREP_CONST(GUC_LFD_VERSION_MINOR, 
>> GUC_LFD_FORMAT_VERSION_MINOR) |
>> +               FIELD_PREP_CONST(GUC_LFD_VERSION_MAJOR, 
>> GUC_LFD_FORMAT_VERSION_MAJOR)
>> +};
> For the sake of two words, I'm not seeing that it is worth having this 
> as a static global structure. You are going to need to either copy it to 
> a local structure that you then fill in the 'lfd_stream' field of or 
> only output the first part of the structure. Either option is messy.
To be removed

> 
>> +
>>   static struct xe_guc *
>>   log_to_guc(struct xe_guc_log *log)
>>   {
>> @@ -216,6 +223,17 @@ void xe_guc_log_snapshot_print(struct 
>> xe_guc_log_snapshot *snapshot, struct drm_
>>       }
>>   }
>> +static void
>> +xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, 
>> struct drm_printer *p)
>> +{
>> +    if (!snapshot || !snapshot->size)
>> +        return;
>> +
>> +    /* Output LFD file header */
>> +    xe_print_blob_ascii85(p, "[LOG].data", 0, 
>> &default_guc_lfd_file_header, 0,
>> +                  offsetof(struct guc_lfd_file_header, lfd_stream));
> This is not an LFD format output. And a quick glance I am not seeing it 
> being replaced in any of the later patches.
> 
> Also, all you are generating at this point is a header with no actual 
> LFD blocks. That would not be a valid LFD stream. You should move this 
> patch to much later in the series (if not the end) so you only start 
> generating a file when it is a valid file.

From
https://docs.kernel.org/process/submitting-patches.html
"
When dividing your change into a series of patches, take special care to 
ensure that the kernel builds and runs properly after each patch in the 
series.
"
LFD feature code is called by debugfs, if debugfs is the number 2 patch 
in series, build #1 will get "xxx not referenced" build error.
Might discuss offline.

> 
>> +}
>> +
>>   /**
>>    * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
>>    * @log: GuC log structure
>> @@ -251,6 +269,20 @@ void xe_guc_log_print(struct xe_guc_log *log, 
>> struct drm_printer *p)
>>       xe_guc_log_snapshot_free(snapshot);
>>   }
>> +/**
>> + * xe_guc_log_print_lfd - dump a copy of the GuC log to some useful 
>> location
> Is this a cut/paste comment from somewhere else?
To be changed to:
        xe_guc_log_print_lfd - dump a copy of the GuC log in LFD format>
> John.
> 
>> + * @log: GuC log structure
>> + * @p: the printer object to output to
>> + */
>> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p)
>> +{
>> +    struct xe_guc_log_snapshot *snapshot;
>> +
>> +    snapshot = xe_guc_log_snapshot_capture(log, false);
>> +    xe_guc_log_snapshot_print_lfd(snapshot, p);
>> +    xe_guc_log_snapshot_free(snapshot);
>> +}
>> +
>>   int xe_guc_log_init(struct xe_guc_log *log)
>>   {
>>       struct xe_device *xe = log_to_xe(log);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/ 
>> xe_guc_log.h
>> index f1e2b0be90a9..0f6299886010 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -40,6 +40,7 @@ struct xe_device;
>>   int xe_guc_log_init(struct xe_guc_log *log);
>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer 
>> *p);
>>   void xe_guc_log_print_dmesg(struct xe_guc_log *log);
>>   struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct 
>> xe_guc_log *log, bool atomic);
>>   void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, 
>> struct drm_printer *p);
> 

