Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E10FC44501
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 10:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD63B10E034;
	Fri, 10 Jul 2026 10:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gD12DvC6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CB510E034
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783677625; x=1815213625;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tL0mGi2TuIKlHvAZvft3wrOZbrEnazO7qVx2n457wvQ=;
 b=gD12DvC6FooMXBfAuuhQK/UGpHvRGPL3FP+mpc5OjQj5cslMcRrnIpeM
 +3lC/6Yz7EKGjA5BFzT0CBHhA2LYnfbE3xp0pcAmcvDMeHKJiq5+VKPeG
 FtwpMGJlbnh4APVXigNleM6lRaiAMyHync2IsbzukzyWrB7Lqm+F/rjHj
 OVyEaGV49GXD56kULEobvskkm1T0TcNM2L80ynq3UHe9+O1pfSfV5OeUI
 1FYIx2oZKKsjejF/RRVIaa2rpai7QF6b6zjjvboDJNpcrZ3r9/biee/r+
 FeQJZry3yj/dtnarxqR88NoLokUij2aTnZC7R29YiavCTccHZkgEUwvN5 g==;
X-CSE-ConnectionGUID: yQdLWJJZRtOZHG58ZfYmnw==
X-CSE-MsgGUID: zAgUmvOgRNW6aR/4mn1Ouw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84232478"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84232478"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 03:00:24 -0700
X-CSE-ConnectionGUID: gp/RASHPSPG+nzDt6wyMXA==
X-CSE-MsgGUID: akK7529TQQu90/p9WcsVcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="279254910"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 03:00:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 03:00:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 10 Jul 2026 03:00:23 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 03:00:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQPnMyc/m88sAuNGn8Hf0GQKhEgDJ993b4hwdXWlOwDzaAUS+bgBmKLvbxdYdfqjmdp9oqnm0QEu0AmwwotMa5MGdrRN8S2zcv9XnVS+f/e/2MwRK9PmIlvlag93imW0FT8FQEmRBDQLUT8WTWXUpXdAfr2O4EtLTYj8Z1bfzrez5E4d+JBEEfupqPzin6FaFMXuw5tg5WmXN7+OL5g145lAuaM1D4rR8AoQ96s1ZiXnkqS9SNvSaCK2ffhNJ6Egk/4tFbPWNrO13j1vv904ltRx5+/JzDK03NI7czXW0ZjxmEbopRxAkyz81ONwq+XuLQSH2p6D2e3n4x4KyS0lHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nq67JPPYJjiArHOk09uzbdkfSUxaeTLT6V53+Fvt1TY=;
 b=GlIZmcIrqxaf+dg1ifkDi3Y0J4g6ucH+l154kbETFpYE63SQr0RkVvo6AW6LJAqg9s98rWrInLF54CUzQWTNeMT5l3+D2Q0v5NG6PBXa3BnO7EbXDr9rVikiHBDtotenejsJ6wQmPaDc69x5J2QsPCGsy6XaYRJnf0VuoOKgqTGWTH8/AHrxO2pp5L83WYA1iGhHa2N/0Ng83XVMdbJ4xZ2SQI9LjcFSrEZkDrL4dq+QMyTVrIsmXMjPvN9SoO7WLTrTXoE0Do/BtisMvAdFOzvXrNazyxJgonmH7gMKeDPzZ5wPTjwg9ak0bRugsqVF2XNuFSdMKX6Dfop/qlMn8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by MN2PR11MB4600.namprd11.prod.outlook.com (2603:10b6:208:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 10 Jul
 2026 10:00:20 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 10:00:20 +0000
Message-ID: <b2745e11-a5e3-4754-812e-cd29654db193@intel.com>
Date: Fri, 10 Jul 2026 15:30:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] drm/xe/guc: Hold device ref until queue teardown
 completes
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <rodrigo.vivi@intel.com>, <tejas.upadhyay@intel.com>
References: <20260710030107.1813068-1-arvind.yadav@intel.com>
 <2a946288e9c348473a8c81b8ab56fb1e5ababe6c.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <2a946288e9c348473a8c81b8ab56fb1e5ababe6c.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0261.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::15) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|MN2PR11MB4600:EE_
