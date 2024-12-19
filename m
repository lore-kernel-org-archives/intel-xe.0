Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55268E77188
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 00:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159BD10E0FA;
	Thu, 19 Dec 2024 00:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h4ZeyzIK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026C310E0FA
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 00:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734567590; x=1766103590;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5HQMgDroQHZ9454wZX0A8XjgRh5/r2a2uos0IxM2qfI=;
 b=h4ZeyzIKMG1H+9tu7d0F4Veyv+vUKRxhvQyKRaM8Po4u5vC9KzbeRwKu
 QF9vME6LUjjUYydfc1PFZk0Z7fuMe6437Shm6uww2xEHtCZd63yn5stZr
 c0vxW5BDGW/76WEQpYpwILLaT0EkFWH+9oW2UAIH59/XsHv7D2Cz+co6x
 g9IACB2btboruPsSCWIVDhbKEEIcnogUhN655JRYqXe8CElnUzBEHDKtT
 6iC7+Fo3w5WBptkLqKJ+bx7WTow/33yCzGjjdxSMa0mC6HZhpJ52Ys0E5
 /hDiWhRPPoi98iIgC2Ry4yBUPTAcBZ2Am1Y8zbJe2E/HNBmXOijHDhR9Y w==;
X-CSE-ConnectionGUID: ws9sdSxTTKC/fXggbzYUcw==
X-CSE-MsgGUID: +/gQyVidTgOmPjIABuG5Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="45661016"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="45661016"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 16:19:49 -0800
X-CSE-ConnectionGUID: 0ZjRVfhSRIOZBLxeXdflHg==
X-CSE-MsgGUID: tR3lM4MjSF+JdDvu7AxzFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98502436"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 16:19:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 16:19:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 16:19:49 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 16:19:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GURLQqT8FHtbG0Ikvv9bDiprKnKmdKir8G9GM648uRKTlqt/Vzdzj8bS2wp5mLsheR3hbOJBZMEWO74KK0GHz0b3Z3f4+1535+EHmZ8Z40vKzpu+ksZ6q0i78IY8uVc/tG6lJZ1lHyeIvobbBBnpPIDlNEuXXddM3sYEicsS41PnhxJx+u0F67ce4xpLZO3wmK1evz0miudcwM84f5v1xAX+MurMbeG36+vXnQp0aTLZEJK1/vtl0ZQfNM8hY/PcSQ1uAFcI5iYjLKtX/5LAjxNniFXl29yK8CZi4hHPgILowd9n7KLbG29zqPiuZNXRckrYDp4dtZkzA3oARmBl0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSw1WNRAIUUhK1fnj8vQxSv2slLxMPZQBxGfE2DIjLM=;
 b=aYra+384r++wk9O9ea0EhTYOQJZWAmKq5dqoOUlPYpOwJvGZm2d02X33lcaYJXKSmRltyAbWZa/bqJYoGaqqmRzJPu7MKbtz3mirTcgVmZpRzPSHE/hbebxDHtyiCE2y0YsewVoNPO9c5fSmzZN7vVCNZXWpImbd6lJV9vDExmkr3gAW9ddVj+ITyqGM2iZ1SxemAZyOictLv/M3WaO4QjuSXfqSmHO91WI9JImiBWKPuwvM3zaM3l00gT4HnoHAXD4uU0gdndYvUvqQBcIb2+I1nbTwGQILruRUwBjWGhlBmVEjbrnP/XbCfSmiVdR13gJXgf54YGOlkpmf6LwEIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 00:19:46 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 00:19:46 +0000
Message-ID: <cfc8ba8d-bed3-412d-92c6-28d2fc1392d7@intel.com>
Date: Wed, 18 Dec 2024 16:19:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] drm/xe/guc: Expose engine busyness only for
 supported GuC version
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <ashutosh.dixit@intel.com>,
 <soham.purkait@intel.com>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-8-riana.tauro@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241121063904.3033754-8-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:303:8c::10) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW3PR11MB4668:EE_
