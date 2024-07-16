Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9612C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 21:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC9710E8D1;
	Tue, 16 Jul 2024 21:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKeRturA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3364010E8D0
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 21:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721164553; x=1752700553;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WbgAZRuC74n4Cyz2bYDOgljGyZJu4QTYX6DjpB0ndn0=;
 b=HKeRturAICB2wWVfpf//vh8nIH8U3YK4ubbC2u6J7SNvbo2sn/PGB+/p
 m/4UWi5tASlv9GJ++5r0vNQ0eSlD+YRq0z6YVsIZHCZBUR3vAmDGg5/ue
 mg1AkIhI+/25r9FaArUYqZtAChZTCGry8PrtZ9W5s1N3+wX1izbGosgBp
 Gj9+3Wr9aqyxrOtfTojrq5AgNVs3MNSHgRVLElOtz/QAOnlvmGHNWo+YC
 OcI02j+baAImPCWFbn/EV5vwvtL2+vMWIi3wXwoJi7MefBUUapyI27tCt
 4Cyh7xKfEwm2kV4SQhHeiFSwpKfVr/LikyKddloFMJzzfe8FBQ2C+Zto3 g==;
X-CSE-ConnectionGUID: ZlPuVQ/0QK6JSDL1zPxvPw==
X-CSE-MsgGUID: G/t7ssk9SWOKpdYuIPM04g==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18591464"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="18591464"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:15:50 -0700
X-CSE-ConnectionGUID: T/d0kyytQNi3hqBVTApLzg==
X-CSE-MsgGUID: BEal6oKhSw6ZbN0ONZiKhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="54376853"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 14:15:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 14:15:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 14:15:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 14:15:46 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 14:15:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAY7T4T5X8kWhgdBWdS0NaiuH6SsSAUdJIYxxxmHLPl0cbZHZAZqCbVnpxIYvrlHf/7Cr15aXLOuy095aQJQqLB78dCCTmkmu8aaS3FYZFUxJatE6wr7KSZpBIR/zqPNOueQOSdScxH1dirUMZKTCZTeiQEN/h5cDa++WTnjbubpP+hUY8J6RoU8ftzsSjF3QDu0QfUJr2Z3vZq0K0azfphg/8bxA2ZeNEooYwEt4rvbkjByabTeJ2pBMn2f/E6GW5Zbq7Mu06zCNoIM//omSa6eq9uVcTlhhf0nK6umN4VimLRwiqPxs7YeZwsu7SoP9IvX0qbR+PS3Mnt5X0+JtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5vvLgBZMA27vV4uQqU722E32xK8C/0QUvoQCSLMRfU=;
 b=vqx1/yKa8o7/+p4GhM6Q5mvM0kebo3I7RGfVDL/H+qcwJCyrAPKAxkZ97HQ1XdhLfaXENJMyLUqC4D56VK3NMXgV3lWTCE/1peszXT76CvKTW0AL1poo8gWhiHlPL5/Ta9bMkquVwOH3dbsWoAPM6lMkACjFncyGEj60GmFj7BM6++ChTdXTfZe8k7hvmiaa4jWWyV2E62cAILENY/P6tnG2eTpziA16PeYlfFUNb6HBsaBW7CFnFgR3jjB60D7PweQDEExDWKf3d/UpSChkA8q6wU6d/W0ci/CxXrkxulbEYghx2kCA10SD1sUulmmP/l07iCYJ0dBuG65pGDi3Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 21:15:44 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%2]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 21:15:44 +0000
