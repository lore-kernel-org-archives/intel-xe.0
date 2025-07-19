Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22547C83F34
	for <intel-xe@archiver.kernel.org>; Sat, 19 Jul 2025 05:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C1C10E1CA;
	Sat, 19 Jul 2025 05:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbqWol7F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005F010E1CA
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Jul 2025 05:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752902334; x=1784438334;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PLMa5TClfHw/KM9cv3qyezC2DWyvr4HHoezT1KI3bCo=;
 b=nbqWol7FvXMmR0s2rByRAi0o5NPRy5NhBTq9zjjYmEzuBxApB3sc/31+
 7PywWNFGgSMC5EA1iH4qtrAK1R0GzNHL2do6YwzvouEbzsVBllK7HedoE
 rc0OfEbuEB4slW0W7R371HHJwFhEgiyqk3jy64ULd32LbiBa0uBXdEUix
 qllkgwTbV+bbb5dolTiUSD8EIsBcHOi4xePdbk2yWJzHrkomAS4tOrkQG
 a/o+y55/063mzi6v9484Pz5x+dE/es5B5ceHmVpfxK3FHfhBmQO38RuLI
 HAc3sgpf7FPO86CL9kmTf6GKP/OPajpDZJIES7AhkMEMRCUxw5rhyL07n A==;
X-CSE-ConnectionGUID: SdqBuhx8TP25rV4tMcEFpA==
X-CSE-MsgGUID: 4s0+GhgJS5uWgrlVaypH/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="66260780"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="66260780"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 22:18:54 -0700
X-CSE-ConnectionGUID: kkbQqLiyTFO8HnK18bqk4g==
X-CSE-MsgGUID: Nk/dqThiQ4Sw9UnSO/a95Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="158831365"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 22:18:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 22:18:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 22:18:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 22:18:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BipdluoKsTtnyf9rjTbuxXFjJOIh4hAAlga5NWGDycRCvnXlOUCj+O1o1gU5Ey6N+0k51YMFipS/yKXiyDZyBebYuHC5Zs/ILwVdwl8zYbBzyjWKUOqPmTrqWskB2A8KNtVk1apRSqYzpK5+vgeKgHP50bb8LDWSxX/tn5b/rzZ1Y3SV8F6KwnMjQMDoxAB6dUHykkmYxc4H+mAL+kegcEbQxYlu/f9R8x2JBh8kaWjg7GN+4BcS3PAfRL9b1uGXPoc6m60OiWE/1B0c/YHDPYDmmXfIUCnCNS2ZH5bd+pIQOKlckt0fweUK/CvLWkyf22GPaJkHAsN3eQdtaqXL3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDNvAv/BjlY8xOPdDcnE4A/VlN87PlBWz1nUd0dZggQ=;
 b=PyZU0YMiRC2eN6fnX29kJox46RIxth0jlKRYizsB/XaRjwzYUgy2rOtjTTyb94XA0cffNEBUyw5vFPueBglhlFjwEXtovU9LZZSTzr42t2hGtMfSijYAhJ/kob2vmcBSMTEQeAAzm+QmxRpbwYPf/AKLePsQmq1PkTOvLGwiA1pcJn708srYglyj8QwlBIRcD2MAzKi6aisJ2peArZuxUxOwzu5s1QnyrtMnzQKEBsNKi8icQ3EySZ4SKrapx1dzsklEjURO7XTbbt6URZaQ0VROVKN2BajbuLygG0FNOwnm/Q4R4ys4WXd2ZMa7Gqnl+9WxIZBDgL0mk+SVaQhDVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by IA1PR11MB7812.namprd11.prod.outlook.com (2603:10b6:208:3f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Sat, 19 Jul
 2025 05:18:24 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%3]) with mapi id 15.20.8943.027; Sat, 19 Jul 2025
 05:18:24 +0000
