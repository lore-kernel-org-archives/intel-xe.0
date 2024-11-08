Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6572BD64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 22:06:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C07010E137;
	Fri,  8 Nov 2024 22:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8lBxuBm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9E710E1DC
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 22:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731103603; x=1762639603;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AvkwUuQIcfs6AlYqQ9Qv2u8EiTEtxMQTQMMSUzWLJAg=;
 b=b8lBxuBmQofQ9Lt/z2Tz1uqZyoS/YWRFz6BUDtGT5gxZTjR/uWCm4kQj
 SkY9482PzBTvJT+X8Y5GHjaoktu4ayybkkQi5Djw2QqrCK3MVGznmWh41
 W73NkxLVnlp1OwHYx7eMNCWtaqF/Ken9JbKYbgUTHrclFFwGptJIb1bwf
 +vjPj3FrYbWW45odpgrOY9OUk5E2VTaaTJuoH1qzsqsHrlnqYE9s/OtJM
 HyWiWWVZtkwA6+JRpr/dokRIGdB4uNVVZ77F8deooMH7vlz2zKps2N+ml
 pgYxe3J3us8QkKiNw97FkJ6Ri3rp4syIf5cIkmfkAveEdBdG3DKAXBOEM A==;
X-CSE-ConnectionGUID: KYfOLyC6QhKn4V31ZwyzsQ==
X-CSE-MsgGUID: bgPNATDSS1Sgs/KEDPZALw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="31105807"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="31105807"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:06:43 -0800
X-CSE-ConnectionGUID: NSO3hSSrRLSC2qr53h0jmQ==
X-CSE-MsgGUID: mbQnOLJJQR6PWIWtSeWWFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85759863"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:06:31 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:06:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:06:30 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:06:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVG+ahhEOqPucF+xNCy67+IEEuHQO5JksnyRussBEZRFCyt4ES80EtRljh4zGFOQewyQjdv1djX+HulvXpp/yCctcwvYmqr8DAzE2bU38Rsw9KyP6jSplwaFvXUXNSQXLqxMMjj0+VQaH2ay23srfF/jzI1UBEAakzal5n04eH6RcBh90GOUg5Kvi4ryuX7QEvh0BLvGGbVBxrAcFPCc5Sr13IuscxSfRVQt9pfE1MjnKr7PbdFhMrKQXGi40H0v3bjtEQJO5YcdsDbvwXadMWvceVU3BPoNMztBs/byQoJJfh4jgC9euT4vYh5Jia8FPdXv2g7M6anhn5NAx89WnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaEF+Aip1XgB7HndE8arUhoGdvYMsUqCPYWaLwvq9ms=;
 b=joAuRvQtoG/ysN80/cgmbXNjPRlYSuFetimvlqKapZaDhyCwUxZw1AZPGuKB+BeoH2b/7C9mdWehXSqjKF6VP/ppkx1jzvPHruq3RFrXgvoJxv3ZX4uc+5Ee7oTlTwqdNGPlJ00Go0l2sR5v+dL0b2b7lwBOYJx0+N816gUVwbGd/aC80JdbWDvOsSmjT8mkW4Y8YPSozGMjy+sBiMRzeQXQZHGLx7lxC6iQsj2L/hBSg+WGKula+M4SEyua+MLSMW+Bfh0rAbCk0H3QRkmlhY5pitTWZxfZabwuvy3nJqO9uGuiUnv1LfTQWpJeGYQY6KT0oh0ANH0MNj+oQkx9xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA1PR11MB6220.namprd11.prod.outlook.com (2603:10b6:208:3e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 22:06:24 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8114.028; Fri, 8 Nov 2024
 22:06:24 +0000
Message-ID: <fb7bc882-f802-4d8f-afdd-8f03a73bc3c0@intel.com>
Date: Fri, 8 Nov 2024 17:06:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/xe: Add xe_lrc_is_idle() helper
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <alan.previn.teres.alexis@intel.com>, <rodrigo.vivi@intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20241108174312.272792-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0200.namprd05.prod.outlook.com
 (2603:10b6:a03:330::25) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA1PR11MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 2153de5a-0767-4e9f-77e1-08dd004195bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmlvZytGNC9kL3pPOXJ4N08vQjNxa2d1b3VoMjB5UFdFMGx5ZnlxUmhQNUtL?=
 =?utf-8?B?ZkVEU2NqOUVXRDNjK1Z5bVFadVRyNFRiYXQ1bndNQXJld1o1TUVnT0QySmhO?=
 =?utf-8?B?UTRKaU9LRnJYS3NOOEZSVUE5cHB1UmZReFVybmJlN2ZhZFNxWFhZTUxodVdx?=
 =?utf-8?B?andZR1RIYWZkZ1IzSHFzbmFZQzlBR0R0dDBJWkdBcVNTYUdmUXV0YjB3ZVhR?=
 =?utf-8?B?dnVoT2dQY1BlWHRKdmVRdVRFVzBobzFKd1g4Z05aVDNqVVBHblRTcEFFRUVR?=
 =?utf-8?B?Yzhxc2hEc1Y0NFIyZVdweXlNTlVFRzhPM0M3eEthU3BPdEV5UnQ3aUR1aGpF?=
 =?utf-8?B?Sy9OV0NJVk9WWDdjVlVKZWNXZkFISStrRXlBSWt2ODNsUmZNbTJ0N1VrenJW?=
 =?utf-8?B?MFlPUWRXQmxrQlN5ZVVVK2RqaUk4WUxwM05zMVZ5a3BuV2hjdE1JakZ4aHRS?=
 =?utf-8?B?QlRTUm1qdTdOcU9IRklETjArTlFEd1Z6TVZXWUV1cEtVNGF5M2pFNlZ1SU1J?=
 =?utf-8?B?UkdjZ1BlMUZQN09kNnlKN1dMVENGamZKY0NTdEZ0REF1RXRGa04yczQwQlRz?=
 =?utf-8?B?M1U0ZEo1VG1zWXV5M25PREs5NEorei8wWmNuZ0x3ZkhHcTg0RlozS1l3ejVV?=
 =?utf-8?B?ZEpvVFhaVjB5akpIdG5taHdQN0FjSjFkRnZUK0ZiYUdOeWhsSmV2bjVuV1R3?=
 =?utf-8?B?QVg4RDV4SlpmeWxsSU85dm1xK3UwblBqcXdXbldRMDNJTHpiRWMyRXUxL3JQ?=
 =?utf-8?B?TUNhaEx2YzdVOTlqNUZPNmhKaEdYYS83d0Z3YnZ1RTJRYTZqc2kzUzJDQWpz?=
 =?utf-8?B?U1ZITEF3dTNub2JCMGU2WWdMR2VxY2hYbWRPWHowOGVXem13Sk4rS3Z6VXpy?=
 =?utf-8?B?Wm5sQllVTWl0YzBoNEM4Slp0cTE0TjB6dGhEMFRuT3MwT2NGRmR6QUtrMUtC?=
 =?utf-8?B?TFk4Qkl1VTZXcUlHWUNQMDFUL1p5Znhva3FnLzk3RkI2Qy9GMnFVQ3FDRzhT?=
 =?utf-8?B?Qk5yUTBITmxNOXdXRGQwZmVYL3ErcFN1ZHpmbnVGSk5aOHdDY0thdERqTEtH?=
 =?utf-8?B?RFlTdGV5TTVjMXdDaXozVWhraHpWZTZXS01GWm1mYWZzbmV1UTlQVmFNTDdo?=
 =?utf-8?B?dHMwa3M0TlZtZHFPQm55b1pGOUZyd0hOempVeVk5Q2cvbUZlcVVPRFQvUDUv?=
 =?utf-8?B?TGYzdFF1aGtLTDBnVWZONmpDZTU0b2lEVE1mOUptZytuSGU4clRnejE2S1FM?=
 =?utf-8?B?WlhLRDZNcGh1Ni82bUs3VkFpN0NBRHRJSTVjUkFhZkFQaGswR3R2RVZZRWEw?=
 =?utf-8?B?VTdaeXQxOGRoOUFoZlFWU2ExQWRsRlNINW5rKzBqU0VZY1FoTk90TnBYa0Iw?=
 =?utf-8?B?YnN3QlVGT3ozNXJTTUpialZGcElkdGJnOW5YZzNUQjNnUjZqcTV6d3VFNThJ?=
 =?utf-8?B?eitrMDVXUDA3THYvN2NDRXcrOVR5QTM1eFNGcEVTSUtzcC9yMFFkSGVTM1FY?=
 =?utf-8?B?NkdVNnlPbmxEVWx0VG1kSk4vS3RZT1ZmRGVnbUJGNU5lMCtOV0hNODBnMHg1?=
 =?utf-8?B?L1l1WXIxam9IR1BscStZMzZVc2NEVWpDc3Z6dDhMU1ZFa1ZBOXVkU1FQcHpG?=
 =?utf-8?B?M003SnBnTThoR3BzdEtGWllzR0tFTU1BUHRUS1VkVzQxVUVUdnFUK1A3K29Q?=
 =?utf-8?B?RlJwOEVkc3BKNzhNd0V4Qk1VV1BVZ2JVQ3g0bmlUcVMrVm5BSzVabUZCWkk1?=
 =?utf-8?Q?pUWpYa0wQwBtQyTjkgMZ3c2cxAfgALhQGrZr8h3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXRkcU1BczZVL2xPU2pQTzMyY0lYcXlpY1BMRGRHY1R6SmlnVWtNbi9iNzNM?=
 =?utf-8?B?cVdQZ2txWDNWeGV0dlBaVVM4dzZpR3ByM0ZCWUl6alg5WFJxQXZjQm5kcWRP?=
 =?utf-8?B?WjVhcXh0blhYaVVPWVY4NkpXc0xNL2loV2l0NTBFZlAva2tCalVvSlkxb2hI?=
 =?utf-8?B?eWdLSE9sQU5oR0c2eStWSlg1RkZUM0dHUVJpOWkycVNnZDgrMDdidDlVWVVo?=
 =?utf-8?B?OGI5alhDMG1rSWNOaURnVFBqcnBPV3BnSDY5dk9xVytnRUcwWUtkaHNjR3Z1?=
 =?utf-8?B?WGQ1cEJhQTNjdzJzUnh4SVR2eExFL2dYdGRRbUZRc1ZqMHE0b0cwOWMwNVJM?=
 =?utf-8?B?SzYwdTdiSjVQNXB0UU5VRlpyeW51b1JWNFN4QkhEdlQ5dzgrYUlvdmxlUlFY?=
 =?utf-8?B?MEk0S0J5MC9nWXl4dk9iUW9JZ0NUYzBleUNVdmxTQ2dwNmgybHpGSFZZZG1H?=
 =?utf-8?B?dzNIMG5XcGs0VW0rTDNDcmIxSGMyVU43L09tYVZQazZJTVEwMUxqeWxuVHhi?=
 =?utf-8?B?Y3FTNnNXblVkczhReE91eGlNaWRJWVFNNWxJcEdrUDArQlQ1bkh4bzNaTWFI?=
 =?utf-8?B?SGdTU1hUVENkM0NsWWcyU0xrY2kyWGczSmFtM2N6SzNrcHZKeUdGN3J0UXZR?=
 =?utf-8?B?dEN0c3FsaWxMNzZQaVNhVVhlWmRMYWFBRVJjamM4OWlDWnZQNHhFOGllRVVz?=
 =?utf-8?B?dGJ3TlAzVnE3WmZGNVN0Sk9pNzRVeDF4U0h2c3lybEVMOC9zKy9KZEZKbVVj?=
 =?utf-8?B?N1p0clNsdG9yVXZCY0cwQ0xvWElNeUx1a2xuQmdQSFVTWTdrVFd3OXBzaWVa?=
 =?utf-8?B?QXBOK3ZzQzI1VGtacXkrcUtkTDhMUFlnczMwV2l5YU5obm51NGtETVN5M3dz?=
 =?utf-8?B?RkxDSndRU0pjZUw2eWRZdVEyL0RZVXJkOEE1VFo0ZUpEemFNYTNBajZzVXo5?=
 =?utf-8?B?RFZpQVZyVEdMYk5iN2RSU242aGZHc2JCN2taTGJwSUhCRUFObVlMeWY4Qys3?=
 =?utf-8?B?MDN2blk5N01ocUFLNW9qdmV2ZWsrV2QyYk1Tandxcno2aG9zbzVkYlFKMUlx?=
 =?utf-8?B?VjFaMkRsajlvQURGV3Q3WWhVMDljRi9jazVsdS9kRm9nU1kwbEJrTi92T2dQ?=
 =?utf-8?B?b0lyT2dPMFFzUUFwR3lUZzVwRUM1RUw0YkRlQWlic2Z3VzRrSUhFcDI4aTk1?=
 =?utf-8?B?OTlIZTVBNE1wQ3VtWEd2azVEbWpnZ2FTSVBQRjQvanZWamlJSE5HVTZEeHh3?=
 =?utf-8?B?azRnZWlsRTRaWmZTdk5Bc2tsOVRySXNsSVBUUkJ0ZHdtQjZVYkRJSFYxajQy?=
 =?utf-8?B?WG9XRHNBWStXZ25yNjg2NkY3L3NVU1BqMjFYRUpOMEhsb25QR3VibE9hWkc4?=
 =?utf-8?B?VE44R0ZYdER2Y2F0ZUpST05FWVV3MlQwTEFsVEl6Yi8wUlJVb3V6V21iWUpK?=
 =?utf-8?B?aW9tclNYd1ZsS1lObExrMEJLKy9FTFhVWi9oa1lRa2p4SUE1SVRyOUFnZTAz?=
 =?utf-8?B?RzE2eEp0KzhXTjJ4ekxtU1RiNkUrZHNLSTNmYllqY25rTzdMYXliQTdYL1Z2?=
 =?utf-8?B?MTJjdU1ONE1mbzJVRkp3TTFXc1dBS09Od2xBdzFPazJYZk1Cc29nMDVPOTdz?=
 =?utf-8?B?YURSaGt6MlRKUTYxRlJYVUxiT1hVejA2eXlxWTV5eEg1aXZybXFTT2Q3TEdW?=
 =?utf-8?B?Smx0YWtUa0VYcklWMkhXdE9rODQ4TGViTUwxTG1xMFVzQXQ0WkIrY1VZUmxx?=
 =?utf-8?B?QUZTOHVFTEdMNlNYVUpRUFpUcnhmUUtQSG5UTytIL3ErZFRNdzl5QzdSOHVo?=
 =?utf-8?B?UVA4ZnEyeDR4cGg4WUx2dmJjeE5QVFpQQUxIZTdhQ2haRWVvN29DSmJuWFJo?=
 =?utf-8?B?MThYU3ZwcDBHSHhTWTVrMmR6OXdLQnR5RmE3ZzFtKzR2RG9ycVhaT2poRFda?=
 =?utf-8?B?cXVkTWRieHRmQUordCtoSDJ1WVRtU3h5c0F2eWNyYlVDOW1wRmdSV0tVSUVP?=
 =?utf-8?B?cTJUSmF0alEweVM5dW81SFZ3WEVobWpTOVo1aVBWSUJtMUhWMDNPczdQSW9T?=
 =?utf-8?B?TXpLRjhuVUZ5RWVnN2x2TkpYNmVRVDNIYjlnZ1FpNm9VdEVVM3R6T0VpalF3?=
 =?utf-8?Q?zsr9N7hVW3iB4DwWkTSfhByyv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2153de5a-0767-4e9f-77e1-08dd004195bf
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 22:06:24.3608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VK///4up6SSTqfqgSjyuXI1btFPeLquKCgPb+3z4uin1slTrace7BAXPoT9HSmxiwHF8hvzyd9/UX43RTgmIYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6220
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



On 2024-11-08 12:43 p.m., Matthew Brost wrote:
> Add helper to compare ring head and tail to determine if LRC is idle.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
>   drivers/gpu/drm/xe/xe_lrc.c        | 13 +++++++++++++
>   drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
>   3 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9e0f86f3778b..e7257c681278 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1705,7 +1705,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>   				ban = true;
>   			}
>   		} else if (xe_exec_queue_is_lr(q) &&
> -			   (xe_lrc_ring_head(q->lrc[0]) != xe_lrc_ring_tail(q->lrc[0]))) {
> +			   !xe_lrc_ring_is_idle(q->lrc[0])) {
>   			ban = true;
>   		}
>   
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 4b65da77c6e0..e219657535cf 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1763,3 +1763,16 @@ u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
>   
>   	return lrc->ctx_timestamp;
>   }
> +
> +/**
> + * xe_lrc_is_idle() - LRC is idle
Mismatched function name here. xe_lrc_ring_is_idle?

Regards,
Zhanjun
> + * @lrc: Pointer to the lrc.
> + *
> + * Compare LRC ring head and tail to determine if idle.
> + *
> + * Return: True is ring is idle, False otherwise
> + */
> +bool xe_lrc_ring_is_idle(struct xe_lrc *lrc)
> +{
> +	return xe_lrc_ring_head(lrc) == xe_lrc_ring_tail(lrc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 40d8f6906d3e..9d64cedc4d14 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -78,6 +78,8 @@ u32 xe_lrc_ring_head(struct xe_lrc *lrc);
>   u32 xe_lrc_ring_space(struct xe_lrc *lrc);
>   void xe_lrc_write_ring(struct xe_lrc *lrc, const void *data, size_t size);
>   
> +bool xe_lrc_ring_is_idle(struct xe_lrc *lrc);
> +
>   u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>   u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>   u32 *xe_lrc_regs(struct xe_lrc *lrc);

