Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67002CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 22:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1525A10E691;
	Tue, 28 Oct 2025 22:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNJspFaR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B8510E691
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 22:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761691002; x=1793227002;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=szrqi4RW4DfRwjiFDJYheOclALci6q/LnBme1GO7FN4=;
 b=JNJspFaR0SCm80i6oCgmtQtWCgp+Hs8z2NZT5M2mZek3FL125MyQXfPw
 7K2est5G71H1VI0S7jCZCm9eEJN5czMokRtSfy76UVwX7qN4oyp5MB2Ur
 GcM14y3u2dNpZnICrPoxjm+Eb0fNjCQ5IxMveXDFuJCt1sCTeQRrP4QsW
 OzPerSVnnobQhgRhiSKjavW7Jr0V5or+sGgnJl4QUvPKpOP/QGvoQEfbJ
 wQpOLexpmcNFJj16ZRaARpD7VCwNSEcSxWTh+56EAoN6pVNA3N5pWarcn
 GAR2WEwVI/fgwAUp1NuPCZj/jdFUqD7LHf6saBQg9PfJOqjywliTNu70f w==;
X-CSE-ConnectionGUID: AojlKCzKRku1nu/hDxefBg==
X-CSE-MsgGUID: 56nPyx66SDOmG3F12c+EjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81225709"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="81225709"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 15:36:42 -0700
X-CSE-ConnectionGUID: OWcZajlWT3uGLmPLMzjsdg==
X-CSE-MsgGUID: UFZQDOw2Qq6RMZNW0dsWrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="186232112"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 15:36:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 15:36:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 15:36:40 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 15:36:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b75eql6kYYrK6VlwxpbLpMUFVRREPQQ/Jf7/XPBLw7Z3K5zxsqQXDafdubcAwfTVkS6NIH7MDHLZx/TKbai1T1OO8JvjEltcdcHQO322TOWTIzbCZzDhRijlLFWybwSsHTj0dnWd0wWKACuyZfSYG71+rLmEeKtXRBIpiLHlVaRP+Yk3j8Wz8sBHBh/dP78YRAxdPmeHyFylyWFmvunOoLJIzxsIGYy62vFrejjvEHRUGqY4Y9byaxmVko5K4xrGkJSO03GE1+Q2goRaYY7xTLN0un6EnJLcgVqILiUvSDqGcdj1OithlAceAhAhjG3Ry/twQIABs/dwMDdUg9cKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAMww7iFnESuizAFZ36hinxcM9HGJxEvTJOcVPssU7Y=;
 b=heAQsg4yswaFb49JpwaZqXJ4oYlTzsbs2MZgb9c/QrJx78qnOzQVqd6UjHR2SkcYDWspCOexStsVN18CNlo0nUCPE+6HIBPu//0a4MI5l76yhekOj/38kX/FeUXGpJCu+ZL177jvc8W686GffcI/z2n6BcbnpV8We35Jj1U1EQTJ5gujob5gdebaT6Gkypu/8SjdnSonqbT4gYMyyTeChHGdWnsx3WwIP8PTzEUIebKOfeJaFEUjej5oTbQ6NXOdnV7+CvqlZnx5bzu9zTwXgfhg4ZjnTeI3aNRUDAsCzWEFzG6j2+swumNi2XUsg558D8he62j9dtCjFGcM01vPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ2PR11MB8515.namprd11.prod.outlook.com (2603:10b6:a03:568::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 22:36:33 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 22:36:33 +0000
