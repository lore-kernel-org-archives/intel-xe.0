Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F78CCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 14:57:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD57610E938;
	Fri,  3 Oct 2025 14:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIMVQQE0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2BF10E939
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 14:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759503436; x=1791039436;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LAK5O/jrUyyzA32QuYGMwC1dh2nQBQ9Sol0z4VBjloU=;
 b=PIMVQQE0xuJiKCQ+YW3SLsU8QLy+6q7flMXWeMql2Jas779qsVsxPMNx
 bhoq8rAT5/PsK9afgMNi5ETi/rLv0yHi33OEcuBVB08gBG6/OXah0Sp8R
 mXNtX2+OXGMEWuxewXmEZnxtBwVG/ahzFfZcg+OKQAAOPWk6dgiJ5qv5i
 YxMn8Q0SBUNO5qRkSj8D8MiJIRndWli6+U5yr7yVG+Iay6/5Aqc+LJzyg
 g5EPLOozXoxrcJdBENUYqjgt09fT4U8r9Z9WZw55m1hfAbnmpzuEqvomE
 YXWdrT15GYESqi8RmI52yJu1UPwxfjiwZTnckuzJusSCyQVJwC7G3EfN9 Q==;
X-CSE-ConnectionGUID: X/LR9atQTlO3RYOeXkDq9w==
X-CSE-MsgGUID: 6gXrhdhrTG6AzSJSKP1/hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="64400439"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="64400439"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:57:15 -0700
X-CSE-ConnectionGUID: 7pnQO4qqQrWJwsi4g+40Jw==
X-CSE-MsgGUID: C/kZwVnSTei8U3O0m3AzPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="209979117"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:57:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:57:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 07:57:14 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:57:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEZivsC6ogoo5YngyNrkNGufVJu/eTrR9o2vh5UxJ5IUJSEbOwyeWYbzCQgJAASzUy+bc4OnPxMSI92bHNtZP28zAT3wfVwQ6aDQblctENm6dCt2yO2wkCNxhJpIrR5P5UsnTaUfqVIJQto11RSg0/uNjdvfoV1/3hc6bxQB82SzNIu0sLVX5McPuja+CtWv5QZAOvopoRvPu71w1FV5XBG58q46s8nBT2rx0mXWA8E87mv7J1BTgBsauGu/imyerZj9AzffWRR8LWE8EudBD4xO086ENOGY0u6Jt8pnT9XTZAlaNdW6KI3oM69Ph+dj2SGmFmgbPcb4YAnKkbxJiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7C/Y3/q/fzz6m37atjDAhrJeW4pI6WDsH06WUaSY2KY=;
 b=Bze8Rx1678j/8ZIVx1849zAgHm7HkRDcPKCFeTB5AK1fs7Gu1KoiUNXaK9Ku16WVxCOAw2r0Y6AAJJkHBnjzX2W7H/wmczdLi+gW+8GzJhLPnMlN2E6aViplLmAHtj/o6V2L3nsQNDQdzasoNVlvn/C1UaYtI2I3CoD9EO7z6bvlkYBvAbuUvK3SdfAngXb3ag7QYQvVtZeeryLqrs7ZM43P4IlM7IttYVYpq4qdWs7RxUKU9wS5a0zjg/xxH9CemeXJgm+rQzO1N8TTLDSKfP6MYVFsi9RosrRxIV7IhHFjlvaS074qu2rdazKBdS46OERZs7+/UNs5D4HP0CfX9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS4PPFDB7809488.namprd11.prod.outlook.com (2603:10b6:f:fc02::56)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Fri, 3 Oct
 2025 14:57:12 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 14:57:12 +0000
