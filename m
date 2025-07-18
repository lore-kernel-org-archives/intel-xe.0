Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF54C83F17
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 04:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B695A10E8D4;
	Fri, 18 Jul 2025 04:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7xcb0q5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4344410E8D4
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 04:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752811300; x=1784347300;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dAI/otBQxN/tlfbFQLDEPIvOzYxAp8+1lfboUVE+sLE=;
 b=I7xcb0q5i5t/3dZjLCiRijrHud6Q41ATmRiej8b+2ChY4OA4xkWthqN9
 TA6FLjL/gB6FV6ZrqaCY3q7cjbiJnnuJeurWWxojRK5NyU/qPgk7vsefR
 CzSgJvxQ2fshYLQG26YVhqeGXne7mggeutTYXulkHOV/4zEyznlgfiMvs
 zgjVIjuHidPEGBLtQn2Zh9Dukg4TUrdYfbD+UD6U3RVsyshVFPLjH9Bgt
 KL2TH0vWDhglQy+Ex9xifPtd5qOcKNaLsPltnD0M6zDo1MUePJmNPIKMy
 UB5VYBSHSr9BR+Cg2BztQRGKtWCga5c+eSPe6DBbUvh2HMfi+Gp5vMkHy g==;
X-CSE-ConnectionGUID: yXz8jvXQQ3it2e6LilXB4A==
X-CSE-MsgGUID: onh4laTgQ9OHNV3UZD0LYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="66548877"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="66548877"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 21:01:38 -0700
X-CSE-ConnectionGUID: b6zYK7D4Rtel4Fy3snd9YA==
X-CSE-MsgGUID: MvQQDb01SmaeizsCGkOI2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="188914841"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 21:01:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 21:01:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 21:01:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.51)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 17 Jul 2025 21:01:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcrpI2OWiyeDdvQ81oO9ohxf9rNTkUSuZ1RE+vQUJ68grF1WO/xlkxOT7grdUIRsyWnMV1n6Zl6mo2M26w5y1LxIfFPPuP2MnwY7zW/hWNbYyUUAODM1i1QXZNSLnfS8ag1kEUzZ8oxL/mVhEU7/vbY6Z8R6yrn4UvOwR76ZBaOMuJSf8gGWgHx/GoScxo2aOWH7PxX94+8HURUpwkD/DI/wvCgmubTCgzYX8o/rz+Bhxkh7X4QOXjZt1jc0rQ+2crN4vVP4Seo9gyJUOzn9GS3O5NjAHc+18yz0pakf54Wg9ArbSto+OKNyrHMEOTyFmZX37cOIiJhnC9ZqGbeAFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRqXf7/r4ugfXgcdGOqNm6QziKAE5YlSiSglBJYCwl0=;
 b=OA47PF76xKxQ/fM7LETa6xJo/Ny+fyIG4eIxWOlmocMRrwTaIz98D58z3ImcCTn5DX4K6125oAcjtdOE8OPghuaj/liTaHO2XrcJI/kzfHeIbhhBfyZ3JpWBEhNg/H8EiipJAlNUQIQfkXxt0moxDCg3UU0imWM4wEyZKSqZdG8nuOfMeEI1yciShY2g5u4TkFCYprEbh0xq38wTqCf+k16ExGV5avP8AU6hix49EvCUY1sVKY1YKg1jTYxY1IcZp5MY+RpapJVVKv/ejcf/ZSkCYU5kEdDwBXvsRQSfbTPD+d5ucajnZErPhSb9vNMDgH4YXBtQwi0pgYqWi4CNUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB6499.namprd11.prod.outlook.com (2603:10b6:510:1f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Fri, 18 Jul
 2025 04:01:33 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Fri, 18 Jul 2025
 04:01:32 +0000
Date: Thu, 17 Jul 2025 21:03:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 1/5] drm/pagemap: Use struct drm_pagemap_device_addr
 in mapping and copy functions
