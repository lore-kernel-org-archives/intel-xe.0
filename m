Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47A8606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 05:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ly18uW/X;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=AjnYiVsU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A082A10E09F;
	Mon, 23 Nov 2026 05:37:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC8A10E09F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 05:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795412268; x=1826948268;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vngXumbKWGMOJTU44kTiBH6EoTs5GGGhdqfBTJPSp3A=;
 b=ly18uW/X/6naTEwfOvK/FV3HW2L7jP22n9qGHpuY6Qk5CLRiWHg/RsKf
 G/gdlpMVyRURS2Sz3bDBqIPdshmofFw3E2jNmen4JFJHQo4vClhIWsA3L
 WLmA5pI6To4ZVyhmy1V7g4fHdflwFd1Q9w5cuIXSSUxRSoub7//54yexU
 qhUSSUein35+OGrdPWeClDvF5nG2Npy6e2+SdupnhZlr+UyTyif0KMphS
 F70JL7q1cHzMNa/6A56PYsHFykl4yarWVoweWotuO9Bk1IrO2ZDufzJI8
 jTYVSS4rfp5VGey57T0b5ardSLIq+UoVPFgJlIxoeeo4LgOGQb/tSUY++ Q==;
X-CSE-ConnectionGUID: S9vPetnmSO29AD5zqSaoVg==
X-CSE-MsgGUID: YKxEFR0uS+OQ3ZmC7wzI4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4116222"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4116222"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 21:37:47 -0800
X-CSE-ConnectionGUID: 9DUVK6mKTBylJT+h5sdMmQ==
X-CSE-MsgGUID: /fso+7jUREeezOBKEXIKZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11465083"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 21:37:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 21:37:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Sun, 22 Nov 2026 21:37:46 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 21:37:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJibBiBcezIx4rHPmuuGNok5X6gpuDe9gSXlf08pPApGzyoOv6miI03pu/Vilry0l9x/bZPH5qWeW7HzYeugIKnilMQL1UzmfTrYhA5kWjBUpUK8/jE7R8Du+RLeLQxZBaTiM4z8ly5YLJzaFNX5I/1Z588H+4g2jPc0/xeRJpMcikWGAE4CU1C82jbPUjOrcS+Xd3es62lvT8/0lyKzwoXCDLUKY2U8ivabSoN52DODv7rOYyD+eXAVM2ARGMOj0Bo8pRFd086ePlBgXnIJk9Sos6aEpInYrdrJ9TeUAYqmimJavRsz2L9Gx5RyXqM6kJw+G8OQ8/y37d/jkSEHWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8IpI84d51Rl84o4GwpeVqIV94QJnDbWvtD0VeoQL60=;
 b=qgcp+NuPW31CHLbmloc1pvd8hl3Fjg3422vUDhRUXqNOeZNii9/CeCRL+5zQr9co3iNooz+I+RoC1g2OLTpF77PGbI40mc8nFVTk2HXXvwFpKCwOPjU5LqqocGtQMvKfM0Hi80zbwOUJXeqmdNTe+pUy0CnBjBP7y3wLB5Bgh8Cet9/jhfyrF7iTEXZqj+07OMm/4AqZwQ3jVDe8nPDMH3ARP8+VEQHb6L1wofnWZfqQBeJ7uQ2xE2nrEFaIrNwMTkyBgi4Hd87ZXCg1K//LiUsmWsabXzfeT1HK+17Xnt5pT5GxnKimwTikVPB80BUct5BjlKovanPKxICug6VlRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8IpI84d51Rl84o4GwpeVqIV94QJnDbWvtD0VeoQL60=;
 b=AjnYiVsU08HLJONocYrkPJZY9Vu+eE1sNKRp5erj8fy5P8i/dEZ2rVBRtkn2pLt5YFCqVo2IoYf3pJVFqjG7zabwEyXysOjmtmKIgwcsztpnosuTxApcN9RAY/F0+99N9xdgyvRXSYP6uXI/dyeqOwyTlH5snSzhAB3Qyz+9j/o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DM3PPF1CEB6B7EF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Mon, 23 Nov
 2026 05:37:43 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 05:37:43 +0000
