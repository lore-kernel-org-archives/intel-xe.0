Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961E0C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 03:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387BD10E6DF;
	Thu, 29 May 2025 03:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gy1CSZvo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B5C10E6DF
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 03:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748488478; x=1780024478;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ADuKrzy6t2tLKgNPMKQk6AfMoiTYZbWgPJJVpy/9Wyo=;
 b=Gy1CSZvoOA63w6nxzFJKNIgclH/tNdfAQq7ODB8alou/qoajnKANmLFS
 rqhikx8XkYaU4mwwhbUq8n8WEMZzzRlMLtiI6Oi68A+2BHXi4JscnKQHo
 QsFPhWGhwqqe5sgQoy8huvJyXpT5iHhLQyygSgH4pWxoqdORWjS8rvijJ
 TdHPzsfWz+9rHuvFfwRsNAk8wFXDlvXbFVEbik0m0fALLrQZ5LrEaiuOK
 FM+TSN2XCBaV8VLFL642+M5dQQS6q7Q2N+OdbBS1QEhI/qYURKrsjJUPd
 Iqyn1w9BYC5cV9gVvFV3AGEDiG71jlQ3YS7SVUvfZtqsLFLuoPcBLb3Lm w==;
X-CSE-ConnectionGUID: /0pYAkhuS3+QsYDhf4FmmA==
X-CSE-MsgGUID: cC5+OrKeTFqafvViG4d/uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="53162822"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="53162822"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 20:14:37 -0700
X-CSE-ConnectionGUID: 7OpW1+CCTtKhAOBLEjaxqw==
X-CSE-MsgGUID: ShtdXCVkTo+SIOGLAUEAfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="148201053"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 20:14:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 20:14:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 20:14:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.88)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 20:14:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHjv3nxN95iMsn/xhfNiWW42kG3y5W4fgP0LV97fs8624POn2E+Zy5F+j9HjB6lYS/9hdCzhsxcGuCBpHNCrrwqCDgYDVRSKLpklbdiWAgRxr56w7/zCJnubIRN9dwBDj7one76/FemSErDE19fsF9YNLrYIKZbe4cl2ycSDO8AC1OmYJeUyiU16NW2GXWe4ZzZYuHpqMfgzbvgnRzDxVtybX7DD+eT5xuA9JcAfFrT3WSvQthepctuwqNDgTFiD/Jgt9fgR4aeLJLUyGrhctQnsAGrpMllRDFdmcrBuNHTY/eFOPwVxurNu/7WRJtg8DT+ebfrJKLkzVMt7t5jdzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seyzDdGmy6iHF2Ze+FZ+myrd8oKMPz244ODMFECsIj4=;
 b=jnpkmfVVbgVFYZBWxrckaoXQJWhtL3FJtzCloroSfPTsQyi/6StUX80WWNpXKPIHz4KtpHR8tauwrg0U2tN8AQ2IXlg+L6om2Ean02SXKrjJ1LJ+3zs0Y35GEPuACOuq7jMnLFeuZR17Lffo6U8TW3j73iHLt0/CewQAdmAXIhoGrDCClPHxGrKURdaZCFZypCsjQBo8I5RUtKnTikqvb4wyUzQgPo8VUD8nHkteQNDFrADBkkZ3xZ7CKcG7IGQ6Sh8iVx8iUyjVeXHND82+Vwvg0KBzdtrLeumB7K1Hne7vCQ4jMDjwJEjHmdLIp4wjCjJmDsQWosFHHl75rS4wGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 03:14:07 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674%7]) with mapi id 15.20.8722.024; Thu, 29 May 2025
 03:14:07 +0000
