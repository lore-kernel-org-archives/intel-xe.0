Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E93C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 08:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F0A10E454;
	Wed,  7 Aug 2024 08:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZl9jkW8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AD010E454
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 08:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723019164; x=1754555164;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=TUaGoEB3JsEQ5KOE50ughcQzcVV/8tZZwgszARVakRw=;
 b=kZl9jkW8CYFLy5bFe2FM2qUXslBVplv5LkqcY90weO2gjIPQSgVAI2AK
 rgbCurGCTbH0xtARDxQjO+QE5S3BZ0sqgXMG2IR2LWrhjmrrG5pAcqMbs
 ta3JbvI/XtGpQeGrHGgnyu1hN7VNx66AvznJeTR4+1xRiDz9xOmH+WXli
 T8423/L5g/VoqUS9LJv3I9Bis6tICnM8EH+HEuUvn9T7id5cryIAX6Nmu
 6HMhZuHyNGMBCY5GE9to0eVy6bUcTGEqNkIx1ZOBYkML7xz9HzBmlqKU7
 ixya42I50EUtMdaGAc7+SGyVOJF7UjrLQtJEpIn+eyFSuIlf4iJXHpHqj g==;
X-CSE-ConnectionGUID: eU6ZA2WETsewzXfefpn5GQ==
X-CSE-MsgGUID: 8CGiHZ+uRVm4+SrupkYS7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21196641"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208,217";a="21196641"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 01:26:04 -0700
X-CSE-ConnectionGUID: Spiyno3kQkqklzc7rkzqbA==
X-CSE-MsgGUID: wbbSWKK/QyWow8qxcoc7zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208,217";a="61667125"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 01:26:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 01:26:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 01:26:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 01:26:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byWf6m5JgxRxv11MTcJWMBayJI35NTafox3UMoSSf1VQtZinTe3vE2adDVIyfD8WOeU8DAcjpGlmhzPWF6Gijqwa6+RRdpuc1gqRzK3oTobj1jyvM2yKAIDYTKnYnqcQNKUMNjVqYtCO9PqegCAvTNgtb71qPljrh6TBmynxY1y9iD4e3wGfE30+sYTFsugvxPCUGefhQJhYQkdeRcyUwnT3BVzmIWEBiSxhsba4CQOTHoN/zHphK7wkaXrEiOcIPLIvcwpQ/Q6o0xteSr3jxsVuWZQk1a2+wVSrQN8nlED/1JxFMkQrNNt5Pj58IH1YeKjPIZbk3WZliQdPAbDTNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfBZPU9GMzx8HbaSJMcAf2K+n2ACmZbCcY9PbSJ6E8o=;
 b=wc+jRtux8oLNEnn2tWY/3aetzB21YoHryxIyvFJKN16M3WpHfGUlp4RbUYPoUFTfHyLTnZYoTSAGrN5tSmUUxzEPSnvqItOtlWEMf57d7CskR3dBZlYsK7eOX52x7EGaTg8fAm1+7vEf8OCl982A0uzdJMtsus0tTIUm/x0qbmQkwI4320SbD6mM/Fxdj3DYTVY6F3Ms8P8mUh1xtgLrJ1RC4NZS54Lj5mKBfrwyoPnT6+CXcgCN96Dwr8bqi5/0Gt9qXUVuoqyc0p3G00exCEPw/gndbpokCDFJNeIuh2mA+93h4xbjQpkWbK5ctIHjtSZcU7cDfzK8P9XxLetalQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 IA0PR11MB8334.namprd11.prod.outlook.com (2603:10b6:208:483::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 08:25:59 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 08:25:59 +0000
Content-Type: multipart/alternative;
 boundary="------------BMVXdq5faHJiq0i6Y6d06v0n"
Message-ID: <45f905b1-13c0-4209-a158-b9d1c788af6e@intel.com>
Date: Wed, 7 Aug 2024 10:25:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/gt: Add APIs for printing stats over debugfs
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20240806194510.13044-1-nirmoy.das@intel.com>
 <ZrKJ9wvhLTq/Eu7x@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZrKJ9wvhLTq/Eu7x@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: ZR0P278CA0117.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::14) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|IA0PR11MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: be88834d-ae29-4179-e7e8-08dcb6ba90b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkhKeExHd3Q2RWVYR1dTNWJXTmlTMm11OXRjdHgxOVRhZXhRQmdWZXRTdWRo?=
 =?utf-8?B?c041SzJCZlFTSVVrSzZ3NU5nMXZmZ1licytzQWRWeXhPdXZpTG53cVZHajhK?=
 =?utf-8?B?SnVibmlOZnhhblBuRnlHQ0NnZGJDNm1uakFlbkFhNkdhU0JQVjhTak1WV3JP?=
 =?utf-8?B?d1h6UGhSbmVMTHc0S2tyZHJESHhxSms5Mk5tMGU2aTZqU2tDN1NVbjgrL0N3?=
 =?utf-8?B?VlhEMjJUWlFnS1pKc3JTdDNkTXNCd2JJTW52SjlTQ3Nla1R6LytFVDZ6UXF5?=
 =?utf-8?B?U1lQaWZOSWNOS2o1cjBqWVpXUUdaTkRuNGxaUFN1ajdOQVNhMXJuZUVncGhE?=
 =?utf-8?B?T0t1bU9BMzNFZDRzMER6WCtkSGYyZ2lUU2JERjRIOElJUXk3dnBQZGN6RC8w?=
 =?utf-8?B?VFVMZnBGMTFXTTQwWVJzSlIrTGhuWEEwM0JYOFVyTnBrdklSY2NzZEZkRkNv?=
 =?utf-8?B?WEt1TG9mbWJEQjJ1VjZCWFpEM0lnTEFwNlo3M3hZS0QwWlhGcnFtMnBtRlpa?=
 =?utf-8?B?WGU2Mzh5TzcxT09xUldFSmJRcFRiWXNTTGV6QTdSUjcybVZ1a1FlRzlKWk5E?=
 =?utf-8?B?L0ZUOStDQUVkM1VIMXZneUtzRjFBaXJ5NUdYR1A1VHRHVGJ6emFseW5vaWlC?=
 =?utf-8?B?dm5DdFhXM0lVcEQyc1NyVzM0TjdHaWt2cFpzQmkveU84VllsbStRWWVhbFl2?=
 =?utf-8?B?aHZUNEJnaVRMSjY2dEs5djBWU3hMbzJVbU9iTmxhbnE0Ujl1TkNPYVNlSkVo?=
 =?utf-8?B?RU9PbU5VaUh5RlA3RmlESGVVcGxCdWlJNFFPUFRxVFFVMS9laCsyNlJ2Rmkz?=
 =?utf-8?B?alpFMDg1NlQ1QVBSVVBrVGM3b3h4UVpLK2V6eXc3UCs4clBHa2E0bmVXUG45?=
 =?utf-8?B?a3Y4U1dHNGJ0aDRLQmVOM29CMnJYT1h1Wi82U2w5ZXprcW0zTHdpU0NrMVd1?=
 =?utf-8?B?RmJMS2UxaE11ZWFaQUhIeCt4aW9zTmV5RjBRV0E0eFVZcnFsNllzOHdIZTVk?=
 =?utf-8?B?YUZtNjBrWnpHVU5nTjNwMHVOUjZtQyt2VEQyTkw5cHFDMi9BZ1IvRDkzSEhC?=
 =?utf-8?B?OW9Fcy9uTHpwTkxpZDJmU2llQTZ2dlc0ZUMwVHR1OG1jVDBkb3d0dGJ1cEJi?=
 =?utf-8?B?RGhmNDlsNFN4aG5rNmdpMkYyMkRjdEs1c3BFdk1oNVpqSThOVG5Sck9hVWc5?=
 =?utf-8?B?a1NJQ3BKQnhQbGZSSlozK0dlejhJenB4VTRKL3dqVFhPbUNndnRndFRaally?=
 =?utf-8?B?d3F4WEVsMWt4M0lqODdMaFhEZnRnNTFEbUh3OWNxR2IwUklMR0puZmJHaEZP?=
 =?utf-8?B?YjFFQkpBSmhDQ0tQdExpMWRnOUloeDdaeGJSdVdjc3BBQ015RU40aXFqTTZn?=
 =?utf-8?B?blhBbHUrMmhTaFBGdEh4dVluSVlJamVyTlNwSmlSbGZVR2gzVHpVeVQyMllr?=
 =?utf-8?B?WWdncXMyNUFBcTJoKzRDK2I5Tjg0TVFRamVsNmkvOGNBZUdya2FBWlRNblhj?=
 =?utf-8?B?SkM4c1V4cEZkSW1vMHlOS3JsbGtEUmJxT2U3MzdVM3ZXRjZ3Um1WYU56Qzlu?=
 =?utf-8?B?TVV2dnNEMGhneGVPTEUxTlhKMnEyM2hYYVB3eUhKakJ4UzV0Qkw5bGZNZDFz?=
 =?utf-8?B?TlpvSUpzV0VDdUNLSC9RSE1BWTZyV3FwV0QrdGpva2E5YTI4RE5wbG50L2FX?=
 =?utf-8?B?djczYlh0amYxMGdQT3I3UXE4ckt5YzNKZnVPZUxHZFVLWUtiOGRTa3VOcTV4?=
 =?utf-8?B?bmluMURYa3VxRHp6WG9SUGJYQ3hHa0ZSWDBuaW8wTWFnTGRMckFjelFsbm9o?=
 =?utf-8?B?V3kvbU5KS3llNENreU5PZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nnd1Zk80aDNFdjMwOUMrWHlRL0EvcFVZVGVuWHdpaUV0WFQvMklTYnd5eUV0?=
 =?utf-8?B?dXBvbmltUWhNYTNPcmh6eUhZM0I1WENOK1JJeUVqR05UTlZXWEdHUTBxVTVs?=
 =?utf-8?B?VlFBQStXZUVhRzAzdmI4cjNSdFBHdjlzVFBpUEhxMFdXUHpnQTVHR2NQQVpU?=
 =?utf-8?B?Mk1PYlZzKzhjcnl1QkxSMmtXb0FmL05UVHNyUHcraGlySGhtdXp4SDlqQ3BN?=
 =?utf-8?B?NElsVkZUVXdzS3VOSUhuZGVZTEtXT0NXYUdRUzhEYllYZmkrT0VsbGg3UnVS?=
 =?utf-8?B?OW1EY1pUUDdUWXFuK0FxbU1qaEwwUHJGdkx4M3J2OWJHd1E2Y1lDS0NlWHRD?=
 =?utf-8?B?OU9IS05laWtObDNZdlhVemNNRWdhWnJ3eVhodHp3em5CWjhYVk5DRXBTSFJE?=
 =?utf-8?B?anZJYWhEMFI2VmcvVXpuNlR6OVhrdFpRVnYrYTFBeW1MNGF1RzZKQWlKandL?=
 =?utf-8?B?clFNRlF5NytIaHZzVmF0Z21waHNxRHhLTHpLRTU3RkFtZjNHNG84QzhkQkQ2?=
 =?utf-8?B?Rm9ueTJwb2d4cDhad21OMHgzU1VzU3BEcnFJcTFzcTBuTXRyYmNicUlCRHBY?=
 =?utf-8?B?Q0NnNDVhdjdEODQ4LzF0SFZwdHIvaCtBNWtXTXVNLzZQWTl4cEh0dm9QVGNq?=
 =?utf-8?B?cHdLK3JTVC9tc0VUWHlVdWc3NVI2c1I2WHNuRDNVdW04SVowTXpvSTV2QmRE?=
 =?utf-8?B?YzNCelFLZFBzSGVDQTJnWkdPKzdSczBha2FkeitMMjc4Z0ZTQnhrV2FoRTAv?=
 =?utf-8?B?SWlxZU1iMkt4d0t6QUFpbHBHMkhNcVRzTWJ5Ylpid2pEY2VwaTl5cmNXb0s4?=
 =?utf-8?B?ZXlMdVVFMWRFNkZHMXBmTDN4VWJsZ20xWWFCNlY4dWNzRk91Qy9RRFN4Ty9T?=
 =?utf-8?B?MUEwS20vRUpCMmpGV2UzQ3JIT3Y1VUp4SjgwSW5ZaXprSFhId05USlRpZnVt?=
 =?utf-8?B?Ky9IemNubVBRNEphMXJYVWFrMGNMdktqQTJzczkvRWZwMjN4S3V6ckw0MTZp?=
 =?utf-8?B?aUVJMjBBWUhyZlYzWkl6NTBqUFdtOHNwYXZUR2hnd2VKZGlWRG0xVkxOQUd1?=
 =?utf-8?B?bWRRMUJhQjlSaG9tY2RhYWJZMjVBbEJzblNCRHVHZFEzaU40OWF4eEtxNE1I?=
 =?utf-8?B?MlpGTGpPaHRRditJMU1TYnJiUVJuZTAvZlJxWG5ZNFl6V08yekNyU0IvK2Fp?=
 =?utf-8?B?L3NnWW9vRllsK1dXZ2dOZlRPbWJZWm5xOUt1TTdXT3ppbDNPVDVIZ1pET1R1?=
 =?utf-8?B?ZXh5N0l2Z0RpUlhMM1lCUkNTMTdLaWtDUURid0tZcXYvRlcyb05DVldKQkJq?=
 =?utf-8?B?cG80cnpqN1VtY1RiYWVQRHV4V1dyNWdZTGRZcG04WDd1Nng3SWZUZDMzLzQv?=
 =?utf-8?B?WlNNMk01Z0dySDZzKy91QXZuNTZGVVdISXdKUWhpaHpNVWp6eGFXemdST3BZ?=
 =?utf-8?B?UjJaRThtOWt0Ri9nV1hYS213eGE4RTg5dWlMWi9KUllzVUxxWGs5UVJNc1hY?=
 =?utf-8?B?cm5mZ2lOY0pEdks1NllkSUNHN1kyR0lzcDZTdW1ZVnVXenJBTzZNTjMrNmpP?=
 =?utf-8?B?YllaOWo1RUhndDJKQjlMOGFzbnJINjVGSDhjbSs3ZWU0eU02VjBVbHRjOVZM?=
 =?utf-8?B?TU83QWRkN0s0cE90Z084REk5azdid01kbkV1MlFBMzJnek92bXpDNHBKZ0VO?=
 =?utf-8?B?Y05qVU82Y0dNZWNCaUdDY3Rsbkl0SlI0czNlYVo1WndXdVVnZnpFb05BLzNQ?=
 =?utf-8?B?d052eTJQM1pkbmJ1TVhrUjZIdXh2VWc4UVhoem1BemUzTDNaUUxpODhqU25x?=
 =?utf-8?B?UnJWY0JiQ01SanZIL2c4bDhrMU00ODFUSlBhTnlQcDAwZTJ6Vm13Nk5HOE9z?=
 =?utf-8?B?Nk8yYnoyeFdRVkFoWUlaZkNmYWlvdWFoaGxvRE1MbjdNMGtSQ0IvWnMyWHpy?=
 =?utf-8?B?TlRZUlQrTUk3ZkFaOFRUdDNUdzIyU3NvZXJMcG5WdWhZWXRPVEltK2xQZ1d0?=
 =?utf-8?B?SE1IOFEyT3JxYjY0S045R0tGc0Zqa2wyT0pzeDV6SU51NDZLQlpkTDNhU3VG?=
 =?utf-8?B?YlZOMEM4a290RVZ4cmZZcHJBOE5OcDZtb2RxemZNTmd5Q0ZlWUhrMTQ1SThz?=
 =?utf-8?Q?wBDVGMxjIkceL/HmrXRZenD4v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be88834d-ae29-4179-e7e8-08dcb6ba90b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 08:25:59.0050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7vm5T9ZYIDQtxZ4Hl8kINXjMQMWnvsQIzbaAro6SubJKfiLxhkreaUOLPbpaTHEKa2GtQKW0Ns4+KuQ5OrU2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8334
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

