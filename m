Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59DCC36010
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 07:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DECF10E98F;
	Fri, 28 Mar 2025 07:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMvf3lHI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD39C10E98F
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 07:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743148347; x=1774684347;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SetbiwI0hQ8sozjCPMJjXf+VaL5wcoCrATk77IFj1bM=;
 b=CMvf3lHICTFc9zvDvOq617mhzcbM6hagmUR1fC6STaXngSIG8c920oVy
 ou5ECiOCuMyaj0wu/hZ8NnY/KhBIRp6vZm5b/g2e9+pCGpphDJ7+BAMNC
 avBV5PmBXG88HEp38nREGeP/2l/+l1v8JnZ5lJxARdyGGe+ga3rpe6tFE
 uRzGRr0bOmahtbUnrILlYuCmJCxQRAk+Bdv2R0NFqQw8gUyGSVUfP7UGG
 nBPcfhQo9hhHSSqo8uhuXBMEH/2+7fU2TcFdICjyjIC0xBiCaoBfWVLk/
 +S03dKDdSXmWk1K2y5HuC0BG8btVSopunTEHncELicNv/RoG2kzy0eTbG Q==;
X-CSE-ConnectionGUID: qD22/KzwQeyi4M6DrMKbLw==
X-CSE-MsgGUID: vzJo3E9bRw224HCm4enBvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55504245"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="55504245"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 00:52:27 -0700
X-CSE-ConnectionGUID: b8dDZsEXR+yvBL68v0Rb8g==
X-CSE-MsgGUID: Hz3bfrYMRNCnH1F6XLHnJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="125363298"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 00:52:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 00:52:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 00:52:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 00:52:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dL02ZXiRkXgkQXzwjqB0QH2NMfzHcpYsogJzl0/rWU0KzGXidSdzXmKBxx0D20ab/J56v6+N9sbUU9/PZRmYN/eG6zox089LPWIqabCSaL5ZyQJMeN6XMpd/F91dzyeNyhA4A8h4JEm+N/gi/BV6B7SlPj04c7+W9jseT2v3DoOrwZWks6f1n01v70gcZYbtVlh3+KqZ6yoqjp6Num/P1DclucCXOilmmBEPsDTd72EcMqY7pwrz9j7P+p6QB3Qxcq8kUW2AKquZh3WzlejLC2GUem/apan657oniB1wHxLc47XcORtmqRhIsMoS/QD46YsCvUduf67xqc0mKn+/Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yz6UXqbuYC17E+P8kMIPe1kdOzGVpydZjDGNdA149BI=;
 b=pCBf3J4shxkKlVdJgB6uTnzpcqW5o7Kf3n4jQ6XJOgp+/rvLxDq3rkYNBsezT/LzX1Sf2pQ19CiG7zSv/PetsYxykUPz2Dx5TtrxdSA5tk1Pr0Ki4Qhe0kvS8vQMlWXl2K4tK0+s0FHvqieP0/rjmSCthRDU9T87sEe2TCA2BYBScbSFtfP50XJZYZtpYEWclOeGbuW0M9dMD9OoIAO5MEVcGrFTbVvtVh1XK18jRceVXKI8IS+wcp0WhYIZLiSbRnrM0dhyvzT6yWMZR7Jb+d2jnre0njd8hoov1dYLBFr6RjtphWeSdZCiptxNwIlV3e4WoWZlUSiybhVZMXe/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM3PPF99D0888FA.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 07:51:38 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 07:51:37 +0000
