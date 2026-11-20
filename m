Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EE460A3815
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OqyRQgbr;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=f7lZSBN2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4701110E169;
	Fri, 20 Nov 2026 07:22:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FCC10E169
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 07:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795159318; x=1826695318;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xlSrOOGzRh4EsKfi/qGGBxGVp5ZFa2DakVHMVanowsE=;
 b=OqyRQgbrBkkWYf4KAg9LFCsF9xJzB0MACmlK55vwA7SgsLgvFHSNKbLd
 FAI3yaEyG+FpU8ZOwFviPTCcjM5tkrRQ5X57iyxZkQuR+iVvkJBvKhMDE
 YoQdXJBObD89dJei6AmaBvzlVRJ8RDtlI9jFqsLWhfCLwrzf6h+2d9Q6F
 l8+b7PaXLAyQwDq306ti6xyEbVibEA0e/lwFkaB70BtTTeMkGpRGY/mKI
 mUVBodds98EUlQo3Jr5cpimMHIm1M96tPtO+wB+zVc7kCjCkrSYbViC5M
 YzTa+31UjLG1gGa4VCGM9Mh+kaSaP22jj2JW/9m7Hf2CQxVV5YL6zrZJe g==;
X-CSE-ConnectionGUID: aWBHWodMSUqrZSJw10dPeA==
X-CSE-MsgGUID: Hj0PlUx6Sb+JX9ovqTrvAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4076917"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4076917"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:21:58 -0800
X-CSE-ConnectionGUID: UivE9nHXQAK1c/cM4piDwA==
X-CSE-MsgGUID: HwzWO1ncSyeGruKrDJXqQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10450938"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:21:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:21:57 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 23:21:57 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:21:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djPy8GzqoldM+6oO1g5cZVpNBVSFAFprFr5frr52Hzooq30xMk0Ix84q2yAPfyGJPku+h4cUHz7HbjTv0UTWN4GoGJU+kn8iXqkMMZYApZ0sfyEKiV0W71kgGrsWEoSg9qnBgMYH4q/FrDC3CNa2K66cuoggGl0iBZ8upK74BQP7TsOStLTU22m9yItBtSmaUKbQseAm5B8n/XoCySpeTIcaSKoyT43KOCrUpQpfAjtY7jGZkTrP4yT0I1IRNT9rgKxgPBg89ZQDKREJ75sg+wFZjr5FlcWxnxNl//PYREWV5sbj/5wEw5xOF5+LbO3aq9e449cZaE80oDrDhM3t4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ihqyl2U8rhN5RaTTcbPDROViKjjdCAc+BGFc6pvqSXU=;
 b=GyQCoVeIEh4Cfk1aKiTotwYy3SGL4Sc+zzJ82Duac48itmUefN2z65bedaRZSwG0oHxJMfTgYlz536yT7kh3QkvBQ4BiwTPKyb7nEWJdGbaWwxlLl+qUUNY8dVrjYXqlOv4YdA6r5sh4Fb8khDMKKCbAxcLNHXEQeQVw28t8iWMDx00ZDYs4CdTs6OEg5zXqMxdg5tgjv+aZ+8GR1bPDJLfhg58CPGkqaeO3nP3OTcw4GtsNte9oKlj7//++Kh/6cWBXkOSgAfUHw8b1i5VEzEoMa1tzbPvwu91k2PDXdwXp/V9qPmV/qNt0orZeCNhIvv3tCePatJHIDu5/Nz0+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ihqyl2U8rhN5RaTTcbPDROViKjjdCAc+BGFc6pvqSXU=;
 b=f7lZSBN2XrNXl7Wb5mw6NlICC1ufUeQcgj86JeyyJo67MzDq9vUo4gyFlTSvHKXSRtdL7qL8PQwWr/f2W+jSARuKoov9hHEAUSFasns3ZGPWAfHBURYnjRtPzyWqKl1l+iG0wZeJdpGL3+cgn6NW+amLNrBtVMuop9YX2YCMOPk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by MN7PR11MB170846.namprd11.prod.outlook.com (2603:10b6:208:5f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 07:21:55 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 07:21:55 +0000
Message-ID: <a92cf949-2f2c-472d-9161-d948e8b7244a@intel.com>
Date: Fri, 20 Nov 2026 12:51:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/8] drm/xe/oa: Ignore a HW tail pointer outside the OA
 buffer
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <harish.chegondi@intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-11-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261119002737.3899877-11-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0260.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::13) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|MN7PR11MB170846:EE_
X-MS-Office365-Filtering-Correlation-Id: bef7b4fb-0182-4e4f-a104-08df46d6f4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|261022113327099003|5023799004|4143699003|11063799006|261022075727099003|261026140227099003|261022105027099003|261028144727099003|56012099006|10067099003|261026121527099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: +F+IowLiPAgobFrpzWBdHu8RHF8W1JbIQ9pQNdvQCflBrOlMcQdaa3QVi8Yf15wRPSaz+1aC/1QpctT9FuGZ5Ge8COY45yo5GLrMsn/o1ERhTUNH7GnoXi7BFimuiar3oniXiNPCnTiHs05PYuVAY3fGmAmso5NEu8d0KZZaiLkH9arsgkLCzga9sNyPOdw+OgdBKy/KhJdBKMQsYZ5ZjQVIT0tFk4gXyhfqhlzAaxrSwvzkvXG1uJdI6kbRGfdLVMUabKQcbFf9R79q/nQaEjJD3YhMTGiDrvt1fmQ3pf60lxj8n3ey6JlNeS5kqT2WF+WVmZsDW2sXPbLcpfrHSGPBslpEjCg/aJJeOivB6ooPGE14jArFPftf/pQc0g8yZxQO9qw3oCsDk7JrbBXyFINIWQ37c3ONGPFgBBTU4X0EXjNVRDwoH5vMsRn8bDHpzluhDChUK8K0m+Ihag/UdYHxJJy9KjzE/VXtqY69PWaJRW1LCdFYZdPIxbCNgnab0zrZHz+dZIFb5vq6KHNp9YIZo/CllBx5dZ+d7DmH6qL7nACDuSP7hqsKwGwZ0fB+v/stRhwG5WnwJ8wVl70CQ4kEYyyckRLMs/gOx/l9gyrkvbXjw2vqhbQRBIOLL1tw3D7aR5udxPJHvltRiOTn6EwRxX9Saoot2tAp2+YKzNM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(261022113327099003)(5023799004)(4143699003)(11063799006)(261022075727099003)(261026140227099003)(261022105027099003)(261028144727099003)(56012099006)(10067099003)(261026121527099003)(261021121427099003)(261009223027099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q24yUXhjbVM3ZHNJcDlpSDIzY0hoam9nUVA4bnovMkxxWHZGSFM0aVBRdTFu?=
 =?utf-8?B?anVnS0g2QjUvV09kMkVadWtmalNzazZHSlJqRDAzM3NDSjcxTTErZDZUajNi?=
 =?utf-8?B?SHBpU0VTd2hYWTF3S2hscDBheUVielhHd3RsUUZ0OE1seHNIa0NXK2pXNCsv?=
 =?utf-8?B?cmVFVW8rcFU0eTRrOVpCU0xYcVNFK3QwRVVDRllQMWR3QmVVdVZYUHhLYTJI?=
 =?utf-8?B?ZXNacWdieFdHVEs2V3B0YmxYL2RTUTRyTWNIYUtuQ28vTFlrNnAvZlVFNUhO?=
 =?utf-8?B?SU8raldTcGM4eGcvRXE3cGgwUVFHRVl0T1lxT0VoVWlXU21mQ3BoZlJ3ckRV?=
 =?utf-8?B?a2tLcHh1WC80c2JSVTNtN0JuczVzV01FS3JOalFoY0d2NEoyR3R5QTlsUWpZ?=
 =?utf-8?B?ZWwyL1dXbUhtM212aTJSVi9MZ0tuNUtqc2piL3NDOUJ3Y1lTRnZhUjQyNG8w?=
 =?utf-8?B?QlViMnRQR3ROSjdHUW8ybWRKRmMvQUIzRVVvTUZwSC9tWm5NM1pwaUZOUnVZ?=
 =?utf-8?B?TUYxZnFGbldIc1doRlN5SWNpVWNjNzFUdDV1RmxiU0JjYmJNWGo1cWR4d0Yv?=
 =?utf-8?B?ajhzOUVXYXQyQVh0VGJmTERYbjNxckxOS1JXVXNLRW1rREdqVnFVNUlEMDhn?=
 =?utf-8?B?VXIvYndqZXR0cmc5djRVTGhiSEY0ZEZsdkMyS2dhQjJmNzhaTlYzN3c5VlJP?=
 =?utf-8?B?cTVYNWRlWUlWK1V5bkEvekZkZ1JLSjhyeGRaSUlqYnA2YjA2Rms1WUJZK3NS?=
 =?utf-8?B?ZXlXenRXRHNhc3NjeXVYeDl5SXFTTUl5MGZZbE5ralhUckswR3NZQTgzUnpF?=
 =?utf-8?B?YlQrMUh1RzBuY2k4Skl3cmNFKzFnZUx2MUtZbmZIaFBaUUp5M2h3TTVDOC9S?=
 =?utf-8?B?ZkJmeDVYWUVtM2o1bHRBYVY0dm1zdi9INmIwTEdoS3VIUEN0dkFnQkFsakds?=
 =?utf-8?B?QTlXTVE0ZzY2TVVoNkkzRE5NcU12RmM0akxwMFpuUUI5TjRWcTcrQzFlZ09I?=
 =?utf-8?B?aUc0bGFkcDQzQkZOanBRUGw5cDBDRHd5SldCK0hMSVVkNUwwSSt5aStDcG9j?=
 =?utf-8?B?dEY5bHFHanVORUpUWlZHTEZzb3ZSS0FCZCtGS3RRTmFHVzMzSlVKWnRPcUhB?=
 =?utf-8?B?bHBPTktmaXlkSjZLY3RsSDV2dmJQSm9JMDdzMkx5N1A1UTd0dGt6V085RHEr?=
 =?utf-8?B?VGNDemU5bmN3SDNRZzcwNUp4UXNjS0l5T3l5VnBuTTQ1UFBWZldmYnRHUlpX?=
 =?utf-8?B?Z1h5Mjg4VXJVZlROdE13SjZZUklzdVhTVm5mSFRVZmovSFBCK0V0SERZOWlY?=
 =?utf-8?B?T1FEVVJTZVNEL25leGZEZFlwMFdtSGp4STJGTTFHM2Z6TW1XQ1UrN1FCbWQr?=
 =?utf-8?B?RkcwR0tVZG1lNkw3elRpK0xCcFIxR3FjVEFGVm9NYnVKdjZNUUY3dTI4OENr?=
 =?utf-8?B?bXdUME9ibk52TEcza0NENUFBaXE4TUhUMjloRm8wZEdqNW9VcXhtdk9xMVhV?=
 =?utf-8?B?Sm1selRUd3pUeTZ6TjBkUEE1MG9odGNobXE2bTZReWhSN3dVdnNrODlXbk9a?=
 =?utf-8?B?TytIc09oZGtySkhUbi9vaDBjdnJxRDNPWXhJZVpEcUlTMGhmSzZXL0N5TU02?=
 =?utf-8?B?Y2lLVmRTaXZKN1hwaS9mby9jMlBjRlYzRFBzbGFSakQzQVZoaDkyeis1dHQ4?=
 =?utf-8?B?NnNmK09WZVBSNTdVbTk3bFA1NDJGR21tT0ZKUjI5TDhrQTZyTFo0NnhkYnpi?=
 =?utf-8?B?NjR2Vi9DN0RwaktKbWpFclRyNDFpd2hqTjlCeWt5QnBNYVN2RnJsWTZETUNK?=
 =?utf-8?B?TEMwSnNyM1o5SFZ6M0YxS3VnUHhLOUNNeXFUSU4vWHkvSnhObmdVOXdEZXJX?=
 =?utf-8?B?WWZ0T2hsWGhZWVAxbkRnTFdCZXVMM1pFM05OQzdKWWkvbVFTMUs5dVYyZkIv?=
 =?utf-8?B?UWhmOGtYRGYzdWExa0w1RVEwNm83ZXpBbGd1V3JGR3FNbHRtdSsrdERIZk5a?=
 =?utf-8?B?WGFhelRWQUN5TDd3OTl4SG1JSElwcytpMGVrb1FzUWdHQU9sbEJZZmJ5dTk2?=
 =?utf-8?B?VmJ3WVJyZjVFTzdaS0VkaklCdW9pdXZVd2p0R2RDZzNEZUNXdHhrZHpQMVdU?=
 =?utf-8?B?QmJIMFU2WWpzcU1BY2VvdVlhOXVSZ3FZMXlkRk9PakZWTHhKZVEybjQzT0o5?=
 =?utf-8?B?TUZtYS9qaHhBOU9PNXlhRC9hdjBnbm4yemMzZ3VDNnpFdWZPeGwvSkcraU1S?=
 =?utf-8?B?MktvV2dTUm9ac01ma0JzNm5aWDJNRXlPd3FCNTVuOXEzNzRKK3psZlJQWjFY?=
 =?utf-8?B?MURVa2ttcmpZZTFQMk1zd2VVaEFiMHFjTUN5R2VrM2NPV2RZd0NFZz09?=
X-Exchange-RoutingPolicyChecked: WMuiN+QahaO47fBZxJ//ugjijWErdVCIxaWW+8ebQIKshrccMHkb0xDabNgJInbPH2E3LjxqxO8a2nGH1yWASBbf7VZ4H8wFOXX2sawQ07s3U2aDLQiFPDV6Ep+p2wKqNn6HddTjYLnaR13s63ttvVsAWjrDtmU9ezokIoy23d4XyGBpyfBix1RfRIeEWYXM+RMU6t44d4GdVYI3dcLKq4o8na4WKVOcEClL8HkSNdmhA+RcPKEFEgDd368ALLqgIMMPNW2F+mGZN7NpSqR1IN8FBOWJxEDaIYX62TF8LQasnUJTA2H4cafElDeIsOC3zkHOmgSQ7YPQkCcg4OnfiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bef7b4fb-0182-4e4f-a104-08df46d6f4d6
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:21:55.6458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxRVCFK4e4unI5ZOZXq0S1YGL2cfQaK7v26VPYBOXIGxycGJ9NFXEuOOns2CHiUUo7pZ9yFPhPfqUPEBQmvHruXBqcfp8QWEZra7melI1d0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB170846
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


On 11/19/2026 5:57, Umesh Nerlige Ramappa wrote:
> A device that stopped responding, e.g. during PCI error recovery or
> after a surprise removal, returns all ones for the OA tail pointer, and
> a reset device returns 0. Subtracting the GGTT address of the OA buffer
> then leaves a tail offset way past the end of the OA buffer.
>
> Since xe_oa_circ_diff() replaced the masked OA_TAKEN(), nothing brings
> such an offset back into the OA buffer. xe_oa_buffer_check_unlocked()
> walks backward from it, reading report ids and timestamps out of bounds
> of the OA buffer mapping, from the poll hrtimer in hardirq context and
> with the OA buffer lock held.
>
> Ignore a HW tail outside the OA buffer, as if no new reports landed.
>
> Fixes: 3a1fc394ba85 ("drm/xe/oa: Changes to OA_TAKEN")
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

I am unsure about the Fixes tag cause of the Sashiko comment below, but 
apart from it, everything LGTM, and with that,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_oa.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 838802482ada..fdd2d11ce4e7 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -270,6 +270,15 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>   	hw_tail = xe_oa_hw_tail_read(stream);
>   	hw_tail -= gtt_offset;
>   
> +	/*
> +	 * A device that stopped responding, or was reset, returns a tail outside the OA
> +	 * buffer. Don't walk the buffer from there.
> +	 */
> +	if (hw_tail >= stream->oa_buffer.circ_size) {
> +		spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> +		return false;
> +	}
> +
>   	/*
>   	 * The tail pointer increases in 64 byte (cacheline size), not in report_size
>   	 * increments. Also report size may not be a power of 2. Compute potential

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

