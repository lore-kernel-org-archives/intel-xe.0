Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B79D0D14D
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 17:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736A910E5F9;
	Wed,  7 Jan 2026 17:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcd0rjEp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F7410E5F9
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767807597; x=1799343597;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Mcn0FQp4BJfRshroKoTZSpy86A5Rcu6bOoXXWo/9vec=;
 b=fcd0rjEpWw2VfLQzzVyPf96ZGfYnfG/yhvtS9hFPRvlNnTQaVwO+gfTd
 DGdWPORaz5c5ij0iRcEviD4hfLrWgu812o7PuzskxHd/IStPTKycMy+NO
 18HsM7fcxY15jJ2F6PFQZyk/ZVQfl0B2hMrhtVMgMsdK4tei9OkNc25+0
 PrVWolr7dGVdqbkiZ1wXnas5CgP5zT5bU1flXSvlcH77w7daBTnlyab3Q
 RAb8KOVezohseaG0DZ1zzjlbpFcubAY1uP2TGfg9awLHKobGLmujyQQ4O
 Zx8huMNFQGourq387S0ScbxFToiQFTFe6v273rT0HiVNm/ocqpj+MEHZN w==;
X-CSE-ConnectionGUID: VCPYaF5tTua603AJ2Xn9Vw==
X-CSE-MsgGUID: 3QMuou6GS3iSx+m+fv1Wug==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80296759"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="80296759"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:39:57 -0800
X-CSE-ConnectionGUID: L/GClKScRSa4sTUMkFEYrg==
X-CSE-MsgGUID: +AmJH0jLTZitY+p08UYCnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="234128616"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:39:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 09:39:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 09:39:55 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 09:39:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtUEWqkyD6ZbNrAXSS9ompJ4Axpyl/gXF+JvYnLrTmR+imUFUno4avkU+t+Pd5yC2DEkhfPWaG3FxxufS4cwqp8A6ZznN3j3i4bVsRqGN3pVbHZMGPgAYFKTVi5Dyh9HRrQ7rciTXHZw8XPfCJjtxmQJ4wnf/VxOBTjHLE+JGrKi+vDSbL6/lTRbnxV0B24nlpk3Yy4NW/oIJYPQ76WRFTqxc3z6q25JodlPy9mTMBbTv7gM8HNmpyH9ymjlTwvpvCkFzDxrDkez0UssPOZQZlHBA5vWZJUyssPSO9mwVdzf72kUQZTNu1yrgCmsHFvOJOaI1pzuTJdoX2f6Q7yxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooee/NOAd2bcvwhZrmhIljImxRFHEU5d4atZtDVv+AM=;
 b=A+S4Jzl7n6687epeMCSSGNv4oEfRjYIq7fE9jSDDlGn/UtWv+wtxOp+CpaoeEnny1lF0IaXQ4Lu92cXCb+wnLYQDvo0UBOm2D+qcttb/yLuT8kTxf2S0ZB1y8cWbv69DtZK3RPCwRjdtjZFg7wCxQTd69T9xCOiMqRGa/Lq8sz8mWH6pvOu8TIINih5tHVTMkiqlkCtEsoUh1jwqYAcQL0DzWDETSdqjkNZcycOUyhgQhunO5LwAxKsiEDeodehuYr5v6XGxxrI1vINNcEUZvYvroYWCMv1T5b7cL/S+d6lJJ42sScyPVFO2R9hRRAXyVV7xujY9XVVqL9LsO0szhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA1PR11MB6686.namprd11.prod.outlook.com (2603:10b6:806:259::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 17:39:53 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 17:39:53 +0000
Message-ID: <d326b43f-0d6d-47ec-86b8-5147deff64e4@intel.com>
Date: Wed, 7 Jan 2026 23:09:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe/xe_late_bind_fw: fix enum xe_late_bind_fw_id
 kernel-doc
To: Jani Nikula <jani.nikula@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20260107155401.2379127-1-jani.nikula@intel.com>
 <20260107155401.2379127-3-jani.nikula@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260107155401.2379127-3-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0194.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::6) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA1PR11MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6a60ec-7b87-4481-419d-08de4e13c3d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2QvWWxFZUc4ZWRmWHU3QnVsTFNUZDMxeWdHTHlyckdPQk1HUlY5WXk2eFFj?=
 =?utf-8?B?RzFaMGtMallKK0tEeHo0UyswTFdqQlMzc1JNSkFlckRhQU1tNzN2a0lEN2cv?=
 =?utf-8?B?NU9UOTIxbnRvSGhTTGNJSTl6eWFSR3pXM3dNNjJtbHpJZU1qTkFQa00wRk1v?=
 =?utf-8?B?RGlVSDYrZEFOZFoxalRQenowWEtEN3daaGVQbGxjaytVdmdzK1I5WFJ3VTB1?=
 =?utf-8?B?RGxWZkc1S0xxOFN6R05IeW1FMEc1ajVmNzdzdnlnWm1hQ29JemVzZk9RQXhK?=
 =?utf-8?B?SWRuSUY4ZDJZbC85VzViZlBjU1REejBuZ25JNWQ0MWRqR1VoTVU0YnJKeURa?=
 =?utf-8?B?N3pYSDlHa1RiMy9pd09ITkhjZHBaeml5eFdCb1IzN0d0NXh3dE1QMTN5SE5y?=
 =?utf-8?B?VVl4bzY2NzBydmRjKzBvZHorQThJVW9hVHRhNzc5cjJMMmY1d0FrMTZMTzFt?=
 =?utf-8?B?UnE1Z0txM1NSV2IzSDl1VGJ1VkdDVmpNZHBXOVBLbVlCWmdBcUFyamI4dG1j?=
 =?utf-8?B?ZFFJbzVQUkZ3b2tuQnhPOUFzV2VMRjNWYjBhN2phQzZXb0lLamxYSUgzNVYv?=
 =?utf-8?B?T3czTno3SW1rSHVmRXZYdUV3bDE4QVdFRG5xMWFwTmpWTjlOZVZXZ2hDbDVX?=
 =?utf-8?B?UzN3ZFA4KzdheG1MM1p2ajYxUis3MmVNZHgzQldoWE5HV0Rzc1dNY0ZHeXd4?=
 =?utf-8?B?akRJTXRncDhHNE9SSVJQdGd3NTYwVndseEYrd2JCV24zaCtiY2ZjdE9OY1Zv?=
 =?utf-8?B?MHNINEZhNEVtWEVmTGFWYjdKZWpGTllTeDNGbm5yc1F2eGgrVFBCMTBqS281?=
 =?utf-8?B?Sm5rcEtjaTUyYUZuUTVRa3UvdGo5VkVQNlZ3ODZNLys1Z0xPeGlrc25Vczg5?=
 =?utf-8?B?Wkd4cGdCNUtCWG9rekFXbkZBS2tXanNQeHVMcnRQMEQ3MEhsSlZuclZYNWZC?=
 =?utf-8?B?NWhaZFJnRjh1TjhNR1FQWW1LTVY2bXlIR1IrSjRQc0RCVjV1YzlDR0x3SHEv?=
 =?utf-8?B?SDVaYW1jNUxYTGYxb1NkWm5vMnMxeDg4eitkcW1qMll2NXRrU1hsbDVoZTRj?=
 =?utf-8?B?R21EeGM3R3lGM0tMSm1HcDNLRHNYTkdIZ2FLSnpOLzUwa1cwUjBzZjNpZ3ND?=
 =?utf-8?B?eE9NTnZQRlNMS1BhdXFRbFhTL3QrUWVrOWtmT0Q3Z2VkNlFRZm8xdlpoK1JK?=
 =?utf-8?B?WVFXclV5RHVDR1dBaGRUakNtREREZlVGWU1UMGFuMStTakVtSUwzSUl6TTV2?=
 =?utf-8?B?TmxmV1h6ZHZMK09JRURXZHoweXMyQVJEUjNsZ2RyWEdDanhYZUprTGQ4RUpq?=
 =?utf-8?B?d0tycUFENDk4WEhSdjcwdzJVZFgzcmtaQ0o0MzhPdm02QXA0d1E3YzZpQkZv?=
 =?utf-8?B?WElCcFZTTW00cWxOUmNMLzJtam9EUTBzRTBCbGVPV2Vpbys2ZElTbmQ5VGdR?=
 =?utf-8?B?TElJcTRPZ3I2TUxuQy9kZWxDb0ZuNHJ6dUo0TURYYnRUSTVmZXF6eSsrdXBk?=
 =?utf-8?B?elVGV1M0TStqYm1IREtQeStuNk40YlBqTUkzOFBDUEc3QmN0ZHROM1AwVlFF?=
 =?utf-8?B?Qm1vMkpXOGFoV3gzQlJVa1p2UUcvRlQ2c2JURjJ0SXZwWXlNYSsrMElJQzBh?=
 =?utf-8?B?RXdaemFFWXZ3NXJmamdyaU92ZHkzRThwanhQeWh1eU9sVkxGd2tHZXNPRGU0?=
 =?utf-8?B?QW5EakJkVm16dkdJTlBNUkc4UEhGQjlCREhZWmN4ek5FQkwwM3QwZUk3V0tZ?=
 =?utf-8?B?SWNSSUFTc21GL0l6ODBhZ0h6Ui9aL25wUnA0dWc0KzFEaGt0RVRkK3ROM1dD?=
 =?utf-8?B?djk1ZjEwektTQXpqYitRKzdtYmd4dUNSQmh6NU5veXFCNXY2L3BRTTdJd3FN?=
 =?utf-8?B?L0VqcDZxRVd3ZWNMWFRrMHZXQ1hrdTkxSDVpUGZ3Zm9SdFNLQUtYTTlzRnVl?=
 =?utf-8?Q?gc1p4Bj2HK000ZM8rw+yrF99a9/jF0vU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE9hdGZ3NWkrRFkvVURTVTJMSzVyc3FoWXhoNWFaVHFOWEdyRmhHWTJtcitB?=
 =?utf-8?B?SDA1bERMRUZxWEhRaitYR1R3cnhveUt0cndZOFRsTVlwcXF5UG84RElJS0tS?=
 =?utf-8?B?NU55LytLVmtPanEvSi9YM3lWcitiVjhuOEk0bkFkUTVzZG5HZWViU3Ryelhy?=
 =?utf-8?B?Y1gwa25uUFJZNlFGTmN6bVdUSjNheTNuVFRiS0g1b1QwN1g5L0RWWS9GRUpL?=
 =?utf-8?B?dVZIeUprbmVWK2xTZUVva2JjUU01N0E4V3hOZ0MwOFgzV1JXZ1FzbHY1WFhy?=
 =?utf-8?B?bmRZblgwWk1tOWlRUEJiQThQNUlmS3B6ZTBFaHdlTlhOdG41Q0Y1ZjRYUjhv?=
 =?utf-8?B?UE5FcXdoUHgrRkdDTWc0TTcxTWpsYTkvS0U1Qi9xaVBMcmVjQkZrUHE0dkFp?=
 =?utf-8?B?VkRpZUVSZUFENjRVWWZCWktzck9CWU5iaTk1aFhjTkc0YndIc05aeFc1azNy?=
 =?utf-8?B?dFNQMnY0YjZFU2cwelRFS2Zhald0MU55OFdKcU1LbzEvbGNNbll1Vmx0SUE0?=
 =?utf-8?B?cWN0a0V4M3NkS3ZBSmM2bWwvZis5ZEZRa09IcnE4Z3B5czNtZm5Gc0FIM0dV?=
 =?utf-8?B?MmtHbXdBUFIwRUorazJYRlM3bFE5bk0zZ0hJb1hTZ0YzcGtYMVdIczU3ZDNu?=
 =?utf-8?B?amhzN2Fvc0ZVaW82VmI0N2R1bFUzcUdVNXVSODQxTnFqOXlDWDd1T2gwT2o5?=
 =?utf-8?B?ZFh4ZE11QW05ZDBIeW9CNmtMcHBGQkg4TXk0S2QxT2RVQmFrZ1pxQlZkZnFD?=
 =?utf-8?B?c2ZWQ01LOXBHaTZCdzdkVkVuR3NodExRaXoxZW00STVjcFRJYW9ISDZEZUlS?=
 =?utf-8?B?OGVtU1A0TFp6MEVOdEZqZWJ5bW8zOHhBbE9rdDE5STAxUER1Um9yZE40cFR3?=
 =?utf-8?B?YkUxNU1DeklwTE9WRHY4UStuOU1rSWZYNGFRY3pzUGNEempaK3VFZFBZTmdC?=
 =?utf-8?B?d1djeHR0Qk5PT1VtVGU4bXg2ZVpXRnRoMi9xb1BvTnV3dWVKSlNmemxXNmt4?=
 =?utf-8?B?UXRMZmdPWGdmVWUyUmI5WjBEOVo1TkdldEY0RWxjSTVVWC96Sm5UWlVLdUVx?=
 =?utf-8?B?VXBFaEM3STc3cWJTcjhhZ0kyQWtGMVNONmdOdUpkaHgwMU5FRDA1UzNlR0F4?=
 =?utf-8?B?Z3Z2R0FuMVJLaXBUUjdHVGxuYS9GcTlqZkNsK2tmaWhMY3FtTEdTYTRmaTB5?=
 =?utf-8?B?bisxVHd3ak93ZVBBNGVYYmREazM4ZXQyQ2NyZDVUZ0d4akFkUy9hWkd0aGFr?=
 =?utf-8?B?Y3F0Sjh0S3cvdUpwVlpoSW5ya0lVTDA1UkZPOFVLcitBN1hKUVdUaXRhWWF2?=
 =?utf-8?B?QlE1ME83WHVOK0dhRElnaDJGSkZxWHNwZzJCQnkxS2cwUU5DaE1sUHM4M1pw?=
 =?utf-8?B?bjVlTytoVk80aDRMdHY0aklicU5DMm0rbjB2dGs3SitLQUlheEk4ZWt1Y3NG?=
 =?utf-8?B?RWZiRmxmbDNVbVA1SkdlSGhnOHlrT2greXNuZVRjaXQ0RUJJcWNQSEIyajJp?=
 =?utf-8?B?S255eHRjM2o1cVdHeWlVN2pZakRvYzNtVG4zUHorWnI4Mis4MkRwbURYYkJU?=
 =?utf-8?B?VHU1TkZ2ODJ3ZjVPM3QraDNwbEZuWlpPRGp5Nm9yTXFYaGpZVGlyckR5TXVN?=
 =?utf-8?B?Sk8vKzZEcXRDK1VmZkJJOGpxZXhmMkd5djNCWWMwY0xhTzgwcUo4YVlVUVdF?=
 =?utf-8?B?NGJvWDJ1WEZ1bnQ5dWg0ODNpamFVUk9KSGJJZnNlcmNxSEVNU0dKaVpGd0VK?=
 =?utf-8?B?a3p2ME82SWp3Qk9aV3A0MU9waldVVncwMDh1SVNyUC9OZnpBUGtSSUthNU1O?=
 =?utf-8?B?YWVFRHBKSFNlVWRUQU4ydEgybmoyZ3NnM0I0WHlFTzhXZUI2aUhqZXFuNjQv?=
 =?utf-8?B?NmxOQlZkN3dVa2NiRTM0Q3phdW5TcXhqdytRR2ZaNGxzanlGTzZZNEZDekRV?=
 =?utf-8?B?Q1RCN3Z5b2IyTFJGM0xBZ21aZHFwL2hSWUpMeXcrdloyajRLZzlzalRiWGF0?=
 =?utf-8?B?VEpWZzV1MUFaV0U5YjZPVXNOOGdXSFp4MjZhUVBJcjZNejZtZ3gySWNkaGJW?=
 =?utf-8?B?WnE1bTUwMDFFZ2hmaUJHeEQ0Rmd0N1dQOFZLcjBYdDhUMjVOckhXRktqQVRH?=
 =?utf-8?B?U2tjV1Y0dUtMTXFUMm5ia1NwaXgvbElLM3lFQTRuNyswSm5PMzZyQ1hGS0dK?=
 =?utf-8?B?ZEM1UWdMUDcxY0I5QTBWVXRxOXk5cnU3Wm1PTnhTVVhpUVMyclVsRkY0RXNi?=
 =?utf-8?B?a0dXWFFlcDJxU0pkUFkwZTZ0MUpiZnJWWkZMbXA0MFVycDNONDRjZklYYyty?=
 =?utf-8?B?cmN6ZStuV3hTczA3NlJtSTFiWlBmS1Ywd1l2eG0yUk94aHhVaWhhQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6a60ec-7b87-4481-419d-08de4e13c3d8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 17:39:53.4018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ua3p+Foq4EA7TyiSnDzbBodyL9tw+1Gdo90W69X14+kviiKXzqiQ69f5l0dG52dnRRyCeklL67eTEkQucJvxyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6686
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


On 07-01-2026 21:23, Jani Nikula wrote:
> Fix kernel-doc warnings on enum xe_late_bind_fw_id:
>
> Warning: ../drivers/gpu/drm/xe/xe_late_bind_fw_types.h:19 cannot
>    understand function prototype: 'enum xe_late_bind_fw_id'
>
> Fixes: 45832bf9c10f ("drm/xe/xe_late_bind_fw: Initialize late binding firmware")
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index 0f5da89ce98b..2a8a985c37e7 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -15,10 +15,12 @@
>   #define XE_LB_MAX_PAYLOAD_SIZE SZ_4K
>   
>   /**
> - * xe_late_bind_fw_id - enum to determine late binding fw index
> + * enum xe_late_bind_fw_id - enum to determine late binding fw index
>    */
>   enum xe_late_bind_fw_id {
> +	/** @XE_LB_FW_FAN_CONTROL: Fan control */
>   	XE_LB_FW_FAN_CONTROL = 0,
> +	/** @XE_LB_FW_MAX_ID: Number of IDs */
>   	XE_LB_FW_MAX_ID
>   };

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

>   
