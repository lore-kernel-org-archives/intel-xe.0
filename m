Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB97CAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 14:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE0010E22F;
	Wed, 24 Sep 2025 14:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UB91eyad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0AA10E22F
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 14:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758723793; x=1790259793;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rw6j1qXhHbOfgKZ2WAm29QQ9HYOQxwDwqz1yGtNN3sA=;
 b=UB91eyadsu1cURQ/YMvL1MwykP2+NC2PFKM7e186FP6nTq6gPzMM5JBt
 a4oEgJ5vKH7V0lCsd2DoBzKm6L695QL53nC/LL/xk/2XUY2j5sz1wZu4B
 CRgESNM2lHGGdEhrsdcyfLm8O2WTxx9NHT5Yqm4sqtPJBgs+aoFmnlPB+
 3RpA8gFX5QeKrVDnjSwE6lMeeZasm4NwgB/W/k59OclRWy+mbgtBsLEfM
 vDEfHxWPECrHX9P0xKN+GERmdSJXJDsIq8I/68wV7oPSHfG2D3bUYLZX/
 rbRQmGCONEZgT3r7tlQje+YsVy76Ykde9knwDqb15KM/+MbTaiieBZDfP g==;
X-CSE-ConnectionGUID: qo7UxnhiQ4yJsLPlvXTJ/Q==
X-CSE-MsgGUID: V442OZyDRjOrXJFvU91FvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="72445744"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="72445744"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 07:23:13 -0700
X-CSE-ConnectionGUID: 7igkwZBgTXCkNsD7YgmFFA==
X-CSE-MsgGUID: gTWie+GLTYqyAHv4nve1BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="214174312"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 07:23:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 07:23:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 07:23:12 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 07:23:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEegKJDVmDf+IQq0QUxT05JYjsWh6JuCY1QNfXXSWWD9sI9mOES+EnRV7LGeLjFTakHb4GXpXLwZdiaQN+AkPeca3oMiQlaI/5WzqisUnJtdjQLbaKsEOJt0DBsDRbZdsDImThOlK8EkxMxvKgwno2vl7csf/ZYCErRAvsZZOS/Ji7GoWtB2F0NKeabtHmkWCr2fd2d3BrA29QmDoWlnV2wO2svLHIjpsoUUazN+YYQZWkPS3FIgtn2gfbx+vFTsiEuCYEeahyiC7rKyEFT7lQKgan+aXrZ+XAnViOvqhix+MpvLU2vQxhf0Ob6a1Hk/SahKyEXKMf1T/JcPu9y9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7huDdzu1E0vQE2LHr/lLD1R9036etujgvk8YOM9ez0=;
 b=APjq8FZXHs7k+b29BF6/x+tp1aO9dhu70IAUgPOFF3zXE64pbrJl1JQTLb1lJfnEZmabnnVTOEUsFvviXQ9bfL9J/EqkJQAzvAQgXus3eQH11VZIwpv8Ndl7PslXvcl4RDLft21mh4kCPzf/vFyPENEGviTdLViLAhINMS2yCld2X0TC28g2BQl0Pvs3FMVRAlXxX2Wx1uOqDcCexxlHKm8T7Wf2kRS+CdzYbFc+U6l0tkxqqLouf11pmCKM4S2XAUNZBZbTlQ86NolDgu5xwfuV4EfG64vv4z2p0cU1/A6EGmRlIUnj4RbPFLF7A0DHLBgyRNTlD67t5JW0iZhSgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 14:23:10 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 14:23:10 +0000
