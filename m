Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0067EC61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 03:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC3A10E238;
	Mon, 31 Aug 2026 03:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5ALszro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D165C10E042
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 03:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788146921; x=1819682921;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hPBZDnDssGRnyZhxyMUu4JZbFW7+zAtso2QwL/JzyVU=;
 b=b5ALszro64hZTZj+lDHIRbqAyRzD8NxRm5ERkBVErk9+XBs580Qqv0AS
 km59Bp8jysga4Rss/CCPvXyIF5o5VzdmOS6ZcXYZ9aXKJLCcR8e9cFkHr
 tW6+AbSJ7NKmgEEs8jVNByX5ZpbR6bL92aRlY09qHT8y2lh0/az9octtn
 fBzDj8XVQhUuZgeh75QpO48sqwTiBVau9vVe695+5UfXTmejCC10Qrw51
 znHSzJlLMWfrkO08Clrp5FbVGveLXVX+0goGKF5EDGPpVvDN5j/ufGa5V
 1OoUv8I1qz+b2oHiCgkiseaAIwxrp//z48oAhJl9ibpwfiEGfd26tUs3G g==;
X-CSE-ConnectionGUID: gRUpAessQjGzgDadTkmPQA==
X-CSE-MsgGUID: yrai55VETQ+oSMnW0sBHQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88308051"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="88308051"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 20:28:40 -0700
X-CSE-ConnectionGUID: mF5nszFaQ8+iWPoLqx/TeA==
X-CSE-MsgGUID: OZvkxIVXQtWuW+smGk3EWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="270610762"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 20:28:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 20:28:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 20:28:39 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 20:28:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPkfVFJNrGK3tPVXlp78lAJFXXttDFgvMv5YnhXI8xUO53bGZLHjeVSmZhlesY01dOe1ICGKtjF0FifgCzF5/ujarf5qEa3W3ebugpQckh8s9q7VUaaayhpmGonbCqs9gPHhchXr0vPRPpZC8mSfA9nj8qIqv4hn9FP/f0/lq2D3GEKo2Mgvl35J+ZHu/7eMxZXg6ocHVDW67D/utMJE94QskFEL755f8ScpZklcWZtgxSCO4/ZbUTLBwQknakMWS3z3affQNpaNqlr72wRvb9GmjfdcrV67iqJ31DKILzG6mEH3QydGcicmH33lSqQ2tkjcnIi4kVqN6ZiV7e/JoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILC2/JqWhLG4tev8Ou37xmz0b+KJ70QfBcR/E/cQRm4=;
 b=G76+m4QAjKuXTX7tQaY5cr/EFBKWpgaYvDlAeiULd2m65L5cqSOJloEMQcvHf16vS7jM5syX5Qwl1DdW2U4+wtL7muZc0q+I9TGweEnqRb41Hwy4jQ07Du/Laz0hLlQ2i2Q8GNvW5hWdy68AuzupJ5KeEVE9BI7mhEtNgTHacTPJQwcvaWvC7J6176jMjdk2V+xPpuOXY1T2texefE9C97TipAYP0/XeUJwTxUbEh78953whfyk+gwlSbXL8049JR9HNwS0sueFq1IL76BlNmvmQidgSNzxwI83kyl6vSc545NWhzP5K7xSNdacNGnpYDR9HwiLtK+NlYEtYVgzfeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LVUPR11MB9785.namprd11.prod.outlook.com (2603:10b6:408:39c::21)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 03:28:34 +0000
