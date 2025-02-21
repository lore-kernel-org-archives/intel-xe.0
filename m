Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28C9C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 19:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A359310E241;
	Fri, 21 Feb 2025 19:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAgy9Tav";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0174F10E241
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 19:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740167048; x=1771703048;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c9IyBZtPHvquxBqTRUx6S8Kx9WByllMr1t9mlx/0nO4=;
 b=DAgy9TavCcB15rknWokmELdZgG97ai6xXfzcXw9MZTsj1uq0O8JELtFS
 P5ztsZeDRwBocav/Dc26cByqYU0/JBMLXIqyBLN2RtRxEwhl9+sucD6xJ
 F/vzDTdjAzwYD5lhLrpNn7U43oQa9nLHXt1sTBbqWwtko4Zbgv9MqN2fb
 mFUt60kvEVTwEaKHMfiHSJCCe4PMXw0pIDz5nXR/fkx1UA/DgjoVyQGkK
 G8hdfs96eLqIwj1Jhd83KujelZGirtE4ponc8GxqUFAii9ztIxcDNdgKG
 9YwtFfT4ilvAH6C7aG5yu98yS6roviwhhKwU9pwdvMXTDKgGBXvGTD7Y9 Q==;
X-CSE-ConnectionGUID: 4c44jLtxSveUyJIqg5ux6w==
X-CSE-MsgGUID: Od3YnB8IRSmXIR6Nn53Peg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41121671"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="41121671"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 11:44:08 -0800
X-CSE-ConnectionGUID: n/lo2y43QnmBY5TjDJYiRg==
X-CSE-MsgGUID: oqiLeJdVTDm+tQSVHBT1VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120377310"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2025 11:44:08 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Feb 2025 11:44:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 11:44:03 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 11:44:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWrauZRxT0WDmJk7IYVpybfmY1y4AcC6AWxz8Dws92wOk0BVoaKIBT7dt/PjknGONjxFm+DYnWjZ56TwgsG94v8bbVz9Sjr1s9Zh9uNlzwyYA5Yx2lBMiQXHf5TgCcDHyihJG/o0r7PQygZALSJX50jhgmozMLLsP7TDga25K5K0OxEY32FaxVSmv6fcwcj5/gX5ojOC5kH5DiKuBnsshsBFz58C0BaW6hkVDAvXJfRS3VTYu1yekZv3cj1mdiQyJBF4rCBAy0GC/XUZFY9RUvPdz1uXr24rx4Ay0ZbypPJiMRx4zJjNLt3d/zTvdpQOjuZRjGSSCDqHGJrFJ5egpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdlzeVauX2YurvWb1z0vfN8kR1woTEq8tj2vmVznqzA=;
 b=Cm3OmIz35X8SZ7tUYp9G/b6JjmIY+FCMaRQkij0kUnFOJJV2iGVIUv6r+8XmImTw4QTL2RezgZrwECrSsYmdGRHvAyKYKg4AqBtLBCKXuZvh/PUKmiG2PLGt/XTO/LNqwiSLocb4s0QdanFl8z1zb0pWCj5LXZGqyfPACPjn7t04lXYFlIbMUXH7LZOm/49txqw3BiuAWvZx1II0Ft98yiOiq66IwroFH1FeLgUjMfCfTOEKuw3/5A1xDpv0UvtrTDKKzDZ/iNsD2E4sTADXnCGixkr915/oxnMbL4+F+HY3hpV0KYuTCiwkyr6lkzD/zhPxznp7kS9552XHkMRuUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA2PR11MB4969.namprd11.prod.outlook.com (2603:10b6:806:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 19:43:18 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 19:43:18 +0000
Date: Fri, 21 Feb 2025 11:43:16 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v8 5/5] drm/xe/xe_pmu: Acquire forcewake on event init
 for engine events
Message-ID: <Z7jXVEvzltlnIUvn@orsosgc001>
References: <20250221105908.1966738-1-riana.tauro@intel.com>
 <20250221105908.1966738-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250221105908.1966738-6-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:303:8c::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA2PR11MB4969:EE_
