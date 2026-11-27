Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32811606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 17:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qw2ux6to
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D62112C61;
	Fri, 27 Nov 2026 17:29:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01B2112C61
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 17:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795800541; x=1827336541;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SIe7aPWEf5iGzJUnLX4SB6+gp7ZMQgmzlVH3oL/VplA=;
 b=Qw2ux6tovNx0C5Dg8dHoC6EOuAmkLMxBXMxnseXV/jvmWB82fcmnIWjy
 yKbmYAUPdAhgwJv4W+a+uU5ozE+4JrPxp3hoOQl4q4Zt4t+u1mpkemMvx
 e8BGugOsB2dSnpfKPsA28GPRWhmBLPHsb3hBDdDYy4lhXGr+6THCbaZFi
 mvHHqxSus1gYFh8kFAWUr5Me1+tVIy+F8cWllPulEWjULo4sUBNTukhpJ
 Yxz9YS01AXq6DaybQZCCgCJ2tXneNgl8iACE5ECuhpL10bhOOzQPgJgj+
 /VrFMFvKllvppTbJhvLzwKlQJYHm21mJrjvU83wh7gN1WOYWyG+KzJmqw A==;
X-CSE-ConnectionGUID: OQdvbXZURvyJJFY29INfJw==
X-CSE-MsgGUID: 03ZcziXeQya5RWzxgUPLcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4682203"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4682203"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 09:29:00 -0800
X-CSE-ConnectionGUID: Z+rxlW3uTZeizBPrEOgr9g==
X-CSE-MsgGUID: SKw3ftYmR9WUQUCLkSCsnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12352804"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 09:29:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 09:28:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 09:28:59 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 09:28:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPJzKDUKJqYu7lEm+vxjdX+pCuQ/o3TuaM/ctOM+6C7p4/joHmABpMe6buUqDMOUjxKLSApBHqydquJgADLB6pVceHJaM8Y7OSIaA8uUYBjw/zu9/Q3N2zqXcdnM/QyyO3HwiIFe9xPSYtYsl1eIxhG0FEyXCvFhkNgzQ06ZtHtSDSE5vAedGTMWXqk/NiEPqluy0j+ls9uZ7VD/Nx2THATilByuCYTv/R/g/+MoiWhP+ZPvqBAbkURIcDLrVJikEnly9xetTNG9jPC67kHXUvUZw+/cvrWY75pFZuuRzTsrmax6ohF4TwMIIb35VYl0IyLYh1/2VrnUO+Znzgp+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MAQvAx/rytZ6guuwyHQuoisPhdh8Og3vT2w4XDUtCE=;
 b=u/lR269oYbINXRLyJa/Wpn5PTo0Xsm3J2Tu9YqtYRMicSwJFykQa7AdYz3e/uBFXxDNUaICKYppzPXEEpoP7wyweXDin5+qZ+ef8MblUo5yIAy6VvIw6O531swlExIm1t9vjt1hSYPx/I7DOrt/3ckULr/z+JaUl5m4tTm231HISFSOSkJkeeH/ggKGaVT3aXQNAK+7eyzWL1iOYp2E/D0fNJAjSo2xrcgvoiiEA4Lmkd2IrRXNSYxIc4XhPD+mqEZhfQnJ8iPUzT+cyqsq08sHKrFigT7pvT5B39gxAJ//vU6zun6er68XBNLMZdUiSLo9hPKmywzYXw32Kkc3g1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by MN6PR11MB8169.namprd11.prod.outlook.com (2603:10b6:208:47d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 17:28:56 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 17:28:55 +0000
