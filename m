Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6864606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 06:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MhGFXDxd;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=g6+3rYyI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA6710E593;
	Mon, 23 Nov 2026 06:56:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09E910E593
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 06:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795417003; x=1826953003;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=scyXIpKalK8O32d6zHGL1zMMXyj8TDr3hm5uLO7+lzA=;
 b=MhGFXDxd1RJ6J4VT4Rb64xJ+eW5PkRfAv3J2H2gkggdNfl16F5RE7Md8
 Vr/YCQ9yiwHM8H53igtIW132Pw52hFa/Q3JrYFl68PJAXsSXdSxrwn+Gx
 DvwnStnISjDcLocwfEx3Gx3Wijmk8oRR1nGZSCp2JZrgjYOk2q+YY2kK5
 wXArctRjkJsABAKSzO8HwU0SHaj+OrRXHxO4PsKD9QbXBmc2anNBr8QA7
 YoAMIqHdmddP0zt24FXIREF4TKxcTdwI77yn6DI9hoUeX8TLuzFCEYRgP
 wyt0TGIBuo6DMEKrgVcyxMDaaekxRo27ngURkXS+nB43dhs8Alj9A1kpD g==;
X-CSE-ConnectionGUID: tRmRJqRGSsuSUboVvrLi4g==
X-CSE-MsgGUID: 6BF9gKi1QJGUQZatozpcAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4110911"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4110911"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 22:56:43 -0800
X-CSE-ConnectionGUID: SA7/FmciSR2XeNV39SQoDA==
X-CSE-MsgGUID: PPcZMLehTVibI85iHhrbEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11131065"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 22:56:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 22:56:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Sun, 22 Nov 2026 22:56:41 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 22:56:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIqzMj+RPlvK1hNZwGQpmYrULtuSABRKp6b+ct03m8PVvlw4BeCP3UcAexVJAhwCLwwBSu7Zr8738IOXQlplRlFQfNNpu090kSUboeInvZ+RdxfX2Ep7WdWy/otlKYSDSAdx2yAOUwoqUl+ApBLrX1vLN47BLClrimgl5Oqi8FErmnm1neXMSsWC9pTDZ+FGYh/kznqsDWiUlMnPJSBXeHfTQOBNji6CE1znFAnTmFspZoCRnksR8LQJK9P18oJ8MMAnb4E0FkKdYyrhmhLygMBWMMOtlS3rWpAkHFB0njHngMVajMzjDnCbJdKPnz9bXWe0/D0fWPpzkXFUllpFNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcNld/sXhJwh/XxNE8/bdsz6Btnf3evquwx9WdPSVDk=;
 b=kMlgenC66ERTVZM4AAwpeMUyKasyx8KFwfCFv3fg8hxQcP/oUGALfleaYXw/LE+FRaFQoI5zLEFhvFMjhRHcdsHSqyxd9SU/p2DV6GYYr70/qbTpC9xUr7atQeBWGsN98ZquJgqjRh/Q5WWDcxrRE1A3NpmL/yy+cwBcic3J0Bpdj6Deltp99lDtTN60DQFmKTl3AXZeAmnCcHQp3EibIppnL3LJ9Cl8B7gnX2NqKhsratRu37jrho7hmjcZQ4uxr5u17vbwH3kDC1OfO7Q4oz5yUcs33K6KqRYQupnEXrvwXdLbgx4s+q7JH/ITU+ST1zhluoM0MisECyRu1VXmKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcNld/sXhJwh/XxNE8/bdsz6Btnf3evquwx9WdPSVDk=;
 b=g6+3rYyIkvg1RvyLh0IIydWTx6TR+onS23w0UxV3aIMWFvAW/53qdeHnzeTJcI08fEmdvtO2aHapAOJs70YyGh6kmZk2BR7tIs4h+FuYUXoDcEQE54fiHEN/+8coNObHKpR8erekhNHKPa5rGN7UeofV4QfWL+siZmjhTb1t4Cs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 SA2PR11MB4795.namprd11.prod.outlook.com (2603:10b6:806:118::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.14; Mon, 23 Nov 2026 06:56:39 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 06:56:39 +0000
Message-ID: <0b508bb7-e989-46e5-98ce-81adb3101000@intel.com>
Date: Mon, 23 Nov 2026 12:26:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe/xe_ras: Skip gpu_health sysfs commands
 during reset or wedged
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <soham.purkait@intel.com>, <raag.jadav@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>
References: <20261119163913.1760721-1-ravi.kishore.koppuravuri@intel.com>
 <20261119163913.1760721-2-ravi.kishore.koppuravuri@intel.com>
 <7c6a255a-6e1b-4fc0-a952-3526783abf80@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <7c6a255a-6e1b-4fc0-a952-3526783abf80@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0170.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::7) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|SA2PR11MB4795:EE_
