Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ABCC25B77
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 05:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A4410E04A;
	Wed, 15 May 2024 05:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N94U/kZC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D50010E04A
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 05:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715749351; x=1747285351;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WfzZpTMeWF+I0INjUHPVc5ukz59EUzmjfOlYiQr5TJI=;
 b=N94U/kZC53Uawb36ZWJ89lDsLGpLPnbbezTVYCLlIK4Ca0KkA7ubvv44
 TiHYC6BH4MJ91kXX8UKvD+rCkYluOlJK/7xHp84tvb67Ifn8PZEZH2MyX
 19DLpIK82evc4Q9j8C1trchbkt5pMPdTDTodSQH2TzrCyMqnIGbVORPqC
 3L9BwOzbdnx2z7MozSsfaLiO3YFonZQ9nSMPEo0N1bjAN1CoCvwgJDpnJ
 7J79ZZGpyyiyT6LAIAeUKXsGmkBXXV5RjwCD0u1GIrUu8KFi8g+XMKQR/
 XhMuOEAKiAuczWCu9uCErE5bb3QIRiG3Hei2mGonKeiRRLgTYHt/+2tVy A==;
X-CSE-ConnectionGUID: kamH7cVQQaeq6UCea6mzxg==
X-CSE-MsgGUID: y4EAJomHSHOp9fBEIKUodA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="15598691"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="15598691"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 22:02:29 -0700
X-CSE-ConnectionGUID: HY7KgX+oRCCet0jaLS6G3w==
X-CSE-MsgGUID: qNTOXbNMQPOzhJGKPiRcjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="35717511"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 22:02:29 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 22:02:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 22:02:29 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 22:02:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVFgL0+nxjVhAZv4DZujuR/MqCh+q891y05a1OtBDzoRlV9QnZgwbTr92jSMVJU0CLK/WwShIl81MVZZG+3OyRW4LDZtfGsVjQp+p86W3METkSvs9oyOaYYEyNNDd8AJSO11M+ygOSdrA/lti5ZgREx0o8aFFUN2gRTchEEcY7HalQ/Bly7u3lGYWrC+z1maOsOClvcKzXxhu4OfDFizB+6/CcD/GHuUI1vILy8L8cnVKVHPEStJvOwWbRFpu/wM0dJz0gfdc7cXqCMDtsx9LARfVe85svCqseu0VVejSJQGukc06pS1/v9YthUcsbahRp0pckrhV7BihXWwUzEhQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UF7xI+m76jN2kMQ1T8s8/vjMl60YAWLDvHE6QaEwHTg=;
 b=MlJ0wKqXy82rFx2H4m/NcmzYswNiilfdBS7SUOSsdOYyB0CNypITYX01UIzv4r61Bs/SGxHkwkYuXsFBvKPP3hdR2Ya86qviF8Df2hrAzzDnjl2mKgPWhwjz5lJ6vXu5r7w2ZI3mh8Vz8luBzM9Oo5sMSq2iqKLjWd3ChBYDWlPYgtuOY0eh+hYDfD34fQiWPhi/6oGuB4yPDLetzVUbSXXBLNxGaEysAFKeLsgkA/fhYT4khEwF8NXsbUEkCQSBU8sj9THtkbZB0D31Jk0dBQ78uWG6Q/CcdCzZRT8qKAf8gTlicE0cXlxt9OLdv4w5ulHuz3OnkmwgJyeHKF7otg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7204.namprd11.prod.outlook.com (2603:10b6:610:146::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 05:02:27 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::301e:5fa8:50a3:3824]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::301e:5fa8:50a3:3824%3]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 05:02:27 +0000