X-MS-Office365-Filtering-Correlation-Id: b748959d-7ccd-41ee-bce0-08dede6a0ce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: wcKgnpUWx0YweOwnYZLXHCuD44JcZxWlwHigGEsH562F5q9P4XJzUPomOhJirxQ3W4o+WAInXmrLliQ6CBkx8DcrJ6uFAH6P9OQi56D7q3yzHSyFx255QHF+zAJN+OLvpNEyqcvMKOdwJ3M1H1gcnDj8catugHG7Qhlbw9Uhk6e9N6/FNRmNJNQGwFrz5RnxCXZ0cNVB29CqpHIDt8NribUtKJUJoQS8OkBLS2TnAkC9HXFkfJ0etuLGW73WuLTeGgi065qQGcK/ep47NpAmUDQ4fiu8xRvrewA+06Um3Kstd+SfEhkfBp/+uuc4CInP0Vsb/UWVaX6/1+QfQisoN75i90re7CZmD1PA4ls0GTW8ZVKSro/7tSiY/atbxWPoOdVk7XSoOLl8sjP+J0TKOTw8ApoxyLtH5G3L+q/6M+0rUuVBTJ07VjduPivy2jaO4sFT5Ci0QEpqLM5iztzm8kbt0er+RSYXuuFighdOTha03MpauKd5psV+qRMzVK7DdFzIjAohPo5fv+UHSJPgg9L4eTeGTRho+WkQI+pM1evoapjTkbJ0/RstikTkpwnSGpbPPHBOMSx+QzmpUDU/WVDRfRSNg3qNp872UvxRdxn1oym7p45+eB6nmfxu54FGZMkWP2GimHIFGaNxDUHEvulO7uScqXgOvaABfPQACgI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3dERVkxRW9IT056bytGOGthWDZtOUV2QVVjQlIyeWFsV2tmM3BRa04yMkpK?=
 =?utf-8?B?Y3Jldy9rellaVCtRbjAzOWpnMk94Z3NCSFFPdGVmaGlCWlNmMzNLQ1lNSWlY?=
 =?utf-8?B?L3FJNjBVMSs0UmpHNVJyaWEwV0laSklpbGxPU3lURlkvMmo1bFB2WEQrNTJm?=
 =?utf-8?B?amNmeHVFU3VtK2NXZHV2WkJ6eWxkVTBzd3k0TC82bHFSTUdrdDN4Yk1HWkRJ?=
 =?utf-8?B?eHJjZnZxQ0xGQlhBbkZFK0ZFYnFaeXpMZXd3VTBucko2ZzBIcXFlaEowSnl0?=
 =?utf-8?B?Mk5iNjNod0NCSE1LRG5GeFJOak43U0Uzck1mK0xNVk9CSHp2dVlSaTkrVzBj?=
 =?utf-8?B?clQ3MWlFT2I0cTRsMG1GT2RrN0JUbi84Mm5rdmRJTEpGcDNIR3JhT3lmZEcz?=
 =?utf-8?B?azcyTVdFVGJ1OXV0d1pwQmhvS0VQRWMyUy9Udlh6SU5sdUlnTGEvaDRORXZR?=
 =?utf-8?B?anIrdmxpN1FObmRib3dvVk5Jb1BIM2FJRXozU1Z0UEtCK2c4MmV6SUp5cU91?=
 =?utf-8?B?SHdVdXkzWTJtSE42cVAyVTQvT01majRuV2JLejhjM3NOTEtJR0JHVjN0RE10?=
 =?utf-8?B?U3NpMHY5bWNibFF6dG9VMXhTSkpHZURWbndZUXRCNldGaU5sVzlvcitzaFFl?=
 =?utf-8?B?bEY3L3hUV0gwaHNnY25KUDNMNnAyZ1NGOThyMGVmT09KSTJWWXQ2dm13MzhZ?=
 =?utf-8?B?WkswWVgrWC9ZRXFCRmEyVXBQbnVFNWwyWCsrb1JIaCtuK1JPZUhaOHZGZ3ho?=
 =?utf-8?B?aFdCamdVU0FBaEp1MFdZNEo5UzkyZjA3V2daWWVNL3U5ZGpiRzJUQ0tLd3lq?=
 =?utf-8?B?cUNBY1J1MDhDUVZ2cWtJU3QvSHJGRHYxUmVyb1JEZ0x2emZ2UTJreCtFQWQw?=
 =?utf-8?B?Z2VVQXVKUDc0ZFlKVzQ2TFBhRTlZSlVodTh6SWFKV0hQWTFvbXFnSlo3Wit0?=
 =?utf-8?B?aEVtS0M2Q2dIVmpDWTd2eDRTREM2VTROUUMwTDJ4V1Z0Wld5OVlldGpZbVVI?=
 =?utf-8?B?NDFZRHAwUzhKV3Mrc0tTWEhuNzkvUDZVUE9LWFcvRHM1TTZMVHNqOHJpYzdJ?=
 =?utf-8?B?UnVxM3FkKy9NMGhQaVNkaXJHYjZYMGtzMUdBdzNjbjNTNHlRMDFyaytnSXdq?=
 =?utf-8?B?cWdPY09veUVoSDJqYk5qVFNxWWFPbnFpQXdGbWg5YXluRmk1Y2VXNGY0TjFZ?=
 =?utf-8?B?N2kyQmJ2N29hMng4czBOTkdYY0VRdVNTZUQ2NzBJSGRHcTc1NzNTcEhMa0t3?=
 =?utf-8?B?a3hVYXBsa2p1OE0wWHdKbFJwcU56Wi9VVjRjMzZwUG51aTR5MmtDUDMrWHhn?=
 =?utf-8?B?MFF4dHpvZzdxaDIvS2dGc3doMEVzMGk1OFhiZ0lIemtKYnJ4b0JOeUEzQko5?=
 =?utf-8?B?ZzIvbWxOMTNPYUFqeDh5QzNQTWRRaHlnSlRCdmFWNFdSbkE4ZllKaDRJNmpa?=
 =?utf-8?B?cTFEcXoyQzFYdG85K1VNM0VybVdEM1NvMHNheUY5NnJDSWJyekFsQ0JlUlhx?=
 =?utf-8?B?Yi9tc1NQb2haMXFIYTcrenpxVnF4d2VSeVRHeXhFU0c5MldScU12a1BUN251?=
 =?utf-8?B?aEE3eGNSTUN2VUVzWUhwVlBNN3YwZ1V6VUptVUx3dlo0MUltaHhhcGdXUzlP?=
 =?utf-8?B?dzZ3WEVyRmFuemxBQkpJTXhKZHRPVTBHSUYwaVVoQXZYTjNhYXhwZGdGUXJY?=
 =?utf-8?B?d2pFRzZyUmNxZTkvc1ViaGxVNWJ3NmpFTDR2ZzNLbkp1Wkl0QWtNMG5POXVj?=
 =?utf-8?B?WFlpc0ZHaU1qcXNiZkxza0ZMR2JWYWVZaC9MNm9WbGtocXpxZVAyVnVqR1h5?=
 =?utf-8?B?bXJMMG85MEQ0L3dPbHh3ZnlzY2V3SXpaQlBGUVBhRWJxSjVoN28wTnJuaDV6?=
 =?utf-8?B?ZjRkSTBnSlcrSnNWQlQ2eTBWUGZ6S0ltaW8vMFU2ZzZCb2IyRVRIUjhzWS9K?=
 =?utf-8?B?d0E5L29TYzJ2Z05UcFJITjhvd2ZwdW9vMUFERU1BWDNTcFlOS1F3U0QxVVN2?=
 =?utf-8?B?WGViMzgvQnY3MHZ2c0tEVVYwS1dhWnQySFJPYzJxbFZpVForV3FoKysxSGZz?=
 =?utf-8?B?MDhob3ZrdHhuU0ZTVlJEY0JkVGRJQjI4TWxYaVVSK2VnYlEzSXlJNDd6WjF1?=
 =?utf-8?B?MWJacVpDMUJPVDE1b0NGWGIrbEdtMlRsT3JKTHlOQzFCcTNwLzZIOFFzSTBw?=
 =?utf-8?B?R21MYmcyUEp0RWMwYU5XYUs4V2o4Z0hQcTJtQmxOMHVTT0c3T2l4WklmNWkz?=
 =?utf-8?B?eTZHb1VWSTVLVXRkbEE1bFMrbkJ5aDJldlo5aTdzZkJCYTZEZmU2ZFRORGJV?=
 =?utf-8?B?N1QyN0VDeDRZOCtlcmV6RUJLOHBrYjJuSVlzdmk3Mjhnd0U2Rittdz09?=