Message-ID: <e29e45b0-93c3-4dc2-ae1f-50931c906219@intel.com>
Date: Mon, 23 Nov 2026 11:07:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] drm/xe/cper: Make software CPER emission
 atomic-safe
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261119060019.2031897-8-mallesh.koujalagi@intel.com>
 <20261119060019.2031897-12-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261119060019.2031897-12-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::8) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DM3PPF1CEB6B7EF:EE_
X-MS-Office365-Filtering-Correlation-Id: 44e76a93-2e84-47b7-0e26-08df4923e553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|18002099003|22082099003|3023799007|11063799006|56012099006|4143699003|261028144727099003|261022105027099003|261022113327099003|261026140227099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: wpMABbPXnoMpSNqwZU7mpJZaHXdc3O524LcaDhQgiGe0+E92j+vm5VI8UyO6dab57oprPpxsSHAFP4hV1RiB10/d0db1j+gDiuElAuHhK6eIIwrw1DhTPrPp7e9d30oFDNaoijXEnHBEWYNFHZB148mDX4xTrfcpmOcg1xQpN6ZqNBq4Xw03pw0CYyRMJMlKVdRvqNnAF2JDQAY3/EpPARDA4f714hdszmYCZs/DTW0vm1vq18tNcP2iBAgjQ0eHPPPU7jJH0rHGeb0CLgdiOmoh9GEGBbvIaaoimqdRdof6wq5+4L0eXfTrqK7dGmQ1tufQmuubs/mLx/XWEhD+jtFolxoSi0LmhS3dphAjOmkZaa1tIzMVriJrJvPERrYrdSa5t3QRlvm6KbuI1FY69j+4IbkvYhi6ofP8N7LLuzWpLcHUvhCI/KVBL/Y4cRM13POPmcvH9JZzqAcdPLer5ZAQA3tREFA4B/O229SB2PyGT8LY/iHBVbtH6twfkI4pPYCnGOcDFV8AWkAnKGkg/hVRqIw2N0ZwiAHTp8jOwjPpdoigLs7v+ypwns8VKQhdxTJd40gk6paDbm5FDl5zPM1WaKT75KTVloT/zbq1IAeNkd/OIkni6nKIWDyUD6Rt47HCShIFnWJzyUbW7fEJFYLbrYxtTYZMqnQ2e6R5Dw0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(4143699003)(261028144727099003)(261022105027099003)(261022113327099003)(261026140227099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHdKcm1tK0NjTkV6ODJpSDZLTVdORWZXMzZwWmNXMVlzYlNaSXVHV05nMlpB?=
 =?utf-8?B?ZWliWDBoa2lwYXRJYnVkVkdDdWRYeTVuUmxGM01nbnkxejJ4MGp4ajBzUDN1?=
 =?utf-8?B?NXVzSDBiUURKQUNkOXF2VGdNZlVWR0VaVmkwa3JYdlJ2K3ptQVBVTkdCb2cx?=
 =?utf-8?B?N1BLYkZNNzQ5bDBHczhPUzh2MzFJUzIxRkZNZVFacGU5WVB5MzdBSnIwbmhH?=
 =?utf-8?B?elhHVzhlT0loMXNyM3VNRzJYME15VWNQc1pJbkJzbnZjbm5wenowNk5aUnZ5?=
 =?utf-8?B?Q1ltY3M1RHRCTU5lejRqREhDL093RXNPaWRJbks5MVdZRW94RWVUaG5SUjhq?=
 =?utf-8?B?Y1VUeDhVZWozNUkwWTNsWGY2eUZiQm82U3pNOEIwemhMWHpOclA3bU1KUnVa?=
 =?utf-8?B?OUhNTkVoMHh1dkk3UXBsMmcxemk2MkdiK2ZTcmZrcWJPclNENGZuajRQMm1Z?=
 =?utf-8?B?RWMwdzhaVVQyUFpPZm01UTJpbzgzS3YrbGRrM0VKWVZIMVB1ZWt6djE4ZG1i?=
 =?utf-8?B?dDN0dmxpb2Y2emJjOC9qR1Jya3VmNitzb1k2S1dSU2lyblJBejM4OVFteUE2?=
 =?utf-8?B?UnJsN3JTaHhwSVNPb0ZIVW80N0tkN1VyYjhXNzVqdXFOb1JOU045RjZkT2xL?=
 =?utf-8?B?SDJSWk5nVkxMN2FXVFRQeGdYdkxKUkxJWS9MVDFZcGozYmREeW5Yd0VoNXIr?=
 =?utf-8?B?d1hXZThsNU1BWmd3cVBJU0Z2aGxqbjdwQWhvVTFLcEduYk1vcTFjSmtzQURy?=
 =?utf-8?B?bWZ0Sy9Ud3FUL2dvc1NIZDZhU3ZBK3VmNEJJUEJYVHRaR3BKY1Y4VFBvSkpZ?=
 =?utf-8?B?M1BiMnNPQjZrS3lvaEVQaGVpVmlwUEw3aExRUmg5Vyt5R1RkMnVZNzFzS3dM?=
 =?utf-8?B?TWpEQjIrckdIbUNDR3cwNjR4Yys4VmJXbnpQVlNFQ0JKZTZ4RnBaNlBucDJi?=
 =?utf-8?B?VjlYdExSRDVvS3c4QVQ2c2p4UFJmeWVnVnU4SUNHQ053L3JrdFl5R3FNOWhl?=
 =?utf-8?B?UTA4U200NmpkK2pLa3J3MFYwRTBhUjFxdENiMGJsN2J1N2RxVm5WOGtJamxn?=
 =?utf-8?B?ZXgrK3lCeEdodjF3MkZpc2U5K0dleTZENmZkYjkweWNUZkFEM1I1aTRtSkY3?=
 =?utf-8?B?UHRvSnpQQ1lQVUhCRWczc2c5dnVueHowa3BISENJWDZ3dWFnVkpmekt0UmFH?=
 =?utf-8?B?R0N0MjdBSkRDbXVtUjhjUFprTlhDajNXM1FiRUpDaWg4S05QVCtKZFlZeFV0?=
 =?utf-8?B?ZWdWRFI2a0tUVUloQ3lxdFI2dDZKcHczSlFja2d2a0FsZlJINUZUK1JMV2RK?=
 =?utf-8?B?VFY3WHhVdmZTOFNxK08vUDR0Ujl5K1N2RGI5MktBUDhyZHF4MzdOdndwVnZW?=
 =?utf-8?B?bDA0eXRBQkEyRXBIdWEydjdOSnBwVk9uL1cxZXNQYldWZnhPL2liWTduejhk?=
 =?utf-8?B?YXJLeWg4V1FFT2pxQTBuUzIzWTl4Q2dvZG1xYjZlc25XejdxSlcydTIrcWhr?=
 =?utf-8?B?M0RuS3JaZTNTSnM2VjJrZnNnSFpvQms4RmtSbUxvZDNHUUlmamRQcGNjZFgy?=
 =?utf-8?B?ZjR6OE9kUUcreUlBd3JJdWlXaGREWUVQdHhuMTZsTGU5UzlNMW1nNFVSZVQ0?=
 =?utf-8?B?RHgxU3hXdjlHeW1tbGlUUmFlL0dsc1hBbk1TcjRMRGp6YUcwQVRZcG9Oaldy?=
 =?utf-8?B?cUhjZlZkSVBpSUkrWTJtdGhJemNEcE5SNUkwNzZJYW1iWUZybE5Nb0JTT05n?=
 =?utf-8?B?cGYycTY0dGNmQi9XaVdkU0dHeWtOZ3lOSzJDbHlBSkpEd3RiazRLb2labmRO?=
 =?utf-8?B?citsa0F4a3ZFSTh4SzI0UjRTRktWRC9tazV3OE5zNlRaWnZuVk1OQzNzS2Jt?=
 =?utf-8?B?bC9jNEQyQlhYdHZSV3psOWhTcHp6eitWaGlXbmpDZTNsU3dxaWhKcU5FSEF1?=
 =?utf-8?B?cmxpVjg5a2w0UVp6WDVlRHJ0bThiaXBqZXFxYW42ZXRrSVVtcGM0RlhsTTJi?=
 =?utf-8?B?UUMvWFdkUkpwVTFUMzh4aUh0dUdHM2V2bjZWcUQxT2pNZVVpU2E0MlozSTBW?=
 =?utf-8?B?K0JsTGtxM1A4WlRvMmJ6MmFhQStRNXRMRmN3TG9ibWtLRFZXZjJEMFZ4Nmcy?=
 =?utf-8?B?ckJYaFZsNDY3NjVrUHdzZ0ZKbmZHUnlyWmhIV2E1MzNCcnlkbGdlcXplWTln?=
 =?utf-8?B?OUVBc1pHWVYxcUhPRGxicGFRUlhJd2Q1ZWxvYXBmTHRlTXh4VmhoeFhDTUdw?=
 =?utf-8?B?ZGZkWUVLOFJDajV5WXpiZExVWklWckN2ZGxmbXBjNWsvVnhGc1oycnV6UjNV?=
 =?utf-8?B?TGM4VUFNa3grOTFsOTl3NFRhSHVpRXdRTU9vNU5obkh1SzJ1NzZ4QT09?=
X-Exchange-RoutingPolicyChecked: HHmp4X6rnXJHvlqXszb/Ypb5vI6Q8KdFPygS/s6jdy3gXkl9pqxW+FZt4UtFEm9UxG1FtUXe9esAbyQmxKsNaiKnrnLGnAlA96hI/96zYfuOoaVN/TDQfJG7VXWk2R4X7RWuuK/0dX4ix5LDuF9aCegVmHp5OsAfSh2Yox++HcZN/oNUm+dl0YjUPVRSf+thVY3PAtydRX635qS+q/LaIgkIPWIYEuuiLnYaJbCZXGluykGLXZ+2ZJf8aXY3UEKNdYEMxbijzf53/hEhfOWQ5Lo+nJL2lgMSfUSsHgzHNS/7ZjE/kJi/Gpf1ZelfWdKRMosZ+5ivklIHI1toKbwwLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e76a93-2e84-47b7-0e26-08df4923e553
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 05:37:43.0987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: da/x6LBhLywKT/yYfMIl7Hl/FwBaDQbXBOZUiWno92fvErM1bdrhyBNu8XeuI1bNv4Mtlb1xhtCXbEqXEzEvEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1CEB6B7EF
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


On 19-11-2026 11:30, Mallesh Koujalagi wrote:
> Use GFP_ATOMIC for software CPER records, as software
> SIGID logging may occur in atomic context.
>
> Keep hardware CPER handling unchanged.
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v3:
> - Handle atomic context when SIGIDs are logged. (Sashiko)
>
> v4:
> - Add can_sleep bool parameter in per_record_emit. (Badal)
>
> v5:
> - Move gfp variable where it's used.
> ---
>   drivers/gpu/drm/xe/xe_cper.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 558f58694511..d5ec5be90896 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -176,15 +176,18 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
>   static void cper_record_emit(struct xe_device *xe, u8 severity,
>   			     const guid_t *notification_type,
>   			     const struct xe_cper_intel_hdr *ihdr,
> -			     const void *einfo, u32 einfo_len)
> +			     const void *einfo, u32 einfo_len, bool can_sleep)