Message-ID: <4a687d0f-c87c-49ad-bd82-0c8feb690495@intel.com>
Date: Sat, 19 Jul 2025 07:18:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] drm/xe/vf: Refresh utilization buffer during
 migration recovery
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
References: <20250704210228.825843-1-tomasz.lis@intel.com>
 <20250704210228.825843-9-tomasz.lis@intel.com>
 <vl7jppsrsa4wlfekee65cd34kweejtbxfyglcvwainysrhrztn@lszmi53xu2o3>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <vl7jppsrsa4wlfekee65cd34kweejtbxfyglcvwainysrhrztn@lszmi53xu2o3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0033.eurprd03.prod.outlook.com
 (2603:10a6:803:118::22) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|IA1PR11MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 140026cb-b53f-4e1e-ff41-08ddc683af3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3pCV0g4UktXcUx2SlUxQjNMS2VacHVjUnl6c3E0UjdBYlpMcjNOZkhTdVM5?=
 =?utf-8?B?YmE5TTZFK1RWM1A3bGswcFdPQnU3T1pFQ2tSQk5KR0dOWGo4dUJuZURGRFF3?=
 =?utf-8?B?MVdsMy9YbWN0Qi9DeTJ5dkN2U1FBbVhxVEhnWnJYZmVkNHlLVTJFd3FhNkFy?=
 =?utf-8?B?N3VHUFJITTVoZUNFc0oxam40ckVZZzd2QmV1UStZdWR2RzY4LzE4NVdQcmNj?=
 =?utf-8?B?bUg5elZiZWZaQkNOdXV5RjlIMHlLN2p5L3ZWMEF1cDhONVJ2VWhkRDcxM0No?=
 =?utf-8?B?YU5SZkJYdlRQSk9keUd5a0F0R0FlMVlrM0tJSXVRZWRPdTZVZUVHY0s2cGlY?=
 =?utf-8?B?MTRrZ2h4KytjUENsTkYzS09WYjFmV3BFVkgvblBtcWlxdHUwVHFWYzVhdXlD?=
 =?utf-8?B?RmNKWmpCdlBjM1VtMTZsNEM2NGhtdExzMEpubko3QVdtK0lRekFuNHRFbmtD?=
 =?utf-8?B?QkZ5NWxGMkdFWnVvaWZKdnYxVk5mcFlaQzFIUUJVaXZRUzFrN0duNjNPZUFq?=
 =?utf-8?B?djBvQUNXK3QwT0ozVE5IbXR0dDlrQ3B5UEpkaDlpZG9RTmFOdWdzcHBnUWNz?=
 =?utf-8?B?cEMwRHAvaEJ0WDJxWHcyTU9ldHFEZkR3bDY4LzRYckxkdng3VUxSdjhLOGZo?=
 =?utf-8?B?UEUrd1E3T1RFRVd0aHdPOUxwY05TR29Nb285NVpUcVg5YVlKZCtjS2d1aVRL?=
 =?utf-8?B?cUwzMjVaSlNveVR1Nm9QOHFDTk8vcjVRNUJibXJOcHN1ZzNoSktpWWlkdkdB?=
 =?utf-8?B?aHhNa2F3UFoyL2dVdENwYXJiTVp1L0ttWEh4NXlCSWtJODlJTU02U0FGQmZl?=
 =?utf-8?B?dDI0a3Vpd2M5M3haQmFia0VkMDdJOUN3UUhyNWJLbTltdW0xQkNnVGlMZndH?=
 =?utf-8?B?WTg1cHcrU241Vmc1U2ZFWExpSmVQM1BrVjhhb2xocHlacGZhSzNwQmpBMWNU?=
 =?utf-8?B?SDUyWGhjNHNxZzU1NEQ5L0dCNitNZWNNdkJVMjZCaFVMRU10eGJTU0JBMExK?=
 =?utf-8?B?QVBhQTNCUE1HcGRxMWwrOXZhdlpqbnhCa1RRdnE4Sm1kbE53UDliZksva2hN?=
 =?utf-8?B?ZjBrK1FlSFd4bWNjeVlFZXI2Q2QzN0E2a0o3Q2N4cFpyMTUrdUN2enNXNnM5?=
 =?utf-8?B?N0R6UkVCZ0psdXdTYnRXNzRqTTRRa2hDeEYxOXlQYUdpbCtsck83WXg5eXpP?=
 =?utf-8?B?d1dIeUF2M3dwa2pUSkxvbFpNQ1N1cjRLbHN1UDlaSGcyeWoyWTJJV2lNVzJh?=
 =?utf-8?B?czZsK01wNWhSTnk5NUNtRFNjdjdXay9rWkl3NzFyWEQrNitDcnRBekFBY1M5?=
 =?utf-8?B?d3FxUjV5aElXd1FnRlRWRmhHelAxMzljd0ZsWFNVK2VUTC9YOE9Hbk5kKzZI?=
 =?utf-8?B?eXFiNEJOMTdGNXQ3bzRtSUM3SENwRjM2RW1GOXZwM3hOWFJXdURiUFgvYjZi?=
 =?utf-8?B?czFRTm51UXdScFNNMUJlc3ZuazFKYVhsNEV0OXlVTzFwSUtWbi9NSmtuUTJ3?=
 =?utf-8?B?cldIMFE4ZDM1MGdnRXNqSHdIaWlUQkhwWTRnQlJkOGd1QnpjOUNueDNKQUhp?=
 =?utf-8?B?eVdQRGcvbEkrOFRaS2RSdjJJaHFhSGFZcXptS1BZYkJXTVM3dUgwdDVVTHh6?=
 =?utf-8?B?SFh1YWc1angrOXRkSFlleHo3bG1SZmZ3cGl0YVQ5LzJEWVUyT1Q5QjVVWWJV?=
 =?utf-8?B?ejdMaVV2Qys4ZjdJdU95NW4xTzVDbWZ0cWNLb2UwaFdXU3dyZm1tNUNFbXJN?=
 =?utf-8?B?cnVvdFJWWFEzZVZqcW14UTlHaDJPL01tSUdaVG9PSHFCc3lWMDFWTFY4ak9V?=
 =?utf-8?B?YTZwTlBnSE1EcVdpa2dSaXRDRXlTM3BRTy9Sbm51N0h6ZmZkZ1huK3p2cTly?=
 =?utf-8?B?WlNPenFDUWllRnYwVWpiaXY3bExBRFN6cDR3cVhtcXJ2R2czVmRDMlFDdlZr?=
 =?utf-8?Q?41PDMfF4VFo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDZMQlU0TmJqbkUvZVpGZk5ub1k5bmFQNWxmNS91NlJXa3hxdVcwVkxTSTFN?=
 =?utf-8?B?S2R0dS9KYXg3MFZFVG5PT04wR1JRbXBRclNNbTFrSGVIWU9kQUc5SnMrMU4v?=
 =?utf-8?B?RmZpZytDbDNGbE5CajgzQml6RWNtMWR2dGVwNVVCQndSZmd5VW5kclRrY1BU?=
 =?utf-8?B?NkZnZjFsZEhUYUNFMm1PMHBzaWFhRHNFUHZLcmtEclEwVHIrR2hkaGhsTlp5?=
 =?utf-8?B?cjNJQlJrbVloakxHbm1rTmFwMDhpeHUwNlBlMkhFNFFJV012MEtWU3JVMlE1?=
 =?utf-8?B?YUZYd25qWmxpU2lYajZJUGhjU0dKaHJvSEVLeklER3RuWUtZWTNhVEhqZ0po?=
 =?utf-8?B?dHFnSyt3L09mK2t0WXA4K1ZCeTdPK1lYbFc5YVdXT084ZDFrZGFGWExPZ1hQ?=
 =?utf-8?B?VnFDd3BibmpwZEdzMDRzSklmYU1RRDlEWVYxdE9ISFRvQnFwam8wbU5iMGlD?=
 =?utf-8?B?bGFkcmtZUzlBLzdkcWRpTmlLOXVWZThTV1dnT3o5dHNsM1JabnZnb3RPMmxs?=
 =?utf-8?B?eVJ3cjFnSGpydExwTGRhNXE3QmRodG83SFV5a1VPR3drTzJzVWkxdmVpLzNH?=
 =?utf-8?B?TDRmRGpZTWk3Rzh6NzhwVlV4MVJXMWczQ2xVbFhJQ3EvYWRrbU12UTI4VXB1?=
 =?utf-8?B?UEg0WGpXRlJPTmJiMFBtSU8yaHZTeVdIek9tNE1VdzEwUXNORHlDeC9pTTl5?=
 =?utf-8?B?RlVkMTlmL1VrWjI5MU5xdUNBM1hNY2tYNTlPQVRLbVNQNThERUFWenNBcGEw?=
 =?utf-8?B?WHJHQTBKa2tYa3dCMGdmbE5wV2VxQnNsZmtUN01jZ292dHg5Y2t6aFBzeDM5?=
 =?utf-8?B?cGd1aE94bUFXeENZVHNsUEJoWnFma2VYWmJtdDBpSm1wUDhySFFCSzV2bUhB?=
 =?utf-8?B?RUVCZ1BNQW9uZzJyNWU3bE1sdXNBMTVFN0s2L05XbGt2UVVNSUNJdFhtbDEw?=
 =?utf-8?B?TW82QkdPNWhLdlFOb3FINHQrNFA1MzFlRnNWWlRvazY2bEZ1VHJtQnlya1Uv?=
 =?utf-8?B?QklBY0ludjc1cHluNFVWVVJhU1B1NWYrbW14djFZSG56cmprTEZYZlNWVkww?=
 =?utf-8?B?Y2pzbm9KcHpDZkZ2enFIKzBiS202cEVRRG8zZysyV0FpUWUzdThTT0pLQ0JE?=
 =?utf-8?B?TWhIRmRiZ2ZvN21QMTBiVVBoSVV2Y3dCTitYQUt6ZU4xVGxwOUw3YjZobVY0?=
 =?utf-8?B?cUVHQU11cWdOc29mSkE1QkhKSWdtYzROVm5kd094M3NRbTJFTm1DMzNNcVli?=
 =?utf-8?B?Rzd2dzJ1Mnp5ZWhYYStWdThaM21UbVFPR2pxbFl0azc5dEI4WWxDbnJPak9o?=
 =?utf-8?B?NDJnRGdvRE5ENlpSekw5d0JmZm0wSnpzcERPeWI0bWhja1h2dTBjZk84SXpk?=
 =?utf-8?B?OFhwdlVIMGp4YXhURk5pU3ZGY0Fla1dZd0FjQkVwbnNpeUNiTnhmSXgwc2xE?=
 =?utf-8?B?YmJRdmJXNnFKSitZeVllRTRrSDFETEFTMUtiN2w2L1M3c1BzaFoySjkrSnhZ?=
 =?utf-8?B?YVNYbG81bWVwSzMwODk4TkUvZDZkVVdMUmtZNGV4SEhRZTlKRlB5U1pQWXBo?=
 =?utf-8?B?S1Azd0FWTDFNaHVLTnB3K0djdU9TRFh5eDByNWRLTWhtaVJiL2IvWDBVMWR3?=
 =?utf-8?B?MXIySGRlS2kvakZqc0VrS29acGdYSWYzVXN4enBYQ0N5VTdxRnVvdTI0ZEtl?=
 =?utf-8?B?ZlM1bFd5cS8rYzBSTy95eExVZzRIck14TVZyaUFaRjJLdjZzRGJCNjZCa2w3?=
 =?utf-8?B?SW4zV3l0dmJlR2daa1FzMmw0VThQYU94V1VrRFRmaCtydE9lNzFTVkFDSUdO?=
 =?utf-8?B?U0tCMnQwSXNSRkpDalBEZEw0RDljZlp6eEtQMFEzeHFFMEEzb21YT3FvWXN4?=
 =?utf-8?B?QzJKUnBFNEkwbDNwRlJPRnJLVDhKcEZMand6RHo4WUo4bndmbzhYanRZNHNE?=
 =?utf-8?B?QjByeG5URk5CZXNiQ2pucHJQT3RmZ0kyVkVkbTMxYUlYUVZ6TG41QUtuQ0Iv?=
 =?utf-8?B?dUZjOE0vNWZ6TDc4blJiUE5pKy8rWE5BZjN3OS9wZWMxdzhaZ0hOTFBqRE10?=
 =?utf-8?B?SzhXNnIvM3dIb2IxVDliSFN4d1pwOUJSZCtQcUhMdFJUZ2p6a1VOa1c4SjNv?=
 =?utf-8?Q?XXOGmgkz2Op3P12DjQBjHvsva?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 140026cb-b53f-4e1e-ff41-08ddc683af3e
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2025 05:18:24.0804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pu+C5Ds8jzmBXWF6il2pogmaesD39Xl/Y/GHg0yrTSPsWNA9GLcFZJgV7tyDPfVgWaCmu0XPkOXlC4o5Cb9S4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7812
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