Message-ID: <895285bd-7367-4ddd-a3ba-2c877e97555b@intel.com>
Date: Wed, 24 Sep 2025 16:23:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/34] drm/xe: Make LRC W/A scratch buffer usage
 consistent
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-10-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250924011601.888293-10-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0035.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::11) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: 0063afa0-6a22-4a74-2970-08ddfb75e339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmVUVDJRTVFZRmduSGd1UzV6TkZkMmtzcWtHUEVEMHIxSm1HS3lkaUNoemdM?=
 =?utf-8?B?dE1EcTlDYzRQUGhDYzJoZUwxeHBHRUpjank3cmxSTmZmK25keE9oeTZSc0Nz?=
 =?utf-8?B?YVppR1pSOFV6c1dna21XdHo4R1hPRzBYRjB6aDBYOHJZZmdRSFZ2V3lGMHhZ?=
 =?utf-8?B?ZFBzK2FlK0NscTdGU0cyQ3c2bW9pZkg4RkJYS3J4dDJZdmZOQ3VrOXY1ZWJj?=
 =?utf-8?B?R2ZZMGxkNFp4WHlEUkpRNFd6MFZwZzlzbFgxQ3FIOTRjNmFhaS8rN2dkNDJB?=
 =?utf-8?B?VWdMMnlqZkVWZG90ZkJEQkd6cjVqMllsVGduaS9wZ2dpMGwzdkZ5VUpFc0U3?=
 =?utf-8?B?T0poL1ZsU3lOcEh6VUxvbEJuYStmUlB6WUhzYnRueXRDQnArdDFCUlFST0Fk?=
 =?utf-8?B?TWRnR2FtY0NhWCtFYkduajBUTmhmbHlySWZmNWErbEY3SlhSTjc5VlBxeDFK?=
 =?utf-8?B?MCtQQ3VHODdkQXE2a2NSMnZyS0lRUjlCZ3VQN2ZvbjNQWDhYQzFzbC9HdUhK?=
 =?utf-8?B?UnRNSEdqakNzRmY0bUVrNWtpVm94aUh0cnYwemo0WHBUMi9Rcm9sdDdITDhP?=
 =?utf-8?B?RFZFWktjaGRNcjFCb05WREphNkc4Y1NjazlHZ2tyWm1wN1FZd1UrRnkzWm9M?=
 =?utf-8?B?L0NQaDB0TnRtcUlmOFdJNTQ2YTNLZm9jd1R0b3FqK2RhalRUSk1CeXBMS0RF?=
 =?utf-8?B?UkhGeHJPTGFZNDF5K29iR1YvWUxnV0I5bXJSamMrVzJKZnYrbEZvMldvVzE3?=
 =?utf-8?B?d1JCelN5M1JjNDM1K1FPQUJKaU1DV3RNV0NMUlpYTHBWZWx5aThxNTF2aXlE?=
 =?utf-8?B?WDE3VkpJVm5XdlFBUGxHK29sTDMweUliLzBJMXJ4RElKSkRRYk9MazdCZHFm?=
 =?utf-8?B?a3kzWW90WWpzVDhtYkZEMm1zaCt0a3MwemRlQzYxU2ZoZG1MZFRZeXhUTVN3?=
 =?utf-8?B?UWY3bW9weVJaQ21iSzU4TmFrWnFQTElBZ0E5MXNEWWtLT1cvQkMzWktsazBE?=
 =?utf-8?B?ZW84ZFE4L2NRZVVBV1p2Vy82ODVaZGpORTVzQ2t1VFVpQ25CdDgvbDdaZE4w?=
 =?utf-8?B?VWF5bm5mWWtJTnFjc1EyMWtJTHhDVUxaZ21wTExkZWlaWXZrRXBBYk1NRnhN?=
 =?utf-8?B?a3dSMXdJUk81WmVMZHlQeVVST2szdkpUdW9WK2ZlLzFIZXYxcHV3cys4UnZF?=
 =?utf-8?B?TnkybDRCZ3FGak1HQVdVUXdMNUlqbGhTQlFBRVRVMXlVVDBPY0tMcGc5Tkhr?=
 =?utf-8?B?ekVaYXcyWXBTK2d5dWt3cXRKTXZwN3BqZWFHZm5LaTU0amd5bCt2MitmZHB3?=
 =?utf-8?B?b0MwakIrdVBLdkVKMk8weTJXN1FFalRXbWY2YUU2dGpmN3hBUVNhN25uV2N4?=
 =?utf-8?B?OS9oalRFc3Y0dWZUOU53cC9UbThhaUdNaEo1TzBwWDBvaThhaldSTGpBUC9q?=
 =?utf-8?B?UEtXRHNXNWV6em5KQ1dMd0pwcHVydWtQZ2pvdG5pa04rOGVrNVN0OXdIZXMz?=
 =?utf-8?B?VkNCTE9TN2R3NHdMdGZMWCtZM0lRRmQ1TWw0THFtekI2YjdGeFBpWkYxbjBH?=
 =?utf-8?B?ZXhQY2FkSzQ4MjRPdVNRWE0yR0ptYnBsTEY4aDcwR3NENGRqbk5nSldzeUk0?=
 =?utf-8?B?T3BpU1ZpMFBwNTduVmN6SlFHUUh2OUVEcWsrWnJYM2dJWHlNbmxVU0tQZEp2?=
 =?utf-8?B?L2UxRG1ZdzhPS0YzdTFJRy9iMnhlL0I4S0p6b3ZqQTJiL0F2TXhoY2FJQjQw?=
 =?utf-8?B?bkVZOWdJMjZTd0tXckpzMFYxSi9RVlQrR3FvU2QzL0FXZkJjWW5zT2pHS3hC?=
 =?utf-8?B?UkVVTUcxVHg0QmsyODQrSVdzc0pxbjdPdllIZEVMdko0L050a0EyOFdmTVda?=
 =?utf-8?B?ZHZyNXdaTDc3cDJVTW4vbzh1Q0dsb0MrSjN2Q0U1N3lzWVlJUW5zYUdBWFp1?=
 =?utf-8?Q?0at5GXrkgno=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1pDanhDVjdtTks2S3Q3OXQ1eko0RkJpTFRBOE9iY2gxbzc1emVJdXF2NG5V?=
 =?utf-8?B?bFNoMzIrdjRSZ0MwSWdTaUtoNlRCZEZoMUoyd3BBTWJObDBaNEVEMDNzQk1I?=
 =?utf-8?B?S29UZ05TcDY4Y3RLZk14RTduU1hHNFBiQ3NlNUZyNUpzZFRZYk1VRFUzaFQ2?=
 =?utf-8?B?Wk9laThrdVM2clpCNjNkb3dtR2I0UnlFZjFmbTF5Z1ozV25lemUvQzNsbU8y?=
 =?utf-8?B?amFBUlFqb2ErYVNJYS8xUnBWKzZ5bGF1bzBEZXY5VURWalF5N3QwN3VQQ0d3?=
 =?utf-8?B?TWsxbU1VWU94Tnkrb0x2SndESm53KzhJaDk1OG9HUnltQ0lmL1RpNUxSWlJC?=
 =?utf-8?B?cmQ2NVhCZXRHUjlhQ292b1FUMVZrQmt1R25LUWw3bVMyUFB4QkFSRE54WDFY?=
 =?utf-8?B?WGY2T0tGK3JzTG50TUNmV0NXZUpqTG9lRmJxVXJxWVZPenVIUkczQm5jOUx3?=
 =?utf-8?B?YzJhUTVacXlFQWl0dHlaKy9KKzBYVGFPRlIyS0h3QWRnYUVadmhMMG1vQnN4?=
 =?utf-8?B?Um1nU2EyaW1qbTlOT0xJMXE1TGhITW4zaUR5dXFCME5JNy9wdE5Yc1hwSHF6?=
 =?utf-8?B?SDZmaVJ2YTY4bzFzTUR0Q3prZGRCR2wxY1RPMGZ5eTdnQktOR2QxQkVxNklT?=
 =?utf-8?B?akhFS29wYlg3RDh4Zk1sOTZRY3l0ZnBVbGViYkVheUM0R2o0UVpzdVRMaSsw?=
 =?utf-8?B?K29EYnpZTnpuVXI3MGV2WTF3Wm5ISlc2a3daeDAzdHFjK2FKVVcwNmpkTHY1?=
 =?utf-8?B?ODFkOUEzY3VOZXVTMmxRVERRcEtaL1ZxRWF1L2dtWm96b1NkUU00ZzRvaGVz?=
 =?utf-8?B?anlDTHVTOURpL3ExYjVsNUFFU1oySElqR3pXT213T0J6L1kyU3BSLy9LR2VC?=
 =?utf-8?B?RlU4cUhUTTBpb09UZUNGWDg1WHpLMC9Yck42V2ZSeGNUT0pLY3FMaDhpTzNa?=
 =?utf-8?B?NFVVNXRoTlg3aWM3V0ZhZldHK1UrRkFmejFmZ2xMMkw3TnRHRmIxMGwyNkl2?=
 =?utf-8?B?TXV6c1VmTDVieDk4WmxlcFdxWXRZcVlPQ3J0WWxCd0ZQTFFqakpmVU14N2dx?=
 =?utf-8?B?TFNOQ2twUWwyTzh3d3EyaU9UZ3RsalNpOTEyMm9DRU9XaWhyWERyNzlDMTlx?=
 =?utf-8?B?QXFlcjZpWGlmMDh2UThDS2VPcXYwRlFpRlpDcGpOSVF1N1NWZkhVTTRwME1q?=
 =?utf-8?B?THlJbnRRL1lBWmFEbWJSLzE1RFRUM29qd1BURkx3MUdiT1pjQUt2ckFZcmdC?=
 =?utf-8?B?MUlJcE1ZYUI3bFZUMStkd1B3c2FsaG5ENXQyVzcxN3dqUStyUXhwOUxLM1lh?=
 =?utf-8?B?bXdQbEhZSmxEOWo0ZWs1NjRHSUdKeFA0bXlzQk9vYWpoU3pqZjFWSTdXRnRw?=
 =?utf-8?B?RFdqZEE5dFBjTFNBVG51R3NtdFdmMWpSNUdwQ0U3YWpYQXc2bWJveTBEWnpa?=
 =?utf-8?B?VlJPRDNkU1dBeU5ISmorZjhsTVQ0Z2NlQkxncjA4Z1RSUjZ4WVhISEdCVERp?=
 =?utf-8?B?SFNqbGh3Zk9oRnpweVJmSWxGMnNzL1Z3ZzVlWkQrUE1kRlhhYys1TThnMjh1?=
 =?utf-8?B?MnVQVmNYWEJpQzl6RHJBazd0L0tINk5mU0xPOWVXQTVxUlhTbG9CU2lwZzdv?=
 =?utf-8?B?SHBveFVURHJvMVFKMU9UVEp1cXlVM3lhSHRHT3lMcVFHVUJlWXI2VHdNaDRr?=
 =?utf-8?B?SHdrSk5hTTlJM0tkZmIrdXhoUy9XeGo5aUp3V2JVYzhDWnN2NzFMemlBUFkz?=
 =?utf-8?B?NTZ5R3l2aklDNWNMRWJyYzFXaThMb09laFRodWw5Qmw3YytmTlc0bGN6VWNk?=
 =?utf-8?B?dFp2V1hpSDBiRUlmR2V0T0RUTVMrQTI2L2V3THpEc3NFOEZYMlB1MG4yOTk4?=
 =?utf-8?B?aURnY00vbEtkL0JIRFZCUm5GVm5uMTFnQ1Z4SEE1VWdlZFlTODd0dHpOMXk2?=
 =?utf-8?B?cUluT0V1NnZ4MHFnREo5OThBVmdBWEYrK1NkMER1WTlQVDZwS1FCMFJYZnRo?=
 =?utf-8?B?R2Q3NkVaV2NkSTRyMjM4bG5jazJsMzJjK1VXd1V6eURjUmpEYzFHVDNJUDE5?=
 =?utf-8?B?UUtOSkV3Z0NZTGlOK09US0VydzJlUnlrc1BUYU1GdWN4aFFwQjdYbmlIL3JB?=
 =?utf-8?Q?2UVUBvNHO09OOO0DKUkFbEiQB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0063afa0-6a22-4a74-2970-08ddfb75e339
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 14:23:10.0926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FnHyRBO/GBs512cFvGvaKUUbI66QKZ4StzWmXJGvFT+ya3+WOsPjOFOhGmfhwHJ6tKc8l+vN7fq8QYpQAPsFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
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


On 9/24/2025 3:15 AM, Matthew Brost wrote:
> The LRC W/A currently checks for LRC being iomem in some places, while
> in others it checks if the scratch buffer is non-NULL. This
> inconsistency causes issues with the VF post-migration recovery code,
> which blindly passes in a scratch buffer.
>
> This patch standardizes the check by consistently verifying whether the
> LRC is iomem to determine if the scratch buffer should be used.

No need for explicit assert as the kernel will abort by itself if 
state->buffer in NULL, so this is ok.

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 47e9df775072..aed0a3155d1f 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1248,7 +1248,7 @@ static int setup_bo(struct bo_setup_state *state)
>   
>   static void finish_bo(struct bo_setup_state *state)
>   {
> -	if (!state->buffer)
> +	if (!state->lrc->bo->vmap.is_iomem)
>   		return;
>   
>   	xe_map_memcpy_to(gt_to_xe(state->lrc->gt), &state->lrc->bo->vmap,