Please keep passing gfp_t directly, as in the previous revision. This 
makes the allocation constraints explicit at the call site.

Thanks,
Badal

>   {
>   	struct cper_section_descriptor *sdesc;
>   	struct xe_cper_nonstd_record *rec;
>   	struct cper_record_header *rhdr;
> +	gfp_t gfp;
>   	u32 total_len;
>   
>   	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
> -	rec = kzalloc(total_len, GFP_KERNEL);
> +	gfp = can_sleep ? GFP_KERNEL : (GFP_ATOMIC | __GFP_NOWARN);
> +
> +	rec = kzalloc(total_len, gfp);
>   	if (!rec)
>   		return;
>   
> @@ -230,7 +233,7 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
>   	xe_assert(xe, is_hw_sigid(sigid));
>   
>   	cper_init_intel_hdr(xe, &error_class, response->timestamp, sigid, response->value, &ihdr);
> -	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0, true);
>   }
>   
>   static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> @@ -261,7 +264,7 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	char *msg;
>   	size_t msg_len;
>   
> -	msg = kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
> +	msg = kvasprintf(GFP_ATOMIC, vaf->fmt, *vaf->va);
>   	if (!msg)
>   		xe_warn(xe, "Failed to allocate CPER message\n");
>   
> @@ -275,7 +278,7 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	timestamp = ktime_get_real_ns();
>   
>   	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
> -	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len, false);
>   	kfree(msg);
>   }
>   