Message-ID: <3ad1dbce-5d10-4b8c-a2a4-04d0b9aab027@intel.com>
Date: Fri, 28 Mar 2025 13:21:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 02/29] drm/xe: Make xe_svm_alloc_vram public
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-3-himal.prasad.ghimiray@intel.com>
 <Z+XU+ZtuoXFEbLzH@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Z+XU+ZtuoXFEbLzH@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM3PPF99D0888FA:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a13004a-18c3-438d-71fa-08dd6dcd5e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2ZEWkhsMDc1UFlvSGFtbzBham5BRlZqYzdqejJGZlgxcDdYR204WUpLUmJJ?=
 =?utf-8?B?WDBaTVFITHBiQ2s5bTE0VmVqN3ZoYTZQci8wOXVHNFcwRmFsRllzL3NmNjR3?=
 =?utf-8?B?eTdTN21hVEZodmVjUTdwaFBlL0tNOGhuOVh5bStYbmw0Sk82L0hGc3dxSGM1?=
 =?utf-8?B?dXZybjV2YWMyZklXR1FHNVlEd2ZubWxVSDIvVzFQWmNuQzhmTi9seWtIZWRV?=
 =?utf-8?B?Y3dnZVN4bzhwYjFkeVViMTE5UjU5aGcvd0JRTS93d0ZVeStBaHZTOG1VVFVU?=
 =?utf-8?B?dHFaUDN5bUhMWnBQb0hRR0hvdzZDd3VjTUdJRG5DL0dPVW1lTDg1dzFmZG93?=
 =?utf-8?B?enA3ZklNYTJQTkwydW1qUDlaUmJqZTF3OVFoa1FlZ0x6SGhpalFzdGdkcGlC?=
 =?utf-8?B?M2djc0VYQmF4UWJhYW05UnlwYjJ4Z1NTUFc4dk5zMUtVc1lja0pxbWpGeDdN?=
 =?utf-8?B?b1duaHh2eDM2dHNXVDBJY21Uby9hY3FkVWFHR2w4ek8wSW8yT2NxMkdKcmZK?=
 =?utf-8?B?aHJ1QkdRdVV6MWFyVzJHQkZuZUZZMlhPb2dWMCtQS0hOYVRTWWYxb2V3TWI2?=
 =?utf-8?B?SHpqeUNEczc0VTcramFZZEtOQlYyaVJkbFV1NWQ5d2txNmpkUlhNa3pyUjdQ?=
 =?utf-8?B?b1JGeXRRdXlXdm5Zc1hoMEUxRHc0eE1KK1ZubEN5VHBRTE1QMjdMS3pkYzhh?=
 =?utf-8?B?UUZPZ01XVittTDhMZWlIZEtSQlVVdlNrbXVMaUVYdjQ1ZTJaWDFvZENwQmpU?=
 =?utf-8?B?NFdCUWlWRkFPVzRhUHZYNDIzRnA4YWNQb2QyZU9keVFhQ0FkaFRPVmpZVm40?=
 =?utf-8?B?U2xWeXFBVndYQU16b1NrMFVrK1c0STB5VmdHOTg1VEtibVdyZ2dFZnVxdjQw?=
 =?utf-8?B?MHd3cmJDUEIvL0VUeFp0Tjh5bll3dmpyalowanI0bytZZUZYS203b014M09I?=
 =?utf-8?B?MGxPQVRFamRzZSthUUJJd1RTUStZcG51bGxZb0hNREJUTkl4NVI3bDVUajN3?=
 =?utf-8?B?VmYzVndvSzJZSllQQm5wZjUrNDRMUHovWHZzQmVSeCtEMG5teHkzMS9DbUNF?=
 =?utf-8?B?WVFtekpyZmVrWkhnM3BBK29ZM0JLd2RLcHZSLytOYXdSSDhyNjdFWVZpMTFJ?=
 =?utf-8?B?cmZuRS9iWXpMby9nbVZXUjBxaC90OVJLMVdEWTRBU094NnhGVTQwL1pTM3cv?=
 =?utf-8?B?ckNWaFhMaG9aaHo4cmZtWm5Hd2duM3hsV25ueE5WYlBWSUxFNVZIUm1FNGZT?=
 =?utf-8?B?Q1o5RXNFVEx6bGlVcHVHeFhrTmlVNy9FUjRSZllHVldET0pIM2xvSWRIdWtz?=
 =?utf-8?B?M1lBRWxDNEptQWY0c2IydUZBMjVqNU5Fb213dlQ5U1V2UVFTVmdpU2xXdTQr?=
 =?utf-8?B?RVZQQ0pobzlROEx4SDdlK2ppSk9iVms0alU3VkUyMDR6MTQvdU9yVEYzem43?=
 =?utf-8?B?ZC9IUkcxTHVxTW9sOGNSZHArK3NGdDVIa0xxcUVxeUp0bTQ2RGJDRGU3UmpY?=
 =?utf-8?B?bGRKMWZ2VC9hR3ozTnBLbUxYV3BaNDFCM001SnhkOE9KM0dIWDIrdEJ0Sk9U?=
 =?utf-8?B?Ry9OcnR4eDUrWnRNMDI0T0VURE42WlBqMXBBUFp1TEZFN1IvQWxhcWFLYVZk?=
 =?utf-8?B?bHh0WUJndlVzMTduS1lLRkNTZi8zckdJYmJTRnYyNVovdmhwL0E1UjlhMmQz?=
 =?utf-8?B?SDJBQ1JaSGpKMWJwbGFNdGFzRU95WEFjQXc5UzVnc0gxSFhhenNNY1IrT2JG?=
 =?utf-8?B?dC8vZU01NFJTemZ5M0R3NkFVOXBqN3RROVF6VmJ3cjlESWlXL3pGNHFCS3Q0?=
 =?utf-8?B?cG5UQXZxa0k5b3k3dXUzTiszZEp0Y1hwc0NVNkZIa05iNllDcmRndnRKSGQv?=
 =?utf-8?Q?BjtK6KWhI2hb4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGdaMldVMUI5eit5UTNQM2dhTk9lTHNEVVNLdDhQdW5Vcml5dFplOTB6dmgr?=
 =?utf-8?B?c3h4L2RtOUlld2kxR1pCTCtPZFFiOTRvVlN6WHBJYlQvVi9IZEJTU0FhTVdO?=
 =?utf-8?B?VkNSa09sUW5pVUJrVXh1OFplSWdVMHNNa1JMeEZxMkNxLy9jYnJPWGI0WGZ5?=
 =?utf-8?B?M1F1NEd1WUdTODJpWERmMy9KVkpBSVN5VGVGejk4blZPaldKVXcycmFtUEtw?=
 =?utf-8?B?c0RUSnlMRFd2UlNTNmRXeHdIVVloS3hCQ1IwM2kyeUpZTVVXek53dm0yY1pa?=
 =?utf-8?B?OXU3SmxLdFJ5Z3hKRUZUaUdJOFZMYnpFNDBzdHQweWd0bzdYY0kvUmpaM1cy?=
 =?utf-8?B?L2hMOUcvem9NNjhKZmd0S3FsNjI3b293aTJSd1RKeHhrU2FVd0dRYWZXbTN6?=
 =?utf-8?B?dUJMRnVxa0hMUVBoQUNJNzBGaXY5dE9iSG9SSVovQ0dQTEo0RVN6NkdoTDNx?=
 =?utf-8?B?bGZyQVZ6eWJjNzBFeXlxNks3QXFVazJKbU96N2lKV2xBaEQ0NWNLWWtIZzBy?=
 =?utf-8?B?Q280VGZMMmFPYkU4VkZzT1RnTkVmb1pyRUVtQ09VMkpBZ0o0RXBWeVR5cS8r?=
 =?utf-8?B?K3R6enZKZFBoQTU0QVZESTNzUUZUbEtBWFZHUXZwU0lhM2FBUWgyNDdGYkV2?=
 =?utf-8?B?amRrZ2ZsekFUUWd1T1R6K3dnZ3hLZkpuc1ZVYTh4d3ZnZkc3ME9VZXVTVnZn?=
 =?utf-8?B?eHJFeUxsUC9NcjRmU0s2TkI3dUZXbkJ2aUJoNzFzZGVCNjF3WnVTN3BCaW1F?=
 =?utf-8?B?MHlDN3A4MDNFOVVwbnRsRTg3cHFtREdIOGdLV0R3MHRhK0RYSG8wTkp3aGpL?=
 =?utf-8?B?MjUzOUdPZEFRRFZrVXJlS2lVWVhoTDRNZU5Uc2Q3MDRvUTBQNEtMNjVoT0kr?=
 =?utf-8?B?RzlZTVRiZUpEeUluQkdmY3BVdFp2bHdVRC9wL1FUTktUdEJJNlQ5ZE54L0No?=
 =?utf-8?B?a1VlMDlKUG40QVl4ODh1Sm9lenRPRGMxNTNNMlF2NU13SUx2OHNTYWRqZ28z?=
 =?utf-8?B?Zi93cS9mQVR6OVIzZmpPOG1FU1VyL3c2dmVRZzF6a0pZRk9tdFZISDZPWnpn?=
 =?utf-8?B?NDJjYVVSRUFhcy9SSUxZdVFEa1lzdFZrcENON2lXdjErYXA0cmFZZU5PVUV1?=
 =?utf-8?B?RG9IYTVTZUp0elZxWStaZ2tvY2wxVXE4SlpvcmpHM25DWng2eVUwZkR5bVlF?=
 =?utf-8?B?UkpwcjVvR091blR2cjdGbFJjWHBrTWk5b25Gbnk4eS96WkFZQjFHeW1zS0Zj?=
 =?utf-8?B?NFhoWVNyRXprM3FIbzY4MmtzajY4Q29yZ0t2U1NaZ1NEaVVZUFZWcXN2Rkhm?=
 =?utf-8?B?T0hOQ1NiM2wzWDAwdndWTXd1N3hzNkN1ZEVPQ2NpTVlDWitEM0M1RzlCYVJ6?=
 =?utf-8?B?Vm9JeHhqZExkRzhBRXJ6OUp0NjBvTHZqRC9lQ1N4YVEwcWVMZzRrSURvWjI4?=
 =?utf-8?B?NFhvemdHU0Z5bjVJUE93NGhSaG9lZTNjSlRjRTFxeHZaTC9vcUxhZ0tQbGll?=
 =?utf-8?B?R29kTTFGZjk2dEUvZEp0VnJ5ZE02N1FNL0QyMnFGQTErNzQwdEtTa0JDc284?=
 =?utf-8?B?ekNvS0hpNlVkeUIyTjBKMmh6Ny9Fa2lyU08xZ2J4K0pxdU1tR09FQWxNanlx?=
 =?utf-8?B?em00TWhqTmo1bjNTbHpWOHBralU4bkxWSzlEQnR4SUtrSlAxKzhoUldYMElq?=
 =?utf-8?B?TXpEWUdmYklTSzhCR0tPblU2K1RjUWo1MGlqdjd0VG5Qd1BHUFBPSk9VM3BY?=
 =?utf-8?B?SFVjeEhFVXR5SGpVVnRnUUFscjBZMDdLdE12L3VpVWFLWTA3WnpLTUVVNzdR?=
 =?utf-8?B?MVpvTS9TRGVpWGxqdGhuN3F5b2tXc0JvOW9QL1FUV2F4elpwQzNYRVBqVHJq?=
 =?utf-8?B?dlJONnZoaU9MOFFBU3k0a0lSQ3UzaDloTXJXTStlZHhIYWJTKzllaGJIUXRN?=
 =?utf-8?B?VHA3eHRhbXhKaGZMS01iNnlETG9BMDJ6b2JWcGZDQkNrTDFDdjhua1NGYXlU?=
 =?utf-8?B?WEYzOStiVHA5dFlhd0FpZWRtNnpldW42TGl5a09xY3NyVy8vMzBQcXExQUts?=
 =?utf-8?B?TXd0anlkMHIzbnRneGxDbXhlTUFlQjBudFBacUxjTEt6dWZrTDExdWRhMXE5?=
 =?utf-8?B?T1JWSlhjMElISEpnMlBqVlVLTXlTQjRVRC9Oak1ReDdEeFJZN3lCQ0Fjbytz?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a13004a-18c3-438d-71fa-08dd6dcd5e68
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 07:51:37.9322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgWMs0lZU8LQ8znuZyZrvLfjJUdfoCcQP+I5p5sAzNiCuX3PZWePaXLkdfTHgG5FDdf06/goN8DHWz6q+dU6alK1iPVleJJ8ioXAn9TF0yA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF99D0888FA
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