Message-ID: <741d2af1-0951-4ad5-b07b-9df820831073@intel.com>
Date: Thu, 29 May 2025 08:44:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/19] drm/xe/svm: Split system allocator vma incase of
 madvise call
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-10-himal.prasad.ghimiray@intel.com>
 <aDfLMTBTEsxVLO6C@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aDfLMTBTEsxVLO6C@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::11) To SA1PR11MB7038.namprd11.prod.outlook.com
 (2603:10b6:806:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7038:EE_|CYYPR11MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 853f024b-b3d1-487f-3277-08dd9e5edf7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGw0d2thZFVCY1ZNdGFZbjZBSnVtVG5KU0JBQTM0bHhGRUdzRWdsR1BONEhZ?=
 =?utf-8?B?VVhSdlRncCs5Z09MSUtqQjRFdDAwVVlXSVh5VjdNQTRKQkNxeEUxdnlQWWIz?=
 =?utf-8?B?cjcwaG9JL2w3Q04xdS84QkdVOTU3MHBMb2M2RmtVelF2VWw0T2FTUGo2Nnl1?=
 =?utf-8?B?S2xwVVdsTWVjUVVGVW5kaFBoZHdiT3d1RFNrNVZWQ1ZoL2NNTWxmV1JjbUZH?=
 =?utf-8?B?MC8xSDE1UU0yWHJpT3NzZmZVMVVyV05ENi9xcTM5ZzM1U01uR2hwWFIvMk5v?=
 =?utf-8?B?bmxaUFFRRWN2WGgxcFA3elhDb2dDcXRRZUN1aGVWQm8zMmUwYWU4VFFRRm5I?=
 =?utf-8?B?THRyRVpURGxVTmlkTzFaQjlwaDYzU01BNS9IQnNoaGpFTzZtSXZ0ejNxK1RV?=
 =?utf-8?B?S0tQam1CV0JDSUNUczVHWWtMRW5tRE1wQzV0N051eWUvY0hFTzdQL2libGVE?=
 =?utf-8?B?Uk10SkZybEYvMllXVUJXMWxUSzdHckg4c3R2cnFiWGtOVUdNQW9UMlk5eENO?=
 =?utf-8?B?UnJVbGw0TjErZ1d5M0xkbjZVMXZJS2ZOVXNxdmdKQ1ZsWGg4WTIyb2l0YWZj?=
 =?utf-8?B?N2xoZnZWTytVaDFtMDMzNktUSjJxNzIwR2dXOTA0US9pZStYa2krUG5taVQy?=
 =?utf-8?B?TWxBUnBleDVNaWZhTmttZys0NEdKRmgwZENMSjNBaUlzT09zL2g0QnlTZm5u?=
 =?utf-8?B?aWdQTmZoZk9lUEJLVU0yZkxMRk5xTllZYlFac1k5dFRyWmZDR3d3M29GMG93?=
 =?utf-8?B?eER0RUQ5cGtQSXBaRkllRERZSVhnOHd2MUlUSDhUbXEwWHVPUk5Nam1YaVNE?=
 =?utf-8?B?b3Nzc2p6aWgvb3pIcWIxVmR4aUptRjFrQUM4WXpuOWtiRU9PZFpFc0VGaGhY?=
 =?utf-8?B?eHB4WjRXbDRrbHlTYWRJUlFtUEJVZFRNYUhDN21HUlF5ZDRsbCtrZ0t2Y3Nq?=
 =?utf-8?B?RW45aStaVTFxbVJzL1gwRncvYWdhSjNtWVNlZ3M2S3Z2aHlsYTNXLzhuNlRC?=
 =?utf-8?B?Y0ZXcnp0UTN0bFZmTjR0ZSs0SlkreUgzTVNLMGlOalUzYUV1cGY4cExrQnd5?=
 =?utf-8?B?UmdxeDJjT3ZxNDN6bTR5T3pqQVkreHZjS3Zmcno3OVVOSHk2MHdFdDd0QzdN?=
 =?utf-8?B?N25EYzF4UTJKbklOTm9PdjVZYWVRMFRDaVR2cEo5WkFWRU82VjRkT3huMmZ3?=
 =?utf-8?B?c2F4NFFlcFFlZGxQandtSG1ua0R0RGV1Y0l3TjRVRGNNTUNSREZRa29Uc0Fl?=
 =?utf-8?B?T0VUZUh3YSttcnd6b3NsUFB4cXpLNGFKeFFqeW8wL1I3YXNWQUU1V2VncTBw?=
 =?utf-8?B?MGxLdEFkMUVjOVVZZ1lIWEoydnV5ZmVKQnUzRzNSbFpwd3lNYnBIQk9TcXNm?=
 =?utf-8?B?SkVLRktBRnNYcGhHL1pSTnIxcVhycGxsZ3FBZXB1aFpGYkRVdVgzaVl6R0ZY?=
 =?utf-8?B?VktRbDd4UXJXU3Zpc3V4am5kdnAwVlBpYlpCQW9XSFZVTWFtemhkNVBSYWNK?=
 =?utf-8?B?aGl4NVFVOVk2elJHM1pkNGFOTTloYlZqbnhBeWFsa2tKbDArWWE5RlZ4Wjlz?=
 =?utf-8?B?cHJEbDhXbnZrY0cxd1g2aFBsTnhTNkxKMW15RmRxWTJUOWNjTTZGZXZUQmJZ?=
 =?utf-8?B?dzNyNEtCeW42QytBNnRsMU95dDdIYW5Rc2E0Z25mcWlHWnBBZHhIR1NCeUdH?=
 =?utf-8?B?UG5DOXhvT01MNGhWZlNXTnRqM2hNZDhUOVM0V3V1NWRJUmR3M25DZkdMcXMz?=
 =?utf-8?B?U0plZG8xZzEralRFZDVqdmlET0ROa1huVlM5TU5WdXV2QTZGdy91bVJrMTl3?=
 =?utf-8?B?WTVBVEw5U0FKTEJaSWc2MVpQN3Rkd2Vlb0QvSzN0dnVsVHRsWVNuNzJSbTZ6?=
 =?utf-8?B?N1RSaVZRQW9RWW1VeitsWEZXUk1jVVk0UkpRK0YySTNJT3A5bnlTbGwwb0JO?=
 =?utf-8?Q?4qTIlYGZotE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHRpT0FSSkgvMFVmTCtLU3ZreW40VGQ0bEhxQXBhQlU1ckgxOWlmQnFCakxK?=
 =?utf-8?B?QVduYng0RlQwRDc4WVp0a3FraWRWS2xJcEN6UVd0NHMyYWNRZHpTcFMwL0pU?=
 =?utf-8?B?M2ZaTUtrSmRkMkRrU1ZxeURWNHQyM29Ya3F6aitWN0UvMnRtRHpuVkxXcmt4?=
 =?utf-8?B?WlFQcm5wQWN1OGY4bFRMaVhSclAvb1ZzVEplZ3NnYkJLamV4eG43RjdTTWNB?=
 =?utf-8?B?OVlvcHdnMXZHSVhNQ216SGNkT1VQUFF5RVVQOTVHZ0VsbGprcnVBbHdYWVVI?=
 =?utf-8?B?YXBjYkZtMkZJRUtTRkVrdVJiUFlzdURKMCtORWpJblVObHl3enhlTkcxbjJx?=
 =?utf-8?B?dzQ5MEtUekVHZzcvU1UyVWNPbTFWWjk3a3pjQmxBOGV1d3Y5WDN1aUFZbVdm?=
 =?utf-8?B?a2JNSkhIb0twSXFlTGJxUDhFWDBuUGplRzh2RElkTk9BUlhuRnNFVXpzVlFQ?=
 =?utf-8?B?cVVtd2pRdE1EbkNpV0FXTnhoMStLMnNSQ2lrRDJuMEtkM2VNWW1jS0pKYnND?=
 =?utf-8?B?cE5NYzRTYVhETjdjckFYYk8xT2J5V25PdVQ0VUE2K3ZjNGV5WXdpeUZ5ajlQ?=
 =?utf-8?B?UEhlR2VqMVNHQTBGNzZDYUo4UHgxaFBTTEEvWjBxamRFWE1paGQvQ1Q5Yk5T?=
 =?utf-8?B?UmJGUjhMeTlNelBMQ054RGt2TWM4bVY4ak00MmM0Vm9nOE5DQy9seFB6MFND?=
 =?utf-8?B?Slg4eWV5Y1FRN0xyMlVtdy84cTFSL1VVZnltYTk4OHpkc2orSlNUNGJrUHY0?=
 =?utf-8?B?emtmOW1nNmtDUEpuM1FrMjZuQzZnV295MTh0bHJHeXVmQjFLTVk4elJpUE85?=
 =?utf-8?B?bDlkMVRPUG9rSGR1R3RXSkFOSzN3VExWMXBIbWtCOXhHNThLZVp1WDBia2Zk?=
 =?utf-8?B?WVZGNENIaWlMRGplQjRBblV2eS8vT2hCZC8zM1VmVDVHUEhKV2FmUDJlZjdt?=
 =?utf-8?B?Q1dBMGllUXhibmozQXJDdFpyZFlXR3J1Q3ptSFRiQUhjTk1sMWgvMlhkdWd3?=
 =?utf-8?B?WGJ5UmtvOXBGaGk3YmhMdWNjeEV0dnkwT2hJY1hzM2ZUa29Fa29sTnZGMVM3?=
 =?utf-8?B?THRzRG5Sck9nZExhTzNWNXd4eVdXaWZyUGJmSkN2SDg4QWhmblhSdHZPRTFp?=
 =?utf-8?B?enVDTmg3aFpyT2I5ZkRUM2tvU1VBWktYZTAvZ1hmbnR2TFJKZ3YrM0dubEpC?=
 =?utf-8?B?cmhha3RLNkhyM1plb3hQQi9yVjhiRVhUZ0l2UW5jOWQzRUFaRmV6Q3RCbTVm?=
 =?utf-8?B?M0RYK3VKTVl6QWMxUUlLQ2N0amd4amFZV1c0aU9RSGNpdW1yMkV6UWtTN085?=
 =?utf-8?B?Q1VEOVlrdHNzVWR6QXZLa3FTS29EUjBFbG01Y0pWWGR6QS9KTitRZ1BKZnBX?=
 =?utf-8?B?a201OHJCUjc0eTFkVHF2bXhlZndmSGh1bkNUWVNpbmRwT3lleFdVREdISm5W?=
 =?utf-8?B?ZjY5RnlaWDd6U3M3MG5SbXJDZWNndW9Hc2s2RW94dXVqdWx3azNDSUxSNmJp?=
 =?utf-8?B?K3gvUFNnWE9HeDlPb2VrWmppNXFxU1R2Sm1HTXM2YWZuQXNWdFVsR2NPb2xH?=
 =?utf-8?B?OU4rZVJRcU5KeG9XRFkyZEJicmh5ZXBwanJ3VS9lVU1PRXhQd292VUFzaUpG?=
 =?utf-8?B?eE56Y2pNNit1MXBXMDBPVFFzWSt3WHVuWXh3ZHVpRm1MUVBIcU1vRDdnMTlT?=
 =?utf-8?B?RmFJN3hEUDRUcXZQbnFqY3FmejZBWElmQjg2NzFlTzdpYlBHT2oyUDVkOHpu?=
 =?utf-8?B?NzB0WUtZZlhMK3dWTzZRd01hRUkwU2Z3a1RaMDdYYmwzTkZYMXFYUzFHNXNT?=
 =?utf-8?B?RlpMcS8rbnpSUVJtQnY3ODNWclFJdi9oZkNBc2xPRVdFbXpuZ1NzUFdQb1hw?=
 =?utf-8?B?QWVjTi8rYjNwei9wdXhLWi8zSElYeTRQZ1VjWTJXVkJuczVIWkliazg2Rld6?=
 =?utf-8?B?cHhMenpCUURqYmJGZENWTVV4NVRuYmZ1Rm9abkZjbE9vUklyUzZpa3BWVkdN?=
 =?utf-8?B?MzUxbjRGY2VQRDBSeUVYd1NUTU1WSnE4VHRBNjhnbmxEeksrVXNTQXQxWUZ1?=
 =?utf-8?B?Unp5Q0RHcDhYcXpFc2RZSS81YVJHekFkNEc2UFVhazdwVnpDMUczK0dCQmtJ?=
 =?utf-8?B?b1REZEtTVU5HSy9yN3IwOVJnZDBnMndsOHRhK3pMSHU4S0I0aGFNeG5hSGVt?=
 =?utf-8?Q?BlqkanQX5n0ds6EYOv8d2uE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 853f024b-b3d1-487f-3277-08dd9e5edf7f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 03:14:07.3788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9SsLwgszu6ik3KYdP66EnK690MFoFq3QfWVJmhojr+sybxRsSsQ6pL7WXOTLcLmOtzf9dJZlwmkce2qa18wUX+NpZ+T8UNvbQEcDcz9Dhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8430
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



On 29-05-2025 08:19, Matthew Brost wrote:
> On Tue, May 27, 2025 at 10:09:53PM +0530, Himal Prasad Ghimiray wrote:
>> If the start or end of input address range lies within system allocator
>> vma split the vma to create new vma's as per input range.
>>
>> v2 (Matthew Brost)
>> - Add lockdep_assert_write for vm->lock
>> - Remove unnecessary page aligned checks
>> - Add kerrnel-doc and comments
>> - Remove unnecessary unwind_ops and return
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 95 ++++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm.h |  2 +
>>   2 files changed, 97 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index d60b711e97e9..c220bf904ee0 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -4161,3 +4161,98 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>>   	}
>>   	kvfree(snap);
>>   }
>> +
>> +/**
>> + * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>> + * @vm: Pointer to the xe_vm structure
>> + * @start: Starting input address
>> + * @range: Size of the input range
>> + *
>> + * This function splits existing vma to create new vma for user provided input range
>> + *
>> + *  Return: 0 if success
>> + */
>> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>> +{
>> +	struct xe_vma_ops vops;
>> +	struct drm_gpuva_ops *ops = NULL;
>> +	struct drm_gpuva_op *__op;
>> +	bool is_cpu_addr_mirror = false;
>> +	int err;
>> +
>> +	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
>> +
>> +	lockdep_assert_held_write(&vm->lock);
>> +
>> +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
>> +	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
>> +					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
>> +					  NULL, start);
>> +	if (IS_ERR(ops))
>> +		return PTR_ERR(ops);
>> +
>> +	if (list_empty(&ops->list)) {
>> +		err = 0;
>> +		goto free_ops;
>> +	}
>> +
>> +	drm_gpuva_for_each_op(__op, ops) {
>> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>> +
>> +		if (__op->op == DRM_GPUVA_OP_REMAP) {
>> +			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
>> +				is_cpu_addr_mirror = true;
>> +			else
>> +				is_cpu_addr_mirror = false;
> 
> Maybe let's add a sanity check here to make sure we know what we are
> doing.

Sounds good.>
> 			xe_assert(xe, !remap_op);
> 			remap_op = true;
>> +		}
>> +
>> +		if (__op->op == DRM_GPUVA_OP_MAP)
>> +			/* In case of madvise ops DRM_GPUVA_OP_REMAP is always by
>> +			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
>> +			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
>> +			 */
>> +			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
> 
> 			xe_assert(xe, remap_op);
> 
>> +
>> +		print_op(vm->xe, __op);
>> +	}
>> +
>> +	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
>> +	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>> +	if (err)
>> +		goto unwind_ops;
>> +
>> +	xe_vm_lock(vm, false);
>> +
>> +	drm_gpuva_for_each_op(__op, ops) {
>> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>> +		struct xe_vma *vma;
>> +		struct xe_vma_mem_attr temp_attr;
>> +
>> +		if (__op->op == DRM_GPUVA_OP_UNMAP) {
>> +			/* There should be no unmap */
>> +			XE_WARN_ON("UNEXPECTED UNMAP");
>> +			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
>> +		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
>> +			vma = gpuva_to_vma(op->base.remap.unmap->va);
>> +			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
>> +			 * to newly MAPPED vma.
>> +			 */
>> +			cp_vma_mem_attr(&temp_attr, &vma->attr);
> 
> Again maybe drop the helper here.

Sure.

> 
>> +			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
>> +		} else if (__op->op == DRM_GPUVA_OP_MAP) {
>> +			vma = op->map.vma;
>> +			cp_vma_mem_attr(&vma->attr, &temp_attr);
> 
> And here.
> 
> With the nits fixed:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks

> 
>> +		}
>> +	}
>> +
>> +	xe_vm_unlock(vm);
>> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
>> +	return 0;
>> +
>> +unwind_ops:
>> +	vm_bind_ioctl_ops_unwind(vm, &ops, 1);
>> +free_ops:
>> +	if (ops)
>> +		drm_gpuva_ops_free(&vm->gpuvm, ops);
>> +	return err;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index 1ef98113fa5b..8151b1b01a13 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>>   
>>   struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>>   
>> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>> +
>>   /**
>>    * to_userptr_vma() - Return a pointer to an embedding userptr vma
>>    * @vma: Pointer to the embedded struct xe_vma
>> -- 
>> 2.34.1
>>

