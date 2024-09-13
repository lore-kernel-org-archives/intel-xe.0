Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1295EEEE27A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 04:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A295510E06D;
	Fri, 13 Sep 2024 04:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DB4grnz/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC3C10E06D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 04:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726200374; x=1757736374;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y3fKhOp91MVECGulZr2QqJ84811N2GfFsAdomKSXr6U=;
 b=DB4grnz/CRVsDAYFOjRz4PGPPAOS90uZgujolQ0BVvjm6TDm9RdUuHbe
 Qc98iMRBkRYtboeTf03zqGY5GYG/kh9Dc01Lq/FDiw/PVtvryxKGVJXL0
 s7b1ep/BWsWu0ctb/51353mDffRrNh2+uiD+iYms6ppb1BJHz3DlLtZfp
 l3+VVezQe+D4mDuOd+/+Ss3Q8abKcVst3+drT48UjtTDyAgJcchZ+Xg6y
 D/L4U98yfIdWXSNma7D+puutCXlOnuL/nMGIO4BdSYbBWsRE19VUV2uy2
 jYk3wGorhNd3KVGugnMhVCOgQ5ayWf3vmOE0Vrj4Kybspjk8vKjyPi9yM g==;
X-CSE-ConnectionGUID: P12e5soWTKujCafG8FaaqA==
X-CSE-MsgGUID: Oz1byjXnSKGt19eYcs6Tzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28003648"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="28003648"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 21:05:41 -0700
X-CSE-ConnectionGUID: 3zMgMJiOQfKc2O4pUpgZ/g==
X-CSE-MsgGUID: KFjyLY1oRE+gFvf71AJTqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="67550945"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 21:05:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 21:05:40 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 21:05:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 21:05:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 21:05:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOQI1XGyaohFekx2JpOrCc3XGZekZ/E8WHuo6iiO7P28J9KLL2ErnvK+wSeFSm7GXqUUtKVUdXImZ3CIfOQED3+qxE2n0xS+q7iYI/mXnb3KofG6SqqxzGkiJ7xqgvSTQPN4WaIFiboC+/tXVjlt8p9gGmyCSKUYuXOpUUZ9zJMuna4DGM6SJHhGhnPHaou9WK8gizswsN+xDK/JonnoHaXg4lNWnt6om+X7eUQfm5Jva/eEk5QjPYOX0vmitZu06jLdFX8mVknr4XzIwDbqsZtn/5ei6gtoT2DPLmSX0wjeWzEoXrcnHq/MbN5Vz7Xo7nlzHNWeilk7NLxig04HBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRiLXcF04yV0x9SzPNYHr+47Wb5ECiCBBrZIHY/dQFE=;
 b=KbU79h6MNAVHTkOHc4O1ovojFnTC+8k4+3deA30/ss9GFcLSQ8g4X9nc9smfNfcRZkTddx0/s4ZdAiE8ss0NBfDQe7zn7J0R0EiqedmYcPMBHru5QE7bt3newHeTkNtj071Y1xDEm7piK4j2rm/j+9Bl6U8/SYG+DBfwZ0mZpcPoEEXHbn7uYpFJMg/LjRoLLC2iOMEiwou18T5NnaVKn7vjTu76VYcQh7V1dyZV7fvhzn8idYMtID+hl8zynMRRzRYJiXSIGT1lfvtFYZsKaYG1VtxKk3NR6E/q3JtJoQRDCa8vG5mFf0Dd9V41cqVXMoxugBWX18a9MwuGdCHbdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 04:05:35 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.016; Fri, 13 Sep 2024
 04:05:35 +0000
Message-ID: <42d7694e-0c14-4d5b-9394-ca035a1830d8@intel.com>
Date: Fri, 13 Sep 2024 09:35:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/23] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-3-himal.prasad.ghimiray@intel.com>
 <7e1c52ad-bf20-43c7-bd41-efb28713a6e2@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <7e1c52ad-bf20-43c7-bd41-efb28713a6e2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_
