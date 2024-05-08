Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC61C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 18:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D9610F3C8;
	Wed,  8 May 2024 18:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRW1+eww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C2010F3C8
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 18:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715192319; x=1746728319;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hwMSgZcVw5v3tvPYaewTUQkq/p20UO0p6ErhTvy1UXk=;
 b=YRW1+ewwN45oeBtH9Qf8hLJRr2ff6wVlFZ1hAQg+vO0sDI6KfCBBuGFq
 Y1gtams1DzSSczfQX1MppL9vpTj4s/pTZeXTVePEk8WBA06PmMMtP3Vra
 UcBZKjm/swF3gTygRHqZNWmysDjmxU6oISTsuyvjRf/luUl2LANjsOmvU
 CphOYe5VR+kLgl5sQY+H7HRCC4JwIOkd24Ld9yUNZeex7od+NXLozhFhd
 T95E9WqpMu53T+Xeah5JUtdY1BxH1I6jZ1SjJfZTEJ9WU3v5vogVTAenG
 72r8I49Cb3GlNL5PLdQJM82P8Vn8ZCqJwVbl8HWvTV40wIPeiNByF635x g==;
X-CSE-ConnectionGUID: lrNnBmcoSGiHIsEcgdipeQ==
X-CSE-MsgGUID: IfTUgXZCQQWs6FudcX350g==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28587309"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28587309"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 11:18:37 -0700
X-CSE-ConnectionGUID: sjCOOMj9QgSDPciFHevwaQ==
X-CSE-MsgGUID: jLz7scX9RcO93ZExEyGcww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28916208"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 11:18:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 11:18:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 11:18:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 11:18:36 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 11:18:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9SkjknKDIEQGM4oVunY4rFmM60VAvYvhXHqRH6cYLW1gj2gxVe96gxUs7cgx/qzAnOO8WWj60D9pEgA/+6Ww9yUmCFkL0wWY6OJUq/lgt98e7rgEnI2HlBxZG7N4cYWxiU+aEKFAFQfXgxHXR644P0Y3DnOtrlF7gYEtAPy7hOLBHzOFLotP1RBx427HMxEbVwlifsqOI3M+0ZlQ2O7QTNmWiI2y0hPg4aoOjfljGIaqWSGaVpjPkTia3+1XsaXgdxpCKlfcQ2p+oHM+L1HIA2R6qtIMf1i0GqnI2TfjL92j+H9ui6CEf/vONlO0Xwz4TY5H28rLbGw8iFxjhDPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mzwxw+Ff5SwePCrN9dpk8ASV/rUwdEukfgGBXOdD90=;
 b=Ciu76IHpSl5cl9orrf/NLsfRCK0FQbGi1rbICmHDW3NyyqsoffetJz0WuSwg4VcBNkxx1q0qDmrOYnsIDn0CWbPRD8eVD3gCCUwvjnsFtWILzg7tMSkGKCjXEDNqK1MFpCxx+1CJeRvmvjK2KUjV+igoNNMEr9Rx4g3jZ67u22sCFWgmkQYiC0ogyHeUoESotIP3MDgQ77ZXc1JJ2+ml8SNAk4osqjrVEHeTIM3f8gADS+mz/09mbUHNBCv3uwCnQivEqp3Qmxi52gEQct+FKRgRrxNIjBxLDI3TVc4isYjfnMX9JZ5jE742ZhnL+GF06LkUF69ra7PFOVzRaUtD5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SA0PR11MB4590.namprd11.prod.outlook.com (2603:10b6:806:96::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Wed, 8 May
 2024 18:18:33 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::25b5:e7:8133:d2c6]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::25b5:e7:8133:d2c6%2]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 18:18:33 +0000
Message-ID: <7660b286-5dc6-4edb-bdf7-d16da1614017@intel.com>
Date: Wed, 8 May 2024 11:18:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: Only use reserved BCS instances for usm
 migrate exec queue
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20240415190453.696553-1-matthew.brost@intel.com>
 <20240415190453.696553-2-matthew.brost@intel.com>
 <faaa56a0-8579-4294-ba57-fe63c1f429fc@intel.com>
 <ZjrmpDa05PSL6B1h@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <ZjrmpDa05PSL6B1h@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::33) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|SA0PR11MB4590:EE_