On 16.07.2025 20:54, Michał Winiarski wrote:
> On Fri, Jul 04, 2025 at 11:02:27PM +0200, Tomasz Lis wrote:
>> The WA buffer we use to capture context utilization contains GGTT
>> references. This means its instructions have to be either fixed or
>> re-emitted during VF post-migration recovery.
>>
>> This patch adds re-emitting content of the utilization WA BB during
>> the recovery.
>>
>> The way we write to vram requires scratch buffer to be used before
>> the whole block is memcopied. We are re-using a scratch buffer
>> introduced in earlier part of the recovery.
>>
>> v2: Notable rebase after "Prepare WA BB setup for more users" patch
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Needs to be rebased onto current drm-tip (and the tmp buffer allocation
> should probably be shifted down the stack).
> But still:

Will leave the `kalloc()` at higher level. Unless we find another way to 
handle locking,

we cannot allow `kalloc()` while fixups are being applied.

It's not pretty, but that is the consequence of the decision to use temp 
buffer every

time we emit something.

-Tomasz

> Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
>
> Thanks,
> -Michał
>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c |  1 +
>>   drivers/gpu/drm/xe/xe_lrc.c        | 54 ++++++++++++++++++++----------
>>   drivers/gpu/drm/xe/xe_lrc.h        |  4 +++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c   |  2 +-
>>   4 files changed, 42 insertions(+), 19 deletions(-)