Message-ID: <4b3763eb-9b6f-44d7-b597-015bb63ec508@intel.com>
Date: Fri, 3 Oct 2025 16:57:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/34] drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC
 context register
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-21-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251002055402.1865880-21-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0095.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::36) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS4PPFDB7809488:EE_
X-MS-Office365-Filtering-Correlation-Id: a927382d-b8f2-4b18-6a2f-08de028d2215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dU9mcDhSOThaaEhTRXpiK3FnZ1ByL2RTc0swVHpiOGFLR2xBdFllaE51Z0xj?=
 =?utf-8?B?cnhJMm96U2VzN2x4YXpSTW9NK1c3UlloYklZNytvaDJxWXlsR1E0MzdneFo5?=
 =?utf-8?B?b3oxZFZvZjNqMFZaZURwWW9VeVJ2YVhkTDR4SEZwSGRxVFlWbzFUSkJHckRv?=
 =?utf-8?B?OENVQmwwSWRjNzhFOU1yMGRUaVcrMERZTjg1N1RKNzBtM2JvNTZwS1V2Z09B?=
 =?utf-8?B?SmxIS1dKVGFEWkJQanpsVmtnN1VhNjhFM1NrMW5GdndCTlp4am84TGN0azln?=
 =?utf-8?B?SlZiaXNNN3BKanRTalpkeUw1ZVJkbWh6ZitXaFp5OWZHYTFqNkhINHl2eUt2?=
 =?utf-8?B?U0tnZUhjV0tMVmgzNmkyNlNzZDNqRmdqWWEyeCtoSHRnVURHUmQzWS9vMmFM?=
 =?utf-8?B?QkFzNmRpc3REMDRuQ0xxdVlJRVd4SVN0YXBlTjQvSWJ0a2xmWlYxbVE5TGhv?=
 =?utf-8?B?bXg3aUJxMDM2ODNnLzQ0MTYrem1EYUVKMUNLaWpENUFSKzVxbENqSCtDSHY3?=
 =?utf-8?B?VHNMYXFJVW5sV2tIVlNMdVZ5UnJ6MW44blgzVFZTdU4wVFFYTHExR0pTVHpy?=
 =?utf-8?B?K1IvdTRhRlZTRzZvTjZkRWN0VHBxU2dCR2ZqVUFYSCtNa2wvWHAvdjN4T05Y?=
 =?utf-8?B?SjZ1MVN4VHU2YTRoTEFjUkVYZ2hrNnorWklyY0ZvN3FoalZNZGlIdm80YjN1?=
 =?utf-8?B?bzE4bFZaZDdHajVTMVpmNnc0OGplZVZ4d3IyNDlpckNMdTVEU0k4Y3JZdWt4?=
 =?utf-8?B?U2w4Qk9yamQ5dGlPbytoQlI1SVJHdWM4aEcrdUY2Rng0clU1dDRTV0JlRFFu?=
 =?utf-8?B?R2lobkMzWXJhejlFNUxLcnp4WXczRHJGakZWTXFuYWsybGhjN1FmQUx6WDYv?=
 =?utf-8?B?Q0tSMTkxUFhMZ2NNRjVsMGJBWEJHdnZLaTQ2SnErK0IxR0RybVg4VlUxQlR0?=
 =?utf-8?B?RlZqZWF2WW9kRXd2SXBpSzdNR0w1enpISXZJOWNwZjY2d3JZOEw0OHIyOGpJ?=
 =?utf-8?B?bEpESlNKbUsrVmM0YmRKZUNvTjlCWng0ZzNyNWQ3RTVtQjkxZ1FVZ3JXQm1W?=
 =?utf-8?B?SnFoR3hWQTNGSUVnZER4dEZTTVc4cnRoMDI5SGo2L0kvaTZoUjJYT2FRNTBR?=
 =?utf-8?B?NFFtcWsvOEMrYU5OQ1BEdWsrVWFtS1dmY1N3S210ekRGNnlGU2RYUDNXZlor?=
 =?utf-8?B?T0xNeERKR0hsLzQ1dzFWSEhnS0F1ZzhUL2RiTERTWEhSUGpFUGRZbTF4eExJ?=
 =?utf-8?B?UVdZcDdKeENWN2NIVzlodDhQTUM1YVQyd1dKWHR5VWNJeUZYR280SytKR1pS?=
 =?utf-8?B?QWxwaVdscUFXbnNFSndUWDhxem10clRWUXVNMDlzQVZWN2lzZGwyTDRNaWNU?=
 =?utf-8?B?OXRvWXhVYUZIT2duSUdmZ3FMbDYzckhNSVk1MmdteTJpWTNaMENFSVJHZ04z?=
 =?utf-8?B?VWQ5UXkxTm9GYjBHK3BaTjFmY1JKWkN4bXBjT1NPdG9mMk5BcnF2OUJOYlNa?=
 =?utf-8?B?NU5wMkFvd09IUUFxYzhaYXJNamM5NE4rcjZwL2o5VkNQRi9ieGx5Z0h4TmFp?=
 =?utf-8?B?VE1ZNGlINldobkNFalJTQ2RMUVZtbndwODUyQk9MLy9pK3lraVUzVHZzMzhT?=
 =?utf-8?B?dVhPcU5XWERENjh4d2NnK0dPUlhJQThhT1NYWFRZRDIyUVY4SitBaHFTbVRj?=
 =?utf-8?B?VUR5TjgvbXF0cDlzd205VU5BczM5UzJDNjVGWWxmSDN3OWRKZW8yS2I5dnYv?=
 =?utf-8?B?ankwWnpOSFh4QnM5aFFVNCtBRUNESWVON1BPSkk1dTFZLzZZNFhONnFRa3Fr?=
 =?utf-8?B?QmhCQzNUbkFtL3I3RzdpcGFtMmJTMm9DS3JiemxkZmpibGRTOTZtd1VEVmE1?=
 =?utf-8?B?dnUxa3JQRDdJVTlPTnFYWXM2aHoycU44WVIySlhvQ0ZSeHlDc0xyc2NEUmMr?=
 =?utf-8?Q?JEy1LI0bIVkj7F9h4jmCzsHcPm1wX3fQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1hWSUxVNDk4QS9Ma0E1OEo5TEMrVlphK0NMRlVWMmNPZzI5WVJNcjhGUUhN?=
 =?utf-8?B?K2RnM1JxZFpoNTRjY2NnZ1hZeUE1em1yWVR3eEVOQkVIL0U0Z0FlZG4zcGdK?=
 =?utf-8?B?NFZhb1F0ZXVkZlYrdDZjZ3dkbUNWNFBaUXVrTlFFYkdkZHNwMWZqaXZtUmp1?=
 =?utf-8?B?VGJSM0VvWDRVTlF2ZW1PS3BGQ2N0NlhUMk1FeGZudnU1OUt1eDJSaFBVWHp1?=
 =?utf-8?B?NmNWYmxkcDdVSXFDTDJjMjZTS3kxY3pHQms0WndSSlV1RE9qZlVJQzB0MEFQ?=
 =?utf-8?B?eEpMdk9NdmRSNGllWjNlK0txT2RFV3pDd0w2V3FqVzhmMEFKeW93WDZsK2Y3?=
 =?utf-8?B?dzNERmRkckp1UzZsMHlXYkliVFVHS0s0MXFwQ0FqZm5aby9sUkF6ZDFGV25H?=
 =?utf-8?B?bHJ3aEplUU9BWitqZ1FmS3haalJGMkszejllNTh4aGRoUDNGYjA0ZmxjQkkw?=
 =?utf-8?B?NTloenk2WG9CcUxWQnB0aFZOSE96OTNhWm1KM0lLRzR5aG5pTjJuR0p5NTlo?=
 =?utf-8?B?V3pOcGJleW1sdG9KU1dEd2V2cWhYa2lsNVEwWkxJMUxyVDU3Y2N6YXJGdGFt?=
 =?utf-8?B?SElXeUtuT0NFRHJlUWRXY3lxeGRSMGcwckVFV0w2M3NxRkdoZ0VPQXNRWUZl?=
 =?utf-8?B?dWlWSzNodjIrUUNaZC9pdm1mNW5MM0FxdVhDaVhTQzBFK2JOU0x4MXgydUN3?=
 =?utf-8?B?TCtJMjV2czZXWmV3Ny9iV1ZwUlZjZmJabzZQdmk2TjUzMkZhT3EzUzhWS3g4?=
 =?utf-8?B?d084eVBYUDZUZzZtRE1rMWVmVEVCRlIxS24wMmZyNXNZbFgwNWUyUXRPWTFq?=
 =?utf-8?B?dHd6amVzL1Yxd0RrWDNKT2wrU1RQRzNuWllJa3NwNXR3bEZDWTJvM1NacVR6?=
 =?utf-8?B?VHpaUG83WHVNbzMyMmdlSlRLR1B4clBiZzhCTCt3N01jWklnSHBLR1NjZEJW?=
 =?utf-8?B?ZG9NSlZkdDZDamNHVFh3WGprbk5CNXZhcnI0ekVyWm16MWxpbHZJeERyZVdH?=
 =?utf-8?B?VVVlcS9RbU9kdThHcUhxeVR6SHZhZFZiblJxQ0JQMnphdU5udHhIUU9hYkk1?=
 =?utf-8?B?eVkxVjE5b1lQY0tvS0w5RzYyeHR3RHI0UmtQbEpNM01RNFhlRFo0RUNWcEFS?=
 =?utf-8?B?QVNVZEVjZ25vZk5oYUpuNCtjU1h1aURGUmhkMmxoTGJaWXhjeEdha09lQlM0?=
 =?utf-8?B?Z1lWcWdPMENpNnFMSWtvLzBwdmRVb1Jxck9tRWpwTUdLQkdYeS95dVRVMkpq?=
 =?utf-8?B?V0QydzJTbTU0QzZIeEVITkphZm9UdTRLSmJrUWtLQkthanRaVmtjUnpUWFh4?=
 =?utf-8?B?Mi9iMWtpMUVyZDc0UFFVSGZkdzVrQWNiL2xiYS9iUjR5QkNyQnJ5bDEwYzFx?=
 =?utf-8?B?SDRFZmxkY2ZWeHhnTURSOS8zcHBKNmRMUytVQkdJb3Zwa0thcjRXcytoZVdm?=
 =?utf-8?B?SmpXWUZJVE1sNVFiZURwRmNBNW9GMzY4UmtGdFZTK1ZlT2JuWU1YYUU3Vjk2?=
 =?utf-8?B?THBGTk0vbHhObWRkSlZXN0x2c0V6TG03S0kydnAwM2YxclBiL01rdExrTkli?=
 =?utf-8?B?aERnZ05nYWZzK25sZjJqVm44WUZHcmJDR3R4RW9QbXV3N1pwRm5tYUd6UDZG?=
 =?utf-8?B?cFQxVTNiYjhBcFBNTE1ENUFJNlJEVldNSlVxMlRTYjNFcjhCOWJwYzlLUUJB?=
 =?utf-8?B?akZ4eVZiVlVDNWl5UzBBUGZqRzYvbVoxenJWeEJuMkZJa3NVNXI2SDA4aEdw?=
 =?utf-8?B?aDdnbjFveDJ1cXBnbWNZeHdYUGJoL1dFdTgzdDFCcTQ0ZUpIenl0VDRtWHBQ?=
 =?utf-8?B?RktOeHQ2SHpkNmZuZWQvZUpNQlFKcmlaRHd1WG93WVBwRkZFVHJCZEMrdlpk?=
 =?utf-8?B?M3hsbVVtSVFzYnZKeGdDcWdwOU1Pa3Y2bTYxbVVsT2NwOVFxQmEvQU0rNDJq?=
 =?utf-8?B?eTZFdTB6MTErWDFjSkVIejg5alMvZDh3N1EweFRCQXZnbTdkbXR5REhLeGhI?=
 =?utf-8?B?dDM2UmJMdHRQa01STEtwK1Naa3ZDdHRmTlR6UFdhVmVzWHdkZDNmOGxkVkdv?=
 =?utf-8?B?azZ6OHI2eTd0RWdTZ1I1R1Bsekg3Um5BRGgwdllwUEEwU0pnaTRvcnBTbmNy?=
 =?utf-8?B?OGg3NmprMGgwdE5pSUcrSjE3OXozblorQTZOdGEyTHhJcldpTkZEZ2ZoMzE4?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a927382d-b8f2-4b18-6a2f-08de028d2215
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 14:57:11.9978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFPwmbHN+XVGyeH/0EM90t33+OoaFy02YPGDcLbtjdbtHfvq4NHWKnvYVopi19gDZngHnOi572mXIKihd5x03gynFI3h73LZIASY5Q5pBdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB7809488
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