X-MS-Office365-Filtering-Correlation-Id: a893bdb1-9235-4241-8d20-08df492eec1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|261009223027099003|20046099003|261021121427099003|261026140227099003|261102123227099003|261022105027099003|261028144727099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: OP16B37j6+F5fICFZ9B5mBDgP0g3klIfRlMI+izQehXqYfhClEQyJ42DZrRy6tmLEv7M03KCYljwZqCp5ShQdGARLiezwERhleAm5XS+LT8lvbyTPc1D9Ig1gsG/+om57KlE/HQLP2nKfWNJEiNzZb0gUilyPR2NPekRnO448QJ4x0ryexSOyXwyIMmWI0Cw04Wsq1w6SoTZSsQVAzezE9RhWBBMRE87KAglNcyH1fNuts+Hj+ZwNM/JvjgV+XqtKe2F6jr2ZuKqknLjDAw6IlsLt6JpqnDxWDSwmnNY/nyc/cK3a5VzEtIEjFw9UFwYQqSObR5dVpr6JKqhjfhU/4DblROQDFILnZljzzIJYT96m7E15LdsMXmX5iWNTi6H7Xc0OAl0+uwSAEqEwV/Mw39fQM+W0+XKZYCqJDkljP4sK8mbs3y1uPN/p72bAL4lS6nSUvTofGOvgrFgJ4v1iVtQUTHzE+NucmUX6wtH/W68rYv6l7YuypAJiAWVpNqboXsz+4S9UeUVrmi9ijsfRC+/CD1PuuKgHid0l3M3faSC/pB+64BA3D8a2guC0BXPVgz+yVhxL+QVJra4xL5eUwM2v/Dysi6dtzUyQcI4l1ri+4u7NMkDkUlcWFPAeyjU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(261009223027099003)(20046099003)(261021121427099003)(261026140227099003)(261102123227099003)(261022105027099003)(261028144727099003)(56012099006)(10067099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkdCSG5rNWFNZVpIVU9wanBEZGlLaEZLRXJwNFdBVkVzYktLcU0zWnc5Q0dN?=
 =?utf-8?B?QnoxUm4vcG9ScXpyQWdDbVV3ekY0YmNxLzlReEtCZHI0eklyMVZjdzlqaGN2?=
 =?utf-8?B?a0UwdmxYanExQnV5RmQzN3VidHd2OWFRa0orWWhNdmpnaWRVZy9XRXRFVnFR?=
 =?utf-8?B?eHhvNEtwNGd4K0txSnNhTk1FelJZMXZTKzNmRUljcHFmNkQ4YVkzTldlRGZY?=
 =?utf-8?B?M0ZQY3FZZVk2TGxMVXFxSkRuZWdYSzFXazAzVlhIYjkrWWZoRExiRlpBdHRX?=
 =?utf-8?B?b283eXhwdVQ1YUhKMnpGaGEyYTF1b29XREtuMk5FZk8vZW5INTgxa1lRbEI4?=
 =?utf-8?B?SXUwYUYwKzJySnFUSndzQ0o3aHBzSFJHNUJ0aTAvcGo4SzRlUktzWG81dERu?=
 =?utf-8?B?blJYYjk2V1ZoeXp2L0NpRnRXU1dOQ2xwMTJUWjNWVG9LSnFXeS9hc1ZVb21t?=
 =?utf-8?B?NERZV3B6RW9kdTl3UU9RREVhc0xWTHpCM0cwMi9lenpFQ1VldlZ0WFBsOW4v?=
 =?utf-8?B?eTdSaFpqZHBwa1pTZzlabmVNNDRrOStxS2dyNUdWMTg3QThTRk9SZE1tVW40?=
 =?utf-8?B?UVJRMWVwN2lVcWVmb0NXYlBZV3I2a1gyaTY0Rjh1NDlSUDNBYkgzSFlFOFQ3?=
 =?utf-8?B?ckVkU1phUjRkTGg5Y2s3RGUxUGdsRXQva1c2K2NyQis5RWZ3cFMvYjBkTW5o?=
 =?utf-8?B?MCsxaGJyOWRrODhabkdNWmRWTUhLWUttU1NwQWRWMzZ5SmFzd3ZYaHNEeEJz?=
 =?utf-8?B?OThodG5rSWMvUGt4WFJBOXdwVnNpam9OUVFVZDJUcEpQMmhJakVCbUlmYTVP?=
 =?utf-8?B?T2NoSVBENkc3MEVIb3pEMVlsTThlU2plR3hKa1lLZkFNVWRmSVdjL3laVnJs?=
 =?utf-8?B?dkdpUzZGcnBzTGRyTEIzeGt6b3d0Ly9JTjJscVZNY2VpRXROcUlCbFYvZzJ0?=
 =?utf-8?B?OWlERXgvVEpBbFdnNEp0eUVkdUNMMFpJOW1XYTdlRWpRWWFoUW5ja2xjbFpK?=
 =?utf-8?B?UitYZWoyeGRKQk5tQmdFUW4yTXFRTzdFdWs0WjgvYlNuWnNpcWdFcThWYzVj?=
 =?utf-8?B?Vm1uQ3E3N0RpVXQyYXhQYkx0dmx6azJhcnBINHpDaVJ5QWhjMjVoTEIwMHhT?=
 =?utf-8?B?QWFReWFLR1pMdG1RbVc1cU9pNXUzZE9tS21ZM0xGc0hVZ21QSXQzUGg0d1VZ?=
 =?utf-8?B?U1ZmZEhZZlBZZCs1KzJWSkl3TkJpSy8rSkVGY25sOUplb2d0RUZwZ1F6djJV?=
 =?utf-8?B?SGpTZ1Q5R3F3OXI2cW1RYlFJOGNPWXZ6UEpyNGVKdDRUZDR1ZlRkZC9xMm5x?=
 =?utf-8?B?dkxDZzE2VWNLTjhwZUFwQzNxU3FSZ1RmZHd1YW9uNTdINXJueUt0b0pPQ0FB?=
 =?utf-8?B?ZWJxMzQyUmNxVzVSaVVBZ2F2enJXb0h2T1FWVzFtRC84dnBoUlhKazZsNnlo?=
 =?utf-8?B?c3UrQVhYN0dNRWNYWXFYZm9lSGl1ejR3WHkxTjVGMlg2RStpTDNVTzJKVGVQ?=
 =?utf-8?B?Z3UvYXpnbUFZRW95c3RwKzBrSGRhb05hQmUrQWhQa1BBeW5ESCs0KzNESkcr?=
 =?utf-8?B?SkZyTGV3YlY3djdFaGpYMUVZSzBBaFVuV21nNm56S0NBYzlwNldpeExzQVJX?=
 =?utf-8?B?YjAvN1R4bFBOclNCT0ZHQWFnNlY0NGVXOTY2cUMyMFArS3ZucFUrSFJaSGhu?=
 =?utf-8?B?Ris1QklzRXZqay9VSWZMQXZFV0diYXZyYWJDOHNqVzRkczB5Qy91WDRtNXVh?=
 =?utf-8?B?WSt0UER3SGgzczJreUE0MTNFUHRCSVp5YlBQaytnZVUybm9NbFc0QytwcnZL?=
 =?utf-8?B?MU1EYkw0ME53K2hlWGZ0U2ZEMjlKZUVja0hXeFBRRlVJbHpzOWw0dkhQVlg1?=
 =?utf-8?B?VjRSNUM4aUNTaUs4NUk2dUR4cGJRaktvN1FYV2NoK1FlN09FSDZLaVRHek16?=
 =?utf-8?B?Zjg1WUlBYU9PSWVFYWJFTEdFcmw2VUdTSHlkUWNaWW1WRjNmSjA5Nis4amtX?=
 =?utf-8?B?VmxwUFYvc2lqVjhaMml4bjlJbDBpaTRTTU51UFVIQldpUWdaOXNTZjFYT09n?=
 =?utf-8?B?VXRLbFhDdW4rOXpvWXZTYzVHWjF1T3lCaFA4bmFNbFRFd3RvcDcwazdBYUR2?=
 =?utf-8?B?OWFCQTJTZS96OEcyZFJheFh6WlQ1QmpoNHlRaUgxNGdlOUJDWUJoVnkreUNt?=
 =?utf-8?B?YlI4ckU0QzNIZFNkaVhIRjFCSnFqajQveG9uNDF2SW1HVjMvTksrNjBaT0xB?=
 =?utf-8?B?b3Nic2JoVjVyejFMMGpqZ0gydWFYTVhvV0lqYmZjRGdNZExLTVRNc2hGWTJ3?=
 =?utf-8?B?RzUrN3NxbU15eE1sRjBIenArLzhnQlhvRnNtaHQrTmhtSWhCRVRZWDY5N1Ix?=
 =?utf-8?Q?8y4QVc6s1jHjfurc=3D?=
X-Exchange-RoutingPolicyChecked: EjXL7NheTKVqeLcTuzKYknhJv/Wmzealxc3Dtr14JIrvdseFjzT+o+i5D6O1faL0uuQRw077t6wBA2qDCTKNrDfdOJBPDYcXkQuN8JIr00TtPMnj9TT5Zobrnzm8KJWVIMkdrNQodoHwZ/hsYnKti5Euo2IVxKcMIfc1DYDe2+2DoMCS+KMkjpeWZebn5471aCXQs22EtXK/kfEbLMpMfMpp7c5Y6QIKOPgRq2xaigkgjwx5Qp/4/nRnb2CYNonyXSz7OfwnzIEOdHXamrxC/3K8Uqc+Et67aWoMxm4AJk92pvDunJ+IXYUAeTBnvIgewRVfqKfstfras25yJUgMdw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a893bdb1-9235-4241-8d20-08df492eec1b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 06:56:39.1609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YziWgxNllrxrWb3E2L6vlzBhf6Gcz5gczR2eAAviLbiH1q904my7AOF4uhcO+PixdOoADuYbcQgQQoLtLYDyO3LpXlaOdcFMdmGihnTCeAFAzErq+sye49bYDlDzZXfY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4795
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Riana,

On 23-11-2026 10:15, Tauro, Riana wrote:
>
> On 19-11-2026 22:09, Ravi Kishore Koppuravuri wrote:
>> Accessing gpu_health sysfs attribute sends a command to the system
>> controller. Add a guard to verify and skip if the device is wedged or in
>> reset. It protects against touching the fw or device when it is not in
>> usable state.
> There is no need of a cover letter for a single patch.
sure Riana.
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 0fb891d00b36..47f6b91edd9c 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -1134,6 +1134,12 @@ static ssize_t gpu_health_show(struct device 
>> *dev, struct device_attribute *attr
>>       size_t rlen;
>>       int ret;
>>   +    if (xe_wedged(xe) || xe_device_is_in_reset(xe)) {
>
> Lets not use xe_device_is_in_reset . I will be removing 
> xe_device_is_in_reset in later patches. Please take a look at this 
> series 
> https://lore.kernel.org/intel-xe/20261119102344.2053821-1-raag.jadav@intel.com/ 
>
>
> Also add a skip for no_reset case.
>
Sure. will update accordingly
>
>> +        xe_err(xe, "[RAS]: GPU is wedged or in reset\n");
>
> Log is unnecessary. If there is application which keeps reading, this 
> will unnecessarily cause
> a lot of error logs
>
ok. Will remove the log.
> Thanks
> Riana
>
>
>> +        return -ECANCELED;
>> +    }
>> +
>> +
>>       xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>> XE_SYSCTRL_CMD_GET_HEALTH,
>>                     &request, sizeof(request), &response, 
>> sizeof(response));
>>       guard(xe_pm_runtime)(xe);
>> @@ -1177,6 +1183,11 @@ static ssize_t gpu_health_store(struct device 
>> *dev, struct device_attribute *att
>>       if (state < 0)
>>           return -EINVAL;
>>   +    if (xe_wedged(xe) || xe_device_is_in_reset(xe)) {
>> +        xe_err(xe, "[RAS]: GPU is wedged or in reset\n");
>> +        return -ECANCELED;
>> +    }
>> +
>>       request.health = state;
>>         xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>> XE_SYSCTRL_CMD_SET_HEALTH,
