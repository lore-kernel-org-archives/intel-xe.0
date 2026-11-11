Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECD1606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 05:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W7gQor8M
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E3E10E27B;
	Wed, 11 Nov 2026 05:52:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9365710E27B
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 05:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794376327; x=1825912327;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7uPH9QWT75EwU2vPB4NQYtj7djLPFI5IReTHXsB/PnQ=;
 b=W7gQor8MV56jF1Zhyhosh2E5CHNAgdbAsEJT9ZKI5l3TzvtdmTCCeN/5
 NNxj34pfehirqWXsvrCr2piHzsB0N7zVQd13rAqdpOSNNKaCokAxSw1tr
 je+fxgar+dpy7BSYbC3gfM49ZUl4YLgwR/F33KQr6I+joBVTcWZSQLrk/
 RkeeTeDyXyMxucJYKI2lDXYPeqGaAG32zacN+OBG9GbmWmknbenB58uf0
 zNLwHBuTRRZ8t2mZSvgQ3HOSgFew0JiehM1QdOW+DhRD7CPUPXG5rjWZe
 xRrsD9uSiUPaLYPUVk9ZoUw91TXgelnN11safozyKSbP49Nm9VlbpXOUm A==;
X-CSE-ConnectionGUID: ITTDjsXBQwmEW1hA6Qd7dA==
X-CSE-MsgGUID: fG1l2tbdR5CCduQ6SX6VsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3044407"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3044407"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 21:52:07 -0800
X-CSE-ConnectionGUID: hWNTqiAYQPOAAq8ZcEBdxA==
X-CSE-MsgGUID: ZuhnsQLDRWiIsIQhZhTMNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8513627"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 21:52:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 21:52:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 21:52:05 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 21:52:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwqxKCcrIZaVM+sbVxSOIoJUImwqEiwUu6iGM2cV8Up89BrD/kfug07Qw4F4VLvnJy4hQbmcjF18ylVbGfogyuq5ekgATcJ4hLHG6GFF1gg9PZVLMIyrB78b4X4w3DB0da0MhCTt0pOTWx7jCiZocYAMyuxRV7etshN06/E5ogzNRYGlNX6jCZ5Dxm6A45e2JW0BS933XCsQNo3yPGWmr1lqz+7Q14zQTe4jFvkFeBTjTf9wUctTScWU9Z0I1LCKiI3ZYw29cc07iIdYCCfdkhWTGCAayTsv7vFHAke7eEbbo9NnKcWxHH8GwNnV+hH/B0JPKUdd8ltmrNYHUmPWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JP3NjcXXwnCmdQj1RE+FSNuMrpdB9zAGY7V7KlftJ8=;
 b=WqNExndt7CJNqOVyXRp9sTVQ3g9u9nASBXzO2lnDn870yMvGZE6glyIjmevRja02iZyR88WNrmrae/+iLGRSOBu2vzkMX8UPmaHfjapT1tMrgsh60dn0ZmSozZiKkDzuowzLvgDtIzqptQLmj3bGtP/ahh2ookMcECsuyraUECkBjBcvzWL6TQCSbvem9MGmvynBUVKKq6L6Bj7uAbyZcqmDUSSdjslJT0atOgJF9tthdkqN3N4WOPPfZOTgEmnKLqVcOx+zpu5GTX+jVSsvg0Li8t7j+z8glokOP87QlXug02urr1h9IvHD8T0ttBenlIrFojUkEHR6YLrczA/y7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS6PR11MB9917.namprd11.prod.outlook.com (2603:10b6:8:461::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.8; Wed, 11 Nov 2026 05:51:56 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 05:51:56 +0000
Message-ID: <12e23fb2-b255-495c-96f3-10456fd5f158@intel.com>
Date: Wed, 11 Nov 2026 11:21:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] drm/xe/hw_error: Initialize hw_error_work per tile
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <mallesh.koujalagi@intel.com>, <badal.nilawar@intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-12-riana.tauro@intel.com>
 <avMQ0euV7JlPysFr@black.igk.intel.com>
 <f16bdbfd-919f-471f-a954-d5e0a7f36159@intel.com>
 <avP_5gPyp1iSFP0Q@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <avP_5gPyp1iSFP0Q@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0280.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS6PR11MB9917:EE_