X-MS-Office365-Filtering-Correlation-Id: eac27018-fcb3-4ede-a9e3-08dd1fc2d812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXZHVEdMelN6Q3E2blE4d1NCLzNHdUZMd2Z3UFVpUkZUNlVnRGFaYUxVeStZ?=
 =?utf-8?B?bkNuTXJucUF0eWlZajI5bW1nSU5oNTM0MHdSaEJhZ3JyOEo1QW1BSEZUZVY4?=
 =?utf-8?B?Z0Z5eXo0emNCRWZnZDY2U1NCU2VRU3dVbkFKRmE3V0dMYk1kVTFwYUxRRnFO?=
 =?utf-8?B?djRuM3Urb1RIQS84VmtlZUZIS2tDOVp0N0gyZmhBL0NNMSt6UWtIZnlOeDZo?=
 =?utf-8?B?ckRJSGpOQTI5c2dtRWQ4dlpNcDNOM0xXVEthdkplczVPMWJQbUZ0ZjB6NGtj?=
 =?utf-8?B?MHVjRHVzQlYzNmtGU1VJbmdBNm5CVzI4NmtjZEZrQ2JKOEt0RkozUkgrZ1dM?=
 =?utf-8?B?ZlUvcHJlTTQyWHdaZnJRZGtvcDlqUW12YVBNRzBRQnV4dS9mTFlpNWRaWklB?=
 =?utf-8?B?OGNRU1FkVFFzY2I4dmhYYmtEaUx3TGdOeUFlc1ltNnNIMHZEL0Q1bkYraHVX?=
 =?utf-8?B?S0lYUWk3dXNNRlVkNTArTVh4L2hadGFzK24yeXJWOUgwNTA3Z1dIdVBpcmZj?=
 =?utf-8?B?Q25HSHhZQ3dHTmxza0psZ1lNZWJPRzJUWWxJUElnWEZkKzd1dVVvMDUxYXpE?=
 =?utf-8?B?b3FPUWFEdlJSZm5aZUJkSm5YeXhqREVZTkFlZ0t4b09Vc1RwcWZ4dWEzMUpn?=
 =?utf-8?B?V0VVYTdpK3V6Rk5RQ0NqdHFoeVVnWUJuanA5bE5TTW54RmVSbyswNEZHNFZq?=
 =?utf-8?B?OER1VlduR2pYQ0F4VTgwNDJYT1hsajlKUXd4cWRRbGlmcWJHVGt3RnlINjNV?=
 =?utf-8?B?a1VlT2ZvNktpZFJERHdBOHhuVEdLMk0yb0djYmFBZy9lTFJweC9IRHQ3YTZI?=
 =?utf-8?B?MTVkbExUcDlPVkFtcEszR3ZkS1VtS2JaNzIrVXJyR0pkenBoeVBmV0IxOU40?=
 =?utf-8?B?UWJWMjA3STNLRER1cVdqdmVEa01sSjlLd1ZTWVhRTjBGekhSZlhnUVlCaEw1?=
 =?utf-8?B?ZWd2bERVejhkUWdmRUdlb2V6VzRldENYVWJuVVFOdjlXSGp6Y3ZRalZCR3l3?=
 =?utf-8?B?Y3c4VmlUblBSRVVEMXczL2hmeTl2ZWlFRVdtbWcwZ1BqYk5BQ3hocmJPamo2?=
 =?utf-8?B?Szh1QnJMVjJpd2xXc3YzdmxZZldGTVVuSCsvNXBqYVV3ZncwK0JMQm9rR2NX?=
 =?utf-8?B?RXc5NGViZU82MTg1N2tWRG9KQ2R6MU1PR2FxcHB5aXB4U3Njb2k2cThLTTBQ?=
 =?utf-8?B?eXR6dGRGMGJ2bFhpalRFT3U2VWpKRGMzU1pXL0Y1RFczbnJPWVA4UmJJRjYz?=
 =?utf-8?B?VWdkZjJsRnNiaDJyakNuc3EwN3NlSnRmYnpXU01aakVuM3Q1d1d3NkRJUnk5?=
 =?utf-8?B?UnpZUEdoT1V1R2hORDRjUXdTUVVHaDY2Z0NBTENlYUlXcDJXM2FCcHQ5WG9Y?=
 =?utf-8?B?Sy81YjJwYVBWZlRZc2NnYk5qV1FZUWFhOFp0Z0piaVhCOVFseWx5Sk9qY2tn?=
 =?utf-8?B?OHlLQ3V0ZG5FOTIrYTBOelFNWEN5WjBqNElGdkNlRnoyTHdXbmYvZmlFbkVT?=
 =?utf-8?B?MkNLLzBnN3VEWmt4emppakd2MVRZbVBjMis2MUtnc0ZMMDVISTA4RmRwb0ZO?=
 =?utf-8?B?NVJzL0NCYm94ZG1WMWpKcXFsVjJDL1UxYUJmMzM3dm11a3BUUEYrck05dHF3?=
 =?utf-8?B?NTY3N2NNL2YwVzYrdHp0QTBHVHd6TjBHMFIxUkR1Yy9UZU1vR0hYZFl4d1M1?=
 =?utf-8?B?VUZSQjBuQmNUVFVhZjFSL0JBLzFWK3pCUFJ2ajd2anVTZlkrQzJaRFMxdEd4?=
 =?utf-8?B?S01oUzdSNjFLQzdjSisxSXNjeGZWTC9ROFNzbXNyOXJ1R0JmUWsvcUhvZFlM?=
 =?utf-8?B?T1BRUTBWeVQ0dzIyS2MyWFdMZ2tWWFRUa3V6Si8walRoYWhLS283NUhIdTAw?=
 =?utf-8?Q?NSLm2GTQ2w315?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0lXLzVhRWlmcFROYkhCTlZyK041cVBrSkpaRFIzYWoyMTlZcGtkOGtMMS91?=
 =?utf-8?B?b3d2dG92bDVzdDBFMjlzeHVBTmdZNDFvTjRDeXlaN09YTWIzdkZ6a1diZFQw?=
 =?utf-8?B?eXUxb1RPeTN5MXdNSHNqRENPcU9aY0JKV1gwQitYUGlwQkJTR29PbGlTb3hl?=
 =?utf-8?B?bWZCZUZlNzBZQndSd0pvL0JRVEg4WWM5ajI5RHFGeE5TL3E3RVgxWnpUc0Vq?=
 =?utf-8?B?ZWRNQWlNdDR0OHVuMEZLWTVLM2xKUzYvWTcvOXBIaktQSmc0U1VvbzRla3lR?=
 =?utf-8?B?ak9wMVBmamtINW5MS1RtNkttdG9FVE9weDE1QXFXQUNRWEpxSWhCU09Kcyt1?=
 =?utf-8?B?eXRiN2ZkTzJWelczamR3dngvVmZwV0ZVUzMxdjdqZXZqbDNTVnpUKzAvY1BS?=
 =?utf-8?B?RU85SE1QK29Xd05FTWpjcDJ4L3BLN0xOT0czVEg2NUcwd0ZWd3lVVTF1L3VY?=
 =?utf-8?B?ZDZtWWxJemZjdjJLWEQ2Qzc0Nm9pRzdPQk9xRngzK3hiaUUvUnE5YzloQ0Qy?=
 =?utf-8?B?VjE5dDNmWFgxQjRsZVdGeWdqT0oydis3WmR1MVdTVGtTZWpDajNnMENlbE5G?=
 =?utf-8?B?NVF4RTVqZE5URm1rYVBlb2wrTWsyM2JQSlFrQnFtN0g2UERwc2NMcVBNaWtz?=
 =?utf-8?B?K2hWZ0VwQ1VHMlMzeVRmcU5qckczN2o3dHhVRlB4STVRc3dXaWI3Z0VIRFht?=
 =?utf-8?B?dmNYTG9MVi8xY2RVU0NFa0h4Y0JxZ01QS0xISmgrN1NjWVZLOVZuQVRwSFpk?=
 =?utf-8?B?OWJWeEVIcHNPb24zN1BlT2hzU0FKaXRFT1FHVmdDbC93ZGVBekE0U21ITTFm?=
 =?utf-8?B?V0lHVmRIQWtHenlYQzI4cFcvVVRXNXBLVldYR2V0T285QVpEWnhBVU1jWWpD?=
 =?utf-8?B?OGVmK08yemZER3pQeC9RN1poQW1HVE1VU0trUXNzM0JKaG9GSVpzWVRpQzBw?=
 =?utf-8?B?ZjcrREtzd3hHSE54b3BWY2pGeVp5RllCQytaMGp3U3VYU05IYUhCMzRQZS9y?=
 =?utf-8?B?Z3oya0lqL2xvR1RYN29wRDAzZGVNQ1FkYjVrbUx3QnB1SW5HMUFqVHZFK0tS?=
 =?utf-8?B?VXlUeGd0Ynd5d2o0bUd6RklYS2kzVDR2am5xV0laNCs4UHBwUDgvTUtjWGx1?=
 =?utf-8?B?dDRjekNMUytxMms0ak5heE81WmpIS3NiMWo3V25DYnhReTRNUkx3a29zUDJu?=
 =?utf-8?B?SVJQaFJWYTk1Y0tpL3hpWmUyWmYxaG9FT00rWnNIbW9KYVBjTUVZSGEwNkNJ?=
 =?utf-8?B?TTZpR3VQQzdKSHlPQlMwdkFXNXc5Slc3bjhBckpzeW9vYjFtUHNLZlhPenlZ?=
 =?utf-8?B?azdFU3BKSXZ2NmR6V1Bxbmp1VkxYTlY1WDVmQ2hWZTVRcTJ4VS8zS0NJY3hy?=
 =?utf-8?B?WHU3UmFiOFJYKzZyLzBKejcvQlM4UDBXa0xPMDZSU25QU0Vla3NJbVdpeVh0?=
 =?utf-8?B?ZU5meXpsNHFWNERBcGdKWlVFSkVEUTFxL09Sa2dOQlptQWU2ME1PWTkxWDZT?=
 =?utf-8?B?MnpTam9rbnVJUjM0YUNTSGJkOTVxYm9CT1kzSjhBN2NRRHdsdmR6ZGRkYm05?=
 =?utf-8?B?dzMrSTQ0VW9Bd1lZNGhXRmhhT2h1c1c4emlOeHNqV0tGb3hyVDFpRnAvWkNy?=
 =?utf-8?B?V3JOT3A0UEpDSnR6cEp6ZlhmRm5TVzBMV01BblRuN09RYldXdEJXeW5ZTlB3?=
 =?utf-8?B?REdqdFRxYzVDWERuYXVCM2FGUENtczRkbTNFY3VxTXBBSkZqd25wQklQdDRO?=
 =?utf-8?B?U1JnZkJoK3RLdTVqcWJncldJWnNPT1d0QUx2NVlrblB6TW83NWc5Y1ZwK3lq?=
 =?utf-8?B?cXJmUllhb0pmQnZuYmxUUEJXY3VRc3luc21PKzYxYU9ESUE3KzVwUWRReW54?=
 =?utf-8?B?VkN4YnlmMEVMRy90bnR3QmtSV2hXQzcvdVBwL0RNRFY4RWZveThobVZCMTRp?=
 =?utf-8?B?bDBteXRLczFkVlJobmJ0WUlYWEZJY0ZEZ2g2djFFL0JGRmhyVHNTRm9tM2dX?=
 =?utf-8?B?bi9jbHNOYXFpWEtDaFZ0cFB1WERVMk5oVTZheCtFb1BLU2tkdXFjMTJoRCtG?=
 =?utf-8?B?dFN1Umo4b0pQaitmUnNva0ZSa1FsbUFXQlkwOHNmMUxyYUpYS1lSRXBhaDFE?=
 =?utf-8?B?Nk5rNUExWjE2RXE4b1RpbFpnSURoSGpabXRkTTE2Ty8wQ0s0WndPR3pnZGVT?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eac27018-fcb3-4ede-a9e3-08dd1fc2d812
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 00:19:46.7240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9b7RHTRvWC4tsIejOFNToldgXczQCk2gq5L41Jb1/ks3t9Vt9XcXUYrtVVR+V6P809fvY+uFGvAP95RBDEYDocduVwhmEI2suLH+T8DWkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
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