Message-ID: <405b41a3-0b76-458f-84f0-295a3cb7f78f@intel.com>
Date: Wed, 15 May 2024 10:32:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: change the power gating register names
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20240514064309.3819722-1-riana.tauro@intel.com>
 <20240514064309.3819722-2-riana.tauro@intel.com> <ZkQlAj0h4v1s1u9I@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZkQlAj0h4v1s1u9I@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::23) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 0075d495-92e9-47c6-c6b6-08dc749c371e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWNUQ1c0SkpWa2lMRVBQYmxwRDB5ckxnTStYa2ZnNjdkYWd0aEZWdnV4ZktB?=
 =?utf-8?B?KzhtUHBNN3NCUEViQWtveEFBak1mWDd0ckk4SHNVMVUzdDZua1JuMjVZRGh3?=
 =?utf-8?B?clNTRit6am41SVJybVdldVcrK3loQVhObkpkNHJLRVg2MmdXM0ZGUXpaRHNL?=
 =?utf-8?B?akdIb0JXalJGWkpZNGRra1dkaWNTTWpmTWZRTmc4Vk5xNDBiMlROT21kcDZ0?=
 =?utf-8?B?RjBYN1VqbjVDYWpyNVdib0pOaUFNN1crSkR4NXY5OE04bkFmMUYxdnVuWjBY?=
 =?utf-8?B?OWJKbkFyUEk2cUdlUzNndEpMQTNZQ2U5bVU0ZVFJTXNOS3F5QVF4enE0YUh4?=
 =?utf-8?B?NlJZSDR2a0lEcUVQYW5NTHRGZFZLT3VaandiakxIS2tpQjhOTmNKT1RDbGcy?=
 =?utf-8?B?OWViVjJlQkxNSjFKR3ZHZjNVZkU1bjc2V1c0SEIraG9JS1ZmN2lLZGE3MWZm?=
 =?utf-8?B?TjlYQk5JR3Fka1lQUmpqSnk1K2U4RURGRDRwMWd6dzhhRktvQUZNWUNQUFVk?=
 =?utf-8?B?ZU51d0FYQzlxT1lvNFE3bjZhekFYYXJMcXVWcE1XZlIrcDBhRWhyZFhMcFFG?=
 =?utf-8?B?R2dGS0RHT052ZEVxL2hTbzI5blMrdkhxdnlaV0Q4WGdvLzcwbVVCTUo1d2k5?=
 =?utf-8?B?M0FOemR2SzF5ZDBYd25vcklVTWdvZWxyZ2F6ZWg0Si82alh4VWJ0QmxMV2tz?=
 =?utf-8?B?bzkvbGN4NjRJTkIxdk4xSlZzVDVQUVNWMkY1ems5MSs0ZmlnemtHTGRmTW01?=
 =?utf-8?B?ZW16ZmZwN1dUTytZMjFBZ1pBUmJIdldrL21GRlBpdE5pL1F5Sk16NXpaV1ZZ?=
 =?utf-8?B?SWpDeCtvZmdiSE1iNHVHSjVKQS9ydzNaRFpTVUJPKzg1LzNzd2RDYTFHVk9G?=
 =?utf-8?B?Y2kzU3JIZ3JxL24rT2VJUGlCR3NaazZndFJ1RG92UHdpRWZYMTBIZmt1ZENV?=
 =?utf-8?B?OE9uYmg5VG1GOTEwMnc3eXh6eFlsTEtYajA1VnlvRnM5akNkQnFrcHhiallS?=
 =?utf-8?B?dlo4bEFuWkNOR3ROdS91ZnV4YW9NeGhueFN5aGQvVU9FRlRUYm1PZVJrMGM3?=
 =?utf-8?B?N0U2WHpEck5rd0h2bXp5Yk1FeEZPaXhzS1BUREZ3S0pYaS9EampZeHNYTFZa?=
 =?utf-8?B?dGs2Z1dBSWxqclhpRmlyNzFLcm43bXNCTlhQTEtBNnpSOWR1a283dTBXZ1RC?=
 =?utf-8?B?VHBLc0ZnaDAzWVhqVEhxU2JkWWlXOUpGRk1kMXdwZ3dYVU1OdGZSMGZJSjVH?=
 =?utf-8?B?YVlISVhqNXJjTTlLclY1MUlBdVY0Smw4Umd5VzV2dVZ1QzBGd0FIRDFhUUlu?=
 =?utf-8?B?UWVwNzBVYlZxcFNBL2J5VWQzMjhJSHFaMTBQdEV0UzZjUU9XY1lsQkw3Mkh4?=
 =?utf-8?B?Q1h5bGV1MVZPVkFYVnJyYkFPMXFZN3FNREdaNExoeTh2R2EySE9DOXl4djhi?=
 =?utf-8?B?NUlSSXdhUTNMcjJ6RGhiMzVybGJwNzFXMmNkS1dvTkpWRjkyR3dOWFd3RjFk?=
 =?utf-8?B?bnJpaTBUeFN1aGl3ek5NcE5zRUZEN1Jzb2FrOE9qeXBxUmtaOE1COGtpQkRN?=
 =?utf-8?B?TUpsZW5OVmw1VlEzMVlOQWdhUjBtekhhakZBRVN3Q0ZkSTRZT0lqa3VQcWVv?=
 =?utf-8?B?NXU3aHhQOEZ5MjlPNmc4ODk0M1lmY29XK3czZ1VYSmlWc05RZm1Ba29oWGNO?=
 =?utf-8?B?b000dFFiTmhyR0ltbFNRbnBDY1grY3pORDJ2d2NqSDBoaEdqamxvZXNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlFPNnVCbjlxamNkdzgvb21UOXF1VStQeW0vTDdqTG1yTTVOaVduTzFJS1Mz?=
 =?utf-8?B?MDhUZzhRQ1FKNjh5MmdrRit5ZnNQZTIzUjZub3hKK1ZrZ2kvOG9RZFFRVitZ?=
 =?utf-8?B?b3R3d3VMT3dHQ0VXVWNjZjJlUDdPUklNYzNsVFNzOGZNT2lXRUk5NThvMkZL?=
 =?utf-8?B?MGdiaU54Wi9qbWppN0RkcjFoRnkwdWczL1dFM3BmeWljazBrSkJKU1hnMzli?=
 =?utf-8?B?a0JuWHJHcU1QTUwzaHJQYitoejhHWmg5RytJMHBpVTdNNVhVR3AxaWVjUWpw?=
 =?utf-8?B?MXZoVU9oOHRUbzNocEdPM0dTNE5SUWtHdHYxWmdST1ZuNVVzUjNaMWFIV3di?=
 =?utf-8?B?Q2toeGk2L2dGOENMZ2VaNGhBbWl0Ykl2ZFpMcmNLam9aSXZOUFBKSWRrbWVK?=
 =?utf-8?B?Y1g1cDJuR0FXUkZJQ2ZkeGhySXI4V1dpMW1NNFlRSGRaRWM0ekZrbFhKQ0I5?=
 =?utf-8?B?amlESWdtaEVOK25oY29PMGlReXYrVm95UWFwVFpvaWFyb2ozSlBsZThCQjkz?=
 =?utf-8?B?dVdIRGhxMmNSRHh6ODlXVmU4ODN6dXh6ekxpVHlUd1crVkR3TU5IS3JWVldr?=
 =?utf-8?B?TkhGb1hoaVQwZlRFbWpHUGRQeGZia1A1V25DQkdNRjQxbXpZdUN1S0puY2c0?=
 =?utf-8?B?NzE0bjA1MTNHME5vaC9RcnJ0Rms5YmxVNHJrQzZ4YjlpSGFyT3R6M0dyWFVF?=
 =?utf-8?B?Q09wMjNKRlhERmRqWHZoc2pYNTV1SHJkbis3QkgxRE9rNHZKLzliV2JMeUhx?=
 =?utf-8?B?ek90eU9naUxzdXpKL3F0cEpWU0NEY1dQTGtUSDlScEVacVBXTkhUa3BleHNs?=
 =?utf-8?B?RllpV2lXVnpGS1loMlRaS3lHZENUMkJqcWNYSWcwOFhnejJETjRPQ0R0WVN4?=
 =?utf-8?B?ZUZ3cFFINUxTNEdNZStaL3cyYWJSS0pvUmtpNERrWjFJdTdHNGJ0cUt1aWJY?=
 =?utf-8?B?STVoakl4WktqS3RaRFVVRmpyZkNhOEMzM3kvUUJXWm4weHVCcXVKd3FJTHNo?=
 =?utf-8?B?U3ZLN3dGVUV1dDFHRDdkTUZucnlqV1EycUNRMm41NldCYTJQSklqU2VqQW1T?=
 =?utf-8?B?Sjl0YzcvVHVHTlU2UGRSYUhiZHQyakE2N3dPNUpzaE9STHZETzlPT2xOWWlh?=
 =?utf-8?B?SExicGw5YXFueEgyaEgyZFRRS0xsQUhyRk01VkVqckpvamk1VmxhT2Y1SHFo?=
 =?utf-8?B?dldIcU93M1QvaHMwbVhCbkJ1RXVzbHlqNTEvNlovVC9GQVVqdW9kU0dnclZU?=
 =?utf-8?B?V0U1ZDVBcXhIMHNqOFg3emMrTDhQbjd3MGloTjlYY2VZMG95bmtZSEp5ZXp6?=
 =?utf-8?B?Mk1PZk92dXFZY0cwZ21Fc2kwTGpSbTVsTlRkcFA2TUFXZHFIOFo2REtqYkZP?=
 =?utf-8?B?OFpXVWNFWEtlU3ZvdXdDUFlEVnJDLzFEL1lEQWQ1d2pYQzNKckpHcTVhRCtB?=
 =?utf-8?B?aEw3aGhNTHhZVXI5OGJmZmtNR2VoWEQzYklpeGtJazlRVTNoSVlsbEZSdUkw?=
 =?utf-8?B?OWhQcmRqR0JKUHVuWHFpUGVlUXl0N0tCSUdLaWoxanlOSjdvUGVBbzNLOEJ0?=
 =?utf-8?B?N0c4STZyb3RvdXJaSHN1WEM3VVFJb1JmZmJsRDdUcHdPNkZzSHRQWm5pSXp5?=
 =?utf-8?B?UUVmR0xlclpKbTlMUlhSSzc2MHhCd0I2ajV0bGovc2pqS0RXalJ6ZWdTNmNm?=
 =?utf-8?B?dUMrNXJPQ2JSckJrZUM2UW5MMTFJUmtkbDNzWjVTK0NZakw0WTNuYXpseHND?=
 =?utf-8?B?Z0xpd1FsTTRjeTFpemhBTkdIVE5QZFNyV2FEVWl2bnFNOUlmK1dxNWdnbWpQ?=
 =?utf-8?B?SkkwUE9KOEtiN2hJdjhTdnNvYWJpMVViY2JyWmFjSXZaL1BYMkZSTEZ5eXp2?=
 =?utf-8?B?TDlzaGNTR0EwSVAzNzdybGdHSlRjejcvd2R6SVJER3F0cTJlMnhveUtzZGo4?=
 =?utf-8?B?elp3dWdrVi9nWUdOaEM3OENYbFhpQmtRYnBXSE5UQktuMzBUMU93TU5neFpk?=
 =?utf-8?B?eDF4RHdqOWk2ZmFEaFZJQyt2Q0RKL0FuejdNdXcvWS9vWkxQMHpoZFdTWUtn?=
 =?utf-8?B?TCttN3dIS2dtMVlBY09UU2xzcXBoRUxraXk5bktTZkhoQ0JsUjZEY3p6Y0VR?=
 =?utf-8?Q?IFlxDAYivmEmmjQxeWY25ILdD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0075d495-92e9-47c6-c6b6-08dc749c371e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 05:02:27.1786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+siTtJ14uLdN3r8hqIqgq9nqvKMcBaWhI5Ni83GfDHmoq6w6jj57SEDwgRXmvjAT1QosHpmiLAu594zLlBlZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7204
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