--------------BMVXdq5faHJiq0i6Y6d06v0n
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 8/6/2024 10:39 PM, Matthew Brost wrote:
> On Tue, Aug 06, 2024 at 09:45:03PM +0200, Nirmoy Das wrote:
>> Add skeleton APIs for recording and printing various stats over
>> debugfs. This currently only added counter types stats which is backed
>> by atomic_t and wrapped with CONFIG_DRM_XE_STATS so this can be disabled
>> on production system.
>>
> Yes, kernel doc which you pointed out.
>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Kconfig.debug   | 11 +++++++++++
>>   drivers/gpu/drm/xe/Makefile        |  2 ++
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 ++++
>>   drivers/gpu/drm/xe/xe_gt_stats.c   | 30 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_stats.h   | 31 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_types.h   |  7 +++++++
>>   6 files changed, 85 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>> index bc177368af6c..4db6d707c1af 100644
>> --- a/drivers/gpu/drm/xe/Kconfig.debug
>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
>> @@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
>>   
>>   	 Recomended for driver developers only.
>>   	 If in doubt, say "N".
>> +
>> +config DRM_XE_STATS
>> +	bool "Enable XE statistics"
>> +	default n
>> +	help
>> +	  Choose this option to enable support for collecting and
>> +	  displaying XE statistics as debugfs.
>> +
>> +	  Recommended for driver developers only.
>> +
>> +	  If in doubt, say "N".
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 1ff9602a52f6..b0bbb248f644 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -143,6 +143,8 @@ xe-$(CONFIG_PCI_IOV) += \
>>   	xe_pci_sriov.o \
>>   	xe_sriov_pf.o
>>   
>> +xe-$(CONFIG_DRM_XE_STATS) += xe_gt_stats.o
>> +
>>   # include helpers for tests even when XE is built-in
>>   ifdef CONFIG_DRM_XE_KUNIT_TEST
>>   xe-y += tests/xe_kunit_helpers.o
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index 5e7fd937917a..3765c04919dc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -17,6 +17,7 @@
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_sriov_pf_debugfs.h"
>>   #include "xe_gt_sriov_vf_debugfs.h"
>> +#include "xe_gt_stats.h"
>>   #include "xe_gt_topology.h"
>>   #include "xe_hw_engine.h"
>>   #include "xe_lrc.h"
>> @@ -286,6 +287,9 @@ static const struct drm_info_list debugfs_list[] = {
>>   	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
>>   	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
>>   	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
>> +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
>> +	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
>> +#endif
>>   };
>>   
>>   void xe_gt_debugfs_register(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
>> new file mode 100644
>> index 000000000000..cc69d748e8f6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
>> @@ -0,0 +1,30 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <linux/atomic.h>
>> +
>> +#include "xe_gt.h"
>> +#include "xe_gt_stats.h"
>> +
>> +#ifdef CONFIG_DRM_XE_STATS
>> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats id, int incr)
>> +{
>> +	atomic_add(incr, &gt->stats.counters[id]);
>> +}
>> +
>> +static const char *const stat_description[] = {
>> +};
>> +
>> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	enum xe_gt_counter_stats id;
>> +
>> +	for (id = 0; id < XE_GT_COUNTER_STATS_NUM; ++id)
>> +		drm_printf(p, "%s: %d\n", stat_description[id],
>> +			   atomic_read(&gt->stats.counters[id]));
>> +
>> +	return 0;
>> +}
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
>> new file mode 100644
>> index 000000000000..e83155ab1fdb
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_STATS_H_
>> +#define _XE_GT_STATS_H_
>> +
>> +#include <drm/drm_print.h>
>> +
>> +struct xe_gt;
>> +//struct drm_printer;
>> +
>> +enum xe_gt_counter_stats {
>> +	XE_GT_COUNTER_STATS_NUM,
>> +};
>> +
>> +#ifdef CONFIG_DRM_XE_STATS
>> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
>> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats stat, int incr);
>> +#else
>> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
> static inline int xe_gt_stats_print_info(...
>
> This will fix CI too.


missed build test without CONFIG_DRM_XE_STATS :/

> But overall LGTM and pretty much what I had in mind. We can device level
> stats too with this series being a template.


I will resend with Michal's suggestions and more docs.

Thanks,

Nirmoy

>
> Matt
>   
>> +{
>> +}
>> +
>> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats stat, int incr)
>> +{
>> +}
>> +
>> +#endif /* CONFIG_DRM_XE_STATS */
>> +#endif /* _XE_GT_STATS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 631928258d71..0ded57b56628 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -10,6 +10,7 @@
>>   #include "xe_gt_idle_types.h"
>>   #include "xe_gt_sriov_pf_types.h"
>>   #include "xe_gt_sriov_vf_types.h"
>> +#include "xe_gt_stats.h"
>>   #include "xe_hw_engine_types.h"
>>   #include "xe_hw_fence_types.h"
>>   #include "xe_oa.h"
>> @@ -133,6 +134,12 @@ struct xe_gt {
>>   		u8 has_indirect_ring_state:1;
>>   	} info;
>>   
>> +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
>> +	struct {
>> +		atomic_t counters[XE_GT_COUNTER_STATS_NUM];
>> +	} stats;
>> +#endif
>> +
>>   	/**
>>   	 * @mmio: mmio info for GT.  All GTs within a tile share the same
>>   	 * register space, but have their own copy of GSI registers at a
>> -- 
>> 2.42.0
>>
--------------BMVXdq5faHJiq0i6Y6d06v0n
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/6/2024 10:39 PM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZrKJ9wvhLTq%2FEu7x@DUT025-TGLU.fm.intel.com">
      <pre wrap="" class="moz-quote-pre">On Tue, Aug 06, 2024 at 09:45:03PM +0200, Nirmoy Das wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add skeleton APIs for recording and printing various stats over
debugfs. This currently only added counter types stats which is backed
by atomic_t and wrapped with CONFIG_DRM_XE_STATS so this can be disabled
on production system.

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yes, kernel doc which you pointed out.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/Kconfig.debug   | 11 +++++++++++
 drivers/gpu/drm/xe/Makefile        |  2 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 ++++
 drivers/gpu/drm/xe/xe_gt_stats.c   | 30 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_stats.h   | 31 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h   |  7 +++++++
 6 files changed, 85 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index bc177368af6c..4db6d707c1af 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
 
 	 Recomended for driver developers only.
 	 If in doubt, say &quot;N&quot;.
+
+config DRM_XE_STATS
+	bool &quot;Enable XE statistics&quot;
+	default n
+	help
+	  Choose this option to enable support for collecting and
+	  displaying XE statistics as debugfs.
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say &quot;N&quot;.
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1ff9602a52f6..b0bbb248f644 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -143,6 +143,8 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_pci_sriov.o \
 	xe_sriov_pf.o
 
+xe-$(CONFIG_DRM_XE_STATS) += xe_gt_stats.o
+
 # include helpers for tests even when XE is built-in
 ifdef CONFIG_DRM_XE_KUNIT_TEST
 xe-y += tests/xe_kunit_helpers.o
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 5e7fd937917a..3765c04919dc 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -17,6 +17,7 @@
 #include &quot;xe_gt_mcr.h&quot;
 #include &quot;xe_gt_sriov_pf_debugfs.h&quot;
 #include &quot;xe_gt_sriov_vf_debugfs.h&quot;
+#include &quot;xe_gt_stats.h&quot;
 #include &quot;xe_gt_topology.h&quot;
 #include &quot;xe_hw_engine.h&quot;
 #include &quot;xe_lrc.h&quot;
@@ -286,6 +287,9 @@ static const struct drm_info_list debugfs_list[] = {
 	{&quot;default_lrc_bcs&quot;, .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
 	{&quot;default_lrc_vcs&quot;, .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
 	{&quot;default_lrc_vecs&quot;, .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
+#if IS_ENABLED(CONFIG_DRM_XE_STATS)
+	{&quot;stats&quot;, .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
+#endif
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
new file mode 100644
index 000000000000..cc69d748e8f6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include &lt;linux/atomic.h&gt;
+
+#include &quot;xe_gt.h&quot;
+#include &quot;xe_gt_stats.h&quot;
+
+#ifdef CONFIG_DRM_XE_STATS
+void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats id, int incr)
+{
+	atomic_add(incr, &amp;gt-&gt;stats.counters[id]);
+}
+
+static const char *const stat_description[] = {
+};
+
+int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
+{
+	enum xe_gt_counter_stats id;
+
+	for (id = 0; id &lt; XE_GT_COUNTER_STATS_NUM; ++id)
+		drm_printf(p, &quot;%s: %d\n&quot;, stat_description[id],
+			   atomic_read(&amp;gt-&gt;stats.counters[id]));
+
+	return 0;
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
new file mode 100644
index 000000000000..e83155ab1fdb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_stats.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_STATS_H_
+#define _XE_GT_STATS_H_
+
+#include &lt;drm/drm_print.h&gt;
+
+struct xe_gt;
+//struct drm_printer;
+
+enum xe_gt_counter_stats {
+	XE_GT_COUNTER_STATS_NUM,
+};
+
+#ifdef CONFIG_DRM_XE_STATS
+int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
+void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats stat, int incr);
+#else
+int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
static inline int xe_gt_stats_print_info(...

This will fix CI too.
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>missed build test without <span style="white-space: pre-wrap">CONFIG_DRM_XE_STATS :/</span></p>
    <blockquote type="cite" cite="mid:ZrKJ9wvhLTq%2FEu7x@DUT025-TGLU.fm.intel.com">
      <pre wrap="" class="moz-quote-pre">
But overall LGTM and pretty much what I had in mind. We can device level
stats too with this series being a template.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I will resend with Michal's suggestions and more docs.</p>
    <p>Thanks,<br>
    </p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite" cite="mid:ZrKJ9wvhLTq%2FEu7x@DUT025-TGLU.fm.intel.com">
      <pre wrap="" class="moz-quote-pre">

Matt
 
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+}
+
+void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats stat, int incr)
+{
+}
+
+#endif /* CONFIG_DRM_XE_STATS */
+#endif /* _XE_GT_STATS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 631928258d71..0ded57b56628 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -10,6 +10,7 @@
 #include &quot;xe_gt_idle_types.h&quot;
 #include &quot;xe_gt_sriov_pf_types.h&quot;
 #include &quot;xe_gt_sriov_vf_types.h&quot;
+#include &quot;xe_gt_stats.h&quot;
 #include &quot;xe_hw_engine_types.h&quot;
 #include &quot;xe_hw_fence_types.h&quot;
 #include &quot;xe_oa.h&quot;
@@ -133,6 +134,12 @@ struct xe_gt {
 		u8 has_indirect_ring_state:1;
 	} info;
 
+#if IS_ENABLED(CONFIG_DRM_XE_STATS)
+	struct {
+		atomic_t counters[XE_GT_COUNTER_STATS_NUM];
+	} stats;
+#endif
+
 	/**
 	 * @mmio: mmio info for GT.  All GTs within a tile share the same
 	 * register space, but have their own copy of GSI registers at a
-- 
2.42.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------BMVXdq5faHJiq0i6Y6d06v0n--
