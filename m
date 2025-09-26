Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F88CCAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 14:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0856810EA73;
	Fri, 26 Sep 2025 14:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnP2ZTfO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7056910EA73
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758897324; x=1790433324;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r3T/OWLe99CzblLDrMoFVpZQhYKtw+MN/G7++XC39OE=;
 b=HnP2ZTfOHNNdKVnEjH2BuCkN54KbFxJNR+dkikpbNLleIULCfxV+X2fM
 H3OqfF+OpVl8isIgO5tzcuqIfhJCjwZ/YqcY88RaGyYS2sD3kyzJPW3kN
 q1hYy5j9VkR1UZeDbfGm2bp+83uNaOm2D/otAhzdD5Ee755+yFHuIUDO9
 srCCl10xMoB8aEzomGsRarD788mQjJWWrmNcx1NSEkn2Ui9GNGpTbWU3n
 e9HDtjZOJ0eeV764/xW70sh42hK3z9+Q+lzdxeeXdZXFW2DNsABnee57v
 xGr6GxVOzkmj6DKjbhLoXmW8nYY+wKl2LYJ4SUqQtCDS0PqqAvo3I4KHF w==;
X-CSE-ConnectionGUID: /Z1LGOQlRxSymiMmkfN36g==
X-CSE-MsgGUID: qxllKZ4fR2GZSDZK0I742w==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="83842959"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="83842959"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 07:35:23 -0700
X-CSE-ConnectionGUID: E/CgcVClQFyIzKL9aQEwlQ==
X-CSE-MsgGUID: kk12CnQ5St2V7MfX9qmV0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177677119"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 07:35:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 07:35:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 07:35:22 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 07:35:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XrAUaq734vpa8MhYJ0QdvKCAErSR6F/DrYMOnf86KY8XIiX6Cpe+eh+7cJF8yLGF2g7J4Alg6KPwUqFZrlotsMyw0rwapAv7RDov2UyWrDiNhZIcFPzu04mlHM2AgjmVt81sjh7poL6YLoSZ/5PNCf2pLhVYDTTKK3E21j5wLeX4xrkbTPvFJNyFpGcmOvCTXlUP8Sniy6W2qkhNz3YLiw+6b85NJL+A5d6cJyJnq0cTFnY4O+TdQnTBq5By9/u4sGwmUABxqOk0woKX41giXOMJSbymCjbRv0C/xbPUYj1X+hRQ1BntWqsafFb41Tg0w4HAtEbT+VSa2KLpaeZoew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WiOztksZVNibyQSzua8JeQ5vsyWlErdhx80UcNTGlc=;
 b=b6dJVWMXYl5LbmDs9UQN5U1pFDNPzT20WyWu2CjYouncYA0OjLaemSskGj7KvGc1auqT6mXb1MgkdA3oIiamHCpa8LGs8/Utd2Mr+EpEfFbb/AUTEBq5FKCql05rzvNhitokcQg5WTkh/waoprge6T7zyxOPbrz9fxdKodYN0d5rL8DkQ6swH/iApLrZNYHwymPEQWqJXqzaUjXvXqgS8kTT+wZ66Rfp7JZcsxmWN7w+JKXRZ/ICEZkKvP4z2UAbDkEl0ZZ629EMYvsW8ZUhpIOwFsxIImx3/V01Gl2lUqFHHSO1st+F65L5yseSKqbscmArOJtKBnI2AXtzT8HCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB7615.namprd11.prod.outlook.com (2603:10b6:510:26e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 14:35:13 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 14:35:13 +0000
Message-ID: <2068d3be-3b26-4dd3-9abf-cbc751ab833e@intel.com>
Date: Fri, 26 Sep 2025 16:35:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/xe/pf: Create separate debugfs tree for SR-IOV
 files
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250925220425.196860-1-michal.wajdeczko@intel.com>
 <20250925220425.196860-3-michal.wajdeczko@intel.com>
 <bxngimao35jeod3to6mqgpl23xssfasxottyvrnhljb4o6h7x4@3n5rgq3uh4uj>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <bxngimao35jeod3to6mqgpl23xssfasxottyvrnhljb4o6h7x4@3n5rgq3uh4uj>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 80585cd8-3510-479e-2ee0-08ddfd09e748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEF6aldVN0NHNXB2eE1QYlFjWHFySXYzNVJqQmwwQ0FqZFJMVURuTEhXYUpz?=
 =?utf-8?B?ZFJvK2RJdVczcXQySWh4SGpmZGc3SGxZNDgrQXR5SzFjVnJzTjV5blpEbU0r?=
 =?utf-8?B?dzNHa3dFRk85bU5VYmF2dGwyWE93WFhJYmxtSkNXVEJnYmpaNGNCRFFNbkls?=
 =?utf-8?B?ZTMybXlRR01QTXFDT0ErZXhpODFwd1IrdUJ0blozbFAxbE9nem5YelduLzlC?=
 =?utf-8?B?ZThzRlNPMnI0ZFF0Wiswb1QxZVZsRDVWWnlxTlBwcHMrNTRVay9FRWJJTnJ2?=
 =?utf-8?B?cXBXSEZwZWM1UjJYb213UlhWVllPSFJQRTRaa2lvY1hsSUVERFA5S0pGQk13?=
 =?utf-8?B?K3AzWlIzZmhuTDdYN0tOMm8rcXgydFZjRWZSclgzYUpaTG52Q0RyL1VMQUZh?=
 =?utf-8?B?enE1a3pNMHlNNHBHMnFndllxbnlqN2EwOHYwbXRmSURoQS9HSUZ5U1F5STVp?=
 =?utf-8?B?UU9LV2xRK1g3ZVBKbzhjd1NTbUdkNHpKOEJCNlBabUk0VExXQ0RBNWFmZTlx?=
 =?utf-8?B?djV4UVhuT1p5dTFNR0t3OXB2VUZCNnR4VU92Zjd1RjIyMi96SE9xNENvV2Vy?=
 =?utf-8?B?M1NGTGFiVk9ZdVV3b05IdFVmSkpDWnorQkJSSnR1S0JXUjdtVGlRdTY4SUhM?=
 =?utf-8?B?V3ozUC8xQWlBRjQyOTJIZVJCQmdEQld1RWNQOHJzVHdkam5HQXFrYW9yQXJW?=
 =?utf-8?B?N2lHYjRUekZnNlpvd0pDRHE2bWY0d3BWZVVKMWJxeHpxUFJFL2tjWEtTV2RR?=
 =?utf-8?B?WFFyZGNIcGFTNXlGM2wyakRsTEQwWEZWMGlPUnp2VWR6VlFXcG1xckZacFlE?=
 =?utf-8?B?SHlNWXBUejlqZG5JRE81TWovdStBOFltbm85VU1ITXUzcEowZ1VyaVMyclhQ?=
 =?utf-8?B?Vno4WUVKSFpmWldvaEhvVnh1cEJ3SE45eTBYS1RCUjNlMHBEQzNVanArNkFT?=
 =?utf-8?B?cnFjZnpDWG5aaGRFU0VpQ2lnOXdXWWpxZzBoU1lvVk51RHFMRmtkWVBDelRU?=
 =?utf-8?B?Z1Bnb3I2WjFGRUxNYmpVWXdVS0xhWE8rbWFKK2VFQ2hZME9jZkdxbXhkUFBQ?=
 =?utf-8?B?Y0FaMXNoQlpPNEFidTBTR29UUEM0Ym41Mmw0cnFaR00vK1BNTm1iREMrK3Vq?=
 =?utf-8?B?bzJBRUdHaXRodE1OVXlMUHBoWHFkajNOUms3eFZpNzNzZitCSDJRUVZtMHFm?=
 =?utf-8?B?bWZmSVB2ZXR0MHpzSjc2eVRBK2U0REJUMVNVM1RNbVpPbFZxbzd2eTRsRTJj?=
 =?utf-8?B?dkYwMllxZm9Tc1BLTFhYLzgwOFNjck1WdGlQNVN1OGpZNFlNVkQyS2JmS2NG?=
 =?utf-8?B?Zk1yT251ZmQra3JBMGgwbkRWN0VMNlJCRm03VVltcld2Z3d0amlDcThLc0k5?=
 =?utf-8?B?K20ydnM1UDhPM1F3S1F1dis1RERwblphcE02QVJwYlZtcnR0YXBXYmZ5UWFL?=
 =?utf-8?B?WDllK2x4dVIzTnZVMkFqbU9DVW5UakZic3dWcTZKdTdqdkRYWHFRQjA4Qk9L?=
 =?utf-8?B?TUwzYVlvNkdYSlp4T2hmYzFpMFBLeFZpZ3BPbkJ6RUgyRWNqVk1TUFdXd3JU?=
 =?utf-8?B?L21mWk5ESVdHZzBMempvOXAyTkd1emExU3NoL2Q0VGtSVlhwQVVLenFJSFpG?=
 =?utf-8?B?c3l0eGptTUxTSVAzUXV4TDRSaktCbnBQbEo5UEs0bVZrRlAxNlhpUEpsbGQw?=
 =?utf-8?B?YUdpWVJzWmpWTHlNS0JoeTVTd3RjQ251bkNORXE0QWwzbERpaFJndzR0a3pv?=
 =?utf-8?B?Szloa3h4RHVlbi9vTG1WdGZZQXdFS0UwZHhLT1h1WFZpTDdjZXFqMWtHcXp0?=
 =?utf-8?B?TGhaOWVhdXhjWFI4eTZzSncrODFDZjVTaGUwQUlkeFZMUEVIL1NETWFGM1k5?=
 =?utf-8?B?R3ZCVnVlM3VQS25saElvVyt3S3dnOGpWNkVDZVlZOTVRSWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFdyNWZLM1ZWemNoT1huN2Voek5pbTRYcE1zT1VOR0tRcUpSOWlTeUtpQWll?=
 =?utf-8?B?cElQM0lpdXlLZGJYMXlJaGlyZ0NWaWlsOXJtbjFtTlQ2cWN2cmZsUkx4MG1Z?=
 =?utf-8?B?QjhrMVp2dWV6OWJqaTYyUm9OdkJTNVVNY0dCRVZ5VzVhell3K1MyL0F3OHox?=
 =?utf-8?B?VWdERHhka2JmVjBET1NRK0VzaHoyVk56cGJDa3ZuMEZ2d1R6cHdDTHdROFZn?=
 =?utf-8?B?R09sNmRCQ0ZwRU1TU1k0Q2tMMFFSNDBISkpmU0lScCtXcmh5Mnk3YUZNTUR0?=
 =?utf-8?B?aExOWU1Kc2hwV1YyVUZLZTQzTlJJODM4N2FYOXphc2tkU0didjl4ejlId0cr?=
 =?utf-8?B?MzZBQmJ6UkFmTWNqZUwxeEM3VXdmUGllNStLSUZNMWdwR2xza2UwV2hCOVBq?=
 =?utf-8?B?L0ZtK0R1Y2hDN2xZb3pDblIzcGMyeFJPS1JwUkFOODZ0MVhiYXlNUjJZYVpp?=
 =?utf-8?B?YVl1czE1cDI2ZUs5bkNXdFBCbkZUbDhpSmQwdnQ3WEh2Q0psQ3VId1UxcFpS?=
 =?utf-8?B?eEp4Wk5PTG5QaXZqS2F2YU1yVzc1bThNV2pUQTg3NWNSUWczKzd5WkxyTXRp?=
 =?utf-8?B?bjRlQlpCbVdkV2pZd0VYRDQ1LzVZQ0ptcDVDNDdXaHZMWW1UTGtpUzZWczZj?=
 =?utf-8?B?d3lrd2trL1RySTBFWWFRSFJqL2MxNEl5RlNIMnVINTVEc2ZRR0xKM2xHYk9u?=
 =?utf-8?B?bXp1RlU4QUhRMHhLRnRCQWpibHQ5cXdOWEN3Q2dhT0dQdkIxcmxLVDczWTl3?=
 =?utf-8?B?MHBNa3c1MnpuTTJUOGhDaTc0YkZwTHV2YndHaS9MaXNDaFRHaVFDOUZKd3d1?=
 =?utf-8?B?R2g1cUFIaWFCWEpCRW9HdDA1K291ZWd0Y0w3WXBqdmc4cEVSdUZxK3MzMFVv?=
 =?utf-8?B?dDZQdVpSSVRrejNjcDhSUGYzRHJlNmx1Z0o3NHA0VEFrakdVbWlFZlNxV1Vx?=
 =?utf-8?B?YU5PQVpYc0lySmJCZ3dpMEltVGNFSXpXWTNHZWdPTmRWZ0hJVWs3QWh0Qlla?=
 =?utf-8?B?cUx3bVErdVlLeE45WGg2dElzYTd5bjlWRHhxT2hOdkZHWFAzdHR2Sm42YjNw?=
 =?utf-8?B?ZjgzOEtFUUtMMVpiK0ViSHhUditOMnJZRFE2WUN6M1VBRlRVZFg1cGttby9Z?=
 =?utf-8?B?QUE1dUl0QmlFTGVHeWtsdzU4OGRBKzVLNlZSQ0hrd1U5SHZMRXpOZndBMlV6?=
 =?utf-8?B?QkRWQmpoaGRvbHZCRVM1N1FnbzhKS1VxckQ3NGthaW9qSnRiaklpL2Z0Y0FC?=
 =?utf-8?B?a2JTSmJiOVVsK1FIU2tabkhVSjhqT1g1ekExTzZ0TllYdllmYlAvZjA5SGdQ?=
 =?utf-8?B?QzJsZkJndkJTUlVzdDhYT1AyRk9JUU96d2pid2hoR2NyLzNkRW00bmNuYXBO?=
 =?utf-8?B?Zy8vdXpqUHBNQ0lNbGZ2ci9FYWw5eEN4RTBldXBBUk9YVkNPbWwxZlhpMWxL?=
 =?utf-8?B?U1FoWGVpcnRxTVpvVlJWTko5ZnhTYk1aZWZxbE1PODBTNVQ5RExOL2FMUVVU?=
 =?utf-8?B?MDZ2ZGl1Z3VtSnlUZkxOM2hRLzcxMTNUM3NZc3JuTWQ4bXlVV3VQdUwyczhr?=
 =?utf-8?B?UkpwM29NbGJQK2VUVkdtL1E3RXpQQkgvenNNVUVvTURiOXRnYWxEaXRpckJ3?=
 =?utf-8?B?VzZpb1dlU3BVbitGNlNWV2ZmV3Y3a05FcURxY1VTRDluWHZnUnduKzBSd0RC?=
 =?utf-8?B?TW1Fd0E4UVBQNUlZaTI5VkJSdFlVRkZteDM1Umg3cTd0cFNPeENYWGE3a0tY?=
 =?utf-8?B?aDJsUzdQZGhRbzhicUhJdVdRU25sSktzTmwzUWV0UGZTdTNIMzhiN0tPUjNh?=
 =?utf-8?B?TERTa1hBa21OU0FHMG0vbVhnZWxJSVdBWUE5WmxiN3RDNGZlNE1wekZ3SDFn?=
 =?utf-8?B?V20xY2c5ZWE0TUp5T1Y4QTN2UkJvKzVxZzhWbk1NR3IzdTBnZ05DMUl4MHdN?=
 =?utf-8?B?N3ZaOGhWQWFFUTJSZ2c3RStiZ1diVERNN3JsOUV3dGxVRHlpZ3ZoSEp6YlZU?=
 =?utf-8?B?ZC9uSkhIeTIzU3cvWi9nVmh2SVJkWFk0c3JacDhQVnJRTEVKM1BiellWZFlM?=
 =?utf-8?B?NFg0cFZnYjQ1V0daY09jS1Q4Z01GcnFGZHo2SDk3NW5vNy9BOStmcVlkcmRw?=
 =?utf-8?B?YzFpbUduSGtpSlhVeXpSVVB5MnhkNTBWMU1jY3VEWis5dG1xNGM5ZXJMYzdW?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80585cd8-3510-479e-2ee0-08ddfd09e748
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 14:35:13.6049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMncGQmoZ8EnSoQb7G7rUl8Blp3OZmODlyJ1h0Xkc766/0i9+xmZbyDcdvrUk6dX8PLgjmSln2GYpkLXJWutHTwqNm8g8Qmf42E1b8qqMdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7615
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



On 9/26/2025 4:26 PM, Lucas De Marchi wrote:
> On Fri, Sep 26, 2025 at 12:04:19AM +0200, Michal Wajdeczko wrote:
>> Currently we expose debugfs files related to SR-IOV functions
>> together with other native files, but that approach will not
>> scale well as we plan to add more attributes and also expose
>> some of them on the per-tile basis.
>>
>> Start building separate tree for SR-IOV specific debugfs files
>> where we can replicate similar files per every SR-IOV function:
>>
>>   /sys/kernel/debug/dri/BDF/
>>   ├── sriov
>>   │   ├── pf
>>   │   │   ├── tile0
>>   │   │   │   ├── gt0
>>   │   │   │   ├── gt1
>>   │   │   │   :
>>   │   │   ├── tile1
>>   │   │   :
>>   │   ├── vf1
>>   │   │   ├── tile0
>>   │   │   │   ├── gt0
>>   │   │   │   ├── gt1
>>   │   │   │   :
>>   │   │   :
>>   │   ├── vf2
>>   │   ├── ...
>>
>> We will populate this new tree in upcoming patches.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 73 +++++++++++++++++++++---
>> drivers/gpu/drm/xe/xe_sriov_types.h      |  3 +
>> 2 files changed, 67 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>> index 2a1316048439..b2088b6dc23f 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>> @@ -9,7 +9,9 @@
>> #include "xe_device_types.h"
>> #include "xe_sriov_pf.h"
>> #include "xe_sriov_pf_debugfs.h"
>> +#include "xe_sriov_pf_helpers.h"
>> #include "xe_sriov_pf_service.h"
>> +#include "xe_sriov_printk.h"
>>
>> static int simple_show(struct seq_file *m, void *data)
>> {
>> @@ -28,27 +30,80 @@ static const struct drm_info_list debugfs_list[] = {
>>     { .name = "versions", .show = simple_show, .data = xe_sriov_pf_service_print_versions },
>> };
>>
>> +static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
>> +{
>> +    struct drm_minor *minor = xe->drm.primary;
>> +
>> +    drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), pfdent, minor);
>> +}
>> +
>> +static void pf_debugfs_available(struct xe_device *xe, struct dentry *dent)
>> +{
>> +    if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
>> +        char *path = kzalloc(PATH_MAX, GFP_KERNEL);
>> +
>> +        if (path) {
>> +            xe_sriov_info(xe, "SR-IOV details available at /sys/kernel/debug%s\n",
> 
> that's a possible (and common) mount point, but it doesn't need to be
> there. I think it's ok to have it in comments in the source, but as a
> info in the log it may be too much.

I was also not sure about whether print this mount point, until I found:

https://elixir.bootlin.com/linux/v6.17-rc7/source/mm/kmemleak.c#L1872

and since it is under our DEBUG flag, decided to keep it since as for now,
to configure SR-IOV, debugfs is more than required

but I can drop it 

> 
> 
>> +                      dentry_path_raw(dent, path, PATH_MAX));
>> +            kfree(path);
>> +        }
>> +    }
>> +}
>> +
