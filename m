Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93A560A262E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 06:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZEe2OcVA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1AB10E392;
	Wed, 11 Nov 2026 06:23:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA9D10E392
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 06:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794378217; x=1825914217;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pGlu7mc9XsIH08zYXwj2CxWQcWjPIass/IeuoBOB8aA=;
 b=ZEe2OcVAEuGEXrBNxqMXYuQC0dQrIkUe/taC4fN533/Cl4RriRUIvG3Y
 kCZqwxMOCwxJJLhrcPZPiBsbG6lKePZNyKsEwUa2ejVNQvlShvp2CFD5Y
 z5JqOHJDljJb1tRWiuTRb6iwymzORK/RBMyOfpD6gVqka4a6A2Mp5D/dP
 PUFdZ9KYBEpllFY/Tp9nr8md8CV6XTB0Ik8ywOc/gL8d7RBbCAGCZMw3I
 YtaX1hkpuvy3qy2bRC2GkSyyIuVS0Uz6lQXGx0Lc/TBY6Q7xhYa++qCSY
 wvagmJloAQ/NHrSqdeXCwhFvZaIohntFRvpBWsEntkkAST+ms0hXCQqXX Q==;
X-CSE-ConnectionGUID: cat6RqDJTh2FxiMNPtKrNg==
X-CSE-MsgGUID: XwXhi+gTRZSEWbEnhJMsAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3229900"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3229900"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 22:23:36 -0800
X-CSE-ConnectionGUID: z2qxo6GHQNKL2o2GaUoyzA==
X-CSE-MsgGUID: jdnBAhGITLepx9wH8qGElQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8508766"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 22:23:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 22:23:35 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 22:23:35 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 22:23:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YH8XN9fFUNgJtL979bn4ioLfMXMM9c+p7hRq0p9676U7vfyMhsJIc8KYwXgwEe8pgno0FmNMpBdceL/VGvcpUZRIpvYVsM9gxePfs/eEDRBqzYp9kt7+/bxXZJXRuYtgmYGXPXJPno23UP6ejytSCKp2e9BN2Wza7ex7MzTusWG84PruHUwbGB01GpbmuO/tKKIEP8anBR7cwIKmwNQ9os+KS83z0ZD9L2jUqni9VT8cxHCPiTksQ11x3RNJiyk9Vk6VAlOq0UO78JvJ+DLIAuw7CSXHNr88jgZI0+UKFIoYCEibwENlAOE8rDJk/OHAYb4gyQJxCQUAOS2oAN8l2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsaSW3wn9QA1rR4kGZZr4bgkshVq1pdZjigEanykLjQ=;
 b=Q4gLM46fZQey0X9YOux6rW7FSVkATL92dPV/OTN1axvPqEXbmLUUZpy7m7+U1EONTpD+CUpL6kpcZKusvE4g+Vo0Fp4pJ/GKL5Az+42CjazBszeB2QzQJFkV36wk8N3eAV09yhieGmkktfBr4A2AmInS3viEjHvDEvZVXuw8RPPvwf+sAATDnZIRSOQLPd5ixexc6+X6/ojZhbPp3THkOx9LJjL8dGnxk89p+sERhGizNkLxLYZBQeAbJo7q4/ZMKgIkWlGUYj3b1bE1eOgNDpBomzc24qlJlOnFIHF7285k0EJxpqVTqSDAChte4oka77rd+R0EHuVPCkBRqGU3vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA3PR11MB9375.namprd11.prod.outlook.com (2603:10b6:208:575::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.8; Wed, 11 Nov 2026 06:22:58 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 06:22:57 +0000
Message-ID: <1b8d752f-33dc-4b8c-9f2a-9c0368f5203b@intel.com>
Date: Wed, 11 Nov 2026 11:52:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] drm/xe: Add support for wa_14028434957
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <mallesh.koujalagi@intel.com>, <badal.nilawar@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-17-riana.tauro@intel.com>
 <avMZtuz1RZ0NR9Qb@black.igk.intel.com>
 <96da18e4-31a7-4a0b-8989-0b30e04a5c8f@intel.com>
 <avQH-KHFThQt46vD@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <avQH-KHFThQt46vD@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0277.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA3PR11MB9375:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a11144f-e03f-4065-3cd9-08df3fbc3a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|261009220027099003|261009221727099003|261009223027099003|261009223327099003|10067099003|261028144727099003|261102123227099003|261009221227099003|261026140227099003|261026121527099003|261022113327099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|56012099006|4143699003|11063799006|6133799003|260925021311599003|260925022911599003|260925021911599003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: cDVETyHe/bubGtO3MuZTGHr2w3lNP0DaGXuLkDI1YJf9QGDH/LehO1zAK8o9yXgQkVvuKpfy3yZ+mySiPli232U2rMOw4Q7LkZw3LbKCTys+HiJR52JRvE2spXBz1m6QzpPj8jJoooFIAnlykSX8ME+iam+3PnAxJO22TVSkWcq8/ilShFGa6lWWZ4Z0LceMslffyafdKGMC8puryX9sOz1U2x8xhl093fILJlfh5r2b03rcXbogziZYT/5n13xPPoJW4soxCenBEhvY72EqhKfhJiNrOs2imqyxqqDhaEhGo7fJWozjwJeQs+/iRUaT+MLoUaB6qZWcfJyJdr2j/phFB/MjtkwSJhiIG+44Cnnu2yZe7g1hgmVlN69CdcZhdWFaVSrGlUrL4KdYW5Rf8QgzFtVtlC8+8giPYhmJ+/FggV6ioTpga39dePtljLzuwbGFBVVGcNMxjgLq/drgPz4nkcjkOJ+ZaKO1ZpoiqTZIWvloqXRs8PVhgipFuNuUpD9R81mDTawkwVo/WZl219If/NSQaD8q7uQs6o5VdlHuYBrweezS9I5z57W5LItfsqIhj3sZjhAI14hD/9YWa+5gsr3XrPB+pCevOe9NmDqOsGWcaDEfqo6kTDjCuE07vR9AFUvgw1RhD0LvBbCB8fyQZD3QTWCEh/4hmbXoj6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(261009220027099003)(261009221727099003)(261009223027099003)(261009223327099003)(10067099003)(261028144727099003)(261102123227099003)(261009221227099003)(261026140227099003)(261026121527099003)(261022113327099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(56012099006)(4143699003)(11063799006)(6133799003)(260925021311599003)(260925022911599003)(260925021911599003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3U2S055cVFVdnE4RTdWenVscGpINnp4dnlCc0ZiVFZxdDJ3L2hDZXVZNGkr?=
 =?utf-8?B?Y25nZTI0QWtPOERpeXZiTGdNamdxS3ZMSXgvQ0c2bXVvMDBDZ0ZlL3l3Sjh1?=
 =?utf-8?B?ZWRpeTd0MU5KdzZscUpVMlcrVUx2Y3BaV0EvU2NVN2l0MW1LQ2ViZFVBY2Ux?=
 =?utf-8?B?RUZIeXlSbi9qNTVJRkJ4ejhTdXh1U2dRNjUyZU1zOHZJa1FjWlR4NURjMEcw?=
 =?utf-8?B?bjkyNnFKaW9jSnZUbnphRnBFV3g4Um5CT2RrUU5GVzFyamVWdFFJNCtrNTNp?=
 =?utf-8?B?Z3djRElRSkI2VUpmRXF1cjBycEhzSDRobGZKVVZyaXhvOUJBR2k0dTBBN1RL?=
 =?utf-8?B?MGRHaXZXbkZ2amRzc0ZGKzVNSmlaR2lTRmpvMDcyQVM2dm1aSW9ad2d6UzE3?=
 =?utf-8?B?R3VHbkNWd3hnNFpBdTNsRGVwSm9ibjhqRGZHSGY4VXI4ZUM1c3I3b0VTVzNu?=
 =?utf-8?B?ei9MazZnTkZYK0dzVnhWOTZDV2VFcnJFdGM1NEE0SW5YMUpUSzY2Y2t1UmRX?=
 =?utf-8?B?QTF3NHk2OVk0OTZ6M2RjSk9PYWFVQ2NuRzM1UTZqSjZLQlpOd3NUb3dSSXFa?=
 =?utf-8?B?dzhBSytJV2VjSlhMdmpHb0xFSDJ6R2R1eGZoU2p4WTUzNFIzNGYvS2dGNEw2?=
 =?utf-8?B?WGIzdXR3NEdpbEVyOEd2MktTLzIrZmRDdFpoTUNVNTQ3dlBxblp3WURqQnBY?=
 =?utf-8?B?QlBFNUlZQXd5L25OaWhuWGFZVlhGM2lYbURweThBSlMvUVZYTDNVUW1nc0tp?=
 =?utf-8?B?UFFXeU1sM2FTeEtmUS9HWUROTkxBaElPQktHRnNqcGsxSGozbHJaVWZtY3l1?=
 =?utf-8?B?TU5GUHlPUEllSGxJU0xvdmpMTnQ5UTdGMk9aelRXUFpyQnRvcXJNaWEySCtN?=
 =?utf-8?B?RDcwZDV2eE1TdTJ4TnhKbllldnAxeWJhdUNQQTNCQk1FT0dEbFBxV2UzeDB1?=
 =?utf-8?B?YUhKbTRSSmtwbjk1a1p6aXJwZW1iakUvTG9HMmduL3NYdVBHOTA3SmNmcHFO?=
 =?utf-8?B?RUwvY1o2YnFubjVFaFRvVzVJZCsxbEhyeWVtcHpwNXhhSE5aS1h5ZUcwS3E1?=
 =?utf-8?B?dzFVVllWbGh4TC92SVdsWEtJNnJzMDJ4UzYzZzJIMm9lRTIwQmdCNmd1R0xO?=
 =?utf-8?B?MnBNdHlqVmM4alFRa2lleVlmWFBlOGRHU0VoRm0wSmREemxGWlhCVUVsWUdL?=
 =?utf-8?B?WEU2aGEraElMSmJmVmhlK3dKWExqRGQ3YmorenJqMmFYZE02S2ZXRzNncVhJ?=
 =?utf-8?B?WFpaV0lFS04xMEoxVHduNkhudkRSWmJYWklVS0hXdHJubUp3L0psWE5LVko5?=
 =?utf-8?B?Zm81V1FyT2xIQS8vS292Y29WdU03OGMvb0hMZ08yd3BEYnBJYlpSVEdCWnYr?=
 =?utf-8?B?dDY0SGJLY1J1R0c4T2QzLzh1c0RMZkdOQ2RCRXhZQUZ2eTlKUGxvNmtrWVJl?=
 =?utf-8?B?TEFSZWNRVnJCR3ljTEtYNmNMVFVDQ1IzdWZXNno5QVJXS21KUEFKVFVJTC8v?=
 =?utf-8?B?RkxaMTNPVUIveEIzcmNBb2tUeWZyZ1RGSHZZUUVGRjY2M1hhblEwaGtCM3Bj?=
 =?utf-8?B?bTMwQWFQbGlMUHhTbzk2RmxjS2ZaOENLUWFJRW5LRWF6NGtaOU1Ra2JPTW8z?=
 =?utf-8?B?VDNoOGxuU3BJd0xKNTlZbXFFbHZvV0ZhR3BtdzZMSlU2UFk4MjNUY1lSQXFi?=
 =?utf-8?B?QVM5b2dtWXJZQ3h4QTVCeWpETlhONERxT0hWTFZUSk5CWXhLUjdnWTdzN3Rx?=
 =?utf-8?B?RWVna2lzQVF5NnBYakxaTzhxeE44QnFNN0cxSURTc1dFRlFPMkdJNG9RcWQ5?=
 =?utf-8?B?NFd5SWlyMHFFSGNEVGFWUGluNExIbnA2S0NkSlM4NkZuQUg3ZStMa2J5V2FK?=
 =?utf-8?B?R3dLZkpnV1A1WWF1V0J4R0JyVS82dWFJejBubzdqRkQvSTMyTnpyWDUyeFBs?=
 =?utf-8?B?UzMvUkJhQWUwNi9lZ0lvSFZSd3V5bmgrbThaUTByR2trUTZrQTVqNzFjVnBq?=
 =?utf-8?B?QjFlU3pVT0NXb1ZSRzdxd252RVZIZ1F3clVnQ0xRZkJibUFZVVRkMU5jdmxY?=
 =?utf-8?B?V1l5dkVUaHI1N1hhNTFtQmRMWDlUTDl6T0Z5RW5EbEdDMFNrMndzUlJCc0VZ?=
 =?utf-8?B?NTlzUzlDT2QzbURKbkt5b0t1cWpYRmtQT1oyb0U2MHBobkcvS1AzUytXUWV2?=
 =?utf-8?B?YnBoelc1RUgrWlk3T0o4c1VyQU1qUTgvZFBBaElmbTlzZEs1NDRuVm5kQ2M1?=
 =?utf-8?B?L1pXL1N6WmZjc2ZOQzRGWklBV0pyU0pySlF4L2hWd0RyUXVnK2lHQXkyLy95?=
 =?utf-8?B?dGd6VmhaWm01TzU4WVVaUjlaWEtqeUdaVkJFNWQxdTIyaklLVk5Ldz09?=
X-Exchange-RoutingPolicyChecked: zPZXyYzrKU2N3lEaFzrThisBcuA7vaEp4ibf+KtkFL70mpM+wHAe347+kgfLwqNbGZSg/L3bO9KTeeZ5wp6JpAhANksEJR0di64jzQnHlrxNCgsqldz92epSI7B+etzA7wYde0ClRvSbz+MRvF3daa37hxq/Wkx4JlvjJfEX7VEsBWQStrctlqO8CP1HvJKIbkt9+dSFPJ0aL7RqoW0MN4zBvDpGtUqKnu8NTAaeXGmERZra4SXBvHGTaocaUsSor9GN+p1C5aVBalfQDz4AuYjdpnJvGK8GIoqJnxXs2RBOIorYVZ/0PasEW8q5un6o9RtM6pp62uS014NNQGz81Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a11144f-e03f-4065-3cd9-08df3fbc3a3a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 06:22:57.7244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAebqQjuSI/o8PJVXspZnOPMLaBZgPKbLfuSAraXENOl1pkD4/zNijBosIZpsgGwn3zn/iRhm2l+dp8gj3tzWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9375
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


On 11-11-2026 11:45, Raag Jadav wrote:
> On Wed, Nov 11, 2026 at 10:20:38AM +0530, Tauro, Riana wrote:
>> On 10-11-2026 18:48, Raag Jadav wrote:
>>> On Fri, Nov 06, 2026 at 12:49:52PM +0530, Riana Tauro wrote:
>>>> Add support for wa_14028434957 on platform CRI.
>>>>
>>>> Non-fatal device errors are reported via a direct IRQ, while fatal
>>>> device errors are downgraded to non-fatal uncorrectable internal
>>>> errors and reported via AER.
>>>>
>>>> Add support to process and log non-fatal errors routed via the direct
>>>> IRQ path. Most non-fatal errors require no reset, except double-bit
>>>> ECC errors affecting a critical BO, for which the device is wedged
>>>> with a bus reset as the recovery action.
>>>>
>>>> For uncorrectable internal errors reported via AER, request a
>>>> secondary bus reset to recover. To avoid a race between the two
>>>> paths, if non-fatal error processing is in progress when an
>>>> uncorrectable internal error occurs, flush and disable the worker
>>>> to prevent further processing, since a reset is
>>>> imminent.
>>>>
>>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>> v2: use platform instead of graphics version (Gustavo)
>>>>       combine patches (Tejas, Mallesh)
>>>>       remove 1sec delayed worker (Andi)
>>>>
>>>> v3: re-order disable hw error worker before wedged check (Sashiko)
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
>>>>    drivers/gpu/drm/xe/xe_hw_error.c          | 41 +++++++++++++++++++----
>>>>    drivers/gpu/drm/xe/xe_hw_error.h          |  1 +
>>>>    drivers/gpu/drm/xe/xe_pci_error.c         | 19 +++++++++--
>>>>    drivers/gpu/drm/xe/xe_ras.c               | 21 ++++++++++--
>>>>    5 files changed, 72 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>>>> index 753b2a4a1006..300207596893 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>>>> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>>>> @@ -7,3 +7,4 @@
>>>>    14026746987	PLATFORM(CRESCENTISLAND)
>>>>    14026779378	PLATFORM(CRESCENTISLAND)
>>>>    14028586678	PLATFORM(CRESCENTISLAND)
>>>> +14028434957	PLATFORM(CRESCENTISLAND)
>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>>>> index f7031b341ce0..86b29f282837 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>>> @@ -5,6 +5,8 @@
>>>>    #include <linux/bitmap.h>
>>>> +#include <generated/xe_device_wa_oob.h>
>>>> +
>>>>    #include "regs/xe_gsc_regs.h"
>>>>    #include "regs/xe_hw_error_regs.h"
>>>>    #include "regs/xe_irq_regs.h"
>>>> @@ -15,7 +17,11 @@
>>>>    #include "xe_hw_error.h"
>>>>    #include "xe_mmio.h"
>>>>    #include "xe_pm.h"
>>>> +#include "xe_ras.h"
>>>>    #include "xe_survivability_mode.h"
>>>> +#include "xe_wa.h"
>>>> +#include "xe_wedge.h"
>>>> +
>>>>    #define GT_HW_ERROR_MAX_ERR_BITS		16
>>>>    #define HEC_UNCORR_FW_ERR_BITS			4
>>>> @@ -171,7 +177,24 @@ static void hw_error_work(struct work_struct *work)
>>>>    	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
>>>>    	struct xe_device *xe = tile_to_xe(tile);
>>>> +	/* Skip hw error processing if device is already wedged */
>>>> +	if (xe_wedged(xe))
>>> This is a weak check and actually doesn't achieve anything, i.e. the state
>>> can change immediate after this check :)
>> Helps if it is already wedged.
> Which is a problem for basically every single function in the driver ;)
>
> I understand it's not the scope of this series but I hope it gets fixed
> at some point.
>
>>>> +		return;
>>>> +
>>>>    	guard(xe_pm_runtime)(xe);
>>>> +
>>>> +	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
>>>> +		/*
>>>> +		 * Skip handling if an uncorrectable internal error is reported as
>>>> +		 * reset is imminent
>>>> +		 */
>>>> +		if (xe_ras_is_aer_internal_error(xe))
>>>> +			return;
>>>> +
>>>> +		xe_ras_process_errors(xe);
>>>> +		return;
>>>> +	}
>>>> +
>>>>    	xe_survivability_mode_runtime_enable(xe);
>>>>    }
>>>> @@ -433,12 +456,12 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>>>>    		return;
>>>>    	/*
>>>> -	 * Hardware errors are reported through System Controller on the platforms that
>>>> -	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
>>>> -	 * here for those platforms.
>>>> +	 * Non-fatal errors are routed as a direct IRQ on platforms that support
>>>> +	 * system controller.
>>> How the turntables :D
>>>
>>> I really hope (and I mean _really_) the required due diligence has been
>>> done here before opening this can of worms.
>> This is a hardware decision not from driver
> Documentation/process/submitting-patches.rst +458

I meant the routing of the non-fatal errors is decided by hardware.
Since the routing is not controlled by the driver, we need to handle the 
errors routed via
irq

Riana

>
> "The Signed-off-by: tag indicates that the signer was involved in the
> development of the patch, ..."
>
> So you don't get a discount here ;)
>
> Raag
>
>>>>    	 */
>>>>    	if (xe->info.has_sysctrl) {
>>>> -		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
>>>> +		drm_err_ratelimited(&xe->drm, HW_ERR "Non-fatal %s reported\n", severity_str);
>>>> +		schedule_work(&tile->hw_error_work);
>>>>    		return;
>>>>    	}
>>>> @@ -537,7 +560,13 @@ static void process_hw_errors(struct xe_device *xe)
>>>>    	}
>>>>    }
>>>> -static void hw_error_fini(void *arg)
>>>> +/**
>>>> + * xe_hw_error_work_disable - Disable hw error work
>>>> + * @arg: xe device instance
>>>> + *
>>>> + * This function disables work for hardware error handling for all tiles.
>>>> + */
>>>> +void xe_hw_error_work_disable(void *arg)
>>>>    {
>>>>    	struct xe_device *xe = arg;
>>>>    	struct xe_tile *tile;
>>>> @@ -569,5 +598,5 @@ void xe_hw_error_init(struct xe_device *xe)
>>>>    		INIT_WORK(&tile->hw_error_work, hw_error_work);
>>>>    	process_hw_errors(xe);
>>>> -	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
>>>> +	devm_add_action_or_reset(xe->drm.dev, xe_hw_error_work_disable, xe);
>>>>    }
>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
>>>> index 5e3a11424108..c2c0bfa6d9f9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>>>> @@ -12,4 +12,5 @@ struct xe_device;
>>>>    void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>>>>    void xe_hw_error_init(struct xe_device *xe);
>>>> +void xe_hw_error_work_disable(void *arg);
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>>>> index 472b85d0ccc3..67920751ecf1 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>>>> @@ -5,8 +5,11 @@
>>>>    #include <linux/pci.h>
>>>> +#include <generated/xe_device_wa_oob.h>
>>>> +
>>>>    #include "xe_device.h"
>>>>    #include "xe_gt.h"
>>>> +#include "xe_hw_error.h"
>>>>    #include "xe_log.h"
>>>>    #include "xe_pci.h"
>>>>    #include "xe_pcode.h"
>>>> @@ -14,6 +17,7 @@
>>>>    #include "xe_printk.h"
>>>>    #include "xe_ras.h"
>>>>    #include "xe_survivability_mode.h"
>>>> +#include "xe_wa.h"
>>>>    #include "xe_wedge.h"
>>>>    static void prepare_device_for_reset(struct pci_dev *pdev)
>>>> @@ -87,12 +91,21 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>>>>    	if (state == pci_channel_io_perm_failure)
>>>>    		return PCI_ERS_RESULT_DISCONNECT;
>>>> -	/* If the device is already wedged or in survivability mode, do not attempt recovery */
>>>> -	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
>>>> +	/* If the device is already in survivability mode, do not attempt recovery */
>>>> +	if (xe_survivability_mode_is_boot_enabled(xe))
>>>>    		return PCI_ERS_RESULT_DISCONNECT;
>>>> -	if (is_aer_internal_error(pdev))
>>>> +	/*
>>>> +	 * If non-fatal error processing is in progress when uncorrectable internal error occurs,
>>>> +	 * flush and disable the worker to prevent further processing, as a reset is imminent.
>>>> +	 */
>>>> +	if (XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev)) {
>>>>    		xe_ras_set_aer_internal_error(xe);
>>>> +		xe_hw_error_work_disable(xe);
>>>> +	}
>>>> +
>>>> +	if (xe_wedged(xe))
>>>> +		return PCI_ERS_RESULT_DISCONNECT;
>>>>    	switch (state) {
>>>>    	case pci_channel_io_normal:
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>>> index 58a0b5fa676d..1809c3c893de 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>>> @@ -5,6 +5,8 @@
>>>>    #include <linux/bitfield.h>
>>>> +#include <generated/xe_device_wa_oob.h>
>>>> +
>>>>    #include "xe_assert.h"
>>>>    #include "xe_bo.h"
>>>>    #include "xe_configfs.h"
>>>> @@ -23,6 +25,7 @@
>>>>    #include "xe_sysctrl_mailbox.h"
>>>>    #include "xe_sysctrl_mailbox_types.h"
>>>>    #include "xe_ttm_vram_mgr.h"
>>>> +#include "xe_wa.h"
>>>>    #include "xe_wedge.h"
>>>>    /* Any non-null entry marks the page as offlined by firmware */
>>>> @@ -671,8 +674,15 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>>>    			    DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>>>>    			    "Double-bit ECC error detected at sw address 0x%llx\n",
>>>>    			    info->sw_address);
>>>> -		if (ret)
>>>> +		/*
>>>> +		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
>>>> +		 * Wedge the device with a bus reset for errors that require SBR to recover.
>>>> +		 * TODO: Trigger SBR using pci_reset_bus
>>>> +		 */
>>>> +		if (ret) {
>>>> +			xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
>>>>    			return XE_RAS_RECOVERY_ACTION_RESET;
>>>> +		}
>>>>    		break;
>>>>    	default:
>>>>    		xe_log_comp(xe, cper_sev, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>>>> @@ -818,9 +828,16 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>>>>    		return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>>>    	BUILD_BUG_ON(BITS_PER_TYPE(sent) < XE_RAS_COMP_MAX);
>>>> -	/* Default action */
>>>> +	/* Default action for PCIe bus errors */
>>>>    	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
>>>> +	/*
>>>> +	 * Device fatal errors are downgraded to non-fatal and reported as an uncorrectable
>>>> +	 * internal error. Set the default action to reset.
>>>> +	 */
>>>> +	if (XE_DEVICE_WA(xe, 14028434957) && xe_ras_is_aer_internal_error(xe))
>>>> +		final_action = XE_RAS_RECOVERY_ACTION_RESET;
>>>> +
>>>>    	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_SOC_ERROR,
>>>>    				  NULL, 0, &response, sizeof(response));
>>>> -- 
>>>> 2.47.1
>>>>
