Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C9ECCD18E
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 19:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63FF10E238;
	Tue, 14 Oct 2025 19:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vvi48yrw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3134710E236
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 19:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760470647; x=1792006647;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L6Vz1RPYWC8/vlfVVZrtu327vYcou0QenIlMbx0mH3g=;
 b=Vvi48yrw1+vCq5sudiHREfetNGTLoSsaOJSuAW6+ytIfhofpCfuqd6uv
 o5esiUQWOY+pP8BSwF5vU0dLttBYLZAefLvdTNwrsiF5/uLzulloBYnMm
 pqDpui8zkcfdJgrJBJZ6maXls9NrxbMkZF14Fs4GOhhXoVU4jiidODZgX
 R7fpcBVbjq9htHC9q0dnQdLcyz+IjIDQhq0nwQ0v2qp1dUPhm2mLOKZ01
 fB/Ae1+UxwrJ4scq36mIDKiEMODLmmldfcuS5olyK3CVjOIaa+gslrqvy
 YmTXutR3WmXtR174nWXj4iZ1c1U2+RvIcSizqJeuvN0IaqLvfYD6jLUpG g==;
X-CSE-ConnectionGUID: 7WCl8AvLQrShZ/r3P5LN/Q==
X-CSE-MsgGUID: +Crik4k2Rb2Ps5nGoQaUqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="74087419"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="74087419"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:37:25 -0700
X-CSE-ConnectionGUID: o4DGUvLKRoCkTIkMlJwmoA==
X-CSE-MsgGUID: Ea554KnfT1eVVjoXKtNpOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="181646496"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:37:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 12:37:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 12:37:25 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 12:37:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCoXcgYW3HLOKKHtMvEnnMLodVgRvjpv6lmL5zVF+6D3fFSbUiClPiO7zGTzjAO/b6hKNSrnifWKqhXcLe+2ADyEjk/kdraB6BBV7QT9ZGAQ/ma0Ad8LmJGHi+moD4DTTyIV6do0yp1a4wo4NGfozuxkMzEdvef75wjTuxuqWeUyq0by5Pu2MNZOBdx+WlYwdod6fJbqNqxB4EqRzqwsQk1ZNCG8KhJu+7P130e2JCkmzmxbmvMGJICPLv5EAc/olKJdTd9XbMU0a86SXXFO/kjlOk5HrSsHEEQR2HyVyO1iqAUr5nEElyEgtrZzvLy+1Wz36hhn9pnHPCBZ8NqNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vf8uVnTanC+1DJFeLEB7Y1sujMJm/U+rxGThWzp2wrY=;
 b=d7osGHXlEIC5wsYGTpNXRpqVBFoAad3y7CcJLXZ4ME/BGbykJw9VgSFguXVHfsbwo6pNYaGeQB8d9ffWQhcMEhXEVG8FVK6pXvfZ4wJIoDRYCorFg0+iGwEHVXCGFVgbgAJqtQitiopON8bViHJvswUXJQL9Tsz+UiQqVulmY0cJ64eIdvF4SxWGePAhXf8LBDA/xWckVJ6i5tNUy0Aulg0pmtq10mumbZM4HsrldWVHPvWPKW+znazas4nwCQymyG5zdQyGky96nBp1WPkSvTgJNcUmfN94gSyD7AEP5HzbENocB2DWHNTlAwn3BhKhtn1kcHHh38K1I/55jC2tkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DS0PR11MB6495.namprd11.prod.outlook.com (2603:10b6:8:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 19:37:21 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 19:37:21 +0000
Message-ID: <348b564e-ab3f-42a9-b9f1-e74c3ced4ee1@intel.com>
Date: Wed, 15 Oct 2025 01:07:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Eliminate RPe caching for SLPC parameter
 handling
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20251013064214.926115-2-sk.anirban@intel.com>
 <87822e9d-3055-4d72-9253-9dc464aeaa2f@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <87822e9d-3055-4d72-9253-9dc464aeaa2f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::6) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DS0PR11MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 81fe290a-c219-4083-7db2-08de0b591767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEZBTlJqSG55TFZWdUJjYWhkM1RRS1ZrNkV4VnFaOVlDeEVsL1F5UDNzQnVB?=
 =?utf-8?B?a1RKbFFiTHk0MXJPNXhLZG5qcGppelFWd1BCUzJocDFqUTNWRzRicEpNRXNW?=
 =?utf-8?B?c010OXV5L3djV2pXZndydHZmVEx2c0ZpMUEzdE9HUmd6S3hPS3haUmpyd2lK?=
 =?utf-8?B?cFZwWFBLWDJJRk1na0FMZGg3SGtEVkZ4ZCs1NmwxckJmZkZpa0V0ei9aQkEv?=
 =?utf-8?B?d3RLYVlyQm5MYzNjU1hrZzVGSnNPTGxkd09PTFJpZlpmcVgyaCs4V0V3dzVF?=
 =?utf-8?B?WEtiSHc4YnNsUjdUNHRzcDdMbm95bWtndkc1Q1FOQzRRVEU0RmVKMmgwNnB5?=
 =?utf-8?B?bS9mK1NBVGVaY083c2xRb3RDSU1qYWsrYUJ4QXBabjFtUTRndFVMaWRQbzI3?=
 =?utf-8?B?b0ZxcEdDdXJDVmFpb0RBTGpnNUh3YVBPelMwb2tjVmF0UHFZVkJVQmFRYkZC?=
 =?utf-8?B?Y3FubHhtYVd3eG95cXlQeWtMWGZPQzJmM1FtaUZyYnk3cEQrVXltWkt3eTBO?=
 =?utf-8?B?RG5oYXpGVXZaelRRclpNVHJ4Z2xVSENMdEJEWWZtSEJYRDgrWVo5dTd5bUJT?=
 =?utf-8?B?bTVqMzdxOTNrSjRtcjZ0aUVRdTdoMkM0T0Y2UVowMmx3eVZyekkra1k1SUVI?=
 =?utf-8?B?cUFnRXVNSlNQL2ZKTkRWMVRZY1ZmZm52U1h6aHlBM0lLdmprcE5lQ2tsNWFz?=
 =?utf-8?B?NVN4aDRRRWJNdTZlaW5INmJiYWx1dDdOajlkM2k0dkppL2FUaGtlZnhXRkZ2?=
 =?utf-8?B?VU1BZHpuTVNlclFhb0x3eTQ0aC9SbUVzOGMrNzdvN2RYTi9ybG1SMDNmekJT?=
 =?utf-8?B?RlhsQ0hnMFpUN3hPZytVWFljNkR6NThKL2JveVRoTy9Kc0o5a3h3WlRIejVN?=
 =?utf-8?B?QnpNZmpzcloxZmtjd1FrVWlKZ3hPNUhMeXFqVDNCMEg4UUdhQjVwRTN4amdZ?=
 =?utf-8?B?alJhNXpZVjR1Sk02MmVBTExSaTM2ZUIvenIxdEw5Y1pmSFhmSncyMHk3czVv?=
 =?utf-8?B?VW5lcVpkaWQ5N3czdFdySXhsaU9YdVdRM3g5SzNrNExsemFrVnlrdjlwaENs?=
 =?utf-8?B?Sm5KT1kzeldzR3JVcnlPOVRUc3NubXE0Q05hcDJ3Vzd0Rnk3U1hvNW1HMWxs?=
 =?utf-8?B?VE1DazBzTjZmSXlNeFFDb3ZqS2todWowZVlKRGJVbVdYVE5CWnRhVHVHdWZT?=
 =?utf-8?B?aEpENlh6endYTTZibkI5Q1pTRG5XWjcxeVNYMm5uV09HbmkweXhlWnJPK3po?=
 =?utf-8?B?dFFNN0svcXU4U3czcmxFMXdmaStQUmc2UDJqVGwwUER0K3FKVjF5R28raE9s?=
 =?utf-8?B?NjZtSjFuQXhnMFd6YjNtREllNm05UGgzUTNmR1dHMlJPQUpVL21KMnhIMm1Z?=
 =?utf-8?B?NFFGWUpLMGFzL045MDBSR21OTm1WdHRacCtSbGRLOVJxVThKREtHMER1REFR?=
 =?utf-8?B?UUZGZ0cyeUZ6K1pIbDhidmhWZUlaSHh2K1VibTYxRUFXeG51K0h1cmZaZit5?=
 =?utf-8?B?SUR2ZHkrQlZ3N0lwdGs0cTQvSUNmY05aY3V2aUJkSGhoaXkrSXZydkhleHZr?=
 =?utf-8?B?cExuSENPSEZvczBubWpQYWxkYnFyR2tGY3IwTEdwdG1OZmJBelBLVjlzbWFZ?=
 =?utf-8?B?aVVoaWhHSmw0WmhPZW9GaDR4NmFiSFdGbTV0UytaUFRHdkVSeUNCS3Y5enht?=
 =?utf-8?B?T250aVFRZ01CUGl6Q0M4cEpYaHNDckR0RmFhbkJvU0pqMWl3ZlkySTFWRzBO?=
 =?utf-8?B?aSswMDhJdUpQY1pBTERhOCtVN3E4T3RPMVdrMUZ2Qmd3aGZGcllkblpQenpY?=
 =?utf-8?B?VmVMbHhCVldSU2d0bnIvVENHbGFXSDJmUG13UExZWWd3R0tiL0p5dEg5Ym9z?=
 =?utf-8?B?blAzYitIVjNRODFLWkZiTWJ6Rzd1M2VXdjNCaXgvQmMzN0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGNlcTA3enRrY3NzUGRrTFg3RTI2SnQzbFN0dFUxbjZscHB1Q0xwcHozcktk?=
 =?utf-8?B?REc3Q3MrUWxOVk05NDVGYlpvMzdJWDc0aDZuVUtzd0p3ZTBNQm4yREljeUls?=
 =?utf-8?B?TFAvajkwMi9rVmJjOXF5MG1GK29XeXpIc0NEek5BaHhzQUZiWHRBVVVNU1Fy?=
 =?utf-8?B?bDdmb1NzL1ZONVozQ29EamNqS0RNM3JtT1pMdThLTWRUU1NkeWdqdi9aVHpm?=
 =?utf-8?B?dzkwMWg4TWJOR1B2RWkrV0t3dW5xcCs4TVloUWhXTVJnS0YveWx1YTlrMVZM?=
 =?utf-8?B?c0tQZEpmOXlXellxa0hCODJRMmd6OW1NTzNudkI3TWNYbis1RkZIaDhwV09M?=
 =?utf-8?B?QitZWlBhT056L3l3NzVxZEdnTW81YW5uWm1VY21RS3JWNjEwUWNXbTlaY21a?=
 =?utf-8?B?U08rdUF5UGh1eGQ3Uy9FSlJnWnFreE9aRkVOM0pyeVZnYmFZSTVPUHdLTU95?=
 =?utf-8?B?K0pvaWtmdFNJdTBNalovRUJiSW9yNmRWZDR6YmhkTDhGN2lxMVZvZ3VBRHQz?=
 =?utf-8?B?Z1JOUWFKRzBUZnk2THpyV1pEaHl1Vzc0YTVhZXFNQWx1UzhMVjVucC9kTEJD?=
 =?utf-8?B?akxEUnFzMUkvT2ErVll5UmR0ZXZ6YW1sWHBaMEpIRWZjRlgrQlVqN0tVSEFi?=
 =?utf-8?B?MkVzQW5FOGk1UGNNR3VaMVhVWEZhTDZ1eGh2eGtvRlJ1UG53bUk2WHBHejhS?=
 =?utf-8?B?MXdUeldvRVBuYTdCVjc4MllEY3RnWG5Md2drb2o3cHJONW92RWw3ZmtWcWpM?=
 =?utf-8?B?QUtmR3YvRUF2L0szQ0Myc3ZqaldPM3FVSWRqVnYzSmR2Z2tVa3l3bUpScEJ2?=
 =?utf-8?B?N2FFNmF1UXRmT2FrMW96UW83RGdTdXV6b2tCdVJvaHF3Q3k0M0ZZampaT0JX?=
 =?utf-8?B?SzFBR1RiYVp3MksvSU83L09mNjJlMUsvcWV1emN6eDdUS1MycGdSZW4zUllS?=
 =?utf-8?B?L3hQaTJQT3ljRzRlcDZTUmNjaWNvV05mdzJIZVB1Z1Y4NjlMVnJKNHYvc2li?=
 =?utf-8?B?U011TVJibFE2L1IweGFsbWpZVDJxQjRxVWZOVVBzUE1wakFaazgzWHR2TGZC?=
 =?utf-8?B?enRiTDhXeG1UcysvSmw2L09hMDU1N0UrbUZzN2VwRmRlVER1VUIzeitoM0Vn?=
 =?utf-8?B?V3lwNnVTT2NrUVJoTGZ0Yk4va0h5bkNvRTM2WjI1VFRCQ09IVWFqd0d5UWZO?=
 =?utf-8?B?VFVQSXNkVGV6aU8zS2JjamFrekI5b3VWYXFLbGZxOCsvRktOMDhKbHZIU3Vm?=
 =?utf-8?B?b0JTTVZ5aXJMMkJJSThVcVNtZE9SS0g2dEFCYmp5aTJXUnJiS2JhbnZidjJC?=
 =?utf-8?B?UzUzQzB1dkY1RlNjc0ZqdkMzVnUzM3dLZWUycUtCeWJRL0l0K21yUWk5bVVy?=
 =?utf-8?B?bkk4VEZWdjVMbGN1b2dFd0NJZkoyZ3krSE1LbE4zMW5pTUpDVE01YVJKMEM5?=
 =?utf-8?B?dHJ3WW5hMHVRL01aK2pDWlJiNWdXWFh0ckpCSDN1WmxiNnYrRXNUTTZJcEhH?=
 =?utf-8?B?UFpOU0RSdjltUjBtM1RkU0FQZC9YMnh2Z1g4bW9CRGxNVTNyaXFGR1F6MFlQ?=
 =?utf-8?B?bjE1Y2tnc2xPWXdxVTUwZUVKSzVqcVArY204VnBCcTkvaGN4d3FnL2lOUy96?=
 =?utf-8?B?MGwzdDE2T013b2hvQ3ZMb2c4VW96VzVmQ0RBcUVhUU4yYUplUWQrY3ZyUHBW?=
 =?utf-8?B?Q2F4ZUN0b0dYMmhWOERQeVVSRWRPVFZoYmw1N2tnUEZsdmVhdVJTY09IQXZS?=
 =?utf-8?B?eWNwSEFYMDZ1NUdjdHk0NjA0NyttZkJ3VW13Q2MzUDVEZnd4L0N3WmlJeVpD?=
 =?utf-8?B?NE1YL2cvQkRKTE5OdjRtMmU2MVdNaGZldDNERFA0UEhCWVRjamN5Q25tWStw?=
 =?utf-8?B?b1FSQUZYc3dXWFZtZ2hkNUcwRm5NMHo3NXRHTkgvbXIxNVMvWlBUM2ZqeUZQ?=
 =?utf-8?B?SGF1b3d1VlE3Zmx2R0pLL1lmV2ZocitYMFJhWFdVTzM1bVUvaVhLSDlpUTZ5?=
 =?utf-8?B?S2dvNExRSmNpSzRtZkwzdi9IaFM5c2F5VmFSQUlPQ3dyNkhWVTFXQ3dTL291?=
 =?utf-8?B?NjF0ZThIdlpUZnFCTFBYSlk1MnZXL0VsWUxjNXc5bUVnOE9ZK3pWdmRITEIr?=
 =?utf-8?Q?cg78EiGDY7XG5eoM0RwzJDROv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81fe290a-c219-4083-7db2-08de0b591767
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 19:37:20.9613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3AhTv0tsEnFUNJBovqX2sMLcU4+KYp97ftwsdaiIC4C4YK8PcOqIV7b0+PVvuEbt2sAfxMB9Tbcc5m0d2j/Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6495
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