X-MS-Office365-Filtering-Correlation-Id: 686f44ac-d069-48aa-65df-08dcd3a951a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkxOU2RjaW9sNHFCc2FsbGxqTzBWeVpSa0Z5U0RXcUdpZkpDaGFXTEpSa2Rn?=
 =?utf-8?B?elB5S0IxODgybUFVUzZBZHpaZEV0RzFVYnRnSXBKakRXSVFHNDh1NmVGeEpD?=
 =?utf-8?B?QURzTzhGbk9TT1lMbVV3OVNVbHRNSWFpOFBzOGVBQmtZMkFqamRtRWFja0NP?=
 =?utf-8?B?NzNJMDVHZmdHQkF2ZERSODNHNytJbjJrWklrSDhvcUZMaDViWFhCcm94cjND?=
 =?utf-8?B?ZU9tTHFqWFNkcFJ2b01IM2VJMk5RSzhqNTFtajNDRWNhamVhOTlwMzBVUkF4?=
 =?utf-8?B?TnVJS1kycGV6WkM3UDhUOUN3eG5jV2hXWXlHRHgxaXh4NGFlRCthdUZpQkRV?=
 =?utf-8?B?ZVo4WnZqSkQvUzRWLzlEbUcxa1VmZzI4YjRQTVQxV1dUTHY2NUJ4dHVFbG9x?=
 =?utf-8?B?b3VRRjJqL0FRQUNwMVBYV3lUMHVSZTJkT2ZYUWZnSGNEOHI5MHhWSW5WWVZh?=
 =?utf-8?B?WUVJODd0dGFoeUhoZnZ1dHp0V2pvYkdQRTlidFdFYzJ5c2NmalNNdjJyeXBS?=
 =?utf-8?B?WkZOMmF1dVdoeGt3U1VLRlBEalg0N202aHFucWY4WDdWQnJkOVJpeVBFNnE5?=
 =?utf-8?B?YmhzdXN2WFBySVhRQnBhalJWT2N2ZUNxbjBpNy9vR0xPREZmL3haay9nKy9j?=
 =?utf-8?B?OXNoVlJBUWdOVEx3L0lMRkJwTml2SWdrWkJwZzNkdlJ5WU81WjhNZDFuaWV0?=
 =?utf-8?B?RHFoMnBQdWh2bmx0d2lZb2xTb3J5WTlXVEFQWWFhMy9lRVJaTkRCYTRidUxB?=
 =?utf-8?B?SVNsUHpic3dBRzc1bmhzQVRKb3c2cWtCVjI0RXo2bE9NdVFaN01RR2U5V3U1?=
 =?utf-8?B?djJBMzR3cDJFTHF5c21ibG5EWUFNSXVQVE1POEl3WFY5c3ZmZXpsWlZsMFZi?=
 =?utf-8?B?RTJndnZZRk16N1JhU3dqUCtmTTMwTElqR1Zpck82YkRVQXVKcTRydkxJNTVk?=
 =?utf-8?B?Smd0eDNsNzZnL2pHNk54Qk04UjBJNHB1elFVWGtRMGh3dlVhcS9Wc2V5Wk14?=
 =?utf-8?B?ZnhqR2cyb1NEclhSd3dzcm43dFlJUXFOUXp4ekI0STYwWGNad3UrbzFobjhj?=
 =?utf-8?B?a3ltWnc3b2RjRENPQ0U3VFhzbDlDS1lkWVZzMGpKNWFkdjFaMFZFMkRaUjhC?=
 =?utf-8?B?djB1eHd4SXQ3TU56b0ErUWd3djZsT1c2bjZMenpQT08rZnUyeU4zdDVUZDl6?=
 =?utf-8?B?c1RVMmVPTWVrZi8vQnFPdlVUME4ydGprc0t3T2ZPR25lVlVFNVBUZHBDVXZt?=
 =?utf-8?B?My9zQWpnSlk3TE9MZDJiTktLbkZ1UzF3REFGOGJMSmxmUlZIRE1RV2pKNjU3?=
 =?utf-8?B?WmNub1pCNFJLMTlEZEZaRlVtTnArVDR6UERlckJuZlBsT0l5b3d4NGZFUDEz?=
 =?utf-8?B?VDg1eWQzMTRDd29OT29HQXR4eTM1bWEzcHpIcUdlb3MrOXY2OGhNdnZjc1I2?=
 =?utf-8?B?TDJBdGJhUVUzNGRURXRwUVVFTXlqVmQ2WUgySVJDaXc3T1Y3eXZIYnhkeDRW?=
 =?utf-8?B?cFZ5aXNTSTdKcHpsTHRUV0R1WGUweFBEbUEvQStMdGF5Q3dtS1NJYmhuV1FH?=
 =?utf-8?B?eXQ5ajUwTlVPU3kvYWZ6dENmb01kTC9mMEFJSTJLUG5CU3VXMXpSRU9ZenI0?=
 =?utf-8?B?R2thWnRHWVRlY3JnN3FZRm1HVEJCblFScWZ5WjFiT0FicHFoUU5PNHpFcWZx?=
 =?utf-8?B?MzZxempDd2FFNlhEb1NCbU1zOXQvRi9XMlU5a3FvYUJvemtBTjlaU2I4L0FE?=
 =?utf-8?B?ZjJBdjhPVlJ4SWMvZUtTT2tNQXowL0hCTUFmRTZmaTROSjNNSHhRTDJRbis0?=
 =?utf-8?B?WHdxWUc2bW9GV09JT2FHQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFgwbGQ4aExIbERIV3NTQWJxWkM1ZndlM2VCbUtaWm94b0g2aGxneFNZd256?=
 =?utf-8?B?eFI1d0hKelhvQ0JPc1RUYmpPSXc1MktqOGprVWh0WTVKWDYzZHBWZ3JJSlBo?=
 =?utf-8?B?Z0EyYXlTclRjbm5OVTIya2NUYW9pRGM5MVB4SXdqZUpZcGJBek9kZStCVmlL?=
 =?utf-8?B?ZHJDQnpoSmdxUUp3NHA1ZVd2eE9OUml3OC9xQ05jaEM3ZEFHWTVac0NhNUlz?=
 =?utf-8?B?dXRDMTdaNjIzbHhURURIZnNydGhRS1YvWXJxZ1o2YkUrTE13OThCeklid1hr?=
 =?utf-8?B?VS9sUnVPZkhpUmVybC9SbWw5aU1tdVdHdHNtdWFkODVsU3BoemZIK0tOWThF?=
 =?utf-8?B?T0ZTRnpZSjdZNW50WVlKY3hDZVArcExFUjhYcnR6UG5SYk4va3czT3BOQ0xK?=
 =?utf-8?B?cjd5K2I0bVA3aDFLWUcrYXNWbTN1RnhRbUtaUncxQTJqN1J1U09XYUZnK2FN?=
 =?utf-8?B?aTJsTDRFUE1iVmFHTGgydmZ5TUExelowd1lDZkVlbGpyU0tUQzZMWjErT3dY?=
 =?utf-8?B?Vkc2QzI3SWwrdUlqZUJBSTFTRk1VYXpLd0lRc0hTbHN5Vmw5dW9VV3d2UmZF?=
 =?utf-8?B?YUhuQUxVYitoNHVrM3RIMnZkRFo5NHVCYkpZTkx3VC95dE45RysxMTlzb0lw?=
 =?utf-8?B?UlB5enpCejBwcW1vMFNjYkFZTitCd2VKdm9SZnZwRWxld1Y3azJlclJma3FL?=
 =?utf-8?B?alFZZXFDdm1iWEJZWHg3M0NJaW5nYjh1U281RGUzQWVlNmkxcDFmSGtJSFZZ?=
 =?utf-8?B?TjRjWVY4ZHNvb2xnaDV2TG1zM3hSQUNsMFNEZktCZUduRHBOb0J5YUkvNjh4?=
 =?utf-8?B?NkNTN1FZUCs5M0JUV2liNE9iOTJPbmgvMHlrekdnVGxJZXNOT2l1ODRuL0p6?=
 =?utf-8?B?aGc5QXJNaW5RSElONnBhcHg5Y1JGcFJybDJPN2VnUmd2eW9rQmUyN2Qya3RL?=
 =?utf-8?B?NDNvdHhnV1JCSm9xU2ZORnNRWE8vemtJdVk3cDRVdjRZNUIrNFZtOHlmMFVO?=
 =?utf-8?B?cmxQczQxV0ZRM0c4UGM3TFhmRzNqdnl2QTVrSGRaTDM3ZHJNVGpFbjhwMlpa?=
 =?utf-8?B?Ynh6RzlaU2RHSy9IL2hqbHhKbWtvYWhQL1BUWm1iTENVcE9kL20wbUNYU1Vy?=
 =?utf-8?B?VUdwNE1ObXlqNmllQXkzc2hWZ2JUTGo5RjFWb1M1SnlxM3NUSjV1aENneWJV?=
 =?utf-8?B?YWhaZUxpa1pPY2FtMHY5OEUySWtZUTU5OFIzeUFuZ2VXMGxIcC9hUUNDRGds?=
 =?utf-8?B?VWxxZjBEZVk1SHdFUFFTbWpqTGo5dklvUEs1dUQ3NTN3VU5LZ2Q4M0cxY3J1?=
 =?utf-8?B?V0Y0Rll5SFNBWEkyNW9razd0OWtUT0FNalpMOGJjelA5TFhyQmUvcnc2MUhw?=
 =?utf-8?B?Z1FLa3hXeEEwb3Nad2NZenk4bnFHc0Q0ZWNBaEgrczc0MHBsWkFzM2RxUlYr?=
 =?utf-8?B?OUZ5YXMzeC8xa1hsSEU5NUUzWXNvN1lmdHQwWTl2TERwVEo5WlZOdlVEeUE0?=
 =?utf-8?B?bDE5dnI0ZnNBbVN3SHZZVk1BRUNoN0tqdjB1bVFaYlBxWjVrRlV1SmViL0RJ?=
 =?utf-8?B?d1k2alAwN1lPeVNoWnlKd29nTUtKVFdyckFZelVrQ3NXMkpiUTNBbE5Lc2lP?=
 =?utf-8?B?d0FNUlpQOC83Ukh3Y0laVm5NTHZoUnlONUkwQnp5OFFjZHp6bXNvVkM1M2xh?=
 =?utf-8?B?VUxaOHpMSzZiWk9WaEFQSnEwZ1lXTzk4QklQbTF5RlBabkd6dDNMa2k2SllH?=
 =?utf-8?B?YWllS2ZkYXg0cDZSaUhxczNJU1JEQzRwL0ozNysvaVZUQ0FLZEk4c3k5UGNF?=
 =?utf-8?B?N3VFK1B4d3F3akVER3RadmNlaFBDRVF5T0tEMHp4SEhKelVyaFQrNnVQNXN0?=
 =?utf-8?B?cktsbkRoTHpiNmEvTENabzBzR0w1UFFsRlA0MkhCcDlwaXpVUGxheEsySnJy?=
 =?utf-8?B?OGp3b05BMWJiallzOWNVanhvM2IxVThwMVh0ZSsyZTYwbnNvYWZYTjVzaE5w?=
 =?utf-8?B?QzBZK2NaK0Vra0xTNnlrSnRYcnUxRlcrbENzT3Q4U0R5KzNKdzIvRHNRMm0r?=
 =?utf-8?B?a1dpMlRCcmJFQ2VUbW9iOGNsZVlxbHhnL3ZMUmJpbk15SERiVWVVWFlDRnho?=
 =?utf-8?B?dUk1TFY0S2Y0M0NseEJZN0lQTGw2amM1Y3htQUJkamlFVnMweWxPQTJjMktL?=
 =?utf-8?Q?BrYU6t75f6NMfyDNd90+Ek8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 686f44ac-d069-48aa-65df-08dcd3a951a6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 04:05:35.5257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KIqzHaQ+ZDep6KvjaKl57KyBF1isBDTsCxawCu5c4m6YkzbQubqD80Zwv2S9h2fB+Q4DDMcqtjiDiZ0ThidG2SaTwXTC6TAG2hdY4hKfw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7056
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