X-MS-Office365-Filtering-Correlation-Id: b98c4101-c7aa-46d2-44e6-08dc6f8b44e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WS9VWWhZUGFrQ3lKeGRnMjRwYUdlalVQLzVoWTFlYmZtZjhzTzVLVWpzVklE?=
 =?utf-8?B?Z2FNL1ljWVlVb1B5N0lSVjRNKy8vYml6MHdkdWRjYUhpYVc1cnhMN3ZEbURp?=
 =?utf-8?B?eHJ4THJBMmR1bmlKQTdFMlh1Wm1nbDcxQjQyVWllSU1tN0JUSXlyQUlLazhi?=
 =?utf-8?B?QndEQzA1RUI3a3UvOUN2anhUS0VoUmIyUFdBbHZZcGxJMm92blhsbTlJdlNj?=
 =?utf-8?B?RGNZaTB1cU5NdWx1aVFuUmRLWXJOT05xRmdMMG5MdFpWZjlVQXhCak11Z2Rr?=
 =?utf-8?B?ZVdra1ZQWjM3ci9FOEtXMVVCdDlXUVZyWFBDakpQRDRlR0lhTHpjd2FMUHBQ?=
 =?utf-8?B?aXhycUd3bmhSc0wwUURzaFRDbzN3WG9CSU1XQnpOZjY4SGJoOHdUMzNjQ1lz?=
 =?utf-8?B?U0pBaVhyQXNjR09nSUVweldjV0NJRGRqME5lZjhBRDE0Q0RDamhobU1BWFVX?=
 =?utf-8?B?TC9rd2lKdjBoUW9UbVFyV3doL2NRRG5hUkFZS2VlME5tSElicUxZc2hEYVV3?=
 =?utf-8?B?cGR1aUxCZmRZK3lFVVMwdmtZS1pHaW0vNC9GT240NzZrdXZ2UzRFYXArN0g0?=
 =?utf-8?B?WnVLbXlvZ3hYQmRVc2hBcDJtU1F0cG1mSlBLc0h3TUhvNitMc1Y1eUlQZ1ZN?=
 =?utf-8?B?Q08zTllqYlV4bjVjSUVNcExhT0dlcGtST2UyUllyQzgzUXUydCtPd2pHbjBq?=
 =?utf-8?B?aXU4RU81cnlQam1MRjB3cHNIdkx5WFNJNFE1V2EyNTMxZUdqQ3ozWHN2Sk16?=
 =?utf-8?B?eDBsVGRMSHJYZFVNbW9ZTWlTckE4M1YyUmJHaUVlZFZMSjVVSWJidDdib3Bk?=
 =?utf-8?B?Umtnd1EzNWVVeTJPTGFQd2o2TmxpR24yN2RhcmlLaHVTZW54SmlqNkpaZWpG?=
 =?utf-8?B?WnBtOWZrTWxCWmd1aVZNUDF3bmVqb3RyeUNwdE1pY2dZYUdHQWJaMDhCNGln?=
 =?utf-8?B?OEpnWHNJamJMQlJXS2xXQWVRYjBPeVoySlMvaVdGK3ZpRkZIUUx1ZmxkdFc5?=
 =?utf-8?B?RGlaWGtaaENsY1BSUVV3bkR2cGx0dXBJVyticjBNWGRRdWIvYU9QU2xha1FP?=
 =?utf-8?B?THB3V2NxRS9Xck5HUitSUDh3YjlqamNHbjUxVUw0REhzaFd5MkVGWWM2TTJF?=
 =?utf-8?B?QjhoeG1JS1pRQlpMcUZOY0wvTmZtT2hpR0Y4cTYvcC9KSnJQS0t5RzAxSW5h?=
 =?utf-8?B?VjlCSXU3c1V1RTRrVXlOTDJ5ZEFVaVBjUlJxU2J1dzZuUVZab1RxY2lydElU?=
 =?utf-8?B?WUZ4VGp4OG1kaExGSmNTQ3dkVHJVWmxmYUNHY0xUZDIzUkZOOUh5a2ozOFcr?=
 =?utf-8?B?cEVpMmh4WStPMlNxZ1NDRlZUKzNIVDZLU1FaQ3dvdlhnbFovaGdEYmtRSkdt?=
 =?utf-8?B?OXR3bUpoK3VQY3d0V1JSZVM5ak5RbkhzV1BvVEFlaEx4Y0NEYVRSSWFXZzVk?=
 =?utf-8?B?OVhSZSsyY0c4TTRtL3ROL0RDRXkyR0ZkL04rckdzVVVJVWRIdW56Y3FsMVY0?=
 =?utf-8?B?WUVNNFo0czBrRWt3cWY1RjF5RVFtV25Ic2pVSG9RbmN4VTZEajA1UXVaRlNV?=
 =?utf-8?B?dFVzMlNKNjBidUF1STkySVA3TFk4ZGV1SkN5MFdCRTUvdmY4cGc3SUlCa1ZV?=
 =?utf-8?B?a1p1c3E0VmU2YVRnY3NYRkZ1VDE4Vm9MM0wrUm1scXFqOTZTdVhabTZuYXd3?=
 =?utf-8?B?dUZKS2R0a3JReDlOcE5LNXdSWk12UzhJb3hxYzAxN3gySlI1QkFhdG5nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkVlY29pall3SlNkSGowQ0I1MkxseUt2UlJta1dJbGY1M0luei9Ba3VNb0c2?=
 =?utf-8?B?MnlMcG5VZC9DTWN1TElDdW1JL0RoTTgzNWxIVXFoNlVmYWloUzRWcWZmUmUw?=
 =?utf-8?B?R2hTNWtJbEMrWEFMZ0dpbkZiMjRGdlJBUmE1NjIzS3dmSElVYVhjdE1GZ3ZI?=
 =?utf-8?B?dWd0T2JUdklrSGJLak5PaTFHbzIxcWFPWnloMVdIZ0twdm1QcUpEcG9rQ1pi?=
 =?utf-8?B?Z01xNWNhRUo5MUF4SXJRdER0eUVFRkphTHc2UVNKREZOSURma3M1VkgxNkJP?=
 =?utf-8?B?N0tqeXJxazFzMnkxbHkwVmZhYTlrdkhJV0VLZDhSM3ozNEo2c1Y3akp3d1I3?=
 =?utf-8?B?dGx2d0hZeVBubFJXaGt1Zm5uU3FEdUUxMUZFMG0wUmpPVVVyN0U3SnJhdFZn?=
 =?utf-8?B?bVBBdmVsOWZJSWZXaHhNZGR3U2NmajdYbkRiYWttWm04YitiN1k5SzZuVVc0?=
 =?utf-8?B?Z05OOWtmZi9BTW5YVTIrRG9GVXg2SUtVQ0Z5Q1RPb2MrbFY2S2R3TjhhdlZM?=
 =?utf-8?B?RnZXdm40SGxBT29xN2Q5dzNFTXY3OEF4WSsycGw2ZE51MzFqSHMvb0RYQWJh?=
 =?utf-8?B?am5obGlZUnJIaWZsQVZnZjBiWHFVWXlJTjlFTFg4eGdtVkRrcmZ2cGk1UGpQ?=
 =?utf-8?B?Z2ZWZDZoZXdlaXdRdW9NRVN5Y1MxNldadzBpWDFjZVFvRnB6TmFoWGZCbXNu?=
 =?utf-8?B?S3k2UmV5ZlY0U2xIVmE5YTl0Snk4OTg5NWdxd2t3VXhOeWo2endjOHUwTEVm?=
 =?utf-8?B?aFBWY1FLRk5WNDlkb0ZxS2pDT3UwUEVOZjZ1eWFCZkZuZXEvNXhqSnJ2bXFw?=
 =?utf-8?B?U0ZpckpQZWJvU09Db3JsMEJCd1dYdW1Od0NzQlZvOHUwMkNqdzVQenBHMEJR?=
 =?utf-8?B?OHBqNlNGMTh4Qmp0VUx6Sk1UZTFpcGlGUksyTUJYSTM0enUwS1Z3QTJDMm9X?=
 =?utf-8?B?b3lGT1JvblpURHZ5MXBDUGx4T1kzamxrV0VJeVg3KytrTmVMajNib251b1p2?=
 =?utf-8?B?dTFlSmFMR1BxUzZFSUdNSTVLa2ErSFB4L2RUVDliZ1VqeUsrRmE3NDBwNnkw?=
 =?utf-8?B?TU1HK01uRlZhaFlsZkhPTW52cTFqNldXanFyMHo1MFB1YWUwQUhvdU05LzhR?=
 =?utf-8?B?YXBUNExPdWROVnBvUXpQTm8yK3FoNzVLNERiVktKdjNtZW91L1A0ZzdjeWpR?=
 =?utf-8?B?N0twT083azdJbkVxYzlKQjN3bUtsNjRkSGZuR3B1ZmRPUFp1em8rNXdxSTlm?=
 =?utf-8?B?OWltaUN3dGFNbU54U1FZVjhxNitvajhZMmJmTmZ0NTRiUDB4ZU0vNXNkUVRs?=
 =?utf-8?B?OEk2ZmJycEcyMGhoY052aWduQjZhZTJMNlVTSFRQVit4elc1RldHSllLWmRt?=
 =?utf-8?B?TlBQN2hPbkNoem1oU0hWaVAxdUFzZ2xyTW5YOUhvdVBlM1NKeE5VSzVsTmo4?=
 =?utf-8?B?K3lhMll0UXJsYXBDNWVHeEJLYkR2N0l4TmZoSFJnWnZpeVFzVU9Nb2Nnb2xs?=
 =?utf-8?B?Um5FSkEwaDA2UVZvRkdGak9TUDAvenA0MVJwUlRZVnNuTld1Y0RTOUlYSVlI?=
 =?utf-8?B?MXoraHdWbDJzKzZNdEVqMVhzZVAwNERqdmZ1V01GRGlKaVYybXVHZWcxZGQ3?=
 =?utf-8?B?VUR6aXZIdlg3bmhsSXRsQlVPa0EwNExwWUhCR2UwNk9uVE9xSSsxUjI2OHBV?=
 =?utf-8?B?emhyTVN6ZWNlSlM1ZS8rNkJoR2JUTFdaVXIwYTFtOTJvRUk4QzF6WTJVMmdj?=
 =?utf-8?B?Sktjemk2cjlQY3ZOY3hCem55U05UU0Q2TmpNTDVoWXBOaGVNWmFoUGVOMDlS?=
 =?utf-8?B?R0dVZGZUSU5TNlVqaVRtSnllMDdxbFJrcDdMMmxTQjdzWE03MWRJSDR4cnQv?=
 =?utf-8?B?emwxeml6ZGQ2N0xBa2tDRGtkck8ybzZoRUlXeUpxZG5ZMmk0TkxqdTRLMGpr?=
 =?utf-8?B?Q3FnSFNwclVTbGdDNUJPYmJRSmhNQkRkOStFYmx0VFFHSGFpMXB4ZFFtWGtU?=
 =?utf-8?B?MUZDNERWWEQ5WSttWUZRQ2JJRWxwb3JCNC9oQUV4QktpcEVkeVljTEJQMm1W?=
 =?utf-8?B?dk1pSlY4eXlXa0ZoejZIZXdVWUR6QkZod0UxQys0c1c4bFd6dGxTbHpQYkN2?=
 =?utf-8?Q?CNKXAVy/fK/jEerF5zdQEGZ6v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b98c4101-c7aa-46d2-44e6-08dc6f8b44e6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 18:18:32.8012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5c19oielB2ZBx4WS59jCk0AxzykhUHWlIzxqFUf7hzucJRkijFQYZ24dRLTV2nXNFlrVDApkpgHpYtMjfle/sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4590
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



