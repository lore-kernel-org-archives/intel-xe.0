Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C58AD59D7F
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 23:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD74F10E17A;
	Mon, 25 Nov 2024 23:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fp6B7iA1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E7910E17A
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Nov 2024 23:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732576240; x=1764112240;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=evC4zTJ6DO0jPhyUkakuU6J6bCXOdyYigX5knHhOsEs=;
 b=Fp6B7iA1qy9IrMFYUT8uzfE9tKHrfvoxDs7V9OMdYwVQVIxSIGpa6I4Y
 9Y1ImOvXNO54JFGIO24f9VBMftHML7mPPOH/3auaQ/tTehEhypcf3zfqs
 7tgsqw2YYz2E/TJiUpEril7Ded9lUvpwYl83brpettx13JpeJEFdDIJzG
 gOvZyqJgx9q4178IHsCKB0QGW50TtkwqWoB2R0xnSI5saDMexqC73MXjG
 xlKOVKTpFmlpFqsPOYO9tQNz1nCczYpBnI8OGCY0rwRt6o9ISnF/HdXgL
 qsMnycvDIFTXq8pxZv5T6btQ0ozagNHd844sGK7vT5qILV2Au55xQpMVJ A==;
X-CSE-ConnectionGUID: hyXurIR5RgaxVv/jlStg9A==
X-CSE-MsgGUID: UtOsNL88Q7ibThZJviduew==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32564976"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="32564976"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 15:10:33 -0800
X-CSE-ConnectionGUID: oD1xVk+rQUCyIDmiwvNIbg==
X-CSE-MsgGUID: nlXU9dWWTQm/0YjYacNOdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="95836899"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 15:10:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 15:10:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 15:10:31 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 15:10:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2mPg0kxFUsOdZpL2mj0viO5mqUOMHxtyOx7flof65Lp96enet2mPH3Be8hYir/IGJqXyG7/t2voDKZwbZWuZQB64uHRFoHsONHgObRlCzLJfZItNdcjeBi6T8/c+eZalUZFyeHq9MCB4pXd0kas8MQNVQ8yimAYWCh0WKIjJmzH2GnJrfRA5yX9qA7Xi89XA+MG1nsgRm0MzoX4LRZIikbFr9DgmjznRwZa5SNJWxPOdUg6CJ9uNk3IwAonrgTzsGnqgdPhje7thh4hi8durauu+2GWlV0eNzRj5FGp7txkWCxgNicyG3wFy6stdBv8GjbJqLZLHAz+vt8508Mf9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lOF0dLqnZDoLEdSTIhyCta2v4cCbGgMU5YPpVpTMvw=;
 b=vEqZ6vDoYWSuI5swUkMsycvXJ9ELFYHARpsPo179+AMMvQh+litUSbTjQtaj7nReoOw3PbDitINobNaq4up9y1UJ06r0A93fiowUZP5psWzVFQUh/nGug+3/COdkgtVmzQadADluJ8JkzY4yKMgEk+C5xuidc9jh2Thn2EOjGyLSQjuTcaYNzaFBtB4eBRHu+5CI/O/eyoSvVWMBlWiKmrQnWJSrXF03lntpbjqxDh/EZCMGccgq/F8Uvo5DA9ninKfiZn8wYRGNUMYVbhtbA1gM3+OR+2yYqUviM5OZPqWuRfATmGdSIxVswacD+mlah0RZ5WOpVZw72mgYYmuGbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 23:10:29 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 23:10:29 +0000
