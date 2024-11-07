Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC86D29FA5
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 00:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A92810E03C;
	Thu,  7 Nov 2024 00:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LiFgQqQE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FDE10E03C
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 00:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730938595; x=1762474595;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IU9Y1oAhVT/9/jWKVSBu5Gdk+aKSHzhJ9D0PQQ2bXPk=;
 b=LiFgQqQE///0vD1ISOO23Zkik3Alr8X7YXbVB/ljPQjsJLm1dpU4T6i3
 ogXVu+Q7BwaXibzVtisIXw2OSAtMAhnFcyw+1/vRQ23F55+OaGNYdOotS
 83iw2W6cRcLKC+AUsll5gzqAGvrqNhysmi/tPuB1BaRnqEipOcDMbYEEK
 WY4/dvg+U1omrVXO31dPrBJOiyaHk/674hNN5EtzEMECvP5VSJaEjRSiZ
 fxBwyjUeTavlr4eKe4sXOND5liGfzo3PDpzG9qXdaVjNkeLlfGqKqeYKB
 gI+d5Jhpfll4TEU2ITy8kuDeFYgCcsidAvB8gIOfUA36DoZ0vysUTsRs/ A==;
X-CSE-ConnectionGUID: wLAjeh/2RaSZmIyjg319FA==
X-CSE-MsgGUID: sDrI5wXQRrCMAinzZuzLVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="56161737"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="56161737"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 16:16:34 -0800
X-CSE-ConnectionGUID: 3VKYZ54lQomR39bzb3cemg==
X-CSE-MsgGUID: kzN7sDjeRryA0Z1yos36mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="84750275"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 16:15:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 16:15:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 16:15:53 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 16:15:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3r9XMQzr6RHsiVwqeG/htvVlDm9qPoJDF35GUFm7PnRDQGxqxxW+rM97o6zqHEQgxzGmPiCW3XK8ccHF1XtbuyRM6/g/JRYKTXc/2mGQD7wsedXWtH+1mLyKAnx6tW62ErLAOGXc4KLW8tF4ZuUYFJM+Im25bjtznoQ1fFY7KHKmgfOQBqkJajyIPljuGGb/p4ySPhgSoEO7mfbIxv6Ob53L/le7zvZUsuKmRn86+tWluVSiv0Z25vnb9EQrEP8oTutGTtpqoDlEU1xT7QIFLyLKQ7pv/dpSoR3Da5hRMZgRi8t9mlSnaq5E1/C91lZ28Ienb4CZTdkVdjyTCPG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKqesJX06QMDRw6mJqsAIZJM2pi4+usYeztxIIMCLsk=;
 b=mkNcZqp0UGZIVNptbamk9MxnRLListaCy7KsjyhWraHi4XoD3nSpA31TpWswklopUjOZgLXXl1wF3C02jZNvuQ4Eu9vjdnID0nOAfX4W9Xc56U2n0GRV8Zkb+BWoWlulVNtLcevPHUMZvCZJ+OW3shD8f/brI428TjHaNcY2DWSL9p95qx++YaND/lCzmaI+ievQU9850rYxdjsFiCFGb/DClzgCboWCJ9JDGGaDa9pD9ETgNG+bDbXWZYRAn137uyxNn6UZcfK2vAwsmgI9KDjtFzo73Nbe0j6WMGMOicnxSNbe3QNXMu7VBQj7+CjR8inK0uk97QsLYEcI3AQUbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS0PR11MB7443.namprd11.prod.outlook.com (2603:10b6:8:148::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Thu, 7 Nov
 2024 00:15:47 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 00:15:47 +0000
Message-ID: <49ec50cc-5312-4ece-83fc-34c5be63e120@intel.com>
Date: Wed, 6 Nov 2024 16:15:46 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] drm/xe/pxp: Add GSC session invalidation support
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-5-daniele.ceraolospurio@intel.com>
 <1efa8385-ba99-475c-bf7d-3b50d426baec@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <1efa8385-ba99-475c-bf7d-3b50d426baec@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0062.namprd02.prod.outlook.com
 (2603:10b6:a03:54::39) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS0PR11MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 027ac57b-0dea-4655-a1fb-08dcfec1543a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUFTM1ZpTHE5Z0VJY2V4eW9RU01GcnlUY01LSmNuVFpyWjNmK2U3QU94QS9y?=
 =?utf-8?B?UFRxaUZmT2tsbnpkRUJjeXExZTduRWRoR0x0VXlRaUxhZjQ3MWFEaDBSZUMv?=
 =?utf-8?B?anZrb1h4cm15S2V4SEM1Q0VieGF2SVV4V3pXRFdJeDNMWWNkVWZjc0IwTFA4?=
 =?utf-8?B?a3k1dVc1bWFaSGloUjBBY1pDczM4Ulo5dklOaWswOTdJekwwdFRIM3I5eGZH?=
 =?utf-8?B?c0Y3c0JLMitScjZ4YnRmN3B5QUx2SmhnOS9GY0JaWUxPNlJiRHd2elZuaVgy?=
 =?utf-8?B?K0liYlJnNFZXMjgycEJhZ0ZDYm0ySW1tdHprWEtPKzcwUk9INHJ2RWdqZnl2?=
 =?utf-8?B?OVBLMEovKzg2OGMwUGFPWXJhemorb3NFc2FWNTlOdHlXdll4d3U0ekxyUEpu?=
 =?utf-8?B?SFdVRWxpaFRiZ1FFdkFkY1N0WlN2QTZQM3Z6NTRLOWFXR0x0TVg1ZXFqUGpL?=
 =?utf-8?B?dUI0U3loK2NDZG43bkF4QWdKWVV6cTFWRVdvWEt3S2cwcmxjNVVFWmtEU1Fs?=
 =?utf-8?B?azBGeDBkQ1MwZUNGM1RyeThoNEd0VUQ5U1BHSDlzWUV5aGJlcDRpTUpZNEx1?=
 =?utf-8?B?eFJaVHBZTDcvOTVOWWJWa1BiT3pWWm1CeFc3WW02QTcwdmJ0T0dHSXdick9K?=
 =?utf-8?B?TWZkdWlGY3ZEbjVlMUd6NXNIYVBMSHMwM3c5UVB0dW9rejdmUGk4VGc0MmFT?=
 =?utf-8?B?L0FCcjhWOWhocWpzbmROU1BlVDhVZS91aExhNWhKWlFBVmtnZkUvUVNJdzNj?=
 =?utf-8?B?NFJoUTRzeW91SG1IWHIxcCtOZEVaU1VYVXUrTGdxcUE5cnZHWGJRbmN3N0Iv?=
 =?utf-8?B?UXo3WHM3bnV2Q1M5UmZTbnRrNm1DcW5ZNWlWcUFlZGpUVHIzU2JOUjlUZG40?=
 =?utf-8?B?Mjh6K3ZkRm5xdTlNM2hzZWNLU2N3UnVJUjR5bTVDak85ejhlekxpUm5yWlFS?=
 =?utf-8?B?S1o5R3lEc0dCOTduVGNUZUVTVzlZMHIyZEpmZDYyWEJvZGVmNEd0bW5kdFBM?=
 =?utf-8?B?bUhXL0ZaclRJajV4d3hGbGJ1SHNGdkxwQkp0ZjJraWFIamxVZk12RXFvUVhD?=
 =?utf-8?B?aW16UmhFTWlYSDVLeGFNa05lTkVqREQrVlhnNWFxSDdSSjNOZXlndHg0aS9T?=
 =?utf-8?B?SlM5RisrQUlibTYza05ZV1V0UzVldFlRdVp5ZERBTmxnaFdEcWkydU1TdEVh?=
 =?utf-8?B?ajdCS0tCeEVnZ2Q5bmsrWWxpRFVIN1d5SldIbEhjNldYTGhWcEZiK0t3Q0Fq?=
 =?utf-8?B?cWU3Mi9nS1lsa0dRb3RHa2pybk1MMG1RRDNUOS9Va0NaSVAzZ0ZpZHBFdndm?=
 =?utf-8?B?b2FVV1djUHJnWjc0K2UrV0pvRnZ0UUljK0g5ZjJXNmxQV0VqcExSMGp4NHNa?=
 =?utf-8?B?MDgvY1hmL3NxTWdpQWs0bFRmZzROdzhWVXFaSG94NmhWd3NrVHhBZmVxa205?=
 =?utf-8?B?Ykkyczh5RVJqcUhXNTdBaGhEUG5qVDhiMDQ5TTIrYnd3L1NacFVaTlE2Y3dQ?=
 =?utf-8?B?eCsvZTNLQXlsZWdRYmtQVy9SQndmNWhqOHRaYmpiSEVQTXlQejlSRG1Qb3RK?=
 =?utf-8?B?U0N0cCtHT2ZTT1ByWlVHOUNEU3R6TkNVMVRTOE9XQk1oNzkyOWJHRXhaUjFs?=
 =?utf-8?B?dm9wU2RZanF1bXBGaDJjdzB4TFlWbkFVU1N2OGJGa3R3Y0JLZWNWVnp6alZ3?=
 =?utf-8?B?cjBJS1RnRlBOU01uL0NmWkV3WU5MVW50UXdZMFNQZkJwcjI4NitTV1picm1U?=
 =?utf-8?Q?0FyqEpAN94oD/iW9fTsuPYceP1Obi+tgNCgcPTX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjNuOWk0YkpKZWkyWFdsQkNoc2hldUNDZ01CZ2krdW1MUE9LRTRXalZ2S2dr?=
 =?utf-8?B?Yyttc0lzcEZvMElibW96WFgwVXhSVlNtQkIrbzl2YzVGSzZIR2ZOWWFiMkJL?=
 =?utf-8?B?azNrTk9pa1U5SXlOZ211TlBzc2ptbU8rVFNBeHo1V2g0b2tVWUh0UVpyNjlY?=
 =?utf-8?B?SmlrZGlSTlFDaFdxWTU0K2NUNlo2YVNkQ3MvZlh4Q0hNejFROEZHZWthdWx4?=
 =?utf-8?B?dTdOcmdESXFPK0YwNDhQK01qdmVZbXNLN3FnQVROYnBQQjhDa0h5L0NpbDk0?=
 =?utf-8?B?QmxWWGlMOWJzeUVVc1dPcDI2a2FjbEtsZU81dVlUTGpaKy9WdzJTaEtWblE4?=
 =?utf-8?B?TTRCVUIzaHBqNFVRWlFBL3BuYUxUYTM3V2pxMExwS0RLODBLdTlXei9yTDgw?=
 =?utf-8?B?ck00ekllNUZJOXVMbjRGQTZCb1V2TEpkTmZmRTErUTRVVHQ5RlR6OXh3VXdt?=
 =?utf-8?B?ek1ZLyt5NzIrNlM5aVZxRW5xc2JIYklHRVNuNjhweFJtUE5IbzB2TTlSRlNB?=
 =?utf-8?B?cXo1dGZPK1BrL1QrLyttTnJPOFM2VTdNRXptdzVHS0xSSktETVRndVlhRGN4?=
 =?utf-8?B?Ym1ITXlNMFVLZEZ5TW8xVkZJTFlxQmdYNklaeXMxU1hTS21GTXRzcVoyTUhZ?=
 =?utf-8?B?NFRkd3NXWnExWTZrUTdvUGdnQ1NxZFAxNHdtVTJ0NkIvZGR0RnNsVlFkUjFy?=
 =?utf-8?B?cFZhc2dYVnlaYzgwd1BSTGg3QTVDeWJVN20zZkd5VlVNSkVaV1lka3k5M2Rn?=
 =?utf-8?B?RkpyRW5KWENiR2NGQml6dXBYSmpMMzlzdE9XS3duRnF0ZUdrejNvbjdPNytz?=
 =?utf-8?B?NnZaTFpxRWdsT2w0VmxHMkx6d01acFZVQTJaUzd0eFFGM3loNUQ2MUMxL1Rl?=
 =?utf-8?B?UkhZdDJXWjhZbnVIZTlWVVI0SEoxWnNnZWhlMnRURkhVR3ozS2taMFJRS0Q4?=
 =?utf-8?B?dFFaMEc5MjdPTEx6ci9SN1VDNHBHamN4NzNETDBzTG9nZnF3bHdabXF5NmVG?=
 =?utf-8?B?d0g5WGJYd2hVK3pTbXhMdVd1VmtCV1g5V2Q1SkViR0dxYkNIQ2F0S3N1MVNN?=
 =?utf-8?B?c1gzazBZdVZKVDNZcWxFYkoxcXl2Ulo3bi96Y3ZtczZjdEh4OS9NUDFyZ2lv?=
 =?utf-8?B?ay83OHB6K1lDbHZmMWE1K0w4enFmRzZZSFY2blE1STU3SVJ1Sld4WHppRXlF?=
 =?utf-8?B?bDczcWwwbFM4Z1lweVNOOUlBWGxtaUxVbDhTdGZHd0ltdFRKYVVyTnBQaEli?=
 =?utf-8?B?VUF3TkxseEo2dnpqdGxINzQ2VW1Ha3Q1K3RMeUlOQXZEQzlFaXZUR1RDdlhG?=
 =?utf-8?B?TjdxYmpvYk00MzRoT2taSCtHRVpqQ3NFR2N1SHZwM1hYRHJ2MDZYQlEzMWRn?=
 =?utf-8?B?RWdXanJrdjNGWktGMXE4Y0Y5Yk1iZnBUdFJ0MlBGdmpyUGV0SU5ickZGZjU5?=
 =?utf-8?B?cWl3SkxyUWRvNXR4VDc1ZWJDU3Y0YllyS3kzTWlmQzdnL0lObStCNy9OZTN4?=
 =?utf-8?B?WnRZNy9PVm0xM0p5Y2l6b0drZE1ZZkRDOUwwQ0JBR0RQdlRFbGNrSnRaS1hU?=
 =?utf-8?B?ZUlidGFOSEI5dWFKT1V5b3F4eDl1RitrSTdoeXc5WWFsVThuRG9mYkZQVlMw?=
 =?utf-8?B?aVkxOWRsbDlrdDB3b3duVWp1ZGZEVTVKbUNiUjdjUm5ONmlJV2Z6ZW5VMnF6?=
 =?utf-8?B?c1FpRDE4Rk5oNWhqSys0SEtlajhrZWVmNnk4cVQvVXp3b3lRTGxnWDdJeG00?=
 =?utf-8?B?VWVwNEttSSs5Z3BkOGtuWVlnZmREM3ZYV21XakJ2MlJqdTB0WFNwK3Y1cVBE?=
 =?utf-8?B?b2ppZ0hnTmIyeGxYUjdXeWxUSTNJMFdmVm5xVVZDWUZiNXc3TWRxN3pXVmIz?=
 =?utf-8?B?cUdyL2RmRWFMOXpUSU14TEpJTEVIbjVjTFJxOWdFNEtGcXZVaDRYa3NCeVov?=
 =?utf-8?B?cld0dGs0ajhhV055RDJzRG0zd3FCUTdZeFFQYW0rMExSR0NhdVcrVm5DZ0gx?=
 =?utf-8?B?TXkwQkI4dnhvMUZBVHNoQmlQTWtOYlV1RHRzTDlJUVVQUHRSUnlMaHFVSnFU?=
 =?utf-8?B?RE9heitNWDB1Y0VMRU54aWRBQUs2K0lVVTV6b1RSNkV1RkFBd0hTSWl4RERZ?=
 =?utf-8?B?MkpmVmZhL1N3VTVPRVJsSlBCRU9sYjZPYVppUTdYdlZVc0JaR3lmT2J3dE1x?=
 =?utf-8?Q?xO0Xb56OCm42D83pXpSuOm4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 027ac57b-0dea-4655-a1fb-08dcfec1543a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 00:15:47.6393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLRzMPYlp2sk/TXna8tMW5eMAxL2Ugt1gQ1XGEiErAKkILUNBs4eW34fo0gfAoAH3LGtSWUAO1fTq6AzJGcCsyNq/wApGEWCCZwhfrmNqIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7443
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