X-Exchange-RoutingPolicyChecked: asZmF+MnOUR0ad81J+TULo/DbbIiJbMb0V8I/CXJEEtXMInsUP+yyC6HlljnqZnDlPWKQlSI2eeLu+p+LFTflleFsSpCKSkC5g+RxHQisJMxwHoNGEddl99RHz8zXsuOFPKL7mmOgQzz64fA+XCZrNSrgALi3o9is0HWF8U48ReFT6Ghc9k6p77KeKCiYkRrOHzPSxWYzglhFKJqf5/zjc/BO3v2fE5r3zOxi8OpsHi8la/h0EIGQdz1cR0X1BiyfUjarDDTuNStcvS+fj7U3ie4Aa5ldEvKI1uxfERFDnFHwaZqgFvGF3n31tCbJGHorm9s36pYRqiPQGDsIqfZcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b748959d-7ccd-41ee-bce0-08dede6a0ce8
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 10:00:20.1528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIei26aUUIgIeysOu+OOHZjbTLB/qUlzNtdR3Q586on/GA7cjEK25lPi2ojqMyvLSHpV1IFVZp9DlaW+T1PCsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4600
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


On 10-07-2026 12:04, Thomas Hellström wrote:
> On Fri, 2026-07-10 at 08:31 +0530, Arvind Yadav wrote:
>> GuC exec queue destruction can run asynchronously. If the final
>> device
>> put happens from a destroy worker, drmm cleanup can end up draining
>> the same workqueue and deadlock.
>>
>> Hold a drm_device reference for the queue lifetime and drop it after
>> queue teardown completes. This keeps drmm cleanup from running while
>> async destroy work is still pending.
>>
>> Move GuC destroy work to a module-lifetime Xe workqueue and flush it
>> on PCI remove so hot-unbind/rebind still waits for pending destroy
>> work.
>>
>> With queue-held device refs, guc_submit_sw_fini() cannot run with
>> live
>> GuC IDs. Replace the fini wait with an assertion and remove the
>> unused
>> fini_wq.
>>
>> v2:
>>    - Rebase
>>
>> v3:
>>    - Switch to queue-lifetime drm_dev_get()/drm_dev_put() model.
>> (Matt)
>>    - Queue async teardown on system_dfl_wq instead of xe->destroy_wq.
>> (Matt)
>>    - Drop separate deferred drm_dev_put worker.
>>    - Remove stale drain_workqueue(xe->destroy_wq) from
>> guc_submit_sw_fini().
>>
>> v4:
>>    - Replace the guc_submit_sw_fini() wait with an assertion and
>> remove
>>      the now-unused fini_wq. (sashiko)
>>
>> v5:
>>    - Move destroy work to a module-lifetime Xe workqueue instead of
>>      system_dfl_wq. (Matt)
>>    - Flush the module-lifetime destroy workqueue during PCI remove to
>>      preserve the old device-remove wait semantics.
>>
>> v6:
>>    - Keep SVM pagemap destroy work on the per-device destroy_wq to
>> avoid
>>      letting it outlive the xe_device/drm_device. (Sashiko)
>>    - Use WQ_MEM_RECLAIM for xe->destroy_wq because SVM pagemap destroy
>> work
>>      can be queued from the reclaim path.
>>
>> v7:
>>    - Drop the per-device xe->destroy_wq and use the module-level
>> destroy WQ
>>      for SVM pagemap destroy as well. (Matt)
>>    - Rename xe_exec_queue_destroy_wq_*() helpers to xe_destroy_wq_*()
>>      helpers because the WQ is no longer exec-queue specific. (Matt)
>>
>> v8:
>>    - Rebase.
>>
>> v9:
>>    - Keep SVM pagemap destroy work on the per-device WQ_MEM_RECLAIM
>>      destroy_wq because it can be queued from reclaim and embeds
>>      the dev_pagemap used by devres teardown. (Sashiko)
>>    - Keep the module-level destroy WQ GuC-only and drop WQ_MEM_RECLAIM
>>      from it.
>>    - Update the module-WQ kdoc to document the GuC/SVM split.
>>
>> v10:
>>    - Keep xe->destroy_wq per-cpu while adding WQ_MEM_RECLAIM to fix
>> the
>>      workqueue allocation warning.
> If *all* work items that release the drm_device refcount are flushed at
> device removal (unplug) time, Why do we need the drm_device reference
> in the first place? Since IIRC the devres, that runs after unplug,
> keeps a drm_device reference?