Message-ID: <3ec92cc8-9028-4f5d-9ecb-81a37c684406@intel.com>
Date: Mon, 25 Nov 2024 18:10:26 -0500
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Fix?=
 =?UTF-8?Q?_missing_init_value_and_add_register_order_check_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20241119231356.1473342-1-zhanjun.dong@intel.com>
 <173206159768.506194.16473645306700207733@b555e5b46a47>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <173206159768.506194.16473645306700207733@b555e5b46a47>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0065.namprd16.prod.outlook.com
 (2603:10b6:907:1::42) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: d3282d69-411f-4c35-80e2-08dd0da65a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjIyTGFsZ0U1YjFXWFhvVTY1TU9qWHliR1VScDd0d0VQdjVFaXVtR1ZOaXR0?=
 =?utf-8?B?L1EyR3ptWnhIcWdpTGpCYWlwWjZHd0ROMGlUWXV5ZEJGZE1LdmZLeEVuVHZE?=
 =?utf-8?B?dndzcHNndEgyUkhvbGMxMk1JQyt1NTg5TEtDS1g4SU5jd1RhbWhNKzg2NHp1?=
 =?utf-8?B?ZVB2bzNBaXk0dmZ3Q2szT3ZISFcvWlZSYUQ0VXFaVUFPYXFDaG9scGthQzRv?=
 =?utf-8?B?L2YyVjVmMUR0VFp2T3B3a2RHd3ZsNnl4ek1qRnVhK0xiTHVTaWVIajZtZFZU?=
 =?utf-8?B?QXNnb0VvRVliSjc3amVTWU8rYWhoZUtENFpwT1RzNUJMQ3VaZzBObEUyV2pv?=
 =?utf-8?B?K2RFTVNVSklibUV2SGQ5YjZNZ2JIQThjalhRazdJK0hrbWxOa1dkZFQ3c3Bi?=
 =?utf-8?B?SldvVDF1ZEpzWWZQS09FR0Z3MlNIZHRnL1dUUkZPdTk5OElwbmJ4emMwM3dl?=
 =?utf-8?B?bC9WblVDN2szeFVsN2ZCdFZGS1JNSE1hcnpuVG5xRnVwenV1Yyt2SkJTUEM3?=
 =?utf-8?B?QVY4N0lVcURqNnM5MXloK3lrWTlqSlpwOHhpQzFENlhqdnVWMlA2OUxaQTNs?=
 =?utf-8?B?ZlgvdnAzTmUxU3pOQTVrQ1QyamhLTFozS0dxK3BCb1ZaWjJCZWg3czdLanFi?=
 =?utf-8?B?RDY0R2dwYzJHb0tkTG5rMU56R2dtVnFrYWc3dW1hV1JFZTJ0aGhBc0tYdkdh?=
 =?utf-8?B?Ky9ISnhoZEVwcTBwSzhRb2c2OU9wb2V0Y0RTVWNZUDQxYUxQYWRsU3kwRHhs?=
 =?utf-8?B?Tk9yL3d5dVVMUkFQT1JDTUl2anlxU3dhN20vM0JnV2RkR3BENmFnanFoeG5m?=
 =?utf-8?B?eEhGblprdGhndkd1YkpIbEs5cnZubjhpS0xpQlVORlZjM2VxMG1aQndDVjFX?=
 =?utf-8?B?WlJUUmg5cGhNZEZmNFhESnZiaThmT0h5dmR2bDR6TmI4K1dEbUJYcUNpZWtL?=
 =?utf-8?B?SUYzRkJxaDdpaFloSjBzT2oyUzlpQkZnVERRZW9pcUg4K3ZyWDBMOWhHRU9a?=
 =?utf-8?B?Mm85R3ZDUVR4TCtpVmxnNnI3cFdzdjdOTDI5ZzlCWUVnM05QS2Z0bkpnMTV4?=
 =?utf-8?B?c0hVeUdxcHRzdkhvUFpISFM1UERLcWdvYnRWRkJINUVteTFJdjl1Z0lRSHJ6?=
 =?utf-8?B?MWdsTEFJVUJqM3ZyRUM4K1hOSjJaaG0rV2hZRkpMOGkxQkptb0E4S2pwMUkr?=
 =?utf-8?B?eXRJSUt3Rk1nL25UZmY1MXpyenVReTI5VjlnMHVBU2dIaVhkOHg1bCtRdGpY?=
 =?utf-8?B?UWRVTHdMTzZSQ01ZeHZqY1Y0RVg1ZWh0SldSSE9QdWJtcXdHOFRDdkpxUEg1?=
 =?utf-8?B?TGVEWWhubU9vVE9xWm5pR0pjNUY3cWhicG9JeDJPcklJSW14QUZZYU5iZytP?=
 =?utf-8?B?SFRZZTUvNTFTeTZhd2tnbXcxd0JEeG9jN0srWVdFS1d5NG1VNGFGRU1LNkc1?=
 =?utf-8?B?SjRwK2lZTmRmMFEyQWg3OVFucHQ4SUYzZU8rMEdleGhKV2ZZU3FDTFdIc3hF?=
 =?utf-8?B?dmVBT1owWi9vLzkxV2ZoZ0pWVEZrNXRyMmRFdWZ6OFZBRlVNTjB6NFFibEMv?=
 =?utf-8?B?KzJLTlFnME5CQjVscHJocngrWTI4SmxUeUxhVnV4cUI3N1JNdmhUUGNYbUJE?=
 =?utf-8?B?V1lLU1FKdm9HZzBJYmdLQWpiMC9MdEI2dGVLWWhPUWlYZXAzck1aUjFkUXM0?=
 =?utf-8?B?UGU1cmVyUmdwbHZuR05uMVRWQWxjTk80T2pYcjJjb3Z3WmpVQkVwWEc4cW5j?=
 =?utf-8?Q?Kw/R2slaAy9ZNYi+os=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWl4ZS9TRFRZK3ZlMmhwS0V3eHN2YlkvYXhLV3B2d3VHYVVlTEx0WnJRMmc0?=
 =?utf-8?B?TmxpUzFFcWFqcVB1OG1uRmtORWNhQ1hiR1MybDMyUloxSld5S3FPZkpZVWNF?=
 =?utf-8?B?T0xlMmlJcUFCak0yWXRaMC9WVWp1VFpHTDdCK1dwZUVZTGFESFhIQmtrVkdx?=
 =?utf-8?B?MEljT3VHSm9TMVhrTEtjczlPSyttNlBSMW9BOFFPWWJBL2dTeUZBeU1SK3Br?=
 =?utf-8?B?dzR4djJOWHptVk9rdlAvR0s2WmdXOWIwZ0E2WFpVdmNqSS84dXFHRFo2TFR0?=
 =?utf-8?B?QkhrWUx4aTZONXE2VkdVZXJwallqazNiTjZiT21VUWtVYUlEWktoTnRqd2ZD?=
 =?utf-8?B?Y0crYVNmaFVEeG16eE50d01GTUQ4RnByZEdRZVZxV29NTEJqT0Z0R1V0WnVi?=
 =?utf-8?B?NGJRQXNVa2gzK3VOcnR6Z0RxbnZVY0NCMUpZVjRleWhjN3RhSHVRY0VhVHhu?=
 =?utf-8?B?MVZHaHZzNE84NUVxS2lLRVhDZ0NHVkRqdWVJRHl0TEFGaU9hSGY0NGtaMHo5?=
 =?utf-8?B?WjJwQWFPeG9FYytVK2g2TytyTjNEK2NPNXpmeW5KWnhkMm82N1pYTGZlc3d2?=
 =?utf-8?B?Nm9jMUdqWDEydEVDK3FZUFl5eXBTVW00VUFmR3BpY0Uxd0ZoRXJmRFcwNEU2?=
 =?utf-8?B?c1JVZFNMWEVWRHl6QnFwa0Fpck9UVzB4T3lXcnR5ZjdmWHJtOXNzN3RlQlpZ?=
 =?utf-8?B?enpOOVA1eDk5QVRReWtLVkFOa0VUSzBobkYydzcvODZBa2VYbXd2NGxXRTM1?=
 =?utf-8?B?cUhsWER5aFhSQ3lBS2cxSjFwM1I5YTBhdkp3WXk3WkZoNWlaUFFBQnd0K0xk?=
 =?utf-8?B?ZndCOVpCQWZ5dnEySkJrRlZzYTFwZlBvM2tuclZpNVAxRW9TQWc3dXdaTk9X?=
 =?utf-8?B?RXV1YlM1RGFaaHJOdTArMUc5a2RiVkRWQUdBK1VQZ1g0b1pJRE1IR2xaOVIy?=
 =?utf-8?B?NzFYbzhTTnd2eDBqQ0Fxa093MkNkdlJoNEViUW10MHN1UC9SdWJWYklPRVNL?=
 =?utf-8?B?NU5NbWtyRS96MEhNeUZrdkMrcTd6eGpUbzQ1WWdqSWR0Tjg0WExpMy8wQ2Vs?=
 =?utf-8?B?TWoxRUlZMUpGSkIzT3ZGSmpTMTVPT25VRkVaa09najZzVXZVZ0Y3MXJFeHNS?=
 =?utf-8?B?RlcycUxyZVFLMnFFNGlPUkJQRmJZQVRST09xa3hkYmVIQjAxNVFxcVZ2TTRm?=
 =?utf-8?B?MEJMQkFiaDlTRXU1OThoOHdZZFd3VUplYklScjIxRi94aEJUSytxbmVhL0E2?=
 =?utf-8?B?ZFlwVThITDJheTRPQkRnb1JIaVJ6Ry93M1lPc1pRRDhOQVRrTitRVDg5ZXln?=
 =?utf-8?B?cWEyZWlBLzdScG96YTNXUUxHZHI2WjVqUW9hN0ZVajROK1ZXY01EN1lsOEhl?=
 =?utf-8?B?b3BIUUFqTEF1ZFRBRjRDamIzeEowOFFra0QxMktTVnN1TUR2SXdkVXBwUW1k?=
 =?utf-8?B?YTlSZUVEaWtEZDYxK0JzaWlFUHVqZjFlZHdyY2thblliUlFQcGo0OHdSaVRW?=
 =?utf-8?B?aENveklKVFE3dzl0Y1JzSlZKK0hDeHFOcmNyeWUwSnpCdlFKby9ORmhQVGd1?=
 =?utf-8?B?aHlqYWxPTDZrNlJhLys2YVp0eEcvM2Z3aUZPNG4zWjJUMVBPWFRzaXNnZEZJ?=
 =?utf-8?B?UkV4TXBhblEzQkJhNHM3Uk5ybTZtMHJoZlJ4VXJoeVVnejJLZCs0YVMzd09h?=
 =?utf-8?B?WTA2UTlmS0ZleVdmSXVPNU1mSndVNUxmRGI2ZW9WYXpNckVZdU1FSmI4dCtr?=
 =?utf-8?B?YnFpd1pFWDZjaGhZRHFDcWJHbjlSRVFjcS9DcnRuQ0JWc2JJczkzNG1aMmdi?=
 =?utf-8?B?Q3J2OFNRRWRGVmxkdTNBbzNFTXFVaEZ3MnFBK1J6ak00STdQRE1wR3Y0QTZs?=
 =?utf-8?B?V3FWQWhORDJLK1dNbnRzVUg1QW94V3RxUE10cXlKT3FxNm9QWWFXZmVWK251?=
 =?utf-8?B?cXl5N2ZZVGhUNFdFSmppeGd5blJNNmdCa1FxaDQ5cGl2ajlBb0NOSHdjTlB4?=
 =?utf-8?B?YTZrNW02cVFJNTRtd01nUTFyeUZMV3RlcTE3L0dycGx1U2RJbklENXh6ZVJ0?=
 =?utf-8?B?bGRKa0plZ2hhMmJMeWdSSm1EdzlrWWhuMDRCVXpEZ1FiaG9IejUzSEF4Umsy?=
 =?utf-8?Q?pSfAqry/OVCKtZFBKkimzu+fY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3282d69-411f-4c35-80e2-08dd0da65a8d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 23:10:29.3112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGfJwbCdAtFYBlw+3JwfpO1SDnYEZBfc2Ii1xQ3uV1jyMLHowcD5KESwD4zZCqBnQMyT1/XNmKhjuEC4fxm99g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
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

