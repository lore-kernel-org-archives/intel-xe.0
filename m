Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE28ECCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 12:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AAC010E774;
	Wed, 22 Oct 2025 12:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CK9yb+/L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F9C10E774;
 Wed, 22 Oct 2025 12:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761136951; x=1792672951;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=tHj0w769urpxB7udm+lpPHkWiNkeeT0pvJt9Hf4JSJ8=;
 b=CK9yb+/L93YsaHcKUMer/+NC6dCf7jV9v1M6F4V5b/6CH7ywmyISm4DU
 gTVorkbMsaYRrgX72t5kvivdrInFByYYTszUvBkek51leTNrTRrdmDpvg
 ApiTAol970NaxyKedxPxBYHxDpEqDyUDz3yvKkwr5SNHaRvDThUJPUoFn
 TtjNnwYVeM8r8kCusUfeIJqHBIYt1Tle6bSvSCzEwdMZ4gMBQK+8wT3/1
 LUX9TfkTCyFkie/wm3wwiSMw4UkylinXYhSCCA1CPzVKY8Kh9qBt3+Ya2
 OOZAz/+2yonBKsSlD93K+YdH5HkYw9UeYJyimrmjOQrjyfrW2DudNtEE/ A==;
X-CSE-ConnectionGUID: kAQ+gmweSRiT+fzQp/65pw==
X-CSE-MsgGUID: vyixLXevSF6bcsBcbweAhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67146885"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="67146885"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 05:42:30 -0700
X-CSE-ConnectionGUID: 6yC/WgICTjmgY8ur4/vtPQ==
X-CSE-MsgGUID: UEe5OdKMRTWZcPFzwIMbAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="188144223"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 05:42:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 05:42:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 05:42:29 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 05:42:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDZ64rQ6IiijWhCws5yG/4IWiCSWPgBIFuHVRz9jW6wKIzwgRH35Dkyu4hSAa7pnMAPe5zCymRtoYLt2dj9/BunTynq9xutopUbfdfuUgf/K3pXWcPwgk/Y18dOu70Kcl9ZfTBwneB0wXRRXvA6y4WbuStmgn4+QYwDeofrdKP7NM552ofO4izA8/VRf0lRXqvgNXaCPUDdg0EF1j96RZWyXOoIO+XAiTwHWKAFlS9Zu6vqXXIVz1poo/OhxxsiT/WFXCqthu26+6Y4fh3yxu01rYtUmM0p2JlM6TrLif1Xu87op35ve1uF6Z0t/JnVRZFKs4ejKO+NIOARaQtmkQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1gTHPh6e9pZDOeFYrsvdvTzn22Tk4/c9IYecsnsklc=;
 b=RyY4sSaeCTNqvihBj00HaagAcgOd7JBk14Xp+eSKt1oLLG1VPUIjootmPlBGVXjifJOurzCt/rxkV4OSgOxGm+ke2rJWouPj0DzK3Inqpdf9grthJ1T28HJehgPUJx016//hUwOM1BLcRE8EK8gFvZuESVCvh0yfec6blL0DVOWhX1pIGv4VfyFP/eWNsD3iMHs09pA1HGAUhGhlR9k2FLVIfsh8piMuj+x6/J8VgoZHx2IPjMF4VDZz9y1Rg3Ny4v5DMbEA0yq+qZukhdlJLTDn2o43ma9p+BAO9C7qsNnMySUkAPmZiYV/VlVdRl0kv+VjvZ2zjVpsKH6HUAQDgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB4907.namprd11.prod.outlook.com (2603:10b6:806:111::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 12:42:27 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 12:42:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176105868659.36825.6087065104789222426@97596180aaec>
