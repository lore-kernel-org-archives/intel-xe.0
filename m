Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BFEE7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 16:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EA010F08B;
	Fri, 13 Dec 2024 16:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMf8Tp4K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D20D10F08B
 for <Intel-Xe@lists.freedesktop.org>; Fri, 13 Dec 2024 16:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734107825; x=1765643825;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=6CLH4Ne7KVOAOvmvRfJC25l22kLmRyt+8ONBNoxBoEo=;
 b=CMf8Tp4K7m8xGtZ+N8Ha2R9rFrduF35nr8AD4BMzNxTD6GnFURzV6WhD
 kQR2heY4SqhEohYwfxpRIGDMAz08+gT+jezl9xAhY7K2dFumPy3n/1Rcx
 ab7AqZ5uWbRSce21QtBy9HAnApHQY7ZbnZO+RSGfcRLxn8uBb7AM0wZOU
 r9SVIR2zIrwZnhEjUU+ljYPqOCazOkkH88JMpmxda/RZ8cNFSLgOA1ZIO
 W0SChoxHzGVgmXsWcrcy4cd+Q+iv/77ninenm/+omRMG48yv4f7b1r3fv
 MTk0SMtW/yeZnXZf3sbVL+1JWczLkwR2lZunF7pG9vp1xKcMp8crVHMfW g==;
X-CSE-ConnectionGUID: vM9yZwBWQxelxdtpQiR0kw==
X-CSE-MsgGUID: zrvj/bh8RDaYo2KJeMqXHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34699528"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208,217";a="34699528"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 08:37:05 -0800
X-CSE-ConnectionGUID: 0zM5DA8CT7iwbK0MDZ2P7w==
X-CSE-MsgGUID: f9dXApX5Tuy7uQyVtJmOGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208,217";a="96645879"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 08:37:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 08:37:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 08:37:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 08:37:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mls66754KWFobqsGIAwOIw87wBsIaFsyXOSbaIIjzfUgrcYUluPAByxuy+7bq69zug0e5neu2e5C4/hutDMU7AfMBjcittaWHG3/2UhBI8Yy17smEdD5Yomdw+/FAIXD5nDOZZnRU7pHXjnKkSYrTm2DR+qLwS7ZhsRkNYIIImuiqGjB0bHwsvR/IBB8KJcTVcVJGm8gXFxzPto2jp4HjRTJ0cyWhgZNTTSHvWIUHhnMVeXFUZMpa+/3JCFBLFlgIdVrSJ9oFnhtNrL5cXiayCzy/1vJOAteD3hSg2bSUKT2s73wsQawJulUtIEIUi+1/YgvHHYHatJ3P9DyXMh00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9qoqsZAbSLAuHmDih73zGcHNaQXBnYpxPr2rsINbUs=;
 b=mwdUzCB+iFrbQ3VQcJ8wMNs8zq1fi2vWbbZ664QOKnlM98kWlTQfwJp8OmWC56kCkKsU94qQXfc4VKBdiyiYh15DA0RvWEM2C3te0f6bz6QtnyCW+yFpQ+olQ2g/79M4nt/27N4mOku0a1hCaN1bsjnlAUSXtPXNE/iMcCGPzhiOvhg0qZTylfe528wRVL7gr8YSDQV7iyzNT5zZSc972nXjWFZwJX5XJZt8o2sEkBkuJ1DUYy7dfvEdczfQLnOlLmBcTHMDUid2y+nZikO+jiAeDgip6Ws+YpldIM+Tz8wWJWA8aCW3w+Dr2yQWu2nt1g3ryw8BF2B0qDNbp0DjKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS0PR11MB7531.namprd11.prod.outlook.com (2603:10b6:8:14a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 16:36:46 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 16:36:46 +0000
Content-Type: multipart/alternative;
 boundary="------------ev4ENb2C97poFehJ6rEgDvv0"
Message-ID: <421289df-ed8e-41a3-8f66-959d42e3b9b4@intel.com>
Date: Fri, 13 Dec 2024 08:36:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/11] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: "Souza, Jose" <jose.souza@intel.com>, "Intel-Xe@Lists.FreeDesktop.Org"
 <Intel-Xe@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Filipchuk, Julia" <julia.filipchuk@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
 <20241003004611.2323493-5-John.C.Harrison@Intel.com>
 <ccc1066ab139e800cd8f67535c97aca486bf105d.camel@intel.com>
 <7qhmppwrqj5fsr3tkvufwua3iw7noadrefajrii66x7yydfeba@lqhgd7b5decp>
 <208f50d9-58e8-413e-915f-95ca077e0fa0@intel.com>
 <dahmzb4tveblm74nwhq5mabz672xivpfeuvkpzb6hnjfs4qrwt@rl6c56v6mfyy>
 <db943f8a-0d92-49bc-827e-46284739e8be@intel.com>
 <zy2x47cknwhzycszh7otjn5t65pvsotwwftcbleq44cmzbibaw@5gsx7zp7t2sm>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <zy2x47cknwhzycszh7otjn5t65pvsotwwftcbleq44cmzbibaw@5gsx7zp7t2sm>