X-MS-Office365-Filtering-Correlation-Id: 93f1e6cd-ad91-4537-7199-08dd52affd67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b28rRnFQZG9hVGMvaUlRcEJMaThvelB1VWVjZTZ6amozY253VzNyeUVQTnM3?=
 =?utf-8?B?SmlWYjBVdGs1MkFBTk1nWkdGc2tjZWRZNnMwemw3OUxiUE9OUXRzZUlTT2VW?=
 =?utf-8?B?R2t4bmdHcmtvaFlHUitaVmxHZHh5ejRuTEZNYmUvZ3lIeGpLdE9EZEFpSjht?=
 =?utf-8?B?NVhxRThrbTNVMFFwaVYxWkJXUDlJRjZPM3A0ZnAwQllCUlM5b1VCazFWK0hK?=
 =?utf-8?B?UCtnVUN3bUVYbWlhRit5aXJiajBlWGVyVXdvMGw3aFRxbXFJL0IzWkRVNi9P?=
 =?utf-8?B?N0RJTCtwSEZFUjVsUXV0WStlNHZoVHdvVVJERjFaTmp3SENzSXBUck1uTTNX?=
 =?utf-8?B?SWR5YlpiUStneUZEUkM3OE9kNnAwK1NXSFZMYXpETFQxS1IrM3FjeG9PZFRY?=
 =?utf-8?B?b1FoUjNIM08zNmQ5QVB6MjR0QXFON29rd0NzR2NwbHlvS3IrWS9Fem45TXVQ?=
 =?utf-8?B?ZzRBb3liSzUyMXduVklIR0FwdzBGSFJDUlc2ODNWeGoyT0hNMVdZUFFCaEpE?=
 =?utf-8?B?blR5UWpSRDVkOVd5Y0pQMVdLcUN6U2ZZc3RVSUV2TWJLeHBuNmxwTTNZczlH?=
 =?utf-8?B?SDFldVlOSFJFaDFNOEQ3d1RSUEIxSFBSWHQ2cHZVREZXUXN4R21wZVRkbXFi?=
 =?utf-8?B?eHJQc2hkOE15UzhCNERpcko4MVgzSnVabUlzNEkzN3FoY0xTUlFHVGpQZ3oz?=
 =?utf-8?B?U0NZU01wMkFGSEtQQ3ZLZFh6dTlqaFV6TGo5bGtNOXV5YlpNeWxsZk8rV0I4?=
 =?utf-8?B?WktHUVVPdk1UZmRRRU1wRjNJM3NwYjlXRE1Dc2MwTGpsUGxSRHBVc21KQjVi?=
 =?utf-8?B?ZDZSd0Z5SlNuTXNFeDZsVXJpYm9GN3AwUUsxbGVQWVczTlJhMzFBNk1GWmVS?=
 =?utf-8?B?TzFLc1RiZFpvM1haa2pJNVlMV0E1S3BGZEdsNUdnYUZ0SnpzWmdmNDlraXBN?=
 =?utf-8?B?bkdtYXJpamUvWFgrTitLandhZ3c0NysyMTR1ZGRtRjB3eFE1MFV6Z29rRzV0?=
 =?utf-8?B?ZjhKVlZJTVI2cXViQmk5OFp4czZBNkQ0ZG14WjB5Q2FMVkNKNTV0NEx4aUlI?=
 =?utf-8?B?U1hzYmVNbnJQL2N1ZVplekZCTDVpeFhnaE5iYUZZUXpmRUY1S0pJRW14N3pv?=
 =?utf-8?B?c3pXZHJTZFVOdXlIVXNKcm45bzhCdDJMemF1SnF2ZjFZVFhzbEsyTmxCNVJF?=
 =?utf-8?B?d21Ddmt4ZG9aZUt6bVBSMGp3c2E5SzZZWDN3UkJZQnNkNkhUemZ4Z0VNSWJx?=
 =?utf-8?B?Y1hnNGw0RERvZVlQWXc2Z2VVQ0M2dlZseW5GVWJFU3FZMjZybnZKcTYzMjcy?=
 =?utf-8?B?c1V0aHMyQ2VvUjYzWmFxM0RJZ0FrR2pOSmdOYnhyWW44Qk8rbkVPWVNyRisr?=
 =?utf-8?B?TnB1OVhNaFpVVWtya3MxdVlQWm9FSXQ0ZElnTUlwK1FNblMzd2U0OExhNHlW?=
 =?utf-8?B?WFFiajBjWk4xTlg4Tnh4UkF4c3IvYWk5Z2lqUVRod0N0Qk9VYXptcTdNUnAv?=
 =?utf-8?B?N0EzQkdYTG9KWmlkZWxQZVZQV2JFSzBzL0NSWUsyR2tyM0x2UmMrd3cyVkRD?=
 =?utf-8?B?azVHcS9rTHZBN3E3bFkrMzZQdTl6eCt0R1RncFJ5SndmWVRhWDhsZktxd09O?=
 =?utf-8?B?NnhrVE1sNHpXUzdZVm1sczhzcFpyYTlEdThCR1Rka1JYbEdkc3grOHdVVWtl?=
 =?utf-8?B?dnozSFEzMnVKK1hXY0tWUWxCdmgxZno1TklqWTdLM3ZGai91WmFiVkxOWWVu?=
 =?utf-8?B?d3NFMXVzbE5qWHIzRmdsalB3R3hvNzhiNkxwNzB2eFZLMU9VeEwvR1hTK280?=
 =?utf-8?B?M0lBWjYva2YrQWxVMDFncUt3L21DZUNvdFF2NDJRd2FYaXNDM29kamJVcFJ0?=
 =?utf-8?Q?pK8K3ZTct4HRD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VytiRE45ak0vNmVRWTExZVljZHRRWFY5Mm1EeVRlRGQzWDlYTGxjWnFtcm9y?=
 =?utf-8?B?WFQyVURwMXJIcDFRa3RjYlhmTUpEU1dNc3llWFpTN1labkZzT0puN2hLVEhS?=
 =?utf-8?B?WVp6bzVKOGQrSFlELzRFdXBpeCtEaXFzWS93VGZPNU5IbktQODhLY045ck1w?=
 =?utf-8?B?aE1oWXh6LzZmOWhHUzZzRkRRSG5uTFVVOXlkR0h0UGNBaU5kbG9KeGQvSmFn?=
 =?utf-8?B?cjIxdVZGNDJZOWdZUHRHY1VmUzFRSE9iNEhsTmk1N0lQRGM4aXB3NktwSW1G?=
 =?utf-8?B?SFhwVnAvYys5RjdBWEpqRUhVajhEcmkzUFdtblJxWCtjU3dIT2pOK3ZaQTNq?=
 =?utf-8?B?R3Zlay9Odyszc2I4UVE1NW56b05IUGduVGpPYmh6SzhTazVicUtsbFc0R0tE?=
 =?utf-8?B?bFFtNURod0pCd3MzcXllQ0VPUDNmc1V1c0N4UzU1cGsxUXF0WTNVRzlRd1JE?=
 =?utf-8?B?cTRtaEhZTGFZeGFxb1N5OEZKZmxXdGRUMXJVQmRHV1gwU2lETVhRbEhWdjdE?=
 =?utf-8?B?dzljWGNDTkJNMTdjVGk4bGhVQWRCR3Z6UC9RSUg0VnpYRHpzL0c0eHhnY1Ex?=
 =?utf-8?B?KzltZFFIUkhnbkQ3dFdkdDV6UHhmN0puVEt1ZVdCVHNFU1l4MU5zS0lSakRC?=
 =?utf-8?B?RXpqYXdwZTl5VG1ZQzVaNUdhV09pMDk5Y1lWVzhoL09QK1FoWEtSSWVYTnJa?=
 =?utf-8?B?TitzR2FCUlMweW9FS1UwTmtuSjNzcnlVR29yaG51alhPU0svck9iK0g1VSs1?=
 =?utf-8?B?Qm1ONy9EV0ljejVUVlQxb3VDeXoyYnBnc1lkcWNjQjVKR1dRRFl3dDF1Zmtx?=
 =?utf-8?B?NlB6QVBVSEpJd0JJUTNxR2Q4UHhRSExaZndGMWdaTU9lUG53YlMyU2lBQUFq?=
 =?utf-8?B?amsxNVV6QzNoZjhvRldXK3RpMVlrZ1hoVFVualhKZTlCbysreXJNNWN2T3BO?=
 =?utf-8?B?Q3FHRFFwVFY0T3c1NnY1MW1vWVI4NURnb3gvZWRlK1FMZ2NDTHM0V1JsTDQ2?=
 =?utf-8?B?UnBzOW9Ob1kyYVh1Tmk4VEc1WWZnbmpYYTdXWnpHaCszR0l5QjA2bWFhS21Z?=
 =?utf-8?B?QzY5VG45MUVBV0RTTzYrT29NTmFlN1NVYXFiNUlDMi80elE5QTdzeXJ4WWFw?=
 =?utf-8?B?VEJoM1hDRGx5bXlSbEZoTXpnRitHVzNTTVZEWVRKYkVvcVRnUFJsd1JRdXo4?=
 =?utf-8?B?VER4Z29RSWxDOXh1U0F5VUpYelhLTUQrUEJtOUFCaGQzVGducVYvKzdJN0Q5?=
 =?utf-8?B?Y0F1Sml2N2hBT1FQRWZGNHVvd3NVbzg0c3lmN2FHVC82RldidjUyNncySWJQ?=
 =?utf-8?B?eDV3WW9tMHJpZ01KOTdyczdLblo5SlQ4b1EvQ3U3MTcxSnBCT2ZnSHpxNFJq?=
 =?utf-8?B?YklTWGpOOHZITldKNHRENjNKRUdPNHBhSW5lR0xaWUs0SmsrakVkYU5sR3Fp?=
 =?utf-8?B?bFVhc0c2cU9VR0RyVGt3RGZPK1pXcGJOaW1QUjEyZDhoWVNqV0NqQkhtKzlD?=
 =?utf-8?B?YklDV0M5V3oxTGFHbGlha2xPdDVPZXNnR1RQWmRhVlA5TWwwMFZZOEVrd0ls?=
 =?utf-8?B?Yi91dG9aRTRybDE2eXFNUGVrRHFTLzlWQ0NDckJvemFoZlNmUDEyWnFXY25H?=
 =?utf-8?B?NkpPTzRSR3paa0V3ZFFpNlBsc2QxZk1obHFPSlhrVHZ2Nm44emxjUHBVQUUz?=
 =?utf-8?B?R0d3RzREY1p1QXdMc2lnNnZHZHJDYmV6dmlpenRydmhLSkhjbFRYYm5jaENX?=
 =?utf-8?B?anRGM1dXUG5TOVd0VVhReEtOc3lkZUliSDBKYU4wSG5tcytRYUUvUWh0M2pz?=
 =?utf-8?B?dldpeTJEV0k4ZGF3QU9pS281OGU4UmxEdU45aDFPeXo1eU5ISm43NmMxSjR3?=
 =?utf-8?B?ZmNveE92SVY1RSsvMi9NTlVWdXJPMzd6Q05kWUNxd0cvZHdlUktoVjhJV2dZ?=
 =?utf-8?B?TWdRVHJIMHk4N0QrNklxMGhUSU1zT1JHR2lyaGlKK2RENm8yZmtyZ3hJK0tT?=
 =?utf-8?B?OGpiRWNNY0ZkSGMzR3g5bWhYNWhJTzg0MlZqdHR6M3BNMTRzWDFMbFlMTGpU?=
 =?utf-8?B?cmorcW41RDRTVGhUS05aWFFRY3pPUzg5WDh1K2l1eWQwdFAvTU8wbGt6U2sx?=
 =?utf-8?B?blorVGZYb0JZVEtCUnplVHNCWXB5cXZyRU1EWXBJV2J5NU9WZTFPMjIyMWxY?=
 =?utf-8?Q?Vlzn5X9Y6OB6Od6fBBNb9lI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f1e6cd-ad91-4537-7199-08dd52affd67
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 19:43:18.2707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6sRJF7SwaHPLMvpyGjXQBjdR4tDLbfPzFGbGaP9ks36u09rwoMheGk/Es0TAmB7CqPu+AV/zfgEmszoSGoraXkHtkwydG1DXzVkCCxJeA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4969
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

