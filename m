Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F374DC282EC
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 06:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B507210E34A;
	Thu, 13 Mar 2025 06:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jk+WxFha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF4210E34A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 06:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741845660; x=1773381660;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CnarKiQ+cfHs0dQgCZAla0kRmawDwiFsIWemIYzpROs=;
 b=Jk+WxFhaNDQiegPA+N8qNVq6gb4TmbWNKe3Som91I4LuL1mU0PanCKM3
 BffDlDe8vc3nEiNe0A1v0KY/b7/xcgzI/vJZuj1sO300z+ZdqIVcp+fI+
 peMrRILh5Ut8llwqNj9dKDWtxAl949KkBUBlS35TyIVZCwEN6/J2Q2d2Y
 Ut6A2a31IVmIvvFvQYJHXzm/pfw9ZHllKAF5kUIFLn2I4t9YCdNGdFizI
 hQdMWOnIqWgTMhM2ulCuRlRYZAxDBMDfvKDUJFTVs5KYndh3Mx1Wv1mXc
 sQfxIsIXRSNhlrK/N8c7QcRzV1GzrFhH2pKWEnoYq1xqPAH2xh/u/jbtl g==;
X-CSE-ConnectionGUID: ua6+IU8fTXqln1ZE/7fdMg==
X-CSE-MsgGUID: z/AaO+7lTaO+LXsDJlN7xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42827870"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="42827870"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:00:59 -0700
X-CSE-ConnectionGUID: PiKLjhF4TZWrxPm1EEfc1w==
X-CSE-MsgGUID: t+Lg9aHaTySQH/a1JzJMTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="144041742"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:00:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 23:00:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 23:00:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 23:00:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5/jdbFDI8pVmj8zTIKQBIXekbOERJKCS6SbT21XYKl33Ge+oBxnqPEj49Tpf7alyD1DFf/iSz7ZXe7xu2/1d0f/si33TgW0xs0MOIgD30QRYs2/I27dUltQXUW/hNHW1S5ujCLdO1PZ9wUe161rT/A9+IsMDBSSU9QFq+0g1jC8eRQRvSzdv3UJ9sq6rld47VOjBrPzvc5D09LnZz2YdYstXqY2t/eM2qrQ1iQcYu1v9YTzd05bQN495vTtZAPWye7kBLs+BumpdfCQmTk7QMUot9upUmG7mya2KXRCsqeAs4IMuUO5zXn6FyfHfY0xOs/KkvAMrQmgJnb+S3l/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJH5aq9SysYWvijfH479qUCdanjDe70ak/vuvCdCHP4=;
 b=e+AiBOAuMaqoRCo+QNmvIxWzSrxPlPT4TrpwlniXuTyNgoMLJu2kSXGWyWjDQ8AygCiGEQg3gNraMcz+f3zCx3DbGmnDPYvLazruqNQp+D4GIDm1nmlkXAVwXk5gu8K7EHocbNkEKBcp+EkSrFbbIfnL83P5hKUBW9xQUtu8fWKtNnVXNIp4JgEYXTEYzKNBalyGtkpLVLYofyF2qsedwlJOmWz4Iwwx4xoB8ri7vU7Em99d2OxwQoCnNOvCPIwdpXEojf951RWU9/QxgqxTZmAMkcwJfJwWs1yo9hvzHe9Q5TFuzVpIAcZQSoaTVFBgUtfQxXgAGNnIJw9f+cM45A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW6PR11MB8365.namprd11.prod.outlook.com (2603:10b6:303:240::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 06:00:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 06:00:35 +0000
Message-ID: <09a8ae02-bd9c-4466-8c0b-b5e6255a8389@intel.com>
Date: Thu, 13 Mar 2025 11:30:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/xe: Move survivability back to xe
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe
 <intel-xe@lists.freedesktop.org>
CC: Francois Dugast <francois.dugast@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250312-fix-survivability-v3-0-54620dbcbbd7@intel.com>
 <20250312-fix-survivability-v3-1-54620dbcbbd7@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250312-fix-survivability-v3-1-54620dbcbbd7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW6PR11MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: d2acf0ac-685a-4a0f-1c18-08dd61f45f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K01nZkgzZFAxK2d4NmlZblRaVnRxMm1pb215a0FSZ2ZYMlpCcTFnQzRQRGg5?=
 =?utf-8?B?UFpVN1V5azZXalhkc1llQm5LN3hCaWZvRmNZTndOd3ZWbTVQR29nbVRWRElm?=
 =?utf-8?B?MThjSGR6VjFhNGVhNVVsZDlIWTg1ckVEMDNEcllyeWtEV0luUWlhaTQya1RB?=
 =?utf-8?B?Ni9YNTZEb0NTWFRrZWNzU0RlSkRtM1Ewd3JycHRaRElTbXFlWVM2R21WT3Vx?=
 =?utf-8?B?QUdpN2M3YVFMeUtKWjBIQ2hoQVdLU0tmdkx4MGxSTjB5enBhcGlkUC9OZjFZ?=
 =?utf-8?B?Ri9ZRW5iTktXNVp6Q3FZMi9ZeUlCSENvelRzaDBCS0x2UlJFL0NHWkFCd1po?=
 =?utf-8?B?RGZyZStBaEVtWGxlTnUwVjdWYkxRcFR1TW54Q05DdjhIR0tZY0lGeXNuR0Iw?=
 =?utf-8?B?V1ZHbTJmOUhzQjdtSXd0ME00RkhoSTdNYU1McU0wQnBxUml5eEFHcWYyOElz?=
 =?utf-8?B?U3hVNzcvWGVIUldxemFjUVFuVVUzbTE3dEMzZnk0ZXVjSitRVW9oRCtZUzRL?=
 =?utf-8?B?eDMyREdhK0JVeXVUV1ZsVUJGSDA5Z0Y3S0NNUkhwTi9sS1pmRVJ3ay9lcmti?=
 =?utf-8?B?V3VSM0pIcTJDc08yQzd0eXVBdGhtTlZ2eFRiZUlqZzhJaGM5MnRrM3c5am5C?=
 =?utf-8?B?WXhGc3QrVDBFMGNoK3JyTjBDMHl4YTBidW45SHRkWmlqdWhKMDViQVRIdVpJ?=
 =?utf-8?B?SWhNZTFYZEJDQkN4dEZsUWc1eXlHZlVZNHlDaW8rNWwxNWV0Zm90WTZuMC9q?=
 =?utf-8?B?dFBKSVFwN3BPSEs4K3B6ajNYZGoxUDloSjk3Wk1UZWZzU0tSWng3YnJCVUFT?=
 =?utf-8?B?RHVKQkVVUlBpNlJkdDNlMEU4VEVZVDNaK2Y3QnVhTlpyaDVCZzhMRnNkc3NL?=
 =?utf-8?B?QVp1U0YrL2d0aVU3Slhad1huVHVZcUt5dnFHM3JtSVl5R1A4eEdDQ2RUdnYy?=
 =?utf-8?B?ZDBnQWx5Z1pjN1JrUEM1bVA0RmJSdlZaRmk4ZU11SFhNazRVNkpaVWU3V1lM?=
 =?utf-8?B?eklFZmlwQ0RzdHFsR2dvRGRtN2kwOXhlS3pIM2dpN2pXcC9kaEsycC9hN3lR?=
 =?utf-8?B?Qlc3aVFTT2xscldOUlpJOUlFejZuaGRZNE1OdlJrRWNVYW1aSHdyTEZwVFBO?=
 =?utf-8?B?VEVHbnQxSnJpL29uWUh5UlMzSGczQm1IcFl6M0g4MFJSUU9LaGFoT1ZGRjh3?=
 =?utf-8?B?WEExdzc1NkY4eWpiVG4wRkNNcEs1V1lCN2sySE9mNkQ5d0ppOGlXb2xSSWMv?=
 =?utf-8?B?R2trSU5UbTJtUEpXTGVUbGxOUmQ2bEp4ZTJPSjVIQmpKSjNDNTRObGI5RXhB?=
 =?utf-8?B?ZFByZHl4QmhSNmcrdGE5NHNpYW9wUTltem9ISWFnTzNlQTNkRE1oU3ZOSFha?=
 =?utf-8?B?N3BtbFNUT2lSQkk3SXlBT1ZCUFlPOUdGRG5iYzJndVY3WURNSEoyU2pkcjI0?=
 =?utf-8?B?TUgvZ2FSTHlJMGpNMlFBSy8xbmJnZlpEWUp6RUdBQko3Ry90TjdHL0tPZVY4?=
 =?utf-8?B?bUpveTdmdWhndkxuSHR6dUpSRWcvQlltU25qWlVoczVRbUdZMHgzalRJVWU3?=
 =?utf-8?B?NGdKckMxZThQWVhkdWZhcDlsVVpPL3dmRXpoWHRDNDVHdXlvTE9YL0Q1MmYr?=
 =?utf-8?B?UE9XZ1FndmRabDIrcG9FcUxaVmxoMmNwTk9BdFNlRkRGMVpmV1FkYm9SQWw2?=
 =?utf-8?B?MDQ0OSs4ZmlQMVNYTDJZLzcya1U4aVZwMFRpU3Yvd2U5Yk96aTlzWWpoczc2?=
 =?utf-8?B?LzZtZmdKMkp0eVlEbFlaTEZ0c0c2a0FTYlB3VDFyejB3dFFvVk1nczJIV25B?=
 =?utf-8?B?UEFKSHU3S0d3Y2Vwczh3bnM4V2dWbzE5Q2lSOFdjcE5lV1dueU1vL1NtMmxX?=
 =?utf-8?Q?CHsZoMQZbfu6U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFJKeGlQN0xDSUdINDd6UHpoSUdDc0x0ZCt4QVhSbHNiSS9CblBITTNWMTIv?=
 =?utf-8?B?ekpodGFoamxheFlvNkpCSXJ4WElkRmdjeWlOVkFXOHcwUjdxcVhJMW9IYUll?=
 =?utf-8?B?WGxXaXZZOFBOcmFEQjlmc0luR1RHckFubHk2TVY1TmdQSEhJT3NDeThkdlhM?=
 =?utf-8?B?V29Iam9pcDJIKzhlaVFFSE5uNHZTbUdKYVNTOXR5UXNPTDF0VHFONEIxazht?=
 =?utf-8?B?RHY2MXVWOXdDbnRRczEyWFJCWFk1NURyb3h0VkoxcjlLT0wrUFY2eXVhdGps?=
 =?utf-8?B?T3VvNEM4NW56d05TYXk2YUk0OW5MbkJOTk50NjdlbjBMWkQ3aFQzcVFnMFBs?=
 =?utf-8?B?U0paOCsvd3RHU2hCd3dPbTBVRkdjS0k4WUFGOFl2Y1BYekZBUDZ5TGdUMUpQ?=
 =?utf-8?B?dFFRQXAxVVl4bGx0UDVCVDRJb2xQRXB1ZXlHcXV2NVNOSTgwT3lUUE44M054?=
 =?utf-8?B?YytVLzdjY3Q0akFicmpoV1NwRW1wak43OGVGRVhEL0JIUkpvdTVuVUExNm4v?=
 =?utf-8?B?dU91Uk90NDF5c1dvdk55ckl4akdWWXFtcGJLWHpTaXdjTUxYUG1jVWdwVXBW?=
 =?utf-8?B?bWtiM1RhS01WZTN1STdOY1hsV2dzVlBGeTYrRiszQ252Y3dzMHRQWE9XTzJv?=
 =?utf-8?B?eWVUM2xaVW5Jc1FKYkRuKzltL3VUZWJub201d0U2NVVINnRxSUNQOTVrMFls?=
 =?utf-8?B?Y0xFdTFKVkkzRGZOMTVNZ0lTUjZVbUFZNDJhR3NGVFN0cW9NUjZRSEJHTlhz?=
 =?utf-8?B?SHoyNlVGOWVFamd6dnV2eHUxRmtCdGdUOENkQytmOWFseFo3M0hPVDhxNFcx?=
 =?utf-8?B?MlVRTnFXRFhoM3RibWRoQ2t1RFJXNkhhcE5mdHZjTHFlaXBTb1poL29PTFhm?=
 =?utf-8?B?OWgvbFBDNGZtNWVkUWY4dHYwRExkTTRYUFhRc0FhYjJ5ZnlWdS9xcFI4dGFn?=
 =?utf-8?B?ZmZ0NFVSakJVVCtwTHFCV2o0dlk2SXpub2ZaYVJBM2JMa2lwNTErWnVNdFhZ?=
 =?utf-8?B?Zlprc2RuY2ZYRnR2WXY1MkRaS0VSSUdVVHZ1YkRlTmoxQ3BMa3Q5K29ML0Nx?=
 =?utf-8?B?MHNxSlc5Vmw4RmJoQytQem5pRFpqak5zWXRPN0RtdCsvU0FMTEVhOEFyTTlm?=
 =?utf-8?B?dWRCOUFETXRQYzYxc3VoN3VJR2QzVFIyaCszN0U2MUh2NGNjT1BSRzF2MFAv?=
 =?utf-8?B?WkRMdTRYU053WFlXMzAwaXhKRzBrbWJLWklWM2VHSXZnWWtjQ0o1L2ZYZVdY?=
 =?utf-8?B?NDRGb29ycjBCTHRUdkJZTmxkd3h5Z3M4NkZQaUs5bmtyblJpWlE4bXN5ajJT?=
 =?utf-8?B?TFJnWjBLbFZyckZqYjZlMGhJTDcrSzR4WlphcUNBWTZUekY5TUsvNExrMG5B?=
 =?utf-8?B?dHQ4SlF4WjdkTXhaakprYUZMaU1wU1EvN2gyTnAwWmJ2UG53S21WUWFYQUJu?=
 =?utf-8?B?eWRLZEpaOWpJUUY0enJBTUI4OXZlYTA1bTNJUFFlWU9EL21zbm1obGNnYjMy?=
 =?utf-8?B?K0k3M3VRVUZHdUwralpuL3ZOSENyRjk4M0paa2MwSW1uelVUTE56RFFQQi9S?=
 =?utf-8?B?ME9ZMTAwbHRoRDJGZGhwRy9GT004OTV4UHg2VGRXcXBrMm5lU3pJU1BjWDNK?=
 =?utf-8?B?Vkc3UlhWMzBZbEI5Umwyb20vbTRCcTFCZnpXUmVUdDhXNkt6L2NCV0Flazk1?=
 =?utf-8?B?T0s3QVhYUENpNWFtbGJkc29kZzgwZFh5Z0Yvc1ZTcmhiRmJIa1VVdGdtVHRv?=
 =?utf-8?B?ZWJ2MWZLY0RoWEF0WlkvaXFhRThxaERVV0VOZHZFY1ZoNFpCYmlOMDZ6TWdr?=
 =?utf-8?B?bFlsUGRHKzUwUWpUdUJzdnVHcFU4ejBaZk91ZGo4ejVzUnQ2cEo0clI3UDFl?=
 =?utf-8?B?KzBxY0FLWlJ0WkxvZUxqVGQzTFYyZ3J5WWZDL2M4N0Q4WG4yVzZCV29vQlBZ?=
 =?utf-8?B?a2tSRTBhWjRpNEJseW8zb1ZFWWk1bmNNVFA0U3FXakphTFUxK0tBOStLSXZT?=
 =?utf-8?B?TlNXNTd0ZE1Ec3hXUk4ycTR3VDhkbHZqWHJCczNXZ2pGMEtlNFhvd1ZNbWl3?=
 =?utf-8?B?eFBCRmhLeG8zeVhuL2NTWldHZDZ4RktpRG9MWXplWU4wNklqY0JxZ0k0UWxS?=
 =?utf-8?Q?TA6DZhJ3OzSWMQtjXi7QFUwRF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2acf0ac-685a-4a0f-1c18-08dd61f45f1f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 06:00:35.5914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1BGpZMgqji/241enWw3pB5eI1/o0wmY3uMvw22iAq/kx5KiBbGsHnuLVTXQ+D0u5k8enrkZKP6hD9sYNFWYJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8365
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


Hi Lucas

On 3/13/2025 2:41 AM, Lucas De Marchi wrote:
> Commit d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
> moved the survivability handling to be done entirely in the xe_pci
> layer. However there are some issues with that approach:
> 
> 1) Survivability mode needs at least the mmio initialized, otherwise it
>     can't really read a register to decide if it should enter that state
> 2) SR-IOV mode should be initialized, otherwise it's not possible to
>     check if it's VF
> 
> Besides, as pointed by Riana the check for
> xe_survivability_mode_enable() was wrong in xe_pci_probe() since it's
> not a bool return.
> 
> Fix that by moving the initialization to be entirely in the xe_device
> layer, with the correct dependencies handled. The xe_pci now only checks
> for "is it enabled?", like it's doing in
> xe_pci_suspend()/xe_pci_remove(), etc.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Fixes: d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v3:
> - Stop using -ENOTRECOVERABLE as it may be confusing wrt
>    critical/non-critical failure. Returning 0 is sufficient
> - s/xe_survivability_mode_capable/xe_survivability_mode_requested/
>    as it's not only about it being capable, but also about the type of
>    error, firmware signaling it, etc.
> ---
>   drivers/gpu/drm/xe/xe_device.c             | 15 ++++++++++++++-
>   drivers/gpu/drm/xe/xe_pci.c                | 16 +++++++---------
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 17 +++++++++++------
>   drivers/gpu/drm/xe/xe_survivability_mode.h |  1 -
>   4 files changed, 32 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5d79b439dd625..7fce59059acf2 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -53,6 +53,7 @@
>   #include "xe_pxp.h"
>   #include "xe_query.h"
>   #include "xe_shrinker.h"
> +#include "xe_survivability_mode.h"
>   #include "xe_sriov.h"
>   #include "xe_tile.h"
>   #include "xe_ttm_stolen_mgr.h"
> @@ -705,8 +706,20 @@ int xe_device_probe_early(struct xe_device *xe)
>   	sriov_update_device_info(xe);
>   
>   	err = xe_pcode_probe_early(xe);
> -	if (err)
> +	if (err) {
> +		int save_err = err;
> +
> +		/*
> +		 * Try to leave device in survivability mode if device is
> +		 * possible, but still return the previous error for error
> +		 * propagation
> +		 */
> +		err = xe_survivability_mode_enable(xe);
> +		if (!err)
> +			return save_err;
> +
nit:

This would be better.

if (err)
    return err;

>   		return err;
> +	}
>   
>   	err = wait_for_lmem_ready(xe);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 4d982a5a4ffd9..6fea3091e2348 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -808,16 +808,14 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		return err;
>   
>   	err = xe_device_probe_early(xe);
> -
> -	/*
> -	 * In Boot Survivability mode, no drm card is exposed and driver is
> -	 * loaded with bare minimum to allow for firmware to be flashed through
> -	 * mei. If early probe fails, check if survivability mode is flagged by
> -	 * HW to be enabled. In that case enable it and return success.
> -	 */
>   	if (err) {
> -		if (xe_survivability_mode_required(xe) &&
> -		    xe_survivability_mode_enable(xe))
> +		/*
> +		 * In Boot Survivability mode, no drm card is exposed and driver
> +		 * is loaded with bare minimum to allow for firmware to be
> +		 * flashed through mei. If early probe failed, but it managed to
> +		 * enable survivability mode, return success.
> +		 */
> +		if (xe_survivability_mode_is_enabled(xe))
>   			return 0;
>   
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index d939ce70e6fa8..0d57ad1596edf 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -178,15 +178,16 @@ bool xe_survivability_mode_is_enabled(struct xe_device *xe)
>   	return xe->survivability.mode;
>   }
>   
> -/**
> - * xe_survivability_mode_required - checks if survivability mode is required
> +/*
> + * xe_survivability_mode_requested - check if it's possible to enable
> + * survivability mode and requested by HW
>    * @xe: xe device instance
>    *
> - * This function reads the boot status from Pcode
> + * This function reads the boot status from Pcode.
>    *
> - * Return: true if boot status indicates failure, false otherwise
> + * Return: true if boot status indicates failure, false otherwise.
>    */
> -bool xe_survivability_mode_required(struct xe_device *xe)
> +static bool xe_survivability_mode_requested(struct xe_device *xe)
since this function is static, xe prefix and doc can be removed
>   {
>   	struct xe_survivability *survivability = &xe->survivability;
>   	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> @@ -208,7 +209,8 @@ bool xe_survivability_mode_required(struct xe_device *xe)
>    *
>    * Initialize survivability information and enable survivability mode
>    *
> - * Return: 0 for success, negative error code otherwise.
> + * Return: 0 if survivability mode is enabled or not requested; negative error
								 ^ ,
Thanks
Riana
> + * code otherwise.
>    */
>   int xe_survivability_mode_enable(struct xe_device *xe)
>   {
> @@ -216,6 +218,9 @@ int xe_survivability_mode_enable(struct xe_device *xe)
>   	struct xe_survivability_info *info;
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   
> +	if (!xe_survivability_mode_requested(xe))
> +		return 0;
> +
>   	survivability->size = MAX_SCRATCH_MMIO;
>   
>   	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
> index f4df5f9025ce8..d7e64885570d4 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> @@ -12,6 +12,5 @@ struct xe_device;
>   
>   int xe_survivability_mode_enable(struct xe_device *xe);
>   bool xe_survivability_mode_is_enabled(struct xe_device *xe);
> -bool xe_survivability_mode_required(struct xe_device *xe);
>   
>   #endif /* _XE_SURVIVABILITY_MODE_H_ */
> 