On 13-09-2024 03:04, Michal Wajdeczko wrote:
> 
> 
> On 12.09.2024 21:15, Himal Prasad Ghimiray wrote:
>> Instead of calling xe_force_wake_put on all domains that were input to
>> xe_force_wake_get, call _put only on the domains whose reference counts
>> were successfully incremented by the _get call. Since the return value
>> of _get can be a mask that does not match any specific value in the enum
>> xe_force_wake_domains, change the input parameter of _put to int.
>>
>> Add kernel-doc for the xe_force_wake_put()
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c | 24 ++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_force_wake.h |  2 +-
>>   2 files changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index fa42d652d23f..e91bbcbddb8b 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -198,8 +198,21 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>>   	return ret;
>>   }
>>   
>> +/**
>> + * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
>> + * @fw: Pointer to the force wake structure
>> + * @domains_mask: forcewake domain mask to put reference
>> + *
>> + * This function reduces the reference counts for specified domain mask. If
>> + * refcount for any of the specified domain reaches 0, it puts the domain to sleep
>> + * and waits for acknowledgment for domain to sleep within specified timeout.
>> + * Ensure this function is always called with return of xe_force_wake_get() as
>> + * @domains_mask.
>> + *
>> + * Returns 0 in case of success or non-zero in case of timeout of ack
> 
> what's the expectation for the caller when this function returns an
> error? if just WARN() then maybe this can be done inside this function
> and we can make it void ?

Completely agreed here. Currently the failure is returned as error 
leading to abort/further escalation in few cases. IMO, xe_force_wake_put 
failure shouldn't be leading to abort/furtherescalation therefore have 
raised a patch for the same and is part of this series:

[PATCH v2 23/23] drm/xe: Change return type to void for xe_force_wake_put


> 
>> + */
>>   int xe_force_wake_put(struct xe_force_wake *fw,
>> -		      enum xe_force_wake_domains domains)
>> +		      int domains_mask)
>>   {
>>   	struct xe_gt *gt = fw->gt;
>>   	struct xe_force_wake_domain *domain;
>> @@ -207,8 +220,15 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>   	unsigned long flags;
>>   	int ret = 0;
>>   
>> +	/*
>> +	 * Avoid unnecessary lock and unlock when the function is called
>> +	 * in error path of individual domains.
>> +	 */
>> +	if (!domains_mask)
>> +		return 0;
>> +
>>   	spin_lock_irqsave(&fw->lock, flags);
>> -	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>> +	for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
>>   		if (!--domain->ref) {
>>   			sleep |= BIT(domain->id);
>>   			domain_sleep(gt, domain);
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index a2577672f4e3..e2bb6b03e495 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -18,7 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>>   int xe_force_wake_get(struct xe_force_wake *fw,
>>   		      enum xe_force_wake_domains domains);
>>   int xe_force_wake_put(struct xe_force_wake *fw,
>> -		      enum xe_force_wake_domains domains);
>> +		      int domains_mask);
>>   
>>   static inline int
>>   xe_force_wake_ref(struct xe_force_wake *fw,