Message-ID: <0d75e8a8-2fd7-4488-9455-94386c66c60c@intel.com>
Date: Tue, 16 Jul 2024 17:15:40 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/5] drm/xe/guc: Extract GuC error capture lists
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240712164724.677393-1-zhanjun.dong@intel.com>
 <20240712164724.677393-5-zhanjun.dong@intel.com>
 <9980eccb5e5b6ff3479211595766cf2a92fae4f2.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <9980eccb5e5b6ff3479211595766cf2a92fae4f2.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::22) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f38fc4-0539-4f2f-1fb0-08dca5dc741d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDh2cU5JN3ZmY0dtYm0rSW9OYkZCWm1tMDVFZG5lekE4cjdOWWtaNjc4SEJO?=
 =?utf-8?B?aGpGWTJZTitrQ2Fsd291MnNDRUpQalJJcGhHTVRHQkxJTkN0a0RhWkhqZkZR?=
 =?utf-8?B?QWtIbzFwcmxDa3FvVU9yOEdNMnpYbDlLTEREdnc4OFdlNkFqOXFQQWpkU2Fq?=
 =?utf-8?B?S0NmQlBZWWZqWUVZZGppN2RLcnFTNEF1RnV4SW9aN1ZyT2VnWGNYWFJKNGZ5?=
 =?utf-8?B?UThHdm9Ta3psVURmcTZ4U09RbU5uNGJPOU85SHR2alo1am9oSWFqWGt1Z0F1?=
 =?utf-8?B?S3BGMEI1NzgrZHhZcHROdy9kTVNvN0lvQjJJSkl2YnRQL0NFZFpFem9zOC9p?=
 =?utf-8?B?NUFxZk8zWVVscCtTRmE5SzdoTXlwYnR3SXE0dVJNa2EwdkRtNmpKQzhFUHFk?=
 =?utf-8?B?QWhadkpNT0x5OHdxTjdmV0xYSEQ3UjNWTHhUMmhMYXYwMFhwOTV3YVlHaE5D?=
 =?utf-8?B?bno4cmJwdlVBa2xJdzN5eVhNS0gzSnlTb1poWkFTbFlJTWhFbjd2QVhld0lS?=
 =?utf-8?B?bm5YMEtCbGNsaUJrWkl5VlNxcmYwZE9lbmhuRVlPdlFsSXhDUUpDbEUvS3R0?=
 =?utf-8?B?MUo0aytoNUtuUzYrMC92SVFzK1NuaEFOeHZ3K1B4Sm5pUWJGNVJTMkUwbXhs?=
 =?utf-8?B?ckpFcml6RXhXM1BwTEN3bmVsUm9MdVVqLzZtWEZ1RHdVb2ZMbVFQK1VmRDVw?=
 =?utf-8?B?eDJlUGpaRFZ0YVRxTHB4UkNrY2xFSjlKeVZvVTY5d2xNR3dwYnNnTGpSaHFI?=
 =?utf-8?B?Ry9IUndzOEtxUytvbXBxR2QzWVNsOEZOM0RseGJ1TmZtNVJqb0xnV0xXYUpT?=
 =?utf-8?B?VVVlby80YThGM0tFZis3N3lraWRXaitTQ0gxSCs3SWR0ZVJlTlZFNTNJL1lU?=
 =?utf-8?B?QjZ4WGFyeU1rcTAzYURxODd4TWJtRE9IRjJoR2ZuRzZsZzlIWThhZkt6VGx4?=
 =?utf-8?B?azRZSXFiemR0WDJINEE4RW41UUllNE0vZTEyYmdvVzR6bVNnTzA1MzBOS2d1?=
 =?utf-8?B?Y0lYN0E2SVBIY2NxWElRMzRFN1J5eXNaYW9QRVp3UDlhbkl6ZUl3WThOQ3RW?=
 =?utf-8?B?MHRibGdsK3doWlA3UnZlbVJIWmRrc05pS0ZxSjE1QXF5aFNKVlMybjZ4WGds?=
 =?utf-8?B?RXh3bllRZ3JZK2FlMzlEamFFdjZkbjd2MnpmQy9DL2RhNW1NTzFHMjdWUm1n?=
 =?utf-8?B?bWxhdit3OTU4UzR3T1VrZUpRUlZFZXNvM0dMS2ZiSjU4RFcza09ZSVhmZFo1?=
 =?utf-8?B?RWlvaTJPRVZwWjBzcEp1TytyS3BNT2o3UFB6SVlhMUpCOEJIRUxhaUVWaEJz?=
 =?utf-8?B?SDJrWEFialBMNVBQbitEazlMbDk5bFMzanhEY1FoMm5HVGhnUWpLZ3NOUFlB?=
 =?utf-8?B?RTdvTU9KSmVCbTBMZ1J5Vk45a2xOaHVQa0tBQVM0NStzaEJaUG5oci9WQXgw?=
 =?utf-8?B?R3V4djZpL0RFNWFRTGlGa05rOWhIMXF2OFh5UXJnZ1dCajF0TGQvcDkwSzlV?=
 =?utf-8?B?QnJ4WFErOTNTTXZHTEpSTVY1anIvTmdXL2pOUTBZRE9GQWp0KzU3NHNFeVVu?=
 =?utf-8?B?L05HbENEc1YwTFRSTjJnNWsyMVBZVmJObTgrQlZGMGphb25ud0lvWkxpMWcz?=
 =?utf-8?B?UTdyNXYzUi9TY2xOQnc2NlQ1ajZRbzZ4bzZ5Mkd6elF5OTNIOXZRRWFiNms3?=
 =?utf-8?B?d3FSSkV6WHhxbUd0dnBETjRvdnhyZ3hXS3d0TE82elVRbDUrc2dBWVQvakQ2?=
 =?utf-8?B?QTRQeGZScTByZi8yL1FnTUZCZm9JQkMyclpaM1BSOC96VEFKSXZ1aWVTS1BN?=
 =?utf-8?B?ZnR3d0huNWhCQ3E5R1VQZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1BZUkdjbUc3ei9oSDROczBMbUlXS2hwdm51Mm5jUTJOZStNbEhLbUk5emhY?=
 =?utf-8?B?OUpreGNRRFdGQ2JXWS9DdEhpdVJKQTV6RklWMzVTLyt5TlJmWHBUbVVtN3RI?=
 =?utf-8?B?aUFKQTJ2cVlPNVNTTzZvdDZhSWRraUlVZTZRWEhIb3hWTGtwWk50QU5Obit0?=
 =?utf-8?B?b3BaTXczRFVPbkx5L2pCcFhOQVczRHhvS1ZvN3VWbjI1b29QbWhNUE5la25S?=
 =?utf-8?B?V01IREptYnZCNXBQc2YyVTRLbmpXUUJ5UW1tV2JYZnlYNjJkK0hQY1pieHR1?=
 =?utf-8?B?QXE0TDNKM1dHeDJaYk9KbFNrZWVrQjVrTWVtU3M1bkFpUzlpVXcwYW1pYjNJ?=
 =?utf-8?B?Wm5MTG81WnE0Z3RuVldjaGJHMnBKYzVBQkpqZGxOT2lnbTZJSnE3TU9wL0Na?=
 =?utf-8?B?ZXNaVU01ZlJtN25RMzBFbEE0NUNzTHJzWmtHL1dSRFAwLzBQYlpITnpyMFdT?=
 =?utf-8?B?WkI0b3lxQWdnS0FHY0x4OWE2dmRZTENVNERzQWI0cDQwUG5GcXNFNGtaYWpP?=
 =?utf-8?B?dHg4UkVEVUZ0dllJd3lWN2FQRVY0U2s0SFZyQWNuKzJvc2FJSkQ0RTYzVklj?=
 =?utf-8?B?dlpDUGtnYkVsZm1kdUR2NFJBODJ2VzFibVkxL0c3RC8wbDdUNGhUVXBEcjA5?=
 =?utf-8?B?Y2lIQkdOSjJBM2l1dHc0Q2ZockJLNVZsODVTd2cra2FueENpWVdBZ1VFSXU1?=
 =?utf-8?B?Q3IzZ2hkb09YRGs5RFJhU0w1QTdPRUtOZ29MQjFpN3dQbTRzN01qditQd2cr?=
 =?utf-8?B?QTFzTDNRTTJkOUZwc0FFUllCYk8vbGxNeDZvWnplaU1ReHdHVGY5NHhkMXpw?=
 =?utf-8?B?bEFTYzlUa0NhVkVPNVlqZkFDdGxQTVpQVUdpK1BEa3h4VVVLQVNyVG9WUFJt?=
 =?utf-8?B?MWhKbEt3bk9xWmRaSC9jdmFEd3BrRjZPYTRTdUd2S2sra0NQcmJqRjFhMzl6?=
 =?utf-8?B?M2cvRjM4b3UrbmN1aVFONkp0V2x4R2xncGtJS3hjVkpkY2xoZFBJV0dLSUFr?=
 =?utf-8?B?dXlOY2dNbll0aVFnVkNXYUE0NWVYbjBEWTZLbFUrRVZMeXBtcUpiWDhiMjFy?=
 =?utf-8?B?b2szck44V3BqZk5wellieHJjT3hlUThwVnJzdDNmaitkMEhPSVc2VGVyZ1Mv?=
 =?utf-8?B?Y1I1MFNWSGE2clN1aUU5OHNFRWp3N2o2WEtzaHRoZGpoenlMSmFFQTFmTWNk?=
 =?utf-8?B?cHhsT1VRS21FM25zL0xuYW5lVkxqQVJRWjNUVDNRZ2VWZkYvdmhTV2t6cG5E?=
 =?utf-8?B?OXNKL09GZ3RZcTcySFBXb0cySlVaWnRUQUlqMzIvekpGWlNYMU53QW0wQnk3?=
 =?utf-8?B?QTFZanRxNHpyM2l0ZmJ6OGNXcWtOMGlhRXovMjBRZ0tsQ285UUxxYkZaSUhB?=
 =?utf-8?B?NDZsRVhDU1lxeHBCWXpKUkZJVFBVNHRvRTFQVnhsVW1lSjFKVUthTndFQkJN?=
 =?utf-8?B?WHZxNis1RnJOb0NDdzduSmI5VmxTU1VTSE84c3BwWDNlNXZwa0tNSGpBTmRw?=
 =?utf-8?B?VUg3Ti9pTnUyTVBXdFB2ZUxWRjh3K09sWlVualVYODFjcmg1NTMxWWg1MXlx?=
 =?utf-8?B?ajZtVFdKaWJZVk0yS3k4MEZKR0oxeVQ2T2hwdW1VUzlzdHFpYUxTeEFZc1h1?=
 =?utf-8?B?ZEY2bC9BWFFBSXZ3MFlGaEJaYW5rcHgyV2VVVHY1emV3d2kxM0hFUEZueHBo?=
 =?utf-8?B?WklBVENYUXZVeHJ6Zmk3V1FvYTArbjMzLzF2eE1qNWpKeDNJTU5zZHJsWW1n?=
 =?utf-8?B?T2NvU0lZMlV6eEhkM2VGZncvNk82cnlZU01iaC9tNWx0cEdXMXpvaEk0YUJJ?=
 =?utf-8?B?Vmo1RUFjWkhOYTZGaUJ6b3YveW1FaWVxNm5YaG9tMTBNL0duSlZ0UktYd1Fu?=
 =?utf-8?B?bjN5dkxmTW9RYTI4MnozRmpiMGJwZk5pWXJUeExCZC93Y2ZrRUZwM2N6clh6?=
 =?utf-8?B?M2dJd0ZjKzFObEpydXpHNkE0ZnJMdDVkb1F1eTV0K2ZLZDBEb2FPNWREQU0x?=
 =?utf-8?B?VVZGUUViSVlXcXdDQ2gzenNSQjdzZWlkODB1Q1NSY1pRdWpHNldiakRJdmhQ?=
 =?utf-8?B?bnM2QTZYaXhmMisrVG5RT0ZGbzdGdHc2MWxueWpCS09iRlVVUFZVOWdqd005?=
 =?utf-8?B?OTlURUI1V3NqaWVCdFBBNis3b3BPbTlKMGYrNVhPenFPVDFIUm56Ri9TZUhr?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f38fc4-0539-4f2f-1fb0-08dca5dc741d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 21:15:44.0742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5GEsGhVWyjHTty6O0YX8hPGZnUIW/QGoyPYUp03Al2EimXITUHDN+/cTjCxnHfUYVPnU7h7sX2QRb8aBN6C5A==
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