On 5/7/2024 7:42 PM, Matthew Brost wrote:
> On Tue, May 07, 2024 at 04:59:25PM -0700, Welty, Brian wrote:
>>
>>
>> On 4/15/2024 12:04 PM, Matthew Brost wrote:
>>> The GuC context scheduling queue is 2 entires deep, thus it is possible
>>> for a migration job to be stuck behind a fault if migration exec queue
>>> shares engines with user jobs. This can deadlock as the migrate exec
>>> queue is required to service page faults. Avoid deadlock by only using
>>> reserved BCS instances for usm migrate exec queue.
>>
>> So the underlying concept was always broken here?
>>
> 
> It seems to be broken.
> 
>> With the mask of more than one engine, the virtual engine still won't always
>> pick an idle engine?  HW may end up picking an engine and
> 
> I thought the GuC would always pick the idle hardware engine but it
> doesn't appear to be the case (I can see a clear deadlock before this
> patch, resolved after). Maybe the GuC considers 1 exec queue on the
> engine idle so it doesn't pick resevered engine?
> 
> We probably should follow up with GuC team on this but for PVC as a SDV,
> I think we should get this merged.

Makes sense.

Reviewed-by: Brian Welty <brian.welty@intel.com>


> 
> Matt
> 
>> confusing it to have been idle?   Because the extra 2-depth thing is not
>> being considered?
>>
>>
>>>
>>> Fixes: a043fbab7af5 ("drm/xe/pvc: Use fast copy engines as migrate engine on PVC")
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_migrate.c | 14 +++++---------
>>>    1 file changed, 5 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>> index 9f6e9b7f11c8..c37bb7dfcf1f 100644
>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>> @@ -12,8 +12,6 @@
>>>    #include <drm/ttm/ttm_tt.h>
>>>    #include <drm/xe_drm.h>
>>> -#include <generated/xe_wa_oob.h>
>>> -
>>>    #include "instructions/xe_mi_commands.h"
>>>    #include "regs/xe_gpu_commands.h"
>>>    #include "regs/xe_gtt_defs.h"
>>> @@ -34,7 +32,6 @@
>>>    #include "xe_sync.h"
>>>    #include "xe_trace.h"
>>>    #include "xe_vm.h"
>>> -#include "xe_wa.h"
>>>    /**
>>>     * struct xe_migrate - migrate context.
>>> @@ -300,10 +297,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>>    }
>>>    /*
>>> - * Due to workaround 16017236439, odd instance hardware copy engines are
>>> - * faster than even instance ones.
>>> - * This function returns the mask involving all fast copy engines and the
>>> - * reserved copy engine to be used as logical mask for migrate engine.
>>>     * Including the reserved copy engine is required to avoid deadlocks due to
>>>     * migrate jobs servicing the faults gets stuck behind the job that faulted.
>>>     */
>>> @@ -317,8 +310,7 @@ static u32 xe_migrate_usm_logical_mask(struct xe_gt *gt)
>>>    		if (hwe->class != XE_ENGINE_CLASS_COPY)
>>>    			continue;
>>> -		if (!XE_WA(gt, 16017236439) ||
>>> -		    xe_gt_is_usm_hwe(gt, hwe) || hwe->instance & 1)
>>> +		if (xe_gt_is_usm_hwe(gt, hwe))
>>>    			logical_mask |= BIT(hwe->logical_instance);
>>>    	}
>>> @@ -369,6 +361,10 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>>>    		if (!hwe || !logical_mask)
>>>    			return ERR_PTR(-EINVAL);
>>> +		/*
>>> +		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
>>> +		 * PVC, may want to revisit if performance is needed.
>>> +		 */
>>>    		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
>>>    					    EXEC_QUEUE_FLAG_KERNEL |
>>>    					    EXEC_QUEUE_FLAG_PERMANENT |