Hi Rodrigo

On 5/15/2024 8:29 AM, Rodrigo Vivi wrote:
> On Tue, May 14, 2024 at 12:13:08PM +0530, Riana Tauro wrote:
>> change
> 
> Probably good to start with Capital letter here and in the subject.
> 
> (not that I follow good standards myself on this, right Francois? ;) )
> 
> power gating vd registers naming to n-form
> 
> reading here I was thinking: What's VD? What's n-form?
> Only after reading the patch it made some sense.
> 
> Perhaps only a message saying:
> "Standardize power gate registers." should be enough.Thanks for the review. Will re-word the commit message

Thanks
Riana
> 
>> change PG_ENABLE to POWERGATE_ENABLE.
>>
>> No functional changes
>>
>> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++-----
>>   drivers/gpu/drm/xe/xe_gt_idle.c      |  2 +-
>>   drivers/gpu/drm/xe/xe_wa.c           | 10 +++++-----
>>   3 files changed, 9 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 9cacdcfe27ff..7c173db7d585 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -316,11 +316,9 @@
>>   
>>   #define FORCEWAKE_GT				XE_REG(0xa188)
>>   
>> -#define PG_ENABLE				XE_REG(0xa210)
>> -#define   VD2_MFXVDENC_POWERGATE_ENABLE		REG_BIT(8)
>> -#define   VD2_HCP_POWERGATE_ENABLE		REG_BIT(7)
>> -#define   VD0_MFXVDENC_POWERGATE_ENABLE		REG_BIT(4)
>> -#define   VD0_HCP_POWERGATE_ENABLE		REG_BIT(3)
>> +#define POWERGATE_ENABLE			XE_REG(0xa210)
>> +#define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
>> +#define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
>>   
>>   #define CTC_MODE				XE_REG(0xa26c)
>>   #define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index a4f6f0a96d05..4384f7e80258 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -202,7 +202,7 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
>>   	xe_device_assert_mem_access(gt_to_xe(gt));
>>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   
>> -	xe_mmio_write32(gt, PG_ENABLE, 0);
>> +	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
>>   	xe_mmio_write32(gt, RC_CONTROL, 0);
>>   	xe_mmio_write32(gt, RC_STATE, 0);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 05db53c1448c..64bc595fc727 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -238,11 +238,11 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>>   	},
>>   	{ XE_RTP_NAME("14020316580"),
>>   	  XE_RTP_RULES(MEDIA_VERSION(1301)),
>> -	  XE_RTP_ACTIONS(CLR(PG_ENABLE,
>> -			     VD0_HCP_POWERGATE_ENABLE |
>> -			     VD0_MFXVDENC_POWERGATE_ENABLE |
>> -			     VD2_HCP_POWERGATE_ENABLE |
>> -			     VD2_MFXVDENC_POWERGATE_ENABLE)),
>> +	  XE_RTP_ACTIONS(CLR(POWERGATE_ENABLE,
>> +			     VDN_HCP_POWERGATE_ENABLE(0) |
>> +			     VDN_MFXVDENC_POWERGATE_ENABLE(0) |
>> +			     VDN_HCP_POWERGATE_ENABLE(2) |
>> +			     VDN_MFXVDENC_POWERGATE_ENABLE(2))),
> 
> For the patch itself everything looks good.
> With the commit message improved:
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
>>   	},
>>   	{ XE_RTP_NAME("14019449301"),
>>   	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
>> -- 
>> 2.40.0
>>