Received: from LVUPR11MB9785.namprd11.prod.outlook.com
 ([fe80::c3a9:8112:ecb0:fa77]) by LVUPR11MB9785.namprd11.prod.outlook.com
 ([fe80::c3a9:8112:ecb0:fa77%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 03:28:34 +0000
Message-ID: <6b435be6-eb36-43f4-abec-4e9488a9c135@intel.com>
Date: Mon, 31 Aug 2026 08:58:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V18 12/14] drm/xe: Expose bad VRAM pages via debugfs
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-28-tejas.upadhyay@intel.com>
 <c0ad1040-6155-4a7c-a92f-ea263514ae43@intel.com>
 <DS0PR11MB87181738381AA50FBF60B4E681AC2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <DS0PR11MB87181738381AA50FBF60B4E681AC2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0199.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::11) To LVUPR11MB9785.namprd11.prod.outlook.com
 (2603:10b6:408:39c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVUPR11MB9785:EE_|MW3PR11MB4602:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e47bf4-3617-4cd6-bcb1-08df070fefe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|10067099003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: oloBaa2bKHY7w4LDmJjh22w4AgbdAyi2mFQi0L/Z67yll6Whr5icTdNElb7es+rf07aeEkW9d9RExzo7+ZQVODuGEjtmj7aHhubK3hBMwhpn9sqODzX/YA0tov6QC8TJD2IaQlHIhhOnndkvY9F+jgeTZRmjrCuZ4wKHOHAaa4+mDORoGwhOysW1ZQ1tiNbEB9ZgVKkyPJb+PtIde42K6AEPLojhIJwvlrJEzluy5wweEkkRWwH8gKfWVWavEJmgnXqLnTs26tlhynvFqT+ecDHB9pRe4tKe+tQdm3PrDehzrp+K9DQ4b4zswE8ABNRYFsRpM79VJ4WOaTQ9JLLkoS2fJpV7JyYNfW4j9BYK9mKEePK4fQs0jhctGtDXA0BGomAvtKmTE7UnvXTh5UPLySmL3gBvf8AT+4GRDozW6Ns86Og5jm7cfOgLJ77OhOuUv1bDji5ZOwQ9jw/uMV3oTR1UC3I+RZCgs3d6tRZy0I6BEGReJ0VIrMoQijaYLnqXv2x6nGuAPnUznNVHJczvKODoaoVeRs4xPXLf8EvlfYGKYTJBV4pJUMzhkn9jhLlQwUnxYUpFw8q/62Ak+h78ToxG3URfApqn1TUja4JjoHt0L8gF/BDUulBQhp0KaGGDagGHUbwm78cQ5yG+8p6hzK+v4wnWv8fDjStLp74PdP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVUPR11MB9785.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjdmRldjSGMxd3lobCtxNDB1WDhXdWF0L283VFZCckJVV2xVYVNFcWtzQm5O?=
 =?utf-8?B?L1V4Ymo1S1JRS21rQWdod2hRRVdCakxadnpodmNPU0NTVjVoYTJoajRrdWNB?=
 =?utf-8?B?MFN5bDd5RlY1YUlLYWVCeHMyU2pJQVFVR2hUR2tIMGRmSDRQMGovd1craXBB?=
 =?utf-8?B?STAwL0RINytSVThZbzlZNkxjQ0Vsc25GYU5pRFhEVXJIaEE2TGV5RGZNVDhK?=
 =?utf-8?B?MWtoZnRhRGtxbUdXSFJRZmVPdzdjYnoxblBGM1p2akZNUko5OW1jL1hqRkZo?=
 =?utf-8?B?cGFIbHNUMExVWGJ3elBqME9odFdZbnVPL3ZFR2RxdkE0TjNSeUcvK0paVEZM?=
 =?utf-8?B?SUw0WnV6M2hQaDNtaU82QnVjY1RIVDFPNHZTUWZjdWYwd21LdFJKVWMray9K?=
 =?utf-8?B?QW5OVnFHNWFyY2NDQUlHQUNHbVFHb1NIb0tSRWloWFJEbUVXVndyVXZ0Yzdl?=
 =?utf-8?B?RE9hVHE3SVVlVzI5Y1MrL0NJeXN2ODdCK0pLSFh4T1RNL05oOTh5YUxITHla?=
 =?utf-8?B?YnpESDZVU2tOUGk5NWlnOU5FNlg2OFlybDJYV251V0xtTU9XRmNWN3ArWEND?=
 =?utf-8?B?d2JoVUJJVTUyVVlsemE4SXdJVndHenU1OVNoUmdCRVdHL3hzSjZkT29uS0Rq?=
 =?utf-8?B?TTA3UnJualBNSkxxSk1FaG1nTEVWMG1OSDRNQ3cyc25BYzFxREpqejlNTU5y?=
 =?utf-8?B?dkhNSCtuVlFDVnl6aWVIZXQwZFEzZ1ByOXlHRTh2ZXlqQ0o4b0FtVVJVb1pR?=
 =?utf-8?B?MGplSGNQZndhOXcxb0ZYeXZTYUJXNVZCbklYaXJYbVE1UGMwcldPNFdpUXdm?=
 =?utf-8?B?NTZ6VHA0MG5maFltcFdNbVI0Tlk0bjc1VGFwejFIcnFSMTZVYzRrb0pWbmU4?=
 =?utf-8?B?QklsNHhTQ0NkeG5zeWdXcWFPRTUrSDdkUDJHR3JsRUIrZENSSTJUM09aY2w1?=
 =?utf-8?B?ZGhVWU5HNjAvNVJ2MnU2M1lncE53T250MXpzZW1pRTduamRoMXFzbHBCajJh?=
 =?utf-8?B?UWJtazhTa25TQkZTTytFYkNVRnB1eWhLMkhJTTZZL3ZMQUNYZWlJeENpYjA0?=
 =?utf-8?B?UjBJZHB1cmVuYUN2RkVDOG9mcWphKzhxQzlhM2k3VTIwc3k3cStiNlMyQ0M4?=
 =?utf-8?B?N2ZzMHorSVQxM3N6c1ZBQ1duMmhIRTUrVlQ5T0R3VkFtNnNMbU1zc0NzekpP?=
 =?utf-8?B?cVZ1aEgwSTl0VVRUZkdVc0puVVVINU9QN0hySEE3b3FlSkhBelE5NVY1QS9J?=
 =?utf-8?B?UUZaaGZrTms5eXRLTnE5bitjVm1Qbkp2cFNpdzM2K0xidEd2bXdzWmpzbDMy?=
 =?utf-8?B?UFVTai9uaThGNmQzVWhyOWNZWmxqVy9QU0Nza3IrRklyeHdjOWxjY0grZlZI?=
 =?utf-8?B?STZUVmF4cThJYlc5d1N0TGx0Njd1bFJGOVQ2THRhNnRRK2dURmFIQ05uUVlE?=
 =?utf-8?B?WXNCTHFOZ3BpSnlqcC9rT0NwbmdzeDdZTkdQTlNURzE2b2x1VkhzU0NpRnJv?=
 =?utf-8?B?YUJta2pyVm1OMlF0OG94cXdoOTlCaWJvUlY2WkVUWjRQY01ydFVjekIxRG5I?=
 =?utf-8?B?OEhIM1RhbXdPUk1iQkJ6dEVvbFdDZ0NmTkZGUVp3VUlJMU5BaFVIRXYxbWZs?=
 =?utf-8?B?c1dXOC90bHhnY2ZrdGxvZEgrRTVweXZuZkFERWh3emt3ZEJacnpiVmUvMkZm?=
 =?utf-8?B?OU1LdFpBYk5zTHA0UysraWFMNG1ieVExSXgycC9EVVcwem5idmc2QmltZHpO?=
 =?utf-8?B?UTd4N3BzS2l2aTlpekYrdDdsNXZRMDBTc214QkdlUmtBZ0JEMmpKczFSc0NR?=
 =?utf-8?B?LzBqZDY5UGUyc1FQMFdoUHhPZHRnV1ZMamR4b0tHOUMreDVBUm1yRlkxdHJm?=
 =?utf-8?B?ekw3K3dFcXJTRnJjRWgydlIzemhXa3B1T1lVNEhST0xQY04yK2RvQnRwcnl0?=
 =?utf-8?B?K2E1NG5veTQ4MjNzUG5uZW5pTm1JYVRSb3F2VTgwbExubjdBVC85a1h5UWRs?=
 =?utf-8?B?OG4yT3N2czJEMWM5aE81VENzblMxUEV1MXNQczVaNWRrN0lPVTdjaHFmTWwz?=
 =?utf-8?B?OVZscjdSbEZBUVZYRit3Ly8xOUJrdWNIZGZ2SlFLdE04UVBKNHlKRjFvNHh6?=
 =?utf-8?B?b2ZGSERKaW5UK3N4czNDN2hucHhEK0srUDQvc0tHeVRoT1p5K0FhR2c5b3p1?=
 =?utf-8?B?VFRIMkNoc283Rk1xN042cTROSTAyUUp4QlR1NzZFOWNWbVZ3SXhlRlEyVWlP?=
 =?utf-8?B?OEp5TEt3SGJ0bGV6Y1R2QitQUGdSNE9KM2NFSi9QTnl2bGtrdFE2cDZUa1dw?=
 =?utf-8?B?eUlETEhEbEJ5UXpxTUNXcVlMWmZkZWt0bHlnWGJET0NYTmxZYVhRc2Z2ZHFz?=
 =?utf-8?Q?2zISF7xiVrQAPXP8=3D?=
X-Exchange-RoutingPolicyChecked: kh6IXpld9vjKeVlfu7T2JbV/4dmHeYrpcAPI8g8tkvsd/ZbBHO7yYAngED5iN4ltJNAv64IF7SgucODlS6eXlQ0w6yItbQeT9PSt3dY4mkYiworZ/4O/Yxdw2rIqzqdMoSfvm6IOVsv6EVXWzHrCvjGLUnU1zN6iJcHEAc/XvTHKKwwFUoxiGxR7dNIT/j1nkE4RD0pJ+kTGrens331FS6SNpTc7ADh0jodmgfHzI7lalS2XHOPHk6RQ4JEhPIA/YWVx/rfq4mbUAy9RCG7440cONl3U8V3kgtQmfyd4nokYW7Lu6Tjxy99ztwVz102ha0ivECjGENOLtkPj5nDhhg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e47bf4-3617-4cd6-bcb1-08df070fefe2
X-MS-Exchange-CrossTenant-AuthSource: LVUPR11MB9785.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 03:28:34.1133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPCQAcfxLmsQ1Iz8iYie+yJxvnKB9J7mkww6bnOzgIsykRvjf4SgunAm21lZsKquSE8fAeaifNCNHZUec+KG7Vzbb8VemT9CDt2I7qs1cMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
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



On 29-08-2026 00:36, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Wajdeczko, Michal <michal.wajdeczko@intel.com>
>> Sent: 27 August 2026 20:47
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>
>> Subject: Re: [PATCH V18 12/14] drm/xe: Expose bad VRAM pages via debugfs
>>
>>
>>
>> On 8/26/2026 3:51 PM, Tejas Upadhyay wrote:
>>> Add a debugfs file "vram_bad_pages" that shows offlined and queued
>>> VRAM pages across all tiles. Each entry displays the page frame
>>> number, GPU page size, and status flag (R=reserved, P=pending, F=failed).
>>>
>>> example,
>>> cat /sys/kernel/debug/dri/0/vram_bad_pages
>>>
>>> max_pages: 10000
>>> 0x0000000000000000 : 0x0000000000001000 : R
>>> 0x0000000000001234 : 0x0000000000001000 : P
>>> 0x0000000000080000 : 0x0000000000001000 : R   ← tile 1 addr (includes
>> tile offset)
>>>
>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_debugfs.c            |  4 ++
>>>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 66
>> ++++++++++++++++++++++
>>>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  2 +
>>>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  2 +
>>>  4 files changed, 74 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
>>> b/drivers/gpu/drm/xe/xe_debugfs.c index 28135f84e286..e19eafffbb08
>>> 100644
>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>> @@ -32,6 +32,7 @@
>>>  #include "xe_sriov_vf.h"
>>>  #include "xe_step.h"
>>>  #include "xe_tile_debugfs.h"
>>> +#include "xe_ttm_vram_mgr.h"
>>>  #include "xe_vsec.h"
>>>  #include "xe_wa.h"
>>>
>>> @@ -773,6 +774,9 @@ void xe_debugfs_register(struct xe_device *xe)
>>>  	if (man)
>>>  		ttm_resource_manager_create_debugfs(man, root,
>> "stolen_mm");
>>>
>>> +	if (xe->info.platform == XE_CRESCENTISLAND)
>>
>> maybe better to move that check to xe_ttm_vram_debugfs_init() ?
> 
> I can do that. May be you are referring clean view in parent function and checks in child func.
> 
>>
>>> +		xe_ttm_vram_debugfs_init(xe, root);
>>> +
>>>  	for_each_tile(tile, xe, tile_id)
>>>  		xe_tile_debugfs_register(tile);
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> index 24d134754265..af9e1fa868d7 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> @@ -5,6 +5,7 @@
>>>   */
>>>
>>>  #include <linux/cgroup_dmem.h>
>>> +#include <linux/debugfs.h>
>>>
>>>  #include <drm/drm_managed.h>
>>>  #include <drm/drm_drv.h>
>>> @@ -874,3 +875,68 @@ int xe_ttm_vram_handle_addr_fault(struct
>> xe_device *xe, u64 addr)
>>>  	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base,
>>> vram_mgr, mm);  }  EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
>>> +
>>> +static int vram_bad_pages_show(struct seq_file *m, void *unused) {
>>> +	struct xe_device *xe = m->private;
>>> +	struct xe_ttm_vram_offline_resource *pos;
>>> +	struct ttm_resource_manager *man;
>>> +	struct gpu_buddy_block *block;
>>> +	struct xe_ttm_vram_mgr *mgr;
>>> +	struct xe_tile *tile;
>>> +	u8 id;
>>> +
>>> +	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
>>> +	if (man)
>>> +		seq_printf(m, "max_pages: %d\n",
>>
>> is this the same value for PL_VRAM1, VRAM2 .. ?
> 
> Yes it will be same. Also this value will eventually come from RAS post integration with their code. RAS code is in review still, once it will come, RAS will give us FW read value. This is just place holder I can say. During integration with RAS I will refactor max_pages.
> 
>>
>>> +			   to_xe_ttm_vram_mgr(man)->max_pages);
>>> +
>>> +	for_each_tile(tile, xe, id) {
>>
>> as we loop over each tile, shouldn't we add this "bad_pages" debugfs entry
>> under separate tileN/ folder ?
> 
> No there is no such recommendation from arch and there is no real need for users to know address belongs to which tile. @Iddamsetty, Aravind any comments?

Not needed as the address is an absolute offset in LMEM and also that
the association can be made if necessary.

Thanks,
Aravind.>
> Tejas 
>>> +		struct xe_vram_region *vr = tile->mem.vram;
>>> +
>>> +		man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0 + id);
>>> +		if (!man || !vr)
>>> +			continue;
>>> +		mgr = to_xe_ttm_vram_mgr(man);
>>> +
>>> +		rcu_read_lock();
>>> +
>>> +		list_for_each_entry_rcu(pos, &mgr->offlined_pages,
>> offlined_link) {
>>> +			block = list_first_entry_or_null(&pos->blocks,
>>> +							 struct
>> gpu_buddy_block, link);
>>> +			if (!block)
>>> +				continue;
>>> +
>>> +			seq_printf(m, "0x%016llx : 0x%016llx : R\n",
>>> +				   (gpu_buddy_block_offset(block) + vr-
>>> dpa_base) >> PAGE_SHIFT,
>>> +				   gpu_buddy_block_size(&mgr->mm, block));
>>> +		}
>>> +
>>> +		list_for_each_entry_rcu(pos, &mgr->queued_pages,
>> queued_link) {
>>> +			u64 pfn, blk_size;
>>> +
>>> +			block = list_first_entry_or_null(&pos->blocks,
>>> +							 struct
>> gpu_buddy_block, link);
>>> +			if (block) {
>>> +				pfn = (gpu_buddy_block_offset(block) + vr-
>>> dpa_base) >> PAGE_SHIFT;
>>> +				blk_size = gpu_buddy_block_size(&mgr->mm,
>> block);
>>> +			} else {
>>> +				pfn = (pos->addr + vr->dpa_base) >>
>> PAGE_SHIFT;
>>> +				blk_size = PAGE_SIZE;
>>> +			}
>>> +
>>> +			seq_printf(m, "0x%016llx : 0x%016llx : %c\n",
>>> +				   pfn, blk_size, pos->status ? 'F' : 'P');
>>> +		}
>>> +
>>> +		rcu_read_unlock();
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +DEFINE_SHOW_ATTRIBUTE(vram_bad_pages);
>>> +
>>> +void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry
>>> +*root) {
>>> +	debugfs_create_file("vram_bad_pages", 0444, root, xe,
>>> +&vram_bad_pages_fops); }
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>> index d5392beff30c..f354c26c4257 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>> @@ -9,6 +9,7 @@
>>>  #include "xe_ttm_vram_mgr_types.h"
>>>
>>>  enum dma_data_direction;
>>> +struct dentry;
>>>  struct xe_device;
>>>  struct xe_tile;
>>>  struct xe_vram_region;
>>> @@ -32,6 +33,7 @@ void xe_ttm_vram_get_used(struct
>> ttm_resource_manager *man,
>>>  			  u64 *used, u64 *used_visible);
>>>
>>>  int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
>>> +void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry
>>> +*root);
>>>  static inline struct xe_ttm_vram_mgr_resource *
>>> to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)  { diff --git
>>> a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>>> index dc97b0ad0e51..efcf3e1d4e80 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>>> @@ -37,6 +37,8 @@ struct xe_ttm_vram_mgr {
>>>  	struct mutex lock;
>>>  	/** @mem_type: The TTM memory type */
>>>  	u32 mem_type;
>>> +	/** @max_pages: max pages that can be in offline queue retrieved
>> from FW */
>>> +	u16 max_pages;
>>>  };
>>>
>>>  /**
> 

