Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903FCE7717F
	for <intel-xe@archiver.kernel.org>; Sat, 14 Dec 2024 01:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA4010E25D;
	Sat, 14 Dec 2024 01:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6pe1iYt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E1A10E25D
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Dec 2024 01:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734138546; x=1765674546;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a8Y6gYozlhe7RnpRgnTDrtPqRhxuSChpylpVxMYlBLs=;
 b=X6pe1iYty47aJowsot+OxfSOT/FhJIcPwEEI2CFFORu+qXSBLmxjKa06
 wF5qI08CdUjoZR8FQTe+xLHCdQGr3NrDD3rv4E3hesLx7LEkXKduUaLbq
 DLxnP4Tbw4QYjt54aAC7+yjvAgrVSPVF/FCTPnGjugjTUTz3IXfX6/Gqj
 UztG1+lO3aX6490l9rv554SoH1VATPA0Tnb+rj3QIeNpbkxDGVy/MTpQI
 QVyGs3PuSPtejUO8H8Xt0mMApPgOZX6Vb7hLR1T9Ti7ZwMTyjsUAOCRiG
 u0kekeUVC04Z67NW7Qow7WvPndGTyxCShRH2rj1nBlDhU6mCtSHFF18ND w==;
X-CSE-ConnectionGUID: s9d8aBw9SVSSLK5VXyoKsA==
X-CSE-MsgGUID: cBK+5cNMRxa0kKoKcunu3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34651419"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="34651419"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 17:09:05 -0800
X-CSE-ConnectionGUID: tva71qHPTjmkX5mEquCO8A==
X-CSE-MsgGUID: qOwl4NsGSnCYTOorgVPTgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="96569587"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 17:09:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 17:09:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 17:09:03 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 17:09:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQ4likQcMFefzAvqkNSy2deyJxVYBGWCCFGTAtM6tPtjA7/1gM3fZW8I6tBIImUBm6EVxx5if7+j7ec2azr3qow8o7uG6UK+Hj8zPFPks1p2m7OLh8O/rX4b9aFF1i8/sccNo4p0hquwNZxmJZfBWwxozaP8WupOOqljyqY38/1gmpgWWZNuxHBO2EYBGsG5czOoU8PsaWz5qFQh2YuzaCtQOSx2IJ95g5+gcCM6eiaJy+EAo7bp0OuNB77qehcwekWZ+bkIeOdSNmeAdmIl3IiGZdKjX8+VW1BcA/aIQetI7QIiK3+K2n5v8hJKVsePPBj87TiJ0pfVFtcJ1CH4gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgcayBeBRvpDCThtc783CUopty7wzaaLft8inRbB2Ys=;
 b=PzlszZMBjlJVGdjWbHztT+eUZzFc+s84messgc22/jb8ib+ufPkPU5QxeB4M2WOCH1kpczKqgZ8r5+oRZ5Mn1TPtXLd0kbenfc1LykD7ZIc3sPxyOaYWXVNFYe0W7+ota6LG9Pqig4pxul/c99dS7WsKP4FGTXOwEuldWu4vmvSbwu7HVq3u6CNP0CV7iRUjoEiEqsBXhADhTKQeWmXob/phu+2N7JJTXPSOAvvVrdi9jXoNnHIWIlcgDFK53qX5mJYSnZM0RI/DPidUDY0n4xd8JVqJq4jQ1WVnN0JV58P/BVFy5OB/0shH2Q92ldwAWRmRlGHr0FlMg94j+41uJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS0PR11MB7457.namprd11.prod.outlook.com (2603:10b6:8:140::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Sat, 14 Dec
 2024 01:09:01 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8251.008; Sat, 14 Dec 2024
 01:09:01 +0000
Message-ID: <6cb9733c-55dd-496d-881e-1572e1facc9d@intel.com>
Date: Fri, 13 Dec 2024 17:08:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Filipchuk, Julia" <julia.filipchuk@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
References: <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
 <7cd068ff3630f40e31cd4d971ad794986b017ab5.camel@intel.com>
 <26263eveox7cc3dqfqezodcunjamqgd7wrotzwmbci2o2ia42v@kkc3kpaizsef>
 <11116b4e7978ad7b5dc91d25c1d0232c809912c6.camel@intel.com>
 <w6zmdulew6aqkrkmjme7bdjp6jkllhswpazppd3t5gqnpysg4j@alphmd6gcxcr>
 <74c5a108-c5aa-49e3-b841-ff7ca838fae0@intel.com>
 <29a8ead7e28a72f7d9498d1701932836d7c14981.camel@intel.com>
 <1b38e47f-15a7-4267-8b3d-0ffa9219710e@intel.com>
 <ed2b683f31dbb98521336b6f79029fc3b3718a21.camel@intel.com>
 <b42313d5-d6bf-4457-9557-37e4e8e096be@intel.com>
 <5yhoe4sp5zesqsgtxqcbraopjw5l6nk5gmbr7njmgtzyr5lkxi@ujg7vhnomecm>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <5yhoe4sp5zesqsgtxqcbraopjw5l6nk5gmbr7njmgtzyr5lkxi@ujg7vhnomecm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0057.namprd04.prod.outlook.com
 (2603:10b6:303:6a::32) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS0PR11MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 05544eee-199f-4667-6165-08dd1bdbe4e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlhFeHgzZm5yUUx4MDMrWkgrb0ZSRExnZ1lxRThCSE1wRDh4eGNDVmpDWFJN?=
 =?utf-8?B?V3k3U1JGbVc1UzZDVFliTm5oeEdxci9jOGlrSFZORnBvZjhMQ2RjcHI3dkNK?=
 =?utf-8?B?NU9pS1RHSUNyVFBDdURuLytoQldkSXdrUEdTWmx5MnRoTit0bUJoSDlneDhh?=
 =?utf-8?B?eWJ3YWJLeE9TWUgrbyt0c1VrSUEyV3ozamdFdTFqdE90cWU3WnBSNkhBVHZJ?=
 =?utf-8?B?Y0tXZWh6WXRhQnIweHV3OHhZMnZaMEZjaFErbit3ZEQrNlNPdUVMelk1Vnhm?=
 =?utf-8?B?M29JYTJoRDBsWllhaUV5eXJiQzVGbDlqNURuWnJtOUh4clNmMWhGVWlWYlpR?=
 =?utf-8?B?aXBGdjBzNEdQME15bjBuQTIvTXZOTTJUWTJMcm1HeHByQ2lXc1c2K3lhTXlk?=
 =?utf-8?B?ZmtXdmpkMGZJUlVOR2ptaHQ4S1dLRnNZY3g0VU5MMDliVGVIK292RTcwaksv?=
 =?utf-8?B?NXZHbFRnckcrUUROOU0wM2VQSk9FSHo5aE11ZjcwUHVJOFFzZGVsd1ZFUGtx?=
 =?utf-8?B?QXNCZnVlZEN4MHoweUNWdzljNG5oZ2VSNy9CYTBsTTJFK2R1WWt1cXpKRVVC?=
 =?utf-8?B?eTUvaStDWXIvZUlXSnRRUnFsR3BpdGRydmxNeHVtVDFXZVluL1lHYzdFOGEw?=
 =?utf-8?B?WHhCVzdTVytTMklJTVE1RS9EU1hFRFgra2oxRE1qTkFadjBYSjJISXpsM3FB?=
 =?utf-8?B?VmZtTGtGV3RlOWh5WE5Pem5mSnh5T3IweHc4b0dXdDFDNHNvc2V0MWRKMG5R?=
 =?utf-8?B?ckhjVG5oNWdaMXA2cmdVZ2MzaDNtNXN2WWt2d1duNkU0MnRaNGJIWGMwcEdJ?=
 =?utf-8?B?R1JkaEFXY1MxOVhzZWc2anJtYUJZTjZib1dGbm9ZbVQyaVNOSElWb3NqYngy?=
 =?utf-8?B?SS8vTlo3ZERjN25WNjZnRkc4cXlzTnppN3NKMUY4TjYrWDlpSDBQQUJ3MVhK?=
 =?utf-8?B?UFNWd0JGOE5hY3loQituR3dON3J3L3VxUHdxNnlBUklvVFJjTmFPSkR4YU1Y?=
 =?utf-8?B?SGE4Lzg0VXlhV2RyVHJwVXlHbnV4QVhtZmRHMndoZVhlNXFMbzRPVDh6dWpC?=
 =?utf-8?B?K1IvM2ExQ1A5K3RzcStNbEllOEFzYldVZ3pURTZBNUhOOVoxK2R3dWR6UlRE?=
 =?utf-8?B?eVYzdk5NTUdTWnlSblFOcDg2VzIvcy9sM1E3c2R1aThPSExmdERKdXFtNmZN?=
 =?utf-8?B?b2lGMDZzbnlpZmNoREdSMEZSWHI4SjJsVUZ4WnlOVDRPUmFiVDFrUUxnV1pn?=
 =?utf-8?B?S2NxOWpMK29pMndhUXBTZ25CMktZL1hiMjNnK3g3WVZjWlZxczdUREtCRUoz?=
 =?utf-8?B?OTFXaXBkT1VkYVgwTjdCVzFRRXFORkpRNnRpdXZTUUF0UHZibHE2ZktycUV0?=
 =?utf-8?B?bjE5dStxYWM0Szc1QlVtOWlkdzVKZHJ4TmdFVTFNZURRRnc1RnJlUHpNVCtK?=
 =?utf-8?B?R1QxMTZTQVIzNG05Mm9VOGIrWlNMZjlpUStETlJlbVNFVUllQjdsbXV5SmR0?=
 =?utf-8?B?T1JlMXllZ096Tmd3eEU4bGlUV09JM0xQc0pKZVh4ZFR3ZFlXZFYxVFE4TlNw?=
 =?utf-8?B?OVVrU3NMM08wT0NjbTJZblpFSXZaS2UxVm8zZmk2YnNzUlRBYnhJNktqcVlJ?=
 =?utf-8?B?Sm40dFNBWSt3NExQYnlKd2FVSVNjZHNLTEM0RWZhdkRQUGx5RnJUOFZEVHkw?=
 =?utf-8?B?UldZaEhoWHJ4N1BJbE5qL3g0ODY2MnlRbDB2WVlqRHdTUGZjakw3dG52VkFX?=
 =?utf-8?B?VTlFbzdHWjAvSmN1S0ltZ3RpNXhlaEl2U1c1MndZeHBCR1Ntd3hoTXdPc09o?=
 =?utf-8?Q?2cmqV5JALlmeDmQ9izHun9j1rGxdQ6IXOf0lE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzdibFI4TVJDSk1aTVMzS2FKWXBNOE9zaUw2ZnM5Y05IY0xtaTBBWVJ5bkhW?=
 =?utf-8?B?ZjhjK3dEN0RQWk5KekdSR1o1bjlaSStMSytPWGF2YU02b3hMNFdXcnNZbStr?=
 =?utf-8?B?UHhWMjlEOUlhdndjTnNkTXYrTmJyTTJjS0hHVCtralIzRFdzejF1M2puZFZV?=
 =?utf-8?B?Vi96RnJsdVJrUnN1WjFVdDBXTXdsbFUra2hlZ0RubmV4N0N0RktPbWplUjl2?=
 =?utf-8?B?L2srRklTT2tUZGVrQWVKV2k1N3Y2a0YwZ1JrQ055YSs5SEllMzV1TFZGZXQr?=
 =?utf-8?B?RmpLNDZjdVEvMSt0TVI0djEzWm5qWGZlTThxM0RsODBoVWlVUW5zYVBkSjZk?=
 =?utf-8?B?a3VLU3Q5MmtQMGtDZHhhNW1pR0c0dTdxM2ZNd29LZ2JJZmRwUDJzQW1YcnlK?=
 =?utf-8?B?anJGQW82Q1ZGMG9lVWlLbHpyR2Z6dmYzN2hPTGtDTFYvTG1uODZJNktNdUhl?=
 =?utf-8?B?L3Q1QnhSOEJxeFJ1RVBQL3kwTmE5b3Q4eGtlWDR2L3pUenZkaVh0T0xmTU1H?=
 =?utf-8?B?U1JnSlJ2dHpQVHAwcHZXSzZldSsvd2xFRnZUSlJzTWZkd3NEUFRNWXpKbnFr?=
 =?utf-8?B?SWhOekYxOHhvcXJTSmZOVlN6V2t4RnpHZHNEQ3h0dDRIZWFSZjFjVU05dk1B?=
 =?utf-8?B?bEYrOXBJa29ld2xuSlFqS2VDelVicitnbUtuMVdhblpQcWJZdkp2bWg1K250?=
 =?utf-8?B?RkVoTDJoYkZjSnViMEpuM21lTGxMR0REV1h2Q3FPalpkeGNoZ3hOdlM5aDNh?=
 =?utf-8?B?dlZVRTd0bHF1VFJpb2N0MnpFRU5uOGJuYVpaT2l5dFlRM3E2eXBENEFYQUdR?=
 =?utf-8?B?ODhheTFnWURyNmowRW5jcnFKcUFETHhMOUJoYnZ5Unc4S2hZc05BcjJkeGty?=
 =?utf-8?B?SjU2cEwrUEtOM2xDemw3VWRnUFUzUkZJS0lSNFl5VkdjU0szcDFxMnF2QUxu?=
 =?utf-8?B?NDlBcG8zYlh6K0ZpanI1bFdXMURSU1crRDFhMGxiYUhOOWRQK0JVR3ErZDdZ?=
 =?utf-8?B?dDVzbHpIWGhVTGp1V2diMFNDNG96dCtOOHVmZktkUSs4eVZIVG1ZUlVBdW5q?=
 =?utf-8?B?VkRWZlZRWXlVSXJLdW50S3ROMXBOc1poTU5yei80a3ZXUGQ4M1BIWGg2dFRp?=
 =?utf-8?B?Zy9qZjJsNUdrU3VZdEgxRG9Kc1Q2Y0Zab0dKOVcxRDlBLytiL0d2OCtqcXRP?=
 =?utf-8?B?dHY3SjIzenJnaCs0TzE4aWZQdVRxZzZCVFpKemM3QUdVWS9LYmpidDNZQmtx?=
 =?utf-8?B?YnB2eTEwTG5XTWtwQWNxVHIxaS9OT3lsN20wTE1SV2wyaXprTjY5ZDhZc1ND?=
 =?utf-8?B?T0lTaVNOZGZnWFUvakU0WlVMNklvdG9ac0NMZ2xVWG1mdjlNNjBUVHZQMXRI?=
 =?utf-8?B?ekk1emFSRlJ0bEdnSk5mbFFESW9lV0MxaVoxRjRnS0NPTTdaRW8zK2h2MUV3?=
 =?utf-8?B?SGVjdlR4SHJkUlZ0MWJNWTcxdys2U2IyMmxZNmhnSlU3U3JKS0ZtZ2dvYkgr?=
 =?utf-8?B?TDAzWDU1MGRCa1IzNGdaOUxtRHFRcHhFRzVIbTE3UE5iY3E3ZGRoVXc4aHkx?=
 =?utf-8?B?OTFGUEwraGg0WFBmWUl5enBVVFBZYWZzTUh5KzVpS1EzR0dDSmFRQjdhVm15?=
 =?utf-8?B?V3ZpMkpjUEJNRVFwYkRMWkRYWHA0RnZQOWlOL0pvNjM5akxwVENVbi8zTzZU?=
 =?utf-8?B?WGRJZUxoRzNwZWYwZytLYklrZXZ5UXRXNGhqcU1wOGZMVW8zbDM0ZjZEeEtt?=
 =?utf-8?B?eERMajAzVzZFVStJNHJOaXc2MkxvT3AyRndidUhsdVIrbk9GNkRFZE42L3Qz?=
 =?utf-8?B?bHZDUEVoSlVrL2k5R1dnYnd3QTZLbElaVG9HWUlRZTlqY09STU4xTi8rZ0hF?=
 =?utf-8?B?OUd0UjJxcWZhMmkzc3RHUG5Idjdzby9FOXJjUUtyTmpmeWJsdWRBNjFhOEpN?=
 =?utf-8?B?TllQd28vNERXY2dKaHI4T1VvNkVPbGtpR2ZpeU50ZmFlVTZEN1A1TkN3NkU0?=
 =?utf-8?B?YS85NThVU2pMSytPQUhwY0k0QzlFNkR0LzVOWlNIWWZsRHVEc3hab2xDQXN6?=
 =?utf-8?B?MWUvVVJNNncrYU5vVWN5NitqK1dGMWJqNUg5c1VXSE9pU1g3OW8waHNkeUZW?=
 =?utf-8?B?ay9hM2JmaExCYk9lM2poOHEwZkJJZk1pYWJkWnlkYk45enFQSmwzSW1iSGNY?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05544eee-199f-4667-6165-08dd1bdbe4e0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2024 01:09:01.0390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLfpTF9rJVDIWmtz2f2wFDXD+JZ+FUZYJb526PstiMkUtETHGDa+rGJ9zKHVhkpyQ14NgUIhUUMfUqah5nhdS3rcjpC2ipM0g5gXX8iJiqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7457
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

On 12/13/2024 13:39, Lucas De Marchi wrote:
> On Fri, Dec 13, 2024 at 12:26:23PM -0800, John Harrison wrote:
>> On 12/13/2024 11:43, Souza, Jose wrote:
>>> On Fri, 2024-12-13 at 09:38 -0800, John Harrison wrote:
>>>> On 12/13/2024 09:25, Souza, Jose wrote:
>>>>> On Fri, 2024-12-13 at 08:56 -0800, John Harrison wrote:
>>>>>> On 12/13/2024 08:48, Lucas De Marchi wrote:
>>>>>>> On Fri, Dec 13, 2024 at 04:28:58PM +0000, Jose Souza wrote:
>>>>>>>> On Fri, 2024-12-13 at 09:50 -0600, Lucas De Marchi wrote:
>>>>>>>>> On Fri, Dec 13, 2024 at 03:24:59PM +0000, Jose Souza wrote:
>>>>>>>>>> On Fri, 2024-12-13 at 07:10 -0800, José Roberto de Souza wrote:
>>>>>>>>>>> On Fri, 2024-12-13 at 08:38 -0600, Lucas De Marchi wrote:
>>>>>>>>>>>> On Fri, Dec 13, 2024 at 09:12:52AM -0500, Rodrigo Vivi wrote:
>>>>>>>>>>>>> We do not break userspace.
>>>>>>>>>>> There is other patch that also breaks Mesa parser:
>>>>>>>>>>>
>>>>>>>>>>> drm/xe/devcoredump: Improve section headings and add tile info
>>>>>>>>>>>
>>>>>>>>>>>>> This reverts commit ec1455ce7e35a31289d2dbc1070b980538698921.
>>>>>>>>>>>> But we have users calling this function.... the revert is not
>>>>>>>>> so simple.
>>>>>>>>>>>> I think we need to revert the functionality rather than
>>>>>>>>> reverting all
>>>>>>>>>>>> the patches, otherwise it will cause a lot of headaches.
>>>>>>>>>>>>
>>>>>>>>>>>> I propose we go with:
>>>>>>>>>>>>
>>>>>>>>>>>> a) drop the \n that broke mesa and merge that with cc stable.
>>>>>>>>>>>>
>>>>>>>>>>>> b) move back the entry to the previous section that broke mesa
>>>>>>>>> and cc
>>>>>>>>>>>>       stable.
>>>>>>>>>>>>
>>>>>>>>>>>>       José, would it be ok to merge a patch in mesa and 
>>>>>>>>>>>> port that
>>>>>>>>>>>>       to mesa stable that simply looks at 2 possible sections?
>>>>>>>>> Or even
>>>>>>>>>>>>       drop the section checks... ?
>>>>>>>>>> But if Xe KMD is reverting the patch that changed the hwctx
>>>>>>>>> section why would Mesa need to also parse the new(future to be
>>>>>>>>> reverted) section?
>>>>>>>>>
>>>>>>>>> first is to undo the damage, with 0 changes in mesa. We do that
>>>>>>>>> first and
>>>>>>>>> *then* we agree on what's possible to do to accomodate the 2 
>>>>>>>>> parsers we
>>>>>>>>> have.
>>>>>>>>>
>>>>>>>>> If we can get something in mesa to work that is backward 
>>>>>>>>> compatible
>>>>>>>>> (i.e. the
>>>>>>>>> changed parser is able to parse both before and after the kernel
>>>>>>>>> change),
>>>>>>>>> then it could be considered to a mesa stable and the kernel side
>>>>>>>>> changed.
>>>>>>>> Okay, reasonable plan. But the ascii85 encoder with \n will not be
>>>>>>>> brought back right?
>>>>>>> maybe let's agree on how to possibly bring it back? I suggested 
>>>>>>> using a
>>>>>>> space as continuation line char. This way you can just check the 
>>>>>>> last
>>>>>>> char
>>>>>>> returned by getline() you are calling and see if you can go 
>>>>>>> ahead and
>>>>>>> proceed or if you still need to get more data. Neither space nor 
>>>>>>> newline
>>>>>>> are part of the ascii85 character set, so it's safe and you can 
>>>>>>> handle
>>>>>>> continuation in one place in your loop.
>>>>>>>
>>>>>>> if you are just ignoring any ascii85, then I believe it's even 
>>>>>>> simpler:
>>>>>>> you check sections and keys with a space since both keys and 
>>>>>>> section
>>>>>>> titles contain space, which is not part of the ascii85 char set.
>>>>>>>
>>>>>>> Lucas De Marchi
>>>>>> Yes, I would strongly prefer to use line wrapped ASCII85 data for 
>>>>>> all
>>>>>> blobs in the devcoredump. Including things like batch buffers and 
>>>>>> other
>>>>>> VM entries that the mesa tool is presumably wanting to decode.
>>>>>>
>>>>>> If adding a <space> character to the end of each line is an 
>>>>>> acceptable
>>>>>> fix then I have no problems with that. But not line wrapping at all
>>>>>> means having to carry that change as a non-upstream patch in 
>>>>>> either the
>>>>>> internal tree or in individual developer's local trees. Either 
>>>>>> that or
>>>>>> we just cannot debug a lot of hard to repro problems.
>>>>> Can't Xe KMD use the line wrapped version of ASCII85 when printing 
>>>>> to dmesg and keep the regular encoder when devcoredump file is read?
>>>> Apparently not. Even when not deliberately line wrapping the output, I
>>>> am still seeing it being wrapped when dumping very large buffers 
>>>> such as
>>>> the GuC log. It looks like something in a lower layer is also forcing
>>>> line wrapping of super long lines. So either we can't add full size 
>>>> GuC
>>>> logs to the devcoredump or we need to support line wrapped data in the
>>>> mesa tool.
>>> It is probably some implementation detail of 
>>> __drm_printfn_coredump(). That could be replaced to something like 
>>> i915 error dump write functions to not
>
> it doesn't look like it as there's nothing there looping through chunks.
> And particularly nothing that would really add a '\n', corrupting
> the output.
>
>>> have any limit at least when the target is a file descriptor, for 
>>> dmesg you are free to add any line wrapping.
>> Rather than re-writing the entire drm printer infrastructure, could 
>> we not just update the mesa decoder tool?
>
> I think it would be great to add line continuation there and document
> so it's more future proof and we don't break it again because of this.
>
>>
>> Note that the existing VM dumps are using the same drm_puts printer 
>
> would be good to know where that is coming from. I don't see anything in
> drm_puts() that would add newlines.... it looks more like how we are
> calling xe_print_blob_ascii85() in a loop, but that's strange since we
Doh! Yes. The GuC log splits the log data into 2MB chunks to avoid the 
kmalloc size limit (of 8MB IIRC). Which means it would either have to 
dump each chunk as a separately tagged devcoredump field/data pair or 
the final linefeed would have to be added manually by the caller and not 
automatically by the helper. Neither option is particular nice.

> are actually passing 2M chunks. What did you use to test?
I've been mostly using igt@xe_exec_reset@cat-error with a modified IGT 
to save out each coredump rather than splatting it. We don't actually 
have any devcoredump tests at the moment. Zhanjun has been writing one. 
Apparently Maarten Lankhorst had also started writing one but it never 
got anywhere?

It would be useful to also add the mesa decoder tool itself as test for 
CI too. Otherwise it may still be making assumptions that we do not 
realise and are not testing for in an IGT. E.g. the thing about section 
headers.

John.

>
> Lucas De Marchi
>
>> function. So if a very large user buffer was included in the dump, it 
>> seems like that would also break the mesa parser. And that is not 
>> something under the control of the KMD.
>>
>> John.
>>
>>>
>>>> John.
>>>>
>>>>>> John.
>>>>>>
>>