Message-ID: <aHnHhjpD06Wqz4W+@lstrano-desk.jf.intel.com>
References: <20250717133928.526111-1-francois.dugast@intel.com>
 <20250717133928.526111-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250717133928.526111-2-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0207.namprd05.prod.outlook.com
 (2603:10b6:a03:330::32) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB6499:EE_
X-MS-Office365-Filtering-Correlation-Id: 182a3b29-9540-480a-e9da-08ddc5afc84a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zm1CWU11RENDRUNGRmwzaUt2NkM3NmxGYklRMG9NWU84S1p4WlM4dERwMVN6?=
 =?utf-8?B?NFIyNThPemkxZ0JBQnVmeUFmanN3R1ppVXhCSFJuWS8xNmRVYTlVZzE4VmFM?=
 =?utf-8?B?eUVaTHB2dmN5ejlmNzUvSGFBbm1JQTNrU3d3N2pjeTB6d1hUcGUrZWQ5RVNk?=
 =?utf-8?B?U0JzQlBadlY1cFNhTm1rVXAwcTU2UVVLK3FWQkZYbE52OGsxR1BySXF3N2xC?=
 =?utf-8?B?cGVLaUhyRVIxMXBZbEloMlUvaGdoY2h6Q29LUUR3MVhKM3hZdEI3N0p5RWRx?=
 =?utf-8?B?UTNPTUZ1N1ZqYlBRbExmaHRFeFhwMzVSbkxqUEJ5MEFxT3NyamkyZzE5NDBy?=
 =?utf-8?B?UU50aVpiUWtFV21kV1BHcVZKRXFuYlJEVjY1RTNUMXpNYWl0cjVvdStnTDls?=
 =?utf-8?B?MElWVUhoa2E1aHlPSDFEamtmemxsWHkxS2JweDJwT0JJT0FuNkpXSWovR0tl?=
 =?utf-8?B?bS9BUWo0c0VYejlDZ0p3b3FEMjVydklEL3VUczFSMHQ4MXlrbllHUUoxZ25P?=
 =?utf-8?B?TG1KT2MvNkhRaE5OS0c2T2tMeUpJeVZxMEN1dzBpR2MzMk13UWd1YzI2ZndJ?=
 =?utf-8?B?THhISk5LM0QxWEZJWHpER21sdi9mTEMxWEk5bHRlbUR0ejV0Z1R6VzRRQ2ph?=
 =?utf-8?B?UkpiNUZ1VkgzTy9kMFFzU2t2RzR5UE1WK1p6REZtL01UVGF0ekpQL2k1ZlRO?=
 =?utf-8?B?ZmsrbkNpMjNjY20xcDRiTDYxdVRGNGxrTG95U2MyTDdrV2U4Q3R2b2tod1BZ?=
 =?utf-8?B?T1JVM04zN2xVS3M0UmdJb2dMRXpMUkI3cFc5bjZ5QzFXdVg5bEVweTNoL1dq?=
 =?utf-8?B?MU5EOVB1eFJGN1NZdlVSdmM5cWtYOEtTTnZIRWRSY2F4aEdiZWlXS1FlQkhP?=
 =?utf-8?B?NHhwMm96SGZYSjJHVVNYcjMvcXBKNFJ3SHd2dTJFa1RTQ3FwQlUzKzFtd2Y5?=
 =?utf-8?B?RWdaYVc1K0dZdDVQUjBNRWNYS1RvMmNLOHMyS3lCdEZ2RERoS1VxWW5raDE2?=
 =?utf-8?B?SG9paktIMGZoV1RmQndBaGdEUmJXZXN3ellsNm9DTmtmUituSjBoYjIwVHA3?=
 =?utf-8?B?QjRjVnZVSXNWUUFpVFAwZjdKVWYrNEVxMktINis0N0tQbHdhMTFyTkpNMzly?=
 =?utf-8?B?WGFOaEF0czZCR3RKMmxHZmVZNzNjVjVaRHQ5MnM4OWF4SUY2WCtqZ09FTWdo?=
 =?utf-8?B?RlhYak1xZUR6TDZ6cFFmYkV3dFBPWTJ5dEZGN0lwOXE4cWsxck8yUHV4M0N1?=
 =?utf-8?B?M0RKYU5CdUoxbEhJYnZyZUZWNHIvSk15ZlZYdnlvNElzOVVqcjFLOC83c29n?=
 =?utf-8?B?Z0FidFZUU2JOdEh6K1FyNDhJR3gvelAvSnJ0UThncFpOV2I2MEFVWnRZYVQ1?=
 =?utf-8?B?Y2liSXZYSjh0NWJEZytMakZxeWt5c293Z0lxTUtJTERVTk5MQldZejVRbjFi?=
 =?utf-8?B?Syt4SFdwOVh3QnNtUktsZkwzN2hIOFovdldnV2VtT20rOGVtaXhhbFA4WFFP?=
 =?utf-8?B?M1o4clRVbUQ3UXB4WmZiN0NWVGZ4b21ONGd3ZHFkTWZESWpOblVtRTRBOHVh?=
 =?utf-8?B?TS9qTk1yZDBRMGpRRTVGa3lYUUVwYnJYRjl2TkFyL2E1ekdPL2VRdnV1SVpW?=
 =?utf-8?B?VS9qbnhzTTM0TStnZDFPVmt2T2JmNG1HTFlLNzl4dUtXbVNJUGJIa2tncTF1?=
 =?utf-8?B?RDN3RHhia09WWSthVml2R2x6STN0cHc2dmgvZExOVy9YREZTUkFoSWd5V2N1?=
 =?utf-8?B?dTFQQkM4VVk4N2NaRWhxbHJIUnFaTEhwNDJRblpGZU5veVJCVGJCVDdibVM4?=
 =?utf-8?B?d2UxMTk4K0dzeFBNUzROdXJjNWswTlNLNDRMMHBRWmxVZGovUEVjdERaTTVi?=
 =?utf-8?B?eEprQlhLaXQ4Wmp5Z1RkL21saklHSk5QNjA4L1dWZytlbExEZUNUeXh2d1ZI?=
 =?utf-8?Q?SVbFHJj2oD0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmJaZkdva2dFVXpIRUdyU3ZORVRWOFBXTjF6dVF4aS8yY2FjcDNZaTl1aUhw?=
 =?utf-8?B?ZjFmUENEdVd6azBNR0NKS2Y5eGdlRjNXNDZaNDNuYjljQnFtZU9aOUZIYmlw?=
 =?utf-8?B?UWtiajZDVWZKQktPaE9ibGtxSUtERmJEK0hQd2UzbERpR3dUUDNsaCtBOXRI?=
 =?utf-8?B?TVR6U29LOWdWZ1kvcmxOV0F1YW4xUlJKVjYwRkFmQ3Q0dHJQVVJTNFB6akJK?=
 =?utf-8?B?NGpPbTJyZkJUQnpZeW04bUt4K2pTbkx0NUdwbk5JRk5nVURaK2FFdDB5Y0JO?=
 =?utf-8?B?NVQ2NHJJQzNWVjdlbUx2THdtQnFUTU9PeDdNcXAwQzQ4Yk90YWppdjNOWkRW?=
 =?utf-8?B?M2x3Sjh6dXQyZkc4Vkg3ekdyRUNZR2M3b055a3FwVGUrMi9Ub2tpZXNLb0dH?=
 =?utf-8?B?bWZpUWxzNGxXVU1SSHYwVU1uaEUwYytzTWNhdEorS01LV1dVMEROanNPUWVE?=
 =?utf-8?B?bXIxQTFLdEFPOHdOOXZ2aHFjZnI1TXpNdDd1WlpTTWZ1MDBWS1pZMTRPODAw?=
 =?utf-8?B?ajZIWnYwYkE3SnpjQzJiNjNuZ3lDd0NBTUwvSGVqcFNIeGJoZFZNeFY4dVZs?=
 =?utf-8?B?SUVqN3BxeUpsUDNkMy9ZNWE3dWpoelVSZEE4N1hvZEczQXlUQWhuQy9pQkxv?=
 =?utf-8?B?c0ZXRFB1YXZuNmJYZnhHaDRtWFMvdS9NL1grU3dUVjhMY3lRdXF0ZVF2aWgr?=
 =?utf-8?B?WFVtOVVYV203WWE4VzdPd1QwTDFab1R6TjlrOHhqbWNGNzBsZnlMNU1SMHpz?=
 =?utf-8?B?U2ZEQXVRb2l3TWRyOFd1OUh5ZmQ4T1dMa21jdUh2enBUVUJEL3pEN1FpdzZo?=
 =?utf-8?B?anE1WjhZclZ3eHBzdTZGSGVMbkp6d25Ma29ZSnZQeXlhc2Q0bk9OVUE5TldS?=
 =?utf-8?B?cktZOW5DbExZSC9QblBMMkRNYXB3TzJZcEpDL1NoS1d6bm1TeEc0VURiZGVv?=
 =?utf-8?B?QVdJOTZCZXIxS3dtdndrY0V4dHNiZ0tHb1FmajhsLzhIOWxVMTRnaEFTQzJL?=
 =?utf-8?B?cTNFNmJlOVV1cDhpTVdkemh4UkRxNXJUL3VSVm83b0Zmdm9BY0x4NHV3K2pa?=
 =?utf-8?B?Y0FPMUttZnA4WWF3OExsclNJTTliVHVDT0lqWFJWeTlQMUlVZnRQbDZjb091?=
 =?utf-8?B?R08raGFFQVJVbkVLNXo3RVBVNHIxNzl3cE1LQXFJc2JIL0FKZndYNDY5Z2RX?=
 =?utf-8?B?TTVGVGhJWDhIbm03THhHN3FhTUZBMzNkV1VGT2Y0dmVoNXRkRjdJSS8zaDdl?=
 =?utf-8?B?SjM1NjRlYUNjSVRIcEpnMGtZY0dscEpHcGRqcy93RjhoUFVLTkhoZHVuaDk1?=
 =?utf-8?B?R05UQzFLU0ZUQ3JPQ0x2aWgwZDNoREM4cFIwRVJoTzBOdWEyNGozVWVuSzFJ?=
 =?utf-8?B?WG9yakx0N0xpMDBETjgxTGk3cjc0WFRxdE96Sm9hZ2JCQlcxdmVpYnZBQlBo?=
 =?utf-8?B?L1JtdmZ6WVpnSDNiQllJZXVxSWJnKzFjemxlZm56dW9ORGVuV25NQVF0aG8v?=
 =?utf-8?B?U2h1aEdzNHA0OXFkdlhWVkRaMFZHcnpDTTdtTk4vYVArRU5oeVI1MVhLQzFW?=
 =?utf-8?B?WEc2QS9nOURXam1CQnNKbDZzNkFYRVpBcTdId1MyRWhzZi9pcFIzdTU0dWFz?=
 =?utf-8?B?Rk0wN24reU14dHdjd01icW1DOWIvbm1KRHRNQm5tQ2o0VkZNR0lsWFRUVzQ0?=
 =?utf-8?B?YTJaZGU2dlBBZnpqQTZyanFpdzFLRExma1JxV2l4ZWFkdUk4MFNjM0pyb2dD?=
 =?utf-8?B?VVlKVUpGaWIxeUZZQkNpZHJuc24rVXdKS2tGRDc4eDlWWXVlTW50Q0VuTUpC?=
 =?utf-8?B?eFV1UVI0RCt1VkxVSjM3K2VDTlM0RGRtMGNtU0pnTGI2ajRjMjFLMUpTNjRI?=
 =?utf-8?B?amhCay9YRVlLVVZTTzMyVHhJNndOandYb0JhQjRiR2pSQ0ZkRTZYYTJCWE9K?=
 =?utf-8?B?UjczRHJqRm1YVkpNSVZrUzFxVk1CaDkzY1ZVcGw2UHlKTUhNY1JLd3F6RERY?=
 =?utf-8?B?WEdTNGNMYmtlUlA2N0NmWEkwbzZPdVV6Q3hLVFVsZFVpUzhXTEhESGVYbnVm?=
 =?utf-8?B?ZGs3OUd6b0xGc3A2K2E4TFZCYlVRL0dXYlZRVjN3MWRlZHkvVE9qRnJ3aTBE?=
 =?utf-8?B?eUlRcHo5YjVTOUZoK0ZiVmUxMWp0cTN0dmJNVUFsa1RZV2k3Ylhsd1owZXd4?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 182a3b29-9540-480a-e9da-08ddc5afc84a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 04:01:32.8634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0EjWHFqrZoH/FD/xtkmZHQSOPJIWRl/i1Wyq5LnyS/+dQt7m2eKi8zWv6knZEYv5AyF8j5JeoP5vk4C8zz+gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6499
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