Message-ID: <55e77810-bf9a-4914-9eec-8984d29684da@intel.com>
Date: Tue, 28 Oct 2025 18:36:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/uc: Add stop on hardware initialization error
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>
References: <20251028153820.3139977-1-zhanjun.dong@intel.com>
 <aQEgDjfMVDYELrWJ@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <aQEgDjfMVDYELrWJ@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0375.namprd04.prod.outlook.com
 (2603:10b6:303:81::20) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ2PR11MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: 0518d2a2-8b1b-4126-a91b-08de16727210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnNFUGhoY05RcWNDVngwSXhQWDZqOWZzYk0zSEZOY3hoR1lwREhZRU0ycDFG?=
 =?utf-8?B?VDRtRFdScEdvWWZOT05EZTJyRzFnaDZvZTMxa1pxZysxcnFnZTJPYTJkQitJ?=
 =?utf-8?B?cFdRMWI2dFVhcC9oVHNDYnNJQ3kwU25yY3lZeDE0YVUzRGEweGl0Y3dYbXI2?=
 =?utf-8?B?WXRtc0F4WjNnQ2g3cWpkRHFmRW44eTVVTG5UenppeEo0Yi9KeklpL0w5R3dj?=
 =?utf-8?B?UE1lRFdkUEhndU9ON2R1TlVGdnB0dm5CSXVHN3Y4TTIvczREYUFQY0ViTlpQ?=
 =?utf-8?B?Rm5nM29UdkZNZGRsWk13M0Z3dE41cFI5TksvazhsVXE1UUgzOFJvYmNyMnBj?=
 =?utf-8?B?ODllWkFrbmd3S3kxVHR1SnlZWWpocUFOSjVpRlRDVEdrdGVPRlZJNUlTa1RL?=
 =?utf-8?B?dDFJY2M5bGhOV2hodjAzTklOZ25GR2xWZjcxOExSdXFLak9tSkd0QURXV2tw?=
 =?utf-8?B?Z3NaK01KbTk2aDRlWkZ4REdobDlFWUFrcEU5NG05TjBIdjVLd3NLeThhbzlL?=
 =?utf-8?B?ZXBUbTB5bzJPbFc1Q3MyT24zZTVoRXc2N1YvelpTV3FsVitBY0p4L0lzSVlF?=
 =?utf-8?B?RVZCaXZ1WUt0M0JWSmRLT3V4M3J4a1ZLWk9RaVZtL3F0NHpteFJIN1YwQVBX?=
 =?utf-8?B?M0FTUlBCOUVFdjd1dDhJMVIwWkdqcDRDOXdrOEVvejhqc0R0ZjEzWFlKQWNX?=
 =?utf-8?B?akE5TjVFY0hLbTRNeThPRDE0U2RoOHdlc1hvOVZaT1h1cWo3OXRqaEVUU0Fw?=
 =?utf-8?B?RmtpMmlpV0lpbGV4cXlYdTJkbG9GU1IyRXNWbWNXZjgrb2JMNG01VHhsOWtE?=
 =?utf-8?B?YjRtMkNSaERLMHdRaUpQOGNDZ2VxTkxIUUIxUW56UDNTeFA5TFNBVnZ3NzZq?=
 =?utf-8?B?WDU1NE5lN0orUFA1VHpQNGVqdlJpNmVkTWQzRE9aNWhJT2FydVNUaFdwdGgy?=
 =?utf-8?B?UWFmUzd0aC9YQ0hoWGc4T21tNHZwRGJiTEV0YnZFSHo2d2ZickpDclVtejZp?=
 =?utf-8?B?eEFYOFdNaVRvZEFsMlh5SzMzVHdSamFRb2pBczVDQm9zTHpJS1Exbi8vNk53?=
 =?utf-8?B?VDBLOHFEcGQ4TlVGOGlmazRuV2E0bU1vRGxGUmNkaGFOOUpFZ0FtOWN0aVZN?=
 =?utf-8?B?YVpxV1Y5MlJ6RjZMcXJ1MFUyTkg1dmZWMW40Y0hkczE5cUVNMDhORnNPUHAy?=
 =?utf-8?B?QytTYVlrQmRyWVlDUFpkVXdwUVlCeGUvY0tSVHI3OWhhWm5MQmVzbDNIVjZq?=
 =?utf-8?B?MlZxdGc2K0d0V0FOR25aNldtOUFBd0ptVExjTVU1SUtyZzllb0JQMmZvRHB5?=
 =?utf-8?B?Q2ZWckRUbEYzRmlNOGtnN3gwaWkyR2RzMjd6WWVZWUg2N0hFTkNUd0lHckFm?=
 =?utf-8?B?Yk1rQTlIaExMSDZ5Q2VVOHBtaXNWWlhBVlNQb3c4TkdKU094RmZlVDhGRGVT?=
 =?utf-8?B?em5nSnZra2Q2MXJaMWJsVXNBTTErODA0czcxRlpkZGFkZEk5N2ZRaGQxazJC?=
 =?utf-8?B?b1ZIeU5mWmErRWlwb1c3Y3JaMGh3aUFZaE9hNEdSZ1ZySzZrZ3Z0RkdCeGU2?=
 =?utf-8?B?UDdaVmZDWThTTnVkZUtSeDRuSWd1MUY0MXhlWkFUcnpOQlB5UG5MSDlCa2kx?=
 =?utf-8?B?ZlQ4T25hYTI1Z2MvZTRuQ0psUlVnVEJOUno5WnptYWVoRkt2d2VwY3Q2bUc1?=
 =?utf-8?B?QkNKLzlKYjRsSzdWY1ViT09wV3FIdGRqYzN3aUYvOFUxMU5Mc1p5WnBrQlYr?=
 =?utf-8?B?eXNyWG5MaW5kVUJFV09oSm52WUVKemY1SmxkUVB2Umo3TC9sSFd3dXBvdVpZ?=
 =?utf-8?B?aW1KNUxIWjVmMytCT2E4cFJtWGJhUWZoVEFPbFZRRWpIM0ZBeTVYT3VVaGxw?=
 =?utf-8?B?NkhNcVkyWnpjdEQvM3pZekpUYjlVQWNERG1JTEQ5R3pjN0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3ZvanFHS2xMMERzOFY3S2J1aDFsbVpkVitGTlZqeHQ0MkJ5bmlNSXBJbGY5?=
 =?utf-8?B?TERLZ2xuZVpxY0EybjQ3dEo1bG1TWkZHempOVG4xQmFaaXdBUkxDK0Z4dFFo?=
 =?utf-8?B?Sis0ajJjaGlUc3B2YllrdkJRcXpqalFKQU5CUEpKYzBpajJPUFhhYXI1N3JN?=
 =?utf-8?B?VEZiWTYvRmtXNzYvN2xjWFBUaVllV05MVzdUeWZyQWNPN2lpUFIvZWNvZHZO?=
 =?utf-8?B?ckRHeHdDQ2p6NXBZWWh0L01rZE1ETlQ3SnYwYTRlRE5tYTVIU0R6b1N5WEFS?=
 =?utf-8?B?bnlTZFB6anBsZHVFM1k3QnlFMXh5bStSZmxzYnpudzk1UVFvdVpKWTJrNmd6?=
 =?utf-8?B?bVpqRHpCV2tpdWVqZi9HOUhvT0J1eEZYaDFNT01jQmdBNkU4OGdOYjM3amQ0?=
 =?utf-8?B?SEM4QytZQm1mdEpteXVIOUttOVZmYk5nYm5qbW9nM0VwYnpCeFJFbjllNFF1?=
 =?utf-8?B?VklCbHpNMkdSbkRLck9rcENxOFhNR2xhU295OWlVT0ZwcTBxc2QyZE55eXdP?=
 =?utf-8?B?L0dNTXVVSnJSZlpjcjc0ZU5KcUJuVlJiS3M5YWpYTm1VRzF6S1JFZXdybEZH?=
 =?utf-8?B?TVQxV1RGWFNXaG5XbzRkdURYTG0yTkVHQjhaVzZRT09idXNOb252anViNEF1?=
 =?utf-8?B?UklMWW51eDVBL2dTWDNER1prZzZoY2NMV29UZXpKN3duWEpPb2NQUS9xZ2dY?=
 =?utf-8?B?R3N5N3FwYjhUUWlVU1A4NTU3SFJlUC90L29EK2ZFOEtYQThheU9SN2Ixa29J?=
 =?utf-8?B?ZUU0NU8veDJtcytMOE91L2hjN0Z6cHlSVHF2bG16S3d5M3hQSlB1aG5NS0lW?=
 =?utf-8?B?S0dYVUIzWmJqeGpHdndTNmZ0VXR6Q2YyM2krdHpvb1pMcVZwRytzTXZQR3F6?=
 =?utf-8?B?enowNThic1hYMStJcjZJVGhWcG1FYVVDNDZWRWUySkJpYzFIazdnUWFMWUNO?=
 =?utf-8?B?Y2Rkbmgzb2dYWUVRVXZ6OXRBMmNlb2lSRXVEcDhKQ0dvWGRwYnc3YWMzT3pN?=
 =?utf-8?B?Z1l2VG1HN1dsOExMeURxQTlpcXp3cUNGWFg0NVg3c1hQWnZsRzNrYzJReDQz?=
 =?utf-8?B?aWo0VEpXajY1UDV3MkVRaEE5NE1vM0JmcGVmZWk2ZU1ZcVNkUEtqdFYwM2d0?=
 =?utf-8?B?c0tBZkJaRm81T0RGc0JHQnZkSW1IQWVOZmtUelJES2VoK1Vjd285aE4rU3E3?=
 =?utf-8?B?WWI1SkIyY0hLQUNKQi8yWFFiUUppYXJlUUpHbEs2b0ozOVRNamhMZm1zMmtj?=
 =?utf-8?B?M3QrcElKRVd5NXFXN2pLVWdzNldhdWIzZDlFRy9vbG1oOWpIeUhFaEdwUjBK?=
 =?utf-8?B?NWdNRjZRRXU1b3AzZjRTVkt0Uk93MUhmT0VRakpTUnkveFZ4V1BnaTcvUzcv?=
 =?utf-8?B?cWpORW5uSEl6MkJsY3g0bDUySXA3ZWNqL212YTNCTmNLeUNsUHRFNzdNVHZm?=
 =?utf-8?B?ZDJ3V1dPL3RDMDdwdWx1VE1sZzV1cFVYZHdzUjZDU3Y2QkRoZGRNRUlyNUZm?=
 =?utf-8?B?eTJYMFA4WGNsZnFQRGlUMTFnNDhEQ00yeC9Qcy94ZW1vZEo3eUZOYlNMR0VW?=
 =?utf-8?B?Nmd0L01rV0FLeDVHRE1ocUhSc2IvT0hCWk1xVzVITEZoQUJ5TVFZakVhTno5?=
 =?utf-8?B?MFlUdnFld0g0N2J2VTdHT1RNcFF1bFBCWFE4MURaREpNdy9UQ1BXRVhXa2x6?=
 =?utf-8?B?aWM2aFI2Vk9oMFVjeHo4Sy9sL0N2THN0ZndpOVlOVk1Sc3VEQTYwSURpUjE1?=
 =?utf-8?B?U04yYzU2QWNiSWc1RzJhTXUrNEMzN3JYMkQwOVVXSytFbHZ6UWNqYW00dEhq?=
 =?utf-8?B?VWl0ZUFKRWw2am5WM3diOVNsT3g5c3o4bkRVNCtvMm9PMVpUM3lDRWE4OGh3?=
 =?utf-8?B?UEJwdFROWk9TeFNHMlRIWTljek8vR2JuSmZ1eTduWGduMENNTDJGRE9qSFF4?=
 =?utf-8?B?M1RzbndNVXNCTlUyQnRIUVV5eHczcTY2Nm5SdENpT0R3S1VJeGhpemFDWVMw?=
 =?utf-8?B?Nmd6WnpJOXc5cDVYVHh5RmVONys0RVYvNy9tK0dqQ1J2NWd1bWdXZ0QyVjN4?=
 =?utf-8?B?UGJEQ3RlMXA3T0RCVjRONVR3a0ZNWS9qZkVYbkZmdlNmSWxtdTZab1ZxeG1k?=
 =?utf-8?B?UVk4UjRKeVVxaDJvbjc2a1pDWTNWZEliRTUxNk9MV2ZpSmpzbyt0RHRCeVU4?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0518d2a2-8b1b-4126-a91b-08de16727210
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 22:36:33.1420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Vcfo1/WD8daTlEYBnF8QO7aeheJ6LhWNJyYzVgwvz27FooTJHn34y+zgeTuzwCr5K6+8o/x04YkqcYkhZ/wpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8515
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