Message-ID: <2731c1a5-f303-45a2-8d27-40e1e39c09b7@intel.com>
Date: Fri, 27 Nov 2026 22:58:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] drm/xe/cper: Handle CPER allocations in atomic
 context
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>, <daniele.ceraolospurio@intel.com>
References: <20261127092914.2176025-8-mallesh.koujalagi@intel.com>
 <20261127092914.2176025-12-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261127092914.2176025-12-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0044.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::8) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|MN6PR11MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: f2dd654d-e4e6-44c4-b28d-08df4cabe9e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|18002099003|22082099003|4143699003|56012099006|11063799006|261022075727099003|261022105027099003|261026140227099003|261028144727099003|261009223027099003|261021121427099003|261022113327099003|261102123227099003|261021123027099003|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: R82Y575ymbbo4L3eXgPCGTqoVtfUuJsfEAiEO5CfRE/Bhv9c/GGKp/+Io/D0q/iO3nqJBTq07qmcoJl5IZcqKNQaa3h3g60ypSkQEsTNsL2A3Q81EW/jnYVcmvLtizGWIR2ugtZfMPJmn3uC48R2ieQk4f4NvizO2BoZxS/d/BeTAHSbitI0oivHn6zVO1rEBQLHtOS/5xkxwkd4Jb/2g4PDnWtMLHGXHH5LuGKLu0DtAzR81Lb9vpRcTN9VNB8OH1p7coKKJt2HwJCu3vpwPF0pJy8JJWkubF7/1SuNBfPWlwEebZ3cBVrmUakXcfu9j/fsJvM9+z5/mzCjPTh03c9UR+zJBacllEnLKRj1L09kWT/9oKKqADAABVPBqN2k+zQW5Si/XdXJNnsON930QDmKWz/1vapu4pXZtaiGA2TgUjSWUnN3INOR1AEmRFPhPXxgDQE2pilh7B+Wir4V4aqAEJDMUz76xw2gKK4FKDHIQtSDUCNuYG4YO95j12hgZqFWjnYBNEGCKf1gijh5EWUpGXfXOEEkEsDNe+8i5iKXrP79rh94D3S1D/fw32Ptt8CI/uG1bhZUCPhk+t+nh395+zIvDS2UjhI9LxhaYRsOzx0ltPXg1WZXSDEGMkcsK2GcpDMIUo0ttApOw31aYBqAnDGMZs49QHlT2We1x4k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(261009223027099003)(261021121427099003)(261022113327099003)(261102123227099003)(261021123027099003)(10067099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDEyL3BQMEVubERwZ3h6Vis0OEZNeDVDc1VMak1jTXdaaTlOVmQ5L0NnaE9p?=
 =?utf-8?B?eFdrYzB4a2NvU0dLeHdvMUl0cXNGbG96YVdhTXlHdkJpVVQwNnlQaTVuUm1X?=
 =?utf-8?B?MlVQSTVZMjZEN3JweEdUb2ZNK2w0Q1R5Rm16SjRNU0NPbHFTMTJ0bWNHekxP?=
 =?utf-8?B?Q00rVndyNW5KSjhrU0c5SEpwNldFcXRCYndhRkw4eXZaOTJqZFZzNEpVMDFN?=
 =?utf-8?B?cHZBVGsxelpubnZZMThiQ1AvcXpQaytvbEVvZjQvd25jV2YzYTJ2UEd4LzRI?=
 =?utf-8?B?UG11R3FiaUZjRGxGYWZ2SHNkenVLU0QydlBDQ2FrcC9ONE1aNitDcTBKQ0Iz?=
 =?utf-8?B?OWhIMkVJa3FTeU9XdmJyVWtXUjJ5QXZBaGVjS1puZXUralRsMGg3UW9Fb1VC?=
 =?utf-8?B?N3A3M2pkM0ZwN291QlVXalZCUmdkRDkzR05TRll0WWl4ZHM5bTVOdDdmWGpU?=
 =?utf-8?B?ejd5TWtNS242UjlVSitnWUpkSmZxWGZ4bGR4WGcrcmhiWHpENlJGOE9YTHpO?=
 =?utf-8?B?TW9OYzhMajFYREQxSHFFVk44dklZeHo3c1FhNEdKV0kvMkJJOWZYQXBKc29y?=
 =?utf-8?B?SUFxTmpIa2lDTzg1NWNWOWJYcHE5WURQZ3RjRE1Fam9YS0k1RWRkd1IwWGc4?=
 =?utf-8?B?dU9jNDhVN0JmdHgybmRUeEx3U29SY3FyUjRwSlo0Yk1CMGIrVXNTUjFQaHFX?=
 =?utf-8?B?Zjh2amo1VHY0cXV4YkhvdzZRWlgyUU5FZVd2eC9jYXZQb3MxSHlnS3gxZWFl?=
 =?utf-8?B?bjJkc3RiTWFWWkZ5L1NzSGlHTW1DYlRaR1dybTF5ZTF3ZlRFd3FPcUdiUzB3?=
 =?utf-8?B?ak1NWVpsYlh5eEh5Y0xLUkRib0VIU29QMVVVRFFUSnJVSG9ORDd4dldlSVk3?=
 =?utf-8?B?bXM5MHNoTi91T1ZCenFMU2hsdnNRUk16OVR0OFFJZVhEM09xYnJxTTB0Vkdk?=
 =?utf-8?B?VGFCREdvdEh4QWlsM3EwVWlRL3pPUlpxT1RKbzJnbWtRNlFoek1EOHplRU1z?=
 =?utf-8?B?aVAxb1BYR2JnQlVEYU9nYkFTT21jY04rNEN4L3ZnS2FMUDlLek40S2srUkVl?=
 =?utf-8?B?Vy9yVExXQVRFK0lqL0p3dmFuS2VqWVI0RXlWbDExZGt5cHlXOTQ3bXhlSDBr?=
 =?utf-8?B?RFk5U0IrQjYzTGY5TWlQMjg3azJrYVFMcGpIL01FREtQa2dpOEdvY3lKQzQ2?=
 =?utf-8?B?dGRqMW0vY2Jwb2MvWlREMWQwWFJwMkUxQVhsLzVOR3Q0eGpkVmhidW8xMFhV?=
 =?utf-8?B?M2NVMmdxSmhkKzRyakZDZ0JLZXl0L0dqUGt3eGVxWXVXbWtlbExkL05zWVhM?=
 =?utf-8?B?TlRyRmUyN3pWQ1BOOGJoM0RqemlaOTVTbjJJdEljaWh4cHo0elVvOEVsTGk5?=
 =?utf-8?B?REdYcHlRaGRFTDRsM1dJaUo3dTJOTm85aCswbGFUSkhYcWZuaW45QUp2SGZr?=
 =?utf-8?B?TVdlMEM1bXozNnJCRklSUVhYSGRUOEF1Lzl2MWpQbFFSRUFibndFUHIxSElr?=
 =?utf-8?B?YWY2bWNyS2F2dFpCOURwbno3d1E3eEpmNjdmNy8wdGwxaG1jZSthbWdZU3Ro?=
 =?utf-8?B?VEo4S3JKSFpXRkUwa2FJdG9ZWkZkbXZnTm9BdXZZcnJCZWpCdW1ldHZNRnBF?=
 =?utf-8?B?QWR5NzRnVUNkSFMycXFUSUtwdHRLc2toVlllRWQrQy93OUJNSVRVSTAwNldM?=
 =?utf-8?B?dS94bDN3WXVkTXU3S2JYbmJNTzVkZ3VEVmQ4bXh3YUxDelVFNzNSeTRRY1oz?=
 =?utf-8?B?bkFpcXNiUndqMUNlSUdGNzB0dk9NeWkvUWN0Mms0RWEvdUNUcjJkemJLLzB3?=
 =?utf-8?B?Y2EwWG9zUW1JeFZialJRSGVNbnZ1d3QwT0tzRmNoVnVWRHZ1S0FROUhXdVBw?=
 =?utf-8?B?V1Y3UGUrRnpZbDlZZ3pwNjBXUUNEYk5kUkk1ckg4Ry84ZzcvM2tQYStwU3p0?=
 =?utf-8?B?YXQ4VGNaRllhV3NWczEzaEVKZ1V0M09CNGpKbnhlTnpJVXVESjFuUWxvYVBU?=
 =?utf-8?B?WTMwVXFITEgybFduQkpFNXMyV3hYdEhlSDQrZWxXK0FJR1dCVzRxc05rUEE0?=
 =?utf-8?B?Q2oyZnlCR0JmQ0Z6L095ekRnV0lkb3Y3TmZ1Y0daRlZCY2s0MHVtUlhsRmRO?=
 =?utf-8?B?MWFVR3F0OVp2eEtobnFuemVwc1JTQUpXb3dTRkp1clUrWk0vVVJPNzZyYW9X?=
 =?utf-8?B?dFNnVXo3a3lzUGpyQTNmV09uTTVOeE42YjJPZ1NJUkFaWnV0b1BVdUtxN1BQ?=
 =?utf-8?B?MU5yU3BvZnRNL01lL1hoN1k4dVg4QmlHM3RPV0c0WnN1YVdpSmFMS1lhWGZ4?=
 =?utf-8?B?RzZyait6RzltdzltT2NZMU5GQTJ3YUJNTVZxaVR5V29uNkdCSkVIQT09?=
X-Exchange-RoutingPolicyChecked: Dui6mT8XA9ET+t6j88vZzQ/t37zRFvqdLd5gBvqTHBoR1zstOnPR7PIQYms0QoxrMuz4fJ1D7UU23otmHoAJu53FpSlWRUAPXwR0P2uUVpQL8zaPhTMV4PrbWNXSNU+1MqxxG1w9fPYwzASsA1UttXH4n7xAnAH7hiud+Xvm2RI4im14CsGlJeD+giFfkUxxWfMuaWfv1mlYrYgpaLgD8AANyK7vg8JpNZlsXczvA+M1iabeaYDr5cRL1CwloiPw8ZHp8WfR1pr6/+4j5v9Bo54nipkb8RwWr9Kq+pZ2jKakwfdgzaZi3iOynVoyJhjliRx6awXaYIUm6MY81+DR2w==
X-MS-Exchange-CrossTenant-Network-Message-Id: f2dd654d-e4e6-44c4-b28d-08df4cabe9e2
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 17:28:55.8247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itbaLPWJE7fGKFpPlzF6kqBHH35NXU/f/iS3nxaXasSbuwsteFu4fLKxeAZZdlHxVpMBBr/qQH4fyQIL1x1zrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8169
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


On 27-11-2026 14:59, Mallesh Koujalagi wrote:
> Software CPER records are emitted through xe_log_*() helpers. Those
> helpers can be called from both sleepable and atomic contexts, such as
> IRQ handlers or while holding spinlocks.
>
> Software CPER record generation uses kvasprintf() and kzalloc(), which
> cannot determine the caller's context. Using GFP_KERNEL from atomic
> context may trigger sleeping-in-atomic warnings and potentially
> deadlocks.
>
> Add a GFP argument to xe_cper_emit() and introduce xe_log_*_atomic()
> helpers. That allows sleepable callers to use GFP_KERNEL while atomic
> callers use GFP_ATOMIC allocation flags, ensuring CPER records can be
> emitted safely in all contexts without relying on a single GFP_NOWAIT
> allocation policy.
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
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
>
> v6:
> - Pass gfp_t directly. (Badal)
>
> v7:
> - Update commit message. (Badal)
> - Remove dropped variable from xe_cper structure.
> - Use only GFP_NOWAIT.
> ---
>   drivers/gpu/drm/xe/xe_cper.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 9161f2b52e9b..10a4085d47f0 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -183,7 +183,7 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
>   static void cper_record_emit(struct xe_device *xe, u8 severity,
>   			     const guid_t *notification_type,
>   			     const struct xe_cper_intel_hdr *ihdr,
> -			     const void *einfo, u32 einfo_len)
> +			     const void *einfo, u32 einfo_len, gfp_t gfp)
>   {
>   	struct cper_section_descriptor *sdesc;
>   	struct xe_cper_nonstd_record *rec;
> @@ -191,7 +191,7 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
>   	u32 total_len;
>   
>   	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
> -	rec = kzalloc(total_len, GFP_KERNEL);
> +	rec = kzalloc(total_len, gfp);
>   	if (!rec)
>   		return;
>   
> @@ -477,7 +477,7 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
>   				    entries[i].einfo_size, &ihdr);
>   
>   		cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
> -				 entries[i].einfo, entries[i].einfo_size);
> +				 entries[i].einfo, entries[i].einfo_size, GFP_KERNEL);
>   	}
>   
>   	free_info_arr(info_arr, num_entries);
> @@ -511,7 +511,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	char *msg;
>   	size_t msg_len;
>   
> -	msg = kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
> +	/* TODO: Handle xe_log_* helper function for atomic context */
> +	msg = kvasprintf(GFP_NOWAIT, vaf->fmt, *vaf->va);
>   	if (!msg)
>   		xe_warn(xe, "Failed to allocate CPER message\n");
>   
> @@ -525,7 +526,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	timestamp = ktime_get_real_ns();
>   
>   	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, msg_len, &ihdr);
> -	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len,
> +			 GFP_NOWAIT);

Looks good to me.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

>   	kfree(msg);
>   }
>   