On 10/2/2025 7:53 AM, Matthew Brost wrote:
> The only case where the GuC submission backend cannot reason 100%
> correctly is when a GuC context is registered during VF post-migration
> recovery. In this scenario, it's possible that the GuC context register
> H2G is processed, but the immediately following schedule-enable H2G gets
> lost.
> 
> A double register is harmless when using `GUC_HXG_TYPE_EVENT`, as GuC
> simply drops the duplicate H2G. To keep things simple, use
> `GUC_HXG_TYPE_EVENT` for all context registrations on VFs.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 32 ++++++++++++++++++++++++--------
>  1 file changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index d0fde371fae3..d84de8544532 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -736,6 +736,26 @@ static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
>  	return seqno;
>  }
>  
> +#define MAKE_ACTION(type, __action)				\
> +({								\
> +	FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |			\
> +	FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |			\
> +		   GUC_HXG_EVENT_MSG_0_DATA0, __action);	\
> +})
> +
> +static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
> +{
> +	/*
> +	 * If we are VF resuming, we can't exactly track if a context

s/resuming/recovering

> +	 * registration has been completed in the GuC state machine, it is

well, we can (by looking at H2G if that was processed) but to "simplify" we don't

> +	 * harmless to resend as it will just fail silently if
> +	 * GUC_HXG_TYPE_EVENT is used.
> +	 */
> +	return IS_SRIOV_VF(xe) &&

maybe also:
		xe_gt_recovery_inprogress(gt) &&

to limit our trick to recovery only ?

> +		(action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC ||
> +		 action == XE_GUC_ACTION_REGISTER_CONTEXT);
> +}
> +
>  #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>  
>  static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> @@ -807,18 +827,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
>  		FIELD_PREP(GUC_CTB_MSG_0_FENCE, ct_fence_value);
>  	if (want_response) {
> -		cmd[1] =
> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_REQUEST, action[0]);
> +	} else if (vf_action_can_safely_fail(xe, action[0])) {
> +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_EVENT, action[0]);
>  	} else {
>  		fast_req_track(ct, ct_fence_value,
>  			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
>  
> -		cmd[1] =
> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
> -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_FAST_REQUEST, action[0]);
>  	}
>  
>  	/* H2G header in cmd[1] replaces action[0] so: */