On 2025-10-28 3:57 p.m., Matthew Brost wrote:
> On Tue, Oct 28, 2025 at 11:38:20AM -0400, Zhanjun Dong wrote:
>> On hardware init fail, the hardware might no longer response, add GuC stop
>> to clean up exec_queue items.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>> v3: Switch to xe_guc_stop
>> v2: Switch to xe_guc_ct_stop
>> ---
>>   drivers/gpu/drm/xe/xe_uc.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 465bda355443..00ca5883e006 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -173,6 +173,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>>   	return 0;
>>   
>>   err_out:
>> +	xe_guc_stop(&uc->guc);
> 
> If exec queues are destroyed later—after the submission backend has been
> stopped—the final put on the queue may be lost, leading to dangling
> memory when aborting the driver load or unloading it.
> 
> I think you'll need to call xe_guc_submit_pause_abort somewhere to
> ensure the final put cleanup messages are processed by the queues. Maybe
> we add this call in guc_submit_fini before wait_event_timeout?
> 
> Matt
Thanks for review.
My original thought is through 
xe_guc_stop/xe_guc_submit_stop/guc_exec_queue_stop, where will do clean 
up, might be not covers all conditions, let me try.

Regards,
Zhanjun Dong

> 
>>   	xe_guc_sanitize(&uc->guc);
>>   	return err;
>>   }
>> @@ -228,6 +229,7 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>   	return 0;
>>   
>>   err_out:
>> +	xe_guc_stop(&uc->guc);
>>   	xe_guc_sanitize(&uc->guc);
>>   	return ret;
>>   }
>> -- 
>> 2.34.1
>>