X-MS-Office365-Filtering-Correlation-Id: ae499eb5-dfa6-4a0b-ac3c-08df3fb7e45d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006|261021121427099003|261102123227099003|261009223027099003|261022075727099003|10067099003|261022105027099003|261026121527099003|261026140227099003|261021123027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: nB//ZQTgzUnl0Fhnyg1e6GIp2C0fTCubBrYkSbvCO4tAw2djEVp8MMDbnvkKNXTQECqBn62T+y+JjbgNEvMgK0WxBzCtuA/mDSjqYFJSa3ZoxNSzFvsghzKBy/j7l3K6ABziohZE9oZ1jN7dPach/dunirleiFA0ddOcn5yA/66WPr2cIerfiqUUkO2Eh8gd5vT7lyqk1eMLX2dAm2mZrNJtzuKcNncONgQwj7DtAupeRGUADGVImnaa7933IL/Pnayzz1qmp2vfsjZfNDtlGSK0/nZzhB/uaZthWdwaXQd/gq5CxjyvG/CGorc/yYFAYDU7mXeMas541fkWHSRqkxAKEV0RPWGFDZfOr4HaffPvbSB9glLol7Cat4yWztXjvFowMU8/KU6WB2htVUah5KlwY2mhtN4XqxiAB0Bt7dMRbeGJWPZ3bA5bnWH5fAAeOnJuI9tZR29Q+ePOjvLEnVA9a4uq/jvQkUP0KTz+bnjh5bsefM1+5R+PbmrfH1ZDRYDejf7e9qrIIvNnHzQAidEQBjOYThlIa7ImBCA7UAnvbzE7AxsosaksKhEtYCBTM5da8tR1ObkbubzPZwshJG4RvtjVyiEQfjA4h8daiwa+kkYdTxDPZk8Bd/v1QnN4VPPDH56Pwupw/BtjF7JkCa2BqfS8dQPuAoH/fYgRzbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(261022075727099003)(10067099003)(261022105027099003)(261026121527099003)(261026140227099003)(261021123027099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZStZeXRxQmxZSGlqY0d5MWlZanhxNWRvSk1COW1uT2hGZExocTBEM1J1elY5?=
 =?utf-8?B?UVVqL2pacnBPOUtwYWJFZ3JaK0pFUDlCMENaaUFhZUt1aS9JcjU3T09EaXFI?=
 =?utf-8?B?enZjSW5OY0ZUN3c0bm9OTFl6NEdEZG9lblB4Q1BhRG9OUXdoa0syZGpFZXZx?=
 =?utf-8?B?cmthU3k1a2hYNXlUbUUvYzJWTDRhNisvZ3ZWNjJ3MHZjSlM5a2ZGZU1HWHZU?=
 =?utf-8?B?NktXdFBzd0NhZzNTVmVicGdYamJpUml4RElvMWtkSWtzYUtGbWtpVzE5TjVB?=
 =?utf-8?B?TDBLRGl2ZG4vWlhaUUNBemRBT29iSXRLamJCOXdVMnpMcFk1VmE5WmRXNnJ6?=
 =?utf-8?B?Qml1K0ZsVDFLS0NoVzFSeHNBcWE2amxXTlI1TkxINXdSbE5EakJBYU1POGxV?=
 =?utf-8?B?L1FNbnpqeElSNnBGQThSRHFoQzEwblF0Y3BxVVQ4bWpRYUlkNjl3TzVya1R3?=
 =?utf-8?B?Q3NqVDJMaGt2Q1R2NHNibXZ0QUVVUzhuUnJiNWMvU2pDTjZRVlR2SlhSa1Q5?=
 =?utf-8?B?TXUwdTVqTnVvSThjZW9RYm16MTdrV0IwS2FlZUl5REtjYXg5TEhYMVBMaDhN?=
 =?utf-8?B?SnEwSEJuc2RGZEtPbzNtb3Q2NWs1ejFmZVREaGYzVlA5YVNDdDN0Yi8vUkR0?=
 =?utf-8?B?cSsrc04xWCt4ak1FRGY2M3IyMFdiVWFkaTZpT2gyNk4vWlJ5WnVwZlM2Tm0w?=
 =?utf-8?B?ZG9EZnZTblhqN1B5Vm8rdkx5R3JCb3pOVlRMVzBFbGJ0UmMzMVZoMDdXbThI?=
 =?utf-8?B?T1RKTUd5Z21oNk9CZDJLSTkzSndXamdlaG50anpsQWV0UjFZUEt4ZTlvd293?=
 =?utf-8?B?OXVzVXQvZGd0MDJmRThrbS9NQktWNjczc2FFUzBSR2M2bUI5Y3pUTUdCNFU4?=
 =?utf-8?B?aTFmMm5uV1ZMMEpJeEx1b3ZxZ2FoS2s3VUJ0dHk3U1pMbWVyUzlaR3A5SHB0?=
 =?utf-8?B?K2xmcXFGQ2Q1elJXcDlFeksvZ2RlOWdNZzJudVhYZUY0a2hXa1huSXZjMXFG?=
 =?utf-8?B?dFZvU3ErR3BKRDF2Qm1nZnh0MWJYUWs5MVIvM1V6T2EwZnlOQll0NnRkcXVZ?=
 =?utf-8?B?UDF5WStkd2lsRHNBWGhzVGpRWVFyanRyelBXU2lwSHFuQlIwQ2xrMjR1ZTdH?=
 =?utf-8?B?MGwyK0RXMlE1UjJPeVlncDUvM2ZVT1IzUUFMUkxoYVZBOVFqb1d1REVweXlH?=
 =?utf-8?B?YzBLQzFGTDZMakpyWlkxTEdZUUxaL04zRzY5ZUVpZHdOcDZBQ3lYMWpndWQz?=
 =?utf-8?B?bVFnd3VkOEhHeUt1b0RHMDFubkZtTlUrL1lneDdDQnR0VW1PcVVpTVM5c28z?=
 =?utf-8?B?aE42TmdPeEpBNEdrUHdDNkxhVTRFOWkrUmZRRFNySnJqSUIvT1FHSERjWUdI?=
 =?utf-8?B?TGMvZ3Q0dTAzWkVqVzkyczB6ZG9pVm9Pc205bVh1blBXODFXMkhPWCtxbmxE?=
 =?utf-8?B?amtCWW0xTXYxd2NFQkRjaTY1QmZQTnVldVdpUUNQUUY4Rk80RkxkdU5QUEZQ?=
 =?utf-8?B?bTZDVHZPU2VTMDRiR3diVlRGdVlTTlF0c1EzS0haK2RHYkNROG1iU0lDdEw5?=
 =?utf-8?B?SnRxM1BvRzRYb292cGZhWE1pU0sxUDRZbUJ4cUd0MUR6YmhyTEJrZzFnMUlv?=
 =?utf-8?B?KzZNS2tuaDBtZGhoOXpYbTBvcDU5bS9uOGVLZGxRWDE2TEcvMy9ZS1hvQTla?=
 =?utf-8?B?UFNPN0VNNS9RVmNSYW5jTXZIT0c0bGZTSVB6YTd0VTJIUTk4bThFaWZFYmg2?=
 =?utf-8?B?bGlKZmNzMjZyaCtSdjNmTXliaG1La3dSMzhnYkgwcVI3ditGSnRGbWFmOUR3?=
 =?utf-8?B?OTh2dVZZMkJWQm5URjBVY1BQaUs1U1ZlS0Z0R0hvVGJITmhIbzlSRm4rdU9E?=
 =?utf-8?B?S094eUNvN01hMDZTc0dRUmpVd0hRQkdqcElEaXlySGxpdFpMQkh3ODBjWFhM?=
 =?utf-8?B?dTBtdDduR1ZuVnhteGI1QUtTNHZaaWFrQnBHcnVaaFJuZ0xySEVQdDUySE5H?=
 =?utf-8?B?c0lTMGdiNXBJQXVWVVpqb3hlQ1BvY1hOYzRWeExPVFpyZmxHNVBZSjdTc29t?=
 =?utf-8?B?Nm9VR3pXaUdmRkdxL2ZwRDZ4alZwZHJhckFiRXl3OXN4bzI5aEFjZHhxc3RK?=
 =?utf-8?B?SkRiYkNyZkVsLzJhRXJqa1pxL2tCdmdvTUphdHhGZFNidm45UE8xV2lqMVdm?=
 =?utf-8?B?RXpXMEdaa2RkUXg1MW9CMjlhZWkxNkRNVEg2OXF2UVRyQ1EvVzl0djRsajlT?=
 =?utf-8?B?N0szOFdodWZBRnJIUVkwa05Pa25YS2pvSWZjWGxhUldXSlM4VXoyOUVMTEIx?=
 =?utf-8?B?ZTZsREtXOGVhdUVQT3E4ZWx1dU1BbEg1OHltVGE3WmowdWRrQnZtZz09?=
