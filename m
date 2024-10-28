Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8951D339A0
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 16:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD4210E513;
	Mon, 28 Oct 2024 16:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ap5a7qnm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6862510E513
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 16:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730134528; x=1761670528;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yJxeyZpM8IGSmp9CDo+EEtfseMl83D2PXbcCKab6g0A=;
 b=ap5a7qnmgKdcEiTu2t9oLpYUOCtqnW0oE1yXU6KuKGtyKxrnM+7IDNLT
 Ff8e5mrbD0BCSdvid2DU1Uz38KTz84YFkdvzcItfg89TvEjcdkVUgQnko
 JhMNx5ky1zfhbItuZMd8ii9AoTjjVwA0Gm/+193FSJgxv2LpUmEP00XBj
 Zc9Mud2fmGdIqFKTltrdWP9Wk/Bm2ttSryHjQ2oxtLLUNxDRrHpYuf4Lh
 rgPb/un39TeFMLjrP6bURVisMq/CG/U7HV0F3kieh2z8yEAXozKpVwyVQ
 cx2F6HY3j4SW51J6EfXMmRar13RM9NeybNyNOowk4GtxsN5pI1v/RBkFU Q==;
X-CSE-ConnectionGUID: +5HV6i6xQCCFsrAUZRnqWA==
X-CSE-MsgGUID: 3xZkYJ/GQl+SO1eGZzB10A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40839230"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40839230"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 09:55:28 -0700
X-CSE-ConnectionGUID: aYtp+elXQT2YMjndTVzyZw==
X-CSE-MsgGUID: X7Tuu/AIQByiQGySHURyew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="86425274"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 09:55:25 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 09:55:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 09:55:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 09:55:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8qWzXaFfw/O9WENIIWLQLzr7Zs2fSHJrmcpL+5zQ7MYuyobRLlz2owbgUuuqIWwWjbZtFWu0wCwFtmzK3+/ad95Xe/Ue7d3T/GhNMatYwZbXxz6Kvngdqf2DinSZgcYeh28x60fCqH0hAvEArpkYq+jo8T+yLRZ7Ky97XRUL0U++4J+y9yHwjNf/hStmYzFNcXxrpwajg1LgVDfiDKI+lFIoMwn4HPHEx4qN8Qtcjr7ApYkntIk4d1FuFjs1dHO3teP06dJl74kXrflhpvd9MxZ61nAsmaFXKNNgkGZtu2HFunBYDCdJS+aRHE6sIVKmy/K5peFulbH63+dHM0UUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZVpSz9Nl5cZz8ZODzdfNFwhHzovjnFj3KHu6TdW9JI=;
 b=Y5ztc7qn55E6+YCAtp2OyUWkhtYaxS1Y6k4/SGMiRQtSfuSSmSp/gLo0H+eZVkEy1CNEdvBsXOkxpCxu98z78nYwxWrcy5RG1YzuU1ZosfjUK3ICQdueR0ZGa/+bnGsQouTlY6X7EquNxSDEPaub6HFcQ5R3OrmppZdq+gXdx59qV+9fBNgpmP0Q0Z9oEvlR0Hjl8hspm7cnu6U9rxitVFhfK6shTYGCnWHof3QXjqa7Qy92YrmeFUs+Lm+USBC4DBGscoUHhFU+ouo5caYrVCSXcRpdmcXI96+8jTni4iQ1BmYDp0S8ZLlYsh9r/FUmBsGaTAPtI+D7YZrSg5zx1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6619.namprd11.prod.outlook.com (2603:10b6:303:1eb::13)
 by CH3PR11MB8564.namprd11.prod.outlook.com (2603:10b6:610:1b1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 16:55:20 +0000
Received: from MW4PR11MB6619.namprd11.prod.outlook.com
 ([fe80::55f0:ee1a:cbd4:a704]) by MW4PR11MB6619.namprd11.prod.outlook.com
 ([fe80::55f0:ee1a:cbd4:a704%4]) with mapi id 15.20.8093.018; Mon, 28 Oct 2024
 16:55:20 +0000
Message-ID: <bb0789af-4685-495b-bb91-a31e75333291@intel.com>
Date: Mon, 28 Oct 2024 17:55:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/eudebug: implement userptr_vma access
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <ZxviLOv75ISykjK8@DUT025-TGLU.fm.intel.com>
 <20241028161927.1157426-2-andrzej.hajda@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241028161927.1157426-2-andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::12) To MW4PR11MB6619.namprd11.prod.outlook.com
 (2603:10b6:303:1eb::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6619:EE_|CH3PR11MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: 959315c4-84d0-4862-8cf2-08dcf7714e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RG14K01wYVZYYllQdTZHSDlaMzRES3ZEVU8vWE5kOGVkMG9iOGt2MWJmRldB?=
 =?utf-8?B?WWJZeTNyYzRmYm5kZEdWTU1ZcVFUb0FYb3h4YUZDbzJTb0ZxMWllVDJ1Q0Ix?=
 =?utf-8?B?bk1INTJrZGdRS2NOY0FGS2gvOElvM1FQZXVHYkdSSmptKzh4eW5PSG91cVg5?=
 =?utf-8?B?QSt5TEI3SGhiY09VSGJvRWRBcXZlU2hGTFF6alM3RGFPNGZDVmQvWjZKZzdr?=
 =?utf-8?B?SzUxTFo5aWQ4NjRPazVhQS9VYWNJZ2NpMllhdUpWdFlVZk5SbkViMWkyWkZJ?=
 =?utf-8?B?SzZ1b0NkcTZNOFp1Rmg1cFlPN3BoUkhEcEo5LzB6cXoyZ0F3Z3l5SUp3RWZn?=
 =?utf-8?B?QTVXWXVLWDVvcS9jQ1lJZW40WkFjVGdZK21SeUMraTBGOXZtc2U2MHRHWUl2?=
 =?utf-8?B?Q2ZBNmJtelBQKzFNUDhnZjdCWlRBVVVpQ1JuT0JyQnJOblR2cVVYQ0RvTGhC?=
 =?utf-8?B?WXlEemc5M3kvazc2bjBDM2dZQXZld2REeFJNWVNWK3RKbGZUTGx2OVN2bkJr?=
 =?utf-8?B?WEdaZGJ2OUZGZ3ZuNnp6d2lrNTZVbjQxejR5UDNlL1FWQjZDQ3ZRRDFLZjNV?=
 =?utf-8?B?V0hWVWtzMjRNKzJHODk4eEoxZDJHTjVLTHVaZ09OSnNlTG5Lall3VkVEVDli?=
 =?utf-8?B?bkNNMkJBUWJxcjljVGRDOWpMNHVnQ2psQm9iYlJDblFlU3o0VVhvbzBLdzZh?=
 =?utf-8?B?T1UxM0RuZ2FWMHBsVEZweGdDTnZxTERPRytjcWhXR1pyVEhhcVJ0amk0TTRq?=
 =?utf-8?B?MEswQ0RIaW00RHcrS1dycHlmUHpKckJoVUhnYm1QSG01YVBVZTJqamxKZ2t5?=
 =?utf-8?B?bXVmR2lZU2lzZmpZVlV0WTlHcU9sQUU2ZU9pOGdicFd1NG01K3BIa2I0U2VY?=
 =?utf-8?B?QjNRMVZvVDIzZTc5UnIrd2xsY0xrS2ZHM1FIKzhvWEdMYllDUlJIZEkwUEV2?=
 =?utf-8?B?ekYrNGVna3FpWkx0anV1QlZ6cUhzS21zL0c1YnVTUTQ2V2Nuc3JSSS9hWFBX?=
 =?utf-8?B?a0FpQ0JnN0JzUTJoNVdqNWIzSFNoNXFzbDByY21lbytLVDlFTjlBU3l2M0Zh?=
 =?utf-8?B?ak56OEh4d2FRdExwT2tpZ2FYYm16L1A3Y3Z6QVRPeEt5VXZMZitOZ0JJekht?=
 =?utf-8?B?MFpDTzN4Rmc3RVZzRTR3Nm5RR21QUnZ2ZXg3ckdMY0ZpRldqNlVIeWYxZSsy?=
 =?utf-8?B?K09GM2VBTzI4RDkrQnRpMlp6Y3dRMmVjT3pMdVdoeDFsbHdjNHVTU1lvMjIv?=
 =?utf-8?B?a2lvcUFva0hqVGJJYm53MmVwbkt1V29PK0hGZkZGQWVacE5PNytjSG9uQks0?=
 =?utf-8?B?VXkrcWFyWVhwZ3JZNnNFZ1FxbDJFRjdISk1QT3NIRGMwTlZhdEViY0F3QVQ1?=
 =?utf-8?B?b2Fqekpnd05ONEo4YTN5L3p1WS83TDlULzFRb0FsVXVEQ1QveXR1UWVtT25H?=
 =?utf-8?B?VnlxN011QWdYQ1hhci9JZHZyK2s0WnlkYVVFeXIyemV5WHdNNklxUVJwRW9n?=
 =?utf-8?B?SWdPMGY4ME93Vk5CT3ROYWhaUUtSWTM0TG5IajFlMDduUmN6RFo0U2JYUHR0?=
 =?utf-8?B?UzRiNGo5Ni9FTG8vRnM5NUZGc01qRGxzZ2lPS3d2YmtDN3ZYTGNXcGZNT0RE?=
 =?utf-8?B?MHpQdmpCZXpIdllZVUo4OWZNZWoxNEoxOUEyNW8vcUloZFR6MVBjK1FYSGp1?=
 =?utf-8?B?UzZ4OVVQOHp0eTROWXBDNW5UYUtmMHJ3clVBSTJRa2kyVVY0azFnVSs0d25o?=
 =?utf-8?Q?YSmfcsxEXwvJmlLBp2kpVQ5S42ReyIfaeImd9ey?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6619.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eS9kTkhGd2Jhblg2Q3FCeHNDcjFMajBweGp1N3VNNkF4Yjd6REZKWGtSekth?=
 =?utf-8?B?Q1l2ckFWdkY2WnpZRXZYZW9IaGtRa1NQM0UvbGk1VS8wM2tuMUNDSm1oVE1z?=
 =?utf-8?B?elp2T28zSVBkOVB2RmJ2eUdaek90aUpLWmlld0taRk9tTmd6UWhYK3ByWG04?=
 =?utf-8?B?QlplbE9QK29sVkdoRnppMHp3WnRxeFp4emlWazNjb2tFcnY0SU1yKytxZzYr?=
 =?utf-8?B?bjBvMm5NZExRQXN5QmszaUZBYWlCTkx4VU5DZnljVWE3UGhMQytLUER4NzZ3?=
 =?utf-8?B?d1ZsdXovRTFFekpSUHNaVVdyckZ5T25iZVFwOWZlcFdzSm13aEFPRndkMWxH?=
 =?utf-8?B?a1NWTG5NWXQrTjhCeHFKcEpOaVRUQ2dZR0Z4WjBGMjZSUkpZZ3oveURKVTRH?=
 =?utf-8?B?REhBeGM1OE1OMjJBTEFZdXMwbDJtVEN4ZGpkck9Qa09kNXdjdUV6K2NRT3hT?=
 =?utf-8?B?Mk1wdXp0ZlJrQ0FtTVpHWnRzM1hwMTdFZkhtbDByZW80OWtvVlFUSGM0TnNH?=
 =?utf-8?B?blpDNXlzNXFsckRuMnZmSXFkdGx1Y2EyWnpEZGZOTlVJR0pMdFhhTVVMSU9o?=
 =?utf-8?B?QUVmM2dFcFNjWFo4QU5iL3dGMXZZRzBoanNYNWZVWXEvQnRoamFaRzRnT0k1?=
 =?utf-8?B?R0FyQXJYbEoxdHZPZUhTTkdPK0s0azIvaE92TmltU3FIWmZLTEtlcHRwdjYv?=
 =?utf-8?B?SlRHcksxSEdFMXFoU3gyaC9tTzdaR3lXSlpvd1N5STZKYWwvRG1RZ3FvVERo?=
 =?utf-8?B?K09JTTBCZHhVQTdqYVA3M3h3NmhFNHBHZ3FSOVlKT2xselB6ejJQbEJhTUVP?=
 =?utf-8?B?bFFEVGNRSC9YM1BpNnFKMWRoaGFjWGE2RTFsMXJXeEpOK294VDZ0b2kxZmU0?=
 =?utf-8?B?QTA1T3R2THRPWFo4Y2dkdFNpUDRtdWxqME5uUFZIQ3BGeDJwWXRuY2xOWVdv?=
 =?utf-8?B?UjNjNHR2cWRlMjViNnhCTWFpWFZseE1wZERuQzJFQTNxM1BNS0xOTjlTZG5a?=
 =?utf-8?B?Z0dpQWpTcjZTQzZZS2pMTkZhWm1mRTQ5dEU2VW9sTTRxZGxvZTlTUUNic0VG?=
 =?utf-8?B?bytHREtqV3h0NlM1MU53WFFJNW11YWl1MVhtQklrcmFsajRUbUFIOE93Y21O?=
 =?utf-8?B?Q2x0STBpK1U3bXFxdDZSRGJsc21rZUkydm55bWViTCtDcFp2aGp2VENMMUNy?=
 =?utf-8?B?NGlRU2syR2lvNmFVWi9jc3VTSy9DY1llNDhIemJUM3FwWWl0UTRxVkZEWVZr?=
 =?utf-8?B?bDNWMFQ5THlaV2xFVjVmb3NEV2ZhcmxXZENSdHVHbWR2UmJwNVQvcWdacEIx?=
 =?utf-8?B?T2xMUWxsb0VGTEd1R1J3RkZnS0hRc1YzTThCSzZqS29UQ1JvSmR6WWUxVllB?=
 =?utf-8?B?NVkzakpvV2Ntczk4TG1ZZk1YMEZYYU9oODEyN2QzWGZHVml0aDNVQ09Rak5N?=
 =?utf-8?B?OFdNUmxDMTQ1bUlJUGNkN2NpclViUTB6MkFVRFQ2akZYRWdybHJiSCt2c0JV?=
 =?utf-8?B?NnY2dU85dEFHVGt5NkE2RWZmQjV3TVFwYm0vL1BJMGdHTEFuRE90Z0V2cDM1?=
 =?utf-8?B?WWdSWEdaVm55alR4ajRHTmNTZ21ZZnhPWWl4ZEI5ayt5aDQ3K3kycHU2TllW?=
 =?utf-8?B?U0Vpa0xCSVhJSzBXNHVDYVdCY2VPRFphcktBUW5oekFjTWZlMVp0VnFKTHVN?=
 =?utf-8?B?VmZLVTFWWjYyWkNObUJxaVhpZk11VUdmYWViOXA3L3p4YzdwcDVRY0Qrc0Vo?=
 =?utf-8?B?eU5qcVJJcStrRUpjY3BOZVZpcEh2RW9FcjllcFZvOTgxWHdGdWhDb2NpbGQ4?=
 =?utf-8?B?ckkvQTFSb0FuSktJSnk4dzNCdjlVdjJFbUwwcVF5OTM3RjY1dVU4M1k0WGRT?=
 =?utf-8?B?VXZkOWRlWVlLbkRKeWY3S1Y5ZnAxWGpBdStmMm9PbFAwK2tSU1V2KzdCVmR3?=
 =?utf-8?B?TllWS2VmcVhNL0pBR2ZrUEhUb2xQSDRESXZtWnViWWg1K0dzVUVMS1QyNGl2?=
 =?utf-8?B?TUdzajFxVm5FKzNvd05Td2p6RUdweEhUT3BsWXdZZTlHS0lyRGRVZjk5U3Bm?=
 =?utf-8?B?WHhYQ1UraFlGTFhhd3BQejB3RGhnYy9ndFhVcldzSzF4ZmhpR3RpMG8wYnR0?=
 =?utf-8?B?cGFPNVVoMFNVOUFyQWRBVXlqQ0xZZE9DNDBsdkNxS1Y4NTVZNzZvQm1Zb1h5?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 959315c4-84d0-4862-8cf2-08dcf7714e65
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6619.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 16:55:20.1289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epVLCEGzZPij93NO6C88iFNJ5ZT4BKhVxSrwH9nINQbVhpiezhRkuCkqSQtrlGpjMqlISHEgkOHq1aGJJSwDAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8564
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

Hi Matt,

W dniu 28.10.2024 o 17:19, Andrzej Hajda pisze:
> Debugger needs to read/write program's vmas including userptr_vma.
> Since hmm_range_fault is used to pin userptr vmas, it is possible
> to map those vmas from debugger context.
>
> v2: pin pages vs notifier, move to vm.c (Matthew)
> v3: - iterate over system pages instead of DMA, fixes work with iommu enabled
>      - s/xe_uvma_access/xe_vm_uvma_access/ (Matt)
> v4: use xe_userptr->pages, instead of sg to access pages (Matt)
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---

I have dropped hmm_range_fault approach, because it seems too 
complicated for me.

As I understand it requires whole locking dance as described in [1], 
probably also with added timeout handling.


[1]: 
https://www.kernel.org/doc/html/latest/mm/hmm.html#address-space-mirroring-implementation-and-api

Regards

Andrzej


>   drivers/gpu/drm/xe/xe_eudebug.c |  2 +-
>   drivers/gpu/drm/xe/xe_vm.c      | 52 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm.h      |  3 ++
>   3 files changed, 56 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index 1bff0a2cfaa1..569c8d0b2ef8 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -3049,7 +3049,7 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
>   		return ret;
>   	}
>   
> -	return -EINVAL;
> +	return xe_vm_userptr_access(to_userptr_vma(vma), offset, buf, bytes, write);
>   }
>   
>   static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e76a6df1eba1..8fd9eed41fe1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3412,3 +3412,55 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>   	}
>   	kvfree(snap);
>   }
> +
> +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
> +			 void *buf, u64 len, bool write)
> +{
> +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> +	struct xe_userptr *up = &uvma->userptr;
> +	struct page **page;
> +	u64 left = len;
> +	int ret = 0;
> +
> +	while (true) {
> +		down_read(&vm->userptr.notifier_lock);
> +		if (!xe_vma_userptr_check_repin(uvma))
> +			break;
> +
> +		spin_lock(&vm->userptr.invalidated_lock);
> +		list_del_init(&uvma->userptr.invalidate_link);
> +		spin_unlock(&vm->userptr.invalidated_lock);
> +
> +		up_read(&vm->userptr.notifier_lock);
> +		ret = xe_vma_userptr_pin_pages(uvma);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!up->sg) {
> +		ret = -EINVAL;
> +		goto out_unlock_notifier;
> +	}
> +
> +	page = &up->pages[offset >> PAGE_SHIFT];
> +	offset &= ~PAGE_MASK;
> +	for (;left > 0; ++page) {
> +		u64 cur_len = min(PAGE_SIZE - offset, left);
> +		void *ptr = kmap_local_page(page[0]);
> +
> +		if (write)
> +			memcpy(ptr + offset, buf, cur_len);
> +		else
> +			memcpy(buf, ptr + offset, cur_len);
> +		kunmap_local(ptr);
> +		buf += cur_len;
> +		left -= cur_len;
> +		offset = 0;
> +	}
> +
> +	ret = len;
> +
> +out_unlock_notifier:
> +	up_read(&vm->userptr.notifier_lock);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index c864dba35e1d..165eab494d59 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -281,3 +281,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
>   void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>   void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
>   void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> +
> +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
> +			 void *buf, u64 len, bool write);