Overall, all failures is not related to this patch.
Details listed below.

Regards,
Zhanjun

CI. Full result email not received. The following is the copy of 
https://patchwork.freedesktop.org/series/140889/
Section: Xe.CI.Full failure

 > CI Bug Log - changes from 
xe-2254-ccf64319402f90f68549e2047a7f985a46436e41_full -> xe-pw-140889v3_full
 > Summary
 > FAILURE
 >
 > Serious unknown changes coming with xe-pw-140889v3_full absolutely 
need to be
 > verified manually.
 >
 > If you think the reported changes have nothing to do with the changes
 > introduced in xe-pw-140889v3_full, please notify your bug team 
(I915-ci-infra@lists.freedesktop.org) to allow > them
 > to document this new failure mode, which will reduce false positives 
in CI.
 >
 > Participating hosts (4 -> 4)
 > No changes in participating hosts
 >
 > Possible new issues
 > Here are the unknown changes that may have been introduced in 
xe-pw-140889v3_full:
 >
 > IGT changes
 > Possible regressions
 > igt@core_auth@many-magics:
 >
 > shard-dg2-set2: NOTRUN -> DMESG-WARN
 > igt@kms_draw_crc@fill-fb:
The above 2 failed with
*ERROR* flip_done timed out
is not related to this patch.

 >
 > shard-dg2-set2: NOTRUN -> INCOMPLETE +1 other test incomplete
 > igt@kms_invalid_mode@uint-max-clock:
This test failed with
<4> [241.740319] xe 0000:00:02.0: [drm] GT0: Check job timeout: 
seqno=1834, lrc_seqno=1834, guc_id=0, not started
is not related to this patch.

 >
 > shard-lnl: PASS -> DMESG-WARN +21 other tests dmesg-warn
 > igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-2:
 >
 > shard-bmg: PASS -> DMESG-WARN +1 other test dmesg-warn
 > Warnings
 > igt@xe_exec_balancer@many-execqueues-virtual-userptr:
The above 2 failed with
*ERROR* flip_done timed out
is not related to this patch.
 >
 > shard-dg2-set2: SKIP (Intel XE#1130) -> DMESG-WARN
 > igt@xe_module_load@reload:
 >
 > shard-dg2-set2: FAIL (Intel XE#2136) -> FAIL +1 other test fail
The failed test about:
drmtest-WARNING: No card matches the filter!
is not related to this patch.

 > Known issues