X-ClientProxiedBy: MW4PR04CA0307.namprd04.prod.outlook.com
 (2603:10b6:303:82::12) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS0PR11MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f4bc47-916d-4b27-abc3-08dd1b9455ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHhnSXZBUWZNU1ZqTHB4V21Pc1RSWU9WaVVDVkJPbk5YeE1qamZueDVHd2xn?=
 =?utf-8?B?bXlhTjhSSVU5bFBmU21aTWJJWTVVUjBlRE51ZHJPZjd0dnhwaFRZcHRoSkVq?=
 =?utf-8?B?NmtFUU9mcFVPVUdCZ1Q0NmpQS0N2KzJwMk1xUlEvTExvSlZZRmh2RnFOZkhO?=
 =?utf-8?B?cnhhQlN6TEdlcW43ZXZLUkpSNDM2cXEzeGNMdlFsdWZneE1mR25ueTFGMlBW?=
 =?utf-8?B?QlAwOGxLWDQyMWJueDFzUXd5QmpWMVd3UktsSXpJV0YvRlRRMmt2UEtZUnlU?=
 =?utf-8?B?UVE1NDhsM1NPOW1JZGp6TzE0a2dKczlZSGNlT3B6VlBDd0Y2UUdLc1phR293?=
 =?utf-8?B?c0Iyek4yQnZMUGlKdURsVDM2WWlHVEU4N2lWTEQvTVRrcExGRUtScFVjRFNZ?=
 =?utf-8?B?eEo3NnN6SHdSVi9uTXBadnZDcjQvRHp1ODVlalROSlM1ZEgxV3V3c2NIOEJD?=
 =?utf-8?B?QWdrTGpVZmZwNTBnZkVySTZILzBoY0wvU3VHU2JUTDdwWUdoa0hCdmpkMG9n?=
 =?utf-8?B?U0FIYjJDM3YrY0NOOVhYOWVFZ0RhR0ZrOTV0bWNlS0xLb2hjVUx2WFlzL1VV?=
 =?utf-8?B?NlF5TmJQRzgzMkk2d1YvRFlVZGM1UFdHVDYxSjFGVFNqYjhhWkhiS1p6U2dP?=
 =?utf-8?B?TmpLYjBlY0RwN21IeEliQ0IvRWg1MWdTQy93Z2hBZnRJNUhwZ3JKSG1rZEdk?=
 =?utf-8?B?RTZURWd1ckIwTHVFTXdhSGVNcUhEU2xtOEpIS1k3Y3ZqVGZMQ1QwcHpXa2sw?=
 =?utf-8?B?dzFaWERqQVJXb2ZQV1lWSXp2SEgrSXBRTVBqc1pBaklxemlLQTdVdkF5eGps?=
 =?utf-8?B?WDcwbVZzeHEvRDg0WkVheE81Uzh3Z3NWYTd0T1hhc05EOWkxY2c2eEx1ekJZ?=
 =?utf-8?B?aDF5VmZ6M0xQSzRHdXNVa0pyZHhMOExQSlJXWTNOSlJzeS84STJCL1VZbDNQ?=
 =?utf-8?B?dmhXWWVobHRISm9EQnNodGI3YzAzNzJXZ2R5U25va1R4UEpPNXgrWVNrYWdm?=
 =?utf-8?B?WWJDVzB6RGpoY0FEYmRqdWRaZjNWamttNGVNSGlzN2RvMVYwTHlLc0dBQXlL?=
 =?utf-8?B?NVN2L1dEYnlBeWs2dnY1TzZhVGVjZXZzY1BDbFZ0aTJRZEl4Ym1nK0hFVFRa?=
 =?utf-8?B?VTlTZGhpZzEwSXByYXZBN01EMnFkekFEbEZRQnVibFRJWTlnMGhvMEhnZ0gz?=
 =?utf-8?B?am9ZNmxOYUQzNXJRTWVLcDVrY3dPWTJhcXNGT1NEeXJsc1BtQXBYVFhRNjhi?=
 =?utf-8?B?YXd0YUxBdkh5ZXcyN0Z0Y2YvV3d2Rk1jLzlvb1hQRnkyK1hDYXRMOXFIeTU4?=
 =?utf-8?B?MHhha0hZS2dFZ2lXVWhKQ0Y3clpjQlczT1U4VmZxMjFwSGFsQzVVV1JTQkpN?=
 =?utf-8?B?cHBSOXZjL0cyeHVWS2VKOGNlTFQ2OTd2VWxrYXl6bFFMVVNOQW00SXJSTjd1?=
 =?utf-8?B?ZXFmcmZXYnFMNmFqQmxKRGlZVERSeGhWY0dhTkU4cjZJcytMNElyNXl1YjRP?=
 =?utf-8?B?N2tPaTV4NS94Mm9DN3luYmpzUjBTV0FMeWd1U3RVaGIwMUdKT3cwRjZxMDhl?=
 =?utf-8?B?TWk1U1dxeWk4d0RtT3IxQ2lDdHNvOHNYRFQyeUN4NUMxR2pEZWJjRnVBSnJz?=
 =?utf-8?B?TEIrbFR2cG5ZanltM2kwNmZodXlPR2ZwczFzOTlwYjk0MWhXYytxY0NHaXk4?=
 =?utf-8?B?WStCOUZVbzBMdWlNUnBxWWo3RmFldWx6NG5Vb1o2c1czdnZBWlM3Tm9oaUt2?=
 =?utf-8?Q?zjZY5QXkIXoyxV5fEo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHBieG5FM0dweURXd1ZieWwxUkFKc3VRcUJFVTJRa0NJMDBZTTNKWjF5S0hR?=
 =?utf-8?B?VHhWM1ltZXZ2WjVmOWVOUER2UlA4MXlxNGFIU3p3UDNOK25yRDFFNFFLRnpy?=
 =?utf-8?B?eEdqRHVmZkVXenIzTUxIcFEwa2QxQzIraXlDenIxU3krN2ZyVmptZkNvOGR1?=
 =?utf-8?B?Y0svWi9CK0VwWktieUFJQVFCNWkxaXlxVkEraGczU3F1TjN0UU5OQkI5QXRu?=
 =?utf-8?B?WXhTYk1Pbkg0RXRadmxrLzduNlBhVGxRNmpUVkdleDZVcHMzU0lBenlrZGI4?=
 =?utf-8?B?bERWNjg2OStkNW80TXRJMmt6WDBIWkljMk0wY2p6c3lpb0lXR0pRQlpHN09I?=
 =?utf-8?B?ZldLdGRTdHJxSWJlQ3ExZ1ZkdGVWMmNMK0dTalovUU4xVTlrRmpycUpMcmVM?=
 =?utf-8?B?UDFGRWlSM3ZpYXp5Mlc0Y3BZLzZJSjFRTWRCQTVlVlcrY3pXRS8yUmprUzJo?=
 =?utf-8?B?cGtIcHVTWk9Da3JENUh4a2tnWnhDaGdIeEhsckdjWUkrdnU5N0syMjViL2tE?=
 =?utf-8?B?KzA5Z3J0VkpQT3hkQThVSWJUQktiMmt0K2NSVnpjMWovWDdBQi9jeU9BbCsw?=
 =?utf-8?B?blZ5ejlRMHVIVkx0UmZ3dTJjUFdrelBwVjVZRFVWdmNLdis4Y0ZDM3N2TVVt?=
 =?utf-8?B?b2g5TUNFQlp2KzI3REwxcmphc3BCMkJvSnF0V3hXUWREajd6bC8xM29GamZN?=
 =?utf-8?B?eUUyT3V1SzZmeVpES1I3RDF6a3A0R3diMkV2ZjN0Z203QWczZlB3dGRiWDEr?=
 =?utf-8?B?MnhVVFA5S2Y2eTdvdkdvUEp5bHdVUW45QTlJaFVXSUR2QW9qNTJmdnFrbmgv?=
 =?utf-8?B?SWFCZ3VnODd0QVZYaTNhQXFDSXlMLzM4UUNUc0U4eE9PTkI3aWhzenU0dlZa?=
 =?utf-8?B?QmIyUHpENjlxd2JMVjhVcmtJcmZyTmdnREUyeHRGUk1XNWJQdHJzNDdJNmhj?=
 =?utf-8?B?SzgwOGNRVVN4SmxvQ0FaeTY3MDdwb2NBVktBMExsS29jaGl4S1Z6UGc3eFg5?=
 =?utf-8?B?LzUzaXI3ZlRjQktRRzQ1NWpUQzhLSVloUkpBNXRVOXVDQkQ4dWs5RXJvY2U1?=
 =?utf-8?B?eGc2M3Q2OE10Nm44MTNjSkZBMGhIWExoYXhNUkpvdzBmR2JKT1duVm5SRUp3?=
 =?utf-8?B?MFRYVDI1WWptcGdOVVZJZDhQMWtSNU9uem5SZnExbjRkc3V6QWpXWW5xZ3lQ?=
 =?utf-8?B?Wktadk14S3ptRFhiT2x1UjF4aEhPZVQ1SU81elEvK3JlZlhraTZNVlN5Q3BJ?=
 =?utf-8?B?dGVBeTRkbS9GOUgyZjRvSWtIbmxja2tSQmR1T3JJNm5ZOTF0TVU2bVQ4YVl0?=
 =?utf-8?B?bFEydko2Y3hrZk1LUzdob0F3bHNHVHQwTVRvdnptOVc4L2ZEcCt3RTVmd055?=
 =?utf-8?B?NDF3UGNnK3pwTnk0c2UvRUdGdHNualJjQXhpTXp2cHQ0ZkpMYkdRNlprQ0J3?=
 =?utf-8?B?Q3dEZHNDZW1rM1I3Tk9WTnQxNWZWbzEzM1VkaGliT3lSSDgyWjRzaUNZVTlC?=
 =?utf-8?B?TUJMV0RubGRWd1RLSmJoT0VtTFVBRmhtbTBUcmVuV3YzbEJSTWd0NnFnR3Jr?=
 =?utf-8?B?aDdqcDFsQnorRW1LMFp5NmlVME5WcVVIN3diNHhIeTkweDl4SnNUbWJjdDVP?=
 =?utf-8?B?S0FnWGd1bUcxMTBDSktxcm14ZlJwSXlGUVhKYkEvdkxHT3FKWnptOTBiWVVz?=
 =?utf-8?B?aGNINTJPVUFSY0hhck12Z2xFdWpuTTNDWDJHWnR2bjJsZ29tdE5sWktLV2tk?=
 =?utf-8?B?eGwrWjVyYXUwQSs0OURickltZ2MyN0RBMTMwTUowQmZQaHZpbER2eXBtdlRs?=
 =?utf-8?B?QytXdEM1VFFycW5BcDJxM0hLWkQxeTNsSHhCWFVXdWVFRGtoL2dZWXNjRjJx?=
 =?utf-8?B?WHFUMGRDZGdtSzBjRFBjeDRpcldMMzJaMGQwZE1iOU84UWt3QzN2bmFHaGJS?=
 =?utf-8?B?bk05MjdGWlN6TmdiWWFZKyt3RmR1NWFYMTdIcFdYNFJwMXpCMEJRZE9teWZR?=
 =?utf-8?B?NWNyNTB2SkIzK0EwY21MMHY2UXQ2ck90WnFENkc5YnZ0VWVwTTdJY1p4UGh5?=
 =?utf-8?B?YjQ3eUlWeHRWdHA1SDBKYlZFSTRqVGwzVWNPRGJiaGc4VWFKdFBZVFRaYWRh?=
 =?utf-8?B?UGxzcWxiRG5vTENDNmZEMm1LbWd4b2hWbW9sdjAwSFRseUZONW1pQTBRcHlO?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f4bc47-916d-4b27-abc3-08dd1b9455ba
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 16:36:46.5960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/wJizCCzrOoB1PUwYZkEUIpIJEb5UpfLoZMywPkWfcelGBW+K3FQDehP818sr70WGSs383PRwQ25e/otBau+KdntUYhyvmPSYlEaFnkvH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7531
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