Hi,

On 14-10-2025 11:59, Nilawar, Badal wrote:
>
> On 13-10-2025 12:12, Sk Anirban wrote:
>> RPe is runtime-determined by PCODE and caching it caused stale values,
>> leading to incorrect GuC SLPC parameter settings.
>> Drop the cached rpe_freq field and query fresh values from hardware
>> on each use to ensure GuC SLPC parameters reflect current RPe.
>>
>> v2: Remove cached RPe frequency field (Rodrigo)
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 36 +++++++++++++++-------------
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 --
>>   2 files changed, 20 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 3c0feb50a1e2..2d1d5121555e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, 
>> u32 freq)
>>        * Our goal is to have the admin choices respected.
>>        */
>>       pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> -                freq < pc->rpe_freq);
>> +                freq < xe_guc_pc_get_rpe_freq(pc));
>>         return pc_action_set_param(pc,
>>                      SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> @@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc 
>> *pc)
>>       pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>>   }
>>   -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>> +static u32 mtl_get_rpe_value(struct xe_guc_pc *pc)
>>   {
>>       struct xe_gt *gt = pc_to_gt(pc);
>>       u32 reg;
>> @@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc 
>> *pc)
>>       else
>>           reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>>   -    pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>> +    return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>>   }
>>     static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>> @@ -408,7 +408,7 @@ static void tgl_update_rpa_value(struct xe_guc_pc 
>> *pc)
>>       }
>>   }
>>   -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>> +static u32 tgl_get_rpe_value(struct xe_guc_pc *pc)
>>   {
>>       struct xe_gt *gt = pc_to_gt(pc);
>>       struct xe_device *xe = gt_to_xe(gt);
>> @@ -421,10 +421,10 @@ static void tgl_update_rpe_value(struct 
>> xe_guc_pc *pc)
>>        */
>>       if (xe->info.platform == XE_PVC) {
>>           reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>> -        pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * 
>> GT_FREQUENCY_MULTIPLIER;
>> +        return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>>       } else {
>>           reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>> -        pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * 
>> GT_FREQUENCY_MULTIPLIER;
>> +        return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>>       }
>>   }
>>   @@ -433,20 +433,17 @@ static void pc_update_rp_values(struct 
>> xe_guc_pc *pc)
>>       struct xe_gt *gt = pc_to_gt(pc);
>>       struct xe_device *xe = gt_to_xe(gt);
>>   -    if (GRAPHICS_VERx100(xe) >= 1270) {
>> +    if (GRAPHICS_VERx100(xe) >= 1270)
>>           mtl_update_rpa_value(pc);
>> -        mtl_update_rpe_value(pc);
>> -    } else {
>> +    else
>>           tgl_update_rpa_value(pc);
>> -        tgl_update_rpe_value(pc);
>> -    }
>>         /*
>>        * RPe is decided at runtime by PCODE. In the rare case where 
>> that's
>>        * smaller than the fused min, we will trust the PCODE and use 
>> that
>>        * as our minimum one.
>>        */
>> -    pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>> +    pc->rpn_freq = min(pc->rpn_freq, xe_guc_pc_get_rpe_freq(pc));
>>   }
>>     /**
>> @@ -560,9 +557,16 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>>    */
>>   u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>>   {
>> -    pc_update_rp_values(pc);
>> +    struct xe_gt *gt = pc_to_gt(pc);
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    u32 rpe_freq;
>> +
>> +    if (GRAPHICS_VERx100(xe) >= 1270)
>> +        rpe_freq = mtl_get_rpe_value(pc);
>> +    else
>> +        rpe_freq = tgl_get_rpe_value(pc);
>>   -    return pc->rpe_freq;
>> +    return rpe_freq;
>>   }
>>     /**
>> @@ -1021,7 +1025,7 @@ static int pc_set_mert_freq_cap(struct 
>> xe_guc_pc *pc)
>>       /*
>>        * Ensure min and max are bound by MERT_FREQ_CAP until driver 
>> loads.
>>        */
>> -    ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
>> +    ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), 
>> pc_max_freq_cap(pc)));
>>       if (!ret)
>>           ret = pc_set_max_freq(pc, min(pc->rp0_freq, 
>> pc_max_freq_cap(pc)));
>>   @@ -1339,7 +1343,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>>       XE_WARN_ON(xe_guc_pc_stop(pc));
>>         /* Bind requested freq to mert_freq_cap before unload */
>> -    pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
>> +    pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), 
>> xe_guc_pc_get_rpe_freq(pc)));
>>         xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h 
>> b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 5e4ea53fbee6..f27c05d81706 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>>       u32 rp0_freq;
>>       /** @rpa_freq: HW RPa frequency - The Achievable one */
>>       u32 rpa_freq;
>
> It might be worth considering avoiding the caching of rpe_freq as well.
>
> Thanks,
> Badal
I believe we're using pc -> rpa solely for storing and exposing purposes.
We're not using that parameter to set any other frequency, so this 
should be fine

Thanks,
Anirban
>
>> -    /** @rpe_freq: HW RPe frequency - The Efficient one */
>> -    u32 rpe_freq;
>>       /** @rpn_freq: HW RPN frequency - The Minimum one */
>>       u32 rpn_freq;
>>       /** @user_requested_min: Stash the minimum requested freq by 
>> user */