On Fri, Feb 21, 2025 at 04:29:07PM +0530, Riana Tauro wrote:
>When the engine events are created, acquire GT forcewake to read gpm
>timestamp required for the events and release on event destroy. This
>cannot be done during read due to the raw spinlock held my pmu.
>
>v2: remove forcewake counting (Umesh)
>v3: remove extra space (Umesh)
>v4: use event pmu private data (Lucas)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>---
> drivers/gpu/drm/xe/xe_pmu.c | 50 +++++++++++++++++++++++++++++++++++++
> 1 file changed, 50 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index d2c035c1924e..0c8563830195 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -7,6 +7,7 @@
> #include <linux/device.h>
>
> #include "xe_device.h"
>+#include "xe_force_wake.h"
> #include "xe_gt_idle.h"
> #include "xe_guc_engine_activity.h"
> #include "xe_hw_engine.h"
>@@ -102,6 +103,41 @@ static struct xe_hw_engine *event_to_hwe(struct perf_event *event)
> 	return hwe;
> }
>
>+static bool is_engine_event(u64 config)
>+{
>+	unsigned int event_id = config_to_event_id(config);
>+
>+	return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
>+		event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>+}
>+
>+static bool event_gt_forcewake(struct perf_event *event)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	u64 config = event->attr.config;
>+	struct xe_gt *gt;
>+	unsigned int *fw_ref;
>+
>+	if (!is_engine_event(config))
>+		return true;
>+
>+	gt = xe_device_get_gt(xe, config_to_gt_id(config));
>+
>+	fw_ref = kzalloc(sizeof(*fw_ref), GFP_KERNEL);
>+	if (!fw_ref)
>+		return false;
>+
>+	*fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+	if (!*fw_ref) {
>+		kfree(fw_ref);
>+		return false;
>+	}
>+
>+	event->pmu_private = fw_ref;
>+
>+	return true;
>+}
>+
> static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
> 			    unsigned int id)
> {
>@@ -144,6 +180,15 @@ static bool event_param_valid(struct perf_event *event)
> static void xe_pmu_event_destroy(struct perf_event *event)
> {
> 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_gt *gt;
>+	unsigned int *fw_ref = event->pmu_private;
>+
>+	if (fw_ref) {
>+		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
>+		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
>+		kfree(event->pmu_private);

For correlating the kzalloc/kfree while browsing code, it helps if you 
use the local copy - kfree(fw_ref).

Thanks,
Umesh


>+		event->pmu_private = NULL;
>+	}
>
> 	drm_WARN_ON(&xe->drm, event->parent);
> 	xe_pm_runtime_put(xe);
>@@ -183,6 +228,11 @@ static int xe_pmu_event_init(struct perf_event *event)
> 	if (!event->parent) {
> 		drm_dev_get(&xe->drm);
> 		xe_pm_runtime_get(xe);
>+		if (!event_gt_forcewake(event)) {
>+			xe_pm_runtime_put(xe);
>+			drm_dev_put(&xe->drm);
>+			return -EINVAL;
>+		}
> 		event->destroy = xe_pmu_event_destroy;
> 	}
>
>-- 
>2.47.1
>