On 10/7/24 13:05, John Harrison wrote:
> On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
>> After a session is terminated, we need to inform the GSC so that it can
>> clean up its side of the allocation. This is done by sending an
>> invalidation command with the session ID.
>>
>> Note that this patch is meant to be squashed with the follow-up patches
>> that implement the other pieces of the termination flow. It is separate
>> for now for ease of review.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h |  12 +
>>   drivers/gpu/drm/xe/xe_pxp_submit.c            | 215 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pxp_submit.h            |   3 +
>>   3 files changed, 230 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h 
>> b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
>> index f3c4cf10ba20..4a59c564a0d0 100644
>> --- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
>> @@ -49,6 +49,7 @@ struct pxp_cmd_header {
>>       u32 buffer_len;
>>   } __packed;
>>   +#define PXP43_CMDID_INVALIDATE_STREAM_KEY 0x00000007
>>   #define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
>>     /* PXP-Input-Packet: HUC Auth-only */
>> @@ -63,4 +64,15 @@ struct pxp43_huc_auth_out {
>>       struct pxp_cmd_header header;
>>   } __packed;
>>   +/* PXP-Input-Packet: Invalidate Stream Key */
>> +struct pxp43_inv_stream_key_in {
>> +    struct pxp_cmd_header header;
>> +    u32 rsvd[3];
>> +} __packed;
>> +
>> +/* PXP-Output-Packet: Invalidate Stream Key */
>> +struct pxp43_inv_stream_key_out {
>> +    struct pxp_cmd_header header;
>> +    u32 rsvd;
>> +} __packed;
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c 
>> b/drivers/gpu/drm/xe/xe_pxp_submit.c
>> index 3b69dcc0a00f..41684d666376 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
>> @@ -15,9 +15,13 @@
>>   #include "xe_gsc_submit.h"
>>   #include "xe_gt.h"
>>   #include "xe_lrc.h"
>> +#include "xe_map.h"
>>   #include "xe_pxp_types.h"
>>   #include "xe_sched_job.h"
>>   #include "xe_vm.h"
>> +#include "abi/gsc_command_header_abi.h"
>> +#include "abi/gsc_pxp_commands_abi.h"
>> +#include "instructions/xe_gsc_commands.h"
>>   #include "instructions/xe_mfx_commands.h"
>>   #include "instructions/xe_mi_commands.h"
>>   #include "regs/xe_gt_regs.h"
>> @@ -307,3 +311,214 @@ int xe_pxp_submit_session_termination(struct 
>> xe_pxp *pxp, u32 id)
>>         return 0;
>>   }
>> +
>> +static bool
>> +is_fw_err_platform_config(u32 type)
>> +{
>> +    switch (type) {
>> +    case PXP_STATUS_ERROR_API_VERSION:
>> +    case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
>> +    case PXP_STATUS_PLATFCONFIG_KF1_BAD:
>> +        return true;
>> +    default:
>> +        break;
>> +    }
>> +    return false;
>> +}
>> +
>> +static const char *
>> +fw_err_to_string(u32 type)
>> +{
>> +    switch (type) {
>> +    case PXP_STATUS_ERROR_API_VERSION:
>> +        return "ERR_API_VERSION";
>> +    case PXP_STATUS_NOT_READY:
>> +        return "ERR_NOT_READY";
>> +    case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
> Is it not worth having a separate string for this error?


Not really, the aim here is to communicate that the platform doesn't 
have a valid configuration (which in theory should never happen without 
a debug bios), it doesn't really matter which specific error it is. We 
also print the error code anyway.


>
>> +    case PXP_STATUS_PLATFCONFIG_KF1_BAD:
>> +        return "ERR_PLATFORM_CONFIG";
>> +    default:
>> +        break;
>> +    }
>> +    return NULL;
>> +}
>> +
>> +static int pxp_pkt_submit(struct xe_exec_queue *q, u64 batch_addr)
>> +{
>> +    struct xe_gt *gt = q->gt;
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    struct xe_sched_job *job;
>> +    struct dma_fence *fence;
>> +    long timeout;
>> +
>> +    xe_assert(xe, q->hwe->engine_id == XE_HW_ENGINE_GSCCS0);
>> +
>> +    job =  xe_sched_job_create(q, &batch_addr);
> Double space.
>
>> +    if (IS_ERR(job))
>> +        return PTR_ERR(job);
>> +
>> +    xe_sched_job_arm(job);
>> +    fence = dma_fence_get(&job->drm.s_fence->finished);
>> +    xe_sched_job_push(job);
>> +
>> +    timeout = dma_fence_wait_timeout(fence, false, HZ);
>> +    dma_fence_put(fence);
>> +    if (timeout < 0)
>> +        return timeout;
>> +    else if (!timeout)
>> +        return -ETIME;
>> +
>> +    return 0;
>> +}
>> +
>> +static void emit_pxp_heci_cmd(struct xe_device *xe, struct iosys_map 
>> *batch,
>> +                  u64 addr_in, u32 size_in, u64 addr_out, u32 size_out)
>> +{
>> +    u32 len = 0;
>> +
>> +    xe_map_wr(xe, batch, len++ * sizeof(u32), u32, GSC_HECI_CMD_PKT);
>> +    xe_map_wr(xe, batch, len++ * sizeof(u32), u32, 
>> lower_32_bits(addr_in));
>> +    xe_map_wr(xe, batch, len++ * sizeof(u32), u32, 
>> upper_32_bits(addr_in));
>> +    xe_map_wr(xe, batch, len++ * sizeof(u32), u32, size_in);
>> +    xe_map_wr(xe, batch, len++ * sizeof(u32), u32, 
>> lower_32_bits(addr_out));
>> +    xe_map_wr(xe, batch, len++ * sizeof(u32), u32, 
>> upper_32_bits(addr_out));
>> +    xe_map_wr(xe, batch, len++ * sizeof(u32), u32, size_out);
>> +    xe_map_wr(xe, batch, len++ * sizeof(u32), u32, 0);
>> +    xe_map_wr(xe, batch, len++ * sizeof(u32), u32, 
>> MI_BATCH_BUFFER_END);
>> +}
>> +
>> +#define GSC_PENDING_RETRY_MAXCOUNT 40
>> +#define GSC_PENDING_RETRY_PAUSE_MS 50
>> +static int gsccs_send_message(struct xe_pxp_gsc_client_resources 
>> *gsc_res,
>> +                  void *msg_in, size_t msg_in_size,
>> +                  void *msg_out, size_t msg_out_size_max)
>> +{
>> +    struct xe_device *xe = gsc_res->vm->xe;
>> +    const size_t max_msg_size = gsc_res->inout_size - sizeof(struct 
>> intel_gsc_mtl_header);
>> +    u32 wr_offset = 0;
>> +    u32 rd_offset = 0;
> The intialisation is not necessary here. rd_offset has the appearance 
> of requiring it but doesn't really, and wr_offset is re-assigned 
> almost immediately.
>
>> +    u32 reply_size;
>> +    u32 min_reply_size = 0;
>> +    int ret = 0;
> Also not necessary to be pre-initialised.
>
>> +    int retry = GSC_PENDING_RETRY_MAXCOUNT;
>> +
>> +    if (msg_in_size > max_msg_size || msg_out_size_max > max_msg_size)
>> +        return -ENOSPC;
>> +
>> +    wr_offset = xe_gsc_emit_header(xe, &gsc_res->msg_in, 0,
>> +                       HECI_MEADDRESS_PXP,
>> +                       gsc_res->host_session_handle,
>> +                       msg_in_size);
>> +
>> +    /* NOTE: zero size packets are used for session-cleanups */
>> +    if (msg_in && msg_in_size) {
>> +        xe_map_memcpy_to(xe, &gsc_res->msg_in, wr_offset,
>> +                 msg_in, msg_in_size);
>> +        min_reply_size = sizeof(struct pxp_cmd_header);
>> +    }
>> +
>> +    /* Make sure the reply header does not contain stale data */
>> +    xe_gsc_poison_header(xe, &gsc_res->msg_out, 0);
>> +
>> +    emit_pxp_heci_cmd(xe, &gsc_res->batch, PXP_BB_SIZE,
>> +              wr_offset + msg_in_size, PXP_BB_SIZE + 
>> gsc_res->inout_size,
>> +              msg_out_size_max + wr_offset);
> Is this correct? It is passing in the batch buffer allocation size as 
> the address. Shouldn't there be some kind of base address included? 
> The in/out buffer is after the BB in the same allocation but that 
> allocation is not guaranteed to be at address zero, is it?


It is guaranteed to be ad address zero, because when we call bind_bo() 
we specify the address. I can make that a define if you think it'd make 
things clearer.


>
> Also, it would be more consistent to use 'wr_offset + out_size_max' to 
> match the input calculation rather than flipping the terms around.
>
>> +
>> +    xe_device_wmb(xe);
>> +
> Might be worth a comment here to say why retries are required and how 
> many/how long is expected normally versus worst case?


will do.


>
>> +    do {
>> +        ret = pxp_pkt_submit(gsc_res->q, 0);
>> +        if (ret)
>> +            break;
>> +
>> +        if (xe_gsc_check_and_update_pending(xe, &gsc_res->msg_in, 0,
>> +                            &gsc_res->msg_out, 0)) {
>> +            ret = -EAGAIN;
>> +            msleep(GSC_PENDING_RETRY_PAUSE_MS);
>> +        }
>> +    } while (--retry && ret == -EAGAIN);
>> +
>> +    if (ret) {
>> +        drm_err(&xe->drm, "failed to submit GSC PXP message: %d\n", 
>> ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = xe_gsc_read_out_header(xe, &gsc_res->msg_out, 0,
>> +                     min_reply_size, &rd_offset);
>> +    if (ret) {
>> +        drm_err(&xe->drm, "invalid GSC reply for PXP (err=%d)\n", ret);
> Should be %pe for the error code?
>
>> +        return ret;
>> +    }
>> +
>> +    if (msg_out && min_reply_size) {
>> +        reply_size = xe_map_rd_field(xe, &gsc_res->msg_out, rd_offset,
>> +                         struct pxp_cmd_header, buffer_len);
>> +        reply_size += sizeof(struct pxp_cmd_header);
>> +
>> +        if (reply_size > msg_out_size_max) {
>> +            drm_warn(&xe->drm, "caller with insufficient PXP reply 
>> size %u (%ld)\n",
>> +                 reply_size, msg_out_size_max);
> I would maybe go with 'reply size overflow'. Took me a moment to work 
> out why 'size > max' becomes 'insufficient reply size'.
>
>> +            reply_size = msg_out_size_max;
> Is it useful to return a partial message?


The caller can check the header and see if there is any error set there.


>
>> +        }
>> +
>> +        xe_map_memcpy_from(xe, msg_out, &gsc_res->msg_out,
>> +                   rd_offset, reply_size);
>> +    }
>> +
>> +    xe_gsc_poison_header(xe, &gsc_res->msg_in, 0);
>> +
>> +    return ret;
>> +}
>> +
>> +/**
>> + * xe_pxp_submit_session_invalidation - submits a PXP GSC invalidation
>> + * @gsc_res: the pxp client resources
>> + * @id: the session to invalidate
>> + *
>> + * Submit a message to the GSC FW to notify it that a session has been
>> + * terminated and is therefore invalid.
>> + *
>> + * Returns 0 if the submission is successful, an errno value otherwise.
>> + */
>> +int xe_pxp_submit_session_invalidation(struct 
>> xe_pxp_gsc_client_resources *gsc_res,
>> +                       u32 id)
> Is this really over 100 columns if not wrapped?


nope, will remove the wrapping


>
>> +{
>> +    struct xe_device *xe = gsc_res->vm->xe;
>> +    struct pxp43_inv_stream_key_in msg_in = {0};
>> +    struct pxp43_inv_stream_key_out msg_out = {0};
>> +    int ret = 0;
>> +
>> +    /*
>> +     * Stream key invalidation reuses the same version 4.2 input/output
>> +     * command format but firmware requires 4.3 API interaction
>> +     */
>> +    msg_in.header.api_version = PXP_APIVER(4, 3);
>> +    msg_in.header.command_id = PXP43_CMDID_INVALIDATE_STREAM_KEY;
>> +    msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
>> +
>> +    msg_in.header.stream_id = 
>> FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_VALID, 1);
>> +    msg_in.header.stream_id |= 
>> FIELD_PREP(PXP_CMDHDR_EXTDATA_APP_TYPE, 0);
>> +    msg_in.header.stream_id |= 
>> FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_ID, id);
>> +
>> +    ret = gsccs_send_message(gsc_res, &msg_in, sizeof(msg_in),
>> +                 &msg_out, sizeof(msg_out));
>> +    if (ret) {
>> +        drm_err(&xe->drm, "Failed to inv-stream-key-%u, ret=[%d]\n",
> Would be clearer to say "failed to invalidate stream-key-%u"? The 
> message current reads as "failed to <name-of-variable>" which doesn't 
> make much sense. Same comment for the other two prints below.
>
> Also, %pe for the return code?


Ack.

Daniele


>
> John.
>
>> +            id, ret);
>> +    } else if (msg_out.header.status != 0) {
>> +        if (is_fw_err_platform_config(msg_out.header.status)) {
>> +            drm_info_once(&xe->drm,
>> +                      "PXP inv-stream-key-%u failed due to BIOS/SOC 
>> :0x%08x:%s\n",
>> +                      id, msg_out.header.status,
>> +                      fw_err_to_string(msg_out.header.status));
>> +        } else {
>> +            drm_dbg(&xe->drm, "PXP inv-stream-key-%u failed 
>> 0x%08x:%s:\n",
>> +                id, msg_out.header.status,
>> +                fw_err_to_string(msg_out.header.status));
>> +            drm_dbg(&xe->drm, "     cmd-detail: 
>> ID=[0x%08x],API-Ver-[0x%08x]\n",
>> +                msg_in.header.command_id, msg_in.header.api_version);
>> +        }
>> +    }
>> +
>> +    return ret;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h 
>> b/drivers/gpu/drm/xe/xe_pxp_submit.h
>> index 4ee8c0acfed9..48fdc9b09116 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
>> @@ -9,10 +9,13 @@
>>   #include <linux/types.h>
>>     struct xe_pxp;
>> +struct xe_pxp_gsc_client_resources;
>>     int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
>>   void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
>>     int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
>> +int xe_pxp_submit_session_invalidation(struct 
>> xe_pxp_gsc_client_resources *gsc_res,
>> +                       u32 id);
>>     #endif /* __XE_PXP_SUBMIT_H__ */
>