References: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-0-27b03971bc7e@intel.com>
 <176105868659.36825.6087065104789222426@97596180aaec>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for drm/xe: Add kunit checks
 for dma_mask_size, va_bits and vm_max_level (rev2)
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Date: Wed, 22 Oct 2025 09:42:21 -0300
Message-ID: <176113694157.3231.3878760106973385610@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::46) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB4907:EE_
X-MS-Office365-Filtering-Correlation-Id: 53643efb-553e-4d33-f77b-08de116874d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTJYWXpxdm5STldSbFBndEdObkRmbjlHelRuR1lSTU9yY1NNWElRZTMwSzRJ?=
 =?utf-8?B?M3YxRU9lQ3BDZ2QzeC9zUzFZMXJwdWpFbFRTSUZvaG5MQjkzZUp1MmFmK0VL?=
 =?utf-8?B?WitEdDEvVDBnWW85VjBxUVhNRWdNbi9LK3lkN2JnaUowaUptYkVEYyszcXc2?=
 =?utf-8?B?eDFlc1cvcmIwZktQVkwxZlZHMkJ6TTg1b0czTDZHc1UrNFdIbW5XbWNHUTJH?=
 =?utf-8?B?MkxOaFA1THdkMVcxZ0w2MWxKY09CN2crVGFSekRpS2dLSU44V1ptd1JJOTNF?=
 =?utf-8?B?WTNFVSszcW1rV2lwSFlNdmxwdUxNZkFRaW4rR21Xam82SkFnbzduWkFWTDkr?=
 =?utf-8?B?b1p1bDVmYWFNWmEwVENEZDYxM1B3Y3VqTWpjR01TOTNrL3AweGt5dEdFaHRu?=
 =?utf-8?B?SHVmM0pTRERBcEVHUjVZeTVWSitiOURwRHAwc3VMNS9vZmRJa0hqcE9tU05z?=
 =?utf-8?B?V1RXMFo0aElwNlc4ajhwd2lHM2NhbGJLQTBzQ2toZHI0ck9rZ0dVYis4OHVk?=
 =?utf-8?B?VWNVbXFVS0NrY2RyWFVETHlWSTV1WWJ1TFBIK3FMVUgzMlhsUnFDV3hTTnk2?=
 =?utf-8?B?T3VFbTVvVTVaYjFOUXVJZTMzb1BiUkxvY1l2Q2dTb1gwNHlHZW1PUnpNekZE?=
 =?utf-8?B?bTBWb2o5c2g3ZG1CNitZUmNLN1BHL0ltZlZlaHNVYjlONnhkdHNRRktySGN6?=
 =?utf-8?B?bFRxOXJNVEF0RnI0K3hwUmVUanAxeDhTbmkxaEVvNW43Q0FPeDBOZzFZR2Fv?=
 =?utf-8?B?OTZYMCtSRUV1UHYycjUzZVVxTm8zaVVneXpkejRHQXhDNkFHR1BoTnF3YTFV?=
 =?utf-8?B?cGpGSUdsUU9jMTIwamp2QUhPNlBUWlErbkN2Zlg3ZEtmck13NDZQaGFuQlpC?=
 =?utf-8?B?dWlnaTJFV1BTSTJBK0txMHBvbWdyTWNnSHN3OTFiUW9ya0RHckt3dzNrSUpv?=
 =?utf-8?B?TzBRVlAvZTRuMTlEK1RsMlphTmlDK1YwRTBCdWFXVVBOR1k1OVVRY2pUcFh1?=
 =?utf-8?B?VXEvQ1N3SnN1NFZzTmNPTFNUeU8rZlRuZnRHd2dMWGIvd2dFVVNMZzR2L1BZ?=
 =?utf-8?B?dkowWER2c3E2ZDYxUWFyUlpMRWVDbWpTUlFqMmRhaDNINUQ5bVhoRkU2eFQ5?=
 =?utf-8?B?dW5hWEdieDFIQ1FSZG5yaU1TWlpNUHhpbUh1WU1LNjY3bS9aVzVKdWZkcFlJ?=
 =?utf-8?B?SlFGZURaOElzNlE0OSs4UVJrSjhiZzVaWnhSdzduSldZRTRnZ1JMQ0dRTCtL?=
 =?utf-8?B?dkhBd3pBTmh2Nlh5aENEbUZ5cVZ5L0RrQUNJU0wxUWl2aXZITkpiYUc4M2Mr?=
 =?utf-8?B?ZmtJRUkrY2FTc0M3RFMvWk4wQ2IvR0Vld3IxaHhTbGgzdjJ0eFhnK1hXM2RQ?=
 =?utf-8?B?TDc2V1V1WHl0Sy9maUdRUUsxRWgwcUgxNy9kN2JqNFN0QlA3UUxTNUFwaEkv?=
 =?utf-8?B?UW13MWVLbngwVU5GeUExaXpucFBIbVp4aDdqUTMvclZSWmV1Y3VrMnFGVWky?=
 =?utf-8?B?Vi9tQUU5dExOTThsTmw1bmFsZS9zWWIvSDJxRkdYMTJzQ2djVGk0Vm5ic3ps?=
 =?utf-8?B?bkhnaGJicjVLN2o4VFZzVG1MTUVnSTBmdXdKZnRWMklnQ3lIWk1mTHV5OW5U?=
 =?utf-8?B?MWhsS1J5MmNGaHlFQ25mdVYzQ1ErWmc2ci9WOTRpaGZ2bFFaRnFhNnI0Rmlx?=
 =?utf-8?B?bnBvVy9XR29JL0M0NnJNVkNTMnczS0VlYkhYYzA0ZXhxakgxWm1WTk9rUFln?=
 =?utf-8?B?K05mR0g3T1NRY0k3Sms0RUhxWXdld2t2YjF6bzlvc0puZ3lObGRhS3o0OHdB?=
 =?utf-8?B?dDJyNXd5NDQ1byt2M0VDQXdHaldrejcwTVFlYlZZaEpXWFNmYUw2UElZUFdZ?=
 =?utf-8?B?WkhuUS9qWm1Ta256dGFWWmJlc0s4U2NjZTlYVVVsZlBrWWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWw3N1ZIL3BKMC9wUXg2eG1TKzYxZS9YeUZPMTYyVzcwaml2djJBSUFxdzBF?=
 =?utf-8?B?RTd0WUVnU3p5QjRIRU5Ca2hiMWY5ckZOaEU0a3VvQUZwNjRCMGlManpITFYz?=
 =?utf-8?B?b09janhsR0tRZEd0UWtzSFJYZEZCYnNvR05YZTdGSDZhZzVLVGptT242Wmw1?=
 =?utf-8?B?UXVjVGhqbWRtbllNM2JqWWVtdUtjcjF5TjFIei9FNGFQU0xhbjcrN2M4dmVU?=
 =?utf-8?B?YlVmQTkyREJnaU51ZlBUNUw5blREOFhzR1NuNTl6REMrcUhXaHl4ZDczR3hV?=
 =?utf-8?B?dmVZNUFBWFIyckRVVy9iczZJM2drc3pqYnlnSzNrT2pvb2tTTzJzdGpzZHUy?=
 =?utf-8?B?MzZJaUYrQWczaEFVWllvbitOWnlMZFBzMlJJcjJNbE9ENFA2czlwWUs2dFY1?=
 =?utf-8?B?UWVLVElrSnNEbEEzWnM4MGJmbXR5QmUvZmhRd1VRVEpWM2ZNV1JuWnV4dy81?=
 =?utf-8?B?aGpmTjg3clN6OEIrMnNsUEZZQ09XWTVreUVWcTBBYnVKcjRxZUVTbldXbk1r?=
 =?utf-8?B?c2RuT3VNZGJMK3ZUNG42dVpwNDRlRTFBQWtvV1pIQ0VCYnN5V1JQSkdWbDVX?=
 =?utf-8?B?WDZYT2M2dmNBVXlKbmdCVm90NDBGanZ3UjJ5MEtPdk42My9lVU9tSER3QXhi?=
 =?utf-8?B?NkUyTHUxd2hSL3Zpbk1mazhRNkNtYkh2TTVRWThkWkFlc2xmNTc4V0RiQmZD?=
 =?utf-8?B?ZE52czVVQzNEWmlGSjIyTXNnVndyRTNaZEdlQ0c5bFd4S25GZE5IV0FNdG0x?=
 =?utf-8?B?TlhlR2xPNnAxSXdPYS91V1B2dUdXcHFTSXlXYm5XYVk3R2FlV210a0Z0NnhO?=
 =?utf-8?B?VHdISzNacVVpNWxYZTc3NVZWREp6ZjVnSGdZcmNDeUE5UGdhOVRJQ1d4OTgy?=
 =?utf-8?B?aXBhOFVvYjZUc2lMa3lYQVE3UEJPTENjVDlqU2tGVWtUL0cxQTFTaTVtZVZx?=
 =?utf-8?B?SlM4V2lrUVl1QTI3dXVXYktCYmN0RUNDNWp0QjhiWHFvNmVCOHNsenpDb3ZI?=
 =?utf-8?B?bjJMdGRyL3N0cXZPN1ZhWXZvTjJockluUy9jOU1IbEh5TW5OL0JiTkVCK2Ji?=
 =?utf-8?B?VkVMZ01oMDlRTkdtdFlGT3FLUzhoTnB2R2o3ZEZUZmNWVllUd3FUa2FBMnBr?=
 =?utf-8?B?VlZ5TVpaa2F0R1VpYjUxYzMzZEVETTArTWI0Qi9QZkJ0TWZITlZZZXAwbitl?=
 =?utf-8?B?eEFySjJhUkIzekZZdHEzMjZmRXFieHM2OWprSk8xYkhRN05NOUJSOCtVWnlx?=
 =?utf-8?B?dXA5OEpOYmhYOHMzUzNCQU54elVuckkrMjB2U0pEeEptYnRTMVlOR09DbzVG?=
 =?utf-8?B?SHh0enNhS1NiZ1VRdkZZVnB5a0lyeGU4N2I4MVdaTkw5ZitwVjlnVFc5S1Y2?=
 =?utf-8?B?NmV2cCtLaFB6dkEyNTJjYTdxMERoYm44YWNIRDJzUG9NU25pTytibk53WHBR?=
 =?utf-8?B?ajJ2MDlCalJSckVmUWtGYUFYVG0ybkpSbVh3a1JuUHgzOWdjRW9pR0VBMW5q?=
 =?utf-8?B?TU9YNE1HemlIYlNHeDFkS2QyNDNwMWJMUnVSb0YzME9tV0hlR3dGZFFLZFFa?=
 =?utf-8?B?cHYrWlVnZTFsbStUaFJ0S2VaY2MxcGx5SzhBMExYRDJnZkxCNjh6N1B6Ti9t?=
 =?utf-8?B?cnVFV0VaMU4rRmphd1o5RytRVDhCQXdBMExEYjFhTkowYmRhOVV2OXJWMEpR?=
 =?utf-8?B?SURMbTdQUE1pL0l2Tys5Q2t1bE5QcnFuKzVvZDBWdEZQMkhjdUl2MW5EbnU4?=
 =?utf-8?B?dVlaeDg5NTc5OEFaTGUySEVxeHhORnV2aGpqaVA1YUh3M1JKdDJnMFZCUGpV?=
 =?utf-8?B?Nm1PSjVBSVZ4WGw3SXIyNUI5YW9LVGRpR3k4YmVXYkw2Y3ZOcy9FRXRZQmVx?=
 =?utf-8?B?U2NNRllrRWFVV3hUNE9uUUVCcFVLcGxsaE9XRnZnM1k4bHVWdmdNK0Q5Nk5R?=
 =?utf-8?B?ekpWb3YveGlSR3lBNHBEUHg5M21rVjlWZExzWUdKNTR1MlZNTHJRdEFRcGF6?=
 =?utf-8?B?bmRlaU9ZR1Z2ajVuN2JwcGhNTDdrZVF4SUhxWEtpT0dJR04ra05zakhzZjhE?=
 =?utf-8?B?ckpNcmt6VkNOVWU4aWtpd3J2OWNITTFBbEN0VnZnZmwyWWkvN3BCL1o1SSs2?=
 =?utf-8?B?L28yNFZRRERMa2Jab0c3eXRxMTFjZVRVbEIxemNoUVUwTm5uYS8vb3FFSkhF?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53643efb-553e-4d33-f77b-08de116874d5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 12:42:26.8832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESsnPmsUhWfgI4Drnd2NW1MLMKl7hssma8MLUgtwt4JBs9xK8i/0iMFfamYx2LEnl0ZKDDiFIs++6Po8UuZ6lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4907
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

Quoting Patchwork (2025-10-21 11:58:06-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/xe: Add kunit checks for dma_mask_size, va_bits and vm_max_lev=
el (rev2)
>URL   : https://patchwork.freedesktop.org/series/156076/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-3953-e62416a96d242b227b300fac5950144ee13b0d2e=
_FULL -> xe-pw-156076v2_FULL
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **WARNING**
>
>  Minor unknown changes coming with xe-pw-156076v2_FULL need to be verifie=
d
>  manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-156076v2_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1560=
76v2_FULL:
>
>### IGT changes ###
>
>#### Warnings ####
>
>  * igt@xe_eudebug_sriov@deny-eudebug:
>    - shard-adlp:         [SKIP][1] ([Intel XE#4519]) -> [SKIP][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3953-e62416a96d242b22=
7b300fac5950144ee13b0d2e/shard-adlp-8/igt@xe_eudebug_sriov@deny-eudebug.htm=
l
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156076v2/shard-adl=
p-9/igt@xe_eudebug_sriov@deny-eudebug.html

Unrelated to this series, which touches only kunit testing for xe.

--
Gustavo Sousa