See me inline comments below.

Regards,
Zhanjun Dong

On 2024-07-13 12:38 a.m., Teres Alexis, Alan Previn wrote:
> On Fri, 2024-07-12 at 09:47 -0700, Zhanjun Dong wrote:
>> Upon the G2H Notify-Err-Capture event, parse through the
>> GuC Log Buffer (error-capture-subregion) and generate one or
>> more capture-nodes. A single node represents a single "engine-
>> instance-capture-dump" and contains at least 3 register lists:
>> global, engine-class and engine-instance. An internal link
>> list is maintained to store one or more nodes.
>>
> alan:snip
> 
>> +static int guc_capture_buf_cnt(struct __guc_capture_bufstate *buf)
>> +{
>> +       if (buf->wr >= buf->rd)
>> +               return (buf->wr - buf->rd);
>> +       return (buf->size - buf->rd) + buf->wr;
>> +}
>> +
>> +static int guc_capture_buf_cnt_to_end(struct __guc_capture_bufstate *buf)
>> +{
>> +       if (buf->rd > buf->wr)
>> +               return (buf->size - buf->rd);
>> +       return (buf->wr - buf->rd);
>> +}
>> +
>> +/*
>> + * GuC's error-capture output is a ring buffer populated in a byte-stream fashion:
>> + *
>> + * The GuC Log buffer region for error-capture is managed like a ring buffer.
>> + * The GuC firmware dumps error capture logs into this ring in a byte-stream flow.
>> + * Additionally, as per the current and foreseeable future, all packed error-
>> + * capture output structures are dword aligned.
>> + *
>> + * That said, if the GuC firmware is in the midst of writing a structure that is larger
>> + * than one dword but the tail end of the err-capture buffer-region has lesser space left,
>> + * we would need to extract that structure one dword at a time straddled across the end,
>> + * onto the start of the ring.
>> + *
>> + * Below function, guc_capture_log_remove_bytes is a helper for that. All callers of this
>> + * function would typically do a straight-up memcpy from the ring contents and will only
>> + * call this helper if their structure-extraction is straddling across the end of the
>> + * ring. GuC firmware does not add any padding. The reason for the no-padding is to ease
>> + * scalability for future expansion of output data types without requiring a redesign
>> + * of the flow controls.
>> + */
> alan: I see you have decided to change the function for extraction
> data when it straddles the ring end. Please do ensure you repeat igt
> tests in a loop with instrumented kernel messages (or any other means)
> to ensure its excercising the case where error capture data being
> extracted straddles the ring end.
Sure, thanks.

