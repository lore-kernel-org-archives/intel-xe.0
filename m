Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC21C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 19:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361E110F090;
	Thu,  9 May 2024 19:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioyNHCHt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3951E10F0A5
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 19:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715282229; x=1746818229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+xhFu7bdsdOJLOsLqXyzHCyrfZDxsLH16HvOq8llWLc=;
 b=ioyNHCHt9PTCIIIBmcT8Xn46G0YRtVJ8uvrI7TMD/azhncWZeuXlnGMe
 +gOu9eyMutDYiju+c5tX3/yzCzf5mK1/UMlgt+KUHEY4Ga3R/LsJ4XjfW
 Ch5QR+e2UOgv15OZiZO08nNm+UtyR2WJ2RBxjIkHmeEGdR+E+Rm0QmHbt
 i5JJ+xHLmMm3Z3j3Fr7slgT6lkzHEIGg19btbe5561JNEfhuYueiolGcJ
 GP3T3wZCmIa/iN84C8LMDMA7DdyoZxOZtGBQsroJ3/5iQsv3Jc7YF0A+A
 y9WdOSdCB2C/7RD4QHxHc6RyHbZT8GEObAkaQhFzXXfo8PrazRouiitQo Q==;
X-CSE-ConnectionGUID: bCghXfxgQX6lafkjTd59lQ==
X-CSE-MsgGUID: UI9kJCEYRIaBB5WrrNhhZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28738554"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="28738554"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:17:09 -0700
X-CSE-ConnectionGUID: bkQ/t8qvSoS77pHeDUKwlg==
X-CSE-MsgGUID: 5z+MocyeT9iJhN9UBDuy3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="33801309"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:17:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:17:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:17:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:17:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHQb+AY6i5+ZF4PX1dpxHPpqaYTqDil51dQ6DLzcMvjrA0vsXhJoX/1Cykt/uZA1e4VFiliJdD10ms06hytxl57Xaac8DECGOY1mI1arPlZWIKHI529seGmWy9Oq6D7rALOU6nyRsi10DD7tG4Qswr7JRYaRKHUWpGdtFS1CirtoSBlclbVI0zAqRAWvThmBgoKJ6KlrcU0GSwSb1Alh53wF7zy44EXarzAw7cHl0dsYPmPtHhCanrA0hyF3QNHS/O3jt4VAg0lFYx84hiFYddgvt0JtkqCSLQB4Oz3CRUnWVFf1IRLb9GdlEtsvLpbSYlomtAcALwuLaa1zsE3rkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+3CC1Sn25FVpXwg/nMbeVtPqeRK+66Nk9HrrJX1eGU=;
 b=dCvB20ulHDMwQNwfh1+80WVzgERxEBGTHPFmmhUhT/I0MoOaKhzHebSnmMDOKMbIfamHMpMMA6zJ+x7EyNlBbYO7dXN/tw6/qZ5P054jl2Z6+emhIXADcA1No6dLOxwpU8ChCUaGG+mX9Ryrz7Hf5OP9gPb+DZ1AHZW97BX0T3KQUzKC0l6l/XkbI0MbB3H/Vy1ElEUfxb2g6WZMiT3En/QG0/A473QzrEeezjHi3h4Z2z8pDngnGSlFF0B3FOYZrjtwFrjh/H38bA8Vn7i9taNFuo/GxHx/LrGUFbztKVlr5RyrdL/Prrwll4uQ2UuwYuCDRHaMy6LO0mLLBBidTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Thu, 9 May
 2024 19:17:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 19:17:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/7] drm/xe: Fix xe_pm_runtime_get_if_in_use documentation
Date: Thu, 9 May 2024 15:16:52 -0400
Message-ID: <20240509191657.504300-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509191657.504300-1-rodrigo.vivi@intel.com>
References: <20240509191657.504300-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR2101CA0035.namprd21.prod.outlook.com
 (2603:10b6:302:1::48) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5294:EE_