The flush only covers work queued at unplug/remove time. 
"xe_device_remove()" does not close clients or destroy user queues, so a 
queue can outlive the remove-time flush. That's why the queue-held 
"drm_dev_get()" is still needed to keep "drm_dev_release()" and drmm 
cleanup from running until queue teardown completes.


> Similarly, if we flush all outstanding per-device GuC work at device
> removal time, why do we need this additional module-wide workqueue?
> Wouldn't it be equivalent to keep the GuC work items on the per-device
> destroy wq, and flush it at unplug / pci removal, the latter being the
> key?


The PCI-remove flush only waits for destroy work already queued at that 
time. A user queue can outlive unplug and queue its destroy work later 
when the fd closes. That is why the per-device WQ is still unsafe for 
GuC teardown, the worker can drop the final drm_device ref, enter drmm 
cleanup and destroy the same WQ it is running on. So the module-lifetime 
WQ is still needed.

Please let me know if I have missed something in this reasoning.


>
>> Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c       |  2 +-
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 +-
>>   drivers/gpu/drm/xe/xe_guc_submit.c   | 66 ++++++++++++++++----------
>> --
>>   drivers/gpu/drm/xe/xe_guc_types.h    |  2 -
>>   drivers/gpu/drm/xe/xe_module.c       | 49 +++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_module.h       |  5 +++
>>   drivers/gpu/drm/xe/xe_pci.c          |  6 +++
>>   drivers/gpu/drm/xe/xe_svm.c          |  5 +++
>>   8 files changed, 105 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>> b/drivers/gpu/drm/xe/xe_device.c
>> index ad7f3e61d457..47630e9f7410 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -581,7 +581,7 @@ int xe_device_init_early(struct xe_device *xe)
>>   						
>> WQ_MEM_RECLAIM);
>>   	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq",
>> 0);
>>   	xe->unordered_wq = alloc_workqueue("xe-unordered-wq",
>> WQ_PERCPU, 0);
>> -	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU,
>> 0);
>> +	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU
>> | WQ_MEM_RECLAIM, 0);
>>   	if (!xe->ordered_wq || !xe->unordered_wq ||
>>   	    !xe->preempt_fence_wq || !xe->destroy_wq) {
>>   		/*
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 022e08205897..56c17cca79c0 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -355,7 +355,7 @@ struct xe_device {
>>   	/** @unordered_wq: used to serialize unordered work */
>>   	struct workqueue_struct *unordered_wq;
>>   
>> -	/** @destroy_wq: used to serialize user destroy work, like
>> queue */
>> +	/** @destroy_wq: used to serialize SVM pagemap destroy work
>> */
>>   	struct workqueue_struct *destroy_wq;
>>   
>>   	/** @tiles: device tiles */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 12416bfa3255..9b9434d7452a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/circ_buf.h>
>>   #include <linux/dma-fence-array.h>
>>   
>> +#include <drm/drm_drv.h>
>>   #include <drm/drm_managed.h>
>>   
>>   #include "abi/guc_actions_abi.h"
>> @@ -37,6 +38,7 @@
>>   #include "xe_macros.h"
>>   #include "xe_map.h"
>>   #include "xe_mocs.h"
>> +#include "xe_module.h"
>>   #include "xe_pm.h"
>>   #include "xe_ring_ops_types.h"
>>   #include "xe_sched_job.h"
>> @@ -232,17 +234,9 @@ static bool
>> exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>>   static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
>>   {
>>   	struct xe_guc *guc = arg;
>> -	struct xe_device *xe = guc_to_xe(guc);
>>   	struct xe_gt *gt = guc_to_gt(guc);
>> -	int ret;
>> -
>> -	ret = wait_event_timeout(guc->submission_state.fini_wq,
>> -				 xa_empty(&guc-
>>> submission_state.exec_queue_lookup),
>> -				 HZ * 5);
>>   
>> -	drain_workqueue(xe->destroy_wq);
>> -
>> -	xe_gt_assert(gt, ret);
>> +	xe_gt_assert(gt, xa_empty(&guc-
>>> submission_state.exec_queue_lookup));
>>   
>>   	xa_destroy(&guc->submission_state.exec_queue_lookup);
>>   }
>> @@ -319,8 +313,6 @@ int xe_guc_submit_init(struct xe_guc *guc,
>> unsigned int num_ids)
>>   
>>   	xa_init(&guc->submission_state.exec_queue_lookup);
>>   
>> -	init_waitqueue_head(&guc->submission_state.fini_wq);
>> -
>>   	primelockdep(guc);
>>   
>>   	guc->submission_state.initialized = true;
>> @@ -411,9 +403,6 @@ static void __release_guc_id(struct xe_guc *guc,
>> struct xe_exec_queue *q,
>>   	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
>>   				     q->guc->id, q->width);
>>   
>> -	if (xa_empty(&guc->submission_state.exec_queue_lookup))
>> -		wake_up(&guc->submission_state.fini_wq);
>> -
>>   	mutex_unlock(&guc->submission_state.lock);
>>   }
>>   
>> @@ -1686,6 +1675,7 @@ static void guc_exec_queue_fini(struct
>> xe_exec_queue *q)
>>   {
>>   	struct xe_guc_exec_queue *ge = q->guc;
>>   	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>>   
>>   	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>>   		struct xe_exec_queue_group *group = q-
>>> multi_queue.group;
>> @@ -1704,36 +1694,52 @@ static void guc_exec_queue_fini(struct
>> xe_exec_queue *q)
>>   	 * (timeline name).
>>   	 */
>>   	kfree_rcu(ge, rcu);
>> +
>> +	drm_dev_put(drm);
>>   }
>>   
>> -static void __guc_exec_queue_destroy_async(struct work_struct *w)
>> +static void guc_exec_queue_do_destroy(struct xe_exec_queue *q)
>>   {
>> -	struct xe_guc_exec_queue *ge =
>> -		container_of(w, struct xe_guc_exec_queue,
>> destroy_async);
>> -	struct xe_exec_queue *q = ge->q;
>> +	struct xe_guc_exec_queue *ge = q->guc;
>>   	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct drm_device *drm = &xe->drm;
>>   
>> -	guard(xe_pm_runtime)(guc_to_xe(guc));
>> -	trace_xe_exec_queue_destroy(q);
>> +	/*
>> +	 * guc_exec_queue_fini() drops the queue's drm_device ref.
>> +	 * Keep the device alive until the PM-runtime guard unwinds.
>> +	 */
>> +	drm_dev_get(drm);
>>   
>> -	/* Confirm no work left behind accessing device structures
>> */
>> -	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>> +	scoped_guard(xe_pm_runtime, xe) {
>> +		trace_xe_exec_queue_destroy(q);
>>   
>> -	xe_exec_queue_fini(q);
>> +		/* Confirm no work left behind accessing device
>> structures */
>> +		cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>> +
>> +		xe_exec_queue_fini(q);
>> +	}
>> +
>> +	drm_dev_put(drm);
>>   }
>>   
>> -static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>> +static void __guc_exec_queue_destroy_async(struct work_struct *w)
>>   {
>> -	struct xe_guc *guc = exec_queue_to_guc(q);
>> -	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_guc_exec_queue *ge =
>> +		container_of(w, struct xe_guc_exec_queue,
>> destroy_async);
>> +
>> +	guc_exec_queue_do_destroy(ge->q);
>> +}
>>   
>> +static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>> +{
>>   	INIT_WORK(&q->guc->destroy_async,
>> __guc_exec_queue_destroy_async);
>>   
>>   	/* We must block on kernel engines so slabs are empty on
>> driver unload */
>>   	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT ||
>> exec_queue_wedged(q))
>> -		__guc_exec_queue_destroy_async(&q->guc-
>>> destroy_async);
>> +		guc_exec_queue_do_destroy(q);
>>   	else
>> -		queue_work(xe->destroy_wq, &q->guc->destroy_async);
>> +		xe_destroy_wq_queue(&q->guc->destroy_async);
>>   }
>>   
>>   static void __guc_exec_queue_destroy(struct xe_guc *guc, struct
>> xe_exec_queue *q)
>> @@ -1928,6 +1934,7 @@ static int guc_exec_queue_init(struct
>> xe_exec_queue *q)
>>   {
>>   	struct xe_gpu_scheduler *sched;
>>   	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>>   	struct workqueue_struct *submit_wq = NULL;
>>   	struct xe_guc_exec_queue *ge;
>>   	long timeout;
>> @@ -1939,6 +1946,8 @@ static int guc_exec_queue_init(struct
>> xe_exec_queue *q)
>>   	if (!ge)
>>   		return -ENOMEM;
>>   
>> +	drm_dev_get(drm);
>> +
>>   	q->guc = ge;
>>   	ge->q = q;
>>   	init_rcu_head(&ge->rcu);
>> @@ -2015,6 +2024,7 @@ static int guc_exec_queue_init(struct
>> xe_exec_queue *q)
>>   	release_guc_id(guc, q);
>>   err_free:
>>   	kfree(ge);
>> +	drm_dev_put(drm);
>>   
>>   	return err;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h
>> b/drivers/gpu/drm/xe/xe_guc_types.h
>> index c7b9642b41ba..31a2acb63ac3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> @@ -100,8 +100,6 @@ struct xe_guc {
>>   		 * even initialized - before that not even the lock
>> is valid
>>   		 */
>>   		bool initialized;
>> -		/** @submission_state.fini_wq: submit fini wait
>> queue */
>> -		wait_queue_head_t fini_wq;
>>   	} submission_state;
>>   
>>   	/** @hwconfig: Hardware config state */
>> diff --git a/drivers/gpu/drm/xe/xe_module.c
>> b/drivers/gpu/drm/xe/xe_module.c
>> index 39e4fc85f019..848d65265443 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -7,6 +7,7 @@
>>   
>>   #include <linux/init.h>
>>   #include <linux/module.h>
>> +#include <linux/workqueue.h>
>>   
>>   #include <drm/drm_module.h>
>>   
>> @@ -88,6 +89,50 @@ static int xe_check_nomodeset(void)
>>   	return 0;
>>   }
>>   
>> +static struct workqueue_struct *xe_destroy_wq;
>> +
>> +static int __init xe_destroy_wq_module_init(void)
>> +{
>> +	xe_destroy_wq = alloc_workqueue("xe-guc-destroy-wq",
>> WQ_UNBOUND, 0);
>> +	if (!xe_destroy_wq)
>> +		return -ENOMEM;
>> +	return 0;
>> +}
>> +
>> +static void xe_destroy_wq_module_exit(void)
>> +{
>> +	if (xe_destroy_wq)
>> +		destroy_workqueue(xe_destroy_wq);
>> +	xe_destroy_wq = NULL;
>> +}
>> +
>> +/**
>> + * xe_destroy_wq_queue() - Queue work on the destroy workqueue
>> + * @work: work item to queue
>> + *
>> + * The destroy workqueue has module lifetime and is used for GuC
>> exec queue
>> + * teardown that can outlive a single xe_device. SVM pagemap destroy
>> uses the
>> + * per-device xe->destroy_wq instead.
>> + *
>> + * Return: %true if @work was queued, %false if it was already
>> pending.
>> + */
>> +bool xe_destroy_wq_queue(struct work_struct *work)
>> +{
>> +	return queue_work(xe_destroy_wq, work);
>> +}
>> +
>> +/**
>> + * xe_destroy_wq_flush() - Flush the destroy workqueue
>> + *
>> + * Drains all pending destroy work. Called from PCI remove to ensure
>> + * teardown ordering before the device is destroyed.
>> + */
>> +void xe_destroy_wq_flush(void)
>> +{
>> +	if (xe_destroy_wq)
>> +		flush_workqueue(xe_destroy_wq);
>> +}
>> +
>>   struct init_funcs {
>>   	int (*init)(void);
>>   	void (*exit)(void);
>> @@ -109,6 +154,10 @@ static const struct init_funcs init_funcs[] = {
>>   		.init = xe_sched_job_module_init,
>>   		.exit = xe_sched_job_module_exit,
>>   	},
>> +	{
>> +		.init = xe_destroy_wq_module_init,
>> +		.exit = xe_destroy_wq_module_exit,
>> +	},
>>   	{
>>   		.init = xe_register_pci_driver,
>>   		.exit = xe_unregister_pci_driver,
>> diff --git a/drivers/gpu/drm/xe/xe_module.h
>> b/drivers/gpu/drm/xe/xe_module.h
>> index c75153471248..a0eb7db07770 100644
>> --- a/drivers/gpu/drm/xe/xe_module.h
>> +++ b/drivers/gpu/drm/xe/xe_module.h
>> @@ -8,6 +8,8 @@
>>   
>>   #include <linux/types.h>
>>   
>> +struct work_struct;
>> +
>>   /* Module modprobe variables */
>>   struct xe_modparam {
>>   	bool probe_display;
>> @@ -26,5 +28,8 @@ struct xe_modparam {
>>   
>>   extern struct xe_modparam xe_modparam;
>>   
>> +bool xe_destroy_wq_queue(struct work_struct *work);
>> +void xe_destroy_wq_flush(void);
>> +
>>   #endif
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c
>> b/drivers/gpu/drm/xe/xe_pci.c
>> index 08c14a0202d9..b0764eb90834 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1099,6 +1099,12 @@ static void xe_pci_remove(struct pci_dev
>> *pdev)
>>   		return;
>>   
>>   	xe_device_remove(xe);
>> +
>> +	/*
>> +	 * Preserve remove-time flush after moving destroy work to
>> module
>> +	 * lifetime.
>> +	 */
>> +	xe_destroy_wq_flush();
>>   	xe_pm_fini(xe);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c
>> b/drivers/gpu/drm/xe/xe_svm.c
>> index e0f0c23d172d..2cb17497d950 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -1732,6 +1732,11 @@ static void xe_pagemap_destroy(struct
>> drm_pagemap *dpagemap, bool from_atomic_or
>>   	struct xe_pagemap *xpagemap = container_of(dpagemap,
>> typeof(*xpagemap), dpagemap);
>>   	struct xe_device *xe = to_xe_device(dpagemap->drm);
>>   
>> +	/*
>> +	 * SVM pagemap destroy can be queued from reclaim and
>> xpagemap embeds
>> +	 * the dev_pagemap used by devres teardown. Keep it on the
>> per-device
>> +	 * WQ_MEM_RECLAIM destroy_wq, not the module-level GuC
>> destroy WQ.
>> +	 */
> I think this comment can be dropped. Outside the context of this patch
> it will be confusing?


Agreed, I will remove this comment.

Thanks,
Arvind

>
>>   	if (from_atomic_or_reclaim)
>>   		queue_work(xe->destroy_wq, &xpagemap->destroy_work);
>>   	else
> Thanks,
> Thomas