>> +static int
>> +guc_capture_log_remove_bytes(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
>> +                            void *out, int bytes_needed)
>> +{
>> +       int tries = 2, fill_size = 0, copy_size, avail;
>> +
>> +       if (!guc_capture_buf_cnt(buf))
>> +               return 0;
>> +
>> +       while (bytes_needed > 0 && tries--) {
> alan: not sure if limiting "tries" to 2 is sufficient. in the
> worst case scenario (straddling the end of the ring), we will
> experience the following:
> - worst-case-#1st-try: avail < bytes_needed, copy partial
> - worst-case-#2nd-try: avail == 0
>                    (since we reached end of ring in #1 and we have
>                     not haven't set buf->rd = zero in which only
>                     gets done in this step)
> - worst-case-#3rd-try: avail >= bytes_needed
>                   (now that we have wrapped around the ring)
> 
> That said, i believe avail tries should be max'd at 3, which is
> different from the old "guc_capture_log_remove_dw" function that
> was designed to remove ONLY a single dword and only called when
> tail is to be at or near the ring end and needed to wraparound.
Sure, will be 3 in next rev.
>> +               avail = guc_capture_buf_cnt_to_end(buf);
>> +               /* wrap if at end */
>> +               if (!avail) {
>> +                       /* output stream clipped */
>> +                       if (!buf->rd)
>> +                               return fill_size;
>> +                       buf->rd = 0;
>> +                       continue;
>> +               }
>> +               if (avail < sizeof(u32)) {
> alan: although this check would actually be true if we are
> in fact not 32-bit aligned, considering the prior check for
> if-zero-continue, it is however such a late place to check for
> alignment (i.e. right at the end of the ring). Might be better
> to check for alignent on the input size "bytes_needed" at start
> of function and also using "if (avail % sizoef(u32))"
will add assert at function entry:
xe_assert(guc_to_xe(guc), bytes_needed % sizeof(u32) == 0);

>> +                       xe_gt_dbg(guc_to_gt(guc), "Bytes extraction not dword aligned,skipping.\n");
>> +                       continue;
>> +               }
>> +               copy_size = avail < bytes_needed ? avail : bytes_needed;
to be:
misaligned = avail % sizeof(u32);
copy_size = avail < bytes_needed ? avail - misaligned : bytes_needed;

bytes_needed was asserted at function entry
Then copy_size is alway u32 aligned

>> +               xe_map_memcpy_from(guc_to_xe(guc), out, &guc->log.bo->vmap,
>> +                                  buf->data_offset + buf->rd, copy_size);
>> +               buf->rd += copy_size;
>> +               fill_size += copy_size;
>> +               bytes_needed -= copy_size;
and here:
if (misaligned)
	xe_gt_dbg(guc_to_gt(guc), "Bytes extraction not dword aligned, 
skipping.\n");

So if we got 6 bytes, we copy 4 bytes, print debug info and skip latest 
2 bytes and retry if not reach max.
>> +       }
>> +
>> +       return fill_size;
>> +}
>> +
>> +static bool
>> +guc_capture_data_extracted(struct xe_guc *guc, struct __guc_capture_bufstate *b,
>> +                          int size, void *dest)
>> +{
> alan: actually, I realize that based on the goal of guc_capture_log_remove_bytes,
> it means "guc_capture_data_extracted" is not needed anymore. callers only call
> guc_capture_log_remove_bytes once and that does both cases (case1 -> data to
> extract fits before end of ring... or case2 -> data straddles end of ring).
Right, this function no longer needed, to be removed

> 
>> +       if (guc_capture_buf_cnt_to_end(b) >= size) {
>> +               xe_map_memcpy_from(guc_to_xe(guc), dest, &guc->log.bo->vmap,
>> +                                  b->data_offset + b->rd, size);
>> +               b->rd += size;
>> +               return true;
>> +       }
>> +       return false;
>> +}
>> +
>> +static int
>> +guc_capture_log_get_group_hdr(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
>> +                             struct guc_state_capture_group_header_t *ghdr)
>> +{
>> +       int read = 0;
>> +       int fullsize = sizeof(struct guc_state_capture_group_header_t);
>> +
>> +       if (fullsize > guc_capture_buf_cnt(buf))
>> +               return -1;
>> +
>> +       if (guc_capture_data_extracted(guc, buf, fullsize, (void *)ghdr))
>> +               return 0;
> alan: as mentioned above, this function not needed anymore.
to be removed
>> +
>> +       read += guc_capture_log_remove_bytes(guc, buf, ghdr, sizeof(*ghdr));
>> +       if (read != fullsize)
>> +               return -1;
>> +
>> +       return 0;
>> +}
>> +
>> +static int
>> +guc_capture_log_get_data_hdr(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
>> +                            struct guc_state_capture_header_t *hdr)
>> +{
>> +       int read = 0;
>> +       int fullsize = sizeof(struct guc_state_capture_header_t);
>> +
>> +       if (fullsize > guc_capture_buf_cnt(buf))
>> +               return -1;
>> +
>> +       if (guc_capture_data_extracted(guc, buf, fullsize, (void *)hdr))
>> +               return 0;
> alan: as mentioned above, this function not needed anymore.
to be removed
>> +
>> +       read += guc_capture_log_remove_bytes(guc, buf, hdr, sizeof(*hdr));
>> +       if (read != fullsize)
>> +               return -1;
>> +
>> +       return 0;
>> +}
>> +
>> +static int
>> +guc_capture_log_get_register(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
>> +                            struct guc_mmio_reg *reg)
>> +{
>> +       int read = 0;
>> +       int fullsize = sizeof(struct guc_mmio_reg);
>> +
>> +       if (fullsize > guc_capture_buf_cnt(buf))
>> +               return -1;
>> +
>> +       if (guc_capture_data_extracted(guc, buf, fullsize, (void *)reg))
>> +               return 0;
> alan: as mentioned above, this function not needed anymore. also
to be removed
>> +
>> +       read += guc_capture_log_remove_bytes(guc, buf, reg, sizeof(*reg));
>> +       if (read != fullsize)
>> +               return -1;
>> +
>> +       return 0;
>> +}
>> +
>> +static struct __guc_capture_parsed_output *
>> +guc_capture_get_prealloc_node(struct xe_guc *guc)
>>
> alan:snip
>> +static void __guc_capture_process_output(struct xe_guc *guc)
>> +{
>> +       unsigned int buffer_size, read_offset, write_offset, full_count;
>> +       struct xe_uc *uc = container_of(guc, typeof(*uc), guc);
>> +       struct guc_log_buffer_state log_buf_state_local;
>> +       struct __guc_capture_bufstate buf;
>> +       bool new_overflow;
>> +       int ret, tmp;
>> +       u32 log_buf_state_offset;
>> +       u32 src_data_offset;
>> +
>> +       log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_BUFFER_CAPTURE;
>> +       src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_LOG_BUFFER_CAPTURE);
>> +
>> +       /*
>> +        * Make a copy of the state structure, inside GuC log buffer
>> +        * (which is uncached mapped), on the stack to avoid reading
>> +        * from it multiple times.
>> +        */
>> +       xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc->log.bo->vmap,
>> +                          log_buf_state_offset, sizeof(struct guc_log_buffer_state));
>> +
>> +       buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_LOG_BUFFER_CAPTURE);
>> +       read_offset = log_buf_state_local.read_ptr;
>> +       write_offset = log_buf_state_local.sampled_write_ptr;
>> +       full_count = FIELD_GET(GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT, log_buf_state_local.flags);
>> +
>> +       /* Bookkeeping stuff */
>> +       tmp = FIELD_GET(GUC_LOG_BUFFER_STATE_FLUSH_TO_FILE, log_buf_state_local.flags);
>> +       guc->log.stats[GUC_LOG_BUFFER_CAPTURE].flush += tmp;
>> +       new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_LOG_BUFFER_CAPTURE,
>> +                                                    full_count);
>> +
>> +       /* Now copy the actual logs. */
>> +       if (unlikely(new_overflow)) {
>> +               /* copy the whole buffer in case of overflow */
>> +               read_offset = 0;
>> +               write_offset = buffer_size;
>> +       } else if (unlikely((read_offset > buffer_size) ||
>> +                       (write_offset > buffer_size))) {
>> +               xe_gt_err(guc_to_gt(guc),
>> +                         "Register capture buffer in invalid state: read = 0x%X, size = 0x%X!\n",
>> +                         read_offset, buffer_size);
>> +               /* copy whole buffer as offsets are unreliable */
>> +               read_offset = 0;
>> +               write_offset = buffer_size;
>> +       }
>> +
>> +       buf.size = buffer_size;
>> +       buf.rd = read_offset;
>> +       buf.wr = write_offset;
>> +       buf.data_offset = src_data_offset;
>> +
>> +       if (!xe_guc_read_stopped(guc)) {
>> +               do {
>> +                       ret = guc_capture_extract_reglists(guc, &buf);
> alan:nit: I notice that inside of guc_capture_extract_reglists,
> we have many cases where errors may occur but we dont print that an error
> occured there and we don't do that here either. Since guc error capture is
> about debuggability, not functionality, then I would recommend adding a
> drm_debug here with the error value. I know most of the error paths
> inside of guc_capture_extract_reglists end up returning -EIO, but
> perhaps this first step is sufficient, i.e. to know an error occured.
Sure, will add dbg print on error code.
Thanks for the advise, actually I found an unexpected error code that 
the function returns -ENODATA on guc_capture_buf_cnt(buf) is 0, which is 
expected at the end of process.
Will fix it by make guc_capture_extract_reglists return 0 on this normal 
condition.

>> +               } while (ret >= 0);
>> +       }
>> +
>> +       /* Update the state of log buffer err-cap state */
>> +       xe_map_wr(guc_to_xe(guc), &guc->log.bo->vmap,
>> +                 log_buf_state_offset + offsetof(struct guc_log_buffer_state, read_ptr), u32,
>> +                 write_offset);
>> +       /* Clear the flush_to_file from local first, the local was loaded by above
> alan: "/* Clear the flush_to_file..." comment block starting should
> have "/*" on its own line and then newline for the comments.

> +        * xe_map_memcpy_from.
>> +        */
>> +       log_buf_state_local.flags &= ~GUC_LOG_BUFFER_STATE_FLUSH_TO_FILE;
>> +
>>
> alan:nit: i feel like this newline above should be between thie xe_map_wr for write_offset
> and the start of the description of "Clear the flush_to_file...". Thus no need newline here
> since above this was about flush-flag and below is about flush-flag. Basically new line
> appeared like grouping things together but grouping unrelated things. Alternatively can
> just remove any of these newlines for these final write-out-update steps. I also thinks
> its neater to combine below comment "write out the updated local" together with the same
> comment block of "Clear the flush_to_file comment..." since both are about flush flags.
Sure
>> +       /* Then write out the "updated local" through xe_map_wr() */
>> +       xe_map_wr(guc_to_xe(guc), &guc->log.bo->vmap,
>> +                 log_buf_state_offset + offsetof(struct guc_log_buffer_state, flags), u32,
>> +                 log_buf_state_local.flags);
>> +       __guc_capture_flushlog_complete(guc);
>> +}
>> +
>> +/*
>> + * xe_guc_capture_process - Process GuC register captured data
>> + * @guc: The GuC object
>> + *
>> + * When GuC captured data is ready, GuC will send message
>> + * XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION to host, this function will be
>> + * called to process the data comes with the message.
>> + *
>> + * Returns: None
>> + */
>> +void xe_guc_capture_process(struct xe_guc *guc)
>> +{
>> +       if (guc->capture)
>> +               __guc_capture_process_output(guc);
>> +}
>> +
>> +static struct __guc_capture_parsed_output *
>>
> alan:snip
> 
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
>> @@ -11,6 +11,7 @@
>>   
>>   struct xe_guc;
>>   
>> +void xe_guc_capture_process(struct xe_guc *guc);
>>   int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type,
>>                             enum guc_capture_list_class_type capture_class, void **outptr);
>>   int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 7d2e937da1d8..7bf9e45abf49 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1106,6 +1106,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>                  /* Selftest only at the moment */
>>                  break;
>>          case XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION:
>> +               ret = xe_guc_error_capture_handler(guc, payload, adj_len);
>> +               break;
> alan: i notice that process_g2h_msg is in the ct queue and we are not
> making modifications to schedule error capture extraction (along with
> G2H context reset notification) into the queue that drm-sched schedules
> the TDR timer. I am not sure if this decision is intentional because i
> thought we had prior offline conversations that we needed the alternative
> to avoid some races. Lets connect offline, perhaps i am just mistaken here.
Since rev 11, the devcoredump capture add a pre-capture from hwe if guc 
capture is not ready, and later on, the devcoredump being called after 
the event wait, which avoid the race condition.
> 
>>          case XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE:
>>                  /* FIXME: Handle this */
>>                  break;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> 
> alan:snip
> 