X-MS-Office365-Filtering-Correlation-Id: 3832b97d-ec53-4186-ec2b-08dc705c9c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3lGUzlMbzY0VldKU2QxOUFCRkRIdkxSVWNWL2Qxd21yd1JJODFhRENpc3pz?=
 =?utf-8?B?TTgveUsxOXh3RFlOQkVkV1dINVp3QVNWYThZQTIvc2RJdGZ5dGpZV0xIWElM?=
 =?utf-8?B?T1VCVDluRDhVT21RZ2YrMEpSaWlSZW1vNVRBTUhJMzZWNnBiSWpCUURlWE9U?=
 =?utf-8?B?UWd1cWdKOERFVEc2OHhlazhsNkNXdFVFMXhtVjRsTENxRmcraXQrYXFHcU1h?=
 =?utf-8?B?RCtocC9mNFZYaU96OExFcmJqYVRkK2tRcmVNWm5ZNVkyY1dKMmxtbjVSNW5K?=
 =?utf-8?B?L1dZdmRjRGlYMlJ2UFc3RjVDeGRnbFFXNEU5citCNzdXTW5HVEFRaEpBSnQz?=
 =?utf-8?B?T2dJQ3Rpa2hRV0M2M29RMWUwbElNV1FhOHRlTWpXTUlHbkpCVUdPRTI0QWor?=
 =?utf-8?B?cy9yMm1Fa3Q5N0NNSGJKOEdQQlF5MTNoeUpNSHJIS3YwZHgydnE3RFhRRHhz?=
 =?utf-8?B?WXdNOXI2R0c4Qm0zZDF3S1Y0TWpqRHd3UnhKWHgrZ0Q5V3AxV2dpTmE5UzNk?=
 =?utf-8?B?am5LNm51dGE0SkFuTjNiWWY5ME5jT1FPc1k0QlNGdDFHN0g4Y0doQ0RYdE1s?=
 =?utf-8?B?UnVuYlVyUFZQK0R2YWZhN1BaMC81WnpVRHhTcnZXK2VadjNGL3pvR1NHOXEx?=
 =?utf-8?B?dmF3K3hpUHhkekw3K2Yyd29hTFp2WkxPZkNOOFU1YVNrcTdmZ0p6VmYxMm05?=
 =?utf-8?B?bkJxTmNIQks2SEp6OHBaODQ3WnJ5ZmFUcGRkQ09pNTdldHp0UkJVZFUyZmly?=
 =?utf-8?B?Y1JvMlR4b3NhbjNmN0ZuN3UwMjdYaEpqNy9zczZRK29VQ2RjOVRkbGJFWlpC?=
 =?utf-8?B?TW1HWkNkRmlQRTM2OWFSbEdHbDRwNGVBUVM3N08rc0pVT0NYalJHTWR0bC93?=
 =?utf-8?B?U1NHUHgrYTFZQzB4RFErTzVRbmdBYnFVZkVISTVpdlNlOWxYdTVEd25Bb3Bi?=
 =?utf-8?B?RVAyYVRGdUlNQkVJbE8vcThuUXEzWGEwSVlzampBdDgwNE9pbEhCMDN5SVR5?=
 =?utf-8?B?Rmp0Y0pDOFBINDMzLzNVandib2lOQWZ2b1E1Q0gxb1cxR202Qk8vQU9idm5w?=
 =?utf-8?B?Q0k3UlpXMWcyUERJaTVxb290THg5d0MxNVROYU8vRmJrcUNJY2FaWDBOR2Fv?=
 =?utf-8?B?K3hqRjVEV213Z09Md0JGbUpqYVNUbGpJMW1MOHR5b3NOTnJGaUNqd3BIN2Zy?=
 =?utf-8?B?dS8rRHFhZUJCSGFzQVFzQnlQcmhsUVNqRTFldUZSdXNQZHFWUGxwd3BMSnkr?=
 =?utf-8?B?Z01NMWZnL0NzVnpCem5YSFdqVnlFeXpidERYQjU5ekVZaCtROHg4S1F0WGpI?=
 =?utf-8?B?eFg2QncyZytnOGw5Skh5dUY4aEpFbDdZWS9yZ05kY05STmw4a3pQMkZGbDVt?=
 =?utf-8?B?eUh3K3lmU0hJQTUvenl0WGhYWXVYblExOEFCR0lNS1poQnZRdU1IVTJXZWhK?=
 =?utf-8?B?SUhqMEkzNlJVMDZOQmYzT09lUjVUVHc1NWxyeHA4SXhSM3pkbXFlYmJpd2ZZ?=
 =?utf-8?B?cERjRmwwZHE5NDBCbk1pZ3FRTFYybkUwejZWZ01oeTVzREZ2MVh3MmZoTFlJ?=
 =?utf-8?B?UytRcW5VOXNwTkU3ZEtCeGlIbDlxQ0pGNUxxQnJVL0RQVGtzNitzVnpHK1hY?=
 =?utf-8?B?Q1pGUU5vcFNBRUlpMnZudlk2aHNEUmE2VVB5V1NteGdUZmRReDJndU1ZRHA0?=
 =?utf-8?B?TVIxTVR5V3QyRjNFYzRhYzdiUGdta0VjNmRoV3FTZExhQzR3cHp6UXV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFhjZG5TbmxOazVmRE53UWFQQUJobDN0Mk14UUpmZVlTdzVZZTEwT1NQVnR6?=
 =?utf-8?B?clBmOTljZC9xYlNMV01oaXpoNHFqY2F3NXByQnNVNnZSMWo4cXBvZmtWWWhz?=
 =?utf-8?B?WWVjMmV3cVl4RStOeTJIM1VsS2R3bWFSb3g2dkxWOTk3TFVpUzRrSjd2aFJq?=
 =?utf-8?B?dWtYVHVMMWQrZXhDaC9IUC9wcVpIYkM0MWhCTjR6Z1FDdnc1S1Q5dXFlQ25O?=
 =?utf-8?B?eHQ4Nk4xbkVyWnlJOGErS3l4N0JxTVIzd0VMZ1dyUEZUalhRSVhLMmFsQS9Y?=
 =?utf-8?B?TEcwYXFDWWNPeFIxUWdIOWhRbXBFRkI1UTRUNXJFc09pTjk3dDJSVmpjZGtU?=
 =?utf-8?B?cXdHZzhMVGxqcXpjcmZrTCtHUVZRd3V2NGVsTW1QTWM0VW82MmpJQWh5VHha?=
 =?utf-8?B?cVNlbEdWZEV1c0xibmZmeTZEWlNjNXlzNm9keEdtbG04cHdtalQ3Q0tvMVdm?=
 =?utf-8?B?N0RIRThTb2dSdjVqRllaU25sd1EyVnk2cXdOMjRBZklPK3FvRHRhQWRYQkw3?=
 =?utf-8?B?TmRXL050ZmVhN0k5WlNrVmgydXNDZnVpY2VsZEJVTVN0anl3c01VT2RoLytO?=
 =?utf-8?B?U2RjVEVKVTdhcy9JTzV4eWE1OE5oaTJTaHBYRzd1bmp0VDdPSlc3bDFkQnQ3?=
 =?utf-8?B?TFgxV2YzdWtMOEtvYlJvQzBzMWdKbkduQ3JOT0FjdTZFQkRyTUxjbk9heHBS?=
 =?utf-8?B?SkxNeDBuZlBDQUNMQWdyMFVQK25WUm1nTkJ1NmFiZFVnc2tJZEVKSUI4SC8w?=
 =?utf-8?B?NlU4Ukt6SGFJTG9kUDYwSUdaU3RuUVI1Q09JbUtoL1FnenFHZ2pmUFhCTzJN?=
 =?utf-8?B?TWFhVVJTVEliQVVyZW10RThsL2xrTHpEZEc1SVR1QTZlZ3YxK3JyN0lhckNC?=
 =?utf-8?B?ZWJxa25tdFpNekZjT2lQL3puOEw3ekVIWWNJK21QWUNkaG9uZzdaY2VpUXk4?=
 =?utf-8?B?aExyck53K2w3VlhYZXFTcFovWmk2Wk1nenVRanE2NDRGaWdNMGhuTU1XZmdB?=
 =?utf-8?B?eDBxcTdPdmZ2MmlUdDhpcnU3Zk84U3ZHRldGTnRBSXozSlVjTWtTNDVDRVdV?=
 =?utf-8?B?UFRUMmVIb0IrOEx2SjJIZ3hjQUhNMzlBTVNuSDM1N3d0UkRFZFpPUHFDb2hK?=
 =?utf-8?B?WXVsWER2U3JYWjZ6eXJnUXFKOUp2ZGE4OStNcDltU3VSN1hvRTJpbnJhWEdO?=
 =?utf-8?B?eTBodjBMeFg2Q1BnY1ZBTE53ZGJMUjRqanJxc096TGJDYUNWaWYvN0tmUXov?=
 =?utf-8?B?NVpzOVpFck9RYS8ybm81L3NJUXhOUzNXNEtOUjNERHRRelJwT2h6SWxQY29Y?=
 =?utf-8?B?dUxjM3pndHAvOWdXWGxOakdDUkl1NzNTLzFrSi9IME9TNHIySXNYVnoyNHgw?=
 =?utf-8?B?cndMRGdVd3VQS01TU2hEa0d2QWZJRmlLaHlwU290UW5GWTN0OHlVRUxjQ3pP?=
 =?utf-8?B?K1NXdzdmcWdFK2owblBEZ1YyZDJVT2pvbGYwbVg1RU1wZkdGOUNlMXZScW5I?=
 =?utf-8?B?TVpJdWhnUTk0YmppMFNoaWNYNVBFelhCNG1kYmpkRXQxOW1Na3ptSmptSXRU?=
 =?utf-8?B?eDVnY0pvc1Znd2swSmJqbXN6ak1pZ3hiNlhHU0JUejFJL2NrUXQwMDJQK0RG?=
 =?utf-8?B?Qys5Ymkrb1ZOM0VyTmFpcWIrZ2xGZCs0TGNRNmc4a0E1ZUh6SUxOTFZxbHRJ?=
 =?utf-8?B?aGNDaHowdEhzN2tpRkJHWXhCS0pvRVFMZFFDd3dHanpoL3ViNnMrM3h3cXha?=
 =?utf-8?B?VUZGRmdLNEpxN01wWm1wK1JZNllJQkdCc2tXaTVFckw3Z2FUMkNITWIrQVd3?=
 =?utf-8?B?N0VQTDJ0MFdvVHdqV0pQaXJQZTBoT0YrZENxemdEM2ZBaDdpeEtCdFhjdnFo?=
 =?utf-8?B?MWJKYm5SZXJSeWcrc1FaeWFBb2svaUQ0S1BZZXNJdFZiMW1RV1k1U0FXSFBi?=
 =?utf-8?B?TmNFcW1GR2ZTVHBnbFlreC9sVWpXb1duL0l0M3YyUG9Tc3lPRy9vTlFDMFVN?=
 =?utf-8?B?THQ0dmEzbEgyRDZpaHpoUnZYMi81d09QVlRod0VuU1ozenArZjNKakxjQjNC?=
 =?utf-8?B?KzhxQWJ2SVIzVTJPVG85dmRzaVpQNVFXQjdiMVBDU1VJdzRreVhwb04rVWY3?=
 =?utf-8?B?TjJmRHFvV0Z6Nm9YV2NNN2pQRFpDNlJpRnl2S2JGMzVhc1ltR3gxditZOTJz?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3832b97d-ec53-4186-ec2b-08dc705c9c98
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:17:04.9019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jj5xtMFEqCl09Rj7R+ZYEfTwKIko4nsoGB3hDtUPWP/KyZvUW0tB9wwvH9Z5gybVJJRQnB6i0yZaP2Y+jGhdzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
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

Let's be clear on what it is actually doing and align with
xe_pm_runtime_get_if_active doc style.

Tested-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index d14741f35cc4..c3ef2283770f 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -514,10 +514,11 @@ bool xe_pm_runtime_get_if_active(struct xe_device *xe)
 }
 
 /**
- * xe_pm_runtime_get_if_in_use - Get a runtime_pm reference and resume if needed
+ * xe_pm_runtime_get_if_in_use - Get a new reference if device is active with previous ref taken
  * @xe: xe device instance
  *
- * Returns: True if device is awake and the reference was taken, false otherwise.
+ * Return: True if device is awake, a previous reference had been already taken,
+ * and a new reference was now taken, false otherwise.
  */
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
 {
-- 
2.44.0