On Thu, Jul 17, 2025 at 03:38:23PM +0200, Francois Dugast wrote:
> This struct embeds more information than just the DMA address. This will help
> later to support folio orders greater than zero. At this point, there is no
> functional change as the only struct member used is addr.
>

This patch alone will break the build. You'll need to combine it with
the next patch to avoid build breakage.

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 58 +++++++++++++++++------------------
>  include/drm/drm_pagemap.h     |  8 ++---
>  2 files changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 1da55322af12..0ed66aaade14 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -202,7 +202,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>  /**
>   * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
>   * @dev: The device for which the pages are being mapped
> - * @dma_addr: Array to store DMA addresses corresponding to mapped pages
> + * @device_addr: Array to store DMA information corresponding to mapped pages
>   * @migrate_pfn: Array of migrate page frame numbers to map
>   * @npages: Number of pages to map
>   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> @@ -215,7 +215,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>   * Returns: 0 on success, -EFAULT if an error occurs during mapping.
>   */
>  static int drm_pagemap_migrate_map_pages(struct device *dev,
> -					 dma_addr_t *dma_addr,
> +					 struct drm_pagemap_device_addr *device_addr,

I like the change to drm_pagemap_device_addr—I think it fits with the
patch—but it's not actually a device address. It's a DMA mapping of CPU
memory. Originally, drm_pagemap_device_addr was intended to represent a
device memory address shared between devices. That said, I think it
still works for our purpose here.

So, I suggest we rename it:
s/drm_pagemap_device_addr/drm_pagemap_addr
And for the variable:
s/device_addr/pagemap_addr

Thomas is back Monday, perhaps field his input on this too.
 
>  					 unsigned long *migrate_pfn,
>  					 unsigned long npages,
>  					 enum dma_data_direction dir)
> @@ -231,8 +231,8 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  		if (WARN_ON_ONCE(is_zone_device_page(page)))
>  			return -EFAULT;
>  
> -		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> -		if (dma_mapping_error(dev, dma_addr[i]))
> +		device_addr[i].addr = dma_map_page(dev, page, 0, PAGE_SIZE, dir);