On 28-03-2025 04:15, Matthew Brost wrote:
> On Fri, Mar 14, 2025 at 01:31:59PM +0530, Himal Prasad Ghimiray wrote:
>> This function will be used in prefetch too, hence make it public.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c |  6 +++---
>>   drivers/gpu/drm/xe/xe_svm.h | 13 +++++++++++++
>>   2 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 516898e99b26..2d2b385b691e 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -655,9 +655,9 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>>   	return &tile->mem.vram;
>>   }
>>   
>> -static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>> -			     struct xe_svm_range *range,
>> -			     const struct drm_gpusvm_ctx *ctx)
> 
> All public functions need kernel doc. Patch LGTM though.
> 
> Matt

Sure will add. Thanks

> 
>> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>> +		      struct xe_svm_range *range,
>> +		      const struct drm_gpusvm_ctx *ctx)
>>   {
>>   	struct mm_struct *mm = vm->svm.gpusvm.mm;
>>   	struct xe_vram_region *vr = tile_to_vr(tile);
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index e059590e5076..976059545173 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -72,6 +72,10 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
>>   int xe_svm_bo_evict(struct xe_bo *bo);
>>   
>>   void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
>> +
>> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>> +		      struct xe_svm_range *range,
>> +		      const struct drm_gpusvm_ctx *ctx);
>>   #else
>>   static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
>>   {
>> @@ -124,6 +128,15 @@ static inline
>>   void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
>>   {
>>   }
>> +
>> +static inline
>> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>> +		      struct xe_svm_range *range,
>> +		      const struct drm_gpusvm_ctx *ctx)
>> +{
>> +	return 0;
>> +}
>> +
>>   #endif
>>   
>>   /**
>> -- 
>> 2.34.1
>>