On 11/20/2024 22:39, Riana Tauro wrote:
> Engine busyness is supported only on GuC versions >= 70.32.0
> Allow enabling/reading engine busyness only on supported
> GuC versions. Warn once if not supported.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_engine_activity.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_engine_activity.c b/drivers/gpu/drm/xe/xe_engine_activity.c
> index cbafd42f7f2f..9d569fea8fda 100644
> --- a/drivers/gpu/drm/xe/xe_engine_activity.c
> +++ b/drivers/gpu/drm/xe/xe_engine_activity.c
> @@ -245,6 +245,16 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
>   	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>   }
>   
> +static bool guc_engine_activity_supported(struct xe_guc *guc)
> +{
> +	if (GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 32, 0))
> +		return true;
Doesn't this need to be checking the API version rather than the file 
version? As in "GUC_SUBMIT_VER() >= MAKE_GUC_VER(1, 14, 1)" instead of 
"GUC_FIRMWARE_VER() >= 70.32.0"? One of the major reasons for the v3 
redesign was to support SRIOV VFs. And VFs do not get to see the file 
version, only the API version.

John.

> +
> +	drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
> +			 "Engine busyness not supported in this GuC version\n");
> +	return false;
> +}
> +
>   /**
>    * xe_engine_activity_get_active_ticks - Get engine active ticks
>    * @hwe: The hw_engine object
> @@ -255,6 +265,9 @@ u64 xe_engine_activity_get_active_ticks(struct xe_hw_engine *hwe)
>   {
>   	struct xe_guc *guc =  &hwe->gt->uc.guc;
>   
> +	if (!guc_engine_activity_supported(guc))
> +		return 0;
> +
>   	return get_engine_active_ticks(guc, hwe);
>   }
>   
> @@ -268,6 +281,9 @@ u64 xe_engine_activity_get_total_ticks(struct xe_hw_engine *hwe)
>   {
>   	struct xe_guc *guc =  &hwe->gt->uc.guc;
>   
> +	if (!guc_engine_activity_supported(guc))
> +		return 0;
> +
>   	return get_engine_total_ticks(guc, hwe);
>   }
>   
> @@ -281,6 +297,9 @@ void xe_engine_activity_enable_stats(struct xe_guc *guc)
>   {
>   	int ret;
>   
> +	if (!guc_engine_activity_supported(guc))
> +		return;
> +
>   	ret = enable_engine_activity_stats(guc);
>   	if (ret)
>   		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
> @@ -307,6 +326,9 @@ int xe_engine_activity_init(struct xe_guc *guc)
>   	struct xe_gt *gt = guc_to_gt(guc);
>   	int ret;
>   
> +	if (!guc_engine_activity_supported(guc))
> +		return 0;
> +
>   	ret = allocate_activity_group(engine_busy);
>   	if (ret) {
>   		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);