X-Exchange-RoutingPolicyChecked: nsP2aQGVOagLPwlRIIgb+c55/gPSe1BdrrlAGS49XfAIHaoWkEn5hzTO6suW404d9HRM9lJgJXJbztW+yq0oasnlj2rLPU7/HP9gZRFPxI6ahhEgL7Ww4IOlvXF4fK+7vr+74PMniLWI39kOcArm49CCH4udk/dI48I+BGGYM91pZPy4Iww4bQx0Wg/ouP9LP1opVrr1+8ZwxD/yNgjECdvjhLdH1klH+yW12jfKbocECpw3kYfCRlBVQq5f2g3zZbcjAey9bXveiQGR/FzrN3saXe1LUVpWYnbAC621DPCkBJE295gKI2fdWHKdIoLXzqBAaNRzgHZgnzAd5owD2Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae499eb5-dfa6-4a0b-ac3c-08df3fb7e45d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 05:51:55.6549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5uXlPr3LUo/z0FRej5QY/ck1pRWsc63DBRHVPLIiH9aUFINAPGIuRq4werbkDhpDA7Dpa2w1mnmq3dKWepbCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB9917
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11-11-2026 11:10, Raag Jadav wrote:
> On Wed, Nov 11, 2026 at 10:15:26AM +0530, Tauro, Riana wrote:
>> On 10-11-2026 18:10, Raag Jadav wrote:
>>> On Fri, Nov 06, 2026 at 12:49:47PM +0530, Riana Tauro wrote:
>>>> From: Raag Jadav <raag.jadav@intel.com>
>>>>
>>>> Since hw_error_work is now being reused generically, initialize it per tile
>>>> so that we don't hit uninitialized work for non-root tile. While at it,
>>>> disable hw_error_work on fini to prevent UAF during unwind.
>>>>
>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>> v2: add dgfx and sriov check (Sashiko)
>>>>
>>>> v3: retain original patch and fix unload issue in later patches
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_hw_error.c | 20 ++++++++++++++++++--
>>>>    1 file changed, 18 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>>>> index a934b649575c..f7031b341ce0 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>>> @@ -537,6 +537,19 @@ static void process_hw_errors(struct xe_device *xe)
>>>>    	}
>>>>    }
>>>> +static void hw_error_fini(void *arg)
>>>> +{
>>>> +	struct xe_device *xe = arg;
>>>> +	struct xe_tile *tile;
>>>> +	u8 id;
>>>> +
>>>> +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>> Why is this needed? fini is not even registered for these cases.
>>> Not everything is a bug because AI says so :)
>> This is added so that it can be re-used in error_detected in patch [7/8]
> Which sounds like this should be introduced in the patch which reuses it.

Thought was there is no harm adding it here as its just a extra check.
Sure will move it to Patch 7/8

Riana

>
> Raag
>
>>>> +		return;
>>>> +
>>>> +	for_each_tile(tile, xe, id)
>>>> +		disable_work_sync(&tile->hw_error_work);
>>>> +}
>>>> +
>>>>    /**
>>>>     * xe_hw_error_init - Initialize hw errors
>>>>     * @xe: xe device instance
>>>> @@ -546,12 +559,15 @@ static void process_hw_errors(struct xe_device *xe)
>>>>     */
>>>>    void xe_hw_error_init(struct xe_device *xe)
>>>>    {
>>>> -	struct xe_tile *tile = xe_device_get_root_tile(xe);
>>>> +	struct xe_tile *tile;
>>>> +	u8 id;
>>>>    	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>>>    		return;
>>>> -	INIT_WORK(&tile->hw_error_work, hw_error_work);
>>>> +	for_each_tile(tile, xe, id)
>>>> +		INIT_WORK(&tile->hw_error_work, hw_error_work);
>>>>    	process_hw_errors(xe);
>>>> +	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
>>>>    }
>>>> -- 
>>>> 2.47.1
>>>>