--------------ev4ENb2C97poFehJ6rEgDvv0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/2024 16:32, Lucas De Marchi wrote:
> On Thu, Dec 12, 2024 at 01:04:23PM -0800, John Harrison wrote:
>> On 12/12/2024 12:52, Lucas De Marchi wrote:
>>> On Thu, Dec 12, 2024 at 11:14:23AM -0800, John Harrison wrote:
>>>> On 12/12/2024 10:45, Lucas De Marchi wrote:
>>>>> On Thu, Dec 12, 2024 at 05:41:41PM +0000, Jose Souza wrote:
>>>>>> On Wed, 2024-10-02 at 17:46 -0700, John.C.Harrison@Intel.com wrote:
>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>
>>>>>>> There is a need to include the GuC log and other large binary 
>>>>>>> objects
>>>>>>> in core dumps and via dmesg. So add a helper for dumping to a 
>>>>>>> printer
>>>>>>> function via conversion to ASCII85 encoding.
>>>>>>>
>>>>>>> Another issue with dumping such a large buffer is that it can be 
>>>>>>> slow,
>>>>>>> especially if dumping to dmesg over a serial port. So add a 
>>>>>>> yield to
>>>>>>> prevent the 'task has been stuck for 120s' kernel hang check 
>>>>>>> feature
>>>>>>> from firing.
>>>>>>>
>>>>>>> v2: Add a prefix to the output string. Fix memory allocation bug.
>>>>>>> v3: Correct a string size calculation and clean up a define (review
>>>>>>> feedback from Julia F).
>>>>>>>
>>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/xe/xe_devcoredump.c | 87 
>>>>>>> +++++++++++++++++++++++++++++
>>>>>>>  drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++
>>>>>>>  2 files changed, 93 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>>>>>>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>> index 2690f1d1cde4..0884c49942fe 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>> @@ -6,6 +6,7 @@
>>>>>>>  #include "xe_devcoredump.h"
>>>>>>>  #include "xe_devcoredump_types.h"
>>>>>>>
>>>>>>> +#include <linux/ascii85.h>
>>>>>>>  #include <linux/devcoredump.h>
>>>>>>>  #include <generated/utsrelease.h>
>>>>>>>
>>>>>>> @@ -315,3 +316,89 @@ int xe_devcoredump_init(struct xe_device *xe)
>>>>>>>  }
>>>>>>>
>>>>>>>  #endif
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * xe_print_blob_ascii85 - print a BLOB to some useful location 
>>>>>>> in ASCII85
>>>>>>> + *
>>>>>>> + * The output is split to multiple lines because some print 
>>>>>>> targets, e.g. dmesg
>>>>>>> + * cannot handle arbitrarily long lines. Note also that 
>>>>>>> printing to dmesg in
>>>>>>> + * piece-meal fashion is not possible, each separate call to 
>>>>>>> drm_puts() has a
>>>>>>> + * line-feed automatically added! Therefore, the entire output 
>>>>>>> line must be
>>>>>>> + * constructed in a local buffer first, then printed in one 
>>>>>>> atomic output call.
>>>>>>> + *
>>>>>>> + * There is also a scheduler yield call to prevent the 'task 
>>>>>>> has been stuck for
>>>>>>> + * 120s' kernel hang check feature from firing when printing to 
>>>>>>> a slow target
>>>>>>> + * such as dmesg over a serial port.
>>>>>>> + *
>>>>>>> + * TODO: Add compression prior to the ASCII85 encoding to 
>>>>>>> shrink huge buffers down.
>>>>>>> + *
>>>>>>> + * @p: the printer object to output to
>>>>>>> + * @prefix: optional prefix to add to output string
>>>>>>> + * @blob: the Binary Large OBject to dump out
>>>>>>> + * @offset: offset in bytes to skip from the front of the BLOB, 
>>>>>>> must be a multiple of sizeof(u32)
>>>>>>> + * @size: the size in bytes of the BLOB, must be a multiple of 
>>>>>>> sizeof(u32)
>>>>>>> + */
>>>>>>> +void xe_print_blob_ascii85(struct drm_printer *p, const char 
>>>>>>> *prefix,
>>>>>>> +               const void *blob, size_t offset, size_t size)
>>>>>>> +{
>>>>>>> +    const u32 *blob32 = (const u32 *)blob;
>>>>>>> +    char buff[ASCII85_BUFSZ], *line_buff;
>>>>>>> +    size_t line_pos = 0;
>>>>>>> +
>>>>>>> +#define DMESG_MAX_LINE_LEN    800
>>>>>>> +#define MIN_SPACE        (ASCII85_BUFSZ + 2) /* 85 + "\n\0" */
>>>>>>> +
>>>>>>> +    if (size & 3)
>>>>>>> +        drm_printf(p, "Size not word aligned: %zu", size);
>>>>>>> +    if (offset & 3)
>>>>>>> +        drm_printf(p, "Offset not word aligned: %zu", size);
>>>>>>> +
>>>>>>> +    line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>>>>>>> +    if (IS_ERR_OR_NULL(line_buff)) {
>>>>>>> +        drm_printf(p, "Failed to allocate line buffer: %pe", 
>>>>>>> line_buff);
>>>>>>> +        return;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    blob32 += offset / sizeof(*blob32);
>>>>>>> +    size /= sizeof(*blob32);
>>>>>>> +
>>>>>>> +    if (prefix) {
>>>>>>> +        strscpy(line_buff, prefix, DMESG_MAX_LINE_LEN - 
>>>>>>> MIN_SPACE - 2);
>>>>>>> +        line_pos = strlen(line_buff);
>>>>>>> +
>>>>>>> +        line_buff[line_pos++] = ':';
>>>>>>> +        line_buff[line_pos++] = ' ';
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    while (size--) {
>>>>>>> +        u32 val = *(blob32++);
>>>>>>> +
>>>>>>> +        strscpy(line_buff + line_pos, ascii85_encode(val, buff),
>>>>>>> +            DMESG_MAX_LINE_LEN - line_pos);
>>>>>>> +        line_pos += strlen(line_buff + line_pos);
>>>>>>> +
>>>>>>> +        if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
>>>>>>> +            line_buff[line_pos++] = '\n';
>>>>>>> +            line_buff[line_pos++] = 0;
>>>>>>
>>>>>> This breaks ascii85 parser that we had up to now.
>>>> It should not break the decoding of existing sections. This helper 
>>>> is only being used for the new GuC objects at present. As per the 
>>>> TODO, the intent is to use it for all blobs in the future. But that 
>>>> was deliberately left to a future update (which hasn't been posted 
>>>> yet) to avoid breaking the mesa tool.
>>>
>>> it broke nonetheless because then it fails to decode this line the way
>>> it was doing:  each line starts a new key.
>> It barfs on any line it doesn't understand? Seems like it could be 
>> made to be more robust in general.
>
> I don't know, you're welcome to look at the source and understand how
> it may possibly break when you are doing a change like that. Even better
> if you can make it robust so it doesn't break. I'm sure you know where
> the mesa repo is. I was just looking at what I wrote in the email thread
> I pointed out when reviewing this. I was surprised it got applied as is,
> knowing it would break (because I had pointed it out) even with 2
> maintainers saying we shouldn't break the mesa tool in question...
To be clear, no-one *knew* anything would break. The vast majority of 
that email thread was about whether we should include any ASCII85 data 
in the devcoredump at all (which is something we had already been doing 
for a long time). What you actually wrote was:

+José, would it be ok from the userspace POV to start adding the \n?
Then we can at least have all fields in our devcoredump to follow the
same format. Are these the decoder parts on the mesa side?


Which to me reads as a question about whether we can update the existing 
ASCII85 sections to use the new helper function. It was not a question 
about whether adding a totally new field (using the new helper function) 
would cause a break. And given that there was no response after several 
weeks, it was reasonable to assume that it was not considered a problem.

And there was never any discussion about whether adding extra section 
headings would cause a problem. That was never even considered to be 
'unsafe'.

John.

>
> particuarly it being just to please something that shouldn't exist (a
> garbage dump to dmesg).
>
> And before you argue about format version and potential breakages if an
> hypothetical parser is doing obscure things... this is different than
> real breakage: we know there's a parser and we ignored it saying we
> don't care. That is not acceptable.
>
>>
>>>
>>>>
>>>>
>>>>>> And I think there is not safe way to parse it now, how would the 
>>>>>> parser know that the blob reach to end?
>>>> The GuC decoder tool simply ignores leading/trailing whitespace and 
>>>> keeps decoding until it finds a line with a new field - i.e. 
>>>> anything with a non-ASCII85 character such as ':' or '*'. It is 
>>>> totally
>>>
>>> character set for ascii85 is [33, 117] and 122, which includes both ':'
>>> and '*'. Hopefully it's hard to hit a collision, but we shouldn't 
>>> design
>>> it in a way that is possible.
>> Sorry, getting myself confused - it was a while ago when I was 
>> writing this. Yes, punctuation marks are part of the ASCII85 
>> character set.
>>
>> The GuC decoder looks for white space - a blank line or a line with a 
>> space in it. Any new field is guaranteed to be "name: data" so will 
>> have a space. And sections are delimited with blank lines, plus 
>> section headers are "**** name ****" so also guaranteed to have a space.
>
> space is good because it's outside the character set, so an
> if/else chain with `if (strstartswith("RandomKey: "))` could
> disambiguate it. But maybe it'd be better to have a space at the end of
> the line so a parser knows when the next line should be a continuation,
> just like with use "\" in some places. That is better then trying all
> keys before deciding "never mind, concat with what I was reading before".
> That may break your guc log parser, but it's probably less drastic than
> just reverting this whole thing.
>
> Lucas De Marchi
>
>>
>> John.
>>
>>
>>>
>>>
>>>> reliable for me.
>>>>
>>>>>
>>>>> Just looked at this code to check if we also had a "Size" as I 
>>>>> remember
>>>>> seeing it in previous related patches, but we don't. If
>>>>> we did then you could use that to calculate how much you still had to
>>>>> read, ignoring the \n. With the current scheme I think one
>>>>> way would be to continue the previous key when the line doesn't start
>>>>> with a new key. Awful, yes, and not future proof.
>>>> Any new field is guaranteed to have a colon in it and any new 
>>>> section header is guaranteed to have a star in it. Sounds pretty 
>>>> reliable to me.
>>>
>>> that's what I said by "continue the previous key when the line doesn't
>>> start with a new one".
>>>
>>>
>>>>
>>>> The other option would be to have an explicit prefix at the start 
>>>> of each continuation line. E.g. "A85:".
>>>
>>> let's not make it worse than it already is. And not future proof by
>>> given the encoding algorithm the meaning of "continuation line".
>>>
>>> Lucas De Marchi
>>>
>>>>
>>>> The problem with a size field is that ASCII85 encoding is data 
>>>> dependent - it has extremely basic run length encoding of strings 
>>>> of zeros. So you only know the size after the encoding is complete. 
>>>> Which means either the size field is in the dump after the encoded 
>>>> data (which is therefore useless) or you can't stream the encode 
>>>> and must encode to an in-memory buffer first, then print the size, 
>>>> then print your pre-encoded data.
>>>>
>>>>
>>>>>
>>>>> John, I explicitly said *we can't break the existent users*,
>>>>> pointed to the one in the mesa repo and confirmed with José it 
>>>>> would be
>>>>> indeed a breakage. Please check again the past email thread at
>>>>> https://lore.kernel.org/all/3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu/ 
>>>>>
>>>>>
>>>>>
>>>> That discussion was a question for Jose not a statement. As there 
>>>> was no response for several weeks, I assumed that it wasn't a 
>>>> problem after all.
>>>>
>>>>>
>>>>> Did you at least prepare the mesa parser for that additional \n?
>>>>>
>>>>> We shouldn't have merged the kernel patch as is with the excuse it 
>>>>> reads
>>>>> better in dmesg, when we also said we should not print that 
>>>>> garbage to
>>>>> dmesg :(
>>>> Not following. Should not print what garbage in dmesg? As I keep 
>>>> saying, none of this goes to dmesg by default except in the case of 
>>>> catastrophic CT failure. And in that case, it is extremely useful 
>>>> and the only way to debug issues.
>>>>
>>>> John.
>>>>
>>>>>
>>>>> Lucas De Marchi
>>>>
>>

--------------ev4ENb2C97poFehJ6rEgDvv0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/12/2024 16:32, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:zy2x47cknwhzycszh7otjn5t65pvsotwwftcbleq44cmzbibaw@5gsx7zp7t2sm">On
      Thu, Dec 12, 2024 at 01:04:23PM -0800, John Harrison wrote:
      <br>
      <blockquote type="cite">On 12/12/2024 12:52, Lucas De Marchi
        wrote:
        <br>
        <blockquote type="cite">On Thu, Dec 12, 2024 at 11:14:23AM
          -0800, John Harrison wrote:
          <br>
          <blockquote type="cite">On 12/12/2024 10:45, Lucas De Marchi
            wrote:
            <br>
            <blockquote type="cite">On Thu, Dec 12, 2024 at 05:41:41PM
              +0000, Jose Souza wrote:
              <br>
              <blockquote type="cite">On Wed, 2024-10-02 at 17:46 -0700,
                <a class="moz-txt-link-abbreviated" href="mailto:John.C.Harrison@Intel.com">John.C.Harrison@Intel.com</a> wrote:
                <br>
                <blockquote type="cite">From: John Harrison
                  <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
                  <br>
                  <br>
                  There is a need to include the GuC log and other large
                  binary objects
                  <br>
                  in core dumps and via dmesg. So add a helper for
                  dumping to a printer
                  <br>
                  function via conversion to ASCII85 encoding.
                  <br>
                  <br>
                  Another issue with dumping such a large buffer is that
                  it can be slow,
                  <br>
                  especially if dumping to dmesg over a serial port. So
                  add a yield to
                  <br>
                  prevent the 'task has been stuck for 120s' kernel hang
                  check feature
                  <br>
                  from firing.
                  <br>
                  <br>
                  v2: Add a prefix to the output string. Fix memory
                  allocation bug.
                  <br>
                  v3: Correct a string size calculation and clean up a
                  define (review
                  <br>
                  feedback from Julia F).
                  <br>
                  <br>
                  Signed-off-by: John Harrison
                  <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
                  <br>
                  Reviewed-by: Julia Filipchuk
                  <a class="moz-txt-link-rfc2396E" href="mailto:julia.filipchuk@intel.com">&lt;julia.filipchuk@intel.com&gt;</a>
                  <br>
                  ---
                  <br>
                  &nbsp;drivers/gpu/drm/xe/xe_devcoredump.c | 87
                  +++++++++++++++++++++++++++++
                  <br>
                  &nbsp;drivers/gpu/drm/xe/xe_devcoredump.h |&nbsp; 6 ++
                  <br>
                  &nbsp;2 files changed, 93 insertions(+)
                  <br>
                  <br>
                  diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
                  b/drivers/gpu/drm/xe/xe_devcoredump.c
                  <br>
                  index 2690f1d1cde4..0884c49942fe 100644
                  <br>
                  --- a/drivers/gpu/drm/xe/xe_devcoredump.c
                  <br>
                  +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
                  <br>
                  @@ -6,6 +6,7 @@
                  <br>
                  &nbsp;#include &quot;xe_devcoredump.h&quot;
                  <br>
                  &nbsp;#include &quot;xe_devcoredump_types.h&quot;
                  <br>
                  <br>
                  +#include &lt;linux/ascii85.h&gt;
                  <br>
                  &nbsp;#include &lt;linux/devcoredump.h&gt;
                  <br>
                  &nbsp;#include &lt;generated/utsrelease.h&gt;
                  <br>
                  <br>
                  @@ -315,3 +316,89 @@ int xe_devcoredump_init(struct
                  xe_device *xe)
                  <br>
                  &nbsp;}
                  <br>
                  <br>
                  &nbsp;#endif
                  <br>
                  +
                  <br>
                  +/**
                  <br>
                  + * xe_print_blob_ascii85 - print a BLOB to some
                  useful location in ASCII85
                  <br>
                  + *
                  <br>
                  + * The output is split to multiple lines because some
                  print targets, e.g. dmesg
                  <br>
                  + * cannot handle arbitrarily long lines. Note also
                  that printing to dmesg in
                  <br>
                  + * piece-meal fashion is not possible, each separate
                  call to drm_puts() has a
                  <br>
                  + * line-feed automatically added! Therefore, the
                  entire output line must be
                  <br>
                  + * constructed in a local buffer first, then printed
                  in one atomic output call.
                  <br>
                  + *
                  <br>
                  + * There is also a scheduler yield call to prevent
                  the 'task has been stuck for
                  <br>
                  + * 120s' kernel hang check feature from firing when
                  printing to a slow target
                  <br>
                  + * such as dmesg over a serial port.
                  <br>
                  + *
                  <br>
                  + * TODO: Add compression prior to the ASCII85
                  encoding to shrink huge buffers down.
                  <br>
                  + *
                  <br>
                  + * @p: the printer object to output to
                  <br>
                  + * @prefix: optional prefix to add to output string
                  <br>
                  + * @blob: the Binary Large OBject to dump out
                  <br>
                  + * @offset: offset in bytes to skip from the front of
                  the BLOB, must be a multiple of sizeof(u32)
                  <br>
                  + * @size: the size in bytes of the BLOB, must be a
                  multiple of sizeof(u32)
                  <br>
                  + */
                  <br>
                  +void xe_print_blob_ascii85(struct drm_printer *p,
                  const char *prefix,
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const void *blob, size_t offset,
                  size_t size)
                  <br>
                  +{
                  <br>
                  +&nbsp;&nbsp;&nbsp; const u32 *blob32 = (const u32 *)blob;
                  <br>
                  +&nbsp;&nbsp;&nbsp; char buff[ASCII85_BUFSZ], *line_buff;
                  <br>
                  +&nbsp;&nbsp;&nbsp; size_t line_pos = 0;
                  <br>
                  +
                  <br>
                  +#define DMESG_MAX_LINE_LEN&nbsp;&nbsp;&nbsp; 800
                  <br>
                  +#define MIN_SPACE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (ASCII85_BUFSZ + 2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  /* 85 + &quot;\n\0&quot; */
                  <br>
                  +
                  <br>
                  +&nbsp;&nbsp;&nbsp; if (size &amp; 3)
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;Size not word aligned: %zu&quot;,
                  size);
                  <br>
                  +&nbsp;&nbsp;&nbsp; if (offset &amp; 3)
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;Offset not word aligned: %zu&quot;,
                  size);
                  <br>
                  +
                  <br>
                  +&nbsp;&nbsp;&nbsp; line_buff = kzalloc(DMESG_MAX_LINE_LEN,
                  GFP_KERNEL);
                  <br>
                  +&nbsp;&nbsp;&nbsp; if (IS_ERR_OR_NULL(line_buff)) {
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;Failed to allocate line
                  buffer: %pe&quot;, line_buff);
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
                  <br>
                  +&nbsp;&nbsp;&nbsp; }
                  <br>
                  +
                  <br>
                  +&nbsp;&nbsp;&nbsp; blob32 += offset / sizeof(*blob32);
                  <br>
                  +&nbsp;&nbsp;&nbsp; size /= sizeof(*blob32);
                  <br>
                  +
                  <br>
                  +&nbsp;&nbsp;&nbsp; if (prefix) {
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strscpy(line_buff, prefix, DMESG_MAX_LINE_LEN
                  - MIN_SPACE - 2);
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; line_pos = strlen(line_buff);
                  <br>
                  +
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; line_buff[line_pos++] = ':';
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; line_buff[line_pos++] = ' ';
                  <br>
                  +&nbsp;&nbsp;&nbsp; }
                  <br>
                  +
                  <br>
                  +&nbsp;&nbsp;&nbsp; while (size--) {
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 val = *(blob32++);
                  <br>
                  +
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strscpy(line_buff + line_pos,
                  ascii85_encode(val, buff),
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DMESG_MAX_LINE_LEN - line_pos);
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; line_pos += strlen(line_buff + line_pos);
                  <br>
                  +
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((line_pos + MIN_SPACE) &gt;=
                  DMESG_MAX_LINE_LEN) {
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; line_buff[line_pos++] = '\n';
                  <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; line_buff[line_pos++] = 0;
                  <br>
                </blockquote>
                <br>
                This breaks ascii85 parser that we had up to now.
                <br>
              </blockquote>
            </blockquote>
            It should not break the decoding of existing sections. This
            helper is only being used for the new GuC objects at
            present. As per the TODO, the intent is to use it for all
            blobs in the future. But that was deliberately left to a
            future update (which hasn't been posted yet) to avoid
            breaking the mesa tool.
            <br>
          </blockquote>
          <br>
          it broke nonetheless because then it fails to decode this line
          the way
          <br>
          it was doing:&nbsp; each line starts a new key.
          <br>
        </blockquote>
        It barfs on any line it doesn't understand? Seems like it could
        be made to be more robust in general.
        <br>
      </blockquote>
      <br>
      I don't know, you're welcome to look at the source and understand
      how
      <br>
      it may possibly break when you are doing a change like that. Even
      better
      <br>
      if you can make it robust so it doesn't break. I'm sure you know
      where
      <br>
      the mesa repo is. I was just looking at what I wrote in the email
      thread
      <br>
      I pointed out when reviewing this. I was surprised it got applied
      as is,
      <br>
      knowing it would break (because I had pointed it out) even with 2
      <br>
      maintainers saying we shouldn't break the mesa tool in question...</blockquote>
    To be clear, no-one *knew* anything would break. The vast majority
    of that email thread was about whether we should include any ASCII85
    data in the devcoredump at all (which is something we had already
    been doing for a long time). What you actually wrote was:<br>
    <pre id="b" style="font-size: 13px; font-family: monospace; background: rgb(0, 0, 0); color: rgb(204, 204, 204); white-space: pre-wrap; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">+José, would it be ok from the userspace POV to start adding the \n?
Then we can at least have all fields in our devcoredump to follow the
same format. Are these the decoder parts on the mesa side?</pre>
    <br>
    Which to me reads as a question about whether we can update the
    existing ASCII85 sections to use the new helper function. It was not
    a question about whether adding a totally new field (using the new
    helper function) would cause a break. And given that there was no
    response after several weeks, it was reasonable to assume that it
    was not considered a problem.<br>
    <br>
    And there was never any discussion about whether adding extra
    section headings would cause a problem. That was never even
    considered to be 'unsafe'.<br>
    <br>
    John.<br>
    <br>
    <blockquote type="cite" cite="mid:zy2x47cknwhzycszh7otjn5t65pvsotwwftcbleq44cmzbibaw@5gsx7zp7t2sm">
      <br>
      particuarly it being just to please something that shouldn't exist
      (a
      <br>
      garbage dump to dmesg).
      <br>
      <br>
      And before you argue about format version and potential breakages
      if an
      <br>
      hypothetical parser is doing obscure things... this is different
      than
      <br>
      real breakage: we know there's a parser and we ignored it saying
      we
      <br>
      don't care. That is not acceptable.
      <br>
      <br>
      <blockquote type="cite">
        <br>
        <blockquote type="cite">
          <br>
          <blockquote type="cite">
            <br>
            <br>
            <blockquote type="cite">
              <blockquote type="cite">And I think there is not safe way
                to parse it now, how would the parser know that the blob
                reach to end?
                <br>
              </blockquote>
            </blockquote>
            The GuC decoder tool simply ignores leading/trailing
            whitespace and keeps decoding until it finds a line with a
            new field - i.e. anything with a non-ASCII85 character such
            as ':' or '*'. It is totally
            <br>
          </blockquote>
          <br>
          character set for ascii85 is [33, 117] and 122, which includes
          both ':'
          <br>
          and '*'. Hopefully it's hard to hit a collision, but we
          shouldn't design
          <br>
          it in a way that is possible.
          <br>
        </blockquote>
        Sorry, getting myself confused - it was a while ago when I was
        writing this. Yes, punctuation marks are part of the ASCII85
        character set.
        <br>
        <br>
        The GuC decoder looks for white space - a blank line or a line
        with a space in it. Any new field is guaranteed to be &quot;name:
        data&quot; so will have a space. And sections are delimited with
        blank lines, plus section headers are &quot;**** name ****&quot; so also
        guaranteed to have a space.
        <br>
      </blockquote>
      <br>
      space is good because it's outside the character set, so an
      <br>
      if/else chain with `if (strstartswith(&quot;RandomKey: &quot;))` could
      <br>
      disambiguate it. But maybe it'd be better to have a space at the
      end of
      <br>
      the line so a parser knows when the next line should be a
      continuation,
      <br>
      just like with use &quot;\&quot; in some places. That is better then trying
      all
      <br>
      keys before deciding &quot;never mind, concat with what I was reading
      before&quot;.
      <br>
      That may break your guc log parser, but it's probably less drastic
      than
      <br>
      just reverting this whole thing.
      <br>
      <br>
      Lucas De Marchi
      <br>
      <br>
      <blockquote type="cite">
        <br>
        John.
        <br>
        <br>
        <br>
        <blockquote type="cite">
          <br>
          <br>
          <blockquote type="cite">reliable for me.
            <br>
            <br>
            <blockquote type="cite">
              <br>
              Just looked at this code to check if we also had a &quot;Size&quot;
              as I remember
              <br>
              seeing it in previous related patches, but we don't. If
              <br>
              we did then you could use that to calculate how much you
              still had to
              <br>
              read, ignoring the \n. With the current scheme I think one
              <br>
              way would be to continue the previous key when the line
              doesn't start
              <br>
              with a new key. Awful, yes, and not future proof.
              <br>
            </blockquote>
            Any new field is guaranteed to have a colon in it and any
            new section header is guaranteed to have a star in it.
            Sounds pretty reliable to me.
            <br>
          </blockquote>
          <br>
          that's what I said by &quot;continue the previous key when the line
          doesn't
          <br>
          start with a new one&quot;.
          <br>
          <br>
          <br>
          <blockquote type="cite">
            <br>
            The other option would be to have an explicit prefix at the
            start of each continuation line. E.g. &quot;A85:&quot;.
            <br>
          </blockquote>
          <br>
          let's not make it worse than it already is. And not future
          proof by
          <br>
          given the encoding algorithm the meaning of &quot;continuation
          line&quot;.
          <br>
          <br>
          Lucas De Marchi
          <br>
          <br>
          <blockquote type="cite">
            <br>
            The problem with a size field is that ASCII85 encoding is
            data dependent - it has extremely basic run length encoding
            of strings of zeros. So you only know the size after the
            encoding is complete. Which means either the size field is
            in the dump after the encoded data (which is therefore
            useless) or you can't stream the encode and must encode to
            an in-memory buffer first, then print the size, then print
            your pre-encoded data.
            <br>
            <br>
            <br>
            <blockquote type="cite">
              <br>
              John, I explicitly said *we can't break the existent
              users*,
              <br>
              pointed to the one in the mesa repo and confirmed with
              José it would be
              <br>
              indeed a breakage. Please check again the past email
              thread at
              <br>
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu/">https://lore.kernel.org/all/3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu/</a>
              <br>
              <br>
              <br>
            </blockquote>
            That discussion was a question for Jose not a statement. As
            there was no response for several weeks, I assumed that it
            wasn't a problem after all.
            <br>
            <br>
            <blockquote type="cite">
              <br>
              Did you at least prepare the mesa parser for that
              additional \n?
              <br>
              <br>
              We shouldn't have merged the kernel patch as is with the
              excuse it reads
              <br>
              better in dmesg, when we also said we should not print
              that garbage to
              <br>
              dmesg :(
              <br>
            </blockquote>
            Not following. Should not print what garbage in dmesg? As I
            keep saying, none of this goes to dmesg by default except in
            the case of catastrophic CT failure. And in that case, it is
            extremely useful and the only way to debug issues.
            <br>
            <br>
            John.
            <br>
            <br>
            <blockquote type="cite">
              <br>
              Lucas De Marchi
              <br>
            </blockquote>
            <br>
          </blockquote>
        </blockquote>
        <br>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------ev4ENb2C97poFehJ6rEgDvv0--