I'd explicitly set proto to DRM_INTERCONNECT_SYSTEM here—even though
it's zero—for clarity, and also set the dir for completeness.

Matt

> +		if (dma_mapping_error(dev, device_addr[i].addr))
>  			return -EFAULT;
>  	}
>  
> @@ -242,7 +242,7 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  /**
>   * drm_pagemap_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
>   * @dev: The device for which the pages were mapped
> - * @dma_addr: Array of DMA addresses corresponding to mapped pages
> + * @device_addr: Array of DMA information corresponding to mapped pages
>   * @npages: Number of pages to unmap
>   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
>   *
> @@ -251,17 +251,17 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>   * if it's valid and not already unmapped, and unmaps the corresponding page.
>   */
>  static void drm_pagemap_migrate_unmap_pages(struct device *dev,
> -					    dma_addr_t *dma_addr,
> +					    struct drm_pagemap_device_addr *device_addr,
>  					    unsigned long npages,
>  					    enum dma_data_direction dir)
>  {
>  	unsigned long i;
>  
>  	for (i = 0; i < npages; ++i) {
> -		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
> +		if (!device_addr[i].addr || dma_mapping_error(dev, device_addr[i].addr))
>  			continue;
>  
> -		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> +		dma_unmap_page(dev, device_addr[i].addr, PAGE_SIZE, dir);
>  	}
>  }
>  
> @@ -314,7 +314,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  	struct vm_area_struct *vas;
>  	struct drm_pagemap_zdd *zdd = NULL;
>  	struct page **pages;
> -	dma_addr_t *dma_addr;
> +	struct drm_pagemap_device_addr *device_addr;
>  	void *buf;
>  	int err;
>  
> @@ -340,14 +340,14 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		goto err_out;
>  	}
>  
> -	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*device_addr) +
>  		       sizeof(*pages), GFP_KERNEL);
>  	if (!buf) {
>  		err = -ENOMEM;
>  		goto err_out;
>  	}
> -	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> -	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> +	device_addr = buf + (2 * sizeof(*migrate.src) * npages);
> +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*device_addr)) * npages;
>  
>  	zdd = drm_pagemap_zdd_alloc(pgmap_owner);
>  	if (!zdd) {
> @@ -377,7 +377,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  	if (err)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
> +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, device_addr,
>  					    migrate.src, npages, DMA_TO_DEVICE);
>  	if (err)
>  		goto err_finalize;
> @@ -390,7 +390,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		drm_pagemap_get_devmem_page(page, zdd);
>  	}
>  
> -	err = ops->copy_to_devmem(pages, dma_addr, npages);
> +	err = ops->copy_to_devmem(pages, device_addr, npages);
>  	if (err)
>  		goto err_finalize;
>  
> @@ -404,7 +404,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
>  	migrate_vma_pages(&migrate);
>  	migrate_vma_finalize(&migrate);
> -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, device_addr, npages,
>  					DMA_TO_DEVICE);
>  err_free:
>  	if (zdd)
> @@ -509,7 +509,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	unsigned long npages, mpages = 0;
>  	struct page **pages;
>  	unsigned long *src, *dst;
> -	dma_addr_t *dma_addr;
> +	struct drm_pagemap_device_addr *device_addr;
>  	void *buf;
>  	int i, err = 0;
>  	unsigned int retry_count = 2;
> @@ -520,7 +520,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	if (!mmget_not_zero(devmem_allocation->mm))
>  		return -EFAULT;
>  
> -	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
> +	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*device_addr) +
>  		       sizeof(*pages), GFP_KERNEL);
>  	if (!buf) {
>  		err = -ENOMEM;
> @@ -528,8 +528,8 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	}
>  	src = buf;
>  	dst = buf + (sizeof(*src) * npages);
> -	dma_addr = buf + (2 * sizeof(*src) * npages);
> -	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
> +	device_addr = buf + (2 * sizeof(*src) * npages);
> +	pages = buf + (2 * sizeof(*src) + sizeof(*device_addr)) * npages;
>  
>  	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
>  	if (err)
> @@ -544,7 +544,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	if (err || !mpages)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
> +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, device_addr,
>  					    dst, npages, DMA_FROM_DEVICE);
>  	if (err)
>  		goto err_finalize;
> @@ -552,7 +552,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	for (i = 0; i < npages; ++i)
>  		pages[i] = migrate_pfn_to_page(src[i]);
>  
> -	err = ops->copy_to_ram(pages, dma_addr, npages);
> +	err = ops->copy_to_ram(pages, device_addr, npages);
>  	if (err)
>  		goto err_finalize;
>  
> @@ -561,7 +561,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  		drm_pagemap_migration_unlock_put_pages(npages, dst);
>  	migrate_device_pages(src, dst, npages);
>  	migrate_device_finalize(src, dst, npages);
> -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, device_addr, npages,
>  					DMA_FROM_DEVICE);
>  err_free:
>  	kvfree(buf);
> @@ -612,7 +612,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	struct device *dev = NULL;
>  	unsigned long npages, mpages = 0;
>  	struct page **pages;
> -	dma_addr_t *dma_addr;
> +	struct drm_pagemap_device_addr *device_addr;
>  	unsigned long start, end;
>  	void *buf;
>  	int i, err = 0;
> @@ -637,14 +637,14 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	migrate.end = end;
>  	npages = npages_in_range(start, end);
>  
> -	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*device_addr) +
>  		       sizeof(*pages), GFP_KERNEL);
>  	if (!buf) {
>  		err = -ENOMEM;
>  		goto err_out;
>  	}
> -	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> -	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> +	device_addr = buf + (2 * sizeof(*migrate.src) * npages);
> +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*device_addr)) * npages;
>  
>  	migrate.vma = vas;
>  	migrate.src = buf;
> @@ -680,7 +680,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	if (err)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
> +	err = drm_pagemap_migrate_map_pages(dev, device_addr, migrate.dst, npages,
>  					    DMA_FROM_DEVICE);
>  	if (err)
>  		goto err_finalize;
> @@ -688,7 +688,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	for (i = 0; i < npages; ++i)
>  		pages[i] = migrate_pfn_to_page(migrate.src[i]);
>  
> -	err = ops->copy_to_ram(pages, dma_addr, npages);
> +	err = ops->copy_to_ram(pages, device_addr, npages);
>  	if (err)
>  		goto err_finalize;
>  
> @@ -698,7 +698,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	migrate_vma_pages(&migrate);
>  	migrate_vma_finalize(&migrate);
>  	if (dev)
> -		drm_pagemap_migrate_unmap_pages(dev, dma_addr, npages,
> +		drm_pagemap_migrate_unmap_pages(dev, device_addr, npages,
>  						DMA_FROM_DEVICE);
>  err_free:
>  	kvfree(buf);
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index e5f20a1235be..a0c0882eeb8e 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -170,7 +170,7 @@ struct drm_pagemap_devmem_ops {
>  	/**
>  	 * @copy_to_devmem: Copy to device memory (required for migration)
>  	 * @pages: Pointer to array of device memory pages (destination)
> -	 * @dma_addr: Pointer to array of DMA addresses (source)
> +	 * @device_addr: Pointer to array of DMA information (source)
>  	 * @npages: Number of pages to copy
>  	 *
>  	 * Copy pages to device memory.
> @@ -178,13 +178,13 @@ struct drm_pagemap_devmem_ops {
>  	 * Return: 0 on success, a negative error code on failure.
>  	 */
>  	int (*copy_to_devmem)(struct page **pages,
> -			      dma_addr_t *dma_addr,
> +			      struct drm_pagemap_device_addr *device_addr,
>  			      unsigned long npages);
>  
>  	/**
>  	 * @copy_to_ram: Copy to system RAM (required for migration)
>  	 * @pages: Pointer to array of device memory pages (source)
> -	 * @dma_addr: Pointer to array of DMA addresses (destination)
> +	 * @device_addr: Pointer to array of DMA information (destination)
>  	 * @npages: Number of pages to copy
>  	 *
>  	 * Copy pages to system RAM.
> @@ -192,7 +192,7 @@ struct drm_pagemap_devmem_ops {
>  	 * Return: 0 on success, a negative error code on failure.
>  	 */
>  	int (*copy_to_ram)(struct page **pages,
> -			   dma_addr_t *dma_addr,
> +			   struct drm_pagemap_device_addr *device_addr,
>  			   unsigned long npages);
>  };
>  
> -- 
> 2.43.0
> 
